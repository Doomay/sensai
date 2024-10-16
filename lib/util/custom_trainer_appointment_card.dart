import 'package:flutter/material.dart';
import '../util/size_config.dart';

class CustomTrainerAppointmentCard extends StatelessWidget {
  final String? name;
  final String? rating;
  final String? trainingType;
  final int? experience;
  final String? image;
  final String? charge;
  final Function()? onPress;

  const CustomTrainerAppointmentCard({
    super.key,
    this.onPress,
    this.name,
    this.rating,
    this.trainingType,
    this.experience,
    this.image,
    this.charge,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          height: getProportionateScreenHeightByPercent(0.15),
          width: double.infinity - 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF222831)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.grey),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      image!,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          name!,
                                          style: const TextStyle(
                                            fontFamily: 'kanit',
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.limeAccent),
                                          child: Text(
                                            rating!,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      trainingType!,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  experience.toString() == "1"
                                      ? "${experience.toString()} Year Experience"
                                      : "${experience.toString()} Years Experience",
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    color: Colors.limeAccent,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "$charge€/hour",
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    color: Colors.limeAccent,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(
                Icons.keyboard_arrow_right_rounded,
                color: Colors.white,
                size: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
