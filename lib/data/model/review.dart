class Review {
  int? id;
  int? rating;
  String? review;

  Review({this.rating, this.review, this.id});

  Review.fromJson(Map<String, dynamic> json)
      : rating = json['rating'] as int?,
        review = json['review'] as String?,
        id = json['id'] as int?;

  factory Review.fromMap(Map<String, dynamic>? data) {
    if (data == null) {
      throw ArgumentError('Data cannot be null');
    }
    return Review(
      rating: data['rating'] as int?,
      review: data['review'] as String?,
      id: data['id'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (rating != null) data['rating'] = rating;
    if (review != null) data['review'] = review;
    if (id != null) data['id'] = id;
    return data;
  }
}
