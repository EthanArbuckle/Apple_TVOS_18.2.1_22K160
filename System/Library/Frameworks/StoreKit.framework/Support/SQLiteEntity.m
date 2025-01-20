@interface SQLiteEntity
+ (BOOL)_insertValues:(id)a3 intoTable:(id)a4 withPersistentID:(int64_t)a5 onConnection:(id)a6;
+ (Class)memoryEntityClass;
+ (id)_aggregateValueForProperty:(id)a3 function:(id)a4 predicate:(id)a5 onConnection:(id)a6;
+ (id)allOnConnection:(id)a3 predicate:(id)a4;
+ (id)anyOnConnection:(id)a3 predicate:(id)a4;
+ (id)countForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5;
+ (id)databaseTable;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)foreignDatabaseColumnForProperty:(id)a3;
+ (id)foreignDatabaseTableForProperty:(id)a3;
+ (id)foreignDatabaseTablesToDelete;
+ (id)foreignKeyColumnForTable:(id)a3;
+ (id)joinClauseForProperty:(id)a3;
+ (id)maxValueForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5;
+ (id)memoryEntityForPersistentID:(int64_t)a3 usingConnection:(id)a4;
+ (id)memoryEntityForPersistentID:(int64_t)a3 withProperties:(id)a4 usingConnection:(id)a5;
+ (id)minValueForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4 entityClass:(Class)a5;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 entityClass:(Class)a6;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6 entityClass:(Class)a7;
+ (id)sumForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5;
- (BOOL)BOOLValueForProperty:(id)a3;
- (BOOL)_deleteRowFromTable:(id)a3 usingColumn:(id)a4;
- (BOOL)deleteFromDatabase;
- (BOOL)existsInDatabase;
- (BOOL)setValue:(id)a3 forProperty:(id)a4;
- (BOOL)setValuesWithDictionary:(id)a3;
- (SQLiteConnection)connection;
- (SQLiteEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4;
- (SQLiteEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4;
- (id)_copyTableClusteredValuesWithValues:(id)a3;
- (id)errorValueForProperty:(id)a3;
- (id)getValuesForProperties:(id)a3;
- (id)numberValueForProperty:(id)a3;
- (id)stringValueForProperty:(id)a3;
- (id)urlValueForProperty:(id)a3;
- (id)uuidValueForProperty:(id)a3;
- (id)valueForProperty:(id)a3;
- (int64_t)integerValueForProperty:(id)a3;
- (int64_t)persistentID;
@end

@implementation SQLiteEntity

- (SQLiteEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SQLiteEntity;
  v8 = -[SQLiteEntity init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a4);
    v9->_persistentID = a3;
  }

  return v9;
}

- (SQLiteEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"ROWID"]);
  v9 = v8;
  if (v8)
  {
    id v10 = [v8 longLongValue];
  }

  else
  {
    objc_super v11 = CFUUIDCreate(0LL);
    id v10 = (id)*(_OWORD *)&CFUUIDGetUUIDBytes(v11);
    CFRelease(v11);
  }

  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 1;
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = sub_100008CF0;
  v19 = &unk_1002E6AD8;
  id v12 = -[SQLiteEntity _copyTableClusteredValuesWithValues:](self, "_copyTableClusteredValuesWithValues:", v6);
  id v20 = v12;
  id v23 = v10;
  id v13 = v7;
  id v21 = v13;
  v22 = &v24;
  [v13 performTransaction:&v16];
  if (!*((_BYTE *)v25 + 24))
  {

    self = 0LL;
  }

  v14 = -[SQLiteEntity initWithPersistentID:onConnection:]( self,  "initWithPersistentID:onConnection:",  v10,  v13,  v16,  v17,  v18,  v19);

  _Block_object_dispose(&v24, 8);
  return v14;
}

+ (id)databaseTable
{
  return 0LL;
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 joinClauseForProperty:v4]);

  if (v5)
  {
    id v6 = v4;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 databaseTable]);
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.%@", v7, v4));
  }

  return v6;
}

+ (id)foreignDatabaseColumnForProperty:(id)a3
{
  return 0LL;
}

+ (id)foreignDatabaseTableForProperty:(id)a3
{
  return 0LL;
}

+ (id)foreignDatabaseTablesToDelete
{
  return 0LL;
}

+ (id)foreignKeyColumnForTable:(id)a3
{
  return 0LL;
}

+ (id)joinClauseForProperty:(id)a3
{
  return 0LL;
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___SQLiteMemoryEntity);
}

- (BOOL)deleteFromDatabase
{
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  connection = self->_connection;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100009004;
  v10[3] = &unk_1002E6B00;
  v10[4] = self;
  v10[5] = &v11;
  -[SQLiteConnection performTransaction:](connection, "performTransaction:", v10);
  if (*((_BYTE *)v12 + 24))
  {
    int64_t v4 = -[SQLiteEntity persistentID](self, "persistentID");
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000091D4;
    block[3] = &unk_1002E6B20;
    block[4] = v4;
    dispatch_async(v6, block);

    BOOL v7 = *((_BYTE *)v12 + 24) != 0;
  }

  else
  {
    BOOL v7 = 0;
  }

  _Block_object_dispose(&v11, 8);
  return v7;
}

- (BOOL)existsInDatabase
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  id v4 = [(id)objc_opt_class(self) databaseTable];
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"SELECT 1 FROM %@ WHERE %@ = ? LIMIT 1;",
         v5,
         @"ROWID");

  connection = self->_connection;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000093B0;
  v9[3] = &unk_1002E6B48;
  v9[4] = self;
  v9[5] = &v10;
  -[SQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", v6, v9);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (id)getValuesForProperties:(id)a3
{
  id v4 = a3;
  if ([v4 count] == (id)1
    && (v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:0]),
        unsigned int v6 = [v5 isEqualToString:@"ROWID"],
        v5,
        v6))
  {
    v37 = @"ROWID";
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", self->_persistentID));
    v38 = v7;
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
  }

  else
  {
    v9 = (void *)objc_opt_class(self);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v9 databaseTable]);
    uint64_t v10 = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  @"SELECT ");
    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100009744;
    v32[3] = &unk_1002E6B70;
    v35 = v9;
    uint64_t v12 = v10;
    v33 = v12;
    char v13 = v11;
    v34 = v13;
    [v4 enumerateObjectsUsingBlock:v32];
    -[NSMutableString appendString:](v12, "appendString:", @" FROM ");
    -[NSMutableString appendString:](v12, "appendString:", v7);
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    char v14 = v13;
    id v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v28,  v36,  16LL);
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        v18 = 0LL;
        do
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)v18);
          -[NSMutableString appendString:](v12, "appendString:", @" ");
          -[NSMutableString appendString:](v12, "appendString:", v19);
          v18 = (char *)v18 + 1;
        }

        while (v16 != v18);
        id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v28,  v36,  16LL);
      }

      while (v16);
    }

    -[NSMutableString appendString:](v12, "appendString:", @" WHERE ");
    -[NSMutableString appendString:](v12, "appendString:", v7);
    -[NSMutableString appendString:](v12, "appendString:", @".ROWID = ?;");
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v4 count]));
    connection = self->_connection;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1000097E4;
    v25[3] = &unk_1002E6BE8;
    v25[4] = self;
    id v26 = v4;
    id v22 = v20;
    id v27 = v22;
    -[SQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", v12, v25);
    id v23 = v27;
    id v8 = v22;
  }

  return v8;
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(&OBJC_CLASS___NSDictionary);
  v9 = v8;
  if (v6)
  {
    uint64_t v10 = -[NSDictionary initWithObjectsAndKeys:](v8, "initWithObjectsAndKeys:", v6, v7, 0LL);
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    uint64_t v10 = -[NSDictionary initWithObjectsAndKeys:](v9, "initWithObjectsAndKeys:", v11, v7, 0LL);
  }

  BOOL v12 = -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v10);

  return v12;
}

- (BOOL)setValuesWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 1;
  v5 = (void *)objc_opt_class(self);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 databaseTable]);
  connection = self->_connection;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100009B94;
  v11[3] = &unk_1002E6C88;
  v11[4] = self;
  id v8 = v4;
  id v12 = v8;
  id v15 = v5;
  id v9 = v6;
  id v13 = v9;
  char v14 = &v16;
  -[SQLiteConnection performTransaction:](connection, "performTransaction:", v11);
  LOBYTE(v5) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v5;
}

- (id)valueForProperty:(id)a3
{
  id v9 = a3;
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity getValuesForProperties:](self, "getValuesForProperties:", v5, v9));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

  return v7;
}

+ (BOOL)_insertValues:(id)a3 intoTable:(id)a4 withPersistentID:(int64_t)a5 onConnection:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  @"INSERT OR REPLACE INTO ");
  -[NSMutableString appendString:](v12, "appendString:", v10);
  -[NSMutableString appendString:](v12, "appendString:", @" (");
  id v31 = a1;
  uint64_t v13 = objc_claimAutoreleasedReturnValue([a1 foreignKeyColumnForTable:v10]);
  char v14 = (void *)v13;
  if (v13) {
    id v15 = (const __CFString *)v13;
  }
  else {
    id v15 = @"ROWID";
  }
  -[NSMutableString appendString:](v12, "appendString:", v15);
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v42 = 0u;
  __int128 v41 = 0u;
  id v16 = v9;
  id v17 = [v16 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v42 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)i);
        -[NSMutableString appendString:](v12, "appendString:", @", ");
        -[NSMutableString appendString:](v12, "appendString:", v21);
      }

      id v18 = [v16 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }

    while (v18);
  }

  -[NSMutableString appendString:](v12, "appendString:", @" VALUES (?"));
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v22 = v16;
  id v23 = (char *)[v22 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v38;
    while (1)
    {
      if (*(void *)v38 != v25) {
        objc_enumerationMutation(v22);
      }
      -[NSMutableString appendString:](v12, "appendString:", @", ?");
      if (!--v24)
      {
        uint64_t v24 = (char *)[v22 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (!v24) {
          break;
        }
      }
    }
  }

  -[NSMutableString appendString:](v12, "appendString:", @";"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10000A594;
  v33[3] = &unk_1002E6CB0;
  int64_t v35 = a5;
  id v36 = 0LL;
  id v26 = v22;
  id v34 = v26;
  unsigned __int8 v27 = [v11 executeStatement:v12 error:&v36 bindings:v33];
  id v28 = v36;
  if (v28)
  {
    if (qword_10032DD48 != -1) {
      dispatch_once(&qword_10032DD48, &stru_1002E6CF8);
    }
    __int128 v29 = (void *)qword_10032DD30;
    if (os_log_type_enabled((os_log_t)qword_10032DD30, OS_LOG_TYPE_ERROR)) {
      sub_10025B534(v29, (uint64_t)v31, (uint64_t)v28);
    }
  }

  return v27;
}

- (id)_copyTableClusteredValuesWithValues:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000A7B0;
  v11[3] = &unk_1002E6CD8;
  id v14 = (id)objc_opt_class(self);
  id v12 = (id)objc_claimAutoreleasedReturnValue([v14 databaseTable]);
  id v6 = v5;
  uint64_t v13 = v6;
  id v7 = v12;
  [v4 enumerateKeysAndObjectsUsingBlock:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

- (BOOL)_deleteRowFromTable:(id)a3 usingColumn:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"DELETE FROM %@ WHERE %@ = ?;",
         v7,
         v6);

  connection = self->_connection;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000A96C;
  v11[3] = &unk_1002E68B8;
  void v11[4] = self;
  LOBYTE(v7) = -[SQLiteConnection executeStatement:error:bindings:]( connection,  "executeStatement:error:bindings:",  v8,  0LL,  v11);

  return (char)v7;
}

- (SQLiteConnection)connection
{
  return self->_connection;
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (void).cxx_destruct
{
}

- (BOOL)BOOLValueForProperty:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity numberValueForProperty:](self, "numberValueForProperty:", a3));
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (id)errorValueForProperty:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", a3));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___NSError),  v3,  0LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (int64_t)integerValueForProperty:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity numberValueForProperty:](self, "numberValueForProperty:", a3));
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (id)numberValueForProperty:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", a3));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }
  id v6 = v5;

  return v6;
}

- (id)stringValueForProperty:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", a3));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }
  id v6 = v5;

  return v6;
}

- (id)uuidValueForProperty:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", a3));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSUUID);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }
  id v6 = v5;

  return v6;
}

- (id)urlValueForProperty:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", a3));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSURL);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }
  id v6 = v5;

  return v6;
}

+ (id)anyOnConnection:(id)a3 predicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = sub_10005BF54;
  id v20 = sub_10005BF64;
  id v21 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryOnConnection:v6 predicate:v7]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10005BF6C;
  v12[3] = &unk_1002E9628;
  id v14 = &v16;
  id v15 = a1;
  id v9 = v6;
  id v13 = v9;
  [v8 enumeratePersistentIDsUsingBlock:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

+ (id)allOnConnection:(id)a3 predicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = sub_10005BF54;
  id v20 = sub_10005BF64;
  id v21 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryOnConnection:v6 predicate:v7]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10005C0FC;
  v12[3] = &unk_1002E9650;
  id v15 = a1;
  id v9 = v6;
  id v13 = v9;
  id v14 = &v16;
  [v8 enumeratePersistentIDsUsingBlock:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

+ (id)countForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  return [a1 _aggregateValueForProperty:a3 function:@"COUNT" predicate:a4 onConnection:a5];
}

+ (id)maxValueForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  return [a1 _aggregateValueForProperty:a3 function:@"MAX" predicate:a4 onConnection:a5];
}

+ (id)minValueForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  return [a1 _aggregateValueForProperty:a3 function:@"MIN" predicate:a4 onConnection:a5];
}

+ (id)sumForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  id v5 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( [a1 _aggregateValueForProperty:a3 function:@"SUM" predicate:a4 onConnection:a5]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
    id v7 = v5;
  }
  else {
    id v7 = &off_100302840;
  }
  id v8 = v7;

  return v8;
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4
{
  return [a1 queryOnConnection:a3 predicate:a4 orderingProperties:0];
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5
{
  return [a1 queryOnConnection:a3 predicate:a4 orderingProperties:a5 orderingDirections:0];
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6
{
  return _[a1 queryOnConnection:a3 predicate:a4 orderingProperties:a5 orderingDirections:a6 entityClass:a1];
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 entityClass:(Class)a5
{
  return _[a1 queryOnConnection:a3 predicate:a4 orderingProperties:0 orderingDirections:0 entityClass:a5];
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 entityClass:(Class)a6
{
  return _[a1 queryOnConnection:a3 predicate:a4 orderingProperties:a5 orderingDirections:0 entityClass:a6];
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6 entityClass:(Class)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = -[SQLiteQueryDescriptor initWithEntityClass:memoryEntityClass:]( objc_alloc(&OBJC_CLASS___SQLiteQueryDescriptor),  "initWithEntityClass:memoryEntityClass:",  a7,  -[objc_class memoryEntityClass](a7, "memoryEntityClass"));
  -[SQLiteQueryDescriptor setOrderingProperties:](v15, "setOrderingProperties:", v12);

  -[SQLiteQueryDescriptor setOrderingDirections:](v15, "setOrderingDirections:", v11);
  -[SQLiteQueryDescriptor setPredicate:](v15, "setPredicate:", v13);

  id v16 = -[SQLiteQuery initOnConnection:descriptor:]( objc_alloc(&OBJC_CLASS___SQLiteQuery),  "initOnConnection:descriptor:",  v14,  v15);
  return v16;
}

+ (id)_aggregateValueForProperty:(id)a3 function:(id)a4 predicate:(id)a5 onConnection:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  __int128 v30 = sub_10005BF54;
  id v31 = sub_10005BF64;
  id v32 = 0LL;
  id v14 = -[SQLiteQueryDescriptor initWithEntityClass:]( objc_alloc(&OBJC_CLASS___SQLiteQueryDescriptor),  "initWithEntityClass:",  a1);
  -[SQLiteQueryDescriptor setPredicate:](v14, "setPredicate:", v12);
  id v15 = objc_alloc(&OBJC_CLASS___NSString);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([a1 disambiguatedSQLForProperty:v10]);
  id v17 = -[NSString initWithFormat:](v15, "initWithFormat:", @"%@(%@)", v11, v16);

  id v33 = v10;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v17));
  id v20 = -[SQLiteQueryDescriptor _newSelectSQLWithProperties:columns:]( v14,  "_newSelectSQLWithProperties:columns:",  v18,  v19);

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10005C54C;
  v24[3] = &unk_1002E6B48;
  id v21 = v14;
  uint64_t v25 = v21;
  id v26 = &v27;
  [v13 executeQuery:v20 withResults:v24];
  id v22 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v22;
}

+ (id)memoryEntityForPersistentID:(int64_t)a3 usingConnection:(id)a4
{
  return _[a1 memoryEntityForPersistentID:a3 withProperties:0 usingConnection:a4];
}

+ (id)memoryEntityForPersistentID:(int64_t)a3 withProperties:(id)a4 usingConnection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (objc_class *)[a1 memoryEntityClass];
  id v11 = v10;
  if (!v8) {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[objc_class defaultProperties](v10, "defaultProperties"));
  }
  id v12 = [objc_alloc((Class)a1) initWithPersistentID:a3 onConnection:v9];

  id v13 = [[v11 alloc] initWithDatabaseEntity:v12 properties:v8];
  return v13;
}

@end