//
//  ViewController.swift
//  Simple Net
//
//  Created by Matvei Bykadorov on 03.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var getImageButton: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        activityIndicator.hidesWhenStopped = true
    }


    @IBAction func getImagePressed(_ sender: UIButton) {
        
        label.isHidden = true
        getImageButton.isEnabled = false
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        guard let url = URL(string: "https://applelives.com/wp-content/uploads/2016/03/iPhone-SE-11.jpeg") else {return}
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data, let image = UIImage(data: data) else {return}
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.imageView.image = image
            }
        }.resume()
    }
}

