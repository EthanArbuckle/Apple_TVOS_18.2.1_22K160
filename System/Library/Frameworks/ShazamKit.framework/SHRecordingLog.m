@interface SHRecordingLog
+ (void)powerlogCallingProcessBundleID:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (NSDate)endedRecordingDate;
- (NSDate)startedRecordingDate;
- (NSString)bundleID;
- (SHRecordingLog)initWithBundleID:(id)a3;
- (int64_t)assistantTapCount;
- (int64_t)totalTapCount;
- (void)attachedTapForClient:(int64_t)a3;
- (void)detachedTapForClient:(int64_t)a3;
@end

@implementation SHRecordingLog

- (SHRecordingLog)initWithBundleID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SHRecordingLog;
  v6 = -[SHRecordingLog init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundleID, a3);
  }

  return v7;
}

- (void)attachedTapForClient:(int64_t)a3
{
  int64x2_t v4 = vdupq_n_s64(1uLL);
  v4.i64[0] = a3 == 2;
  *(int64x2_t *)&self->_assistantTapCount = vaddq_s64(*(int64x2_t *)&self->_assistantTapCount, v4);
  if ((id)-[SHRecordingLog totalTapCount](self, "totalTapCount") == (id)1)
  {
    id v5 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    startedRecordingDate = self->_startedRecordingDate;
    self->_startedRecordingDate = v5;

    endedRecordingDate = self->_endedRecordingDate;
    self->_endedRecordingDate = 0LL;
  }

- (void)detachedTapForClient:(int64_t)a3
{
  if (a3 == 2) {
    uint64_t v4 = -1LL;
  }
  else {
    uint64_t v4 = 0LL;
  }
  v5.i64[1] = -1LL;
  v5.i64[0] = v4;
  *(int64x2_t *)&self->_assistantTapCount = vaddq_s64(*(int64x2_t *)&self->_assistantTapCount, v5);
  if (!-[SHRecordingLog totalTapCount](self, "totalTapCount"))
  {
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    endedRecordingDate = self->_endedRecordingDate;
    self->_endedRecordingDate = v6;

    objc_super v9 = (void *)objc_opt_class(self, v8);
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[SHRecordingLog bundleID](self, "bundleID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHRecordingLog startedRecordingDate](self, "startedRecordingDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHRecordingLog endedRecordingDate](self, "endedRecordingDate"));
    [v9 powerlogCallingProcessBundleID:v12 startDate:v10 endDate:v11];
  }

+ (void)powerlogCallingProcessBundleID:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v10 setValue:v9 forKey:@"BundleID"];

  [v10 setValue:v8 forKey:@"timestamp"];
  [v10 setValue:v7 forKey:@"timestampEnd"];

  uint64_t v12 = sh_log_object(v11);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412290;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Powerlogging %@", (uint8_t *)&v14, 0xCu);
  }

  PLLogRegisteredEvent(108LL, @"ShazamRecording", v10, 0LL);
}

- (NSDate)startedRecordingDate
{
  return self->_startedRecordingDate;
}

- (NSDate)endedRecordingDate
{
  return self->_endedRecordingDate;
}

- (int64_t)assistantTapCount
{
  return self->_assistantTapCount;
}

- (int64_t)totalTapCount
{
  return self->_totalTapCount;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
}

@end