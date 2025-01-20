@interface ActiveITunesAccountProvider
- (void)accountCookiesDidChange:(id)a3;
- (void)accountStoreDidChange:(id)a3;
@end

@implementation ActiveITunesAccountProvider

- (void)accountCookiesDidChange:(id)a3
{
  uint64_t v5 = type metadata accessor for Notification(0LL, a2);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = *(void **)self->stateLock;
  swift_retain(self);
  [v9 lock];
  id v10 = objc_msgSend(*(id *)self->store, "ams_activeiTunesAccount");
  v11 = *(void **)self->unlockedActiveiTunesAccount;
  *(void *)self->unlockedActiveiTunesAccount = v10;

  [v9 unlock];
  swift_release(self);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)accountStoreDidChange:(id)a3
{
  uint64_t v5 = type metadata accessor for Notification(0LL, a2);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_retain(self);
  sub_10002A35C();
  swift_release(self);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end