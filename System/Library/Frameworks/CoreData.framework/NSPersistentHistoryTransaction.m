@interface NSPersistentHistoryTransaction
+ (NSEntityDescription)entityDescription;
+ (NSEntityDescription)entityDescriptionWithContext:(NSManagedObjectContext *)context;
+ (NSFetchRequest)fetchRequest;
- (BOOL)isEqual:(id)a3;
- (NSArray)changes;
- (NSDate)timestamp;
- (NSNotification)objectIDNotification;
- (NSPersistentHistoryToken)token;
- (NSString)author;
- (NSString)bundleID;
- (NSString)contextName;
- (NSString)processID;
- (NSString)storeID;
- (id)description;
- (id)initialQueryGenerationToken;
- (id)postQueryGenerationToken;
- (int64_t)transactionNumber;
@end

@implementation NSPersistentHistoryTransaction

+ (NSFetchRequest)fetchRequest
{
  v2 = +[NSPersistentHistoryTransaction entityDescription]( &OBJC_CLASS___NSPersistentHistoryTransaction,  "entityDescription");
  if (!v2) {
    return 0LL;
  }
  v3 = v2;
  v4 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
  -[NSFetchRequest setEntity:](v4, "setEntity:", v3);
  v5 = v4;
  return v4;
}

+ (NSEntityDescription)entityDescription
{
  uint64_t v2 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 712);
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    return +[NSPersistentHistoryTransaction entityDescriptionWithContext:]( &OBJC_CLASS___NSPersistentHistoryTransaction,  "entityDescriptionWithContext:",  v2);
  }
  else {
    return 0LL;
  }
}

+ (NSEntityDescription)entityDescriptionWithContext:(NSManagedObjectContext *)context
{
  if (context
    && ((v3 = -[NSManagedObjectContext persistentStoreCoordinator](context, "persistentStoreCoordinator")) == 0LL
      ? (modelMap = 0LL)
      : (modelMap = v3->_modelMap),
        uint64_t v5 = [NSString stringWithFormat:@"%@/%@", +[_PFPersistentHistoryFetchModel ancillaryModelNamespace]( _PFPersistentHistoryFetchModel, "ancillaryModelNamespace"), @"Transaction"],  modelMap))
  {
    return (NSEntityDescription *)-[NSDictionary objectForKey:](modelMap->_entitiesByPath, "objectForKey:", v5);
  }

  else
  {
    return 0LL;
  }

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v5 = -[NSPersistentHistoryTransaction storeID](self, "storeID");
  BOOL result = 0;
  if (v5 == (NSString *)[a3 storeID])
  {
    int64_t v6 = -[NSPersistentHistoryTransaction transactionNumber](self, "transactionNumber");
    if (v6 == [a3 transactionNumber]) {
      return 1;
    }
  }

  return result;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<NSPersistentHistoryTransaction: %lld, %@, %@, %@, %@, %@, %@>", -[NSPersistentHistoryTransaction transactionNumber](self, "transactionNumber"), -[NSPersistentHistoryTransaction timestamp](self, "timestamp"), -[NSPersistentHistoryTransaction bundleID](self, "bundleID"), -[NSPersistentHistoryTransaction processID](self, "processID"), -[NSPersistentHistoryTransaction contextName](self, "contextName"), -[NSPersistentHistoryTransaction author](self, "author"), -[NSPersistentHistoryTransaction changes](self, "changes")];
}

- (NSDate)timestamp
{
  return (NSDate *)[MEMORY[0x189603F50] distantFuture];
}

- (NSArray)changes
{
  return 0LL;
}

- (NSPersistentHistoryToken)token
{
  return 0LL;
}

- (id)initialQueryGenerationToken
{
  return 0LL;
}

- (id)postQueryGenerationToken
{
  return 0LL;
}

- (int64_t)transactionNumber
{
  return 0LL;
}

- (NSString)storeID
{
  return (NSString *)&stru_189EAC2E8;
}

- (NSString)bundleID
{
  return (NSString *)&stru_189EAC2E8;
}

- (NSString)processID
{
  return (NSString *)&stru_189EAC2E8;
}

- (NSString)contextName
{
  return 0LL;
}

- (NSString)author
{
  return 0LL;
}

- (NSNotification)objectIDNotification
{
  return (NSNotification *)[MEMORY[0x189607950] notificationWithName:&stru_189EAC2E8 object:0];
}

@end