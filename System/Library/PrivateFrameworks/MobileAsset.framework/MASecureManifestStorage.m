@interface MASecureManifestStorage
- (BOOL)_storeManifest:(id)a3 infoPlist:(id)a4 stage:(BOOL)a5 error:(id *)a6;
- (BOOL)commitStagedManifestsForSelectors:(id)a3 error:(id *)a4;
- (BOOL)invalidateManifestForAssetType:(id)a3 specifier:(id)a4 error:(id *)a5;
- (BOOL)stageManifest:(id)a3 infoPlist:(id)a4 error:(id *)a5;
- (BOOL)storeManifest:(id)a3 infoPlist:(id)a4 error:(id *)a5;
- (id)_errorWithCode:(unint64_t)a3 underlyingError:(id)a4;
- (id)_manifestPathForAssetType:(id)a3 specifier:(id)a4 stage:(BOOL)a5;
- (id)_serviceConnectionWithError:(id *)a3;
- (id)manifestPathForAssetType:(id)a3 specifier:(id)a4;
- (id)stagedManifestPathForAssetType:(id)a3 specifier:(id)a4;
@end

@implementation MASecureManifestStorage

- (BOOL)storeManifest:(id)a3 infoPlist:(id)a4 error:(id *)a5
{
  return -[MASecureManifestStorage _storeManifest:infoPlist:stage:error:]( self,  "_storeManifest:infoPlist:stage:error:",  a3,  a4,  0LL,  a5);
}

- (BOOL)stageManifest:(id)a3 infoPlist:(id)a4 error:(id *)a5
{
  return -[MASecureManifestStorage _storeManifest:infoPlist:stage:error:]( self,  "_storeManifest:infoPlist:stage:error:",  a3,  a4,  1LL,  a5);
}

- (BOOL)_storeManifest:(id)a3 infoPlist:(id)a4 stage:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v12 = -[MASecureManifestStorage _serviceConnectionWithError:](self, "_serviceConnectionWithError:", a6);
  v13 = v12;
  if (v12)
  {
    uint64_t v20 = 0LL;
    v21 = &v20;
    uint64_t v22 = 0x3032000000LL;
    v23 = __Block_byref_object_copy__4;
    v24 = __Block_byref_object_dispose__4;
    id v25 = 0LL;
    uint64_t v14 = MEMORY[0x1895F87A8];
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __64__MASecureManifestStorage__storeManifest_infoPlist_stage_error___block_invoke;
    v19[3] = &unk_189FFAAC0;
    v19[4] = self;
    v19[5] = &v20;
    [v12 synchronousRemoteObjectProxyWithErrorHandler:v19];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v14;
    v18[1] = 3221225472LL;
    v18[2] = __64__MASecureManifestStorage__storeManifest_infoPlist_stage_error___block_invoke_2;
    v18[3] = &unk_189FFAAE8;
    v18[4] = &v20;
    [v15 storeManifest:v10 infoPlist:v11 stage:v7 completion:v18];

    if (a6) {
      *a6 = (id) v21[5];
    }
    [v13 invalidate];
    BOOL v16 = v21[5] == 0;
    _Block_object_dispose(&v20, 8);
  }

  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

void __64__MASecureManifestStorage__storeManifest_infoPlist_stage_error___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _errorWithCode:1 underlyingError:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __64__MASecureManifestStorage__storeManifest_infoPlist_stage_error___block_invoke_2( uint64_t a1,  void *a2)
{
}

- (BOOL)commitStagedManifestsForSelectors:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v21 = a3;
  v19 = self;
  -[MASecureManifestStorage _serviceConnectionWithError:](self, "_serviceConnectionWithError:", a4);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v6 = v21;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v32;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v11 = (void *)NSString;
          [v10 assetType];
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v10 assetSpecifier];
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 stringWithFormat:@"%@:%@", v12, v13];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

          [v5 addObject:v14];
        }

        uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }

      while (v7);
    }

    uint64_t v25 = 0LL;
    v26 = &v25;
    uint64_t v27 = 0x3032000000LL;
    v28 = __Block_byref_object_copy__4;
    v29 = __Block_byref_object_dispose__4;
    id v30 = 0LL;
    uint64_t v15 = MEMORY[0x1895F87A8];
    v24[0] = MEMORY[0x1895F87A8];
    v24[1] = 3221225472LL;
    v24[2] = __67__MASecureManifestStorage_commitStagedManifestsForSelectors_error___block_invoke;
    v24[3] = &unk_189FFAAC0;
    v24[4] = v19;
    v24[5] = &v25;
    [v22 synchronousRemoteObjectProxyWithErrorHandler:v24];
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v15;
    v23[1] = 3221225472LL;
    v23[2] = __67__MASecureManifestStorage_commitStagedManifestsForSelectors_error___block_invoke_2;
    v23[3] = &unk_189FFAAE8;
    v23[4] = &v25;
    [v16 commitStagedManifestsForSelectors:v5 completion:v23];

    if (a4) {
      *a4 = (id) v26[5];
    }
    [v22 invalidate];
    BOOL v17 = v26[5] == 0;
    _Block_object_dispose(&v25, 8);
  }

  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

void __67__MASecureManifestStorage_commitStagedManifestsForSelectors_error___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _errorWithCode:1 underlyingError:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __67__MASecureManifestStorage_commitStagedManifestsForSelectors_error___block_invoke_2( uint64_t a1,  void *a2)
{
}

- (BOOL)invalidateManifestForAssetType:(id)a3 specifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  -[MASecureManifestStorage _serviceConnectionWithError:](self, "_serviceConnectionWithError:", a5);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v10;
  if (v10)
  {
    uint64_t v18 = 0LL;
    v19 = &v18;
    uint64_t v20 = 0x3032000000LL;
    id v21 = __Block_byref_object_copy__4;
    uint64_t v22 = __Block_byref_object_dispose__4;
    id v23 = 0LL;
    uint64_t v12 = MEMORY[0x1895F87A8];
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __74__MASecureManifestStorage_invalidateManifestForAssetType_specifier_error___block_invoke;
    v17[3] = &unk_189FFAAC0;
    v17[4] = self;
    v17[5] = &v18;
    [v10 synchronousRemoteObjectProxyWithErrorHandler:v17];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472LL;
    v16[2] = __74__MASecureManifestStorage_invalidateManifestForAssetType_specifier_error___block_invoke_2;
    v16[3] = &unk_189FFAAE8;
    v16[4] = &v18;
    [v13 invalidateManifestForAssetType:v8 specifier:v9 completion:v16];

    if (a5) {
      *a5 = (id) v19[5];
    }
    [v11 invalidate];
    BOOL v14 = v19[5] == 0;
    _Block_object_dispose(&v18, 8);
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

void __74__MASecureManifestStorage_invalidateManifestForAssetType_specifier_error___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _errorWithCode:1 underlyingError:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __74__MASecureManifestStorage_invalidateManifestForAssetType_specifier_error___block_invoke_2( uint64_t a1,  void *a2)
{
}

- (id)manifestPathForAssetType:(id)a3 specifier:(id)a4
{
  return -[MASecureManifestStorage _manifestPathForAssetType:specifier:stage:]( self,  "_manifestPathForAssetType:specifier:stage:",  a3,  a4,  0LL);
}

- (id)stagedManifestPathForAssetType:(id)a3 specifier:(id)a4
{
  return -[MASecureManifestStorage _manifestPathForAssetType:specifier:stage:]( self,  "_manifestPathForAssetType:specifier:stage:",  a3,  a4,  1LL);
}

- (id)_manifestPathForAssetType:(id)a3 specifier:(id)a4 stage:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  getRepositoryPath(@"/private/var/MobileAsset/AssetsV2");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 stringByAppendingPathComponent:@"manifests"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    uint64_t v18 = [v10 stringByAppendingPathComponent:@"staged"];

    id v10 = (void *)v18;
  }

  normalizedAssetType((uint64_t)v7, v11, v12, v13, v14, v15, v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 stringByAppendingPathComponent:v19];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  normalizedAssetType((uint64_t)v8, v21, v22, v23, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  [v20 stringByAppendingPathComponent:v28];
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  [v29 stringByAppendingPathComponent:@"SecureMobileAssetCryptex1Ticket.img4"];
  id v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)_serviceConnectionWithError:(id *)a3
{
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithServiceName:@"com.apple.MobileAsset.ManifestStorageService"];
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6CE748];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setRemoteObjectInterface:v6];
  [v5 resume];
  if (v5)
  {
    id v11 = v5;
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MASecureManifestStorage _serviceConnectionWithError:]",  @"Failed to connect to service",  v7,  v8,  v9,  v10,  v13);
    if (a3)
    {
      -[MASecureManifestStorage _errorWithCode:underlyingError:](self, "_errorWithCode:underlyingError:", 1LL, 0LL);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

- (id)_errorWithCode:(unint64_t)a3 underlyingError:(id)a4
{
  v11[1] = *MEMORY[0x1895F89C0];
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    uint64_t v10 = *MEMORY[0x189607798];
    v11[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  [MEMORY[0x189607870] errorWithDomain:@"ManifestStorageServiceErrorDomain" code:a3 userInfo:v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end