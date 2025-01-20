@interface IDSQuerySDPersistenceManager
+ (double)dbCleanupTimeInterval;
- (BOOL)hasUsableSenderKeyFor:(id)a3 fromAny:(id)a4;
- (BOOL)senderKeyMessageSupportedFor:(id)a3;
- (IDSQuerySDPersistenceManager)init;
- (IDSQuerySDPersistenceManager)initWithFilePath:(id)a3;
- (id)activeURIsWithService:(id)a3 fromURI:(id)a4;
- (id)allPeerIDKeys;
- (id)decryptingKeyIDsWithSenderURI:(id)a3 receiverURI:(id)a4;
- (id)deviceTokensForURI:(id)a3 service:(id)a4;
- (id)earliestExpirationDateForService:(id)a3 fromURI:(id)a4 toURI:(id)a5;
- (id)endpointForPushToken:(id)a3 service:(id)a4 fromURI:(id)a5 toURI:(id)a6;
- (id)fetchEndpointsWithService:(id)a3 fromURI:(id)a4 toURI:(id)a5 ignoreExpiration:(BOOL)a6;
- (id)fetchKeyTransparencyContextFor:(id)a3 service:(id)a4;
- (id)lastQualifiedContactsMetric;
- (id)peerIDKeysForService:(id)a3;
- (id)peerIDKeysForService:(id)a3 fromURI:(id)a4;
- (id)peerMapRepresentation;
- (id)publicDeviceIdentityContainerForPushToken:(id)a3;
- (id)publicIdentityDataFor:(id)a3 uri:(id)a4 service:(id)a5;
- (id)publicKeyForService:(id)a3 pushToken:(id)a4;
- (id)recentURIsSinceDate:(id)a3 service:(id)a4;
- (id)senderCorrelationIdentifierForService:(id)a3 uri:(id)a4;
- (id)sessionTokenForService:(id)a3 fromURI:(id)a4 toURI:(id)a5 pushToken:(id)a6;
- (id)shortHandleForUri:(id)a3;
- (id)uriForShortHandle:(id)a3;
- (id)urisMatchingPushToken:(id)a3 service:(id)a4;
- (int64_t)deviceHasCapabilityWithService:(id)a3 uri:(id)a4 fromURI:(id)a5 pushToken:(id)a6 capability:(id)a7;
- (void)cleanupExpiredSessionsIfNeededWithCompletion:(id)a3;
- (void)cleanupInvalidSenderKeyEntriesWithCompletion:(id)a3;
- (void)cleanupOldRegistrationEvents;
- (void)cleanupShortHandlesWithExpireDuration:(double)a3 completion:(id)a4;
- (void)cleanupTimerFired;
- (void)deleteAllSenderKeysWithCompletion:(id)a3;
- (void)deleteAllWithCompletion:(id)a3;
- (void)deleteEndpointsWithService:(id)a3 completion:(id)a4;
- (void)deleteEndpointsWithService:(id)a3 fromURI:(id)a4 toURI:(id)a5 completion:(id)a6;
- (void)deleteEndpointsWithServices:(id)a3 fromURI:(id)a4 toURI:(id)a5 completion:(id)a6;
- (void)deleteEndpointsWithServices:(id)a3 toURIs:(id)a4 completion:(id)a5;
- (void)deletePublicIdentitiesBeforeDate:(id)a3 afterDate:(id)a4 completion:(id)a5;
- (void)performDBCleanupTasks;
- (void)saveEndpoints:(id)a3 ktContext:(id)a4 service:(id)a5 fromURI:(id)a6 toURI:(id)a7 completion:(id)a8;
- (void)savePublicIdentityData:(id)a3 token:(id)a4 uri:(id)a5 service:(id)a6 completion:(id)a7;
- (void)saveRegistrationEventWithBagKey:(id)a3 requestStart:(id)a4 completionTime:(id)a5 resultCode:(int64_t)a6 interface:(unint64_t)a7 splunkHint:(id)a8 baaSigningDigest:(id)a9;
- (void)updateKeyTransparencyContext:(id)a3 uri:(id)a4 service:(id)a5 completion:(id)a6;
- (void)updateQualifiedContactsCountWithMetric:(id)a3;
@end

@implementation IDSQuerySDPersistenceManager

- (IDSQuerySDPersistenceManager)initWithFilePath:(id)a3
{
  if (a3)
  {
    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }

  else
  {
    uint64_t v3 = 0LL;
    uint64_t v4 = 0LL;
  }

  return (IDSQuerySDPersistenceManager *)sub_1004D82D0(v3, v4);
}

- (void)cleanupTimerFired
{
  v2 = self;
  sub_1004DA43C();
}

- (IDSQuerySDPersistenceManager)init
{
  result = (IDSQuerySDPersistenceManager *)_swift_stdlib_reportUnimplementedInitializer( "identityservicesd.SDPersistenceManager",  38LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR___IDSQuerySDPersistenceManager_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___IDSQuerySDPersistenceManager_container));
  swift_bridgeObjectRelease(*(void *)&self->queue[OBJC_IVAR___IDSQuerySDPersistenceManager_filePath]);
  swift_unknownObjectRelease( *(Class *)((char *)&self->super.isa + OBJC_IVAR___IDSQuerySDPersistenceManager_cleanupTimer),  v5);
}

- (void)deletePublicIdentitiesBeforeDate:(id)a3 afterDate:(id)a4 completion:(id)a5
{
  id v38 = a4;
  v39 = self;
  uint64_t v7 = type metadata accessor for Date(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v10, v11);
  v12 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13, v14);
  v16 = (char *)&v38 - v15;
  __chkstk_darwin(v17, v18);
  v20 = (char *)&v38 - v19;
  __chkstk_darwin(v21, v22);
  v24 = (char *)&v38 - v23;
  v25 = _Block_copy(a5);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(v38);
  uint64_t v26 = swift_allocObject(&unk_100908990, 24LL, 7LL);
  *(void *)(v26 + 16) = v25;
  v27 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v27(v16, v24, v7);
  v27(v12, v20, v7);
  uint64_t v28 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v29 = (v28 + 16) & ~v28;
  uint64_t v30 = (v9 + v28 + v29) & ~v28;
  uint64_t v31 = swift_allocObject(&unk_1009089B8, v30 + v9, v28 | 7);
  uint64_t v32 = v31 + v29;
  v33 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
  v33(v32, v16, v7);
  v33(v31 + v30, v12, v7);
  uint64_t v34 = swift_allocObject(&unk_1009089E0, 32LL, 7LL);
  *(void *)(v34 + 16) = sub_100513BB0;
  *(void *)(v34 + 24) = v26;
  v35 = *(void (**)(uint64_t (*)(uint64_t), uint64_t, uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)v39->super.isa) + 0xE0);
  v36 = v39;
  swift_retain(v26);
  v35(sub_1005107D0, v31, sub_100513D0C, v34);

  swift_release(v26);
  swift_release(v31);
  swift_release(v34);
  v37 = *(void (**)(char *, uint64_t))(v8 + 8);
  v37(v20, v7);
  v37(v24, v7);
}

- (void)deleteEndpointsWithService:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = v8;
  uint64_t v10 = swift_allocObject(&unk_100908918, 24LL, 7LL);
  *(void *)(v10 + 16) = v6;
  uint64_t v11 = swift_allocObject(&unk_100908940, 32LL, 7LL);
  *(void *)(v11 + 16) = v7;
  *(void *)(v11 + 24) = v9;
  uint64_t v12 = swift_allocObject(&unk_100908968, 32LL, 7LL);
  *(void *)(v12 + 16) = sub_100513BB0;
  *(void *)(v12 + 24) = v10;
  __n128 v13 = *(void (**)(uint64_t (*)(uint64_t), uint64_t, uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0xE0);
  __n128 v14 = self;
  swift_bridgeObjectRetain(v9);
  swift_retain(v10);
  v13(sub_100513CC0, v11, sub_100513D08, v12);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
  swift_release(v11);
  swift_release(v12);
}

- (void)deleteEndpointsWithService:(id)a3 fromURI:(id)a4 toURI:(id)a5 completion:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject(&unk_1009088A0, 24LL, 7LL);
  *(void *)(v13 + 16) = v10;
  id v14 = a4;
  id v15 = a5;
  v16 = self;
  id v17 = [v14 prefixedURI];
  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
  uint64_t v20 = v19;

  id v21 = [v15 prefixedURI];
  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
  uint64_t v24 = v23;

  v25 = (void *)swift_allocObject(&unk_1009088C8, 64LL, 7LL);
  v25[2] = v28;
  v25[3] = v12;
  v25[4] = v22;
  v25[5] = v24;
  v25[6] = v18;
  v25[7] = v20;
  uint64_t v26 = swift_allocObject(&unk_1009088F0, 32LL, 7LL);
  *(void *)(v26 + 16) = sub_100513BB0;
  *(void *)(v26 + 24) = v13;
  v27 = *(void (**)(uint64_t (*)(uint64_t), void *, uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)v16->super.isa) + 0xE0);
  swift_bridgeObjectRetain(v12);
  swift_retain(v13);
  v27(sub_100510708, v25, sub_100513D04, v26);

  swift_bridgeObjectRelease(v12);
  swift_release(v13);
  swift_release(v25);
  swift_release(v26);
}

- (void)deleteEndpointsWithServices:(id)a3 fromURI:(id)a4 toURI:(id)a5 completion:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  uint64_t v12 = swift_allocObject(&unk_100908828, 24LL, 7LL);
  *(void *)(v12 + 16) = v10;
  id v13 = a4;
  id v14 = a5;
  id v15 = self;
  id v16 = [v13 prefixedURI];
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
  uint64_t v19 = v18;

  id v20 = [v14 prefixedURI];
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
  uint64_t v23 = v22;

  uint64_t v24 = (void *)swift_allocObject(&unk_100908850, 56LL, 7LL);
  v24[2] = v11;
  v24[3] = v21;
  v24[4] = v23;
  v24[5] = v17;
  v24[6] = v19;
  uint64_t v25 = swift_allocObject(&unk_100908878, 32LL, 7LL);
  *(void *)(v25 + 16) = sub_100513BB0;
  *(void *)(v25 + 24) = v12;
  uint64_t v26 = *(void (**)(uint64_t (*)(uint64_t), void *, uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)v15->super.isa) + 0xE0);
  swift_bridgeObjectRetain(v11);
  swift_retain(v12);
  v26(sub_10051069C, v24, sub_100513D00, v25);

  swift_bridgeObjectRelease(v11);
  swift_release(v12);
  swift_release(v24);
  swift_release(v25);
}

- (void)deleteEndpointsWithServices:(id)a3 toURIs:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  uint64_t v10 = sub_10041D3C4(0LL, (unint64_t *)&unk_1009BC270, &OBJC_CLASS___IDSURI_ptr);
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v10);
  uint64_t v12 = swift_allocObject(&unk_100908800, 24LL, 7LL);
  *(void *)(v12 + 16) = v8;
  id v13 = self;
  sub_1004DCE30(v9, v11, (uint64_t)sub_100513BB0, v12);

  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v11);
  swift_release(v12);
}

- (void)deleteAllWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_1009087B0, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject(&unk_1009087D8, 32LL, 7LL);
  *(void *)(v6 + 16) = sub_100513BB0;
  *(void *)(v6 + 24) = v5;
  uint64_t v8 = self;
  swift_retain(v5);
  v7(sub_1004DDBC0, 0LL, sub_100513CFC, v6);

  swift_release(v5);
  swift_release(v6);
}

- (void)savePublicIdentityData:(id)a3 token:(id)a4 uri:(id)a5 service:(id)a6 completion:(id)a7
{
  uint64_t v12 = _Block_copy(a7);
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v31 = self;
  uint64_t v17 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v19 = v18;

  uint64_t v20 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v14);
  unint64_t v22 = v21;

  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
  uint64_t v25 = v24;

  uint64_t v26 = swift_allocObject(&unk_100908738, 24LL, 7LL);
  *(void *)(v26 + 16) = v12;
  v27 = (void *)swift_allocObject(&unk_100908760, 72LL, 7LL);
  v27[2] = v23;
  v27[3] = v25;
  v27[4] = v20;
  v27[5] = v22;
  v27[6] = v15;
  v27[7] = v17;
  v27[8] = v19;
  uint64_t v28 = swift_allocObject(&unk_100908788, 32LL, 7LL);
  *(void *)(v28 + 16) = sub_100513BB0;
  *(void *)(v28 + 24) = v26;
  uint64_t v29 = *(void (**)(uint64_t (*)(uint64_t), void *, uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)v31->super.isa) + 0xE0);
  id v30 = v15;
  swift_bridgeObjectRetain(v25);
  sub_1004028CC(v20, v22);
  sub_1004028CC(v17, v19);
  swift_retain(v26);
  v29(sub_100510610, v27, sub_100513CF8, v28);
  swift_bridgeObjectRelease(v25);
  swift_release(v26);
  swift_release(v27);
  swift_release(v28);
  sub_100402A84(v20, v22);
  sub_100402A84(v17, v19);
}

- (void)saveEndpoints:(id)a3 ktContext:(id)a4 service:(id)a5 fromURI:(id)a6 toURI:(id)a7 completion:(id)a8
{
  id v14 = _Block_copy(a8);
  uint64_t v15 = sub_10041D3C4(0LL, (unint64_t *)&unk_1009BC3D0, &OBJC_CLASS___IDSEndpoint_ptr);
  uint64_t v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v15);
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v19 = v18;
  uint64_t v20 = swift_allocObject(&unk_1009086C0, 24LL, 7LL);
  *(void *)(v20 + 16) = v14;
  unint64_t v21 = (void *)swift_allocObject(&unk_1009086E8, 72LL, 7LL);
  v21[2] = v16;
  v21[3] = self;
  v21[4] = v17;
  v21[5] = v19;
  v21[6] = a7;
  v21[7] = a4;
  v21[8] = a6;
  uint64_t v22 = swift_allocObject(&unk_100908710, 32LL, 7LL);
  *(void *)(v22 + 16) = sub_100513BB0;
  *(void *)(v22 + 24) = v20;
  id v30 = *(void (**)(void (*)(uint64_t), void *, uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0xE0);
  id v23 = a4;
  id v24 = a6;
  id v25 = a7;
  uint64_t v26 = self;
  id v27 = v25;
  id v28 = v23;
  id v29 = v24;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRetain(v19);
  swift_retain(v20);
  v30(sub_100510588, v21, sub_100513CF4, v22);

  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v19);
  swift_release(v20);
  swift_release(v21);
  swift_release(v22);
}

- (void)updateKeyTransparencyContext:(id)a3 uri:(id)a4 service:(id)a5 completion:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v13 = v12;
  uint64_t v14 = swift_allocObject(&unk_100908648, 24LL, 7LL);
  *(void *)(v14 + 16) = v10;
  uint64_t v15 = (void *)swift_allocObject(&unk_100908670, 72LL, 7LL);
  v15[2] = self;
  v15[3] = v11;
  v15[4] = v13;
  v15[5] = a4;
  v15[6] = sub_1005104BC;
  v15[7] = v14;
  v15[8] = a3;
  uint64_t v16 = swift_allocObject(&unk_100908698, 32LL, 7LL);
  *(void *)(v16 + 16) = sub_1005104BC;
  *(void *)(v16 + 24) = v14;
  uint64_t v17 = *(void (**)(uint64_t (*)(uint64_t), void *, uint64_t (*)(), uint64_t, __n128))((swift_isaMask & (uint64_t)self->super.isa) + 0xE0);
  id v18 = a3;
  id v19 = a4;
  uint64_t v20 = self;
  swift_retain_n(v14, 2LL);
  unint64_t v21 = v20;
  id v22 = v19;
  id v23 = v18;
  __n128 v24 = swift_bridgeObjectRetain(v13);
  v17(sub_10051051C, v15, sub_100513CF0, v16, v24);

  swift_bridgeObjectRelease(v13);
  swift_release(v14);
  swift_release(v15);
  swift_release(v16);
}

- (void)saveRegistrationEventWithBagKey:(id)a3 requestStart:(id)a4 completionTime:(id)a5 resultCode:(int64_t)a6 interface:(unint64_t)a7 splunkHint:(id)a8 baaSigningDigest:(id)a9
{
  uint64_t v35 = a6;
  unint64_t v36 = a7;
  uint64_t v14 = type metadata accessor for Date(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v16, v17);
  id v19 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1003F5CB4(&qword_1009BC130);
  __chkstk_darwin(v20, v21);
  id v23 = (char *)&v33 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v25 = v24;
  if (a4)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
    uint64_t v26 = 0LL;
  }

  else
  {
    uint64_t v26 = 1LL;
  }

  id v27 = a9;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v23, v26, 1LL, v14);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a5);
  if (!a8)
  {
    uint64_t v28 = 0LL;
    if (a9) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v30 = 0LL;
    goto LABEL_9;
  }

  uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(a8);
  a8 = v29;
  if (!a9) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(a9);
  id v27 = v31;
LABEL_9:
  uint64_t v32 = self;
  sub_1004DF7B0(v34, v25, (uint64_t)v23, (uint64_t)v19, v35, v36, v28, (uint64_t)a8, v30, (uint64_t)v27);

  swift_bridgeObjectRelease(v25);
  swift_bridgeObjectRelease(v27);
  swift_bridgeObjectRelease(a8);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v19, v14);
  sub_10040A274((uint64_t)v23, &qword_1009BC130);
}

- (id)fetchEndpointsWithService:(id)a3 fromURI:(id)a4 toURI:(id)a5 ignoreExpiration:(BOOL)a6
{
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v12 = v11;
  id v23 = _swiftEmptyArrayStorage;
  v20[2] = self;
  v20[3] = v10;
  v20[4] = v11;
  v20[5] = a5;
  v20[6] = a4;
  BOOL v21 = a6;
  uint64_t v22 = &v23;
  id v14 = a4;
  id v15 = a5;
  __n128 v16 = self;
  v13(0LL, sub_100510480, v20);

  swift_bridgeObjectRelease(v12);
  __n128 v17 = v23;
  sub_10041D3C4(0LL, (unint64_t *)&unk_1009BC3D0, &OBJC_CLASS___IDSEndpoint_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v17);
  return isa;
}

- (id)fetchKeyTransparencyContextFor:(id)a3 service:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v8 = v7;
  id v14 = 0LL;
  v13[2] = self;
  v13[3] = v6;
  v13[4] = v7;
  v13[5] = a3;
  v13[6] = &v14;
  id v10 = a3;
  uint64_t v11 = self;
  v9(0LL, sub_100510464, v13);

  swift_bridgeObjectRelease(v8);
  return v14;
}

- (id)publicIdentityDataFor:(id)a3 uri:(id)a4 service:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = self;
  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v15 = v14;

  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  uint64_t v18 = v17;

  uint64_t v19 = sub_1004E67BC(v13, v15, v10, v16, v18);
  unint64_t v21 = v20;
  swift_bridgeObjectRelease(v18);
  sub_100402A84(v13, v15);

  if (v21 >> 60 == 15)
  {
    Class isa = 0LL;
  }

  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10040AD00(v19, v21);
  }

  return isa;
}

- (id)recentURIsSinceDate:(id)a3 service:(id)a4
{
  uint64_t v7 = type metadata accessor for Date(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v9, v10);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v15 = v14;
  uint64_t v16 = self;
  uint64_t v17 = sub_1004E7498((uint64_t)v12, v13, v15);

  swift_bridgeObjectRelease(v15);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
  sub_10041D3C4(0LL, (unint64_t *)&unk_1009BC270, &OBJC_CLASS___IDSURI_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v17);
  return isa;
}

- (BOOL)senderKeyMessageSupportedFor:(id)a3
{
  uint64_t v5 = sub_10041D3C4(0LL, (unint64_t *)&unk_1009BC3D0, &OBJC_CLASS___IDSEndpoint_ptr);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  uint64_t v7 = self;
  BOOL v8 = sub_10050E11C(v6);

  swift_bridgeObjectRelease(v6);
  return v8;
}

- (id)decryptingKeyIDsWithSenderURI:(id)a3 receiverURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = self;
  __n128 v9 = sub_1004F3F4C(v6, v7);

  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return isa;
}

- (BOOL)hasUsableSenderKeyFor:(id)a3 fromAny:(id)a4
{
  uint64_t v7 = sub_10041D3C4(0LL, (unint64_t *)&unk_1009BC270, &OBJC_CLASS___IDSURI_ptr);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  id v9 = a3;
  __n128 v10 = self;
  LOBYTE(self) = sub_1004F48AC(v9, v8);

  swift_bridgeObjectRelease(v8);
  return self & 1;
}

- (void)deleteAllSenderKeysWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_1009085F8, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject(&unk_100908620, 32LL, 7LL);
  *(void *)(v6 + 16) = sub_10047E308;
  *(void *)(v6 + 24) = v5;
  uint64_t v8 = self;
  swift_retain(v5);
  v7(sub_1004F5AAC, 0LL, sub_100513CEC, v6);

  swift_release(v5);
  swift_release(v6);
}

- (void)performDBCleanupTasks
{
  v2 = self;
  sub_1004F8340((uint64_t)v2);
}

- (void)cleanupExpiredSessionsIfNeededWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject(&unk_1009085D0, 24LL, 7LL);
    *(void *)(v5 + 16) = v4;
    uint64_t v4 = sub_10047E308;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  uint64_t v6 = (void *)swift_allocObject(&unk_1009085A8, 40LL, 7LL);
  v6[2] = self;
  v6[3] = v4;
  v6[4] = v5;
  uint64_t v7 = *(void (**)(uint64_t (*)(uint64_t), void, uint64_t (*)(), void *))((swift_isaMask & (uint64_t)self->super.isa) + 0xE0);
  uint64_t v8 = self;
  sub_10050E38C((uint64_t)v4, v5);
  v7(sub_1004F849C, 0LL, sub_100513B30, v6);
  swift_release(v6);
  sub_100482178((uint64_t)v4, v5);
}

- (void)cleanupShortHandlesWithExpireDuration:(double)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject(&unk_100908580, 24LL, 7LL);
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = sub_10047E308;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  uint64_t v8 = swift_allocObject(&unk_100908530, 32LL, 7LL);
  *(void *)(v8 + 16) = self;
  *(double *)(v8 + 24) = a3;
  id v9 = (void *)swift_allocObject(&unk_100908558, 40LL, 7LL);
  v9[2] = self;
  v9[3] = v6;
  v9[4] = v7;
  __n128 v10 = *(void (**)(uint64_t (*)(uint64_t), uint64_t, uint64_t (*)(), void *))((swift_isaMask & (uint64_t)self->super.isa) + 0xE0);
  uint64_t v11 = self;
  sub_10050E38C((uint64_t)v6, v7);
  v10(sub_100513CAC, v8, sub_100513B2C, v9);
  swift_release(v8);
  swift_release(v9);
  sub_100482178((uint64_t)v6, v7);
}

- (void)cleanupInvalidSenderKeyEntriesWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_100908508, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_1004FB0A8((uint64_t)sub_10047DA50, v5);

  swift_release(v5);
}

- (void)cleanupOldRegistrationEvents
{
  uint64_t v3 = swift_allocObject(&unk_1009084E0, 24LL, 7LL);
  *(void *)(v3 + 16) = self;
  uint64_t v4 = *(void (**)(uint64_t (*)(uint64_t), void, uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0xE0);
  uint64_t v5 = self;
  v4(sub_1004FD778, 0LL, sub_100513B28, v3);

  swift_release(v3);
}

- (id)lastQualifiedContactsMetric
{
  id v6 = 0LL;
  v5[2] = &v6;
  v5[3] = self;
  uint64_t v3 = self;
  v2(0LL, sub_100513C98, v5);

  return v6;
}

- (void)updateQualifiedContactsCountWithMetric:(id)a3
{
  uint64_t v5 = swift_allocObject(&unk_100908490, 24LL, 7LL);
  *(void *)(v5 + 16) = a3;
  uint64_t v6 = swift_allocObject(&unk_1009084B8, 24LL, 7LL);
  *(void *)(v6 + 16) = self;
  uint64_t v7 = *(void (**)(uint64_t (*)(uint64_t), uint64_t, uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0xE0);
  id v8 = a3;
  id v9 = self;
  id v10 = v8;
  uint64_t v11 = v9;
  v7(sub_100513B0C, v5, sub_100513B24, v6);

  swift_release(v5);
  swift_release(v6);
}

- (id)deviceTokensForURI:(id)a3 service:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v8 = v7;
  uint64_t v17 = &_swiftEmptySetSingleton;
  v16[2] = self;
  v16[3] = v6;
  v16[4] = v7;
  v16[5] = a3;
  v16[6] = &v17;
  id v10 = a3;
  uint64_t v11 = self;
  v9(0LL, sub_1005103E8, v16);
  uint64_t v12 = (uint64_t)v17;
  swift_bridgeObjectRetain(v17);
  uint64_t v13 = sub_100504048( v12,  (unint64_t *)&qword_1009BBE30,  &OBJC_CLASS___IDSPushToken_ptr,  (unint64_t *)&qword_1009BC4C0);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease_n(v12, 2LL);
  sub_10041D3C4(0LL, (unint64_t *)&qword_1009BBE30, &OBJC_CLASS___IDSPushToken_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_release(v13);
  return isa;
}

- (int64_t)deviceHasCapabilityWithService:(id)a3 uri:(id)a4 fromURI:(id)a5 pushToken:(id)a6 capability:(id)a7
{
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v14 = v13;
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a7);
  uint64_t v17 = v16;
  int64_t v25 = 0LL;
  v24[2] = self;
  v24[3] = v12;
  v24[4] = v14;
  v24[5] = a4;
  v24[6] = a6;
  v24[7] = a5;
  v24[8] = &v25;
  v24[9] = v15;
  v24[10] = v16;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  uint64_t v22 = self;
  v18(0LL, sub_1005103A0, v24);

  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v17);
  return v25;
}

- (id)sessionTokenForService:(id)a3 fromURI:(id)a4 toURI:(id)a5 pushToken:(id)a6
{
  uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v11 = v10;
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v14 = v13;
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v17 = v16;
  id v18 = a6;
  id v19 = self;
  uint64_t v20 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a6);
  unint64_t v22 = v21;

  __int128 v39 = xmmword_1007190F0;
  id v29 = v19;
  uint64_t v30 = v27;
  uint64_t v31 = v11;
  uint64_t v32 = v12;
  uint64_t v33 = v14;
  uint64_t v34 = v15;
  uint64_t v35 = v17;
  uint64_t v36 = v20;
  unint64_t v37 = v22;
  id v38 = &v39;
  (*(void (**)(void, void (*)(uint64_t), _BYTE *))((swift_isaMask & (uint64_t)v19->super.isa)
                                                                        + 0xE8))( 0LL,  sub_100510340,  v28);
  sub_100402A84(v20, v22);

  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v17);
  Class isa = 0LL;
  unint64_t v24 = *((void *)&v39 + 1);
  if (*((void *)&v39 + 1) >> 60 != 15LL)
  {
    uint64_t v25 = v39;
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10040AD00(v25, v24);
  }

  return isa;
}

- (id)activeURIsWithService:(id)a3 fromURI:(id)a4
{
  return sub_100501660( self,  (uint64_t)a2,  (uint64_t)a3,  a4,  (uint64_t)sub_100510324,  (unint64_t *)&unk_1009BC270,  &OBJC_CLASS___IDSURI_ptr,  (unint64_t *)&unk_1009BAC00);
}

- (id)urisMatchingPushToken:(id)a3 service:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v8 = v7;
  id v19 = _swiftEmptyArrayStorage;
  v18[2] = self;
  v18[3] = v6;
  v18[4] = v7;
  v18[5] = a3;
  v18[6] = &v19;
  id v10 = a3;
  uint64_t v11 = self;
  v9(0LL, sub_100510308, v18);
  uint64_t v12 = v19;
  swift_bridgeObjectRetain(v19);
  uint64_t v14 = sub_100438A1C( v13,  (unint64_t *)&unk_1009BC270,  &OBJC_CLASS___IDSURI_ptr,  (unint64_t *)&unk_1009BAC00,  &qword_1009B9D90);
  swift_bridgeObjectRelease(v12);
  uint64_t v15 = sub_100504048( v14,  (unint64_t *)&unk_1009BC270,  &OBJC_CLASS___IDSURI_ptr,  (unint64_t *)&unk_1009BAC00);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v14);
  sub_10041D3C4(0LL, (unint64_t *)&unk_1009BC270, &OBJC_CLASS___IDSURI_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_release(v15);
  return isa;
}

- (id)publicKeyForService:(id)a3 pushToken:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  __int128 v17 = xmmword_1007190F0;
  v16[2] = self;
  v16[3] = v6;
  v16[4] = v7;
  v16[5] = a4;
  v16[6] = &v17;
  id v10 = a4;
  uint64_t v11 = self;
  v9(0LL, sub_1005102B8, v16);

  swift_bridgeObjectRelease(v8);
  Class isa = 0LL;
  unint64_t v13 = *((void *)&v17 + 1);
  if (*((void *)&v17 + 1) >> 60 != 15LL)
  {
    uint64_t v14 = v17;
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10040AD00(v14, v13);
  }

  return isa;
}

- (id)publicDeviceIdentityContainerForPushToken:(id)a3
{
  id v9 = 0LL;
  v8[2] = self;
  v8[3] = a3;
  v8[4] = &v9;
  id v5 = a3;
  uint64_t v6 = self;
  v4(0LL, sub_100513CD8, v8);

  return v9;
}

- (id)senderCorrelationIdentifierForService:(id)a3 uri:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  uint64_t v16 = 0LL;
  uint64_t v17 = 0LL;
  v15[2] = self;
  v15[3] = v6;
  v15[4] = v7;
  v15[5] = a4;
  v15[6] = &v16;
  id v10 = a4;
  uint64_t v11 = self;
  v9(0LL, sub_10051029C, v15);

  swift_bridgeObjectRelease(v8);
  uint64_t v12 = v17;
  if (!v17) {
    return 0LL;
  }
  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v12);
  return v13;
}

- (id)earliestExpirationDateForService:(id)a3 fromURI:(id)a4 toURI:(id)a5
{
  uint64_t v12 = &v28[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v13, v14);
  uint64_t v16 = &v28[-v15];
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v19 = v18;
  uint64_t v20 = type metadata accessor for Date(0LL);
  uint64_t v21 = *(void *)(v20 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v21 + 56))(v12, 1LL, 1LL, v20);
  id v29 = self;
  uint64_t v30 = v17;
  uint64_t v31 = v19;
  id v32 = a4;
  id v33 = a5;
  uint64_t v34 = v12;
  id v23 = a4;
  id v24 = a5;
  uint64_t v25 = self;
  v22(0LL, sub_10051024C, v28);
  sub_10041D378((uint64_t)v12, (uint64_t)v16, &qword_1009BC130);

  swift_bridgeObjectRelease(v19);
  Class isa = 0LL;
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v21 + 48))(v16, 1LL, v20) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(_BYTE *, uint64_t))(v21 + 8))(v16, v20);
  }

  return isa;
}

- (id)endpointForPushToken:(id)a3 service:(id)a4 fromURI:(id)a5 toURI:(id)a6
{
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v12 = v11;
  id v20 = 0LL;
  v19[2] = self;
  v19[3] = v10;
  v19[4] = v11;
  v19[5] = a6;
  v19[6] = a3;
  v19[7] = a5;
  v19[8] = &v20;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = self;
  v13(0LL, sub_100510204, v19);

  swift_bridgeObjectRelease(v12);
  return v20;
}

- (id)peerIDKeysForService:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  id v15 = &_swiftEmptySetSingleton;
  v14[2] = self;
  v14[3] = v4;
  v14[4] = v5;
  v14[5] = &v15;
  uint64_t v8 = self;
  v7(0LL, sub_100513C08, v14);
  __n128 v9 = v15;
  swift_bridgeObjectRetain(v15);
  uint64_t v11 = sub_100504048(v10, &qword_1009BC3B0, off_1008F3918, (unint64_t *)&unk_1009BC3C0);

  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease_n(v9, 2LL);
  sub_10041D3C4(0LL, &qword_1009BC3B0, off_1008F3918);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_release(v11);
  return isa;
}

- (id)peerIDKeysForService:(id)a3 fromURI:(id)a4
{
  return sub_100501660( self,  (uint64_t)a2,  (uint64_t)a3,  a4,  (uint64_t)sub_1005101E8,  &qword_1009BC3B0,  off_1008F3918,  (unint64_t *)&unk_1009BC3C0);
}

- (id)allPeerIDKeys
{
  uint64_t v10 = &_swiftEmptySetSingleton;
  v9[2] = self;
  v9[3] = &v10;
  uint64_t v3 = self;
  v2(0LL, sub_100513C84, v9);
  uint64_t v4 = v10;
  swift_bridgeObjectRetain(v10);
  uint64_t v6 = sub_100504048(v5, &qword_1009BC3B0, off_1008F3918, (unint64_t *)&unk_1009BC3C0);

  swift_bridgeObjectRelease_n(v4, 2LL);
  sub_10041D3C4(0LL, &qword_1009BC3B0, off_1008F3918);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_release(v6);
  return isa;
}

- (id)peerMapRepresentation
{
  uint64_t v8 = &_swiftEmptyDictionarySingleton;
  v7[2] = self;
  v7[3] = &v8;
  uint64_t v3 = self;
  v2(0LL, sub_100513C70, v7);

  uint64_t v4 = v8;
  sub_10041D3C4(0LL, &qword_1009BC3B0, off_1008F3918);
  sub_10041D3C4(0LL, &qword_1009BC3B8, &off_1008F3920);
  sub_100438928((unint64_t *)&unk_1009BC3C0, &qword_1009BC3B0, off_1008F3918);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return isa;
}

- (id)uriForShortHandle:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  uint64_t v7 = self;
  id v8 = sub_1005028EC(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v8;
}

- (id)shortHandleForUri:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100503084(v4);
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

+ (double)dbCleanupTimeInterval
{
  id v0 = [(id)objc_opt_self(IDSServerBag) sharedInstance];
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)(v9, v2);
    swift_unknownObjectRelease(v2, v3);
  }

  else
  {
    memset(v9, 0, sizeof(v9));
  }

  sub_10041D378((uint64_t)v9, (uint64_t)v10, &qword_1009B92B8);
  if (v11)
  {
    uint64_t v4 = sub_10041D3C4(0LL, (unint64_t *)&unk_1009BACA0, &OBJC_CLASS___NSNumber_ptr);
    if ((swift_dynamicCast(&v8, v10, (char *)&type metadata for Any + 8, v4, 6LL) & 1) != 0)
    {
      id v5 = v8;
      id v6 = [v8 integerValue];

      return (double)(uint64_t)v6;
    }
  }

  else
  {
    sub_10040A274((uint64_t)v10, &qword_1009B92B8);
  }

  return 86400.0;
}

@end