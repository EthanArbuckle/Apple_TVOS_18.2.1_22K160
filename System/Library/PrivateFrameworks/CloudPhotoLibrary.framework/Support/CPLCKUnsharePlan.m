@interface CPLCKUnsharePlan
- (BOOL)hasShareTodoForScopedIdentifier:(id)a3;
- (BOOL)shouldCopyCKRecordKeyToDestinationCKRecord:(id)a3;
- (BOOL)shouldCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4;
- (CPLCKBatchUploadPlanner)planner;
- (CPLCKUnsharePlan)initWithPlanner:(id)a3;
- (CPLFingerprintContext)fingerprintContext;
- (NSArray)ckRecordIDsToUnshare;
- (NSArray)privateRecordIDs;
- (id)baseDestinationCKRecordForSourceCKRecord:(id)a3 destinationCKRecordID:(id)a4 error:(id *)a5;
- (id)ckRecordIDsToDelete;
- (id)ckRecordsToUpdate;
- (id)cloudKitScopeForScopeIdentifier:(id)a3;
- (id)finalizedDestinationCKRecordFromProposedCKRecord:(id)a3 error:(id *)a4;
- (id)recordNameInDestinationCKRecordFromRecordName:(id)a3 error:(id *)a4;
- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3;
- (id)scopeIdentifierFromZoneID:(id)a3;
- (id)scopedIdentifierForCKRecordID:(id)a3;
- (id)zoneIDFromScopeIdentifier:(id)a3;
- (unint64_t)count;
- (void)_prepareRecordsToDelete;
- (void)addShareTodo:(id)a3;
- (void)prepareCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4;
- (void)removeShareTodoForScopedIdentifier:(id)a3;
- (void)setPlanner:(id)a3;
- (void)updateTargetMappingAfterUploadWithRealSourceRecordIDs:(id)a3;
@end

@implementation CPLCKUnsharePlan

- (CPLFingerprintContext)fingerprintContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_planner);
  v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained fingerprintContext]);

  return (CPLFingerprintContext *)v3;
}

- (CPLCKUnsharePlan)initWithPlanner:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CPLCKUnsharePlan;
  v5 = -[CPLCKUnsharePlan init](&v12, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_planner, v4);
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    todos = v6->_todos;
    v6->_todos = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    todoPerScopedIdentifier = v6->_todoPerScopedIdentifier;
    v6->_todoPerScopedIdentifier = v9;
  }

  return v6;
}

- (void)addShareTodo:(id)a3
{
  todos = self->_todos;
  v6 = a3;
  -[NSMutableArray addObject:](todos, "addObject:", v6);
  if (v6) {
    uint64_t v5 = v6[1];
  }
  else {
    uint64_t v5 = 0LL;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_todoPerScopedIdentifier,  "setObject:forKeyedSubscript:",  v6,  v5);
}

- (BOOL)hasShareTodoForScopedIdentifier:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_todoPerScopedIdentifier,  "objectForKeyedSubscript:",  a3));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (void)removeShareTodoForScopedIdentifier:(id)a3
{
  id v4 = a3;
  -[NSMutableDictionary removeObjectForKey:](self->_todoPerScopedIdentifier, "removeObjectForKey:", v4);
  todos = self->_todos;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100038E7C;
  v8[3] = &unk_10023F690;
  id v7 = v4;
  id v9 = v7;
  id v6 = -[NSMutableArray indexOfObjectPassingTest:](todos, "indexOfObjectPassingTest:", v8);
  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL) {
    -[NSMutableArray removeObjectAtIndex:](self->_todos, "removeObjectAtIndex:", v6);
  }
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableArray count](self->_todos, "count");
}

- (NSArray)ckRecordIDsToUnshare
{
  v3 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_todos, "count"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = self->_todos;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)v8);
        if (v9) {
          uint64_t v10 = *(void *)(v9 + 32);
        }
        else {
          uint64_t v10 = 0LL;
        }
        -[NSMutableArray addObject:](v3, "addObject:", v10, (void)v13);
        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      id v6 = v11;
    }

    while (v11);
  }

  return (NSArray *)v3;
}

- (void)_prepareRecordsToDelete
{
  if (!self->_ckRecordsToUpdate)
  {
    v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_planner);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained sharedZoneIdentification]);

    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    v21 = self;
    id v6 = self->_todos;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v10);
          if (v11)
          {
            uint64_t v12 = v11[2];
            id v11 = (void *)v11[4];
          }

          else
          {
            uint64_t v12 = 0LL;
          }

          __int128 v13 = v11;
          if ([v5 supportsDirectDeletionOfRecordClass:v12])
          {
            -[NSMutableArray addObject:](v3, "addObject:", v13);
          }

          else if ([v5 supportsDeletionOfRecordClass:v12])
          {
            __int128 v14 = CPLCKRecord(v12, v13, 1);
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
            __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
            [v15 setObject:v16 forKey:@"recordModificationDate"];

            [v15 setObject:&__kCFBooleanTrue forKey:@"isDeleted"];
            [v15 setObject:&__kCFBooleanTrue forKey:@"isExpunged"];
            -[NSMutableArray addObject:](v22, "addObject:", v15);
          }

          uint64_t v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
        id v8 = v17;
      }

      while (v17);
    }

    ckRecordsToUpdate = v21->_ckRecordsToUpdate;
    v21->_ckRecordsToUpdate = &v22->super;
    v19 = v22;

    ckRecordIDsToDelete = v21->_ckRecordIDsToDelete;
    v21->_ckRecordIDsToDelete = &v3->super;
  }

- (id)ckRecordsToUpdate
{
  return self->_ckRecordsToUpdate;
}

- (id)ckRecordIDsToDelete
{
  return self->_ckRecordIDsToDelete;
}

- (void)updateTargetMappingAfterUploadWithRealSourceRecordIDs:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_planner);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained targetMapping]);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = self->_todos;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10);
        if (v11)
        {
          id v12 = *(id *)(v11 + 56);
          if (v12)
          {
            __int128 v13 = v12;
            objc_msgSend(v5, "setTarget:forRecordWithScopedIdentifier:", v12, *(void *)(v11 + 8), (void)v14);
          }
        }

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v8);
  }
}

- (NSArray)privateRecordIDs
{
  v3 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_todos, "count"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = self->_todos;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)v8);
        if (v9) {
          uint64_t v10 = *(void *)(v9 + 24);
        }
        else {
          uint64_t v10 = 0LL;
        }
        -[NSMutableArray addObject:](v3, "addObject:", v10, (void)v13);
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      id v6 = v11;
    }

    while (v11);
  }

  return (NSArray *)v3;
}

- (BOOL)shouldCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4
{
  return 1;
}

- (void)prepareCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4
{
  id v19 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_planner);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained scopedIdentifierForCKRecordID:v19]);

  if (!v9)
  {
    sub_100190CA4(v19, a2, self);
LABEL_6:
    if (!_CPLSilentLogging)
    {
      id v15 = sub_100032740();
      __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v21 = v19;
        __int16 v22 = 2112;
        __int128 v23 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Unable to find unshare todo matching %@/%@",  buf,  0x16u);
      }
    }

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit /CPLCKBatchUploadPlanner.m"));
    [v17 handleFailureInMethod:a2, self, v18, 1609, @"Unable to find unshare todo matching %@/%@", v19, v9 object file lineNumber description];

    abort();
  }

  uint64_t v10 = (CPLCKShareRecordTodo *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_todoPerScopedIdentifier,  "objectForKeyedSubscript:",  v9));
  currentTodo = self->_currentTodo;
  self->_currentTodo = v10;

  if (!self->_currentTodo) {
    goto LABEL_6;
  }
  id v12 = objc_loadWeakRetained((id *)&self->_planner);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 targetMapping]);
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 targetForRecordWithScopedIdentifier:v9]);

  if (!v14) {
    sub_100190D78(v9, a2, self);
  }
  self->_wasSplit = [v14 targetState] == (id)3;
}

- (id)baseDestinationCKRecordForSourceCKRecord:(id)a3 destinationCKRecordID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  p_planner = &self->_planner;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_planner);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained currentUserRecordID]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v7,  "cpl_destinationRecordIDInPrivateScopeWithCurrentUserRecordID:proposedDestinationRecordID:",  v11,  v8));

  if (([v12 isEqual:v8] & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      id v13 = sub_100032740();
      __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 recordID]);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 cplFullDescription]);
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v12 cplFullDescription]);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v8 cplFullDescription]);
        *(_DWORD *)buf = 138412802;
        v43 = v16;
        __int16 v44 = 2112;
        v45 = v17;
        __int16 v46 = 2112;
        v47 = v18;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Moving %@ to %@ instead of %@", buf, 0x20u);
      }
    }

    id v19 = objc_loadWeakRetained((id *)&self->_planner);
    v20 = v19;
    currentTodo = self->_currentTodo;
    if (currentTodo) {
      scopedIdentifier = currentTodo->_scopedIdentifier;
    }
    else {
      scopedIdentifier = 0LL;
    }
    [v19 _willUpdateCKRecordWithID:v12 onBehalfOfRecordWithScopedIdentifier:scopedIdentifier];

    sub_100037B74((uint64_t)self->_currentTodo, v12);
  }

  __int128 v23 = objc_alloc(&OBJC_CLASS___CPLScopedIdentifier);
  id v24 = objc_loadWeakRetained((id *)p_planner);
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 destinationZoneIdentification]);
  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 scopeIdentifier]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v7 recordID]);
  v41 = v8;
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 recordName]);
  v29 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](v23, "initWithScopeIdentifier:identifier:", v26, v28);

  v30 = objc_alloc(&OBJC_CLASS___CPLScopedIdentifier);
  id v31 = objc_loadWeakRetained((id *)p_planner);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v31 sharedZoneIdentification]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 scopeIdentifier]);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v12 recordName]);
  v35 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](v30, "initWithScopeIdentifier:identifier:", v33, v34);

  v36 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:]( objc_alloc(&OBJC_CLASS___CPLRecordTarget),  "initWithScopedIdentifier:otherScopedIdentifier:targetState:",  v29,  v35,  1LL);
  sub_100037B94((uint64_t)self->_currentTodo, v36);

  v37 = objc_alloc(&OBJC_CLASS___CKRecord);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v7 recordType]);
  v39 = -[CKRecord initWithRecordType:recordID:](v37, "initWithRecordType:recordID:", v38, v12);

  return v39;
}

- (BOOL)shouldCopyCKRecordKeyToDestinationCKRecord:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"dateExpunged"])
  {
    LOBYTE(v5) = 1;
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_planner);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained propertyMapping]);

    currentTodo = self->_currentTodo;
    if (currentTodo) {
      Class recordClass = currentTodo->_recordClass;
    }
    else {
      Class recordClass = 0LL;
    }
    if ([v7 isKeyReadOnly:v4 recordClass:recordClass])
    {
      LOBYTE(v5) = 0;
    }

    else if (self->_wasSplit {
           && ((uint64_t v10 = self->_currentTodo) == 0LL ? (v11 = 0LL) : (v11 = v10->_recordClass),
    }
               ([v7 shouldUpdateKeyOnBothRecords:v4 recordClass:v11] & 1) == 0))
    {
      id v12 = self->_currentTodo;
      if (v12) {
        Class v13 = v12->_recordClass;
      }
      else {
        Class v13 = 0LL;
      }
      unsigned int v5 = [v7 shouldUpdateKeyOnPrivateRecord:v4 recordClass:v13] ^ 1;
    }

    else
    {
      LOBYTE(v5) = 1;
    }
  }

  return v5;
}

- (id)recordNameInDestinationCKRecordFromRecordName:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc(&OBJC_CLASS___CPLScopedIdentifier);
  p_planner = &self->_planner;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_planner);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained sharedZoneIdentification]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 scopeIdentifier]);
  Class v11 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](v6, "initWithScopeIdentifier:identifier:", v10, v5);

  id v12 = objc_loadWeakRetained((id *)p_planner);
  Class v13 = (void *)objc_claimAutoreleasedReturnValue([v12 targetMapping]);
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 targetForRecordWithOtherScopedIdentifier:v11]);

  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 otherScopedIdentifier]);
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 identifier]);
    __int128 v17 = (void *)v16;
    if (v16) {
      v18 = (void *)v16;
    }
    else {
      v18 = v5;
    }
    id v19 = v18;
  }

  else
  {
    id v19 = v5;
  }

  return v19;
}

- (id)finalizedDestinationCKRecordFromProposedCKRecord:(id)a3 error:(id *)a4
{
  id v5 = a3;
  currentTodo = self->_currentTodo;
  if (!currentTodo || (id v7 = currentTodo->_recordModificationDate) == 0LL) {
    id v7 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }
  [v5 setObject:v7 forKey:@"recordModificationDate"];
  [v5 setObject:0 forKey:@"linkedShareZoneName"];
  [v5 setObject:0 forKey:@"linkedShareZoneOwner"];
  [v5 setObject:0 forKey:@"linkedShareRecordName"];
  if (self->_wasSplit && ([v5 isKnownToServer] & 1) == 0)
  {
    [v5 setKnownToServer:1];
    [v5 setEtag:@"-gateon"];
  }

  return v5;
}

- (id)cloudKitScopeForScopeIdentifier:(id)a3
{
  p_planner = &self->_planner;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_planner);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained cloudKitScopeForScopeIdentifier:v4]);

  return v6;
}

- (id)zoneIDFromScopeIdentifier:(id)a3
{
  p_planner = &self->_planner;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_planner);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained zoneIDFromScopeIdentifier:v4]);

  return v6;
}

- (id)scopeIdentifierFromZoneID:(id)a3
{
  p_planner = &self->_planner;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_planner);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained scopeIdentifierFromZoneID:v4]);

  return v6;
}

- (id)scopedIdentifierForCKRecordID:(id)a3
{
  p_planner = &self->_planner;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_planner);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained scopedIdentifierForCKRecordID:v4]);

  return v6;
}

- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3
{
  p_planner = &self->_planner;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_planner);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained rejectedScopedIdentifierForRejectedCKRecordID:v4]);

  return v6;
}

- (CPLCKBatchUploadPlanner)planner
{
  return (CPLCKBatchUploadPlanner *)objc_loadWeakRetained((id *)&self->_planner);
}

- (void)setPlanner:(id)a3
{
}

- (void).cxx_destruct
{
}

@end