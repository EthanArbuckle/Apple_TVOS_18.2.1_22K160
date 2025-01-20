@interface RMInternalStatusPublisher
+ (NSSet)supportedKeyPaths;
+ (RMInternalStatusPublisher)sharedPublisher;
+ (id)restrictedKeyPaths;
+ (void)start;
- (BOOL)persistentHistoryNotifier:(id)a3 isChangeInteresting:(id)a4 stop:(BOOL *)a5;
- (NSManagedObjectContext)context;
- (NSSet)supportedKeyPaths;
- (RMInternalStatusPublisher)initWithInternalDeviceStatusByKeyPath:(id)a3 subscribedStatusKeyPathUpdater:(id)a4 persistentHistoryNotifier:(id)a5 context:(id)a6;
- (RMInternalStatusPublisherDelegate)delegate;
- (RMPersistentHistoryNotifier)persistentHistoryNotifier;
- (RMSubscribedStatusKeyPathUpdater)subscribedStatusKeyPathUpdater;
- (id)_queryForStatusWithKeyPaths:(id)a3 onBehalfOfManagementSource:(id)a4;
- (id)queryForStatusWithKeyPaths:(id)a3 onBehalfOfManagementChannel:(id)a4 error:(id *)a5;
- (id)queryForUnacknowledgedStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5 error:(id *)a6;
- (void)_notifyInternalDeviceStatusChangesIfNeeded;
- (void)_start;
- (void)_stop;
- (void)persistentHistoryNotifier:(id)a3 hasChanges:(id)a4;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPersistentHistoryNotifier:(id)a3;
- (void)setSubscribedStatusKeyPathUpdater:(id)a3;
@end

@implementation RMInternalStatusPublisher

+ (RMInternalStatusPublisher)sharedPublisher
{
  if (qword_1000CF168 != -1) {
    dispatch_once(&qword_1000CF168, &stru_1000BA020);
  }
  return (RMInternalStatusPublisher *)(id)qword_1000CF160;
}

- (RMInternalStatusPublisher)initWithInternalDeviceStatusByKeyPath:(id)a3 subscribedStatusKeyPathUpdater:(id)a4 persistentHistoryNotifier:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___RMInternalStatusPublisher;
  v14 = -[RMInternalStatusPublisher init](&v22, "init");
  v15 = v14;
  if (v14)
  {
    if (v10) {
      v16 = v10;
    }
    else {
      v16 = &__NSDictionary0__struct;
    }
    objc_storeStrong((id *)&v14->_internalDeviceStatusByKeyPath, v16);
    objc_storeStrong((id *)&v15->_subscribedStatusKeyPathUpdater, a4);
    objc_storeStrong((id *)&v15->_persistentHistoryNotifier, a5);
    objc_storeStrong((id *)&v15->_context, a6);
    v17 = objc_opt_new(&OBJC_CLASS___NSObject);
    internalDeviceStatusByKeyPathLock = v15->_internalDeviceStatusByKeyPathLock;
    v15->_internalDeviceStatusByKeyPathLock = v17;

    v19 = objc_opt_new(&OBJC_CLASS___NSObject);
    internalDeviceStatusByKeyPathNotificationLock = v15->_internalDeviceStatusByKeyPathNotificationLock;
    v15->_internalDeviceStatusByKeyPathNotificationLock = v19;
  }

  return v15;
}

+ (void)start
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003B124;
  block[3] = &unk_1000B9100;
  block[4] = a1;
  if (qword_1000CF170 != -1) {
    dispatch_once(&qword_1000CF170, block);
  }
}

- (void)_start
{
  v3 = _os_activity_create( (void *)&_mh_execute_header,  "InternalStatusPublisher: Starting...",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &v21);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog internalStatusPublisher](&OBJC_CLASS___RMLog, "internalStatusPublisher"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100040C5C(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[RMInternalStatusPublisher persistentHistoryNotifier](self, "persistentHistoryNotifier"));
  [v12 setDelegate:self];
  [v12 start];
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog internalStatusPublisher](&OBJC_CLASS___RMLog, "internalStatusPublisher"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100040C28(v13, v14, v15, v16, v17, v18, v19, v20);
  }

  -[RMInternalStatusPublisher _notifyInternalDeviceStatusChangesIfNeeded]( self,  "_notifyInternalDeviceStatusChangesIfNeeded");
  os_activity_scope_leave(&v21);
}

- (void)_stop
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[RMInternalStatusPublisher persistentHistoryNotifier](self, "persistentHistoryNotifier"));
  [v3 setDelegate:0];
}

- (void)_notifyInternalDeviceStatusChangesIfNeeded
{
  v28 = self->_internalDeviceStatusByKeyPathNotificationLock;
  objc_sync_enter(v28);
  v36 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  obj = self->_internalDeviceStatusByKeyPathLock;
  objc_sync_enter(obj);
  v27 = self;
  location = (id *)&self->_internalDeviceStatusByKeyPath;
  id v3 = self->_internalDeviceStatusByKeyPath;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RMDevice currentDevice](&OBJC_CLASS___RMDevice, "currentDevice"));
  v45[0] = RMModelStatusItemDeviceModelFamily;
  v35 = (void *)objc_claimAutoreleasedReturnValue([v4 modelFamily]);
  *(void *)buf = v35;
  v45[1] = RMModelStatusItemDeviceModelIdentifier;
  v34 = (void *)objc_claimAutoreleasedReturnValue([v4 modelIdentifier]);
  *(void *)&buf[8] = v34;
  v45[2] = RMModelStatusItemDeviceModelMarketingName;
  v33 = (void *)objc_claimAutoreleasedReturnValue([v4 modelMarketingName]);
  *(void *)&buf[16] = v33;
  v45[3] = RMModelStatusItemDeviceModelNumber;
  v32 = (void *)objc_claimAutoreleasedReturnValue([v4 modelNumber]);
  v47 = v32;
  v45[4] = RMModelStatusItemDeviceOperatingSystemBuildVersion;
  v31 = (void *)objc_claimAutoreleasedReturnValue([v4 operatingSystemBuildVersion]);
  v48 = v31;
  v45[5] = RMModelStatusItemDeviceOperatingSystemFamily;
  v30 = (void *)objc_claimAutoreleasedReturnValue([v4 operatingSystem]);
  v49 = v30;
  v45[6] = RMModelStatusItemDeviceOperatingSystemMarketingName;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 operatingSystemMarketingName]);
  v50 = v5;
  v45[7] = RMModelStatusItemDeviceOperatingSystemSupplementalBuildVersion;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 operatingSystemSupplementalBuildVersion]);
  v51 = v6;
  v45[8] = RMModelStatusItemDeviceOperatingSystemSupplementalExtraVersion;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 operatingSystemSupplementalExtraVersion]);
  v52 = v7;
  v45[9] = RMModelStatusItemDeviceOperatingSystemVersion;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 operatingSystemVersion]);
  v53 = v8;
  v45[10] = RMModelStatusItemDeviceSerialNumber;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 serialNumber]);
  v54 = v9;
  v45[11] = RMModelStatusItemDeviceUDID;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 UDID]);
  v55 = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  v45,  12LL));

  if ([v11 isEqual:v3])
  {

    id v12 = obj;
    objc_sync_exit(obj);
LABEL_17:

    goto LABEL_18;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](v3, "allKeys"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v13));

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
  [v14 addObjectsFromArray:v15];

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v16 = v14;
  id v17 = [v16 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v41 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)i);
        os_activity_scope_state_s v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v20));
        objc_super v22 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v20]);
        if (v21 != v22 && ([v21 isEqual:v22] & 1) == 0)
        {
          v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog internalStatusPublisher](&OBJC_CLASS___RMLog, "internalStatusPublisher"));
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v20;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v21;
            *(_WORD *)&buf[22] = 2114;
            v47 = v22;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "Key %{public}@ changed from: %{public}@ to: %{public}@",  buf,  0x20u);
          }

          -[NSMutableSet addObject:](v36, "addObject:", v20);
        }
      }

      id v17 = [v16 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }

    while (v17);
  }

  objc_storeStrong(location, v11);
  objc_sync_exit(obj);

  if (-[NSMutableSet count](v36, "count"))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RMInternalStatusPublisher subscribedStatusKeyPathUpdater](v27, "subscribedStatusKeyPathUpdater"));
    [v24 notifyStatusDidChangeForKeyPaths:v36];

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RMInternalStatusPublisher context](v27, "context"));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_10003B894;
    v37[3] = &unk_1000B9A00;
    v37[4] = v27;
    id v38 = v11;
    v39 = v25;
    id v12 = v39;
    -[NSObject performBlockAndWait:](v39, "performBlockAndWait:", v37);

    goto LABEL_17;
  }

+ (NSSet)supportedKeyPaths
{
  v5[0] = RMModelStatusItemDeviceModelFamily;
  v5[1] = RMModelStatusItemDeviceModelIdentifier;
  v5[2] = RMModelStatusItemDeviceModelMarketingName;
  v5[3] = RMModelStatusItemDeviceModelNumber;
  v5[4] = RMModelStatusItemDeviceOperatingSystemBuildVersion;
  v5[5] = RMModelStatusItemDeviceOperatingSystemFamily;
  v5[6] = RMModelStatusItemDeviceOperatingSystemMarketingName;
  v5[7] = RMModelStatusItemDeviceOperatingSystemSupplementalBuildVersion;
  v5[8] = RMModelStatusItemDeviceOperatingSystemSupplementalExtraVersion;
  v5[9] = RMModelStatusItemDeviceOperatingSystemVersion;
  v5[10] = RMModelStatusItemDeviceSerialNumber;
  v5[11] = RMModelStatusItemDeviceUDID;
  v5[12] = RMModelStatusItemManagementDeclarations;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 13LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return (NSSet *)v3;
}

- (NSSet)supportedKeyPaths
{
  return (NSSet *)[(id)objc_opt_class(self) supportedKeyPaths];
}

+ (id)restrictedKeyPaths
{
  v5[0] = RMModelStatusItemDeviceUDID;
  v5[1] = RMModelStatusItemDeviceSerialNumber;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 2LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return v3;
}

- (id)queryForStatusWithKeyPaths:(id)a3 onBehalfOfManagementChannel:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  v33 = sub_10003BCEC;
  v34 = sub_10003BCFC;
  id v35 = 0LL;
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  v27 = sub_10003BCEC;
  v28 = sub_10003BCFC;
  id v29 = 0LL;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMInternalStatusPublisher context](self, "context"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10003BD04;
  v17[3] = &unk_1000BA048;
  id v11 = v9;
  objc_super v22 = &v30;
  v23 = &v24;
  id v18 = v11;
  uint64_t v19 = self;
  id v12 = v8;
  id v20 = v12;
  id v13 = v10;
  id v21 = v13;
  [v13 performBlockAndWait:v17];
  uint64_t v14 = (void *)v31[5];
  if (v14)
  {
    id v15 = 0LL;
    if (a5) {
      *a5 = v14;
    }
  }

  else
  {
    id v15 = (id)v25[5];
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v15;
}

- (id)queryForUnacknowledgedStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5 error:(id *)a6
{
  return -[RMInternalStatusPublisher queryForStatusWithKeyPaths:onBehalfOfManagementChannel:error:]( self,  "queryForStatusWithKeyPaths:onBehalfOfManagementChannel:error:",  a3,  a5,  a6);
}

- (id)_queryForStatusWithKeyPaths:(id)a3 onBehalfOfManagementSource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v507 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v434 = RMModelStatusItemManagementDeclarations;
  v435 = v5;
  v436 = v6;
  id v430 = v6;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v430 activations]);
  v455 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v557 = 0u;
  __int128 v558 = 0u;
  __int128 v559 = 0u;
  __int128 v560 = 0u;
  id obj = v7;
  id v463 = [obj countByEnumeratingWithState:&v557 objects:v562 count:16];
  if (v463)
  {
    uint64_t v459 = *(void *)v558;
    v451 = (void *)RMModelStatusManagementDeclarations_Declaration_Valid_unknown;
    id v445 = (id)RMModelStatusManagementDeclarations_Declaration_Valid_valid;
    id v448 = (id)RMModelStatusManagementDeclarations_Declaration_Valid_invalid;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v558 != v459)
        {
          uint64_t v9 = v8;
          objc_enumerationMutation(obj);
          uint64_t v8 = v9;
        }

        uint64_t v471 = v8;
        uint64_t v10 = *(void **)(*((void *)&v557 + 1) + 8 * v8);
        id v487 = v10;
        id v479 = v451;
        v483 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
        if ([v487 loadState] == 2)
        {
          id v11 = v448;

          v475 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason invalidPayloadForDeclaration:]( &OBJC_CLASS___RMModelStatusReason,  "invalidPayloadForDeclaration:",  v487));
          -[NSMutableArray addObject:](v483, "addObject:", v475);
          BOOL v12 = 0LL;
          id v479 = v11;
          goto LABEL_100;
        }

        id v13 = v487;
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___RMAssetPayload);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0
          || (uint64_t v15 = objc_opt_class(&OBJC_CLASS___RMConfigurationPayload), (objc_opt_isKindOfClass(v13, v15) & 1) != 0))
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 managementSource]);
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v13 serverToken]);
          v475 = (void *)objc_claimAutoreleasedReturnValue( +[RMConfigurationStatusArchiver statusForStoreIdentifier:declarationIdentifier:serverToken:]( &OBJC_CLASS___RMConfigurationStatusArchiver,  "statusForStoreIdentifier:declarationIdentifier:serverToken:",  v17,  v18,  v19));
        }

        else
        {
          *(void *)&__int128 v563 = @"valid";
          p_isa = (void **)&__kCFBooleanTrue;
          v475 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &p_isa,  &v563,  1LL));
        }

        if (v475)
        {
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v475 objectForKeyedSubscript:@"valid"]);
          unsigned int v21 = [v20 BOOLValue];
          objc_super v22 = v445;
          if (!v21) {
            objc_super v22 = v448;
          }
          id v23 = v22;

          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v475 objectForKeyedSubscript:@"reasons"]);
          if (v24) {
            -[NSMutableArray addObjectsFromArray:](v483, "addObjectsFromArray:", v24);
          }

          id v479 = v23;
        }

        id v467 = v13;
        uint64_t v25 = objc_opt_class(&OBJC_CLASS___RMActivationPayload);
        if ((objc_opt_isKindOfClass(v467, v25) & 1) != 0)
        {
          id v26 = v467;
          v27 = (void *)objc_claimAutoreleasedReturnValue([v26 state]);
          v28 = v27;
          if (v27)
          {
            uint64_t v29 = objc_claimAutoreleasedReturnValue([v27 inactiveReasons]);
            uint64_t v30 = (void **)v29;
            v31 = &__NSArray0__struct;
            if (v29) {
              v31 = (void *)v29;
            }
            uint64_t v32 = v31;
          }

          else
          {
            uint64_t v30 = (void **)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason missingStateForDeclaration:]( &OBJC_CLASS___RMModelStatusReason,  "missingStateForDeclaration:",  v26));
            p_isa = v30;
            uint64_t v32 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &p_isa,  1LL));
          }

          id v35 = v32;

          goto LABEL_96;
        }

        uint64_t v33 = objc_opt_class(&OBJC_CLASS___RMConfigurationPayload);
        if ((objc_opt_isKindOfClass(v467, v33) & 1) != 0)
        {
          id v535 = v467;
          v34 = (void *)objc_claimAutoreleasedReturnValue([v535 state]);
          v526 = v34;
          if (v34)
          {
            id v35 = (NSMutableArray *)&__NSArray0__struct;
            if (([v34 active] & 1) == 0)
            {
              v544 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
              v36 = (void *)objc_claimAutoreleasedReturnValue([v535 configurationReferences]);
              v37 = (void *)objc_claimAutoreleasedReturnValue([v36 allObjects]);

              v517 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"activation.identifier",  1LL));
              *(void *)&__int128 v571 = v517;
              id v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v571,  1LL));
              v39 = (void *)objc_claimAutoreleasedReturnValue([v37 sortedArrayUsingDescriptors:v38]);

              __int128 v565 = 0u;
              __int128 v566 = 0u;
              __int128 v563 = 0u;
              __int128 v564 = 0u;
              id v40 = v39;
              id v41 = [v40 countByEnumeratingWithState:&v563 objects:&p_isa count:16];
              if (v41)
              {
                uint64_t v42 = *(void *)v564;
                do
                {
                  for (i = 0LL; i != v41; i = (char *)i + 1)
                  {
                    if (*(void *)v564 != v42) {
                      objc_enumerationMutation(v40);
                    }
                    v44 = *(void **)(*((void *)&v563 + 1) + 8LL * (void)i);
                    v45 = (void *)objc_claimAutoreleasedReturnValue([v44 activation]);
                    if (v45)
                    {
                      id v46 = (id)objc_claimAutoreleasedReturnValue([v44 activation]);
                      v47 = (void *)objc_claimAutoreleasedReturnValue([v46 state]);
                      v48 = v47;
                      if (v47)
                      {
                        uint64_t v49 = objc_claimAutoreleasedReturnValue([v47 inactiveReasons]);
                        v50 = (void *)v49;
                        v51 = &__NSArray0__struct;
                        if (v49) {
                          v51 = (void *)v49;
                        }
                        id v52 = v51;
                      }

                      else
                      {
                        v50 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason missingStateForDeclaration:]( &OBJC_CLASS___RMModelStatusReason,  "missingStateForDeclaration:",  v46));
                        *(void *)&__int128 v588 = v50;
                        id v52 = (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v588,  1LL));
                      }

                      v53 = v52;

                      if ([v53 count])
                      {
                        v54 = (void *)objc_claimAutoreleasedReturnValue([v44 activation]);
                        v55 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason activationFailed:]( &OBJC_CLASS___RMModelStatusReason,  "activationFailed:",  v54));
                        -[NSMutableArray addObject:](v544, "addObject:", v55);
                      }
                    }
                  }

                  id v41 = [v40 countByEnumeratingWithState:&v563 objects:&p_isa count:16];
                }

                while (v41);
              }

              if ([v535 loadState] == 4)
              {
                v56 = (void *)objc_claimAutoreleasedReturnValue([v535 declarationType]);
                v57 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason failedWithUnknownDeclarationType:]( &OBJC_CLASS___RMModelStatusReason,  "failedWithUnknownDeclarationType:",  v56));
                -[NSMutableArray addObject:](v544, "addObject:", v57);

                goto LABEL_92;
              }

              if (![v40 count])
              {
                v56 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason configurationIsNotReferencedByAnActivation:]( &OBJC_CLASS___RMModelStatusReason,  "configurationIsNotReferencedByAnActivation:",  v535));
                -[NSMutableArray addObject:](v544, "addObject:", v56);
LABEL_92:
              }

              v92 = v544;

              id v35 = v92;
LABEL_94:
            }

            goto LABEL_96;
          }

          v92 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason missingStateForDeclaration:]( &OBJC_CLASS___RMModelStatusReason,  "missingStateForDeclaration:",  v535));
          p_isa = (void **)&v92->super.super.isa;
          id v35 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &p_isa,  1LL));
          goto LABEL_94;
        }

        uint64_t v58 = objc_opt_class(&OBJC_CLASS___RMAssetPayload);
        id v35 = (NSMutableArray *)&__NSArray0__struct;
        if ((objc_opt_isKindOfClass(v467, v58) & 1) == 0) {
          goto LABEL_96;
        }
        id v441 = v467;
        v491 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
        v59 = (void *)objc_claimAutoreleasedReturnValue([v441 assetReferences]);
        v60 = (void *)objc_claimAutoreleasedReturnValue([v59 allObjects]);

        v437 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"configuration.identifier",  1LL));
        v575 = v437;
        v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v575, 1LL));
        v62 = (void *)objc_claimAutoreleasedReturnValue([v60 sortedArrayUsingDescriptors:v61]);

        __int128 v573 = 0u;
        __int128 v574 = 0u;
        __int128 v571 = 0u;
        __int128 v572 = 0u;
        id v495 = v62;
        id v508 = [v495 countByEnumeratingWithState:&v571 objects:&v563 count:16];
        if (!v508) {
          goto LABEL_84;
        }
        uint64_t v503 = *(void *)v572;
        do
        {
          for (j = 0LL; j != v508; j = (char *)j + 1)
          {
            if (*(void *)v572 != v503) {
              objc_enumerationMutation(v495);
            }
            v63 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v571 + 1) + 8 * (void)j) configuration]);
            v527 = v63;
            v64 = v63;
            if (v63)
            {
              id v518 = v63;
              v65 = (void *)objc_claimAutoreleasedReturnValue([v518 state]);
              v512 = v65;
              if (v65)
              {
                v66 = (NSMutableArray *)&__NSArray0__struct;
                if (([v65 active] & 1) == 0)
                {
                  v545 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
                  v67 = (void *)objc_claimAutoreleasedReturnValue([v518 configurationReferences]);
                  v68 = (void *)objc_claimAutoreleasedReturnValue([v67 allObjects]);

                  v499 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"activation.identifier",  1LL));
                  v592 = v499;
                  v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v592,  1LL));
                  v70 = (void *)objc_claimAutoreleasedReturnValue([v68 sortedArrayUsingDescriptors:v69]);

                  __int128 v590 = 0u;
                  __int128 v591 = 0u;
                  __int128 v588 = 0u;
                  __int128 v589 = 0u;
                  id v71 = v70;
                  id v72 = [v71 countByEnumeratingWithState:&v588 objects:&p_isa count:16];
                  if (v72)
                  {
                    uint64_t v73 = *(void *)v589;
                    do
                    {
                      for (k = 0LL; k != v72; k = (char *)k + 1)
                      {
                        if (*(void *)v589 != v73) {
                          objc_enumerationMutation(v71);
                        }
                        v75 = *(void **)(*((void *)&v588 + 1) + 8LL * (void)k);
                        v76 = (void *)objc_claimAutoreleasedReturnValue([v75 activation]);
                        if (v76)
                        {
                          id v77 = (id)objc_claimAutoreleasedReturnValue([v75 activation]);
                          v78 = (void *)objc_claimAutoreleasedReturnValue([v77 state]);
                          v79 = v78;
                          if (v78)
                          {
                            uint64_t v80 = objc_claimAutoreleasedReturnValue([v78 inactiveReasons]);
                            v81 = (void *)v80;
                            v82 = &__NSArray0__struct;
                            if (v80) {
                              v82 = (void *)v80;
                            }
                            id v83 = v82;
                          }

                          else
                          {
                            v81 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason missingStateForDeclaration:]( &OBJC_CLASS___RMModelStatusReason,  "missingStateForDeclaration:",  v77));
                            v593 = v81;
                            id v83 = (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v593,  1LL));
                          }

                          v84 = v83;

                          if ([v84 count])
                          {
                            v85 = (void *)objc_claimAutoreleasedReturnValue([v75 activation]);
                            v86 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason activationFailed:]( &OBJC_CLASS___RMModelStatusReason,  "activationFailed:",  v85));
                            -[NSMutableArray addObject:](v545, "addObject:", v86);
                          }
                        }
                      }

                      id v72 = [v71 countByEnumeratingWithState:&v588 objects:&p_isa count:16];
                    }

                    while (v72);
                  }

                  if ([v518 loadState] == 4)
                  {
                    v87 = (void *)objc_claimAutoreleasedReturnValue([v518 declarationType]);
                    v88 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason failedWithUnknownDeclarationType:]( &OBJC_CLASS___RMModelStatusReason,  "failedWithUnknownDeclarationType:",  v87));
                    -[NSMutableArray addObject:](v545, "addObject:", v88);

                    goto LABEL_76;
                  }

                  if (![v71 count])
                  {
                    v87 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason configurationIsNotReferencedByAnActivation:]( &OBJC_CLASS___RMModelStatusReason,  "configurationIsNotReferencedByAnActivation:",  v518));
                    -[NSMutableArray addObject:](v545, "addObject:", v87);
LABEL_76:
                  }

                  v89 = v545;

                  v66 = v89;
LABEL_78:
                }

                if (-[NSMutableArray count](v66, "count"))
                {
                  v90 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason configurationFailed:]( &OBJC_CLASS___RMModelStatusReason,  "configurationFailed:",  v518));
                  -[NSMutableArray addObject:](v491, "addObject:", v90);
                }

                v64 = v527;
                goto LABEL_82;
              }

              v89 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason missingStateForDeclaration:]( &OBJC_CLASS___RMModelStatusReason,  "missingStateForDeclaration:",  v518));
              p_isa = (void **)&v89->super.super.isa;
              v66 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &p_isa,  1LL));
              goto LABEL_78;
            }

- (BOOL)persistentHistoryNotifier:(id)a3 isChangeInteresting:(id)a4 stop:(BOOL *)a5
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 updatedProperties]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:@"name"]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 changedObjectID]);
  id v9 = [v5 changeType];
  id v10 = v8;
  id v11 = v7;
  if (v9 != (id)2)
  {
    BOOL v12 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 entity]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[RMActivationPayload entity](&OBJC_CLASS___RMActivationPayload, "entity"));
    unsigned int v15 = [v13 isKindOfEntity:v14];
    if (v9 == (id)1)
    {
      if (v15
        && +[RMDeclarationPayload isSignificantChange:](&OBJC_CLASS___RMActivationPayload, "isSignificantChange:", v11))
      {
        goto LABEL_22;
      }

      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[RMActivationPayloadState entity](&OBJC_CLASS___RMActivationPayloadState, "entity"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[RMAssetPayload entity](&OBJC_CLASS___RMAssetPayload, "entity"));
      if ([v13 isKindOfEntity:v17]
        && +[RMDeclarationPayload isSignificantChange:](&OBJC_CLASS___RMAssetPayload, "isSignificantChange:", v11))
      {
        goto LABEL_20;
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[RMAssetPayloadState entity](&OBJC_CLASS___RMAssetPayloadState, "entity"));
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[RMConfigurationPayload entity](&OBJC_CLASS___RMConfigurationPayload, "entity"));
      if (!objc_msgSend(v13, "isKindOfEntity:")
        || !+[RMConfigurationPayload isSignificantChange:]( &OBJC_CLASS___RMConfigurationPayload,  "isSignificantChange:",  v11))
      {
        objc_super v22 = (void *)objc_claimAutoreleasedReturnValue(+[RMConfigurationPayloadState entity](&OBJC_CLASS___RMConfigurationPayloadState, "entity"));
        LODWORD(v23) = [v13 isKindOfEntity:v22];

        if ((v23 & 1) == 0) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }

      uint64_t v19 = v24;
    }

    else
    {
      if ((v15 & 1) != 0)
      {
LABEL_22:

LABEL_23:
        -[NSMutableSet addObject:](v12, "addObject:", RMModelStatusItemManagementDeclarations, v23);
LABEL_24:

        goto LABEL_25;
      }

      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[RMActivationPayloadState entity](&OBJC_CLASS___RMActivationPayloadState, "entity"));
      if ([v13 isKindOfEntity:v16])
      {
LABEL_21:

        goto LABEL_22;
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[RMAssetPayload entity](&OBJC_CLASS___RMAssetPayload, "entity"));
      if ([v13 isKindOfEntity:v17])
      {
LABEL_20:

        goto LABEL_21;
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[RMAssetPayloadState entity](&OBJC_CLASS___RMAssetPayloadState, "entity"));
      if ([v13 isKindOfEntity:v18])
      {
LABEL_19:

        goto LABEL_20;
      }

      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[RMConfigurationPayload entity](&OBJC_CLASS___RMConfigurationPayload, "entity"));
      if (([v13 isKindOfEntity:v19] & 1) == 0)
      {
        uint64_t v23 = objc_claimAutoreleasedReturnValue(+[RMConfigurationPayloadState entity](&OBJC_CLASS___RMConfigurationPayloadState, "entity"));
        unsigned __int8 v25 = [v13 isKindOfEntity:v23];

        if ((v25 & 1) == 0) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
    }

    goto LABEL_19;
  }

  BOOL v12 = objc_opt_new(&OBJC_CLASS___NSSet);
LABEL_25:

  BOOL v20 = -[NSMutableSet count](v12, "count") != 0LL;
  return v20;
}

- (void)persistentHistoryNotifier:(id)a3 hasChanges:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 persistentHistoryToken]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 persistentHistoryToken]);
  unsigned __int8 v10 = +[RMPersistentHistoryNotifierChanges isExistingPersistentHistoryToken:fromSameStoreAsUpdatedToken:]( &OBJC_CLASS___RMPersistentHistoryNotifierChanges,  "isExistingPersistentHistoryToken:fromSameStoreAsUpdatedToken:",  v8,  v9);

  if ((v10 & 1) != 0)
  {
    uint64_t v21 = 0LL;
    objc_super v22 = &v21;
    uint64_t v23 = 0x3032000000LL;
    uint64_t v24 = sub_10003BCEC;
    unsigned __int8 v25 = sub_10003BCFC;
    id v26 = 0LL;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000402BC;
    v17[3] = &unk_1000B9128;
    BOOL v20 = &v21;
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[RMInternalStatusPublisher context](self, "context"));
    id v18 = v11;
    id v19 = v7;
    [v11 performBlockAndWait:v17];
    if ([(id)v22[5] count])
    {
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( -[RMInternalStatusPublisher subscribedStatusKeyPathUpdater]( self,  "subscribedStatusKeyPathUpdater"));
      [v12 notifyStatusDidChangeForKeyPathsByManagementSourceObjectID:v22[5]];
    }

    _Block_object_dispose(&v21, 8);
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMInternalStatusPublisher subscribedStatusKeyPathUpdater](self, "subscribedStatusKeyPathUpdater"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[RMInternalStatusPublisher supportedKeyPaths]( &OBJC_CLASS___RMInternalStatusPublisher,  "supportedKeyPaths"));
    [v13 notifyStatusDidChangeForKeyPaths:v14];
  }

  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[RMInternalStatusPublisher delegate](self, "delegate"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 persistentHistoryToken]);
  [v15 internalStatusPublisher:self didChangeCommandAndDeclarationsPersistentHistoryToken:v16];
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (RMSubscribedStatusKeyPathUpdater)subscribedStatusKeyPathUpdater
{
  return self->_subscribedStatusKeyPathUpdater;
}

- (void)setSubscribedStatusKeyPathUpdater:(id)a3
{
}

- (RMPersistentHistoryNotifier)persistentHistoryNotifier
{
  return self->_persistentHistoryNotifier;
}

- (void)setPersistentHistoryNotifier:(id)a3
{
}

- (RMInternalStatusPublisherDelegate)delegate
{
  return (RMInternalStatusPublisherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end