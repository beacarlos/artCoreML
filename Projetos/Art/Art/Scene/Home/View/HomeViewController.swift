//
//  HomeViewController.swift
//  Art
//
//  Created by Beatriz Carlos on 21/06/21.
//
import UIKit
import CoreML
import Vision

class HomeViewController: UIViewController {
    let contentView: HomeView = {
        let view = HomeView(frame: UIScreen.main.bounds)
        view.selectButton.addTarget(self, action: #selector(tapSelectButton), for: .touchUpInside)
        view.seeMoreButton.addTarget(self, action: #selector(tapSeeMoreButton), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = contentView
    }
    
    @objc func tapSelectButton(sender: UIButton) {
        ChooseImage().pickerImage(self) { image in
            self.contentView.artObjectImage.image = image
            
            guard let ciimage = CIImage(image: image) else {
                fatalError("Deu ruim idiota")
            }
            self.detect(image: ciimage)
            
        }
    }
    
    @objc func tapSeeMoreButton(sender: UIButton) {
        present(biographyViewController(authorID: "vincent_van_gogh"), animated: true, completion: nil)
    }
    
    func detect(image: CIImage) {
        guard let model = try? VNCoreMLModel(for: Art().model) else {
            fatalError("Loading CoreML Model Failed.")
        }
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Model failed to process image.")
            }
            //print(results)
            if let firstResult = results.first {
                self.contentView.authorNameLabel.text = (firstResult.identifier.capitalized).replacingOccurrences(of: "_", with: " ")
            }
        }
        let handler = VNImageRequestHandler(ciImage: image)
        do {
            try handler.perform([request])
        }
        catch {
            print(error)
        }
    }
}
