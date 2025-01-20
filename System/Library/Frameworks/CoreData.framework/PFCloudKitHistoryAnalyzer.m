@interface PFCloudKitHistoryAnalyzer
+ (BOOL)isPrivateContextName:(id)a3;
+ (BOOL)isPrivateTransaction:(id)a3;
+ (BOOL)isPrivateTransactionAuthor:(id)a3;
- (BOOL)processTransaction:(id)a3 withContext:(id)a4 error:(id *)a5;
- (PFCloudKitHistoryAnalyzer)initWithOptions:(id)a3 managedObjectContext:(id)a4;
- (id)instantiateNewAnalyzerContextForChangesInStore:(id)a3;
- (void)dealloc;
@end

@implementation PFCloudKitHistoryAnalyzer

- (PFCloudKitHistoryAnalyzer)initWithOptions:(id)a3 managedObjectContext:(id)a4
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = [NSString stringWithUTF8String:"Attempt to init PFCloudKitHistoryAnalyzer with the wrong options class: %@"];
    uint64_t v8 = objc_opt_class();
    _NSCoreDataLog(17LL, v7, v9, v10, v11, v12, v13, v14, v8);
    v15 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = objc_opt_class();
      _os_log_fault_impl( &dword_186681000,  v15,  OS_LOG_TYPE_FAULT,  "CoreData: Attempt to init PFCloudKitHistoryAnalyzer with the wrong options class: %@",  buf,  0xCu);
    }
  }

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PFCloudKitHistoryAnalyzer;
  v16 = -[PFHistoryAnalyzer initWithOptions:](&v18, sel_initWithOptions_, a3);
  if (v16) {
    v16->_managedObjectContext = (NSManagedObjectContext *)a4;
  }
  return v16;
}

- (void)dealloc
{
  self->_lastProcessedToken = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitHistoryAnalyzer;
  -[PFHistoryAnalyzer dealloc](&v3, sel_dealloc);
}

- (id)instantiateNewAnalyzerContextForChangesInStore:(id)a3
{
  v5 = objc_alloc(&OBJC_CLASS___PFCloudKitHistoryAnalyzerContext);
  if (self) {
    options = self->super._options;
  }
  else {
    options = 0LL;
  }
  return -[PFCloudKitHistoryAnalyzerContext initWithOptions:managedObjectContext:store:]( v5,  "initWithOptions:managedObjectContext:store:",  options,  self->_managedObjectContext,  a3);
}

- (BOOL)processTransaction:(id)a3 withContext:(id)a4 error:(id *)a5
{
  v39[1] = *MEMORY[0x1895F89C0];
  v33 = 0LL;
  if (!+[PFCloudKitHistoryAnalyzer isPrivateTransaction:]( &OBJC_CLASS___PFCloudKitHistoryAnalyzer,  "isPrivateTransaction:")
    || (objc_msgSend((id)objc_msgSend(a3, "author"), "isEqualToString:", @"NSCloudKitMirroringDelegate.import") & 1) != 0
    || (objc_msgSend( (id)objc_msgSend(a3, "contextName"),  "isEqualToString:",  @"NSCloudKitMirroringDelegate.import") & 1) != 0 || objc_msgSend( (id)objc_msgSend(a3, "author"),  "isEqualToString:",  @"NSCloudKitMirroringDelegate.reset"))
  {
    if (self)
    {
      options = self->super._options;
      if (options)
      {
        uint64_t v10 = *(void *)&options[1]._automaticallyPruneTransientRecords;
        if (v10)
        {
          if (([*(id *)(v10 + 64) shouldDefer] & 1) != 0 || *(_BYTE *)(v10 + 40))
          {
            uint64_t v11 = *MEMORY[0x189607460];
            uint64_t v38 = *MEMORY[0x1896075F0];
            v39[0] = @"History analysis was aborted because the activity was deferred by the system.";
            uint64_t v12 = (void *)objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  v11,  134419,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1));
            v33 = v12;
            if (v12) {
              goto LABEL_11;
            }
            goto LABEL_17;
          }
        }
      }
    }

    v32.receiver = self;
    v32.super_class = (Class)&OBJC_CLASS___PFCloudKitHistoryAnalyzer;
    if (!-[PFHistoryAnalyzer processTransaction:withContext:error:]( &v32,  sel_processTransaction_withContext_error_,  a3,  a4,  &v33))
    {
      uint64_t v12 = v33;
      if (v33)
      {
LABEL_11:
        if (a5)
        {
          LOBYTE(v13) = 0;
          *a5 = v12;
          return v13;
        }

+ (BOOL)isPrivateTransaction:(id)a3
{
  return +[PFCloudKitHistoryAnalyzer isPrivateTransactionAuthor:]( PFCloudKitHistoryAnalyzer,  "isPrivateTransactionAuthor:",  [a3 author])
      || +[PFCloudKitHistoryAnalyzer isPrivateContextName:]( PFCloudKitHistoryAnalyzer,  "isPrivateContextName:",  [a3 contextName]);
}

+ (BOOL)isPrivateTransactionAuthor:(id)a3
{
  if (([a3 isEqualToString:@"NSCloudKitMirroringDelegate.export"] & 1) != 0
    || ([a3 isEqualToString:@"NSCloudKitMirroringDelegate.import"] & 1) != 0
    || ([a3 isEqualToString:@"NSCloudKitMirroringDelegate.reset"] & 1) != 0
    || ([a3 isEqualToString:@"NSCloudKitMirroringDelegate.migration"] & 1) != 0
    || ([a3 isEqualToString:@"NSCloudKitMirroringDelegate.setup"] & 1) != 0)
  {
    return 1;
  }

  else
  {
    return [a3 isEqualToString:@"NSCloudKitMirroringDelegate.event"];
  }

+ (BOOL)isPrivateContextName:(id)a3
{
  if ([a3 isEqualToString:@"NSCloudKitMirroringDelegate.export"]) {
    return 1;
  }
  else {
    return [a3 isEqualToString:@"NSCloudKitMirroringDelegate.import"];
  }
}

@end