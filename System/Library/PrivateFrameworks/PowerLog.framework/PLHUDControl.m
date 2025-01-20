@interface PLHUDControl
- (BOOL)internalHUDEnabled;
- (void)setInternalHUDEnabled:(BOOL)a3;
@end

@implementation PLHUDControl

- (BOOL)internalHUDEnabled
{
  return self->_internalHUDEnabled;
}

- (void)setInternalHUDEnabled:(BOOL)a3
{
  self->_internalHUDEnabled = a3;
}

@end