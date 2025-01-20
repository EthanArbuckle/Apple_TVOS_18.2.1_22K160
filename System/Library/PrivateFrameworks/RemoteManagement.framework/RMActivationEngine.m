@interface RMActivationEngine
+ (BOOL)_isKeychainAsset:(id)a3;
- (BOOL)_assetsRemoved:(id)a3 managementSourceIdentifier:(id)a4 personaID:(id)a5;
- (BOOL)_attachAssetReferences:(id)a3;
- (BOOL)_attachConfigurationReferences:(id)a3;
- (BOOL)_deleteDeclarationsThatAreNoLongerNeeded:(id)a3;
- (BOOL)_processAllDeclarations:(id)a3;
- (BOOL)_processManagementProperties:(id)a3;
- (BOOL)_reconcile:(id)a3;
- (BOOL)_remove:(id)a3;
- (BOOL)_removeKeychainAssets:(id)a3;
- (BOOL)_updateUnknownDeclarations:(id)a3;
- (BOOL)removeReturningError:(id *)a3;
- (NSManagedObjectContext)context;
- (NSManagedObjectID)managementSourceObjectID;
- (RMActivationEngine)initWithManagementSourceObjectID:(id)a3 context:(id)a4;
- (RMDebounceTimer)debouncer;
- (id)_checkPredicateStatusKeysForActivations:(id)a3 managementSource:(id)a4;
- (id)getDeclarationsMarkedForRemovalFromFetchRequest:(id)a3 managementSource:(id)a4;
- (void)_keychainAssetRemoved:(id)a3 managementSourceIdentifier:(id)a4 personaID:(id)a5;
- (void)_predicateStatusItemDidChange:(id)a3;
- (void)deleteObjects:(id)a3 managementSourceIdentifier:(id)a4 removeStatus:(BOOL)a5;
- (void)setDebouncer:(id)a3;
- (void)syncWithCompletionHandler:(id)a3;
- (void)triggerAggregatingTimerAction;
@end

@implementation RMActivationEngine

- (RMActivationEngine)initWithManagementSourceObjectID:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___RMActivationEngine;
  v9 = -[RMActivationEngine init](&v15, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_managementSourceObjectID, a3);
    objc_storeStrong((id *)&v10->_context, a4);
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[RMDebounceTimer debounceTimerWithMinimumInterval:maximumInterval:delegate:identifier:]( &OBJC_CLASS___RMDebounceTimer,  "debounceTimerWithMinimumInterval:maximumInterval:delegate:identifier:",  v10,  @"RMActivationEngine",  5.0,  60.0));
    debouncer = v10->_debouncer;
    v10->_debouncer = (RMDebounceTimer *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v13 addObserver:v10 selector:"_predicateStatusItemDidChange:" name:@"RMPredicateStatusUpdaterDidChangeNotification" object:0];
  }

  return v10;
}

- (void)triggerAggregatingTimerAction
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100007EE0();
  }

  -[RMActivationEngine syncWithCompletionHandler:](self, "syncWithCompletionHandler:", &stru_1000B8D80);
}

- (void)_predicateStatusItemDidChange:(id)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  v4 = (void *)objc_claimAutoreleasedReturnValue( [v8 objectForKeyedSubscript:@"RMUserInfoKeyPredicateUpdatedManagementSourceObjectIDs"]);
  if (!v4
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMActivationEngine managementSourceObjectID](self, "managementSourceObjectID")),
        unsigned int v6 = [v4 containsObject:v5],
        v5,
        v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMActivationEngine debouncer](self, "debouncer"));
    [v7 trigger];
  }
}

- (void)syncWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = _os_activity_create( (void *)&_mh_execute_header,  "ActivationEngine: syncing",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100007F98();
  }

  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  objc_super v15 = sub_100003984;
  v16 = sub_100003994;
  id v17 = 0LL;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000399C;
  v8[3] = &unk_1000B8DA8;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[RMActivationEngine context](self, "context"));
  id v9 = v7;
  v10 = self;
  uint64_t v11 = &v12;
  [v7 performBlockAndWait:v8];
  v4[2](v4, v13[5]);

  _Block_object_dispose(&v12, 8);
  os_activity_scope_leave(&state);
}

- (BOOL)removeReturningError:(id *)a3
{
  v5 = _os_activity_create( (void *)&_mh_execute_header,  "ActivationEngine: removing",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000080A8();
  }

  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_100003984;
  v19 = sub_100003994;
  id v20 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100003CEC;
  v11[3] = &unk_1000B8DA8;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[RMActivationEngine context](self, "context"));
  id v12 = v7;
  v13 = self;
  uint64_t v14 = &v15;
  [v7 performBlockAndWait:v11];
  if (a3)
  {
    id v8 = (void *)v16[5];
    if (v8) {
      *a3 = v8;
    }
  }

  BOOL v9 = v16[5] == 0;

  _Block_object_dispose(&v15, 8);
  os_activity_scope_leave(&state);

  return v9;
}

- (BOOL)_reconcile:(id)a3
{
  id v4 = a3;
  if (-[RMActivationEngine _deleteDeclarationsThatAreNoLongerNeeded:]( self,  "_deleteDeclarationsThatAreNoLongerNeeded:",  v4)
    && -[RMActivationEngine _updateUnknownDeclarations:](self, "_updateUnknownDeclarations:", v4)
    && -[RMActivationEngine _attachConfigurationReferences:](self, "_attachConfigurationReferences:", v4)
    && -[RMActivationEngine _attachAssetReferences:](self, "_attachAssetReferences:", v4)
    && -[RMActivationEngine _processManagementProperties:](self, "_processManagementProperties:", v4))
  {
    BOOL v5 = -[RMActivationEngine _processAllDeclarations:](self, "_processAllDeclarations:", v4);
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_remove:(id)a3
{
  return -[RMActivationEngine _removeKeychainAssets:](self, "_removeKeychainAssets:", a3);
}

- (BOOL)_deleteDeclarationsThatAreNoLongerNeeded:(id)a3
{
  id v4 = a3;
  BOOL v5 = &APSEnvironmentDevelopment_ptr;
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000081B8();
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[RMConfigurationPayload fetchRequest](&OBJC_CLASS___RMConfigurationPayload, "fetchRequest"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[RMActivationEngine getDeclarationsMarkedForRemovalFromFetchRequest:managementSource:]( self,  "getDeclarationsMarkedForRemovalFromFetchRequest:managementSource:",  v7,  v4));

  if (v8)
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[RMActivationPayload fetchRequest](&OBJC_CLASS___RMActivationPayload, "fetchRequest"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( -[RMActivationEngine getDeclarationsMarkedForRemovalFromFetchRequest:managementSource:]( self,  "getDeclarationsMarkedForRemovalFromFetchRequest:managementSource:",  v9,  v4));

    if (v10)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[RMAssetPayload fetchRequest](&OBJC_CLASS___RMAssetPayload, "fetchRequest"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[RMActivationEngine getDeclarationsMarkedForRemovalFromFetchRequest:managementSource:]( self,  "getDeclarationsMarkedForRemovalFromFetchRequest:managementSource:",  v11,  v4));

      BOOL v13 = v12 != 0LL;
      if (v12)
      {
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 identifier]);
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
        v16 = &off_100091000;
        v55 = v8;
        v54 = v14;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          log = v15;
          os_log_t v48 = (os_log_t)[v10 count];
          if (v48)
          {
            id v17 = v10;
            v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v17 count]));
            __int128 v56 = 0u;
            __int128 v57 = 0u;
            __int128 v58 = 0u;
            __int128 v59 = 0u;
            id v19 = v17;
            id v20 = [v19 countByEnumeratingWithState:&v56 objects:buf count:16];
            if (v20)
            {
              id v21 = v20;
              uint64_t v22 = *(void *)v57;
              do
              {
                for (i = 0LL; i != v21; i = (char *)i + 1)
                {
                  if (*(void *)v57 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  [v18 addObject:v24];
                }

                id v21 = [v19 countByEnumeratingWithState:&v56 objects:buf count:16];
              }

              while (v21);
            }

            v25 = (__CFString *)objc_claimAutoreleasedReturnValue([v18 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
            id v8 = v55;
            BOOL v13 = v12 != 0LL;
            uint64_t v14 = v54;
            v16 = &off_100091000;
            BOOL v5 = &APSEnvironmentDevelopment_ptr;
          }

          else
          {
            v25 = @"none";
          }

          *(_DWORD *)buf = *((void *)v16 + 503);
          v61 = v25;
          _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Deleting activations (no status): %{public}@",  buf,  0xCu);
          if (v48) {

          }
          uint64_t v15 = log;
        }

        -[RMActivationEngine deleteObjects:managementSourceIdentifier:removeStatus:]( self,  "deleteObjects:managementSourceIdentifier:removeStatus:",  v10,  v14,  0LL);
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5[124] activationEngine]);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          loga = v26;
          os_log_t v49 = (os_log_t)[v8 count];
          if (v49)
          {
            id v27 = v8;
            v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v27 count]));
            __int128 v56 = 0u;
            __int128 v57 = 0u;
            __int128 v58 = 0u;
            __int128 v59 = 0u;
            id v29 = v27;
            id v30 = [v29 countByEnumeratingWithState:&v56 objects:buf count:16];
            if (v30)
            {
              id v31 = v30;
              uint64_t v32 = *(void *)v57;
              do
              {
                for (j = 0LL; j != v31; j = (char *)j + 1)
                {
                  if (*(void *)v57 != v32) {
                    objc_enumerationMutation(v29);
                  }
                  [v28 addObject:v34];
                }

                id v31 = [v29 countByEnumeratingWithState:&v56 objects:buf count:16];
              }

              while (v31);
            }

            v35 = (__CFString *)objc_claimAutoreleasedReturnValue([v28 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
            id v8 = v55;
            BOOL v13 = v12 != 0LL;
            uint64_t v14 = v54;
            v16 = &off_100091000;
            BOOL v5 = &APSEnvironmentDevelopment_ptr;
          }

          else
          {
            v35 = @"none";
          }

          *(_DWORD *)buf = *((void *)v16 + 503);
          v61 = v35;
          _os_log_impl( (void *)&_mh_execute_header,  loga,  OS_LOG_TYPE_INFO,  "Deleting configurations (and status): %{public}@",  buf,  0xCu);
          if (v49) {

          }
          v26 = loga;
        }

        -[RMActivationEngine deleteObjects:managementSourceIdentifier:removeStatus:]( self,  "deleteObjects:managementSourceIdentifier:removeStatus:",  v8,  v14,  1LL);
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5[124] activationEngine]);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          os_log_t logb = (os_log_t)[v12 count];
          if (logb)
          {
            os_log_t v50 = v36;
            id v37 = v12;
            v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v37 count]));
            __int128 v56 = 0u;
            __int128 v57 = 0u;
            __int128 v58 = 0u;
            __int128 v59 = 0u;
            id v39 = v37;
            id v40 = [v39 countByEnumeratingWithState:&v56 objects:buf count:16];
            if (v40)
            {
              id v41 = v40;
              uint64_t v42 = *(void *)v57;
              do
              {
                for (k = 0LL; k != v41; k = (char *)k + 1)
                {
                  if (*(void *)v57 != v42) {
                    objc_enumerationMutation(v39);
                  }
                  [v38 addObject:v44];
                }

                id v41 = [v39 countByEnumeratingWithState:&v56 objects:buf count:16];
              }

              while (v41);
            }

            v45 = (__CFString *)objc_claimAutoreleasedReturnValue([v38 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
            id v8 = v55;
            BOOL v13 = v12 != 0LL;
            uint64_t v14 = v54;
            v16 = &off_100091000;
            v36 = v50;
          }

          else
          {
            v45 = @"none";
          }

          *(_DWORD *)buf = *((void *)v16 + 503);
          v61 = v45;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_INFO,  "Deleting assets (and status): %{public}@",  buf,  0xCu);
          if (logb) {
        }
          }

        v46 = (void *)objc_claimAutoreleasedReturnValue([v4 personaIdentifier]);
        -[RMActivationEngine _assetsRemoved:managementSourceIdentifier:personaID:]( self,  "_assetsRemoved:managementSourceIdentifier:personaID:",  v12,  v14,  v46);

        -[RMActivationEngine deleteObjects:managementSourceIdentifier:removeStatus:]( self,  "deleteObjects:managementSourceIdentifier:removeStatus:",  v12,  v14,  1LL);
      }

      else
      {
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Failed to delete assets.", buf, 2u);
        }
      }
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_INFO,  "Failed to delete activations.",  buf,  2u);
      }

      BOOL v13 = 0;
    }
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_INFO,  "Failed to delete configurations.",  buf,  2u);
    }

    BOOL v13 = 0;
  }

  return v13;
}

- (id)getDeclarationsMarkedForRemovalFromFetchRequest:(id)a3 managementSource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 setIncludesPendingChanges:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@) && (%K == %d)",  @"managementSource",  v6,  @"loadState",  3LL));

  [v5 setPredicate:v7];
  v14[0] = @"declarationType";
  v14[1] = @"identifier";
  v14[2] = @"serverToken";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 3LL));
  [v5 setPropertiesToFetch:v8];

  id v13 = 0LL;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v5 execute:&v13]);
  id v10 = v13;
  if (!v9)
  {
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_1000081E4();
    }
  }

  return v9;
}

- (void)deleteObjects:(id)a3 managementSourceIdentifier:(id)a4 removeStatus:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v12);
        if (v5)
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v17 + 1) + 8 * (void)v12) identifier]);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 serverToken]);
          +[RMConfigurationStatusArchiver removeStatusForStoreIdentifier:declarationIdentifier:declarationServerToken:error:]( &OBJC_CLASS___RMConfigurationStatusArchiver,  "removeStatusForStoreIdentifier:declarationIdentifier:declarationServerToken:error:",  v8,  v14,  v15,  0LL);
        }

        v16 = (void *)objc_claimAutoreleasedReturnValue([v13 managedObjectContext]);
        [v16 deleteObject:v13];

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v10);
  }
}

- (BOOL)_updateUnknownDeclarations:(id)a3
{
  id v3 = a3;
  v68 = (void *)objc_claimAutoreleasedReturnValue([v3 managedObjectContext]);
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[RMActivationPayload fetchRequest](&OBJC_CLASS___RMActivationPayload, "fetchRequest"));
  v66 = v3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@) AND (%K == %d)",  @"managementSource",  v3,  @"loadState",  4LL));
  [v4 setPredicate:v5];

  [v4 setIncludesPendingChanges:1];
  id v85 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 execute:&v85]);
  id v7 = v85;
  if (!v6)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_100008260();
    }
  }

  __int128 v83 = 0u;
  __int128 v84 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v81 objects:v96 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v82;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v82 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v81 + 1) + 8LL * (void)i);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 declarationType]);
        uint64_t v15 = (RMActivationPayloadState *)objc_claimAutoreleasedReturnValue([v13 state]);
        if (+[RMModelDeclarationBase isDeclarationTypeKnown:]( &OBJC_CLASS___RMModelDeclarationBase,  "isDeclarationTypeKnown:",  v14))
        {
          else {
            BOOL v16 = 1;
          }
          if (!v16) {
            -[RMActivationPayloadState setInactiveReasons:](v15, "setInactiveReasons:", &__NSArray0__struct);
          }
        }

        else if (!v15)
        {
          uint64_t v15 = -[RMActivationPayloadState initWithContext:]( objc_alloc(&OBJC_CLASS___RMActivationPayloadState),  "initWithContext:",  v68);
          -[RMActivationPayloadState setActivation:](v15, "setActivation:", v13);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason failedWithUnknownDeclarationType:]( &OBJC_CLASS___RMModelStatusReason,  "failedWithUnknownDeclarationType:",  v14));
          v95 = v17;
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v95,  1LL));
          -[RMActivationPayloadState setInactiveReasons:](v15, "setInactiveReasons:", v18);

          [v13 setState:v15];
        }
      }

      id v10 = [obj countByEnumeratingWithState:&v81 objects:v96 count:16];
    }

    while (v10);
  }

  id v19 = (id)objc_claimAutoreleasedReturnValue(+[RMConfigurationPayload fetchRequest](&OBJC_CLASS___RMConfigurationPayload, "fetchRequest"));
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@) AND (%K == %d)",  @"managementSource",  v66,  @"loadState",  4LL));
  [v19 setPredicate:v20];

  [v19 setIncludesPendingChanges:1];
  id v85 = 0LL;
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 execute:&v85]);
  id v22 = v85;
  if (!v21)
  {
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      sub_100008260();
    }
  }

  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  id v24 = v21;
  id v25 = [v24 countByEnumeratingWithState:&v77 objects:v94 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v78;
    do
    {
      for (j = 0LL; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v78 != v27) {
          objc_enumerationMutation(v24);
        }
        id v29 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)j);
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 declarationType]);
        id v31 = (RMConfigurationPayloadState *)objc_claimAutoreleasedReturnValue([v29 state]);
        if (+[RMModelDeclarationBase isDeclarationTypeKnown:]( &OBJC_CLASS___RMModelDeclarationBase,  "isDeclarationTypeKnown:",  v30))
        {
          else {
            BOOL v32 = 1;
          }
          if (!v32) {
            -[RMConfigurationPayloadState setError:](v31, "setError:", 0LL);
          }
        }

        else if (!v31)
        {
          id v31 = -[RMConfigurationPayloadState initWithContext:]( objc_alloc(&OBJC_CLASS___RMConfigurationPayloadState),  "initWithContext:",  v68);
          -[RMConfigurationPayloadState setConfiguration:](v31, "setConfiguration:", v29);
          -[RMConfigurationPayloadState setActive:](v31, "setActive:", 0LL);
          v92 = @"Error.UnknownDeclarationType";
          v93 = v30;
          v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v93,  &v92,  1LL));
          -[RMConfigurationPayloadState setError:](v31, "setError:", v33);

          [v29 setState:v31];
        }
      }

      id v26 = [v24 countByEnumeratingWithState:&v77 objects:v94 count:16];
    }

    while (v26);
  }

  id v34 = (id)objc_claimAutoreleasedReturnValue(+[RMAssetPayload fetchRequest](&OBJC_CLASS___RMAssetPayload, "fetchRequest"));
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@) AND (%K == %d)",  @"managementSource",  v66,  @"loadState",  4LL));
  [v34 setPredicate:v35];

  [v34 setIncludesPendingChanges:1];
  id v85 = 0LL;
  v36 = (void *)objc_claimAutoreleasedReturnValue([v34 execute:&v85]);
  id v37 = v85;
  if (!v36)
  {
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
      sub_100008260();
    }
  }

  v65 = v24;

  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  id v39 = v36;
  id v40 = [v39 countByEnumeratingWithState:&v73 objects:v91 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v74;
    do
    {
      for (k = 0LL; k != v41; k = (char *)k + 1)
      {
        if (*(void *)v74 != v42) {
          objc_enumerationMutation(v39);
        }
        v44 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)k);
        v45 = (void *)objc_claimAutoreleasedReturnValue([v44 declarationType]);
        v46 = (RMAssetPayloadState *)objc_claimAutoreleasedReturnValue([v44 state]);
        if (+[RMModelDeclarationBase isDeclarationTypeKnown:]( &OBJC_CLASS___RMModelDeclarationBase,  "isDeclarationTypeKnown:",  v45))
        {
          else {
            BOOL v47 = 1;
          }
          if (!v47) {
            -[RMAssetPayloadState setError:](v46, "setError:", 0LL);
          }
        }

        else if (!v46)
        {
          v46 = -[RMAssetPayloadState initWithContext:]( objc_alloc(&OBJC_CLASS___RMAssetPayloadState),  "initWithContext:",  v68);
          -[RMAssetPayloadState setAsset:](v46, "setAsset:", v44);
          v89 = @"Error.UnknownDeclarationType";
          v90 = v45;
          os_log_t v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v90,  &v89,  1LL));
          -[RMAssetPayloadState setError:](v46, "setError:", v48);

          [v44 setState:v46];
        }
      }

      id v41 = [v39 countByEnumeratingWithState:&v73 objects:v91 count:16];
    }

    while (v41);
  }

  id v49 = (id)objc_claimAutoreleasedReturnValue(+[RMManagementPayload fetchRequest](&OBJC_CLASS___RMManagementPayload, "fetchRequest"));
  os_log_t v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@) AND (%K == %d)",  @"managementSource",  v66,  @"loadState",  4LL));
  [v49 setPredicate:v50];

  [v49 setIncludesPendingChanges:1];
  id v85 = 0LL;
  v51 = (void *)objc_claimAutoreleasedReturnValue([v49 execute:&v85]);
  id v52 = v85;
  if (!v51)
  {
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT)) {
      sub_100008260();
    }
  }

  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  id v54 = v51;
  id v55 = [v54 countByEnumeratingWithState:&v69 objects:v88 count:16];
  if (v55)
  {
    id v56 = v55;
    uint64_t v57 = *(void *)v70;
    do
    {
      for (m = 0LL; m != v56; m = (char *)m + 1)
      {
        if (*(void *)v70 != v57) {
          objc_enumerationMutation(v54);
        }
        __int128 v59 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)m);
        v60 = (void *)objc_claimAutoreleasedReturnValue([v59 declarationType]);
        v61 = (RMManagementPayloadState *)objc_claimAutoreleasedReturnValue([v59 state]);
        if (+[RMModelDeclarationBase isDeclarationTypeKnown:]( &OBJC_CLASS___RMModelDeclarationBase,  "isDeclarationTypeKnown:",  v60))
        {
          [v59 setLoadState:1];
          else {
            BOOL v62 = 1;
          }
          if (!v62) {
            -[RMManagementPayloadState setError:](v61, "setError:", 0LL);
          }
        }

        else if (!v61)
        {
          v61 = -[RMManagementPayloadState initWithContext:]( objc_alloc(&OBJC_CLASS___RMManagementPayloadState),  "initWithContext:",  v68);
          -[RMManagementPayloadState setManagement:](v61, "setManagement:", v59);
          v86 = @"Error.UnknownDeclarationType";
          v87 = v60;
          v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v87,  &v86,  1LL));
          -[RMManagementPayloadState setError:](v61, "setError:", v63);

          [v59 setState:v61];
        }
      }

      id v56 = [v54 countByEnumeratingWithState:&v69 objects:v88 count:16];
    }

    while (v56);
  }

  return 1;
}

- (BOOL)_attachConfigurationReferences:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000083C8();
  }

  id v5 = v3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[RMConfigurationPayloadReference fetchRequest]( &OBJC_CLASS___RMConfigurationPayloadReference,  "fetchRequest"));
  [v6 setIncludesPendingChanges:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@) && ((%K == NULL) || (%K == %d))",  @"activation.managementSource",  v5,  @"configuration",  @"configuration.loadState",  3LL));
  [v6 setPredicate:v7];

  *(void *)buf = @"configurationIdentifier";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", buf, 1LL));
  [v6 setPropertiesToFetch:v8];

  *(void *)&__int128 v63 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 execute:&v63]);
  id v10 = (id)v63;
  if (!v9)
  {
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_100008368();
    }
  }

  if (!v9)
  {
    os_log_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_INFO)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    id v49 = "Failed to attach configuration references.";
LABEL_43:
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, v49, buf, 2u);
    goto LABEL_44;
  }

  if (![v9 count])
  {
    os_log_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_INFO)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    id v49 = "No configuration references to attach.";
    goto LABEL_43;
  }

  v53 = v9;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForKey:@"configurationIdentifier"]);
  id v13 = (id)objc_claimAutoreleasedReturnValue(+[RMConfigurationPayload fetchRequest](&OBJC_CLASS___RMConfigurationPayload, "fetchRequest"));
  id v51 = v5;
  id v14 = v5;
  id v15 = v12;
  [v13 setIncludesPendingChanges:1];
  id v52 = v15;
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@) && (%K == %d) && (%K IN %@)",  @"managementSource",  v14,  @"loadState",  1LL,  @"identifier",  v15));
  [v13 setPredicate:v16];

  __int128 v74 = @"identifier";
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v74, 1LL));
  [v13 setPropertiesToFetch:v17];

  id v67 = 0LL;
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v13 execute:&v67]);
  id v19 = v67;
  if (!v18)
  {
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      sub_1000082EC();
    }
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v18 count]));
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  id v22 = v18;
  id v23 = [v22 countByEnumeratingWithState:&v63 objects:buf count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v64;
    do
    {
      for (i = 0LL; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v64 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)i);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
        [v21 setObject:v27 forKeyedSubscript:v28];
      }

      id v24 = [v22 countByEnumeratingWithState:&v63 objects:buf count:16];
    }

    while (v24);
  }

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id v29 = v53;
  id v30 = [v29 countByEnumeratingWithState:&v59 objects:v68 count:16];
  id v31 = &APSEnvironmentDevelopment_ptr;
  if (v30)
  {
    id v32 = v30;
    uint64_t v33 = *(void *)v60;
    do
    {
      id v34 = 0LL;
      do
      {
        if (*(void *)v60 != v33) {
          objc_enumerationMutation(v29);
        }
        v35 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue([v35 configuration]);
        id v37 = (void *)objc_claimAutoreleasedReturnValue([v35 configurationIdentifier]);
        v38 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v37]);

        if (v36 != v38)
        {
          id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31[124] activationEngine]);
          BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG);
          if (v36)
          {
            if (v40)
            {
              id v55 = (void *)objc_claimAutoreleasedReturnValue([v35 activation]);
              uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v55 description]);
              id v54 = (void *)objc_claimAutoreleasedReturnValue([v36 description]);
              uint64_t v41 = objc_claimAutoreleasedReturnValue([v38 description]);
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v57;
              __int16 v70 = 2112;
              uint64_t v71 = (uint64_t)v54;
              __int16 v72 = 2112;
              uint64_t v73 = v41;
              uint64_t v42 = (void *)v41;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEBUG,  "Reattaching configuration reference for %@ to from %@ to %@...",  buf,  0x20u);

              id v31 = &APSEnvironmentDevelopment_ptr;
              v43 = v55;
              goto LABEL_34;
            }
          }

          else if (v40)
          {
            __int128 v58 = (void *)objc_claimAutoreleasedReturnValue([v35 activation]);
            id v56 = (void *)objc_claimAutoreleasedReturnValue([v58 description]);
            uint64_t v44 = objc_claimAutoreleasedReturnValue([v38 description]);
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v56;
            __int16 v70 = 2112;
            uint64_t v71 = v44;
            v45 = (void *)v44;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEBUG,  "Attaching configuration reference for %@ to %@...",  buf,  0x16u);

            id v31 = &APSEnvironmentDevelopment_ptr;
            v43 = v58;
LABEL_34:
          }

          [v35 setConfiguration:v38];
        }

        id v34 = (char *)v34 + 1;
      }

      while (v32 != v34);
      id v46 = [v29 countByEnumeratingWithState:&v59 objects:v68 count:16];
      id v32 = v46;
    }

    while (v46);
  }

  BOOL v47 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31[124] activationEngine]);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "Attached configuration references.", buf, 2u);
  }

  id v5 = v51;
  os_log_t v48 = (os_log_s *)v52;
  id v9 = v53;
LABEL_44:

  return v9 != 0LL;
}

- (BOOL)_attachAssetReferences:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100008454();
  }

  id v5 = v3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[RMAssetPayloadReference fetchRequest](&OBJC_CLASS___RMAssetPayloadReference, "fetchRequest"));
  [v6 setIncludesPendingChanges:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@) && ((%K == NULL) || (%K == %d))",  @"configuration.managementSource",  v5,  @"asset",  @"asset.loadState",  3LL));
  [v6 setPredicate:v7];

  *(void *)buf = @"assetIdentifier";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", buf, 1LL));
  [v6 setPropertiesToFetch:v8];

  *(void *)&__int128 v61 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 execute:&v61]);
  id v10 = (id)v61;
  if (!v9)
  {
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_1000083F4();
    }
  }

  if (!v9)
  {
    os_log_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_INFO)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    id v49 = "Failed to attach asset references.";
LABEL_43:
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, v49, buf, 2u);
    goto LABEL_44;
  }

  if (![v9 count])
  {
    os_log_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_INFO)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    id v49 = "No asset references to attach.";
    goto LABEL_43;
  }

  v53 = v9;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForKey:@"assetIdentifier"]);
  id v13 = (id)objc_claimAutoreleasedReturnValue(+[RMAssetPayload fetchRequest](&OBJC_CLASS___RMAssetPayload, "fetchRequest"));
  id v51 = v5;
  id v14 = v5;
  id v15 = v12;
  [v13 setIncludesPendingChanges:1];
  id v52 = v15;
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@) && (%K == %d) && (%K IN %@)",  @"managementSource",  v14,  @"loadState",  1LL,  @"identifier",  v15));
  [v13 setPredicate:v16];

  __int16 v72 = @"identifier";
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v72, 1LL));
  [v13 setPropertiesToFetch:v17];

  id v65 = 0LL;
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v13 execute:&v65]);
  id v19 = v65;
  if (!v18)
  {
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      sub_1000082EC();
    }
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v18 count]));
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id v22 = v18;
  id v23 = [v22 countByEnumeratingWithState:&v61 objects:buf count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v62;
    do
    {
      for (i = 0LL; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v62 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)i);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
        [v21 setObject:v27 forKeyedSubscript:v28];
      }

      id v24 = [v22 countByEnumeratingWithState:&v61 objects:buf count:16];
    }

    while (v24);
  }

  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id obj = v53;
  id v29 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v58;
    do
    {
      id v32 = 0LL;
      do
      {
        if (*(void *)v58 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)v32);
        id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 asset]);
        v35 = (void *)objc_claimAutoreleasedReturnValue([v33 assetIdentifier]);
        v36 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v35]);

        if (v34 != v36)
        {
          id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
          BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG);
          if (v34)
          {
            if (v38)
            {
              id v55 = (void *)objc_claimAutoreleasedReturnValue([v33 configuration]);
              id v54 = (void *)objc_claimAutoreleasedReturnValue([v55 description]);
              id v39 = (void *)objc_claimAutoreleasedReturnValue([v34 description]);
              uint64_t v40 = objc_claimAutoreleasedReturnValue([v36 description]);
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v54;
              __int16 v68 = 2112;
              __int128 v69 = v39;
              __int16 v70 = 2112;
              uint64_t v71 = v40;
              uint64_t v41 = (void *)v40;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEBUG,  "Reattaching asset reference for %@ to from %@ to %@...",  buf,  0x20u);

              goto LABEL_34;
            }
          }

          else if (v38)
          {
            id v55 = (void *)objc_claimAutoreleasedReturnValue([v33 configuration]);
            uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v55 description]);
            v45 = (void *)objc_claimAutoreleasedReturnValue([v36 description]);
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v44;
            __int16 v68 = 2112;
            __int128 v69 = v45;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEBUG,  "Attaching asset reference for %@ to %@...",  buf,  0x16u);

LABEL_34:
          }

          uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v33 assetIdentifier]);
          v43 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v42]);
          [v33 setAsset:v43];
        }

        id v32 = (char *)v32 + 1;
      }

      while (v30 != v32);
      id v46 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
      id v30 = v46;
    }

    while (v46);
  }

  BOOL v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "Attached asset references.", buf, 2u);
  }

  id v5 = v51;
  os_log_t v48 = (os_log_s *)v52;
  id v9 = v53;
LABEL_44:

  return v9 != 0LL;
}

- (BOOL)_processManagementProperties:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[RMManagementPayload fetchRequest](&OBJC_CLASS___RMManagementPayload, "fetchRequest"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelManagementPropertiesDeclaration registeredIdentifier]( &OBJC_CLASS___RMModelManagementPropertiesDeclaration,  "registeredIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@) AND (%K == %d) AND (%K == %@)",  @"managementSource",  v3,  @"loadState",  1LL,  @"declarationType",  v5));
  [v4 setPredicate:v6];

  [v4 setIncludesPendingChanges:1];
  id v39 = @"payload";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v39, 1LL));
  [v4 setPropertiesToFetch:v7];

  id v37 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 execute:&v37]);
  id v9 = v37;
  id v10 = v9;
  if (v8)
  {
    id v30 = v3;

    uint64_t v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v29 = v8;
    id v12 = v8;
    id v13 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v13)
    {
      id v14 = v13;
      id v15 = 0LL;
      uint64_t v16 = *(void *)v34;
      while (2)
      {
        __int128 v17 = 0LL;
        __int128 v18 = v15;
        do
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v12);
          }
          id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v33 + 1) + 8 * (void)v17) payload]);
          id v32 = v18;
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelManagementPropertiesDeclaration loadData:serializationType:error:]( &OBJC_CLASS___RMModelManagementPropertiesDeclaration,  "loadData:serializationType:error:",  v19,  0LL,  &v32));
          id v15 = v32;

          if (!v20)
          {
            id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              sub_100008540();
            }

            id v3 = v30;
            goto LABEL_22;
          }

          id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 payloadANY]);
          -[NSMutableDictionary addEntriesFromDictionary:](v11, "addEntriesFromDictionary:", v21);

          __int128 v17 = (char *)v17 + 1;
          __int128 v18 = v15;
        }

        while (v14 != v17);
        id v14 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    else
    {
      id v15 = 0LL;
    }

    uint64_t v25 = v15;

    id v3 = v30;
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v30 identifier]);
    id v31 = v15;
    unsigned __int8 v27 = +[RMManagementPropertiesArchiver persistPropertiesWithStoreIdentifier:properties:error:]( &OBJC_CLASS___RMManagementPropertiesArchiver,  "persistPropertiesWithStoreIdentifier:properties:error:",  v26,  v11,  &v31);
    id v15 = v31;

    if ((v27 & 1) != 0)
    {
      BOOL v24 = 1;
      id v8 = v29;
    }

    else
    {
      id v12 = (id)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
        sub_1000084E0();
      }
LABEL_22:
      id v8 = v29;

      BOOL v24 = 0;
    }
  }

  else
  {
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      sub_100008480();
    }

    BOOL v24 = 0;
  }

  return v24;
}

- (BOOL)_processAllDeclarations:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[RMActivationPayload fetchRequest](&OBJC_CLASS___RMActivationPayload, "fetchRequest"));
  v119 = v3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@) AND ((%K == %d) OR ((%K != NULL) AND (%K.%K == YES)))",  @"managementSource",  v3,  @"loadState",  1LL,  @"state",  @"state",  @"active"));
  [v4 setPredicate:v5];

  [v4 setIncludesPendingChanges:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 entity]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[RMActivationPayload entity](&OBJC_CLASS___RMActivationPayload, "entity"));
  unsigned int v8 = [v6 isKindOfEntity:v7];

  if (v8)
  {
    v159[0] = @"identifier";
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v159, 1LL));
    [v4 setPropertiesToFetch:v9];

    *(void *)v164 = @"state";
    *(void *)&v164[8] = @"configurationReferences";
    id v10 = (__int128 *)v164;
    uint64_t v11 = 2LL;
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[RMConfigurationPayload entity](&OBJC_CLASS___RMConfigurationPayload, "entity"));
    unsigned int v13 = [v6 isKindOfEntity:v12];

    if (!v13) {
      goto LABEL_6;
    }
    *(void *)&__int128 v165 = @"identifier";
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v165, 1LL));
    [v4 setPropertiesToFetch:v14];

    *(void *)&__int128 v160 = @"state";
    id v10 = &v160;
    uint64_t v11 = 1LL;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, v11));
  [v4 setRelationshipKeyPathsForPrefetching:v15];

LABEL_6:
  *(void *)buf = 0LL;
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v4 execute:buf]);
  id v17 = *(id *)buf;
  __int128 v18 = v17;
  v120 = (void *)v16;
  if (!v16)
  {
    unsigned __int8 v27 = v4;
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      sub_1000085A0();
    }

    LOBYTE(v6) = 0;
    __int128 v20 = v119;
    goto LABEL_100;
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[RMConfigurationPayload fetchRequest](&OBJC_CLASS___RMConfigurationPayload, "fetchRequest"));
  __int128 v20 = v119;
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@) AND ((%K == %d) OR ((%K != NULL) AND (%K.%K == YES)))",  @"managementSource",  v119,  @"loadState",  1LL,  @"state",  @"state",  @"active"));
  [v19 setPredicate:v21];

  [v19 setIncludesPendingChanges:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v19 entity]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[RMActivationPayload entity](&OBJC_CLASS___RMActivationPayload, "entity"));
  unsigned int v23 = [v6 isKindOfEntity:v22];

  if (v23)
  {
    v159[0] = @"identifier";
    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v159, 1LL));
    [v19 setPropertiesToFetch:v24];

    *(void *)v164 = @"state";
    *(void *)&v164[8] = @"configurationReferences";
    uint64_t v25 = (__int128 *)v164;
    uint64_t v26 = 2LL;
LABEL_14:
    id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, v26));
    [v19 setRelationshipKeyPathsForPrefetching:v32];

    goto LABEL_15;
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue(+[RMConfigurationPayload entity](&OBJC_CLASS___RMConfigurationPayload, "entity"));
  unsigned int v30 = [v6 isKindOfEntity:v29];

  if (v30)
  {
    *(void *)&__int128 v165 = @"identifier";
    id v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v165, 1LL));
    [v19 setPropertiesToFetch:v31];

    *(void *)&__int128 v160 = @"state";
    uint64_t v25 = &v160;
    uint64_t v26 = 1LL;
    goto LABEL_14;
  }

- (id)_checkPredicateStatusKeysForActivations:(id)a3 managementSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v38 objects:buf count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v39;
    do
    {
      id v14 = 0LL;
      do
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v38 + 1) + 8 * (void)v14) predicateDescription]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 statusKeyPaths]);
        -[NSMutableSet addObjectsFromArray:](v9, "addObjectsFromArray:", v16);

        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v38 objects:buf count:16];
    }

    while (v12);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v9, "allObjects"));
  uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([(id)v18 componentsJoinedByString:@","]);

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v7 predicateStatusKeys]);
  LOBYTE(v18) = [v20 isEqualToString:v19];

  if ((v18 & 1) != 0) {
    goto LABEL_19;
  }
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Activation predicate status key values have changed",  buf,  2u);
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v7 predicateStatusKeys]);
  unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v22 componentsSeparatedByString:@","]);
  BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v23));

  id v25 = -[NSMutableSet mutableCopy](v9, "mutableCopy");
  [v25 minusSet:v24];
  [v7 setPredicateStatusKeys:v19];
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[RMActivationEngine context](self, "context"));
  id v37 = 0LL;
  unsigned int v27 = [v26 save:&v37];
  id v28 = v37;

  id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
  unsigned int v30 = v29;
  if (v27)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      sub_100008688();
    }

    id v31 = (void *)objc_claimAutoreleasedReturnValue( +[RMExternalStatusPublisher sharedPublisher]( &OBJC_CLASS___RMExternalStatusPublisher,  "sharedPublisher"));
    [v31 listenToNotificationsForAllKeyPaths];

    if ([v25 count])
    {
      id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        sub_10000861C();
      }

      id v33 = (void *)objc_claimAutoreleasedReturnValue( +[RMExternalStatusPublisher sharedPublisher]( &OBJC_CLASS___RMExternalStatusPublisher,  "sharedPublisher"));
      __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
      [v33 publishStatusKeys:v25 storeIdentifier:v34];
    }

LABEL_19:
    __int128 v35 = v9;
    goto LABEL_23;
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
    sub_1000086B4();
  }

  __int128 v35 = 0LL;
LABEL_23:

  return v35;
}

- (BOOL)_removeKeychainAssets:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 assets]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 personaIdentifier]);

  -[RMActivationEngine _assetsRemoved:managementSourceIdentifier:personaID:]( self,  "_assetsRemoved:managementSourceIdentifier:personaID:",  v6,  v7,  v8);
  return 1;
}

+ (BOOL)_isKeychainAsset:(id)a3
{
  uint64_t v3 = qword_1000CEF50;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1000CEF50, &stru_1000B8DC8);
  }
  id v5 = (void *)qword_1000CEF48;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 declarationType]);

  unsigned __int8 v7 = [v5 containsObject:v6];
  return v7;
}

- (BOOL)_assetsRemoved:(id)a3 managementSourceIdentifier:(id)a4 personaID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v11 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    char v13 = 0;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        if (+[RMActivationEngine _isKeychainAsset:](&OBJC_CLASS___RMActivationEngine, "_isKeychainAsset:", v16))
        {
          -[RMActivationEngine _keychainAssetRemoved:managementSourceIdentifier:personaID:]( self,  "_keychainAssetRemoved:managementSourceIdentifier:personaID:",  v16,  v9,  v10);
          char v13 = 1;
        }
      }

      id v12 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v12);
  }

  else
  {
    char v13 = 0;
  }

  return v13 & 1;
}

- (void)_keychainAssetRemoved:(id)a3 managementSourceIdentifier:(id)a4 personaID:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog activationEngine](&OBJC_CLASS___RMLog, "activationEngine"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 serverToken]);
    int v16 = 138543618;
    id v17 = v11;
    __int16 v18 = 2114;
    __int128 v19 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Removing asset keychain item: %{public}@:%{public}@",  (uint8_t *)&v16,  0x16u);
  }

  char v13 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 serverToken]);
  id v15 = +[RMStoreDeclarationKey newDeclarationKeyWithSubscriberIdentifier:storeIdentifier:declarationIdentifier:declarationServerToken:]( &OBJC_CLASS___RMStoreDeclarationKey,  "newDeclarationKeyWithSubscriberIdentifier:storeIdentifier:declarationIdentifier:declarationServerToken:",  &stru_1000BB450,  v9,  v13,  v14);

  +[RMStoreAssetResolver removedAsset:personaID:error:]( &OBJC_CLASS___RMStoreAssetResolver,  "removedAsset:personaID:error:",  v15,  v8,  0LL);
}

- (NSManagedObjectID)managementSourceObjectID
{
  return self->_managementSourceObjectID;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (RMDebounceTimer)debouncer
{
  return self->_debouncer;
}

- (void)setDebouncer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end