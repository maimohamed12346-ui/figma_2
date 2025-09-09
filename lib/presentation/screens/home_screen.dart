import 'package:flutter/material.dart';
import 'package:flutter_application_figma_3/core/cubit/product_cubit.dart';
import 'package:flutter_application_figma_3/core/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/product_card.dart';
import '../widgets/banner_card.dart';
import '../widgets/category_list.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategory = 0;
  final categories = ["All", "Jackets", "Jeans", "Shoes", "Shirts"];

  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomAppBar(),
                          const SizedBox(height: 20),
                          const SearchBarWidet(),
                          const SizedBox(height: 20),
                          const BannerCard(),
                          const SizedBox(height: 20),

                          CategoryList(
                            categories: categories,
                            selectedIndex: selectedCategory,
                            onTap: (index) {
                              setState(() {
                                selectedCategory = index;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),

                  BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) {
                      if (state.products.isEmpty) {
                        return const SliverFillRemaining(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      return SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return ProductCard(
                                product: state.products[index],
                                onTap: () {},
                              );
                            },
                            childCount: state.products.length,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20, 
                            crossAxisSpacing: 16, 
                            childAspectRatio: 0.65,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
