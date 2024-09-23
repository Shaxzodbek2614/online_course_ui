import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_course_ui/category.dart';
import 'package:online_course_ui/constans.dart';
import 'package:online_course_ui/details_screen.dart';

void main() {
  runApp(const MyApp() as Widget);
}

class MyApp extends StatelessWidget{
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Course app",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.only(left: 20,top: 50,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("assets/icons/menu.svg"),
                Image.asset("assets/images/user.png")
              ],
            ),
            SizedBox(height: 30),
            Text("Hey Alex",style: kHeadingextStyle,),
            Text("Find a course you want to learn",style: kSubheadingextStyle,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 16),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(40)
              ),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/search.svg"),
                  SizedBox(width: 16,),
                  Text("Search for anything",style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFA0A5BD)
                  ),)
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Category",style: kTitleTextStyle,),
                Text(
                  "See All",
                  style: kSubTitleTextStyle.copyWith(color: kBlueColor),
                )
              ],
            ),
            SizedBox(height: 30,),
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.all(0),
                  crossAxisCount: 2,
                  itemCount: categories.length,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: () {
                        // Masalan, DetailsScreen sahifasiga o'tkazish
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: index.isEven ? 200:240,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image:AssetImage(categories[index].image),
                            fit: BoxFit.fill
                          )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(categories[index].name,
                            style: kTitleTextStyle,),
                            Text("${categories[index].numOfCourse} Courses",
                            style: TextStyle(
                              color: kTextColor.withOpacity(.5)
                            ),)
                          ],
                        ),
                      ),
                    );
                  },
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1)
              ),
            )
          ],
        ),
      ),
    );
  }
}


