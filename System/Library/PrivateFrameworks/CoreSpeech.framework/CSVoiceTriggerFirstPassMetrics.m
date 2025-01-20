@interface CSVoiceTriggerFirstPassMetrics
+ (CSVoiceTriggerFirstPassMetrics)CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:(unint64_t)a3 firstPassInfoProcessedTime:(unint64_t)a4;
- (NSNumber)firstPassInfoGeneratedTime;
- (NSNumber)firstPassInfoProcessedTime;
- (id)_initWithFirstPassInfoGeneratedTime:(unint64_t)a3 firstPassInfoProcessedTime:(unint64_t)a4;
@end

@implementation CSVoiceTriggerFirstPassMetrics

- (id)_initWithFirstPassInfoGeneratedTime:(unint64_t)a3 firstPassInfoProcessedTime:(unint64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerFirstPassMetrics;
  v6 = -[CSVoiceTriggerFirstPassMetrics init](&v12, "init");
  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    firstPassInfoGeneratedTime = v6->_firstPassInfoGeneratedTime;
    v6->_firstPassInfoGeneratedTime = (NSNumber *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
    firstPassInfoProcessedTime = v6->_firstPassInfoProcessedTime;
    v6->_firstPassInfoProcessedTime = (NSNumber *)v9;
  }

  return v6;
}

- (NSNumber)firstPassInfoGeneratedTime
{
  return self->_firstPassInfoGeneratedTime;
}

- (NSNumber)firstPassInfoProcessedTime
{
  return self->_firstPassInfoProcessedTime;
}

- (void).cxx_destruct
{
}

+ (CSVoiceTriggerFirstPassMetrics)CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:(unint64_t)a3 firstPassInfoProcessedTime:(unint64_t)a4
{
  return (CSVoiceTriggerFirstPassMetrics *) -[CSVoiceTriggerFirstPassMetrics _initWithFirstPassInfoGeneratedTime:firstPassInfoProcessedTime:]( objc_alloc(&OBJC_CLASS___CSVoiceTriggerFirstPassMetrics),  "_initWithFirstPassInfoGeneratedTime:firstPassInfoProcessedTime:",  a3,  a4);
}

@end