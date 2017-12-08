//
//  MemberModel.swift
//  IT-IronMan
//
//  Created by don chen on 2017/12/7.
//  Copyright © 2017年 Don Chen. All rights reserved.
//

import Foundation
import SwiftyJSON

struct MemberModel {
    var name:String
    var title:String
    var link:String
    var joinDays:Int
    var postCount:Int
    var subscriberCount:Int
    var postList = [PostModel]()
    
    init(json:JSON) {
        name            = json["name"].stringValue
        title           = json["title"].stringValue
        link            = json["link"].stringValue
        joinDays        = json["joinDays"].intValue
        postCount       = json["posts"].intValue
        subscriberCount = json["subscriber"].intValue
        
        for (_,subJson):(String,JSON) in json["postList"] {
            let item = PostModel(json: subJson)
            postList.append(item)
        }
    }
}
