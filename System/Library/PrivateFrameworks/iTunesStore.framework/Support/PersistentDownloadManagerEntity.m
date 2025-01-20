@interface PersistentDownloadManagerEntity
+ (id)databaseTable;
+ (id)foreignDatabaseTablesToDelete;
+ (id)foreignKeyColumnForTable:(id)a3;
+ (void)initialize;
- (id)finishPersistentDownloadsWithDownloadIDs:(id)a3;
- (void)performNewsstandMigration1InDatabase:(id)a3;
@end

@implementation PersistentDownloadManagerEntity

- (id)finishPersistentDownloadsWithDownloadIDs:(id)a3
{
  v41 = objc_alloc_init(&OBJC_CLASS___DownloadsChangeset);
  id v5 = -[PersistentDownloadManagerEntity database](self, "database");
  v42 = self;
  id obj = a3;
  v45 = +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"manager_id",  -[PersistentDownloadManagerEntity persistentID](self, "persistentID"));
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v47 objects:v59 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v46 = *(void *)v48;
    uint64_t v40 = SSDownloadMetadataKeyFileExtensionMoviePackage;
    uint64_t v43 = SSDownloadPhaseFailed;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v48 != v46) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)i);
        v10 = -[DownloadEntity initWithPersistentID:inDatabase:]( [DownloadEntity alloc],  "initWithPersistentID:inDatabase:",  [v9 longLongValue],  v5);
        v58[0] = @"kind";
        v58[1] = @"download_state.phase";
        v58[2] = @"is_hls";
        -[DownloadEntity getValues:forProperties:count:](v10, "getValues:forProperties:count:", &v55, v58, 3LL);
        v11 = v57;
        if ((objc_opt_respondsToSelector(v57, "BOOLValue") & 1) != 0) {
          unsigned int v12 = [v11 BOOLValue];
        }
        else {
          unsigned int v12 = 0;
        }
        v13 = v55;
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0) {
          v13 = 0LL;
        }
        if (SSDownloadPhaseIsUnsuccessful(v56))
        {
          if (v12)
          {
            if (SSDownloadKindIsMediaKind(v13))
            {
              id v15 = +[DownloadAssetEntity anyInDatabase:predicate:]( &OBJC_CLASS___DownloadAssetEntity,  "anyInDatabase:predicate:",  v5,  +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"download_id",  v9),  +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"is_hls",  &__kCFBooleanTrue),  0LL)));
              if (v15)
              {
                id v16 = [sub_10015AF78(v13) stringByAppendingPathComponent:-[NSString stringByAppendingPathExtension:]( +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%lld", objc_msgSend(v15, "persistentID")), "stringByAppendingPathExtension:", v40)];
                if (v16)
                {
                  id v17 = v16;
                  LOBYTE(v51) = 0;
                  unsigned int v18 = -[NSFileManager fileExistsAtPath:isDirectory:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:isDirectory:",  v16,  &v51);
                  if ((_BYTE)v51)
                  {
                    if (v18)
                    {
                      unsigned int v39 = -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v17,  0LL);
                      id v19 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
                      if (!v19) {
                        id v19 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
                      }
                      LODWORD(v20) = [v19 shouldLog];
                      v21 = (os_log_s *)[v19 OSLogObject];
                      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
                        uint64_t v20 = v20;
                      }
                      else {
                        v20 &= 2u;
                      }
                      if ((_DWORD)v20)
                      {
                        uint64_t v22 = objc_opt_class(v42);
                        int v51 = 138412802;
                        uint64_t v52 = v22;
                        __int16 v53 = 1024;
                        LODWORD(v54[0]) = v39;
                        WORD2(v54[0]) = 2112;
                        *(void *)((char *)v54 + 6) = v9;
                        LODWORD(v38) = 28;
                        uint64_t v23 = _os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  2LL,  "%@: Remove successful '%d' of media file for persistent download: %@",  &v51,  v38);
                        if (v23)
                        {
                          v24 = (void *)v23;
                          v25 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v23,  4LL);
                          free(v24);
                          v36 = v25;
                          SSFileLog(v19, @"%@");
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }

        if ((SSDownloadPhaseIsFinishedPhase(v56) & 1) != 0 || [v56 isEqualToString:v43])
        {
          id v26 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", v36);
          if (!v26) {
            id v26 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
          }
          unsigned int v27 = [v26 shouldLog];
          else {
            LODWORD(v28) = v27;
          }
          v29 = (os_log_s *)[v26 OSLogObject];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO)) {
            uint64_t v28 = v28;
          }
          else {
            v28 &= 2u;
          }
          if ((_DWORD)v28)
          {
            uint64_t v30 = objc_opt_class(v42);
            int v51 = 138412546;
            uint64_t v52 = v30;
            __int16 v53 = 2112;
            v54[0] = v9;
            LODWORD(v38) = 22;
            uint64_t v31 = _os_log_send_and_compose_impl( v28,  0LL,  0LL,  0LL,  &_mh_execute_header,  v29,  1LL,  "%@: Finishing persistent download: %@",  &v51,  v38);
            if (v31)
            {
              v32 = (void *)v31;
              v33 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v31,  4LL);
              free(v32);
              v37 = v33;
              SSFileLog(v26, @"%@");
            }
          }

          v34 = +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"download_id",  v9,  v37);
          objc_msgSend( +[PersistentDownloadEntity queryWithDatabase:predicate:]( PersistentDownloadEntity,  "queryWithDatabase:predicate:",  v5,  +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v34, v45, 0))),  "deleteAllEntities");
          if (!+[PersistentDownloadEntity anyInDatabase:predicate:]( &OBJC_CLASS___PersistentDownloadEntity,  "anyInDatabase:predicate:",  v5,  v34))
          {
            -[DownloadEntity deleteFromDatabase](v10, "deleteFromDatabase");
            -[DownloadsChangeset addDownloadChangeTypes:](v41, "addDownloadChangeTypes:", 8LL);
            -[DownloadsChangeset addDownloadKind:](v41, "addDownloadKind:", v55);
            -[DownloadsChangeset addRemovedDownloadID:]( v41,  "addRemovedDownloadID:",  -[DownloadEntity persistentID](v10, "persistentID"));
          }
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v47 objects:v59 count:16];
    }

    while (v7);
  }

  return v41;
}

- (void)performNewsstandMigration1InDatabase:(id)a3
{
  v9 = @"download_id";
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000A3CF4;
  v5[3] = &unk_10034D448;
  id v6 = a3;
  id v7 = -[PersistentDownloadManagerEntity valueForProperty:](self, "valueForProperty:", @"client_id");
  v8 = self;
  objc_msgSend( +[PersistentDownloadEntity queryWithDatabase:predicate:]( PersistentDownloadEntity,  "queryWithDatabase:predicate:",  v6,  +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"manager_id",  -[PersistentDownloadManagerEntity persistentID](self, "persistentID"))),  "enumeratePersistentIDsAndProperties:count:usingBlock:",  &v9,  1,  v5);
  v4 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 1LL),  @"migration_version",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  @"filters_external_downloads",  0LL);
  -[PersistentDownloadManagerEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v4);
}

+ (id)databaseTable
{
  return @"persistent_manager";
}

+ (id)foreignDatabaseTablesToDelete
{
  return (id)qword_1003A3320;
}

+ (id)foreignKeyColumnForTable:(id)a3
{
  return [(id)qword_1003A3328 objectForKey:a3];
}

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___PersistentDownloadManagerEntity) == a1)
  {
    qword_1003A3328 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  @"persistent_download",  @"manager_id",  @"persistent_manager_kind",  0LL);
    qword_1003A3320 = -[NSSet initWithObjects:]( objc_alloc(&OBJC_CLASS___NSSet),  "initWithObjects:",  @"persistent_download",  @"persistent_manager_kind",  0LL);
  }

@end