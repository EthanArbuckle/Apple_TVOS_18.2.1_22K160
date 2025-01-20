@interface DMDEngineDatabaseProcessingOperation
- (BOOL)preprocessDatabaseInContext:(id)a3 forOrganization:(id)a4 error:(id *)a5;
- (BOOL)updateActiveRestrictionsInContext:(id)a3 error:(id *)a4;
- (DMDActivationPredicateObserverManager)activationPredicateObserverManager;
- (DMDDeviceStateProvider)deviceStateProvider;
- (DMDEngineDatabaseProcessingOperationDelegate)delegate;
- (DMDTaskOperationProvider)taskOperationProvider;
- (id)processCommandPayloadsInContext:(id)a3 forOrganization:(id)a4 enqueuedOperations:(id)a5 assetResolver:(id)a6 error:(id *)a7;
- (id)processDeclarationPayloadsInContext:(id)a3 forOrganization:(id)a4 enqueuedOperations:(id)a5 assetResolver:(id)a6 error:(id *)a7;
- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3;
- (void)setActivationPredicateObserverManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceStateProvider:(id)a3;
- (void)setTaskOperationProvider:(id)a3;
@end

@implementation DMDEngineDatabaseProcessingOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationOrganization fetchRequest]( &OBJC_CLASS___DMDConfigurationOrganization,  "fetchRequest"));
  id v65 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 execute:&v65]);
  id v8 = v65;
  id v9 = v8;
  if (!v7)
  {
    uint64_t v43 = DMFConfigurationEngineLog(v8);
    v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_100063DD8();
    }
    goto LABEL_36;
  }

  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  id obj = v7;
  id v54 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
  if (v54)
  {
    uint64_t v55 = *(void *)v62;
    v11 = &selRef_communicationPolicyForApplicationPolicy_downtimeEnforced_;
    v12 = &selRef_communicationPolicyForApplicationPolicy_downtimeEnforced_;
    *(void *)&__int128 v10 = 138412290LL;
    __int128 v48 = v10;
    id v56 = v4;
    v49 = v7;
    v50 = v6;
    while (2)
    {
      v13 = 0LL;
      v52 = v12[217];
      v53 = v11[218];
      do
      {
        v14 = v5;
        if (*(void *)v62 != v55) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)v13);
        if ((objc_msgSend(v15, "active", v48) & 1) != 0
          || (v16 = (void *)objc_claimAutoreleasedReturnValue([v15 payloadMetadatas]),
              id v17 = [v16 count],
              v16,
              v17))
        {
          id v60 = v9;
          unsigned __int8 v19 = -[DMDEngineDatabaseProcessingOperation preprocessDatabaseInContext:forOrganization:error:]( self,  "preprocessDatabaseInContext:forOrganization:error:",  v4,  v15,  &v60);
          id v20 = v60;

          if ((v19 & 1) == 0)
          {
            uint64_t v45 = DMFConfigurationEngineLog(v21);
            v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
              sub_100063ECC();
            }

            -[DMDEngineDatabaseProcessingOperation setError:](self, "setError:", v20);
            goto LABEL_33;
          }

          v22 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation delegate](self, "delegate"));
          char v23 = objc_opt_respondsToSelector(v22, v53);

          if ((v23 & 1) != 0)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation delegate](self, "delegate"));
            v25 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
            v26 = (void *)objc_claimAutoreleasedReturnValue( [v24 engineProcessingOperation:self enqueuedOperationsForOrganizationWithIdentifier:v25]);
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v26));

            id v4 = v56;
          }

          else
          {
            v27 = 0LL;
          }

          v28 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation delegate](self, "delegate"));
          char v29 = objc_opt_respondsToSelector(v28, v52);

          if ((v29 & 1) != 0)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation delegate](self, "delegate"));
            v31 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
            v32 = (void *)objc_claimAutoreleasedReturnValue( [v30 engineProcessingOperation:self assetResolverForOrganizationWithIdentifier:v31]);
          }

          else
          {
            v32 = 0LL;
          }

          id v59 = v20;
          v33 = (void *)objc_claimAutoreleasedReturnValue( -[DMDEngineDatabaseProcessingOperation processCommandPayloadsInContext:forOrganization:enqueuedOperations:assetResolver:error:]( self,  "processCommandPayloadsInContext:forOrganization:enqueuedOperations:assetResolver:error:",  v4,  v15,  v27,  v32,  &v59));
          id v34 = v4;
          id v35 = v59;

          if (!v33) {
            goto LABEL_32;
          }
          v5 = v14;
          -[NSMutableArray addObjectsFromArray:](v14, "addObjectsFromArray:", v33);
          id v58 = v35;
          v36 = (void *)objc_claimAutoreleasedReturnValue( -[DMDEngineDatabaseProcessingOperation processDeclarationPayloadsInContext:forOrganization:enqueuedOperations:assetResolver:error:]( self,  "processDeclarationPayloadsInContext:forOrganization:enqueuedOperations:assetResolver:error:",  v34,  v15,  v27,  v32,  &v58));
          id v9 = v58;

          if (!v36)
          {
            id v35 = v9;
LABEL_32:
            -[DMDEngineDatabaseProcessingOperation setError:](self, "setError:", v35);

            id v20 = v35;
            id v4 = v56;
LABEL_33:
            v7 = v49;
            v6 = v50;

            id v9 = v20;
            v5 = v14;
            goto LABEL_37;
          }

          -[NSMutableArray addObjectsFromArray:](v14, "addObjectsFromArray:", v36);

          id v4 = v56;
        }

        else
        {
          uint64_t v37 = DMFConfigurationEngineLog(v18);
          v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v48;
            v67 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Deleting deactivated organization %@",  buf,  0xCu);
          }

          [v4 deleteObject:v15];
          v5 = v14;
        }

        v13 = (char *)v13 + 1;
      }

      while (v54 != v13);
      id v39 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
      v7 = v49;
      v6 = v50;
      v11 = &selRef_communicationPolicyForApplicationPolicy_downtimeEnforced_;
      v12 = &selRef_communicationPolicyForApplicationPolicy_downtimeEnforced_;
      id v54 = v39;
      if (v39) {
        continue;
      }
      break;
    }
  }

  v40 = v9;

  id v57 = v9;
  unsigned int v41 = [v4 save:&v57];
  id v9 = v57;

  if (!v41)
  {
    uint64_t v47 = DMFConfigurationEngineLog(v42);
    v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_100063E54(v9);
    }
LABEL_36:

    -[DMDEngineDatabaseProcessingOperation setError:](self, "setError:", v9);
    goto LABEL_37;
  }

  -[DMDEngineDatabaseProcessingOperation setResultObject:](self, "setResultObject:", v5);
LABEL_37:
}

- (BOOL)preprocessDatabaseInContext:(id)a3 forOrganization:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v60 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v60 identifier]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue( +[DMDDeclarationPayloadMetadata fetchRequestForDeclarationsFromOrganizationWithIdentifier:]( &OBJC_CLASS___DMDDeclarationPayloadMetadata,  "fetchRequestForDeclarationsFromOrganizationWithIdentifier:",  v8));

  id v72 = 0LL;
  __int128 v61 = v7;
  v50 = (void *)v9;
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 executeFetchRequest:v9 error:&v72]);
  id v11 = v72;
  id v12 = v11;
  v49 = v10;
  if (v10)
  {
    __int128 v71 = 0u;
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v68 = 0u;
    id obj = v10;
    id v13 = [obj countByEnumeratingWithState:&v68 objects:v79 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v69;
      p_cache = &OBJC_CLASS___CEMImageAssetInstallMetadata.cache;
      uint64_t v51 = *(void *)v69;
      do
      {
        id v17 = 0LL;
        id v52 = v14;
        do
        {
          if (*(void *)v69 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void **)(*((void *)&v68 + 1) + 8LL * (void)v17);
          unsigned __int8 v19 = objc_autoreleasePoolPush();
          uint64_t v20 = objc_opt_class(p_cache + 448);
          if ((objc_opt_isKindOfClass(v18, v20) & 1) != 0)
          {
            id v57 = v19;
            id v56 = (void *)objc_claimAutoreleasedReturnValue([v18 payload]);
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v56 payloadDictionary]);
            id v67 = v12;
            v22 = (void *)objc_claimAutoreleasedReturnValue( +[CEMConfigurationBase declarationForPayload:error:]( &OBJC_CLASS___CEMConfigurationBase,  "declarationForPayload:error:",  v21,  &v67));
            id v23 = v67;

            uint64_t v55 = v22;
            if (v22)
            {
              os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue([v18 mutableSetValueForKey:@"outgoingPayloadMetadataReferences"]);
              -[os_log_s removeAllObjects](log, "removeAllObjects");
              v25 = (void *)objc_claimAutoreleasedReturnValue([v22 assetReferences]);
              __int128 v63 = 0u;
              __int128 v64 = 0u;
              __int128 v65 = 0u;
              __int128 v66 = 0u;
              id v58 = v25;
              id v26 = [v58 countByEnumeratingWithState:&v63 objects:v74 count:16];
              if (v26)
              {
                id v27 = v26;
                uint64_t v28 = *(void *)v64;
                id v54 = v17;
                while (2)
                {
                  char v29 = 0LL;
                  v30 = v23;
                  do
                  {
                    if (*(void *)v64 != v28) {
                      objc_enumerationMutation(v58);
                    }
                    v31 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)v29);
                    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "identifier", v49));
                    v33 = (void *)objc_claimAutoreleasedReturnValue([v31 identifier]);
                    v73 = v33;
                    id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v73,  1LL));
                    id v35 = (void *)objc_claimAutoreleasedReturnValue( +[DMDDeclarationPayloadMetadata fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier:withIdentifiers:]( &OBJC_CLASS___DMDAssetPayloadMetadata,  "fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier:withIdentifiers:",  v32,  v34));

                    id v62 = v30;
                    v36 = (void *)objc_claimAutoreleasedReturnValue([v61 executeFetchRequest:v35 error:&v62]);
                    id v23 = v62;

                    if (!v36)
                    {
                      uint64_t v39 = DMFConfigurationEngineLog(v37);
                      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
                      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                      {
                        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v31 identifier]);
                        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v23 verboseDescription]);
                        *(_DWORD *)buf = 138543618;
                        v76 = v42;
                        __int16 v77 = 2114;
                        v78 = v43;
                        _os_log_error_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "Failed to fetch asset with identifier (%{public}@): %{public}@",  buf,  0x16u);
                      }

                      id v17 = v54;
                      goto LABEL_23;
                    }

                    v38 = (void *)objc_claimAutoreleasedReturnValue([v36 firstObject]);
                    if (v38) {
                      -[os_log_s addObject:](log, "addObject:", v38);
                    }

                    char v29 = (char *)v29 + 1;
                    v30 = v23;
                  }

                  while (v27 != v29);
                  id v27 = [v58 countByEnumeratingWithState:&v63 objects:v74 count:16];
                  id v17 = v54;
                  if (v27) {
                    continue;
                  }
                  break;
                }
              }

- (BOOL)updateActiveRestrictionsInContext:(id)a3 error:(id *)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationPayloadMetadata fetchRequest]( &OBJC_CLASS___DMDConfigurationPayloadMetadata,  "fetchRequest",  a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"installed",  &__kCFBooleanTrue));
  v63[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"failed",  &__kCFBooleanFalse));
  v63[1] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v63, 2LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v7));

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"installed",  &__kCFBooleanFalse));
  v62[0] = v9;
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"failed",  &__kCFBooleanFalse));
  v62[1] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SUBQUERY(incomingPayloadMetadataReferences, $ref, ($ref.available == YES) && ($ref.predicatePayloadMetadata.%K.BOOLValue == YES)).@count > 0",  DMFDeclarationStatePredicateLastEvaluationValueKey));
  v62[2] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v62, 3LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v12));

  v61[0] = v8;
  v61[1] = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v61, 2LL));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate orPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "orPredicateWithSubpredicates:",  v14));
  [v4 setPredicate:v15];

  id v57 = 0LL;
  v50 = v4;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 execute:&v57]);
  id v17 = v57;
  id v18 = v17;
  if (v16)
  {
    uint64_t v45 = v17;
    uint64_t v47 = v13;
    __int128 v48 = v8;
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v16 count]));
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    uint64_t v46 = v16;
    id v19 = v16;
    id v20 = [v19 countByEnumeratingWithState:&v53 objects:v60 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v54;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v54 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)i);
          v25 = (void *)objc_claimAutoreleasedReturnValue([v24 type]);
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 substringFromIndex:24]);
          id v27 = (void *)objc_claimAutoreleasedReturnValue([v24 identifier]);
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@-restrictions",  v26,  v27));

          [v51 addObject:v28];
        }

        id v21 = [v19 countByEnumeratingWithState:&v53 objects:v60 count:16];
      }

      while (v21);
    }

    uint64_t v30 = DMFConfigurationEngineLog(v29);
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v59 = v51;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Active restrictions: %@", buf, 0xCu);
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue( +[DMFConfigurationSourceClient activeRestrictionsURL]( &OBJC_CLASS___DMFConfigurationSourceClient,  "activeRestrictionsURL"));
    id v13 = v47;
    id v8 = v48;
    if (v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v51,  200LL,  0LL,  0LL));
      id v52 = v45;
      unsigned __int8 v34 = [v33 writeToURL:v32 options:1 error:&v52];
      id v18 = v52;

      if ((v34 & 1) != 0)
      {
        id v36 = [v32 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsExcludedFromBackupKey error:0];
        v16 = v46;
        if ((v36 & 1) == 0)
        {
          uint64_t v37 = DMFConfigurationEngineLog(v36);
          v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            sub_1000640BC();
          }
        }
      }

      else
      {
        uint64_t v42 = DMFConfigurationEngineLog(v35);
        uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        v16 = v46;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          sub_1000640BC();
        }

        if (a4)
        {
          id v18 = v18;
          *a4 = v18;
        }
      }
    }

    else
    {
      uint64_t v41 = DMFConfigurationEngineLog(0LL);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR)) {
        sub_10006404C();
      }
      unsigned __int8 v34 = 0;
      id v18 = v45;
      v16 = v46;
    }
  }

  else
  {
    uint64_t v39 = DMFConfigurationEngineLog(v17);
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
      sub_100063FC0();
    }

    if (a4)
    {
      id v18 = v18;
      unsigned __int8 v34 = 0;
      *a4 = v18;
    }

    else
    {
      unsigned __int8 v34 = 0;
    }
  }

  return v34;
}

- (id)processCommandPayloadsInContext:(id)a3 forOrganization:(id)a4 enqueuedOperations:(id)a5 assetResolver:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v147 = a7;
  if (!a7)
  {
    v141 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v141 handleFailureInMethod:a2, self, @"DMDEngineDatabaseProcessingOperation.m", 222, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }

  v152 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v153 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v154 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v183 = 0u;
  __int128 v184 = 0u;
  __int128 v185 = 0u;
  __int128 v186 = 0u;
  id obj = v15;
  id v17 = [obj countByEnumeratingWithState:&v183 objects:v198 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v184;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v184 != v19) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v183 + 1) + 8LL * (void)i);
        uint64_t v22 = objc_opt_class(&OBJC_CLASS___DMDCommandActionOperation);
        if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
        {
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 payloadMetadataObjectID]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v153, "setObject:forKeyedSubscript:", v21, v23);

          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v21 payloadIdentifier]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v154, "setObject:forKeyedSubscript:", v21, v24);
        }
      }

      id v18 = [obj countByEnumeratingWithState:&v183 objects:v198 count:16];
    }

    while (v18);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
  id v26 = (void *)objc_claimAutoreleasedReturnValue( +[DMDCommandPayloadMetadata fetchRequestForCommandsPendingExecutionFromOrganizationWithIdentifier:]( &OBJC_CLASS___DMDCommandPayloadMetadata,  "fetchRequestForCommandsPendingExecutionFromOrganizationWithIdentifier:",  v25));

  id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 execute:v147]);
  id v150 = v27;
  if (!v27)
  {
    uint64_t v136 = DMFConfigurationEngineLog(0LL);
    id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v136);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      sub_100064138((uint64_t)v147);
    }
    v135 = 0LL;
    goto LABEL_108;
  }

  v143 = v26;
  id v144 = v16;
  v145 = v13;
  v146 = v14;
  __int128 v181 = 0u;
  __int128 v182 = 0u;
  __int128 v179 = 0u;
  __int128 v180 = 0u;
  id v28 = [v27 countByEnumeratingWithState:&v179 objects:v197 count:16];
  if (!v28) {
    goto LABEL_26;
  }
  id v29 = v28;
  uint64_t v30 = *(void *)v180;
  do
  {
    for (j = 0LL; j != v29; j = (char *)j + 1)
    {
      if (*(void *)v180 != v30) {
        objc_enumerationMutation(v150);
      }
      v32 = *(void **)(*((void *)&v179 + 1) + 8LL * (void)j);
      v33 = (void *)objc_claimAutoreleasedReturnValue([v32 identifier]);
      unsigned __int8 v34 = (DMDCommandExecuteOperation *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v154,  "objectForKeyedSubscript:",  v33));

      if (v34)
      {
        uint64_t v35 = objc_opt_class(&OBJC_CLASS___DMDCommandExecuteOperation);
        uint64_t isKindOfClass = objc_opt_isKindOfClass(v34, v35);
        if ((isKindOfClass & 1) != 0) {
          goto LABEL_24;
        }
        uint64_t v37 = DMFConfigurationEngineLog(isKindOfClass);
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v32 identifier]);
          v40 = (objc_class *)objc_opt_class(v34);
          uint64_t v41 = NSStringFromClass(v40);
          uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
          *(_DWORD *)buf = 138543618;
          v194 = v39;
          __int16 v195 = 2114;
          v196 = v42;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "%{public}@: Cancelling enqueued %{public}@ so we can enqueue an execute command operation",  buf,  0x16u);
        }

        -[DMDCommandExecuteOperation cancel](v34, "cancel");
      }

      uint64_t v43 = objc_alloc(&OBJC_CLASS___DMDCommandExecuteOperation);
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));
      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v32 objectID]);
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v32 identifier]);
      unsigned __int8 v34 = -[DMDPayloadActionOperation initWithDatabase:payloadMetadataObjectID:payloadIdentifier:]( v43,  "initWithDatabase:payloadMetadataObjectID:payloadIdentifier:",  v44,  v45,  v46);

      -[DMDPayloadActionOperation setRequiresNetworkTether:]( v34,  "setRequiresNetworkTether:",  [v32 requiresNetworkTether]);
      -[DMDPayloadActionOperation setRequiresUnlockedKeychain:]( v34,  "setRequiresUnlockedKeychain:",  [v32 requiresUnlockedKeychain]);
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation deviceStateProvider](self, "deviceStateProvider"));
      -[DMDPayloadActionOperation setDeviceStateProvider:](v34, "setDeviceStateProvider:", v47);

      __int128 v48 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation taskOperationProvider](self, "taskOperationProvider"));
      -[DMDPayloadActionOperation setTaskOperationProvider:](v34, "setTaskOperationProvider:", v48);

      -[NSMutableArray addObject:](v152, "addObject:", v34);
      v49 = (void *)objc_claimAutoreleasedReturnValue([v32 objectID]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v153, "setObject:forKeyedSubscript:", v34, v49);

      v50 = (void *)objc_claimAutoreleasedReturnValue([v32 identifier]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v154, "setObject:forKeyedSubscript:", v34, v50);

LABEL_24:
    }

    id v29 = [v150 countByEnumeratingWithState:&v179 objects:v197 count:16];
  }

  while (v29);
LABEL_26:
  id v14 = v146;
  uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v146 identifier]);
  id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[DMDCommandPayloadMetadata fetchRequestForCommandsPendingRemovalFromOrganizationWithIdentifier:]( &OBJC_CLASS___DMDCommandPayloadMetadata,  "fetchRequestForCommandsPendingRemovalFromOrganizationWithIdentifier:",  v51));

  __int128 v53 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s execute:](v52, "execute:", v147));
  v149 = v53;
  if (v53)
  {
    v142 = v52;
    __int128 v177 = 0u;
    __int128 v178 = 0u;
    __int128 v175 = 0u;
    __int128 v176 = 0u;
    id v54 = [v53 countByEnumeratingWithState:&v175 objects:v192 count:16];
    if (!v54) {
      goto LABEL_40;
    }
    id v55 = v54;
    uint64_t v56 = *(void *)v176;
    while (1)
    {
      for (k = 0LL; k != v55; k = (char *)k + 1)
      {
        if (*(void *)v176 != v56) {
          objc_enumerationMutation(v149);
        }
        id v58 = *(void **)(*((void *)&v175 + 1) + 8LL * (void)k);
        id v59 = (void *)objc_claimAutoreleasedReturnValue([v58 identifier]);
        id v60 = (DMDCommandRemoveOperation *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v154,  "objectForKeyedSubscript:",  v59));

        if (v60)
        {
          uint64_t v61 = objc_opt_class(&OBJC_CLASS___DMDCommandRemoveOperation);
          uint64_t v62 = objc_opt_isKindOfClass(v60, v61);
          if ((v62 & 1) != 0) {
            goto LABEL_38;
          }
          uint64_t v63 = DMFConfigurationEngineLog(v62);
          __int128 v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
          {
            __int128 v65 = (void *)objc_claimAutoreleasedReturnValue([v58 identifier]);
            __int128 v66 = (objc_class *)objc_opt_class(v60);
            id v67 = NSStringFromClass(v66);
            __int128 v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
            *(_DWORD *)buf = 138543618;
            v194 = v65;
            __int16 v195 = 2114;
            v196 = v68;
            _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_INFO,  "%{public}@: Cancelling enqueued %{public}@ so we can enqueue an remove command operation",  buf,  0x16u);
          }

          -[DMDCommandRemoveOperation cancel](v60, "cancel");
        }

        __int128 v69 = objc_alloc(&OBJC_CLASS___DMDCommandRemoveOperation);
        __int128 v70 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));
        __int128 v71 = (void *)objc_claimAutoreleasedReturnValue([v58 objectID]);
        id v72 = (void *)objc_claimAutoreleasedReturnValue([v58 identifier]);
        id v60 = -[DMDPayloadActionOperation initWithDatabase:payloadMetadataObjectID:payloadIdentifier:]( v69,  "initWithDatabase:payloadMetadataObjectID:payloadIdentifier:",  v70,  v71,  v72);

        -[DMDPayloadActionOperation setRequiresNetworkTether:]( v60,  "setRequiresNetworkTether:",  [v58 requiresNetworkTether]);
        -[DMDPayloadActionOperation setRequiresUnlockedKeychain:]( v60,  "setRequiresUnlockedKeychain:",  [v58 requiresUnlockedKeychain]);
        v73 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation deviceStateProvider](self, "deviceStateProvider"));
        -[DMDPayloadActionOperation setDeviceStateProvider:](v60, "setDeviceStateProvider:", v73);

        v74 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation taskOperationProvider](self, "taskOperationProvider"));
        -[DMDPayloadActionOperation setTaskOperationProvider:](v60, "setTaskOperationProvider:", v74);

        -[NSMutableArray addObject:](v152, "addObject:", v60);
        v75 = (void *)objc_claimAutoreleasedReturnValue([v58 objectID]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v153, "setObject:forKeyedSubscript:", v60, v75);

        v76 = (void *)objc_claimAutoreleasedReturnValue([v58 identifier]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v154, "setObject:forKeyedSubscript:", v60, v76);

LABEL_38:
      }

      id v55 = [v149 countByEnumeratingWithState:&v175 objects:v192 count:16];
      if (!v55)
      {
LABEL_40:
        id v14 = v146;
        __int16 v77 = (void *)objc_claimAutoreleasedReturnValue([v146 identifier]);
        v78 = (void *)objc_claimAutoreleasedReturnValue( +[DMDCommandPayloadMetadata fetchRequestForCommandsPendingDeleteFromOrganizationWithIdentifier:]( &OBJC_CLASS___DMDCommandPayloadMetadata,  "fetchRequestForCommandsPendingDeleteFromOrganizationWithIdentifier:",  v77));

        v79 = (void *)objc_claimAutoreleasedReturnValue([v78 execute:v147]);
        v80 = v79;
        if (v79)
        {
          __int128 v173 = 0u;
          __int128 v174 = 0u;
          __int128 v171 = 0u;
          __int128 v172 = 0u;
          id v81 = [v79 countByEnumeratingWithState:&v171 objects:v191 count:16];
          id v16 = v144;
          id v13 = v145;
          id v52 = v142;
          id v26 = v143;
          if (v81)
          {
            id v82 = v81;
            uint64_t v83 = *(void *)v172;
            do
            {
              v84 = 0LL;
              do
              {
                if (*(void *)v172 != v83) {
                  objc_enumerationMutation(v80);
                }
                [v145 deleteObject:*(void *)(*((void *)&v171 + 1) + 8 * (void)v84)];
                v84 = (char *)v84 + 1;
              }

              while (v82 != v84);
              id v81 = [v80 countByEnumeratingWithState:&v171 objects:v191 count:16];
              id v82 = v81;
            }

            while (v81);
          }

          uint64_t v85 = DMFConfigurationEngineLog(v81);
          v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
          BOOL v87 = os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG);

          if (v87)
          {
            v148 = v78;
            uint64_t v89 = DMFConfigurationEngineLog(v88);
            v90 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
            if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG)) {
              sub_100064350();
            }

            __int128 v169 = 0u;
            __int128 v170 = 0u;
            __int128 v167 = 0u;
            __int128 v168 = 0u;
            id v91 = v150;
            id v92 = [v91 countByEnumeratingWithState:&v167 objects:v190 count:16];
            if (v92)
            {
              id v93 = v92;
              uint64_t v94 = *(void *)v168;
              do
              {
                v95 = 0LL;
                do
                {
                  if (*(void *)v168 != v94) {
                    objc_enumerationMutation(v91);
                  }
                  v96 = *(void **)(*((void *)&v167 + 1) + 8LL * (void)v95);
                  uint64_t v97 = DMFConfigurationEngineLog(v92);
                  v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
                  if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543362;
                    v194 = v96;
                    _os_log_debug_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
                  }

                  v95 = (char *)v95 + 1;
                }

                while (v93 != v95);
                id v92 = [v91 countByEnumeratingWithState:&v167 objects:v190 count:16];
                id v93 = v92;
              }

              while (v92);
            }

            uint64_t v100 = DMFConfigurationEngineLog(v99);
            v101 = (os_log_s *)objc_claimAutoreleasedReturnValue(v100);
            if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG)) {
              sub_100064324();
            }

            __int128 v165 = 0u;
            __int128 v166 = 0u;
            __int128 v163 = 0u;
            __int128 v164 = 0u;
            id v102 = v149;
            id v103 = [v102 countByEnumeratingWithState:&v163 objects:v189 count:16];
            if (v103)
            {
              id v104 = v103;
              uint64_t v105 = *(void *)v164;
              do
              {
                v106 = 0LL;
                do
                {
                  if (*(void *)v164 != v105) {
                    objc_enumerationMutation(v102);
                  }
                  v107 = *(void **)(*((void *)&v163 + 1) + 8LL * (void)v106);
                  uint64_t v108 = DMFConfigurationEngineLog(v103);
                  v109 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
                  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543362;
                    v194 = v107;
                    _os_log_debug_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
                  }

                  v106 = (char *)v106 + 1;
                }

                while (v104 != v106);
                id v103 = [v102 countByEnumeratingWithState:&v163 objects:v189 count:16];
                id v104 = v103;
              }

              while (v103);
            }

            uint64_t v111 = DMFConfigurationEngineLog(v110);
            v112 = (os_log_s *)objc_claimAutoreleasedReturnValue(v111);
            if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG)) {
              sub_1000642F8();
            }

            __int128 v161 = 0u;
            __int128 v162 = 0u;
            __int128 v159 = 0u;
            __int128 v160 = 0u;
            id v113 = v80;
            id v114 = [v113 countByEnumeratingWithState:&v159 objects:v188 count:16];
            if (v114)
            {
              id v115 = v114;
              uint64_t v116 = *(void *)v160;
              do
              {
                v117 = 0LL;
                do
                {
                  if (*(void *)v160 != v116) {
                    objc_enumerationMutation(v113);
                  }
                  v118 = *(void **)(*((void *)&v159 + 1) + 8LL * (void)v117);
                  uint64_t v119 = DMFConfigurationEngineLog(v114);
                  v120 = (os_log_s *)objc_claimAutoreleasedReturnValue(v119);
                  if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543362;
                    v194 = v118;
                    _os_log_debug_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
                  }

                  v117 = (char *)v117 + 1;
                }

                while (v115 != v117);
                id v114 = [v113 countByEnumeratingWithState:&v159 objects:v188 count:16];
                id v115 = v114;
              }

              while (v114);
            }

            uint64_t v122 = DMFConfigurationEngineLog(v121);
            v123 = (os_log_s *)objc_claimAutoreleasedReturnValue(v122);
            if (os_log_type_enabled(v123, OS_LOG_TYPE_DEBUG)) {
              sub_1000642CC();
            }

            __int128 v157 = 0u;
            __int128 v158 = 0u;
            __int128 v155 = 0u;
            __int128 v156 = 0u;
            v124 = v152;
            id v125 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v124,  "countByEnumeratingWithState:objects:count:",  &v155,  v187,  16LL);
            id v13 = v145;
            if (v125)
            {
              id v126 = v125;
              uint64_t v127 = *(void *)v156;
              do
              {
                v128 = 0LL;
                do
                {
                  if (*(void *)v156 != v127) {
                    objc_enumerationMutation(v124);
                  }
                  v129 = *(void **)(*((void *)&v155 + 1) + 8LL * (void)v128);
                  uint64_t v130 = DMFConfigurationEngineLog(v125);
                  v131 = (os_log_s *)objc_claimAutoreleasedReturnValue(v130);
                  if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543362;
                    v194 = v129;
                    _os_log_debug_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
                  }

                  v128 = (char *)v128 + 1;
                }

                while (v126 != v128);
                id v125 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v124,  "countByEnumeratingWithState:objects:count:",  &v155,  v187,  16LL);
                id v126 = v125;
              }

              while (v125);
            }

            uint64_t v133 = DMFConfigurationEngineLog(v132);
            v134 = (os_log_s *)objc_claimAutoreleasedReturnValue(v133);
            if (os_log_type_enabled(v134, OS_LOG_TYPE_DEBUG)) {
              sub_1000642A0();
            }

            id v14 = v146;
            v78 = v148;
            id v26 = v143;
            id v16 = v144;
            id v52 = v142;
          }

          v135 = v152;
        }

        else
        {
          uint64_t v138 = DMFConfigurationEngineLog(0LL);
          v139 = (os_log_s *)objc_claimAutoreleasedReturnValue(v138);
          id v16 = v144;
          id v13 = v145;
          id v52 = v142;
          id v26 = v143;
          if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR)) {
            sub_100064228((uint64_t)v147);
          }

          v135 = 0LL;
        }

        goto LABEL_107;
      }
    }
  }

  uint64_t v137 = DMFConfigurationEngineLog(0LL);
  v78 = (void *)objc_claimAutoreleasedReturnValue(v137);
  if (os_log_type_enabled((os_log_t)v78, OS_LOG_TYPE_ERROR)) {
    sub_1000641B0((uint64_t)v147);
  }
  v135 = 0LL;
  id v16 = v144;
  id v13 = v145;
  id v26 = v143;
LABEL_107:

LABEL_108:
  return v135;
}

- (id)processDeclarationPayloadsInContext:(id)a3 forOrganization:(id)a4 enqueuedOperations:(id)a5 assetResolver:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v292 = a5;
  id v306 = a6;
  if (!a7)
  {
    v284 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v284 handleFailureInMethod:a2, self, @"DMDEngineDatabaseProcessingOperation.m", 326, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }

  v298 = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[DMDActivationPayloadMetadata fetchRequestForActivationsFromOrganizationWithIdentifier:]( &OBJC_CLASS___DMDActivationPayloadMetadata,  "fetchRequestForActivationsFromOrganizationWithIdentifier:",  v14));

  v291 = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 execute:a7]);
  v290 = v16;
  if (!v16)
  {
    uint64_t v276 = DMFConfigurationEngineLog(0LL);
    v308 = (os_log_s *)objc_claimAutoreleasedReturnValue(v276);
    if (os_log_type_enabled(v308, OS_LOG_TYPE_ERROR)) {
      sub_10006437C((uint64_t)a7);
    }
    v275 = 0LL;
    v277 = v13;
    goto LABEL_206;
  }

  v289 = v12;
  __int128 v362 = 0u;
  __int128 v363 = 0u;
  __int128 v360 = 0u;
  __int128 v361 = 0u;
  id v17 = v16;
  id v18 = [v17 countByEnumeratingWithState:&v360 objects:v394 count:16];
  v299 = a7;
  if (!v18) {
    goto LABEL_54;
  }
  id v19 = v18;
  id v20 = &ACAccountPropertyPersonaIdentifier_ptr;
  uint64_t v317 = *(void *)v361;
  uint64_t v313 = DMFDeclarationStatePredicateLastEvaluationValueKey;
  id v307 = v17;
  do
  {
    for (i = 0LL; i != v19; i = (char *)i + 1)
    {
      if (*(void *)v361 != v317) {
        objc_enumerationMutation(v17);
      }
      uint64_t v22 = *(void **)(*((void *)&v360 + 1) + 8LL * (void)i);
      id v23 = v20[322];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v22 payload]);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 payloadDictionary]);
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v23 declarationForPayload:v25 error:a7]);

      if (!v26)
      {
        uint64_t v34 = DMFConfigurationEngineLog(v27);
        uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          __int128 v68 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 identifier]);
          __int128 v69 = (void *)objc_claimAutoreleasedReturnValue([*a7 verboseDescription]);
          *(_DWORD *)buf = 138543618;
          v381 = v68;
          __int16 v382 = 2114;
          id v383 = v69;
          _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "Failed to parse activation payload (%{public}@): %{public}@",  buf,  0x16u);

          id v20 = &ACAccountPropertyPersonaIdentifier_ptr;
        }

        id v36 = (void *)objc_claimAutoreleasedReturnValue( -[DMDEngineDatabaseProcessingOperation activationPredicateObserverManager]( self,  "activationPredicateObserverManager"));
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v22 uniqueIdentifier]);
        [v36 removeActivationPredicateObserverWithUniqueIdentifier:v37];

        [v22 setFailed:1];
        uint64_t v392 = v313;
        v393 = &__kCFBooleanFalse;
        v38 = &v393;
        uint64_t v39 = &v392;
        goto LABEL_28;
      }

      uint64_t v28 = objc_opt_class(&OBJC_CLASS___CEMActivationBasicDeclaration);
      if ((objc_opt_isKindOfClass(v26, v28) & 1) != 0)
      {
        if ([v22 available])
        {
          id v29 = (void *)objc_claimAutoreleasedReturnValue([v298 identifier]);
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationPayloadMetadata fetchRequestForAvailableConfigurationsFromOrganizationWithIdentifier:]( &OBJC_CLASS___DMDConfigurationPayloadMetadata,  "fetchRequestForAvailableConfigurationsFromOrganizationWithIdentifier:",  v29));

          v31 = (void *)objc_claimAutoreleasedReturnValue([v30 execute:a7]);
          if (v31)
          {
            uint64_t v390 = v313;
            v391 = &__kCFBooleanTrue;
            v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v391,  &v390,  1LL));
            [v22 setPredicatePayloadMetadata:v32];

            [v22 setInstalled:1];
            v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v31));
            [v22 setOutgoingPayloadMetadataReferences:v33];

            [v22 updateStateDictionaryIfNeeded];
          }

          else
          {
            uint64_t v63 = DMFConfigurationEngineLog(0LL);
            __int128 v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            {
              uint64_t v85 = (os_log_s *)objc_claimAutoreleasedReturnValue([v298 identifier]);
              v86 = (void *)objc_claimAutoreleasedReturnValue([*v299 verboseDescription]);
              *(_DWORD *)buf = 138543618;
              v381 = v85;
              __int16 v382 = 2114;
              id v383 = v86;
              _os_log_error_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_ERROR,  "Failed to fetch available configurations for organization (%{public}@): %{public}@",  buf,  0x16u);

              id v17 = v307;
              a7 = v299;
            }

            [v22 setFailed:1];
          }

LABEL_51:
          id v20 = &ACAccountPropertyPersonaIdentifier_ptr;
          goto LABEL_52;
        }

        uint64_t v388 = v313;
        v389 = &__kCFBooleanFalse;
        v38 = &v389;
        uint64_t v39 = &v388;
LABEL_28:
        uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v39,  1LL));
        [v22 setPredicatePayloadMetadata:v62];

        [v22 setInstalled:0];
        [v22 updateStateDictionaryIfNeeded];
        goto LABEL_52;
      }

      uint64_t v40 = objc_opt_class(&OBJC_CLASS___CEMActivationSimpleDeclaration);
      uint64_t isKindOfClass = objc_opt_isKindOfClass(v26, v40);
      if ((isKindOfClass & 1) != 0)
      {
        if (![v22 available])
        {
          id v60 = (void *)objc_claimAutoreleasedReturnValue( -[DMDEngineDatabaseProcessingOperation activationPredicateObserverManager]( self,  "activationPredicateObserverManager"));
          uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue([v22 uniqueIdentifier]);
          [v60 removeActivationPredicateObserverWithUniqueIdentifier:v61];

          uint64_t v376 = v313;
          v377 = &__kCFBooleanFalse;
          v38 = &v377;
          uint64_t v39 = &v376;
          goto LABEL_28;
        }

        id v42 = v26;
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v22 predicatePayloadMetadata]);
        v44 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:v313]);
        unsigned int v45 = [v44 BOOLValue];

        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v42 payloadPredicate]);
        if (v46)
        {
          unsigned int obj = v45;
          __int128 v48 = (void *)objc_claimAutoreleasedReturnValue( -[DMDEngineDatabaseProcessingOperation activationPredicateObserverManager]( self,  "activationPredicateObserverManager"));
          v49 = v42;
          v50 = (void *)objc_claimAutoreleasedReturnValue([v42 payloadPredicate]);
          uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v22 uniqueIdentifier]);
          id v52 = (void *)objc_claimAutoreleasedReturnValue( [v48 addActivationPredicateObserverForPredicate:v50 withUniqueIdentifier:v51]);

          if (v52)
          {
            id v54 = (os_log_s *)objc_claimAutoreleasedReturnValue([v52 evaluatePredicateWithError:a7]);
            id v55 = v54;
            if (v54)
            {
              unsigned int obj = -[os_log_s BOOLValue](v54, "BOOLValue");
              uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v52 metadata]);
              goto LABEL_42;
            }

            uint64_t v73 = DMFConfigurationEngineLog(0LL);
            v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            {
              v301 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 uniqueIdentifier]);
              BOOL v87 = (void *)objc_claimAutoreleasedReturnValue([v298 identifier]);
              uint64_t v88 = objc_claimAutoreleasedReturnValue([*v299 verboseDescription]);
              *(_DWORD *)buf = 138544130;
              v381 = v301;
              __int16 v382 = 2114;
              id v383 = v87;
              __int16 v384 = 2114;
              uint64_t v385 = v88;
              uint64_t v89 = (void *)v88;
              __int16 v386 = 1024;
              unsigned int v387 = obj;
              _os_log_error_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_ERROR,  "Failed to evaluate activation predicate with unique identifier %{public}@ for organization (%{public}@): %{public}@ using last predicate evaluation %d",  buf,  0x26u);
            }
          }

          else
          {
            uint64_t v70 = DMFConfigurationEngineLog(v53);
            id v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              __int128 v71 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 uniqueIdentifier]);
              id v72 = (void *)objc_claimAutoreleasedReturnValue([v298 identifier]);
              *(_DWORD *)buf = 138543874;
              v381 = v71;
              __int16 v382 = 2114;
              id v383 = v72;
              __int16 v384 = 1024;
              LODWORD(v385) = obj;
              _os_log_error_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_ERROR,  "Failed to create activation predicate observer with unique identifier %{public}@ for organization (%{pub lic}@) using last predicate evaluation %d",  buf,  0x1Cu);
            }
          }

          uint64_t v56 = 0LL;
LABEL_42:
        }

        else
        {
          v49 = v42;
          uint64_t v65 = DMFConfigurationEngineLog(v47);
          id v52 = (void *)objc_claimAutoreleasedReturnValue(v65);
          if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_DEFAULT))
          {
            __int128 v66 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 uniqueIdentifier]);
            id v67 = (void *)objc_claimAutoreleasedReturnValue([v298 identifier]);
            *(_DWORD *)buf = 138543618;
            v381 = v66;
            __int16 v382 = 2114;
            id v383 = v67;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v52,  OS_LOG_TYPE_DEFAULT,  "Activation predicate with unique identifier %{public}@ for organization (%{public}@) is nil",  buf,  0x16u);
          }

          uint64_t v56 = 0LL;
          unsigned int obj = 1;
        }

        v75 = objc_alloc(&OBJC_CLASS___NSMutableArray);
        v76 = (void *)objc_claimAutoreleasedReturnValue([v49 payloadStandardConfigurations]);
        __int16 v77 = -[NSMutableArray initWithArray:](v75, "initWithArray:", v76);

        v78 = (void *)objc_claimAutoreleasedReturnValue([v298 identifier]);
        v79 = (void *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationPayloadMetadata fetchRequestForAvailableConfigurationsFromOrganizationWithIdentifier:payloadIdentifiers:]( &OBJC_CLASS___DMDConfigurationPayloadMetadata,  "fetchRequestForAvailableConfigurationsFromOrganizationWithIdentifier:payloadIdentifiers:",  v78,  v77));

        v80 = (void *)objc_claimAutoreleasedReturnValue([v79 execute:v299]);
        if (v80)
        {
          if (!v56)
          {
            uint64_t v378 = v313;
            id v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", obj));
            v379 = v81;
            uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v379,  &v378,  1LL));
          }

          [v22 setPredicatePayloadMetadata:v56];
          [v22 setInstalled:1];
          id v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v80));
          [v22 setOutgoingPayloadMetadataReferences:v82];

          [v22 updateStateDictionaryIfNeeded];
        }

        else
        {
          uint64_t v83 = DMFConfigurationEngineLog(0LL);
          v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
          if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          {
            objc = (os_log_s *)objc_claimAutoreleasedReturnValue([v298 identifier]);
            v300 = (void *)objc_claimAutoreleasedReturnValue([*v299 verboseDescription]);
            *(_DWORD *)buf = 138543618;
            v381 = objc;
            __int16 v382 = 2114;
            id v383 = v300;
            _os_log_error_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_ERROR,  "Failed to fetch available configurations for organization (%{public}@): %{public}@",  buf,  0x16u);
          }

          [v22 setFailed:1];
        }

        a7 = v299;
        id v17 = v307;
        goto LABEL_51;
      }

      uint64_t v57 = DMFConfigurationEngineLog(isKindOfClass);
      id v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        id v59 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 type]);
        *(_DWORD *)buf = 138543362;
        v381 = v59;
        _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "Unknown activation type: %{public}@",  buf,  0xCu);
      }

LABEL_52:
    }

    id v19 = [v17 countByEnumeratingWithState:&v360 objects:v394 count:16];
  }

  while (v19);
LABEL_54:

  id v12 = v289;
  if (-[DMDEngineDatabaseProcessingOperation updateActiveRestrictionsInContext:error:]( self,  "updateActiveRestrictionsInContext:error:",  v289,  a7))
  {
    v308 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v314 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    v302 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    __int128 v356 = 0u;
    __int128 v357 = 0u;
    __int128 v358 = 0u;
    __int128 v359 = 0u;
    id obja = v292;
    id v90 = [obja countByEnumeratingWithState:&v356 objects:v375 count:16];
    if (v90)
    {
      id v91 = v90;
      uint64_t v92 = *(void *)v357;
      do
      {
        for (j = 0LL; j != v91; j = (char *)j + 1)
        {
          if (*(void *)v357 != v92) {
            objc_enumerationMutation(obja);
          }
          uint64_t v94 = *(void **)(*((void *)&v356 + 1) + 8LL * (void)j);
          uint64_t v95 = objc_opt_class(&OBJC_CLASS___DMDDeclarationActionOperation);
          if ((objc_opt_isKindOfClass(v94, v95) & 1) != 0)
          {
            v96 = (void *)objc_claimAutoreleasedReturnValue([v94 payloadMetadataObjectID]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v314, "setObject:forKeyedSubscript:", v94, v96);

            uint64_t v97 = (void *)objc_claimAutoreleasedReturnValue([v94 payloadIdentifier]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v302, "setObject:forKeyedSubscript:", v94, v97);
          }
        }

        id v91 = [obja countByEnumeratingWithState:&v356 objects:v375 count:16];
      }

      while (v91);
    }

    v98 = (void *)objc_claimAutoreleasedReturnValue([v298 identifier]);
    uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationPayloadMetadata fetchRequestForConfigurationsPendingRemoveFromOrganizationWithIdentifier:]( &OBJC_CLASS___DMDConfigurationPayloadMetadata,  "fetchRequestForConfigurationsPendingRemoveFromOrganizationWithIdentifier:",  v98));

    uint64_t v100 = (void *)objc_claimAutoreleasedReturnValue([v99 execute:a7]);
    id v101 = [v100 mutableCopy];

    if (v101)
    {
      v285 = v99;
      v286 = v101;
      __int128 v354 = 0u;
      __int128 v355 = 0u;
      __int128 v352 = 0u;
      __int128 v353 = 0u;
      id v318 = [v101 copy];
      id v103 = [v318 countByEnumeratingWithState:&v352 objects:v374 count:16];
      if (v103)
      {
        id v104 = v103;
        uint64_t v105 = *(void *)v353;
        p_cache = (objc_class *)&OBJC_CLASS___CEMImageAssetInstallMetadata.cache;
        uint64_t v303 = *(void *)v353;
        do
        {
          v107 = 0LL;
          id v304 = v104;
          do
          {
            if (*(void *)v353 != v105) {
              objc_enumerationMutation(v318);
            }
            uint64_t v108 = *(void **)(*((void *)&v352 + 1) + 8LL * (void)v107);
            v109 = (void *)objc_claimAutoreleasedReturnValue([v108 identifier]);
            uint64_t v110 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v302, "objectForKeyedSubscript:", v109));

            uint64_t v111 = objc_opt_class(&p_cache[458]);
            uint64_t v112 = objc_opt_isKindOfClass(v110, v111);
            if ((v112 & 1) != 0)
            {
              uint64_t v113 = DMFConfigurationEngineLog(v112);
              id v114 = (os_log_s *)objc_claimAutoreleasedReturnValue(v113);
              if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
              {
                id v115 = (os_log_s *)objc_claimAutoreleasedReturnValue([v108 identifier]);
                *(_DWORD *)buf = 138543362;
                v381 = v115;
                _os_log_impl( (void *)&_mh_execute_header,  v114,  OS_LOG_TYPE_INFO,  "Remove %{public}@: Declaration remove operation already enqueued, skipping",  buf,  0xCu);
              }
            }

            else
            {
              if (v110)
              {
                uint64_t v116 = DMFConfigurationEngineLog(v112);
                v117 = (os_log_s *)objc_claimAutoreleasedReturnValue(v116);
                if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
                {
                  v118 = (os_log_s *)objc_claimAutoreleasedReturnValue([v108 identifier]);
                  uint64_t v119 = (objc_class *)objc_opt_class(v110);
                  v120 = NSStringFromClass(v119);
                  id v121 = (id)objc_claimAutoreleasedReturnValue(v120);
                  *(_DWORD *)buf = 138543618;
                  v381 = v118;
                  __int16 v382 = 2114;
                  id v383 = v121;
                  _os_log_impl( (void *)&_mh_execute_header,  v117,  OS_LOG_TYPE_INFO,  "Remove %{public}@: Cancelling enqueued %{public}@ so we can enqueue a remove operation",  buf,  0x16u);
                }

                [v110 cancel];
              }

              uint64_t v122 = p_cache;
              id v123 = objc_alloc(p_cache + 458);
              v124 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));
              id v125 = (void *)objc_claimAutoreleasedReturnValue([v108 objectID]);
              id v126 = (void *)objc_claimAutoreleasedReturnValue([v108 identifier]);
              id v114 = (os_log_s *)[v123 initWithDatabase:v124 payloadMetadataObjectID:v125 payloadIdentifier:v126];

              uint64_t v127 = (void *)objc_claimAutoreleasedReturnValue([v108 identifier]);
              -[os_log_s setName:](v114, "setName:", v127);

              -[os_log_s setRequiresNetworkTether:]( v114,  "setRequiresNetworkTether:",  [v108 requiresNetworkTether]);
              -[os_log_s setRequiresUnlockedKeychain:]( v114,  "setRequiresUnlockedKeychain:",  [v108 requiresUnlockedKeychain]);
              v128 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation deviceStateProvider](self, "deviceStateProvider"));
              -[os_log_s setDeviceStateProvider:](v114, "setDeviceStateProvider:", v128);

              v129 = (void *)objc_claimAutoreleasedReturnValue( -[DMDEngineDatabaseProcessingOperation taskOperationProvider]( self,  "taskOperationProvider"));
              -[os_log_s setTaskOperationProvider:](v114, "setTaskOperationProvider:", v129);

              -[os_log_s addObject:](v308, "addObject:", v114);
              uint64_t v130 = (void *)objc_claimAutoreleasedReturnValue([v108 objectID]);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v314, "setObject:forKeyedSubscript:", v114, v130);

              uint64_t v132 = DMFConfigurationEngineLog(v131);
              uint64_t v133 = (os_log_s *)objc_claimAutoreleasedReturnValue(v132);
              if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                v381 = v114;
                _os_log_impl( (void *)&_mh_execute_header,  v133,  OS_LOG_TYPE_INFO,  "Enqueued remove operation: %{public}@",  buf,  0xCu);
              }

              p_cache = v122;
              uint64_t v105 = v303;
              id v104 = v304;
            }

            v107 = (char *)v107 + 1;
          }

          while (v104 != v107);
          id v104 = [v318 countByEnumeratingWithState:&v352 objects:v374 count:16];
        }

        while (v104);
      }

      v134 = (void *)objc_claimAutoreleasedReturnValue([v298 identifier]);
      v135 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationPayloadMetadata fetchRequestForConfigurationsPendingInstallFromOrganizationWithIdentifier:]( &OBJC_CLASS___DMDConfigurationPayloadMetadata,  "fetchRequestForConfigurationsPendingInstallFromOrganizationWithIdentifier:",  v134));

      v288 = v135;
      uint64_t v136 = (uint64_t)v299;
      uint64_t v137 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s execute:](v135, "execute:", v299));
      id v138 = [v137 mutableCopy];

      v287 = v138;
      if (v138)
      {
        __int128 v350 = 0u;
        __int128 v351 = 0u;
        __int128 v348 = 0u;
        __int128 v349 = 0u;
        id v295 = [v138 copy];
        id v140 = [v295 countByEnumeratingWithState:&v348 objects:v373 count:16];
        v141 = v314;
        if (v140)
        {
          id v142 = v140;
          uint64_t v143 = *(void *)v349;
          id v144 = (objc_class *)&OBJC_CLASS___CEMImageAssetInstallMetadata.cache;
          uint64_t v293 = *(void *)v349;
          do
          {
            v145 = 0LL;
            id v294 = v142;
            do
            {
              if (*(void *)v349 != v143) {
                objc_enumerationMutation(v295);
              }
              v146 = *(void **)(*((void *)&v348 + 1) + 8LL * (void)v145);
              v147 = (void *)objc_claimAutoreleasedReturnValue([v146 identifier]);
              v148 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v302, "objectForKeyedSubscript:", v147));

              uint64_t v149 = objc_opt_class(&v144[418]);
              uint64_t v150 = objc_opt_isKindOfClass(v148, v149);
              if ((v150 & 1) == 0)
              {
                if (v148)
                {
                  uint64_t v154 = DMFConfigurationEngineLog(v150);
                  __int128 v155 = (os_log_s *)objc_claimAutoreleasedReturnValue(v154);
                  if (os_log_type_enabled(v155, OS_LOG_TYPE_INFO))
                  {
                    __int128 v156 = (os_log_s *)objc_claimAutoreleasedReturnValue([v146 identifier]);
                    __int128 v157 = (objc_class *)objc_opt_class(v148);
                    __int128 v158 = NSStringFromClass(v157);
                    id v159 = (id)objc_claimAutoreleasedReturnValue(v158);
                    *(_DWORD *)buf = 138543618;
                    v381 = v156;
                    __int16 v382 = 2114;
                    id v383 = v159;
                    _os_log_impl( (void *)&_mh_execute_header,  v155,  OS_LOG_TYPE_INFO,  "Install %{public}@: Cancelling enqueued %{public}@ so we can enqueue an install operation",  buf,  0x16u);
                  }

                  [v148 cancel];
                }

                v296 = v148;
                v297 = v145;
                id v160 = objc_alloc(v144 + 418);
                __int128 v161 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));
                __int128 v162 = (void *)objc_claimAutoreleasedReturnValue([v146 objectID]);
                __int128 v163 = (void *)objc_claimAutoreleasedReturnValue([v146 identifier]);
                id v164 = [v160 initWithDatabase:v161 payloadMetadataObjectID:v162 payloadIdentifier:v163];

                __int128 v165 = (void *)objc_claimAutoreleasedReturnValue([v146 identifier]);
                [v164 setName:v165];

                objc_msgSend(v164, "setRequiresNetworkTether:", objc_msgSend(v146, "requiresNetworkTether"));
                objc_msgSend(v164, "setRequiresUnlockedKeychain:", objc_msgSend(v146, "requiresUnlockedKeychain"));
                __int128 v166 = (void *)objc_claimAutoreleasedReturnValue( -[DMDEngineDatabaseProcessingOperation deviceStateProvider]( self,  "deviceStateProvider"));
                [v164 setDeviceStateProvider:v166];

                __int128 v167 = (void *)objc_claimAutoreleasedReturnValue( -[DMDEngineDatabaseProcessingOperation taskOperationProvider]( self,  "taskOperationProvider"));
                [v164 setTaskOperationProvider:v167];

                -[os_log_s addObject:](v308, "addObject:", v164);
                __int128 v168 = (void *)objc_claimAutoreleasedReturnValue([v146 objectID]);
                -[NSMutableDictionary setObject:forKeyedSubscript:](v141, "setObject:forKeyedSubscript:", v164, v168);

                uint64_t v169 = DMFConfigurationEngineLog([obja addObject:v164]);
                __int128 v170 = (os_log_s *)objc_claimAutoreleasedReturnValue(v169);
                if (os_log_type_enabled(v170, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138543362;
                  v381 = (os_log_s *)v164;
                  _os_log_impl( (void *)&_mh_execute_header,  v170,  OS_LOG_TYPE_INFO,  "Enqueued configuration install operation: %{public}@",  buf,  0xCu);
                }

                __int128 v346 = 0u;
                __int128 v347 = 0u;
                __int128 v344 = 0u;
                __int128 v345 = 0u;
                __int128 v171 = (void *)objc_claimAutoreleasedReturnValue([v146 outgoingPayloadMetadataReferences]);
                id v172 = [v171 countByEnumeratingWithState:&v344 objects:v372 count:16];
                __int128 v173 = &OBJC_CLASS___CEMImageAssetInstallMetadata.cache;
                v319 = (os_log_s *)v164;
                if (!v172)
                {
LABEL_118:

                  uint64_t v143 = v293;
                  id v142 = v294;
                  id v144 = (objc_class *)(&OBJC_CLASS___CEMImageAssetInstallMetadata + 16);
                  v145 = v297;
                  v148 = v296;
                  goto LABEL_119;
                }

                id v174 = v172;
                uint64_t v175 = *(void *)v345;
                while (2)
                {
                  uint64_t v176 = 0LL;
LABEL_100:
                  if (*(void *)v345 != v175) {
                    objc_enumerationMutation(v171);
                  }
                  __int128 v177 = *(void **)(*((void *)&v344 + 1) + 8 * v176);
                  uint64_t v178 = objc_opt_class(v173 + 278);
                  if ((objc_opt_isKindOfClass(v177, v178) & 1) != 0
                    && ([v177 installed] & 1) == 0)
                  {
                    __int128 v179 = (void *)objc_claimAutoreleasedReturnValue([v177 objectID]);
                    __int128 v180 = (DMDAssetInstallOperation *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v141,  "objectForKeyedSubscript:",  v179));

                    uint64_t v181 = objc_opt_class(&OBJC_CLASS___DMDAssetInstallOperation);
                    uint64_t v182 = objc_opt_isKindOfClass(v180, v181);
                    if ((v182 & 1) != 0)
                    {
                      if (!v180) {
                        goto LABEL_110;
                      }
                    }

                    else
                    {
                      uint64_t v183 = DMFConfigurationEngineLog(v182);
                      __int128 v184 = (os_log_s *)objc_claimAutoreleasedReturnValue(v183);
                      if (os_log_type_enabled(v184, OS_LOG_TYPE_INFO))
                      {
                        __int128 v185 = (os_log_s *)objc_claimAutoreleasedReturnValue([v177 identifier]);
                        __int128 v186 = (objc_class *)objc_opt_class(v180);
                        v187 = NSStringFromClass(v186);
                        id v188 = (id)objc_claimAutoreleasedReturnValue(v187);
                        *(_DWORD *)buf = 138543618;
                        v381 = v185;
                        __int16 v382 = 2114;
                        id v383 = v188;
                        _os_log_impl( (void *)&_mh_execute_header,  v184,  OS_LOG_TYPE_INFO,  "Install %{public}@: Cancelling enqueued %{public}@ so we can enqueue an asset install operation",  buf,  0x16u);
                      }

                      -[DMDAssetInstallOperation cancel](v180, "cancel");
LABEL_110:
                      v189 = objc_alloc(&OBJC_CLASS___DMDAssetInstallOperation);
                      v190 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));
                      v191 = (void *)objc_claimAutoreleasedReturnValue([v177 objectID]);
                      v192 = (void *)objc_claimAutoreleasedReturnValue([v177 identifier]);
                      v193 = -[DMDPayloadActionOperation initWithDatabase:payloadMetadataObjectID:payloadIdentifier:]( v189,  "initWithDatabase:payloadMetadataObjectID:payloadIdentifier:",  v190,  v191,  v192);

                      v194 = (void *)objc_claimAutoreleasedReturnValue([v177 identifier]);
                      -[DMDAssetInstallOperation setName:](v193, "setName:", v194);

                      -[DMDPayloadActionOperation setRequiresNetworkTether:]( v193,  "setRequiresNetworkTether:",  [v177 requiresNetworkTether]);
                      -[DMDPayloadActionOperation setRequiresUnlockedKeychain:]( v193,  "setRequiresUnlockedKeychain:",  [v177 requiresUnlockedKeychain]);
                      __int16 v195 = (void *)objc_claimAutoreleasedReturnValue( -[DMDEngineDatabaseProcessingOperation deviceStateProvider]( self,  "deviceStateProvider"));
                      -[DMDPayloadActionOperation setDeviceStateProvider:](v193, "setDeviceStateProvider:", v195);

                      v141 = v314;
                      v196 = (void *)objc_claimAutoreleasedReturnValue( -[DMDEngineDatabaseProcessingOperation taskOperationProvider]( self,  "taskOperationProvider"));
                      -[DMDPayloadActionOperation setTaskOperationProvider:](v193, "setTaskOperationProvider:", v196);

                      -[DMDAssetInstallOperation setAssetResolver:](v193, "setAssetResolver:", v306);
                      -[os_log_s addObject:](v308, "addObject:", v193);
                      v197 = (void *)objc_claimAutoreleasedReturnValue([v177 objectID]);
                      -[NSMutableDictionary setObject:forKeyedSubscript:]( v314,  "setObject:forKeyedSubscript:",  v193,  v197);

                      [obja addObject:v193];
                      __int128 v180 = v193;
                      uint64_t v198 = DMFConfigurationEngineLog(v180);
                      v199 = (os_log_s *)objc_claimAutoreleasedReturnValue(v198);
                      if (os_log_type_enabled(v199, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138543362;
                        v381 = (os_log_s *)v180;
                        _os_log_impl( (void *)&_mh_execute_header,  v199,  OS_LOG_TYPE_INFO,  "Enqueued asset install operation: %{public}@",  buf,  0xCu);
                      }

                      __int128 v173 = (void **)(&OBJC_CLASS___CEMImageAssetInstallMetadata + 16);
                    }

                    v200 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s dependencies](v319, "dependencies"));
                    unsigned __int8 v201 = [v200 containsObject:v180];

                    if ((v201 & 1) == 0) {
                      -[os_log_s addDependency:](v319, "addDependency:", v180);
                    }
                  }

                  if (v174 == (id)++v176)
                  {
                    id v174 = [v171 countByEnumeratingWithState:&v344 objects:v372 count:16];
                    if (!v174) {
                      goto LABEL_118;
                    }
                    continue;
                  }

                  goto LABEL_100;
                }
              }

              uint64_t v151 = DMFConfigurationEngineLog(v150);
              v152 = (os_log_s *)objc_claimAutoreleasedReturnValue(v151);
              v319 = v152;
              if (os_log_type_enabled(v152, OS_LOG_TYPE_INFO))
              {
                v153 = (os_log_s *)objc_claimAutoreleasedReturnValue([v146 identifier]);
                *(_DWORD *)buf = 138543362;
                v381 = v153;
                _os_log_impl( (void *)&_mh_execute_header,  v152,  OS_LOG_TYPE_INFO,  "Install %{public}@: Declaration install operation already enqueued, skipping",  buf,  0xCu);
              }

- (DMDEngineDatabaseProcessingOperationDelegate)delegate
{
  return (DMDEngineDatabaseProcessingOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (DMDDeviceStateProvider)deviceStateProvider
{
  return self->_deviceStateProvider;
}

- (void)setDeviceStateProvider:(id)a3
{
}

- (DMDTaskOperationProvider)taskOperationProvider
{
  return self->_taskOperationProvider;
}

- (void)setTaskOperationProvider:(id)a3
{
}

- (DMDActivationPredicateObserverManager)activationPredicateObserverManager
{
  return self->_activationPredicateObserverManager;
}

- (void)setActivationPredicateObserverManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end