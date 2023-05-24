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
    
    func assignBackground(){
        let background = UIImage(named: "lose")

        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    func zoomIn(image: UIImageView) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.allowUserInteraction, .overrideInheritedOptions],
                       animations: {
            image.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            image.layer.opacity = 1
        }) { _ in
            self.zoomOut(image: image)
        }
    }
    
    func zoomOut(image: UIImageView) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.allowUserInteraction, .overrideInheritedOptions],
                       animations: {
            image.transform = CGAffineTransform.identity
            image.layer.opacity = 1
        }) { _ in
            self.zoomIn(image: image)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        assignBackground()
        zoomIn(image: image1)
        zoomIn(image: image2)

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
