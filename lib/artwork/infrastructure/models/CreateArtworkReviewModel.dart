import 'dart:ffi';

class CreateArtworkReviewModel{
  final int hobbyistId;
  final int artworkId;
  final String title;
  final String comment;
  final Float calification;

  int getHobbyistId(){return hobbyistId;}
  int getArtworkId(){return artworkId;}
  CreateArtworkReviewModel({required this.hobbyistId,required this.artworkId,required this.title,required this.comment, this.calification});
  Map<String,dynamic> toJson(){
    return {
    'title':title,
    'comment':comment,
    'calification':calification
    };
  }
}