import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
class God extends StatefulWidget{
  @override
  State<God> createState() => God_Page();
}

class God_Page extends State<God> {
  var arrContent=[
    {
      'image':'https://images.unsplash.com/photo-1612840540277-f5a8284bdc5f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80',
    },

    {
      'image':'https://images.unsplash.com/photo-1566890910598-c5768889e83e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aGluZHUlMjBnb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
    },
    {
      'image':'https://images.unsplash.com/photo-1598090216740-eb040d8c3f82?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aGluZHUlMjBnb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
    },
    {
      'image':'https://images.unsplash.com/photo-1607604760190-ec9ccc12156e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8aGluZHUlMjBnb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
    },
    {
      'image':'https://images.unsplash.com/photo-1567591370504-80142b28f1c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aGluZHUlMjBnb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
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
        title: Text('God'),
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