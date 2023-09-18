import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vapestore/bloc/checkout/checkout_bloc.dart';
import 'package:vapestore/bloc/get_products/get_products_bloc.dart';
import 'package:vapestore/data/models/responses/list_product_response_model.dart';

class ListProductWidget extends StatefulWidget {
  const ListProductWidget({super.key});
  @override
  State<ListProductWidget> createState() => _ListProductWidgetState();
}

class _ListProductWidgetState extends State<ListProductWidget> {
  @override
  void initState() {
    context.read<GetProductsBloc>().add(DoGetProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsBloc, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsError) {
          return const Center(
            child: Text('data error'),
          );
        }
        if (state is GetProductsLoaded) {
          if (state.data.data!.isEmpty) {
            return const Center(
              child: Text('Data Empty'),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 0.61,
            ),
            itemBuilder: (context, index) {
              final Product product = state.data.data![index];
              return Card(
                elevation: 2,
                shadowColor: const Color.fromARGB(255, 49, 49, 49),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: product.attributes!.image!,
                      child: SizedBox(
                        // width: 160,
                        // height: 130,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: Image.network(
                            product.attributes!.image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        product.attributes!.name!,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      product.attributes!.price!.toString(),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 39, 38, 38),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Divider(
                      height: 2,
                      color: Colors.grey,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    context.read<CheckoutBloc>().add(
                                          RemoveFromCartEvent(product: product),
                                        );
                                  },
                                  child: const Icon(
                                    Icons.add_shopping_cart,
                                    size: 20,
                                    color: Color(0xffEE4D2D),
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                const Text(
                                  "Beli",
                                  style: TextStyle(
                                    color: Color(0xffEE4D2D),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 8,
                              height: 8,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    context.read<CheckoutBloc>().add(
                                        RemoveFromCartEvent(product: product));
                                  },
                                  child: const Icon(
                                    Icons.remove_circle_outline,
                                    size: 18,
                                    color: Color.fromARGB(255, 227, 148, 12),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child:
                                      BlocBuilder<CheckoutBloc, CheckoutState>(
                                    builder: (context, state) {
                                      if (state is CheckoutLoaded) {
                                        final countItem = state.items
                                            .where((element) =>
                                                element.id == product.id)
                                            .length;
                                        return Text('$countItem');
                                      }
                                      return const Text('0');
                                    },
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    context
                                        .read<CheckoutBloc>()
                                        .add(AddToCartEvent(product: product));
                                  },
                                  child: const Icon(
                                    Icons.add_circle_outline,
                                    size: 18,
                                    color: Color(0xffEE4D2D),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            itemCount: state.data.data!.length,
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
