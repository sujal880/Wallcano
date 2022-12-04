import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/wallpaper.dart';
import 'package:wallpaper_live/wallpaper_home.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';
class DetailPage extends StatelessWidget{
  var Photos;
  DetailPage(this.Photos);
  late Stream<String> progressString;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(Photos,fit: BoxFit.cover),
          ),
          Positioned(
            top:MediaQuery.of(context).size.width*1.9/1,
            left: MediaQuery.of(context).size.width*0.250,
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue
                  ),
                  child: Icon(Icons.download,color: Colors.white,size: 20),
                ),
                SizedBox(width: 20),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red
                  ),
                  child: Icon(Icons.lock,size: 20,color: Colors.white),
                ),
                SizedBox(width: 20),
                InkWell(onTap: ()async{
                  prepareWallpaper(Photos, context);
                },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.cyan
                    ),
                    child: Icon(Icons.home,size: 20,color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ]
      )
    );
  }
  void prepareWallpaper(String url,BuildContext context){
    progressString=Wallpaper.imageDownloadProgress(url);
    progressString.listen((data) {
      print('Data Received$data');
    },onDone: (){
      print('Download Complete');
      setWallpaper(context);
    },onError: (error){print(error);});
  }
}

void LockSceeen(BuildContext context)async{
  var width=MediaQuery.of(context).size.width;
  var height=MediaQuery.of(context).size.height;

  await Wallpaper.lockScreen(
    options: RequestSizeOptions.RESIZE_FIT,
    width: width,
    height: height
  );
}

void setWallpaper(BuildContext context)async{
  var width=MediaQuery.of(context).size.width;
  var height=MediaQuery.of(context).size.height;

  await Wallpaper.homeScreen(
    options:RequestSizeOptions.RESIZE_FIT,
    width:width,
    height:height,
  );
  showDialog(context: context, builder: (BuildContext context){
    return AlertDialog(
     title: Text('Your Wallpaper Set Successfully!!'),
     actions: [
       TextButton(onPressed: (){
         Navigator.push(context,MaterialPageRoute(builder: (context)=>Wallpapers()));
       }, child: Text('Ok'))
     ],
    );
  });

}