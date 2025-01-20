@interface DMDEngineUpdateDeclarationsOperation
- (DMFUpdateDeclarationsRequest)request;
- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation DMDEngineUpdateDeclarationsOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineUpdateDeclarationsOperation request](self, "request"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 organizationIdentifier]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[DMDDeclarationPayloadMetadata fetchRequestForFailedDeclarationsFromOrganizationWithIdentifier:]( &OBJC_CLASS___DMDDeclarationPayloadMetadata,  "fetchRequestForFailedDeclarationsFromOrganizationWithIdentifier:",  v6));

  id v129 = 0LL;
  v99 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 executeFetchRequest:v7 error:&v129]);
  id v9 = v129;
  __int128 v125 = 0u;
  __int128 v126 = 0u;
  __int128 v127 = 0u;
  __int128 v128 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v125 objects:v136 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v126;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v126 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v125 + 1) + 8 * (void)i) setFailed:0];
      }

      id v12 = [v10 countByEnumeratingWithState:&v125 objects:v136 count:16];
    }

    while (v12);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineUpdateDeclarationsOperation request](self, "request"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 removeDeclarations]);

  id v103 = v10;
  v94 = self;
  if ([v16 count])
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 valueForKey:DMFDeclarationPayloadIdentifierKey]);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"self != %@",  v18));
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v17 filteredArrayUsingPredicate:v19]);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineUpdateDeclarationsOperation request](self, "request"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 organizationIdentifier]);
    v95 = (void *)v20;
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[DMDDeclarationPayloadMetadata fetchRequestForDeclarationsFromOrganizationWithIdentifier:withIdentifiers:]( &OBJC_CLASS___DMDDeclarationPayloadMetadata,  "fetchRequestForDeclarationsFromOrganizationWithIdentifier:withIdentifiers:",  v22,  v20));

    id v124 = v9;
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 execute:&v124]);
    id v92 = v124;

    if (!v24)
    {
      uint64_t v77 = DMFConfigurationEngineLog(v25);
      v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
        sub_100064B2C(v92);
      }

      -[DMDEngineUpdateDeclarationsOperation setError:](v94, "setError:", v92);
      id v34 = v92;
      v36 = (void *)v20;
      goto LABEL_70;
    }

    v89 = v7;
    v91 = v16;
    __int128 v122 = 0u;
    __int128 v123 = 0u;
    __int128 v120 = 0u;
    __int128 v121 = 0u;
    id v26 = v24;
    id v27 = [v26 countByEnumeratingWithState:&v120 objects:v135 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v121;
      do
      {
        v30 = 0LL;
        do
        {
          if (*(void *)v121 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = *(void **)(*((void *)&v120 + 1) + 8LL * (void)v30);
          uint64_t v32 = DMFConfigurationEngineLog(v27);
          v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v134 = v31;
            _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "Marking configuration for removal: %{public}@",  buf,  0xCu);
          }

          id v27 = [v31 setAvailable:0];
          v30 = (char *)v30 + 1;
        }

        while (v28 != v30);
        id v27 = [v26 countByEnumeratingWithState:&v120 objects:v135 count:16];
        id v28 = v27;
      }

      while (v27);
    }

    v7 = v89;
    id v34 = v92;
    self = v94;
    id v10 = v103;
  }

  else
  {
    v91 = v16;
    id v34 = v9;
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineUpdateDeclarationsOperation request](self, "request"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 upsertDeclarations]);

  if (![v36 count])
  {
    v16 = v91;
LABEL_65:
    v83 = v34;
    id v105 = v34;
    unsigned __int8 v84 = [v99 save:&v105];
    id v34 = v105;

    if ((v84 & 1) != 0)
    {
      -[DMDEngineUpdateDeclarationsOperation setResultObject:](self, "setResultObject:", 0LL);
    }

    else
    {
      uint64_t v86 = DMFConfigurationEngineLog(v85);
      v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
        sub_1000649C4(v34);
      }

      -[DMDEngineUpdateDeclarationsOperation setError:](self, "setError:", v34);
    }

    goto LABEL_70;
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineUpdateDeclarationsOperation request](self, "request"));
  v38 = v34;
  v39 = (void *)objc_claimAutoreleasedReturnValue([v37 organizationIdentifier]);
  v40 = (void *)objc_claimAutoreleasedReturnValue( +[DMDDeclarationPayloadMetadata fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier:]( &OBJC_CLASS___DMDDeclarationPayloadMetadata,  "fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier:",  v39));

  id v119 = v38;
  v88 = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue([v40 execute:&v119]);
  id v42 = v119;

  if (v41)
  {
    v96 = v36;
    v90 = v7;
    v104 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v41 count]));
    __int128 v115 = 0u;
    __int128 v116 = 0u;
    __int128 v117 = 0u;
    __int128 v118 = 0u;
    id obj = v41;
    id v44 = [obj countByEnumeratingWithState:&v115 objects:v132 count:16];
    if (v44)
    {
      id v45 = v44;
      uint64_t v46 = *(void *)v116;
      do
      {
        for (j = 0LL; j != v45; j = (char *)j + 1)
        {
          if (*(void *)v116 != v46) {
            objc_enumerationMutation(obj);
          }
          v48 = *(void **)(*((void *)&v115 + 1) + 8LL * (void)j);
          v49 = (void *)objc_claimAutoreleasedReturnValue([v48 identifier]);
          v50 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:v49]);
          v51 = v50;
          if (v50) {
            v52 = v50;
          }
          else {
            v52 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
          }
          v53 = v52;

          -[NSMutableArray addObject:](v53, "addObject:", v48);
          v54 = (void *)objc_claimAutoreleasedReturnValue([v48 identifier]);
          [v104 setObject:v53 forKeyedSubscript:v54];
        }

        id v45 = [obj countByEnumeratingWithState:&v115 objects:v132 count:16];
      }

      while (v45);
    }

    self = v94;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineUpdateDeclarationsOperation request](v94, "request"));
    v56 = (void *)objc_claimAutoreleasedReturnValue([v55 organizationIdentifier]);
    id v114 = v42;
    v57 = (void *)objc_claimAutoreleasedReturnValue( +[DMDDeclarationPayloadMetadata declarationsWithDictionaries:organizationIdentifier:context:error:]( &OBJC_CLASS___DMDDeclarationPayloadMetadata,  "declarationsWithDictionaries:organizationIdentifier:context:error:",  v96,  v56,  v99,  &v114));
    id v93 = v114;

    id v58 = [v57 mutableCopy];
    if (v58)
    {
      __int128 v112 = 0u;
      __int128 v113 = 0u;
      __int128 v110 = 0u;
      __int128 v111 = 0u;
      v98 = v58;
      id v97 = (id)objc_claimAutoreleasedReturnValue([v58 allValues]);
      id v102 = [v97 countByEnumeratingWithState:&v110 objects:v131 count:16];
      if (v102)
      {
        uint64_t v101 = *(void *)v111;
        do
        {
          for (k = 0LL; k != v102; k = (char *)k + 1)
          {
            if (*(void *)v111 != v101) {
              objc_enumerationMutation(v97);
            }
            v61 = *(void **)(*((void *)&v110 + 1) + 8LL * (void)k);
            v62 = (void *)objc_claimAutoreleasedReturnValue([v61 identifier]);
            v63 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:v62]);

            __int128 v108 = 0u;
            __int128 v109 = 0u;
            __int128 v106 = 0u;
            __int128 v107 = 0u;
            id v64 = v63;
            id v65 = [v64 countByEnumeratingWithState:&v106 objects:v130 count:16];
            if (v65)
            {
              id v66 = v65;
              uint64_t v67 = *(void *)v107;
              while (2)
              {
                for (m = 0LL; m != v66; m = (char *)m + 1)
                {
                  if (*(void *)v107 != v67) {
                    objc_enumerationMutation(v64);
                  }
                  v69 = *(void **)(*((void *)&v106 + 1) + 8LL * (void)m);
                  v70 = (void *)objc_claimAutoreleasedReturnValue([v61 serverHash]);
                  v71 = (void *)objc_claimAutoreleasedReturnValue([v69 serverHash]);
                  unsigned int v72 = [v70 isEqualToString:v71];

                  if (v72)
                  {
                    uint64_t v74 = DMFConfigurationEngineLog(v73);
                    v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
                    if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138543362;
                      v134 = v61;
                      _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_INFO,  "Declaration already installed, skipping: %{public}@",  buf,  0xCu);
                    }

                    [v99 deleteObject:v61];
                    v76 = (void *)objc_claimAutoreleasedReturnValue([v61 identifier]);
                    [v98 removeObjectForKey:v76];

                    id v10 = v103;
                    goto LABEL_51;
                  }

                  [v69 setAvailable:0];
                }

                id v66 = [v64 countByEnumeratingWithState:&v106 objects:v130 count:16];
                id v10 = v103;
                if (v66) {
                  continue;
                }
                break;
              }
            }

- (DMFUpdateDeclarationsRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end