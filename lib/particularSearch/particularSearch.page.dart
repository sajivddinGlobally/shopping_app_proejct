import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/constant/myColors..dart';

class ParticularSearchPage extends StatefulWidget {
  const ParticularSearchPage({super.key});

  @override
  State<ParticularSearchPage> createState() => _ParticularSearchPageState();
}

class _ParticularSearchPageState extends State<ParticularSearchPage> {
  int tab = 0;
  int count = 0;
  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            Row(
              children: [
                SizedBox(width: 20.w),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
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
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Color.fromARGB(255, 16, 27, 1),
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  "Product Details",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                    color: Color.fromARGB(255, 16, 27, 1),
                  ),
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
                SizedBox(width: 6.w),
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
                      Icons.share_outlined,
                      color: Color.fromARGB(255, 16, 27, 1),
                      size: 20.sp,
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
              ],
            ),
            SizedBox(height: 22.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.asset(
                      "assets/detailslip.png",
                      width: 400.w,
                      height: 388.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tab = 0;
                          });
                        },
                        child: ChoiceProduct(
                          image: "assets/detailslip.png",
                          borderColor:
                              tab == 0
                                  ? Color.fromARGB(255, 150, 28, 130)
                                  : Color.fromARGB(25, 0, 0, 0),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tab = 1;
                          });
                        },
                        child: ChoiceProduct(
                          image: "assets/lips.png",
                          borderColor:
                              tab == 1
                                  ? Color.fromARGB(255, 150, 28, 130)
                                  : Color.fromARGB(25, 0, 0, 0),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tab = 2;
                          });
                        },
                        child: ChoiceProduct(
                          image: "assets/lipes.png",
                          borderColor:
                              tab == 2
                                  ? Color.fromARGB(255, 150, 28, 130)
                                  : Color.fromARGB(25, 0, 0, 0),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tab = 3;
                          });
                        },
                        child: ChoiceProduct(
                          image: "assets/lipst.png",
                          borderColor:
                              tab == 3
                                  ? Color.fromARGB(255, 150, 28, 130)
                                  : Color.fromARGB(25, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 26.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Text(
                "Huda Professional Set of 4 Liquid Matte Mini Red Lipsticks (Red Edition) – Long Lasting & Waterproof Combo Pack Of Red, Deep Red, Wine and Pink Shades | For women",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  color: Color.fromARGB(255, 16, 27, 1),
                  letterSpacing: -1.1,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                "\$450.00",
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select quantity",
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 102, 102, 10),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(color: Colors.grey, width: 1.w),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 20.w),
                        GestureDetector(
                          onTap: () {
                            decrement();
                          },
                          child: Text(
                            "-",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25.sp,
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          // "0",
                          count.toString(),
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 25.sp,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            increment();
                          },
                          child: Text(
                            "+",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25.sp,
                            ),
                          ),
                        ),

                        SizedBox(width: 20.w),
                      ],
                    ),
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

class ChoiceProduct extends StatefulWidget {
  final String image;
  final Color borderColor;
  const ChoiceProduct({
    super.key,
    required this.image,
    required this.borderColor,
  });

  @override
  State<ChoiceProduct> createState() => _ChoiceProductState();
}

class _ChoiceProductState extends State<ChoiceProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 93.w,
      height: 82.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: widget.borderColor, width: 1.w),
      ),
      child: Padding(
        padding: EdgeInsets.all(2.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Image.asset(
            // "assets/detailslip.png",
            widget.image,
            width: 93.w,
            height: 82.h,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
