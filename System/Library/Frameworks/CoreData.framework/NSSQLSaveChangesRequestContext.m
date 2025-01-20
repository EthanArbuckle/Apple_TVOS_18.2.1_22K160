@interface NSSQLSaveChangesRequestContext
- (BOOL)executeRequestCore:(id *)a3;
- (BOOL)isWritingRequest;
- (NSSQLSaveChangesRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5;
- (id)rowCache;
- (os_unfair_lock_s)originalRowForObjectID:(uint64_t)a1;
- (void)addDataMask:(uint64_t)a3 forEntityKey:;
- (void)dealloc;
- (void)executeEpilogue;
- (void)executePrologue;
@end

@implementation NSSQLSaveChangesRequestContext

- (NSSQLSaveChangesRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NSSQLSaveChangesRequestContext;
  v7 = -[NSSQLStoreRequestContext initWithRequest:context:sqlCore:](&v18, sel_initWithRequest_context_sqlCore_, a3);
  if (!v7) {
    return v7;
  }
  v7->_metadataToWrite = (NSDictionary *)-[NSSQLCore metadataToWrite]((uint64_t)a5);
  v7->_savePlan = (NSSQLSavePlan *)-[NSSQLSavePlan initForRequestContext:]( objc_alloc(&OBJC_CLASS___NSSQLSavePlan),  "initForRequestContext:",  v7);
  if (a5) {
    v8 = (void *)*((void *)a5 + 6);
  }
  else {
    v8 = 0LL;
  }
  v7->_faultHandler = (NSFaultHandler *)v8;
  v7->_objectIDsInsertUpdatedToPruneDATrigger = 0LL;
  v7->_objectIDsUpdatedToPruneDATrigger = 0LL;
  v7->_objectIDsToPruneTrigger = 0LL;
  v7->_originalCachedRows = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  v7->_updateMasksForHistoryTracking = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  if (!a5)
  {
    v17 = (NSString *)(id)[0 externalDataReferencesDirectory];
    v10 = 0LL;
    v7->_externalDataReferencesDirectory = v17;
LABEL_9:
    v7->_externalDataLinksDirectory = (NSString *)v10;
    goto LABEL_10;
  }

  if ((*((_BYTE *)a5 + 201) & 0x40) == 0)
  {
    v7->_externalDataReferencesDirectory = (NSString *)(id)[a5 externalDataReferencesDirectory];
    v10 = (void *)atomic_load((unint64_t *)a5 + 22);
    goto LABEL_9;
  }

- (void)dealloc
{
  self->_metadataToWrite = 0LL;
  self->_faultHandler = 0LL;

  self->_savePlan = 0LL;
  self->_objectIDsInsertUpdatedToPruneDATrigger = 0LL;

  self->_objectIDsUpdatedToPruneDATrigger = 0LL;
  self->_objectIDsToPruneTrigger = 0LL;

  self->_originalCachedRows = 0LL;
  self->_updateMasksForHistoryTracking = 0LL;

  self->_externalDataReferencesDirectory = 0LL;
  self->_externalDataLinksDirectory = 0LL;

  self->_fileBackedFuturesDirectory = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLSaveChangesRequestContext;
  -[NSSQLStoreRequestContext dealloc](&v3, sel_dealloc);
}

- (id)rowCache
{
  return self->_primaryRowCache;
}

- (BOOL)isWritingRequest
{
  return 1;
}

- (void)executePrologue
{
  savePlan = self->_savePlan;
  if (savePlan)
  {
    -[NSSQLSavePlan _createRowsForSave]((uint64_t)self->_savePlan);
    -[NSSQLSavePlan _computeUpdatedRowSplit](savePlan);
  }

- (void)executeEpilogue
{
  uint64_t v77 = *MEMORY[0x1895F89C0];
  objc_super v3 = -[NSSQLSaveChangesRequestContext rowCache](self, "rowCache");
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  id v58 = objc_alloc_init(MEMORY[0x189603FA8]);
  obj = self->_objectIDsInsertUpdatedToPruneDATrigger;
  v61 = self;
  uint64_t v4 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v70,  v76,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v71;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v71 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v70 + 1) + 8 * v7);
        v9 = (void *)[v8 firstObject];
        if (v3)
        {
          v10 = v9;
          v11 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:]( v3,  v9,  *(double *)&NSSQLDistantPastTimeInterval);
          if (v11)
          {
            v12 = v11;
            uint64_t v13 = -[NSSQLCore entityForObjectID:]((uint64_t)v61->super._sqlCore, v10);
            uint64_t v14 = [v8 objectAtIndex:1];
            if (v13) {
              v15 = (void *)[*(id *)(v13 + 40) objectForKey:v14];
            }
            else {
              v15 = 0LL;
            }
            unsigned int v16 = [v15 slot];
            v17 = (void *)[v8 lastObject];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              snapshot_set_null((char *)-[os_unfair_lock_s _snapshot](v12, "_snapshot"), v16);
            }

            else if ([v17 isNSDate])
            {
              objc_super v18 = (char *)-[os_unfair_lock_s _snapshot](v12, "_snapshot");
LABEL_14:
              [v17 timeIntervalSinceReferenceDate];
LABEL_15:
              snapshot_set_double(v18, v16, v19);
            }

            else if ([v17 isNSString])
            {
              v20 = (char *)-[os_unfair_lock_s _snapshot](v12, "_snapshot");
              CFStringRef v21 = CFStringCreateWithCString(0, (const char *)[v17 UTF8String], 0x8000100u);
              snapshot_set_object(v20, v16, (uint64_t)v21);
            }

            else if ([v17 isNSNumber])
            {
              Class Class = object_getClass((id)-[os_unfair_lock_s _snapshot](v12, "_snapshot"));
              int v23 = *(char *)(*((void *)object_getIndexedIvars(Class) + 7) + v16);
              switch(v23)
              {
                case 'c':
                  snapshot_set_int8( (void *)-[os_unfair_lock_s _snapshot](v12, "_snapshot"),  v16,  [v17 charValue]);
                  break;
                case 'd':
                  objc_super v18 = (char *)-[os_unfair_lock_s _snapshot](v12, "_snapshot");
                  [v17 doubleValue];
                  goto LABEL_15;
                case 'e':
                case 'g':
                case 'h':
                  break;
                case 'f':
                  v24 = (char *)-[os_unfair_lock_s _snapshot](v12, "_snapshot");
                  [v17 floatValue];
                  snapshot_set_float(v24, v16, v25);
                  break;
                case 'i':
                  snapshot_set_int32( (char *)-[os_unfair_lock_s _snapshot](v12, "_snapshot"),  v16,  [v17 intValue]);
                  break;
                default:
                  if (v23 == 113)
                  {
                    snapshot_set_int64( (char *)-[os_unfair_lock_s _snapshot](v12, "_snapshot"),  v16,  [v17 longLongValue]);
                  }

                  else if (v23 == 115)
                  {
                    snapshot_set_int16( (char *)-[os_unfair_lock_s _snapshot](v12, "_snapshot"),  v16,  [v17 shortValue]);
                  }

                  break;
              }
            }
          }
        }

        ++v7;
      }

      while (v5 != v7);
      uint64_t v26 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v70,  v76,  16LL);
      uint64_t v5 = v26;
    }

    while (v26);
  }

  -[NSManagedObjectContext _addObjectIDsInsertUpdatedByDATriggers:]((uint64_t)v61->super._context, v58);
  id obja = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  objectIDsUpdatedToPruneDATrigger = v61->_objectIDsUpdatedToPruneDATrigger;
  uint64_t v28 = -[NSArray countByEnumeratingWithState:objects:count:]( objectIDsUpdatedToPruneDATrigger,  "countByEnumeratingWithState:objects:count:",  &v66,  v75,  16LL);
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v67;
    do
    {
      uint64_t v31 = 0LL;
      do
      {
        if (*(void *)v67 != v30) {
          objc_enumerationMutation(objectIDsUpdatedToPruneDATrigger);
        }
        v32 = *(void **)(*((void *)&v66 + 1) + 8 * v31);
        v33 = (void *)[v32 firstObject];
        if (v3)
        {
          v34 = v33;
          v35 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:]( v3,  v33,  *(double *)&NSSQLDistantPastTimeInterval);
          if (v35)
          {
            v36 = v35;
            uint64_t v37 = -[NSSQLCore entityForObjectID:]((uint64_t)v61->super._sqlCore, v34);
            uint64_t v38 = [v32 objectAtIndex:1];
            if (v37) {
              v39 = (void *)[*(id *)(v37 + 40) objectForKey:v38];
            }
            else {
              v39 = 0LL;
            }
            unsigned int v40 = [v39 slot];
            v41 = (void *)[v32 lastObject];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              snapshot_set_null((char *)-[os_unfair_lock_s _snapshot](v36, "_snapshot"), v40);
            }

            else if ([v41 isNSDate])
            {
              v42 = (char *)-[os_unfair_lock_s _snapshot](v36, "_snapshot");
LABEL_48:
              [v41 timeIntervalSinceReferenceDate];
LABEL_49:
              snapshot_set_double(v42, v40, v43);
            }

            else if ([v41 isNSString])
            {
              v44 = (char *)-[os_unfair_lock_s _snapshot](v36, "_snapshot");
              CFStringRef v45 = CFStringCreateWithCString(0, (const char *)[v41 UTF8String], 0x8000100u);
              snapshot_set_object(v44, v40, (uint64_t)v45);
            }

            else if ([v41 isNSNumber])
            {
              Class v46 = object_getClass((id)-[os_unfair_lock_s _snapshot](v36, "_snapshot"));
              int v47 = *(char *)(*((void *)object_getIndexedIvars(v46) + 7) + v40);
              switch(v47)
              {
                case 'c':
                  snapshot_set_int8( (void *)-[os_unfair_lock_s _snapshot](v36, "_snapshot"),  v40,  [v41 charValue]);
                  break;
                case 'd':
                  v42 = (char *)-[os_unfair_lock_s _snapshot](v36, "_snapshot");
                  [v41 doubleValue];
                  goto LABEL_49;
                case 'e':
                case 'g':
                case 'h':
                  break;
                case 'f':
                  v48 = (char *)-[os_unfair_lock_s _snapshot](v36, "_snapshot");
                  [v41 floatValue];
                  snapshot_set_float(v48, v40, v49);
                  break;
                case 'i':
                  snapshot_set_int32( (char *)-[os_unfair_lock_s _snapshot](v36, "_snapshot"),  v40,  [v41 intValue]);
                  break;
                default:
                  if (v47 == 113)
                  {
                    snapshot_set_int64( (char *)-[os_unfair_lock_s _snapshot](v36, "_snapshot"),  v40,  [v41 longLongValue]);
                  }

                  else if (v47 == 115)
                  {
                    snapshot_set_int16( (char *)-[os_unfair_lock_s _snapshot](v36, "_snapshot"),  v40,  [v41 shortValue]);
                  }

                  break;
              }
            }
          }
        }

        ++v31;
      }

      while (v29 != v31);
      uint64_t v50 = -[NSArray countByEnumeratingWithState:objects:count:]( objectIDsUpdatedToPruneDATrigger,  "countByEnumeratingWithState:objects:count:",  &v66,  v75,  16LL);
      uint64_t v29 = v50;
    }

    while (v50);
  }

  -[NSManagedObjectContext _addObjectIDsUpdatedByDATriggers:]((uint64_t)v61->super._context, obja);
  id v51 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  objectIDsToPruneTrigger = v61->_objectIDsToPruneTrigger;
  uint64_t v53 = -[NSSet countByEnumeratingWithState:objects:count:]( objectIDsToPruneTrigger,  "countByEnumeratingWithState:objects:count:",  &v62,  v74,  16LL);
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v55 = *(void *)v63;
    do
    {
      for (uint64_t i = 0LL; i != v54; ++i)
      {
        if (*(void *)v63 != v55) {
          objc_enumerationMutation(objectIDsToPruneTrigger);
        }
        uint64_t v57 = *(void *)(*((void *)&v62 + 1) + 8 * i);
        if (v57 != NSKeyValueCoding_NullValue)
        {
          -[NSPersistentStoreCache forgetRowForObjectID:]((uint64_t)v3, *(const void **)(*((void *)&v62 + 1) + 8 * i));
          [v51 addObject:v57];
        }
      }

      uint64_t v54 = -[NSSet countByEnumeratingWithState:objects:count:]( objectIDsToPruneTrigger,  "countByEnumeratingWithState:objects:count:",  &v62,  v74,  16LL);
    }

    while (v54);
  }

  -[NSManagedObjectContext _addObjectIDsUpdatedByTriggers:]((uint64_t)v61->super._context, v51);

  v61->_objectIDsInsertUpdatedToPruneDATrigger = 0LL;
  v61->_objectIDsToPruneTrigger = 0LL;
  -[NSMutableDictionary removeAllObjects](v61->_originalCachedRows, "removeAllObjects");
}

- (BOOL)executeRequestCore:(id *)a3
{
  if (!self) {
    goto LABEL_23;
  }
  if (self->super._exception) {
    goto LABEL_10;
  }
  connection = self->super._connection;
  if (connection) {
    uint64_t v7 = (NSArray *)-[NSMutableArray copy](connection->_mObjectIDsInsertedByDATriggers, "copy");
  }
  else {
LABEL_23:
  }
    uint64_t v7 = 0LL;
  self->_objectIDsInsertUpdatedToPruneDATrigger = v7;
  v8 = self->super._connection;
  if (v8) {
    v9 = (NSArray *)-[NSMutableArray copy](v8->_mObjectIDsUpdatededByDATriggers, "copy");
  }
  else {
    v9 = 0LL;
  }
  self->_objectIDsUpdatedToPruneDATrigger = v9;
  v10 = self->super._connection;
  if (v10) {
    v11 = (NSSet *)-[NSMutableSet copy](v10->_mObjectIDsUpdatedByTriggers, "copy");
  }
  else {
    v11 = 0LL;
  }
  self->_objectIDsToPruneTrigger = v11;
LABEL_10:
  v12 = self->super._connection;
  if (v12)
  {
    -[NSMutableArray removeAllObjects](v12->_mObjectIDsInsertedByDATriggers, "removeAllObjects");
    uint64_t v13 = self->super._connection;
    if (v13)
    {
      -[NSMutableArray removeAllObjects](v13->_mObjectIDsUpdatededByDATriggers, "removeAllObjects");
      uint64_t v14 = self->super._connection;
      if (v14) {
        -[NSMutableSet removeAllObjects](v14->_mObjectIDsUpdatedByTriggers, "removeAllObjects");
      }
    }
  }

  -[NSSQLStoreRequestContext setConnection:]((uint64_t)self, 0LL);
  if (a3 && *a3) {
    objc_setProperty_nonatomic(self, v15, *a3, 40LL);
  }
  return !self->super._exception && !self->super._error && -[NSSQLStoreRequestContext result](self, "result") != 0;
}

- (os_unfair_lock_s)originalRowForObjectID:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = (os_unfair_lock_s *)[*(id *)(a1 + 136) objectForKey:a2];
  if (v4) {
    return v4;
  }
  uint64_t v5 = (os_unfair_lock_s *)[(id)a1 rowCache];
  if (v5)
  {
    uint64_t v4 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v5, a2, *(double *)&NSSQLDistantPastTimeInterval);
    if (v4) {
      goto LABEL_7;
    }
  }

  uint64_t v6 = *(os_unfair_lock_s **)(a1 + 184);
  if (!v6) {
    return 0LL;
  }
  uint64_t v4 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v6, a2, *(double *)&NSSQLDistantPastTimeInterval);
  if (v4) {
LABEL_7:
  }
    [*(id *)(a1 + 136) setObject:v4 forKey:a2];
  return v4;
}

- (void)addDataMask:(uint64_t)a3 forEntityKey:
{
  if (a1)
  {
    uint64_t v6 = (void *)objc_msgSend(*(id *)(a1 + 144), "objectForKey:");
    if (v6)
    {
      id v7 = +[_NSPersistentHistoryChange _mergeOldMask:andNewMask:]( (uint64_t)&OBJC_CLASS____NSPersistentHistoryChange,  v6,  a2);
      [*(id *)(a1 + 144) setObject:v7 forKey:a3];
    }

    else
    {
      [*(id *)(a1 + 144) setObject:a2 forKey:a3];
    }
  }

@end