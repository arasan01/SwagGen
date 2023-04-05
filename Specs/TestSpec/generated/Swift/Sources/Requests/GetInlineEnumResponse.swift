//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension TestSpec {

    /** operation with an enum response */
    public enum GetInlineEnumResponse {

        public static let service = APIService<Response>(id: "getInlineEnumResponse", tag: "", method: "GET", path: "/inlineEnumResponse", hasBody: false, securityRequirements: [SecurityRequirement(type: "test_auth", isRequired: true, scopes: ["read"])])

        public final class Request: APIRequest<Response> {

            public init() {
                super.init(service: GetInlineEnumResponse.service)
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {

            /** enum response */
            public enum Status200: Int, Codable, Equatable, CaseIterable {
                case one = 1
                case two = 2
            }
            public typealias SuccessType = [String: Status200]

            /** enum response */
            case status200([String: Status200])

            public var success: [String: Status200]? {
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

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = try .status200(decoder.decode([String: Status200].self, from: data))
                default: throw APIClientError.unexpectedStatusCode(statusCode: statusCode, data: data)
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
