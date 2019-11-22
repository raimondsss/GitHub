//
//  Page+CoreDataProperties.swift
//  NegroniChallengeV3
//
//  Created by Chiara Pellecchia on 22/11/2019.
//  Copyright © 2019 Chiara Pellecchia. All rights reserved.
//
//

import Foundation
import CoreData


extension Page {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Page> {
        return NSFetchRequest<Page>(entityName: "Page")
    }

    @NSManaged public var date: String?
    @NSManaged public var desc: String?
    @NSManaged public var photo: Data?

}
