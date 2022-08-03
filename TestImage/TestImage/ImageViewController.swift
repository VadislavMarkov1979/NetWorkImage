//
//  ImageViewController.swift
//  TestImage
//
//  Created by Владимир Макаров on 12.02.2022.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityImage: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityImage.color = .red
        activityImage.style = .large
        activityImage.startAnimating()
        activityImage.hidesWhenStopped = true
        fetchImage()
    }
    

    private func fetchImage() {
        guard let url = URL(string: "https://phonoteka.org/uploads/posts/2021-06/1624029773_11-phonoteka_org-p-originalnie-oboi-na-aifon-krasivo-11.jpg") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            print(response)
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.imageView.image = image
                self.activityImage.stopAnimating()
            }
        }.resume()
    }

}
