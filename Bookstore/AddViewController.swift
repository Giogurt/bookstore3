//
//  AddViewController.swift
//  Bookstore
//
//  Created by user168029 on 4/24/20.
//  Copyright © 2020 owo. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var authorText: UITextField!
    @IBOutlet weak var ratingText: UITextField!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var switchOutlet: UISwitch!
    
    var book: Book = Book()
    var delegate: BookStoreDelegate?
    var editBook = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if editBook {
            self.title = "Edit Book"
            titleText.text = book.title
            authorText.text = book.author
            ratingText.text = String(book.rating)
            descriptionText.text = book.description
            if book.readThisBook {
                switchOutlet.isOn = true
            } else {
                switchOutlet.isOn = false
            }
        } else {
            //If a book isnt being edited then display that you are adding a book
            self.title = "Add Book"
        }
    }
    
    @IBAction func saveBookAction(_ sender: UIButton) {
        book.title = titleText.text!
        book.author = authorText.text!
        book.description = descriptionText.text
        
        if let text = ratingText.text, let rating = Int(text) {
            book.rating = rating
        }
        
        if switchOutlet.isOn {
            book.readThisBook = true
        } else {
            book.readThisBook = false
        }
        
        if editBook {
            delegate?.editBook(self, editBook: book)
        } else {
            delegate?.newBook(self, newBook: book)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
