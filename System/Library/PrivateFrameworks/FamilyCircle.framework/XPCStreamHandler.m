@interface XPCStreamHandler
- (_TtC13familycircled16XPCStreamHandler)init;
- (void)setEventHandlerForStream:(id)a3 queue:(id)a4 handler:(id)a5;
@end

@implementation XPCStreamHandler

- (void)setEventHandlerForStream:(id)a3 queue:(id)a4 handler:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v11 = v10;
  uint64_t v12 = swift_allocObject(&unk_100042BB0, 24LL, 7LL);
  *(void *)(v12 + 16) = v8;
  uint64_t v13 = swift_allocObject(&unk_100042BD8, 32LL, 7LL);
  *(void *)(v13 + 16) = sub_1000271CC;
  *(void *)(v13 + 24) = v12;
  v19[4] = sub_100027200;
  uint64_t v20 = v13;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 1107296256LL;
  v19[2] = sub_100026B2C;
  v19[3] = &unk_100042BF0;
  v14 = _Block_copy(v19);
  uint64_t v15 = v20;
  v16 = (dispatch_queue_s *)a4;
  v17 = self;
  swift_retain(v12);
  swift_release(v15);
  uint64_t v18 = String.utf8CString.getter(v9, v11);
  xpc_set_event_stream_handler((const char *)(v18 + 32), v16, v14);
  swift_release(v18);
  _Block_release(v14);

  swift_bridgeObjectRelease(v11);
  swift_release(v12);
}

- (_TtC13familycircled16XPCStreamHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for XPCStreamHandler();
  return -[XPCStreamHandler init](&v3, "init");
}

@end