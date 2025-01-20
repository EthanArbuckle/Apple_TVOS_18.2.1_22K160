@interface IDSSenderKeyDistributionManager
+ (double)cleanupKeysTimeInterval;
- (BOOL)hasAnyUsableSenderKeyFor:(id)a3;
- (BOOL)hasUsableSenderKeyFor:(id)a3 from:(id)a4;
- (IDSSenderKeyDistributionManager)init;
- (IDSSenderKeyDistributionManager)initWithPersistenceManager:(id)a3 service:(id)a4;
- (id)decryptingKeyIDsFor:(id)a3 localURI:(id)a4;
- (id)encryptingKeyIDsFor:(id)a3 localURI:(id)a4;
- (id)formattedDonatedHandleList;
- (id)formattedSenderKeyListFor:(id)a3;
- (id)missingRemoteEncryptingKeyIDs:(id)a3;
- (id)processedKeyMessageWithRemoteURI:(id)a3 localURI:(id)a4 messageData:(id)a5 messageGUID:(id)a6;
- (id)remoteMissingDecryptingKeyIDs:(id)a3 remoteURI:(id)a4 localURI:(id)a5;
- (void)dealloc;
- (void)generateAndSendKeyIfNeededToURIs:(id)a3 fromURI:(id)a4 context:(id)a5 completion:(id)a6;
- (void)handleRemoteDeviceUpdateWithRemoteURI:(id)a3 localURI:(id)a4;
- (void)markLastActivePeerToken:(id)a3 localURI:(id)a4 remoteURI:(id)a5;
- (void)markLastIMessagedPeerToken:(id)a3 localURI:(id)a4 remoteURI:(id)a5;
- (void)processDonatedHandlesForMessagingKeysWithUris:(id)a3 fromURI:(id)a4 priority:(int64_t)a5 isInitialDonation:(BOOL)a6 completion:(id)a7;
- (void)registrationController:(id)a3 deregistrationWillStart:(id)a4;
- (void)resetKeyStateWithKeyIDs:(id)a3 senderURI:(id)a4 receiverURI:(id)a5;
- (void)systemDidLeaveFirstDataProtectionLock;
- (void)triggerKeyRecoveryToURI:(id)a3 fromURI:(id)a4 keysToSend:(id)a5 keysToRequest:(id)a6;
- (void)updateDeliveredStateWithKeyIDStrings:(id)a3 pushToken:(id)a4;
@end

@implementation IDSSenderKeyDistributionManager

- (IDSSenderKeyDistributionManager)initWithPersistenceManager:(id)a3 service:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  unint64_t v7 = v6;
  id v8 = a3;
  return (IDSSenderKeyDistributionManager *)sub_10045C448(a3, v5, v7);
}

- (void)dealloc
{
  v2 = self;
  sub_10045C950();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___IDSSenderKeyDistributionManager_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);

  swift_bridgeObjectRelease(*(void *)&self->persistenceManager[OBJC_IVAR___IDSSenderKeyDistributionManager_service]);
  swift_unknownObjectRelease( *(Class *)((char *)&self->super.isa + OBJC_IVAR___IDSSenderKeyDistributionManager____lazy_storage___rollKeysTimer),  v5);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___IDSSenderKeyDistributionManager____lazy_storage___unsentRateLimiter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___IDSSenderKeyDistributionManager____lazy_storage___iMessageReceiveRateLimiter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___IDSSenderKeyDistributionManager____lazy_storage___lastActiveRateLimiter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___IDSSenderKeyDistributionManager____lazy_storage___lastIMessagedRateLimiter));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___IDSSenderKeyDistributionManager_recoveryWorkItems));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___IDSSenderKeyDistributionManager_deviceUpdateWorkItems));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___IDSSenderKeyDistributionManager_firstDataProtectionLockQueue));
}

- (void)generateAndSendKeyIfNeededToURIs:(id)a3 fromURI:(id)a4 context:(id)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = sub_10041D3C4(0LL, (unint64_t *)&unk_1009BC270, &OBJC_CLASS___IDSURI_ptr);
  uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v11);
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v15 = v14;
  uint64_t v16 = swift_allocObject(&unk_100906A60, 24LL, 7LL);
  *(void *)(v16 + 16) = v10;
  v17 = *(void (**)(uint64_t, id, uint64_t, uint64_t, void, void *, uint64_t (*)(char), uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0x1D8);
  id v18 = a4;
  v19 = self;
  v17(v12, v18, v13, v15, 0LL, _swiftEmptyArrayStorage, sub_10047E308, v16);

  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v15);
  swift_release(v16);
}

- (void)markLastActivePeerToken:(id)a3 localURI:(id)a4 remoteURI:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  sub_10046120C(v8, v9, v10);
}

- (void)markLastIMessagedPeerToken:(id)a3 localURI:(id)a4 remoteURI:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  sub_10046156C(v8, v9, v10);
}

- (id)processedKeyMessageWithRemoteURI:(id)a3 localURI:(id)a4 messageData:(id)a5 messageGUID:(id)a6
{
  id v7 = a5;
  if (a5)
  {
    id v11 = a3;
    id v12 = a4;
    id v13 = a6;
    uint64_t v14 = self;
    id v15 = v7;
    id v7 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v7);
    unint64_t v17 = v16;
  }

  else
  {
    id v18 = a3;
    id v19 = a4;
    id v20 = a6;
    v21 = self;
    unint64_t v17 = 0xF000000000000000LL;
  }

  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  uint64_t v24 = v23;

  v25 = sub_1004618CC(a3, a4, (uint64_t)v7, v17, v22, v24);
  swift_bridgeObjectRelease(v24);
  sub_10040AD00((uint64_t)v7, v17);

  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v25);
  return isa;
}

- (void)triggerKeyRecoveryToURI:(id)a3 fromURI:(id)a4 keysToSend:(id)a5 keysToRequest:(id)a6
{
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for String);
  unint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a6, &type metadata for String);
  id v14 = a3;
  id v12 = a4;
  id v13 = self;
  sub_10046321C(v14, v12, v10, v11);
  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v10);
}

- (void)resetKeyStateWithKeyIDs:(id)a3 senderURI:(id)a4 receiverURI:(id)a5
{
  if (a3) {
    uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for Data);
  }
  else {
    uint64_t v8 = 0LL;
  }
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = self;
  sub_1004640AC(v8, v9, v10);

  swift_bridgeObjectRelease(v8);
}

- (void)handleRemoteDeviceUpdateWithRemoteURI:(id)a3 localURI:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = self;
  sub_100464414(v8, v6);
}

- (void)updateDeliveredStateWithKeyIDStrings:(id)a3 pushToken:(id)a4
{
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  id v7 = a4;
  id v8 = self;
  sub_100465228(v6, v7);

  swift_bridgeObjectRelease(v6);
}

- (id)encryptingKeyIDsFor:(id)a3 localURI:(id)a4
{
  return sub_10046995C(self, (uint64_t)a2, a3, a4, (uint64_t (*)(id, id))sub_100468DE8);
}

- (id)decryptingKeyIDsFor:(id)a3 localURI:(id)a4
{
  return sub_10046995C(self, (uint64_t)a2, a3, a4, (uint64_t (*)(id, id))sub_1004697D4);
}

- (id)missingRemoteEncryptingKeyIDs:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  uint64_t v5 = self;
  uint64_t v6 = sub_1004699E4(v4);

  swift_bridgeObjectRelease(v4);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return isa;
}

- (id)remoteMissingDecryptingKeyIDs:(id)a3 remoteURI:(id)a4 localURI:(id)a5
{
  id v8 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = self;
  uint64_t v12 = sub_100469BDC(v8, (uint64_t)v9, (uint64_t)v10);

  swift_bridgeObjectRelease(v8);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v12);
  return isa;
}

- (BOOL)hasUsableSenderKeyFor:(id)a3 from:(id)a4
{
  uint64_t v6 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xA8);
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  id v10 = (void *)v6();
  LOBYTE(v6) = sub_1004F4628(v7, v8);

  return v6 & 1;
}

- (BOOL)hasAnyUsableSenderKeyFor:(id)a3
{
  uint64_t v4 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xA8);
  id v5 = a3;
  uint64_t v6 = self;
  id v7 = (void *)v4();
  LOBYTE(v4) = sub_1004F46E0((uint64_t)v5);

  return v4 & 1;
}

- (id)formattedSenderKeyListFor:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    uint64_t v5 = sub_10041D3C4(0LL, (unint64_t *)&unk_1009BC270, &OBJC_CLASS___IDSURI_ptr);
    id v3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v5);
  }

  uint64_t v6 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xA8);
  id v7 = self;
  id v8 = (void *)v6();
  sub_1004F656C((uint64_t)v3);
  uint64_t v10 = v9;

  uint64_t v21 = v10;
  uint64_t v12 = (void *)((uint64_t (*)(uint64_t))v6)(v11);
  id v15 = sub_1004F6A4C((uint64_t)v3, v13, v14);
  unint64_t v17 = v16;

  v18._countAndFlagsBits = (uint64_t)v15;
  v18._object = v17;
  String.append(_:)(v18);

  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v3);
  NSString v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v21);
  return v19;
}

- (id)formattedDonatedHandleList
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xA8);
  id v3 = self;
  uint64_t v4 = (void *)v2();
  sub_1004F7E18();
  uint64_t v6 = v5;

  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  return v7;
}

- (void)processDonatedHandlesForMessagingKeysWithUris:(id)a3 fromURI:(id)a4 priority:(int64_t)a5 isInitialDonation:(BOOL)a6 completion:(id)a7
{
  uint64_t v12 = _Block_copy(a7);
  uint64_t v13 = sub_10041D3C4(0LL, (unint64_t *)&unk_1009BC270, &OBJC_CLASS___IDSURI_ptr);
  uint64_t v14 = sub_100438928((unint64_t *)&unk_1009BAC00, (unint64_t *)&unk_1009BC270, &OBJC_CLASS___IDSURI_ptr);
  uint64_t v15 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v13, v14);
  uint64_t v16 = swift_allocObject(&unk_100906A38, 24LL, 7LL);
  *(void *)(v16 + 16) = v12;
  id v18 = a4;
  unint64_t v17 = self;
  sub_10046A5A0(v15, v18, a5, a6, (uint64_t)sub_10047DA50, v16);
  swift_release(v16);
  swift_bridgeObjectRelease(v15);
}

- (IDSSenderKeyDistributionManager)init
{
  result = (IDSSenderKeyDistributionManager *)_swift_stdlib_reportUnimplementedInitializer( "identityservicesd.SenderKeyDistributionManager",  46LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  v2 = self;
  sub_10046AB30();
}

- (void)registrationController:(id)a3 deregistrationWillStart:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10047AFFC(a4);
}

+ (double)cleanupKeysTimeInterval
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