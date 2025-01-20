@interface LogKey
+ (BOOL)supportsSecureCoding;
+ (NSArray)appInstallProperties;
- (BOOL)isEqual:(id)a3;
- (_TtC9appstored6LogKey)init;
- (_TtC9appstored6LogKey)initWithAppInstallDictionary:(id)a3;
- (_TtC9appstored6LogKey)initWithAppInstallEntity:(id)a3;
- (_TtC9appstored6LogKey)initWithAppInstallMemoryEntity:(id)a3;
- (_TtC9appstored6LogKey)initWithBase:(id)a3;
- (_TtC9appstored6LogKey)initWithBase:(id)a3 IDs:(id)a4;
- (_TtC9appstored6LogKey)initWithBaseUUID:(id)a3;
- (_TtC9appstored6LogKey)initWithBaseUUIDString:(id)a3;
- (_TtC9appstored6LogKey)initWithBatchLogKey:(id)a3 logCode:(id)a4 externalID:(id)a5 bundleID:(id)a6 itemID:(id)a7;
- (_TtC9appstored6LogKey)initWithCategory:(id)a3;
- (_TtC9appstored6LogKey)initWithCategory:(id)a3 base:(id)a4;
- (_TtC9appstored6LogKey)initWithCategory:(id)a3 baseUUID:(id)a4;
- (_TtC9appstored6LogKey)initWithCode:(id)a3;
- (_TtC9appstored6LogKey)initWithCode:(id)a3 IDs:(id)a4;
- (_TtC9appstored6LogKey)initWithCode:(id)a3 base:(id)a4;
- (_TtC9appstored6LogKey)initWithCode:(id)a3 base:(id)a4 ID:(id)a5;
- (_TtC9appstored6LogKey)initWithCoder:(id)a3;
- (_TtC9appstored6LogKey)initWithCoordinatorTag:(id)a3 logCode:(id)a4;
- (id)description;
- (id)makeActivity;
- (id)prependingCategory:(id)a3;
- (int64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LogKey

- (_TtC9appstored6LogKey)initWithBatchLogKey:(id)a3 logCode:(id)a4 externalID:(id)a5 bundleID:(id)a6 itemID:(id)a7
{
  uint64_t v13 = sub_1000079A0((uint64_t *)&unk_10045AC20);
  uint64_t v14 = __chkstk_darwin(v13);
  v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  v18 = (char *)&v34 - v17;
  if (a5)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5);
    uint64_t v19 = type metadata accessor for UUID(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56LL))(v18, 0LL, 1LL, v19);
  }

  else
  {
    uint64_t v21 = type metadata accessor for UUID(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56LL))(v18, 1LL, 1LL, v21);
  }

  if (a6)
  {
    uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
    uint64_t v23 = v20;
  }

  else
  {
    uint64_t v22 = 0LL;
    uint64_t v23 = 0LL;
  }

  uint64_t ObjectType = swift_getObjectType(self, v20);
  sub_100026D40((uint64_t)v18, (uint64_t)v16, (uint64_t *)&unk_10045AC20);
  if (a7)
  {
    uint64_t v34 = 0LL;
    char v35 = 1;
    id v25 = a7;
    id v26 = a3;
    id v27 = a4;
    static UInt64._conditionallyBridgeFromObjectiveC(_:result:)(v25, &v34);
    uint64_t v28 = v34;
    char v29 = v35;
  }

  else
  {
    id v30 = a3;
    id v31 = a4;
    uint64_t v28 = 0LL;
    char v29 = 1;
  }

  v32 = sub_100037828((char *)a3, a4, (uint64_t)v16, v22, v23, v28, v29);

  sub_100015240((uint64_t)v18, (uint64_t *)&unk_10045AC20);
  swift_deallocPartialClassInstance(self, ObjectType, 56LL, 7LL);
  return (_TtC9appstored6LogKey *)v32;
}

- (_TtC9appstored6LogKey)initWithCoordinatorTag:(id)a3 logCode:(id)a4
{
  return (_TtC9appstored6LogKey *)sub_100037198(a3, a4);
}

- (_TtC9appstored6LogKey)initWithAppInstallDictionary:(id)a3
{
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  return (_TtC9appstored6LogKey *)sub_100037310(v3, v4);
}

+ (NSArray)appInstallProperties
{
  uint64_t v2 = sub_100037FB4();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (_TtC9appstored6LogKey)initWithAppInstallEntity:(id)a3
{
  return (_TtC9appstored6LogKey *)sub_100037574( a3,  (uint64_t (*)(void *))sub_10021B718,  (uint64_t (*)(void *))sub_10021B6D0,  (uint64_t (*)(void *))sub_10021B880);
}

- (_TtC9appstored6LogKey)initWithAppInstallMemoryEntity:(id)a3
{
  return (_TtC9appstored6LogKey *)sub_100037574( a3,  (uint64_t (*)(void *))sub_100323DAC,  (uint64_t (*)(void *))sub_100323D88,  (uint64_t (*)(void *))sub_100323DD0);
}

- (_TtC9appstored6LogKey)initWithBaseUUIDString:(id)a3
{
  return (_TtC9appstored6LogKey *)sub_1000910A4( (uint64_t)self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t (*)(uint64_t, uint64_t))sub_10008FDCC);
}

- (void)dealloc
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored6LogKey_activity))
  {
    uint64_t v4 = (os_activity_scope_state_s *)((char *)self + OBJC_IVAR____TtC9appstored6LogKey_activityState);
    swift_beginAccess((char *)self + OBJC_IVAR____TtC9appstored6LogKey_activityState, v7, 33LL, 0LL);
    v5 = self;
    os_activity_scope_leave(v4);
    swift_endAccess(v7);
  }

  else
  {
    v6 = self;
  }

  v8.receiver = self;
  v8.super_class = ObjectType;
  -[LogKey dealloc](&v8, "dealloc");
}

- (void).cxx_destruct
{
}

- (id)makeActivity
{
  uint64_t v2 = self;
  sub_10008FCB0();

  return v2;
}

- (id)prependingCategory:(id)a3
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType(self, a2);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v8 = v7;
  uint64_t v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored6LogKey_value);
  unint64_t v10 = *(void *)&self->value[OBJC_IVAR____TtC9appstored6LogKey_value];
  uint64_t v11 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored6LogKey_activity);
  id v12 = objc_allocWithZone(ObjectType);
  swift_unknownObjectRetain(v11);
  swift_bridgeObjectRetain(v10);
  uint64_t v13 = sub_100091D84(v6, v8, "/", 1LL, 2u, 0LL, 0xE000000000000000LL, v9, v10, v11);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v10);
  swift_unknownObjectRelease(v11);
  return v13;
}

- (_TtC9appstored6LogKey)init
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType(self, a2);
  uint64_t v14 = 0LL;
  swift_stdlib_random(&v14, 8LL);
  int v13 = v14;
  unint64_t v4 = sub_1000380CC();
  uint64_t v5 = String.init<A>(_:radix:uppercase:)(&v13, 16LL, 1LL, &type metadata for UInt32, v4);
  unint64_t v7 = v6;
  id v8 = objc_allocWithZone(ObjectType);
  uint64_t v9 = sub_100091D84(0LL, 0xE000000000000000LL, "/", 1LL, 2u, 0LL, 0xE000000000000000LL, v5, v7, 0LL);
  swift_bridgeObjectRelease(v7);
  uint64_t v11 = swift_getObjectType(self, v10);
  swift_deallocPartialClassInstance(self, v11, 56LL, 7LL);
  return (_TtC9appstored6LogKey *)v9;
}

- (id)description
{
  uint64_t v1 = *(void *)(a1 + OBJC_IVAR____TtC9appstored6LogKey_value + 8);
  swift_bridgeObjectRetain(v1);
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v1);
  return v2;
}

- (int64_t)hash
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored6LogKey_value);
  uint64_t v3 = *(void *)&self->value[OBJC_IVAR____TtC9appstored6LogKey_value];
  unint64_t v4 = self;
  int64_t v5 = String.hashValue.getter(v2, v3);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    int64_t v5 = self;
    uint64_t v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v11, v6);
    swift_unknownObjectRelease(a3);
  }

  else
  {
    memset(v11, 0, sizeof(v11));
    id v8 = self;
  }

  char v9 = sub_1000902E8((uint64_t)v11, v7);

  sub_100015240((uint64_t)v11, (uint64_t *)&unk_1004594B0);
  return v9 & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = self;
  sub_100090548(v4);
}

- (_TtC9appstored6LogKey)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC9appstored6LogKey *)sub_1000906B4(v3, v4);
}

- (_TtC9appstored6LogKey)initWithBase:(id)a3
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (a3)
  {
    a3 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    unint64_t v7 = v6;
  }

  else
  {
    unint64_t v7 = 0xE000000000000000LL;
  }

  id v8 = objc_allocWithZone(ObjectType);
  char v9 = sub_100091D84(0LL, 0xE000000000000000LL, "/", 1LL, 2u, 0LL, 0xE000000000000000LL, (uint64_t)a3, v7, 0LL);
  swift_bridgeObjectRelease(v7);
  uint64_t v11 = swift_getObjectType(self, v10);
  swift_deallocPartialClassInstance(self, v11, 56LL, 7LL);
  return (_TtC9appstored6LogKey *)v9;
}

- (_TtC9appstored6LogKey)initWithCategory:(id)a3 base:(id)a4
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (a3)
  {
    a3 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    unint64_t v9 = v8;
    if (a4)
    {
LABEL_3:
      uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
      goto LABEL_6;
    }
  }

  else
  {
    unint64_t v9 = 0LL;
    if (a4) {
      goto LABEL_3;
    }
  }

  uint64_t v10 = 0LL;
  unint64_t v11 = 0LL;
LABEL_6:
  if (!v9)
  {
    a3 = 0LL;
    unint64_t v9 = 0xE000000000000000LL;
  }

  if (v11) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = 0LL;
  }
  if (v11) {
    unint64_t v13 = v11;
  }
  else {
    unint64_t v13 = 0xE000000000000000LL;
  }
  id v14 = objc_allocWithZone(ObjectType);
  uint64_t v15 = sub_100091D84((uint64_t)a3, v9, "/", 1LL, 2u, 0LL, 0xE000000000000000LL, v12, v13, 0LL);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v13);
  uint64_t v17 = swift_getObjectType(self, v16);
  swift_deallocPartialClassInstance(self, v17, 56LL, 7LL);
  return (_TtC9appstored6LogKey *)v15;
}

- (_TtC9appstored6LogKey)initWithBase:(id)a3 IDs:(id)a4
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (a3)
  {
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    a3 = v9;
    if (a4) {
      goto LABEL_3;
    }
LABEL_8:
    if (!a3)
    {
      uint64_t v8 = 0LL;
      a3 = (id)0xE000000000000000LL;
    }

    goto LABEL_10;
  }

  uint64_t v8 = 0LL;
  if (!a4) {
    goto LABEL_8;
  }
LABEL_3:
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  unint64_t v11 = (void *)v10;
  if (!a3)
  {
    uint64_t v8 = 0LL;
    a3 = (id)0xE000000000000000LL;
  }

  if (!v10) {
LABEL_10:
  }
    unint64_t v11 = _swiftEmptyArrayStorage;
  id v12 = objc_allocWithZone(ObjectType);
  unint64_t v13 = sub_100091AD0( 0LL,  0xE000000000000000LL,  "/",  1LL,  2u,  0LL,  0xE000000000000000LL,  v8,  (unint64_t)a3,  (uint64_t)v11,  0LL);
  swift_bridgeObjectRelease(a3);
  swift_bridgeObjectRelease(v11);
  uint64_t v15 = swift_getObjectType(self, v14);
  swift_deallocPartialClassInstance(self, v15, 56LL, 7LL);
  return (_TtC9appstored6LogKey *)v13;
}

- (_TtC9appstored6LogKey)initWithCode:(id)a3 base:(id)a4
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (a3)
  {
    a3 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    unint64_t v9 = v8;
    if (a4)
    {
LABEL_3:
      uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
      goto LABEL_6;
    }
  }

  else
  {
    unint64_t v9 = 0LL;
    if (a4) {
      goto LABEL_3;
    }
  }

  uint64_t v10 = 0LL;
  unint64_t v11 = 0LL;
LABEL_6:
  if (!v9)
  {
    a3 = 0LL;
    unint64_t v9 = 0xE000000000000000LL;
  }

  if (v11) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = 0LL;
  }
  if (v11) {
    unint64_t v13 = v11;
  }
  else {
    unint64_t v13 = 0xE000000000000000LL;
  }
  id v14 = objc_allocWithZone(ObjectType);
  uint64_t v15 = sub_100091D84(0LL, 0xE000000000000000LL, "/", 1LL, 2u, (uint64_t)a3, v9, v12, v13, 0LL);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v13);
  uint64_t v17 = swift_getObjectType(self, v16);
  swift_deallocPartialClassInstance(self, v17, 56LL, 7LL);
  return (_TtC9appstored6LogKey *)v15;
}

- (_TtC9appstored6LogKey)initWithCode:(id)a3 base:(id)a4 ID:(id)a5
{
  id v6 = a4;
  if (a3)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    unint64_t v9 = v8;
    if (v6) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v11 = 0LL;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v12 = 0LL;
    uint64_t v14 = 0LL;
    return (_TtC9appstored6LogKey *)sub_100090C80(v7, v9, (uint64_t)v6, v11, v12, v14);
  }

  uint64_t v7 = 0LL;
  unint64_t v9 = 0LL;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  id v6 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  unint64_t v11 = v10;
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v14 = v13;
  return (_TtC9appstored6LogKey *)sub_100090C80(v7, v9, (uint64_t)v6, v11, v12, v14);
}

- (_TtC9appstored6LogKey)initWithCategory:(id)a3
{
  return (_TtC9appstored6LogKey *)sub_1000910A4( (uint64_t)self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t (*)(uint64_t, uint64_t))sub_100090E64);
}

- (_TtC9appstored6LogKey)initWithCode:(id)a3
{
  return (_TtC9appstored6LogKey *)sub_1000910A4( (uint64_t)self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t (*)(uint64_t, uint64_t))sub_100090F84);
}

- (_TtC9appstored6LogKey)initWithCode:(id)a3 IDs:(id)a4
{
  if (!a3)
  {
    uint64_t v5 = 0LL;
    unint64_t v7 = 0LL;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v8 = 0LL;
    return (_TtC9appstored6LogKey *)sub_1000910E0(v5, v7, v8);
  }

  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v7 = v6;
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v8 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  return (_TtC9appstored6LogKey *)sub_1000910E0(v5, v7, v8);
}

- (_TtC9appstored6LogKey)initWithBaseUUID:(id)a3
{
  uint64_t v4 = sub_1000079A0((uint64_t *)&unk_10045AC20);
  __chkstk_darwin(v4);
  unint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v7 = type metadata accessor for UUID(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))(v6, 0LL, 1LL, v7);
  }

  else
  {
    uint64_t v9 = type metadata accessor for UUID(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v6, 1LL, 1LL, v9);
  }

  return (_TtC9appstored6LogKey *)sub_100091284((uint64_t)v6, v8);
}

- (_TtC9appstored6LogKey)initWithCategory:(id)a3 baseUUID:(id)a4
{
  uint64_t v6 = sub_1000079A0((uint64_t *)&unk_10045AC20);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (!a3)
  {
    unint64_t v10 = 0LL;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v12 = type metadata accessor for UUID(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v8, 1LL, 1LL, v12);
    return (_TtC9appstored6LogKey *)sub_100091614((uint64_t)a3, v10, (uint64_t)v8);
  }

  a3 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v10 = v9;
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v11 = type metadata accessor for UUID(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v8, 0LL, 1LL, v11);
  return (_TtC9appstored6LogKey *)sub_100091614((uint64_t)a3, v10, (uint64_t)v8);
}

@end