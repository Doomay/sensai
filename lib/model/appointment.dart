class Appointment {
  Appointment({
    required this.bookingId,
    required this.studentId,
    required this.trainerId,
    required this.bookDate,
    required this.bookTime,
    required this.location,
    required this.paymentMode,
    required this.amountPaid,
    required this.paymentStatus,
    required this.createdOn,
    required this.name,
    required this.rating,
  });

  late final int bookingId;
  late final int studentId;
  late final int trainerId;
  late final String bookDate;
  late final String bookTime;
  late final String location;
  late final String paymentMode;
  late final int amountPaid;
  late final String paymentStatus;
  late final String createdOn;
  late final String name;
  late final int rating;


  Appointment.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    studentId = json['student_id'];
    trainerId = json['trainer_id'];
    bookDate = json['book_date'];
    bookTime = json['book_time'];
    location = json['location'];
    paymentMode = json['payment_mode'];
    amountPaid = json['amount_paid'];
    paymentStatus = json['payment_status'];
    createdOn = json['created_on'];
    name = json['name'];
    rating = json['rating'];
  }

  factory Appointment.fromMap(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('The provided JSON is null and cannot be converted to an Appointment.');
    }
    return Appointment(
      bookingId: json['booking_id'],
      studentId: json['student_id'],
      trainerId: json['trainer_id'],
      bookDate: json['book_date'],
      bookTime: json['book_time'],
      location: json['location'],
      paymentMode: json['payment_mode'],
      amountPaid: json['amount_paid'],
      paymentStatus: json['payment_status'],
      createdOn: json['created_on'],
      name: json['name'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['booking_id'] = bookingId;
    data['student_id'] = studentId;
    data['trainer_id'] = trainerId;
    data['book_date'] = bookDate;
    data['book_time'] = bookTime;
    data['location'] = location;
    data['payment_mode'] = paymentMode;
    data['amount_paid'] = amountPaid;
    data['payment_status'] = paymentStatus;
    data['created_on'] = createdOn;
    data['name'] = name;
    data['rating'] = rating;
    return data;
  }
}
