import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/cubit/cart_cubit/cart_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemsView extends StatefulWidget {
  const CartItemsView({
    super.key,
  });

  @override
  State<CartItemsView> createState() => _CartItemsViewState();
}

class _CartItemsViewState extends State<CartItemsView> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CartFailure) {
          return Center(child: Text("Error: ${state.errMessage}"));
        } else if (state is CartSuccess) {
          if (state.items.isEmpty) {
            return const Center(
                child: Text(
              "Cart is empty",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return Dismissible(
                      key: Key(item[kDocId]),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (direction) async {
                        try {
                          await FirebaseFirestore.instance
                              .collection(kUser)
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection(kCart)
                              .doc(item[kDocId])
                              .delete();
                          context.read<CartCubit>().getCartItem();
                        } catch (e) {
                          print(e.toString());
                        }
                      },
                      child: ListTile(
                        leading: Image.network(
                          item['image'],
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        title: Text(item['title']),
                        subtitle: Text("\$${item['price']}"),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Total: \$${state.total}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
