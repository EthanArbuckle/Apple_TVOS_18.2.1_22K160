@interface _CPLCloudKitTaskContext
- (BOOL)_operationAllowsCellular:(id)a3;
- (BOOL)hasBlockedOperationsIncludingBackground:(BOOL)a3;
- (BOOL)isCancelled;
- (CPLCloudKitTrackableTask)task;
- (NSArray)operationStatusDictionaries;
- (NSCountedSet)countOfOperationClasses;
- (NSCountedSet)countOfOperationWithCellularAccessClasses;
- (NSDate)startDate;
- (NSDictionary)statusPerOperationType;
- (_CPLCloudKitTaskContext)initWithTask:(id)a3;
- (id)_priorityDescriptionForOperation:(id)a3 forTask:(id)a4;
- (id)contextForOperation:(id)a3;
- (void)cancelAllOperations;
- (void)operationDidFinish:(id)a3;
- (void)operationWillStart:(id)a3 context:(id)a4;
- (void)setCancelled:(BOOL)a3;
- (void)setStartDate:(id)a3;
@end

@implementation _CPLCloudKitTaskContext

- (_CPLCloudKitTaskContext)initWithTask:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS____CPLCloudKitTaskContext;
  v6 = -[_CPLCloudKitTaskContext init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_task, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "weakToStrongObjectsMapTable"));
    contexts = v7->_contexts;
    v7->_contexts = (NSMapTable *)v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    classCounts = v7->_classCounts;
    v7->_classCounts = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    cellularClassCounts = v7->_cellularClassCounts;
    v7->_cellularClassCounts = v12;
  }

  return v7;
}

- (void)operationWillStart:(id)a3 context:(id)a4
{
  id v6 = a3;
  -[NSMapTable setObject:forKey:](self->_contexts, "setObject:forKey:", a4, v6);
  -[NSCountedSet addObject:](self->_classCounts, "addObject:", objc_opt_class(v6));
  if (-[_CPLCloudKitTaskContext _operationAllowsCellular:](self, "_operationAllowsCellular:", v6)) {
    -[NSCountedSet addObject:](self->_cellularClassCounts, "addObject:", objc_opt_class(v6));
  }
}

- (void)operationDidFinish:(id)a3
{
  id v6 = a3;
  -[NSMapTable removeObjectForKey:](self->_contexts, "removeObjectForKey:");
  if (!-[NSMapTable count](self->_contexts, "count"))
  {
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    lastOperationDate = self->_lastOperationDate;
    self->_lastOperationDate = v4;

    self->_lastOperationClass = (Class)objc_opt_class(v6);
  }
}

- (BOOL)hasBlockedOperationsIncludingBackground:(BOOL)a3
{
  if (!-[NSMapTable count](self->_contexts, "count", a3)) {
    return 0;
  }
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v4 = self->_contexts;
  id v5 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resolvedConfiguration", (void)v16));
        unsigned int v11 = [v10 cplDiscretionary];

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_contexts, "objectForKey:", v9));
          unsigned int v13 = [v12 mightBeBlocked];

          if (v13) {
            continue;
          }
        }

        BOOL v14 = 0;
        goto LABEL_15;
      }

      id v6 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      BOOL v14 = 1;
      if (v6) {
        continue;
      }
      break;
    }
  }

  else
  {
    BOOL v14 = 1;
  }

- (id)contextForOperation:(id)a3
{
  return -[NSMapTable objectForKey:](self->_contexts, "objectForKey:", a3);
}

- (void)cancelAllOperations
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v2 = self->_contexts;
  id v3 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "cancel", (void)v7);
        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
    }

    while (v4);
  }
}

- (NSCountedSet)countOfOperationClasses
{
  return self->_classCounts;
}

- (NSCountedSet)countOfOperationWithCellularAccessClasses
{
  return self->_cellularClassCounts;
}

- (id)_priorityDescriptionForOperation:(id)a3 forTask:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 resolvedConfiguration]);
  if ([v6 cplDiscretionary])
  {
    __int128 v7 = @"disc";
  }

  else if (v5 && ([v5 hasBackgroundActivity] & 1) != 0)
  {
    __int128 v7 = @"bg activity";
  }

  else
  {
    __int128 v7 = @"non-disc";
  }

  unint64_t v8 = __ROR8__((char *)[v6 qualityOfService] - 9, 3);
  if (v8 <= 3) {
    __int128 v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@/%@",  v7,  off_100240700[v8]);
  }

  return v7;
}

- (BOOL)_operationAllowsCellular:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 resolvedConfiguration]);
  unsigned __int8 v4 = [v3 allowsCellularAccess];

  return v4;
}

- (NSDictionary)statusPerOperationType
{
  v2 = self;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTrackableTask session](self->_task, "session"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);

  id v5 = &OBJC_CLASS___NSBundle_ptr;
  if (v4)
  {
    id v6 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @" in %@", v4);
  }

  else
  {
    id v6 = &stru_1002482B0;
  }

  if (!-[NSMapTable count](v2->_contexts, "count"))
  {
    lastOperationDate = v2->_lastOperationDate;
    v57 = objc_alloc(&OBJC_CLASS___NSString);
    if (lastOperationDate)
    {
      Class lastOperationClass = v2->_lastOperationClass;
      uint64_t v59 = objc_opt_class(v2->_task);
      id v60 = CPLSimplifiedStringFromClass(v59);
      v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
      v54 = -[NSString initWithFormat:](v57, "initWithFormat:", @"%@ (for %@%@)", lastOperationClass, v61, v6);

      v62 = objc_alloc(&OBJC_CLASS___NSString);
      Class v63 = v2->_lastOperationClass;
      v64 = (void *)objc_claimAutoreleasedReturnValue( +[CPLDateFormatter stringFromDateAgo:now:]( &OBJC_CLASS___CPLDateFormatter,  "stringFromDateAgo:now:",  v2->_lastOperationDate,  0LL));
      v65 = -[NSString initWithFormat:](v62, "initWithFormat:", @"%@ finished %@", v63, v64);
    }

    else
    {
      uint64_t v66 = objc_opt_class(v2->_task);
      id v67 = CPLSimplifiedStringFromClass(v66);
      v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
      v69 = (void *)objc_claimAutoreleasedReturnValue( +[CPLDateFormatter stringFromDateAgo:now:]( &OBJC_CLASS___CPLDateFormatter,  "stringFromDateAgo:now:",  v2->_startDate,  0LL));
      v54 = -[NSString initWithFormat:](v57, "initWithFormat:", @"Started %@%@ %@", v68, v6, v69);

      v64 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTrackableTask idleDescription](v2->_task, "idleDescription"));
      if (!v64)
      {
        v53 = @"no operation launched yet";
        goto LABEL_56;
      }

      v65 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@", v64, v71);
    }

    v53 = (__CFString *)v65;
LABEL_56:

    v91 = v54;
    v92 = v53;
    v55 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v92,  &v91,  1LL));
    goto LABEL_57;
  }

  uint64_t v77 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v75 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v7 = objc_opt_class(v2->_task);
  id v8 = CPLSimplifiedStringFromClass(v7);
  uint64_t v76 = objc_claimAutoreleasedReturnValue(v8);
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  obj = v2->_contexts;
  id v78 = -[NSMapTable countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v86,  v90,  16LL);
  if (v78)
  {
    uint64_t v74 = *(void *)v87;
    v79 = v2;
    do
    {
      for (i = 0LL; i != v78; i = (char *)i + 1)
      {
        if (*(void *)v87 != v74) {
          objc_enumerationMutation(obj);
        }
        __int128 v10 = *(void **)(*((void *)&v86 + 1) + 8LL * (void)i);
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](v2->_contexts, "objectForKey:", v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue([v10 group]);
        id v13 = objc_alloc((Class)v5[35]);
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v10 cplOperationClassDescription]);
        objc_super v15 = (void *)v14;
        v82 = v12;
        if (v12)
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
          id v17 = [v13 initWithFormat:@"%@ (for %@/%@%@)", v15, v76, v16, v6];
        }

        else
        {
          id v17 = [v13 initWithFormat:@"%@ (for %@%@)", v14, v76, v6];
        }

        id v83 = v17;

        v85 = (void *)objc_claimAutoreleasedReturnValue([v11 startDateDescriptionWithNow:v77]);
        unsigned int v80 = [v11 mightBeBlocked];
        unsigned int v18 = [v10 isCancelled];
        unsigned int v19 = [v11 isCancelled];
        v20 = "";
        if (v19) {
          v20 = "- cancelled by engine";
        }
        if (v18) {
          v20 = "- cancelled";
        }
        v81 = v20;
        [v11 progress];
        double v22 = v21;
        v23 = (void *)objc_claimAutoreleasedReturnValue([v11 operationDescription]);
        if (v23)
        {
          id v24 = objc_alloc((Class)v5[35]);
          v25 = (void *)objc_claimAutoreleasedReturnValue([v10 operationID]);
          id v84 = [v24 initWithFormat:@"%@ %@", v25, v23];
        }

        else
        {
          id v84 = (id)objc_claimAutoreleasedReturnValue([v10 operationID]);
        }

        v26 = (void *)objc_claimAutoreleasedReturnValue([v10 configuration]);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 applicationBundleIdentifierOverrideForNetworkAttribution]);
        v28 = v27;
        if (v27)
        {
          v29 = v27;
        }

        else
        {
          v30 = v6;
          v31 = (void *)objc_claimAutoreleasedReturnValue([v10 group]);
          v32 = (void *)objc_claimAutoreleasedReturnValue([v31 defaultConfiguration]);
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue([v32 applicationBundleIdentifierOverrideForNetworkAttribution]);

          id v5 = &OBJC_CLASS___NSBundle_ptr;
          id v6 = v30;
          v2 = v79;
        }

        id v33 = objc_alloc((Class)v5[35]);
        v34 = (void *)objc_claimAutoreleasedReturnValue( -[_CPLCloudKitTaskContext _priorityDescriptionForOperation:forTask:]( v2,  "_priorityDescriptionForOperation:forTask:",  v10,  v2->_task));
        if (-[_CPLCloudKitTaskContext _operationAllowsCellular:](v2, "_operationAllowsCellular:", v10)) {
          v35 = "";
        }
        else {
          v35 = " (no cell)";
        }
        unsigned __int8 v36 = [v10 isExecuting];
        v38 = "exc";
        if (v22 <= 0.0)
        {
          v39 = v75;
          if ((v36 & 1) == 0)
          {
            unsigned int v44 = [v10 isFinished];
            v38 = "pen";
            if (v44) {
              v38 = "fin";
            }
          }

          v45 = @"no bundle";
          if (v29) {
            v45 = v29;
          }
          v46 = "";
          if (v80) {
            v46 = " (blocked?)";
          }
          id v43 = [v33 initWithFormat:@"  [%@](%@)%s [%s]%s - %@ - %@%s", v37, v84, v34, v35, v38, v81, v45, v85, v46, v72];
        }

        else
        {
          v39 = v75;
          if ((v36 & 1) == 0)
          {
            unsigned int v40 = [v10 isFinished];
            v38 = "pen";
            if (v40) {
              v38 = "fin";
            }
          }

          v41 = @"no bundle";
          if (v29) {
            v41 = v29;
          }
          v42 = "";
          if (v80) {
            v42 = " (blocked?)";
          }
          id v43 = [v33 initWithFormat:@"  [%@](%@)%s [%s]%s - %@ - %@ - %.0f%%%s", v22 * 100.0, v84, v34, v35, v38, v81, v41, v85, v22 * 100.0, v42];
        }

        v47 = v43;

        v48 = v83;
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v39, "objectForKeyedSubscript:", v83));
        id v5 = &OBJC_CLASS___NSBundle_ptr;
        if (v49)
        {
          id v50 = v49;
          [v49 appendFormat:@"\n%@", v47];
        }

        else
        {
          id v50 = [v47 mutableCopy];
          -[NSMutableDictionary setObject:forKeyedSubscript:](v39, "setObject:forKeyedSubscript:", v50, v83);
        }

        v51 = (void *)objc_claimAutoreleasedReturnValue([v11 extendedStatusDescriptionStrings]);
        if ([v51 count])
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue([v51 componentsJoinedByString:@"\n      "]);
          [v50 appendFormat:@"\n      %@", v52];

          v48 = v83;
        }

        v2 = v79;
      }

      id v78 = -[NSMapTable countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v86,  v90,  16LL);
    }

    while (v78);
  }

  v53 = (__CFString *)v76;
  v54 = (NSString *)v77;
  v55 = v75;
LABEL_57:

  return (NSDictionary *)v55;
}

- (NSArray)operationStatusDictionaries
{
  return 0LL;
}

- (CPLCloudKitTrackableTask)task
{
  return self->_task;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
}

@end