import 'package:api_vidio/models/respose_news.dart';
import 'package:api_vidio/network/net_client.dart';
import 'package:api_vidio/pages/widget/my_list_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> EndPointPages = [
    'cnn',
    'cnbc',
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CNN'),
        backgroundColor: Colors.grey.shade400,
        elevation: 10,
        shadowColor: Colors.grey.shade300,
      ),
      body: FutureBuilder(
        future: NetClient().fetchNews(
          newsEndpoint: '${EndPointPages[_currentPage]}-news',
        ),
        builder: (BuildContext context, AsyncSnapshot<ResposeNews> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          } else {
            final news = snapshot.data!.data!;
            return MyListView(
              news: news,
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (value) => setState(() => _currentPage = value),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.newspaper,
            ),
            label: 'CNN',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.newspaper,
            ),
            label: 'CNBC',
          ),
        ],
      ),
    );
  }
}
