import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model_class.dart';

class DetailsPageScreen extends StatefulWidget {
   DetailsPageScreen({Key? key,  this.movieModelClass}) : super(key: key);

  Map<String, dynamic>?  movieModelClass;

  @override
  State<DetailsPageScreen> createState() => _DetailsPageScreenState();
}

class _DetailsPageScreenState extends State<DetailsPageScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    dynamic data = widget.movieModelClass;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [

              SizedBox(height: height * 0.05,),

              Text("Details Page",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),

              SizedBox(height: height * 0.05,),

              Row(
                children: [

                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //image: DecorationImage(image: NetworkImage("${widget.movieModelClass!.show!.image!.medium}"),fit: BoxFit.cover
                      image: DecorationImage(image: NetworkImage("${data["image"]["medium"]}"),fit: BoxFit.cover
                        //color: Colors.teal
                      ),
                      //child: Text("${data[""]}"
                    ),
                  ),

                  SizedBox(width: width * 0.05,),

                  Column(
                    children: [
                      Text("${data["name"]}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 22,
                          letterSpacing: 2,
                        ),
                      ),
                      Text("${data["genres"]}",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16,
                          wordSpacing: 4,
                        ),
                      ),

                      Text("${data["status"]}",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16,
                          wordSpacing: 4,
                        ),
                      ),

                      Row(
                        children: [
                          Text("Run Time: ${data["runtime"]}",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16,
                              wordSpacing: 4,
                            ),
                          ),

                          SizedBox(width: width * 0.05,),

                          Text("Average : ${data["averageRuntime"]}",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16,
                              wordSpacing: 4,
                            ),
                          ),
                        ],
                      )
                    ],
                  )

                ],
              ),

              SizedBox(height: height * 0.03,),

              Stack(
                children: [
                  Container(
                    // margin: EdgeInsets.only(
                    //   left: 20,
                    //   right: 20,
                    // ),
                    height: height * 0.25,
                    width: double.infinity,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      //color: Colors.teal,
                      image: DecorationImage(image: NetworkImage("${data["image"]["original"]}"), fit: BoxFit.cover, opacity: 0.4),
                    ),

                  ),

                  Positioned(
                      top: 70,
                      right: 150,
                      child: Icon(Icons.play_arrow, color: Colors.black,size: 70,)
                  ),

                  Positioned(
                    top: 130,
                    right: 120,
                    //child: Icon(Icons.play_arrow, color: Colors.black,size: 70,)
                    child: Text("watch trailer",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 22
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.03,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Overview",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 22,
                      letterSpacing: 2,
                    ),
                  ),

                  Row(
                    children: [
                      Icon(Icons.star,size: 30,color: Colors.orange,),

                      SizedBox(width: width * 0.02,),

                      Text("${data["rating"]["average"]}",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 18,
                          letterSpacing: 2,
                        ),
                      )
                    ],
                  ),

                ],
              ),

              SizedBox(height: height * 0.03,),

              Text("${data["summary"]}",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
              ),

              SizedBox(height: height * 0.02,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("Premiere: ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                      ),

                      Text("${data["premiered"]}",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Ended: ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text("${data["ended"]}",
                        style: TextStyle(
                          fontSize: 16,
                          // color: Colors.black87,
                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(height: height * 0.02,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Official website: ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Text("${data["officialSite"]}",
                  ),
                ],
              ),

              SizedBox(height: height * 0.02,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("IMDB S.No: ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      Text("${data["externals"]["imdb"]}",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("TheTVDB S.No: ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text("${data["externals"]["thetvdb"]}",
                        style: TextStyle(
                          fontSize: 16,
                          // color: Colors.black87,
                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(height: height * 0.02,),

              Row(
                children: [
                  
                  Text("Release day: ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  
                  Text("${data["schedule"]["time"]} " + "${data["schedule"]["days"]}")
                ],
              ),

              SizedBox(height: height * 0.02,),

              Row(
                children: [

                  Text("Broadcasting Company: ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Text("${data["network"]["name"]} "),
                ],
              ),

              SizedBox(height: height * 0.02,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: [

                      Text("Origin: ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      Text("${data["network"]["country"]["name"]} ")
                    ],
                  ),

                  Row(
                    children: [

                      Text("Countrycode: ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      Text("${data["network"]["country"]["code"]} ")
                    ],
                  ),
                ],
              ),

              SizedBox(height: height * 0.02,),

              Row(
                children: [

                  Text("TimeZone: ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Text("${data["network"]["country"]["timezone"]} ")
                ],
              ),

              SizedBox(height: height * 0.02,),
            ],
          ),
        )
      ),
    );
  }
}
