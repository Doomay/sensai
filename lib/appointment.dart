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

  int bookingId;
  int studentId;
  int trainerId;
  String bookDate;
  String bookTime;
  String location;
  String paymentMode;
  int amountPaid;
  String paymentStatus;
  String createdOn;
  String name;
  int rating;

  Appointment.fromJson(Map<String, dynamic> json)
      : bookingId = json['booking_id'] ?? 0,
        studentId = json['student_id'] ?? 0,
        trainerId = json['trainer_id'] ?? 0,
        bookDate = json['book_date'] ?? '',
        bookTime = json['book_time'] ?? '',
        location = json['location'] ?? '',
        paymentMode = json['payment_mode'] ?? '',
        amountPaid = json['amount_paid'] ?? 0,
        paymentStatus = json['payment_status'] ?? '',
        createdOn = json['created_on'] ?? '',
        name = json['name'] ?? '',
        rating = json['rating'] ?? 0;

  factory Appointment.fromMap(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Data cannot be null');
    }
    return Appointment(
      bookingId: json['booking_id'] ?? 0,
      studentId: json['student_id'] ?? 0,
      trainerId: json['trainer_id'] ?? 0,
      bookDate: json['book_date'] ?? '',
      bookTime: json['book_time'] ?? '',
      location: json['location'] ?? '',
      paymentMode: json['payment_mode'] ?? '',
      amountPaid: json['amount_paid'] ?? 0,
      paymentStatus: json['payment_status'] ?? '',
      createdOn: json['created_on'] ?? '',
      name: json['name'] ?? '',
      rating: json['rating'] ?? 0,
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
