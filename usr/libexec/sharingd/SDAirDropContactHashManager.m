@interface SDAirDropContactHashManager
+ (NSArray)ContactKeysForChangeHistory;
+ (NSArray)GeneralContactKeysToFetch;
+ (NSString)kStatusContactsHashesChanged;
+ (NSString)kStatusMeCardChanged;
+ (id)btleAdvertisementDataForStrings:(id)a3;
+ (id)obfuscatedMediumHashDataForStrings:(id)a3;
+ (id)obfuscatedShortHashDataForStrings:(id)a3;
+ (id)shared;
- (BOOL)contactsContainsShortHashes:(id)a3;
- (BOOL)dumpDBAtFileURL:(id)a3;
- (NSString)detailedDescription;
- (_TtC16DaemoniOSLibrary27SDAirDropContactHashManager)init;
- (id)contactForCombinedHash:(id)a3;
- (id)contactIdentifierForMediumHashes:(id)a3;
- (id)contactsForCombinedHash:(id)a3;
- (id)emailOrPhoneForCombinedHash:(id)a3;
- (void)cmfSyncAgentBlockListDidChange;
- (void)contactStoreDidChange;
- (void)meCardDidChange;
- (void)rebuildDB;
- (void)setMeCard:(id)a3;
@end

@implementation SDAirDropContactHashManager

- (_TtC16DaemoniOSLibrary27SDAirDropContactHashManager)init
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  sub_100432494((uint64_t)v9);
  sub_1003902B0(v9, (uint64_t)v8);
  id v4 = objc_allocWithZone(ObjectType);
  v5 = sub_1003829F0((uint64_t)v8);
  sub_1003902EC((uint64_t)v9);
  uint64_t v6 = swift_getObjectType(self);
  swift_deallocPartialClassInstance(self, v6, 273LL, 7LL);
  return (_TtC16DaemoniOSLibrary27SDAirDropContactHashManager *)v5;
}

- (void)cmfSyncAgentBlockListDidChange
{
  v2 = self;
  sub_100385534( "CMFSyncAgentBlockList change handler called",  (uint64_t)&unk_1005DDC90,  (uint64_t)sub_100390320,  (uint64_t)&unk_1005DDCA8);
}

- (void)contactStoreDidChange
{
  v2 = self;
  sub_100385534( "Contact Store change handler called",  (uint64_t)&unk_1005DDC40,  (uint64_t)sub_100390294,  (uint64_t)&unk_1005DDC58);
}

- (void)meCardDidChange
{
  v2 = self;
  sub_100385534( "MeCard change handler called",  (uint64_t)&unk_1005DDBF0,  (uint64_t)sub_100390278,  (uint64_t)&unk_1005DDC08);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_contactUpdateCoalescer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_meCardUpdateCoalescer));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_systemMonitor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_hashManagerQ));

  sub_10018709C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_contactStore));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_hashDB));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_notificationCenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_distributedNotificationCenter));
  sub_100390214( *(void **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_meCardInfo),  *(void *)&self->context[OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_meCardInfo]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_osTransaction));
}

+ (NSString)kStatusContactsHashesChanged
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)kStatusMeCardChanged
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (id)shared
{
  if (qword_100644230 != -1) {
    swift_once(&qword_100644230, sub_1003824E4);
  }
  return (id)qword_100651968;
}

- (NSString)detailedDescription
{
  v6[2] = self;
  v2 = self;
  OS_dispatch_queue.sync<A>(execute:)(v7, sub_100390240, v6, &type metadata for String);

  v3 = (const char *)v7[1];
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void)setMeCard:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10038BF68(v4);
}

- (id)contactForCombinedHash:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v10[2] = self;
  v10[3] = v4;
  v10[4] = v5;
  v7 = self;
  uint64_t v8 = sub_100183098(&qword_100651A88);
  OS_dispatch_queue.sync<A>(execute:)(&v11, sub_1003901C4, v10, v8);

  swift_bridgeObjectRelease(v6);
  return v11;
}

- (id)contactsForCombinedHash:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v12[2] = self;
  v12[3] = v4;
  v12[4] = v5;
  v7 = self;
  uint64_t v8 = sub_100183098(&qword_100651A80);
  OS_dispatch_queue.sync<A>(execute:)(&v13, sub_1003901A8, v12, v8);

  swift_bridgeObjectRelease(v6);
  v9 = v13;
  sub_100183168(0LL, (unint64_t *)&qword_100646C30, &OBJC_CLASS___CNContact_ptr);
  sub_1002E28C8();
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return isa;
}

- (id)emailOrPhoneForCombinedHash:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v12[2] = self;
  v12[3] = v4;
  v12[4] = v5;
  v7 = self;
  uint64_t v8 = sub_100183098(&qword_1006462D8);
  OS_dispatch_queue.sync<A>(execute:)(&v13, sub_100390174, v12, v8);

  swift_bridgeObjectRelease(v6);
  v9 = v14;
  if (!v14) {
    return 0LL;
  }
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  return v10;
}

- (id)contactIdentifierForMediumHashes:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v9 = v8;

  v14[2] = v6;
  v14[3] = v7;
  v14[4] = v9;
  uint64_t v10 = sub_100183098(&qword_1006462D8);
  OS_dispatch_queue.sync<A>(execute:)(&v15, sub_100390110, v14, v10);
  sub_100189B20(v7, v9);

  id v11 = v16;
  if (!v16) {
    return 0LL;
  }
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  return v12;
}

- (BOOL)contactsContainsShortHashes:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v9 = v8;

  v11[2] = v6;
  v11[3] = v7;
  v11[4] = v9;
  OS_dispatch_queue.sync<A>(execute:)(&v12, sub_10038FF98, v11, &type metadata for Bool);
  sub_100189B20(v7, v9);

  return v12;
}

+ (NSArray)ContactKeysForChangeHistory
{
  return (NSArray *)sub_10038D78C( (uint64_t)a1,  (uint64_t)a2,  &qword_100644258,  (const char **)&qword_100669898,  (uint64_t)sub_10038D5AC);
}

+ (NSArray)GeneralContactKeysToFetch
{
  return (NSArray *)sub_10038D78C( (uint64_t)a1,  (uint64_t)a2,  &qword_100644260,  (const char **)&qword_1006698A0,  (uint64_t)sub_10038D610);
}

- (BOOL)dumpDBAtFileURL:(id)a3
{
  uint64_t v5 = type metadata accessor for URL(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  BOOL v12 = self;
  uint64_t v13 = v8;
  unint64_t v9 = self;
  OS_dispatch_queue.sync<A>(execute:)(&v14, sub_10038FED8, v11, &type metadata for Bool);

  LOBYTE(v9) = v14;
  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  return (char)v9;
}

- (void)rebuildDB
{
  v2 = self;
  sub_10038DAC4();
}

+ (id)btleAdvertisementDataForStrings:(id)a3
{
  v3 = (const char *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  uint64_t v4 = sub_10038FD70(v3);
  unint64_t v6 = v5;
  swift_bridgeObjectRelease(v3);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100189B20(v4, v6);
  return isa;
}

+ (id)obfuscatedShortHashDataForStrings:(id)a3
{
  v3 = (const char *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  uint64_t v4 = sub_10038DEF4(v3, 2LL, 4LL);
  unint64_t v6 = v5;
  swift_bridgeObjectRelease(v3);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100189B20(v4, v6);
  return isa;
}

+ (id)obfuscatedMediumHashDataForStrings:(id)a3
{
  v3 = (const char *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  uint64_t v4 = sub_10038DEF4(v3, 3LL, 3LL);
  unint64_t v6 = v5;
  swift_bridgeObjectRelease(v3);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100189B20(v4, v6);
  return isa;
}

@end