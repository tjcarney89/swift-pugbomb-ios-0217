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
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.delegate = self
        collectionView?.dataSource = self
        print("VIEW LOADING")
        getAllThePugs {
        
        }
        
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return store.validPugs.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //print("GETTING CALLED")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pugCell", for: indexPath) as! PugViewCell
        let currentPug = store.validPugs[indexPath.item]
        cell.pugImageView.image = currentPug.image
        return cell
    }
    
    
    
    func getAllThePugs(completion: @escaping () -> Void) {
        for i in 1..<400 {
            self.store.createPug { pug in
                pug?.downloadImage {
                    DispatchQueue.main.async {
                        print("NUMBER OF PUGS: \(self.store.validPugs.count)")
                        self.collectionView?.reloadData()
                    }
                }
            }
        }

//        let queue = OperationQueue()
//        queue.maxConcurrentOperationCount = 1
//        if self.store.validPugs.count <= 100 {
//            fetchBatch(on: queue, task: {
//                completion()
//                print("HEY!!!!")
//            })
//            
//        }
        
        
        
            
        
        
        
    }
    
//    func fetchBatch(on queue:OperationQueue, task: (() -> ())?) {
//        var count = 0
//        //var valid = 0
//        while count < 100 {
//            count += 1
//            print("COUNT: \(count)")
//            queue.addOperation {
//                self.store.createPug { pug in
//                    pug?.downloadImage {
//                        DispatchQueue.main.async {
//                            print("NUMBER OF PUGS: \(self.store.validPugs.count)")
//                            //valid += 1
//                            if self.store.validPugs.count == 25 {
//                                //valid = 0
//                                self.fetchBatch(on: queue, task: {
//                                })
//                            }
//                            if self.store.validPugs.count > 100 {
//                               print("hey")
//                                count = 101
//                            }
//                            self.collectionView?.reloadData()
//                        }
//                    }
//                }
//            }
//        }
//    }
    
    
    
}






