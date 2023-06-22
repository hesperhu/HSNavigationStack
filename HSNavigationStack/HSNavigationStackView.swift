//
//  ContentView.swift
//  HSNavigationStack
//
//  Created by hsw on 2023-06-22.
//

import SwiftUI
///这是最简单的Navi Stack，系统不对用户的选择进行跟踪、修改 2023-06-22  16:12
struct HSNavigationStackView: View {
    ///选项清单 2023-06-22  17:18
    private var dishes:[Dish] = [
        Dish(id: UUID(), name: "fruit", detail: "Good to eat"),
        Dish(id: UUID(), name: "water", detail: "Good to drink"),
        Dish(id: UUID(), name: "wine", detail: "Good to drunk"),
        Dish(id: UUID(), name: "fish", detail: "Good to meet")
    ]
    var body: some View {
        NavigationStack {
            //列出选项清单 2023-06-22  17:18
            List(dishes) { dish in
                //设置选项的显示名称，以及传递的值 2023-06-22  17:19
                NavigationLink(dish.name, value: dish)
            }
            //获取选项的链接传递的值，按照值的类型进行pop展示 2023-06-22  17:20
            .navigationDestination(for: Dish.self) { dish in
                Text(dish.detail)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HSNavigationStackView()
    }
}



