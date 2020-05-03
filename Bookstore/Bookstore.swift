//
//  Bookstore.swift
//  Bookstore
//
//  Created by Iván Alejandro Bustillos Sánchez on 3/3/20.
//  Copyright © 2020 owo. All rights reserved.
//

import Foundation

class BookStore {
    var bookList: [Book] = []
    init() {
        var newBook = Book()
        newBook.title = "A Game of Thrones"
        newBook.author = "George R.R. Martin"
        newBook.description = """
        Winter is coming. Such is the stern motto of House Stark, the northernmost of the fiefdoms that owe allegiance to King Robert Baratheon in far-off King's Landing. There Eddard Stark of Winterfell rules in ...
        """
        newBook.rating = 5
        bookList.append(newBook)
        
        newBook = Book()
        newBook.title = "A Clash of Kings"
        newBook.author = "George R.R. Martin"
        newBook.description = """
        A Song of Ice and Fire: Book Two
        """
        newBook.rating = 4
        bookList.append(newBook)
        
        newBook = Book()
        newBook.title = "Foundation"
        newBook.author = "Isaac Asimov"
        newBook.description = """
        Foundation by Isaac Asimov
        """
        newBook.rating = 5
        bookList.append(newBook)

        newBook = Book()
        newBook.title = "Animal Farm"
        newBook.author = "George Orwell"
        newBook.description = """
        Animal Farm is a novel about a group of animals who take control of the farm they live on. The animals get fed up of their master, Farmer Jones, so they kick him out. ... However, trouble brews as the pigs, Napoleon and Snowball, fight for the hearts and minds of the other animals on the farm.
        """
        newBook.rating = 4
        bookList.append(newBook)
    }
}
