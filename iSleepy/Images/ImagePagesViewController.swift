//
//  ImageViewController.swift
//  iSleepy
//
//  Created by 19079884 on 13.08.2021.
//

import UIKit


class ImagePagesViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var pages = [ImageViewController]()
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let imageVewController = viewController as! ImageViewController
        let prev = imageVewController.index > 0 ? imageVewController.index - 1 : 0
        return pages[prev]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let imageVewController = viewController as! ImageViewController
        let next = (imageVewController.index + 1) % pages.count
        return pages[next]
    }
    
    let imageDataSource: ImageDataSource = ImageDataSource()
    
    public var titleOpt: TitleDataSource.Title?
    
    override func viewDidLoad() {
        if let title = titleOpt {
            imageDataSource.load(titleId: title.id)
        }
        for i in 0..<imageDataSource.images.count {
            let image = imageDataSource.images[i]
            let imageViewController = ImageViewController()
            imageViewController.createImageView(imageUrl: image, index: i)
            pages.append(imageViewController)
        }
        self.dataSource = self
        self.setViewControllers(pages, direction: Self.NavigationDirection.forward, animated: true, completion: nil)
        super.viewDidLoad()
    }
}
