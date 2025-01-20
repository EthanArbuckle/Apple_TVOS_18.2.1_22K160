@interface _bmFMResultSet
+ (id)resultSetWithStatement:(id)a3 usingParentDatabase:(id)a4 shouldAutoClose:(BOOL)a5;
- (BOOL)BOOLForColumn:(id)a3;
- (BOOL)BOOLForColumnIndex:(int)a3;
- (BOOL)bindWithArray:(id)a3;
- (BOOL)bindWithArray:(id)a3 orDictionary:(id)a4 orVAList:(char *)a5;
- (BOOL)bindWithDictionary:(id)a3;
- (BOOL)columnIndexIsNull:(int)a3;
- (BOOL)columnIsNull:(id)a3;
- (BOOL)hasAnotherRow;
- (BOOL)next;
- (BOOL)nextWithError:(id *)a3;
- (BOOL)shouldAutoClose;
- (BOOL)step;
- (BOOL)stepWithError:(id *)a3;
- (NSDictionary)resultDictionary;
- (NSMutableDictionary)columnNameToIndexMap;
- (NSString)query;
- (_bmFMDatabase)parentDB;
- (_bmFMStatement)statement;
- (const)UTF8StringForColumn:(id)a3;
- (const)UTF8StringForColumnIndex:(int)a3;
- (const)UTF8StringForColumnName:(id)a3;
- (double)doubleForColumn:(id)a3;
- (double)doubleForColumnIndex:(int)a3;
- (id)columnNameForIndex:(int)a3;
- (id)dataForColumn:(id)a3;
- (id)dataForColumnIndex:(int)a3;
- (id)dataNoCopyForColumn:(id)a3;
- (id)dataNoCopyForColumnIndex:(int)a3;
- (id)dateForColumn:(id)a3;
- (id)dateForColumnIndex:(int)a3;
- (id)objectForColumn:(id)a3;
- (id)objectForColumnIndex:(int)a3;
- (id)objectForColumnName:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (id)resultDict;
- (id)stringForColumn:(id)a3;
- (id)stringForColumnIndex:(int)a3;
- (int)columnCount;
- (int)columnIndexForName:(id)a3;
- (int)intForColumn:(id)a3;
- (int)intForColumnIndex:(int)a3;
- (int)internalStepWithError:(id *)a3;
- (int64_t)longForColumn:(id)a3;
- (int64_t)longForColumnIndex:(int)a3;
- (int64_t)longLongIntForColumn:(id)a3;
- (int64_t)longLongIntForColumnIndex:(int)a3;
- (unint64_t)unsignedLongLongIntForColumn:(id)a3;
- (void)_tryLogSqliteColumnError:(int)a3;
- (void)close;
- (void)dealloc;
- (void)enumerateWithBlock:(id)a3;
- (void)kvcMagic:(id)a3;
- (void)setParentDB:(id)a3;
- (void)setQuery:(id)a3;
- (void)setShouldAutoClose:(BOOL)a3;
- (void)setStatement:(id)a3;
@end

@implementation _bmFMResultSet

- (void)enumerateWithBlock:(id)a3
{
  v4 = (void (**)(id, _bmFMResultSet *, _BYTE *))a3;
LABEL_2:
  v5 = objc_autoreleasePoolPush();
  uint64_t v6 = 10LL;
  while (-[_bmFMResultSet next](self, "next"))
  {
    char v7 = 0;
    v4[2](v4, self, &v7);
    if (v7) {
      break;
    }
    if (!--v6)
    {
      objc_autoreleasePoolPop(v5);
      goto LABEL_2;
    }
  }

  objc_autoreleasePoolPop(v5);
}

+ (id)resultSetWithStatement:(id)a3 usingParentDatabase:(id)a4 shouldAutoClose:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v11 = objc_alloc_init(&OBJC_CLASS____bmFMResultSet);
  -[_bmFMResultSet setStatement:](v11, "setStatement:", v9);
  -[_bmFMResultSet setParentDB:](v11, "setParentDB:", v10);

  -[_bmFMResultSet setShouldAutoClose:](v11, "setShouldAutoClose:", v5);
  if ([v9 inUse])
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2, a1, @"FMResultSet.m", 38, @"Invalid parameter not satisfying: %@", @"![statement inUse]" object file lineNumber description];
  }

  [v9 setInUse:1];

  return v11;
}

- (void)dealloc
{
  query = self->_query;
  self->_query = 0LL;

  columnNameToIndexMap = self->_columnNameToIndexMap;
  self->_columnNameToIndexMap = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____bmFMResultSet;
  -[_bmFMResultSet dealloc](&v5, "dealloc");
}

- (void)close
{
  statement = self->_statement;
  self->_statement = 0LL;

  -[_bmFMDatabase resultSetDidClose:](self->_parentDB, "resultSetDidClose:", self);
  -[_bmFMResultSet setParentDB:](self, "setParentDB:", 0LL);
}

- (int)columnCount
{
  return sqlite3_column_count((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"));
}

- (NSMutableDictionary)columnNameToIndexMap
{
  if (!self->_columnNameToIndexMap)
  {
    int v3 = sqlite3_column_count((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"));
    v4 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  v3);
    columnNameToIndexMap = self->_columnNameToIndexMap;
    self->_columnNameToIndexMap = v4;

    if (v3 >= 1)
    {
      uint64_t v6 = 0LL;
      do
      {
        char v7 = self->_columnNameToIndexMap;
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v6));
        id v9 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  sqlite3_column_name((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), v6));
        id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lowercaseString]);
        -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v8, v11);

        uint64_t v6 = (v6 + 1);
      }

      while (v3 != (_DWORD)v6);
    }
  }

  return self->_columnNameToIndexMap;
}

- (void)kvcMagic:(id)a3
{
  id v11 = a3;
  int v4 = sqlite3_column_count((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"));
  if (v4 >= 1)
  {
    int v5 = v4;
    uint64_t v6 = 0LL;
    do
    {
      char v7 = sqlite3_column_text((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), v6);
      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
        id v9 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  sqlite3_column_name((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), v6));
        id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        [v11 setValue:v8 forKey:v10];
      }

      else
      {
        -[_bmFMResultSet _tryLogSqliteColumnError:](self, "_tryLogSqliteColumnError:", v6);
      }

      uint64_t v6 = (v6 + 1);
    }

    while (v5 != (_DWORD)v6);
  }
}

- (id)resultDict
{
  int v3 = sqlite3_data_count((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"));
  if (v3)
  {
    int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  v3));
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMResultSet columnNameToIndexMap](self, "columnNameToIndexMap"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keyEnumerator]);

    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 nextObject]);
    if (v7)
    {
      v8 = (void *)v7;
      do
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMResultSet objectForColumnName:](self, "objectForColumnName:", v8));
        [v4 setObject:v9 forKey:v8];

        uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 nextObject]);
        v8 = (void *)v10;
      }

      while (v10);
    }

    id v11 = [v4 copy];
  }

  else
  {
    NSLog(@"Warning: There seem to be no columns in this set.");
    id v11 = 0LL;
  }

  return v11;
}

- (NSDictionary)resultDictionary
{
  int v3 = sqlite3_data_count((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"));
  if (v3)
  {
    int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  v3));
    int v5 = sqlite3_column_count((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"));
    if (v5 >= 1)
    {
      int v6 = v5;
      uint64_t v7 = 0LL;
      do
      {
        v8 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  sqlite3_column_name((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), v7));
        id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMResultSet objectForColumnIndex:](self, "objectForColumnIndex:", v7));
        [v4 setObject:v10 forKey:v9];

        uint64_t v7 = (v7 + 1);
      }

      while (v6 != (_DWORD)v7);
    }
  }

  else
  {
    NSLog(@"Warning: There seem to be no columns in this set.");
    int v4 = 0LL;
  }

  return (NSDictionary *)v4;
}

- (BOOL)next
{
  return -[_bmFMResultSet nextWithError:](self, "nextWithError:", 0LL);
}

- (BOOL)nextWithError:(id *)a3
{
  return -[_bmFMResultSet internalStepWithError:](self, "internalStepWithError:", a3) == 100;
}

- (BOOL)step
{
  return -[_bmFMResultSet stepWithError:](self, "stepWithError:", 0LL);
}

- (BOOL)stepWithError:(id *)a3
{
  return -[_bmFMResultSet internalStepWithError:](self, "internalStepWithError:", a3) == 101;
}

- (int)internalStepWithError:(id *)a3
{
  uint64_t v5 = sqlite3_step((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"));
  uint64_t v6 = v5;
  if ((v5 - 5) <= 1)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase databasePath](self->_parentDB, "databasePath"));
    NSLog(@"%s:%d Database busy (%@)", "-[_bmFMResultSet internalStepWithError:]", 189LL, v7);

    NSLog(@"Database busy", v13, v14);
LABEL_3:
    if (!a3) {
      goto LABEL_8;
    }
    parentDB = self->_parentDB;
    goto LABEL_5;
  }

  if ((v5 & 0xFFFFFFFE) == 0x64)
  {
LABEL_7:
    if ((_DWORD)v6 == 100) {
      return v6;
    }
    goto LABEL_8;
  }

  if ((_DWORD)v5 != 21)
  {
    if ((_DWORD)v5 == 1)
    {
      v15 = sqlite3_errmsg((sqlite3 *)-[_bmFMDatabase sqliteHandle](self->_parentDB, "sqliteHandle"));
      NSLog(@"Error calling sqlite3_step (%d: %s) rs", 1LL, v15);
      goto LABEL_3;
    }

    v12 = sqlite3_errmsg((sqlite3 *)-[_bmFMDatabase sqliteHandle](self->_parentDB, "sqliteHandle"));
    NSLog(@"Unknown error calling sqlite3_step (%d: %s) rs", v6, v12);
    if (a3) {
      *a3 = (id)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase lastError](self->_parentDB, "lastError"));
    }
    goto LABEL_7;
  }

  uint64_t v10 = sqlite3_errmsg((sqlite3 *)-[_bmFMDatabase sqliteHandle](self->_parentDB, "sqliteHandle"));
  NSLog(@"Error calling sqlite3_step (%d: %s) rs", 21LL, v10);
  if (a3)
  {
    parentDB = self->_parentDB;
    if (parentDB)
    {
LABEL_5:
      *a3 = (id)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase lastError](parentDB, "lastError"));
      goto LABEL_8;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  @"parentDB does not exist",  NSLocalizedDescriptionKey));
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_bmFMDatabase",  21LL,  v11));
  }

- (BOOL)hasAnotherRow
{
  return sqlite3_errcode((sqlite3 *)-[_bmFMDatabase sqliteHandle](self->_parentDB, "sqliteHandle")) == 100;
}

- (int)columnIndexForName:(id)a3
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue([a3 lowercaseString]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMResultSet columnNameToIndexMap](self, "columnNameToIndexMap"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  if (v6)
  {
    int v7 = [v6 intValue];
  }

  else
  {
    NSLog(@"Warning: I could not find the column named '%@'.", v4);
    int v7 = -1;
  }

  return v7;
}

- (int)intForColumn:(id)a3
{
  return -[_bmFMResultSet intForColumnIndex:]( self,  "intForColumnIndex:",  -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
}

- (int)intForColumnIndex:(int)a3
{
  return sqlite3_column_int((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3);
}

- (int64_t)longForColumn:(id)a3
{
  return -[_bmFMResultSet longForColumnIndex:]( self,  "longForColumnIndex:",  -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
}

- (int64_t)longForColumnIndex:(int)a3
{
  return sqlite3_column_int64((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3);
}

- (int64_t)longLongIntForColumn:(id)a3
{
  return -[_bmFMResultSet longLongIntForColumnIndex:]( self,  "longLongIntForColumnIndex:",  -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
}

- (int64_t)longLongIntForColumnIndex:(int)a3
{
  return sqlite3_column_int64((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3);
}

- (unint64_t)unsignedLongLongIntForColumn:(id)a3
{
  return -[_bmFMResultSet unsignedLongLongIntForColumnIndex:]( self,  "unsignedLongLongIntForColumnIndex:",  -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
}

- (BOOL)BOOLForColumn:(id)a3
{
  return -[_bmFMResultSet BOOLForColumnIndex:]( self,  "BOOLForColumnIndex:",  -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
}

- (BOOL)BOOLForColumnIndex:(int)a3
{
  return -[_bmFMResultSet intForColumnIndex:](self, "intForColumnIndex:", *(void *)&a3) != 0;
}

- (double)doubleForColumn:(id)a3
{
  return result;
}

- (double)doubleForColumnIndex:(int)a3
{
  return sqlite3_column_double((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3);
}

- (id)stringForColumnIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = sqlite3_column_type((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3);
  uint64_t v6 = 0LL;
  if ((v3 & 0x80000000) == 0 && v5 != 5)
  {
    if (sqlite3_column_count((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement")) > (int)v3)
    {
      int v7 = sqlite3_column_text((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), v3);
      if (v7)
      {
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
        return v6;
      }

      -[_bmFMResultSet _tryLogSqliteColumnError:](self, "_tryLogSqliteColumnError:", v3);
    }

    uint64_t v6 = 0LL;
  }

  return v6;
}

- (id)stringForColumn:(id)a3
{
  return -[_bmFMResultSet stringForColumnIndex:]( self,  "stringForColumnIndex:",  -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
}

- (id)dateForColumn:(id)a3
{
  return -[_bmFMResultSet dateForColumnIndex:]( self,  "dateForColumnIndex:",  -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
}

- (id)dateForColumnIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = sqlite3_column_type((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3);
  uint64_t v6 = 0LL;
  if ((v3 & 0x80000000) == 0 && v5 != 5)
  {
    if (sqlite3_column_count((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement")) <= (int)v3)
    {
      uint64_t v6 = 0LL;
    }

    else if (-[_bmFMDatabase hasDateFormatter](self->_parentDB, "hasDateFormatter"))
    {
      parentDB = self->_parentDB;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMResultSet stringForColumnIndex:](self, "stringForColumnIndex:", v3));
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase dateFromString:](parentDB, "dateFromString:", v8));
    }

    else
    {
      -[_bmFMResultSet doubleForColumnIndex:](self, "doubleForColumnIndex:", v3);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));
    }
  }

  return v6;
}

- (id)dataForColumn:(id)a3
{
  return -[_bmFMResultSet dataForColumnIndex:]( self,  "dataForColumnIndex:",  -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
}

- (id)dataForColumnIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = sqlite3_column_type((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3);
  uint64_t v6 = 0LL;
  if ((v3 & 0x80000000) == 0 && v5 != 5)
  {
    if (sqlite3_column_count((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement")) > (int)v3)
    {
      int v7 = sqlite3_column_blob((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), v3);
      int v8 = sqlite3_column_bytes((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), v3);
      if (v7)
      {
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v7, v8));
        return v6;
      }

      -[_bmFMResultSet _tryLogSqliteColumnError:](self, "_tryLogSqliteColumnError:", v3);
    }

    uint64_t v6 = 0LL;
  }

  return v6;
}

- (id)dataNoCopyForColumn:(id)a3
{
  return -[_bmFMResultSet dataNoCopyForColumnIndex:]( self,  "dataNoCopyForColumnIndex:",  -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
}

- (id)dataNoCopyForColumnIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = sqlite3_column_type((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3);
  uint64_t v6 = 0LL;
  if ((v3 & 0x80000000) == 0 && v5 != 5)
  {
    if (sqlite3_column_count((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement")) > (int)v3)
    {
      int v7 = sqlite3_column_blob((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), v3);
      int v8 = sqlite3_column_bytes((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), v3);
      if (v7)
      {
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v7,  v8,  0LL));
        return v6;
      }

      -[_bmFMResultSet _tryLogSqliteColumnError:](self, "_tryLogSqliteColumnError:", v3);
    }

    uint64_t v6 = 0LL;
  }

  return v6;
}

- (BOOL)columnIndexIsNull:(int)a3
{
  return sqlite3_column_type((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3) == 5;
}

- (BOOL)columnIsNull:(id)a3
{
  return -[_bmFMResultSet columnIndexIsNull:]( self,  "columnIndexIsNull:",  -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
}

- (const)UTF8StringForColumnIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = sqlite3_column_type((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3);
  double result = 0LL;
  if ((v3 & 0x80000000) == 0 && v5 != 5)
  {
    if (sqlite3_column_count((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement")) > (int)v3)
    {
      double result = (const char *)sqlite3_column_text( (sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"),  v3);
      if (result) {
        return result;
      }
      -[_bmFMResultSet _tryLogSqliteColumnError:](self, "_tryLogSqliteColumnError:", v3);
    }

    return 0LL;
  }

  return result;
}

- (const)UTF8StringForColumn:(id)a3
{
  return -[_bmFMResultSet UTF8StringForColumnIndex:]( self,  "UTF8StringForColumnIndex:",  -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
}

- (const)UTF8StringForColumnName:(id)a3
{
  return -[_bmFMResultSet UTF8StringForColumn:](self, "UTF8StringForColumn:", a3);
}

- (id)objectForColumnIndex:(int)a3
{
  if (a3 < 0)
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    uint64_t v3 = *(void *)&a3;
    if (sqlite3_column_count((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement")) <= a3)
    {
      uint64_t v6 = 0LL;
    }

    else
    {
      int v5 = sqlite3_column_type((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), v3);
      switch(v5)
      {
        case 4:
          uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMResultSet dataForColumnIndex:](self, "dataForColumnIndex:", v3));
          if (!v6) {
            goto LABEL_16;
          }
          break;
        case 2:
          -[_bmFMResultSet doubleForColumnIndex:](self, "doubleForColumnIndex:", v3);
          uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
          if (!v6) {
            goto LABEL_16;
          }
          break;
        case 1:
          uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[_bmFMResultSet longLongIntForColumnIndex:](self, "longLongIntForColumnIndex:", v3)));
          if (!v6) {
            goto LABEL_16;
          }
          break;
        default:
          uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMResultSet stringForColumnIndex:](self, "stringForColumnIndex:", v3));
          if (!v6) {
LABEL_16:
          }
            uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
          break;
      }
    }
  }

  return v6;
}

- (id)objectForColumnName:(id)a3
{
  return -[_bmFMResultSet objectForColumn:](self, "objectForColumn:", a3);
}

- (id)objectForColumn:(id)a3
{
  return -[_bmFMResultSet objectForColumnIndex:]( self,  "objectForColumnIndex:",  -[_bmFMResultSet columnIndexForName:](self, "columnIndexForName:", a3));
}

- (id)columnNameForIndex:(int)a3
{
  return +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  sqlite3_column_name((sqlite3_stmt *)-[_bmFMStatement statement](self->_statement, "statement"), a3));
}

- (id)objectForKeyedSubscript:(id)a3
{
  return -[_bmFMResultSet objectForColumn:](self, "objectForColumn:", a3);
}

- (BOOL)bindWithArray:(id)a3 orDictionary:(id)a4 orVAList:(char *)a5
{
  statement = self->_statement;
  id v9 = a4;
  id v10 = a3;
  -[_bmFMStatement reset](statement, "reset");
  LOBYTE(a5) = -[_bmFMDatabase bindStatement:WithArgumentsInArray:orDictionary:orVAList:]( self->_parentDB,  "bindStatement:WithArgumentsInArray:orDictionary:orVAList:",  -[_bmFMStatement statement](self->_statement, "statement"),  v10,  v9,  a5);

  return (char)a5;
}

- (BOOL)bindWithArray:(id)a3
{
  return -[_bmFMResultSet bindWithArray:orDictionary:orVAList:]( self,  "bindWithArray:orDictionary:orVAList:",  a3,  0LL,  0LL);
}

- (BOOL)bindWithDictionary:(id)a3
{
  return -[_bmFMResultSet bindWithArray:orDictionary:orVAList:]( self,  "bindWithArray:orDictionary:orVAList:",  0LL,  a3,  0LL);
}

- (void)_tryLogSqliteColumnError:(int)a3
{
  p_parentDB = &self->_parentDB;
  if (-[_bmFMDatabase lastErrorCode](self->_parentDB, "lastErrorCode"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10003E4B0((id *)p_parentDB, (uint64_t)self, a3);
    }
  }

- (_bmFMDatabase)parentDB
{
  return self->_parentDB;
}

- (void)setParentDB:(id)a3
{
}

- (NSString)query
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setQuery:(id)a3
{
}

- (_bmFMStatement)statement
{
  return (_bmFMStatement *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setStatement:(id)a3
{
}

- (BOOL)shouldAutoClose
{
  return self->_shouldAutoClose;
}

- (void)setShouldAutoClose:(BOOL)a3
{
  self->_shouldAutoClose = a3;
}

- (void).cxx_destruct
{
}

@end