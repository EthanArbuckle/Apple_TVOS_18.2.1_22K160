@interface SQLiteQuery
- (BOOL)createTemporaryTableWithName:(id)a3 properties:(id)a4;
- (BOOL)deleteAllEntities;
- (SQLiteConnection)connection;
- (SQLiteQueryDescriptor)queryDescriptor;
- (id)_newSelectSQLWithProperties:(id)a3;
- (id)copyEntityIdentifiers;
- (id)copySelectSQLWithProperties:(id)a3;
- (id)initOnConnection:(id)a3 descriptor:(id)a4;
- (int64_t)countOfEntities;
- (void)applyBinding:(id)a3 atIndex:(int *)a4;
- (void)enumerateMemoryEntitiesUsingBlock:(id)a3;
- (void)enumerateMemoryEntitiesWithProperties:(id)a3 usingBlock:(id)a4;
- (void)enumeratePersistentIDsAndProperties:(id)a3 usingBlock:(id)a4;
- (void)enumeratePersistentIDsUsingBlock:(id)a3;
@end

@implementation SQLiteQuery

- (id)initOnConnection:(id)a3 descriptor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SQLiteQuery;
  v9 = -[SQLiteQuery init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    v11 = (SQLiteQueryDescriptor *)[v8 copy];
    descriptor = v10->_descriptor;
    v10->_descriptor = v11;
  }

  return v10;
}

- (void)applyBinding:(id)a3 atIndex:(int *)a4
{
  id v8 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteQueryDescriptor predicate](self->_descriptor, "predicate"));
  [v6 applyBinding:v8 atIndex:a4];

  int64_t v7 = -[SQLiteQueryDescriptor limitCount](self->_descriptor, "limitCount");
  if (v7) {
    [v8 bindInt64:v7 atPosition:(*a4)++];
  }
}

- (SQLiteConnection)connection
{
  return self->_connection;
}

- (id)copyEntityIdentifiers
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100009390;
  v5[3] = &unk_10026F410;
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  v6 = v3;
  -[SQLiteQuery enumeratePersistentIDsUsingBlock:](self, "enumeratePersistentIDsUsingBlock:", v5);

  return v3;
}

- (id)copySelectSQLWithProperties:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v6 = -[SQLiteQueryDescriptor entityClass](self->_descriptor, "entityClass");
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class disambiguatedSQLForProperty:]( v6,  "disambiguatedSQLForProperty:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v11),  (void)v15));
        -[NSMutableArray addObject:](v5, "addObject:", v12);

        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }

  id v13 = -[SQLiteQueryDescriptor _newSelectSQLWithProperties:columns:]( self->_descriptor,  "_newSelectSQLWithProperties:columns:",  v7,  v5);
  return v13;
}

- (int64_t)countOfEntities
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  uint64_t v8 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000095D4;
  v4[3] = &unk_10026F438;
  v4[4] = &v5;
  -[SQLiteQuery enumeratePersistentIDsUsingBlock:](self, "enumeratePersistentIDsUsingBlock:", v4);
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)createTemporaryTableWithName:(id)a3 properties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  @"CREATE TEMPORARY TABLE ");
  v22 = v6;
  -[NSMutableString appendString:](v8, "appendString:", v6);
  -[NSMutableString appendString:](v8, "appendString:", @" AS ");
  id v9 = -[SQLiteQueryDescriptor copy](self->_descriptor, "copy");
  [v9 setOrderingDirections:0];
  [v9 setOrderingProperties:0];
  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v11 = -[SQLiteQueryDescriptor entityClass](self->_descriptor, "entityClass");
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v12 = v7;
  id v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      __int128 v16 = 0LL;
      do
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class disambiguatedSQLForProperty:]( v11,  "disambiguatedSQLForProperty:",  *(void *)(*((void *)&v25 + 1) + 8LL * (void)v16)));
        -[NSMutableArray addObject:](v10, "addObject:", v17);

        __int128 v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v14);
  }

  id v18 = [v9 _newSelectSQLWithProperties:v12 columns:v10];
  -[NSMutableString appendString:](v8, "appendString:", v18);
  -[NSMutableString appendString:](v8, "appendString:", @";");
  connection = self->_connection;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100009834;
  v23[3] = &unk_10026F460;
  id v24 = v9;
  id v20 = v9;
  LOBYTE(connection) = -[SQLiteConnection executeStatement:error:bindings:]( connection,  "executeStatement:error:bindings:",  v8,  0LL,  v23);

  return (char)connection;
}

- (BOOL)deleteAllEntities
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 1;
  connection = self->_connection;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100009938;
  v5[3] = &unk_10026F4B0;
  void v5[4] = self;
  v5[5] = &v6;
  -[SQLiteConnection performTransaction:](connection, "performTransaction:", v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)enumerateMemoryEntitiesUsingBlock:(id)a3
{
  descriptor = self->_descriptor;
  id v5 = a3;
  uint64_t v6 = -[SQLiteQueryDescriptor memoryEntityClass](descriptor, "memoryEntityClass");
  if (!v6) {
    uint64_t v6 = (objc_class *)objc_opt_class(&OBJC_CLASS___SQLiteMemoryEntity, v7);
  }
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[objc_class defaultProperties](v6, "defaultProperties"));
  -[SQLiteQuery enumerateMemoryEntitiesWithProperties:usingBlock:]( self,  "enumerateMemoryEntitiesWithProperties:usingBlock:",  v8,  v5);
}

- (void)enumerateMemoryEntitiesWithProperties:(id)a3 usingBlock:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v8 = -[SQLiteQueryDescriptor memoryEntityClass](self->_descriptor, "memoryEntityClass");
  if (!v8) {
    id v8 = (objc_class *)objc_opt_class(&OBJC_CLASS___SQLiteMemoryEntity, v7);
  }
  if ([v12 count])
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100009C18;
    v13[3] = &unk_10026F500;
    char v9 = (id *)v14;
    v14[0] = v6;
    v14[1] = v8;
    id v10 = v6;
    -[SQLiteQuery enumeratePersistentIDsAndProperties:usingBlock:]( self,  "enumeratePersistentIDsAndProperties:usingBlock:",  v12,  v13);
  }

  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100009BB0;
    v15[3] = &unk_10026F4D8;
    char v9 = (id *)v16;
    v16[0] = v6;
    v16[1] = v8;
    id v11 = v6;
    -[SQLiteQuery enumeratePersistentIDsUsingBlock:](self, "enumeratePersistentIDsUsingBlock:", v15);
  }
}

- (void)enumeratePersistentIDsUsingBlock:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100009D20;
  v5[3] = &unk_10026F528;
  id v6 = a3;
  id v4 = v6;
  -[SQLiteQuery enumeratePersistentIDsAndProperties:usingBlock:]( self,  "enumeratePersistentIDsAndProperties:usingBlock:",  0LL,  v5);
}

- (void)enumeratePersistentIDsAndProperties:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v11 = -[SQLiteQuery _newSelectSQLWithProperties:](self, "_newSelectSQLWithProperties:", v6);
  connection = self->_connection;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100009DF8;
  v12[3] = &unk_10026F5A0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  -[SQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", v11, v12);
}

- (SQLiteQueryDescriptor)queryDescriptor
{
  return (SQLiteQueryDescriptor *)-[SQLiteQueryDescriptor copy](self->_descriptor, "copy");
}

- (id)_newSelectSQLWithProperties:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = -[SQLiteQueryDescriptor entityClass](self->_descriptor, "entityClass");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class disambiguatedSQLForProperty:](v6, "disambiguatedSQLForProperty:", @"ROWID"));
  -[NSMutableArray addObject:](v5, "addObject:", v7);

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class disambiguatedSQLForProperty:]( v6,  "disambiguatedSQLForProperty:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)v12),  (void)v16));
        -[NSMutableArray addObject:](v5, "addObject:", v13);

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }

  id v14 = -[SQLiteQueryDescriptor _newSelectSQLWithProperties:columns:]( self->_descriptor,  "_newSelectSQLWithProperties:columns:",  v8,  v5);
  return v14;
}

- (void).cxx_destruct
{
}

@end