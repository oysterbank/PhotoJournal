//
//  EntryTableViewController.swift
//  PhotoJournal
//
//  Created by Kris Laratta on 8/18/18.
//  Copyright © 2018 Kris Laratta. All rights reserved.
//

import UIKit

class EntryTableViewController: UITableViewController {
    
    //MARK: Properties
    var entries = [Entry]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the sample data.
        loadSampleEntries()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "EntryTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? EntryTableViewCell else {
            fatalError("The dequeued cell is not an instance of EntryTableViewCell.")
        }
        
        // Fetches the appropriate entry for the data source layout.
        let entry = entries[indexPath.row]

        cell.titleLabel.text = entry.name
        cell.photoImageView.image = entry.photo
        cell.favoriteControl.favorite = entry.favorite

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Private Methods
    
    private func loadSampleEntries() {
        let photo1 = UIImage(named: "entry1")
        let photo2 = UIImage(named: "entry2")
        let photo3 = UIImage(named: "entry3")
        
        guard let entry1 = Entry(name: "The Bonfire", photo: photo1, favorite: false) else {
            fatalError("Unable to instantiate entry1")
        }
        
        guard let entry2 = Entry(name: "Number Nine", photo: photo2, favorite: true) else {
            fatalError("Unable to instantiate entry2")
        }
        
        guard let entry3 = Entry(name: "Overlook", photo: photo3, favorite: false) else {
            fatalError("Unable to instantiate entry3")
        }
        
        entries += [entry1, entry2, entry3]
    }

}
