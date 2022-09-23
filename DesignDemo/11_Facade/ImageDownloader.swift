//
//  ImageDownloader.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/22.
//  图片下载类 或者 第三方库

import Foundation

class ImageDownloader {
    typealias Completion = (UIImage, Error?) -> ()
    typealias Progress = (Int, Int) -> ()
    
    func loadImage(at url: URL?, placeholder: UIImage? = nil, progress: Progress? = nil, completion: Completion){
        print("Set up a network stack")
        print("DownLoad an image")
        completion(UIImage(), nil)
        
    }
}

