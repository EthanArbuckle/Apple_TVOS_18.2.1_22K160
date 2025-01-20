@interface ATSLoggingProvider
- (BOOL)shouldAmendWithFile:(ktrace_file *)a3 error:(id *)a4;
- (BOOL)shouldInitializeWithLogger:(id)a3 machine:(ktrace_machine *)a4 options:(id)a5 error:(id *)a6;
- (BOOL)shouldStartTracingWithConfiguration:(ktrace_config *)a3 error:(id *)a4;
- (id)describeChunk:(ktrace_chunk *)a3;
- (void)_appendLogsToFile:(ktrace_file *)a3;
- (void)_findStartAndEndTimeForFile:(ktrace_file *)a3;
- (void)postprocessingCompleteWithFile:(ktrace_file *)a3;
@end

@implementation ATSLoggingProvider

- (BOOL)shouldInitializeWithLogger:(id)a3 machine:(ktrace_machine *)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  objc_storeStrong((id *)&self->_logger, a3);
  self->_streamingFlags = 615LL;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"predicate"]);
  if (v12)
  {
    v13 = (NSPredicate *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](&OBJC_CLASS___NSPredicate, "predicateWithFormat:", v12));
    if (!v13)
    {
      if (a6)
      {
        uint64_t v33 = 0LL;
        v25 = @"Passed predicate is invalid ('%@'); logging will be disabled";
        goto LABEL_15;
      }

- (BOOL)shouldAmendWithFile:(ktrace_file *)a3 error:(id *)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager", a3));
  v13 = v6;
  archivePath = self->_archivePath;
  if (!archivePath)
  {
    if (a4)
    {
      uint64_t v18 = @"Missing logarchive path. Use --Logging:archive=[path] to pass it";
LABEL_8:
      id v19 = sub_23E4(v18, v7, (uint64_t)archivePath, v8, v9, v10, v11, v12, v21);
      BOOL v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v19);
      goto LABEL_10;
    }

- (BOOL)shouldStartTracingWithConfiguration:(ktrace_config *)a3 error:(id *)a4
{
  return 1;
}

- (void)postprocessingCompleteWithFile:(ktrace_file *)a3
{
  if (self->_startDate && self->_endDate) {
    -[ATSLoggingProvider _appendLogsToFile:](self, "_appendLogsToFile:", a3);
  }
  else {
    -[KTProviderLogger warnWithMessage:]( self->_logger,  "warnWithMessage:",  @"os_signpost and os_log data will be missing from trace, due to error in extracting trace file start and end times.");
  }
}

- (void)_findStartAndEndTimeForFile:(ktrace_file *)a3
{
  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  if (ktrace_file_earliest_walltime(a3, &v13)
    || (uint64_t v11 = 0LL, v12 = 0LL, ktrace_file_latest_walltime(a3, &v11)))
  {
    v5 = __error();
    v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to capture earliest trace timestamp with error: %s",  strerror(*v5));
    endDate = (NSDate *)objc_claimAutoreleasedReturnValue(v6);
    -[KTProviderLogger failWithReason:](self->_logger, "failWithReason:", endDate);
  }

  else
  {
    uint64_t v8 = (NSDate *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)(int)v14 / 1000000.0 + (double)v13));
    startDate = self->_startDate;
    self->_startDate = v8;

    uint64_t v10 = (NSDate *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)(int)v12 / 1000000.0 + (double)v11));
    endDate = self->_endDate;
    self->_endDate = v10;
  }
}

- (void)_appendLogsToFile:(ktrace_file *)a3
{
  if (self->_archiveURL) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[OSLogEventStore storeWithArchiveURL:](&OBJC_CLASS___OSLogEventStore, "storeWithArchiveURL:"));
  }
  else {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[OSLogEventStore localStore](&OBJC_CLASS___OSLogEventStore, "localStore"));
  }
  v6 = v5;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = sub_2934;
  BOOL v30 = sub_2944;
  id v31 = 0LL;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_294C;
  v25[3] = &unk_41E0;
  v25[4] = self;
  v25[5] = &v26;
  [v5 prepareWithCompletionHandler:v25];
  if (v27[5])
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
    id v8 = objc_alloc(&OBJC_CLASS___OSLogEventSerializer);
    uint64_t v9 = v27[5];
    v23 = a3;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_2A30;
    v24[3] = &unk_4208;
    v24[4] = self;
    v24[5] = a3;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_2ADC;
    v21[3] = &unk_4230;
    v21[4] = self;
    uint64_t v10 = v7;
    v22 = v10;
    id v11 = [v8 initWithSource:v9 dataProcessingBlock:v24 completionBlock:v21];
    [v11 setFlags:self->_streamingFlags];
    id v12 = [v11 setFilterPredicate:self->_filterPredicate];
    if (self->_shouldRedactLogContent)
    {
      uint64_t v13 = SignpostSupportAllowlistedStringSetForCurrentDevice(v12);
      uint64_t v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472LL;
      uint64_t v18 = sub_2BC0;
      id v19 = &unk_4258;
      id v20 = (id)objc_claimAutoreleasedReturnValue(v13);
      id v14 = v20;
      uint64_t v15 = objc_retainBlock(&v16);
    }

    else
    {
      uint64_t v15 = 0LL;
    }

    objc_msgSend(v11, "setArgumentRedactionBlock:", v15, v16, v17, v18, v19);
    [v11 serializeFromDate:self->_startDate toDate:self->_endDate];
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  }

  _Block_object_dispose(&v26, 8);
}

- (id)describeChunk:(ktrace_chunk *)a3
{
  int v3 = ktrace_chunk_tag(a3, a2);
  v4 = @"log metadata";
  if (v3 != 32786) {
    v4 = 0LL;
  }
  if (v3 == 32785) {
    return @"log content";
  }
  else {
    return (id)v4;
  }
}

- (void).cxx_destruct
{
}

@end