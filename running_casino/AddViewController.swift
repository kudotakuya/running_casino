//
//  AddViewController.swift
//  running_casino
//
//  Created by Takuya Kudo on 2019/04/20.
//  Copyright © 2019 Takuya Kudo. All rights reserved.
//

import UIKit

class AddViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var betPicker: UIPickerView!
    @IBOutlet weak var weekPicker: UIPickerView!
    
    let betList = ["100円", "500円", "1000円"]
    let weekList = [
        "2019/4/2 ~ 2019/4/27",
        "2019/4/20 ~ 2019/4/27",
        "2019/4/20 ~ 2019/4/27"
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        betPicker.delegate = self
        betPicker.dataSource = self
        
        weekPicker.delegate = self
        weekPicker.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    // navigation bar display
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        postData()
    }
    func postData() {
        let urlStr = "http://version1.tech/join_event?term=5&bet=1000"
        print(urlStr);
        self.performSegue(withIdentifier: "save", sender:nil)
        if let url = URL(string: urlStr) {
            let req = NSMutableURLRequest(url: url)
            req.httpMethod = "POST"
            let task = URLSession.shared.dataTask(with: req as URLRequest, completionHandler: { (data, resp, err) in
                
                // 受け取ったdataをJSONパース、エラーならcatchへジャンプ
                do {

                } catch {
                    print ("json error")
                    return
                }
                
            })
            task.resume()
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return betList.count
        }else{
            return weekList.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 1 {
            return betList[row]
        }else{
            return weekList[row]
        }
    }
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 1 {

        }else{

        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        // 表示するラベルを生成する
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 50))
        label.textAlignment = .center

        if pickerView.tag == 1 {
            label.text = betList[row]
        }else{
            label.text = weekList[row]
        }
        label.textColor = UIColor(red: 100/255, green: 100/255, blue: 255/255, alpha: 1)
        return label
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
