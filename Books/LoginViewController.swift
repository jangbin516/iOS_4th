//
//  LoginViewController.swift
//  Books
//
//  Created by SDS-015 on 2017. 4. 27..
//  Copyright © 2017년 SDS-015. All rights reserved.
//

import UIKit

protocol LoginProtocol {
    func completedLogin(name: String)
}

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var name: UITextField!

    @IBAction func confirmLogin(_ sender: Any) {
        if let del = delegate, let nameText = self.name.text{
            del.completedLogin(name: nameText)
        }
        //openAlert()
        //self.dismiss(animated: true, completion: nil)
    }
    
    var delegate: LoginProtocol? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        name.becomeFirstResponder()
        
        name.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func openAlert()
    {
        let alert = UIAlertController(title: "\(name.text)님 환영합니다", message: "Books 앱을 시작합니다", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
        {
            (action: UIAlertAction) -> () in
            self.view.backgroundColor = UIColor.blue
        }
        
        //        let cancelAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel , handler: {
        //            (action: UIAlertAction) -> () in
        //            print(action.title)
        //            self.view.backgroundColor = UIColor.red
        //        })
        
        let cancelAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel) {
            (action: UIAlertAction) -> () in
            self.view.backgroundColor = UIColor.red
        }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        //        self.present(alert, animated: true, completion: nil)
        self.present(alert, animated: true)
        {
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: {
                (Timer) -> Void in
                alert.dismiss(animated: true, completion: {self.dismiss(animated: true, completion: nil)})
            }
            )
        }
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
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
