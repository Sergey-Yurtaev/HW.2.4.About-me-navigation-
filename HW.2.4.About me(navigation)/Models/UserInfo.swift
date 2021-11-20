//
//  UserInfo.swift
//  HW.2.4.About me(navigation)
//
//  Created by Sergey Yurtaev on 10.11.2021.
//

struct UserInfo {
    let userName: String
    let password: String
    
    static func getUserInfo() -> UserInfo {
        UserInfo(userName: "Sergey", password: "qwerty")
    }

}



