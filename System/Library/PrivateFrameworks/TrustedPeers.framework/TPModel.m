@interface TPModel
+ (id)pickClock:(id)a3;
+ (id)preapprovalsFromKeys:(id)a3;
- (BOOL)anyTrustedPeerDistrustsOtherPeer:(id)a3 error:(id *)a4;
- (BOOL)canIntroduceCandidate:(id)a3 withSponsor:(id)a4 toEpoch:(unint64_t)a5 underPolicy:(id)a6 disposition:(id)a7;
- (BOOL)canTrustCandidate:(id)a3 inEpoch:(unint64_t)a4;
- (BOOL)checkIntroductionForCandidate:(id)a3 stableInfo:(id)a4 withSponsorID:(id)a5 error:(id *)a6;
- (BOOL)considerPolicyFromPeerID:(id)a3 stableInfo:(id)a4 secrets:(id)a5 newestPolicyDoc:(id *)a6 error:(id *)a7;
- (BOOL)currentStatePossiblyMissingDataWithError:(id *)a3;
- (BOOL)doesOctagonContainDistrustedRecoveryKeysWithError:(id *)a3;
- (BOOL)enumeratePeersUsingBlock:(id)a3 error:(id *)a4;
- (BOOL)enumerateVouchersUsingBlock:(id)a3 error:(id *)a4;
- (BOOL)hasAnyPeersWithError:(id *)a3;
- (BOOL)hasPeerWithID:(id)a3 error:(id *)a4;
- (BOOL)hasPotentiallyTrustedPeerPreapprovingKey:(id)a3 error:(id *)a4;
- (BOOL)hasPotentiallyTrustedPeerTestingOnlyWithError:(id *)a3;
- (BOOL)hasPotentiallyTrustedPeerWithSigningKey:(id)a3 error:(id *)a4;
- (BOOL)isCustodianRecoveryKeyTrusted:(id)a3 error:(id *)a4;
- (BOOL)isRecoveryKeyEnrolledWithError:(id *)a3;
- (BOOL)isRecoveryKeyExcluded:(id)a3 error:(id *)a4;
- (BOOL)suppressInitialInfoLogging;
- (BOOL)validatePeerWithPreApproval:(id)a3 sponsor:(id)a4;
- (BOOL)validateVoucherForPeer:(id)a3 sponsor:(id)a4;
- (BOOL)verifyVoucherSignature:(id)a3;
- (NSData)recoveryEncryptionPubKey;
- (NSData)recoverySigningPubKey;
- (NSMutableDictionary)custodianRecoveryKeys;
- (TPDecrypter)decrypter;
- (TPModel)initWithDecrypter:(id)a3 dbAdapter:(id)a4;
- (TPModelDBAdapterProtocol)dbAdapter;
- (id)_iterateOverPeersWithBlock:(id)a3 error:(id *)a4;
- (id)actualPeerWithID:(id)a3 error:(id *)a4;
- (id)allCustodianRecoveryKeyPeerIDs;
- (id)allCustodianRecoveryKeys;
- (id)allMachineIDsWithError:(id *)a3;
- (id)allPeerIDs;
- (id)allPolicyVersionsWithError:(id *)a3;
- (id)allRegisteredPolicyVersionsWithError:(id *)a3;
- (id)allTrustedPeersWithCurrentRecoveryKeyWithError:(id *)a3;
- (id)bestRecoveryKeyForStableInfo:(id)a3 vouchers:(id)a4 error:(id *)a5;
- (id)bestWalrusAcrossTrustedPeersWithError:(id *)a3;
- (id)bestWalrusForStableInfo:(id)a3 walrusStableChanges:(id)a4 error:(id *)a5;
- (id)bestWebAccessAcrossTrustedPeersWithError:(id *)a3;
- (id)bestWebAccessForStableInfo:(id)a3 webAccessStableChanges:(id)a4 error:(id *)a5;
- (id)calculateDynamicInfoForPeerWithID:(id)a3 addingPeerIDs:(id)a4 removingPeerIDs:(id)a5 preapprovedKeys:(id)a6 signingKeyPair:(id)a7 currentMachineIDs:(id)a8 error:(id *)a9;
- (id)calculateDynamicInfoFromModel:(id)a3 peer:(id)a4 peerPermanentInfo:(id)a5 peerStableInfo:(id)a6 startingDynamicInfo:(id)a7 addingPeerIDs:(id)a8 removingPeerIDs:(id)a9 preapprovedKeys:(id)a10 signingKeyPair:(id)a11 currentMachineIDs:(id)a12 sponsorPeerID:(id)a13 error:(id *)a14;
- (id)considerCandidateID:(id)a3 withSponsorID:(id)a4 sponsorPermanentInfo:(id)a5 toExpandIncludedPeerIDs:(id)a6 andExcludedPeerIDs:(id)a7 dispositions:(id)a8 currentMachineIDs:(id)a9 forEpoch:(unint64_t)a10;
- (id)considerPreapprovalsSponsoredByPeer:(id)a3 toRecursivelyExpandIncludedPeerIDs:(id)a4 andExcludedPeerIDs:(id)a5 dispositions:(id)a6 currentMachineIDs:(id)a7 forEpoch:(unint64_t)a8;
- (id)copyPeerWithNewDynamicInfo:(id)a3 forPeerWithID:(id)a4 error:(id *)a5;
- (id)copyPeerWithNewStableInfo:(id)a3 forPeerWithID:(id)a4 error:(id *)a5;
- (id)createDynamicInfoWithIncludedPeerIDs:(id)a3 excludedPeerIDs:(id)a4 dispositions:(id)a5 preapprovals:(id)a6 signingKeyPair:(id)a7 error:(id *)a8;
- (id)createStableInfoWithFrozenPolicyVersion:(id)a3 flexiblePolicyVersion:(id)a4 policySecrets:(id)a5 syncUserControllableViews:(int)a6 secureElementIdentity:(id)a7 walrusSetting:(id)a8 webAccess:(id)a9 deviceName:(id)a10 serialNumber:(id)a11 osVersion:(id)a12 signingKeyPair:(id)a13 recoverySigningPubKey:(id)a14 recoveryEncryptionPubKey:(id)a15 isInheritedAccount:(BOOL)a16 error:(id *)a17;
- (id)createVoucherForCandidate:(id)a3 stableInfo:(id)a4 withSponsorID:(id)a5 reason:(unint64_t)a6 signingKeyPair:(id)a7 error:(id *)a8;
- (id)custodianPeerWithID:(id)a3;
- (id)dynamicInfoForJoiningPeerID:(id)a3 peerPermanentInfo:(id)a4 peerStableInfo:(id)a5 sponsorID:(id)a6 preapprovedKeys:(id)a7 signingKeyPair:(id)a8 currentMachineIDs:(id)a9 error:(id *)a10;
- (id)filterPeerList:(id)a3 byMachineIDs:(id)a4 sponsorPeerID:(id)a5 dispositions:(id)a6;
- (id)filterPreapprovals:(id)a3 forExistingPeers:(id)a4;
- (id)findCustodianRecoveryKeyWithUUID:(id)a3;
- (id)getDynamicInfoForPeerWithID:(id)a3 error:(id *)a4;
- (id)getPeerIDsTrustedByPeerWithDynamicInfo:(id)a3 toAccessView:(id)a4 error:(id *)a5;
- (id)getPeerIDsTrustedByPeerWithID:(id)a3 toAccessView:(id)a4 error:(id *)a5;
- (id)getStableInfoForPeerWithID:(id)a3 error:(id *)a4;
- (id)getViewsForCRK:(id)a3 donorPermanentInfo:(id)a4 donorStableInfo:(id)a5 error:(id *)a6;
- (id)getViewsForPeer:(id)a3 stableInfo:(id)a4 error:(id *)a5;
- (id)peerCountsByMachineIDWithError:(id *)a3;
- (id)peerIDThatTrustsCustodianRecoveryKeys:(id)a3 canIntroducePeer:(id)a4 stableInfo:(id)a5 error:(id *)a6;
- (id)peerIDThatTrustsRecoveryKeys:(id)a3 canIntroducePeer:(id)a4 stableInfo:(id)a5 error:(id *)a6;
- (id)peerWithID:(id)a3 error:(id *)a4;
- (id)peersWithMachineID:(id)a3 error:(id *)a4;
- (id)policyForPeerIDs:(id)a3 candidatePeerID:(id)a4 candidateStableInfo:(id)a5 error:(id *)a6;
- (id)policyWithVersion:(unint64_t)a3 error:(id *)a4;
- (id)possibleSponsorsForCustodianRecoveryKey:(id)a3 block:(id)a4 error:(id *)a5;
- (id)possibleSponsorsForRecoveryKey:(id)a3 block:(id)a4 error:(id *)a5;
- (id)recoveryEncryptionPublicKey;
- (id)recoveryKeyPeerID:(id)a3;
- (id)recoverySigningPublicKey;
- (id)recursivelyExpandIncludedPeerIDs:(id)a3 andExcludedPeerIDs:(id)a4 dispositions:(id)a5 withPeersTrustedBySponsorID:(id)a6 currentMachineIDs:(id)a7 forEpoch:(unint64_t)a8;
- (id)untrustedPeerIDsWithError:(id *)a3;
- (id)vectorClockWithError:(id *)a3;
- (id)viablePeerCountsByModelIDWithError:(id *)a3;
- (int)userViewSyncabilityConsensusAmongTrustedPeers:(id)a3 error:(id *)a4;
- (unint64_t)latestEpochAmongPeerIDs:(id)a3 error:(id *)a4;
- (unint64_t)maxClockWithError:(id *)a3;
- (unint64_t)peerCountWithError:(id *)a3;
- (unint64_t)statusOfPeerWithID:(id)a3 error:(id *)a4;
- (unint64_t)trustedPeerCountWithError:(id *)a3;
- (unint64_t)voucherCountWithError:(id *)a3;
- (void)considerVouchersSponsoredByPeerID:(id)a3 sponsorPermanentInfo:(id)a4 toRecursivelyExpandIncludedPeerIDs:(id)a5 andExcludedPeerIDs:(id)a6 dispositions:(id)a7 currentMachineIDs:(id)a8 forEpoch:(unint64_t)a9;
- (void)registerCustodianRecoveryKey:(id)a3;
- (void)removeCustodianRecoveryKey:(id)a3;
- (void)removeRecoveryKey;
- (void)setCustodianRecoveryKeys:(id)a3;
- (void)setDbAdapter:(id)a3;
- (void)setDecrypter:(id)a3;
- (void)setRecoveryEncryptionPubKey:(id)a3;
- (void)setRecoveryKeys:(id)a3;
- (void)setRecoverySigningPubKey:(id)a3;
- (void)setSuppressInitialInfoLogging:(BOOL)a3;
@end

@implementation TPModel

- (TPModel)initWithDecrypter:(id)a3 dbAdapter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TPModel;
  v9 = -[TPModel init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_suppressInitialInfoLogging = 0;
    objc_storeStrong((id *)&v9->_dbAdapter, a4);
    objc_storeStrong((id *)&v10->_decrypter, a3);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    custodianRecoveryKeys = v10->_custodianRecoveryKeys;
    v10->_custodianRecoveryKeys = v11;
  }

  return v10;
}

- (unint64_t)latestEpochAmongPeerIDs:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v21 = a4;
    unint64_t v9 = 0LL;
    uint64_t v10 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1895C3FC8]();
        id v22 = 0LL;
        -[TPModel peerWithID:error:](self, "peerWithID:error:", v12, &v22);
        objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
        id v15 = v22;
        if (v15)
        {
          id v18 = v15;
          TPModelLog();
          v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v28 = v12;
            __int16 v29 = 2114;
            id v30 = v18;
            _os_log_impl( &dword_188398000,  v19,  OS_LOG_TYPE_DEFAULT,  "error determining epoch of peerID %{public}@: %{public}@",  buf,  0x16u);
          }

          objc_autoreleasePoolPop(v13);
          if (v21)
          {
            id v18 = v18;
            unint64_t v9 = 0LL;
            id *v21 = v18;
          }

          else
          {
            unint64_t v9 = 0LL;
          }

          goto LABEL_20;
        }

        if (v14)
        {
          [v14 permanentInfo];
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          unint64_t v17 = [v16 epoch];

          if (v9 <= v17) {
            unint64_t v9 = v17;
          }
        }

        objc_autoreleasePoolPop(v13);
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  else
  {
    unint64_t v9 = 0LL;
  }

  id v18 = 0LL;
LABEL_20:

  return v9;
}

- (id)policyWithVersion:(unint64_t)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 policyWithVersion:a3 error:a4];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)allPeerIDs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = 0LL;
  [v2 allPeerIDs:&v5];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)peerCountWithError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = [v4 peerCount:a3];

  return v5;
}

- (BOOL)hasAnyPeersWithError:(id *)a3
{
  return -[TPModel peerCountWithError:](self, "peerCountWithError:", a3) != 0;
}

- (BOOL)enumeratePeersUsingBlock:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1895C3FC8]();
  -[TPModel dbAdapter](self, "dbAdapter");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __42__TPModel_enumeratePeersUsingBlock_error___block_invoke;
  v13[3] = &unk_18A22BA70;
  id v9 = v6;
  id v14 = v9;
  id v12 = 0LL;
  [v8 enumeratePeersUsingBlock:v13 error:&v12];
  id v10 = v12;

  objc_autoreleasePoolPop(v7);
  if (a4 && v10) {
    *a4 = v10;
  }

  return v10 == 0LL;
}

- (BOOL)enumerateVouchersUsingBlock:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1895C3FC8]();
  -[TPModel dbAdapter](self, "dbAdapter");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __45__TPModel_enumerateVouchersUsingBlock_error___block_invoke;
  v13[3] = &unk_18A22BA98;
  id v9 = v6;
  id v14 = v9;
  id v12 = 0LL;
  [v8 enumerateVouchersUsingBlock:v13 error:&v12];
  id v10 = v12;

  objc_autoreleasePoolPop(v7);
  if (a4 && v10) {
    *a4 = v10;
  }

  return v10 == 0LL;
}

- (unint64_t)voucherCountWithError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = [v4 voucherCount:a3];

  return v5;
}

- (id)_iterateOverPeersWithBlock:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = &v23;
  uint64_t v23 = 0LL;
  __int128 v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  __int128 v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  id v28 = (id)0xAAAAAAAAAAAAAAAALL;
  [MEMORY[0x189603FE0] set];
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (void *)MEMORY[0x1895C3FC8]();
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  id v22 = (id)0xAAAAAAAAAAAAAAAALL;
  [MEMORY[0x189603FE0] set];
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __44__TPModel__iterateOverPeersWithBlock_error___block_invoke;
  v13[3] = &unk_18A22BAC0;
  id v15 = &v23;
  v16 = &v17;
  id v9 = v6;
  id v14 = v9;
  id v12 = 0LL;
  -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v13, &v12);
  id v10 = v12;
  if (!v10)
  {
    [(id)v24[5] minusSet:v18[5]];
    uint64_t v7 = (uint64_t *)(id)v24[5];
  }

  _Block_object_dispose(&v17, 8);
  objc_autoreleasePoolPop(v8);
  if (v10)
  {
    uint64_t v7 = 0LL;
    if (a4) {
      *a4 = v10;
    }
  }

  _Block_object_dispose(&v23, 8);

  return v7;
}

- (BOOL)hasPotentiallyTrustedPeerTestingOnlyWithError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v6 = (void *)MEMORY[0x1895C3FC8](self, a2);
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000LL;
  id v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = (id)0xAAAAAAAAAAAAAAAALL;
  [MEMORY[0x189603FE0] set];
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = 0LL;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __57__TPModel_hasPotentiallyTrustedPeerTestingOnlyWithError___block_invoke;
  v12[3] = &unk_18A22BAE8;
  v12[4] = &buf;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v12, &v11);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v11;
  if (!v8)
  {
    [*(id *)(*((void *)&buf + 1) + 40) intersectSet:v7];
    BOOL v3 = [*(id *)(*((void *)&buf + 1) + 40) count] != 0;
  }

  _Block_object_dispose(&buf, 8);
  objc_autoreleasePoolPop(v6);
  if (v8)
  {
    TPModelLog();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl( &dword_188398000,  v9,  OS_LOG_TYPE_DEFAULT,  "hasPotentiallyTrustedPeer error: %{public}@",  (uint8_t *)&buf,  0xCu);
    }

    BOOL v3 = 0;
    if (a3) {
      *a3 = v8;
    }
  }

  return v3;
}

- (id)recoveryKeyPeerID:(id)a3
{
  id v3 = a3;
  ccsha384_di();
  v4 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithLength:*(void *)ccsha384_di()];
  [v3 length];
  id v5 = v3;
  [v5 bytes];

  id v6 = v4;
  [v6 mutableBytes];
  ccdigest();
  [v6 base64EncodedStringWithOptions:0];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithFormat:@"RK-%@", v7];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)allPolicyVersionsWithError:(id *)a3
{
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  uint64_t v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = (id)0xAAAAAAAAAAAAAAAALL;
  [MEMORY[0x189603FE0] set];
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = 0LL;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __38__TPModel_allPolicyVersionsWithError___block_invoke;
  v10[3] = &unk_18A22BB10;
  v10[4] = &v11;
  -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v10, &v9);
  id v5 = v9;
  id v6 = v5;
  if (v5)
  {
    id v7 = 0LL;
    if (a3) {
      *a3 = v5;
    }
  }

  else
  {
    id v7 = (id)v12[5];
  }

  _Block_object_dispose(&v11, 8);
  return v7;
}

- (id)allRegisteredPolicyVersionsWithError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 allRegisteredPolicyVersions:a3];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasPeerWithID:(id)a3 error:(id *)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = v4 != 0LL;

  return v5;
}

- (id)peerWithID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[TPModel dbAdapter](self, "dbAdapter");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 peerWithID:v6 error:a4];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyPeerWithNewStableInfo:(id)a3 forPeerWithID:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v27 = 0LL;
  -[TPModel peerWithID:error:](self, "peerWithID:error:", v9, &v27);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v27;
  id v12 = v11;
  if (v10)
  {
    id v26 = 0LL;
    [v10 peerWithUpdatedStableInfo:v8 error:&v26];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = v26;
    if (!v13)
    {
      TPModelLog();
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138543618;
        id v29 = v9;
        __int16 v30 = 2114;
        id v31 = v14;
        _os_log_impl( &dword_188398000,  v23,  OS_LOG_TYPE_DEFAULT,  "failed to update stable info for peerID %{public}@: %{public}@",  buf,  0x16u);
      }

      if (a5) {
        *a5 = v14;
      }
      goto LABEL_26;
    }

    if (-[TPModel suppressInitialInfoLogging](self, "suppressInitialInfoLogging")
      && ([v10 stableInfo], id v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, !v15))
    {
      TPModelLog();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      *(_DWORD *)__int128 buf = 138543362;
      id v29 = v9;
      v20 = "peer(%{public}@) initially loaded stable info";
    }

    else
    {
      [v10 stableInfo];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 stableInfo];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();

      TPModelLog();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (v16 != v17)
      {
        if (v19)
        {
          *(_DWORD *)__int128 buf = 138543618;
          id v29 = v9;
          __int16 v30 = 2114;
          id v31 = v8;
          v20 = "peer(%{public}@) stable info is now: %{public}@";
          v21 = v18;
          uint32_t v22 = 22;
LABEL_24:
          _os_log_impl(&dword_188398000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
        }

- (id)copyPeerWithNewDynamicInfo:(id)a3 forPeerWithID:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v27 = 0LL;
  -[TPModel peerWithID:error:](self, "peerWithID:error:", v9, &v27);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v27;
  id v12 = v11;
  if (v10)
  {
    id v26 = 0LL;
    [v10 peerWithUpdatedDynamicInfo:v8 error:&v26];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = v26;
    if (!v13)
    {
      TPModelLog();
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138543618;
        id v29 = v9;
        __int16 v30 = 2114;
        id v31 = v14;
        _os_log_impl( &dword_188398000,  v23,  OS_LOG_TYPE_DEFAULT,  "failed to update dynamic info for peerID %{public}@: %{public}@",  buf,  0x16u);
      }

      if (a5) {
        *a5 = v14;
      }
      goto LABEL_26;
    }

    if (-[TPModel suppressInitialInfoLogging](self, "suppressInitialInfoLogging")
      && ([v10 dynamicInfo], id v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, !v15))
    {
      TPModelLog();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      *(_DWORD *)__int128 buf = 138543362;
      id v29 = v9;
      v20 = "peer(%{public}@) initially loaded dynamic info";
    }

    else
    {
      [v10 dynamicInfo];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 dynamicInfo];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();

      TPModelLog();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (v16 != v17)
      {
        if (v19)
        {
          *(_DWORD *)__int128 buf = 138543618;
          id v29 = v9;
          __int16 v30 = 2114;
          id v31 = v8;
          v20 = "peer(%{public}@) dynamic info is now: %{public}@";
          v21 = v18;
          uint32_t v22 = 22;
LABEL_24:
          _os_log_impl(&dword_188398000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
        }

- (id)custodianPeerWithID:(id)a3
{
  id v4 = a3;
  -[TPModel custodianRecoveryKeys](self, "custodianRecoveryKeys");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)actualPeerWithID:(id)a3 error:(id *)a4
{
  id v9 = 0LL;
  -[TPModel peerWithID:error:](self, "peerWithID:error:", a3, &v9);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v9;
  id v7 = v6;
  if (!v5)
  {
    if (v6)
    {
      if (a4) {
        *a4 = v6;
      }
    }

    else
    {
      failWithNoPeerWithIDError(a4);
    }
  }

  return v5;
}

- (id)allMachineIDsWithError:(id *)a3
{
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  id v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = (id)0xAAAAAAAAAAAAAAAALL;
  [MEMORY[0x189603FE0] set];
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = 0LL;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __34__TPModel_allMachineIDsWithError___block_invoke;
  v10[3] = &unk_18A22BB10;
  v10[4] = &v11;
  -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v10, &v9);
  id v5 = v9;
  id v6 = v5;
  if (v5)
  {
    id v7 = 0LL;
    if (a3) {
      *a3 = v5;
    }
  }

  else
  {
    id v7 = (id)v12[5];
  }

  _Block_object_dispose(&v11, 8);
  return v7;
}

- (id)viablePeerCountsByModelIDWithError:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1895C3FC8]();
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  id v29 = __Block_byref_object_copy_;
  __int16 v30 = __Block_byref_object_dispose_;
  id v31 = (id)0xAAAAAAAAAAAAAAAALL;
  id v31 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v24 = 0LL;
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __46__TPModel_viablePeerCountsByModelIDWithError___block_invoke;
  v25[3] = &unk_18A22BAE8;
  v25[4] = &v26;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v25, &v24);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = v24;
  if (v19)
  {

    _Block_object_dispose(&v26, 8);
    objc_autoreleasePoolPop(context);
    id v8 = 0LL;
    if (a3) {
      *a3 = v19;
    }
  }

  else
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend( (id)v27[5],  "objectForKeyedSubscript:",  *(void *)(*((void *)&v20 + 1) + 8 * i),  context,  v19,  (void)v20);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v6 objectForKeyedSubscript:v13];
          id v14 = (void *)objc_claimAutoreleasedReturnValue();
          id v15 = v14;
          if (v14)
          {
            objc_msgSend(MEMORY[0x189607968], "numberWithLong:", objc_msgSend(v14, "longValue") + 1);
            id v3 = (void *)objc_claimAutoreleasedReturnValue();
            id v16 = v3;
          }

          else
          {
            id v16 = &unk_18A2345C0;
          }

          [v6 setObject:v16 forKeyedSubscript:v13];
          if (v15) {
        }
          }

        uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }

      while (v10);
    }

    _Block_object_dispose(&v26, 8);
    objc_autoreleasePoolPop(context);
    id v8 = v6;
  }

  return v8;
}

- (id)peerCountsByMachineIDWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __42__TPModel_peerCountsByMachineIDWithError___block_invoke;
  v12[3] = &unk_18A22BB38;
  id v6 = v5;
  id v13 = v6;
  id v11 = 0LL;
  -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v12, &v11);
  id v7 = v11;
  id v8 = v7;
  if (v7)
  {
    id v9 = 0LL;
    if (a3) {
      *a3 = v7;
    }
  }

  else
  {
    id v9 = v6;
  }

  return v9;
}

- (BOOL)isRecoveryKeyExcluded:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x1895C3FC8]();
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  __int128 v21 = __Block_byref_object_copy_;
  __int128 v22 = __Block_byref_object_dispose_;
  id v23 = (id)0xAAAAAAAAAAAAAAAALL;
  [MEMORY[0x189603FE0] set];
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  -[TPModel recoveryKeyPeerID:](self, "recoveryKeyPeerID:", v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __39__TPModel_isRecoveryKeyExcluded_error___block_invoke;
  v15[3] = &unk_18A22BB60;
  id v10 = v9;
  id v16 = v10;
  id v17 = &v18;
  id v14 = 0LL;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v15, &v14);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = v14;
  if (!v12)
  {
    [(id)v19[5] intersectSet:v11];
    BOOL v4 = [(id)v19[5] count] != 0;
  }

  _Block_object_dispose(&v18, 8);
  objc_autoreleasePoolPop(v8);
  if (v12)
  {
    BOOL v4 = 0;
    if (a4) {
      *a4 = v12;
    }
  }

  return v4;
}

- (id)allTrustedPeersWithCurrentRecoveryKeyWithError:(id *)a3
{
  id v5 = &v12;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = (id)0xAAAAAAAAAAAAAAAALL;
  [MEMORY[0x189603FE0] set];
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (void *)MEMORY[0x1895C3FC8]();
  id v10 = 0LL;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __58__TPModel_allTrustedPeersWithCurrentRecoveryKeyWithError___block_invoke;
  v11[3] = &unk_18A22BB60;
  v11[4] = self;
  v11[5] = &v12;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v11, &v10);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v10;
  if (!v8)
  {
    [(id)v13[5] intersectSet:v7];
    id v5 = (uint64_t *)(id)v13[5];
  }

  objc_autoreleasePoolPop(v6);
  if (v8)
  {
    id v5 = 0LL;
    if (a3) {
      *a3 = v8;
    }
  }

  _Block_object_dispose(&v12, 8);

  return v5;
}

- (BOOL)hasPotentiallyTrustedPeerPreapprovingKey:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x1895C3FC8]();
  +[TPHashBuilder hashWithAlgo:ofData:](&OBJC_CLASS___TPHashBuilder, "hashWithAlgo:ofData:", 1LL, v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  __int128 v21 = __Block_byref_object_copy_;
  __int128 v22 = __Block_byref_object_dispose_;
  id v23 = (id)0xAAAAAAAAAAAAAAAALL;
  [MEMORY[0x189603FE0] set];
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __58__TPModel_hasPotentiallyTrustedPeerPreapprovingKey_error___block_invoke;
  v15[3] = &unk_18A22BB60;
  id v10 = v9;
  id v16 = v10;
  id v17 = &v18;
  id v14 = 0LL;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v15, &v14);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = v14;
  if (!v12)
  {
    [(id)v19[5] intersectSet:v11];
    BOOL v4 = [(id)v19[5] count] != 0;
  }

  _Block_object_dispose(&v18, 8);
  objc_autoreleasePoolPop(v8);
  if (v12)
  {
    BOOL v4 = 0;
    if (a4) {
      *a4 = v12;
    }
  }

  return v4;
}

- (BOOL)anyTrustedPeerDistrustsOtherPeer:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x1895C3FC8]();
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = __Block_byref_object_copy_;
  __int128 v21 = __Block_byref_object_dispose_;
  id v22 = (id)0xAAAAAAAAAAAAAAAALL;
  [MEMORY[0x189603FE0] set];
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __50__TPModel_anyTrustedPeerDistrustsOtherPeer_error___block_invoke;
  v14[3] = &unk_18A22BB60;
  id v9 = v7;
  id v15 = v9;
  id v16 = &v17;
  id v13 = 0LL;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v14, &v13);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v13;
  if (!v11)
  {
    [(id)v18[5] intersectSet:v10];
    BOOL v4 = [(id)v18[5] count] != 0;
  }

  _Block_object_dispose(&v17, 8);
  objc_autoreleasePoolPop(v8);
  if (v11)
  {
    BOOL v4 = 0;
    if (a4) {
      *a4 = v11;
    }
  }

  return v4;
}

- (BOOL)hasPotentiallyTrustedPeerWithSigningKey:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x1895C3FC8]();
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = __Block_byref_object_copy_;
  __int128 v21 = __Block_byref_object_dispose_;
  id v22 = (id)0xAAAAAAAAAAAAAAAALL;
  [MEMORY[0x189603FE0] set];
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __57__TPModel_hasPotentiallyTrustedPeerWithSigningKey_error___block_invoke;
  v14[3] = &unk_18A22BB60;
  id v9 = v7;
  id v15 = v9;
  id v16 = &v17;
  id v13 = 0LL;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v14, &v13);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v13;
  if (!v11)
  {
    [(id)v18[5] intersectSet:v10];
    BOOL v4 = [(id)v18[5] count] != 0;
  }

  _Block_object_dispose(&v17, 8);
  objc_autoreleasePoolPop(v8);
  if (v11)
  {
    BOOL v4 = 0;
    if (a4) {
      *a4 = v11;
    }
  }

  return v4;
}

- (BOOL)validatePeerWithPreApproval:(id)a3 sponsor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 dynamicInfo];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 preapprovals];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 count];

  if (v9)
  {
    [v5 permanentInfo];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 signingPubKey];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 spki];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPHashBuilder hashWithAlgo:ofData:](&OBJC_CLASS___TPHashBuilder, "hashWithAlgo:ofData:", 1LL, v12);
    id v13 = (void *)objc_claimAutoreleasedReturnValue();

    [v6 dynamicInfo];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 preapprovals];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    char v16 = [v15 containsObject:v13];
  }

  else
  {
    char v16 = 0;
  }

  return v16;
}

- (unint64_t)statusOfPeerWithID:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  uint64_t v31 = 0LL;
  id v27 = 0LL;
  -[TPModel peerWithID:error:](self, "peerWithID:error:", v6, &v27);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v27;
  id v9 = v8;
  if (v7) {
    goto LABEL_2;
  }
  if (!v8)
  {
    v29[3] |= 0x20uLL;
LABEL_2:
    [v7 dynamicInfo];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 includedPeerIDs];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v12 = [v11 count] == 0;

    if (v12)
    {
      TPModelLog();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138543362;
        id v33 = v6;
        _os_log_impl( &dword_188398000,  v15,  OS_LOG_TYPE_DEFAULT,  "status: peerID %{public}@ has no included peer IDs?",  buf,  0xCu);
      }
    }

    else
    {
      v29[3] |= 2uLL;
    }

    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __36__TPModel_statusOfPeerWithID_error___block_invoke;
    v22[3] = &unk_18A22BB88;
    id v16 = v6;
    id v23 = v16;
    uint64_t v26 = &v28;
    id v24 = v7;
    uint64_t v25 = self;
    id v21 = 0LL;
    -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v22, &v21);
    id v9 = v21;
    TPModelLog();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v18)
      {
        *(_DWORD *)__int128 buf = 138543362;
        id v33 = v9;
        _os_log_impl( &dword_188398000,  v17,  OS_LOG_TYPE_DEFAULT,  "status: error enumerating peers: %{public}@",  buf,  0xCu);
      }

      unint64_t v14 = 0LL;
      if (a4) {
        *a4 = v9;
      }
    }

    else
    {
      if (v18)
      {
        TPPeerStatusToString(v29[3]);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)__int128 buf = 138543618;
        id v33 = v16;
        __int16 v34 = 2114;
        id v35 = v19;
        _os_log_impl( &dword_188398000,  v17,  OS_LOG_TYPE_DEFAULT,  "status: peer %{public}@ trust status is: %{public}@",  buf,  0x16u);
      }

      unint64_t v14 = v29[3];
    }

    goto LABEL_21;
  }

  TPModelLog();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543618;
    id v33 = v6;
    __int16 v34 = 2114;
    id v35 = v9;
    _os_log_impl( &dword_188398000,  v13,  OS_LOG_TYPE_DEFAULT,  "can't find peer for status %{public}@: %{public}@",  buf,  0x16u);
  }

  if (a4)
  {
    id v9 = v9;
    unint64_t v14 = 0LL;
    *a4 = v9;
  }

  else
  {
    unint64_t v14 = 0LL;
  }

- (id)getStableInfoForPeerWithID:(id)a3 error:(id *)a4
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stableInfo];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getDynamicInfoForPeerWithID:(id)a3 error:(id *)a4
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 dynamicInfo];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int)userViewSyncabilityConsensusAmongTrustedPeers:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  [v6 includedPeerIDs];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v28 = a4;
    uint64_t v10 = *(void *)v32;
    int v11 = 1;
    id v29 = v6;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v32 != v10) {
        objc_enumerationMutation(v7);
      }
      id v13 = *(void **)(*((void *)&v31 + 1) + 8 * v12);
      unint64_t v14 = (void *)MEMORY[0x1895C3FC8]();
      id v30 = 0LL;
      -[TPModel peerWithID:error:](self, "peerWithID:error:", v13, &v30);
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      id v16 = v30;
      if (v16) {
        break;
      }
      [v15 stableInfo];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      int v18 = [v17 syncUserControllableViews];

      if (v18 == 1)
      {
        TPModelLog();
        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          [v15 peerID];
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)__int128 buf = 138543362;
          uint64_t v36 = v26;
          _os_log_impl( &dword_188398000,  v25,  OS_LOG_TYPE_DEFAULT,  "Peer %{public}@ has disabled user view syncing",  buf,  0xCu);
        }

        objc_autoreleasePoolPop(v14);
        id v23 = 0LL;
LABEL_24:
        int v11 = 1;
        id v6 = v29;
        goto LABEL_25;
      }

      [v15 stableInfo];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      int v20 = [v19 syncUserControllableViews];

      if (v20 == 2)
      {
        TPModelLog();
        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          [v15 peerID];
          id v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)__int128 buf = 138543362;
          uint64_t v36 = v22;
          _os_log_impl( &dword_188398000,  v21,  OS_LOG_TYPE_DEFAULT,  "Peer %{public}@ has enabled user view syncing",  buf,  0xCu);
        }

        int v11 = 2;
      }

      objc_autoreleasePoolPop(v14);
      if (v9 == ++v12)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v39 count:16];
        id v6 = v29;
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_16;
      }
    }

    id v23 = v16;
    TPModelLog();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543618;
      uint64_t v36 = v13;
      __int16 v37 = 2114;
      id v38 = v23;
      _os_log_impl(&dword_188398000, v24, OS_LOG_TYPE_DEFAULT, "Can't find peer %{public}@: %{public}@", buf, 0x16u);
    }

    objc_autoreleasePoolPop(v14);
    if (v28)
    {
      id v23 = v23;
      *uint64_t v28 = v23;
    }

    goto LABEL_24;
  }

  int v11 = 1;
LABEL_16:

  id v23 = 0LL;
LABEL_25:

  return v11;
}

- (id)createStableInfoWithFrozenPolicyVersion:(id)a3 flexiblePolicyVersion:(id)a4 policySecrets:(id)a5 syncUserControllableViews:(int)a6 secureElementIdentity:(id)a7 walrusSetting:(id)a8 webAccess:(id)a9 deviceName:(id)a10 serialNumber:(id)a11 osVersion:(id)a12 signingKeyPair:(id)a13 recoverySigningPubKey:(id)a14 recoveryEncryptionPubKey:(id)a15 isInheritedAccount:(BOOL)a16 error:(id *)a17
{
  id v40 = a3;
  id v21 = a4;
  id v45 = a5;
  id v44 = a7;
  id v43 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  id v26 = a13;
  id v27 = a14;
  id v28 = a15;
  v46[0] = 0LL;
  unint64_t v29 = -[TPModel maxClockWithError:](self, "maxClockWithError:", v46);
  id v30 = v46[0];
  __int128 v31 = v30;
  if (v30)
  {
    __int128 v32 = v27;
    __int128 v33 = v40;
    v42 = 0LL;
    if (a17) {
      *a17 = v30;
    }
  }

  else
  {
    __int128 v34 = objc_alloc(&OBJC_CLASS___TPPeerStableInfo);
    LOBYTE(v38) = a16;
    id v37 = v27;
    unint64_t v35 = v29 + 1;
    __int128 v32 = v27;
    __int128 v33 = v40;
    v42 = -[TPPeerStableInfo initWithClock:frozenPolicyVersion:flexiblePolicyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:walrusSetting:webAccess:deviceName:serialNumber:osVersion:signingKeyPair:recoverySigningPubKey:recoveryEncryptionPubKey:isInheritedAccount:error:]( v34,  "initWithClock:frozenPolicyVersion:flexiblePolicyVersion:policySecrets:syncUserControllableViews:secureElemen tIdentity:walrusSetting:webAccess:deviceName:serialNumber:osVersion:signingKeyPair:recoverySigningPubKey:rec overyEncryptionPubKey:isInheritedAccount:error:",  v35,  v40,  v21,  v45,  a6,  v44,  v43,  v22,  v23,  v24,  v25,  v26,  v37,  v28,  v38,  a17);
  }

  return v42;
}

- (unint64_t)maxClockWithError:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v10 = 0LL;
  int v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  uint64_t v13 = 0LL;
  id v8 = 0LL;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __29__TPModel_maxClockWithError___block_invoke;
  v9[3] = &unk_18A22BB10;
  v9[4] = &v10;
  -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v9, &v8);
  id v4 = v8;
  if (v4)
  {
    TPModelLog();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543362;
      id v15 = v4;
      _os_log_impl(&dword_188398000, v5, OS_LOG_TYPE_DEFAULT, "maxClock error enumerating peers: %{public}@", buf, 0xCu);
    }

    unint64_t v6 = 0LL;
    if (a3) {
      *a3 = v4;
    }
  }

  else
  {
    unint64_t v6 = v11[3];
  }

  _Block_object_dispose(&v10, 8);
  return v6;
}

- (id)createDynamicInfoWithIncludedPeerIDs:(id)a3 excludedPeerIDs:(id)a4 dispositions:(id)a5 preapprovals:(id)a6 signingKeyPair:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v24 = 0LL;
  unint64_t v19 = -[TPModel maxClockWithError:](self, "maxClockWithError:", &v24);
  id v20 = v24;
  id v21 = v20;
  if (v20)
  {
    id v22 = 0LL;
    if (a8) {
      *a8 = v20;
    }
  }

  else
  {
    +[TPPeerDynamicInfo dynamicInfoWithClock:includedPeerIDs:excludedPeerIDs:dispositions:preapprovals:signingKeyPair:error:]( &OBJC_CLASS___TPPeerDynamicInfo,  "dynamicInfoWithClock:includedPeerIDs:excludedPeerIDs:dispositions:preapprovals:signingKeyPair:error:",  v19 + 1,  v14,  v15,  v16,  v17,  v18,  a8);
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

- (BOOL)canTrustCandidate:(id)a3 inEpoch:(unint64_t)a4
{
  return [a3 epoch] + 1 >= a4;
}

- (BOOL)canIntroduceCandidate:(id)a3 withSponsor:(id)a4 toEpoch:(unint64_t)a5 underPolicy:(id)a6 disposition:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (-[TPModel canTrustCandidate:inEpoch:](self, "canTrustCandidate:inEpoch:", v12, a5))
  {
    [v13 modelID];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 categoryForModel:v16];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();

    [v12 modelID];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 categoryForModel:v18];
    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

    char v20 = [v14 trustedPeerInCategory:v17 canIntroduceCategory:v19];
    if ((v20 & 1) == 0)
    {
      id v21 = objc_alloc_init(&OBJC_CLASS___TPPBPolicyProhibits);
      [v15 setPolicyProhibits:v21];

      [v14 version];
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = [v22 versionNumber];
      [v15 policyProhibits];
      id v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 setPolicyVersion:v23];

      [v13 peerID];
      id v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 policyProhibits];
      id v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 setSponsorId:v25];

      [v15 policyProhibits];
      id v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 setSponsorCategory:v17];

      [v15 policyProhibits];
      id v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 setCandidateCategory:v19];

      if (v19)
      {
        unint64_t v29 = 0LL;
      }

      else
      {
        __int128 v33 = (void *)NSString;
        [v12 modelID];
        id v28 = (void *)objc_claimAutoreleasedReturnValue();
        [v33 stringWithFormat:@"unrecognized modelID: %@", v28];
        unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
      }

      [v15 policyProhibits];
      __int128 v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 setExplanation:v29];

      if (!v19)
      {
      }
    }
  }

  else
  {
    id v30 = objc_alloc_init(&OBJC_CLASS___TPPBAncientEpoch);
    [v15 setAncientEpoch:v30];

    uint64_t v31 = [v12 epoch];
    [v15 ancientEpoch];
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v32 setCandidateEpoch:v31];

    [v15 ancientEpoch];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 setMyEpoch:a5];
    char v20 = 0;
  }

  return v20;
}

- (BOOL)checkIntroductionForCandidate:(id)a3 stableInfo:(id)a4 withSponsorID:(id)a5 error:(id *)a6
{
  v48[2] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  -[TPModel actualPeerWithID:error:](self, "actualPeerWithID:error:", a5, a6);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = v12;
  if (v12)
  {
    [v12 trustedPeerIDs];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 peerID];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPModel policyForPeerIDs:candidatePeerID:candidateStableInfo:error:]( self,  "policyForPeerIDs:candidatePeerID:candidateStableInfo:error:",  v14,  v15,  v11,  a6);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      BOOL v22 = 0;
LABEL_20:

      goto LABEL_21;
    }

    [v10 modelID];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 categoryForModel:v17];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      unint64_t v19 = objc_alloc_init(&OBJC_CLASS___TPPBDisposition);
      [v13 permanentInfo];
      char v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 permanentInfo];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v22 = -[TPModel canIntroduceCandidate:withSponsor:toEpoch:underPolicy:disposition:]( self,  "canIntroduceCandidate:withSponsor:toEpoch:underPolicy:disposition:",  v10,  v20,  [v21 epoch],  v16,  v19);

      if (!a6 || v22) {
        goto LABEL_18;
      }
      uint64_t v39 = TPErrorDomain;
      id v40 = (void *)MEMORY[0x189607870];
      uint64_t v23 = *MEMORY[0x1896075E0];
      v46[0] = @"Policy prohibits introducing candidate";
      v45[0] = v23;
      v45[1] = @"sponsorID";
      v42 = -[TPPBDisposition policyProhibits](v19, "policyProhibits");
      [v42 sponsorId];
      id v43 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = v43;
      v45[2] = @"sponsorCategory";
      v41 = -[TPPBDisposition policyProhibits](v19, "policyProhibits");
      uint64_t v24 = [v41 sponsorCategory];
      uint64_t v38 = (void *)v24;
      id v44 = v18;
      if (v24) {
        id v25 = (const __CFString *)v24;
      }
      else {
        id v25 = @"unknown";
      }
      id v46[2] = v25;
      v45[3] = @"candidateCategory";
      -[TPPBDisposition policyProhibits](v19, "policyProhibits");
      id v37 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = [v37 candidateCategory];
      id v27 = (void *)v26;
      if (v26) {
        id v28 = (const __CFString *)v26;
      }
      else {
        id v28 = @"unknown";
      }
      v46[3] = v28;
      v45[4] = @"policyVersion";
      unint64_t v29 = (void *)MEMORY[0x189607968];
      -[TPPBDisposition policyProhibits](v19, "policyProhibits");
      id v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "numberWithUnsignedLongLong:", objc_msgSend(v30, "policyVersion"));
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      v46[4] = v31;
      [MEMORY[0x189603F68] dictionaryWithObjects:v46 forKeys:v45 count:5];
      __int128 v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v40 errorWithDomain:v39 code:6 userInfo:v32];
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      id v18 = v44;
      __int128 v33 = v42;
    }

    else
    {
      if (!a6)
      {
        BOOL v22 = 0;
        goto LABEL_19;
      }

      __int128 v34 = (void *)MEMORY[0x189607870];
      uint64_t v35 = TPErrorDomain;
      v47[0] = *MEMORY[0x1896075E0];
      v47[1] = @"model";
      v48[0] = @"Unrecognized modelID for candidate";
      [v10 modelID];
      unint64_t v19 = (TPPBDisposition *)objc_claimAutoreleasedReturnValue();
      v48[1] = v19;
      [MEMORY[0x189603F68] dictionaryWithObjects:v48 forKeys:v47 count:2];
      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 errorWithDomain:v35 code:9 userInfo:v33];
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    BOOL v22 = 0;
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }

  BOOL v22 = 0;
LABEL_21:

  return v22;
}

- (id)createVoucherForCandidate:(id)a3 stableInfo:(id)a4 withSponsorID:(id)a5 reason:(unint64_t)a6 signingKeyPair:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  if (-[TPModel checkIntroductionForCandidate:stableInfo:withSponsorID:error:]( self,  "checkIntroductionForCandidate:stableInfo:withSponsorID:error:",  v14,  a4,  v15,  a8))
  {
    [v14 peerID];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPVoucher voucherWithReason:beneficiaryID:sponsorID:signingKeyPair:error:]( &OBJC_CLASS___TPVoucher,  "voucherWithReason:beneficiaryID:sponsorID:signingKeyPair:error:",  a6,  v17,  v15,  v16,  a8);
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v18 = 0LL;
  }

  return v18;
}

- (BOOL)verifyVoucherSignature:(id)a3
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 sponsorID];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v36 = 0LL;
  -[TPModel peerWithID:error:](self, "peerWithID:error:", v5, &v36);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v36;

  if (v6 && !v7) {
    goto LABEL_26;
  }
  TPModelLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    [v4 sponsorID];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138543618;
    uint64_t v39 = v9;
    __int16 v40 = 2114;
    id v41 = v7;
    _os_log_impl(&dword_188398000, v8, OS_LOG_TYPE_DEFAULT, "Can't find peer %{public}@: %{public}@", buf, 0x16u);
  }

  if (v6)
  {
LABEL_26:
    [v6 permanentInfo];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 signingPubKey];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    char v12 = [v4 checkSignatureWithKey:v11];

    if ((v12 & 1) != 0) {
      goto LABEL_9;
    }
  }

  [v6 stableInfo];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 recoverySigningPublicKey];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14) {
    goto LABEL_10;
  }
  [v6 stableInfo];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 recoverySigningPublicKey];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 createRecoveryECPublicKey:v16];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  char v18 = [v4 checkSignatureWithKey:v17];

  if ((v18 & 1) != 0)
  {
LABEL_9:
    BOOL v19 = 1;
  }

  else
  {
LABEL_10:
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    -[TPModel custodianRecoveryKeys](self, "custodianRecoveryKeys");
    char v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      id v31 = v7;
      uint64_t v23 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0LL; i != v22; ++i)
        {
          if (*(void *)v33 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          -[TPModel custodianRecoveryKeys](self, "custodianRecoveryKeys");
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v26 objectForKeyedSubscript:v25];
          id v27 = (void *)objc_claimAutoreleasedReturnValue();

          [v27 signingPublicKey];
          id v28 = (void *)objc_claimAutoreleasedReturnValue();
          char v29 = [v4 checkSignatureWithKey:v28];

          if ((v29 & 1) != 0)
          {
            BOOL v19 = 1;
            goto LABEL_20;
          }
        }

        uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v22) {
          continue;
        }
        break;
      }

      BOOL v19 = 0;
LABEL_20:
      id v7 = v31;
    }

    else
    {
      BOOL v19 = 0;
    }
  }

  return v19;
}

- (BOOL)validateVoucherForPeer:(id)a3 sponsor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0LL;
  char v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  -[TPModel dbAdapter](self, "dbAdapter");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __42__TPModel_validateVoucherForPeer_sponsor___block_invoke;
  v14[3] = &unk_18A22BBB0;
  id v9 = v6;
  id v15 = v9;
  id v10 = v7;
  id v16 = v10;
  id v17 = self;
  char v18 = &v19;
  id v13 = 0LL;
  [v8 enumerateVouchersUsingBlock:v14 error:&v13];
  id v11 = v13;

  LOBYTE(v8) = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v19, 8);

  return (char)v8;
}

- (id)considerCandidateID:(id)a3 withSponsorID:(id)a4 sponsorPermanentInfo:(id)a5 toExpandIncludedPeerIDs:(id)a6 andExcludedPeerIDs:(id)a7 dispositions:(id)a8 currentMachineIDs:(id)a9 forEpoch:(unint64_t)a10
{
  uint64_t v76 = *MEMORY[0x1895F89C0];
  id v16 = a3;
  id v17 = (TPPBDisposition *)a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if ([v19 containsObject:v16]) {
    goto LABEL_8;
  }
  if ([v20 containsObject:v16])
  {
    TPModelLog();
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543362;
      id v73 = v16;
      _os_log_impl(&dword_188398000, v23, OS_LOG_TYPE_DEFAULT, "voucher: peer (%{public}@) already excluded", buf, 0xCu);
    }

    goto LABEL_8;
  }

  -[TPModel allCustodianRecoveryKeyPeerIDs](self, "allCustodianRecoveryKeyPeerIDs");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  int v25 = [v24 containsObject:v16];

  if (!v25)
  {
    id v71 = 0LL;
    -[TPModel peerWithID:error:](self, "peerWithID:error:", v16, &v71);
    id v28 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (TPPBDisposition *)v71;
    id v68 = v18;
    v69 = v28;
    if (!v28)
    {
      TPModelLog();
      __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      __int128 v34 = v67;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138543618;
        id v73 = v16;
        __int16 v74 = 2114;
        v75 = v67;
        _os_log_impl( &dword_188398000,  v33,  OS_LOG_TYPE_DEFAULT,  "voucher: no peer for id %{public}@: %{public}@",  buf,  0x16u);
      }

      uint64_t v26 = v67;
      goto LABEL_60;
    }

    v63 = v17;
    [v28 permanentInfo];
    char v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 machineID];
    id v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 entryFor:v30];
    id v31 = (void *)objc_claimAutoreleasedReturnValue();

    v65 = v31;
    if (v31) {
      uint64_t v32 = [v31 status];
    }
    else {
      uint64_t v32 = 0LL;
    }
    [v21 objectForKeyedSubscript:v16];
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();
    id v36 = v35;
    if (v35) {
      id v37 = v35;
    }
    else {
      id v37 = objc_alloc_init(&OBJC_CLASS___TPPBDisposition);
    }
    v66 = v37;

    switch(v32)
    {
      case 0LL:
        if (v22)
        {
          uint64_t v38 = objc_alloc_init(&OBJC_CLASS___TPPBUnknownMachineID);
          -[TPPBDisposition setUnknownMachineID:](v66, "setUnknownMachineID:", v38);
        }

        -[TPPBDisposition setDisallowedMachineID:](v66, "setDisallowedMachineID:", 0LL);
        -[TPPBDisposition setEvictedMachineID:](v66, "setEvictedMachineID:", 0LL);
        -[TPPBDisposition setUnknownReasonRemovalMachineID:](v66, "setUnknownReasonRemovalMachineID:", 0LL);
        [v21 setObject:v66 forKeyedSubscript:v16];
        TPModelLog();
        uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138543618;
          id v73 = v31;
          __int16 v74 = 2114;
          v75 = v66;
          _os_log_impl( &dword_188398000,  v39,  OS_LOG_TYPE_DEFAULT,  "voucher: unknown machineID %{public}@ %{public}@",  buf,  0x16u);
        }

        break;
      case 1LL:
        __int16 v40 = v21;
        id v41 = 0LL;
        goto LABEL_40;
      case 2LL:
        uint64_t v42 = objc_alloc_init(&OBJC_CLASS___TPPBDispositionDisallowedMachineID);
        -[TPPBDisposition setDisallowedMachineID:](v66, "setDisallowedMachineID:", v42);

        [v21 setObject:v66 forKeyedSubscript:v16];
        TPModelLog();
        id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138543618;
          id v73 = v31;
          __int16 v74 = 2114;
          v75 = v66;
          _os_log_impl( &dword_188398000,  v43,  OS_LOG_TYPE_DEFAULT,  "voucher: disallowed machineID %{public}@ %{public}@",  buf,  0x16u);
        }

        uint64_t v26 = 0LL;
        __int128 v34 = v67;
        goto LABEL_59;
      case 3LL:
        TPModelLog();
        id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138543618;
          id v73 = v31;
          __int16 v74 = 2114;
          v75 = v66;
          _os_log_impl( &dword_188398000,  v44,  OS_LOG_TYPE_DEFAULT,  "voucher: evicted machineID %{public}@ %{public}@",  buf,  0x16u);
        }

        -[TPPBDisposition setUnknownMachineID:](v66, "setUnknownMachineID:", 0LL);
        -[TPPBDisposition setDisallowedMachineID:](v66, "setDisallowedMachineID:", 0LL);
        -[TPPBDisposition setUnknownReasonRemovalMachineID:](v66, "setUnknownReasonRemovalMachineID:", 0LL);
        id v45 = objc_alloc_init(&OBJC_CLASS___TPPBDispositionEvictedMachineID);
        -[TPPBDisposition setEvictedMachineID:](v66, "setEvictedMachineID:", v45);
        goto LABEL_39;
      case 4LL:
        TPModelLog();
        v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138543618;
          id v73 = v31;
          __int16 v74 = 2114;
          v75 = v66;
          _os_log_impl( &dword_188398000,  v46,  OS_LOG_TYPE_DEFAULT,  "voucher: unknown reason removed machineID %{public}@ %{public}@",  buf,  0x16u);
        }

        -[TPPBDisposition setUnknownMachineID:](v66, "setUnknownMachineID:", 0LL);
        -[TPPBDisposition setDisallowedMachineID:](v66, "setDisallowedMachineID:", 0LL);
        -[TPPBDisposition setEvictedMachineID:](v66, "setEvictedMachineID:", 0LL);
        id v45 = objc_alloc_init(&OBJC_CLASS___TPPBDispositionUnknownReasonRemovalMachineID);
        -[TPPBDisposition setUnknownReasonRemovalMachineID:](v66, "setUnknownReasonRemovalMachineID:", v45);
        goto LABEL_39;
      case 5LL:
        TPModelLog();
        v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138543618;
          id v73 = v31;
          __int16 v74 = 2114;
          v75 = v66;
          _os_log_impl( &dword_188398000,  v47,  OS_LOG_TYPE_DEFAULT,  "voucher: ghosted machineID %{public}@ %{public}@",  buf,  0x16u);
        }

        id v45 = objc_alloc_init(&OBJC_CLASS___TPPBDispositionGhostedMachineID);
        -[TPPBDisposition setGhostedMachineID:](v66, "setGhostedMachineID:", v45);
LABEL_39:

        __int16 v40 = v21;
        id v41 = v66;
LABEL_40:
        [v40 setObject:v41 forKeyedSubscript:v16];
        break;
      default:
        break;
    }

    [MEMORY[0x189603FE0] setWithSet:v19];
    id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    -[os_log_s minusSet:](v43, "minusSet:", v20);
    -[os_log_s addObject:](v43, "addObject:", v16);
    id v70 = 0LL;
    uint64_t v48 = -[TPModel policyForPeerIDs:candidatePeerID:candidateStableInfo:error:]( self,  "policyForPeerIDs:candidatePeerID:candidateStableInfo:error:",  v43,  v16,  0LL,  &v70);
    id v62 = v70;
    v64 = (void *)v48;
    if (!v48)
    {
      TPModelLog();
      v58 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      id v31 = v65;
      v59 = v62;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138543362;
        id v73 = v62;
        _os_log_impl( &dword_188398000,  v58,  OS_LOG_TYPE_DEFAULT,  "voucher: failed to fetch policy: %{public}@",  buf,  0xCu);
      }

      uint64_t v26 = (TPPBDisposition *)v62;
      __int128 v34 = v67;
LABEL_58:

LABEL_59:
      id v17 = v63;
LABEL_60:

      id v18 = v68;
      goto LABEL_9;
    }

    v61 = v43;
    v49 = -[TPPBDisposition unknownMachineID](v66, "unknownMachineID");
    if (v49) {
      goto LABEL_47;
    }
    v49 = -[TPPBDisposition evictedMachineID](v66, "evictedMachineID");
    if (v49
      || (-[TPPBDisposition unknownReasonRemovalMachineID](v66, "unknownReasonRemovalMachineID"),
          (v49 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL)
      || (-[TPPBDisposition unknownMachineID](v66, "unknownMachineID"),
          (v49 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL)
      || (-[TPPBDisposition disallowedMachineID](v66, "disallowedMachineID"),
          (v49 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
    {
LABEL_47:

      unint64_t v50 = a10;
      v51 = v66;
    }

    else
    {
      -[TPPBDisposition ghostedMachineID](v66, "ghostedMachineID");
      v51 = v66;
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      unint64_t v50 = a10;
      if (!v60) {
        goto LABEL_49;
      }
    }

    [v21 setObject:v51 forKeyedSubscript:v16];
LABEL_49:
    [v69 permanentInfo];
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v53 = -[TPModel canIntroduceCandidate:withSponsor:toEpoch:underPolicy:disposition:]( self,  "canIntroduceCandidate:withSponsor:toEpoch:underPolicy:disposition:",  v52,  v18,  v50,  v64,  v51);

    if (v53)
    {
      TPModelLog();
      v54 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        [v69 peerID];
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)__int128 buf = 138543618;
        id v73 = v55;
        __int16 v74 = 2114;
        v75 = v63;
        _os_log_impl( &dword_188398000,  v54,  OS_LOG_TYPE_DEFAULT,  "voucher: %{public}@ presented valid voucher from %{public}@",  buf,  0x16u);
      }

      [v19 addObject:v16];
      [v69 dynamicInfo];
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      [v56 excludedPeerIDs];
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 unionSet:v57];

      -[TPModel recursivelyExpandIncludedPeerIDs:andExcludedPeerIDs:dispositions:withPeersTrustedBySponsorID:currentMachineIDs:forEpoch:]( self,  "recursivelyExpandIncludedPeerIDs:andExcludedPeerIDs:dispositions:withPeersTrustedBySponsorID:currentMachineIDs:forEpoch:",  v19,  v20,  v21,  v16,  v22,  a10);
      uint64_t v26 = (TPPBDisposition *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v26 = 0LL;
    }

    __int128 v34 = v67;
    id v31 = v65;
    id v43 = v61;
    v59 = v62;
    goto LABEL_58;
  }

  [v19 addObject:v16];
LABEL_8:
  uint64_t v26 = 0LL;
LABEL_9:

  return v26;
}

- (void)considerVouchersSponsoredByPeerID:(id)a3 sponsorPermanentInfo:(id)a4 toRecursivelyExpandIncludedPeerIDs:(id)a5 andExcludedPeerIDs:(id)a6 dispositions:(id)a7 currentMachineIDs:(id)a8 forEpoch:(unint64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  uint64_t v41 = 0LL;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  id v44 = __Block_byref_object_copy_;
  id v45 = __Block_byref_object_dispose_;
  id v46 = 0LL;
  -[TPModel dbAdapter](self, "dbAdapter");
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1895F87A8];
  v31[1] = 3221225472LL;
  v31[2] = __160__TPModel_considerVouchersSponsoredByPeerID_sponsorPermanentInfo_toRecursivelyExpandIncludedPeerIDs_andExcludedPeerIDs_dispositions_currentMachineIDs_forEpoch___block_invoke;
  v31[3] = &unk_18A22BBD8;
  id v22 = v15;
  id v32 = v22;
  id v23 = v17;
  id v33 = v23;
  id v24 = v18;
  uint64_t v39 = &v41;
  id v34 = v24;
  __int128 v35 = self;
  id v25 = v16;
  id v36 = v25;
  id v26 = v19;
  id v37 = v26;
  id v27 = v20;
  id v38 = v27;
  unint64_t v40 = a9;
  id v30 = 0LL;
  [v21 enumerateVouchersUsingBlock:v31 error:&v30];
  id v28 = v30;

  if (!v28)
  {
    char v29 = (void *)v42[5];
    if (v29) {
      id v28 = v29;
    }
    else {
      id v28 = 0LL;
    }
  }

  _Block_object_dispose(&v41, 8);
}

- (id)considerPreapprovalsSponsoredByPeer:(id)a3 toRecursivelyExpandIncludedPeerIDs:(id)a4 andExcludedPeerIDs:(id)a5 dispositions:(id)a6 currentMachineIDs:(id)a7 forEpoch:(unint64_t)a8
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  id v13 = a3;
  id v33 = a4;
  id v32 = a5;
  id v14 = a6;
  id v15 = a7;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v16 = v13;
  [v13 dynamicInfo];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 preapprovals];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v45;
    *(void *)&__int128 v20 = 138543362LL;
    __int128 v29 = v20;
LABEL_3:
    uint64_t v23 = 0LL;
    while (1)
    {
      if (*(void *)v45 != v22) {
        objc_enumerationMutation(v18);
      }
      uint64_t v24 = *(void *)(*((void *)&v44 + 1) + 8 * v23);
      int64_t v25 = +[TPHashBuilder algoOfHash:](&OBJC_CLASS___TPHashBuilder, "algoOfHash:", v24, v29, v30);
      if (v25 != -1)
      {
        v35[0] = MEMORY[0x1895F87A8];
        v35[1] = 3221225472LL;
        v35[2] = __141__TPModel_considerPreapprovalsSponsoredByPeer_toRecursivelyExpandIncludedPeerIDs_andExcludedPeerIDs_dispositions_currentMachineIDs_forEpoch___block_invoke;
        v35[3] = &unk_18A22BC00;
        int64_t v42 = v25;
        v35[4] = v24;
        id v36 = v16;
        id v37 = self;
        id v38 = v33;
        id v39 = v32;
        id v40 = v14;
        id v41 = v15;
        unint64_t v43 = a8;
        id v34 = 0LL;
        -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v35, &v34);
        id v26 = v34;
        if (v26)
        {
          TPModelLog();
          id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = v29;
            id v49 = v26;
            _os_log_impl(&dword_188398000, v27, OS_LOG_TYPE_DEFAULT, "Error enumerating peers: %{public}@", buf, 0xCu);
          }

          id v30 = v26;
        }

        if (v26) {
          break;
        }
      }

      if (v21 == ++v23)
      {
        uint64_t v21 = [v18 countByEnumeratingWithState:&v44 objects:v50 count:16];
        if (v21) {
          goto LABEL_3;
        }
        goto LABEL_14;
      }
    }
  }

  else
  {
LABEL_14:
    id v30 = 0LL;
  }

  return v30;
}

- (id)recursivelyExpandIncludedPeerIDs:(id)a3 andExcludedPeerIDs:(id)a4 dispositions:(id)a5 withPeersTrustedBySponsorID:(id)a6 currentMachineIDs:(id)a7 forEpoch:(unint64_t)a8
{
  uint64_t v65 = *MEMORY[0x1895F89C0];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v57 = 0LL;
  uint64_t v51 = self;
  -[TPModel peerWithID:error:](self, "peerWithID:error:", v16, &v57);
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = v57;
  __int128 v20 = v19;
  if (v18)
  {
    id v46 = v19;
    id v48 = v17;
    id v49 = v15;
    id v50 = v13;
    TPModelLog();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      [v18 peerID];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 dynamicInfo];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 includedPeerIDs];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 dynamicInfo];
      int64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 excludedPeerIDs];
      id v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 138543874;
      id v60 = v22;
      __int16 v61 = 2114;
      id v62 = v24;
      __int16 v63 = 2114;
      v64 = v26;
      _os_log_impl( &dword_188398000,  v21,  OS_LOG_TYPE_INFO,  "Including information from sponsor (%{public}@): included: %{public}@ excluded: %{public}@",  buf,  0x20u);
    }

    id v47 = v16;

    [v18 dynamicInfo];
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 excludedPeerIDs];
    id v28 = (void *)objc_claimAutoreleasedReturnValue();
    id v29 = v14;
    [v14 unionSet:v28];

    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    [v18 dynamicInfo];
    id v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v30 includedPeerIDs];
    id v31 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v32 = [v31 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v54;
      do
      {
        for (uint64_t i = 0LL; i != v33; ++i)
        {
          if (*(void *)v54 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v36 = *(void *)(*((void *)&v53 + 1) + 8 * i);
          id v37 = (void *)MEMORY[0x1895C3FC8]();
          [v18 peerID];
          id v38 = (void *)objc_claimAutoreleasedReturnValue();
          [v18 permanentInfo];
          id v39 = (void *)objc_claimAutoreleasedReturnValue();
          id v40 =  -[TPModel considerCandidateID:withSponsorID:sponsorPermanentInfo:toExpandIncludedPeerIDs:andExcludedPeerIDs:dispositions:currentMachineIDs:forEpoch:]( v51,  "considerCandidateID:withSponsorID:sponsorPermanentInfo:toExpandIncludedPeerIDs:andExcludedPeerIDs:di spositions:currentMachineIDs:forEpoch:",  v36,  v38,  v39,  v50,  v29,  v49,  v48,  a8);

          objc_autoreleasePoolPop(v37);
        }

        uint64_t v33 = [v31 countByEnumeratingWithState:&v53 objects:v58 count:16];
      }

      while (v33);
    }

    [v18 peerID];
    id v41 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 permanentInfo];
    int64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = v49;
    id v13 = v50;
    id v14 = v29;
    id v17 = v48;
    -[TPModel considerVouchersSponsoredByPeerID:sponsorPermanentInfo:toRecursivelyExpandIncludedPeerIDs:andExcludedPeerIDs:dispositions:currentMachineIDs:forEpoch:]( v51,  "considerVouchersSponsoredByPeerID:sponsorPermanentInfo:toRecursivelyExpandIncludedPeerIDs:andExcludedPeerIDs:dispo sitions:currentMachineIDs:forEpoch:",  v41,  v42,  v50,  v29,  v49,  v48,  a8);

    -[TPModel considerPreapprovalsSponsoredByPeer:toRecursivelyExpandIncludedPeerIDs:andExcludedPeerIDs:dispositions:currentMachineIDs:forEpoch:]( v51,  "considerPreapprovalsSponsoredByPeer:toRecursivelyExpandIncludedPeerIDs:andExcludedPeerIDs:dispositions:currentMach ineIDs:forEpoch:",  v18,  v50,  v29,  v49,  v48,  a8);
    id v43 = (id)objc_claimAutoreleasedReturnValue();
    __int128 v20 = v46;
    id v16 = v47;
  }

  else if (v19)
  {
    TPModelLog();
    __int128 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543618;
      id v60 = v16;
      __int16 v61 = 2114;
      id v62 = v20;
      _os_log_impl(&dword_188398000, v44, OS_LOG_TYPE_DEFAULT, "Could not find peer %{public}@: %{public}@", buf, 0x16u);
    }

    id v43 = v20;
  }

  else
  {
    id v43 = 0LL;
  }

  return v43;
}

- (id)calculateDynamicInfoForPeerWithID:(id)a3 addingPeerIDs:(id)a4 removingPeerIDs:(id)a5 preapprovedKeys:(id)a6 signingKeyPair:(id)a7 currentMachineIDs:(id)a8 error:(id *)a9
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v15 = a3;
  id v36 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  -[TPModel actualPeerWithID:error:](self, "actualPeerWithID:error:", v15, a9);
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = v20;
  if (v20)
  {
    [v20 peerID];
    id v34 = v15;
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 permanentInfo];
    id v35 = v19;
    id v23 = v16;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 stableInfo];
    int64_t v25 = v17;
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 dynamicInfo];
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    id v28 = self;
    id v29 = v36;
    -[TPModel calculateDynamicInfoFromModel:peer:peerPermanentInfo:peerStableInfo:startingDynamicInfo:addingPeerIDs:removingPeerIDs:preapprovedKeys:signingKeyPair:currentMachineIDs:sponsorPeerID:error:]( v28,  "calculateDynamicInfoFromModel:peer:peerPermanentInfo:peerStableInfo:startingDynamicInfo:addingPeerIDs:removingPeer IDs:preapprovedKeys:signingKeyPair:currentMachineIDs:sponsorPeerID:error:",  v22,  v21,  v24,  v26,  v27,  v36,  v23,  v25,  v18,  v35,  0LL,  a9);
    id v30 = (void *)objc_claimAutoreleasedReturnValue();

    id v16 = v23;
    id v15 = v34;
    id v19 = v35;
  }

  else
  {
    id v31 = v18;
    int64_t v25 = v17;
    id v29 = v36;
    TPModelLog();
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543362;
      id v38 = v15;
      _os_log_impl(&dword_188398000, v32, OS_LOG_TYPE_DEFAULT, "No peer for ID %{public}@", buf, 0xCu);
    }

    id v30 = 0LL;
    id v18 = v31;
  }

  return v30;
}

- (id)calculateDynamicInfoFromModel:(id)a3 peer:(id)a4 peerPermanentInfo:(id)a5 peerStableInfo:(id)a6 startingDynamicInfo:(id)a7 addingPeerIDs:(id)a8 removingPeerIDs:(id)a9 preapprovedKeys:(id)a10 signingKeyPair:(id)a11 currentMachineIDs:(id)a12 sponsorPeerID:(id)a13 error:(id *)a14
{
  uint64_t v289 = *MEMORY[0x1895F89C0];
  id v210 = a3;
  id v204 = a4;
  id v20 = a5;
  id v205 = a6;
  id v211 = a7;
  id v208 = a8;
  id v209 = a9;
  id v203 = a10;
  id v200 = a11;
  id v215 = a12;
  v201 = v20;
  id v202 = a13;
  uint64_t v212 = [v20 epoch];
  uint64_t v21 = (void *)MEMORY[0x189604010];
  v217 = self;
  -[TPModel allPeerIDs](self, "allPeerIDs");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 setWithArray:v22];
  v206 = (void *)objc_claimAutoreleasedReturnValue();

  TPModelLog();
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543618;
    *(void *)&uint8_t buf[4] = v210;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v206;
    _os_log_impl( &dword_188398000,  v23,  OS_LOG_TYPE_DEFAULT,  "Calculating dynamic info for peer %{public}@ with peer set %{public}@",  buf,  0x16u);
  }

  if ([v208 count])
  {
    TPModelLog();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543362;
      *(void *)&uint8_t buf[4] = v208;
      _os_log_impl(&dword_188398000, v24, OS_LOG_TYPE_DEFAULT, "Adding peer IDs: %{public}@", buf, 0xCu);
    }
  }

  if ([v209 count])
  {
    TPModelLog();
    int64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543362;
      *(void *)&uint8_t buf[4] = v209;
      _os_log_impl(&dword_188398000, v25, OS_LOG_TYPE_DEFAULT, "Removing peer IDs: %{public}@", buf, 0xCu);
    }
  }

  [v211 excludedPeerIDs];
  id v26 = (void *)objc_claimAutoreleasedReturnValue();
  int v27 = [v26 containsObject:v210];

  if (v27)
  {
    TPModelLog();
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543362;
      *(void *)&uint8_t buf[4] = v210;
      _os_log_impl(&dword_188398000, v28, OS_LOG_TYPE_DEFAULT, "Peer (%{public}@) excludes itself", buf, 0xCu);
    }

    id v29 = v211;
    goto LABEL_271;
  }

  id v30 = (void *)MEMORY[0x189603FE0];
  [v211 includedPeerIDs];
  id v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v30 setWithSet:v31];
  v216 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v32 = (void *)MEMORY[0x189603FE0];
  [v211 excludedPeerIDs];
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v32 setWithSet:v33];
  v214 = (void *)objc_claimAutoreleasedReturnValue();

  TPModelLog();
  id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543618;
    *(void *)&uint8_t buf[4] = v216;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v214;
    _os_log_impl( &dword_188398000,  v34,  OS_LOG_TYPE_DEFAULT,  "Initial sets: included:%{public}@ excluded:%{public}@",  buf,  0x16u);
  }

  id v35 = (void *)MEMORY[0x189603FC8];
  [v211 dispositions];
  id v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v35 dictionaryWithDictionary:v36];
  v222 = (void *)objc_claimAutoreleasedReturnValue();

  [v216 addObject:v210];
  v198 = -[TPRecoveryKeyPair initWithStableInfo:]( objc_alloc(&OBJC_CLASS___TPRecoveryKeyPair),  "initWithStableInfo:",  v205);
  -[TPRecoveryKeyPair signingKeyData](v198, "signingKeyData");
  id v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPHashBuilder hashWithAlgo:ofData:](&OBJC_CLASS___TPHashBuilder, "hashWithAlgo:ofData:", 2LL, v37);
  id v38 = (void *)objc_claimAutoreleasedReturnValue();

  [v38 stringByReplacingOccurrencesOfString:@"SHA384:" withString:&stru_18A22C748];
  v197 = (void *)objc_claimAutoreleasedReturnValue();

  [NSString stringWithFormat:@"RK-%@", v197];
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FE0] setWithSet:v206];
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  [v219 addObject:v196];
  -[TPModel allCustodianRecoveryKeyPeerIDs](self, "allCustodianRecoveryKeyPeerIDs");
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
  [v219 addObjectsFromArray:v39];

  __int128 v272 = 0u;
  __int128 v273 = 0u;
  __int128 v270 = 0u;
  __int128 v271 = 0u;
  obuint64_t j = v209;
  uint64_t v40 = [obj countByEnumeratingWithState:&v270 objects:v288 count:16];
  if (v40)
  {
    uint64_t v41 = *(void *)v271;
    do
    {
      for (uint64_t i = 0LL; i != v40; ++i)
      {
        if (*(void *)v271 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v43 = *(void *)(*((void *)&v270 + 1) + 8 * i);
        if (([v219 containsObject:v43] & 1) == 0)
        {
          TPModelLog();
          v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138543362;
            *(void *)&uint8_t buf[4] = v43;
            _os_log_impl(&dword_188398000, v59, OS_LOG_TYPE_DEFAULT, "No peer for given peer id: %{public}@", buf, 0xCu);
          }

          failWithNoPeerWithIDError(a14);
          id v29 = 0LL;
          goto LABEL_270;
        }
      }

      uint64_t v40 = [obj countByEnumeratingWithState:&v270 objects:v288 count:16];
    }

    while (v40);
  }

  [v216 addObjectsFromArray:v208];
  [v214 addObjectsFromArray:obj];
  [v216 minusSet:v214];
  TPModelLog();
  __int128 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543618;
    *(void *)&uint8_t buf[4] = v216;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v214;
    _os_log_impl( &dword_188398000,  v44,  OS_LOG_TYPE_DEFAULT,  "After removals: included:%{public}@ excluded:%{public}@",  buf,  0x16u);
  }

  TPModelLog();
  __int128 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543362;
    *(void *)&uint8_t buf[4] = v215;
    _os_log_impl( &dword_188398000,  v45,  OS_LOG_TYPE_DEFAULT,  "Beginning sponsor checking; machine ID list: %{public}@",
      buf,
      0xCu);
  }

  __int128 v268 = 0u;
  __int128 v269 = 0u;
  __int128 v266 = 0u;
  __int128 v267 = 0u;
  obuint64_t j = (id)[v216 copy];
  uint64_t v46 = [obj countByEnumeratingWithState:&v266 objects:v287 count:16];
  if (v46)
  {
    uint64_t v47 = *(void *)v267;
    do
    {
      for (uint64_t j = 0LL; j != v46; ++j)
      {
        if (*(void *)v267 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v49 = *(void *)(*((void *)&v266 + 1) + 8 * j);
        id v50 = (void *)MEMORY[0x1895C3FC8]();
        -[TPModel recursivelyExpandIncludedPeerIDs:andExcludedPeerIDs:dispositions:withPeersTrustedBySponsorID:currentMachineIDs:forEpoch:]( v217,  "recursivelyExpandIncludedPeerIDs:andExcludedPeerIDs:dispositions:withPeersTrustedBySponsorID:currentMachineIDs:forEpoch:",  v216,  v214,  v222,  v49,  v215,  v212);
        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v50);
        if (v51)
        {

          TPModelLog();
          id v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138543362;
            *(void *)&uint8_t buf[4] = v51;
            _os_log_impl(&dword_188398000, v60, OS_LOG_TYPE_DEFAULT, "Error sponsor checking: %{public}@", buf, 0xCu);
          }

          if (a14)
          {
            id v61 = v51;
            id v29 = 0LL;
            *a14 = v61;
          }

          else
          {
            id v29 = 0LL;
            id v61 = v51;
          }

          goto LABEL_269;
        }
      }

      uint64_t v46 = [obj countByEnumeratingWithState:&v266 objects:v287 count:16];
    }

    while (v46);
  }

  TPModelLog();
  v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543618;
    *(void *)&uint8_t buf[4] = v216;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v214;
    _os_log_impl( &dword_188398000,  v52,  OS_LOG_TYPE_DEFAULT,  "After sponsor checking: included:%{public}@ excluded:%{public}@",  buf,  0x16u);
  }

  if (v204)
  {
    [v204 peerID];
    __int128 v53 = (void *)objc_claimAutoreleasedReturnValue();
    [v204 permanentInfo];
    __int128 v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPModel considerVouchersSponsoredByPeerID:sponsorPermanentInfo:toRecursivelyExpandIncludedPeerIDs:andExcludedPeerIDs:dispositions:currentMachineIDs:forEpoch:]( v217,  "considerVouchersSponsoredByPeerID:sponsorPermanentInfo:toRecursivelyExpandIncludedPeerIDs:andExcludedPeerIDs:dispo sitions:currentMachineIDs:forEpoch:",  v53,  v54,  v216,  v214,  v222,  v215,  v212);
  }

  TPModelLog();
  __int128 v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543618;
    *(void *)&uint8_t buf[4] = v216;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v214;
    _os_log_impl( &dword_188398000,  v55,  OS_LOG_TYPE_DEFAULT,  "After voucher checking: included:%{public}@ excluded:%{public}@",  buf,  0x16u);
  }

  if (v203)
  {
    TPModelLog();
    __int128 v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543362;
      *(void *)&uint8_t buf[4] = v203;
      _os_log_impl(&dword_188398000, v56, OS_LOG_TYPE_DEFAULT, "Preapproved keys: %{public}@", buf, 0xCu);
    }
    v195 = +[TPModel preapprovalsFromKeys:](&OBJC_CLASS___TPModel, "preapprovalsFromKeys:", v203);
    TPModelLog();
    id v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_59;
    }
    *(_DWORD *)__int128 buf = 138543362;
    *(void *)&uint8_t buf[4] = v195;
    v58 = "New preapproval list: %{public}@";
    goto LABEL_58;
  }

  id v62 = (void *)MEMORY[0x189603FE0];
  [v211 preapprovals];
  __int16 v63 = (void *)objc_claimAutoreleasedReturnValue();
  [v62 setWithSet:v63];
  v195 = (void *)objc_claimAutoreleasedReturnValue();

  TPModelLog();
  id v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543362;
    *(void *)&uint8_t buf[4] = v195;
    v58 = "Using existing preapproval list: %{public}@";
LABEL_58:
    _os_log_impl(&dword_188398000, v57, OS_LOG_TYPE_DEFAULT, v58, buf, 0xCu);
  }

- (id)filterPeerList:(id)a3 byMachineIDs:(id)a4 sponsorPeerID:(id)a5 dispositions:(id)a6
{
  uint64_t v75 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v64 = a6;
  id v60 = v11;
  if (!v11)
  {
    [MEMORY[0x189604010] set];
    id v57 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_44;
  }

  [MEMORY[0x189603FE0] set];
  id v56 = v10;
  id v57 = (id)objc_claimAutoreleasedReturnValue();
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  obuint64_t j = v10;
  uint64_t v13 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
  if (!v13) {
    goto LABEL_42;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v67;
  uint64_t v62 = *(void *)v67;
  v58 = self;
  id v59 = v12;
  do
  {
    uint64_t v16 = 0LL;
    uint64_t v61 = v14;
    do
    {
      if (*(void *)v67 != v15) {
        objc_enumerationMutation(obj);
      }
      id v17 = *(void **)(*((void *)&v66 + 1) + 8 * v16);
      id v18 = (void *)MEMORY[0x1895C3FC8]();
      id v65 = 0LL;
      -[TPModel peerWithID:error:](self, "peerWithID:error:", v17, &v65);
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      id v20 = v65;
      uint64_t v21 = v20;
      if (v19)
      {
        if ([v17 isEqualToString:v12]) {
          goto LABEL_40;
        }
        [v19 permanentInfo];
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 machineID];
        id v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v60 entryFor:v23];
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24) {
          uint64_t v25 = [v24 status];
        }
        else {
          uint64_t v25 = 0LL;
        }
        objc_msgSend(v19, "peerID", v56);
        id v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v64 objectForKeyedSubscript:v26];
        int v27 = (void *)objc_claimAutoreleasedReturnValue();
        id v28 = v27;
        if (v27) {
          id v29 = v27;
        }
        else {
          id v29 = objc_alloc_init(&OBJC_CLASS___TPPBDisposition);
        }
        id v30 = v29;

        uint64_t v15 = v62;
        switch(v25)
        {
          case 0LL:
            -[TPPBDisposition disallowedMachineID](v30, "disallowedMachineID");
            id v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (v31)
            {
              TPModelLog();
              uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_37;
              }
              [v19 permanentInfo];
              uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
              [v33 machineID];
              id v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)__int128 buf = 138543618;
              int64_t v71 = v17;
              __int16 v72 = 2114;
              id v73 = v34;
              id v35 = v32;
              id v36 = "Peer (%{public}@) has an unknown machine ID (%{public}@), but leaving disposition as 'disallowed'";
            }

            else
            {
              __int128 v53 = objc_alloc_init(&OBJC_CLASS___TPPBUnknownMachineID);
              -[TPPBDisposition setUnknownMachineID:](v30, "setUnknownMachineID:", v53);

              [v19 peerID];
              __int128 v54 = (void *)objc_claimAutoreleasedReturnValue();
              [v64 setObject:v30 forKeyedSubscript:v54];

              TPModelLog();
              uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_37;
              }
              [v19 permanentInfo];
              uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
              [v33 machineID];
              id v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)__int128 buf = 138543618;
              int64_t v71 = v17;
              __int16 v72 = 2114;
              id v73 = v34;
              id v35 = v32;
              id v36 = "Peer (%{public}@) has an unknown machine ID (%{public}@)";
            }

            goto LABEL_36;
          case 1LL:
            [v19 peerID];
            id v37 = (void *)objc_claimAutoreleasedReturnValue();
            id v38 = v64;
            uint64_t v39 = 0LL;
            goto LABEL_33;
          case 2LL:
            uint64_t v40 = objc_alloc_init(&OBJC_CLASS___TPPBDispositionDisallowedMachineID);
            -[TPPBDisposition setDisallowedMachineID:](v30, "setDisallowedMachineID:", v40);

            [v19 peerID];
            uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
            [v64 setObject:v30 forKeyedSubscript:v41];

            TPModelLog();
            int64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              [v19 permanentInfo];
              uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
              [v43 machineID];
              __int128 v44 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)__int128 buf = 138543618;
              int64_t v71 = v17;
              __int16 v72 = 2114;
              id v73 = v44;
              _os_log_impl( &dword_188398000,  v42,  OS_LOG_TYPE_DEFAULT,  "Peer (%{public}@) has a disallowed machine ID (%{public}@)",  buf,  0x16u);

              uint64_t v15 = v62;
            }

            [v57 addObject:v17];
            break;
          case 3LL:
            -[TPPBDisposition setUnknownMachineID:](v30, "setUnknownMachineID:", 0LL);
            -[TPPBDisposition setDisallowedMachineID:](v30, "setDisallowedMachineID:", 0LL);
            -[TPPBDisposition setUnknownReasonRemovalMachineID:](v30, "setUnknownReasonRemovalMachineID:", 0LL);
            __int128 v45 = objc_alloc_init(&OBJC_CLASS___TPPBDispositionEvictedMachineID);
            -[TPPBDisposition setEvictedMachineID:](v30, "setEvictedMachineID:", v45);

            [v19 peerID];
            uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
            [v64 setObject:v30 forKeyedSubscript:v46];

            TPModelLog();
            uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_37;
            }
            [v19 permanentInfo];
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            [v33 machineID];
            id v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)__int128 buf = 138543618;
            int64_t v71 = v17;
            __int16 v72 = 2114;
            id v73 = v34;
            id v35 = v32;
            id v36 = "Peer (%{public}@) has an evicted machine ID (%{public}@)";
            goto LABEL_36;
          case 4LL:
            -[TPPBDisposition setUnknownMachineID:](v30, "setUnknownMachineID:", 0LL);
            -[TPPBDisposition setDisallowedMachineID:](v30, "setDisallowedMachineID:", 0LL);
            -[TPPBDisposition setEvictedMachineID:](v30, "setEvictedMachineID:", 0LL);
            uint64_t v47 = objc_alloc_init(&OBJC_CLASS___TPPBDispositionUnknownReasonRemovalMachineID);
            -[TPPBDisposition setUnknownReasonRemovalMachineID:](v30, "setUnknownReasonRemovalMachineID:", v47);

            [v19 peerID];
            id v48 = (void *)objc_claimAutoreleasedReturnValue();
            [v64 setObject:v30 forKeyedSubscript:v48];

            TPModelLog();
            uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_37;
            }
            [v19 permanentInfo];
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            [v33 machineID];
            id v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)__int128 buf = 138543618;
            int64_t v71 = v17;
            __int16 v72 = 2114;
            id v73 = v34;
            id v35 = v32;
            id v36 = "Peer (%{public}@) with machine ID (%{public}@) has been removed with an unknown reason";
LABEL_36:
            _os_log_impl(&dword_188398000, v35, OS_LOG_TYPE_DEFAULT, v36, buf, 0x16u);

            uint64_t v15 = v62;
LABEL_37:

            break;
          case 5LL:
            TPModelLog();
            uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              [v19 permanentInfo];
              id v50 = (void *)objc_claimAutoreleasedReturnValue();
              [v50 machineID];
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)__int128 buf = 138543618;
              int64_t v71 = v17;
              __int16 v72 = 2114;
              id v73 = v51;
              _os_log_impl( &dword_188398000,  v49,  OS_LOG_TYPE_DEFAULT,  "Peer (%{public}@) with machine ID (%{public}@) has ghosted the TDL",  buf,  0x16u);

              uint64_t v15 = v62;
            }

            v52 = objc_alloc_init(&OBJC_CLASS___TPPBDispositionGhostedMachineID);
            -[TPPBDisposition setGhostedMachineID:](v30, "setGhostedMachineID:", v52);

            [v19 peerID];
            id v37 = (void *)objc_claimAutoreleasedReturnValue();
            id v38 = v64;
            uint64_t v39 = v30;
LABEL_33:
            [v38 setObject:v39 forKeyedSubscript:v37];

            break;
          default:
            break;
        }

        self = v58;
        id v12 = v59;
        uint64_t v14 = v61;
      }

      else
      {
        if (!v20) {
          goto LABEL_40;
        }
        TPModelLog();
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138543618;
          int64_t v71 = v17;
          __int16 v72 = 2114;
          id v73 = v21;
          _os_log_impl( &dword_188398000,  (os_log_t)v24,  OS_LOG_TYPE_DEFAULT,  "Error finding peer %{public}@: %{public}@",  buf,  0x16u);
        }
      }

LABEL_40:
      objc_autoreleasePoolPop(v18);
      ++v16;
    }

    while (v14 != v16);
    uint64_t v14 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
  }

  while (v14);
LABEL_42:

  id v10 = v56;
LABEL_44:

  return v57;
}

- (id)peersWithMachineID:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if (a4)
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v15 = 0x3032000000LL;
    uint64_t v16 = __Block_byref_object_copy_;
    id v17 = __Block_byref_object_dispose_;
    id v18 = (id)0xAAAAAAAAAAAAAAAALL;
    [MEMORY[0x189603FE0] set];
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    *a4 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __36__TPModel_peersWithMachineID_error___block_invoke;
    v11[3] = &unk_18A22BC78;
    id v12 = v6;
    p___int128 buf = &buf;
    -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v11, a4);
    if (*a4) {
      id v7 = 0LL;
    }
    else {
      id v7 = *(void **)(*((void *)&buf + 1) + 40LL);
    }
    id v9 = v7;

    _Block_object_dispose(&buf, 8);
  }

  else
  {
    TPModelLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_error_impl( &dword_188398000,  v8,  OS_LOG_TYPE_ERROR,  "Unexpected nil error in peersWithMachineID:%{public}@",  (uint8_t *)&buf,  0xCu);
    }

    id v9 = 0LL;
  }

  return v9;
}

- (id)filterPreapprovals:(id)a3 forExistingPeers:(id)a4
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  [v6 allObjects];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        int64_t v14 = +[TPHashBuilder algoOfHash:](&OBJC_CLASS___TPHashBuilder, "algoOfHash:", v13);
        if (v14 != -1)
        {
          v20[0] = MEMORY[0x1895F87A8];
          v20[1] = 3221225472LL;
          v20[2] = __47__TPModel_filterPreapprovals_forExistingPeers___block_invoke;
          v20[3] = &unk_18A22BCA0;
          int64_t v23 = v14;
          v20[4] = v13;
          id v21 = v7;
          id v22 = v6;
          id v19 = 0LL;
          -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v20, &v19);
          id v15 = v19;
          id v16 = v22;
          if (v15)
          {
            id v17 = v15;

            goto LABEL_13;
          }
        }
      }

      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v17 = 0LL;
LABEL_13:

  return v17;
}

- (id)dynamicInfoForJoiningPeerID:(id)a3 peerPermanentInfo:(id)a4 peerStableInfo:(id)a5 sponsorID:(id)a6 preapprovedKeys:(id)a7 signingKeyPair:(id)a8 currentMachineIDs:(id)a9 error:(id *)a10
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  id v16 = a3;
  id v46 = a4;
  id v47 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v48 = a9;
  uint64_t v58 = 0LL;
  id v59 = &v58;
  uint64_t v60 = 0x3032000000LL;
  uint64_t v61 = __Block_byref_object_copy_;
  uint64_t v62 = __Block_byref_object_dispose_;
  id v63 = (id)0xAAAAAAAAAAAAAAAALL;
  uint64_t v49 = v16;
  [MEMORY[0x189603FE0] setWithObject:v16];
  id v63 = (id)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189604010] set];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17) {
    goto LABEL_13;
  }
  id v57 = 0LL;
  -[TPModel peerWithID:error:](self, "peerWithID:error:", v17, &v57);
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  id v22 = v57;
  if (!v21)
  {
    TPModelLog();
    __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v28 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v22)
    {
      if (!v28) {
        goto LABEL_10;
      }
      *(_DWORD *)__int128 buf = 138543618;
      id v65 = v17;
      __int16 v66 = 2114;
      id v67 = v22;
      uint64_t v29 = "Error finding peer %{public}@: %{public}@";
    }

    else
    {
      if (!v28) {
        goto LABEL_10;
      }
      *(_DWORD *)__int128 buf = 138543618;
      id v65 = v17;
      __int16 v66 = 2114;
      id v67 = 0LL;
      uint64_t v29 = "Peer not in DB %{public}@: %{public}@";
    }

    _os_log_impl(&dword_188398000, v26, OS_LOG_TYPE_DEFAULT, v29, buf, 0x16u);
    goto LABEL_10;
  }

  int64_t v23 = (void *)v59[5];
  [v21 dynamicInfo];
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 includedPeerIDs];
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 unionSet:v25];

  [v21 dynamicInfo];
  __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v27 = -[os_log_s excludedPeerIDs](v26, "excludedPeerIDs");

  id v20 = (void *)v27;
LABEL_10:

  TPModelLog();
  id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    id v31 = (void *)v59[5];
    *(_DWORD *)__int128 buf = 138543874;
    id v65 = v17;
    __int16 v66 = 2114;
    id v67 = v31;
    __int16 v68 = 2114;
    __int128 v69 = v20;
    _os_log_impl( &dword_188398000,  v30,  OS_LOG_TYPE_DEFAULT,  "From our sponsor (%{public}@), included: %{public}@ excluded: %{public}@",  buf,  0x20u);
  }

LABEL_13:
  if (v18)
  {
    [v19 publicKey];
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v32 spki];
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();

    id v34 = (void *)MEMORY[0x1896079C8];
    uint64_t v35 = MEMORY[0x1895F87A8];
    v55[0] = MEMORY[0x1895F87A8];
    v55[1] = 3221225472LL;
    v55[2] = __137__TPModel_dynamicInfoForJoiningPeerID_peerPermanentInfo_peerStableInfo_sponsorID_preapprovedKeys_signingKeyPair_currentMachineIDs_error___block_invoke;
    v55[3] = &unk_18A22BCC8;
    id v36 = v33;
    id v56 = v36;
    [v34 predicateWithBlock:v55];
    id v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 filteredArrayUsingPredicate:v37];
    id v38 = (void *)objc_claimAutoreleasedReturnValue();

    v51[0] = v35;
    v51[1] = 3221225472LL;
    v51[2] = __137__TPModel_dynamicInfoForJoiningPeerID_peerPermanentInfo_peerStableInfo_sponsorID_preapprovedKeys_signingKeyPair_currentMachineIDs_error___block_invoke_2;
    v51[3] = &unk_18A22BCF0;
    id v18 = v38;
    id v52 = v18;
    id v53 = v20;
    __int128 v54 = &v58;
    id v50 = 0LL;
    -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v51, &v50);
    id v39 = v50;
    if (v39)
    {
      uint64_t v40 = v39;
      TPModelLog();
      uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138543362;
        id v65 = v40;
        _os_log_impl(&dword_188398000, v41, OS_LOG_TYPE_DEFAULT, "Error enumerating peers: %{public}@", buf, 0xCu);
      }

      if (a10) {
        *a10 = v40;
      }

      int64_t v42 = 0LL;
      id v43 = v56;
      goto LABEL_26;
    }
  }

  +[TPModel preapprovalsFromKeys:](&OBJC_CLASS___TPModel, "preapprovalsFromKeys:", v18);
  id v36 = (id)objc_claimAutoreleasedReturnValue();
  -[TPModel createDynamicInfoWithIncludedPeerIDs:excludedPeerIDs:dispositions:preapprovals:signingKeyPair:error:]( self,  "createDynamicInfoWithIncludedPeerIDs:excludedPeerIDs:dispositions:preapprovals:signingKeyPair:error:",  v59[5],  v20,  MEMORY[0x189604A60],  v36,  v19,  a10);
  id v43 = (id)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    -[TPModel calculateDynamicInfoFromModel:peer:peerPermanentInfo:peerStableInfo:startingDynamicInfo:addingPeerIDs:removingPeerIDs:preapprovedKeys:signingKeyPair:currentMachineIDs:sponsorPeerID:error:]( self,  "calculateDynamicInfoFromModel:peer:peerPermanentInfo:peerStableInfo:startingDynamicInfo:addingPeerIDs:removingPeer IDs:preapprovedKeys:signingKeyPair:currentMachineIDs:sponsorPeerID:error:",  v49,  0LL,  v46,  v47,  v43,  MEMORY[0x189604A58],  v18,  v19,  v48,  v17,  a10);
    int64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    TPModelLog();
    __int128 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543362;
      id v65 = v49;
      _os_log_impl( &dword_188398000,  v44,  OS_LOG_TYPE_DEFAULT,  "Unable to create initial dynamic info for peer: %{public}@",  buf,  0xCu);
    }

    id v43 = 0LL;
    int64_t v42 = 0LL;
  }

- (id)policyForPeerIDs:(id)a3 candidatePeerID:(id)a4 candidateStableInfo:(id)a5 error:(id *)a6
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (![v10 count])
  {
    if (a6)
    {
      [MEMORY[0x189607870] errorWithDomain:TPErrorDomain code:8 userInfo:0];
      uint64_t v29 = 0LL;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v29 = 0LL;
    }

    goto LABEL_35;
  }

  uint64_t v35 = a6;
  id v36 = v12;
  id v37 = v11;
  [MEMORY[0x189603FC8] dictionary];
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v34 = v10;
  obuint64_t j = v10;
  uint64_t v13 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (!v13)
  {
    id v15 = 0LL;
    goto LABEL_25;
  }

  uint64_t v14 = v13;
  id v15 = 0LL;
  uint64_t v39 = *(void *)v46;
  while (2)
  {
    uint64_t v16 = 0LL;
    id v17 = v15;
    do
    {
      if (*(void *)v46 != v39) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void *)(*((void *)&v45 + 1) + 8 * v16);
      id v19 = (void *)MEMORY[0x1895C3FC8]();
      id v44 = 0LL;
      -[TPModel peerWithID:error:](self, "peerWithID:error:", v18, &v44);
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      id v21 = v44;
      if (!v20)
      {
        TPModelLog();
        id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        if (v21)
        {
          if (v23)
          {
            *(_DWORD *)__int128 buf = 138543618;
            uint64_t v50 = v18;
            __int16 v51 = 2114;
            id v52 = v21;
            __int128 v24 = v22;
            __int128 v25 = "Error finding peer %{public}@: %{public}@";
LABEL_13:
            _os_log_impl(&dword_188398000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0x16u);
          }
        }

        else if (v23)
        {
          *(_DWORD *)__int128 buf = 138543618;
          uint64_t v50 = v18;
          __int16 v51 = 2114;
          id v52 = 0LL;
          __int128 v24 = v22;
          __int128 v25 = "Peer not in DB %{public}@: %{public}@";
          goto LABEL_13;
        }
      }

      [v20 stableInfo];
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
      id v42 = 0LL;
      id v43 = v17;
      BOOL v27 = -[TPModel considerPolicyFromPeerID:stableInfo:secrets:newestPolicyDoc:error:]( self,  "considerPolicyFromPeerID:stableInfo:secrets:newestPolicyDoc:error:",  v18,  v26,  v40,  &v43,  &v42);
      id v15 = v43;

      id v28 = v42;
      objc_autoreleasePoolPop(v19);
      if (!v27)
      {
        if (v35) {
          *uint64_t v35 = v28;
        }

        uint64_t v29 = 0LL;
        id v10 = v34;
        id v12 = v36;
        id v11 = v37;
        goto LABEL_34;
      }

      ++v16;
      id v17 = v15;
    }

    while (v14 != v16);
    uint64_t v14 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v14) {
      continue;
    }
    break;
  }

- (BOOL)considerPolicyFromPeerID:(id)a3 stableInfo:(id)a4 secrets:(id)a5 newestPolicyDoc:(id *)a6 error:(id *)a7
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v13)
  {
    BOOL v29 = 1;
    goto LABEL_28;
  }

  id v57 = a7;
  uint64_t v58 = self;
  id v15 = a6;
  id v59 = v12;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  [v13 policySecrets];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v62;
    do
    {
      for (uint64_t i = 0LL; i != v18; ++i)
      {
        if (*(void *)v62 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v61 + 1) + 8 * i);
        [v13 policySecrets];
        id v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 objectForKeyedSubscript:v21];
        BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 setObject:v23 forKeyedSubscript:v21];
      }

      uint64_t v18 = [v16 countByEnumeratingWithState:&v61 objects:v69 count:16];
    }

    while (v18);
  }

  __int128 v24 = v15;
  if (!*v15) {
    goto LABEL_12;
  }
  [*v15 version];
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v26 = [v25 versionNumber];
  [v13 bestPolicyVersion];
  BOOL v27 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v28 = [v27 versionNumber];

  if (v26 <= v28)
  {
LABEL_12:
    -[TPModel dbAdapter](v58, "dbAdapter");
    id v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 bestPolicyVersion];
    BOOL v31 = (void *)objc_claimAutoreleasedReturnValue();
    id v60 = 0LL;
    objc_msgSend(v30, "policyWithVersion:error:", objc_msgSend(v31, "versionNumber"), &v60);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    id v33 = v60;

    id v12 = v59;
    if (v33)
    {
      if (v57)
      {
        BOOL v29 = 0;
        id *v57 = v33;
LABEL_27:

        goto LABEL_28;
      }

- (id)getViewsForPeer:(id)a3 stableInfo:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x189604010];
  id v10 = a4;
  [v8 peerID];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setWithObject:v11];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 peerID];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPModel policyForPeerIDs:candidatePeerID:candidateStableInfo:error:]( self,  "policyForPeerIDs:candidatePeerID:candidateStableInfo:error:",  v12,  v13,  v10,  a5);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    [v8 modelID];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 viewsForModel:v15 error:a5];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  return v16;
}

- (id)getViewsForCRK:(id)a3 donorPermanentInfo:(id)a4 donorStableInfo:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  -[TPModel getViewsForPeer:stableInfo:error:](self, "getViewsForPeer:stableInfo:error:", v11, v12, a6);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = (void *)[v13 mutableCopy];

  if (!v14)
  {
    id v19 = 0LL;
    goto LABEL_11;
  }

  id v15 = (void *)MEMORY[0x189604010];
  [v11 peerID];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 setWithObject:v16];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 peerID];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPModel policyForPeerIDs:candidatePeerID:candidateStableInfo:error:]( self,  "policyForPeerIDs:candidatePeerID:candidateStableInfo:error:",  v17,  v18,  v12,  a6);
  id v19 = (id)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    [v19 inheritedExcludedViews];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 version];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)[v21 versionNumber] <= 0xB)
    {
      uint64_t v22 = [v20 count];

      if (v22)
      {
LABEL_8:
        [v14 minusSet:v20];

LABEL_9:
        id v19 = v14;
        goto LABEL_11;
      }

      [MEMORY[0x189604010] setWithArray:&unk_18A2345A8];
      uint64_t v21 = v20;
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_8;
  }

- (id)getPeerIDsTrustedByPeerWithID:(id)a3 toAccessView:(id)a4 error:(id *)a5
{
  id v8 = a4;
  -[TPModel actualPeerWithID:error:](self, "actualPeerWithID:error:", a3, a5);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v9;
  if (v9)
  {
    [v9 dynamicInfo];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPModel getPeerIDsTrustedByPeerWithDynamicInfo:toAccessView:error:]( self,  "getPeerIDsTrustedByPeerWithDynamicInfo:toAccessView:error:",  v11,  v8,  a5);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (id)getPeerIDsTrustedByPeerWithDynamicInfo:(id)a3 toAccessView:(id)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v31 = a4;
  [v8 includedPeerIDs];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FE0] set];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v39 = 0LL;
  -[TPModel policyForPeerIDs:candidatePeerID:candidateStableInfo:error:]( self,  "policyForPeerIDs:candidatePeerID:candidateStableInfo:error:",  v9,  0LL,  0LL,  &v39);
  id v30 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v39;
  if (!v11)
  {
    unint64_t v28 = v10;
    unint64_t v26 = v9;
    id v27 = v8;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    obuint64_t j = v9;
    uint64_t v33 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
    id v12 = 0LL;
    if (!v33) {
      goto LABEL_20;
    }
    uint64_t v32 = *(void *)v36;
    while (1)
    {
      for (uint64_t i = 0LL; i != v33; ++i)
      {
        id v15 = v12;
        if (*(void *)v36 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v17 = (void *)MEMORY[0x1895C3FC8]();
        id v34 = v12;
        -[TPModel peerWithID:error:](self, "peerWithID:error:", v16, &v34);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        id v12 = v34;

        if (v18)
        {
          [v18 permanentInfo];
          id v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v19 modelID];
          id v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v30 categoryForModel:v20];
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          TPModelLog();
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
          if (v12)
          {
            if (!v22) {
              goto LABEL_18;
            }
            *(_DWORD *)__int128 buf = 138543618;
            uint64_t v41 = v16;
            __int16 v42 = 2114;
            id v43 = v12;
            BOOL v23 = v21;
            __int128 v24 = "Error finding peer %{public}@: %{public}@";
          }

          else
          {
            if (!v22) {
              goto LABEL_18;
            }
            *(_DWORD *)__int128 buf = 138543618;
            uint64_t v41 = v16;
            __int16 v42 = 2114;
            id v43 = 0LL;
            BOOL v23 = v21;
            __int128 v24 = "Peer not in DB %{public}@: %{public}@";
          }

          _os_log_impl(&dword_188398000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0x16u);
        }

- (id)vectorClockWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __32__TPModel_vectorClockWithError___block_invoke;
  v12[3] = &unk_18A22BB38;
  id v6 = v5;
  id v13 = v6;
  id v11 = 0LL;
  -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v12, &v11);
  id v7 = v11;
  id v8 = v7;
  if (v7)
  {
    id v9 = 0LL;
    if (a3) {
      *a3 = v7;
    }
  }

  else
  {
    id v9 = v6;
  }

  return v9;
}

- (BOOL)doesOctagonContainDistrustedRecoveryKeysWithError:(id *)a3
{
  id v6 = (void *)MEMORY[0x1895C3FC8](self, a2);
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = (id)0xAAAAAAAAAAAAAAAALL;
  [MEMORY[0x189603FE0] set];
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = 0LL;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __61__TPModel_doesOctagonContainDistrustedRecoveryKeysWithError___block_invoke;
  v11[3] = &unk_18A22BAE8;
  void v11[4] = &v12;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v11, &v10);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v10;
  if (!v8)
  {
    [(id)v13[5] intersectSet:v7];
    BOOL v3 = [(id)v13[5] count] != 0;
  }

  _Block_object_dispose(&v12, 8);
  objc_autoreleasePoolPop(v6);
  if (v8)
  {
    BOOL v3 = 0;
    if (a3) {
      *a3 = v8;
    }
  }

  return v3;
}

- (id)bestRecoveryKeyForStableInfo:(id)a3 vouchers:(id)a4 error:(id *)a5
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = -[TPRecoveryKeyPair initWithStableInfo:](objc_alloc(&OBJC_CLASS___TPRecoveryKeyPair), "initWithStableInfo:", v7);
  -[TPRecoveryKeyPair signingKeyData](v9, "signingKeyData");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPModel recoveryKeyPeerID:](self, "recoveryKeyPeerID:", v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v12 = (void *)MEMORY[0x1895C3FC8]();
  uint64_t v44 = 0LL;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000LL;
  __int128 v47 = __Block_byref_object_copy_;
  __int128 v48 = __Block_byref_object_dispose_;
  id v49 = (id)0xAAAAAAAAAAAAAAAALL;
  [MEMORY[0x189603FE0] set];
  id v49 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v38 = 0LL;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  uint64_t v41 = __Block_byref_object_copy_;
  __int16 v42 = __Block_byref_object_dispose_;
  id v43 = (id)0xAAAAAAAAAAAAAAAALL;
  [MEMORY[0x189603FE0] set];
  id v43 = (id)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1895F87A8];
  v32[1] = 3221225472LL;
  v32[2] = __55__TPModel_bestRecoveryKeyForStableInfo_vouchers_error___block_invoke;
  v32[3] = &unk_18A22BD18;
  id v13 = v11;
  id v33 = v13;
  __int128 v36 = &v38;
  id v14 = v8;
  id v34 = v14;
  __int128 v35 = self;
  __int128 v37 = &v44;
  id v31 = 0LL;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v32, &v31);
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = v31;
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = 0LL;
LABEL_3:
    LODWORD(v19) = 1;
    goto LABEL_6;
  }

  [(id)v39[5] intersectSet:v15];
  if ([(id)v39[5] count])
  {
    -[TPModel removeRecoveryKey](self, "removeRecoveryKey");
    uint64_t v18 = 0LL;
    id v17 = 0LL;
    LODWORD(v19) = 0;
    goto LABEL_6;
  }

  [(id)v45[5] intersectSet:v15];
  [(id)v45[5] anyObject];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    id v30 = 0LL;
    -[TPModel peerWithID:error:](self, "peerWithID:error:", v19, &v30);
    BOOL v22 = (void *)objc_claimAutoreleasedReturnValue();
    id v17 = v30;
    if (v22)
    {
      BOOL v23 = objc_alloc(&OBJC_CLASS___TPRecoveryKeyPair);
      [v22 stableInfo];
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = -[TPRecoveryKeyPair initWithStableInfo:](v23, "initWithStableInfo:", v24);
LABEL_23:

      goto LABEL_3;
    }

    TPModelLog();
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v25 = os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v25)
      {
        *(_DWORD *)__int128 buf = 138543618;
        __int16 v51 = v19;
        __int16 v52 = 2114;
        id v53 = v17;
        unint64_t v26 = "Error finding peer %{public}@: %{public}@";
        id v27 = (os_log_s *)v24;
        uint32_t v28 = 22;
LABEL_21:
        _os_log_impl(&dword_188398000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
      }
    }

    else if (v25)
    {
      *(_DWORD *)__int128 buf = 138543362;
      __int16 v51 = v19;
      unint64_t v26 = "Peer not in DB %{public}@";
      id v27 = (os_log_s *)v24;
      uint32_t v28 = 12;
      goto LABEL_21;
    }

    uint64_t v18 = 0LL;
    goto LABEL_23;
  }

  uint64_t v18 = 0LL;
  id v17 = 0LL;
LABEL_6:

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  objc_autoreleasePoolPop(v12);
  if ((_DWORD)v19)
  {
    if (a5) {
      *a5 = v17;
    }
    id v20 = v18;
  }

  else
  {
    id v20 = 0LL;
  }

  return v20;
}

- (id)bestWalrusForStableInfo:(id)a3 walrusStableChanges:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v21 = 0LL;
  -[TPModel bestWalrusAcrossTrustedPeersWithError:](self, "bestWalrusAcrossTrustedPeersWithError:", &v21);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v21;
  uint64_t v12 = v11;
  if (!v11)
  {
    if (v9 && v10)
    {
      uint64_t v14 = [v10 clock];
      [v8 walrusSetting];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 == [v15 clock])
      {
        [v8 walrusSetting];
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        int v17 = [v16 value];
        int v18 = [v9 value];

        if (v17 == v18)
        {
          [v8 walrusSetting];
          id v13 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
      }

      else
      {
      }

      objc_msgSend(v10, "setClock:", objc_msgSend(v10, "clock") + 1);
      objc_msgSend(v10, "setValue:", objc_msgSend(v9, "value"));
    }

    else
    {
      if (v9 && !v10)
      {
        id v10 = (void *)[v9 copy];
        [v10 setClock:0];
      }

      if (!v10)
      {
        [v8 walrusSetting];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          [v8 walrusSetting];
          id v19 = (void *)objc_claimAutoreleasedReturnValue();
          id v10 = (void *)[v19 copy];

          [v10 setClock:0];
        }
      }
    }

    id v13 = v10;
    id v10 = v13;
    goto LABEL_19;
  }

  id v13 = 0LL;
  if (a5) {
    *a5 = v11;
  }
LABEL_19:

  return v13;
}

- (unint64_t)trustedPeerCountWithError:(id *)a3
{
  id v5 = (void *)MEMORY[0x1895C3FC8](self, a2);
  id v10 = 0LL;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", &__block_literal_global, &v10);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v10;
  if (v7)
  {

    objc_autoreleasePoolPop(v5);
    unint64_t v8 = 0LL;
    if (a3) {
      *a3 = v7;
    }
  }

  else
  {
    unint64_t v8 = [v6 count];

    objc_autoreleasePoolPop(v5);
  }

  return v8;
}

- (id)bestWalrusAcrossTrustedPeersWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v6 = (void *)MEMORY[0x1895C3FC8](self, a2);
  uint64_t v23 = 0LL;
  __int128 v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  unint64_t v26 = __Block_byref_object_copy_;
  id v27 = __Block_byref_object_dispose_;
  id v28 = (id)0xAAAAAAAAAAAAAAAALL;
  [MEMORY[0x189603FC8] dictionary];
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = 0LL;
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __49__TPModel_bestWalrusAcrossTrustedPeersWithError___block_invoke;
  v22[3] = &unk_18A22BAE8;
  void v22[4] = &v23;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v22, &v21);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v21;
  if (!v8)
  {
    [MEMORY[0x189603FA8] array];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v10 = (id)v24[5];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v7, "containsObject:", v14, (void)v17))
          {
            [(id)v24[5] objectForKeyedSubscript:v14];
            id v15 = (void *)objc_claimAutoreleasedReturnValue();
            [v9 addObject:v15];
          }
        }

        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v29 count:16];
      }

      while (v11);
    }

    +[TPModel pickClock:](&OBJC_CLASS___TPModel, "pickClock:", v9);
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v23, 8);
  objc_autoreleasePoolPop(v6);
  if (v8)
  {
    BOOL v3 = 0LL;
    if (a3) {
      *a3 = v8;
    }
  }

  return v3;
}

- (id)bestWebAccessAcrossTrustedPeersWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v6 = (void *)MEMORY[0x1895C3FC8](self, a2);
  uint64_t v23 = 0LL;
  __int128 v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  unint64_t v26 = __Block_byref_object_copy_;
  id v27 = __Block_byref_object_dispose_;
  id v28 = (id)0xAAAAAAAAAAAAAAAALL;
  [MEMORY[0x189603FC8] dictionary];
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = 0LL;
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __52__TPModel_bestWebAccessAcrossTrustedPeersWithError___block_invoke;
  v22[3] = &unk_18A22BAE8;
  void v22[4] = &v23;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v22, &v21);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v21;
  if (!v8)
  {
    [MEMORY[0x189603FA8] array];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v10 = (id)v24[5];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v7, "containsObject:", v14, (void)v17))
          {
            [(id)v24[5] objectForKeyedSubscript:v14];
            id v15 = (void *)objc_claimAutoreleasedReturnValue();
            [v9 addObject:v15];
          }
        }

        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v29 count:16];
      }

      while (v11);
    }

    +[TPModel pickClock:](&OBJC_CLASS___TPModel, "pickClock:", v9);
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v23, 8);
  objc_autoreleasePoolPop(v6);
  if (v8)
  {
    BOOL v3 = 0LL;
    if (a3) {
      *a3 = v8;
    }
  }

  return v3;
}

- (id)bestWebAccessForStableInfo:(id)a3 webAccessStableChanges:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v21 = 0LL;
  -[TPModel bestWebAccessAcrossTrustedPeersWithError:](self, "bestWebAccessAcrossTrustedPeersWithError:", &v21);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v21;
  uint64_t v12 = v11;
  if (!v11)
  {
    if (v9 && v10)
    {
      uint64_t v14 = [v10 clock];
      [v8 webAccess];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 == [v15 clock])
      {
        [v8 webAccess];
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        int v17 = [v16 value];
        int v18 = [v9 value];

        if (v17 == v18)
        {
          [v8 webAccess];
          id v13 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
      }

      else
      {
      }

      objc_msgSend(v10, "setClock:", objc_msgSend(v10, "clock") + 1);
      objc_msgSend(v10, "setValue:", objc_msgSend(v9, "value"));
    }

    else
    {
      if (v9 && !v10)
      {
        id v10 = (void *)[v9 copy];
        [v10 setClock:0];
      }

      if (!v10)
      {
        [v8 webAccess];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          [v8 webAccess];
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
          id v10 = (void *)[v19 copy];

          [v10 setClock:0];
        }
      }
    }

    id v13 = v10;
    id v10 = v13;
    goto LABEL_19;
  }

  id v13 = 0LL;
  if (a5) {
    *a5 = v11;
  }
LABEL_19:

  return v13;
}

- (id)untrustedPeerIDsWithError:(id *)a3
{
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  uint64_t v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = (id)0xAAAAAAAAAAAAAAAALL;
  [MEMORY[0x189603FE0] set];
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = 0LL;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __37__TPModel_untrustedPeerIDsWithError___block_invoke;
  v10[3] = &unk_18A22BB10;
  v10[4] = &v11;
  -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v10, &v9);
  id v5 = v9;
  id v6 = v5;
  if (v5)
  {
    id v7 = 0LL;
    if (a3) {
      *a3 = v5;
    }
  }

  else
  {
    id v7 = (id)v12[5];
  }

  _Block_object_dispose(&v11, 8);
  return v7;
}

- (id)possibleSponsorsForRecoveryKey:(id)a3 block:(id)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  uint64_t v33 = 0LL;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  __int128 v36 = __Block_byref_object_copy_;
  __int128 v37 = __Block_byref_object_dispose_;
  id v38 = (id)0xAAAAAAAAAAAAAAAALL;
  [MEMORY[0x189603FE0] set];
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1895C3FC8]();
  TPModelLog();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "signingKeyData", context);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 encryptionKeyData];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138543618;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v5;
    _os_log_impl( &dword_188398000,  v10,  OS_LOG_TYPE_DEFAULT,  "possibleSponsorsForRecoveryKey: sign %{public}@, enc %{public}@",  buf,  0x16u);
  }

  [v8 signingKeyData];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPModel recoveryKeyPeerID:](self, "recoveryKeyPeerID:", v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  *(void *)__int128 buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  __int16 v42 = __Block_byref_object_copy_;
  id v43 = __Block_byref_object_dispose_;
  id v44 = (id)0xAAAAAAAAAAAAAAAALL;
  [MEMORY[0x189603FE0] set];
  id v44 = (id)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = __54__TPModel_possibleSponsorsForRecoveryKey_block_error___block_invoke;
  v27[3] = &unk_18A22BDC0;
  id v14 = v13;
  id v28 = v14;
  id v31 = buf;
  id v15 = v8;
  id v29 = v15;
  id v16 = v9;
  id v30 = v16;
  uint64_t v32 = &v33;
  id v26 = 0LL;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v27, &v26);
  int v17 = (void *)objc_claimAutoreleasedReturnValue();
  id v18 = v26;
  if (!v18)
  {
    [*(id *)(*(void *)&buf[8] + 40) intersectSet:v17];
    if ([*(id *)(*(void *)&buf[8] + 40) count])
    {
      TPModelLog();
      __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v39 = 0;
        _os_log_impl( &dword_188398000,  v19,  OS_LOG_TYPE_DEFAULT,  "possibleSponsorsForRecoveryKey: registered recovery key is not trusted",  v39,  2u);
      }

- (id)peerIDThatTrustsRecoveryKeys:(id)a3 canIntroducePeer:(id)a4 stableInfo:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __74__TPModel_peerIDThatTrustsRecoveryKeys_canIntroducePeer_stableInfo_error___block_invoke;
  v18[3] = &unk_18A22BDE8;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v12 = v11;
  id v13 = v10;
  -[TPModel possibleSponsorsForRecoveryKey:block:error:]( self,  "possibleSponsorsForRecoveryKey:block:error:",  a3,  v18,  a6);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = v14;
  if (*a6)
  {
    id v16 = 0LL;
  }

  else
  {
    [v14 anyObject];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (BOOL)isRecoveryKeyEnrolledWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v5 = -[TPModel recoverySigningPubKey](self, "recoverySigningPubKey");
  if (!v5) {
    return 0;
  }
  id v6 = (void *)v5;
  -[TPModel recoveryEncryptionPubKey](self, "recoveryEncryptionPubKey");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7) {
    return 0;
  }
  id v8 = objc_alloc(&OBJC_CLASS___TPRecoveryKeyPair);
  -[TPModel recoverySigningPubKey](self, "recoverySigningPubKey");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPModel recoveryEncryptionPubKey](self, "recoveryEncryptionPubKey");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = -[TPRecoveryKeyPair initWithSigningKeyData:encryptionKeyData:]( v8,  "initWithSigningKeyData:encryptionKeyData:",  v9,  v10);

  id v17 = 0LL;
  -[TPModel possibleSponsorsForRecoveryKey:block:error:]( self,  "possibleSponsorsForRecoveryKey:block:error:",  v11,  &__block_literal_global_99,  &v17);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = v17;
  if (v13)
  {
    TPModelLog();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543362;
      id v19 = v13;
      _os_log_impl( &dword_188398000,  v14,  OS_LOG_TYPE_DEFAULT,  "Error determining possible sponsors: %{public}@",  buf,  0xCu);
    }

    BOOL v15 = 0;
    if (a3) {
      *a3 = v13;
    }
  }

  else
  {
    BOOL v15 = [v12 count] != 0;
  }

  return v15;
}

- (void)removeRecoveryKey
{
}

- (void)setRecoveryKeys:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[TPModel recoverySigningPubKey](self, "recoverySigningPubKey");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 signingKeyData];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v5 isEqualToData:v6])
  {
    -[TPModel recoveryEncryptionPubKey](self, "recoveryEncryptionPubKey");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 encryptionKeyData];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = [v7 isEqualToData:v8];

    if ((v9 & 1) != 0) {
      goto LABEL_8;
    }
  }

  else
  {
  }

  TPModelLog();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[TPModel recoverySigningPubKey](self, "recoverySigningPubKey");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPModel recoveryEncryptionPubKey](self, "recoveryEncryptionPubKey");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 signingKeyData];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 encryptionKeyData];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    int v17 = 138544130;
    id v18 = v11;
    __int16 v19 = 2114;
    uint64_t v20 = v12;
    __int16 v21 = 2114;
    uint64_t v22 = v13;
    __int16 v23 = 2114;
    __int128 v24 = v14;
    _os_log_impl( &dword_188398000,  v10,  OS_LOG_TYPE_DEFAULT,  "Recovery Keys changed! currently set signingKey: %{public}@, currently set encryptionKey: %{public}@, new signingK ey: %{public}@, new encryption Key: %{public}@",  (uint8_t *)&v17,  0x2Au);
  }

LABEL_8:
  [v4 encryptionKeyData];
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPModel setRecoveryEncryptionPubKey:](self, "setRecoveryEncryptionPubKey:", v15);

  [v4 signingKeyData];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPModel setRecoverySigningPubKey:](self, "setRecoverySigningPubKey:", v16);
}

- (id)recoverySigningPublicKey
{
  return self->_recoverySigningPubKey;
}

- (id)recoveryEncryptionPublicKey
{
  return self->_recoveryEncryptionPubKey;
}

- (id)possibleSponsorsForCustodianRecoveryKey:(id)a3 block:(id)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  uint64_t v33 = 0LL;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  __int128 v36 = __Block_byref_object_copy_;
  __int128 v37 = __Block_byref_object_dispose_;
  id v38 = (id)0xAAAAAAAAAAAAAAAALL;
  [MEMORY[0x189603FE0] set];
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1895C3FC8]();
  TPModelLog();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    [v8 uuid];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v8 peerID];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138543618;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    _os_log_impl( &dword_188398000,  v10,  OS_LOG_TYPE_DEFAULT,  "possibleSponsorsForCustodianRecoveryKey: %{public}@/%{public}@",  buf,  0x16u);
  }

  *(void *)__int128 buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  uint64_t v46 = __Block_byref_object_copy_;
  __int128 v47 = __Block_byref_object_dispose_;
  id v48 = (id)0xAAAAAAAAAAAAAAAALL;
  [MEMORY[0x189603FE0] set];
  id v48 = (id)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1895F87A8];
  v28[1] = 3221225472LL;
  v28[2] = __63__TPModel_possibleSponsorsForCustodianRecoveryKey_block_error___block_invoke;
  v28[3] = &unk_18A22BE50;
  id v12 = v8;
  id v29 = v12;
  id v31 = buf;
  id v13 = v9;
  id v30 = v13;
  uint64_t v32 = &v33;
  id v27 = 0LL;
  -[TPModel _iterateOverPeersWithBlock:error:](self, "_iterateOverPeersWithBlock:error:", v28, &v27);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = v27;
  if (!v15)
  {
    [*(id *)(*(void *)&buf[8] + 40) intersectSet:v14];
    if ([*(id *)(*(void *)&buf[8] + 40) count])
    {
      TPModelLog();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        [v12 uuid];
        int v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 peerID];
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)id v39 = 138543618;
        uint64_t v40 = v17;
        __int16 v41 = 2114;
        __int16 v42 = v18;
        _os_log_impl( &dword_188398000,  v16,  OS_LOG_TYPE_DEFAULT,  "possibleSponsorsForCustodianRecoveryKey: CRK %{public}@/%{public}@ is not trusted",  v39,  0x16u);
      }

- (id)peerIDThatTrustsCustodianRecoveryKeys:(id)a3 canIntroducePeer:(id)a4 stableInfo:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __83__TPModel_peerIDThatTrustsCustodianRecoveryKeys_canIntroducePeer_stableInfo_error___block_invoke;
  v20[3] = &unk_18A22BDE8;
  v20[4] = self;
  id v12 = v10;
  id v21 = v12;
  id v13 = v11;
  id v22 = v13;
  id v19 = 0LL;
  -[TPModel possibleSponsorsForCustodianRecoveryKey:block:error:]( self,  "possibleSponsorsForCustodianRecoveryKey:block:error:",  a3,  v20,  &v19);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = v19;
  id v16 = v15;
  if (v15)
  {
    int v17 = 0LL;
    if (a6) {
      *a6 = v15;
    }
  }

  else
  {
    [v14 anyObject];
    int v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (BOOL)isCustodianRecoveryKeyTrusted:(id)a3 error:(id *)a4
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v10 = 0LL;
  -[TPModel possibleSponsorsForCustodianRecoveryKey:block:error:]( self,  "possibleSponsorsForCustodianRecoveryKey:block:error:",  a3,  &__block_literal_global_100,  &v10);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v10;
  if (v6)
  {
    TPModelLog();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543362;
      id v12 = v6;
      _os_log_impl( &dword_188398000,  v7,  OS_LOG_TYPE_DEFAULT,  "Error determining possible sponsors: %{public}@",  buf,  0xCu);
    }

    BOOL v8 = 0;
    if (a4) {
      *a4 = v6;
    }
  }

  else
  {
    BOOL v8 = [v5 count] != 0;
  }

  return v8;
}

- (void)registerCustodianRecoveryKey:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 handleFailureInMethod:a2 object:self file:@"TPModel.m" lineNumber:2687 description:@"custodianRecoveryKey"];
  }

  -[TPModel custodianRecoveryKeys](self, "custodianRecoveryKeys");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 peerID];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v7];
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[TPModel custodianRecoveryKeys](self, "custodianRecoveryKeys");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 peerID];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v5 forKeyedSubscript:v10];
  }

  TPModelLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    [v5 peerID];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPModel custodianRecoveryKeys](self, "custodianRecoveryKeys");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    int v15 = 138543618;
    id v16 = v12;
    __int16 v17 = 2048;
    uint64_t v18 = [v13 count];
    _os_log_impl( &dword_188398000,  v11,  OS_LOG_TYPE_DEFAULT,  "registerCustodianRecoveryKey %{public}@ -- size now %lu",  (uint8_t *)&v15,  0x16u);
  }
}

- (void)removeCustodianRecoveryKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  TPModelLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl( &dword_188398000,  v4,  OS_LOG_TYPE_DEFAULT,  "removeCustodianRecoveryKey: %{public}@",  (uint8_t *)&v5,  0xCu);
  }
}

- (id)findCustodianRecoveryKeyWithUUID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  -[TPModel custodianRecoveryKeys](self, "custodianRecoveryKeys");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * v8);
        -[TPModel custodianRecoveryKeys](self, "custodianRecoveryKeys");
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 objectForKeyedSubscript:v9];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 uuid];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        char v13 = [v12 isEqual:v4];

        if ((v13 & 1) != 0)
        {
          -[TPModel custodianRecoveryKeys](self, "custodianRecoveryKeys");
          int v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 objectForKeyedSubscript:v9];
          id v14 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v14 = 0LL;
LABEL_11:

  return v14;
}

- (id)allCustodianRecoveryKeys
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 allValues];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)allCustodianRecoveryKeyPeerIDs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 allKeys];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)currentStatePossiblyMissingDataWithError:(id *)a3
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  context = (void *)MEMORY[0x1895C3FC8](self, a2);
  uint64_t v34 = 0LL;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  __int128 v37 = __Block_byref_object_copy_;
  id v38 = __Block_byref_object_dispose_;
  id v39 = (id)0xAAAAAAAAAAAAAAAALL;
  id v39 = objc_alloc_init(MEMORY[0x189603FC8]);
  v32[0] = 0LL;
  v32[1] = v32;
  v32[2] = 0x3032000000LL;
  v32[3] = __Block_byref_object_copy_;
  void v32[4] = __Block_byref_object_dispose_;
  id v33 = (id)0xAAAAAAAAAAAAAAAALL;
  [MEMORY[0x189603FE0] set];
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = (void *)MEMORY[0x189604010];
  -[TPModel custodianRecoveryKeys](self, "custodianRecoveryKeys");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 allKeys];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setWithArray:v6];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = MEMORY[0x1895F87A8];
  v28[1] = 3221225472LL;
  v28[2] = __52__TPModel_currentStatePossiblyMissingDataWithError___block_invoke;
  v28[3] = &unk_18A22BE98;
  id v30 = v32;
  id v8 = v7;
  id v29 = v8;
  id v31 = &v34;
  id v27 = 0LL;
  -[TPModel enumeratePeersUsingBlock:error:](self, "enumeratePeersUsingBlock:error:", v28, &v27);
  id v22 = v27;
  __int128 v20 = v8;
  if (v22 || ![(id)v35[5] count])
  {
    LOBYTE(v9) = 0;
  }

  else
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v10 = (id)v35[5];
    uint64_t v9 = [v10 countByEnumeratingWithState:&v23 objects:v44 count:16];
    if (v9)
    {
      uint64_t v11 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v10);
          }
          uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          [(id)v35[5] objectForKeyedSubscript:v13];
          id v14 = (void *)objc_claimAutoreleasedReturnValue();
          TPModelLog();
          int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138543618;
            __int16 v41 = v14;
            __int16 v42 = 2114;
            uint64_t v43 = v13;
            _os_log_impl( &dword_188398000,  v15,  OS_LOG_TYPE_DEFAULT,  "Peer %{public}@ trusts the following unknown peer IDs: %{public}@",  buf,  0x16u);
          }

          if (+[TPHashBuilder algoOfHash:](&OBJC_CLASS___TPHashBuilder, "algoOfHash:", v13) != -1)
          {

            LOBYTE(v9) = 1;
            goto LABEL_18;
          }

          TPModelLog();
          id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138543618;
            __int16 v41 = v14;
            __int16 v42 = 2114;
            uint64_t v43 = v13;
            _os_log_impl( &dword_188398000,  v16,  OS_LOG_TYPE_DEFAULT,  "Peer %{public}@ trusts the following peer ID, but we don't recognize the hash: %{public}@",  buf,  0x16u);
          }
        }

        uint64_t v9 = [v10 countByEnumeratingWithState:&v23 objects:v44 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

- (BOOL)suppressInitialInfoLogging
{
  return self->_suppressInitialInfoLogging;
}

- (void)setSuppressInitialInfoLogging:(BOOL)a3
{
  self->_suppressInitialInfoLogging = a3;
}

- (TPModelDBAdapterProtocol)dbAdapter
{
  return self->_dbAdapter;
}

- (void)setDbAdapter:(id)a3
{
}

- (TPDecrypter)decrypter
{
  return self->_decrypter;
}

- (void)setDecrypter:(id)a3
{
}

- (NSData)recoverySigningPubKey
{
  return self->_recoverySigningPubKey;
}

- (void)setRecoverySigningPubKey:(id)a3
{
}

- (NSData)recoveryEncryptionPubKey
{
  return self->_recoveryEncryptionPubKey;
}

- (void)setRecoveryEncryptionPubKey:(id)a3
{
}

- (NSMutableDictionary)custodianRecoveryKeys
{
  return self->_custodianRecoveryKeys;
}

- (void)setCustodianRecoveryKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

void __52__TPModel_currentStatePossiblyMissingDataWithError___block_invoke(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [v3 peerID];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1[5] + 8) + 40) addObject:v4];
  uint64_t v5 = (void *)MEMORY[0x189603FE0];
  [v3 dynamicInfo];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 includedPeerIDs];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setWithSet:v7];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  [v8 minusSet:*(void *)(*(void *)(a1[5] + 8) + 40)];
  [v8 minusSet:a1[4]];
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend( *(id *)(*(void *)(a1[6] + 8) + 40),  "setObject:forKeyedSubscript:",  v4,  *(void *)(*((void *)&v14 + 1) + 8 * v13++),  (void)v14);
      }

      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v11);
  }

  [*(id *)(*(void *)(a1[6] + 8) + 40) setObject:0 forKeyedSubscript:v4];
}

uint64_t __47__TPModel_isCustodianRecoveryKeyTrusted_error___block_invoke()
{
  return 1LL;
}

uint64_t __83__TPModel_peerIDThatTrustsCustodianRecoveryKeys_canIntroducePeer_stableInfo_error___block_invoke( void *a1,  void *a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  [a2 peerID];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  id v12 = 0LL;
  uint64_t v7 = [v4 checkIntroductionForCandidate:v5 stableInfo:v6 withSponsorID:v3 error:&v12];
  id v8 = v12;
  if ((v7 & 1) == 0)
  {
    TPModelLog();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      [(id)a1[5] peerID];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 138543874;
      __int128 v14 = v3;
      __int16 v15 = 2114;
      __int128 v16 = v10;
      __int16 v17 = 2114;
      id v18 = v8;
      _os_log_impl( &dword_188398000,  v9,  OS_LOG_TYPE_DEFAULT,  "Peer %{public}@ supports this Custodian RK, but cannot sponsor peer %{public}@: %{public}@",  buf,  0x20u);
    }
  }

  return v7;
}

void __63__TPModel_possibleSponsorsForCustodianRecoveryKey_block_error___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  [v13 peerID];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 dynamicInfo];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 excludedPeerIDs];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) peerID];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 48);
LABEL_6:
    [*(id *)(*(void *)(v8 + 8) + 40) addObject:v3];
    goto LABEL_8;
  }

  [v13 dynamicInfo];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 includedPeerIDs];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) peerID];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v10 containsObject:v11])
  {

    goto LABEL_8;
  }

  int v12 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();

  if (v12)
  {
    uint64_t v8 = *(void *)(a1 + 56);
    goto LABEL_6;
  }

uint64_t __42__TPModel_isRecoveryKeyEnrolledWithError___block_invoke()
{
  return 1LL;
}

uint64_t __74__TPModel_peerIDThatTrustsRecoveryKeys_canIntroducePeer_stableInfo_error___block_invoke( void *a1,  void *a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  [a2 peerID];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  id v12 = 0LL;
  uint64_t v7 = [v4 checkIntroductionForCandidate:v5 stableInfo:v6 withSponsorID:v3 error:&v12];
  id v8 = v12;
  if ((v7 & 1) == 0)
  {
    TPModelLog();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      [(id)a1[5] peerID];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 138543874;
      __int128 v14 = v3;
      __int16 v15 = 2114;
      __int128 v16 = v10;
      __int16 v17 = 2114;
      id v18 = v8;
      _os_log_impl( &dword_188398000,  v9,  OS_LOG_TYPE_DEFAULT,  "Peer %{public}@ supports this recovery key, but cannot sponsor peer %{public}@: %{public}@",  buf,  0x20u);
    }
  }

  return v7;
}

void __54__TPModel_possibleSponsorsForRecoveryKey_block_error___block_invoke(uint64_t a1, void *a2)
{
  id v26 = a2;
  [v26 peerID];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 dynamicInfo];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 excludedPeerIDs];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v5 containsObject:*(void *)(a1 + 32)];

  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 56);
LABEL_3:
    [*(id *)(*(void *)(v7 + 8) + 40) addObject:v3];
    goto LABEL_15;
  }

  uint64_t v8 = [v26 stableInfo];
  if (!v8) {
    goto LABEL_15;
  }
  id v9 = (void *)v8;
  [v26 stableInfo];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 recoverySigningPublicKey];
  if (!v11)
  {
LABEL_14:

    goto LABEL_15;
  }

  id v12 = (void *)v11;
  [v26 stableInfo];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 recoveryEncryptionPublicKey];
  if (!v14)
  {
LABEL_13:

    goto LABEL_14;
  }

  __int16 v15 = (void *)v14;
  [*(id *)(a1 + 40) signingKeyData];
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 stableInfo];
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 recoverySigningPublicKey];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v16 isEqualToData:v18])
  {

    goto LABEL_13;
  }

  __int128 v25 = v16;
  [*(id *)(a1 + 40) encryptionKeyData];
  __int128 v24 = v17;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 stableInfo];
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 recoveryEncryptionPublicKey];
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
  int v21 = [v19 isEqualToData:v20];
  if (v21) {
    int v21 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
  int v23 = v21;

  if (v23)
  {
    uint64_t v7 = *(void *)(a1 + 64);
    goto LABEL_3;
  }

void __37__TPModel_untrustedPeerIDsWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  [a2 dynamicInfo];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 excludedPeerIDs];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    [v2 unionSet:v3];
  }

  else
  {
    [MEMORY[0x189604010] set];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 unionSet:v4];
  }
}

void __52__TPModel_bestWebAccessAcrossTrustedPeersWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 peerID];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v3 stableInfo];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 webAccess];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v5 forKeyedSubscript:v6];
}

void __49__TPModel_bestWalrusAcrossTrustedPeersWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 peerID];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v3 stableInfo];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 walrusSetting];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v5 forKeyedSubscript:v6];
}

void __55__TPModel_bestRecoveryKeyForStableInfo_vouchers_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = [v3 peerID];
  [v3 dynamicInfo];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 excludedPeerIDs];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 containsObject:*(void *)(a1 + 32)];

  uint64_t v8 = (void *)v4;
  uint64_t v9 = a1;

  if (v7) {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v8];
  }
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  obuint64_t j = *(id *)(a1 + 40);
  uint64_t v10 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  uint64_t v42 = a1;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v46;
    uint64_t v40 = v8;
    uint64_t v41 = *(void *)v46;
    do
    {
      uint64_t v13 = 0LL;
      uint64_t v43 = v11;
      do
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v45 + 1) + 8 * v13);
        [v14 sponsorID];
        __int16 v15 = (void *)objc_claimAutoreleasedReturnValue();
        int v16 = [v8 isEqualToString:v15];

        if (v16)
        {
          [v3 stableInfo];
          __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v18 = [v17 recoverySigningPublicKey];
          if (!v18) {
            goto LABEL_15;
          }
          uint64_t v19 = (void *)v18;
          uint64_t v20 = [*(id *)(v9 + 48) recoverySigningPubKey];
          if (!v20)
          {

            uint64_t v11 = v43;
LABEL_15:

            goto LABEL_16;
          }

          int v21 = (void *)v20;
          [v3 stableInfo];
          id v22 = v3;
          int v23 = (void *)objc_claimAutoreleasedReturnValue();
          [v23 recoverySigningPublicKey];
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
          [*(id *)(v9 + 48) recoverySigningPubKey];
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
          int v26 = [v24 isEqualToData:v25];

          uint64_t v9 = v42;
          uint64_t v12 = v41;

          id v3 = v22;
          uint64_t v8 = v40;

          uint64_t v11 = v43;
          if (v26)
          {
            [v3 stableInfo];
            id v27 = (void *)objc_claimAutoreleasedReturnValue();
            [v27 recoverySigningPublicKey];
            id v28 = (void *)objc_claimAutoreleasedReturnValue();
            [v14 createRecoveryECPublicKey:v28];
            id v29 = (void *)objc_claimAutoreleasedReturnValue();
            int v30 = [v14 checkSignatureWithKey:v29];

            uint64_t v12 = v41;
            uint64_t v9 = v42;
            if (v30)
            {
              [*(id *)(*(void *)(*(void *)(v42 + 64) + 8) + 40) addObject:v40];
              goto LABEL_18;
            }
          }
        }

void __61__TPModel_doesOctagonContainDistrustedRecoveryKeysWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [v3 peerID];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  objc_msgSend(v3, "dynamicInfo", 0);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 excludedPeerIDs];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) containsString:@"RK-"])
        {
          [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v4];
          goto LABEL_11;
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

void __32__TPModel_vectorClockWithError___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  [v13 stableInfo];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
  }

  else
  {
    [v13 dynamicInfo];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4) {
      goto LABEL_8;
    }
  }

  [v13 stableInfo];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = [v5 clock];

  [v13 dynamicInfo];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v8 = [v7 clock];

  if (v6 <= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v6;
  }
  [MEMORY[0x189607968] numberWithUnsignedLongLong:v9];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v11 = *(void **)(a1 + 32);
  [v13 peerID];
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setObject:v10 forKeyedSubscript:v12];

LABEL_8:
}

uint64_t __137__TPModel_dynamicInfoForJoiningPeerID_peerPermanentInfo_peerStableInfo_sponsorID_preapprovedKeys_signingKeyPair_currentMachineIDs_error___block_invoke( uint64_t a1,  void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)] ^ 1;
}

void __137__TPModel_dynamicInfoForJoiningPeerID_peerPermanentInfo_peerStableInfo_sponsorID_preapprovedKeys_signingKeyPair_currentMachineIDs_error___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [v3 permanentInfo];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 signingPubKey];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 spki];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v23;
    *(void *)&__int128 v9 = 138543362LL;
    __int128 v21 = v9;
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(v6, "isEqual:", *(void *)(*((void *)&v22 + 1) + 8 * i), v21, (void)v22))
        {
          id v13 = *(void **)(a1 + 40);
          [v3 peerID];
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v13) = [v13 containsObject:v14];

          if ((v13 & 1) != 0)
          {
            TPModelLog();
            __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              [v3 peerID];
              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)__int128 buf = v21;
              id v27 = v16;
              __int16 v17 = v15;
              uint64_t v18 = "Not including %{public}@ even through they are preapproved";
              goto LABEL_12;
            }
          }

          else
          {
            uint64_t v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
            [v3 peerID];
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
            [v19 addObject:v20];

            TPModelLog();
            __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              [v3 peerID];
              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)__int128 buf = v21;
              id v27 = v16;
              __int16 v17 = v15;
              uint64_t v18 = "Trusting %{public}@ due to preapproval";
LABEL_12:
              _os_log_impl(&dword_188398000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
            }
          }

          continue;
        }
      }

      uint64_t v10 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }

    while (v10);
  }
}

void __47__TPModel_filterPreapprovals_forExistingPeers___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5 = a2;
  [v5 peerID];
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = *(void *)(a1 + 56);
  [v5 permanentInfo];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 signingPubKey];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 spki];
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPHashBuilder hashWithAlgo:ofData:](&OBJC_CLASS___TPHashBuilder, "hashWithAlgo:ofData:", v6, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ([*(id *)(a1 + 32) isEqualToString:v10]
    && [*(id *)(a1 + 40) containsObject:v11])
  {
    [*(id *)(a1 + 48) removeObject:*(void *)(a1 + 32)];
    *a3 = 1;
  }
}

void __36__TPModel_peersWithMachineID_error___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  [v8 permanentInfo];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 machineID];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 isEqual:*(void *)(a1 + 32)];

  if (v5)
  {
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    [v8 peerID];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 addObject:v7];
  }
}

void __198__TPModel_calculateDynamicInfoFromModel_peer_peerPermanentInfo_peerStableInfo_startingDynamicInfo_addingPeerIDs_removingPeerIDs_preapprovedKeys_signingKeyPair_currentMachineIDs_sponsorPeerID_error___block_invoke( uint64_t a1,  void *a2,  _BYTE *a3)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  [v5 peerID];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *(void *)(a1 + 96);
  [v5 permanentInfo];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 signingPubKey];
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 spki];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPHashBuilder hashWithAlgo:ofData:](&OBJC_CLASS___TPHashBuilder, "hashWithAlgo:ofData:", v7, v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ([*(id *)(a1 + 32) isEqualToString:v11])
  {
    __int128 v12 = *(void **)(a1 + 40);
    [v5 permanentInfo];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = [v12 canTrustCandidate:v13 inEpoch:*(void *)(a1 + 104)];

    if ((_DWORD)v12)
    {
      TPModelLog();
      __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138543362;
        uint64_t v19 = v6;
        _os_log_impl(&dword_188398000, v14, OS_LOG_TYPE_DEFAULT, "Peer %{public}@ preapproved", (uint8_t *)&v18, 0xCu);
      }

      [*(id *)(a1 + 48) addObject:v6];
      uint64_t v15 = [*(id *)(a1 + 40) recursivelyExpandIncludedPeerIDs:*(void *)(a1 + 48) andExcludedPeerIDs:*(void *)(a1 + 56) dispositions:*(void *)(a1 + 64) withPeersTrustedBySponsorID:v6 currentMachineIDs:*(void *)(a1 + 72) forEpoch:*(void *)(a1 + 104)];
      uint64_t v16 = *(void *)(*(void *)(a1 + 88) + 8LL);
      __int16 v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      [*(id *)(a1 + 80) removeObject:*(void *)(a1 + 32)];
      *a3 = 1;
    }
  }
}

uint64_t __198__TPModel_calculateDynamicInfoFromModel_peer_peerPermanentInfo_peerStableInfo_startingDynamicInfo_addingPeerIDs_removingPeerIDs_preapprovedKeys_signingKeyPair_currentMachineIDs_sponsorPeerID_error___block_invoke_79( uint64_t a1,  void *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1895C3FC8]();
  id v5 = *(void **)(a1 + 32);
  id v13 = 0LL;
  [v5 peerWithID:v3 error:&v13];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v13;
  id v8 = v7;
  if (v6)
  {
    __int128 v9 = *(void **)(a1 + 32);
    [v6 permanentInfo];
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v9 canTrustCandidate:v10 inEpoch:*(void *)(a1 + 40)];
  }

  else
  {
    if (!v7)
    {
      uint64_t v11 = 1LL;
      goto LABEL_8;
    }

    TPModelLog();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543618;
      id v15 = v3;
      __int16 v16 = 2114;
      __int16 v17 = v8;
      _os_log_impl( &dword_188398000,  v10,  OS_LOG_TYPE_DEFAULT,  "Error finding excluded peer %{public}@: %{public}@",  buf,  0x16u);
    }

    uint64_t v11 = 1LL;
  }

LABEL_8:
  objc_autoreleasePoolPop(v4);

  return v11;
}

void __141__TPModel_considerPreapprovalsSponsoredByPeer_toRecursivelyExpandIncludedPeerIDs_andExcludedPeerIDs_dispositions_currentMachineIDs_forEpoch___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [v3 peerID];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = *(void *)(a1 + 88);
  [v3 permanentInfo];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 signingPubKey];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 spki];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPHashBuilder hashWithAlgo:ofData:](&OBJC_CLASS___TPHashBuilder, "hashWithAlgo:ofData:", v5, v8);
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ([*(id *)(a1 + 32) isEqualToString:v9])
  {
    TPModelLog();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 40) peerID];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 138543618;
      __int16 v17 = v11;
      __int16 v18 = 2114;
      uint64_t v19 = v4;
      _os_log_impl( &dword_188398000,  v10,  OS_LOG_TYPE_DEFAULT,  "Sponsor %{public}@ preapproves peer %{public}@",  buf,  0x16u);
    }

    __int128 v12 = *(void **)(a1 + 48);
    [*(id *)(a1 + 40) peerID];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) permanentInfo];
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = (id)[v12 considerCandidateID:v4 withSponsorID:v13 sponsorPermanentInfo:v14 toExpandI ncludedPeerIDs:*(void *)(a1 + 56) andExcludedPeerIDs:*(void *)(a1 + 64) dispositions:*(void *)(a1 + 72) currentMachineIDs:*(void *)(a1 + 80) forEpoch:*(void *)(a1 + 96)];
  }
}

void __160__TPModel_considerVouchersSponsoredByPeerID_sponsorPermanentInfo_toRecursivelyExpandIncludedPeerIDs_andExcludedPeerIDs_dispositions_currentMachineIDs_forEpoch___block_invoke( uint64_t a1,  void *a2,  _BYTE *a3)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  [v5 sponsorID];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    id v8 = *(void **)(a1 + 40);
    [v5 beneficiaryID];
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v8 containsObject:v9])
    {

LABEL_5:
      TPModelLog();
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_INFO))
      {
LABEL_8:

        goto LABEL_9;
      }

      *(_DWORD *)__int128 buf = 138543362;
      id v29 = v5;
      id v13 = "Skipping voucher for already known beneficiary: %{public}@";
LABEL_7:
      _os_log_impl(&dword_188398000, (os_log_t)v12, OS_LOG_TYPE_INFO, v13, buf, 0xCu);
      goto LABEL_8;
    }

    uint64_t v10 = *(void **)(a1 + 48);
    [v5 beneficiaryID];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = [v10 containsObject:v11];

    if ((_DWORD)v10) {
      goto LABEL_5;
    }
    uint64_t v14 = *(void *)(*(void *)(a1 + 88) + 8LL);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = 0LL;

    __int16 v16 = *(void **)(a1 + 56);
    [v5 sponsorID];
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = *(void *)(*(void *)(a1 + 88) + 8LL);
    obuint64_t j = *(id *)(v18 + 40);
    LOBYTE(v16) = [v16 hasPeerWithID:v17 error:&obj];
    objc_storeStrong((id *)(v18 + 40), obj);

    if ((v16 & 1) == 0)
    {
      TPModelLog();
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_INFO)) {
        goto LABEL_8;
      }
      *(_DWORD *)__int128 buf = 138543362;
      id v29 = v5;
      id v13 = "Skipping voucher for unknown sponsor: %{public}@";
      goto LABEL_7;
    }

    if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL))
    {
      TPModelLog();
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL);
        *(_DWORD *)__int128 buf = 138543618;
        id v29 = v5;
        __int16 v30 = 2114;
        uint64_t v31 = v26;
        _os_log_error_impl( &dword_188398000,  v19,  OS_LOG_TYPE_ERROR,  "DB error for sponsor %{public}@: %{public}@",  buf,  0x16u);
      }

      *a3 = 1;
    }

    else
    {
      char v20 = [*(id *)(a1 + 56) verifyVoucherSignature:v5];
      TPModelLog();
      __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      __int128 v22 = v21;
      if ((v20 & 1) != 0)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 138543362;
          id v29 = v5;
          _os_log_impl( &dword_188398000,  v22,  OS_LOG_TYPE_INFO,  "Inspecting voucher claiming to be from sponsor: %{public}@",  buf,  0xCu);
        }

        __int128 v23 = *(void **)(a1 + 56);
        [v5 beneficiaryID];
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
        id v25 = (id)[v23 considerCandidateID:v24 withSponsorID:*(void *)(a1 + 32) sponsorPermanentInfo:*(void *)(a1 + 64) toExp andIncludedPeerIDs:*(void *)(a1 + 40) andExcludedPeerIDs:*(void *)(a1 + 48) dispositions:*(void *)(a1 + 72) currentMa chineIDs:*(void *)(a1 + 80) forEpoch:*(void *)(a1 + 96)];
      }

      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138543362;
          id v29 = v5;
          _os_log_impl( &dword_188398000,  v22,  OS_LOG_TYPE_DEFAULT,  "voucher: voucher has failed signature checking: %{public}@",  buf,  0xCu);
        }
      }
    }
  }

void __42__TPModel_validateVoucherForPeer_sponsor___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v11 = a2;
  [v11 beneficiaryID];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) peerID];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v5 isEqualToString:v6] & 1) == 0) {
    goto LABEL_6;
  }
  [v11 sponsorID];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) peerID];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v7 isEqualToString:v8])
  {

LABEL_6:
    uint64_t v10 = v11;
    goto LABEL_7;
  }

  int v9 = [*(id *)(a1 + 48) verifyVoucherSignature:v11];

  uint64_t v10 = v11;
  if (v9)
  {
    *a3 = 1;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
  }

void __29__TPModel_maxClockWithError___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  [v13 stableInfo];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    unint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    [v13 stableInfo];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v6 = [v5 clock];

    if (v4 <= v6) {
      unint64_t v7 = v6;
    }
    else {
      unint64_t v7 = v4;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v7;
  }

  [v13 dynamicInfo];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    unint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    [v13 dynamicInfo];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v11 = [v10 clock];

    if (v9 <= v11) {
      unint64_t v12 = v11;
    }
    else {
      unint64_t v12 = v9;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v12;
  }
}

void __36__TPModel_statusOfPeerWithID_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [v3 peerID];
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 dynamicInfo];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 includedPeerIDs];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 containsObject:*(void *)(a1 + 32)];

  [v3 dynamicInfo];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 excludedPeerIDs];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = [v9 containsObject:*(void *)(a1 + 32)];

  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    if (v7)
    {
      TPModelLog();
      unint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 v37 = 138543362;
        *(void *)&v37[4] = v4;
        _os_log_impl(&dword_188398000, v11, OS_LOG_TYPE_DEFAULT, "status: peerID %{public}@ trusts itself", v37, 0xCu);
      }

      *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) |= 0x40uLL;
    }

    if (v10)
    {
      TPModelLog();
      unint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)__int128 v37 = 138543362;
        *(void *)&v37[4] = v13;
        _os_log_impl(&dword_188398000, v12, OS_LOG_TYPE_DEFAULT, "status: peer %{public}@ excludes itself", v37, 0xCu);
      }

      *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) |= 4uLL;
      uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8LL);
      unint64_t v15 = *(void *)(v14 + 24) & 0xFFFFFFFFFFFFFFBFLL;
LABEL_31:
      *(void *)(v14 + 24) = v15;
      goto LABEL_32;
    }

    goto LABEL_32;
  }

  if (((v10 | v7) & 1) == 0) {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) |= 0x80uLL;
  }
  [*(id *)(a1 + 40) dynamicInfo];
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 includedPeerIDs];
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
  int v18 = [v17 containsObject:v4];

  if (!v18) {
    goto LABEL_32;
  }
  if ((v7 & 1) != 0
    || ([*(id *)(a1 + 48) validateVoucherForPeer:*(void *)(a1 + 40) sponsor:v3] & 1) != 0
    || [*(id *)(a1 + 48) validatePeerWithPreApproval:*(void *)(a1 + 40) sponsor:v3])
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) |= 1uLL;
    TPModelLog();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    uint64_t v20 = *(void *)(a1 + 32);
    *(_DWORD *)__int128 v37 = 138543618;
    *(void *)&v37[4] = v4;
    *(_WORD *)&v37[12] = 2114;
    *(void *)&v37[14] = v20;
    __int128 v21 = "status: peer %{public}@ trusts %{public}@";
    goto LABEL_18;
  }

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) &= ~2uLL;
  TPModelLog();
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v36 = *(void *)(a1 + 32);
    *(_DWORD *)__int128 v37 = 138543618;
    *(void *)&v37[4] = v4;
    *(_WORD *)&v37[12] = 2114;
    *(void *)&v37[14] = v36;
    __int128 v21 = "status: peer %{public}@ doesn't trust %{public}@";
LABEL_18:
    _os_log_impl(&dword_188398000, v19, OS_LOG_TYPE_INFO, v21, v37, 0x16u);
  }

void __57__TPModel_hasPotentiallyTrustedPeerWithSigningKey_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 peerID];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v3 permanentInfo];
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 signingPubKey];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 spki];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 isEqualToData:*(void *)(a1 + 32)];

  if (v7) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v8];
  }
}

void __50__TPModel_anyTrustedPeerDistrustsOtherPeer_error___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  [v8 dynamicInfo];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 excludedPeerIDs];
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 containsObject:*(void *)(a1 + 32)];

  if (v5)
  {
    unint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    [v8 peerID];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 addObject:v7];
  }
}

void __58__TPModel_hasPotentiallyTrustedPeerPreapprovingKey_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 peerID];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v3 dynamicInfo];
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 preapprovals];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v5 containsObject:*(void *)(a1 + 32)];

  if (v6) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
  }
}

void __58__TPModel_allTrustedPeersWithCurrentRecoveryKeyWithError___block_invoke(uint64_t a1, void *a2)
{
  id v19 = a2;
  [v19 peerID];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 stableInfo];
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 recoverySigningPublicKey];
  if (!v5) {
    goto LABEL_8;
  }
  int v6 = (void *)v5;
  [v19 stableInfo];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 recoveryEncryptionPublicKey];
  if (!v8)
  {
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }

  unint64_t v9 = (void *)v8;
  [*(id *)(a1 + 32) recoverySigningPublicKey];
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 stableInfo];
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 recoverySigningPublicKey];
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v10 isEqualToData:v12])
  {

    goto LABEL_7;
  }

  [*(id *)(a1 + 32) recoveryEncryptionPublicKey];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 stableInfo];
  int v18 = v3;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 recoveryEncryptionPublicKey];
  uint64_t v16 = a1;
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  int v17 = [v13 isEqualToData:v15];

  id v3 = v18;
  if (v17) {
    [*(id *)(*(void *)(*(void *)(v16 + 40) + 8) + 40) addObject:v18];
  }
LABEL_9:
}

void __39__TPModel_isRecoveryKeyExcluded_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 peerID];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v3 dynamicInfo];
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 excludedPeerIDs];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v5 containsObject:*(void *)(a1 + 32)];

  if (v6) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
  }
}

void __42__TPModel_peerCountsByMachineIDWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 machineID];
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithLong:", objc_msgSend(v4, "longValue") + 1);
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
  }

  else
  {
    [*(id *)(a1 + 32) setObject:&unk_18A2345C0 forKeyedSubscript:v7];
  }
}

void __46__TPModel_viablePeerCountsByModelIDWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 peerID];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v3 permanentInfo];
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 modelID];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v5 forKeyedSubscript:v6];
}

void __34__TPModel_allMachineIDsWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  [a2 permanentInfo];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 machineID];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void __38__TPModel_allPolicyVersionsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  [v13 stableInfo];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 frozenPolicyVersion];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    [v13 stableInfo];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 frozenPolicyVersion];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 addObject:v7];
  }

  [v13 stableInfo];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 flexiblePolicyVersion];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    int v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    [v13 stableInfo];
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 flexiblePolicyVersion];
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 addObject:v12];
  }
}

void __57__TPModel_hasPotentiallyTrustedPeerTestingOnlyWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 peerID];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v3 dynamicInfo];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 includedPeerIDs];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v5 containsObject:v7];

  if (v6) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v7];
  }
}

void __44__TPModel__iterateOverPeersWithBlock_error___block_invoke(void *a1, void *a2)
{
  id v8 = a2;
  [v8 peerID];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1[5] + 8) + 40) addObject:v3];
  id v4 = *(void **)(*(void *)(a1[6] + 8LL) + 40LL);
  [v8 dynamicInfo];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 excludedPeerIDs];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    [v4 unionSet:v6];
  }

  else
  {
    [MEMORY[0x189604010] set];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 unionSet:v7];
  }

  (*(void (**)(void))(a1[4] + 16LL))();
}

void __45__TPModel_enumerateVouchersUsingBlock_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (void *)MEMORY[0x1895C3FC8]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  objc_autoreleasePoolPop(v3);
}

void __42__TPModel_enumeratePeersUsingBlock_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (void *)MEMORY[0x1895C3FC8]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  objc_autoreleasePoolPop(v3);
}

+ (id)preapprovalsFromKeys:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  objc_msgSend(MEMORY[0x189603FE0], "setWithCapacity:", objc_msgSend(v3, "count"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        +[TPHashBuilder hashWithAlgo:ofData:]( &OBJC_CLASS___TPHashBuilder,  "hashWithAlgo:ofData:",  1LL,  *(void *)(*((void *)&v12 + 1) + 8 * v9),  (void)v12);
        int v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 addObject:v10];

        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return v4;
}

+ (id)pickClock:(id)a3
{
  id v3 = a3;
  [v3 sortUsingComparator:&__block_literal_global_96];
  [v3 firstObject];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)[v4 copy];

  if ((unint64_t)[v3 count] >= 2)
  {
    uint64_t v6 = 1LL;
    while (1)
    {
      [v3 objectAtIndexedSubscript:v6];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v8 = [v7 clock];
      if (v8 < [v5 clock]) {
        break;
      }
      uint64_t v9 = [v7 clock];
      if (v9 == [v5 clock])
      {
        int v10 = [v7 value];
        if (v10 != [v5 value])
        {
          [v5 setValue:1];
          break;
        }
      }
    }
  }

uint64_t __21__TPModel_pickClock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 clock];
  if (v6 <= [v5 clock])
  {
    uint64_t v8 = [v4 clock];
    uint64_t v7 = v8 != [v5 clock];
  }

  else
  {
    uint64_t v7 = -1LL;
  }

  return v7;
}

@end