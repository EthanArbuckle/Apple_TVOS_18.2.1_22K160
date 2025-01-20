@interface SHLModifyTaskRecovery
- (NSArray)deletedIDs;
- (NSArray)recoverableTasks;
- (NSArray)savedGroups;
- (NSArray)savedTracks;
- (NSError)error;
- (SHLModifyTaskRecovery)initWithOriginalTask:(id)a3 savedGroups:(id)a4 savedTracks:(id)a5 deletedIDs:(id)a6 error:(id)a7;
- (SHLSyncSessionModifyTask)originalTask;
- (id)recoverTaskFromLimitExceededError;
- (id)recoverTaskFromPartialError;
- (void)setDeletedIDs:(id)a3;
- (void)setError:(id)a3;
- (void)setOriginalTask:(id)a3;
- (void)setSavedGroups:(id)a3;
- (void)setSavedTracks:(id)a3;
@end

@implementation SHLModifyTaskRecovery

- (SHLModifyTaskRecovery)initWithOriginalTask:(id)a3 savedGroups:(id)a4 savedTracks:(id)a5 deletedIDs:(id)a6 error:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___SHLModifyTaskRecovery;
  v17 = -[SHLModifyTaskRecovery init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_originalTask, a3);
    objc_storeStrong((id *)&v18->_savedGroups, a4);
    objc_storeStrong((id *)&v18->_savedTracks, a5);
    objc_storeStrong((id *)&v18->_deletedIDs, a6);
    objc_storeStrong((id *)&v18->_error, a7);
  }

  return v18;
}

- (NSArray)recoverableTasks
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHLModifyTaskRecovery error](self, "error"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  unsigned __int8 v5 = [v4 isEqualToString:CKErrorDomain];

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLModifyTaskRecovery error](self, "error"));
    id v7 = [v6 code];

    if (v7 == (id)27)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue( -[SHLModifyTaskRecovery recoverTaskFromLimitExceededError]( self,  "recoverTaskFromLimitExceededError"));
      return (NSArray *)v8;
    }

    if (v7 == (id)2)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHLModifyTaskRecovery recoverTaskFromPartialError](self, "recoverTaskFromPartialError"));
      return (NSArray *)v8;
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHLModifyTaskRecovery originalTask](self, "originalTask"));
    id v13 = v9;
    v10 = &v13;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHLModifyTaskRecovery originalTask](self, "originalTask"));
    id v14 = v9;
    v10 = &v14;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 1LL));

  return (NSArray *)v12;
}

- (id)recoverTaskFromPartialError
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHLModifyTaskRecovery savedGroups](self, "savedGroups"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v3));

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLModifyTaskRecovery deletedIDs](self, "deletedIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHLModifyTaskRecovery originalTask](self, "originalTask"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 groupsToModify]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deletions]);
  [v6 intersectSet:v9];

  v10 = -[SHLLibraryBatch initWithInsertions:deletions:]( objc_alloc(&OBJC_CLASS___SHLLibraryBatch),  "initWithInsertions:deletions:",  v4,  v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHLModifyTaskRecovery savedTracks](self, "savedTracks"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHLModifyTaskRecovery deletedIDs](self, "deletedIDs"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v13));

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHLModifyTaskRecovery originalTask](self, "originalTask"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 tracksToModify]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 deletions]);
  [v14 intersectSet:v17];

  v18 = -[SHLLibraryBatch initWithInsertions:deletions:]( objc_alloc(&OBJC_CLASS___SHLLibraryBatch),  "initWithInsertions:deletions:",  v12,  v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SHLModifyTaskRecovery originalTask](self, "originalTask"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 groupsToModify]);
  objc_super v21 = (void *)objc_claimAutoreleasedReturnValue([v20 differenceOfBatch:v10]);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SHLModifyTaskRecovery originalTask](self, "originalTask"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 tracksToModify]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 differenceOfBatch:v18]);

  v25 = -[SHLSyncSessionModifyTask initWithTracksToModify:groupsToModify:]( objc_alloc(&OBJC_CLASS___SHLSyncSessionModifyTask),  "initWithTracksToModify:groupsToModify:",  v24,  v21);
  v28 = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));

  return v26;
}

- (id)recoverTaskFromLimitExceededError
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHLModifyTaskRecovery originalTask](self, "originalTask"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 subdivideTaskIntoBatchesOfSize:200]);

  return v3;
}

- (SHLSyncSessionModifyTask)originalTask
{
  return self->_originalTask;
}

- (void)setOriginalTask:(id)a3
{
}

- (NSArray)savedGroups
{
  return self->_savedGroups;
}

- (void)setSavedGroups:(id)a3
{
}

- (NSArray)savedTracks
{
  return self->_savedTracks;
}

- (void)setSavedTracks:(id)a3
{
}

- (NSArray)deletedIDs
{
  return self->_deletedIDs;
}

- (void)setDeletedIDs:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end