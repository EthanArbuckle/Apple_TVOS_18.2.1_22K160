@interface MCCertificateWrapperProfile
- (id)createHandler;
@end

@implementation MCCertificateWrapperProfile

- (id)createHandler
{
  return -[MCConfigurationProfileHandler initWithProfile:]( objc_alloc(&OBJC_CLASS___MCCertificateWrapperProfileHandler),  "initWithProfile:",  self);
}

@end