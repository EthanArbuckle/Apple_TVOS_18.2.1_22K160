@interface MCConfigurationProfile
- (id)createHandler;
@end

@implementation MCConfigurationProfile

- (id)createHandler
{
  return -[MCConfigurationProfileHandler initWithProfile:]( objc_alloc(&OBJC_CLASS___MCConfigurationProfileHandler),  "initWithProfile:",  self);
}

@end