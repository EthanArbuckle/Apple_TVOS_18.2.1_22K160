@interface AKAuthorizationStoreMigrator
- (id)storeName;
- (unint64_t)currentSchemaVersion;
- (void)_buildSchemaVersion1;
- (void)_createV2Database;
- (void)_createV3Database;
- (void)_createV4Database;
- (void)_createV5Database;
- (void)_createV6Database;
- (void)_createV7Database;
- (void)_performInsertQueryIntoVersion:(unint64_t)a3;
- (void)_upgradeToSchemaVersion2;
- (void)_upgradeToSchemaVersion3;
- (void)_upgradeToSchemaVersion4;
- (void)_upgradeToSchemaVersion5;
- (void)_upgradeToSchemaVersion6;
- (void)_upgradeToSchemaVersion7;
- (void)_upgradeToSchemaVersion8;
- (void)migrateSchemaFromVersion:(unint64_t)a3;
@end

@implementation AKAuthorizationStoreMigrator

- (id)storeName
{
  return @"Authorization";
}

- (unint64_t)currentSchemaVersion
{
  return 8LL;
}

- (void)migrateSchemaFromVersion:(unint64_t)a3
{
  uint64_t v5 = _AKLogSiwa(self, a2);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationStoreMigrator storeName](self, "storeName"));
    int v8 = 138412546;
    v9 = v7;
    __int16 v10 = 1024;
    int v11 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@ Database Migration requested from version: %i",  (uint8_t *)&v8,  0x12u);
  }

  switch(a3)
  {
    case 0uLL:
      -[AKAuthorizationStoreMigrator _buildSchemaVersion1](self, "_buildSchemaVersion1");
      goto LABEL_5;
    case 1uLL:
    case 2uLL:
LABEL_5:
      -[AKAuthorizationStoreMigrator _upgradeToSchemaVersion2](self, "_upgradeToSchemaVersion2");
      -[AKAuthorizationStoreMigrator _upgradeToSchemaVersion3](self, "_upgradeToSchemaVersion3");
      goto LABEL_6;
    case 3uLL:
LABEL_6:
      -[AKAuthorizationStoreMigrator _upgradeToSchemaVersion4](self, "_upgradeToSchemaVersion4");
      goto LABEL_7;
    case 4uLL:
LABEL_7:
      -[AKAuthorizationStoreMigrator _upgradeToSchemaVersion5](self, "_upgradeToSchemaVersion5");
      goto LABEL_8;
    case 5uLL:
LABEL_8:
      -[AKAuthorizationStoreMigrator _upgradeToSchemaVersion6](self, "_upgradeToSchemaVersion6");
      goto LABEL_9;
    case 6uLL:
LABEL_9:
      -[AKAuthorizationStoreMigrator _upgradeToSchemaVersion7](self, "_upgradeToSchemaVersion7");
      goto LABEL_10;
    case 7uLL:
LABEL_10:
      -[AKAuthorizationStoreMigrator _upgradeToSchemaVersion8](self, "_upgradeToSchemaVersion8");
      break;
    default:
      return;
  }

- (void)_buildSchemaVersion1
{
  uint64_t v3 = _AKLogSiwa(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Building database with schema version: 1",  v8,  2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  objc_msgSend( v5,  "performQuery:",  @"CREATE TABLE IF NOT EXISTS authorized_teams (team_id TEXT PRIMARY KEY, uid TEXT, authorizedAppListVersion TEXT);");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  objc_msgSend( v6,  "performQuery:",  @"CREATE TABLE IF NOT EXISTS authorized_applications (client_id TEXT PRIMARY KEY, team_id TEXT, scopes TEXT, credential_state INTEGER);");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  [v7 performQuery:@"CREATE TABLE IF NOT EXISTS version (authorizedAppListVersion TEXT PRIMARY KEY);"];
}

- (void)_upgradeToSchemaVersion2
{
  uint64_t v3 = _AKLogSiwa(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Upgrading database to schema version: 2",  v8,  2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  [v5 performQuery:@"ALTER TABLE version ADD COLUMN db_version INTEGER;"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  [v6 performQuery:@"ALTER TABLE authorized_applications ADD COLUMN authorizedAppListVersion TEXT"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  [v7 performInsertQuery:@"UPDATE version SET authorizedAppListVersion = 'TEMPORARY';"];

  -[AKAuthorizationStoreMigrator _performInsertQueryIntoVersion:](self, "_performInsertQueryIntoVersion:", 2LL);
}

- (void)_upgradeToSchemaVersion3
{
  uint64_t v3 = _AKLogSiwa(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Upgrading database to schema version: 3",  v7,  2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  [v5 performQuery:@"ALTER TABLE authorized_applications ADD COLUMN transfer_state TEXT"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  [v6 performQuery:@"ALTER TABLE authorized_applications ADD COLUMN primary_client_id TEXT"];

  -[AKAuthorizationStoreMigrator _performInsertQueryIntoVersion:](self, "_performInsertQueryIntoVersion:", 3LL);
}

- (void)_upgradeToSchemaVersion4
{
  uint64_t v3 = _AKLogSiwa(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Upgrading database to schema version: 4",  v8,  2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  [v5 performQuery:@"ALTER TABLE authorized_applications ADD COLUMN origin TEXT;"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  [v6 performQuery:@"DROP TABLE IF EXISTS version;"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  objc_msgSend( v7,  "performQuery:",  @"CREATE TABLE IF NOT EXISTS version (authorizedAppListVersion TEXT PRIMARY KEY, db_version INTEGER);");

  -[AKAuthorizationStoreMigrator _performInsertQueryIntoVersion:](self, "_performInsertQueryIntoVersion:", 4LL);
}

- (void)_upgradeToSchemaVersion5
{
  uint64_t v3 = _AKLogSiwa(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Upgrading database to schema version: 5",  v8,  2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  objc_msgSend( v5,  "performQuery:",  @"CREATE TABLE IF NOT EXISTS authorized_primary_applications (client_id TEXT PRIMARY KEY, app_name TEXT, app_developer_name TEXT, has_eula BOOL, privacy_url TEXT);");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  [v6 performQuery:@"ALTER TABLE authorized_applications ADD COLUMN creation_date INTEGER NOT NULL DEFAULT 0"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  [v7 performQuery:@"ALTER TABLE authorized_teams ADD COLUMN private_email TEXT;"];

  -[AKAuthorizationStoreMigrator _performInsertQueryIntoVersion:](self, "_performInsertQueryIntoVersion:", 5LL);
}

- (void)_upgradeToSchemaVersion6
{
  uint64_t v3 = _AKLogSiwa(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Upgrading database to schema version: 6",  buf,  2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  [v5 performQuery:@"DROP TABLE IF EXISTS authorized_primary_applications;"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  objc_msgSend( v6,  "performQuery:",  @"CREATE TABLE IF NOT EXISTS authorized_primary_applications (client_id TEXT PRIMARY KEY, app_name TEXT, app_developer_name TEXT);");

  -[AKAuthorizationStoreMigrator _performInsertQueryIntoVersion:](self, "_performInsertQueryIntoVersion:", 6LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DELETE FROM version where db_version != %i",  6LL));
  [v7 performQuery:v8];
}

- (void)_upgradeToSchemaVersion7
{
  uint64_t v3 = _AKLogSiwa(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Upgrading database to schema version: 7",  buf,  2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  [v5 performQuery:@"ALTER TABLE authorized_applications ADD COLUMN client_name TEXT;"];

  -[AKAuthorizationStoreMigrator _performInsertQueryIntoVersion:](self, "_performInsertQueryIntoVersion:", 7LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DELETE FROM version where db_version != %i",  7LL));
  [v6 performQuery:v7];
}

- (void)_upgradeToSchemaVersion8
{
  uint64_t v3 = _AKLogSiwa(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Upgrading database to schema version: 8",  buf,  2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  [v5 performQuery:@"ALTER TABLE authorized_primary_applications ADD COLUMN adam_id TEXT;"];

  -[AKAuthorizationStoreMigrator _performInsertQueryIntoVersion:](self, "_performInsertQueryIntoVersion:", 8LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DELETE FROM version where db_version != %i",  8LL));
  [v6 performQuery:v7];
}

- (void)_performInsertQueryIntoVersion:(unint64_t)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[AKStoreMigrator executor](self, "executor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"INSERT OR REPLACE INTO version (authorizedAppListVersion, db_version) values ('TEMPORARY', '%i');",
                   a3));
  [v5 performInsertQuery:v4];
}

- (void)_createV2Database
{
}

- (void)_createV3Database
{
}

- (void)_createV4Database
{
}

- (void)_createV5Database
{
}

- (void)_createV6Database
{
}

- (void)_createV7Database
{
}

@end