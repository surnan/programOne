//
//  ViewController.swift
//  programOne
//
//  Created by surnan on 6/15/17.
//  Copyright © 2017 surnan. All rights reserved.
//

import UIKit

class CustomCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    //how did he know about UICollectionViewDelegateFlowLayout?  I don't see it in UICollectionViewController help file

    let customCellIdentifier = "customCellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.blue  //no longer shows because it's overlapped
        collectionView?.backgroundColor = UIColor.blue
        
        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: customCellIdentifier) //error forcing us to create CustomCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    } //now you have to make a cell (which needs to be registered (line with reuse-identifier)
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: customCellIdentifier, for: indexPath)
        return customCell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: view.frame.width, height: 200)
    }
}

class CustomCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Custom Text"
        label.backgroundColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false  //crashes without this cuz it gets constrains drama
        return label
    }()
    
    
    func setupViews(){
       addSubview(nameLabel)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : nameLabel]))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
