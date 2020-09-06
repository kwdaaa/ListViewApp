//
//  TaskFiles.swift
//  ListViewApp
//
//  Created by 川田 文香 on 2020/09/06.
//  Copyright © 2020 kwdaaa.com. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

// Taskの型などもここで指定している
struct Task: Identifiable {
    var id = String()
    // ユーザーが指定したアイテム？値？
    var taskItem = String()
}

class TaskList: ObservableObject {
    @Published var  tasks = [Task]()
}




class namesList: ObservableObject {
    
    @Published var names:[String] = ["米倉","川田","磯部","渋谷","加藤",]
    
}

struct TaskFiles_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
