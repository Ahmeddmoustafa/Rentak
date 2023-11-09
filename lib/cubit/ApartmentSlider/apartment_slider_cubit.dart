import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rentak/Resources/Managers/assets_manager.dart';

part 'apartment_slider_state.dart';

class ApartmentSliderCubit extends Cubit<ApartmentSliderState> {
  List villas = [];
  int currIndex = 0;
  final CarouselController controller = CarouselController();
  ApartmentSliderCubit() : super(ApartmentSliderInitial());

  void initSlider() {
    villas = [
      {
        "id": 1,
        "image": AssetsManager.VillaImage,
      },
      {
        "id": 2,
        "image": AssetsManager.VillaImage2,
      },
      {
        "id": 3,
        "image": AssetsManager.VillaImage3,
      },
      {
        "id": 4,
        "image": AssetsManager.VillaImage4,
      },
    ];
  }

  void pageChanged(int index) {
    emit(ApartmentSliderInitial());
    currIndex = index >= 0 ? index : 0;
    emit(ApartmentSliderMoved());
  }
}
