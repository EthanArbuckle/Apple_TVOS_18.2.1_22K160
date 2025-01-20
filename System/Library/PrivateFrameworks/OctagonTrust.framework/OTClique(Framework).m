@interface OTClique(Framework)
+ (BOOL)areRecoveryKeysDistrusted:()Framework error:;
+ (BOOL)invalidateEscrowCache:()Framework error:;
+ (BOOL)isRecoveryKeySetInOctagon:()Framework error:;
+ (BOOL)preflightRecoverOctagonUsingRecoveryKey:()Framework recoveryKey:error:;
+ (BOOL)recoverWithRecoveryKey:()Framework recoveryKey:error:;
+ (BOOL)setRecoveryKeyWithContext:()Framework recoveryKey:error:;
+ (id)_fetchAccountWideSettingsDefaultWithForceFetch:()Framework useDefault:configuration:error:;
+ (id)createAndSetRecoveryKeyWithContext:()Framework error:;
+ (id)fetchAllEscrowRecords:()Framework error:;
+ (id)fetchEscrowRecords:()Framework error:;
+ (id)filterRecords:()Framework;
+ (id)filterViableSOSRecords:()Framework;
+ (id)handleRecoveryResults:()Framework recoveredInformation:record:performedSilentBurn:recoverError:error:;
+ (id)performEscrowRecovery:()Framework cdpContext:escrowRecord:error:;
+ (id)performSilentEscrowRecovery:()Framework cdpContext:allRecords:error:;
+ (id)recordMatchingLabel:()Framework allRecords:;
+ (id)sortListPrioritizingiOSRecords:()Framework;
+ (id)totalTrustedPeers:()Framework error:;
+ (os_log_s)fetchAndHandleEscrowRecords:()Framework shouldFilter:error:;
+ (uint64_t)doesRecoveryKeyExistInOctagonAndIsCorrect:()Framework recoveryKey:error:;
+ (uint64_t)doesRecoveryKeyExistInSOSAndIsCorrect:()Framework recoveryKey:error:;
+ (uint64_t)ensureBackupKeyExistsinSOS:()Framework;
+ (uint64_t)fetchAccountWideSettings:()Framework error:;
+ (uint64_t)fetchAccountWideSettingsDefaultWithForceFetch:()Framework configuration:error:;
+ (uint64_t)fetchAccountWideSettingsWithForceFetch:()Framework configuration:error:;
+ (uint64_t)isRecoveryKeySet:()Framework error:;
+ (uint64_t)isRecoveryKeySetInSOS:()Framework error:;
+ (uint64_t)registerRecoveryKeyInSOSAndBackup:()Framework recoveryKey:error:;
+ (uint64_t)registerRecoveryKeyWithContext:()Framework recoveryKey:error:;
- (BOOL)removeLocalSecureElementIdentityPeerID:()Framework error:;
- (BOOL)removeRecoveryKey:()Framework error:;
- (BOOL)removeRecoveryKeyFromSOSWhenInCircle:()Framework error:;
- (BOOL)setAccountSetting:()Framework error:;
- (BOOL)setLocalSecureElementIdentity:()Framework error:;
- (BOOL)waitForPriorityViewKeychainDataRecovery:()Framework;
- (id)fetchAccountSettings:()Framework;
- (id)fetchTrustedSecureElementIdentities:()Framework;
- (id)tlkRecoverabilityForEscrowRecord:()Framework error:;
- (uint64_t)deliverAKDeviceListDelta:()Framework error:;
- (unint64_t)removeRecoveryKeyFromSOSWhenNOTInCircle:()Framework error:;
@end

@implementation OTClique(Framework)

- (BOOL)setLocalSecureElementIdentity:()Framework error:
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  secLogObjForScope();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    [a1 ctx];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl( &dword_18744F000,  v7,  OS_LOG_TYPE_DEFAULT,  "setLocalSecureElementIdentity invoked for context:%@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000LL;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  id v29 = 0LL;
  [a1 ctx];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id *)(*((void *)&buf + 1) + 40LL);
  id obj = *(id *)(*((void *)&buf + 1) + 40LL);
  [v9 makeOTControl:&obj];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v10, obj);

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x18960AFA0]);
    [a1 ctx];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)[v12 initWithConfiguration:v13];
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __59__OTClique_Framework__setLocalSecureElementIdentity_error___block_invoke;
    v21[3] = &unk_18A04F230;
    v21[4] = &buf;
    [v11 setLocalSecureElementIdentity:v14 secureElementIdentity:v6 reply:v21];

    uint64_t v15 = *((void *)&buf + 1);
    if (a4)
    {
      v16 = *(void **)(*((void *)&buf + 1) + 40LL);
      if (v16)
      {
        *a4 = v16;
        uint64_t v15 = *((void *)&buf + 1);
      }
    }

    BOOL v17 = *(void *)(v15 + 40) == 0LL;
  }

  else
  {
    secLogObjForScope();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(*((void *)&buf + 1) + 40LL);
      *(_DWORD *)v23 = 138412290;
      uint64_t v24 = v19;
      _os_log_impl(&dword_18744F000, v18, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v23, 0xCu);
    }

    BOOL v17 = 0LL;
    if (a4) {
      *a4 = *(id *)(*((void *)&buf + 1) + 40LL);
    }
  }

  _Block_object_dispose(&buf, 8);
  return v17;
}

- (BOOL)removeLocalSecureElementIdentityPeerID:()Framework error:
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  secLogObjForScope();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    [a1 ctx];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl( &dword_18744F000,  v7,  OS_LOG_TYPE_DEFAULT,  "removeLocalSecureElementIdentityPeerID invoked for context:%@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000LL;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  id v29 = 0LL;
  [a1 ctx];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id *)(*((void *)&buf + 1) + 40LL);
  id obj = *(id *)(*((void *)&buf + 1) + 40LL);
  [v9 makeOTControl:&obj];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v10, obj);

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x18960AFA0]);
    [a1 ctx];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)[v12 initWithConfiguration:v13];
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __68__OTClique_Framework__removeLocalSecureElementIdentityPeerID_error___block_invoke;
    v21[3] = &unk_18A04F230;
    v21[4] = &buf;
    [v11 removeLocalSecureElementIdentityPeerID:v14 secureElementIdentityPeerID:v6 reply:v21];

    uint64_t v15 = *((void *)&buf + 1);
    if (a4)
    {
      v16 = *(void **)(*((void *)&buf + 1) + 40LL);
      if (v16)
      {
        *a4 = v16;
        uint64_t v15 = *((void *)&buf + 1);
      }
    }

    BOOL v17 = *(void *)(v15 + 40) == 0LL;
  }

  else
  {
    secLogObjForScope();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(*((void *)&buf + 1) + 40LL);
      *(_DWORD *)v23 = 138412290;
      uint64_t v24 = v19;
      _os_log_impl(&dword_18744F000, v18, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v23, 0xCu);
    }

    BOOL v17 = 0LL;
    if (a4) {
      *a4 = *(id *)(*((void *)&buf + 1) + 40LL);
    }
  }

  _Block_object_dispose(&buf, 8);
  return v17;
}

- (id)fetchTrustedSecureElementIdentities:()Framework
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  secLogObjForScope();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    [a1 ctx];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( &dword_18744F000,  v5,  OS_LOG_TYPE_DEFAULT,  "fetchTrustedSecureElementIdentities invoked for context:%@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000LL;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  id v29 = 0LL;
  [a1 ctx];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id *)(*((void *)&buf + 1) + 40LL);
  id obj = *(id *)(*((void *)&buf + 1) + 40LL);
  [v7 makeOTControl:&obj];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v8, obj);

  if (v9)
  {
    *(void *)&__int128 v20 = 0LL;
    *((void *)&v20 + 1) = &v20;
    uint64_t v21 = 0x3032000000LL;
    v22 = __Block_byref_object_copy_;
    v23 = __Block_byref_object_dispose_;
    id v24 = 0LL;
    id v10 = objc_alloc(MEMORY[0x18960AFA0]);
    [a1 ctx];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = (void *)[v10 initWithConfiguration:v11];
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __59__OTClique_Framework__fetchTrustedSecureElementIdentities___block_invoke;
    v18[3] = &unk_18A04F258;
    v18[4] = &v20;
    v18[5] = &buf;
    [v9 fetchTrustedSecureElementIdentities:v12 reply:v18];

    if (a3)
    {
      v13 = *(void **)(*((void *)&buf + 1) + 40LL);
      if (v13) {
        *a3 = v13;
      }
    }

    id v14 = *(id *)(*((void *)&v20 + 1) + 40LL);
    _Block_object_dispose(&v20, 8);
  }

  else
  {
    secLogObjForScope();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(*((void *)&buf + 1) + 40LL);
      LODWORD(v20) = 138412290;
      *(void *)((char *)&v20 + 4) = v16;
      _os_log_impl(&dword_18744F000, v15, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", (uint8_t *)&v20, 0xCu);
    }

    id v14 = 0LL;
    if (a3) {
      *a3 = *(id *)(*((void *)&buf + 1) + 40LL);
    }
  }

  _Block_object_dispose(&buf, 8);
  return v14;
}

- (BOOL)setAccountSetting:()Framework error:
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  secLogObjForScope();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    [a1 ctx];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl( &dword_18744F000,  v7,  OS_LOG_TYPE_DEFAULT,  "setAccountSetting invoked for context:%@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000LL;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  id v29 = 0LL;
  [a1 ctx];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = (id *)(*((void *)&buf + 1) + 40LL);
  id obj = *(id *)(*((void *)&buf + 1) + 40LL);
  [v9 makeOTControl:&obj];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v10, obj);

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x18960AFA0]);
    [a1 ctx];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = (void *)[v12 initWithConfiguration:v13];
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __47__OTClique_Framework__setAccountSetting_error___block_invoke;
    v21[3] = &unk_18A04F230;
    v21[4] = &buf;
    [v11 setAccountSetting:v14 setting:v6 reply:v21];

    uint64_t v15 = *((void *)&buf + 1);
    if (a4)
    {
      uint64_t v16 = *(void **)(*((void *)&buf + 1) + 40LL);
      if (v16)
      {
        *a4 = v16;
        uint64_t v15 = *((void *)&buf + 1);
      }
    }

    BOOL v17 = *(void *)(v15 + 40) == 0LL;
  }

  else
  {
    secLogObjForScope();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(*((void *)&buf + 1) + 40LL);
      *(_DWORD *)v23 = 138412290;
      uint64_t v24 = v19;
      _os_log_impl(&dword_18744F000, v18, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v23, 0xCu);
    }

    BOOL v17 = 0LL;
    if (a4) {
      *a4 = *(id *)(*((void *)&buf + 1) + 40LL);
    }
  }

  _Block_object_dispose(&buf, 8);
  return v17;
}

- (id)fetchAccountSettings:()Framework
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  secLogObjForScope();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    [a1 ctx];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( &dword_18744F000,  v5,  OS_LOG_TYPE_DEFAULT,  "fetchAccountSettings invoked for context:%@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000LL;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  id v29 = 0LL;
  [a1 ctx];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id *)(*((void *)&buf + 1) + 40LL);
  id obj = *(id *)(*((void *)&buf + 1) + 40LL);
  [v7 makeOTControl:&obj];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v8, obj);

  if (v9)
  {
    *(void *)&__int128 v20 = 0LL;
    *((void *)&v20 + 1) = &v20;
    uint64_t v21 = 0x3032000000LL;
    v22 = __Block_byref_object_copy_;
    v23 = __Block_byref_object_dispose_;
    id v24 = 0LL;
    id v10 = objc_alloc(MEMORY[0x18960AFA0]);
    [a1 ctx];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = (void *)[v10 initWithConfiguration:v11];
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __44__OTClique_Framework__fetchAccountSettings___block_invoke;
    v18[3] = &unk_18A04F280;
    v18[4] = &v20;
    v18[5] = &buf;
    [v9 fetchAccountSettings:v12 reply:v18];

    if (a3)
    {
      v13 = *(void **)(*((void *)&buf + 1) + 40LL);
      if (v13) {
        *a3 = v13;
      }
    }

    id v14 = *(id *)(*((void *)&v20 + 1) + 40LL);
    _Block_object_dispose(&v20, 8);
  }

  else
  {
    secLogObjForScope();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(*((void *)&buf + 1) + 40LL);
      LODWORD(v20) = 138412290;
      *(void *)((char *)&v20 + 4) = v16;
      _os_log_impl(&dword_18744F000, v15, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", (uint8_t *)&v20, 0xCu);
    }

    id v14 = 0LL;
    if (a3) {
      *a3 = *(id *)(*((void *)&buf + 1) + 40LL);
    }
  }

  _Block_object_dispose(&buf, 8);
  return v14;
}

- (BOOL)waitForPriorityViewKeychainDataRecovery:()Framework
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  secLogObjForScope();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    [a1 ctx];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( &dword_18744F000,  v5,  OS_LOG_TYPE_DEFAULT,  "waitForPriorityViewKeychainDataRecovery invoked for context:%@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000LL;
  v25 = __Block_byref_object_copy_;
  uint64_t v26 = __Block_byref_object_dispose_;
  id v27 = 0LL;
  [a1 ctx];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id *)(*((void *)&buf + 1) + 40LL);
  id obj = *(id *)(*((void *)&buf + 1) + 40LL);
  [v7 makeOTControl:&obj];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v8, obj);

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x18960AFA0]);
    [a1 ctx];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = (void *)[v10 initWithConfiguration:v11];
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __63__OTClique_Framework__waitForPriorityViewKeychainDataRecovery___block_invoke;
    v19[3] = &unk_18A04F230;
    v19[4] = &buf;
    [v9 waitForPriorityViewKeychainDataRecovery:v12 reply:v19];

    uint64_t v13 = *((void *)&buf + 1);
    if (a3)
    {
      id v14 = *(void **)(*((void *)&buf + 1) + 40LL);
      if (v14)
      {
        *a3 = v14;
        uint64_t v13 = *((void *)&buf + 1);
      }
    }

    BOOL v15 = *(void *)(v13 + 40) == 0LL;
  }

  else
  {
    secLogObjForScope();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(*((void *)&buf + 1) + 40LL);
      *(_DWORD *)uint64_t v21 = 138412290;
      uint64_t v22 = v17;
      _os_log_impl(&dword_18744F000, v16, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v21, 0xCu);
    }

    BOOL v15 = 0LL;
    if (a3) {
      *a3 = *(id *)(*((void *)&buf + 1) + 40LL);
    }
  }

  _Block_object_dispose(&buf, 8);
  return v15;
}

- (id)tlkRecoverabilityForEscrowRecord:()Framework error:
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  secLogObjForScope();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    [a1 ctx];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl( &dword_18744F000,  v7,  OS_LOG_TYPE_DEFAULT,  "tlkRecoverabiltyForEscrowRecord invoked for context:%@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x3032000000LL;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  id v40 = 0LL;
  [a1 ctx];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = (id *)(*((void *)&buf + 1) + 40LL);
  id obj = *(id *)(*((void *)&buf + 1) + 40LL);
  [v9 makeOTControl:&obj];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v10, obj);

  if (v11)
  {
    *(void *)&__int128 v31 = 0LL;
    *((void *)&v31 + 1) = &v31;
    uint64_t v32 = 0x3032000000LL;
    v33 = __Block_byref_object_copy_;
    v34 = __Block_byref_object_dispose_;
    id v35 = 0LL;
    id v12 = objc_alloc(MEMORY[0x18960AFA0]);
    [a1 ctx];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = (void *)[v12 initWithConfiguration:v13];
    [v6 data];
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 ctx];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v16 escrowFetchSource];
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __62__OTClique_Framework__tlkRecoverabilityForEscrowRecord_error___block_invoke;
    v25[3] = &unk_18A04F2D0;
    v25[4] = &v31;
    v25[5] = &buf;
    [v11 tlkRecoverabilityForEscrowRecordData:v14 recordData:v15 source:v17 reply:v25];

    if (a4)
    {
      v18 = *(void **)(*((void *)&buf + 1) + 40LL);
      if (v18) {
        *a4 = v18;
      }
    }

    secLogObjForScope();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 40LL);
      *(_DWORD *)id v27 = 138412546;
      uint64_t v28 = v20;
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_impl(&dword_18744F000, v19, OS_LOG_TYPE_DEFAULT, "views %@ supported for record %@", v27, 0x16u);
    }

    id v21 = *(id *)(*((void *)&v31 + 1) + 40LL);
    _Block_object_dispose(&v31, 8);
  }

  else
  {
    secLogObjForScope();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(void *)(*((void *)&buf + 1) + 40LL);
      LODWORD(v31) = 138412290;
      *(void *)((char *)&v31 + 4) = v23;
      _os_log_impl(&dword_18744F000, v22, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", (uint8_t *)&v31, 0xCu);
    }

    id v21 = 0LL;
    if (a4) {
      *a4 = *(id *)(*((void *)&buf + 1) + 40LL);
    }
  }

  _Block_object_dispose(&buf, 8);
  return v21;
}

- (uint64_t)deliverAKDeviceListDelta:()Framework error:
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  secLogObjForScope();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    [a1 ctx];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl( &dword_18744F000,  v6,  OS_LOG_TYPE_DEFAULT,  "Unimplemented deliverAKDeviceListDelta for context:%@",  (uint8_t *)&v9,  0xCu);
  }

  if (a4)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:-4 userInfo:0];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (BOOL)removeRecoveryKeyFromSOSWhenInCircle:()Framework error:
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  secLogObjForScope();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl(&dword_18744F000, v6, OS_LOG_TYPE_DEFAULT, "Removing recovery key when device is in circle", buf, 2u);
  }

  id v27 = 0LL;
  int v7 = [MEMORY[0x18960AF90] isRecoveryKeySetInSOS:v5 error:&v27];
  id v8 = v27;
  int v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0LL;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    id v26 = 0LL;
    int v13 = [MEMORY[0x18960AF90] ensureBackupKeyExistsinSOS:&v26];
    id v14 = v26;
    BOOL v15 = v14;
    if (!v13 || v14)
    {
      if (a4)
      {
        id v19 = v14;
LABEL_23:
        BOOL v12 = 0LL;
        *a4 = v19;
LABEL_35:

        goto LABEL_36;
      }
    }

    else
    {
      if ((SOSCCRegisterRecoveryPublicKey() & 1) != 0)
      {
        [v5 sbd];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = v16;
        if (v16) {
          id v18 = v16;
        }
        else {
          id v18 = objc_alloc_init((Class)getSecureBackupClass());
        }
        id v21 = v18;

        [v21 backupForRecoveryKeyWithInfo:0];
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v12 = v22 == 0LL;
        if (v22)
        {
          secLogObjForScope();
          uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            __int16 v29 = v22;
            _os_log_impl( &dword_18744F000,  v23,  OS_LOG_TYPE_DEFAULT,  "octagon-remove-recovery-key: failed to perform backup: %@",  buf,  0xCu);
          }

          if (a4) {
            *a4 = v22;
          }
        }

        else
        {
          secLogObjForScope();
          uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl(&dword_18744F000, v24, OS_LOG_TYPE_DEFAULT, "Removed recovery key from SOS", buf, 2u);
          }
        }

        goto LABEL_35;
      }

      secLogObjForScope();
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        __int16 v29 = 0LL;
        _os_log_impl( &dword_18744F000,  v20,  OS_LOG_TYPE_DEFAULT,  "octagon-remove-recovery-key: failed to remove recovery key from SOS: %@",  buf,  0xCu);
      }

      if (a4)
      {
        id v19 = 0LL;
        goto LABEL_23;
      }
    }

    BOOL v12 = 0LL;
    goto LABEL_35;
  }

  secLogObjForScope();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    __int16 v29 = v9;
    _os_log_impl( &dword_18744F000,  v11,  OS_LOG_TYPE_DEFAULT,  "octagon-register-recovery-key, recovery key not registered in SOS: %@",  buf,  0xCu);
  }

  BOOL v12 = 0LL;
  if (a4) {
    *a4 = v9;
  }
LABEL_36:

  return v12;
}

- (unint64_t)removeRecoveryKeyFromSOSWhenNOTInCircle:()Framework error:
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  secLogObjForScope();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl(&dword_18744F000, v6, OS_LOG_TYPE_DEFAULT, "Removing recovery key when not in circle", buf, 2u);
  }

  id v18 = 0LL;
  if (SOSCCPushResetCircle())
  {
    secLogObjForScope();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_18744F000, v7, OS_LOG_TYPE_DEFAULT, "successfully pushed a reset circle", buf, 2u);
    }

    [v5 sbd];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v9 = (unint64_t)v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = objc_alloc_init((Class)getSecureBackupClass());
    }
    BOOL v12 = v10;

    id v17 = 0LL;
    LODWORD(v9) = [v12 removeRecoveryKeyFromBackup:&v17];
    id v13 = v17;
    if (v13) {
      unint64_t v9 = 0LL;
    }
    else {
      unint64_t v9 = v9;
    }
    if ((v9 & 1) != 0)
    {
      secLogObjForScope();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl(&dword_18744F000, v14, OS_LOG_TYPE_DEFAULT, "removed recovery key from the backup", buf, 2u);
      }
    }

    else
    {
      secLogObjForScope();
      BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v20 = v13;
        _os_log_impl( &dword_18744F000,  v15,  OS_LOG_TYPE_DEFAULT,  "octagon-remove-recovery-key: failed to remove recovery key from the backup: %@",  buf,  0xCu);
      }

      if (a4) {
        *a4 = v13;
      }
    }
  }

  else
  {
    secLogObjForScope();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v20 = v18;
      _os_log_impl( &dword_18744F000,  v11,  OS_LOG_TYPE_DEFAULT,  "octagon-remove-recovery-key: failed to push: %@",  buf,  0xCu);
    }

    unint64_t v9 = 0LL;
    if (a4) {
      *a4 = v18;
    }
  }

  return v9;
}

- (BOOL)removeRecoveryKey:()Framework error:
{
  v35[2] = *(id *)MEMORY[0x1895F89C0];
  id v6 = a3;
  secLogObjForScope();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( &dword_18744F000,  v7,  OS_LOG_TYPE_DEFAULT,  "Removing recovery key for context:%@",  (uint8_t *)&buf,  0xCu);
  }

  v28[1] = 0LL;
  int v8 = SOSCCThisDeviceIsInCircle();
  int v9 = SOSCCIsSOSTrustAndSyncingEnabled();
  if (v8) {
    int v10 = 0;
  }
  else {
    int v10 = v9;
  }
  if (v10 == 1)
  {
    v28[0] = 0LL;
    [a1 removeRecoveryKeyFromSOSWhenInCircle:v6 error:v28];
    uint64_t v11 = (id *)v28;
  }

  else
  {
    uint64_t v27 = 0LL;
    [a1 removeRecoveryKeyFromSOSWhenNOTInCircle:v6 error:&v27];
    uint64_t v11 = (id *)&v27;
  }

  id v12 = *v11;
  if (v12)
  {
    secLogObjForScope();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v12;
    id v14 = "octagon-remove-recovery-key, error removing recovery key from SOS: %@";
    BOOL v15 = v13;
    uint32_t v16 = 12;
  }

  else
  {
    secLogObjForScope();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    LOWORD(buf) = 0;
    id v14 = "Removed recovery key from SOS";
    BOOL v15 = v13;
    uint32_t v16 = 2;
  }

  _os_log_impl(&dword_18744F000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&buf, v16);
LABEL_15:

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v32 = 0x3032000000LL;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35[0] = 0LL;
  id obj = 0LL;
  [v6 makeOTControl:&obj];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v35, obj);
  if (v17)
  {
    id v18 = (void *)[objc_alloc(MEMORY[0x18960AFA0]) initWithConfiguration:v6];
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __47__OTClique_Framework__removeRecoveryKey_error___block_invoke;
    v25[3] = &unk_18A04F230;
    v25[4] = &buf;
    [v17 removeRecoveryKey:v18 reply:v25];

    uint64_t v19 = *((void *)&buf + 1);
    if (a4)
    {
      id v20 = *(void **)(*((void *)&buf + 1) + 40LL);
      if (v20)
      {
        *a4 = v20;
        uint64_t v19 = *((void *)&buf + 1);
      }
    }

    BOOL v21 = *(void *)(v19 + 40) == 0LL;
  }

  else
  {
    secLogObjForScope();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(void *)(*((void *)&buf + 1) + 40LL);
      *(_DWORD *)__int16 v29 = 138412290;
      uint64_t v30 = v23;
      _os_log_impl(&dword_18744F000, v22, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v29, 0xCu);
    }

    BOOL v21 = 0LL;
    if (a4) {
      *a4 = *(id *)(*((void *)&buf + 1) + 40LL);
    }
  }

  _Block_object_dispose(&buf, 8);
  return v21;
}

+ (id)filterViableSOSRecords:()Framework
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  [MEMORY[0x189603FA8] array];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return v4;
}

+ (id)sortListPrioritizingiOSRecords:()Framework
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  [MEMORY[0x189603FA8] array];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FA8] array];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        [v9 escrowInformationMetadata];
        int v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 clientMetadata];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v11 hasSecureBackupUsesNumericPassphrase])
        {
          [v9 escrowInformationMetadata];
          __int128 v12 = v4;
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 clientMetadata];
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v15 = [v14 secureBackupUsesNumericPassphrase];

          v4 = v12;
          uint32_t v16 = v12;
          if (v15) {
            goto LABEL_11;
          }
        }

        else
        {
        }

        uint32_t v16 = v19;
LABEL_11:
        [v16 addObject:v9];
      }

      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v6);
  }

  [v4 addObjectsFromArray:v19];
  return v4;
}

+ (id)filterRecords:()Framework
{
  v74 = a1;
  uint64_t v112 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  [MEMORY[0x189603FA8] array];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FA8] array];
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FA8] array];
  id v82 = (id)objc_claimAutoreleasedReturnValue();
  __int128 v96 = 0u;
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v96 objects:v111 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v97;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v97 != v7) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v96 + 1) + 8 * v8);
        if (!objc_msgSend(v9, "recordViability", v74))
        {
          [v9 escrowInformationMetadata];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v18 = [v17 bottleId];
          if (v18)
          {
            uint64_t v19 = (void *)v18;
            [v9 escrowInformationMetadata];
            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
            [v20 bottleId];
            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v22 = [v21 length];

            uint32_t v16 = v4;
            if (v22) {
              goto LABEL_16;
            }
          }

          else
          {
          }
        }

        if ([v9 recordViability] == 1)
        {
          [v9 escrowInformationMetadata];
          int v10 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v11 = [v10 bottleId];
          if (v11)
          {
            __int128 v12 = (void *)v11;
            [v9 escrowInformationMetadata];
            __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
            [v13 bottleId];
            __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v15 = [v14 length];

            uint32_t v16 = v75;
            if (v15) {
              goto LABEL_16;
            }
          }

          else
          {
          }
        }

        uint32_t v16 = v82;
LABEL_16:
        [v16 addObject:v9];
        ++v8;
      }

      while (v6 != v8);
      uint64_t v23 = [obj countByEnumeratingWithState:&v96 objects:v111 count:16];
      uint64_t v6 = v23;
    }

    while (v23);
  }

  __int128 v94 = 0u;
  __int128 v95 = 0u;
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  id v24 = v4;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v92 objects:v110 count:16];
  v78 = v24;
  if (v25)
  {
    uint64_t v26 = v25;
    id v27 = *(id *)v93;
    id v80 = *(id *)v93;
    do
    {
      for (uint64_t i = 0LL; i != v26; ++i)
      {
        if (*(id *)v93 != v27) {
          objc_enumerationMutation(v24);
        }
        __int16 v29 = *(void **)(*((void *)&v92 + 1) + 8 * i);
        secLogObjForScope();
        uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          [v29 label];
          __int128 v31 = (void *)objc_claimAutoreleasedReturnValue();
          [v29 escrowInformationMetadata];
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
          [v32 serial];
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          [v29 escrowInformationMetadata];
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          [v34 bottleId];
          id v35 = (void *)objc_claimAutoreleasedReturnValue();
          int v36 = [v29 silentAttemptAllowed];
          *(_DWORD *)__int128 buf = 138413058;
          v103 = v31;
          __int16 v104 = 2112;
          v105 = v33;
          __int16 v106 = 2112;
          v107 = v35;
          __int16 v108 = 1024;
          int v109 = v36;
          _os_log_impl( &dword_18744F000,  v30,  OS_LOG_TYPE_DEFAULT,  "viable record: %@ serial:%@ bottleID:%@ silent allowed:%{BOOL}d",  buf,  0x26u);

          id v24 = v78;
          id v27 = v80;
        }
      }

      uint64_t v26 = [v24 countByEnumeratingWithState:&v92 objects:v110 count:16];
    }

    while (v26);
  }

  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  id v81 = v75;
  uint64_t v37 = [v81 countByEnumeratingWithState:&v88 objects:v101 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v89;
    uint64_t v76 = *(void *)v89;
    do
    {
      for (uint64_t j = 0LL; j != v38; ++j)
      {
        if (*(void *)v89 != v39) {
          objc_enumerationMutation(v81);
        }
        uint64_t v41 = *(void **)(*((void *)&v88 + 1) + 8 * j);
        secLogObjForScope();
        v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          [v41 label];
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          [v41 escrowInformationMetadata];
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          [v44 serial];
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          [v41 escrowInformationMetadata];
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          [v46 bottleId];
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          int v48 = [v41 silentAttemptAllowed];
          *(_DWORD *)__int128 buf = 138413058;
          v103 = v43;
          __int16 v104 = 2112;
          v105 = v45;
          __int16 v106 = 2112;
          v107 = v47;
          __int16 v108 = 1024;
          int v109 = v48;
          _os_log_impl( &dword_18744F000,  v42,  OS_LOG_TYPE_DEFAULT,  "partially viable record: %@ serial:%@ bottleID:%@ silent allowed:%{BOOL}d",  buf,  0x26u);

          uint64_t v39 = v76;
        }
      }

      uint64_t v38 = [v81 countByEnumeratingWithState:&v88 objects:v101 count:16];
    }

    while (v38);
  }

  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  id v83 = v82;
  uint64_t v49 = [v83 countByEnumeratingWithState:&v84 objects:v100 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v85;
    uint64_t v77 = *(void *)v85;
    do
    {
      for (uint64_t k = 0LL; k != v50; ++k)
      {
        if (*(void *)v85 != v51) {
          objc_enumerationMutation(v83);
        }
        v53 = *(void **)(*((void *)&v84 + 1) + 8 * k);
        secLogObjForScope();
        v54 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          [v53 label];
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          [v53 escrowInformationMetadata];
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          [v56 serial];
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          [v53 escrowInformationMetadata];
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          [v58 bottleId];
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          int v60 = [v53 silentAttemptAllowed];
          *(_DWORD *)__int128 buf = 138413058;
          v103 = v55;
          __int16 v104 = 2112;
          v105 = v57;
          __int16 v106 = 2112;
          v107 = v59;
          __int16 v108 = 1024;
          int v109 = v60;
          _os_log_impl( &dword_18744F000,  v54,  OS_LOG_TYPE_DEFAULT,  "nonviable record: %@ serial:%@ bottleID:%@ silent allowed:%{BOOL}d",  buf,  0x26u);

          uint64_t v51 = v77;
        }
      }

      uint64_t v50 = [v83 countByEnumeratingWithState:&v84 objects:v100 count:16];
    }

    while (v50);
  }

  if ([v78 count])
  {
    secLogObjForScope();
    v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      int v62 = [v78 count];
      *(_DWORD *)__int128 buf = 67109120;
      LODWORD(v103) = v62;
      _os_log_impl(&dword_18744F000, v61, OS_LOG_TYPE_DEFAULT, "Returning %d viable records", buf, 8u);
    }

    v63 = v74;
    id v64 = v78;
LABEL_55:
    uint64_t v67 = objc_msgSend(v63, "sortListPrioritizingiOSRecords:", v64, v74);
LABEL_56:
    v68 = (void *)v67;
    goto LABEL_57;
  }

  if ([v81 count])
  {
    secLogObjForScope();
    v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      int v66 = [v81 count];
      *(_DWORD *)__int128 buf = 67109120;
      LODWORD(v103) = v66;
      _os_log_impl(&dword_18744F000, v65, OS_LOG_TYPE_DEFAULT, "Returning %d partially viable records", buf, 8u);
    }

    v63 = v74;
    id v64 = v81;
    goto LABEL_55;
  }

  if (!SOSCCIsSOSTrustAndSyncingEnabled())
  {
    secLogObjForScope();
    v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_18744F000, v73, OS_LOG_TYPE_DEFAULT, "no viable records!", buf, 2u);
    }

    uint64_t v67 = [MEMORY[0x189603F18] array];
    goto LABEL_56;
  }

  [v74 filterViableSOSRecords:v83];
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  secLogObjForScope();
  v71 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    int v72 = [v70 count];
    *(_DWORD *)__int128 buf = 67109120;
    LODWORD(v103) = v72;
    _os_log_impl(&dword_18744F000, v71, OS_LOG_TYPE_DEFAULT, "Returning %d sos viable records", buf, 8u);
  }

  [v74 sortListPrioritizingiOSRecords:v70];
  v68 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_57:
  return v68;
}

+ (os_log_s)fetchAndHandleEscrowRecords:()Framework shouldFilter:error:
{
  uint64_t v92 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  _OctagonSignpostLogSystem();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v8 = _OctagonSignpostCreate();

  _OctagonSignpostLogSystem();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int v10 = v9;
  unint64_t v75 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( &dword_18744F000,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v8,  "FetchEscrowRecords",  " enableTelemetry=YES ",  buf,  2u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    *(void *)&uint8_t buf[4] = v8;
    _os_log_impl( &dword_18744F000,  v11,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: FetchEscrowRecords  enableTelemetry=YES ",  buf,  0xCu);
  }

  id v85 = 0LL;
  [MEMORY[0x18960AF90] fetchEscrowRecordsInternal:v6 error:&v85];
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v76 = v85;
  if (v76)
  {
    secLogObjForScope();
    __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)&uint8_t buf[4] = v76;
      _os_log_impl( &dword_18744F000,  v13,  OS_LOG_TYPE_DEFAULT,  "octagontrust-fetchAndHandleEscrowRecords: failed to fetch escrow records: %@",  buf,  0xCu);
    }

    if (a5) {
      *a5 = v76;
    }
    uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint32_t v16 = v15;
    if (v75 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(void *)__int128 buf = 67240192LL;
      _os_signpost_emit_with_name_impl( &dword_18744F000,  v16,  OS_SIGNPOST_INTERVAL_END,  v8,  "FetchEscrowRecords",  " OctagonSignpostNameFetchEscrowRecords=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEscrowRecords}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      *(void *)&uint8_t buf[4] = v8;
      __int16 v88 = 2048;
      double v89 = (double)(unint64_t)Nanoseconds / 1000000000.0;
      __int16 v90 = 1026;
      int v91 = 0;
      _os_log_impl( &dword_18744F000,  v17,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: FetchEscrowRecords  OctagonSignpostNameFetchEscrowRecords=%{public,signpost.telemetry:number1,na me=OctagonSignpostNameFetchEscrowRecords}d ",  buf,  0x1Cu);
    }

    uint64_t v18 = 0LL;
    goto LABEL_70;
  }

  os_signpost_id_t v72 = v8;
  id v73 = v6;
  [MEMORY[0x189603FA8] array];
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  v71 = v12;
  id obj = v12;
  uint64_t v80 = [obj countByEnumeratingWithState:&v81 objects:v86 count:16];
  if (v80)
  {
    uint64_t v79 = *(void *)v82;
    v78 = v17;
    do
    {
      for (uint64_t i = 0LL; i != v80; ++i)
      {
        if (*(void *)v82 != v79) {
          objc_enumerationMutation(obj);
        }
        __int128 v20 = -[PBCodable initWithData:]( objc_alloc(&OBJC_CLASS___OTEscrowRecord),  "initWithData:",  *(void *)(*((void *)&v81 + 1) + 8 * i));
        -[OTEscrowRecord escrowInformationMetadata](v20, "escrowInformationMetadata");
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v22 = [v21 bottleValidity];
        if (v22)
        {
          uint64_t v23 = (void *)v22;
          -[OTEscrowRecord escrowInformationMetadata](v20, "escrowInformationMetadata");
          id v24 = (void *)objc_claimAutoreleasedReturnValue();
          [v24 bottleValidity];
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
          int v26 = [v25 isEqualToString:&stru_18A04F9E0];

          if (!v26) {
            goto LABEL_31;
          }
        }

        else
        {
        }

        unsigned int v27 = -[OTEscrowRecord recordViability](v20, "recordViability");
        if (v27 == 2)
        {
          -[OTEscrowRecord escrowInformationMetadata](v20, "escrowInformationMetadata");
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
          __int16 v29 = v28;
          uint64_t v30 = @"invalid";
          goto LABEL_30;
        }

        if (v27 <= 1)
        {
          -[OTEscrowRecord escrowInformationMetadata](v20, "escrowInformationMetadata");
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
          __int16 v29 = v28;
          uint64_t v30 = @"valid";
LABEL_30:
          [v28 setBottleValidity:v30];
        }

+ (id)fetchAllEscrowRecords:()Framework error:
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  secLogObjForScope();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    [v5 context];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 altDSID];
    os_signpost_id_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v11 = 138412546;
    __int128 v12 = v7;
    __int16 v13 = 2112;
    __int128 v14 = v8;
    _os_log_impl( &dword_18744F000,  v6,  OS_LOG_TYPE_DEFAULT,  "fetching all escrow records for context :%@, altdsid:%@",  (uint8_t *)&v11,  0x16u);
  }

  [MEMORY[0x18960AF90] fetchAndHandleEscrowRecords:v5 shouldFilter:0 error:a4];
  int v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)fetchEscrowRecords:()Framework error:
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  secLogObjForScope();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    [v5 context];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 altDSID];
    os_signpost_id_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v11 = 138412546;
    __int128 v12 = v7;
    __int16 v13 = 2112;
    __int128 v14 = v8;
    _os_log_impl( &dword_18744F000,  v6,  OS_LOG_TYPE_DEFAULT,  "fetching filtered escrow records for context:%@, altdsid:%@",  (uint8_t *)&v11,  0x16u);
  }

  [MEMORY[0x18960AF90] fetchAndHandleEscrowRecords:v5 shouldFilter:1 error:a4];
  int v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)handleRecoveryResults:()Framework recoveredInformation:record:performedSilentBurn:recoverError:error:
{
  uint64_t v90 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  if ([a1 isCloudServicesAvailable])
  {
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x18960AF90]) initWithContextData:v14];
    if (v17)
    {
      secLogObjForScope();
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v17;
        _os_log_impl( &dword_18744F000,  v19,  OS_LOG_TYPE_DEFAULT,  "octagontrust-handleRecoveryResults: sbd escrow recovery failed: %@",  (uint8_t *)&buf,  0xCu);
      }

      __int128 v20 = 0LL;
      if (a8) {
        *a8 = v17;
      }
      goto LABEL_93;
    }

    [v14 otControl];
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      [v14 otControl];
      uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue();
      id v76 = 0LL;
    }

    else
    {
      id v82 = 0LL;
      [v14 makeOTControl:&v82];
      uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue();
      id v76 = v82;
    }

    if (!v77)
    {
      secLogObjForScope();
      uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v76;
        _os_log_impl( &dword_18744F000,  v38,  OS_LOG_TYPE_DEFAULT,  "octagontrust-handleRecoveryResults: unable to create otcontrol: %@",  (uint8_t *)&buf,  0xCu);
      }

      __int128 v20 = 0LL;
      if (a8) {
        *a8 = v76;
      }
      goto LABEL_92;
    }

    [v15 objectForKeyedSubscript:@"bottleID"];
    unint64_t v75 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 objectForKeyedSubscript:@"bottleValid"];
    id v73 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 objectForKeyedSubscript:@"EscrowServiceEscrowData"];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 objectForKeyedSubscript:@"BottledPeerEntropy"];
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (v74) {
      BOOL v23 = v75 == 0LL;
    }
    else {
      BOOL v23 = 1;
    }
    int v24 = !v23;
    int v72 = v24;
    if (v23 || ![v73 isEqualToString:@"valid"])
    {
      secLogObjForScope();
      int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v75;
        _os_log_impl( &dword_18744F000,  v34,  OS_LOG_TYPE_DEFAULT,  "bottle %@ is not valid, resetting octagon",  (uint8_t *)&buf,  0xCu);
      }

      id v79 = 0LL;
      objc_msgSend( v18,  "resetAndEstablish:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:isGuitarfish:error:",  3,  0,  0,  0,  0,  objc_msgSend(v14, "isGuitarfish"),  &v79);
      id v35 = v79;
      if (v35)
      {
        int v36 = v35;
        secLogObjForScope();
        uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v36;
          _os_log_impl( &dword_18744F000,  v37,  OS_LOG_TYPE_DEFAULT,  "octagontrust-handleRecoveryResults: failed to reset octagon: %@",  (uint8_t *)&buf,  0xCu);
        }

        if (a8) {
          *a8 = v36;
        }

        goto LABEL_57;
      }

      secLogObjForScope();
      uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_18744F000, v39, OS_LOG_TYPE_DEFAULT, "reset octagon succeeded", (uint8_t *)&buf, 2u);
      }

      unsigned int v68 = 1;
LABEL_59:
      [v14 sbd];
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      int v48 = v47;
      if (v47) {
        id v71 = v47;
      }
      else {
        id v71 = objc_alloc_init((Class)getSecureBackupClass());
      }

      [MEMORY[0x189603FE0] set];
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
      [v49 addObject:@"iCloudIdentity"];
      [v49 addObject:@"PCS-MasterKey"];
      [v49 addObject:@"KeychainV0"];
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v86 = 0x2020000000LL;
      uint64_t v50 = (void *)getkEscrowServiceRecordDataKeySymbolLoc_ptr;
      __int128 v87 = (uint64_t (*)(uint64_t, uint64_t))getkEscrowServiceRecordDataKeySymbolLoc_ptr;
      if (!getkEscrowServiceRecordDataKeySymbolLoc_ptr)
      {
        uint64_t v51 = (void *)CloudServicesLibrary_642();
        uint64_t v50 = dlsym(v51, "kEscrowServiceRecordDataKey");
        *(void *)(*((void *)&buf + 1) + 24LL) = v50;
        getkEscrowServiceRecordDataKeySymbolLoc_ptr = (uint64_t)v50;
      }

      _Block_object_dispose(&buf, 8);
      if (v50)
      {
        [v15 objectForKeyedSubscript:*v50];
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v52)
        {
          secLogObjForScope();
          int v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl( &dword_18744F000,  v60,  OS_LOG_TYPE_DEFAULT,  "unable to request keychain restore, record data missing",  (uint8_t *)&buf,  2u);
          }

          id v61 = v18;
          goto LABEL_90;
        }

        *(void *)&__int128 buf = 0LL;
        *((void *)&buf + 1) = &buf;
        uint64_t v86 = 0x2020000000LL;
        v53 = (void *)getkSecureBackupKeybagDigestKeySymbolLoc_ptr;
        __int128 v87 = (uint64_t (*)(uint64_t, uint64_t))getkSecureBackupKeybagDigestKeySymbolLoc_ptr;
        if (!getkSecureBackupKeybagDigestKeySymbolLoc_ptr)
        {
          char v54 = (void *)CloudServicesLibrary_642();
          v53 = dlsym(v54, "kSecureBackupKeybagDigestKey");
          *(void *)(*((void *)&buf + 1) + 24LL) = v53;
          getkSecureBackupKeybagDigestKeySymbolLoc_ptr = (uint64_t)v53;
        }

        _Block_object_dispose(&buf, 8);
        if (v53)
        {
          [v52 objectForKeyedSubscript:*v53];
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          *(void *)&__int128 buf = 0LL;
          *((void *)&buf + 1) = &buf;
          uint64_t v86 = 0x2020000000LL;
          v55 = (void *)getkSecureBackupBagPasswordKeySymbolLoc_ptr;
          __int128 v87 = (uint64_t (*)(uint64_t, uint64_t))getkSecureBackupBagPasswordKeySymbolLoc_ptr;
          if (!getkSecureBackupBagPasswordKeySymbolLoc_ptr)
          {
            v56 = (void *)CloudServicesLibrary_642();
            v55 = dlsym(v56, "kSecureBackupBagPasswordKey");
            *(void *)(*((void *)&buf + 1) + 24LL) = v55;
            getkSecureBackupBagPasswordKeySymbolLoc_ptr = (uint64_t)v55;
          }

          _Block_object_dispose(&buf, 8);
          if (v55)
          {
            uint64_t v57 = [v52 objectForKeyedSubscript:*v55];
            uint64_t v58 = (void *)v57;
            if (v69 && v57)
            {
              if (v72 && ([v73 isEqualToString:@"valid"] & 1) != 0) {
                uint64_t v59 = 1LL;
              }
              else {
                uint64_t v59 = v68;
              }
              id v78 = 0LL;
              [v71 restoreKeychainAsyncWithPassword:v58 keybagDigest:v69 haveBottledPeer:v59 viewsNotToBeRestored:v49 error:&v78];
              id v64 = v78;
              if (v64)
              {
                secLogObjForScope();
                uint64_t v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(buf) = 138412290;
                  *(void *)((char *)&buf + 4) = v64;
                  _os_log_impl( &dword_18744F000,  v65,  OS_LOG_TYPE_DEFAULT,  "octagontrust-handleRecoveryResults: error restoring keychain items: %@",  (uint8_t *)&buf,  0xCu);
                }
              }

              id v66 = v18;
            }

            else
            {
              secLogObjForScope();
              int v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(buf) = 0;
                _os_log_impl( &dword_18744F000,  v62,  OS_LOG_TYPE_DEFAULT,  "unable to request keychain restore, digest or password missing",  (uint8_t *)&buf,  2u);
              }

              id v63 = v18;
            }

LABEL_90:
            __int128 v20 = v18;
            goto LABEL_91;
          }
        }
      }

      dlerror();
      abort_report_np();
      __break(1u);
    }

    secLogObjForScope();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v75;
      _os_log_impl(&dword_18744F000, v25, OS_LOG_TYPE_DEFAULT, "recovering from bottle: %@", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v86 = 0x3032000000LL;
    __int128 v87 = __Block_byref_object_copy_;
    __int16 v88 = __Block_byref_object_dispose_;
    id v89 = 0LL;
    if (a6)
    {
      _OctagonSignpostLogSystem();
      int v26 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = _OctagonSignpostCreate();
      uint64_t v70 = v28;
      os_signpost_id_t v29 = v27;

      _OctagonSignpostLogSystem();
      uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = v30;
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        *(_WORD *)__int128 v83 = 0;
        _os_signpost_emit_with_name_impl( &dword_18744F000,  v31,  OS_SIGNPOST_INTERVAL_BEGIN,  v29,  "PerformOctagonJoinForSilent",  " enableTelemetry=YES ",  v83,  2u);
      }

      _OctagonSignpostLogSystem();
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_53;
      }
      *(_DWORD *)__int128 v83 = 134217984;
      os_signpost_id_t v84 = v29;
      v33 = "BEGIN [%lld]: PerformOctagonJoinForSilent  enableTelemetry=YES ";
    }

    else
    {
      _OctagonSignpostLogSystem();
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v41 = _OctagonSignpostCreate();
      uint64_t v70 = v42;
      os_signpost_id_t v29 = v41;

      _OctagonSignpostLogSystem();
      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v44 = v43;
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
      {
        *(_WORD *)__int128 v83 = 0;
        _os_signpost_emit_with_name_impl( &dword_18744F000,  v44,  OS_SIGNPOST_INTERVAL_BEGIN,  v29,  "PerformOctagonJoinForNonSilent",  " enableTelemetry=YES ",  v83,  2u);
      }

      _OctagonSignpostLogSystem();
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_53;
      }
      *(_DWORD *)__int128 v83 = 134217984;
      os_signpost_id_t v84 = v29;
      v33 = "BEGIN [%lld]: PerformOctagonJoinForNonSilent  enableTelemetry=YES ";
    }

    _os_log_impl(&dword_18744F000, v32, OS_LOG_TYPE_DEFAULT, v33, v83, 0xCu);
LABEL_53:

    v45 = (void *)[objc_alloc(MEMORY[0x18960AFA0]) initWithConfiguration:v14];
    v80[0] = MEMORY[0x1895F87A8];
    v80[1] = 3221225472LL;
    v80[2] = __112__OTClique_Framework__handleRecoveryResults_recoveredInformation_record_performedSilentBurn_recoverError_error___block_invoke;
    v80[3] = &unk_18A04F1E0;
    char v81 = a6;
    v80[4] = &buf;
    v80[5] = v29;
    v80[6] = v70;
    [v77 restoreFromBottle:v45 entropy:v74 bottleID:v75 reply:v80];

    v46 = *(void **)(*((void *)&buf + 1) + 40LL);
    if (v46)
    {
      if (a8) {
        *a8 = v46;
      }
      _Block_object_dispose(&buf, 8);

LABEL_57:
      __int128 v20 = 0LL;
LABEL_91:

LABEL_92:
LABEL_93:

      goto LABEL_94;
    }

    _Block_object_dispose(&buf, 8);

    unsigned int v68 = 0;
    goto LABEL_59;
  }

  if (a8)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:-4 userInfo:0];
    __int128 v20 = 0LL;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    __int128 v20 = 0LL;
  }

+ (id)performEscrowRecovery:()Framework cdpContext:escrowRecord:error:
{
  uint64_t v67 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  secLogObjForScope();
  __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    [v9 context];
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 altDSID];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v14;
    _os_log_impl( &dword_18744F000,  v12,  OS_LOG_TYPE_DEFAULT,  "performEscrowRecovery invoked for context:%@, altdsid:%@",  buf,  0x16u);
  }

  if ([a1 isCloudServicesAvailable])
  {
    _OctagonSignpostLogSystem();
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t spid = _OctagonSignpostCreate();

    _OctagonSignpostLogSystem();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v17 = v16;
    unint64_t v59 = spid - 1;
    if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( &dword_18744F000,  v17,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "PerformEscrowRecovery",  " enableTelemetry=YES ",  buf,  2u);
    }

    _OctagonSignpostLogSystem();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134217984;
      *(void *)&uint8_t buf[4] = spid;
      _os_log_impl( &dword_18744F000,  v18,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PerformEscrowRecovery  enableTelemetry=YES ",  buf,  0xCu);
    }

    [v9 sbd];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v20 = v19;
    if (v19) {
      id v60 = v19;
    }
    else {
      id v60 = objc_alloc_init((Class)getSecureBackupClass());
    }

    BOOL v22 = +[OTEscrowTranslation supportedRestorePath:](&OBJC_CLASS___OTEscrowTranslation, "supportedRestorePath:", v10);
    secLogObjForScope();
    BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v22;
      _os_log_impl(&dword_18744F000, v23, OS_LOG_TYPE_DEFAULT, "restore path is supported? %{BOOL}d", buf, 8u);
    }

    if (v22)
    {
      _OctagonSignpostLogSystem();
      int v24 = (void *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v25 = _OctagonSignpostCreate();

      _OctagonSignpostLogSystem();
      int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = v26;
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)__int128 buf = 0;
        _os_signpost_emit_with_name_impl( &dword_18744F000,  v27,  OS_SIGNPOST_INTERVAL_BEGIN,  v25,  "RecoverWithCDPContext",  " enableTelemetry=YES ",  buf,  2u);
      }

      _OctagonSignpostLogSystem();
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134217984;
        *(void *)&uint8_t buf[4] = v25;
        _os_log_impl( &dword_18744F000,  v28,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: RecoverWithCDPContext  enableTelemetry=YES ",  buf,  0xCu);
      }

      id v64 = 0LL;
      [v60 recoverWithCDPContext:v10 escrowRecord:v11 error:&v64];
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      id v30 = v64;
      BOOL v57 = v30 == 0LL;
      uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v25 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v32))
      {
        *(_DWORD *)__int128 buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = v30 == 0LL;
        _os_signpost_emit_with_name_impl( &dword_18744F000,  v33,  OS_SIGNPOST_INTERVAL_END,  v25,  "RecoverWithCDPContext",  " OctagonSignpostNameRecoverWithCDPContext=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverW ithCDPContext}d ",  buf,  8u);
      }

      _OctagonSignpostLogSystem();
      int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134218496;
        *(void *)&uint8_t buf[4] = v25;
        *(_WORD *)&_BYTE buf[12] = 2048;
        *(double *)&buf[14] = (double)(unint64_t)Nanoseconds / 1000000000.0;
        *(_WORD *)&buf[22] = 1026;
        LODWORD(v66) = v30 == 0LL;
        _os_log_impl( &dword_18744F000,  v34,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RecoverWithCDPContext  OctagonSignpostNameRecoverWithCDPContext=%{public,signpost.telemetry:nu mber1,name=OctagonSignpostNameRecoverWithCDPContext}d ",  buf,  0x1Cu);
      }
    }

    else
    {
      +[OTEscrowTranslation CDPRecordContextToDictionary:]( &OBJC_CLASS___OTEscrowTranslation,  "CDPRecordContextToDictionary:",  v10);
      id v35 = (void *)objc_claimAutoreleasedReturnValue();
      int v34 = (os_log_s *)[v35 mutableCopy];

      [v11 escrowInformationMetadata];
      int v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[OTEscrowTranslation metadataToDictionary:](&OBJC_CLASS___OTEscrowTranslation, "metadataToDictionary:", v36);
      uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();

      *(void *)__int128 buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000LL;
      uint64_t v37 = (void *)getkSecureBackupMetadataKeySymbolLoc_ptr;
      uint64_t v66 = getkSecureBackupMetadataKeySymbolLoc_ptr;
      if (!getkSecureBackupMetadataKeySymbolLoc_ptr)
      {
        uint64_t v38 = (void *)CloudServicesLibrary_642();
        uint64_t v37 = dlsym(v38, "kSecureBackupMetadataKey");
        *(void *)(*(void *)&buf[8] + 24LL) = v37;
        getkSecureBackupMetadataKeySymbolLoc_ptr = (uint64_t)v37;
      }

      _Block_object_dispose(buf, 8);
      if (!v37) {
        goto LABEL_61;
      }
      -[os_log_s setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v58, *v37);
      [v11 recordId];
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(void *)__int128 buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000LL;
      uint64_t v40 = (void *)getkSecureBackupRecordIDKeySymbolLoc_ptr_670;
      uint64_t v66 = getkSecureBackupRecordIDKeySymbolLoc_ptr_670;
      if (!getkSecureBackupRecordIDKeySymbolLoc_ptr_670)
      {
        uint64_t v41 = (void *)CloudServicesLibrary_642();
        uint64_t v40 = dlsym(v41, "kSecureBackupRecordIDKey");
        *(void *)(*(void *)&buf[8] + 24LL) = v40;
        getkSecureBackupRecordIDKeySymbolLoc_ptr_670 = (uint64_t)v40;
      }

      _Block_object_dispose(buf, 8);
      if (!v40)
      {
LABEL_61:
        dlerror();
        abort_report_np();
        __break(1u);
      }

      -[os_log_s setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v39, *v40);

      secLogObjForScope();
      uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)&uint8_t buf[4] = v34;
        _os_log_impl(&dword_18744F000, v42, OS_LOG_TYPE_DEFAULT, "using sbdRecoveryArguments: %@", buf, 0xCu);
      }

      _OctagonSignpostLogSystem();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v44 = _OctagonSignpostCreate();

      _OctagonSignpostLogSystem();
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v46 = v45;
      if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
      {
        *(_WORD *)__int128 buf = 0;
        _os_signpost_emit_with_name_impl( &dword_18744F000,  v46,  OS_SIGNPOST_INTERVAL_BEGIN,  v44,  "PerformRecoveryFromSBD",  " enableTelemetry=YES ",  buf,  2u);
      }

      _OctagonSignpostLogSystem();
      v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134217984;
        *(void *)&uint8_t buf[4] = v44;
        _os_log_impl( &dword_18744F000,  v47,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PerformRecoveryFromSBD  enableTelemetry=YES ",  buf,  0xCu);
      }

      id v63 = 0LL;
      [v60 recoverWithInfo:v34 results:&v63];
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      id v29 = v63;
      BOOL v57 = v30 == 0LL;
      uint64_t v48 = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v50 = v49;
      if (v44 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v49))
      {
        *(_DWORD *)__int128 buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = v30 == 0LL;
        _os_signpost_emit_with_name_impl( &dword_18744F000,  v50,  OS_SIGNPOST_INTERVAL_END,  v44,  "PerformRecoveryFromSBD",  " OctagonSignpostNamePerformRecoveryFromSBD=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerform RecoveryFromSBD}d ",  buf,  8u);
      }

      _OctagonSignpostLogSystem();
      uint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134218496;
        *(void *)&uint8_t buf[4] = v44;
        *(_WORD *)&_BYTE buf[12] = 2048;
        *(double *)&buf[14] = (double)(unint64_t)v48 / 1000000000.0;
        *(_WORD *)&buf[22] = 1026;
        LODWORD(v66) = v30 == 0LL;
        _os_log_impl( &dword_18744F000,  v51,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PerformRecoveryFromSBD  OctagonSignpostNamePerformRecoveryFromSBD=%{public,signpost.telemetry: number1,name=OctagonSignpostNamePerformRecoveryFromSBD}d ",  buf,  0x1Cu);
      }
    }

    [MEMORY[0x18960AF90] handleRecoveryResults:v9 recoveredInformation:v29 record:v11 performedSilentBurn:0 recoverError:v30 error:a6];
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v52 = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    char v54 = v53;
    if (v30)
    {
      if (v59 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
      {
        *(_DWORD *)__int128 buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = 0;
        _os_signpost_emit_with_name_impl( &dword_18744F000,  v54,  OS_SIGNPOST_INTERVAL_END,  spid,  "PerformEscrowRecovery",  " OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformE scrowRecovery}d ",  buf,  8u);
      }

      _OctagonSignpostLogSystem();
      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_59;
      }
      *(_DWORD *)__int128 buf = 134218496;
      *(void *)&uint8_t buf[4] = spid;
      *(_WORD *)&_BYTE buf[12] = 2048;
      *(double *)&buf[14] = (double)(unint64_t)v52 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v66) = 0;
    }

    else
    {
      if (v59 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
      {
        *(_DWORD *)__int128 buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = v57;
        _os_signpost_emit_with_name_impl( &dword_18744F000,  v54,  OS_SIGNPOST_INTERVAL_END,  spid,  "PerformEscrowRecovery",  " OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformE scrowRecovery}d ",  buf,  8u);
      }

      _OctagonSignpostLogSystem();
      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_59;
      }
      *(_DWORD *)__int128 buf = 134218496;
      *(void *)&uint8_t buf[4] = spid;
      *(_WORD *)&_BYTE buf[12] = 2048;
      *(double *)&buf[14] = (double)(unint64_t)v52 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v66) = v57;
    }

    _os_log_impl( &dword_18744F000,  v55,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PerformEscrowRecovery  OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number 1,name=OctagonSignpostNamePerformEscrowRecovery}d ",  buf,  0x1Cu);
LABEL_59:

    goto LABEL_60;
  }

  if (a6)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:-4 userInfo:0];
    __int128 v21 = 0LL;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    __int128 v21 = 0LL;
  }

+ (id)recordMatchingLabel:()Framework allRecords:
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = a4;
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        objc_msgSend(v10, "label", (void)v14);
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        char v12 = [v11 isEqualToString:v5];

        if ((v12 & 1) != 0)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

+ (id)performSilentEscrowRecovery:()Framework cdpContext:allRecords:error:
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v57 = a5;
  secLogObjForScope();
  char v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    [v10 context];
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 altDSID];
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v14;
    _os_log_impl( &dword_18744F000,  v12,  OS_LOG_TYPE_DEFAULT,  "performSilentEscrowRecovery invoked for context:%@, altdsid:%@",  buf,  0x16u);
  }

  if ([a1 isCloudServicesAvailable])
  {
    _OctagonSignpostLogSystem();
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t spid = _OctagonSignpostCreate();

    _OctagonSignpostLogSystem();
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    __int128 v17 = v16;
    unint64_t v54 = spid - 1;
    if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( &dword_18744F000,  v17,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "PerformSilentEscrowRecovery",  " enableTelemetry=YES ",  buf,  2u);
    }

    _OctagonSignpostLogSystem();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134217984;
      *(void *)&uint8_t buf[4] = spid;
      _os_log_impl( &dword_18744F000,  v18,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PerformSilentEscrowRecovery  enableTelemetry=YES ",  buf,  0xCu);
    }

    [v10 sbd];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v20 = v19;
    if (v19) {
      id v55 = v19;
    }
    else {
      id v55 = objc_alloc_init((Class)getSecureBackupClass());
    }

    BOOL v22 = +[OTEscrowTranslation supportedRestorePath:](&OBJC_CLASS___OTEscrowTranslation, "supportedRestorePath:", v11);
    secLogObjForScope();
    BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v22;
      _os_log_impl(&dword_18744F000, v23, OS_LOG_TYPE_DEFAULT, "restore path is supported? %{BOOL}d", buf, 8u);
    }

    if (v22)
    {
      _OctagonSignpostLogSystem();
      int v24 = (void *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v25 = _OctagonSignpostCreate();

      _OctagonSignpostLogSystem();
      int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = v26;
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)__int128 buf = 0;
        _os_signpost_emit_with_name_impl( &dword_18744F000,  v27,  OS_SIGNPOST_INTERVAL_BEGIN,  v25,  "RecoverSilentWithCDPContext",  " enableTelemetry=YES ",  buf,  2u);
      }

      _OctagonSignpostLogSystem();
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134217984;
        *(void *)&uint8_t buf[4] = v25;
        _os_log_impl( &dword_18744F000,  v28,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: RecoverSilentWithCDPContext  enableTelemetry=YES ",  buf,  0xCu);
      }

      id v59 = 0LL;
      [v55 recoverSilentWithCDPContext:v11 allRecords:v57 error:&v59];
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      id v30 = v59;
      BOOL v53 = v30 == 0LL;
      uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v25 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v32))
      {
        *(_DWORD *)__int128 buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = v30 == 0LL;
        _os_signpost_emit_with_name_impl( &dword_18744F000,  v33,  OS_SIGNPOST_INTERVAL_END,  v25,  "RecoverSilentWithCDPContext",  " OctagonSignpostNameRecoverSilentWithCDPContext=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRe coverSilentWithCDPContext}d ",  buf,  8u);
      }

      _OctagonSignpostLogSystem();
      int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134218496;
        *(void *)&uint8_t buf[4] = v25;
        *(_WORD *)&_BYTE buf[12] = 2048;
        *(double *)&buf[14] = (double)(unint64_t)Nanoseconds / 1000000000.0;
        *(_WORD *)&buf[22] = 1026;
        LODWORD(v61) = v30 == 0LL;
        _os_log_impl( &dword_18744F000,  v34,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RecoverSilentWithCDPContext  OctagonSignpostNameRecoverSilentWithCDPContext=%{public,signpost. telemetry:number1,name=OctagonSignpostNameRecoverSilentWithCDPContext}d ",  buf,  0x1Cu);
      }
    }

    else
    {
      +[OTEscrowTranslation CDPRecordContextToDictionary:]( &OBJC_CLASS___OTEscrowTranslation,  "CDPRecordContextToDictionary:",  v11);
      int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      _OctagonSignpostLogSystem();
      id v35 = (void *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v36 = _OctagonSignpostCreate();

      _OctagonSignpostLogSystem();
      uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v38 = v37;
      if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        *(_WORD *)__int128 buf = 0;
        _os_signpost_emit_with_name_impl( &dword_18744F000,  v38,  OS_SIGNPOST_INTERVAL_BEGIN,  v36,  "PerformRecoveryFromSBD",  " enableTelemetry=YES ",  buf,  2u);
      }

      _OctagonSignpostLogSystem();
      uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134217984;
        *(void *)&uint8_t buf[4] = v36;
        _os_log_impl( &dword_18744F000,  v39,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PerformRecoveryFromSBD  enableTelemetry=YES ",  buf,  0xCu);
      }

      id v58 = 0LL;
      [v55 recoverWithInfo:v34 results:&v58];
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      id v29 = v58;
      BOOL v53 = v30 == 0LL;
      uint64_t v40 = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v42 = v41;
      if (v36 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v41))
      {
        *(_DWORD *)__int128 buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = v30 == 0LL;
        _os_signpost_emit_with_name_impl( &dword_18744F000,  v42,  OS_SIGNPOST_INTERVAL_END,  v36,  "PerformRecoveryFromSBD",  " OctagonSignpostNamePerformRecoveryFromSBD=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerform RecoveryFromSBD}d ",  buf,  8u);
      }

      _OctagonSignpostLogSystem();
      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134218496;
        *(void *)&uint8_t buf[4] = v36;
        *(_WORD *)&_BYTE buf[12] = 2048;
        *(double *)&buf[14] = (double)(unint64_t)v40 / 1000000000.0;
        *(_WORD *)&buf[22] = 1026;
        LODWORD(v61) = v30 == 0LL;
        _os_log_impl( &dword_18744F000,  v43,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PerformRecoveryFromSBD  OctagonSignpostNamePerformRecoveryFromSBD=%{public,signpost.telemetry: number1,name=OctagonSignpostNamePerformRecoveryFromSBD}d ",  buf,  0x1Cu);
      }
    }

    *(void *)__int128 buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    os_signpost_id_t v44 = (void *)getkSecureBackupRecordLabelKeySymbolLoc_ptr_669;
    uint64_t v61 = getkSecureBackupRecordLabelKeySymbolLoc_ptr_669;
    if (!getkSecureBackupRecordLabelKeySymbolLoc_ptr_669)
    {
      v45 = (void *)CloudServicesLibrary_642();
      os_signpost_id_t v44 = dlsym(v45, "kSecureBackupRecordLabelKey");
      *(void *)(*(void *)&buf[8] + 24LL) = v44;
      getkSecureBackupRecordLabelKeySymbolLoc_ptr_669 = (uint64_t)v44;
    }

    _Block_object_dispose(buf, 8);
    if (!v44)
    {
      dlerror();
      abort_report_np();
      __break(1u);
    }

    [v29 objectForKeyedSubscript:*v44];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x18960AF90] recordMatchingLabel:v46 allRecords:v57];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x18960AF90] handleRecoveryResults:v10 recoveredInformation:v29 record:v47 performedSilentBurn:1 recoverError:v30 error:a6];
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v48 = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v50 = v49;
    if (v30)
    {
      if (v54 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
      {
        *(_DWORD *)__int128 buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = 0;
        _os_signpost_emit_with_name_impl( &dword_18744F000,  v50,  OS_SIGNPOST_INTERVAL_END,  spid,  "PerformSilentEscrowRecovery",  " OctagonSignpostNamePerformSilentEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePe rformSilentEscrowRecovery}d ",  buf,  8u);
      }

      _OctagonSignpostLogSystem();
      uint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_54;
      }
      *(_DWORD *)__int128 buf = 134218496;
      *(void *)&uint8_t buf[4] = spid;
      *(_WORD *)&_BYTE buf[12] = 2048;
      *(double *)&buf[14] = (double)(unint64_t)v48 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v61) = 0;
    }

    else
    {
      if (v54 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
      {
        *(_DWORD *)__int128 buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = v53;
        _os_signpost_emit_with_name_impl( &dword_18744F000,  v50,  OS_SIGNPOST_INTERVAL_END,  spid,  "PerformSilentEscrowRecovery",  " OctagonSignpostNamePerformSilentEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePe rformSilentEscrowRecovery}d ",  buf,  8u);
      }

      _OctagonSignpostLogSystem();
      uint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_54;
      }
      *(_DWORD *)__int128 buf = 134218496;
      *(void *)&uint8_t buf[4] = spid;
      *(_WORD *)&_BYTE buf[12] = 2048;
      *(double *)&buf[14] = (double)(unint64_t)v48 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v61) = v53;
    }

    _os_log_impl( &dword_18744F000,  v51,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PerformSilentEscrowRecovery  OctagonSignpostNamePerformSilentEscrowRecovery=%{public,signpost.tele metry:number1,name=OctagonSignpostNamePerformSilentEscrowRecovery}d ",  buf,  0x1Cu);
LABEL_54:

    goto LABEL_55;
  }

  if (a6)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:-4 userInfo:0];
    __int128 v21 = 0LL;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    __int128 v21 = 0LL;
  }

+ (BOOL)invalidateEscrowCache:()Framework error:
{
  void v28[2] = *(id *)MEMORY[0x1895F89C0];
  id v5 = a3;
  secLogObjForScope();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    [v5 context];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 altDSID];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl( &dword_18744F000,  v6,  OS_LOG_TYPE_DEFAULT,  "invalidateEscrowCache invoked for context:%@, altdsid:%@",  buf,  0x16u);
  }

  *(void *)__int128 buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  int v26 = __Block_byref_object_copy_;
  uint64_t v27 = __Block_byref_object_dispose_;
  v28[0] = 0LL;
  uint64_t v19 = 0LL;
  __int128 v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  id obj = 0LL;
  [v5 makeOTControl:&obj];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v28, obj);
  if (v9)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x18960AFA0]) initWithConfiguration:v5];
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __51__OTClique_Framework__invalidateEscrowCache_error___block_invoke;
    v17[3] = &unk_18A04F208;
    v17[4] = &v19;
    v17[5] = buf;
    [v9 invalidateEscrowCache:v10 reply:v17];

    if (a4)
    {
      id v11 = *(void **)(*(void *)&buf[8] + 40LL);
      if (v11) {
        *a4 = v11;
      }
    }

    secLogObjForScope();
    char v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v23 = 0;
      _os_log_impl(&dword_18744F000, v12, OS_LOG_TYPE_DEFAULT, "invalidateEscrowCache complete", v23, 2u);
    }
  }

  else
  {
    secLogObjForScope();
    __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(*(void *)&buf[8] + 40LL);
      *(_DWORD *)BOOL v23 = 138412290;
      uint64_t v24 = v14;
      _os_log_impl(&dword_18744F000, v13, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v23, 0xCu);
    }

    if (a4) {
      *a4 = *(id *)(*(void *)&buf[8] + 40LL);
    }
  }

  BOOL v15 = *((_BYTE *)v20 + 24) != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(buf, 8);

  return v15;
}

+ (id)_fetchAccountWideSettingsDefaultWithForceFetch:()Framework useDefault:configuration:error:
{
  v29[2] = *(id *)MEMORY[0x1895F89C0];
  id v9 = a5;
  secLogObjForScope();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = a3;
    _os_log_impl( &dword_18744F000,  v10,  OS_LOG_TYPE_DEFAULT,  "fetchAccountWideSettings invoked for context:%@ forceFetch:%{BOOL}d",  buf,  0x12u);
  }

  *(void *)__int128 buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  uint64_t v27 = __Block_byref_object_copy_;
  uint64_t v28 = __Block_byref_object_dispose_;
  v29[0] = 0LL;
  id obj = 0LL;
  [v9 makeOTControl:&obj];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v29, obj);
  if (v11)
  {
    *(void *)&__int128 v21 = 0LL;
    *((void *)&v21 + 1) = &v21;
    uint64_t v22 = 0x3032000000LL;
    BOOL v23 = __Block_byref_object_copy_;
    uint64_t v24 = __Block_byref_object_dispose_;
    id v25 = 0LL;
    char v12 = (void *)[objc_alloc(MEMORY[0x18960AFA0]) initWithConfiguration:v9];
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __101__OTClique_Framework___fetchAccountWideSettingsDefaultWithForceFetch_useDefault_configuration_error___block_invoke;
    v18[3] = &unk_18A04F2A8;
    char v19 = a4;
    v18[4] = &v21;
    v18[5] = buf;
    [v11 fetchAccountWideSettingsWithForceFetch:a3 arguments:v12 reply:v18];

    if (a6)
    {
      __int16 v13 = *(void **)(*(void *)&buf[8] + 40LL);
      if (v13) {
        *a6 = v13;
      }
    }

    id v14 = *(id *)(*((void *)&v21 + 1) + 40LL);
    _Block_object_dispose(&v21, 8);
  }

  else
  {
    secLogObjForScope();
    BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(*(void *)&buf[8] + 40LL);
      LODWORD(v21) = 138412290;
      *(void *)((char *)&v21 + 4) = v16;
      _os_log_impl(&dword_18744F000, v15, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", (uint8_t *)&v21, 0xCu);
    }

    id v14 = 0LL;
    if (a6) {
      *a6 = *(id *)(*(void *)&buf[8] + 40LL);
    }
  }

  _Block_object_dispose(buf, 8);
  return v14;
}

+ (uint64_t)fetchAccountWideSettingsWithForceFetch:()Framework configuration:error:
{
  return [MEMORY[0x18960AF90] _fetchAccountWideSettingsDefaultWithForceFetch:a3 useDefault:0 configuration:a4 error:a5];
}

+ (uint64_t)fetchAccountWideSettingsDefaultWithForceFetch:()Framework configuration:error:
{
  return [MEMORY[0x18960AF90] _fetchAccountWideSettingsDefaultWithForceFetch:a3 useDefault:1 configuration:a4 error:a5];
}

+ (uint64_t)fetchAccountWideSettings:()Framework error:
{
  return [MEMORY[0x18960AF90] _fetchAccountWideSettingsDefaultWithForceFetch:0 useDefault:0 configuration:a3 error:a4];
}

+ (uint64_t)ensureBackupKeyExistsinSOS:()Framework
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  v4 = (const void *)SOSCCCopyMyPeerInfo();
  if (v4)
  {
    id v5 = (const void *)SOSPeerInfoCopyBackupKey();
    CFRelease(v4);
    if (v5)
    {
      CFRelease(v5);
      secLogObjForScope();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl(&dword_18744F000, v6, OS_LOG_TYPE_DEFAULT, "backup key already registered", buf, 2u);
      }

      return 1LL;
    }

    id v9 = (void *)SecPasswordGenerate();
    id v10 = v9;
    if (v9)
    {
      [v9 dataUsingEncoding:4];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = SOSCCCopyMyPeerWithNewDeviceRecoverySecret();
      if (v12)
      {
        __int16 v13 = (const void *)v12;
        secLogObjForScope();
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl(&dword_18744F000, v14, OS_LOG_TYPE_DEFAULT, "registered backup key", buf, 2u);
        }

        CFRelease(v13);
        return 1LL;
      }

      secLogObjForScope();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v18 = 0LL;
        _os_log_impl( &dword_18744F000,  v16,  OS_LOG_TYPE_DEFAULT,  "octagon-register-recovery-key, SOSCCCopyMyPeerWithNewDeviceRecoverySecret() failed: %@",  buf,  0xCu);
      }

      if (a3) {
        *a3 = 0LL;
      }
    }

    else
    {
      secLogObjForScope();
      BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v18 = 0LL;
        _os_log_impl( &dword_18744F000,  v15,  OS_LOG_TYPE_DEFAULT,  "octagon-register-recovery-key, SecPasswordGenerate() failed: %@",  buf,  0xCu);
      }

      if (a3) {
        *a3 = 0LL;
      }
    }
  }

  else
  {
    secLogObjForScope();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v18 = 0LL;
      _os_log_impl( &dword_18744F000,  v8,  OS_LOG_TYPE_DEFAULT,  "octagon-register-recovery-key, SOSCCCopyMyPeerInfo() failed: %@",  buf,  0xCu);
    }

    if (a3) {
      *a3 = 0LL;
    }
  }

  return 0LL;
}

+ (uint64_t)registerRecoveryKeyInSOSAndBackup:()Framework recoveryKey:error:
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  v38[1] = 0LL;
  int v9 = SOSCCThisDeviceIsInCircle();
  int v10 = SOSCCIsSOSTrustAndSyncingEnabled();
  if (v9) {
    int v11 = 0;
  }
  else {
    int v11 = v10;
  }
  if (v11 != 1)
  {
    secLogObjForScope();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( &dword_18744F000,  v22,  OS_LOG_TYPE_DEFAULT,  "device is not participating in SOS, skipping recovery key registration",  (uint8_t *)&buf,  2u);
    }

    goto LABEL_19;
  }

  v38[0] = 0LL;
  char v12 = [MEMORY[0x18960AF90] ensureBackupKeyExistsinSOS:v38];
  id v13 = v38[0];
  if (v13) {
    char v14 = 0;
  }
  else {
    char v14 = v12;
  }
  if ((v14 & 1) == 0)
  {
    BOOL v15 = v13;
    if (a5) {
      *a5 = v13;
    }
    goto LABEL_50;
  }

  SecRKCreateRecoveryKeyWithError();
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = 0LL;
  __int128 v17 = v16;
  if (!v15 || v16)
  {
    secLogObjForScope();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_impl( &dword_18744F000,  v24,  OS_LOG_TYPE_DEFAULT,  "octagon-register-recovery-key, SecRKCreateRecoveryKeyWithError() failed: %@",  (uint8_t *)&buf,  0xCu);
    }

    [MEMORY[0x189603FC8] dictionary];
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 setObject:@"SecRKCreateRecoveryKeyWithError() failed" forKeyedSubscript:*MEMORY[0x1896075E0]];
    [v25 setObject:v17 forKeyedSubscript:*MEMORY[0x189607798]];
    char v26 = [MEMORY[0x18960AF90] isCloudServicesAvailable];
    uint64_t v27 = (void *)MEMORY[0x189607870];
    if ((v26 & 1) != 0)
    {
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v40 = 0x2020000000LL;
      uint64_t v28 = (id *)getkSecureBackupErrorDomainSymbolLoc_ptr;
      uint64_t v41 = getkSecureBackupErrorDomainSymbolLoc_ptr;
      if (!getkSecureBackupErrorDomainSymbolLoc_ptr)
      {
        id v29 = (void *)CloudServicesLibrary_642();
        uint64_t v28 = (id *)dlsym(v29, "kSecureBackupErrorDomain");
        *(void *)(*((void *)&buf + 1) + 24LL) = v28;
        getkSecureBackupErrorDomainSymbolLoc_ptr = (uint64_t)v28;
      }

      _Block_object_dispose(&buf, 8);
      if (!v28)
      {
        dlerror();
        abort_report_np();
        __break(1u);
      }

      id v30 = *v28;
      [v27 errorWithDomain:v30 code:24 userInfo:v25];
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!a5) {
        goto LABEL_37;
      }
    }

    else
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:-4 userInfo:v25];
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a5)
      {
LABEL_37:

LABEL_51:
        uint64_t v23 = 0LL;
        goto LABEL_52;
      }
    }

    *a5 = v31;
    goto LABEL_37;
  }

  if ((SecRKRegisterBackupPublicKey() & 1) == 0)
  {
    secLogObjForScope();
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = 0LL;
      _os_log_impl( &dword_18744F000,  v32,  OS_LOG_TYPE_DEFAULT,  "octagon-register-recovery-key, SecRKRegisterBackupPublicKey() failed: %@",  (uint8_t *)&buf,  0xCu);
    }

    if (a5)
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:11 description:@"Failed to register backup public key"];
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

+ (uint64_t)registerRecoveryKeyWithContext:()Framework recoveryKey:error:
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  secLogObjForScope();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    [v7 context];
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl( &dword_18744F000,  v9,  OS_LOG_TYPE_DEFAULT,  "registerRecoveryKeyWithContext invoked for context: %@",  (uint8_t *)&buf,  0xCu);
  }

  id v31 = 0LL;
  [v7 makeOTControl:&v31];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = v31;
  if (v11)
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v33 = 0x3032000000LL;
    int v34 = __Block_byref_object_copy_;
    id v35 = __Block_byref_object_dispose_;
    id v36 = 0LL;
    id v13 = (void *)[objc_alloc(MEMORY[0x18960AFA0]) initWithConfiguration:v7];
    uint64_t v14 = MEMORY[0x1895F87A8];
    v30[0] = MEMORY[0x1895F87A8];
    v30[1] = 3221225472LL;
    v30[2] = __72__OTClique_Framework__registerRecoveryKeyWithContext_recoveryKey_error___block_invoke;
    v30[3] = &unk_18A04F230;
    v30[4] = &buf;
    [v11 createRecoveryKey:v13 recoveryKey:v8 reply:v30];

    BOOL v15 = *(void **)(*((void *)&buf + 1) + 40LL);
    if (v15)
    {
      uint64_t v16 = 0LL;
      if (a5) {
        *a5 = v15;
      }
    }

    else
    {
      id v29 = 0LL;
      LODWORD(v16) = [MEMORY[0x18960AF90] registerRecoveryKeyInSOSAndBackup:v7 recoveryKey:v8 error:&v29];
      id v18 = v29;
      if (v18) {
        uint64_t v16 = 0LL;
      }
      else {
        uint64_t v16 = v16;
      }
      if ((v16 & 1) == 0)
      {
        uint64_t v23 = 0LL;
        uint64_t v24 = &v23;
        uint64_t v25 = 0x3032000000LL;
        char v26 = __Block_byref_object_copy_;
        uint64_t v27 = __Block_byref_object_dispose_;
        id v28 = 0LL;
        uint64_t v19 = (void *)[objc_alloc(MEMORY[0x18960AFA0]) initWithConfiguration:v7];
        v22[0] = v14;
        v22[1] = 3221225472LL;
        v22[2] = __72__OTClique_Framework__registerRecoveryKeyWithContext_recoveryKey_error___block_invoke_60;
        v22[3] = &unk_18A04F230;
        v22[4] = &v23;
        [v11 removeRecoveryKey:v19 reply:v22];

        if (a5)
        {
          __int128 v20 = v18;
        }

        _Block_object_dispose(&v23, 8);
      }
    }

    _Block_object_dispose(&buf, 8);
  }

  else
  {
    secLogObjForScope();
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl( &dword_18744F000,  v17,  OS_LOG_TYPE_DEFAULT,  "failed to make OTControl object: %@",  (uint8_t *)&buf,  0xCu);
    }

    uint64_t v16 = 0LL;
    if (a5) {
      *a5 = v12;
    }
  }

  return v16;
}

+ (id)createAndSetRecoveryKeyWithContext:()Framework error:
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  secLogObjForScope();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    [v6 context];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412290;
    id v21 = v8;
    _os_log_impl( &dword_18744F000,  v7,  OS_LOG_TYPE_DEFAULT,  "createAndSetRecoveryKeyWithContext invoked for context: %@",  buf,  0xCu);
  }

  v19[1] = 0LL;
  SecRKCreateRecoveryKeyString();
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = 0LL;
  int v11 = v10;
  if (!v9 || v10)
  {
    secLogObjForScope();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v21 = v11;
      _os_log_impl( &dword_18744F000,  v16,  OS_LOG_TYPE_DEFAULT,  "octagon-create-recovery-key, failed to create recovery key error: %@",  buf,  0xCu);
    }

    id v15 = 0LL;
    if (a4) {
      *a4 = v11;
    }
  }

  else
  {
    v19[0] = 0LL;
    int v12 = [a1 registerRecoveryKeyWithContext:v6 recoveryKey:v9 error:v19];
    id v13 = v19[0];
    uint64_t v14 = v13;
    if (!v12 || v13)
    {
      secLogObjForScope();
      __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v21 = v14;
        _os_log_impl( &dword_18744F000,  v17,  OS_LOG_TYPE_DEFAULT,  "octagon-create-recovery-key, failed to register recovery key error: %@",  buf,  0xCu);
      }

      id v15 = 0LL;
      if (a4 && v14)
      {
        id v15 = 0LL;
        *a4 = v14;
      }
    }

    else
    {
      id v15 = v9;
    }
  }

  return v15;
}

+ (BOOL)setRecoveryKeyWithContext:()Framework recoveryKey:error:
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  secLogObjForScope();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    [v7 context];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl( &dword_18744F000,  v9,  OS_LOG_TYPE_DEFAULT,  "setRecoveryKeyWithContext invoked for context: %@",  (uint8_t *)&buf,  0xCu);
  }

  id v19 = 0LL;
  [v7 makeOTControl:&v19];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = v19;
  if (v11)
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v21 = 0x3032000000LL;
    uint64_t v22 = __Block_byref_object_copy_;
    uint64_t v23 = __Block_byref_object_dispose_;
    id v24 = 0LL;
    id v13 = (void *)[objc_alloc(MEMORY[0x18960AFA0]) initWithConfiguration:v7];
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __67__OTClique_Framework__setRecoveryKeyWithContext_recoveryKey_error___block_invoke;
    v18[3] = &unk_18A04F230;
    v18[4] = &buf;
    [v11 createRecoveryKey:v13 recoveryKey:v8 reply:v18];

    uint64_t v14 = *(void **)(*((void *)&buf + 1) + 40LL);
    BOOL v15 = v14 == 0LL;
    if (a5 && v14) {
      *a5 = v14;
    }
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    secLogObjForScope();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl( &dword_18744F000,  v16,  OS_LOG_TYPE_DEFAULT,  "failed to make OTControl object: %@",  (uint8_t *)&buf,  0xCu);
    }

    BOOL v15 = 0LL;
    if (a5) {
      *a5 = v12;
    }
  }

  return v15;
}

+ (BOOL)isRecoveryKeySetInOctagon:()Framework error:
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  secLogObjForScope();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl( &dword_18744F000,  v6,  OS_LOG_TYPE_DEFAULT,  "Checking Octagon recovery key status for context:%@",  (uint8_t *)&buf,  0xCu);
  }

  id v19 = 0LL;
  [v5 makeOTControl:&v19];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v19;
  if (v7)
  {
    uint64_t v15 = 0LL;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000LL;
    char v18 = 0;
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v21 = 0x3032000000LL;
    uint64_t v22 = __Block_byref_object_copy_;
    uint64_t v23 = __Block_byref_object_dispose_;
    id v24 = 0LL;
    int v9 = (void *)[objc_alloc(MEMORY[0x18960AFA0]) initWithConfiguration:v5];
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __55__OTClique_Framework__isRecoveryKeySetInOctagon_error___block_invoke;
    v14[3] = &unk_18A04F2F8;
    v14[4] = &buf;
    v14[5] = &v15;
    [v7 isRecoveryKeySet:v9 reply:v14];

    if (a4)
    {
      id v10 = *(void **)(*((void *)&buf + 1) + 40LL);
      if (v10) {
        *a4 = v10;
      }
    }

    BOOL v11 = *((_BYTE *)v16 + 24) != 0;
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v15, 8);
  }

  else
  {
    secLogObjForScope();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_18744F000, v12, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", (uint8_t *)&buf, 0xCu);
    }

    BOOL v11 = 0LL;
    if (a4) {
      *a4 = v8;
    }
  }

  return v11;
}

+ (uint64_t)isRecoveryKeySetInSOS:()Framework error:
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  secLogObjForScope();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v18 = v5;
    _os_log_impl( &dword_18744F000,  v6,  OS_LOG_TYPE_DEFAULT,  "Checking SOS recovery key status for context:%@",  buf,  0xCu);
  }

  [v5 sbd];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = objc_alloc_init((Class)getSecureBackupClass());
  }
  id v10 = v9;

  id v16 = 0LL;
  uint64_t v11 = [v10 isRecoveryKeySet:&v16];
  id v12 = v16;
  if (v12)
  {
    secLogObjForScope();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v18 = v12;
      _os_log_impl( &dword_18744F000,  v13,  OS_LOG_TYPE_DEFAULT,  "octagon-is-recovery-key-set-in-sos: failed to check the recovery key in SOS: %@",  buf,  0xCu);
    }

    if (a4) {
      *a4 = v12;
    }
  }

  else
  {
    secLogObjForScope();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109120;
      LODWORD(v18) = v11;
      _os_log_impl(&dword_18744F000, v14, OS_LOG_TYPE_DEFAULT, "recovery key set in SOS: %{BOOL}d", buf, 8u);
    }
  }

  return v11;
}

+ (uint64_t)isRecoveryKeySet:()Framework error:
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  secLogObjForScope();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v16 = v5;
    _os_log_impl(&dword_18744F000, v6, OS_LOG_TYPE_DEFAULT, "Checking recovery key status for context:%@", buf, 0xCu);
  }

  id v14 = 0LL;
  int v7 = [MEMORY[0x18960AF90] isRecoveryKeySetInOctagon:v5 error:&v14];
  id v8 = v14;
  id v13 = 0LL;
  unsigned int v9 = [MEMORY[0x18960AF90] isRecoveryKeySetInSOS:v5 error:&v13];
  id v10 = v13;
  if (a4)
  {
    if ((v9 & 1) == 0 && (v7 & 1) == 0)
    {
      uint64_t v11 = v8;
      if (v8 || (uint64_t v11 = v10) != 0LL) {
        *a4 = v11;
      }
    }
  }

  return v7 | v9;
}

+ (uint64_t)doesRecoveryKeyExistInSOSAndIsCorrect:()Framework recoveryKey:error:
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v27 = 0LL;
  int v9 = [MEMORY[0x18960AF90] isRecoveryKeySetInSOS:v7 error:&v27];
  id v10 = v27;
  if (v9) {
    BOOL v11 = v10 == 0LL;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    secLogObjForScope();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_18744F000, v15, OS_LOG_TYPE_DEFAULT, "recovery key is registered in SOS", buf, 2u);
    }

    [v7 sbd];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = v16;
    if (v16) {
      id v18 = v16;
    }
    else {
      id v18 = objc_alloc_init((Class)getSecureBackupClass());
    }
    uint64_t v19 = v18;

    id v26 = 0LL;
    int v20 = [v19 verifyRecoveryKey:v8 error:&v26];
    id v21 = v26;
    id v12 = v21;
    if (!v20 || v21)
    {
      secLogObjForScope();
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl(&dword_18744F000, v23, OS_LOG_TYPE_DEFAULT, "recovery key is NOT correct in SOS", buf, 2u);
      }

      if (a5)
      {
        if (v12)
        {
          id v24 = v12;
        }

        else
        {
          [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x18960AFE0] code:67 description:@"Recovery key is incorrect"];
          id v24 = (id)objc_claimAutoreleasedReturnValue();
        }

        *a5 = v24;
      }

      uint64_t v22 = 2LL;
    }

    else
    {
      uint64_t v22 = 3LL;
    }
  }

  else
  {
    id v12 = v10;
    secLogObjForScope();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v29 = v12;
      _os_log_impl( &dword_18744F000,  v13,  OS_LOG_TYPE_DEFAULT,  "octagon-recover-with-rk: Recovery Key not registered in SOS: %@",  buf,  0xCu);
    }

    if (a5)
    {
      if (v12)
      {
        id v14 = v12;
        id v12 = v14;
      }

      else
      {
        [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x18960AFE0] code:64 description:@"Recovery key does not exist in Octagon"];
        id v14 = (id)objc_claimAutoreleasedReturnValue();
      }

      *a5 = v14;
    }

    uint64_t v22 = 1LL;
  }

  return v22;
}

+ (uint64_t)doesRecoveryKeyExistInOctagonAndIsCorrect:()Framework recoveryKey:error:
{
  v33[2] = *(id *)MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v25 = 0LL;
  [v7 makeOTControl:&v25];
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v25;
  if (v9)
  {
    *(void *)&__int128 v29 = 0LL;
    *((void *)&v29 + 1) = &v29;
    uint64_t v30 = 0x3032000000LL;
    id v31 = __Block_byref_object_copy_;
    uint64_t v32 = __Block_byref_object_dispose_;
    v33[0] = 0LL;
    id obj = 0LL;
    int v11 = [MEMORY[0x18960AF90] isRecoveryKeySetInOctagon:v7 error:&obj];
    objc_storeStrong(v33, obj);
    if (v11 && !*(void *)(*((void *)&v29 + 1) + 40LL))
    {
      secLogObjForScope();
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl( &dword_18744F000,  v19,  OS_LOG_TYPE_DEFAULT,  "recovery key is registered in Octagon, checking if it is correct",  (uint8_t *)&buf,  2u);
      }

      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v27 = 0x2020000000LL;
      char v28 = 0;
      int v20 = (void *)[objc_alloc(MEMORY[0x18960AFA0]) initWithConfiguration:v7];
      v23[0] = MEMORY[0x1895F87A8];
      v23[1] = 3221225472LL;
      v23[2] = __83__OTClique_Framework__doesRecoveryKeyExistInOctagonAndIsCorrect_recoveryKey_error___block_invoke;
      v23[3] = &unk_18A04F2F8;
      uint8_t v23[4] = &v29;
      v23[5] = &buf;
      [v9 preflightRecoverOctagonUsingRecoveryKey:v20 recoveryKey:v8 reply:v23];

      if (*(_BYTE *)(*((void *)&buf + 1) + 24LL) && !*(void *)(*((void *)&v29 + 1) + 40LL))
      {
        uint64_t v17 = 3LL;
      }

      else
      {
        if (a5)
        {
          id v21 = *(void **)(*((void *)&v29 + 1) + 40LL);
          if (v21)
          {
            id v22 = v21;
          }

          else
          {
            [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x18960AFE0] code:67 description:@"Recovery key is incorrect"];
            id v22 = (id)objc_claimAutoreleasedReturnValue();
          }

          *a5 = v22;
        }

        uint64_t v17 = 2LL;
      }

      _Block_object_dispose(&buf, 8);
    }

    else
    {
      secLogObjForScope();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 40LL);
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v13;
        _os_log_impl( &dword_18744F000,  v12,  OS_LOG_TYPE_DEFAULT,  "octagon-recover-with-rk: recovery key not registered in Octagon, error: %@",  (uint8_t *)&buf,  0xCu);
      }

      if (a5)
      {
        id v14 = *(void **)(*((void *)&v29 + 1) + 40LL);
        if (v14)
        {
          id v15 = v14;
        }

        else
        {
          [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x18960AFE0] code:64 description:@"Recovery key does not exist in Octagon"];
          id v15 = (id)objc_claimAutoreleasedReturnValue();
        }

        *a5 = v15;
      }

      uint64_t v17 = 1LL;
    }

    _Block_object_dispose(&v29, 8);
  }

  else
  {
    secLogObjForScope();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v29) = 138412290;
      *(void *)((char *)&v29 + 4) = v10;
      _os_log_impl( &dword_18744F000,  v16,  OS_LOG_TYPE_DEFAULT,  "octagon-recover-with-rk: unable to create otcontrol: %@",  (uint8_t *)&v29,  0xCu);
    }

    uint64_t v17 = 0LL;
    if (a5) {
      *a5 = v10;
    }
  }

  return v17;
}

+ (BOOL)recoverWithRecoveryKey:()Framework recoveryKey:error:
{
  v70[2] = *(id *)MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  secLogObjForScope();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl( &dword_18744F000,  v9,  OS_LOG_TYPE_DEFAULT,  "Recovering account trust using recovery key for context:%@",  (uint8_t *)&buf,  0xCu);
  }

  id v63 = 0LL;
  if ((SecPasswordValidatePasswordFormat() & 1) != 0)
  {
    id v62 = 0LL;
    uint64_t v10 = [MEMORY[0x18960AF90] doesRecoveryKeyExistInSOSAndIsCorrect:v7 recoveryKey:v8 error:&v62];
    id v11 = v62;
    id v61 = 0LL;
    uint64_t v12 = [MEMORY[0x18960AF90] doesRecoveryKeyExistInOctagonAndIsCorrect:v7 recoveryKey:v8 error:&v61];
    id v52 = v61;
    if (v52)
    {
      [v52 domain];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v14 = [v52 code] == 31;

      if (v14)
      {
        [v52 userInfo];
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = *MEMORY[0x189607798];
        [v15 objectForKeyedSubscript:*MEMORY[0x189607798]];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          [v13 domain];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (![v17 isEqualToString:*MEMORY[0x18960B758]])
          {
LABEL_26:

            goto LABEL_27;
          }

          BOOL v18 = [v13 code] == 3;

          if (v18)
          {
            [v13 userInfo];
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
            [v19 objectForKeyedSubscript:v16];
            int v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              [v20 domain];
              id v21 = (void *)objc_claimAutoreleasedReturnValue();
              if ([v21 isEqualToString:*MEMORY[0x189607670]])
              {
                BOOL v22 = [v20 code] == -25308;

                if (v22)
                {
                  secLogObjForScope();
                  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    LODWORD(buf) = 138412290;
                    *(void *)((char *)&buf + 4) = v20;
                    _os_log_impl( &dword_18744F000,  v23,  OS_LOG_TYPE_DEFAULT,  "octagon-recover-with-rk: device is locked %@",  (uint8_t *)&buf,  0xCu);
                  }

                  if (a5) {
                    *a5 = v20;
                  }

                  goto LABEL_99;
                }
              }

              else
              {
              }

              uint64_t v17 = v20;
            }

            else
            {
              uint64_t v17 = 0LL;
            }

            goto LABEL_26;
          }
        }

+ (BOOL)preflightRecoverOctagonUsingRecoveryKey:()Framework recoveryKey:error:
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  secLogObjForScope();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl( &dword_18744F000,  v9,  OS_LOG_TYPE_DEFAULT,  "Preflight using recovery key for context: %@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000LL;
  uint64_t v30 = __Block_byref_object_copy_;
  int v31 = __Block_byref_object_dispose_;
  id v32 = 0LL;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 0;
  obj[1] = 0LL;
  if ((SecPasswordValidatePasswordFormat() & 1) == 0)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x18960AFE0] code:41 description:@"malformed recovery key"];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    secLogObjForScope();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v26 = 138412290;
      id v27 = v11;
      _os_log_impl( &dword_18744F000,  v15,  OS_LOG_TYPE_DEFAULT,  "octagon-preflight-recovery-key: recovery failed validation with error:%@",  v26,  0xCu);
    }

    if (a5)
    {
      id v16 = v11;
      id v11 = v16;
LABEL_17:
      BOOL v14 = 0LL;
      *a5 = v16;
      goto LABEL_20;
    }

+ (id)totalTrustedPeers:()Framework error:
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  secLogObjForScope();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    [v5 context];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl( &dword_18744F000,  v6,  OS_LOG_TYPE_DEFAULT,  "totalTrustedPeers invoked for context: %@",  (uint8_t *)&buf,  0xCu);
  }

  id v24 = 0LL;
  [v5 makeOTControl:&v24];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v24;
  if (v8)
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v28 = 0x3032000000LL;
    uint64_t v29 = __Block_byref_object_copy_;
    uint64_t v30 = __Block_byref_object_dispose_;
    id v31 = 0LL;
    uint64_t v18 = 0LL;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000LL;
    id v21 = __Block_byref_object_copy_;
    uint64_t v22 = __Block_byref_object_dispose_;
    id v23 = 0LL;
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x18960AFA0]) initWithConfiguration:v5];
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __47__OTClique_Framework__totalTrustedPeers_error___block_invoke;
    v17[3] = &unk_18A04F370;
    v17[4] = &buf;
    v17[5] = &v18;
    [v8 totalTrustedPeers:v10 reply:v17];

    id v11 = *(void **)(*((void *)&buf + 1) + 40LL);
    if (v11)
    {
      id v12 = 0LL;
      if (a4) {
        *a4 = v11;
      }
    }

    else
    {
      secLogObjForScope();
      BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = v19[5];
        *(_DWORD *)char v25 = 138412290;
        uint64_t v26 = v15;
        _os_log_impl(&dword_18744F000, v14, OS_LOG_TYPE_DEFAULT, "Number of trusted Octagon peers: %@", v25, 0xCu);
      }

      id v12 = (id)v19[5];
    }

    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&buf, 8);
  }

  else
  {
    secLogObjForScope();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl( &dword_18744F000,  v13,  OS_LOG_TYPE_DEFAULT,  "failed to fetch OTControl object: %@",  (uint8_t *)&buf,  0xCu);
    }

    id v12 = 0LL;
    if (a4) {
      *a4 = v9;
    }
  }

  return v12;
}

+ (BOOL)areRecoveryKeysDistrusted:()Framework error:
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  secLogObjForScope();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    [v5 context];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl( &dword_18744F000,  v6,  OS_LOG_TYPE_DEFAULT,  "areRecoveryKeysDistrusted invoked for context: %@",  (uint8_t *)&buf,  0xCu);
  }

  id v22 = 0LL;
  [v5 makeOTControl:&v22];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v22;
  if (v8)
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v26 = 0x3032000000LL;
    id v27 = __Block_byref_object_copy_;
    uint64_t v28 = __Block_byref_object_dispose_;
    id v29 = 0LL;
    uint64_t v18 = 0LL;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2020000000LL;
    char v21 = 0;
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x18960AFA0]) initWithConfiguration:v5];
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __55__OTClique_Framework__areRecoveryKeysDistrusted_error___block_invoke;
    v17[3] = &unk_18A04F2F8;
    v17[4] = &buf;
    v17[5] = &v18;
    [v8 areRecoveryKeysDistrusted:v10 reply:v17];

    id v11 = *(void **)(*((void *)&buf + 1) + 40LL);
    if (v11)
    {
      BOOL v12 = 0LL;
      if (a4) {
        *a4 = v11;
      }
    }

    else
    {
      secLogObjForScope();
      BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        if (*((_BYTE *)v19 + 24)) {
          uint64_t v15 = @"contains";
        }
        else {
          uint64_t v15 = @"does not contain";
        }
        *(_DWORD *)id v23 = 138412290;
        id v24 = v15;
        _os_log_impl( &dword_18744F000,  v14,  OS_LOG_TYPE_DEFAULT,  "Octagon circle %@ distrusted recovery keys",  v23,  0xCu);
      }

      BOOL v12 = *((_BYTE *)v19 + 24) != 0;
    }

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    secLogObjForScope();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl( &dword_18744F000,  v13,  OS_LOG_TYPE_DEFAULT,  "failed to fetch OTControl object: %@",  (uint8_t *)&buf,  0xCu);
    }

    BOOL v12 = 0LL;
    if (a4) {
      *a4 = v9;
    }
  }

  return v12;
}

@end