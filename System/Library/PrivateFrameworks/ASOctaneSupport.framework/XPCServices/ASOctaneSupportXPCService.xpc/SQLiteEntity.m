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
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation SQLiteEntity

+ (id)anyOnConnection:(id)a3 predicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  v19 = sub_10000A9A0;
  v20 = sub_10000A9B0;
  id v21 = 0LL;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryOnConnection:v6 predicate:v7]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000A9B8;
  v12[3] = &unk_10026F5C8;
  v14 = &v16;
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
  v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  v19 = sub_10000A9A0;
  v20 = sub_10000A9B0;
  id v21 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryOnConnection:v6 predicate:v7]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000AB48;
  v12[3] = &unk_10026F5F0;
  id v15 = a1;
  id v9 = v6;
  id v13 = v9;
  v14 = &v16;
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
  v5 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( [a1 _aggregateValueForProperty:a3 function:@"SUM" predicate:a4 onConnection:a5]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0) {
    v8 = v5;
  }
  else {
    v8 = &off_100297A98;
  }
  id v9 = v8;

  return v9;
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4
{
  return _[a1 queryOnConnection:a3 predicate:a4 orderingProperties:0];
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5
{
  return _[a1 queryOnConnection:a3 predicate:a4 orderingProperties:a5 orderingDirections:0];
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
  v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  v30 = sub_10000A9A0;
  v31 = sub_10000A9B0;
  id v32 = 0LL;
  id v14 = -[SQLiteQueryDescriptor initWithEntityClass:]( objc_alloc(&OBJC_CLASS___SQLiteQueryDescriptor),  "initWithEntityClass:",  a1);
  -[SQLiteQueryDescriptor setPredicate:](v14, "setPredicate:", v12);
  id v15 = objc_alloc(&OBJC_CLASS___NSString);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([a1 disambiguatedSQLForProperty:v10]);
  v17 = -[NSString initWithFormat:](v15, "initWithFormat:", @"%@(%@)", v11, v16);

  id v33 = v10;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v17));
  id v20 = -[SQLiteQueryDescriptor _newSelectSQLWithProperties:columns:]( v14,  "_newSelectSQLWithProperties:columns:",  v18,  v19);

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10000AF98;
  v24[3] = &unk_10026F618;
  id v21 = v14;
  v25 = v21;
  v26 = &v27;
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

- (SQLiteEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SQLiteEntity;
  id v8 = -[SQLiteEntity init](&v11, "init");
  id v9 = v8;
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
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"ROWID"]);
  id v9 = v8;
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
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  uint64_t v18 = sub_1000141D4;
  v19 = &unk_10026FD58;
  id v12 = -[SQLiteEntity _copyTableClusteredValuesWithValues:](self, "_copyTableClusteredValuesWithValues:", v6);
  id v20 = v12;
  id v23 = v10;
  id v13 = v7;
  id v21 = v13;
  id v22 = &v24;
  [v13 performTransaction:&v16];
  if (!*((_BYTE *)v25 + 24))
  {

    self = 0LL;
  }

  id v14 = -[SQLiteEntity initWithPersistentID:onConnection:]( self,  "initWithPersistentID:onConnection:",  v10,  v13,  v16,  v17,  v18,  v19);

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
  return (Class)objc_opt_class(&OBJC_CLASS___SQLiteMemoryEntity, a2);
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
  v10[2] = sub_1000144E8;
  v10[3] = &unk_10026FD80;
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
    block[2] = sub_1000146B8;
    block[3] = &unk_10026FDA0;
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
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "databaseTable");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"SELECT 1 FROM %@ WHERE %@ = ? LIMIT 1;",
         v6,
         @"ROWID");

  connection = self->_connection;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100014894;
  v10[3] = &unk_10026F618;
  v10[4] = self;
  v10[5] = &v11;
  -[SQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", v7, v10);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

- (id)getValuesForProperties:(id)a3
{
  id v4 = a3;
  if ([v4 count] == (id)1
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:0]),
        unsigned int v7 = [v6 isEqualToString:@"ROWID"],
        v6,
        v7))
  {
    v38 = @"ROWID";
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", self->_persistentID));
    v39 = v8;
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
  }

  else
  {
    id v10 = (void *)objc_opt_class(self, v5);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v10 databaseTable]);
    uint64_t v11 = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  @"SELECT ");
    id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_100014C28;
    v33[3] = &unk_10026FDC8;
    v36 = v10;
    uint64_t v13 = v11;
    v34 = v13;
    char v14 = v12;
    v35 = v14;
    [v4 enumerateObjectsUsingBlock:v33];
    -[NSMutableString appendString:](v13, "appendString:", @" FROM ");
    -[NSMutableString appendString:](v13, "appendString:", v8);
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v15 = v14;
    id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v29,  v37,  16LL);
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v30;
      do
      {
        v19 = 0LL;
        do
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)v19);
          -[NSMutableString appendString:](v13, "appendString:", @" ");
          -[NSMutableString appendString:](v13, "appendString:", v20);
          v19 = (char *)v19 + 1;
        }

        while (v17 != v19);
        id v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v29,  v37,  16LL);
      }

      while (v17);
    }

    -[NSMutableString appendString:](v13, "appendString:", @" WHERE ");
    -[NSMutableString appendString:](v13, "appendString:", v8);
    -[NSMutableString appendString:](v13, "appendString:", @".ROWID = ?;");
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v4 count]));
    connection = self->_connection;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100014CC8;
    v26[3] = &unk_10026FE18;
    v26[4] = self;
    id v27 = v4;
    id v23 = v21;
    id v28 = v23;
    -[SQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", v13, v26);
    uint64_t v24 = v28;
    id v9 = v23;
  }

  return v9;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(&OBJC_CLASS___NSDictionary);
  id v9 = v8;
  if (v6)
  {
    id v10 = -[NSDictionary initWithObjectsAndKeys:](v8, "initWithObjectsAndKeys:", v6, v7, 0LL);
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    id v10 = -[NSDictionary initWithObjectsAndKeys:](v9, "initWithObjectsAndKeys:", v11, v7, 0LL);
  }

  BOOL v12 = -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v10);

  return v12;
}

- (BOOL)setValuesWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 1;
  id v6 = (void *)objc_opt_class(self, v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 databaseTable]);
  connection = self->_connection;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100015078;
  v12[3] = &unk_10026FEB8;
  void v12[4] = self;
  id v9 = v4;
  id v13 = v9;
  id v16 = v6;
  id v10 = v7;
  id v14 = v10;
  id v15 = &v17;
  -[SQLiteConnection performTransaction:](connection, "performTransaction:", v12);
  LOBYTE(v6) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)v6;
}

- (id)valueForProperty:(id)a3
{
  id v9 = a3;
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity getValuesForProperties:](self, "getValuesForProperties:", v5, v9));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

  return v7;
}

+ (BOOL)_insertValues:(id)a3 intoTable:(id)a4 withPersistentID:(int64_t)a5 onConnection:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  BOOL v12 = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  @"INSERT OR REPLACE INTO ");
  -[NSMutableString appendString:](v12, "appendString:", v10);
  -[NSMutableString appendString:](v12, "appendString:", @" (");
  id v31 = a1;
  uint64_t v13 = objc_claimAutoreleasedReturnValue([a1 foreignKeyColumnForTable:v10]);
  id v14 = (void *)v13;
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
  v33[2] = sub_100015A78;
  v33[3] = &unk_10026F938;
  int64_t v35 = a5;
  id v36 = 0LL;
  id v26 = v22;
  id v34 = v26;
  unsigned __int8 v27 = [v11 executeStatement:v12 error:&v36 bindings:v33];
  id v28 = v36;
  if (v28)
  {
    if (qword_1002BAF88 != -1) {
      dispatch_once(&qword_1002BAF88, &stru_10026FF00);
    }
    __int128 v29 = (void *)qword_1002BAF70;
    if (os_log_type_enabled((os_log_t)qword_1002BAF70, OS_LOG_TYPE_ERROR)) {
      sub_1001EC35C(v29, (uint64_t)v31, (uint64_t)v28);
    }
  }

  return v27;
}

- (id)_copyTableClusteredValuesWithValues:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100015C94;
  v12[3] = &unk_10026FEE0;
  id v15 = (id)objc_opt_class(self, v6);
  id v13 = (id)objc_claimAutoreleasedReturnValue([v15 databaseTable]);
  id v7 = v5;
  id v14 = v7;
  id v8 = v13;
  [v4 enumerateKeysAndObjectsUsingBlock:v12];

  id v9 = v14;
  id v10 = v7;

  return v10;
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
  v11[2] = sub_100015E50;
  v11[3] = &unk_10026F460;
  v11[4] = self;
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
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSData, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    id v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___NSError, v6),  v3,  0LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
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
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0LL;
  }
  id v7 = v6;

  return v7;
}

- (id)stringValueForProperty:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", a3));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0LL;
  }
  id v7 = v6;

  return v7;
}

- (id)uuidValueForProperty:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", a3));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSUUID, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0LL;
  }
  id v7 = v6;

  return v7;
}

- (id)urlValueForProperty:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", a3));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSURL, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0LL;
  }
  id v7 = v6;

  return v7;
}

@end