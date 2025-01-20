@interface PBMutableAppInfoConfiguration
- (BOOL)isPBAppInfoConfiguration;
- (NSDictionary)singleAppModeOptions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setSingleAppModeOptions:(id)a3;
@end

@implementation PBMutableAppInfoConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PBAppInfoConfiguration initWithConfiguration:]( +[PBAppInfoConfiguration allocWithZone:](&OBJC_CLASS___PBAppInfoConfiguration, "allocWithZone:", a3),  "initWithConfiguration:",  self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PBMutableAppInfoConfiguration initWithConfiguration:]( +[PBMutableAppInfoConfiguration allocWithZone:]( &OBJC_CLASS___PBMutableAppInfoConfiguration,  "allocWithZone:",  a3),  "initWithConfiguration:",  self);
}

- (BOOL)isPBAppInfoConfiguration
{
  return 1;
}

- (NSDictionary)singleAppModeOptions
{
  return self->_singleAppModeOptions;
}

- (void)setSingleAppModeOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end