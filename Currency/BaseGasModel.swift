/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class BaseGasModel : Codable {
	public var current_page : Int?
	public var data : Array<Gas>?
	public var first_page_url : String?
	public var from : Int?
	public var last_page : Int?
	public var last_page_url : String?
	public var next_page_url : String?
	public var path : String?
	public var per_page : Int?
	public var prev_page_url : String?
	public var to : Int?
	public var total : Int?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let json4Swift_Base_list = Json4Swift_Base.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Json4Swift_Base Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [BaseGasModel]
    {
        var models:[BaseGasModel] = []
        for item in array
        {
            models.append(BaseGasModel(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let json4Swift_Base = Json4Swift_Base(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Json4Swift_Base Instance.
*/
	required public init?(dictionary: NSDictionary) {

		current_page = dictionary["current_page"] as? Int
        if (dictionary["data"] != nil) { data = Gas.modelsFromDictionaryArray(array: dictionary["data"] as! NSArray) }
		first_page_url = dictionary["first_page_url"] as? String
		from = dictionary["from"] as? Int
		last_page = dictionary["last_page"] as? Int
		last_page_url = dictionary["last_page_url"] as? String
		next_page_url = dictionary["next_page_url"] as? String
		path = dictionary["path"] as? String
		per_page = dictionary["per_page"] as? Int
		prev_page_url = dictionary["prev_page_url"] as? String
		to = dictionary["to"] as? Int
		total = dictionary["total"] as? Int
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.current_page, forKey: "current_page")
		dictionary.setValue(self.first_page_url, forKey: "first_page_url")
		dictionary.setValue(self.from, forKey: "from")
		dictionary.setValue(self.last_page, forKey: "last_page")
		dictionary.setValue(self.last_page_url, forKey: "last_page_url")
		dictionary.setValue(self.next_page_url, forKey: "next_page_url")
		dictionary.setValue(self.path, forKey: "path")
		dictionary.setValue(self.per_page, forKey: "per_page")
		dictionary.setValue(self.prev_page_url, forKey: "prev_page_url")
		dictionary.setValue(self.to, forKey: "to")
		dictionary.setValue(self.total, forKey: "total")

		return dictionary
	}

}
