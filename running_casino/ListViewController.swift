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
    var fromText: [String] = []
    var toText: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        listTable.delegate = self
        listTable.dataSource = self
        // Do any additional setup after loading the view.
        
        getData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.listTable.reloadData()
        }
        

    }

    func getData() {
        let urlStr = "http://version1.tech/events"
        print(urlStr);
        if let url = URL(string: urlStr) {
            let req = NSMutableURLRequest(url: url)
            req.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: req as URLRequest, completionHandler: { (data, resp, err) in

                // 受け取ったdataをJSONパース、エラーならcatchへジャンプ
                do {
                    // dataをJSONパースし、グローバル変数"getJson"に格納
                    let Json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
                    
                    for i in 0..<Json.count {
                        
                        let list = Json[i] as! [String:Any]
                        print(list["from"] as! String)
                        self.fromText.append(list["from"] as! String)
                        print(list["to"] as! String)
                        self.toText.append(list["to"] as! String)
                        
                    }
                    
                } catch {
                    print ("json error")
                    return
                }
                
            })
            task.resume()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fromText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell = listTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        
        // Tag番号 1 で UIImageView インスタンスの生成
        let imageView = cell.viewWithTag(3) as! UIImageView
        if indexPath.row % 2 == 1 {
            imageView.image = UIImage(named: "cell_02.png")
        }
        // セルに表示する値を設定する
        let datelabel = cell.viewWithTag(1) as! UILabel
        datelabel.text = self.fromText[indexPath.row]
        
         let label2 = cell.viewWithTag(2) as! UILabel
        label2.text = self.toText[indexPath.row]
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
        if indexPath.row == 1 {
            performSegue(withIdentifier: "detail", sender:nil)
        } else {
            performSegue(withIdentifier: "result", sender:nil)
        }
    }

}
