//
//  FeedCell.swift
//  YemekTarifiApp
//
//  Created by Furkan İSLAM on 6.08.2024.
//

import UIKit
import Firebase

class FeedCell: UITableViewCell {

    @IBOutlet weak var tarifText: UITextView!
    @IBOutlet weak var useremailLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var documentIdLabel: UILabel!
    @IBOutlet weak var yemekAdiLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func likeButtonClicked(_ sender: Any) {
        
        let fireStoreDatabase = Firestore.firestore()
        
        if let likeCount = Int(likeLabel.text!) {
            
            let likeStore = ["likes" : likeCount + 1] as [String : Any]

            fireStoreDatabase.collection("Posts").document(documentIdLabel.text!).setData(likeStore, merge: true)

        }
    }
}
