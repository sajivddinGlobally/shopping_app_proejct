import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:shopping_app/Cart/cart.page.dart';
import 'package:shopping_app/account/account.page.dart';
import 'package:shopping_app/category/category.page.dart';
import 'package:shopping_app/category/service/categoryController.dart';
import 'package:shopping_app/constant/myColors.dart';
import 'package:shopping_app/particularSearch/particularSearch.page.dart';
import 'package:shopping_app/search/search.page.dart';
import 'package:shopping_app/search/service/allProductController.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int tabBottom = 0;
  @override
  Widget build(BuildContext context) {
    var box = Hive.box("data");
    var Id = box.get("id");
    final productProvider = ref.watch(allProductProvider);
    final categoryProvider = ref.watch(categoryController);
    if (productProvider.isLoading || categoryProvider.isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator(color: textColor)),
      );
    }
    if (productProvider.error != null || categoryProvider.error != null) {
      return Scaffold(
        body: Center(child: Text("Error:${productProvider.error}")),
      );
    }
<<<<<<< HEAD
    final categoryProvider = ref.watch(categoryController);
=======
    
>>>>>>> c69b5518188aaa73d740a7517b6fbd5ee515a4e3
    return Scaffold(
      backgroundColor: defaultColor,
      body:
          tabBottom == 0
              ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 70.h),
                    Row(
                      children: [
                        SizedBox(width: 20.w),
                        Container(
                          width: 44.w,
                          height: 44.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 217, 217, 217),
                          ),
                          child: Image.asset("assets/girl.png"),
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${box.get("name") ?? "Hello"}",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                                color: Color.fromARGB(255, 16, 27, 1),
                              ),
                            ),
                            Text(
                              "Jaipur, 302033",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 11.sp,
                                color: Color.fromARGB(255, 102, 102, 102),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: 44.w,
                          height: 44.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 255, 255, 255),
                            border: Border.all(
                              color: Color.fromARGB(25, 0, 0, 0),
                              width: 1.w,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.favorite_border,
                              color: Color.fromARGB(255, 16, 27, 1),
                              size: 20.sp,
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: SizedBox(
                        height: 50.h,
                        child: TextField(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => SearchPage(),
                              ),
                            );
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: 8.h,
                              right: 8.w,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              size: 20.sp,
                              color: Color.fromARGB(255, 153, 153, 153),
                            ),
                            hintText: "Search Anything",
                            hintStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: Color.fromARGB(255, 153, 153, 153),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide: BorderSide(
                                color: Color.fromARGB(25, 0, 0, 0),
                                width: 1.w,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide: BorderSide(
                                color: Color.fromARGB(25, 0, 0, 0),
                                width: 1.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      height: 77.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 244, 232, 243),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 35.w, right: 35.w),
                        child: Row(
                          children: [
                            Icon(
                              Icons.repeat,
                              color: Color.fromARGB(255, 150, 28, 130),
                            ),
                            SizedBox(width: 6.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "7 days",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Color.fromARGB(255, 150, 28, 130),
                                  ),
                                ),
                                Text(
                                  "Easy Return",
                                  style: GoogleFonts.inter(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 102, 102, 102),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            VerticalDivider(
                              color: Colors.grey,
                              indent: 15,
                              endIndent: 15,
                              width: 1.w,
                            ),
                            Spacer(),
                            Icon(
                              Icons.repeat,
                              color: Color.fromARGB(255, 150, 28, 130),
                            ),
                            SizedBox(width: 6.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "COD",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Color.fromARGB(255, 150, 28, 130),
                                  ),
                                ),
                                Text(
                                  "Available",
                                  style: GoogleFonts.inter(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 102, 102, 102),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            VerticalDivider(
                              color: Colors.grey,
                              indent: 15,
                              endIndent: 15,
                              width: 1.w,
                            ),
                            Spacer(),
                            Icon(
                              Icons.repeat,
                              color: Color.fromARGB(255, 150, 28, 130),
                            ),
                            SizedBox(width: 6.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Lowest",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Color.fromARGB(255, 150, 28, 130),
                                  ),
                                ),
                                Text(
                                  "Price Item",
                                  style: GoogleFonts.inter(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 102, 102, 102),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
<<<<<<< HEAD
                    Padding(
                      padding: EdgeInsets.only(left: 0.w, right: 0.w),
                      child: Row(
                        children: [
                          SizedBox(width: 10.w),
                          // Column(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     Container(
                          //       width: 60.w,
                          //       height: 60.h,
                          //       decoration: BoxDecoration(
                          //         shape: BoxShape.circle,
                          //         color: Color.fromARGB(255, 244, 232, 243),
                          //       ),
                          //       child: Center(
                          //         child: Icon(
                          //           Icons.qr_code_outlined,
                          //           color: Color.fromARGB(255, 150, 28, 130),
                          //         ),
                          //       ),
                          //     ),
                          //     SizedBox(height: 5.h),
                          //     Text(
                          //       textAlign: TextAlign.center,
                          //       "All\n Categories",
                          //       style: GoogleFonts.inter(
                          //         fontWeight: FontWeight.w400,
                          //         fontSize: 12.sp,
                          //         color: Color.fromARGB(255, 102, 102, 102),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          categoryProvider.when(
                            data: (categry) {
                              return Expanded(
                                child: SizedBox(
                                  height: 115.h,
                                  child: ListView.builder(
                                    itemCount: categry.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                          left: 7.w,
                                          right: 7.w,
                                        ),
                                        child: AllCategorBody(
                                          image:
                                              categry[index].imageUrl ??
                                              "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg",
                                          text: categry[index].name,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                            error: (Object error, StackTrace stackTrace) {
                              return Center();
                            },
                            loading: () {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                          // Spacer(),
                          // AllCategorBody(
                          //   image: "assets/home.png",
                          //   text: 'Home &\nKitchen',
                          // ),
                          // Spacer(),
                          // AllCategorBody(
                          //   image: "assets/beauty.png",
                          //   text: 'Beauty &\nPersonal care',
                          // ),
                          // Spacer(),
                          // AllCategorBody(
                          //   image: "assets/toy.png",
                          //   text: 'Toy &\nGames',
                          // ),
                          // Spacer(),
                          // AllCategorBody(
                          //   image: "assets/kids.png",
                          //   text: 'Kids\nAccessories',
                          // ),
                        ],
=======
                    Container(
                      height: 100.h,
                      //color: Colors.amber,
                      child: categoryProvider.when(
                        data: (categorydata) {
                          return ListView.builder(
                            itemCount: categorydata.length,
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(left: 10.w),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 60.w,
                                      height: 60.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromARGB(
                                          255,
                                          244,
                                          232,
                                          243,
                                        ),
                                      ),
                                      child: ClipOval(
                                        child: Image.network(
                                          categorydata[index].imageUrl ??
                                              "https://placehold.co/600x400/orange/white",
                                          width: 60.w,
                                          height: 60.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    SizedBox(
                                      width: 75.w,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        // "All\n Categories",
                                        categorydata[index].name,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp,
                                          color: Color.fromARGB(
                                            255,
                                            102,
                                            102,
                                            102,
                                          ),
                                          letterSpacing: -0.70,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            // Row(
                            //   children: [
                            //     Spacer(),
                            //     AllCategorBody(
                            //       image: "assets/home.png",
                            //       text: 'Home &\nKitchen',
                            //     ),
                            //     Spacer(),
                            //     AllCategorBody(
                            //       image: "assets/beauty.png",
                            //       text: 'Beauty &\nPersonal care',
                            //     ),
                            //     Spacer(),
                            //     AllCategorBody(
                            //       image: "assets/toy.png",
                            //       text: 'Toy &\nGames',
                            //     ),
                            //     Spacer(),
                            //     AllCategorBody(
                            //       image: "assets/kids.png",
                            //       text: 'Kids\nAccessories',
                            //     ),
                            //   ],
                            // ),
                          );
                        },
                        error:
                            (error, stackTrace) =>
                                Center(child: Text(e.toString())),
                        loading:
                            () => Center(
                              child: CircularProgressIndicator(
                                color: textColor,
                              ),
                            ),
>>>>>>> c69b5518188aaa73d740a7517b6fbd5ee515a4e3
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Deal of the day",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20.sp,
                                  color: Color.fromARGB(255, 16, 27, 1),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Deals ends in ",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      color: Color.fromARGB(255, 102, 102, 102),
                                    ),
                                  ),
                                  Text(
                                    "- 04:45:00",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      color: textColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            width: 75.w,
                            height: 36.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              color: Color.fromARGB(25, 150, 28, 130),
                            ),
                            child: Center(
                              child: Text(
                                "View All",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.sp,
                                  color: textColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    DealsBody(showDiscount: true),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Image.asset("assets/shop.png"),
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      children: [
                        SizedBox(width: 20.w),
                        Text(
                          "Product for you",
                          style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 16, 27, 1),
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 75.w,
                          height: 36.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            color: Color.fromARGB(25, 150, 28, 130),
                          ),
                          child: Center(
                            child: Text(
                              "View All",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp,
                                color: textColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: GridVeiwBody(),
                    ),
                    SizedBox(height: 30.h),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 395.h,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 244, 231, 243),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 25.w,
                              right: 20.w,
                              top: 26.h,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Low Price Store",
                                  style: GoogleFonts.inter(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 16, 27, 1),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width: 75.w,
                                  height: 36.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.r),
                                    color: Color.fromARGB(25, 150, 28, 130),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "View All",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.sp,
                                        color: textColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                          DealsBody(showDiscount: false),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              : tabBottom == 1
              ? CategoryPage()
              : tabBottom == 2
              ? CartPage()
              : AccountPage(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            tabBottom = value;
          });
        },
        currentIndex: tabBottom,
        selectedItemColor: textColor,
        selectedLabelStyle: GoogleFonts.inter(
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: GoogleFonts.inter(
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.layers_outlined),
            label: 'Category',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: 'Cart'),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.help_outline),
          //   label: 'Help',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity_sharp),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

class GridVeiwBody extends ConsumerStatefulWidget {
  const GridVeiwBody({super.key});

  @override
  ConsumerState<GridVeiwBody> createState() => _GridVeiwBodyState();
}

class _GridVeiwBodyState extends ConsumerState<GridVeiwBody> {
  List<Map<String, String>> gridList = [
    {
      "lipisticImage": "assets/pieces.png",
      "rating": "4.5",
      "review": "(512 reviews)",
      "title": "53 Pieces Cabana Tent Birthday Deco",
      "ammount": "\$450.00",
    },
    {
      "lipisticImage": "assets/lip.png",
      "rating": "4.5",
      "review": "(512 reviews)",
      "title": "53 Pieces Cabana Tent Birthday Deco",
      "ammount": "\$450.00",
    },
    {
      "lipisticImage": "assets/tic.png",
      "rating": "4.5",
      "review": "(512 reviews)",
      "title": "53 Pieces Cabana Tent Birthday Deco",
      "ammount": "\$450.00",
    },
    {
      "lipisticImage": "assets/lipistic.png",
      "ofImage": "assets/of.png",
      "text": "20%",
      "offtext": "OFF",
      "rating": "4.5",
      "review": "(512 reviews)",
      "title": "53 Pieces Cabana Tent Birthday Deco",
      "ammount": "\$450.00",
    },
    {
      "lipisticImage": "assets/butter.png",
      "ofImage": "assets/of.png",
      "text": "20%",
      "offtext": "OFF",
      "rating": "4.5",
      "review": "(512 reviews)",
      "title": "1 KG Butter Paper for Roti, Cake",
      "ammount": "\$150.00",
    },
    {
      "lipisticImage": "assets/ganesh.png",
      "ofImage": "assets/of.png",
      "text": "20%",
      "offtext": "OFF",
      "rating": "4.5",
      "review": "(512 reviews)",
      "title": "37 Pc Birthday Decoration Items:Red Banner",
      "ammount": "\$450.00",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final productProvider = ref.watch(allProductProvider);
    return productProvider.when(
      data: (product) {
        return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: min(product.length, gridList.length),
          // itemCount: product.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h,
            childAspectRatio: 0.60,
          ),
          itemBuilder: (context, index) {
<<<<<<< HEAD
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder:
                        (context) =>
                            ParticularSearchPage(id: product[index].id),
=======
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder:
                            (context) =>
                                ParticularSearchPage(id: product[index].id),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.network(
                      // "assets/pieces.png",
                      //gridList[index]['lipisticImage'].toString(),
                      product[index].imageUrl,
                      height: 240.h,
                      fit: BoxFit.cover,
                    ),
>>>>>>> c69b5518188aaa73d740a7517b6fbd5ee515a4e3
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.network(
                      // "assets/pieces.png",
                      //gridList[index]['lipisticImage'].toString(),
                      product[index].imageUrl,
                      height: 235.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: textColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.white, size: 15.sp),
                            Text(
                              // "4.5",
                              gridList[index]['rating'].toString(),
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 10.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        // "(512 reviews)",
                        gridList[index]['review'].toString(),
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp,
                          color: Color.fromARGB(255, 102, 102, 102),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 159.w,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      // "5 in 1 Lipstick Red Edition & Nud",
                      // gridList[index]['title'].toString(),
                      product[index].name,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: Color.fromARGB(255, 102, 102, 102),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    // "\$450.00",
                    //gridList[index]['ammount'].toString(),
                    product[index].regularPrice,
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      error: (error, stackTrace) => Center(child: Text(e.toString())),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}

class DealsBody extends ConsumerStatefulWidget {
  final bool showDiscount;
  const DealsBody({super.key, required this.showDiscount});

  @override
  ConsumerState<DealsBody> createState() => _DealsBodyState();
}

class _DealsBodyState extends ConsumerState<DealsBody> {
  List<Map<String, String>> myList = [
    {
      "lipisticImage": "assets/lipistic.png",
      "ofImage": "assets/of.png",
      "text": "20%",
      "offtext": "OFF",
      "rating": "4.5",
      "review": "(512 reviews)",
      "title": "5 in 1 Lipstick Red Edition & Nud",
      "ammount": "\$450.00",
    },
    {
      "lipisticImage": "assets/butter.png",
      "ofImage": "assets/of.png",
      "text": "20%",
      "offtext": "OFF",
      "rating": "4.5",
      "review": "(512 reviews)",
      "title": "1 KG Butter Paper for Roti, Cake",
      "ammount": "\$150.00",
    },
    {
      "lipisticImage": "assets/birthday.png",
      "ofImage": "assets/of.png",
      "text": "20%",
      "offtext": "OFF",
      "rating": "4.5",
      "review": "(512 reviews)",
      "title": "37 Pc Birthday Decoration Items:Red Banner",
      "ammount": "\$450.00",
    },
  ];
  @override
  Widget build(BuildContext context) {
    final productProvider = ref.watch(allProductProvider);
    return productProvider.when(
      data: (data) {
        return Container(
          height: 310.h,
          // color: Colors.yellow,
          child: ListView.builder(
            itemCount: min(data.length, myList.length),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
<<<<<<< HEAD
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder:
                          (context) => ParticularSearchPage(id: data[index].id),
=======
              return Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder:
                                (context) =>
                                    ParticularSearchPage(id: data[index].id),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.network(
                              // "assets/lipistic.png"
                              width: 166.w,
                              height: 200.h,
                              fit: BoxFit.cover,
                              //myList[index]['lipisticImage'].toString(),
                              data[index].imageUrl,
                            ),
                          ),
                          widget.showDiscount == true
                              ? Positioned(
                                top: 19.h,
                                child: Image.asset(
                                  // "assets/of.png",
                                  myList[index]['ofImage'].toString(),
                                ),
                              )
                              : SizedBox(),
                          widget.showDiscount
                              ? Positioned(
                                top: 20.h,
                                left: 15.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // "20%",
                                      myList[index]['text'].toString(),
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      // "OFF",
                                      myList[index]['offtext'].toString(),
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              : SizedBox(),
                        ],
                      ),
>>>>>>> c69b5518188aaa73d740a7517b6fbd5ee515a4e3
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.network(
                              // "assets/lipistic.png"
                              width: 166.w,
                              height: 200.h,
                              fit: BoxFit.cover,
                              //myList[index]['lipisticImage'].toString(),
                              data[index].imageUrl,
                            ),
                          ),
                          widget.showDiscount == true
                              ? Positioned(
                                top: 19.h,
                                child: Image.asset(
                                  // "assets/of.png",
                                  myList[index]['ofImage'].toString(),
                                ),
                              )
                              : SizedBox(),
                          widget.showDiscount
                              ? Positioned(
                                top: 20.h,
                                left: 15.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // "20%",
                                      myList[index]['text'].toString(),
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      // "OFF",
                                      myList[index]['offtext'].toString(),
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              : SizedBox(),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          Container(
                            width: 40.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              color: textColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 15.sp,
                                ),
                                Text(
                                  // "4.5",
                                  myList[index]['rating'].toString(),
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            // "(512 reviews)",
                            myList[index]['review'].toString(),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                              color: Color.fromARGB(255, 102, 102, 102),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        width: 159.w,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          // "5 in 1 Lipstick Red Edition & Nud",
                          // myList[index]['title'].toString(),
                          data[index].name,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: Color.fromARGB(255, 102, 102, 102),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        // "\$450.00",
                        // myList[index]['ammount'].toString(),
                        data[index].regularPrice,
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
      error: (error, stackTrace) => Center(child: Text(e.toString())),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}

class AllCategorBody extends StatefulWidget {
  final String image;
  final String text;
  const AllCategorBody({super.key, required this.image, required this.text});

  @override
  State<AllCategorBody> createState() => _AllCategorBodyState();
}

class _AllCategorBodyState extends State<AllCategorBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60.w,
          height: 60.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(widget.image),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          // "Home &\nKitchen",
          breakString(truncateWithEllipsis(widget.text, 15), 10),

          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            color: Color.fromARGB(255, 102, 102, 102),
          ),
        ),
      ],
    );
  }
}

String breakString(String input, int maxLength) {
  final buffer = StringBuffer();
  for (int i = 0; i < input.length; i += maxLength) {
    int end = (i + maxLength < input.length) ? i + maxLength : input.length;
    buffer.writeln(input.substring(i, end));
  }
  return buffer.toString();
}

String truncateWithEllipsis(String input, int maxLength) {
  if (input.length <= maxLength) {
    return input;
  } else {
    return input.substring(0, maxLength) + '...';
  }
}
