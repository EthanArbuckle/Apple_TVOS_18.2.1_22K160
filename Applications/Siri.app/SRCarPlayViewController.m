@interface SRCarPlayViewController
- (NSArray)preferredFocusEnvironments;
- (_TtC4Siri23SRCarPlayViewController)initWithCoder:(id)a3;
- (_TtC4Siri23SRCarPlayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)clearSnippet;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SRCarPlayViewController

- (_TtC4Siri23SRCarPlayViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100064110((uint64_t)v3, v4, v5);
}

  ;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SRCarPlayViewController();
  uint64_t v4 = (char *)v11.receiver;
  -[SRCarPlayViewController viewDidAppear:](&v11, "viewDidAppear:", v3);
  uint64_t v5 = &v4[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate];
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate], v6);
  if (Strong)
  {
    uint64_t v8 = Strong;
    uint64_t v9 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType(Strong);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 8))(v4, ObjectType, v9);

    swift_unknownObjectRelease(v8);
  }

  else
  {
  }

- (void)loadView
{
  uint64_t v2 = qword_1000D8A20;
  BOOL v3 = self;
  if (v2 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = sub_10004ADF0(v4, (uint64_t)qword_1000D9988);
  os_log_type_t v6 = static os_log_type_t.info.getter(v5);
  sub_1000681D8(v6, 0x10uLL, 0x7765695664616F6CLL, 0xEA00000000002928LL, 0LL, 0LL);
  v7 = objc_allocWithZone((Class)type metadata accessor for SRCarPlayView());
  uint64_t v8 = v3;
  v10 = sub_1000632B4(v8, v7, v9);
  -[SRCarPlayViewController setView:](v8, "setView:", v10);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for SRCarPlayViewController();
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (char *)v15.receiver;
  -[SRCarPlayViewController didUpdateFocusInContext:withAnimationCoordinator:]( &v15,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  v7);
  uint64_t v9 = &v8[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate];
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(&v8[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate], v10);
  if (Strong)
  {
    uint64_t v12 = Strong;
    uint64_t v13 = *((void *)v9 + 1);
    uint64_t ObjectType = swift_getObjectType(Strong);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 24))(v8, ObjectType, v13);

    swift_unknownObjectRelease(v12);
  }

  else
  {
  }
}

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3 = sub_10004A8E8(&qword_1000D97E0);
  uint64_t v4 = swift_allocObject(v3, 40LL, 7LL);
  *(_OWORD *)(v4 + 16) = xmmword_100083230;
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController);
  if (v5) {
    id v6 = *(_TtC4Siri23SRCarPlayViewController **)((char *)&self->super.super.super.isa
  }
                                                + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController);
  else {
    id v6 = self;
  }
  *(void *)(v4 + 32) = v6;
  specialized Array._endMutation()(v6);
  id v7 = v5;
  sub_10004A8E8(&qword_1000D97F0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSArray *)isa;
}

- (_TtC4Siri23SRCarPlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC4Siri23SRCarPlayViewController *)_swift_stdlib_reportUnimplementedInitializer( "Siri.SRCarPlayViewController",  28LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController));
  sub_100053404((uint64_t)self + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_requestOptions));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delayedAceCommands));
}

- (void)clearSnippet
{
  uint64_t v2 = qword_1000D8A20;
  id v6 = self;
  if (v2 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v3 = type metadata accessor for Logger(0LL);
  uint64_t v4 = sub_10004ADF0(v3, (uint64_t)qword_1000D9988);
  os_log_type_t v5 = static os_log_type_t.info.getter(v4);
  sub_1000681D8(v5, 0x10uLL, 0x696E537261656C63LL, 0xEE00292874657070LL, 0xD00000000000004DLL, 0x800000010008B9D0LL);
  sub_100061C88(0LL, 0LL, 1);
}

@end