@interface SetupCoordinator
- (PBSViewServiceInterface)remoteViewControllerProxy;
- (UIViewController)hostViewController;
- (_TtC22HomeCaptiveViewService16SetupCoordinator)init;
- (_TtC22HomeCaptiveViewService16SetupCoordinator)initWithHostViewController:(id)a3 remoteViewControllerProxy:(id)a4;
- (void)dismiss;
- (void)menuButtonPressed:(id)a3;
- (void)setHostViewController:(id)a3;
- (void)setRemoteViewControllerProxy:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SetupCoordinator

- (UIViewController)hostViewController
{
  return (UIViewController *)(id)swift_unknownObjectWeakLoadStrong( (char *)self + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_hostViewController,  a2);
}

- (void)setHostViewController:(id)a3
{
}

- (PBSViewServiceInterface)remoteViewControllerProxy
{
  return (PBSViewServiceInterface *)(id)swift_unknownObjectRetain( *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_remoteViewControllerProxy),  a2);
}

- (void)setRemoteViewControllerProxy:(id)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_remoteViewControllerProxy);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_remoteViewControllerProxy) = (Class)a3;
  swift_unknownObjectRetain(a3, a2);
  swift_unknownObjectRelease(v3);
}

- (_TtC22HomeCaptiveViewService16SetupCoordinator)initWithHostViewController:(id)a3 remoteViewControllerProxy:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain(a4, v6);
  v7 = (_TtC22HomeCaptiveViewService16SetupCoordinator *)sub_100008594((uint64_t)v5, (uint64_t)a4);

  swift_unknownObjectRelease(a4);
  return v7;
}

- (void)start
{
  v2 = self;
  sub_1000053D4();
}

- (void)stop
{
  v2 = self;
  sub_100005C60();
}

- (void)dismiss
{
  v2 = self;
  sub_100006780();
}

- (void)menuButtonPressed:(id)a3
{
  uint64_t v4 = qword_10001A450;
  id v5 = a3;
  v11 = self;
  if (v4 != -1) {
    swift_once(&qword_10001A450, sub_10000513C);
  }
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = sub_100004CAC(v6, (uint64_t)qword_10001A660);
  v8 = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Menu button pressed", v10, 2u);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  sub_10000571C(0LL, 6uLL);
}

- (_TtC22HomeCaptiveViewService16SetupCoordinator)init
{
  result = (_TtC22HomeCaptiveViewService16SetupCoordinator *)_swift_stdlib_reportUnimplementedInitializer( "HomeCaptiveViewService.SetupCoordinator",  39LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_navigationController));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_remoteViewControllerProxy));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_setup));
  sub_100008580( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state),  *(void *)&self->hostViewController[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_setupViewController));
}

@end