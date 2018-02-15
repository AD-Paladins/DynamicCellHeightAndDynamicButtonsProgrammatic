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
    var book : Book!
    
    // MARK: Initalizers
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func configureCellCon(botones:Int, titulo:String, book:Book) {
        self.book = book
        let marginGuide = contentView.layoutMarginsGuide
        // configure titleLabel
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        nameLabel.text = book.name
        
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
        detailLabel.text = book.details
        
        var lastButton = UIButton()
        if(book.buttonsAttibutes.count == 1) {
            let button = UIButton()
            button.tag = 0
            button.backgroundColor = UIColor.init(white: 0.9, alpha: 0.0)
            //            button.setBackgroundColor(color: UIColor.white, forState: .normal)
            //            button.setBackgroundColor(color: UIColor.blue, forState: .normal)
            button.setTitle(book.buttonsAttibutes[0].title, for: .normal)
            button.setTitleColor(UIColor.blue.withAlphaComponent(0.7), for: .normal)
            button.setTitleColor(UIColor.init(white: 0.8, alpha: 1), for: .highlighted)
            button.layer.borderWidth = 0
            button.layer.borderColor = UIColor.blue.cgColor
            contentView.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            contentView.addConstraints([
                NSLayoutConstraint(item: button, attribute: .leftMargin, relatedBy: .equal, toItem: contentView, attribute: .leftMargin, multiplier: 1.0, constant: 20),
                NSLayoutConstraint(item: button, attribute: .rightMargin, relatedBy: .equal, toItem: contentView, attribute: .rightMargin, multiplier: 1.0, constant: -20),
                ])
            button.topAnchor.constraint(equalTo: detailLabel.bottomAnchor).isActive = true
            button.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
            button.addTarget(self, action:#selector(mostrarMensaje), for:.touchUpInside)
            return
        }else if(book.buttonsAttibutes.count == 0) {
            detailLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
            return
        }
        
        if(book.buttonsAttibutes.count > 0) {
            for x in 0...(book.buttonsAttibutes.count - 1) {
                let button = UIButton()
                button.tag = x
                button.backgroundColor = UIColor.init(white: 0.9, alpha: 0.0)
                //            button.setBackgroundColor(color: UIColor.white, forState: .normal)
                //            button.setBackgroundColor(color: UIColor.blue, forState: .normal)
                button.setTitle(book.buttonsAttibutes[x].title, for: .normal)
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
                }else if(x == (book.buttonsAttibutes.count - 1)){
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
                
                button.addTarget(self, action:#selector(mostrarMensaje), for:.touchUpInside)
                lastButton = button
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func mostrarMensaje(sender: UIButton){
//        let title = self.book.buttonsAttibutes[sender.tag].title
        let message = self.book.buttonsAttibutes[sender.tag].message
        let alertController = UIAlertController(title: "\(self.book.name)", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "Cerrar", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
        }
        
        alertController.addAction(okAction)
        if let myViewController = parentViewController {
            print(myViewController.title ?? "ViewController without title.")
            myViewController.present(alertController, animated: true, completion: nil)
        }
    }
    
}
