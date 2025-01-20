@interface SQLiteCursor
- (SQLiteCursor)initWithStatement:(id)a3;
- (double)doubleForColumnIndex:(int)a3;
- (double)doubleForColumnName:(id)a3;
- (id)JSONObjectForColumnIndex:(int)a3;
- (id)URLForColumnIndex:(int)a3;
- (id)URLForColumnName:(id)a3;
- (id)UUIDForColumnIndex:(int)a3;
- (id)UUIDForColumnName:(id)a3;
- (id)dataForColumnIndex:(int)a3;
- (id)dataForColumnName:(id)a3;
- (id)dateForColumnIndex:(int)a3;
- (id)dateForColumnName:(id)a3;
- (id)dictionaryWithValuesForColumnNames:(id)a3;
- (id)dictionaryWithValuesForColumns;
- (id)numberForColumnIndex:(int)a3;
- (id)numberForColumnName:(id)a3;
- (id)stringForColumnIndex:(int)a3;
- (id)stringForColumnName:(id)a3;
- (int)_columnTypeForColumnIndex:(int)a3;
- (int)columnIndexForColumnName:(id)a3;
- (int)intForColumnIndex:(int)a3;
- (int)intForColumnName:(id)a3;
- (int64_t)int64ForColumnIndex:(int)a3;
- (int64_t)int64ForColumnName:(id)a3;
- (int64_t)numberOfColumns;
- (unsigned)_declaredTypeForColumnIndex:(int)a3;
- (void)dealloc;
@end

@implementation SQLiteCursor

- (SQLiteCursor)initWithStatement:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___SQLiteCursor;
  v6 = -[SQLiteCursor init](&v20, "init");
  if (v6)
  {
    v6->_statement = (sqlite3_stmt *)objc_msgSend(v5, "sqlite3_stmt");
    objc_storeStrong((id *)&v6->_statementWrapper, a3);
    int v7 = sqlite3_column_count(v6->_statement);
    v6->_columnCount = v7;
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v7));
    columnNames = v6->_columnNames;
    v6->_columnNames = (NSMutableArray *)v8;

    v6->_columnDeclaredTypes = (unsigned __int8 *)calloc(v6->_columnCount, 1uLL);
    if (v6->_columnCount >= 1)
    {
      for (uint64_t i = 0LL; i < v6->_columnCount; ++i)
      {
        v11 = v6->_columnNames;
        v12 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  sqlite3_column_name(v6->_statement, i));
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        -[NSMutableArray addObject:](v11, "addObject:", v13);

        v14 = sqlite3_column_decltype(v6->_statement, i);
        if (v14)
        {
          v15 = v14;
          if (!strcmp(v14, "DATETIME"))
          {
            v6->_columnDeclaredTypes[i] = 1;
            continue;
          }

          if (!strcmp(v15, "JSON"))
          {
            columnDeclaredTypes = v6->_columnDeclaredTypes;
            char v18 = 2;
            goto LABEL_17;
          }

          if (!strcmp(v15, "UUID"))
          {
            columnDeclaredTypes = v6->_columnDeclaredTypes;
            char v18 = 3;
            goto LABEL_17;
          }

          if (!strcmp(v15, "URL"))
          {
            columnDeclaredTypes = v6->_columnDeclaredTypes;
            char v18 = 4;
            goto LABEL_17;
          }

          int v16 = strcmp(v15, "STRING");
          columnDeclaredTypes = v6->_columnDeclaredTypes;
          if (!v16)
          {
            char v18 = 5;
LABEL_17:
            columnDeclaredTypes[i] = v18;
            continue;
          }
        }

        else
        {
          columnDeclaredTypes = v6->_columnDeclaredTypes;
        }

        columnDeclaredTypes[i] = 0;
      }
    }
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SQLiteCursor;
  -[SQLiteCursor dealloc](&v3, "dealloc");
}

- (id)dataForColumnIndex:(int)a3
{
  if (sqlite3_column_type(self->_statement, a3) == 5)
  {
    id v5 = 0LL;
  }

  else
  {
    v6 = sqlite3_column_blob(self->_statement, a3);
    int v7 = +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v6,  sqlite3_column_bytes(self->_statement, a3));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  return v5;
}

- (id)dataForColumnName:(id)a3
{
  uint64_t v4 = -[SQLiteCursor columnIndexForColumnName:](self, "columnIndexForColumnName:", a3);
  if ((v4 & 0x80000000) != 0) {
    id v5 = 0LL;
  }
  else {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteCursor dataForColumnIndex:](self, "dataForColumnIndex:", v4));
  }
  return v5;
}

- (id)dateForColumnIndex:(int)a3
{
  int v5 = sqlite3_column_type(self->_statement, a3);
  if (v5 == 1)
  {
    double v6 = (double)sqlite3_column_int64(self->_statement, a3);
  }

  else
  {
    if (v5 != 2)
    {
      int v7 = 0LL;
      return v7;
    }

    double v6 = sqlite3_column_double(self->_statement, a3);
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v6));
  return v7;
}

- (id)dateForColumnName:(id)a3
{
  uint64_t v4 = -[SQLiteCursor columnIndexForColumnName:](self, "columnIndexForColumnName:", a3);
  if ((v4 & 0x80000000) != 0) {
    int v5 = 0LL;
  }
  else {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteCursor dateForColumnIndex:](self, "dateForColumnIndex:", v4));
  }
  return v5;
}

- (double)doubleForColumnIndex:(int)a3
{
  return sqlite3_column_double(self->_statement, a3);
}

- (double)doubleForColumnName:(id)a3
{
  int v4 = -[SQLiteCursor columnIndexForColumnName:](self, "columnIndexForColumnName:", a3);
  if (v4 < 0) {
    return 0.0;
  }
  else {
    return sqlite3_column_double(self->_statement, v4);
  }
}

- (int)intForColumnIndex:(int)a3
{
  return sqlite3_column_int(self->_statement, a3);
}

- (int)intForColumnName:(id)a3
{
  int v4 = -[SQLiteCursor columnIndexForColumnName:](self, "columnIndexForColumnName:", a3);
  if (v4 < 0) {
    return 0;
  }
  else {
    return sqlite3_column_int(self->_statement, v4);
  }
}

- (int64_t)int64ForColumnIndex:(int)a3
{
  return sqlite3_column_int64(self->_statement, a3);
}

- (int64_t)int64ForColumnName:(id)a3
{
  int v4 = -[SQLiteCursor columnIndexForColumnName:](self, "columnIndexForColumnName:", a3);
  if (v4 < 0) {
    return 0LL;
  }
  else {
    return sqlite3_column_int64(self->_statement, v4);
  }
}

- (id)JSONObjectForColumnIndex:(int)a3
{
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteCursor dataForColumnIndex:](self, "dataForColumnIndex:"));
  if (!v5)
  {
    id v7 = 0LL;
LABEL_8:
    double v6 = 0LL;
    goto LABEL_9;
  }

  id v14 = 0LL;
  double v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v5,  0LL,  &v14));
  id v7 = v14;
  if (!v6)
  {
    if (qword_10032EA58 != -1) {
      dispatch_once(&qword_10032EA58, &stru_1002E94B0);
    }
    uint64_t v8 = (void *)qword_10032EA40;
    if (os_log_type_enabled((os_log_t)qword_10032EA40, OS_LOG_TYPE_ERROR))
    {
      columnNames = self->_columnNames;
      v10 = v8;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](columnNames, "objectAtIndexedSubscript:", a3));
      *(_DWORD *)buf = 138543618;
      int v16 = v11;
      __int16 v17 = 2114;
      id v18 = v7;
    }

    goto LABEL_8;
  }

- (id)numberForColumnIndex:(int)a3
{
  int v5 = sqlite3_column_type(self->_statement, a3);
  if (v5 == 1)
  {
    uint64_t v8 = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  sqlite3_column_int64(self->_statement, a3));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  else if (v5 == 2)
  {
    double v6 = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  sqlite3_column_double(self->_statement, a3));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (id)numberForColumnName:(id)a3
{
  uint64_t v4 = -[SQLiteCursor columnIndexForColumnName:](self, "columnIndexForColumnName:", a3);
  if ((v4 & 0x80000000) != 0) {
    int v5 = 0LL;
  }
  else {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteCursor numberForColumnIndex:](self, "numberForColumnIndex:", v4));
  }
  return v5;
}

- (int64_t)numberOfColumns
{
  return sqlite3_column_count(self->_statement);
}

- (id)stringForColumnIndex:(int)a3
{
  if (sqlite3_column_type(self->_statement, a3) == 5)
  {
    int v5 = 0LL;
  }

  else
  {
    int v5 = (unsigned __int8 *)sqlite3_column_text(self->_statement, a3);
    if (v5) {
      int v5 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5));
    }
  }

  return v5;
}

- (id)stringForColumnName:(id)a3
{
  uint64_t v4 = -[SQLiteCursor columnIndexForColumnName:](self, "columnIndexForColumnName:", a3);
  if ((v4 & 0x80000000) != 0) {
    int v5 = 0LL;
  }
  else {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteCursor stringForColumnIndex:](self, "stringForColumnIndex:", v4));
  }
  return v5;
}

- (id)UUIDForColumnIndex:(int)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteCursor stringForColumnIndex:](self, "stringForColumnIndex:", *(void *)&a3));
  if (v3) {
    uint64_t v4 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v3);
  }
  else {
    uint64_t v4 = 0LL;
  }

  return v4;
}

- (id)UUIDForColumnName:(id)a3
{
  uint64_t v4 = -[SQLiteCursor columnIndexForColumnName:](self, "columnIndexForColumnName:", a3);
  if ((v4 & 0x80000000) != 0) {
    int v5 = 0LL;
  }
  else {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteCursor UUIDForColumnIndex:](self, "UUIDForColumnIndex:", v4));
  }
  return v5;
}

- (id)URLForColumnIndex:(int)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteCursor stringForColumnIndex:](self, "stringForColumnIndex:", *(void *)&a3));
  if (v3) {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v3));
  }
  else {
    uint64_t v4 = 0LL;
  }

  return v4;
}

- (id)URLForColumnName:(id)a3
{
  uint64_t v4 = -[SQLiteCursor columnIndexForColumnName:](self, "columnIndexForColumnName:", a3);
  if ((v4 & 0x80000000) != 0) {
    int v5 = 0LL;
  }
  else {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteCursor URLForColumnIndex:](self, "URLForColumnIndex:", v4));
  }
  return v5;
}

- (id)dictionaryWithValuesForColumns
{
  return -[SQLiteCursor dictionaryWithValuesForColumnNames:](self, "dictionaryWithValuesForColumnNames:", 0LL);
}

- (id)dictionaryWithValuesForColumnNames:(id)a3
{
  id v4 = a3;
  id columnKeySet = self->_columnKeySet;
  if (!columnKeySet)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  self->_columnNames));
    id v7 = self->_columnKeySet;
    self->_id columnKeySet = v6;

    id columnKeySet = self->_columnKeySet;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  columnKeySet));
  columnNames = self->_columnNames;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10005A3E8;
  v14[3] = &unk_1002E9490;
  id v15 = v4;
  id v16 = v8;
  __int16 v17 = self;
  id v10 = v8;
  id v11 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](columnNames, "enumerateObjectsUsingBlock:", v14);
  id v12 = [v10 copy];

  return v12;
}

- (int)columnIndexForColumnName:(id)a3
{
  return -[NSMutableArray indexOfObject:](self->_columnNames, "indexOfObject:", a3);
}

- (int)_columnTypeForColumnIndex:(int)a3
{
  return sqlite3_column_type(self->_statement, a3);
}

- (unsigned)_declaredTypeForColumnIndex:(int)a3
{
  if (a3 < 0 || self->_columnCount <= a3) {
    return 0;
  }
  else {
    return self->_columnDeclaredTypes[a3];
  }
}

- (void).cxx_destruct
{
}

@end