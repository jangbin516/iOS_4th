//
//  PhotoViewController.swift
//  Books
//
//  Created by SDS-015 on 2017. 4. 27..
//  Copyright © 2017년 SDS-015. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    var activeTextField: UITextField?
    
    var appdelegate:AppDelegate? = UIApplication.shared.delegate as?AppDelegate
    
    @IBOutlet var authorTextField: UITextField!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var coverImageView: UIImageView!
    @IBOutlet var urlTextField: UITextField!
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBAction func close(_ sender: Any) {
        
        if let title = titleTextField.text
        {
            let book = Book(title: title, author: authorTextField.text, coverImage: coverImageView.image, URL: urlTextField.text)
            
            appdelegate?.books.append(book)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        coverImageView.isUserInteractionEnabled = true
        coverImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectPhoto)))
        
        setNotification()
    }
    
    func selectPhoto(sender: UITapGestureRecognizer)
    {
        print("selectPhoto")
        if sender.state == .ended
        {
            let picker = UIImagePickerController()
            picker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
            picker.allowsEditing = true
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            coverImageView.contentMode = .scaleToFill
            coverImageView.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeTextField = nil
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func setNotification()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyBoard(notification:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyBoard(notification:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    
    func showKeyBoard(notification: NSNotification)
    {
        var info = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as?NSValue)?.cgRectValue.size
        let contentInsets: UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize!.height+10, 0.0)
        
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        
        var aRect: CGRect = self.view.frame
        aRect.size.height -= keyboardSize!.height
        
        if let activeField = self.activeTextField
        {
            if(!aRect.contains(activeField.frame.origin))
            {
                self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
            }
        }
    }
    
    func hideKeyBoard(notification: NSNotification)
    {
        let contentInsents: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        self.scrollView.contentInset = contentInsents
        self.scrollView.scrollIndicatorInsets = contentInsents
        self.view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
