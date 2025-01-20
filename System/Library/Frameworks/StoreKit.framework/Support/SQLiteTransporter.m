@interface SQLiteTransporter
+ (BOOL)_isKnownDatabasePath:(id)a3;
+ (void)_addKnownDatabasePath:(id)a3;
+ (void)_removeKnownDatabasePath:(id)a3;
- (BOOL)canBeginTransportation;
- (BOOL)endTransporationAndRemoveDatabase;
- (SQLiteTransporter)initWithDatabasePath:(id)a3;
- (void)performTransportationUsingBlock:(id)a3;
@end

@implementation SQLiteTransporter

- (SQLiteTransporter)initWithDatabasePath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SQLiteTransporter;
  v6 = -[SQLiteTransporter init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_databasePath, a3);
  }

  return v7;
}

- (BOOL)canBeginTransportation
{
  p_databasePath = &self->_databasePath;
  if (+[SQLiteTransporter _isKnownDatabasePath:]( &OBJC_CLASS___SQLiteTransporter,  "_isKnownDatabasePath:",  self->_databasePath))
  {
    if (qword_10032DE70 != -1) {
      dispatch_once(&qword_10032DE70, &stru_1002E6E50);
    }
    v4 = (os_log_s *)qword_10032DE58;
    if (os_log_type_enabled((os_log_t)qword_10032DE58, OS_LOG_TYPE_ERROR)) {
      sub_10025B6B0((uint64_t)p_databasePath, v4, v5, v6, v7, v8, v9, v10);
    }
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v12 = [v11 fileExistsAtPath:*p_databasePath];

    if ((v12 & 1) != 0)
    {
      +[SQLiteTransporter _addKnownDatabasePath:]( &OBJC_CLASS___SQLiteTransporter,  "_addKnownDatabasePath:",  self->_databasePath);
      v13 = -[SQLiteConnectionOptions initWithDatabasePath:]( objc_alloc(&OBJC_CLASS___SQLiteConnectionOptions),  "initWithDatabasePath:",  self->_databasePath);
      -[SQLiteConnectionOptions setReadOnly:](v13, "setReadOnly:", 1LL);
      v14 = -[SQLiteConnection initWithOptions:](objc_alloc(&OBJC_CLASS___SQLiteConnection), "initWithOptions:", v13);
      connection = self->_connection;
      self->_connection = v14;

      BOOL v16 = -[SQLiteConnection open](self->_connection, "open");
      return v16;
    }

    if (qword_10032DE70 != -1) {
      dispatch_once(&qword_10032DE70, &stru_1002E6E50);
    }
    v18 = (os_log_s *)qword_10032DE58;
    if (os_log_type_enabled((os_log_t)qword_10032DE58, OS_LOG_TYPE_ERROR)) {
      sub_10025B718((uint64_t)p_databasePath, v18, v19, v20, v21, v22, v23, v24);
    }
  }

  return 0;
}

- (BOOL)endTransporationAndRemoveDatabase
{
  if (-[SQLiteConnection close](self->_connection, "close") && sub_1000187C8(self->_databasePath))
  {
    +[SQLiteTransporter _removeKnownDatabasePath:]( &OBJC_CLASS___SQLiteTransporter,  "_removeKnownDatabasePath:",  self->_databasePath);
    LOBYTE(v3) = 1;
  }

  else
  {
    if (qword_10032DE70 != -1) {
      dispatch_once(&qword_10032DE70, &stru_1002E6E50);
    }
    v4 = (os_log_s *)qword_10032DE58;
    BOOL v3 = os_log_type_enabled((os_log_t)qword_10032DE58, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      sub_10025B780((uint64_t)self, v4, v5, v6, v7, v8, v9, v10);
      LOBYTE(v3) = 0;
    }
  }

  return v3;
}

- (void)performTransportationUsingBlock:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000DA6C;
  v7[3] = &unk_1002E6DF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[SQLiteConnection performTransaction:](connection, "performTransaction:", v7);
}

+ (void)_addKnownDatabasePath:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10032DE20);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[AppDefaultsManager transporterConfiguration]( &OBJC_CLASS___AppDefaultsManager,  "transporterConfiguration"));
  id v4 = (NSMutableDictionary *)[v3 mutableCopy];

  if (!v4)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    goto LABEL_5;
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", @"knownPaths"));
  id v6 = [v5 mutableCopy];

  if (!v6)
  {
LABEL_5:
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v7));
    goto LABEL_6;
  }

  [v6 addObject:v7];
LABEL_6:
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, @"knownPaths");
  +[AppDefaultsManager setTransporterConfiguration:]( &OBJC_CLASS___AppDefaultsManager,  "setTransporterConfiguration:",  v4);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10032DE20);
}

+ (BOOL)_isKnownDatabasePath:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10032DE20);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AppDefaultsManager transporterConfiguration]( &OBJC_CLASS___AppDefaultsManager,  "transporterConfiguration"));
  id v5 = [v4 mutableCopy];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"knownPaths"]);
    id v7 = [v6 mutableCopy];

    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 indexesOfObjectsPassingTest:&stru_1002E6E30]);
      if ([v8 count])
      {
        [v7 removeObjectsAtIndexes:v8];
        [v5 setObject:v7 forKeyedSubscript:@"knownPaths"];
        +[AppDefaultsManager setTransporterConfiguration:]( &OBJC_CLASS___AppDefaultsManager,  "setTransporterConfiguration:",  v5);
      }

      unsigned __int8 v9 = [v7 containsObject:v3];
    }

    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10032DE20);

  return v9;
}

+ (void)_removeKnownDatabasePath:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10032DE20);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[AppDefaultsManager transporterConfiguration]( &OBJC_CLASS___AppDefaultsManager,  "transporterConfiguration"));
  id v4 = [v3 mutableCopy];

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"knownPaths"]);
    id v6 = [v5 mutableCopy];

    if (v6)
    {
      [v6 removeObject:v7];
      [v4 setObject:v6 forKeyedSubscript:@"knownPaths"];
      +[AppDefaultsManager setTransporterConfiguration:]( &OBJC_CLASS___AppDefaultsManager,  "setTransporterConfiguration:",  v4);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10032DE20);
}

- (void).cxx_destruct
{
}

@end