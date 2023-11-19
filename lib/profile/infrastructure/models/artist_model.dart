import 'package:peru_stars_mobile/profile/domain/entities/Artist.dart';

class ArtistModel extends Artist{
  ArtistModel(

      { required int Id,
        required int userId,
        required int age,
        required String brandName,
        required String description,
        required String phrase,
        required int contactNumber,
        required String contactEmail,
        required String genre,
        required List<String> socialMediaLink}) : super(Id:Id,userId: userId, age: age, brandName: brandName, description: description, phrase: phrase, contactNumber: contactNumber, contactEmail: contactEmail, genre: genre, socialMediaLink: socialMediaLink);
  factory ArtistModel.fromJson(Map<String, dynamic> json) {
    return ArtistModel(
      Id: json["artistId"],
      userId:json["user"]["userId"],
      age:json["age"],
      brandName: json["brandName"],
      description: json["description"],
      phrase: json["phrase"],
      contactNumber: json["contactNumber"],
      contactEmail:json["contactEmail"],
      genre: json["genre"],
      socialMediaLink: []
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId":userId,
      "age":age,
      "brandName":brandName,
      "description":description,
      "phrase":phrase,
      "contactNumber":contactNumber,
      "contactEmail":contactEmail,
      "genre":genre,
      "socialMediaLink":socialMediaLink
    };
  }
}