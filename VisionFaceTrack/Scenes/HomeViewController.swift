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
    
    func assignBackground(){
        let background = UIImage(named: "home")

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
        MusicPlayer.shared.playBackgroundMusic(backgroundMusicFileName: "Home", format: "mp3")
        assignBackground()
        zoomIn()

        // Do any additional setup after loading the view.
    }
    
    func zoomIn() {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.allowUserInteraction, .overrideInheritedOptions],
                       animations: {
            self.image.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            self.image.layer.opacity = 1
        }) { _ in
            self.zoomOut()
        }
    }
    
    func zoomOut() {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.allowUserInteraction, .overrideInheritedOptions],
                       animations: {
            self.image.transform = CGAffineTransform.identity
            self.image.layer.opacity = 1
        }) { _ in
            self.zoomIn()
        }
    }
    
    @IBAction func playGame(_ sender: Any) {
        MusicPlayer.shared.stopBackgroundMusic()
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
