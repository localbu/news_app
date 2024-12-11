import 'package:api_vidio/models/news.dart';
import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  const MyListView({
    super.key,
    required this.news,
  });
    final List<Data> news;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
         
        return SizedBox(
          height: 10,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Stack(
              children: [
                // image container
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        news[index].image!.large!
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // text container
                Positioned(
                  bottom: 5,
                  left: 5,
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        news[index].title!,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
