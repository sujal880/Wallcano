import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Red extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Red',style: TextStyle(color: Colors.white)),backgroundColor: Colors.red,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notification_add_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: GridView.count(crossAxisCount: 3,mainAxisSpacing: 4.0,crossAxisSpacing: 3.0,children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12)
            ),
            child:Image.asset('assets/images/pexels-adonyi-gábor-1558916.jpg',fit:BoxFit.cover)
          ),
          Container(
              height: 400,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
              ),
              child:Image.asset('assets/images/pexels-artem-saranin-1547813.jpg',fit:BoxFit.cover)
          ),
          Container(
              height: 400,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
              ),
              child:Image.asset('assets/images/pexels-chevanon-photography-325044.jpg',fit:BoxFit.cover)
          ),Container(
              height: 400,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
              ),
              child:Image.asset('assets/images/pexels-engin-akyurt-1493226.jpg',fit:BoxFit.cover)
          ),
          Container(
              height: 400,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
              ),
              child:Image.asset('assets/images/pexels-lisa-fotios-1943232.jpg',fit:BoxFit.cover)
          ),Container(
              height: 400,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
              ),
              child:Image.asset('assets/images/pexels-pixabay-73873.jpg',fit:BoxFit.cover)
          ),Container(
              height: 400,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
              ),
              child:Image.asset('assets/images/pexels-pixabay-158826.jpg',fit:BoxFit.cover)
          ),
          Container(
              height: 400,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
              ),
              child:Image.asset('assets/images/pexels-scott-webb-532563.jpg',fit:BoxFit.cover)
          )
        ],),
      )
    );
  }
}

class Blue extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(tag: 'blue',
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.blue,
        ),
      ),
    );
  }

}
class Green extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(tag: 'green',
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.green,
        ),
      ),
    );
  }
}

class Pink extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(tag: 'pink',
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.pink,
        ),
      ),
    );
  }
}

class Purple extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(tag: 'purple',
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.purple,
        ),
      ),
    );
  }

}

class Black extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(tag: 'black',
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black,
        ),
      ),
    );
  }
}

class GreenAccent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(tag: 'greenaccent',
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.greenAccent,
        ),
      ),
    );
  }

}
class Cyan extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(tag: 'cyan',
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.cyan,
        ),
      ),
    );
  }

}