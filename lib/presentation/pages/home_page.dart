// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:simple_app/presentation/providers/article_provider.dart';
// import 'package:simple_app/presentation/widgets/article_list.dart';
//
// class HomePage extends ConsumerStatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends ConsumerState<HomePage> {
//   String _section = 'home';
//   bool _isListView = true;
//
//   void _onSearch(String query) {
//     setState(() {
//       // Handle search functionality, filtering articles by title or author name
//     });
//   }
//
//   void _onSectionChanged(String? section) {
//     if (section != null) {
//       setState(() {
//         _section = section;
//       });
//     }
//   }
//
//   void _onViewTypeChanged(bool isListView) {
//     setState(() {
//       _isListView = isListView;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     final articlesAsyncValue = ref.watch(articleProvider(_section));
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('NY Times Top Stories'),
//         ),
//         body: SizedBox(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   decoration: const InputDecoration(
//                     labelText: 'Search',
//                     border: OutlineInputBorder(),
//                   ),
//                   onChanged: _onSearch,
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Flexible(
//                     child: DropdownButton<String>(
//                       value: _section,
//                       items: <String>['home', 'world', 'science']
//                           .map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                       onChanged: _onSectionChanged,
//                     ),
//                   ),
//                   Flexible(
//                     child: SwitchListTile(
//                       title: const Text('List or Cards'),
//                       value: _isListView,
//                       onChanged: _onViewTypeChanged,
//                     ),
//                   ),
//                 ],
//               ),
//               Expanded(
//                 child: articlesAsyncValue.when(
//                   data: (articles) => _isListView
//                       ? ArticleList(articles: articles)
//                       : ArticleGrid(articles: articles),
//                   loading: () =>
//                       const Center(child: CircularProgressIndicator()),
//                   error: (err, stack) => Center(child: Text('Error: $err')),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_app/presentation/providers/article_provider.dart';
import 'package:simple_app/presentation/widgets/article_card.dart';
import 'package:simple_app/presentation/widgets/article_list.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String _section = 'home';
  bool _isListView = true;
  String _searchQuery = '';

  void _onSearch(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  void _onSectionChanged(String? section) {
    if (section != null) {
      setState(() {
        _section = section;
      });
    }
  }

  void _onViewTypeChanged(bool isListView) {
    setState(() {
      _isListView = isListView;
    });
  }

  @override
  Widget build(BuildContext context) {
    final articlesAsyncValue = ref.watch(articleProvider(_section));
    return Scaffold(
      appBar: AppBar(
        title: const Text('NY Times Top Stories'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: 'Search',
                      ),
                      onChanged: _onSearch,
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      const Flexible(
                          flex: 0, child: Icon(Icons.filter_alt_rounded)),
                      const Flexible(
                        child: SizedBox(
                          width: 10,
                        ),
                      ),
                      DropdownButton<String>(
                        value: _section,
                        items: <String>[
                          'home',
                          'arts',
                          'movies',
                          'sports',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: _onSectionChanged,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            _onViewTypeChanged(true);
                          },
                          child:
                              const Icon(Icons.format_list_bulleted_outlined)),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                          onTap: () {
                            _onViewTypeChanged(false);
                          },
                          child: const Icon(Icons.grid_view))
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: articlesAsyncValue.when(
                data: (articles) {
                  final filteredArticles = articles.where((article) {
                    return article.title
                            .toLowerCase()
                            .contains(_searchQuery.toLowerCase()) ||
                        article.author
                            .toLowerCase()
                            .contains(_searchQuery.toLowerCase());
                  }).toList();

                  return _isListView
                      ? ArticleList(articles: filteredArticles)
                      : ArticleGrid(articles: filteredArticles);
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(child: Text('Error: $err')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
