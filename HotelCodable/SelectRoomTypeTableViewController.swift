//
//  SelectRoomTypeTableViewController.swift
//  HotelCodable
//
//  Created by Berlin Thomas on 2024-03-24.
//

import UIKit

protocol SelectRoomTypeTableViewControllerDelegate: AnyObject {
    func selectRoomTypeTableViewController(_ controller: SelectRoomTypeTableViewController, didSelect roomType: RoomType)
}

class SelectRoomTypeTableViewController: UITableViewController {
    
    weak var delegate: SelectRoomTypeTableViewControllerDelegate?
    
    var roomType: RoomType?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RoomType.all.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTypeCell", for: indexPath)

        let roomType = RoomType.all[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = roomType.name
        content.secondaryText = "$ \(roomType.price)"
        
        if roomType == self.roomType {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let roomType = RoomType.all[indexPath.row]
        self.roomType = roomType
        delegate?.selectRoomTypeTableViewController(self, didSelect: roomType)
        tableView.reloadData()
    }

}
