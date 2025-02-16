@interface ParentalControlsService
- (BOOL)disableService;
- (BOOL)forceAllowlist;
- (NSSet)allowlist;
- (NSString)name;
- (void)dealloc;
- (void)setAllowlist:(id)a3;
- (void)setDisableService:(BOOL)a3;
- (void)setForceAllowlist:(BOOL)a3;
- (void)setName:(id)a3;
@end

@implementation ParentalControlsService

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ParentalControlsService;
  -[ParentalControlsService dealloc](&v3, "dealloc");
}

- (BOOL)disableService
{
  return self->_disableService;
}

- (void)setDisableService:(BOOL)a3
{
  self->_disableService = a3;
}

- (BOOL)forceAllowlist
{
  return self->_forceAllowlist;
}

- (void)setForceAllowlist:(BOOL)a3
{
  self->_forceAllowlist = a3;
}

- (NSSet)allowlist
{
  return (NSSet *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAllowlist:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setName:(id)a3
{
}

@end