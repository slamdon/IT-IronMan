//
//  postModel.swift
//  IT-IronMan
//
//  Created by don chen on 2017/12/7.
//  Copyright © 2017年 Don Chen. All rights reserved.
//

import Foundation
import SwiftyJSON

struct PostModel {
    var title:String
    var like:Int
    var comment:Int
    var view:Int
    var date:String
    var url:String
    
    init(json:JSON) {
        title   = json["title"].stringValue
        like    = json["like"].intValue
        comment = json["comment"].intValue
        view    = json["view"].intValue
        date    = json["date"].stringValue
        url     = json["url"].stringValue
    }
    
}
