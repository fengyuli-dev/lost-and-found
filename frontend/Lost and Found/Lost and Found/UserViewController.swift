//
//  UserViewController.swift
//  Lost and Found
//
//  Created by Haoxuan Zou on 11/30/21.
//

import Foundation
import UIKit

class UserViewController:UIViewController{
    private var name = UILabel();
    private var email = UILabel();
    private var menuBarView = MenuTabView()
//    private var foundTableView = UICollectionView();
//    private var lostTableView = UICollectionView();
    private var tabs = ["Found Items","Lost Items"]
    var currentIndex: Int = 0
    var pageController: UIPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO: set all the fonts and formats
        view.backgroundColor = .white
        title = "Profile";
        if let userProf = try? decoder.decode(User1.self, from: userData.object(forKey: "UserProf") as! Data){
            print("userView, decode success")
            self.name.text = userProf.detail.email
        }else{
            print("userview, if let fails")
        }
        name.translatesAutoresizingMaskIntoConstraints=false
        name.textColor = .black
        view.addSubview(name)
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            name.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        menuBarView.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(menuBarView)
        menuBarView.dataArray = ["Found Items","Lost Items"]
        menuBarView.collView.backgroundColor = .gray
        NSLayoutConstraint.activate([
            menuBarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            menuBarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            menuBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            menuBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -400)
        ])
        menuBarView.collView.selectItem(at: IndexPath.init(item: 0, section: 0), animated: true, scrollPosition: .centeredVertically)
        menuBarView.isSizeToFitCellsNeeded = false
        menuBarView.collView.reloadData()
        


        menuBarView.menuDelegate = self
 
        pageController = PageControllerVC();
        pageController.delegate = self
        pageController.dataSource = self
        let they = menuBarView.frame.minY + 500;
        let theheight = self.view.frame.height - they
        pageController.view.frame = CGRect.init(x: 0, y: menuBarView.frame.minY+500, width: self.view.frame.width, height: theheight)
        pageController.setViewControllers([viewController(At: 0)!], direction: .forward, animated: true, completion: nil)
//        self.pageController.view.frame = CGRect.init(x: 0, y: self.view.frame.maxY-menuBarView.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - menuBarView.frame.maxY )

        
        
        
        addChild(pageController)
        view.addSubview(pageController.view)
        pageController.didMove(toParent: self)


    }
}



extension UserViewController: MenuBarDelegate {

    func menuBarDidSelectItemAt(menu: MenuTabView, index: Int) {

        // If selected Index is other than Selected one, by comparing with current index, page controller goes either forward or backward.
        
        if index != currentIndex {

            if index > currentIndex {
                self.pageController.setViewControllers([viewController(At: index)!], direction: .forward, animated: true, completion: nil)
            }else {
                self.pageController.setViewControllers([viewController(At: index)!], direction: .reverse, animated: false, completion: nil)
            }


        }
        print("now menubar didselceting.")
//        if index == 0 {
//            self.pageController.setViewControllers([viewController(At: 0)!], direction: .forward, animated: true, completion: nil)
//        }
//        if index == 1{
//            self.pageController.setViewControllers([viewController(At: 1)!], direction: .forward, animated: true, completion: nil)
//        }
        menuBarView.collView.scrollToItem(at: IndexPath.init(item: index, section: 0), at: .centeredHorizontally, animated: true)

    }
    
    func viewController(At index: Int) -> UIViewController? {
        print("we are here1.")
        print(index)
        if((self.menuBarView.dataArray.count == 0) || (index >= self.menuBarView.dataArray.count)) {
            return nil
        }
        print("we are here2.")
        let contentVC = ContentVC()
        contentVC.strTitle = tabs[index]
        contentVC.pageIndex = index
        currentIndex = index
//        return contentVC

        
        let cc = ContentController()
        cc.pageIndex = index
        return cc;
    }

}



extension UserViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! ContentController).pageIndex
        
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewController(At: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! ContentController).pageIndex
        
        if (index == tabs.count) || (index == NSNotFound) {
            return nil
        }
        
        index += 1
        return self.viewController(At: index)
        
    }
   
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if finished {
            if completed {
                let cvc = pageViewController.viewControllers!.first as! ContentController
                let newIndex = cvc.pageIndex
                menuBarView.collView.selectItem(at: IndexPath.init(item: newIndex, section: 0), animated: true, scrollPosition: .centeredVertically)
                menuBarView.collView.scrollToItem(at: IndexPath.init(item: newIndex, section: 0), at: .centeredHorizontally, animated: true)
            }
        }
        
    }
    
}


