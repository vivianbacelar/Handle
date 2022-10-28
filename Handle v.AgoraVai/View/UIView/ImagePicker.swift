//
//  ImagePicker.swift
//  Holdy v2
//
//  Created by Alexandre César Brandão de Andrade on 25/10/22.
//

import PhotosUI
import SwiftUI

struct ImagePicker:UIViewControllerRepresentable{

    @State var nextView = false

    func makeUIViewController(context: Context) -> some UIViewController {
        let next = CameraViewController()
        return next
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }

}

