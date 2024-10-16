import 'package:flutter/material.dart';
import '../util/size_config.dart';

class CustomScheduleCard extends StatelessWidget {
  final String? date;
  final String? time;
  final String? place;
  final String? name;
  final int? rating;
  final String? trainingType;
  final int? experience;
  final Function()? onPress;

  const CustomScheduleCard(
      {super.key,
      this.date,
      this.time,
      this.onPress,
      this.place,
      this.name,
      this.rating,
      this.trainingType,
      this.experience});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 20),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          height: getProportionateScreenHeightByPercent(0.15),
          width: double.infinity - 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF222831)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: 90,
                                        height: 20,
                                        child: Text(
                                          date!,
                                          textAlign: TextAlign.end,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'kanit',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 90,
                                        height: 30,
                                        child: Text(
                                          time!,
                                          textAlign: TextAlign.end,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'kanit',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    Text(
                                      place!,
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.white,
                                      size: 20,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
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
                                            "${rating!}",
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
                                  height: 30,
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
                              ],
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
      ),
    );
  }
}
