/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Gas : Codable{
	public var id : Int?
	public var name : String?
	public var descr : String?
	public var price : String?
	public var img : String?
	public var sort : Int?
	public var state : Int?
	public var currency : String?
	public var relative : String?
	public var created_at : String?
	public var updated_at : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let Gas_list = Gas.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Gas Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Gas]
    {
        var models:[Gas] = []
        for item in array
        {
            models.append(Gas(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let Gas = Gas(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Gas Instance.
*/
	required public init?(dictionary: NSDictionary) {

		id = dictionary["id"] as? Int
		name = dictionary["name"] as? String
		descr = dictionary["descr"] as? String
		price = dictionary["price"] as? String
		img = dictionary["img"] as? String
		sort = dictionary["sort"] as? Int
		state = dictionary["state"] as? Int
		currency = dictionary["currency"] as? String
		relative = dictionary["relative"] as? String
		created_at = dictionary["created_at"] as? String
		updated_at = dictionary["updated_at"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.name, forKey: "name")
		dictionary.setValue(self.descr, forKey: "descr")
		dictionary.setValue(self.price, forKey: "price")
		dictionary.setValue(self.img, forKey: "img")
		dictionary.setValue(self.sort, forKey: "sort")
		dictionary.setValue(self.state, forKey: "state")
		dictionary.setValue(self.currency, forKey: "currency")
		dictionary.setValue(self.relative, forKey: "relative")
		dictionary.setValue(self.created_at, forKey: "created_at")
		dictionary.setValue(self.updated_at, forKey: "updated_at")

		return dictionary
	}

}
