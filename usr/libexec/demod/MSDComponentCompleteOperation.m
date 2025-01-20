@interface MSDComponentCompleteOperation
- (int64_t)type;
- (void)execute;
@end

@implementation MSDComponentCompleteOperation

- (int64_t)type
{
  return 5LL;
}

- (void)execute
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](&OBJC_CLASS___MSDHelperAgent, "sharedInstance"));
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation component](self, "component"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedOperationContexts]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation component](self, "component"));
  v86 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation component](self, "component"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 errors]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

  unsigned int v11 = +[MSDOperationContext downloadOnly](&OBJC_CLASS___MSDOperationContext, "downloadOnly");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation component](self, "component"));
  unint64_t v13 = (unint64_t)[v12 result];

  v87 = v6;
  v85 = v10;
  if (!(_DWORD)v13)
  {
    id v16 = v10;
    goto LABEL_6;
  }

  if (v11)
  {
    if (+[MSDHubFeatureFlags disableBackgroundInstall](&OBJC_CLASS___MSDHubFeatureFlags, "disableBackgroundInstall"))
    {
      id v14 = 0LL;
      uint64_t v15 = 1LL;
      goto LABEL_55;
    }

    v83 = self;
    v84 = v3;
    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v99 = 0u;
    __int128 v100 = 0u;
    __int128 v101 = 0u;
    __int128 v102 = 0u;
    id v31 = v6;
    id v32 = [v31 countByEnumeratingWithState:&v99 objects:v107 count:16];
    if (v32)
    {
      id v33 = v32;
      unsigned int v82 = v13;
      uint64_t v34 = *(void *)v100;
      id obj = v31;
      while (2)
      {
        v35 = 0LL;
        do
        {
          if (*(void *)v100 != v34) {
            objc_enumerationMutation(obj);
          }
          v36 = *(void **)(*((void *)&v99 + 1) + 8LL * (void)v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue([v36 secondaryStagingRootPath]);
          if (v37 && ![v36 skipped])
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue([v36 uniqueName]);
            unsigned __int8 v40 = -[NSMutableSet containsObject:](v18, "containsObject:", v39);

            if ((v40 & 1) == 0)
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue([v36 secondaryStagingRootPath]);
              v42 = (void *)objc_claimAutoreleasedReturnValue([v36 stashedStagingRootPath]);
              unsigned __int8 v43 = [v88 moveStagingToFinal:v41 finalPath:v42];

              if ((v43 & 1) == 0)
              {
                id v63 = sub_10003A95C();
                v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
                if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
                  sub_10009FC04(v64, v66, v67, v68, v69, v70, v71, v72);
                }

                id v16 = 0LL;
                self = v83;
                v3 = v84;
                v6 = v87;
                goto LABEL_63;
              }
            }
          }

          else
          {
          }

          v38 = (void *)objc_claimAutoreleasedReturnValue([v36 uniqueName]);
          -[NSMutableSet addObject:](v18, "addObject:", v38);

          v35 = (char *)v35 + 1;
        }

        while (v33 != v35);
        id v31 = obj;
        id v44 = [obj countByEnumeratingWithState:&v99 objects:v107 count:16];
        id v33 = v44;
        if (v44) {
          continue;
        }
        break;
      }
    }

LABEL_41:
    id v14 = 0LL;
    uint64_t v15 = 1LL;
    v6 = v87;
    goto LABEL_42;
  }

  unsigned int v82 = v13;
  v83 = self;
  v84 = v3;
  v18 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  id v19 = v6;
  id v20 = [v19 countByEnumeratingWithState:&v95 objects:v106 count:16];
  if (!v20) {
    goto LABEL_23;
  }
  id v21 = v20;
  uint64_t v22 = *(void *)v96;
  do
  {
    for (i = 0LL; i != v21; i = (char *)i + 1)
    {
      if (*(void *)v96 != v22) {
        objc_enumerationMutation(v19);
      }
      v24 = *(void **)(*((void *)&v95 + 1) + 8LL * (void)i);
      uint64_t v25 = objc_claimAutoreleasedReturnValue([v24 secondaryStagingRootPath]);
      if (v25)
      {
        v26 = (void *)v25;
        if (![v24 skipped])
        {

LABEL_20:
          v28 = (void *)objc_claimAutoreleasedReturnValue([v24 secondaryStagingRootPath]);
          -[NSMutableSet addObject:](v18, "addObject:", v28);

          continue;
        }

        unsigned __int8 v27 = [v24 restored];

        if ((v27 & 1) != 0) {
          goto LABEL_20;
        }
      }
    }

    id v21 = [v19 countByEnumeratingWithState:&v95 objects:v106 count:16];
  }

  while (v21);
LABEL_23:

  if (!-[NSMutableSet count](v18, "count")) {
    goto LABEL_41;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v18, "allObjects"));
  unsigned __int8 v30 = [v88 moveStagingsToFinal:v29 finalPath:@"/private/var/demo_backup/.backup"];

  v6 = v87;
  if ((v30 & 1) != 0)
  {
    id v14 = 0LL;
    uint64_t v15 = 1LL;
    goto LABEL_42;
  }

  id v73 = sub_10003A95C();
  v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
  if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
    sub_10009FC38(v74, v75, v76, v77, v78, v79, v80, v81);
  }

  id v16 = 0LL;
  self = v83;
  v3 = v84;
LABEL_63:
  unint64_t v13 = v82;
LABEL_6:
  v83 = self;
  v84 = v3;
  id v94 = v16;
  sub_100087694(&v94, 3727744768LL, @"An error has occurred.");
  id v14 = v94;

  if ([v14 code] != (id)3727741184 && objc_msgSend(v14, "code") != (id)3727741185)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](&OBJC_CLASS___MSDDemoUpdateStatusHub, "sharedInstance"));
    [v17 demoUpdateFailed:v14];
  }

  v18 = (NSMutableSet *)objc_claimAutoreleasedReturnValue( +[MSDAnalyticsEventHandler sharedInstance]( &OBJC_CLASS___MSDAnalyticsEventHandler,  "sharedInstance"));
  -[NSMutableSet sendContentUpdateFailureEvent:isFatal:](v18, "sendContentUpdateFailureEvent:isFatal:", v14, v13);
  uint64_t v15 = 0LL;
LABEL_42:

  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  id v45 = v6;
  id v46 = [v45 countByEnumeratingWithState:&v90 objects:v105 count:16];
  if (v46)
  {
    id v47 = v46;
    uint64_t v48 = *(void *)v91;
    do
    {
      for (j = 0LL; j != v47; j = (char *)j + 1)
      {
        if (*(void *)v91 != v48) {
          objc_enumerationMutation(v45);
        }
        v50 = *(void **)(*((void *)&v90 + 1) + 8LL * (void)j);
        v51 = (void *)objc_claimAutoreleasedReturnValue([v50 stagingRootPath]);
        -[NSMutableSet addObject:](v4, "addObject:", v51);

        v52 = (void *)objc_claimAutoreleasedReturnValue([v50 secondaryStagingRootPath]);
        if (v52)
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue([v50 secondaryStagingRootPath]);
          -[NSMutableSet addObject:](v4, "addObject:", v53);
        }

        if ((v11 & 1) == 0)
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue([v50 stashedStagingRootPath]);

          if (v54)
          {
            v55 = (void *)objc_claimAutoreleasedReturnValue([v50 stashedStagingRootPath]);
            -[NSMutableSet addObject:](v4, "addObject:", v55);
          }
        }
      }

      id v47 = [v45 countByEnumeratingWithState:&v90 objects:v105 count:16];
    }

    while (v47);
  }

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v4, "allObjects"));
  [v88 removeWorkDirectories:v56];

  self = v83;
  v3 = v84;
LABEL_55:
  v57 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleInProgress]);
  [v57 updateComponentProgress:v86 withResult:v15 withAdditionalInfo:&__NSDictionary0__struct];

  v58 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleInProgress]);
  id v59 = [v58 getPercentageProgress];

  id v60 = sub_10003A95C();
  v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v104 = v59;
    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "New update progress: %ld", buf, 0xCu);
  }

  if ((v11 & 1) == 0)
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](&OBJC_CLASS___MSDDemoUpdateStatusHub, "sharedInstance"));
    [v62 demoUpdateProgress:v59];
  }

  -[MSDOperation setResult:](self, "setResult:", v15);
  -[MSDOperation setError:](self, "setError:", v14);
}

@end