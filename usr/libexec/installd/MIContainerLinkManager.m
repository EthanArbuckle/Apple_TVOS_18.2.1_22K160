@interface MIContainerLinkManager
+ (id)_privateContainerManager;
+ (id)_sharedContainerManager;
+ (id)sharedInstanceForDomain:(unint64_t)a3;
- (BOOL)_onQueue_isValidLinkForParent:(id)a3 toChild:(id)a4 error:(id *)a5;
- (BOOL)_onQueue_removeParent:(id)a3 error:(id *)a4;
- (BOOL)_onQueue_setLinkedParentBundleIDList:(id)a3 error:(id *)a4;
- (BOOL)_onQueue_updateLinkForParent:(id)a3 toChild:(id)a4 operationType:(unint64_t)a5 error:(id *)a6;
- (BOOL)getLinkedParent:(id *)a3 forChild:(id)a4 error:(id *)a5;
- (BOOL)linkChild:(id)a3 toParent:(id)a4 error:(id *)a5;
- (BOOL)preflightLinkingChild:(id)a3 toParent:(id)a4 error:(id *)a5;
- (BOOL)removeParent:(id)a3 error:(id *)a4;
- (BOOL)unlinkChild:(id)a3 fromParent:(id)a4 error:(id *)a5;
- (MIContainerLinkManager)initWithDomain:(unint64_t)a3;
- (NSMutableDictionary)parentToLinkedChildrenMap;
- (NSSet)linkedParentBundleIDs;
- (OS_dispatch_queue)internalQueue;
- (id)_onQueue_childrenForParentBundleID:(id)a3 error:(id *)a4;
- (id)_onQueue_linkedParentBundleIDs:(id *)a3;
- (id)childrenForParentBundleID:(id)a3 error:(id *)a4;
- (unint64_t)domain;
- (void)_onQueue_migratePlaygroundsBundleMetadata;
- (void)setDomain:(unint64_t)a3;
- (void)setLinkedParentBundleIDs:(id)a3;
- (void)setParentToLinkedChildrenMap:(id)a3;
@end

@implementation MIContainerLinkManager

- (void)_onQueue_migratePlaygroundsBundleMetadata
{
  v2 = self;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  char v54 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](&OBJC_CLASS___MITestManager, "sharedInstance"));
  id v53 = 0LL;
  unsigned int v6 = [v5 isRunningInTestMode:&v54 outError:&v53];
  id v7 = v53;

  if (v6)
  {
    if (v54) {
      v8 = @"com.apple.mock.Playgrounds";
    }
    else {
      v8 = @"com.apple.Playgrounds";
    }
  }

  else
  {
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      id v35 = v7;
      MOLogWrite(qword_100095BF8);
    }

    v8 = @"com.apple.Playgrounds";
  }

  v9 = v8;
  v41 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  v42 = v9;
  id v52 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerWithIdentifier:createIfNeeded:created:error:",  v9,  0LL,  0LL,  &v52));
  id v11 = v52;
  id v12 = v11;
  if (v10)
  {
    -[NSMutableSet addObject:](v4, "addObject:", v9, v35);
    id v51 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleMetadataWithError:&v51]);
    id v14 = v51;

    if (v13)
    {
      id v50 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer containersWithClass:error:]( &OBJC_CLASS___MIBundleContainer,  "containersWithClass:error:",  1LL,  &v50));
      id v12 = v50;

      if (v15)
      {
        v39 = v4;
        v40 = v13;
        v37 = v10;
        v38 = v2;
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        id v16 = v15;
        id v17 = [v16 countByEnumeratingWithState:&v46 objects:v55 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v47;
          id v20 = v12;
          do
          {
            for (i = 0LL; i != v18; i = (char *)i + 1)
            {
              v22 = v20;
              if (*(void *)v47 != v19) {
                objc_enumerationMutation(v16);
              }
              v23 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
              v24 = objc_autoreleasePoolPush();
              v25 = (void *)objc_claimAutoreleasedReturnValue([v23 identifier]);
              id v45 = v20;
              v26 = (void *)objc_claimAutoreleasedReturnValue([v23 bundleMetadataWithError:&v45]);
              id v20 = v45;

              if (v26)
              {
                v27 = (void *)objc_claimAutoreleasedReturnValue([v26 linkedParentBundleID]);
                unsigned int v28 = [v27 isEqualToString:v42];

                if (v28) {
                  -[NSMutableSet addObject:](v41, "addObject:", v25);
                }
              }

              else if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
              {
                id v35 = v25;
                id v36 = v20;
                MOLogWrite(qword_100095BF8);
              }

              objc_autoreleasePoolPop(v24);
            }

            id v18 = [v16 countByEnumeratingWithState:&v46 objects:v55 count:16];
          }

          while (v18);
        }

        else
        {
          id v20 = v12;
        }

        id v31 = -[NSMutableSet copy](v41, "copy");
        if (-[NSMutableSet count](v41, "count"))
        {
          [v40 setLinkedChildBundleIDs:v31];
          id v44 = v20;
          v10 = v37;
          unsigned __int8 v32 = [v37 saveBundleMetadata:v40 withError:&v44];
          id v12 = v44;

          v2 = v38;
          v4 = v39;
          if ((v32 & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
              sub_100050A88();
            }
            goto LABEL_48;
          }
        }

        else
        {
          id v12 = v20;
          v2 = v38;
          v4 = v39;
          v10 = v37;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_parentToLinkedChildrenMap,  "setObject:forKeyedSubscript:",  v31,  v42,  v35,  v36);
LABEL_48:

        goto LABEL_49;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100050A20();
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_1000509B8();
      }
      id v12 = v14;
    }
  }

  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
    if ([v29 isEqualToString:MIContainerManagerErrorDomain])
    {
      id v30 = [v12 code];

      if (v30 == (id)21) {
        goto LABEL_49;
      }
    }

    else
    {
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100050950();
    }
  }

- (MIContainerLinkManager)initWithDomain:(unint64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MIContainerLinkManager;
  v4 = -[MIContainerLinkManager init](&v17, "init");
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.installd.LinkedContainers", 0LL);
    internalQueue = v4->_internalQueue;
    v4->_internalQueue = (OS_dispatch_queue *)v5;

    id v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    parentToLinkedChildrenMap = v4->_parentToLinkedChildrenMap;
    v4->_parentToLinkedChildrenMap = v7;

    v4->_domain = a3;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
    id v10 = sub_10002BE24();
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    unsigned int v12 = [v9 itemDoesNotExistAtURL:v11];

    if (a3 == 2)
    {
      if (v12)
      {
        v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](v4, "internalQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10002BE88;
        block[3] = &unk_100080BE8;
        id v16 = v4;
        dispatch_sync(v13, block);
      }
    }
  }

  return v4;
}

+ (id)_sharedContainerManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002BF04;
  block[3] = &unk_100080BC0;
  void block[4] = a1;
  if (qword_100095B50 != -1) {
    dispatch_once(&qword_100095B50, block);
  }
  return (id)qword_100095B58;
}

+ (id)_privateContainerManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002BFA8;
  block[3] = &unk_100080BC0;
  void block[4] = a1;
  if (qword_100095B60 != -1) {
    dispatch_once(&qword_100095B60, block);
  }
  return (id)qword_100095B68;
}

+ (id)sharedInstanceForDomain:(unint64_t)a3
{
  v4 = (void *)objc_opt_class(a1);
  if (a3 == 3) {
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _privateContainerManager]);
  }
  else {
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _sharedContainerManager]);
  }
  return v5;
}

- (id)_onQueue_linkedParentBundleIDs:(id *)a3
{
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = self->_linkedParentBundleIDs;
  id v7 = v6;
  if (!v6)
  {
    id v9 = sub_10002BE24();
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v41 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    id v50 = 0LL;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v10,  &v50));
    id v12 = v50;
    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"linkedParentBundles"]);
      objc_opt_class(&OBJC_CLASS___NSArray);
      id v14 = v13;
      if ((objc_opt_isKindOfClass(v14) & 1) != 0)
      {
        if (v14)
        {
          objc_opt_class(&OBJC_CLASS___NSString);
          char v15 = sub_100013434(v14);

          if ((v15 & 1) != 0)
          {
            id v16 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v14));
            linkedParentBundleIDs = self->_linkedParentBundleIDs;
            self->_linkedParentBundleIDs = v16;

            id v18 = 0LL;
LABEL_38:
            v8 = self->_linkedParentBundleIDs;

            goto LABEL_39;
          }
        }
      }

      else
      {
      }
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100050BC4(v10);
    }
    if ((id)-[MIContainerLinkManager domain](self, "domain") == (id)3)
    {
      id v49 = v12;
      uint64_t v19 = &v49;
      id v20 = &v49;
      uint64_t v21 = 14LL;
    }

    else
    {
      id v48 = v12;
      uint64_t v19 = &v48;
      id v20 = &v48;
      uint64_t v21 = 1LL;
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer containersWithClass:error:]( &OBJC_CLASS___MIBundleContainer,  "containersWithClass:error:",  v21,  v20));
    id v22 = *v19;

    if (v18)
    {
      v38 = v11;
      v39 = a3;
      v40 = v10;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      v37 = v18;
      id v23 = v18;
      id v24 = [v23 countByEnumeratingWithState:&v44 objects:v51 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v45;
LABEL_18:
        v27 = 0LL;
        unsigned int v28 = v22;
        while (1)
        {
          if (*(void *)v45 != v26) {
            objc_enumerationMutation(v23);
          }
          v29 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)v27);
          id v30 = objc_autoreleasePoolPush();
          id v31 = (void *)objc_claimAutoreleasedReturnValue([v29 identifier]);
          id v43 = v28;
          unsigned __int8 v32 = (void *)objc_claimAutoreleasedReturnValue([v29 bundleMetadataWithError:&v43]);
          id v22 = v43;

          if (!v32) {
            break;
          }
          unsigned __int8 v33 = (void *)objc_claimAutoreleasedReturnValue([v32 linkedParentBundleID]);
          if (v33) {
            -[NSMutableSet addObject:](v41, "addObject:", v33);
          }

          objc_autoreleasePoolPop(v30);
          v27 = (char *)v27 + 1;
          unsigned int v28 = v22;
          if (v25 == v27)
          {
            id v25 = [v23 countByEnumeratingWithState:&v44 objects:v51 count:16];
            if (v25) {
              goto LABEL_18;
            }
            goto LABEL_26;
          }
        }

        id v18 = v37;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          sub_100050B58();
        }

        objc_autoreleasePoolPop(v30);
        unsigned __int8 v34 = 0;
        id v10 = v40;
        id v7 = 0LL;
        id v11 = v38;
        a3 = v39;
        if (v39) {
          goto LABEL_35;
        }
        goto LABEL_37;
      }

- (BOOL)_onQueue_setLinkedParentBundleIDList:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  id v8 = sub_10002BE24();
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (v6)
  {
    if ((-[NSSet isEqual:](self->_linkedParentBundleIDs, "isEqual:", v6) & 1) != 0)
    {
      id v11 = 0LL;
      id v12 = 0LL;
LABEL_7:
      BOOL v18 = 1;
      goto LABEL_14;
    }

    id v24 = @"linkedParentBundles";
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
    id v25 = v14;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));

    id v23 = 0LL;
    unsigned __int8 v15 = objc_msgSend(v11, "MI_writeToURL:format:options:error:", v10, 200, 1, &v23);
    id v12 = v23;
    if ((v15 & 1) != 0)
    {
      id v16 = (NSSet *)[v6 copy];
      linkedParentBundleIDs = self->_linkedParentBundleIDs;
      self->_linkedParentBundleIDs = v16;

      goto LABEL_7;
    }

    uint64_t v19 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
      MOLogWrite(v19);
    }
  }

  else
  {
    id v13 = sub_1000130F4( (uint64_t)"-[MIContainerLinkManager _onQueue_setLinkedParentBundleIDList:error:]",  290LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Updated linked parent list for linked bundles is nil",  v9,  v21);
    id v12 = (id)objc_claimAutoreleasedReturnValue(v13);
    id v11 = 0LL;
  }

  if (a4)
  {
    id v12 = v12;
    BOOL v18 = 0;
    *a4 = v12;
  }

  else
  {
    BOOL v18 = 0;
  }

- (BOOL)_onQueue_isValidLinkForParent:(id)a3 toChild:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v10);

  id v19 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[MIContainerLinkManager _onQueue_linkedParentBundleIDs:]( self,  "_onQueue_linkedParentBundleIDs:",  &v19));
  id v12 = v19;
  if (v11)
  {
    if ([v11 containsObject:v9])
    {
      id v14 = sub_1000130F4( (uint64_t)"-[MIContainerLinkManager _onQueue_isValidLinkForParent:toChild:error:]",  331LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Existing parent app bundle ID %@ can't be added as a child of %@.",  v13,  (uint64_t)v9);
    }

    else
    {
      if (![v9 isEqualToString:v8])
      {
        BOOL v17 = 1;
        goto LABEL_11;
      }

      id v14 = sub_1000130F4( (uint64_t)"-[MIContainerLinkManager _onQueue_isValidLinkForParent:toChild:error:]",  336LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Same bundle ID, %@, can't be passed as a parent and child for linkage creation",  v15,  (uint64_t)v9);
    }

    uint64_t v16 = objc_claimAutoreleasedReturnValue(v14);

    id v12 = (id)v16;
  }

  if (a5)
  {
    id v12 = v12;
    BOOL v17 = 0;
    *a5 = v12;
  }

  else
  {
    BOOL v17 = 0;
  }

- (BOOL)_onQueue_updateLinkForParent:(id)a3 toChild:(id)a4 operationType:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v12);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager parentToLinkedChildrenMap](self, "parentToLinkedChildrenMap"));
  __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v10]);

  id v50 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[MIContainerLinkManager _onQueue_linkedParentBundleIDs:]( self,  "_onQueue_linkedParentBundleIDs:",  &v50));
  id v15 = v50;
  if (!v14)
  {
    id v19 = 0LL;
    id v23 = 0LL;
    id v25 = 0LL;
    uint64_t v16 = 0LL;
    if (a6)
    {
LABEL_51:
      id v15 = v15;
      BOOL v26 = 0;
      *a6 = v15;
      goto LABEL_52;
    }

- (BOOL)preflightLinkingChild:(id)a3 toParent:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  char v30 = 0;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_10002CE8C;
  id v25 = sub_10002CE9C;
  id v26 = 0LL;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002CEA4;
  block[3] = &unk_100081620;
  id v19 = &v27;
  void block[4] = self;
  id v11 = v9;
  id v17 = v11;
  id v12 = v8;
  id v18 = v12;
  id v20 = &v21;
  dispatch_sync(v10, block);

  int v13 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((_BYTE *)v28 + 24))
  {
    *a5 = (id) v22[5];
    int v13 = *((unsigned __int8 *)v28 + 24);
  }

  BOOL v14 = v13 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (BOOL)linkChild:(id)a3 toParent:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  char v30 = 0;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_10002CE8C;
  id v25 = sub_10002CE9C;
  id v26 = 0LL;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002D094;
  block[3] = &unk_100081620;
  id v19 = &v27;
  void block[4] = self;
  id v11 = v9;
  id v17 = v11;
  id v12 = v8;
  id v18 = v12;
  id v20 = &v21;
  dispatch_sync(v10, block);

  int v13 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((_BYTE *)v28 + 24))
  {
    *a5 = (id) v22[5];
    int v13 = *((unsigned __int8 *)v28 + 24);
  }

  BOOL v14 = v13 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (BOOL)unlinkChild:(id)a3 fromParent:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  char v30 = 0;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_10002CE8C;
  id v25 = sub_10002CE9C;
  id v26 = 0LL;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002D288;
  block[3] = &unk_100081620;
  id v19 = &v27;
  void block[4] = self;
  id v11 = v9;
  id v17 = v11;
  id v12 = v8;
  id v18 = v12;
  id v20 = &v21;
  dispatch_sync(v10, block);

  int v13 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((_BYTE *)v28 + 24))
  {
    *a5 = (id) v22[5];
    int v13 = *((unsigned __int8 *)v28 + 24);
  }

  BOOL v14 = v13 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (BOOL)getLinkedParent:(id *)a3 forChild:(id)a4 error:(id *)a5
{
  id v17 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerWithIdentifier:createIfNeeded:created:error:",  a4,  0LL,  0LL,  &v17));
  id v8 = v17;
  id v9 = v8;
  if (v7)
  {
    id v16 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleMetadataWithError:&v16]);
    id v11 = v16;

    if (v10)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 linkedParentBundleID]);
      BOOL v13 = 1;
      if (!a3) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }

    BOOL v13 = 0;
    id v9 = v11;
  }

  else
  {
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
    else {
      BOOL v13 = 0;
    }
  }

  id v10 = 0LL;
  if (a5 && !v13)
  {
    id v11 = v9;
    BOOL v13 = 0;
    id v10 = 0LL;
    id v12 = 0LL;
    *a5 = v11;
    if (!a3) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  id v11 = v9;
  id v12 = 0LL;
  if (a3) {
LABEL_15:
  }
    *a3 = v12;
LABEL_16:

  return v13;
}

- (id)_onQueue_childrenForParentBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  id v22 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MIContainerLinkManager _onQueue_linkedParentBundleIDs:]( self,  "_onQueue_linkedParentBundleIDs:",  &v22));
  id v9 = v22;
  if (!v8)
  {
    BOOL v14 = 0LL;
LABEL_8:
    id v15 = 0LL;
    id v12 = 0LL;
    BOOL v13 = 0LL;
    goto LABEL_9;
  }

  if (([v8 containsObject:v6] & 1) == 0)
  {
    BOOL v14 = objc_opt_new(&OBJC_CLASS___NSSet);
    goto LABEL_8;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager parentToLinkedChildrenMap](self, "parentToLinkedChildrenMap"));
  id v11 = (NSSet *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v6]);

  if (v11)
  {
    id v12 = 0LL;
    BOOL v13 = 0LL;
  }

  else
  {
    id v21 = v9;
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerWithIdentifier:createIfNeeded:created:error:",  v6,  0LL,  0LL,  &v21));
    id v18 = v21;

    if (!v13)
    {
      BOOL v14 = 0LL;
      id v15 = 0LL;
      id v12 = 0LL;
      id v9 = v18;
      goto LABEL_9;
    }

    id v20 = v18;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleMetadataWithError:&v20]);
    id v9 = v20;

    if (!v12)
    {
      BOOL v14 = 0LL;
      id v15 = 0LL;
      goto LABEL_9;
    }

    id v11 = (NSSet *)objc_claimAutoreleasedReturnValue([v12 linkedChildBundleIDs]);
    if (!v11) {
      id v11 = objc_opt_new(&OBJC_CLASS___NSSet);
    }
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager parentToLinkedChildrenMap](self, "parentToLinkedChildrenMap"));
    [v19 setObject:v11 forKeyedSubscript:v6];
  }

  BOOL v14 = v11;
  id v15 = v14;
LABEL_9:
  if (a4 && !v14) {
    *a4 = v9;
  }
  id v16 = v14;

  return v16;
}

- (id)childrenForParentBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  id v25 = sub_10002CE8C;
  id v26 = sub_10002CE9C;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = sub_10002CE8C;
  id v20 = sub_10002CE9C;
  id v21 = 0LL;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](self, "internalQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002D808;
  v12[3] = &unk_100080EA8;
  BOOL v14 = &v22;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v15 = &v16;
  dispatch_sync(v7, v12);

  id v9 = (void *)v23[5];
  if (a4 && !v9)
  {
    *a4 = (id) v17[5];
    id v9 = (void *)v23[5];
  }

  id v10 = v9;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (BOOL)_onQueue_removeParent:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  id v17 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MIContainerLinkManager _onQueue_linkedParentBundleIDs:]( self,  "_onQueue_linkedParentBundleIDs:",  &v17));
  id v9 = v17;
  if (!v8)
  {
    id v10 = 0LL;
    if (!a4)
    {
LABEL_12:
      BOOL v14 = 0;
      goto LABEL_13;
    }

- (BOOL)removeParent:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 0;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = sub_10002CE8C;
  id v20 = sub_10002CE9C;
  id v21 = 0LL;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager internalQueue](self, "internalQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002DB74;
  v12[3] = &unk_100080EA8;
  BOOL v14 = &v22;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v15 = &v16;
  dispatch_sync(v7, v12);

  int v9 = *((unsigned __int8 *)v23 + 24);
  if (a4 && !*((_BYTE *)v23 + 24))
  {
    *a4 = (id) v17[5];
    int v9 = *((unsigned __int8 *)v23 + 24);
  }

  BOOL v10 = v9 != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (NSMutableDictionary)parentToLinkedChildrenMap
{
  return self->_parentToLinkedChildrenMap;
}

- (void)setParentToLinkedChildrenMap:(id)a3
{
}

- (NSSet)linkedParentBundleIDs
{
  return self->_linkedParentBundleIDs;
}

- (void)setLinkedParentBundleIDs:(id)a3
{
}

- (unint64_t)domain
{
  return self->_domain;
}

- (void)setDomain:(unint64_t)a3
{
  self->_domain = a3;
}

- (void).cxx_destruct
{
}

@end