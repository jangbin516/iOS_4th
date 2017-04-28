//
//  MainTableViewController.swift
//  Books
//
//  Created by SDS-015 on 2017. 4. 27..
//  Copyright © 2017년 SDS-015. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, LoginProtocol {
    
    var appdelegate: AppDelegate? = UIApplication.shared.delegate as?AppDelegate

    @IBAction func openLoginView(_ sender: Any) {
        
//        if let loginVC = storyboard?.instantiateViewController(withIdentifier: "loginview") as? LoginViewController
//        {
//            loginVC.delegate = self
//            self.present(loginVC, animated: true, completion: nil)
//        }
        
        guard let loginVC = storyboard?.instantiateViewController(withIdentifier: "loginview") as? LoginViewController
        else
        {
            return

        }
        
        loginVC.delegate = self
        self.present(loginVC, animated: true, completion: nil)

        
    }
    
    func completedLogin(name: String) {
        print(name)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
//        myArr.append("홍길동")
//        myArr.append("김민수")
//        myArr.append("장빈")

    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if let books = appdelegate?.books
        {
            return books.count
        }
        else
        {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        guard let books = appdelegate?.books else
        {
            return cell
        }
        
        cell.textLabel?.text = books[indexPath.row].title
        cell.detailTextLabel?.text = books[indexPath.row].author
        cell.imageView?.image = books[indexPath.row].coverImage

        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
//    override func viewWillAppear(_ animated: Bool)
//    {
//        let alert = UIAlertController(title: "환영합니다", message: "Books 앱을 시작합니다", preferredStyle: UIAlertControllerStyle.alert)
//        let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
//        {
//            (action: UIAlertAction) -> () in
//            self.view.backgroundColor = UIColor.blue
//        }
//        
//        //        let cancelAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel , handler: {
//        //            (action: UIAlertAction) -> () in
//        //            print(action.title)
//        //            self.view.backgroundColor = UIColor.red
//        //        })
//        
//        let cancelAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel) {
//            (action: UIAlertAction) -> () in
//            self.view.backgroundColor = UIColor.red
//        }
//        
//        alert.addAction(okAction)
//        alert.addAction(cancelAction)
//        
//        //        self.present(alert, animated: true, completion: nil)
//        self.present(alert, animated: true)
//        {
//            Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: {
//                (Timer) -> Void in
//                alert.dismiss(animated: true, completion: nil)
//            }
//            )
//        }
//    }

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
