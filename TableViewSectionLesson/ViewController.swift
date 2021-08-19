//
//  ViewController.swift
//  TableViewSectionLesson
//
//  Created by UrataHiroki on 2021/08/19.
//

import UIKit

class ViewController: UIViewController{

    
    @IBOutlet weak var segments: UISegmentedControl!
    @IBOutlet weak var cellContentsTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    let sectionContentsArray = ["1","2","3","4","5"]
    
    var cellContentsArray = [[String](),[String](),[String](),[String](),[String]()]
    //[[String()],[String()],[String()],[String()],[String()]]だと[0]番目に""が入ってしまう。
    
    var selectSegmentNumber = Int()

    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        createSegments(cellContentsArrayCount: sectionContentsArray.count)
        print(cellContentsArray)
        
        tableView.delegate = self
        tableView.dataSource = self
  
    }
    
    
    @IBAction func add(_ sender: UIButton) {
        
        if 0...4 ~= selectSegmentNumber{
        
            for searchCount in 0...selectSegmentNumber{
                
                if searchCount == selectSegmentNumber{
                    
                    cellContentsArray[selectSegmentNumber].append(cellContentsTextField.text!)
                    print(cellContentsArray[selectSegmentNumber])
                }
                
            }
            
            tableView.reloadData()
        
        }
    }
    

}

//tableView内容
extension ViewController:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int { //セクション数
        
        return sectionContentsArray.count
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? { //セクション名
        
        return sectionContentsArray[section]
        
    }
    
    //各セクションによって表示するCellの数が違うので、そのための処理
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            
            return cellContentsArray[section].count
            
        }else if section == 1{
            
            return cellContentsArray[section].count
            
        }else if section == 2{
            
            return cellContentsArray[section].count
            
        }else if section == 3{
            
            return cellContentsArray[section].count
            
        }else if section == 4{
            
            return cellContentsArray[section].count
            
        }else{
            
            return 0
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        for sectionCount in 0...4{
            
            if indexPath.section == sectionCount{
              
                cell.textLabel?.text = cellContentsArray[indexPath.section][indexPath.row]
                 
            }
            
        }
        
        return cell
    }
    
    
}


extension ViewController{
    
    func createSegments(cellContentsArrayCount:Int){
        
        segments.removeAllSegments()
        
        for segmentCount in 0...cellContentsArrayCount - 1{
            
            segments.insertSegment(withTitle: String(segmentCount + 1), at: segmentCount, animated: true)
            segments.addTarget(self, action: #selector(sendSelectSegment), for: .valueChanged)
        }
        
        segments.backgroundColor = .white
        
    }
    
    @objc func sendSelectSegment(sender:UISegmentedControl){
        
        selectSegmentNumber = sender.selectedSegmentIndex
        
    }
    
}
