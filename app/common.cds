using { ana.java.bookshop as bookshop } from '../db/index';

annotate bookshop.Books with {
  author @title : 'Author Name';
  genre  @title : 'Genre';
}
