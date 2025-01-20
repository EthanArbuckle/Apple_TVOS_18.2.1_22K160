@interface OctagonControlServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation OctagonControlServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.private.octagon"]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if (objc_opt_isKindOfClass(v5, v6) & 1) != 0 && ([v5 BOOLValue])
  {
    v7 = sub_10001267C("octagon");
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 67109376;
      unsigned int v18 = [v4 processIdentifier];
      __int16 v19 = 1024;
      LODWORD(v20) = [v4 effectiveUserIdentifier];
      _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "received connection from client pid %d (euid %u)",  (uint8_t *)&v17,  0xEu);
    }

    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___OTControlProtocol));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SecXPCHelper safeErrorClasses](&OBJC_CLASS___SecXPCHelper, "safeErrorClasses"));
    [v9 setClasses:v10 forSelector:"appleAccountSignedIn:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"appleAccountSignedOut:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"notifyIDMSTrustLevelChangeForAltDSID:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"rpcEpochWithArguments:configuration:reply:" argumentIndex:1 ofReply:1];
    [v9 setClasses:v10 forSelector:"rpcPrepareIdentityAsApplicantWithArguments:configuration:reply:" argumentIndex:5 ofReply:1];
    [v9 setClasses:v10 forSelector:"rpcVoucherWithArguments:configuration:peerID:permanentInfo:permanentInfoSig:stableInfo:stableInfoSig:maxCapability:reply:" argumentIndex:2 ofReply:1];
    [v9 setClasses:v10 forSelector:"rpcJoinWithArguments:configuration:vouchData:vouchSig:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"status:reply:" argumentIndex:1 ofReply:1];
    [v9 setClasses:v10 forSelector:"status:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"fetchEgoPeerID:reply:" argumentIndex:1 ofReply:1];
    [v9 setClasses:v10 forSelector:"fetchCliqueStatus:configuration:reply:" argumentIndex:1 ofReply:1];
    [v9 setClasses:v10 forSelector:"fetchTrustStatus:configuration:reply:" argumentIndex:4 ofReply:1];
    [v9 setClasses:v10 forSelector:"startOctagonStateMachine:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"resetAndEstablish:resetReason:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:isGuitarfish:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"establish:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"leaveClique:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"removeFriendsInClique:peerIDs:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"peerDeviceNamesByPeerID:reply:" argumentIndex:1 ofReply:1];
    [v9 setClasses:v10 forSelector:"fetchAllViableBottles:source:reply:" argumentIndex:2 ofReply:1];
    [v9 setClasses:v10 forSelector:"restoreFromBottle:entropy:bottleID:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"fetchEscrowContents:reply:" argumentIndex:3 ofReply:1];
    [v9 setClasses:v10 forSelector:"createRecoveryKey:recoveryKey:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"joinWithRecoveryKey:recoveryKey:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"healthCheck:skipRateLimitingCheck:repair:reply:" argumentIndex:1 ofReply:1];
    [v9 setClasses:v10 forSelector:"simulateReceivePush:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"waitForOctagonUpgrade:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"postCDPFollowupResult:success:type:error:reply:" argumentIndex:3 ofReply:0];
    [v9 setClasses:v10 forSelector:"postCDPFollowupResult:success:type:error:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"tapToRadar:description:radar:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"refetchCKKSPolicy:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"setCDPEnabled:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"getCDPStatus:reply:" argumentIndex:1 ofReply:1];
    [v9 setClasses:v10 forSelector:"fetchEscrowRecords:source:reply:" argumentIndex:1 ofReply:1];
    [v9 setClasses:v10 forSelector:"setUserControllableViewsSyncStatus:enabled:reply:" argumentIndex:1 ofReply:1];
    [v9 setClasses:v10 forSelector:"fetchUserControllableViewsSyncStatus:reply:" argumentIndex:1 ofReply:1];
    [v9 setClasses:v10 forSelector:"resetAccountCDPContents:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"setLocalSecureElementIdentity:secureElementIdentity:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"removeLocalSecureElementIdentityPeerID:secureElementIdentityPeerID:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"fetchTrustedSecureElementIdentities:reply:" argumentIndex:1 ofReply:1];
    [v9 setClasses:v10 forSelector:"setAccountSetting:setting:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"fetchAccountSettings:reply:" argumentIndex:1 ofReply:1];
    [v9 setClasses:v10 forSelector:"fetchAccountWideSettingsWithForceFetch:arguments:reply:" argumentIndex:1 ofReply:1];
    [v9 setClasses:v10 forSelector:"waitForPriorityViewKeychainDataRecovery:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"createCustodianRecoveryKey:uuid:reply:" argumentIndex:1 ofReply:1];
    [v9 setClasses:v10 forSelector:"joinWithCustodianRecoveryKey:custodianRecoveryKey:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"preflightJoinWithCustodianRecoveryKey:custodianRecoveryKey:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"removeCustodianRecoveryKey:uuid:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"createInheritanceKey:uuid:reply:" argumentIndex:1 ofReply:1];
    [v9 setClasses:v10 forSelector:"generateInheritanceKey:uuid:reply:" argumentIndex:1 ofReply:1];
    [v9 setClasses:v10 forSelector:"storeInheritanceKey:ik:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"joinWithInheritanceKey:inheritanceKey:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"preflightJoinWithInheritanceKey:inheritanceKey:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"removeInheritanceKey:uuid:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"tlkRecoverabilityForEscrowRecordData:recordData:source:reply:" argumentIndex:1 ofReply:1];
    [v9 setClasses:v10 forSelector:"setMachineIDOverride:machineID:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"isRecoveryKeySet:reply:" argumentIndex:1 ofReply:1];
    [v9 setClasses:v10 forSelector:"recoverWithRecoveryKey:recoveryKey:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"removeRecoveryKey:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"preflightRecoverOctagonUsingRecoveryKey:recoveryKey:reply:" argumentIndex:1 ofReply:1];
    [v9 setClasses:v10 forSelector:"clearCliqueFromAccount:resetReason:isGuitarfish:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"performCKServerUnreadableDataRemoval:isGuitarfish:altDSID:reply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v10 forSelector:"totalTrustedPeers:reply:" argumentIndex:1 ofReply:1];
    [v9 setClasses:v10 forSelector:"areRecoveryKeysDistrusted:reply:" argumentIndex:1 ofReply:1];

    [v4 setExportedInterface:v9];
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonXPCEntitlementChecker createWithManager:entitlementBearer:]( &OBJC_CLASS___OctagonXPCEntitlementChecker,  "createWithManager:entitlementBearer:",  v11,  v4));
    [v4 setExportedObject:v12];

    [v4 resume];
    BOOL v13 = 1;
  }

  else
  {
    v14 = sub_10001267C("SecError");
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 67109378;
      unsigned int v18 = [v4 processIdentifier];
      __int16 v19 = 2112;
      v20 = @"com.apple.private.octagon";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "octagon: Client pid: %d doesn't have entitlement: %@",  (uint8_t *)&v17,  0x12u);
    }

    BOOL v13 = 0;
  }

  return v13;
}

@end