//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension Rocket.Account {

    /** Get the details of an account along with the profiles and entitlements under it. */
    public enum GetAccount {

      public static let service = APIService<Response>(id: "getAccount", tag: "account", method: "GET", path: "/account", hasBody: false, authorization: Authorization(type: "accountAuth", scope: "Catalog"))

      public class Request: APIRequest<Response> {

          public init() {
              super.init(service: GetAccount.service)
          }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Account

            /** OK */
            case status200(Account)

            /** Bad request. */
            case status400(ServiceError)

            /** Invalid access token. */
            case status401(ServiceError)

            /** Forbidden. */
            case status403(ServiceError)

            /** Not found. */
            case status404(ServiceError)

            /** Internal server error. */
            case status500(ServiceError)

            /** Service error. */
            case defaultResponse(statusCode: Int, ServiceError)

            public var success: Account? {
                switch self {
                case .status200(let response): return response
                default: return nil
                }
            }

            public var failure: ServiceError? {
                switch self {
                case .status400(let response): return response
                case .status401(let response): return response
                case .status403(let response): return response
                case .status404(let response): return response
                case .status500(let response): return response
                case .defaultResponse(_, let response): return response
                default: return nil
                }
            }

            /// either success or failure value. Success is anything in the 200..<300 status code range
            public var responseResult: APIResponseResult<Account, ServiceError> {
                if let successValue = success {
                    return .success(successValue)
                } else if let failureValue = failure {
                    return .failure(failureValue)
                } else {
                    fatalError("Response does not have success or failure response")
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                case .status400(let response): return response
                case .status401(let response): return response
                case .status403(let response): return response
                case .status404(let response): return response
                case .status500(let response): return response
                case .defaultResponse(_, let response): return response
                }
            }

            public var statusCode: Int {
              switch self {
              case .status200: return 200
              case .status400: return 400
              case .status401: return 401
              case .status403: return 403
              case .status404: return 404
              case .status500: return 500
              case .defaultResponse(let statusCode, _): return statusCode
              }
            }

            public var successful: Bool {
              switch self {
              case .status200: return true
              case .status400: return false
              case .status401: return false
              case .status403: return false
              case .status404: return false
              case .status500: return false
              case .defaultResponse: return false
              }
            }

            public init(statusCode: Int, data: Data) throws {
                switch statusCode {
                case 200: self = try .status200(JSONDecoder.decode(data: data))
                case 400: self = try .status400(JSONDecoder.decode(data: data))
                case 401: self = try .status401(JSONDecoder.decode(data: data))
                case 403: self = try .status403(JSONDecoder.decode(data: data))
                case 404: self = try .status404(JSONDecoder.decode(data: data))
                case 500: self = try .status500(JSONDecoder.decode(data: data))
                default: self = try .defaultResponse(statusCode: statusCode, JSONDecoder.decode(data: data))
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
