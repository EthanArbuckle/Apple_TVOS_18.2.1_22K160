@interface MCProfileServiceProfile
- (id)createHandler;
@end

@implementation MCProfileServiceProfile

- (id)createHandler
{
  return -[MCProfileServiceProfileHandler initWithProfile:]( objc_alloc(&OBJC_CLASS___MCProfileServiceProfileHandler),  "initWithProfile:",  self);
}

@end