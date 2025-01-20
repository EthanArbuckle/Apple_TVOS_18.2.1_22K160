@interface LACOnenessController
- (BOOL)canProcessRequest:(id)a3;
- (BOOL)isSessionActive;
- (LACOnenessController)initWithSessionMonitor:(id)a3 authenticator:(id)a4 uiPresenter:(id)a5 replyQueue:(id)a6;
- (id)authenticator;
- (id)makeModel;
- (id)model;
- (id)replyQueue;
- (id)sessionMonitor;
- (id)uiPresenter;
- (void)cancelAllRequests;
- (void)cancelRequestsForContextID:(id)a3;
- (void)domainStateForRequest:(id)a3 completion:(id)a4;
- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5;
- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5;
@end

@implementation LACOnenessController

- (LACOnenessController)initWithSessionMonitor:(id)a3 authenticator:(id)a4 uiPresenter:(id)a5 replyQueue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___LACOnenessController;
  v15 = -[LACOnenessController init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_authenticator, a4);
    objc_storeStrong((id *)&v16->_sessionMonitor, a3);
    objc_storeStrong((id *)&v16->_replyQueue, a6);
    objc_storeStrong((id *)&v16->_uiPresenter, a5);
    uint64_t v17 = -[LACOnenessController makeModel](v16, "makeModel");
    model = v16->_model;
    v16->_model = (LACOnenessControlling *)v17;
  }

  return v16;
}

- (id)model
{
  return self->_model;
}

- (id)sessionMonitor
{
  return self->_sessionMonitor;
}

- (id)authenticator
{
  return self->_authenticator;
}

- (id)uiPresenter
{
  return self->_uiPresenter;
}

- (id)replyQueue
{
  return self->_replyQueue;
}

- (void).cxx_destruct
{
}

- (BOOL)isSessionActive
{
  v2 = self;
  unsigned __int8 v3 = objc_msgSend( -[LACOnenessController model](v2, sel_model),  sel_isSessionActive);

  swift_unknownObjectRelease();
  return v3;
}

- (void)domainStateForRequest:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  swift_unknownObjectRetain();
  v8 = self;
  id v9 = -[LACOnenessController model](v8, sel_model);
  v11[4] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSDictionary?, @unowned NSError?) -> ();
  v11[5] = v7;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 1107296256LL;
  v11[2] = thunk for @escaping @callee_guaranteed (@guaranteed [AnyHashable : Any]?, @guaranteed Error?) -> ();
  v11[3] = &block_descriptor_22_0;
  v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_domainStateForRequest_completion_, a3, v10);
  _Block_release(v10);
  swift_unknownObjectRelease();

  swift_release();
  swift_unknownObjectRelease();
}

- (BOOL)canProcessRequest:(id)a3
{
  v5 = self;
  unsigned __int8 v6 = objc_msgSend( -[LACOnenessController model](v5, sel_model),  sel_canProcessRequest_,  a3);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v6;
}

- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  swift_unknownObjectRetain();
  id v10 = a4;
  id v11 = self;
  id v12 = -[LACOnenessController model](v11, sel_model);
  v14[4] = thunk for @escaping @callee_unowned @convention(block) (@unowned LACEvaluationResult) -> ()partial apply;
  v14[5] = v9;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 1107296256LL;
  v14[2] = thunk for @escaping @callee_guaranteed (@guaranteed LACDTOLocationState) -> ();
  v14[3] = &block_descriptor_16;
  id v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_processRequest_configuration_completion_, a3, v10, v13);
  _Block_release(v13);
  swift_unknownObjectRelease();

  swift_release();
  swift_unknownObjectRelease();
}

- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  swift_unknownObjectRetain();
  id v10 = a4;
  id v11 = self;
  id v12 = -[LACOnenessController model](v11, sel_model);
  if (objc_msgSend(v12, sel_respondsToSelector_, sel_postProcessRequest_result_completion_))
  {
    v14[4] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned LACEvaluationResult) -> ();
    v14[5] = v9;
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 1107296256LL;
    v14[2] = thunk for @escaping @callee_guaranteed (@guaranteed LACDTOLocationState) -> ();
    v14[3] = &block_descriptor_9;
    id v13 = _Block_copy(v14);
    swift_retain();
    objc_msgSend(v12, sel_postProcessRequest_result_completion_, a3, v10, v13);
    _Block_release(v13);
    swift_unknownObjectRelease();

    swift_release();
    swift_unknownObjectRelease();
    swift_release();
  }

  else
  {
    swift_unknownObjectRelease();

    swift_release();
    swift_unknownObjectRelease();
  }

- (void)cancelAllRequests
{
  v2 = self;
  objc_msgSend(-[LACOnenessController model](v2, sel_model), sel_cancelAllRequests);

  swift_unknownObjectRelease();
}

- (void)cancelRequestsForContextID:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  id v9 = -[LACOnenessController model](v8, sel_model);
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v9, sel_cancelRequestsForContextID_, isa);

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (id)makeModel
{
  v2 = self;
  id v3 = -[LACOnenessController authenticator](v2, sel_authenticator);
  id v4 = -[LACOnenessController sessionMonitor](v2, sel_sessionMonitor);
  id v5 = -[LACOnenessController uiPresenter](v2, sel_uiPresenter);
  id v6 = -[LACOnenessController replyQueue](v2, sel_replyQueue);
  id v7 = objc_allocWithZone((Class)type metadata accessor for LACOnenessControllerModel());
  id v8 = LACOnenessControllerModel.init(authenticator:sessionMonitor:uiPresenter:replyQueue:)( (uint64_t)v3,  (uint64_t)v4,  (uint64_t)v5,  v6);

  return v8;
}

@end