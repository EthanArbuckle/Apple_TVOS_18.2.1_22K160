@interface CSAttSiriAttendingTriggerEventInfo
+ (BOOL)supportsSecureCoding;
- (CSAttSiriAttendingTriggerEventInfo)initWithCoder:(id)a3;
- (CSAttSiriRequestContext)ctx;
- (NSString)detectedToken;
- (id)description;
- (unint64_t)triggerAbsStartSampleId;
- (unint64_t)triggerMachTime;
- (void)encodeWithCoder:(id)a3;
- (void)setCtx:(id)a3;
- (void)setDetectedToken:(id)a3;
- (void)setTriggerAbsStartSampleId:(unint64_t)a3;
- (void)setTriggerMachTime:(unint64_t)a3;
@end

@implementation CSAttSiriAttendingTriggerEventInfo

- (CSAttSiriAttendingTriggerEventInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___CSAttSiriAttendingTriggerEventInfo;
  v6 = -[CSAttSiriAttendingTriggerEventInfo init](&v21, "init");
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(CSAttSiriRequestContext, v5),  @"RequestContext");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    ctx = v6->_ctx;
    v6->_ctx = (CSAttSiriRequestContext *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"DetectedToken");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    detectedToken = v6->_detectedToken;
    v6->_detectedToken = (NSString *)v12;

    id v15 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v14),  @"TriggerMachTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v6->_triggerMachTime = (unint64_t)[v16 unsignedLongLongValue];

    id v18 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v17),  @"TriggerAbsStartSampleId");
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v6->_triggerAbsStartSampleId = (unint64_t)[v19 unsignedLongLongValue];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  ctx = self->_ctx;
  id v5 = a3;
  [v5 encodeObject:ctx forKey:@"RequestContext"];
  [v5 encodeObject:self->_detectedToken forKey:@"DetectedToken"];
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_triggerMachTime));
  [v5 encodeObject:v6 forKey:@"TriggerMachTime"];

  id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_triggerAbsStartSampleId));
  [v5 encodeObject:v7 forKey:@"TriggerAbsStartSampleId"];
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{attendingCtx: %@, detctedToken: %@, triggerMachTime=%llu, triggerStartSampleId=%llu}",  self->_ctx,  self->_detectedToken,  self->_triggerMachTime,  self->_triggerAbsStartSampleId);
}

- (CSAttSiriRequestContext)ctx
{
  return self->_ctx;
}

- (void)setCtx:(id)a3
{
}

- (NSString)detectedToken
{
  return self->_detectedToken;
}

- (void)setDetectedToken:(id)a3
{
}

- (unint64_t)triggerMachTime
{
  return self->_triggerMachTime;
}

- (void)setTriggerMachTime:(unint64_t)a3
{
  self->_triggerMachTime = a3;
}

- (unint64_t)triggerAbsStartSampleId
{
  return self->_triggerAbsStartSampleId;
}

- (void)setTriggerAbsStartSampleId:(unint64_t)a3
{
  self->_triggerAbsStartSampleId = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end