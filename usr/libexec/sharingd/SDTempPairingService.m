@interface SDTempPairingService
- (void)handleRapportIdentitiesChanged;
@end

@implementation SDTempPairingService

- (void)handleRapportIdentitiesChanged
{
  v2 = *(void **)&self->_anon_0[OBJC_IVAR____TtC16DaemoniOSLibrary20SDTempPairingService_client];
  if (v2)
  {
    swift_retain(self);
    id v4 = v2;
    sub_1002B82B4((uint64_t)v4);
    swift_release(self);
  }

@end