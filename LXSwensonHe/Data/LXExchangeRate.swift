//
//  LXExchangeRate.swift
//
//  Created by Laxman Penmesta on 5/16/19
//  Copyright (c) Laxman. All rights reserved.
//

import Foundation
import SwiftyJSON

public final class LXExchangeRate: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let base = "base"
    static let date = "date"
    static let timestamp = "timestamp"
    static let rates = "rates"
    static let success = "success"
  }

  // MARK: Properties
  public var base: String?
  public var date: String?
  public var timestamp: Int?
  public var rates: LXRates?
  public var success: Bool? = false

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    base = json[SerializationKeys.base].string
    date = json[SerializationKeys.date].string
    timestamp = json[SerializationKeys.timestamp].int
    rates = LXRates(json: json[SerializationKeys.rates])
    success = json[SerializationKeys.success].boolValue
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = base { dictionary[SerializationKeys.base] = value }
    if let value = date { dictionary[SerializationKeys.date] = value }
    if let value = timestamp { dictionary[SerializationKeys.timestamp] = value }
    if let value = rates { dictionary[SerializationKeys.rates] = value.dictionaryRepresentation() }
    dictionary[SerializationKeys.success] = success
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.base = aDecoder.decodeObject(forKey: SerializationKeys.base) as? String
    self.date = aDecoder.decodeObject(forKey: SerializationKeys.date) as? String
    self.timestamp = aDecoder.decodeObject(forKey: SerializationKeys.timestamp) as? Int
    self.rates = aDecoder.decodeObject(forKey: SerializationKeys.rates) as? LXRates
    self.success = aDecoder.decodeBool(forKey: SerializationKeys.success)
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(base, forKey: SerializationKeys.base)
    aCoder.encode(date, forKey: SerializationKeys.date)
    aCoder.encode(timestamp, forKey: SerializationKeys.timestamp)
    aCoder.encode(rates, forKey: SerializationKeys.rates)
    aCoder.encode(success, forKey: SerializationKeys.success)
  }

}
