@interface PQLConnection
+ (id)cplInjectionFor:(id)a3 isInIndexSet:(id)a4;
+ (id)cplInjectionFor:(id)a3 isNotInIndexSet:(id)a4;
- (BOOL)cplExecute:(id)a3;
- (BOOL)cplRegisterDeterministicFunction:(id)a3 nArgs:(int)a4 handler:(id)a5;
- (BOOL)cplRegisterIndexSetMatch;
- (id)cplFetch:(id)a3;
- (id)cplFetchObject:(id)a3 sql:(id)a4;
- (id)cplFetchObjectOfClass:(Class)a3 initializer:(SEL)a4 sql:(id)a5;
- (id)cplFetchObjectOfClass:(Class)a3 sql:(id)a4;
- (id)lastCPLError;
@end

@implementation PQLConnection

- (id)lastCPLError
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PQLConnection lastError](self, "lastError"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 domain]);
  unsigned int v4 = [v3 isEqualToString:PQLSqliteErrorDomain];

  if (v4 && [v2 code] == 11) {
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:underlyingError:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:underlyingError:description:",  3LL,  v2,  @"Library database is corrupted"));
  }
  else {
    id v5 = v2;
  }
  v6 = v5;

  return v6;
}

- (BOOL)cplExecute:(id)a3
{
  return -[PQLConnection execute:args:](self, "execute:args:", a3, &v4);
}

- (id)cplFetch:(id)a3
{
  return -[PQLConnection fetch:args:](self, "fetch:args:", a3, &v4);
}

- (id)cplFetchObjectOfClass:(Class)a3 initializer:(SEL)a4 sql:(id)a5
{
  return -[PQLConnection fetchObjectOfClass:initializer:sql:args:]( self,  "fetchObjectOfClass:initializer:sql:args:",  a3,  a4,  a5,  &v6);
}

- (id)cplFetchObjectOfClass:(Class)a3 sql:(id)a4
{
  return -[PQLConnection fetchObjectOfClass:sql:args:](self, "fetchObjectOfClass:sql:args:", a3, a4, &v5);
}

- (id)cplFetchObject:(id)a3 sql:(id)a4
{
  return -[PQLConnection fetchObject:sql:args:](self, "fetchObject:sql:args:", a3, a4, &v5);
}

- (BOOL)cplRegisterDeterministicFunction:(id)a3 nArgs:(int)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (sqlite3 *)-[PQLConnection dbHandle](self, "dbHandle");
  id v11 = v9;
  v12 = (const char *)[v11 UTF8String];

  id v13 = [v8 copy];
  id v14 = v13;
  int function_v2 = sqlite3_create_function_v2( v10,  v12,  a4,  2053,  v14,  (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_100168B34,  0LL,  0LL,  (void (__cdecl *)(void *))j__CFRelease);

  if (function_v2)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorForDB:]( &OBJC_CLASS___NSError,  "errorForDB:",  -[PQLConnection dbHandle](self, "dbHandle")));
    -[PQLConnection setLastError:](self, "setLastError:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PQLConnection sqliteErrorHandler](self, "sqliteErrorHandler"));
    if (v17)
    {
      v18 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue( -[PQLConnection sqliteErrorHandler]( self,  "sqliteErrorHandler"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PQLConnection lastError](self, "lastError"));
      ((void (**)(void, PQLConnection *, void, void *))v18)[2](v18, self, 0LL, v19);
    }
  }

  return function_v2 == 0;
}

- (BOOL)cplRegisterIndexSetMatch
{
  return -[PQLConnection cplRegisterDeterministicFunction:nArgs:handler:]( self,  "cplRegisterDeterministicFunction:nArgs:handler:",  @"is_in_indexset",  2LL,  &stru_100247998);
}

+ (id)cplInjectionFor:(id)a3 isInIndexSet:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[_CPLIsInIndexSetInject initWithInjection:indexSet:exclude:]( objc_alloc(&OBJC_CLASS____CPLIsInIndexSetInject),  "initWithInjection:indexSet:exclude:",  v6,  v5,  0LL);

  return v7;
}

+ (id)cplInjectionFor:(id)a3 isNotInIndexSet:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[_CPLIsInIndexSetInject initWithInjection:indexSet:exclude:]( objc_alloc(&OBJC_CLASS____CPLIsInIndexSetInject),  "initWithInjection:indexSet:exclude:",  v6,  v5,  1LL);

  return v7;
}

@end