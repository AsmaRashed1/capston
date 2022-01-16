//
//  ViewControllerVideo.swift
//  KidsApp
//
//  Created by Asma Rasheed on 03/01/2022.
//

import UIKit
import AVKit
import FirebaseDatabase

class ViewControllerVideo: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableview: UITableView!
    
    
    
    var table = [Videos]()
    var ref: DatabaseReference!
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = tableview.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
        DataVideo()
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return table.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellV", for: indexPath as IndexPath) as! TableViewCell
        let video: Videos
        video = table[indexPath.row]
        cell.LName.text = video.Title
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let videoURL = URL(string: table[indexPath.row].link!) else { return }
        let player = AVPlayer(url: videoURL)
        let controller = AVPlayerViewController()
        controller.player = player
        present(controller, animated: true) { player.play() }
    }
    
    
    
    
    func DataVideo(){
        
        ref = Database.database().reference().child("videos")
        ref.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount > 0 {
                self.table.removeAll()
                for video in snapshot.children.allObjects as! [DataSnapshot] {
                    let Object = video.value as? [String: AnyObject]
                    let Title = Object?["Title"]
                    let videolink = Object?["link"]
                    let video = Videos(Title: Title as? String, link: videolink as? String)
                    self.table.append(video)
                    self.tableview.reloadData()
                }
            }
        })
    }
    
    
    
}
