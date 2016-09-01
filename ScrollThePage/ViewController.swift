//
//  ViewController.swift
//  ScrollThePage
//
//  Created by Pasha Bahadori on 8/31/16.
//  Copyright © 2016 Pelican. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    var images = [UIImageView]()
    
    // What we want to do is we want to get all of our items showing on the screen
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // We're going to go through the loop 3 times and create an image
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png")
            // We'll add a reference for the UIImageView so we can do stuff with the UIImageView. We're not doing anything with the images array but in most cases you want to keep references to objects you're adding to the screen - so you can manipulate the objects and do more stuff
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            // We're going to get the position on the screen that we need
            // For (view.frame.midX) The view starts as 0,0 on the top left, the width goes to the right and height goes down. midX is the top middle of the screen
            // The view.frame.size.width is the entire width's size MULTIPLIED BY the index which for the 1st index is 0, so the first iteration is in the middle of the screen
            // The 2nd iteration we're going to take the entire screen size and add it on top of the current one, and it'll move it to the next position on the right
            //
            newX = view.frame.midX + view.frame.size.width * CGFloat(x)
            
            scrollView.addSubview(imageView)
            
            // Right now the image has an arbitrary width and height so we need to add those
            // When you set the frame and you're working with scrollViews like this programmatically and you want to set different device sizes, you'll have to choose different sizes for different frames. (iPad might be 300x300, iPhone 100x100) so you'd have to write code to detect what screen sizes the user has
            
            // Here we're setting the frame on the image AFTER it's been added to the scrollView, just to ensure we have the new coordinate system in place
            // A view's coordinate system is dependent on it's parent. x = 0 is going to place it at the top.
            imageView.frame = CGRect(x: newX - 75, y: (view.frame.size.height / 2) - 75, width: 150, height: 150)
            
            // We need to set the content size of the scrollView
        }
          print("Count: \(images.count)")
    }
  
    // We'll go through this loop, create an imageView, set it's position then add it as a subview of the scrollView
    //How are we going to add the images to the scroll view? First thing is we want it in the center. 
    // The second view needs to be exactly in the center, but a whole screen to the right - (Take the full size width of your scrollView and that's what you want to move to the position on the right hand side. If we had one item, it'd be one full screen off the screen, if we had two items, it'd be 2 full screens off the screen
    // So when you scroll, it slides right into place. 
    
    // Since our scrollView is the same width as the view, We can use the bounds of the view to get those numbers. (This is video game math, you need to think of things as X and Y positions on a grid)


}

