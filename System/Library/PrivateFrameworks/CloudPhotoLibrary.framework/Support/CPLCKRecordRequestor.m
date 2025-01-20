@interface CPLCKRecordRequestor
- (BOOL)needsRequestedRecords;
- (BOOL)processedFetchedRequestedRecordsWithError:(id *)a3;
- (CPLCKRecordFetchCache)fetchCache;
- (CPLCKRecordRequestor)initWithFetchCache:(id)a3 scopeProvider:(id)a4;
- (CPLCloudKitScopeProvider)scopeProvider;
- (NSArray)requestedRecordIDs;
- (void)_fetchRecordsForNextOperationTypeInEnumerator:(id)a3 task:(id)a4 completionHandler:(id)a5;
- (void)fetchRequestedRecordsForTransportTask:(id)a3 completionHandler:(id)a4;
- (void)requestRecordWithRecordID:(id)a3 operationType:(int64_t)a4 forRecordWithRecordID:(id)a5 completionHandler:(id)a6;
@end

@implementation CPLCKRecordRequestor

- (CPLCKRecordRequestor)initWithFetchCache:(id)a3 scopeProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CPLCKRecordRequestor;
  v8 = -[CPLCKRecordRequestor init](&v12, "init");
  if (v8)
  {
    if (v6) {
      v9 = (CPLCKRecordFetchCache *)v6;
    }
    else {
      v9 = objc_alloc_init(&OBJC_CLASS___CPLCKRecordFetchCache);
    }
    fetchCache = v8->_fetchCache;
    v8->_fetchCache = v9;

    objc_storeStrong((id *)&v8->_scopeProvider, a4);
  }

  return v8;
}

- (void)requestRecordWithRecordID:(id)a3 operationType:(int64_t)a4 forRecordWithRecordID:(id)a5 completionHandler:(id)a6
{
  id v25 = a3;
  id v10 = a5;
  id v11 = a6;
  requestedRecordIDs = self->_requestedRecordIDs;
  if (!requestedRecordIDs)
  {
    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v14 = self->_requestedRecordIDs;
    self->_requestedRecordIDs = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    requests = self->_requests;
    self->_requests = v15;

    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    requestedRecordIDsPerOperationType = self->_requestedRecordIDsPerOperationType;
    self->_requestedRecordIDsPerOperationType = v17;

    requestedRecordIDs = self->_requestedRecordIDs;
  }

  -[NSMutableSet addObject:](requestedRecordIDs, "addObject:", v25);
  v19 = sub_10009A258((id *)objc_alloc(&OBJC_CLASS___CPLCKRecordRequest), v25, v10, v11);
  -[NSMutableArray addObject:](self->_requests, "addObject:", v19);
  v20 = self->_requestedRecordIDsPerOperationType;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  v22 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", v21));

  if (!v22)
  {
    v22 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v23 = self->_requestedRecordIDsPerOperationType;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v22, v24);
  }

  -[NSMutableSet addObject:](v22, "addObject:", v25);
}

- (BOOL)needsRequestedRecords
{
  return -[NSMutableSet count](self->_requestedRecordIDs, "count") != 0LL;
}

- (void)_fetchRecordsForNextOperationTypeInEnumerator:(id)a3 task:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 nextObject]);
  if (v11)
  {
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_requestedRecordIDsPerOperationType,  "objectForKeyedSubscript:",  v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allObjects]);

    id v14 = [v11 integerValue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10009A478;
    v15[3] = &unk_1002421A8;
    id v19 = v10;
    id v16 = v9;
    v17 = self;
    id v18 = v8;
    [v16 fetchRecordsWithIDs:v13 fetchResources:0 wantsAllRecords:0 type:v14 completionHandler:v15];
  }

  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0LL);
  }
}

- (void)fetchRequestedRecordsForTransportTask:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  requestedRecordIDsPerOperationType = self->_requestedRecordIDsPerOperationType;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keyEnumerator](requestedRecordIDsPerOperationType, "keyEnumerator"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10009A610;
  v11[3] = &unk_10023E458;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  -[CPLCKRecordRequestor _fetchRecordsForNextOperationTypeInEnumerator:task:completionHandler:]( self,  "_fetchRecordsForNextOperationTypeInEnumerator:task:completionHandler:",  v9,  v8,  v11);
}

- (NSArray)requestedRecordIDs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_requestedRecordIDs, "allObjects"));
  v3 = v2;
  if (!v2) {
    v2 = &__NSArray0__struct;
  }
  v4 = v2;

  return v4;
}

- (BOOL)processedFetchedRequestedRecordsWithError:(id *)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  obj = self->_requests;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v33,  v47,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v34;
    id v8 = v4;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)v9);
        if (v10) {
          id v11 = *(void **)(v10 + 24);
        }
        else {
          id v11 = 0LL;
        }
        id v12 = (uint64_t (*)(void))v11[2];
        v13 = v11;
        char v14 = v12();
        v15 = (__CFString *)0LL;

        if ((v14 & 1) == 0)
        {
          if (v10) {
            id v16 = *(void **)(v10 + 16);
          }
          else {
            id v16 = 0LL;
          }
          scopeProvider = self->_scopeProvider;
          id v18 = v16;
          id v19 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitScopeProvider rejectedScopedIdentifierForRejectedCKRecordID:]( scopeProvider,  "rejectedScopedIdentifierForRejectedCKRecordID:",  v18));

          v4 = v8;
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v19));

          if (!v20)
          {
            if (!v15) {
              v15 = @"processing requested record failed";
            }
            if (!_CPLSilentLogging)
            {
              uint64_t v22 = __CPLGenericOSLogDomain(v21);
              v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                if (v10)
                {
                  id v24 = *(id *)(v10 + 8);
                  uint64_t v25 = *(void *)(v10 + 16);
                }

                else
                {
                  id v24 = 0LL;
                  uint64_t v25 = 0LL;
                }

                *(_DWORD *)buf = 138413058;
                id v40 = v24;
                __int16 v41 = 2112;
                uint64_t v42 = v25;
                __int16 v43 = 2112;
                v44 = v19;
                __int16 v45 = 2114;
                v46 = v15;
                _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Processing requested record %@ for %@ (on behalf of %@) was rejected: %{public}@",  buf,  0x2Au);
              }

              v4 = v8;
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v15, v19);
          }
        }

        id v9 = (char *)v9 + 1;
      }

      while (v6 != v9);
      id v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v33,  v47,  16LL);
      id v6 = v26;
    }

    while (v26);
  }

  id v27 = -[NSMutableDictionary count](v4, "count");
  if (v27)
  {
    uint64_t v37 = CPLErrorRejectedRecordIdentifiersAndReasonsKey;
    v38 = v4;
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:underlyingError:userInfo:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:underlyingError:userInfo:description:",  18LL,  0LL,  v28,  @"Rejecting some records because of bad or missing requested records"));

    if (a3) {
      *a3 = v29;
    }
  }

  return v27 == 0LL;
}

- (CPLCKRecordFetchCache)fetchCache
{
  return self->_fetchCache;
}

- (CPLCloudKitScopeProvider)scopeProvider
{
  return self->_scopeProvider;
}

- (void).cxx_destruct
{
}

@end