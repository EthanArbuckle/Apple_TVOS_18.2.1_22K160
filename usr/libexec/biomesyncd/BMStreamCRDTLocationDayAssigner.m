@interface BMStreamCRDTLocationDayAssigner
+ (id)truncateDateToDay:(double)a3;
- (BMStreamCRDTLocationDayAssigner)init;
- (id)locationWithStreamName:(id)a3 siteIdentifier:(id)a4 timestamp:(double)a5;
@end

@implementation BMStreamCRDTLocationDayAssigner

- (BMStreamCRDTLocationDayAssigner)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BMStreamCRDTLocationDayAssigner;
  return -[BMStreamCRDTLocationDayAssigner init](&v3, "init");
}

+ (id)truncateDateToDay:(double)a3
{
  return +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  floor(a3 / 86400.0) * 86400.0);
}

- (id)locationWithStreamName:(id)a3 siteIdentifier:(id)a4 timestamp:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "truncateDateToDay:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = -[BMStreamCRDTLocation initWithStreamName:siteIdentifier:day:]( objc_alloc(&OBJC_CLASS___BMStreamCRDTLocation),  "initWithStreamName:siteIdentifier:day:",  v9,  v8,  v12);

  return v13;
}

@end