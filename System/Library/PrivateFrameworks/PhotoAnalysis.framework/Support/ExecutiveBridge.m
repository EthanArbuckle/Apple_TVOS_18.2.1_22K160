@interface ExecutiveBridge
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC14photoanalysisd15ExecutiveBridge)init;
- (id)targetForOriginalTarget:(id)a3 connection:(id)a4 selector:(SEL)a5;
- (void)dispatchOperation:(id)a3 toTarget:(id)a4 service:(id)a5;
- (void)dumpStatusToLog;
- (void)shutdown;
- (void)startup;
@end

@implementation ExecutiveBridge

- (_TtC14photoanalysisd15ExecutiveBridge)init
{
  return (_TtC14photoanalysisd15ExecutiveBridge *)ExecutiveBridge.init()();
}

- (void)startup
{
}

- (void)shutdown
{
}

- (void)dumpStatusToLog
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (NSXPCListener *)a3;
  v7 = (NSXPCConnection *)a4;
  v8 = self;
  Swift::Bool v9 = ExecutiveBridge.listener(_:shouldAcceptNewConnection:)(v6, v7);

  return v9;
}

- (void).cxx_destruct
{
}

- (id)targetForOriginalTarget:(id)a3 connection:(id)a4 selector:(SEL)a5
{
  id v9 = a4;
  v10 = self;
  _bridgeAnyObjectToAny(_:)(v18, a3);
  swift_unknownObjectRelease(a3);
  ExecutiveBridge.target(forOriginalTarget:connection:selector:)((uint64_t)v18, (uint64_t)v9, (uint64_t)a5, (uint64_t)v19);

  sub_1000063C0(v18);
  uint64_t v11 = v20;
  if (!v20) {
    return 0LL;
  }
  v12 = sub_1000063E0(v19, v20);
  uint64_t v13 = *(void *)(v11 - 8);
  __chkstk_darwin(v12, v12);
  v15 = (char *)v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *))(v13 + 16))(v15);
  v16 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v15, v11);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
  sub_1000063C0(v19);
  return v16;
}

- (void)dispatchOperation:(id)a3 toTarget:(id)a4 service:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain(a4);
  swift_unknownObjectRetain(a5);
  id v9 = self;
  _bridgeAnyObjectToAny(_:)(v11, a4);
  swift_unknownObjectRelease(a4);
  _bridgeAnyObjectToAny(_:)(v10, a5);
  swift_unknownObjectRelease(a5);
  _s14photoanalysisd15ExecutiveBridgeC17dispatchOperation_8toTarget7serviceySo020PHAServiceCancelableE0C_ypyptF_0( (uint64_t)v8,  (uint64_t)v11,  (uint64_t)v10);

  sub_1000063C0(v10);
  sub_1000063C0(v11);
}

@end