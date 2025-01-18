//
//  APIClient.swift
//
//
//  Created by okudera on 2025/01/18.
//

import Foundation

/// API クライアント基盤
public enum APIClient {

    /// APIリクエストを送信し、レスポンスを指定された型にデコードします。
    ///
    /// - Parameters:
    ///   - request: リクエストの詳細をカプセル化した `APIRequest` を準拠したオブジェクト。
    ///   - responseType: デコードする型。`Decodable` に準拠している必要があります。
    /// - Returns: デコードされたレスポンスデータ。
    /// - Throws:
    ///   - `APIError.invalidRequest`: リクエストの作成に失敗した場合。
    ///   - `APIError.requestFailed`: HTTPレスポンスのステータスコードが200〜299以外の場合。
    ///   - `APIError.decodingError`: レスポンスデータのデコードに失敗した場合。
    ///   - `URLSession` のリクエスト送信時に発生したその他のエラー。
    public static func perform<T: Decodable>(
        request: APIRequest,
        responseType: T.Type
    ) async throws -> T {
        guard let urlRequest = request.urlRequest else {
            throw APIError.invalidRequest
        }

        // リクエストを送信
        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        // HTTPレスポンスの検証
        if let httpResponse = response as? HTTPURLResponse {
            guard (200...299).contains(httpResponse.statusCode) else {
                throw APIError.requestFailed(httpResponse.statusCode)
            }
        }

        // デコード処理
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let decodedResponse = try jsonDecoder.decode(T.self, from: data)
            return decodedResponse
        } catch {
            throw APIError.decodingError(error)
        }
    }
}
