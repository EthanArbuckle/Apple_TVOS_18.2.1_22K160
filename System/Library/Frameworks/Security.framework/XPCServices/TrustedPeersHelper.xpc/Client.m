@interface Client
- (void)attemptPreapprovedJoinWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 preapprovedKeys:(id)a6 reply:(id)a7;
- (void)createCustodianRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 ckksKeys:(id)a6 uuid:(id)a7 kind:(int)a8 reply:(id)a9;
- (void)departByDistrustingSelfWithSpecificUser:(id)a3 reply:(id)a4;
- (void)distrustPeerIDsWithSpecificUser:(id)a3 peerIDs:(id)a4 reply:(id)a5;
- (void)dropPeerIDsWithSpecificUser:(id)a3 peerIDs:(id)a4 reply:(id)a5;
- (void)dumpWithSpecificUser:(id)a3 reply:(id)a4;
- (void)establishWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 preapprovedKeys:(id)a6 reply:(id)a7;
- (void)fetchAccountSettingsWithSpecificUser:(id)a3 forceFetch:(BOOL)a4 reply:(id)a5;
- (void)fetchAllowedMachineIDsWithSpecificUser:(id)a3 reply:(id)a4;
- (void)fetchCurrentItemWithSpecificUser:(id)a3 items:(id)a4 reply:(id)a5;
- (void)fetchCurrentPolicyWithSpecificUser:(id)a3 modelIDOverride:(id)a4 isInheritedAccount:(BOOL)a5 reply:(id)a6;
- (void)fetchEgoEpochWithSpecificUser:(id)a3 reply:(id)a4;
- (void)fetchEscrowContentsWithSpecificUser:(id)a3 reply:(id)a4;
- (void)fetchPCSIdentityByPublicKeyWithSpecificUser:(id)a3 pcsservices:(id)a4 reply:(id)a5;
- (void)fetchPolicyDocumentsWithSpecificUser:(id)a3 versions:(id)a4 reply:(id)a5;
- (void)fetchRecoverableTLKSharesWithSpecificUser:(id)a3 peerID:(id)a4 reply:(id)a5;
- (void)fetchTrustStateWithSpecificUser:(id)a3 reply:(id)a4;
- (void)fetchTrustedPeerCountWithSpecificUser:(id)a3 reply:(id)a4;
- (void)fetchViableBottlesWithSpecificUser:(id)a3 source:(int64_t)a4 flowID:(id)a5 deviceSessionID:(id)a6 reply:(id)a7;
- (void)fetchViableEscrowRecordsWithSpecificUser:(id)a3 source:(int64_t)a4 reply:(id)a5;
- (void)findCustodianRecoveryKeyWithSpecificUser:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)getSupportAppInfoWithSpecificUser:(id)a3 reply:(id)a4;
- (void)honorIDMSListChangesForSpecificUser:(id)a3 reply:(id)a4;
- (void)isRecoveryKeySet:(id)a3 reply:(id)a4;
- (void)joinWithSpecificUser:(id)a3 voucherData:(id)a4 voucherSig:(id)a5 ckksKeys:(id)a6 tlkShares:(id)a7 preapprovedKeys:(id)a8 flowID:(id)a9 deviceSessionID:(id)a10 canSendMetrics:(BOOL)a11 reply:(id)aBlock;
- (void)localResetWithSpecificUser:(id)a3 reply:(id)a4;
- (void)markTrustedDeviceListFetchFailed:(id)a3 reply:(id)a4;
- (void)octagonContainsDistrustedRecoveryKeysWithSpecificUser:(id)a3 reply:(id)a4;
- (void)octagonPeerIDGivenBottleIDWithSpecificUser:(id)a3 bottleID:(id)a4 reply:(id)a5;
- (void)performATOPRVActionsWithSpecificUser:(id)a3 reply:(id)a4;
- (void)performCKServerUnreadableDataRemovalWithSpecificUser:(id)a3 isGuitarfish:(BOOL)a4 internalAccount:(BOOL)a5 demoAccount:(BOOL)a6 reply:(id)a7;
- (void)pingWithReply:(id)a3;
- (void)preflightPreapprovedJoinWithSpecificUser:(id)a3 preapprovedKeys:(id)a4 reply:(id)a5;
- (void)preflightRecoverOctagonUsingRecoveryKey:(id)a3 recoveryKey:(id)a4 salt:(id)a5 reply:(id)a6;
- (void)preflightVouchWithBottleWithSpecificUser:(id)a3 bottleID:(id)a4 reply:(id)a5;
- (void)preflightVouchWithCustodianRecoveryKeyWithSpecificUser:(id)a3 crk:(id)a4 reply:(id)a5;
- (void)preflightVouchWithRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 reply:(id)a6;
- (void)prepareInheritancePeerWithSpecificUser:(id)a3 epoch:(unint64_t)a4 machineID:(id)a5 bottleSalt:(id)a6 bottleID:(id)a7 modelID:(id)a8 deviceName:(id)a9 serialNumber:(id)a10 osVersion:(id)a11 policyVersion:(id)a12 policySecrets:(id)a13 syncUserControllableViews:(int)a14 secureElementIdentity:(id)a15 signingPrivKeyPersistentRef:(id)a16 encPrivKeyPersistentRef:(id)a17 crk:(id)a18 reply:(id)aBlock;
- (void)prepareWithSpecificUser:(id)a3 epoch:(unint64_t)a4 machineID:(id)a5 bottleSalt:(id)a6 bottleID:(id)a7 modelID:(id)a8 deviceName:(id)a9 serialNumber:(id)a10 osVersion:(id)a11 policyVersion:(id)a12 policySecrets:(id)a13 syncUserControllableViews:(int)a14 secureElementIdentity:(id)a15 setting:(id)a16 signingPrivKeyPersistentRef:(id)a17 encPrivKeyPersistentRef:(id)a18 reply:(id)aBlock;
- (void)recoverTLKSharesForInheritorWithSpecificUser:(id)a3 crk:(id)a4 tlkShares:(id)a5 reply:(id)a6;
- (void)removeCustodianRecoveryKeyWithSpecificUser:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)removeEscrowCacheWithSpecificUser:(id)a3 reply:(id)a4;
- (void)removeRecoveryKey:(id)a3 reply:(id)a4;
- (void)requestHealthCheckWithSpecificUser:(id)a3 requiresEscrowCheck:(BOOL)a4 repair:(BOOL)a5 knownFederations:(id)a6 flowID:(id)a7 deviceSessionID:(id)a8 reply:(id)aBlock;
- (void)resetAccountCDPContentsWithSpecificUser:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 internalAccount:(BOOL)a7 demoAccount:(BOOL)a8 reply:(id)aBlock;
- (void)resetWithSpecificUser:(id)a3 resetReason:(int64_t)a4 idmsTargetContext:(id)a5 idmsCuttlefishPassword:(id)a6 notifyIdMS:(BOOL)a7 internalAccount:(BOOL)a8 demoAccount:(BOOL)a9 isGuitarfish:(BOOL)a10 accountType:(int64_t)a11 reply:(id)a12;
- (void)setAllowedMachineIDsWithSpecificUser:(id)a3 allowedMachineIDs:(id)a4 userInitiatedRemovals:(id)a5 evictedRemovals:(id)a6 unknownReasonRemovals:(id)a7 honorIDMSListChanges:(BOOL)a8 version:(id)a9 flowID:(id)a10 deviceSessionID:(id)a11 canSendMetrics:(BOOL)a12 altDSID:(id)a13 trustedDeviceHash:(id)a14 deletedDeviceHash:(id)a15 trustedDevicesUpdateTimestamp:(id)a16 reply:(id)aBlock;
- (void)setPreapprovedKeysWithSpecificUser:(id)a3 preapprovedKeys:(id)a4 reply:(id)a5;
- (void)setRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 ckksKeys:(id)a6 reply:(id)a7;
- (void)testSemaphoreWithSpecificUser:(id)a3 arg:(id)a4 reply:(id)a5;
- (void)trustStatusWithSpecificUser:(id)a3 reply:(id)a4;
- (void)trustedDeviceNamesByPeerIDWithSpecificUser:(id)a3 reply:(id)a4;
- (void)updateTLKsWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 reply:(id)a6;
- (void)updateWithSpecificUser:(id)a3 forceRefetch:(BOOL)a4 deviceName:(id)a5 serialNumber:(id)a6 osVersion:(id)a7 policyVersion:(id)a8 policySecrets:(id)a9 syncUserControllableViews:(id)a10 secureElementIdentity:(id)a11 walrusSetting:(id)a12 webAccess:(id)a13 reply:(id)aBlock;
- (void)vouchWithBottleWithSpecificUser:(id)a3 bottleID:(id)a4 entropy:(id)a5 bottleSalt:(id)a6 tlkShares:(id)a7 reply:(id)a8;
- (void)vouchWithCustodianRecoveryKeyWithSpecificUser:(id)a3 crk:(id)a4 tlkShares:(id)a5 reply:(id)a6;
- (void)vouchWithRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 tlkShares:(id)a6 reply:(id)a7;
- (void)vouchWithRerollWithSpecificUser:(id)a3 oldPeerID:(id)a4 tlkShares:(id)a5 reply:(id)a6;
- (void)vouchWithSpecificUser:(id)a3 peerID:(id)a4 permanentInfo:(id)a5 permanentInfoSig:(id)a6 stableInfo:(id)a7 stableInfoSig:(id)a8 ckksKeys:(id)a9 flowID:(id)a10 deviceSessionID:(id)a11 canSendMetrics:(BOOL)a12 reply:(id)aBlock;
@end

@implementation Client

- (void)pingWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  v5 = (void (*)(void *))v4[2];
  swift_retain(self);
  v5(v4);
  _Block_release(v4);
  swift_release(self);
}

- (void)dumpWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)honorIDMSListChangesForSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)octagonPeerIDGivenBottleIDWithSpecificUser:(id)a3 bottleID:(id)a4 reply:(id)a5
{
}

- (void)trustedDeviceNamesByPeerIDWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)trustStatusWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)fetchTrustStateWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)resetWithSpecificUser:(id)a3 resetReason:(int64_t)a4 idmsTargetContext:(id)a5 idmsCuttlefishPassword:(id)a6 notifyIdMS:(BOOL)a7 internalAccount:(BOOL)a8 demoAccount:(BOOL)a9 isGuitarfish:(BOOL)a10 accountType:(int64_t)a11 reply:(id)a12
{
  BOOL v41 = a7;
  BOOL v42 = a8;
  v16 = _Block_copy(a12);
  if (!a5)
  {
    uint64_t v17 = 0LL;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v19 = 0LL;
    goto LABEL_6;
  }

  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  a5 = v18;
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  a6 = v20;
LABEL_6:
  _Block_copy(v16);
  id v21 = a3;
  swift_retain(self);
  sub_10017F5D8( a3,  a4,  v17,  (uint64_t)a5,  v19,  (uint64_t)a6,  v41,  v42,  a9,  a10,  a11,  (uint64_t)self,  (void (**)(const void *, void *))v16);
  _Block_release(v16);
  _Block_release(v16);

  swift_release(self);
  swift_bridgeObjectRelease( (_TtC18TrustedPeersHelper6Client *)a6,  v22,  v23,  v24,  v25,  v26,  v27,  v28,  v36,  v37,  v38,  v39);
  swift_bridgeObjectRelease((_TtC18TrustedPeersHelper6Client *)a5, v29, v30, v31, v32, v33, v34, v35, a9, a10, a11, a12);
}

- (void)performCKServerUnreadableDataRemovalWithSpecificUser:(id)a3 isGuitarfish:(BOOL)a4 internalAccount:(BOOL)a5 demoAccount:(BOOL)a6 reply:(id)a7
{
  unsigned int v7 = a6;
  unsigned int v8 = a5;
  BOOL v9 = a4;
  v12 = _Block_copy(a7);
  _Block_copy(v12);
  id v13 = a3;
  swift_retain(self);
  sub_10017FBDC(a3, v9, v8, v7, (uint64_t)self, (void (**)(const void *, void *))v12);
  _Block_release(v12);
  _Block_release(v12);

  swift_release(self);
}

- (void)localResetWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)setAllowedMachineIDsWithSpecificUser:(id)a3 allowedMachineIDs:(id)a4 userInitiatedRemovals:(id)a5 evictedRemovals:(id)a6 unknownReasonRemovals:(id)a7 honorIDMSListChanges:(BOOL)a8 version:(id)a9 flowID:(id)a10 deviceSessionID:(id)a11 canSendMetrics:(BOOL)a12 altDSID:(id)a13 trustedDeviceHash:(id)a14 deletedDeviceHash:(id)a15 trustedDevicesUpdateTimestamp:(id)a16 reply:(id)aBlock
{
  BOOL v121 = a8;
  v112 = _Block_copy(aBlock);
  v120 = (_TtC18TrustedPeersHelper6Client *)static Set._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for String,  &protocol witness table for String);
  if (a5)
  {
    v123 = (_TtC18TrustedPeersHelper6Client *)static Set._unconditionallyBridgeFromObjectiveC(_:)( a5,  &type metadata for String,  &protocol witness table for String);
    if (a6) {
      goto LABEL_3;
    }
  }

  else
  {
    v123 = 0LL;
    if (a6)
    {
LABEL_3:
      v119 = (_TtC18TrustedPeersHelper6Client *)static Set._unconditionallyBridgeFromObjectiveC(_:)( a6,  &type metadata for String,  &protocol witness table for String);
      if (a7) {
        goto LABEL_4;
      }
LABEL_8:
      v118 = 0LL;
      if (a9) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }

  v119 = 0LL;
  if (!a7) {
    goto LABEL_8;
  }
LABEL_4:
  v118 = (_TtC18TrustedPeersHelper6Client *)static Set._unconditionallyBridgeFromObjectiveC(_:)( a7,  &type metadata for String,  &protocol witness table for String);
  if (a9)
  {
LABEL_5:
    uint64_t v116 = static String._unconditionallyBridgeFromObjectiveC(_:)(a9);
    v117 = v22;
    goto LABEL_10;
  }

- (void)markTrustedDeviceListFetchFailed:(id)a3 reply:(id)a4
{
}

- (void)fetchAllowedMachineIDsWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)fetchEgoEpochWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)prepareWithSpecificUser:(id)a3 epoch:(unint64_t)a4 machineID:(id)a5 bottleSalt:(id)a6 bottleID:(id)a7 modelID:(id)a8 deviceName:(id)a9 serialNumber:(id)a10 osVersion:(id)a11 policyVersion:(id)a12 policySecrets:(id)a13 syncUserControllableViews:(int)a14 secureElementIdentity:(id)a15 setting:(id)a16 signingPrivKeyPersistentRef:(id)a17 encPrivKeyPersistentRef:(id)a18 reply:(id)aBlock
{
  SEL v97 = _Block_copy(aBlock);
  id v105 = (_TtC18TrustedPeersHelper6Client *)static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  id v108 = v23;
  SEL v104 = (_TtC18TrustedPeersHelper6Client *)static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  id v107 = v24;
  BOOL v103 = (_TtC18TrustedPeersHelper6Client *)static String._unconditionallyBridgeFromObjectiveC(_:)(a7);
  int64_t v106 = v25;
  BOOL v102 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(a8);
  id v114 = v26;
  if (a9)
  {
    uint64_t v101 = static String._unconditionallyBridgeFromObjectiveC(_:)(a9);
    v112 = v27;
    if (a10)
    {
LABEL_3:
      uint64_t v100 = static String._unconditionallyBridgeFromObjectiveC(_:)(a10);
      uint64_t v111 = v28;
      goto LABEL_6;
    }
  }

  else
  {
    uint64_t v101 = 0LL;
    v112 = 0LL;
    if (a10) {
      goto LABEL_3;
    }
  }

  uint64_t v100 = 0LL;
  uint64_t v111 = 0LL;
LABEL_6:
  uint64_t v98 = static String._unconditionallyBridgeFromObjectiveC(_:)(a11);
  BOOL v110 = v29;
  if (a13) {
    uint64_t v113 = (_TtC18TrustedPeersHelper6Client *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a13,  &type metadata for String,  &type metadata for Data,  &protocol witness table for String);
  }
  else {
    uint64_t v113 = 0LL;
  }
  swift_retain(self);
  id v30 = a18;
  id v31 = a17;
  id v109 = a16;
  id v32 = a15;
  id v33 = a12;
  BOOL v34 = (_TtC18TrustedPeersHelper6Client *)a3;
  if (!v31)
  {
    uint64_t v35 = 0LL;
    unint64_t v37 = 0xF000000000000000LL;
    if (v30) {
      goto LABEL_11;
    }
LABEL_13:
    uint64_t v38 = 0LL;
    unint64_t v40 = 0xF000000000000000LL;
    goto LABEL_14;
  }

  uint64_t v35 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a17);
  unint64_t v37 = v36;

  if (!v30) {
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v38 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a18);
  unint64_t v40 = v39;

LABEL_14:
  _Block_copy(v97);
  sub_1001823D4( v34,  v105,  v108,  v104,  v107,  v103,  v106,  v102,  v114,  v101,  v112,  v100,  v111,  v98,  v110,  v33,  v113,  a14,  v32,  v109,  v35,  v37,  v38,  v40,  (uint64_t)self,  v97);
  _Block_release(v97);
  _Block_release(v97);
  sub_10003C1D0(v38, v40);
  sub_10003C1D0(v35, v37);

  swift_release(self);
  swift_bridgeObjectRelease(v108, v41, v42, v43, v44, v45, v46, v47);
  swift_bridgeObjectRelease(v107, v48, v49, v50, v51, v52, v53, v54);
  swift_bridgeObjectRelease(v106, v55, v56, v57, v58, v59, v60, v61);
  swift_bridgeObjectRelease(v114, v62, v63, v64, v65, v66, v67, v68);
  swift_bridgeObjectRelease(v110, v69, v70, v71, v72, v73, v74, v75);
  swift_bridgeObjectRelease(v113, v76, v77, v78, v79, v80, v81, v82);
  swift_bridgeObjectRelease(v111, v83, v84, v85, v86, v87, v88, v89);
  swift_bridgeObjectRelease(v112, v90, v91, v92, v93, v94, v95, v96);
}

- (void)prepareInheritancePeerWithSpecificUser:(id)a3 epoch:(unint64_t)a4 machineID:(id)a5 bottleSalt:(id)a6 bottleID:(id)a7 modelID:(id)a8 deviceName:(id)a9 serialNumber:(id)a10 osVersion:(id)a11 policyVersion:(id)a12 policySecrets:(id)a13 syncUserControllableViews:(int)a14 secureElementIdentity:(id)a15 signingPrivKeyPersistentRef:(id)a16 encPrivKeyPersistentRef:(id)a17 crk:(id)a18 reply:(id)aBlock
{
  id v21 = (_TtC18TrustedPeersHelper6Client *)a13;
  SEL v22 = _Block_copy(aBlock);
  uint64_t v91 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  id v94 = v23;
  uint64_t v90 = static String._unconditionallyBridgeFromObjectiveC(_:)(a8);
  BOOL v82 = v24;
  if (a9)
  {
    uint64_t v89 = static String._unconditionallyBridgeFromObjectiveC(_:)(a9);
    id v93 = v25;
    id v26 = a17;
    if (a10)
    {
LABEL_3:
      uint64_t v88 = static String._unconditionallyBridgeFromObjectiveC(_:)(a10);
      int64_t v92 = v27;
      goto LABEL_6;
    }
  }

  else
  {
    uint64_t v89 = 0LL;
    id v93 = 0LL;
    id v26 = a17;
    if (a10) {
      goto LABEL_3;
    }
  }

  uint64_t v88 = 0LL;
  int64_t v92 = 0LL;
LABEL_6:
  uint64_t v87 = static String._unconditionallyBridgeFromObjectiveC(_:)(a11);
  SEL v29 = v28;
  if (a13) {
    id v21 = (_TtC18TrustedPeersHelper6Client *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a13,  &type metadata for String,  &type metadata for Data,  &protocol witness table for String);
  }
  id v30 = a18;
  swift_retain(self);
  id v31 = v26;
  id v32 = a16;
  id v33 = a15;
  id v34 = a12;
  id v35 = a3;
  if (!v32)
  {
    unint64_t v84 = 0xF000000000000000LL;
    uint64_t v86 = 0LL;
    if (v31) {
      goto LABEL_10;
    }
LABEL_12:
    uint64_t v83 = 0LL;
    unint64_t v81 = 0xF000000000000000LL;
    goto LABEL_13;
  }

  uint64_t v36 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a16);
  unint64_t v84 = v37;
  uint64_t v86 = v36;

  if (!v31) {
    goto LABEL_12;
  }
LABEL_10:
  uint64_t v83 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v26);
  unint64_t v81 = v38;

LABEL_13:
  _Block_copy(v22);
  sub_100182A60( v35,  v91,  (uint64_t)v94,  v90,  (uint64_t)v82,  v89,  (uint64_t)v93,  v88,  v92,  v87,  v29,  v34,  (uint64_t)v21,  a14,  v33,  v30,  (uint64_t)self,  v22);
  _Block_release(v22);
  _Block_release(v22);
  sub_10003C1D0(v83, v81);
  sub_10003C1D0(v86, v84);

  swift_release(self);
  swift_bridgeObjectRelease(v94, v39, v40, v41, v42, v43, v44, v45);
  swift_bridgeObjectRelease(v82, v46, v47, v48, v49, v50, v51, v52);
  swift_bridgeObjectRelease(v29, v53, v54, v55, v56, v57, v58, v59);
  swift_bridgeObjectRelease(v21, v60, v61, v62, v63, v64, v65, v66);
  swift_bridgeObjectRelease(v92, v67, v68, v69, v70, v71, v72, v73);
  swift_bridgeObjectRelease(v93, v74, v75, v76, v77, v78, v79, v80);
}

- (void)establishWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 preapprovedKeys:(id)a6 reply:(id)a7
{
}

- (void)vouchWithSpecificUser:(id)a3 peerID:(id)a4 permanentInfo:(id)a5 permanentInfoSig:(id)a6 stableInfo:(id)a7 stableInfoSig:(id)a8 ckksKeys:(id)a9 flowID:(id)a10 deviceSessionID:(id)a11 canSendMetrics:(BOOL)a12 reply:(id)aBlock
{
  BOOL v80 = _Block_copy(aBlock);
  uint64_t v78 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  unint64_t v81 = v20;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a9;
  swift_retain(self);
  id v79 = a3;
  id v26 = a10;
  id v27 = a11;
  uint64_t v28 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a5);
  unint64_t v76 = v29;
  uint64_t v77 = v28;

  uint64_t v30 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v22);
  unint64_t v74 = v31;
  uint64_t v75 = v30;

  uint64_t v73 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v23);
  id v33 = v32;

  uint64_t v34 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v24);
  unint64_t v36 = v35;

  uint64_t v37 = sub_100007620(0LL, &qword_100256FC0, off_10022CE98);
  unint64_t v38 = (_TtC18TrustedPeersHelper6Client *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v25, v37);

  if (!v26)
  {
    uint64_t v39 = 0LL;
    int64_t v41 = 0LL;
    if (v27) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v42 = 0LL;
    BOOL v44 = 0LL;
    goto LABEL_6;
  }

  uint64_t v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
  int64_t v41 = v40;

  if (!v27) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(a11);
  BOOL v44 = v43;

LABEL_6:
  _Block_copy(v80);
  sub_100183974( v79,  v78,  (uint64_t)v81,  v77,  v76,  v75,  v74,  v73,  v33,  v34,  v36,  (uint64_t)v38,  v39,  (uint64_t)v41,  v42,  (uint64_t)v44,  a12,  (uint64_t)self,  v80);
  _Block_release(v80);
  _Block_release(v80);
  swift_bridgeObjectRelease(v38, v45, v46, v47, v48, v49, v50, v51);
  swift_bridgeObjectRelease(v44, v52, v53, v54, v55, v56, v57, v58);
  swift_bridgeObjectRelease(v41, v59, v60, v61, v62, v63, v64, v65);
  sub_10000852C(v34, v36);
  sub_10000852C(v73, (unint64_t)v33);
  sub_10000852C(v75, v74);
  sub_10000852C(v77, v76);

  swift_release(self);
  swift_bridgeObjectRelease(v81, v66, v67, v68, v69, v70, v71, v72);
}

- (void)preflightVouchWithBottleWithSpecificUser:(id)a3 bottleID:(id)a4 reply:(id)a5
{
}

- (void)vouchWithBottleWithSpecificUser:(id)a3 bottleID:(id)a4 entropy:(id)a5 bottleSalt:(id)a6 tlkShares:(id)a7 reply:(id)a8
{
  v14 = _Block_copy(a8);
  uint64_t v49 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v16 = v15;
  id v50 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  swift_retain(self);
  uint64_t v20 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a5);
  unint64_t v22 = v21;

  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
  id v25 = v24;

  uint64_t v26 = sub_100007620(0LL, &qword_100257410, &off_10022CEA8);
  id v27 = (_TtC18TrustedPeersHelper6Client *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v19, v26);

  _Block_copy(v14);
  sub_100184758(a3, v49, (uint64_t)v16, v20, v22, v23, (uint64_t)v25, (uint64_t)v27, (uint64_t)self, v14);
  _Block_release(v14);
  _Block_release(v14);
  swift_bridgeObjectRelease(v25, v28, v29, v30, v31, v32, v33, v34);
  swift_bridgeObjectRelease(v27, v35, v36, v37, v38, v39, v40, v41);
  sub_10000852C(v20, v22);

  swift_release(self);
  swift_bridgeObjectRelease(v16, v42, v43, v44, v45, v46, v47, v48);
}

- (void)preflightVouchWithRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 reply:(id)a6
{
}

- (void)preflightVouchWithCustodianRecoveryKeyWithSpecificUser:(id)a3 crk:(id)a4 reply:(id)a5
{
  unsigned int v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  swift_retain(self);
  sub_1001855F4(a3, v10, (uint64_t)self, v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release(self);
}

- (void)vouchWithRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 tlkShares:(id)a6 reply:(id)a7
{
}

- (void)recoverTLKSharesForInheritorWithSpecificUser:(id)a3 crk:(id)a4 tlkShares:(id)a5 reply:(id)a6
{
}

- (void)vouchWithCustodianRecoveryKeyWithSpecificUser:(id)a3 crk:(id)a4 tlkShares:(id)a5 reply:(id)a6
{
}

- (void)vouchWithRerollWithSpecificUser:(id)a3 oldPeerID:(id)a4 tlkShares:(id)a5 reply:(id)a6
{
  id v10 = _Block_copy(a6);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  id v13 = v12;
  uint64_t v14 = sub_100007620(0LL, &qword_100257410, &off_10022CEA8);
  v15 = (_TtC18TrustedPeersHelper6Client *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, v14);
  _Block_copy(v10);
  id v16 = a3;
  swift_retain(self);
  sub_1001872EC(a3, v11, (uint64_t)v13, (uint64_t)v15, self, v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_release(self);
  swift_bridgeObjectRelease(v13, v17, v18, v19, v20, v21, v22, v23);
  swift_bridgeObjectRelease(v15, v24, v25, v26, v27, v28, v29, v30);
}

- (void)joinWithSpecificUser:(id)a3 voucherData:(id)a4 voucherSig:(id)a5 ckksKeys:(id)a6 tlkShares:(id)a7 preapprovedKeys:(id)a8 flowID:(id)a9 deviceSessionID:(id)a10 canSendMetrics:(BOOL)a11 reply:(id)aBlock
{
  uint64_t v88 = _Block_copy(aBlock);
  id v82 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  swift_retain(self);
  uint64_t v87 = (uint8_t *)a3;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  uint64_t v24 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  unint64_t v84 = v25;
  uint64_t v86 = v24;

  uint64_t v26 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v18);
  unint64_t v81 = v27;
  uint64_t v83 = v26;

  uint64_t v28 = sub_100007620(0LL, &qword_100256FC0, off_10022CE98);
  BOOL v80 = (_TtC18TrustedPeersHelper6Client *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v19, v28);

  uint64_t v29 = sub_100007620(0LL, &qword_100257410, &off_10022CEA8);
  id v79 = (_TtC18TrustedPeersHelper6Client *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v20, v29);

  if (v21)
  {
    uint64_t v78 = (_TtC18TrustedPeersHelper6Client *)static Array._unconditionallyBridgeFromObjectiveC(_:)( v21,  &type metadata for Data);

    if (v22) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v30 = 0LL;
    id v32 = 0LL;
    if (v23) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v33 = 0LL;
    SEL v35 = 0LL;
    goto LABEL_8;
  }

  uint64_t v78 = 0LL;
  if (!v22) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(a9);
  id v32 = v31;

  if (!v23) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(a10);
  SEL v35 = v34;

LABEL_8:
  _Block_copy(v88);
  sub_100187A64( v87,  v86,  v84,  v83,  v81,  (uint64_t)v80,  (uint64_t)v79,  (uint64_t)v78,  v30,  (uint64_t)v32,  v33,  (uint64_t)v35,  a11,  (uint64_t)self,  v88);
  _Block_release(v88);
  _Block_release(v88);
  swift_bridgeObjectRelease(v80, v36, v37, v38, v39, v40, v41, v42);
  swift_bridgeObjectRelease(v79, v43, v44, v45, v46, v47, v48, v49);
  swift_bridgeObjectRelease(v35, v50, v51, v52, v53, v54, v55, v56);
  swift_bridgeObjectRelease(v32, v57, v58, v59, v60, v61, v62, v63);
  swift_bridgeObjectRelease(v78, v64, v65, v66, v67, v68, v69, v70);
  sub_10000852C(v83, v81);
  sub_10000852C(v86, v84);

  swift_release(self, v71, v72, v73, v74, v75, v76, v77, a9, a10, a11, aBlock);
}

- (void)preflightPreapprovedJoinWithSpecificUser:(id)a3 preapprovedKeys:(id)a4 reply:(id)a5
{
  unsigned int v8 = _Block_copy(a5);
  if (a4) {
    a4 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for Data);
  }
  _Block_copy(v8);
  id v9 = a3;
  swift_retain(self);
  sub_100188090(a3, (uint64_t)a4, (uint64_t)self, (void (**)(const void *, void, void *))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release(self, v10, v11, v12, v13, v14, v15, v16);
  swift_bridgeObjectRelease((_TtC18TrustedPeersHelper6Client *)a4, v17, v18, v19, v20, v21, v22, v23);
}

- (void)attemptPreapprovedJoinWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 preapprovedKeys:(id)a6 reply:(id)a7
{
}

- (void)updateWithSpecificUser:(id)a3 forceRefetch:(BOOL)a4 deviceName:(id)a5 serialNumber:(id)a6 osVersion:(id)a7 policyVersion:(id)a8 policySecrets:(id)a9 syncUserControllableViews:(id)a10 secureElementIdentity:(id)a11 walrusSetting:(id)a12 webAccess:(id)a13 reply:(id)aBlock
{
  BOOL v69 = a4;
  id v20 = (_TtC18TrustedPeersHelper6Client *)a9;
  id v21 = _Block_copy(aBlock);
  if (a5)
  {
    uint64_t v67 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    SEL v71 = v22;
    if (a6) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v67 = 0LL;
    SEL v71 = 0LL;
    if (a6)
    {
LABEL_3:
      uint64_t v66 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
      BOOL v70 = v23;
      if (a7) {
        goto LABEL_4;
      }
LABEL_9:
      id v68 = 0LL;
      if (!a9) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }

  uint64_t v66 = 0LL;
  BOOL v70 = 0LL;
  if (!a7) {
    goto LABEL_9;
  }
LABEL_4:
  a7 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a7);
  id v68 = v24;
  if (a9) {
LABEL_5:
  }
    id v20 = (_TtC18TrustedPeersHelper6Client *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a9,  &type metadata for String,  &type metadata for Data,  &protocol witness table for String);
LABEL_6:
  id v25 = a3;
  id v26 = a8;
  id v27 = a10;
  id v28 = a11;
  id v29 = a12;
  id v30 = a13;
  swift_retain(self);
  _Block_copy(v21);
  sub_100188DB0( v25,  v69,  v67,  (uint64_t)v71,  v66,  (uint64_t)v70,  a7,  (uint64_t)v68,  v26,  (uint64_t)v20,  v27,  (uint64_t)v28,  (uint64_t)v29,  (uint64_t)v30,  (uint64_t)self,  v21);
  _Block_release(v21);
  _Block_release(v21);

  swift_release(self, v31, v32, v33, v34, v35, v36, v37);
  swift_bridgeObjectRelease(v20, v38, v39, v40, v41, v42, v43, v44);
  swift_bridgeObjectRelease(v68, v45, v46, v47, v48, v49, v50, v51);
  swift_bridgeObjectRelease(v70, v52, v53, v54, v55, v56, v57, v58);
  swift_bridgeObjectRelease(v71, v59, v60, v61, v62, v63, v64, v65);
}

- (void)setPreapprovedKeysWithSpecificUser:(id)a3 preapprovedKeys:(id)a4 reply:(id)a5
{
  unsigned int v8 = _Block_copy(a5);
  id v9 = (_TtC18TrustedPeersHelper6Client *)static Array._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for Data);
  _Block_copy(v8);
  id v10 = a3;
  swift_retain(self);
  sub_1001896B0(a3, (uint64_t)v9, (uint64_t)self, v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release(self, v11, v12, v13, v14, v15, v16, v17);
  swift_bridgeObjectRelease(v9, v18, v19, v20, v21, v22, v23, v24);
}

- (void)updateTLKsWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 reply:(id)a6
{
  id v10 = _Block_copy(a6);
  uint64_t v11 = sub_100007620(0LL, &qword_100256FC0, off_10022CE98);
  id v12 = (_TtC18TrustedPeersHelper6Client *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v11);
  uint64_t v13 = sub_100007620(0LL, &qword_100257410, &off_10022CEA8);
  id v14 = (_TtC18TrustedPeersHelper6Client *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, v13);
  _Block_copy(v10);
  id v15 = a3;
  swift_retain(self);
  sub_100189E00(a3, v12, (uint64_t)v14, (uint64_t)self, (void (**)(const void *, void, void *))v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_release(self, v16, v17, v18, v19, v20, v21, v22);
  swift_bridgeObjectRelease(v12, v23, v24, v25, v26, v27, v28, v29);
  swift_bridgeObjectRelease(v14, v30, v31, v32, v33, v34, v35, v36);
}

- (void)departByDistrustingSelfWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)distrustPeerIDsWithSpecificUser:(id)a3 peerIDs:(id)a4 reply:(id)a5
{
}

- (void)dropPeerIDsWithSpecificUser:(id)a3 peerIDs:(id)a4 reply:(id)a5
{
}

- (void)fetchViableBottlesWithSpecificUser:(id)a3 source:(int64_t)a4 flowID:(id)a5 deviceSessionID:(id)a6 reply:(id)a7
{
  id v12 = _Block_copy(a7);
  if (!a5)
  {
    uint64_t v13 = 0LL;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v15 = 0LL;
    goto LABEL_6;
  }

  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  a5 = v14;
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  a6 = v16;
LABEL_6:
  _Block_copy(v12);
  id v17 = a3;
  swift_retain(self);
  sub_10018BABC(a3, a4, v13, (uint64_t)a5, v15, (uint64_t)a6, (uint64_t)self, v12);
  _Block_release(v12);
  _Block_release(v12);

  swift_release(self, v18, v19, v20, v21, v22, v23, v24);
  swift_bridgeObjectRelease((_TtC18TrustedPeersHelper6Client *)a6, v25, v26, v27, v28, v29, v30, v31);
  swift_bridgeObjectRelease((_TtC18TrustedPeersHelper6Client *)a5, v32, v33, v34, v35, v36, v37, v38);
}

- (void)fetchViableEscrowRecordsWithSpecificUser:(id)a3 source:(int64_t)a4 reply:(id)a5
{
  unsigned int v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  swift_retain(self);
  sub_10018C128(a3, a4, (uint64_t)self, (void (**)(const void *, void, void *))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release(self, v10, v11, v12, v13, v14, v15, v16);
}

- (void)fetchEscrowContentsWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)fetchCurrentPolicyWithSpecificUser:(id)a3 modelIDOverride:(id)a4 isInheritedAccount:(BOOL)a5 reply:(id)a6
{
  BOOL v6 = a5;
  SEL v10 = _Block_copy(a6);
  if (a4)
  {
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v12;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  _Block_copy(v10);
  id v13 = a3;
  swift_retain(self);
  sub_10018CB5C(a3, v11, (uint64_t)a4, v6, (uint64_t)self, v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_release(self, v14, v15, v16, v17, v18, v19, v20);
  swift_bridgeObjectRelease((_TtC18TrustedPeersHelper6Client *)a4, v21, v22, v23, v24, v25, v26, v27);
}

- (void)fetchPolicyDocumentsWithSpecificUser:(id)a3 versions:(id)a4 reply:(id)a5
{
  unsigned int v8 = _Block_copy(a5);
  uint64_t v9 = sub_100007620(0LL, (unint64_t *)&qword_100256DB0, &OBJC_CLASS___TPPolicyVersion_ptr);
  unint64_t v10 = sub_10004CE64();
  uint64_t v11 = (_TtC18TrustedPeersHelper6Client *)static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v9, v10);
  _Block_copy(v8);
  id v12 = a3;
  swift_retain(self);
  sub_10018D2DC(a3, v11, (uint64_t)self, (void (**)(const void *, void, void *))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release(self, v13, v14, v15, v16, v17, v18, v19);
  swift_bridgeObjectRelease(v11, v20, v21, v22, v23, v24, v25, v26);
}

- (void)fetchRecoverableTLKSharesWithSpecificUser:(id)a3 peerID:(id)a4 reply:(id)a5
{
  unsigned int v8 = _Block_copy(a5);
  if (a4)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v10;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  _Block_copy(v8);
  id v11 = a3;
  swift_retain(self);
  sub_10018D998((char *)a3, v9, (uint64_t)a4, (uint64_t)self, (void (**)(const void *, void, void *))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release(self, v12, v13, v14, v15, v16, v17, v18);
  swift_bridgeObjectRelease((_TtC18TrustedPeersHelper6Client *)a4, v19, v20, v21, v22, v23, v24, v25);
}

- (void)setRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 ckksKeys:(id)a6 reply:(id)a7
{
}

- (void)createCustodianRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 ckksKeys:(id)a6 uuid:(id)a7 kind:(int)a8 reply:(id)a9
{
  int v58 = a8;
  uint64_t v15 = type metadata accessor for UUID(0LL);
  uint64_t v59 = *(void *)(v15 - 8);
  uint64_t v60 = v15;
  __chkstk_darwin(v15, v16);
  id v18 = (char *)&v57 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  SEL v19 = _Block_copy(a9);
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  id v22 = v21;
  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  BOOL v25 = v24;
  uint64_t v26 = sub_100007620(0LL, &qword_100256FC0, off_10022CE98);
  BOOL v27 = (_TtC18TrustedPeersHelper6Client *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a6, v26);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a7);
  _Block_copy(v19);
  id v28 = a3;
  swift_retain(self);
  sub_10018E84C(a3, v20, (uint64_t)v22, v23, (uint64_t)v25, (uint64_t)v27, (uint64_t)v18, v58, (uint64_t)self, v19);
  _Block_release(v19);
  _Block_release(v19);

  swift_release(self, v29, v30, v31, v32, v33, v34, v35);
  swift_bridgeObjectRelease(v22, v36, v37, v38, v39, v40, v41, v42);
  swift_bridgeObjectRelease(v25, v43, v44, v45, v46, v47, v48, v49);
  swift_bridgeObjectRelease(v27, v50, v51, v52, v53, v54, v55, v56);
  (*(void (**)(char *, uint64_t))(v59 + 8))(v18, v60);
}

- (void)removeCustodianRecoveryKeyWithSpecificUser:(id)a3 uuid:(id)a4 reply:(id)a5
{
}

- (void)findCustodianRecoveryKeyWithSpecificUser:(id)a3 uuid:(id)a4 reply:(id)a5
{
}

- (void)requestHealthCheckWithSpecificUser:(id)a3 requiresEscrowCheck:(BOOL)a4 repair:(BOOL)a5 knownFederations:(id)a6 flowID:(id)a7 deviceSessionID:(id)a8 reply:(id)aBlock
{
  BOOL v50 = a5;
  BOOL v12 = a4;
  uint64_t v15 = _Block_copy(aBlock);
  uint64_t v16 = (_TtC18TrustedPeersHelper6Client *)static Array._unconditionallyBridgeFromObjectiveC(_:)( a6,  &type metadata for String);
  if (!a7)
  {
    uint64_t v17 = 0LL;
    if (a8) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v19 = 0LL;
    goto LABEL_6;
  }

  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a7);
  a7 = v18;
  if (!a8) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a8);
  a8 = v20;
LABEL_6:
  _Block_copy(v15);
  id v21 = a3;
  swift_retain(self);
  sub_10018FE04( a3,  v12,  v50,  v16,  v17,  (uint64_t)a7,  v19,  (uint64_t)a8,  (uint64_t)self,  (void (**)(const void *, void, void *))v15);
  _Block_release(v15);
  _Block_release(v15);

  swift_release(self, v22, v23, v24, v25, v26, v27, v28);
  swift_bridgeObjectRelease(v16, v29, v30, v31, v32, v33, v34, v35);
  swift_bridgeObjectRelease((_TtC18TrustedPeersHelper6Client *)a8, v36, v37, v38, v39, v40, v41, v42);
  swift_bridgeObjectRelease((_TtC18TrustedPeersHelper6Client *)a7, v43, v44, v45, v46, v47, v48, v49);
}

- (void)getSupportAppInfoWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)removeEscrowCacheWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)resetAccountCDPContentsWithSpecificUser:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 internalAccount:(BOOL)a7 demoAccount:(BOOL)a8 reply:(id)aBlock
{
  BOOL v42 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  uint64_t v15 = _Block_copy(aBlock);
  if (!a4)
  {
    uint64_t v16 = 0LL;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    id v18 = 0LL;
    goto LABEL_6;
  }

  uint64_t v16 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  a4 = v17;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  id v18 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  a5 = v19;
LABEL_6:
  _Block_copy(v15);
  id v20 = a3;
  swift_retain(self);
  sub_1001911F4(a3, v16, a4, v18, a5, v10, v9, v42, (uint64_t)self, (void (**)(const void *, void *))v15);
  _Block_release(v15);
  _Block_release(v15);

  swift_release(self, v21, v22, v23, v24, v25, v26, v27);
  swift_bridgeObjectRelease((_TtC18TrustedPeersHelper6Client *)a5, v28, v29, v30, v31, v32, v33, v34);
  swift_bridgeObjectRelease((_TtC18TrustedPeersHelper6Client *)a4, v35, v36, v37, v38, v39, v40, v41);
}

- (void)fetchAccountSettingsWithSpecificUser:(id)a3 forceFetch:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  unsigned int v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  swift_retain(self);
  sub_100191980(a3, v5, (uint64_t)self, v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release(self, v10, v11, v12, v13, v14, v15, v16);
}

- (void)isRecoveryKeySet:(id)a3 reply:(id)a4
{
}

- (void)removeRecoveryKey:(id)a3 reply:(id)a4
{
}

- (void)performATOPRVActionsWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)testSemaphoreWithSpecificUser:(id)a3 arg:(id)a4 reply:(id)a5
{
}

- (void)preflightRecoverOctagonUsingRecoveryKey:(id)a3 recoveryKey:(id)a4 salt:(id)a5 reply:(id)a6
{
}

- (void)fetchTrustedPeerCountWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)octagonContainsDistrustedRecoveryKeysWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)fetchCurrentItemWithSpecificUser:(id)a3 items:(id)a4 reply:(id)a5
{
}

- (void)fetchPCSIdentityByPublicKeyWithSpecificUser:(id)a3 pcsservices:(id)a4 reply:(id)a5
{
}

@end