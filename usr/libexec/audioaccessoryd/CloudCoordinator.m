@interface CloudCoordinator
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)isMemberOfClass:(Class)a3;
- (BOOL)isProxy;
- (BOOL)respondsToSelector:(SEL)a3;
- (Class)superclass;
- (NSString)cloudContainerIdentifier;
- (NSString)debugDescription;
- (NSString)description;
- (OS_dispatch_queue)pushDelegateQueue;
- (_TtC15audioaccessoryd16CloudCoordinator)self;
- (id)performSelector:(SEL)a3;
- (id)performSelector:(SEL)a3 withObject:(id)a4;
- (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5;
- (int64_t)hash;
- (void)accountDidChange:(id)a3;
- (void)didReceiveWithMessage:(id)a3;
- (void)didReceiveWithPublicToken:(id)a3;
- (void)didReceiveWithToken:(id)a3 forTopic:(id)a4 identifier:(id)a5;
- (void)onIdentityUpdateNotification;
- (void)setPushDelegateQueue:(id)a3;
@end

@implementation CloudCoordinator

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    swift_retain(self);
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_release(self);
    swift_unknownObjectRelease(a3);
  }

  else
  {
    memset(v6, 0, sizeof(v6));
  }

  sub_1000AD3A8((uint64_t)v6);
  return 0;
}

- (int64_t)hash
{
  id v3 = [(id)swift_retain(self) cloudContainerIdentifier];
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  uint64_t v6 = v5;

  int64_t v7 = String.hashValue.getter(v4, v6);
  swift_release(self);
  swift_bridgeObjectRelease(v6);
  return v7;
}

- (Class)superclass
{
  uint64_t v2 = type metadata accessor for CloudCoordinator(0LL);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC15audioaccessoryd16CloudCoordinator)self
{
  return (_TtC15audioaccessoryd16CloudCoordinator *)(id)swift_retain(self);
}

- (id)performSelector:(SEL)a3
{
  id v4 = [(id)swift_retain(self) cloudContainerIdentifier];
  swift_release(self);
  return v4;
}

- (id)performSelector:(SEL)a3 withObject:(id)a4
{
  if (a4)
  {
    swift_retain(self);
    swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(&v8);
    swift_unknownObjectRelease(a4);
  }

  else
  {
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    swift_retain(self);
  }

  uint64_t v6 = -[CloudCoordinator cloudContainerIdentifier](self, "cloudContainerIdentifier", v8, v9);
  swift_release(self);
  sub_1000AD3A8((uint64_t)&v8);
  return v6;
}

- (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  if (!a4)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    swift_unknownObjectRetain(a5);
    swift_retain(self);
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    goto LABEL_6;
  }

  swift_unknownObjectRetain(a5);
  swift_retain(self);
  swift_unknownObjectRetain(a4);
  _bridgeAnyObjectToAny(_:)(&v12);
  swift_unknownObjectRelease(a4);
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  _bridgeAnyObjectToAny(_:)(&v10);
  swift_unknownObjectRelease(a5);
LABEL_6:
  __int128 v8 = -[CloudCoordinator cloudContainerIdentifier](self, "cloudContainerIdentifier", v10, v11, v12, v13);
  swift_release(self);
  sub_1000AD3A8((uint64_t)&v10);
  sub_1000AD3A8((uint64_t)&v12);
  return v8;
}

- (BOOL)isProxy
{
  return 0;
}

- (BOOL)isKindOfClass:(Class)a3
{
  return 0;
}

- (BOOL)isMemberOfClass:(Class)a3
{
  return 0;
}

- (BOOL)conformsToProtocol:(id)a3
{
  return 0;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return 0;
}

- (NSString)description
{
  return (NSString *)sub_10010A5C8((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1000F39F0);
}

- (NSString)debugDescription
{
  uint64_t v4 = v3;
  swift_release(self);
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (OS_dispatch_queue)pushDelegateQueue
{
  uint64_t v4 = sub_1000F3CA8(v3);
  swift_release(self);
  return (OS_dispatch_queue *)v4;
}

- (void)setPushDelegateQueue:(id)a3
{
  __n128 v3 = *(void **)self->$__lazy_storage_$_pushDelegateQueue;
  *(void *)self->$__lazy_storage_$_pushDelegateQueue = a3;
  id v4 = a3;
  sub_1001136A8(v3);
}

- (void)onIdentityUpdateNotification
{
  uint64_t v3 = swift_retain(self);
  sub_1000FEF38(v3);
  swift_release(self);
}

- (void)accountDidChange:(id)a3
{
  uint64_t v5 = type metadata accessor for Notification(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  __int128 v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = swift_retain(self);
  sub_10010146C(v9);
  swift_release(self);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (NSString)cloudContainerIdentifier
{
  return (NSString *)sub_10010A5C8((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_10010A624);
}

- (void)didReceiveWithPublicToken:(id)a3
{
  id v5 = a3;
  swift_retain(self);
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v8 = v7;

  uint64_t v10 = static os_log_type_t.default.getter(v9);
  if (qword_100234C18 != -1) {
    swift_once(&qword_100234C18, sub_10018A920);
  }
  uint64_t v11 = qword_10023DFB8;
  uint64_t v12 = sub_100098CD8((uint64_t *)&unk_100234E00);
  uint64_t v13 = swift_allocObject(v12, 72LL, 7LL);
  *(_OWORD *)(v13 + 16) = xmmword_1001A5EA0;
  Data.hexString.getter(v6, v8);
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  *(void *)(v13 + 56) = &type metadata for String;
  *(void *)(v13 + 64) = sub_10009914C();
  *(void *)(v13 + 32) = v15;
  *(void *)(v13 + 40) = v17;
  os_log(_:dso:log:_:_:)(v10, &_mh_execute_header, v11, "APS public token: <%@>", 22LL, 2LL, v13);
  swift_bridgeObjectRelease(v13);
  sub_100099394(v6, v8);
  swift_release(self);
}

- (void)didReceiveWithToken:(id)a3 forTopic:(id)a4 identifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  swift_retain(self);
  uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v14 = v13;

  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
  uint64_t v17 = v16;

  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  uint64_t v20 = v19;

  sub_100112B0C(v12, v14, v15, v17, v18, v20);
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v20);
  sub_100099394(v12, v14);
  swift_release(self);
}

- (void)didReceiveWithMessage:(id)a3
{
  id v4 = a3;
  swift_retain(self);
  sub_10010B8B8(v4);

  swift_release(self);
}

@end