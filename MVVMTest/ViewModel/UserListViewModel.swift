//
//  UserListViewModel.swift
//  MVVMTest
//
//  Created by AA422873 on 2021/06/11.
//

import Foundation

let usersListMock: [User] = [
    User(id: 1, name: "佐藤浩介", age: 30, sex: "男性", location: "東京都", job: "会社員"),
    User(id: 2, name: "鈴木絵里", age: 21, sex: "女性", location: "大阪府", job: "大学生"),
    User(id: 3, name: "高橋美沙子", age: 33, sex: "女性", location: "静岡県", job: "主婦"),
    User(id: 4, name: "田中優作", age: 55, sex: "男性", location: "福岡県", job: "会社役員"),
    User(id: 5, name: "渡辺大毅", age: 17, sex: "男性", location: "埼玉県", job: "高校生"),
    User(id: 6, name: "中村真衣", age: 27, sex: "女性", location: "秋田県", job: "公務員"),
    User(id: 7, name: "山崎敏子", age: 72, sex: "女性", location: "広島県", job: "無職"),
    User(id: 8, name: "山田誠司", age: 46, sex: "男性", location: "北海道", job: "自営業")
]

final class UserListViewModel: ObservableObject {
    @Published private(set) var users: [User] = []
    @Published var isShowDetail = false
    @Published private(set) var message = ""
    
    func fetchUsers() {
        users = usersListMock
    }
    
    func showDetail(user: User) {
        var msg = "【氏名】：\(user.name)\n"
        msg += "【年齢】：\(user.age)歳\n"
        msg += "【性別】：\(user.sex)\n"
        msg += "【出身】：\(user.location)\n"
        msg += "【職業】：\(user.job)"
        message = msg
                
        isShowDetail = true
    }
}
