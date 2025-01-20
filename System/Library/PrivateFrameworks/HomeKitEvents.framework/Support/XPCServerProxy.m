@interface XPCServerProxy
- (void)clearEventsWithHomes:(id)a3 reply:(id)a4;
- (void)collectDiagnosticsWithIncludeSensitiveData:(BOOL)a3 reply:(id)a4;
- (void)createEventsWithEventsData:(id)a3 reply:(id)a4;
- (void)createFakeEventsWithDate:(id)a3 homeIdentifier:(id)a4 count:(int64_t)a5 reply:(id)a6;
- (void)exitWithExitStatus:(int64_t)a3 reply:(id)a4;
- (void)hmvutilClearEventsWithHomes:(id)a3 reply:(id)a4;
- (void)hmvutilClearLocalDatabaseWithHomes:(id)a3 reply:(id)a4;
- (void)hmvutilCreateEncryptionKeyWithHomeIdentifier:(id)a3 keyIdentifier:(id)a4 skipZoneCreation:(BOOL)a5 reply:(id)a6;
- (void)hmvutilCreateEventsWithEventsData:(id)a3 uploadOnly:(BOOL)a4 saveOnly:(BOOL)a5 skipZoneCreation:(BOOL)a6 reply:(id)a7;
- (void)hmvutilCreateFakeEventsWithDate:(id)a3 homeIdentifier:(id)a4 count:(int64_t)a5 uploadOnly:(BOOL)a6 saveOnly:(BOOL)a7 skipZoneCreation:(BOOL)a8 reply:(id)a9;
- (void)hmvutilDeleteEncryptionKeyWithHomeIdentifier:(id)a3 keyIdentifier:(id)a4 reply:(id)a5;
- (void)hmvutilDumpLocalDatabaseWithReply:(id)a3;
- (void)hmvutilEchoWithString:(id)a3 reply:(id)a4;
- (void)hmvutilRegisterForTaskWithIdentifierWithIdentifier:(id)a3 reply:(id)a4;
- (void)hmvutilResetConfigurationWithReply:(id)a3;
- (void)hmvutilSubmitTaskRequestForIdentifierWithIdentifier:(id)a3 reply:(id)a4;
- (void)hmvutilUploadEventsWithBatchCount:(id)a3 reply:(id)a4;
- (void)resetConfigurationWithReply:(id)a3;
@end

@implementation XPCServerProxy

- (void)clearEventsWithHomes:(id)a3 reply:(id)a4
{
}

- (void)createEventsWithEventsData:(id)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for Data);
  uint64_t v8 = swift_allocObject(&unk_100077518, 24LL, 7LL);
  *(void *)(v8 + 16) = v6;
  swift_retain(self);
  sub_100039BCC(v7, (uint64_t)sub_100041678, v8);
  swift_release(self);
  swift_bridgeObjectRelease(v7);
  swift_release(v8);
}

- (void)createFakeEventsWithDate:(id)a3 homeIdentifier:(id)a4 count:(int64_t)a5 reply:(id)a6
{
  uint64_t v21 = a5;
  uint64_t v10 = type metadata accessor for UUID(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for Date(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v18 = _Block_copy(a6);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v19 = swift_allocObject(&unk_1000774A0, 24LL, 7LL);
  *(void *)(v19 + 16) = v18;
  swift_retain(self);
  sub_10003A0CC((uint64_t)v17, (uint64_t)v13, v21, (uint64_t)sub_100041678, v19);
  swift_release(self);
  swift_release(v19);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

- (void)resetConfigurationWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_100077450, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  swift_retain(self);
  sub_10003DB18((uint64_t)sub_100041678, v5, "resetConfiguration", (uint64_t)&unk_100077478, 1, (uint64_t)sub_100041714);
  swift_release(self);
  swift_release(v5);
}

- (void)hmvutilEchoWithString:(id)a3 reply:(id)a4
{
}

- (void)hmvutilClearEventsWithHomes:(id)a3 reply:(id)a4
{
}

- (void)hmvutilClearLocalDatabaseWithHomes:(id)a3 reply:(id)a4
{
}

- (void)hmvutilCreateEventsWithEventsData:(id)a3 uploadOnly:(BOOL)a4 saveOnly:(BOOL)a5 skipZoneCreation:(BOOL)a6 reply:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  BOOL v9 = a4;
  uint64_t v12 = _Block_copy(a7);
  uint64_t v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for Data);
  uint64_t v14 = swift_allocObject(&unk_100077270, 24LL, 7LL);
  *(void *)(v14 + 16) = v12;
  swift_retain(self);
  sub_10003B578(v13, v9, v8, v7, (void (*)(void))sub_100041678, v14);
  swift_release(self);
  swift_bridgeObjectRelease(v13);
  swift_release(v14);
}

- (void)hmvutilCreateFakeEventsWithDate:(id)a3 homeIdentifier:(id)a4 count:(int64_t)a5 uploadOnly:(BOOL)a6 saveOnly:(BOOL)a7 skipZoneCreation:(BOOL)a8 reply:(id)a9
{
  BOOL v25 = a7;
  BOOL v26 = a8;
  BOOL v24 = a6;
  uint64_t v23 = a5;
  uint64_t v12 = type metadata accessor for UUID(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for Date(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = _Block_copy(a9);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v21 = swift_allocObject(&unk_1000771F8, 24LL, 7LL);
  *(void *)(v21 + 16) = v20;
  swift_retain(self);
  sub_10003BB8C((uint64_t)v19, (uint64_t)v15, v23, v24, v25, v26, (uint64_t)sub_100041678, v21);
  swift_release(self);
  swift_release(v21);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
}

- (void)hmvutilDumpLocalDatabaseWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_100077180, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  swift_retain(self);
  sub_10003C404((uint64_t)sub_1000409B8, v5);
  swift_release(self);
  swift_release(v5);
}

- (void)hmvutilUploadEventsWithBatchCount:(id)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_100077108, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  swift_retain(self);
  sub_10003C960(a3, (uint64_t)sub_100041678, v7);

  swift_release(self);
  swift_release(v7);
}

- (void)exitWithExitStatus:(int64_t)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_100077090, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  swift_retain(self);
  sub_10003CE20(a3, (uint64_t)sub_100041678, v7);
  swift_release(self);
  swift_release(v7);
}

- (void)hmvutilRegisterForTaskWithIdentifierWithIdentifier:(id)a3 reply:(id)a4
{
}

- (void)hmvutilSubmitTaskRequestForIdentifierWithIdentifier:(id)a3 reply:(id)a4
{
}

- (void)hmvutilResetConfigurationWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_100076EB0, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  swift_retain(self);
  sub_10003DB18( (uint64_t)sub_100041678,  v5,  "hmvutilResetConfiguration",  (uint64_t)&unk_100076ED8,  2,  (uint64_t)sub_100041714);
  swift_release(self);
  swift_release(v5);
}

- (void)hmvutilCreateEncryptionKeyWithHomeIdentifier:(id)a3 keyIdentifier:(id)a4 skipZoneCreation:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  uint64_t v11 = type metadata accessor for UUID(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v21 - v16;
  uint64_t v18 = _Block_copy(a6);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v19 = swift_allocObject(&unk_100076E38, 24LL, 7LL);
  *(void *)(v19 + 16) = v18;
  swift_retain(self);
  sub_10003DD64((uint64_t)v17, (uint64_t)v15, v7, (uint64_t)sub_100041678, v19);
  swift_release(self);
  swift_release(v19);
  uint64_t v20 = *(void (**)(char *, uint64_t))(v12 + 8);
  v20(v15, v11);
  v20(v17, v11);
}

- (void)hmvutilDeleteEncryptionKeyWithHomeIdentifier:(id)a3 keyIdentifier:(id)a4 reply:(id)a5
{
  uint64_t v9 = type metadata accessor for UUID(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v19 - v14;
  uint64_t v16 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v17 = swift_allocObject(&unk_100076DC0, 24LL, 7LL);
  *(void *)(v17 + 16) = v16;
  swift_retain(self);
  sub_10003E464((uint64_t)v15, (uint64_t)v13, (uint64_t)sub_10003FF48, v17);
  swift_release(self);
  swift_release(v17);
  uint64_t v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18(v13, v9);
  v18(v15, v9);
}

- (void)collectDiagnosticsWithIncludeSensitiveData:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_100076CD0, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  swift_retain(self);
  sub_10003EB04(v4, (void (*)(char *, uint64_t))sub_10003F578, v7);
  swift_release(self);
  swift_release(v7);
}

@end