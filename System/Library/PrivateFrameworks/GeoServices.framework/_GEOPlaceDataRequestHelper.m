@interface _GEOPlaceDataRequestHelper
+ (id)helperExpiredIdentifiers:(id)a3;
+ (id)helperForHandler:(id)a3 identifiers:(id)a4;
- (BOOL)finishedIdentifier:(id)a3 withResult:(id)a4 error:(id)a5;
- (id)description;
- (void)failAllRemainingRequests;
@end

@implementation _GEOPlaceDataRequestHelper

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = objc_retainBlock(self->_requestHandler);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_identifierOrderMap, "allKeys"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p handler %p identifiers %@ remaning %@ results.count: %d",  v5,  self,  v6,  v7,  self->_remaningIdentifiers,  -[NSMutableArray count](self->_results, "count")));

  return v8;
}

+ (id)helperForHandler:(id)a3 identifiers:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(&OBJC_CLASS____GEOPlaceDataRequestHelper);
  if (v7)
  {
    id v8 = [v5 copy];
    id requestHandler = v7->_requestHandler;
    v7->_id requestHandler = v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v6));
    remaningIdentifiers = v7->_remaningIdentifiers;
    v7->_remaningIdentifiers = (NSMutableSet *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
    results = v7->_results;
    v7->_results = (NSMutableArray *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v6 count]));
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472LL;
    v22 = sub_100032DB8;
    v23 = &unk_10005A8B0;
    v15 = v7;
    v24 = v15;
    id v25 = v14;
    id v16 = v14;
    [v6 enumerateObjectsUsingBlock:&v20];
    v17 = (NSDictionary *)objc_msgSend(v16, "copy", v20, v21, v22, v23);
    identifierOrderMap = v15->_identifierOrderMap;
    v15->_identifierOrderMap = v17;
  }

  return v7;
}

+ (id)helperExpiredIdentifiers:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS____GEOPlaceDataRequestHelper);
  if (v4)
  {
    id v5 = (NSMutableSet *)[v3 mutableCopy];
    remaningIdentifiers = v4->_remaningIdentifiers;
    v4->_remaningIdentifiers = v5;
  }

  return v4;
}

- (BOOL)finishedIdentifier:(id)a3 withResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[NSMutableSet removeObject:](self->_remaningIdentifiers, "removeObject:", v8);
  if (v9 && self->_results)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_identifierOrderMap, "objectForKeyedSubscript:", v8));
    if (!v11)
    {
      BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
      if (v19) {
        sub_10003AED4(v19, v20, v21, v22, v23, v24, v25, v26);
      }
      goto LABEL_6;
    }

    uint64_t v12 = (void *)v11;
    v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472LL;
    v29 = sub_100033034;
    v30 = &unk_10005A8D8;
    v31 = self;
    id v32 = v9;
    [v12 enumerateIndexesUsingBlock:&v27];
  }

  if (-[NSMutableSet count](self->_remaningIdentifiers, "count", v27, v28, v29, v30, v31))
  {
LABEL_6:
    BOOL v13 = 0;
    goto LABEL_13;
  }

  id requestHandler = (void (**)(id, void, id))self->_requestHandler;
  if (requestHandler)
  {
    if (v10)
    {
      requestHandler[2](self->_requestHandler, 0LL, v10);
    }

    else
    {
      id v15 = sub_100033044(self->_results);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      ((void (**)(id, void *, id))requestHandler)[2](requestHandler, v16, 0LL);
    }

    id v17 = self->_requestHandler;
    self->_id requestHandler = 0LL;
  }

  BOOL v13 = 1;
LABEL_13:

  return v13;
}

- (void)failAllRemainingRequests
{
  if (-[NSMutableSet count](self->_remaningIdentifiers, "count"))
  {
    uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_remaningIdentifiers, "allObjects"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsJoinedByString:", @", "));
      int v12 = 138543362;
      BOOL v13 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_FAULT,  "Watchdog timeout, server error fetching muids: %{public}@",  (uint8_t *)&v12,  0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -19LL,  @"timed-out waiting for requested ids"));
    id requestHandler = (void (**)(id, void *, void *))self->_requestHandler;
    if (requestHandler)
    {
      id v9 = sub_100033044(self->_results);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      requestHandler[2](requestHandler, v10, v7);

      id v11 = self->_requestHandler;
      self->_id requestHandler = 0LL;
    }

    -[NSMutableSet removeAllObjects](self->_remaningIdentifiers, "removeAllObjects");
  }

- (void).cxx_destruct
{
}

@end