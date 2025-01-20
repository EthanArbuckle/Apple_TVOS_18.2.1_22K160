@interface AKPrivateEmailStoreMigrator
- (id)storeName;
- (unint64_t)currentSchemaVersion;
- (void)_buildSchemaVersion1;
- (void)_migrateToSchemaVersion2;
- (void)_migrateToSchemaVersion3;
- (void)_migrateToSchemaVersion4;
- (void)_migrateToSchemaVersion5;
- (void)migrateSchemaFromVersion:(unint64_t)a3;
@end

@implementation AKPrivateEmailStoreMigrator

- (id)storeName
{
  return @"PrivateEmail";
}

- (unint64_t)currentSchemaVersion
{
  return 5LL;
}

- (void)migrateSchemaFromVersion:(unint64_t)a3
{
  uint64_t v5 = _AKLogHme(self, a2);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKPrivateEmailStoreMigrator storeName](self, "storeName"));
    int v8 = 138412546;
    v9 = v7;
    __int16 v10 = 1024;
    int v11 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@ Database Migration requested from version: %i",  (uint8_t *)&v8,  0x12u);
  }

  switch(a3)
  {
    case 0uLL:
      -[AKPrivateEmailStoreMigrator _buildSchemaVersion1](self, "_buildSchemaVersion1");
      goto LABEL_5;
    case 1uLL:
LABEL_5:
      -[AKPrivateEmailStoreMigrator _migrateToSchemaVersion2](self, "_migrateToSchemaVersion2");
      goto LABEL_6;
    case 2uLL:
LABEL_6:
      -[AKPrivateEmailStoreMigrator _migrateToSchemaVersion3](self, "_migrateToSchemaVersion3");
      goto LABEL_7;
    case 3uLL:
LABEL_7:
      -[AKPrivateEmailStoreMigrator _migrateToSchemaVersion4](self, "_migrateToSchemaVersion4");
      goto LABEL_8;
    case 4uLL:
LABEL_8:
      -[AKPrivateEmailStoreMigrator _migrateToSchemaVersion5](self, "_migrateToSchemaVersion5");
      break;
    default:
      return;
  }

- (void)_buildSchemaVersion1
{
  uint64_t v3 = _AKLogHme(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKPrivateEmailStoreMigrator storeName](self, "storeName"));
    *(_DWORD *)buf = 138412290;
    int v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Building %@ database with schema version: 1",  buf,  0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  objc_msgSend( v6,  "performQuery:",  @"CREATE TABLE IF NOT EXISTS emails (client_key TEXT PRIMARY KEY, email TEXT);");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  objc_msgSend( v7,  "performQuery:",  @"CREATE TABLE IF NOT EXISTS version (privateEmailListVersion TEXT PRIMARY KEY, db_version INTEGER);");

  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"INSERT OR REPLACE INTO version (privateEmailListVersion, db_version) VALUES('%@', '%i')",  AKPrivateEmailInitialVersion,  1LL));
  [v8 performInsertQuery:v9];
}

- (void)_migrateToSchemaVersion2
{
  uint64_t v3 = _AKLogHme(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKPrivateEmailStoreMigrator storeName](self, "storeName"));
    *(_DWORD *)buf = 138412290;
    __int16 v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Migrating %@ database to schema version: 2",  buf,  0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  [v6 performQuery:@"ALTER TABLE version ADD COLUMN protocol_version INTEGER"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE version SET protocol_version = %i,db_version = %i",  AKPrivateEmailInitialProtocolVersion,  2LL));
  [v7 performQuery:v8];
}

- (void)_migrateToSchemaVersion3
{
  v2 = self;
  uint64_t v3 = _AKLogHme(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKPrivateEmailStoreMigrator storeName](v2, "storeName"));
    *(_DWORD *)buf = 138412290;
    v49 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Migrating %@ database to schema version: 3",  buf,  0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT client_key FROM emails;"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](v2, "executor"));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_100035FA8;
  v44[3] = &unk_1001C7BB8;
  id v9 = v6;
  id v45 = v9;
  v34 = (void *)v7;
  [v8 performQuery:v7 rowHandler:v44];

  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v41 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[AKStoreUtils hash:](&OBJC_CLASS___AKStoreUtils, "hash:", v16));
      }

      id v13 = [v11 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }

    while (v13);
  }

  if ([v10 count])
  {
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v18 = v10;
    id v19 = [v18 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v37;
      id obj = v18;
      while (2)
      {
        for (j = 0LL; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v37 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 8LL * (void)j);
          v24 = v2;
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](v2, "executor"));
          v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DELETE FROM emails WHERE client_key = '%@';",
                            v23));
          unsigned __int8 v27 = [v25 performQuery:v26];

          if ((v27 & 1) == 0)
          {
            uint64_t v33 = _AKLogHme(v28, v29);
            v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              sub_100131C88(v23, v31);
            }
            v32 = v34;
            v30 = obj;
            goto LABEL_26;
          }

          v2 = v24;
        }

        id v18 = obj;
        id v20 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](v2, "executor"));
  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE version SET protocol_version = %i,db_version = %i",  AKPrivateEmailProtocolVersion2,  3LL));
  [v30 performQuery:v31];
  v32 = v34;
LABEL_26:
}

- (void)_migrateToSchemaVersion4
{
  uint64_t v3 = _AKLogHme(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKPrivateEmailStoreMigrator storeName](self, "storeName"));
    *(_DWORD *)buf = 138412290;
    id v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Migrating %@ database to schema version: 4",  buf,  0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  [v6 performQuery:@"PRAGMA foreign_keys=off"];
  [v6 performQuery:@"ALTER TABLE emails RENAME TO emails_orig"];
  [v6 performQuery:@"CREATE TABLE emails AS SELECT * FROM emails_orig"];
  [v6 performQuery:@"ALTER TABLE emails ADD COLUMN bundle_id TEXT"];
  [v6 performQuery:@"CREATE INDEX client_bundle_idx ON emails(client_key,bundle_id)"];
  [v6 performQuery:@"DROP TABLE emails_orig"];
  [v6 performQuery:@"PRAGMA foreign_keys=on"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE version SET db_version = %i",  4LL));
  [v6 performQuery:v7];
}

- (void)_migrateToSchemaVersion5
{
  uint64_t v3 = _AKLogHme(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKPrivateEmailStoreMigrator storeName](self, "storeName"));
    *(_DWORD *)buf = 138412290;
    id v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Migrating %@ database to schema version: 5",  buf,  0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  [v6 performQuery:@"PRAGMA foreign_keys=off"];
  [v6 performQuery:@"ALTER TABLE emails RENAME TO emails_v4"];
  objc_msgSend(v6, "performQuery:", @"CREATE TABLE emails (client_key TEXT PRIMARY KEY, email TEXT)");
  [v6 performQuery:@"INSERT INTO emails (client_key,email) SELECT client_key,email FROM emails_v4"];
  [v6 performQuery:@"DROP TABLE emails_v4"];
  [v6 performQuery:@"PRAGMA foreign_keys=on"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE version SET db_version = %i",  5LL));
  [v6 performQuery:v7];
}

- (void).cxx_destruct
{
}

@end