@interface CLElevationGradeData
+ (BOOL)supportsSecureCoding;
- (CLElevationGradeData)initWithCoder:(id)a3;
- (CLElevationGradeData)initWithElevationGradeEntry:(const CLElevationGradeEntry *)a3;
- (double)startTime;
- (float)fractionalGrade;
- (id)description;
- (unint64_t)recordId;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLElevationGradeData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLElevationGradeData)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CLElevationGradeData;
  v4 = -[CLElevationGradeData init](&v8, "init");
  if (v4)
  {
    v4->_recordId = (unint64_t)[a3 decodeInt64ForKey:@"recordId"];
    [a3 decodeDoubleForKey:@"startTime"];
    v4->_startTime = v5;
    [a3 decodeDoubleForKey:@"fractionalGrade"];
    *(float *)&double v6 = v6;
    v4->_fractionalGrade = *(float *)&v6;
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CLElevationGradeData)initWithElevationGradeEntry:(const CLElevationGradeEntry *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CLElevationGradeData;
  result = -[CLElevationGradeData init](&v6, "init");
  if (result)
  {
    result->_recordId = a3->var0;
    result->_startTime = a3->var1;
    float var2 = a3->var2;
    result->_fractionalGrade = var2;
  }

  return result;
}

- (id)description
{
  v4 = NSStringFromClass(v3);
  unint64_t v5 = -[CLElevationGradeData recordId](self, "recordId");
  -[CLElevationGradeData startTime](self, "startTime");
  uint64_t v7 = v6;
  -[CLElevationGradeData fractionalGrade](self, "fractionalGrade");
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@,<recordId %llu, startTime %f, fractionalGrade %f>",  v4,  v5,  v7,  v8);
}

- (unint64_t)recordId
{
  return self->_recordId;
}

- (double)startTime
{
  return self->_startTime;
}

- (float)fractionalGrade
{
  return self->_fractionalGrade;
}

@end