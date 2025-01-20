@interface TVMusicPlaybackViewController
+ (BOOL)hasActivePlaybackViewController;
+ (UIViewController)sharedPlaybackViewController;
- (NSArray)preferredFocusEnvironments;
- (_TtC7TVMusic29TVMusicPlaybackViewController)initWithCoder:(id)a3;
- (_TtC7TVMusic29TVMusicPlaybackViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7TVMusic29TVMusicPlaybackViewController)initWithNowPlayingType:(unint64_t)a3;
- (_TtC7TVMusic29TVMusicPlaybackViewController)initWithNowPlayingType:(unint64_t)a3 options:(int64_t)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVMusicPlaybackViewController

+ (UIViewController)sharedPlaybackViewController
{
  if (qword_1002B71B8 != -1) {
    swift_once(&qword_1002B71B8, sub_10013433C);
  }
  return (UIViewController *)(id)swift_unknownObjectWeakLoadStrong(&unk_1002BAEA0);
}

+ (BOOL)hasActivePlaybackViewController
{
  if (qword_1002B71B8 != -1) {
    swift_once(&qword_1002B71B8, sub_10013433C);
  }
  Strong = (void *)swift_unknownObjectWeakLoadStrong(&unk_1002BAEA0);
  v3 = Strong;
  if (Strong) {

  }
  return v3 != 0LL;
}

- (_TtC7TVMusic29TVMusicPlaybackViewController)initWithNowPlayingType:(unint64_t)a3 options:(int64_t)a4
{
  return (_TtC7TVMusic29TVMusicPlaybackViewController *)sub_1001343F0(a3, a4);
}

- (_TtC7TVMusic29TVMusicPlaybackViewController)initWithNowPlayingType:(unint64_t)a3
{
  return -[TVMusicPlaybackViewController initWithNowPlayingType:options:]( self,  "initWithNowPlayingType:options:",  a3,  0LL);
}

- (_TtC7TVMusic29TVMusicPlaybackViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  Logger.init(subsystem:category:)( 0xD000000000000028LL,  0x8000000100227060LL,  0xD00000000000001DLL,  0x80000001001EC140LL);
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC7TVMusic29TVMusicPlaybackViewController_isVisible) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7TVMusic29TVMusicPlaybackViewController_didBecomeActiveNotification) = 0LL;
  v5 = (char *)self + OBJC_IVAR____TtC7TVMusic29TVMusicPlaybackViewController_nowPlayingType;
  *(void *)v5 = 0LL;
  v5[8] = 1;

  result = (_TtC7TVMusic29TVMusicPlaybackViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100223C30LL,  "TVMusic/PlaybackViewController.swift",  36LL,  2LL,  79LL,  0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1001345E8();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVMusicPlaybackViewController(0LL);
  id v4 = v5.receiver;
  -[TVMusicPlaybackViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  v4[OBJC_IVAR____TtC7TVMusic29TVMusicPlaybackViewController_isVisible] = 1;
  sub_10013496C();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVMusicPlaybackViewController(0LL);
  id v4 = v5.receiver;
  -[TVMusicPlaybackViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
  v4[OBJC_IVAR____TtC7TVMusic29TVMusicPlaybackViewController_isVisible] = 0;
}

- (NSArray)preferredFocusEnvironments
{
  uint64_t v2 = qword_1002B71B8;
  BOOL v3 = self;
  if (v2 != -1) {
    swift_once(&qword_1002B71B8, sub_10013433C);
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(&unk_1002BAEA0);
  if (Strong)
  {
    uint64_t v5 = Strong;
    uint64_t v6 = sub_1000DFE10(&qword_1002B8A00);
    uint64_t v7 = swift_allocObject(v6, 40LL, 7LL);
    *(_OWORD *)(v7 + 16) = xmmword_1001E9180;
    *(void *)(v7 + 32) = v5;
    v11 = (void *)v7;
    specialized Array._endMutation()((__n128)xmmword_1001E9180);
    v8 = v11;
  }

  else
  {

    v8 = &_swiftEmptyArrayStorage;
  }

  sub_1000DFE10((uint64_t *)&unk_1002B7E50);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return (NSArray *)isa;
}

- (_TtC7TVMusic29TVMusicPlaybackViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  BOOL v3 = (char *)self + OBJC_IVAR____TtC7TVMusic29TVMusicPlaybackViewController_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL, a2);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC7TVMusic29TVMusicPlaybackViewController_didBecomeActiveNotification));
}

@end