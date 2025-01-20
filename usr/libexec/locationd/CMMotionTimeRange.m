@interface CMMotionTimeRange
+ ($F24F406B2B787EFB06265DBA3D28CBD5)CLMotionTimeRangeFromCMMotionTimeRange:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)CMMotionTimeRangeFromCLMotionTimeRange:(id)a3;
- (CMMotionTimeRange)initWithCoder:(id)a3;
- (CMMotionTimeRange)initWithStartDate:(double)a3 endDate:(double)a4;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMMotionTimeRange

- (CMMotionTimeRange)initWithStartDate:(double)a3 endDate:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CMMotionTimeRange;
  v6 = -[CMMotionTimeRange init](&v8, "init");
  if (v6)
  {
    v6->fStartDate = -[NSDate initWithTimeIntervalSinceReferenceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceReferenceDate:",  a3);
    v6->fEndDate = -[NSDate initWithTimeIntervalSinceReferenceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceReferenceDate:",  a4);
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CMMotionTimeRange;
  -[CMLogItem dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  v7 = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  if (v7)
  {
    v7[2] = -[NSDate copy](self->fStartDate, "copy");
    v7[3] = -[NSDate copy](self->fEndDate, "copy");
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMMotionTimeRange)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CMMotionTimeRange;
  v4 = -[CMMotionTimeRange init](&v10, "init");
  if (v4)
  {
    *(void *)&double v5 = objc_opt_class(&OBJC_CLASS___NSDate).n128_u64[0];
    v4->fStartDate = (NSDate *) objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  v6,  @"kCMMotionTimeRangeCodingKeyStartDate",  v5);
    *(void *)&double v7 = objc_opt_class(&OBJC_CLASS___NSDate).n128_u64[0];
    v4->fEndDate = (NSDate *) objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  v8,  @"kCMMotionTimeRangeCodingKeyEndDate",  v7);
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@,<startDate %@, endDate %@>",  NSStringFromClass(v3),  -[CMMotionTimeRange startDate](self, "startDate"),  -[CMMotionTimeRange endDate](self, "endDate"));
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (NSDate)endDate
{
  return self->fEndDate;
}

+ (id)CMMotionTimeRangeFromCLMotionTimeRange:(id)a3
{
  return  -[CMMotionTimeRange initWithStartDate:endDate:]( objc_alloc(&OBJC_CLASS___CMMotionTimeRange),  "initWithStartDate:endDate:",  a3.var0,  a3.var1);
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)CLMotionTimeRangeFromCMMotionTimeRange:(id)a3
{
  if (!a3) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  a1,  @"CMMotionTimeRange.mm",  101LL,  @"Invalid parameter not satisfying: %@",  @"timeRange");
  }
  objc_msgSend(objc_msgSend(a3, "startDate"), "timeIntervalSinceReferenceDate");
  double v5 = v4;
  objc_msgSend(objc_msgSend(a3, "endDate"), "timeIntervalSinceReferenceDate");
  double v7 = v6;
  double v8 = v5;
  result.var1 = v7;
  result.var0 = v8;
  return result;
}

@end