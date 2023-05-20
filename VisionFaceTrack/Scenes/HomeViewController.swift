//
//  HomeViewController.swift
//  VisionFaceTrack
//
//  Created by Nadya Tyandra on 20/05/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        MusicPlayer.shared.playBackgroundMusic(backgroundMusicFileName: "Home", format: "mp3")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func playGame(_ sender: Any) {
        MusicPlayer.shared.stopBackgroundMusic()
//        MusicPlayer.shared.playBackgroundMusic(backgroundMusicFileName: "Game", format: "mp3")
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(storyboard, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
