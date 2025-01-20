@interface HMDCoreDataTransformerMPPlaybackArchive
+ (Class)transformedValueClass;
@end

@implementation HMDCoreDataTransformerMPPlaybackArchive

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___MPPlaybackArchive, a2);
}

@end