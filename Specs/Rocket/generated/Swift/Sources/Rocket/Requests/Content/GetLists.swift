//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension Rocket.Content {

    /** Returns an array of item lists with their first page of content resolved. */
    public enum GetLists {

      public static let service = APIService<Response>(id: "getLists", tag: "content", method: "GET", path: "/lists", hasBody: false)

      public class Request: APIRequest<Response> {

          public struct Options {

              /** A comma delimited list of item list identifiers.

These can be list ids e.g. `14354,65473,3234`

Or more complex sort/filter queries using pipes e.g.

`14354|max_rating=AUOFLC-E|order=asc|order_by=year-added,65473|page_size=30,3234`

_Note the id must always come first for each encoded list query_

List parameters may be provide without the `param=` prefix e.g. `14354|genre:action`

Only the following options can be present.
  - `order`
  - `order_by`
  - `max_rating`
  - `page_size`
  - `item_type`
  - `param`
 */
              public var ids: [String]

              /** The number of items to return in a page. */
              public var pageSize: Int?

              /** The maximum rating (inclusive) of items returned, e.g. 'auoflc-pg'. */
              public var maxRating: String?

              /** The list sort order, either 'asc' or 'desc'. */
              public var order: ListOrder?

              /** What to order by. */
              public var orderBy: ListOrderBy?

              /** The item type to filter by. Defaults to unspecified. */
              public var itemType: ItemType?

              /** The type of device the content is targeting. */
              public var device: String?

              /** The active subscription code. */
              public var sub: String?

              /** The list of segments to filter the response by. */
              public var segments: [String]?

              /** The set of opt in feature flags which cause breaking changes to responses.

While Rocket APIs look to avoid breaking changes under the active major version, the formats of responses
may need to evolve over this time.

These feature flags allow clients to select which response formats they expect and avoid breaking
clients as these formats evolve under the current major version.

### Flags

- `all` - Enable all flags. Useful for testing. _Don't use in production_.
- `idp` - Dynamic item detail pages with schedulable rows.
- `ldp` - Dynamic list detail pages with schedulable rows.

See the `feature-flags.md` for available flag details.
 */
              public var ff: [FeatureFlags]?

              public init(ids: [String], pageSize: Int? = nil, maxRating: String? = nil, order: ListOrder? = nil, orderBy: ListOrderBy? = nil, itemType: ItemType? = nil, device: String? = nil, sub: String? = nil, segments: [String]? = nil, ff: [FeatureFlags]? = nil) {
                  self.ids = ids
                  self.pageSize = pageSize
                  self.maxRating = maxRating
                  self.order = order
                  self.orderBy = orderBy
                  self.itemType = itemType
                  self.device = device
                  self.sub = sub
                  self.segments = segments
                  self.ff = ff
              }
          }

          public var options: Options

          public init(options: Options) {
              self.options = options
              super.init(service: GetLists.service)
          }

          /// convenience initialiser so an Option doesn't have to be created
          public convenience init(ids: [String], pageSize: Int? = nil, maxRating: String? = nil, order: ListOrder? = nil, orderBy: ListOrderBy? = nil, itemType: ItemType? = nil, device: String? = nil, sub: String? = nil, segments: [String]? = nil, ff: [FeatureFlags]? = nil) {
              let options = Options(ids: ids, pageSize: pageSize, maxRating: maxRating, order: order, orderBy: orderBy, itemType: itemType, device: device, sub: sub, segments: segments, ff: ff)
              self.init(options: options)
          }

          public override var parameters: [String: Any] {
              var params: JSONDictionary = [:]
              params["ids"] = options.ids.joined(separator: ",")
              if let pageSize = options.pageSize {
                params["page_size"] = pageSize
              }
              if let maxRating = options.maxRating {
                params["max_rating"] = maxRating
              }
              if let order = options.order?.encode() {
                params["order"] = order
              }
              if let orderBy = options.orderBy?.encode() {
                params["order_by"] = orderBy
              }
              if let itemType = options.itemType?.encode() {
                params["item_type"] = itemType
              }
              if let device = options.device {
                params["device"] = device
              }
              if let sub = options.sub {
                params["sub"] = sub
              }
              if let segments = options.segments?.joined(separator: ",") {
                params["segments"] = segments
              }
              if let ff = options.ff?.encode().map({ String(describing: $0) }).joined(separator: ",") {
                params["ff"] = ff
              }
              return params
          }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [ItemList]

            /** The array of item lists requested. */
            case status200([ItemList])

            /** Bad request. */
            case status400(ServiceError)

            /** Not found. */
            case status404(ServiceError)

            /** Internal server error. */
            case status500(ServiceError)

            /** Service error. */
            case defaultResponse(statusCode: Int, ServiceError)

            public var success: [ItemList]? {
                switch self {
                case .status200(let response): return response
                default: return nil
                }
            }

            public var failure: ServiceError? {
                switch self {
                case .status400(let response): return response
                case .status404(let response): return response
                case .status500(let response): return response
                case .defaultResponse(_, let response): return response
                default: return nil
                }
            }

            /// either success or failure value. Success is anything in the 200..<300 status code range
            public var responseResult: APIResponseResult<[ItemList], ServiceError> {
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
                case .status404(let response): return response
                case .status500(let response): return response
                case .defaultResponse(_, let response): return response
                }
            }

            public var statusCode: Int {
              switch self {
              case .status200: return 200
              case .status400: return 400
              case .status404: return 404
              case .status500: return 500
              case .defaultResponse(let statusCode, _): return statusCode
              }
            }

            public var successful: Bool {
              switch self {
              case .status200: return true
              case .status400: return false
              case .status404: return false
              case .status500: return false
              case .defaultResponse: return false
              }
            }

            public init(statusCode: Int, data: Data) throws {
                switch statusCode {
                case 200: self = try .status200(JSONDecoder.decode(data: data))
                case 400: self = try .status400(JSONDecoder.decode(data: data))
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
