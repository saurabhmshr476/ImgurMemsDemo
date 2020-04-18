# ImgurMemsDemo (Using Xcode  11.3.1 and Swift 5)

This demo using the imgur gallery api for the data and shows the memes coming from imgur. 

## Getting Started

You can download this demo on your local machine. Open xcode workspace file and run it.

## Project Structure

Project folder structure is as below.
```
MemefulDemo
  - AppDelegate.swift
  - SceneDelegate.swift
   ViewController
     - HomeViewController.swift
   Views
     - BarSegmentedControl.swift
     - MemsCell.swift
   Layout
     - Memeslayout.swift
   Extension
     - ViewController+Extension.swift
     - String+Extension.swift
   Models
     - MemesResult.swift
     - Meme.swift
     - MemeImage.swift
   Network
     - Service.swift
  Storyboards    
     - Main.storyboard
     - LaunchScreen.storyboard
  Assets    
     - Assets.xcassets
  Info.plist

```


## Home View Controller

On Home view controller the default viral content will be shown after getting the data from imgur API.

### Navigation bar segmented button 

#### Most viral

You can click this button for most viral content . This is the  selected by defalut.

#### Feed

You can click this button for normal feed content.

### Nav Bar left Button -   sorting based on upvote point - ascending and descending order


Nav bar Left button click sort the result based on points (ascending and descending order) 

```
@objc func sortByPoints(sender : UIBarButtonItem){

        if sortByPoint {
            sortByPoint = false
            memes = memes.sorted(by: { Int($0.points!) < Int($1.points!) })
            
        }else{
            sortByPoint = true
            memes = memes.sorted(by: { Int($0.points!) > Int($1.points!) })
        }

        collectionView.reloadData()

    }
```

### Image data filtering

Some images has property animated is true and it is mp4 file url so cell is not be able to display it . I will remove those memes from my memes item that has image property animated to true.

```
.filter { (meme) -> Bool in
                
                if let animated = meme.images?.first?.animated{

                    return !animated
                }
                
                return true
            }
```


