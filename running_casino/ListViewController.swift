//
//  ListViewController.swift
//  running_casino
//
//  Created by Takuya Kudo on 2019/04/20.
//  Copyright © 2019 Takuya Kudo. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    

    @IBOutlet weak var listTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        listTable.delegate = self
        listTable.dataSource = self
        // Do any additional setup after loading the view.
        
        
//        let urlStr = "https://version1.tech/events/"
//        print(urlStr);
//        if let url = URL(string: urlStr) {
//            let req = NSMutableURLRequest(url: url)
//            req.httpMethod = "GET"
//            let task = URLSession.shared.dataTask(with: req as URLRequest, completionHandler: { (data, resp, err) in
//                // print(resp!.url!)
//                //print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue) as Any)
//                
//                // 受け取ったdataをJSONパース、エラーならcatchへジャンプ
//                do {
//                    // dataをJSONパースし、グローバル変数"getJson"に格納
//                    let Json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
//                    
//                    for i in 0..<Json.count {
//                        
//                        print(Json[i])
//                        
//                    }
//                    
//                } catch {
//                    print ("json error")
//                    return
//                }
//                
//                
//            })
//            task.resume()
//            
//            
//        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell = listTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        // セルに表示する値を設定する
        let datelabel = cell.viewWithTag(1) as! UILabel
        datelabel.text = "aaaa"
        
         let label2 = cell.viewWithTag(2) as! UILabel
        label2.text = "bbbb"
        return cell
    }
    
    // Cell の高さを１２０にする
    func tableView(_ table: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detail", sender:nil)
    }

}
