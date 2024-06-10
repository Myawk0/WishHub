//
//  UIImage+Extension.swift
//  WishHub
//
//  Created by Мявкo on 9.06.24.
//

import UIKit

extension UIImage {
    func resizeImage(size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        let resizedImage = renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        return resizedImage
    }
    
    func compressImage() -> Data {
        let newSize = CGSize(width: 150, height: 150)
        let resizedImage = self.resizeImage(size: newSize)
        return resizedImage.jpegData(compressionQuality: 0.25) ?? Data()
    }
}
