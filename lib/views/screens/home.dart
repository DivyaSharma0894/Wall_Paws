import 'package:flutter/material.dart';
import 'package:wallpaper_deep/controller/apiOpera.dart';
import 'package:wallpaper_deep/views/screens/Fullscreen.dart';
import 'package:wallpaper_deep/views/widgets/CustomAppBar.dart';
import 'package:wallpaper_deep/views/widgets/catblock.dart';
import 'package:wallpaper_deep/views/widgets/serchBar.dart';

import '../../model/photosModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   List<PhotosModel> trendingWallList =[];



  GetTrendingWallpapers() async{

    trendingWallList = await ApiOperations.getTrendingWallpapers();

    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetTrendingWallpapers();

    ApiOperations.getTrendingWallpapers();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: CustomAppBar(),
      ),

      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SearchBar()),

          /*ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount : 30 ,itemBuilder: (context , index) => Catblock())
*/
          Container(
            margin: EdgeInsets.symmetric(vertical: 20,),
            child: SizedBox(
                height: 50,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 30, itemBuilder: ((context, index) => Catblock()))
            ),
          ),


          Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            height: 700,
            child: GridView.builder(
                physics: BouncingScrollPhysics(),

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 400,
              crossAxisCount :2,
              crossAxisSpacing: 13,
              mainAxisSpacing: 10,


            ),
                itemCount: trendingWallList.length,
                itemBuilder: ((context, index) => GridTile(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context)=>FullScreen(imgUrl:
                              trendingWallList[index].imgSrc )));
                    },
                    child: Hero(
                      tag: trendingWallList[index].imgSrc,
                      child: Container(
              height: 700,
              width: 50,
              decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(20)),


                        child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                              height: 800,
                              width: 50,
                              fit : BoxFit.cover,
                              trendingWallList[index].imgSrc),
                        ),
            ),
                    ),
                  ),
                ))),
          )

        ],),
      ),

    );
  }
}
