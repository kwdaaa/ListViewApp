//
//  ContentView.swift
//  ListViewApp
//
//  Created by 川田 文香 on 2020/09/06.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    // 構造体
    @ObservedObject var nList = namesList()
    
    @ObservedObject var tList = TaskList()
    
    @State var newTask :String = ""
    
    
    // 追加してください　と　addボタン横並びに。
    var addTaskBar : some View{
        // HStack：横揃え
        // VStack：縦揃え
        HStack{
            TextField("追加してください",text: self.$newTask)
            //ボタンが押されたら、addNewTaskが発火する
            Button(action: self.addNewTask, label: {Text("add")})
        }
        
        
    }
    
    func addNewTask() {
        tList.tasks.append(Task(id: String(tList.tasks.count + 1), taskItem:newTask))
        //add押した後に入力フォームからにする。
        self.newTask = ""
    }
    
    // 行を削す
    func removeTask(offsets: IndexSet) {
        tList.tasks.remove(atOffsets: offsets)
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                addTaskBar.padding()
                List {
                    ForEach(self.tList.tasks){ Index in
                        Text(Index.taskItem)
                    }
                    //行を消すときに呼び出す処理
                    .onDelete(perform: removeTask)
                }.navigationBarTitle("Taskリスト")
                // 削除ボタンの追加
                 .navigationBarItems(trailing: EditButton())
                
            }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }

}

