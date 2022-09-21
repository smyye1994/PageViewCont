//
//  ViewController.swift
//  PageViewControll
//
//  Created by Sümeyye Kılıçoğlu on 19.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private let controll: UIPageControl = {
       let pageControll = UIPageControl()
        pageControll.addTarget(self,
                               action: #selector(pageControllDidChanged(_:)),
                               for: .valueChanged)
        pageControll.backgroundColor = .systemBlue
        pageControll.numberOfPages = 5
        
        return pageControll
    }()
    @objc func pageControllDidChanged(_ sender: UIPageControl) {
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        view.addSubview(controll)
        view.addSubview(scrollView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.backgroundColor = .red
        controll.frame = CGRect(x: 10, y: view.frame.size.height-100, width: view.frame.size.width-20, height: 70)
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height-100)
     
        
        if scrollView.subviews.count == 2 {
            configureScrollView()
        }
    }
    
    private func configureScrollView() {
        scrollView.contentSize = CGSize(width: view.frame.size.width*5, height: scrollView.frame.size.height)
        scrollView.isPagingEnabled = true
        let color: [UIColor] = [
            .systemRed,
            .systemBlue,
            .systemGreen,
            .systemGray,
            .systemPink
        ]
        
        for x in 0..<5 {
            
            let page = UIView(frame: CGRect(x: CGFloat(x) * view.frame.size.width, y: 0, width: view.frame.size.width, height: scrollView.frame.size.height))
            page.backgroundColor = color[x]
            scrollView.addSubview(page)
        }
        
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        controll.currentPage = Int(floorf(Float(scrollView.contentOffset.x / scrollView.frame.size.width))) 
    }
    
}
