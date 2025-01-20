@interface SQLiteEntity
+ (BOOL)existsInDatabase:(id)a3 predicate:(id)a4;
+ (id)_aggregateValueForProperty:(id)a3 function:(id)a4 predicate:(id)a5 database:(id)a6;
+ (id)anyInDatabase:(id)a3 predicate:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)copyDatabaseDictionaryToSetClientDictionary:(id)a3;
+ (id)databasePropertyToGetClientProperty:(id)a3;
+ (id)databasePropertyToSetClientProperty:(id)a3;
+ (id)databaseTable;
+ (id)databaseValueForProperty:(id)a3 clientValue:(id)a4;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)foreignDatabaseColumnForProperty:(id)a3;
+ (id)foreignDatabaseTableForProperty:(id)a3;
+ (id)foreignDatabaseTablesToDelete;
+ (id)foreignKeyColumnForTable:(id)a3;
+ (id)maxValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5;
+ (id)minValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5;
+ (id)queryWithDatabase:(id)a3 predicate:(id)a4;
+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 orderingProperties:(id)a5;
+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6;
+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6 limit:(int64_t)a7;
+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6 limit:(int64_t)a7 groupingProperties:(id)a8;
+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6 limit:(int64_t)a7 groupingProperties:(id)a8 returnsDistinctEntities:(BOOL)a9;
+ (id)sumForProperty:(id)a3 predicate:(id)a4 database:(id)a5;
+ (int64_t)countDistinctInDatabase:(id)a3 predicate:(id)a4;
+ (int64_t)countInDatabase:(id)a3 predicate:(id)a4;
+ (void)applyPropertySetters:(id)a3 toObject:(id)a4 withProperties:(id)a5 values:(const void *)a6;
- (BOOL)deleteFromDatabase;
- (BOOL)existsInDatabase;
- (BOOL)setValue:(id)a3 forProperty:(id)a4;
- (BOOL)setValuesWithDictionary:(id)a3;
- (SQLiteDatabase)database;
- (SQLiteEntity)init;
- (SQLiteEntity)initWithPersistentID:(int64_t)a3 inDatabase:(id)a4;
- (SQLiteEntity)initWithPropertyValues:(id)a3 inDatabase:(id)a4;
- (id)valueForExternalProperty:(id)a3;
- (id)valueForProperty:(id)a3;
- (int64_t)persistentID;
- (void)getValuesForProperties:(id)a3 withApplier:(id)a4;
@end

@implementation SQLiteEntity

- (SQLiteEntity)init
{
  return 0LL;
}

- (SQLiteEntity)initWithPersistentID:(int64_t)a3 inDatabase:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SQLiteEntity;
  result = -[SQLiteEntity init](&v7, "init");
  if (result)
  {
    result->_database = (SQLiteDatabase *)a4;
    result->_persistentID = a3;
  }

  return result;
}

- (SQLiteEntity)initWithPropertyValues:(id)a3 inDatabase:(id)a4
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
    v11 = CFUUIDCreate(0LL);
    id v10 = (id)*(_OWORD *)&CFUUIDGetUUIDBytes(v11);
    CFRelease(v11);
  }

  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 1;
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = sub_10005F1AC;
  v19 = &unk_10063D3E8;
  v12 = sub_10005F0CC((NSMutableDictionary *)self, v6);
  v20 = v12;
  id v23 = v10;
  id v13 = v7;
  id v21 = v13;
  v22 = &v24;
  sub_1002CCC5C((uint64_t)v13, &v16);
  if (*((_BYTE *)v25 + 24))
  {
    self =  -[SQLiteEntity initWithPersistentID:inDatabase:]( self,  "initWithPersistentID:inDatabase:",  v10,  v13,  v16,  v17,  v18,  v19,  v20);
    v14 = self;
  }

  else
  {
    v14 = 0LL;
  }

  _Block_object_dispose(&v24, 8);
  return v14;
}

+ (id)copyDatabaseDictionaryToSetClientDictionary:(id)a3
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10005F7A0;
  v7[3] = &unk_10063D410;
  id v9 = a1;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

+ (id)databasePropertyToGetClientProperty:(id)a3
{
  return a3;
}

+ (id)databasePropertyToSetClientProperty:(id)a3
{
  return a3;
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  return 0LL;
}

+ (id)databaseValueForProperty:(id)a3 clientValue:(id)a4
{
  return a4;
}

+ (id)databaseTable
{
  return 0LL;
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  [a1 addJoinClausesForProperty:v4 toJoins:v5];
  if (-[NSMutableSet count](v5, "count"))
  {
    id v6 = (NSString *)v4;
  }

  else
  {
    id v7 = objc_alloc(&OBJC_CLASS___NSString);
    v8 = (void *)objc_claimAutoreleasedReturnValue([a1 databaseTable]);
    id v6 = -[NSString initWithFormat:](v7, "initWithFormat:", @"%@.%@", v8, v4);
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

- (BOOL)deleteFromDatabase
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  database = self->_database;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10005FAE8;
  v5[3] = &unk_10063D438;
  v5[4] = self;
  v5[5] = &v6;
  sub_1002CCC5C((uint64_t)database, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)existsInDatabase
{
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  char v3 = objc_alloc(&OBJC_CLASS___NSString);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "databaseTable");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"SELECT 1 FROM %@ WHERE %@ = ? LIMIT 1;",
         v6,
         @"ROWID");

  database = self->_database;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10005FEC4;
  v10[3] = &unk_10063D460;
  v10[4] = self;
  v10[5] = &v11;
  sub_1002CCDD0((uint64_t)database, v7, 1, v10);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc(&OBJC_CLASS___NSDictionary);
  char v9 = v8;
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
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 1;
  id v6 = (void *)objc_opt_class(self, v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 databaseTable]);
  database = self->_database;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100060804;
  v12[3] = &unk_10063D560;
  v12[4] = self;
  id v9 = v4;
  id v13 = v9;
  v16 = v6;
  id v10 = v7;
  id v14 = v10;
  v15 = &v17;
  sub_1002CCC5C((uint64_t)database, v12);
  LOBYTE(v6) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)v6;
}

- (id)valueForExternalProperty:(id)a3
{
  return 0LL;
}

- (id)valueForProperty:(id)a3
{
  id v9 = a3;
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  id v6 = sub_10005FF14((uint64_t)self, v5);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v4, v9));
  return v7;
}

- (void)getValuesForProperties:(id)a3 withApplier:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, id, void *))a4;
  id v7 = [v12 count];
  if (v7)
  {
    size_t v8 = (size_t)v7;
    id v9 = sub_10005FF14((uint64_t)self, v12);
    id v10 = calloc(v8, 8uLL);
    for (uint64_t i = 0LL; i != v8; ++i)
      v10[i] =  -[NSMutableDictionary objectForKeyedSubscript:]( v9,  "objectForKeyedSubscript:",  [v12 objectAtIndexedSubscript:i]);
    v6[2](v6, v12, v10);
    free(v10);
  }
}

+ (void)applyPropertySetters:(id)a3 toObject:(id)a4 withProperties:(id)a5 values:(const void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = 0LL;
    uint64_t v15 = *(void *)v19;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = (void (**)(id, id, void)) [v9 objectForKey:*(void *)(*((void *)&v18 + 1) + 8 * (void)v16)];
        if (v17) {
          v17[2](v17, v10, *(&a6[v14] + (void)v16));
        }
        v16 = (char *)v16 + 1;
      }

      while (v13 != v16);
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      v14 += (uint64_t)v16;
    }

    while (v13);
  }
}

- (SQLiteDatabase)database
{
  return self->_database;
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

+ (id)anyInDatabase:(id)a3 predicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  __int128 v19 = sub_10008786C;
  __int128 v20 = sub_10008787C;
  id v21 = 0LL;
  size_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100087884;
  v12[3] = &unk_10063E7D8;
  uint64_t v14 = &v16;
  id v15 = a1;
  id v9 = v6;
  id v13 = v9;
  [v8 enumeratePersistentIDsUsingBlock:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

+ (BOOL)existsInDatabase:(id)a3 predicate:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:a3 predicate:a4]);
  unsigned __int8 v5 = [v4 exists];

  return v5;
}

+ (int64_t)countInDatabase:(id)a3 predicate:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:a3 predicate:a4]);
  id v5 = [v4 countOfEntities];

  return (int64_t)v5;
}

+ (int64_t)countDistinctInDatabase:(id)a3 predicate:(id)a4
{
  LOBYTE(v7) = 1;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:a3 predicate:a4 orderingProperties:0 orderingDirections:0 limit:0 groupingProperties:0 returnsDistinctEntities:v7]);
  id v5 = [v4 countOfEntities];

  return (int64_t)v5;
}

+ (id)_aggregateValueForProperty:(id)a3 function:(id)a4 predicate:(id)a5 database:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  v30 = sub_10008786C;
  v31 = sub_10008787C;
  id v32 = 0LL;
  uint64_t v14 = objc_alloc_init(&OBJC_CLASS___SQLiteQueryDescriptor);
  -[SQLiteQueryDescriptor setEntityClass:](v14, "setEntityClass:", a1);
  -[SQLiteQueryDescriptor setPredicate:](v14, "setPredicate:", v12);
  id v15 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([a1 disambiguatedSQLForProperty:v10]);
  uint64_t v17 = -[NSString initWithFormat:](v15, "initWithFormat:", @"%@(%@)", v11, v16);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v10));
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v17));
  id v20 = -[SQLiteQueryDescriptor _newSelectSQLWithProperties:columns:]( v14,  "_newSelectSQLWithProperties:columns:",  v18,  v19);

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100087B9C;
  v24[3] = &unk_10063D460;
  id v21 = v14;
  v25 = v21;
  uint64_t v26 = &v27;
  sub_1002CCDBC((uint64_t)v13, v20, v24);
  id v22 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v22;
}

+ (id)maxValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5
{
  return _[a1 _aggregateValueForProperty:a3 function:@"MAX" predicate:a4 database:a5];
}

+ (id)minValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5
{
  return _[a1 _aggregateValueForProperty:a3 function:@"MIN" predicate:a4 database:a5];
}

+ (id)sumForProperty:(id)a3 predicate:(id)a4 database:(id)a5
{
  return _[a1 _aggregateValueForProperty:a3 function:@"SUM" predicate:a4 database:a5];
}

+ (id)queryWithDatabase:(id)a3 predicate:(id)a4
{
  return [a1 queryWithDatabase:a3 predicate:a4 orderingProperties:0];
}

+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 orderingProperties:(id)a5
{
  return [a1 queryWithDatabase:a3 predicate:a4 orderingProperties:a5 orderingDirections:0];
}

+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6
{
  return [a1 queryWithDatabase:a3 predicate:a4 orderingProperties:a5 orderingDirections:a6 limit:0];
}

+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6 limit:(int64_t)a7
{
  return [a1 queryWithDatabase:a3 predicate:a4 orderingProperties:a5 orderingDirections:a6 limit:a7 groupingProperties:0];
}

+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6 limit:(int64_t)a7 groupingProperties:(id)a8
{
  LOBYTE(v9) = 0;
  return [a1 queryWithDatabase:a3 predicate:a4 orderingProperties:a5 orderingDirections:a6 limit:a7 groupingProperties:a8 returnsDistinctEntities:v9];
}

+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6 limit:(int64_t)a7 groupingProperties:(id)a8 returnsDistinctEntities:(BOOL)a9
{
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = objc_alloc_init(&OBJC_CLASS___SQLiteQueryDescriptor);
  -[SQLiteQueryDescriptor setEntityClass:](v20, "setEntityClass:", a1);
  -[SQLiteQueryDescriptor setOrderingProperties:](v20, "setOrderingProperties:", v17);

  -[SQLiteQueryDescriptor setOrderingDirections:](v20, "setOrderingDirections:", v16);
  -[SQLiteQueryDescriptor setPredicate:](v20, "setPredicate:", v18);

  -[SQLiteQueryDescriptor setLimitCount:](v20, "setLimitCount:", a7);
  -[SQLiteQueryDescriptor setGroupingProperties:](v20, "setGroupingProperties:", v15);

  -[SQLiteQueryDescriptor setReturnsDistinctEntities:](v20, "setReturnsDistinctEntities:", a9);
  id v21 = -[SQLiteQuery initWithDatabase:descriptor:]( objc_alloc(&OBJC_CLASS___SQLiteQuery),  "initWithDatabase:descriptor:",  v19,  v20);

  return v21;
}

@end