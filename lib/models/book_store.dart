import 'package:shopping/models/book.dart';

class BookStore {
  final String name;
  List<Book> books;

  BookStore(this.name, this.books);
}

List<Book> books = [
  Book('Stranger in a Strange Land', 'Robert A. Heinlein'),
  Book('Foundation', 'Isaac Asimov'),
  Book('Fahrenheit 451', 'Ray Bradbury'),
];

List<Book> books2 = [
  Book('Politics of Opportunism', 'R P N Singh'),
  Book('Malayalam poetry', 'Akkitham Achuthan Namboodri'),
  Book('The Testaments', 'Margaret Atwood'),
];

List<Book> books3 = [
  Book('Celestial Bodies', 'Jokha Alharthi'),
  Book('Cheque book', 'Vasdev Mohi'),
  Book('The Overstory', 'Richard Powers'),
];

List<Book> books4 = [
  Book('The Braille edition of the book Exam Warriors', 'PM Narendra Modi'),
  Book('Mind-Master', 'Viswanathan Anand and Susan Ninan	'),
  Book('"Courts of India"', 'Chief Justice of India (CJI) Ranjan Gogoi	'),
];

List<Book> books5 = [
  Book(
      'Quality, Accreditation, and Ranking – A Silent Revolution in the Offing in Indian Higher Education',
      'M Venkaiah Naidu	'),
  Book('We are Displaced', 'Malala Yousafzai'),
  Book('Saffron Swords', 'Manoshi Sinha Rawal'),
];

List<BookStore> bookStores = [
  BookStore('Fahasa', books),
  BookStore('Phuong Nam', books2),
  BookStore('Minh Khai', books3),
  BookStore('Cá Chép', books4),
  BookStore('Xuân Thu', books5),
];

//source: book and author name are taken from https://www.careerpower.in/books-and-authors.html
