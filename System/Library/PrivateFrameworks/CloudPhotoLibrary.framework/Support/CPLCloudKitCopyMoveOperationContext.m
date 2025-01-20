@interface CPLCloudKitCopyMoveOperationContext
- (CKRecordZoneID)destinationZoneID;
- (CKRecordZoneID)sourceZoneID;
- (id)extendedStatusDescriptionStrings;
- (id)initFromZoneID:(id)a3 toZoneID:(id)a4;
- (id)operationDescription;
- (void)addCopyMoveFromRecordID:(id)a3 toRecordID:(id)a4;
@end

@implementation CPLCloudKitCopyMoveOperationContext

- (id)initFromZoneID:(id)a3 toZoneID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CPLCloudKitCopyMoveOperationContext;
  v9 = -[CPLCloudKitCopyMoveOperationContext init](&v12, "init");
  p_isa = (id *)&v9->super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceZoneID, a3);
    objc_storeStrong(p_isa + 12, a4);
  }

  return p_isa;
}

- (void)addCopyMoveFromRecordID:(id)a3 toRecordID:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  sourceRecordIDs = self->_sourceRecordIDs;
  if (!sourceRecordIDs)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v9 = self->_sourceRecordIDs;
    self->_sourceRecordIDs = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    destinationRecordIDs = self->_destinationRecordIDs;
    self->_destinationRecordIDs = v10;

    sourceRecordIDs = self->_sourceRecordIDs;
  }

  -[NSMutableArray addObject:](sourceRecordIDs, "addObject:", v12);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_destinationRecordIDs,  "setObject:forKeyedSubscript:",  v6,  v12);
}

- (id)operationDescription
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZoneID cpl_zoneName](self->_sourceZoneID, "cpl_zoneName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZoneID cpl_zoneName](self->_destinationZoneID, "cpl_zoneName"));
  id v6 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@ -> %@", v4, v5);

  return v6;
}

- (id)extendedStatusDescriptionStrings
{
  v3 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_sourceRecordIDs, "count"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  obj = self->_sourceRecordIDs;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_destinationRecordIDs,  "objectForKeyedSubscript:",  v8));
        v10 = objc_alloc(&OBJC_CLASS___NSString);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v8 recordName]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 recordName]);
        v13 = -[NSString initWithFormat:](v10, "initWithFormat:", @"%@ -> %@", v11, v12);
        -[NSMutableArray addObject:](v3, "addObject:", v13);
      }

      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v5);
  }

  return v3;
}

- (CKRecordZoneID)sourceZoneID
{
  return self->_sourceZoneID;
}

- (CKRecordZoneID)destinationZoneID
{
  return self->_destinationZoneID;
}

- (void).cxx_destruct
{
}

@end