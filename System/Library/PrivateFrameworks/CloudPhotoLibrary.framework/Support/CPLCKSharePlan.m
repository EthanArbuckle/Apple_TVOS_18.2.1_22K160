@interface CPLCKSharePlan
- (BOOL)hasShareTodoForScopedIdentifier:(id)a3;
- (BOOL)shouldCopyCKRecordKeyToDestinationCKRecord:(id)a3;
- (BOOL)shouldCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4;
- (CPLCKBatchUploadPlanner)planner;
- (CPLCKSharePlan)initWithPlanner:(id)a3;
- (CPLFingerprintContext)fingerprintContext;
- (NSArray)ckRecordIDsToShare;
- (NSArray)sharedCKRecordIDs;
- (id)baseDestinationCKRecordForSourceCKRecord:(id)a3 destinationCKRecordID:(id)a4 error:(id *)a5;
- (id)cloudKitScopeForScopeIdentifier:(id)a3;
- (id)finalizedDestinationCKRecordFromProposedCKRecord:(id)a3 error:(id *)a4;
- (id)recordNameInDestinationCKRecordFromRecordName:(id)a3 error:(id *)a4;
- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3;
- (id)scopeIdentifierFromZoneID:(id)a3;
- (id)scopedIdentifierForCKRecordID:(id)a3;
- (id)zoneIDFromScopeIdentifier:(id)a3;
- (unint64_t)count;
- (void)addShareTodo:(id)a3;
- (void)prepareCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4;
- (void)setPlanner:(id)a3;
- (void)updateTargetMappingAfterUploadWithRealSourceRecordIDs:(id)a3;
@end

@implementation CPLCKSharePlan

- (CPLFingerprintContext)fingerprintContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_planner);
  v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained fingerprintContext]);

  return (CPLFingerprintContext *)v3;
}

- (CPLCKSharePlan)initWithPlanner:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CPLCKSharePlan;
  v5 = -[CPLCKSharePlan init](&v12, "init");
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

- (unint64_t)count
{
  return (unint64_t)-[NSMutableArray count](self->_todos, "count");
}

- (NSArray)ckRecordIDsToShare
{
  v3 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_todos, "count"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  BOOL v4 = self->_todos;
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
          uint64_t v10 = *(void *)(v9 + 24);
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

- (NSArray)sharedCKRecordIDs
{
  v3 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_todos, "count"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  BOOL v4 = self->_todos;
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
          uint64_t v10 = *(void *)(v9 + 32);
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
  id v16 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_planner);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained scopedIdentifierForCKRecordID:v16]);

  if (!v9)
  {
    sub_100190BD0(v16, a2, self);
LABEL_5:
    if (!_CPLSilentLogging)
    {
      id v12 = sub_100032740();
      __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v18 = v16;
        __int16 v19 = 2112;
        v20 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Unable to find share todo matching %@/%@",  buf,  0x16u);
      }
    }

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit /CPLCKBatchUploadPlanner.m"));
    [v14 handleFailureInMethod:a2, self, v15, 1378, @"Unable to find share todo matching %@/%@", v16, v9 object file lineNumber description];

    abort();
  }

  uint64_t v10 = (CPLCKShareRecordTodo *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_todoPerScopedIdentifier,  "objectForKeyedSubscript:",  v9));
  currentTodo = self->_currentTodo;
  self->_currentTodo = v10;

  if (!self->_currentTodo) {
    goto LABEL_5;
  }
}

- (id)baseDestinationCKRecordForSourceCKRecord:(id)a3 destinationCKRecordID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_alloc(&OBJC_CLASS___CKRecordID);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 recordID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 recordName]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);

  __int128 v13 = -[CKRecordID initWithRecordName:zoneID:](v9, "initWithRecordName:zoneID:", v11, v12);
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID recordName](v13, "recordName"));
  currentTodo = self->_currentTodo;
  if (currentTodo) {
    sharedRecordID = currentTodo->_sharedRecordID;
  }
  else {
    sharedRecordID = 0LL;
  }
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID recordName](sharedRecordID, "recordName"));
  unsigned __int8 v18 = [v14 isEqual:v17];

  if ((v18 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_planner);
    v20 = WeakRetained;
    v21 = self->_currentTodo;
    if (v21) {
      scopedIdentifier = v21->_scopedIdentifier;
    }
    else {
      scopedIdentifier = 0LL;
    }
    [WeakRetained _willUpdateCKRecordWithID:v13 onBehalfOfRecordWithScopedIdentifier:scopedIdentifier];

    sub_100037B84((uint64_t)self->_currentTodo, v13);
  }

  v23 = objc_alloc(&OBJC_CLASS___CPLScopedIdentifier);
  id v24 = objc_loadWeakRetained((id *)&self->_planner);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 destinationZoneIdentification]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 scopeIdentifier]);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID recordName](v13, "recordName"));
  v41 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](v23, "initWithScopeIdentifier:identifier:", v26, v27);

  v28 = objc_alloc(&OBJC_CLASS___CPLScopedIdentifier);
  id v29 = objc_loadWeakRetained((id *)&self->_planner);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 sharedZoneIdentification]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 scopeIdentifier]);
  v32 = v7;
  v33 = (void *)objc_claimAutoreleasedReturnValue([v7 recordID]);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 recordName]);
  v35 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](v28, "initWithScopeIdentifier:identifier:", v31, v34);

  v36 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:]( objc_alloc(&OBJC_CLASS___CPLRecordTarget),  "initWithScopedIdentifier:otherScopedIdentifier:targetState:",  v41,  v35,  3LL);
  sub_100037B94((uint64_t)self->_currentTodo, v36);

  v37 = objc_alloc(&OBJC_CLASS___CKRecord);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v32 recordType]);
  v39 = -[CKRecord initWithRecordType:recordID:](v37, "initWithRecordType:recordID:", v38, v13);

  return v39;
}

- (BOOL)shouldCopyCKRecordKeyToDestinationCKRecord:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"dateExpunged"])
  {
    unsigned __int8 v5 = 1;
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
      unsigned __int8 v5 = 0;
    }

    else
    {
      uint64_t v10 = self->_currentTodo;
      if (v10) {
        Class v11 = v10->_recordClass;
      }
      else {
        Class v11 = 0LL;
      }
      unsigned __int8 v5 = [v7 shouldUpdateKeyOnSharedRecord:v4 recordClass:v11];
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
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained destinationZoneIdentification]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 scopeIdentifier]);
  Class v11 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](v6, "initWithScopeIdentifier:identifier:", v10, v5);

  id v12 = objc_loadWeakRetained((id *)p_planner);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 targetMapping]);
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 targetForRecordWithScopedIdentifier:v11]);

  if (v14)
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 otherScopedIdentifier]);
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 identifier]);
    __int128 v17 = (void *)v16;
    if (v16) {
      unsigned __int8 v18 = (void *)v16;
    }
    else {
      unsigned __int8 v18 = v5;
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
  id v8 = self->_currentTodo;
  if (v8) {
    id v8 = (CPLCKShareRecordTodo *)v8->_proposedContributorUserIdentifiers;
  }
  uint64_t v9 = v8;
  if (-[CPLCKShareRecordTodo count](v9, "count"))
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_100032740();
      Class v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 recordID]);
        int v27 = 138412546;
        v28 = v9;
        __int16 v29 = 2112;
        v30 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Updating proposedContributorUserIdentifiers %@ for %@",  (uint8_t *)&v27,  0x16u);
      }
    }

    objc_msgSend(v5, "cpl_updateContributorsOnSharedRecord:", v9);
  }

  __int128 v13 = self->_currentTodo;
  if (v13) {
    Class recordClass = v13->_recordClass;
  }
  else {
    Class recordClass = 0LL;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_planner);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained sharedZoneIdentification]);

  if (([v16 supportsDirectDeletionOfRecordClass:recordClass] & 1) == 0)
  {
    [v5 setObject:&__kCFBooleanFalse forKey:@"isExpunged"];
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"isDeleted"]);

    if (!v17) {
      [v5 setObject:&__kCFBooleanFalse forKey:@"isDeleted"];
    }
    if (-[objc_class isSubclassOfClass:]( recordClass,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___CPLAssetChange))) {
      [v5 setObject:v7 forKey:@"mostRecentAddedDate"];
    }
  }

  if (-[objc_class supportsSharingScopedIdentifier](recordClass, "supportsSharingScopedIdentifier"))
  {
    [v5 setObject:0 forKey:@"linkedShareZoneName"];
    [v5 setObject:0 forKey:@"linkedShareZoneOwner"];
    [v5 setObject:0 forKey:@"linkedShareRecordName"];
  }

  unsigned __int8 v18 = self->_currentTodo;
  if (v18) {
    Class v19 = v18->_recordClass;
  }
  else {
    Class v19 = 0LL;
  }
  if (-[objc_class isSubclassOfClass:]( v19,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___CPLMasterChange)))
  {
    id v20 = objc_loadWeakRetained((id *)&self->_planner);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 targetMapping]);
    v22 = v21;
    v23 = self->_currentTodo;
    if (v23) {
      scopedIdentifier = v23->_scopedIdentifier;
    }
    else {
      scopedIdentifier = 0LL;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue([v21 targetForRecordWithScopedIdentifier:scopedIdentifier]);

    if (v25 && [v25 shouldUploadToOtherRecord])
    {
      [v5 setKnownToServer:1];
      [v5 setEtag:@"-gateon"];
    }
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