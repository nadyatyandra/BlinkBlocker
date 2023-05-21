//
//  LoseViewController.swift
//  VisionFaceTrack
//
//  Created by Nadya Tyandra on 20/05/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import UIKit

class LoseViewController: UIViewController {
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)

        // Do any additional setup after loading the view.
    }

    @IBAction func backToHome(_ sender: Any) {
        MusicPlayer.shared.playSoundEffect(soundEffectFileName: "Tap", format: "wav")
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
    
    @IBAction func playAgain(_ sender: Any) {
        MusicPlayer.shared.playSoundEffect(soundEffectFileName: "Tap", format: "wav")
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
