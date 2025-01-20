@interface RMPersistentHistoryNotifierChanges
+ (BOOL)isExistingPersistentHistoryToken:(id)a3 fromSameStoreAsUpdatedToken:(id)a4;
- (NSDictionary)tombstoneByObjectID;
- (NSDictionary)updatedPropertiesByObjectID;
- (NSPersistentHistoryToken)persistentHistoryToken;
- (NSSet)deletedObjectIDs;
- (NSSet)insertedObjectIDs;
- (NSSet)updatedObjectIDs;
- (RMPersistentHistoryNotifierChanges)init;
- (void)_updatePropertiesWithChange:(id)a3;
- (void)setPersistentHistoryToken:(id)a3;
- (void)updateWithChange:(id)a3;
@end

@implementation RMPersistentHistoryNotifierChanges

- (NSSet)insertedObjectIDs
{
  return (NSSet *)self->_insertedObjectIDs;
}

- (NSSet)updatedObjectIDs
{
  return (NSSet *)self->_updatedObjectIDs;
}

- (NSDictionary)updatedPropertiesByObjectID
{
  return (NSDictionary *)self->_updatedPropertiesByObjectID;
}

- (NSSet)deletedObjectIDs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_tombstoneByObjectID, "allKeys"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return (NSSet *)v3;
}

- (NSDictionary)tombstoneByObjectID
{
  return (NSDictionary *)self->_tombstoneByObjectID;
}

+ (BOOL)isExistingPersistentHistoryToken:(id)a3 fromSameStoreAsUpdatedToken:(id)a4
{
  return !a3 || [a3 compareToken:a4 error:0] != 0;
}

- (RMPersistentHistoryNotifierChanges)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RMPersistentHistoryNotifierChanges;
  v2 = -[RMPersistentHistoryNotifierChanges init](&v12, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    insertedObjectIDs = v2->_insertedObjectIDs;
    v2->_insertedObjectIDs = v3;

    v5 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    updatedObjectIDs = v2->_updatedObjectIDs;
    v2->_updatedObjectIDs = v5;

    v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    updatedPropertiesByObjectID = v2->_updatedPropertiesByObjectID;
    v2->_updatedPropertiesByObjectID = v7;

    v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    tombstoneByObjectID = v2->_tombstoneByObjectID;
    v2->_tombstoneByObjectID = v9;
  }

  return v2;
}

- (void)updateWithChange:(id)a3
{
  id v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v9 changedObjectID]);
  id v5 = [v9 changeType];
  if (v5 == (id)2)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v9 tombstone]);
    v7 = (void *)v6;
    if (v6) {
      v8 = (void *)v6;
    }
    else {
      v8 = &__NSDictionary0__struct;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_tombstoneByObjectID,  "setObject:forKeyedSubscript:",  v8,  v4);
  }

  else if (v5 == (id)1)
  {
    -[NSMutableSet addObject:](self->_updatedObjectIDs, "addObject:", v4);
    -[RMPersistentHistoryNotifierChanges _updatePropertiesWithChange:](self, "_updatePropertiesWithChange:", v9);
  }

  else if (!v5)
  {
    -[NSMutableSet addObject:](self->_insertedObjectIDs, "addObject:", v4);
  }
}

- (void)_updatePropertiesWithChange:(id)a3
{
  id v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v9 updatedProperties]);
  if ([v4 count])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v9 changedObjectID]);
    uint64_t v6 = self->_updatedPropertiesByObjectID;
    v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v5));
    if (!v7)
    {
      v7 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v7, v5);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:@"name"]);
    -[NSMutableSet unionSet:](v7, "unionSet:", v8);
  }
}

- (NSPersistentHistoryToken)persistentHistoryToken
{
  return self->_persistentHistoryToken;
}

- (void)setPersistentHistoryToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end