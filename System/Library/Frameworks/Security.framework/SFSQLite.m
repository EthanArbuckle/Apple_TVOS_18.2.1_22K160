@interface SFSQLite
- (BOOL)corrupt;
- (BOOL)executeSQL:(id)a3;
- (BOOL)hasMigrated;
- (BOOL)isOpen;
- (BOOL)openWithError:(id *)a3;
- (BOOL)traced;
- (NSDateFormatter)dateFormatter;
- (NSDateFormatter)oldDateFormatter;
- (NSMutableDictionary)statementsBySQL;
- (NSString)objectClassPrefix;
- (NSString)path;
- (NSString)schema;
- (NSString)schemaVersion;
- (SFSQLite)initWithPath:(id)a3 schema:(id)a4;
- (SFSQLiteDelegate)delegate;
- (id)_createSchemaHash;
- (id)_synchronousModeString;
- (id)_tableNameForClass:(Class)a3;
- (id)allTableNames;
- (id)columnNamesForTable:(id)a3;
- (id)creationDate;
- (id)datePropertyForKey:(id)a3;
- (id)propertyForKey:(id)a3;
- (id)select:(id)a3 from:(id)a4;
- (id)select:(id)a3 from:(id)a4 mapEachRow:(id)a5;
- (id)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6;
- (id)selectAllFrom:(id)a3 where:(id)a4 bindings:(id)a5;
- (id)selectFrom:(id)a3 where:(id)a4 bindings:(id)a5 limit:(id)a6;
- (id)statementForSQL:(id)a3;
- (int)autoVacuumSetting;
- (int)changes;
- (int)dbUserVersion;
- (int)userVersion;
- (int64_t)insertOrReplaceInto:(id)a3 values:(id)a4;
- (int64_t)lastInsertRowID;
- (int64_t)synchronousMode;
- (sqlite3)db;
- (unint64_t)openCount;
- (unint64_t)selectCountFrom:(id)a3 where:(id)a4 bindings:(id)a5;
- (void)analyze;
- (void)attemptProperDatabasePermissions;
- (void)begin;
- (void)close;
- (void)dealloc;
- (void)deleteFrom:(id)a3 matchingValues:(id)a4;
- (void)deleteFrom:(id)a3 where:(id)a4 bindings:(id)a5;
- (void)dropAllTables;
- (void)end;
- (void)open;
- (void)remove;
- (void)removeAllStatements;
- (void)removePropertyForKey:(id)a3;
- (void)rollback;
- (void)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7 limit:(id)a8 block:(id)a9;
- (void)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7 limit:(id)a8 forEachRow:(id)a9;
- (void)selectFrom:(id)a3 where:(id)a4 bindings:(id)a5 orderBy:(id)a6 limit:(id)a7 block:(id)a8;
- (void)setCorrupt:(BOOL)a3;
- (void)setDateFormatter:(id)a3;
- (void)setDateProperty:(id)a3 forKey:(id)a4;
- (void)setDb:(sqlite3 *)a3;
- (void)setDelegate:(id)a3;
- (void)setObjectClassPrefix:(id)a3;
- (void)setOldDateFormatter:(id)a3;
- (void)setOpenCount:(unint64_t)a3;
- (void)setProperty:(id)a3 forKey:(id)a4;
- (void)setSynchronousMode:(int64_t)a3;
- (void)setTraced:(BOOL)a3;
- (void)setUserVersion:(int)a3;
- (void)update:(id)a3 set:(id)a4 where:(id)a5 bindings:(id)a6 limit:(id)a7;
- (void)vacuum;
@end

@implementation SFSQLite

- (SFSQLite)initWithPath:(id)a3 schema:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![v7 length])
  {
    secLogObjForScope("SecCritical");
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v18 = "Cannot init db with empty path";
LABEL_10:
      _os_log_impl(&dword_1804F4000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
    }

- (void)dealloc
{
  v3 = (void *)MEMORY[0x186DFF9D0](self, a2);
  -[SFSQLite close](self, "close");
  objc_autoreleasePoolPop(v3);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SFSQLite;
  -[SFSQLite dealloc](&v4, sel_dealloc);
}

- (int)userVersion
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3) {
    return self->_userVersion;
  }
  -[SFSQLite delegate](self, "delegate");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 userVersion];

  return v5;
}

- (id)_synchronousModeString
{
  unint64_t v2 = -[SFSQLite synchronousMode](self, "synchronousMode");
  if (v2 < 3) {
    return off_189664C58[v2];
  }
  __security_simulatecrash(@"Execution has encountered an unexpected state", 0x53C0000Eu);
  return @"normal";
}

- (id)_createSchemaHash
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  memset(v8, 0, sizeof(v8));
  [MEMORY[0x189603F48] dataWithBytesNoCopy:v8 length:32 freeWhenDone:0];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSQLite schema](self, "schema");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 dataUsingEncoding:4];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();

  CC_SHA256((const void *)[v5 bytes], objc_msgSend(v5, "length"), (unsigned __int8 *)v8);
  [v3 CKUppercaseHexStringWithoutSpaces];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isOpen
{
  return self->_db != 0LL;
}

- (void)attemptProperDatabasePermissions
{
  v18[1] = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896078A8] defaultManager];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = *MEMORY[0x189607500];
  uint64_t v4 = v17;
  [MEMORY[0x189607968] numberWithShort:438];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setAttributes:v6 ofItemAtPath:self->_path error:0];

  uint64_t v15 = v4;
  [MEMORY[0x189607968] numberWithShort:438];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithFormat:@"%@-wal", self->_path];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setAttributes:v8 ofItemAtPath:v9 error:0];

  uint64_t v13 = v4;
  [MEMORY[0x189607968] numberWithShort:438];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithFormat:@"%@-shm", self->_path];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setAttributes:v11 ofItemAtPath:v12 error:0];
}

- (BOOL)openWithError:(id *)a3
{
  v73[1] = *MEMORY[0x1895F89C0];
  v6 = self->_path;
  unint64_t openCount = self->_openCount;
  if (openCount)
  {
    if (!self->_db)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      [v64 handleFailureInMethod:a2 object:self file:@"SFSQLite.m" lineNumber:324 description:@"Missing handle for open cache db"];

      unint64_t openCount = self->_openCount;
    }

    id v8 = 0LL;
    id v9 = 0LL;
    id v10 = 0LL;
    self->_unint64_t openCount = openCount + 1;
    BOOL v11 = 1;
    goto LABEL_34;
  }

  -[NSString stringByDeletingLastPathComponent](self->_path, "stringByDeletingLastPathComponent");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1896078A8] defaultManager];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v67 = 0LL;
  char v13 = [v12 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v67];
  id v14 = v67;
  uint64_t v15 = v14;
  if ((v13 & 1) != 0) {
    goto LABEL_8;
  }
  [v14 domain];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v16 isEqualToString:*MEMORY[0x189607460]])
  {

    goto LABEL_12;
  }

  uint64_t v17 = [v15 code];

  if (v17 != 516)
  {
LABEL_12:
    id v27 = v15;
    int v28 = 0;
    id v21 = v27;
    goto LABEL_13;
  }

- (void)open
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v8 = 0LL;
  BOOL v3 = -[SFSQLite openWithError:](self, "openWithError:", &v8);
  id v4 = v8;
  int v5 = v4;
  if (!v3 && (!v4 || [v4 code] != 23))
  {
    secLogObjForScope("SecError");
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[SFSQLite path](self, "path");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      id v10 = v7;
      __int16 v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1804F4000, v6, OS_LOG_TYPE_DEFAULT, "sfsqlite: Error opening db at %@: %@", buf, 0x16u);
    }
  }
}

- (void)close
{
  unint64_t openCount = self->_openCount;
  if (!openCount) {
    return;
  }
  if (openCount != 1)
  {
LABEL_10:
    self->_unint64_t openCount = openCount - 1;
    return;
  }

  if (!self->_db)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 handleFailureInMethod:a2 object:self file:@"SFSQLite.m" lineNumber:465 description:@"Missing handle for open cache db"];
  }

  -[SFSQLite removeAllStatements](self, "removeAllStatements");
  if (!sqlite3_close(self->_db))
  {
    self->_db = 0LL;
    unint64_t openCount = self->_openCount;
    goto LABEL_10;
  }

  secLogObjForScope("SecError");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1804F4000, v4, OS_LOG_TYPE_DEFAULT, "sfsqlite: Error closing database", v7, 2u);
  }
}

- (void)remove
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (self->_openCount)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2, self, @"SFSQLite.m", 480, @"Trying to remove db at: %@ while it is open", self->_path object file lineNumber description];
  }

  [MEMORY[0x1896078A8] defaultManager];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 removeItemAtPath:self->_path error:0];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v4 = [&unk_18969BFA0 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(&unk_18969BFA0);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
        [MEMORY[0x1896078A8] defaultManager];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSString stringByAppendingString:](self->_path, "stringByAppendingString:", v8);
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 removeItemAtPath:v10 error:0];

        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = [&unk_18969BFA0 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v5);
  }

- (void)begin
{
}

- (void)end
{
}

- (void)rollback
{
}

- (void)analyze
{
}

- (void)vacuum
{
}

- (int64_t)lastInsertRowID
{
  db = self->_db;
  if (db) {
    return sqlite3_last_insert_rowid(db);
  }
  secLogObjForScope("SecError");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1804F4000, v4, OS_LOG_TYPE_DEFAULT, "sfsqlite: Database is closed", v5, 2u);
  }

  return -1LL;
}

- (int)changes
{
  db = self->_db;
  if (db) {
    return sqlite3_changes(db);
  }
  secLogObjForScope("SecError");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1804F4000, v4, OS_LOG_TYPE_DEFAULT, "sfsqlite: Database is closed", v5, 2u);
  }

  return -1;
}

- (BOOL)executeSQL:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = v4;
  db = self->_db;
  if (db)
  {
    id v7 = v4;
    int v8 = sqlite3_exec(db, (const char *)[v7 UTF8String], 0, 0, 0);
    if (!v8)
    {
      BOOL v13 = 1;
      goto LABEL_14;
    }

    int v9 = v8;
    if (v8 != 8 && v8 != 23)
    {
      secLogObjForScope("SecError");
      __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412546;
        id v16 = v7;
        __int16 v17 = 1024;
        int v18 = v9;
        _os_log_impl( &dword_1804F4000,  v11,  OS_LOG_TYPE_DEFAULT,  "sfsqlite: Error executing SQL: %@ (%d)",  (uint8_t *)&v15,  0x12u);
      }
    }
  }

  else
  {
    secLogObjForScope("SecError");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1804F4000, v12, OS_LOG_TYPE_DEFAULT, "sfsqlite: Database is closed", (uint8_t *)&v15, 2u);
    }
  }

  BOOL v13 = 0;
LABEL_14:

  return v13;
}

- (id)statementForSQL:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!self->_db)
  {
    secLogObjForScope("SecError");
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1804F4000, v9, OS_LOG_TYPE_DEFAULT, "sfsqlite: Database is closed", buf, 2u);
    }

- (void)removeAllStatements
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 makeObjectsPerformSelector:sel_finalizeStatement];

  -[NSMutableDictionary removeAllObjects](self->_statementsBySQL, "removeAllObjects");
}

- (id)allTableNames
{
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  -[SFSQLite statementForSQL:](self, "statementForSQL:", @"select name from sqlite_master where type = 'table'");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 step])
  {
    do
    {
      [v4 textAtIndex:0];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 addObject:v5];
    }

    while (([v4 step] & 1) != 0);
  }

  [v4 reset];

  return v3;
}

- (void)dropAllTables
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  -[SFSQLite allTableNames](self, "allTableNames");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [NSString stringWithFormat:@"drop table %@", *(void *)(*((void *)&v9 + 1) + 8 * v7)];
        int v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSQLite executeSQL:](self, "executeSQL:", v8);

        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }
}

- (id)propertyForKey:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    -[SFSQLite statementForSQL:](self, "statementForSQL:", @"select value from Properties where key = ?");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 bindText:v4 atIndex:0];
    uint64_t v6 = 0LL;
    if ([v5 step])
    {
      [v5 textAtIndex:0];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

    [v5 reset];
  }

  else
  {
    secLogObjForScope("SecError");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 v9 = 0;
      _os_log_impl( &dword_1804F4000,  v7,  OS_LOG_TYPE_DEFAULT,  "SFSQLite: attempt to retrieve property without a key",  v9,  2u);
    }

    uint64_t v6 = 0LL;
  }

  return v6;
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    if (!v6)
    {
      -[SFSQLite removePropertyForKey:](self, "removePropertyForKey:", v7);
      goto LABEL_8;
    }

    -[SFSQLite statementForSQL:]( self,  "statementForSQL:",  @"insert or replace into Properties (key, value) values (?,?)");
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 bindText:v7 atIndex:0];
    [v8 bindText:v6 atIndex:1];
    [v8 step];
    [v8 reset];
  }

  else
  {
    secLogObjForScope("SecError");
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 v9 = 0;
      _os_log_impl( &dword_1804F4000,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "SFSQLite: attempt to set property without a key",  v9,  2u);
    }
  }

LABEL_8:
}

- (NSDateFormatter)dateFormatter
{
  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    id v4 = (NSDateFormatter *)objc_opt_new();
    -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", @"yyyy-MM-dd'T'HH:mm:ss.SSSZZZZ");
    uint64_t v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    dateFormatter = self->_dateFormatter;
  }

  return dateFormatter;
}

- (NSDateFormatter)oldDateFormatter
{
  oldDateFormatter = self->_oldDateFormatter;
  if (!oldDateFormatter)
  {
    id v4 = (NSDateFormatter *)objc_opt_new();
    -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", @"yyyy-MM-dd'T'HH:mm:ssZZZZZ");
    uint64_t v5 = self->_oldDateFormatter;
    self->_oldDateFormatter = v4;

    oldDateFormatter = self->_oldDateFormatter;
  }

  return oldDateFormatter;
}

- (id)datePropertyForKey:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 length])
  {
    -[SFSQLite dateFormatter](self, "dateFormatter");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 dateFromString:v4];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[SFSQLite oldDateFormatter](self, "oldDateFormatter");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 dateFromString:v4];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)setDateProperty:(id)a3 forKey:(id)a4
{
  id v8 = a4;
  if (a3)
  {
    id v6 = a3;
    -[SFSQLite dateFormatter](self, "dateFormatter");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 stringFromDate:v6];
    a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  -[SFSQLite setProperty:forKey:](self, "setProperty:forKey:", a3, v8);
}

- (void)removePropertyForKey:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    -[SFSQLite statementForSQL:](self, "statementForSQL:", @"delete from Properties where key = ?");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 bindText:v5 atIndex:0];
    [v4 step];
    [v4 reset];
  }
}

- (id)creationDate
{
  unint64_t v2 = (void *)MEMORY[0x189603F50];
  -[SFSQLite propertyForKey:](self, "propertyForKey:", @"Created");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 floatValue];
  [v2 dateWithTimeIntervalSinceReferenceDate:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)columnNamesForTable:(id)a3
{
  float v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSQLite statementForSQL:](self, "statementForSQL:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  id v6 = objc_alloc_init(MEMORY[0x189603FE0]);
  if ([v5 step])
  {
    do
    {
      [v5 textAtIndex:1];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 addObject:v7];
    }

    while (([v5 step] & 1) != 0);
  }

  [v5 reset];

  return v6;
}

- (id)select:(id)a3 from:(id)a4
{
  return -[SFSQLite select:from:where:bindings:](self, "select:from:where:bindings:", a3, a4, 0LL, 0LL);
}

- (id)select:(id)a3 from:(id)a4 mapEachRow:(id)a5
{
  id v8 = a5;
  __int128 v9 = (objc_class *)MEMORY[0x189603FA8];
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(v9);
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  void v18[2] = __35__SFSQLite_select_from_mapEachRow___block_invoke;
  v18[3] = &unk_189664C10;
  id v20 = v8;
  id v13 = v12;
  id v19 = v13;
  id v14 = v8;
  -[SFSQLite select:from:where:bindings:orderBy:limit:forEachRow:]( self,  "select:from:where:bindings:orderBy:limit:forEachRow:",  v11,  v10,  0LL,  0LL,  0LL,  0LL,  v18);

  int v15 = v19;
  id v16 = v13;

  return v16;
}

- (id)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(MEMORY[0x189603FA8]);
  int v15 = (void *)MEMORY[0x189607940];
  objc_msgSend(v10, "componentsJoinedByString:", @", ");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 stringWithFormat:@"select %@ from %@", v16, v11];
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12) {
    [v17 appendFormat:@" where %@", v12];
  }
  -[SFSQLite statementForSQL:](self, "statementForSQL:", v17);
  int v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 bindValues:v13];
  if ([v18 step])
  {
    do
    {
      [v18 allObjectsByColumnName];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 addObject:v19];
    }

    while (([v18 step] & 1) != 0);
  }

  [v18 reset];

  return v14;
}

- (void)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7 limit:(id)a8 block:(id)a9
{
  id v16 = a9;
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  void v18[2] = __59__SFSQLite_select_from_where_bindings_orderBy_limit_block___block_invoke;
  v18[3] = &unk_189664C38;
  id v19 = v16;
  id v17 = v16;
  -[SFSQLite select:from:where:bindings:orderBy:limit:forEachRow:]( self,  "select:from:where:bindings:orderBy:limit:forEachRow:",  a3,  a4,  a5,  a6,  a7,  a8,  v18);
}

- (void)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7 limit:(id)a8 forEachRow:(id)a9
{
  id v15 = a3;
  id v28 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = (void (**)(id, void *, _BYTE *))a9;
  uint64_t v21 = MEMORY[0x186DFF9D0]();
  id v22 = objc_alloc_init(MEMORY[0x189607940]);
  context = (void *)v21;
  if ([v15 count])
  {
    objc_msgSend(v15, "componentsJoinedByString:", @", ");
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v23 = @"*";
  }

  [v22 appendFormat:@"select %@ from %@", v23, v28];
  if ([v16 length]) {
    [v22 appendFormat:@" where %@", v16];
  }
  if (v18)
  {
    objc_msgSend(v18, "componentsJoinedByString:", @", ");
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 appendFormat:@" order by %@", v24];
  }

  if (v19) {
    objc_msgSend(v22, "appendFormat:", @" limit %ld", objc_msgSend(v19, "integerValue"));
  }
  -[SFSQLite statementForSQL:](self, "statementForSQL:", v22);
  char v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x186DFF9D0]([v25 bindValues:v17]);
  if ([v25 step])
  {
    do
    {
      if (v20)
      {
        char v29 = 0;
        v20[2](v20, v25, &v29);
        if (v29) {
          break;
        }
      }

      objc_autoreleasePoolPop(v26);
      v26 = (void *)MEMORY[0x186DFF9D0]();
    }

    while (([v25 step] & 1) != 0);
  }

  objc_autoreleasePoolPop(v26);
  [v25 reset];

  objc_autoreleasePoolPop(context);
}

- (void)selectFrom:(id)a3 where:(id)a4 bindings:(id)a5 orderBy:(id)a6 limit:(id)a7 block:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = (void (**)(id, void *, _BYTE *))a8;
  context = (void *)MEMORY[0x186DFF9D0]();
  id v20 = objc_alloc_init(MEMORY[0x189607940]);
  [v20 appendFormat:@"select * from %@", v14];
  if ([v15 length]) {
    [v20 appendFormat:@" where %@", v15];
  }
  if (v17)
  {
    objc_msgSend(v17, "componentsJoinedByString:", @", ");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 appendFormat:@" order by %@", v21];
  }

  if (v18) {
    objc_msgSend(v20, "appendFormat:", @" limit %ld", objc_msgSend(v18, "integerValue"));
  }
  -[SFSQLite statementForSQL:](self, "statementForSQL:", v20);
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x186DFF9D0]([v22 bindValues:v16]);
  if ([v22 step])
  {
    while (1)
    {
      [v22 allObjectsByColumnName];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        char v26 = 0;
        v19[2](v19, v24, &v26);
        if (v26) {
          break;
        }
      }

      objc_autoreleasePoolPop(v23);
      v23 = (void *)MEMORY[0x186DFF9D0]();
      if (([v22 step] & 1) == 0) {
        goto LABEL_13;
      }
    }
  }

- (id)selectFrom:(id)a3 where:(id)a4 bindings:(id)a5 limit:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(MEMORY[0x189607940]);
  [v14 appendFormat:@"select * from %@", v10];
  if ([v11 length]) {
    [v14 appendFormat:@" where %@", v11];
  }
  if (v13) {
    objc_msgSend(v14, "appendFormat:", @" limit %ld", objc_msgSend(v13, "integerValue"));
  }
  id v15 = objc_alloc_init(MEMORY[0x189603FA8]);
  -[SFSQLite statementForSQL:](self, "statementForSQL:", v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 bindValues:v12];
  if ([v16 step])
  {
    do
    {
      [v16 allObjectsByColumnName];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 addObject:v17];
    }

    while (([v16 step] & 1) != 0);
  }

  [v16 reset];

  return v15;
}

- (void)update:(id)a3 set:(id)a4 where:(id)a5 bindings:(id)a6 limit:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ([v12 length])
  {
    id v16 = objc_alloc_init(MEMORY[0x189607940]);
    [v16 appendFormat:@"update %@", v18];
    [v16 appendFormat:@" set %@", v12];
    if ([v13 length]) {
      [v16 appendFormat:@" where %@", v13];
    }
    if (v15) {
      objc_msgSend(v16, "appendFormat:", @" limit %ld", objc_msgSend(v15, "integerValue"));
    }
    -[SFSQLite statementForSQL:](self, "statementForSQL:", v16);
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 bindValues:v14];
    while (([v17 step] & 1) != 0)
      ;
    [v17 reset];
  }
}

- (id)selectAllFrom:(id)a3 where:(id)a4 bindings:(id)a5
{
  return -[SFSQLite selectFrom:where:bindings:limit:](self, "selectFrom:where:bindings:limit:", a3, a4, a5, 0LL);
}

- (unint64_t)selectCountFrom:(id)a3 where:(id)a4 bindings:(id)a5
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectAtIndexedSubscript:0];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:@"n"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v8 = [v7 unsignedIntegerValue];

  return v8;
}

- (int64_t)insertOrReplaceInto:(id)a3 values:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 allKeys];
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 sortedArrayUsingSelector:sel_compare_];
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();

  id v10 = objc_alloc_init(MEMORY[0x189603FA8]);
  if ([v9 count])
  {
    unint64_t v11 = 0LL;
    do
    {
      [v9 objectAtIndexedSubscript:v11];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 objectForKeyedSubscript:v12];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 setObject:v13 atIndexedSubscript:v11];

      ++v11;
    }

    while (v11 < [v9 count]);
  }

  id v14 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"insert or replace into "];
  [v14 appendString:v6];
  objc_msgSend(v14, "appendString:", @" (");
  if ([v9 count])
  {
    unint64_t v15 = 0LL;
    do
    {
      [v9 objectAtIndexedSubscript:v15];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 appendString:v16];

      if (v15 != [v9 count] - 1) {
        [v14 appendString:@","];
      }
      ++v15;
    }

    while (v15 < [v9 count]);
  }

  [v14 appendString:@" values (")];
  if ([v9 count])
  {
    unint64_t v17 = 0LL;
    do
    {
      if (v17 == [v9 count] - 1) {
        id v18 = @"?";
      }
      else {
        id v18 = @"?,";
      }
      [v14 appendString:v18];
      ++v17;
    }

    while (v17 < [v9 count]);
  }

  [v14 appendString:@""]);
  -[SFSQLite statementForSQL:](self, "statementForSQL:", v14);
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 bindValues:v10];
  [v19 step];
  [v19 reset];
  int64_t v20 = -[SFSQLite lastInsertRowID](self, "lastInsertRowID");

  return v20;
}

- (void)deleteFrom:(id)a3 matchingValues:(id)a4
{
  id v18 = self;
  id v19 = a3;
  id v5 = a4;
  [v5 allKeys];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 sortedArrayUsingSelector:sel_compare_];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  id v8 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v9 = objc_alloc_init(MEMORY[0x189607940]);
  if ([v7 count])
  {
    unint64_t v10 = 0LL;
    int v11 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v10, v18);
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 objectForKeyedSubscript:v12];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();

      [v7 objectAtIndexedSubscript:v10];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 appendString:v14];

      if (v13
        && ([MEMORY[0x189603FE8] null],
            unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(),
            char v16 = [v15 isEqual:v13],
            v15,
            (v16 & 1) == 0))
      {
        [v8 setObject:v13 atIndexedSubscript:v11];
        unint64_t v17 = @"=?";
        ++v11;
      }

      else
      {
        unint64_t v17 = @" is NULL";
      }

      [v9 appendString:v17];
      if (v10 != [v7 count] - 1) {
        [v9 appendString:@" AND "];
      }

      ++v10;
    }

    while (v10 < [v7 count]);
  }

  -[SFSQLite deleteFrom:where:bindings:](v18, "deleteFrom:where:bindings:", v19, v9, v8, v18);
}

- (void)deleteFrom:(id)a3 where:(id)a4 bindings:(id)a5
{
  id v8 = (void *)NSString;
  id v9 = a5;
  [v8 stringWithFormat:@"delete from %@ where %@", a3, a4];
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  -[SFSQLite statementForSQL:](self, "statementForSQL:", v11);
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 bindValues:v9];

  [v10 step];
  [v10 reset];
}

- (id)_tableNameForClass:(Class)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  -[objc_class SFSQLiteClassName](a3, "SFSQLiteClassName");
  float v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 hasPrefix:self->_objectClassPrefix])
  {
    objc_msgSend(v4, "substringFromIndex:", -[NSString length](self->_objectClassPrefix, "length"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    secLogObjForScope("SecError");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objectClassPrefix = self->_objectClassPrefix;
      int v9 = 138412546;
      unint64_t v10 = v4;
      __int16 v11 = 2112;
      id v12 = objectClassPrefix;
      _os_log_impl( &dword_1804F4000,  v6,  OS_LOG_TYPE_DEFAULT,  "sfsqlite: Object class \"%@\" does not have prefix \"%@\"",  (uint8_t *)&v9,  0x16u);
    }

    id v5 = 0LL;
  }

  return v5;
}

- (int)dbUserVersion
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v2 step])
  {
    do
      int v3 = [v2 intAtIndex:0];
    while (([v2 step] & 1) != 0);
  }

  else
  {
    int v3 = 0;
  }

  [v2 reset];

  return v3;
}

- (int)autoVacuumSetting
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v2 step])
  {
    do
      int v3 = [v2 intAtIndex:0];
    while (([v2 step] & 1) != 0);
  }

  else
  {
    int v3 = 0;
  }

  [v2 reset];

  return v3;
}

- (SFSQLiteDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (NSString)schema
{
  return self->_schema;
}

- (NSString)schemaVersion
{
  return self->_schemaVersion;
}

- (NSString)objectClassPrefix
{
  return self->_objectClassPrefix;
}

- (void)setObjectClassPrefix:(id)a3
{
}

- (void)setUserVersion:(int)a3
{
  self->_userVersion = a3;
}

- (int64_t)synchronousMode
{
  return self->_synchronousMode;
}

- (void)setSynchronousMode:(int64_t)a3
{
  self->_synchronousMode = a3;
}

- (BOOL)hasMigrated
{
  return self->_hasMigrated;
}

- (BOOL)traced
{
  return self->_traced;
}

- (void)setTraced:(BOOL)a3
{
  self->_traced = a3;
}

- (sqlite3)db
{
  return self->_db;
}

- (void)setDb:(sqlite3 *)a3
{
  self->_db = a3;
}

- (unint64_t)openCount
{
  return self->_openCount;
}

- (void)setOpenCount:(unint64_t)a3
{
  self->_unint64_t openCount = a3;
}

- (BOOL)corrupt
{
  return self->_corrupt;
}

- (void)setCorrupt:(BOOL)a3
{
  self->_corrupt = a3;
}

- (NSMutableDictionary)statementsBySQL
{
  return self->_statementsBySQL;
}

- (void)setDateFormatter:(id)a3
{
}

- (void)setOldDateFormatter:(id)a3
{
}

- (void).cxx_destruct
{
}

void __59__SFSQLite_select_from_where_bindings_orderBy_limit_block___block_invoke(uint64_t a1, void *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    int v3 = v5;
  }
}

void __35__SFSQLite_select_from_mapEachRow___block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    int v3 = v2;
    [*(id *)(a1 + 32) addObject:v2];
    unint64_t v2 = v3;
  }
}

@end