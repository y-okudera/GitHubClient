//
//  StatefulPreviewWrapper.swift
//
//
//  Created by okudera on 2025/01/18.
//

import SwiftUI

/// SwiftUIのプレビューで`@Binding`を扱うためのラッパー
public struct StatefulPreviewWrapper<Value>: View where Value: Equatable {

    @State private var value: Value
    private let content: (Binding<Value>) -> AnyView

    public init(_ initialValue: Value, content: @escaping (Binding<Value>) -> AnyView) {
        self._value = State(initialValue: initialValue)
        self.content = content
    }

    public init(_ initialValue: Value, content: @escaping (Binding<Value>) -> some View) {
        self._value = State(initialValue: initialValue)
        self.content = { AnyView(content($0)) }
    }

    public var body: some View {
        content($value)
    }
}
