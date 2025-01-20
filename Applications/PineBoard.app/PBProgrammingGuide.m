@interface PBProgrammingGuide
+ (id)_applicationIdentifiersByBundleIdentifiersMappingCacheURL;
+ (id)_cachedApplicationIdentifiersByBundleIdentifiersMapping;
+ (id)_cachedDisabledApplicationIdentifiers;
+ (id)_cachedProvisionedApplicationIdentifiers;
+ (id)_disabledApplicationIdentifiersCacheURL;
+ (id)_provisionedApplicationIdentifiersCacheURL;
+ (id)sharedInstance;
- (BOOL)_processUpdatesWithBundleList:(id)a3;
- (NSArray)provisionedApplicationIdentifiers;
- (NSDictionary)applicationIdentifiersByBundleIdentifierMapping;
- (NSDictionary)bundleIdentifiersByApplicationIdentifierMapping;
- (NSSet)disabledApplicationIdentifiers;
- (PBProgrammingGuide)init;
- (PBUnavailableBundleListLoader)loader;
- (id)_changesDescriptionForNewProvisionedItems:(id)a3 from:(id)a4;
- (id)_init;
- (id)_reversedDictionaryWithDictionary:(id)a3;
- (void)_addAutoInstallAdditionsToArray:(id)a3;
- (void)_cancelPendingUpdates;
- (void)_notifyProgrammingGuideDidUpdate;
- (void)_performUpdates;
- (void)_reload;
- (void)dealloc;
- (void)setApplicationIdentifiersByBundleIdentifierMapping:(id)a3;
- (void)setBundleIdentifiersByApplicationIdentifierMapping:(id)a3;
- (void)setDisabledApplicationIdentifiers:(id)a3;
- (void)setLoader:(id)a3;
- (void)setNeedsReload;
- (void)setProvisionedApplicationIdentifiers:(id)a3;
@end

@implementation PBProgrammingGuide

+ (id)sharedInstance
{
  if (qword_1004710A8 != -1) {
    dispatch_once(&qword_1004710A8, &stru_1003D9718);
  }
  return (id)qword_1004710A0;
}

- (PBProgrammingGuide)init
{
  return 0LL;
}

- (id)_init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PBProgrammingGuide;
  v2 = -[PBProgrammingGuide init](&v23, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_loadInProgressFlag._Value = 0;
    v2->_needsReload = 0;
    v4 = objc_alloc_init(&OBJC_CLASS___PBUnavailableBundleListLoader);
    loader = v3->_loader;
    v3->_loader = v4;

    id v6 = [(id)objc_opt_class(v3) _cachedProvisionedApplicationIdentifiers];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)v7;
    if (v7) {
      v9 = (void *)v7;
    }
    else {
      v9 = &__NSArray0__struct;
    }
    objc_storeStrong((id *)&v3->_provisionedApplicationIdentifiers, v9);

    id v10 = [(id)objc_opt_class(v3) _cachedDisabledApplicationIdentifiers];
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    if (v11) {
      v13 = v11;
    }
    else {
      v13 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    }
    disabledApplicationIdentifiers = v3->_disabledApplicationIdentifiers;
    v3->_disabledApplicationIdentifiers = v13;

    id v15 = [(id)objc_opt_class(v3) _cachedApplicationIdentifiersByBundleIdentifiersMapping];
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = v16;
    if (v16) {
      v18 = v16;
    }
    else {
      v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    }
    applicationIdentifiersByBundleIdentifierMapping = v3->_applicationIdentifiersByBundleIdentifierMapping;
    v3->_applicationIdentifiersByBundleIdentifierMapping = v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue( -[PBProgrammingGuide _reversedDictionaryWithDictionary:]( v3,  "_reversedDictionaryWithDictionary:",  v3->_applicationIdentifiersByBundleIdentifierMapping));
    bundleIdentifiersByApplicationIdentifierMapping = v3->_bundleIdentifiersByApplicationIdentifierMapping;
    v3->_bundleIdentifiersByApplicationIdentifierMapping = (NSDictionary *)v20;
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBProgrammingGuide;
  -[PBProgrammingGuide dealloc](&v4, "dealloc");
}

- (NSArray)provisionedApplicationIdentifiers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v4 = self->_provisionedApplicationIdentifiers;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSSet)disabledApplicationIdentifiers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v4 = self->_disabledApplicationIdentifiers;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSDictionary)applicationIdentifiersByBundleIdentifierMapping
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v4 = self->_applicationIdentifiersByBundleIdentifierMapping;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSDictionary)bundleIdentifiersByApplicationIdentifierMapping
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v4 = self->_bundleIdentifiersByApplicationIdentifierMapping;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setNeedsReload
{
  id v3 = sub_1000825EC();
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100286854(v4);
  }

  p_needsReload = &self->_needsReload;
  while (!__ldxr((unsigned __int8 *)p_needsReload))
  {
    if (!__stxr(1u, (unsigned __int8 *)p_needsReload))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100155E84;
      block[3] = &unk_1003CFF08;
      block[4] = self;
      dispatch_async(&_dispatch_main_q, block);
      return;
    }
  }

  __clrex();
}

- (void)_reload
{
  p_needsReload = &self->_needsReload;
  while (1)
  {
    int v3 = __ldxr((unsigned __int8 *)p_needsReload);
    if (v3 != 1) {
      break;
    }
    if (!__stxr(0, (unsigned __int8 *)p_needsReload))
    {
      -[PBProgrammingGuide _performUpdates](self, "_performUpdates");
      return;
    }
  }

  __clrex();
}

- (void)_notifyProgrammingGuideDidUpdate
{
  id v3 = sub_100083AC8();
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Notify programming guide did update.", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 postNotificationName:@"PBProgrammingGuideDidUpdateNotification" object:self];
}

- (void)_cancelPendingUpdates
{
  loaderCancellation = self->_loaderCancellation;
  self->_loaderCancellation = 0LL;
}

- (void)_performUpdates
{
  p_loadInProgressFlag = &self->_loadInProgressFlag;
  do
    unsigned __int8 v4 = __ldxr((unsigned __int8 *)p_loadInProgressFlag);
  while (__stxr(1u, (unsigned __int8 *)p_loadInProgressFlag));
  if ((v4 & 1) != 0)
  {
    id v8 = sub_100083AC8();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Fetch already in progress, ignoring perform update.",  (uint8_t *)location,  2u);
    }
  }

  else
  {
    -[PBProgrammingGuide _cancelPendingUpdates](self, "_cancelPendingUpdates");
    objc_initWeak(location, self);
    loader = self->_loader;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001560BC;
    v10[3] = &unk_1003D9740;
    objc_copyWeak(&v11, location);
    id v6 = (PBCancellable *)objc_claimAutoreleasedReturnValue( -[PBUnavailableBundleListLoader fetchListWithCompletion:]( loader,  "fetchListWithCompletion:",  v10));
    loaderCancellation = self->_loaderCancellation;
    self->_loaderCancellation = v6;

    objc_destroyWeak(&v11);
    objc_destroyWeak(location);
  }

- (BOOL)_processUpdatesWithBundleList:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mappingInfo]);
  if (v5)
  {
    id v6 = [(id)objc_opt_class(self) _applicationIdentifiersByBundleIdentifiersMappingCacheURL];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [v5 writeToURL:v7 atomically:1];

    os_unfair_lock_lock(&self->_lock);
    unsigned int v8 = -[NSDictionary isEqual:](self->_applicationIdentifiersByBundleIdentifierMapping, "isEqual:", v5);
    if ((v8 & 1) == 0)
    {
      v9 = (NSDictionary *)[v5 copy];
      applicationIdentifiersByBundleIdentifierMapping = self->_applicationIdentifiersByBundleIdentifierMapping;
      self->_applicationIdentifiersByBundleIdentifierMapping = v9;

      id v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue( -[PBProgrammingGuide _reversedDictionaryWithDictionary:]( self,  "_reversedDictionaryWithDictionary:",  v5));
      bundleIdentifiersByApplicationIdentifierMapping = self->_bundleIdentifiersByApplicationIdentifierMapping;
      self->_bundleIdentifiersByApplicationIdentifierMapping = v11;
    }

    int v13 = v8 ^ 1;
    os_unfair_lock_unlock(&self->_lock);
  }

  else
  {
    int v13 = 0;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 disabledAdamIDs]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 provisionedAdamIDs]);

  v16 = &__NSArray0__struct;
  if (v15) {
    v16 = v15;
  }
  id v17 = v16;

  id v18 = [v17 mutableCopy];
  [v18 removeObjectsInArray:v14];
  if ([v18 count] || objc_msgSend(v14, "count"))
  {
    id v19 = [(id)objc_opt_class(self) _provisionedApplicationIdentifiersCacheURL];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    int v13 = 1;
    [v18 writeToURL:v20 atomically:1];

    id v21 = [(id)objc_opt_class(self) _disabledApplicationIdentifiersCacheURL];
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    [v14 writeToURL:v22 atomically:1];

    -[PBProgrammingGuide willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"provisionedApplicationIdentifiers");
    -[PBProgrammingGuide willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"disabledApplicationIdentifiers");
    os_unfair_lock_lock(&self->_lock);
    id v23 = -[NSArray copy](self->_provisionedApplicationIdentifiers, "copy");
    v24 = (NSArray *)[v18 copy];
    provisionedApplicationIdentifiers = self->_provisionedApplicationIdentifiers;
    self->_provisionedApplicationIdentifiers = v24;

    v26 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v14));
    disabledApplicationIdentifiers = self->_disabledApplicationIdentifiers;
    self->_disabledApplicationIdentifiers = v26;

    os_unfair_lock_unlock(&self->_lock);
    -[PBProgrammingGuide didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"provisionedApplicationIdentifiers");
    -[PBProgrammingGuide didChangeValueForKey:](self, "didChangeValueForKey:", @"disabledApplicationIdentifiers");
  }

  else
  {
    id v23 = 0LL;
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue( -[PBProgrammingGuide _changesDescriptionForNewProvisionedItems:from:]( self,  "_changesDescriptionForNewProvisionedItems:from:",  v18,  v23));
  id v29 = sub_100083AC8();
  v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = 134219010;
    id v33 = [v5 count];
    __int16 v34 = 2048;
    id v35 = [v18 count];
    __int16 v36 = 2048;
    id v37 = [v14 count];
    __int16 v38 = 1024;
    int v39 = v13;
    __int16 v40 = 2114;
    v41 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Updated programming guide. {mappingInfo=%lu, provisionedItems=%lu, disabledItems=%lu, hasChanges=%{BOOL}d, changes=%{public}@}",  (uint8_t *)&v32,  0x30u);
  }

  return v13;
}

- (void)_addAutoInstallAdditionsToArray:(id)a3
{
  id v3 = a3;
  id v4 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v27 firstObject]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5));

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 processName]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathComponent:v8]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:@"AutoInstallAdditions.plist"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithURL:](&OBJC_CLASS___NSInputStream, "inputStreamWithURL:", v10));
  [v11 open];
  id v32 = 0LL;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithStream:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithStream:options:format:error:",  v11,  0LL,  0LL,  &v32));
  id v26 = v32;
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0) {
    v14 = v12;
  }
  else {
    v14 = 0LL;
  }
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 allValues]);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v16 = [v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0) {
          v22 = v20;
        }
        else {
          v22 = 0LL;
        }
        id v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "tvs_numberForKey:", @"adamID"));
        if (v23) {
          [v3 addObject:v23];
        }
      }

      id v17 = [v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }

    while (v17);
  }

  [v11 close];
  if (!v12)
  {
    id v24 = sub_100083AC8();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_100286954((uint64_t)v10, (uint64_t)v26, v25);
    }
  }
}

- (id)_reversedDictionaryWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v3 count]);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v10, (void)v14));
        -[NSMutableDictionary tvs_setObjectIfNotNil:forKey:](v4, "tvs_setObjectIfNotNil:forKey:", v10, v11);
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  id v12 = -[NSMutableDictionary copy](v4, "copy");
  return v12;
}

- (id)_changesDescriptionForNewProvisionedItems:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 differenceFromArray:v7]);
    if (v8) {
      goto LABEL_3;
    }
LABEL_21:
    uint64_t v10 = 0LL;
    goto LABEL_23;
  }

  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 differenceFromArray:v24]);

  if (!v8) {
    goto LABEL_21;
  }
LABEL_3:
  if ([v8 hasChanges])
  {
    id v27 = v7;
    id v28 = v6;
    os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
    v9 = self->_bundleIdentifiersByApplicationIdentifierMapping;
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"("));
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v26 = v8;
    id obj = v8;
    id v11 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v31;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(obj);
          }
          __int128 v15 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
          id v16 = [v15 changeType];
          __int128 v17 = @"?";
          if (v16 == (id)1) {
            __int128 v17 = @"-";
          }
          if (v16) {
            uint64_t v18 = v17;
          }
          else {
            uint64_t v18 = @"+";
          }
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 object]);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v9, "objectForKey:", v19));
          uint64_t v21 = v20;
          if (v20) {
            id v22 = v20;
          }
          else {
            id v22 = (id)objc_claimAutoreleasedReturnValue([v15 object]);
          }
          id v23 = v22;

          -[__CFString appendFormat:]( v10,  "appendFormat:",  @"  %@ %@ [%lu]\n",  v18,  v23,  [v15 index]);
        }

        id v12 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }

      while (v12);
    }

    -[__CFString appendString:](v10, "appendString:", @""));
    id v7 = v27;
    id v6 = v28;
    uint64_t v8 = v26;
  }

  else
  {
    uint64_t v10 = @"()";
  }

+ (id)_provisionedApplicationIdentifiersCacheURL
{
  if (qword_1004710B8 != -1) {
    dispatch_once(&qword_1004710B8, &stru_1003D9760);
  }
  return (id)qword_1004710B0;
}

+ (id)_applicationIdentifiersByBundleIdentifiersMappingCacheURL
{
  if (qword_1004710C8 != -1) {
    dispatch_once(&qword_1004710C8, &stru_1003D9780);
  }
  return (id)qword_1004710C0;
}

+ (id)_disabledApplicationIdentifiersCacheURL
{
  if (qword_1004710D8 != -1) {
    dispatch_once(&qword_1004710D8, &stru_1003D97A0);
  }
  return (id)qword_1004710D0;
}

+ (id)_cachedProvisionedApplicationIdentifiers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _provisionedApplicationIdentifiersCacheURL]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithContentsOfURL:](&OBJC_CLASS___NSArray, "arrayWithContentsOfURL:", v2));

  return v3;
}

+ (id)_cachedApplicationIdentifiersByBundleIdentifiersMapping
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _applicationIdentifiersByBundleIdentifiersMappingCacheURL]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  v2));

  return v3;
}

+ (id)_cachedDisabledApplicationIdentifiers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _disabledApplicationIdentifiersCacheURL]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithContentsOfURL:](&OBJC_CLASS___NSArray, "arrayWithContentsOfURL:", v2));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v3));

  return v4;
}

- (void)setProvisionedApplicationIdentifiers:(id)a3
{
}

- (void)setDisabledApplicationIdentifiers:(id)a3
{
}

- (void)setApplicationIdentifiersByBundleIdentifierMapping:(id)a3
{
}

- (void)setBundleIdentifiersByApplicationIdentifierMapping:(id)a3
{
}

- (PBUnavailableBundleListLoader)loader
{
  return self->_loader;
}

- (void)setLoader:(id)a3
{
}

- (void).cxx_destruct
{
}

@end