//
//  MemberViewController.swift
//  IT-IronMan
//
//  Created by don chen on 2017/12/7.
//  Copyright © 2017年 Don Chen. All rights reserved.
//

import UIKit

class MemberViewController: BaseViewController {

    var members:[MemberModel]?
    var imageNames = [String]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "團隊成員"
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        imageNames.shuffle()
        print(imageNames)
    }
    
    private func setupView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let cellNib = UINib(nibName: "MemberCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "memberCell")
        
        var names = [String]()
        for i in 0...27 {
            names.append("img-\(i)")
        }
        
        imageNames = names
    }
}

// MARK: UICollectionViewDataSource
extension MemberViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if members == nil { return 0 }
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if members == nil { return 0 }
        return members!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if members == nil {
            return UICollectionViewCell()
        }
        
        let row = indexPath.row
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memberCell", for: indexPath) as! MemberCell
        
        var item:MemberModel?
        if members!.count > row {
            item = members![row]
        }
        
        if(imageNames.count != 0){
            let imageRow = indexPath.row % imageNames.count
            cell.setupWithModel(item!, imageName: imageNames[imageRow])
            
        } else {
            cell.setupWithModel(item!, imageName: "")
            
        }

        
        return cell
    }
    
}

// MARK: UICollectionViewDelegate
extension MemberViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

// MARK: UICollectionVieDelegateFlowLayout
extension MemberViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width * 1
        
        return CGSize(width: width, height: 200)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    
}


