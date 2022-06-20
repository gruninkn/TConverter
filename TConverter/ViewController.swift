//
//  ViewController.swift
//  TConverter
//
//  Created by Kirill Grunin on 19.06.2022.
//

import UIKit

class ViewController: UIViewController {

    var portraitConstraint: [NSLayoutConstraint]?
    var landscapeConstraint: [NSLayoutConstraint]?
    var isLandscape: Bool = false
    
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
        label.font = UIFont(name: "Chalkduster", size: 32)
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
        label.font = .systemFont(ofSize: 28)
        return label
    }()
    
    private lazy var slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 0
        slider.addTarget(self, action: #selector(valueChange), for: .valueChanged)
        return slider
    }()
    
    private let farenheitTemperature: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "32ºF"
        label.textColor = .black
        label.font = .systemFont(ofSize: 28)
        return label
    }()
    
    @objc func valueChange() {
        celciusTemperature.text = "\(Int(round(slider.value)))ºC"
        farenheitTemperature.text = "\(Int(round(slider.value * 9 / 5 + 32)))ºF"
    }

    private func layout() {
        
        [image, topLabel, celciusTemperature, slider, farenheitTemperature].forEach { view.addSubview($0) }
        
        portraitConstraint = [topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
                    topLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ]
        
        landscapeConstraint = [topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                     topLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ]
        
        NSLayoutConstraint.activate([
            
            image.topAnchor.constraint(equalTo: view.topAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            slider.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            slider.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -32),
            slider.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            celciusTemperature.bottomAnchor.constraint(equalTo: slider.topAnchor, constant: -30),
            celciusTemperature.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            farenheitTemperature.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 30),
            farenheitTemperature.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    
    }
    
    override func viewDidLayoutSubviews() {
        isLandscape = UIDevice.current.orientation.isLandscape
        if isLandscape {
            NSLayoutConstraint.deactivate(portraitConstraint!)
            NSLayoutConstraint.activate(landscapeConstraint!)
        } else {
            NSLayoutConstraint.deactivate(landscapeConstraint!)
            NSLayoutConstraint.activate(portraitConstraint!)
        }
    }
}

