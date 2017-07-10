//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension TestSpec {

    /** operation with string body */
    public enum PostString {

      public static let service = APIService<Response>(id: "postString", tag: "", method: "POST", path: "/string", hasBody: true)

      public class Request: APIRequest<Response> {

          public var body: String?

          public init(body: String?) {
              self.body = body
              super.init(service: PostString.service)
          }

          public override var jsonBody: Any? {
              return body
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
