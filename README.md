# Project: python-books

## What is this?
A simple inventory program for tracking books in a home library

## Informal Roadmap
1. Create Git Repo
2. Create Python virtual environment
3. Install Qt in virtual environment
4. “Hello Qt” test (verify Qt installed)
5. Simple interface that connects to a SQLite db
6. Create schema
7. QSqlQuery to create empty db
8. Program startup checks for existing db, creates if needed
9. C.R.U.D.  
— MVP Done —  
10. Open different SQLite dbs (File > Open…)
11. Sort
12. Search
13. Auto-download data (specifically cover art)
14. Graphical bookshelf interface  
— Version 2 Done —

## Schema Planning
ISBN
 - *What about books that pre-date ISBN or are self-published?*
 - *ISBN10 versus ISBN13*
 - *Physical and PDF in collection*
Title
Author
 - *Multiple authors*
 - *No author*
Quantity (duplicates in collection)
Genre
Rating
 - *Single user or per household user?*
Read-through state (Percent complete)
 - *Single user or per household user?*
Notes
Cover art
Collection or series
Format (Hardcover, paperback, etc)
Pages
 - *Physical page count*
 - *Page count of the actual content, excluding appendicies & legalise.*
Year published