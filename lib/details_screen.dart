import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course_ui/constans.dart';
import 'package:online_course_ui/main.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Color(0xFFF5F4EF),
            image: DecorationImage(
                image: AssetImage('assets/images/ux_big.png'),
                alignment: Alignment.topRight)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 50, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Icon(
                          Icons.chevron_left,
                          size: 30,
                        ),
                        onTap: (){
                          Navigator.push(context,
                          MaterialPageRoute(builder:(context)=>HomePage()));
                        },
                      ),
                      Icon(Icons.more_vert)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ClipPath(
                    clipper: BestSellerClipper(),
                    child: Container(
                      color: kBestSellerColor,
                      padding: EdgeInsets.only(
                          left: 10, top: 5, right: 20, bottom: 5),
                      child: Text(
                        "BestSeller".toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Design Thinking",
                    style: kHeadingextStyle,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/person.svg"),
                      SizedBox(
                        width: 5,
                      ),
                      Text("18K"),
                      SizedBox(
                        width: 20,
                      ),
                      SvgPicture.asset("assets/icons/star.svg"),
                      SizedBox(
                        width: 5,
                      ),
                      Text("4.8")
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "\$50 ",
                        style: kHeadingextStyle.copyWith(fontSize: 32)),
                    TextSpan(
                        text: "\$70",
                        style: TextStyle(
                            color: kTextColor.withOpacity(.5),
                            decoration: TextDecoration.lineThrough))
                  ]))
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                      bottomRight: Radius.zero,
                      bottomLeft: Radius.zero),
                  color: Colors.white),
              child: Stack(
                children: [
                  Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Course Content",
                        style: kTitleTextStyle,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CourseContent(
                        "01",
                        5.35,
                        "Welcome to the course",
                        true
                      ),
                      CourseContent(
                          "02",
                          19.04,
                          "Design Thinking - Intro",
                          true
                      ),
                      CourseContent(
                          "03",
                          15.35,
                          "Design Thinking Process",
                          false
                      ),
                      CourseContent(
                          "04",
                          5.35,
                          "Customer Perspective",
                          false
                      )
                    ],
                  ),
                ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Container(
                      height: 75,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),bottomLeft: Radius.zero,bottomRight: Radius.zero),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0,4),
                            blurRadius: 50,
                            color: kTextColor.withOpacity(.2)
                          )
                        ]
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(14),
                            padding: EdgeInsets.all(8),
                            height: 40,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFEDEE),
                              borderRadius: BorderRadius.circular(40)
                            ),
                            child: SvgPicture.asset("assets/icons/shopping-bag.svg"),
                          ),
                          Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(right: 14),
                                height: 40,
                                decoration: BoxDecoration(
                                  color: kBlueColor,
                                  borderRadius: BorderRadius.circular(40)
                                ),
                                child: Text(
                                  "Buy Now",
                                  style: kSubTitleTextStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              )
                          )
                        ],
                      ),
                    ),
                  )
              ]
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class CourseContent extends StatelessWidget{
  final String number;
  final double duration;
  final String title;
  final bool isDone;
  const CourseContent(
      this.number,
      this.duration,
      this.title,
      this.isDone,
) ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Text(
            number,
            style: kHeadingextStyle.copyWith(
                color: kTextColor.withOpacity(.15), fontSize: 32),
          ),
          SizedBox(
            width: 20,
          ),
          RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "$duration min\n",
                    style: TextStyle(
                        color: kTextColor.withOpacity(.5),
                        fontSize: 18)),
                TextSpan(
                    text: title,
                    style: kSubTitleTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        height: 1.5
                    )
                )
              ])),
          Spacer(),
          Container(
            margin: EdgeInsets.only(left: 20),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kGreenColor.withOpacity(isDone ?1: .5)
            ),
            child: Icon(Icons.play_arrow, color: Colors.white,),
          )
        ],
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
