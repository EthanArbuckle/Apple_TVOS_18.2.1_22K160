@interface DownloadsTransaction
+ (double)orderKeyIncrement;
+ (unsigned)orderingBucketSize;
- (BOOL)_moveDownloadWithID:(int64_t)a3 relativeToDownloadWithID:(int64_t)a4 comparisonType:(int64_t)a5;
- (BOOL)_resetDownload:(id)a3 withValues:(const void *)a4 isUserIntiated:(BOOL)a5;
- (BOOL)deletePersistentDownloadManagerWithClientID:(id)a3 persistenceID:(id)a4;
- (BOOL)deletePersistentDownloadManagerWithID:(int64_t)a3;
- (BOOL)finishDownloadWithID:(int64_t)a3 finalPhase:(id)a4;
- (BOOL)finishDownloadWithID:(int64_t)a3 finalPhase:(id)a4 updatePipeline:(BOOL)a5;
- (BOOL)finishDownloadsWithIdentifiers:(id)a3 finalPhase:(id)a4;
- (BOOL)moveDownloadWithID:(int64_t)a3 afterDownloadWithID:(int64_t)a4;
- (BOOL)moveDownloadWithID:(int64_t)a3 beforeDownloadWithID:(int64_t)a4;
- (BOOL)pauseDownloadsWithIdentifiers:(id)a3;
- (BOOL)prioritizeDownloadWithID:(int64_t)a3 aboveDownloadWithID:(int64_t)a4 error:(id *)a5;
- (BOOL)prioritizeDownloadsWithKind:(id)a3 clientID:(id)a4;
- (BOOL)resetDownloadsMatchingPredicate:(id)a3;
- (BOOL)resetDownloadsMatchingPredicate:(id)a3 isUserInitiated:(BOOL)a4;
- (BOOL)resetDownloadsWithIdentifiers:(id)a3;
- (BOOL)resetDownloadsWithIdentifiers:(id)a3 isUserInitiated:(BOOL)a4;
- (BOOL)restartDownloadsWithIdentifiers:(id)a3;
- (BOOL)retryDownloadWithIdentifier:(int64_t)a3;
- (BOOL)retryDownloadsWithIdentifiers:(id)a3;
- (BOOL)updateDownloadEntityWithIdentifier:(int64_t)a3 withDownload:(id)a4;
- (double)_orderKeyAdjacentToOrderKey:(double)a3 comparisonType:(int64_t)a4;
- (id)_addEffectiveClientWithBundleID:(id)a3 database:(id)a4;
- (id)_copyEffectiveBundleIDForDownload:(id)a3;
- (id)_newTransactionForDownload:(id)a3 inDatabase:(id)a4;
- (id)addDownloads:(id)a3;
- (id)changeset;
- (id)importDownloads:(id)a3 initialOrderKey:(double)a4 orderKeyIncrement:(double)a5;
- (id)insertDownloads:(id)a3 afterDownloadWithID:(int64_t)a4;
- (id)insertDownloads:(id)a3 beforeDownloadWithID:(int64_t)a4;
- (void)_setPolicy:(id)a3 forDownloadWithID:(int64_t)a4;
- (void)reconcileSoftwareDownloads:(id)a3 fromITunesStore:(BOOL)a4;
- (void)setValue:(id)a3 forExternalProperty:(id)a4 ofDownloadID:(int64_t)a5;
@end

@implementation DownloadsTransaction

+ (unsigned)orderingBucketSize
{
  return 1000000;
}

+ (double)orderKeyIncrement
{
  return 100.0;
}

- (id)addDownloads:(id)a3
{
  double v6 = v5;
  [(id)objc_opt_class(self) orderKeyIncrement];
  id v8 = -[DownloadsTransaction importDownloads:initialOrderKey:orderKeyIncrement:]( self,  "importDownloads:initialOrderKey:orderKeyIncrement:",  a3,  v6,  v7);
  id v9 = [v8 count];
  if (v9 == [a3 count]) {
    -[DownloadsChangeset addDownloadsToPipelineWithIDs:](self->super._changeset, "addDownloadsToPipelineWithIDs:", v8);
  }
  return v8;
}

- (id)changeset
{
  return -[DownloadsChangeset copy](self->super._changeset, "copy");
}

- (BOOL)deletePersistentDownloadManagerWithClientID:(id)a3 persistenceID:(id)a4
{
  id v5 = +[PersistentDownloadManagerEntity anyInDatabase:predicate:]( &OBJC_CLASS___PersistentDownloadManagerEntity,  "anyInDatabase:predicate:",  -[DownloadsSession database](self, "database"),  +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"persistence_id",  a4),  +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"client_id",  a3),  0LL)));
  if (v5) {
    LOBYTE(v5) = -[DownloadsTransaction deletePersistentDownloadManagerWithID:]( self,  "deletePersistentDownloadManagerWithID:",  [v5 persistentID]);
  }
  return (char)v5;
}

- (BOOL)deletePersistentDownloadManagerWithID:(int64_t)a3
{
  id v5 = -[DownloadsSession database](self, "database");
  double v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v25 = @"download_id";
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100004BE4;
  v23[3] = &unk_10034ADA8;
  v23[4] = v6;
  objc_msgSend( +[PersistentDownloadEntity queryWithDatabase:predicate:]( PersistentDownloadEntity,  "queryWithDatabase:predicate:",  v5,  +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"manager_id",  a3)),  "enumeratePersistentIDsAndProperties:count:usingBlock:",  &v25,  1,  v23);
  double v7 = -[PersistentDownloadManagerEntity initWithPersistentID:inDatabase:]( objc_alloc(&OBJC_CLASS___PersistentDownloadManagerEntity),  "initWithPersistentID:inDatabase:",  a3,  v5);
  unsigned int v8 = -[PersistentDownloadManagerEntity deleteFromDatabase](v7, "deleteFromDatabase");

  if (!v8)
  {
LABEL_13:
    BOOL v16 = 0;
    goto LABEL_14;
  }

  v18 = self;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    unsigned __int8 v12 = 1;
LABEL_4:
    uint64_t v13 = 0LL;
    while (1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v6);
      }
      v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
      if (!+[PersistentDownloadEntity anyInDatabase:predicate:]( &OBJC_CLASS___PersistentDownloadEntity,  "anyInDatabase:predicate:",  v5,  +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"download_id",  v14)))
      {
        v15 = -[DownloadEntity initWithPersistentID:inDatabase:]( [DownloadEntity alloc],  "initWithPersistentID:inDatabase:",  [v14 longLongValue],  v5);
        unsigned __int8 v12 = -[DownloadEntity deleteFromDatabase](v15, "deleteFromDatabase");
      }

      if ((v12 & 1) == 0) {
        goto LABEL_13;
      }
      if (v10 == (id)++v13)
      {
        id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
        if (v10) {
          goto LABEL_4;
        }
        break;
      }
    }
  }

  BOOL v16 = 1;
  -[DownloadsChangeset addDownloadChangeTypes:](v18->super._changeset, "addDownloadChangeTypes:", 1LL);
LABEL_14:

  return v16;
}

- (BOOL)finishDownloadWithID:(int64_t)a3 finalPhase:(id)a4
{
  return -[DownloadsTransaction finishDownloadWithID:finalPhase:updatePipeline:]( self,  "finishDownloadWithID:finalPhase:updatePipeline:",  a3,  a4,  1LL);
}

- (BOOL)finishDownloadWithID:(int64_t)a3 finalPhase:(id)a4 updatePipeline:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v9) {
    id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v10 = [v9 shouldLog];
  else {
    LODWORD(v11) = v10;
  }
  unsigned __int8 v12 = (os_log_s *)[v9 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
    uint64_t v11 = v11;
  }
  else {
    v11 &= 2u;
  }
  if ((_DWORD)v11)
  {
    int v18 = 138412802;
    uint64_t v19 = objc_opt_class(self);
    __int16 v20 = 2048;
    int64_t v21 = a3;
    __int16 v22 = 2112;
    id v23 = a4;
    uint64_t v13 = _os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  1LL,  "%@: Finishing download: %lld with phase: %@",  &v18,  32);
    if (v13)
    {
      v14 = (void *)v13;
      +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
      free(v14);
      SSFileLog(v9, @"%@");
    }
  }

  if (v5)
  {
    v15 = -[NSOrderedSet initWithObjects:]( objc_alloc(&OBJC_CLASS___NSOrderedSet),  "initWithObjects:",  +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3),  0LL);
    -[DownloadPipeline stopDownloadsWithIdentifiers:reason:]( self->super.super._pipeline,  "stopDownloadsWithIdentifiers:reason:",  v15,  0LL);
  }

  BOOL v16 = -[DownloadEntity initWithPersistentID:inDatabase:]( objc_alloc(&OBJC_CLASS___DownloadEntity),  "initWithPersistentID:inDatabase:",  a3,  -[DownloadsSession database](self, "database"));
  -[DownloadsExternalTransaction unionChangeset:]( self,  "unionChangeset:",  -[DownloadEntity finishWithFinalPhase:](v16, "finishWithFinalPhase:", a4));
  -[DownloadEntity deleteScratchDirectory](v16, "deleteScratchDirectory");
  if (objc_msgSend( +[ApplicationWorkspace defaultWorkspace](ApplicationWorkspace, "defaultWorkspace"),  "isMultiUser")
    && objc_msgSend( +[ApplicationWorkspace defaultWorkspace](ApplicationWorkspace, "defaultWorkspace"),  "shouldModifyQuota:",  -[DownloadEntity valueForProperty:](v16, "valueForProperty:", @"kind")))
  {
    objc_msgSend( +[ApplicationWorkspace defaultWorkspace](ApplicationWorkspace, "defaultWorkspace"),  "resumeQuotas");
  }

  return 1;
}

- (BOOL)finishDownloadsWithIdentifiers:(id)a3 finalPhase:(id)a4
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        unsigned __int8 v12 = objc_autoreleasePoolPush();
        LODWORD(v11) = -[DownloadsTransaction finishDownloadWithID:finalPhase:updatePipeline:]( self,  "finishDownloadWithID:finalPhase:updatePipeline:",  [v11 longLongValue],  a4,  0);
        objc_autoreleasePoolPop(v12);
        if (!(_DWORD)v11)
        {
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }

      id v8 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  BOOL v13 = 1;
LABEL_11:
  -[DownloadPipeline stopDownloadsWithIdentifiers:reason:]( self->super.super._pipeline,  "stopDownloadsWithIdentifiers:reason:",  a3,  0LL);
  return v13;
}

- (id)importDownloads:(id)a3 initialOrderKey:(double)a4 orderKeyIncrement:(double)a5
{
  id v9 = +[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet");
  v83 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v10 = -[DownloadsSession database](self, "database");
  unsigned int v11 = [(id)objc_opt_class(self) orderingBucketSize];
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  id obj = a3;
  id v81 = [a3 countByEnumeratingWithState:&v85 objects:v95 count:16];
  if (v81)
  {
    uint32_t __upper_bound = v11 >> 1;
    uint64_t v79 = *(void *)v86;
    uint64_t v78 = SSDownloadExternalPropertyPolicy;
    v82 = v9;
    v77 = v10;
    do
    {
      unsigned __int8 v12 = 0LL;
      do
      {
        if (*(void *)v86 != v79) {
          objc_enumerationMutation(obj);
        }
        BOOL v13 = *(void **)(*((void *)&v85 + 1) + 8LL * (void)v12);
        v14 = objc_autoreleasePoolPush();
        a4 = a4 + a5;
        objc_msgSend( v13,  "setValue:forProperty:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4),  @"order_key");
        objc_msgSend( v13,  "setValue:forProperty:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", arc4random_uniform(__upper_bound)),  @"order_seed");
        id v15 = [v13 externalPropertyValues];
        if (![v15 objectForKey:v78])
        {
          id v16 = [v13 downloadPolicy];
          if (v16) {
            objc_msgSend( v13,  "setValue:forProperty:",  +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  -[DownloadPolicyManager addDownloadPolicy:]( -[DownloadsSession policyManager](self, "policyManager"),  "addDownloadPolicy:",  v16)),  @"policy_id");
          }
        }

        id v17 = -[DownloadsTransaction _copyEffectiveBundleIDForDownload:]( self,  "_copyEffectiveBundleIDForDownload:",  v13);
        if (v17)
        {
          __int128 v18 = v17;
          id v19 = -[NSMutableDictionary objectForKey:](v83, "objectForKey:", v17);
          if (v19
            || (id v19 = -[DownloadsTransaction _addEffectiveClientWithBundleID:database:]( self,  "_addEffectiveClientWithBundleID:database:",  v18,  v10)) != 0LL)
          {
            [v13 setValue:v19 forProperty:@"effective_client_id"];
            -[NSMutableDictionary setObject:forKey:](v83, "setObject:forKey:", v19, v18);
          }
        }

        [v13 setValue:0 forProperty:@"application_id.bundle_id"];
        id v20 = [v13 propertyValues];
        int64_t v21 = -[DownloadEntity initWithPropertyValues:inDatabase:]( objc_alloc(&OBJC_CLASS___DownloadEntity),  "initWithPropertyValues:inDatabase:",  v20,  v10);
        if (!v21)
        {
          id v41 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
          if (!v41) {
            id v41 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
          }
          unsigned int v42 = [v41 shouldLog];
          else {
            unsigned int v43 = v42;
          }
          v44 = (os_log_s *)[v41 OSLogObject];
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
            uint64_t v45 = v43;
          }
          else {
            uint64_t v45 = v43 & 2;
          }
          if ((_DWORD)v45)
          {
            uint64_t v46 = objc_opt_class(self);
            id v47 = [v13 databaseID];
            int v89 = 138543618;
            uint64_t v90 = v46;
            __int16 v91 = 2048;
            id v92 = v47;
            LODWORD(v74) = 22;
            uint64_t v48 = _os_log_send_and_compose_impl( v45,  0LL,  0LL,  0LL,  &_mh_execute_header,  v44,  16LL,  "%{public}@: Entity creation failed for download %lld",  &v89,  v74);
            if (v48)
            {
              v49 = (void *)v48;
              v50 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v48,  4LL);
              free(v49);
              v73 = v50;
              SSFileLog(v41, @"%@");
            }
          }

          goto LABEL_68;
        }

        __int16 v22 = v21;
        id v23 = -[DownloadsTransaction _newTransactionForDownload:inDatabase:]( self,  "_newTransactionForDownload:inDatabase:",  v21,  v10);
        -[DownloadEntity setValue:forProperty:]( v22,  "setValue:forProperty:",  +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v23 persistentID]),  @"transaction_id");
        if (v15) {
          -[DownloadsExternalTransaction setExternalPropertyValues:forDownloadWithID:]( self,  "setExternalPropertyValues:forDownloadWithID:",  v15,  -[DownloadEntity persistentID](v22, "persistentID"));
        }
        id v24 = -[DownloadEntity setAssetsUsingDownload:](v22, "setAssetsUsingDownload:", v13);
        if (!v24)
        {
          id v51 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
          if (!v51) {
            id v51 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
          }
          unsigned int v52 = [v51 shouldLog];
          else {
            unsigned int v53 = v52;
          }
          v54 = (os_log_s *)[v51 OSLogObject];
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
            uint64_t v55 = v53;
          }
          else {
            uint64_t v55 = v53 & 2;
          }
          if ((_DWORD)v55)
          {
            uint64_t v56 = objc_opt_class(self);
            id v57 = -[DownloadEntity persistentID](v22, "persistentID");
            int v89 = 138543618;
            uint64_t v90 = v56;
            __int16 v91 = 2048;
            id v92 = v57;
            LODWORD(v74) = 22;
            uint64_t v58 = _os_log_send_and_compose_impl( v55,  0LL,  0LL,  0LL,  &_mh_execute_header,  v54,  16LL,  "%{public}@: Setting assets failed for download %lld",  &v89,  v74);
            if (v58)
            {
              v59 = (void *)v58;
              v60 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v58,  4LL);
              free(v59);
              v73 = v60;
              SSFileLog(v51, @"%@");
            }
          }

LABEL_68:
          objc_autoreleasePoolPop(v14);
          id v9 = v82;
          goto LABEL_69;
        }

        id v25 = v24;
        context = v14;
        id v26 = -[DownloadEntity persistentID](v22, "persistentID");
        objc_msgSend( v82,  "addObject:",  +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v26));
        id v27 = [v20 objectForKey:@"kind"];
        if (v27)
        {
          id v28 = v27;
          if (SSDownloadKindIsMediaKind(v27))
          {
            v29 = -[DownloadEntity copyDownloadingIPodLibraryItem](v22, "copyDownloadingIPodLibraryItem");
            if (v29)
            {
              v30 = v29;
              -[DownloadsChangeset addIPodLibraryItem:](self->super._changeset, "addIPodLibraryItem:", v29);
              goto LABEL_22;
            }
          }

          else if (SSDownloadKindIsSoftwareKind(v28))
          {
            if (SSDebugShouldUseAppstored())
            {
              id v31 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
              if (!v31) {
                id v31 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
              }
              v32 = v31;
              LODWORD(v33) = [v31 shouldLog];
              v75 = v32;
              v34 = (os_log_s *)[v32 OSLogObject];
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
                uint64_t v33 = v33;
              }
              else {
                v33 &= 2u;
              }
              if ((_DWORD)v33)
              {
                uint64_t v35 = objc_opt_class(self);
                int v89 = 138412290;
                uint64_t v90 = v35;
                LODWORD(v74) = 12;
                uint64_t v36 = _os_log_send_and_compose_impl( v33,  0LL,  0LL,  0LL,  &_mh_execute_header,  v34,  2LL,  "[%@]: Not installing placeholder because appstored will handle it",  &v89,  v74);
                if (v36)
                {
                  v37 = (void *)v36;
                  v38 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v36,  4LL);
                  free(v37);
                  SSFileLog(v75, @"%@");
                  -[DownloadsChangeset addDownloadKind:](self->super._changeset, "addDownloadKind:", v28, v38);
                  goto LABEL_37;
                }
              }
            }

            else if (objc_msgSend(objc_msgSend(v20, "objectForKey:", @"is_automatic"), "integerValue") != (id)2)
            {
              id v39 = [v20 objectForKey:@"bundle_id"];
              v30 = -[ApplicationHandle initWithTransactionIdentifier:downloadIdentifier:bundleIdentifier:]( [ApplicationHandle alloc],  "initWithTransactionIdentifier:downloadIdentifier:bundleIdentifier:",  [v23 persistentID],  v26,  v39);
              -[DownloadsChangeset addAppPlaceholderWithHandle:]( self->super._changeset,  "addAppPlaceholderWithHandle:",  v30);
              if ([v39 length]) {
                +[ApplicationWorkspaceState incompleteNotificationForInstallingDownload:bundleIdentifier:]( &OBJC_CLASS___ApplicationWorkspaceState,  "incompleteNotificationForInstallingDownload:bundleIdentifier:",  v26,  v39);
              }
LABEL_22:
            }
          }

          -[DownloadsChangeset addDownloadKind:](self->super._changeset, "addDownloadKind:", v28, v73);
        }

- (id)insertDownloads:(id)a3 afterDownloadWithID:(int64_t)a4
{
  double v6 = -[DownloadEntity initWithPersistentID:inDatabase:]( objc_alloc(&OBJC_CLASS___DownloadEntity),  "initWithPersistentID:inDatabase:",  a4,  -[DownloadsSession database](self, "database"));
  id v7 = -[DownloadEntity valueForProperty:](v6, "valueForProperty:", @"order_key");
  if (v7)
  {
    [v7 doubleValue];
    double v9 = v8;
    -[DownloadsTransaction _orderKeyAdjacentToOrderKey:comparisonType:]( self,  "_orderKeyAdjacentToOrderKey:comparisonType:",  5LL);
    id v11 = -[DownloadsTransaction importDownloads:initialOrderKey:orderKeyIncrement:]( self,  "importDownloads:initialOrderKey:orderKeyIncrement:",  a3,  v9,  vabdd_f64(v10, v9) / (double)((unint64_t)[a3 count] + 1));
  }

  else
  {
    id v11 = -[DownloadsTransaction addDownloads:](self, "addDownloads:", a3);
  }

  unsigned __int8 v12 = v11;
  id v13 = [v11 count];
  if (v13 == [a3 count]) {
    -[DownloadsChangeset addDownloadsToPipelineWithIDs:](self->super._changeset, "addDownloadsToPipelineWithIDs:", v12);
  }

  return v12;
}

- (id)insertDownloads:(id)a3 beforeDownloadWithID:(int64_t)a4
{
  double v6 = -[DownloadEntity initWithPersistentID:inDatabase:]( objc_alloc(&OBJC_CLASS___DownloadEntity),  "initWithPersistentID:inDatabase:",  a4,  -[DownloadsSession database](self, "database"));
  id v7 = -[DownloadEntity valueForProperty:](v6, "valueForProperty:", @"order_key");
  if (v7)
  {
    [v7 doubleValue];
    double v9 = v8;
    -[DownloadsTransaction _orderKeyAdjacentToOrderKey:comparisonType:]( self,  "_orderKeyAdjacentToOrderKey:comparisonType:",  3LL);
    id v11 = -[DownloadsTransaction importDownloads:initialOrderKey:orderKeyIncrement:]( self,  "importDownloads:initialOrderKey:orderKeyIncrement:",  a3,  v10,  vabdd_f64(v10, v9) / (double)((unint64_t)[a3 count] + 1));
  }

  else
  {
    id v11 = -[DownloadsTransaction addDownloads:](self, "addDownloads:", a3);
  }

  unsigned __int8 v12 = v11;
  id v13 = [v11 count];
  if (v13 == [a3 count]) {
    -[DownloadsChangeset addDownloadsToPipelineWithIDs:](self->super._changeset, "addDownloadsToPipelineWithIDs:", v12);
  }

  return v12;
}

- (BOOL)moveDownloadWithID:(int64_t)a3 afterDownloadWithID:(int64_t)a4
{
  return -[DownloadsTransaction _moveDownloadWithID:relativeToDownloadWithID:comparisonType:]( self,  "_moveDownloadWithID:relativeToDownloadWithID:comparisonType:",  a3,  a4,  5LL);
}

- (BOOL)moveDownloadWithID:(int64_t)a3 beforeDownloadWithID:(int64_t)a4
{
  return -[DownloadsTransaction _moveDownloadWithID:relativeToDownloadWithID:comparisonType:]( self,  "_moveDownloadWithID:relativeToDownloadWithID:comparisonType:",  a3,  a4,  3LL);
}

- (BOOL)pauseDownloadsWithIdentifiers:(id)a3
{
  id v19 = -[DownloadsSession database](self, "database");
  id obj = a3;
  id v18 = [a3 count];
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    uint64_t v8 = SSDownloadPhasePaused;
    uint64_t v16 = SSDownloadPropertyDownloadPhase;
    do
    {
      double v9 = 0LL;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        double v10 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)v9);
        id v11 = objc_autoreleasePoolPush();
        unsigned __int8 v12 = -[DownloadEntity initWithPersistentID:inDatabase:]( [DownloadEntity alloc],  "initWithPersistentID:inDatabase:",  [v10 longLongValue],  v19);
        id v13 = -[DownloadEntity downloadKind](v12, "downloadKind");
        -[DownloadEntity setValue:forProperty:](v12, "setValue:forProperty:", v8, @"download_state.phase");
        -[DownloadsChangeset addDownloadChangeTypes:](self->super._changeset, "addDownloadChangeTypes:", 2LL);
        -[DownloadsChangeset addDownloadKind:](self->super._changeset, "addDownloadKind:", v13);
        -[DownloadsChangeset addStatusChangedDownloadID:]( self->super._changeset,  "addStatusChangedDownloadID:",  -[DownloadEntity persistentID](v12, "persistentID"));
        if (v18 == (id)1)
        {
          v14 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  v8,  v16,  0LL);
          -[DownloadsChangeset setChangedDownloadProperties:]( self->super._changeset,  "setChangedDownloadProperties:",  v14);
        }

        objc_autoreleasePoolPop(v11);
        double v9 = (char *)v9 + 1;
      }

      while (v6 != v9);
      id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v6);
  }

  -[DownloadPipeline stopDownloadsWithIdentifiers:reason:]( self->super.super._pipeline,  "stopDownloadsWithIdentifiers:reason:",  obj,  1LL);
  return 1;
}

- (BOOL)prioritizeDownloadWithID:(int64_t)a3 aboveDownloadWithID:(int64_t)a4 error:(id *)a5
{
  double v9 = -[DownloadEntity initWithPersistentID:inDatabase:]( objc_alloc(&OBJC_CLASS___DownloadEntity),  "initWithPersistentID:inDatabase:",  a3,  -[DownloadsSession database](self, "database"));
  if ((-[DownloadEntity existsInDatabase](v9, "existsInDatabase") & 1) == 0)
  {
    uint64_t v10 = SSErrorDomain;
    uint64_t v11 = 108LL;
LABEL_5:
    unsigned __int8 v12 = (void *)SSError(v10, v11, 0LL, 0LL);
    BOOL v13 = 0;
    if (!a5) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }

  if (SSDownloadPhaseIsFinishedPhase( -[DownloadEntity valueForProperty:]( v9,  "valueForProperty:",  @"IFNULL(download_state.phase, SSDownloadPhaseWaiting)")))
  {
    uint64_t v10 = SSErrorDomain;
    uint64_t v11 = 137LL;
    goto LABEL_5;
  }

  id v15 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v15) {
    id v15 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v16 = [v15 shouldLog];
  else {
    LODWORD(v17) = v16;
  }
  id v18 = (os_log_s *)[v15 OSLogObject];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
    uint64_t v17 = v17;
  }
  else {
    v17 &= 2u;
  }
  if ((_DWORD)v17)
  {
    int v23 = 138412546;
    uint64_t v24 = objc_opt_class(self);
    __int16 v25 = 2048;
    int64_t v26 = a3;
    uint64_t v19 = _os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  1LL,  "%@: Prioritizing download: %lld",  &v23,  22);
    if (v19)
    {
      __int128 v20 = (void *)v19;
      __int128 v21 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v19, 4LL);
      free(v20);
      __int128 v22 = v21;
      SSFileLog(v15, @"%@");
    }
  }

  -[DownloadEntity setValue:forProperty:](v9, "setValue:forProperty:", &off_10036D548, @"priority", v22);
  if (!a4)
  {
    BOOL v13 = 1;
    -[DownloadsChangeset addDownloadChangeTypes:](self->super._changeset, "addDownloadChangeTypes:", 1LL);
    -[DownloadsChangeset addDownloadKind:]( self->super._changeset,  "addDownloadKind:",  -[DownloadEntity downloadKind](v9, "downloadKind"));
    -[DownloadPipeline prioritizeDownloadWithIdentifier:]( self->super.super._pipeline,  "prioritizeDownloadWithIdentifier:",  +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
    goto LABEL_8;
  }

  BOOL v13 = -[DownloadsTransaction moveDownloadWithID:beforeDownloadWithID:]( self,  "moveDownloadWithID:beforeDownloadWithID:",  a3,  a4);
  unsigned __int8 v12 = 0LL;
  if (!a5) {
    goto LABEL_8;
  }
LABEL_6:
  if (!v13)
  {
    BOOL v13 = 0;
    *a5 = v12;
  }

- (BOOL)prioritizeDownloadsWithKind:(id)a3 clientID:(id)a4
{
  uint64_t v7 = -[DownloadsSession database](self, "database");
  uint64_t v8 = +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"kind",  a3);
  id v9 = +[DownloadEntity minValueForProperty:predicate:database:]( &OBJC_CLASS___DownloadEntity,  "minValueForProperty:predicate:database:",  @"order_key",  +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  v8,  +[SSSQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"client_id",  a4,  2LL),  0LL)),  v7);
  if (v9)
  {
    id v41 = a3;
    uint64_t v10 = v9;
    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v39 = v10;
    [v10 doubleValue];
    id v40 = self;
    -[DownloadsTransaction _orderKeyAdjacentToOrderKey:comparisonType:]( self,  "_orderKeyAdjacentToOrderKey:comparisonType:",  3LL);
    double v13 = v12;
    id v14 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  v8,  +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"client_id",  a4),  0LL));
    id v15 = objc_alloc_init(&OBJC_CLASS___SSSQLiteQueryDescriptor);
    [v15 setEntityClass:objc_opt_class(DownloadEntity)];
    objc_msgSend( v15,  "setOrderingDirections:",  +[NSArray arrayWithObjects:]( NSArray,  "arrayWithObjects:",  SSSQLiteOrderDescending,  SSSQLiteOrderAscending,  0));
    objc_msgSend( v15,  "setOrderingProperties:",  +[NSArray arrayWithObjects:]( NSArray,  "arrayWithObjects:",  @"priority",  @"order_key",  0));
    [v15 setPredicate:v14];
    unsigned int v16 = -[SSSQLiteQuery initWithDatabase:descriptor:]( objc_alloc(&OBJC_CLASS___SSSQLiteQuery),  "initWithDatabase:descriptor:",  v7,  v15);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_10000657C;
    v46[3] = &unk_10034ADD0;
    v46[4] = v11;
    -[SSSQLiteQuery enumeratePersistentIDsUsingBlock:](v16, "enumeratePersistentIDsUsingBlock:", v46);

    if (-[NSMutableArray count](v11, "count"))
    {
      id v17 = a4;
      id v18 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v18) {
        id v18 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v19 = [v18 shouldLog];
      else {
        unsigned int v20 = v19;
      }
      __int128 v21 = (os_log_s *)[v18 OSLogObject];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
        uint64_t v22 = v20;
      }
      else {
        uint64_t v22 = v20 & 2;
      }
      if ((_DWORD)v22)
      {
        uint64_t v23 = objc_opt_class(self);
        int v48 = 138412802;
        uint64_t v49 = v23;
        __int16 v50 = 2112;
        id v51 = v41;
        __int16 v52 = 2112;
        id v53 = v17;
        LODWORD(v38) = 32;
        uint64_t v24 = _os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  1LL,  "%@: Prioritizing downloads of kind: %@ for client: %@",  &v48,  v38);
        if (v24)
        {
          __int16 v25 = (void *)v24;
          int64_t v26 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v24, 4LL);
          free(v25);
          v37 = v26;
          SSFileLog(v18, @"%@");
        }
      }

      objc_msgSend(v39, "doubleValue", v37);
      double v28 = v27;
      id v29 = -[NSMutableArray count](v11, "count");
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      id v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v42,  v47,  16LL);
      if (v30)
      {
        id v31 = v30;
        double v32 = (v28 - v13) / (double)((unint64_t)v29 + 1);
        uint64_t v33 = *(void *)v43;
        do
        {
          for (i = 0LL; i != v31; i = (char *)i + 1)
          {
            if (*(void *)v43 != v33) {
              objc_enumerationMutation(v11);
            }
            double v13 = v32 + v13;
            uint64_t v35 = -[DownloadEntity initWithPersistentID:inDatabase:]( [DownloadEntity alloc],  "initWithPersistentID:inDatabase:",  [*(id *)(*((void *)&v42 + 1) + 8 * (void)i) longLongValue],  v7);
            -[DownloadEntity setValue:forProperty:]( v35,  "setValue:forProperty:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v13),  @"order_key");
          }

          id v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v42,  v47,  16LL);
        }

        while (v31);
      }

      -[DownloadsChangeset addDownloadChangeTypes:](v40->super._changeset, "addDownloadChangeTypes:", 1LL);
      -[DownloadsChangeset addDownloadKind:](v40->super._changeset, "addDownloadKind:", v41);
    }
  }

  return 1;
}

- (void)reconcileSoftwareDownloads:(id)a3 fromITunesStore:(BOOL)a4
{
  if (a4) {
    id v6 = (SSSQLiteComparisonPredicate *)+[SSSQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"is_from_store",  0LL),  +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"is_restore",  1LL),  0LL));
  }
  else {
    id v6 = +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"is_from_store",  1LL);
  }
  uint64_t v7 = v6;
  uint64_t v8 = +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"kind",  SSDownloadKindSoftwareApplication);
  id v9 = +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"is_purchase",  0LL);
  uint64_t v10 = SSDownloadPhaseCanceled;
  v45[0] = SSDownloadPhaseCanceled;
  v45[1] = SSDownloadPhaseFinished;
  id v11 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  v8,  v7,  v9,  +[SSSQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SSSQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"IFNULL(download_state.phase, SSDownloadPhaseWaiting)",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v45, 2LL)),  0LL));
  double v12 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  id v13 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v13) {
    id v13 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v14 = [v13 shouldLog];
  else {
    LODWORD(v15) = v14;
  }
  unsigned int v16 = (os_log_s *)[v13 OSLogObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
    uint64_t v15 = v15;
  }
  else {
    v15 &= 2u;
  }
  if ((_DWORD)v15)
  {
    int v41 = 138412546;
    uint64_t v42 = objc_opt_class(self);
    __int16 v43 = 2048;
    __int128 v44 = (NSMutableOrderedSet *)[a3 count];
    LODWORD(v38) = 22;
    uint64_t v17 = _os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  1LL,  "%@: Reconciling %lu software downloads",  &v41,  v38);
    if (v17)
    {
      id v18 = (void *)v17;
      unsigned int v19 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v17, 4LL);
      free(v18);
      uint64_t v36 = v19;
      SSFileLog(v13, @"%@");
    }
  }

  id v40 = @"bundle_id";
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_100006B24;
  v39[3] = &unk_10034ADF8;
  v39[4] = a3;
  v39[5] = v12;
  objc_msgSend( +[DownloadEntity queryWithDatabase:predicate:]( DownloadEntity,  "queryWithDatabase:predicate:",  -[DownloadsSession database](self, "database", v36),  v11),  "enumeratePersistentIDsAndProperties:count:usingBlock:",  &v40,  1,  v39);
  if (-[NSMutableOrderedSet count](v12, "count"))
  {
    id v20 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v20) {
      id v20 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v21 = [v20 shouldLog];
    else {
      LODWORD(v22) = v21;
    }
    uint64_t v23 = (os_log_s *)[v20 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v22 = v22;
    }
    else {
      v22 &= 2u;
    }
    if ((_DWORD)v22)
    {
      uint64_t v24 = objc_opt_class(self);
      __int16 v25 = (NSMutableOrderedSet *)-[NSMutableOrderedSet count](v12, "count");
      int v41 = 138412546;
      uint64_t v42 = v24;
      __int16 v43 = 2048;
      __int128 v44 = v25;
      LODWORD(v38) = 22;
      uint64_t v26 = _os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "%@: Cancel %lu downloads during software reconciliation",  &v41,  v38);
      if (v26)
      {
        double v27 = (void *)v26;
        double v28 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v26, 4LL);
        free(v27);
        v37 = v28;
        SSFileLog(v20, @"%@");
      }
    }

    -[DownloadsTransaction finishDownloadsWithIdentifiers:finalPhase:]( self,  "finishDownloadsWithIdentifiers:finalPhase:",  v12,  v10,  v37);
    id v29 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v29) {
      id v29 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v30 = [v29 shouldLog];
    else {
      LODWORD(v31) = v30;
    }
    double v32 = (os_log_s *)[v29 OSLogObject];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
      uint64_t v31 = v31;
    }
    else {
      v31 &= 2u;
    }
    if ((_DWORD)v31)
    {
      uint64_t v33 = objc_opt_class(self);
      int v41 = 138412546;
      uint64_t v42 = v33;
      __int16 v43 = 2112;
      __int128 v44 = v12;
      LODWORD(v38) = 22;
      uint64_t v34 = _os_log_send_and_compose_impl( v31,  0LL,  0LL,  0LL,  &_mh_execute_header,  v32,  2LL,  "%@: Finished reconciling downloads with IDs: %@",  &v41,  v38);
      if (v34)
      {
        uint64_t v35 = (void *)v34;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v34, 4LL);
        free(v35);
        SSFileLog(v29, @"%@");
      }
    }
  }
}

- (BOOL)resetDownloadsMatchingPredicate:(id)a3
{
  return -[DownloadsTransaction resetDownloadsMatchingPredicate:isUserInitiated:]( self,  "resetDownloadsMatchingPredicate:isUserInitiated:",  a3,  1LL);
}

- (BOOL)resetDownloadsMatchingPredicate:(id)a3 isUserInitiated:(BOOL)a4
{
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  v20[0] = @"is_automatic";
  v20[1] = @"download_state.blocked_reason";
  v20[2] = @"is_private";
  v20[3] = @"kind";
  v20[4] = @"download_state.phase";
  v20[5] = @"download_state.restore_state";
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100006D68;
  v10[3] = &unk_10034AE20;
  id v11 = -[DownloadsSession database](self, "database");
  double v12 = self;
  BOOL v15 = a4;
  id v13 = v7;
  unsigned int v14 = &v16;
  objc_msgSend( +[DownloadEntity queryWithDatabase:predicate:]( DownloadEntity,  "queryWithDatabase:predicate:",  v11,  a3),  "enumeratePersistentIDsAndProperties:count:usingBlock:",  v20,  6,  v10);
  if (*((_BYTE *)v17 + 24) && -[NSMutableOrderedSet count](v7, "count")) {
    -[DownloadsChangeset addDownloadsToPipelineWithIDs:](self->super._changeset, "addDownloadsToPipelineWithIDs:", v7);
  }

  char v8 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v8;
}

- (BOOL)resetDownloadsWithIdentifiers:(id)a3
{
  return -[DownloadsTransaction resetDownloadsWithIdentifiers:isUserInitiated:]( self,  "resetDownloadsWithIdentifiers:isUserInitiated:",  a3,  1LL);
}

- (BOOL)resetDownloadsWithIdentifiers:(id)a3 isUserInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v15 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  v22[0] = @"is_automatic";
  v22[1] = @"download_state.blocked_reason";
  v22[2] = @"is_private";
  v22[3] = @"kind";
  v22[4] = @"download_state.phase";
  v22[5] = @"download_state.restore_state";
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(a3);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        double v12 = -[DownloadEntity initWithPersistentID:inDatabase:]( [DownloadEntity alloc],  "initWithPersistentID:inDatabase:",  [v11 longLongValue],  -[DownloadsSession database](self, "database"));
        -[DownloadEntity getValues:forProperties:count:](v12, "getValues:forProperties:count:", v20, v22, 6LL);
        if (-[DownloadsTransaction _resetDownload:withValues:isUserIntiated:]( self,  "_resetDownload:withValues:isUserIntiated:",  v12,  v20,  v4))
        {
          -[NSMutableOrderedSet addObject:](v15, "addObject:", v11);
        }
      }

      id v8 = [a3 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }

    while (v8);
  }

  id v13 = -[NSMutableOrderedSet count](v15, "count");
  if (v13) {
    -[DownloadsChangeset addDownloadsToPipelineWithIDs:](self->super._changeset, "addDownloadsToPipelineWithIDs:", v15);
  }

  return v13 != 0LL;
}

- (BOOL)restartDownloadsWithIdentifiers:(id)a3
{
  id v5 = -[DownloadsSession database](self, "database");
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id obj = a3;
  id v6 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v11 = objc_autoreleasePoolPush();
        double v12 = -[DownloadEntity initWithPersistentID:inDatabase:]( [DownloadEntity alloc],  "initWithPersistentID:inDatabase:",  [v10 longLongValue],  v5);
        -[DownloadsChangeset addDownloadKind:]( self->super._changeset,  "addDownloadKind:",  -[DownloadEntity downloadKind](v12, "downloadKind"));
        -[DownloadsChangeset addStatusChangedDownloadID:]( self->super._changeset,  "addStatusChangedDownloadID:",  -[DownloadEntity persistentID](v12, "persistentID"));

        objc_autoreleasePoolPop(v11);
      }

      id v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  -[DownloadsChangeset restartDownloadsInPipelineWithIDs:]( self->super._changeset,  "restartDownloadsInPipelineWithIDs:",  obj);
  -[DownloadsChangeset addDownloadChangeTypes:](self->super._changeset, "addDownloadChangeTypes:", 2LL);
  return 1;
}

- (BOOL)retryDownloadWithIdentifier:(int64_t)a3
{
  BOOL v4 = -[NSOrderedSet initWithObjects:]( objc_alloc(&OBJC_CLASS___NSOrderedSet),  "initWithObjects:",  +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3),  0LL);
  LOBYTE(self) = -[DownloadsTransaction retryDownloadsWithIdentifiers:](self, "retryDownloadsWithIdentifiers:", v4);

  return (char)self;
}

- (BOOL)retryDownloadsWithIdentifiers:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = -[DownloadEntity initWithPersistentID:inDatabase:]( [DownloadEntity alloc],  "initWithPersistentID:inDatabase:",  [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) longLongValue],  -[DownloadsSession database](self, "database"));
        -[DownloadsExternalTransaction unionChangeset:]( self,  "unionChangeset:",  -[DownloadEntity retryDownload](v9, "retryDownload"));

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return 1;
}

- (BOOL)updateDownloadEntityWithIdentifier:(int64_t)a3 withDownload:(id)a4
{
  uint64_t v7 = -[DownloadEntity initWithPersistentID:inDatabase:]( objc_alloc(&OBJC_CLASS___DownloadEntity),  "initWithPersistentID:inDatabase:",  a3,  -[DownloadsSession database](self, "database"));
  id v8 = [a4 externalPropertyValues];
  if (![v8 objectForKey:SSDownloadExternalPropertyPolicy])
  {
    id v9 = [a4 downloadPolicy];
    if (v9) {
      objc_msgSend( a4,  "setValue:forProperty:",  +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  -[DownloadPolicyManager addDownloadPolicy:]( -[DownloadsSession policyManager](self, "policyManager"),  "addDownloadPolicy:",  v9)),  @"policy_id");
    }
  }

  if (v8) {
    -[DownloadsExternalTransaction setExternalPropertyValues:forDownloadWithID:]( self,  "setExternalPropertyValues:forDownloadWithID:",  v8,  a3);
  }
  -[DownloadEntity setValuesWithDictionary:](v7, "setValuesWithDictionary:", [a4 propertyValues]);
  id v10 = -[DownloadEntity setAssetsUsingDownload:](v7, "setAssetsUsingDownload:", a4);
  if (v10)
  {
    id v11 = [a4 valueForProperty:@"kind"];
    if ((SSDownloadKindIsMediaKind(v11) & 1) != 0)
    {
      id v12 = -[DownloadEntity copyDownloadingIPodLibraryItem](v7, "copyDownloadingIPodLibraryItem");
      if (v12)
      {
        __int128 v13 = v12;
        -[DownloadsChangeset addIPodLibraryItem:](self->super._changeset, "addIPodLibraryItem:", v12);
      }
    }

    -[DownloadsChangeset addDownloadChangeTypes:](self->super._changeset, "addDownloadChangeTypes:", 16LL);
    -[DownloadsChangeset addDownloadKind:](self->super._changeset, "addDownloadKind:", v11);
    -[DownloadsChangeset addDownloadToPipelineWithID:](self->super._changeset, "addDownloadToPipelineWithID:", a3);
    -[DownloadsChangeset addUpdatedDownloadID:](self->super._changeset, "addUpdatedDownloadID:", a3);
    -[DownloadsChangeset unionChangeset:](self->super._changeset, "unionChangeset:", v10);
  }

  return v10 != 0LL;
}

- (void)setValue:(id)a3 forExternalProperty:(id)a4 ofDownloadID:(int64_t)a5
{
  if ([a4 isEqualToString:SSDownloadExternalPropertyPolicy])
  {
    -[DownloadsTransaction _setPolicy:forDownloadWithID:](self, "_setPolicy:forDownloadWithID:", a3, a5);
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___DownloadsTransaction;
    -[DownloadsExternalTransaction setValue:forExternalProperty:ofDownloadID:]( &v9,  "setValue:forExternalProperty:ofDownloadID:",  a3,  a4,  a5);
  }

- (id)_addEffectiveClientWithBundleID:(id)a3 database:(id)a4
{
  uint64_t v17 = 0LL;
  __int128 v18 = &v17;
  uint64_t v19 = 0x3052000000LL;
  id v20 = sub_1000077DC;
  unsigned int v21 = sub_1000077EC;
  uint64_t v22 = 0LL;
  id v6 = +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  a3);
  uint64_t v23 = @"effective_client_id";
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000077F8;
  v16[3] = &unk_10034AE48;
  v16[4] = &v17;
  objc_msgSend( +[DownloadApplicationIdentifierEntity queryWithDatabase:predicate:]( DownloadApplicationIdentifierEntity,  "queryWithDatabase:predicate:",  a4,  v6),  "enumeratePersistentIDsAndProperties:count:usingBlock:",  &v23,  1,  v16);
  uint64_t v7 = (void *)v18[5];
  if (!v7)
  {
    id v8 = +[DownloadApplicationIdentifierEntity maxValueForProperty:predicate:database:]( &OBJC_CLASS___DownloadApplicationIdentifierEntity,  "maxValueForProperty:predicate:database:",  @"effective_client_id",  0LL,  a4);
    objc_super v9 = objc_alloc(&OBJC_CLASS___NSNumber);
    else {
      uint64_t v10 = 1000LL;
    }
    id v11 = -[NSNumber initWithLongLong:](v9, "initWithLongLong:", v10);
    v18[5] = (uint64_t)v11;
    id v12 = objc_alloc(&OBJC_CLASS___NSDictionary);
    __int128 v13 = -[NSDictionary initWithObjectsAndKeys:]( v12,  "initWithObjectsAndKeys:",  v18[5],  @"effective_client_id",  a3,  @"bundle_id",  0LL);

    uint64_t v7 = (void *)v18[5];
  }

  id v14 = v7;
  _Block_object_dispose(&v17, 8);
  return v14;
}

- (id)_copyEffectiveBundleIDForDownload:(id)a3
{
  id v4 = [a3 valueForProperty:@"override_audit_token_data"];
  if (v4)
  {
    id v5 = v4;
    if ([v4 length] == (id)32)
    {
      [v5 getBytes:v7 length:32];
      return (id)CPCopyBundleIdentifierFromAuditToken(v7, 0LL);
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    id result = [a3 valueForProperty:@"application_id.bundle_id"];
    if (!result) {
      return [a3 valueForProperty:@"client_id"];
    }
  }

  return result;
}

- (BOOL)_moveDownloadWithID:(int64_t)a3 relativeToDownloadWithID:(int64_t)a4 comparisonType:(int64_t)a5
{
  id v8 = -[DownloadEntity initWithPersistentID:inDatabase:]( objc_alloc(&OBJC_CLASS___DownloadEntity),  "initWithPersistentID:inDatabase:",  a3,  -[DownloadsSession database](self, "database"));
  objc_super v9 = -[DownloadEntity downloadKind](v8, "downloadKind");
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = -[DownloadEntity initWithPersistentID:inDatabase:]( objc_alloc(&OBJC_CLASS___DownloadEntity),  "initWithPersistentID:inDatabase:",  a4,  -[DownloadsSession database](self, "database"));
    id v12 = -[DownloadEntity valueForProperty:](v11, "valueForProperty:", @"order_key");
    BOOL v13 = v12 != 0LL;
    if (v12)
    {
      [v12 doubleValue];
      double v15 = v14;
      -[DownloadsTransaction _orderKeyAdjacentToOrderKey:comparisonType:]( self,  "_orderKeyAdjacentToOrderKey:comparisonType:",  a5);
      if (a5 == 3) {
        double v17 = v16;
      }
      else {
        double v17 = v15;
      }
      -[DownloadEntity setValue:forProperty:]( v8,  "setValue:forProperty:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v17 + vabdd_f64(v15, v16) * 0.5),  @"order_key");
      -[DownloadsChangeset addDownloadChangeTypes:](self->super._changeset, "addDownloadChangeTypes:", 1LL);
      -[DownloadsChangeset addDownloadKind:](self->super._changeset, "addDownloadKind:", v10);
    }
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)_newTransactionForDownload:(id)a3 inDatabase:(id)a4
{
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v7 = [a3 valueForProperty:@"kind"];
  if ([v7 isEqualToString:SSDownloadKindSoftwareApplication])
  {
    else {
      uint64_t v8 = 1LL;
    }
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  -[NSMutableDictionary setObject:forKey:]( v6,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v8),  @"type");
  id v9 = [a3 valueForProperty:@"bundle_id"];
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v9, @"bundle_id");
  }
  id v11 = -[TransactionEntity initWithPropertyValues:inDatabase:]( objc_alloc(&OBJC_CLASS___TransactionEntity),  "initWithPropertyValues:inDatabase:",  v6,  a4);

  return v11;
}

- (double)_orderKeyAdjacentToOrderKey:(double)a3 comparisonType:(int64_t)a4
{
  uint64_t v15 = 0LL;
  double v16 = &v15;
  uint64_t v17 = 0x3052000000LL;
  __int128 v18 = sub_1000077DC;
  uint64_t v19 = sub_1000077EC;
  uint64_t v20 = 0LL;
  id v7 = objc_alloc_init(&OBJC_CLASS___SSSQLiteQueryDescriptor);
  [v7 setEntityClass:objc_opt_class(DownloadEntity)];
  [v7 setLimitCount:1];
  if (a4 == 3) {
    objc_msgSend( v7,  "setOrderingDirections:",  +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", SSSQLiteOrderDescending));
  }
  objc_msgSend( v7,  "setOrderingProperties:",  +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", @"order_key"));
  objc_msgSend( v7,  "setPredicate:",  +[SSSQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( SSSQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"order_key",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3),  a4));
  uint64_t v8 = -[SSSQLiteQuery initWithDatabase:descriptor:]( objc_alloc(&OBJC_CLASS___SSSQLiteQuery),  "initWithDatabase:descriptor:",  -[DownloadsSession database](self, "database"),  v7);
  unsigned int v21 = @"order_key";
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100007DA0;
  v14[3] = &unk_10034AE48;
  v14[4] = &v15;
  -[SSSQLiteQuery enumeratePersistentIDsAndProperties:count:usingBlock:]( v8,  "enumeratePersistentIDsAndProperties:count:usingBlock:",  &v21,  1LL,  v14);

  id v9 = (void *)v16[5];
  if (v9)
  {
    [v9 doubleValue];
    double v11 = v10;
  }

  else
  {
    [(id)objc_opt_class(self) orderKeyIncrement];
    if (a4 == 5) {
      double v11 = v12 + a3;
    }
    else {
      double v11 = a3 - v12;
    }
  }

  _Block_object_dispose(&v15, 8);
  return v11;
}

- (BOOL)_resetDownload:(id)a3 withValues:(const void *)a4 isUserIntiated:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = [(id)*a4 integerValue];
  BOOL v10 = ([(id)a4[4] isEqualToString:SSDownloadPhaseFailed] & 1) != 0
     || ([(id)a4[4] isEqualToString:SSDownloadPhasePaused] & 1) != 0
     || [(id)a4[1] integerValue] != 0;
  unsigned int v11 = [(id)a4[2] BOOLValue];
  if (v9) {
    unsigned int v12 = v11;
  }
  else {
    unsigned int v12 = 0;
  }
  if (!v10 && !v12) {
    return 0;
  }
  double v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:]( v14,  "setObject:forKey:",  SSDownloadPhaseWaiting,  @"download_state.phase");
  -[NSMutableDictionary setObject:forKey:]( v14,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL),  @"download_state.restore_state");
  -[NSMutableDictionary setObject:forKey:]( v14,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL),  @"download_state.blocked_reason");
  -[NSMutableDictionary setObject:forKey:]( v14,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL),  @"store_preorder_id");
  -[NSMutableDictionary setObject:forKey:]( v14,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL),  @"download_state.store_queue_refresh_count");
  id v15 = [a3 persistentID];
  if (v9) {
    char v16 = v10;
  }
  else {
    char v16 = 1;
  }
  id v17 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  id v18 = v17;
  if ((v16 & 1) != 0 || !v5)
  {
    if (!v17) {
      id v18 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v28 = [v18 shouldLog];
    else {
      LODWORD(v29) = v28;
    }
    unsigned int v30 = (os_log_s *)[v18 OSLogObject];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
      uint64_t v29 = v29;
    }
    else {
      v29 &= 2u;
    }
    if ((_DWORD)v29)
    {
      int v36 = 138412546;
      uint64_t v37 = objc_opt_class(self);
      __int16 v38 = 2048;
      id v39 = v15;
      uint64_t v31 = _os_log_send_and_compose_impl( v29,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  1LL,  "%@: Reset download: %lld",  &v36,  22);
      if (v31)
      {
        double v32 = (void *)v31;
        uint64_t v33 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v31, 4LL);
        free(v32);
        uint64_t v35 = v33;
        SSFileLog(v18, @"%@");
      }
    }

    uint64_t v27 = 18LL;
  }

  else
  {
    if (!v17) {
      id v18 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v19 = [v18 shouldLog];
    else {
      LODWORD(v20) = v19;
    }
    unsigned int v21 = (os_log_s *)[v18 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
      uint64_t v20 = v20;
    }
    else {
      v20 &= 2u;
    }
    if ((_DWORD)v20)
    {
      int v36 = 138412546;
      uint64_t v37 = objc_opt_class(self);
      __int16 v38 = 2048;
      id v39 = v15;
      uint64_t v22 = _os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  1LL,  "%@: Reset automatic download: %lld",  &v36,  22);
      if (v22)
      {
        uint64_t v23 = (void *)v22;
        uint64_t v24 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v22, 4LL);
        free(v23);
        uint64_t v35 = v24;
        SSFileLog(v18, @"%@");
      }
    }

    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", &off_10036D560, @"is_automatic", v35);
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", &__kCFBooleanFalse, @"is_private");
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", &off_10036D578, @"priority");
    __int16 v25 = objc_alloc(&OBJC_CLASS___SSDownloadPolicy);
    uint64_t v26 = -[SSDownloadPolicy initWithDownloadKind:URLBagType:]( v25,  "initWithDownloadKind:URLBagType:",  SSDownloadKindSoftwareApplication,  0LL);
    -[NSMutableDictionary setObject:forKey:]( v14,  "setObject:forKey:",  +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[DownloadPolicyManager addDownloadPolicy:]( -[DownloadsSession policyManager](self, "policyManager"),  "addDownloadPolicy:",  v26)),  @"policy_id");

    -[DownloadsChangeset addPolicyChangedDownloadID:](self->super._changeset, "addPolicyChangedDownloadID:", v15);
    uint64_t v27 = 19LL;
  }

  if (objc_msgSend((id)a4[5], "integerValue", v35))
  {
    v27 |= 0x20uLL;
    -[DownloadsChangeset addRestorableDownloadID:](self->super._changeset, "addRestorableDownloadID:", v15);
  }

  -[DownloadsChangeset addDownloadChangeTypes:](self->super._changeset, "addDownloadChangeTypes:", v27);
  -[DownloadsChangeset addDownloadKind:](self->super._changeset, "addDownloadKind:", a4[3]);
  -[DownloadsChangeset addStatusChangedDownloadID:](self->super._changeset, "addStatusChangedDownloadID:", v15);
  -[DownloadsChangeset addUpdatedDownloadID:](self->super._changeset, "addUpdatedDownloadID:", v15);
  unsigned __int8 v13 = [a3 setValuesWithDictionary:v14];

  return v13;
}

- (void)_setPolicy:(id)a3 forDownloadWithID:(int64_t)a4
{
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNull);
  if ((objc_opt_isKindOfClass(a3, v7) & 1) != 0)
  {
    int64_t v8 = 0LL;
LABEL_3:
    unsigned __int8 v13 = -[DownloadEntity initWithPersistentID:inDatabase:]( objc_alloc(&OBJC_CLASS___DownloadEntity),  "initWithPersistentID:inDatabase:",  a4,  -[DownloadsSession database](self, "database"));
    -[DownloadEntity setValue:forProperty:]( v13,  "setValue:forProperty:",  +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v8),  @"policy_id");
    -[DownloadsChangeset addDownloadChangeTypes:](self->super._changeset, "addDownloadChangeTypes:", 17LL);
    -[DownloadsChangeset addPolicyChangedDownloadID:](self->super._changeset, "addPolicyChangedDownloadID:", a4);
    -[DownloadsChangeset addUpdatedDownloadID:](self->super._changeset, "addUpdatedDownloadID:", a4);

    return;
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(a3, v9) & 1) != 0)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___SSDownloadPolicy);
    uint64_t ObjectWithArchivedData = SSCodingCreateObjectWithArchivedData(a3, v10);
    if (ObjectWithArchivedData)
    {
      unsigned int v12 = (void *)ObjectWithArchivedData;
      int64_t v8 = -[DownloadPolicyManager addDownloadPolicy:]( -[DownloadsSession policyManager](self, "policyManager"),  "addDownloadPolicy:",  ObjectWithArchivedData);

      if (v8 != -1) {
        goto LABEL_3;
      }
    }
  }

@end