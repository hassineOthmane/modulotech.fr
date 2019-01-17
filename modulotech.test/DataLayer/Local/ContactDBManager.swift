//
//  ContactDBManager.swift
//  modulotech.test
//
//  Created by hassine othmane on 1/16/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit
import CoreData

protocol ContactDBManagerProtocol: class {
    func loadContactsFromDB(_ callBack:@escaping ([Contact]) -> Void )
    func clearOldResults()
    func save(contacts: [Contact], finished: @escaping () -> Void)
}

class ContactDBManager : ContactDBManagerProtocol  {

    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    var persistentContainer: NSPersistentContainer {
        return appDelegate.persistentContainer
    }

    var mainContext: NSManagedObjectContext {
        return appDelegate.persistentContainer.viewContext
    }


    //MARK: - Helper Methods
    internal func clearOldResults() {
        let entity = NSEntityDescription.entity(forEntityName: "ContactLocal", in: mainContext)
        _ = NSManagedObject(entity: entity!, insertInto: mainContext)
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = ContactLocal.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        try! persistentContainer.persistentStoreCoordinator.execute(deleteRequest, with: persistentContainer.viewContext)
        persistentContainer.viewContext.reset()
    }

    internal func clearOldMeResults() {
        let entity = NSEntityDescription.entity(forEntityName: "ContactMe", in: mainContext)
        _ = NSManagedObject(entity: entity!, insertInto: mainContext)
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = ContactMe.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        try! persistentContainer.persistentStoreCoordinator.execute(deleteRequest, with: persistentContainer.viewContext)
        persistentContainer.viewContext.reset()
    }


    func save(contacts: [Contact], finished: @escaping () -> Void) {
        clearOldResults()
        _ = toUnsavedCoreData(from: contacts, with: mainContext)
        try! mainContext.save()
        finished()
    }

    func saveMe(contact: Contact, finished: @escaping () -> Void) {
        clearOldMeResults()
       _ = toUnsavedCoreData(from: contact, with: mainContext)
        try! mainContext.save()
        finished()
    }

    

    internal func loadContactsFromDB(_ callBack:@escaping ([Contact]) -> Void ) {
        let fetchRequest: NSFetchRequest<ContactLocal> = ContactLocal.fetchRequest()
        let contactsLocal = try! persistentContainer.viewContext.fetch(fetchRequest)
        var contacts = [Contact]()
        for contact in contactsLocal {
            contacts.append(translate(from: contact)!)
        }
        callBack( contacts)
    }

    internal func loadContactMeFromDB(_ callBack:@escaping (Contact) -> Void ) {
        let fetchRequest: NSFetchRequest<ContactMe> = ContactMe.fetchRequest()
        let contactsMe = try! persistentContainer.viewContext.fetch(fetchRequest)
        var contact = Contact()
        for c in contactsMe {
            contact = translate(from: c)!
        }
        callBack(contact)
    }

    func toUnsavedCoreData(from contacts: [Contact], with context: NSManagedObjectContext) -> [ContactLocal] {
        let contactsLocal = contacts.compactMap{ dto in translate(contact: dto, with: context) }
        return contactsLocal
    }

    func toUnsavedCoreData(from contactMe: Contact, with context: NSManagedObjectContext) -> ContactMe {
        let contactMe =  translate(contactMe: contactMe, with: context)
        return contactMe!
    }


    func translate(contact: Contact?, with context: NSManagedObjectContext) -> ContactLocal? {
        guard let contact = contact else { return nil }
        let contactLocal = ContactLocal(context: context)
        contactLocal.first = contact.first
        contactLocal.last = contact.last
        contactLocal.gender = contact.gender
        contactLocal.title = contact.title

        contactLocal.email = contact.email
        contactLocal.phone = contact.phone
        contactLocal.cell = contact.cell
        contactLocal.ssn = contact.SSN

        contactLocal.city = contact.city
        contactLocal.street = contact.street
        contactLocal.state = contact.state
        contactLocal.zip = contact.zip

        contactLocal.medium = contact.medium
        contactLocal.large = contact.large
        contactLocal.thumbnail = contact.thumbnail


        return contactLocal
    }

    func translate(contactMe: Contact?, with context: NSManagedObjectContext) -> ContactMe? {
        guard let contact = contactMe else { return nil }
        let contactMe = ContactMe(context: context)
        contactMe.first = contact.first
        contactMe.last = contact.last
        contactMe.gender = contact.gender
        contactMe.title = contact.title

        contactMe.email = contact.email
        contactMe.phone = contact.phone
        contactMe.cell = contact.cell
        contactMe.ssn = contact.SSN

        contactMe.city = contact.city
        contactMe.street = contact.street
        contactMe.state = contact.state
        contactMe.zip = contact.zip

        contactMe.medium = contact.medium
        contactMe.large = contact.large
        contactMe.thumbnail = contact.thumbnail


        return contactMe
    }

    func translate(from contact: ContactLocal) -> Contact? {
        return Contact.init(first: contact.first!, last: contact.last!, title: contact.title!, gender: contact.gender!, street: contact.street!, city: contact.city!, state: contact.state!, zip: contact.zip!, email: contact.email!, phone: contact.phone!, cell: contact.cell!, SSN: contact.ssn!, medium: contact.medium!, large: contact.large!, thumbnail: contact.thumbnail!)

    }
    func translate(from contact: ContactMe) -> Contact? {
        return Contact.init(first: contact.first!, last: contact.last!, title: contact.title!, gender: contact.gender!, street: contact.street!, city: contact.city!, state: contact.state!, zip: contact.zip!, email: contact.email!, phone: contact.phone!, cell: contact.cell!, SSN: contact.ssn!, medium: contact.medium!, large: contact.large!, thumbnail: contact.thumbnail!)

    }

}
