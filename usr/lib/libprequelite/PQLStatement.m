@interface PQLStatement
- (BOOL)_prepare:(const char *)a3 withDB:(id)a4 preparationTime:(unint64_t *)a5;
- (BOOL)isTraced;
- (PQLStatement)initWithFormat:(id)a3 arguments:(char *)a4 db:(id)a5 cache:(cache_s *)a6 preparationTime:(unint64_t *)a7;
- (PQLStatement)initWithQueryBuilder:(id)a3 db:(id)a4 cache:(cache_s *)a5 preparationTime:(unint64_t *)a6;
- (PQLStatement)initWithStatement:(id)a3 forDB:(id)a4 preparationTime:(unint64_t *)a5;
- (id)description;
- (id)translate:(id)a3 hasInjections:(BOOL *)a4 arguments:(char *)a5;
- (id)translate:(id)a3 withBuilder:(id)a4;
- (void)bindArguments:(char *)a3 db:(id)a4;
- (void)bindFromArray:(id)a3 db:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)keepBindAlive:(id)a3;
- (void)unbindForDB:(id)a3 returnedRows:(unint64_t)a4 executionTime:(unint64_t)a5 preparationTime:(unint64_t)a6;
@end

@implementation PQLStatement

- (BOOL)isTraced
{
  return self->_isTraced;
}

- (void)keepBindAlive:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    aliveBinds = self->_aliveBinds;
    id v8 = v4;
    if (aliveBinds)
    {
      -[NSMutableArray addObject:](aliveBinds, "addObject:", v4);
    }

    else
    {
      v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", v4, 0);
      v7 = self->_aliveBinds;
      self->_aliveBinds = v6;
    }

    id v4 = v8;
  }
}

- (id)translate:(id)a3 hasInjections:(BOOL *)a4 arguments:(char *)a5
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = (const char *)[v7 UTF8String];
  v9 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:strlen(v8) + 1];
  self->_uint64_t specLength = 0;
  size_t v10 = strcspn(v8, "%");
  [v9 appendBytes:v8 length:v10];
  v11 = &v8[v10];
  if (*v11)
  {
    uint64_t v41 = *MEMORY[0x189603A60];
    while (1)
    {
      v13 = v11 + 1;
      int v12 = *((unsigned __int8 *)v11 + 1);
      if (v12 == 37) {
        break;
      }
      if (v12 == 64)
      {
        v16 = (id *)a5;
        a5 += 8;
        id v17 = *v16;
        if ([*v16 conformsToProtocol:&unk_18C72ED98])
        {
          *a4 = 1;
          uint64_t specLength = self->_specLength;
          self->_uint64_t specLength = specLength + 1;
          __src[specLength] = 8;
          v13 = v11 + 2;
          [v17 sql];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v9 appendData:v19];

          goto LABEL_21;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          uint64_t v20 = self->_specLength;
          self->_uint64_t specLength = v20 + 1;
          __src[v20] = 9;
          v13 = v11 + 2;
          v14 = v9;
          v15 = "?";
          goto LABEL_5;
        }
      }

      [v9 appendBytes:"?" length:1];
      int v21 = *v13;
      if (v21 > 96)
      {
        switch(*v13)
        {
          case 'a':
          case 'e':
          case 'f':
          case 'g':
            goto LABEL_18;
          case 'd':
          case 'i':
            a5 += 8;
            uint64_t v22 = self->_specLength;
            self->_uint64_t specLength = v22 + 1;
            __src[v22] = 0;
            goto LABEL_20;
          case 'l':
            int v28 = v11[2];
            if (memchr("udi", v28, 4uLL))
            {
              a5 += 8;
              uint64_t v29 = self->_specLength;
              self->_uint64_t specLength = v29 + 1;
              __src[v29] = 2;
              goto LABEL_38;
            }

            if (v28 <= 107)
            {
              if (v28 == 100 || v28 == 105)
              {
                a5 += 8;
                uint64_t v34 = self->_specLength;
                self->_uint64_t specLength = v34 + 1;
                __src[v34] = 0;
                goto LABEL_38;
              }

              goto LABEL_55;
            }

            if (v28 != 108)
            {
              if (v28 != 117) {
                goto LABEL_55;
              }
              a5 += 8;
              uint64_t v35 = self->_specLength;
              self->_uint64_t specLength = v35 + 1;
              __src[v35] = 1;
              goto LABEL_38;
            }

            if (!memchr("udi", v11[3], 4uLL)) {
              goto LABEL_55;
            }
            a5 += 8;
            uint64_t v36 = self->_specLength;
            self->_uint64_t specLength = v36 + 1;
            __src[v36] = 2;
            break;
          case 'p':
            a5 += 8;
            uint64_t v26 = self->_specLength;
            self->_uint64_t specLength = v26 + 1;
            char v27 = 2;
            goto LABEL_30;
          case 's':
            a5 += 8;
            uint64_t v23 = self->_specLength;
            self->_uint64_t specLength = v23 + 1;
            char v24 = 4;
            goto LABEL_19;
          case 'u':
            a5 += 8;
            uint64_t v23 = self->_specLength;
            self->_uint64_t specLength = v23 + 1;
            char v24 = 1;
            goto LABEL_19;
          default:
            goto LABEL_55;
        }

- (BOOL)_prepare:(const char *)a3 withDB:(id)a4 preparationTime:(unint64_t *)a5
{
  id v8 = a4;
  v8[1] = mach_absolute_time();
  int v9 = sqlite3_prepare_v2((sqlite3 *)[v8 dbHandle], a3, -1, &self->_stmt, 0);
  if (a5) {
    *a5 = mach_absolute_time() - v8[1];
  }
  v8[1] = 0LL;
  if (v9)
  {
    size_t v10 = (void *)MEMORY[0x189607870];
    uint64_t v11 = [v8 dbHandle];
    [NSString stringWithUTF8String:a3];
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 errorForDB:v11 SQL:v12];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setLastError:v13];

    [v8 sqliteErrorHandler];
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      [v8 sqliteErrorHandler];
      v15 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      [v8 lastError];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *, PQLStatement *, void *))v15)[2](v15, v8, self, v16);
    }
  }

  return v9 == 0;
}

- (PQLStatement)initWithStatement:(id)a3 forDB:(id)a4 preparationTime:(unint64_t *)a5
{
  id v8 = (char *)a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PQLStatement;
  size_t v10 = -[PQLStatement init](&v17, sel_init);
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_size_t specLength = *((_WORD *)v8 + 21);
    v10->_isTraced = [v9 isTraced];
    size_t specLength = v11->_specLength;
    if (*((__int16 *)v8 + 21) < 9)
    {
      memcpy(&v11->_specUnion, v8 + 32, v11->_specLength);
    }

    else
    {
      v13 = (const void *)*((void *)v8 + 4);
      v14 = (unsigned __int8 *)malloc(v11->_specLength);
      if (!v14) {
        abort();
      }
      v15 = v14;
      memcpy(v14, v13, specLength);
      v11->_specUnion.ptr = v15;
    }

    if (!-[PQLStatement _prepare:withDB:preparationTime:]( v11,  "_prepare:withDB:preparationTime:",  sqlite3_sql(*((sqlite3_stmt **)v8 + 1)),  v9,  a5))
    {

      uint64_t v11 = 0LL;
    }
  }

  return v11;
}

- (PQLStatement)initWithFormat:(id)a3 arguments:(char *)a4 db:(id)a5 cache:(cache_s *)a6 preparationTime:(unint64_t *)a7
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  int v12 = (char *)a3;
  uint64_t v37 = a4;
  id v13 = a5;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___PQLStatement;
  v14 = -[PQLStatement init](&v36, sel_init);
  if (v14)
  {
    v15 = v14;
    char v35 = 0;
    v14->_isTraced = [v13 isTraced];
    if (a6 && !cache_get_and_retain(a6, v12, (void **)cf))
    {
      uint64_t v23 = CFRetain(cf[0]);
      cache_release_value(a6, (void *)cf[0]);
      if (v15->_isTraced)
      {
        if (pql_pred != -1) {
          dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
        }
        char v24 = (os_log_s *)pql_log;
        if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v39 = v12;
          __int16 v40 = 2112;
          uint64_t v41 = v23;
          _os_log_impl( &dword_18895A000,  v24,  OS_LOG_TYPE_DEBUG,  "found cached statement without injections\nsql:  %@\nstmt: %@",  buf,  0x16u);
        }
      }

      objc_super v17 = 0LL;
    }

    else
    {
      if (v37) {
        cf[1] = v37;
      }
      objc_super v17 = -[PQLStatement translate:hasInjections:arguments:](v15, "translate:hasInjections:arguments:", v12, &v35);
      if (v15->_isTraced)
      {
        v18 = (void *)MEMORY[0x1895CF1AC]();
        if (pql_pred != -1) {
          dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
        }
        v19 = (void *)pql_log;
        if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
        {
          if (v35) {
            uint64_t v20 = "";
          }
          else {
            uint64_t v20 = "out";
          }
          int v21 = v19;
          uint64_t v22 = [v17 bytes];
          *(_DWORD *)buf = 136315650;
          v39 = v20;
          __int16 v40 = 2112;
          uint64_t v41 = v12;
          __int16 v42 = 2080;
          v43 = (PQLStatement *)v22;
          _os_log_impl( &dword_18895A000,  v21,  OS_LOG_TYPE_DEBUG,  "translated statement with%s injections\nsql:   %@\ntrans: %s",  buf,  0x20u);
        }

        objc_autoreleasePoolPop(v18);
      }

      uint64_t v23 = 0LL;
      if (!a6) {
        goto LABEL_26;
      }
    }

    if (v35 && !cache_get_and_retain(a6, v17, (void **)cf))
    {
      size_t v25 = (PQLStatement *)CFRetain(cf[0]);

      cache_release_value(a6, (void *)cf[0]);
      if (v15->_isTraced)
      {
        if (pql_pred != -1) {
          dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
        }
        char v33 = (os_log_s *)pql_log;
        if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v39 = v12;
          __int16 v40 = 2112;
          uint64_t v41 = v25;
          _os_log_impl( &dword_18895A000,  v33,  OS_LOG_TYPE_DEBUG,  "found cached statement with injections\nsql:  %@\nstmt: %@",  buf,  0x16u);
        }
      }

- (void)invalidate
{
  self->_stmt = 0LL;
  aliveBinds = self->_aliveBinds;
  self->_aliveBinds = 0LL;
}

- (void)dealloc
{
  if (self->_specLength >= 9) {
    free(self->_specUnion.ptr);
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PQLStatement;
  -[PQLStatement dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  stmt = self->_stmt;
  if (stmt) {
    v6 = sqlite3_sql(stmt);
  }
  else {
    v6 = "INVALIDATED";
  }
  return (id)[v3 stringWithFormat:@"<%@:%p {%s}>", v4, self, v6];
}

- (void)bindArguments:(char *)a3 db:(id)a4
{
  id v6 = a4;
  if (!self->_stmt)
  {
    [MEMORY[0x1896077D8] currentHandler];
    char v35 = (void *)objc_claimAutoreleasedReturnValue();
    [v35 handleFailureInMethod:a2 object:self file:@"PQLStatement.m" lineNumber:427 description:@"cannot bind a closed statement"];
  }

  if (self->_inUse)
  {
    [MEMORY[0x1896077D8] currentHandler];
    objc_super v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v36 handleFailureInMethod:a2 object:self file:@"PQLStatement.m" lineNumber:428 description:@"cannot bind a statement in use"];
  }

  int specLength = self->_specLength;
  if (specLength >= 9)
  {
    ptr = ($B640FA5AF0A9E956D46B4BA9A7C3BCE7 *)self->_specUnion.ptr;
    self->_inUse = 1;
LABEL_9:
    uint64_t v9 = 0LL;
    uint64_t v10 = 1LL;
    while (2)
    {
      switch(ptr->inlined[v9])
      {
        case 0u:
          uint64_t v11 = (v10 + 1);
          int v12 = (int *)a3;
          a3 += 8;
          sqlite3_bind_int(self->_stmt, v10, *v12);
          goto LABEL_33;
        case 1u:
          stmt = self->_stmt;
          uint64_t v11 = (v10 + 1);
          v15 = a3;
          a3 += 8;
          sqlite3_int64 v16 = *(unsigned int *)v15;
          goto LABEL_15;
        case 2u:
          stmt = self->_stmt;
          uint64_t v11 = (v10 + 1);
          objc_super v17 = a3;
          a3 += 8;
          sqlite3_int64 v16 = *(void *)v17;
LABEL_15:
          sqlite3_bind_int64(stmt, v10, v16);
          goto LABEL_33;
        case 3u:
          uint64_t v11 = (v10 + 1);
          v18 = (double *)a3;
          a3 += 8;
          sqlite3_bind_double(self->_stmt, v10, *v18);
          goto LABEL_33;
        case 4u:
          v19 = a3;
          a3 += 8;
          uint64_t v20 = *(const char **)v19;
          int v21 = self->_stmt;
          uint64_t v11 = (v10 + 1);
          int v22 = v10;
          if (*(void *)v19)
          {
            int v23 = -1;
LABEL_23:
            sqlite3_bind_text(v21, v22, v20, v23, 0LL);
          }

          else
          {
            sqlite3_bind_null(v21, v10);
          }

- (void)unbindForDB:(id)a3 returnedRows:(unint64_t)a4 executionTime:(unint64_t)a5 preparationTime:(unint64_t)a6
{
  id v20 = a3;
  if (self->_stmt)
  {
    if (self->_inUse)
    {
      [v20 profilingHook];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        [v20 profilingHook];
        uint64_t v11 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
        ((void (**)(void, id, sqlite3_stmt *, unint64_t))v11)[2](v11, v20, self->_stmt, a4);
      }

      if (self->_inUse)
      {
        [v20 profilingHookV2];
        int v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          id v13 = objc_alloc(&OBJC_CLASS___PQLStatementMetricsData);
          stmt = self->_stmt;
          double v15 = timeInSeconds(a5);
          sqlite3_int64 v16 = -[PQLStatementMetricsData initWithStmt:returnedRows:executionTime:preparationTime:]( v13,  "initWithStmt:returnedRows:executionTime:preparationTime:",  stmt,  a4,  v15,  timeInSeconds(a6));
          [v20 profilingHookV2];
          objc_super v17 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
          ((void (**)(void, id, PQLStatementMetricsData *))v17)[2](v17, v20, v16);
        }
      }
    }

    v18 = self->_stmt;
    sqlite3_reset(v18);
    sqlite3_stmt_status(v18, 1, 1);
    sqlite3_stmt_status(v18, 2, 1);
    sqlite3_stmt_status(v18, 3, 1);
    sqlite3_stmt_status(v18, 4, 1);
    sqlite3_clear_bindings(self->_stmt);
  }

  aliveBinds = self->_aliveBinds;
  self->_aliveBinds = 0LL;

  self->_inUse = 0;
}

- (void).cxx_destruct
{
}

- (id)translate:(id)a3 withBuilder:(id)a4
{
  id v6 = a3;
  id v7 = (signed __int16 *)a4;
  id v8 = v6;
  uint64_t v9 = (const char *)[v8 UTF8String];
  size_t v10 = strlen(v9);
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:strlen(v9) + v7[508] + 1];
  int v12 = v7[508];
  size_t v13 = (unsigned __int16)v7[508];
  self->_int specLength = v7[508];
  if (v12 < 9)
  {
    memcpy(&self->_specUnion, v7 + 8, (__int16)v13);
  }

  else
  {
    v14 = (unsigned __int8 *)malloc(v13);
    if (!v14) {
      abort();
    }
    double v15 = v14;
    memcpy(v14, v7 + 8, v13);
    self->_specUnion.ptr = v15;
  }

  [v11 appendBytes:v9 length:v10 + 1];
  [v11 appendBytes:v7 + 8 length:v7[508]];

  return v11;
}

- (PQLStatement)initWithQueryBuilder:(id)a3 db:(id)a4 cache:(cache_s *)a5 preparationTime:(unint64_t *)a6
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  size_t v10 = (void (**)(id, PQLQueryBuilder *))a3;
  id v11 = a4;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___PQLStatement;
  int v12 = -[PQLStatement init](&v32, sel_init);
  if (v12)
  {
    size_t v13 = v12;
    v14 = objc_alloc_init(&OBJC_CLASS___PQLQueryBuilder);
    v10[2](v10, v14);
    double v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PQLQueryBuilder lastError](v14, "lastError");
    sqlite3_int64 v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[PQLQueryBuilder lastError](v14, "lastError");
      objc_super v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 setLastError:v17];

      v18 = 0LL;
LABEL_23:
      v19 = 0LL;
LABEL_37:

      goto LABEL_38;
    }

    v13->_isTraced = [v11 isTraced];
    v18 = -[PQLStatement translate:withBuilder:](v13, "translate:withBuilder:", v15, v14);
    if (v13->_isTraced)
    {
      id v20 = (void *)MEMORY[0x1895CF1AC]();
      if (pql_pred != -1) {
        dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
      }
      int v21 = (void *)pql_log;
      if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
      {
        int v22 = v21;
        uint64_t v23 = [v18 bytes];
        *(_DWORD *)buf = 138412546;
        uint64_t v34 = v15;
        __int16 v35 = 2080;
        objc_super v36 = (PQLStatement *)v23;
        _os_log_impl( &dword_18895A000,  v22,  OS_LOG_TYPE_DEBUG,  "translated statement with injections\nsql:   %@\ntrans: %s",  buf,  0x16u);
      }

      objc_autoreleasePoolPop(v20);
    }

    if (!a5 || cache_get_and_retain(a5, v18, &value_out)) {
      goto LABEL_13;
    }
    size_t v25 = (PQLStatement *)CFRetain(value_out);
    cache_release_value(a5, value_out);
    if (v13->_isTraced)
    {
      if (pql_pred != -1) {
        dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
      }
      uint64_t v26 = (os_log_s *)pql_log;
      if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v34 = v15;
        __int16 v35 = 2112;
        objc_super v36 = v25;
        _os_log_impl( &dword_18895A000,  v26,  OS_LOG_TYPE_DEBUG,  "found cached statement with injections\nsql:  %@\nstmt: %@",  buf,  0x16u);
      }
    }

    if (!v25)
    {
LABEL_13:
      if (!-[PQLStatement _prepare:withDB:preparationTime:]( v13,  "_prepare:withDB:preparationTime:",  [v18 bytes],  v11,  a6)) {
        goto LABEL_23;
      }
      if (a5 && !cache_set_and_retain(a5, v18, v13, 0LL))
      {
        if (v13->_isTraced)
        {
          if (pql_pred != -1) {
            dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
          }
          char v24 = (os_log_s *)pql_log;
          if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v34 = v15;
            __int16 v35 = 2112;
            objc_super v36 = v13;
            _os_log_impl( &dword_18895A000,  v24,  OS_LOG_TYPE_DEBUG,  "cached statement with injections\nsql:  %@\nstmt: %@",  buf,  0x16u);
          }
        }

        cache_release_value(a5, v13);
      }

      size_t v25 = v13;
    }

    if (v25->_inUse)
    {
      while (1)
      {
        next = v25->_next;
        if (!next) {
          break;
        }
        v19 = next;

        size_t v25 = v19;
        if (!v19->_inUse) {
          goto LABEL_36;
        }
      }

      int v28 = -[PQLStatement initWithStatement:forDB:preparationTime:]( objc_alloc(&OBJC_CLASS___PQLStatement),  "initWithStatement:forDB:preparationTime:",  v25,  v11,  a6);
      uint64_t v29 = v25->_next;
      v25->_next = v28;

      v19 = v28;
    }

    else
    {
      v19 = v25;
    }

- (void)bindFromArray:(id)a3 db:(id)a4
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!self->_stmt)
  {
    [MEMORY[0x1896077D8] currentHandler];
    char v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v33 handleFailureInMethod:a2 object:self file:@"PQLStatement.m" lineNumber:705 description:@"cannot bind a closed statement"];
  }

  if (self->_inUse)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v34 handleFailureInMethod:a2 object:self file:@"PQLStatement.m" lineNumber:706 description:@"cannot bind a statement in use"];
  }

  p_specUnion = &self->_specUnion;
  if (self->_specLength >= 9) {
    p_specUnion = ($B640FA5AF0A9E956D46B4BA9A7C3BCE7 *)p_specUnion->ptr;
  }
  self->_inUse = 1;
  else {
    size_t v10 = 0LL;
  }
  if (self->_specLength >= 1)
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 1LL;
    do
    {
      switch(p_specUnion->inlined[v11])
      {
        case 0u:
          if (v10)
          {
            if ([v10 length]) {
              size_t v13 = @", %s";
            }
            else {
              size_t v13 = @"%s";
            }
            objc_msgSend(v10, "appendFormat:", v13, "INT");
          }

          stmt = self->_stmt;
          [v7 objectAtIndexedSubscript:v11];
          id v15 = (id)objc_claimAutoreleasedReturnValue();
          sqlite3_bind_int(stmt, v12, [v15 intValue]);
          goto LABEL_56;
        case 1u:
          if (v10)
          {
            if ([v10 length]) {
              uint64_t v23 = @", %s";
            }
            else {
              uint64_t v23 = @"%s";
            }
            objc_msgSend(v10, "appendFormat:", v23, "UINT");
          }

          char v24 = self->_stmt;
          [v7 objectAtIndexedSubscript:v11];
          id v15 = (id)objc_claimAutoreleasedReturnValue();
          sqlite3_int64 v25 = [v15 unsignedIntValue];
          goto LABEL_43;
        case 2u:
          if (v10)
          {
            if ([v10 length]) {
              uint64_t v26 = @", %s";
            }
            else {
              uint64_t v26 = @"%s";
            }
            objc_msgSend(v10, "appendFormat:", v26, "INT64");
          }

          char v24 = self->_stmt;
          [v7 objectAtIndexedSubscript:v11];
          id v15 = (id)objc_claimAutoreleasedReturnValue();
          sqlite3_int64 v25 = [v15 longLongValue];
LABEL_43:
          sqlite3_bind_int64(v24, v12, v25);
          goto LABEL_56;
        case 3u:
          if (v10)
          {
            if ([v10 length]) {
              int v27 = @", %s";
            }
            else {
              int v27 = @"%s";
            }
            objc_msgSend(v10, "appendFormat:", v27, "DOUBLE");
          }

          int v28 = self->_stmt;
          [v7 objectAtIndexedSubscript:v11];
          id v15 = (id)objc_claimAutoreleasedReturnValue();
          [v15 doubleValue];
          sqlite3_bind_double(v28, v12, v29);
          goto LABEL_56;
        case 4u:
          if (v10)
          {
            if ([v10 length]) {
              sqlite3_int64 v16 = @", %s";
            }
            else {
              sqlite3_int64 v16 = @"%s";
            }
            objc_msgSend(v10, "appendFormat:", v16, "TEXT");
          }

          objc_super v17 = self->_stmt;
          id v15 = [v7 objectAtIndexedSubscript:v11];
          sqlite3_bind_text( v17,  v12,  (const char *)[v15 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          goto LABEL_56;
        case 5u:
        case 6u:
        case 8u:
          abort();
        case 7u:
          if (v10)
          {
            uint64_t v18 = [v10 length];
            uint64_t v19 = [v7 objectAtIndexedSubscript:v11];
            id v20 = (void *)v19;
            if (v18) {
              int v21 = @", %s(%@)";
            }
            else {
              int v21 = @"%s(%@)";
            }
            objc_msgSend(v10, "appendFormat:", v21, "OBJECT", v19);
          }

          int v22 = self->_stmt;
          [v7 objectAtIndexedSubscript:v11];
          id v15 = (id)objc_claimAutoreleasedReturnValue();
          pql_bind_object(v22, v12, v15);
          goto LABEL_56;
        case 9u:
          if (v10)
          {
            if ([v10 length]) {
              uint64_t v30 = @", %s";
            }
            else {
              uint64_t v30 = @"%s";
            }
            objc_msgSend(v10, "appendFormat:", v30, "BLOCK");
          }

          [v7 objectAtIndexedSubscript:v11];
          char v31 = (void *)objc_claimAutoreleasedReturnValue();
          id v15 = (id)[v31 copy];

          -[PQLStatement keepBindAlive:](self, "keepBindAlive:", v15);
          pql_sqlite3_bind_pointer(self->_stmt, v12, (sqlite3_int64)v15);
LABEL_56:
          uint64_t v12 = (v12 + 1);

          break;
        default:
          break;
      }

      ++v11;
    }

    while (v11 < self->_specLength);
  }

  if (v10)
  {
    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
    }
    objc_super v32 = (os_log_s *)pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      objc_super v36 = self;
      __int16 v37 = 2112;
      v38 = v10;
      _os_log_impl( &dword_18895A000,  v32,  OS_LOG_TYPE_DEBUG,  "binding values to statement\nstmt: %@\nbinding: [%@]",  buf,  0x16u);
    }
  }
}

@end