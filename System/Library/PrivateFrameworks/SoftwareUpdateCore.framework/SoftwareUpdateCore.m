id SUCoreBorder_MSUPreflightUpdate(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v12;
  v2 = a2;
  v12 = 0LL;
  _SUCoreBorder_MSUFunctionAtBegin(@"MSUPreflightUpdate", &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v8 = MSUPreflightUpdate();
    _SUCoreBorder_MSUFunctionAtEnd(@"MSUPreflightUpdate", &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      LOBYTE(v8) = _SUCoreBorder_MSUSimulate(v9, v8, &v12);
    }

    if ((v8 & 1) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    v7 = v12;
    goto LABEL_10;
  }

LABEL_3:
  if (v12)
  {
    [MEMORY[0x189612778] sharedDiag];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
    [v5 trackAnomaly:@"SUCoreBorder_MSUPreflightUpdate" forReason:@"preflight (prior to SU download) was successful with error" withResult:0 withError:v12];
  }

  v7 = 0LL;
LABEL_10:

  return v7;
}

  if (v12)
  {
    [MEMORY[0x189612778] sharedDiag];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
    [v5 trackAnomaly:@"SUCoreBorder_MSUApplyUpdate" forReason:@"apply was successful with error" withResult:0 withError:v12];
  }

  v7 = 0LL;
LABEL_10:

  return v7;
}

  if (v9)
  {
    [MEMORY[0x189612778] sharedDiag];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v9;
    [v2 trackAnomaly:@"SUCoreBorder_MSUSuspendUpdate" forReason:@"suspend was successful with error" withResult:0 withError:v9];
  }

  v4 = 0LL;
LABEL_10:

  return v4;
}

  if (v9)
  {
    [MEMORY[0x189612778] sharedDiag];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v9;
    [v2 trackAnomaly:@"SUCoreBorder_MSUPurgeSuspendedUpdate" forReason:@"purge suspeneded update was successful with error" withResult:0 withError:v9];
  }

  v4 = 0LL;
LABEL_10:

  return v4;
}

  if (v11)
  {
    [MEMORY[0x189612778] sharedDiag];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    [v4 trackAnomaly:@"SUCoreBorder_MSUResumeUpdateWithOptions" forReason:@"resume was successful with error" withResult:0 withError:v11];
  }

  v6 = 0LL;
LABEL_10:

  return v6;
}

  if (v11)
  {
    [MEMORY[0x189612778] sharedDiag];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    [v4 trackAnomaly:@"SUCoreBorder_MSUBrainIsLoadable" forReason:@"brainIsLoadable returned YES with error" withResult:0 withError:v11];
  }

  v6 = 0LL;
LABEL_10:

  return v6;
}

  if (v11)
  {
    [MEMORY[0x189612778] sharedDiag];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    [v4 trackAnomaly:@"SUCoreBorder_MSUAssetCalculatePrepareSize" forReason:@"asset calculate prepare size was successful with error" withResult:0 withError:v11];
  }

  v6 = 0LL;
LABEL_10:

  return v6;
}

  if (v11)
  {
    [MEMORY[0x189612778] sharedDiag];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    [v4 trackAnomaly:@"SUCoreBorder_MSUAssetCalculateApplySize" forReason:@"asset calculate apply size was successful with error" withResult:0 withError:v11];
  }

  v6 = 0LL;
LABEL_10:

  return v6;
}

  if (v11)
  {
    [MEMORY[0x189612778] sharedDiag];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    [v4 trackAnomaly:@"SUCoreBorder_MSUCommitStash" forReason:@"StashCommit was successful with error" withResult:0 withError:v11];
  }

  v6 = 0LL;
LABEL_10:

  return v6;
}

  if (v12)
  {
    [MEMORY[0x189612778] sharedDiag];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
    [v5 trackAnomaly:@"SUCoreBorder_MSURollbackUpdate" forReason:@"rollback was successful with error" withResult:0 withError:v12];
  }

  v7 = 0LL;
LABEL_10:

  return v7;
}

  if (v9)
  {
    [MEMORY[0x189612778] sharedDiag];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v9;
    [v2 trackAnomaly:@"SUCoreBorder_MSURollbackUpdateSuspend" forReason:@"suspend was successful with error" withResult:0 withError:v9];
  }

  v4 = 0LL;
LABEL_10:

  return v4;
}

  if (v11)
  {
    [MEMORY[0x189612778] sharedDiag];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    [v4 trackAnomaly:@"SUCoreBorder_MSURollbackUpdateResumeWithOptions" forReason:@"resume was successful with error" withResult:0 withError:v11];
  }

  v6 = 0LL;
LABEL_10:

  return v6;
}

  if (v12)
  {
    [MEMORY[0x189612778] sharedDiag];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
    [v5 trackAnomaly:@"SUCoreBorder_MSUApplyUpdate" forReason:@"apply was successful with error" withResult:0 withError:v12];
  }

  v7 = 0LL;
LABEL_10:

  return v7;
}

id _SUCoreBorder_MSUFunctionAtBegin(void *a1, void *a2)
{
  v3 = (void *)MEMORY[0x1896127C8];
  id v4 = a1;
  [v3 sharedSimulator];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 begin:@"msu" atFunction:v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if ([v6 simAction] == 1)
    {
      _SUCoreBorder_MSUSetSimulatedError(v6, (uint64_t)a2);
    }

    else if ([v6 simAction] == 3)
    {
      if (a2) {
        *a2 = 0LL;
      }
    }

    else
    {

      v6 = 0LL;
    }
  }

  return v6;
}

id _SUCoreBorder_MSUFunctionAtEnd(void *a1, void *a2)
{
  v3 = (void *)MEMORY[0x1896127C8];
  id v4 = a1;
  [v3 sharedSimulator];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 end:@"msu" atFunction:v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if ([v6 simAction] == 1)
    {
      _SUCoreBorder_MSUSetSimulatedError(v6, (uint64_t)a2);
    }

    else if ([v6 simAction] == 3)
    {
      if (a2) {
        *a2 = 0LL;
      }
    }

    else
    {

      v6 = 0LL;
    }
  }

  return v6;
}

uint64_t _SUCoreBorder_MSUSimulate(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = [v5 simAction];
  if (v6 == 3)
  {
    if (a3) {
      *a3 = 0LL;
    }
    a2 = 1LL;
  }

  else if (v6 == 1)
  {
    _SUCoreBorder_MSUSetSimulatedError(v5, (uint64_t)a3);
    a2 = 0LL;
  }

  else
  {
    [MEMORY[0x189612778] sharedDiag];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event action, event: %@", v5];
    [v7 trackAnomaly:@"_SUCoreBorder_MSUSimulate" forReason:v8 withResult:8113 withError:0];
  }

  return a2;
}

id SUCoreBorder_MSUPrepareUpdateWithMAAsset(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v14 = 0LL;
  _SUCoreBorder_MSUFunctionAtBegin(@"MSUPrepareUpdateWithMAAsset", &v14);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (v5)
  {
    if (_SUCoreBorder_MSUSimulate(v5, 1LL, &v14))
    {
LABEL_3:
      if (!v14)
      {
        v9 = 0LL;
        goto LABEL_12;
      }

      [MEMORY[0x189612778] sharedDiag];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v14;
      [v7 trackAnomaly:@"SUCoreBorder_MSUPrepareUpdateWithMAAsset" forReason:@"prepare was successful with error" withResult:0 withError:v14];

      v9 = 0LL;
      goto LABEL_10;
    }
  }

  else
  {
    uint64_t v10 = MSUPrepareUpdateWithMAAsset();
    _SUCoreBorder_MSUFunctionAtEnd(@"MSUPrepareUpdateWithMAAsset", &v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = v11;
      LOBYTE(v10) = _SUCoreBorder_MSUSimulate(v11, v10, &v14);
    }

    if ((v10 & 1) != 0) {
      goto LABEL_3;
    }
  }

  v9 = v14;
  if (!v14)
  {
    [MEMORY[0x189612760] sharedCore];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 buildError:8804 underlying:0 description:@"MSUPrepareUpdateWithMAAsset was not successful (yet no error provided)"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  }

LABEL_12:
  return v9;
}

  return v9;
}

  return v6;
}
  v17 = -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
  if (v17)
  {
    v18 = objc_alloc(NSString);
    v19 = -[SUCoreDescriptor associatedSplatDescriptor](self, "associatedSplatDescriptor");
    [v19 productVersionExtra];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = [v18 initWithFormat:@"%@ %@", v4, v20];

    id v4 = (__CFString *)v21;
  }

  [MEMORY[0x189612770] sharedDevice];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[SUCoreDescriptor productBuildVersion](self, "productBuildVersion");
  if (!v23) {
    goto LABEL_18;
  }
  v24 = (void *)v23;
  v25 = objc_alloc(MEMORY[0x189612768]);
  v26 = (void *)[v25 initWithProjectName:*MEMORY[0x189612850]];
  v27 = [v26 getBoolConfigForKey:*MEMORY[0x189612808]];

  if ((v27 & 1) == 0)
  {
    v28 = objc_alloc(NSString);
    v22 = -[SUCoreDescriptor productBuildVersion](self, "productBuildVersion");
    v29 = [v28 initWithFormat:@"%@ (%@)", v4, v22];

    id v4 = (__CFString *)v29;
LABEL_18:
  }

  return (NSString *)v4;
}

    v72 = v13;
    v74 = v10;
    v42 = objc_alloc(NSString);
    updateUUID = v15->_updateUUID;
    [MEMORY[0x189612770] sharedDevice];
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    [v44 buildVersion];
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[SUCoreDescriptor productBuildVersion](v15->_updateDescriptor, "productBuildVersion");
    v47 = -[SUCoreDescriptor releaseType](v15->_updateDescriptor, "releaseType");
    v48 = -[SUCoreDescriptor fullReplacement](v15->_updateDescriptor, "fullReplacement");
    v49 = @"incr";
    if (v48) {
      v49 = @"full";
    }
    v73 = v28;
    v50 = [v42 initWithFormat:@"UUID(%@) %@(%@)->%@(%@) %@", updateUUID, v45, v28, v46, v47, v49];
    updateName = v15->_updateName;
    v15->_updateName = (NSString *)v50;
    v52 = -[SUCoreUpdate updateDescriptor](v15, "updateDescriptor");
    if ([v52 descriptorType] != 1)
    {
      v53 = -[SUCoreUpdate updateDescriptor](v15, "updateDescriptor");
      if ([v53 descriptorType] != 3)
      {
        v67 = -[SUCoreUpdate updateDescriptor](v15, "updateDescriptor");
        v68 = [v67 descriptorType];

        if (v68 != 5)
        {
          [MEMORY[0x1896127A0] sharedLogger];
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          [v69 oslog];
          v70 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          v13 = v72;
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_187A54000,  v70,  OS_LOG_TYPE_DEFAULT,  "[Update] Descriptor type does not indicate SUCoreDescriptorTypeAsset or SUCoreDescriptorTypeSFRAsset or SU CoreDescriptorTypeSplatAsset, no SUCoreUpdateDownloader instance will be initialized",  buf,  2u);
          }

          downloadControl = v15->_downloadControl;
          v15->_downloadControl = 0LL;
          goto LABEL_19;
        }
}

id SUCoreBorder_MSUPrepareUpdate(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v14 = 0LL;
  _SUCoreBorder_MSUFunctionAtBegin(@"MSUPrepareUpdate", &v14);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (v5)
  {
    if (_SUCoreBorder_MSUSimulate(v5, 1LL, &v14))
    {
LABEL_3:
      if (!v14)
      {
        v9 = 0LL;
        goto LABEL_12;
      }

      [MEMORY[0x189612778] sharedDiag];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v14;
      [v7 trackAnomaly:@"SUCoreBorder_MSUPrepareUpdate" forReason:@"prepare was successful with error" withResult:0 withError:v14];

      v9 = 0LL;
      goto LABEL_10;
    }
  }

  else
  {
    uint64_t v10 = MSUPrepareUpdate();
    _SUCoreBorder_MSUFunctionAtEnd(@"MSUPrepareUpdate", &v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = v11;
      LOBYTE(v10) = _SUCoreBorder_MSUSimulate(v11, v10, &v14);
    }

    if ((v10 & 1) != 0) {
      goto LABEL_3;
    }
  }

  v9 = v14;
  if (!v14)
  {
    [MEMORY[0x189612760] sharedCore];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 buildError:8804 underlying:0 description:@"MSUPrepareUpdate was not successful (yet no error provided)"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  }

id SUCoreBorder_MSUApplyUpdate(uint64_t a1, void *a2)
{
  id v2 = a2;
  v12 = 0LL;
  _SUCoreBorder_MSUFunctionAtBegin(@"MSUApplyUpdate", &v12);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (!v3)
  {
    uint64_t v8 = MSUApplyUpdate();
    _SUCoreBorder_MSUFunctionAtEnd(@"MSUApplyUpdate", &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      uint64_t v10 = v9;
      LOBYTE(v8) = _SUCoreBorder_MSUSimulate(v9, v8, &v12);
    }

    if ((v8 & 1) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    v7 = v12;
    goto LABEL_10;
  }

id SUCoreBorder_MSUSuspendUpdate()
{
  v9 = 0LL;
  _SUCoreBorder_MSUFunctionAtBegin(@"MSUSuspendUpdate", &v9);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (!v0)
  {
    uint64_t v5 = MSUSuspendUpdate();
    _SUCoreBorder_MSUFunctionAtEnd(@"MSUSuspendUpdate", &v9);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      LOBYTE(v5) = _SUCoreBorder_MSUSimulate(v6, v5, &v9);
    }

    if ((v5 & 1) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    id v4 = v9;
    goto LABEL_10;
  }

id SUCoreBorder_MSUPurgeSuspendedUpdate()
{
  v9 = 0LL;
  _SUCoreBorder_MSUFunctionAtBegin(@"MSUPurgeSuspendedUpdate", &v9);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (!v0)
  {
    uint64_t v5 = MSUPurgeSuspendedUpdate();
    _SUCoreBorder_MSUFunctionAtEnd(@"MSUPurgeSuspendedUpdate", &v9);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      LOBYTE(v5) = _SUCoreBorder_MSUSimulate(v6, v5, &v9);
    }

    if ((v5 & 1) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    id v4 = v9;
    goto LABEL_10;
  }

id SUCoreBorder_MSUResumeUpdateWithOptions(void *a1)
{
  id v1 = a1;
  v11 = 0LL;
  _SUCoreBorder_MSUFunctionAtBegin(@"MSUResumeUpdateWithOptions", &v11);
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = v2;
  if (!v2)
  {
    uint64_t v7 = MSUResumeUpdateWithOptions();
    _SUCoreBorder_MSUFunctionAtEnd(@"MSUResumeUpdateWithOptions", &v11);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      LOBYTE(v7) = _SUCoreBorder_MSUSimulate(v8, v7, &v11);
    }

    if ((v7 & 1) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v6 = v11;
    goto LABEL_10;
  }

id SUCoreBorder_MSUBrainIsLoadable(void *a1)
{
  id v1 = a1;
  v11 = 0LL;
  _SUCoreBorder_MSUFunctionAtBegin(@"MSUUpdateBrainIsLoadable", &v11);
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = v2;
  if (!v2)
  {
    uint64_t IsLoadable = MSUBrainIsLoadable();
    _SUCoreBorder_MSUFunctionAtEnd(@"MSUUpdateBrainIsLoadable", &v11);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      LOBYTE(IsLoadable) = _SUCoreBorder_MSUSimulate(v8, IsLoadable, &v11);
    }

    if ((IsLoadable & 1) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v6 = v11;
    goto LABEL_10;
  }

id SUCoreBorder_MSUAssetCalculatePrepareSize(void *a1)
{
  id v1 = a1;
  v11 = 0LL;
  _SUCoreBorder_MSUFunctionAtBegin(@"MSUAssetCalculatePrepareSize", &v11);
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = v2;
  if (!v2)
  {
    uint64_t v7 = MSUAssetCalculatePrepareSize();
    _SUCoreBorder_MSUFunctionAtEnd(@"MSUAssetCalculatePrepareSize", &v11);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      LOBYTE(v7) = _SUCoreBorder_MSUSimulate(v8, v7, &v11);
    }

    if ((v7 & 1) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v6 = v11;
    goto LABEL_10;
  }

id SUCoreBorder_MSUAssetCalculateApplySize(void *a1)
{
  id v1 = a1;
  v11 = 0LL;
  _SUCoreBorder_MSUFunctionAtBegin(@"MSUAssetCalculateApplySize", &v11);
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = v2;
  if (!v2)
  {
    uint64_t v7 = MSUAssetCalculateApplySize();
    _SUCoreBorder_MSUFunctionAtEnd(@"MSUAssetCalculateApplySize", &v11);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      LOBYTE(v7) = _SUCoreBorder_MSUSimulate(v8, v7, &v11);
    }

    if ((v7 & 1) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v6 = v11;
    goto LABEL_10;
  }

uint64_t SUCoreBorder_MSURetrievePreviousUpdateState()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  id v1 = v0;
  if (v0)
  {
    uint64_t updated = _SUCoreBorder_MSUSimulate(v0, 1LL, 0LL);
  }

  else
  {
    uint64_t updated = MSURetrievePreviousUpdateState();
    _SUCoreBorder_MSUFunctionAtEnd(@"MSURetrievePreviousUpdateState", 0LL);
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    id v4 = v3;
    if (v3) {
      uint64_t updated = _SUCoreBorder_MSUSimulate(v3, updated, 0LL);
    }
  }

  return updated;
}

id SUCoreBorder_MSUGetUpdateInfo(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  _SUCoreBorder_MSUFunctionAtBegin(@"MSUGetUpdateInfo", 0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (v5)
  {
    _SUCoreBorder_MSUGetUpdateInfo(v5);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    MSUGetUpdateInfo();
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    _SUCoreBorder_MSUFunctionAtEnd(@"MSUGetUpdateInfo", 0LL);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      uint64_t v10 = _SUCoreBorder_MSUGetUpdateInfo(v8);

      uint64_t v7 = (void *)v10;
    }
  }

  return v7;
}

id _SUCoreBorder_MSUGetUpdateInfo(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 simAction];
  if (v2 == 1)
  {
    uint64_t v5 = 0LL;
  }

  else
  {
    if (v2 == 3)
    {
      id v3 = (void *)MEMORY[0x189603F68];
      [v1 updateInfoPlist];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 dictionaryWithContentsOfFile:v4];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [MEMORY[0x189612778] sharedDiag];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event action, event: %@", v1];
      [v4 trackAnomaly:@"_SUCoreBorder_MSUGetUpdateInfo" forReason:v6 withResult:8113 withError:0];

      uint64_t v5 = 0LL;
    }
  }

  return v5;
}

id SUCoreBorder_MSUCommitStash(void *a1)
{
  id v1 = a1;
  v11 = 0LL;
  _SUCoreBorder_MSUFunctionAtBegin(@"MSUCommitStash", &v11);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = v2;
  if (!v2)
  {
    uint64_t v7 = MSUCommitStash();
    _SUCoreBorder_MSUFunctionAtEnd(@"MSUCommitStash", 0LL);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      LOBYTE(v7) = _SUCoreBorder_MSUSimulate(v8, v7, &v11);
    }

    if ((v7 & 1) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v6 = v11;
    goto LABEL_10;
  }

id SUCoreBorder_MSURollbackUpdatePrepare(uint64_t a1, void *a2)
{
  id v2 = a2;
  v12 = 0LL;
  _SUCoreBorder_MSUFunctionAtBegin(@"MSURollbackUpdatePrepare", &v12);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (!v3)
  {
    uint64_t v8 = MSUPrepareUpdate();
    _SUCoreBorder_MSUFunctionAtEnd(@"MSURollbackUpdatePrepare", &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      uint64_t v10 = v9;
      LOBYTE(v8) = _SUCoreBorder_MSUSimulate(v9, v8, &v12);
    }

    if ((v8 & 1) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v7 = v12;
    goto LABEL_10;
  }

id SUCoreBorder_MSURollbackUpdateSuspend()
{
  v9 = 0LL;
  _SUCoreBorder_MSUFunctionAtBegin(@"MSURollbackUpdateSuspend", &v9);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  id v1 = v0;
  if (!v0)
  {
    uint64_t v5 = MSUSuspendUpdate();
    _SUCoreBorder_MSUFunctionAtEnd(@"MSURollbackUpdateSuspend", &v9);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      uint64_t v7 = v6;
      LOBYTE(v5) = _SUCoreBorder_MSUSimulate(v6, v5, &v9);
    }

    if ((v5 & 1) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    id v4 = v9;
    goto LABEL_10;
  }

id SUCoreBorder_MSURollbackUpdateResumeWithOptions(void *a1)
{
  id v1 = a1;
  v11 = 0LL;
  _SUCoreBorder_MSUFunctionAtBegin(@"MSURollbackUpdateResume", &v11);
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = v2;
  if (!v2)
  {
    uint64_t v7 = MSUResumeUpdateWithOptions();
    _SUCoreBorder_MSUFunctionAtEnd(@"MSURollbackUpdateResume", &v11);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      LOBYTE(v7) = _SUCoreBorder_MSUSimulate(v8, v7, &v11);
    }

    if ((v7 & 1) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v6 = v11;
    goto LABEL_10;
  }

id SUCoreBorder_MSURollbackUpdateApply(uint64_t a1, void *a2)
{
  id v2 = a2;
  v12 = 0LL;
  _SUCoreBorder_MSUFunctionAtBegin(@"MSURollbackUpdateApply", &v12);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (!v3)
  {
    uint64_t v8 = MSUApplyUpdate();
    _SUCoreBorder_MSUFunctionAtEnd(@"MSURollbackUpdateApply", &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      uint64_t v10 = v9;
      LOBYTE(v8) = _SUCoreBorder_MSUSimulate(v9, v8, &v12);
    }

    if ((v8 & 1) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v7 = v12;
    goto LABEL_10;
  }

uint64_t _SUCoreBorder_MSUSetSimulatedError(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = v3;
  if (a2)
  {
    if (*(void *)a2)
    {
      a2 = 0LL;
    }

    else
    {
      *(void *)a2 = [v3 buildErrorWithDescription:@"_SUCoreBorder_MSUSetSimulatedError"];
      a2 = 1LL;
    }
  }

  return a2;
}

LABEL_11:
    [MEMORY[0x189612760] sharedCore];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 completionQueue];
    v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __150__MSUUpdateBrainAssetLoader_SUCoreBorderMSUUpdateBrainAssetLoader__SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_255;
    block[3] = &unk_18A0EF8F8;
    v25 = (os_log_s *)v10;
    v23 = v15;
    v24 = v14;
    dispatch_async(v21, block);

    v17 = v25;
LABEL_12:

    goto LABEL_13;
  }

  v26[0] = MEMORY[0x1895F87A8];
  v26[1] = 3221225472LL;
  v26[2] = __150__MSUUpdateBrainAssetLoader_SUCoreBorderMSUUpdateBrainAssetLoader__SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke;
  v26[3] = &unk_18A0EF920;
  v27 = v10;
  [a1 loadUpdateBrainWithMAOptions:v8 clientOptionsFromPolicy:v9 progressHandler:v26];
  v15 = v27;
LABEL_13:
}

  return v4;
}

  return v4;
}

  return v7;
}
}

LABEL_15:
}

  [MEMORY[0x189604030] fileURLWithPath:v8];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    [v23 URLByDeletingLastPathComponent];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 path];
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x1896078A8] defaultManager];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = [v27 fileExistsAtPath:v26];

    if ((v28 & 1) == 0)
    {
      [MEMORY[0x1896078A8] defaultManager];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0LL;
      [v29 createDirectoryAtPath:v26 withIntermediateDirectories:1 attributes:0 error:&v41];
      v30 = v41;

      if (v30)
      {
        [MEMORY[0x1896127A0] sharedLogger];
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        [v31 oslog];
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          [v24 path];
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v43 = v33;
          v44 = 2114;
          v45 = v30;
          _os_log_impl( &dword_187A54000,  v32,  OS_LOG_TYPE_DEFAULT,  "Error creating persisted state file %{public}@: %{public}@",  buf,  0x16u);
        }
      }
    }

    v34 = objc_alloc(MEMORY[0x1896127B0]);
    stateQueue = self->_stateQueue;
    [v24 path];
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (SUCorePersistedState *)[v34 initWithDispatchQueue:stateQueue withPersistencePath:v36 forPolicyVersion:@"1.0"];
    persistedState = self->_persistedState;
    self->_persistedState = v37;

    v39 = self->_stateQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __40__SUCoreRollback_loadPersistedStateFile__block_invoke;
    block[3] = &unk_18A0EF970;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)v39, block);
  }
}

  [v4 objectForKey:*v5];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = +[SUCoreDDMUtilities sharedLogger](&OBJC_CLASS___SUCoreDDMUtilities, "sharedLogger");
  [v16 oslog];
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *v5;
      *(_DWORD *)buf = 136315394;
      v23 = "-[SUCorePolicyDDMConfiguration invalidateDeclarationForKey:]_block_invoke";
      v24 = 2114;
      v25 = v18;
      _os_log_impl( &dword_187A54000,  v17,  OS_LOG_TYPE_DEFAULT,  "%s: The declaration is already invalid for %{public}@",  buf,  0x16u);
    }

    goto LABEL_19;
  }

  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    __60__SUCorePolicyDDMConfiguration_invalidateDeclarationForKey___block_invoke_cold_1();
  }

LABEL_20:
}

  [v6 locatedAsset];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 attributes];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = [v25 safeStringForKey:@"ConfigurationPlist"];
  v27 = (void *)v26;
  v28 = @"Configuration.plist";
  if (v26) {
    v28 = (__CFString *)v26;
  }
  v29 = v28;

  [v6 locatedAsset];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = [v30 getLocalUrl];
  [(id)v31 path];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  [v32 stringByAppendingPathComponent:v29];
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896078A8] defaultManager];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v31) = [v34 fileExistsAtPath:v33];

  if ((v31 & 1) != 0)
  {
    [MEMORY[0x189603F68] dictionaryWithContentsOfFile:v33];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    [v35 safeObjectForKey:@"Projects" ofClass:objc_opt_class()];
    v36 = (id)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896127A0] sharedLogger];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v37 oslog];
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v55 = v36;
      _os_log_impl( &dword_187A54000,  v38,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] Adjust: Updating configuration for projects: %{public}@",  buf,  0xCu);
    }

    [v36 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_352];
    -[SUCoreConfigServer _stateSafeInformDelegatesOfConfiguration:error:]( self,  "_stateSafeInformDelegatesOfConfiguration:error:",  v35,  0LL);
    -[SUCoreConfigServer _stateSafeSendInstalledEventWithSuccess:error:]( self,  "_stateSafeSendInstalledEventWithSuccess:error:",  1LL,  0LL);
    v59 = @"com.apple.MobileAsset.SoftwareUpdateConfiguration";
    [v6 locatedAsset];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    [v39 assetId];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v40;
    [MEMORY[0x189603F18] arrayWithObjects:&v58 count:1];
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v41;
    [MEMORY[0x189603F68] dictionaryWithObjects:v60 forKeys:&v59 count:1];
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x1896127A0] sharedLogger];
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    [v43 oslog];
    v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(&unk_18A112718, "componentsJoinedByString:", @", ");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v45;
      v56 = 2114;
      v57 = v42;
      _os_log_impl( &dword_187A54000,  v44,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] Purge: Purging all assets (via MAPurgeAllExceptGivenIds) of type %{public}@ except: %{public}@",  buf,  0x16u);
    }

    MAPurgeAllExceptGivenIds();
    v46 = -[SUCoreConfigServer stateMachine](self, "stateMachine");
    v47 = objc_alloc_init(&OBJC_CLASS___SUCoreConfigParam);
    [v46 postEvent:@"ConfigPhaseComplete" withInfo:v47];

    v23 = 0LL;
  }

  else
  {
    [NSString stringWithFormat:@"Asset configuration plist does not exist at expected path: %@", v33];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189612760] sharedCore];
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    [v48 buildError:8125 underlying:0 description:v35];
    v36 = (id)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x1896127A0] sharedLogger];
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    [v49 oslog];
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConfigServer actionConfigAdjustSettings:error:].cold.1();
    }
    v51 = -[SUCoreConfigServer stateMachine](self, "stateMachine");
    v52 = -[SUCoreConfigParam initWithError:operation:]( objc_alloc(&OBJC_CLASS___SUCoreConfigParam),  "initWithError:operation:",  v36,  3LL);
    [v51 followupEvent:@"ConfigPhaseFailed" withInfo:v52];

    if (a4)
    {
      v36 = v36;
      *a4 = v36;
    }

    v23 = 8406LL;
  }

  v18 = 0LL;
LABEL_29:

  return v23;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

LABEL_42:
              uint64_t v7 = v92;
LABEL_43:

              uint64_t v8 = v91;
              goto LABEL_44;
            }

            [v85 addObject:v10];
            [MEMORY[0x1896127A0] sharedLogger];
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            [v47 oslog];
            v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

            if (!os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_42;
            }
            *(_DWORD *)buf = 138543874;
            v106 = v24;
            v107 = 2114;
            v108 = (const char *)v12;
            v109 = 2114;
            v110 = @"YES";
            v30 = (os_log_s *)v29;
            v31 = "[POLICY] filtering revoked asset by restore version, restoreVersion=%{public}@, releaseType=%{public}@"
                  " | keep=%{public}@";
          }

          else
          {
            [MEMORY[0x1896127A0] sharedLogger];
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            [v38 oslog];
            v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

            if (!os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
            {
              self = v90;
              goto LABEL_42;
            }

            *(_DWORD *)buf = 138543874;
            self = v90;
            v106 = v90;
            v107 = 2114;
            v108 = (const char *)v93;
            v109 = 2114;
            v110 = v25;
            v30 = (os_log_s *)v29;
            v31 = "%{public}@ Incomparable RestoreVersion. Skipping asset for installedSplatRestoreVersion=%{public}@ tar"
                  "getSplatRestoreVersion=%{public}@";
          }

  return v8;
}

LABEL_43:
        goto LABEL_44;
      }
    }

LABEL_19:
          _os_log_impl(&dword_187A54000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, 0x20u);
          goto LABEL_42;
        }

        [MEMORY[0x1896127A0] sharedLogger];
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        [v35 oslog];
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v7 = v92;
        if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
        {
          [MEMORY[0x189612770] sharedDevice];
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          [v36 releaseType];
          v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v106 = self;
          v107 = 2114;
          v108 = (const char *)v12;
          v109 = 2114;
          v110 = v37;
          _os_log_impl( &dword_187A54000,  (os_log_t)v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Incompatible asset ReleaseType: %{public}@ Device ReleaseType: %{public}@",  buf,  0x20u);
        }

        goto LABEL_43;
      }

      [MEMORY[0x1896127A0] sharedLogger];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v32 oslog];
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v106 = self;
        v107 = 2112;
        v108 = v34;
        _os_log_impl( &dword_187A54000,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Unexpected type in MobileAsset asset array: %@",  buf,  0x16u);
      }

    v15 = 0;
LABEL_31:

    return v15;
  }

  return 0;
}

    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"ma.AlterDownloadOptions"];
    return;
  }

  if (*(void *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAlterDownloadCompletion:");
    [*(id *)(a1 + 32) setAlterDownloadTransaction:*(void *)(a1 + 40)];
  }

  else
  {
    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"ma.AlterDownloadOptions"];
  }

  [*v2 desiredDownloadConfig];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    [*(id *)(a1 + 32) requestedDownloadConfig];
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = *(void *)(a1 + 48);
    v25 = *(void **)(a1 + 32);
    if (!v23)
    {
      [v25 currentDownloadConfig];
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = +[SUCoreMobileAsset downloadConfig:isEqualToConfig:]( &OBJC_CLASS___SUCoreMobileAsset,  "downloadConfig:isEqualToConfig:",  v24,  v36);

      if (v37)
      {
        v38 = objc_alloc(NSString);
        [*v2 currentDownloadConfig];
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = +[SUCoreMobileAsset downloadConfigSummary:](&OBJC_CLASS___SUCoreMobileAsset, "downloadConfigSummary:", v39);
        v43 = (id)[v38 initWithFormat:@"alter download config when currently at expressed config (%@)", v40];

        [*v2 _issueAlterDownloadCompletion:0 forReason:v43];
      }

      else
      {
        [*(id *)(a1 + 32) _requestChangeConfigDownload:*(void *)(a1 + 48)];
      }

      return;
    }

    [v25 requestedDownloadConfig];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = +[SUCoreMobileAsset downloadConfig:isEqualToConfig:]( &OBJC_CLASS___SUCoreMobileAsset,  "downloadConfig:isEqualToConfig:",  v24,  v26);

    if (v27)
    {
      [MEMORY[0x1896127A0] sharedLogger];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 oslog];
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = *v2;
        [v30 requestedDownloadConfig];
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = +[SUCoreMobileAsset downloadConfigSummary:](&OBJC_CLASS___SUCoreMobileAsset, "downloadConfigSummary:", v31);
        *(_DWORD *)buf = 138543618;
        v57 = v30;
        v58 = 2114;
        v59 = v32;
        v33 = "%{public}@ alter download config to same as being requested (%{public}@)";
LABEL_36:
        _os_log_impl(&dword_187A54000, v29, OS_LOG_TYPE_DEFAULT, v33, buf, 0x16u);
      }
    }

    else
    {
      [*(id *)(a1 + 32) setDesiredDownloadConfig:*(void *)(a1 + 48)];
      [MEMORY[0x1896127A0] sharedLogger];
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      [v41 oslog];
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v42 = *v2;
        [v42 desiredDownloadConfig];
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = +[SUCoreMobileAsset downloadConfigSummary:](&OBJC_CLASS___SUCoreMobileAsset, "downloadConfigSummary:", v31);
        *(_DWORD *)buf = 138543618;
        v57 = v42;
        v58 = 2114;
        v59 = v32;
        v33 = "%{public}@ alter download config to different than being requested | remembering desired (%{public}@)";
        goto LABEL_36;
      }
    }

LABEL_20:
  v33 = (void *)MEMORY[0x189612760];
  v34 = -[SUCoreMobileAsset downloadAssetTransaction](self, "downloadAssetTransaction", v36, v37, v38, v39);
  [v33 endTransaction:v34 withName:@"ma.DownloadAsset"];

  -[SUCoreMobileAsset setDownloadAssetTransaction:](self, "setDownloadAssetTransaction:", 0LL);
}

LABEL_44:
      ++v9;
    }

    while (v7 != v9);
    uint64_t v7 = [v5 countByEnumeratingWithState:&v100 objects:v117 count:16];
  }

  while (v7);
LABEL_46:

  v54 = objc_alloc(MEMORY[0x189612768]);
  v55 = (void *)[v54 initWithProjectName:*MEMORY[0x189612850]];
  [v55 getStringConfigForKey:*MEMORY[0x189612820]];
  v56 = (char *)objc_claimAutoreleasedReturnValue();

  if (v56) {
    goto LABEL_57;
  }
  v57 = objc_alloc_init(MEMORY[0x189603FA8]);
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v58 = v86;
  v59 = [v58 countByEnumeratingWithState:&v96 objects:v104 count:16];
  if (v59)
  {
    v60 = v59;
    v61 = *(void *)v97;
    do
    {
      for (i = 0LL; i != v60; ++i)
      {
        if (*(void *)v97 != v61) {
          objc_enumerationMutation(v58);
        }
        [*(id *)(*((void *)&v96 + 1) + 8 * i) attributes];
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        [v63 safeStringForKey:@"ProductVersionExtra"];
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        if (v64) {
          [v57 addObject:v64];
        }
      }

      v60 = [v58 countByEnumeratingWithState:&v96 objects:v104 count:16];
    }

    while (v60);
  }

  [v57 sortedArrayUsingSelector:sel_compare_];
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 lastObject];
  v56 = (char *)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = v87;
  v66 = v90;
  if (v56)
  {
LABEL_57:
    [MEMORY[0x1896127A0] sharedLogger];
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    [v67 oslog];
    v68 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      v69 = [v86 count];
      *(_DWORD *)buf = 134218242;
      v106 = (SUCorePolicyExtensionSplatUpdate *)v69;
      v107 = 2114;
      v108 = v56;
      _os_log_impl( &dword_187A54000,  v68,  OS_LOG_TYPE_DEFAULT,  "[POLICY] %lu update assets before filtering for productVersionExtra=%{public}@",  buf,  0x16u);
    }

    v70 = (void *)MEMORY[0x1896079C8];
    v94[0] = MEMORY[0x1895F87A8];
    v94[1] = 3221225472LL;
    v94[2] = __67__SUCorePolicyExtensionSplatUpdate_filterSoftwareUpdateAssetArray___block_invoke;
    v94[3] = &unk_18A0EF9C0;
    v56 = v56;
    v95 = v56;
    [v70 predicateWithBlock:v94];
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    [v86 filteredArrayUsingPredicate:v71];
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = (id)[v72 mutableCopy];
    [MEMORY[0x1896127A0] sharedLogger];
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    [v73 oslog];
    v74 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      v75 = [v58 count];
      *(_DWORD *)buf = 134218242;
      v106 = (SUCorePolicyExtensionSplatUpdate *)v75;
      v107 = 2114;
      v108 = v56;
      _os_log_impl( &dword_187A54000,  v74,  OS_LOG_TYPE_DEFAULT,  "[POLICY] %lu update assets left after filtering for productVersionExtra=%{public}@",  buf,  0x16u);
    }

    v66 = v90;
  }

  if (![v58 count])
  {
    v79 = [v85 count];
    [MEMORY[0x1896127A0] sharedLogger];
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    [v80 oslog];
    v77 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    v81 = os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT);
    if (v79)
    {
      if (v81)
      {
        *(_DWORD *)buf = 138543618;
        v106 = v90;
        v107 = 2082;
        v108 = "-[SUCorePolicyExtensionSplatUpdate filterSoftwareUpdateAssetArray:]";
        v82 = "%{public}@ %{public}s - Returning splat rollback";
LABEL_71:
        _os_log_impl(&dword_187A54000, v77, OS_LOG_TYPE_DEFAULT, v82, buf, 0x16u);
      }
    }

    else if (v81)
    {
      *(_DWORD *)buf = 138543618;
      v106 = v90;
      v107 = 2082;
      v108 = "-[SUCorePolicyExtensionSplatUpdate filterSoftwareUpdateAssetArray:]";
      v82 = "%{public}@ %{public}s - Returning empty asset set";
      goto LABEL_71;
    }

    v78 = v85;
    goto LABEL_73;
  }

  [MEMORY[0x1896127A0] sharedLogger];
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  [v76 oslog];
  v77 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v106 = v66;
    v107 = 2082;
    v108 = "-[SUCorePolicyExtensionSplatUpdate filterSoftwareUpdateAssetArray:]";
    _os_log_impl( &dword_187A54000,  v77,  OS_LOG_TYPE_DEFAULT,  "%{public}@ %{public}s - Returning splat updates",  buf,  0x16u);
  }

  v78 = v58;
LABEL_73:

  v83 = v78;
  return v83;
}

LABEL_45:
      if (-[SUCoreUpdate targetPhase](self, "targetPhase") >= 9)
      {
        v68 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"after reaching rollback complete phase encountered invalid target phase(%ld)",  -[SUCoreUpdate targetPhase](self, "targetPhase"));
        -[SUCoreUpdate _trackUpdateAnomaly:result:description:]( self,  "_trackUpdateAnomaly:result:description:",  @"[REACHED_PHASE]",  8116LL,  v68);
        goto LABEL_50;
      }

      uint64_t v7 = kSU_E_RB_RollbackApplySuccess;
LABEL_47:
      v67 = *v7;
      if (!v67) {
        return;
      }
      v68 = v67;
      v69 = -[SUCoreUpdate updateFSM](self, "updateFSM");
      v70 = objc_alloc_init(&OBJC_CLASS___SUCoreUpdateParam);
      [v69 followupEvent:v68 withInfo:v70];

LABEL_50:
      return;
    case 4LL:
      goto LABEL_10;
    case 5LL:
      goto LABEL_20;
    case 6LL:
      goto LABEL_28;
    case 7LL:
      goto LABEL_36;
    case 8LL:
      goto LABEL_45;
    default:
      return;
  }

  return v12;
}

void SUCoreBorder_MAPurgeAll(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v11 = 0LL;
  v12 = (id *)&v11;
  uint64_t v13 = 0x3032000000LL;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  id v16 = 0LL;
  id obj = 0LL;
  _SUCoreBorder_MAFunctionAtBegin(@"MAPurgeAll", &obj);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v16, obj);
  if (v5)
  {
    uint64_t v6 = v12 + 5;
    v7[0] = v12[5];
    _SUCoreBorder_MASimulate(v5, v7);
    objc_storeStrong(v6, v7[0]);
    if (v4) {
      ((void (**)(id, id))v4)[2](v4, v12[5]);
    }
  }

  else
  {
    v7[1] = (id)MEMORY[0x1895F87A8];
    v7[2] = (id)3221225472LL;
    v7[3] = __SUCoreBorder_MAPurgeAll_block_invoke;
    v7[4] = &unk_18A0EF9E8;
    v9 = &v11;
    uint64_t v8 = v4;
    MAPurgeAll();
  }

  _Block_object_dispose(&v11, 8);
}

void sub_187A5AF0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

id _SUCoreBorder_MAFunctionAtBegin(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1896127C8];
  id v4 = a1;
  [v3 sharedSimulator];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 begin:@"ma" atFunction:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if ([v6 simAction] == 1)
    {
      _SUCoreBorder_MASetSimulatedError(v6, a2);
    }

    else if ([v6 simAction] == 3)
    {
      if (a2) {
        *a2 = 0LL;
      }
    }

    else
    {

      uint64_t v6 = 0LL;
    }
  }

  return v6;
}

id _SUCoreBorder_MAFunctionAtEnd(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1896127C8];
  id v4 = a1;
  [v3 sharedSimulator];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 end:@"ma" atFunction:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if ([v6 simAction] == 1)
    {
      _SUCoreBorder_MASetSimulatedError(v6, a2);
    }

    else if ([v6 simAction] == 3)
    {
      if (a2) {
        *a2 = 0LL;
      }
    }

    else
    {

      uint64_t v6 = 0LL;
    }
  }

  return v6;
}

void _SUCoreBorder_MASimulate(void *a1, void *a2)
{
  id v7 = a1;
  uint64_t v3 = [v7 simAction];
  if (v3 == 3)
  {
    id v4 = v7;
    if (a2) {
      *a2 = 0LL;
    }
  }

  else
  {
    if (v3 == 1)
    {
      _SUCoreBorder_MASetSimulatedError(v7, a2);
    }

    else
    {
      [MEMORY[0x189612778] sharedDiag];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event action, event: %@", v7];
      [v5 trackAnomaly:@"_SUCoreBorder_MASimulate" forReason:v6 withResult:8113 withError:0];
    }

    id v4 = v7;
  }
}

void _SUCoreBorder_MASetSimulatedError(void *a1, void *a2)
{
  id v3 = a1;
  if (a2 && !*a2)
  {
    id v4 = v3;
    [v3 buildErrorWithDescription:@"SUCoreError created by _SUCoreBorder_MASetSimulatedError"];
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = v4;
  }
}

uint64_t _isUpdateBrainAssetType(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"com.apple.MobileAsset.MobileSoftwareUpdate.UpdateBrain"] & 1) != 0
    || ([v1 isEqualToString:@"com.apple.MobileAsset.RecoveryOSUpdateBrain"] & 1) != 0)
  {
    uint64_t v2 = 1LL;
  }

  else
  {
    uint64_t v2 = [v1 isEqualToString:@"com.apple.MobileAsset.MobileSoftwareUpdate.MacUpdateBrain"];
  }

  return v2;
}

id _getNewUpdateBrainMAAssetAttributesDictionary(void *a1, void *a2, void *a3)
{
  v22[2] = *MEMORY[0x1895F89C0];
  int v20 = -272716322;
  uint64_t v5 = (objc_class *)MEMORY[0x189603F48];
  id v6 = a3;
  id v7 = a2;
  id v8 = a1;
  v9 = (void *)[[v5 alloc] initWithBytes:&v20 length:4];
  id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
  uint64_t v11 = (void *)MGCopyAnswer();
  else {
    uint64_t v12 = 20LL;
  }
  [MEMORY[0x189607968] numberWithInt:v12];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 setSafeObject:v13 forKey:@"_CompatibilityVersion"];

  [v10 setSafeObject:v7 forKey:@"Build"];
  [v10 setSafeObject:v6 forKey:@"AssetPurpose"];

  [v10 setSafeObject:@"zip" forKey:@"_CompressionAlgorithm"];
  [v10 setSafeObject:@"9999099099000000" forKey:@"_ContentVersion"];
  [v10 setSafeObject:@"https://xp.apple.com/report" forKey:@"_EventRecordingServiceURL"];
  [v10 setSafeObject:MEMORY[0x189604A88] forKey:@"_IsZipStreamable"];
  [v10 setSafeObject:@"2072" forKey:@"_MasteredVersion"];
  [v10 setSafeObject:v9 forKey:@"_Measurement"];
  [v10 setSafeObject:@"SHA-1" forKey:@"_MeasurementAlgorithm"];
  [MEMORY[0x189607968] numberWithLong:1234];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 setSafeObject:v14 forKey:@"_UnarchivedSize"];

  [MEMORY[0x189607968] numberWithLong:1234];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 setSafeObject:v15 forKey:@"_DownloadSize"];

  id v16 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v16 setSafeObject:v8 forKey:@"AssetType"];

  [v16 setSafeObject:@"SimulatedUpdateBrainAssetId" forKey:@"AssetId"];
  [MEMORY[0x189607968] numberWithLong:1];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 setSafeObject:v17 forKey:@"AssetState"];

  v21[0] = @"AssetProperties";
  v21[1] = @"AssetAddedProperties";
  v22[0] = v10;
  v22[1] = v16;
  [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:2];
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id _getNewSoftwareUpdateMAAssetAttributesDictionary( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  v49[2] = *MEMORY[0x1895F89C0];
  id v46 = a1;
  id v13 = a4;
  int v47 = -272716322;
  v14 = (objc_class *)MEMORY[0x189603F48];
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  id v19 = a2;
  int v20 = (void *)[[v14 alloc] initWithBytes:&v47 length:4];
  id v21 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v21 setSafeObject:v19 forKey:@"Build"];
  [v21 setSafeObject:v18 forKey:@"OSVersion"];

  [MEMORY[0x1896110F0] _translateBuildVersionToRestoreVersionTuple:v19];
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  [v21 setSafeObject:v22 forKey:@"RestoreVersion"];
  [v21 setSafeObject:v22 forKey:@"TargetBridgeUpdateVersion"];
  [v21 setSafeObject:v22 forKey:@"TargetSFRUpdateVersion"];
  [v21 setSafeObject:v13 forKey:@"ReleaseType"];
  [v21 setSafeObject:v17 forKey:@"PrerequisiteBuild"];

  [v21 setSafeObject:v16 forKey:@"PrerequisiteOSVersion"];
  [v21 setSafeObject:v15 forKey:@"AssetPurpose"];

  if (v13
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v13 containsString:@"Internal"] & 1) != 0)
  {
    v23 = @"PreRelease";
  }

  else
  {
    v23 = @"Release";
  }

  [v21 setSafeObject:v23 forKey:@"SUDocumentationID"];
  [v21 setSafeObject:@"SimulatedBaseURL" forKey:@"__BaseURL"];
  [v21 setSafeObject:@"SimulatedRelativePath" forKey:@"__RelativePath"];
  if ([v46 containsString:@"Documentation"])
  {
    [v21 setSafeObject:@"SimulatedDevice" forKey:@"Device"];
    [MEMORY[0x189607968] numberWithLong:1234];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 setSafeObject:v24 forKey:@"SUSLAVersionRequired"];
  }

  else
  {
    v24 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F18]),  "initWithObjects:",  @"SimulatedSupportedDeviceModels",  0);
    [v21 setSafeObject:v24 forKey:@"SupportedDeviceModels"];
    v25 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F18]),  "initWithObjects:",  @"SimulatedSupportedDevices",  0);
    [v21 setSafeObject:v25 forKey:@"SupportedDevices"];
    [v21 setSafeObject:@"SimulatedSystemName" forKey:@"SUProductSystemName"];
    [v21 setSafeObject:@"Apple Inc." forKey:@"SUPublisher"];
    [v21 setSafeObject:v20 forKey:@"RSEPDigest"];
    [v21 setSafeObject:v20 forKey:@"SEPDigest"];
    uint64_t v26 = MEMORY[0x189604A88];
    [v21 setSafeObject:MEMORY[0x189604A88] forKey:@"SUInstallTonightEnabled"];
    [v21 setSafeObject:v26 forKey:@"SUMultiPassEnabled"];
    [v21 setSafeObject:v26 forKey:@"SUConvReqd"];
    [v21 setSafeObject:@"1234" forKey:@"InstallationSize-Snapshot"];
    [v21 setSafeObject:@"1234" forKey:@"InstallationSize"];
    [MEMORY[0x189607968] numberWithLong:1234];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 setSafeObject:v27 forKey:@"MinimumSystemPartition"];

    [MEMORY[0x189607968] numberWithLong:1234];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 setSafeObject:v28 forKey:@"ActualMinimumSystemPartition"];

    [v21 setSafeObject:@"https://ns.itunes.apple.com/nowserving" forKey:@"__QueuingServiceURL"];
    [v21 setSafeObject:@"https://xp.apple.com/report" forKey:@"_EventRecordingServiceURL"];
    id v29 = objc_alloc_init(MEMORY[0x189603FC8]);
    [MEMORY[0x189607968] numberWithLong:80];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 setSafeObject:v30 forKey:@"8"];

    [MEMORY[0x189607968] numberWithLong:160];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 setSafeObject:v31 forKey:@"16"];

    [MEMORY[0x189607968] numberWithLong:320];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 setSafeObject:v32 forKey:@"32"];

    [MEMORY[0x189607968] numberWithLong:640];
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 setSafeObject:v33 forKey:@"64"];

    [MEMORY[0x189607968] numberWithLong:1280];
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 setSafeObject:v34 forKey:@"128"];

    [MEMORY[0x189607968] numberWithLong:1280];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 setSafeObject:v35 forKey:@"256"];

    [MEMORY[0x189607968] numberWithLong:1280];
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 setSafeObject:v36 forKey:@"512"];

    [MEMORY[0x189607968] numberWithLong:1280];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 setSafeObject:v37 forKey:@"768"];

    [MEMORY[0x189607968] numberWithLong:1280];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 setSafeObject:v38 forKey:@"1024"];

    [v21 setSafeObject:v29 forKey:@"SystemPartitionPadding"];
  }

  [v21 setSafeObject:v20 forKey:@"_Measurement"];
  [v21 setSafeObject:@"SHA-1" forKey:@"_MeasurementAlgorithm"];
  uint64_t v39 = MEMORY[0x189604A88];
  [v21 setSafeObject:MEMORY[0x189604A88] forKey:@"__CanUseLocalCacheServer"];
  [v21 setSafeObject:v39 forKey:@"_IsZipStreamable"];
  [v21 setSafeObject:@"NeverCollected" forKey:@"__AssetDefaultGarbageCollectionBehavior"];
  [MEMORY[0x189607968] numberWithLong:1234];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 setSafeObject:v40 forKey:@"_UnarchivedSize"];

  [MEMORY[0x189607968] numberWithLong:1234];
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 setSafeObject:v41 forKey:@"_DownloadSize"];

  [v21 setSafeObject:@"zip" forKey:@"_CompressionAlgorithm"];
  id v42 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v42 setSafeObject:v46 forKey:@"AssetType"];
  [v42 setSafeObject:@"SimulatedSoftwareUpdateAssetId" forKey:@"AssetId"];
  [MEMORY[0x189607968] numberWithLong:1];
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  [v42 setSafeObject:v43 forKey:@"AssetState"];

  v48[0] = @"AssetProperties";
  v48[1] = @"AssetAddedProperties";
  v49[0] = v21;
  v49[1] = v42;
  [MEMORY[0x189603F68] dictionaryWithObjects:v49 forKeys:v48 count:2];
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

id _getNewDocumentationMAAssetAttributesDictionary(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  v26[2] = *MEMORY[0x1895F89C0];
  int v24 = -272716322;
  v9 = (objc_class *)MEMORY[0x189603F48];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  id v14 = a1;
  id v15 = (void *)[[v9 alloc] initWithBytes:&v24 length:4];
  id v16 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v16 setSafeObject:v13 forKey:@"Build"];

  [v16 setSafeObject:v12 forKey:@"OSVersion"];
  [v16 setSafeObject:v11 forKey:@"SUDocumentationID"];

  [v16 setSafeObject:v10 forKey:@"AssetPurpose"];
  [v16 setSafeObject:v15 forKey:@"_Measurement"];
  [v16 setSafeObject:@"SHA-1" forKey:@"_MeasurementAlgorithm"];
  uint64_t v17 = MEMORY[0x189604A88];
  [v16 setSafeObject:MEMORY[0x189604A88] forKey:@"__CanUseLocalCacheServer"];
  [v16 setSafeObject:v17 forKey:@"_IsZipStreamable"];
  [v16 setSafeObject:@"NeverCollected" forKey:@"__AssetDefaultGarbageCollectionBehavior"];
  [MEMORY[0x189607968] numberWithLong:1234];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 setSafeObject:v18 forKey:@"_UnarchivedSize"];

  [MEMORY[0x189607968] numberWithLong:1234];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 setSafeObject:v19 forKey:@"_DownloadSize"];

  [v16 setSafeObject:@"zip" forKey:@"_CompressionAlgorithm"];
  id v20 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v20 setSafeObject:v14 forKey:@"AssetType"];

  [v20 setSafeObject:@"SimulatedDocAssetId" forKey:@"AssetId"];
  [MEMORY[0x189607968] numberWithLong:1];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 setSafeObject:v21 forKey:@"AssetState"];

  v25[0] = @"AssetProperties";
  v25[1] = @"AssetAddedProperties";
  v26[0] = v16;
  v26[1] = v20;
  [MEMORY[0x189603F68] dictionaryWithObjects:v26 forKeys:v25 count:2];
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

void OUTLINED_FUNCTION_0_0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t OUTLINED_FUNCTION_2()
{
  return objc_opt_class();
}

LABEL_8:
    goto LABEL_9;
  }

  id v8 = 0LL;
LABEL_9:
  -[SUCoreScan scanPolicy](self, "scanPolicy");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 constructSoftwareUpdateMAAssetQueryWithPurpose:v8];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreScan _incrementMobileAssetPending:](self, "_incrementMobileAssetPending:", @"QuerySUMetadata");
  if (v17)
  {
    -[SUCoreScan _trackScanBegin:withIdentifier:]( self,  "_trackScanBegin:withIdentifier:",  @"queryMetaDataWithError",  @"su");
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = __36__SUCoreScan_actionQuerySUMetadata___block_invoke;
    v27[3] = &unk_18A0F0288;
    v27[4] = self;
    v28 = v17;
    objc_msgSend(v28, "SUCoreBorder_queryMetaDataWithError:", v27);
  }

  else
  {
    id v18 = objc_alloc(NSString);
    -[SUCoreScan scanPolicy](self, "scanPolicy");
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 summary];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    id v21 = (void *)[v18 initWithFormat:@"failed to construct SU asset query from policy[%@]", v20];

    [MEMORY[0x189612760] sharedCore];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = 8100LL;
    [v22 buildError:8100 underlying:0 description:v21];
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreScan scanFSM](self, "scanFSM");
    int v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[SUCoreScanParam initWithResult:withError:]( objc_alloc(&OBJC_CLASS___SUCoreScanParam),  "initWithResult:withError:",  8100LL,  v23);
    [v24 postEvent:@"QueryMetadataFailed" withInfo:v25];
  }

  return v6;
}

    goto LABEL_9;
  }

  id v10 = 0LL;
LABEL_9:
  -[SUCoreScan scanPolicy](self, "scanPolicy");
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan activeDescriptor](self, "activeDescriptor");
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 documentationID];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 constructDocumentationMAAssetQueryWithDocID:v20 purpose:v10];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreScan _incrementMobileAssetPending:](self, "_incrementMobileAssetPending:", @"QueryDocMetadata");
  if (v21)
  {
    -[SUCoreScan _trackScanBegin:withIdentifier:]( self,  "_trackScanBegin:withIdentifier:",  @"queryMetaDataWithError",  @"doc");
    v33[0] = MEMORY[0x1895F87A8];
    v33[1] = 3221225472LL;
    v33[2] = __37__SUCoreScan_actionQueryDocMetadata___block_invoke;
    v33[3] = &unk_18A0F0288;
    v33[4] = self;
    v34 = v21;
    objc_msgSend(v34, "SUCoreBorder_queryMetaDataWithError:", v33);
  }

  else
  {
    v22 = objc_alloc(NSString);
    v23 = -[SUCoreScan activeDescriptor](self, "activeDescriptor");
    [v23 documentationID];
    int v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[SUCoreScan scanPolicy](self, "scanPolicy");
    [v25 summary];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)[v22 initWithFormat:@"failed to construct doc asset query for docID[%@] from policy[%@]", v24, v26];

    [MEMORY[0x189612760] sharedCore];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = 8100LL;
    [v28 buildError:8100 underlying:0 description:v27];
    id v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[SUCoreScan scanFSM](self, "scanFSM");
    v31 = -[SUCoreScanParam initWithResult:withError:]( objc_alloc(&OBJC_CLASS___SUCoreScanParam),  "initWithResult:withError:",  8100LL,  v29);
    [v30 postEvent:@"QueryMetadataFailed" withInfo:v31];
  }

  return v6;
}
  v9 = -[SUCoreDDMDeclaration declarationKey](v2, "declarationKey");
  id v10 = *(void **)(a1 + 40);
  id v21 = 0LL;
  v22 = 0LL;
  [v10 _getDeclarations:&v22 invalid:&v21];
  id v11 = v22;
  id v12 = v21;
  [v11 objectForKey:v9];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    +[SUCoreDDMUtilities sharedLogger](&OBJC_CLASS___SUCoreDDMUtilities, "sharedLogger");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 oslog];
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __62__SUCorePolicyDDMConfiguration_addDeclaration_returningError___block_invoke_cold_2();
    }
  }

  else
  {
    [v12 objectForKey:v9];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      +[SUCoreDDMUtilities sharedLogger](&OBJC_CLASS___SUCoreDDMUtilities, "sharedLogger");
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 oslog];
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __62__SUCorePolicyDDMConfiguration_addDeclaration_returningError___block_invoke_cold_1();
      }
    }

    else
    {
      [v11 setSafeObject:*(void *)(a1 + 32) forKey:v9];
      [*(id *)(a1 + 40) _persistValidDeclarations:v11];
      [*(id *)(a1 + 40) _persistState];
      +[SUCoreDDMUtilities sharedLogger](&OBJC_CLASS___SUCoreDDMUtilities, "sharedLogger");
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 oslog];
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "-[SUCorePolicyDDMConfiguration addDeclaration:returningError:]_block_invoke";
        uint64_t v26 = 2114;
        v27 = v2;
        _os_log_impl(&dword_187A54000, v15, OS_LOG_TYPE_DEFAULT, "%s: Adding %{public}@", buf, 0x16u);
      }
    }
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
LABEL_18:
}

LABEL_9:
  v98 = v14;
  [MEMORY[0x1896127A0] sharedLogger];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 oslog];
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  v97 = v12;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v96 = v8;
    id v21 = @"YES";
    v93 = v10;
    if (v98) {
      v22 = @"YES";
    }
    else {
      v22 = @"NO";
    }
    v23 = +[SUCoreDescriptor nameForDescriptorPreferredUpdateType:]( &OBJC_CLASS___SUCoreDescriptor,  "nameForDescriptorPreferredUpdateType:",  v18);
    if (!v100) {
      id v21 = @"NO";
    }
    +[SUCoreDescriptor nameForDescriptorPreferredUpdateType:]( &OBJC_CLASS___SUCoreDescriptor,  "nameForDescriptorPreferredUpdateType:",  v17);
    int v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v110 = self;
    v111 = 2112;
    v112 = (id)v22;
    id v10 = v93;
    v113 = 2114;
    v114 = (uint64_t)v23;
    v115 = 2112;
    v116 = v21;
    id v8 = v96;
    v117 = 2114;
    v118 = v24;
    _os_log_impl( &dword_187A54000,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [DUAL_AUDIENCE] assigning to descriptors (Default) promotedPrimary=%@ primaryPreferredType=%{public}@ a nd (Alternate) promotedAlternatePrimary=%@ alternatePreferredType=%{public}@",  buf,  0x34u);

    id v12 = v97;
  }

  -[SUCoreScanParam assignDescriptorAudienceType:descriptorPreferredUpdateType:assetAudienceUUID:]( v98,  "assignDescriptorAudienceType:descriptorPreferredUpdateType:assetAudienceUUID:",  1LL,  v18,  0LL);
  [v16 assignDescriptorAudienceType:1 descriptorPreferredUpdateType:v18 assetAudienceUUID:0];
  v25 = -[SUCoreScan alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
  -[SUCoreScanParam assignDescriptorAudienceType:descriptorPreferredUpdateType:assetAudienceUUID:]( v100,  "assignDescriptorAudienceType:descriptorPreferredUpdateType:assetAudienceUUID:",  2LL,  v17,  v25);

  -[SUCoreScan alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v102 assignDescriptorAudienceType:2 descriptorPreferredUpdateType:v17 assetAudienceUUID:v26];

  [v12 domain];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v27 isEqualToString:*MEMORY[0x189612928]])
  {
    v99 = v12;
    v30 = v100;
    v31 = 0x189612000LL;
LABEL_25:

    goto LABEL_27;
  }

  v28 = [v12 code];

  id v29 = v12;
  v30 = v100;
  v31 = 0x189612000uLL;
  if (v28 == 8406)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v32 oslog];
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[SUCoreScan _updateInterimScanResultForSlowReleaseWithPrimary:secondary:error:].cold.1();
    }

    v30 = 0LL;
    v99 = 0LL;
    v27 = v102;
    v102 = 0LL;
    goto LABEL_25;
  }

  v99 = v29;
LABEL_27:
  v35 = -[SUCoreScan scanPolicy](self, "scanPolicy");
  v36 = [v35 isSupervisedPolicy];

  if (v36)
  {
    v92 = v9;
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v103 = self;
    v37 = -[SUCoreScan scanPolicy](self, "scanPolicy");
    [v37 policyExtensions];
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v39 = [v38 countByEnumeratingWithState:&v104 objects:v108 count:16];
    if (v39)
    {
      v40 = v39;
      v101 = v30;
      v94 = v10;
      v95 = v16;
      v41 = 0LL;
      id v42 = 0LL;
      v43 = *(void *)v105;
      do
      {
        for (i = 0LL; i != v40; ++i)
        {
          if (*(void *)v105 != v43) {
            objc_enumerationMutation(v38);
          }
          v45 = *(void **)(*((void *)&v104 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            id v46 = [v45 requestedPMV];

            id v42 = [v45 mdmSoftwareUpdatePath];
            [MEMORY[0x1896127A0] sharedLogger];
            int v47 = (void *)objc_claimAutoreleasedReturnValue();
            [v47 oslog];
            v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              v49 = +[SUCorePolicyExtensionManagedUpdates nameForMDMSoftwareUpdatePath:]( &OBJC_CLASS___SUCorePolicyExtensionManagedUpdates,  "nameForMDMSoftwareUpdatePath:",  v42);
              *(_DWORD *)buf = 138543874;
              v110 = v103;
              v111 = 2112;
              v112 = v49;
              v113 = 2048;
              v114 = v42;
              _os_log_impl( &dword_187A54000,  v48,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [DUAL_AUDIENCE] Found SUCorePolicyExtensionManagedUpdates with mdmSoftwareUpdatePath: %@ (%ld)",  buf,  0x20u);
            }

            v41 = (void *)v46;
          }
        }

        v40 = [v38 countByEnumeratingWithState:&v104 objects:v108 count:16];
      }

      while (v40);

      if (v98)
      {
        v53 = v101;
        v38 = v102;
        v101 = v98;
        id v16 = v95;
        v9 = v92;
      }

      else
      {
        id v16 = v95;
        v9 = v92;
        if (v101 && v41)
        {
          [MEMORY[0x1896127A0] sharedLogger];
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          [v50 oslog];
          v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v110 = v103;
            _os_log_impl( &dword_187A54000,  v51,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [DUAL_AUDIENCE] MDM scan performed using a requested PMV with no primary update found, using al ternate update instead",  buf,  0xCu);
          }

          v52 = v102;
          v38 = 0LL;
          v53 = 0LL;
          id v16 = v52;
        }

        else
        {
          v53 = v101;
          v38 = v102;
          v101 = 0LL;
        }
      }

      if (v42 == 1)
      {
        v55 = v101;
        if (!-[SUCoreScanParam enableAlternateAssetAudience](v101, "enableAlternateAssetAudience") || v41)
        {
          v58 = v41;
        }

        else
        {
          [MEMORY[0x1896127A0] sharedLogger];
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          [v56 oslog];
          v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v110 = v103;
            _os_log_impl( &dword_187A54000,  v57,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [DUAL_AUDIENCE] MDM software update path indicates SUCoreMDMSoftwareUpdatePathSlow and primary update found with dual audiences enabled, dropping primary update",  buf,  0xCu);
          }

          v58 = 0LL;
          id v16 = 0LL;
          v55 = 0LL;
        }

        if (!v41 && v53)
        {
          [MEMORY[0x1896127A0] sharedLogger];
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          [v61 oslog];
          v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          id v10 = v94;
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v110 = v103;
            _os_log_impl( &dword_187A54000,  v62,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [DUAL_AUDIENCE] MDM software update path indicates SUCoreMDMSoftwareUpdatePathSlow and alternat e update found, using alternate update only",  buf,  0xCu);
          }

          v63 = v53;
          v64 = v38;

          v38 = 0LL;
          id v16 = v64;
          goto LABEL_77;
        }

        goto LABEL_72;
      }

      if (v41 || v42 != 2)
      {
        v58 = v41;
        id v10 = v94;
        v55 = v101;
        goto LABEL_73;
      }

      v55 = v101;
      if (!v53)
      {
        v58 = 0LL;
LABEL_72:
        id v10 = v94;
LABEL_73:
        if (v99 || v53 || v55)
        {
LABEL_78:
          v54 = v55;

          v102 = v38;
          v30 = v53;
          self = v103;
          v31 = 0x189612000uLL;
          if (v53) {
            goto LABEL_79;
          }
LABEL_87:
          v74 = -[SUCoreScanParam promoteAlternateUpdate](v54, "promoteAlternateUpdate");
          if (v30 && v74)
          {
            v75 = v54;
            [*(id *)(v31 + 1952) sharedLogger];
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            [v76 oslog];
            v77 = (os_log_s *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v110 = self;
              _os_log_impl( &dword_187A54000,  v77,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [DUAL_AUDIENCE] Primary descriptor indicates alternate updates should be promoted, swapping now",  buf,  0xCu);
            }

            v54 = v30;
            v30 = v75;

            v78 = v102;
            v102 = v16;
            id v16 = v78;
          }

          v79 = v54;
          goto LABEL_95;
        }

        [MEMORY[0x189612760] sharedCore];
        v64 = (id)objc_claimAutoreleasedReturnValue();
        [v64 buildError:8406 underlying:v97 description:@"Supervised device MDM restrictions resulted in no update found"];
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = 0LL;
LABEL_77:

        v53 = 0LL;
        v55 = v63;
        goto LABEL_78;
      }

      [MEMORY[0x1896127A0] sharedLogger];
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      [v59 oslog];
      v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      id v10 = v94;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v110 = v103;
        _os_log_impl( &dword_187A54000,  v60,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [DUAL_AUDIENCE] MDM software update path indicates SUCoreMDMSoftwareUpdatePathFast and alternate up date found, dropping alternate update",  buf,  0xCu);
      }

      v102 = 0LL;
      v53 = 0LL;
    }

    else
    {
      v53 = v30;
      v55 = v98;
    }

    v58 = 0LL;
    v38 = v102;
    goto LABEL_73;
  }

  v54 = v98;
  if (!v30) {
    goto LABEL_87;
  }
LABEL_79:
  [*(id *)(v31 + 1952) sharedLogger];
  v65 = v54;
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  [v66 oslog];
  v67 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  v68 = v65;
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    v69 = -[SUCoreScanParam promoteAlternateUpdate](v65, "promoteAlternateUpdate");
    v70 = @"NO";
    if (v69) {
      v70 = @"YES";
    }
    *(_DWORD *)buf = 138543618;
    v110 = self;
    v111 = 2114;
    v112 = (id)v70;
    _os_log_impl( &dword_187A54000,  v67,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [DUAL_AUDIENCE] Primary update and alternate update descriptors are equal, not returning alternate upda te (promoteAlternateUpdate=%{public}@)",  buf,  0x16u);
  }

  if (-[SUCoreScanParam promoteAlternateUpdate](v65, "promoteAlternateUpdate"))
  {
    v71 = v30;

    v72 = v102;
    v73 = v102;

    id v16 = v73;
    v68 = v71;
  }

  else
  {
    v72 = v102;
  }

  v79 = v68;
  -[SUCoreScanParam promoteAlternateUpdate](v68, "promoteAlternateUpdate");
  v102 = 0LL;
  v30 = 0LL;
LABEL_95:
  [*(id *)(v31 + 1952) sharedLogger];
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  [v80 oslog];
  v81 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  v82 = os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT);
  if (v99)
  {
    if (v82)
    {
      *(_DWORD *)buf = 138543362;
      v110 = self;
      _os_log_impl( &dword_187A54000,  v81,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [DUAL_AUDIENCE] An error was found while processing the scan for dual audience updates, not returning any updates",  buf,  0xCu);
    }

    v83 = v99;
    v79 = -[SUCoreScanParam initWithResult:withError:]( [SUCoreScanParam alloc],  "initWithResult:withError:",  [v99 code],  v99);
    -[SUCoreScan setInterimScanResult:](self, "setInterimScanResult:", v79);
  }

  else
  {
    if (v82)
    {
      *(_DWORD *)buf = 138543618;
      v110 = self;
      v111 = 2114;
      v112 = v79;
      _os_log_impl( &dword_187A54000,  v81,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [DUAL_AUDIENCE] promoted primary update: %{public}@",  buf,  0x16u);
    }

    [*(id *)(v31 + 1952) sharedLogger];
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    [v84 oslog];
    v85 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v110 = self;
      v111 = 2114;
      v112 = v16;
      _os_log_impl( &dword_187A54000,  v85,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [DUAL_AUDIENCE] promoted secondary update: %{public}@",  buf,  0x16u);
    }

    [*(id *)(v31 + 1952) sharedLogger];
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    [v86 oslog];
    v87 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v110 = self;
      v111 = 2114;
      v112 = v30;
      _os_log_impl( &dword_187A54000,  v87,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [DUAL_AUDIENCE] promoted alternate primary update: %{public}@",  buf,  0x16u);
    }

    [*(id *)(v31 + 1952) sharedLogger];
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    [v88 oslog];
    v89 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v110 = self;
      v111 = 2114;
      v112 = v102;
      _os_log_impl( &dword_187A54000,  v89,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [DUAL_AUDIENCE] promoted alternate secondary update: %{public}@",  buf,  0x16u);
    }

    v90 = -[SUCoreScanParam initWithMajorPrimaryDescriptor:majorSecondaryDescriptor:minorPrimaryDescriptor:minorSecondaryDescriptor:]( objc_alloc(&OBJC_CLASS___SUCoreScanParam),  "initWithMajorPrimaryDescriptor:majorSecondaryDescriptor:minorPrimaryDescriptor:minorSecondaryDescriptor:",  v79,  v16,  v30,  v102);
    -[SUCoreScan setInterimScanResult:](self, "setInterimScanResult:", v90);

    v83 = 0LL;
  }

LABEL_109:
}

  [v13 additionalServerParams];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  int v24 = v23;
  if (v23) {
    v25 = v23;
  }
  else {
    v25 = objc_alloc_init(MEMORY[0x189603FC8]);
  }
  id v29 = v25;

  [v29 setSafeObject:&unk_18A112528 forKey:@"ScanRequestCount"];
  if (-[SUCoreScan phase](self, "phase") >= 3) {
    [v29 setSafeObject:&unk_18A112540 forKey:@"ScanRequestCount"];
  }
  [v13 setAdditionalServerParams:v29];
  -[SUCoreScan _trackScanBegin:withIdentifier:]( self,  "_trackScanBegin:withIdentifier:",  @"startCatalogDownload",  v7);
  v30 = (void *)MEMORY[0x1896110E0];
  v37[0] = MEMORY[0x1895F87A8];
  v37[1] = 3221225472LL;
  v37[2] = __46__SUCoreScan__downloadCatalog_withIdentifier___block_invoke;
  v37[3] = &unk_18A0F0288;
  v37[4] = self;
  v38 = v7;
  objc_msgSend(v30, "SUCoreBorder_startCatalogDownload:options:completionWithError:", v6, v13, v37);

  v31 = 0LL;
LABEL_20:

  return v31;
}

LABEL_21:
}

  v63 = v15;
LABEL_26:

  return v63;
}

void sub_187A6E4D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

LABEL_4:
  [*(id *)(a1 + 32) scanFSM];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 postEvent:@"CatalogDownloadSuccess"];
LABEL_8:
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

LABEL_39:
                goto LABEL_40;
              }

              if (!v11) {
                goto LABEL_37;
              }
LABEL_40:

              v9 = (os_log_s *)((char *)v9 + 1);
            }

            id v14 = *(void **)(v10 + 2312);
            id v15 = objc_opt_class();
            v63 = 0LL;
            [v14 unarchivedObjectOfClass:v15 fromData:v13 error:&v63];
            id v16 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v17 = (os_log_s *)v63;
            if (v17)
            {
              [MEMORY[0x1896127A0] sharedLogger];
              id v18 = (void *)objc_claimAutoreleasedReturnValue();
              [v18 oslog];
              id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v65 = v17;
                _os_log_error_impl( &dword_187A54000,  v19,  OS_LOG_TYPE_ERROR,  "Error unarchiving registration: %{public}@",  buf,  0xCu);
              }
            }

            id v20 = v10;
            id v21 = *(void **)(v10 + 2312);
            v22 = (void *)MEMORY[0x189604010];
            v68[0] = objc_opt_class();
            v68[1] = objc_opt_class();
            v68[2] = objc_opt_class();
            v68[3] = objc_opt_class();
            [MEMORY[0x189603F18] arrayWithObjects:v68 count:4];
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            [v22 setWithArray:v23];
            int v24 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = v17;
            [v21 unarchivedObjectOfClasses:v24 fromData:v11 error:&v62];
            v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            uint64_t v26 = v62;

            if (v26)
            {
              [MEMORY[0x1896127A0] sharedLogger];
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              [v27 oslog];
              v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v65 = v26;
                _os_log_error_impl( &dword_187A54000,  v28,  OS_LOG_TYPE_ERROR,  "Error unarchiving activity: %{public}@",  buf,  0xCu);
              }
            }

            id v10 = v20;
            id v4 = v59;
            if ([v61 containsObject:v16])
            {
              [MEMORY[0x1896127A0] sharedLogger];
              id v29 = (void *)objc_claimAutoreleasedReturnValue();
              [v29 oslog];
              v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v65 = v25;
                v66 = 2114;
                v67 = v16;
                _os_log_impl( &dword_187A54000,  v30,  OS_LOG_TYPE_DEFAULT,  "Found matching activity:%{public}@ registration: %{public}@",  buf,  0x16u);
              }

              objc_msgSend(*(id *)(v58 + 32), "_queue_addRegistration:forActivity:", v16, v25);
            }

            uint64_t v2 = v60;
            goto LABEL_39;
          }

          goto LABEL_54;
        }
      }
  }

  else
  {
    [MEMORY[0x189612778] sharedDiag];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 trackError:@"[POLICY_UPDATE_BRAIN] SELECT_UPDATE_ASSET" forReason:@"selectSoftwareUpdatePrimaryAsset called with unexpected nil primaryAsset param" withResult:8102 withError:0];
  }
}

LABEL_48:
      v52 = [v2 count];
      if (v52 == [v4 count])
      {
        if ([v2 count])
        {
LABEL_55:

          goto LABEL_56;
        }

        [MEMORY[0x1896127A0] sharedLogger];
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        [v53 oslog];
        v54 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        v61 = v54;
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_1();
        }
      }

      else
      {
        [MEMORY[0x1896127A0] sharedLogger];
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        [v55 oslog];
        v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        v61 = v56;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
          __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_2(v2, v4, v56);
        }
      }

LABEL_54:
      goto LABEL_55;
    }

    if (v2)
    {
      if (v3) {
        goto LABEL_48;
      }
    }

    else
    {
      [MEMORY[0x1896127A0] sharedLogger];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 oslog];
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_4( v35,  v36,  v37,  v38,  v39,  v40,  v41,  v42);
      }

      if (v4) {
        goto LABEL_48;
      }
    }

    [MEMORY[0x1896127A0] sharedLogger];
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    [v43 oslog];
    v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_3( v44,  v45,  v46,  v47,  v48,  v49,  v50,  v51);
    }

    goto LABEL_48;
  }

  [MEMORY[0x1896127A0] sharedLogger];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 oslog];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR)) {
    __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_5();
  }
LABEL_56:
}

void OUTLINED_FUNCTION_1_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_187A77560( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1895B1904](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

LABEL_13:
}
  }

  -[SUCoreDocumentation localBundleURL](self, "localBundleURL");
  id v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    id v20 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    -[SUCoreDocumentation localBundleURL](self, "localBundleURL");
    id v21 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v22 = CFBundleCreate(v20, v21);

    if (v22)
    {
      v23 = (SUCoreDocumentation *)CFBundleCopyLocalizedString( v22,  @"HumanReadableUpdateName",  0LL,  @"documentation");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (v25 = -[SUCoreDocumentation isEqualToString:](v23, "isEqualToString:", @"HumanReadableUpdateName"),
            int v24 = v23,
            v25))
      {
        objc_msgSend(MEMORY[0x1896127A0], "sharedLogger", v24);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v26 oslog];
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = v23;
          _os_log_impl( &dword_187A54000,  v27,  OS_LOG_TYPE_DEFAULT,  "[DOCUMENTATION] Unable to load humanReadableUpdateName: %{public}@",  buf,  0xCu);
        }

        int v24 = 0LL;
      }

      -[SUCoreDocumentation setHumanReadableUpdateName:](self, "setHumanReadableUpdateName:", v24);
      v28 = (__CFString *)CFBundleCopyLocalizedString( v22,  @"HumanReadableUpdateTitle",  0LL,  @"documentation");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (v30 = -[__CFString isEqualToString:](v28, "isEqualToString:", @"HumanReadableUpdateTitle"),
            id v29 = v28,
            v30))
      {
        objc_msgSend(MEMORY[0x1896127A0], "sharedLogger", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        [v31 oslog];
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = (SUCoreDocumentation *)v28;
          _os_log_impl( &dword_187A54000,  v32,  OS_LOG_TYPE_DEFAULT,  "[DOCUMENTATION] Unable to load humanReadableUpdateTitle: %{public}@",  buf,  0xCu);
        }

        id v29 = 0LL;
      }

      -[SUCoreDocumentation setHumanReadableUpdateTitle:](self, "setHumanReadableUpdateTitle:", v29);
      v33 = (__CFString *)CFBundleCopyLocalizedString( v22,  @"HumanReadableUpdateVersion",  0LL,  @"documentation");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (v35 = -[__CFString isEqualToString:](v33, "isEqualToString:", @"HumanReadableUpdateVersion"),
            v34 = v33,
            v35))
      {
        objc_msgSend(MEMORY[0x1896127A0], "sharedLogger", v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        [v36 oslog];
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = (SUCoreDocumentation *)v33;
          _os_log_impl( &dword_187A54000,  v37,  OS_LOG_TYPE_DEFAULT,  "[DOCUMENTATION] Unable to load humanReadableUpdateVersion: %{public}@",  buf,  0xCu);
        }

        v34 = 0LL;
      }

      -[SUCoreDocumentation setHumanReadableUpdateVersion:](self, "setHumanReadableUpdateVersion:", v34);
      v38 = (__CFString *)CFBundleCopyLocalizedString( v22,  @"HumanReadableMoreInfoLink",  0LL,  @"documentation");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (v40 = -[__CFString isEqualToString:](v38, "isEqualToString:", @"HumanReadableMoreInfoLink"),
            uint64_t v39 = v38,
            v40))
      {
        objc_msgSend(MEMORY[0x1896127A0], "sharedLogger", v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        [v41 oslog];
        id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = (SUCoreDocumentation *)v38;
          _os_log_impl( &dword_187A54000,  v42,  OS_LOG_TYPE_DEFAULT,  "[DOCUMENTATION] Unable to load humanReadableMoreInfoLink: %{public}@",  buf,  0xCu);
        }

        uint64_t v39 = 0LL;
      }

      v86 = v28;
      -[SUCoreDocumentation setHumanReadableMoreInfoLink:](self, "setHumanReadableMoreInfoLink:", v39);
      v43 = (__CFString *)CFBundleCopyLocalizedString( v22,  @"NotificationTitleString",  0LL,  @"documentation");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (v45 = -[__CFString isEqualToString:](v43, "isEqualToString:", @"NotificationTitleString"),
            v44 = v43,
            v45))
      {
        objc_msgSend(MEMORY[0x1896127A0], "sharedLogger", v44);
        id v46 = (void *)objc_claimAutoreleasedReturnValue();
        [v46 oslog];
        int v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = (SUCoreDocumentation *)v43;
          _os_log_impl( &dword_187A54000,  v47,  OS_LOG_TYPE_DEFAULT,  "[DOCUMENTATION] Unable to load notificationTitleString: %{public}@",  buf,  0xCu);
        }

        v44 = 0LL;
      }

      v85 = v33;
      -[SUCoreDocumentation setNotificationTitleString:](self, "setNotificationTitleString:", v44);
      v48 = (__CFString *)CFBundleCopyLocalizedString(v22, @"NotificationBodyString", 0LL, @"documentation");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (v50 = -[__CFString isEqualToString:](v48, "isEqualToString:", @"NotificationBodyString"),
            v49 = v48,
            v50))
      {
        objc_msgSend(MEMORY[0x1896127A0], "sharedLogger", v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        [v51 oslog];
        v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = (SUCoreDocumentation *)v48;
          _os_log_impl( &dword_187A54000,  v52,  OS_LOG_TYPE_DEFAULT,  "[DOCUMENTATION] Unable to load notificationBodyString: %{public}@",  buf,  0xCu);
        }

        v49 = 0LL;
      }

      v84 = v38;
      -[SUCoreDocumentation setNotificationBodyString:](self, "setNotificationBodyString:", v49);
      v53 = (__CFString *)CFBundleCopyLocalizedString( v22,  @"RecommendedUpdateTitleString",  0LL,  @"documentation");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (v55 = -[__CFString isEqualToString:](v53, "isEqualToString:", @"RecommendedUpdateTitleString"),
            v54 = v53,
            v55))
      {
        objc_msgSend(MEMORY[0x1896127A0], "sharedLogger", v54);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        [v56 oslog];
        v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = (SUCoreDocumentation *)v53;
          _os_log_impl( &dword_187A54000,  v57,  OS_LOG_TYPE_DEFAULT,  "[DOCUMENTATION] Unable to load recommendedUpdateTitleString: %{public}@",  buf,  0xCu);
        }

        v54 = 0LL;
      }

      -[SUCoreDocumentation setRecommendedUpdateTitleString:](self, "setRecommendedUpdateTitleString:", v54);
      v58 = (__CFString *)CFBundleCopyLocalizedString( v22,  @"RecommendedUpdateAlertBodyString",  0LL,  @"documentation");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (v60 = -[__CFString isEqualToString:](v58, "isEqualToString:", @"RecommendedUpdateAlertBodyString"),
            v59 = v58,
            v60))
      {
        objc_msgSend(MEMORY[0x1896127A0], "sharedLogger", v59);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        [v61 oslog];
        v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = (SUCoreDocumentation *)v58;
          _os_log_impl( &dword_187A54000,  v62,  OS_LOG_TYPE_DEFAULT,  "[DOCUMENTATION] Unable to load recommendedUpdateAlertBodyString: %{public}@",  buf,  0xCu);
        }

        v59 = 0LL;
      }

      -[SUCoreDocumentation setRecommendedUpdateAlertBodyString:](self, "setRecommendedUpdateAlertBodyString:", v59);
      v63 = (__CFString *)CFBundleCopyLocalizedString( v22,  @"MandatoryUpdateBodyString",  0LL,  @"documentation");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (v65 = -[__CFString isEqualToString:](v63, "isEqualToString:", @"MandatoryUpdateBodyString"),
            v64 = v63,
            v65))
      {
        objc_msgSend(MEMORY[0x1896127A0], "sharedLogger", v64);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        [v66 oslog];
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v88 = (SUCoreDocumentation *)v63;
          _os_log_impl( &dword_187A54000,  v67,  OS_LOG_TYPE_DEFAULT,  "[DOCUMENTATION] Unable to load mandatoryUpdateBodyString: %{public}@",  buf,  0xCu);
        }

        v64 = 0LL;
      }

      -[SUCoreDocumentation setMandatoryUpdateBodyString:](self, "setMandatoryUpdateBodyString:", v64);
      v68 = -[SUCoreDocumentation releaseNotesSummaryFileName](self, "releaseNotesSummaryFileName");
      v69 = -[SUCoreDocumentation _resourceFromBundle:forKey:](self, "_resourceFromBundle:forKey:", v22, v68);
      -[SUCoreDocumentation setReleaseNotesSummary:](self, "setReleaseNotesSummary:", v69);
      v70 = -[SUCoreDocumentation releaseNotesFileName](self, "releaseNotesFileName");
      v71 = -[SUCoreDocumentation _resourceFromBundle:forKey:](self, "_resourceFromBundle:forKey:", v22, v70);
      -[SUCoreDocumentation setReleaseNotes:](self, "setReleaseNotes:", v71);
      v72 = -[SUCoreDocumentation licenseAgreementFileName](self, "licenseAgreementFileName");
      v73 = -[SUCoreDocumentation _resourceFromBundle:forKey:](self, "_resourceFromBundle:forKey:", v22, v72);
      -[SUCoreDocumentation setLicenseAgreement:](self, "setLicenseAgreement:", v73);

      [MEMORY[0x1896127A0] sharedLogger];
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      [v74 oslog];
      v75 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v88 = self;
        _os_log_impl( &dword_187A54000,  v75,  OS_LOG_TYPE_DEFAULT,  "[DOCUMENTATION] Successfully extended documentation properties: %{public}@",  buf,  0xCu);
      }

      CFRelease(v22);
      v76 = 0LL;
    }

    else
    {
      [MEMORY[0x189612760] sharedCore];
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = (void *)NSString;
      v80 = -[SUCoreDocumentation localBundleURL](self, "localBundleURL");
      [v79 stringWithFormat:@"unable to load asset bundle for the local bundle URL of the documentation asset: %@", v80];
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      [v78 buildError:8100 underlying:0 description:v81];
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189612778] sharedDiag];
      v23 = (SUCoreDocumentation *)objc_claimAutoreleasedReturnValue();
      [v76 localizedDescription];
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDocumentation trackError:forReason:withResult:withError:]( v23,  "trackError:forReason:withResult:withError:",  @"[DOCUMENTATION]",  v82,  8100LL,  v76);
    }
  }

  else
  {
    [MEMORY[0x189612760] sharedCore];
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    [v77 buildError:8101 underlying:0 description:@"unable to find local bundle URL for documentation asset"];
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189612778] sharedDiag];
    v23 = (SUCoreDocumentation *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDocumentation trackError:forReason:withResult:withError:]( v23,  "trackError:forReason:withResult:withError:",  @"[DOCUMENTATION]",  @"unable to find local bundle URL for documentation asset",  8101LL,  v76);
  }

  return v76;
}

LABEL_14:
  [NSString stringWithFormat:@"com.apple.sucoreXPCActivityScheduler.%@", v3];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = -[SUCoreXPCActivityManager initWithNameAndPersistedStateFilePath:persistedStateFilePath:]( objc_alloc(&OBJC_CLASS___SUCoreXPCActivityManager),  "initWithNameAndPersistedStateFilePath:persistedStateFilePath:",  v13,  v7);
  id v15 = (void *)sharedInstance___instance_0;
  sharedInstance___instance_0 = (uint64_t)v14;

  [MEMORY[0x1896127A0] sharedLogger];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 oslog];
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    __42__SUCoreXPCActivityManager_sharedInstance__block_invoke_cold_1((uint64_t)v13, (uint64_t)v7, v17);
  }
}

    [MEMORY[0x189612760] sharedCore];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 selectCompletionQueue:*(void *)(a1 + 40)];
    uint64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __67__SUCorePurge_checkForAssetsOfType_withCompletionQueue_completion___block_invoke_216;
    block[3] = &unk_18A0EF8F8;
    id v21 = *(id *)(a1 + 48);
    v9 = v9;
    id v19 = v9;
    id v7 = v7;
    id v20 = v7;
    dispatch_async(v17, block);

    goto LABEL_15;
  }

  id v7 = 0LL;
LABEL_15:
}

void sub_187A78064( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

uint64_t __Block_byref_object_copy__75(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__76(uint64_t a1)
{
}

void sub_187A7843C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187A786B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187A78A18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, char a45)
{
}

void sub_187A78CE0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187A79090( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187A79974( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187A79B7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187A79E20( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187A79F90( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void OUTLINED_FUNCTION_0_2( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

int *OUTLINED_FUNCTION_4()
{
  return __error();
}

char *OUTLINED_FUNCTION_5(int *a1)
{
  return strerror(*a1);
}

int *OUTLINED_FUNCTION_7()
{
  return __error();
}

LABEL_53:
  v58 = v52;
  *v60 = v58;
  if (v54) {
    *v54 = v53;
  }

LABEL_56:
LABEL_57:
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

LABEL_10:
  return v8;
}

LABEL_20:
        v69 = [v19 safeStringForKey:@"PrerequisiteBuild"];
        prerequisiteBuild = v21->_prerequisiteBuild;
        v21->_prerequisiteBuild = (NSString *)v69;

        v71 = [v19 safeStringForKey:@"PrerequisiteOSVersion"];
        prerequisiteOSVersion = v21->_prerequisiteOSVersion;
        v21->_prerequisiteOSVersion = (NSString *)v71;

        v73 = [v19 safeObjectForKey:@"SupportedDevices" ofClass:objc_opt_class()];
        supportedDevices = v21->_supportedDevices;
        v21->_supportedDevices = (NSArray *)v73;

        v21->_suDownloadSize = objc_msgSend( v19,  "safeULLForKey:defaultValue:",  *MEMORY[0x189611080],  objc_msgSend(v17, "safeULLForKey:", *MEMORY[0x189611080]));
        v21->_unarchivedSize = objc_msgSend( v19,  "safeULLForKey:defaultValue:",  *MEMORY[0x189611090],  objc_msgSend(v17, "safeULLForKey:", *MEMORY[0x189611090]));
        v21->_minimumSystemPartitionSize = objc_msgSend( v19,  "safeULLForKey:defaultValue:",  @"ActualMinimumSystemPartition",  objc_msgSend(v17, "safeULLForKey:", @"ActualMinimumSystemPartition")) << 20;
        v21->_streamingZipCapable = objc_msgSend( v19,  "safeBooleanForKey:defaultValue:",  *MEMORY[0x189611088],  objc_msgSend(v17, "safeBooleanForKey:", *MEMORY[0x189611088]));
        v75 = [v19 safeDictionaryForKey:@"SystemPartitionPadding" fromBase:@"updateAsset attributes" withKeyDescription:@"system partition padding"];
        systemPartitionPadding = v21->_systemPartitionPadding;
        v21->_systemPartitionPadding = (NSDictionary *)v75;

        v21->_preSUStagingRequiredSize = 0LL;
        v21->_preSUStagingOptionalSize = 0LL;
        v21->_autoDownloadAllowableOverCellular = objc_msgSend( v19,  "safeBooleanForKey:defaultValue:",  @"AutomaticDownloadOver3G",  objc_msgSend( v17,  "safeBooleanForKey:",  @"AutomaticDownloadOver3G"));
        v21->_downloadAllowableOverCellular = objc_msgSend( v19,  "safeBooleanForKey:defaultValue:",  @"AllowableOverCellular",  objc_msgSend(v17, "safeBooleanForKey:", @"AllowableOverCellular"));
        v21->_downloadable = objc_msgSend( v19,  "safeBooleanForKey:defaultValue:",  @"AllowableOTA",  objc_msgSend(v17, "safeBooleanForKey:", @"AllowableOTA"));
        v21->_disableSiriVoiceDeletion = objc_msgSend( v19,  "safeBooleanForKey:defaultValue:",  @"SUDisableSiriVoiceDeletion",  objc_msgSend(v17, "safeBooleanForKey:", @"SUDisableSiriVoiceDeletion"));
        v21->_disableCDLevel4 = objc_msgSend( v19,  "safeBooleanForKey:defaultValue:",  @"SUDisableCDLevel4",  objc_msgSend(v17, "safeBooleanForKey:", @"SUDisableCDLevel4"));
        v21->_disableAppDemotion = objc_msgSend( v19,  "safeBooleanForKey:defaultValue:",  @"SUDisableAppDemotion",  objc_msgSend(v17, "safeBooleanForKey:", @"SUDisableAppDemotion"));
        v21->_disableInstallTonight = objc_msgSend( v19,  "safeBooleanForKey:defaultValue:",  @"SUInstallTonightEnabled",  objc_msgSend(v17, "safeBooleanForKey:", @"SUInstallTonightEnabled")) ^ 1;
        v21->_forcePasscodeRequired = objc_msgSend( v19,  "safeBooleanForKey:defaultValue:",  @"ForcePasscodeRequired",  objc_msgSend(v17, "safeBooleanForKey:", @"ForcePasscodeRequired"));
        v21->_rampEnabled = objc_msgSend( v19,  "safeBooleanForKey:defaultValue:",  @"Ramp",  objc_msgSend(v17, "safeBooleanForKey:", @"Ramp"));
        v21->_granularlyRamped = objc_msgSend( v19,  "safeBooleanForKey:defaultValue:",  @"GranularlyRamped",  objc_msgSend(v17, "safeBooleanForKey:", @"GranularlyRamped"));
        v21->_mdmDelayInterval = objc_msgSend( v19,  "safeULLForKey:defaultValue:",  @"MDMDelayInterval",  objc_msgSend(v17, "safeULLForKey:", @"MDMDelayInterval"));
        v21->_autoUpdateEnabled = objc_msgSend( v19,  "safeBooleanForKey:defaultValue:",  @"AutoUpdate",  objc_msgSend(v17, "safeBooleanForKey:", @"AutoUpdate"));
        v21->_hideInstallAlert = objc_msgSend( v19,  "safeTriStateForKey:defaultValue:",  @"__HideInstallAlert",  objc_msgSend(v17, "safeTriStateForKey:", @"__HideInstallAlert"));
        v21->_containsSFRContent = objc_msgSend( v19,  "safeBooleanForKey:defaultValue:",  @"ContainsSFRContent",  objc_msgSend(v17, "safeBooleanForKey:", @"ContainsSFRContent"));
        v21->_installAlertInterval = objc_msgSend( v19,  "safeULLForKey:defaultValue:",  @"InstallAlertInterval",  objc_msgSend(v17, "safeULLForKey:", @"InstallAlertInterval"));
        v21->_allowAutoDownloadOnBattery = objc_msgSend( v19,  "safeBooleanForKey:defaultValue:",  @"AllowAutoDownloadOnBattery",  objc_msgSend( v17,  "safeBooleanForKey:",  @"AllowAutoDownloadOnBattery"));
        v21->_autoDownloadOnBatteryDelay = objc_msgSend( v19,  "safeULLForKey:defaultValue:",  @"AllowAutoDownloadOnBatteryDelay",  objc_msgSend( v17,  "safeULLForKey:",  @"AllowAutoDownloadOnBatteryDelay"));
        v21->_autoDownloadOnBatteryMinBattery = objc_msgSend( v19,  "safeULLForKey:defaultValue:",  @"AutoDownloadOnBatteryMinBattery",  objc_msgSend( v17,  "safeULLForKey:",  @"AutoDownloadOnBatteryMinBattery"));
        v77 = [v19 safeStringForKey:@"SetupCritical"];
        setupCritical = v21->_setupCritical;
        v21->_setupCritical = (NSString *)v77;

        v21->_criticalCellularOverride = objc_msgSend( v19,  "safeBooleanForKey:defaultValue:",  @"SetupCriticalCellularOverride",  objc_msgSend( v17,  "safeBooleanForKey:",  @"SetupCriticalCellularOverride"));
        v21->_criticalOutOfBoxOnly = objc_msgSend( v19,  "safeBooleanForKey:defaultValue:",  @"SetupCriticalUpdateOutOfBoxOnly",  objc_msgSend(v17, "safeBooleanForKey:", @"SetupCriticalUpdateOutOfBoxOnly"));
        v79 = [v19 safeStringForKey:@"LastEmergencyBuild"];
        lastEmergencyBuild = v21->_lastEmergencyBuild;
        v21->_lastEmergencyBuild = (NSString *)v79;

        v81 = [v19 safeStringForKey:@"LastEmergencyOSVersion"];
        lastEmergencyOSVersion = v21->_lastEmergencyOSVersion;
        v21->_lastEmergencyOSVersion = (NSString *)v81;

        [v19 safeObjectForKey:@"MacBuddyEligibleUpdate" ofClass:objc_opt_class()];
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v145 = v83;
        if (v83)
        {
          v84 = v83;
          v21->_mandatoryUpdateEligible = 1;
          v85 = [v83 safeStringForKey:@"VersionMin"];
          mandatoryUpdateVersionMin = v21->_mandatoryUpdateVersionMin;
          v21->_mandatoryUpdateVersionMin = (NSString *)v85;

          v87 = [v84 safeStringForKey:@"VersionMax"];
          mandatoryUpdateVersionMax = v21->_mandatoryUpdateVersionMax;
          v21->_mandatoryUpdateVersionMax = (NSString *)v87;

          v21->_mandatoryUpdateOptional = [v84 safeBooleanForKey:@"Optional"];
          v89 = [v84 safeBooleanForKey:@"RestrictedToOutOfTheBox"];
        }

        else
        {
          v21->_mandatoryUpdateEligible = 0;
          v90 = v21->_mandatoryUpdateVersionMin;
          v21->_mandatoryUpdateVersionMin = 0LL;

          v91 = v21->_mandatoryUpdateVersionMax;
          v21->_mandatoryUpdateVersionMax = 0LL;

          v89 = 0;
          v21->_mandatoryUpdateOptional = 0;
        }

        v21->_mandatoryUpdateRestrictedToOutOfTheBox = v89;
        v21->_oneShotBuddyDisabled = [v19 safeBooleanForKey:@"DisableOneShotBuddy"];
        v92 = [v19 safeObjectForKey:@"DisableOneShotBuddyBuilds" ofClass:objc_opt_class()];
        oneShotBuddyDisabledBuilds = v21->_oneShotBuddyDisabledBuilds;
        v21->_oneShotBuddyDisabledBuilds = (NSArray *)v92;

        v21->_criticalUpdate = objc_msgSend( v19,  "safeBooleanForKey:defaultValue:",  @"CriticalUpdate",  objc_msgSend(v17, "safeBooleanForKey:", @"CriticalUpdate"));
        v94 = [v19 safeStringForKey:@"ProductType"];
        productType = v21->_productType;
        v21->_productType = (NSString *)v94;

        v21->_autoInstallDelay = objc_msgSend( v19,  "safeULLForKey:defaultValue:",  @"AutoInstallDelay",  objc_msgSend(v17, "safeULLForKey:", @"AutoInstallDelay"));
        v21->_notifyAfter = objc_msgSend( v19,  "safeBooleanForKey:defaultValue:",  @"NotifyAfter",  objc_msgSend(v17, "safeBooleanForKey:", @"NotifyAfter"));
        v96 = [v19 safeStringForKey:@"TargetUpdateBridgeVersion"];
        minimumBridgeVersion = v21->_minimumBridgeVersion;
        v21->_minimumBridgeVersion = (NSString *)v96;

        v21->_disableRosettaUpdates = [v19 safeBooleanForKey:@"DisableRosettaUpdates"];
        v21->_disableRecoveryOSUpdates = [v19 safeBooleanForKey:@"DisableRecoveryOSUpdates"];
        v21->_requireInstallAssistantUpdate = [v19 safeBooleanForKey:@"RequireInstallAssistantUpdate"];
        v98 = [v19 safeDataForKey:@"SEPDigest"];
        sepDigest = v21->_sepDigest;
        v21->_sepDigest = (NSData *)v98;

        v100 = [v19 safeDataForKey:@"SEPTBMDigests"];
        sepTBMDigests = v21->_sepTBMDigests;
        v21->_sepTBMDigests = (NSData *)v100;

        v102 = [v19 safeDataForKey:@"RSEPDigest"];
        rsepDigest = v21->_rsepDigest;
        v21->_rsepDigest = (NSData *)v102;

        v104 = [v19 safeDataForKey:@"RSEPTBMDigests"];
        rsepTBMDigests = v21->_rsepTBMDigests;
        v21->_rsepTBMDigests = (NSData *)v104;

        v106 = [v19 safeStringForKey:@"SUDocumentationID"];
        documentationID = v21->_documentationID;
        v21->_documentationID = (NSString *)v106;

        softwareUpdateURL = v21->_softwareUpdateURL;
        v21->_softwareUpdateURL = 0LL;

        v109 = [v19 safeStringForKey:@"__BaseURL"];
        if (v109)
        {
          v110 = (void *)v109;
          [v19 safeStringForKey:@"__RelativePath"];
          v111 = (void *)objc_claimAutoreleasedReturnValue();

          if (v111)
          {
            v112 = objc_alloc(NSString);
            [v19 safeStringForKey:@"__BaseURL"];
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            [v19 safeStringForKey:@"__RelativePath"];
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            v115 = [v112 initWithFormat:@"%@%@", v113, v114];
            v116 = v21->_softwareUpdateURL;
            v21->_softwareUpdateURL = (NSString *)v115;
          }
        }

        v117 = [v19 safeDataForKey:@"_Measurement"];
        measurement = v21->_measurement;
        v21->_measurement = (NSData *)v117;

        v119 = [v19 safeStringForKey:@"_MeasurementAlgorithm"];
        measurementAlgorithm = v21->_measurementAlgorithm;
        v21->_measurementAlgorithm = (NSString *)v119;

        if (v147)
        {
          [MEMORY[0x1896127A0] sharedLogger];
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          [v121 oslog];
          v122 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v150 = v147;
            _os_log_impl( &dword_187A54000,  v122,  OS_LOG_TYPE_DEFAULT,  "Override descriptor attribute msuPrepareSize with %{public}@",  buf,  0xCu);
          }

          v123 = 0LL;
          v21->_msuPrepareSize = [v147 longLongValue];
        }

        else
        {
          SUCoreBorder_MSUAssetCalculatePrepareSize(v19);
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          v21->_msuPrepareSize = 0LL;
          if (v123)
          {
            [MEMORY[0x189612778] sharedDiag];
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            [v124 trackAnomaly:@"[DESCRIPTOR]" forReason:@"unable to determine prepare size for installation" withResult:8100 withError:v123];
          }
        }

        if (v146)
        {
          [MEMORY[0x1896127A0] sharedLogger];
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          [v125 oslog];
          v126 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          id v16 = v146;
          if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v150 = v146;
            _os_log_impl( &dword_187A54000,  v126,  OS_LOG_TYPE_DEFAULT,  "Override descriptor attribute installationSize with %{public}@",  buf,  0xCu);
          }

          v21->_installationSize = [v146 longLongValue];
        }

        else
        {
          SUCoreBorder_MSUAssetCalculateApplySize(v19);
          v127 = (void *)objc_claimAutoreleasedReturnValue();

          v21->_installationSize = 0LL;
          if (v127)
          {
            [MEMORY[0x189612778] sharedDiag];
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            [v128 trackAnomaly:@"[DESCRIPTOR]" forReason:@"unable to determine apply size for installation" withResult:8100 withError:v127];
          }

          id v16 = 0LL;
        }

        id v15 = v147;
        if (+[SUCoreDescriptor isEmergencyUpdate:](&OBJC_CLASS___SUCoreDescriptor, "isEmergencyUpdate:", v19))
        {
          v129 = 3LL;
        }

        else if (v21->_prerequisiteBuild || v21->_prerequisiteOSVersion)
        {
          v129 = 1LL;
        }

        else
        {
          v129 = 2LL;
        }

        v21->_updateType = v129;
        objc_storeStrong((id *)&v21->_softwareUpdateAsset, a3);
        documentationAsset = v21->_documentationAsset;
        v21->_documentationAsset = 0LL;

        documentation = v21->_documentation;
        v21->_documentation = 0LL;

        v132 = [objc_alloc(MEMORY[0x1896127A8]) initWithProductVersion:v21->_productVersion productBuildVersion:v21->_productBuildVersion releaseType:v21->_releaseType measurement:v21->_measurement measurementAlgorithm:v21->_measurementAlgorithm];
        softwareUpdateAssetIdentifier = v21->_softwareUpdateAssetIdentifier;
        v21->_softwareUpdateAssetIdentifier = (SUCoreMAIdentifier *)v132;

        documentationAssetIdentifier = v21->_documentationAssetIdentifier;
        v21->_documentationAssetIdentifier = 0LL;

        v21->_promoteAlternateUpdate = [v19 safeBooleanForKey:@"PromoteAlternateUpdate"];
        v21->_enableAlternateAssetAudience = [v19 safeBooleanForKey:@"EnableAlternateAssetAudience"];
        v135 = [v19 safeStringForKey:@"AlternateAssetAudienceUUID"];
        alternateAssetAudienceUUID = v21->_alternateAssetAudienceUUID;
        v21->_alternateAssetAudienceUUID = (NSString *)v135;

        assetAudienceUUID = v21->_assetAudienceUUID;
        v21->_assetAudienceUUID = 0LL;

        updateBrainPath = v21->_updateBrainPath;
        v21->_updateBrainPath = 0LL;

        updateBundlePath = v21->_updateBundlePath;
        v21->_updateBundlePath = 0LL;

        v21->_splatOnly = [v19 safeBooleanForKey:@"SplatOnly"];
        v21->_semiSplatEnabled = [v19 safeBooleanForKey:@"SemiSplatEnabled"];
        v140 = [v19 safeObjectForKey:@"SemiSplatMustQuitApps" ofClass:objc_opt_class()];
        semiSplatMustQuitApps = v21->_semiSplatMustQuitApps;
        v21->_semiSplatMustQuitApps = (NSArray *)v140;

        v21->_revoked = [v19 safeBooleanForKey:@"Revoked"];
        v21->_semiSplatRestartNow = 0;
        associatedSplatDescriptor = v21->_associatedSplatDescriptor;
        v21->_associatedSplatDescriptor = 0LL;

        *(_WORD *)&v21->_disableSplatCombo = 1;
        v21->_enablePreSUStagingForOptionalAssets = 0;

        goto LABEL_45;
      }

      [MEMORY[0x189612778] sharedDiag];
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v65;
      v67 = @"unable to create SU descriptor: update asset without attributes";
    }

    else
    {
      [MEMORY[0x189612778] sharedDiag];
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v65;
      v67 = @"unable to create SU descriptor: unable to create attributes dictionary";
    }

    [v65 trackError:@"[DESCRIPTOR]" forReason:v67 withResult:8100 withError:0];

    v64 = 0LL;
LABEL_46:

    goto LABEL_47;
  }

  [MEMORY[0x189612778] sharedDiag];
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  [v63 trackError:@"[DESCRIPTOR]" forReason:@"unable to create SU descriptor: nil update asset" withResult:8100 withError:0];

  v64 = 0LL;
LABEL_47:

  return v64;
}

  uint64_t v39 = v17;
  [*(id *)(v17 + 1952) sharedLogger];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  [v40 oslog];
  v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreDescriptor documentationAssetAbsoluteID](v16, "documentationAssetAbsoluteID");
    id v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[SUCoreDescriptor documentationAssetPurpose](v16, "documentationAssetPurpose");
    *(_DWORD *)buf = 138543874;
    v63 = v14;
    v64 = 2114;
    v65 = v42;
    v66 = 2114;
    v67 = v43;
    _os_log_impl( &dword_187A54000,  v41,  OS_LOG_TYPE_DEFAULT,  "[ReloadDescriptor] Attempting to reload documentation asset, allowing differences:%{public}@ absoluteAssetID:%{pub lic}@ purpose:%{public}@",  buf,  0x20u);
  }

  v44 = (void *)MEMORY[0x1896110E0];
  v45 = -[SUCoreDescriptor documentationAssetAbsoluteID](v16, "documentationAssetAbsoluteID");
  -[SUCoreDescriptor documentationAssetPurpose](v16, "documentationAssetPurpose");
  id v46 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0LL;
  objc_msgSend( v44,  "SUCoreBorder_loadSync:allowingDifferences:withPurpose:error:simulateForDescriptor:simulateForType:",  v45,  v14,  v46,  &v60,  v36,  2);
  int v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v60;

  if (v48 || !v47)
  {
    [MEMORY[0x189612760] sharedCore];
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (v48)
    {
      v54 = @"Failed to reload documentation asset for descriptor with MobileAsset error";
      v55 = 8704LL;
      v56 = v48;
    }

    else
    {
      v54 = @"Failed to reload documentation asset for descriptor as asset was not found (no MobileAsset error)";
      v55 = 8705LL;
      v56 = 0LL;
    }

    [v52 buildError:v55 underlying:v56 description:v54];
    v51 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [*(id *)(v39 + 1952) sharedLogger];
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    [v49 oslog];
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187A54000,  v50,  OS_LOG_TYPE_DEFAULT,  "[ReloadDescriptor] Documentation asset reload completed successfully",  buf,  2u);
    }

    -[SUCoreDescriptor assignDocumentationFromAsset:extendingBundleProperties:]( v36,  "assignDocumentationFromAsset:extendingBundleProperties:",  v47,  [v47 wasLocal]);
    v51 = 0LL;
  }

LABEL_33:
  if (a8) {
    *a8 = v35;
  }
  if (a9) {
    *a9 = v51;
  }

  return v36;
}

  -[SUCoreConfigServer _stateSafeUpdateState](self, "_stateSafeUpdateState");
  v37 = -[SUCoreConfigServer nextScanTime](self, "nextScanTime");
  return v37;
}

LABEL_17:
  return v19;
}

void sub_187A91FC4(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    +[SUCoreDDMUtilities sharedLogger](&OBJC_CLASS___SUCoreDDMUtilities, "sharedLogger");
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __61__SUCorePolicyDDMConfiguration_initWithStatePersistencePath___block_invoke_cold_1();
    }

    objc_end_catch();
    JUMPOUT(0x187A91F94LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_187A92498( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_187A929E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_187A92B0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187A92E28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187A93284( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187A9356C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_187A938DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_187A93BCC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187A940C8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_187A942E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_187A94644( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_187A94928( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187A94F3C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187A951B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void OUTLINED_FUNCTION_0_4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void OUTLINED_FUNCTION_6(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

  ;
}

  ;
}

LABEL_30:
  return v34;
}

void sub_187A98668( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_187A9D140( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_187A9D300( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187A9D4A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187A9D638( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

LABEL_51:
LABEL_52:
  return v67;
}

LABEL_50:
        id v18 = v47;
        *a3 = v18;
        goto LABEL_51;
      }

      ++v35;

      id v18 = v40;
      id v7 = 0x189612000LL;
      v37 = v54;
    }

    ++v34;

    id v21 = 1;
  }

  id v42 = (void *)MEMORY[0x189607870];
  [NSString stringWithFormat:@"Failed to create deletePath"];
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  [v42 buildAndLogCheckedSUCoreError:9005 underlying:0 description:v43];
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  id v13 = v52;
  if (a3)
  {
    uint64_t v26 = v44;
    id v18 = v26;
    id v21 = 0;
    goto LABEL_22;
  }

  id v21 = 0;
  id v18 = v44;
LABEL_40:

  return v21;
}

  if (v232)
  {
  }

  if (v230)
  {
  }

  if (HIDWORD(v228))
  {
  }

  if ((_DWORD)v228)
  {
  }

  if (HIDWORD(v227[0]))
  {
  }

  if (LODWORD(v227[1]))
  {
  }

  if (LODWORD(v227[0]))
  {
  }

  if ((_DWORD)v226)
  {
  }

  if ((_DWORD)v225)
  {
  }

  if ((_DWORD)v224)
  {
  }

  if (HIDWORD(v224))
  {
  }

  if (HIDWORD(v225))
  {
  }

  if (HIDWORD(v226))
  {
  }

  if ((_DWORD)v223)
  {
  }

  if (*(_DWORD *)v222)
  {
  }

  if (LODWORD(v221[0]))
  {
  }

  if (HIDWORD(v221[0]))
  {
  }

  if (LODWORD(v221[1]))
  {
  }

  if (HIDWORD(v221[1]))
  {
  }

  if (LODWORD(v221[2]))
  {
  }

  if (HIDWORD(v221[2]))
  {
  }

  if (*(_DWORD *)&v222[4])
  {
  }

  if (*(_DWORD *)&v222[8])
  {
  }

  if (HIDWORD(v223))
  {
  }

  if (HIDWORD(v227[1]))
  {
  }

  if (LODWORD(v227[2]))
  {
  }

  if (HIDWORD(v227[2]))
  {
  }

  if (v229)
  {
  }

  if (v231)
  {
  }

  if (*(_DWORD *)v233)
  {
  }

  if (*(_DWORD *)&v233[4])
  {

    if (!v62) {
      goto LABEL_112;
    }
  }

  else if (!v62)
  {
LABEL_112:
    if (v61) {
      goto LABEL_113;
    }
    goto LABEL_119;
  }

  if (v61)
  {
LABEL_113:

    if (!v60) {
      goto LABEL_114;
    }
    goto LABEL_120;
  }

void sub_187A9FF20( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

LABEL_7:
LABEL_8:
}

  -[SUCoreMobileAsset downloadOptions](self, "downloadOptions");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    [MEMORY[0x189612760] sharedCore];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 buildError:8116 underlying:0 description:@"failed to load the download options when options were expected"];
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189612760] sharedCore];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v28 buildError:8700 underlying:v27 description:@"failed to download asset"];
    id v29 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreMobileAsset _reportDownloadFailed:](self, "_reportDownloadFailed:", v29);
LABEL_26:

    goto LABEL_27;
  }

  [MEMORY[0x1896127A0] sharedLogger];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 oslog];
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    +[SUCoreMobileAsset downloadOptionsDescription:]( &OBJC_CLASS___SUCoreMobileAsset,  "downloadOptionsDescription:",  v12);
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = self;
    v44 = 2114;
    v45 = v15;
    _os_log_impl( &dword_187A54000,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ downloading asset with options: %{public}@",  buf,  0x16u);
  }

  [MEMORY[0x1896127A0] sharedLogger];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 oslog];
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreMobileAsset asset](self, "asset");
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 purpose];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = self;
    v44 = 2114;
    v45 = v19;
    _os_log_impl( &dword_187A54000,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@ asset has purpose (before download start): %{public}@",  buf,  0x16u);
  }

  -[SUCoreMobileAsset asset](self, "asset");
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 purpose];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    [MEMORY[0x1896127A0] sharedLogger];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 oslog];
    int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if ((isKindOfClass & 1) != 0)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v43 = self;
        _os_log_impl( &dword_187A54000,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@ setting download options purpose before start of the download as a workaround",  buf,  0xCu);
      }

      -[SUCoreMobileAsset asset](self, "asset");
      int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v25 = -[os_log_s purpose](v24, "purpose");
      [v12 setPurpose:v25];
    }

    else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      -[SUCoreMobileAsset _registerProgressAndStartDownload].cold.1((uint64_t)self, v24, v31, v32, v33, v34, v35, v36);
    }
  }
  v37 = -[SUCoreMobileAsset asset](self, "asset");
  if (!v37)
  {
    [MEMORY[0x189612760] sharedCore];
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
    [v39 buildError:8700 underlying:0 description:@"failed to download asset (self.asset is not present)"];
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreMobileAsset _reportDownloadFailed:](self, "_reportDownloadFailed:", v27);
    goto LABEL_26;
  }

  -[SUCoreMobileAsset _trackMobileAssetBegin:](self, "_trackMobileAssetBegin:", @"startDownload");
  v38 = -[SUCoreMobileAsset asset](self, "asset");
  v40[0] = v6;
  v40[1] = 3221225472LL;
  v40[2] = __54__SUCoreMobileAsset__registerProgressAndStartDownload__block_invoke_734;
  v40[3] = &unk_18A0F1598;
  v40[4] = self;
  objc_msgSend(v38, "SUCoreBorder_startDownload:completionWithError:", v12, v40);

LABEL_27:
}

  v30 = v9;
LABEL_11:

  return v30;
}

LABEL_5:
  -[SUCoreUpdate downloadControl](self, "downloadControl");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    -[SUCoreUpdate _trackUpdateAnomaly:result:description:]( self,  "_trackUpdateAnomaly:result:description:",  @"DOWNLOAD_SU",  8116LL,  @"SUCoreUpdateDownloader instance not available when about to call download");
    return 0LL;
  }

  -[SUCoreUpdate downloadControl](self, "downloadControl");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate policy](self, "policy");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 downloadUpdateWithPolicy:v14];

LABEL_7:
  return 0LL;
}

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 oslog];
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreDescriptor nameForDescriptorType:]( SUCoreDescriptor,  "nameForDescriptorType:",  [v11 descriptorType]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = self;
    v32 = 2114;
    v33 = v12;
    _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Removing descriptor of type %{public}@",  buf,  0x16u);
  }

  -[SUCoreUpdate downloadControl](self, "downloadControl");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    -[SUCoreUpdate _trackUpdateAnomaly:result:description:]( self,  "_trackUpdateAnomaly:result:description:",  @"REMOVE_SU",  8116LL,  @"SUCoreUpdateDownloader instance not available when about to call to remove asset");
    return 0LL;
  }

  -[SUCoreUpdate downloadControl](self, "downloadControl");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 removeUpdate];
LABEL_9:

  return 0LL;
}

LABEL_18:
        v54 = -[SUCoreUpdateDownloader initWithDelegate:forUpdate:updateUUID:]( objc_alloc(&OBJC_CLASS___SUCoreUpdateDownloader),  "initWithDelegate:forUpdate:updateUUID:",  v15,  v11,  v12);
        downloadControl = v15->_downloadControl;
        v15->_downloadControl = v54;
        id v13 = v72;
LABEL_19:

        v56 = -[SUCoreMSU initWithDelegate:](objc_alloc(&OBJC_CLASS___SUCoreMSU), "initWithDelegate:", v15);
        msuControl = v15->_msuControl;
        v15->_msuControl = v56;

        -[SUCoreMSU assignDescriptor:updateUUID:](v15->_msuControl, "assignDescriptor:updateUUID:", v11, v12);
        goto LABEL_20;
      }
    }

    goto LABEL_18;
  }

  if (*p_updateDescriptor) {
    goto LABEL_12;
  }
  v74 = v10;
  v71 = objc_alloc(NSString);
  v30 = v15->_updateUUID;
  v31 = -[SUCoreRollbackDescriptor productBuildVersion](v15->_rollbackDescriptor, "productBuildVersion");
  v32 = -[SUCoreRollbackDescriptor releaseType](v15->_rollbackDescriptor, "releaseType");
  [MEMORY[0x189612770] sharedDevice];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v33 buildVersion];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v28;
  v35 = [v71 initWithFormat:@"UUID(%@) %@(%@)->%@(%@)", v30, v31, v32, v34, v28];
  v36 = v15->_updateName;
  v15->_updateName = (NSString *)v35;

  [MEMORY[0x1896127A0] sharedLogger];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  [v37 oslog];
  v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_187A54000,  v38,  OS_LOG_TYPE_DEFAULT,  "[Update] Initializing with rollback descriptor. No SUCoreUpdateDownloader instance will be initialized",  buf,  2u);
  }

  uint64_t v39 = v15->_downloadControl;
  v15->_downloadControl = 0LL;

  v40 = -[SUCoreMSU initWithDelegate:](objc_alloc(&OBJC_CLASS___SUCoreMSU), "initWithDelegate:", v15);
  v41 = v15->_msuControl;
  v15->_msuControl = v40;

  -[SUCoreMSU assignRollbackDescriptor:updateUUID:]( v15->_msuControl,  "assignRollbackDescriptor:updateUUID:",  v15->_rollbackDescriptor,  v12);
LABEL_20:
  v58 = [(id)objc_opt_class() _generateStateTable];
  stateTable = v15->_stateTable;
  v15->_stateTable = (NSDictionary *)v58;

  v60 = [objc_alloc(MEMORY[0x189612798]) initMachine:@"update" ofInstance:v15->_updateName withTable:v15->_stateTable startingIn:@"ReadyToBegin" usingDelegate:v15 registeringAllInfoClass:objc_opt_class()];
  updateFSM = v15->_updateFSM;
  v15->_updateFSM = (SUCoreFSM *)v60;

  v62 = v15->_updateFSM;
  id v10 = v74;
  if (!v62)
  {
LABEL_25:
    v63 = 0LL;
    goto LABEL_26;
  }

LABEL_55:
      v64 = *v14;
      if (!v64) {
        return;
      }
      v63 = v64;
      v65 = -[SUCoreUpdate updateFSM](self, "updateFSM");
      v66 = objc_alloc_init(&OBJC_CLASS___SUCoreUpdateParam);
      [v65 followupEvent:v63 withInfo:v66];

LABEL_57:
      return;
    case 4LL:
      goto LABEL_12;
    case 5LL:
      goto LABEL_21;
    case 6LL:
      goto LABEL_25;
    case 7LL:
      goto LABEL_31;
    case 8LL:
      goto LABEL_35;
    case 9LL:
      goto LABEL_41;
    case 10LL:
      goto LABEL_47;
    default:
      return;
  }

CFStringRef SUCoreStringForDDMStatusNotificationType(unsigned int a1)
{
  if (a1 > 4) {
    return @"Unknown";
  }
  else {
    return off_18A0F1108[(__int16)a1];
  }
}

LABEL_37:
    return;
  }

  id v15 = *(void *)(a1 + 48);
  [*(id *)(a1 + 32) requestedDownloadConfig];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = +[SUCoreMobileAsset downloadConfig:isEqualToConfig:]( &OBJC_CLASS___SUCoreMobileAsset,  "downloadConfig:isEqualToConfig:",  v15,  v16);

  if (!v17)
  {
    [*(id *)(a1 + 32) setDesiredDownloadConfig:*(void *)(a1 + 48)];
    [MEMORY[0x1896127A0] sharedLogger];
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v34 oslog];
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v35 = *v2;
      [v35 desiredDownloadConfig];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = +[SUCoreMobileAsset downloadConfigSummary:](&OBJC_CLASS___SUCoreMobileAsset, "downloadConfigSummary:", v31);
      *(_DWORD *)buf = 138543618;
      v57 = v35;
      v58 = 2114;
      v59 = v32;
      v33 = "%{public}@ alter download config to different than requested | replacing earlier desire to alter with latest"
            " desired (%{public}@)";
      goto LABEL_36;
    }

    goto LABEL_37;
  }

  [MEMORY[0x1896127A0] sharedLogger];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 oslog];
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = *v2;
    [*v2 requestedDownloadConfig];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = +[SUCoreMobileAsset downloadConfigSummary:](&OBJC_CLASS___SUCoreMobileAsset, "downloadConfigSummary:", v21);
    *(_DWORD *)buf = 138543618;
    v57 = v20;
    v58 = 2114;
    v59 = v22;
    _os_log_impl( &dword_187A54000,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@ alter download config to same as being requested (%{public}@) | dropping earlier desire to alter",  buf,  0x16u);
  }

  [*v2 setDesiredDownloadConfig:0];
}

void OUTLINED_FUNCTION_0_5(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

LABEL_49:
  v111 = v44;
  [v44 sortedArrayUsingComparator:&__block_literal_global_9];
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  [v52 lastObject];
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  [v53 attributes];
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  [v54 safeStringForKey:@"OSVersion"];
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = +[SUCorePolicy _cleanProductVersion:](&OBJC_CLASS___SUCorePolicy, "_cleanProductVersion:", v55);
  v57 = v52;
  v58 = (void *)MEMORY[0x1896079C8];
  v122[0] = v38;
  v122[1] = 3221225472LL;
  v122[2] = __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_2;
  v122[3] = &unk_18A0EF9C0;
  v107 = v56;
  v123 = v107;
  [v58 predicateWithBlock:v122];
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  [v52 filteredArrayUsingPredicate:v59];
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896127A0] sharedLogger];
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  [v61 oslog];
  v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    v63 = [v60 count];
    *(_DWORD *)buf = 134217984;
    v132 = (SUCorePolicy *)v63;
    _os_log_impl( &dword_187A54000,  v62,  OS_LOG_TYPE_DEFAULT,  "[POLICY] %lu assets left after filtering for highestProductVersionAssets in SUCorePolicy",  buf,  0xCu);
  }

  v110 = v60;
  if (![v60 count])
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    [v94 oslog];
    v95 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    v75 = v111;
    v109 = v95;
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_187A54000, v95, OS_LOG_TYPE_DEFAULT, "[POLICY] 0 assets found", buf, 2u);
    }

    int v24 = 0LL;
    v96 = 0LL;
    v69 = 0LL;
    v97 = 0LL;
    id v8 = v114;
    v98 = v107;
    goto LABEL_91;
  }

  [v60 sortedArrayUsingComparator:&__block_literal_global_410];
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  [v64 lastObject];
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 attributes];
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  [v66 objectForKeyedSubscript:@"Build"];
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = (void *)MEMORY[0x1896079C8];
  v69 = v64;
  v120[0] = v38;
  v120[1] = 3221225472LL;
  v120[2] = __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_2_411;
  v120[3] = &unk_18A0EF9C0;
  v70 = v67;
  v121 = v70;
  [v68 predicateWithBlock:v120];
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  [v64 filteredArrayUsingPredicate:v71];
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896127A0] sharedLogger];
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  [v73 oslog];
  v74 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  v75 = v111;
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
  {
    v76 = [v72 count];
    *(_DWORD *)buf = 134217984;
    v132 = (SUCorePolicy *)v76;
    _os_log_impl( &dword_187A54000,  v74,  OS_LOG_TYPE_DEFAULT,  "[POLICY] %lu assets left after filtering for highestBuildVersionAssets in SUCorePolicy",  buf,  0xCu);
  }

  v109 = (os_log_s *)v72;
  v106 = v70;
  if (![v72 count])
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    [v99 oslog];
    v100 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    v98 = v107;
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_187A54000, v100, OS_LOG_TYPE_DEFAULT, "[POLICY] 0 assets found", buf, 2u);
    }

    int v24 = 0LL;
    v96 = 0LL;
    id v8 = v114;
    goto LABEL_90;
  }

  v104 = v69;
  v105 = v57;
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v77 = v72;
  v78 = [v77 countByEnumeratingWithState:&v116 objects:v130 count:16];
  v115 = v77;
  if (!v78)
  {

    id v8 = v114;
LABEL_83:
    [MEMORY[0x1896127A0] sharedLogger];
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    [v101 oslog];
    v102 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187A54000,  v102,  OS_LOG_TYPE_DEFAULT,  "[POLICY] query to locate update asset did not find pure partial or full; selecting first with highest build",
        buf,
        2u);
    }

    [v115 firstObject];
    v80 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_88;
  }

  v79 = v78;
  v103 = v15;
  v80 = 0LL;
  v81 = 0LL;
  v82 = *(void *)v117;
  do
  {
    for (i = 0LL; i != v79; ++i)
    {
      if (*(void *)v117 != v82) {
        objc_enumerationMutation(v77);
      }
      v84 = *(void **)(*((void *)&v116 + 1) + 8 * i);
      if (!v80)
      {
        [*(id *)(*((void *)&v116 + 1) + 8 * i) attributes];
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = [v87 objectForKeyedSubscript:@"PrerequisiteBuild"];
        if (v88)
        {
          v89 = (void *)v88;
          [v84 attributes];
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          [v90 objectForKeyedSubscript:@"PrerequisiteOSVersion"];
          v91 = (void *)objc_claimAutoreleasedReturnValue();

          v77 = v115;
          if (v91)
          {
            v80 = v84;
            continue;
          }
        }

        else
        {
        }
      }

      if (!v81)
      {
        [v84 attributes];
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        [v85 objectForKeyedSubscript:@"PrerequisiteBuild"];
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        if (v86)
        {

          v81 = 0LL;
        }

        else
        {
          [v84 attributes];
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          [v92 objectForKeyedSubscript:@"PrerequisiteOSVersion"];
          v93 = (void *)objc_claimAutoreleasedReturnValue();

          if (v93) {
            v81 = 0LL;
          }
          else {
            v81 = v84;
          }
          v77 = v115;
        }
      }
    }

    v79 = [v77 countByEnumeratingWithState:&v116 objects:v130 count:16];
  }

  while (v79);

  if (v80)
  {
    id v8 = v114;
    id v15 = v103;
    goto LABEL_89;
  }

  id v8 = v114;
  id v15 = v103;
  if (!v81) {
    goto LABEL_83;
  }
  v80 = v81;
LABEL_88:
  v81 = 0LL;
LABEL_89:
  int v24 = (os_log_s *)v80;
  *v112 = v24;
  v96 = v81;
  *v113 = v96;
  v75 = v111;
  v69 = v104;
  v57 = v105;
  v98 = v107;
LABEL_90:

  v97 = v106;
LABEL_91:

LABEL_92:
LABEL_93:
}

  v72 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v8 hwModelStr];
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  [v72 setSafeObject:v73 forKey:*MEMORY[0x189611660]];

  [v8 deviceClass];
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  [v72 setSafeObject:v74 forKey:*MEMORY[0x189611658]];

  [v8 productType];
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  [v72 setSafeObject:v75 forKey:*MEMORY[0x189611670]];

  [v8 releaseType];
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  [v72 setSafeObject:v76 forKey:*MEMORY[0x189611678]];

  [MEMORY[0x189612770] sharedDevice];
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  [v77 deviceBoardID];
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  [v72 setSafeObject:v78 forKey:*MEMORY[0x189611650]];

  [v14 setSafeObject:v72 forKey:*MEMORY[0x189611668]];
  v79 = +[SUCoreDescriptor nameForDescriptorAudienceType:]( SUCoreDescriptor,  "nameForDescriptorAudienceType:",  [v9 descriptorAudienceType]);
  [v14 setSafeObject:v79 forKey:*MEMORY[0x189611680]];
  v80 = +[SUCoreDescriptor nameForDescriptorPreferredUpdateType:]( SUCoreDescriptor,  "nameForDescriptorPreferredUpdateType:",  [v9 preferredUpdateType]);
  [v14 setSafeObject:v80 forKey:*MEMORY[0x189611688]];

  [v8 softwareUpdateScanPolicy];
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    v82 = v40;
  }
  [v14 setSafeObject:v82 forKey:*MEMORY[0x189611608]];

LABEL_55:
  return v14;
}

LABEL_121:
    [MEMORY[0x1896127A0] sharedLogger];
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    [v136 oslog];
    v137 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187A54000,  v137,  OS_LOG_TYPE_DEFAULT,  "[POLICY] query to locate major update asset did not find pure partial or full; selecting first with highest build",
        buf,
        2u);
    }

    [v112 firstObject];
    v115 = (id)objc_claimAutoreleasedReturnValue();
LABEL_124:
    v116 = 0LL;
  }

  v135 = v155;

  v132 = v165;
LABEL_126:

  v138 = v115;
  *v135 = v138;
  v139 = v116;
  *v148 = v139;
  v31 = (os_log_s *)v154;
  *v149 = v31;
  v140 = v147;
  *v150 = v140;

LABEL_127:
  id v12 = v151;
  id v19 = v152;
LABEL_128:

  v45 = v156;
LABEL_129:

LABEL_26:
}

  if (v58)
  {
LABEL_122:
  }

LABEL_47:
  v183 = v7;
  v97 = objc_alloc(NSString);
  else {
    v98 = @"NO";
  }
  v99 = (void *)[v97 initWithFormat:@"discretionary:%@|", v98];
  [v33 stringByAppendingString:v99];
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  v101 = objc_alloc(NSString);
  else {
    v102 = @"NO";
  }
  v103 = (void *)[v101 initWithFormat:@"allowsCellular:%@|", v102];
  [v100 stringByAppendingString:v103];
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  v105 = objc_alloc(NSString);
  else {
    v106 = @"NO";
  }
  v107 = (void *)[v105 initWithFormat:@"requiresPowerPluggedIn:%@|", v106];
  [v104 stringByAppendingString:v107];
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  v109 = objc_alloc(NSString);
  else {
    v110 = @"NO";
  }
  v111 = (void *)[v109 initWithFormat:@"allowSameVersion:%@|", v110];
  [v108 stringByAppendingString:v111];
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  v113 = objc_alloc(NSString);
  [v11 prerequisiteProductVersion];
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = (void *)[v113 initWithFormat:@"prerequisiteProductVersion:%@|", v114];
  [v112 stringByAppendingString:v115];
  v116 = (void *)objc_claimAutoreleasedReturnValue();

  v117 = objc_alloc(NSString);
  [v11 prerequisiteBuildVersion];
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = (void *)[v117 initWithFormat:@"prerequisiteBuildVersion:%@|", v118];
  [v116 stringByAppendingString:v119];
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  v121 = objc_alloc(NSString);
  v122 = -[SUCorePolicy prerequisiteRestoreVersion](self, "prerequisiteRestoreVersion");
  v123 = (void *)[v121 initWithFormat:@"prerequisiteRestoreVersion:%@|", v122];
  [v120 stringByAppendingString:v123];
  v124 = (void *)objc_claimAutoreleasedReturnValue();

  v125 = objc_alloc(NSString);
  v126 = -[SUCorePolicy targetRestoreVersion](self, "targetRestoreVersion");
  v127 = (void *)[v125 initWithFormat:@"targetRestoreVersion:%@|", v126];
  [v124 stringByAppendingString:v127];
  v128 = (void *)objc_claimAutoreleasedReturnValue();

  v129 = objc_alloc(NSString);
  v130 = -[SUCorePolicy installedSFRVersion](self, "installedSFRVersion");
  v131 = (void *)[v129 initWithFormat:@"installedSFRVersion:%@|", v130];
  [v128 stringByAppendingString:v131];
  v132 = (void *)objc_claimAutoreleasedReturnValue();

  v133 = objc_alloc(NSString);
  [v11 prerequisiteReleaseType];
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = (void *)[v133 initWithFormat:@"prerequisiteReleaseType:%@|", v134];
  [v132 stringByAppendingString:v135];
  v136 = (void *)objc_claimAutoreleasedReturnValue();

  v137 = objc_alloc(NSString);
  v138 = -[SUCorePolicy productType](self, "productType");
  v139 = (void *)[v137 initWithFormat:@"productType:%@|", v138];
  [v136 stringByAppendingString:v139];
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  v141 = objc_alloc(NSString);
  v142 = -[SUCorePolicy hwModelStr](self, "hwModelStr");
  v143 = (void *)[v141 initWithFormat:@"hwModelStr:%@|", v142];
  [v140 stringByAppendingString:v143];
  v144 = (void *)objc_claimAutoreleasedReturnValue();

  v145 = objc_alloc(NSString);
  v146 = -[SUCorePolicy deviceClass](self, "deviceClass");
  v147 = (void *)[v145 initWithFormat:@"deviceClass:%@|", v146];
  [v144 stringByAppendingString:v147];
  v148 = (void *)objc_claimAutoreleasedReturnValue();

  v149 = objc_alloc(NSString);
  v150 = -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
  v151 = (void *)[v149 initWithFormat:@"buildVersion:%@|", v150];
  [v148 stringByAppendingString:v151];
  v152 = (void *)objc_claimAutoreleasedReturnValue();

  v153 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"timeout:%ld|",  objc_msgSend(v11, "timeoutIntervalForResource"));
  [v152 stringByAppendingString:v153];
  v154 = (void *)objc_claimAutoreleasedReturnValue();

  v155 = objc_alloc(NSString);
  v156 = -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v157 = [v156 specifiedFields];
  if ((v157 & 0x100) != 0)
  {
    v152 = -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
    [v152 sessionId];
    v158 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v158 = @"nil";
  }

  v159 = (void *)[v155 initWithFormat:@"sessionId:%@|", v158];
  [v154 stringByAppendingString:v159];
  v160 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v157 & 0x100) != 0)
  {
  }

  v161 = objc_alloc(NSString);
  v162 = -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v163 = [v162 specifiedFields];
  if ((v163 & 0x200) != 0)
  {
    v152 = -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
    [v152 rampingScanType];
    v164 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v164 = @"nil";
  }

  v165 = (void *)[v161 initWithFormat:@"rampingScanType:%@|", v164];
  [v160 stringByAppendingString:v165];
  v166 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v163 & 0x200) != 0)
  {
  }

  v167 = objc_alloc(NSString);
  v168 = [v11 liveServerCatalogOnly];
  v169 = @"NO";
  if (v168) {
    v169 = @"YES";
  }
  v170 = (void *)[v167 initWithFormat:@"liveServerCatalogOnly:%@|", v169];
  [v166 stringByAppendingString:v170];
  v82 = (__CFString *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896127A0] sharedLogger];
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  [v171 oslog];
  v172 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)v191 = v82;
    _os_log_impl( &dword_187A54000,  v172,  OS_LOG_TYPE_DEFAULT,  "[POLICY] software update catalog download options: %{public}@",  buf,  0xCu);
  }

  v187 = 0u;
  v188 = 0u;
  v185 = 0u;
  v186 = 0u;
  v83 = -[SUCorePolicy policyExtensions](self, "policyExtensions");
  v173 = [v83 countByEnumeratingWithState:&v185 objects:v189 count:16];
  if (v173)
  {
    v174 = v173;
    v182 = v82;
    v175 = *(void *)v186;
    do
    {
      for (i = 0LL; i != v174; ++i)
      {
        if (*(void *)v186 != v175) {
          objc_enumerationMutation(v83);
        }
        v177 = *(void **)(*((void *)&v185 + 1) + 8 * i);
        [MEMORY[0x1896127A0] sharedLogger];
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        [v178 oslog];
        v179 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v179, OS_LOG_TYPE_DEFAULT))
        {
          [v177 extensionName];
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(void *)v191 = v180;
          _os_log_impl( &dword_187A54000,  v179,  OS_LOG_TYPE_DEFAULT,  "[POLICY] extending software update catalog download options for extension %{public}@",  buf,  0xCu);
        }

        [v177 extendMASoftwareUpdateCatalogDownloadOptions:v11];
      }

      v174 = [v83 countByEnumeratingWithState:&v185 objects:v189 count:16];
    }

    while (v174);
    id v7 = v183;
    id v6 = v184;
    v82 = v182;
  }

  else
  {
    id v7 = v183;
    id v6 = v184;
  }

  [MEMORY[0x1896127A0] sharedLogger];
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  [v120 oslog];
  v121 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)v141 = v103;
    _os_log_impl( &dword_187A54000,  v121,  OS_LOG_TYPE_DEFAULT,  "[POLICY] documentation catalog download options: %{public}@",  buf,  0xCu);
  }

  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  v104 = -[SUCorePolicy policyExtensions](self, "policyExtensions");
  v122 = [v104 countByEnumeratingWithState:&v135 objects:v139 count:16];
  if (v122)
  {
    v123 = v122;
    v133 = v103;
    v124 = v11;
    v125 = v7;
    v126 = *(void *)v136;
    do
    {
      for (i = 0LL; i != v123; ++i)
      {
        if (*(void *)v136 != v126) {
          objc_enumerationMutation(v104);
        }
        v128 = *(void **)(*((void *)&v135 + 1) + 8 * i);
        [MEMORY[0x1896127A0] sharedLogger];
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        [v129 oslog];
        v130 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
        {
          [v128 extensionName];
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(void *)v141 = v131;
          _os_log_impl( &dword_187A54000,  v130,  OS_LOG_TYPE_DEFAULT,  "[POLICY] extending documentation catalog download options for extension %{public}@",  buf,  0xCu);
        }

        [v128 extendMADocumentationCatalogDownloadOptions:v124 descriptor:v125];
      }

      v123 = [v104 countByEnumeratingWithState:&v135 objects:v139 count:16];
    }

    while (v123);
    v103 = v133;
    id v6 = v134;
    id v7 = v125;
    uint64_t v11 = v124;
  }

LABEL_84:
  return v11;
}

LABEL_59:
  return v11;
}

LABEL_45:
  return v8;
}

LABEL_119:
  if (!v60)
  {
LABEL_114:
    if (v59) {
      goto LABEL_115;
    }
    goto LABEL_121;
  }

LABEL_120:
  if (v59)
  {
LABEL_115:

    if (!v58) {
      goto LABEL_123;
    }
    goto LABEL_122;
  }

LABEL_123:
  if (*(_DWORD *)&v233[8])
  {
  }

  if (*(_DWORD *)&v233[12])
  {
  }

  if (*(_DWORD *)&v233[16])
  {
  }

  if (*(_DWORD *)&v233[20])
  {
  }

  if (*(_DWORD *)&v233[24])
  {
  }

  if (v235 == v234)
  {
  }

LABEL_136:
  return v57;
}

uint64_t preflightSUDownloadCallback(void *a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [a1 safeDescriptionWithName:@"status"];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl( &dword_187A54000,  v3,  OS_LOG_TYPE_DEFAULT,  "[MSU] software update preflight download SU %{public}@",  (uint8_t *)&v6,  0xCu);
  }

  return 0LL;
}

uint64_t preflightPersonalizeCallback(void *a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [a1 safeDescriptionWithName:@"status"];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl( &dword_187A54000,  v3,  OS_LOG_TYPE_DEFAULT,  "[MSU] preflight personalize %{public}@",  (uint8_t *)&v6,  0xCu);
  }

  return 0LL;
}

uint64_t preflightFDRRecoveryCallback(void *a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [a1 safeDescriptionWithName:@"status"];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl( &dword_187A54000,  v3,  OS_LOG_TYPE_DEFAULT,  "[MSU] preflight FDRRecovery %{public}@",  (uint8_t *)&v6,  0xCu);
  }

  return 0LL;
}

uint64_t preflightWakeupCallback(void *a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [a1 safeDescriptionWithName:@"status"];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_187A54000, v3, OS_LOG_TYPE_DEFAULT, "[MSU] preflight wakeup %{public}@", (uint8_t *)&v6, 0xCu);
  }

  return 0LL;
}

uint64_t preflightPrerequisiteCheckCallback(void *a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [a1 safeDescriptionWithName:@"status"];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl( &dword_187A54000,  v3,  OS_LOG_TYPE_DEFAULT,  "[MSU] preflight prerequisite check %{public}@",  (uint8_t *)&v6,  0xCu);
  }

  return 0LL;
}

void sub_187AD3768( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
}

uint64_t prepareCallback(uint64_t a1, id *a2)
{
  if (a2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      return [*a2 prepareProgress:a1];
    }
    [MEMORY[0x1896127A0] sharedLogger];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 oslog];
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      prepareCallback_cold_2();
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 oslog];
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      prepareCallback_cold_1();
    }
  }

  return 0LL;
}

void sub_187AD43D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t applyCallback(uint64_t a1, id *a2)
{
  if (a2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      return [*a2 applyProgress:a1];
    }
    [MEMORY[0x1896127A0] sharedLogger];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 oslog];
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      applyCallback_cold_2();
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 oslog];
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      applyCallback_cold_1();
    }
  }

  return 0LL;
}

void sub_187AD6344( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void OUTLINED_FUNCTION_3_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

LABEL_16:
  id v21 = v9;
  return v21;
}

void sub_187AE304C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

LABEL_38:
    -[SUCoreDDMDeclaration isValidDeclarationWithReason:].cold.1();
    goto LABEL_39;
  }

  -[SUCoreDDMDeclaration buildVersionString](self, "buildVersionString");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13) {
    goto LABEL_13;
  }
  [NSString stringWithFormat:@"Invalid declaration: no target version set"];
  uint64_t v8 = (id)objc_claimAutoreleasedReturnValue();
  v30 = +[SUCoreDDMUtilities sharedLogger](&OBJC_CLASS___SUCoreDDMUtilities, "sharedLogger");
  [v30 oslog];
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
LABEL_8:
  }
    -[SUCoreDDMDeclaration isValidDeclarationWithReason:].cold.1();
LABEL_9:

  if (a3)
  {
    uint64_t v8 = v8;
    id v12 = 0;
    *a3 = v8;
  }

  else
  {
    id v12 = 0;
  }

void prepareCallback_cold_1()
{
}

void prepareCallback_cold_2()
{
}

void applyCallback_cold_1()
{
}

void applyCallback_cold_2()
{
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x18960DAA0]();
}

CFStringRef CFBundleCopyLocalizedString( CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x189602828](bundle, key, value, tableName);
}

CFURLRef CFBundleCopyResourceURL( CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x189602850](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1896028A0](allocator, bundleURL);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x189602C08](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue( CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x189602F98](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

uint64_t CacheDeleteCopyAvailableSpaceForVolume()
{
  return MEMORY[0x18960D590]();
}

uint64_t CacheDeleteCopyPurgeableSpaceWithInfo()
{
  return MEMORY[0x18960D598]();
}

uint64_t CacheDeletePurgeSpaceWithInfo()
{
  return MEMORY[0x18960D5A0]();
}

IOReturn IOPMAssertionCreateWithName( CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1896083A8](AssertionType, *(void *)&AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1896083D0](*(void *)&AssertionID);
}

uint64_t MAPurgeAll()
{
  return MEMORY[0x1896110B0]();
}

uint64_t MAPurgeAllExceptGivenIds()
{
  return MEMORY[0x1896110B8]();
}

uint64_t MAStringForMADownloadResult()
{
  return MEMORY[0x1896110C0]();
}

uint64_t MAStringForMAQueryResult()
{
  return MEMORY[0x1896110C8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1896136F0]();
}

uint64_t MSUApplyUpdate()
{
  return MEMORY[0x189611580]();
}

uint64_t MSUAssetCalculateApplySize()
{
  return MEMORY[0x189611588]();
}

uint64_t MSUAssetCalculatePrepareSize()
{
  return MEMORY[0x189611590]();
}

uint64_t MSUBrainIsLoadable()
{
  return MEMORY[0x189611598]();
}

uint64_t MSUCommitStash()
{
  return MEMORY[0x1896115A0]();
}

uint64_t MSUGetUpdateInfo()
{
  return MEMORY[0x1896115A8]();
}

uint64_t MSUPreflightUpdate()
{
  return MEMORY[0x1896115B0]();
}

uint64_t MSUPrepareUpdate()
{
  return MEMORY[0x1896115B8]();
}

uint64_t MSUPrepareUpdateWithMAAsset()
{
  return MEMORY[0x1896115C0]();
}

uint64_t MSUPurgeSuspendedUpdate()
{
  return MEMORY[0x1896115C8]();
}

uint64_t MSUResumeUpdateWithOptions()
{
  return MEMORY[0x1896115D0]();
}

uint64_t MSURetrievePreviousUpdateState()
{
  return MEMORY[0x1896115D8]();
}

uint64_t MSUSuspendUpdate()
{
  return MEMORY[0x1896115E0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1895F8D88]();
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x1895FA5E8](*(void *)&a1, a2, a3);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1895FB418](a1, a2, a3, *(void *)&a4);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FB4F8](a1, a2, a3, a4, *(void *)&a5);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1895FC1B0](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1896165F8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1895FD018](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}

uint64_t xpc_activity_copy_identifier()
{
  return MEMORY[0x1895FD778]();
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1895FE008]();
}

uint64_t objc_msgSend_SUCoreBorder_loadSync_allowingDifferences_withPurpose_error_simulateForDescriptor_simulateForType_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_SUCoreBorder_loadSync_allowingDifferences_withPurpose_error_simulateForDescriptor_simulateForType_);
}

uint64_t objc_msgSend_SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler_);
}

uint64_t objc_msgSend__SUCoreBorder_MAAssetResultAtEnd_withDescriptor_type_withResult_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__SUCoreBorder_MAAssetResultAtEnd_withDescriptor_type_withResult_error_);
}

uint64_t objc_msgSend__SUCoreBorder_MACancelDownloadResultAtEnd_withResult_withCompletion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__SUCoreBorder_MACancelDownloadResultAtEnd_withResult_withCompletion_);
}

uint64_t objc_msgSend__SUCoreBorder_MADownloadResultAtEnd_withResult_withError_withCompletion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__SUCoreBorder_MADownloadResultAtEnd_withResult_withError_withCompletion_);
}

uint64_t objc_msgSend__SUCoreBorder_MAPurgeResultAtEnd_withResult_withError_withCompletion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__SUCoreBorder_MAPurgeResultAtEnd_withResult_withError_withCompletion_);
}

uint64_t objc_msgSend__SUCoreBorder_MAQueryResultAtEnd_withResult_withError_withCompletion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__SUCoreBorder_MAQueryResultAtEnd_withResult_withError_withCompletion_);
}

uint64_t objc_msgSend__addUpdateMetricsEventFieldsToMSURollbackOptions_usingPolicy_rollbackDescriptor_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__addUpdateMetricsEventFieldsToMSURollbackOptions_usingPolicy_rollbackDescriptor_);
}

uint64_t objc_msgSend__checkEndComplete_scanPolicy_primary_secondary_error_clearingTransaction_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__checkEndComplete_scanPolicy_primary_secondary_error_clearingTransaction_);
}

uint64_t objc_msgSend__checkMajorMinorEndComplete_scanPolicy_majorPrimary_majorSecondary_minorPrimary_minorSecondary_error_clearingTransaction_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__checkMajorMinorEndComplete_scanPolicy_majorPrimary_majorSecondary_minorPrimary_minorSecondary_error_clearingTransaction_);
}

uint64_t objc_msgSend__checkMinimumRequiredSpace_purgingFromBase_userInitiated_totalRequiredFreeSpace_freeSpaceAvailable_checkAvailableSpaceTransaction_withCompletionQueue_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__checkMinimumRequiredSpace_purgingFromBase_userInitiated_totalRequiredFreeSpace_freeSpaceAvailable_checkAvailableSpaceTransaction_withCompletionQueue_completion_);
}

uint64_t objc_msgSend__checkSlowReleaseEndComplete_scanPolicy_primary_secondary_alternatePrimary_alternateSecondary_error_clearingTransaction_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__checkSlowReleaseEndComplete_scanPolicy_primary_secondary_alternatePrimary_alternateSecondary_error_clearingTransaction_);
}

uint64_t objc_msgSend__decideAndProcessPSUSScanForPrimaryDescriptor_secondaryDescriptor_andError_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__decideAndProcessPSUSScanForPrimaryDescriptor_secondaryDescriptor_andError_);
}

uint64_t objc_msgSend__issueAppOffloadPurgeCompetion_withCompletionQueue_result_spacePurged_error_releasingTransaction_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__issueAppOffloadPurgeCompetion_withCompletionQueue_result_spacePurged_error_releasingTransaction_);
}

uint64_t objc_msgSend__issueSpaceCheckCompletion_withCompletionQueue_haveEnoughSpace_haveTotalRequired_freeSpaceAvailable_error_releasingTransaction_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__issueSpaceCheckCompletion_withCompletionQueue_haveEnoughSpace_haveTotalRequired_freeSpaceAvailable_error_releasingTransaction_);
}

uint64_t objc_msgSend__issueSpacePurgeableCompetion_withCompletionQueue_result_spacePurgeable_error_releasingTransaction_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__issueSpacePurgeableCompetion_withCompletionQueue_result_spacePurgeable_error_releasingTransaction_);
}

uint64_t objc_msgSend__locateEndComplete_scanPolicy_primary_secondary_error_clearingTransaction_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__locateEndComplete_scanPolicy_primary_secondary_error_clearingTransaction_);
}

uint64_t objc_msgSend__newMSURollbackOptionsUsingPolicy_rollbackDescriptor_baseOptions_additionalOptions_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__newMSURollbackOptionsUsingPolicy_rollbackDescriptor_baseOptions_additionalOptions_);
}

uint64_t objc_msgSend__newPreflightOptionsUsingPolicy_subPolicyClass_descriptor_baseOptions_additionalOptions_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__newPreflightOptionsUsingPolicy_subPolicyClass_descriptor_baseOptions_additionalOptions_);
}

uint64_t objc_msgSend__reloadDescriptor_allowingDifferences_forceReload_skipMSU_defaultValues_pSUReloadError_pDocReloadError_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__reloadDescriptor_allowingDifferences_forceReload_skipMSU_defaultValues_pSUReloadError_pDocReloadError_);
}

uint64_t objc_msgSend__scanCompleteFoundPrimary_foundSecondary_majorPrimary_majorSecondary_minorPrimary_minorSecondary_clearingOperation_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__scanCompleteFoundPrimary_foundSecondary_majorPrimary_majorSecondary_minorPrimary_minorSecondary_clearingOperation_error_);
}

uint64_t objc_msgSend__stateSafeSelectBestAssetFromMultipleAssetArray_bestAsset_selectionReason_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__stateSafeSelectBestAssetFromMultipleAssetArray_bestAsset_selectionReason_);
}

uint64_t objc_msgSend__updateInterimScanResultForSplomboWithPrimary_secondary_majorPrimary_majorSecondary_minorPrimary_minorSecondary_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__updateInterimScanResultForSplomboWithPrimary_secondary_majorPrimary_majorSecondary_minorPrimary_minorSecondary_error_);
}

uint64_t objc_msgSend__updateInterimScanResultWithPrimary_secondary_majorPrimary_majorSecondary_minorPrimary_minorSecondary_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__updateInterimScanResultWithPrimary_secondary_majorPrimary_majorSecondary_minorPrimary_minorSecondary_error_);
}

uint64_t objc_msgSend__verifyEndComplete_scanPolicy_active_primary_secondary_error_clearingTransaction_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__verifyEndComplete_scanPolicy_active_primary_secondary_error_clearingTransaction_);
}

uint64_t objc_msgSend_assignDescriptorAudienceType_descriptorPreferredUpdateType_assetAudienceUUID_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_assignDescriptorAudienceType_descriptorPreferredUpdateType_assetAudienceUUID_);
}

uint64_t objc_msgSend_cacheDeletePurge_fromBasePath_cacheDeleteUrgency_timeout_withCompletionQueue_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_cacheDeletePurge_fromBasePath_cacheDeleteUrgency_timeout_withCompletionQueue_completion_);
}

uint64_t objc_msgSend_cacheDeletePurge_fromBasePath_cacheDeleteUrgency_withCompletionQueue_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_cacheDeletePurge_fromBasePath_cacheDeleteUrgency_withCompletionQueue_completion_);
}

uint64_t objc_msgSend_checkAvailableFreeSpace_checkingFromBase_withIdentifier_userInitiated_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_checkAvailableFreeSpace_checkingFromBase_withIdentifier_userInitiated_completion_);
}

uint64_t objc_msgSend_checkAvailableSpace_allowPurgeWithUrgency_purgingFromBase_minimalRequiredFreeSpace_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_checkAvailableSpace_allowPurgeWithUrgency_purgingFromBase_minimalRequiredFreeSpace_completion_);
}

uint64_t objc_msgSend_checkAvailableSpace_allowPurgeWithUrgency_purgingFromBase_minimalRequiredFreeSpace_withCompletionQueue_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_checkAvailableSpace_allowPurgeWithUrgency_purgingFromBase_minimalRequiredFreeSpace_withCompletionQueue_completion_);
}

uint64_t objc_msgSend_checkPurgeableSpaceCacheDelete_fromBasePath_cacheDeleteUrgency_timeout_additionalOptions_withCompletionQueue_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_checkPurgeableSpaceCacheDelete_fromBasePath_cacheDeleteUrgency_timeout_additionalOptions_withCompletionQueue_completion_);
}

uint64_t objc_msgSend_checkPurgeableSpaceCacheDelete_fromBasePath_cacheDeleteUrgency_withCompletionQueue_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_checkPurgeableSpaceCacheDelete_fromBasePath_cacheDeleteUrgency_withCompletionQueue_completion_);
}

uint64_t objc_msgSend_checkPurgeableSpaceOffloadApps_cacheDeleteUrgency_withCompletionQueue_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_checkPurgeableSpaceOffloadApps_cacheDeleteUrgency_withCompletionQueue_completion_);
}

uint64_t objc_msgSend_checkPurgeableSpaceOffloadApps_fromBasePath_cacheDeleteUrgency_withCompletionQueue_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_checkPurgeableSpaceOffloadApps_fromBasePath_cacheDeleteUrgency_withCompletionQueue_completion_);
}

uint64_t objc_msgSend_constructMADocumentationCatalogDownloadOptionsWithUUID_usingDescriptor_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_constructMADocumentationCatalogDownloadOptionsWithUUID_usingDescriptor_);
}

uint64_t objc_msgSend_constructMASoftwareUpdateCatalogDownloadOptionsWithUUID_assetAudience_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_constructMASoftwareUpdateCatalogDownloadOptionsWithUUID_assetAudience_);
}

uint64_t objc_msgSend_downloadDocumentationAssetWithPolicy_withUUID_stashingDocumentationForBuild_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_downloadDocumentationAssetWithPolicy_withUUID_stashingDocumentationForBuild_completion_);
}

uint64_t objc_msgSend_dumpTracked_dumpingTo_usingFilename_clearingStatistics_clearingHistory_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_dumpTracked_dumpingTo_usingFilename_clearingStatistics_clearingHistory_);
}

uint64_t objc_msgSend_getAllowSameProductVersionPredicateResultWithAssetOSVersion_assetBuildVersion_prerequisiteProductVersion_prerequisiteBuildVersion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_getAllowSameProductVersionPredicateResultWithAssetOSVersion_assetBuildVersion_prerequisiteProductVersion_prerequisiteBuildVersion_);
}

uint64_t objc_msgSend_getNoAllowSameProductVersionPredicateResultWithAssetOSVersion_assetBuildVersion_prerequisiteProductVersion_prerequisiteBuildVersion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_getNoAllowSameProductVersionPredicateResultWithAssetOSVersion_assetBuildVersion_prerequisiteProductVersion_prerequisiteBuildVersion_);
}

uint64_t objc_msgSend_initMachine_ofInstance_withTable_startingIn_usingDelegate_registeringAllInfoClass_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initMachine_ofInstance_withTable_startingIn_usingDelegate_registeringAllInfoClass_);
}

uint64_t objc_msgSend_initTargetPhase_policy_downloadProgress_prepareProgress_applyProgress_rollback_resultCode_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initTargetPhase_policy_downloadProgress_prepareProgress_applyProgress_rollback_resultCode_error_);
}

uint64_t objc_msgSend_initWithDelegate_forAsset_updateUUID_withCallbackQueue_withCompletionQueue_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithDelegate_forAsset_updateUUID_withCallbackQueue_withCompletionQueue_);
}

uint64_t objc_msgSend_initWithMajorPrimaryDescriptor_majorSecondaryDescriptor_minorPrimaryDescriptor_minorSecondaryDescriptor_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithMajorPrimaryDescriptor_majorSecondaryDescriptor_minorPrimaryDescriptor_minorSecondaryDescriptor_);
}

uint64_t objc_msgSend_initWithPhase_isStalled_portionComplete_totalWrittenBytes_totalExpectedBytes_remaining_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithPhase_isStalled_portionComplete_totalWrittenBytes_totalExpectedBytes_remaining_);
}

uint64_t objc_msgSend_initWithPhase_isStalled_portionComplete_totalWrittenBytes_totalExpectedBytes_remaining_taskDescription_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithPhase_isStalled_portionComplete_totalWrittenBytes_totalExpectedBytes_remaining_taskDescription_);
}

uint64_t objc_msgSend_initWithProductVersion_productBuildVersion_releaseType_measurement_measurementAlgorithm_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithProductVersion_productBuildVersion_releaseType_measurement_measurementAlgorithm_);
}

uint64_t objc_msgSend_initWithSoftwareUpdateAssetType_documentationAssetType_usingExtensions_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithSoftwareUpdateAssetType_documentationAssetType_usingExtensions_);
}

uint64_t objc_msgSend_initWithSoftwareUpdateAssetType_documentationAssetType_usingPolicies_usingExtensions_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithSoftwareUpdateAssetType_documentationAssetType_usingPolicies_usingExtensions_);
}

uint64_t objc_msgSend_initWithUpdateBrainPath_updateBundlePath_bundleAttributes_descriptorType_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithUpdateBrainPath_updateBundlePath_bundleAttributes_descriptorType_);
}

uint64_t objc_msgSend_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler_);
}

uint64_t objc_msgSend_offloadAppsPurge_fromBasePath_cacheDeleteUrgency_withCompletionQueue_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_offloadAppsPurge_fromBasePath_cacheDeleteUrgency_withCompletionQueue_completion_);
}

uint64_t objc_msgSend_persistenceWithPersistenceSurvivingReboot_persistenceSurvivingRelaunch_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_persistenceWithPersistenceSurvivingReboot_persistenceSurvivingRelaunch_);
}

uint64_t objc_msgSend_queue_getDocumentation_documentationData_forInstalledUpdateType_withError_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_queue_getDocumentation_documentationData_forInstalledUpdateType_withError_);
}

uint64_t objc_msgSend_registrationWithIdentifier_contextualPredicate_dismissalPolicy_deviceSet_clientIdentifier_mustWake_qualityOfService_callback_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_registrationWithIdentifier_contextualPredicate_dismissalPolicy_deviceSet_clientIdentifier_mustWake_qualityOfService_callback_);
}

uint64_t objc_msgSend_reloadDescriptor_allowingDifferences_forceReload_defaultValues_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_reloadDescriptor_allowingDifferences_forceReload_defaultValues_completion_);
}

uint64_t objc_msgSend_reloadDescriptor_allowingDifferences_forceReload_skipMSU_defaultValues_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_reloadDescriptor_allowingDifferences_forceReload_skipMSU_defaultValues_completion_);
}

uint64_t objc_msgSend_safeDescriptionWithName_maxNestedLevel_withMaxValueLength_providingSubstitutionMap_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_safeDescriptionWithName_maxNestedLevel_withMaxValueLength_providingSubstitutionMap_);
}

uint64_t objc_msgSend_safeSubDescriptionAtNestedLevel_instanceAtLevel_withMaxValueLength_providingSubstitutionMap_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_safeSubDescriptionAtNestedLevel_instanceAtLevel_withMaxValueLength_providingSubstitutionMap_);
}

uint64_t objc_msgSend_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery_);
}

uint64_t objc_msgSend_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion_);
}