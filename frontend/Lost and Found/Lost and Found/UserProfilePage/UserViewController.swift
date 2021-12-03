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
    private var tabs = ["Found Items","Lost Items"]
    var currentIndex: Int = 0
    var pageController: UIPageViewController!

    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        //TODO: set all the fonts and formats
        view.backgroundColor = .white
        title = "Profile";
        
        //set name
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
        
        
        let menutop = view.frame.height * 0.312
        let menubot = view.frame.height * 0.1
        //set menubar
        menuBarView.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(menuBarView)
        menuBarView.dataArray = ["Found Items","Lost Items"]
        menuBarView.collView.backgroundColor = .gray
        NSLayoutConstraint.activate([
            menuBarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            menuBarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            menuBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: menutop),
            menuBarView.heightAnchor.constraint(equalToConstant: menubot)
        ])
        menuBarView.collView.selectItem(at: IndexPath.init(item: 0, section: 0), animated: true, scrollPosition: .centeredVertically)
        menuBarView.isSizeToFitCellsNeeded = false
        menuBarView.collView.reloadData()
        menuBarView.menuDelegate = self
 
        //0.312
        //set pagecontroller
        pageController = PageControllerVC();
        pageController.delegate = self
        pageController.dataSource = self
        print(view.frame.height)
        pageController.view.translatesAutoresizingMaskIntoConstraints = false
        pageController.setViewControllers([viewController(At: 0)!], direction: .forward, animated: true, completion: nil)
 

        addChild(pageController)
        view.addSubview(pageController.view)
        pageController.didMove(toParent: self)
        NSLayoutConstraint.activate([
            pageController.view.topAnchor.constraint(equalTo: menuBarView.bottomAnchor),
            pageController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pageController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            pageController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])


    }
}



extension UserViewController: MenuBarDelegate {

    
    func menuBarDidSelectItemAt(menu: MenuTabView, index: Int) {
        print(index)
        if index != currentIndex {
            if index > currentIndex {
                print("larger!")
                self.pageController.setViewControllers([viewController(At: index)!], direction: .forward, animated: true, completion: nil)
            }else {
                print("lower!")
                self.pageController.setViewControllers([viewController(At: index)!], direction: .reverse, animated: true, completion: nil)
            }
        }
        currentIndex = index
        print("now menubar didselceting.")
        menuBarView.collView.scrollToItem(at: IndexPath.init(item: index, section: 0), at: .centeredHorizontally, animated: true)
//        menuBarView.collView.reloadData()
        
    }
    
    
    func viewController(At index: Int) -> UIViewController? {
        if((self.menuBarView.dataArray.count == 0) || (index >= self.menuBarView.dataArray.count)) {
            return nil
        }
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


