@interface SHLSyncSessionModifyTask
+ (BOOL)supportsSecureCoding;
- (NSArray)allItemIdentifiers;
- (NSProgress)progress;
- (NSString)identifier;
- (NSString)syncStartCondition;
- (SHLLibraryBatch)groupsToModify;
- (SHLLibraryBatch)tracksToModify;
- (SHLSyncSession)session;
- (SHLSyncSessionModifyTask)initWithCoder:(id)a3;
- (SHLSyncSessionModifyTask)initWithTracksToModify:(id)a3 groupsToModify:(id)a4;
- (SHLSyncSessionModifyTaskDelegate)delegate;
- (id)_init;
- (id)subdivideTaskIntoBatchesOfSize:(int64_t)a3;
- (int64_t)retryCount;
- (int64_t)size;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGroupsToModify:(id)a3;
- (void)setRetryCount:(int64_t)a3;
- (void)setSession:(id)a3;
- (void)setSyncStartCondition:(id)a3;
- (void)setTracksToModify:(id)a3;
- (void)updateProgress;
@end

@implementation SHLSyncSessionModifyTask

- (SHLSyncSessionModifyTask)initWithTracksToModify:(id)a3 groupsToModify:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___SHLSyncSessionModifyTask;
  v9 = -[SHLSyncSessionModifyTask init](&v21, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tracksToModify, a3);
    objc_storeStrong((id *)&v10->_groupsToModify, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 UUIDString]);
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v12;

    v10->_retryCount = 0LL;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v7 insertions]);
    v15 = (char *)[v14 count];
    v16 = (void *)objc_claimAutoreleasedReturnValue([v8 insertions]);
    v17 = &v15[(void)[v16 count]];

    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](&OBJC_CLASS___NSProgress, "progressWithTotalUnitCount:", v17));
    progress = v10->_progress;
    v10->_progress = (NSProgress *)v18;
  }

  return v10;
}

- (id)_init
{
  v3 = objc_alloc(&OBJC_CLASS___SHLLibraryBatch);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  v6 = -[SHLLibraryBatch initWithInsertions:deletions:](v3, "initWithInsertions:deletions:", v4, v5);

  id v7 = objc_alloc(&OBJC_CLASS___SHLLibraryBatch);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  v10 = -[SHLLibraryBatch initWithInsertions:deletions:](v7, "initWithInsertions:deletions:", v8, v9);

  v11 = -[SHLSyncSessionModifyTask initWithTracksToModify:groupsToModify:]( self,  "initWithTracksToModify:groupsToModify:",  v6,  v10);
  return v11;
}

- (id)subdivideTaskIntoBatchesOfSize:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLSyncSessionModifyTask groupsToModify](self, "groupsToModify"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 subdivideIntoBatchesOfSize:a3]);
  id v8 = [v7 mutableCopy];

  [v8 sortUsingComparator:&stru_10006DED0];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHLSyncSessionModifyTask tracksToModify](self, "tracksToModify"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 subdivideIntoBatchesOfSize:a3]);
  id v11 = [v10 mutableCopy];

  [v11 sortUsingComparator:&stru_10006DEF0];
LABEL_2:
  if ([v8 count] || objc_msgSend(v11, "count"))
  {
    id v12 = -[SHLSyncSessionModifyTask _init](objc_alloc(&OBJC_CLASS___SHLSyncSessionModifyTask), "_init");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHLSyncSessionModifyTask syncStartCondition](self, "syncStartCondition"));
    [v12 setSyncStartCondition:v13];

    BOOL v14 = 1;
    while (![v8 count])
    {
      if ([v11 count])
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
        v19 = (char *)[v12 size];
        v20 = &v19[(void)[v15 numberOfItems]];
        BOOL v14 = (uint64_t)v20 <= a3;
        if ((uint64_t)v20 <= a3)
        {
          [v12 setTracksToModify:v15];
          uint64_t v18 = v11;
LABEL_11:
          [v18 removeObjectAtIndex:0];
          BOOL v14 = 1;
        }

- (int64_t)type
{
  return 0LL;
}

- (int64_t)size
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHLSyncSessionModifyTask groupsToModify](self, "groupsToModify"));
  v4 = (char *)[v3 numberOfItems];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLSyncSessionModifyTask tracksToModify](self, "tracksToModify"));
  v6 = &v4[(void)[v5 numberOfItems]];

  return (int64_t)v6;
}

- (NSArray)allItemIdentifiers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHLSyncSessionModifyTask groupsToModify](self, "groupsToModify"));
  v4 = (char *)[v3 numberOfItems];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLSyncSessionModifyTask tracksToModify](self, "tracksToModify"));
  v6 = &v4[(void)[v5 numberOfItems]];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v6));
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHLSyncSessionModifyTask groupsToModify](self, "groupsToModify"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 insertions]);

  id v10 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v36;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v9);
        }
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v35 + 1) + 8 * (void)v13) identifier]);
        id v15 = [v14 copy];
        [v7 addObject:v15];

        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }

    while (v11);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SHLSyncSessionModifyTask groupsToModify](self, "groupsToModify"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 deletions]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 allObjects]);
  [v7 addObjectsFromArray:v18];

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SHLSyncSessionModifyTask tracksToModify](self, "tracksToModify", 0LL));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 insertions]);

  id v21 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v32;
    do
    {
      v24 = 0LL;
      do
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v31 + 1) + 8 * (void)v24) identifier]);
        id v26 = [v25 copy];
        [v7 addObject:v26];

        v24 = (char *)v24 + 1;
      }

      while (v22 != v24);
      id v22 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }

    while (v22);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SHLSyncSessionModifyTask tracksToModify](self, "tracksToModify"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 deletions]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 allObjects]);
  [v7 addObjectsFromArray:v29];

  return (NSArray *)v7;
}

- (SHLSyncSessionModifyTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___SHLSyncSessionModifyTask;
  v5 = -[SHLSyncSessionModifyTask init](&v20, "init");
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___SHLLibraryBatch);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___SHLLibraryTrack);
    id v8 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  v7,  objc_opt_class(&OBJC_CLASS___SHLLibraryGroup),  0LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v9 forKey:@"SHLSyncSessionModifyTaskTracksToModify"]);
    tracksToModify = v5->_tracksToModify;
    v5->_tracksToModify = (SHLLibraryBatch *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v9 forKey:@"SHLSyncSessionModifyTaskGroupsToModify"]);
    groupsToModify = v5->_groupsToModify;
    v5->_groupsToModify = (SHLLibraryBatch *)v12;

    id v14 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"SHLSyncSessionModifyTaskIdentifier"];
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v15;

    uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( NSProgress,  "progressWithTotalUnitCount:",  [v4 decodeInt64ForKey:@"SHLSyncSessionModifyTaskProgress"]));
    progress = v5->_progress;
    v5->_progress = (NSProgress *)v17;

    v5->_retryCount = (int64_t)[v4 decodeIntegerForKey:@"SHLSyncSessionModifyTaskRetryCount"];
    v5->_syncStartCondition = (NSString *) [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"SHLSyncSessionModifyTaskSyncTrigger"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  tracksToModify = self->_tracksToModify;
  id v5 = a3;
  [v5 encodeObject:tracksToModify forKey:@"SHLSyncSessionModifyTaskTracksToModify"];
  [v5 encodeObject:self->_groupsToModify forKey:@"SHLSyncSessionModifyTaskGroupsToModify"];
  [v5 encodeObject:self->_identifier forKey:@"SHLSyncSessionModifyTaskIdentifier"];
  objc_msgSend( v5,  "encodeInt64:forKey:",  -[NSProgress totalUnitCount](self->_progress, "totalUnitCount"),  @"SHLSyncSessionModifyTaskProgress");
  [v5 encodeInteger:self->_retryCount forKey:@"SHLSyncSessionModifyTaskRetryCount"];
  [v5 encodeObject:self->_syncStartCondition forKey:@"SHLSyncSessionModifyTaskSyncTrigger"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)updateProgress
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHLSyncSessionModifyTask tracksToModify](self, "tracksToModify"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 insertions]);
  id v5 = (char *)[v4 count];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLSyncSessionModifyTask groupsToModify](self, "groupsToModify"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 insertions]);
  id v8 = &v5[(void)[v7 count]];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[SHLSyncSessionModifyTask progress](self, "progress"));
  [v9 setTotalUnitCount:v8];
}

- (NSProgress)progress
{
  return self->_progress;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (SHLSyncSession)session
{
  return (SHLSyncSession *)objc_loadWeakRetained((id *)&self->session);
}

- (void)setSession:(id)a3
{
}

- (NSString)syncStartCondition
{
  return self->_syncStartCondition;
}

- (void)setSyncStartCondition:(id)a3
{
  self->_syncStartCondition = (NSString *)a3;
}

- (SHLSyncSessionModifyTaskDelegate)delegate
{
  return (SHLSyncSessionModifyTaskDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SHLLibraryBatch)tracksToModify
{
  return self->_tracksToModify;
}

- (void)setTracksToModify:(id)a3
{
}

- (SHLLibraryBatch)groupsToModify
{
  return self->_groupsToModify;
}

- (void)setGroupsToModify:(id)a3
{
}

- (void).cxx_destruct
{
}

@end