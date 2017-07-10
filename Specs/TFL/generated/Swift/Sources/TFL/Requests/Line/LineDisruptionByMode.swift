//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension TFL.Line {

    public enum LineDisruptionByMode {

      public static let service = APIService<Response>(id: "Line_DisruptionByMode", tag: "Line", method: "GET", path: "/Line/Mode/{modes}/Disruption", hasBody: false)

      public class Request: APIRequest<Response> {

          public struct Options {

              /** A comma-separated list of modes e.g. tube,dlr */
              public var modes: [String]

              public init(modes: [String]) {
                  self.modes = modes
              }
          }

          public var options: Options

          public init(options: Options) {
              self.options = options
              super.init(service: LineDisruptionByMode.service)
          }

          /// convenience initialiser so an Option doesn't have to be created
          public convenience init(modes: [String]) {
              let options = Options(modes: modes)
              self.init(options: options)
          }

          public override var path: String {
              return super.path.replacingOccurrences(of: "{" + "modes" + "}", with: "\(self.options.modes.joined(separator: ","))")
          }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [Disruption]

            /** OK */
            case status200([Disruption])

            public var success: [Disruption]? {
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
