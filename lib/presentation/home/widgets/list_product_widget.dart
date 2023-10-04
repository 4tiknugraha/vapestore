import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vapestore/bloc/checkout/checkout_bloc.dart';
import 'package:vapestore/bloc/get_products/get_products_bloc.dart';
import 'package:vapestore/data/models/responses/list_product_response_model.dart';
import 'package:intl/intl.dart';

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
              horizontal: 14,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 11,
              crossAxisSpacing: 14,
              childAspectRatio: 0.60,
            ),
            itemBuilder: (context, index) {
              final Product product = state.data.data![index];
              return Card(
                elevation: 2,
                shadowColor: Colors.grey.withOpacity(0.7),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 234, 234, 234),
                          spreadRadius: 1,
                        ),
                      ],
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Hero(
                        tag: product.attributes!.image!,
                        child: SizedBox(
                          // width: 170,
                          // height: 165,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(9),
                              topRight: Radius.circular(9),
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
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          product.attributes!.name!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.start,
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
                        // product.attributes!.price!.toString(),
                        FormatCurrency.convertToIdr(
                            product.attributes!.price!, 0),
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 39, 38, 38),
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Divider(
                        height: 0,
                        color: Color.fromARGB(255, 223, 221, 221),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      context.read<CheckoutBloc>().add(
                                            RemoveFromCartEvent(
                                                product: product),
                                          );
                                    },
                                    child: const Icon(
                                      Icons.add_shopping_cart,
                                      size: 20,
                                      color: Color(0xffad9c00),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  const Text(
                                    "Beli",
                                    style: TextStyle(
                                      color: Color(0xffad9c00),
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
                                          RemoveFromCartEvent(
                                              product: product));
                                    },
                                    child: const Icon(
                                      Icons.remove_circle_outline,
                                      size: 18,
                                      color: Color(0xffad9c00),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: BlocBuilder<CheckoutBloc,
                                        CheckoutState>(
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
                                      context.read<CheckoutBloc>().add(
                                          AddToCartEvent(product: product));
                                    },
                                    child: const Icon(
                                      Icons.add_circle_outline,
                                      size: 18,
                                      color: Color(0xffad9c00),
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

// Format Currency
class FormatCurrency {
  static String convertToIdr(number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}
