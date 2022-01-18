//
//  ViewController.swift
//  EjercicioLayout
//
//  Created by Vanesa Korbenfeld on 25/11/2021.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    let principalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bear_first")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let principalTitle: UITextView = {
        let title = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string:"\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stories soon.", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor : UIColor.gray]))
        
        title.attributedText = attributedText
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.isEditable = false
        title.isScrollEnabled = false
        return title
    }()
    
    private let previousBotton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    private let nextBotton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        let pinkColor = UIColor(displayP3Red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        button.setTitleColor(pinkColor, for: .normal)
        return button
    }()

    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.currentPage = 0
        pc.numberOfPages = 14
        let pinkColor = UIColor(displayP3Red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        pc.currentPageIndicatorTintColor = pinkColor
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.addSubview(principalTitle)
        
        setupLayout()
        
        setupBottomControls()
        
    }
    fileprivate func setupBottomControls(){
        let bottomControls = UIStackView(arrangedSubviews: [previousBotton, pageControl, nextBotton])
        bottomControls.translatesAutoresizingMaskIntoConstraints = false
        bottomControls.distribution = .fillEqually
        
        view.addSubview(bottomControls)
        
        NSLayoutConstraint.activate([
            bottomControls.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControls.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControls.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControls.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    private func setupLayout(){
        let topImageContainerView = UIView()
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topImageContainerView)
        
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.addSubview(principalImageView)
        
        principalImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        principalImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        principalImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        principalTitle.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        principalTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        principalTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        principalTitle.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
    }

}

