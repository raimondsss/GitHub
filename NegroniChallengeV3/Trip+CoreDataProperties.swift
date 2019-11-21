//
//  Trip+CoreDataProperties.swift
//  NegroniChallengeV3
//
//  Created by Chiara Pellecchia on 21/11/2019.
//  Copyright © 2019 Chiara Pellecchia. All rights reserved.
//
//

import Foundation
import CoreData


extension Trip {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trip> {
        return NSFetchRequest<Trip>(entityName: "Trip")
    }

    @NSManaged public var creationData: Date?
    @NSManaged public var id: Int16
    @NSManaged public var photo: Data?
    @NSManaged public var title: String?
    @NSManaged public var page: NSSet?

}

// MARK: Generated accessors for page
extension Trip {

    @objc(addPageObject:)
    @NSManaged public func addToPage(_ value: Page)

    @objc(removePageObject:)
    @NSManaged public func removeFromPage(_ value: Page)

    @objc(addPage:)
    @NSManaged public func addToPage(_ values: NSSet)

    @objc(removePage:)
    @NSManaged public func removeFromPage(_ values: NSSet)

}
