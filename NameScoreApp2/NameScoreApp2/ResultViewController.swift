//
//  ResultViewController.swift
//  NameScoreApp2
//
//  Created by Minori Inoue on 10/2/16.
//  Copyright © 2016 Minori Inoue. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var myName: String = ""
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = "\(myName)の点数は..."
        let random_num = arc4random_uniform(101)
        self.scoreLabel.text = "\(random_num)点です!"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
