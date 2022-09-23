//
//  UIImageView+DownloadImage.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/22.
//  好处：
//（1）如果需要更改当前的图像下载方法，只需要在一个地方完成修改即可。
//（2）提供对一小部分功能的访问满足大多数客户的需求，可以设置常用或者默认参数。

import Foundation
import SDWebImage

extension UIImageView {
    
    //包装第三方库 对外提供下载的方法
    func downloadImage(at url: URL?){
        sd_setImage(with: url, completed: nil)
    }
    
    //包装自己的子系统或者类
    func downloadImageByOwn(at url: URL?){
        let placeHolder = UIImage(named: "placeholder")
        ImageDownloader().loadImage(at: url, placeholder: placeHolder,  completion: {
            image, error in
            print("Handle an image")
            self.image = image
        })
    }
    
}
