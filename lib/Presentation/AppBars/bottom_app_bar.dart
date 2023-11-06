// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:rent_app/Resources/Managers/colors_manager.dart';
// import 'package:rent_app/Resources/Managers/values_manager.dart';
// import 'package:rent_app/cubit/bottom_bar_cubit.dart';

// class CustomBottomAppBar extends StatefulWidget {
//   const CustomBottomAppBar({super.key});

//   @override
//   State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
// }

// class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
//   Widget bottomIcons(Icon icon, String text, Color color) {
//     return Column(
//       children: [
//         icon,
//         Text(
//           text,
//           style: TextStyle(color: color),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       child: Container(
//         height: MediaQuery.of(context).size.height * 0.1,
//         padding: const EdgeInsets.only(top: AppSize.s10),
//         // color: ColorManager.Black,
//         child: FractionallySizedBox(
//           widthFactor: 0.6,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: List.generate(4, (index) {
//               return BlocBuilder<BottomBarCubit, BottomBarState>(
//                 builder: (context, state) {
//                   BlocProvider.of<BottomBarCubit>(context)
//                       .getBottomIcons(index);
//                   if (state is BottomBarSwitched) {
//                     return bottomIcons(
//                         Icon(
//                           state.currentIcon,
//                           color: state.currentIndex == index
//                               ? ColorManager.Black
//                               : ColorManager.LightSilver,
//                         ),
//                         state.currentText,
//                         ColorManager.DarkGrey);
//                   } else {
//                     return const Text("data");
//                   }
//                 },
//               );
//             }).toList(),
//             // bottomIcons(
//             //     Icon(
//             //       Icons.home,
//             //       color: ColorManager.DarkGrey,
//             //     ),
//             //     "Home",
//             //     ColorManager.DarkGrey),
//             // bottomIcons(
//             //     Icon(
//             //       Icons.search,
//             //       color: ColorManager.DarkGrey,
//             //     ),
//             //     "Search",
//             //     ColorManager.DarkGrey),
//             // bottomIcons(
//             //     Icon(
//             //       Icons.payment,
//             //       color: ColorManager.DarkGrey,
//             //     ),
//             //     "Payment",
//             //     ColorManager.DarkGrey),
//             // bottomIcons(
//             //     Icon(
//             //       Icons.account_circle,
//             //       color: ColorManager.DarkGrey,
//             //     ),
//             //     "Home",
//             //     ColorManager.DarkGrey),
//           ),
//         ),
//       ),
//     );
//   }
// }
