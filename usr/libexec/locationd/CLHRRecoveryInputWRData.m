@interface CLHRRecoveryInputWRData
+ (BOOL)supportsSecureCoding;
- (CLHRRecoveryInputWRData)initWithCoder:(id)a3;
- (CLHRRecoveryInputWRData)initWithHRRecoveryInputWR:(const HRRecoveryInputWR *)a3;
- (CLHRRecoveryInputWRData)initWithRecordId:(unint64_t)a3 startTime:(double)a4 mets:(double)a5 gradeType:(int)a6 grade:(double)a7 userMets:(double)a8 userMetsSource:(int)a9;
- (double)grade;
- (double)mets;
- (double)startTime;
- (double)userMets;
- (id)description;
- (int)gradeType;
- (int)userMetsSource;
- (unint64_t)recordId;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLHRRecoveryInputWRData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLHRRecoveryInputWRData)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CLHRRecoveryInputWRData;
  v4 = -[CLHRRecoveryInputWRData init](&v10, "init");
  if (v4)
  {
    v4->_recordId = (unint64_t)[a3 decodeInt64ForKey:@"recordId"];
    [a3 decodeDoubleForKey:@"startTime"];
    v4->_startTime = v5;
    [a3 decodeDoubleForKey:@"mets"];
    v4->_mets = v6;
    v4->_gradeType = [a3 decodeIntForKey:@"gradeType"];
    [a3 decodeDoubleForKey:@"grade"];
    v4->_grade = v7;
    [a3 decodeDoubleForKey:@"userMets"];
    v4->_userMets = v8;
    v4->_userMetsSource = [a3 decodeIntForKey:@"userMetsSource"];
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CLHRRecoveryInputWRData)initWithRecordId:(unint64_t)a3 startTime:(double)a4 mets:(double)a5 gradeType:(int)a6 grade:(double)a7 userMets:(double)a8 userMetsSource:(int)a9
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CLHRRecoveryInputWRData;
  result = -[CLHRRecoveryInputWRData init](&v17, "init");
  if (result)
  {
    result->_recordId = a3;
    result->_startTime = a4;
    result->_mets = a5;
    result->_grade = a7;
    result->_userMets = a8;
    result->_gradeType = a6;
    result->_userMetsSource = a9;
  }

  return result;
}

- (CLHRRecoveryInputWRData)initWithHRRecoveryInputWR:(const HRRecoveryInputWR *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLHRRecoveryInputWRData;
  result = -[CLHRRecoveryInputWRData init](&v7, "init");
  if (result)
  {
    result->_recordId = a3->var0;
    result->_startTime = a3->var1;
    result->_mets = a3->var2;
    int var3 = a3->var3;
    result->_grade = a3->var4;
    result->_userMets = a3->var5;
    int var6 = a3->var6;
    result->_gradeType = var3;
    result->_userMetsSource = var6;
  }

  return result;
}

- (id)description
{
  v4 = NSStringFromClass(v3);
  unint64_t v5 = -[CLHRRecoveryInputWRData recordId](self, "recordId");
  -[CLHRRecoveryInputWRData startTime](self, "startTime");
  uint64_t v7 = v6;
  -[CLHRRecoveryInputWRData mets](self, "mets");
  uint64_t v9 = v8;
  uint64_t v10 = -[CLHRRecoveryInputWRData gradeType](self, "gradeType");
  -[CLHRRecoveryInputWRData grade](self, "grade");
  uint64_t v12 = v11;
  -[CLHRRecoveryInputWRData userMets](self, "userMets");
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@,<recordId %llu, startTime %f, mets %f, gradeType %d, grade %f, userMets, %f, userMetsSource, %d>",  v4,  v5,  v7,  v9,  v10,  v12,  v13,  -[CLHRRecoveryInputWRData userMetsSource](self, "userMetsSource"));
}

- (unint64_t)recordId
{
  return self->_recordId;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)mets
{
  return self->_mets;
}

- (int)gradeType
{
  return self->_gradeType;
}

- (double)grade
{
  return self->_grade;
}

- (double)userMets
{
  return self->_userMets;
}

- (int)userMetsSource
{
  return self->_userMetsSource;
}

@end