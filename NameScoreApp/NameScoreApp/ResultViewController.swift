//
//  ResultViewController.swift
//  NameScoreApp
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

        nameLabel.text = "\(myName)の点数は..."
        let score = arc4random_uniform(101)
        scoreLabel.text = "\(score)点"
        
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
