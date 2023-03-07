import Foundation

import Foundation
import CoreData

func fetchConsume(context: NSManagedObjectContext) -> [ConsumoDia] {
    do {
        let consumeRequest = ConsumoDia.fetchRequest() as NSFetchRequest<ConsumoDia>
        return try context.fetch(consumeRequest)

    } catch {
        print(error)
        return []
    }
}

func createConsume(date: Date, consume: Int, context: NSManagedObjectContext) -> ConsumoDia {
    let newConsume = ConsumoDia(context: context)
    newConsume.data = date
    newConsume.consumo = Int32(consume)
    return newConsume
}

func saveConsumeCoreData(context: NSManagedObjectContext) -> Bool {
    do {
        try context.save()
        return true
    }
    catch{
        print(error)
    }

    return false
}

func filterConsumeByDate(date: Date, context: NSManagedObjectContext) -> ConsumoDia? {
    var consume: ConsumoDia?
    let fetch = ConsumoDia.fetchRequest()
    fetch.predicate = NSPredicate(format: "data == %@", "\(date)")
    do {
        consume = try context.fetch(fetch).first
        return consume
    } catch {
        print(error)
    }
    return consume
}

func updateConsume(date: Date, newConsumo: Int, context: NSManagedObjectContext)  -> Bool {
    let consume = filterConsumeByDate(date: date, context: context)
    if let consumeToBeUpdated = consume {
        if consumeToBeUpdated.data == Date.now {
            consumeToBeUpdated.consumo = Int32(newConsumo)
        } else {
            return false
        }
        do {
            try context.save()
            return true
        } catch {
            return false
        }
    } else {
        return false
    }
}

func deleteConsume(date: Date, context: NSManagedObjectContext) -> Bool {
    let consume = filterConsumeByDate(date: date, context: context)
    if let consumeToBeDeleted = consume  {
        context.delete(consumeToBeDeleted)
        do {
            try context.save()
            return true
        }
        catch{
            print(error)
            return false
        }
    }
    return false
}

func printAllConsumes (context: NSManagedObjectContext) {
    var consumes = fetchConsume(context: context)
    if !consumes.isEmpty {
        for consume in consumes {
            print(consume)
        }
    } else {
        print("There is no dates saved at the core data.")
    }
}
