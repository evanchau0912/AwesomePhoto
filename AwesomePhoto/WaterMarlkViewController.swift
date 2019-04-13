//
//  WaterMarlkViewController.swift
//  AwesomePhoto
//
//  Created by Chau Phuoc Tuong on 3/30/19.
//  Copyright © 2019 Chau Phuoc Tuong. All rights reserved.
//

import UIKit

class WaterMarlkViewController: UIViewController {

    @IBOutlet weak var waterMarkImage: UIImageView!
    @IBOutlet weak var contentView: UIView!
    
    
    // Inserting the watermark for picture
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let labelView = UILabel(frame: CGRect(x: 30, y: 30, width: 100, height: 20)) //adjust frame to change position of water mark or text
        labelView.text = "my text"
        let logoView = UIImageView(image: UIImage(named: "logo.png"))
        logoView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        waterMarkImage.addSubview(logoView)
        UIGraphicsBeginImageContext(waterMarkImage.frame.size)
        waterMarkImage.layer.render(in: UIGraphicsGetCurrentContext()!)
        let waterMarkImageNew = UIGraphicsGetImageFromCurrentImageContext()
        waterMarkImage.image = waterMarkImageNew
        UIImageWriteToSavedPhotosAlbum(waterMarkImageNew!, nil, nil, nil)
        UIGraphicsEndImageContext()

        // Do any additional setup after loading the view.
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
