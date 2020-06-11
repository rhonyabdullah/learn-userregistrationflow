//
//  RegisterViewModel.swift
//  UserRegistrationExample
//
//  Created by Rhony on 10/06/20.
//  Copyright © 2020 Rhony. All rights reserved.
//

import Foundation

public class RegisterViewModel {

    private var baseUrl = "http://localhost:8000/api/"

    func getUsers(_ firstName: String,
        onSuccesss: @escaping (String) -> Void,
        onError: @escaping (String) -> Void
    ) {
        print("Get users called")
        var request = URLRequest(url: URL(string: "\(baseUrl)users")!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "accept")

        let postString: [String: String] = [
            "firstName": firstName
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: postString, options: .prettyPrinted)
            let task = URLSession.shared.dataTask(with: request) {
                (data: Data?, response: URLResponse?, error: Error?) in
                if error != nil || data == nil {
                    onError("Error on data: \(error.debugDescription)")
                } else {
                    self.parseResponse(data!, onError, onSuccesss)
                }
            }
            task.resume()
        } catch let error {
            print("Error on catch: \(error.localizedDescription)")
            onError(error.localizedDescription)
        }
    }

    private func parseResponse(
        _ data: Data,
        _ onError: @escaping (String) -> Void,
        _ onSuccesss: @escaping (String) -> Void
    ) {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSDictionary
            if let parsedJson = json {
                let userId = parsedJson["userId"] as? String
                print("User id : \(String(describing: userId!))")
                if (userId?.isEmpty)! {
                    onError("Something went wrong")
                } else {
                    onSuccesss("Account Registered!")
                }
            } else {
                onError("Something went wrong")
            }
        } catch let error {
            onError(error.localizedDescription)
        }
    }


}
