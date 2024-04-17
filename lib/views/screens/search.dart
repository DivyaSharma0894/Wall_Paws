import 'package:flutter/material.dart';
import 'package:wallpaper_deep/controller/apiOpera.dart';
import 'package:wallpaper_deep/model/photosModel.dart';
import 'package:wallpaper_deep/views/widgets/CustomAppBar.dart';
import 'package:wallpaper_deep/views/widgets/catblock.dart';
import 'package:wallpaper_deep/views/widgets/serchBar.dart';

import 'Fullscreen.dart';

class SearchScreen extends StatefulWidget {
  String query;
   SearchScreen({super.key ,required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
    List<PhotosModel> searchResults =[] ;

  GetSearchResults() async {

    searchResults= await ApiOperations.searchWallpapers(widget.query);

    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetSearchResults();
  }
  @override
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
          SizedBox(height: 10,),
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
                itemCount: searchResults.length,
                itemBuilder: ((context, index) => GridTile(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context)=>FullScreen(imgUrl:
                              searchResults[index].imgSrc )));
                    },
                    child: Hero(
                      tag:searchResults[index].imgSrc ,
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
                              searchResults[index].imgSrc),
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
