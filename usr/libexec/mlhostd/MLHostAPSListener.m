@interface MLHostAPSListener
- (_TtC7mlhostd17MLHostAPSListener)init;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
@end

@implementation MLHostAPSListener

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    v7 = self;
    id v8 = a4;
    uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
    unint64_t v11 = v10;
  }

  else
  {
    id v12 = a3;
    v13 = self;
    uint64_t v9 = 0LL;
    unint64_t v11 = 0xF000000000000000LL;
  }

  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v14 = type metadata accessor for Logger(0LL);
  uint64_t v15 = sub_10000C538(v14, (uint64_t)qword_10005A7E0);
  v16 = (os_log_s *)Logger.logObject.getter(v15);
  os_log_type_t v17 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Received public push token", v18, 2u);
    swift_slowDealloc(v18, -1LL, -1LL);
  }

  sub_10000C5B0(v9, v11);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10000BE1C(a4);
}

- (_TtC7mlhostd17MLHostAPSListener)init
{
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7mlhostd17MLHostAPSListener_handleMessage);
  void *v4 = nullsub_1;
  v4[1] = 0LL;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[MLHostAPSListener init](&v6, "init");
}

- (void).cxx_destruct
{
}

@end