class Trainer {
  int? trainerId;
  String? name;
  String? email;
  String? password;
  int? age;
  int? height;
  int? weight;
  String? gender;
  String? type;
  int? amount;
  int? experience;
  int? completedTrainings;
  int? activeClients;
  double? overallRating;
  String? createdOn;
  String? imagePath;

  Trainer({
    this.trainerId,
    this.name,
    this.email,
    this.password,
    this.age,
    this.height,
    this.weight,
    this.gender,
    this.type,
    this.amount,
    this.experience,
    this.completedTrainings,
    this.activeClients,
    this.overallRating,
    this.imagePath,
    this.createdOn,
  });

  // Constructor to create a Trainer object from a JSON object
  Trainer.fromJson(Map<String, dynamic> json) {
    trainerId = json['trainer_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    age = json['age'];
    height = json['height'];
    weight = json['weight'];
    gender = json['gender'];
    type = json['type'];
    amount = json['amount'];
    experience = json['experience'];
    completedTrainings = json['completed_trainings'];
    activeClients = json['active_clients'];
    overallRating = json['overall_rating'];
    createdOn = json['created_on'];
    imagePath = json['image_path'];
  }

  // Factory constructor to handle null cases more gracefully
  factory Trainer.fromMap(Map<String, dynamic>? data) {
    if (data == null) {
      throw ArgumentError('The provided data is null and cannot be converted to a Trainer.');
    }
    return Trainer(
      trainerId: data['trainer_id'],
      name: data['name'],
      email: data['email'],
      password: data['password'],
      age: data['age'],
      height: data['height'],
      weight: data['weight'],
      gender: data['gender'],
      type: data['type'],
      amount: data['amount'],
      experience: data['experience'],
      completedTrainings: data['completed_trainings'],
      activeClients: data['active_clients'],
      overallRating: data['overall_rating'],
      createdOn: data['created_on'],
      imagePath: data['image_path'],
    );
  }

  // Convert Trainer object to a JSON object
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['trainer_id'] = trainerId;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['age'] = age;
    data['height'] = height;
    data['weight'] = weight;
    data['gender'] = gender;
    data['type'] = type;
    data['amount'] = amount;
    data['experience'] = experience;
    data['completed_trainings'] = completedTrainings;
    data['active_clients'] = activeClients;
    data['overall_rating'] = overallRating;
    data['created_on'] = createdOn;
    data['image_path'] = imagePath;
    return data;
  }
}
