//
//  MainPageModel.swift
//  DesignDemo
//
//  Created by mqh on 2022/7/26.
//

import Foundation

struct MainPageCellModel: Decodable {
    public var type: String?
    public var title: String?
    public var userName: String?
    public var content: String?
    public var subTitle: String?
    public var height: Float?
    public var id: String?
    
    private enum CodingKeys: String, CodingKey{
        case id, type, title, userName, content, subTitle, height
    }
    
    init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
            type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
            title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
            userName = try container.decodeIfPresent(String.self, forKey: .userName) ?? ""
            content = try container.decodeIfPresent(String.self, forKey: .content) ?? ""
            subTitle = try container.decodeIfPresent(String.self, forKey: .subTitle) ?? ""
            height = try container.decodeIfPresent(Float.self, forKey: .height) ?? 0
        } catch  {
            debugPrint(error.localizedDescription)
        }
    }
    
    init(id: String?, type: String?, title: String?, userName: String?, content: String?, subTitle: String?, height: Float? ){
        
    }
    
    func getFadeData(){
    
    }
   
    
    
}
