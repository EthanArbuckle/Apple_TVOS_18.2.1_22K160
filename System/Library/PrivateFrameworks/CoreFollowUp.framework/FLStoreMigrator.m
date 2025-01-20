@interface FLStoreMigrator
- (FLSQLiteExecutor)queryExecutor;
- (FLStoreMigrator)initWithExecutor:(id)a3;
- (int64_t)_schemaVersion;
- (void)_createCleanCurrentDatabase;
- (void)_createCurrentDatabaseWithTableSuffix:(id)a3;
- (void)_dropTables;
- (void)_migrateFujitailToCurrent;
- (void)_migrateSchema:(int64_t)a3 toSchema:(int64_t)a4;
- (void)_migrateToCurrentFrom:(int64_t)a3;
- (void)migrateSchemeIfNecessary;
- (void)setQueryExecutor:(id)a3;
@end

@implementation FLStoreMigrator

- (FLStoreMigrator)initWithExecutor:(id)a3
{
  id v5 = a3;
  v6 = -[FLStoreMigrator init](self, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queryExecutor, a3);
  }

  return v7;
}

- (void)migrateSchemeIfNecessary
{
  int64_t v3 = -[FLStoreMigrator _schemaVersion](self, "_schemaVersion");
  if (v3 != 23) {
    -[FLStoreMigrator _migrateSchema:toSchema:](self, "_migrateSchema:toSchema:", v3, 23LL);
  }
}

- (int64_t)_schemaVersion
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  queryExecutor = self->_queryExecutor;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000D0C8;
  v5[3] = &unk_100018C08;
  v5[4] = &v6;
  -[FLSQLiteExecutor performQuery:rowHandler:]( queryExecutor,  "performQuery:rowHandler:",  @"SELECT value FROM databaseProperties WHERE key='schemaVersion'",  v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_migrateSchema:(int64_t)a3 toSchema:(int64_t)a4
{
  v7 = _os_activity_create( (void *)&_mh_execute_header,  "followup/migration",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);
  uint64_t v10 = _FLLogSystem(v8, v9);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    int64_t v16 = a3;
    __int16 v17 = 2048;
    int64_t v18 = a4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Migrating from %lld to %lld", buf, 0x16u);
  }

  -[FLSQLiteExecutor performQuery:rowHandler:]( self->_queryExecutor,  "performQuery:rowHandler:",  @"pragma foreign_keys=off",  0LL);
  queryExecutor = self->_queryExecutor;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000D2B8;
  v13[3] = &unk_100018C30;
  v13[4] = self;
  v13[5] = a3;
  -[FLSQLiteExecutor performTransactionBlockAndWait:](queryExecutor, "performTransactionBlockAndWait:", v13);
  -[FLSQLiteExecutor performQuery:rowHandler:]( self->_queryExecutor,  "performQuery:rowHandler:",  @"pragma foreign_keys=on",  0LL);
  os_activity_scope_leave(&state);
}

- (void)_createCleanCurrentDatabase
{
}

- (void)_migrateToCurrentFrom:(int64_t)a3
{
  int64_t v3 = self;
  switch(a3)
  {
    case 9LL:
      uint64_t v4 = _FLLogSystem(self, a2);
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v93 = 9LL;
        __int16 v94 = 2048;
        uint64_t v95 = 23LL;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Migrating from %lld to %lld", buf, 0x16u);
      }

      -[FLStoreMigrator _migrateFujitailToCurrent](v3, "_migrateFujitailToCurrent");
      return;
    case 13LL:
      uint64_t v6 = _FLLogSystem(self, a2);
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v93 = 13LL;
        __int16 v94 = 2048;
        uint64_t v95 = 14LL;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Migrating from %lld to %lld", buf, 0x16u);
      }

      queryExecutor = v3->_queryExecutor;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE databaseProperties SET value='%@' WHERE key='schemaVersion'",  &off_100019678));
      -[FLSQLiteExecutor performQuery:](queryExecutor, "performQuery:", v9);

      uint64_t v10 = v3->_queryExecutor;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v11 timeIntervalSince1970];
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ALTER TABLE notifications ADD COLUMN creationDate INTEGER NOT NULL DEFAULT (%f)",  v12));
      -[FLSQLiteExecutor performQuery:](v10, "performQuery:", v13);

      goto LABEL_8;
    case 14LL:
LABEL_8:
      uint64_t v14 = _FLLogSystem(self, a2);
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v93 = 14LL;
        __int16 v94 = 2048;
        uint64_t v95 = 15LL;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Migrating from %lld to %lld", buf, 0x16u);
      }

      int64_t v16 = v3->_queryExecutor;
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE databaseProperties SET value='%@' WHERE key='schemaVersion'",  &off_100019690));
      -[FLSQLiteExecutor performQuery:](v16, "performQuery:", v17);

      int64_t v18 = v3->_queryExecutor;
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ALTER TABLE notifications ADD COLUMN options BLOB"));
      -[FLSQLiteExecutor performQuery:](v18, "performQuery:", v19);

      goto LABEL_11;
    case 15LL:
LABEL_11:
      uint64_t v20 = _FLLogSystem(self, a2);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v93 = 15LL;
        __int16 v94 = 2048;
        uint64_t v95 = 16LL;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Migrating from %lld to %lld", buf, 0x16u);
      }

      v22 = v3->_queryExecutor;
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE databaseProperties SET value='%@' WHERE key='schemaVersion'",  &off_1000196A8));
      -[FLSQLiteExecutor performQuery:](v22, "performQuery:", v23);

      v24 = v3->_queryExecutor;
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ALTER TABLE items ADD COLUMN target_bundle_identifier TEXT"));
      -[FLSQLiteExecutor performQuery:](v24, "performQuery:", v25);

      v26 = v3->_queryExecutor;
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE items SET target_bundle_identifier='%@'",  FLFollowUpPreferencesBundleIdentifier));
      -[FLSQLiteExecutor performQuery:](v26, "performQuery:", v27);

      goto LABEL_14;
    case 16LL:
LABEL_14:
      uint64_t v28 = _FLLogSystem(self, a2);
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v93 = 16LL;
        __int16 v94 = 2048;
        uint64_t v95 = 17LL;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Migrating from %lld to %lld", buf, 0x16u);
      }

      v30 = v3->_queryExecutor;
      v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE databaseProperties SET value='%@' WHERE key='schemaVersion'",  &off_1000196C0));
      -[FLSQLiteExecutor performQuery:](v30, "performQuery:", v31);

      v32 = v3->_queryExecutor;
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ALTER TABLE items ADD COLUMN representing_bundle_path TEXT"));
      -[FLSQLiteExecutor performQuery:](v32, "performQuery:", v33);

      v34 = v3->_queryExecutor;
      v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE items SET representing_bundle_path=NULL"));
      -[FLSQLiteExecutor performQuery:](v34, "performQuery:", v35);

      v36 = v3->_queryExecutor;
      v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ALTER TABLE items ADD COLUMN bundle_icon_name TEXT"));
      -[FLSQLiteExecutor performQuery:](v36, "performQuery:", v37);

      v38 = v3->_queryExecutor;
      v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE items SET bundle_icon_name=NULL"));
      -[FLSQLiteExecutor performQuery:](v38, "performQuery:", v39);

      v40 = v3->_queryExecutor;
      v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ALTER TABLE items ADD COLUMN informative_footer_text TEXT"));
      -[FLSQLiteExecutor performQuery:](v40, "performQuery:", v41);

      v42 = v3->_queryExecutor;
      v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE items SET informative_footer_text=NULL"));
      -[FLSQLiteExecutor performQuery:](v42, "performQuery:", v43);

      goto LABEL_17;
    case 17LL:
LABEL_17:
      uint64_t v44 = _FLLogSystem(self, a2);
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v93 = 17LL;
        __int16 v94 = 2048;
        uint64_t v95 = 18LL;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Migrating from %lld to %lld", buf, 0x16u);
      }

      v46 = v3->_queryExecutor;
      v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE databaseProperties SET value='%@' WHERE key='schemaVersion'",  &off_1000196D8));
      -[FLSQLiteExecutor performQuery:](v46, "performQuery:", v47);

      v48 = v3->_queryExecutor;
      v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ALTER TABLE items ADD COLUMN category_identifier TEXT"));
      -[FLSQLiteExecutor performQuery:](v48, "performQuery:", v49);

      v50 = v3->_queryExecutor;
      v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE items SET category_identifier='%@'",  FLFollowUpNotificationDefaultCategory));
      -[FLSQLiteExecutor performQuery:](v50, "performQuery:", v51);

      goto LABEL_20;
    case 18LL:
LABEL_20:
      uint64_t v52 = _FLLogSystem(self, a2);
      v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v93 = 18LL;
        __int16 v94 = 2048;
        uint64_t v95 = 19LL;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Migrating from %lld to %lld", buf, 0x16u);
      }

      v54 = v3->_queryExecutor;
      v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE databaseProperties SET value='%@' WHERE key='schemaVersion'",  &off_1000196F0));
      -[FLSQLiteExecutor performQuery:](v54, "performQuery:", v55);

      self = (FLStoreMigrator *)-[FLSQLiteExecutor performQuery:]( v3->_queryExecutor,  "performQuery:",  @"SELECT representing_bundle_path, bundle_icon_name, informative_footer_text FROM items");
      if ((self & 1) == 0)
      {
        -[FLSQLiteExecutor performQuery:]( v3->_queryExecutor,  "performQuery:",  @"ALTER TABLE items ADD COLUMN representing_bundle_path TEXT");
        -[FLSQLiteExecutor performQuery:]( v3->_queryExecutor,  "performQuery:",  @"UPDATE items SET representing_bundle_path=NULL");
        -[FLSQLiteExecutor performQuery:]( v3->_queryExecutor,  "performQuery:",  @"ALTER TABLE items ADD COLUMN bundle_icon_name TEXT");
        -[FLSQLiteExecutor performQuery:]( v3->_queryExecutor,  "performQuery:",  @"UPDATE items SET bundle_icon_name=NULL");
        -[FLSQLiteExecutor performQuery:]( v3->_queryExecutor,  "performQuery:",  @"ALTER TABLE items ADD COLUMN informative_footer_text TEXT");
        self = (FLStoreMigrator *)-[FLSQLiteExecutor performQuery:]( v3->_queryExecutor,  "performQuery:",  @"UPDATE items SET informative_footer_text=NULL");
      }

      goto LABEL_24;
    case 19LL:
LABEL_24:
      uint64_t v56 = _FLLogSystem(self, a2);
      v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v93 = 19LL;
        __int16 v94 = 2048;
        uint64_t v95 = 20LL;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Migrating from %lld to %lld", buf, 0x16u);
      }

      v58 = v3->_queryExecutor;
      v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE databaseProperties SET value='%@' WHERE key='schemaVersion'",  &off_100019708));
      -[FLSQLiteExecutor performQuery:](v58, "performQuery:", v59);

      v60 = v3->_queryExecutor;
      v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ALTER TABLE items ADD COLUMN expiration_date INTEGER"));
      -[FLSQLiteExecutor performQuery:](v60, "performQuery:", v61);

      v62 = v3->_queryExecutor;
      v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE items SET expiration_date=NULL"));
      -[FLSQLiteExecutor performQuery:](v62, "performQuery:", v63);

      goto LABEL_27;
    case 20LL:
LABEL_27:
      uint64_t v64 = _FLLogSystem(self, a2);
      v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v93 = 20LL;
        __int16 v94 = 2048;
        uint64_t v95 = 21LL;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Migrating from %lld to %lld", buf, 0x16u);
      }

      v66 = v3->_queryExecutor;
      v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE databaseProperties SET value='%@' WHERE key='schemaVersion'",  &off_100019720));
      -[FLSQLiteExecutor performQuery:](v66, "performQuery:", v67);

      v68 = v3->_queryExecutor;
      v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ALTER TABLE notifications ADD COLUMN subtitle_text TEXT"));
      -[FLSQLiteExecutor performQuery:](v68, "performQuery:", v69);

      v70 = v3->_queryExecutor;
      v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE notifications SET subtitle_text=NULL"));
      -[FLSQLiteExecutor performQuery:](v70, "performQuery:", v71);

      goto LABEL_30;
    case 21LL:
LABEL_30:
      uint64_t v72 = _FLLogSystem(self, a2);
      v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v93 = 21LL;
        __int16 v94 = 2048;
        uint64_t v95 = 22LL;
        _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "Migrating from %lld to %lld", buf, 0x16u);
      }

      v74 = v3->_queryExecutor;
      v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE databaseProperties SET value='%@' WHERE key='schemaVersion'",  &off_100019738));
      -[FLSQLiteExecutor performQuery:](v74, "performQuery:", v75);

      v76 = v3->_queryExecutor;
      v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ALTER TABLE items ADD COLUMN account_id TEXT"));
      -[FLSQLiteExecutor performQuery:](v76, "performQuery:", v77);

      v78 = v3->_queryExecutor;
      v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE items SET account_id=NULL"));
      -[FLSQLiteExecutor performQuery:](v78, "performQuery:", v79);

      v80 = v3->_queryExecutor;
      v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ALTER TABLE items ADD COLUMN type_id TEXT"));
      -[FLSQLiteExecutor performQuery:](v80, "performQuery:", v81);

      v82 = v3->_queryExecutor;
      v83 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE items SET type_id=NULL"));
      -[FLSQLiteExecutor performQuery:](v82, "performQuery:", v83);

      goto LABEL_33;
    case 22LL:
LABEL_33:
      uint64_t v84 = _FLLogSystem(self, a2);
      v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v93 = 22LL;
        __int16 v94 = 2048;
        uint64_t v95 = 23LL;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "Migrating from %lld to %lld", buf, 0x16u);
      }

      v86 = v3->_queryExecutor;
      v87 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE databaseProperties SET value='%@' WHERE key='schemaVersion'",  &off_100019750));
      -[FLSQLiteExecutor performQuery:](v86, "performQuery:", v87);

      v88 = v3->_queryExecutor;
      v89 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ALTER TABLE items ADD COLUMN collection_id TEXT"));
      -[FLSQLiteExecutor performQuery:](v88, "performQuery:", v89);

      v90 = v3->_queryExecutor;
      v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE items SET collection_id=NULL"));
      -[FLSQLiteExecutor performQuery:](v90, "performQuery:", v91);

      break;
    default:
      return;
  }

- (void)_migrateFujitailToCurrent
{
  int64_t v3 = -[FLSQLiteExecutor database](self->_queryExecutor, "database");
  uint64_t function_v2 = sqlite3_create_function_v2( v3,  (const char *)[off_10001E320 UTF8String],  1,  2049,  0,  (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_10000E064,  0,  0,  0);
  if ((_DWORD)function_v2)
  {
    uint64_t v6 = _FLLogSystem(function_v2, v5);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000EDAC(v7);
    }
  }

  -[FLStoreMigrator _createCurrentDatabaseWithTableSuffix:]( self,  "_createCurrentDatabaseWithTableSuffix:",  @"_tmp");
  queryExecutor = self->_queryExecutor;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"INSERT INTO items_tmp (uuid, title, body, show_in_settings, style, persist_when_activated, persist_when_dismissed, user_info, client_identifier, extension_identifier, group_identifier, target_bundle_identifier, representing_bundle_path, bundle_icon_name, informative_footer_text, category_identifier) SELECT uuid, title, body, show_in_settings, style, persist_when_activated, persist_when_dismissed, user_info, client_identifier, NULL, '%@', '%@', NULL, NULL, NULL, '%@' FROM items",  FLGroupIdentifierDevice,  FLFollowUpPreferencesBundleIdentifier,  FLFollowUpNotificationDefaultCategory));
  -[FLSQLiteExecutor performInsertQuery:](queryExecutor, "performInsertQuery:", v9);

  -[FLSQLiteExecutor performInsertQuery:]( self->_queryExecutor,  "performInsertQuery:",  @"INSERT INTO actions_tmp (label, url, launch_url, launch_arguments, item_id, action_identifier) SELECT label, url, launch_url, fl_convert_la_userinfo(launch_arguments), item_id, NULL FROM actions");
  uint64_t v10 = self->_queryExecutor;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v11 timeIntervalSince1970];
  uint64_t v13 = v12;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v14 timeIntervalSince1970];
  int64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"INSERT INTO notifications_tmp (item_id, title, body, unlock_label, relevance_date, activate_action_id, dismiss_action_id, clear_action_id, frequency, creationDate) SELECT item_id, title, body, unlock_label, %f, activate_action_id, dismiss_action_id, clear_action_id, 0, %f from notifications",  v13,  v15));
  -[FLSQLiteExecutor performInsertQuery:](v10, "performInsertQuery:", v16);

  -[FLStoreMigrator _dropTables](self, "_dropTables");
  -[FLSQLiteExecutor performQuery:]( self->_queryExecutor,  "performQuery:",  @"ALTER TABLE databaseProperties_tmp RENAME TO databaseProperties");
  -[FLSQLiteExecutor performQuery:]( self->_queryExecutor,  "performQuery:",  @"ALTER TABLE notifications_tmp RENAME TO notifications");
  -[FLSQLiteExecutor performQuery:]( self->_queryExecutor,  "performQuery:",  @"ALTER TABLE actions_tmp RENAME TO actions");
  -[FLSQLiteExecutor performQuery:]( self->_queryExecutor,  "performQuery:",  @"ALTER TABLE items_tmp RENAME TO items");
}

- (void)_createCurrentDatabaseWithTableSuffix:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _FLLogSystem(v4, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10000EDE8(v7, v8, v9, v10, v11, v12, v13, v14);
  }

  queryExecutor = self->_queryExecutor;
  int64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CREATE TABLE databaseProperties%@ (key TEXT PRIMARY KEY, value TEXT)",  v4));
  -[FLSQLiteExecutor performQuery:](queryExecutor, "performQuery:", v16);

  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"INSERT INTO databaseProperties%@ (key, value) VALUES ('schemaVersion', '%@')",  v4,  &off_100019750));
  -[FLSQLiteExecutor performInsertQuery:](self->_queryExecutor, "performInsertQuery:", v17);
  int64_t v18 = self->_queryExecutor;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CREATE TABLE notifications%@ (id INTEGER PRIMARY KEY, item_id INTEGER REFERENCES items(id) ON DELETE CASCADE, title TEXT, subtitle_text TEXT, body TEXT, unlock_label TEXT, relevance_date INTEGER, activate_action_id INTEGER REFERENCES actions(id) ON DELETE CASCADE, dismiss_action_id INTEGER REFERENCES actions(id) ON DELETE CASCADE, clear_action_id INTEGER REFERENCES actions(id) ON DELETE CASCADE, frequency INTEGER, creationDate INTEGER, options BLOB)",  v4));
  -[FLSQLiteExecutor performQuery:](v18, "performQuery:", v19);

  uint64_t v20 = self->_queryExecutor;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CREATE TABLE actions%@ (id INTEGER PRIMARY KEY, item_id INTEGER REFERENCES items(id) ON DELETE CASCADE, label TEXT, url TEXT, launch_url TEXT, launch_arguments BLOB, action_identifier TEXT)",  v4));
  -[FLSQLiteExecutor performQuery:](v20, "performQuery:", v21);

  v22 = self->_queryExecutor;
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CREATE TABLE items%@ (id INTEGER PRIMARY KEY, uuid TEXT, client_identifier TEXT, title TEXT, body TEXT, show_in_settings INTEGER, style INTEGER, persist_when_activated INTEGER, persist_when_dismissed INTEGER, user_info BLOB, extension_identifier TEXT, group_identifier TEXT, collection_id TEXT, target_bundle_identifier TEXT, representing_bundle_path TEXT, bundle_icon_name TEXT, informative_footer_text TEXT, category_identifier TEXT, expiration_date INTEGER, account_id TEXT, type_id TEXT, UNIQUE(uuid))",  v4));

  -[FLSQLiteExecutor performQuery:](v22, "performQuery:", v23);
}

- (void)_dropTables
{
  uint64_t v3 = _FLLogSystem(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000EE18(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  -[FLSQLiteExecutor performQuery:]( self->_queryExecutor,  "performQuery:",  @"DROP TABLE IF EXISTS databaseProperties");
  -[FLSQLiteExecutor performQuery:](self->_queryExecutor, "performQuery:", @"DROP TABLE IF EXISTS notifications");
  -[FLSQLiteExecutor performQuery:](self->_queryExecutor, "performQuery:", @"DROP TABLE IF EXISTS actions");
  -[FLSQLiteExecutor performQuery:](self->_queryExecutor, "performQuery:", @"DROP TABLE IF EXISTS items");
}

- (FLSQLiteExecutor)queryExecutor
{
  return (FLSQLiteExecutor *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setQueryExecutor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end