# ImgurMemsDemo (Using Xcode  11.3.1 and Swift 5)

This demo using the imgur gallery api for the data and shows the memes coming from imgur. 

## Getting Started

You can download this demo on your local machine. Open xcode workspace file and run it.

## Home View Controller
On Home view controller the default viral content will be shown after getting the data from imgur API.
### Navigation bar segmented button 

#### Most viral

You can click this button for most viral content . This is the  selected by defalut.

#### Feed

You can click this button for normal feed content.


### Image data filtering

Some images has property animated is true and it is mp4 file url so cell is not be able to display it . I will remove those memes from my memes item that has image property animated to true.


```
HomeViewController.swift

```

Above Swift file contains code snippet used for filtering the image is as below  


```
.filter { (meme) -> Bool in
                
                if let animated = meme.images?.first?.animated{

                    return !animated
                }
                
                return true
            }
```


