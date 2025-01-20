@interface PBScenePresenter
- (NSMutableDictionary)_scenePresenters;
- (PBScenePresenter)init;
- (id)presentationViewForElement:(id)a3;
- (id)snapshotPresentationViewForElement:(id)a3;
- (void)invalidatePresentationForElement:(id)a3;
@end

@implementation PBScenePresenter

- (PBScenePresenter)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBScenePresenter;
  v2 = -[PBScenePresenter init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    scenePresenters = v2->_scenePresenters;
    v2->_scenePresenters = v3;
  }

  return v2;
}

- (id)presentationViewForElement:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBScenePresenter _scenePresenters](self, "_scenePresenters"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v6]);
  v8 = v7;
  if (v7) {
    v9 = v7;
  }
  else {
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  v10 = v9;

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  v11 = v10;
  id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v43,  v51,  16LL);
  if (!v12)
  {

LABEL_16:
    v14 = -[_PBScenePresentation initWithLayoutElement:]( objc_alloc(&OBJC_CLASS____PBScenePresentation),  "initWithLayoutElement:",  v4);
    -[NSMutableArray addObject:](v11, "addObject:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PBScenePresenter _scenePresenters](self, "_scenePresenters"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    [v19 setObject:v11 forKey:v20];

    id v21 = sub_100083C30();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[PBScenePresenter presentationViewForElement:]";
      __int16 v49 = 2114;
      v50 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s - Tracking new presentation: %{public}@",  buf,  0x16u);
    }

    goto LABEL_19;
  }

  id v13 = v12;
  v14 = 0LL;
  uint64_t v15 = *(void *)v44;
  do
  {
    for (i = 0LL; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v44 != v15) {
        objc_enumerationMutation(v11);
      }
      v17 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
      if ([v17 matchesElement:v4])
      {
        v18 = v17;

        v14 = v18;
      }
    }

    id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v43,  v51,  16LL);
  }

  while (v13);

  if (!v14) {
    goto LABEL_16;
  }
LABEL_19:
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingSelector:](v11, "sortedArrayUsingSelector:", "compare:"));
  v24 = [v23 indexOfObject:v14];
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[_PBScenePresentation scenePresenter](v14, "scenePresenter"));
  unsigned __int8 v26 = [v25 isActive];

  if (v24 != (char *)[v23 count] - 1)
  {
    unint64_t v35 = (unint64_t)(v24 + 1);
    while (v35 < (unint64_t)[v23 count])
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndex:v35]);
      v37 = (void *)objc_claimAutoreleasedReturnValue([v36 scenePresenter]);
      unsigned __int8 v38 = [v37 isActive];

      ++v35;
      if ((v38 & 1) != 0)
      {
        +[UIWindow _synchronizeDrawing](&OBJC_CLASS___UIWindow, "_synchronizeDrawing");
        goto LABEL_34;
      }
    }
  }

  +[UIWindow _synchronizeDrawing](&OBJC_CLASS___UIWindow, "_synchronizeDrawing");
  if ((v26 & 1) == 0)
  {
    if (v24 && (uint64_t)(v24 - 1) >= 0)
    {
      *(void *)&__int128 v27 = 136315394LL;
      __int128 v42 = v27;
      do
      {
        v28 = (_PBScenePresentation *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndex:", --v24, v42, (void)v43));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[_PBScenePresentation scenePresenter](v28, "scenePresenter"));
        [v29 deactivate];

        id v30 = sub_100083C30();
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v42;
          v48 = "-[PBScenePresenter presentationViewForElement:]";
          __int16 v49 = 2114;
          v50 = v28;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%s - Deactivated presentation (higher level to show): %{public}@",  buf,  0x16u);
        }
      }

      while ((uint64_t)v24 > 0);
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[_PBScenePresentation scenePresenter](v14, "scenePresenter"));
    [v32 activate];

    id v33 = sub_100083C30();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[PBScenePresenter presentationViewForElement:]";
      __int16 v49 = 2114;
      v50 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "%s - Activated new presentation: %{public}@",  buf,  0x16u);
    }
  }

- (id)snapshotPresentationViewForElement:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBScenePresenter _scenePresenters](self, "_scenePresenters"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v6]);
  v8 = v7;
  if (v7) {
    v9 = v7;
  }
  else {
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  v10 = v9;

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  v11 = v10;
  id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v23,  v31,  16LL);
  if (v12)
  {
    id v13 = v12;
    v14 = 0LL;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        if (objc_msgSend(v17, "matchesElement:", v4, (void)v23))
        {
          id v18 = v17;

          v14 = v18;
        }
      }

      id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v23,  v31,  16LL);
    }

    while (v13);

    if (v14)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v14 scenePresenter]);
      id v20 = [v19 newSnapshotPresentationView];
      goto LABEL_19;
    }
  }

  else
  {
  }

  id v21 = sub_100083C30();
  v19 = (void *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[PBScenePresenter snapshotPresentationViewForElement:]";
    __int16 v29 = 2112;
    id v30 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_DEFAULT,  "%s - No presentation tracking: %@",  buf,  0x16u);
  }

  v14 = 0LL;
  id v20 = 0LL;
LABEL_19:

  return v20;
}

- (void)invalidatePresentationForElement:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBScenePresenter _scenePresenters](self, "_scenePresenters"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v6]);
  v8 = v7;
  if (v7) {
    v9 = v7;
  }
  else {
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  v10 = v9;

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  v11 = v10;
  id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v30,  v38,  16LL);
  id v13 = v11;
  if (!v12)
  {
LABEL_23:

    goto LABEL_24;
  }

  id v14 = v12;
  id v13 = 0LL;
  uint64_t v15 = *(void *)v31;
  do
  {
    for (i = 0LL; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v31 != v15) {
        objc_enumerationMutation(v11);
      }
      v17 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
      if (objc_msgSend(v17, "matchesElement:", v4, (void)v30))
      {
        id v18 = v17;

        id v13 = v18;
      }
    }

    id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v30,  v38,  16LL);
  }

  while (v14);

  if (v13)
  {
    +[UIWindow _synchronizeDrawing](&OBJC_CLASS___UIWindow, "_synchronizeDrawing");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray scenePresenter](v13, "scenePresenter"));
    [v19 invalidate];

    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingSelector:](v11, "sortedArrayUsingSelector:", "compare:"));
    id v21 = (char *)[v20 indexOfObject:v13];
    if (v21)
    {
      v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v20 objectAtIndex:v21 - 1]);
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray scenePresenter](v22, "scenePresenter"));
      [v23 activate];

      id v24 = sub_100083C30();
      __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        unint64_t v35 = "-[PBScenePresenter invalidatePresentationForElement:]";
        __int16 v36 = 2114;
        v37 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s - Activated presentation (higher level invalidated): %{public}@",  buf,  0x16u);
      }
    }

    id v26 = sub_100083C30();
    __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v35 = "-[PBScenePresenter invalidatePresentationForElement:]";
      __int16 v36 = 2114;
      v37 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%s - Untracking presentation: %{public}@",  buf,  0x16u);
    }

    -[NSMutableArray removeObject:](v11, "removeObject:", v13);
    if (!-[NSMutableArray count](v11, "count"))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[PBScenePresenter _scenePresenters](self, "_scenePresenters"));
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      [v28 removeObjectForKey:v29];
    }

    goto LABEL_23;
  }

- (NSMutableDictionary)_scenePresenters
{
  return self->_scenePresenters;
}

- (void).cxx_destruct
{
}

@end