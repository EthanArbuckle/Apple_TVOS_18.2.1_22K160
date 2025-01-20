@interface SDAirDropReceiveClassroomHandler
- (SDAirDropAlertManagerDelegate)classroomDelegate;
- (SDAirDropAlertManagerDelegate)delegate;
- (_TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler)init;
- (void)askEventForRecordID:(id)a3 withResults:(id)a4;
- (void)cancelEventForRecordID:(id)a3 withResults:(id)a4;
- (void)errorEventForRecordID:(id)a3 withResults:(id)a4;
- (void)finishedEventForRecordID:(id)a3 withResults:(id)a4;
- (void)setClassroomDelegate:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SDAirDropReceiveClassroomHandler

- (SDAirDropAlertManagerDelegate)delegate
{
  return (SDAirDropAlertManagerDelegate *)(id)swift_unknownObjectWeakLoadStrong( (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler_delegate,  a2);
}

- (void)setDelegate:(id)a3
{
}

- (SDAirDropAlertManagerDelegate)classroomDelegate
{
  return (SDAirDropAlertManagerDelegate *)(id)swift_unknownObjectWeakLoadStrong( (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler_classroomDelegate,  a2);
}

- (void)setClassroomDelegate:(id)a3
{
}

- (void)askEventForRecordID:(id)a3 withResults:(id)a4
{
}

- (void)cancelEventForRecordID:(id)a3 withResults:(id)a4
{
}

- (void)errorEventForRecordID:(id)a3 withResults:(id)a4
{
}

- (void)finishedEventForRecordID:(id)a3 withResults:(id)a4
{
}

- (_TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler)init
{
  result = (_TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler *)_swift_stdlib_reportUnimplementedInitializer( "DaemoniOSLibrary.SDAirDropReceiveClassroomHandler",  49LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler_stateMachine));
  sub_100195658((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler_delegate);
  sub_100195658((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler_classroomDelegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler_queue));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16DaemoniOSLibrary32SDAirDropReceiveClassroomHandler_continuations));
}

@end