//  This file was automatically generated and should not be edited.

import Apollo

public final class CharacterClassQuery: GraphQLQuery {
  public let operationDefinition =
    "query CharacterClass {\n  classResult {\n    __typename\n    count\n    allClasses {\n      __typename\n      name\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("classResult", type: .object(ClassResult.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(classResult: ClassResult? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "classResult": classResult.flatMap { (value: ClassResult) -> ResultMap in value.resultMap }])
    }

    public var classResult: ClassResult? {
      get {
        return (resultMap["classResult"] as? ResultMap).flatMap { ClassResult(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "classResult")
      }
    }

    public struct ClassResult: GraphQLSelectionSet {
      public static let possibleTypes = ["ClassResult"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("count", type: .scalar(Int.self)),
        GraphQLField("allClasses", type: .list(.object(AllClass.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(count: Int? = nil, allClasses: [AllClass?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "ClassResult", "count": count, "allClasses": allClasses.flatMap { (value: [AllClass?]) -> [ResultMap?] in value.map { (value: AllClass?) -> ResultMap? in value.flatMap { (value: AllClass) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var count: Int? {
        get {
          return resultMap["count"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "count")
        }
      }

      public var allClasses: [AllClass?]? {
        get {
          return (resultMap["allClasses"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [AllClass?] in value.map { (value: ResultMap?) -> AllClass? in value.flatMap { (value: ResultMap) -> AllClass in AllClass(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [AllClass?]) -> [ResultMap?] in value.map { (value: AllClass?) -> ResultMap? in value.flatMap { (value: AllClass) -> ResultMap in value.resultMap } } }, forKey: "allClasses")
        }
      }

      public struct AllClass: GraphQLSelectionSet {
        public static let possibleTypes = ["Class"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Class", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}