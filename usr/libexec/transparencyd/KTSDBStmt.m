@interface KTSDBStmt
- (BOOL)needReset;
- (BOOL)steps:(id)a3 error:(id *)a4;
- (KTSDBObjc)db;
- (KTSDBStmt)initWithStatement:(id)a3 db:(id)a4 error:(id *)a5;
- (NSDictionary)indexesByColumnName;
- (double)doubleAtColumn:(unint64_t)a3;
- (id)allObjects;
- (id)allObjectsByColumnName;
- (id)blobAtColumn:(unint64_t)a3;
- (id)columnNameAtColumn:(unint64_t)a3;
- (id)dateAtColumn:(unint64_t)a3;
- (id)generateDone;
- (id)generateError:(int)a3 method:(id)a4;
- (id)objectAtColumn:(unint64_t)a3;
- (id)stepWithError:(id *)a3;
- (id)textAtColumn:(unint64_t)a3;
- (int)columnTypeAtColumn:(unint64_t)a3;
- (int)intAtColumn:(unint64_t)a3;
- (int64_t)int64AtColumn:(unint64_t)a3;
- (sqlite3_stmt)stmt;
- (unint64_t)columnCount;
- (unint64_t)indexForColumnName:(id)a3;
- (void)bindData:(id)a3 column:(unint64_t)a4;
- (void)bindDate:(id)a3 column:(unint64_t)a4;
- (void)bindDouble:(double)a3 column:(unint64_t)a4;
- (void)bindInt64:(int64_t)a3 column:(unint64_t)a4;
- (void)bindInt:(int)a3 column:(unint64_t)a4;
- (void)bindNullAtColumn:(unint64_t)a3;
- (void)bindString:(id)a3 column:(unint64_t)a4;
- (void)clearBindings;
- (void)dealloc;
- (void)enumerateColumnsUsingBlock:(id)a3;
- (void)reset;
- (void)setDb:(id)a3;
- (void)setIndexesByColumnName:(id)a3;
- (void)setNeedReset:(BOOL)a3;
- (void)setStmt:(sqlite3_stmt *)a3;
@end

@implementation KTSDBStmt

- (KTSDBStmt)initWithStatement:(id)a3 db:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___KTSDBStmt;
  v10 = -[KTSDBStmt init](&v17, "init");
  v11 = (sqlite3_stmt **)v10;
  if (v10)
  {
    -[KTSDBStmt setDb:](v10, "setDb:", v9);
    uint64_t v12 = sqlite3_prepare_v3( (sqlite3 *)[v9 db], (const char *)objc_msgSend(v8, "UTF8String"), -1, 0, v11 + 3, 0);
    if (!(_DWORD)v12)
    {
      v15 = v11;
      goto LABEL_10;
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 generateError:v12 method:@"init"]);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 log]);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "KTSDBStmt prepare: %@", buf, 0xCu);
    }

    if (a5) {
      *a5 = v13;
    }
  }

  v15 = 0LL;
LABEL_10:

  return v15;
}

- (void)dealloc
{
  if (-[KTSDBStmt needReset](self, "needReset")) {
    sqlite3_reset(-[KTSDBStmt stmt](self, "stmt"));
  }
  sqlite3_finalize(-[KTSDBStmt stmt](self, "stmt"));
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___KTSDBStmt;
  -[KTSDBStmt dealloc](&v3, "dealloc");
}

- (void)bindString:(id)a3 column:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    int v7 = sqlite3_bind_text( -[KTSDBStmt stmt](self, "stmt"), a4 + 1, (const char *)[v6 UTF8String], -1, 0);
    if (v7)
    {
      int v8 = v7;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt db](self, "db"));
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 log]);

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11[0] = 67109120;
        v11[1] = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "sqlite3_bind_text: %d", (uint8_t *)v11, 8u);
      }
    }
  }

  else
  {
    -[KTSDBStmt bindNullAtColumn:](self, "bindNullAtColumn:", a4);
  }
}

- (void)bindInt:(int)a3 column:(unint64_t)a4
{
  int v5 = sqlite3_bind_int(-[KTSDBStmt stmt](self, "stmt"), a4 + 1, a3);
  if (v5)
  {
    int v6 = v5;
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt db](self, "db"));
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 log]);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sqlite3_bind_int: %d", (uint8_t *)v9, 8u);
    }
  }

- (void)bindInt64:(int64_t)a3 column:(unint64_t)a4
{
  int v5 = sqlite3_bind_int64(-[KTSDBStmt stmt](self, "stmt"), a4 + 1, a3);
  if (v5)
  {
    int v6 = v5;
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt db](self, "db"));
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 log]);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sqlite3_bind_int64: %d", (uint8_t *)v9, 8u);
    }
  }

- (void)bindDouble:(double)a3 column:(unint64_t)a4
{
  int v5 = sqlite3_bind_double(-[KTSDBStmt stmt](self, "stmt"), a4 + 1, a3);
  if (v5)
  {
    int v6 = v5;
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt db](self, "db"));
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 log]);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sqlite3_bind_double: %d", (uint8_t *)v9, 8u);
    }
  }

- (void)bindDate:(id)a3 column:(unint64_t)a4
{
}

- (void)bindData:(id)a3 column:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    int v7 = -[KTSDBStmt stmt](self, "stmt");
    id v8 = v6;
    int v9 = sqlite3_bind_blob(v7, a4 + 1, [v8 bytes], (int)objc_msgSend(v8, "length"), 0);
    if (v9)
    {
      int v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt db](self, "db"));
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 log]);

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13[0] = 67109120;
        v13[1] = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "sqlite3_bind_blob: %d", (uint8_t *)v13, 8u);
      }
    }
  }

  else
  {
    -[KTSDBStmt bindNullAtColumn:](self, "bindNullAtColumn:", a4);
  }
}

- (void)bindNullAtColumn:(unint64_t)a3
{
}

- (id)generateError:(int)a3 method:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt db](self, "db"));
  id v8 = sqlite3_errmsg((sqlite3 *)[v7 db]);

  v14[0] = NSLocalizedDescriptionKey;
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: %s", v6, v8));

  v14[1] = @"sqliteCode";
  v15[0] = v9;
  int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  v15[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"KTSDBObjcError",  1LL,  v11));
  return v12;
}

- (id)generateDone
{
  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"KTSDBObjcError",  2LL,  0LL);
}

- (BOOL)steps:(id)a3 error:(id *)a4
{
  id v6 = (uint64_t (**)(id, KTSDBStmt *))a3;
  -[KTSDBStmt setNeedReset:](self, "setNeedReset:", 1LL);
  while (1)
  {
    uint64_t v7 = sqlite3_step(-[KTSDBStmt stmt](self, "stmt"));
    if ((v6[2](v6, self) & 1) == 0) {
      goto LABEL_7;
    }
  }

  if (v7 == 101)
  {
    -[KTSDBStmt setNeedReset:](self, "setNeedReset:", 0LL);
    sqlite3_reset(-[KTSDBStmt stmt](self, "stmt"));
LABEL_7:
    BOOL v8 = 1;
    goto LABEL_13;
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt generateError:method:](self, "generateError:method:", v7, @"steps"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt db](self, "db"));
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 log]);

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "steps: %@", (uint8_t *)&v13, 0xCu);
  }

  if (a4) {
    *a4 = v9;
  }
  -[KTSDBStmt setNeedReset:](self, "setNeedReset:", 0LL);
  sqlite3_reset(-[KTSDBStmt stmt](self, "stmt"));
  sqlite3_clear_bindings(-[KTSDBStmt stmt](self, "stmt"));

  BOOL v8 = 0;
LABEL_13:

  return v8;
}

- (id)stepWithError:(id *)a3
{
  uint64_t v5 = sqlite3_step(-[KTSDBStmt stmt](self, "stmt"));
  if (v5 == 101)
  {
    -[KTSDBStmt setNeedReset:](self, "setNeedReset:", 0LL);
    sqlite3_reset(-[KTSDBStmt stmt](self, "stmt"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt generateDone](self, "generateDone"));
    if (!a3) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  if (v5 == 100)
  {
    -[KTSDBStmt setNeedReset:](self, "setNeedReset:", 1LL);
    return self;
  }

  int v8 = v5;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt generateError:method:](self, "generateError:method:", v5, @"step"));
  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt db](self, "db"));
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 log]);

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109378;
    v11[1] = v8;
    __int16 v12 = 2112;
    int v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "stepWithError %d error: %@",  (uint8_t *)v11,  0x12u);
  }

  if (a3) {
LABEL_9:
  }
    *a3 = v7;
LABEL_10:

  return 0LL;
}

- (void)reset
{
  if (-[KTSDBStmt needReset](self, "needReset"))
  {
    -[KTSDBStmt setNeedReset:](self, "setNeedReset:", 0LL);
    sqlite3_reset(-[KTSDBStmt stmt](self, "stmt"));
  }

- (void)clearBindings
{
}

- (unint64_t)columnCount
{
  return sqlite3_column_count(-[KTSDBStmt stmt](self, "stmt"));
}

- (int)columnTypeAtColumn:(unint64_t)a3
{
  return sqlite3_column_type(-[KTSDBStmt stmt](self, "stmt"), a3);
}

- (id)columnNameAtColumn:(unint64_t)a3
{
  return +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  sqlite3_column_name(-[KTSDBStmt stmt](self, "stmt"), a3));
}

- (unint64_t)indexForColumnName:(id)a3
{
  id v4 = a3;
  indexesByColumnName = self->_indexesByColumnName;
  if (!indexesByColumnName)
  {
    -[KTSDBStmt enumerateColumnsUsingBlock:](self, "enumerateColumnsUsingBlock:", 0LL);
    indexesByColumnName = self->_indexesByColumnName;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](indexesByColumnName, "objectForKeyedSubscript:", v4));
  uint64_t v7 = v6;
  if (v6) {
    unint64_t v8 = (unint64_t)[v6 unsignedIntegerValue];
  }
  else {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (int)intAtColumn:(unint64_t)a3
{
  return sqlite3_column_int(-[KTSDBStmt stmt](self, "stmt"), a3);
}

- (int64_t)int64AtColumn:(unint64_t)a3
{
  return sqlite3_column_int64(-[KTSDBStmt stmt](self, "stmt"), a3);
}

- (double)doubleAtColumn:(unint64_t)a3
{
  return sqlite3_column_double(-[KTSDBStmt stmt](self, "stmt"), a3);
}

- (id)blobAtColumn:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v5 = (void *)sqlite3_column_blob(-[KTSDBStmt stmt](self, "stmt"), a3);
  if (v5)
  {
    id v6 = v5;
    unsigned int v7 = sqlite3_column_bytes(-[KTSDBStmt stmt](self, "stmt"), v3);
    if ((v7 & 0x80000000) != 0) {
      uint64_t v5 = 0LL;
    }
    else {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v6, v7));
    }
  }

  return v5;
}

- (id)dateAtColumn:(unint64_t)a3
{
  return +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:");
}

- (id)textAtColumn:(unint64_t)a3
{
  int v3 = (unsigned __int8 *)sqlite3_column_text(-[KTSDBStmt stmt](self, "stmt"), a3);
  if (v3) {
    int v3 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v3));
  }
  return v3;
}

- (id)objectAtColumn:(unint64_t)a3
{
  unsigned int v5 = -[KTSDBStmt columnTypeAtColumn:](self, "columnTypeAtColumn:") - 1;
  id v6 = 0LL;
  switch(v5)
  {
    case 0u:
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[KTSDBStmt int64AtColumn:](self, "int64AtColumn:", a3)));
      goto LABEL_9;
    case 1u:
      -[KTSDBStmt doubleAtColumn:](self, "doubleAtColumn:", a3);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      goto LABEL_9;
    case 2u:
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt textAtColumn:](self, "textAtColumn:", a3));
      goto LABEL_9;
    case 3u:
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt blobAtColumn:](self, "blobAtColumn:", a3));
      goto LABEL_9;
    case 4u:
LABEL_9:
      id result = v6;
      break;
    default:
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt db](self, "db"));
      unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 log]);

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 67109120;
        v10[1] = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Unexpected column type: %d",  (uint8_t *)v10,  8u);
      }

      id result = 0LL;
      break;
  }

  return result;
}

- (id)allObjects
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100016F10;
  v6[3] = &unk_100277878;
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  -[KTSDBStmt columnCount](self, "columnCount")));
  id v7 = v3;
  unint64_t v8 = self;
  -[KTSDBStmt enumerateColumnsUsingBlock:](self, "enumerateColumnsUsingBlock:", v6);
  id v4 = v3;

  return v4;
}

- (id)allObjectsByColumnName
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100017044;
  v6[3] = &unk_100277878;
  id v7 = self;
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  -[KTSDBStmt columnCount](self, "columnCount")));
  id v8 = v2;
  -[KTSDBStmt enumerateColumnsUsingBlock:](v7, "enumerateColumnsUsingBlock:", v6);
  id v3 = v8;
  id v4 = v2;

  return v4;
}

- (void)enumerateColumnsUsingBlock:(id)a3
{
  __int16 v12 = (void (**)(void))a3;
  unint64_t v4 = -[KTSDBStmt columnCount](self, "columnCount");
  unint64_t v5 = v4;
  if (self->_indexesByColumnName)
  {
    id v6 = 0LL;
    if (!v4) {
      goto LABEL_11;
    }
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  v4));
    if (!v5) {
      goto LABEL_11;
    }
  }

  uint64_t v7 = 0LL;
  do
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSDBStmt columnNameAtColumn:](self, "columnNameAtColumn:", v7));
    if (v6)
    {
      int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v7));
      [v6 setObject:v9 forKeyedSubscript:v8];
    }

    if (v12) {
      v12[2]();
    }

    ++v7;
  }

  while (v5 != v7);
LABEL_11:
  if (v6)
  {
    int v10 = (NSDictionary *)[v6 copy];
    indexesByColumnName = self->_indexesByColumnName;
    self->_indexesByColumnName = v10;
  }
}

- (KTSDBObjc)db
{
  return (KTSDBObjc *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDb:(id)a3
{
}

- (sqlite3_stmt)stmt
{
  return self->_stmt;
}

- (void)setStmt:(sqlite3_stmt *)a3
{
  self->_stmt = a3;
}

- (BOOL)needReset
{
  return self->_needReset;
}

- (void)setNeedReset:(BOOL)a3
{
  self->_needReset = a3;
}

- (NSDictionary)indexesByColumnName
{
  return self->_indexesByColumnName;
}

- (void)setIndexesByColumnName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end