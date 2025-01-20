@interface SBEscrowOperationLoggerUpdate
- (BOOL)isComplete;
- (NSArray)activeActivities;
- (NSArray)activeOperations;
- (NSArray)completedOperations;
- (NSArray)failedOperations;
- (NSArray)reapedActivities;
- (NSArray)reapedOperations;
- (NSArray)successfulOperations;
- (NSArray)updatedActivities;
- (NSArray)updatedOperations;
- (SBEscrowOperationLoggerUpdate)initWithLog:(id)a3 event:(id)a4 context:(id)a5;
- (SecureBackupLog)updatedLog;
- (unint64_t)totalOperations;
@end

@implementation SBEscrowOperationLoggerUpdate

- (SBEscrowOperationLoggerUpdate)initWithLog:(id)a3 event:(id)a4 context:(id)a5
{
  id v59 = a3;
  id v62 = a4;
  id v61 = a5;
  v89.receiver = self;
  v89.super_class = (Class)&OBJC_CLASS___SBEscrowOperationLoggerUpdate;
  v60 = -[SBEscrowOperationLoggerUpdate init](&v89, "init");
  if (v60)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    uint64_t v85 = 0LL;
    v86 = &v85;
    uint64_t v87 = 0x2020000000LL;
    uint64_t v88 = 0LL;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    uint64_t v81 = 0LL;
    v82 = &v81;
    uint64_t v83 = 0x2020000000LL;
    char v84 = 1;
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472LL;
    v71[2] = sub_100032170;
    v71[3] = &unk_100069AC0;
    v79 = &v85;
    v52 = (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v72 = v52;
    id v58 = v8;
    id v73 = v58;
    v55 = v11;
    v74 = v55;
    v56 = v10;
    v75 = v56;
    v53 = v13;
    v76 = v53;
    v80 = &v81;
    v57 = v9;
    v77 = v57;
    v54 = v12;
    v78 = v54;
    v14 = objc_retainBlock(v71);
    if (v62)
    {
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      v15 = (ESAEscrowActivityUpdateResult *)objc_claimAutoreleasedReturnValue([v59 activities]);
      id v16 = -[ESAEscrowActivityUpdateResult countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v67,  v91,  16LL);
      if (v16)
      {
        uint64_t v17 = *(void *)v68;
LABEL_5:
        uint64_t v18 = 0LL;
        while (1)
        {
          if (*(void *)v68 != v17) {
            objc_enumerationMutation(v15);
          }
          v19 = *(void **)(*((void *)&v67 + 1) + 8 * v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue([v62 activityId]);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v19 id]);
          LOBYTE(v19) = [v20 isEqual:v21];

          if (v16 == (id)++v18)
          {
            id v16 = -[ESAEscrowActivityUpdateResult countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v67,  v91,  16LL);
            if (v16) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
      }

      else
      {
LABEL_11:

        v22 = objc_alloc(&OBJC_CLASS___ESAEscrowActivityUpdateResult);
        v15 = -[ESAEscrowActivityUpdateResult initWithActivity:event:context:totalPreviousOperations:]( v22,  "initWithActivity:event:context:totalPreviousOperations:",  0LL,  v62,  v61,  v86[3]);
        ((void (*)(void *, ESAEscrowActivityUpdateResult *))v14[2])(v14, v15);
      }
    }

    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue([v59 activities]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 reverseObjectEnumerator]);

    id v25 = [v24 countByEnumeratingWithState:&v63 objects:v90 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v64;
      do
      {
        for (i = 0LL; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v64 != v26) {
            objc_enumerationMutation(v24);
          }
          v28 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)i);
          v29 = (void *)objc_claimAutoreleasedReturnValue([v28 id]);
          v30 = (void *)objc_claimAutoreleasedReturnValue([v62 activityId]);
          unsigned int v31 = [v29 isEqual:v30];

          v32 = objc_alloc(&OBJC_CLASS___ESAEscrowActivityUpdateResult);
          if (v31) {
            id v33 = v62;
          }
          else {
            id v33 = 0LL;
          }
          v34 = -[ESAEscrowActivityUpdateResult initWithActivity:event:context:totalPreviousOperations:]( v32,  "initWithActivity:event:context:totalPreviousOperations:",  v28,  v33,  v61,  v86[3]);
          ((void (*)(void *, ESAEscrowActivityUpdateResult *))v14[2])(v14, v34);
        }

        id v25 = [v24 countByEnumeratingWithState:&v63 objects:v90 count:16];
      }

      while (v25);
    }

    v35 = objc_alloc(&OBJC_CLASS___SecureBackupLog);
    v36 = -[SecureBackupLog initWithActivities:allComplete:totalOperations:]( v35,  "initWithActivities:allComplete:totalOperations:",  v58,  *((unsigned __int8 *)v82 + 24),  v86[3]);
    updatedLog = v60->_updatedLog;
    v60->_updatedLog = v36;

    activeActivities = v60->_activeActivities;
    v60->_activeActivities = v57;
    v39 = v57;

    updatedActivities = v60->_updatedActivities;
    v60->_updatedActivities = v56;
    v41 = v56;

    reapedActivities = v60->_reapedActivities;
    v60->_reapedActivities = v55;
    v43 = v55;

    activeOperations = v60->_activeOperations;
    v60->_totalOperations = v86[3];
    v60->_activeOperations = v54;
    v45 = v54;

    updatedOperations = v60->_updatedOperations;
    v60->_updatedOperations = v53;
    v47 = v53;

    reapedOperations = v60->_reapedOperations;
    v60->_reapedOperations = v52;
    v49 = v52;

    v50 = v60;
    _Block_object_dispose(&v81, 8);
    _Block_object_dispose(&v85, 8);
  }

  return v60;
}

- (SecureBackupLog)updatedLog
{
  return self->_updatedLog;
}

- (NSArray)activeActivities
{
  return self->_activeActivities;
}

- (NSArray)updatedActivities
{
  return self->_updatedActivities;
}

- (NSArray)reapedActivities
{
  return self->_reapedActivities;
}

- (unint64_t)totalOperations
{
  return self->_totalOperations;
}

- (NSArray)activeOperations
{
  return self->_activeOperations;
}

- (NSArray)updatedOperations
{
  return self->_updatedOperations;
}

- (NSArray)reapedOperations
{
  return self->_reapedOperations;
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (void).cxx_destruct
{
}

- (NSArray)completedOperations
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SBEscrowOperationLoggerUpdate updatedOperations](self, "updatedOperations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SBEscrowOperationLoggerUpdate updatedOperations](self, "updatedOperations", 0LL));
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
        v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
      }

      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return (NSArray *)v4;
}

- (NSArray)successfulOperations
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SBEscrowOperationLoggerUpdate updatedOperations](self, "updatedOperations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SBEscrowOperationLoggerUpdate updatedOperations](self, "updatedOperations", 0LL));
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
        v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
      }

      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return (NSArray *)v4;
}

- (NSArray)failedOperations
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SBEscrowOperationLoggerUpdate updatedOperations](self, "updatedOperations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SBEscrowOperationLoggerUpdate updatedOperations](self, "updatedOperations", 0LL));
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
        v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
      }

      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return (NSArray *)v4;
}

@end