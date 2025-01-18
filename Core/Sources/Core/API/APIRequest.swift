//
//  APIRequest.swift
//  
//
//  Created by okudera on 2025/01/18.
//

import Foundation

public protocol APIRequest {
    var baseUrl: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var timeoutInterval: TimeInterval { get }
    var headerFields: [String: String] { get }
    var queryItems: [URLQueryItem]? { get }
    var bodyItems: [String: Any]? { get }
    var urlRequest: URLRequest? { get }
}

extension APIRequest {

    public var timeoutInterval: TimeInterval {
        return 10
    }

    public var headerFields: [String: String] {
        return [:]
    }

    public var queryItems: [URLQueryItem]? {
        return nil
    }

    public var bodyItems: [String: Any]? {
        return nil
    }

    public var urlRequest: URLRequest? {
        guard var urlComponents = URLComponents(string: baseUrl) else { return nil }
        urlComponents.path = path
        urlComponents.queryItems = queryItems

        guard let url = urlComponents.url else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = timeoutInterval

        for (key, value) in headerFields {
            request.addValue(value, forHTTPHeaderField: key)
        }

        if let bodyItems = bodyItems {
            request.httpBody = try? JSONSerialization.data(withJSONObject: bodyItems)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        return request
    }
}
