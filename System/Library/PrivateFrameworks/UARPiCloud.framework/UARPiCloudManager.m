@interface UARPiCloudManager
- (BOOL)fetchVerificationCertificateInContainer:(id)a3;
- (BOOL)handleRemoteFetchRequestForCHIPAccessoriesMetadata:(id)a3 batchRequest:(BOOL)a4;
- (BOOL)handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:(id *)a3 productGroup:(id)a4 batchRequest:(BOOL)a5;
- (BOOL)processCHIPAccessoriesRecord:(id)a3;
- (BOOL)processCHIPAttestationCertificateRecord:(id)a3 subjectKeyIdentifier:(id)a4;
- (BOOL)validateCHIPFirmwareRecord:(id)a3 inContainer:(id)a4 forAccessory:(id)a5;
- (BOOL)validateSignatureForUARPAccessoryRecord:(id)a3 inContainer:(id)a4;
- (OS_os_log)log;
- (UARPiCloudContainer)container;
- (UARPiCloudManager)initWithDelegate:(id)a3 containerID:(id)a4;
- (UARPiCloudManagerDelegate)delegate;
- (__SecKey)copyPublicKeyForVerificationCertificateData:(id)a3 policy:(__SecPolicy *)a4;
- (__SecKey)copyPublicKeyFromCertificateID:(id)a3;
- (id)calculateDigestFromCHIPAccessoryCKRecord:(id)a3;
- (id)calculateDigestFromCHIPAttestationCertificateRecord:(id)a3;
- (id)calculateDigestFromUARPAccessoryRecord:(id)a3;
- (id)filterInterestedZonesInContainer:(id)a3 forAccessories:(id)a4;
- (int64_t)fetchRemoteDatabaseChangesInContainer:(id)a3 completion:(id)a4;
- (void)fetchZoneChangesInContainer:(id)a3 forAccessories:(id)a4;
- (void)handleRemoteFetchRequestForCHIPAttestationCertificates:(id)a3;
- (void)handleRemoteFetchRequestSyncForCHIPAttestationCertificates:(id *)a3 subjectKeyIdentifier:(id)a4;
- (void)performRemoteFetchForAccessories:(id)a3;
- (void)performRemoteFetchForAttestationCertificates:(id)a3;
- (void)performRemoteFetchForCHIPVerificationCertificateSync;
- (void)performRemoteFetchForSupportedAccessoriesMetadata:(id)a3 batchRequest:(BOOL)a4;
- (void)performRemoteFetchForSupportedAccessoriesMetadataInZone:(id)a3;
- (void)processCHIPAccessoriesRecords:(id)a3 isComplete:(BOOL)a4 productGroup:(id)a5;
- (void)processCHIPAttestationCertificateRecords:(id)a3 subjectKeyIdentifier:(id)a4;
- (void)processCHIPFirmwareRecord:(id)a3 inContainer:(id)a4 forAccessory:(id)a5;
- (void)processCKRecord:(id)a3 inContainer:(id)a4 forAccessory:(id)a5;
- (void)processRecordsInContainer:(id)a3 forAccessory:(id)a4;
- (void)processUpdatedRecordsInContainer:(id)a3 forAccessories:(id)a4;
- (void)processVerificationCertificateRecord:(id)a3 forContainer:(id)a4;
- (void)qHandleRemoteFetchRequestForAccessories:(id)a3;
@end

@implementation UARPiCloudManager

- (BOOL)handleRemoteFetchRequestForCHIPAccessoriesMetadata:(id)a3 batchRequest:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)MEMORY[0x1895CCAB4]();
  v8 = -[UARPiCloudManager container](self, "container");
  [v8 verificationCertificates];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    || (-[UARPiCloudManager performRemoteFetchForCHIPVerificationCertificateSync]( self,  "performRemoteFetchForCHIPVerificationCertificateSync"),  -[UARPiCloudManager container](self, "container"),  v10 = (void *)objc_claimAutoreleasedReturnValue(),  [v10 verificationCertificates],  v11 = (void *)objc_claimAutoreleasedReturnValue(),  v11,  v10,  v11))
  {
    id v15 = 0LL;
    BOOL v12 = -[UARPiCloudManager handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:productGroup:batchRequest:]( self,  "handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:productGroup:batchRequest:",  &v15,  v6,  v4);
    id v13 = v15;
    -[UARPiCloudManager processCHIPAccessoriesRecords:isComplete:productGroup:]( self,  "processCHIPAccessoriesRecords:isComplete:productGroup:",  v13,  v12,  v6);
  }

  else
  {
    LOBYTE(v12) = 1;
    -[UARPiCloudManager processCHIPAccessoriesRecords:isComplete:productGroup:]( self,  "processCHIPAccessoriesRecords:isComplete:productGroup:",  0LL,  1LL,  v6);
  }

  objc_autoreleasePoolPop(v7);

  return v12;
}

- (BOOL)handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:(id *)a3 productGroup:(id)a4 batchRequest:(BOOL)a5
{
  BOOL v5 = a5;
  v47[1] = *MEMORY[0x1895F89C0];
  id v7 = a4;
  uint64_t v38 = 0LL;
  v39 = &v38;
  uint64_t v40 = 0x2020000000LL;
  char v41 = 1;
  -[UARPiCloudManager log](self, "log");
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[UARPiCloudManager container](self, "container");
    [v9 containerID];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl( &dword_1887DD000,  v8,  OS_LOG_TYPE_DEFAULT,  "Fetching CHIPAccessories Record for Container:%@",  (uint8_t *)&buf,  0xCu);
  }

  id v11 = objc_alloc(MEMORY[0x189602198]);
  BOOL v12 = (void *)[v11 initWithZoneName:@"chipAccessories" ownerName:*MEMORY[0x189602150]];
  id v13 = objc_alloc(MEMORY[0x189602178]);
  v47[0] = v12;
  [MEMORY[0x189603F18] arrayWithObjects:v47 count:1];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = (void *)[v13 initWithRecordZoneIDs:v14 configurationsByRecordZoneID:0];

  [v15 setFetchAllChanges:!v5];
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v43 = 0x3032000000LL;
  v44 = __Block_byref_object_copy_;
  v45 = __Block_byref_object_dispose_;
  id v46 = 0LL;
  if (v5)
  {
    [MEMORY[0x189603FC8] dictionary];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v17 = objc_alloc_init(MEMORY[0x189602170]);
    v18 = -[UARPiCloudManager container](self, "container");
    [v18 databaseChangeToken];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 setPreviousServerChangeToken:v19];

    [v16 setObject:v17 forKey:v12];
    [v15 setConfigurationsByRecordZoneID:v16];
  }

  uint64_t v20 = MEMORY[0x1895F87A8];
  v35[0] = MEMORY[0x1895F87A8];
  v35[1] = 3221225472LL;
  v35[2] = __108__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata_productGroup_batchRequest___block_invoke;
  v35[3] = &unk_18A28BAD0;
  v35[4] = self;
  id v21 = v7;
  id v36 = v21;
  p___int128 buf = &buf;
  [v15 setRecordChangedBlock:v35];
  v33[0] = v20;
  v33[1] = 3221225472LL;
  v33[2] = __108__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata_productGroup_batchRequest___block_invoke_12;
  v33[3] = &unk_18A28BAF8;
  BOOL v34 = v5;
  v33[4] = self;
  v33[5] = &v38;
  [v15 setRecordZoneFetchCompletionBlock:v33];
  v31[0] = v20;
  v31[1] = 3221225472LL;
  v31[2] = __108__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata_productGroup_batchRequest___block_invoke_16;
  v31[3] = &unk_18A28BB20;
  v31[4] = self;
  v22 = dispatch_semaphore_create(0LL);
  v32 = v22;
  [v15 setFetchRecordZoneChangesCompletionBlock:v31];
  v23 = -[UARPiCloudManager container](self, "container");
  [v23 database];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 addOperation:v15];

  dispatch_time_t v25 = dispatch_time(0LL, 300000000000LL);
  if (dispatch_semaphore_wait(v22, v25))
  {
    -[UARPiCloudManager log](self, "log");
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:productGroup:batchRequest:].cold.1();
    }

    *a3 = 0LL;
    v27 = -[UARPiCloudManager container](self, "container");
    [v27 setDatabaseChangeToken:0];

    [v15 cancel];
    BOOL v28 = 1;
  }

  else
  {
    *a3 = *(id *)(*((void *)&buf + 1) + 40LL);
    BOOL v28 = *((_BYTE *)v39 + 24) != 0;
  }

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v38, 8);

  return v28;
}

void __108__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata_productGroup_batchRequest___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [*(id *)(a1 + 32) log];
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315394;
    uint64_t v20 = "-[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:productGroup:batchRequest:]_block_invoke";
    __int16 v21 = 2112;
    id v22 = v3;
    _os_log_impl(&dword_1887DD000, v4, OS_LOG_TYPE_DEFAULT, "%s: Record Changed: %@", (uint8_t *)&v19, 0x16u);
  }

  [v3 recordType];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = [v5 isEqualToString:@"CHIPAccessory"];

  if ((v6 & 1) != 0)
  {
    [v3 recordID];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 recordName];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 componentsSeparatedByString:@"-"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 firstObject];
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    id v11 = *(void **)(a1 + 40);
    if (!v11 || [v11 isEqualToString:v10])
    {
      if ([*(id *)(a1 + 32) processCHIPAccessoriesRecord:v3])
      {
        BOOL v12 = -[CHIPAccessoriesRecord initWithCKRecord:]( objc_alloc(&OBJC_CLASS___CHIPAccessoriesRecord),  "initWithCKRecord:",  v3);
        if (v12)
        {
          id v13 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
          if (!v13)
          {
            id v14 = objc_alloc_init(MEMORY[0x189603FE0]);
            uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8LL);
            v16 = *(void **)(v15 + 40);
            *(void *)(v15 + 40) = v14;

            id v13 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
          }

          [v13 addObject:v12];
        }
      }

      else
      {
        [*(id *)(a1 + 32) log];
        BOOL v12 = (CHIPAccessoriesRecord *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
        {
          [v3 recordID];
          id v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v17 recordName];
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          int v19 = 136315394;
          uint64_t v20 = "-[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:productGroup:batchReque"
                "st:]_block_invoke";
          __int16 v21 = 2112;
          id v22 = v18;
          _os_log_impl( &dword_1887DD000,  (os_log_t)v12,  OS_LOG_TYPE_DEFAULT,  "%s: Invalid CHIPAccessoryRecord: %@",  (uint8_t *)&v19,  0x16u);
        }
      }
    }
  }

  else
  {
    [*(id *)(a1 + 32) log];
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315394;
      uint64_t v20 = "-[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:productGroup:batchRequest:]_block_invoke";
      __int16 v21 = 2112;
      id v22 = v3;
      _os_log_impl(&dword_1887DD000, v10, OS_LOG_TYPE_DEFAULT, "%s: Invalid Record type: %@", (uint8_t *)&v19, 0x16u);
    }
  }
}

void __108__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata_productGroup_batchRequest___block_invoke_12( uint64_t a1,  void *a2,  void *a3,  uint64_t a4,  int a5,  void *a6)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v10 = a2;
  id v11 = a3;
  id v12 = a6;
  [*(id *)(a1 + 32) log];
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = "NO";
    int v17 = 136316162;
    v18 = "-[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:productGroup:batchRequest:]_block_invoke";
    if (a5) {
      id v14 = "YES";
    }
    __int16 v19 = 2112;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v12;
    __int16 v25 = 2080;
    v26 = v14;
    _os_log_impl( &dword_1887DD000,  v13,  OS_LOG_TYPE_INFO,  "%s: Record Zone Fetch completed for recordZoneID: %@ changeToken:%@ error: %@ moreComing %s",  (uint8_t *)&v17,  0x34u);
  }

  if (*(_BYTE *)(a1 + 48))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a5 ^ 1;
    if (((a5 ^ 1) & 1) != 0)
    {
      [*(id *)(a1 + 32) container];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 setDatabaseChangeToken:0];
    }

    else
    {
      uint64_t v15 = (void *)[v11 copy];
      [*(id *)(a1 + 32) container];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 setDatabaseChangeToken:v15];
    }
  }
}

void __108__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata_productGroup_batchRequest___block_invoke_16( uint64_t a1,  void *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [*(id *)(a1 + 32) log];
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    char v6 = "-[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:productGroup:batchRequest:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl( &dword_1887DD000,  v4,  OS_LOG_TYPE_INFO,  "%s: Record Zone Fetch completed with error: %@",  (uint8_t *)&v5,  0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)handleRemoteFetchRequestForCHIPAttestationCertificates:(id)a3
{
  id v4 = a3;
  -[UARPiCloudManager container](self, "container");
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 verificationCertificates];
  char v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (-[UARPiCloudManager performRemoteFetchForCHIPVerificationCertificateSync]( self,  "performRemoteFetchForCHIPVerificationCertificateSync"),  -[UARPiCloudManager container](self, "container"),  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue(),  [v7 verificationCertificates],  v8 = (void *)objc_claimAutoreleasedReturnValue(),  v8,  v7,  v8))
  {
    id v10 = 0LL;
    -[UARPiCloudManager handleRemoteFetchRequestSyncForCHIPAttestationCertificates:subjectKeyIdentifier:]( self,  "handleRemoteFetchRequestSyncForCHIPAttestationCertificates:subjectKeyIdentifier:",  &v10,  v4);
    id v9 = v10;
    -[UARPiCloudManager processCHIPAttestationCertificateRecords:subjectKeyIdentifier:]( self,  "processCHIPAttestationCertificateRecords:subjectKeyIdentifier:",  v9,  v4);
  }

  else
  {
    -[UARPiCloudManager processCHIPAttestationCertificateRecords:subjectKeyIdentifier:]( self,  "processCHIPAttestationCertificateRecords:subjectKeyIdentifier:",  0LL,  v4);
  }
}

- (void)handleRemoteFetchRequestSyncForCHIPAttestationCertificates:(id *)a3 subjectKeyIdentifier:(id)a4
{
  v32[1] = *MEMORY[0x1895F89C0];
  id v6 = a4;
  -[UARPiCloudManager log](self, "log");
  __int16 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[UARPiCloudManager container](self, "container");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 containerID];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl( &dword_1887DD000,  v7,  OS_LOG_TYPE_DEFAULT,  "Fetching CHIPAttestationCertificate Record for Container:%@",  (uint8_t *)&buf,  0xCu);
  }

  id v10 = objc_alloc(MEMORY[0x189602198]);
  id v11 = (void *)[v10 initWithZoneName:@"chipAttestationCertificates" ownerName:*MEMORY[0x189602150]];
  id v12 = objc_alloc(MEMORY[0x189602178]);
  v32[0] = v11;
  [MEMORY[0x189603F18] arrayWithObjects:v32 count:1];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = (void *)[v12 initWithRecordZoneIDs:v13 configurationsByRecordZoneID:0];

  [v14 setFetchAllChanges:1];
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x3032000000LL;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  uint64_t v15 = MEMORY[0x1895F87A8];
  id v31 = 0LL;
  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = __107__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAttestationCertificates_subjectKeyIdentifier___block_invoke;
  v24[3] = &unk_18A28BAD0;
  v24[4] = self;
  id v16 = v6;
  id v25 = v16;
  p___int128 buf = &buf;
  [v14 setRecordChangedBlock:v24];
  v22[0] = v15;
  v22[1] = 3221225472LL;
  v22[2] = __107__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAttestationCertificates_subjectKeyIdentifier___block_invoke_21;
  v22[3] = &unk_18A28BB20;
  v22[4] = self;
  int v17 = dispatch_semaphore_create(0LL);
  __int16 v23 = v17;
  [v14 setFetchRecordZoneChangesCompletionBlock:v22];
  v18 = -[UARPiCloudManager container](self, "container");
  [v18 database];
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 addOperation:v14];

  dispatch_time_t v20 = dispatch_time(0LL, 300000000000LL);
  if (dispatch_semaphore_wait(v17, v20))
  {
    -[UARPiCloudManager log](self, "log");
    __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAttestationCertificates:subjectKeyIdentifier:].cold.1();
    }

    *a3 = 0LL;
    [v14 cancel];
  }

  else
  {
    *a3 = *(id *)(*((void *)&buf + 1) + 40LL);
  }

  _Block_object_dispose(&buf, 8);
}

void __107__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAttestationCertificates_subjectKeyIdentifier___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [*(id *)(a1 + 32) log];
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    uint64_t v15 = "-[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAttestationCertificates:subjectKeyIdentifier:]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_impl(&dword_1887DD000, v4, OS_LOG_TYPE_DEFAULT, "%s: Record Changed :%@", (uint8_t *)&v14, 0x16u);
  }

  int v5 = *(void **)(a1 + 40);
  if (!v5
    || ([v3 recordID],
        id v6 = (void *)objc_claimAutoreleasedReturnValue(),
        [v6 recordName],
        __int16 v7 = (void *)objc_claimAutoreleasedReturnValue(),
        int v8 = [v5 isEqualToString:v7],
        v7,
        v6,
        v8))
  {
    id v9 = -[CHIPAttestationCertificateRecord initWithCKRecord:]( objc_alloc(&OBJC_CLASS___CHIPAttestationCertificateRecord),  "initWithCKRecord:",  v3);
    if (v9)
    {
      id v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      if (!v10)
      {
        id v11 = objc_alloc_init(MEMORY[0x189603FE0]);
        uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8LL);
        id v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;

        id v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      }

      [v10 addObject:v9];
    }
  }
}

void __107__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAttestationCertificates_subjectKeyIdentifier___block_invoke_21( uint64_t a1,  void *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [*(id *)(a1 + 32) log];
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAttestationCertificates:subjectKeyIdentifier:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl( &dword_1887DD000,  v4,  OS_LOG_TYPE_INFO,  "%s: Record Zone Fetch completed with error: %@",  (uint8_t *)&v5,  0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)performRemoteFetchForCHIPVerificationCertificateSync
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  -[UARPiCloudManager log](self, "log");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[UARPiCloudManager container](self, "container");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 containerID];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v28 = v5;
    _os_log_impl( &dword_1887DD000,  v3,  OS_LOG_TYPE_DEFAULT,  "Fetching CHIPVerificationCertificate Record for Container:%@",  buf,  0xCu);
  }

  id v6 = objc_alloc(MEMORY[0x189602198]);
  __int16 v7 = (void *)[v6 initWithZoneName:@"certificates" ownerName:*MEMORY[0x189602150]];
  id v8 = (void *)[objc_alloc(MEMORY[0x189602190]) initWithRecordName:@"certificates" zoneID:v7];
  id v9 = objc_alloc(MEMORY[0x189602180]);
  v26 = v8;
  [MEMORY[0x189603F18] arrayWithObjects:&v26 count:1];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = (void *)[v9 initWithRecordIDs:v10];

  dispatch_semaphore_t v12 = dispatch_semaphore_create(0LL);
  uint64_t v19 = MEMORY[0x1895F87A8];
  uint64_t v20 = 3221225472LL;
  __int16 v21 = __79__UARPiCloudManager_CHIP__performRemoteFetchForCHIPVerificationCertificateSync__block_invoke;
  id v22 = &unk_18A28BB48;
  __int16 v23 = self;
  id v13 = v8;
  id v24 = v13;
  int v14 = v12;
  id v25 = v14;
  [v11 setFetchRecordsCompletionBlock:&v19];
  -[UARPiCloudManager container](self, "container", v19, v20, v21, v22, v23);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 database];
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 addOperation:v11];

  dispatch_time_t v17 = dispatch_time(0LL, 300000000000LL);
  if (dispatch_semaphore_wait(v14, v17))
  {
    -[UARPiCloudManager log](self, "log");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudManager(CHIP) performRemoteFetchForCHIPVerificationCertificateSync].cold.1();
    }

    [v11 cancel];
  }
}

void __79__UARPiCloudManager_CHIP__performRemoteFetchForCHIPVerificationCertificateSync__block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) log];
  __int16 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    id v11 = "-[UARPiCloudManager(CHIP) performRemoteFetchForCHIPVerificationCertificateSync]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl( &dword_1887DD000,  v7,  OS_LOG_TYPE_INFO,  "%s: operationError = %@, recordsByRecordID: %@",  (uint8_t *)&v10,  0x20u);
  }

  if (v5 && !v6)
  {
    [v5 objectForKey:*(void *)(a1 + 40)];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) container];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 processVerificationCertificateRecord:v8];
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)processCHIPAccessoriesRecords:(id)a3 isComplete:(BOOL)a4 productGroup:(id)a5
{
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v10 = objc_alloc_init(MEMORY[0x189603FE0]);
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        uint64_t v15 = 0LL;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v15), "accessoryMetadata", (void)v19);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v10 addObject:v16];

          ++v15;
        }

        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v13);
    }

    -[UARPiCloudManager delegate](self, "delegate");
    dispatch_time_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 remoteFetchCompletionForSupportedAccessories:v10 productGroup:v9 isComplete:v6 error:0];
  }

  else if (v6)
  {
    -[UARPiCloudManager delegate](self, "delegate");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 remoteFetchCompletionForSupportedAccessories:0 productGroup:v9 isComplete:1 error:0];
  }
}

- (BOOL)processCHIPAccessoriesRecord:(id)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[UARPiCloudManager calculateDigestFromCHIPAccessoryCKRecord:](self, "calculateDigestFromCHIPAccessoryCKRecord:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 length];
  -[UARPiCloudManager log](self, "log");
  __int16 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v27 = v5;
      _os_log_impl(&dword_1887DD000, v8, OS_LOG_TYPE_INFO, "CHIPAccessory record digest: %@", buf, 0xCu);
    }

    [v4 objectForKey:@"signatureV2"];
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (v8
      && (uint64_t v9 = [objc_alloc(MEMORY[0x189603F48]) initWithBase64EncodedString:v8 options:0]) != 0)
    {
      id v10 = (const __CFData *)v9;
      [v4 objectForKey:@"verificationCertificateKey"];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11
        && (uint64_t v12 = -[UARPiCloudManager copyPublicKeyFromCertificateID:](self, "copyPublicKeyFromCertificateID:", v11)) != 0LL)
      {
        uint64_t v13 = v12;
        -[UARPiCloudManager log](self, "log");
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          [v4 recordID];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 recordName];
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)__int128 buf = 138412290;
          uint64_t v27 = v16;
          _os_log_impl(&dword_1887DD000, v14, OS_LOG_TYPE_DEFAULT, "Validating signature on Record %@", buf, 0xCu);
        }

        CFErrorRef error = 0LL;
        int v17 = SecKeyVerifySignature(v13, (SecKeyAlgorithm)*MEMORY[0x18960BC40], (CFDataRef)v5, v10, &error);
        BOOL v18 = v17 != 0;
        CFRelease(v13);
        -[UARPiCloudManager log](self, "log");
        __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        __int128 v20 = v19;
        if (v17)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            [v4 recordID];
            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
            [v21 recordName];
            __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)__int128 buf = 138412290;
            uint64_t v27 = v22;
            _os_log_impl( &dword_1887DD000,  v20,  OS_LOG_TYPE_DEFAULT,  "Stonehenge Signature validation successful for CHIPAccessoryRecord %@",  buf,  0xCu);
          }
        }

        else
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            -[UARPiCloudManager(CHIP) processCHIPAccessoriesRecord:].cold.4(v4, (uint64_t)&error, v20);
          }

          CFRelease(error);
        }
      }

      else
      {
        -[UARPiCloudManager log](self, "log");
        __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[UARPiCloudManager(CHIP) processCHIPAccessoriesRecord:].cold.3(v4);
        }

        BOOL v18 = 0;
      }
    }

    else
    {
      -[UARPiCloudManager log](self, "log");
      id v10 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[UARPiCloudManager(CHIP) processCHIPAccessoriesRecord:].cold.2(v4);
      }
      BOOL v18 = 0;
    }
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudManager(CHIP) processCHIPAccessoriesRecord:].cold.1(v4);
    }
    BOOL v18 = 0;
  }

  return v18;
}

- (void)processCHIPAttestationCertificateRecords:(id)a3 subjectKeyIdentifier:(id)a4
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = objc_alloc_init(MEMORY[0x189603FE0]);
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    id v35 = v6;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v42;
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v42 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          if (v7)
          {
            [*(id *)(*((void *)&v41 + 1) + 8 * i) recordName];
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
            int v16 = [v7 isEqualToString:v15];

            if (!v16) {
              continue;
            }
          }

          if (-[UARPiCloudManager processCHIPAttestationCertificateRecord:subjectKeyIdentifier:]( self,  "processCHIPAttestationCertificateRecord:subjectKeyIdentifier:",  v14,  v7))
          {
            [v8 addObject:v14];
          }
        }

        uint64_t v11 = [v9 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }

      while (v11);
    }

    BOOL v34 = self;

    id v17 = objc_alloc_init(MEMORY[0x189603FC8]);
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    obuint64_t j = v8;
    uint64_t v18 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v38;
      do
      {
        for (uint64_t j = 0LL; j != v19; ++j)
        {
          if (*(void *)v38 != v20) {
            objc_enumerationMutation(obj);
          }
          __int128 v22 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          [v22 rootCertificate];
          __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v24 = (void *)[v23 mutableCopy];

          uint64_t v25 = [v22 intermediateCertificates];
          if (v25)
          {
            v26 = (void *)v25;
            [v22 intermediateCertificates];
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v28 = [v27 length];

            if (v28)
            {
              [v22 intermediateCertificates];
              uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
              [v24 appendFormat:@",%@", v29];
            }
          }

          [NSString stringWithString:v24];
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          [v22 recordName];
          id v31 = (void *)objc_claimAutoreleasedReturnValue();
          [v17 setObject:v30 forKeyedSubscript:v31];
        }

        uint64_t v19 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
      }

      while (v19);
    }
    v32 = -[UARPiCloudManager delegate](v34, "delegate");
    [v32 remoteFetchCompletionForAttestationCertificates:v17 subjectKeyIdentifier:v7 error:0];

    id v6 = v35;
  }

  else
  {
    v33 = -[UARPiCloudManager delegate](self, "delegate");
    [v33 remoteFetchCompletionForAttestationCertificates:0 subjectKeyIdentifier:v7 error:0];
  }
}

- (BOOL)processCHIPAttestationCertificateRecord:(id)a3 subjectKeyIdentifier:(id)a4
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  [v5 verificationCertificateID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = -[UARPiCloudManager copyPublicKeyFromCertificateID:](self, "copyPublicKeyFromCertificateID:", v6);

  -[UARPiCloudManager calculateDigestFromCHIPAttestationCertificateRecord:]( self,  "calculateDigestFromCHIPAttestationCertificateRecord:",  v5);
  id v8 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  id v9 = objc_alloc(MEMORY[0x189603F48]);
  [v5 signature];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (const __CFData *)[v9 initWithBase64EncodedString:v10 options:0];

  if (v7)
  {
    BOOL v12 = 0;
    if (-[__CFData length](v8, "length") && v11)
    {
      -[UARPiCloudManager log](self, "log");
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        [v5 ckRecord];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 recordID];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 recordName];
        int v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v24 = v16;
        _os_log_impl(&dword_1887DD000, v13, OS_LOG_TYPE_DEFAULT, "Validating signature on Record %@", buf, 0xCu);
      }

      CFErrorRef error = 0LL;
      int v17 = SecKeyVerifySignature(v7, (SecKeyAlgorithm)*MEMORY[0x18960BC40], v8, v11, &error);
      BOOL v12 = v17 != 0;
      CFRelease(v7);
      -[UARPiCloudManager log](self, "log");
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = v18;
      if (v17)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          [v5 ckRecord];
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)__int128 buf = 138412290;
          uint64_t v24 = v20;
          _os_log_impl( &dword_1887DD000,  v19,  OS_LOG_TYPE_DEFAULT,  "Signature validation successful CHIPAttestationCertificateRecord %@",  buf,  0xCu);
        }
      }

      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[UARPiCloudManager(CHIP) processCHIPAttestationCertificateRecord:subjectKeyIdentifier:].cold.1( v5,  (uint64_t)&error,  v19);
        }

        CFRelease(error);
      }
    }
  }

  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)calculateDigestFromCHIPAccessoryCKRecord:(id)a3
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  CC_SHA256_Init(&c);
  [v3 recordID];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 recordName];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 componentsSeparatedByString:@"-"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v6 count] == 2)
  {
    uint64_t v28 = v6;
    [v6 lastObject];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 allKeys];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v11)
    {
      unint64_t v12 = v11;
      uint64_t v13 = 0LL;
      uint64_t v14 = *(void *)v33;
      uint64_t v15 = *MEMORY[0x18960E7D0];
      int v16 = @"verificationCertificateKey";
      v30 = v7;
      uint64_t v17 = *(void *)v33;
      id v29 = v3;
      while (1)
      {
        if (v17 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v18 = *(void **)(*((void *)&v32 + 1) + 8 * v13);
        if ([v18 isEqualToString:@"accessoryCategoryNumber"])
        {
          if (([v7 isEqualToString:v15] & 1) == 0) {
            break;
          }
        }

        if (([v18 isEqualToString:v16] & 1) == 0
          && ([v18 isEqualToString:@"signature"] & 1) == 0
          && ([v18 isEqualToString:@"signatureV2"] & 1) == 0
          && ([v18 isEqualToString:@"accessoryProductLabel"] & 1) == 0)
        {
          [v3 objectForKey:v18];
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          id v20 = [v19 dataUsingEncoding:4];
          __int128 v21 = v16;
          uint64_t v22 = [v20 bytes];
          CC_LONG v23 = [v20 length];
          uint64_t v24 = (const void *)v22;
          int v16 = v21;
          CC_SHA256_Update(&c, v24, v23);

          id v3 = v29;
          id v7 = v30;
LABEL_14:
        }

        if (++v13 >= v12)
        {
          uint64_t v25 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
          if (!v25) {
            goto LABEL_20;
          }
          unint64_t v12 = v25;
          uint64_t v13 = 0LL;
        }

        uint64_t v17 = *(void *)v33;
      }

      [v3 objectForKey:@"accessoryCategoryNumber"];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t data = bswap64([v19 unsignedLongLongValue]);
      CC_SHA256_Update(&c, &data, 8u);
      goto LABEL_14;
    }

- (id)calculateDigestFromCHIPAttestationCertificateRecord:(id)a3
{
  id v3 = a3;
  CC_SHA256_Init(&c);
  [v3 rootCertificate];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 dataUsingEncoding:4];
  CC_SHA256_Update(&c, (const void *)[v5 bytes], objc_msgSend(v5, "length"));
  [v3 intermediateCertificates];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (v6)
  {
    [v6 dataUsingEncoding:4];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    id v5 = v8;
    CC_SHA256_Update(&c, (const void *)[v5 bytes], objc_msgSend(v5, "length"));
  }

  [v3 recordStatus];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 dataUsingEncoding:4];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  id v11 = v10;
  CC_SHA256_Update(&c, (const void *)[v11 bytes], objc_msgSend(v11, "length"));
  id v12 = [MEMORY[0x189603FB8] dataWithLength:32];
  CC_SHA256_Final((unsigned __int8 *)[v12 mutableBytes], &c);

  return v12;
}

- (__SecKey)copyPublicKeyFromCertificateID:(id)a3
{
  id v4 = a3;
  -[UARPiCloudManager container](self, "container");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 verificationCertificates];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKey:v4];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    [v7 dataUsingEncoding:4];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t AppleCHIPUpdateSigning = SecPolicyCreateAppleCHIPUpdateSigning();
    if (AppleCHIPUpdateSigning)
    {
      id v10 = (const void *)AppleCHIPUpdateSigning;
      id v11 = -[UARPiCloudManager copyPublicKeyForVerificationCertificateData:policy:]( self,  "copyPublicKeyForVerificationCertificateData:policy:",  v8,  AppleCHIPUpdateSigning);
      CFRelease(v10);
    }

    else
    {
      id v11 = 0LL;
    }
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (void)processCHIPFirmwareRecord:(id)a3 inContainer:(id)a4 forAccessory:(id)a5
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = -[CHIPAccessoryFirmwareRecord initWithCKRecord:]( objc_alloc(&OBJC_CLASS___CHIPAccessoryFirmwareRecord),  "initWithCKRecord:",  v10);

  LODWORD(v10) = [v9 signatureValidationNeeded];
  -[UARPiCloudManager log](self, "log");
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!(_DWORD)v10)
  {
    if (v13)
    {
      -[CHIPAccessoryFirmwareRecord recordName](v11, "recordName");
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      int v17 = 136315394;
      uint64_t v18 = "-[UARPiCloudManager(CHIP) processCHIPFirmwareRecord:inContainer:forAccessory:]";
      __int16 v19 = 2112;
      id v20 = v15;
      _os_log_impl( &dword_1887DD000,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: Bypassing signature validation on Record %@",  (uint8_t *)&v17,  0x16u);
    }

    goto LABEL_9;
  }

  if (v13)
  {
    -[CHIPAccessoryFirmwareRecord recordName](v11, "recordName");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    int v17 = 136315394;
    uint64_t v18 = "-[UARPiCloudManager(CHIP) processCHIPFirmwareRecord:inContainer:forAccessory:]";
    __int16 v19 = 2112;
    id v20 = v14;
    _os_log_impl( &dword_1887DD000,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: Validating signature on Record %@",  (uint8_t *)&v17,  0x16u);
  }

  if (-[UARPiCloudManager validateCHIPFirmwareRecord:inContainer:forAccessory:]( self,  "validateCHIPFirmwareRecord:inContainer:forAccessory:",  v11,  v8,  v9))
  {
LABEL_9:
    [v9 setChipFirmwareRecord:v11];
  }

  -[UARPiCloudManager delegate](self, "delegate");
  int v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 remoteFetchCompletion:v9 error:0];
}

- (BOOL)validateCHIPFirmwareRecord:(id)a3 inContainer:(id)a4 forAccessory:(id)a5
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  [v6 verificationCertificateID];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = -[UARPiCloudManager copyPublicKeyFromCertificateID:](self, "copyPublicKeyFromCertificateID:", v7);

  if (v8)
  {
    [v6 digest];
    id v9 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    if (-[__CFData length](v9, "length"))
    {
      -[UARPiCloudManager log](self, "log");
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)cf = 138412290;
        *(void *)&cf[4] = v9;
        _os_log_impl(&dword_1887DD000, v10, OS_LOG_TYPE_INFO, "CHIPAccessoryFirmware record digest: %@", cf, 0xCu);
      }

      id v11 = objc_alloc(MEMORY[0x189603F48]);
      [v6 signature];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v13 = (const __CFData *)[v11 initWithBase64EncodedString:v12 options:0];

      if (v13)
      {
        -[UARPiCloudManager log](self, "log");
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          [v6 recordName];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)cf = 138412290;
          *(void *)&cf[4] = v15;
          _os_log_impl(&dword_1887DD000, v14, OS_LOG_TYPE_DEFAULT, "Validating signature on Record %@", cf, 0xCu);
        }

        *(void *)cf = 0LL;
        int v16 = SecKeyVerifySignature(v8, (SecKeyAlgorithm)*MEMORY[0x18960BC40], v9, v13, (CFErrorRef *)cf);
        BOOL v17 = v16 != 0;
        CFRelease(v8);
        if (!v16)
        {
          -[UARPiCloudManager log](self, "log");
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            -[UARPiCloudManager(CHIP) validateCHIPFirmwareRecord:inContainer:forAccessory:].cold.1(v6, (uint64_t)cf, v18);
          }

          CFRelease(*(CFTypeRef *)cf);
        }
      }

      else
      {
        BOOL v17 = 0;
      }
    }

    else
    {
      BOOL v17 = 0;
    }
  }

  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

  ;
}

- (UARPiCloudManager)initWithDelegate:(id)a3 containerID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___UARPiCloudManager;
  id v9 = -[UARPiCloudManager init](&v17, sel_init);
  if (!dlopen("/System/Library/Frameworks/CloudKit.framework/CloudKit", 16))
  {
    container = v9;
    id v9 = 0LL;
    goto LABEL_5;
  }

  if (v9)
  {
    os_log_t v10 = os_log_create("com.apple.accessoryupdater.uarp", "iCloudAssetManager");
    log = v9->_log;
    v9->_log = v10;

    objc_storeStrong((id *)&v9->_delegate, a3);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.UARPiCloudManager.recordProcessingQueue", 0LL);
    recordProcessingQueue = v9->_recordProcessingQueue;
    v9->_recordProcessingQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = -[UARPiCloudContainer initWithContainerID:]( objc_alloc(&OBJC_CLASS___UARPiCloudContainer),  "initWithContainerID:",  v8);
    container = v9->_container;
    v9->_container = v14;
LABEL_5:
  }

  return v9;
}

- (void)performRemoteFetchForAccessories:(id)a3
{
  id v4 = a3;
  recordProcessingQueue = self->_recordProcessingQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __54__UARPiCloudManager_performRemoteFetchForAccessories___block_invoke;
  v7[3] = &unk_18A28BC10;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)recordProcessingQueue, v7);
}

uint64_t __54__UARPiCloudManager_performRemoteFetchForAccessories___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) count];
  if (result) {
    return [*(id *)(a1 + 40) qHandleRemoteFetchRequestForAccessories:*(void *)(a1 + 32)];
  }
  return result;
}

- (void)qHandleRemoteFetchRequestForAccessories:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  p_container = &self->_container;
  if (-[UARPiCloudManager fetchVerificationCertificateInContainer:]( self,  "fetchVerificationCertificateInContainer:",  self->_container))
  {
    container = self->_container;
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __61__UARPiCloudManager_qHandleRemoteFetchRequestForAccessories___block_invoke;
    v19[3] = &unk_18A28BB20;
    v19[4] = self;
    id v20 = v4;
    -[UARPiCloudManager fetchRemoteDatabaseChangesInContainer:completion:]( self,  "fetchRemoteDatabaseChangesInContainer:completion:",  container,  v19);
  }

  else
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          -[UARPiCloudManagerDelegate remoteFetchCompletion:error:]( self->_delegate,  "remoteFetchCompletion:error:",  *(void *)(*((void *)&v21 + 1) + 8 * v11++),  0LL);
        }

        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v9);
    }

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudManager qHandleRemoteFetchRequestForAccessories:].cold.1( (uint64_t)p_container,  log,  v13,  v14,  v15,  v16,  v17,  v18);
    }
  }
}

void __61__UARPiCloudManager_qHandleRemoteFetchRequestForAccessories___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32LL);
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 16LL);
    id v6 = v4;
    [v5 updatedZones];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 136315650;
    __int128 v23 = "-[UARPiCloudManager qHandleRemoteFetchRequestForAccessories:]_block_invoke";
    __int16 v24 = 2112;
    uint64_t v25 = v7;
    __int16 v26 = 2112;
    id v27 = v3;
    _os_log_impl(&dword_1887DD000, v6, OS_LOG_TYPE_INFO, "%s: container.updatedZones: %@ error: %@", buf, 0x20u);
  }

  [*(id *)(*(void *)(a1 + 32) + 16) updatedZones];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 count];
  if (v3) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v9 == 0;
  }
  int v11 = !v10;

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v14; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        if ((v11 & 1) == 0) {
          objc_msgSend( *(id *)(*(void *)(a1 + 32) + 24),  "remoteFetchCompletion:error:",  *(void *)(*((void *)&v17 + 1) + 8 * i),  v3,  (void)v17);
        }
      }

      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v14);
  }

  if (v11) {
    [*(id *)(a1 + 32) fetchZoneChangesInContainer:*(void *)(*(void *)(a1 + 32) + 16) forAccessories:*(void *)(a1 + 40)];
  }
}

- (int64_t)fetchRemoteDatabaseChangesInContainer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x189602168]) initWithPreviousServerChangeToken:0];
  [v8 setFetchAllChanges:1];
  uint64_t v9 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __70__UARPiCloudManager_fetchRemoteDatabaseChangesInContainer_completion___block_invoke;
  v18[3] = &unk_18A28BCB0;
  v18[4] = self;
  id v10 = v6;
  id v19 = v10;
  [v8 setRecordZoneWithIDChangedBlock:v18];
  v15[0] = v9;
  v15[1] = 3221225472LL;
  v15[2] = __70__UARPiCloudManager_fetchRemoteDatabaseChangesInContainer_completion___block_invoke_186;
  v15[3] = &unk_18A28BD00;
  v15[4] = self;
  id v16 = v10;
  id v17 = v7;
  id v11 = v7;
  id v12 = v10;
  [v8 setFetchDatabaseChangesCompletionBlock:v15];
  [v12 database];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 addOperation:v8];

  return 0LL;
}

void __70__UARPiCloudManager_fetchRemoteDatabaseChangesInContainer_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = *(dispatch_queue_s **)(v4 + 8);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __70__UARPiCloudManager_fetchRemoteDatabaseChangesInContainer_completion___block_invoke_2;
  block[3] = &unk_18A28BBE8;
  block[4] = v4;
  id v9 = v3;
  id v10 = v5;
  id v7 = v3;
  dispatch_async(v6, block);
}

void __70__UARPiCloudManager_fetchRemoteDatabaseChangesInContainer_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  v2 = *(os_log_s **)(*(void *)(a1 + 32) + 32LL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v9 = 136315394;
    id v10 = "-[UARPiCloudManager fetchRemoteDatabaseChangesInContainer:completion:]_block_invoke_2";
    __int16 v11 = 2112;
    uint64_t v12 = v3;
    _os_log_impl(&dword_1887DD000, v2, OS_LOG_TYPE_INFO, "%s: Zone with ID %@ changed", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v4 = objc_alloc(&OBJC_CLASS___UARPiCloudZone);
  uint64_t v5 = *(void *)(a1 + 40);
  [*(id *)(a1 + 48) containerID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = -[UARPiCloudZone initWithZoneID:containerID:](v4, "initWithZoneID:containerID:", v5, v6);

  [*(id *)(a1 + 48) updatedZones];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 addObject:v7];
}

void __70__UARPiCloudManager_fetchRemoteDatabaseChangesInContainer_completion___block_invoke_186( uint64_t a1,  void *a2,  char a3,  void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  __int16 v11 = *(dispatch_queue_s **)(v9 + 8);
  v14[0] = MEMORY[0x1895F87A8];
  v14[2] = __70__UARPiCloudManager_fetchRemoteDatabaseChangesInContainer_completion___block_invoke_2_187;
  v14[3] = &unk_18A28BCD8;
  v14[1] = 3221225472LL;
  v14[4] = v9;
  id v15 = v7;
  char v19 = a3;
  id v16 = v8;
  id v17 = v10;
  id v18 = *(id *)(a1 + 48);
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v11, v14);
}

uint64_t __70__UARPiCloudManager_fetchRemoteDatabaseChangesInContainer_completion___block_invoke_2_187( uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  v2 = *(os_log_s **)(*(void *)(a1 + 32) + 32LL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v8 = 136315906;
    uint64_t v9 = "-[UARPiCloudManager fetchRemoteDatabaseChangesInContainer:completion:]_block_invoke_2";
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 1024;
    int v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_impl( &dword_1887DD000,  v2,  OS_LOG_TYPE_INFO,  "%s: Fetch database changes operation completed with token: %@ moreComing: %d error: %@",  (uint8_t *)&v8,  0x26u);
  }

  if (!*(void *)(a1 + 48))
  {
    id v6 = (void *)[*(id *)(a1 + 40) copy];
    [*(id *)(a1 + 56) setDatabaseChangeToken:v6];
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16LL))();
}

- (void)fetchZoneChangesInContainer:(id)a3 forAccessories:(id)a4
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x189603FC8] dictionary];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FA8] array];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  __int16 v10 = (void *)[objc_alloc(MEMORY[0x189607A20]) initWithKey:@"zoneName" ascending:1];
  [v6 updatedZones];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v11 count])
  {
    uint64_t v12 = MEMORY[0x1895F87A8];
    v30[0] = MEMORY[0x1895F87A8];
    v30[1] = 3221225472LL;
    v30[2] = __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke;
    v30[3] = &unk_18A28BD28;
    id v13 = v6;
    id v31 = v13;
    id v32 = v8;
    __int128 v22 = v8;
    id v14 = v9;
    id v33 = v14;
    [v11 enumerateObjectsUsingBlock:v30];
    __int128 v34 = v10;
    [MEMORY[0x189603F18] arrayWithObjects:&v34 count:1];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 sortedArrayUsingDescriptors:v15];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

    id v17 = (void *)[objc_alloc(MEMORY[0x189602178]) initWithRecordZoneIDs:v16 configurationsByRecordZoneID:0];
    [v17 setFetchAllChanges:1];
    v28[0] = v12;
    v28[1] = 3221225472LL;
    v28[2] = __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_2;
    v28[3] = &unk_18A28BD50;
    v28[4] = self;
    id v18 = v13;
    id v29 = v18;
    [v17 setRecordChangedBlock:v28];
    v26[0] = v12;
    v26[1] = 3221225472LL;
    v26[2] = __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_201;
    v26[3] = &unk_18A28BDC8;
    v26[4] = self;
    id v27 = v11;
    [v17 setRecordZoneFetchCompletionBlock:v26];
    v23[0] = v12;
    v23[1] = 3221225472LL;
    v23[2] = __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_2_205;
    v23[3] = &unk_18A28BE18;
    v23[4] = self;
    id v19 = v18;
    id v24 = v19;
    id v25 = v7;
    [v17 setFetchRecordZoneChangesCompletionBlock:v23];
    [v19 database];
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 addOperation:v17];

    int v8 = v22;
  }

  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      id v36 = "-[UARPiCloudManager fetchZoneChangesInContainer:forAccessories:]";
      __int16 v37 = 2112;
      id v38 = v7;
      _os_log_impl(&dword_1887DD000, log, OS_LOG_TYPE_INFO, "%s: No updates available for accessories %@", buf, 0x16u);
    }
  }
}

void __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = objc_alloc_init(MEMORY[0x189602170]);
  [*(id *)(a1 + 32) containerID];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 containsString:@"com.apple.chip"];

  if (v5)
  {
    [v3 setPreviousServerChangeToken:0];
  }

  else
  {
    [v11 changeToken];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setPreviousServerChangeToken:v6];
  }

  id v7 = *(void **)(a1 + 40);
  [v11 zoneID];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v3 forKey:v8];

  uint64_t v9 = *(void **)(a1 + 48);
  [v11 zoneID];
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 addObject:v10];
}

void __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_2( uint64_t a1,  void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(void **)(a1 + 40);
  id v6 = *(dispatch_queue_s **)(v4 + 8);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_3;
  block[3] = &unk_18A28BBE8;
  block[4] = v4;
  id v9 = v3;
  id v10 = v5;
  id v7 = v3;
  dispatch_async(v6, block);
}

void __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v2 = *(os_log_s **)(*(void *)(a1 + 32) + 32LL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = 136315394;
    id v6 = "-[UARPiCloudManager fetchZoneChangesInContainer:forAccessories:]_block_invoke_3";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1887DD000, v2, OS_LOG_TYPE_INFO, "%s: Record changed: %@", (uint8_t *)&v5, 0x16u);
  }

  [*(id *)(a1 + 48) updatedRecords];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 addObject:*(void *)(a1 + 40)];
}

void __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_201( uint64_t a1,  void *a2,  void *a3,  uint64_t a4,  uint64_t a5,  void *a6)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(a1 + 40);
  id v14 = *(dispatch_queue_s **)(v12 + 8);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_2_202;
  block[3] = &unk_18A28BDA0;
  block[4] = v12;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v22 = v13;
  id v15 = v11;
  id v16 = v10;
  id v17 = v9;
  dispatch_async(v14, block);
}

void __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_2_202(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v2 = *(os_log_s **)(*(void *)(a1 + 32) + 32LL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    *(_DWORD *)__int128 buf = 136315906;
    id v11 = "-[UARPiCloudManager fetchZoneChangesInContainer:forAccessories:]_block_invoke_2";
    __int16 v12 = 2112;
    uint64_t v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    _os_log_impl( &dword_1887DD000,  v2,  OS_LOG_TYPE_INFO,  "%s: Record Zone Fetch completed for recordZoneID: %@ changeToken:%@ error: %@",  buf,  0x2Au);
  }

  id v6 = *(void **)(a1 + 64);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_203;
  v7[3] = &unk_18A28BD78;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  [v6 enumerateObjectsUsingBlock:v7];
}

void __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_203( uint64_t a1,  void *a2,  _BYTE *a3)
{
  id v10 = a2;
  [v10 zoneID];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 zoneName];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) zoneName];
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    id v9 = (void *)[*(id *)(a1 + 40) copy];
    [v10 setChangeToken:v9];

    *a3 = 1;
  }
}

void __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_2_205( uint64_t a1,  void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1895F87A8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = *(dispatch_queue_s **)(v4 + 8);
  v8[2] = __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_3_206;
  v8[3] = &unk_18A28BDF0;
  v8[1] = 3221225472LL;
  v8[4] = v4;
  id v9 = v3;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v7 = v3;
  dispatch_async(v6, v8);
}

uint64_t __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_3_206(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v2 = *(os_log_s **)(*(void *)(a1 + 32) + 32LL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = 136315394;
    id v6 = "-[UARPiCloudManager fetchZoneChangesInContainer:forAccessories:]_block_invoke_3";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl( &dword_1887DD000,  v2,  OS_LOG_TYPE_INFO,  "%s: Record Zone Fetch completed for all zones with error: %@",  (uint8_t *)&v5,  0x16u);
  }

  return [*(id *)(a1 + 32) processUpdatedRecordsInContainer:*(void *)(a1 + 48) forAccessories:*(void *)(a1 + 56)];
}

- (void)processUpdatedRecordsInContainer:(id)a3 forAccessories:(id)a4
{
  uint64_t v82 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v52 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = log;
    [v6 containerID];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 updatedRecords];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 136315650;
    v77 = "-[UARPiCloudManager processUpdatedRecordsInContainer:forAccessories:]";
    __int16 v78 = 2112;
    v79 = v9;
    __int16 v80 = 2112;
    v81 = v10;
    _os_log_impl(&dword_1887DD000, v8, OS_LOG_TYPE_INFO, "%s: Updated Records in Container %@: %@", buf, 0x20u);
  }

  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  [v6 updatedRecords];
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
  v58 = v6;
  v59 = self;
  if (!v11)
  {
    uint64_t v13 = 0LL;
    __int16 v14 = 0LL;
    goto LABEL_45;
  }

  uint64_t v12 = v11;
  uint64_t v13 = 0LL;
  __int16 v14 = 0LL;
  uint64_t v57 = *(void *)v70;
  do
  {
    uint64_t v15 = 0LL;
    uint64_t v54 = v12;
    do
    {
      if (*(void *)v70 != v57) {
        objc_enumerationMutation(obj);
      }
      __int16 v16 = *(void **)(*((void *)&v69 + 1) + 8 * v15);
      uint64_t v17 = self->_log;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315394;
        v77 = "-[UARPiCloudManager processUpdatedRecordsInContainer:forAccessories:]";
        __int16 v78 = 2112;
        v79 = v16;
        _os_log_impl(&dword_1887DD000, v17, OS_LOG_TYPE_INFO, "%s: Processing Record %@", buf, 0x16u);
      }

      [v16 recordType];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v18 isEqualToString:@"UARPAccessory"])
      {
      }

      else
      {
        [v16 recordType];
        uint64_t v19 = v15;
        id v20 = (void *)objc_claimAutoreleasedReturnValue();
        int v21 = [v20 isEqualToString:@"CHIPAccessoryFirmware"];

        uint64_t v15 = v19;
        if (!v21)
        {
          __int128 v40 = self->_log;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            __int128 v41 = v40;
            [v16 recordType];
            __int128 v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)__int128 buf = 136315394;
            v77 = "-[UARPiCloudManager processUpdatedRecordsInContainer:forAccessories:]";
            __int16 v78 = 2112;
            v79 = v42;
            _os_log_impl( &dword_1887DD000,  v41,  OS_LOG_TYPE_INFO,  "%s: Unexpected RecordType %@, discarding",  buf,  0x16u);
          }

          goto LABEL_41;
        }
      }

      [v16 objectForKey:@"recordStatus"];
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v22 isEqualToString:@"1"])
      {
        v56 = v22;
        [v16 recordID];
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 recordName];
        id v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 componentsSeparatedByString:@"-"];
        id v25 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v26 = [v25 firstObject];

        if (v26)
        {
          v60 = v16;
          [v16 recordID];
          id v27 = (void *)objc_claimAutoreleasedReturnValue();
          [v27 zoneID];
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v29 = [v28 zoneName];

          if (v29)
          {
            uint64_t v53 = v15;
            __int128 v67 = 0u;
            __int128 v68 = 0u;
            __int128 v65 = 0u;
            __int128 v66 = 0u;
            id v30 = v52;
            uint64_t v31 = [v30 countByEnumeratingWithState:&v65 objects:v74 count:16];
            if (!v31) {
              goto LABEL_27;
            }
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v66;
            while (1)
            {
              for (uint64_t i = 0LL; i != v32; ++i)
              {
                if (*(void *)v66 != v33) {
                  objc_enumerationMutation(v30);
                }
                __int128 v35 = *(void **)(*((void *)&v65 + 1) + 8 * i);
                [v35 productNumber];
                id v36 = (void *)objc_claimAutoreleasedReturnValue();
                if ([v36 isEqualToString:v26])
                {
                  [v35 productGroup];
                  __int16 v37 = (void *)objc_claimAutoreleasedReturnValue();
                  int v38 = [v37 isEqualToString:v29];

                  if (!v38) {
                    continue;
                  }
                  [v35 availableRecords];
                  id v36 = (void *)objc_claimAutoreleasedReturnValue();
                  [v36 addObject:v60];
                }
              }

              uint64_t v32 = [v30 countByEnumeratingWithState:&v65 objects:v74 count:16];
              if (!v32)
              {
LABEL_27:

                self = v59;
                uint64_t v15 = v53;
                uint64_t v12 = v54;
                goto LABEL_36;
              }
            }
          }

          __int128 v44 = self->_log;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__int128 buf = 136315394;
            v77 = "-[UARPiCloudManager processUpdatedRecordsInContainer:forAccessories:]";
            __int16 v78 = 2112;
            v79 = v60;
            _os_log_impl( &dword_1887DD000,  v44,  OS_LOG_TYPE_INFO,  "%s: Unexpected format for zoneName for CKRecord %@, discarding",  buf,  0x16u);
          }

          uint64_t v29 = 0LL;
          uint64_t v12 = v54;
        }

        else
        {
          __int128 v43 = self->_log;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__int128 buf = 136315394;
            v77 = "-[UARPiCloudManager processUpdatedRecordsInContainer:forAccessories:]";
            __int16 v78 = 2112;
            v79 = v16;
            _os_log_impl( &dword_1887DD000,  v43,  OS_LOG_TYPE_INFO,  "%s: Unexpected format for RecordName for CKRecord %@, discarding",  buf,  0x16u);
          }

          uint64_t v26 = 0LL;
          uint64_t v29 = (uint64_t)v13;
          uint64_t v12 = v54;
LABEL_36:
          id v22 = v56;
        }
      }

      else
      {
        uint64_t v39 = self->_log;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 136315394;
          v77 = "-[UARPiCloudManager processUpdatedRecordsInContainer:forAccessories:]";
          __int16 v78 = 2112;
          v79 = v16;
          _os_log_impl(&dword_1887DD000, v39, OS_LOG_TYPE_DEFAULT, "%s: Discarding Inactive Record %@", buf, 0x16u);
        }

        uint64_t v29 = (uint64_t)v13;
        uint64_t v26 = (uint64_t)v14;
      }

      uint64_t v13 = (void *)v29;
      __int16 v14 = (void *)v26;
LABEL_41:
      ++v15;
    }

    while (v15 != v12);
    uint64_t v12 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
  }

  while (v12);
LABEL_45:

  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  id v45 = v52;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v61 objects:v73 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v62;
    do
    {
      for (uint64_t j = 0LL; j != v47; ++j)
      {
        if (*(void *)v62 != v48) {
          objc_enumerationMutation(v45);
        }
        v50 = *(void **)(*((void *)&v61 + 1) + 8 * j);
        v51 = self->_log;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 136315394;
          v77 = "-[UARPiCloudManager processUpdatedRecordsInContainer:forAccessories:]";
          __int16 v78 = 2112;
          v79 = v50;
          _os_log_impl(&dword_1887DD000, v51, OS_LOG_TYPE_INFO, "%s: Processing accessory %@", buf, 0x16u);
        }

        self = v59;
        -[UARPiCloudManager processRecordsInContainer:forAccessory:]( v59,  "processRecordsInContainer:forAccessory:",  v58,  v50);
      }

      uint64_t v47 = [v45 countByEnumeratingWithState:&v61 objects:v73 count:16];
    }

    while (v47);
  }
}

- (void)processRecordsInContainer:(id)a3 forAccessory:(id)a4
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v38 = a3;
  id v6 = a4;
  [v6 availableRecords];
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 count];

  if (!v8) {
    goto LABEL_5;
  }
  [v6 availableRecords];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v9 count] != 1)
  {

LABEL_7:
    __int16 v14 = (void *)MEMORY[0x189607968];
    objc_msgSend(v6, "firmwareVersion", self);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "integerValue"));
    id v36 = (void *)objc_claimAutoreleasedReturnValue();

    *(void *)__int128 buf = 0LL;
    *(void *)&buf[8] = 0LL;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id v34 = v6;
    [v6 availableRecords];
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = 0LL;
      __int16 v37 = 0LL;
      uint64_t v13 = @"firmwareVersion";
      uint64_t v19 = &unk_18A28F328;
      uint64_t v20 = *(void *)v41;
      do
      {
        for (uint64_t i = 0LL; i != v17; ++i)
        {
          if (*(void *)v41 != v20) {
            objc_enumerationMutation(obj);
          }
          id v22 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          if ([v38 isCHIPContainer])
          {
            id v23 = v19;
            [v22 objectForKey:@"firmwareVersionNumber"];
            id v24 = (void *)objc_claimAutoreleasedReturnValue();
            [v22 objectForKey:@"minFirmwareVersionNumber"];
            id v25 = (void *)objc_claimAutoreleasedReturnValue();
            [v22 objectForKey:@"maxFirmwareVersionNumber"];
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
            if ((!v25
               || ([v25 isEqualToNumber:v24] & 1) != 0
               || [v36 compare:v25] != -1)
              && (!v26
               || ([v26 isEqualToNumber:v24] & 1) != 0
               || [v36 compare:v26] != 1)
              && [v24 compare:v36] == 1
              && [v24 compare:v19] == 1)
            {
              id v23 = v24;

              id v27 = v22;
              __int16 v37 = v27;
            }

            uint64_t v13 = @"firmwareVersionString";
            uint64_t v19 = v23;
          }

          else
          {
            uint64_t v28 = [v22 objectForKey:v13];

            [MEMORY[0x18960E7B0] versionFromString:v28 version:&v39];
            if (uarpVersionCompare(buf, &v39) == 1)
            {
              *(_OWORD *)__int128 buf = v39;
              id v29 = v22;

              __int16 v37 = v29;
            }

            uint64_t v18 = (void *)v28;
          }
        }

        uint64_t v17 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
      }

      while (v17);
    }

    else
    {
      uint64_t v18 = 0LL;
      __int16 v37 = 0LL;
      uint64_t v13 = @"firmwareVersion";
      uint64_t v19 = &unk_18A28F328;
    }

    self = v33;
    id v6 = v34;
    uint64_t v12 = v37;
    if (!v37) {
      goto LABEL_5;
    }
    goto LABEL_31;
  }

  char v10 = [v38 isCHIPContainer];

  if ((v10 & 1) != 0) {
    goto LABEL_7;
  }
  [v6 availableRecords];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 firstObject];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v13 = @"firmwareVersion";
  if (!v12)
  {
LABEL_5:
    -[UARPiCloudManagerDelegate remoteFetchCompletion:error:](self->_delegate, "remoteFetchCompletion:error:", v6, 0LL);
    goto LABEL_34;
  }

- (void)processCKRecord:(id)a3 inContainer:(id)a4 forAccessory:(id)a5
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v9 isCHIPContainer])
  {
    uint64_t v11 = -[UARPiCloudAccessoryRecord initWithCKRecord:]( objc_alloc(&OBJC_CLASS___UARPiCloudAccessoryRecord),  "initWithCKRecord:",  v8);
    uint64_t v12 = v11;
    if (!v11) {
      goto LABEL_19;
    }
    -[UARPiCloudAccessoryRecord recordStatus](v11, "recordStatus");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 compare:@"1" options:1];

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = log;
      -[UARPiCloudAccessoryRecord recordName](v12, "recordName");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UARPiCloudAccessoryRecord recordStatus](v12, "recordStatus");
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 136315650;
      id v38 = "-[UARPiCloudManager processCKRecord:inContainer:forAccessory:]";
      __int16 v39 = 2112;
      __int128 v40 = v17;
      __int16 v41 = 2112;
      __int128 v42 = v18;
      _os_log_impl(&dword_1887DD000, v16, OS_LOG_TYPE_INFO, "%s: Record %@ Active Status: %@", buf, 0x20u);
    }

    if (v14) {
      goto LABEL_19;
    }
    [v10 firmwareVersion];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      uint64_t v20 = self->_log;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v21 = v20;
        -[UARPiCloudAccessoryRecord recordName](v12, "recordName");
        id v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UARPiCloudAccessoryRecord firmwareVersion](v12, "firmwareVersion");
        id v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 firmwareVersion];
        id v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)__int128 buf = 136315906;
        id v38 = "-[UARPiCloudManager processCKRecord:inContainer:forAccessory:]";
        __int16 v39 = 2112;
        __int128 v40 = v22;
        __int16 v41 = 2112;
        __int128 v42 = v23;
        __int16 v43 = 2112;
        __int128 v44 = v24;
        _os_log_impl( &dword_1887DD000,  v21,  OS_LOG_TYPE_INFO,  "%s: Comparing Record %@ Firmware Version %@ with %@ on accessory",  buf,  0x2Au);
      }

      id v25 = (void *)MEMORY[0x18960E7B0];
      [v10 firmwareVersion];
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 versionFromString:v26 version:buf];

      id v27 = (void *)MEMORY[0x18960E7B0];
      -[UARPiCloudAccessoryRecord firmwareVersion](v12, "firmwareVersion");
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 versionFromString:v28 version:v36];
    }

    int v29 = [v10 signatureValidationNeeded];
    id v30 = self->_log;
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
    if (v29)
    {
      if (v31)
      {
        uint64_t v32 = v30;
        -[UARPiCloudAccessoryRecord recordName](v12, "recordName");
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)__int128 buf = 136315394;
        id v38 = "-[UARPiCloudManager processCKRecord:inContainer:forAccessory:]";
        __int16 v39 = 2112;
        __int128 v40 = v33;
        _os_log_impl(&dword_1887DD000, v32, OS_LOG_TYPE_INFO, "%s: Validating signature on Record %@", buf, 0x16u);
      }

      if (!-[UARPiCloudManager validateSignatureForUARPAccessoryRecord:inContainer:]( self,  "validateSignatureForUARPAccessoryRecord:inContainer:",  v12,  v9)) {
        goto LABEL_19;
      }
    }

    else if (v31)
    {
      id v34 = v30;
      -[UARPiCloudAccessoryRecord recordName](v12, "recordName");
      __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 136315394;
      id v38 = "-[UARPiCloudManager processCKRecord:inContainer:forAccessory:]";
      __int16 v39 = 2112;
      __int128 v40 = v35;
      _os_log_impl( &dword_1887DD000,  v34,  OS_LOG_TYPE_INFO,  "%s: Bypassing signature validation on Record %@",  buf,  0x16u);
    }

    [v10 setRecord:v12];
LABEL_19:
    -[UARPiCloudManagerDelegate remoteFetchCompletion:error:](self->_delegate, "remoteFetchCompletion:error:", v10, 0LL);

    goto LABEL_20;
  }

  -[UARPiCloudManager processCHIPFirmwareRecord:inContainer:forAccessory:]( self,  "processCHIPFirmwareRecord:inContainer:forAccessory:",  v8,  v9,  v10);
LABEL_20:
}

- (void)processVerificationCertificateRecord:(id)a3 forContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 objectForKey:@"certificate"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v8;
  if (v8)
  {
    [v8 assetContent];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v35 = v6;
    if (!v10)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        -[UARPiCloudManager processVerificationCertificateRecord:forContainer:].cold.3(log, v9);
      }
      uint64_t v12 = 0LL;
      AppleAccessoryUpdateSigning = 0LL;
      goto LABEL_15;
    }

    AppleAccessoryUpdateSigning = (const void *)SecPolicyCreateAppleAccessoryUpdateSigning();
    if (!AppleAccessoryUpdateSigning)
    {
      uint64_t v14 = self->_log;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[UARPiCloudManager processVerificationCertificateRecord:forContainer:].cold.4( v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21);
      }
      uint64_t v12 = 0LL;
      goto LABEL_14;
    }

    uint64_t v12 = -[UARPiCloudManager copyPublicKeyForVerificationCertificateData:policy:]( self,  "copyPublicKeyForVerificationCertificateData:policy:",  v10,  AppleAccessoryUpdateSigning);
    if (v12)
    {
LABEL_14:
      objc_msgSend(v7, "setVerificationCertificate:", v10, v6);
LABEL_15:
      objc_msgSend(v7, "setPublicKey:", v12, v35);
      [MEMORY[0x1896078A8] defaultManager];
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 fileURL];
      id v23 = (void *)objc_claimAutoreleasedReturnValue();
      id v37 = 0LL;
      char v24 = [v22 removeItemAtURL:v23 error:&v37];
      id v25 = v37;

      if ((v24 & 1) == 0)
      {
        uint64_t v26 = self->_log;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[UARPiCloudManager processVerificationCertificateRecord:forContainer:].cold.2(v26, v9, (uint64_t)v25);
        }
      }

      if (AppleAccessoryUpdateSigning) {
        CFRelease(AppleAccessoryUpdateSigning);
      }
      id v6 = v36;
      if (v12) {
        CFRelease(v12);
      }
      goto LABEL_22;
    }

    id v27 = self->_log;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudManager processVerificationCertificateRecord:forContainer:].cold.5( v27,  v28,  v29,  v30,  v31,  v32,  v33,  v34);
    }
  }

  else
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudManager processVerificationCertificateRecord:forContainer:].cold.1();
    }
    [v7 setPublicKey:0];
    id v10 = 0LL;
  }

- (__SecKey)copyPublicKeyForVerificationCertificateData:(id)a3 policy:(__SecPolicy *)a4
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (-[UARPiCloudContainer requiresPrefForSigningBeta](self->_container, "requiresPrefForSigningBeta"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( &dword_1887DD000,  log,  OS_LOG_TYPE_DEFAULT,  "Setting Security Pref AllowAccessoryUpdateSigningBeta",  buf,  2u);
    }

    CFPreferencesSetAppValue( @"AllowAccessoryUpdateSigningBeta",  (CFPropertyListRef)*MEMORY[0x189604DE8],  @"com.apple.security");
  }

  char v24 = v5;
  id v7 = (void *)[objc_alloc(NSString) initWithData:v5 encoding:4];
  [v7 componentsSeparatedByString:@","];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = (const __CFData *)[objc_alloc(MEMORY[0x189603F48]) initWithBase64EncodedString:*(void *)(*((void *)&v28 + 1) + 8 * i) options:0];
        SecCertificateRef v16 = SecCertificateCreateWithData(0LL, v15);
        [v9 addObject:v16];
      }

      uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }

    while (v12);
  }

  SecTrustRef trust = 0LL;
  OSStatus v17 = SecTrustCreateWithCertificates(v9, a4, &trust);
  if (trust)
  {
    CFErrorRef error = 0LL;
    BOOL v18 = SecTrustEvaluateWithError(trust, &error);
    uint64_t v19 = self->_log;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109378;
      BOOL v33 = v18;
      __int16 v34 = 2112;
      CFErrorRef v35 = error;
      _os_log_impl( &dword_1887DD000,  v19,  OS_LOG_TYPE_DEFAULT,  "Certificate is trusted: %d trustErrorRef %@",  buf,  0x12u);
    }

    CertificateAtIndex = SecTrustGetCertificateAtIndex(trust, 0LL);
    uint64_t v21 = SecCertificateCopyKey(CertificateAtIndex);
    CFRelease(trust);
  }

  else
  {
    id v22 = self->_log;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudManager copyPublicKeyForVerificationCertificateData:policy:].cold.1(v17, v22);
    }
    uint64_t v21 = 0LL;
  }

  return v21;
}

- (id)filterInterestedZonesInContainer:(id)a3 forAccessories:(id)a4
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v28 = a4;
  [MEMORY[0x189603FE0] set];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  uint64_t v26 = v5;
  [v5 updatedZones];
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v37;
    uint64_t v27 = *(void *)v37;
    do
    {
      uint64_t v10 = 0LL;
      uint64_t v29 = v8;
      do
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v36 + 1) + 8 * v10);
        [v11 zoneID];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 zoneName];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        int v14 = [v13 isEqualToString:@"certificates"];

        if (v14)
        {
          [v6 addObject:v11];
        }

        else
        {
          uint64_t v31 = v10;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          id v15 = v28;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v33;
            do
            {
              for (uint64_t i = 0LL; i != v17; ++i)
              {
                if (*(void *)v33 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                [v11 zoneID];
                uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
                [v21 zoneName];
                id v22 = (void *)objc_claimAutoreleasedReturnValue();
                [v20 productGroup];
                id v23 = (void *)objc_claimAutoreleasedReturnValue();
                int v24 = [v22 isEqualToString:v23];

                if (v24) {
                  [v6 addObject:v11];
                }
              }

              uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }

            while (v17);
          }

          uint64_t v9 = v27;
          uint64_t v8 = v29;
          uint64_t v10 = v31;
        }

        ++v10;
      }

      while (v10 != v8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }

    while (v8);
  }

  return v6;
}

- (BOOL)validateSignatureForUARPAccessoryRecord:(id)a3 inContainer:(id)a4
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  CFErrorRef error = 0LL;
  [v7 publicKey];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudManager validateSignatureForUARPAccessoryRecord:inContainer:].cold.1( log,  v25,  v26,  v27,  v28,  v29,  v30,  v31);
    }
    goto LABEL_18;
  }

  uint64_t v9 = -[UARPiCloudManager calculateDigestFromUARPAccessoryRecord:](self, "calculateDigestFromUARPAccessoryRecord:", v6);
  if (!v9)
  {
    __int128 v32 = self->_log;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudManager validateSignatureForUARPAccessoryRecord:inContainer:].cold.2( v32,  v33,  v34,  v35,  v36,  v37,  v38,  v39);
    }
    goto LABEL_18;
  }

  uint64_t v10 = (void *)v9;
  id v11 = objc_alloc(MEMORY[0x189603F48]);
  [v6 signature];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = (const __CFData *)[v11 initWithBase64EncodedString:v12 options:0];

  int v14 = self->_log;
  if (!v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudManager validateSignatureForUARPAccessoryRecord:inContainer:].cold.3( v14,  v40,  v41,  v42,  v43,  v44,  v45,  v46);
    }

LABEL_18:
    BOOL v19 = 0;
    goto LABEL_19;
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v14;
    [v6 recordName];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412290;
    v50 = v16;
    _os_log_impl(&dword_1887DD000, v15, OS_LOG_TYPE_DEFAULT, "Validating signature on Record %@", buf, 0xCu);
  }

  [v7 publicKey];
  uint64_t v17 = (__SecKey *)objc_claimAutoreleasedReturnValue();
  int v18 = SecKeyVerifySignature(v17, (SecKeyAlgorithm)*MEMORY[0x18960BC40], (CFDataRef)v10, v13, &error);
  BOOL v19 = v18 != 0;

  uint64_t v20 = self->_log;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = v20;
    [v6 recordName];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    id v23 = @"INVALID";
    *(_DWORD *)__int128 buf = 138412802;
    v50 = v22;
    if (v18) {
      id v23 = @"VALID";
    }
    __int16 v51 = 2112;
    id v52 = v23;
    __int16 v53 = 2112;
    CFErrorRef v54 = error;
    _os_log_impl(&dword_1887DD000, v21, OS_LOG_TYPE_DEFAULT, "Signature on Record %@: %@ error: %@", buf, 0x20u);
  }

LABEL_19:
  return v19;
}

- (id)calculateDigestFromUARPAccessoryRecord:(id)a3
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  CC_SHA256_Init(&c);
  [MEMORY[0x189603FA8] array];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 manufacturer];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 addObject:v5];

  [v3 model];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 addObject:v6];

  [v3 firmwareVersion];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 addObject:v7];

  [v3 firmwareURL];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 addObject:v8];

  [v3 releaseType];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    [v3 releaseType];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 addObject:v10];
  }

  [v3 updateClassification];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    [v3 updateClassification];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 addObject:v12];
  }

  [v3 deploymentList];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 count];

  if (v14)
  {
    [v3 deploymentStr];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 addObject:v15];
  }

  [v3 releaseNotesURL];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 addObject:v16];

  [v3 firmwareBinaryHash];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 addObject:v17];

  [v3 releaseNotesHash];
  int v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 addObject:v18];

  [v3 recordStatus];
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 addObject:v19];

  [v3 releaseDate];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 addObject:v20];

  [v3 firmwareFileSize];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 addObject:v21];

  [v3 releaseNotesFileSize];
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 addObject:v22];

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v23 = v4;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v33;
    do
    {
      uint64_t v27 = 0LL;
      do
      {
        if (*(void *)v33 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * v27), "dataUsingEncoding:", 4, (void)v32);
        CC_SHA256_Update(&c, (const void *)[v28 bytes], objc_msgSend(v28, "length"));

        ++v27;
      }

      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }

    while (v25);
  }

  [MEMORY[0x189603FB8] dataWithLength:32];
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v30 = v29;
  if (v29) {
    CC_SHA256_Final((unsigned __int8 *)[v29 mutableBytes], &c);
  }

  return v30;
}

- (BOOL)fetchVerificationCertificateInContainer:(id)a3
{
  v28[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ([v4 isCHIPContainer])
  {
    -[UARPiCloudManager performRemoteFetchForCHIPVerificationCertificateSync]( self,  "performRemoteFetchForCHIPVerificationCertificateSync");
  }

  else
  {
    v24[0] = 0LL;
    v24[1] = v24;
    v24[2] = 0x3032000000LL;
    v24[3] = __Block_byref_object_copy__0;
    v24[4] = __Block_byref_object_dispose__0;
    id v25 = 0LL;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_1887DD000, log, OS_LOG_TYPE_INFO, "Fetching Verification Certificate", buf, 2u);
    }

    id v7 = objc_alloc(MEMORY[0x189602198]);
    uint64_t v8 = (void *)[v7 initWithZoneName:@"certificates" ownerName:*MEMORY[0x189602150]];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x189602190]) initWithRecordName:@"certificates" zoneID:v8];
    id v10 = objc_alloc(MEMORY[0x189602180]);
    v28[0] = v9;
    [MEMORY[0x189603F18] arrayWithObjects:v28 count:1];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = (void *)[v10 initWithRecordIDs:v11];

    [v12 setShouldFetchAssetContentInMemory:1];
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __61__UARPiCloudManager_fetchVerificationCertificateInContainer___block_invoke;
    v19[3] = &unk_18A28BE40;
    v19[4] = self;
    id v23 = v24;
    id v13 = v9;
    id v20 = v13;
    id v14 = v4;
    id v21 = v14;
    id v15 = v5;
    id v22 = v15;
    [v12 setFetchRecordsCompletionBlock:v19];
    [v14 database];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 addOperation:v12];

    uint64_t v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      uint64_t v27 = "-[UARPiCloudManager fetchVerificationCertificateInContainer:]";
      _os_log_impl( &dword_1887DD000,  v17,  OS_LOG_TYPE_INFO,  "%s: Waiting on the fetch record completion block to be finished",  buf,  0xCu);
    }

    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

    _Block_object_dispose(v24, 8);
  }

  return 1;
}

void __61__UARPiCloudManager_fetchVerificationCertificateInContainer___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(os_log_s **)(*(void *)(a1 + 32) + 32LL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    uint64_t v12 = "-[UARPiCloudManager fetchVerificationCertificateInContainer:]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl( &dword_1887DD000,  v7,  OS_LOG_TYPE_INFO,  "%s: operationError = %@, recordsByRecordID: %@",  (uint8_t *)&v11,  0x20u);
  }

  if (v5 && !v6)
  {
    uint64_t v8 = [v5 objectForKey:*(void *)(a1 + 40)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    [*(id *)(a1 + 32) processVerificationCertificateRecord:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) forContainer:*(void *)(a1 + 48)];
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- (void)performRemoteFetchForSupportedAccessoriesMetadataInZone:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[UARPiCloudManager performRemoteFetchForSupportedAccessoriesMetadataInZone:]";
    _os_log_impl(&dword_1887DD000, log, OS_LOG_TYPE_DEFAULT, "%s: Deprecated", (uint8_t *)&v4, 0xCu);
  }

- (void)performRemoteFetchForSupportedAccessoriesMetadata:(id)a3 batchRequest:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = "NO";
    *(void *)&uint8_t buf[4] = "-[UARPiCloudManager performRemoteFetchForSupportedAccessoriesMetadata:batchRequest:]";
    *(_DWORD *)__int128 buf = 136315650;
    if (v4) {
      uint64_t v8 = "YES";
    }
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&_BYTE buf[22] = 2080;
    uint64_t v29 = v8;
    _os_log_impl(&dword_1887DD000, log, OS_LOG_TYPE_DEFAULT, "%s: productGroup:%@ batchRequest:%s", buf, 0x20u);
  }

  -[UARPiCloudContainer containerID](self->_container, "containerID");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v9 isEqualToString:@"com.apple.chip"])
  {
  }

  else
  {
    -[UARPiCloudContainer containerID](self->_container, "containerID");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    int v11 = [v10 isEqualToString:@"com.apple.chip.staging"];

    if (!v11) {
      goto LABEL_11;
    }
  }

  *(void *)__int128 buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  LOBYTE(v29) = 1;
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0LL);
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  dispatch_time_t v27 = dispatch_time(0LL, 0LL);
  uint64_t v13 = MEMORY[0x1895F87A8];
  do
  {
    dispatch_time_t v14 = v25[3];
    recordProcessingQueue = self->_recordProcessingQueue;
    v18[0] = v13;
    v18[1] = 3221225472LL;
    v18[2] = __84__UARPiCloudManager_performRemoteFetchForSupportedAccessoriesMetadata_batchRequest___block_invoke;
    v18[3] = &unk_18A28BE68;
    id v21 = buf;
    v18[4] = self;
    id v16 = v6;
    BOOL v23 = v4;
    id v19 = v16;
    id v22 = &v24;
    uint64_t v17 = v12;
    id v20 = v17;
    dispatch_after(v14, (dispatch_queue_t)recordProcessingQueue, v18);
    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  }

  while (!*(_BYTE *)(*(void *)&buf[8] + 24LL));
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(buf, 8);
LABEL_11:
}

uint64_t __84__UARPiCloudManager_performRemoteFetchForSupportedAccessoriesMetadata_batchRequest___block_invoke( uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) handleRemoteFetchRequestForCHIPAccessoriesMetadata:*(void *)(a1 + 40) batchRequest:*(unsigned __int8 *)(a1 + 72)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8LL);
  if (*(_BYTE *)(a1 + 72) && !*(_BYTE *)(v2 + 24)) {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = dispatch_time(0LL, 1000000000LL);
  }
  else {
    *(_BYTE *)(v2 + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)performRemoteFetchForAttestationCertificates:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315394;
    int v11 = "-[UARPiCloudManager performRemoteFetchForAttestationCertificates:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1887DD000, log, OS_LOG_TYPE_DEFAULT, "%s: subjectKeyIdentifier:%@", buf, 0x16u);
  }

  recordProcessingQueue = self->_recordProcessingQueue;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __66__UARPiCloudManager_performRemoteFetchForAttestationCertificates___block_invoke;
  v8[3] = &unk_18A28BC10;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async((dispatch_queue_t)recordProcessingQueue, v8);
}

void __66__UARPiCloudManager_performRemoteFetchForAttestationCertificates___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v2 isEqualToString:@"com.apple.chip"])
  {
  }

  else
  {
    [*(id *)(*(void *)(a1 + 32) + 16) containerID];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    int v4 = [v3 isEqualToString:@"com.apple.chip.staging"];

    if (!v4) {
      return;
    }
  }

  [*(id *)(a1 + 32) handleRemoteFetchRequestForCHIPAttestationCertificates:*(void *)(a1 + 40)];
}

- (UARPiCloudContainer)container
{
  return (UARPiCloudContainer *)objc_getProperty(self, a2, 16LL, 1);
}

- (UARPiCloudManagerDelegate)delegate
{
  return (UARPiCloudManagerDelegate *)objc_getProperty(self, a2, 24LL, 1);
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

- (void)qHandleRemoteFetchRequestForAccessories:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)processVerificationCertificateRecord:forContainer:.cold.1()
{
}

- (void)processVerificationCertificateRecord:(uint64_t)a3 forContainer:.cold.2( void *a1,  void *a2,  uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v5 = a1;
  [a2 fileURL];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = 136315650;
  OUTLINED_FUNCTION_4();
  __int16 v10 = v7;
  uint64_t v11 = a3;
  OUTLINED_FUNCTION_4_2(&dword_1887DD000, v5, v8, "%s: Failed to delete asset at URL %@ withError %@", (uint8_t *)v9);

  OUTLINED_FUNCTION_2_2();
}

- (void)processVerificationCertificateRecord:(void *)a1 forContainer:(void *)a2 .cold.3(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v3 = a1;
  [a2 assetContent];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [a2 assetTransferOptions];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = 136315650;
  uint64_t v8 = "-[UARPiCloudManager processVerificationCertificateRecord:forContainer:]";
  __int16 v9 = 2112;
  __int16 v10 = v4;
  __int16 v11 = 2112;
  uint64_t v12 = v5;
  OUTLINED_FUNCTION_4_2( &dword_1887DD000,  v3,  v6,  "%s: Failed to retrieve verification/certificate data from %@, %@",  (uint8_t *)&v7);

  OUTLINED_FUNCTION_2_2();
}

- (void)processVerificationCertificateRecord:(uint64_t)a3 forContainer:(uint64_t)a4 .cold.4( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)processVerificationCertificateRecord:(uint64_t)a3 forContainer:(uint64_t)a4 .cold.5( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)copyPublicKeyForVerificationCertificateData:(int)a1 policy:(os_log_s *)a2 .cold.1(int a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( &dword_1887DD000,  a2,  OS_LOG_TYPE_ERROR,  "Failed to create trust for certificate, status:0x%x",  (uint8_t *)v2,  8u);
}

- (void)validateSignatureForUARPAccessoryRecord:(uint64_t)a3 inContainer:(uint64_t)a4 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)validateSignatureForUARPAccessoryRecord:(uint64_t)a3 inContainer:(uint64_t)a4 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)validateSignatureForUARPAccessoryRecord:(uint64_t)a3 inContainer:(uint64_t)a4 .cold.3( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end