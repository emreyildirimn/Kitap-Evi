//
//  OzetVc.swift
//  odev3_emreYildirim
//
//  Created by macbook air on 5.08.2022.
//

import UIKit

class OzetVc: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblOzet: UILabel!
    var ozetEkraniResimAdi = ""
    var ozetEkraniLabel = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        lblOzet.font = UIFont(name: "PlayfairDisplay-Italic", size: 20)
        lblOzet.text = ozetEkraniLabel
        imageView.image = UIImage(named:ozetEkraniResimAdi)
        
    }
    

}
