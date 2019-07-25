//
//  CreateCustomerForm.swift
//  ShoB
//
//  Created by Dara Beng on 7/24/19.
//  Copyright © 2019 Dara Beng. All rights reserved.
//

import SwiftUI


struct CreateCustomerForm: View, CreatableForm {
    
    @Binding var model: CustomerForm.Model
    
    var onCreate: () -> Void
    
    var onCancel: () -> Void
    
    
    var body: some View {
        NavigationView {
            CustomerForm(model: $model)
                .navigationBarTitle("New Customer", displayMode: .inline)
                .navigationBarItems(leading: cancelNavItem(), trailing: createNavItem(title: "Create"))
        }
    }
}

#if DEBUG
struct CreateCustomerForm_Previews: PreviewProvider {
    static var previews: some View {
        CreateCustomerForm(model: .constant(.init()), onCreate: {}, onCancel: {})
    }
}
#endif