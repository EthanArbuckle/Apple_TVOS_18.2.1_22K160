@interface _PBSerialTransactionManagerPolicyForegroundOpenApp
- (id)resultingQueueAfterAddingTransaction:(id)a3 inCurrentQueue:(id)a4;
- (int64_t)actionOnRunningTransaction:(id)a3 afterAddingTransaction:(id)a4;
@end

@implementation _PBSerialTransactionManagerPolicyForegroundOpenApp

- (int64_t)actionOnRunningTransaction:(id)a3 afterAddingTransaction:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___PBOpenAppTransition);
  id v8 = v5;
  v9 = v8;
  if (v7)
  {
    if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0) {
      v10 = v9;
    }
    else {
      v10 = 0LL;
    }
  }

  else
  {
    v10 = 0LL;
  }

  id v11 = v10;

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___PBOpenAppTransition);
  id v13 = v6;
  v14 = v13;
  if (v12)
  {
    if ((objc_opt_isKindOfClass(v13, v12) & 1) != 0) {
      v15 = v14;
    }
    else {
      v15 = 0LL;
    }
  }

  else
  {
    v15 = 0LL;
  }

  id v16 = v15;

  if ([v11 isAnimating])
  {
    if ([v11 isResigning])
    {
      int64_t v17 = 0LL;
    }

    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v11 openRequest]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 fromSceneIdentity]);
      unsigned int v20 = objc_msgSend(v19, "pb_isDefaultKioskAppSceneIdentity");

      v21 = (void *)objc_claimAutoreleasedReturnValue([v16 openRequest]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 toSceneIdentity]);
      unsigned int v23 = objc_msgSend(v22, "pb_isDefaultKioskAppSceneIdentity");

      v24 = (void *)objc_claimAutoreleasedReturnValue([v16 openRequest]);
      LODWORD(v22) = [v24 isLaunchedByDeactivation];

      int64_t v17 = v20 & v23 & v22;
    }
  }

  else
  {
    int64_t v17 = 1LL;
  }

  return v17;
}

- (id)resultingQueueAfterAddingTransaction:(id)a3 inCurrentQueue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = FBSOpenApplicationErrorCreate(6LL, @"%@");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v9 = v6;
  id v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16, @"Newer Transition");
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * (void)v13) _callFrontBoardCompletionIfNeededWithError:v8];
        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }

    while (v11);
  }

  id v20 = v5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));

  return v14;
}

@end