@interface _CPLIsInIndexSetInject
- (NSData)sql;
- (NSIndexSet)indexSet;
- (NSString)description;
- (_CPLIsInIndexSetInject)initWithInjection:(id)a3 indexSet:(id)a4 exclude:(BOOL)a5;
- (id)bindValuesToKeepAlive;
- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4;
@end

@implementation _CPLIsInIndexSetInject

- (_CPLIsInIndexSetInject)initWithInjection:(id)a3 indexSet:(id)a4 exclude:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS____CPLIsInIndexSetInject;
  v11 = -[_CPLIsInIndexSetInject init](&v37, "init");
  if (v11)
  {
    id v12 = [v10 count];
    if (v12)
    {
      id v13 = v12;
      objc_storeStrong(&v11->_injection, a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v9 sql]);
      v15 = objc_alloc(&OBJC_CLASS___NSMutableData);
      v16 = (char *)[v14 length];
      if (v13 == (id)1)
      {
        uint64_t v17 = 4LL;
        if (v5) {
          uint64_t v17 = 5LL;
        }
        v18 = -[NSMutableData initWithCapacity:](v15, "initWithCapacity:", &v16[v17]);
        -[NSMutableData appendBytes:length:](v18, "appendBytes:length:", "(", 1LL);
        -[NSMutableData appendData:](v18, "appendData:", v14);
        if (v5)
        {
          v19 = "!=?)";
          v20 = v18;
          uint64_t v21 = 4LL;
        }

        else
        {
          v19 = "=?)";
          v20 = v18;
          uint64_t v21 = 3LL;
        }

        -[NSMutableData appendBytes:length:](v20, "appendBytes:length:", v19, v21);
        objc_storeStrong((id *)&v11->_sql, v18);
        if ((objc_opt_respondsToSelector(v9, "bindValuesToKeepAlive") & 1) != 0)
        {
          uint64_t v30 = objc_claimAutoreleasedReturnValue([v9 bindValuesToKeepAlive]);
          id keepAlive = v11->_keepAlive;
          v11->_id keepAlive = (id)v30;
        }

        v11->_onlyIndex = (unint64_t)[v10 firstIndex];
      }

      else
      {
        uint64_t v26 = 20LL;
        if (v5) {
          uint64_t v26 = 21LL;
        }
        v27 = -[NSMutableData initWithCapacity:](v15, "initWithCapacity:", &v16[v26]);
        v18 = v27;
        if (v5)
        {
          v28 = "(!is_in_indexset(";
          uint64_t v29 = 17LL;
        }

        else
        {
          v28 = "(is_in_indexset(";
          uint64_t v29 = 16LL;
        }

        -[NSMutableData appendBytes:length:](v27, "appendBytes:length:", v28, v29);
        -[NSMutableData appendData:](v18, "appendData:", v14);
        -[NSMutableData appendBytes:length:](v18, "appendBytes:length:", ",?))", 4LL);
        objc_storeStrong((id *)&v11->_sql, v18);
        if ((objc_opt_respondsToSelector(v9, "bindValuesToKeepAlive") & 1) != 0)
        {
          uint64_t v32 = objc_claimAutoreleasedReturnValue([v9 bindValuesToKeepAlive]);
          id v33 = v11->_keepAlive;
          v11->_id keepAlive = (id)v32;
        }

        if (v11->_keepAlive)
        {
          v38[0] = v11->_keepAlive;
          v38[1] = v10;
          id v34 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 2LL));
        }

        else
        {
          id v34 = v10;
        }

        id v35 = v11->_keepAlive;
        v11->_id keepAlive = v34;

        objc_storeStrong((id *)&v11->_indexSet, a4);
      }
    }

    else
    {
      v22 = objc_alloc(&OBJC_CLASS___NSData);
      if (v5) {
        v23 = "(1)";
      }
      else {
        v23 = "(0)";
      }
      v24 = -[NSData initWithBytes:length:](v22, "initWithBytes:length:", v23, 3LL);
      sql = v11->_sql;
      v11->_sql = v24;

      v11->_onlyIndex = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return v11;
}

- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  indexSet = self->_indexSet;
  if (*(_OWORD *)&self->_onlyIndex == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  id injection = self->_injection;
  if (injection)
  {
    int v8 = [injection bindWithStatement:a3 startingAtIndex:*(void *)&a4] + 1;
    if (self->_indexSet)
    {
LABEL_5:
      pql_sqlite3_bind_pointer(a3, v4);
      return v8;
    }
  }

  else
  {
    int v8 = 1;
    if (indexSet) {
      goto LABEL_5;
    }
  }

  sqlite3_int64 onlyIndex = self->_onlyIndex;
  if (onlyIndex != 0x7FFFFFFFFFFFFFFFLL) {
    sqlite3_bind_int64(a3, v4, onlyIndex);
  }
  return v8;
}

- (NSData)sql
{
  return self->_sql;
}

- (id)bindValuesToKeepAlive
{
  return self->_keepAlive;
}

- (NSString)description
{
  v3 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", self->_sql, 4LL);
  indexSet = self->_indexSet;
  BOOL v5 = objc_alloc(&OBJC_CLASS___NSString);
  if (indexSet) {
    v6 = -[NSString initWithFormat:](v5, "initWithFormat:", @"[query: %@, %@]", v3, self->_indexSet);
  }
  else {
    v6 = -[NSString initWithFormat:](v5, "initWithFormat:", @"[query: %@]", v3, v9);
  }
  v7 = v6;

  return v7;
}

- (NSIndexSet)indexSet
{
  return self->_indexSet;
}

- (void).cxx_destruct
{
}

@end