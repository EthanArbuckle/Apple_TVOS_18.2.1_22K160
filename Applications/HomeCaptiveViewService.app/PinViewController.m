@interface PinViewController
- (NSString)title;
- (_TtC22HomeCaptiveViewService17PinViewController)init;
- (_TtC22HomeCaptiveViewService17PinViewController)initWithCoder:(id)a3;
- (_TtC22HomeCaptiveViewService17PinViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setTitle:(id)a3;
- (void)viewDidLoad;
@end

@implementation PinViewController

- (NSString)title
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for PinViewController();
  id v2 = v10.receiver;
  v3 = -[PinViewController title](&v10, "title");
  if (v3)
  {
    v5 = v3;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);
    uint64_t v7 = v6;

    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
    return (NSString *)v8;
  }

  else
  {

    return (NSString *)0LL;
  }

- (void)setTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    uint64_t v6 = v5;
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v6 = 0LL;
  }

  uint64_t v7 = self;
  sub_1000042C4(v4, v6);
}

- (_TtC22HomeCaptiveViewService17PinViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController____lazy_storage___backgroundView) = (Class)1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController_digitEntryViewController) = 0LL;
  uint64_t v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController_clientName);
  void *v5 = 0LL;
  v5[1] = 0LL;
  id v6 = a4;

  result = (_TtC22HomeCaptiveViewService17PinViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD00000000000002ELL,  0x8000000100012060LL,  "HomeCaptiveViewService/PinViewController.swift",  46LL,  2LL,  43LL,  0);
  __break(1u);
  return result;
}

- (_TtC22HomeCaptiveViewService17PinViewController)init
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController____lazy_storage___backgroundView) = (Class)1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController_digitEntryViewController) = 0LL;
  id v2 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController_clientName);
  *id v2 = 0LL;
  v2[1] = 0LL;

  result = (_TtC22HomeCaptiveViewService17PinViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD00000000000002ELL,  0x8000000100012060LL,  "HomeCaptiveViewService/PinViewController.swift",  46LL,  2LL,  48LL,  0);
  __break(1u);
  return result;
}

- (_TtC22HomeCaptiveViewService17PinViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController____lazy_storage___backgroundView) = (Class)1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController_digitEntryViewController) = 0LL;
  uint64_t v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController_clientName);
  *uint64_t v4 = 0LL;
  v4[1] = 0LL;
  id v5 = a3;

  result = (_TtC22HomeCaptiveViewService17PinViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD00000000000002ELL,  0x8000000100012060LL,  "HomeCaptiveViewService/PinViewController.swift",  46LL,  2LL,  53LL,  0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2 = self;
  sub_100004544();
}

- (void).cxx_destruct
{
  sub_100004D04(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController____lazy_storage___backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController_digitEntryViewController));
  swift_bridgeObjectRelease(*(void *)&self->$__lazy_storage_$_backgroundView[OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController_pin]);
  swift_bridgeObjectRelease(*(void *)&self->$__lazy_storage_$_backgroundView[OBJC_IVAR____TtC22HomeCaptiveViewService17PinViewController_clientName]);
}

@end