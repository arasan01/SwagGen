//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension PetstoreTest.User {

    public enum LoginUser {

      public static let service = APIService<Response>(id: "loginUser", tag: "user", method: "GET", path: "/user/login", hasBody: false)

      public class Request: APIRequest<Response> {

          public struct Options {

              /** The user name for login */
              public var username: String

              /** The password for login in clear text */
              public var password: String

              public init(username: String, password: String) {
                  self.username = username
                  self.password = password
              }
          }

          public var options: Options

          public init(options: Options) {
              self.options = options
              super.init(service: LoginUser.service)
          }

          /// convenience initialiser so an Option doesn't have to be created
          public convenience init(username: String, password: String) {
              let options = Options(username: username, password: password)
              self.init(options: options)
          }

          public override var parameters: [String: Any] {
              var params: JSONDictionary = [:]
              params["username"] = options.username
              params["password"] = options.password
              return params
          }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = String

            /** successful operation */
            case status200(String)

            /** Invalid username/password supplied */
            case status400

            public var success: String? {
                switch self {
                case .status200(let response): return response
                default: return nil
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                default: return ()
                }
            }

            public var statusCode: Int {
              switch self {
              case .status200: return 200
              case .status400: return 400
              }
            }

            public var successful: Bool {
              switch self {
              case .status200: return true
              case .status400: return false
              }
            }

            public init(statusCode: Int, data: Data) throws {
                switch statusCode {
                case 200: self = try .status200(JSONDecoder.decode(data: data))
                case 400: self = .status400
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
