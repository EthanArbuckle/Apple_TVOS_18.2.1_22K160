@interface MSDApplicationDataPrepareOperation
- (BOOL)_associateContainerPathWithContext;
- (BOOL)_lookupContainerPathsOnDevice;
- (BOOL)_purgeContainerizedDataNotInManifest;
- (MSDApplicationDataPrepareOperation)initWithContext:(id)a3;
- (NSMutableDictionary)dataContainerPaths;
- (NSMutableDictionary)groupContainerPaths;
- (NSMutableDictionary)plugInContainerPaths;
- (id)methodSelectors;
- (void)_createUninstallOperationForContainer:(id)a3 ofType:(id)a4 containerPath:(id)a5 isContainerized:(BOOL)a6;
- (void)setDataContainerPaths:(id)a3;
- (void)setGroupContainerPaths:(id)a3;
- (void)setPlugInContainerPaths:(id)a3;
@end

@implementation MSDApplicationDataPrepareOperation

- (MSDApplicationDataPrepareOperation)initWithContext:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MSDApplicationDataPrepareOperation;
  v3 = -[MSDOperation initWithContext:](&v8, "initWithContext:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
    -[MSDApplicationDataPrepareOperation setDataContainerPaths:](v3, "setDataContainerPaths:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
    -[MSDApplicationDataPrepareOperation setPlugInContainerPaths:](v3, "setPlugInContainerPaths:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
    -[MSDApplicationDataPrepareOperation setGroupContainerPaths:](v3, "setGroupContainerPaths:", v6);
  }

  return v3;
}

- (id)methodSelectors
{
  unsigned int v2 = +[MSDOperationContext downloadOnly](&OBJC_CLASS___MSDOperationContext, "downloadOnly");
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithPointer:]( &OBJC_CLASS___NSValue,  "valueWithPointer:",  "_lookupContainerPathsOnDevice"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", "_associateContainerPathWithContext"));
  v5 = (void *)v4;
  if (v2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v3, v4, 0LL));
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithPointer:]( &OBJC_CLASS___NSValue,  "valueWithPointer:",  "_purgeContainerizedDataNotInManifest"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v3, v5, v7, 0LL));
  }

  return v6;
}

- (BOOL)_lookupContainerPathsOnDevice
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dataContainerURL]);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDApplicationDataPrepareOperation dataContainerPaths](self, "dataContainerPaths"));
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v5 dataContainerURL]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 applicationIdentifier]);
    [v7 setObject:v9 forKey:v10];
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 groupContainerURLs]);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100017054;
  v31[3] = &unk_1000F96F8;
  v31[4] = self;
  [v11 enumerateKeysAndObjectsUsingBlock:v31];

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v5 plugInKitPlugins]);
  id v12 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v12)
  {
    id v13 = v12;
    id v14 = 0LL;
    uint64_t v15 = *(void *)v28;
    do
    {
      v16 = 0LL;
      v17 = v14;
      do
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(id *)(*((void *)&v27 + 1) + 8LL * (void)v16);

        v18 = (void *)objc_claimAutoreleasedReturnValue([v14 dataContainerURL]);
        if (v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDApplicationDataPrepareOperation plugInContainerPaths](self, "plugInContainerPaths"));
          v20 = (void *)objc_claimAutoreleasedReturnValue([v14 dataContainerURL]);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v20 path]);
          v22 = (void *)objc_claimAutoreleasedReturnValue([v14 pluginIdentifier]);
          [v19 setObject:v21 forKey:v22];
        }

        v23 = (void *)objc_claimAutoreleasedReturnValue([v14 groupContainerURLs]);
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472LL;
        v26[2] = sub_1000170D4;
        v26[3] = &unk_1000F96F8;
        v26[4] = self;
        [v23 enumerateKeysAndObjectsUsingBlock:v26];

        v16 = (char *)v16 + 1;
        v17 = v14;
      }

      while (v13 != v16);
      id v13 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }

    while (v13);
  }

  else
  {
    id v14 = 0LL;
  }

  return 1;
}

- (BOOL)_associateContainerPathWithContext
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation allDependentOperations](self, "allDependentOperations"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 demoUserHomePath]);

  v41 = v6;
  v43 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"PseudoContainers"]);
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v50;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v50 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 context]);
        uint64_t v15 = objc_opt_class(&OBJC_CLASS___MSDContentFilesContext, v14);
        char isKindOfClass = objc_opt_isKindOfClass(v13, v15);

        if ((isKindOfClass & 1) != 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue([v12 context]);
          -[NSMutableSet addObject:](v3, "addObject:", v17);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v49 objects:v58 count:16];
    }

    while (v9);
  }

  v40 = v7;

  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id obj = v3;
  id v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v45,  v57,  16LL);
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v46;
    uint64_t v42 = *(void *)v46;
    do
    {
      v21 = 0LL;
      do
      {
        if (*(void *)v46 != v20) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier", v40));
        v24 = (void *)objc_claimAutoreleasedReturnValue([v22 containerType]);
        if (![v22 containerized])
        {
          v26 = 0LL;
          __int128 v28 = 0LL;
          goto LABEL_33;
        }

        v25 = (void *)objc_claimAutoreleasedReturnValue([v22 uniqueName]);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v43 stringByAppendingPathComponent:v25]);

        if ([v24 isEqualToString:@"AppData"])
        {
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[MSDApplicationDataPrepareOperation dataContainerPaths](self, "dataContainerPaths"));
          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:v23]);

          __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[MSDApplicationDataPrepareOperation dataContainerPaths](self, "dataContainerPaths"));
          goto LABEL_23;
        }

        if ([v24 isEqualToString:@"ExtensionData"])
        {
          __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDApplicationDataPrepareOperation plugInContainerPaths](self, "plugInContainerPaths"));
          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:v23]);

          __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[MSDApplicationDataPrepareOperation plugInContainerPaths](self, "plugInContainerPaths"));
          goto LABEL_23;
        }

        if ([v24 isEqualToString:@"GroupData"])
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[MSDApplicationDataPrepareOperation groupContainerPaths](self, "groupContainerPaths"));
          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKey:v23]);

          __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[MSDApplicationDataPrepareOperation groupContainerPaths](self, "groupContainerPaths"));
LABEL_23:
          v32 = v29;
          [v29 removeObjectForKey:v23];

          uint64_t v20 = v42;
          if (v26) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }

        __int128 v28 = 0LL;
        if (v26)
        {
LABEL_24:
          id v33 = sub_10003A95C();
          v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v54 = v22;
            __int16 v55 = 2114;
            v56 = v26;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Container '%{public}@' assigned with pseudo content root path: %{public}@",  buf,  0x16u);
          }

          [v22 setPseudoContentRootPath:v26];
        }

- (BOOL)_purgeContainerizedDataNotInManifest
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDApplicationDataPrepareOperation dataContainerPaths](self, "dataContainerPaths"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100017730;
  v9[3] = &unk_1000F9720;
  v9[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v9];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDApplicationDataPrepareOperation plugInContainerPaths](self, "plugInContainerPaths"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100017810;
  v8[3] = &unk_1000F9720;
  v8[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDApplicationDataPrepareOperation groupContainerPaths](self, "groupContainerPaths"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000178F0;
  v7[3] = &unk_1000F9720;
  v7[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];

  return 1;
}

- (void)_createUninstallOperationForContainer:(id)a3 ofType:(id)a4 containerPath:(id)a5 isContainerized:(BOOL)a6
{
  BOOL v6 = a6;
  id v16 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);

  if (v6)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[MSDContentFilesContext defaultContextForContainerizedAppDataItem:]( &OBJC_CLASS___MSDContentFilesContext,  "defaultContextForContainerizedAppDataItem:",  v11));

    [v14 setContentRootPath:v16];
  }

  else
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[MSDContentFilesContext defaultContextForNonContainerizedAppDataItem:]( &OBJC_CLASS___MSDContentFilesContext,  "defaultContextForNonContainerizedAppDataItem:",  v11));
  }

  [v14 setContainerType:v10];

  [v14 setAppIdentifier:v13];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[MSDOperationRepository createOperationFromIdentifier:withContext:]( &OBJC_CLASS___MSDOperationRepository,  "createOperationFromIdentifier:withContext:",  @"MSDContentFilesUninstallOperation",  v14));
  -[MSDOperation produceNewDependentOperation:forRollback:](self, "produceNewDependentOperation:forRollback:", v15, 0LL);
}

- (NSMutableDictionary)dataContainerPaths
{
  return (NSMutableDictionary *)self->super.super._checkpointBarrier;
}

- (void)setDataContainerPaths:(id)a3
{
}

- (NSMutableDictionary)plugInContainerPaths
{
  return (NSMutableDictionary *)self->super.super._observer;
}

- (void)setPlugInContainerPaths:(id)a3
{
}

- (NSMutableDictionary)groupContainerPaths
{
  return self->_dataContainerPaths;
}

- (void)setGroupContainerPaths:(id)a3
{
}

- (void).cxx_destruct
{
}

@end