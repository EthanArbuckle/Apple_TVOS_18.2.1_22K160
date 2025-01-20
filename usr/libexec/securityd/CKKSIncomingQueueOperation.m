@interface CKKSIncomingQueueOperation
+ (id)decryptCKKSItemToAttributes:(id)a3 keyCache:(id)a4 ckksOperationalDependencies:(id)a5 error:(id *)a6;
- (BOOL)_onqueueHandleIQEChange:(id)a3 item:(SecDbItem *)a4 viewState:(id)a5 sortedForThisView:(BOOL)a6 keyCache:(id)a7;
- (BOOL)_onqueueUpdateIQE:(id)a3 withState:(id)a4 error:(id *)a5;
- (BOOL)fixMismatchedViewItems:(id)a3;
- (BOOL)handleMismatchedViewItems;
- (BOOL)intransaction:(id)a3 processQueueEntries:(id)a4;
- (BOOL)loadAndProcessEntries:(id)a3 withActionFilter:(id)a4 totalQueueEntries:(int64_t *)a5;
- (BOOL)missingKey;
- (BOOL)newOutgoingEntries;
- (BOOL)pendingClassAEntries;
- (BOOL)processNewCurrentItemPointers:(id)a3 viewState:(id)a4;
- (CKKSIncomingQueueOperation)init;
- (CKKSIncomingQueueOperation)initWithDependencies:(id)a3 intending:(id)a4 pendingClassAItemsRemainingState:(id)a5 errorState:(id)a6 handleMismatchedViewItems:(BOOL)a7;
- (CKKSOperationDependencies)deps;
- (NSError)pendingClassAEntriesError;
- (NSMutableSet)viewsToScan;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (OctagonStateString)stateIfClassAItemsRemaining;
- (unint64_t)errorItemsProcessed;
- (unint64_t)successfulItemsProcessed;
- (void)_onqueueGenerateNewUUIDPersistentRefOnSecItem:(SecDbItem *)a3 viewState:(id)a4;
- (void)_onqueueHandleIQEChange:(id)a3 attributes:(id)a4 class:(const SecDbClass *)a5 viewState:(id)a6 sortedForThisView:(BOOL)a7 keyCache:(id)a8;
- (void)_onqueueHandleIQEDelete:(id)a3 class:(const SecDbClass *)a4 viewState:(id)a5;
- (void)_onqueueHandleMismatchedViewItem:(id)a3 secDbClass:(const SecDbClass *)a4 attributes:(id)a5 intendedView:(id)a6 viewState:(id)a7 keyCache:(id)a8;
- (void)main;
- (void)setDeps:(id)a3;
- (void)setErrorItemsProcessed:(unint64_t)a3;
- (void)setHandleMismatchedViewItems:(BOOL)a3;
- (void)setMissingKey:(BOOL)a3;
- (void)setNewOutgoingEntries:(BOOL)a3;
- (void)setNextState:(id)a3;
- (void)setPendingClassAEntries:(BOOL)a3;
- (void)setPendingClassAEntriesError:(id)a3;
- (void)setStateIfClassAItemsRemaining:(id)a3;
- (void)setSuccessfulItemsProcessed:(unint64_t)a3;
- (void)setViewsToScan:(id)a3;
@end

@implementation CKKSIncomingQueueOperation

- (CKKSIncomingQueueOperation)init
{
  return 0LL;
}

- (CKKSIncomingQueueOperation)initWithDependencies:(id)a3 intending:(id)a4 pendingClassAItemsRemainingState:(id)a5 errorState:(id)a6 handleMismatchedViewItems:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CKKSIncomingQueueOperation;
  v17 = -[CKKSResultOperation init](&v22, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong(&v17->super._finishingBlock, a3);
    objc_storeStrong((id *)&v18->super._timeoutQueue, a4);
    objc_storeStrong((id *)&v18->super._successDependencies, a6);
    objc_storeStrong((id *)&v18->_successfulItemsProcessed, a5);
    BYTE2(v18->super._descriptionUnderlyingError) = 0;
    LOBYTE(v18->super._descriptionUnderlyingError) = a7;
    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    deps = v18->_deps;
    v18->_deps = (CKKSOperationDependencies *)v19;

    -[CKKSIncomingQueueOperation setName:](v18, "setName:", @"incoming-queue-operation");
  }

  return v18;
}

- (BOOL)processNewCurrentItemPointers:(id)a3 viewState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0LL;
    uint64_t v10 = *(void *)v26;
    do
    {
      v11 = 0LL;
      v12 = v9;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v11);
        id v14 = objc_autoreleasePoolPush();
        [v13 setState:@"local"];
        id v24 = v12;
        [v13 saveToDatabase:&v24];
        id v9 = v24;

        id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
        id v16 = sub_1000AA6AC(@"ckkspointer", v15);
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);

        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v30 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Saving new current item pointer: %@",  buf,  0xCu);
        }

        if (v9)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
          id v19 = sub_1000AA6AC(@"ckksincoming", v18);
          v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);

          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v30 = v9;
            __int16 v31 = 2112;
            v32 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Error saving new current item pointer: %@ %@",  buf,  0x16u);
          }
        }

        objc_autoreleasePoolPop(v14);
        v11 = (char *)v11 + 1;
        v12 = v9;
      }

      while (v8 != v11);
      id v8 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
    }

    while (v8);
  }

  else
  {
    id v9 = 0LL;
  }

  if ([obj count])
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v6 notifyViewChangedScheduler]);
    [v21 trigger];
  }

  return v9 == 0LL;
}

- (BOOL)intransaction:(id)a3 processQueueEntries:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v110 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v109 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v117 = objc_alloc_init(&OBJC_CLASS___CKKSMemoryKeyCache);
  __int128 v124 = 0u;
  __int128 v125 = 0u;
  __int128 v126 = 0u;
  __int128 v127 = 0u;
  id obj = v7;
  id v116 = [obj countByEnumeratingWithState:&v124 objects:v136 count:16];
  if (v116)
  {
    uint64_t v115 = *(void *)v125;
    id v8 = &AAAccountClassPrimary_ptr;
    v112 = self;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v125 != v115) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v124 + 1) + 8LL * (void)v9);
        context = objc_autoreleasePoolPush();
        id v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
        id v14 = sub_1000AA6AC(@"ckksincoming", v13);
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);

        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 uuid]);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v11 action]);
          *(_DWORD *)buf = 138412802;
          id v131 = v11;
          __int16 v132 = 2112;
          id v133 = v16;
          __int16 v134 = 2112;
          v135 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "ready to process an incoming queue entry: %@ %@ %@",  buf,  0x20u);
        }

        v18 = (void *)objc_claimAutoreleasedReturnValue([v11 item]);
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
        id v123 = 0LL;
        v20 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSIncomingQueueOperation decryptCKKSItemToAttributes:keyCache:ckksOperationalDependencies:error:]( &OBJC_CLASS___CKKSIncomingQueueOperation,  "decryptCKKSItemToAttributes:keyCache:ckksOperationalDependencies:error:",  v18,  v117,  v19,  &v123));
        id v21 = v123;

        if (v20 && !v21)
        {
          objc_super v22 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:kSecClass]);
          uint64_t v24 = objc_opt_class(v8[291], v23);
          if ((objc_opt_isKindOfClass(v22, v24) & 1) != 0)
          {
            if (v22)
            {
              __int128 v25 = sub_1000F77E0(v22);
              if (v25)
              {
                __int128 v26 = v25;
                __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
                __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 syncingPolicy]);
                v113 = v20;
                v29 = (void *)objc_claimAutoreleasedReturnValue([v28 mapDictionaryToView:v20]);

                id v30 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
                __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v30 zoneName]);
                v32 = self;
                unsigned __int8 v33 = [v31 isEqualToString:v29];

                if ((v33 & 1) != 0)
                {
                  v34 = (void *)objc_claimAutoreleasedReturnValue([v11 action]);
                  if ([v34 isEqualToString:@"add"])
                  {

                    goto LABEL_53;
                  }

                  v84 = (void *)objc_claimAutoreleasedReturnValue([v11 action]);
                  unsigned int v85 = [v84 isEqualToString:@"modify"];

                  if (v85)
                  {
LABEL_53:
                    v20 = v113;
                    -[CKKSIncomingQueueOperation _onqueueHandleIQEChange:attributes:class:viewState:sortedForThisView:keyCache:]( v112,  "_onqueueHandleIQEChange:attributes:class:viewState:sortedForThisView:keyCache:",  v11,  v113,  v26,  v6,  1LL,  v117);
                    v86 = (void *)objc_claimAutoreleasedReturnValue([v11 item]);
                    v87 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
                    v88 = (void *)objc_claimAutoreleasedReturnValue([v86 CKRecordWithZoneID:v87]);
                    -[NSMutableArray addObject:](v110, "addObject:", v88);

                    self = v112;
                    id v21 = 0LL;
                    id v8 = &AAAccountClassPrimary_ptr;
                  }

                  else
                  {
                    v100 = (void *)objc_claimAutoreleasedReturnValue([v11 action]);
                    unsigned int v101 = [v100 isEqualToString:@"delete"];

                    self = v112;
                    if (v101)
                    {
                      -[CKKSIncomingQueueOperation _onqueueHandleIQEDelete:class:viewState:]( v112,  "_onqueueHandleIQEDelete:class:viewState:",  v11,  v26,  v6);
                      v102 = objc_alloc(&OBJC_CLASS___CKRecordID);
                      v103 = (void *)objc_claimAutoreleasedReturnValue([v11 uuid]);
                      v104 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
                      v105 = -[CKRecordID initWithRecordName:zoneID:](v102, "initWithRecordName:zoneID:", v103, v104);
                      -[NSMutableArray addObject:](v109, "addObject:", v105);

                      self = v112;
                    }

                    id v21 = 0LL;
                    id v8 = &AAAccountClassPrimary_ptr;
                    v20 = v113;
                  }
                }

                else
                {
                  self = v32;
                  if (-[CKKSIncomingQueueOperation handleMismatchedViewItems](v32, "handleMismatchedViewItems"))
                  {
                    v83 = v32;
                    v20 = v113;
                    -[CKKSIncomingQueueOperation _onqueueHandleMismatchedViewItem:secDbClass:attributes:intendedView:viewState:keyCache:]( v83,  "_onqueueHandleMismatchedViewItem:secDbClass:attributes:intendedView:viewState:keyCache:",  v11,  v26,  v113,  v29,  v6,  v117);
                    id v21 = 0LL;
                  }

                  else
                  {
                    v89 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
                    v90 = (void *)objc_claimAutoreleasedReturnValue([v89 zoneName]);
                    id v91 = sub_1000AA6AC(@"ckksincoming", v90);
                    v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);

                    v20 = v113;
                    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
                    {
                      v93 = (void *)objc_claimAutoreleasedReturnValue([v11 uuid]);
                      *(_DWORD *)buf = 138412546;
                      id v131 = v93;
                      __int16 v132 = 2112;
                      id v133 = v29;
                      _os_log_impl( (void *)&_mh_execute_header,  v92,  OS_LOG_TYPE_DEFAULT,  "Received an item (%@), but our current policy claims it should be in view %@",  buf,  0x16u);
                    }

                    id v119 = 0LL;
                    -[CKKSIncomingQueueOperation _onqueueUpdateIQE:withState:error:]( self,  "_onqueueUpdateIQE:withState:error:",  v11,  @"mismatched_view",  &v119);
                    id v21 = v119;
                    if (v21)
                    {
                      v94 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
                      v95 = (void *)objc_claimAutoreleasedReturnValue([v94 zoneName]);
                      id v96 = sub_1000AA6AC(@"ckksincoming", v95);
                      v97 = (os_log_s *)objc_claimAutoreleasedReturnValue(v96);

                      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        id v131 = v21;
                        _os_log_impl( (void *)&_mh_execute_header,  v97,  OS_LOG_TYPE_ERROR,  "Couldn't save mismatched IQE to database: %@",  buf,  0xCu);
                      }

                      self = v112;
                      -[CKKSIncomingQueueOperation setErrorItemsProcessed:]( v112,  "setErrorItemsProcessed:",  (char *)-[CKKSIncomingQueueOperation errorItemsProcessed](v112, "errorItemsProcessed") + 1);
                      -[CKKSResultOperation setError:](v112, "setError:", v21);
                    }

                    v98 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
                    v99 = (void *)objc_claimAutoreleasedReturnValue([v98 requestPolicyCheck]);
                    [v99 trigger];
                  }

                  id v8 = &AAAccountClassPrimary_ptr;
                }

LABEL_38:
                goto LABEL_48;
              }
            }

            v66 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
            v67 = (void *)objc_claimAutoreleasedReturnValue([v66 zoneName]);
            id v68 = sub_1000AA6AC(@"ckksincoming", v67);
            v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);

            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v131 = v22;
              __int16 v132 = 2112;
              id v133 = v11;
              _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_ERROR,  "unknown class in object: %@ %@",  buf,  0x16u);
            }

            [v11 setState:@"error"];
            id v120 = 0LL;
            [v11 saveToDatabase:&v120];
            id v21 = v120;
            if (v21)
            {
              v70 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
              v71 = (void *)objc_claimAutoreleasedReturnValue([v70 zoneName]);
              id v72 = sub_1000AA6AC(@"ckksincoming", v71);
              v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);

              if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v131 = v21;
                _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_ERROR,  "Couldn't save errored IQE to database: %@",  buf,  0xCu);
              }

              -[CKKSResultOperation setError:](self, "setError:", v21);
            }

            -[CKKSIncomingQueueOperation setErrorItemsProcessed:]( self,  "setErrorItemsProcessed:",  (char *)-[CKKSIncomingQueueOperation errorItemsProcessed](self, "errorItemsProcessed") + 1);
          }

          else
          {
            NSErrorUserInfoKey v128 = NSLocalizedDescriptionKey;
            v58 = (void *)objc_claimAutoreleasedReturnValue( [v8[291] stringWithFormat:@"Item did not have a reasonable class: %@", v22]);
            v129 = v58;
            v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v129,  &v128,  1LL));
            v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"securityd",  -67671LL,  v59));
            -[CKKSResultOperation setError:](self, "setError:", v60);

            v61 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
            v62 = (void *)objc_claimAutoreleasedReturnValue([v61 zoneName]);
            id v63 = sub_1000AA6AC(@"ckksincoming", v62);
            v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);

            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            {
              v65 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
              *(_DWORD *)buf = 138412290;
              id v131 = v65;
              _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_ERROR,  "Synced item seems wrong: %@",  buf,  0xCu);
            }

            -[CKKSIncomingQueueOperation setErrorItemsProcessed:]( self,  "setErrorItemsProcessed:",  (char *)-[CKKSIncomingQueueOperation errorItemsProcessed](self, "errorItemsProcessed") + 1);
            id v21 = 0LL;
          }

          id v8 = &AAAccountClassPrimary_ptr;
          goto LABEL_38;
        }

        v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
        v36 = (void *)objc_claimAutoreleasedReturnValue([v35 lockStateTracker]);
        unsigned int v37 = [v36 isLockedError:v21];

        if (v37)
        {
          v114 = v20;
          v38 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
          v39 = (void *)objc_claimAutoreleasedReturnValue([v38 zoneName]);
          id v40 = sub_1000AA6AC(@"ckksincoming", v39);
          v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);

          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v131 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "Keychain is locked; can't decrypt IQE %@",
              buf,
              0xCu);
          }

          v42 = (void *)objc_claimAutoreleasedReturnValue([v11 item]);
          v43 = (void *)objc_claimAutoreleasedReturnValue([v42 parentKeyUUID]);
          uint64_t v44 = objc_claimAutoreleasedReturnValue([v6 contextID]);
          v45 = v6;
          v46 = (void *)v44;
          v47 = v45;
          v48 = (void *)objc_claimAutoreleasedReturnValue([v45 zoneID]);
          id v122 = 0LL;
          v49 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSKey tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSKey,  "tryFromDatabase:contextID:zoneID:error:",  v43,  v46,  v48,  &v122));
          id v50 = v122;

          v51 = (void *)objc_claimAutoreleasedReturnValue([v49 keyclass]);
          LODWORD(v43) = [v51 isEqualToString:@"classA"];

          self = v112;
          if ((_DWORD)v43)
          {
            -[CKKSIncomingQueueOperation setPendingClassAEntries:](v112, "setPendingClassAEntries:", 1LL);
            -[CKKSIncomingQueueOperation setPendingClassAEntriesError:](v112, "setPendingClassAEntriesError:", v21);
          }

          id v6 = v47;
          id v8 = &AAAccountClassPrimary_ptr;
          v20 = v114;
        }

        else
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue([v21 domain]);
          if (![v52 isEqualToString:@"securityd"])
          {

            self = v112;
LABEL_40:
            v74 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
            v75 = (void *)objc_claimAutoreleasedReturnValue([v74 zoneName]);
            id v76 = sub_1000AA6AC(@"ckksincoming", v75);
            v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);

            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v131 = v11;
              __int16 v132 = 2112;
              id v133 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_ERROR,  "Couldn't decrypt IQE %@ for some reason: %@",  buf,  0x16u);
            }

            [v11 setState:@"error"];
            id v121 = 0LL;
            [v11 saveToDatabase:&v121];
            id v78 = v121;
            if (v78)
            {
              v79 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
              v80 = (void *)objc_claimAutoreleasedReturnValue([v79 zoneName]);
              id v81 = sub_1000AA6AC(@"ckksincoming", v80);
              v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);

              if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                id v131 = v11;
                __int16 v132 = 2112;
                id v133 = v78;
                _os_log_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_ERROR,  "Couldn't save IQE %@ as error for some reason: %@",  buf,  0x16u);
              }

              id v8 = &AAAccountClassPrimary_ptr;
            }

            -[CKKSResultOperation setError:](self, "setError:", v21);

            goto LABEL_47;
          }

          id v53 = [v21 code];

          self = v112;
          if (v53 != (id)-25300LL) {
            goto LABEL_40;
          }
          v54 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
          v55 = (void *)objc_claimAutoreleasedReturnValue([v54 zoneName]);
          id v56 = sub_1000AA6AC(@"ckksincoming", v55);
          v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);

          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v131 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_ERROR,  "Coudn't find key in keychain; will attempt to poke key hierarchy: %@",
              buf,
              0xCu);
          }

          -[CKKSIncomingQueueOperation setMissingKey:](v112, "setMissingKey:", 1LL);
          -[CKKSResultOperation setError:](v112, "setError:", v21);
        }

- (void)_onqueueHandleMismatchedViewItem:(id)a3 secDbClass:(const SecDbClass *)a4 attributes:(id)a5 intendedView:(id)a6 viewState:(id)a7 keyCache:(id)a8
{
  id v14 = a3;
  id v15 = (const __CFDictionary *)a5;
  id v16 = (__CFString *)a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneID]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 zoneName]);
  id v21 = sub_1000AA6AC(@"ckksincoming", v20);
  objc_super v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);

  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue([v14 uuid]);
    *(_DWORD *)buf = 138412546;
    v64 = v23;
    __int16 v65 = 2112;
    v66 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Received an item (%@), which should be in view %@",  buf,  0x16u);
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v14 action]);
  if ([v24 isEqualToString:@"add"])
  {
  }

  else
  {
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v14 action]);
    unsigned int v26 = [v25 isEqualToString:@"modify"];

    if (!v26)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue([v14 action]);
      unsigned int v39 = [v38 isEqualToString:@"delete"];

      if (v39)
      {
        id v40 = -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  v16,  CKCurrentUserDefaultName);
        v41 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
        v42 = self;
        v43 = v40;
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](v42, "deps"));
        v45 = (void *)objc_claimAutoreleasedReturnValue([v44 contextID]);
        id v61 = 0LL;
        v59 = v43;
        v46 = (__CFString *)objc_claimAutoreleasedReturnValue( +[CKKSMirrorEntry tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSMirrorEntry,  "tryFromDatabase:contextID:zoneID:error:",  v41,  v45,  v43,  &v61));
        v47 = (__CFString *)v61;

        v48 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneID]);
        v49 = (void *)objc_claimAutoreleasedReturnValue([v48 zoneName]);
        id v50 = sub_1000AA6AC(@"ckksincoming", v49);
        v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);

        BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);
        if (!v46 || v47)
        {
          if (v52)
          {
            *(_DWORD *)buf = 138412290;
            v64 = v47;
            _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "Unable to load CKKSMirrorEntry from database* %@",  buf,  0xCu);
          }

          id v53 = v59;
        }

        else
        {
          if (v52)
          {
            *(_DWORD *)buf = 138412546;
            v64 = v16;
            __int16 v65 = 2112;
            v66 = v46;
            _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "Other view (%@) already knows about this item, dropping incoming queue entry: %@",  buf,  0x16u);
          }

          id v60 = 0LL;
          [v14 deleteFromDatabase:&v60];
          v51 = (os_log_s *)v60;
          id v53 = v59;
          if (v51)
          {
            v58 = v46;
            v54 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneID]);
            v55 = (void *)objc_claimAutoreleasedReturnValue([v54 zoneName]);
            id v56 = sub_1000AA6AC(@"ckksincoming", v55);
            v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);

            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v64 = (__CFString *)v51;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Unable to delete IQE: %@", buf, 0xCu);
            }

            v46 = v58;
            id v53 = v59;
          }
        }
      }

      goto LABEL_17;
    }
  }

  v62 = 0LL;
  __int128 v27 = (__CFString *)sub_1000E8E18((uint64_t)a4, v15, 0, &v62);
  if (v27 && !v62)
  {
    __int128 v28 = v27;
    if (-[CKKSIncomingQueueOperation _onqueueHandleIQEChange:item:viewState:sortedForThisView:keyCache:]( self,  "_onqueueHandleIQEChange:item:viewState:sortedForThisView:keyCache:",  v14,  v27,  v17,  0LL,  v18))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneID]);
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 zoneName]);
      id v31 = sub_1000AA6AC(@"ckksincoming", v30);
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);

      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v64 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Wrote a keychain item that is actually for %@; requesting scan",
          buf,
          0xCu);
      }

      unsigned __int8 v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation viewsToScan](self, "viewsToScan"));
      [v33 addObject:v16];
    }

    goto LABEL_16;
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneID]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 zoneName]);
  id v36 = sub_1000AA6AC(@"ckksincoming", v35);
  unsigned int v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);

  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v64 = v62;
    _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "Unable to create SecDbItemRef from IQE: %@",  buf,  0xCu);
  }

  __int128 v28 = v62;
  if (v62)
  {
    v62 = 0LL;
LABEL_16:
    CFRelease(v28);
  }

- (BOOL)_onqueueUpdateIQE:(id)a3 withState:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 state]);
  unsigned __int8 v10 = [v9 isEqualToString:v8];

  if ((v10 & 1) != 0) {
    goto LABEL_4;
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 whereClauseToFindSelf]);
  id v12 = [v11 mutableCopy];

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 state]);
  [v12 setObject:v13 forKeyedSubscript:@"state"];

  [v7 setState:v8];
  if (![v7 saveToDatabase:a5])
  {

    LOBYTE(v17) = 0;
    goto LABEL_6;
  }

  id v15 = objc_msgSend((id)objc_opt_class(v7, v14), "sqlTable");
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  BOOL v17 = +[CKKSSQLDatabaseObject deleteFromTable:where:connection:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "deleteFromTable:where:connection:error:",  v16,  v12,  0LL,  a5);

  if (v17) {
LABEL_4:
  }
    LOBYTE(v17) = 1;
LABEL_6:

  return v17;
}

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 personaAdapter]);
  [v4 prepareThreadForKeychainAPIUseForPersonaIdentifier:0];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
  id v133 = (void *)objc_claimAutoreleasedReturnValue([v5 databaseProvider]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 readyAndSyncingViews]);

  id v8 = sub_1000AA6AC(@"ckksincoming", 0LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v153 = (unint64_t)v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Going to process the incoming queues for %@",  buf,  0xCu);
  }

  if (-[CKKSIncomingQueueOperation handleMismatchedViewItems](self, "handleMismatchedViewItems"))
  {
    id v10 = sub_1000AA6AC(@"ckksincoming", 0LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Will handle mismatched view items along the way",  buf,  2u);
    }
  }

  v129 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  uint64_t v125 = kSecurityRTCFieldPendingClassA;
  uint64_t v126 = kSecurityRTCFieldMissingKey;
  v159[0] = kSecurityRTCFieldMissingKey;
  v159[1] = kSecurityRTCFieldPendingClassA;
  v160[0] = &__kCFBooleanFalse;
  v160[1] = &__kCFBooleanFalse;
  id obja = (id)kSecurityRTCFieldNumViews;
  v159[2] = kSecurityRTCFieldNumViews;
  id v12 = v7;
  __int16 v134 = v7;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v7 count]));
  v160[2] = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v160,  v159,  3LL));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 activeAccount]);
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v16 altDSID]);
  uint64_t v18 = kSecurityRTCEventNameProcessIncomingQueue;
  uint64_t v19 = kSecurityRTCEventCategoryAccountDataAccessRecovery;
  uint64_t v127 = kSecurityRTCEventCategoryAccountDataAccessRecovery;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
  v130 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:]( v129,  "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:",  v14,  v17,  v18,  0,  v19,  [v20 sendMetric]);

  id v21 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  id v157 = obja;
  objc_super v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v12 count]));
  v158 = v22;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v158,  &v157,  1LL));
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 activeAccount]);
  unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v25 altDSID]);
  uint64_t v27 = kSecurityRTCEventNameLoadAndProcessIQEs;
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
  v29 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:]( v21,  "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:",  v23,  v26,  v27,  0,  v127,  [v28 sendMetric]);

  id v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
  id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 overallLaunch]);
  [v31 addEvent:@"incoming-processing-begin"];

  __int128 v145 = 0u;
  __int128 v146 = 0u;
  __int128 v143 = 0u;
  __int128 v144 = 0u;
  id v32 = v134;
  id v33 = [v32 countByEnumeratingWithState:&v143 objects:v156 count:16];
  NSErrorUserInfoKey v128 = v29;
  id obj = v32;
  if (!v33)
  {
    uint64_t v35 = 0LL;
LABEL_24:

    if ([v32 count]) {
      unint64_t v47 = (int)v35 / (unint64_t)[v32 count];
    }
    else {
      unint64_t v47 = 0LL;
    }
    v150[0] = kSecurityRTCFieldAvgCKRecords;
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v47));
    v151[0] = v64;
    v150[1] = kSecurityRTCFieldTotalCKRecords;
    __int16 v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v35));
    v151[1] = v65;
    v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v151,  v150,  2LL));
    -[AAFAnalyticsEventSecurity addMetrics:](v29, "addMetrics:", v66);

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v29,  1LL,  0LL);
    if (-[CKKSIncomingQueueOperation newOutgoingEntries](self, "newOutgoingEntries"))
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue( +[CKOperationGroup CKKSGroupWithName:]( &OBJC_CLASS___CKOperationGroup,  "CKKSGroupWithName:",  @"incoming-queue-response"));
      id v68 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
      [v68 setCurrentOutgoingQueueOperationGroup:v67];

      v69 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
      v70 = (void *)objc_claimAutoreleasedReturnValue([v69 flagHandler]);
      [v70 handleFlag:@"process_outgoing_queue"];
    }

    if (-[CKKSIncomingQueueOperation missingKey](self, "missingKey"))
    {
      -[CKKSIncomingQueueOperation setNextState:](self, "setNextState:", @"process_key_hierarchy");
    }

    else
    {
      if (-[CKKSIncomingQueueOperation pendingClassAEntries](self, "pendingClassAEntries"))
      {
        v71 = -[OctagonPendingFlag initWithFlag:conditions:]( objc_alloc(&OBJC_CLASS___OctagonPendingFlag),  "initWithFlag:conditions:",  @"process_incoming_queue",  1LL);
        id v72 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
        v73 = (void *)objc_claimAutoreleasedReturnValue([v72 flagHandler]);
        [v73 handlePendingFlag:v71];

        v74 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation pendingClassAEntriesError](self, "pendingClassAEntriesError"));
        -[CKKSResultOperation setError:](self, "setError:", v74);

        v75 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation stateIfClassAItemsRemaining](self, "stateIfClassAItemsRemaining"));
        -[CKKSIncomingQueueOperation setNextState:](self, "setNextState:", v75);
      }

      else
      {
        v71 = (OctagonPendingFlag *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation intendedState](self, "intendedState"));
        -[CKKSIncomingQueueOperation setNextState:](self, "setNextState:", v71);
      }
    }

    id v76 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation viewsToScan](self, "viewsToScan"));
    id v77 = [v76 count];

    if (v77)
    {
      id v78 = sub_1000AA6AC(@"ckksincoming", 0LL);
      v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        v80 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation viewsToScan](self, "viewsToScan"));
        *(_DWORD *)buf = 138412290;
        unint64_t v153 = (unint64_t)v80;
        _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "Requesting scan for %@", buf, 0xCu);
      }

      id v81 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
      v82 = (void *)objc_claimAutoreleasedReturnValue([v81 flagHandler]);
      [v82 handleFlag:@"dropped_items"];
    }

    id v63 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
    __int128 v136 = 0u;
    __int128 v137 = 0u;
    __int128 v138 = 0u;
    __int128 v139 = 0u;
    id v135 = v32;
    id v83 = [v135 countByEnumeratingWithState:&v136 objects:v149 count:16];
    if (!v83)
    {
LABEL_62:

      v102 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
      v103 = (void *)objc_claimAutoreleasedReturnValue([v102 activeManagedViews]);
      if ([v103 count])
      {
        unint64_t v104 = (int)-[CKKSIncomingQueueOperation successfulItemsProcessed](self, "successfulItemsProcessed");
        v105 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
        id v106 = (void *)objc_claimAutoreleasedReturnValue([v105 activeManagedViews]);
        unint64_t v107 = v104 / (unint64_t)[v106 count];
      }

      else
      {
        unint64_t v107 = 0LL;
      }

      v108 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
      v109 = (void *)objc_claimAutoreleasedReturnValue([v108 activeManagedViews]);
      if ([v109 count])
      {
        unint64_t v110 = (int)-[CKKSIncomingQueueOperation errorItemsProcessed](self, "errorItemsProcessed");
        v111 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
        v112 = (void *)objc_claimAutoreleasedReturnValue([v111 activeManagedViews]);
        unint64_t v113 = v110 / (unint64_t)[v112 count];
      }

      else
      {
        unint64_t v113 = 0LL;
      }

      v147[0] = v125;
      v114 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CKKSIncomingQueueOperation pendingClassAEntries](self, "pendingClassAEntries")));
      v148[0] = v114;
      v147[1] = v126;
      uint64_t v115 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CKKSIncomingQueueOperation missingKey](self, "missingKey")));
      v148[1] = v115;
      v147[2] = kSecurityRTCFieldAvgSuccessfulItemsProcessed;
      id v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v107));
      v148[2] = v116;
      v147[3] = kSecurityRTCFieldAvgErrorItemsProcessed;
      v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v113));
      v148[3] = v117;
      v147[4] = kSecurityRTCFieldSuccessfulItemsProcessed;
      v118 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  -[CKKSIncomingQueueOperation successfulItemsProcessed](self, "successfulItemsProcessed")));
      v148[4] = v118;
      v147[5] = kSecurityRTCFieldErrorItemsProcessed;
      id v119 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  -[CKKSIncomingQueueOperation errorItemsProcessed](self, "errorItemsProcessed")));
      v148[5] = v119;
      id v120 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v148,  v147,  6LL));
      -[AAFAnalyticsEventSecurity addMetrics:](v130, "addMetrics:", v120);

      if (-[CKKSIncomingQueueOperation pendingClassAEntries](self, "pendingClassAEntries")) {
        uint64_t v121 = 0LL;
      }
      else {
        uint64_t v121 = -[CKKSIncomingQueueOperation missingKey](self, "missingKey") ^ 1;
      }
      id v56 = v128;
      v62 = obj;
      id v122 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
      id v61 = v130;
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v130,  v121,  v122);

      id v123 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
      __int128 v124 = (void *)objc_claimAutoreleasedReturnValue([v123 overallLaunch]);
      [v124 addEvent:@"incoming-processing-complete"];

      goto LABEL_72;
    }

    id v84 = v83;
    uint64_t v85 = *(void *)v137;
LABEL_51:
    uint64_t v86 = 0LL;
    while (1)
    {
      if (*(void *)v137 != v85) {
        objc_enumerationMutation(v135);
      }
      v87 = *(void **)(*((void *)&v136 + 1) + 8 * v86);
      v88 = (void *)objc_claimAutoreleasedReturnValue([v87 launch]);
      [v88 addEvent:@"incoming-processed"];

      v89 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
      if (v89)
      {
        v90 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
        id v91 = (void *)objc_claimAutoreleasedReturnValue([v87 zoneID]);
        v92 = (void *)objc_claimAutoreleasedReturnValue([v91 zoneName]);
        [v63 logRecoverableError:v90 forEvent:@"CKKSEventProcessIncomingQueueClassC" zoneName:v92 withAttributes:0];

        v93 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
        v94 = (void *)objc_claimAutoreleasedReturnValue([v93 lockStateTracker]);
        v95 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
        unsigned __int8 v96 = [v94 isLockedError:v95];

        if ((v96 & 1) == 0)
        {
          v97 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
          v98 = (void *)objc_claimAutoreleasedReturnValue([v87 zoneID]);
          v99 = (void *)objc_claimAutoreleasedReturnValue([v98 zoneName]);
          [v63 logRecoverableError:v97 forEvent:@"CKKSEventProcessIncomingQueueClassA" zoneName:v99 withAttributes:0];

LABEL_59:
        }
      }

      else
      {
        v100 = (void *)objc_claimAutoreleasedReturnValue([v87 zoneID]);
        unsigned int v101 = (void *)objc_claimAutoreleasedReturnValue([v100 zoneName]);
        [v63 logSuccessForEvent:@"CKKSEventProcessIncomingQueueClassC" zoneName:v101];

        if (!-[CKKSIncomingQueueOperation pendingClassAEntries](self, "pendingClassAEntries"))
        {
          v97 = (void *)objc_claimAutoreleasedReturnValue([v87 zoneID]);
          v98 = (void *)objc_claimAutoreleasedReturnValue([v97 zoneName]);
          [v63 logSuccessForEvent:@"CKKSEventProcessIncomingQueueClassA" zoneName:v98];
          goto LABEL_59;
        }
      }

      if (v84 == (id)++v86)
      {
        id v84 = [v135 countByEnumeratingWithState:&v136 objects:v149 count:16];
        if (!v84) {
          goto LABEL_62;
        }
        goto LABEL_51;
      }
    }
  }

  id v34 = v33;
  uint64_t v35 = 0LL;
  uint64_t v36 = *(void *)v144;
LABEL_9:
  uint64_t v37 = 0LL;
  while (1)
  {
    if (*(void *)v144 != v36) {
      objc_enumerationMutation(obj);
    }
    v38 = *(void **)(*((void *)&v143 + 1) + 8 * v37);
    unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue([v38 launch]);
    [v39 addEvent:@"incoming-processing-begin"];

    uint64_t v141 = 0LL;
    uint64_t v142 = 0LL;
    if (!-[CKKSIncomingQueueOperation loadAndProcessEntries:withActionFilter:totalQueueEntries:]( self,  "loadAndProcessEntries:withActionFilter:totalQueueEntries:",  v38,  @"delete",  &v142))
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue([v38 zoneName]);
      id v49 = sub_1000AA6AC(@"ckksincoming", v48);
      id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);

      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
        *(_DWORD *)buf = 138412290;
        unint64_t v153 = (unint64_t)v51;
        BOOL v52 = "Early-exiting from IncomingQueueOperation (after processing deletes): %@";
        goto LABEL_30;
      }

- (BOOL)loadAndProcessEntries:(id)a3 withActionFilter:(id)a4 totalQueueEntries:(int64_t *)a5
{
  id v18 = a3;
  id v17 = a4;
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x2020000000LL;
  char v40 = 0;
  uint64_t v33 = 0LL;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  uint64_t v36 = 50LL;
  v31[0] = 0LL;
  v31[1] = v31;
  v31[2] = 0x3032000000LL;
  v31[3] = sub_10006391C;
  v31[4] = sub_10006392C;
  id v32 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 databaseProvider]);

  int64_t v10 = 0LL;
  uint64_t v27 = 0LL;
  __int128 v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  uint64_t v30 = 0LL;
  if (v34[3] == 50)
  {
    while (1)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100064778;
      v20[3] = &unk_100284260;
      v20[4] = self;
      id v11 = v18;
      id v21 = v11;
      uint64_t v23 = &v37;
      uint64_t v24 = v31;
      id v22 = v17;
      __int128 v25 = &v33;
      unsigned int v26 = &v27;
      [v9 dispatchSyncWithSQLTransaction:v20];
      if (*((_BYTE *)v38 + 24)) {
        break;
      }

      if (v34[3] != 50)
      {
        int64_t v10 = v28[3];
        goto LABEL_5;
      }
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneName]);
    id v14 = sub_1000AA6AC(@"ckksincoming", v13);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Early-exiting from IncomingQueueOperation",  buf,  2u);
    }

    *a5 = v28[3];
    BOOL v12 = 0;
  }

  else
  {
LABEL_5:
    *a5 = v10;
    BOOL v12 = 1;
  }

  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v12;
}

- (BOOL)fixMismatchedViewItems:(id)a3
{
  id v4 = a3;
  if (-[CKKSIncomingQueueOperation handleMismatchedViewItems](self, "handleMismatchedViewItems"))
  {
    id v5 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 activeAccount]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 altDSID]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
    id v21 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:]( v5,  "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:",  &__NSDictionary0__struct,  v8,  kSecurityRTCEventNameFixMismatchedViewItems,  0,  kSecurityRTCEventCategoryAccountDataAccessRecovery,  [v9 sendMetric]);

    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneName]);
    id v11 = sub_1000AA6AC(@"ckksincoming", v10);
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Handling policy-mismatched items", buf, 2u);
    }

    uint64_t v42 = 0LL;
    id v43 = &v42;
    uint64_t v44 = 0x2020000000LL;
    uint64_t v45 = 50LL;
    *(void *)buf = 0LL;
    uint64_t v37 = buf;
    uint64_t v38 = 0x3032000000LL;
    uint64_t v39 = sub_10006391C;
    char v40 = sub_10006392C;
    id v41 = 0LL;
    uint64_t v32 = 0LL;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x2020000000LL;
    char v35 = 0;
    uint64_t v28 = 0LL;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000LL;
    uint64_t v31 = 0LL;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 databaseProvider]);

    while (v43[3] == 50)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_10006437C;
      v22[3] = &unk_100284288;
      uint64_t v24 = buf;
      v22[4] = self;
      id v23 = v4;
      __int128 v25 = &v32;
      unsigned int v26 = &v42;
      uint64_t v27 = &v28;
      [v14 dispatchSyncWithSQLTransaction:v22];
    }

    if (v29[3] >= 1)
    {
      uint64_t v46 = kSecurityRTCFieldNumMismatchedItems;
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:"));
      unint64_t v47 = v15;
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));
      -[AAFAnalyticsEventSecurity addMetrics:](v21, "addMetrics:", v16);

      int v17 = *((unsigned __int8 *)v33 + 24);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v21,  v17 == 0,  v18);
    }

    BOOL v19 = *((_BYTE *)v33 + 24) == 0;

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v42, 8);
  }

  else
  {
    BOOL v19 = 1;
  }

  return v19;
}

- (void)_onqueueGenerateNewUUIDPersistentRefOnSecItem:(SecDbItem *)a3 viewState:(id)a4
{
  id v5 = a4;
  id v6 = CFUUIDCreate(kCFAllocatorDefault);
  CFUUIDBytes bytes = CFUUIDGetUUIDBytes(v6);
  id v7 = CFDataCreate(kCFAllocatorDefault, &bytes.byte0, 16LL);
  CFTypeRef cf = 0LL;
  sub_1000E96B4((uint64_t)a3, v7, (__CFString **)&cf);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
  id v10 = sub_1000AA6AC(@"ckksincoming", v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = a3;
    __int16 v17 = 2112;
    CFTypeRef v18 = cf;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "set a new persistentref UUID for item %@: %@",  buf,  0x16u);
  }

  if (v6) {
    CFRelease(v6);
  }
  if (v7) {
    CFRelease(v7);
  }
  CFTypeRef v12 = cf;
  if (cf)
  {
    CFTypeRef cf = 0LL;
    CFRelease(v12);
  }

- (void)_onqueueHandleIQEChange:(id)a3 attributes:(id)a4 class:(const SecDbClass *)a5 viewState:(id)a6 sortedForThisView:(BOOL)a7 keyCache:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a6;
  id v16 = a8;
  id v22 = 0LL;
  __int16 v17 = (__CFString *)sub_1000E8E18((uint64_t)a5, (const __CFDictionary *)a4, 0, &v22);
  -[CKKSIncomingQueueOperation _onqueueGenerateNewUUIDPersistentRefOnSecItem:viewState:]( self,  "_onqueueGenerateNewUUIDPersistentRefOnSecItem:viewState:",  v17,  v15);
  if (v17 && !v22)
  {
    -[CKKSIncomingQueueOperation _onqueueHandleIQEChange:item:viewState:sortedForThisView:keyCache:]( self,  "_onqueueHandleIQEChange:item:viewState:sortedForThisView:keyCache:",  v14,  v17,  v15,  v9,  v16);
LABEL_8:
    CFRelease(v17);
    goto LABEL_9;
  }

  CFTypeRef v18 = (void *)objc_claimAutoreleasedReturnValue([v15 zoneID]);
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v18 zoneName]);
  id v20 = sub_1000AA6AC(@"ckksincoming", v19);
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);

  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Unable to make SecDbItemRef out of attributes: %@",  buf,  0xCu);
  }

  __int16 v17 = v22;
  if (v22)
  {
    id v22 = 0LL;
    goto LABEL_8;
  }

- (BOOL)_onqueueHandleIQEChange:(id)a3 item:(SecDbItem *)a4 viewState:(id)a5 sortedForThisView:(BOOL)a6 keyCache:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v110 = a7;
  uint64_t v147 = 0LL;
  v148 = &v147;
  uint64_t v149 = 0x2020000000LL;
  uint64_t v150 = 0LL;
  uint64_t v141 = 0LL;
  uint64_t v142 = &v141;
  uint64_t v143 = 0x3032000000LL;
  __int128 v144 = sub_10006391C;
  __int128 v145 = sub_10006392C;
  id v146 = 0LL;
  if (sub_1000E9A9C(a4))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneID]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneName]);
    id v15 = sub_1000AA6AC(@"ckksincoming", v14);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);

    __int16 v17 = v11;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      CFTypeRef v18 = (void *)objc_claimAutoreleasedReturnValue([v11 uuid]);
      *(_DWORD *)buf = 138412547;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2113;
      *(void *)&buf[14] = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Rejecting a tombstone item addition from CKKS(%@): %{private}@",  buf,  0x16u);
    }

    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 contextID]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneID]);
    id v140 = 0LL;
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSOutgoingQueueEntry withItem:action:contextID:zoneID:keyCache:error:]( &OBJC_CLASS___CKKSOutgoingQueueEntry,  "withItem:action:contextID:zoneID:keyCache:error:",  a4,  @"delete",  v20,  v21,  v110,  &v140));
    id v23 = v140;

    id v139 = v23;
    [v22 saveToDatabase:&v139];
    id v24 = v139;

    if (v24)
    {
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneID]);
      unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v25 zoneName]);
      id v27 = sub_1000AA6AC(@"ckksincoming", v26);
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);

      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Unable to save new deletion OQE: %@",  buf,  0xCu);
      }
    }

    else
    {
      id v138 = 0LL;
      [v11 deleteFromDatabase:&v138];
      id v59 = v138;
      if (v59)
      {
        id v24 = v59;
        id v60 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneID]);
        id v61 = (void *)objc_claimAutoreleasedReturnValue([v60 zoneName]);
        id v62 = sub_1000AA6AC(@"ckksincoming", v61);
        id v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);

        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v24;
          _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_ERROR,  "couldn't delete CKKSIncomingQueueEntry: %@",  buf,  0xCu);
        }

        -[CKKSResultOperation setError:](self, "setError:", v24);
        -[CKKSIncomingQueueOperation setErrorItemsProcessed:]( self,  "setErrorItemsProcessed:",  (char *)-[CKKSIncomingQueueOperation errorItemsProcessed](self, "errorItemsProcessed") + 1);
      }

      else
      {
        -[CKKSIncomingQueueOperation setSuccessfulItemsProcessed:]( self,  "setSuccessfulItemsProcessed:",  (char *)-[CKKSIncomingQueueOperation successfulItemsProcessed](self, "successfulItemsProcessed") + 1);
        id v24 = 0LL;
      }
    }

    -[CKKSIncomingQueueOperation setNewOutgoingEntries:](self, "setNewOutgoingEntries:", 1LL, v110);

LABEL_51:
    BOOL v87 = 0;
    goto LABEL_52;
  }

  if (!sub_1000E9A18(a4))
  {
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneID]);
    __int16 v17 = v11;
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v44 zoneName]);
    id v46 = sub_1000AA6AC(@"ckksincoming", v45);
    unint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);

    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue([v11 uuid]);
      *(_DWORD *)buf = 138412547;
      *(void *)&uint8_t buf[4] = v48;
      *(_WORD *)&buf[12] = 2113;
      *(void *)&buf[14] = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "Rejecting a multiuser item addition from CKKS(%@): %{private}@",  buf,  0x16u);
    }

    id v49 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
    id v50 = (void *)objc_claimAutoreleasedReturnValue([v49 contextID]);
    v51 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneID]);
    id v137 = 0LL;
    BOOL v52 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSOutgoingQueueEntry withItem:action:contextID:zoneID:keyCache:error:]( &OBJC_CLASS___CKKSOutgoingQueueEntry,  "withItem:action:contextID:zoneID:keyCache:error:",  a4,  @"delete",  v50,  v51,  v110,  &v137));
    id v53 = v137;

    id v136 = v53;
    [v52 saveToDatabase:&v136];
    id v54 = v136;

    if (v54)
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneID]);
      id v56 = (void *)objc_claimAutoreleasedReturnValue([v55 zoneName]);
      id v57 = sub_1000AA6AC(@"ckksincoming", v56);
      id v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);

      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v54;
        _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_ERROR,  "Unable to save new deletion OQE: %@",  buf,  0xCu);
      }
    }

    else
    {
      id v135 = 0LL;
      [v11 deleteFromDatabase:&v135];
      id v71 = v135;
      if (v71)
      {
        id v54 = v71;
        id v72 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneID]);
        v73 = (void *)objc_claimAutoreleasedReturnValue([v72 zoneName]);
        id v74 = sub_1000AA6AC(@"ckksincoming", v73);
        v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);

        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v54;
          _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_ERROR,  "couldn't delete CKKSIncomingQueueEntry: %@",  buf,  0xCu);
        }

        -[CKKSResultOperation setError:](self, "setError:", v54);
        -[CKKSIncomingQueueOperation setErrorItemsProcessed:]( self,  "setErrorItemsProcessed:",  (char *)-[CKKSIncomingQueueOperation errorItemsProcessed](self, "errorItemsProcessed") + 1);
      }

      else
      {
        -[CKKSIncomingQueueOperation setSuccessfulItemsProcessed:]( self,  "setSuccessfulItemsProcessed:",  (char *)-[CKKSIncomingQueueOperation successfulItemsProcessed](self, "successfulItemsProcessed") + 1);
        id v54 = 0LL;
      }
    }

    -[CKKSIncomingQueueOperation setNewOutgoingEntries:](self, "setNewOutgoingEntries:", 1LL, v110);

    goto LABEL_51;
  }

  __int16 v134 = 0LL;
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
  __int16 v17 = v11;
  uint64_t v30 = (const __CFData *)objc_claimAutoreleasedReturnValue([v29 keychainMusrForCurrentAccount]);
  char v31 = sub_1000E8AF8((uint64_t)a4, kSecAttrMultiUser, v30, &v134);

  if (v134) {
    char v32 = 0;
  }
  else {
    char v32 = v31;
  }
  if ((v32 & 1) == 0)
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneID]);
    __int16 v65 = (void *)objc_claimAutoreleasedReturnValue([v64 zoneName]);
    id v66 = sub_1000AA6AC(@"ckksincoming", v65);
    v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);

    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      id v68 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueOperation deps](self, "deps"));
      v69 = (void *)objc_claimAutoreleasedReturnValue([v68 keychainMusrForCurrentAccount]);
      *(_DWORD *)buf = 138412803;
      *(void *)&uint8_t buf[4] = v69;
      *(_WORD *)&buf[12] = 2113;
      *(void *)&buf[14] = a4;
      *(_WORD *)&buf[22] = 2112;
      v158 = (uint64_t (*)(uint64_t, uint64_t))v134;
      _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_ERROR,  "Unable to set musr %@ on item %{private}@, error: %@",  buf,  0x20u);
    }

    v70 = v134;
    if (v134)
    {
      -[CKKSResultOperation setError:](self, "setError:", v134);
    }

    else
    {
      NSErrorUserInfoKey v161 = NSLocalizedDescriptionKey;
      v70 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to set musr on item"));
      v162 = v70;
      id v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v162,  &v161,  1LL));
      id v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"securityd",  -67671LL,  v76));
      -[CKKSResultOperation setError:](self, "setError:", v77);
    }

    -[CKKSIncomingQueueOperation setErrorItemsProcessed:]( self,  "setErrorItemsProcessed:",  (char *)-[CKKSIncomingQueueOperation errorItemsProcessed](self, "errorItemsProcessed") + 1);
    goto LABEL_51;
  }

  uint64_t v130 = 0LL;
  id v131 = &v130;
  uint64_t v132 = 0x2020000000LL;
  char v133 = 0;
  uint64_t v126 = 0LL;
  uint64_t v127 = &v126;
  uint64_t v128 = 0x2020000000LL;
  char v129 = 0;
  *(void *)buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000LL;
  v158 = sub_10006391C;
  v159 = sub_10006392C;
  id v160 = (id)0xAAAAAAAAAAAAAAAALL;
  Value = CFDictionaryGetValue(a4->var6, kSecAttrModificationDate);
  id v160 = (id)objc_claimAutoreleasedReturnValue(Value);
  uint64_t v34 = (uint64_t)(v148 + 3);
  v114[0] = _NSConcreteStackBlock;
  v114[1] = 3221225472LL;
  v114[2] = sub_100063934;
  v114[3] = &unk_1002842D8;
  __int128 v124 = a4;
  id v119 = &v147;
  id v35 = v12;
  id v115 = v35;
  id v36 = v11;
  BOOL v125 = a6;
  id v120 = &v130;
  id v116 = v36;
  v117 = self;
  id v118 = v110;
  uint64_t v121 = &v141;
  id v122 = buf;
  id v123 = &v126;
  if (!sub_100110ECC(1, 1, 0LL, v34, (uint64_t)v114) || v148[3])
  {
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "zoneID", v110));
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 zoneName]);
    id v39 = sub_1000AA6AC(@"ckksincoming", v38);
    char v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);

    __int16 v17 = v11;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      uint64_t v41 = v148[3];
      *(_DWORD *)unint64_t v155 = 138412290;
      uint64_t v156 = v41;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "couldn't process item from IncomingQueue: %@",  v155,  0xCu);
    }

    uint64_t v42 = v148[3];
    if (v42)
    {
      id v43 = (void *)v142[5];
      v142[5] = v42;

      -[CKKSResultOperation setError:](self, "setError:", v142[5]);
    }

    else
    {
      NSErrorUserInfoKey v153 = NSLocalizedDescriptionKey;
      __int16 v154 = @"kc_with_dbt failed without error";
      id v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v154,  &v153,  1LL));
      v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"securityd",  -67671LL,  v78));
      -[CKKSResultOperation setError:](self, "setError:", v79);
    }

    [v36 setState:@"error"];
    v80 = (id *)(v142 + 5);
    id obj = (id)v142[5];
    [v36 saveToDatabase:&obj];
    objc_storeStrong(v80, obj);
    if (!v142[5]) {
      goto LABEL_47;
    }
    id v81 = (void *)objc_claimAutoreleasedReturnValue([v35 zoneID]);
    v82 = (void *)objc_claimAutoreleasedReturnValue([v81 zoneName]);
    id v83 = sub_1000AA6AC(@"ckksincoming", v82);
    id v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);

    if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    uint64_t v85 = v142[5];
    *(_DWORD *)unint64_t v155 = 138412290;
    uint64_t v156 = v85;
    uint64_t v86 = "Couldn't save errored IQE to database: %@";
    goto LABEL_45;
  }

  if (v142[5])
  {
    v89 = (void *)objc_claimAutoreleasedReturnValue([v35 zoneID]);
    __int16 v17 = v11;
    v90 = (void *)objc_claimAutoreleasedReturnValue([v89 zoneName]);
    id v91 = sub_1000AA6AC(@"ckksincoming", v90);
    id v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);

    if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    uint64_t v92 = v142[5];
    *(_DWORD *)unint64_t v155 = 138412290;
    uint64_t v156 = v92;
    uint64_t v86 = "Couldn't handle IQE, but why?: %@";
LABEL_45:
    _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, v86, v155, 0xCu);
LABEL_46:

    -[CKKSResultOperation setError:](self, "setError:", v142[5]);
    goto LABEL_47;
  }

  v93 = (void *)objc_claimAutoreleasedReturnValue([v35 zoneID]);
  __int16 v17 = v11;
  v94 = (void *)objc_claimAutoreleasedReturnValue([v93 zoneName]);
  id v95 = sub_1000AA6AC(@"ckksincoming", v94);
  unsigned __int8 v96 = (os_log_s *)objc_claimAutoreleasedReturnValue(v95);

  if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)unint64_t v155 = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_DEBUG,  "Correctly processed an IQE; deleting",
      v155,
      2u);
  }

  v97 = (id *)(v142 + 5);
  id v112 = (id)v142[5];
  [v36 deleteFromDatabase:&v112];
  objc_storeStrong(v97, v112);
  if (v142[5])
  {
    v98 = (void *)objc_claimAutoreleasedReturnValue([v35 zoneID]);
    v99 = (void *)objc_claimAutoreleasedReturnValue([v98 zoneName]);
    id v100 = sub_1000AA6AC(@"ckksincoming", v99);
    unsigned int v101 = (os_log_s *)objc_claimAutoreleasedReturnValue(v100);

    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
    {
      uint64_t v102 = v142[5];
      *(_DWORD *)unint64_t v155 = 138412290;
      uint64_t v156 = v102;
      _os_log_impl( (void *)&_mh_execute_header,  v101,  OS_LOG_TYPE_ERROR,  "couldn't delete CKKSIncomingQueueEntry: %@",  v155,  0xCu);
    }

    -[CKKSResultOperation setError:](self, "setError:", v142[5]);
    -[CKKSIncomingQueueOperation setErrorItemsProcessed:]( self,  "setErrorItemsProcessed:",  (char *)-[CKKSIncomingQueueOperation errorItemsProcessed](self, "errorItemsProcessed") + 1);
  }

  else
  {
    -[CKKSIncomingQueueOperation setSuccessfulItemsProcessed:]( self,  "setSuccessfulItemsProcessed:",  (char *)-[CKKSIncomingQueueOperation successfulItemsProcessed](self, "successfulItemsProcessed") + 1);
  }

  if (*(void *)(*(void *)&buf[8] + 40LL))
  {
    v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v103 timeIntervalSinceDate:*(void *)(*(void *)&buf[8] + 40)];
    double v105 = v104;

    v151[0] = @"time";
    id v106 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  (unint64_t)(v105 * 1000.0)));
    v151[1] = @"view";
    v152[0] = v106;
    unint64_t v107 = (void *)objc_claimAutoreleasedReturnValue([v35 zoneID]);
    v108 = (void *)objc_claimAutoreleasedReturnValue([v107 zoneName]);
    v152[1] = v108;
    v109 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v152,  v151,  2LL));
    +[SecCoreAnalytics sendEvent:event:]( &OBJC_CLASS___SecCoreAnalytics,  "sendEvent:event:",  @"com.apple.ckks.item.propagation",  v109);
  }

  if (!*((_BYTE *)v131 + 24))
  {
    BOOL v87 = *((_BYTE *)v127 + 24) == 0;
    goto LABEL_48;
  }

- (void)_onqueueHandleIQEDelete:(id)a3 class:(const SecDbClass *)a4 viewState:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v56 = 0LL;
  id v57 = (__CFString **)&v56;
  uint64_t v58 = 0x2020000000LL;
  uint64_t v59 = 0LL;
  v65[0] = a4->var0;
  v64[0] = kSecClass;
  v64[1] = kSecAttrUUID;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 uuid]);
  v64[2] = kSecAttrSynchronizable;
  v65[1] = v10;
  v65[2] = &__kCFBooleanTrue;
  id v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v65,  v64,  3LL));

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
  id v14 = sub_1000AA6AC(@"ckksincoming", v13);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v63 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "trying to delete with query: %@", buf, 0xCu);
  }

  uint64_t v16 = sub_1000F8790(v11, 0LL, -1LL, 0LL, v57 + 3);
  *(_BYTE *)(v16 + 155) = 1;
  if (v57[3])
  {
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
    CFTypeRef v18 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneName]);
    id v19 = sub_1000AA6AC(@"ckksincoming", v18);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = (const __CFDictionary *)v57[3];
      *(_DWORD *)buf = 138412290;
      id v63 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "couldn't create query: %@", buf, 0xCu);
    }

    id v22 = (const __CFDictionary *)v57[3];
    -[CKKSResultOperation setError:](self, "setError:", v22);
    goto LABEL_7;
  }

  id v23 = (const void **)v16;
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  v55[2] = sub_100063900;
  v55[3] = &unk_100284300;
  v55[4] = &v56;
  v55[5] = v16;
  int v24 = sub_100110ECC(1, 1, 0LL, (uint64_t)(v57 + 3), (uint64_t)v55);
  __int128 v25 = v57;
  unsigned int v26 = (__CFError *)v57[3];
  if (v26)
  {
    if (CFErrorGetCode(v26) != -25300)
    {
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 zoneName]);
      id v35 = sub_1000AA6AC(@"ckksincoming", v34);
      id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);

      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        uint64_t v37 = (const __CFDictionary *)v57[3];
        *(_DWORD *)buf = 138412290;
        id v63 = v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "couldn't delete item: %@", buf, 0xCu);
      }

      id v22 = (const __CFDictionary *)v57[3];
      -[CKKSIncomingQueueOperation setErrorItemsProcessed:]( self,  "setErrorItemsProcessed:",  (char *)-[CKKSIncomingQueueOperation errorItemsProcessed](self, "errorItemsProcessed") + 1);
      -[CKKSResultOperation setError:](self, "setError:", v22);
      sub_1000F8150(v23, 0LL);
      goto LABEL_7;
    }

    id v27 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 zoneName]);
    id v29 = sub_1000AA6AC(@"ckksincoming", v28);
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);

    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      char v31 = (const __CFDictionary *)v57[3];
      *(_DWORD *)buf = 138412290;
      id v63 = v31;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "couldn't delete item (as it's already gone); this is okay: %@",
        buf,
        0xCu);
    }

    __int128 v25 = v57;
    char v32 = v57[3];
    if (v32)
    {
      v57[3] = 0LL;
      CFRelease(v32);
      int v24 = 1;
      __int128 v25 = v57;
    }

    else
    {
      int v24 = 1;
    }
  }

  if (!sub_1000F8254((uint64_t)v23, v24, (CFErrorRef *)v25 + 3) || v57[3])
  {
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
    id v39 = (void *)objc_claimAutoreleasedReturnValue([v38 zoneName]);
    id v40 = sub_1000AA6AC(@"ckksincoming", v39);
    uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);

    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = (const __CFDictionary *)v57[3];
      *(_DWORD *)buf = 138412290;
      id v63 = v42;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "couldn't delete query: %@", buf, 0xCu);
    }

    id v22 = (const __CFDictionary *)v57[3];
    if (v22)
    {
      -[CKKSResultOperation setError:](self, "setError:", v57[3]);
      goto LABEL_7;
    }

    NSErrorUserInfoKey v60 = NSLocalizedDescriptionKey;
    id v61 = @"query_notify_and_destroy failed without error";
    id v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v61,  &v60,  1LL));
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"securityd",  -67671LL,  v43));
    -[CKKSResultOperation setError:](self, "setError:", v44);

LABEL_25:
    id v22 = 0LL;
    goto LABEL_7;
  }

  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
  id v46 = (void *)objc_claimAutoreleasedReturnValue([v45 zoneName]);
  id v47 = sub_1000AA6AC(@"ckksincoming", v46);
  v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);

  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Correctly processed an IQE; deleting", buf, 2u);
  }

  id v54 = 0LL;
  [v8 deleteFromDatabase:&v54];
  id v49 = (const __CFDictionary *)v54;
  if (!v49)
  {
    -[CKKSIncomingQueueOperation setSuccessfulItemsProcessed:]( self,  "setSuccessfulItemsProcessed:",  (char *)-[CKKSIncomingQueueOperation successfulItemsProcessed](self, "successfulItemsProcessed") + 1);
    goto LABEL_25;
  }

  id v22 = v49;
  id v50 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
  v51 = (void *)objc_claimAutoreleasedReturnValue([v50 zoneName]);
  id v52 = sub_1000AA6AC(@"ckksincoming", v51);
  id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);

  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v63 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "couldn't delete CKKSIncomingQueueEntry: %@",  buf,  0xCu);
  }

  -[CKKSResultOperation setError:](self, "setError:", v22);
  -[CKKSIncomingQueueOperation setErrorItemsProcessed:]( self,  "setErrorItemsProcessed:",  (char *)-[CKKSIncomingQueueOperation errorItemsProcessed](self, "errorItemsProcessed") + 1);
LABEL_7:

  _Block_object_dispose(&v56, 8);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 96LL, 1);
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (BOOL)handleMismatchedViewItems
{
  return (uint64_t)self->super._descriptionUnderlyingError & 1;
}

- (void)setHandleMismatchedViewItems:(BOOL)a3
{
  LOBYTE(self->super._descriptionUnderlyingError) = a3;
}

- (unint64_t)successfulItemsProcessed
{
  return *(void *)&self->_handleMismatchedViewItems;
}

- (void)setSuccessfulItemsProcessed:(unint64_t)a3
{
  *(void *)&self->_handleMismatchedViewItems = a3;
}

- (unint64_t)errorItemsProcessed
{
  return (unint64_t)self->_nextState;
}

- (void)setErrorItemsProcessed:(unint64_t)a3
{
  self->_nextState = (OctagonStateString *)a3;
}

- (BOOL)newOutgoingEntries
{
  return BYTE1(self->super._descriptionUnderlyingError) & 1;
}

- (void)setNewOutgoingEntries:(BOOL)a3
{
  BYTE1(self->super._descriptionUnderlyingError) = a3;
}

- (BOOL)pendingClassAEntries
{
  return BYTE2(self->super._descriptionUnderlyingError) & 1;
}

- (void)setPendingClassAEntries:(BOOL)a3
{
  BYTE2(self->super._descriptionUnderlyingError) = a3;
}

- (NSError)pendingClassAEntriesError
{
  return (NSError *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setPendingClassAEntriesError:(id)a3
{
}

- (BOOL)missingKey
{
  return BYTE3(self->super._descriptionUnderlyingError) & 1;
}

- (void)setMissingKey:(BOOL)a3
{
  BYTE3(self->super._descriptionUnderlyingError) = a3;
}

- (NSMutableSet)viewsToScan
{
  return (NSMutableSet *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setViewsToScan:(id)a3
{
}

- (OctagonStateString)stateIfClassAItemsRemaining
{
  return (OctagonStateString *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setStateIfClassAItemsRemaining:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)decryptCKKSItemToAttributes:(id)a3 keyCache:(id)a4 ckksOperationalDependencies:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSItemEncrypter decryptItemToDictionary:keyCache:error:]( &OBJC_CLASS___CKKSItemEncrypter,  "decryptItemToDictionary:keyCache:error:",  v8,  a4,  a6));
  id v10 = [v9 mutableCopy];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 uuid]);
    [v10 setObject:v11 forKeyedSubscript:kSecAttrUUID];

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 plaintextPCSServiceIdentifier]);
    if (v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 plaintextPCSServiceIdentifier]);
      [v10 setObject:v13 forKeyedSubscript:kSecAttrPCSPlaintextServiceIdentifier];
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 plaintextPCSPublicKey]);

    if (v14)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 plaintextPCSPublicKey]);
      [v10 setObject:v15 forKeyedSubscript:kSecAttrPCSPlaintextPublicKey];
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 plaintextPCSPublicIdentity]);

    if (v16)
    {
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v8 plaintextPCSPublicIdentity]);
      [v10 setObject:v17 forKeyedSubscript:kSecAttrPCSPlaintextPublicIdentity];
    }

    [v10 setValue:&__kCFBooleanTrue forKey:kSecAttrSynchronizable];
    id v18 = v10;
  }

  return v10;
}

@end