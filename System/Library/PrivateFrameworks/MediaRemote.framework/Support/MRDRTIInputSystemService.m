@interface MRDRTIInputSystemService
+ (Class)serviceSessionClass;
@end

@implementation MRDRTIInputSystemService

+ (Class)serviceSessionClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___MRDTextEditingConnection);
}

@end