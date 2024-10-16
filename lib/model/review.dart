class Review {
  int? id;
  int? rating;
  String? review;

  Review({this.rating, this.review, this.id});

  // Constructor to create a Review object from a JSON object
  Review.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    review = json['review'];
    id = json['id'];
  }

  // Factory constructor to handle null cases more gracefully
  factory Review.fromMap(Map<String, dynamic>? data) {
    if (data == null) {
      throw ArgumentError('The provided data is null and cannot be converted to a Review.');
    }
    return Review(
      rating: data['rating'],
      review: data['review'],
      id: data['id'],
    );
  }

  // Convert Review object to a JSON object
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rating'] = rating;
    data['review'] = review;
    data['id'] = id;

    return data;
  }
}
