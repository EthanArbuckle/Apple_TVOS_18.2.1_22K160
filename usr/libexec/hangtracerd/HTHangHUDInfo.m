@interface HTHangHUDInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isCurrent:(unint64_t)a3 withHUDUpdateInterval:(double)a4;
- (BOOL)isTimedOut;
- (BOOL)timedOut;
- (HTHangHUDInfo)initWithCoder:(id)a3;
- (HTHangHUDInfo)initWithHangStartTime:(unint64_t)a3 hangEndTime:(unint64_t)a4 receivedTimestamp:(unint64_t)a5 hangDurationMS:(double)a6 hudString:(id)a7 shortenedBundle:(id)a8 bundleId:(id)a9 timedOut:(BOOL)a10;
- (NSString)bundleId;
- (NSString)hudString;
- (NSString)shortenedBundle;
- (double)hangDurationMS;
- (id)getHangHUDInfoKey;
- (unint64_t)compareValue;
- (unint64_t)hangEndTime;
- (unint64_t)hangStartTime;
- (unint64_t)receivedTimestamp;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HTHangHUDInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HTHangHUDInfo)initWithHangStartTime:(unint64_t)a3 hangEndTime:(unint64_t)a4 receivedTimestamp:(unint64_t)a5 hangDurationMS:(double)a6 hudString:(id)a7 shortenedBundle:(id)a8 bundleId:(id)a9 timedOut:(BOOL)a10
{
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___HTHangHUDInfo;
  v21 = -[HTHangHUDInfo init](&v24, "init");
  v22 = v21;
  if (v21)
  {
    v21->_hangStartTime = a3;
    v21->_hangEndTime = a4;
    v21->_receivedTimestamp = a5;
    v21->_hangDurationMS = a6;
    objc_storeStrong((id *)&v21->_hudString, a7);
    objc_storeStrong((id *)&v22->_shortenedBundle, a8);
    objc_storeStrong((id *)&v22->_bundleId, a9);
    v22->_timedOut = a10;
  }

  return v22;
}

- (HTHangHUDInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeInt64ForKey:@"hangStartTime"];
  id v6 = [v4 decodeInt64ForKey:@"hangEndTime"];
  id v7 = [v4 decodeInt64ForKey:@"receivedTimestamp"];
  [v4 decodeDoubleForKey:@"hangDurationMS"];
  double v9 = v8;
  id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"hudString"];
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"shortenedBundle"];
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"bundleId"];
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  unsigned __int8 v16 = [v4 decodeBoolForKey:@"timedOut"];

  LOBYTE(v19) = v16;
  v17 = -[HTHangHUDInfo initWithHangStartTime:hangEndTime:receivedTimestamp:hangDurationMS:hudString:shortenedBundle:bundleId:timedOut:]( self,  "initWithHangStartTime:hangEndTime:receivedTimestamp:hangDurationMS:hudString:shortenedBundle:bundleId:timedOut:",  v5,  v6,  v7,  v11,  v13,  v15,  v9,  v19);

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t hangStartTime = self->_hangStartTime;
  id v5 = a3;
  [v5 encodeInt64:hangStartTime forKey:@"hangStartTime"];
  [v5 encodeInt64:self->_hangEndTime forKey:@"hangEndTime"];
  [v5 encodeInt64:self->_receivedTimestamp forKey:@"receivedTimestamp"];
  [v5 encodeDouble:@"hangDurationMS" forKey:self->_hangDurationMS];
  [v5 encodeObject:self->_hudString forKey:@"hudString"];
  [v5 encodeObject:self->_shortenedBundle forKey:@"shortenedBundle"];
  [v5 encodeObject:self->_bundleId forKey:@"bundleId"];
  [v5 encodeBool:self->_timedOut forKey:@"timedOut"];
}

- (id)getHangHUDInfoKey
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%llu",  -[HTHangHUDInfo hangStartTime](self, "hangStartTime"));
}

- (BOOL)isCurrent:(unint64_t)a3 withHUDUpdateInterval:(double)a4
{
  double v7 = sub_100025798(a3 - -[HTHangHUDInfo receivedTimestamp](self, "receivedTimestamp"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[HTHangHUDInfo getHangHUDInfoKey](self, "getHangHUDInfoKey"));
  id v9 = sub_1000233A4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10002C8E8((uint64_t)v8, v10, v7);
  }

  if (-[HTHangHUDInfo hangEndTime](self, "hangEndTime") == 0x7FFFFFFFFFFFFFFFLL
    || sub_100025798(a3 - -[HTHangHUDInfo hangEndTime](self, "hangEndTime")) >= 200.0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[HangDataStreamStatusTracker sharedInstance]( &OBJC_CLASS___HangDataStreamStatusTracker,  "sharedInstance"));
    unsigned __int8 v13 = [v12 isHangEndedWithDuration:v8 updateInterval:v7 hangID:a4];

    char v11 = v13 ^ 1;
  }

  else
  {
    char v11 = 1;
  }

  return v11;
}

- (unint64_t)compareValue
{
  return self->_hangStartTime;
}

- (BOOL)isTimedOut
{
  return self->_timedOut;
}

- (unint64_t)hangStartTime
{
  return self->_hangStartTime;
}

- (unint64_t)hangEndTime
{
  return self->_hangEndTime;
}

- (unint64_t)receivedTimestamp
{
  return self->_receivedTimestamp;
}

- (double)hangDurationMS
{
  return self->_hangDurationMS;
}

- (NSString)hudString
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSString)shortenedBundle
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (NSString)bundleId
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (BOOL)timedOut
{
  return self->_timedOut;
}

- (void).cxx_destruct
{
}

@end