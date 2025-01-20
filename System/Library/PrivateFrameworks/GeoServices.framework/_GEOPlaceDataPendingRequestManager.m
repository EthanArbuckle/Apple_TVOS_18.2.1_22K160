@interface _GEOPlaceDataPendingRequestManager
- (_GEOPlaceDataPendingRequestManager)init;
- (id)_finished:(id)a3 withResult:(id)a4 error:(id)a5;
- (id)identifiersRequested:(id)a3 forHandler:(id)a4;
- (void)_cleanUpFinishedHandlers:(id)a3;
- (void)_failAllPendingRequests;
- (void)didResolveItems:(id)a3 forIdentifiers:(id)a4;
- (void)failedToResolveIdentifiers:(id)a3 withError:(id)a4;
- (void)willUpdateExpiredIdentifiers:(id)a3;
@end

@implementation _GEOPlaceDataPendingRequestManager

- (_GEOPlaceDataPendingRequestManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____GEOPlaceDataPendingRequestManager;
  v2 = -[_GEOPlaceDataPendingRequestManager init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    requestHandlersPending = v2->_requestHandlersPending;
    v2->_requestHandlersPending = (NSMutableDictionary *)v3;
  }

  return v2;
}

- (void)willUpdateExpiredIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[_GEOPlaceDataRequestHelper helperExpiredIdentifiers:]( &OBJC_CLASS____GEOPlaceDataRequestHelper,  "helperExpiredIdentifiers:",  v4));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_requestHandlersPending,  "objectForKeyedSubscript:",  v11,  (void)v13));
        if (!v12)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_requestHandlersPending,  "setObject:forKeyedSubscript:",  v12,  v11);
        }

        [v12 addObject:v5];
      }

      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }
}

- (id)identifiersRequested:(id)a3 forHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:", v6));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v6 count]));
  v20 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[_GEOPlaceDataRequestHelper helperForHandler:identifiers:]( &OBJC_CLASS____GEOPlaceDataRequestHelper,  "helperForHandler:identifiers:",  v7,  v6));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
        uint64_t v17 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_requestHandlersPending,  "objectForKeyedSubscript:",  v16));
        if (v17)
        {
          v18 = (void *)v17;
          [v9 addObject:v16];
        }

        else
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_requestHandlersPending,  "setObject:forKeyedSubscript:",  v18,  v16);
        }

        [v18 addObject:v10];
      }

      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v13);
  }

  return v9;
}

- (id)_finished:(id)a3 withResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_requestHandlersPending,  "objectForKeyedSubscript:",  v8));
    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_100033768;
      v25[3] = &unk_10005A900;
      id v26 = v8;
      id v27 = v9;
      id v28 = v10;
      id v13 = v12;
      id v29 = v13;
      [v11 enumerateObjectsUsingBlock:v25];
      uint64_t v14 = v29;
      id v15 = v13;
    }

    else
    {
      BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
      if (v17) {
        sub_10003AF3C(v17, v18, v19, v20, v21, v22, v23, v24);
      }
      id v15 = &__NSArray0__struct;
    }
  }

  else
  {
    id v15 = &__NSArray0__struct;
  }

  return v15;
}

- (void)_cleanUpFinishedHandlers:(id)a3
{
  id v4 = a3;
  if ([v4 count] && -[NSMutableDictionary count](self->_requestHandlersPending, "count"))
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_requestHandlersPending, "allKeys", 0LL));
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)i);
          id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_requestHandlersPending,  "objectForKeyedSubscript:",  v10));
          [v11 removeObjectsInArray:v4];
          if (![v11 count]) {
            -[NSMutableDictionary removeObjectForKey:](self->_requestHandlersPending, "removeObjectForKey:", v10);
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v7);
    }
  }
}

- (void)didResolveItems:(id)a3 forIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [v6 count];
    id v9 = [v7 count];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    if (v8 == v9) {
      id v11 = 0LL;
    }
    else {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet"));
    }
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_100033C2C;
    v33[3] = &unk_10005A928;
    BOOL v38 = v8 == v9;
    id v12 = v7;
    id v34 = v12;
    id v13 = v11;
    id v35 = v13;
    id v14 = v10;
    id v36 = v14;
    v37 = self;
    [v6 enumerateObjectsUsingBlock:v33];
    -[_GEOPlaceDataPendingRequestManager _cleanUpFinishedHandlers:](self, "_cleanUpFinishedHandlers:", v14);
    if (v8 != v9)
    {
      id v15 = [v13 count];
      if (v15 != [v12 count])
      {
        id v16 = [v12 mutableCopy];
        [v16 removeObjectsAtIndexes:v13];
        uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "componentsJoinedByString:", @", "));
          *(_DWORD *)buf = 138543362;
          v40 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "[For MUID] Server error fetching muids: %{public}@",  buf,  0xCu);
        }

        BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
        if (v20) {
          sub_10003AF70(v20, v21, v22, v23, v24, v25, v26, v27);
        }
        if ([v6 count]) {
          id v28 = 0LL;
        }
        else {
          id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -7LL,  @"failed to return all requested ids"));
        }
        id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v16));
        -[_GEOPlaceDataPendingRequestManager failedToResolveIdentifiers:withError:]( self,  "failedToResolveIdentifiers:withError:",  v29,  v28);
      }
    }

    uint64_t v30 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_requestHandlersPending, "allKeys"));
      *(_DWORD *)buf = 138477827;
      v40 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "Remaining requests in progress: %{private}@",  buf,  0xCu);
    }
  }
}

- (void)failedToResolveIdentifiers:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        id v13 = 0LL;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = (void *)objc_claimAutoreleasedReturnValue( -[_GEOPlaceDataPendingRequestManager _finished:withResult:error:]( self,  "_finished:withResult:error:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)v13),  0LL,  v7,  (void)v18));
          [v8 addObjectsFromArray:v14];

          id v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }

      while (v11);
    }

    -[_GEOPlaceDataPendingRequestManager _cleanUpFinishedHandlers:](self, "_cleanUpFinishedHandlers:", v8);
    uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_requestHandlersPending, "allKeys"));
      *(_DWORD *)buf = 138477827;
      uint64_t v23 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "Remaining requests in progress: %{private}@",  buf,  0xCu);
    }
  }
}

- (void)_failAllPendingRequests
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_requestHandlersPending, "allValues"));
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObjectsFromArray:*(void *)(*((void *)&v21 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v21 objects:v28 count:16];
    }

    while (v6);
  }

  -[NSMutableDictionary removeAllObjects](self->_requestHandlersPending, "removeAllObjects");
  if ([v3 count])
  {
    uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      unsigned int v11 = [v3 count];
      *(_DWORD *)buf = 67109120;
      unsigned int v27 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Found %d request helpers that should have finished by now",  buf,  8u);
    }

    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v12 = v3;
    id v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        id v16 = 0LL;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v16), "failAllRemainingRequests", (void)v17);
          id v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }

      while (v14);
    }
  }
}

- (void).cxx_destruct
{
}

@end