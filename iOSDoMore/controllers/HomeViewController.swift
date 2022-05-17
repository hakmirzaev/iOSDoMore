//
//  HomeViewController.swift
//  iOSDoMore
//
//  Created by Bekhruz Hakmirzaev on 16/05/22.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
   
    @IBOutlet var collectionView: UICollectionView!
    var numberOfColumns: CGFloat = 2
    var items: Array<Item> = Array()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initViews()
    }

    // MARK: - Method
    func initViews(){
        addNavigationBar()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCell")
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            let screeSize: CGRect = UIScreen.main.bounds
            let cellWidth = screeSize.width / numberOfColumns - 15
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        }
        items.append(Item(title: "Best Coding", image: "im_collection1"))
        items.append(Item(title: "Amazing Code", image: "im_collection2"))
        items.append(Item(title: "Best Coding", image: "im_collection1"))
        items.append(Item(title: "Amazing Code", image: "im_collection2"))
        items.append(Item(title: "Best Coding", image: "im_collection1"))
        items.append(Item(title: "Amazing Code", image: "im_collection2"))
        items.append(Item(title: "Best Coding", image: "im_collection1"))
        items.append(Item(title: "Amazing Code", image: "im_collection2"))
        items.append(Item(title: "Best Coding", image: "im_collection1"))
        items.append(Item(title: "Amazing Code", image: "im_collection2"))
    }
    func addNavigationBar(){
        let scroll = UIImage(named: "ic_scroll")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: scroll, style: .plain, target: self, action: #selector(scrollTapped))
        title = "Collection View"
    }
    func callScrollViewController(){
        let vc = ScrollViewController(nibName: "ScrollViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Action
    @objc func scrollTapped(){
        callScrollViewController()
    }
    // MARK: - Collection View
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! ItemCollectionViewCell
        cell.titleLabel.text = item.title
        cell.imageView.image = UIImage(named: item.image!)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
}
