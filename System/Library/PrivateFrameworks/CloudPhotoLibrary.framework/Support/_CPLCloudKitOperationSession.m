@interface _CPLCloudKitOperationSession
- (BOOL)beginTask:(id)a3;
- (BOOL)isOngoing;
- (_CPLCloudKitOperationSession)init;
- (id)status;
- (id)statusObject;
- (void)endTask:(id)a3 withOperationClasses:(id)a4 operationsAllowingCellular:(id)a5;
@end

@implementation _CPLCloudKitOperationSession

- (_CPLCloudKitOperationSession)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____CPLCloudKitOperationSession;
  v2 = -[_CPLCloudKitOperationSession init](&v14, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    taskCounters = v2->_taskCounters;
    v2->_taskCounters = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    currentTaskClasses = v2->_currentTaskClasses;
    v2->_currentTaskClasses = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    classCountPerTaskClass = v2->_classCountPerTaskClass;
    v2->_classCountPerTaskClass = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    cellularClassCountPerTaskClass = v2->_cellularClassCountPerTaskClass;
    v2->_cellularClassCountPerTaskClass = v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    startSessionDate = v2->_startSessionDate;
    v2->_startSessionDate = (NSDate *)v11;
  }

  return v2;
}

- (BOOL)beginTask:(id)a3
{
  id v4 = a3;
  if (qword_1002965C0 != -1) {
    dispatch_once(&qword_1002965C0, &stru_100242640);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1002965B8);
  lastOperationDate = self->_lastOperationDate;
  if (lastOperationDate
    && ((-[NSDate timeIntervalSinceNow](lastOperationDate, "timeIntervalSinceNow"), v6 <= 0.0)
      ? (BOOL v7 = v6 < -30.0)
      : (BOOL v7 = 0),
        v7))
  {
    BOOL v9 = 0;
  }

  else
  {
    -[NSCountedSet addObject:](self->_currentTaskClasses, "addObject:", objc_opt_class(v4));
    v8 = self->_lastOperationDate;
    self->_lastOperationDate = 0LL;

    BOOL v9 = 1;
  }

  return v9;
}

- (void)endTask:(id)a3 withOperationClasses:(id)a4 operationsAllowingCellular:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v29 = a5;
  if (qword_1002965C0 != -1) {
    dispatch_once(&qword_1002965C0, &stru_100242640);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1002965B8);
  uint64_t v11 = objc_opt_class(v9);
  -[NSCountedSet removeObject:](self->_currentTaskClasses, "removeObject:", v11);
  -[NSCountedSet addObject:](self->_taskCounters, "addObject:", v11);
  if (!-[NSCountedSet count](self->_currentTaskClasses, "count"))
  {
    v12 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    lastOperationDate = self->_lastOperationDate;
    self->_lastOperationDate = v12;
  }

  objc_super v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_classCountPerTaskClass,  "objectForKeyedSubscript:",  v11));
  v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cellularClassCountPerTaskClass,  "objectForKeyedSubscript:",  v11));
  v27 = v9;
  if (!v14)
  {
    objc_super v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_classCountPerTaskClass,  "setObject:forKeyedSubscript:",  v14,  v11);
    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_cellularClassCountPerTaskClass,  "setObject:forKeyedSubscript:",  v16,  v11);
    v15 = v16;
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v17 = v10;
  id v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v28 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v17);
        }
        uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)i);
        v22 = (char *)[v17 countForObject:v21];
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v21));
        v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  &v22[(void)[v23 unsignedIntegerValue]]));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v24, v21);

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v21));
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  (char *)[v25 unsignedIntegerValue]
                        + (void)[v29 countForObject:v21]));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v26, v21);
      }

      id v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v19);
  }
}

- (id)statusObject
{
  if (qword_1002965C0 != -1) {
    dispatch_once(&qword_1002965C0, &stru_100242640);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1002965B8);
  if (-[NSCountedSet count](self->_taskCounters, "count"))
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v4 = self->_taskCounters;
    id v5 = -[NSCountedSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v18,  v24,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(objc_class **)(*((void *)&v18 + 1) + 8LL * (void)i);
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSCountedSet countForObject:](self->_taskCounters, "countForObject:", v9, (void)v18)));
          uint64_t v11 = NSStringFromClass(v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v10, v12);
        }

        id v6 = -[NSCountedSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v18,  v24,  16LL);
      }

      while (v6);
    }

    v22[0] = @"date";
    lastOperationDate = self->_lastOperationDate;
    objc_super v14 = lastOperationDate;
    if (!lastOperationDate) {
      objc_super v14 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    }
    -[NSDate timeIntervalSinceReferenceDate](v14, "timeIntervalSinceReferenceDate", (void)v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    v22[1] = @"counts";
    v23[0] = v15;
    v23[1] = v3;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  2LL));

    if (!lastOperationDate) {
  }
    }

  else
  {
    v16 = 0LL;
  }

  return v16;
}

- (id)status
{
  if (!-[NSCountedSet count](self->_taskCounters, "count")) {
    return 0LL;
  }
  context = objc_autoreleasePoolPush();
  uint64_t v31 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v35 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSCountedSet count](self->_taskCounters, "count"));
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  obj = self->_taskCounters;
  id v3 = -[NSCountedSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v39,  v43,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v34 = *(void *)v40;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v40 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v39 + 1) + 8LL * (void)i);
        id v7 = CPLSimplifiedStringFromClass(v6);
        v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
        NSUInteger v9 = -[NSCountedSet countForObject:](self->_taskCounters, "countForObject:", v6);
        if (v9 >= 2)
        {
          id v10 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ x %lu",  v8,  v9);

          v8 = v10;
        }

        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_classCountPerTaskClass,  "objectForKeyedSubscript:",  v6));
        v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cellularClassCountPerTaskClass,  "objectForKeyedSubscript:",  v6));
        if ([v11 count])
        {
          v13 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v11 count]);
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472LL;
          v36[2] = sub_1000AAFA8;
          v36[3] = &unk_100242620;
          id v37 = v12;
          v38 = v13;
          objc_super v14 = v13;
          [v11 enumerateKeysAndObjectsUsingBlock:v36];
          -[NSMutableArray sortUsingSelector:](v14, "sortUsingSelector:", "compare:");
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v14, "componentsJoinedByString:", @", "));
          v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (%@)",  v8,  v15));
          -[NSMutableArray addObject:](v35, "addObject:", v16);
        }

        else
        {
          objc_super v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (no CloudKit operation)",  v8));
          -[NSMutableArray addObject:](v35, "addObject:", v14);
        }
      }

      id v4 = -[NSCountedSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v39,  v43,  16LL);
    }

    while (v4);
  }

  -[NSMutableArray sortUsingSelector:](v35, "sortUsingSelector:", "compare:");
  if (!-[_CPLCloudKitOperationSession isOngoing](self, "isOngoing"))
  {
    -[NSDate timeIntervalSinceDate:](self->_lastOperationDate, "timeIntervalSinceDate:", self->_startSessionDate);
    double v24 = v23;
    v25 = objc_alloc(&OBJC_CLASS___NSString);
    __int128 v18 = (void *)v31;
    uint64_t v26 = objc_claimAutoreleasedReturnValue( +[CPLDateFormatter stringFromDateAgo:now:]( &OBJC_CLASS___CPLDateFormatter,  "stringFromDateAgo:now:",  self->_startSessionDate,  v31));
    __int128 v21 = (void *)v26;
    if (v24 > 30.0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[CPLDateFormatter stringForTimeInterval:]( &OBJC_CLASS___CPLDateFormatter,  "stringForTimeInterval:",  v24));
      uint64_t v28 = -[NSString initWithFormat:](v25, "initWithFormat:", @"%@ (for %@):", v21, v27);

LABEL_24:
      goto LABEL_25;
    }

    v22 = -[NSString initWithFormat:](v25, "initWithFormat:", @"%@:", v26);
LABEL_23:
    uint64_t v28 = v22;
    goto LABEL_24;
  }

  -[NSDate timeIntervalSinceNow](self->_startSessionDate, "timeIntervalSinceNow");
  __int128 v18 = (void *)v31;
  if (v19 < -30.0)
  {
    __int128 v20 = objc_alloc(&OBJC_CLASS___NSString);
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[CPLDateFormatter stringForTimeIntervalAgo:now:]( &OBJC_CLASS___CPLDateFormatter,  "stringForTimeIntervalAgo:now:",  self->_startSessionDate,  v31));
    v22 = -[NSString initWithFormat:](v20, "initWithFormat:", @"Ongoing, started %@:", v21);
    goto LABEL_23;
  }

  uint64_t v28 = @"Ongoing:";
LABEL_25:
  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v35, "componentsJoinedByString:", @"\n    "));
  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"  %@\n    %@",  v28,  v29));

  objc_autoreleasePoolPop(context);
  return v30;
}

- (BOOL)isOngoing
{
  return -[NSCountedSet count](self->_currentTaskClasses, "count") != 0LL;
}

- (void).cxx_destruct
{
}

@end