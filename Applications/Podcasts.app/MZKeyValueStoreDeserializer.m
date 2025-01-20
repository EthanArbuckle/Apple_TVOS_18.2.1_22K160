@interface MZKeyValueStoreDeserializer
+ (BOOL)validateDataFromSuccessfulSetTransaction:(id)a3 forKey:(id)a4;
+ (unint64_t)responseTypeForTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 mismatch:(BOOL)a6;
- (BOOL)authenticationError;
- (BOOL)genericError;
- (BOOL)hasBackoff;
- (BOOL)isDirty;
- (BOOL)success;
- (BOOL)unsupportedClient;
- (BOOL)validationError;
- (BOOL)versionMismatch;
- (MZKeyValueStoreController)keyValueStoreController;
- (MZKeyValueStoreDeserializeOperationDelegate)delegate;
- (MZKeyValueStoreDeserializer)initWithTransaction:(id)a3 response:(id)a4;
- (MZKeyValueStoreTransaction)transaction;
- (NSDictionary)serverResponse;
- (NSError)requestError;
- (NSMutableArray)pendingDeserializations;
- (int64_t)status;
- (unint64_t)retrySeconds;
- (void)_delegateOperationDidFinish;
- (void)deserialize;
- (void)finishedDeserializationForKey:(id)a3;
- (void)mergeData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6 finishedBlock:(id)a7;
- (void)setDelegate:(id)a3;
- (void)setIsDirty:(BOOL)a3;
- (void)setKeyValueStoreController:(id)a3;
- (void)setPendingDeserializations:(id)a3;
- (void)setServerResponse:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setTransaction:(id)a3;
@end

@implementation MZKeyValueStoreDeserializer

- (MZKeyValueStoreDeserializer)initWithTransaction:(id)a3 response:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MZKeyValueStoreDeserializer;
  v9 = -[MZKeyValueStoreDeserializer init](&v17, "init");
  if (v9)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    pendingDeserializations = v9->_pendingDeserializations;
    v9->_pendingDeserializations = v10;

    objc_storeStrong((id *)&v9->_transaction, a3);
    objc_storeStrong((id *)&v9->_serverResponse, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForKey:@"status"]);
    v13 = v12;
    if (v12)
    {
      id v14 = [v12 integerValue];
      v9->_status = (int64_t)v14;
      if (v14 == (id)1197)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"retry-seconds"]);
        v9->_retrySeconds = (unint64_t)[v15 unsignedIntegerValue];
      }
    }

    else
    {
      v9->_status = -1LL;
    }
  }

  return v9;
}

- (void)deserialize
{
  self->_isDirty = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer serverResponse](self, "serverResponse"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"values"]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer serverResponse](self, "serverResponse"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"domain-version"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  id v8 = &selRef_setValue_;
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0 && (objc_opt_respondsToSelector(v6, "stringValue") & 1) != 0)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 stringValue]);

    v6 = (void *)v9;
  }

  v10 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v4 count]);
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v11 = v4;
  id v12 = [v11 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v52;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v52 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v51 + 1) + 8 * (void)i) valueForKey:@"key"]);
        -[NSMutableArray addObject:](v10, "addObject:", v16);
      }

      id v13 = [v11 countByEnumeratingWithState:&v51 objects:v56 count:16];
    }

    while (v13);
  }

  -[MZKeyValueStoreDeserializer setPendingDeserializations:](self, "setPendingDeserializations:", v10);
  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 processor]);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
  [v18 transaction:v19 willProcessResponseWithDomainVersion:v6];

  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v20 = v11;
  id v21 = [v20 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (!v21)
  {

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
    v39 = (void *)objc_claimAutoreleasedReturnValue([v38 processor]);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
    [v39 transaction:v40 didProcessResponseWithDomainVersion:v6];

LABEL_24:
    -[MZKeyValueStoreDeserializer _delegateOperationDidFinish](self, "_delegateOperationDidFinish");
    goto LABEL_25;
  }

  v43 = v6;
  id obj = v20;
  v42 = v10;
  uint64_t v22 = *(void *)v48;
  id v41 = v21;
  id v23 = v21;
  do
  {
    v24 = 0LL;
    v25 = v8[306];
    do
    {
      if (*(void *)v48 != v22) {
        objc_enumerationMutation(obj);
      }
      v26 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "valueForKey:", @"key", v41, v42));
      v28 = (void *)objc_claimAutoreleasedReturnValue([v26 valueForKey:@"version"]);
      uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v28, v29) & 1) == 0 && (objc_opt_respondsToSelector(v28, v25) & 1) != 0)
      {
        uint64_t v30 = objc_claimAutoreleasedReturnValue([v28 stringValue]);

        v28 = (void *)v30;
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue([v26 valueForKey:@"value"]);
      v32 = (void *)objc_claimAutoreleasedReturnValue([v31 MZDataByInflatingWithGZip]);
      BOOL v33 = -[MZKeyValueStoreDeserializer versionMismatch](self, "versionMismatch");
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_100047D88;
      v45[3] = &unk_100241B88;
      v45[4] = self;
      id v46 = v27;
      id v34 = v27;
      -[MZKeyValueStoreDeserializer mergeData:forKey:version:mismatch:finishedBlock:]( self,  "mergeData:forKey:version:mismatch:finishedBlock:",  v32,  v34,  v28,  v33,  v45);

      v24 = (char *)v24 + 1;
    }

    while (v23 != v24);
    id v23 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
    id v8 = &selRef_setValue_;
  }

  while (v23);
  id v20 = obj;

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 processor]);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
  v6 = v43;
  [v36 transaction:v37 didProcessResponseWithDomainVersion:v43];

  v10 = v42;
  if (!v41) {
    goto LABEL_24;
  }
LABEL_25:
}

- (void)mergeData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6 finishedBlock:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = (void (**)(id, void))a7;
  v16 = (void *)objc_opt_class(self);
  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
  id v18 = [v16 responseTypeForTransaction:v17 withData:v12 forKey:v13 mismatch:v8];

  switch((unint64_t)v18)
  {
    case 0uLL:
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 processor]);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
      [v21 successfulGetTransaction:v22 withData:v12 forKey:v13 version:v14 finishedBlock:v15];
      goto LABEL_5;
    case 1uLL:
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 processor]);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
      [v21 successfulSetTransaction:v22 withData:v12 forKey:v13 version:v14 finishedBlock:v15];
      goto LABEL_5;
    case 2uLL:
    case 3uLL:
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 processor]);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
      [v21 conflictForSetTransaction:v22 withData:v12 forKey:v13 version:v14 finishedBlock:v15];
LABEL_5:

      break;
    case 4uLL:
      uint64_t v23 = _MTLogCategoryCloudSync(v19);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
        v26[0] = 67109376;
        v26[1] = [v25 type];
        __int16 v27 = 1024;
        BOOL v28 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_FAULT,  "Unacceptable combination of transaction type (%d) and mismatch (%d). Shouldn't reach this branch.",  (uint8_t *)v26,  0xEu);
      }

      v15[2](v15, 0LL);
      break;
    default:
      break;
  }
}

+ (unint64_t)responseTypeForTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 mismatch:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  unsigned int v13 = [v12 type];
  unsigned int v14 = [v12 type];
  unsigned int v15 = [v12 type];

  if (v14 != 2 || v6)
  {
    uint64_t v17 = 4LL;
    if (v15 == 2 && v6) {
      uint64_t v17 = 2LL;
    }
  }

  else
  {
    unsigned int v16 = [(id)objc_opt_class(a1) validateDataFromSuccessfulSetTransaction:v10 forKey:v11];
    uint64_t v17 = 3LL;
    if (v16) {
      uint64_t v17 = 1LL;
    }
  }

  if (v13 != 1 || v6) {
    unint64_t v19 = v17;
  }
  else {
    unint64_t v19 = 0LL;
  }

  return v19;
}

+ (BOOL)validateDataFromSuccessfulSetTransaction:(id)a3 forKey:(id)a4
{
  id v4 = [a3 length];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = _MTLogCategoryCloudSync(v4);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_FAULT,  "Responses to successful SET transactions with mismatch=NO shouldn't return any data",  v9,  2u);
    }
  }

  return v5 == 0LL;
}

- (void)finishedDeserializationForKey:(id)a3
{
  id v8 = a3;
  id v4 = self->_pendingDeserializations;
  objc_sync_enter(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer pendingDeserializations](self, "pendingDeserializations"));
  [v5 removeObjectIdenticalTo:v8];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer pendingDeserializations](self, "pendingDeserializations"));
  id v7 = [v6 count];

  if (!v7) {
    -[MZKeyValueStoreDeserializer _delegateOperationDidFinish](self, "_delegateOperationDidFinish");
  }
  objc_sync_exit(v4);
}

- (void)_delegateOperationDidFinish
{
  id v7 = self;
  if (!-[MZKeyValueStoreDeserializer versionMismatch](v7, "versionMismatch"))
  {
    BOOL v5 = 0LL;
LABEL_9:
    v2 = v7;
    goto LABEL_10;
  }

  v2 = v7;
  if (v7->_isDirty)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](v7, "transaction"));
    if ([v3 type] == 2)
    {
      BOOL v5 = 1LL;
    }

    else
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](v7, "transaction"));
      BOOL v5 = [v4 type] == 3;
    }

    goto LABEL_9;
  }

  BOOL v5 = 0LL;
LABEL_10:
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer delegate](v2, "delegate"));
  [v6 deserializeOperationDidFinish:v7 shouldReschedule:v5];
}

- (BOOL)unsupportedClient
{
  return self->_status == 1101;
}

- (BOOL)authenticationError
{
  return self->_status == -4;
}

- (BOOL)validationError
{
  return self->_status == -2;
}

- (BOOL)genericError
{
  return self->_status == -3;
}

- (BOOL)success
{
  return self->_status == 0;
}

- (BOOL)versionMismatch
{
  return self->_status == 1198;
}

- (NSError)requestError
{
  if (-[MZKeyValueStoreDeserializer success](self, "success"))
  {
    v3 = 0LL;
  }

  else
  {
    id v4 = &qword_1002419C8;
    do
    {
      uint64_t v6 = *v4;
      v4 += 4;
      uint64_t v5 = v6;
    }

    while (v6 != -9999 && v5 != self->_status);
    uint64_t v8 = *(v4 - 2);
    if (*((_BYTE *)v4 - 8)) {
      uint64_t v9 = @" Please enable logging and file a bug.";
    }
    else {
      uint64_t v9 = &stru_100248948;
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (status = %d)%@",  v8,  self->_status,  v9));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v10,  NSLocalizedDescriptionKey,  0LL));
    v3 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"MZBookkeeperRequestErrorDomain",  self->_status,  v11);
  }

  return v3;
}

- (BOOL)hasBackoff
{
  return -[MZKeyValueStoreDeserializer retrySeconds](self, "retrySeconds") != 0;
}

- (MZKeyValueStoreTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (MZKeyValueStoreController)keyValueStoreController
{
  return self->_keyValueStoreController;
}

- (void)setKeyValueStoreController:(id)a3
{
}

- (NSDictionary)serverResponse
{
  return self->_serverResponse;
}

- (void)setServerResponse:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (unint64_t)retrySeconds
{
  return self->_retrySeconds;
}

- (MZKeyValueStoreDeserializeOperationDelegate)delegate
{
  return (MZKeyValueStoreDeserializeOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)pendingDeserializations
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setPendingDeserializations:(id)a3
{
}

- (BOOL)isDirty
{
  return self->_isDirty;
}

- (void)setIsDirty:(BOOL)a3
{
  self->_isDirty = a3;
}

- (void).cxx_destruct
{
}

@end