import 'package:flutter/material.dart';

class  ItemService extends StatelessWidget{
  final String title,image;
  const ItemService({Key? key, required this.title, required this.image})  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5) ,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Theme.of(context).colorScheme.primary.withOpacity(.2),
              spreadRadius: 8,
              blurRadius: 8
          )
        ]

    ),
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            shape: BoxShape.circle
             // color: Theme.of(context).colorScheme.primary.withOpacity(.1)
         ),
            child: Image.asset(image, width: 40, height: 40),
        ),
        const SizedBox(height: 5),
        Text(title, style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center)


  ],
  ),

    );
  }
}