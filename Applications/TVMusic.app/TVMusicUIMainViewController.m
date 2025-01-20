@interface TVMusicUIMainViewController
+ (_TtC7TVMusic27TVMusicUIMainViewController)shared;
- (NSArray)preferredFocusEnvironments;
- (NSString)featureNameForCurrentTab;
- (_TtC7TVMusic27TVMusicUIMainViewController)init;
- (_TtC7TVMusic27TVMusicUIMainViewController)initWithCoder:(id)a3;
- (_TtC7TVMusic27TVMusicUIMainViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (uint64_t)appDidBecomeActive:(uint64_t)a3;
- (void)openURL:(id)a3;
- (void)removeNowPlayingView;
- (void)showCatalogAlbumPageForSong:(id)a3;
- (void)showCatalogPageForAlbum:(id)a3;
- (void)showCatalogPageForPlaylist:(id)a3;
- (void)showLibraryAlbumsPageForArtist:(id)a3;
- (void)showLibraryAlbumsPageForComposer:(id)a3;
- (void)showLibraryPageForAlbum:(id)a3;
- (void)showLibraryPageForPlaylist:(id)a3;
- (void)showMarketingPageWithPlacement:(id)a3 additionalQueryItems:(id)a4;
- (void)showNowPlayingWithPlaybackType:(unint64_t)a3;
- (void)showPageForArtist:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVMusicUIMainViewController

+ (_TtC7TVMusic27TVMusicUIMainViewController)shared
{
  return (_TtC7TVMusic27TVMusicUIMainViewController *)sub_10012102C( (uint64_t)a1,  (uint64_t)a2,  &qword_1002B7218,  (id *)&qword_1002C5EE0,  (uint64_t)sub_100188700);
}

- (_TtC7TVMusic27TVMusicUIMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v7 = v6;
  }

  else
  {
    uint64_t v5 = 0LL;
    uint64_t v7 = 0LL;
  }

  id v8 = a4;
  return (_TtC7TVMusic27TVMusicUIMainViewController *)sub_100188734(v5, v7, a4);
}

- (_TtC7TVMusic27TVMusicUIMainViewController)init
{
  return -[TVMusicUIMainViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0LL, 0LL);
}

- (_TtC7TVMusic27TVMusicUIMainViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001945E8();
}

  ;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100188E18();
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  sub_100189718();
  uint64_t v4 = v3;

  sub_1000DFE10((uint64_t *)&unk_1002B7E50);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSArray *)isa;
}

- (NSString)featureNameForCurrentTab
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7TVMusic27TVMusicUIMainViewController_tabs);
  uint64_t KeyPath = swift_getKeyPath(&unk_1001EE7E0);
  uint64_t v5 = swift_getKeyPath(&unk_1001EE808);
  uint64_t v6 = self;
  static Published.subscript.getter(&v11, v3, KeyPath, v5);
  swift_release(KeyPath);
  swift_release(v5);
  sub_10013314C(v11);
  uint64_t v8 = v7;

  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  return (NSString *)v9;
}

- (void)removeNowPlayingView
{
  uint64_t v2 = *(uint64_t *)((char *)&(*(Class *)((char *)&self->super.super.super.isa
                                       + OBJC_IVAR____TtC7TVMusic27TVMusicUIMainViewController_tabs))->isa
                  + OBJC_IVAR____TtC7TVMusic4Tabs_sharedStackAuthority);
  uint64_t v3 = self;
  swift_retain(v2);
  uint64_t v4 = (void (*)(_BYTE *, void))MusicStackAuthority.path.modify(v5);
  NavigationPath.mutateWithCollectionProxy(transform:)(sub_1001898FC, 0LL);
  v4(v5, 0LL);

  swift_release(v2);
}

- (void)showCatalogPageForAlbum:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_100187FDC( v5,  (uint64_t *)&unk_1002BD010,  (uint64_t (*)(void))&type metadata accessor for Album,  (uint64_t)&protocol witness table for Album,  3LL);
}

- (void)showCatalogAlbumPageForSong:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_100187FDC( v5,  &qword_1002BCB50,  (uint64_t (*)(void))&type metadata accessor for Song,  (uint64_t)&protocol witness table for Song,  4LL);
}

- (void)showLibraryPageForAlbum:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_100187FDC( v5,  (uint64_t *)&unk_1002BD010,  (uint64_t (*)(void))&type metadata accessor for Album,  (uint64_t)&protocol witness table for Album,  5LL);
}

- (void)showCatalogPageForPlaylist:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_100187FDC( v5,  (uint64_t *)&unk_1002BD100,  (uint64_t (*)(void))&type metadata accessor for Playlist,  (uint64_t)&protocol witness table for Playlist,  6LL);
}

- (void)showLibraryPageForPlaylist:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_100187FDC( v5,  (uint64_t *)&unk_1002BD100,  (uint64_t (*)(void))&type metadata accessor for Playlist,  (uint64_t)&protocol witness table for Playlist,  7LL);
}

- (void)showPageForArtist:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_100187A84(v5);
}

- (void)showLibraryAlbumsPageForArtist:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_100187FDC( v5,  (uint64_t *)&unk_1002BD0F0,  (uint64_t (*)(void))&type metadata accessor for Artist,  (uint64_t)&protocol witness table for Artist,  1LL);
}

- (void)showLibraryAlbumsPageForComposer:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_100187FDC( v5,  &qword_1002BD0E8,  (uint64_t (*)(void))&type metadata accessor for Composer,  (uint64_t)&protocol witness table for Composer,  2LL);
}

- (void)showNowPlayingWithPlaybackType:(unint64_t)a3
{
  uint64_t v4 = self;
  sub_10018A1F0(a3);
}

- (void)openURL:(id)a3
{
  uint64_t v5 = type metadata accessor for URL(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  NSString v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = self;
  sub_10018A9CC((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (void)showMarketingPageWithPlacement:(id)a3 additionalQueryItems:(id)a4
{
  uint64_t v7 = sub_1000DFE10(&qword_1002BB500);
  __chkstk_darwin(v7, v8);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v13 = v12;
  uint64_t v14 = type metadata accessor for URLQueryItem(0LL);
  uint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v14);
  uint64_t v16 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v10, 1LL, 1LL, v16);
  type metadata accessor for MainActor(0LL);
  v17 = self;
  swift_bridgeObjectRetain(v13);
  uint64_t v18 = swift_bridgeObjectRetain(v15);
  uint64_t v19 = static MainActor.shared.getter(v18);
  v20 = (void *)swift_allocObject(&unk_1002772B8, 64LL, 7LL);
  v20[2] = v19;
  v20[3] = &protocol witness table for MainActor;
  v20[4] = v11;
  v20[5] = v13;
  v20[6] = v15;
  v20[7] = v17;
  uint64_t v21 = sub_100125950((uint64_t)v10, (uint64_t)&unk_1002BB0C8, (uint64_t)v20);
  swift_release(v21);
  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v13);
}

- (uint64_t)appDidBecomeActive:(uint64_t)a3
{
  uint64_t v5 = type metadata accessor for Notification(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  a1[OBJC_IVAR____TtC7TVMusic27TVMusicUIMainViewController_didAcknowledgePrivacyDisclaimer] = 0;
  v10 = a1;
  sub_1001894A4();

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC7TVMusic27TVMusicUIMainViewController_tabs));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC7TVMusic27TVMusicUIMainViewController_musicPageProvider));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC7TVMusic27TVMusicUIMainViewController_privacyAcknowledgementObserver));
  sub_1000E03B4( (uint64_t)self + OBJC_IVAR____TtC7TVMusic27TVMusicUIMainViewController_pendingDeepLinkURL,  &qword_1002B7890);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7TVMusic27TVMusicUIMainViewController_currentViewController);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC7TVMusic27TVMusicUIMainViewController_isMusicVideoBlockedObserver));
}

@end