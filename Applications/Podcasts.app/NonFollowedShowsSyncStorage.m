@interface NonFollowedShowsSyncStorage
+ (void)resetNonFollowedShowsSync;
- (_TtC8Podcasts27NonFollowedShowsSyncStorage)init;
@end

@implementation NonFollowedShowsSyncStorage

- (_TtC8Podcasts27NonFollowedShowsSyncStorage)init
{
  return (_TtC8Podcasts27NonFollowedShowsSyncStorage *)sub_1001347D4();
}

- (void).cxx_destruct
{
  sub_100136648((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC8Podcasts27NonFollowedShowsSyncStorage_fetchNonFollowedShows));
  sub_100136648((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC8Podcasts27NonFollowedShowsSyncStorage_podcastsStateCoordinator));
}

+ (void)resetNonFollowedShowsSync
{
  uint64_t v2 = type metadata accessor for SyncKeysRepository(0LL);
  v3 = (void *)static SyncKeysRepository.shared.getter(v2);
  SyncKeysRepository.nonFollowedShowsLastSyncTimestamp.setter(0LL, 1LL);

  v5 = (void *)static SyncKeysRepository.shared.getter(v4);
  SyncKeysRepository.nonFollowedShowsSyncVersion.setter(0LL, 0LL);

  id v7 = (id)static SyncKeysRepository.shared.getter(v6);
  SyncKeysRepository.isNonFollowedShowsSyncDirty.setter(1LL);
}

@end