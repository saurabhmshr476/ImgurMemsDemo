//
//  ViewController+Extension.swift
//  MemefulDemo
//
//  Created by SAURABH MISHRA on 18/04/20.
//  Copyright © 2020 SAURABH MISHRA. All rights reserved.
//

import UIKit





// MARK: - CollectionView delegate and datasource

extension HomeViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        memes.count
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let meme = memes[indexPath.item]
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MemesCell
        cell.meme = meme
        return cell
        
    }
    
  
    
}



// MARK: - CollectionView Layout Delegate (for cell height calculation)

extension HomeViewController: MemeslayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath, with width: CGFloat) -> CGFloat {
        
        let meme = memes[indexPath.row]
        

        if let images = meme.images, let imgHeight = images.first?.height, let imgWidth = images.first?.width{

            let aspectRatio = CGFloat(imgHeight)/CGFloat(imgWidth)
            
            let height = width *  aspectRatio
            
            return height
           
        }
        return 180 // some constant height if nothing is found
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForCaptionAtIndexPath indexPath: IndexPath, with width: CGFloat) -> CGFloat {
        
        let meme = memes[indexPath.row]
        if let title = meme.title{
            
            let topPadding = CGFloat(8.0)
            
            let bottomPadding = CGFloat(8.0)
            
            let captionTitleFont = UIFont.systemFont(ofSize: 18, weight: .bold)
            
            let captionTitleHeight = title.heightWithConstrainedWidth(width: width, font: captionTitleFont)
            
            let arrowImgHeight = CGFloat(25.0)
            
            let height = topPadding*2 + bottomPadding + captionTitleHeight + arrowImgHeight
            
            return height
        }
       
        
        return 0.0 // we can also return some space for bottom caption view if it has no title
    }
    
   

    
}

// MARK: - Segmented Control Delegate method

extension HomeViewController: BarSegmentedControlDelegate {
    func changeToIndex(index: Int) {
        
        if index == 0{
            
            // fetch result :  sorted by viral  content
            fetchImgurMemes(isViral: true)
        }else{
            // fetch result :  sorted by general content
            fetchImgurMemes(isViral: false)
        }

        
    }
    
    

    
   

    
}
