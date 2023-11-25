import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/model/movie_model_class.dart';
import 'package:movie_app/screen/details_page_screen.dart';

class SearchPageScreen extends StatefulWidget {
  const SearchPageScreen({Key? key}) : super(key: key);

  @override
  State<SearchPageScreen> createState() => _SearchPageScreenState();
}

class _SearchPageScreenState extends State<SearchPageScreen> {

  late MovieModelClass movieModelClass;
  List<dynamic> searchAllMovieData = [];
  List<dynamic> changingSearchAllMovieData = [];

  TextEditingController searchController = TextEditingController();
  FocusNode? focusNode = FocusNode();

  Future<dynamic> fetchSearchMovieData (String? searchName) async{
    try {
      var response = await http
          .get(Uri.parse("https://api.tvmaze.com/search/shows?q=$searchName"));

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        //return MovieModelClass.fromJson(data);

        // for (var i in data){
        //   MovieModelClass movieModelClass = MovieModelClass(
        //       score: i["score"],
        //       show: i["show"]
        //   );
        //   allMovieData.add(movieModelClass);
        // }

        //return allMovieData;
        //return data;

        // for(var i in data){
        //   allMovieData.add(MovieModelClass.fromJson(i));
        // }

        // setState(() {
        //   allMovieData = data;
        // });

        setState(() {
          searchAllMovieData = data;
        });
        return searchAllMovieData;
      } else {
        print("unable to fetch data, status code: ${response.statusCode}");
        return searchAllMovieData;
      }
    } catch (e) {
      print(e.toString());
    }
  }


  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        color: Colors.grey[300],
        child: Column(
          children: [

            SizedBox(height: height * 0.05,),

            TextFormField(
              controller: searchController,
              focusNode: focusNode,
              onChanged: (value) async{
                changingSearchAllMovieData = await fetchSearchMovieData(searchController.text.toString().toLowerCase());
                print("foysal+$changingSearchAllMovieData");
                setState(() {

                });
              },

              decoration: InputDecoration(
                hintText: "search a movie",
                prefixIcon:  Icon(Icons.search),
                suffixIcon: IconButton(
                    onPressed: (){
                      searchController.clear();
                      changingSearchAllMovieData = [];
                      focusNode!.unfocus();

                      setState(() {

                      });
                    },
                    icon: Icon(Icons.close, color: Colors.black,)
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 3,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 3,
                  ),
                ),

              ),
            ),

            SizedBox(height: height * 0.05,),


            Expanded(
              child: changingSearchAllMovieData.isNotEmpty ?
                ListView.separated(
                    itemBuilder: (context, index){
                      var dataTest = changingSearchAllMovieData[index]["show"];
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
                                      image: NetworkImage(changingSearchAllMovieData[index]["show"]["image"]["original"]),
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
                                            Text("${changingSearchAllMovieData[index]["show"]["name"]}",
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

                                                Text("${changingSearchAllMovieData[index]["show"]["rating"]["average"]}")
                                              ],
                                            )
                                          ],
                                        ),

                                        SizedBox(height: height * 0.01,),

                                        Text("${changingSearchAllMovieData[index]["show"]["summary"]}",)
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
                    itemCount: changingSearchAllMovieData.length
                )  :
                  //CircularProgressIndicator(),
              Container(
                child: Column(
                  children: [
                    Text("No data Found")
                  ],
                ),
              )
            )

          ],
        ),
      ),
    );
  }
}
