@interface TwoUpColumnViewController
- (NSArray)preferredFocusEnvironments;
- (_TtC22HomeCaptiveViewService25TwoUpColumnViewController)init;
- (_TtC22HomeCaptiveViewService25TwoUpColumnViewController)initWithCoder:(id)a3;
- (_TtC22HomeCaptiveViewService25TwoUpColumnViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation TwoUpColumnViewController

- (_TtC22HomeCaptiveViewService25TwoUpColumnViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  result = (_TtC22HomeCaptiveViewService25TwoUpColumnViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD00000000000001FLL,  0x8000000100012860LL,  "HomeCaptiveViewService/TwoUpColumnViewController.swift",  54LL,  2LL,  29LL,  0);
  __break(1u);
  return result;
}

- (_TtC22HomeCaptiveViewService25TwoUpColumnViewController)init
{
  result = (_TtC22HomeCaptiveViewService25TwoUpColumnViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD00000000000001FLL,  0x8000000100012860LL,  "HomeCaptiveViewService/TwoUpColumnViewController.swift",  54LL,  2LL,  34LL,  0);
  __break(1u);
  return result;
}

- (_TtC22HomeCaptiveViewService25TwoUpColumnViewController)initWithCoder:(id)a3
{
  result = (_TtC22HomeCaptiveViewService25TwoUpColumnViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100012830LL,  "HomeCaptiveViewService/TwoUpColumnViewController.swift",  54LL,  2LL,  38LL,  0);
  __break(1u);
  return result;
}

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3 = sub_100008528(&qword_10001A880);
  uint64_t v4 = swift_allocObject(v3, 40LL, 7LL);
  *(_OWORD *)(v4 + 16) = xmmword_100012ED0;
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22HomeCaptiveViewService25TwoUpColumnViewController_dialogueViewController);
  *(void *)(v4 + 32) = v5;
  uint64_t v9 = v4;
  specialized Array._endMutation()(v4);
  id v6 = v5;
  sub_100008528((uint64_t *)&unk_10001A8F0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return (NSArray *)isa;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TwoUpColumnViewController();
  id v2 = v3.receiver;
  -[TwoUpColumnViewController viewDidLoad](&v3, "viewDidLoad");
  sub_100009208();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22HomeCaptiveViewService25TwoUpColumnViewController_accessoryViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22HomeCaptiveViewService25TwoUpColumnViewController_dialogueViewController));
}

@end