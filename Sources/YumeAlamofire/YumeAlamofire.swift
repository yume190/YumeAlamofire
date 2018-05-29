//
//  Alamofire+JSONDecodeKIT.swift
//  BusApp
//
//  Created by Yume on 2017/2/2.
//  Copyright © 2017年 Yume. All rights reserved.

import Foundation
import JSONDecodeKit
import Alamofire

internal func guardData(res: DefaultDataResponse) -> (response: HTTPURLResponse, data: Data)? {
    guard let response = res.response, let data = res.data else {
        print("API (\(res.request?.url?.absoluteString ?? "")): No Response.")
        return nil
    }
    return (response:response,data:data)
}

public struct YumeAlamofire {}

// MARK: Debug Info
extension YumeAlamofire {
    public typealias DebugInfoFunction = (_ data:Data?) -> Swift.Void
    public static func emptyDebugInfo(data:Data?) {}
    public static func basicDebugInfo(data:Data?) {
        guard let data = data else { return }
        print("The error response : \(String.init(data: data, encoding: .utf8) ?? "")")
    }
}

extension YumeAlamofire {
    internal static func parseErrorHandle<OutputType>(type:OutputType.Type, url:URL?, error:Error) {
        let parseError = [
            "API Data Parse Error.",
            "Type : \(OutputType.self)",
            "Url : \(url?.path ?? "")"
            ].joined(separator: "\n")
        print(parseError)
        print("-----------------")
        print(error)
    }
}