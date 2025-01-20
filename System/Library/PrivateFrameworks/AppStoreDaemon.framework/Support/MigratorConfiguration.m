@interface MigratorConfiguration
- (MigratorConfiguration)init;
@end

@implementation MigratorConfiguration

- (MigratorConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MigratorConfiguration;
  result = -[MigratorConfiguration init](&v3, "init");
  if (result) {
    result->_attempts = 0LL;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end