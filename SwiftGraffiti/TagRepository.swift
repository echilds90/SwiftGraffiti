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
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        var path = paths.stringByAppendingPathComponent("data.plist")
        let save = NSDictionary(contentsOfFile: path)
        var result = [Tag]()
        if save["tags"] != nil {
            println("The day is awesome!")
            for item : AnyObject in save["tags"] as NSArray{
                result.append(item as Tag)
            }
        }
        
        if let dummyCall : AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("tags") {
            for item : AnyObject in save["tags"] as NSArray{
                result.append(item as Tag)
                println(item)
                println("ITEMS")
            }
        }
        

        return result
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
        var newData = NSKeyedArchiver.archivedDataWithRootObject(datum)
        
        var data = convertTagsToData(tags)
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths.objectAtIndex(0) as NSString
        let path = documentsDirectory + "/data.plist"
        println(path)
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(newData, forKey: "tags")
        userDefaults.synchronize()
        data.writeToFile(path, atomically: true)
        
        println("I saved something awesome")
    }
    
}
