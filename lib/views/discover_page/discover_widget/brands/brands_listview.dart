import 'package:e_commerce_app/cubit/products_cubit/products_cubit_cubit.dart';
import 'package:e_commerce_app/views/discover_page/discover_widget/brands/brands_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../models/brand_model.dart';

class BrandListView extends StatelessWidget {
  BrandListView({super.key});

  final List<BrandModel> brands = [
    BrandModel(logo: Icons.devices),
    BrandModel(logo: Icons.diamond),
    BrandModel(logo: FontAwesomeIcons.shirt),
    BrandModel(logo: FontAwesomeIcons.personDress),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverCubit, DiscoverCubitState>(
      builder: (context, state) {
        if (state is DiscoverCubitSuccess) {
          return SizedBox(
            height: 12.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: brands.length,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              itemBuilder: (context, index) {
                final name = state.categories[index];

                return BrandsWidget(
                  icon: brands[index].logo,
                  name: name,
                );
              },
            ),
          );
        } else if (state is DiscoverCubitLoading) {
          return SizedBox(
            height: 12.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              itemBuilder: (context, index) {
                return Skeletonizer(
                  enabled: true,
                  child: Container(
                    margin: EdgeInsets.only(right: 5.w, top: 2.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    width: 35.w,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is DiscoverCubitFailure) {
          return Center(child: Text('Failed: ${state.errMessage}'));
        } else {
          return const Center(child: Text("No data"));
        }
      },
    );
  }
}
