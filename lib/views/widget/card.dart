import 'package:blog_list/views/models/news_model.dart';
import 'package:blog_list/views/models/screenPage/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// class CardList extends StatelessWidget {

//   const CardList(
//       {Key? key,
//      })
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
//       width: MediaQuery.of(context).size.width,
//       height: 180,
//       decoration: BoxDecoration(
//         color: Colors.black,
//         borderRadius: BorderRadius.circular(5),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.6),
//             offset: const Offset(
//               0.0,
//               10.0,
//             ),
//             blurRadius: 10.0,
//             spreadRadius: -6.0,
//           ),
//         ],
//         image: DecorationImage(
//           colorFilter: ColorFilter.mode(
//             Colors.black.withOpacity(0.35),
//             BlendMode.multiply,
//           ),
//           image: NetworkImage(thumbnailUrl),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Stack(
//         children: [
//           Align(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 5.0),
//               child: Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 19,
//                 ),
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 2,
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             alignment: Alignment.center,
//           ),
//           Align(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(5),
//                   margin: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: Colors.black.withOpacity(0.4),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Row(
//                     children: [
//                       const Icon(
//                         Icons.star,
//                         color: Colors.yellow,
//                         size: 18,
//                       ),
//                       const SizedBox(width: 7),
//                       Text(rating),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(5),
//                   margin: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: Colors.black.withOpacity(0.4),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Row(
//                     children: [
//                       const Icon(
//                         Icons.schedule,
//                         color: Colors.yellow,
//                         size: 18,
//                       ),
//                       const SizedBox(width: 7),
//                       Text(cookTime),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             alignment: Alignment.bottomLeft,
//           ),
//         ],
//       ),
//     );
//   }
// }

Widget customListTile(Article article, context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(article: article)));
    },
    child: Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(article.urlToImage.toString()),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          article.source!.name.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          DateFormat.yMMMMd()
                              .format(article.publishedAt as DateTime),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              article.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
