/* Books */
CREATE TABLE IF NOT EXISTS books (
    book_id INTEGER PRIMARY KEY,
    isbn INTEGER,
    title TEXT NOT NULL,
    content_length INTEGER,
    actual_length INTEGER,
    quantity INTEGER NOT NULL,
    notes TEXT,
    cover BLOB
);

/* Authors */
CREATE TABLE IF NOT EXISTS authors (
    author_id INTEGER PRIMARY KEY,
    author_name TEXT NOT NULL
);

/* Formats */
CREATE TABLE IF NOT EXISTS formats (
    format_id INTEGER PRIMARY KEY,
    book_format TEXT NOT NULL
);

/* Genres */
CREATE TABLE IF NOT EXISTS genres (
    genre_id INTEGER PRIMARY KEY,
    genre TEXT NOT NULL
);

/* Collections */
CREATE TABLE IF NOT EXISTS collections (
    collection_id INTEGER PRIMARY KEY,
    book_collection TEXT NOT NULL
);

/* Users (Book collectors) */
CREATE TABLE IF NOT EXISTS collectors (
    collector_id INTEGER PRIMARY KEY,
    collector TEXT NOT NULL
);

/* Ratings */
CREATE TABLE IF NOT EXISTS ratings (
    rating_id INTEGER PRIMARY KEY,
    rating TEXT NOT NULL
);

/* Progress */
CREATE TABLE IF NOT EXISTS progress (
    progress_id INTEGER PRIMARY KEY,
    progress TEXT NOT NULL
);

/* User Data */
CREATE TABLE IF NOT EXISTS user_data (
    book_id INTEGER NOT NULL,
    collector_id INTEGER NOT NULL,
    rating_id INTEGER NOT NULL,
    progress_id INTEGER NOT NULL,
    PRIMARY KEY (book_id, collector_id),
    FOREIGN KEY (book_id)
        REFERENCES books(book_id)
            ON UPDATE CASCADE 
            ON DELETE CASCADE, 
    FOREIGN KEY (collector_id)
        REFERENCES collectors(collector_id)
            ON UPDATE CASCADE
            ON DELETE CASCADE,
    FOREIGN KEY (rating_id)
        REFERENCES ratings(rating_id)
            ON UPDATE CASCADE
            ON DELETE CASCADE,
    FOREIGN KEY (progress_id)
        REFERENCES progress(progress_id)
            ON UPDATE CASCADE
            ON DELETE CASCADE
) WITHOUT ROWID;

/* Book Genre Join */
CREATE TABLE IF NOT EXISTS book_genres (
    book_id INTEGER NOT NULL,
    genre_id INTEGER NOT NULL,
    PRIMARY KEY (book_id, genre_id)
    FOREIGN KEY (book_id)
        REFERENCES books(book_id)
            ON UPDATE CASCADE
            ON DELETE CASCADE,
    FOREIGN KEY (genre_id)
        REFERENCES genres(genre_id)
            ON UPDATE CASCADE
            ON DELETE CASCADE
) WITHOUT ROWID;

/* Book Collections Join */
CREATE TABLE IF NOT EXISTS book_collections (
    book_id INTEGER NOT NULL,
    collection_id INTEGER NOT NULL,
    PRIMARY KEY (book_id, collection_id)
    FOREIGN KEY (book_id)
        REFERENCES books(book_id)
            ON UPDATE CASCADE
            ON DELETE CASCADE,
    FOREIGN KEY (collection_id)
        REFERENCES collections(collection_id)
            ON UPDATE CASCADE
            ON DELETE CASCADE
) WITHOUT ROWID;

/* Book Authors Join */
CREATE TABLE IF NOT EXISTS book_authors (
    book_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    PRIMARY KEY (book_id, author_id)
    FOREIGN KEY (book_id)
        REFERENCES books(book_id)
            ON UPDATE CASCADE
            ON DELETE CASCADE,
    FOREIGN KEY (author_id)
        REFERENCES authors(author_id)
            ON UPDATE CASCADE
            ON DELETE CASCADE
) WITHOUT ROWID;

/* Book Formats Join */
CREATE TABLE IF NOT EXISTS book_formats (
    book_id INTEGER NOT NULL,
    format_id INTEGER NOT NULL,
    PRIMARY KEY (book_id, format_id)
    FOREIGN KEY (book_id)
        REFERENCES books(book_id)
            ON UPDATE CASCADE
            ON DELETE CASCADE,
    FOREIGN KEY (format_id)
        REFERENCES formats(format_id)
            ON UPDATE CASCADE
            ON DELETE CASCADE
) WITHOUT ROWID;
