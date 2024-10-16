import 'package:flutter/material.dart';
import '../util/size_config.dart';

class CustomReviewCard extends StatelessWidget {
  final String? name;
  final int? rating;
  final String? image;
  final String? reviewedOn;
  final String? reviewComment;
  final Function()? onPress;

  const CustomReviewCard({
    super.key,
    this.onPress,
    this.name,
    this.rating,
    this.image,
    this.reviewedOn,
    this.reviewComment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          height: getProportionateScreenHeightByPercent(0.3),
          width: double.infinity - 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF222831)),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(image!),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          name!,
                          style: const TextStyle(
                            fontFamily: 'kanit',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 40,
                          height: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.limeAccent),
                          child: Text(
                            "${rating!}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'kanit',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        reviewedOn!,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  reviewComment!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
