@interface SDAirDropSendStateMachine.BaseRunner
- (_TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner)init;
@end

@implementation SDAirDropSendStateMachine.BaseRunner

- (_TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner)init
{
  result = (_TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner *)_swift_stdlib_reportUnimplementedInitializer( "DaemoniOSLibrary.BaseRunner",  27LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_deviceStatus));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_queue));
  v3 = (char *)self + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_log;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_hapticsManager));
  v5 = (char *)self + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_sendRequest;
  uint64_t v6 = type metadata accessor for SFAirDropSend.Request(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_subject));
  swift_release(*(void *)&self->deviceStatus[OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_yield]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_endpoints));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_backupEndpoints));
  v7 = (char *)self + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_currentTransfer;
  uint64_t v8 = type metadata accessor for SFAirDropSend.Transfer(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_osTransaction));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_displayPriorityReturnToNormalTask));
}

@end