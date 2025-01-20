@interface InterestSyncStorage
+ (void)resetInterestSync;
- (_TtC8Podcasts19InterestSyncStorage)init;
@end

@implementation InterestSyncStorage

- (_TtC8Podcasts19InterestSyncStorage)init
{
  id v3 = [(id)objc_opt_self(MTDB) sharedInstance];
  id v4 = [v3 importContext];

  v5 = (objc_class *)type metadata accessor for InterestSyncStorage();
  v6 = (char *)objc_allocWithZone(v5);
  *(void *)&v6[OBJC_IVAR____TtC8Podcasts19InterestSyncStorage_importContext] = v4;
  v10.receiver = v6;
  v10.super_class = v5;
  v7 = -[InterestSyncStorage init](&v10, "init");
  uint64_t ObjectType = swift_getObjectType(self);
  swift_deallocPartialClassInstance(self, ObjectType, 16LL, 7LL);
  return v7;
}

- (void).cxx_destruct
{
}

+ (void)resetInterestSync
{
  uint64_t v2 = type metadata accessor for SyncKeysRepository(0LL);
  id v3 = (void *)static SyncKeysRepository.shared.getter(v2);
  SyncKeysRepository.interestLastSyncTimestamp.setter(0LL, 1LL);

  v5 = (void *)static SyncKeysRepository.shared.getter(v4);
  SyncKeysRepository.interestSyncVersion.setter(0LL, 0LL);

  id v7 = (id)static SyncKeysRepository.shared.getter(v6);
  SyncKeysRepository.isInterestSyncDirty.setter(1LL);
}

@end