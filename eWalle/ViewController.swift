//
//  ViewController.swift
//  eWalle
//
//  Created by Жеребцов Данил on 20.07.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.present(controller, animated: true) { [weak self] in
            guard let `self` = self else { return }
            UIView.animate(withDuration: 0.5, delay: 0.0) {
                self.view.frame.origin.x += 168
                self.view.frame.origin.y += 108
                self.view.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 6)

            }

        }
    }

}

