@interface NSPersistentHistoryChange
+ (NSEntityDescription)entityDescription;
+ (NSEntityDescription)entityDescriptionWithContext:(NSManagedObjectContext *)context;
+ (NSFetchRequest)fetchRequest;
+ (id)shortStringForChangeType:(int64_t)a3;
+ (id)stringForChangeType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)tombstone;
- (NSManagedObjectID)changedObjectID;
- (NSPersistentHistoryChangeType)changeType;
- (NSPersistentHistoryTransaction)transaction;
- (NSSet)updatedProperties;
- (id)description;
- (int64_t)changeID;
@end

@implementation NSPersistentHistoryChange

+ (NSFetchRequest)fetchRequest
{
  v2 = +[NSPersistentHistoryChange entityDescription](&OBJC_CLASS___NSPersistentHistoryChange, "entityDescription");
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
    return +[NSPersistentHistoryChange entityDescriptionWithContext:]( &OBJC_CLASS___NSPersistentHistoryChange,  "entityDescriptionWithContext:",  v2);
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
        uint64_t v5 = [NSString stringWithFormat:@"%@/%@", +[_PFPersistentHistoryFetchModel ancillaryModelNamespace]( _PFPersistentHistoryFetchModel, "ancillaryModelNamespace"), @"Change"],  modelMap))
  {
    return (NSEntityDescription *)-[NSDictionary objectForKey:](modelMap->_entitiesByPath, "objectForKey:", v5);
  }

  else
  {
    return 0LL;
  }

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<NSPersistentHistoryChange: %lld %@ %@ %lld %@ %@>", -[NSPersistentHistoryChange changeID](self, "changeID"), -[NSPersistentHistoryChange changedObjectID](self, "changedObjectID"), +[NSPersistentHistoryChange shortStringForChangeType:]( NSPersistentHistoryChange, "shortStringForChangeType:", -[NSPersistentHistoryChange changeType](self, "changeType")), -[NSPersistentHistoryTransaction transactionNumber]( -[NSPersistentHistoryChange transaction](self, "transaction"), "transactionNumber"), -[NSPersistentHistoryChange updatedProperties](self, "updatedProperties"), -[NSPersistentHistoryChange tombstone](self, "tombstone")];
}

- (NSDictionary)tombstone
{
  return (NSDictionary *)MEMORY[0x189604A60];
}

- (NSManagedObjectID)changedObjectID
{
  return 0LL;
}

- (NSPersistentHistoryChangeType)changeType
{
  return -1LL;
}

- (NSPersistentHistoryTransaction)transaction
{
  return 0LL;
}

- (int64_t)changeID
{
  return -1LL;
}

- (NSSet)updatedProperties
{
  return 0LL;
}

+ (id)shortStringForChangeType:(int64_t)a3
{
  return (id)objc_msgSend( (id)objc_msgSend(a1, "stringForChangeType:", a3),  "stringByReplacingOccurrencesOfString:withString:",  @"NSPersistentHistoryChangeType",  &stru_189EAC2E8);
}

+ (id)stringForChangeType:(int64_t)a3
{
  return (id)+[_NSPersistentHistoryChange supportsSecureCoding](v4, v5);
}

@end