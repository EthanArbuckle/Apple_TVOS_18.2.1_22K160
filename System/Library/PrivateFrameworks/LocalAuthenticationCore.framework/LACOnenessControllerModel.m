@interface LACOnenessControllerModel
- (BOOL)canProcessRequest:(id)a3;
- (BOOL)isSessionActive;
- (_TtC23LocalAuthenticationCore25LACOnenessControllerModel)init;
- (void)cancelAllRequests;
- (void)cancelRequestsForContextID:(id)a3;
- (void)domainStateForRequest:(id)a3 completion:(id)a4;
- (void)onenessSessionMonitorDidUpdate:(id)a3;
- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5;
- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5;
@end

@implementation LACOnenessControllerModel

- (BOOL)isSessionActive
{
  return objc_msgSend( *(id *)((char *)&self->super.isa + OBJC_IVAR____TtC23LocalAuthenticationCore25LACOnenessControllerModel_sessionMonitor),  sel_isSessionActive);
}

- (void)domainStateForRequest:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC23LocalAuthenticationCore25LACOnenessControllerModel_authenticator);
  v11[4] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSDictionary?, @unowned NSError?) -> ();
  v11[5] = v7;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 1107296256LL;
  v11[2] = thunk for @escaping @callee_guaranteed (@guaranteed [AnyHashable : Any]?, @guaranteed Error?) -> ();
  v11[3] = &block_descriptor_30;
  v9 = _Block_copy(v11);
  swift_unknownObjectRetain();
  v10 = self;
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_domainStateForRequest_completion_, a3, v9);
  _Block_release(v9);
  swift_unknownObjectRelease();

  swift_release();
}

- (BOOL)canProcessRequest:(id)a3
{
  v5 = self;
  char v6 = LACOnenessControllerModel.canProcessRequest(_:)(a3);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
}

- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5
{
}

- (void)cancelAllRequests
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1895F8858](v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56LL))(v5, 1LL, 1LL, v6);
  uint64_t v7 = self;
  LACOnenessControllerModel.cancelPendingRequests(contextID:)((uint64_t)v5);
  outlined destroy of AsyncStream<()>.Continuation?( (uint64_t)v5,  (uint64_t *)&demangling cache variable for type metadata for UUID?);
}

- (void)cancelRequestsForContextID:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1895F8858](v4);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1895F8858](v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v10, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0LL, 1LL, v7);
  v11 = self;
  LACOnenessControllerModel.cancelPendingRequests(contextID:)((uint64_t)v6);
  outlined destroy of AsyncStream<()>.Continuation?( (uint64_t)v6,  (uint64_t *)&demangling cache variable for type metadata for UUID?);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC23LocalAuthenticationCore25LACOnenessControllerModel)init
{
  result = (_TtC23LocalAuthenticationCore25LACOnenessControllerModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23LocalAuthenticationCore25LACOnenessControllerModel_replyQueue));
  swift_bridgeObjectRelease();
}

- (void)onenessSessionMonitorDidUpdate:(id)a3
{
  uint64_t v4 = self;
  LACOnenessControllerModel.handleSessionUpdate()();
  swift_unknownObjectRelease();
}

@end