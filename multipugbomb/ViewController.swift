//
//  ViewController.swift
//  multipugbomb
//
//  Created by Johann Kerr on 3/21/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    
    let store = PugDataStore.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.delegate = self
        collectionView?.dataSource = self
        print("VIEW LOADING")
        getAllThePugs {
            print("DONE!")
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return store.pugs.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //print("GETTING CALLED")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pugCell", for: indexPath) as! PugViewCell
        let currentPug = store.pugs[indexPath.item]
        cell.pugImageView.image = currentPug.image
        return cell
    }
    
    
    
    func getAllThePugs(completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            for _ in 0..<300 {
                self.store.createPug { pug in
                    pug?.downloadImage {
                        DispatchQueue.main.async {
                            print("NUMBER OF PUGS: \(self.store.pugs.count)")
                            self.collectionView?.reloadData()
                        }
                    }
                }
            }
            completion()
        }
    }


}






