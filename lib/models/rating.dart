import 'package:cloud_firestore/cloud_firestore.dart';

class Rating{

 String userId;
 int movieId;
 double rating;
 late String ratingId;

Rating({
  required this.userId,
  required this.movieId,
  required this.rating,
});
 
 setStar(userId, movieId, rating)async{
  this.userId= userId;
  this.movieId= movieId;
  this.rating= rating;
  await FirebaseFirestore.instance.collection('rating').doc(ratingId).set(
      {
        'userid': userId,
        'movieid': movieId,
        'rating': rating,
        
      },
 );}

}