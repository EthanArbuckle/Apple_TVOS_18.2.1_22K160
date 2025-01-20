@interface NSBundle
+ (id)asc_frameworkBundle;
+ (id)asc_localizedStringKeyPlatformSuffix;
+ (id)asc_realMainBundle;
@end

@implementation NSBundle

+ (id)asc_realMainBundle
{
  return +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
}

+ (id)asc_frameworkBundle
{
  if (qword_1001408C0 != -1) {
    dispatch_once(&qword_1001408C0, &stru_10011F4D0);
  }
  return (id)qword_1001408C8;
}

+ (id)asc_localizedStringKeyPlatformSuffix
{
  return @"_TV";
}

@end