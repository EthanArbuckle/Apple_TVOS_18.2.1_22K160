@interface SRError
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 localizedFailureReason:(id)a4;
+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4;
- (SRError)initWithCode:(int64_t)a3;
- (SRError)initWithCode:(int64_t)a3 localizedFailureReason:(id)a4;
- (SRError)initWithCode:(int64_t)a3 userInfo:(id)a4;
@end

@implementation SRError

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  id v6 = a4;
  id v7 = [objc_alloc((Class)a1) initWithCode:a3 userInfo:v6];

  return v7;
}

+ (id)errorWithCode:(int64_t)a3 localizedFailureReason:(id)a4
{
  id v6 = a4;
  id v7 = [objc_alloc((Class)a1) initWithCode:a3 localizedFailureReason:v6];

  return v7;
}

+ (id)errorWithCode:(int64_t)a3
{
  return _[a1 errorWithCode:a3 userInfo:0];
}

- (SRError)initWithCode:(int64_t)a3 userInfo:(id)a4
{
  return -[SRError initWithDomain:code:userInfo:]( self,  "initWithDomain:code:userInfo:",  @"com.apple.siri.ErrorDomain",  a3,  a4);
}

- (SRError)initWithCode:(int64_t)a3 localizedFailureReason:(id)a4
{
  NSErrorUserInfoKey v10 = NSLocalizedFailureReasonErrorKey;
  id v11 = a4;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));

  v8 = -[SRError initWithCode:userInfo:](self, "initWithCode:userInfo:", a3, v7);
  return v8;
}

- (SRError)initWithCode:(int64_t)a3
{
  return -[SRError initWithCode:userInfo:](self, "initWithCode:userInfo:", a3, 0LL);
}

@end