import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/model/movie_model_class.dart';
import 'package:movie_app/screen/details_page_screen.dart';
import 'package:movie_app/widget/custom_http_class.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late MovieModelClass movieModelClass;
  List<dynamic> allMovieData = [];

//var data = movieModelClass;

  @override
  void initState() {
    // TODO: implement initState
    fetchAllMovieData();
    super.initState();
  }

  Future<void> fetchAllMovieData() async {
    try {
      var response = await http
          .get(Uri.parse("https://api.tvmaze.com/search/shows?q=all"));

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        setState(() {
          allMovieData = data;
        });
      } else {
        print("unable to fetch data, status code: ${response.statusCode}");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            left: 10,
            right: 10
        ),
        color: Colors.grey[300],
        child: Column(
          children: [

            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  reverse: false,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,index){
                    var dataTest = allMovieData[index]["show"];
                          return InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsPageScreen(
                                //movieModelClass: allMovieData[index],
                                movieModelClass: dataTest,
                              )));
                            },
                            child: Stack(
                              children: [
                                Container(
                                  height: 500,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(35),
                                        topRight: Radius.circular(35),
                                        bottomLeft: Radius.circular(35),
                                        bottomRight: Radius.circular(35),
                                      ),
                                      //image: DecorationImage(image: NetworkImage(snapshot.data![index].show!.image!.original!),fit: BoxFit.cover),
                                      //image: DecorationImage(image: NetworkImage(allMovieData[index].show!.image!.original!),fit: BoxFit.cover),
                                      image: DecorationImage(
                                          image: NetworkImage(allMovieData[index]["show"]["image"]["original"]),
                                          fit: BoxFit.cover)),
                                ),
                                Positioned(
                                    bottom: 1,
                                    //right: 50,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        left: 15,
                                        top: 15,
                                        right: 10
                                      ),
                                      height: 150,
                                      width: 400,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(35),
                                          topRight: Radius.circular(35),
                                          bottomLeft: Radius.circular(35),
                                          bottomRight: Radius.circular(35),
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text("${allMovieData[index]["show"]["name"]}",
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                ),
                                                
                                                Row(
                                                  children: [
                                                    Icon(Icons.star, color: Colors.orange,),
                                                    
                                                    SizedBox(width: width * 0.01,),
                                                    
                                                    Text("${allMovieData[index]["show"]["rating"]["average"]}")
                                                  ],
                                                )
                                              ],
                                            ),

                                            SizedBox(height: height * 0.01,),

                                            Text("${allMovieData[index]["show"]["summary"]}",)
                                          ],
                                        ),
                                      ),
                                    )
                                )
                              ],
                            ),
                          );
                  },
                  separatorBuilder: (_,index){
                    return SizedBox(
                      height: height * 0.05,
                    );
                  },
                  itemCount: allMovieData.length
              ),
            ),
          ],
        ),
      ),
    );
  }
}
