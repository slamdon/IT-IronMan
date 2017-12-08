//
//  MemberStore.swift
//  IT-IronMan
//
//  Created by don chen on 2017/12/7.
//  Copyright © 2017年 Don Chen. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MemberStore {
    class func requestPosts(completion:((_ items:[MemberModel]?) -> Swift.Void)?) {
        Alamofire.request("http://ironmans.goodideas-studio.com/",
                          method: HTTPMethod.get,
                          parameters: nil,
                          encoding: URLEncoding.default,
                          headers: nil).responseJSON{ (response:DataResponse<Any>) in
                            
                            switch(response.result) {
                            case .success(_):
                                if let value = response.result.value {
                                    let json = JSON(value)
                                    var members = [MemberModel]()
                                    for (_, subJson) in json {
                                        let member = MemberModel(json: subJson)
                                        members.append(member)
                                    }
                                    completion?(members)
                                    
                                } else {
                                    completion?(nil)
                                    
                                }
                                
                            case .failure(let encodingError):
                                print("request failed \(encodingError)")
                                completion?(nil)
                                
                            }
                            
                            
                            
        }
        
    }
}
