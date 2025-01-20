@interface AMSBag
+ (id)ams_bagForProcessInfo:(id)a3;
@end

@implementation AMSBag

+ (id)ams_bagForProcessInfo:(id)a3
{
  return +[AMSBag bagForProfile:profileVersion:processInfo:]( &OBJC_CLASS___AMSBag,  "bagForProfile:profileVersion:processInfo:",  @"Accounts",  @"1",  a3);
}

@end