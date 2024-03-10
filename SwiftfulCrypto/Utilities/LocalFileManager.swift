//
//  LocalFileManager.swift
//  SwiftfulCrypto
//
//  Created by Nithya Vasudevan on 09.03.24.
//

import Foundation
import SwiftUI

class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    private init() {}
    
    func saveImage(image : UIImage, imageName : String, folderName : String) {
        
        //create folder if not already there
        self.createFolderIfNeeded(name : folderName)
        
        //get path for image , convert image to Data type
        guard  let url = getURLforImage(imageName: imageName, folderName: folderName),
               let data = image.pngData()
        else { return }
        
        //save image data to file path
        do {
            try data.write(to: url)
        } catch  {
            print("Error in saving image to url : \(imageName) - Error : \(error)")
        }
    }
    
    
    func getImage(imageName : String, folderName : String) -> UIImage? {
        
        guard let imageURL = getURLforImage(imageName: imageName, folderName: folderName),
              FileManager.default.fileExists(atPath: imageURL.path(percentEncoded: false)) else {
            return nil
        }
        return UIImage(contentsOfFile: imageURL.path(percentEncoded: false))
    }
    
    
    private func createFolderIfNeeded(name : String) {
        
        guard let url = getURLforFolder(named: name) else {
            return
        }
        
        if !FileManager.default.fileExists(atPath: name) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            } catch  {
                print("Error creating folder : \(name) - Error :  \(error)")
            }
        }
    }
    
    private func getURLforFolder(named folderName : String) -> URL? {
        
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        else { return nil }
        return url.appending(component: folderName)
    }
    
    private func getURLforImage(imageName : String, folderName : String) -> URL? {
        guard let url = getURLforFolder(named: folderName)
        else {return nil}
        
        return url.appending(path: imageName + ".png")
    }
    
    
}
