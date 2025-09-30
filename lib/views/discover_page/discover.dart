import 'package:e_commerce_app/views/discover_page/discover_widget/brands_listview.dart';
import 'package:e_commerce_app/views/discover_page/discover_widget/clothes_listview_builder.dart';
import 'package:e_commerce_app/views/discover_page/discover_widget/discover_appbar.dart';
import 'package:e_commerce_app/views/discover_page/discover_widget/discover_search_bar.dart';
import 'package:e_commerce_app/views/discover_page/discover_widget/view_all_widget.dart';
import 'package:flutter/material.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 80),
                DiscoverAppBar(),
                SizedBox(height: 20),
                Text(
                  "Hello",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Welcome to ShopFlare",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                DiscoverSearchBar(),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: ViewAllWidget(
            leadingText: "Choose Brand",
            onTap: () {},
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 80,
            child: BrandListView(),
          ),
        ),
        SliverToBoxAdapter(
          child: ViewAllWidget(
            leadingText: "New Arrival",
            onTap: () {},
          ),
        ),
        ClothesListViewBuilder(),
      ],
    );
  }
}
