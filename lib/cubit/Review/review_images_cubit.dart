import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'review_images_state.dart';

class ReviewImagesCubit extends Cubit<ReviewImagesState> {
  List<String> images = [];

  ReviewImagesCubit() : super(ReviewImagesInitial());

  void loadReviewImages(List<String> imagesList, int index) {
    emit(ReviewImagesInitial());
    // CHECKING IF NO IMAGES OR ONLY IMAGE WITH ONE ELEMENT
    if (imagesList.isEmpty) return;
    images[0] = imagesList[index];

    // REORDERING THE IMAGES ACCORDING TO THE USER CHOICE
    if (imagesList.length == 1) return;
    for (int i = index; i < imagesList.length - index; i++) {
      images.add(imagesList[i + 1]);
    }
    for (int i = 0; i < index; i++) {
      images.add(imagesList[i + 1]);
    }
    // print(images);
    emit(ReviewImagesOpened(theReviewImages: images));
  }
}
