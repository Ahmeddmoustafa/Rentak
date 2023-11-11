import 'package:flutter/material.dart';
import 'package:rentak/Presentation/Home/widgets/custom_categories_list.dart';
import 'package:rentak/Presentation/Home/widgets/custom_features_list.dart';
import 'package:rentak/Presentation/Home/widgets/custom_text_field.dart';
import 'package:rentak/Presentation/Home/widgets/custom_top_bar.dart';
import 'package:rentak/Presentation/Home/widgets/popular_list_widget.dart';
import 'package:rentak/Presentation/Home/widgets/recommendation_list_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomTopBar(),
          const CustomTextField(),
          SizedBox(height: height * .02),
          const CustomFeaturesList(),
          SizedBox(height: height * .04),
          const CustomCategoriesList(),
          SizedBox(height: height * .02),
          const PopularListWidget(),
          SizedBox(height: height * .04),
          const RecommendationListWidget(),
          SizedBox(height: height * .05),
          // const CustomHomeCard(),
        ],
      ),
    );
  }
}
