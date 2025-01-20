@interface DMDPolicyPersistence
- (BOOL)_loadPersistentStoreIfNeeded:(id *)a3;
- (BOOL)_upsertPolicy:(int64_t)a3 forType:(id)a4 identifier:(id)a5 priority:(unint64_t)a6 organizationIdentifier:(id)a7 declarationIdentifier:(id)a8 policyToUpdate:(id)a9 managedObjectContext:(id)a10;
- (BOOL)alarms;
- (BOOL)isInLegacyDowntimeWithPolicies:(id)a3 priorities:(id)a4;
- (BOOL)isInManagedSettingsDowntime;
- (BOOL)isPersistentContainerLoaded;
- (DMDPolicyPersistence)init;
- (DMDPolicyPersistence)initWithPersistentStoreDescriptions:(id)a3;
- (NSArray)distributedNotificationNames;
- (NSArray)notifyMatchingNotifications;
- (NSCache)bundleIdentifierPolicyCache;
- (NSCache)categoryIdentifierPolicyCache;
- (NSCache)effectivePolicyCache;
- (NSCache)websiteURLsPolicyCache;
- (NSManagedObjectContext)internalContext;
- (NSManagedObjectContext)registrationContext;
- (NSPersistentContainer)persistentContainer;
- (OS_dispatch_queue)emergencyModeQueue;
- (id)_effectivePoliciesForTypes:(id)a3 outError:(id *)a4;
- (id)_effectivePolicyForType:(id)a3 outError:(id *)a4;
- (id)_fetchCategoriesForBundleIdentifiers:(id)a3 withError:(id *)a4;
- (id)_fetchCategoriesIfNeededForWebsiteURLs:(id)a3 withError:(id *)a4;
- (id)_fetchParentBundleIdentifiersForBundleIdentifiers:(id)a3;
- (id)_recalculateEffectivePolicyForType:(id)a3 outError:(id *)a4;
- (void)_appendPolicyForBundleIdentifiers:(id)a3 toPolicies:(id)a4 categories:(id)a5 parentBundleIdentifiers:(id)a6 policiesByType:(id)a7;
- (void)_appendPolicyForCategoryIdentifiers:(id)a3 toPolicies:(id)a4 policiesByType:(id)a5;
- (void)_appendPolicyForWebsiteURLs:(id)a3 toPolicies:(id)a4 categories:(id)a5 policiesByType:(id)a6;
- (void)_clearPolicyCachesForTypes:(id)a3;
- (void)_enableEmergencyModeUntilDate:(id)a3 referenceDate:(id)a4 withCompletionHandler:(id)a5;
- (void)_handleChangesToPolicyTypes:(id)a3;
- (void)_notifyClientsRegisteredForPolicyTypes:(id)a3;
- (void)_performBackgroundTask:(id)a3;
- (void)_performBackgroundTaskAndWait:(id)a3;
- (void)_performRegistrationBackgroundTask:(id)a3;
- (void)_recalculateEffectivePolicyForTypes:(id)a3;
- (void)_removeOrphanedPoliciesFromFetchRequest:(id)a3 managedObjectContext:(id)a4 completionHandler:(id)a5;
- (void)addRegistration:(id)a3 replyHandler:(id)a4;
- (void)disableEmergencyModeWithCompletionHandler:(id)a3;
- (void)emergencyModeStatusWithCompletionHandler:(id)a3;
- (void)enableEmergencyModeForDuration:(double)a3 withCompletionHandler:(id)a4;
- (void)enableEmergencyModeWithCompletionHandler:(id)a3;
- (void)handleAlarmWithIdentifier:(id)a3;
- (void)handleDistributedNotificationWithName:(id)a3 userInfo:(id)a4;
- (void)handleNotifyMatchingNotificationWithName:(id)a3;
- (void)removeEffectivePolicyFromOrganizationIdentifier:(id)a3 declarationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)removeOrphanedPoliciesNotBelongingToExistingDeclarationIdentifiersByOrganizationIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeOrphanedPoliciesNotBelongingToExistingOrganizationIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)requestCommunicationPoliciesForBundleIdentifiers:(id)a3 replyHandler:(id)a4;
- (void)requestPoliciesForBundleIdentifiers:(id)a3 replyHandler:(id)a4;
- (void)requestPoliciesForCategoryIdentifiers:(id)a3 replyHandler:(id)a4;
- (void)requestPoliciesForTypes:(id)a3 replyHandler:(id)a4;
- (void)requestPoliciesForWebsiteURLs:(id)a3 replyHandler:(id)a4;
- (void)setEffectivePolicy:(int64_t)a3 forType:(id)a4 identifiers:(id)a5 priority:(unint64_t)a6 organizationIdentifier:(id)a7 declarationIdentifier:(id)a8 completionHandler:(id)a9;
- (void)setInternalContext:(id)a3;
- (void)setIsPersistentContainerLoaded:(BOOL)a3;
- (void)setRegistrationContext:(id)a3;
@end

@implementation DMDPolicyPersistence

- (DMDPolicyPersistence)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileManager dmd_userEffectivePoliciesDatabaseURL]( &OBJC_CLASS___NSFileManager,  "dmd_userEffectivePoliciesDatabaseURL"));
  v4 = objc_opt_new(&OBJC_CLASS___NSPersistentStoreDescription);
  -[NSPersistentStoreDescription setURL:](v4, "setURL:", v3);
  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  v6 = -[DMDPolicyPersistence initWithPersistentStoreDescriptions:](self, "initWithPersistentStoreDescriptions:", v5);

  return v6;
}

- (DMDPolicyPersistence)initWithPersistentStoreDescriptions:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___DMDPolicyPersistence;
  v5 = -[DMDPolicyPersistence init](&v38, "init");
  if (v5)
  {
    v6 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFPolicyRegistration));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 URLForResource:@"DMDEffectivePolicies" withExtension:@"momd"]);

    v33 = (void *)v8;
    v9 = -[NSManagedObjectModel initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModel),  "initWithContentsOfURL:",  v8);
    v10 = -[NSPersistentContainer initWithName:managedObjectModel:]( objc_alloc(&OBJC_CLASS___NSPersistentContainer),  "initWithName:managedObjectModel:",  @"EffectivePolicies",  v9);
    persistentContainer = v5->_persistentContainer;
    v5->_persistentContainer = v10;

    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v12 = [v4 copy];
    id v13 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v35;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v35 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
          [v17 setShouldAddStoreAsynchronously:0];
          [v17 setOption:NSFileProtectionNone forKey:NSPersistentStoreFileProtectionKey];
        }

        id v14 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }

      while (v14);
    }

    -[NSPersistentContainer setPersistentStoreDescriptions:]( v5->_persistentContainer,  "setPersistentStoreDescriptions:",  v12);
    dispatch_queue_attr_t v18 = dispatch_queue_attr_make_with_autorelease_frequency( &_dispatch_queue_attr_concurrent,  DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v18);
    dispatch_queue_attr_t v20 = dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_UTILITY, 0);
    v21 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v20);

    dispatch_queue_t v22 = dispatch_queue_create("com.apple.dmd.policy.emergency-mode", v21);
    emergencyModeQueue = v5->_emergencyModeQueue;
    v5->_emergencyModeQueue = (OS_dispatch_queue *)v22;

    v24 = objc_alloc_init(&OBJC_CLASS___NSCache);
    effectivePolicyCache = v5->_effectivePolicyCache;
    v5->_effectivePolicyCache = v24;

    v26 = objc_alloc_init(&OBJC_CLASS___NSCache);
    bundleIdentifierPolicyCache = v5->_bundleIdentifierPolicyCache;
    v5->_bundleIdentifierPolicyCache = v26;

    v28 = objc_alloc_init(&OBJC_CLASS___NSCache);
    categoryIdentifierPolicyCache = v5->_categoryIdentifierPolicyCache;
    v5->_categoryIdentifierPolicyCache = v28;

    v30 = objc_alloc_init(&OBJC_CLASS___NSCache);
    websiteURLsPolicyCache = v5->_websiteURLsPolicyCache;
    v5->_websiteURLsPolicyCache = v30;
  }

  return v5;
}

- (BOOL)_loadPersistentStoreIfNeeded:(id *)a3
{
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_100049854;
  v16 = sub_100049864;
  id v17 = 0LL;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence persistentContainer](self, "persistentContainer"));
  objc_sync_enter(v5);
  if (!-[DMDPolicyPersistence isPersistentContainerLoaded](self, "isPersistentContainerLoaded"))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10004986C;
    v9[3] = &unk_10009F098;
    v11 = &v12;
    v9[4] = self;
    id v10 = v5;
    [v10 loadPersistentStoresWithCompletionHandler:v9];
  }

  BOOL v6 = -[DMDPolicyPersistence isPersistentContainerLoaded](self, "isPersistentContainerLoaded");
  objc_sync_exit(v5);

  if (a3) {
    char v7 = v6;
  }
  else {
    char v7 = 1;
  }
  if ((v7 & 1) == 0) {
    *a3 = (id) v13[5];
  }

  _Block_object_dispose(&v12, 8);
  return v6;
}

- (void)_performRegistrationBackgroundTask:(id)a3
{
  id v4 = a3;
  id v11 = 0LL;
  unsigned int v5 = -[DMDPolicyPersistence _loadPersistentStoreIfNeeded:](self, "_loadPersistentStoreIfNeeded:", &v11);
  id v6 = v11;
  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100049C3C;
    v8[3] = &unk_10009F0C0;
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence registrationContext](self, "registrationContext"));
    id v10 = v4;
    id v7 = v9;
    [v7 performBlock:v8];
  }

  else
  {
    (*((void (**)(id, void, id))v4 + 2))(v4, 0LL, v6);
  }
}

- (void)_performBackgroundTask:(id)a3
{
  id v4 = a3;
  id v11 = 0LL;
  unsigned int v5 = -[DMDPolicyPersistence _loadPersistentStoreIfNeeded:](self, "_loadPersistentStoreIfNeeded:", &v11);
  id v6 = v11;
  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100049D30;
    v8[3] = &unk_10009F0C0;
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence internalContext](self, "internalContext"));
    id v10 = v4;
    id v7 = v9;
    [v7 performBlock:v8];
  }

  else
  {
    (*((void (**)(id, void, id))v4 + 2))(v4, 0LL, v6);
  }
}

- (void)_performBackgroundTaskAndWait:(id)a3
{
  id v4 = a3;
  id v11 = 0LL;
  unsigned int v5 = -[DMDPolicyPersistence _loadPersistentStoreIfNeeded:](self, "_loadPersistentStoreIfNeeded:", &v11);
  id v6 = v11;
  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100049E24;
    v8[3] = &unk_10009F0C0;
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence internalContext](self, "internalContext"));
    id v10 = v4;
    id v7 = v9;
    [v7 performBlockAndWait:v8];
  }

  else
  {
    (*((void (**)(id, void, id))v4 + 2))(v4, 0LL, v6);
  }
}

- (void)addRegistration:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100049EE0;
  v9[3] = &unk_10009F0E8;
  id v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  -[DMDPolicyPersistence _performRegistrationBackgroundTask:](self, "_performRegistrationBackgroundTask:", v9);
}

- (void)requestPoliciesForTypes:(id)a3 replyHandler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10004A374;
  v8[3] = &unk_10009F0E8;
  id v9 = a3;
  id v10 = a4;
  void v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  -[DMDPolicyPersistence _performBackgroundTaskAndWait:](self, "_performBackgroundTaskAndWait:", v8);
}

- (id)_effectivePoliciesForTypes:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v6 count]);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)v12);
        id v18 = 0LL;
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[DMDPolicyPersistence _effectivePolicyForType:outError:]( self,  "_effectivePolicyForType:outError:",  v13,  &v18));
        id v15 = v18;
        -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v14, v13);

        if (v15)
        {

          if (a4)
          {
            id v15 = v15;
            id v16 = 0LL;
            *a4 = v15;
          }

          else
          {
            id v16 = 0LL;
          }

          goto LABEL_13;
        }

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v16 = -[NSMutableDictionary copy](v7, "copy");
  id v15 = 0LL;
LABEL_13:

  return v16;
}

- (id)_effectivePolicyForType:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence effectivePolicyCache](self, "effectivePolicyCache"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v6]);
  id v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_claimAutoreleasedReturnValue( -[DMDPolicyPersistence _recalculateEffectivePolicyForType:outError:]( self,  "_recalculateEffectivePolicyForType:outError:",  v6,  a4));
  }
  uint64_t v11 = v10;

  return v11;
}

- (id)_recalculateEffectivePolicyForType:(id)a3 outError:(id *)a4
{
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  v32 = sub_100049854;
  v33 = sub_100049864;
  id v34 = 0LL;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = sub_100049854;
  v27 = sub_100049864;
  id v28 = 0LL;
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_10004A88C;
  id v18 = &unk_10009F110;
  __int128 v21 = &v23;
  id v6 = a3;
  id v19 = v6;
  __int128 v20 = self;
  __int128 v22 = &v29;
  id v7 = -[DMDPolicyPersistence _performBackgroundTaskAndWait:](self, "_performBackgroundTaskAndWait:", &v15);
  if (v24[5])
  {
    uint64_t v10 = DMFPolicyLog(v7, v8, v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v24[5], "verboseDescription", v15, v16, v17, v18));
      sub_100065F4C((uint64_t)v6, v12, buf, v11);
    }

    if (a4) {
      *a4 = (id) v24[5];
    }
  }

  id v13 = (id)v30[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v13;
}

- (BOOL)isInLegacyDowntimeWithPolicies:(id)a3 priorities:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue( +[DMFEffectivePolicy downtimeCategoryIdentifiers]( &OBJC_CLASS___DMFEffectivePolicy,  "downtimeCategoryIdentifiers"));
  id v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v11]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v11]);
        id v14 = [v12 integerValue];
        id v15 = [v13 integerValue];
        id v16 = (id)DMFHighestPolicyPriority;

        if (v14) {
          BOOL v17 = 1;
        }
        else {
          BOOL v17 = v15 == v16;
        }
        if (!v17)
        {
          BOOL v18 = 0;
          goto LABEL_14;
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v8);
  }

  BOOL v18 = 1;
LABEL_14:

  return v18;
}

- (BOOL)isInManagedSettingsDowntime
{
  return 0;
}

- (void)requestPoliciesForBundleIdentifiers:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10004B040;
  v9[3] = &unk_10009F0E8;
  uint64_t v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  -[DMDPolicyPersistence _performBackgroundTaskAndWait:](self, "_performBackgroundTaskAndWait:", v9);
}

- (void)_appendPolicyForBundleIdentifiers:(id)a3 toPolicies:(id)a4 categories:(id)a5 parentBundleIdentifiers:(id)a6 policiesByType:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v90 = a6;
  id v15 = a7;
  v89 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:DMFEffectivePolicyTypeApplication]);
  v88 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:DMFEffectivePolicyTypeApplicationCategory]);
  v87 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:DMFEffectivePolicyTypeCategory]);
  v82 = v15;
  v86 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:DMFEffectivePolicyTypeWeb]);
  v83 = (void *)objc_claimAutoreleasedReturnValue( +[DMFEffectivePolicy unblockableCategoryIdentifiers]( &OBJC_CLASS___DMFEffectivePolicy,  "unblockableCategoryIdentifiers"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[DMFEffectivePolicy unblockableBundleIdentifiers]( &OBJC_CLASS___DMFEffectivePolicy,  "unblockableBundleIdentifiers"));
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  __int128 v109 = 0u;
  __int128 v110 = 0u;
  id v17 = v12;
  id v18 = [v17 countByEnumeratingWithState:&v107 objects:v122 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v108;
    uint64_t v92 = *(void *)v108;
    v94 = self;
    v95 = v13;
    v84 = v16;
    id v85 = v17;
    do
    {
      uint64_t v21 = 0LL;
      id v91 = v19;
      do
      {
        if (*(void *)v108 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v101 = v21;
        uint64_t v22 = *(void *)(*((void *)&v107 + 1) + 8 * v21);
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v22]);
        v100 = v23;
        if (v23)
        {
          v26 = v23;
          log = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 identifier]);
          v99 = (void *)objc_claimAutoreleasedReturnValue([v26 webDomains]);
          v27 = (void *)objc_claimAutoreleasedReturnValue([v26 equivalentBundleIdentifiers]);
          id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v22));
          if ([v27 count]) {
            [v28 addObjectsFromArray:v27];
          }
          v98 = v28;
          id v29 = [v16 containsObject:v22];
          v97 = v27;
          if ((_DWORD)v29)
          {
            uint64_t v32 = DMFPolicyLog(v29, v30, v31);
            v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v112 = v22;
              _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Requested application %{public}@ is unblockable",  buf,  0xCu);
            }

            id v34 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence bundleIdentifierPolicyCache](self, "bundleIdentifierPolicyCache"));
            [v34 setObject:&off_1000A6048 forKey:v22];

            [v13 setObject:&off_1000A6048 forKeyedSubscript:v22];
          }

          else if (log && (id v36 = objc_msgSend(v83, "containsObject:"), (_DWORD)v36))
          {
            uint64_t v39 = DMFPolicyLog(v36, v37, v38);
            v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v112 = v22;
              __int16 v113 = 2114;
              v114 = log;
              _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Requested application %{public}@ with associated category %{public}@ is unblockable",  buf,  0x16u);
            }

            v41 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence bundleIdentifierPolicyCache](self, "bundleIdentifierPolicyCache"));
            [v41 setObject:&off_1000A6048 forKey:v22];

            [v13 setObject:&off_1000A6048 forKeyedSubscript:v22];
            uint64_t v20 = v92;
          }

          else
          {
            v42 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
            v96 = (void *)objc_claimAutoreleasedReturnValue([v90 objectForKeyedSubscript:v22]);
            id v43 = [v96 count];
            if (v43)
            {
              uint64_t v46 = DMFPolicyLog(v43, v44, v45);
              v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                v48 = (void *)objc_claimAutoreleasedReturnValue([v96 allObjects]);
                v49 = (os_log_s *)objc_claimAutoreleasedReturnValue([v48 componentsJoinedByString:@","]);
                *(_DWORD *)buf = 138543618;
                uint64_t v112 = v22;
                __int16 v113 = 2114;
                v114 = v49;
                _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Requested application %{public}@ has parent applications %{public}@",  buf,  0x16u);
              }

              __int128 v105 = 0u;
              __int128 v106 = 0u;
              __int128 v103 = 0u;
              __int128 v104 = 0u;
              id v50 = v96;
              id v51 = [v50 countByEnumeratingWithState:&v103 objects:v121 count:16];
              if (v51)
              {
                id v52 = v51;
                uint64_t v53 = *(void *)v104;
                do
                {
                  for (i = 0LL; i != v52; i = (char *)i + 1)
                  {
                    if (*(void *)v104 != v53) {
                      objc_enumerationMutation(v50);
                    }
                    v55 = *(os_log_s **)(*((void *)&v103 + 1) + 8LL * (void)i);
                    v56 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v55]);
                    v59 = v56;
                    if (v56)
                    {
                      v60 = (os_log_s *)objc_claimAutoreleasedReturnValue([v56 identifier]);
                      -[NSMutableArray addObject:](v42, "addObject:", v60);
                    }

                    else
                    {
                      uint64_t v61 = DMFPolicyLog(0LL, v57, v58);
                      v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
                      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543618;
                        uint64_t v112 = v22;
                        __int16 v113 = 2114;
                        v114 = v55;
                        _os_log_error_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_ERROR,  "Requested application %{public}@ failed to categorize parent application %{public}@",  buf,  0x16u);
                      }
                    }
                  }

                  id v52 = [v50 countByEnumeratingWithState:&v103 objects:v121 count:16];
                }

                while (v52);
              }

              uint64_t v20 = v92;
            }

            if (log) {
              v62 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableArray arrayByAddingObject:](v42, "arrayByAddingObject:"));
            }
            else {
              v62 = v42;
            }
            v63 = v62;
            v64 = (void *)objc_claimAutoreleasedReturnValue([v98 allObjects]);
            v65 = v63;
            uint64_t v66 = objc_claimAutoreleasedReturnValue( +[DMFPrioritizedPolicy prioritizedPoliciesForAppPolicy:appCategoryPolicy:bundleIdentifiers:categoryPolicy:categoryIdentifiers:webPolicy:webCategoryPolicy:webDomains:]( &OBJC_CLASS___DMFPrioritizedPolicy,  "prioritizedPoliciesForAppPolicy:appCategoryPolicy:bundleIdentifiers:categoryPolicy:categoryIdentif iers:webPolicy:webCategoryPolicy:webDomains:",  v89,  v88,  v64,  v87,  v63,  v86,  0LL,  v99));

            v93 = (void *)v66;
            id v67 = +[DMFPrioritizedPolicy arbitratePolicyForPrioritizedPolicies:]( &OBJC_CLASS___DMFPrioritizedPolicy,  "arbitratePolicyForPrioritizedPolicies:",  v66);
            v68 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence bundleIdentifierPolicyCache](v94, "bundleIdentifierPolicyCache"));
            v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v67));
            [v68 setObject:v69 forKey:v22];

            v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v67));
            [v95 setObject:v70 forKeyedSubscript:v22];

            uint64_t v74 = DMFPolicyLog(v71, v72, v73);
            v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v76 = DMFPolicyUnlocalizedDisplayName(v67);
              v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
              v78 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v65, "componentsJoinedByString:", @","));
              v79 = (void *)objc_claimAutoreleasedReturnValue([v99 componentsJoinedByString:@","]);
              v80 = (void *)objc_claimAutoreleasedReturnValue([v98 allObjects]);
              v81 = (void *)objc_claimAutoreleasedReturnValue([v80 componentsJoinedByString:@","]);
              *(_DWORD *)buf = 138544386;
              uint64_t v112 = v22;
              __int16 v113 = 2114;
              v114 = v77;
              __int16 v115 = 2114;
              v116 = v78;
              __int16 v117 = 2114;
              v118 = v79;
              __int16 v119 = 2114;
              v120 = v81;
              _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_DEFAULT,  "Requested application %{public}@ has policy %{public}@, associated categories:%{public}@ associated site s:%{public}@ equivalent bundle identifiers:%{public}@",  buf,  0x34u);

              uint64_t v20 = v92;
            }

            id v16 = v84;
            id v17 = v85;
            id v19 = v91;
            v27 = v97;
            self = v94;
            id v13 = v95;
          }
        }

        else
        {
          uint64_t v35 = DMFPolicyLog(0LL, v24, v25);
          log = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v112 = v22;
            _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Requested application %{public}@ is missing categorization",  buf,  0xCu);
          }
        }

        uint64_t v21 = v101 + 1;
      }

      while ((id)(v101 + 1) != v19);
      id v19 = [v17 countByEnumeratingWithState:&v107 objects:v122 count:16];
    }

    while (v19);
  }
}

- (id)_fetchParentBundleIdentifiersForBundleIdentifiers:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [a3 count]));
  id v4 = [v3 copy];

  return v4;
}

- (void)requestCommunicationPoliciesForBundleIdentifiers:(id)a3 replyHandler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10004BF70;
  v8[3] = &unk_10009F0E8;
  id v9 = a3;
  id v10 = a4;
  void v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  -[DMDPolicyPersistence _performBackgroundTaskAndWait:](self, "_performBackgroundTaskAndWait:", v8);
}

- (void)requestPoliciesForCategoryIdentifiers:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10004C3F8;
  v9[3] = &unk_10009F0E8;
  uint64_t v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  -[DMDPolicyPersistence _performBackgroundTaskAndWait:](self, "_performBackgroundTaskAndWait:", v9);
}

- (void)_appendPolicyForCategoryIdentifiers:(id)a3 toPolicies:(id)a4 policiesByType:(id)a5
{
  id v8 = a3;
  id v45 = a4;
  id v9 = a5;
  id v43 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:DMFEffectivePolicyTypeApplicationCategory]);
  v42 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:DMFEffectivePolicyTypeCategory]);
  uint64_t v39 = v9;
  v41 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:DMFEffectivePolicyTypeWebCategory]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[DMFEffectivePolicy unblockableCategoryIdentifiers]( &OBJC_CLASS___DMFEffectivePolicy,  "unblockableCategoryIdentifiers"));
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v47;
    uint64_t v40 = *(void *)v47;
    do
    {
      id v15 = 0LL;
      id v44 = v13;
      do
      {
        if (*(void *)v47 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)v15);
        id v17 = [v10 containsObject:v16];
        if ((_DWORD)v17)
        {
          uint64_t v20 = DMFPolicyLog(v17, v18, v19);
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v51 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Requested category %{public}@ is unblockable",  buf,  0xCu);
          }

          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence categoryIdentifierPolicyCache](self, "categoryIdentifierPolicyCache"));
          [v22 setObject:&off_1000A6048 forKey:v16];

          [v45 setObject:&off_1000A6048 forKeyedSubscript:v16];
        }

        else
        {
          __int128 v23 = v10;
          id v24 = v11;
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v11 allObjects]);
          v26 = (void *)objc_claimAutoreleasedReturnValue( +[DMFPrioritizedPolicy prioritizedPoliciesForAppPolicy:appCategoryPolicy:bundleIdentifiers:categoryPolicy:categoryIdentifiers:webPolicy:webCategoryPolicy:webDomains:]( &OBJC_CLASS___DMFPrioritizedPolicy,  "prioritizedPoliciesForAppPolicy:appCategoryPolicy:bundleIdentifiers:categoryPolicy:categoryI dentifiers:webPolicy:webCategoryPolicy:webDomains:",  0LL,  v43,  0LL,  v42,  v25,  0LL,  v41,  0LL));

          id v27 = +[DMFPrioritizedPolicy arbitratePolicyForPrioritizedPolicies:]( &OBJC_CLASS___DMFPrioritizedPolicy,  "arbitratePolicyForPrioritizedPolicies:",  v26);
          id v28 = self;
          id v29 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence categoryIdentifierPolicyCache](self, "categoryIdentifierPolicyCache"));
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v27));
          [v29 setObject:v30 forKey:v16];

          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v27));
          [v45 setObject:v31 forKeyedSubscript:v16];

          uint64_t v35 = DMFPolicyLog(v32, v33, v34);
          id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v37 = DMFPolicyUnlocalizedDisplayName(v27);
            uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
            *(_DWORD *)buf = 138543618;
            uint64_t v51 = v16;
            __int16 v52 = 2114;
            uint64_t v53 = v38;
            _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Requested category %{public}@ has policy %{public}@",  buf,  0x16u);
          }

          self = v28;
          id v11 = v24;
          id v10 = v23;
          uint64_t v14 = v40;
          id v13 = v44;
        }

        id v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }

    while (v13);
  }
}

- (void)requestPoliciesForWebsiteURLs:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10004CC84;
  v9[3] = &unk_10009F0E8;
  id v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  -[DMDPolicyPersistence _performBackgroundTaskAndWait:](self, "_performBackgroundTaskAndWait:", v9);
}

- (void)_appendPolicyForWebsiteURLs:(id)a3 toPolicies:(id)a4 categories:(id)a5 policiesByType:(id)a6
{
  id v9 = a3;
  id v78 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:DMFEffectivePolicyTypeApplication]);
  uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:DMFEffectivePolicyTypeCategory]);
  v70 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:DMFEffectivePolicyTypeWeb]);
  v63 = v11;
  v69 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:DMFEffectivePolicyTypeWebCategory]);
  uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue( +[DMFEffectivePolicy unblockableBundleIdentifiers]( &OBJC_CLASS___DMFEffectivePolicy,  "unblockableBundleIdentifiers"));
  v64 = (void *)objc_claimAutoreleasedReturnValue( +[DMFEffectivePolicy unblockableCategoryIdentifiers]( &OBJC_CLASS___DMFEffectivePolicy,  "unblockableCategoryIdentifiers"));
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  id obj = v9;
  id v79 = [obj countByEnumeratingWithState:&v85 objects:v102 count:16];
  if (v79)
  {
    uint64_t v77 = *(void *)v86;
    id v12 = &OBJC_CLASS___NSISO8601DateFormatter_ptr;
    id v68 = v10;
    do
    {
      for (i = 0LL; i != v79; i = (char *)i + 1)
      {
        if (*(void *)v86 != v77) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v85 + 1) + 8LL * (void)i);
        id v15 = v10;
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v14]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleIdentifier]);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 webDomains]);
        v84 = (void *)objc_claimAutoreleasedReturnValue([v16 equivalentBundleIdentifiers]);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v14 host]);
        if (v22)
        {
          v80 = v22;
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v12[4] setWithObject:v22]);
          if ([v19 count]) {
            [v23 addObjectsFromArray:v19];
          }
          id v24 = (void *)objc_opt_new(v12[4]);
          uint64_t v25 = v24;
          if (v18) {
            [v24 addObject:v18];
          }
          v83 = v18;
          v26 = v25;
          if ([v84 count]) {
            [v25 addObjectsFromArray:v84];
          }
          v81 = v19;
          v82 = v23;
          if (v83)
          {
            id v27 = objc_msgSend(v73, "containsObject:");
            if ((_DWORD)v27)
            {
              uint64_t v30 = v17;
              uint64_t v31 = DMFPolicyLog(v27, v28, v29);
              uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                id v90 = v83;
                _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Requested website with associated bundle identifier %{public}@ is unblockable",  buf,  0xCu);
              }

              uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence websiteURLsPolicyCache](self, "websiteURLsPolicyCache"));
              uint64_t v34 = v33;
              goto LABEL_23;
            }
          }

          if (v17)
          {
            id v35 = [v64 containsObject:v17];
            if ((_DWORD)v35)
            {
              uint64_t v38 = DMFPolicyLog(v35, v36, v37);
              uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                id v90 = v17;
                _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Requested website with associated category %{public}@ is unblockable",  buf,  0xCu);
              }

              uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence websiteURLsPolicyCache](self, "websiteURLsPolicyCache"));
              uint64_t v34 = v33;
              uint64_t v30 = v17;
LABEL_23:
              [v33 setObject:&off_1000A6048 forKey:v14];

              [v78 setObject:&off_1000A6048 forKeyedSubscript:v14];
              id v12 = &OBJC_CLASS___NSISO8601DateFormatter_ptr;
              id v17 = v30;
              id v10 = v15;
              uint64_t v40 = v25;
LABEL_32:
              uint64_t v22 = v80;
              uint64_t v18 = v83;

              uint64_t v19 = v81;
              goto LABEL_33;
            }

            v75 = v17;
            v99 = v17;
            id v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v99,  1LL));
          }

          else
          {
            v75 = 0LL;
            id v44 = 0LL;
          }

          uint64_t v40 = v26;
          id v45 = (void *)objc_claimAutoreleasedReturnValue([v26 allObjects]);
          __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v82 allObjects]);
          __int128 v47 = (void *)objc_claimAutoreleasedReturnValue( +[DMFPrioritizedPolicy prioritizedPoliciesForAppPolicy:appCategoryPolicy:bundleIdentifiers:categoryPolicy:categoryIdentifiers:webPolicy:webCategoryPolicy:webDomains:]( &OBJC_CLASS___DMFPrioritizedPolicy,  "prioritizedPoliciesForAppPolicy:appCategoryPolicy:bundleIdentifiers:categoryPolicy:categoryI dentifiers:webPolicy:webCategoryPolicy:webDomains:",  v72,  0LL,  v45,  v71,  v44,  v70,  v69,  v46));

          id v48 = +[DMFPrioritizedPolicy arbitratePolicyForPrioritizedPolicies:]( &OBJC_CLASS___DMFPrioritizedPolicy,  "arbitratePolicyForPrioritizedPolicies:",  v47);
          __int128 v49 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence websiteURLsPolicyCache](self, "websiteURLsPolicyCache"));
          id v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v48));
          [v49 setObject:v50 forKey:v14];

          uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v48));
          [v78 setObject:v51 forKeyedSubscript:v14];

          uint64_t v55 = DMFPolicyLog(v52, v53, v54);
          v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v57 = DMFPolicyUnlocalizedDisplayName(v48);
            id v67 = v47;
            uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
            uint64_t v66 = v44;
            v59 = (void *)objc_claimAutoreleasedReturnValue([v44 componentsJoinedByString:@","]);
            v65 = (void *)objc_claimAutoreleasedReturnValue([v82 allObjects]);
            v60 = (void *)objc_claimAutoreleasedReturnValue([v65 componentsJoinedByString:@","]);
            uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue([v40 allObjects]);
            v62 = (void *)objc_claimAutoreleasedReturnValue([v61 componentsJoinedByString:@","]);
            *(_DWORD *)buf = 138544386;
            id v90 = v14;
            __int16 v91 = 2114;
            uint64_t v92 = v58;
            __int16 v93 = 2114;
            v94 = v59;
            __int16 v95 = 2114;
            v96 = v60;
            __int16 v97 = 2114;
            v98 = v62;
            _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "Requested website %{public}@ has policy %{public}@, associated categories:%{public}@ associated sites:%{pu blic}@ equivalent bundle identifiers:%{public}@",  buf,  0x34u);

            id v44 = v66;
            __int128 v47 = v67;
          }

          id v10 = v68;
          id v17 = v75;
          id v12 = &OBJC_CLASS___NSISO8601DateFormatter_ptr;
          goto LABEL_32;
        }

        v41 = v12;
        uint64_t v42 = DMFPolicyLog(0LL, v20, v21);
        id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          sub_1000660F0(v100, &v101, v43);
        }

        [v78 setObject:&off_1000A6048 forKeyedSubscript:v14];
        id v12 = v41;
        id v10 = v15;
LABEL_33:
      }

      id v79 = [obj countByEnumeratingWithState:&v85 objects:v102 count:16];
    }

    while (v79);
  }
}

- (id)_fetchCategoriesForBundleIdentifiers:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  id v6 = -[NSConditionLock initWithCondition:](objc_alloc(&OBJC_CLASS___NSConditionLock), "initWithCondition:", 0LL);
  uint64_t v34 = 0LL;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  uint64_t v37 = sub_100049854;
  uint64_t v38 = sub_100049864;
  id v39 = 0LL;
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = sub_100049854;
  uint64_t v32 = sub_100049864;
  id v33 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CTCategories sharedCategories](&OBJC_CLASS___CTCategories, "sharedCategories"));
  uint64_t v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472LL;
  uint64_t v22 = sub_10004DA60;
  __int128 v23 = &unk_10009F138;
  uint64_t v25 = &v34;
  v26 = &v28;
  id v8 = v6;
  id v24 = v8;
  uint64_t v27 = 1LL;
  [v7 categoriesForBundleIDs:v5 completionHandler:&v20];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  5.0,  v20,  v21,  v22,  v23));
  unsigned __int8 v10 = -[NSConditionLock lockWhenCondition:beforeDate:](v8, "lockWhenCondition:beforeDate:", 1LL, v9);

  if ((v10 & 1) != 0)
  {
    -[NSConditionLock unlock](v8, "unlock");
    if (a4)
    {
      uint64_t v14 = (void *)v35[5];
      if (v14) {
        *a4 = v14;
      }
    }

    id v15 = (id)v29[5];
  }

  else
  {
    uint64_t v16 = DMFPolicyLog(v11, v12, v13);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100066164();
    }

    if (a4)
    {
      uint64_t v18 = DMFErrorWithCodeAndUserInfo(801LL, 0LL);
      id v15 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v18);
    }

    else
    {
      id v15 = 0LL;
    }
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v15;
}

- (id)_fetchCategoriesIfNeededForWebsiteURLs:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  id v6 = -[NSConditionLock initWithCondition:](objc_alloc(&OBJC_CLASS___NSConditionLock), "initWithCondition:", 0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CTCategories sharedCategories](&OBJC_CLASS___CTCategories, "sharedCategories"));
  if (v7)
  {
    uint64_t v34 = 0LL;
    id v35 = &v34;
    uint64_t v36 = 0x3032000000LL;
    uint64_t v37 = sub_100049854;
    uint64_t v38 = sub_100049864;
    id v39 = 0LL;
    uint64_t v28 = 0LL;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x3032000000LL;
    uint64_t v31 = sub_100049854;
    uint64_t v32 = sub_100049864;
    id v33 = 0LL;
    uint64_t v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472LL;
    uint64_t v22 = sub_10004DD28;
    __int128 v23 = &unk_10009F138;
    uint64_t v25 = &v34;
    v26 = &v28;
    id v8 = v6;
    id v24 = v8;
    uint64_t v27 = 1LL;
    [v7 categoriesForDomainURLs:v5 completionHandler:&v20];
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  5.0,  v20,  v21,  v22,  v23));
    unsigned __int8 v10 = -[NSConditionLock lockWhenCondition:beforeDate:](v8, "lockWhenCondition:beforeDate:", 1LL, v9);

    if ((v10 & 1) != 0)
    {
      -[NSConditionLock unlock](v8, "unlock");
      if (a4)
      {
        uint64_t v14 = (void *)v35[5];
        if (v14) {
          *a4 = v14;
        }
      }

      id v15 = (id)v29[5];
    }

    else
    {
      uint64_t v16 = DMFPolicyLog(v11, v12, v13);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100066164();
      }

      if (a4)
      {
        uint64_t v18 = DMFErrorWithCodeAndUserInfo(801LL, 0LL);
        id v15 = 0LL;
        *a4 = (id)objc_claimAutoreleasedReturnValue(v18);
      }

      else
      {
        id v15 = 0LL;
      }
    }

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v34, 8);
  }

  else
  {
    id v15 = &__NSDictionary0__struct;
  }

  return v15;
}

- (void)setEffectivePolicy:(int64_t)a3 forType:(id)a4 identifiers:(id)a5 priority:(unint64_t)a6 organizationIdentifier:(id)a7 declarationIdentifier:(id)a8 completionHandler:(id)a9
{
  id v15 = a4;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10004DEEC;
  v21[3] = &unk_10009F160;
  id v22 = a5;
  id v23 = a7;
  id v24 = a8;
  uint64_t v25 = self;
  id v26 = v15;
  id v27 = a9;
  int64_t v28 = a3;
  unint64_t v29 = a6;
  id v16 = v15;
  id v17 = v24;
  id v18 = v23;
  id v19 = v22;
  id v20 = v27;
  -[DMDPolicyPersistence _performBackgroundTask:](self, "_performBackgroundTask:", v21);
}

- (BOOL)_upsertPolicy:(int64_t)a3 forType:(id)a4 identifier:(id)a5 priority:(unint64_t)a6 organizationIdentifier:(id)a7 declarationIdentifier:(id)a8 policyToUpdate:(id)a9 managedObjectContext:(id)a10
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = (DMDEffectivePolicy *)a9;
  id v20 = a10;
  if (v19)
  {
    BOOL v21 = -[DMDEffectivePolicy policy](v19, "policy") != (id)a3;
    id v22 = -[DMDEffectivePolicy setPolicy:](v19, "setPolicy:", a3);
    uint64_t v25 = DMFPolicyLog(v22, v23, v24);
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 138543874;
      id v33 = v19;
      __int16 v34 = 2114;
      id v35 = v15;
      __int16 v36 = 2114;
      id v37 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Updating existing policy %{public}@ of type %{public}@ identifier %{public}@",  (uint8_t *)&v32,  0x20u);
    }
  }

  else
  {
    id v19 = -[DMDEffectivePolicy initWithContext:](objc_alloc(&OBJC_CLASS___DMDEffectivePolicy), "initWithContext:", v20);
    -[DMDEffectivePolicy setType:](v19, "setType:", v15);
    -[DMDEffectivePolicy setIdentifier:](v19, "setIdentifier:", v16);
    -[DMDEffectivePolicy setOrganizationIdentifier:](v19, "setOrganizationIdentifier:", v17);
    -[DMDEffectivePolicy setDeclarationIdentifier:](v19, "setDeclarationIdentifier:", v18);
    -[DMDEffectivePolicy setPriority:](v19, "setPriority:", a6);
    id v27 = -[DMDEffectivePolicy setPolicy:](v19, "setPolicy:", a3);
    uint64_t v30 = DMFPolicyLog(v27, v28, v29);
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 138543618;
      id v33 = v19;
      __int16 v34 = 2114;
      id v35 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Adding new policy %{public}@ of type %{public}@",  (uint8_t *)&v32,  0x16u);
    }

    BOOL v21 = 1;
  }

  return v21;
}

- (void)removeEffectivePolicyFromOrganizationIdentifier:(id)a3 declarationIdentifier:(id)a4 completionHandler:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10004E758;
  v11[3] = &unk_10009F188;
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  id v15 = a5;
  id v8 = v13;
  id v9 = v12;
  id v10 = v15;
  -[DMDPolicyPersistence _performBackgroundTask:](self, "_performBackgroundTask:", v11);
}

- (void)removeOrphanedPoliciesNotBelongingToExistingOrganizationIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10004EC54;
  v9[3] = &unk_10009F0E8;
  uint64_t v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  -[DMDPolicyPersistence _performBackgroundTask:](self, "_performBackgroundTask:", v9);
}

- (void)removeOrphanedPoliciesNotBelongingToExistingDeclarationIdentifiersByOrganizationIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10004EDC4;
  v9[3] = &unk_10009F0E8;
  uint64_t v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  -[DMDPolicyPersistence _performBackgroundTask:](self, "_performBackgroundTask:", v9);
}

- (void)_removeOrphanedPoliciesFromFetchRequest:(id)a3 managedObjectContext:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  id v61 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a3 execute:&v61]);
  id v11 = v61;
  id v14 = v11;
  if (v10)
  {
    if ([v10 count])
    {
      uint64_t v51 = self;
      uint64_t v54 = v9;
      uint64_t v55 = v14;
      id v15 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v10 count]);
      id v16 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v10 count]);
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      uint64_t v53 = v10;
      id v17 = v10;
      id v18 = [v17 countByEnumeratingWithState:&v57 objects:v68 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v58;
        do
        {
          for (i = 0LL; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v58 != v20) {
              objc_enumerationMutation(v17);
            }
            id v22 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)i);
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "type", v51));
            -[NSMutableSet addObject:](v16, "addObject:", v23);

            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v22 declarationIdentifier]);
            -[NSMutableArray addObject:](v15, "addObject:", v24);
            id v25 = [v8 deleteObject:v22];
            uint64_t v28 = DMFPolicyLog(v25, v26, v27);
            uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v22 organizationIdentifier]);
              *(_DWORD *)buf = 138543618;
              v63 = v24;
              __int16 v64 = 2114;
              v65 = v30;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Removing orphaned policy %{public}@ in organization %{public}@",  buf,  0x16u);
            }
          }

          id v19 = [v17 countByEnumeratingWithState:&v57 objects:v68 count:16];
        }

        while (v19);
      }

      if ([v8 hasChanges])
      {
        id v56 = v55;
        unsigned int v31 = [v8 save:&v56];
        id v14 = v56;

        if (!v31)
        {
          uint64_t v35 = DMFPolicyLog(v32, v33, v34);
          __int16 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v16, "allObjects"));
            id v48 = (void *)objc_claimAutoreleasedReturnValue([v47 componentsJoinedByString:@","]);
            __int128 v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v15, "componentsJoinedByString:", @","));
            id v50 = (void *)objc_claimAutoreleasedReturnValue([v14 verboseDescription]);
            *(_DWORD *)buf = 138543874;
            v63 = v48;
            __int16 v64 = 2114;
            v65 = v49;
            __int16 v66 = 2114;
            id v67 = v50;
            _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "Could not remove orphaned policies types %{public}@ for declarations %{public}@: %{public}@",  buf,  0x20u);
          }

          id v37 = 0LL;
          id v10 = v53;
          id v9 = v54;
LABEL_27:

          ((void (**)(id, NSMutableArray *))v9)[2](v9, v37);
          goto LABEL_28;
        }
      }

      else
      {
        id v14 = v55;
      }

      id v40 = objc_msgSend(v17, "count", v51);
      if (v40) {
        id v40 = [v52 _handleChangesToPolicyTypes:v16];
      }
      uint64_t v43 = DMFPolicyLog(v40, v41, v42);
      __int16 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      id v10 = v53;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        id v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v16, "allObjects"));
        id v45 = (void *)objc_claimAutoreleasedReturnValue([v44 componentsJoinedByString:@","]);
        __int128 v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v15, "componentsJoinedByString:", @","));
        *(_DWORD *)buf = 138543618;
        v63 = v45;
        __int16 v64 = 2114;
        v65 = v46;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Successfully removed orphaned policy types %{public}@ for declarations %{public}@",  buf,  0x16u);
      }

      id v37 = v15;
      id v9 = v54;
      goto LABEL_27;
    }

    ((void (**)(id, void *))v9)[2](v9, &__NSArray0__struct);
  }

  else
  {
    uint64_t v38 = DMFPolicyLog(v11, v12, v13);
    id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_100066280(v14);
    }

    v9[2](v9, 0LL);
  }

- (void)_handleChangesToPolicyTypes:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004F490;
  v4[3] = &unk_10009F1D8;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[DMDPolicyPersistence _performBackgroundTaskAndWait:](v5, "_performBackgroundTaskAndWait:", v4);
}

- (void)_recalculateEffectivePolicyForTypes:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10004F53C;
  v5[3] = &unk_10009F1D8;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  -[DMDPolicyPersistence _performBackgroundTaskAndWait:](self, "_performBackgroundTaskAndWait:", v5);
}

- (void)_clearPolicyCachesForTypes:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10004F744;
  v5[3] = &unk_10009F1D8;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  -[DMDPolicyPersistence _performBackgroundTaskAndWait:](self, "_performBackgroundTaskAndWait:", v5);
}

- (void)_notifyClientsRegisteredForPolicyTypes:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPolicyRegistration fetchRequest](&OBJC_CLASS___DMDPolicyRegistration, "fetchRequest"));
  id v41 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 execute:&v41]);
  id v6 = v41;
  id v9 = v6;
  if (v5)
  {
    id v31 = v6;
    uint64_t v32 = v4;
    id v10 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    id v11 = v5;
    id v12 = [v11 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v38;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
          id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "policyTypes", v31, v32));
          unsigned int v18 = [v17 intersectsSet:v3];

          if (v18)
          {
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
            -[NSMutableSet addObject:](v10, "addObject:", v19);
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }

      while (v13);
    }

    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    uint64_t v20 = v10;
    id v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v33,  v44,  16LL);
    if (v21)
    {
      id v24 = v21;
      uint64_t v25 = *(void *)v34;
      do
      {
        uint64_t v26 = 0LL;
        do
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v20);
          }
          uint64_t v27 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)v26);
          uint64_t v28 = DMFPolicyLog(v21, v22, v23);
          uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v43 = v27;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Posting notification for registration %{public}@",  buf,  0xCu);
          }

          id v21 = (id) notify_post((const char *)[v27 UTF8String]);
          uint64_t v26 = (char *)v26 + 1;
        }

        while (v24 != v26);
        id v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v33,  v44,  16LL);
        id v24 = v21;
      }

      while (v21);
    }

    id v9 = v31;
    id v4 = v32;
  }

  else
  {
    uint64_t v30 = DMFPolicyLog(v6, v7, v8);
    uint64_t v20 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR)) {
      sub_100066384(v9);
    }
  }
}

- (void)enableEmergencyModeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence emergencyModeQueue](self, "emergencyModeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004FC80;
  block[3] = &unk_10009E3A0;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)enableEmergencyModeForDuration:(double)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence emergencyModeQueue](self, "emergencyModeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004FDB4;
  block[3] = &unk_10009F200;
  double v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (void)_enableEmergencyModeUntilDate:(id)a3 referenceDate:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t))a5;
  double v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence emergencyModeQueue](self, "emergencyModeQueue"));
  dispatch_assert_queue_V2(v11);

  if (!v8 || (id v12 = [v9 compare:v8], v12 != (id)-1))
  {
    uint64_t v13 = DMFEmergencyModeLog(v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000663FC();
    }
LABEL_5:

    uint64_t v15 = DMFErrorWithCodeAndUserInfo(3903LL, 0LL);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    xpc_object_t v17 = (xpc_object_t)v16;
    goto LABEL_6;
  }

  id v18 = [v8 timeIntervalSince1970];
  int64_t v20 = (uint64_t)(v19 * 1000000000.0);
  if (v20 <= 0)
  {
    uint64_t v24 = DMFEmergencyModeLog(v18);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100066460();
    }
    goto LABEL_5;
  }

  xpc_object_t v17 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v17, (const char *)[@"ShouldWake" UTF8String], 0);
  xpc_dictionary_set_date(v17, (const char *)[@"Date" UTF8String], v20);
  xpc_set_event( [@"com.apple.alarm" UTF8String],  objc_msgSend(@"com.apple.dmd.emergency-mode.alarm", "UTF8String"),  v17);
  uint64_t v21 = notify_post((const char *)[DMFEmergencyModeChangedNotification UTF8String]);
  uint64_t v22 = DMFEmergencyModeLog(v21);
  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138543362;
    id v26 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Enabling Emergency Mode until: %{public}@",  (uint8_t *)&v25,  0xCu);
  }

  uint64_t v16 = 0LL;
LABEL_6:
  v10[2](v10, v16);
}

- (void)disableEmergencyModeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence emergencyModeQueue](self, "emergencyModeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000500EC;
  block[3] = &unk_10009F228;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)emergencyModeStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DMDPolicyPersistence emergencyModeQueue](self, "emergencyModeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100050238;
  block[3] = &unk_10009F228;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (BOOL)alarms
{
  return 1;
}

- (NSArray)notifyMatchingNotifications
{
  return (NSArray *)&off_1000A59B8;
}

- (NSArray)distributedNotificationNames
{
  v3[0] = CTCategoriesDidChangeNotification;
  v3[1] = @"com.apple.LaunchServices.applicationRegistered";
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  2LL));
}

- (void)handleAlarmWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v6 = DMFPolicyLog(v3, v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Handling alarm with identifier: %{public}@",  (uint8_t *)&v8,  0xCu);
  }
}

- (void)handleNotifyMatchingNotificationWithName:(id)a3
{
  id v4 = a3;
  uint64_t v7 = DMFPolicyLog(v4, v5, v6);
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Handling notify matching notification with name: %{public}@",  buf,  0xCu);
  }

  if ([v4 isEqualToString:@"com.apple.mobile.keybagd.first_unlock"])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100050704;
    v9[3] = &unk_10009F250;
    void v9[4] = self;
    -[DMDPolicyPersistence _performBackgroundTask:](self, "_performBackgroundTask:", v9);
  }
}

- (void)handleDistributedNotificationWithName:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = DMFPolicyLog(v7, v8, v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Handling distributed notification with name: %{public}@",  buf,  0xCu);
  }

  if ([v6 isEqualToString:CTCategoriesDidChangeNotification])
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000508EC;
    v15[3] = &unk_10009F250;
    v15[4] = self;
    -[DMDPolicyPersistence _performBackgroundTask:](self, "_performBackgroundTask:", v15);
  }

  if ([v6 isEqualToString:@"com.apple.LaunchServices.applicationRegistered"])
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"isPlaceholder"]);
    uint64_t v13 = v12;
    if (v12 && ([v12 BOOLValue] & 1) == 0)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100050940;
      v14[3] = &unk_10009F250;
      v14[4] = self;
      -[DMDPolicyPersistence _performBackgroundTask:](self, "_performBackgroundTask:", v14);
    }
  }
}

- (BOOL)isPersistentContainerLoaded
{
  return self->_isPersistentContainerLoaded;
}

- (void)setIsPersistentContainerLoaded:(BOOL)a3
{
  self->_isPersistentContainerLoaded = a3;
}

- (NSManagedObjectContext)internalContext
{
  return self->_internalContext;
}

- (void)setInternalContext:(id)a3
{
}

- (NSManagedObjectContext)registrationContext
{
  return self->_registrationContext;
}

- (void)setRegistrationContext:(id)a3
{
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (OS_dispatch_queue)emergencyModeQueue
{
  return self->_emergencyModeQueue;
}

- (NSCache)effectivePolicyCache
{
  return self->_effectivePolicyCache;
}

- (NSCache)bundleIdentifierPolicyCache
{
  return self->_bundleIdentifierPolicyCache;
}

- (NSCache)categoryIdentifierPolicyCache
{
  return self->_categoryIdentifierPolicyCache;
}

- (NSCache)websiteURLsPolicyCache
{
  return self->_websiteURLsPolicyCache;
}

- (void).cxx_destruct
{
}

  ;
}

@end