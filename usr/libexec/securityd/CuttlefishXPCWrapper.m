@interface CuttlefishXPCWrapper
+ (BOOL)retryable:(id)a3;
- (CuttlefishXPCWrapper)initWithCuttlefishXPCConnection:(id)a3;
- (NSXPCProxyCreating)cuttlefishXPCConnection;
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
- (void)handleEvictedMachineIDsWithSpecificUser:(id)a3 machineIDs:(id)a4 reply:(id)a5;
- (void)handleRemovedMachineIDsDueToUnknownReasonsWithSpecificUser:(id)a3 machineIDs:(id)a4 reply:(id)a5;
- (void)honorIDMSListChangesForSpecificUser:(id)a3 reply:(id)a4;
- (void)isRecoveryKeySet:(id)a3 reply:(id)a4;
- (void)joinWithSpecificUser:(id)a3 voucherData:(id)a4 voucherSig:(id)a5 ckksKeys:(id)a6 tlkShares:(id)a7 preapprovedKeys:(id)a8 flowID:(id)a9 deviceSessionID:(id)a10 canSendMetrics:(BOOL)a11 reply:(id)a12;
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
- (void)prepareInheritancePeerWithSpecificUser:(id)a3 epoch:(unint64_t)a4 machineID:(id)a5 bottleSalt:(id)a6 bottleID:(id)a7 modelID:(id)a8 deviceName:(id)a9 serialNumber:(id)a10 osVersion:(id)a11 policyVersion:(id)a12 policySecrets:(id)a13 syncUserControllableViews:(int)a14 secureElementIdentity:(id)a15 signingPrivKeyPersistentRef:(id)a16 encPrivKeyPersistentRef:(id)a17 crk:(id)a18 reply:(id)a19;
- (void)prepareWithSpecificUser:(id)a3 epoch:(unint64_t)a4 machineID:(id)a5 bottleSalt:(id)a6 bottleID:(id)a7 modelID:(id)a8 deviceName:(id)a9 serialNumber:(id)a10 osVersion:(id)a11 policyVersion:(id)a12 policySecrets:(id)a13 syncUserControllableViews:(int)a14 secureElementIdentity:(id)a15 setting:(id)a16 signingPrivKeyPersistentRef:(id)a17 encPrivKeyPersistentRef:(id)a18 reply:(id)a19;
- (void)recoverTLKSharesForInheritorWithSpecificUser:(id)a3 crk:(id)a4 tlkShares:(id)a5 reply:(id)a6;
- (void)removeCustodianRecoveryKeyWithSpecificUser:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)removeEscrowCacheWithSpecificUser:(id)a3 reply:(id)a4;
- (void)removeRecoveryKey:(id)a3 reply:(id)a4;
- (void)requestHealthCheckWithSpecificUser:(id)a3 requiresEscrowCheck:(BOOL)a4 repair:(BOOL)a5 knownFederations:(id)a6 flowID:(id)a7 deviceSessionID:(id)a8 reply:(id)a9;
- (void)resetAccountCDPContentsWithSpecificUser:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 internalAccount:(BOOL)a7 demoAccount:(BOOL)a8 reply:(id)a9;
- (void)resetWithSpecificUser:(id)a3 resetReason:(int64_t)a4 idmsTargetContext:(id)a5 idmsCuttlefishPassword:(id)a6 notifyIdMS:(BOOL)a7 internalAccount:(BOOL)a8 demoAccount:(BOOL)a9 isGuitarfish:(BOOL)a10 accountType:(int64_t)a11 reply:(id)a12;
- (void)setAllowedMachineIDsWithSpecificUser:(id)a3 allowedMachineIDs:(id)a4 userInitiatedRemovals:(id)a5 evictedRemovals:(id)a6 unknownReasonRemovals:(id)a7 honorIDMSListChanges:(BOOL)a8 version:(id)a9 flowID:(id)a10 deviceSessionID:(id)a11 canSendMetrics:(BOOL)a12 altDSID:(id)a13 trustedDeviceHash:(id)a14 deletedDeviceHash:(id)a15 trustedDevicesUpdateTimestamp:(id)a16 reply:(id)a17;
- (void)setPreapprovedKeysWithSpecificUser:(id)a3 preapprovedKeys:(id)a4 reply:(id)a5;
- (void)setRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 ckksKeys:(id)a6 reply:(id)a7;
- (void)testSemaphoreWithSpecificUser:(id)a3 arg:(id)a4 reply:(id)a5;
- (void)trustStatusWithSpecificUser:(id)a3 reply:(id)a4;
- (void)trustedDeviceNamesByPeerIDWithSpecificUser:(id)a3 reply:(id)a4;
- (void)updateTLKsWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 reply:(id)a6;
- (void)updateWithSpecificUser:(id)a3 forceRefetch:(BOOL)a4 deviceName:(id)a5 serialNumber:(id)a6 osVersion:(id)a7 policyVersion:(id)a8 policySecrets:(id)a9 syncUserControllableViews:(id)a10 secureElementIdentity:(id)a11 walrusSetting:(id)a12 webAccess:(id)a13 reply:(id)a14;
- (void)vouchWithBottleWithSpecificUser:(id)a3 bottleID:(id)a4 entropy:(id)a5 bottleSalt:(id)a6 tlkShares:(id)a7 reply:(id)a8;
- (void)vouchWithCustodianRecoveryKeyWithSpecificUser:(id)a3 crk:(id)a4 tlkShares:(id)a5 reply:(id)a6;
- (void)vouchWithRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 tlkShares:(id)a6 reply:(id)a7;
- (void)vouchWithRerollWithSpecificUser:(id)a3 oldPeerID:(id)a4 tlkShares:(id)a5 reply:(id)a6;
- (void)vouchWithSpecificUser:(id)a3 peerID:(id)a4 permanentInfo:(id)a5 permanentInfoSig:(id)a6 stableInfo:(id)a7 stableInfoSig:(id)a8 ckksKeys:(id)a9 flowID:(id)a10 deviceSessionID:(id)a11 canSendMetrics:(BOOL)a12 reply:(id)a13;
@end

@implementation CuttlefishXPCWrapper

- (CuttlefishXPCWrapper)initWithCuttlefishXPCConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CuttlefishXPCWrapper;
  v6 = -[CuttlefishXPCWrapper init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cuttlefishXPCConnection, a3);
  }

  return v7;
}

- (void)pingWithReply:(id)a3
{
  v4 = &v12;
  id v5 = a3;
  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x2020000000LL;
  int v14 = 0;
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = -86;
  do
  {
    char *v4 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000289C0;
    v8[3] = &unk_1002837F8;
    v8[4] = self;
    v8[5] = v13;
    v8[6] = &v9;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 synchronousRemoteObjectProxyWithErrorHandler:v8]);
    [v7 pingWithReply:v5];

    v4 = (char *)(v10 + 3);
  }

  while (*((_BYTE *)v10 + 24));
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(v13, 8);
}

- (void)dumpWithSpecificUser:(id)a3 reply:(id)a4
{
  v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  int v21 = 0;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100028808;
    v12[3] = &unk_100283820;
    int v14 = v20;
    v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 synchronousRemoteObjectProxyWithErrorHandler:v12]);
    [v11 dumpWithSpecificUser:v7 reply:v10];

    v6 = (char *)(v17 + 3);
  }

  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)honorIDMSListChangesForSpecificUser:(id)a3 reply:(id)a4
{
  v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  int v21 = 0;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100028650;
    v12[3] = &unk_100283820;
    int v14 = v20;
    v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 synchronousRemoteObjectProxyWithErrorHandler:v12]);
    [v11 honorIDMSListChangesForSpecificUser:v7 reply:v10];

    v6 = (char *)(v17 + 3);
  }

  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)octagonPeerIDGivenBottleIDWithSpecificUser:(id)a3 bottleID:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  int v24 = 0;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    char v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100028498;
    v15[3] = &unk_100283820;
    v17 = v23;
    v15[4] = self;
    uint64_t v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v12 synchronousRemoteObjectProxyWithErrorHandler:v15]);
    [v14 octagonPeerIDGivenBottleIDWithSpecificUser:v9 bottleID:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }

  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)trustedDeviceNamesByPeerIDWithSpecificUser:(id)a3 reply:(id)a4
{
  v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  int v21 = 0;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000282E0;
    v12[3] = &unk_100283820;
    int v14 = v20;
    v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 synchronousRemoteObjectProxyWithErrorHandler:v12]);
    [v11 trustedDeviceNamesByPeerIDWithSpecificUser:v7 reply:v10];

    v6 = (char *)(v17 + 3);
  }

  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)departByDistrustingSelfWithSpecificUser:(id)a3 reply:(id)a4
{
  v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  int v21 = 0;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10002812C;
    v12[3] = &unk_100283820;
    int v14 = v20;
    v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 synchronousRemoteObjectProxyWithErrorHandler:v12]);
    [v11 departByDistrustingSelfWithSpecificUser:v7 reply:v10];

    v6 = (char *)(v17 + 3);
  }

  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)distrustPeerIDsWithSpecificUser:(id)a3 peerIDs:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  int v24 = 0;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    char v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100027F78;
    v15[3] = &unk_100283820;
    v17 = v23;
    v15[4] = self;
    uint64_t v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v12 synchronousRemoteObjectProxyWithErrorHandler:v15]);
    [v14 distrustPeerIDsWithSpecificUser:v9 peerIDs:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }

  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)dropPeerIDsWithSpecificUser:(id)a3 peerIDs:(id)a4 reply:(id)a5
{
  id v5 = (void (**)(id, void *))a5;
  v6 = sub_10001267C("SecError");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "octagon: drop unsupported from within securityd",  v9,  2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -4LL,  0LL));
  v5[2](v5, v8);
}

- (void)trustStatusWithSpecificUser:(id)a3 reply:(id)a4
{
  v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  int v21 = 0;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100027DC0;
    v12[3] = &unk_100283820;
    int v14 = v20;
    v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 synchronousRemoteObjectProxyWithErrorHandler:v12]);
    [v11 trustStatusWithSpecificUser:v7 reply:v10];

    v6 = (char *)(v17 + 3);
  }

  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)resetWithSpecificUser:(id)a3 resetReason:(int64_t)a4 idmsTargetContext:(id)a5 idmsCuttlefishPassword:(id)a6 notifyIdMS:(BOOL)a7 internalAccount:(BOOL)a8 demoAccount:(BOOL)a9 isGuitarfish:(BOOL)a10 accountType:(int64_t)a11 reply:(id)a12
{
  BOOL v24 = a7;
  BOOL v25 = a8;
  v15 = &v34;
  id v26 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a12;
  v35[0] = 0LL;
  v35[1] = v35;
  v35[2] = 0x2020000000LL;
  int v36 = 0;
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x2020000000LL;
  char v34 = -86;
  do
  {
    char *v15 = 0;
    char v19 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100027C0C;
    v27[3] = &unk_100283820;
    v29 = v35;
    v27[4] = self;
    v30 = &v31;
    id v20 = v18;
    id v28 = v20;
    int v21 = (void *)objc_claimAutoreleasedReturnValue([v19 synchronousRemoteObjectProxyWithErrorHandler:v27]);
    LOWORD(v22) = __PAIR16__(a10, a9);
    objc_msgSend( v21,  "resetWithSpecificUser:resetReason:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:internalAccount:demoAccount: isGuitarfish:accountType:reply:",  v26,  a4,  v16,  v17,  v24,  v25,  v22,  a11,  v20);

    v15 = (char *)(v32 + 3);
  }

  while (*((_BYTE *)v32 + 24));
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(v35, 8);
}

- (void)localResetWithSpecificUser:(id)a3 reply:(id)a4
{
  v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  int v21 = 0;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100027A58;
    v12[3] = &unk_100283820;
    int v14 = v20;
    v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 synchronousRemoteObjectProxyWithErrorHandler:v12]);
    [v11 localResetWithSpecificUser:v7 reply:v10];

    v6 = (char *)(v17 + 3);
  }

  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)setAllowedMachineIDsWithSpecificUser:(id)a3 allowedMachineIDs:(id)a4 userInitiatedRemovals:(id)a5 evictedRemovals:(id)a6 unknownReasonRemovals:(id)a7 honorIDMSListChanges:(BOOL)a8 version:(id)a9 flowID:(id)a10 deviceSessionID:(id)a11 canSendMetrics:(BOOL)a12 altDSID:(id)a13 trustedDeviceHash:(id)a14 deletedDeviceHash:(id)a15 trustedDevicesUpdateTimestamp:(id)a16 reply:(id)a17
{
  BOOL v33 = a8;
  uint64_t v22 = &v48;
  id v40 = a3;
  id v39 = a4;
  id v38 = a5;
  id v37 = a6;
  id v36 = a7;
  id v35 = a9;
  id v34 = a10;
  id v23 = a11;
  id v24 = a13;
  id v25 = a14;
  id v26 = a15;
  id v27 = a16;
  id v28 = a17;
  v49[0] = 0LL;
  v49[1] = v49;
  v49[2] = 0x2020000000LL;
  int v50 = 0;
  uint64_t v45 = 0LL;
  v46 = &v45;
  uint64_t v47 = 0x2020000000LL;
  char v48 = -86;
  do
  {
    *uint64_t v22 = 0;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_1000278A0;
    v41[3] = &unk_100283820;
    v43 = v49;
    v41[4] = self;
    v44 = &v45;
    id v30 = v28;
    id v42 = v30;
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v29 synchronousRemoteObjectProxyWithErrorHandler:v41]);
    LOBYTE(v32) = a12;
    [v31 setAllowedMachineIDsWithSpecificUser:v40 allowedMachineIDs:v39 userInitiatedRemovals:v38 evictedRemovals:v37 unknownReasonRemovals :v36 honorIDMSListChanges:v33 version:v35 flowID:v34 deviceSessionID:v23 canSendMetrics:v32 altDSID:v24 trustedDeviceHash:v25 deletedDeviceHash:v26 tr ustedDevicesUpdateTimestamp:v27 reply:v30];

    uint64_t v22 = (char *)(v46 + 3);
  }

  while (*((_BYTE *)v46 + 24));
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(v49, 8);
}

- (void)markTrustedDeviceListFetchFailed:(id)a3 reply:(id)a4
{
  v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  int v21 = 0;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000276EC;
    v12[3] = &unk_100283820;
    int v14 = v20;
    v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 synchronousRemoteObjectProxyWithErrorHandler:v12]);
    [v11 markTrustedDeviceListFetchFailed:v7 reply:v10];

    v6 = (char *)(v17 + 3);
  }

  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)handleEvictedMachineIDsWithSpecificUser:(id)a3 machineIDs:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  int v24 = 0;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    char v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100027538;
    v15[3] = &unk_100283820;
    id v17 = v23;
    v15[4] = self;
    uint64_t v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v12 synchronousRemoteObjectProxyWithErrorHandler:v15]);
    [v14 handleEvictedMachineIDsWithSpecificUser:v9 machineIDs:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }

  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)handleRemovedMachineIDsDueToUnknownReasonsWithSpecificUser:(id)a3 machineIDs:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  int v24 = 0;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    char v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100027384;
    v15[3] = &unk_100283820;
    id v17 = v23;
    v15[4] = self;
    uint64_t v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v12 synchronousRemoteObjectProxyWithErrorHandler:v15]);
    [v14 handleRemovedMachineIDsDueToUnknownReasonsWithSpecificUser:v9 machineIDs:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }

  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)fetchAllowedMachineIDsWithSpecificUser:(id)a3 reply:(id)a4
{
  v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  int v21 = 0;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000271CC;
    v12[3] = &unk_100283820;
    int v14 = v20;
    v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 synchronousRemoteObjectProxyWithErrorHandler:v12]);
    [v11 fetchAllowedMachineIDsWithSpecificUser:v7 reply:v10];

    v6 = (char *)(v17 + 3);
  }

  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)fetchEgoEpochWithSpecificUser:(id)a3 reply:(id)a4
{
  v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  int v21 = 0;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100027014;
    v12[3] = &unk_100283820;
    int v14 = v20;
    v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 synchronousRemoteObjectProxyWithErrorHandler:v12]);
    [v11 fetchEgoEpochWithSpecificUser:v7 reply:v10];

    v6 = (char *)(v17 + 3);
  }

  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)prepareWithSpecificUser:(id)a3 epoch:(unint64_t)a4 machineID:(id)a5 bottleSalt:(id)a6 bottleID:(id)a7 modelID:(id)a8 deviceName:(id)a9 serialNumber:(id)a10 osVersion:(id)a11 policyVersion:(id)a12 policySecrets:(id)a13 syncUserControllableViews:(int)a14 secureElementIdentity:(id)a15 setting:(id)a16 signingPrivKeyPersistentRef:(id)a17 encPrivKeyPersistentRef:(id)a18 reply:(id)a19
{
  int v24 = &v52;
  id v44 = a3;
  id v43 = a5;
  id v42 = a6;
  id v41 = a7;
  id v40 = a8;
  id v39 = a9;
  id v38 = a10;
  id v37 = a11;
  id v36 = a12;
  id v25 = a13;
  id v26 = a15;
  id v27 = a16;
  id v28 = a17;
  id v29 = a18;
  id v30 = a19;
  v53[0] = 0LL;
  v53[1] = v53;
  v53[2] = 0x2020000000LL;
  int v54 = 0;
  uint64_t v49 = 0LL;
  int v50 = &v49;
  uint64_t v51 = 0x2020000000LL;
  char v52 = -86;
  do
  {
    *int v24 = 0;
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_100026E48;
    v45[3] = &unk_100283820;
    uint64_t v47 = v53;
    v45[4] = self;
    char v48 = &v49;
    id v32 = v30;
    id v46 = v32;
    BOOL v33 = (void *)objc_claimAutoreleasedReturnValue([v31 synchronousRemoteObjectProxyWithErrorHandler:v45]);
    LODWORD(v34) = a14;
    [v33 prepareWithSpecificUser:v44 epoch:a4 machineID:v43 bottleSalt:v42 bottleID:v41 modelID:v40 deviceName:v39 serialNumber:v38 osVersion:v37 policyVersio n:v36 policySecrets:v25 syncUserControllableViews:v34 secureElementIdentity:v26 setting:v27 signingPrivKeyPersistentRef:v28 encPrivKeyPers istentRef:v29 reply:v32];

    int v24 = (char *)(v50 + 3);
  }

  while (*((_BYTE *)v50 + 24));
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(v53, 8);
}

- (void)establishWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 preapprovedKeys:(id)a6 reply:(id)a7
{
  char v12 = &v28;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v29[0] = 0LL;
  v29[1] = v29;
  v29[2] = 0x2020000000LL;
  int v30 = 0;
  uint64_t v25 = 0LL;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = -86;
  do
  {
    *char v12 = 0;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100026C88;
    v21[3] = &unk_100283820;
    id v23 = v29;
    v21[4] = self;
    int v24 = &v25;
    id v19 = v17;
    id v22 = v19;
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 synchronousRemoteObjectProxyWithErrorHandler:v21]);
    [v20 establishWithSpecificUser:v13 ckksKeys:v14 tlkShares:v15 preapprovedKeys:v16 reply:v19];

    char v12 = (char *)(v26 + 3);
  }

  while (*((_BYTE *)v26 + 24));
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v29, 8);
}

- (void)vouchWithSpecificUser:(id)a3 peerID:(id)a4 permanentInfo:(id)a5 permanentInfoSig:(id)a6 stableInfo:(id)a7 stableInfoSig:(id)a8 ckksKeys:(id)a9 flowID:(id)a10 deviceSessionID:(id)a11 canSendMetrics:(BOOL)a12 reply:(id)a13
{
  id v19 = &v41;
  id v33 = a3;
  id v32 = a4;
  id v31 = a5;
  id v30 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a13;
  v42[0] = 0LL;
  v42[1] = v42;
  v42[2] = 0x2020000000LL;
  int v43 = 0;
  uint64_t v38 = 0LL;
  id v39 = &v38;
  uint64_t v40 = 0x2020000000LL;
  char v41 = -86;
  do
  {
    *id v19 = 0;
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_100026ACC;
    v34[3] = &unk_100283820;
    id v36 = v42;
    v34[4] = self;
    id v37 = &v38;
    id v27 = v25;
    id v35 = v27;
    char v28 = (void *)objc_claimAutoreleasedReturnValue([v26 synchronousRemoteObjectProxyWithErrorHandler:v34]);
    LOBYTE(v29) = a12;
    [v28 vouchWithSpecificUser:v33 peerID:v32 permanentInfo:v31 permanentInfoSig:v30 stableInfo:v20 stableInfoSig:v21 ckksKeys:v22 flowID:v23 deviceSession ID:v24 canSendMetrics:v29 reply:v27];

    id v19 = (char *)(v39 + 3);
  }

  while (*((_BYTE *)v39 + 24));
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(v42, 8);
}

- (void)preflightVouchWithBottleWithSpecificUser:(id)a3 bottleID:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  int v24 = 0;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    char v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10002690C;
    v15[3] = &unk_100283820;
    id v17 = v23;
    v15[4] = self;
    uint64_t v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 synchronousRemoteObjectProxyWithErrorHandler:v15]);
    [v14 preflightVouchWithBottleWithSpecificUser:v9 bottleID:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }

  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)vouchWithBottleWithSpecificUser:(id)a3 bottleID:(id)a4 entropy:(id)a5 bottleSalt:(id)a6 tlkShares:(id)a7 reply:(id)a8
{
  id v14 = &v31;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v32[0] = 0LL;
  v32[1] = v32;
  v32[2] = 0x2020000000LL;
  int v33 = 0;
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  char v31 = -86;
  do
  {
    *id v14 = 0;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100026748;
    v24[3] = &unk_100283820;
    id v26 = v32;
    v24[4] = self;
    id v27 = &v28;
    id v22 = v20;
    id v25 = v22;
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 synchronousRemoteObjectProxyWithErrorHandler:v24]);
    [v23 vouchWithBottleWithSpecificUser:v15 bottleID:v16 entropy:v17 bottleSalt:v18 tlkShares:v19 reply:v22];

    id v14 = (char *)(v29 + 3);
  }

  while (*((_BYTE *)v29 + 24));
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v32, 8);
}

- (void)preflightVouchWithRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 reply:(id)a6
{
  id v10 = &v25;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  int v27 = 0;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = -86;
  do
  {
    char *v10 = 0;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10002658C;
    v18[3] = &unk_100283820;
    id v20 = v26;
    v18[4] = self;
    uint64_t v21 = &v22;
    id v16 = v14;
    id v19 = v16;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 synchronousRemoteObjectProxyWithErrorHandler:v18]);
    [v17 preflightVouchWithRecoveryKeyWithSpecificUser:v11 recoveryKey:v12 salt:v13 reply:v16];

    id v10 = (char *)(v23 + 3);
  }

  while (*((_BYTE *)v23 + 24));
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);
}

- (void)preflightVouchWithCustodianRecoveryKeyWithSpecificUser:(id)a3 crk:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  int v24 = 0;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000263D0;
    v15[3] = &unk_100283820;
    id v17 = v23;
    v15[4] = self;
    id v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 synchronousRemoteObjectProxyWithErrorHandler:v15]);
    [v14 preflightVouchWithCustodianRecoveryKeyWithSpecificUser:v9 crk:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }

  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)vouchWithRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 tlkShares:(id)a6 reply:(id)a7
{
  id v12 = &v28;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v29[0] = 0LL;
  v29[1] = v29;
  v29[2] = 0x2020000000LL;
  int v30 = 0;
  uint64_t v25 = 0LL;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = -86;
  do
  {
    *id v12 = 0;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10002620C;
    v21[3] = &unk_100283820;
    id v23 = v29;
    v21[4] = self;
    int v24 = &v25;
    id v19 = v17;
    id v22 = v19;
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 synchronousRemoteObjectProxyWithErrorHandler:v21]);
    [v20 vouchWithRecoveryKeyWithSpecificUser:v13 recoveryKey:v14 salt:v15 tlkShares:v16 reply:v19];

    id v12 = (char *)(v26 + 3);
  }

  while (*((_BYTE *)v26 + 24));
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v29, 8);
}

- (void)vouchWithCustodianRecoveryKeyWithSpecificUser:(id)a3 crk:(id)a4 tlkShares:(id)a5 reply:(id)a6
{
  id v10 = &v25;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  int v27 = 0;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = -86;
  do
  {
    char *v10 = 0;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100026048;
    v18[3] = &unk_100283820;
    id v20 = v26;
    v18[4] = self;
    uint64_t v21 = &v22;
    id v16 = v14;
    id v19 = v16;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 synchronousRemoteObjectProxyWithErrorHandler:v18]);
    [v17 vouchWithCustodianRecoveryKeyWithSpecificUser:v11 crk:v12 tlkShares:v13 reply:v16];

    id v10 = (char *)(v23 + 3);
  }

  while (*((_BYTE *)v23 + 24));
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);
}

- (void)vouchWithRerollWithSpecificUser:(id)a3 oldPeerID:(id)a4 tlkShares:(id)a5 reply:(id)a6
{
  id v10 = &v25;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  int v27 = 0;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = -86;
  do
  {
    char *v10 = 0;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100025E84;
    v18[3] = &unk_100283820;
    id v20 = v26;
    v18[4] = self;
    uint64_t v21 = &v22;
    id v16 = v14;
    id v19 = v16;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 synchronousRemoteObjectProxyWithErrorHandler:v18]);
    [v17 vouchWithRerollWithSpecificUser:v11 oldPeerID:v12 tlkShares:v13 reply:v16];

    id v10 = (char *)(v23 + 3);
  }

  while (*((_BYTE *)v23 + 24));
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);
}

- (void)joinWithSpecificUser:(id)a3 voucherData:(id)a4 voucherSig:(id)a5 ckksKeys:(id)a6 tlkShares:(id)a7 preapprovedKeys:(id)a8 flowID:(id)a9 deviceSessionID:(id)a10 canSendMetrics:(BOOL)a11 reply:(id)a12
{
  id v18 = &v39;
  id v31 = a3;
  id v30 = a4;
  id v29 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a12;
  v40[0] = 0LL;
  v40[1] = v40;
  v40[2] = 0x2020000000LL;
  int v41 = 0;
  uint64_t v36 = 0LL;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  char v39 = -86;
  do
  {
    *id v18 = 0;
    char v25 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100025CC4;
    void v32[3] = &unk_100283820;
    uint64_t v34 = v40;
    v32[4] = self;
    id v35 = &v36;
    id v26 = v24;
    id v33 = v26;
    int v27 = (void *)objc_claimAutoreleasedReturnValue([v25 synchronousRemoteObjectProxyWithErrorHandler:v32]);
    LOBYTE(v28) = a11;
    [v27 joinWithSpecificUser:v31 voucherData:v30 voucherSig:v29 ckksKeys:v19 tlkShares:v20 preapprovedKeys:v21 flowID:v22 deviceSessionID:v23 canSendMetrics:v28 reply:v26];

    id v18 = (char *)(v37 + 3);
  }

  while (*((_BYTE *)v37 + 24));
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(v40, 8);
}

- (void)preflightPreapprovedJoinWithSpecificUser:(id)a3 preapprovedKeys:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  int v24 = 0;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100025B0C;
    v15[3] = &unk_100283820;
    id v17 = v23;
    v15[4] = self;
    id v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 synchronousRemoteObjectProxyWithErrorHandler:v15]);
    [v14 preflightPreapprovedJoinWithSpecificUser:v9 preapprovedKeys:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }

  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)attemptPreapprovedJoinWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 preapprovedKeys:(id)a6 reply:(id)a7
{
  id v12 = &v28;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v29[0] = 0LL;
  v29[1] = v29;
  v29[2] = 0x2020000000LL;
  int v30 = 0;
  uint64_t v25 = 0LL;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = -86;
  do
  {
    *id v12 = 0;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10002594C;
    v21[3] = &unk_100283820;
    id v23 = v29;
    v21[4] = self;
    int v24 = &v25;
    id v19 = v17;
    id v22 = v19;
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 synchronousRemoteObjectProxyWithErrorHandler:v21]);
    [v20 attemptPreapprovedJoinWithSpecificUser:v13 ckksKeys:v14 tlkShares:v15 preapprovedKeys:v16 reply:v19];

    id v12 = (char *)(v26 + 3);
  }

  while (*((_BYTE *)v26 + 24));
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v29, 8);
}

- (void)updateWithSpecificUser:(id)a3 forceRefetch:(BOOL)a4 deviceName:(id)a5 serialNumber:(id)a6 osVersion:(id)a7 policyVersion:(id)a8 policySecrets:(id)a9 syncUserControllableViews:(id)a10 secureElementIdentity:(id)a11 walrusSetting:(id)a12 webAccess:(id)a13 reply:(id)a14
{
  BOOL v29 = a4;
  id v19 = &v42;
  id v34 = a3;
  id v33 = a5;
  id v32 = a6;
  id v31 = a7;
  id v30 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  id v24 = a13;
  id v25 = a14;
  v43[0] = 0LL;
  v43[1] = v43;
  v43[2] = 0x2020000000LL;
  int v44 = 0;
  uint64_t v39 = 0LL;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000LL;
  char v42 = -86;
  do
  {
    *id v19 = 0;
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100025790;
    void v35[3] = &unk_100283820;
    id v37 = v43;
    v35[4] = self;
    uint64_t v38 = &v39;
    id v27 = v25;
    id v36 = v27;
    char v28 = (void *)objc_claimAutoreleasedReturnValue([v26 synchronousRemoteObjectProxyWithErrorHandler:v35]);
    [v28 updateWithSpecificUser:v34 forceRefetch:v29 deviceName:v33 serialNumber:v32 osVersion:v31 policyVersion:v30 policySecrets:v20 syncUserControll ableViews:v21 secureElementIdentity:v22 walrusSetting:v23 webAccess:v24 reply:v27];

    id v19 = (char *)(v40 + 3);
  }

  while (*((_BYTE *)v40 + 24));
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(v43, 8);
}

- (void)setPreapprovedKeysWithSpecificUser:(id)a3 preapprovedKeys:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  int v24 = 0;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000255D8;
    v15[3] = &unk_100283820;
    id v17 = v23;
    v15[4] = self;
    id v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 synchronousRemoteObjectProxyWithErrorHandler:v15]);
    [v14 setPreapprovedKeysWithSpecificUser:v9 preapprovedKeys:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }

  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)updateTLKsWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 reply:(id)a6
{
  id v10 = &v25;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  int v27 = 0;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = -86;
  do
  {
    char *v10 = 0;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100025420;
    v18[3] = &unk_100283820;
    id v20 = v26;
    v18[4] = self;
    uint64_t v21 = &v22;
    id v16 = v14;
    id v19 = v16;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 synchronousRemoteObjectProxyWithErrorHandler:v18]);
    [v17 updateTLKsWithSpecificUser:v11 ckksKeys:v12 tlkShares:v13 reply:v16];

    id v10 = (char *)(v23 + 3);
  }

  while (*((_BYTE *)v23 + 24));
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);
}

- (void)fetchViableBottlesWithSpecificUser:(id)a3 source:(int64_t)a4 flowID:(id)a5 deviceSessionID:(id)a6 reply:(id)a7
{
  id v12 = &v27;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v28[0] = 0LL;
  v28[1] = v28;
  v28[2] = 0x2020000000LL;
  int v29 = 0;
  uint64_t v24 = 0LL;
  char v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = -86;
  do
  {
    *id v12 = 0;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100025264;
    void v20[3] = &unk_100283820;
    uint64_t v22 = v28;
    v20[4] = self;
    id v23 = &v24;
    id v18 = v16;
    id v21 = v18;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 synchronousRemoteObjectProxyWithErrorHandler:v20]);
    [v19 fetchViableBottlesWithSpecificUser:v13 source:a4 flowID:v14 deviceSessionID:v15 reply:v18];

    id v12 = (char *)(v25 + 3);
  }

  while (*((_BYTE *)v25 + 24));
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(v28, 8);
}

- (void)fetchEscrowContentsWithSpecificUser:(id)a3 reply:(id)a4
{
  v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  int v21 = 0;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000250A4;
    v12[3] = &unk_100283820;
    id v14 = v20;
    id v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 synchronousRemoteObjectProxyWithErrorHandler:v12]);
    [v11 fetchEscrowContentsWithSpecificUser:v7 reply:v10];

    v6 = (char *)(v17 + 3);
  }

  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)fetchPolicyDocumentsWithSpecificUser:(id)a3 versions:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  int v24 = 0;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100024EEC;
    v15[3] = &unk_100283820;
    id v17 = v23;
    v15[4] = self;
    uint64_t v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 synchronousRemoteObjectProxyWithErrorHandler:v15]);
    [v14 fetchPolicyDocumentsWithSpecificUser:v9 versions:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }

  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)fetchCurrentPolicyWithSpecificUser:(id)a3 modelIDOverride:(id)a4 isInheritedAccount:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  id v10 = &v24;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x2020000000LL;
  int v26 = 0;
  uint64_t v21 = 0LL;
  char v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = -86;
  do
  {
    char *v10 = 0;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100024D30;
    v17[3] = &unk_100283820;
    uint64_t v19 = v25;
    v17[4] = self;
    id v20 = &v21;
    id v15 = v13;
    id v18 = v15;
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 synchronousRemoteObjectProxyWithErrorHandler:v17]);
    [v16 fetchCurrentPolicyWithSpecificUser:v11 modelIDOverride:v12 isInheritedAccount:v7 reply:v15];

    id v10 = (char *)(v22 + 3);
  }

  while (*((_BYTE *)v22 + 24));
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(v25, 8);
}

- (void)fetchTrustStateWithSpecificUser:(id)a3 reply:(id)a4
{
  v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  int v21 = 0;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100024B74;
    v12[3] = &unk_100283820;
    id v14 = v20;
    id v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 synchronousRemoteObjectProxyWithErrorHandler:v12]);
    [v11 fetchTrustStateWithSpecificUser:v7 reply:v10];

    v6 = (char *)(v17 + 3);
  }

  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)setRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 ckksKeys:(id)a6 reply:(id)a7
{
  id v12 = &v28;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v29[0] = 0LL;
  v29[1] = v29;
  v29[2] = 0x2020000000LL;
  int v30 = 0;
  uint64_t v25 = 0LL;
  int v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = -86;
  do
  {
    *id v12 = 0;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000249BC;
    v21[3] = &unk_100283820;
    uint64_t v23 = v29;
    v21[4] = self;
    char v24 = &v25;
    id v19 = v17;
    id v22 = v19;
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 synchronousRemoteObjectProxyWithErrorHandler:v21]);
    [v20 setRecoveryKeyWithSpecificUser:v13 recoveryKey:v14 salt:v15 ckksKeys:v16 reply:v19];

    id v12 = (char *)(v26 + 3);
  }

  while (*((_BYTE *)v26 + 24));
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v29, 8);
}

- (void)createCustodianRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 ckksKeys:(id)a6 uuid:(id)a7 kind:(int)a8 reply:(id)a9
{
  uint64_t v9 = *(void *)&a8;
  id v15 = &v32;
  id v24 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  v33[0] = 0LL;
  v33[1] = v33;
  v33[2] = 0x2020000000LL;
  int v34 = 0;
  uint64_t v29 = 0LL;
  int v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  char v32 = -86;
  do
  {
    char *v15 = 0;
    int v21 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100024800;
    void v25[3] = &unk_100283820;
    uint64_t v27 = v33;
    v25[4] = self;
    char v28 = &v29;
    id v22 = v20;
    id v26 = v22;
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 synchronousRemoteObjectProxyWithErrorHandler:v25]);
    [v23 createCustodianRecoveryKeyWithSpecificUser:v24 recoveryKey:v16 salt:v17 ckksKeys:v18 uuid:v19 kind:v9 reply:v22];

    id v15 = (char *)(v30 + 3);
  }

  while (*((_BYTE *)v30 + 24));
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v33, 8);
}

- (void)removeCustodianRecoveryKeyWithSpecificUser:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  int v24 = 0;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10002464C;
    v15[3] = &unk_100283820;
    id v17 = v23;
    v15[4] = self;
    id v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 synchronousRemoteObjectProxyWithErrorHandler:v15]);
    [v14 removeCustodianRecoveryKeyWithSpecificUser:v9 uuid:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }

  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)findCustodianRecoveryKeyWithSpecificUser:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  int v24 = 0;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100024494;
    v15[3] = &unk_100283820;
    id v17 = v23;
    v15[4] = self;
    id v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 synchronousRemoteObjectProxyWithErrorHandler:v15]);
    [v14 findCustodianRecoveryKeyWithSpecificUser:v9 uuid:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }

  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)requestHealthCheckWithSpecificUser:(id)a3 requiresEscrowCheck:(BOOL)a4 repair:(BOOL)a5 knownFederations:(id)a6 flowID:(id)a7 deviceSessionID:(id)a8 reply:(id)a9
{
  BOOL v12 = a5;
  BOOL v13 = a4;
  id v15 = &v31;
  id v23 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v32[0] = 0LL;
  v32[1] = v32;
  v32[2] = 0x2020000000LL;
  int v33 = 0;
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  char v31 = -86;
  do
  {
    char *v15 = 0;
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000242DC;
    v24[3] = &unk_100283820;
    id v26 = v32;
    v24[4] = self;
    uint64_t v27 = &v28;
    id v21 = v19;
    id v25 = v21;
    char v22 = (void *)objc_claimAutoreleasedReturnValue([v20 synchronousRemoteObjectProxyWithErrorHandler:v24]);
    [v22 requestHealthCheckWithSpecificUser:v23 requiresEscrowCheck:v13 repair:v12 knownFederations:v16 flowID:v17 deviceSessionID:v18 reply:v21];

    id v15 = (char *)(v29 + 3);
  }

  while (*((_BYTE *)v29 + 24));
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v32, 8);
}

- (void)getSupportAppInfoWithSpecificUser:(id)a3 reply:(id)a4
{
  v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  int v21 = 0;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100024124;
    v12[3] = &unk_100283820;
    id v14 = v20;
    id v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 synchronousRemoteObjectProxyWithErrorHandler:v12]);
    [v11 getSupportAppInfoWithSpecificUser:v7 reply:v10];

    v6 = (char *)(v17 + 3);
  }

  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)fetchViableEscrowRecordsWithSpecificUser:(id)a3 source:(int64_t)a4 reply:(id)a5
{
  id v8 = &v21;
  id v9 = a3;
  id v10 = a5;
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x2020000000LL;
  int v23 = 0;
  uint64_t v18 = 0LL;
  char v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = -86;
  do
  {
    *id v8 = 0;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100023F6C;
    v14[3] = &unk_100283820;
    uint64_t v16 = v22;
    v14[4] = self;
    id v17 = &v18;
    id v12 = v10;
    id v15 = v12;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 synchronousRemoteObjectProxyWithErrorHandler:v14]);
    [v13 fetchViableEscrowRecordsWithSpecificUser:v9 source:a4 reply:v12];

    id v8 = (char *)(v19 + 3);
  }

  while (*((_BYTE *)v19 + 24));
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v22, 8);
}

- (void)removeEscrowCacheWithSpecificUser:(id)a3 reply:(id)a4
{
  v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  int v21 = 0;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100023DB8;
    v12[3] = &unk_100283820;
    id v14 = v20;
    id v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 synchronousRemoteObjectProxyWithErrorHandler:v12]);
    [v11 removeEscrowCacheWithSpecificUser:v7 reply:v10];

    v6 = (char *)(v17 + 3);
  }

  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)resetAccountCDPContentsWithSpecificUser:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 internalAccount:(BOOL)a7 demoAccount:(BOOL)a8 reply:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  id v15 = &v30;
  id v22 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a9;
  v31[0] = 0LL;
  v31[1] = v31;
  v31[2] = 0x2020000000LL;
  int v32 = 0;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  char v30 = -86;
  do
  {
    char *v15 = 0;
    char v19 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100023C04;
    void v23[3] = &unk_100283820;
    id v25 = v31;
    v23[4] = self;
    id v26 = &v27;
    id v20 = v18;
    id v24 = v20;
    int v21 = (void *)objc_claimAutoreleasedReturnValue([v19 synchronousRemoteObjectProxyWithErrorHandler:v23]);
    [v21 resetAccountCDPContentsWithSpecificUser:v22 idmsTargetContext:v16 idmsCuttlefishPassword:v17 notifyIdMS:v11 internalAccount:v10 demoAccount:v9 reply:v20];

    id v15 = (char *)(v28 + 3);
  }

  while (*((_BYTE *)v28 + 24));
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(v31, 8);
}

- (void)fetchRecoverableTLKSharesWithSpecificUser:(id)a3 peerID:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  int v24 = 0;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100023A4C;
    v15[3] = &unk_100283820;
    id v17 = v23;
    v15[4] = self;
    id v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 synchronousRemoteObjectProxyWithErrorHandler:v15]);
    [v14 fetchRecoverableTLKSharesWithSpecificUser:v9 peerID:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }

  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)fetchAccountSettingsWithSpecificUser:(id)a3 forceFetch:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v8 = &v21;
  id v9 = a3;
  id v10 = a5;
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x2020000000LL;
  int v23 = 0;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = -86;
  do
  {
    *id v8 = 0;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100023894;
    v14[3] = &unk_100283820;
    id v16 = v22;
    v14[4] = self;
    id v17 = &v18;
    id v12 = v10;
    id v15 = v12;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 synchronousRemoteObjectProxyWithErrorHandler:v14]);
    [v13 fetchAccountSettingsWithSpecificUser:v9 forceFetch:v6 reply:v12];

    id v8 = (char *)(v19 + 3);
  }

  while (*((_BYTE *)v19 + 24));
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v22, 8);
}

- (void)prepareInheritancePeerWithSpecificUser:(id)a3 epoch:(unint64_t)a4 machineID:(id)a5 bottleSalt:(id)a6 bottleID:(id)a7 modelID:(id)a8 deviceName:(id)a9 serialNumber:(id)a10 osVersion:(id)a11 policyVersion:(id)a12 policySecrets:(id)a13 syncUserControllableViews:(int)a14 secureElementIdentity:(id)a15 signingPrivKeyPersistentRef:(id)a16 encPrivKeyPersistentRef:(id)a17 crk:(id)a18 reply:(id)a19
{
  int v24 = &v52;
  id v44 = a3;
  id v43 = a5;
  id v42 = a6;
  id v41 = a7;
  id v40 = a8;
  id v39 = a9;
  id v38 = a10;
  id v37 = a11;
  id v36 = a12;
  id v25 = a13;
  id v26 = a15;
  id v27 = a16;
  id v28 = a17;
  id v29 = a18;
  id v30 = a19;
  v53[0] = 0LL;
  v53[1] = v53;
  v53[2] = 0x2020000000LL;
  int v54 = 0;
  uint64_t v49 = 0LL;
  int v50 = &v49;
  uint64_t v51 = 0x2020000000LL;
  char v52 = -86;
  do
  {
    *int v24 = 0;
    char v31 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_1000236C4;
    v45[3] = &unk_100283820;
    uint64_t v47 = v53;
    v45[4] = self;
    char v48 = &v49;
    id v32 = v30;
    id v46 = v32;
    int v33 = (void *)objc_claimAutoreleasedReturnValue([v31 synchronousRemoteObjectProxyWithErrorHandler:v45]);
    LODWORD(v34) = a14;
    [v33 prepareInheritancePeerWithSpecificUser:v44 epoch:a4 machineID:v43 bottleSalt:v42 bottleID:v41 modelID:v40 deviceName:v39 serialNumber:v38 osVersi on:v37 policyVersion:v36 policySecrets:v25 syncUserControllableViews:v34 secureElementIdentity:v26 signingPrivKeyPersistentRef:v27 encPriv KeyPersistentRef:v28 crk:v29 reply:v32];

    int v24 = (char *)(v50 + 3);
  }

  while (*((_BYTE *)v50 + 24));
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(v53, 8);
}

- (void)recoverTLKSharesForInheritorWithSpecificUser:(id)a3 crk:(id)a4 tlkShares:(id)a5 reply:(id)a6
{
  id v10 = &v25;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  int v27 = 0;
  uint64_t v22 = 0LL;
  int v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = -86;
  do
  {
    char *v10 = 0;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100023508;
    v18[3] = &unk_100283820;
    uint64_t v20 = v26;
    v18[4] = self;
    char v21 = &v22;
    id v16 = v14;
    id v19 = v16;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 synchronousRemoteObjectProxyWithErrorHandler:v18]);
    [v17 recoverTLKSharesForInheritorWithSpecificUser:v11 crk:v12 tlkShares:v13 reply:v16];

    id v10 = (char *)(v23 + 3);
  }

  while (*((_BYTE *)v23 + 24));
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);
}

- (void)isRecoveryKeySet:(id)a3 reply:(id)a4
{
  BOOL v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  int v21 = 0;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100023350;
    v12[3] = &unk_100283820;
    id v14 = v20;
    id v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 synchronousRemoteObjectProxyWithErrorHandler:v12]);
    [v11 isRecoveryKeySet:v7 reply:v10];

    BOOL v6 = (char *)(v17 + 3);
  }

  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)removeRecoveryKey:(id)a3 reply:(id)a4
{
  BOOL v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  int v21 = 0;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100023198;
    v12[3] = &unk_100283820;
    id v14 = v20;
    id v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 synchronousRemoteObjectProxyWithErrorHandler:v12]);
    [v11 removeRecoveryKey:v7 reply:v10];

    BOOL v6 = (char *)(v17 + 3);
  }

  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)performATOPRVActionsWithSpecificUser:(id)a3 reply:(id)a4
{
  BOOL v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  int v21 = 0;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100022FE4;
    v12[3] = &unk_100283820;
    id v14 = v20;
    id v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 synchronousRemoteObjectProxyWithErrorHandler:v12]);
    [v11 performATOPRVActionsWithSpecificUser:v7 reply:v10];

    BOOL v6 = (char *)(v17 + 3);
  }

  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)testSemaphoreWithSpecificUser:(id)a3 arg:(id)a4 reply:(id)a5
{
  id v5 = (void (**)(id, void *))a5;
  BOOL v6 = sub_10001267C("SecError");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "octagon: testing TPH semaphore handling unsupported from within securityd",  v9,  2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -4LL,  0LL));
  v5[2](v5, v8);
}

- (void)preflightRecoverOctagonUsingRecoveryKey:(id)a3 recoveryKey:(id)a4 salt:(id)a5 reply:(id)a6
{
  id v10 = &v25;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  int v27 = 0;
  uint64_t v22 = 0LL;
  int v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = -86;
  do
  {
    char *v10 = 0;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100022E2C;
    v18[3] = &unk_100283820;
    uint64_t v20 = v26;
    v18[4] = self;
    int v21 = &v22;
    id v16 = v14;
    id v19 = v16;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 synchronousRemoteObjectProxyWithErrorHandler:v18]);
    [v17 preflightRecoverOctagonUsingRecoveryKey:v11 recoveryKey:v12 salt:v13 reply:v16];

    id v10 = (char *)(v23 + 3);
  }

  while (*((_BYTE *)v23 + 24));
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);
}

- (void)fetchTrustedPeerCountWithSpecificUser:(id)a3 reply:(id)a4
{
  BOOL v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  int v21 = 0;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100022C74;
    v12[3] = &unk_100283820;
    id v14 = v20;
    id v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 synchronousRemoteObjectProxyWithErrorHandler:v12]);
    [v11 fetchTrustedPeerCountWithSpecificUser:v7 reply:v10];

    BOOL v6 = (char *)(v17 + 3);
  }

  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)octagonContainsDistrustedRecoveryKeysWithSpecificUser:(id)a3 reply:(id)a4
{
  BOOL v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  int v21 = 0;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = -86;
  do
  {
    char *v6 = 0;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100022ABC;
    v12[3] = &unk_100283820;
    id v14 = v20;
    id v15 = &v16;
    v12[4] = self;
    id v10 = v8;
    id v13 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 synchronousRemoteObjectProxyWithErrorHandler:v12]);
    [v11 octagonContainsDistrustedRecoveryKeysWithSpecificUser:v7 reply:v10];

    BOOL v6 = (char *)(v17 + 3);
  }

  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

- (void)fetchCurrentItemWithSpecificUser:(id)a3 items:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  int v24 = 0;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100022900;
    v15[3] = &unk_100283820;
    id v17 = v23;
    v15[4] = self;
    uint64_t v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 synchronousRemoteObjectProxyWithErrorHandler:v15]);
    [v14 fetchCurrentItemWithSpecificUser:v9 items:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }

  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)fetchPCSIdentityByPublicKeyWithSpecificUser:(id)a3 pcsservices:(id)a4 reply:(id)a5
{
  id v8 = &v22;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  int v24 = 0;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = -86;
  do
  {
    *id v8 = 0;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100022744;
    v15[3] = &unk_100283820;
    id v17 = v23;
    v15[4] = self;
    uint64_t v18 = &v19;
    id v13 = v11;
    id v16 = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 synchronousRemoteObjectProxyWithErrorHandler:v15]);
    [v14 fetchPCSIdentityByPublicKeyWithSpecificUser:v9 pcsservices:v10 reply:v13];

    id v8 = (char *)(v20 + 3);
  }

  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);
}

- (void)performCKServerUnreadableDataRemovalWithSpecificUser:(id)a3 isGuitarfish:(BOOL)a4 internalAccount:(BOOL)a5 demoAccount:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = &v25;
  id v13 = a3;
  id v14 = a7;
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  int v27 = 0;
  uint64_t v22 = 0LL;
  int v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = -86;
  do
  {
    *id v12 = 0;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100022590;
    v18[3] = &unk_100283820;
    uint64_t v20 = v26;
    v18[4] = self;
    uint64_t v21 = &v22;
    id v16 = v14;
    id v19 = v16;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 synchronousRemoteObjectProxyWithErrorHandler:v18]);
    [v17 performCKServerUnreadableDataRemovalWithSpecificUser:v13 isGuitarfish:v10 internalAccount:v9 demoAccount:v8 reply:v16];

    id v12 = (char *)(v23 + 3);
  }

  while (*((_BYTE *)v23 + 24));
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);
}

- (NSXPCProxyCreating)cuttlefishXPCConnection
{
  return (NSXPCProxyCreating *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

+ (BOOL)retryable:(id)a3
{
  id v3 = a3;
  v4 = (NSString *)objc_claimAutoreleasedReturnValue([v3 domain]);
  BOOL v5 = v4 == NSCocoaErrorDomain && [v3 code] == (id)4097;

  return v5;
}

@end