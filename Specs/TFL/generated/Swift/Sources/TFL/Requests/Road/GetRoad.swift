//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension TFL.Road {

    public enum GetRoad {

      public static let service = APIService<Response>(id: "getRoad", tag: "Road", method: "GET", path: "/Road/{ids}", hasBody: false)

      public class Request: APIRequest<Response> {

          public struct Options {

              /** Comma-separated list of road identifiers e.g. "A406, A2" (a full list of supported road identifiers can be found at the /Road/ endpoint) */
              public var ids: [String]

              public init(ids: [String]) {
                  self.ids = ids
              }
          }

          public var options: Options

          public init(options: Options) {
              self.options = options
              super.init(service: GetRoad.service)
          }

          /// convenience initialiser so an Option doesn't have to be created
          public convenience init(ids: [String]) {
              let options = Options(ids: ids)
              self.init(options: options)
          }

          public override var path: String {
              return super.path.replacingOccurrences(of: "{" + "ids" + "}", with: "\(self.options.ids.joined(separator: ","))")
          }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [RoadCorridor]

            /** OK */
            case status200([RoadCorridor])

            public var success: [RoadCorridor]? {
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
