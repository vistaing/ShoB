//
//  SaleItemDetailView.swift
//  ShoB
//
//  Created by Dara Beng on 7/4/19.
//  Copyright © 2019 Dara Beng. All rights reserved.
//

import SwiftUI

struct SaleItemDetailView: View {
    
    @ObjectBinding var saleItem: SaleItem
    
    /// Triggered when the update button is tapped.
    var onUpdated: () -> Void
    
    
    var body: some View {
        NavigationView {
            SaleItemForm(saleItem: saleItem)
        }
        .navigationBarTitle("Item Details", displayMode: .inline)
        .navigationBarItems(trailing: updateSaleItemNavItem)
    }
    
    
    var updateSaleItemNavItem: some View {
        Button("Update", action: {
            self.saleItem.managedObjectContext!.quickSave()
            self.saleItem.didChange.send() // reload update button's state
            self.onUpdated()
            
        })
        .font(Font.body.bold())
        .disabled(!saleItem.hasPersistentChangedValues)
    }
}

#if DEBUG
struct SaleItemDetailView_Previews : PreviewProvider {
    static let item = SaleItem(context: CoreDataStack.current.mainContext)
    static var previews: some View {
        SaleItemDetailView(saleItem: item, onUpdated: {})
    }
}
#endif
