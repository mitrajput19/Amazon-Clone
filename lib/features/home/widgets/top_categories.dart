import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/home/screens/category_deals_screen.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({Key? key}) : super(key: key);

  navigateToCatogoryPage(BuildContext context,String category){
    Navigator.pushNamed(context, CategoryDealsScreen.routeName, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.builder(
          itemCount: GlobalVariables.categoryImages.length,
          scrollDirection: Axis.horizontal,
          itemExtent: 75,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => navigateToCatogoryPage(context,GlobalVariables.categoryImages[index]['title']!),
              child: Column(
                children: [
                  SizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        GlobalVariables.categoryImages[index]["image"]!,
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    GlobalVariables.categoryImages[index]["title"]!,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            );
          }),
    );
  }
}
