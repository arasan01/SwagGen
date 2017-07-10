//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension PetstoreTest.Store {

    public enum PlaceOrder {

      public static let service = APIService<Response>(id: "placeOrder", tag: "store", method: "POST", path: "/store/order", hasBody: true)

      public class Request: APIRequest<Response> {

          public var body: Order

          public init(body: Order) {
              self.body = body
              super.init(service: PlaceOrder.service)
          }

          public override var jsonBody: Any? {
              return body.encode()
          }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Order

            /** successful operation */
            case status200(Order)

            /** Invalid Order */
            case status400

            public var success: Order? {
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
