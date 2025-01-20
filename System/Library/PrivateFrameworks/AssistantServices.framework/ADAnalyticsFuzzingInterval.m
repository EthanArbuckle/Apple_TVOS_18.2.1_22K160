@interface ADAnalyticsFuzzingInterval
- (ADAnalyticsFuzzingInterval)initWithStartTime:(unint64_t)a3;
- (NSString)streamUID;
- (int64_t)offset;
- (unint64_t)endTime;
- (unint64_t)startTime;
- (void)setEndTime:(unint64_t)a3;
@end

@implementation ADAnalyticsFuzzingInterval

- (ADAnalyticsFuzzingInterval)initWithStartTime:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ADAnalyticsFuzzingInterval;
  v4 = -[ADAnalyticsFuzzingInterval init](&v11, "init");
  v5 = v4;
  if (v4)
  {
    v4->_startTime = a3;
    v6 = objc_alloc_init(&OBJC_CLASS___NSUUID);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v6, "UUIDString"));
    streamUID = v5->_streamUID;
    v5->_streamUID = (NSString *)v7;

    LODWORD(v6) = arc4random_uniform(v9);
    v5->_offset = v6 - 2 * arc4random_uniform(2u) * (_DWORD)v6;
  }

  return v5;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (NSString)streamUID
{
  return self->_streamUID;
}

- (int64_t)offset
{
  return self->_offset;
}

- (unint64_t)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(unint64_t)a3
{
  self->_endTime = a3;
}

- (void).cxx_destruct
{
}

@end