@interface SQLiteQuery
- (BOOL)createTemporaryTableWithName:(id)a3 properties:(id)a4;
- (BOOL)deleteAllEntities;
- (BOOL)exists;
- (SQLiteDatabase)database;
- (SQLiteQuery)initWithDatabase:(id)a3 descriptor:(id)a4;
- (SQLiteQueryDescriptor)queryDescriptor;
- (id)_newSelectSQLOnProperties:(id)a3;
- (id)_newSelectSQLWithProperties:(id)a3;
- (id)copyEntityIdentifiers;
- (id)copySelectSQLWithProperties:(id)a3;
- (int64_t)countOfEntities;
- (void)bindToSelectStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
- (void)enumeratePersistentIDsAndProperties:(id)a3 usingBlock:(id)a4;
- (void)enumeratePersistentIDsUsingBlock:(id)a3;
- (void)enumerateProperties:(id)a3 usingBlock:(id)a4;
@end

@implementation SQLiteQuery

- (SQLiteQuery)initWithDatabase:(id)a3 descriptor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SQLiteQuery;
  v9 = -[SQLiteQuery init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    v11 = (SQLiteQueryDescriptor *)[v8 copy];
    descriptor = v10->_descriptor;
    v10->_descriptor = v11;
  }

  return v10;
}

- (void)bindToSelectStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteQueryDescriptor predicate](self->_descriptor, "predicate"));
  [v7 bindToStatement:a3 bindingIndex:a4];

  int64_t v8 = -[SQLiteQueryDescriptor limitCount](self->_descriptor, "limitCount");
  if (v8)
  {
    sqlite3_bind_int(a3, *a4, v8);
    ++*a4;
  }

- (id)copyEntityIdentifiers
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100086088;
  v5[3] = &unk_10063BE98;
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
  id v3 = -[SQLiteQuery _newSelectSQLWithProperties:](self, "_newSelectSQLWithProperties:", 0LL);
  id v4 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"SELECT COUNT(*) FROM (%@)",  v3);
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  uint64_t v12 = 0LL;
  database = self->_database;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100086318;
  v8[3] = &unk_10063D460;
  v8[4] = self;
  v8[5] = &v9;
  sub_1002CCDBC((uint64_t)database, v4, v8);
  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (BOOL)exists
{
  v2 = self;
  id v3 = -[SQLiteQuery _newSelectSQLWithProperties:](self, "_newSelectSQLWithProperties:", 0LL);
  id v4 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"SELECT EXISTS (%@)",  v3);
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  uint64_t database = (uint64_t)v2->_database;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100086474;
  v7[3] = &unk_10063D460;
  v7[4] = v2;
  v7[5] = &v8;
  sub_1002CCDBC(database, v4, v7);
  LOBYTE(v2) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)v2;
}

- (BOOL)createTemporaryTableWithName:(id)a3 properties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  @"CREATE TEMPORARY TABLE ");
  v21 = v6;
  -[NSMutableString appendString:](v8, "appendString:", v6);
  -[NSMutableString appendString:](v8, "appendString:", @" AS ");
  id v9 = -[SQLiteQueryDescriptor copy](self->_descriptor, "copy");
  [v9 setOrderingDirections:0];
  [v9 setOrderingProperties:0];
  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v11 = -[SQLiteQueryDescriptor entityClass](self->_descriptor, "entityClass");
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v12 = v7;
  id v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v12);
        }
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class disambiguatedSQLForProperty:]( v11,  "disambiguatedSQLForProperty:",  *(void *)(*((void *)&v29 + 1) + 8LL * (void)i)));
        -[NSMutableArray addObject:](v10, "addObject:", v16);
      }

      id v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }

    while (v13);
  }

  id v17 = [v9 _newSelectSQLWithProperties:v12 columns:v10];
  -[NSMutableString appendString:](v8, "appendString:", v17);
  -[NSMutableString appendString:](v8, "appendString:", @";");
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 0;
  uint64_t database = self->_database;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100086780;
  v22[3] = &unk_10063D460;
  id v19 = v9;
  id v23 = v19;
  v24 = &v25;
  sub_1002CCDBC((uint64_t)database, v8, v22);
  LOBYTE(database) = *((_BYTE *)v26 + 24) != 0;

  _Block_object_dispose(&v25, 8);
  return (char)database;
}

- (SQLiteDatabase)database
{
  return self->_database;
}

- (BOOL)deleteAllEntities
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 1;
  uint64_t database = self->_database;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000868A8;
  v5[3] = &unk_10063D438;
  void v5[4] = self;
  v5[5] = &v6;
  sub_1002CCC5C((uint64_t)database, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)enumeratePersistentIDsUsingBlock:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100086A1C;
  v5[3] = &unk_10063E788;
  id v6 = a3;
  id v4 = v6;
  -[SQLiteQuery enumeratePersistentIDsAndProperties:usingBlock:]( self,  "enumeratePersistentIDsAndProperties:usingBlock:",  0LL,  v5);
}

- (void)enumeratePersistentIDsAndProperties:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v11 = -[SQLiteQuery _newSelectSQLWithProperties:](self, "_newSelectSQLWithProperties:", v6);
  uint64_t database = self->_database;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100086AF4;
  v12[3] = &unk_10063E7B0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  sub_1002CCDBC((uint64_t)database, v11, v12);
}

- (void)enumerateProperties:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v11 = -[SQLiteQuery _newSelectSQLOnProperties:](self, "_newSelectSQLOnProperties:", v6);
  uint64_t database = self->_database;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100086CE8;
  v12[3] = &unk_10063E7B0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  sub_1002CCDBC((uint64_t)database, v11, v12);
}

- (SQLiteQueryDescriptor)queryDescriptor
{
  return (SQLiteQueryDescriptor *)-[SQLiteQueryDescriptor copy](self->_descriptor, "copy");
}

- (id)_newSelectSQLWithProperties:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
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

- (id)_newSelectSQLOnProperties:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = -[SQLiteQueryDescriptor entityClass](self->_descriptor, "entityClass");
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
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class disambiguatedSQLForProperty:]( v6,  "disambiguatedSQLForProperty:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v11),  (void)v15));
        -[NSMutableArray addObject:](v5, "addObject:", v12);

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }

  id v13 = -[SQLiteQueryDescriptor _newSelectSQLWithProperties:columns:]( self->_descriptor,  "_newSelectSQLWithProperties:columns:",  v7,  v5);
  return v13;
}

- (void).cxx_destruct
{
}

@end