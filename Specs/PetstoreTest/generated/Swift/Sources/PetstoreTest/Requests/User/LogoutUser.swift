//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension PetstoreTest.User {

    public enum LogoutUser {

      public static let service = APIService<Response>(id: "logoutUser", tag: "user", method: "GET", path: "/user/logout", hasBody: false)

      public class Request: APIRequest<Response> {

          public init() {
              super.init(service: LogoutUser.service)
          }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Void

            /** successful operation */
            case defaultResponse(statusCode: Int)

            public var success: Void? {
                switch self {
                default: return nil
                }
            }

            public var response: Any {
                switch self {
                default: return ()
                }
            }

            public var statusCode: Int {
              switch self {
              case .defaultResponse(let statusCode): return statusCode
              }
            }

            public var successful: Bool {
              switch self {
              case .defaultResponse: return false
              }
            }

            public init(statusCode: Int, data: Data) throws {
                switch statusCode {
                default: self = .defaultResponse(statusCode: statusCode)
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
