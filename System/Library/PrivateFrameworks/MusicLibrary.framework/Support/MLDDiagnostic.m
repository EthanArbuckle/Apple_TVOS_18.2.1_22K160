@interface MLDDiagnostic
- (BOOL)locked;
- (BOOL)writeToFile:(id)a3 error:(id *)a4;
- (BOOL)writerSuspended;
- (MLDDiagnostic)init;
- (MLDDiagnostic)initWithReason:(id)a3;
- (NSArray)activeClients;
- (NSArray)activeImportOperations;
- (NSArray)activeTransactions;
- (NSArray)activeXPCTransactions;
- (NSArray)databaseFileDiagnostics;
- (NSArray)enqueuedConcurrentOperations;
- (NSArray)enqueuedLimitedQueueOperations;
- (NSArray)enqueuedSerialOperations;
- (NSArray)suspendedImportOperations;
- (NSDate)date;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)libraryConnectionDiagnostics;
- (NSError)lastImportError;
- (NSString)reason;
- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)_appendDescribableArray:(id)a3 toString:(id)a4 withTitle:(id)a5;
- (void)_appendDescribableArray:(id)a3 toString:(id)a4 withTitle:(id)a5 indentLevel:(unsigned int)a6;
@end

@implementation MLDDiagnostic

- (MLDDiagnostic)initWithReason:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MLDDiagnostic;
  v5 = -[MLDDiagnostic init](&v11, "init");
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSDate);
    date = v5->_date;
    v5->_date = v6;

    v8 = (NSString *)[v4 copy];
    reason = v5->_reason;
    v5->_reason = v8;
  }

  return v5;
}

- (MLDDiagnostic)init
{
  return -[MLDDiagnostic initWithReason:](self, "initWithReason:", 0LL);
}

- (NSDictionary)dictionaryRepresentation
{
  date = self->_date;
  v17[0] = @"_date";
  v17[1] = @"_reason";
  reason = (const __CFString *)self->_reason;
  if (!reason) {
    reason = @"@";
  }
  v18[0] = date;
  v18[1] = reason;
  v17[2] = @"_locked";
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_locked));
  __int128 v19 = *(_OWORD *)&self->_activeClients;
  v17[3] = @"_activeClients";
  v17[4] = @"_activeXPCTransactions";
  databaseFileDiagnostics = self->_databaseFileDiagnostics;
  v18[2] = v5;
  v20 = databaseFileDiagnostics;
  v17[5] = @"_databaseFileDiagnostics";
  v17[6] = @"_writerSuspended";
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_writerSuspended));
  v21 = v7;
  v17[7] = @"_activeTransactions";
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray debugDescription](self->_activeTransactions, "debugDescription"));
  __int128 v23 = *(_OWORD *)&self->_enqueuedConcurrentOperations;
  v17[8] = @"_enqueuedConcurrentOperations";
  v17[9] = @"_enqueuedSerialOperations";
  enqueuedLimitedQueueOperations = self->_enqueuedLimitedQueueOperations;
  lastImportError = self->_lastImportError;
  v22 = v8;
  v24 = enqueuedLimitedQueueOperations;
  v17[10] = @"_enqueuedLimitedSizeQueueOperations";
  v17[11] = @"_lastImportError";
  if (lastImportError) {
    objc_super v11 = (const __CFString *)lastImportError;
  }
  else {
    objc_super v11 = @"@";
  }
  activeImportOperations = self->_activeImportOperations;
  suspendedImportOperations = self->_suspendedImportOperations;
  v25 = v11;
  v26 = activeImportOperations;
  v17[12] = @"_activeImportOperations";
  v17[13] = @"_suspendedImportOperations";
  v17[14] = @"_libraryConnectionDiagnostics";
  libraryConnectionDiagnostics = self->_libraryConnectionDiagnostics;
  v27 = suspendedImportOperations;
  v28 = libraryConnectionDiagnostics;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  15LL));

  return (NSDictionary *)v15;
}

- (id)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendString:](v3, "appendString:", @"MediaLibrary Diagnostic\n");
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"Collected at %@\n", self->_date);
  if (self->_reason) {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"Reason: %@\n", self->_reason);
  }
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  if (self->_locked) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"Locked: %@\n\n", v4);
  -[MLDDiagnostic _appendDescribableArray:toString:withTitle:]( self,  "_appendDescribableArray:toString:withTitle:",  self->_activeClients,  v3,  @"Active Clients");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[MLDDiagnostic _appendDescribableArray:toString:withTitle:]( self,  "_appendDescribableArray:toString:withTitle:",  self->_activeXPCTransactions,  v3,  @"Active XPC Transactions");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[MLDDiagnostic _appendDescribableArray:toString:withTitle:]( self,  "_appendDescribableArray:toString:withTitle:",  self->_databaseFileDiagnostics,  v3,  @"Database Files");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  if (self->_writerSuspended) {
    v5 = @"SUSPENDED";
  }
  else {
    v5 = @"ACTIVE";
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"Writer State: %@\n\n", v5);
  -[MLDDiagnostic _appendDescribableArray:toString:withTitle:]( self,  "_appendDescribableArray:toString:withTitle:",  self->_activeTransactions,  v3,  @"Active Transactions");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[MLDDiagnostic _appendDescribableArray:toString:withTitle:]( self,  "_appendDescribableArray:toString:withTitle:",  self->_enqueuedConcurrentOperations,  v3,  @"Enqueued Concurrent Operations");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[MLDDiagnostic _appendDescribableArray:toString:withTitle:]( self,  "_appendDescribableArray:toString:withTitle:",  self->_enqueuedSerialOperations,  v3,  @"Enqueued Serial Operations");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[MLDDiagnostic _appendDescribableArray:toString:withTitle:]( self,  "_appendDescribableArray:toString:withTitle:",  self->_enqueuedLimitedQueueOperations,  v3,  @"Enqueue Limited Size Queue Operatons");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"Last Importer Error: %@\n\n", self->_lastImportError);
  -[MLDDiagnostic _appendDescribableArray:toString:withTitle:]( self,  "_appendDescribableArray:toString:withTitle:",  self->_activeImportOperations,  v3,  @"Active Import Operations");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[MLDDiagnostic _appendDescribableArray:toString:withTitle:]( self,  "_appendDescribableArray:toString:withTitle:",  self->_suspendedImportOperations,  v3,  @"Suspended Import Operations");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"Database Connections:\n");
  libraryConnectionDiagnostics = self->_libraryConnectionDiagnostics;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100004730;
  v10[3] = &unk_1000247B0;
  v7 = v3;
  objc_super v11 = v7;
  v12 = self;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:]( libraryConnectionDiagnostics,  "enumerateKeysAndObjectsUsingBlock:",  v10);
  v8 = v7;

  return v8;
}

- (BOOL)writeToFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MLDDiagnostic description](self, "description"));
  LOBYTE(a4) = [v7 writeToFile:v6 atomically:1 encoding:4 error:a4];

  return (char)a4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class(self, a2);
  return -[MLDDiagnostic _copyWithZone:usingConcreteClass:](self, "_copyWithZone:usingConcreteClass:", a3, v5);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MLDMutableDiagnostic, a2);
  return -[MLDDiagnostic _copyWithZone:usingConcreteClass:](self, "_copyWithZone:usingConcreteClass:", a3, v5);
}

- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4
{
  uint64_t v5 = (id *)objc_alloc_init(a4);
  objc_storeStrong(v5 + 1, self->_date);
  *((_BYTE *)v5 + 16) = self->_locked;
  id v6 = -[NSArray copy](self->_activeClients, "copy");
  id v7 = v5[3];
  v5[3] = v6;

  id v8 = -[NSArray copy](self->_activeXPCTransactions, "copy");
  id v9 = v5[4];
  v5[4] = v8;

  id v10 = -[NSArray copy](self->_databaseFileDiagnostics, "copy");
  id v11 = v5[5];
  v5[5] = v10;

  *((_BYTE *)v5 + 48) = self->_writerSuspended;
  id v12 = -[NSArray copy](self->_activeTransactions, "copy");
  id v13 = v5[7];
  v5[7] = v12;

  id v14 = -[NSArray copy](self->_enqueuedConcurrentOperations, "copy");
  id v15 = v5[8];
  v5[8] = v14;

  id v16 = -[NSArray copy](self->_enqueuedSerialOperations, "copy");
  id v17 = v5[9];
  v5[9] = v16;

  id v18 = -[NSArray copy](self->_enqueuedLimitedQueueOperations, "copy");
  id v19 = v5[10];
  v5[10] = v18;

  objc_storeStrong(v5 + 11, self->_lastImportError);
  id v20 = -[NSArray copy](self->_activeImportOperations, "copy");
  id v21 = v5[12];
  v5[12] = v20;

  id v22 = -[NSArray copy](self->_suspendedImportOperations, "copy");
  id v23 = v5[13];
  v5[13] = v22;

  id v24 = -[NSDictionary copy](self->_libraryConnectionDiagnostics, "copy");
  id v25 = v5[14];
  v5[14] = v24;

  return v5;
}

- (void)_appendDescribableArray:(id)a3 toString:(id)a4 withTitle:(id)a5
{
}

- (void)_appendDescribableArray:(id)a3 toString:(id)a4 withTitle:(id)a5 indentLevel:(unsigned int)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  for (i = objc_alloc_init(&OBJC_CLASS___NSMutableString); a6; --a6)
    -[NSMutableString appendString:](i, "appendString:", @"    ");
  [v10 appendFormat:@"%@%@:", i, v11];
  if ([v9 count])
  {
    id v23 = v11;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v13 = v9;
    id v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v14)
    {
      id v16 = v14;
      uint64_t v17 = *(void *)v25;
      do
      {
        id v18 = 0LL;
        do
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v13);
          }
          id v19 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)v18);
          uint64_t v20 = objc_opt_class(&OBJC_CLASS___ML3ImportOperation, v15);
          if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0) {
            uint64_t v21 = objc_claimAutoreleasedReturnValue([v19 longDescription]);
          }
          else {
            uint64_t v21 = objc_claimAutoreleasedReturnValue([v19 description]);
          }
          id v22 = (void *)v21;
          [v10 appendFormat:@"\n%@%@", i, v21];

          id v18 = (char *)v18 + 1;
        }

        while (v16 != v18);
        id v16 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v16);
    }

    id v11 = v23;
  }

  else
  {
    [v10 appendFormat:@"\n%@(None)", i];
  }

  [v10 appendString:@"\n"];
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)locked
{
  return self->_locked;
}

- (NSArray)activeClients
{
  return self->_activeClients;
}

- (NSArray)activeXPCTransactions
{
  return self->_activeXPCTransactions;
}

- (NSArray)databaseFileDiagnostics
{
  return self->_databaseFileDiagnostics;
}

- (BOOL)writerSuspended
{
  return self->_writerSuspended;
}

- (NSArray)activeTransactions
{
  return self->_activeTransactions;
}

- (NSArray)enqueuedConcurrentOperations
{
  return self->_enqueuedConcurrentOperations;
}

- (NSArray)enqueuedSerialOperations
{
  return self->_enqueuedSerialOperations;
}

- (NSArray)enqueuedLimitedQueueOperations
{
  return self->_enqueuedLimitedQueueOperations;
}

- (NSError)lastImportError
{
  return self->_lastImportError;
}

- (NSArray)activeImportOperations
{
  return self->_activeImportOperations;
}

- (NSArray)suspendedImportOperations
{
  return self->_suspendedImportOperations;
}

- (NSDictionary)libraryConnectionDiagnostics
{
  return self->_libraryConnectionDiagnostics;
}

- (void).cxx_destruct
{
}

@end