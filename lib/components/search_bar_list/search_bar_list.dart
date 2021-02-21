import 'package:flutter/material.dart';
import 'package:shopping/screens/HomeScreen/constant.dart';

typedef SearchFilter<T> = List<String> Function(T);
typedef SearchBuilder<T> = Widget Function(T t);

class SearchBarList<T> extends StatefulWidget {
  final List<T> items;
  final SearchFilter<T> filter;
  final SearchBuilder<T> builder;
  final Widget failure;
  final Widget header;
  final Widget footer;
  final bool showItemsOnEmpty;

  const SearchBarList(
      {Key key,
      @required this.items,
      @required this.filter,
      @required this.builder,
      this.showItemsOnEmpty = true,
      this.failure = const SizedBox(),
      this.header = const SizedBox(),
      this.footer = const SizedBox()})
      : assert(items != null),
        assert(filter != null),
        assert(builder != null),
        assert(failure != null),
        super(key: key);

  @override
  _SearchBarListState<T> createState() => _SearchBarListState<T>();
}

class _SearchBarListState<T> extends State<SearchBarList<T>> {
  List<T> suggestionItems = List<T>();
  TextEditingController searchController;

  void filterSearchResults(String query, {bool isUpdated = true}) {
    String cleanQuery = query.toLowerCase();
    if (cleanQuery.isEmpty) {
      if (widget.showItemsOnEmpty) {
        suggestionItems.clear();
        suggestionItems.addAll(widget.items);
        if (isUpdated) setState(() {});
      }
    } else {
      Iterable<T> dummyListData = widget.items.where((value) {
        return widget
            .filter(value)
            .any((element) => element.toLowerCase().contains(cleanQuery));
      });
      suggestionItems.clear();
      suggestionItems.addAll(dummyListData);
      if (isUpdated) setState(() {});
      // setState(() {
      //   suggestionItems.clear();
      //   suggestionItems.addAll(dummyListData);
      // });
    }
  }

  @override
  void didUpdateWidget(covariant SearchBarList<T> oldWidget) {
    //if books in booksStore suddenly changed
    // update the current search suggestion Items
    filterSearchResults(searchController.text, isUpdated: false);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // prevent array ref
    if (widget.showItemsOnEmpty) {
      suggestionItems.addAll(widget.items);
    }
    searchController = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                filterSearchResults(value);
              },
              decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      searchController.text = "";
                      filterSearchResults("");
                    },
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(defaultPadding)),
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor)),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor),
                      borderRadius:
                          BorderRadius.all(Radius.circular(defaultPadding)))),
            ),
          ),
          widget.header,
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius:
                    BorderRadius.all(Radius.circular(defaultPadding))),
            child: suggestionItems.isNotEmpty
                ? ListView.builder(
                    itemCount: suggestionItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return widget.builder(suggestionItems[index]);
                    })
                : widget.failure,
          )),
          widget.footer,
        ],
      ),
    );
  }
}
