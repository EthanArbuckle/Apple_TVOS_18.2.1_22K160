@interface PDMapsMerchantProcessingService
- (PDMapsMerchantProcessingService)initWithDatabaseManager:(id)a3 transactionProcessor:(id)a4 webServiceCoordinator:(id)a5;
- (id)_processingItemsForScheduledActivity;
- (void)_logScheduledActivityWithItems:(id)a3;
- (void)_processItem:(id)a3;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)start;
@end

@implementation PDMapsMerchantProcessingService

- (PDMapsMerchantProcessingService)initWithDatabaseManager:(id)a3 transactionProcessor:(id)a4 webServiceCoordinator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PDMapsMerchantProcessingService;
  v12 = -[PDMapsMerchantProcessingService init](&v19, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_databaseManager, a3);
    objc_storeStrong((id *)&v13->_transactionProcessor, a4);
    objc_storeStrong((id *)&v13->_webServiceCoordinator, a5);
    dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.passd.PDMapsMerchantProcessingService.work", v15);
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v16;
  }

  return v13;
}

- (void)start
{
  webServiceCoordinator = self->_webServiceCoordinator;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10037B604;
  v3[3] = &unk_10064C5A0;
  v3[4] = self;
  -[PDPaymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:]( webServiceCoordinator,  "performHandlerOnSharedWebServiceQueue:",  v3);
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10037B8D4;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)_logScheduledActivityWithItems:(id)a3
{
  id v13 = a3;
  if (PKEnableMerchantReprocessingLogging())
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v4 = PKHomeDirectoryPath(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"MerchantReprocessingLogs.txt"]);
    if (([v3 fileExistsAtPath:v6] & 1) != 0
      || (unsigned int v7 = [v3 createFileAtPath:v6 contents:0 attributes:0],
          PKExcludePathFromBackup(v6),
          v7))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForUpdatingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForUpdatingAtPath:",  v6));
      [v8 seekToEndOfFile];
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v13 count]));
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - Reprocessed %@ transactions",  v9,  v10));

      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dataUsingEncoding:4]);
      [v8 writeData:v12];

      [v8 closeFile];
    }
  }
}

- (id)_processingItemsForScheduledActivity
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v4 dateByAddingTimeInterval:-self->_waitTime]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passesOfType:](self->_databaseManager, "passesOfType:", 1LL));
  v17 = (void *)PDOSTransactionCreate("PDMapsMerchantProcessingService");
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id obj = v5;
  id v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v21)
  {
    uint64_t v19 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(obj);
        }
        unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v26 + 1) + 8 * (void)i),  "deviceTransactionSourceIdentifiers",  v17));
        v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionsRequiringMerchantCleanupForTransactionSourceIdentifiers:withLastReprocessingDateBeforeDate:transactionDateWithinWindow:]( self->_databaseManager,  "transactionsRequiringMerchantCleanupForTransactionSourceIdentifiers:withLastReprocessingDateBef oreDate:transactionDateWithinWindow:",  v7,  v20,  1814400.0));
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        id v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v23;
          do
          {
            for (j = 0LL; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v23 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)j);
              dispatch_queue_attr_t v14 = objc_alloc_init(&OBJC_CLASS___PDMapsMerchantProcessingItem);
              -[PDMapsMerchantProcessingItem setTransaction:](v14, "setTransaction:", v13);
              -[PDMapsMerchantProcessingItem setTransactionSourceIdentifiers:]( v14,  "setTransactionSourceIdentifiers:",  v7);
              -[NSMutableArray addObject:](v3, "addObject:", v14);
            }

            id v10 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }

          while (v10);
        }
      }

      id v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }

    while (v21);
  }

  id v15 = -[NSMutableArray copy](v3, "copy");
  return v15;
}

- (void)_processItem:(id)a3
{
  id v4 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue([v4 transaction]);
  databaseManager = self->_databaseManager;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 transactionSourceIdentifiers]);

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 anyObject]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUniqueIdentifierForTransactionSourceIdentifier:]( databaseManager,  "passUniqueIdentifierForTransactionSourceIdentifier:",  v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager defaultPaymentApplicationForPassUniqueIdentifier:]( self->_databaseManager,  "defaultPaymentApplicationForPassUniqueIdentifier:",  v8));
  if (([v12 processedForMerchantCleanup] & 1) == 0)
  {
    [v12 setProcessedForLocation:1];
    [v12 setProcessedForStations:1];
    [v12 setProcessedForMerchantCleanup:1];
  }

  transactionProcessor = self->_transactionProcessor;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 transactionSourceIdentifier]);
  -[PDPaymentTransactionProcessor processPaymentTransaction:forTransactionSourceIdentifier:]( transactionProcessor,  "processPaymentTransaction:forTransactionSourceIdentifier:",  v12,  v11);
}

- (void).cxx_destruct
{
}

@end