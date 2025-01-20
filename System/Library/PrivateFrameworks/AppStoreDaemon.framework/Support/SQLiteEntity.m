@interface SQLiteEntity
+ (Class)memoryEntityClass;
+ (id)databaseTable;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)foreignDatabaseColumnForProperty:(id)a3;
+ (id)foreignDatabaseTableForProperty:(id)a3;
+ (id)foreignDatabaseTablesToDelete;
+ (id)foreignKeyColumnForTable:(id)a3;
+ (id)joinClauseForProperty:(id)a3;
+ (id)memoryEntityForPersistentID:(int64_t)a3 usingConnection:(id)a4;
+ (id)memoryEntityForPersistentID:(int64_t)a3 withProperties:(id)a4 usingConnection:(id)a5;
- (BOOL)deleteFromDatabase;
- (BOOL)existsInDatabase;
- (BOOL)setValue:(id)a3 forProperty:(id)a4;
- (BOOL)setValuesWithDictionary:(id)a3;
- (SQLiteConnection)connection;
- (SQLiteEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4;
- (SQLiteEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4;
- (id)getValuesForProperties:(id)a3;
- (id)valueForProperty:(id)a3;
- (int64_t)persistentID;
@end

@implementation SQLiteEntity

+ (id)memoryEntityForPersistentID:(int64_t)a3 usingConnection:(id)a4
{
  return [a1 memoryEntityForPersistentID:a3 withProperties:0 usingConnection:a4];
}

+ (id)memoryEntityForPersistentID:(int64_t)a3 withProperties:(id)a4 usingConnection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = (objc_class *)[a1 memoryEntityClass];
  v11 = v10;
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
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = sub_1002951A0;
  v19 = &unk_1003F0238;
  id v12 = sub_1002950C0((NSMutableDictionary *)self, v6);
  v20 = v12;
  id v23 = v10;
  id v13 = v7;
  id v21 = v13;
  v22 = &v24;
  sub_1001D6D30((uint64_t)v13, &v16);
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
  v10[2] = sub_10029581C;
  v10[3] = &unk_1003F0260;
  v10[4] = self;
  v10[5] = &v11;
  sub_1001D6D30((uint64_t)connection, v10);
  if (*((_BYTE *)v12 + 24))
  {
    int64_t v4 = -[SQLiteEntity persistentID](self, "persistentID");
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100295AAC;
    block[3] = &unk_1003E9EA8;
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
  v10[2] = sub_100295C88;
  v10[3] = &unk_1003EBBD8;
  v10[4] = self;
  v10[5] = &v11;
  sub_1001D64E8((uint64_t)connection, v7, v10);
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
    v33[2] = sub_10029601C;
    v33[3] = &unk_1003F0288;
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
    v15 = v14;
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
    v26[2] = sub_1002960BC;
    v26[3] = &unk_1003F02D8;
    v26[4] = self;
    id v27 = v4;
    id v23 = v21;
    id v28 = v23;
    sub_1001D64E8((uint64_t)connection, v13, v26);
    uint64_t v24 = v28;
    id v9 = v23;
  }

  return v9;
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
  v12[2] = sub_10029646C;
  v12[3] = &unk_1003F0350;
  v12[4] = self;
  id v9 = v4;
  id v13 = v9;
  id v16 = v6;
  id v10 = v7;
  id v14 = v10;
  v15 = &v17;
  sub_1001D6D30((uint64_t)connection, v12);
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

@end