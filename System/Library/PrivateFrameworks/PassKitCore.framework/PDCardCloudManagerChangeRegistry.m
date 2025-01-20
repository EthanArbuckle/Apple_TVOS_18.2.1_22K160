@interface PDCardCloudManagerChangeRegistry
- (PDCardCloudManagerChangeRegistry)initWithDatabaseManager:(id)a3;
- (id)addChangeEventsOfType:(int64_t)a3 withRecordType:(int64_t)a4 andRecordUniqueIDs:(id)a5 timestampByUniqueID:(id)a6 coalescePreviousEvents:(BOOL)a7;
- (id)createAndCoalsesceEvent:(int64_t)a3 forRecordWithType:(int64_t)a4 andRecordIUniqueID:(id)a5 timestamp:(id)a6 eventsToDelete:(id)a7;
- (id)fetchChangeEvents;
- (id)recordAdditionOfPasses:(id)a3;
- (id)recordRemovalOfPassesWithUniqueIDs:(id)a3;
- (id)recordUpdateOfCatalog:(id)a3;
- (id)recordUpdateOfPasses:(id)a3;
- (id)retryDateForEvent:(id)a3;
- (unint64_t)numberOfChangeEvents;
- (void)eraseChangeEvents:(id)a3;
- (void)increaseRetryCountForRecordUniqueIdenifier:(id)a3 recordType:(int64_t)a4;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)unregisterAllChanges;
- (void)unregisterChangesForPassesWithUniqueIDs:(id)a3;
@end

@implementation PDCardCloudManagerChangeRegistry

- (PDCardCloudManagerChangeRegistry)initWithDatabaseManager:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PDCardCloudManagerChangeRegistry;
  v6 = -[PDCardCloudManagerChangeRegistry init](&v14, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databaseManager, a3);
    if (PKCloudKitPassSyncEnabled(v8, v9))
    {
      id v10 = PDDefaultQueue();
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      PDScheduledActivityClientRegister(@"PDChangeRegistryScheduledClientIdentifier", v7, v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "maintenanceActivityCriteriaWithStartDate:",  0LL));
      [v12 setRequireNetworkConnectivity:0];
      [v12 setRequireMainsPower:1];
      [v12 setRepeating:1];
      [v12 setRepeatInterval:2592000.0];
      PDScheduledActivityRegister( @"PDChangeRegistryScheduledClientIdentifier",  @"PDChangeRegistryScheduledActivityIdentifier",  v12);
    }
  }

  return v7;
}

- (id)recordAdditionOfPasses:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueID", (void)v19));
        objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v12 modificationDate]);
        -[NSMutableArray addObject:](v5, "addObject:", v13);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v14, v13);
      }

      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v9);
  }

  id v15 = -[NSMutableArray copy](v5, "copy");
  id v16 = -[NSMutableDictionary copy](v6, "copy");
  v17 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardCloudManagerChangeRegistry addChangeEventsOfType:withRecordType:andRecordUniqueIDs:timestampByUniqueID:coalescePreviousEvents:]( self,  "addChangeEventsOfType:withRecordType:andRecordUniqueIDs:timestampByUniqueID:coalescePreviousEvents:",  0LL,  0LL,  v15,  v16,  1LL));

  return v17;
}

- (id)recordUpdateOfPasses:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pk_arrayBySafelyApplyingBlock:", &stru_100657190));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardCloudManagerChangeRegistry addChangeEventsOfType:withRecordType:andRecordUniqueIDs:timestampByUniqueID:coalescePreviousEvents:]( self,  "addChangeEventsOfType:withRecordType:andRecordUniqueIDs:timestampByUniqueID:coalescePreviousEvents:",  1LL,  0LL,  v4,  0LL,  1LL));

  return v5;
}

- (id)recordRemovalOfPassesWithUniqueIDs:(id)a3
{
  return -[PDCardCloudManagerChangeRegistry addChangeEventsOfType:withRecordType:andRecordUniqueIDs:timestampByUniqueID:coalescePreviousEvents:]( self,  "addChangeEventsOfType:withRecordType:andRecordUniqueIDs:timestampByUniqueID:coalescePreviousEvents:",  2LL,  0LL,  a3,  0LL,  1LL);
}

- (id)recordUpdateOfCatalog:(id)a3
{
  uint64_t v7 = PKChangeHistoryNoRecordID;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardCloudManagerChangeRegistry addChangeEventsOfType:withRecordType:andRecordUniqueIDs:timestampByUniqueID:coalescePreviousEvents:]( self,  "addChangeEventsOfType:withRecordType:andRecordUniqueIDs:timestampByUniqueID:coalescePreviousEvents:",  1LL,  1LL,  v4,  0LL,  1LL));

  return v5;
}

- (id)addChangeEventsOfType:(int64_t)a3 withRecordType:(int64_t)a4 andRecordUniqueIDs:(id)a5 timestampByUniqueID:(id)a6 coalescePreviousEvents:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a5;
  id v12 = a6;
  v30 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v27 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = v11;
  id v13 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v17, v27));
        __int128 v19 = v18;
        if (v18) {
          id v20 = v18;
        }
        else {
          id v20 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        }
        __int128 v21 = v20;

        if (v7) {
          __int128 v22 = (PKChangeHistoryEvent *)objc_claimAutoreleasedReturnValue( -[PDCardCloudManagerChangeRegistry createAndCoalsesceEvent:forRecordWithType:andRecordIUniqueID:timestamp:eventsToDelete:]( self,  "createAndCoalsesceEvent:forRecordWithType:andRecordIUniqueID:timestamp:eventsToDelete:",  a3,  a4,  v17,  v21,  v27));
        }
        else {
          __int128 v22 = -[PKChangeHistoryEvent initWithType:recordType:recordUniqueID:timestamp:]( objc_alloc(&OBJC_CLASS___PKChangeHistoryEvent),  "initWithType:recordType:recordUniqueID:timestamp:",  a3,  a4,  v17,  v21);
        }
        v23 = v22;
        if (v22) {
          -[NSMutableArray addObject:](v30, "addObject:", v22);
        }
      }

      id v14 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v14);
  }

  v24 = v27;
  if (-[NSMutableArray count](v27, "count")) {
    -[PDDatabaseManager removeChangeEvents:](self->_databaseManager, "removeChangeEvents:", v27);
  }
  if (-[NSMutableArray count](v30, "count", v27)) {
    -[PDDatabaseManager addChangeEvents:](self->_databaseManager, "addChangeEvents:", v30);
  }
  id v25 = -[NSMutableArray copy](v30, "copy");

  return v25;
}

- (id)createAndCoalsesceEvent:(int64_t)a3 forRecordWithType:(int64_t)a4 andRecordIUniqueID:(id)a5 timestamp:(id)a6 eventsToDelete:(id)a7
{
  id v12 = a5;
  id v34 = a6;
  id v33 = a7;
  v35 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager changeEventsWithRecordType:recordUniqueID:]( self->_databaseManager,  "changeEventsWithRecordType:recordUniqueID:",  a4,  v12));
  id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v17 = v13;
  id v18 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(v17);
        }
        __int128 v22 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
        id v23 = [v22 type];
        v24 = v14;
        if (!v23) {
          goto LABEL_11;
        }
        if (v23 == (id)2)
        {
          v24 = v16;
LABEL_11:
          -[NSMutableArray addObject:](v24, "addObject:", v22);
          continue;
        }

        v24 = v15;
        if (v23 == (id)1) {
          goto LABEL_11;
        }
      }

      id v19 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }

    while (v19);
  }

  id v25 = -[NSMutableArray count](v14, "count");
  id v26 = -[NSMutableArray count](v15, "count");
  id v27 = -[NSMutableArray count](v16, "count");
  v28 = -[PKChangeHistoryEvent initWithType:recordType:recordUniqueID:timestamp:]( objc_alloc(&OBJC_CLASS___PKChangeHistoryEvent),  "initWithType:recordType:recordUniqueID:timestamp:",  a3,  a4,  v35,  v34);
  if (a3 == 2)
  {
    if (!v25)
    {
      v29 = v33;
      if (!v26)
      {
LABEL_24:
        if (v27) {
          [v29 addObjectsFromArray:v16];
        }
        goto LABEL_32;
      }

- (unint64_t)numberOfChangeEvents
{
  return -[PDDatabaseManager numberOfChangeEvents](self->_databaseManager, "numberOfChangeEvents");
}

- (id)fetchChangeEvents
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager changeEventsWithRecordType:]( self->_databaseManager,  "changeEventsWithRecordType:",  0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager changeEventsWithRecordType:]( self->_databaseManager,  "changeEventsWithRecordType:",  1LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 arrayByAddingObjectsFromArray:v4]);

  return v5;
}

- (void)increaseRetryCountForRecordUniqueIdenifier:(id)a3 recordType:(int64_t)a4
{
}

- (id)retryDateForEvent:(id)a3
{
  return -[PDDatabaseManager retryDateForEvent:](self->_databaseManager, "retryDateForEvent:", a3);
}

- (void)eraseChangeEvents:(id)a3
{
}

- (void)unregisterChangesForPassesWithUniqueIDs:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager changeEventsWithRecordType:recordUniqueID:]( self->_databaseManager,  "changeEventsWithRecordType:recordUniqueID:",  0LL,  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v8)));
        -[PDDatabaseManager removeChangeEvents:](self->_databaseManager, "removeChangeEvents:", v9);

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }
}

- (void)unregisterAllChanges
{
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (__CFString *)v6;
  id v9 = v8;
  if (v8 == @"PDChangeRegistryScheduledActivityIdentifier"
    || v8
    && (unsigned int v10 = -[__CFString isEqualToString:]( v8,  "isEqualToString:",  @"PDChangeRegistryScheduledActivityIdentifier"),  v9,  v10))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "removing expired change events", v13, 2u);
    }

    -[PDDatabaseManager removeExpiredChangeEvents](self->_databaseManager, "removeExpiredChangeEvents");
  }
}

- (void).cxx_destruct
{
}

@end