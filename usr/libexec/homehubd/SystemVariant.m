@interface SystemVariant
+ (BOOL)isInternal;
@end

@implementation SystemVariant

+ (BOOL)isInternal
{
  return os_variant_has_internal_ui("com.apple.HomeHub", a2);
}

@end