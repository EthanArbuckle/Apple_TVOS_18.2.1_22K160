@interface InProgressAssetQuery
+ (void)currentInProgressAssetIDs:(id *)a3 restoringAssetIDs:(id *)a4;
- (BOOL)_fetchResults;
- (InProgressAssetQuery)init;
- (id)_inProgressAssetIDs;
- (id)_restoringAssetIDs;
- (void)applicationInstallsArePrioritized:(id)a3 arePaused:(id)a4;
- (void)dealloc;
@end

@implementation InProgressAssetQuery

+ (void)currentInProgressAssetIDs:(id *)a3 restoringAssetIDs:(id *)a4
{
  *a3 = 0LL;
  *a4 = 0LL;
  v7 = objc_alloc_init(&OBJC_CLASS___InProgressAssetQuery);
  id v6 = +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
  [v6 addObserver:v7];
  if (-[InProgressAssetQuery _fetchResults](v7, "_fetchResults"))
  {
    *a3 = -[InProgressAssetQuery _inProgressAssetIDs](v7, "_inProgressAssetIDs");
    *a4 = -[InProgressAssetQuery _restoringAssetIDs](v7, "_restoringAssetIDs");
  }

  [v6 removeObserver:v7];
}

- (InProgressAssetQuery)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___InProgressAssetQuery;
  v2 = -[InProgressAssetQuery init](&v4, "init");
  if (v2) {
    v2->_waitForInitialObservationData = (OS_dispatch_semaphore *)dispatch_semaphore_create(0LL);
  }
  return v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_waitForInitialObservationData);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___InProgressAssetQuery;
  -[InProgressAssetQuery dealloc](&v3, "dealloc");
}

- (id)_inProgressAssetIDs
{
  return self->_inProgressAssetIDs;
}

- (id)_restoringAssetIDs
{
  return self->_restoringAssetIDs;
}

- (BOOL)_fetchResults
{
  objc_super v3 = (os_log_s *)_ATLogCategorySyncBundle(self, a2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "Waiting for -applicationInstallsArePrioritized:arePaused: to complete...",  buf,  2u);
  }

  uint64_t v4 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_waitForInitialObservationData, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (os_log_s *)_ATLogCategorySyncBundle(v4, v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = 0;
      v8 = "Query for in progress assets timed out";
      v9 = (uint8_t *)&v14;
      v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
LABEL_8:
      _os_log_impl(&dword_0, v10, v11, v8, v9, 2u);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = 0;
    v8 = "Wait completed";
    v9 = (uint8_t *)&v13;
    v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_8;
  }

  return v4 == 0;
}

- (void)applicationInstallsArePrioritized:(id)a3 arePaused:(id)a4
{
  id v6 = self;
  v7 = (os_log_s *)_ATLogCategorySyncBundle_Oversize(self, a2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v48 = a3;
    __int16 v49 = 2114;
    id v50 = a4;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "prioritized proxies %{public}@ paused proxies %{public}@",  buf,  0x16u);
  }

  if (!v6->_inProgressAssetIDs)
  {
    v6->_inProgressAssetIDs = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  0LL);
    v6->_restoringAssetIDs = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  0LL);
    if ([a3 count])
    {
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      id v9 = [a3 countByEnumeratingWithState:&v43 objects:v55 count:16];
      if (!v9) {
        goto LABEL_54;
      }
      id v11 = v9;
      uint64_t v12 = *(void *)v44;
      v41 = v6;
      while (1)
      {
        __int16 v13 = 0LL;
        id v42 = v11;
        do
        {
          if (*(void *)v44 != v12) {
            objc_enumerationMutation(a3);
          }
          __int16 v14 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)v13);
          id v15 = [v14 applicationIdentifier];
          id v16 = [v14 isPlaceholder];
          if (!(_DWORD)v16)
          {
            v29 = (os_log_s *)_ATLogCategorySyncBundle(v16, v17);
            if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_49;
            }
            *(_DWORD *)buf = 138543362;
            id v48 = v15;
            v30 = v29;
            v31 = "No placeholder for asset identifier %{public}@";
LABEL_20:
            _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, v31, buf, 0xCu);
            goto LABEL_49;
          }

          id v18 = [v14 installProgressSync];
          if (!v18)
          {
            v32 = (os_log_s *)_ATLogCategorySyncBundle(0LL, v19);
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_49;
            }
            *(_DWORD *)buf = 138543362;
            id v48 = v15;
            v30 = v32;
            v31 = "No install progress found for asset identifier %{public}@";
            goto LABEL_20;
          }

          v20 = v18;
          uint64_t v21 = v12;
          id v22 = a3;
          unint64_t v23 = (unint64_t)[v14 installType];
          v24 = (char *)[v20 installState];
          v25 = (char *)[v20 installPhase];
          v27 = (os_log_s *)_ATLogCategorySyncBundle(v25, v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            if (v23 < 0xA && ((0x2FFu >> v23) & 1) != 0) {
              v28 = (NSString *)*(&off_18678 + v23);
            }
            else {
              v28 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown Install Type: %lu",  v23);
            }
            if ((unint64_t)v24 >= 6) {
              v33 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown Install State: %lu",  v24);
            }
            else {
              v33 = (NSString *)*(&off_186C8 + (void)v24);
            }
            if ((unint64_t)v25 >= 4) {
              v34 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown Install Phase: %lu",  v25);
            }
            else {
              v34 = (NSString *)*(&off_186F8 + (void)v25);
            }
            *(_DWORD *)buf = 138544130;
            id v48 = v28;
            __int16 v49 = 2114;
            id v50 = v33;
            __int16 v51 = 2114;
            v52 = v34;
            __int16 v53 = 2114;
            id v54 = v15;
            _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_DEFAULT,  "Got install type=%{public}@ state=%{public}@ phase=%{public}@ for %{public}@",  buf,  0x2Au);
            id v6 = v41;
          }

          BOOL v36 = v24 != (_BYTE *)&dword_0 + 1 || v25 != (_BYTE *)&dword_0 + 1 || v23 == 2;
          if (!v36
            || (v24 == (_BYTE *)&dword_0 + 1 ? (BOOL v37 = v25 == 0LL) : (BOOL v37 = 0), v37 ? (v38 = v23 == 1) : (v38 = 0), v38))
          {
            -[NSMutableArray addObject:](v6->_inProgressAssetIDs, "addObject:", v15);
            a3 = v22;
            uint64_t v12 = v21;
            id v11 = v42;
          }

          else
          {
            a3 = v22;
            uint64_t v12 = v21;
            id v11 = v42;
          }

@end