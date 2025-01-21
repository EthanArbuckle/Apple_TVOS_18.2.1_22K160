@interface OTControlCLI
+ (id)annotateStatus:(id)a3;
- (OTControl)control;
- (OTControlCLI)initWithOTControl:(id)a3;
- (int)checkAndPrintEscrowRecords:(id)a3 error:(id)a4 json:(BOOL)a5;
- (int)checkCustodianRecoveryKeyWithArguments:(id)a3 uuidString:(id)a4 timeout:(double)a5;
- (int)checkInheritanceKeyWithArguments:(id)a3 uuidString:(id)a4 timeout:(double)a5;
- (int)checkRecoveryKeyWithArguments:(id)a3;
- (int)createCustodianRecoveryKeyWithArguments:(id)a3 uuidString:(id)a4 json:(BOOL)a5 timeout:(double)a6;
- (int)createInheritanceKeyWithArguments:(id)a3 uuidString:(id)a4 json:(BOOL)a5 timeout:(double)a6;
- (int)createInheritanceKeyWithClaimTokenAndWrappingKey:(id)a3 uuidString:(id)a4 claimToken:(id)a5 wrappingKey:(id)a6 json:(BOOL)a7 timeout:(double)a8;
- (int)depart:(id)a3;
- (int)disableWalrusWithArguments:(id)a3 timeout:(double)a4;
- (int)disableWebAccessWithArguments:(id)a3 timeout:(double)a4;
- (int)enableWalrusWithArguments:(id)a3 timeout:(double)a4;
- (int)enableWebAccessWithArguments:(id)a3 timeout:(double)a4;
- (int)fetchAccountSettingsWithArguments:(id)a3 json:(BOOL)a4;
- (int)fetchAccountWideSettingsWithArguments:(id)a3 useDefault:(BOOL)a4 forceFetch:(BOOL)a5 json:(BOOL)a6;
- (int)fetchAllBottles:(id)a3 control:(id)a4 overrideEscrowCache:(BOOL)a5;
- (int)fetchAllEscrowRecords:(id)a3 json:(BOOL)a4 overrideEscrowCache:(BOOL)a5;
- (int)fetchEscrowRecords:(id)a3 json:(BOOL)a4 overrideEscrowCache:(BOOL)a5;
- (int)fetchUserControllableViewsSyncStatus:(id)a3;
- (int)generateInheritanceKeyWithArguments:(id)a3 json:(BOOL)a4 timeout:(double)a5;
- (int)healthCheck:(id)a3 skipRateLimitingCheck:(BOOL)a4 repair:(BOOL)a5 json:(BOOL)a6;
- (int)joinWithCustodianRecoveryKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7;
- (int)joinWithInheritanceKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7;
- (int)joinWithRecoveryKeyWithArguments:(id)a3 recoveryKey:(id)a4;
- (int)performEscrowRecovery:(id)a3 recordID:(id)a4 appleID:(id)a5 secret:(id)a6 overrideForAccountScript:(BOOL)a7 overrideEscrowCache:(BOOL)a8;
- (int)performSilentEscrowRecovery:(id)a3 appleID:(id)a4 secret:(id)a5;
- (int)preflightJoinWithCustodianRecoveryKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7;
- (int)preflightJoinWithInheritanceKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7;
- (int)preflightJoinWithRecoveryKeyWithArguments:(id)a3 recoveryKey:(id)a4;
- (int)printAccountMetadataWithArguments:(id)a3 json:(BOOL)a4;
- (int)recoverUsingBottleID:(id)a3 entropy:(id)a4 arguments:(id)a5 control:(id)a6;
- (int)recreateInheritanceKeyWithArguments:(id)a3 uuidString:(id)a4 wrappingKey:(id)a5 wrappedKey:(id)a6 claimToken:(id)a7 json:(BOOL)a8 timeout:(double)a9;
- (int)refetchCKKSPolicy:(id)a3;
- (int)removeCustodianRecoveryKeyWithArguments:(id)a3 uuidString:(id)a4 timeout:(double)a5;
- (int)removeInheritanceKeyWithArguments:(id)a3 uuidString:(id)a4 timeout:(double)a5;
- (int)removeRecoveryKeyWithArguments:(id)a3;
- (int)rerollWithArguments:(id)a3 json:(BOOL)a4;
- (int)reset:(id)a3 appleID:(id)a4 isGuitarfish:(BOOL)a5 dsid:(id)a6;
- (int)resetAccountCDPContentsWithArguments:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6;
- (int)resetOctagon:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 isGuitarfish:(BOOL)a7 timeout:(double)a8;
- (int)resetProtectedData:(id)a3 appleID:(id)a4 dsid:(id)a5 idmsTargetContext:(id)a6 idmsCuttlefishPassword:(id)a7 isGuitarfish:(BOOL)a8 notifyIdMS:(BOOL)a9;
- (int)setMachineIDOverride:(id)a3 machineID:(id)a4 json:(BOOL)a5;
- (int)setRecoveryKeyWithArguments:(id)a3;
- (int)setUserControllableViewsSyncStatus:(id)a3 enabled:(BOOL)a4;
- (int)signIn:(id)a3;
- (int)signOut:(id)a3;
- (int)simulateReceivePush:(id)a3 json:(BOOL)a4;
- (int)startOctagonStateMachine:(id)a3;
- (int)status:(id)a3 json:(BOOL)a4;
- (int)storeInheritanceKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7;
- (int)tapToRadar:(id)a3 description:(id)a4 radar:(id)a5;
- (int)tlkRecoverability:(id)a3;
- (void)printCRKWithPeer:(id)a3 information:(id)a4 prefix:(id)a5;
- (void)printPeer:(id)a3 prefix:(id)a4;
- (void)printPeers:(id)a3 egoPeerID:(id)a4 informationOnPeers:(id)a5 informationOnCRKs:(id)a6;
- (void)setControl:(id)a3;
@end

@implementation OTControlCLI

- (OTControlCLI)initWithOTControl:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___OTControlCLI;
  v6 = -[OTControlCLI init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_control, a3);
  }

  return v7;
}

- (int)startOctagonStateMachine:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0LL;
  objc_super v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  int v11 = 1;
  id v5 = [self control];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100010B18;
  v7[3] = &unk_1000204C0;
  v7[4] = &v8;
  [v5 startOctagonStateMachine:v4 reply:v7];

  LODWORD(v5) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return (int)v5;
}

- (int)signIn:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0LL;
  objc_super v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  int v11 = 1;
  id v5 = [self control];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100010A8C;
  v7[3] = &unk_1000204C0;
  v7[4] = &v8;
  [v5 appleAccountSignedIn:v4 reply:v7];

  LODWORD(v5) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return (int)v5;
}

- (int)signOut:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0LL;
  objc_super v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  int v11 = 1;
  id v5 = [self control];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100010A00;
  v7[3] = &unk_1000204C0;
  v7[4] = &v8;
  [v5 appleAccountSignedOut:v4 reply:v7];

  LODWORD(v5) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return (int)v5;
}

- (int)depart:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0LL;
  objc_super v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  int v11 = 1;
  id v5 = [self control];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100010974;
  v7[3] = &unk_1000204C0;
  v7[4] = &v8;
  [v5 leaveClique:v4 reply:v7];

  LODWORD(v5) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return (int)v5;
}

- (int)resetOctagon:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 isGuitarfish:(BOOL)a7 timeout:(double)a8
{
  BOOL v10 = a6;
  v14 = &v31;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v18 = [NSDate dateWithTimeIntervalSinceNow:a8];
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  int v35 = 1;
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  char v31 = -86;
  do
  {
    char *v14 = 0;
    v19 = [self control];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000108A8;
    v24[3] = &unk_1000204E8;
    id v20 = v18;
    id v25 = v20;
    v26 = &v28;
    v27 = &v32;
    LOBYTE(v23) = a7;
    [v19 resetAndEstablish:v15 resetReason:1 idmsTargetContext:v16 idmsCuttlefishPassword:v17 notifyIdMS:v10 accountSettings:0 isGuitarfish:v23 reply:v24];

    v14 = (char *)(v29 + 3);
  }

  while (*((_BYTE *)v29 + 24));
  int v21 = *((_DWORD *)v33 + 6);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v21;
}

- (int)resetProtectedData:(id)a3 appleID:(id)a4 dsid:(id)a5 idmsTargetContext:(id)a6 idmsCuttlefishPassword:(id)a7 isGuitarfish:(BOOL)a8 notifyIdMS:(BOOL)a9
{
  BOOL v9 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = objc_alloc_init(&OBJC_CLASS___OTConfigurationContext);
  id v20 = sub_10000D5A8(v17, v16);
  int v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  [v19 setPasswordEquivalentToken:v21];
  [v19 setAuthenticationAppleID:v17];

  v22 = [v18 altDSID];
  [v19 setAltDSID:v22];

  uint64_t v23 = (void *)[v18 contextID];
  [v19 setContext:v23];

  v24 = [v18 containerName];
  [v19 setContainerName:v24];

  [v19 setIsGuitarfish:v9];
  id v32 = 0LL;
  id v25 = [OBJC_CLASS___OTClique resetProtectedData:v19 idmsTargetContext:v15 idmsCuttlefishPassword:v14 notifyIdMS:a9 error:&v32];

  id v26 = v32;
  v27 = v26;
  if (!v25 || v26)
  {
    v29 = __stderrp;
    id v30 = [v26 description];
    fprintf(v29, "resetProtectedData failed: %s\n", (const char *)[v30 UTF8String]);

    int v28 = 1;
  }

  else
  {
    puts("resetProtectedData succeeded");
    int v28 = 0;
  }

  return v28;
}

- (void)printPeer:(id)a3 prefix:(id)a4
{
  id v27 = a4;
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"peerID"];
  v7 = [v5 objectForKeyedSubscript:@"permanentInfo"];
  uint64_t v8 = (void *)[v7 objectForKeyedSubscript:@"model_id"];

  BOOL v9 = [v5 objectForKeyedSubscript:@"permanentInfo"];
  id v26 = [v9 objectForKeyedSubscript:@"epoch"];

  BOOL v10 = [v5 objectForKeyedSubscript:@"stableInfo"];
  int v11 = (void *)[v10 objectForKeyedSubscript:@"device_name"];

  v12 = [v5 objectForKeyedSubscript:@"stableInfo"];
  v13 = [v12 objectForKeyedSubscript:@"serial_number"];

  id v14 = [v5 objectForKeyedSubscript:@"stableInfo"];
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"os_version"]);

  if (v27) {
    id v25 = (const char *)[v27 UTF8String];
  }
  else {
    id v25 = (const char *)&unk_10001D76E;
  }
  id v16 = v6;
  v24 = (const char *)[v16 UTF8String];
  id v17 = v8;
  id v18 = (const char *)[v17 UTF8String];
  id v19 = v11;
  id v20 = (const char *)[v19 UTF8String];
  id v21 = v13;
  v22 = (const char *)[v21 UTF8String];
  id v23 = v15;
  printf( "%s%s hw:'%s' name:'%s' serial: '%s' os:'%s' epoch:%d\n",  v25,  v24,  v18,  v20,  v22,  (const char *)[v23 UTF8String],  [v26 intValue]);
}

- (void)printCRKWithPeer:(id)a3 information:(id)a4 prefix:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  BOOL v10 = [v9 objectForKeyedSubscript:@"uuid"];
  int v11 = (void *)[v9 objectForKeyedSubscript:@"kind"];

  if (v8) {
    v12 = (const char *)[v8 UTF8String];
  }
  else {
    v12 = (const char *)&unk_10001D76E;
  }
  id v17 = v7;
  v13 = (const char *)[v17 UTF8String];
  id v14 = v10;
  id v15 = (const char *)[v14 UTF8String];
  if (v11) {
    id v16 = (const char *)[v11 UTF8String];
  }
  else {
    id v16 = "-";
  }
  printf("%s%s uuid: %s kind: %s\n", v12, v13, v15, v16);
}

- (void)printPeers:(id)a3 egoPeerID:(id)a4 informationOnPeers:(id)a5 informationOnCRKs:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v23 = a6;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v13 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v10);
        }
        id v17 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        id v18 = [v12 objectForKeyedSubscript:v17];
        if (v18)
        {
          if ([v17 isEqualToString:v11])
          {
            id v19 = self;
            id v20 = v18;
            id v21 = @"    Self: ";
          }

          else
          {
            id v19 = self;
            id v20 = v18;
            id v21 = @"    Peer: ";
          }

          -[OTControlCLI printPeer:prefix:](v19, "printPeer:prefix:", v20, v21);
        }

        else
        {
          v22 = (void *)[v23 objectForKeyedSubscript:v17];
          if (v22) {
            -[OTControlCLI printCRKWithPeer:information:prefix:]( self,  "printCRKWithPeer:information:prefix:",  v17,  v22,  @"    CRK: ");
          }
          else {
            printf( "    Peer:  %s; further information missing\n",
          }
              (const char *)[v17 UTF8String]);
        }
      }

      id v14 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v14);
  }
}

- (int)checkAndPrintEscrowRecords:(id)a3 error:(id)a4 json:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7 || v8)
  {
    if (v5)
    {
      v58 = @"error";
      v36 = [v8 description];
      v59 = v36;
      int v37 = 1;
      v38 = [NSDictionary dictionaryWithObjects:forKeys:count:&v59, &v58, 1LL];
      sub_10000D8EC(v38);
    }

    else
    {
      v39 = __stderrp;
      id v40 = [v8 description];
      fprintf(v39, "fetching escrow records failed: %s\n", (const char *)[v40 UTF8String]);

      int v37 = 1;
    }
  }

  else
  {
    BOOL v47 = v5;
    if (!v5)
    {
      id v10 = [v7 count];
      id v11 = [v7 count];
      id v12 = "s";
      if (v11 == (id)1) {
        id v12 = (const char *)&unk_10001D76E;
      }
      printf("Successfully fetched %lu record%s.\n", v10, v12);
    }

    id v13 = [NSMutableArray array];
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    id v46 = v7;
    id obj = v7;
    id v14 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v55;
      do
      {
        id v17 = 0LL;
        do
        {
          if (*(void *)v55 != v16) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)v17);
          id v19 = [v18 escrowInformationMetadata];
          uint64_t v20 = [v19 peerInfo];
          if (!v20)
          {

LABEL_17:
            uint64_t v29 = [v18 recordId];
LABEL_18:
            id v30 = (void *)v29;
            [v13 addObject:v29];

            goto LABEL_19;
          }

          id v21 = (void *)v20;
          v22 = [v18 escrowInformationMetadata];
          id v23 = [v22 peerInfo];
          id v24 = [v23 bytes];

          if (!v24) {
            goto LABEL_17;
          }
          id v53 = 0LL;
          __int128 v25 = (void *)[v18 escrowInformationMetadata];
          __int128 v26 = (void *)[v25 peerInfo];
          uint64_t v27 = SOSPeerInfoCreateFromData(kCFAllocatorDefault, &v53, v26);

          if (v27)
          {
            uint64_t PeerID = SOSPeerInfoGetPeerID(v27);
            uint64_t v29 = [PeerID autorelease];
            goto LABEL_18;
          }

          id v31 = v53;
          id v32 = __stderrp;
          id v33 = [v53 description];
          fprintf(v32, "Failed SOSPeerInfoCreateFromData: %s\n", (const char *)[v33 UTF8String]);

LABEL_19:
          id v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v34 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
        id v15 = v34;
      }

      while (v34);
    }

    if (v47)
    {
      v61 = @"escrowRecords";
      v62 = v13;
      id v35 = [NSDictionary dictionaryWithObjects:forKeys:count:v62, v61, 1LL];
      sub_10000D8EC(v35);
      id v7 = v46;
    }

    else
    {
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      id v35 = v13;
      id v41 = [v35 countByEnumeratingWithState:&v49 objects:v60 count:16];
      id v7 = v46;
      if (v41)
      {
        id v42 = v41;
        uint64_t v43 = *(void *)v50;
        do
        {
          for (i = 0LL; i != v42; i = (char *)i + 1)
          {
            if (*(void *)v50 != v43) {
              objc_enumerationMutation(v35);
            }
            printf( "fetched record id: %s\n", (const char *)[*(id *)(*((void *)&v49 + 1) + 8 * (void)i) UTF8String]);
          }

          id v42 = [v35 countByEnumeratingWithState:&v49 objects:v60 count:16];
        }

        while (v42);
      }
    }

    int v37 = 0;
    id v9 = 0LL;
  }

  return v37;
}

- (int)fetchEscrowRecords:(id)a3 json:(BOOL)a4 overrideEscrowCache:(BOOL)a5
{
  BOOL v5 = a4;
  if (a5) {
    uint64_t v7 = 2LL;
  }
  else {
    uint64_t v7 = 0LL;
  }
  id v8 = [a3 makeConfigurationContext];
  [v8 setEscrowFetchSource:v7];
  id v13 = 0LL;
  id v9 = [OTClique fetchEscrowRecords:v8 error:&v13];
  id v10 = v13;
  int v11 = -[OTControlCLI checkAndPrintEscrowRecords:error:json:]( self,  "checkAndPrintEscrowRecords:error:json:",  v9,  v10,  v5);

  return v11;
}

- (int)fetchAllEscrowRecords:(id)a3 json:(BOOL)a4 overrideEscrowCache:(BOOL)a5
{
  BOOL v5 = a4;
  if (a5) {
    uint64_t v7 = 2LL;
  }
  else {
    uint64_t v7 = 0LL;
  }
  id v8 = [a3 makeConfigurationContext];
  [v8 setEscrowFetchSource:v7];
  id v13 = 0LL;
  id v9 = [OBJC_CLASS___OTClique fetchAllEscrowRecords:v8 error:&v13];
  id v10 = v13;
  int v11 = -[OTControlCLI checkAndPrintEscrowRecords:error:json:]( self,  "checkAndPrintEscrowRecords:error:json:",  v9,  v10,  v5);

  return v11;
}

- (int)performEscrowRecovery:(id)a3 recordID:(id)a4 appleID:(id)a5 secret:(id)a6 overrideForAccountScript:(BOOL)a7 overrideEscrowCache:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = objc_alloc_init(&OBJC_CLASS___OTICDPRecordContext);
  id v18 = objc_alloc_init(&OBJC_CLASS___OTCDPRecoveryInformation);
  [v17 setCdpInfo:v18];

  id v19 = (void *)[v17 cdpInfo];
  [v19 setRecoverySecret:v16];

  uint64_t v20 = (void *)[v17 cdpInfo];
  [v20 setContainsIcdpData:1];

  id v21 = (void *)[v17 cdpInfo];
  [v21 setUsesMultipleIcsc:1];

  id v22 = objc_alloc_init(&OBJC_CLASS___OTEscrowAuthenticationInformation);
  [v17 setAuthInfo:v22];

  id v23 = [v17 authInfo];
  [v23 setAuthenticationAppleid:v15];

  id v24 = sub_10000D5A8(v15, 0LL);
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  __int128 v26 = (void *)[v17 authInfo];
  [v26 setAuthenticationPassword:v25];

  uint64_t v27 = (void *)[v13 makeConfigurationContext];
  int v28 = v27;
  if (v8) {
    uint64_t v29 = 2LL;
  }
  else {
    uint64_t v29 = 0LL;
  }
  [v27 setEscrowFetchSource:v29];
  [v28 setOverrideForSetupAccountScript:v9];
  id v67 = 0LL;
  v60 = v28;
  id v30 = [OTClique fetchEscrowRecords:v28 error:&v67];
  id v31 = v67;
  id v32 = v31;
  v59 = v30;
  if (!v30 || v31)
  {
    v45 = __stderrp;
    id v46 = [v31 description];
    fprintf(v45, "Failed to fetch escrow records: %s\n", (const char *)[v46 UTF8String]);

    int v47 = 1;
  }

  else
  {
    __int128 v57 = v13;
    id v58 = v17;
    id v55 = v16;
    id v56 = v15;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    id v33 = v30;
    id v34 = [v33 countByEnumeratingWithState:&v63 objects:v68 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v64;
LABEL_8:
      uint64_t v37 = 0LL;
      while (1)
      {
        if (*(void *)v64 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = *(void **)(*((void *)&v63 + 1) + 8 * v37);
        id v62 = 0LL;
        v39 = [v38 escrowInformationMetadata];
        id v40 = [v39 peerInfo];
        uint64_t v41 = SOSPeerInfoCreateFromData(kCFAllocatorDefault, &v62, v40);

        if (v41)
        {
          if ([(id)SOSPeerInfoGetPeerID(v41) isEqualToString:v14])
          {
            id v48 = v38;

            if (!v48) {
              goto LABEL_23;
            }
            id v13 = v57;
            __int128 v49 = (void *)[v57 makeConfigurationContext];
            [v49 setEscrowFetchSource:2];
            id v61 = 0LL;
            __int128 v50 = (void *)objc_claimAutoreleasedReturnValue( +[OTClique performEscrowRecovery:cdpContext:escrowRecord:error:]( &OBJC_CLASS___OTClique,  "performEscrowRecovery:cdpContext:escrowRecord:error:",  v49,  v58,  v48,  &v61));
            id v51 = v61;
            id v32 = v51;
            if (!v50 || v51)
            {
              __int128 v52 = __stderrp;
              id v53 = [v51 description];
              fprintf(v52, "Escrow recovery failed: %s\n", (const char *)[v53 UTF8String]);

              int v47 = 1;
            }

            else
            {
              puts("Successfully performed escrow recovery.");
              int v47 = 0;
            }

            goto LABEL_26;
          }
        }

        else
        {
          id v42 = v62;
          uint64_t v43 = __stderrp;
          id v44 = [v62 description];
          fprintf(v43, "Failed SOSPeerInfoCreateFromData: %s\n", (const char *)[v44 UTF8String]);
        }

        if (v35 == (id)++v37)
        {
          id v35 = [v33 countByEnumeratingWithState:&v63 objects:v68 count:16];
          if (v35) {
            goto LABEL_8;
          }
          break;
        }
      }
    }

LABEL_23:
    int v47 = 1;
    fwrite("Failed to find escrow record to restore.\n", 0x29uLL, 1uLL, __stderrp);
    id v32 = 0LL;
    id v13 = v57;
LABEL_26:
    id v16 = v55;
    id v15 = v56;
    id v17 = v58;
  }

  return v47;
}

- (int)performSilentEscrowRecovery:(id)a3 appleID:(id)a4 secret:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_alloc_init(&OBJC_CLASS___OTICDPRecordContext);
  id v11 = objc_alloc_init(&OBJC_CLASS___OTCDPRecoveryInformation);
  [v10 setCdpInfo:v11];

  id v12 = (void *)[v10 cdpInfo];
  [v12 setRecoverySecret:v8];

  id v13 = (void *)[v10 cdpInfo];
  [v13 setContainsIcdpData:1];

  id v14 = [v10 cdpInfo];
  [v14 setSilentRecoveryAttempt:1];

  id v15 = [v10 cdpInfo];
  [v15 setUsesMultipleIcsc:1];

  id v16 = objc_alloc_init(&OBJC_CLASS___OTEscrowAuthenticationInformation);
  [v10 setAuthInfo:v16];

  id v17 = [v10 authInfo];
  [v17 setAuthenticationAppleid:v9];

  id v18 = sub_10000D5A8(v9, 0LL);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  uint64_t v20 = (void *)[v10 authInfo];
  [v20 setAuthenticationPassword:v19];

  id v21 = [v7 makeConfigurationContext];
  id v32 = 0LL;
  id v22 = [OBJC_CLASS___OTClique fetchEscrowRecords:v21 error:&v32];
  id v23 = v32;

  if (!v22 || v23)
  {
    uint64_t v27 = __stderrp;
    id v25 = [v23 description];
    fprintf(v27, "Failed to fetch escrow records: %s.\n", (const char *)[v25 UTF8String]);
LABEL_8:
    int v26 = 1;
    goto LABEL_9;
  }

  id v24 = [v7 makeConfigurationContext];
  id v31 = 0LL;
  id v25 = [OBJC_CLASS___OTClique performSilentEscrowRecovery:v24 cdpContext:v10 allRecords:v22 error:&v31];
  id v23 = v31;

  if (!v25 || v23)
  {
    int v28 = __stderrp;
    id v29 = [v23 description];
    fprintf(v28, "Escrow recovery failed: %s\n", (const char *)[v29 UTF8String]);

    goto LABEL_8;
  }

  puts("Successfully performed escrow recovery.");
  int v26 = 0;
LABEL_9:

  return v26;
}

- (int)tlkRecoverability:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___OTClique);
  BOOL v5 = [v3 makeConfigurationContext];
  id v6 = [v4 initWithContextData:v5];

  if (v6)
  {
    id v7 = [v3 makeConfigurationContext];
    id v54 = 0LL;
    id v8 = [OBJC_CLASS___OTClique fetchAllEscrowRecords:v7 error:&v54];
    id v9 = v54;

    if (!v8 || v9)
    {
      id v33 = __stderrp;
      id v10 = [v9 description];
      fprintf(v33, "Failed to fetch escrow records: %s.\n", (const char *)[v10 UTF8String]);
    }

    else
    {
      __int128 v52 = 0u;
      __int128 v53 = 0u;
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      id v10 = v8;
      id v43 = [v10 countByEnumeratingWithState:&v50 objects:v56 count:16];
      if (v43)
      {
        uint64_t v36 = v8;
        id v37 = v3;
        uint64_t v11 = *(void *)v51;
        id v40 = v6;
        int v41 = 1;
        uint64_t v38 = *(void *)v51;
        id v39 = v10;
        do
        {
          for (i = 0LL; i != v43; i = (char *)i + 1)
          {
            if (*(void *)v51 != v11) {
              objc_enumerationMutation(v10);
            }
            id v13 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
            id v49 = 0LL;
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 tlkRecoverabilityForEscrowRecord:v13 error:&v49]);
            id v15 = v49;
            if (v14 && ([v14 count] ? (BOOL v16 = v15 == 0) : (BOOL v16 = 0), v16))
            {
              __int128 v47 = 0u;
              __int128 v48 = 0u;
              __int128 v45 = 0u;
              __int128 v46 = 0u;
              id v18 = v14;
              id v26 = [v18 countByEnumeratingWithState:&v45 objects:v55 count:16];
              if (v26)
              {
                id v27 = v26;
                id v42 = v15;
                uint64_t v28 = *(void *)v46;
                do
                {
                  for (j = 0LL; j != v27; j = (char *)j + 1)
                  {
                    if (*(void *)v46 != v28) {
                      objc_enumerationMutation(v18);
                    }
                    id v30 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)j);
                    id v31 = [v13 recordId];
                    printf( "%s has recoverable view: %s\n", (const char *)[v31 UTF8String], (const char *)[v30 UTF8String]);
                  }

                  id v27 = [v18 countByEnumeratingWithState:&v45 objects:v55 count:16];
                }

                while (v27);
                int v41 = 0;
                id v10 = v39;
                id v6 = v40;
                uint64_t v11 = v38;
                id v15 = v42;
              }

              else
              {
                int v41 = 0;
              }
            }

            else
            {
              id v44 = v14;
              id v17 = __stderrp;
              id v18 = [v13 recordId];
              id v19 = (const char *)[v18 UTF8String];
              uint64_t v20 = v11;
              id v21 = v6;
              id v22 = v10;
              id v23 = v15;
              id v24 = [v15 description];
              id v35 = (const char *)[v24 UTF8String];
              id v25 = v17;
              id v14 = v44;
              fprintf(v25, "%s Failed TLK recoverability check: %s\n", v19, v35);

              id v15 = v23;
              id v10 = v22;
              id v6 = v21;
              uint64_t v11 = v20;
            }
          }

          id v43 = [v10 countByEnumeratingWithState:&v50 objects:v56 count:16];
        }

        while (v43);
        id v8 = v36;
        id v3 = v37;
        id v9 = 0LL;
        int v32 = v41;
        goto LABEL_30;
      }
    }

    int v32 = 1;
LABEL_30:

    goto LABEL_31;
  }

  int v32 = 1;
  fwrite("Failed to create clique\n", 0x18uLL, 1uLL, __stderrp);
LABEL_31:

  return v32;
}

- (int)status:(id)a3 json:(BOOL)a4
{
  id v6 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = 1;
  id v7 = [self control];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000FF6C;
  v9[3] = &unk_100020510;
  BOOL v10 = a4;
  v9[4] = self;
  v9[5] = &v11;
  [v7 status:v6 reply:v9];

  LODWORD(self) = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);

  return (int)self;
}

- (int)recoverUsingBottleID:(id)a3 entropy:(id)a4 arguments:(id)a5 control:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  int v26 = 1;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10000FEB0;
  v19[3] = &unk_100020538;
  id v22 = &v23;
  id v14 = v9;
  id v20 = v14;
  id v15 = v13;
  id v21 = v15;
  [v12 restoreFromBottle:v11 entropy:v10 bottleID:v14 reply:v19];
  dispatch_time_t v16 = dispatch_time(0LL, 60000000000LL);
  if (dispatch_semaphore_wait(v15, v16)) {
    fwrite("timed out waiting for restore/recover\n", 0x26uLL, 1uLL, __stderrp);
  }
  int v17 = *((_DWORD *)v24 + 6);

  _Block_object_dispose(&v23, 8);
  return v17;
}

- (int)fetchAllBottles:(id)a3 control:(id)a4 overrideEscrowCache:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  uint64_t v38 = 0LL;
  id v39 = &v38;
  uint64_t v40 = 0x2020000000LL;
  int v41 = 1;
  v36[0] = 0LL;
  v36[1] = v36;
  v36[2] = 0x3032000000LL;
  v36[3] = sub_10000D734;
  v36[4] = sub_10000D744;
  id v37 = 0LL;
  uint64_t v30 = 0LL;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  id v33 = sub_10000D734;
  id v34 = sub_10000D744;
  id v35 = 0LL;
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  id v27 = sub_10000D734;
  uint64_t v28 = sub_10000D744;
  id v29 = 0LL;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  v18[0] = _NSConcreteStackBlock;
  if (v5) {
    uint64_t v10 = 2LL;
  }
  else {
    uint64_t v10 = 0LL;
  }
  v18[1] = 3221225472LL;
  v18[2] = sub_10000FCAC;
  v18[3] = &unk_100020560;
  id v20 = &v38;
  id v21 = v36;
  id v22 = &v30;
  uint64_t v23 = &v24;
  id v11 = v9;
  id v19 = v11;
  [v8 fetchAllViableBottles:v7 source:v10 reply:v18];
  dispatch_time_t v12 = dispatch_time(0LL, 60000000000LL);
  if (dispatch_semaphore_wait(v11, v12))
  {
    uint64_t v13 = secLogObjForScope("clique");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v17 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "findOptimalBottleIDsWithContextData failed to fetch bottles\n",  v17,  2u);
    }

    int v15 = 1;
  }

  else
  {
    [(id)v31[5] enumerateObjectsUsingBlock:&stru_1000205A0];
    [(id)v25[5] enumerateObjectsUsingBlock:&stru_1000205C0];
    int v15 = *((_DWORD *)v39 + 6);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v38, 8);

  return v15;
}

- (int)healthCheck:(id)a3 skipRateLimitingCheck:(BOOL)a4 repair:(BOOL)a5 json:(BOOL)a6
{
  uint64_t v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  uint64_t v15 = 0LL;
  dispatch_time_t v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  int v18 = 1;
  id v11 = [self control];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000FB30;
  v13[3] = &unk_1000205E8;
  BOOL v14 = a6;
  v13[4] = &v15;
  [v11 healthCheck:v10 skipRateLimitingCheck:v8 repair:v7 reply:v13];

  LODWORD(v7) = *((_DWORD *)v16 + 6);
  _Block_object_dispose(&v15, 8);

  return v7;
}

- (int)simulateReceivePush:(id)a3 json:(BOOL)a4
{
  id v6 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  int v15 = 1;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000FA04;
  v10[3] = &unk_100020610;
  BOOL v11 = a4;
  v10[4] = &v12;
  [v7 simulateReceivePush:v6 reply:v10];

  int v8 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (int)refetchCKKSPolicy:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0LL;
  dispatch_semaphore_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  int v11 = 1;
  BOOL v5 = [self control];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000F978;
  v7[3] = &unk_1000204C0;
  v7[4] = &v8;
  [v5 refetchCKKSPolicy:v4 reply:v7];

  LODWORD(v5) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return (int)v5;
}

- (int)tapToRadar:(id)a3 description:(id)a4 radar:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = 0LL;
  int v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  int v17 = 1;
  int v11 = (void *)[self control];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000F8EC;
  v13[3] = &unk_1000204C0;
  v13[4] = &v14;
  [v11 tapToRadar:v8 description:v9 radar:v10 reply:v13];

  LODWORD(v11) = *((_DWORD *)v15 + 6);
  _Block_object_dispose(&v14, 8);

  return (int)v11;
}

- (int)setUserControllableViewsSyncStatus:(id)a3 enabled:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  uint64_t v10 = 0LL;
  int v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  int v13 = 1;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000F83C;
  v9[3] = &unk_100020638;
  v9[4] = &v10;
  [v7 setUserControllableViewsSyncStatus:v6 enabled:v4 reply:v9];

  LODWORD(v4) = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);

  return v4;
}

- (int)fetchUserControllableViewsSyncStatus:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  int v11 = 1;
  BOOL v5 = [self control];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000F78C;
  v7[3] = &unk_100020638;
  v7[4] = &v8;
  [v5 fetchUserControllableViewsSyncStatus:v4 reply:v7];

  LODWORD(v5) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return (int)v5;
}

- (int)resetAccountCDPContentsWithArguments:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  int v25 = 1;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10000F700;
  v19[3] = &unk_1000206B0;
  id v21 = &v22;
  int v15 = v13;
  id v20 = v15;
  [v14 resetAccountCDPContents:v10 idmsTargetContext:v11 idmsCuttlefishPassword:v12 notifyIdMS:v6 reply:v19];

  dispatch_time_t v16 = dispatch_time(0LL, 60000000000LL);
  if (dispatch_semaphore_wait(v15, v16))
  {
    int v17 = 1;
    fwrite("timed out waiting for restore/recover\n", 0x26uLL, 1uLL, __stderrp);
    *((_DWORD *)v23 + 6) = 1;
  }

  else
  {
    int v17 = *((_DWORD *)v23 + 6);
  }

  _Block_object_dispose(&v22, 8);
  return v17;
}

- (int)createCustodianRecoveryKeyWithArguments:(id)a3 uuidString:(id)a4 json:(BOOL)a5 timeout:(double)a6
{
  id v18 = a3;
  id v10 = a4;
  if (v10)
  {
    id v11 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v10);
    if (!v11)
    {
      int v12 = 1;
      fwrite("bad format for custodianUUID\n", 0x1DuLL, 1uLL, __stderrp);
      goto LABEL_8;
    }
  }

  else
  {
    id v11 = 0LL;
  }

  dispatch_semaphore_t v13 = &v27;
  uint64_t v14 = (void *)[NSDate dateWithTimeIntervalSinceNow:a6];
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  int v31 = 1;
  uint64_t v24 = 0LL;
  int v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = -86;
  do
  {
    char *v13 = 0;
    int v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10000F5F4;
    v19[3] = &unk_100020660;
    id v16 = v14;
    id v20 = v16;
    id v21 = &v24;
    uint64_t v22 = &v28;
    BOOL v23 = a5;
    [v15 createCustodianRecoveryKey:v18 uuid:v11 reply:v19];

    dispatch_semaphore_t v13 = (char *)(v25 + 3);
  }

  while (*((_BYTE *)v25 + 24));
  int v12 = *((_DWORD *)v29 + 6);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

LABEL_8:
  return v12;
}

- (int)joinWithCustodianRecoveryKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = [NSDate dateWithTimeIntervalSinceNow:a7];
  uint64_t v40 = 0LL;
  int v41 = &v40;
  uint64_t v42 = 0x2020000000LL;
  int v43 = 1;
  uint64_t v36 = 0LL;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  char v39 = -86;
  int v17 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v13,  0LL);
  if (v17)
  {
    id v18 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v14,  0LL);
    if (v18)
    {
      id v19 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v15);
      id v20 = v19;
      if (v19)
      {
        uint64_t v30 = v19;
        id v35 = 0LL;
        id v21 = [[OTCustodianRecoveryKey alloc] initWithWrappedKey:v18 wrappingKey:v17 uuid:v19 error:&v35];
        id v22 = v35;
        id v29 = v22;
        if (v21)
        {
          BOOL v23 = v37;
          do
          {
            *((_BYTE *)v23 + 24) = 0;
            uint64_t v24 = (void *)[self control];
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472LL;
            v31[2] = sub_10000F528;
            v31[3] = &unk_1000204E8;
            id v32 = v16;
            id v33 = &v36;
            id v34 = &v40;
            [v24 joinWithCustodianRecoveryKey:v12 custodianRecoveryKey:v21 reply:v31];

            BOOL v23 = v37;
          }

          while (*((_BYTE *)v37 + 24));
          int v25 = *((_DWORD *)v41 + 6);
        }

        else
        {
          uint64_t v26 = __stderrp;
          id v27 = [v22 description];
          fprintf(v26, "failed to create OTCustodianRecoveryKey: %s\n", (const char *)[v27 UTF8String]);

          int v25 = 1;
        }

        id v20 = v30;
      }

      else
      {
        int v25 = 1;
        fwrite("bad format for custodianUUID\n", 0x1DuLL, 1uLL, __stderrp);
      }
    }

    else
    {
      int v25 = 1;
      fwrite("bad base64 data for wrappedKey\n", 0x1FuLL, 1uLL, __stderrp);
    }
  }

  else
  {
    int v25 = 1;
    fwrite("bad base64 data for wrappingKey\n", 0x20uLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v25;
}

- (int)preflightJoinWithCustodianRecoveryKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = [NSDate dateWithTimeIntervalSinceNow:a7];
  uint64_t v40 = 0LL;
  int v41 = &v40;
  uint64_t v42 = 0x2020000000LL;
  int v43 = 1;
  uint64_t v36 = 0LL;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  char v39 = -86;
  int v17 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v13,  0LL);
  if (v17)
  {
    id v18 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v14,  0LL);
    if (v18)
    {
      id v19 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v15);
      id v20 = v19;
      if (v19)
      {
        uint64_t v30 = v19;
        id v35 = 0LL;
        id v21 = [[OTCustodianRecoveryKey alloc] initWithWrappedKey:v18 wrappingKey:v17 uuid:v19 error:&v35];
        id v22 = v35;
        id v29 = v22;
        if (v21)
        {
          BOOL v23 = v37;
          do
          {
            *((_BYTE *)v23 + 24) = 0;
            uint64_t v24 = (void *)[self control];
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472LL;
            v31[2] = sub_10000F45C;
            v31[3] = &unk_1000204E8;
            id v32 = v16;
            id v33 = &v36;
            id v34 = &v40;
            [v24 preflightJoinWithCustodianRecoveryKey:v12 custodianRecoveryKey:v21 reply:v31];

            BOOL v23 = v37;
          }

          while (*((_BYTE *)v37 + 24));
          int v25 = *((_DWORD *)v41 + 6);
        }

        else
        {
          uint64_t v26 = __stderrp;
          id v27 = [v22 description];
          fprintf(v26, "failed to create OTCustodianRecoveryKey: %s\n", (const char *)[v27 UTF8String]);

          int v25 = 1;
        }

        id v20 = v30;
      }

      else
      {
        int v25 = 1;
        fwrite("bad format for custodianUUID\n", 0x1DuLL, 1uLL, __stderrp);
      }
    }

    else
    {
      int v25 = 1;
      fwrite("bad base64 data for wrappedKey\n", 0x1FuLL, 1uLL, __stderrp);
    }
  }

  else
  {
    int v25 = 1;
    fwrite("bad base64 data for wrappingKey\n", 0x20uLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v25;
}

- (int)removeCustodianRecoveryKeyWithArguments:(id)a3 uuidString:(id)a4 timeout:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [NSDate dateWithTimeIntervalSinceNow:a5];
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  int v28 = 1;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = -86;
  id v11 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v9);
  if (v11)
  {
    id v16 = v9;
    id v12 = v22;
    do
    {
      *((_BYTE *)v12 + 24) = 0;
      id v13 = [self control:v16];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10000F390;
      v17[3] = &unk_1000204E8;
      id v18 = v10;
      id v19 = &v21;
      id v20 = &v25;
      [v13 removeCustodianRecoveryKey:v8 uuid:v11 reply:v17];

      id v12 = v22;
    }

    while (*((_BYTE *)v22 + 24));
    int v14 = *((_DWORD *)v26 + 6);
    id v9 = v16;
  }

  else
  {
    int v14 = 1;
    fwrite("bad format for custodianUUID\n", 0x1DuLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (int)checkCustodianRecoveryKeyWithArguments:(id)a3 uuidString:(id)a4 timeout:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [NSDate dateWithTimeIntervalSinceNow:a5];
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  int v28 = 1;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = -86;
  id v11 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v9);
  if (v11)
  {
    id v16 = v9;
    id v12 = v22;
    do
    {
      *((_BYTE *)v12 + 24) = 0;
      id v13 = [self control:v16];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10000F28C;
      v17[3] = &unk_100020688;
      id v18 = v10;
      id v19 = &v21;
      id v20 = &v25;
      [v13 checkCustodianRecoveryKey:v8 uuid:v11 reply:v17];

      id v12 = v22;
    }

    while (*((_BYTE *)v22 + 24));
    int v14 = *((_DWORD *)v26 + 6);
    id v9 = v16;
  }

  else
  {
    int v14 = 1;
    fwrite("bad format for custodianUUID\n", 0x1DuLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (int)removeRecoveryKeyWithArguments:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  int v11 = 1;
  BOOL v5 = [self control];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000F200;
  v7[3] = &unk_1000204C0;
  v7[4] = &v8;
  [v5 removeRecoveryKey:v4 reply:v7];

  LODWORD(v5) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return (int)v5;
}

- (int)setRecoveryKeyWithArguments:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  int v21 = 1;
  id v17 = 0LL;
  uint64_t v5 = SecRKCreateRecoveryKeyString(&v17);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v17;
  uint64_t v8 = v7;
  if (!v6 || v7)
  {
    int v11 = __stderrp;
    id v12 = [v7 description];
    fprintf(v11, "failed to create recovery key: %s\n", (const char *)[v12 UTF8String]);

    int v10 = *((_DWORD *)v19 + 6);
  }

  else
  {
    id v9 = [self control];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10000F164;
    v14[3] = &unk_1000206B0;
    id v15 = v6;
    id v16 = &v18;
    [v9 createRecoveryKey:v4 recoveryKey:v15 reply:v14];

    int v10 = *((_DWORD *)v19 + 6);
  }

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (int)joinWithRecoveryKeyWithArguments:(id)a3 recoveryKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  int v17 = 1;
  uint64_t v8 = (void *)[self control];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000F0C8;
  v11[3] = &unk_1000206B0;
  id v9 = v7;
  id v12 = v9;
  id v13 = &v14;
  [v8 joinWithRecoveryKey:v6 recoveryKey:v9 reply:v11];

  LODWORD(v8) = *((_DWORD *)v15 + 6);
  _Block_object_dispose(&v14, 8);

  return (int)v8;
}

- (int)checkRecoveryKeyWithArguments:(id)a3
{
  id v3 = [a3 makeConfigurationContext];
  id v12 = 0LL;
  unsigned int v4 = +[OTClique isRecoveryKeySet:error:](&OBJC_CLASS___OTClique, "isRecoveryKeySet:error:", v3, &v12);
  id v5 = v12;
  id v6 = v5;
  if (v5)
  {
    id v7 = __stderrp;
    id v8 = [v5 description];
    fprintf(v7, "check recovery key failed: %s\n", (const char *)[v8 UTF8String]);

    int v9 = 1;
  }

  else
  {
    int v10 = "not set";
    if (v4) {
      int v10 = "set";
    }
    printf("recovery key is %s\n", v10);
    int v9 = v4 ^ 1;
  }

  return v9;
}

- (int)preflightJoinWithRecoveryKeyWithArguments:(id)a3 recoveryKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  int v17 = 1;
  id v8 = [self control];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000F00C;
  v11[3] = &unk_1000206D8;
  id v9 = v7;
  id v12 = v9;
  id v13 = &v14;
  [v8 preflightRecoverOctagonUsingRecoveryKey:v6 recoveryKey:v9 reply:v11];

  LODWORD(v8) = *((_DWORD *)v15 + 6);
  _Block_object_dispose(&v14, 8);

  return (int)v8;
}

- (int)createInheritanceKeyWithArguments:(id)a3 uuidString:(id)a4 json:(BOOL)a5 timeout:(double)a6
{
  id v18 = a3;
  id v10 = a4;
  if (v10)
  {
    int v11 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v10);
    if (!v11)
    {
      int v12 = 1;
      fwrite("bad format for inheritanceUUID\n", 0x1FuLL, 1uLL, __stderrp);
      goto LABEL_8;
    }
  }

  else
  {
    int v11 = 0LL;
  }

  id v13 = &v27;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", a6));
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  int v31 = 1;
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = -86;
  do
  {
    char *v13 = 0;
    id v15 = -[OTControlCLI control](self, "control");
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10000EF00;
    v19[3] = &unk_100020700;
    id v16 = v14;
    id v20 = v16;
    int v21 = &v24;
    id v22 = &v28;
    BOOL v23 = a5;
    [v15 createInheritanceKey:v18 uuid:v11 reply:v19];

    id v13 = (char *)(v25 + 3);
  }

  while (*((_BYTE *)v25 + 24));
  int v12 = *((_DWORD *)v29 + 6);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

LABEL_8:
  return v12;
}

- (int)generateInheritanceKeyWithArguments:(id)a3 json:(BOOL)a4 timeout:(double)a5
{
  id v8 = &v23;
  id v9 = a3;
  id v10 = [NSDate dateWithTimeIntervalSinceNow:a5];
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  int v27 = 1;
  uint64_t v20 = 0LL;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = -86;
  do
  {
    *id v8 = 0;
    int v11 = (void *)[self control];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10000EE04;
    v15[3] = &unk_100020700;
    id v12 = v10;
    id v16 = v12;
    int v17 = &v20;
    id v18 = &v24;
    BOOL v19 = a4;
    [v11 generateInheritanceKey:v9 uuid:0 reply:v15];

    id v8 = (char *)(v21 + 3);
  }

  while (*((_BYTE *)v21 + 24));
  int v13 = *((_DWORD *)v25 + 6);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v13;
}

- (int)storeInheritanceKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = [NSDate dateWithTimeIntervalSinceNow:a7];
  uint64_t v39 = 0LL;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000LL;
  int v42 = 1;
  uint64_t v35 = 0LL;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000LL;
  char v38 = -86;
  int v17 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v13,  0LL);
  if (v17)
  {
    id v18 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v14,  0LL);
    if (v18)
    {
      BOOL v19 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v15);
      uint64_t v20 = v19;
      if (v19)
      {
        id v29 = v19;
        id v34 = 0LL;
        id v21 = [[OTInheritanceKey alloc] initWithWrappedKeyData:v18 wrappingKeyData:v17 uuid:v19 error:&v34];
        id v22 = v34;
        uint64_t v28 = v22;
        if (v21)
        {
          char v23 = v36;
          do
          {
            *((_BYTE *)v23 + 24) = 0;
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTControlCLI control](self, "control"));
            v30[0] = _NSConcreteStackBlock;
            v30[1] = 3221225472LL;
            v30[2] = sub_10000ED50;
            v30[3] = &unk_1000204E8;
            id v31 = v16;
            id v32 = &v35;
            id v33 = &v39;
            [v24 storeInheritanceKey:v12 ik:v21 reply:v30];

            char v23 = v36;
          }

          while (*((_BYTE *)v36 + 24));
          int v25 = *((_DWORD *)v40 + 6);
        }

        else
        {
          id v26 = [v22 description];
          printf("failed to create OTInheritanceKey: %s\n", (const char *)[v26 UTF8String]);

          int v25 = 1;
        }

        uint64_t v20 = v29;
      }

      else
      {
        puts("bad format for inheritanceUUID");
        int v25 = 1;
      }
    }

    else
    {
      puts("bad base64 data for wrappedKey");
      int v25 = 1;
    }
  }

  else
  {
    puts("bad base64 data for wrappingKey");
    int v25 = 1;
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  return v25;
}

- (int)joinWithInheritanceKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = [NSDate dateWithTimeIntervalSinceNow:a7];
  uint64_t v40 = 0LL;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000LL;
  int v43 = 1;
  uint64_t v36 = 0LL;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  char v39 = -86;
  int v17 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v13,  0LL);
  if (v17)
  {
    id v18 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v14,  0LL);
    if (v18)
    {
      BOOL v19 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v15);
      uint64_t v20 = v19;
      if (v19)
      {
        uint64_t v30 = v19;
        id v35 = 0LL;
        id v21 = [[OTInheritanceKey alloc] initWithWrappedKeyData:v18 wrappingKeyData:v17 uuid:v19 error:&v35];
        id v22 = v35;
        id v29 = v22;
        if (v21)
        {
          char v23 = v37;
          do
          {
            *((_BYTE *)v23 + 24) = 0;
            uint64_t v24 = (void *)[self control];
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472LL;
            v31[2] = sub_10000EC84;
            v31[3] = &unk_1000204E8;
            id v32 = v16;
            id v33 = &v36;
            id v34 = &v40;
            [v24 joinWithInheritanceKey:v12 inheritanceKey:v21 reply:v31];

            char v23 = v37;
          }

          while (*((_BYTE *)v37 + 24));
          int v25 = *((_DWORD *)v41 + 6);
        }

        else
        {
          id v26 = __stderrp;
          id v27 = [v22 description];
          fprintf(v26, "failed to create OTInheritanceKey: %s\n", (const char *)[v27 UTF8String]);

          int v25 = 1;
        }

        uint64_t v20 = v30;
      }

      else
      {
        int v25 = 1;
        fwrite("bad format for inheritanceUUID\n", 0x1FuLL, 1uLL, __stderrp);
      }
    }

    else
    {
      int v25 = 1;
      fwrite("bad base64 data for wrappedKey\n", 0x1FuLL, 1uLL, __stderrp);
    }
  }

  else
  {
    int v25 = 1;
    fwrite("bad base64 data for wrappingKey\n", 0x20uLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v25;
}

- (int)preflightJoinWithInheritanceKeyWithArguments:(id)a3 wrappingKey:(id)a4 wrappedKey:(id)a5 uuidString:(id)a6 timeout:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = [NSDate dateWithTimeIntervalSinceNow:a7];
  uint64_t v40 = 0LL;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000LL;
  int v43 = 1;
  uint64_t v36 = 0LL;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  char v39 = -86;
  int v17 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v13,  0LL);
  if (v17)
  {
    id v18 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v14,  0LL);
    if (v18)
    {
      BOOL v19 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v15);
      uint64_t v20 = v19;
      if (v19)
      {
        uint64_t v30 = v19;
        id v35 = 0LL;
        id v21 = [[OTInheritanceKey alloc] initWithWrappedKeyData:v18 wrappingKeyData:v17 uuid:v19 error:&v35];
        id v22 = v35;
        id v29 = v22;
        if (v21)
        {
          char v23 = v37;
          do
          {
            *((_BYTE *)v23 + 24) = 0;
            uint64_t v24 = (void *)[self control];
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472LL;
            v31[2] = sub_10000EBB8;
            v31[3] = &unk_1000204E8;
            id v32 = v16;
            id v33 = &v36;
            id v34 = &v40;
            [v24 preflightJoinWithInheritanceKey:v12 inheritanceKey:v21 reply:v31];

            char v23 = v37;
          }

          while (*((_BYTE *)v37 + 24));
          int v25 = *((_DWORD *)v41 + 6);
        }

        else
        {
          id v26 = __stderrp;
          id v27 = [v22 description];
          fprintf(v26, "failed to create OTInheritanceKey: %s\n", (const char *)[v27 UTF8String]);

          int v25 = 1;
        }

        uint64_t v20 = v30;
      }

      else
      {
        int v25 = 1;
        fwrite("bad format for inheritanceUUID\n", 0x1FuLL, 1uLL, __stderrp);
      }
    }

    else
    {
      int v25 = 1;
      fwrite("bad base64 data for wrappedKey\n", 0x1FuLL, 1uLL, __stderrp);
    }
  }

  else
  {
    int v25 = 1;
    fwrite("bad base64 data for wrappingKey\n", 0x20uLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v25;
}

- (int)removeInheritanceKeyWithArguments:(id)a3 uuidString:(id)a4 timeout:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [NSDate dateWithTimeIntervalSinceNow:a5];
  uint64_t v25 = 0LL;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  int v28 = 1;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = -86;
  int v11 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v9);
  if (v11)
  {
    id v16 = v9;
    id v12 = v22;
    do
    {
      *((_BYTE *)v12 + 24) = 0;
      id v13 = -[OTControlCLI control:v16];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10000EAEC;
      v17[3] = &unk_1000204E8;
      id v18 = v10;
      BOOL v19 = &v21;
      uint64_t v20 = &v25;
      [v13 removeInheritanceKey:v8 uuid:v11 reply:v17];

      id v12 = v22;
    }

    while (*((_BYTE *)v22 + 24));
    int v14 = *((_DWORD *)v26 + 6);
    id v9 = v16;
  }

  else
  {
    int v14 = 1;
    fwrite("bad format for inheritanceUUID\n", 0x1FuLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (int)checkInheritanceKeyWithArguments:(id)a3 uuidString:(id)a4 timeout:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [NSDate dateWithTimeIntervalSinceNow:a5];
  uint64_t v25 = 0LL;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  int v28 = 1;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = -86;
  int v11 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v9);
  if (v11)
  {
    id v16 = v9;
    id v12 = v22;
    do
    {
      *((_BYTE *)v12 + 24) = 0;
      id v13 = [self control:v16];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10000E9E8;
      v17[3] = &unk_100020688;
      id v18 = v10;
      BOOL v19 = &v21;
      uint64_t v20 = &v25;
      [v13 checkInheritanceKey:v8 uuid:v11 reply:v17];

      id v12 = v22;
    }

    while (*((_BYTE *)v22 + 24));
    int v14 = *((_DWORD *)v26 + 6);
    id v9 = v16;
  }

  else
  {
    int v14 = 1;
    fwrite("bad format for inheritanceUUID\n", 0x1FuLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (int)recreateInheritanceKeyWithArguments:(id)a3 uuidString:(id)a4 wrappingKey:(id)a5 wrappedKey:(id)a6 claimToken:(id)a7 json:(BOOL)a8 timeout:(double)a9
{
  id v37 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  if (v16)
  {
    uint64_t v20 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v16);
    if (!v20)
    {
      int v21 = 1;
      fwrite("bad format for inheritanceUUID\n", 0x1FuLL, 1uLL, __stderrp);
      goto LABEL_20;
    }
  }

  else
  {
    uint64_t v20 = 0LL;
  }

  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", a9));
  uint64_t v48 = 0LL;
  id v49 = &v48;
  uint64_t v50 = 0x2020000000LL;
  int v51 = 1;
  uint64_t v44 = 0LL;
  __int128 v45 = &v44;
  uint64_t v46 = 0x2020000000LL;
  char v47 = -86;
  id v22 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v17,  0LL);
  if (v22)
  {
    uint64_t v23 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v18,  0LL);
    if (v23)
    {
      char v24 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v19,  0LL);
      if (v24)
      {
        id v34 = v23;
        id v35 = v22;
        id v33 = objc_alloc_init(&OBJC_CLASS___NSUUID);
        id v43 = 0LL;
        id v25 = [[OTInheritanceKey alloc] initWithWrappedKeyData:v23 wrappingKeyData:v22 claimTokenData:v24 uuid:v33 error:&v43];
        id v26 = v43;
        id v32 = v26;
        if (v25)
        {
          uint64_t v27 = v45;
          do
          {
            *((_BYTE *)v27 + 24) = 0;
            int v28 = (void *)[self control];
            v38[0] = _NSConcreteStackBlock;
            v38[1] = 3221225472LL;
            v38[2] = sub_10000E8DC;
            v38[3] = &unk_100020700;
            id v39 = v36;
            uint64_t v40 = &v44;
            uint64_t v41 = &v48;
            BOOL v42 = a8;
            [v28 recreateInheritanceKey:v37 uuid:v20 oldIK:v25 reply:v38];

            uint64_t v27 = v45;
          }

          while (*((_BYTE *)v45 + 24));
          int v21 = *((_DWORD *)v49 + 6);
        }

        else
        {
          id v29 = __stderrp;
          id v30 = [v26 description];
          fprintf(v29, "failed to create OTInheritanceKey: %s\n", (const char *)[v30 UTF8String]);

          int v21 = 1;
        }

        uint64_t v23 = v34;
        id v22 = v35;
      }

      else
      {
        int v21 = 1;
        fwrite("bad base64 data for claimToken\n", 0x1FuLL, 1uLL, __stderrp);
      }
    }

    else
    {
      int v21 = 1;
      fwrite("bad base64 data for wrappedKey\n", 0x1FuLL, 1uLL, __stderrp);
    }
  }

  else
  {
    int v21 = 1;
    fwrite("bad base64 data for wrappingKey\n", 0x20uLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

LABEL_20:
  return v21;
}

- (int)createInheritanceKeyWithClaimTokenAndWrappingKey:(id)a3 uuidString:(id)a4 claimToken:(id)a5 wrappingKey:(id)a6 json:(BOOL)a7 timeout:(double)a8
{
  id v26 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v13)
  {
    id v25 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v13);
    if (!v25)
    {
      int v16 = 1;
      fwrite("bad format for inheritanceUUID\n", 0x1FuLL, 1uLL, __stderrp);
      goto LABEL_14;
    }
  }

  else
  {
    id v25 = 0LL;
  }

  id v17 = [NSDate dateWithTimeIntervalSinceNow:a8];
  uint64_t v36 = 0LL;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  int v39 = 1;
  uint64_t v32 = 0LL;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  char v35 = -86;
  id v18 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v15,  0LL);
  if (v18)
  {
    id v19 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v14,  0LL);
    if (v19)
    {
      id v23 = v15;
      uint64_t v20 = v33;
      do
      {
        *((_BYTE *)v20 + 24) = 0;
        int v21 = (void *)[self control];
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472LL;
        v27[2] = sub_10000E640;
        v27[3] = &unk_100020700;
        id v28 = v17;
        id v29 = &v32;
        id v30 = &v36;
        BOOL v31 = a7;
        [v21 createInheritanceKey:v26 uuid:v25 claimTokenData:v19 wrappingKeyData:v18 reply:v27];

        uint64_t v20 = v33;
      }

      while (*((_BYTE *)v33 + 24));
      int v16 = *((_DWORD *)v37 + 6);
      id v15 = v23;
    }

    else
    {
      int v16 = 1;
      fwrite("bad base64 data for claimToken\n", 0x1FuLL, 1uLL, __stderrp);
    }
  }

  else
  {
    int v16 = 1;
    fwrite("bad base64 data for wrappingKey\n", 0x20uLL, 1uLL, __stderrp);
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

LABEL_14:
  return v16;
}

- (int)disableWebAccessWithArguments:(id)a3 timeout:(double)a4
{
  id v15 = a3;
  id v6 = [NSDate dateWithTimeIntervalSinceNow:a4];
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  int v27 = 1;
  uint64_t v20 = 0LL;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = -86;
  id v7 = objc_alloc_init(&OBJC_CLASS___OTAccountSettings);
  id v8 = objc_alloc_init(&OBJC_CLASS___OTWebAccess);
  [v8 setEnabled:0];
  [v7 setWebAccess:v8];
  id v14 = v8;
  id v9 = v21;
  do
  {
    *((_BYTE *)v9 + 24) = 0;
    id v10 = [self control:v14];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10000E574;
    v16[3] = &unk_1000204E8;
    id v11 = v6;
    id v17 = v11;
    id v18 = &v20;
    id v19 = &v24;
    [v10 setAccountSetting:v15 setting:v7 reply:v16];

    id v9 = v21;
  }

  while (*((_BYTE *)v21 + 24));
  int v12 = *((_DWORD *)v25 + 6);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (int)enableWebAccessWithArguments:(id)a3 timeout:(double)a4
{
  id v15 = a3;
  id v6 = [NSDate dateWithTimeIntervalSinceNow:a4];
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  int v27 = 1;
  uint64_t v20 = 0LL;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = -86;
  id v7 = objc_alloc_init(&OBJC_CLASS___OTAccountSettings);
  id v8 = objc_alloc_init(&OBJC_CLASS___OTWebAccess);
  [v8 setEnabled:1];
  [v7 setWebAccess:v8];
  id v14 = v8;
  id v9 = v21;
  do
  {
    *((_BYTE *)v9 + 24) = 0;
    id v10 = -[OTControlCLI control:v14];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10000E4A8;
    v16[3] = &unk_1000204E8;
    id v11 = v6;
    id v17 = v11;
    id v18 = &v20;
    id v19 = &v24;
    [v10 setAccountSetting:v15 setting:v7 reply:v16];

    id v9 = v21;
  }

  while (*((_BYTE *)v21 + 24));
  int v12 = *((_DWORD *)v25 + 6);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (int)enableWalrusWithArguments:(id)a3 timeout:(double)a4
{
  id v15 = a3;
  id v6 = [NSDate dateWithTimeIntervalSinceNow:a4];
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  int v27 = 1;
  uint64_t v20 = 0LL;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = -86;
  id v7 = objc_alloc_init(&OBJC_CLASS___OTAccountSettings);
  id v8 = objc_alloc_init(&OBJC_CLASS___OTWalrus);
  [v8 setEnabled:1];
  [v7 setWalrus:v8];
  id v14 = v8;
  id v9 = v21;
  do
  {
    *((_BYTE *)v9 + 24) = 0;
    id v10 = [self control:v14];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10000E3DC;
    v16[3] = &unk_1000204E8;
    id v11 = v6;
    id v17 = v11;
    id v18 = &v20;
    id v19 = &v24;
    [v10 setAccountSetting:v15 setting:v7 reply:v16];

    id v9 = v21;
  }

  while (*((_BYTE *)v21 + 24));
  int v12 = *((_DWORD *)v25 + 6);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (int)disableWalrusWithArguments:(id)a3 timeout:(double)a4
{
  id v15 = a3;
  id v6 = [NSDate dateWithTimeIntervalSinceNow:a4];
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  int v27 = 1;
  uint64_t v20 = 0LL;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = -86;
  id v7 = objc_alloc_init(&OBJC_CLASS___OTAccountSettings);
  id v8 = objc_alloc_init(&OBJC_CLASS___OTWalrus);
  [v8 setEnabled:0];
  [v7 setWalrus:v8];
  id v14 = v8;
  id v9 = v21;
  do
  {
    *((_BYTE *)v9 + 24) = 0;
    id v10 = [self control:v14];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10000E310;
    v16[3] = &unk_1000204E8;
    id v11 = v6;
    id v17 = v11;
    id v18 = &v20;
    id v19 = &v24;
    [v10 setAccountSetting:v15 setting:v7 reply:v16];

    id v9 = v21;
  }

  while (*((_BYTE *)v21 + 24));
  int v12 = *((_DWORD *)v25 + 6);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (int)fetchAccountSettingsWithArguments:(id)a3 json:(BOOL)a4
{
  id v6 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  int v15 = 1;
  id v7 = [self control];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000E0A4;
  v10[3] = &unk_100020728;
  BOOL v11 = a4;
  v10[4] = &v12;
  [v7 fetchAccountSettings:v6 reply:v10];

  int v8 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (int)fetchAccountWideSettingsWithArguments:(id)a3 useDefault:(BOOL)a4 forceFetch:(BOOL)a5 json:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = [v9 makeConfigurationContext];
  if (v8)
  {
    uint64_t v28 = 0LL;
    BOOL v11 = (id *)&v28;
    uint64_t v12 = [OBJC_CLASS___OTClique fetchAccountWideSettingsDefaultWithForceFetch:v7 configuration:v10 error:&v28];
  }

  else
  {
    uint64_t v27 = 0LL;
    BOOL v11 = (id *)&v27;
    uint64_t v12 = [OTClique fetchAccountWideSettingsWithForceFetch:v7 configuration:v10 error:&v27];
  }

  id v13 = (void *)v12;
  id v14 = *v11;

  if (v14)
  {
    if (v6)
    {
      BOOL v31 = @"error";
      id v15 = [v14 description];
      id v32 = v15;
      int v16 = 1;
      id v17 = [NSDictionary dictionaryWithObjects:forKeys:count:&v32, &v31, 1LL];
      sub_10000D8EC(v17);
    }

    else
    {
      uint64_t v22 = __stderrp;
      id v15 = [v14 description];
      fprintf(v22, "Failed to fetch account wide settings: %s\n", (const char *)[v15 UTF8String]);
      int v16 = 1;
    }
  }

  else
  {
    if (v6)
    {
      v29[0] = @"walrus";
      id v18 = [v13 walrus];
      id v19 = [NSNumber numberWithBool:[v18 enabled]];
      v29[1] = @"webAccess";
      v30[0] = v19;
      uint64_t v20 = (void *)[v13 webAccess];
      int v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v20 enabled]));
      v30[1] = v21;
      id v15 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];

      sub_10000D8EC(v15);
    }

    else
    {
      puts("successfully fetched account wide settings!");
      char v23 = (void *)[v13 walrus];
      else {
        uint64_t v24 = @"NO";
      }
      printf("walrus enabled? %s\n", (const char *)-[__CFString UTF8String](v24, "UTF8String"));

      id v15 = [v13 webAccess];
      else {
        id v25 = @"NO";
      }
      printf("web access enabled? %s\n", (const char *)-[__CFString UTF8String](v25, "UTF8String"));
    }

    int v16 = 0;
  }

  return v16;
}

- (int)setMachineIDOverride:(id)a3 machineID:(id)a4 json:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v15 = 0LL;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  int v18 = 1;
  id v10 = [self control];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000DF8C;
  v13[3] = &unk_100020610;
  BOOL v14 = a5;
  v13[4] = &v15;
  [v10 setMachineIDOverride:v8 machineID:v9 reply:v13];

  int v11 = *((_DWORD *)v16 + 6);
  _Block_object_dispose(&v15, 8);

  return v11;
}

- (int)printAccountMetadataWithArguments:(id)a3 json:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = [self control];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000DE3C;
  v9[3] = &unk_100020748;
  BOOL v10 = a4;
  [v7 getAccountMetadata:v6 reply:v9];

  return 1;
}

- (int)rerollWithArguments:(id)a3 json:(BOOL)a4
{
  id v6 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  int v15 = 1;
  BOOL v7 = [self control];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000D7D4;
  v10[3] = &unk_100020610;
  BOOL v11 = a4;
  v10[4] = &v12;
  [v7 reroll:v6 reply:v10];

  int v8 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (int)reset:(id)a3 appleID:(id)a4 isGuitarfish:(BOOL)a5 dsid:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(&OBJC_CLASS___OTConfigurationContext);
  id v13 = sub_10000D5A8(v10, v9);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  [v12 setPasswordEquivalentToken:v14];
  [v12 setAuthenticationAppleID:v10];

  int v15 = (void *)[v11 altDSID];
  [v12 setAltDSID:v15];

  int v16 = (void *)[v11 contextID];
  [v12 setContext:v16];

  uint64_t v17 = (void *)[v11 containerName];
  [v12 setContainerName:v17];

  [v12 setIsGuitarfish:v6];
  id v25 = 0LL;
  unsigned __int8 v18 = +[OTClique clearCliqueFromAccount:error:]( &OBJC_CLASS___OTClique,  "clearCliqueFromAccount:error:",  v12,  &v25);
  id v19 = v25;
  uint64_t v20 = v19;
  if (v19 || (v18 & 1) == 0)
  {
    uint64_t v22 = __stderrp;
    id v23 = [v19 description];
    fprintf(v22, "Failed to wipe account data: %s\n", (const char *)[v23 UTF8String]);

    int v21 = 1;
  }

  else
  {
    puts("Account data wiped.");
    int v21 = 0;
  }

  return v21;
}

- (OTControl)control
{
  return (OTControl *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setControl:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)annotateStatus:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v3));
  id v5 = [v4 objectForKeyedSubscript:@"contextDump"];

  if (v5)
  {
    BOOL v6 = [v4 objectForKeyedSubscript:@"contextDump"];
    BOOL v7 = +[NSMutableDictionary dictionaryWithDictionary:v6];

    [v4 setObject:v7 forKeyedSubscript:@"contextDump"];
    int v8 = (void *)[v7 objectForKeyedSubscript:@"self"];

    if (v8)
    {
      id v9 = [v7 objectForKeyedSubscript:@"self"];
      id v10 = [v9 objectForKeyedSubscript:@"dynamicInfo"];

      if (v10)
      {
        id v11 = (void *)[v9 objectForKeyedSubscript:@"dynamicInfo"];
        id v12 = [v11 objectForKeyedSubscript:@"included"];
        if (v12)
        {
          id v13 = objc_alloc(&OBJC_CLASS___NSSet);
          uint64_t v14 = (void *)[v11 objectForKeyedSubscript:@"included"];
          uint64_t v34 = -[NSSet initWithArray:](v13, "initWithArray:", v14);
        }

        else
        {
          uint64_t v34 = objc_alloc_init(&OBJC_CLASS___NSSet);
        }

        int v16 = (void *)[v11 objectForKeyedSubscript:@"excluded"];
        if (v16)
        {
          uint64_t v17 = objc_alloc(&OBJC_CLASS___NSSet);
          unsigned __int8 v18 = (void *)[v11 objectForKeyedSubscript:@"excluded"];
          id v19 = -[NSSet initWithArray:](v17, "initWithArray:", v18);
        }

        else
        {
          id v19 = objc_alloc_init(&OBJC_CLASS___NSSet);
        }

        uint64_t v20 = (void *)[v7 objectForKeyedSubscript:@"custodian_recovery_keys"];
        if (v20)
        {
          id v30 = v9;
          id v32 = v4;
          id v33 = v3;
          int v21 = [NSMutableArray array];
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          __int128 v37 = 0u;
          __int128 v38 = 0u;
          BOOL v31 = v7;
          uint64_t v22 = (void *)[v7 objectForKeyedSubscript:@"custodian_recovery_keys"];
          id v23 = [v22 countByEnumeratingWithState:&v35 objects:v39 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v36;
            do
            {
              for (i = 0LL; i != v24; i = (char *)i + 1)
              {
                if (*(void *)v36 != v25) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  *(void *)(*((void *)&v35 + 1) + 8LL * (void)i)));
                uint64_t v28 = (void *)[v27 objectForKeyedSubscript:@"peerID"];
                if (-[NSSet containsObject:](v34, "containsObject:", v28)) {
                  [v27 setObject:&__kCFBooleanTrue forKeyedSubscript:@"trusted_by_self"];
                }
                if (-[NSSet containsObject:](v19, "containsObject:", v28)) {
                  [v27 setObject:&__kCFBooleanTrue forKeyedSubscript:@"distrusted_by_self"];
                }
                [v21 addObject:v27];
              }

              id v24 = [v22 countByEnumeratingWithState:&v35 objects:v39 count:16];
            }

            while (v24);
          }

          BOOL v7 = v31;
          [v31 setObject:v21 forKeyedSubscript:@"custodian_recovery_keys"];
          unsigned int v4 = v32;
          id v15 = v32;

          id v3 = v33;
          id v9 = v30;
        }

        else
        {
          id v15 = v3;
        }
      }

      else
      {
        id v15 = v3;
      }
    }

    else
    {
      id v15 = v3;
    }
  }

  else
  {
    id v15 = v3;
  }

  return v15;
}

@end