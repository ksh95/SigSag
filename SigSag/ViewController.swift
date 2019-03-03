//
//  ViewController.swift
//  SigSag
//
//  Created by 김시환 on 2019. 3. 3..
//  Copyright © 2019년 김시환. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var sliderCollectionView: UICollectionView!
    @IBOutlet private weak var pageView: UIPageControl!
    @IBOutlet private weak var mainCollectionView: UICollectionView!
    
    private var imageArr = [ UIImage(named: "image1"),
                             UIImage(named: "image2"),
                             UIImage(named: "image3") ]
    
    private var mainImageArr = [ UIImage(named: "main1"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3"),
                                 UIImage(named: "main2"),
                                 UIImage(named: "main3") ]
    
    private var timer = Timer()
    private var counter = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "시그새그"
        
        pageView.numberOfPages = imageArr.count
        pageView.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.chageImage), userInfo: nil, repeats: true)
        }
    }
    
    @objc func chageImage() {
        if counter < imageArr.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageView.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageView.currentPage = counter
            counter = 1
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.sliderCollectionView {
            return imageArr.count
        } else if collectionView == self.mainCollectionView {
            return mainImageArr.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.sliderCollectionView {
            let sliderCell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCell", for: indexPath as IndexPath)
            if let vc = sliderCell.viewWithTag(111) as? UIImageView {
                vc.image = imageArr[indexPath.row]
            } else if let ab = sliderCell.viewWithTag(222) as? UIPageControl {
                ab.currentPage = indexPath.row
            }
            return sliderCell
        } else {
            let mainCell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath as IndexPath) as! mainCell
            mainCell.mainImageView.image = mainImageArr[indexPath.row]
            //mainCell.layer.cornerRadius = 10
            //mainCell.layer.masksToBounds = true
            return mainCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == mainCollectionView {
            let mainCell = collectionView.cellForItem(at: indexPath) as! mainCell
            mainCell.layer.borderWidth = 2.0
            mainCell.layer.borderColor = UIColor.red.cgColor
        }
        
        if let didSelect = mainImageArr[indexPath.row] {
            print(didSelect)
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == sliderCollectionView{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else {
            return UIEdgeInsets(top: 5, left: 5, bottom: 2, right: 5)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == sliderCollectionView {
            let size = sliderCollectionView.frame.size
            return CGSize(width: size.width, height: size.height)
        } else {
            let itemWidht = UIScreen.main.bounds.width/2 - 10
            let itemheight = UIScreen.main.bounds.height/3 - 20
            return CGSize(width: itemWidht, height: itemheight)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == sliderCollectionView {
            return 0.0
        } else {
            return 0.0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == sliderCollectionView {
            return 0.0
        } else {
            return 3
        }
    }
}
