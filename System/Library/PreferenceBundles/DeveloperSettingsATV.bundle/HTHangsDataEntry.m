@interface HTHangsDataEntry
+ (id)dateFormatter;
- (NSMeasurement)durationMeasurement;
@end

@implementation HTHangsDataEntry

+ (id)dateFormatter
{
  if (qword_1E690 != -1) {
    dispatch_once(&qword_1E690, &stru_18948);
  }
  return (id)qword_1E688;
}

- (NSMeasurement)durationMeasurement
{
  v3 = objc_alloc(&OBJC_CLASS___NSMeasurement);
  -[HTHangsDataEntry duration](self, "duration");
  double v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitDuration milliseconds](&OBJC_CLASS___NSUnitDuration, "milliseconds"));
  v7 = -[NSMeasurement initWithDoubleValue:unit:](v3, "initWithDoubleValue:unit:", v6, v5);

  return v7;
}

@end