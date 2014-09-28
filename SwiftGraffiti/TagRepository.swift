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
        for item : AnyObject in save["tags"] as NSArray{
            //  Keep only objC objects compatible with OutType
            if let converted = bridgeFromObjectiveC(item, Tag.self) {
                result.append(converted)
            }
        }
        return result
    }
    
    func convertTagsToData(tags:[Tag]) -> NSDictionary
    {
        var data = Dictionary<String, [Tag]>()
        data["tags"]=tags
        return data
    }

    func saveTags(data:NSMutableDictionary) {
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        var path = paths.stringByAppendingPathComponent("data.plist")
        var fileManager = NSFileManager.defaultManager()
        if (!(fileManager.fileExistsAtPath(path)))
        {
            var bundle : NSString = NSBundle.mainBundle().pathForResource("data", ofType: "plist")!
            fileManager.copyItemAtPath(bundle, toPath: path, error:nil)
        }
        data.writeToFile(path, atomically: true)
    }
    
}
