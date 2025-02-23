@interface SQLiteTable
+ (id)SQLToAddColumnWithSQL:(id)a3 toTableNamed:(id)a4;
+ (id)SQLToDropTableNamed:(id)a3;
+ (id)SQLToInsertColumnNames:(id)a3 fromTableNamed:(id)a4 intoTableNamed:(id)a5;
+ (id)SQLToRenameTable:(id)a3 to:(id)a4;
+ (id)tableWithSQL:(id)a3;
- (BOOL)removeColumn:(id)a3;
- (BOOL)renameColumn:(id)a3 to:(id)a4;
- (NSString)tableName;
- (id)_columnNamed:(id)a3;
- (id)_initWithTableSQL:(id)a3;
- (id)columnNames;
- (id)creationSQL;
- (unint64_t)_indexOfColumnNamed:(id)a3;
- (void)setTableName:(id)a3;
@end

@implementation SQLiteTable

+ (id)tableWithSQL:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) _initWithTableSQL:v4];

  return v5;
}

- (BOOL)removeColumn:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteTable _columnNamed:](self, "_columnNamed:", a3));
  if (v4) {
    -[NSMutableArray removeObject:](self->_columns, "removeObject:", v4);
  }

  return v4 != 0LL;
}

- (BOOL)renameColumn:(id)a3 to:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteTable _columnNamed:](self, "_columnNamed:", a3));
  v8 = v7;
  if (v7) {
    [v7 setName:v6];
  }

  return v8 != 0LL;
}

- (id)columnNames
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  -[NSMutableArray count](self->_columns, "count")));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = self->_columns;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v8), "name", (void)v11));
        [v3 addObject:v9];

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (id)creationSQL
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  (char *)-[NSMutableArray count](self->_columns, "count")
                 + (void)-[NSMutableArray count](self->_tableConstraints, "count")));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = self->_columns;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)v8) SQL]);
        [v3 addObject:v9];

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v6);
  }

  [v3 addObjectsFromArray:self->_tableConstraints];
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\"%@\"",  self->_tableName));
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", @", "));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CREATE TABLE %@ (%@)",  v10,  v11,  (void)v14));

  return v12;
}

+ (id)SQLToInsertColumnNames:(id)a3 fromTableNamed:(id)a4 intoTableNamed:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v7 count]));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      __int128 v15 = 0LL;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\"%@\"",  *(void *)(*((void *)&v22 + 1) + 8LL * (void)v15)));
        [v10 addObject:v16];

        __int128 v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v13);
  }

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsJoinedByString:", @", "));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"\"%@\"", v9));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"\"%@\"", v8));
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"INSERT INTO %@ SELECT %@ FROM %@",  v18,  v17,  v19));

  return v20;
}

+ (id)SQLToAddColumnWithSQL:(id)a3 toTableNamed:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"\"%@\"", a4));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ALTER TABLE %@ ADD COLUMN %@",  v6,  v5));

  return v7;
}

+ (id)SQLToDropTableNamed:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"\"%@\"", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"DROP TABLE %@", v3));

  return v4;
}

+ (id)SQLToRenameTable:(id)a3 to:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"\"%@\"", a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"\"%@\"", v5));

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ALTER TABLE %@ RENAME TO %@",  v6,  v7));
  return v8;
}

- (id)_initWithTableSQL:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SQLiteTable;
  id v5 = -[SQLiteTable init](&v19, "init");
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner SQLParsingScannerWithSQL:](&OBJC_CLASS___NSScanner, "SQLParsingScannerWithSQL:", v4));
    id v18 = 0LL;
    unsigned int v7 = [v6 scanTableSQLPreambleAndTableName:&v18];
    id v8 = v18;
    id v9 = v18;
    id v10 = 0LL;
    id v11 = 0LL;
    if (v7
      && (id v16 = 0LL,
          id v17 = 0LL,
          unsigned int v12 = [v6 scanTableSQLColumns:&v17 constraints:&v16],
          id v13 = v17,
          id v10 = v17,
          id v14 = v16,
          id v11 = v16,
          v12))
    {
      objc_storeStrong((id *)&v5->_tableName, v8);
      objc_storeStrong((id *)&v5->_columns, v13);
      objc_storeStrong((id *)&v5->_tableConstraints, v14);
    }

    else
    {

      id v5 = 0LL;
    }
  }

  return v5;
}

- (unint64_t)_indexOfColumnNamed:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMutableArray count](self->_columns, "count");
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = 0LL;
    while (1)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_columns, "objectAtIndex:", v7));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
      unsigned __int8 v10 = [v4 isEqualToString:v9];

      if ((v10 & 1) != 0) {
        break;
      }
      if (v6 == (id)++v7) {
        goto LABEL_5;
      }
    }
  }

  else
  {
LABEL_5:
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)_columnNamed:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = self->_columns;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name", (void)v13));
        unsigned __int8 v11 = [v4 isEqualToString:v10];

        if ((v11 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (NSString)tableName
{
  return self->_tableName;
}

- (void)setTableName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end