//
//  Trip+CoreDataProperties.swift
//  NegroniChallenge
//
//  Created by Raimondo Giordano on 18/11/2019.
//  Copyright © 2019 Raimondo Giordano. All rights reserved.
//
//

import Foundation
import CoreData


extension Trip {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trip> {
        return NSFetchRequest<Trip>(entityName: "Trip")
    }

    @NSManaged public var title: String?
    @NSManaged public var creationDate: Date?
    @NSManaged public var pages: Set<Page>?

}

// MARK: Generated accessors for pages
extension Trip {

    @objc(addPagesObject:)
    @NSManaged public func addToPages(_ value: Page)

    @objc(removePagesObject:)
    @NSManaged public func removeFromPages(_ value: Page)

    @objc(addPages:)
    @NSManaged public func addToPages(_ values: NSSet)

    @objc(removePages:)
    @NSManaged public func removeFromPages(_ values: NSSet)

}
