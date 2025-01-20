@interface RMSubscribedStatusKeyPathUpdater
+ (RMSubscribedStatusKeyPathUpdater)sharedUpdater;
- (BOOL)_updateSubscribedStatusKeyPathsWithFetchPredicate:(id)a3;
- (BOOL)notifyStatusDidChangeForDeclarations;
- (BOOL)notifyStatusDidChangeForKeyPath:(id)a3;
- (BOOL)notifyStatusDidChangeForKeyPaths:(id)a3;
- (BOOL)notifyStatusDidChangeForKeyPaths:(id)a3 managementSourceIdentifier:(id)a4;
- (BOOL)notifyStatusDidChangeForKeyPathsByManagementSourceObjectID:(id)a3;
- (NSPersistentContainer)persistentContainer;
- (RMSubscribedStatusKeyPathUpdater)initWithPersistentContainer:(id)a3;
- (void)setPersistentContainer:(id)a3;
@end

@implementation RMSubscribedStatusKeyPathUpdater

+ (RMSubscribedStatusKeyPathUpdater)sharedUpdater
{
  if (qword_1000CF418 != -1) {
    dispatch_once(&qword_1000CF418, &stru_1000BB0C0);
  }
  return (RMSubscribedStatusKeyPathUpdater *)(id)qword_1000CF410;
}

- (RMSubscribedStatusKeyPathUpdater)initWithPersistentContainer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RMSubscribedStatusKeyPathUpdater;
  v6 = -[RMSubscribedStatusKeyPathUpdater init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_persistentContainer, a3);
  }

  return v7;
}

- (BOOL)notifyStatusDidChangeForDeclarations
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", RMModelStatusItemManagementDeclarations));
  LOBYTE(self) = -[RMSubscribedStatusKeyPathUpdater notifyStatusDidChangeForKeyPaths:]( self,  "notifyStatusDidChangeForKeyPaths:",  v3);

  return (char)self;
}

- (BOOL)notifyStatusDidChangeForKeyPath:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", a3));
  LOBYTE(self) = -[RMSubscribedStatusKeyPathUpdater notifyStatusDidChangeForKeyPaths:]( self,  "notifyStatusDidChangeForKeyPaths:",  v4);

  return (char)self;
}

- (BOOL)notifyStatusDidChangeForKeyPaths:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v39;
    do
    {
      objc_super v9 = 0LL;
      do
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v38 + 1) + 8LL * (void)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pathExtension]);
        id v12 = [v11 length];

        if (v12)
        {
          while ((-[NSMutableSet containsObject:](v4, "containsObject:", v10) & 1) == 0)
          {
            -[NSMutableSet addObject:](v4, "addObject:", v10);
            v13 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByDeletingPathExtension]);

            v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pathExtension]);
            id v15 = [v14 length];

            id v10 = v13;
            if (!v15) {
              goto LABEL_11;
            }
          }
        }

        v13 = v10;
LABEL_11:
        -[NSMutableSet addObject:](v4, "addObject:", v13);

        objc_super v9 = (char *)v9 + 1;
      }

      while (v9 != v7);
      id v7 = [v5 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }

    while (v7);
  }

  v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K IN %@",  @"keyPath",  v4));
  id v16 = v5;
  v17 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v18 = v16;
  id v19 = [v18 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v39;
    do
    {
      v22 = 0LL;
      do
      {
        if (*(void *)v39 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v38 + 1) + 8 * (void)v22) stringByAppendingString:@"."]);
        -[NSMutableSet addObject:](v17, "addObject:", v23);

        v22 = (char *)v22 + 1;
      }

      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }

    while (v20);
  }

  v24 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  v25 = v17;
  id v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v38,  v42,  16LL);
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v39;
    do
    {
      v29 = 0LL;
      do
      {
        if (*(void *)v39 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K BEGINSWITH %@",  @"keyPath",  *(void *)(*((void *)&v38 + 1) + 8LL * (void)v29)));
        -[NSMutableArray addObject:](v24, "addObject:", v30);

        v29 = (char *)v29 + 1;
      }

      while (v27 != v29);
      id v27 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v38,  v42,  16LL);
    }

    while (v27);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate orPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "orPredicateWithSubpredicates:",  v24));
  v42[0] = v36;
  v42[1] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v42, 2LL));
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate orPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "orPredicateWithSubpredicates:",  v32));

  BOOL v34 = -[RMSubscribedStatusKeyPathUpdater _updateSubscribedStatusKeyPathsWithFetchPredicate:]( self,  "_updateSubscribedStatusKeyPathsWithFetchPredicate:",  v33);
  return v34;
}

- (BOOL)notifyStatusDidChangeForKeyPathsByManagementSourceObjectID:(id)a3
{
  id v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10007C83C;
  v8[3] = &unk_1000BB0E8;
  objc_super v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v5 = v9;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate orPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "orPredicateWithSubpredicates:",  v5));
  LOBYTE(self) = -[RMSubscribedStatusKeyPathUpdater _updateSubscribedStatusKeyPathsWithFetchPredicate:]( self,  "_updateSubscribedStatusKeyPathsWithFetchPredicate:",  v6);

  return (char)self;
}

- (BOOL)notifyStatusDidChangeForKeyPaths:(id)a3 managementSourceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K == %@",  @"managementSource.identifier",  a4));
  id v8 = v6;
  objc_super v9 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(id *)(*((void *)&v26 + 1) + 8LL * (void)v14);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 pathExtension]);
        id v17 = [v16 length];

        if (v17)
        {
          while ((-[NSMutableSet containsObject:](v9, "containsObject:", v15) & 1) == 0)
          {
            -[NSMutableSet addObject:](v9, "addObject:", v15);
            id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByDeletingPathExtension]);

            id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 pathExtension]);
            id v20 = [v19 length];

            id v15 = v18;
            if (!v20) {
              goto LABEL_11;
            }
          }
        }

        id v18 = v15;
LABEL_11:
        -[NSMutableSet addObject:](v9, "addObject:", v18);

        v14 = (char *)v14 + 1;
      }

      while (v14 != v12);
      id v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v12);
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K IN %@",  @"keyPath",  v9,  (void)v26));
  v30[0] = v7;
  v30[1] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL));
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v22));

  BOOL v24 = -[RMSubscribedStatusKeyPathUpdater _updateSubscribedStatusKeyPathsWithFetchPredicate:]( self,  "_updateSubscribedStatusKeyPathsWithFetchPredicate:",  v23);
  return v24;
}

- (BOOL)_updateSubscribedStatusKeyPathsWithFetchPredicate:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMSubscribedStatusKeyPathUpdater persistentContainer](self, "persistentContainer"));
  id v7 = [v6 newBackgroundContext];

  [v7 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_10007C590;
  id v18 = &unk_1000B9A00;
  id v8 = v4;
  id v19 = v8;
  objc_super v9 = v5;
  id v20 = v9;
  id v10 = v7;
  id v21 = v10;
  [v10 performBlockAndWait:&v15];
  id v11 = -[NSMutableSet count](v9, "count", v15, v16, v17, v18);
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v22 = @"RMUserInfoKeyUpdatedManagementSourceObjectIDs";
    v23 = v9;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    [v12 postNotificationName:@"RMSubscribedStatusKeyPathDidChangeNotification" object:self userInfo:v13];
  }

  return v11 != 0LL;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setPersistentContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end