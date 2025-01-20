@interface CPLCloudKitUpdateContributorsTask
- (CPLCloudKitUpdateContributorsTask)initWithController:(id)a3 sharedScope:(id)a4 contributorsUpdates:(id)a5 transportScopeMapping:(id)a6 completionHandler:(id)a7;
- (CPLEngineScope)sharedScope;
- (NSArray)contributorsUpdates;
- (id)_computeUpdatedSharedCKRecordsFromFoundRecord:(id)a3 usingUpdates:(id)a4 error:(id *)a5;
- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3;
- (void)_updateCKRecordsInSharedScope:(id)a3;
- (void)runOperations;
@end

@implementation CPLCloudKitUpdateContributorsTask

- (CPLCloudKitUpdateContributorsTask)initWithController:(id)a3 sharedScope:(id)a4 contributorsUpdates:(id)a5 transportScopeMapping:(id)a6 completionHandler:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___CPLCloudKitUpdateContributorsTask;
  v17 = -[CPLCloudKitTransportTask initWithController:](&v23, "initWithController:", a3);
  if (v17)
  {
    v18 = (NSArray *)[v14 copy];
    contributorsUpdates = v17->_contributorsUpdates;
    v17->_contributorsUpdates = v18;

    id v20 = [v16 copy];
    id completionHandler = v17->_completionHandler;
    v17->_id completionHandler = v20;

    objc_storeStrong((id *)&v17->_sharedScope, a4);
    -[CPLCloudKitTransportTask setTransportScopeMapping:](v17, "setTransportScopeMapping:", v15);
  }

  return v17;
}

- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_scopedIdentifiersFromCKRecordID,  "objectForKeyedSubscript:",  v4));
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }

  else
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___CPLCloudKitUpdateContributorsTask;
    id v8 = -[CPLCloudKitTransportTask rejectedScopedIdentifierForRejectedCKRecordID:]( &v11,  "rejectedScopedIdentifierForRejectedCKRecordID:",  v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue(v8);
  }

  v9 = v7;

  return v9;
}

- (void)_updateCKRecordsInSharedScope:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v16 = 0LL;
    unsigned __int8 v5 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v16);
    id v6 = v16;
    if ((v5 & 1) == 0) {
      (*((void (**)(void))self->_completionHandler + 2))();
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](self->_sharedScope, "scopeIdentifier"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask cloudKitScopeForScopeIdentifier:]( self,  "cloudKitScopeForScopeIdentifier:",  v7));

    if (v8)
    {
      v9 = -[CKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]( objc_alloc(&OBJC_CLASS___CKModifyRecordsOperation),  "initWithRecordsToSave:recordIDsToDelete:",  v4,  0LL);
      -[CKModifyRecordsOperation setSavePolicy:](v9, "setSavePolicy:", 0LL);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100098D94;
      v14[3] = &unk_100240B98;
      v14[4] = self;
      id v15 = v4;
      -[CKModifyRecordsOperation setModifyRecordsCompletionBlock:](v9, "setModifyRecordsCompletionBlock:", v14);
      -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v9,  CPLCloudKitOperationTypeForScope(v8),  0LL);
    }

    else
    {
      if (!_CPLSilentLogging)
      {
        id v10 = sub_1000955C4();
        objc_super v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          sharedScope = self->_sharedScope;
          *(_DWORD *)buf = 138412290;
          v18 = sharedScope;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Trying to update contributors on %@ but transport scope is missing",  buf,  0xCu);
        }
      }

      id completionHandler = (void (**)(id, CKModifyRecordsOperation *))self->_completionHandler;
      v9 = (CKModifyRecordsOperation *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  32LL,  @"Missing transport scope"));
      completionHandler[2](completionHandler, v9);
    }
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (id)_computeUpdatedSharedCKRecordsFromFoundRecord:(id)a3 usingUpdates:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v8 count]);
  objc_super v11 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v8 count]);
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = sub_100096794;
  v30 = sub_1000967A4;
  id v31 = 0LL;
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  id v20 = sub_1000992E0;
  v21 = &unk_1002420C0;
  id v12 = v8;
  id v22 = v12;
  v25 = &v26;
  id v13 = v11;
  objc_super v23 = v13;
  id v14 = v10;
  v24 = v14;
  [v9 enumerateKeysAndObjectsUsingBlock:&v18];
  id v15 = (void *)v27[5];
  if (v15)
  {
    id v16 = 0LL;
    if (a5) {
      *a5 = v15;
    }
  }

  else
  {
    objc_storeStrong((id *)&self->_scopedIdentifiersFromCKRecordID, v10);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v13, "allValues", v18, v19, v20, v21, v22, v23));
  }

  _Block_object_dispose(&v26, 8);
  return v16;
}

- (void)runOperations
{
  id v31 = 0LL;
  unsigned __int8 v3 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v31);
  id v4 = v31;
  unsigned __int8 v5 = v4;
  if ((v3 & 1) != 0)
  {
    id v24 = v4;
    id v6 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSArray count](self->_contributorsUpdates, "count"));
    id v7 = objc_alloc_init(&OBJC_CLASS___CPLRecordTargetMapping);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](self->_sharedScope, "scopeIdentifier"));
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    objc_super v23 = self;
    id v9 = self->_contributorsUpdates;
    id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
          id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "updateSharingContributorUserIdentifiers", v23));
          id v16 = [v15 count];

          if (v16)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue([v14 scopedIdentifier]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v14, v17);
            v18 = objc_alloc(&OBJC_CLASS___CPLScopedIdentifier);
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
            id v20 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:]( v18,  "initWithScopeIdentifier:identifier:",  v8,  v19);

            v21 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:]( objc_alloc(&OBJC_CLASS___CPLRecordTarget),  "initWithScopedIdentifier:otherScopedIdentifier:targetState:",  v17,  v20,  0LL);
            -[CPLRecordTargetMapping addKnownTarget:forRecordWithScopedIdentifier:]( v7,  "addKnownTarget:forRecordWithScopedIdentifier:",  v21,  v17);
          }
        }

        id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
      }

      while (v11);
    }

    if (-[NSMutableDictionary count](v6, "count"))
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v6, "allKeys"));
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1000999DC;
      v25[3] = &unk_100240BE8;
      v25[4] = v23;
      uint64_t v26 = v6;
      -[CPLCloudKitTransportTask fetchFullRecordsForScopedIdentifiers:targetMapping:completionHandler:]( v23,  "fetchFullRecordsForScopedIdentifiers:targetMapping:completionHandler:",  v22,  v7,  v25);
    }

    else
    {
      (*((void (**)(void))v23->_completionHandler + 2))();
    }

    unsigned __int8 v5 = v24;
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (NSArray)contributorsUpdates
{
  return self->_contributorsUpdates;
}

- (CPLEngineScope)sharedScope
{
  return self->_sharedScope;
}

- (void).cxx_destruct
{
}

@end