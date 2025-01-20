@interface OTControl
+ (id)controlObject:(BOOL)a3 error:(id *)a4;
+ (id)controlObject:(id *)a3;
- (BOOL)sync;
- (BOOL)synchronous;
- (NSXPCConnection)connection;
- (OTControl)initWithConnection:(id)a3 sync:(BOOL)a4;
- (id)getAsyncConnection:(id)a3;
- (id)getConnection:(id)a3;
- (void)appleAccountSignedIn:(id)a3 reply:(id)a4;
- (void)appleAccountSignedOut:(id)a3 reply:(id)a4;
- (void)areRecoveryKeysDistrusted:(id)a3 reply:(id)a4;
- (void)checkCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)checkInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)clearCliqueFromAccount:(id)a3 resetReason:(int64_t)a4 isGuitarfish:(BOOL)a5 reply:(id)a6;
- (void)createCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)createInheritanceKey:(id)a3 uuid:(id)a4 claimTokenData:(id)a5 wrappingKeyData:(id)a6 reply:(id)a7;
- (void)createInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)createRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5;
- (void)dealloc;
- (void)establish:(id)a3 reply:(id)a4;
- (void)fetchAccountSettings:(id)a3 reply:(id)a4;
- (void)fetchAccountWideSettingsWithForceFetch:(BOOL)a3 arguments:(id)a4 reply:(id)a5;
- (void)fetchAllViableBottles:(id)a3 source:(int64_t)a4 reply:(id)a5;
- (void)fetchCliqueStatus:(id)a3 configuration:(id)a4 reply:(id)a5;
- (void)fetchEgoPeerID:(id)a3 reply:(id)a4;
- (void)fetchEscrowContents:(id)a3 reply:(id)a4;
- (void)fetchEscrowRecords:(id)a3 source:(int64_t)a4 reply:(id)a5;
- (void)fetchTrustStatus:(id)a3 configuration:(id)a4 reply:(id)a5;
- (void)fetchTrustedSecureElementIdentities:(id)a3 reply:(id)a4;
- (void)fetchUserControllableViewsSyncStatus:(id)a3 reply:(id)a4;
- (void)fetchUserControllableViewsSyncStatusAsync:(id)a3 reply:(id)a4;
- (void)generateInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)getAccountMetadata:(id)a3 reply:(id)a4;
- (void)getCDPStatus:(id)a3 reply:(id)a4;
- (void)healthCheck:(id)a3 skipRateLimitingCheck:(BOOL)a4 repair:(BOOL)a5 reply:(id)a6;
- (void)invalidateEscrowCache:(id)a3 reply:(id)a4;
- (void)isRecoveryKeySet:(id)a3 reply:(id)a4;
- (void)joinWithCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5;
- (void)joinWithInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5;
- (void)joinWithRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5;
- (void)launchBottledPeer:(id)a3 bottleID:(id)a4 reply:(id)a5;
- (void)leaveClique:(id)a3 reply:(id)a4;
- (void)listOfEligibleBottledPeerRecords:(id)a3;
- (void)notifyIDMSTrustLevelChangeForAltDSID:(id)a3 reply:(id)a4;
- (void)octagonEncryptionPublicKey:(id)a3;
- (void)octagonSigningPublicKey:(id)a3;
- (void)peerDeviceNamesByPeerID:(id)a3 reply:(id)a4;
- (void)performCKServerUnreadableDataRemoval:(id)a3 isGuitarfish:(BOOL)a4 altDSID:(id)a5 reply:(id)a6;
- (void)postCDPFollowupResult:(id)a3 success:(BOOL)a4 type:(id)a5 error:(id)a6 reply:(id)a7;
- (void)preflightBottledPeer:(id)a3 dsid:(id)a4 reply:(id)a5;
- (void)preflightJoinWithCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5;
- (void)preflightJoinWithInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5;
- (void)preflightRecoverOctagonUsingRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5;
- (void)recoverWithRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5;
- (void)recreateInheritanceKey:(id)a3 uuid:(id)a4 oldIK:(id)a5 reply:(id)a6;
- (void)refetchCKKSPolicy:(id)a3 reply:(id)a4;
- (void)removeCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)removeFriendsInClique:(id)a3 peerIDs:(id)a4 reply:(id)a5;
- (void)removeInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)removeLocalSecureElementIdentityPeerID:(id)a3 secureElementIdentityPeerID:(id)a4 reply:(id)a5;
- (void)removeRecoveryKey:(id)a3 reply:(id)a4;
- (void)reroll:(id)a3 reply:(id)a4;
- (void)reset:(id)a3;
- (void)resetAccountCDPContents:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 reply:(id)a7;
- (void)resetAndEstablish:(id)a3 resetReason:(int64_t)a4 idmsTargetContext:(id)a5 idmsCuttlefishPassword:(id)a6 notifyIdMS:(BOOL)a7 accountSettings:(id)a8 isGuitarfish:(BOOL)a9 reply:(id)a10;
- (void)restore:(id)a3 dsid:(id)a4 secret:(id)a5 escrowRecordID:(id)a6 reply:(id)a7;
- (void)restoreFromBottle:(id)a3 entropy:(id)a4 bottleID:(id)a5 reply:(id)a6;
- (void)rpcEpochWithArguments:(id)a3 configuration:(id)a4 reply:(id)a5;
- (void)rpcJoinWithArguments:(id)a3 configuration:(id)a4 vouchData:(id)a5 vouchSig:(id)a6 reply:(id)a7;
- (void)rpcPrepareIdentityAsApplicantWithArguments:(id)a3 configuration:(id)a4 reply:(id)a5;
- (void)rpcVoucherWithArguments:(id)a3 configuration:(id)a4 peerID:(id)a5 permanentInfo:(id)a6 permanentInfoSig:(id)a7 stableInfo:(id)a8 stableInfoSig:(id)a9 maxCapability:(id)a10 reply:(id)a11;
- (void)scrubBottledPeer:(id)a3 bottleID:(id)a4 reply:(id)a5;
- (void)setAccountSetting:(id)a3 setting:(id)a4 reply:(id)a5;
- (void)setCDPEnabled:(id)a3 reply:(id)a4;
- (void)setConnection:(id)a3;
- (void)setLocalSecureElementIdentity:(id)a3 secureElementIdentity:(id)a4 reply:(id)a5;
- (void)setMachineIDOverride:(id)a3 machineID:(id)a4 reply:(id)a5;
- (void)setSync:(BOOL)a3;
- (void)setSynchronous:(BOOL)a3;
- (void)setUserControllableViewsSyncStatus:(id)a3 enabled:(BOOL)a4 reply:(id)a5;
- (void)simulateReceivePush:(id)a3 reply:(id)a4;
- (void)startOctagonStateMachine:(id)a3 reply:(id)a4;
- (void)status:(id)a3 context:(id)a4 reply:(id)a5;
- (void)status:(id)a3 reply:(id)a4;
- (void)storeInheritanceKey:(id)a3 ik:(id)a4 reply:(id)a5;
- (void)tapToRadar:(id)a3 description:(id)a4 radar:(id)a5 reply:(id)a6;
- (void)tlkRecoverabilityForEscrowRecordData:(id)a3 recordData:(id)a4 source:(int64_t)a5 reply:(id)a6;
- (void)totalTrustedPeers:(id)a3 reply:(id)a4;
- (void)waitForOctagonUpgrade:(id)a3 reply:(id)a4;
- (void)waitForPriorityViewKeychainDataRecovery:(id)a3 reply:(id)a4;
@end

@implementation OTControl

- (OTControl)initWithConnection:(id)a3 sync:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___OTControl;
  v8 = -[OTControl init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a3);
    v9->_sync = a4;
  }

  return v9;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___OTControl;
  -[OTControl dealloc](&v4, sel_dealloc);
}

- (id)getConnection:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[OTControl sync](self, "sync");
  v6 = -[OTControl connection](self, "connection");
  id v7 = v6;
  if (v5) {
    [v6 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }
  else {
    [v6 remoteObjectProxyWithErrorHandler:v4];
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)getAsyncConnection:(id)a3
{
  id v4 = a3;
  -[OTControl connection](self, "connection");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 remoteObjectProxyWithErrorHandler:v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)restore:(id)a3 dsid:(id)a4 secret:(id)a5 escrowRecordID:(id)a6 reply:(id)a7
{
  v8 = (void *)MEMORY[0x189607870];
  uint64_t v9 = *MEMORY[0x189607670];
  id v10 = a7;
  [v8 errorWithDomain:v9 code:-4 userInfo:0];
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, void, id))a7 + 2))(v10, 0LL, 0LL, v11);
}

- (void)reset:(id)a3
{
  id v4 = (void *)MEMORY[0x189607870];
  uint64_t v5 = *MEMORY[0x189607670];
  id v6 = a3;
  [v4 errorWithDomain:v5 code:-4 userInfo:0];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a3 + 2))(v6, 0LL, v7);
}

- (void)octagonSigningPublicKey:(id)a3
{
  id v4 = (void *)MEMORY[0x189607870];
  uint64_t v5 = *MEMORY[0x189607670];
  id v6 = a3;
  [v4 errorWithDomain:v5 code:-4 userInfo:0];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a3 + 2))(v6, 0LL, v7);
}

- (void)octagonEncryptionPublicKey:(id)a3
{
  id v4 = (void *)MEMORY[0x189607870];
  uint64_t v5 = *MEMORY[0x189607670];
  id v6 = a3;
  [v4 errorWithDomain:v5 code:-4 userInfo:0];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a3 + 2))(v6, 0LL, v7);
}

- (void)listOfEligibleBottledPeerRecords:(id)a3
{
  id v4 = (void *)MEMORY[0x189607870];
  uint64_t v5 = *MEMORY[0x189607670];
  id v6 = a3;
  [v4 errorWithDomain:v5 code:-4 userInfo:0];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a3 + 2))(v6, MEMORY[0x189604A58], v7);
}

- (void)appleAccountSignedIn:(id)a3 reply:(id)a4
{
  id v6 = a4;
  uint64_t v7 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __40__OTControl_appleAccountSignedIn_reply___block_invoke;
  v14[3] = &unk_189670540;
  id v8 = v6;
  id v15 = v8;
  id v9 = a3;
  -[OTControl getConnection:](self, "getConnection:", v14);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472LL;
  v12[2] = __40__OTControl_appleAccountSignedIn_reply___block_invoke_2;
  v12[3] = &unk_189670540;
  id v13 = v8;
  id v11 = v8;
  [v10 appleAccountSignedIn:v9 reply:v12];
}

- (void)appleAccountSignedOut:(id)a3 reply:(id)a4
{
  id v6 = a4;
  uint64_t v7 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __41__OTControl_appleAccountSignedOut_reply___block_invoke;
  v14[3] = &unk_189670540;
  id v8 = v6;
  id v15 = v8;
  id v9 = a3;
  -[OTControl getConnection:](self, "getConnection:", v14);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472LL;
  v12[2] = __41__OTControl_appleAccountSignedOut_reply___block_invoke_2;
  v12[3] = &unk_189670540;
  id v13 = v8;
  id v11 = v8;
  [v10 appleAccountSignedOut:v9 reply:v12];
}

- (void)notifyIDMSTrustLevelChangeForAltDSID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  uint64_t v7 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __56__OTControl_notifyIDMSTrustLevelChangeForAltDSID_reply___block_invoke;
  v14[3] = &unk_189670540;
  id v8 = v6;
  id v15 = v8;
  id v9 = a3;
  -[OTControl getConnection:](self, "getConnection:", v14);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472LL;
  v12[2] = __56__OTControl_notifyIDMSTrustLevelChangeForAltDSID_reply___block_invoke_2;
  v12[3] = &unk_189670540;
  id v13 = v8;
  id v11 = v8;
  [v10 notifyIDMSTrustLevelChangeForAltDSID:v9 reply:v12];
}

- (void)rpcEpochWithArguments:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8 = a5;
  uint64_t v9 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __55__OTControl_rpcEpochWithArguments_configuration_reply___block_invoke;
  v17[3] = &unk_189670540;
  id v10 = v8;
  id v18 = v10;
  id v11 = a4;
  id v12 = a3;
  -[OTControl getConnection:](self, "getConnection:", v17);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472LL;
  v15[2] = __55__OTControl_rpcEpochWithArguments_configuration_reply___block_invoke_2;
  v15[3] = &unk_189665790;
  id v16 = v10;
  id v14 = v10;
  [v13 rpcEpochWithArguments:v12 configuration:v11 reply:v15];
}

- (void)rpcPrepareIdentityAsApplicantWithArguments:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8 = a5;
  uint64_t v9 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __76__OTControl_rpcPrepareIdentityAsApplicantWithArguments_configuration_reply___block_invoke;
  v17[3] = &unk_189670540;
  id v10 = v8;
  id v18 = v10;
  id v11 = a4;
  id v12 = a3;
  -[OTControl getConnection:](self, "getConnection:", v17);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472LL;
  v15[2] = __76__OTControl_rpcPrepareIdentityAsApplicantWithArguments_configuration_reply___block_invoke_2;
  v15[3] = &unk_1896657B8;
  id v16 = v10;
  id v14 = v10;
  [v13 rpcPrepareIdentityAsApplicantWithArguments:v12 configuration:v11 reply:v15];
}

- (void)rpcVoucherWithArguments:(id)a3 configuration:(id)a4 peerID:(id)a5 permanentInfo:(id)a6 permanentInfoSig:(id)a7 stableInfo:(id)a8 stableInfoSig:(id)a9 maxCapability:(id)a10 reply:(id)a11
{
  id v18 = a11;
  v32[0] = MEMORY[0x1895F87A8];
  v32[1] = 3221225472LL;
  v32[2] = __134__OTControl_rpcVoucherWithArguments_configuration_peerID_permanentInfo_permanentInfoSig_stableInfo_stableInfoSig_maxCapability_reply___block_invoke;
  v32[3] = &unk_189670540;
  id v19 = v18;
  id v33 = v19;
  id v20 = a10;
  id v21 = a9;
  id v22 = a8;
  id v23 = a7;
  id v24 = a6;
  id v25 = a5;
  id v26 = a4;
  id v27 = a3;
  v28 = -[OTControl getConnection:](self, "getConnection:", v32);
  v30[0] = MEMORY[0x1895F87A8];
  v30[1] = 3221225472LL;
  v30[2] = __134__OTControl_rpcVoucherWithArguments_configuration_peerID_permanentInfo_permanentInfoSig_stableInfo_stableInfoSig_maxCapability_reply___block_invoke_2;
  v30[3] = &unk_1896657E0;
  id v31 = v19;
  id v29 = v19;
  [v28 rpcVoucherWithArguments:v27 configuration:v26 peerID:v25 permanentInfo:v24 permanentInfoSig:v23 stableInfo:v22 stableInfoSig:v21 maxCapability:v20 reply:v30];
}

- (void)rpcJoinWithArguments:(id)a3 configuration:(id)a4 vouchData:(id)a5 vouchSig:(id)a6 reply:(id)a7
{
  id v12 = a7;
  uint64_t v13 = MEMORY[0x1895F87A8];
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = __73__OTControl_rpcJoinWithArguments_configuration_vouchData_vouchSig_reply___block_invoke;
  v23[3] = &unk_189670540;
  id v14 = v12;
  id v24 = v14;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  -[OTControl getConnection:](self, "getConnection:", v23);
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  v21[1] = 3221225472LL;
  v21[2] = __73__OTControl_rpcJoinWithArguments_configuration_vouchData_vouchSig_reply___block_invoke_2;
  v21[3] = &unk_189670540;
  id v22 = v14;
  id v20 = v14;
  [v19 rpcJoinWithArguments:v18 configuration:v17 vouchData:v16 vouchSig:v15 reply:v21];
}

- (void)preflightBottledPeer:(id)a3 dsid:(id)a4 reply:(id)a5
{
  id v6 = (void *)MEMORY[0x189607870];
  uint64_t v7 = *MEMORY[0x189607670];
  id v8 = a5;
  [v6 errorWithDomain:v7 code:-4 userInfo:0];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, void, void, id))a5 + 2))(v8, 0LL, 0LL, 0LL, v9);
}

- (void)launchBottledPeer:(id)a3 bottleID:(id)a4 reply:(id)a5
{
  uint64_t v5 = (void (**)(id, void *))a5;
  secLogObjForScope("octagon");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1804F4000, v6, OS_LOG_TYPE_DEFAULT, "launchBottledPeer", v8, 2u);
  }

  [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:-4 userInfo:0];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v7);
}

- (void)scrubBottledPeer:(id)a3 bottleID:(id)a4 reply:(id)a5
{
  id v6 = (void *)MEMORY[0x189607870];
  uint64_t v7 = *MEMORY[0x189607670];
  id v8 = a5;
  [v6 errorWithDomain:v7 code:-4 userInfo:0];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v8, v9);
}

- (void)status:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = -[OTControlArguments initWithContainerName:contextID:altDSID:]( objc_alloc(&OBJC_CLASS___OTControlArguments),  "initWithContainerName:contextID:altDSID:",  v10,  v9,  0LL);

  -[OTControl status:reply:](self, "status:reply:", v11, v8);
}

- (void)status:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __26__OTControl_status_reply___block_invoke;
  v10[3] = &unk_189670540;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 status:v8 reply:v7];
}

- (void)fetchEgoPeerID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __34__OTControl_fetchEgoPeerID_reply___block_invoke;
  v10[3] = &unk_189670540;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 fetchEgoPeerID:v8 reply:v7];
}

- (void)fetchCliqueStatus:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __51__OTControl_fetchCliqueStatus_configuration_reply___block_invoke;
  v13[3] = &unk_189670540;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 fetchCliqueStatus:v11 configuration:v10 reply:v9];
}

- (void)fetchTrustStatus:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __50__OTControl_fetchTrustStatus_configuration_reply___block_invoke;
  v13[3] = &unk_189670540;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 fetchTrustStatus:v11 configuration:v10 reply:v9];
}

- (void)startOctagonStateMachine:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __44__OTControl_startOctagonStateMachine_reply___block_invoke;
  v10[3] = &unk_189670540;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 startOctagonStateMachine:v8 reply:v7];
}

- (void)resetAndEstablish:(id)a3 resetReason:(int64_t)a4 idmsTargetContext:(id)a5 idmsCuttlefishPassword:(id)a6 notifyIdMS:(BOOL)a7 accountSettings:(id)a8 isGuitarfish:(BOOL)a9 reply:(id)a10
{
  BOOL v11 = a7;
  id v17 = a10;
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __130__OTControl_resetAndEstablish_resetReason_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_accountSettings_isGuitarfish_reply___block_invoke;
  v25[3] = &unk_189670540;
  id v26 = v17;
  id v18 = v17;
  id v19 = a8;
  id v20 = a6;
  id v21 = a5;
  id v22 = a3;
  -[OTControl getConnection:](self, "getConnection:", v25);
  id v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = a9;
  [v23 resetAndEstablish:v22 resetReason:a4 idmsTargetContext:v21 idmsCuttlefishPassword:v20 notifyIdMS:v11 accountSettings:v19 isGuitarfish:v24 reply:v18];
}

- (void)establish:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __29__OTControl_establish_reply___block_invoke;
  v10[3] = &unk_189670540;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 establish:v8 reply:v7];
}

- (void)leaveClique:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __31__OTControl_leaveClique_reply___block_invoke;
  v10[3] = &unk_189670540;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 leaveClique:v8 reply:v7];
}

- (void)removeFriendsInClique:(id)a3 peerIDs:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __49__OTControl_removeFriendsInClique_peerIDs_reply___block_invoke;
  v13[3] = &unk_189670540;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 removeFriendsInClique:v11 peerIDs:v10 reply:v9];
}

- (void)peerDeviceNamesByPeerID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __43__OTControl_peerDeviceNamesByPeerID_reply___block_invoke;
  v10[3] = &unk_189670540;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 peerDeviceNamesByPeerID:v8 reply:v7];
}

- (void)fetchAllViableBottles:(id)a3 source:(int64_t)a4 reply:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __48__OTControl_fetchAllViableBottles_source_reply___block_invoke;
  v12[3] = &unk_189670540;
  id v13 = v8;
  id v9 = v8;
  id v10 = a3;
  -[OTControl getConnection:](self, "getConnection:", v12);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 fetchAllViableBottles:v10 source:a4 reply:v9];
}

- (void)restoreFromBottle:(id)a3 entropy:(id)a4 bottleID:(id)a5 reply:(id)a6
{
  id v10 = a6;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __54__OTControl_restoreFromBottle_entropy_bottleID_reply___block_invoke;
  v16[3] = &unk_189670540;
  id v17 = v10;
  id v11 = v10;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  -[OTControl getConnection:](self, "getConnection:", v16);
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 restoreFromBottle:v14 entropy:v13 bottleID:v12 reply:v11];
}

- (void)fetchEscrowContents:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __39__OTControl_fetchEscrowContents_reply___block_invoke;
  v10[3] = &unk_189670540;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 fetchEscrowContents:v8 reply:v7];
}

- (void)createRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __49__OTControl_createRecoveryKey_recoveryKey_reply___block_invoke;
  v13[3] = &unk_189670540;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 createRecoveryKey:v11 recoveryKey:v10 reply:v9];
}

- (void)joinWithRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __51__OTControl_joinWithRecoveryKey_recoveryKey_reply___block_invoke;
  v13[3] = &unk_189670540;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 joinWithRecoveryKey:v11 recoveryKey:v10 reply:v9];
}

- (void)createCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __51__OTControl_createCustodianRecoveryKey_uuid_reply___block_invoke;
  v13[3] = &unk_189670540;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 createCustodianRecoveryKey:v11 uuid:v10 reply:v9];
}

- (void)joinWithCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __69__OTControl_joinWithCustodianRecoveryKey_custodianRecoveryKey_reply___block_invoke;
  v13[3] = &unk_189670540;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 joinWithCustodianRecoveryKey:v11 custodianRecoveryKey:v10 reply:v9];
}

- (void)preflightJoinWithCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __78__OTControl_preflightJoinWithCustodianRecoveryKey_custodianRecoveryKey_reply___block_invoke;
  v13[3] = &unk_189670540;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 preflightJoinWithCustodianRecoveryKey:v11 custodianRecoveryKey:v10 reply:v9];
}

- (void)removeCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __51__OTControl_removeCustodianRecoveryKey_uuid_reply___block_invoke;
  v13[3] = &unk_189670540;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 removeCustodianRecoveryKey:v11 uuid:v10 reply:v9];
}

- (void)checkCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __50__OTControl_checkCustodianRecoveryKey_uuid_reply___block_invoke;
  v13[3] = &unk_189670540;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 checkCustodianRecoveryKey:v11 uuid:v10 reply:v9];
}

- (void)createInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __45__OTControl_createInheritanceKey_uuid_reply___block_invoke;
  v13[3] = &unk_189670540;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 createInheritanceKey:v11 uuid:v10 reply:v9];
}

- (void)generateInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __47__OTControl_generateInheritanceKey_uuid_reply___block_invoke;
  v13[3] = &unk_189670540;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 generateInheritanceKey:v11 uuid:v10 reply:v9];
}

- (void)storeInheritanceKey:(id)a3 ik:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __42__OTControl_storeInheritanceKey_ik_reply___block_invoke;
  v13[3] = &unk_189670540;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 storeInheritanceKey:v11 ik:v10 reply:v9];
}

- (void)joinWithInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __57__OTControl_joinWithInheritanceKey_inheritanceKey_reply___block_invoke;
  v13[3] = &unk_189670540;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 joinWithInheritanceKey:v11 inheritanceKey:v10 reply:v9];
}

- (void)preflightJoinWithInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __66__OTControl_preflightJoinWithInheritanceKey_inheritanceKey_reply___block_invoke;
  v13[3] = &unk_189670540;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 preflightJoinWithInheritanceKey:v11 inheritanceKey:v10 reply:v9];
}

- (void)removeInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __45__OTControl_removeInheritanceKey_uuid_reply___block_invoke;
  v13[3] = &unk_189670540;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 removeInheritanceKey:v11 uuid:v10 reply:v9];
}

- (void)checkInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __44__OTControl_checkInheritanceKey_uuid_reply___block_invoke;
  v13[3] = &unk_189670540;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 checkInheritanceKey:v11 uuid:v10 reply:v9];
}

- (void)recreateInheritanceKey:(id)a3 uuid:(id)a4 oldIK:(id)a5 reply:(id)a6
{
  id v10 = a6;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __53__OTControl_recreateInheritanceKey_uuid_oldIK_reply___block_invoke;
  v16[3] = &unk_189670540;
  id v17 = v10;
  id v11 = v10;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  -[OTControl getConnection:](self, "getConnection:", v16);
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 recreateInheritanceKey:v14 uuid:v13 oldIK:v12 reply:v11];
}

- (void)createInheritanceKey:(id)a3 uuid:(id)a4 claimTokenData:(id)a5 wrappingKeyData:(id)a6 reply:(id)a7
{
  id v12 = a7;
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __76__OTControl_createInheritanceKey_uuid_claimTokenData_wrappingKeyData_reply___block_invoke;
  v19[3] = &unk_189670540;
  id v20 = v12;
  id v13 = v12;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  -[OTControl getConnection:](self, "getConnection:", v19);
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 createInheritanceKey:v17 uuid:v16 claimTokenData:v15 wrappingKeyData:v14 reply:v13];
}

- (void)healthCheck:(id)a3 skipRateLimitingCheck:(BOOL)a4 repair:(BOOL)a5 reply:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __60__OTControl_healthCheck_skipRateLimitingCheck_repair_reply___block_invoke;
  v14[3] = &unk_189670540;
  id v15 = v10;
  id v11 = v10;
  id v12 = a3;
  -[OTControl getConnection:](self, "getConnection:", v14);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 healthCheck:v12 skipRateLimitingCheck:v7 repair:v6 reply:v11];
}

- (void)simulateReceivePush:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __39__OTControl_simulateReceivePush_reply___block_invoke;
  v10[3] = &unk_189670540;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 simulateReceivePush:v8 reply:v7];
}

- (void)waitForOctagonUpgrade:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __41__OTControl_waitForOctagonUpgrade_reply___block_invoke;
  v10[3] = &unk_189670540;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 waitForOctagonUpgrade:v8 reply:v7];
}

- (void)postCDPFollowupResult:(id)a3 success:(BOOL)a4 type:(id)a5 error:(id)a6 reply:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __60__OTControl_postCDPFollowupResult_success_type_error_reply___block_invoke;
  v19[3] = &unk_189670540;
  id v20 = v12;
  id v13 = v12;
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  -[OTControl getConnection:](self, "getConnection:", v19);
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[SecXPCHelper cleanseErrorForXPC:](&OBJC_CLASS___SecXPCHelper, "cleanseErrorForXPC:", v14);
  id v18 = (void *)objc_claimAutoreleasedReturnValue();

  [v17 postCDPFollowupResult:v16 success:v9 type:v15 error:v18 reply:v13];
}

- (void)tapToRadar:(id)a3 description:(id)a4 radar:(id)a5 reply:(id)a6
{
  id v10 = a6;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __48__OTControl_tapToRadar_description_radar_reply___block_invoke;
  v16[3] = &unk_189670540;
  id v17 = v10;
  id v11 = v10;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  -[OTControl getConnection:](self, "getConnection:", v16);
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 tapToRadar:v14 description:v13 radar:v12 reply:v11];
}

- (void)refetchCKKSPolicy:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __37__OTControl_refetchCKKSPolicy_reply___block_invoke;
  v10[3] = &unk_189670540;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 refetchCKKSPolicy:v8 reply:v7];
}

- (void)setCDPEnabled:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __33__OTControl_setCDPEnabled_reply___block_invoke;
  v10[3] = &unk_189670540;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setCDPEnabled:v8 reply:v7];
}

- (void)getCDPStatus:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __32__OTControl_getCDPStatus_reply___block_invoke;
  v10[3] = &unk_189670540;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 getCDPStatus:v8 reply:v7];
}

- (void)fetchEscrowRecords:(id)a3 source:(int64_t)a4 reply:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __45__OTControl_fetchEscrowRecords_source_reply___block_invoke;
  v12[3] = &unk_189670540;
  id v13 = v8;
  id v9 = v8;
  id v10 = a3;
  -[OTControl getConnection:](self, "getConnection:", v12);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 fetchEscrowRecords:v10 source:a4 reply:v9];
}

- (void)setUserControllableViewsSyncStatus:(id)a3 enabled:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __62__OTControl_setUserControllableViewsSyncStatus_enabled_reply___block_invoke;
  v12[3] = &unk_189670540;
  id v13 = v8;
  id v9 = v8;
  id v10 = a3;
  -[OTControl getConnection:](self, "getConnection:", v12);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setUserControllableViewsSyncStatus:v10 enabled:v5 reply:v9];
}

- (void)fetchUserControllableViewsSyncStatus:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __56__OTControl_fetchUserControllableViewsSyncStatus_reply___block_invoke;
  v10[3] = &unk_189670540;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 fetchUserControllableViewsSyncStatus:v8 reply:v7];
}

- (void)fetchUserControllableViewsSyncStatusAsync:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __61__OTControl_fetchUserControllableViewsSyncStatusAsync_reply___block_invoke;
  v10[3] = &unk_189670540;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[OTControl getAsyncConnection:](self, "getAsyncConnection:", v10);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 fetchUserControllableViewsSyncStatus:v8 reply:v7];
}

- (void)invalidateEscrowCache:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __41__OTControl_invalidateEscrowCache_reply___block_invoke;
  v10[3] = &unk_189670540;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 invalidateEscrowCache:v8 reply:v7];
}

- (void)resetAccountCDPContents:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 reply:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __95__OTControl_resetAccountCDPContents_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_reply___block_invoke;
  v18[3] = &unk_189670540;
  id v19 = v12;
  id v13 = v12;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  -[OTControl getConnection:](self, "getConnection:", v18);
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 resetAccountCDPContents:v16 idmsTargetContext:v15 idmsCuttlefishPassword:v14 notifyIdMS:v7 reply:v13];
}

- (void)setLocalSecureElementIdentity:(id)a3 secureElementIdentity:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __71__OTControl_setLocalSecureElementIdentity_secureElementIdentity_reply___block_invoke;
  v13[3] = &unk_189670540;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setLocalSecureElementIdentity:v11 secureElementIdentity:v10 reply:v9];
}

- (void)removeLocalSecureElementIdentityPeerID:(id)a3 secureElementIdentityPeerID:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __86__OTControl_removeLocalSecureElementIdentityPeerID_secureElementIdentityPeerID_reply___block_invoke;
  v13[3] = &unk_189670540;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 removeLocalSecureElementIdentityPeerID:v11 secureElementIdentityPeerID:v10 reply:v9];
}

- (void)fetchTrustedSecureElementIdentities:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __55__OTControl_fetchTrustedSecureElementIdentities_reply___block_invoke;
  v10[3] = &unk_189670540;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 fetchTrustedSecureElementIdentities:v8 reply:v7];
}

- (void)setAccountSetting:(id)a3 setting:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __45__OTControl_setAccountSetting_setting_reply___block_invoke;
  v13[3] = &unk_189670540;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setAccountSetting:v11 setting:v10 reply:v9];
}

- (void)fetchAccountSettings:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __40__OTControl_fetchAccountSettings_reply___block_invoke;
  v10[3] = &unk_189670540;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 fetchAccountSettings:v8 reply:v7];
}

- (void)fetchAccountWideSettingsWithForceFetch:(BOOL)a3 arguments:(id)a4 reply:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __68__OTControl_fetchAccountWideSettingsWithForceFetch_arguments_reply___block_invoke;
  v12[3] = &unk_189670540;
  id v13 = v8;
  id v9 = v8;
  id v10 = a4;
  -[OTControl getConnection:](self, "getConnection:", v12);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 fetchAccountWideSettingsWithForceFetch:v6 arguments:v10 reply:v9];
}

- (void)waitForPriorityViewKeychainDataRecovery:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __59__OTControl_waitForPriorityViewKeychainDataRecovery_reply___block_invoke;
  v10[3] = &unk_189670540;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 waitForPriorityViewKeychainDataRecovery:v8 reply:v7];
}

- (void)tlkRecoverabilityForEscrowRecordData:(id)a3 recordData:(id)a4 source:(int64_t)a5 reply:(id)a6
{
  id v10 = a6;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __74__OTControl_tlkRecoverabilityForEscrowRecordData_recordData_source_reply___block_invoke;
  v15[3] = &unk_189670540;
  id v16 = v10;
  id v11 = v10;
  id v12 = a4;
  id v13 = a3;
  -[OTControl getConnection:](self, "getConnection:", v15);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 tlkRecoverabilityForEscrowRecordData:v13 recordData:v12 source:a5 reply:v11];
}

- (void)setMachineIDOverride:(id)a3 machineID:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __50__OTControl_setMachineIDOverride_machineID_reply___block_invoke;
  v13[3] = &unk_189670540;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setMachineIDOverride:v11 machineID:v10 reply:v9];
}

- (void)isRecoveryKeySet:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __36__OTControl_isRecoveryKeySet_reply___block_invoke;
  v10[3] = &unk_189670540;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 isRecoveryKeySet:v8 reply:v7];
}

- (void)recoverWithRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __54__OTControl_recoverWithRecoveryKey_recoveryKey_reply___block_invoke;
  v13[3] = &unk_189670540;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 recoverWithRecoveryKey:v11 recoveryKey:v10 reply:v9];
}

- (void)removeRecoveryKey:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __37__OTControl_removeRecoveryKey_reply___block_invoke;
  v10[3] = &unk_189670540;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 removeRecoveryKey:v8 reply:v7];
}

- (void)preflightRecoverOctagonUsingRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __71__OTControl_preflightRecoverOctagonUsingRecoveryKey_recoveryKey_reply___block_invoke;
  v13[3] = &unk_189670540;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 preflightRecoverOctagonUsingRecoveryKey:v11 recoveryKey:v10 reply:v9];
}

- (void)getAccountMetadata:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __38__OTControl_getAccountMetadata_reply___block_invoke;
  v10[3] = &unk_189670540;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 getAccountMetadata:v8 reply:v7];
}

- (void)clearCliqueFromAccount:(id)a3 resetReason:(int64_t)a4 isGuitarfish:(BOOL)a5 reply:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __67__OTControl_clearCliqueFromAccount_resetReason_isGuitarfish_reply___block_invoke;
  v14[3] = &unk_189670540;
  id v15 = v10;
  id v11 = v10;
  id v12 = a3;
  -[OTControl getConnection:](self, "getConnection:", v14);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 clearCliqueFromAccount:v12 resetReason:a4 isGuitarfish:v6 reply:v11];
}

- (void)performCKServerUnreadableDataRemoval:(id)a3 isGuitarfish:(BOOL)a4 altDSID:(id)a5 reply:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __77__OTControl_performCKServerUnreadableDataRemoval_isGuitarfish_altDSID_reply___block_invoke;
  v15[3] = &unk_189670540;
  id v16 = v10;
  id v11 = v10;
  id v12 = a5;
  id v13 = a3;
  -[OTControl getConnection:](self, "getConnection:", v15);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 performCKServerUnreadableDataRemoval:v13 isGuitarfish:v7 altDSID:v12 reply:v11];
}

- (void)totalTrustedPeers:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __37__OTControl_totalTrustedPeers_reply___block_invoke;
  v10[3] = &unk_189670540;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 totalTrustedPeers:v8 reply:v7];
}

- (void)areRecoveryKeysDistrusted:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __45__OTControl_areRecoveryKeysDistrusted_reply___block_invoke;
  v10[3] = &unk_189670540;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 areRecoveryKeysDistrusted:v8 reply:v7];
}

- (void)reroll:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __26__OTControl_reroll_reply___block_invoke;
  v10[3] = &unk_189670540;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 reroll:v8 reply:v7];
}

- (BOOL)synchronous
{
  return self->_synchronous;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setConnection:(id)a3
{
}

- (BOOL)sync
{
  return self->_sync;
}

- (void)setSync:(BOOL)a3
{
  self->_sync = a3;
}

- (void).cxx_destruct
{
}

uint64_t __26__OTControl_reroll_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __45__OTControl_areRecoveryKeysDistrusted_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __37__OTControl_totalTrustedPeers_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __77__OTControl_performCKServerUnreadableDataRemoval_isGuitarfish_altDSID_reply___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __67__OTControl_clearCliqueFromAccount_resetReason_isGuitarfish_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __38__OTControl_getAccountMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __71__OTControl_preflightRecoverOctagonUsingRecoveryKey_recoveryKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __37__OTControl_removeRecoveryKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __54__OTControl_recoverWithRecoveryKey_recoveryKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __36__OTControl_isRecoveryKeySet_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __50__OTControl_setMachineIDOverride_machineID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __74__OTControl_tlkRecoverabilityForEscrowRecordData_recordData_source_reply___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __59__OTControl_waitForPriorityViewKeychainDataRecovery_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __68__OTControl_fetchAccountWideSettingsWithForceFetch_arguments_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __40__OTControl_fetchAccountSettings_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __45__OTControl_setAccountSetting_setting_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __55__OTControl_fetchTrustedSecureElementIdentities_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __86__OTControl_removeLocalSecureElementIdentityPeerID_secureElementIdentityPeerID_reply___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __71__OTControl_setLocalSecureElementIdentity_secureElementIdentity_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __95__OTControl_resetAccountCDPContents_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_reply___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __41__OTControl_invalidateEscrowCache_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __61__OTControl_fetchUserControllableViewsSyncStatusAsync_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __56__OTControl_fetchUserControllableViewsSyncStatus_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __62__OTControl_setUserControllableViewsSyncStatus_enabled_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __45__OTControl_fetchEscrowRecords_source_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __32__OTControl_getCDPStatus_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __33__OTControl_setCDPEnabled_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __37__OTControl_refetchCKKSPolicy_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __48__OTControl_tapToRadar_description_radar_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __60__OTControl_postCDPFollowupResult_success_type_error_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __41__OTControl_waitForOctagonUpgrade_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __39__OTControl_simulateReceivePush_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __60__OTControl_healthCheck_skipRateLimitingCheck_repair_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __76__OTControl_createInheritanceKey_uuid_claimTokenData_wrappingKeyData_reply___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __53__OTControl_recreateInheritanceKey_uuid_oldIK_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __44__OTControl_checkInheritanceKey_uuid_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __45__OTControl_removeInheritanceKey_uuid_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __66__OTControl_preflightJoinWithInheritanceKey_inheritanceKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __57__OTControl_joinWithInheritanceKey_inheritanceKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __42__OTControl_storeInheritanceKey_ik_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __47__OTControl_generateInheritanceKey_uuid_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __45__OTControl_createInheritanceKey_uuid_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __50__OTControl_checkCustodianRecoveryKey_uuid_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __51__OTControl_removeCustodianRecoveryKey_uuid_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __78__OTControl_preflightJoinWithCustodianRecoveryKey_custodianRecoveryKey_reply___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __69__OTControl_joinWithCustodianRecoveryKey_custodianRecoveryKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __51__OTControl_createCustodianRecoveryKey_uuid_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __51__OTControl_joinWithRecoveryKey_recoveryKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __49__OTControl_createRecoveryKey_recoveryKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __39__OTControl_fetchEscrowContents_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __54__OTControl_restoreFromBottle_entropy_bottleID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __48__OTControl_fetchAllViableBottles_source_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __43__OTControl_peerDeviceNamesByPeerID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __49__OTControl_removeFriendsInClique_peerIDs_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __31__OTControl_leaveClique_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __29__OTControl_establish_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __130__OTControl_resetAndEstablish_resetReason_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_accountSettings_isGuitarfish_reply___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __44__OTControl_startOctagonStateMachine_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __50__OTControl_fetchTrustStatus_configuration_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __51__OTControl_fetchCliqueStatus_configuration_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __34__OTControl_fetchEgoPeerID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __26__OTControl_status_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __73__OTControl_rpcJoinWithArguments_configuration_vouchData_vouchSig_reply___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __73__OTControl_rpcJoinWithArguments_configuration_vouchData_vouchSig_reply___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __134__OTControl_rpcVoucherWithArguments_configuration_peerID_permanentInfo_permanentInfoSig_stableInfo_stableInfoSig_maxCapability_reply___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __134__OTControl_rpcVoucherWithArguments_configuration_peerID_permanentInfo_permanentInfoSig_stableInfo_stableInfoSig_maxCapability_reply___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __76__OTControl_rpcPrepareIdentityAsApplicantWithArguments_configuration_reply___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __76__OTControl_rpcPrepareIdentityAsApplicantWithArguments_configuration_reply___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __55__OTControl_rpcEpochWithArguments_configuration_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __55__OTControl_rpcEpochWithArguments_configuration_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __56__OTControl_notifyIDMSTrustLevelChangeForAltDSID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __56__OTControl_notifyIDMSTrustLevelChangeForAltDSID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __41__OTControl_appleAccountSignedOut_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __41__OTControl_appleAccountSignedOut_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __40__OTControl_appleAccountSignedIn_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __40__OTControl_appleAccountSignedIn_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

+ (id)controlObject:(id *)a3
{
  return +[OTControl controlObject:error:](&OBJC_CLASS___OTControl, "controlObject:error:", 0LL, a3);
}

+ (id)controlObject:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  v13[1] = *MEMORY[0x1895F89C0];
  id v6 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.security.octagon" options:0];
  if (v6)
  {
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C541270];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    OTSetupControlProtocol(v7);
    objc_claimAutoreleasedReturnValue();

    [v6 setRemoteObjectInterface:v7];
    [v6 resume];
    a4 = -[OTControl initWithConnection:sync:](objc_alloc(&OBJC_CLASS___OTControl), "initWithConnection:sync:", v6, v5);
  }

  else if (a4)
  {
    id v8 = (void *)MEMORY[0x189607870];
    uint64_t v9 = *MEMORY[0x189607670];
    uint64_t v12 = *MEMORY[0x1896075E0];
    v13[0] = @"Couldn't create connection (no reason given)";
    [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 errorWithDomain:v9 code:-67671 userInfo:v10];
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0LL;
  }

  return a4;
}

@end