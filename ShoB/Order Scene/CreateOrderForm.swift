//
//  CreateOrderForm.swift
//  ShoB
//
//  Created by Dara Beng on 7/2/19.
//  Copyright © 2019 Dara Beng. All rights reserved.
//

import SwiftUI
import CoreData


struct CreateOrderForm: View {
    
    /// The data source that will create and save the new order.
    @ObjectBinding var dataSource: CUDDataSource<Order>
    
    /// Triggered when the new order is placed.
    var onPlacedOrder: () -> Void
    
    /// Triggered when cancelled to create a new order.
    var onCancelled: () -> Void
    
    
    var body: some View {
        OrderForm(order: dataSource.newObject!)
            .navigationBarTitle("New Order", displayMode: .inline)
            .navigationBarItems(leading: cancelOrderNavItem, trailing: placeOrderNavItem)
    }
    
    
    var cancelOrderNavItem: some View {
        Button("Cancel", action: {
            self.dataSource.discardCreateContext()
            self.onCancelled()
        })
    }
    
    var placeOrderNavItem: some View {
        Button("Place Order", action: {
            self.dataSource.saveCreateContext()
            self.onPlacedOrder()
        })
        .font(Font.body.bold())
    }
}

#if DEBUG
struct PlaceOrderView_Previews : PreviewProvider {
    static let cud = CUDDataSource<Order>(context: CoreDataStack.current.mainContext)
    static var previews: some View {
        CreateOrderForm(dataSource: cud, onPlacedOrder: {}, onCancelled: {})
    }
}
#endif
