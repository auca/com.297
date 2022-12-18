//
//  ViewModelUtils.swift
//  Chirper
//
//  Created by Dmitrii Toksaitov on 24/5/22.
//

import Foundation

func performPostRequest<Model>(
         endpoint: String,
         onServiceError: ((String) -> Void)? = nil
     ) async -> Model? where Model : Decodable {
         await performPostRequest(endpoint: endpoint, body: nil as ServiceEmptyBody?, onServiceError: onServiceError)
}

func performPostRequest<BodyType, Model>(
         endpoint: String,
         body: BodyType? = nil,
         onServiceError: ((String) -> Void)? = nil
     ) async -> Model? where BodyType : Encodable, Model : Decodable {
    do {
        guard let url = URL(string: endpoint) else {
            throw ServiceError.error("Bad URL \(endpoint)")
        }

        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        if let body = body {
            request.httpBody = try JSONEncoder().encode(body)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        let (data, response) = try await URLSession.shared.data(for: request)
        let httpResponse = response as! HTTPURLResponse
        if httpResponse.statusCode == 400 {
            let serviceError = try JSONDecoder().decode(ServiceErrorReplyBody.self, from: data)
            DispatchQueue.main.async {
                onServiceError?(serviceError.error)
            }

            throw ServiceError.error("Server error: '\(serviceError.error)'")
        } else if httpResponse.statusCode != 200 {
            throw ServiceError.error("Failed to make a request to \(endpoint)")
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)

        return try jsonDecoder.decode(Model.self, from: data)
    } catch {
        print(error)

        return nil
    }
}

func performGetRequest<Model>(
         endpoint: String,
         onServiceError: ((String) -> Void)? = nil
     ) async -> Model? where Model : Decodable {
    do {
        guard let url = URL(string: endpoint) else {
            throw ServiceError.error("Bad URL \(endpoint)")
        }

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        let (data, response) = try await URLSession.shared.data(for: request)

        let httpResponse = response as! HTTPURLResponse
        if httpResponse.statusCode == 400 {
            let serviceError = try JSONDecoder().decode(ServiceErrorReplyBody.self, from: data)
            DispatchQueue.main.async {
                onServiceError?(serviceError.error)
            }
            
            throw ServiceError.error("Server error: '\(serviceError.error)'")
        } else if httpResponse.statusCode != 200 {
            throw ServiceError.error("Failed to make a request to \(endpoint)")
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)

        return try jsonDecoder.decode(Model.self, from: data)
    } catch {
        print(error)

        return nil
    }
}
