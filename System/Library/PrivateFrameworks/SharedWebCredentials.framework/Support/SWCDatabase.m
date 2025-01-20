@interface SWCDatabase
+ (OS_dispatch_queue)queue;
+ (SWCDatabase)new;
+ (SWCDatabase)sharedDatabase;
+ (id)_archivedDataFromStorage:(id)a3 error:(id *)a4;
+ (id)_storageFromArchivedData:(id)a3 error:(id *)a4;
+ (id)loadContentsOfURL:(id)a3 error:(id *)a4;
- (BOOL)_deleteStorageItemReturningError:(id *)a3;
- (BOOL)_updateStorageItemWithData:(id)a3 error:(id *)a4;
- (BOOL)addEntries:(id)a3;
- (BOOL)mayContainEntryMatchingServiceSpecifier:(id)a3;
- (BOOL)removeEntries:(id)a3;
- (BOOL)saveReturningError:(id *)a3;
- (NSData)enterpriseState;
- (NSNumber)launchServicesDatabaseGeneration;
- (NSURL)storageURL;
- (SWCDatabase)init;
- (_SWCGeneration)settingsGeneration;
- (id)_dataFromStorageReturningError:(id *)a3;
- (id)_dataURLReturningError:(id *)a3;
- (id)_initShared;
- (id)_storageForArchiving;
- (id)entry:(id)a3;
- (id)entryMatchingService:(id)a3 domain:(id)a4 appID:(id)a5;
- (id)entryMatchingServiceSpecifier:(id)a3;
- (id)settingsDictionaryForServiceSpecifier:(id)a3;
- (void)_removeSettingsForKeysNoSave:(id)a3 serviceSpecifier:(id)a4;
- (void)_reorderAppLinks:(id)a3 domain:(id)a4;
- (void)_scheduleSave;
- (void)cleanOldSettings;
- (void)enumerateEntries:(id)a3 matchingService:(id)a4 domain:(id)a5 appID:(id)a6 block:(id)a7;
- (void)enumerateEntries:(id)a3 matchingServiceSpecifier:(id)a4 block:(id)a5;
- (void)enumerateEntriesMatchingService:(id)a3 domain:(id)a4 appID:(id)a5 block:(id)a6;
- (void)enumerateEntriesMatchingService:(id)a3 exactDomain:(id)a4 appID:(id)a5 block:(id)a6;
- (void)enumerateEntriesMatchingServiceSpecifier:(id)a3 block:(id)a4;
- (void)enumerateEntriesMatchingServiceSpecifierWithExactDomain:(id)a3 block:(id)a4;
- (void)enumerateEntriesWithBlock:(id)a3;
- (void)enumerateSettingsDictionariesWithBlock:(id)a3;
- (void)receiveSIGTERMSignal;
- (void)removeAllEntries;
- (void)removeSettingsForKeys:(id)a3 serviceSpecifier:(id)a4;
- (void)removeSettingsForKeys:(id)a3 serviceType:(id)a4;
- (void)setEnterpriseState:(id)a3;
- (void)setLaunchServicesDatabaseGeneration:(id)a3;
- (void)setSettingsDictionary:(id)a3 forServiceSpecifier:(id)a4;
- (void)updateEntriesForDomain:(id)a3 canonicalEntries:(id)a4;
@end

@implementation SWCDatabase

+ (SWCDatabase)sharedDatabase
{
  id v2 = [(id)objc_opt_class(a1) queue];
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v2);
  dispatch_assert_queue_V2(v3);

  if (qword_10002E868 != -1) {
    dispatch_once(&qword_10002E868, &stru_100028E30);
  }
  return (SWCDatabase *)(id)qword_10002E860;
}

+ (SWCDatabase)new
{
}

- (SWCDatabase)init
{
}

+ (id)loadContentsOfURL:(id)a3 error:(id *)a4
{
  v7 = objc_autoreleasePoolPush();
  id v17 = 0LL;
  v8 = -[NSData initWithContentsOfURL:options:error:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithContentsOfURL:options:error:",  a3,  1LL,  &v17);
  id v9 = v17;
  v10 = v9;
  if (v8)
  {
    id v16 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _storageFromArchivedData:v8 error:&v16]);
    id v12 = v16;

    if (v11) {
      id v13 = v11;
    }

    v10 = v12;
  }

  else
  {
    v11 = 0LL;
  }

  objc_autoreleasePoolPop(v7);
  if (!v11)
  {
    if (qword_10002E888 != -1) {
      dispatch_once(&qword_10002E888, &stru_100028F60);
    }
    v14 = (os_log_s *)qword_10002E880;
    if (os_log_type_enabled((os_log_t)qword_10002E880, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed to load SWC database: %@",  buf,  0xCu);
      if (!a4) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }

    if (a4) {
LABEL_11:
    }
      *a4 = v10;
  }

- (void)receiveSIGTERMSignal
{
  v3 = (void *)os_transaction_create("com.apple.swc.db.SIGTERM", a2);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[SWCDatabase queue](&OBJC_CLASS___SWCDatabase, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100014B08;
  v6[3] = &unk_100028768;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

- (NSURL)storageURL
{
  if ((*((_BYTE *)self + 40) & 1) != 0) {
    return (NSURL *)(id)objc_claimAutoreleasedReturnValue( -[SWCDatabase _dataURLReturningError:]( self,  "_dataURLReturningError:",  0LL));
  }
  else {
    return (NSURL *)0LL;
  }
}

+ (OS_dispatch_queue)queue
{
  if (qword_10002E878 != -1) {
    dispatch_once(&qword_10002E878, &stru_100028E50);
  }
  return (OS_dispatch_queue *)(id)qword_10002E870;
}

- (id)entry:(id)a3
{
  id v5 = objc_autoreleasePoolPush();
  id v6 = -[NSMutableOrderedSet indexOfObject:](self->_entries, "indexOfObject:", a3);
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v7 = 0LL;
  }
  else {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet objectAtIndexedSubscript:](self->_entries, "objectAtIndexedSubscript:", v6));
  }
  objc_autoreleasePoolPop(v5);
  return v7;
}

- (BOOL)mayContainEntryMatchingServiceSpecifier:(id)a3
{
  return 1;
}

- (void)enumerateEntries:(id)a3 matchingService:(id)a4 domain:(id)a5 appID:(id)a6 block:(id)a7
{
  context = objc_autoreleasePoolPush();
  id v13 = (NSMutableOrderedSet *)a3;
  id obj = v13;
  if (a5 && self->_entries == v13 && -[SWCDomainCache isValid](self->_domainCache, "isValid"))
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[SWCDomainCache entriesForDomain:](self->_domainCache, "entriesForDomain:", a5));

    id obj = (id)v14;
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id obja = obj;
  id v15 = [obja countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v30;
LABEL_7:
    uint64_t v17 = 0LL;
    while (1)
    {
      if (*(void *)v30 != v16) {
        objc_enumerationMutation(obja);
      }
      v18 = *(void **)(*((void *)&v29 + 1) + 8 * v17);
      if (!a4
        || (v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v29 + 1) + 8 * v17) serviceType]),
            BOOL v20 = [v19 caseInsensitiveCompare:a4] == 0,
            v19,
            v20))
      {
        if (!a5
          || (v21 = (void *)objc_claimAutoreleasedReturnValue([v18 domain]),
              unsigned __int8 v22 = [v21 encompassesDomain:a5],
              v21,
              (v22 & 1) != 0))
        {
          if (!a6
            || (v23 = (void *)objc_claimAutoreleasedReturnValue([v18 applicationIdentifier]),
                unsigned __int8 v24 = [v23 isEqualToApplicationIdentifierIgnoringPrefix:a6],
                v23,
                (v24 & 1) != 0))
          {
            char v28 = 0;
            (*((void (**)(id, void *, char *))a7 + 2))(a7, v18, &v28);
            if (v28) {
              break;
            }
          }
        }
      }

      if (v15 == (id)++v17)
      {
        id v15 = [obja countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v15) {
          goto LABEL_7;
        }
        break;
      }
    }
  }

  objc_autoreleasePoolPop(context);
}

- (void)enumerateEntries:(id)a3 matchingServiceSpecifier:(id)a4 block:(id)a5
{
  id v11 = (id)objc_claimAutoreleasedReturnValue([a4 serviceType]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a4 SWCDomain]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([a4 SWCApplicationIdentifier]);
  -[SWCDatabase enumerateEntries:matchingService:domain:appID:block:]( self,  "enumerateEntries:matchingService:domain:appID:block:",  a3,  v11,  v9,  v10,  a5);
}

- (void)enumerateEntriesWithBlock:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v4 = self->_entries;
  id v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v4);
      }
      uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
      id v9 = objc_autoreleasePoolPush();
      unsigned __int8 v10 = 0;
      (*((void (**)(id, uint64_t, unsigned __int8 *))a3 + 2))(a3, v8, &v10);
      LODWORD(v8) = v10;
      objc_autoreleasePoolPop(v9);
      if ((_DWORD)v8) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateEntriesMatchingService:(id)a3 domain:(id)a4 appID:(id)a5 block:(id)a6
{
}

- (void)enumerateEntriesMatchingServiceSpecifier:(id)a3 block:(id)a4
{
  entries = self->_entries;
  id v10 = (id)objc_claimAutoreleasedReturnValue([a3 serviceType]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a3 SWCDomain]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a3 SWCApplicationIdentifier]);
  -[SWCDatabase enumerateEntries:matchingService:domain:appID:block:]( self,  "enumerateEntries:matchingService:domain:appID:block:",  entries,  v10,  v8,  v9,  a4);
}

- (void)enumerateEntriesMatchingService:(id)a3 exactDomain:(id)a4 appID:(id)a5 block:(id)a6
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001522C;
  v6[3] = &unk_100028E78;
  v6[4] = a4;
  void v6[5] = a6;
  -[SWCDatabase enumerateEntriesMatchingService:domain:appID:block:]( self,  "enumerateEntriesMatchingService:domain:appID:block:",  a3,  a4,  a5,  v6);
}

- (void)enumerateEntriesMatchingServiceSpecifierWithExactDomain:(id)a3 block:(id)a4
{
  id v9 = (id)objc_claimAutoreleasedReturnValue([a3 serviceType]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a3 SWCDomain]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a3 SWCApplicationIdentifier]);
  -[SWCDatabase enumerateEntriesMatchingService:exactDomain:appID:block:]( self,  "enumerateEntriesMatchingService:exactDomain:appID:block:",  v9,  v7,  v8,  a4);
}

- (id)entryMatchingService:(id)a3 domain:(id)a4 appID:(id)a5
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  __int128 v11 = sub_100015458;
  __int128 v12 = sub_100015468;
  id v13 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100015470;
  v7[3] = &unk_100028EA0;
  v7[4] = a4;
  v7[5] = &v8;
  -[SWCDatabase enumerateEntriesMatchingService:domain:appID:block:]( self,  "enumerateEntriesMatchingService:domain:appID:block:",  a3,  a4,  a5,  v7);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)entryMatchingServiceSpecifier:(id)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 serviceType]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a3 SWCDomain]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a3 SWCApplicationIdentifier]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[SWCDatabase entryMatchingService:domain:appID:]( self,  "entryMatchingService:domain:appID:",  v5,  v6,  v7));

  return v8;
}

- (BOOL)addEntries:(id)a3
{
  id v5 = -[NSMutableOrderedSet count](self->_entries, "count");
  -[NSMutableOrderedSet unionOrderedSet:](self->_entries, "unionOrderedSet:", a3);
  id v6 = -[NSMutableOrderedSet count](self->_entries, "count");
  if (v6 != v5)
  {
    -[SWCDomainCache updateCachedDomainsForEntries:](self->_domainCache, "updateCachedDomainsForEntries:", a3);
    -[SWCDatabase _scheduleSave](self, "_scheduleSave");
  }

  return v6 != v5;
}

- (BOOL)removeEntries:(id)a3
{
  id v5 = -[NSMutableOrderedSet count](self->_entries, "count");
  -[NSMutableOrderedSet minusOrderedSet:](self->_entries, "minusOrderedSet:", a3);
  id v6 = -[NSMutableOrderedSet count](self->_entries, "count");
  if (v6 != v5)
  {
    -[SWCDomainCache clear](self->_domainCache, "clear");
    -[SWCDomainCache updateCachedDomainsForEntries:]( self->_domainCache,  "updateCachedDomainsForEntries:",  self->_entries);
    -[SWCDatabase _scheduleSave](self, "_scheduleSave");
  }

  return v6 != v5;
}

- (void)removeAllEntries
{
  launchServicesDatabaseGeneration = self->_launchServicesDatabaseGeneration;
  self->_launchServicesDatabaseGeneration = 0LL;

  enterpriseState = self->_enterpriseState;
  self->_enterpriseState = 0LL;

  -[SWCDomainCache clear](self->_domainCache, "clear");
  if (qword_10002E888 != -1) {
    dispatch_once(&qword_10002E888, &stru_100028F60);
  }
  id v5 = (os_log_s *)qword_10002E880;
  if (os_log_type_enabled((os_log_t)qword_10002E880, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Deleting old SWC database from storage", buf, 2u);
  }

  id v9 = 0LL;
  unsigned __int8 v6 = -[SWCDatabase _deleteStorageItemReturningError:](self, "_deleteStorageItemReturningError:", &v9);
  id v7 = v9;
  if ((v6 & 1) == 0)
  {
    if (qword_10002E888 != -1) {
      dispatch_once(&qword_10002E888, &stru_100028F60);
    }
    uint64_t v8 = (os_log_s *)qword_10002E880;
    if (os_log_type_enabled((os_log_t)qword_10002E880, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Delete SWC database from storage failed with error %@",  buf,  0xCu);
    }
  }
}

- (void)updateEntriesForDomain:(id)a3 canonicalEntries:(id)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  if (![a4 count])
  {
    if (qword_10002E888 != -1) {
      dispatch_once(&qword_10002E888, &stru_100028F60);
    }
    uint64_t v8 = (os_log_s *)qword_10002E880;
    if (os_log_type_enabled((os_log_t)qword_10002E880, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "JSON file for %@ had no entries", buf, 0xCu);
    }
  }

  uint64_t v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  __int128 v12 = sub_100015B04;
  id v13 = &unk_100028EC8;
  id v9 = v7;
  id v14 = v9;
  id v15 = a4;
  -[SWCDatabase enumerateEntriesMatchingService:exactDomain:appID:block:]( self,  "enumerateEntriesMatchingService:exactDomain:appID:block:",  0LL,  a3,  0LL,  &v10);
  -[SWCDatabase _reorderAppLinks:domain:](self, "_reorderAppLinks:domain:", a4, a3, v10, v11, v12, v13);
  +[SWCEntry canonicalizeEntries:](&OBJC_CLASS___SWCEntry, "canonicalizeEntries:", self->_entries);
  -[SWCDatabase scheduleNextSave](self, "scheduleNextSave");
}

- (id)settingsDictionaryForServiceSpecifier:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_settings, "objectForKeyedSubscript:", a3);
}

- (void)setSettingsDictionary:(id)a3 forServiceSpecifier:(id)a4
{
  id v6 = [a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_settings, "setObject:forKeyedSubscript:", v6, a4);

  id v7 = (_SWCGeneration *)objc_claimAutoreleasedReturnValue( -[_SWCGeneration generationByIncrementingSelf]( self->_settingsGeneration,  "generationByIncrementingSelf"));
  settingsGeneration = self->_settingsGeneration;
  self->_settingsGeneration = v7;

  +[_SWCServiceSettings postChangeNotificationForServiceSpecifier:]( &OBJC_CLASS____SWCServiceSettings,  "postChangeNotificationForServiceSpecifier:",  a4);
  -[SWCDatabase scheduleNextSave](self, "scheduleNextSave");
}

- (void)removeSettingsForKeys:(id)a3 serviceType:(id)a4
{
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  settings = self->_settings;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100015F78;
  v29[3] = &unk_100028EF0;
  v29[4] = a4;
  id v9 = v7;
  __int128 v30 = v9;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](settings, "enumerateKeysAndObjectsUsingBlock:", v29);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a3 allObjects]);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  uint64_t v11 = v9;
  id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v25,  v32,  16LL);
  if (v12)
  {
    uint64_t v13 = *(void *)v26;
    do
    {
      id v14 = 0LL;
      do
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v11);
        }
        -[SWCDatabase _removeSettingsForKeysNoSave:serviceSpecifier:]( self,  "_removeSettingsForKeysNoSave:serviceSpecifier:",  v10,  *(void *)(*((void *)&v25 + 1) + 8LL * (void)v14));
        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v25,  v32,  16LL);
    }

    while (v12);
  }

  id v15 = (_SWCGeneration *)objc_claimAutoreleasedReturnValue( -[_SWCGeneration generationByIncrementingSelf]( self->_settingsGeneration,  "generationByIncrementingSelf"));
  settingsGeneration = self->_settingsGeneration;
  self->_settingsGeneration = v15;

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v17 = v11;
  id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v21,  v31,  16LL);
  if (v18)
  {
    uint64_t v19 = *(void *)v22;
    do
    {
      BOOL v20 = 0LL;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v17);
        }
        +[_SWCServiceSettings postChangeNotificationForServiceSpecifier:]( &OBJC_CLASS____SWCServiceSettings,  "postChangeNotificationForServiceSpecifier:",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)v20),  (void)v21);
        BOOL v20 = (char *)v20 + 1;
      }

      while (v18 != v20);
      id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v21,  v31,  16LL);
    }

    while (v18);
  }

  -[SWCDatabase scheduleNextSave](self, "scheduleNextSave");
}

- (void)removeSettingsForKeys:(id)a3 serviceSpecifier:(id)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 allObjects]);
  -[SWCDatabase _removeSettingsForKeysNoSave:serviceSpecifier:]( self,  "_removeSettingsForKeysNoSave:serviceSpecifier:",  v6,  a4);

  id v7 = (_SWCGeneration *)objc_claimAutoreleasedReturnValue( -[_SWCGeneration generationByIncrementingSelf]( self->_settingsGeneration,  "generationByIncrementingSelf"));
  settingsGeneration = self->_settingsGeneration;
  self->_settingsGeneration = v7;

  +[_SWCServiceSettings postChangeNotificationForServiceSpecifier:]( &OBJC_CLASS____SWCServiceSettings,  "postChangeNotificationForServiceSpecifier:",  a4);
  -[SWCDatabase scheduleNextSave](self, "scheduleNextSave");
}

- (void)enumerateSettingsDictionariesWithBlock:(id)a3
{
}

- (void)cleanOldSettings
{
  v3 = objc_autoreleasePoolPush();
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100016294;
  v17[3] = &unk_100028EF0;
  v17[4] = self;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v18 = v4;
  -[SWCDatabase enumerateSettingsDictionariesWithBlock:](self, "enumerateSettingsDictionariesWithBlock:", v17);
  if (-[NSMutableSet count](v4, "count"))
  {
    settings = self->_settings;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v4, "allObjects"));
    -[NSMutableDictionary removeObjectsForKeys:](settings, "removeObjectsForKeys:", v6);

    id v7 = (_SWCGeneration *)objc_claimAutoreleasedReturnValue( -[_SWCGeneration generationByIncrementingSelf]( self->_settingsGeneration,  "generationByIncrementingSelf"));
    settingsGeneration = self->_settingsGeneration;
    self->_settingsGeneration = v7;

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v9 = v4;
    id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v13,  v19,  16LL);
    if (v10)
    {
      uint64_t v11 = *(void *)v14;
      do
      {
        id v12 = 0LL;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v9);
          }
          +[_SWCServiceSettings postChangeNotificationForServiceSpecifier:]( &OBJC_CLASS____SWCServiceSettings,  "postChangeNotificationForServiceSpecifier:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v12),  (void)v13);
          id v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v13,  v19,  16LL);
      }

      while (v10);
    }

    -[SWCDatabase scheduleNextSave](self, "scheduleNextSave");
  }

  objc_autoreleasePoolPop(v3);
}

- (BOOL)saveReturningError:(id *)a3
{
  id v6 = objc_autoreleasePoolPush();
  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    id v10 = (void *)os_transaction_create("com.apple.swc.db.save", v5);
    if (qword_10002E888 != -1) {
      dispatch_once(&qword_10002E888, &stru_100028F60);
    }
    uint64_t v11 = (os_log_s *)(id)qword_10002E880;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = -[NSMutableOrderedSet count](self->_entries, "count");
      *(_DWORD *)buf = 134217984;
      id v23 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Saving SWC database with %llu entries...",  buf,  0xCu);
    }

    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase _storageForArchiving](self, "_storageForArchiving"));
    id v21 = 0LL;
    id v14 = [(id)objc_opt_class(self) _archivedDataFromStorage:v13 error:&v21];
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = v21;
    uint64_t v8 = v16;
    if (v15)
    {
      id v20 = v16;
      BOOL v9 = -[SWCDatabase _updateStorageItemWithData:error:](self, "_updateStorageItemWithData:error:", v15, &v20);
      id v17 = v20;

      uint64_t v8 = v17;
    }

    else
    {
      BOOL v9 = 0;
    }
  }

  else
  {
    if (qword_10002E888 != -1) {
      dispatch_once(&qword_10002E888, &stru_100028F60);
    }
    id v7 = (os_log_s *)qword_10002E880;
    if (os_log_type_enabled((os_log_t)qword_10002E880, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Non-shared instance of SWCDatabase cannot save--ignoring call.",  buf,  2u);
    }

    uint64_t v8 = 0LL;
    BOOL v9 = 1;
  }

  objc_autoreleasePoolPop(v6);
  if (!v9)
  {
    if (qword_10002E888 != -1) {
      dispatch_once(&qword_10002E888, &stru_100028F60);
    }
    id v18 = (os_log_s *)qword_10002E880;
    if (os_log_type_enabled((os_log_t)qword_10002E880, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Failed to save SWC database: %@",  buf,  0xCu);
      if (!a3) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }

    if (a3) {
LABEL_20:
    }
      *a3 = v8;
  }

- (_SWCGeneration)settingsGeneration
{
  return (_SWCGeneration *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSNumber)launchServicesDatabaseGeneration
{
  return (NSNumber *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setLaunchServicesDatabaseGeneration:(id)a3
{
}

- (NSData)enterpriseState
{
  return (NSData *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setEnterpriseState:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)_initShared
{
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___SWCDatabase;
  id v2 = -[SWCDatabase init](&v38, "init");
  if (v2)
  {
    v3 = objc_autoreleasePoolPush();
    *((_BYTE *)v2 + 40) |= 1u;
    v4 = objc_alloc_init(&OBJC_CLASS____SWCGeneration);
    settingsGeneration = v2->_settingsGeneration;
    v2->_settingsGeneration = v4;

    id v6 = objc_alloc_init(&OBJC_CLASS___SWCDomainCache);
    domainCache = v2->_domainCache;
    v2->_domainCache = v6;

    id v37 = 0LL;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase _dataFromStorageReturningError:](v2, "_dataFromStorageReturningError:", &v37));
    id v9 = v37;
    id v10 = v9;
    if (v8)
    {
      id v36 = v9;
      id v11 = [(id)objc_opt_class(v2) _storageFromArchivedData:v8 error:&v36];
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v13 = v36;

      if (v12)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 settings]);
        __int128 v15 = (NSMutableDictionary *)[v14 mutableCopy];
        settings = v2->_settings;
        v2->_settings = v15;

        if ([v12 databaseVersion] == (id)9)
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 entries]);
          id v18 = (NSMutableOrderedSet *)[v17 mutableCopy];
          entries = v2->_entries;
          v2->_entries = v18;

          id v20 = (void *)objc_claimAutoreleasedReturnValue([v12 launchServicesDatabaseGeneration]);
          id v21 = (NSNumber *)[v20 copy];
          launchServicesDatabaseGeneration = v2->_launchServicesDatabaseGeneration;
          v2->_launchServicesDatabaseGeneration = v21;

          id v23 = (void *)objc_claimAutoreleasedReturnValue([v12 enterpriseState]);
          __int128 v24 = (NSData *)[v23 copy];
          enterpriseState = v2->_enterpriseState;
          v2->_enterpriseState = v24;

          -[SWCDomainCache updateCachedDomainsForEntries:]( v2->_domainCache,  "updateCachedDomainsForEntries:",  v2->_entries);
        }

        else
        {
          if (qword_10002E888 != -1) {
            dispatch_once(&qword_10002E888, &stru_100028F60);
          }
          __int128 v26 = (os_log_s *)(id)qword_10002E880;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            id v27 = [v12 databaseVersion];
            *(_DWORD *)buf = 134218240;
            id v40 = v27;
            __int16 v41 = 2048;
            uint64_t v42 = 9LL;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "SWC database version did not match (had %llu, wanted %llu). Keeping settings and regenerating entries.",  buf,  0x16u);
          }

          __int128 v28 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
          __int128 v29 = v2->_entries;
          v2->_entries = v28;
        }
      }
    }

    else
    {
      id v13 = v9;
    }

    if (!v2->_entries || !v2->_settings)
    {
      if (qword_10002E888 != -1) {
        dispatch_once(&qword_10002E888, &stru_100028F60);
      }
      __int128 v30 = (os_log_s *)qword_10002E880;
      if (os_log_type_enabled((os_log_t)qword_10002E880, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v13;
        _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "Failed to get SWC database, rebuilding: %@",  buf,  0xCu);
      }

      __int128 v31 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
      __int128 v32 = v2->_entries;
      v2->_entries = v31;

      v33 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v34 = v2->_settings;
      v2->_settings = v33;
    }

    objc_autoreleasePoolPop(v3);
  }

  return v2;
}

- (void)_removeSettingsForKeysNoSave:(id)a3 serviceSpecifier:(id)a4
{
  settings = self->_settings;
  if (a3)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](settings, "objectForKeyedSubscript:", a4));
    id v10 = [v8 mutableCopy];

    if (v10)
    {
      [v10 removeObjectsForKeys:a3];
      if ([v10 count])
      {
        id v9 = [v10 copy];
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_settings, "setObject:forKeyedSubscript:", v9, a4);
      }

      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_settings, "setObject:forKeyedSubscript:", 0LL, a4);
      }
    }
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](settings, "setObject:forKeyedSubscript:", 0LL, a4);
  }

- (id)_storageForArchiving
{
  v4 = objc_alloc_init(&OBJC_CLASS___SWCDatabaseStorage);
  if (!v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v6 handleFailureInMethod:a2 object:self file:@"SWCDatabase.mm" lineNumber:806 description:@"Failed to allocate storage object"];
  }

  -[SWCDatabaseStorage setDatabaseVersion:](v4, "setDatabaseVersion:", 9LL);
  -[SWCDatabaseStorage setEntries:](v4, "setEntries:", self->_entries);
  -[SWCDatabaseStorage setSettings:](v4, "setSettings:", self->_settings);
  -[SWCDatabaseStorage setLaunchServicesDatabaseGeneration:]( v4,  "setLaunchServicesDatabaseGeneration:",  self->_launchServicesDatabaseGeneration);
  -[SWCDatabaseStorage setEnterpriseState:](v4, "setEnterpriseState:", self->_enterpriseState);
  return v4;
}

+ (id)_storageFromArchivedData:(id)a3 error:(id *)a4
{
  id v6 = objc_autoreleasePoolPush();
  id v11 = 0LL;
  id v7 = +[NSKeyedUnarchiver swc_unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "swc_unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___SWCDatabaseStorage),  a3,  &v11);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v11;
  objc_autoreleasePoolPop(v6);
  if (a4 && !v8) {
    *a4 = v9;
  }

  return v8;
}

+ (id)_archivedDataFromStorage:(id)a3 error:(id *)a4
{
  id v6 = objc_autoreleasePoolPush();
  id v10 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  &v10));
  id v8 = v10;
  objc_autoreleasePoolPop(v6);
  if (a4 && !v7) {
    *a4 = v8;
  }

  return v7;
}

- (void)_scheduleSave
{
  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    uint64_t v10 = 0LL;
    *(void *)buf = 0x402E000000000000LL;
    uint64_t v11 = 0x401E000000000000LL;
    id v4 = [(id)objc_opt_class(self) queue];
    id v12 = (id)objc_claimAutoreleasedReturnValue(v4);
    id v13 = (id)os_transaction_create("com.apple.swc.db.schedulesave", v5);
    objc_initWeak(&location, self);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100017864;
    v6[3] = &unk_100028F40;
    objc_copyWeak(&v7, &location);
    sub_10001910C((dispatch_object_t *)&self->_saveTimer, (uint64_t)buf, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

  else
  {
    if (qword_10002E888 != -1) {
      dispatch_once(&qword_10002E888, &stru_100028F60);
    }
    id v2 = (os_log_s *)qword_10002E880;
    if (os_log_type_enabled((os_log_t)qword_10002E880, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "Non-shared instance of SWCDatabase cannot save--ignoring scheduling call.",  buf,  2u);
    }
  }

- (void)_reorderAppLinks:(id)a3 domain:(id)a4
{
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v7 = a3;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v8)
  {
    uint64_t v10 = *(void *)v21;
    uint64_t v11 = _SWCServiceTypeAppLinks;
    *(void *)&__int128 v9 = 138412290LL;
    __int128 v19 = v9;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)v12);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "serviceType", v19, (void)v20));
        unsigned int v15 = [v14 isEqual:v11];

        if (v15)
        {
          id v16 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue(-[SWCDatabase entry:](self, "entry:", v13));
          if (v16)
          {
            if (qword_10002E888 != -1) {
              dispatch_once(&qword_10002E888, &stru_100028F60);
            }
            id v17 = (os_log_s *)qword_10002E880;
            if (os_log_type_enabled((os_log_t)qword_10002E880, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v19;
              __int128 v25 = v16;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "Removing to reorder %@",  buf,  0xCu);
            }

            -[NSMutableOrderedSet addObject:](v6, "addObject:", v16);
          }
        }

        id v12 = (char *)v12 + 1;
      }

      while (v8 != v12);
      id v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }

    while (v8);
  }

  -[SWCDatabase removeEntries:](self, "removeEntries:", v6);
  -[SWCDatabase addEntries:](self, "addEntries:", v6);
  if (-[NSMutableOrderedSet count](v6, "count"))
  {
    if (qword_10002E888 != -1) {
      dispatch_once(&qword_10002E888, &stru_100028F60);
    }
    id v18 = (os_log_s *)qword_10002E880;
    if (os_log_type_enabled((os_log_t)qword_10002E880, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      __int128 v25 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Reordered %@", buf, 0xCu);
    }
  }
}

- (id)_dataURLReturningError:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](&OBJC_CLASS____SWCPrefs, "sharedPrefs"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 containerURLReturningError:a3]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:@"swc.db" isDirectory:0]);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)_dataFromStorageReturningError:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase _dataURLReturningError:](self, "_dataURLReturningError:"));
  if (v4) {
    uint64_t v5 = -[NSData initWithContentsOfURL:options:error:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithContentsOfURL:options:error:",  v4,  1LL,  a3);
  }
  else {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (BOOL)_updateStorageItemWithData:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase _dataURLReturningError:](self, "_dataURLReturningError:", a4));
  if (v6) {
    unsigned __int8 v7 = [a3 writeToURL:v6 options:268435457 error:a4];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)_deleteStorageItemReturningError:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase _dataURLReturningError:](self, "_dataURLReturningError:"));
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v6 = [v5 removeItemAtURL:v4 error:a3];
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

@end