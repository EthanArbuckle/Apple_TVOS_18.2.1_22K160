@interface URLSession
+ (URLSession)sharedSession;
- (URLSession)initWithConfiguration:(id)a3;
- (id)delegate;
@end

@implementation URLSession

- (URLSession)initWithConfiguration:(id)a3
{
  id v4 = a3;
  +[AMSEphemeralDefaults setHARLoggingItemLimit:](&OBJC_CLASS___AMSEphemeralDefaults, "setHARLoggingItemLimit:", 200LL);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___URLSession;
  v5 = -[URLSession initWithConfiguration:](&v7, "initWithConfiguration:", v4);

  return v5;
}

+ (URLSession)sharedSession
{
  if (qword_10003A9D8 != -1) {
    dispatch_once(&qword_10003A9D8, &stru_100030B28);
  }
  return (URLSession *)(id)qword_10003A9E0;
}

- (id)delegate
{
  return +[URLSessionHandler sharedHandler](&OBJC_CLASS___URLSessionHandler, "sharedHandler");
}

@end