//
//  ViewController.swift
//  LottieTest
//
//  Created by Thiago Diniz on 16/08/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    let animationView = LOTAnimationView(name: "tutorial")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = 6
        setupAnimation()
        setupScroll()
    }
    
    func setupScroll() {
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: self.view.frame.size.width * 6, height: scrollView.frame.size.height)
    }
    
    func setupAnimation() {
        animationView.frame = CGRect(x: 0, y: 50, width: self.view.frame.size.width, height: 300)
        animationView.contentMode = .scaleAspectFill
        animationView.loopAnimation = true
        view.addSubview(animationView)
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let progress = scrollView.contentOffset.x / scrollView.contentSize.width
        animationView.animationProgress = progress
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}

