//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension TBX.AuthorizationService {

    public enum AuthorizationServiceHasAccessTo {

      public static let service = APIService<Response>(id: "AuthorizationService.hasAccessTo", tag: "AuthorizationService", method: "GET", path: "/AuthorizationServices/hasAccessTo", hasBody: false)

      public class Request: APIRequest<Response> {

          public struct Options {

              public var apiKey: String

              public var userToken: String

              public var urn: String

              public var action: String

              public var ip: String

              public init(apiKey: String, userToken: String, urn: String, action: String, ip: String) {
                  self.apiKey = apiKey
                  self.userToken = userToken
                  self.urn = urn
                  self.action = action
                  self.ip = ip
              }
          }

          public var options: Options

          public init(options: Options) {
              self.options = options
              super.init(service: AuthorizationServiceHasAccessTo.service)
          }

          /// convenience initialiser so an Option doesn't have to be created
          public convenience init(apiKey: String, userToken: String, urn: String, action: String, ip: String) {
              let options = Options(apiKey: apiKey, userToken: userToken, urn: urn, action: action, ip: ip)
              self.init(options: options)
          }

          public override var parameters: [String: Any] {
              var params: JSONDictionary = [:]
              params["api_key"] = options.apiKey
              params["userToken"] = options.userToken
              params["urn"] = options.urn
              params["action"] = options.action
              params["ip"] = options.ip
              return params
          }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [String: Any]

            /** Request was successful */
            case status200([String: Any])

            public var success: [String: Any]? {
                switch self {
                case .status200(let response): return response
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                }
            }

            public var statusCode: Int {
              switch self {
              case .status200: return 200
              }
            }

            public var successful: Bool {
              switch self {
              case .status200: return true
              }
            }

            public init(statusCode: Int, data: Data) throws {
                switch statusCode {
                case 200: self = try .status200(JSONDecoder.decode(data: data))
                default: throw APIError.unexpectedStatusCode(statusCode: statusCode, data: data)
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
