@interface AccountChannelsProvider
- (void)notifyObserver;
@end

@implementation AccountChannelsProvider

- (void)notifyObserver
{
  updateObserver = self->updateObserver;
  swift_beginAccess(self->updateObserver, v8, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(updateObserver);
  if (Strong)
  {
    uint64_t v5 = Strong;
    uint64_t v6 = *(void *)&self->updateObserver[8];
    uint64_t ObjectType = swift_getObjectType(Strong);
    swift_retain(self);
    dispatch thunk of AccountChannelsProviderUpdateObserver.accountChannelsDidUpdate()(ObjectType, v6);
    swift_release(self);
    swift_unknownObjectRelease(v5);
  }

@end