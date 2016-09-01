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

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
  
    override func viewDidAppear(_ animated: Bool) {
        
        var contentWidth: CGFloat = 0.0
        print("Scrollview width: \(scrollView.frame.size.width)")
        
        let scrollWidth = scrollView.frame.size.width
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png")
       
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
           
            // We're basing the width of the width of the scroll
            newX = scrollWidth / 2 + scrollWidth * CGFloat(x)
            
            
            contentWidth += newX
            
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: newX - 75, y: (scrollView.frame.size.height / 2) - 75, width: 150, height: 150)
         
        }
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        // clipsToBounds, we don't want the scrollView to clip what's behind it but to show it so we set clipsToBounds as False
        scrollView.clipsToBounds = false
        
    }
    

}

