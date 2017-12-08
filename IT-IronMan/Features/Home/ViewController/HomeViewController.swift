//
//  HomeViewController.swift
//  IT-IronMan
//
//  Created by don chen on 2017/12/7.
//  Copyright © 2017年 Don Chen. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var memberCountLabel: UILabel!
    @IBOutlet weak var postCountLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var subscribeCountLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    
    @IBOutlet weak var memberButton: UIButton!
    
    var members:[MemberModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "好想工作室"
        
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateData()
    }
    
    private func setupView() {
        memberButton.layer.cornerRadius = 22
    }
    
    @IBAction func postListTapHandler(_ sender: Any) {
        if(members != nil){
            showMembers(members!)
        } else {
            
        }
    }
    
    private func updateData() {
        showLoadingView()
        MemberStore.requestPosts(completion: { [unowned self] members in
            DispatchQueue.main.async {
                self.dismissLoadingView(completion: {
                    if members == nil {
                        
                    } else {
                        self.updateViewWith(members: members!)
                    }
                })
            }
        })
    }
    
    private func updateViewWith(members:[MemberModel]) {
        self.members = members
        
        let membersCount = members.count
        var postCount      = 0
        var subscribeCount = 0
        var likeCount      = 0
        var commentCount   = 0
        
        _ = members.map{
            postCount += $0.postCount
            subscribeCount += $0.subscriberCount
            $0.postList.map{
                likeCount += $0.like
                commentCount += $0.comment
            }
        }
        
        memberCountLabel.text    = "共有 \(membersCount) 人參賽"
        postCountLabel.text      = "\(postCount) 篇文章"
        subscribeCountLabel.text = "\(subscribeCount) 個訂閱"
        likeCountLabel.text      = "\(likeCount) 個喜歡"
        commentCountLabel.text   = "\(commentCount) 個留言"
    }
    
    private func showMembers(_ members:[MemberModel]) {
        let VC = MemberViewController(nibName: "MemberViewController", bundle: nil)
        VC.members = members
        navigationController?.pushViewController(VC, animated: true)
    }
    


}

