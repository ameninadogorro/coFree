//
//  TesteViewController.swift
//  MakeItGreatChallenge
//
//  Created by Israel Carvalho on 13/02/23.
//

import UIKit

class TesteViewController: UIViewController {

    let testeLabel: UILabel = {
        let label = UILabel()
        label.text = "Gay"
        //label.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height * 0.1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemPink
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .white
//        view.backgroundColor = .blue
        view.backgroundColor = .white
        view.addSubview(testeLabel)
        // Do any additional setup after loading the view.
        
        NSLayoutConstraint.activate([
            testeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            testeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            testeLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
            testeLabel.topAnchor.constraint(equalTo: view.centerYAnchor),
            testeLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25)
//            testeLabel.widthAnchor.c
        ])
        
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
