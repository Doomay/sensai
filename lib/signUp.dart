class SignUp {
  SignUp({
    required this.student_id,
    required this.name,
    required this.email,
    required this.password,
    required this.age,
    required this.weight,
    required this.height,
    required this.gender,
    required this.activity_level,
    required this.created_on,
  });
  late final int student_id;
  late final String name;
  late final String email;
  late final String password;
  late final int age;
  late final double weight;
  late final int height;
  late final String gender;
  late final String activity_level;
  late final String created_on;

  SignUp.fromJson(Map<String, dynamic> json) {
    student_id = json['student_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    age = json['age'];
    weight = json['weight'];
    height = json['height'];
    gender = json['gender'];
    activity_level = json['activity_level'];
    created_on = json['created_on'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['student_id'] = student_id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['age'] = age;
    data['weight'] = weight;
    data['height'] = height;
    data['gender'] = gender;
    data['activityLevel'] = activity_level;
    data['created_on'] = created_on;
    return data;
  }
}
