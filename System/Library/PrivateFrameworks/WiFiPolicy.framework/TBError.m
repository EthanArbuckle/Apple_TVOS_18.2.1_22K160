@interface TBError
+ (id)fetchMissingParametersErrorWithUserInfo:(id)a3;
+ (id)fetchUnsupportedErrorWithUserInfo:(id)a3;
+ (id)responseErrorWithUserInfo:(id)a3;
- (TBError)initWithType:(int64_t)a3 userInfo:(id)a4;
@end

@implementation TBError

- (TBError)initWithType:(int64_t)a3 userInfo:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TBError;
  return -[TBError initWithDomain:code:userInfo:]( &v5,  sel_initWithDomain_code_userInfo_,  @"com.apple.wifi.threebars",  a3,  a4);
}

+ (id)responseErrorWithUserInfo:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[objc_alloc((Class)a1) initWithType:200 userInfo:v4];

  return v5;
}

+ (id)fetchUnsupportedErrorWithUserInfo:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[objc_alloc((Class)a1) initWithType:100 userInfo:v4];

  return v5;
}

+ (id)fetchMissingParametersErrorWithUserInfo:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[objc_alloc((Class)a1) initWithType:101 userInfo:v4];

  return v5;
}

@end