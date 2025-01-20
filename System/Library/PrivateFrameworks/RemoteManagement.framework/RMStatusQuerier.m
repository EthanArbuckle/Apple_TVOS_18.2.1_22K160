@interface RMStatusQuerier
- (NSArray)statusPublishers;
- (RMStatusQuerier)init;
- (RMStatusQuerier)initWithStatusPublishers:(id)a3;
- (id)_findStatusPublishersForKeyPaths:(id)a3;
- (id)_queryForFilteredStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5;
- (id)queryForStatusWithKeyPaths:(id)a3 onBehalfOfManagementChannel:(id)a4;
- (id)queryForUnacknowledgedStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5;
@end

@implementation RMStatusQuerier

- (RMStatusQuerier)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[RMClientCapabilitiesController sharedController]( &OBJC_CLASS___RMClientCapabilitiesController,  "sharedController"));
  v10[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[RMInternalStatusPublisher sharedPublisher]( &OBJC_CLASS___RMInternalStatusPublisher,  "sharedPublisher"));
  v10[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));

  if (+[RMFeatureFlags isHTTPConduitEnabled](&OBJC_CLASS___RMFeatureFlags, "isHTTPConduitEnabled"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RMPushController sharedController](&OBJC_CLASS___RMPushController, "sharedController"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 arrayByAddingObject:v6]);

    v5 = (void *)v7;
  }

  v8 = -[RMStatusQuerier initWithStatusPublishers:](self, "initWithStatusPublishers:", v5);

  return v8;
}

- (RMStatusQuerier)initWithStatusPublishers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RMStatusQuerier;
  v5 = -[RMStatusQuerier init](&v9, "init");
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    statusPublishers = v5->_statusPublishers;
    v5->_statusPublishers = v6;
  }

  return v5;
}

- (id)_findStatusPublishersForKeyPaths:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[RMExternalStatusPublisher sharedPublisher]( &OBJC_CLASS___RMExternalStatusPublisher,  "sharedPublisher"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v5));

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusQuerier statusPublishers](self, "statusPublishers", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 supportedKeyPaths]);
        v14 = RMFilterSupportedKeyPathsByRequestedKeyPaths(v13, v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

        if ([v15 count]) {
          [v6 addObject:v12];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);
  }

  return v6;
}

- (id)queryForStatusWithKeyPaths:(id)a3 onBehalfOfManagementChannel:(id)a4
{
  return -[RMStatusQuerier _queryForFilteredStatusWithKeyPaths:lastAcknowledgedDateByKeyPath:onBehalfOfManagementChannel:]( self,  "_queryForFilteredStatusWithKeyPaths:lastAcknowledgedDateByKeyPath:onBehalfOfManagementChannel:",  a3,  0LL,  a4);
}

- (id)queryForUnacknowledgedStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5
{
  return -[RMStatusQuerier _queryForFilteredStatusWithKeyPaths:lastAcknowledgedDateByKeyPath:onBehalfOfManagementChannel:]( self,  "_queryForFilteredStatusWithKeyPaths:lastAcknowledgedDateByKeyPath:onBehalfOfManagementChannel:",  a3,  a4,  a5);
}

- (id)_queryForFilteredStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5
{
  id v92 = a3;
  id v93 = a4;
  id v90 = a5;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog statusQuerier](&OBJC_CLASS___RMLog, "statusQuerier"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10005DC74((uint64_t)v92, v8, v9, v10, v11, v12, v13, v14);
  }

  if (![v92 count])
  {
    v82 = objc_opt_new(&OBJC_CLASS___RMStatusQueryResult);
    goto LABEL_78;
  }

  v87 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v85 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusQuerier _findStatusPublishersForKeyPaths:](self, "_findStatusPublishersForKeyPaths:", v92));
  v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", v92));
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  id obj = v15;
  id v91 = [obj countByEnumeratingWithState:&v101 objects:v109 count:16];
  if (!v91) {
    goto LABEL_63;
  }
  uint64_t v88 = *(void *)v102;
  *(void *)&__int128 v16 = 138543362LL;
  __int128 v84 = v16;
  do
  {
    uint64_t v17 = 0LL;
    do
    {
      if (*(void *)v102 != v88)
      {
        uint64_t v18 = v17;
        objc_enumerationMutation(obj);
        uint64_t v17 = v18;
      }

      uint64_t v94 = v17;
      __int128 v19 = *(void **)(*((void *)&v101 + 1) + 8 * v17);
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "supportedKeyPaths", v84));
      v21 = RMFilterSupportedKeyPathsByRequestedKeyPaths(v20, v92);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

      [v89 minusSet:v22];
      id v23 = v22;
      v24 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
      __int128 v107 = 0u;
      __int128 v108 = 0u;
      __int128 v105 = 0u;
      __int128 v106 = 0u;
      id v98 = v23;
      id v25 = [v98 countByEnumeratingWithState:&v105 objects:buf count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v106;
        do
        {
          for (i = 0LL; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v106 != v26) {
              objc_enumerationMutation(v98);
            }
            id v28 = *(id *)(*((void *)&v105 + 1) + 8LL * (void)i);
            id v29 = [v28 rangeOfString:@"/"];
            if (v30)
            {
              v31 = (void *)objc_claimAutoreleasedReturnValue([v28 substringToIndex:v29]);

              if (v31)
              {
                -[NSMutableSet addObject:](v24, "addObject:", v31);

                continue;
              }
            }

            else
            {
            }

            -[NSMutableSet addObject:](v24, "addObject:", v28);
          }

          id v25 = [v98 countByEnumeratingWithState:&v105 objects:buf count:16];
        }

        while (v25);
      }

      if (v93)
      {
        uint64_t v99 = 0LL;
        v96 = (void *)objc_claimAutoreleasedReturnValue( [v19 queryForUnacknowledgedStatusWithKeyPaths:v24 lastAcknowledgedDateByKeyPath:v93 onBehalfOfManagementChannel:v90 error:&v99]);
        v32 = (id *)&v99;
      }

      else
      {
        uint64_t v100 = 0LL;
        v96 = (void *)objc_claimAutoreleasedReturnValue( [v19 queryForStatusWithKeyPaths:v24 onBehalfOfManagementChannel:v90 error:&v100]);
        v32 = (id *)&v100;
      }

      id v95 = *v32;
      if (v96)
      {
        v33 = v87;
        id v34 = v96;
        id v35 = v98;
        __int128 v105 = 0u;
        __int128 v106 = 0u;
        __int128 v107 = 0u;
        __int128 v108 = 0u;
        id v97 = v35;
        id v36 = [v97 countByEnumeratingWithState:&v105 objects:buf count:16];
        if (!v36) {
          goto LABEL_48;
        }
        uint64_t v37 = *(void *)v106;
        while (1)
        {
          for (j = 0LL; j != v36; j = (char *)j + 1)
          {
            if (*(void *)v106 != v37) {
              objc_enumerationMutation(v97);
            }
            id v39 = *(id *)(*((void *)&v105 + 1) + 8LL * (void)j);
            id v40 = [v39 rangeOfString:@"/"];
            if (v41)
            {
              v42 = (void *)objc_claimAutoreleasedReturnValue([v39 substringToIndex:v40]);

              if (v42)
              {
                sub_10002F938(v33, v42);
                v43 = (void *)objc_claimAutoreleasedReturnValue([v34 valueForKeyPath:v42]);
                v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKeyPath:](v33, "valueForKeyPath:", v42));
                uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSDictionary);
                if ((objc_opt_isKindOfClass(v44, v45) & 1) != 0)
                {
                  uint64_t v46 = objc_opt_class(&OBJC_CLASS___NSDictionary);
                  if ((objc_opt_isKindOfClass(v43, v46) & 1) != 0)
                  {
                    v47 = sub_10005D9C8(v44, v43);
                    uint64_t v48 = objc_claimAutoreleasedReturnValue(v47);

                    v43 = (void *)v48;
                    goto LABEL_44;
                  }
                }

                if (!v44)
                {
LABEL_44:
                  -[NSMutableDictionary setValue:forKeyPath:](v33, "setValue:forKeyPath:", v43, v42);
                  v44 = 0LL;
                }

                goto LABEL_46;
              }
            }

            else
            {
            }

            v49 = (void *)objc_claimAutoreleasedReturnValue([v39 pathExtension]);
            BOOL v50 = [v49 length] == 0;

            if (!v50)
            {
              v51 = (void *)objc_claimAutoreleasedReturnValue([v39 stringByDeletingPathExtension]);
              sub_10002F938(v33, v51);
            }

            v42 = (void *)objc_claimAutoreleasedReturnValue([v34 valueForKeyPath:v39]);
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKeyPath:](v33, "valueForKeyPath:", v39));
            uint64_t v52 = objc_opt_class(&OBJC_CLASS___NSDictionary);
            if ((objc_opt_isKindOfClass(v43, v52) & 1) != 0
              && (uint64_t v53 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v42, v53) & 1) != 0))
            {
              v54 = sub_10005D9C8(v43, v42);
              uint64_t v55 = objc_claimAutoreleasedReturnValue(v54);

              v42 = (void *)v55;
            }

            else if (v43)
            {
              goto LABEL_46;
            }

            -[NSMutableDictionary setValue:forKeyPath:](v33, "setValue:forKeyPath:", v42, v39);
            v43 = 0LL;
LABEL_46:
          }

          id v36 = [v97 countByEnumeratingWithState:&v105 objects:buf count:16];
          if (!v36)
          {
LABEL_48:

            goto LABEL_61;
          }
        }
      }

      v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog statusQuerier](&OBJC_CLASS___RMLog, "statusQuerier"));
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v84;
        id v111 = v95;
        _os_log_error_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_ERROR,  "Failed to query status: %{public}@",  buf,  0xCu);
      }

      v57 = v85;
      id v58 = v95;
      id v59 = v98;
      __int128 v105 = 0u;
      __int128 v106 = 0u;
      __int128 v107 = 0u;
      __int128 v108 = 0u;
      id v60 = [v59 countByEnumeratingWithState:&v105 objects:buf count:16];
      if (v60)
      {
        uint64_t v61 = *(void *)v106;
        do
        {
          for (k = 0LL; k != v60; k = (char *)k + 1)
          {
            if (*(void *)v106 != v61) {
              objc_enumerationMutation(v59);
            }
            uint64_t v63 = *(void *)(*((void *)&v105 + 1) + 8LL * (void)k);
            v64 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v57, "objectForKeyedSubscript:", v63));
            BOOL v65 = v64 == 0LL;

            if (v65) {
              -[NSMutableDictionary setObject:forKeyedSubscript:](v57, "setObject:forKeyedSubscript:", v58, v63);
            }
          }

          id v60 = [v59 countByEnumeratingWithState:&v105 objects:buf count:16];
        }

        while (v60);
      }

LABEL_61:
      uint64_t v17 = v94 + 1;
    }

    while ((id)(v94 + 1) != v91);
    id v91 = [obj countByEnumeratingWithState:&v101 objects:v109 count:16];
  }

  while (v91);
LABEL_63:

  if ([v89 count])
  {
    v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog statusQuerier](&OBJC_CLASS___RMLog, "statusQuerier"));
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
      sub_10005DC0C((uint64_t)v89, v66, v67, v68, v69, v70, v71, v72);
    }

    v73 = v85;
    id v74 = v89;
    __int128 v105 = 0u;
    __int128 v106 = 0u;
    __int128 v107 = 0u;
    __int128 v108 = 0u;
    id v75 = [v74 countByEnumeratingWithState:&v105 objects:buf count:16];
    if (v75)
    {
      uint64_t v76 = *(void *)v106;
      do
      {
        for (m = 0LL; m != v75; m = (char *)m + 1)
        {
          if (*(void *)v106 != v76) {
            objc_enumerationMutation(v74);
          }
          uint64_t v78 = *(void *)(*((void *)&v105 + 1) + 8LL * (void)m);
          v79 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v73, "objectForKeyedSubscript:", v78));
          BOOL v80 = v79 == 0LL;

          if (v80)
          {
            v81 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createUnsupportedStatusValueErrorWithKeyPath:]( &OBJC_CLASS___RMErrorUtilities,  "createUnsupportedStatusValueErrorWithKeyPath:",  v78));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v73, "setObject:forKeyedSubscript:", v81, v78);
          }
        }

        id v75 = [v74 countByEnumeratingWithState:&v105 objects:buf count:16];
      }

      while (v75);
    }
  }

  v82 = -[RMStatusQueryResult initWithStatusKeyPaths:statusByKeyPath:errorByKeyPath:]( objc_alloc(&OBJC_CLASS___RMStatusQueryResult),  "initWithStatusKeyPaths:statusByKeyPath:errorByKeyPath:",  v92,  v87,  v85);

LABEL_78:
  return v82;
}

- (NSArray)statusPublishers
{
  return self->_statusPublishers;
}

- (void).cxx_destruct
{
}

@end