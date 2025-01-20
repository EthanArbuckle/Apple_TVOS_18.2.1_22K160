@interface JSLegacyLocObject
- (NSString)arcadeWordmarkAssetName;
- (NSString)identifier;
- (_TtC19appstorecomponentsd17JSLegacyLocObject)init;
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

@implementation JSLegacyLocObject

- (NSString)identifier
{
  v2 = self;
  Locale.identifier.getter();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSString)arcadeWordmarkAssetName
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (id)string:(id)a3
{
  return sub_1000A998C( (char *)self,  (uint64_t)a2,  (uint64_t)a3,  &OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer);
}

- (id)stringWithCount:(id)a3 :(int64_t)a4
{
  uint64_t v7 = sub_100029E18(&qword_10013F0E8);
  __chkstk_darwin(v7);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;
  sub_100029EE0( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer),  *(void *)&self->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer + 16]);
  v13 = self;
  v14._countAndFlagsBits = v10;
  v14._object = v12;
  Swift::String v15 = Localizer.string(forKey:)(v14);
  v16 = (char *)v13 + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localeWithCalendarWithBagFixUp;
  uint64_t v17 = type metadata accessor for Locale(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v9, v16, v17);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v9, 0LL, 1LL, v17);
  uint64_t v19 = sub_100029E18(&qword_10013E600);
  uint64_t v20 = swift_allocObject(v19, 72LL, 7LL);
  *(_OWORD *)(v20 + 16) = xmmword_1000EDBE0;
  *(void *)(v20 + 56) = &type metadata for Int;
  *(void *)(v20 + 64) = &protocol witness table for Int;
  *(void *)(v20 + 32) = a4;
  String.init(format:locale:arguments:)(v15._countAndFlagsBits, v15._object, v9, v20);
  uint64_t v22 = v21;
  swift_bridgeObjectRelease(v15._object);
  swift_bridgeObjectRelease(v20);
  sub_10002E92C((uint64_t)v9, &qword_10013F0E8);

  swift_bridgeObjectRelease(v12);
  NSString v23 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v22);
  return v23;
}

- (id)stringWithCounts:(id)a3 :(id)a4
{
  uint64_t v7 = sub_100029E18(&qword_10013F0E8);
  __chkstk_darwin(v7);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;
  uint64_t v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for Int);
  sub_100029EE0( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer),  *(void *)&self->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer + 16]);
  Swift::String v14 = self;
  v15._countAndFlagsBits = v10;
  v15._object = v12;
  Swift::String v16 = Localizer.string(forKey:)(v15);
  uint64_t v17 = (char *)v14 + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localeWithCalendarWithBagFixUp;
  uint64_t v18 = type metadata accessor for Locale(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v9, v17, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v9, 0LL, 1LL, v18);
  uint64_t v20 = sub_1000A7BD8(v13);
  String.init(format:locale:arguments:)(v16._countAndFlagsBits, v16._object, v9, v20);
  uint64_t v22 = v21;
  swift_bridgeObjectRelease(v16._object);
  swift_bridgeObjectRelease(v20);
  sub_10002E92C((uint64_t)v9, &qword_10013F0E8);

  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v13);
  NSString v23 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v22);
  return v23;
}

- (id)decimal:(id)a3 :(int64_t)a4
{
  v6 = self;
  id v7 = a3;
  sub_1000A7E6C(a3, a4);
  uint64_t v9 = v8;

  if (v9)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }

  else
  {
    NSString v10 = 0LL;
  }

  return v10;
}

- (id)fileSize:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    uint64_t v4 = self;
    id v5 = v3;
    id v6 =  objc_msgSend( (id)objc_opt_self(NSByteCountFormatter),  "stringFromByteCount:countStyle:",  objc_msgSend(v5, "longLongValue"),  0);
    static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    uint64_t v8 = v7;

    id v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v8);
  }

  return v3;
}

- (id)formattedCount:(id)a3
{
  uint64_t v4 = self;
  id v5 = a3;
  sub_1000A80B8(a3);
  uint64_t v7 = v6;

  if (v7)
  {
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }

  else
  {
    NSString v8 = 0LL;
  }

  return v8;
}

- (id)timeAgo:(id)a3
{
  return sub_1000A95FC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1000A82D4);
}

- (id)formatDate:(id)a3 :(id)a4
{
  uint64_t v7 = sub_100029E18((uint64_t *)&unk_10013F9B0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v12 = v11;
  if (a4)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
    uint64_t v13 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56LL))(v9, 0LL, 1LL, v13);
  }

  else
  {
    uint64_t v14 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v9, 1LL, 1LL, v14);
  }

  Swift::String v15 = self;
  sub_1000A8808(v10, v12, (uint64_t)v9);
  uint64_t v17 = v16;

  swift_bridgeObjectRelease(v12);
  sub_10002E92C((uint64_t)v9, (uint64_t *)&unk_10013F9B0);
  if (!v17) {
    return 0LL;
  }
  NSString v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v17);
  return v18;
}

- (id)formatDateInSentence:(id)a3 :(id)a4 :(id)a5
{
  return sub_1000AA4A4( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (uint64_t)a5,  (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, char *))sub_1000A8BC8);
}

- (id)relativeDate:(id)a3
{
  return sub_1000A95FC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1000A8EA4);
}

- (_TtC19appstorecomponentsd17JSLegacyLocObject)init
{
  result = (_TtC19appstorecomponentsd17JSLegacyLocObject *)_swift_stdlib_reportUnimplementedInitializer( "appstorecomponentsd.JSLegacyLocObject",  37LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_locale;
  uint64_t v4 = type metadata accessor for Locale(0LL);
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localeWithCalendar, v4);
  v5((char *)self + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localeWithCalendarWithBagFixUp, v4);
}

@end