//
//  TagRepository.swift
//  SwiftGraffiti
//
//  Created by Ian on 9/27/14.
//  Copyright (c) 2014 Ializa. All rights reserved.
//

import Foundation

class TagRepository {
    init() {
        
    }
    
    func  loadTags() -> [Tag]{
        var result = [Tag]()
    

        if var dummyCall = NSUserDefaults.standardUserDefaults().arrayForKey("tags") {
            for var index = 0; index < dummyCall.count; index++
            {
                var itemAsHash = dummyCall[index] as NSDictionary
                var item = Tag(info: itemAsHash)
                result.append(item)
                println(item.location.coordinate.longitude)
                println(item.location.coordinate.latitude)
            }
          
        } else {
            println("No Data Was found!!!")
        }
        return result
    }
    
    func searchTags(searchText: String) -> [Tag] {
        var tags = loadTags();
        return tags.filter {
            $0.description.rangeOfString(searchText) != nil
        }
    }
    
    func convertTagsToData(tags:[Tag]) -> NSDictionary
    {
        var data = Dictionary<String, [NSDictionary]>()
        var tagDictionaryArray = [NSDictionary]()
        
        for tag in tags{
            tagDictionaryArray.append(tag.toDictionary())
        }
        
        data["tags"]=tagDictionaryArray
        return data
    }
    
    func convertTagsToDatum(tags:[Tag]) -> NSArray
    {
        var data = Dictionary<String, [NSDictionary]>()
        var tagDictionaryArray = [NSDictionary]()
        
        for tag in tags{
            tagDictionaryArray.append(tag.toDictionary())
        }
        
        return tagDictionaryArray
    }

    func saveTags(tags:[Tag]) {
        var datum = convertTagsToDatum(tags)
        let userDefaults = NSUserDefaults.standardUserDefaults()
        println(datum)
        userDefaults.setObject(datum, forKey: "tags")
        userDefaults.synchronize()
        println("I saved something awesome")

    }
    
}
