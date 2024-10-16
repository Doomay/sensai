class Entry {
  final icon;
  final title; 
  bool? isActive;
  bool offNamed;
  final action;
  final navigateTo;

  Entry(
      {this.icon,
      this.title,
      this.isActive = false,
      this.action,
      this.navigateTo,
      this.offNamed = false});
}
