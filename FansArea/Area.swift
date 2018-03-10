//
//  Area.swift
//  FansArea
//
//  Created by 瞿炬星 on 2018/3/9.
//  Copyright © 2018年 瞿炬星. All rights reserved.
//

struct Area {
    var name : String
    var province : String
    var part : String
    var image : String
    var isVisited : Bool
    var rating = ""
    
    
    init(name: String, province: String, part: String, image: String, isVisited: Bool) {
        self.name = name
        self.province = province
        self.part = part
        self.image = image
        self.isVisited = isVisited
    }
}


