//
//  BookTableViewCell.swift
//  DynamicCellHeightProgrammatic
//
//  Created by Satinder Singh on 7/3/16.
//  Copyright © 2016 Satinder. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    let nameLabel = UILabel()
    let detailLabel = UILabel()
    
    var cellButton = UIButton()
    var cellLabel = UILabel()
    
    // MARK: Initalizers
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func configureCellCon(botones:Int,titulo:String,texto:String) {
        let marginGuide = contentView.layoutMarginsGuide
        
        // configure titleLabel
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        nameLabel.text = titulo
        
        // configure authorLabel
        contentView.addSubview(detailLabel)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        //        detailLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        detailLabel.numberOfLines = 0
        detailLabel.font = UIFont(name: "Avenir-Book", size: 12)
        detailLabel.textColor = UIColor.lightGray
        detailLabel.text = texto
        
        var lastButton = UIButton()
        for x in 0...botones {
            let button = UIButton()
            button.tag = x
            button.backgroundColor = UIColor.init(white: 0.9, alpha: 0.0)
//            button.setBackgroundColor(color: UIColor.white, forState: .normal)
//            button.setBackgroundColor(color: UIColor.blue, forState: .normal)
            button.setTitle("BOTON \(x)", for: .normal)
            button.setTitleColor(UIColor.blue.withAlphaComponent(0.7), for: .normal)
            button.setTitleColor(UIColor.init(white: 0.8, alpha: 1), for: .highlighted)
            button.layer.borderWidth = 0
            button.layer.borderColor = UIColor.blue.cgColor
            contentView.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
//            button.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
//            button.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
            
            contentView.addConstraints([
            NSLayoutConstraint(item: button, attribute: .leftMargin, relatedBy: .equal, toItem: contentView, attribute: .leftMargin, multiplier: 1.0, constant: 20),
            NSLayoutConstraint(item: button, attribute: .rightMargin, relatedBy: .equal, toItem: contentView, attribute: .rightMargin, multiplier: 1.0, constant: -20),
            ])
            
            if(x == 0){
                if #available(iOS 11.0, *) {
                    button.layer.cornerRadius = 8
                    button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
                } else {
                    button.layer.cornerRadius = 5
                }
                button.topAnchor.constraint(equalTo: detailLabel.bottomAnchor).isActive = true
            }else if(x == botones){
                if #available(iOS 11.0, *) {
                    button.layer.cornerRadius = 8
                    button.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
                } else {
                    button.layer.cornerRadius = 5
                }
                button.topAnchor.constraint(equalTo: lastButton.bottomAnchor).isActive = true
                button.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
            }else{
                button.topAnchor.constraint(equalTo: lastButton.bottomAnchor).isActive = true
            }
            
            lastButton = button
            
            button.addTarget(self, action:#selector(mostrarMensaje), for:.touchUpInside)
        }
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func mostrarMensaje(sender: UIButton){
        print( "Cell: \(self.tag) -- Button: \(sender.tag) Clicked!")
        let alertController = UIAlertController(title: "Cell: \(self.tag)", message: "Button: \(sender.tag) Clicked!", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "Cerrar", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
        }
        alertController.addAction(okAction)
        if let myViewController = parentViewController {
            print(myViewController.title ?? "ViewController sin título.")
            myViewController.present(alertController, animated: true, completion: nil)
        }
    }
    
}
