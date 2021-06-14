//
//  UserList.swift
//  MVVMTest
//
//  Created by AA422873 on 2021/06/11.
//

import SwiftUI

struct UserList: View {
    @ObservedObject var viewModel: UserListViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                Button(action: {
                    viewModel.showDetail(user: user)
                }) {
                    HStack {
                        Text(user.id.description)
                        Text(user.name)
                        Spacer()
                    }//: HStack
                }
                .foregroundColor(.primary)
                .alert(isPresented: self.$viewModel.isShowDetail, content: {
                    Alert(
                        title: Text("ユーザー詳細"),
                        message: Text(viewModel.message),
                        dismissButton: .default(Text("OK"))
                    )
                })
            }//: List
            .onAppear() {
                viewModel.fetchUsers()
            }
        }//: NavigationView
        .navigationBarTitle("UserList", displayMode: .inline)
    }
}

struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        UserList(viewModel: .init())
    }
}
