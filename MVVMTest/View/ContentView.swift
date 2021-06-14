//
//  ContentView.swift
//  MVVMTest
//
//  Created by AA422873 on 2021/06/11.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ScoreViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("+と-ボタンでスコア変更できます")
                Text("スコア：\(viewModel.score)")
                    .padding(5)
                HStack {
                    Button(action: {
                        viewModel.score += 1
                    }, label: {
                        Text("スコア＋")
                    })
                    Button(action: {
                        viewModel.score -= 1
                    }, label: {
                        Text("スコア-")
                    })
                }//: HStack
                .padding(10)
                NavigationLink(
                    destination: UserList(viewModel: UserListViewModel()),
                    label: {
                        Text("ユーザー一覧画面へ")
                    })
            }//: VStack
        }//: NavigationView
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
