import 'package:flutter/material.dart';
import 'package:flutter_provider/common/color.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider/provider/book_manager_model.dart';

class BookItem extends StatelessWidget {
  final int id;

  const BookItem({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bookModel = Provider.of<BookModel>(context);
    var book = bookModel.getById(id);

    return ListTile(
      leading: CircleAvatar(
        child: Text("${book.bookId}"),
      ),
      title: Text(
        book.bookName,
        // style: const TextStyle(color: Colors.black87),
      ),
      trailing: AddFavorButton(book: book),
    );
  }
}

//添加取消收藏按钮
class AddFavorButton extends StatelessWidget {
  final Book book;

  const AddFavorButton({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bookManagerModel = Provider.of<BookManagerModel>(context);

    return GestureDetector(
      onTap: bookManagerModel.books.contains(book)
          ? () => bookManagerModel.removeFaves(book)
          : () => bookManagerModel.addFaves(book),
      child: SizedBox(
        width: 100,
        height: 60,
        child: bookManagerModel.books.contains(book)
            ? const Icon(
                Icons.star,
                color: primaryColor,
              )
            : const Icon(Icons.star_border),
      ),
    );
  }
}
