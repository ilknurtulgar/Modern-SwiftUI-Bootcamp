//
//  EventViewModel.swift
//  task6
//
//  Created by İlknur Tulgar on 14.09.2025.
//

import SwiftUI

class EventViewModel: ObservableObject {
    @Published var events: [Event] = []
}

