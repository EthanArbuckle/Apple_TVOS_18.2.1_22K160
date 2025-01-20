@interface DownloadManagerClient
- (BOOL)_isBackgroundApp;
- (BOOL)_supportsDownloadKind:(id)a3;
- (BOOL)canAccessAsset:(id)a3;
- (BOOL)canAccessDownload:(id)a3;
- (BOOL)hasEntitlements;
- (BOOL)reloadPersistenceStateInDatabase:(id)a3;
- (BOOL)shouldFilterExternalDownloads;
- (BOOL)supportsDownloadKind:(id)a3;
- (DownloadManagerClient)initWithInputConnection:(id)a3;
- (NSArray)prefetchedDownloadExternalProperties;
- (NSArray)prefetchedDownloadProperties;
- (NSSet)downloadKinds;
- (NSString)persistenceIdentifier;
- (id)_copyAllowedThirdPartyKinds;
- (id)_copyDownloadKindsFromEntitlement;
- (id)_copyFilteredKindsForKinds:(id)a3;
- (id)_copyPrivateDownloadKinds;
- (id)downloadsQueryForMessage:(id)a3 database:(id)a4;
- (id)newDownloadWithClientXPCDownload:(id)a3 error:(id *)a4;
- (id)persistentDownloadManagerInDatabase:(id)a3;
- (void)_sendCoalescableMessage:(int64_t)a3 withDownloadIDs:(id)a4;
- (void)addClientEntityToDatabase:(id)a3;
- (void)dealloc;
- (void)sendChangeset:(id)a3;
- (void)sendDownloadKindsUsingNetwork:(id)a3;
- (void)sendDownloadStateChangedWithID:(int64_t)a3 externalValues:(id)a4 propertyValues:(id)a5;
- (void)sendDownloadStatesChangedWithIdentifiers:(id)a3;
- (void)sendDownloadsRemovedWithIdentifiers:(id)a3;
- (void)sendDownloadsUpdatedWithIdentifiers:(id)a3;
- (void)setClientOptions:(id)a3;
- (void)setDownloadKinds:(id)a3;
- (void)setPersistenceIdentifier:(id)a3;
- (void)setPrefetchedDownloadExternalProperties:(id)a3;
- (void)setPrefetchedDownloadProperties:(id)a3;
- (void)setShouldFilterExternalDownloads:(BOOL)a3;
@end

@implementation DownloadManagerClient

- (DownloadManagerClient)initWithInputConnection:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DownloadManagerClient;
  v4 = -[XPCClient initWithInputConnection:](&v6, "initWithInputConnection:");
  if (v4)
  {
    if (a3) {
      v4->_isDownloadsEntitled = SSXPCConnectionHasEntitlement(a3, kSSITunesStoreEntitlementDownloads);
    }
    if (!v4->super._entitlements && !v4->_isDownloadsEntitled) {
      v4->_shouldFilterExternalDownloads = 1;
    }
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DownloadManagerClient;
  -[XPCClient dealloc](&v3, "dealloc");
}

- (void)addClientEntityToDatabase:(id)a3
{
  v5 = -[XPCClient clientIdentifier](self, "clientIdentifier");
  if (v5)
  {
    objc_super v6 = v5;
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v6, @"client_id");
    v7 = -[XPCClient auditTokenData](self, "auditTokenData");
    if (v7) {
      -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v7, @"audit_token_data");
    }
    -[NSMutableDictionary setObject:forKey:]( v8,  "setObject:forKey:",  +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  (id)-[XPCClient clientType](self, "clientType") == (id)1),  @"client_type");
  }

- (BOOL)canAccessAsset:(id)a3
{
  id v5 = [a3 valueForProperty:@"download_id"];
  if (v5)
  {
    objc_super v6 = -[DownloadEntity initWithPersistentID:inDatabase:]( [DownloadEntity alloc],  "initWithPersistentID:inDatabase:",  [v5 longLongValue],  objc_msgSend(a3, "database"));
    unsigned __int8 v7 = -[DownloadManagerClient canAccessDownload:](self, "canAccessDownload:", v6);

    LOBYTE(v5) = v7;
  }

  return (char)v5;
}

- (BOOL)canAccessDownload:(id)a3
{
  v7[0] = @"client_id";
  v7[1] = @"is_private";
  v7[2] = @"kind";
  [a3 getValues:v6 forProperties:v7 count:3];
  if (v6[2])
  {
    unsigned int v4 = -[DownloadManagerClient supportsDownloadKind:](self, "supportsDownloadKind:");
    if (v4)
    {
      if ([v6[1] BOOLValue] && v6[0]) {
        LOBYTE(v4) = objc_msgSend( v6[0],  "isEqualToString:",  -[XPCClient clientIdentifier](self, "clientIdentifier"));
      }
      else {
        LOBYTE(v4) = 1;
      }
    }
  }

  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (NSSet)downloadKinds
{
  uint64_t v6 = 0LL;
  unsigned __int8 v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_100087C50;
  v10 = sub_100087C60;
  uint64_t v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100087C6C;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_super v3 = (NSSet *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)downloadsQueryForMessage:(id)a3 database:(id)a4
{
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v8 = (void *)SSXPCDictionaryCopyCFObjectWithClass(a3, "3", v7);
  if (![v8 count])
  {

LABEL_6:
    v9 = -[DownloadManagerClient downloadKinds](self, "downloadKinds");
    goto LABEL_7;
  }

  v9 = +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8);

  if (!v9) {
    goto LABEL_6;
  }
LABEL_7:
  v10 = -[XPCClient clientIdentifier](self, "clientIdentifier");
  uint64_t v11 = 0LL;
  if (v10 && v9)
  {
    v12 = v10;
    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    BOOL v14 = xpc_dictionary_get_BOOL(a3, "1");
    v15 = +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"client_id",  v12);
    if (v14)
    {
      v24[0] = v15;
      v24[1] = +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"IFNULL(application_id.bundle_id, download.client_id)",  v12);
      v16 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL);
    }

    else
    {
      v16 = +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"is_private",  0LL),  v15,  0LL);
    }

    -[NSMutableArray addObject:]( v13,  "addObject:",  +[SSSQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v16));
    -[NSMutableArray addObject:]( v13,  "addObject:",  +[SSSQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SSSQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"kind",  v9));
    v17 = objc_alloc(&OBJC_CLASS___NSArray);
    v18 = -[NSArray initWithObjects:]( v17,  "initWithObjects:",  SSDownloadPhaseFailed,  SSDownloadPhaseFinished,  SSDownloadPhaseCanceled,  0LL);
    id v19 = -[DownloadManagerClient persistentDownloadManagerInDatabase:]( self,  "persistentDownloadManagerInDatabase:",  a4);
    if (v19)
    {
      id v20 = +[PersistentDownloadEntity queryWithDatabase:predicate:]( PersistentDownloadEntity,  "queryWithDatabase:predicate:",  a4,  +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"manager_id",  [v19 persistentID]));
      id v21 = +[SSSQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  +[SSSQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SSSQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"IFNULL(download_state.phase, SSDownloadPhaseWaiting)",  v18),  +[SSSQLiteContainsPredicate containsPredicateWithProperty:query:queryProperty:]( &OBJC_CLASS___SSSQLiteContainsPredicate,  "containsPredicateWithProperty:query:queryProperty:",  SSSQLEntityPropertyPersistentID,  v20,  @"download_id"),  0LL));
    }

    else
    {
      id v21 = +[SSSQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SSSQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"IFNULL(download_state.phase, SSDownloadPhaseWaiting)",  v18);
    }

    -[NSMutableArray addObject:](v13, "addObject:", v21);

    id v22 = objc_alloc_init(&OBJC_CLASS___SSSQLiteQueryDescriptor);
    [v22 setEntityClass:objc_opt_class(DownloadEntity)];
    objc_msgSend( v22,  "setOrderingDirections:",  +[NSArray arrayWithObjects:]( NSArray,  "arrayWithObjects:",  SSSQLiteOrderDescending,  SSSQLiteOrderAscending,  0));
    objc_msgSend( v22,  "setOrderingProperties:",  +[NSArray arrayWithObjects:]( NSArray,  "arrayWithObjects:",  @"priority",  @"order_key",  0));
    objc_msgSend( v22,  "setPredicate:",  +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));

    uint64_t v11 = -[SSSQLiteQuery initWithDatabase:descriptor:]( objc_alloc(&OBJC_CLASS___SSSQLiteQuery),  "initWithDatabase:descriptor:",  a4,  v22);
  }

  return v11;
}

- (id)newDownloadWithClientXPCDownload:(id)a3 error:(id *)a4
{
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x3052000000LL;
  v32 = sub_100087C50;
  v33 = sub_100087C60;
  uint64_t v34 = 0LL;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3052000000LL;
  v26 = sub_100087C50;
  v27 = sub_100087C60;
  uint64_t v28 = 0LL;
  if (a3 && xpc_get_type(a3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10008833C;
    block[3] = &unk_10034CC38;
    block[4] = a3;
    block[5] = self;
    block[6] = &v23;
    block[7] = &v29;
    dispatch_sync(dispatchQueue, block);
    v16 = (NSError *)v24[5];
  }

  else
  {
    id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    LODWORD(v8) = [v7 shouldLog];
    unsigned int v9 = [v7 shouldLogToDisk];
    v10 = (os_log_s *)[v7 OSLogObject];
    uint64_t v11 = v10;
    if (v9) {
      LODWORD(v8) = v8 | 2;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      uint64_t v8 = v8;
    }
    else {
      v8 &= 2u;
    }
    if ((_DWORD)v8)
    {
      uint64_t v12 = objc_opt_class(self);
      int v35 = 138412290;
      uint64_t v36 = v12;
      uint64_t v13 = _os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  16LL,  "%@: Client download was NULL",  &v35,  12);
      if (v13)
      {
        BOOL v14 = (void *)v13;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
        free(v14);
        SSFileLog(v7, @"%@");
      }
    }

    v15 = objc_alloc(&OBJC_CLASS___NSError);
    v16 = -[NSError initWithDomain:code:userInfo:](v15, "initWithDomain:code:userInfo:", SSErrorDomain, 400LL, 0LL);
    v24[5] = (uint64_t)v16;
  }

  v18 = v16;
  id v19 = v30;
  id v20 = (void *)v30[5];
  if (a4 && !v20)
  {
    *a4 = (id)v24[5];
    id v20 = (void *)v19[5];
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  return v20;
}

- (NSString)persistenceIdentifier
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  unsigned int v9 = sub_100087C50;
  v10 = sub_100087C60;
  uint64_t v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100088880;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_super v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)persistentDownloadManagerInDatabase:(id)a3
{
  id v5 = -[XPCClient clientIdentifier](self, "clientIdentifier");
  uint64_t v6 = -[DownloadManagerClient persistenceIdentifier](self, "persistenceIdentifier");
  if (v5 && v6) {
    return +[PersistentDownloadManagerEntity anyInDatabase:predicate:]( &OBJC_CLASS___PersistentDownloadManagerEntity,  "anyInDatabase:predicate:",  a3,  +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"client_id",  v5),  +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"persistence_id",  v6),  0LL)));
  }
  else {
    return 0LL;
  }
}

- (NSArray)prefetchedDownloadExternalProperties
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  unsigned int v9 = sub_100087C50;
  v10 = sub_100087C60;
  uint64_t v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100088A64;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_super v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSArray)prefetchedDownloadProperties
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  unsigned int v9 = sub_100087C50;
  v10 = sub_100087C60;
  uint64_t v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100088B70;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_super v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)reloadPersistenceStateInDatabase:(id)a3
{
  id v5 = -[DownloadManagerClient persistenceIdentifier](self, "persistenceIdentifier");
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = -[DownloadManagerClient downloadKinds](self, "downloadKinds");
    unsigned int v8 = -[NSSet containsObject:](v7, "containsObject:", SSDownloadKindNewsstandContent);
    char v9 = v8;
    if (v8) {
      BOOL v10 = (id)-[XPCClient clientType](self, "clientType") == (id)1;
    }
    else {
      BOOL v10 = 0LL;
    }
    uint64_t v12 = (PersistentDownloadManagerEntity *) -[DownloadManagerClient persistentDownloadManagerInDatabase:]( self,  "persistentDownloadManagerInDatabase:",  a3);
    BOOL v36 = v10;
    if (v12)
    {
      uint64_t v13 = v12;
      if ((v9 & 1) != 0)
      {
        if (objc_msgSend( -[PersistentDownloadManagerEntity valueForProperty:]( v12,  "valueForProperty:",  @"migration_version"),  "integerValue") != (id)1)
        {
          id v14 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
          if (!v14) {
            id v14 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
          }
          unsigned int v15 = [v14 shouldLog];
          else {
            unsigned int v16 = v15;
          }
          v17 = (os_log_s *)[v14 OSLogObject];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
            uint64_t v18 = v16;
          }
          else {
            uint64_t v18 = v16 & 2;
          }
          if ((_DWORD)v18)
          {
            int v42 = 138412546;
            uint64_t v43 = objc_opt_class(self);
            __int16 v44 = 2112;
            v45 = -[XPCClient clientIdentifier](self, "clientIdentifier");
            uint64_t v19 = _os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  1LL,  "%@: Performing newsstand migration for client: %@",  &v42,  22);
            if (v19)
            {
              id v20 = (void *)v19;
              id v21 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  4LL);
              free(v20);
              uint64_t v34 = v21;
              SSFileLog(v14, @"%@");
            }
          }

          -[PersistentDownloadManagerEntity performNewsstandMigration1InDatabase:]( v13,  "performNewsstandMigration1InDatabase:",  a3,  v34);
        }
      }

      else
      {
        -[PersistentDownloadManagerEntity setValue:forProperty:]( v12,  "setValue:forProperty:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 1LL),  @"migration_version");
      }
    }

    else
    {
      id v22 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  v6,  @"persistence_id",  -[XPCClient clientIdentifier](self, "clientIdentifier"),  @"client_id",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v10),  @"wake_up_on_finish",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 1LL),  @"migration_version",  0LL);
      uint64_t v13 = -[PersistentDownloadManagerEntity initWithPropertyValues:inDatabase:]( objc_alloc(&OBJC_CLASS___PersistentDownloadManagerEntity),  "initWithPropertyValues:inDatabase:",  v22,  a3);

      if (!v13) {
        goto LABEL_34;
      }
    }

    if (objc_msgSend( +[PersistentDownloadManagerKindEntity queryWithDatabase:predicate:]( PersistentDownloadManagerKindEntity,  "queryWithDatabase:predicate:",  a3,  +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"manager_id",  +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  -[PersistentDownloadManagerEntity persistentID](v13, "persistentID")))),  "deleteAllEntities"))
    {
      uint64_t v23 = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[PersistentDownloadManagerEntity persistentID](v13, "persistentID"));
      int v35 = self;
      v24 = -[DownloadManagerClient downloadKinds](self, "downloadKinds");
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      id v25 = -[NSSet countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v37,  v41,  16LL);
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v38;
        while (2)
        {
          for (i = 0LL; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v38 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  v23,  @"manager_id",  *(void *)(*((void *)&v37 + 1) + 8LL * (void)i),  @"download_kind",  0LL);
            id v30 = a3;
            uint64_t v31 = -[PersistentDownloadManagerKindEntity initWithPropertyValues:inDatabase:]( objc_alloc(&OBJC_CLASS___PersistentDownloadManagerKindEntity),  "initWithPropertyValues:inDatabase:",  v29,  a3);

            if (!v31)
            {
              BOOL v11 = 0;
              goto LABEL_36;
            }

            a3 = v30;
          }

          id v26 = -[NSSet countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v37,  v41,  16LL);
          if (v26) {
            continue;
          }
          break;
        }
      }

      v32 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[DownloadManagerClient shouldFilterExternalDownloads](v35, "shouldFilterExternalDownloads")),  @"filters_external_downloads",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v36),  @"wake_up_on_finish",  0LL);
      -[PersistentDownloadManagerEntity setValuesWithDictionary:](v13, "setValuesWithDictionary:", v32);

      BOOL v11 = 1;
      goto LABEL_36;
    }

- (void)sendChangeset:(id)a3
{
  id v5 = [a3 downloadChangeTypes];
  if (-[XPCClient canReceiveMessages](self, "canReceiveMessages"))
  {
    id v6 = [a3 statusChangedDownloadIDs];
    if ((v5 & 1) != 0)
    {
      -[XPCClient sendCoalescedMessageWithIdentifier:](self, "sendCoalescedMessageWithIdentifier:", 1003LL);
      goto LABEL_12;
    }

    if ((v5 & 8) != 0)
    {
      id v7 = [a3 removedDownloadIDs];
      id v8 = [a3 removedPersistentDownloadIDs];
      if (-[NSString length](-[DownloadManagerClient persistenceIdentifier](self, "persistenceIdentifier"), "length"))
      {
        if ([v7 count]) {
          -[DownloadManagerClient sendDownloadsRemovedWithIdentifiers:]( self,  "sendDownloadsRemovedWithIdentifiers:",  v7);
        }
        if ([v8 count])
        {
          if ([v6 count])
          {
            id v9 = [v8 mutableCopy];
            [v9 minusSet:v6];
            if ([v9 count]) {
              -[DownloadManagerClient sendDownloadsUpdatedWithIdentifiers:]( self,  "sendDownloadsUpdatedWithIdentifiers:",  v9);
            }
          }

          else
          {
            -[DownloadManagerClient sendDownloadsUpdatedWithIdentifiers:]( self,  "sendDownloadsUpdatedWithIdentifiers:",  v8);
          }
        }
      }

      else if ([v8 count])
      {
        id v10 = [v7 mutableCopy];
        [v10 unionOrderedSet:v8];
        -[DownloadManagerClient sendDownloadsRemovedWithIdentifiers:](self, "sendDownloadsRemovedWithIdentifiers:", v10);
      }

      else
      {
        -[DownloadManagerClient sendDownloadsRemovedWithIdentifiers:](self, "sendDownloadsRemovedWithIdentifiers:", v7);
      }
    }

    if ((v5 & 0x10) != 0) {
      -[DownloadManagerClient sendDownloadsUpdatedWithIdentifiers:]( self,  "sendDownloadsUpdatedWithIdentifiers:",  [a3 updatedDownloadIDs]);
    }
    if ((v5 & 2) != 0)
    {
LABEL_12:
      if ([v6 count] == (id)1) {
        -[DownloadManagerClient sendDownloadStateChangedWithID:externalValues:propertyValues:]( self,  "sendDownloadStateChangedWithID:externalValues:propertyValues:",  objc_msgSend(objc_msgSend(v6, "anyObject"), "longLongValue"),  objc_msgSend(a3, "changedExternalDownloadProperties"),  objc_msgSend(a3, "changedDownloadProperties"));
      }
      else {
        -[DownloadManagerClient sendDownloadStatesChangedWithIdentifiers:]( self,  "sendDownloadStatesChangedWithIdentifiers:",  v6);
      }
    }
  }

  else if (v5)
  {
    -[XPCClient sendCoalescedMessageWithIdentifier:](self, "sendCoalescedMessageWithIdentifier:", 1003LL);
  }

- (void)sendDownloadKindsUsingNetwork:(id)a3
{
  if (-[XPCClient canReceiveMessages](self, "canReceiveMessages"))
  {
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v5, "0", 1006LL);
    SSXPCDictionarySetCFObject(v5, "1", a3);
    -[SSXPCConnection sendMessage:withReply:]( self->super._outputConnection,  "sendMessage:withReply:",  v5,  &stru_10034CC78);
    xpc_release(v5);
  }

  else
  {
    -[XPCClient sendCoalescedMessageWithIdentifier:](self, "sendCoalescedMessageWithIdentifier:", 1006LL);
  }

- (void)sendDownloadsRemovedWithIdentifiers:(id)a3
{
}

- (void)sendDownloadStateChangedWithID:(int64_t)a3 externalValues:(id)a4 propertyValues:(id)a5
{
  if (-[XPCClient canReceiveMessages](self, "canReceiveMessages"))
  {
    xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v9, "0", 1004LL);
    SSXPCDictionarySetCFObject(v9, "2", a4);
    SSXPCDictionarySetCFObject(v9, "3", a5);
    xpc_object_t v10 = xpc_array_create(0LL, 0LL);
    xpc_array_set_int64(v10, 0xFFFFFFFFFFFFFFFFLL, a3);
    xpc_dictionary_set_value(v9, "1", v10);
    xpc_release(v10);
    -[SSXPCConnection sendMessage:withReply:]( self->super._outputConnection,  "sendMessage:withReply:",  v9,  &stru_10034CC98);
    xpc_release(v9);
  }

  else
  {
    -[XPCClient sendCoalescedMessageWithIdentifier:](self, "sendCoalescedMessageWithIdentifier:", 1003LL);
  }

- (void)sendDownloadStatesChangedWithIdentifiers:(id)a3
{
}

- (void)sendDownloadsUpdatedWithIdentifiers:(id)a3
{
}

- (void)setClientOptions:(id)a3
{
  if (a3)
  {
    if (xpc_get_type(a3) == (xpc_type_t)&_xpc_type_dictionary)
    {
      dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_1000894FC;
      id v6[3] = &unk_10034AE70;
      v6[4] = self;
      v6[5] = a3;
      dispatch_sync(dispatchQueue, v6);
    }
  }

- (void)setDownloadKinds:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10008965C;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)setPersistenceIdentifier:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100089708;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setPrefetchedDownloadProperties:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000897B4;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setPrefetchedDownloadExternalProperties:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100089860;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setShouldFilterExternalDownloads:(BOOL)a3
{
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100089910;
  v4[3] = &unk_10034B328;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (BOOL)shouldFilterExternalDownloads
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000899C4;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)supportsDownloadKind:(id)a3
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  dispatchQueue = (dispatch_queue_s *)self->super._dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100089A80;
  block[3] = &unk_10034CCC0;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  char v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)hasEntitlements
{
  if (self->_isDownloadsEntitled) {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DownloadManagerClient;
  return -[XPCClient hasEntitlements](&v3, "hasEntitlements");
}

- (id)_copyAllowedThirdPartyKinds
{
  if (!-[XPCClient _isNewsstandApp](self, "_isNewsstandApp")
    || !objc_msgSend( -[XPCClient _applicationBackgroundModes](self, "_applicationBackgroundModes"),  "containsObject:",  @"newsstand-content"))
  {
    return 0LL;
  }

  objc_super v3 = objc_alloc(&OBJC_CLASS___NSMutableSet);
  return -[NSMutableSet initWithObjects:](v3, "initWithObjects:", SSDownloadKindNewsstandContent, 0LL);
}

- (id)_copyDownloadKindsFromEntitlement
{
  if (self->super._legacyEntitlements || self->_isDownloadsEntitled) {
    return -[DownloadManagerClient _copyPrivateDownloadKinds](self, "_copyPrivateDownloadKinds");
  }
  id result = -[XPCClient valueForEntitlement:](self, "valueForEntitlement:", @"PrivateDownloadKinds");
  if (result) {
    return -[NSMutableSet initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithArray:", result);
  }
  return result;
}

- (id)_copyPrivateDownloadKinds
{
  v2 = objc_alloc(&OBJC_CLASS___NSMutableSet);
  return -[NSMutableSet initWithObjects:]( v2,  "initWithObjects:",  SSDownloadKindAudiobook,  SSDownloadKindCoachedAudio,  SSDownloadKindEBook,  SSDownloadKindMovie,  SSDownloadKindMusic,  SSDownloadKindMusicVideo,  SSDownloadKindOSUpdate,  SSDownloadKindPodcast,  SSDownloadKindRingtone,  SSDownloadKindSoftwareApplication,  SSDownloadKindTelevisionEpisode,  SSDownloadKindTone,  SSDownloadKindVideoPodcast,  0LL);
}

- (id)_copyFilteredKindsForKinds:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  id v5 = -[DownloadManagerClient _copyPrivateDownloadKinds](self, "_copyPrivateDownloadKinds");
  id v6 = -[DownloadManagerClient _copyDownloadKindsFromEntitlement](self, "_copyDownloadKindsFromEntitlement");
  if (v6)
  {
    [v5 minusSet:v6];
  }

  else if (self->super._legacyEntitlements || self->_isDownloadsEntitled)
  {
    [v5 removeAllObjects];
  }

  else if ((id)-[XPCClient _clientType](self, "_clientType") == (id)1)
  {
    id v19 = -[DownloadManagerClient _copyAllowedThirdPartyKinds](self, "_copyAllowedThirdPartyKinds");
    [v5 unionSet:a3];
    if (v19)
    {
      [v5 minusSet:v19];
    }
  }

  id v8 = [a3 mutableCopy];
  id v9 = [v8 mutableCopy];
  [v9 intersectSet:v5];
  if ([v9 count])
  {
    id v10 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v10) {
      id v10 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v11 = [v10 shouldLog];
    else {
      LODWORD(v12) = v11;
    }
    uint64_t v13 = (os_log_s *)[v10 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v12 = v12;
    }
    else {
      v12 &= 2u;
    }
    if ((_DWORD)v12)
    {
      uint64_t v14 = objc_opt_class(self);
      clientIdentifier = self->super._clientIdentifier;
      int v20 = 138412802;
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      uint64_t v23 = clientIdentifier;
      __int16 v24 = 2112;
      id v25 = v9;
      uint64_t v16 = _os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "%@: Client %@ not entitled for download kinds: %@",  &v20,  32);
      if (v16)
      {
        v17 = (void *)v16;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v16, 4LL);
        free(v17);
        SSFileLog(v10, @"%@");
      }
    }
  }

  [v8 minusSet:v5];
  id v7 = [v8 copy];

  return v7;
}

- (BOOL)_isBackgroundApp
{
  unsigned int v2 = -[XPCClient _applicationState](self, "_applicationState");
  return (v2 < 5) & (0x16u >> v2);
}

- (void)_sendCoalescableMessage:(int64_t)a3 withDownloadIDs:(id)a4
{
  if (-[XPCClient canReceiveMessages](self, "canReceiveMessages"))
  {
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v7, "0", a3);
    xpc_object_t v8 = xpc_array_create(0LL, 0LL);
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v9 = [a4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(a4);
          }
          xpc_array_set_int64( v8,  0xFFFFFFFFFFFFFFFFLL,  (int64_t)[*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) longLongValue]);
          uint64_t v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [a4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v10);
    }

    xpc_dictionary_set_value(v7, "1", v8);
    xpc_release(v8);
    -[SSXPCConnection sendMessage:withReply:]( self->super._outputConnection,  "sendMessage:withReply:",  v7,  &stru_10034CCE0);
    xpc_release(v7);
  }

  else
  {
    -[XPCClient sendCoalescedMessageWithIdentifier:](self, "sendCoalescedMessageWithIdentifier:", 1003LL);
  }

- (BOOL)_supportsDownloadKind:(id)a3
{
  downloadKinds = self->_downloadKinds;
  if (downloadKinds) {
    return -[NSSet containsObject:](downloadKinds, "containsObject:", a3);
  }
  id v7 = -[DownloadManagerClient _copyPrivateDownloadKinds](self, "_copyPrivateDownloadKinds");
  if ([v7 containsObject:a3])
  {
    id v8 = -[DownloadManagerClient _copyDownloadKindsFromEntitlement](self, "_copyDownloadKindsFromEntitlement");
    unsigned __int8 v9 = [v8 containsObject:a3];
  }

  else
  {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

@end