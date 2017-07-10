//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension TFL.Line {

    public enum LineStatusByIds {

      public static let service = APIService<Response>(id: "Line_StatusByIds", tag: "Line", method: "GET", path: "/Line/{ids}/Status", hasBody: false)

      public class Request: APIRequest<Response> {

          public struct Options {

              /** A comma-separated list of line ids e.g. victoria,circle,N133. Max. approx. 20 ids. */
              public var ids: [String]

              /** Include details of the disruptions that are causing the line status including the affected stops and routes */
              public var detail: Bool?

              public init(ids: [String], detail: Bool? = nil) {
                  self.ids = ids
                  self.detail = detail
              }
          }

          public var options: Options

          public init(options: Options) {
              self.options = options
              super.init(service: LineStatusByIds.service)
          }

          /// convenience initialiser so an Option doesn't have to be created
          public convenience init(ids: [String], detail: Bool? = nil) {
              let options = Options(ids: ids, detail: detail)
              self.init(options: options)
          }

          public override var path: String {
              return super.path.replacingOccurrences(of: "{" + "ids" + "}", with: "\(self.options.ids.joined(separator: ","))")
          }

          public override var parameters: [String: Any] {
              var params: JSONDictionary = [:]
              if let detail = options.detail {
                params["detail"] = detail
              }
              return params
          }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [Line]

            /** OK */
            case status200([Line])

            public var success: [Line]? {
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
