@interface NSError
+ (id)dc_errorWithCode:(int64_t)a3;
+ (id)dc_errorWithCode:(int64_t)a3 userInfo:(id)a4;
@end

@implementation NSError

+ (id)dc_errorWithCode:(int64_t)a3
{
  return objc_msgSend(a1, "dc_errorWithCode:userInfo:", a3, 0);
}

+ (id)dc_errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.devicecheck.error",  a3,  a4);
}

@end