@interface VCPProgressReporter
+ (id)reporterWithIntervalSeconds:(unint64_t)a3 andTotalJobCount:(int64_t)a4 andBlock:(id)a5;
- (VCPProgressReporter)init;
- (VCPProgressReporter)initWithIntervalSeconds:(unint64_t)a3 andTotalJobCount:(int64_t)a4 andBlock:(id)a5;
- (void)_reportProgressWithBlock:(id)a3;
- (void)dealloc;
- (void)increaseProcessedJobCountByOne;
@end

@implementation VCPProgressReporter

- (VCPProgressReporter)init
{
  return 0LL;
}

- (VCPProgressReporter)initWithIntervalSeconds:(unint64_t)a3 andTotalJobCount:(int64_t)a4 andBlock:(id)a5
{
  id v8 = a5;
  v10 = v8;
  if (!a4)
  {
    uint64_t v26 = MediaAnalysisLogLevel(v8, v9);
    if ((int)v26 >= 3)
    {
      uint64_t v28 = VCPLogInstance(v26, v27);
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      os_log_type_t v30 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v29, v30))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  v30,  "VCPProgressReporter: totalJobCount must be non-zero",  buf,  2u);
      }

      goto LABEL_17;
    }

+ (id)reporterWithIntervalSeconds:(unint64_t)a3 andTotalJobCount:(int64_t)a4 andBlock:(id)a5
{
  id v8 = a5;
  id v9 = [objc_alloc((Class)objc_opt_class(a1)) initWithIntervalSeconds:a3 andTotalJobCount:a4 andBlock:v8];

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VCPProgressReporter;
  -[VCPProgressReporter dealloc](&v3, "dealloc");
}

- (void)increaseProcessedJobCountByOne
{
  p_processedJobCount = &self->_processedJobCount;
  do
    unsigned int v3 = __ldaxr((unsigned int *)p_processedJobCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_processedJobCount));
}

- (void)_reportProgressWithBlock:(id)a3
{
  id v4 = a3;
  v6 = v4;
  signed int v7 = atomic_load((unsigned int *)&self->_processedJobCount);
  if (self->_processedJobCountOnLastUpdate != v7) {
    self->_int64_t processedJobCountOnLastUpdate = v7;
  }
  uint64_t v8 = MediaAnalysisLogLevel(v4, v5);
  if ((int)v8 >= 7)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    os_log_type_t v12 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v11, v12))
    {
      int64_t processedJobCountOnLastUpdate = self->_processedJobCountOnLastUpdate;
      int64_t totalJobCount = self->_totalJobCount;
      *(_DWORD *)buf = 134218240;
      int64_t v20 = processedJobCountOnLastUpdate;
      __int16 v21 = 2048;
      int64_t v22 = totalJobCount;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "VCPProgressReporter report: %lu / %lu", buf, 0x16u);
    }
  }

  queue = (dispatch_queue_s *)self->_queue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100016AE0;
  v17[3] = &unk_1001BA080;
  v17[4] = self;
  id v18 = v6;
  id v16 = v6;
  dispatch_async(queue, v17);
}

- (void).cxx_destruct
{
}

@end