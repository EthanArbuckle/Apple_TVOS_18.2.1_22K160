@interface RMStatusSubscriptionsSubscriber
- (BOOL)_updateStatusSubscriptionUIsForManagementSource:(id)a3;
- (BOOL)_updateStatusSubscriptionsForManagementSource:(id)a3;
- (NSManagedObjectContext)context;
- (NSSet)configurationTypes;
- (NSString)identifier;
- (RMStatusSubscriptionsSubscriber)init;
- (id)_getActiveStatusSubscriptionConfigurationsFromManagementSource:(id)a3;
- (id)_getActiveStatusSubscriptionConfigurationsFromManagementSource:(id)a3 onlyMissingUI:(BOOL)a4;
- (id)_getStatusSubscriptionsFromManagementSource:(id)a3;
- (id)_makeStatusSubscriptionWithManagementSource:(id)a3 declaration:(id)a4 context:(id)a5;
- (id)reportDetails;
- (void)applyChangedConfigurationsTypes:(id)a3;
- (void)fetchMissingConfigurationUIs;
- (void)setContext:(id)a3;
@end

@implementation RMStatusSubscriptionsSubscriber

- (RMStatusSubscriptionsSubscriber)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RMStatusSubscriptionsSubscriber;
  v2 = -[RMStatusSubscriptionsSubscriber init](&v9, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RMPersistentController sharedController](&OBJC_CLASS___RMPersistentController, "sharedController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentContainer]);

    v5 = (NSManagedObjectContext *)[v4 newBackgroundContext];
    -[NSManagedObjectContext setAutomaticallyMergesChangesFromParent:]( v5,  "setAutomaticallyMergesChangesFromParent:",  1LL);
    -[NSManagedObjectContext setMergePolicy:](v5, "setMergePolicy:", NSMergeByPropertyStoreTrumpMergePolicy);
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"RMStatusSubscriptionsSubscriber"));
    -[NSManagedObjectContext setTransactionAuthor:](v5, "setTransactionAuthor:", v6);

    context = v2->_context;
    v2->_context = v5;
  }

  return v2;
}

- (NSString)identifier
{
  return (NSString *)@"RMStatusSubscriptionsSubscriber";
}

- (NSSet)configurationTypes
{
  return +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", RMConfigurationTypeManagementStatusSubscription);
}

- (void)applyChangedConfigurationsTypes:(id)a3
{
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog statusSubscriptionsSubscriber](&OBJC_CLASS___RMLog, "statusSubscriptionsSubscriber", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Updating status subscriptions", buf, 2u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10005F510;
  v6[3] = &unk_1000B90A0;
  v6[4] = self;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[RMStatusSubscriptionsSubscriber context](self, "context"));
  id v5 = v7;
  [v5 performBlockAndWait:v6];
}

- (void)fetchMissingConfigurationUIs
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog statusSubscriptionsSubscriber](&OBJC_CLASS___RMLog, "statusSubscriptionsSubscriber"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Updating status subscription UIs", buf, 2u);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10005F8DC;
  v5[3] = &unk_1000B90A0;
  v5[4] = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[RMStatusSubscriptionsSubscriber context](self, "context"));
  id v4 = v6;
  [v4 performBlockAndWait:v5];
}

- (id)reportDetails
{
  v10[0] = @"Internal";
  v9[0] = @"Location";
  v9[1] = @"Identifier";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusSubscriptionsSubscriber identifier](self, "identifier"));
  v10[1] = v3;
  v9[2] = @"ConfigurationTypes";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusSubscriptionsSubscriber configurationTypes](self, "configurationTypes"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
  v10[2] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  return v7;
}

- (BOOL)_updateStatusSubscriptionsForManagementSource:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[RMStatusSubscriptionsSubscriber _getStatusSubscriptionsFromManagementSource:]( self,  "_getStatusSubscriptionsFromManagementSource:",  v4));
  if (v5)
  {
    v94 = self;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[RMStatusSubscriptionsSubscriber _getActiveStatusSubscriptionConfigurationsFromManagementSource:]( self,  "_getActiveStatusSubscriptionConfigurationsFromManagementSource:",  v4));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));

    v95 = v6;
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));

    id v134 = 0LL;
    id v133 = 0LL;
    id v132 = 0LL;
    v86 = (void *)v10;
    v87 = (void *)v8;
    +[RMStoreDeclarationKey synchronizeOldKeys:newKeys:returningUnchangedKeys:returningApplyKeys:returningRemoveKeys:]( &OBJC_CLASS___RMStoreDeclarationKey,  "synchronizeOldKeys:newKeys:returningUnchangedKeys:returningApplyKeys:returningRemoveKeys:",  v8,  v10,  &v134,  &v133,  &v132);
    id v85 = v134;
    id v11 = v133;
    id v12 = v132;
    v130[0] = _NSConcreteStackBlock;
    v130[1] = 3221225472LL;
    v130[2] = sub_100060948;
    v130[3] = &unk_1000BA960;
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v11 count]));
    id v131 = v13;
    v88 = v11;
    [v11 enumerateObjectsUsingBlock:v130];
    v83 = v13;
    v84 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 setByAddingObjectsFromSet:v12]);
    BOOL v89 = [v14 count] != 0;
    v99 = (void *)objc_claimAutoreleasedReturnValue([v4 managedObjectContext]);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog statusSubscriptionsSubscriber](&OBJC_CLASS___RMLog, "statusSubscriptionsSubscriber"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_1000618A4(v14, v15);
    }

    __int128 v128 = 0u;
    __int128 v129 = 0u;
    __int128 v126 = 0u;
    __int128 v127 = 0u;
    id obj = v14;
    v104 = v4;
    v96 = v5;
    id v97 = [obj countByEnumeratingWithState:&v126 objects:v145 count:16];
    if (v97)
    {
      uint64_t v92 = *(void *)v127;
      do
      {
        for (i = 0LL; i != v97; i = (char *)i + 1)
        {
          if (*(void *)v127 != v92) {
            objc_enumerationMutation(obj);
          }
          v100 = *(void **)(*((void *)&v126 + 1) + 8LL * (void)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:"));
          __int128 v122 = 0u;
          __int128 v123 = 0u;
          __int128 v124 = 0u;
          __int128 v125 = 0u;
          v102 = v17;
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 items]);
          id v19 = [v18 countByEnumeratingWithState:&v122 objects:v144 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v123;
            do
            {
              for (j = 0LL; j != v20; j = (char *)j + 1)
              {
                if (*(void *)v123 != v21) {
                  objc_enumerationMutation(v18);
                }
                v23 = *(void **)(*((void *)&v122 + 1) + 8LL * (void)j);
                __int128 v118 = 0u;
                __int128 v119 = 0u;
                __int128 v120 = 0u;
                __int128 v121 = 0u;
                v24 = (void *)objc_claimAutoreleasedReturnValue([v23 subscribedStatusKeyPaths]);
                id v25 = [v24 copy];

                id v26 = [v25 countByEnumeratingWithState:&v118 objects:v143 count:16];
                if (v26)
                {
                  id v27 = v26;
                  uint64_t v28 = *(void *)v119;
                  do
                  {
                    for (k = 0LL; k != v27; k = (char *)k + 1)
                    {
                      if (*(void *)v119 != v28) {
                        objc_enumerationMutation(v25);
                      }
                      [*(id *)(*((void *)&v118 + 1) + 8 * (void)k) removeStatusSubscriptionItemsObject:v23];
                    }

                    id v27 = [v25 countByEnumeratingWithState:&v118 objects:v143 count:16];
                  }

                  while (v27);
                }
              }

              id v20 = [v18 countByEnumeratingWithState:&v122 objects:v144 count:16];
            }

            while (v20);
          }

          [v99 deleteObject:v102];
          id v4 = v104;
          v30 = (void *)objc_claimAutoreleasedReturnValue([v104 identifier]);
          v31 = (void *)objc_claimAutoreleasedReturnValue([v100 declarationIdentifier]);
          v32 = (void *)objc_claimAutoreleasedReturnValue([v100 declarationServerToken]);
          id v117 = 0LL;
          unsigned __int8 v33 = +[RMConfigurationStatusArchiver removeStatusForStoreIdentifier:declarationIdentifier:declarationServerToken:error:]( &OBJC_CLASS___RMConfigurationStatusArchiver,  "removeStatusForStoreIdentifier:declarationIdentifier:declarationServerToken:error:",  v30,  v31,  v32,  &v117);
          id v34 = v117;

          if ((v33 & 1) == 0)
          {
            v35 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[RMLog statusSubscriptionsSubscriber]( &OBJC_CLASS___RMLog,  "statusSubscriptionsSubscriber"));
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v139 = (uint64_t)v34;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEBUG,  "Status subscription status removal failed: %{public}@",  buf,  0xCu);
            }
          }

          id v5 = v96;
        }

        id v97 = [obj countByEnumeratingWithState:&v126 objects:v145 count:16];
      }

      while (v97);
    }

    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog statusSubscriptionsSubscriber](&OBJC_CLASS___RMLog, "statusSubscriptionsSubscriber"));
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      sub_100061830(v88, v36);
    }

    __int128 v115 = 0u;
    __int128 v116 = 0u;
    __int128 v113 = 0u;
    __int128 v114 = 0u;
    id v90 = v88;
    id v37 = [v90 countByEnumeratingWithState:&v113 objects:v142 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v98 = *(void *)v114;
      do
      {
        v39 = 0LL;
        id v101 = v38;
        do
        {
          if (*(void *)v114 != v98) {
            objc_enumerationMutation(v90);
          }
          v40 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v113 + 1) + 8 * (void)v39) applyKey]);
          v41 = (void *)objc_claimAutoreleasedReturnValue([v95 objectForKeyedSubscript:v40]);
          v42 = (void *)objc_claimAutoreleasedReturnValue([v41 payload]);

          if (v42)
          {
            v43 = (void *)objc_claimAutoreleasedReturnValue([v41 payload]);
            id v112 = 0LL;
            uint64_t v44 = objc_claimAutoreleasedReturnValue( +[RMModelManagementStatusSubscriptionsDeclaration loadData:serializationType:error:]( &OBJC_CLASS___RMModelManagementStatusSubscriptionsDeclaration,  "loadData:serializationType:error:",  v43,  0LL,  &v112));
            id v45 = v112;

            if (v44)
            {
              v93 = v41;
              v103 = (void *)v44;
              if (objc_msgSend( (id)objc_opt_class(v44),  "isSupportedForPlatform:scope:enrollmentType:",  +[RMModelSharedDefinitions currentPlatform]( RMModelSharedDefinitions,  "currentPlatform"),  +[RMBundle managementScope](RMBundle, "managementScope"),  (int)objc_msgSend(v4, "enrollmentType")))
              {
                v46 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[RMStatusSubscriptionsSubscriber _makeStatusSubscriptionWithManagementSource:declaration:context:]( v94,  "_makeStatusSubscriptionWithManagementSource:declaration:context:",  v4,  v44,  v99));
                uint64_t v47 = objc_claimAutoreleasedReturnValue( +[RMExternalStatusPublisher sharedPublisher]( &OBJC_CLASS___RMExternalStatusPublisher,  "sharedPublisher"));
                v48 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
                [(id)v47 publishStatusKeys:v46 storeIdentifier:v48];

                v49 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
                v50 = (void *)objc_claimAutoreleasedReturnValue([v40 declarationIdentifier]);
                v51 = (void *)objc_claimAutoreleasedReturnValue([v40 declarationServerToken]);
                v52 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusSubscriptionsSubscriber identifier](v94, "identifier"));
                id v109 = v45;
                BOOL v89 = 1;
                LOBYTE(v47) = +[RMConfigurationStatusArchiver persistStatusForStoreIdentifier:declarationIdentifier:declarationServerToken:sourceIdentifier:validity:reasons:error:]( &OBJC_CLASS___RMConfigurationStatusArchiver,  "persistStatusForStoreIdentifier:declarationIdentifier:declarationServerToken:sourceIdent ifier:validity:reasons:error:",  v49,  v50,  v51,  v52,  1LL,  0LL,  &v109);
                id v53 = v109;

                if ((v47 & 1) == 0)
                {
                  v54 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[RMLog statusSubscriptionsSubscriber]( &OBJC_CLASS___RMLog,  "statusSubscriptionsSubscriber"));
                  id v55 = v101;
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543362;
                    uint64_t v139 = (uint64_t)v53;
                    _os_log_debug_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEBUG,  "Status subscription status persist for success failed: %{public}@",  buf,  0xCu);
                  }

                  BOOL v89 = 1;
                  id v4 = v104;
                  goto LABEL_55;
                }
              }

              else
              {
                v64 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[RMLog statusSubscriptionsSubscriber]( &OBJC_CLASS___RMLog,  "statusSubscriptionsSubscriber"));
                if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v139 = v44;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_ERROR,  "Declaration not supported: %{public}@",  buf,  0xCu);
                }

                uint64_t v65 = objc_claimAutoreleasedReturnValue( +[RMModelStatusReason reasonWithCode:description:underlyingError:]( &OBJC_CLASS___RMModelStatusReason,  "reasonWithCode:description:underlyingError:",  @"Error.ConfigurationNotSupported",  @"Configuration not supported",  v45));
                uint64_t v136 = v65;
                v46 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v136,  1LL));

                v66 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
                v67 = (void *)objc_claimAutoreleasedReturnValue([v40 declarationIdentifier]);
                v68 = (void *)objc_claimAutoreleasedReturnValue([v40 declarationServerToken]);
                v69 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusSubscriptionsSubscriber identifier](v94, "identifier"));
                id v110 = v45;
                LOBYTE(v65) = +[RMConfigurationStatusArchiver persistStatusForStoreIdentifier:declarationIdentifier:declarationServerToken:sourceIdentifier:validity:reasons:error:]( &OBJC_CLASS___RMConfigurationStatusArchiver,  "persistStatusForStoreIdentifier:declarationIdentifier:declarationServerToken:sourceIdent ifier:validity:reasons:error:",  v66,  v67,  v68,  v69,  0LL,  v46,  &v110);
                id v53 = v110;

                if ((v65 & 1) == 0)
                {
                  v70 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[RMLog statusSubscriptionsSubscriber]( &OBJC_CLASS___RMLog,  "statusSubscriptionsSubscriber"));
                  id v55 = v101;
                  v57 = v93;
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543362;
                    uint64_t v139 = (uint64_t)v53;
                    _os_log_debug_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_DEBUG,  "Status subscription status persist for error failed: %{public}@",  buf,  0xCu);
                  }

                  id v4 = v104;
                  goto LABEL_59;
                }
              }

              id v4 = v104;
              id v55 = v101;
LABEL_55:
              v57 = v93;
              goto LABEL_59;
            }
          }

          else
          {
            id v45 = (id)objc_claimAutoreleasedReturnValue(+[RMErrorUtilities createInternalError](&OBJC_CLASS___RMErrorUtilities, "createInternalError"));
          }

          v56 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[RMLog statusSubscriptionsSubscriber]( &OBJC_CLASS___RMLog,  "statusSubscriptionsSubscriber"));
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v139 = (uint64_t)v41;
            __int16 v140 = 2114;
            id v141 = v45;
            _os_log_error_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_ERROR,  "Unable to de-serialize declaration %{public}@: %{public}@",  buf,  0x16u);
          }

          v57 = v41;

          v58 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason reasonWithCode:description:underlyingError:]( &OBJC_CLASS___RMModelStatusReason,  "reasonWithCode:description:underlyingError:",  @"Error.ConfigurationIsInvalid",  @"Configuration is invalid",  v45));
          v137 = v58;
          uint64_t v59 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v137, 1LL));

          v60 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
          v61 = (void *)objc_claimAutoreleasedReturnValue([v40 declarationIdentifier]);
          v62 = (void *)objc_claimAutoreleasedReturnValue([v40 declarationServerToken]);
          v63 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusSubscriptionsSubscriber identifier](v94, "identifier"));
          id v111 = v45;
          v103 = (void *)v59;
          LOBYTE(v59) = +[RMConfigurationStatusArchiver persistStatusForStoreIdentifier:declarationIdentifier:declarationServerToken:sourceIdentifier:validity:reasons:error:]( &OBJC_CLASS___RMConfigurationStatusArchiver,  "persistStatusForStoreIdentifier:declarationIdentifier:declarationServerToken:sourceIdentifier: validity:reasons:error:",  v60,  v61,  v62,  v63,  0LL,  v59,  &v111);
          id v53 = v111;

          if ((v59 & 1) != 0)
          {
            id v4 = v104;
            id v55 = v101;
            goto LABEL_60;
          }

          v46 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[RMLog statusSubscriptionsSubscriber]( &OBJC_CLASS___RMLog,  "statusSubscriptionsSubscriber"));
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v139 = (uint64_t)v53;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEBUG,  "Status subscription status persist for error failed: %{public}@",  buf,  0xCu);
          }

          id v4 = v104;
          id v55 = v101;
LABEL_59:

LABEL_60:
          v39 = (char *)v39 + 1;
        }

        while (v55 != v39);
        id v38 = [v90 countByEnumeratingWithState:&v113 objects:v142 count:16];
      }

      while (v38);
    }

    __int128 v107 = 0u;
    __int128 v108 = 0u;
    __int128 v105 = 0u;
    __int128 v106 = 0u;
    v71 = (void *)objc_claimAutoreleasedReturnValue([v4 subscribedStatusKeyPaths]);
    id v72 = [v71 countByEnumeratingWithState:&v105 objects:v135 count:16];
    if (v72)
    {
      id v73 = v72;
      uint64_t v74 = 0LL;
      uint64_t v75 = *(void *)v106;
      do
      {
        for (m = 0LL; m != v73; m = (char *)m + 1)
        {
          if (*(void *)v106 != v75) {
            objc_enumerationMutation(v71);
          }
          v77 = *(void **)(*((void *)&v105 + 1) + 8LL * (void)m);
          v78 = (void *)objc_claimAutoreleasedReturnValue([v77 statusSubscriptionItems]);
          id v79 = [v78 count];

          if (!v79)
          {
            [v99 deleteObject:v77];
            ++v74;
          }
        }

        id v73 = [v71 countByEnumeratingWithState:&v105 objects:v135 count:16];
      }

      while (v73);
    }

    v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog statusSubscriptionsSubscriber](&OBJC_CLASS___RMLog, "statusSubscriptionsSubscriber"));
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG)) {
      sub_1000617CC();
    }

    id v5 = v96;
    BOOL v80 = v89;
  }

  else
  {
    BOOL v80 = 0;
  }

  return v80;
}

- (id)_getStatusSubscriptionsFromManagementSource:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[RMStatusSubscription fetchRequest](&OBJC_CLASS___RMStatusSubscription, "fetchRequest"));
  id v25 = v3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@) AND (%K == %d)",  @"managementSource",  v3,  @"sourceType",  1LL));
  [v4 setPredicate:v5];

  id v30 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 execute:&v30]);
  id v7 = v30;
  if (v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v6 count]));
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id obj = v6;
    id v9 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v9)
    {
      id v10 = v9;
      id v20 = v7;
      uint64_t v21 = v6;
      v22 = v4;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusSubscriptionsSubscriber identifier](self, "identifier"));
          v15 = (void *)objc_claimAutoreleasedReturnValue([v25 identifier]);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v13 sourceIdentifier]);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v13 sourceServerToken]);
          id v18 = +[RMStoreDeclarationKey newDeclarationKeyWithSubscriberIdentifier:storeIdentifier:declarationIdentifier:declarationServerToken:]( &OBJC_CLASS___RMStoreDeclarationKey,  "newDeclarationKeyWithSubscriberIdentifier:storeIdentifier:declarationIdentifier:declarationServerToken:",  v14,  v15,  v16,  v17);

          [v8 setObject:v13 forKeyedSubscript:v18];
        }

        id v10 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }

      while (v10);
      id v6 = v21;
      id v4 = v22;
      id v7 = v20;
    }
  }

  else
  {
    id obj = (id)objc_claimAutoreleasedReturnValue(+[RMLog statusSubscriptionsSubscriber](&OBJC_CLASS___RMLog, "statusSubscriptionsSubscriber"));
    if (os_log_type_enabled((os_log_t)obj, OS_LOG_TYPE_FAULT)) {
      sub_100061918();
    }
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (BOOL)_updateStatusSubscriptionUIsForManagementSource:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[RMStatusSubscriptionsSubscriber _getActiveStatusSubscriptionConfigurationsFromManagementSource:onlyMissingUI:]( self,  "_getActiveStatusSubscriptionConfigurationsFromManagementSource:onlyMissingUI:",  v4,  1LL));
  id v6 = [v5 count];
  if (v6)
  {
    id v17 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 managedObjectContext]);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          v14 = -[RMConfigurationPayloadUI initWithContext:]( objc_alloc(&OBJC_CLASS___RMConfigurationPayloadUI),  "initWithContext:",  v7);
          -[RMConfigurationPayloadUI setVisible:](v14, "setVisible:", 0LL);
          [v13 setUi:v14];
        }

        id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v10);
    }

    id v6 = v17;
  }

  BOOL v15 = v6 != 0LL;

  return v15;
}

- (id)_getActiveStatusSubscriptionConfigurationsFromManagementSource:(id)a3
{
  return -[RMStatusSubscriptionsSubscriber _getActiveStatusSubscriptionConfigurationsFromManagementSource:onlyMissingUI:]( self,  "_getActiveStatusSubscriptionConfigurationsFromManagementSource:onlyMissingUI:",  a3,  0LL);
}

- (id)_getActiveStatusSubscriptionConfigurationsFromManagementSource:(id)a3 onlyMissingUI:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[RMConfigurationPayload fetchRequest](&OBJC_CLASS___RMConfigurationPayload, "fetchRequest"));
  if (v4) {
    id v7 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@) AND (%K == %@) AND (%K == YES) AND (%K == NULL)",  @"managementSource",  v5,  @"declarationType",  RMConfigurationTypeManagementStatusSubscription,  @"state.active",  @"ui");
  }
  else {
    id v7 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@) AND (%K == %@) AND (%K == YES)",  @"managementSource",  v5,  @"declarationType",  RMConfigurationTypeManagementStatusSubscription,  @"state.active",  v23);
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v6 setPredicate:v8];

  id v34 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 execute:&v34]);
  id v10 = v34;
  if (v9)
  {
    id v29 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v9 count]));
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id obj = v9;
    id v11 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v11)
    {
      id v12 = v11;
      id v24 = v10;
      id v25 = v9;
      __int128 v26 = v6;
      uint64_t v13 = *(void *)v31;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(obj);
          }
          BOOL v15 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusSubscriptionsSubscriber identifier](self, "identifier"));
          id v17 = v5;
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v15 serverToken]);
          id v21 = +[RMStoreDeclarationKey newDeclarationKeyWithSubscriberIdentifier:storeIdentifier:declarationIdentifier:declarationServerToken:]( &OBJC_CLASS___RMStoreDeclarationKey,  "newDeclarationKeyWithSubscriberIdentifier:storeIdentifier:declarationIdentifier:declarationServerToken:",  v16,  v18,  v19,  v20);

          id v5 = v17;
          [v29 setObject:v15 forKeyedSubscript:v21];
        }

        id v12 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }

      while (v12);
      id v9 = v25;
      id v6 = v26;
      id v10 = v24;
    }
  }

  else
  {
    id obj = (id)objc_claimAutoreleasedReturnValue(+[RMLog statusSubscriptionsSubscriber](&OBJC_CLASS___RMLog, "statusSubscriptionsSubscriber"));
    if (os_log_type_enabled((os_log_t)obj, OS_LOG_TYPE_FAULT)) {
      sub_100061978();
    }
    id v29 = 0LL;
  }

  return v29;
}

- (id)_makeStatusSubscriptionWithManagementSource:(id)a3 declaration:(id)a4 context:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc(&OBJC_CLASS___RMStatusSubscription);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 managedObjectContext]);
  id v10 = -[RMStatusSubscription initWithContext:](v8, "initWithContext:", v9);

  -[RMStatusSubscription setSourceType:](v10, "setSourceType:", 1LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 declarationIdentifier]);
  -[RMStatusSubscription setSourceIdentifier:](v10, "setSourceIdentifier:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 declarationServerToken]);
  -[RMStatusSubscription setSourceServerToken:](v10, "setSourceServerToken:", v12);

  v57 = v10;
  id v53 = v6;
  -[RMStatusSubscription setManagementSource:](v10, "setManagementSource:", v6);
  v52 = v7;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 payloadStatusItems]);
  id v56 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v13 count]));
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  id obj = v13;
  id v58 = [obj countByEnumeratingWithState:&v66 objects:v78 count:16];
  if (v58)
  {
    uint64_t v55 = *(void *)v67;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v67 != v55) {
          objc_enumerationMutation(obj);
        }
        BOOL v15 = *(void **)(*((void *)&v66 + 1) + 8 * v14);
        v16 = v57;
        id v17 = v15;
        __int128 v18 = objc_alloc(&OBJC_CLASS___RMStatusSubscriptionItem);
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusSubscription managedObjectContext](v16, "managedObjectContext"));
        __int128 v20 = -[RMStatusSubscriptionItem initWithContext:](v18, "initWithContext:", v19);

        -[RMStatusSubscriptionItem setSubscription:](v20, "setSubscription:", v16);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v17 payloadName]);
        -[RMStatusSubscriptionItem setKeyPath:](v20, "setKeyPath:", v21);

        -[RMStatusSubscriptionItem setProperties:](v20, "setProperties:", 0LL);
        -[RMStatusSubscriptionItem setPredicate:](v20, "setPredicate:", 0LL);
        id v22 = v17;
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 payloadName]);
        v63 = v16;
        uint64_t v64 = v14;
        uint64_t v65 = v22;
        if ([&__NSArray0__struct count])
        {
          id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [&__NSArray0__struct count]));
          __int128 v79 = 0u;
          __int128 v80 = 0u;
          __int128 v81 = 0u;
          __int128 v82 = 0u;
          id v25 = [&__NSArray0__struct countByEnumeratingWithState:&v79 objects:v83 count:16];
          if (v25)
          {
            id v26 = v25;
            uint64_t v27 = *(void *)v80;
            do
            {
              for (i = 0LL; i != v26; i = (char *)i + 1)
              {
                if (*(void *)v80 != v27) {
                  objc_enumerationMutation(&__NSArray0__struct);
                }
                id v29 = (void *)objc_claimAutoreleasedReturnValue( [v23 stringByAppendingFormat:@".%@", *(void *)(*((void *)&v79 + 1) + 8 * (void)i)]);
                [v24 addObject:v29];
              }

              id v26 = [&__NSArray0__struct countByEnumeratingWithState:&v79 objects:v83 count:16];
            }

            while (v26);
            id v22 = v65;
          }
        }

        else
        {
          id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v23));
        }

        __int128 v30 = v20;
        id v31 = v24;
        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusSubscriptionItem subscription](v30, "subscription"));
        __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v32 managementSource]);

        id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 subscribedStatusKeyPaths]);
        v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K IN %@",  @"keyPath",  v31));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "filteredSetUsingPredicate:"));
        __int128 v74 = 0u;
        __int128 v75 = 0u;
        __int128 v76 = 0u;
        __int128 v77 = 0u;
        id v36 = [v35 countByEnumeratingWithState:&v74 objects:v83 count:16];
        if (v36)
        {
          id v37 = v36;
          uint64_t v38 = *(void *)v75;
          do
          {
            for (j = 0LL; j != v37; j = (char *)j + 1)
            {
              if (*(void *)v75 != v38) {
                objc_enumerationMutation(v35);
              }
              [*(id *)(*((void *)&v74 + 1) + 8 * (void)j) addStatusSubscriptionItemsObject:v30];
            }

            id v37 = [v35 countByEnumeratingWithState:&v74 objects:v83 count:16];
          }

          while (v37);
        }

        v61 = v34;
        uint64_t v40 = objc_claimAutoreleasedReturnValue([v34 valueForKey:@"keyPath"]);
        v62 = v31;
        id v41 = [v31 mutableCopy];
        uint64_t v59 = (void *)v40;
        [v41 minusSet:v40];
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusSubscriptionItem managedObjectContext](v30, "managedObjectContext"));
        __int128 v70 = 0u;
        __int128 v71 = 0u;
        __int128 v72 = 0u;
        __int128 v73 = 0u;
        id v43 = v41;
        id v44 = [v43 countByEnumeratingWithState:&v70 objects:&v79 count:16];
        if (v44)
        {
          id v45 = v44;
          uint64_t v46 = *(void *)v71;
          do
          {
            for (k = 0LL; k != v45; k = (char *)k + 1)
            {
              if (*(void *)v71 != v46) {
                objc_enumerationMutation(v43);
              }
              uint64_t v48 = *(void *)(*((void *)&v70 + 1) + 8LL * (void)k);
              v49 = -[RMSubscribedStatusKeyPath initWithContext:]( objc_alloc(&OBJC_CLASS___RMSubscribedStatusKeyPath),  "initWithContext:",  v42);
              -[RMSubscribedStatusKeyPath setKeyPath:](v49, "setKeyPath:", v48);
              -[RMSubscribedStatusKeyPath setManagementSource:](v49, "setManagementSource:", v33);
              -[RMSubscribedStatusKeyPath addStatusSubscriptionItemsObject:]( v49,  "addStatusSubscriptionItemsObject:",  v30);
            }

            id v45 = [v43 countByEnumeratingWithState:&v70 objects:&v79 count:16];
          }

          while (v45);
        }

        v50 = (void *)objc_claimAutoreleasedReturnValue([v65 payloadName]);
        [v56 addObject:v50];

        uint64_t v14 = v64 + 1;
      }

      while ((id)(v64 + 1) != v58);
      id v58 = [obj countByEnumeratingWithState:&v66 objects:v78 count:16];
    }

    while (v58);
  }

  return v56;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end