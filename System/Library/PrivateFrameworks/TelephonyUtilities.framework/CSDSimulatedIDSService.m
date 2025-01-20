@interface CSDSimulatedIDSService
+ (CSDSimulatedIDSService)sharedInstance;
- (BOOL)defaultPairedDeviceExists;
- (BOOL)hasActiveAccounts;
- (BOOL)isServiceEnabledForTelephonySubscriptionLabelIdentifier:(id)a3;
- (BOOL)pairedDeviceExists;
- (BOOL)relayCapableDeviceExists;
- (BOOL)sendData:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9;
- (BOOL)sendData:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8;
- (BOOL)sendResourceAtURL:(id)a3 metadata:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9;
- (BOOL)telephonyCapableDeviceExists;
- (CSDIDSServiceDependencies)service;
- (CSDSimulatedIDSService)init;
- (IDSAccount)account;
- (IDSDevice)defaultPairedDevice;
- (IDSDevice)pairedDevice;
- (NSArray)allAliases;
- (NSArray)devices;
- (NSSet)aliases;
- (NSSet)availableOutgoingRelayCallerIDs;
- (NSString)callerID;
- (NSString)countryCode;
- (NSString)localDeviceUniqueID;
- (id)createGroupSessionProviderWithGroupID:(id)a3 participantDestinationIDs:(id)a4 callerID:(id)a5 account:(id)a6 queue:(id)a7 isOneToOneModeEnabled:(BOOL)a8 localMember:(id)a9 avLess:(BOOL)a10 isScreenSharingRequest:(BOOL)a11 ABTestConfiguration:(id)a12 isInitiator:(BOOL)a13;
- (id)deviceDestinationsWithCapability:(id)a3 localHandle:(id)a4;
- (id)deviceWithUniqueID:(id)a3;
- (id)devicesWithCapability:(id)a3;
- (id)pseudonymForPseudonymURI:(id)a3;
- (void)addServiceDelegate:(id)a3 queue:(id)a4;
- (void)noteApprovedHandle:(void *)a3 completionHandle:(void *)aBlock;
- (void)removeServiceDelegate:(id)a3;
- (void)setAccount:(id)a3;
- (void)signData:(id)a3 withAlgorithm:(int64_t)a4 completion:(id)a5;
- (void)verifySignedData:(id)a3 matchesExpectedData:(id)a4 withTokenURI:(id)a5 forAlgorithm:(int64_t)a6 completion:(id)a7;
@end

@implementation CSDSimulatedIDSService

+ (CSDSimulatedIDSService)sharedInstance
{
  return (CSDSimulatedIDSService *)sub_10026490C();
}

- (CSDSimulatedIDSService)init
{
  return (CSDSimulatedIDSService *)sub_100264960();
}

- (CSDIDSServiceDependencies)service
{
  return (CSDIDSServiceDependencies *)self;
}

- (NSString)countryCode
{
  return (NSString *)0LL;
}

- (BOOL)telephonyCapableDeviceExists
{
  return 0;
}

- (BOOL)relayCapableDeviceExists
{
  return 0;
}

- (BOOL)defaultPairedDeviceExists
{
  return 0;
}

- (BOOL)pairedDeviceExists
{
  return 0;
}

- (BOOL)hasActiveAccounts
{
  return 1;
}

- (IDSDevice)defaultPairedDevice
{
  return (IDSDevice *)0LL;
}

- (IDSDevice)pairedDevice
{
  return (IDSDevice *)0LL;
}

- (NSSet)availableOutgoingRelayCallerIDs
{
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(&_swiftEmptySetSingleton);
  return (NSSet *)isa;
}

- (NSString)localDeviceUniqueID
{
  return (NSString *)0LL;
}

- (IDSAccount)account
{
  v2 = self;
  id v3 = sub_100265F0C();

  return (IDSAccount *)v3;
}

- (void)setAccount:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100266080((uint64_t)a3);
}

- (NSArray)allAliases
{
  v2 = self;
  sub_1002660E4();
  uint64_t v4 = v3;

  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSArray *)isa;
}

- (NSArray)devices
{
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  return (NSArray *)isa;
}

- (NSString)callerID
{
  if (v2)
  {
    uint64_t v3 = v2;
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v3);
  }

  else
  {
    NSString v4 = 0LL;
  }

  return (NSString *)v4;
}

- (NSSet)aliases
{
  uint64_t v2 = self;
  uint64_t v3 = sub_100266254();

  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSSet *)isa;
}

- (id)deviceWithUniqueID:(id)a3
{
  return 0LL;
}

- (id)devicesWithCapability:(id)a3
{
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  return isa;
}

- (id)deviceDestinationsWithCapability:(id)a3 localHandle:(id)a4
{
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  return isa;
}

- (void)addServiceDelegate:(id)a3 queue:(id)a4
{
  id v7 = a4;
  v8 = self;
  sub_1002663A8((uint64_t)a3, (uint64_t)v7);
  swift_unknownObjectRelease(a3);
}

- (void)removeServiceDelegate:(id)a3
{
  id v5 = self;
  sub_100266438((uint64_t)a3);
  swift_unknownObjectRelease(a3);
}

- (BOOL)isServiceEnabledForTelephonySubscriptionLabelIdentifier:(id)a3
{
  return 0;
}

- (BOOL)sendData:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v17 = self;
  id v18 = a7;
  uint64_t v19 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v21 = v20;

  uint64_t v22 = static Set._unconditionallyBridgeFromObjectiveC(_:)( v16,  &type metadata for AnyHashable,  &protocol witness table for AnyHashable);
  if (v18)
  {
    uint64_t v23 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v18,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }

  else
  {
    uint64_t v23 = 0LL;
  }

  swift_bridgeObjectRelease(v22);
  swift_bridgeObjectRelease(v23);

  sub_1001BB39C(v19, v21);
  return 1;
}

- (void)noteApprovedHandle:(void *)a3 completionHandle:(void *)aBlock
{
  v6 = _Block_copy(aBlock);
  _Block_copy(v6);
  id v7 = a3;
  id v8 = a1;
  sub_1002665D0((uint64_t)v7, (uint64_t)v8, (void (**)(void, void))v6);
  _Block_release(v6);
}

- (id)createGroupSessionProviderWithGroupID:(id)a3 participantDestinationIDs:(id)a4 callerID:(id)a5 account:(id)a6 queue:(id)a7 isOneToOneModeEnabled:(BOOL)a8 localMember:(id)a9 avLess:(BOOL)a10 isScreenSharingRequest:(BOOL)a11 ABTestConfiguration:(id)a12 isInitiator:(BOOL)a13
{
  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v20 = v19;
  uint64_t v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, (char *)&type metadata for Any + 8);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v23 = v22;
  id v24 = a6;
  id v25 = a7;
  id v26 = a9;
  id v27 = a12;
  v28 = self;
  id v32 = sub_100266674(v18, v20, v21, v29, v30, v31, v25, 0LL, v26);

  swift_bridgeObjectRelease(v20);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v23);
  return v32;
}

- (void).cxx_destruct
{
  sub_1002673E4(*(id *)((char *)&self->super.isa + OBJC_IVAR___CSDSimulatedIDSService____lazy_storage___account));
}

- (BOOL)sendData:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v10 = a3;
  if (a3)
  {
    id v12 = a4;
    id v13 = a6;
    id v14 = self;
    id v15 = v10;
    id v10 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v10);
    unint64_t v17 = v16;

    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v18 = 0LL;
    if (a6) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v19 = 0LL;
    goto LABEL_8;
  }

  id v20 = a4;
  id v21 = a6;
  uint64_t v22 = self;
  unint64_t v17 = 0xF000000000000000LL;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v18 = static Set._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for AnyHashable,  &protocol witness table for AnyHashable);

  if (!a6) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v19 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a6,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);

LABEL_8:
  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v19);

  sub_1001BB464((uint64_t)v10, v17);
  return 1;
}

- (BOOL)sendResourceAtURL:(id)a3 metadata:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  uint64_t v13 = type metadata accessor for URL(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  unint64_t v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (a4) {
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  uint64_t v17 = static Set._unconditionallyBridgeFromObjectiveC(_:)( a5,  &type metadata for AnyHashable,  &protocol witness table for AnyHashable);
  if (a7) {
    a7 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a7,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  swift_bridgeObjectRelease(a4);
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(a7);
  return 1;
}

- (void)signData:(id)a3 withAlgorithm:(int64_t)a4 completion:(id)a5
{
  id v8 = _Block_copy(a5);
  id v9 = a3;
  uint64_t v13 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v12 = v11;

  _Block_copy(v8);
  sub_100266B40(v10, v12, a4, (uint64_t)v13, (void (**)(void, void, void))v8);
  _Block_release(v8);
  sub_1001BB39C(v10, v12);
}

- (void)verifySignedData:(id)a3 matchesExpectedData:(id)a4 withTokenURI:(id)a5 forAlgorithm:(int64_t)a6 completion:(id)a7
{
  unint64_t v12 = _Block_copy(a7);
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  uint64_t v22 = self;
  uint64_t v16 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v18 = v17;

  uint64_t v19 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v14);
  unint64_t v21 = v20;

  _Block_copy(v12);
  sub_100266C24(v16, v18, v19, v21, (uint64_t)v15, a6, (uint64_t)v22, (void (**)(void, void, void))v12);
  _Block_release(v12);
  sub_1001BB39C(v19, v21);
  sub_1001BB39C(v16, v18);
}

- (id)pseudonymForPseudonymURI:(id)a3
{
  return 0LL;
}

@end