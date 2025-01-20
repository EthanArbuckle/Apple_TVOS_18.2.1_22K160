@interface OSLogStatistics
- (NSDate)end;
- (NSDate)start;
- (NSError)processingError;
- (NSString)archivePath;
- (OSLogEventSource)eventSource;
- (OSLogStatistics)initWithLogArchivePath:(id)a3 errorOut:(id *)a4;
- (OSLogStatistics)initWithLogArchivePath:(id)a3 forRelativePaths:(id)a4 errorOut:(id *)a5;
- (id)_initializeEventSourceWithPaths:(id)a3;
- (id)aggregationForStartDate:(id)a3 endDate:(id)a4 predicate:(id)a5 withOptions:(unint64_t)a6 errorOut:(id *)a7;
- (void)setEventSource:(id)a3;
- (void)setProcessingError:(id)a3;
@end

@implementation OSLogStatistics

- (OSLogStatistics)initWithLogArchivePath:(id)a3 forRelativePaths:(id)a4 errorOut:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___OSLogStatistics;
  v11 = -[OSLogStatistics init](&v18, sel_init);
  v12 = v11;
  if (v11
    && (objc_storeStrong((id *)&v11->_archivePath, a3),
        -[OSLogStatistics _initializeEventSourceWithPaths:](v12, "_initializeEventSourceWithPaths:", v10),
        (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = (void *)v13;
    _logHandle();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v14;
      _os_log_error_impl( &dword_186981000,  v15,  OS_LOG_TYPE_ERROR,  "Encountered error during initialisation of OSLogStatistics: %@",  buf,  0xCu);
    }

    if (a5) {
      *a5 = v14;
    }

    v16 = 0LL;
  }

  else
  {
    v16 = v12;
  }

  return v16;
}

- (OSLogStatistics)initWithLogArchivePath:(id)a3 errorOut:(id *)a4
{
  return -[OSLogStatistics initWithLogArchivePath:forRelativePaths:errorOut:]( self,  "initWithLogArchivePath:forRelativePaths:errorOut:",  a3,  0LL,  a4);
}

- (NSDate)start
{
  return -[OSLogEventSource oldestDate](self->_eventSource, "oldestDate");
}

- (NSDate)end
{
  return -[OSLogEventSource newestDate](self->_eventSource, "newestDate");
}

- (id)_initializeEventSourceWithPaths:(id)a3
{
  v29[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = -[OSLogStatistics archivePath](self, "archivePath");
  if (v5
    && (v6 = (void *)MEMORY[0x189604030],
        -[OSLogStatistics archivePath](self, "archivePath"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        [v6 fileURLWithPath:v7 isDirectory:0],
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    if (v4) {
      +[OSLogEventStore storeWithArchiveURL:relativePaths:]( &OBJC_CLASS___OSLogEventStore,  "storeWithArchiveURL:relativePaths:",  v8,  v4);
    }
    else {
      +[OSLogEventStore storeWithArchiveURL:](&OBJC_CLASS___OSLogEventStore, "storeWithArchiveURL:", v8);
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
LABEL_15:
      v12 = (void *)MEMORY[0x189607870];
      uint64_t v28 = *MEMORY[0x1896075E0];
      v29[0] = @"Failed to initialize event store";
      [MEMORY[0x189603F68] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 errorWithDomain:*MEMORY[0x189607688] code:1 userInfo:v13];
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
  }

  else
  {
    if (v4) {
      +[OSLogEventStore localStoreWithRelativePaths:](&OBJC_CLASS___OSLogEventStore, "localStoreWithRelativePaths:", v4);
    }
    else {
      +[OSLogEventStore localStore](&OBJC_CLASS___OSLogEventStore, "localStore");
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0LL;
    if (!v9) {
      goto LABEL_15;
    }
  }

  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = __Block_byref_object_copy__1985;
  v26 = __Block_byref_object_dispose__1986;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  v19 = __Block_byref_object_copy__1985;
  v20 = __Block_byref_object_dispose__1986;
  id v21 = 0LL;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __51__OSLogStatistics__initializeEventSourceWithPaths___block_invoke;
  v15[3] = &unk_189F0F4E8;
  v15[4] = &v16;
  v15[5] = &v22;
  [v9 prepareWithCompletionHandler:v15];
  id v10 = (void *)v17[5];
  if (v10)
  {
    objc_storeStrong((id *)&self->_eventSource, v10);
    id v11 = 0LL;
  }

  else
  {
    id v11 = (id)v23[5];
  }

  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
LABEL_16:

  return v11;
}

- (id)aggregationForStartDate:(id)a3 endDate:(id)a4 predicate:(id)a5 withOptions:(unint64_t)a6 errorOut:(id *)a7
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = -[OSLogEventStream initWithSource:]( objc_alloc(&OBJC_CLASS___OSLogEventStream),  "initWithSource:",  self->_eventSource);
  -[OSLogEventStreamBase setFlags:](v15, "setFlags:", 20LL);
  _logHandle();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2112;
    id v45 = v14;
    __int16 v46 = 2048;
    unint64_t v47 = a6;
    _os_log_impl( &dword_186981000,  v16,  OS_LOG_TYPE_DEFAULT,  "Starting aggregation with start date : %@, end date : %@, predicate: %@, and flags %lu",  buf,  0x2Au);
  }

  if ((a6 & 1) != 0) {
    -[OSLogEventStreamBase setFlags:](v15, "setFlags:", -[OSLogEventStreamBase flags](v15, "flags") | 1);
  }
  if ((a6 & 2) != 0) {
    -[OSLogEventStreamBase setFlags:](v15, "setFlags:", -[OSLogEventStreamBase flags](v15, "flags") ^ 2);
  }
  if ((a6 & 4) != 0) {
    -[OSLogEventStreamBase setFlags:](v15, "setFlags:", -[OSLogEventStreamBase flags](v15, "flags") | 0x20);
  }
  if ((a6 & 8) != 0) {
    -[OSLogEventStreamBase setFlags:](v15, "setFlags:", -[OSLogEventStreamBase flags](v15, "flags") | 0x200);
  }
  -[OSLogEventStream setFilterPredicate:](v15, "setFilterPredicate:", v14);
  if (v13)
  {
    [v13 timeIntervalSince1970];
    uint64_t v18 = v17;
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  v19 = -[OSLogStatisticsAggregation initWithLabel:tier:]( objc_alloc(&OBJC_CLASS___OSLogStatisticsAggregation),  "initWithLabel:tier:",  @"All",  1LL);
  objc_initWeak(&location, v15);
  dispatch_semaphore_t v20 = dispatch_semaphore_create(0LL);
  uint64_t v21 = MEMORY[0x1895F87A8];
  v37[0] = MEMORY[0x1895F87A8];
  v37[1] = 3221225472LL;
  v37[2] = __82__OSLogStatistics_aggregationForStartDate_endDate_predicate_withOptions_errorOut___block_invoke;
  v37[3] = &unk_189F0F510;
  id v22 = v13;
  id v38 = v22;
  v40[1] = v18;
  objc_copyWeak(v40, &location);
  v23 = v19;
  v39 = v23;
  -[OSLogEventStreamBase setEventHandler:](v15, "setEventHandler:", v37);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  LOBYTE(v45) = 0;
  v34[0] = v21;
  v34[1] = 3221225472LL;
  v34[2] = __82__OSLogStatistics_aggregationForStartDate_endDate_predicate_withOptions_errorOut___block_invoke_2;
  v34[3] = &unk_189F0F538;
  v36 = buf;
  uint64_t v24 = v20;
  v35 = v24;
  -[OSLogEventStreamBase setInvalidationHandler:](v15, "setInvalidationHandler:", v34);
  v25 = v12;
  if (!v12)
  {
    [MEMORY[0x189603F50] distantPast];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[OSLogEventStream activateStreamFromDate:](v15, "activateStreamFromDate:", v25);
  if (!v12) {

  }
  dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
  _logHandle();
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v42 = 0;
    _os_log_impl(&dword_186981000, v26, OS_LOG_TYPE_DEFAULT, "Finished enumerating all events.", v42, 2u);
  }

  -[OSLogStatistics processingError](self, "processingError");
  id v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    _logHandle();
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = -[OSLogStatistics processingError](self, "processingError");
      *(_DWORD *)v42 = 138412290;
      uint64_t v43 = v32;
      v33 = (void *)v32;
      _os_log_error_impl( &dword_186981000,  v28,  OS_LOG_TYPE_ERROR,  "Encountered error during enumeration of tracepoints: %@",  v42,  0xCu);
    }

    if (a7)
    {
      -[OSLogStatistics processingError](self, "processingError");
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  v29 = v35;
  v30 = v23;

  _Block_object_dispose(buf, 8);
  objc_destroyWeak(v40);

  objc_destroyWeak(&location);
  return v30;
}

- (OSLogEventSource)eventSource
{
  return self->_eventSource;
}

- (void)setEventSource:(id)a3
{
}

- (NSError)processingError
{
  return self->_processingError;
}

- (void)setProcessingError:(id)a3
{
}

- (NSString)archivePath
{
  return self->_archivePath;
}

- (void).cxx_destruct
{
}

void __82__OSLogStatistics_aggregationForStartDate_endDate_predicate_withOptions_errorOut___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (*(void *)(a1 + 32)
    && (uint64_t v4 = [v3 unixDate],
        double v5 = (double)*(uint64_t *)v4,
        int v6 = *(_DWORD *)(v4 + 8),
        id v3 = v8,
        (double)v6 / 1000000.0 + v5 > *(double *)(a1 + 56)))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained invalidate];
  }

  else if ([v3 type] == 1536 || objc_msgSend(v8, "type") == 1024)
  {
    [*(id *)(a1 + 40) _addTraceEvent:v8];
  }
}

void __82__OSLogStatistics_aggregationForStartDate_endDate_predicate_withOptions_errorOut___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  switch(a2)
  {
    case 1LL:
      _logHandle();
      int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      __int16 v12 = 0;
      v7 = "Stream disconnected.";
      id v8 = (uint8_t *)&v12;
      break;
    case 2LL:
      _logHandle();
      int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      __int16 v11 = 0;
      v7 = "Stream backlogged, too many events.";
      id v8 = (uint8_t *)&v11;
      break;
    case 3LL:
      _logHandle();
      int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      __int16 v10 = 0;
      v7 = "Invalid position.";
      id v8 = (uint8_t *)&v10;
      break;
    case 7LL:
      _logHandle();
      int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      __int16 v9 = 0;
      v7 = "Client has insufficient permissions to access the archive.";
      id v8 = (uint8_t *)&v9;
      break;
    default:
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      goto LABEL_12;
  }

  _os_log_impl(&dword_186981000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
LABEL_11:

LABEL_12:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __51__OSLogStatistics__initializeEventSourceWithPaths___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = 40LL;
  if (v5)
  {
    v7 = v5;
  }

  else
  {
    uint64_t v6 = 32LL;
    v7 = v11;
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + v6) + 8LL);
  id v9 = v7;
  __int16 v10 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v9;
}

@end