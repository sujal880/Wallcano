import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
class Music extends StatefulWidget{
  @override
  State<Music> createState() => Music_Page();
}

class Music_Page extends State<Music> {
  var arrContent=[
    {
      'image':'https://images.unsplash.com/photo-1511379938547-c1f69419868d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bXVzaWN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    },

    {
      'image':'https://images.unsplash.com/photo-1477233534935-f5e6fe7c1159?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fG11c2ljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'
    },
    {
      'image':'https://images.unsplash.com/photo-1506157786151-b8491531f063?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fG11c2ljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'
    },
    {
      'image':'https://images.unsplash.com/photo-1510915361894-db8b60106cb1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fG11c2ljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'
    },
    {
      'image':'https://images.unsplash.com/photo-1483412033650-1015ddeb83d1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fG11c2ljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'
    },
    {
      'image':'https://images.unsplash.com/photo-1602772576751-f90059b6a8ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aGluZHUlMjBnb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
    },
    {
      'image':'https://images.unsplash.com/photo-1583089892943-e02e5b017b6a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8aGluZHUlMjBnb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
    },
    {
      'image':'https://images.unsplash.com/photo-1616377009507-c8111f07aced?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGhpbmR1JTIwZ29kfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'
    },
    {
      'image':'https://images.unsplash.com/photo-1598194809345-08b8ed2dd30a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGhpbmR1JTIwZ29kfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'
    },

    {
      'image':'https://images.unsplash.com/photo-1642774667024-e9e2f37914d2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bWFoYWRldnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
    },

    {
      'image':'https://images.unsplash.com/photo-1625580916836-1badf2c15b32?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bWFoYWRldnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
    },

    {
      'image':'https://images.unsplash.com/photo-1606967365396-f6b8765c68cb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bWFoYWRldnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
    },

    {
      'image':'https://images.unsplash.com/photo-1631879742133-a0dd6180abf9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8bWFoYWRldnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
    },

    {
      'image':'https://images.unsplash.com/photo-1640951593692-c07262474815?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fG1haGFkZXZ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
    },
    {
      'image':'https://images.unsplash.com/photo-1615482869901-741464444488?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bWFoYWRldnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notification_add_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DynamicHeightGridView(
            itemCount: arrContent.length,
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            builder: (ctx, index) {
              return Container(
                clipBehavior: Clip.antiAlias,
                height: MediaQuery.of(context).size.height*0.3,
                width: MediaQuery.of(context).size.width*0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                //child: Image.asset(arrContent[index]['image']!,fit: BoxFit.cover),
                child: Image.network(arrContent[index]['image']!,fit: BoxFit.cover),
              );
            }
        ),
      ),
    );
  }
}