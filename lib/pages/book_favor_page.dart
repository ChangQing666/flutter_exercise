import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/book_manager_model.dart';
import 'package:flutter_provider/widgets/book_widget.dart';
import 'package:provider/provider.dart';

class BookFavorPage extends StatelessWidget {
  const BookFavorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bookManagerModel = Provider.of<BookManagerModel>(context);
    var bookCount = bookManagerModel.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("收藏列表"),
      ),
      body: content(bookCount, bookManagerModel),
    );
  }

  Widget content(int bookCount, BookManagerModel bookManagerModel) {
    return bookCount > 0
        ? ListView.builder(
            itemCount: bookCount,
            itemBuilder: (_, index) =>
                BookItem(id: bookManagerModel.getByPosition(index).bookId),
          )
        : const Center(child: Text("暂无收藏"));
  }
}
