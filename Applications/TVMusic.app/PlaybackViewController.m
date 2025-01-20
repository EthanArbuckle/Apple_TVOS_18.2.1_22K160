@interface PlaybackViewController
- (NSArray)preferredFocusEnvironments;
- (_TtC7TVMusicP33_035D42A14CF7650629E28B54E9D73EE622PlaybackViewController)initWithCoder:(id)a3;
- (_TtC7TVMusicP33_035D42A14CF7650629E28B54E9D73EE622PlaybackViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PlaybackViewController

- (_TtC7TVMusicP33_035D42A14CF7650629E28B54E9D73EE622PlaybackViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10013720C();
}

  ;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100135240();
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_100135908(a3);
}

- (NSArray)preferredFocusEnvironments
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7TVMusicP33_035D42A14CF7650629E28B54E9D73EE622PlaybackViewController_contentViewController);
  if (v2)
  {
    uint64_t v3 = sub_1000DFE10(&qword_1002B8A00);
    uint64_t v4 = swift_allocObject(v3, 40LL, 7LL);
    *(_OWORD *)(v4 + 16) = xmmword_1001E9180;
    *(void *)(v4 + 32) = v2;
    v9 = (void *)v4;
    specialized Array._endMutation()((__n128)xmmword_1001E9180);
    v5 = v9;
  }

  else
  {
    v5 = &_swiftEmptyArrayStorage;
  }

  id v6 = v2;
  sub_1000DFE10((uint64_t *)&unk_1002B7E50);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  return (NSArray *)isa;
}

- (_TtC7TVMusicP33_035D42A14CF7650629E28B54E9D73EE622PlaybackViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC7TVMusicP33_035D42A14CF7650629E28B54E9D73EE622PlaybackViewController_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL, a2);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC7TVMusicP33_035D42A14CF7650629E28B54E9D73EE622PlaybackViewController_playerResponseSubscription));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7TVMusicP33_035D42A14CF7650629E28B54E9D73EE622PlaybackViewController_contentViewController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7TVMusicP33_035D42A14CF7650629E28B54E9D73EE622PlaybackViewController_parents));
}

@end