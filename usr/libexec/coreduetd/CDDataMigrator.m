@interface CDDataMigrator
+ (BOOL)dkcMigration;
+ (BOOL)logMigration;
+ (BOOL)performMigration;
+ (BOOL)spotlightViewerEventsMigration;
+ (id)sharedInstance;
+ (void)_migrateSpotlightEvents;
+ (void)removeFileAtPath:(id)a3;
- (CDDataMigrator)init;
@end

@implementation CDDataMigrator

+ (id)sharedInstance
{
  if (qword_1000226A8 != -1) {
    dispatch_once(&qword_1000226A8, &stru_10001C9C8);
  }
  return (id)qword_1000226A0;
}

- (CDDataMigrator)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CDDataMigrator;
  v2 = -[CDDataMigrator init](&v9, "init");
  if (v2
    && (int out_token = 0,
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL),
        v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue),
        uint32_t v5 = notify_register_dispatch("com.apple.datamigrator.migrationDidFinish", &out_token, v4, &stru_10001CA08),
        v4,
        v5))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100011E2C(v5);
    }
    v6 = 0LL;
  }

  else
  {
    v6 = v2;
  }

  return v6;
}

+ (BOOL)performMigration
{
  v2 = _os_activity_create( (void *)&_mh_execute_header,  "Duet: CDDataMigrator performMigration",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &v10);
  os_activity_scope_leave(&v10);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10.opaque[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Beginning CoreDuet Migration....",  (uint8_t *)&v10,  2u);
  }

  v3 = (void *)os_transaction_create("com.apple.coreduet.migrator.perform-migration");
  v4 = objc_autoreleasePoolPush();
  unsigned int v5 = !+[CDDataMigrator logMigration](&OBJC_CLASS___CDDataMigrator, "logMigration");
  objc_autoreleasePoolPop(v4);
  v6 = objc_autoreleasePoolPush();
  uint64_t v7 = !+[CDDataMigrator dkcMigration](&OBJC_CLASS___CDDataMigrator, "dkcMigration") + v5;
  objc_autoreleasePoolPop(v6);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
    LODWORD(v10.opaque[0]) = 138412290;
    *(uint64_t *)((char *)v10.opaque + 4) = (uint64_t)v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Finished CoreDuet migration with %@ errors.",  (uint8_t *)&v10,  0xCu);
  }

  return (_DWORD)v7 == 0;
}

+ (BOOL)logMigration
{
  v2 = _os_activity_create( (void *)&_mh_execute_header,  "Duet: CDDataMigrator logMigration",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &v4);
  os_activity_scope_leave(&v4);

  return 1;
}

+ (void)removeFileAtPath:(id)a3
{
  id v3 = a3;
  os_activity_scope_state_s v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v8 = 0LL;
    [v6 removeItemAtPath:v3 error:&v8];
    id v7 = v8;

    if (v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100011F1C();
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      sub_100011EA8();
    }
  }
}

+ (BOOL)dkcMigration
{
  v2 = _os_activity_create( (void *)&_mh_execute_header,  "Duet: CDDataMigrator dkcMigration",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &v5);
  os_activity_scope_leave(&v5);

  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[_DKKnowledgeStore knowledgeStoreWithDirectReadOnlyAccess]( &OBJC_CLASS____DKKnowledgeStore,  "knowledgeStoreWithDirectReadOnlyAccess"));
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100011F9C();
  }

  return v3 != 0LL;
}

+ (void)_migrateSpotlightEvents
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  sqlite3_open("/var/mobile/Library/CoreDuet/coreduetdClassD.db", &ppDb);
  os_activity_scope_state_s v4 = (const char *)objc_msgSend( @"SELECT ZINTEGERID from ZCDDMATTRIBUTENAMEMAPPER where ZNAME==com.apple.spotlightviewer.events;",
                       "UTF8String");
  sqlite3_exec(ppDb, v4, (int (__cdecl *)(void *, int, char **, char **))sub_100010EBC, 0LL, 0LL);
  sqlite3_close(ppDb);
  ppDb = 0LL;
  if (!qword_1000226B0)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](&OBJC_CLASS____CDLogging, "knowledgeChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Couldn't find spotlight viewer events",  buf,  2u);
    }

    goto LABEL_12;
  }

  sqlite3_open("/var/mobile/Library/CoreDuet/coreduetd.db", &v14);
  id v5 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"SELECT ZVALUE,ZCREATIONDATE from ZCDDMSTRINGATTRIBUTE where ZINTEGERID==%lld", qword_1000226B0));
  v6 = (const char *)[v5 UTF8String];

  sqlite3_exec(v14, v6, (int (__cdecl *)(void *, int, char **, char **))sub_100010F38, v2, 0LL);
  sqlite3_close(v14);
  v14 = 0LL;
  if ([v2 count])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](&OBJC_CLASS____DKKnowledgeStore, "knowledgeStore"));
    id v13 = 0LL;
    [v7 saveObjects:v2 error:&v13];
    id v8 = (os_log_s *)v13;
    if (v8)
    {
      objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](&OBJC_CLASS____CDLogging, "knowledgeChannel"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100011FE0();
      }
    }

    os_activity_scope_state_s v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](&OBJC_CLASS____CDLogging, "knowledgeChannel"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      [v3 timeIntervalSinceNow];
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", -v11));
      *(_DWORD *)buf = 138412290;
      v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Migration took %@", buf, 0xCu);
    }

LABEL_12:
  }
}

+ (BOOL)spotlightViewerEventsMigration
{
  id v3 = _os_activity_create( (void *)&_mh_execute_header,  "Duet: CDDataMigrator spotlightViewerEventsMigration",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  os_activity_scope_state_s v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](&OBJC_CLASS____CDLogging, "knowledgeChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Migrating spotlight events!",  (uint8_t *)&state,  2u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v5 = [v15 fileExistsAtPath:@"/var/mobile/Library/CoreDuet/coreduetd.db"];
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](&OBJC_CLASS____CDLogging, "knowledgeChannel"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(state.opaque[0]) = 67109120;
    HIDWORD(state.opaque[0]) = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Old DB Exists: %u", (uint8_t *)&state, 8u);
  }

  if (v5)
  {
    id v7 = objc_autoreleasePoolPush();
    [a1 _migrateSpotlightEvents];
    objc_autoreleasePoolPop(v7);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v8 = [&off_10001E158 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(&off_10001E158);
          }
          v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/var/mobile/Library/CoreDuet/%@",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)i)));
          id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](&OBJC_CLASS____CDLogging, "knowledgeChannel"));
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(state.opaque[0]) = 138412290;
            *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v12;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Deleting file: %@",  (uint8_t *)&state,  0xCu);
          }

          +[CDDataMigrator removeFileAtPath:](&OBJC_CLASS___CDDataMigrator, "removeFileAtPath:", v12);
        }

        id v9 = [&off_10001E158 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v9);
    }
  }

  return 1;
}

@end