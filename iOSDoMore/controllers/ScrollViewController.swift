//
//  ScrollViewController.swift
//  iOSDoMore
//
//  Created by Bekhruz Hakmirzaev on 16/05/22.
//

import UIKit

class ScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }

    // MARK: - Method
    func initView(){
        addNavigationBar()
    }
    func addNavigationBar(){
        let back = UIImage(named: "ic_back")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(backTapped))
        title = " Scroll View"
    }
    // MARK: - Action
    @objc func backTapped(){
        self.navigationController?.popViewController(animated: true)
    }

}
