@interface JSModernLocObject
- (NSString)identifier;
- (_TtC19appstorecomponentsd17JSModernLocObject)init;
- (id)decimal:(id)a3 :(int64_t)a4;
- (id)fileSize:(id)a3;
- (id)formatDate:(id)a3 :(id)a4;
- (id)formatDateInSentence:(id)a3 :(id)a4 :(id)a5;
- (id)formattedCount:(id)a3;
- (id)relativeDate:(id)a3;
- (id)string:(id)a3;
- (id)stringWithCount:(id)a3 :(int64_t)a4;
- (id)stringWithCounts:(id)a3 :(id)a4;
- (id)timeAgo:(id)a3;
@end

@implementation JSModernLocObject

- (NSString)identifier
{
  uint64_t v3 = type metadata accessor for Locale(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = *(void *)&self->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer + 16];
  uint64_t v8 = *(void *)&self->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer + 24];
  sub_100029EE0( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer),  v7);
  v9 = self;
  uint64_t v10 = dispatch thunk of Localizer.locale.getter(v7, v8);
  Locale.identifier.getter(v10);
  uint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v12);
  return (NSString *)v13;
}

- (id)string:(id)a3
{
  return sub_1000A998C( (char *)self,  (uint64_t)a2,  (uint64_t)a3,  &OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer);
}

- (id)stringWithCount:(id)a3 :(int64_t)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  sub_100029EE0( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer),  *(void *)&self->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer + 16]);
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  object = Localizer.string(withCount:forKey:)(a4, v10)._object;

  swift_bridgeObjectRelease(v8);
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  return v12;
}

- (id)stringWithCounts:(id)a3 :(id)a4
{
  uint64_t v7 = sub_100029E18(&qword_10013F0E8);
  __chkstk_darwin(v7);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  NSString v12 = v11;
  uint64_t v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for Int);
  v14 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer);
  sub_100029EE0( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer),  *(void *)&self->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer + 16]);
  uint64_t v15 = self;
  v16._countAndFlagsBits = v10;
  v16._object = v12;
  Swift::String v17 = Localizer.string(forKey:)(v16);
  uint64_t v19 = v14[3];
  uint64_t v18 = v14[4];
  sub_100029EE0(v14, v19);
  dispatch thunk of Localizer.locale.getter(v19, v18);
  uint64_t v20 = type metadata accessor for Locale(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56LL))(v9, 0LL, 1LL, v20);
  v21 = sub_1000A7BD8(v13);
  String.init(format:locale:arguments:)(v17._countAndFlagsBits, v17._object, v9, v21);
  uint64_t v23 = v22;
  swift_bridgeObjectRelease(v17._object);
  swift_bridgeObjectRelease(v21);
  sub_10002E92C((uint64_t)v9, &qword_10013F0E8);

  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v13);
  NSString v24 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v23);
  return v24;
}

- (id)decimal:(id)a3 :(int64_t)a4
{
  uint64_t v6 = type metadata accessor for LocalizerContext(0LL, a2);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (!a3) {
    return 0LL;
  }
  sub_100029EE0( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer),  *(void *)&self->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer + 16]);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for LocalizerContext.unknown(_:), v6);
  uint64_t v10 = self;
  id v11 = a3;
  dispatch thunk of Localizer.decimal(forNumber:minimumFractionDigits:maximumFractionDigits:in:)();
  uint64_t v13 = v12;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v13);
  return v14;
}

- (id)fileSize:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    uint64_t v4 = self;
    id v5 = v3;
    [v5 doubleValue];
    double v7 = v6;
    uint64_t v8 = *(void *)&v4->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer + 16];
    uint64_t v9 = *(void *)&v4->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer + 24];
    sub_100029EE0( (Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer),  v8);
    dispatch thunk of Localizer.fileSize(forBytes:)(v8, v9, v7);
    uint64_t v11 = v10;

    id v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v11);
  }

  return v3;
}

- (id)formattedCount:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    uint64_t v4 = self;
    id v5 = v3;
    id v6 = [v5 integerValue];
    uint64_t v7 = *(void *)&v4->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer + 16];
    uint64_t v8 = *(void *)&v4->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer + 24];
    sub_100029EE0( (Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer),  v7);
    dispatch thunk of Localizer.formattedCount(_:)(v6, v7, v8);
    uint64_t v10 = v9;

    id v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v10);
  }

  return v3;
}

- (id)timeAgo:(id)a3
{
  uint64_t v5 = sub_100029E18((uint64_t *)&unk_10013F9B0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v8 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56LL))(v7, 0LL, 1LL, v8);
  }

  else
  {
    uint64_t v9 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v7, 1LL, 1LL, v9);
  }

  sub_10009BB78();
  uint64_t v10 = self;
  uint64_t v11 = (void *)static JSContext.requiredCurrent.getter();
  uint64_t v12 = (void *)JSContext.propagateErrorsToExceptions(_:)(sub_1000A9F30, 0LL);

  JSValue.string.getter();
  uint64_t v14 = v13;

  sub_10002E92C((uint64_t)v7, (uint64_t *)&unk_10013F9B0);
  if (!v14) {
    return 0LL;
  }
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v14);
  return v15;
}

- (id)formatDate:(id)a3 :(id)a4
{
  uint64_t v7 = type metadata accessor for Date(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_100029E18((uint64_t *)&unk_10013F9B0);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v29 - v15;
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v19 = v18;
  if (a4)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
    uint64_t v20 = 0LL;
  }

  else
  {
    uint64_t v20 = 1LL;
  }

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v16, v20, 1LL, v7);
  sub_1000AA850((uint64_t)v16, (uint64_t)v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v14, 1LL, v7) == 1)
  {
    v21 = self;
    sub_10002E92C((uint64_t)v14, (uint64_t *)&unk_10013F9B0);

    swift_bridgeObjectRelease(v19);
    sub_10002E92C((uint64_t)v16, (uint64_t *)&unk_10013F9B0);
    return 0LL;
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v14, v7);
    uint64_t v23 = *(void *)&self->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer + 16];
    uint64_t v24 = *(void *)&self->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer + 24];
    sub_100029EE0( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer),  v23);
    v25 = self;
    Localizer.formattedDate(format:date:)(v17, v19, v10, v23, v24);
    uint64_t v27 = v26;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

    swift_bridgeObjectRelease(v19);
    sub_10002E92C((uint64_t)v16, (uint64_t *)&unk_10013F9B0);
    NSString v28 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v27);
    return v28;
  }

- (id)formatDateInSentence:(id)a3 :(id)a4 :(id)a5
{
  return sub_1000AA4A4( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (uint64_t)a5,  (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, char *))sub_1000AA324);
}

- (id)relativeDate:(id)a3
{
  uint64_t v5 = type metadata accessor for Date(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_100029E18((uint64_t *)&unk_10013F9B0);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v23 - v13;
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v15 = 0LL;
  }

  else
  {
    uint64_t v15 = 1LL;
  }

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v14, v15, 1LL, v5);
  sub_1000AA850((uint64_t)v14, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v12, 1LL, v5) == 1)
  {
    sub_10002E92C((uint64_t)v12, (uint64_t *)&unk_10013F9B0);
    sub_10002E92C((uint64_t)v14, (uint64_t *)&unk_10013F9B0);
    return 0LL;
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v12, v5);
    uint64_t v17 = *(void *)&self->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer + 16];
    uint64_t v18 = *(void *)&self->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer + 24];
    sub_100029EE0( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer),  v17);
    uint64_t v19 = self;
    Localizer.relativeDate(_:)(v8, v17, v18);
    uint64_t v21 = v20;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

    sub_10002E92C((uint64_t)v14, (uint64_t *)&unk_10013F9B0);
    NSString v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v21);
    return v22;
  }

- (_TtC19appstorecomponentsd17JSModernLocObject)init
{
  result = (_TtC19appstorecomponentsd17JSModernLocObject *)_swift_stdlib_reportUnimplementedInitializer( "appstorecomponentsd.JSModernLocObject",  37LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end