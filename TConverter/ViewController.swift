//
//  ViewController.swift
//  TConverter
//
//  Created by Kirill Grunin on 19.06.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "T-Converter"
        label.textColor = .black
        label.font = .systemFont(ofSize: 32)
        return label
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "day")
        return image
    }()
    
    private let celciusTemperature: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0ºC"
        label.textColor = .black
        label.font = .systemFont(ofSize: 32)
        return label
    }()
    
    private lazy var slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        return slider
    }()

    private func layout() {
        
        view.addSubview(image)
        image.addSubview(topLabel)
        image.addSubview(celciusTemperature)
        image.addSubview(slider)
        
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            topLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            image.topAnchor.constraint(equalTo: view.topAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            celciusTemperature.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 50),
            celciusTemperature.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            slider.topAnchor.constraint(equalTo: celciusTemperature.bottomAnchor, constant: 50),
            slider.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32),
            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
}

