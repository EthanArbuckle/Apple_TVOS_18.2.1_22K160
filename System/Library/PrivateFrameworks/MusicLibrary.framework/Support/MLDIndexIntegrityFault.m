@interface MLDIndexIntegrityFault
- (BOOL)attemptRecoveryUsingHandle:(sqlite3 *)a3 withError:(id *)a4;
- (MLDIndexIntegrityFault)initWithIndex:(id)a3;
- (NSString)indexName;
- (id)_createErrorWithDescription:(id)a3;
@end

@implementation MLDIndexIntegrityFault

- (MLDIndexIntegrityFault)initWithIndex:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MLDIndexIntegrityFault;
  v5 = -[MLDIndexIntegrityFault init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    indexName = v5->_indexName;
    v5->_indexName = v6;
  }

  return v5;
}

- (BOOL)attemptRecoveryUsingHandle:(sqlite3 *)a3 withError:(id *)a4
{
  v7 = os_log_create("com.apple.amp.medialibraryd", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    indexName = self->_indexName;
    *(_DWORD *)buf = 138543362;
    v27 = indexName;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MLDDatabaseIntegrityFault] Attempting to repair index %{public}@",  buf,  0xCu);
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[ML3MusicLibrary indexSchemaSQL](&OBJC_CLASS___ML3MusicLibrary, "indexSchemaSQL"));
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (!v10) {
    goto LABEL_11;
  }
  id v11 = v10;
  uint64_t v12 = *(void *)v23;
  while (2)
  {
    for (i = 0LL; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v23 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
      if ([v14 containsString:self->_indexName])
      {
        id v15 = v14;

        if (!v15) {
          goto LABEL_15;
        }
        id v16 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"DROP INDEX %@", self->_indexName));
        if (sqlite3_exec(a3, (const char *)[v16 UTF8String], 0, 0, 0))
        {
          v17 = @"failed to drop bad index";
        }

        else if (sqlite3_exec(a3, (const char *)[v15 UTF8String], 0, 0, 0))
        {
          v17 = @"failed to rebuild index";
        }

        else
        {
          if (!sqlite3_exec(a3, "ANALYZE", 0LL, 0LL, 0LL))
          {
            v18 = 0LL;
            goto LABEL_21;
          }

          v17 = @"failed to optimize newly created index";
        }

        v18 = (void *)objc_claimAutoreleasedReturnValue( -[MLDIndexIntegrityFault _createErrorWithDescription:]( self,  "_createErrorWithDescription:",  v17));
LABEL_21:

        goto LABEL_22;
      }
    }

    id v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v11) {
      continue;
    }
    break;
  }

- (id)_createErrorWithDescription:(id)a3
{
  id v4 = a3;
  v6 = (objc_class *)objc_opt_class(self, v5);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
  id v13 = v4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v8,  -1LL,  v9));

  return v10;
}

- (NSString)indexName
{
  return self->_indexName;
}

- (void).cxx_destruct
{
}

@end