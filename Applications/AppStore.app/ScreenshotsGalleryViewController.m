@interface ScreenshotsGalleryViewController
- (_TtC8AppStore32ScreenshotsGalleryViewController)initWithCoder:(id)a3;
- (_TtC8AppStore32ScreenshotsGalleryViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5;
- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4;
- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4;
- (int64_t)presentationCountForPageViewController:(id)a3;
- (int64_t)presentationIndexForPageViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation ScreenshotsGalleryViewController

- (_TtC8AppStore32ScreenshotsGalleryViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8AppStore32ScreenshotsGalleryViewController_fullScreenshotFetcher;
  uint64_t v6 = type metadata accessor for ScreenshotFetcher();
  v7 = (objc_class *)swift_allocObject(v6, 40LL, 7LL);
  id v8 = a3;
  v7[2].isa = (Class)sub_1000EC13C((uint64_t)_swiftEmptyArrayStorage);
  v7[4].isa = 0LL;
  swift_unknownObjectWeakInit(&v7[3], 0LL);
  v7[4].isa = 0LL;
  swift_unknownObjectWeakAssign(v9, 0LL);
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = v7;

  result = (_TtC8AppStore32ScreenshotsGalleryViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/ScreenshotsGalleryViewController.swift",  47LL,  2LL,  80LL,  0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000BD900();
}

- (int64_t)presentationCountForPageViewController:(id)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore32ScreenshotsGalleryViewController_galleryViewControllers);
  if (v3 < 0) {
    uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.super.isa
  }
                    + OBJC_IVAR____TtC8AppStore32ScreenshotsGalleryViewController_galleryViewControllers);
  else {
    uint64_t v6 = v3 & 0xFFFFFFFFFFFFFF8LL;
  }
  id v7 = a3;
  id v8 = self;
  swift_bridgeObjectRetain(v3);
  int64_t v9 = _CocoaArrayWrapper.endIndex.getter(v6);

  swift_bridgeObjectRelease(v3);
  return v9;
}

- (int64_t)presentationIndexForPageViewController:(id)a3
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore32ScreenshotsGalleryViewController_initialSelectedIndex);
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1000BEA60(v7);
  v10 = v9;

  return v10;
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  int64_t v9 = (void *)sub_1000BEB88(v7);

  return v9;
}

- (_TtC8AppStore32ScreenshotsGalleryViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5
{
  result = (_TtC8AppStore32ScreenshotsGalleryViewController *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.ScreenshotsGalleryViewController",  41LL,  "init(transitionStyle:navigationOrientation:options:)",  52LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore32ScreenshotsGalleryViewController_screenshots));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore32ScreenshotsGalleryViewController_placeholderImages));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore32ScreenshotsGalleryViewController_fullScreenshotFetcher));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore32ScreenshotsGalleryViewController_artworkLoader));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore32ScreenshotsGalleryViewController_galleryViewControllers));
}

@end