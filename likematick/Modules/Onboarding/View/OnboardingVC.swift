//
//  OnboardingVC.swift
//  likematick
//
//  Created by ferhatiltas on 13.07.2022.
//

import UIKit

class OnboardingVC: UIViewController {
    // Variables
    var onboardViewModel: OnboardViewModel = .init()
    
    //  IBOutles
    @IBOutlet var signupButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var pageControler: UIPageControl!
    @IBOutlet var pageControl: UIPageControl!
    
    @IBOutlet var collectionView: UICollectionView!
}

// MARK: - View Life Cycle
extension OnboardingVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signupButton.layer.cornerRadius = 10
        loginButton.layer.cornerRadius = 10
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = #colorLiteral(red: 1, green: 0, blue: 0.03099999949, alpha: 1)
        pageControler.numberOfPages = onboardViewModel.onboardList.count
    }
}

// MARK: - IBAction
extension OnboardingVC {
    @IBAction func signupButtonAction(_ sender: UIButton) {
        print("Clicked sign up")
    }

    @IBAction func loginButtonAction(_ sender: UIButton) {
        print("Clicked login")
    }

    @IBAction func skipButtonAction(_ sender: UIButton) {
        print("Clicked skip")
    }

    @IBAction func pageControlClick(_ sender: Any) {
        onboardViewModel.currentPage = Int(pageControler.currentPage)
        let rect = self.collectionView.layoutAttributesForItem(at: IndexPath(row: onboardViewModel.currentPage, section: 0))?.frame
        self.collectionView.scrollRectToVisible(rect!, animated: true)
    }
}

// MARK: - UICollectionView Delegate and DataSource
extension OnboardingVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardViewModel.onboardList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardViewCollectionViewCell.identifier, for: indexPath) as! OnboardViewCollectionViewCell
        cell.setup(onboardViewModel.onboardList[indexPath.row])
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        onboardViewModel.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControler.currentPage = onboardViewModel.currentPage
    }
}
