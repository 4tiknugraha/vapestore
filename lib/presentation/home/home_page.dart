import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:vapestore/presentation/home/widgets/banner_widget.dart';
import 'package:vapestore/presentation/home/widgets/list_category_widget.dart';
import 'package:vapestore/presentation/home/widgets/list_product_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 49, 49, 49)),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.symmetric(horizontal: 0),
                  child: Material(
                    borderRadius: BorderRadius.circular(50),
                    elevation: 3,
                    child: TextFormField(
                      onFieldSubmitted: (_) {},
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: 'Search ',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          ListCategoryWidget(),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: BannerWidget(),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'Rekomendasi Untuk Anda',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 5),
          // SizedBox(
          //   height: 0,
          // ),
          Expanded(child: ListProductWidget())
        ],
      ),
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        // currentIndex: 0,
        // selectedItemColor: GlobalVariables.selectedNavBarColor,
        // unselectedItemColor: const Color.fromARGB(221, 172, 224, 14),
        color: Colors.grey.shade300,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 340),
        // iconSize: 28,
        onTap: (index) {},
        items: const [
          Icon(
            Icons.home,
            color: Colors.black,
          ),
          Icon(
            Icons.favorite,
            color: Colors.black,
          ),
          Icon(
            Icons.settings,
            color: Colors.black,
          ),
          // HOME
          // BottomNavigationBarItem(
          //   icon: Container(
          //     width: bottomBarWidth,
          //     decoration: BoxDecoration(
          //       border: Border(
          //         top: BorderSide(
          //           color: _page == 0
          //               ? GlobalVariables.selectedNavBarColor
          //               : GlobalVariables.backgroundColor,
          //           width: bottomBarBorderWidth,
          //         ),
          //       ),
          //     ),
          //     child: const Icon(
          //       Icons.home_outlined,
          //     ),
          //   ),
          //   label: '',
          // ),
          // ACCOUNT
          // BottomNavigationBarItem(
          //   icon: Container(
          //     width: bottomBarWidth,
          //     decoration: BoxDecoration(
          //       border: Border(
          //         top: BorderSide(
          //           color: _page == 1
          //               ? GlobalVariables.selectedNavBarColor
          //               : GlobalVariables.backgroundColor,
          //           width: bottomBarBorderWidth,
          //         ),
          //       ),
          //     ),
          //     child: const Icon(
          //       Icons.person_outline_outlined,
          //     ),
          //   ),
          //   label: '',
          // ),
          // CART
          // BottomNavigationBarItem(
          //   icon: Container(
          //     width: bottomBarWidth,
          //     decoration: BoxDecoration(
          //       border: Border(
          //         top: BorderSide(
          //           color: _page == 2
          //               ? GlobalVariables.selectedNavBarColor
          //               : GlobalVariables.backgroundColor,
          //           width: bottomBarBorderWidth,
          //         ),
          //       ),
          //     ),
          //     child: BlocBuilder<CheckoutBloc, CheckoutState>(
          //       builder: (context, state) {
          //         if (state is CheckoutLoaded) {
          //           return badges.Badge(
          //             badgeStyle: const badges.BadgeStyle(
          //                 elevation: 0, badgeColor: Colors.white),
          //             // elevation: 0,
          //             badgeContent: Text(
          //               '${state.items.length}',
          //               style: const TextStyle(color: Color(0xffEE4D2D)),
          //             ),
          //             // badgeCo
          //             child: InkWell(
          //               onTap: () {
          //                 Navigator.push(context,
          //                     MaterialPageRoute(builder: (context) {
          //                   return const CartPage();
          //                 }));
          //               },
          //               child: const Icon(
          //                 Icons.shopping_cart_outlined,
          //               ),
          //             ),
          //           );
          //         }
          //         return const badges.Badge(
          //           badgeStyle: badges.BadgeStyle(
          //               elevation: 0, badgeColor: Colors.white),
          //           // elevation: 0,
          //           badgeContent: Text(
          //             '0',
          //             style: TextStyle(color: Color(0xffEE4D2D)),
          //           ),
          //           // badgeColor: Colors.white,
          //           child: Icon(
          //             Icons.shopping_cart_outlined,
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          //   label: '',
          // ),
        ],
      ),
    );
  }
}
