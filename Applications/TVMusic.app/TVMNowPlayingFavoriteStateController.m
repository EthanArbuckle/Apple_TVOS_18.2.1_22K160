@interface TVMNowPlayingFavoriteStateController
+ (NSString)didChangeFavoriteStateNotification;
+ (TVMNowPlayingFavoriteStateController)sharedController;
+ (int64_t)transientFavoriteStateFor:(id)a3;
- (BOOL)canBeFavorite;
- (BOOL)isDisliked;
- (BOOL)isFavorite;
- (MPCPlayerResponseItem)currentPlayingItem;
- (TVMNowPlayingFavoriteStateController)init;
- (void)setCurrentPlayingItem:(id)a3;
- (void)setFavoriteForCurrentItem:(BOOL)a3;
- (void)setIsDisliked:(BOOL)a3;
- (void)setIsFavorite:(BOOL)a3;
@end

@implementation TVMNowPlayingFavoriteStateController

+ (TVMNowPlayingFavoriteStateController)sharedController
{
  return (TVMNowPlayingFavoriteStateController *)sub_10012102C( (uint64_t)a1,  (uint64_t)a2,  &qword_1002B71A0,  (id *)&qword_1002C5E28,  (uint64_t)sub_100120F90);
}

+ (NSString)didChangeFavoriteStateNotification
{
  return (NSString *)sub_10012102C( (uint64_t)a1,  (uint64_t)a2,  &qword_1002B71A8,  (id *)&qword_1002C5E30,  (uint64_t)sub_100120FDC);
}

- (BOOL)isFavorite
{
  return sub_1001217A4( self,  (uint64_t)a2,  (uint64_t)&unk_1001EB700,  &OBJC_IVAR___TVMNowPlayingFavoriteStateController__isFavorite);
}

- (void)setIsFavorite:(BOOL)a3
{
  uint64_t KeyPath = swift_getKeyPath(&unk_1001EB700);
  v6 = self;
  sub_100123784();
  v5 = self;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v6, KeyPath, sub_100124110);

  swift_release(KeyPath);
}

- (BOOL)isDisliked
{
  return sub_1001217A4( self,  (uint64_t)a2,  (uint64_t)&unk_1001EB778,  &OBJC_IVAR___TVMNowPlayingFavoriteStateController__isDisliked);
}

- (void)setIsDisliked:(BOOL)a3
{
  uint64_t KeyPath = swift_getKeyPath(&unk_1001EB778);
  v6 = self;
  sub_100123784();
  v5 = self;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v6, KeyPath, sub_100124124);

  swift_release(KeyPath);
}

- (MPCPlayerResponseItem)currentPlayingItem
{
  uint64_t KeyPath = swift_getKeyPath(&unk_1001EB728);
  v8 = self;
  unint64_t v4 = sub_100123784();
  v5 = self;
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v8, KeyPath, v4);
  swift_release(KeyPath);
  v6 = (MPCPlayerResponseItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&v5->super.isa
                                                                        + OBJC_IVAR___TVMNowPlayingFavoriteStateController__currentPlayingItem));

  return v6;
}

- (void)setCurrentPlayingItem:(id)a3
{
  uint64_t KeyPath = swift_getKeyPath(&unk_1001EB728);
  v8 = self;
  sub_100123784();
  id v6 = a3;
  v7 = self;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v8, KeyPath, sub_100123F08);

  swift_release(KeyPath);
}

- (TVMNowPlayingFavoriteStateController)init
{
  return (TVMNowPlayingFavoriteStateController *)sub_100121DFC();
}

- (void)setFavoriteForCurrentItem:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v4 = self;
  sub_10012086C(v3);
}

+ (int64_t)transientFavoriteStateFor:(id)a3
{
  unint64_t v4 = (void *)objc_opt_self(&OBJC_CLASS___MPModelLibraryTransientStateController);
  id v5 = a3;
  id v6 = [v4 sharedDeviceLibraryController];
  id v7 = [v6 transientFavoriteStateForModelObject:v5];

  return (int64_t)v7;
}

- (void).cxx_destruct
{
  BOOL v3 = (char *)self + OBJC_IVAR___TVMNowPlayingFavoriteStateController_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL, a2);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___TVMNowPlayingFavoriteStateController__lastPlayerResponseObserver));
  id v5 = (char *)self + OBJC_IVAR___TVMNowPlayingFavoriteStateController___observationRegistrar;
  uint64_t v6 = type metadata accessor for ObservationRegistrar(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
}

- (BOOL)canBeFavorite
{
  uint64_t KeyPath = swift_getKeyPath(&unk_1001EB6D8);
  v8 = self;
  unint64_t v4 = sub_100123784();
  id v5 = self;
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v8, KeyPath, v4);
  swift_release(KeyPath);
  int v6 = *((unsigned __int8 *)&v5->super.isa + OBJC_IVAR___TVMNowPlayingFavoriteStateController__favoriteState);

  return v6 != 2;
}

@end