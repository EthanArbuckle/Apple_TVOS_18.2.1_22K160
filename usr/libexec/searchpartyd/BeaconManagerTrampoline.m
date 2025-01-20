@interface BeaconManagerTrampoline
- (_TtC12searchpartyd23BeaconManagerTrampoline)init;
- (void)acceptUTForBeaconUUID:(id)a3;
- (void)activeCompanionWithCompletion:(id)a3;
- (void)addSafeLocation:(id)a3 completion:(id)a4;
- (void)allBeaconingKeysForUUID:(id)a3 dateInterval:(id)a4 forceGenerate:(BOOL)a5 completion:(id)a6;
- (void)allBeaconsOfTypes:(id)a3 includeDupes:(BOOL)a4 includeHidden:(BOOL)a5 completion:(id)a6;
- (void)allBeaconsWithCompletion:(id)a3;
- (void)allDuriansWithCompletion:(id)a3;
- (void)allObservationsForBeacon:(id)a3 completion:(id)a4;
- (void)allPairingErrorsWithCompletion:(id)a3;
- (void)alwaysBeaconWildStateWithCompletion:(id)a3;
- (void)assignSafeLocation:(id)a3 to:(id)a4 completion:(id)a5;
- (void)beaconForIdentifier:(id)a3 completion:(id)a4;
- (void)beaconForUUID:(id)a3 completion:(id)a4;
- (void)beaconGroupForIdentifier:(id)a3 completion:(id)a4;
- (void)beaconGroupsForUUIDs:(id)a3 completion:(id)a4;
- (void)beaconStoreStatusWithCompletion:(id)a3;
- (void)beaconingIdentifierForMACAddress:(id)a3 completion:(id)a4;
- (void)beaconingKeysForUUID:(id)a3 dateInterval:(id)a4 completion:(id)a5;
- (void)beaconingKeysOfType:(int64_t)a3 withCompletion:(id)a4;
- (void)beaconingStateWithCompletion:(id)a3;
- (void)beaconsInFirmwareUpdateState:(int64_t)a3 dateInterval:(id)a4 completion:(id)a5;
- (void)beaconsToMaintainPersistentConnection:(id)a3;
- (void)beaconsToMaintainWithCompletion:(id)a3;
- (void)beaconsToMonitorForSeparation:(id)a3;
- (void)bluetoothConnectionKeysFor:(id)a3 completion:(id)a4;
- (void)clientConfigurationWithCompletion:(id)a3;
- (void)commandKeysForUUID:(id)a3 withCriteria:(id)a4 completion:(id)a5;
- (void)commandKeysForUUIDs:(id)a3 completion:(id)a4;
- (void)commandKeysForUUIDs:(id)a3 dateInterval:(id)a4 completion:(id)a5;
- (void)connectUsingMACAddress:(id)a3 longTermKey:(id)a4 completion:(id)a5;
- (void)connectedToBeacon:(id)a3 withIndex:(int64_t)a4 completion:(id)a5;
- (void)createDuplicateBeaconsForBeacon:(id)a3 skipGroupIdentifier:(BOOL)a4 count:(int64_t)a5 completion:(id)a6;
- (void)createOwnedDeviceKeyRecordForUUID:(id)a3 completion:(id)a4;
- (void)currentBeaconingKeyWithCompletion:(id)a3;
- (void)didDetectUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4;
- (void)didObserveUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4;
- (void)didUpdateUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4;
- (void)didWithdrawUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4;
- (void)disableSeparationMonitoringForBeacons:(id)a3 completion:(id)a4;
- (void)disableUTAppAlert:(BOOL)a3 completion:(id)a4;
- (void)disconnectFromMACAddress:(id)a3 completion:(id)a4;
- (void)enableSeparationMonitoringForBeacons:(id)a3 completion:(id)a4;
- (void)executeCommand:(id)a3 completion:(id)a4;
- (void)fakeClassicPairingWithMACAddress:(id)a3 completion:(id)a4;
- (void)fetchAllKeyMapFileDescriptorsWithCompletion:(id)a3;
- (void)fetchFindMyNetworkStatusForMACAddress:(id)a3 completion:(id)a4;
- (void)fetchFirmwareVersionForBeacon:(id)a3 completion:(id)a4;
- (void)fetchSeparationMonitoringStatus:(id)a3;
- (void)fetchUnauthorizedEncryptedPayload:(id)a3 completion:(id)a4;
- (void)fetchUserStatsForBeacon:(id)a3 completion:(id)a4;
- (void)finalizePairingUsing:(id)a3 completion:(id)a4;
- (void)firmwareUpdateCandidateBeaconsWithCompletion:(id)a3;
- (void)firmwareUpdateStateForBeaconUUID:(id)a3 completion:(id)a4;
- (void)forceDistributeKeysWithCompletion:(id)a3;
- (void)forceKeySyncForBeaconUUID:(id)a3 lastObservationDate:(id)a4 lastObservationIndex:(unint64_t)a5 completion:(id)a6;
- (void)forceLOIBasedSafeLocationRefresh:(id)a3;
- (void)forceRePairingWithUUID:(id)a3 partIds:(id)a4 completion:(id)a5;
- (void)forceUpdateKeyAlignmentRecordForUUID:(id)a3 completion:(id)a4;
- (void)forceUpdateKeyMapsForUUID:(id)a3 completion:(id)a4;
- (void)getLocalPairingDataWithCompletion:(id)a3;
- (void)getMacBeaconConfigWithCompletion:(id)a3;
- (void)getOfflineFindingInfoWithCurrentData:(id)a3 completion:(id)a4;
- (void)hintBasedIndexSearchForBeacon:(id)a3 baseIndex:(id)a4 hint:(unsigned __int8)a5 completion:(id)a6;
- (void)ignoreBeaconByUUID:(id)a3 until:(unint64_t)a4;
- (void)ignoreBeaconByUUID:(id)a3 untilDate:(id)a4 completion:(id)a5;
- (void)ignoreTrackingFor:(id)a3 until:(unint64_t)a4 completion:(id)a5;
- (void)ignoreTrackingForUUID:(id)a3 until:(unint64_t)a4 completion:(id)a5;
- (void)ignoringUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4;
- (void)initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion:(id)a3;
- (void)initiatePairingSessionWithCompletion:(id)a3;
- (void)invalidatePairingSession:(id)a3 completion:(id)a4;
- (void)isLPEMModeSupportedWithCompletion:(id)a3;
- (void)isUTAppAlertDisabled:(id)a3;
- (void)keySyncMetadataWithcompletion:(id)a3;
- (void)latestLocationsForIdentifiers:(id)a3 fetchLimit:(id)a4 sources:(id)a5 completion:(id)a6;
- (void)leechScannerDiscoveredAdvertisementData:(id)a3 rssi:(int)a4 completion:(id)a5;
- (void)locationForContext:(id)a3 completion:(id)a4;
- (void)nearOwnerCommandKeysWithCompletion:(id)a3;
- (void)notificationBeaconForSubscriptionId:(id)a3 completion:(id)a4;
- (void)offlineAdvertisingKeysForReason:(int64_t)a3 completion:(id)a4;
- (void)ownedDeviceKeyRecordsForUUID:(id)a3 completion:(id)a4;
- (void)ownerSessionStateWithCompletion:(id)a3;
- (void)playUnauthorizedSoundOnBeaconUUID:(id)a3 completion:(id)a4;
- (void)poisonBeaconIdentifier:(id)a3 completion:(id)a4;
- (void)postedLocalNotifyWhenFoundNotificationForUUID:(id)a3 completion:(id)a4;
- (void)primaryAccountModified;
- (void)publishSeparationEventForBeacons:(id)a3 eventType:(int64_t)a4 region:(id)a5 completion:(id)a6;
- (void)publishWildModeRecordsWithCompletion:(id)a3;
- (void)purgeOwnedDeviceKeyRecordsForUUID:(id)a3 completion:(id)a4;
- (void)rawSearchResultsForIdentifier:(id)a3 dateInterval:(id)a4 completion:(id)a5;
- (void)readAISMetadataForIdentifier:(id)a3 completion:(id)a4;
- (void)readAISMetadataFromMACAddress:(id)a3 useOwnerControlPoint:(BOOL)a4 completion:(id)a5;
- (void)readRawAISMetadataForIdentifier:(id)a3 completion:(id)a4;
- (void)readRawAISMetadataFromMACAddress:(id)a3 useOwnerControlPoint:(BOOL)a4 completion:(id)a5;
- (void)removeBeacon:(id)a3 completion:(id)a4;
- (void)removeBeaconFromGroup:(id)a3 completion:(id)a4;
- (void)removeDuplicateBeaconsWithCompletion:(id)a3;
- (void)removeLocalAccountDataWithCompletion:(id)a3;
- (void)removeSafeLocation:(id)a3 completion:(id)a4;
- (void)repairDataStore:(id)a3;
- (void)requestLiveLocationForFriend:(id)a3 completion:(id)a4;
- (void)requestLiveLocationForUUID:(id)a3 completion:(id)a4;
- (void)roleCategoriesWithCompletion:(id)a3;
- (void)safeLocationsWithCompletion:(id)a3;
- (void)sendRegisterIntentWithCompletion:(id)a3;
- (void)sendUnregisterIntentWithCompletion:(id)a3;
- (void)setAlignmentUncertainty:(double)a3 atIndex:(int64_t)a4 date:(id)a5 forBeacon:(id)a6 completion:(id)a7;
- (void)setAlwaysBeaconWildState:(BOOL)a3 completion:(id)a4;
- (void)setCurrentWildKeyIndex:(int64_t)a3 forBeacon:(id)a4 completion:(id)a5;
- (void)setFindMyNetworkStatusForMACAddress:(id)a3 status:(BOOL)a4 completion:(id)a5;
- (void)setKeyRollInterval:(int64_t)a3 forBeacon:(id)a4 completion:(id)a5;
- (void)setRole:(int64_t)a3 beaconId:(id)a4 completion:(id)a5;
- (void)setServiceState:(id)a3 completion:(id)a4;
- (void)setSuppressLPEMBeaconing:(BOOL)a3 completion:(id)a4;
- (void)setUserHasAcknowledgedFindMy:(BOOL)a3 completion:(id)a4;
- (void)setWildKeyBase:(int64_t)a3 interval:(int64_t)a4 fallback:(int64_t)a5 forBeacon:(id)a6 completion:(id)a7;
- (void)simulateAccessoryPairing:(id)a3 name:(id)a4 isAirPods:(BOOL)a5 completion:(id)a6;
- (void)standaloneBeaconsForUUIDs:(NSArray *)a3 completion:(id)a4;
- (void)startScanningIncludeServiceCharacterstics:(BOOL)a3 completion:(id)a4;
- (void)startUpdatingSimpleBeaconsWithContext:(id)a3 completion:(id)a4;
- (void)stopFetchingUnauthorizedEncryptedPayloadWithCompletion:(id)a3;
- (void)stopScanningWithCompletion:(id)a3;
- (void)successfulConnectionForUserIdentifier:(id)a3 beaconIdentifier:(id)a4 primaryIndex:(unint64_t)a5 leMAC:(id)a6 ltkIndex:(unint64_t)a7 ltk:(id)a8 completion:(id)a9;
- (void)tagSeparationStateChanged:(id)a3 beaconUUID:(id)a4 location:(id)a5 completion:(id)a6;
- (void)unacceptedBeaconsWithCompletion:(id)a3;
- (void)unassignSafeLocation:(id)a3 from:(id)a4 completion:(id)a5;
- (void)unauthorizedTrackingTypeWithCompletion:(id)a3 completion:(id)a4;
- (void)unknownBeaconsForUUIDs:(id)a3 completion:(id)a4;
- (void)unpairUUID:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)updateBatteryStatus:(unsigned __int8)a3 beaconUUID:(id)a4 completion:(id)a5;
- (void)updateBeacon:(id)a3 updates:(id)a4 completion:(id)a5;
- (void)updateBeaconObservations:(id)a3 completion:(id)a4;
- (void)updateBeaconUUID:(id)a3 firmwareUpdateState:(int64_t)a4 systemVersion:(id)a5 error:(id)a6 completion:(id)a7;
- (void)updateObfuscatedIdentifierWithCompletion:(id)a3;
- (void)updateSafeLocation:(id)a3 completion:(id)a4;
- (void)userHasAcknowledgeFindMyWithCompletion:(id)a3;
- (void)verifyPairingInfoUsing:(id)a3 completion:(id)a4;
- (void)waitForBeaconStoreAvailableWithCompletion:(id)a3;
@end

@implementation BeaconManagerTrampoline

- (void)firmwareUpdateCandidateBeaconsWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_10093D6C8, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1000D8000((uint64_t)sub_1000DF7A4, v5);

  swift_release(v5);
}

- (void)updateBeaconUUID:(id)a3 firmwareUpdateState:(int64_t)a4 systemVersion:(id)a5 error:(id)a6 completion:(id)a7
{
  uint64_t v13 = type metadata accessor for UUID(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v17 = _Block_copy(a7);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (a5)
  {
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    a5 = v19;
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  _Block_copy(v17);
  v20 = self;
  id v21 = a6;
  sub_1000DE3EC( (uint64_t)v16,  a4,  v18,  (uint64_t)a5,  (uint64_t)a6,  (uint64_t)v20,  (void (**)(void, void))v17);
  _Block_release(v17);
  _Block_release(v17);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

- (void)beaconsInFirmwareUpdateState:(int64_t)a3 dateInterval:(id)a4 completion:(id)a5
{
  uint64_t v9 = type metadata accessor for DateInterval(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = _Block_copy(a5);
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)(a4);
  _Block_copy(v13);
  uint64_t v14 = self;
  sub_1000DE5D8(a3, (uint64_t)v12, (char *)v14, (uint64_t)v13);
  _Block_release(v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_1000DE8DC((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)firmwareUpdateStateForBeaconUUID:(id)a3 completion:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v12 = swift_allocObject(&unk_10093D358, 24LL, 7LL);
  *(void *)(v12 + 16) = v11;
  uint64_t v13 = self;
  sub_1000D8674((unint64_t)v10, (uint64_t)sub_10009C440, v12);

  swift_release(v12);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)didObserveUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = sub_100022898(0LL, &qword_1009A9C70, &OBJC_CLASS___SPUnauthorizedTrackingObservation_ptr);
  uint64_t v8 = sub_10014EFD4(&qword_1009A9D30, &qword_1009A9C70, &OBJC_CLASS___SPUnauthorizedTrackingObservation_ptr);
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  _Block_copy(v6);
  uint64_t v10 = self;
  uint64_t v11 = sub_1004AC0BC();
  sub_100343E2C(v9, v11, v6);
  _Block_release(v6);
  swift_release();
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)clientConfigurationWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_1001AB98C((uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)standaloneBeaconsForUUIDs:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100004AEC(&qword_1009A9BF0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject(&unk_1009528F8, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  uint64_t v13 = (void *)swift_allocObject(&unk_100952920, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_1009A9CE8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_100952948, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1009A9CF8;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  sub_10034D8A4((uint64_t)v9, (uint64_t)&unk_1009A9D08, (uint64_t)v14);
  swift_release();
}

- (void)beaconingIdentifierForMACAddress:(id)a3 completion:(id)a4
{
}

- (void)fetchFindMyNetworkStatusForMACAddress:(id)a3 completion:(id)a4
{
}

- (void)connectUsingMACAddress:(id)a3 longTermKey:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  uint64_t v17 = self;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v13 = v12;

  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v10);
  unint64_t v16 = v15;

  _Block_copy(v8);
  sub_10034E42C(v11, v13, v14, v16, (uint64_t)v17, v8);
  _Block_release(v8);
  _Block_release(v8);
  sub_100016F9C(v14, v16);
  sub_100016F9C(v11, v13);
}

- (void)disconnectFromMACAddress:(id)a3 completion:(id)a4
{
}

- (void)setFindMyNetworkStatusForMACAddress:(id)a3 status:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v8 = _Block_copy(a5);
  id v9 = a3;
  unint64_t v13 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v12 = v11;

  _Block_copy(v8);
  sub_10034EB60(v10, v12, v5, (uint64_t)v13, v8);
  _Block_release(v8);
  _Block_release(v8);
  sub_100016F9C(v10, v12);
}

- (void)beaconForIdentifier:(id)a3 completion:(id)a4
{
}

- (void)beaconGroupForIdentifier:(id)a3 completion:(id)a4
{
}

- (void)beaconGroupsForUUIDs:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  uint64_t v9 = swift_allocObject(&unk_100952740, 24LL, 7LL);
  *(void *)(v9 + 16) = v6;
  sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v10 = self;
  sub_100290898(v8, (uint64_t)sub_1003528E8, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)ownerSessionStateWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  BOOL v5 = self;
  _Block_copy(v4);
  sub_1004F730C();
  QueueSynchronizer.conditionalSync<A>(_:)(sub_100153864);
  swift_release();
  sub_10034F0D4(v6, (uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);

  _Block_release(v4);
}

- (void)simulateAccessoryPairing:(id)a3 name:(id)a4 isAirPods:(BOOL)a5 completion:(id)a6
{
  uint64_t v8 = (void (**)(void *, void *))_Block_copy(a6);
  unint64_t v9 = sub_10014A2C0();
  uint64_t v10 = swift_allocError(&type metadata for BeaconManagerService.BeaconManagerServiceError, v9, 0LL, 0LL);
  *unint64_t v11 = 6;
  id v12 = a3;
  uint64_t v14 = self;
  unint64_t v13 = (void *)_convertErrorToNSError(_:)(v10);
  v8[2](v8, v13);

  swift_errorRelease(v10);
  _Block_release(v8);
}

- (void)fetchUnauthorizedEncryptedPayload:(id)a3 completion:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v12 = swift_allocObject(&unk_100952718, 24LL, 7LL);
  *(void *)(v12 + 16) = v11;
  unint64_t v13 = self;
  uint64_t v14 = static os_log_type_t.default.getter(v13);
  if (qword_10099B788 != -1) {
    swift_once(&qword_10099B788, sub_1006517A0);
  }
  uint64_t v15 = qword_100A2B098;
  uint64_t v16 = sub_100004AEC((uint64_t *)&unk_10099D740);
  uint64_t v17 = swift_allocObject(v16, 72LL, 7LL);
  *(_OWORD *)(v17 + 16) = xmmword_1007E67D0;
  uint64_t v18 = UUID.uuidString.getter(v17);
  uint64_t v20 = v19;
  *(void *)(v17 + 56) = &type metadata for String;
  *(void *)(v17 + 64) = sub_1000226F4();
  *(void *)(v17 + 32) = v18;
  *(void *)(v17 + 40) = v20;
  os_log(_:dso:log:_:_:)(v14, &_mh_execute_header, v15, "fetchUnauthorizedEncryptedPayload %@", 36LL, 2LL, v17);
  swift_bridgeObjectRelease();
  sub_100012ED8( (Class *)((char *)&v13->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&v13->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  sub_100295370((uint64_t)v10, (uint64_t)sub_1003528E0, v12);

  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)stopFetchingUnauthorizedEncryptedPayloadWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_1009526F0, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  char v6 = self;
  sub_10034A734((uint64_t)sub_10009C9E4, v5);

  swift_release();
}

- (void)beaconStoreStatusWithCompletion:(id)a3
{
  v4 = (void (**)(void *, void))_Block_copy(a3);
  sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v5 = self;
  sub_1004F730C();
  QueueSynchronizer.conditionalSync<A>(_:)(sub_100153864);
  swift_release();
  v4[2](v4, v6);
  _Block_release(v4);
}

- (void)hintBasedIndexSearchForBeacon:(id)a3 baseIndex:(id)a4 hint:(unsigned __int8)a5 completion:(id)a6
{
  uint64_t v11 = type metadata accessor for UUID(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = _Block_copy(a6);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  *(void *)(swift_allocObject(&unk_1009526C8, 24LL, 7LL) + 16) = v15;
  uint64_t v16 = *sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  id v17 = a4;
  uint64_t v18 = self;
  sub_1001AF9F8((uint64_t)v14, v17, a5, v16, (void (*)(void *, void *))sub_1003528D8);

  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)forceKeySyncForBeaconUUID:(id)a3 lastObservationDate:(id)a4 lastObservationIndex:(unint64_t)a5 completion:(id)a6
{
  unint64_t v49 = a5;
  v45 = self;
  uint64_t v10 = sub_100004AEC(&qword_1009A9BF0);
  __chkstk_darwin(v10);
  uint64_t v50 = (uint64_t)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v48 = type metadata accessor for Date(0LL);
  uint64_t v46 = *(void *)(v48 - 8);
  uint64_t v12 = *(void *)(v46 + 64);
  uint64_t v13 = __chkstk_darwin(v48);
  v40 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v39 - v14;
  uint64_t v16 = type metadata accessor for UUID(0LL);
  uint64_t v41 = *(void *)(v16 - 8);
  uint64_t v42 = v16;
  uint64_t v17 = *(void *)(v41 + 64);
  uint64_t v18 = __chkstk_darwin(v16);
  v39 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v39 - v19;
  uint64_t v21 = _Block_copy(a6);
  v47 = v20;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v44 = v15;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v43 = swift_allocObject(&unk_100952678, 24LL, 7LL);
  *(void *)(v43 + 16) = v21;
  uint64_t v22 = *sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v23 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56LL))(v50, 1LL, 1LL, v23);
  uint64_t v24 = v41;
  uint64_t v25 = v42;
  (*(void (**)(char *, char *, uint64_t))(v41 + 16))( (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v20,  v42);
  uint64_t v26 = v46;
  uint64_t v27 = v48;
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))( (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v15,  v48);
  uint64_t v28 = *(unsigned __int8 *)(v24 + 80);
  uint64_t v29 = (v28 + 40) & ~v28;
  unint64_t v30 = (v17 + v29 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v31 = *(unsigned __int8 *)(v26 + 80);
  uint64_t v32 = (v31 + v30 + 8) & ~v31;
  unint64_t v33 = (v12 + v32 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  v34 = (char *)swift_allocObject(&unk_1009526A0, v33 + 16, v28 | v31 | 7);
  *((void *)v34 + 2) = 0LL;
  *((void *)v34 + 3) = 0LL;
  *((void *)v34 + 4) = v22;
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(&v34[v29], v39, v25);
  *(void *)&v34[v30] = v49;
  uint64_t v35 = v27;
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(&v34[v32], v40, v27);
  v36 = &v34[v33];
  uint64_t v37 = v43;
  *(void *)v36 = sub_10009C9E4;
  *((void *)v36 + 1) = v37;
  v38 = v45;
  swift_retain();
  swift_retain();
  sub_1003EDB00(v50, (uint64_t)&unk_1009A9CA0, (uint64_t)v34);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v44, v35);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v47, v25);
}

- (void)fakeClassicPairingWithMACAddress:(id)a3 completion:(id)a4
{
  unsigned __int8 v6 = _Block_copy(a4);
  id v7 = a3;
  uint64_t v11 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v10 = v9;

  _Block_copy(v6);
  sub_10034F4F4(v8, v10, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_100016F9C(v8, v10);
}

- (void)forceRePairingWithUUID:(id)a3 partIds:(id)a4 completion:(id)a5
{
  uint64_t v9 = type metadata accessor for UUID(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char **)((char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v13 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v14 = sub_100022898(0LL, (unint64_t *)&qword_1009A9C80, &OBJC_CLASS___NSNumber_ptr);
  uint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v14);
  _Block_copy(v13);
  uint64_t v16 = self;
  sub_10034F7B0(v12, v15, (uint64_t)v16, v13);
  _Block_release(v13);
  _Block_release(v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char **, uint64_t))(v10 + 8))(v12, v9);
}

- (void)waitForBeaconStoreAvailableWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_100952650, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = *(void *)(*sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16])
                 + 256LL);
  id v7 = self;
  sub_100559C14(v6, (void (*)(uint64_t))sub_1003526E8, v5);

  swift_release();
}

- (void)beaconsToMaintainWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_10034FA34((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)beaconsToMaintainPersistentConnection:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = *sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  _Block_copy(v4);
  uint64_t v6 = self;
  sub_1001AFCB4(v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)ignoreBeaconByUUID:(id)a3 until:(unint64_t)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v11 = self;
  sub_10034B1D0((uint64_t)v10, a4);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)unknownBeaconsForUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  uint64_t v9 = swift_allocObject(&unk_100952628, 24LL, 7LL);
  *(void *)(v9 + 16) = v6;
  uint64_t v10 = self;
  sub_10034B3A4(v8, (uint64_t)sub_1003526C0, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)didDetectUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = sub_100022898(0LL, &qword_1009A9C70, &OBJC_CLASS___SPUnauthorizedTrackingObservation_ptr);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  _Block_copy(v6);
  uint64_t v9 = self;
  sub_10034FC2C(v8, (uint64_t)v9, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)didUpdateUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  uint64_t v8 = self;
  sub_10034FE08((uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)didWithdrawUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  _Block_copy(v5);
  uint64_t v6 = self;
  sub_10034FFD0((uint64_t)v6, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);
}

- (void)ignoringUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
}

- (void)unauthorizedTrackingTypeWithCompletion:(id)a3 completion:(id)a4
{
}

- (void)acceptUTForBeaconUUID:(id)a3
{
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = self;
  sub_10034B7D8((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)playUnauthorizedSoundOnBeaconUUID:(id)a3 completion:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_copy(v11);
  uint64_t v12 = self;
  sub_100350568((uint64_t)v10, (uint64_t)v12, v11);
  _Block_release(v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)ignoreTrackingForUUID:(id)a3 until:(unint64_t)a4 completion:(id)a5
{
  uint64_t v9 = type metadata accessor for UUID(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = (void (*)(uint64_t))_Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (v13)
  {
    uint64_t v14 = swift_allocObject(&unk_100952600, 24LL, 7LL);
    *(void *)(v14 + 16) = v13;
    uint64_t v13 = (void (*)(uint64_t))sub_10009C9E4;
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  uint64_t v15 = self;
  sub_10034BA64((uint64_t)v12, a4, v13, v14);
  sub_10002214C((uint64_t)v13, v14);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)ignoreBeaconByUUID:(id)a3 untilDate:(id)a4 completion:(id)a5
{
  uint64_t v20 = type metadata accessor for Date(0LL);
  uint64_t v9 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for UUID(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = (void (*)(uint64_t))_Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  if (v16)
  {
    uint64_t v17 = swift_allocObject(&unk_1009525D8, 24LL, 7LL);
    *(void *)(v17 + 16) = v16;
    uint64_t v16 = (void (*)(uint64_t))sub_10009C9E4;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  uint64_t v18 = self;
  sub_10034BCEC((uint64_t)v15, (uint64_t)v11, v16, v17);
  sub_10002214C((uint64_t)v16, v17);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v20);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)ignoreTrackingFor:(id)a3 until:(unint64_t)a4 completion:(id)a5
{
  uint64_t v8 = (void (*)(uint64_t))_Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject(&unk_1009525B0, 24LL, 7LL);
    *(void *)(v9 + 16) = v8;
    uint64_t v8 = (void (*)(uint64_t))sub_10009C9E4;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  id v10 = a3;
  uint64_t v11 = self;
  sub_10034BFD0(v10, a4, v8, v9);
  sub_10002214C((uint64_t)v8, v9);
}

- (void)disableUTAppAlert:(BOOL)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject(&unk_100952588, 24LL, 7LL);
    *(void *)(v7 + 16) = v6;
    uint64_t v8 = (void (*)(void))sub_10009C9E4;
  }

  else
  {
    uint64_t v8 = 0LL;
    uint64_t v7 = 0LL;
  }

  uint64_t v9 = qword_10099B318;
  id v10 = self;
  if (v9 != -1) {
    swift_once(&qword_10099B318, sub_100352F58);
  }
  sub_100024954();
  sub_10061FB20(a3);
  swift_release();
  if (v6)
  {
    v8(0LL);
    sub_10002214C((uint64_t)v8, v7);
  }
}

- (void)isUTAppAlertDisabled:(id)a3
{
  v4 = (void (**)(void *, id))_Block_copy(a3);
  uint64_t v5 = qword_10099B318;
  uint64_t v9 = self;
  if (v5 != -1) {
    swift_once(&qword_10099B318, sub_100352F58);
  }
  sub_100024954();
  id v6 = sub_10061EC7C();
  NSString v7 = String._bridgeToObjectiveC()();
  id v8 = [v6 BOOLForKey:v7];
  swift_release();

  v4[2](v4, v8);
  _Block_release(v4);
}

- (void)updateBatteryStatus:(unsigned __int8)a3 beaconUUID:(id)a4 completion:(id)a5
{
  uint64_t v7 = a3;
  uint64_t v9 = type metadata accessor for UUID(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v14 = swift_allocObject(&unk_100952560, 24LL, 7LL);
  *(void *)(v14 + 16) = v13;
  sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v15 = self;
  sub_10019AD04(v7, (uint64_t)v12, (uint64_t)sub_10009C9E4, v14);

  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)latestLocationsForIdentifiers:(id)a3 fetchLimit:(id)a4 sources:(id)a5 completion:(id)a6
{
  uint64_t v11 = sub_100004AEC((uint64_t *)&unk_10099D720);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = type metadata accessor for UUID(0LL);
  uint64_t v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v15);
  if (a4)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
    uint64_t v17 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56LL))(v13, 0LL, 1LL, v17);
  }

  else
  {
    uint64_t v18 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56LL))(v13, 1LL, 1LL, v18);
  }

  type metadata accessor for SPBeaconLocationSource(0LL);
  uint64_t v20 = v19;
  uint64_t v21 = sub_100007864( &qword_10099C360,  (uint64_t (*)(uint64_t))type metadata accessor for SPBeaconLocationSource,  (uint64_t)&unk_1007E2F74);
  uint64_t v22 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a5, v20, v21);
  uint64_t v23 = swift_allocObject(&unk_100952538, 24LL, 7LL);
  *(void *)(v23 + 16) = v14;
  uint64_t v24 = self;
  sub_10034C4D4(v16, (uint64_t)v13, v22, (uint64_t)sub_1003526B8, v23);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_100015794((uint64_t)v13, (uint64_t *)&unk_10099D720);
}

- (void)locationForContext:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_100952510, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_1006E65D8(v8, (uint64_t)v11);
  int64_t v10 = *sub_100012ED8( (Class *)((char *)&v9->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&v9->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  swift_retain();
  sub_1001ABDE0((unint64_t)v11, v10, (void (*)(id, void))sub_1003526A0, v7);
  swift_release();
  sub_1001B1498(v11);

  swift_release();
}

- (void)rawSearchResultsForIdentifier:(id)a3 dateInterval:(id)a4 completion:(id)a5
{
  uint64_t v9 = type metadata accessor for DateInterval(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = &v21[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v13 = type metadata accessor for UUID(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = &v21[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v17 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v18 = swift_allocObject(&unk_1009524E8, 24LL, 7LL);
  *(void *)(v18 + 16) = v17;
  uint64_t v19 = *sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  type metadata accessor for Transaction(0LL);
  uint64_t v22 = v19;
  uint64_t v23 = v16;
  uint64_t v24 = sub_10035265C;
  uint64_t v25 = v18;
  uint64_t v20 = self;
  static Transaction.named<A>(_:with:)( "com.apple.icloud.searchpartyd.BeaconManagerService.rawSearchResults",  67LL,  2LL,  sub_100352684,  v21);

  swift_release();
  (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(_BYTE *, uint64_t))(v14 + 8))(v16, v13);
}

- (void)forceDistributeKeysWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_1009524C0, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  if (*(void *)(*sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16])
                 + 40LL))
  {
    id v6 = self;
    swift_retain();
    sub_1001E17AC((uint64_t)sub_10009C9E4, v5);

    swift_release();
    swift_release();
  }

  else
  {
    __break(1u);
  }

- (void)forceUpdateKeyMapsForUUID:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_100004AEC(&qword_10099D8A0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v11 = type metadata accessor for UUID(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v9, 0LL, 1LL, v11);
  }

  else
  {
    uint64_t v12 = type metadata accessor for UUID(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  }

  uint64_t v13 = *sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  _Block_copy(v10);
  uint64_t v14 = self;
  sub_1001AEEE8((uint64_t)v9, v13, (uint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);

  sub_100015794((uint64_t)v9, &qword_10099D8A0);
}

- (void)forceUpdateKeyAlignmentRecordForUUID:(id)a3 completion:(id)a4
{
}

- (void)removeBeacon:(id)a3 completion:(id)a4
{
}

- (void)removeBeaconFromGroup:(id)a3 completion:(id)a4
{
}

- (void)executeCommand:(id)a3 completion:(id)a4
{
}

- (void)sendRegisterIntentWithCompletion:(id)a3
{
}

- (void)sendUnregisterIntentWithCompletion:(id)a3
{
}

- (void)requestLiveLocationForUUID:(id)a3 completion:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = &v16[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v12 = swift_allocObject(&unk_100952380, 24LL, 7LL);
  *(void *)(v12 + 16) = v11;
  uint64_t v13 = *sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  type metadata accessor for Transaction(0LL);
  uint64_t v14 = swift_allocObject(&unk_1009523A8, 24LL, 7LL);
  swift_weakInit(v14 + 16, v13);
  uint64_t v17 = v14;
  uint64_t v18 = v10;
  uint64_t v19 = sub_100352EA8;
  uint64_t v20 = v12;
  uint64_t v15 = self;
  static Transaction.named<A>(_:with:)("requestLiveLocationForUUID", 26LL, 2LL, sub_10035256C, v16);

  swift_release();
  swift_release();
  (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)requestLiveLocationForFriend:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v9 = v8;
  uint64_t v10 = swift_allocObject(&unk_100952358, 24LL, 7LL);
  *(void *)(v10 + 16) = v6;
  sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v11 = self;
  sub_1001A4048(v7, v9, (uint64_t)sub_100352540, v10);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)allObservationsForBeacon:(id)a3 completion:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_copy(v11);
  uint64_t v12 = self;
  sub_1004BADE0((uint64_t)v10, (uint64_t)v11);
  _Block_release(v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)readRawAISMetadataFromMACAddress:(id)a3 useOwnerControlPoint:(BOOL)a4 completion:(id)a5
{
}

- (void)readAISMetadataFromMACAddress:(id)a3 useOwnerControlPoint:(BOOL)a4 completion:(id)a5
{
}

- (void)readRawAISMetadataForIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v12 = swift_allocObject(&unk_100952240, 24LL, 7LL);
  *(void *)(v12 + 16) = v11;
  uint64_t v13 = *sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v14 = self;
  sub_1002DBFC4((uint64_t)v10, v13, (void (*)(void *, uint64_t))sub_100352EA4, v12);

  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)readAISMetadataForIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v12 = swift_allocObject(&unk_100952218, 24LL, 7LL);
  *(void *)(v12 + 16) = v11;
  uint64_t v13 = *sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v14 = self;
  sub_1002DC878((uint64_t)v10, v13, (void (*)(void *, uint64_t))sub_100352EA4, v12);

  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)publishWildModeRecordsWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_1009521A0, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject(&unk_1009521C8, 32LL, 7LL);
  *(void *)(v6 + 16) = sub_10009C044;
  *(void *)(v6 + 24) = v5;
  type metadata accessor for Transaction(0LL);
  uint64_t v7 = swift_allocObject(&unk_1009521F0, 32LL, 7LL);
  *(void *)(v7 + 16) = sub_10034D7A0;
  *(void *)(v7 + 24) = v6;
  uint64_t v8 = self;
  swift_retain();
  swift_retain();
  static Transaction.asyncTask(name:block:)( "BeaconManagerService.publishWildModeRecords",  43LL,  2LL,  &unk_1009A9BE0,  v7);

  swift_release();
  swift_release();
  swift_release();
}

- (void)enableSeparationMonitoringForBeacons:(id)a3 completion:(id)a4
{
}

- (void)disableSeparationMonitoringForBeacons:(id)a3 completion:(id)a4
{
}

- (void)addSafeLocation:(id)a3 completion:(id)a4
{
}

- (void)removeSafeLocation:(id)a3 completion:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_copy(v11);
  uint64_t v12 = self;
  sub_1004998BC((uint64_t)v10, (uint64_t)v12, (void (**)(void, void, void))v11);
  _Block_release(v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)updateSafeLocation:(id)a3 completion:(id)a4
{
}

- (void)assignSafeLocation:(id)a3 to:(id)a4 completion:(id)a5
{
}

- (void)unassignSafeLocation:(id)a3 from:(id)a4 completion:(id)a5
{
}

- (void)fetchSeparationMonitoringStatus:(id)a3
{
}

- (void)safeLocationsWithCompletion:(id)a3
{
}

- (void)beaconsToMonitorForSeparation:(id)a3
{
}

- (void)publishSeparationEventForBeacons:(id)a3 eventType:(int64_t)a4 region:(id)a5 completion:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = type metadata accessor for UUID(0LL);
  uint64_t v12 = sub_100007864( &qword_1009A58F0,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
  uint64_t v13 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v11, v12);
  uint64_t v14 = swift_allocObject(&unk_10095DE48, 24LL, 7LL);
  *(void *)(v14 + 16) = v10;
  uint64_t v15 = *sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  id v16 = a5;
  uint64_t v17 = self;
  sub_10049B7F4(v13, a4, v16, v15, (void (*)(void, void))sub_1002DAFF8, v14);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)forceLOIBasedSafeLocationRefresh:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_10095DDF8, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_10047CEDC((uint64_t)sub_1000DEB08, v5);

  swift_release();
}

- (void)activeCompanionWithCompletion:(id)a3
{
  uint64_t v5 = type metadata accessor for OwnedBeaconRecord(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_100004AEC((uint64_t *)&unk_1009A9C30);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v20 - v13;
  uint64_t v15 = (void (**)(void *, unint64_t *))_Block_copy(a3);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v14, 1LL, 1LL, v5);
  uint64_t v16 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_beaconStore);
  sub_10001581C((uint64_t)v14, (uint64_t)v12, (uint64_t *)&unk_1009A9C30);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v12, 1LL, v5) == 1)
  {
    uint64_t v17 = self;
    uint64_t v18 = 0LL;
  }

  else
  {
    sub_10002218C((uint64_t)v12, (uint64_t)v8, type metadata accessor for OwnedBeaconRecord);
    swift_retain_n(v16, 2LL);
    uint64_t v19 = self;
    uint64_t v18 = sub_1001455C0((uint64_t)v8, v16);
    sub_100018C68((uint64_t)v8, type metadata accessor for OwnedBeaconRecord);
    swift_release_n(v16, 2LL);
  }

  v15[2](v15, v18);

  sub_100015794((uint64_t)v14, (uint64_t *)&unk_1009A9C30);
  _Block_release(v15);
}

- (void)updateObfuscatedIdentifierWithCompletion:(id)a3
{
}

- (void)primaryAccountModified
{
  v3 = self;
  sub_1001333F0();
}

- (void)removeLocalAccountDataWithCompletion:(id)a3
{
}

- (void)beaconingStateWithCompletion:(id)a3
{
}

- (void)beaconForUUID:(id)a3 completion:(id)a4
{
}

- (void)ownedDeviceKeyRecordsForUUID:(id)a3 completion:(id)a4
{
}

- (void)createOwnedDeviceKeyRecordForUUID:(id)a3 completion:(id)a4
{
}

- (void)purgeOwnedDeviceKeyRecordsForUUID:(id)a3 completion:(id)a4
{
}

- (void)notificationBeaconForSubscriptionId:(id)a3 completion:(id)a4
{
}

- (void)allBeaconsWithCompletion:(id)a3
{
}

- (void)allBeaconsOfTypes:(id)a3 includeDupes:(BOOL)a4 includeHidden:(BOOL)a5 completion:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  type metadata accessor for SPBeaconType(0LL);
  uint64_t v12 = v11;
  uint64_t v13 = sub_100007864( &qword_10099BC78,  (uint64_t (*)(uint64_t))type metadata accessor for SPBeaconType,  (uint64_t)&unk_1007E09EC);
  uint64_t v14 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v12, v13);
  uint64_t v15 = swift_allocObject(&unk_10096F950, 24LL, 7LL);
  *(void *)(v15 + 16) = v10;
  uint64_t v16 = self;
  sub_10065AAF4(v14, a4, a5, (uint64_t)sub_100662C24, v15);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)startUpdatingSimpleBeaconsWithContext:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  uint64_t v8 = self;
  sub_1002CEE3C(v7, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)unacceptedBeaconsWithCompletion:(id)a3
{
}

- (void)beaconingKeysOfType:(int64_t)a3 withCompletion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_10096F900, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = self;
  sub_10065ADF0(a3, (uint64_t)sub_100662B04, v7);

  swift_release();
}

- (void)beaconingKeysForUUID:(id)a3 dateInterval:(id)a4 completion:(id)a5
{
  uint64_t v9 = type metadata accessor for DateInterval(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for UUID(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)(a4);
  _Block_copy(v17);
  uint64_t v18 = self;
  sub_10065F97C((uint64_t)v16, (uint64_t)v12, (uint64_t)v18, (void (**)(void, void))v17);
  _Block_release(v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

- (void)setServiceState:(id)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(void *, void))_Block_copy(a4);
  uint64_t v7 = qword_10099B318;
  id v8 = a3;
  uint64_t v10 = self;
  if (v7 != -1) {
    swift_once(&qword_10099B318, sub_100352F58);
  }
  id v9 = v8;
  sub_100024954();
  sub_10061ED04(v9);
  swift_release();
  v6[2](v6, 0LL);
  _Block_release(v6);
}

- (void)getMacBeaconConfigWithCompletion:(id)a3
{
}

- (void)isLPEMModeSupportedWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = (void (*)(void *, void))v4[2];
  uint64_t v6 = self;
  v5(v4, 0LL);
  _Block_release(v4);
}

- (void)userHasAcknowledgeFindMyWithCompletion:(id)a3
{
  v4 = (void (**)(void *, id))_Block_copy(a3);
  uint64_t v5 = (void *)objc_opt_self(&OBJC_CLASS___NSUserDefaults);
  id v8 = self;
  id v6 = [v5 standardUserDefaults];
  id v7 = [v6 userHasAcknowledgedFindMy];

  v4[2](v4, v7);
  _Block_release(v4);
}

- (void)setUserHasAcknowledgedFindMy:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = _Block_copy(a4);
  id v7 = (void (*)(void *))v6[2];
  id v9 = self;
  v7(v6);
  id v8 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  [v8 setUserHasAcknowledgedFindMy:v4];

  _Block_release(v6);
}

- (void)setSuppressLPEMBeaconing:(BOOL)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  id v6 = (void (*)(void *))v5[2];
  id v7 = self;
  v6(v5);
  _Block_release(v5);
}

- (void)offlineAdvertisingKeysForReason:(int64_t)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = *sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  _Block_copy(v6);
  id v8 = self;
  sub_1002D9270(a3, v7, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)allPairingErrorsWithCompletion:(id)a3
{
}

- (void)postedLocalNotifyWhenFoundNotificationForUUID:(id)a3 completion:(id)a4
{
}

- (void)commandKeysForUUIDs:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  uint64_t v9 = swift_allocObject(&unk_10096F8B0, 24LL, 7LL);
  *(void *)(v9 + 16) = v6;
  uint64_t v10 = self;
  sub_10065B624(v8, (uint64_t)sub_100662C20, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)commandKeysForUUIDs:(id)a3 dateInterval:(id)a4 completion:(id)a5
{
  uint64_t v9 = type metadata accessor for DateInterval(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = _Block_copy(a5);
  uint64_t v14 = type metadata accessor for UUID(0LL);
  uint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v14);
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v16 = swift_allocObject(&unk_10096F888, 24LL, 7LL);
  *(void *)(v16 + 16) = v13;
  uint64_t v17 = self;
  sub_10065B8D8(v15, (uint64_t)v12, (uint64_t)sub_100662AF8, v16);

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)allBeaconingKeysForUUID:(id)a3 dateInterval:(id)a4 forceGenerate:(BOOL)a5 completion:(id)a6
{
  BOOL v21 = a5;
  uint64_t v10 = type metadata accessor for DateInterval(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = &v20[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v14 = type metadata accessor for UUID(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = &v20[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v18 = _Block_copy(a6);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)(a4);
  _Block_copy(v18);
  uint64_t v19 = self;
  sub_10065FCEC((uint64_t)v17, (uint64_t)v13, v21, (uint64_t)v19, (void (**)(void, void))v18);
  _Block_release(v18);
  _Block_release(v18);

  (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(_BYTE *, uint64_t))(v15 + 8))(v17, v14);
}

- (void)commandKeysForUUID:(id)a3 withCriteria:(id)a4 completion:(id)a5
{
}

- (void)fetchAllKeyMapFileDescriptorsWithCompletion:(id)a3
{
}

- (void)allDuriansWithCompletion:(id)a3
{
}

- (void)roleCategoriesWithCompletion:(id)a3
{
}

- (void)setRole:(int64_t)a3 beaconId:(id)a4 completion:(id)a5
{
}

- (void)updateBeacon:(id)a3 updates:(id)a4 completion:(id)a5
{
}

- (void)setWildKeyBase:(int64_t)a3 interval:(int64_t)a4 fallback:(int64_t)a5 forBeacon:(id)a6 completion:(id)a7
{
  uint64_t v13 = type metadata accessor for UUID(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = _Block_copy(a7);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a6);
  _Block_copy(v17);
  uint64_t v18 = self;
  sub_1006604A4(a3, a4, a5, (uint64_t)v16, (uint64_t)v18, v17);
  _Block_release(v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

- (void)setAlignmentUncertainty:(double)a3 atIndex:(int64_t)a4 date:(id)a5 forBeacon:(id)a6 completion:(id)a7
{
  uint64_t v24 = type metadata accessor for UUID(0LL);
  uint64_t v13 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for Date(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = _Block_copy(a7);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a6);
  uint64_t v21 = swift_allocObject(&unk_10096F810, 24LL, 7LL);
  *(void *)(v21 + 16) = v20;
  uint64_t v22 = self;
  sub_10065C114(a4, (uint64_t)v19, (uint64_t)v15, (uint64_t)sub_100662AB4, v21, a3);

  swift_release();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v24);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
}

- (void)setKeyRollInterval:(int64_t)a3 forBeacon:(id)a4 completion:(id)a5
{
  uint64_t v9 = type metadata accessor for UUID(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  _Block_copy(v13);
  uint64_t v14 = self;
  sub_1006606D0(a3, (uint64_t)v12, (uint64_t)v14, v13);
  _Block_release(v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)setCurrentWildKeyIndex:(int64_t)a3 forBeacon:(id)a4 completion:(id)a5
{
}

- (void)connectedToBeacon:(id)a3 withIndex:(int64_t)a4 completion:(id)a5
{
  uint64_t v9 = type metadata accessor for UUID(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_copy(v13);
  uint64_t v14 = self;
  sub_100660A14((uint64_t)v12, a4, (uint64_t)v14, v13);
  _Block_release(v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)fetchUserStatsForBeacon:(id)a3 completion:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v12 = swift_allocObject(&unk_10096F7E8, 24LL, 7LL);
  *(void *)(v12 + 16) = v11;
  uint64_t v13 = self;
  sub_10065C724((uint64_t)v13, (uint64_t)sub_10009CA10, v12);

  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)fetchFirmwareVersionForBeacon:(id)a3 completion:(id)a4
{
}

- (void)nearOwnerCommandKeysWithCompletion:(id)a3
{
}

- (void)updateBeaconObservations:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = sub_100022898(0LL, (unint64_t *)&unk_1009B9A40, &OBJC_CLASS___SPBeaconObservation_ptr);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  _Block_copy(v6);
  uint64_t v9 = self;
  sub_100660C00(v8, (uint64_t)v9, (uint64_t (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)createDuplicateBeaconsForBeacon:(id)a3 skipGroupIdentifier:(BOOL)a4 count:(int64_t)a5 completion:(id)a6
{
  BOOL v23 = a4;
  uint64_t v10 = type metadata accessor for UUID(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = &v22[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v14 = _Block_copy(a6);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v15 = swift_allocObject(&unk_10096F770, 24LL, 7LL);
  *(void *)(v15 + 16) = v14;
  uint64_t v16 = *sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v17 = (void *)objc_opt_self(&OBJC_CLASS___FMSystemInfo);
  uint64_t v18 = self;
  _Block_copy(v14);
  id v19 = [v17 sharedInstance];
  unsigned int v20 = [v19 isInternalBuild];

  if (v20)
  {
    uint64_t v21 = type metadata accessor for Transaction(0LL);
    __chkstk_darwin(v21);
    *(void *)&v22[-48] = v16;
    *(void *)&v22[-40] = v13;
    *(void *)&v22[-32] = a5;
    *(void *)&v22[-24] = sub_10009C9E4;
    *(void *)&v22[-16] = v15;
    v22[-8] = v23;
    static Transaction.named<A>(_:with:)("createDuplicateBeacons", 22LL, 2LL, sub_100662A60);
  }

  else
  {
    (*((void (**)(void *, void))v14 + 2))(v14, 0LL);
  }

  swift_release();
  _Block_release(v14);

  (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)removeDuplicateBeaconsWithCompletion:(id)a3
{
  BOOL v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_10096F720, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  id v6 = sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v7 = swift_allocObject(&unk_10096F748, 32LL, 7LL);
  *(void *)(v7 + 16) = sub_100662A4C;
  *(void *)(v7 + 24) = v5;
  uint64_t v8 = *(void *)(*v6 + 256LL);
  type metadata accessor for Transaction(0LL);
  v10[2] = v8;
  char v11 = 1;
  uint64_t v12 = sub_100662A54;
  uint64_t v13 = v7;
  uint64_t v9 = self;
  swift_retain();
  static Transaction.named<A>(_:with:)("removeDuplicateBeacons", 22LL, 2LL, sub_10056C4BC, v10);

  swift_release();
  swift_release();
}

- (void)keySyncMetadataWithcompletion:(id)a3
{
  uint64_t v5 = sub_100004AEC(&qword_1009A9BF0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_10096F6D0, 24LL, 7LL);
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  char v11 = (void *)swift_allocObject(&unk_10096F6F8, 56LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = self;
  v11[5] = sub_100662CA4;
  v11[6] = v9;
  uint64_t v12 = self;
  swift_retain();
  sub_1003EDB00((uint64_t)v7, (uint64_t)&unk_1009B9A20, (uint64_t)v11);

  swift_release();
  swift_release();
}

- (void)initiatePairingSessionWithCompletion:(id)a3
{
}

- (void)invalidatePairingSession:(id)a3 completion:(id)a4
{
}

- (void)verifyPairingInfoUsing:(id)a3 completion:(id)a4
{
}

- (void)finalizePairingUsing:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  uint64_t v8 = self;
  sub_1006616A0((uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)unpairUUID:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  uint64_t v9 = type metadata accessor for UUID(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_copy(v13);
  uint64_t v14 = self;
  sub_100661974((uint64_t)v12, a4, (uint64_t)v14, v13);
  _Block_release(v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)getLocalPairingDataWithCompletion:(id)a3
{
}

- (void)currentBeaconingKeyWithCompletion:(id)a3
{
  BOOL v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_10096F680, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v6 = swift_allocObject(&unk_10096F6A8, 32LL, 7LL);
  *(void *)(v6 + 16) = sub_10009C440;
  *(void *)(v6 + 24) = v5;
  id v7 = self;
  swift_retain();
  sub_10028E3A0(0LL, (uint64_t)sub_10066292C, v6);

  swift_release();
  swift_release();
}

- (void)setAlwaysBeaconWildState:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = self;
  sub_100661C34(v4, (uint64_t)v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)alwaysBeaconWildStateWithCompletion:(id)a3
{
}

- (void)getOfflineFindingInfoWithCurrentData:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = self;
  if (a3)
  {
    id v7 = a3;
    a3 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
    unint64_t v9 = v8;
  }

  else
  {
    unint64_t v9 = 0xF000000000000000LL;
  }

  *(void *)(swift_allocObject(&unk_10096F658, 24LL, 7LL) + 16) = v5;
  uint64_t v10 = sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  sub_10014FE84(*v10, sub_100662924);
  swift_release();
  sub_1000182F0((uint64_t)a3, v9);
}

- (void)poisonBeaconIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_copy(v11);
  uint64_t v12 = self;
  sub_1001503E4((uint64_t)v10, (uint64_t)v11);
  _Block_release(v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)repairDataStore:(id)a3
{
  BOOL v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_10096F630, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  uint64_t v6 = self;
  sub_1004B5F6C((uint64_t)sub_1003526E8, v5);

  swift_release();
}

- (_TtC12searchpartyd23BeaconManagerTrampoline)init
{
  result = (_TtC12searchpartyd23BeaconManagerTrampoline *)_swift_stdlib_reportUnimplementedInitializer( "searchpartyd.BeaconManagerTrampoline",  36LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0((Class *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation));
  swift_release();
}

- (void)bluetoothConnectionKeysFor:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_10096F4F0, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  type metadata accessor for Transaction(0LL);
  uint64_t v8 = (void *)swift_allocObject(&unk_10096F518, 48LL, 7LL);
  v8[2] = self;
  v8[3] = a3;
  v8[4] = sub_10009C458;
  v8[5] = v7;
  id v9 = a3;
  uint64_t v10 = self;
  id v11 = v9;
  swift_retain();
  static Transaction.asyncTask(name:block:)("bluetoothConnectionKeys(for:completion:)", 40LL, 2LL, &unk_1009B99C8, v8);

  swift_release();
  swift_release();
}

- (void)successfulConnectionForUserIdentifier:(id)a3 beaconIdentifier:(id)a4 primaryIndex:(unint64_t)a5 leMAC:(id)a6 ltkIndex:(unint64_t)a7 ltk:(id)a8 completion:(id)a9
{
  v65 = self;
  id v66 = a8;
  unint64_t v69 = a5;
  unint64_t v70 = a7;
  uint64_t v12 = type metadata accessor for UUID(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  uint64_t v15 = __chkstk_darwin(v12);
  v71 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = __chkstk_darwin(v15);
  v61 = (char *)&v56 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  unsigned int v20 = (char *)&v56 - v19;
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v56 - v21;
  BOOL v23 = _Block_copy(a9);
  v68 = v22;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v24 = v20;
  v67 = v20;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  id v25 = a6;
  id v26 = v66;
  v59 = v65;
  uint64_t v27 = (_TtC12searchpartyd23BeaconManagerTrampoline *)static Data._unconditionallyBridgeFromObjectiveC(_:)(a6);
  unint64_t v64 = v28;
  v65 = v27;

  uint64_t v29 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v26);
  unint64_t v62 = v30;
  uint64_t v63 = v29;

  uint64_t v58 = swift_allocObject(&unk_10096F4A0, 24LL, 7LL);
  *(void *)(v58 + 16) = v23;
  id v66 = (id)type metadata accessor for Transaction(0LL);
  uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  uint64_t v32 = v61;
  uint64_t v57 = v12;
  v31(v61, v22, v12);
  v31(v71, v24, v12);
  uint64_t v33 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v60 = v13;
  uint64_t v34 = (v33 + 24) & ~v33;
  uint64_t v35 = (v14 + v33 + v34) & ~v33;
  unint64_t v36 = (v14 + v35 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v37 = (v36 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v38 = (v37 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v39 = (v38 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v56 = (v39 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v40 = swift_allocObject(&unk_10096F4C8, v56 + 16, v33 | 7);
  uint64_t v41 = v59;
  *(void *)(v40 + 16) = v59;
  uint64_t v42 = v40 + v34;
  uint64_t v43 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 32);
  v44 = v32;
  uint64_t v45 = v57;
  v43(v42, v44, v57);
  v43(v40 + v35, v71, v45);
  *(void *)(v40 + v36) = v69;
  uint64_t v46 = (_TtC12searchpartyd23BeaconManagerTrampoline **)(v40 + v37);
  unint64_t v48 = v64;
  v47 = v65;
  *uint64_t v46 = v65;
  v46[1] = (_TtC12searchpartyd23BeaconManagerTrampoline *)v48;
  *(void *)(v40 + v38) = v70;
  unint64_t v49 = (uint64_t *)(v40 + v39);
  unint64_t v51 = v62;
  uint64_t v50 = v63;
  *unint64_t v49 = v63;
  v49[1] = v51;
  v52 = (void *)(v40 + v56);
  uint64_t v53 = v58;
  void *v52 = sub_10009C9E4;
  v52[1] = v53;
  v54 = v41;
  sub_10001736C((uint64_t)v47, v48);
  sub_10001736C(v50, v51);
  swift_retain();
  static Transaction.asyncTask(name:block:)( "successfulConnection(for:leMAC:ltkIndex:ltk:completion:)",  56LL,  2LL,  &unk_1009B99B0,  v40);
  swift_release();
  swift_release();
  sub_100016F9C(v50, v51);
  sub_100016F9C((uint64_t)v47, v48);

  v55 = *(void (**)(char *, uint64_t))(v60 + 8);
  v55(v67, v45);
  v55(v68, v45);
}

- (void)leechScannerDiscoveredAdvertisementData:(id)a3 rssi:(int)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  uint64_t v10 = swift_allocObject(&unk_10096F450, 24LL, 7LL);
  *(void *)(v10 + 16) = v8;
  type metadata accessor for Transaction(0LL);
  uint64_t v11 = swift_allocObject(&unk_10096F478, 56LL, 7LL);
  *(void *)(v11 + 16) = self;
  *(void *)(v11 + 24) = v9;
  *(_DWORD *)(v11 + 32) = a4;
  *(void *)(v11 + 40) = sub_10009C9E4;
  *(void *)(v11 + 48) = v10;
  uint64_t v12 = self;
  swift_bridgeObjectRetain(v9);
  swift_retain(v10);
  static Transaction.asyncTask(name:block:)( "leechScannerDiscoveredAdvertisementData(rssi:completion:)",  57LL,  2LL,  &unk_1009B9990,  v11);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
  swift_release(v11);
}

- (void)startScanningIncludeServiceCharacterstics:(BOOL)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_10096F428, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = self;
  sub_10065EA1C(a3, (uint64_t)sub_10009C9E4, v7);

  swift_release();
}

- (void)stopScanningWithCompletion:(id)a3
{
}

- (void)tagSeparationStateChanged:(id)a3 beaconUUID:(id)a4 location:(id)a5 completion:(id)a6
{
  uint64_t v11 = type metadata accessor for UUID(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = _Block_copy(a6);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  _Block_copy(v15);
  id v16 = a3;
  id v17 = a5;
  uint64_t v18 = self;
  sub_10074C2B4((uint64_t)v16, (uint64_t)v14, (uint64_t)v18, (uint64_t)v15);
  _Block_release(v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

@end