@interface BMDateFormatterVendor
+ (id)sharedInstance;
- (BMDateFormatterVendor)init;
- (id)dateFormatter;
@end

@implementation BMDateFormatterVendor

- (BMDateFormatterVendor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___BMDateFormatterVendor;
  v2 = -[BMDateFormatterVendor init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSISO8601DateFormatter);
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = v3;
  }

  return v2;
}

+ (id)sharedInstance
{
  if (qword_10007C388 != -1) {
    dispatch_once(&qword_10007C388, &stru_1000699F0);
  }
  return (id)qword_10007C380;
}

- (id)dateFormatter
{
  return self->_dateFormatter;
}

- (void).cxx_destruct
{
}

@end