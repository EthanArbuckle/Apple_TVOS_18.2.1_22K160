@interface PBPreventProcessLaunchMonitor
- (BOOL)terminationAssertionInEffectForProcessWithBundleIdentifier:(id)a3;
- (NSMutableSet)filteredPreventLaunchBundleIDs;
- (NSSet)preventLaunchBundleIDs;
- (PBPreventProcessLaunchMonitor)init;
- (PBPreventProcessLaunchMonitor)initWithProcessMonitor:(id)a3 processFilter:(id)a4;
- (PBPreventProcessLaunchMonitorDelegate)delegate;
- (RBSProcessMonitor)processMonitor;
- (void)_handlePreventLaunchUpdate:(id)a3;
- (void)_main_handlePreventLaunchUpdate:(id)a3;
- (void)invalidate;
- (void)setDelegate:(id)a3;
@end

@implementation PBPreventProcessLaunchMonitor

- (PBPreventProcessLaunchMonitor)initWithProcessMonitor:(id)a3 processFilter:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  Class v11 = NSClassFromString(@"RBSProcessMonitor");
  if (!v10)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028FD44(a2);
    }
LABEL_11:
    _bs_set_crash_log_message([v20 UTF8String]);
    __break(0);
    JUMPOUT(0x1001D25A4LL);
  }

  if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:RBSProcessMonitorClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028FDEC(a2);
    }
    goto LABEL_11;
  }

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___PBPreventProcessLaunchMonitor;
  v12 = -[PBPreventProcessLaunchMonitor init](&v24, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_processMonitor, a3);
    objc_initWeak(&location, v13);
    processMonitor = v13->_processMonitor;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1001D262C;
    v21[3] = &unk_1003D31E0;
    objc_copyWeak(&v22, &location);
    -[RBSProcessMonitor updateConfiguration:](processMonitor, "updateConfiguration:", v21);
    id v15 = objc_retainBlock(v9);
    id processFilter = v13->_processFilter;
    v13->_id processFilter = v15;

    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    filteredPreventLaunchBundleIDs = v13->_filteredPreventLaunchBundleIDs;
    v13->_filteredPreventLaunchBundleIDs = v17;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (PBPreventProcessLaunchMonitor)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessMonitor monitor](&OBJC_CLASS___RBSProcessMonitor, "monitor"));
  v4 = -[PBPreventProcessLaunchMonitor initWithProcessMonitor:processFilter:]( self,  "initWithProcessMonitor:processFilter:",  v3,  &stru_1003DBFF8);

  return v4;
}

- (BOOL)terminationAssertionInEffectForProcessWithBundleIdentifier:(id)a3
{
  return -[NSSet containsObject:](self->_preventLaunchBundleIDs, "containsObject:", a3);
}

- (void)invalidate
{
}

- (void)_handlePreventLaunchUpdate:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertNotMain();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001D2894;
  v6[3] = &unk_1003CFEB8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(&_dispatch_main_q, v6);
}

- (void)_main_handlePreventLaunchUpdate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v40;
    *(void *)&__int128 v8 = 138543362LL;
    __int128 v34 = v8;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(id *)(*((void *)&v39 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);
        v14 = v13;
        if (v13)
        {
          id v15 = v13;
        }

        else
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue([v12 processIdentity]);
          id v15 = (id)objc_claimAutoreleasedReturnValue([v16 embeddedApplicationIdentifier]);
        }

        if (v15)
        {
          -[NSMutableSet addObject:](v5, "addObject:", v15);
        }

        else
        {
          id v17 = sub_1000F73FC();
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v34;
            id v45 = v12;
            _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Could not find bundleIdentifier for predicate: %{public}@",  buf,  0xCu);
          }
        }
      }

      id v9 = [v6 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }

    while (v9);
  }

  if (v5)
  {
    id v19 = -[NSMutableSet mutableCopy](v5, "mutableCopy");
    v20 = &MRMediaRemoteGetActivePlayerPathsForOrigin_ptr;
  }

  else
  {
    v20 = &MRMediaRemoteGetActivePlayerPathsForOrigin_ptr;
    id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  }

  objc_msgSend(v19, "minusSet:", self->_preventLaunchBundleIDs, v34);
  preventLaunchBundleIDs = self->_preventLaunchBundleIDs;
  if (preventLaunchBundleIDs) {
    id v22 = -[NSSet mutableCopy](preventLaunchBundleIDs, "mutableCopy");
  }
  else {
    id v22 = (id)objc_claimAutoreleasedReturnValue([v20[279] set]);
  }
  v23 = v20;
  objc_super v24 = v22;
  [v22 minusSet:v5];
  objc_storeStrong((id *)&self->_preventLaunchBundleIDs, v5);
  id v25 = objc_msgSend( objc_alloc((Class)v23[279]),  "initWithCapacity:",  -[NSMutableSet count](self->_filteredPreventLaunchBundleIDs, "count"));
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v26 = v24;
  id v27 = [v26 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v36;
    do
    {
      for (j = 0LL; j != v28; j = (char *)j + 1)
      {
        if (*(void *)v36 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)j);
        if (-[NSMutableSet containsObject:]( self->_filteredPreventLaunchBundleIDs,  "containsObject:",  v31))
        {
          -[NSMutableSet removeObject:](self->_filteredPreventLaunchBundleIDs, "removeObject:", v31);
          [v25 addObject:v31];
        }
      }

      id v28 = [v26 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }

    while (v28);
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bs_filter:", self->_processFilter));
  -[NSMutableSet unionSet:](self->_filteredPreventLaunchBundleIDs, "unionSet:", v32);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained preventProcessLaunchMonitor:self updatedBundleIDsAdding:v32 removing:v25];
}

- (PBPreventProcessLaunchMonitorDelegate)delegate
{
  return (PBPreventProcessLaunchMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (RBSProcessMonitor)processMonitor
{
  return self->_processMonitor;
}

- (NSSet)preventLaunchBundleIDs
{
  return self->_preventLaunchBundleIDs;
}

- (NSMutableSet)filteredPreventLaunchBundleIDs
{
  return self->_filteredPreventLaunchBundleIDs;
}

- (void).cxx_destruct
{
}

  ;
}

@end