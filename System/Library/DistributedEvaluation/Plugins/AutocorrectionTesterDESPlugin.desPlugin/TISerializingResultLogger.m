@interface TISerializingResultLogger
- (BOOL)bufferEmpty;
- (BOOL)bufferFull;
- (NSArray)partfileArchivePaths;
- (NSMutableArray)partfileArchivePathsMutable;
- (NSMutableArray)resultsBuffer;
- (NSURL)partfileURL;
- (OS_dispatch_queue)logSerializationQueue;
- (OS_dispatch_queue)partfileArchivePathsQueue;
- (TISerializingResultLogger)initWithOutputURL:(id)a3 flushThreshold:(id)a4;
- (id)allResults;
- (id)currentPartfileArchivePath;
- (unint64_t)flushThreshold;
- (unint64_t)partfileCount;
- (void)addResult:(id)a3;
- (void)flushBufferWithCompletionHandler:(id)a3;
- (void)serializeResultsArray:(id)a3;
@end

@implementation TISerializingResultLogger

- (TISerializingResultLogger)initWithOutputURL:(id)a3 flushThreshold:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___TISerializingResultLogger;
  v8 = -[TISerializingResultLogger init](&v26, "init");
  v9 = v8;
  if (v8)
  {
    v8->_partfileCount = 0LL;
    if (v7) {
      id v10 = [v7 unsignedIntegerValue];
    }
    else {
      id v10 = &stru_1A8 + 76;
    }
    v9->_flushThreshold = (unint64_t)v10;
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathExtension:@"part"]);
    partfileURL = v9->_partfileURL;
    v9->_partfileURL = (NSURL *)v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    resultsBuffer = v9->_resultsBuffer;
    v9->_resultsBuffer = v13;

    dispatch_queue_attr_t v15 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_DEFAULT, 0);
    v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.autocorrection_tester.LogSerializationQueue", v16);
    logSerializationQueue = v9->_logSerializationQueue;
    v9->_logSerializationQueue = (OS_dispatch_queue *)v17;

    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    partfileArchivePathsMutable = v9->_partfileArchivePathsMutable;
    v9->_partfileArchivePathsMutable = v19;

    dispatch_queue_attr_t v21 = dispatch_queue_attr_make_with_qos_class(&_dispatch_queue_attr_concurrent, QOS_CLASS_DEFAULT, 0);
    v22 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v21);
    dispatch_queue_t v23 = dispatch_queue_create("com.apple.autocorrection_tester.partfileArchivePathsQueue", v22);
    partfileArchivePathsQueue = v9->_partfileArchivePathsQueue;
    v9->_partfileArchivePathsQueue = (OS_dispatch_queue *)v23;
  }

  return v9;
}

- (NSArray)partfileArchivePaths
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_11A44;
  uint64_t v11 = sub_11A54;
  id v12 = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TISerializingResultLogger partfileArchivePathsQueue](self, "partfileArchivePathsQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_11A5C;
  v6[3] = &unk_88D50;
  v6[4] = self;
  v6[5] = &v7;
  TIDispatchSync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (id)currentPartfileArchivePath
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TISerializingResultLogger partfileURL](self, "partfileURL"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu",  -[TISerializingResultLogger partfileCount](self, "partfileCount")));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingString:v5]);

  ++self->_partfileCount;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TISerializingResultLogger partfileArchivePathsQueue](self, "partfileArchivePathsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_11BB0;
  block[3] = &unk_88D78;
  block[4] = self;
  id v8 = v6;
  id v13 = v8;
  dispatch_barrier_sync(v7, block);

  uint64_t v9 = v13;
  id v10 = v8;

  return v10;
}

- (void)addResult:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TISerializingResultLogger resultsBuffer](self, "resultsBuffer"));
  [v5 addObject:v4];

  if (-[TISerializingResultLogger bufferFull](self, "bufferFull")) {
    -[TISerializingResultLogger flushBufferWithCompletionHandler:](self, "flushBufferWithCompletionHandler:", 0LL);
  }
}

- (BOOL)bufferFull
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TISerializingResultLogger resultsBuffer](self, "resultsBuffer"));
  id v4 = [v3 count];
  LOBYTE(v2) = v4 >= (id)-[TISerializingResultLogger flushThreshold](v2, "flushThreshold");

  return (char)v2;
}

- (BOOL)bufferEmpty
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TISerializingResultLogger resultsBuffer](self, "resultsBuffer"));
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (void)flushBufferWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TISerializingResultLogger resultsBuffer](self, "resultsBuffer"));
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  resultsBuffer = self->_resultsBuffer;
  self->_resultsBuffer = v6;

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TISerializingResultLogger logSerializationQueue](self, "logSerializationQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_11DC0;
  v11[3] = &unk_88DA0;
  v11[4] = self;
  id v12 = v5;
  id v13 = v4;
  id v9 = v4;
  id v10 = v5;
  TIDispatchAsync(v8, v11);
}

- (void)serializeResultsArray:(id)a3
{
  uint64_t v6 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  &v6));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TISerializingResultLogger currentPartfileArchivePath](self, "currentPartfileArchivePath"));
    [v4 writeToFile:v5 atomically:1];
  }
}

- (id)allResults
{
  if (!-[TISerializingResultLogger bufferEmpty](self, "bufferEmpty"))
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_120B4;
    v25[3] = &unk_88DC8;
    dispatch_semaphore_t v26 = dispatch_semaphore_create(0LL);
    BOOL v3 = v26;
    -[TISerializingResultLogger flushBufferWithCompletionHandler:](self, "flushBufferWithCompletionHandler:", v25);
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[TISerializingResultLogger partfileArchivePaths](self, "partfileArchivePaths"));
  id v5 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v8);
        id v10 = objc_autoreleasePoolPush();
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v9));
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray);
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSMutableString);
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
        dispatch_queue_attr_t v15 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v12,  v13,  v14,  objc_opt_class(&OBJC_CLASS___AutocorrectionResult),  0LL);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        uint64_t v20 = 0LL;
        dispatch_queue_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v16,  v11,  &v20));
        -[NSMutableArray addObjectsFromArray:](v4, "addObjectsFromArray:", v17);

        objc_autoreleasePoolPop(v10);
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v6);
  }

  return v4;
}

- (unint64_t)partfileCount
{
  return self->_partfileCount;
}

- (unint64_t)flushThreshold
{
  return self->_flushThreshold;
}

- (NSMutableArray)partfileArchivePathsMutable
{
  return self->_partfileArchivePathsMutable;
}

- (OS_dispatch_queue)partfileArchivePathsQueue
{
  return self->_partfileArchivePathsQueue;
}

- (NSMutableArray)resultsBuffer
{
  return self->_resultsBuffer;
}

- (OS_dispatch_queue)logSerializationQueue
{
  return self->_logSerializationQueue;
}

- (NSURL)partfileURL
{
  return self->_partfileURL;
}

- (void).cxx_destruct
{
}

@end