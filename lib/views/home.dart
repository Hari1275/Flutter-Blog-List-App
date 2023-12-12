import 'package:blog_list/views/models/news_model.dart';
import 'package:blog_list/views/services/api_service.dart';
import 'package:blog_list/views/widget/card.dart';
import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  NewsApi client = NewsApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            title: const Text('Popular News'),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.add))
            ],
          ),
          SliverToBoxAdapter(
              child: Container(
            height: 1000,
            child: FutureBuilder(
              future: client.getArticle(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Article>> snapshot) {
                if (snapshot.hasData) {
                  List<Article> articles = snapshot.data!;
                  return ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) =>
                          customListTile(articles[index], context));
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
