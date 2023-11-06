import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentak/Resources/Managers/assets_manager.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/routes_manager.dart';
import 'package:rentak/Resources/Managers/values_manager.dart';
import 'package:rentak/cubit/apartment_cubit.dart';

class NearApartments extends StatefulWidget {
  const NearApartments({super.key});

  @override
  State<NearApartments> createState() => _NearApartmentsState();
}

class _NearApartmentsState extends State<NearApartments> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ApartmentCubit>(context).loadApartments();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s200,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return BlocBuilder<ApartmentCubit, ApartmentState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    if (state is ApartmentLoaded) {
                      BlocProvider.of<ApartmentCubit>(context)
                          .selectedApartment(state.apartments[index]);

                      Navigator.pushReplacementNamed(
                          context, Routes.apartmentRoute);
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: AppSize.s25),
                    child: Container(
                      margin: const EdgeInsetsDirectional.symmetric(
                        vertical: AppSize.s14,
                      ),
                      height: AppSize.s200,
                      // width: AppSize.s200 + AppSize.s25,
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                        color: ColorManager.LightSilver,
                        borderRadius: BorderRadius.circular(AppSize.s14),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: AppSize.s8,
                          right: AppSize.s8,
                        ),
                        child: BlocBuilder<ApartmentCubit, ApartmentState>(
                          builder: (context, state) {
                            if (state is ApartmentLoaded) {
                              return Column(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: FractionallySizedBox(
                                        heightFactor: 0.95,
                                        widthFactor: 1,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    AssetsManager.VillaImage),
                                                fit: BoxFit.fill),
                                            borderRadius: BorderRadius.circular(
                                                AppSize.s14),
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: AppSize.s8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: AppSize.s8),
                                                child: Text(
                                                  state.apartments[index].place,
                                                  textAlign: TextAlign.start,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                state.apartments[index].price,
                                                textAlign: TextAlign.start,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displaySmall,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    state.apartments[index]
                                                        .rating,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displaySmall,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: ColorManager.Golden,
                                                    size: AppSize.s14,
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              );
                            } else {
                              return const Text("Data is loading...");
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
