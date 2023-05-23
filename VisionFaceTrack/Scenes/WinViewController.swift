//
//  WinViewController.swift
//  VisionFaceTrack
//
//  Created by Nadya Tyandra on 21/05/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import UIKit

class WinViewController: UIViewController {
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    
    func assignBackground(){
        let background = UIImage(named: "wallpaper.jpg")

        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        assignBackground()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToHome(_ sender: Any) {
        MusicPlayer.shared.playSoundEffect(soundEffectFileName: "Tap", format: "wav")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.navigationController?.pushViewController(storyboard, animated: true)
        }
    }
    
    @IBAction func playAgain(_ sender: Any) {
        MusicPlayer.shared.playSoundEffect(soundEffectFileName: "Tap", format: "wav")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.navigationController?.pushViewController(storyboard, animated: true)
        }
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
