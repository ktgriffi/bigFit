//
//  CreateTableViewCell.swift
//  RekorFit
//
//  Created by Kyle Griffith on 2017-05-03.
//  Copyright © 2017 LISA. All rights reserved.
//

import UIKit

class CreateTableViewCell : UITableViewCell {
    
    var indexLabel = UILabel()
    var repsField  = UITextField()
    var timesLabel = UILabel()
    var weightField = UITextField()
    var lbsLabel = UILabel()
    let screenSize: CGRect = UIScreen.main.bounds
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        indexLabel.textAlignment = NSTextAlignment.left
        repsField.textAlignment = NSTextAlignment.center
        timesLabel.textAlignment = NSTextAlignment.center
        weightField.textAlignment = NSTextAlignment.center
        lbsLabel.textAlignment = NSTextAlignment.center
        
        timesLabel.text = "x"
        lbsLabel.text = "lbs"
        

        self.contentView.addSubview(indexLabel)
        self.contentView.addSubview(repsField)
        self.contentView.addSubview(timesLabel)
        self.contentView.addSubview(weightField)
        self.contentView.addSubview(lbsLabel)

        for view in self.contentView.subviews {
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = screenSize.width/5
        let height = screenSize.width/10
        indexLabel.frame = CGRect(x: 0, y: 0, width: width, height: height)
        repsField.frame = CGRect(x: width, y: 0, width: width, height: height)
        timesLabel.frame = CGRect(x: width*2, y: 0, width: width, height: height)
        weightField.frame = CGRect(x: width*3, y: 0, width: width, height: height)
        lbsLabel.frame = CGRect(x: width*4, y: 0, width: width, height: height)
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
