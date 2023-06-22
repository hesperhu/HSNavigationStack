//
//  HSNavigationStaticStackPathView.swift
//  HSNavigationStack
//
//  Created by hsw on 2023-06-22.
//

import SwiftUI
///这个navi stack有不同类型的选项，每个选项都是静态设置的，而不是使用list 2023-06-22  17:29
struct HSNavigationStaticStackPathView: View {
    @State private var naviPath = NavigationPath()
    ///选项清单 2023-06-22  17:18
    private var dishes:[Dish] = [
        Dish(id: UUID(), name: "fruit", detail: "Good to eat"),
        Dish(id: UUID(), name: "water", detail: "Good to drink"),
        Dish(id: UUID(), name: "wine", detail: "Good to drunk"),
        Dish(id: UUID(), name: "fish", detail: "Good to meet")
    ]
    private var vehicles:[Vehicle] = [
        Vehicle(id: UUID(), name: "car", detail: "Good to drive"),
        Vehicle(id: UUID(), name: "train", detail: "Good to control"),
        Vehicle(id: UUID(), name: "plane", detail: "Good to fly"),
        Vehicle(id: UUID(), name: "ship", detail: "Good to swim")
    ]
    var body: some View {
        NavigationStack(path: $naviPath) {
            //列出选项清单 2023-06-22  17:18
            List {
                NavigationLink(dishes.first?.name ?? "", value: dishes.first)
                NavigationLink(vehicles.first?.name ?? "", value: vehicles.first)
            }
            //获取选项的链接传递的值，按照值的类型进行pop展示 2023-06-22  17:20
            .navigationDestination(for: Dish.self) { dish in
                Text(dish.detail)
            }
            //获取选项的链接传递的值，按照值的类型进行pop展示 2023-06-22  17:20
            .navigationDestination(for: Vehicle.self) { vehicle in
                Text(vehicle.detail).foregroundColor(.red)
            }
        }
        .onAppear(){
            //后台设置pop的选项 2023-06-22  17:25
            naviPath.append(Dish(id: UUID(), name: "water", detail: "Good to drink"))
            naviPath.append(Vehicle(id: UUID(), name: "ship", detail: "Good to swim"))
        }
    }}

struct HSNavigationStaticStackPathView_Previews: PreviewProvider {
    static var previews: some View {
        HSNavigationStaticStackPathView()
    }
}
