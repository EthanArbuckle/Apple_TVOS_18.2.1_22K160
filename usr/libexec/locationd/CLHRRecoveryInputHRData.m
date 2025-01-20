@interface CLHRRecoveryInputHRData
+ (BOOL)supportsSecureCoding;
- (CLHRRecoveryInputHRData)initWithCoder:(id)a3;
- (CLHRRecoveryInputHRData)initWithHRRecoveryInputHR:(const HRRecoveryInputHR *)a3;
- (CLHRRecoveryInputHRData)initWithRecordId:(unint64_t)a3 startTime:(double)a4 hr:(double)a5 hrConfidence:(double)a6;
- (double)hr;
- (double)hrConfidence;
- (double)startTime;
- (id)description;
- (unint64_t)recordId;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLHRRecoveryInputHRData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLHRRecoveryInputHRData)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CLHRRecoveryInputHRData;
  v4 = -[CLHRRecoveryInputHRData init](&v9, "init");
  if (v4)
  {
    v4->_recordId = (unint64_t)[a3 decodeInt64ForKey:@"recordId"];
    [a3 decodeDoubleForKey:@"startTime"];
    v4->_startTime = v5;
    [a3 decodeDoubleForKey:@"mets"];
    v4->_hr = v6;
    [a3 decodeDoubleForKey:@"grade"];
    v4->_hrConfidence = v7;
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CLHRRecoveryInputHRData)initWithRecordId:(unint64_t)a3 startTime:(double)a4 hr:(double)a5 hrConfidence:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CLHRRecoveryInputHRData;
  result = -[CLHRRecoveryInputHRData init](&v11, "init");
  if (result)
  {
    result->_recordId = a3;
    result->_startTime = a4;
    result->_hr = a5;
    result->_hrConfidence = a6;
  }

  return result;
}

- (CLHRRecoveryInputHRData)initWithHRRecoveryInputHR:(const HRRecoveryInputHR *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLHRRecoveryInputHRData;
  result = -[CLHRRecoveryInputHRData init](&v5, "init");
  if (result)
  {
    result->_recordId = a3->var0;
    result->_startTime = a3->var1;
    result->_hr = a3->var2;
    result->_hrConfidence = a3->var3;
  }

  return result;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  unint64_t v5 = -[CLHRRecoveryInputHRData recordId](self, "recordId");
  -[CLHRRecoveryInputHRData startTime](self, "startTime");
  uint64_t v7 = v6;
  -[CLHRRecoveryInputHRData hr](self, "hr");
  uint64_t v9 = v8;
  -[CLHRRecoveryInputHRData hrConfidence](self, "hrConfidence");
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@,<recordId %llu, startTime %f, hr %f, hrConfidence %f>",  v4,  v5,  v7,  v9,  v10);
}

- (unint64_t)recordId
{
  return self->_recordId;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)hr
{
  return self->_hr;
}

- (double)hrConfidence
{
  return self->_hrConfidence;
}

@end