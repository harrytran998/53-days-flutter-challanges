import 'package:flutter/material.dart';

void main() {
  runApp(BooksApp());
}

class Book {
  final String title;
  final String author;

  Book(this.title, this.author);
}

class BooksApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  Book _selectedBook;

  List<Book> books = [
    Book('Stranger in a Strange Land', 'Robert A. Heinlein'),
    Book('Foundation', 'Isaac Asimov'),
    Book('Fahrenheit 451', 'Ray Bradbury'),
    Book('XXX', 'Ray Bradbury'),
    Book('ZZZ', 'ASDSDASD Bradbury'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App',
      home: Column(
        children: [
          Container(
            child: Text('ZZZ'),
          ),
          Expanded(
            child: Navigator(
              pages: [
                MaterialPage(
                  key: ValueKey('BooksListPage'),
                  child: BooksListScreen(
                    books: books,
                    onTapped: _handleBookTapped,
                  ),
                ),
                if (_selectedBook != null) BookDetailsPage(book: _selectedBook)
              ],
              onPopPage: (route, result) {
                if (!route.didPop(result)) {
                  return false;
                }
                // Update the list of pages by setting _selectedBook to null
                setState(() {
                  _selectedBook = null;
                });
                return true;
              },
            ),
          ),
        ],
      ),
    );
  }

  void _handleBookTapped(Book book) {
    setState(() {
      _selectedBook = book;
    });
  }
}

class BooksListScreen extends StatelessWidget {
  final List<Book> books;
  final ValueChanged<Book> onTapped;

  BooksListScreen({
    @required this.books,
    @required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          for (final book in books)
            ListTile(
              tileColor: Color(0xFFEA580C),
              title: Text(book.title),
              leading: Text('XXX'),
              isThreeLine: true,
              trailing: Text('YYY'),
              subtitle: Text(book.author),
              onTap: () => onTapped(book),
            )
        ],
      ),
    );
  }
}

class BookDetailsPage extends Page {
  final Book book;

  BookDetailsPage({this.book}) : super(key: ValueKey(book));

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => BookDetailsScreen(book: book),
    );
  }
}

class BookDetailsScreen extends StatelessWidget {
  final Book book;

  BookDetailsScreen({
    @required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (book != null) ...[
              Text(book.title, style: Theme.of(context).textTheme.headline6),
              Text(book.author, style: Theme.of(context).textTheme.subtitle1),
            ] else ...[
              Text(book.title, style: Theme.of(context).textTheme.headline6),
              Text(book.author, style: Theme.of(context).textTheme.subtitle1),
            ]
          ],
        ),
      ),
    );
  }
}
