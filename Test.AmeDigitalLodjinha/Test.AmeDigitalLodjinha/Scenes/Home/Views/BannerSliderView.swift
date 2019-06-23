//
//  BannersSliderView.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 16/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import UIKit
import SDWebImage

class BannerSliderView: UIView {

    let kDeviceScreenWidthSize = UIScreen.main.bounds.width
    let kSliderHeight: CGFloat = CGFloat(200)
    
    var currentPageNumber: Int = 0
    let imagesUrl: [String]
    let adressesUrl: [String]
    
    init(imagesUrl: [String], adressesUrl: [String]) {
        self.imagesUrl = imagesUrl
        self.adressesUrl = adressesUrl
        super.init(frame: CGRect(x: 0, y: 0, width: kDeviceScreenWidthSize, height: kSliderHeight))
        self.setupViews()
        self.setupTapGesture()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var contentScrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.kDeviceScreenWidthSize, height: self.kSliderHeight))
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: (self.kDeviceScreenWidthSize*CGFloat(self.imagesUrl.count)), height: self.kSliderHeight)
        scrollView.isPagingEnabled = true
        
        let imageViews = self.getImageViews(widthFrame: scrollView.frame.width, heightFrame: scrollView.frame.height)
        imageViews.forEach { scrollView.addSubview($0) }
        
        return scrollView
    }()
    
    lazy var pageControlView: UIPageControl = {
        let pageControl = UIPageControl(frame: CGRect(x: 0, y: 180, width: self.kDeviceScreenWidthSize, height: 10))
        pageControl.numberOfPages = self.imagesUrl.count
        pageControl.currentPage = 0
        pageControl.tintColor = .gray
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .white
        
        return pageControl
    }()
    
    private func setupViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.contentScrollView)
        self.addSubview(self.pageControlView)
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openBannerLinkInBrowser))
        tapGesture.cancelsTouchesInView = false
        tapGesture.numberOfTapsRequired = 1
        self.contentScrollView.addGestureRecognizer(tapGesture)
    }
    
    @objc func openBannerLinkInBrowser(_ recognizer: UITapGestureRecognizer) {
        guard let url = URL(string: self.adressesUrl[self.currentPageNumber]) else { return }
        UIApplication.shared.openURL(url)
    }

    private func getImageViews(widthFrame: CGFloat, heightFrame: CGFloat) -> [UIImageView] {
        var imageViews = [UIImageView]()
        
        for i in 0..<self.imagesUrl.count {
            let imageView = UIImageView()
            imageView.sd_setImage(with: URL(string: self.imagesUrl[i]), placeholderImage: UIImage(named: "noPhotoPlaceholder"))
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            
            let xPosition = self.kDeviceScreenWidthSize*CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: widthFrame, height: heightFrame)
            
            imageViews.append(imageView)
        }
        
        return imageViews
    }
    
}

extension BannerSliderView: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(self.contentScrollView.contentOffset.x / self.contentScrollView.frame.size.width)
        self.currentPageNumber = Int(pageNumber)
        self.pageControlView.currentPage = Int(pageNumber)
    }
    
}
