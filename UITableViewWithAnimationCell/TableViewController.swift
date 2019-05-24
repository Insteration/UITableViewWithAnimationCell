//
//  TableViewController.swift
//  UITableViewWithAnimationCell
//
//  Created by Art Karma on 5/24/19.
//  Copyright © 2019 Art Karma. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var numbers: [Int]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateNumbers()

    }
    
    private func generateNumbers() {
        numbers = [Int]()
        for _ in 0...10 {
            let number = Int.random(in: 10...20000)
            numbers.append(number)
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numbers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = String(numbers[indexPath.row])
        return cell
    }
    
}

extension TableViewController {
    
    // MARK: Cells
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
//        let degree: Double = 90
//        let rotationAngle = CGFloat(degree * .pi / 180)
//        let rotationTransform = CATransform3DMakeRotation(rotationAngle, 1, 0, 0)
//
//        cell.layer.transform = rotationTransform
//
//        UIView.animate(withDuration: 1, delay: 0.2 * Double(indexPath.row), options: .curveEaseInOut, animations: {
//            cell.layer.transform = CATransform3DIdentity
//        })
        
        let translation = CATransform3DTranslate(CATransform3DIdentity, -500, 400, 0)
        cell.layer.transform = translation
        
        UIView.animate(withDuration: 1, delay: 0.2 * Double(indexPath.row), options: .curveEaseInOut, animations: {
            cell.layer.transform = CATransform3DIdentity
        })
    }
}
