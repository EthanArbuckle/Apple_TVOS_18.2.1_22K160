@interface PendingProvisioningSharingMessagePrecondition
- (_TtC5passd45PendingProvisioningSharingMessagePrecondition)init;
- (void)channelWasRemotelyTerminatedWithTransportIdentifier:(id)a3;
- (void)dealloc;
- (void)handleOutstandingShareMessage:(id)a3 transportIdentifier:(id)a4;
@end

@implementation PendingProvisioningSharingMessagePrecondition

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC5passd45PendingProvisioningSharingMessagePrecondition_sharingChannelManager);
  v5 = self;
  [v4 removeDelegate:v5];
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[PendingProvisioningSharingMessagePrecondition dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5passd45PendingProvisioningSharingMessagePrecondition_sharingChannelManager));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5passd45PendingProvisioningSharingMessagePrecondition_lock));
  sub_100417E8C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5passd45PendingProvisioningSharingMessagePrecondition_completion),  *(void *)&self->transportIdentifier[OBJC_IVAR____TtC5passd45PendingProvisioningSharingMessagePrecondition_completion]);
  swift_bridgeObjectRelease(*(void *)&self->transportIdentifier[OBJC_IVAR____TtC5passd45PendingProvisioningSharingMessagePrecondition_identifier]);
}

- (_TtC5passd45PendingProvisioningSharingMessagePrecondition)init
{
  result = (_TtC5passd45PendingProvisioningSharingMessagePrecondition *)_swift_stdlib_reportUnimplementedInitializer( "passd.PendingProvisioningSharingMessagePrecondition",  51LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void)handleOutstandingShareMessage:(id)a3 transportIdentifier:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, a2);
  uint64_t v7 = v6;
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC5passd45PendingProvisioningSharingMessagePrecondition_transportIdentifier);
  uint64_t v9 = *(void *)&self->transportIdentifier[OBJC_IVAR____TtC5passd45PendingProvisioningSharingMessagePrecondition_transportIdentifier];
  BOOL v10 = v5 == v8 && v6 == v9;
  if (v10 || (_stringCompareWithSmolCheck(_:_:expecting:)(v5, v6, v8, v9, 0LL) & 1) != 0)
  {
    id v11 = a3;
    v12 = self;
    sub_100434D58();
  }

  else
  {
    id v13 = a3;
  }

  swift_bridgeObjectRelease(v7);
}

- (void)channelWasRemotelyTerminatedWithTransportIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  uint64_t v6 = v5;
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC5passd45PendingProvisioningSharingMessagePrecondition_transportIdentifier);
  uint64_t v8 = *(void *)&self->transportIdentifier[OBJC_IVAR____TtC5passd45PendingProvisioningSharingMessagePrecondition_transportIdentifier];
  BOOL v9 = v4 == v7 && v5 == v8;
  if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, v7, v8, 0LL) & 1) != 0)
  {
    BOOL v10 = self;
    sub_100434D58();
  }

  swift_bridgeObjectRelease(v6);
}

@end