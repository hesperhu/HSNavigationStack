//
//  HSNavigationStackPathView.swift
//  HSNavigationStack
//
//  Created by hsw on 2023-06-22.
//

import SwiftUI
///这个navi stack跟踪了用户的选择，并可以后台修改选择 2023-06-22  16:16
struct HSNavigationStackPathView: View {
    ///设置初始的选择为fruit,water这两个选项 2023-06-22  16:21
    @State private var path:[Dish] = [Dish(id: UUID(), name: "fruit", detail: "Good to eat"),
                                      Dish(id: UUID(), name: "water", detail: "Good to drink")]
    ///选项清单 2023-06-22  17:18
    private var dishes:[Dish] = [
        Dish(id: UUID(), name: "fruit", detail: "Good to eat"),
        Dish(id: UUID(), name: "water", detail: "Good to drink"),
        Dish(id: UUID(), name: "wine", detail: "Good to drunk"),
        Dish(id: UUID(), name: "fish", detail: "Good to meet")
    ]
    var body: some View {
        NavigationStack(path: $path) {
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

struct HSNavigationStackPathView_Previews: PreviewProvider {
    static var previews: some View {
        HSNavigationStackPathView()
    }
}
