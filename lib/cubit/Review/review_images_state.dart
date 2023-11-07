part of 'review_images_cubit.dart';

@immutable
sealed class ReviewImagesState {}

final class ReviewImagesInitial extends ReviewImagesState {}

final class ReviewImagesOpened extends ReviewImagesState {
  final List<String> theReviewImages;

  ReviewImagesOpened({required this.theReviewImages});

  List<String> get reviewImages => theReviewImages;
}
