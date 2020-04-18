//
//  ViewController.swift
//  MemefulDemo
//
//  Created by SAURABH MISHRA on 17/04/20.
//  Copyright © 2020 SAURABH MISHRA. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {

    
// MARK: - Outlets

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
// MARK: - Properties
    
    let reuseIdentifier = "MemesCell"
    
    var memes = [Meme]()
    
        
    var networkManager = Service.shared
    
    
// MARK: - View Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let layout = collectionView?.collectionViewLayout as? Memeslayout {
            layout.delegate = self
        }
        
        setUpNavigationBarItems()
        
        fetchImgurMemes(isViral: true)

        
        

    }

    // MARK: - Memes Data API Call
    
    
    
    func fetchImgurMemes(isViral viral:Bool){
        // stop the indicator if it already ruuning
        indicator.stopAnimating()
        indicator.startAnimating()
        collectionView.isHidden = true
        
        networkManager.imgurMemes(viral: viral) {[weak self] (memesData, err)  in
            if let err = err {
                print("Failed to fetch courses:", err)
                return
            }
            self?.indicator.stopAnimating()
            self?.collectionView.isHidden = false
            self?.memes = memesData!.memes.filter { (meme) -> Bool in
                
                if let animated = meme.images?.first?.animated{
                    return !animated
                }
                
                return true
            }
            
            self?.collectionView.reloadData()
        }
    }
    
    
    // MARK: - Navigation bar setup
    
   func setUpNavigationBarItems(){
        
        // Color of navigation bar
       
        let navBackgroundImage:UIImage! = UIImage(named: "navbar")
        self.navigationController?.navigationBar.setBackgroundImage(navBackgroundImage,
                                                                    for: .default)
        // left navigation bar button
        let leftBtn = UIButton(type: .system)
        leftBtn.setTitle("↑↓", for: .normal)
        leftBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        leftBtn.tintColor = .white
        leftBtn.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
        
        // right navigation bar button
        let rightBtn = UIButton(type: .system)
        rightBtn.setImage(UIImage(named: "plusbox"), for: .normal)
        rightBtn.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        
        let segmentedBar = BarSegmentedControl(frame: CGRect(x: 0, y: 0, width: 150, height: 40), buttonTitle: ["Most Viral","Feed"])
        segmentedBar.selectorViewColor = .white
        segmentedBar.textColor = .white
        segmentedBar.selectorTextColor = .white
        segmentedBar.backgroundColor = .clear
        segmentedBar.delegate = self
        navigationItem.titleView = segmentedBar
        

    }
}













