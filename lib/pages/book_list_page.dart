import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/book_manager_model.dart';
import 'package:flutter_provider/widgets/book_widget.dart';
import 'package:provider/provider.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bookModel = Provider.of<BookModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("书籍列表"),
      ),
      body: ListView.builder(
        itemCount: bookModel.length,
        itemBuilder: (_, index) => BookItem(id: index + 1),
      ),
    );
  }
}
