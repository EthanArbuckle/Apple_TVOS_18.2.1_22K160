@interface _bmFMDatabase
+ (BOOL)isSQLiteThreadSafe;
+ (_bmFMDatabase)databaseWithPath:(id)a3;
+ (_bmFMDatabase)databaseWithURL:(id)a3;
+ (id)FMDBUserVersion;
+ (id)sqliteLibVersion;
+ (id)storeableDateFormat:(id)a3;
+ (int)FMDBVersion;
- (BOOL)BOOLForQuery:(id)a3;
- (BOOL)DELETE_FROM:(id)a3 WHERE:(id)a4;
- (BOOL)INSERT_INTO:(id)a3 VALUES:(id)a4;
- (BOOL)UPDATE:(id)a3 SET:(id)a4 WHERE:(id)a5;
- (BOOL)beginDeferredTransaction;
- (BOOL)beginExclusiveTransaction;
- (BOOL)beginImmediateTransaction;
- (BOOL)beginTransaction;
- (BOOL)bindStatement:(sqlite3_stmt *)a3 WithArgumentsInArray:(id)a4 orDictionary:(id)a5 orVAList:(char *)a6;
- (BOOL)checkedOut;
- (BOOL)checkpoint:(int)a3 error:(id *)a4;
- (BOOL)checkpoint:(int)a3 name:(id)a4 error:(id *)a5;
- (BOOL)checkpoint:(int)a3 name:(id)a4 logFrameCount:(int *)a5 checkpointCount:(int *)a6 error:(id *)a7;
- (BOOL)close;
- (BOOL)columnExists:(id)a3 columnName:(id)a4;
- (BOOL)columnExists:(id)a3 inTableWithName:(id)a4;
- (BOOL)commit;
- (BOOL)crashOnErrors;
- (BOOL)databaseExists;
- (BOOL)executeStatements:(id)a3;
- (BOOL)executeStatements:(id)a3 withResultBlock:(id)a4;
- (BOOL)executeUpdate:(id)a3;
- (BOOL)executeUpdate:(id)a3 error:(id *)a4 withArgumentsInArray:(id)a5 orDictionary:(id)a6 orVAList:(char *)a7;
- (BOOL)executeUpdate:(id)a3 values:(id)a4 error:(id *)a5;
- (BOOL)executeUpdate:(id)a3 withArgumentsInArray:(id)a4;
- (BOOL)executeUpdate:(id)a3 withErrorAndBindings:(id *)a4;
- (BOOL)executeUpdate:(id)a3 withParameterDictionary:(id)a4;
- (BOOL)executeUpdate:(id)a3 withVAList:(char *)a4;
- (BOOL)executeUpdateWithFormat:(id)a3;
- (BOOL)goodConnection;
- (BOOL)hadError;
- (BOOL)hasDateFormatter;
- (BOOL)hasOpenResultSets;
- (BOOL)inTransaction;
- (BOOL)interrupt;
- (BOOL)isInTransaction;
- (BOOL)isOpen;
- (BOOL)logsErrors;
- (BOOL)open;
- (BOOL)openWithFlags:(int)a3;
- (BOOL)openWithFlags:(int)a3 vfs:(id)a4;
- (BOOL)rekey:(id)a3;
- (BOOL)rekeyWithData:(id)a3;
- (BOOL)releaseSavePointWithName:(id)a3 error:(id *)a4;
- (BOOL)rollback;
- (BOOL)rollbackToSavePointWithName:(id)a3 error:(id *)a4;
- (BOOL)setKey:(id)a3;
- (BOOL)setKeyWithData:(id)a3;
- (BOOL)shouldCacheStatements;
- (BOOL)startSavePointWithName:(id)a3 error:(id *)a4;
- (BOOL)tableExists:(id)a3;
- (BOOL)traceExecution;
- (BOOL)update:(id)a3 withErrorAndBindings:(id *)a4;
- (BOOL)validateSQL:(id)a3 error:(id *)a4;
- (NSMutableDictionary)cachedStatements;
- (NSString)databasePath;
- (NSURL)databaseURL;
- (_bmFMDatabase)init;
- (_bmFMDatabase)initWithPath:(id)a3;
- (_bmFMDatabase)initWithURL:(id)a3;
- (const)sqlitePath;
- (double)doubleForQuery:(id)a3;
- (double)maxBusyRetryTimeInterval;
- (double)valueDouble:(void *)a3;
- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 JOIN:(id)a5 WHERE:(id)a6 GROUP_BY:(id)a7 HAVING:(id)a8 ORDER_BY:(id)a9 LIMIT:(id)a10;
- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 JOIN:(id)a5 WHERE:(id)a6 ORDER_BY:(id)a7 LIMIT:(id)a8;
- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 WHERE:(id)a5;
- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 WHERE:(id)a5 GROUP_BY:(id)a6;
- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 WHERE:(id)a5 ORDER_BY:(id)a6 LIMIT:(id)a7;
- (id)_SELECT_FROM:(id)a3 COLUMNS:(id)a4 JOIN:(id)a5 WHERE:(id)a6 GROUP_BY:(id)a7 ORDER_BY:(id)a8 LIMIT:(id)a9;
- (id)cachedStatementForQuery:(id)a3;
- (id)dataForQuery:(id)a3;
- (id)dateForQuery:(id)a3;
- (id)dateFromString:(id)a3;
- (id)errorWithMessage:(id)a3;
- (id)executeQuery:(id)a3;
- (id)executeQuery:(id)a3 values:(id)a4 error:(id *)a5;
- (id)executeQuery:(id)a3 withArgumentsInArray:(id)a4;
- (id)executeQuery:(id)a3 withArgumentsInArray:(id)a4 orDictionary:(id)a5 orVAList:(char *)a6 shouldBind:(BOOL)a7;
- (id)executeQuery:(id)a3 withParameterDictionary:(id)a4;
- (id)executeQuery:(id)a3 withVAList:(char *)a4;
- (id)executeQueryWithFormat:(id)a3;
- (id)getSchema;
- (id)getTableSchema:(id)a3;
- (id)inSavePoint:(id)a3;
- (id)lastError;
- (id)lastErrorMessage;
- (id)prepare:(id)a3;
- (id)stringForQuery:(id)a3;
- (id)stringFromDate:(id)a3;
- (id)valueData:(void *)a3;
- (id)valueString:(void *)a3;
- (int)bindObject:(id)a3 toColumn:(int)a4 inStatement:(sqlite3_stmt *)a5;
- (int)busyRetryTimeout;
- (int)changes;
- (int)intForQuery:(id)a3;
- (int)lastErrorCode;
- (int)lastExtendedErrorCode;
- (int)limitFor:(int)a3 value:(int)a4;
- (int)valueInt:(void *)a3;
- (int)valueType:(void *)a3;
- (int64_t)lastInsertRowId;
- (int64_t)longForQuery:(id)a3;
- (int64_t)valueLong:(void *)a3;
- (unsigned)applicationID;
- (unsigned)userVersion;
- (void)clearCachedStatements;
- (void)closeOpenResultSets;
- (void)dealloc;
- (void)extractSQL:(id)a3 argumentsList:(char *)a4 intoString:(id)a5 arguments:(id)a6;
- (void)makeFunctionNamed:(id)a3 arguments:(int)a4 block:(id)a5;
- (void)makeFunctionNamed:(id)a3 maximumArguments:(int)a4 withBlock:(id)a5;
- (void)resultData:(id)a3 context:(void *)a4;
- (void)resultDouble:(double)a3 context:(void *)a4;
- (void)resultError:(id)a3 context:(void *)a4;
- (void)resultErrorCode:(int)a3 context:(void *)a4;
- (void)resultErrorNoMemoryInContext:(void *)a3;
- (void)resultErrorTooBigInContext:(void *)a3;
- (void)resultInt:(int)a3 context:(void *)a4;
- (void)resultLong:(int64_t)a3 context:(void *)a4;
- (void)resultNullInContext:(void *)a3;
- (void)resultSetDidClose:(id)a3;
- (void)resultString:(id)a3 context:(void *)a4;
- (void)setApplicationID:(unsigned int)a3;
- (void)setBusyRetryTimeout:(int)a3;
- (void)setCachedStatement:(id)a3 forQuery:(id)a4;
- (void)setCachedStatements:(id)a3;
- (void)setCheckedOut:(BOOL)a3;
- (void)setCrashOnErrors:(BOOL)a3;
- (void)setDateFormat:(id)a3;
- (void)setIsOpen:(BOOL)a3;
- (void)setLogsErrors:(BOOL)a3;
- (void)setMaxBusyRetryTimeInterval:(double)a3;
- (void)setShouldCacheStatements:(BOOL)a3;
- (void)setShouldCacheStatementsWithoutClearingExistingStatements:(BOOL)a3;
- (void)setTraceExecution:(BOOL)a3;
- (void)setUserVersion:(unsigned int)a3;
- (void)sqliteHandle;
- (void)warnInUse;
@end

@implementation _bmFMDatabase

- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 WHERE:(id)a5
{
  return -[_bmFMDatabase _SELECT_FROM:COLUMNS:JOIN:WHERE:GROUP_BY:ORDER_BY:LIMIT:]( self,  "_SELECT_FROM:COLUMNS:JOIN:WHERE:GROUP_BY:ORDER_BY:LIMIT:",  a3,  a4,  0LL,  a5,  0LL,  0LL,  0LL);
}

- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 WHERE:(id)a5 ORDER_BY:(id)a6 LIMIT:(id)a7
{
  return -[_bmFMDatabase _SELECT_FROM:COLUMNS:JOIN:WHERE:GROUP_BY:ORDER_BY:LIMIT:]( self,  "_SELECT_FROM:COLUMNS:JOIN:WHERE:GROUP_BY:ORDER_BY:LIMIT:",  a3,  a4,  0LL,  a5,  0LL,  a6,  a7);
}

- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 JOIN:(id)a5 WHERE:(id)a6 ORDER_BY:(id)a7 LIMIT:(id)a8
{
  return -[_bmFMDatabase _SELECT_FROM:COLUMNS:JOIN:WHERE:GROUP_BY:ORDER_BY:LIMIT:]( self,  "_SELECT_FROM:COLUMNS:JOIN:WHERE:GROUP_BY:ORDER_BY:LIMIT:",  a3,  a4,  a5,  a6,  0LL,  a7,  a8);
}

- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 WHERE:(id)a5 GROUP_BY:(id)a6
{
  return -[_bmFMDatabase _SELECT_FROM:COLUMNS:JOIN:WHERE:GROUP_BY:ORDER_BY:LIMIT:]( self,  "_SELECT_FROM:COLUMNS:JOIN:WHERE:GROUP_BY:ORDER_BY:LIMIT:",  a3,  a4,  0LL,  a5,  a6,  0LL,  0LL);
}

- (id)_SELECT_FROM:(id)a3 COLUMNS:(id)a4 JOIN:(id)a5 WHERE:(id)a6 GROUP_BY:(id)a7 ORDER_BY:(id)a8 LIMIT:(id)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v42 = a9;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "componentsJoinedByString:", @", "));
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"SELECT %@ FROM %@",  v20,  v15));

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v22 = v16;
  id v23 = [v22 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v44;
    do
    {
      for (i = 0LL; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v44 != v25) {
          objc_enumerationMutation(v22);
        }
        [v21 appendString:*(void *)(*((void *)&v43 + 1) + 8 * (void)i)];
      }

      id v24 = [v22 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }

    while (v24);
  }

  if (v17)
  {
    v41 = self;
    id v27 = v19;
    id v28 = v18;
    id v29 = v15;
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  (unint64_t)[v17 count] >> 1));
    [v21 appendString:@" WHERE "];
    id v31 = [v17 count];
    if (v31)
    {
      unint64_t v32 = (unint64_t)v31;
      for (unint64_t j = 0LL; j < v32; j += 2LL)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:j]);
        [v21 appendString:v34];

        v35 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:j + 1]);
        [v30 addObject:v35];
      }
    }

    id v15 = v29;
    id v18 = v28;
    id v19 = v27;
    self = v41;
  }

  else
  {
    v30 = 0LL;
  }

  if ([v18 count])
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "componentsJoinedByString:", @", "));
    [v21 appendFormat:@" GROUP BY %@", v36];
  }

  if ([v19 count])
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "componentsJoinedByString:", @", "));
    [v21 appendFormat:@" ORDER BY %@", v37];
  }

  [v21 appendString:@";"];
  if (v30) {
    uint64_t v38 = objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:withArgumentsInArray:](self, "executeQuery:withArgumentsInArray:", v21, v30));
  }
  else {
    uint64_t v38 = objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self, "executeQuery:", v21));
  }
  v39 = (void *)v38;

  return v39;
}

- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 JOIN:(id)a5 WHERE:(id)a6 GROUP_BY:(id)a7 HAVING:(id)a8 ORDER_BY:(id)a9 LIMIT:(id)a10
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v47 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "componentsJoinedByString:", @", "));
  __int128 v46 = v15;
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"SELECT %@ FROM %@",  v21,  v15));

  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v23 = v16;
  id v24 = [v23 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v49;
    do
    {
      for (i = 0LL; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v49 != v26) {
          objc_enumerationMutation(v23);
        }
        [v22 appendString:*(void *)(*((void *)&v48 + 1) + 8 * (void)i)];
      }

      id v25 = [v23 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }

    while (v25);
  }

  if (v17)
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  (unint64_t)[v17 count] >> 1));
    [v22 appendString:@" WHERE "];
    id v29 = [v17 count];
    if (v29)
    {
      unint64_t v30 = (unint64_t)v29;
      for (unint64_t j = 0LL; j < v30; j += 2LL)
      {
        unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:j]);
        [v22 appendString:v32];

        v33 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:j + 1]);
        [v28 addObject:v33];
      }
    }
  }

  else
  {
    id v28 = 0LL;
  }

  v34 = v47;
  if ([v47 count])
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "componentsJoinedByString:", @", "));
    [v22 appendFormat:@" GROUP BY %@", v35];
  }

  if (v18)
  {
    if (!v28) {
      id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  (unint64_t)[v17 count] >> 1));
    }
    [v22 appendString:@" HAVING "];
    id v36 = [v18 count];
    if (v36)
    {
      unint64_t v37 = (unint64_t)v36;
      for (unint64_t k = 0LL; k < v37; k += 2LL)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue([v18 objectAtIndexedSubscript:k]);
        [v22 appendString:v39];

        v40 = (void *)objc_claimAutoreleasedReturnValue([v18 objectAtIndexedSubscript:k + 1]);
        [v28 addObject:v40];
      }

      v34 = v47;
    }
  }

  if ([v19 count])
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "componentsJoinedByString:", @", "));
    [v22 appendFormat:@" ORDER BY %@", v41];
  }

  [v22 appendString:@";"];
  if (v28) {
    uint64_t v42 = objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:withArgumentsInArray:](self, "executeQuery:withArgumentsInArray:", v22, v28));
  }
  else {
    uint64_t v42 = objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self, "executeQuery:", v22));
  }
  __int128 v43 = (void *)v42;

  return v43;
}

- (BOOL)UPDATE:(id)a3 SET:(id)a4 WHERE:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"UPDATE OR FAIL %@ SET ",  a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  (char *)[v7 count] + ((unint64_t)objc_msgSend(v8, "count") >> 1)));
  id v27 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
  v12 = (char *)[v11 count];
  if (v12)
  {
    v13 = v12;
    v14 = 0LL;
    id v15 = v12 - 1;
    do
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:v14]);
      [v9 appendString:v16];
      if (([v16 containsString:@"?"] & 1) == 0)
      {
        if (v14 >= v15) {
          id v17 = @" = ?";
        }
        else {
          id v17 = @" = ?, ";
        }
        [v9 appendString:v17];
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v16]);
      [v10 addObject:v18];

      ++v14;
    }

    while (v13 != v14);
  }

  [v9 appendString:@" WHERE "];
  id v19 = [v8 count];
  if (v19)
  {
    unint64_t v20 = (unint64_t)v19;
    for (unint64_t i = 0LL; i < v20; i += 2LL)
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:i]);
      [v9 appendString:v22];

      id v23 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:i + 1]);
      [v10 addObject:v23];
    }
  }

  [v9 appendString:@";"];
  BOOL v24 = -[_bmFMDatabase executeUpdate:withArgumentsInArray:](self, "executeUpdate:withArgumentsInArray:", v9, v10);

  return v24;
}

- (BOOL)INSERT_INTO:(id)a3 VALUES:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"INSERT INTO %@",  a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));
  objc_msgSend(v6, "appendString:", @"(");
  id v8 = (char *)[v5 count];
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v9 = v5;
  v10 = (char *)[v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    v11 = v10;
    v12 = 0LL;
    uint64_t v13 = *(void *)v25;
    do
    {
      v14 = 0LL;
      id v23 = v12;
      id v15 = v12 + 1;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v14);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v16]);
        [v7 addObject:v17];

        [v6 appendString:v16];
        if (&v14[(void)v15] < v8) {
          [v6 appendString:@","];
        }
        ++v14;
      }

      while (v11 != v14);
      v12 = &v11[(void)v23];
      v11 = (char *)[v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v11);
  }

  [v6 appendString:@" VALUES (")];
  if (v8)
  {
    for (unint64_t i = 0LL; (char *)i != v8; ++i)
    {
      else {
        id v19 = @"?,";
      }
      [v6 appendString:v19];
    }
  }

  [v6 appendString:@";"]);
  BOOL v20 = -[_bmFMDatabase executeUpdate:withArgumentsInArray:](self, "executeUpdate:withArgumentsInArray:", v6, v7);

  return v20;
}

- (BOOL)DELETE_FROM:(id)a3 WHERE:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"DELETE FROM %@",  a3));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  (unint64_t)[v6 count] >> 1));
  [v7 appendString:@" WHERE "];
  id v9 = [v6 count];
  if (v9)
  {
    unint64_t v10 = (unint64_t)v9;
    for (unint64_t i = 0LL; i < v10; i += 2LL)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:i]);
      [v7 appendString:v12];

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:i + 1]);
      [v8 addObject:v13];
    }
  }

  [v7 appendString:@";"];
  BOOL v14 = -[_bmFMDatabase executeUpdate:withArgumentsInArray:](self, "executeUpdate:withArgumentsInArray:", v7, v8);

  return v14;
}

- (void)setShouldCacheStatementsWithoutClearingExistingStatements:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase cachedStatements](self, "cachedStatements"));
  -[_bmFMDatabase setShouldCacheStatements:](self, "setShouldCacheStatements:", v3);
  if (!v3) {
    -[_bmFMDatabase setCachedStatements:](self, "setCachedStatements:", v5);
  }
}

+ (_bmFMDatabase)databaseWithPath:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithPath:v4];

  return (_bmFMDatabase *)v5;
}

+ (_bmFMDatabase)databaseWithURL:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithURL:v4];

  return (_bmFMDatabase *)v5;
}

- (_bmFMDatabase)init
{
  return -[_bmFMDatabase initWithPath:](self, "initWithPath:", 0LL);
}

- (_bmFMDatabase)initWithURL:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 path]);
  id v5 = -[_bmFMDatabase initWithPath:](self, "initWithPath:", v4);

  return v5;
}

- (_bmFMDatabase)initWithPath:(id)a3
{
  id v4 = a3;
  if (!sqlite3_threadsafe()) {
    sub_10003C940();
  }
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____bmFMDatabase;
  id v5 = -[_bmFMDatabase init](&v11, "init");
  if (v5)
  {
    id v6 = [v4 copy];
    id v7 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v6;

    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v9 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v8;

    *((void *)v5 + 1) = 0LL;
    *(_WORD *)(v5 + 59) = 256;
    *((void *)v5 + 8) = 0x4000000000000000LL;
    v5[61] = 0;
  }

  return (_bmFMDatabase *)v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____bmFMDatabase;
  -[_bmFMDatabase dealloc](&v3, "dealloc");
}

- (NSURL)databaseURL
{
  if (self->_databasePath) {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:"));
  }
  else {
    v2 = 0LL;
  }
  return (NSURL *)v2;
}

+ (id)FMDBUserVersion
{
  return @"2.7.7";
}

+ (int)FMDBVersion
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003995C;
  block[3] = &unk_100069A10;
  block[4] = a1;
  if (qword_10007C390 != -1) {
    dispatch_once(&qword_10007C390, block);
  }
  return dword_10007C398;
}

+ (id)sqliteLibVersion
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%s",  sqlite3_libversion());
}

+ (BOOL)isSQLiteThreadSafe
{
  return sqlite3_threadsafe() != 0;
}

- (void)sqliteHandle
{
  return self->_db;
}

- (const)sqlitePath
{
  databasePath = self->_databasePath;
  if (!databasePath) {
    return ":memory:";
  }
  if (-[NSString length](databasePath, "length")) {
    return -[NSString fileSystemRepresentation](self->_databasePath, "fileSystemRepresentation");
  }
  return "";
}

- (int)limitFor:(int)a3 value:(int)a4
{
  return sqlite3_limit((sqlite3 *)self->_db, a3, a4);
}

- (BOOL)open
{
  if (self->_isOpen) {
    return 1;
  }
  p_db = &self->_db;
  if (self->_db) {
    -[_bmFMDatabase close](self, "close");
  }
  uint64_t v5 = sqlite3_open(-[_bmFMDatabase sqlitePath](self, "sqlitePath"), (sqlite3 **)p_db);
  if ((_DWORD)v5)
  {
    NSLog(@"error opening!: %d", v5);
    return 0;
  }

  else
  {
    if (self->_maxBusyRetryTimeInterval > 0.0) {
      -[_bmFMDatabase setMaxBusyRetryTimeInterval:](self, "setMaxBusyRetryTimeInterval:");
    }
    BOOL result = 1;
    self->_isOpen = 1;
  }

  return result;
}

- (BOOL)openWithFlags:(int)a3
{
  return -[_bmFMDatabase openWithFlags:vfs:](self, "openWithFlags:vfs:", *(void *)&a3, 0LL);
}

- (BOOL)openWithFlags:(int)a3 vfs:(id)a4
{
  id v6 = a4;
  if (self->_isOpen)
  {
    BOOL v7 = 1;
  }

  else
  {
    if (self->_db) {
      -[_bmFMDatabase close](self, "close");
    }
    uint64_t v8 = sqlite3_open_v2( -[_bmFMDatabase sqlitePath](self, "sqlitePath"), (sqlite3 **)&self->_db, a3, (const char *)[v6 UTF8String]);
    if ((_DWORD)v8)
    {
      NSLog(@"error opening!: %d", v8);
      BOOL v7 = 0;
    }

    else
    {
      if (self->_maxBusyRetryTimeInterval > 0.0) {
        -[_bmFMDatabase setMaxBusyRetryTimeInterval:](self, "setMaxBusyRetryTimeInterval:");
      }
      BOOL v7 = 1;
      self->_isOpen = 1;
    }
  }

  return v7;
}

- (BOOL)close
{
  db = (sqlite3 *)self->_db;
  if (db)
  {
    uint64_t v4 = sqlite3_close(db);
    stmt = sqlite3_next_stmt((sqlite3 *)self->_db, 0LL);
    if (stmt)
    {
      id v6 = stmt;
      do
      {
        NSLog(@"Closing leaked statement");
        sqlite3_finalize(v6);
        id v6 = sqlite3_next_stmt((sqlite3 *)self->_db, 0LL);
      }

      while (v6);
      uint64_t v4 = sqlite3_close((sqlite3 *)self->_db);
      if ((v4 - 5) > 1)
      {
LABEL_7:
        if ((_DWORD)v4) {
          NSLog(@"error closing!: %d", v4);
        }
      }
    }

    self->_db = 0LL;
    self->_isOpen = 0;
  }

  return 1;
}

- (void)setMaxBusyRetryTimeInterval:(double)a3
{
  objc_super v3 = self;
  self->_maxBusyRetryTimeInterval = a3;
  db = (sqlite3 *)self->_db;
  if (db)
  {
    if (a3 <= 0.0)
    {
      uint64_t v5 = 0LL;
      objc_super v3 = 0LL;
    }

    else
    {
      uint64_t v5 = (int (__cdecl *)(void *, int))sub_100039DCC;
    }

    sqlite3_busy_handler(db, v5, v3);
  }

- (double)maxBusyRetryTimeInterval
{
  return self->_maxBusyRetryTimeInterval;
}

- (int)busyRetryTimeout
{
  return -1;
}

- (void)setBusyRetryTimeout:(int)a3
{
}

- (BOOL)hasOpenResultSets
{
  return -[NSMutableSet count](self->_openResultSets, "count") != 0LL;
}

- (void)closeOpenResultSets
{
  id v3 = -[NSMutableSet copy](self->_openResultSets, "copy");
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (unint64_t i = 0LL; i != v6; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pointerValue", (void)v11));
        [v10 setParentDB:0];
        [v10 close];
        -[NSMutableSet removeObject:](self->_openResultSets, "removeObject:", v9);
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }
}

- (void)resultSetDidClose:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSValue valueWithNonretainedObject:](&OBJC_CLASS___NSValue, "valueWithNonretainedObject:", a3));
  -[NSMutableSet removeObject:](self->_openResultSets, "removeObject:", v4);
}

- (void)clearCachedStatements
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectEnumerator](self->_cachedStatements, "objectEnumerator"));
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v7);
        __int128 v14 = 0u;
        __int128 v15 = 0u;
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects", 0));
        id v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v15;
          do
          {
            __int128 v13 = 0LL;
            do
            {
              if (*(void *)v15 != v12) {
                objc_enumerationMutation(v9);
              }
              [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) close];
              __int128 v13 = (char *)v13 + 1;
            }

            while (v11 != v13);
            id v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
          }

          while (v11);
        }

        uint64_t v7 = (char *)v7 + 1;
      }

      while (v7 != v5);
      id v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }

    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_cachedStatements, "removeAllObjects");
}

- (id)cachedStatementForQuery:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_cachedStatements, "objectForKey:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectsPassingTest:&stru_100069A50]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 anyObject]);

  return v5;
}

- (void)setCachedStatement:(id)a3 forQuery:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = [v7 copy];

    [v12 setQuery:v9];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_cachedStatements, "objectForKey:", v9));
    if (!v10) {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    }
    [v10 addObject:v12];
    -[NSMutableDictionary setObject:forKey:](self->_cachedStatements, "setObject:forKey:", v10, v9);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2, self, @"FMDatabase.m", 411, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];

    NSLog(@"API misuse, -[_bmFMDatabase setCachedStatement:forQuery:] query must not be nil");
  }
}

- (BOOL)rekey:(id)a3
{
  id v4 = a3;
  id v5 = [v4 UTF8String];
  id v6 = v4;
  id v7 = (const char *)[v6 UTF8String];

  uint64_t v8 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v5, strlen(v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  LOBYTE(self) = -[_bmFMDatabase rekeyWithData:](self, "rekeyWithData:", v9);

  return (char)self;
}

- (BOOL)rekeyWithData:(id)a3
{
  return 0;
}

- (BOOL)setKey:(id)a3
{
  id v4 = a3;
  id v5 = [v4 UTF8String];
  id v6 = v4;
  id v7 = (const char *)[v6 UTF8String];

  uint64_t v8 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v5, strlen(v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  LOBYTE(self) = -[_bmFMDatabase setKeyWithData:](self, "setKeyWithData:", v9);

  return (char)self;
}

- (BOOL)setKeyWithData:(id)a3
{
  return 0;
}

+ (id)storeableDateFormat:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", v3);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](&OBJC_CLASS___NSTimeZone, "timeZoneForSecondsFromGMT:", 0LL));
  -[NSDateFormatter setTimeZone:](v4, "setTimeZone:", v5);

  id v6 = -[NSLocale initWithLocaleIdentifier:]( objc_alloc(&OBJC_CLASS___NSLocale),  "initWithLocaleIdentifier:",  @"en_US");
  -[NSDateFormatter setLocale:](v4, "setLocale:", v6);

  return v4;
}

- (BOOL)hasDateFormatter
{
  return self->_dateFormat != 0LL;
}

- (void)setDateFormat:(id)a3
{
}

- (id)dateFromString:(id)a3
{
  return -[NSDateFormatter dateFromString:](self->_dateFormat, "dateFromString:", a3);
}

- (id)stringFromDate:(id)a3
{
  return -[NSDateFormatter stringFromDate:](self->_dateFormat, "stringFromDate:", a3);
}

- (BOOL)goodConnection
{
  if (!self->_isOpen) {
    return 0;
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase executeQuery:]( self,  "executeQuery:",  @"select name from sqlite_master where type='table'"));
  id v3 = v2;
  BOOL v4 = v2 != 0LL;
  if (v2) {
    [v2 close];
  }

  return v4;
}

- (void)warnInUse
{
  if (self->_crashOnErrors) {
    sub_10003C968((uint64_t)a2, (uint64_t)self);
  }
}

- (BOOL)databaseExists
{
  BOOL isOpen = self->_isOpen;
  if (!self->_isOpen)
  {
    NSLog(@"The _bmFMDatabase %@ is not open.", self);
    if (self->_crashOnErrors) {
      sub_10003C9C4((uint64_t)a2, (uint64_t)self);
    }
  }

  return isOpen;
}

- (id)lastErrorMessage
{
  return +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  sqlite3_errmsg((sqlite3 *)self->_db));
}

- (BOOL)hadError
{
  return -[_bmFMDatabase lastErrorCode](self, "lastErrorCode") - 1 < 0x63;
}

- (int)lastErrorCode
{
  return sqlite3_errcode((sqlite3 *)self->_db);
}

- (int)lastExtendedErrorCode
{
  return sqlite3_extended_errcode((sqlite3 *)self->_db);
}

- (id)errorWithMessage:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  a3,  NSLocalizedDescriptionKey));
  id v5 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_bmFMDatabase",  sqlite3_errcode((sqlite3 *)self->_db),  v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)lastError
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase lastErrorMessage](self, "lastErrorMessage"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase errorWithMessage:](self, "errorWithMessage:", v3));

  return v4;
}

- (int64_t)lastInsertRowId
{
  if (self->_isExecutingStatement)
  {
    -[_bmFMDatabase warnInUse](self, "warnInUse");
    return 0LL;
  }

  else
  {
    self->_isExecutingStatement = 1;
    int64_t result = sqlite3_last_insert_rowid((sqlite3 *)self->_db);
    self->_isExecutingStatement = 0;
  }

  return result;
}

- (int)changes
{
  if (self->_isExecutingStatement)
  {
    -[_bmFMDatabase warnInUse](self, "warnInUse");
    return 0;
  }

  else
  {
    self->_isExecutingStatement = 1;
    int result = sqlite3_changes((sqlite3 *)self->_db);
    self->_isExecutingStatement = 0;
  }

  return result;
}

- (int)bindObject:(id)a3 toColumn:(int)a4 inStatement:(sqlite3_stmt *)a5
{
  id v8 = a3;
  if (v8)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));

    if (v9 != v8)
    {
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSData, v10);
      if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
      {
        id v13 = v8;
        __int128 v14 = (const char *)[v13 bytes];
        if (v14) {
          __int128 v15 = v14;
        }
        else {
          __int128 v15 = "";
        }
        int v16 = sqlite3_bind_blob( a5,  a4,  v15,  (int)[v13 length],  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        goto LABEL_9;
      }

      uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDate, v12);
      if ((objc_opt_isKindOfClass(v8, v19) & 1) != 0)
      {
        if (-[_bmFMDatabase hasDateFormatter](self, "hasDateFormatter"))
        {
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase stringFromDate:](self, "stringFromDate:", v8));
LABEL_33:
          id v38 = v21;
          int v17 = sqlite3_bind_text( a5,  a4,  (const char *)[v38 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

          goto LABEL_10;
        }

        [v8 timeIntervalSince1970];
        goto LABEL_30;
      }

      uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSNumber, v20);
      if ((objc_opt_isKindOfClass(v8, v22) & 1) == 0)
      {
        id v36 = v8;
        goto LABEL_32;
      }

      id v23 = v8;
      if (strcmp((const char *)[v23 objCType], "c"))
      {
        id v24 = v23;
        if (!strcmp((const char *)[v24 objCType], "C"))
        {
          int v39 = [v24 unsignedCharValue];
          goto LABEL_39;
        }

        id v25 = v24;
        if (!strcmp((const char *)[v25 objCType], "s"))
        {
          int v39 = [v25 shortValue];
          goto LABEL_39;
        }

        id v26 = v25;
        if (!strcmp((const char *)[v26 objCType], "S"))
        {
          int v39 = [v26 unsignedShortValue];
          goto LABEL_39;
        }

        id v27 = v26;
        if (!strcmp((const char *)[v27 objCType], "i"))
        {
          int v39 = [v27 intValue];
          goto LABEL_39;
        }

        id v28 = v27;
        if (!strcmp((const char *)[v28 objCType], "I"))
        {
          sqlite3_int64 v40 = [v28 unsignedIntValue];
        }

        else
        {
          id v29 = v28;
          if (!strcmp((const char *)[v29 objCType], "q"))
          {
            id v41 = [v29 longValue];
          }

          else
          {
            id v30 = v29;
            if (!strcmp((const char *)[v30 objCType], "Q"))
            {
              id v41 = [v30 unsignedLongValue];
            }

            else
            {
              id v31 = v30;
              if (!strcmp((const char *)[v31 objCType], "q"))
              {
                id v41 = [v31 longLongValue];
              }

              else
              {
                id v32 = v31;
                if (strcmp((const char *)[v32 objCType], "Q"))
                {
                  id v33 = v32;
                  if (!strcmp((const char *)[v33 objCType], "f"))
                  {
                    [v33 floatValue];
                    double v37 = v42;
                  }

                  else
                  {
                    id v34 = v33;
                    if (strcmp((const char *)[v34 objCType], "d"))
                    {
                      id v35 = v34;
                      if (strcmp((const char *)[v35 objCType], "B"))
                      {
                        id v36 = v35;
LABEL_32:
                        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v36 description]);
                        goto LABEL_33;
                      }

                      int v39 = [v35 BOOLValue];
LABEL_39:
                      int v16 = sqlite3_bind_int(a5, a4, v39);
                      goto LABEL_9;
                    }

                    [v34 doubleValue];
                  }

- (void)extractSQL:(id)a3 argumentsList:(char *)a4 intoString:(id)a5 arguments:(id)a6
{
  id v9 = a3;
  __int128 v44 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [v9 length];
  if (v12)
  {
    unint64_t v13 = (unint64_t)v12;
    LODWORD(v14) = 0;
    unint64_t v15 = 0LL;
    while (1)
    {
      int v16 = v14;
      id v17 = [v9 characterAtIndex:v15];
      uint64_t v14 = (uint64_t)v17;
      if (v16 == 37) {
        break;
      }
      if ((_DWORD)v17 == 37) {
        goto LABEL_48;
      }
LABEL_45:
      uint64_t v35 = v14;
      if ((_DWORD)v14)
      {
LABEL_46:
        uint64_t v43 = v35;
        sqlite3_int64 v40 = v10;
        id v41 = @"%C";
        goto LABEL_47;
      }

- (id)executeQuery:(id)a3 withParameterDictionary:(id)a4
{
  return -[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:]( self,  "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:",  a3,  0LL,  a4,  0LL,  1LL);
}

- (id)executeQuery:(id)a3 withArgumentsInArray:(id)a4 orDictionary:(id)a5 orVAList:(char *)a6 shouldBind:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (!-[_bmFMDatabase databaseExists](self, "databaseExists")) {
    goto LABEL_4;
  }
  if (!self->_isExecutingStatement)
  {
    self->_isExecutingStatement = 1;
    ppStmt = 0LL;
    if (v13 && self->_traceExecution) {
      NSLog(@"%@ executeQuery: %@", self, v13);
    }
    if (self->_shouldCacheStatements)
    {
      __int128 v18 = (_bmFMStatement *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase cachedStatementForQuery:](self, "cachedStatementForQuery:", v13));
      uint64_t v19 = v18;
      if (v18)
      {
        ppStmt = -[_bmFMStatement statement](v18, "statement");
        -[_bmFMStatement reset](v19, "reset");
        if (ppStmt) {
          goto LABEL_20;
        }
      }

      else
      {
        ppStmt = 0LL;
        [0 reset];
      }
    }

    else
    {
      uint64_t v19 = 0LL;
    }

    db = (sqlite3 *)self->_db;
    id v21 = v13;
    if (sqlite3_prepare_v2(db, (const char *)[v21 UTF8String], -1, &ppStmt, 0))
    {
      if (self->_logsErrors)
      {
        uint64_t v22 = -[_bmFMDatabase lastErrorCode](self, "lastErrorCode");
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase lastErrorMessage](self, "lastErrorMessage"));
        NSLog(@"DB Error: %d \"%@\"", v22, v23);

        NSLog(@"DB Query: %@", v21);
        NSLog(@"DB Path: %@", self->_databasePath);
      }

      if (self->_crashOnErrors) {
        sub_10003CA20(self, (uint64_t)a2);
      }
      sqlite3_finalize(ppStmt);
      id v16 = 0LL;
      ppStmt = 0LL;
      self->_isExecutingStatement = 0;
LABEL_28:

      goto LABEL_5;
    }

- (BOOL)bindStatement:(sqlite3_stmt *)a3 WithArgumentsInArray:(id)a4 orDictionary:(id)a5 orVAList:(char *)a6
{
  id v39 = a4;
  id v10 = a5;
  __int128 v46 = a6;
  int v11 = sqlite3_bind_parameter_count(a3);
  int v38 = v11;
  if (v10)
  {
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    obunint64_t j = (id)objc_claimAutoreleasedReturnValue([v10 allKeys]);
    id v12 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v12)
    {
      id v13 = v12;
      LODWORD(v41) = 0;
      uint64_t v14 = *(void *)v43;
      while (2)
      {
        for (unint64_t i = 0LL; i != v13; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v43 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v42 + 1) + 8LL * (void)i);
          id v17 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @":%@", v16);
          if (self->_traceExecution)
          {
            __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v16]);
            NSLog(@"%@ = %@", v17, v18);
          }

          uint64_t v19 = v17;
          uint64_t v20 = sqlite3_bind_parameter_index(a3, -[NSString UTF8String](v19, "UTF8String"));
          if ((int)v20 < 1)
          {
            NSLog(@"Could not find index for %@", v16);
          }

          else
          {
            uint64_t v21 = v20;
            id v22 = v10;
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v16]);
            uint64_t v24 = -[_bmFMDatabase bindObject:toColumn:inStatement:]( self,  "bindObject:toColumn:inStatement:",  v23,  v21,  a3);

            if ((_DWORD)v24)
            {
              id v36 = sqlite3_errmsg((sqlite3 *)self->_db);
              NSLog(@"Error: unable to bind (%d, %s"), v24, v36;
              sqlite3_finalize(a3);
              self->_isExecutingStatement = 0;

              unint64_t v26 = 0LL;
              BOOL v35 = 0;
              id v10 = v22;
              goto LABEL_37;
            }

            LODWORD(v41) = v41 + 1;
            id v10 = v22;
          }
        }

        id v13 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    else
    {
      LODWORD(v41) = 0;
    }

    id v27 = 0LL;
  }

  else
  {
    uint64_t v25 = 0LL;
    unint64_t v26 = 0LL;
    uint64_t v41 = v11 & ~(v11 >> 31);
    while (1)
    {
      id v27 = v26;
      if (v41 == v25) {
        break;
      }
      if (v39 && v25 < (int)[v39 count])
      {
        id v28 = (id)objc_claimAutoreleasedReturnValue([v39 objectAtIndex:v25]);
      }

      else
      {
        if (!v46)
        {
          LODWORD(v41) = v25;
          break;
        }

        unsigned int v29 = (id *)v46;
        v46 += 8;
        id v28 = *v29;
      }

      unint64_t v26 = v28;

      if (self->_traceExecution)
      {
        uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSData, v30);
        if ((objc_opt_isKindOfClass(v26, v31) & 1) != 0) {
          NSLog(@"data: %ld bytes", [v26 length]);
        }
        else {
          NSLog(@"obj: %@", v26);
        }
      }

      uint64_t v32 = -[_bmFMDatabase bindObject:toColumn:inStatement:](self, "bindObject:toColumn:inStatement:", v26, ++v25, a3);
      if ((_DWORD)v32)
      {
        uint64_t v33 = v32;
        id v34 = sqlite3_errmsg((sqlite3 *)self->_db);
        NSLog(@"Error: unable to bind (%d, %s"), v33, v34;
        sqlite3_finalize(a3);
        BOOL v35 = 0;
        self->_isExecutingStatement = 0;
        goto LABEL_37;
      }
    }
  }

  if ((_DWORD)v41 == v38)
  {
    BOOL v35 = 1;
  }

  else
  {
    NSLog(@"Error: the bind count is not correct for the # of variables (executeQuery)");
    sqlite3_finalize(a3);
    BOOL v35 = 0;
    self->_isExecutingStatement = 0;
  }

  unint64_t v26 = v27;
LABEL_37:

  return v35;
}

- (id)executeQuery:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:]( self,  "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:",  a3,  0LL,  0LL,  &v4,  1LL));
}

- (id)executeQueryWithFormat:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithCapacity:]( NSMutableString,  "stringWithCapacity:",  [v4 length]));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  -[_bmFMDatabase extractSQL:argumentsList:intoString:arguments:]( self,  "extractSQL:argumentsList:intoString:arguments:",  v4,  &v9,  v5,  v6);

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:withArgumentsInArray:](self, "executeQuery:withArgumentsInArray:", v5, v6));
  return v7;
}

- (id)executeQuery:(id)a3 withArgumentsInArray:(id)a4
{
  return -[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:]( self,  "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:",  a3,  a4,  0LL,  0LL,  1LL);
}

- (id)executeQuery:(id)a3 values:(id)a4 error:(id *)a5
{
  uint64_t v7 = objc_claimAutoreleasedReturnValue( -[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:]( self,  "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:",  a3,  a4,  0LL,  0LL,  1LL));
  id v8 = (void *)v7;
  if (a5 && !v7) {
    *a5 = (id)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase lastError](self, "lastError"));
  }
  return v8;
}

- (id)executeQuery:(id)a3 withVAList:(char *)a4
{
  return -[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:]( self,  "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:",  a3,  0LL,  0LL,  a4,  1LL);
}

- (BOOL)executeUpdate:(id)a3 error:(id *)a4 withArgumentsInArray:(id)a5 orDictionary:(id)a6 orVAList:(char *)a7
{
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:]( self,  "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:",  a3,  a5,  a6,  a7,  1LL));
  id v10 = v9;
  if (v9)
  {
    BOOL v11 = [v9 internalStepWithError:a4] == 101;
  }

  else if (a4)
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase lastError](self, "lastError"));
    BOOL v11 = 0;
    *a4 = v12;
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)executeUpdate:(id)a3
{
  return -[_bmFMDatabase executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:]( self,  "executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:",  a3,  0LL,  0LL,  0LL,  &v4);
}

- (BOOL)executeUpdate:(id)a3 withArgumentsInArray:(id)a4
{
  return -[_bmFMDatabase executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:]( self,  "executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:",  a3,  0LL,  a4,  0LL,  0LL);
}

- (BOOL)executeUpdate:(id)a3 values:(id)a4 error:(id *)a5
{
  return -[_bmFMDatabase executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:]( self,  "executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:",  a3,  a5,  a4,  0LL,  0LL);
}

- (BOOL)executeUpdate:(id)a3 withParameterDictionary:(id)a4
{
  return -[_bmFMDatabase executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:]( self,  "executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:",  a3,  0LL,  0LL,  a4,  0LL);
}

- (BOOL)executeUpdate:(id)a3 withVAList:(char *)a4
{
  return -[_bmFMDatabase executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:]( self,  "executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:",  a3,  0LL,  0LL,  0LL,  a4);
}

- (BOOL)executeUpdateWithFormat:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithCapacity:]( NSMutableString,  "stringWithCapacity:",  [v4 length]));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  -[_bmFMDatabase extractSQL:argumentsList:intoString:arguments:]( self,  "extractSQL:argumentsList:intoString:arguments:",  v4,  &v8,  v5,  v6);

  LOBYTE(self) = -[_bmFMDatabase executeUpdate:withArgumentsInArray:]( self,  "executeUpdate:withArgumentsInArray:",  v5,  v6);
  return (char)self;
}

- (BOOL)executeStatements:(id)a3
{
  return -[_bmFMDatabase executeStatements:withResultBlock:](self, "executeStatements:withResultBlock:", a3, 0LL);
}

- (BOOL)executeStatements:(id)a3 withResultBlock:(id)a4
{
  errmsg = 0LL;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = -[_bmFMDatabase sqliteHandle](self, "sqliteHandle");
  id v9 = v7;
  id v10 = (const char *)[v9 UTF8String];

  if (v6) {
    BOOL v11 = (int (__cdecl *)(void *, int, char **, char **))sub_10003BA6C;
  }
  else {
    BOOL v11 = 0LL;
  }
  int v12 = sqlite3_exec(v8, v10, v11, v6, &errmsg);

  if (errmsg)
  {
    if (-[_bmFMDatabase logsErrors](self, "logsErrors")) {
      NSLog(@"Error inserting batch: %s", errmsg);
    }
    if (errmsg) {
      sqlite3_free(errmsg);
    }
  }

  return v12 == 0;
}

- (BOOL)executeUpdate:(id)a3 withErrorAndBindings:(id *)a4
{
  return -[_bmFMDatabase executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:]( self,  "executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:",  a3,  a4,  0LL,  0LL,  &v5);
}

- (BOOL)update:(id)a3 withErrorAndBindings:(id *)a4
{
  return -[_bmFMDatabase executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:]( self,  "executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:",  a3,  a4,  0LL,  0LL,  &v5);
}

- (id)prepare:(id)a3
{
  return -[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:]( self,  "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:",  a3,  0LL,  0LL,  0LL,  0LL);
}

- (BOOL)rollback
{
  BOOL v3 = -[_bmFMDatabase executeUpdate:](self, "executeUpdate:", @"rollback transaction");
  if (v3) {
    self->_isInTransaction = 0;
  }
  return v3;
}

- (BOOL)commit
{
  BOOL v3 = -[_bmFMDatabase executeUpdate:](self, "executeUpdate:", @"commit transaction");
  if (v3) {
    self->_isInTransaction = 0;
  }
  return v3;
}

- (BOOL)beginTransaction
{
  BOOL v3 = -[_bmFMDatabase executeUpdate:](self, "executeUpdate:", @"begin exclusive transaction");
  if (v3) {
    self->_isInTransaction = 1;
  }
  return v3;
}

- (BOOL)beginDeferredTransaction
{
  BOOL v3 = -[_bmFMDatabase executeUpdate:](self, "executeUpdate:", @"begin deferred transaction");
  if (v3) {
    self->_isInTransaction = 1;
  }
  return v3;
}

- (BOOL)beginImmediateTransaction
{
  BOOL v3 = -[_bmFMDatabase executeUpdate:](self, "executeUpdate:", @"begin immediate transaction");
  if (v3) {
    self->_isInTransaction = 1;
  }
  return v3;
}

- (BOOL)beginExclusiveTransaction
{
  BOOL v3 = -[_bmFMDatabase executeUpdate:](self, "executeUpdate:", @"begin exclusive transaction");
  if (v3) {
    self->_isInTransaction = 1;
  }
  return v3;
}

- (BOOL)inTransaction
{
  return self->_isInTransaction;
}

- (BOOL)interrupt
{
  db = self->_db;
  if (db) {
    sqlite3_interrupt((sqlite3 *)-[_bmFMDatabase sqliteHandle](self, "sqliteHandle"));
  }
  return db != 0LL;
}

- (BOOL)startSavePointWithName:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2, self, @"FMDatabase.m", 1256, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }

  uint64_t v8 = objc_alloc(&OBJC_CLASS___NSString);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByReplacingOccurrencesOfString:@"'" withString:@"''"]);
  id v10 = -[NSString initWithFormat:](v8, "initWithFormat:", @"savepoint '%@';", v9);

  BOOL v11 = -[_bmFMDatabase executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:]( self,  "executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:",  v10,  a4,  0LL,  0LL,  0LL);
  return v11;
}

- (BOOL)releaseSavePointWithName:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2, self, @"FMDatabase.m", 1270, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }

  uint64_t v8 = objc_alloc(&OBJC_CLASS___NSString);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByReplacingOccurrencesOfString:@"'" withString:@"''"]);
  id v10 = -[NSString initWithFormat:](v8, "initWithFormat:", @"release savepoint '%@';", v9);

  BOOL v11 = -[_bmFMDatabase executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:]( self,  "executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:",  v10,  a4,  0LL,  0LL,  0LL);
  return v11;
}

- (BOOL)rollbackToSavePointWithName:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2, self, @"FMDatabase.m", 1284, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }

  uint64_t v8 = objc_alloc(&OBJC_CLASS___NSString);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByReplacingOccurrencesOfString:@"'" withString:@"''"]);
  id v10 = -[NSString initWithFormat:](v8, "initWithFormat:", @"rollback transaction to savepoint '%@';", v9);

  BOOL v11 = -[_bmFMDatabase executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:]( self,  "executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:",  v10,  a4,  0LL,  0LL,  0LL);
  return v11;
}

- (id)inSavePoint:(id)a3
{
  id v4 = (void (**)(id, _BYTE *))a3;
  uint64_t v5 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v6 = qword_10007C3A0++;
  id v7 = -[NSString initWithFormat:](v5, "initWithFormat:", @"dbSavePoint%ld", v6);
  char v17 = 0;
  id v16 = 0LL;
  unsigned int v8 = -[_bmFMDatabase startSavePointWithName:error:](self, "startSavePointWithName:error:", v7, &v16);
  id v9 = v16;
  if (v8)
  {
    if (v4)
    {
      v4[2](v4, &v17);
      if (v17)
      {
        id v15 = v9;
        -[_bmFMDatabase rollbackToSavePointWithName:error:](self, "rollbackToSavePointWithName:error:", v7, &v15);
        id v10 = v15;

        id v9 = v10;
      }
    }

    id v14 = v9;
    -[_bmFMDatabase releaseSavePointWithName:error:](self, "releaseSavePointWithName:error:", v7, &v14);
    id v11 = v14;

    id v9 = v11;
  }

  id v12 = v9;

  return v12;
}

- (BOOL)checkpoint:(int)a3 error:(id *)a4
{
  return -[_bmFMDatabase checkpoint:name:logFrameCount:checkpointCount:error:]( self,  "checkpoint:name:logFrameCount:checkpointCount:error:",  *(void *)&a3,  0LL,  0LL,  0LL,  a4);
}

- (BOOL)checkpoint:(int)a3 name:(id)a4 error:(id *)a5
{
  return -[_bmFMDatabase checkpoint:name:logFrameCount:checkpointCount:error:]( self,  "checkpoint:name:logFrameCount:checkpointCount:error:",  *(void *)&a3,  a4,  0LL,  0LL,  a5);
}

- (BOOL)checkpoint:(int)a3 name:(id)a4 logFrameCount:(int *)a5 checkpointCount:(int *)a6 error:(id *)a7
{
  id v13 = a4;
  int v14 = sqlite3_wal_checkpoint_v2((sqlite3 *)self->_db, (const char *)[v13 UTF8String], a3, a5, a6);
  if (v14)
  {
    if (a7) {
      *a7 = (id)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase lastError](self, "lastError"));
    }
    if (-[_bmFMDatabase logsErrors](self, "logsErrors"))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase lastErrorMessage](self, "lastErrorMessage"));
      NSLog(@"%@", v15);
    }

    if (-[_bmFMDatabase crashOnErrors](self, "crashOnErrors")) {
      sub_10003CAA4(self, (uint64_t)a2);
    }
  }

  return v14 == 0;
}

- (BOOL)shouldCacheStatements
{
  return self->_shouldCacheStatements;
}

- (void)setShouldCacheStatements:(BOOL)a3
{
  self->_shouldCacheStatements = a3;
  if (!a3
    || !self->_cachedStatements
    && (id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary")),
        -[_bmFMDatabase setCachedStatements:](self, "setCachedStatements:", v4),
        v4,
        !self->_shouldCacheStatements))
  {
    -[_bmFMDatabase setCachedStatements:](self, "setCachedStatements:", 0LL);
  }

- (void)makeFunctionNamed:(id)a3 maximumArguments:(int)a4 withBlock:(id)a5
{
}

- (void)makeFunctionNamed:(id)a3 arguments:(int)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!self->_openFunctions)
  {
    id v10 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    openFunctions = self->_openFunctions;
    self->_openFunctions = v10;
  }

  id v12 = [v9 copy];
  -[NSMutableSet addObject:](self->_openFunctions, "addObject:", v12);
  id v13 = -[_bmFMDatabase sqliteHandle](self, "sqliteHandle");
  id v14 = v8;
  sqlite3_create_function( v13,  (const char *)[v14 UTF8String],  a4,  1,  v12,  (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_10003C3F8,  0,  0);
}

- (int)valueType:(void *)a3
{
  return sqlite3_value_type((sqlite3_value *)a3);
}

- (int)valueInt:(void *)a3
{
  return sqlite3_value_int((sqlite3_value *)a3);
}

- (int64_t)valueLong:(void *)a3
{
  return sqlite3_value_int64((sqlite3_value *)a3);
}

- (double)valueDouble:(void *)a3
{
  return sqlite3_value_double((sqlite3_value *)a3);
}

- (id)valueData:(void *)a3
{
  id v4 = sqlite3_value_blob((sqlite3_value *)a3);
  int v5 = sqlite3_value_bytes((sqlite3_value *)a3);
  if (v4) {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v4, v5));
  }
  else {
    uint64_t v6 = 0LL;
  }
  return v6;
}

- (id)valueString:(void *)a3
{
  BOOL v3 = (unsigned __int8 *)sqlite3_value_text((sqlite3_value *)a3);
  if (v3) {
    BOOL v3 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v3));
  }
  return v3;
}

- (void)resultNullInContext:(void *)a3
{
}

- (void)resultInt:(int)a3 context:(void *)a4
{
}

- (void)resultLong:(int64_t)a3 context:(void *)a4
{
}

- (void)resultDouble:(double)a3 context:(void *)a4
{
}

- (void)resultData:(id)a3 context:(void *)a4
{
  id v5 = a3;
  id v6 = [v5 bytes];
  int v7 = [v5 length];

  sqlite3_result_blob((sqlite3_context *)a4, v6, v7, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (void)resultString:(id)a3 context:(void *)a4
{
}

- (void)resultError:(id)a3 context:(void *)a4
{
}

- (void)resultErrorCode:(int)a3 context:(void *)a4
{
}

- (void)resultErrorNoMemoryInContext:(void *)a3
{
}

- (void)resultErrorTooBigInContext:(void *)a3
{
}

- (BOOL)traceExecution
{
  return self->_traceExecution;
}

- (void)setTraceExecution:(BOOL)a3
{
  self->_traceExecution = a3;
}

- (BOOL)checkedOut
{
  return self->_checkedOut;
}

- (void)setCheckedOut:(BOOL)a3
{
  self->_checkedOut = a3;
}

- (BOOL)crashOnErrors
{
  return self->_crashOnErrors;
}

- (void)setCrashOnErrors:(BOOL)a3
{
  self->_crashOnErrors = a3;
}

- (BOOL)logsErrors
{
  return self->_logsErrors;
}

- (void)setLogsErrors:(BOOL)a3
{
  self->_logsErrors = a3;
}

- (NSMutableDictionary)cachedStatements
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setCachedStatements:(id)a3
{
}

- (BOOL)isOpen
{
  return self->_isOpen;
}

- (void)setIsOpen:(BOOL)a3
{
  self->_BOOL isOpen = a3;
}

- (BOOL)isInTransaction
{
  return self->_isInTransaction;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (void).cxx_destruct
{
}

- (id)stringForQuery:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:]( self,  "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:",  a3,  0LL,  0LL,  &v6,  1LL));
  id v4 = 0LL;
  if ([v3 next])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringForColumnIndex:0]);
    [v3 close];
    [v3 setParentDB:0];
  }

  return v4;
}

- (int)intForQuery:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:]( self,  "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:",  a3,  0LL,  0LL,  &v6,  1LL));
  if ([v3 next])
  {
    int v4 = [v3 intForColumnIndex:0];
    [v3 close];
    [v3 setParentDB:0];
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int64_t)longForQuery:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:]( self,  "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:",  a3,  0LL,  0LL,  &v6,  1LL));
  id v4 = 0LL;
  if ([v3 next])
  {
    id v4 = [v3 longForColumnIndex:0];
    [v3 close];
    [v3 setParentDB:0];
  }

  return (int64_t)v4;
}

- (BOOL)BOOLForQuery:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:]( self,  "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:",  a3,  0LL,  0LL,  &v6,  1LL));
  if ([v3 next])
  {
    unsigned __int8 v4 = [v3 BOOLForColumnIndex:0];
    [v3 close];
    [v3 setParentDB:0];
  }

  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (double)doubleForQuery:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:]( self,  "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:",  a3,  0LL,  0LL,  &v7,  1LL));
  double v4 = 0.0;
  if ([v3 next])
  {
    [v3 doubleForColumnIndex:0];
    double v4 = v5;
    [v3 close];
    [v3 setParentDB:0];
  }

  return v4;
}

- (id)dataForQuery:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:]( self,  "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:",  a3,  0LL,  0LL,  &v6,  1LL));
  double v4 = 0LL;
  if ([v3 next])
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dataForColumnIndex:0]);
    [v3 close];
    [v3 setParentDB:0];
  }

  return v4;
}

- (id)dateForQuery:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:]( self,  "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:",  a3,  0LL,  0LL,  &v6,  1LL));
  double v4 = 0LL;
  if ([v3 next])
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dateForColumnIndex:0]);
    [v3 close];
    [v3 setParentDB:0];
  }

  return v4;
}

- (BOOL)tableExists:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue([a3 lowercaseString]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase executeQuery:]( self,  "executeQuery:",  @"select [sql] from sqlite_master where [type] = 'table' and lower(name) = ?",  v4));
  unsigned __int8 v6 = [v5 next];
  [v5 close];

  return v6;
}

- (id)getSchema
{
  return -[_bmFMDatabase executeQuery:]( self,  "executeQuery:",  @"SELECT type, name, tbl_name, rootpage, sql FROM (SELECT * FROM sqlite_master UNION ALL SELECT * FROM sqlite_temp_master) WHERE type != 'meta' AND name NOT LIKE 'sqlite_%' ORDER BY tbl_name, type DESC, name");
}

- (id)getTableSchema:(id)a3
{
  id v4 = a3;
  double v5 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"pragma table_info('%@')",  v4);

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self, "executeQuery:", v5));
  return v6;
}

- (BOOL)columnExists:(id)a3 inTableWithName:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a4 lowercaseString]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 lowercaseString]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase getTableSchema:](self, "getTableSchema:", v7));
  do
  {
    unsigned int v10 = [v9 next];
    if (!v10) {
      break;
    }
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 stringForColumn:@"name"]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 lowercaseString]);
    unsigned int v13 = [v12 isEqualToString:v8];
  }

  while (!v13);
  [v9 close];

  return v10;
}

- (unsigned)applicationID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self, "executeQuery:", @"pragma application_id"));
  else {
    unsigned int v3 = 0;
  }
  [v2 close];

  return v3;
}

- (void)setApplicationID:(unsigned int)a3
{
  double v5 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"pragma application_id=%d",  *(void *)&a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self, "executeQuery:", v5));
  [v4 next];
  [v4 close];
}

- (unsigned)userVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self, "executeQuery:", @"pragma user_version"));
  else {
    unsigned int v3 = 0;
  }
  [v2 close];

  return v3;
}

- (void)setUserVersion:(unsigned int)a3
{
  double v5 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"pragma user_version = %d",  *(void *)&a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self, "executeQuery:", v5));
  [v4 next];
  [v4 close];
}

- (BOOL)columnExists:(id)a3 columnName:(id)a4
{
  return -[_bmFMDatabase columnExists:inTableWithName:](self, "columnExists:inTableWithName:", a4, a3);
}

- (BOOL)validateSQL:(id)a3 error:(id *)a4
{
  ppStmt = 0LL;
  id v6 = a3;
  uint64_t v7 = -[_bmFMDatabase sqliteHandle](self, "sqliteHandle");
  id v8 = v6;
  id v9 = (const char *)[v8 UTF8String];

  int v10 = sqlite3_prepare_v2(v7, v9, -1, &ppStmt, 0LL);
  int v11 = v10;
  if (a4 && v10)
  {
    uint64_t v12 = -[_bmFMDatabase lastErrorCode](self, "lastErrorCode");
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase lastErrorMessage](self, "lastErrorMessage"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v13,  NSLocalizedDescriptionKey));
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  v12,  v14));
  }

  sqlite3_finalize(ppStmt);
  return v11 == 0;
}

@end