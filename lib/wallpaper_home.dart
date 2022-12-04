//Wap in Flutter To Design A Wallpaper Application
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_live/detail_page.dart';
import 'package:wallpaper_live/color.dart';
import 'package:wallpaper_live/god_wallpaper.dart';
import 'package:wallpaper_live/photos_model.dart';
import 'package:wallpaper_live/travel_wallpaper.dart';
import 'package:wallpaper_live/wallpaper_model.dart';
import 'package:http/http.dart' as http;
import 'music_wallpaper.dart';
import 'nature_wallpaper.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

main(){
  runApp(My_App());
}
class My_App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Wallpapers(),
    );
  }
}
class Wallpapers extends StatefulWidget{
  @override
  State<Wallpapers> createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpapers> {
  var myKey="563492ad6f917000010000014276de82636b417392addf236e34b96d";
  var searchController=TextEditingController();
  late Future<WallpaperModel> wallpaper;
  late Future<PhotosModel> photo;
  bool _check=false;
  @override
  void initState() {
    super.initState();
    wallpaper=getWallpaper('Lion');
    photo=getPhotos();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallcano'),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              _check=!_check;
              _check ? AdaptiveTheme.of(context).setLight() : AdaptiveTheme.of(context).setDark();
            });
          }, icon: _check ? Icon(Icons.sunny) : Icon(Icons.shield_moon)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.025),
            Padding(
              padding: const EdgeInsetsDirectional.only(start:20,end: 20),
              child: TextField(
                controller: searchController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: 'Search',
                  suffixIcon: InkWell(onTap: (){
                    wallpaper=getWallpaper(searchController.text.toString());
                    setState(() {
                    });
                  },
                      child: Icon(Icons.search)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)
                  ),

                ),
              ),
            ),
            SizedBox(height:MediaQuery.of(context).size.height*0.05),
            FutureBuilder<WallpaperModel>(
             future: wallpaper,
              builder: (context,snapshot){
               if(snapshot.hasData){
                 return  SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                   child: Row(
                     children:snapshot.data!.photos!.map((photoData) =>
                       InkWell(onTap: (){
                         Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailPage(photoData.src!.portrait)));
                       },
                         child: Padding(
                           padding: const EdgeInsetsDirectional.only(start:20,end: 4),
                           child: Card(
                             elevation: 20,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(20)
                             ),
                             child: Container(
                               clipBehavior: Clip.antiAlias,
                               height: MediaQuery.of(context).size.height*0.3,
                               width: MediaQuery.of(context).size.width*0.4,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                               ),
                               child: Image.network('${photoData.src!.portrait}',fit: BoxFit.fill)
                             ),
                           ),
                         ),
                       ),
                     ).toList()
                   )
                 );
               }
               else if(snapshot.hasError){
                 print('Error${snapshot.hasError}');
               }
               return CircularProgressIndicator();
              }
            ),
            SizedBox(height:MediaQuery.of(context).size.height*0.040),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width*0.070),
                Text('The Color Tone',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height:MediaQuery.of(context).size.height*0.020),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width*0.070),
                  InkWell(onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Red()));
                  },
                    child: Hero(tag: 'red',
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.06,
                        width: MediaQuery.of(context).size.width*0.14,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.027),
                  InkWell(onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Blue()));
                  },
                    child: Hero(tag: 'blue',
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.06,
                        width: MediaQuery.of(context).size.width*0.14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.027),
                  InkWell(onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Green()));
                  },
                    child: Hero(tag: 'green',
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.06,
                        width: MediaQuery.of(context).size.width*0.14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.027),
                  InkWell(onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Pink()));
                  },
                    child: Hero(tag: 'pink',
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.06,
                        width: MediaQuery.of(context).size.width*0.14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.pink
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.027),
                  InkWell(onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Purple()));
                  },
                    child: Hero(tag: 'purple',
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.06,
                        width: MediaQuery.of(context).size.width*0.14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.purple
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.027),
                  InkWell(onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Black()));
                  },
                    child: Hero(tag: 'black',
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.06,
                        width: MediaQuery.of(context).size.width*0.14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.027),
                  InkWell(onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>GreenAccent()));
                  },
                    child: Hero(tag: 'greenaccent',
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.06,
                        width: MediaQuery.of(context).size.width*0.14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.greenAccent
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.027),
                  InkWell(onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Cyan()));
                  },
                    child: Hero(tag: 'cyan',
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.06,
                        width: MediaQuery.of(context).size.width*0.14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.cyan
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.027),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.036),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width*0.070),
                Text('Categories',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              ],
            ),
            SizedBox(height:MediaQuery.of(context).size.height*0.020),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width*0.0600),
                  Stack(
                    children:[
                      Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: InkWell(onTap:(){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>Nature()));
                        },
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: MediaQuery.of(context).size.height*0.2546,
                            width: MediaQuery.of(context).size.width*0.464,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.asset('assets/images/pexels-tausif-hossain-1226302.jpg',fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.width*0.460,
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.0400,
                          width:MediaQuery.of(context).size.width*0.469,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                            color: Colors.white10
                          ),
                          child: Center(child: Text('𝐍𝐚𝐭𝐮𝐫𝐞',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white)),),
                        ),
                      )]
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.0400),
                  Stack(
                      children:[
                        Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: InkWell(onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>God()));
                          },
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              height: MediaQuery.of(context).size.height*0.2546,
                              width: MediaQuery.of(context).size.width*0.464,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.asset('assets/images/pexels-lucas-pezeta-2280845.jpg',fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.width*0.460,
                          child: InkWell(onTap:(){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>God()));
                          },
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.0400,
                              width:MediaQuery.of(context).size.width*0.469,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                                  color: Colors.white10
                              ),
                              child: Center(child: Text('𝐆𝐨𝐝',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white)),),
                            ),
                          ),
                        )]
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.0400),
                  Stack(
                      children:[
                        Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: InkWell(onTap:(){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Travel()));
                          },
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              height: MediaQuery.of(context).size.height*0.2546,
                              width: MediaQuery.of(context).size.width*0.464,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.asset('assets/images/pexels-pierre-blaché-2901209.jpg',fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.width*0.460,
                          child: InkWell(onTap:(){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Travel()));
                          },
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.0400,
                              width:MediaQuery.of(context).size.width*0.469,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                                  color: Colors.white10
                              ),
                              child: Center(child: Text('𝐓𝐫𝐚𝐯𝐞𝐥',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white)),),
                            ),
                          ),
                        )]
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.0400),
                  Stack(
                      children:[
                        Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: InkWell(onTap:(){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Music()));
                          },
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              height: MediaQuery.of(context).size.height*0.2546,
                              width: MediaQuery.of(context).size.width*0.464,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.asset('assets/images/pexels-vlad-bagacian-1337753.jpg',fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.width*0.460,
                          child: InkWell(onTap:(){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Music()));
                          },
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.0400,
                              width:MediaQuery.of(context).size.width*0.469,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                                  color: Colors.white10
                              ),
                              child: Center(child: Text('𝐌𝐮𝐬𝐢𝐜',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white)),),
                            ),
                          ),
                        ),
      ]
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.0300)

                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.030),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width*0.070),
                Text('Recommended',style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.0700),),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.0200),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width*0.070),
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9)
                    ),
                    child: Stack(
                      children:[
                        Container(
                          clipBehavior: Clip.antiAlias,
                          height: MediaQuery.of(context).size.height*0.2546,
                          width: MediaQuery.of(context).size.width*0.464,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset('assets/images/pexels-thgusstavo-santana-2607554.jpg',fit: BoxFit.cover),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.width*0.460,
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.0400,
                            width:MediaQuery.of(context).size.width*0.469,
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                            ),
                            child: Center(child: Text('𝐁𝐢𝐤𝐞𝐬',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),),
                          ),
                        )
                      ]
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.040),
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9)
                    ),
                    child: Stack(
                        children:[
                          Container(
                            clipBehavior: Clip.antiAlias,
                            height: MediaQuery.of(context).size.height*0.2546,
                            width: MediaQuery.of(context).size.width*0.464,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset('assets/images/marcus-p-oUBjd22gF6w-unsplash.jpg',fit: BoxFit.cover),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.width*0.460,
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.0400,
                              width:MediaQuery.of(context).size.width*0.469,
                              decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                              ),
                              child: Center(child: Text('𝐂𝐚𝐫𝐬',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),),
                            ),
                          )
                        ]
                    ),

                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.040),
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9)
                    ),
                    child: Stack(
                        children:[
                          Container(
                            clipBehavior: Clip.antiAlias,
                            height: MediaQuery.of(context).size.height*0.2546,
                            width: MediaQuery.of(context).size.width*0.464,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset('assets/images/keyur-nandaniya-B0VdY1ydF-Q-unsplash.jpg',fit: BoxFit.cover),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.width*0.460,
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.0400,
                              width:MediaQuery.of(context).size.width*0.469,
                              decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                              ),
                              child: Center(child: Text('𝐀𝐧𝐢𝐦𝐚𝐥𝐬',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),),
                            ),
                          )
                        ]
                    ),

                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.040),
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9)
                    ),
                    child: Stack(
                        children:[
                          Container(
                            clipBehavior: Clip.antiAlias,
                            height: MediaQuery.of(context).size.height*0.2546,
                            width: MediaQuery.of(context).size.width*0.464,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset('assets/images/timon-klauser-3MAmj1ZKSZA-unsplash.jpg',fit: BoxFit.cover),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.width*0.460,
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.0400,
                              width:MediaQuery.of(context).size.width*0.469,
                              decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                              ),
                              child: Center(child: Text('𝐀𝐫𝐭',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),),
                            ),
                          )
                        ]
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.0300)
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.030),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width*0.070),
                Text('Crazy Visuals',style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.0700),),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.0200),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width*0.070),
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9)
                    ),
                    child: Stack(
                        children:[
                          Container(
                            clipBehavior: Clip.antiAlias,
                            height: MediaQuery.of(context).size.height*0.2546,
                            width: MediaQuery.of(context).size.width*0.464,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset('assets/images/pexels-lucie-liz-3165335.jpg',fit: BoxFit.cover),
                          ),
                          Positioned(
                            top:178,
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.0400,
                              width:MediaQuery.of(context).size.width*0.469,
                              decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                              ),
                              child: Center(child: Text('𝐆𝐚𝐦𝐢𝐧𝐠',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),),
                            ),
                          )
                        ]
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.040),
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9)
                    ),
                    child: Stack(
                        children:[
                          Container(
                            clipBehavior: Clip.antiAlias,
                            height: MediaQuery.of(context).size.height*0.2546,
                            width: MediaQuery.of(context).size.width*0.464,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset('assets/images/andrew-de-leon--uWiIajRN0s-unsplash.jpg',fit: BoxFit.cover),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.width*0.450,
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.0400,
                              width:MediaQuery.of(context).size.width*0.469,
                              decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                              ),
                              child: Center(child: Text('𝐀𝐧𝐢𝐦𝐞',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),),
                            ),
                          )
                        ]
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.040),
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9)
                    ),
                    child: Stack(
                        children:[
                          Container(
                            clipBehavior: Clip.antiAlias,
                            height: MediaQuery.of(context).size.height*0.2546,
                            width: MediaQuery.of(context).size.width*0.464,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset('assets/images/valentin-beauvais-yVUQlyRlJSw-unsplash.jpg',fit: BoxFit.cover),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.width*0.460,
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.0400,
                              width:MediaQuery.of(context).size.width*0.469,
                              decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                              ),
                              child: Center(child: Text('𝐀𝐧𝐢𝐦𝐞',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),),
                            ),
                          )
                        ]
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.0300)
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.0300)
          ],
        ),
      ),
    );
  }
  Future<WallpaperModel> getWallpaper(String mysearch) async{
    var myURL="https://api.pexels.com/v1/search?query=$mysearch";
    var response=await http.get(Uri.parse(myURL),headers: {'Authorization':myKey});
    if(response.statusCode==200){
      var wallpapers=jsonDecode(response.body);
      return WallpaperModel.fromJson(wallpapers);
    }
    else{
      showDialog(context: context, builder: (BuildContext Context){
        return AlertDialog(
          title: Text('Cant Fetch The API${response.statusCode}'),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Ok'))
          ],
        );
      });
      return WallpaperModel();
    }
  }
  Future<PhotosModel> getPhotos()async{
    var URL="https://api.pexels.com/v1/photos/2014422";
    var response=await http.get(Uri.parse(URL),headers: {'Authorization':myKey});
    if(response.statusCode==200){
      var photos=json.decode(response.body);
      return PhotosModel.fromJson(photos);
    }
    else{
      showDialog(context: context, builder: (BuildContext Context){
        return AlertDialog(
          title: Text('Cant Fetch The API${response.statusCode}'),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Ok'))
          ],
        );
      });
      return PhotosModel();
    }

  }
}