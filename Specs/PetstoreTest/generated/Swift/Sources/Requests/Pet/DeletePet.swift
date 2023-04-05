//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension PetstoreTest.Pet {

    /** Deletes a pet */
    public enum DeletePet {

        public static let service = APIService<Response>(id: "deletePet", tag: "pet", method: "DELETE", path: "/pet/{petId}", hasBody: false, securityRequirements: [SecurityRequirement(type: "petstore_auth", isRequired: true, scopes: ["write:pets", "read:pets"])])

        public final class Request: APIRequest<Response> {

            public struct Options {

                public var apiKey: String?

                /** Pet id to delete */
                public var petId: Int

                public init(apiKey: String? = nil, petId: Int) {
                    self.apiKey = apiKey
                    self.petId = petId
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: DeletePet.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(apiKey: String? = nil, petId: Int) {
                let options = Options(apiKey: apiKey, petId: petId)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "petId" + "}", with: "\(self.options.petId)")
            }

            override var headerParameters: [String: String] {
                var headers: [String: String] = [:]
                if let apiKey = options.apiKey {
                  headers["api_key"] = apiKey
                }
                return headers
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Void

            /** Invalid pet value */
            case status400

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
                case .status400: return 400
                }
            }

            public var successful: Bool {
                switch self {
                case .status400: return false
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 400: self = .status400
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
