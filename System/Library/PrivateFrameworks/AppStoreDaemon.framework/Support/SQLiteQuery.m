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
  id v6 = a3;
  descriptor = self->_descriptor;
  if (descriptor) {
    predicate = descriptor->_predicate;
  }
  else {
    predicate = 0LL;
  }
  id v11 = v6;
  -[SQLitePredicate applyBinding:atIndex:](predicate, "applyBinding:atIndex:", v6, a4);
  v9 = self->_descriptor;
  if (v9)
  {
    int64_t limitCount = v9->_limitCount;
    if (limitCount) {
      [v11 bindInt64:limitCount atPosition:(*a4)++];
    }
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
  v5[2] = sub_10024ABCC;
  v5[3] = &unk_1003EB4C8;
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  id v6 = v3;
  -[SQLiteQuery enumeratePersistentIDsUsingBlock:](self, "enumeratePersistentIDsUsingBlock:", v5);

  return v3;
}

- (id)copySelectSQLWithProperties:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  descriptor = self->_descriptor;
  if (descriptor) {
    Class entityClass = descriptor->_entityClass;
  }
  else {
    Class entityClass = 0LL;
  }
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
      v12 = 0LL;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class disambiguatedSQLForProperty:]( entityClass,  "disambiguatedSQLForProperty:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)v12),  (void)v16));
        -[NSMutableArray addObject:](v5, "addObject:", v13);

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }

  id v14 = -[SQLiteQueryDescriptor _newSelectSQLWithProperties:columns:]( self->_descriptor,  "_newSelectSQLWithProperties:columns:",  v8,  v5);
  return v14;
}

- (int64_t)countOfEntities
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  uint64_t v8 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10024AE18;
  v4[3] = &unk_1003EE4F8;
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
  v26 = v6;
  -[NSMutableString appendString:](v8, "appendString:", v6);
  -[NSMutableString appendString:](v8, "appendString:", @" AS ");
  id v9 = -[SQLiteQueryDescriptor copy](self->_descriptor, "copy");
  uint64_t v11 = v9;
  if (v9)
  {
    objc_setProperty_nonatomic_copy(v9, v10, 0LL, 40LL);
    objc_setProperty_nonatomic_copy(v11, v12, 0LL, 48LL);
  }

  v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  descriptor = self->_descriptor;
  if (descriptor) {
    Class entityClass = descriptor->_entityClass;
  }
  else {
    Class entityClass = 0LL;
  }
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v16 = v7;
  id v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v30;
    do
    {
      v20 = 0LL;
      do
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class disambiguatedSQLForProperty:]( entityClass,  "disambiguatedSQLForProperty:",  *(void *)(*((void *)&v29 + 1) + 8LL * (void)v20)));
        -[NSMutableArray addObject:](v13, "addObject:", v21);

        v20 = (char *)v20 + 1;
      }

      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }

    while (v18);
  }

  id v22 = [v11 _newSelectSQLWithProperties:v16 columns:v13];
  -[NSMutableString appendString:](v8, "appendString:", v22);
  -[NSMutableString appendString:](v8, "appendString:", @";");
  connection = self->_connection;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10024B090;
  v27[3] = &unk_1003E99D8;
  id v28 = v11;
  id v24 = v11;
  LOBYTE(connection) = sub_1001D68EC((uint64_t)connection, v8, 0LL, v27);

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
  v5[2] = sub_10024B17C;
  v5[3] = &unk_1003EE548;
  void v5[4] = self;
  v5[5] = &v6;
  sub_1001D6D30((uint64_t)connection, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)enumerateMemoryEntitiesUsingBlock:(id)a3
{
  id v8 = a3;
  descriptor = self->_descriptor;
  if (!descriptor || (Class memoryEntityClass = descriptor->_memoryEntityClass) == 0LL) {
    Class memoryEntityClass = (Class)objc_opt_class(&OBJC_CLASS___SQLiteMemoryEntity, v4);
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class defaultProperties](memoryEntityClass, "defaultProperties"));
  -[SQLiteQuery enumerateMemoryEntitiesWithProperties:usingBlock:]( self,  "enumerateMemoryEntitiesWithProperties:usingBlock:",  v7,  v8);
}

- (void)enumerateMemoryEntitiesWithProperties:(id)a3 usingBlock:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  descriptor = self->_descriptor;
  if ([v13 count])
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10024B454;
    v14[3] = &unk_1003EE598;
    id v10 = (id *)v15;
    v15[0] = v7;
    v15[1] = memoryEntityClass;
    id v11 = v7;
    -[SQLiteQuery enumeratePersistentIDsAndProperties:usingBlock:]( self,  "enumeratePersistentIDsAndProperties:usingBlock:",  v13,  v14);
  }

  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10024B3EC;
    v16[3] = &unk_1003EE570;
    id v10 = (id *)v17;
    v17[0] = v7;
    v17[1] = memoryEntityClass;
    id v12 = v7;
    -[SQLiteQuery enumeratePersistentIDsUsingBlock:](self, "enumeratePersistentIDsUsingBlock:", v16);
  }
}

- (void)enumeratePersistentIDsUsingBlock:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10024B55C;
  v5[3] = &unk_1003EE4C0;
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
  v12[2] = sub_10024B634;
  v12[3] = &unk_1003EE610;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  sub_1001D64E8((uint64_t)connection, v11, v12);
}

- (SQLiteQueryDescriptor)queryDescriptor
{
  return (SQLiteQueryDescriptor *)-[SQLiteQueryDescriptor copy](self->_descriptor, "copy");
}

- (id)_newSelectSQLWithProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  descriptor = self->_descriptor;
  if (descriptor) {
    Class entityClass = descriptor->_entityClass;
  }
  else {
    Class entityClass = 0LL;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class disambiguatedSQLForProperty:](entityClass, "disambiguatedSQLForProperty:", @"ROWID"));
  -[NSMutableArray addObject:](v5, "addObject:", v8);

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class disambiguatedSQLForProperty:]( entityClass,  "disambiguatedSQLForProperty:",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)v13),  (void)v17));
        -[NSMutableArray addObject:](v5, "addObject:", v14);

        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v11);
  }

  id v15 = -[SQLiteQueryDescriptor _newSelectSQLWithProperties:columns:]( self->_descriptor,  "_newSelectSQLWithProperties:columns:",  v9,  v5);
  return v15;
}

- (void).cxx_destruct
{
}

@end