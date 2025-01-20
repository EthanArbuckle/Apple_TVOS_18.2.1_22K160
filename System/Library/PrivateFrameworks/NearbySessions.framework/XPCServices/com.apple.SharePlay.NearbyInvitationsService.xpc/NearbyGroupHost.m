@interface NearbyGroupHost
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC44com_apple_SharePlay_NearbyInvitationsService15NearbyGroupHost)init;
@end

@implementation NearbyGroupHost

- (_TtC44com_apple_SharePlay_NearbyInvitationsService15NearbyGroupHost)init
{
  result = (_TtC44com_apple_SharePlay_NearbyInvitationsService15NearbyGroupHost *)_swift_stdlib_reportUnimplementedInitializer( "com_apple_SharePlay_NearbyInvitation sService.NearbyGroupHost",  60LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService15NearbyGroupHost_id;
  uint64_t v4 = type metadata accessor for UUID(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService15NearbyGroupHost_listener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService15NearbyGroupHost_queue));
  v5 = (char *)self + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService15NearbyGroupHost__members;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Set<NearbyGroupMember>>);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
  __swift_destroy_boxed_opaque_existential_0Tm((Class *)((char *)&self->super.isa
                                                       + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService15NearbyGroupHost_localMember));
  swift_bridgeObjectRelease(*(void *)&self->listener[OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService15NearbyGroupHost_localMemberToken]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService15NearbyGroupHost_idsService));
  v7 = (char *)self + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService15NearbyGroupHost__state;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<NearbyGroupHost.State>);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService15NearbyGroupHost_connection));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService15NearbyGroupHost_incomingMessageListenerTask));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService15NearbyGroupHost_cancellables));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  char v9 = specialized NearbyGroupHost.listener(_:shouldAcceptNewConnection:)(v7);

  return v9 & 1;
}

@end