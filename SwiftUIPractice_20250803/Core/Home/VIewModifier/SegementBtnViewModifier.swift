//
//  SegementBtnViewModifier.swift
//  SwiftUIPractice_20250803
//
//  Created by Yen Lin on 2025/8/7.
//

import SwiftUI

struct SegmentBtnViewModifier: ViewModifier {
    
    var isSelected: Bool
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .font(.system(size: 12))
            .foregroundColor(isSelected ? Color.theme.secondaryText : Color.white)
            .background(isSelected ? .green : Color.theme.secondaryBtn)
            .cornerRadius(16)
    }
}

