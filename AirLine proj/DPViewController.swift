//
//  DPViewController.swift
//  AirLine proj
//
//  Created by makarand gharat on 04/08/21.
//

import UIKit


class DPViewController : UIViewController {
    
    @IBOutlet weak var imgDP: UIImageView!
    @IBOutlet weak var lblDPName: UILabel!
    @IBOutlet weak var lblDPCountry: UILabel!
    
    var strname = ""
    var strcountry = ""
    var strimage = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblDPName.text = strname
        lblDPCountry.text = strcountry
        imgDP.kf.setImage(with: URL(string: strimage))
        
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
