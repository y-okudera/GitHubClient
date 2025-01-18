//
//  APIError.swift
//  
//
//  Created by okudera on 2025/01/18.
//

import Foundation

/// API エラーを定義
public enum APIError: Error {
    case unknownError
    case invalidRequest
    case requestFailed(Int) // HTTPステータスコード
    case decodingError(Error)
}
