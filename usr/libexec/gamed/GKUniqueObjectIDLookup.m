@interface GKUniqueObjectIDLookup
- (GKUniqueObjectIDLookup)initWithObjectClass:(Class)a3 context:(id)a4;
- (GKUniqueObjectIDLookup)initWithObjectClass:(Class)a3 context:(id)a4 predicate:(id)a5;
- (id)insertObjectsForServerRepresentations:(id)a3 context:(id)a4 newObject:(id)a5;
- (id)uniqueObjectsForKeys:(id)a3 context:(id)a4 newObject:(id)a5;
- (void)_populateWithContext:(id)a3;
- (void)dealloc;
@end

@implementation GKUniqueObjectIDLookup

- (GKUniqueObjectIDLookup)initWithObjectClass:(Class)a3 context:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](&OBJC_CLASS___NSPredicate, "predicateWithValue:", 1LL));
  v8 = -[GKUniqueObjectIDLookup initWithObjectClass:context:predicate:]( self,  "initWithObjectClass:context:predicate:",  a3,  v6,  v7);

  return v8;
}

- (GKUniqueObjectIDLookup)initWithObjectClass:(Class)a3 context:(id)a4 predicate:(id)a5
{
  id v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class uniqueAttributeName](a3, "uniqueAttributeName"));
  if (v8)
  {
    if (v7) {
      goto LABEL_3;
    }
  }

  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Class %@ must define a attribute for uniquing.",  a3));
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v19 = objc_claimAutoreleasedReturnValue([v18 lastPathComponent]);
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (uniqueKey != nil)\n[%s (%s:%d)]",  v17,  "-[GKUniqueObjectIDLookup initWithObjectClass:context:predicate:]",  [v19 UTF8String],  57));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v20);
    if (v7) {
      goto LABEL_3;
    }
  }

  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](&OBJC_CLASS___NSPredicate, "predicateWithValue:", 1LL));
LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___GKUniqueObjectIDLookup;
  v9 = -[GKUniqueObjectIDLookup init](&v21, "init");
  if (v9)
  {
    v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s.%@",  class_getName(a3),  v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = -[GKThreadsafeDictionary initWithName:]( objc_alloc(&OBJC_CLASS___GKThreadsafeDictionary),  "initWithName:",  v11);
    lookup = v9->_lookup;
    v9->_lookup = v12;

    objc_storeStrong((id *)&v9->_predicate, v7);
    v9->_objectClass = a3;
    dispatch_semaphore_t v14 = dispatch_semaphore_create(1LL);
    semaphore = v9->_semaphore;
    v9->_semaphore = (OS_dispatch_semaphore *)v14;
  }

  return v9;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GKUniqueObjectIDLookup;
  -[GKUniqueObjectIDLookup dealloc](&v4, "dealloc");
}

- (void)_populateWithContext:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKUniqueObjectIDLookup _populateWithContext:]",  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v8,  "-[GKUniqueObjectIDLookup _populateWithContext:]",  [v10 UTF8String],  80));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class uniqueAttributeName](self->_objectClass, "uniqueAttributeName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class fetchRequestForContext:](self->_objectClass, "fetchRequestForContext:", v4));
  [v13 setPredicate:self->_predicate];
  [v13 setResultType:2];
  dispatch_semaphore_t v14 = objc_alloc_init(&OBJC_CLASS___NSExpressionDescription);
  -[NSExpressionDescription setName:](v14, "setName:", @"objectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForEvaluatedObject]( &OBJC_CLASS___NSExpression,  "expressionForEvaluatedObject"));
  -[NSExpressionDescription setExpression:](v14, "setExpression:", v15);

  -[NSExpressionDescription setExpressionResultType:](v14, "setExpressionResultType:", 2000LL);
  v46[0] = v12;
  v46[1] = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v46, 2LL));
  [v13 setPropertiesToFetch:v16];

  [v13 setReturnsDistinctResults:1];
  id v44 = 0LL;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 executeFetchRequest:v13 error:&v44]);
  id v18 = v44;
  id v19 = v18;
  if (v18)
  {
    if (!os_log_GKGeneral) {
      id v20 = (id)GKOSLoggers(v18);
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_1000D7920();
    }
  }

  v35 = v19;
  objc_super v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKCacheObject.m",  100LL,  "-[GKUniqueObjectIDLookup _populateWithContext:]"));
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v21));

  v23 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v17 count]);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_1000BD22C;
  v40[3] = &unk_10026BEC8;
  v40[4] = self;
  id v24 = v17;
  id v41 = v24;
  id v25 = v12;
  id v42 = v25;
  v26 = v23;
  v43 = v26;
  [v22 perform:v40];
  [v22 wait];
  if (-[NSMutableArray count](v26, "count"))
  {
    id v33 = v24;
    id v34 = v25;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    v27 = v26;
    id v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v36,  v45,  16LL);
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v37;
      do
      {
        v31 = 0LL;
        do
        {
          if (*(void *)v37 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = (void *)objc_claimAutoreleasedReturnValue([v4 objectWithID:*(void *)(*((void *)&v36 + 1) + 8 * (void)v31)]);
          if (v32) {
            [v4 deleteObject:v32];
          }

          v31 = (char *)v31 + 1;
        }

        while (v29 != v31);
        id v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v36,  v45,  16LL);
      }

      while (v29);
    }

    id v24 = v33;
    id v25 = v34;
  }
}

- (id)uniqueObjectsForKeys:(id)a3 context:(id)a4 newObject:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v53 = v10;
  if (!os_log_GKGeneral) {
    id v11 = (id)GKOSLoggers(v10);
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000D79E0();
  }
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v13, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    dispatch_semaphore_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKUniqueObjectIDLookup uniqueObjectsForKeys:context:newObject:]",  v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v17 = objc_claimAutoreleasedReturnValue([v16 lastPathComponent]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v15,  "-[GKUniqueObjectIDLookup uniqueObjectsForKeys:context:newObject:]",  [v17 UTF8String],  145));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v18);
  }

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  id v19 = [v8 count];
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class uniqueAttributeName](self->_objectClass, "uniqueAttributeName"));
  v51 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v19);
  id v20 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  v19);
  group = dispatch_group_create();
  lookup = self->_lookup;
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472LL;
  v73[2] = sub_1000BDC5C;
  v73[3] = &unk_100270F68;
  id v22 = v8;
  id v74 = v22;
  v23 = v20;
  v75 = v23;
  -[GKThreadsafeDictionary readFromDictionary:](lookup, "readFromDictionary:", v73);
  v50 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v19);
  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  v19));
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v23, "allValues"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v25));

  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472LL;
  v69[2] = sub_1000BDD8C;
  v69[3] = &unk_100270F90;
  id v27 = v9;
  id v70 = v27;
  id v28 = v24;
  id v71 = v28;
  id v29 = v26;
  id v72 = v29;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v23, "enumerateKeysAndObjectsUsingBlock:", v69);
  id v30 = [v29 count];
  if (v30)
  {
    if (!os_log_GKGeneral) {
      id v31 = (id)GKOSLoggers(v30);
    }
    if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
      sub_1000D7980();
    }
    v32 = objc_alloc(&OBJC_CLASS___NSFetchRequest);
    id v33 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class entityName](self->_objectClass, "entityName"));
    id v34 = -[NSFetchRequest initWithEntityName:](v32, "initWithEntityName:", v33);

    v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"self IN %@",  v29));
    -[NSFetchRequest setPredicate:](v34, "setPredicate:", v35);

    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class relationshipKeyPathsForPrefetch](self->_objectClass, "relationshipKeyPathsForPrefetch"));
    -[NSFetchRequest setRelationshipKeyPathsForPrefetching:](v34, "setRelationshipKeyPathsForPrefetching:", v36);

    -[NSFetchRequest setReturnsObjectsAsFaults:](v34, "setReturnsObjectsAsFaults:", 0LL);
    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v27 executeFetchRequest:v34 error:0]);
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472LL;
    v66[2] = sub_1000BDE0C;
    v66[3] = &unk_100270FB8;
    id v67 = v56;
    id v68 = v28;
    [v37 enumerateObjectsUsingBlock:v66];
  }

  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472LL;
  v61[2] = sub_1000BDE64;
  v61[3] = &unk_100270FE0;
  id v38 = v28;
  id v62 = v38;
  id v39 = v53;
  id v65 = v39;
  v40 = v50;
  v63 = v40;
  id v41 = v51;
  v64 = v41;
  v54 = v22;
  [v22 enumerateObjectsUsingBlock:v61];
  if (-[NSMutableArray count](v40, "count"))
  {
    if ([v27 obtainPermanentIDsForObjects:v40 error:0])
    {
      uint64_t v42 = objc_claimAutoreleasedReturnValue( -[NSMutableArray _gkMapDictionaryWithKeyPath:valueKeyPath:]( v40,  "_gkMapDictionaryWithKeyPath:valueKeyPath:",  v56,  @"objectID"));
      if (v42)
      {
        v43 = (void *)v42;
        dispatch_group_enter(group);
        v52 = self->_lookup;
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472LL;
        v58[2] = sub_1000BDEE8;
        v58[3] = &unk_100271008;
        id v59 = v43;
        v60 = group;
        id v44 = v43;
        -[GKThreadsafeDictionary writeToDictionary:](v52, "writeToDictionary:", v58);
      }
    }
  }

  v45 = v41;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v47 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BDF14;
  block[3] = &unk_10026B670;
  block[4] = self;
  dispatch_group_notify(group, v47, block);

  v48 = v45;
  return v48;
}

- (id)insertObjectsForServerRepresentations:(id)a3 context:(id)a4 newObject:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v12, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    dispatch_semaphore_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKUniqueObjectIDLookup insertObjectsForServerRepresentations:context:newObject:]",  v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    id v16 = objc_claimAutoreleasedReturnValue([v15 lastPathComponent]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v14,  "-[GKUniqueObjectIDLookup insertObjectsForServerRepresentations:context:newObject:]",  [v16 UTF8String],  243));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v17);
  }

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1000BE1D4;
  v29[3] = &unk_100271030;
  id v18 = v10;
  id v30 = v18;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v8 _gkMapWithBlock:v29]);
  if ([v19 count])
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class uniqueAttributeName](self->_objectClass, "uniqueAttributeName"));
    if ([v9 obtainPermanentIDsForObjects:v19 error:0])
    {
      uint64_t v21 = objc_claimAutoreleasedReturnValue([v19 _gkMapDictionaryWithKeyPath:v20 valueKeyPath:@"objectID"]);
      if (v21)
      {
        id v22 = (void *)v21;
        if (!os_log_GKGeneral) {
          id v23 = (id)GKOSLoggers(v21);
        }
        if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
          sub_1000D7A0C();
        }
        lookup = self->_lookup;
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472LL;
        v27[2] = sub_1000BE1E0;
        v27[3] = &unk_100271058;
        id v28 = v22;
        id v25 = v22;
        -[GKThreadsafeDictionary writeToDictionary:](lookup, "writeToDictionary:", v27);
      }
    }
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);

  return v19;
}

- (void).cxx_destruct
{
}

@end