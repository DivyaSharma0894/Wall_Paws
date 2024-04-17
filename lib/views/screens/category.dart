import 'package:flutter/material.dart';
import 'package:wallpaper_deep/controller/apiOpera.dart';
import 'package:wallpaper_deep/views/widgets/CustomAppBar.dart';
import 'package:wallpaper_deep/views/widgets/catblock.dart';
import 'package:wallpaper_deep/views/widgets/serchBar.dart';

import '../../model/photosModel.dart';
import 'Fullscreen.dart';

class CategoryScreen extends StatefulWidget {
  String query;
  CategoryScreen({super.key ,required this.query});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
   List<PhotosModel> categoryResults =[];

   GetCatRelWall() async{
     categoryResults =await ApiOperations.searchWallpapers(widget.query);

     setState(() {

     });
   }
  @override
  void initState() {
    // TODO: implement initState
    GetCatRelWall();
    super.initState();
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

          Stack(
            children: [
              Image.network(
                  height: 150,
                  width : MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,

                  "https://images.pexels.com/photos/12784538/pexels-photo-12784538.jpeg?auto=compress&cs=tinysrgb&w=600"),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              color: Colors.black38,
            ),

              Positioned(
                left: 160,
                top: 40,
                child: Column(
                  children: [
                    Text("Category", style: TextStyle(fontSize: 15 , color: Colors.white, fontWeight: FontWeight.w300),),
                    Text("Mountains",style: TextStyle(fontSize: 30 , color: Colors.white, fontWeight: FontWeight.w600),),
                  ],
                ),
              )

            ],
          ),

          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 400,
                  crossAxisCount :2,
                  crossAxisSpacing: 13,
                  mainAxisSpacing: 10,


                ),
                itemCount: categoryResults.length,
                itemBuilder: ((context, index) => GridTile(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context)=>FullScreen(imgUrl:
                              categoryResults[index].imgSrc )));
                    },
                    child: Hero(
                      tag:categoryResults[index].imgSrc,
                      child: Container(
                        height: 700,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.amberAccent,
                            borderRadius: BorderRadius.circular(20)),


                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                              height: 700,
                              width: 50,
                              fit : BoxFit.cover,
                              categoryResults[index].imgSrc),
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
