// Flutter imports:
import 'package:flutter/material.dart';

//loading indicator code is a modified and simplified version of this code
//https://github.com/fayaz07/ots

final _tKey = GlobalKey(debugLabel: 'overlay_parent');
final _modalBarrierDefaultColor = Colors.black.withOpacity(0.7);

/// Updates with the latest [OverlayEntry] child
late OverlayEntry _loaderEntry;

/// is dark theme
bool isDarkTheme = false;

/// To keep track if the [Overlay] is shown
bool _loaderShown = false;

Widget? _loadingIndicator;

class Loading extends StatelessWidget {
  final Widget? child;
  final Widget? loader;
  final bool darkTheme;

  const Loading({super.key, this.child, this.loader, this.darkTheme = false});

  @override
  Widget build(BuildContext context) {
    _loadingIndicator = loader;
    isDarkTheme = darkTheme;
    return SizedBox(
      key: _tKey,
      child: child,
    );
  }
}

OverlayState? get _overlayState {
  final context = _tKey.currentContext;
  if (context == null) return null;

  NavigatorState? navigator;
  void visitor(Element element) {
    if (navigator != null) return;

    if (element.widget is Navigator) {
      navigator = (element as StatefulElement).state as NavigatorState?;
    } else {
      element.visitChildElements(visitor);
    }
  }

  context.visitChildElements(visitor);

  assert(navigator != null, '''unable to show overlay''');
  return navigator!.overlay;
}

/// To handle a loader for the application
Future<void> showLoadingIndicator(
    {bool isModal = true, Color? modalColor}) async {
  try {
    debugPrint('Showing loading overlay');
    final child = Center(
      child: SizedBox(
        width: 30,
        height: 30,
        child: _loadingIndicator ?? const CircularProgressIndicator(),
      ),
    );
    await _showOverlay(
      child: isModal
          ? Stack(
              children: <Widget>[
                ModalBarrier(
                  color: modalColor ?? _modalBarrierDefaultColor,
                ),
                child
              ],
            )
          : child,
    );
  } catch (err) {
    debugPrint('Exception showing loading overlay\n${err.toString()}');
    rethrow;
  }
}

Future<void> hideLoadingIndicator() async {
  try {
    debugPrint('Hiding loading overlay');
    await _hideOverlay();
  } catch (err) {
    debugPrint('Exception hiding loading overlay');
    rethrow;
  }
}

///----------------------------------------------------------------------------
/// These methods deal with showing and hiding the overlay
Future<void> _showOverlay({required Widget child}) async {
  try {
    final overlay = _overlayState;

    if (_loaderShown) {
      debugPrint('An overlay is already showing');
      return Future.value(false);
    }

    final overlayEntry = OverlayEntry(
      builder: (context) => child,
    );

    overlay!.insert(overlayEntry);
    _loaderEntry = overlayEntry;
    _loaderShown = true;
  } catch (err) {
    debugPrint('Exception inserting loading overlay\n${err.toString()}');
    rethrow;
  }
}

Future<void> _hideOverlay() async {
  try {
    _loaderEntry.remove();
    _loaderShown = false;
  } catch (err) {
    debugPrint('Exception removing loading overlay\n${err.toString()}');
    rethrow;
  }
}
