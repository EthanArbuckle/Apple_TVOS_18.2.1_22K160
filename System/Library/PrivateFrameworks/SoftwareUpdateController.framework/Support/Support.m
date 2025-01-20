void sub_100006FE8(void *a1)
{
  SUControllerCore *v1;
  void *v2;
  void *v3;
  CFStringRef v4;
  uint64_t v5;
  id v6;
  if (a1[4] || a1[5] || a1[6])
  {
    v1 = -[SUControllerCore initWithAttachedClients:withConfig:withAutoInstallManager:]( objc_alloc(&OBJC_CLASS___SUControllerCore),  "initWithAttachedClients:withConfig:withAutoInstallManager:",  a1[4],  a1[5],  a1[6]);
    v2 = (void *)qword_100079608;
    qword_100079608 = (uint64_t)v1;

    if (qword_100079608) {
      return;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
    v4 = @"attempt to alloc/init controller core failed";
    v6 = v3;
    v5 = 8100LL;
  }

  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
    v4 = @"attempt to determine previously allocated shared controller core when first reference did not provide required parameters";
    v6 = v3;
    v5 = 8101LL;
  }

  [v3 trackAnomaly:@"[CONTROLLER_CORE]" forReason:v4 withResult:v5 withError:0];
}

LABEL_6:
  v12 = (void *)objc_claimAutoreleasedReturnValue([v2 policyEngine]);
  v13 = [v12 activateLoadingPersisted];

  return v13;
}

void sub_100007508(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v2 completionQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000075F8;
    block[3] = &unk_100064888;
    id v6 = *(id *)(a1 + 32);
    dispatch_async(v3, block);
  }

  else
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
    [v4 trackAnomaly:@"[CONTROLLER_CORE]" forReason:@"purgeScanContent without completion" withResult:8101 withError:0];
  }
}

uint64_t sub_1000075F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100007934(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) policyEngine]);
  uint64_t v4 = *(void *)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 72);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100007A08;
  v9[3] = &unk_1000648D8;
  id v10 = v3;
  id v6 = *(id *)(a1 + 56);
  v8 = *(void **)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  id v11 = v6;
  uint64_t v13 = v7;
  id v12 = v8;
  [v2 modifyConfigForClient:v4 alteringConfig:v10 forChangeMask:v5 completion:v9];
}

void sub_100007A08(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = [*(id *)(a1 + 32) isEqual:*(void *)(a1 + 40)];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (!v10) {
      goto LABEL_7;
    }
    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) summary]);
    *(_DWORD *)buf = 138543362;
    v21 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[CONTROLLER_CORE] {modifyConfigForClient} no changes to configuration: %{public}@",  buf,  0xCu);
  }

  else
  {
    if (!v10) {
      goto LABEL_7;
    }
    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) changeSummary:*(void *)(a1 + 56)]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) summary]);
    *(_DWORD *)buf = 138543618;
    v21 = v11;
    __int16 v22 = 2114;
    v23 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[CONTROLLER_CORE] {modifyConfigForClient} changes[%{public}@] made to configuration: %{public}@",  buf,  0x16u);
  }

LABEL_7:
  if (*(void *)(a1 + 48))
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v13 completionQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100007C54;
    block[3] = &unk_1000648B0;
    id v19 = *(id *)(a1 + 48);
    id v17 = v5;
    id v18 = v6;
    dispatch_async(v14, block);

    v15 = v19;
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
    [v15 trackAnomaly:@"[CONTROLLER_CORE]" forReason:@"modifyConfigForClient without completion" withResult:8101 withError:0];
  }
}

uint64_t sub_100007C54(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

void sub_100007D28(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (*(void *)(a1 + 32))
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v10 completionQueue]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100007E6C;
    v13[3] = &unk_100064928;
    id v17 = *(id *)(a1 + 32);
    id v14 = v7;
    id v15 = v8;
    id v16 = v9;
    dispatch_async(v11, v13);
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
    [v12 trackAnomaly:@"[CONTROLLER_CORE]" forReason:@"managerStatusForClient without completion" withResult:8101 withError:0];
  }
}

uint64_t sub_100007E6C(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16LL))(a1[7], a1[4], a1[5], a1[6]);
}

void sub_100007F40(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (*(void *)(a1 + 32))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    BOOL v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v9 completionQueue]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100008068;
    v12[3] = &unk_100064978;
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = a2;
    id v13 = v7;
    id v14 = v8;
    dispatch_async(v10, v12);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
    [v11 trackAnomaly:@"[CONTROLLER_CORE]" forReason:@"managerStateForClient without completion" withResult:8101 withError:0];
  }
}

uint64_t sub_100008068(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16LL))(a1[6], a1[7], a1[4], a1[5]);
}

void sub_10000813C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 32))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 completionQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100008260;
    block[3] = &unk_1000648B0;
    id v13 = *(id *)(a1 + 32);
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v8, block);
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
    [v9 trackAnomaly:@"[CONTROLLER_CORE]" forReason:@"managerConfigForClient without completion" withResult:8101 withError:0];
  }
}

uint64_t sub_100008260(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

void sub_1000084D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 completionQueue]);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000085D4;
    v7[3] = &unk_1000649F0;
    id v9 = *(id *)(a1 + 32);
    id v8 = v3;
    dispatch_async(v5, v7);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
    [v6 trackAnomaly:@"[CONTROLLER_CORE]" forReason:@"purgeUpdateForClient without completion" withResult:8101 withError:0];
  }
}

uint64_t sub_1000085D4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_10000A1E4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100012D48(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v16 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = *(void **)(a1 + 32);
  if (v8)
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 policyFSM]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 diag]);
    objc_msgSend( v11,  "trackAnomaly:forReason:withResult:withError:",  @"[POLICY]",  @"error checking for existing assets (when should have a prepared update)",  objc_msgSend(v8, "code"),  v8);

    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) policyFSM]);
  }

  else
  {
    unsigned int v13 = [v9 isLoadedValidMatch:v16 suAssets:v7];
    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) policyFSM]);
    if (!v13)
    {
      id v14 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
      id v15 = @"PurgeCheckedMismatch";
      goto LABEL_6;
    }
  }

  id v14 = -[SUControllerPolicyParam initWithDocAssetIDs:suAssetIDs:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyParam),  "initWithDocAssetIDs:suAssetIDs:",  v16,  v7);
  id v15 = @"PurgeCheckedMatch";
LABEL_6:
  [v12 postEvent:v15 withInfo:v14];
}

void sub_100013014(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = v9;
  if (!v7 || v8 || v9)
  {
    id v19 = *(void **)(a1 + 40);
    v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) summary]);
    id v21 = +[SUControllerSUCore newSafeErrorDescription:]( &OBJC_CLASS___SUControllerSUCore,  "newSafeErrorDescription:",  v8);
    id v22 = +[SUControllerSUCore newSafeErrorDescription:]( &OBJC_CLASS___SUControllerSUCore,  "newSafeErrorDescription:",  v10);
    [v19 policyLogError:0, @"[POLICY_RELOAD] failed reload of primary descriptor:%@\nSU error:%@\ndoc error:%@", v20, v21, v22 message];

LABEL_9:
    v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) policyFSM]);
    v25 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
    v26 = @"ReloadDescriptorsFailed";
LABEL_10:
    [v24 postEvent:v26 withInfo:v25];

    goto LABEL_11;
  }

  unsigned int v11 = [*(id *)(a1 + 32) isEqual:v7];
  id v12 = *(void **)(a1 + 40);
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v7 summary]);
  id v14 = (void *)v13;
  if (!v11)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) summary]);
    [v12 policyLogError:0, @"[POLICY_RELOAD] reloaded primary descriptor:%@ does not match persisted primary:%@", v14, v23 message];

    goto LABEL_9;
  }

  [v12 policyLog:@"[POLICY_RELOAD] successfully reloaded primary descriptor:%@", v13];

  if (!*(void *)(a1 + 48))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) policyFSM]);
    v25 = -[SUControllerPolicyParam initWithPrimaryDescriptor:withSecondaryDescriptor:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyParam),  "initWithPrimaryDescriptor:withSecondaryDescriptor:",  v7,  0LL);
    v26 = @"ReloadDescriptorsSuccess";
    goto LABEL_10;
  }

  id v15 = v7;
  id v16 = *(void **)(a1 + 48);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100013248;
  v27[3] = &unk_1000650C0;
  id v17 = v16;
  uint64_t v18 = *(void *)(a1 + 40);
  id v28 = v17;
  uint64_t v29 = v18;
  id v30 = v15;
  +[SUCoreMobileAsset reloadDescriptor:completion:]( &OBJC_CLASS___SUCoreMobileAsset,  "reloadDescriptor:completion:",  v17,  v27);

LABEL_11:
}

void sub_100013248(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v22 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v22 || v7 || v8)
  {
    id v17 = *(void **)(a1 + 40);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) summary]);
    id v19 = +[SUControllerSUCore newSafeErrorDescription:]( &OBJC_CLASS___SUControllerSUCore,  "newSafeErrorDescription:",  v7);
    id v20 = +[SUControllerSUCore newSafeErrorDescription:]( &OBJC_CLASS___SUControllerSUCore,  "newSafeErrorDescription:",  v9);
    [v17 policyLogError:0, @"[POLICY_RELOAD] failed reload of secondary descriptor:%@\nSU error:%@\ndoc error:%@", v18, v19, v20 message];

LABEL_8:
    id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) policyFSM]);
    id v15 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
    id v16 = @"ReloadDescriptorsFailed";
    goto LABEL_9;
  }

  unsigned int v10 = [*(id *)(a1 + 32) isEqual:v22];
  unsigned int v11 = *(void **)(a1 + 40);
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v22 summary]);
  uint64_t v13 = (void *)v12;
  if (!v10)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) summary]);
    [v11 policyLogError:0, @"[POLICY_RELOAD] reloaded secondary descriptor:%@ does not match persisted secondary:%@", v13, v21 message];

    goto LABEL_8;
  }

  [v11 policyLog:@"[POLICY_RELOAD] successfully reloaded secondary descriptor:%@", v12];

  id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) policyFSM]);
  id v15 = -[SUControllerPolicyParam initWithPrimaryDescriptor:withSecondaryDescriptor:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyParam),  "initWithPrimaryDescriptor:withSecondaryDescriptor:",  *(void *)(a1 + 48),  v22);
  id v16 = @"ReloadDescriptorsSuccess";
LABEL_9:
  [v14 postEvent:v16 withInfo:v15];
}

void sub_10001434C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) policyFSM]);
  if (v8)
  {
    id v6 = -[SUControllerPolicyParam initWithError:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyParam),  "initWithError:",  v8);
    id v7 = @"ScanCollectDocFailed";
  }

  else
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
    id v7 = @"ScanCollectDocSuccess";
  }

  [v5 postEvent:v7 withInfo:v6];
}

LABEL_13:
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    id v19 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
    id v21 = v18;
    id v20 = v22;
    goto LABEL_14;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerPolicyStatus policyStateName:]( &OBJC_CLASS___SUControllerPolicyStatus,  "policyStateName:",  -[SUControllerPolicyEngine updateTarget](self, "updateTarget")));
  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(PREPARE)[FOLLOWUP] update successfully prepared so attempt to install | updateTarget(%@)",  @"[__MILESTONE__]",  v17);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v19 = -[SUControllerPolicyParam initWithApplyInvokedBy:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyParam),  "initWithApplyInvokedBy:",  @"TestConfig");
  id v20 = @"UpdatePreparedInstall";
  id v21 = v18;
LABEL_14:
  [v21 followupEvent:v20 withInfo:v19];

  return 0LL;
}

  if ((v3 & 2) != 0)
  {
    v26 = objc_alloc(&OBJC_CLASS___NSString);
    if (-[SUControllerConfig performAutoDownloadAndPrepare](self, "performAutoDownloadAndPrepare")) {
      v27 = @"Y";
    }
    else {
      v27 = @"N";
    }
    id v28 = -[NSString initWithFormat:](v26, "initWithFormat:", @"|autoDownload:%@", v27);
    uint64_t v29 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v28));

    id v5 = (__CFString *)v29;
    if ((v3 & 4) == 0)
    {
LABEL_15:
      if ((v3 & 8) == 0) {
        goto LABEL_16;
      }
      goto LABEL_57;
    }
  }

  else if ((v3 & 4) == 0)
  {
    goto LABEL_15;
  }

  id v30 = objc_alloc(&OBJC_CLASS___NSString);
  if (-[SUControllerConfig performAutoInstall](self, "performAutoInstall")) {
    v31 = @"Y";
  }
  else {
    v31 = @"N";
  }
  v32 = -[NSString initWithFormat:](v30, "initWithFormat:", @"|autoInstall:%@", v31);
  v33 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v32));

  id v5 = (__CFString *)v33;
  if ((v3 & 8) == 0)
  {
LABEL_16:
    if ((v3 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_61;
  }

void sub_1000184FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100018514(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) policyFSM]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 diag]);
  [v3 trackBegin:@"activateLoadingPersisted" atLevel:1];

  __int16 v59 = 0;
  unsigned __int8 v58 = 0;
  +[SUCorePurge previousUpdateState:tetheredRestore:failedBackward:failedForward:]( &OBJC_CLASS___SUCorePurge,  "previousUpdateState:tetheredRestore:failedBackward:failedForward:",  (char *)&v59 + 1,  &v59,  &v58,  *(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  [*(id *)(a1 + 32) setFailedForward:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  uint64_t v4 = @"YES";
  if (HIBYTE(v59)) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  if ((_BYTE)v59) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  if (v58) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    uint64_t v4 = @"NO";
  }
  [*(id *)(a1 + 32) policyLog:@"[ACTIVATION] previous update state: successfulOTA:%@, tetheredRestore:%@, failedBackward:%@, failedForward:%@", v5, v6, v7, v4];
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) corePersisted]);
  unsigned int v9 = [v8 loadPersistedState];

  if (!v9)
  {
    v26 = @"[ACTIVATION] failed to load persisted state - starting new persisted state";
LABEL_34:
    [*(id *)(a1 + 32) policyLog:v26];
    [*(id *)(a1 + 32) notifyExternalStateChange];
    goto LABEL_35;
  }

  unsigned int v10 = objc_alloc(&OBJC_CLASS___SUControllerPolicyPersistedState);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) corePersisted]);
  uint64_t v12 = -[SUControllerPolicyPersistedState initWithPersisted:](v10, "initWithPersisted:", v11);
  [*(id *)(a1 + 32) setLoadedState:v12];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loadedState]);
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 lastOSVersion]);
  if (!v14) {
    goto LABEL_21;
  }
  id v15 = (void *)v14;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loadedState]);
  uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 lastBuildVersion]);
  if (!v17) {
    goto LABEL_20;
  }
  uint64_t v18 = (void *)v17;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loadedState]);
  uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 targetOSVersion]);
  if (!v20)
  {

LABEL_20:
    goto LABEL_21;
  }

  id v21 = (void *)v20;
  id v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loadedState]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 targetBuildVersion]);

  if (!v23) {
    goto LABEL_22;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loadedState]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 scanBaseUUID]);
  [*(id *)(a1 + 32) setPreservedScanBaseUUID:v25];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loadedState]);
  objc_msgSend(*(id *)(a1 + 32), "setPerservedScanRampingForeground:", objc_msgSend(v13, "scanRampingForeground"));
LABEL_21:

LABEL_22:
  v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loadedState]);
  uint64_t v28 = objc_claimAutoreleasedReturnValue([v27 lastOSVersion]);
  if (!v28)
  {
    v26 = @"[ACTIVATION] persisted state without minimal content - starting new persisted state";
LABEL_33:

    goto LABEL_34;
  }

  uint64_t v29 = (void *)v28;
  id v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loadedState]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 lastBuildVersion]);

  if (!v31)
  {
    v26 = @"[ACTIVATION] persisted state without minimal content - starting new persisted state";
    goto LABEL_34;
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loadedState]);
  uint64_t v32 = objc_claimAutoreleasedReturnValue([v27 targetOSVersion]);
  if (!v32)
  {
    v26 = @"[ACTIVATION] had not been updating - starting new persisted state";
    goto LABEL_33;
  }

  v33 = (void *)v32;
  v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loadedState]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 targetBuildVersion]);

  if (!v35)
  {
    v26 = @"[ACTIVATION] had not been updating - starting new persisted state";
    goto LABEL_34;
  }

  v36 = (void *)MGCopyAnswer(@"ProductVersion", 0LL);
  v37 = (void *)MGCopyAnswer(@"BuildVersion", 0LL);
  v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loadedState]);
  unsigned int v39 = [v38 updateIsApplied];

  v40 = *(void **)(a1 + 32);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v40 loadedState]);
  v42 = v41;
  if (v39)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue([v41 targetOSVersion]);
    if ([v36 isEqualToString:v43])
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loadedState]);
      v45 = (void *)objc_claimAutoreleasedReturnValue([v44 targetBuildVersion]);
      unsigned int v46 = [v37 isEqualToString:v45];

      if (v46)
      {
        [*(id *)(a1 + 32) policyLog:@"[ACTIVATION] installation completed - starting new persisted state"];
        [*(id *)(a1 + 32) setPreservedScanBaseUUID:0];
        [*(id *)(a1 + 32) setPerservedScanRampingForeground:0];
        goto LABEL_41;
      }
    }

    else
    {
    }

    v52 = *(void **)(a1 + 32);
    v53 = (void *)objc_claimAutoreleasedReturnValue([v52 loadedState]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([v53 lastOSVersion]);
    v55 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loadedState]);
    v56 = (void *)objc_claimAutoreleasedReturnValue([v55 lastBuildVersion]);
    [v52 policyLogError:0, @"[ACTIVATION] current:%@(%@) != target:%@(%@) [after applied, assuming persisted state invalid] - starting new persisted state", v54, v56, v36, v37 message];
  }

  else
  {
    [v40 policyLog:@"[ACTIVATION] validating persisted state: %@", v41];
  }

LABEL_41:
  [*(id *)(a1 + 32) notifyExternalStateChange];
  if ((v39 & 1) == 0)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) policyFSM]);
    v57 = objc_alloc(&OBJC_CLASS___SUControllerPolicyParam);
    v48 = -[SUControllerPolicyParam initWithSuccessfulOTA:tetheredRestore:failedForward:failedBackward:]( v57,  "initWithSuccessfulOTA:tetheredRestore:failedForward:failedBackward:",  HIBYTE(v59),  v59,  *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL),  v58);
    v49 = @"ActivateHavePersisted";
    goto LABEL_36;
  }

  if (v28) {
    v40 = (__CFString *)v28;
  }
  else {
    v40 = @"general";
  }
  uint64_t v12 = -[SUControllerPolicyClient initWithClientName:forConnection:withExclusiveControl:communalUponDisconnect:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyClient),  "initWithClientName:forConnection:withExclusiveControl:communalUponDisconnect:",  v40,  *(void *)(a1 + 32),  v29,  v30);

LABEL_45:
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  v42 = (os_log_s *)objc_claimAutoreleasedReturnValue([v41 oslog]);

  if (v12)
  {
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = sub_100022F8C(*(void **)(a1 + 32), v3);
      v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      v45 = 138543362;
      unsigned int v46 = v44;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "%{public}@ handling request",  (uint8_t *)&v45,  0xCu);
    }

    ((void (*)(os_log_s *, id))*v5)(v12, v3);
  }

  else
  {
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_10003DE30(a1);
    }
    uint64_t v12 = v42;
  }

LABEL_35:
  [*(id *)(a1 + 32) cleanPersistedState:@"not validating loaded persisted state"];
  v47 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) policyFSM]);
  v48 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
  v49 = @"ActivateNoPersisted";
LABEL_36:
  [v47 postEvent:v49 withInfo:v48];

  v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) policyFSM]);
  v51 = (void *)objc_claimAutoreleasedReturnValue([v50 diag]);
  objc_msgSend( v51,  "trackEnd:atLevel:withResult:withError:",  @"activateLoadingPersisted",  1,  objc_msgSend(0, "code"),  0);
}

void sub_100018BC4(uint64_t a1)
{
  v2 = objc_alloc_init(&OBJC_CLASS___SUControllerStatus);
  -[SUControllerStatus setManagerState:]( v2,  "setManagerState:",  +[SUControllerPolicyEngine limitedManagerStateFromPolicyState:]( SUControllerPolicyEngine,  "limitedManagerStateFromPolicyState:",  [*(id *)(a1 + 32) updateCurrentPhase]));
  -[SUControllerStatus setUpdateState:]( v2,  "setUpdateState:",  +[SUControllerPolicyEngine extendedManagerStateFromPolicyState:]( SUControllerPolicyEngine,  "extendedManagerStateFromPolicyState:",  [*(id *)(a1 + 32) updateCurrentPhase]));
  -[SUControllerStatus setFailForwardMode:](v2, "setFailForwardMode:", [*(id *)(a1 + 32) failedForward]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeDescriptor:@"manager status" potentiallyInactive:1]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeScanPolicy]);
  id v5 = +[SUControllerSUCore newDescriptorFromCoreDescriptor:corePolicy:]( &OBJC_CLASS___SUControllerSUCore,  "newDescriptorFromCoreDescriptor:corePolicy:",  v3,  v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 completionQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100018D58;
  block[3] = &unk_1000648B0;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v8;
  uint64_t v12 = v2;
  id v9 = v5;
  unsigned int v10 = v2;
  dispatch_async(v7, block);
}

uint64_t sub_100018D58(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5], 0LL);
}

void sub_100018E50(uint64_t a1)
{
  int64_t v2 = +[SUControllerPolicyEngine limitedManagerStateFromPolicyState:]( SUControllerPolicyEngine,  "limitedManagerStateFromPolicyState:",  [*(id *)(a1 + 32) updateCurrentPhase]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeDescriptor:@"manager state" potentiallyInactive:1]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeScanPolicy]);
  id v5 = +[SUControllerSUCore newDescriptorFromCoreDescriptor:corePolicy:]( &OBJC_CLASS___SUControllerSUCore,  "newDescriptorFromCoreDescriptor:corePolicy:",  v3,  v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 completionQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100018F80;
  block[3] = &unk_100065160;
  id v11 = *(id *)(a1 + 40);
  int64_t v12 = v2;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

uint64_t sub_100018F80(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[5] + 16LL))(a1[5], a1[6], a1[4], 0LL);
}

void sub_100019078(uint64_t a1)
{
  int64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) updateConfig]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 completionQueue]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001913C;
  v7[3] = &unk_1000649F0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v2;
  id v9 = v5;
  id v6 = v2;
  dispatch_async(v4, v7);
}

uint64_t sub_10001913C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  0LL);
}

void sub_1000192C8(uint64_t a1)
{
  int64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) updateConfig]);
  id v3 = [v2 copy];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) updateConfig]);
  [v4 modify:*(void *)(a1 + 40) usingMask:*(void *)(a1 + 64)];

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) updateConfig]);
  id v6 = [v5 copy];

  if (([v6 isEqual:v3] & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) autoInstallManager]);
    [v7 modifyConfig:v6];

    unsigned int v8 = [v6 performAutoInstall];
    unsigned int v9 = [v3 performAutoInstall];
    id v10 = *(void **)(a1 + 32);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) summary]);
    if (v8 == v9)
    {
      unsigned int v17 = [v6 performAutoInstall];
      uint64_t v18 = @"NO";
      if (v17) {
        uint64_t v18 = @"YES";
      }
      [v10 policyLog:@"[SPI] %@ {updateConfigForClient} performAutoInstall=%@", v11, v18];
    }

    else
    {
      else {
        int64_t v12 = @"NO";
      }
      else {
        id v13 = @"NO";
      }
      [v10 policyLog:@"[SPI] %@ {updateConfigForClient} performAutoInstall change: %@ => %@", v11, v12, v13];

      unsigned int v14 = [v6 performAutoInstall];
      id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) policyFSM]);
      id v15 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
      if (v14) {
        id v16 = @"SetModeToAuto";
      }
      else {
        id v16 = @"SetModeToManual";
      }
      [v11 postEvent:v16 withInfo:v15];
    }

    unsigned int v19 = [v6 performAutoDownloadAndPrepare];
    unsigned int v20 = [v3 performAutoDownloadAndPrepare];
    id v21 = *(void **)(a1 + 32);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) summary]);
    if (v19 == v20)
    {
      unsigned int v28 = [v6 performAutoDownloadAndPrepare];
      uint64_t v29 = @"NO";
      if (v28) {
        uint64_t v29 = @"YES";
      }
      [v21 policyLog:@"[SPI] %@ {updateConfigForClient} performAutoDownloadAndPrepare=%@", v22, v29];
    }

    else
    {
      else {
        v23 = @"NO";
      }
      else {
        v24 = @"NO";
      }
      [v21 policyLog:@"[SPI] %@ {updateConfigForClient} performAutoDownloadAndPrepare change: %@ => %@", v22, v23, v24];

      unsigned int v25 = [v6 performAutoDownloadAndPrepare];
      v26 = *(void **)(a1 + 32);
      if (v25)
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) policyFSM]);
        v27 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
        [v22 postEvent:@"SetDoDownloadAndPrep" withInfo:v27];
      }

      else
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) summary]);
        [v26 policyLog:@"[SPI] %@ {updateConfigForClient} No action will be taken when performAutoDownloadAndPrepare is changed from YES to NO", v22, v34];
      }
    }
  }

  id v30 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
  v31 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v30 completionQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100019648;
  block[3] = &unk_1000649F0;
  id v32 = *(id *)(a1 + 56);
  id v36 = v6;
  id v37 = v32;
  id v33 = v6;
  dispatch_async(v31, block);
}

uint64_t sub_100019648(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  0LL);
}

id sub_1000199A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) persistScanUUID:*(void *)(a1 + 40) withRampingForeground:*(unsigned __int8 *)(a1 + 48) forReason:@"scanGeneratedBaseUUID"];
}

void sub_100019B0C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) isSupervisedPolicy];
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) activeScanPolicy]);
  unsigned int v4 = [v3 isSupervisedPolicy];

  if (v2 == v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) productVersion]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) primaryDescriptor]);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 productVersion]);
    if ([v6 isEqualToString:v8])
    {
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) productBuildVersion]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) primaryDescriptor]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 productBuildVersion]);
      unsigned int v12 = [v9 isEqualToString:v11];

      if (v12) {
        id v5 = @"ScanFoundSameUpdate";
      }
      else {
        id v5 = @"ScanFoundNewerUpdate";
      }
    }

    else
    {

      id v5 = @"ScanFoundNewerUpdate";
    }
  }

  else
  {
    id v5 = @"ScanFoundDiffModeUpdate";
  }

  id v14 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) policyFSM]);
  id v13 = -[SUControllerPolicyParam initWithScanPolicy:scanUUID:rampingForeground:primaryDescriptor:secondaryDescriptor:scanOptions:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyParam),  "initWithScanPolicy:scanUUID:rampingForeground:primaryDescriptor:secondaryDescriptor:scanOptions:",  *(void *)(a1 + 32),  *(void *)(a1 + 56),  *(unsigned __int8 *)(a1 + 80),  *(void *)(a1 + 48),  *(void *)(a1 + 64),  *(void *)(a1 + 72));
  [v14 postEvent:v5 withInfo:v13];
}

void sub_100019DE0(uint64_t a1)
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) productVersion]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) primaryDescriptor]);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 productVersion]);
  if ([v2 isEqualToString:v4])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) productBuildVersion]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) primaryDescriptor]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 productBuildVersion]);
    unsigned int v8 = [v5 isEqualToString:v7];

    if (v8) {
      unsigned int v9 = @"ScanFoundSameImmediate";
    }
    else {
      unsigned int v9 = @"ScanFoundNewerImmediate";
    }
  }

  else
  {

    unsigned int v9 = @"ScanFoundNewerImmediate";
  }

  id v11 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) policyFSM]);
  id v10 = -[SUControllerPolicyParam initWithScanPolicy:scanUUID:rampingForeground:primaryDescriptor:secondaryDescriptor:hasAcceptedTerms:withSSOToken:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyParam),  "initWithScanPolicy:scanUUID:rampingForeground:primaryDescriptor:secondaryDescriptor:hasAcceptedTerms:withSSOToken:",  *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(unsigned __int8 *)(a1 + 80),  *(void *)(a1 + 32),  *(void *)(a1 + 64),  1LL,  *(void *)(a1 + 72));
  [v11 postEvent:v9 withInfo:v10];
}

id sub_10001A0B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) reportOTAPostponed:*(void *)(a1 + 48) forSessionUUID:*(void *)(a1 + 40) postponedDescriptor:*(void *)(a1 + 56) dueToError:*(void *)(a1 + 64)];
}

void sub_10001A978(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  [v3 policyLog:@"[AUTO_INSTALL] awaitInstallAllowed (end) installWaitUUID:%@", v4];
  [*(id *)(a1 + 32) autoInstallWindowWaitForAllowedComplete:*(void *)(a1 + 40) error:v5];
}

void sub_10001AAA4(uint64_t a1)
{
  unsigned int v2 = *(void **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) installWaitUUID]);

  if (v2 != v3)
  {
    id v4 = [*(id *)(a1 + 48) code];
    id v5 = *(void **)(a1 + 40);
    if (v4 == (id)40)
    {
      [v5 policyLog:@"[AUTO_INSTALL] auto-install window has been canceled"];
      return;
    }

    id v20 = (id)objc_claimAutoreleasedReturnValue([v5 policyFSM]);
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v20 diag]);
    id v13 = [*(id *)(a1 + 48) code];
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = @"install wait UUID mismatch (not due to canceled)";
    goto LABEL_15;
  }

  [*(id *)(a1 + 40) setInstallWaitUUID:0];
  id v6 = *(void **)(a1 + 48);
  if (!v6)
  {
    id v20 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) policyFSM]);
    id v10 = objc_alloc(&OBJC_CLASS___SUControllerPolicyParam);
    id v11 = @"AutoUpdate";
    goto LABEL_11;
  }

  if ([v6 code] == (id)41)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) updateConfig]);
    if ([v7 useSpecifiedInstallWindow])
    {
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) updateConfig]);
      unsigned __int8 v9 = [v8 expiredSpecifiedAsExpired];

      if ((v9 & 1) == 0)
      {
        id v20 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) policyFSM]);
        id v10 = objc_alloc(&OBJC_CLASS___SUControllerPolicyParam);
        id v11 = @"TestConfig";
LABEL_11:
        id v16 = -[SUControllerPolicyParam initWithApplyInvokedBy:](v10, "initWithApplyInvokedBy:", v11);
        unsigned int v17 = @"AutoInstallTriggered";
LABEL_17:
        [v20 postEvent:v17 withInfo:v16];

        goto LABEL_18;
      }
    }

    else
    {
    }
  }

  id v18 = [*(id *)(a1 + 48) code];
  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) policyFSM]);
  id v20 = v19;
  if (v18 != (id)40)
  {
    id v16 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
    unsigned int v17 = @"AutoInstallExpired";
    goto LABEL_17;
  }

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v19 diag]);
  id v13 = [*(id *)(a1 + 48) code];
  uint64_t v14 = *(void *)(a1 + 48);
  id v15 = @"install wait canceled when still active UUID";
LABEL_15:
  [v12 trackAnomaly:@"[POLICY]" forReason:v15 withResult:v13 withError:v14];

LABEL_18:
}

void sub_10001CAC8(uint64_t a1)
{
  unsigned int v2 = (void (**)(id, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) purgeCompletion]);
  v2[2](v2, *(void *)(a1 + 40));
}

void sub_10001CEA0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10001CEB8(uint64_t a1)
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loadedState]);
  if ([v2 updateIsApplied])
  {

LABEL_4:
    [*(id *)(a1 + 32) policyLog:@"[ACTIVATING](ASSET CHECK) already prepared; so MAAsset check always considered match"];
LABEL_5:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    return;
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loadedState]);
  unsigned int v4 = [v3 updateIsPrepared];

  if (v4) {
    goto LABEL_4;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loadedState]);
  unsigned int v6 = [v5 prepareWasStarted];

  if (v6)
  {
    [*(id *)(a1 + 32) policyLogError:0 message:@"[ACTIVATING](ASSET CHECK) had started to prepare; so MAAsset check always considered match"];
    goto LABEL_5;
  }

  id v7 = *(void **)(a1 + 40);
  if (!v7 || [v7 count] != (id)1)
  {
    unsigned __int8 v9 = *(void **)(a1 + 32);
    id v10 = @"[ACTIVATING](ASSET CHECK) no persisted software update assets; so MAAsset check never considered match";
    goto LABEL_14;
  }

  unsigned int v8 = *(void **)(a1 + 48);
  if (v8 && (unint64_t)[v8 count] >= 2)
  {
    unsigned __int8 v9 = *(void **)(a1 + 32);
    id v10 = @"[ACTIVATING](ASSET CHECK) more than 1 documentation asset; so MAAsset check never considered match";
LABEL_14:
    [v9 policyLogError:0 message:v10];
    return;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loadedState]);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 primaryDescriptor]);

  unsigned __int8 v9 = *(void **)(a1 + 32);
  if (!v12)
  {
    id v10 = @"[ACTIVATING](ASSET CHECK) no persisted primary descriptor; so MAAsset check never considered match";
    goto LABEL_14;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 loadedState]);
  unsigned int v14 = [v13 fallenBackToSecondary];

  id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loadedState]);
  id v16 = v15;
  if (!v14)
  {
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v15 primaryDescriptor]);
LABEL_21:
    unsigned int v25 = (void *)v19;

    id v20 = v25;
    if (v25)
    {
      id v21 = *(void **)(a1 + 40);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v25 assetID]);
      LODWORD(v21) = [v21 containsObject:v22];

      if ((_DWORD)v21)
      {
        [*(id *)(a1 + 32) policyLog:@"[ACTIVATING](ASSET CHECK) SU asset matched (asset can be preserved)"];
        *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
      }

      id v20 = v25;
    }

    goto LABEL_26;
  }

  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v15 secondaryDescriptor]);

  id v18 = *(void **)(a1 + 32);
  if (v17)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v18 loadedState]);
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v16 secondaryDescriptor]);
    goto LABEL_21;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v18 policyFSM]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 diag]);
  [v24 trackAnomaly:@"[POLICY][ACTIVATING](ASSET CHECK)" forReason:@"loaded state indicated fallenBackToSecondary yet no secondaryDescriptor - persisted state dropped" withResult:8101 withError:0];

  id v20 = 0LL;
LABEL_26:
}

void sub_10001E274(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v20 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = v14;
  if (v14)
  {
    if ([v14 code] == (id)8408)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) policyFSM]);
      unsigned int v17 = -[SUControllerPolicyParam initWithScanPolicy:verifyDescriptor:differentPrimary:differentSecondary:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyParam),  "initWithScanPolicy:verifyDescriptor:differentPrimary:differentSecondary:",  v20,  v11,  v12,  v13);
      id v18 = @"ScanVerifyFoundNewer";
    }

    else
    {
      int v19 = *(unsigned __int8 *)(a1 + 56);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) policyFSM]);
      unsigned int v17 = -[SUControllerPolicyParam initWithError:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyParam),  "initWithError:",  v15);
      if (v19) {
        id v18 = @"ScanVerifyFailedAuto";
      }
      else {
        id v18 = @"ScanVerifyFailedManual";
      }
    }

    [v16 postEvent:v18 withInfo:v17];
  }

  else
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) policyFSM]);
    [v16 postEvent:@"ScanVerifyFoundLatest" withInfo:*(void *)(a1 + 48)];
  }
}

LABEL_8:
  return v9;
}

void sub_10001EDA8(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 policyFSM]);
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 diag]);
    objc_msgSend( v6,  "trackError:forReason:withResult:withError:",  @"[POLICY]",  @"unable to remove all update content",  objc_msgSend(v4, "code"),  v4);
  }

  id v8 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) policyFSM]);
  id v7 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
  [v8 postEvent:@"PurgeRemovedSUContent" withInfo:v7];
}

void sub_10001F068(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) policyFSM]);
  v1 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
  [v2 postEvent:@"ScanContentPurged" withInfo:v1];
}

void sub_10001F9D0(id a1)
{
  uint64_t v1 = MGCopyAnswer(@"BuildVersion", 0LL);
  id v2 = (void *)qword_100079620;
  qword_100079620 = v1;
}

void sub_10002039C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_1000203B4(uint64_t *a1)
{
  if (qword_100079638 != -1) {
    dispatch_once(&qword_100079638, &stru_100065368);
  }
  uint64_t v2 = 14LL;
  if (!byte_100079630) {
    uint64_t v2 = 0LL;
  }
  *a1 = v2;
  return qword_100079628;
}

void sub_100020418(id a1)
{
  uint64_t v1 = off_1000793E8;
  uint64_t v2 = off_1000793F0;
  id v3 = off_1000793F8;
  id v4 = off_100079400;
  id v5 = off_100079428;
  unsigned int v6 = off_100079430;
  id v7 = off_100079390;
  id v8 = off_1000793A0;
  unsigned __int8 v9 = off_1000793A8;
  id v11 = off_1000793B0;
  id v12 = off_100079408;
  id v13 = off_100079450;
  id v14 = off_100079458;
  id v15 = off_100079410;
  id v10 = calloc(1uLL, 0x150uLL);
  qword_100079628 = (uint64_t)v10;
  *(void *)id v10 = v1;
  v10[8] = 1;
  *((void *)v10 + 2) = sub_10002062C;
  *((void *)v10 + 3) = v2;
  v10[32] = 1;
  *((void *)v10 + 5) = sub_1000208C8;
  *((void *)v10 + 6) = v3;
  v10[56] = 1;
  *((void *)v10 + _Block_object_dispose(va, 8) = sub_100020B58;
  *((void *)v10 + 9) = v4;
  v10[80] = 1;
  *((void *)v10 + 11) = sub_100020D7C;
  *((void *)v10 + 12) = v5;
  v10[104] = 1;
  *((void *)v10 + 14) = sub_1000210E0;
  *((void *)v10 + 15) = v6;
  v10[128] = 0;
  *((void *)v10 + 17) = sub_100021284;
  *((void *)v10 + 1_Block_object_dispose(va, 8) = v7;
  v10[152] = 1;
  *((void *)v10 + 20) = sub_100021364;
  *((void *)v10 + 21) = v8;
  v10[176] = 1;
  *((void *)v10 + 23) = sub_1000213C4;
  *((void *)v10 + 24) = v9;
  v10[200] = 1;
  *((void *)v10 + 26) = sub_100021518;
  *((void *)v10 + 27) = v11;
  v10[224] = 1;
  *((void *)v10 + 29) = sub_10002169C;
  *((void *)v10 + 30) = v12;
  v10[248] = 1;
  *((void *)v10 + 32) = sub_1000217F0;
  *((void *)v10 + 33) = v13;
  v10[272] = 1;
  *((void *)v10 + 35) = sub_100021944;
  *((void *)v10 + 36) = v14;
  v10[296] = 1;
  *((void *)v10 + 3_Block_object_dispose(va, 8) = sub_100021A98;
  *((void *)v10 + 39) = v15;
  v10[320] = 1;
  *((void *)v10 + 41) = sub_100021C04;
  byte_100079630 = 1;
}

void sub_10002062C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerManagerServer sharedManager](&OBJC_CLASS___SUControllerManagerServer, "sharedManager"));
  if (([v3 usingExclusiveControl] & 1) != 0
    || (unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attachedClients]),
        unsigned __int8 v7 = [v6 underExclusiveControl],
        v6,
        (v7 & 1) == 0))
  {
    +[SUControllerPolicySPI managerStatusForClient:withMessage:]( &OBJC_CLASS___SUControllerPolicySPI,  "managerStatusForClient:withMessage:",  v3,  v4);
  }

  else
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    if (reply)
    {
      unsigned __int8 v9 = off_1000793E8;
      id v10 = off_100079480;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 attachedClients]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 simulatedStatus]);
      sub_100030EE8((uint64_t)v9, reply, v10, v12);

      id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 attachedClients]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 simulatedDescriptor]);

      if (v14)
      {
        id v15 = off_1000793E8;
        id v16 = off_100079490;
        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v5 attachedClients]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 simulatedDescriptor]);
        sub_100030EE8((uint64_t)v15, reply, v16, v18);
      }

      int v19 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);
        int v24 = 138543362;
        unsigned int v25 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[SPI] {managerStatus} %{public}@: non-exclusive canned reply",  (uint8_t *)&v24,  0xCu);
      }

      id v22 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v3 connection]);
      xpc_connection_send_message(v22, reply);
    }

    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      id v22 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v23 oslog]);

      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10003DA70(v3);
      }
    }
  }
}

void sub_1000208C8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerManagerServer sharedManager](&OBJC_CLASS___SUControllerManagerServer, "sharedManager"));
  if (([v3 usingExclusiveControl] & 1) != 0
    || (unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attachedClients]),
        unsigned __int8 v7 = [v6 underExclusiveControl],
        v6,
        (v7 & 1) == 0))
  {
    +[SUControllerPolicySPI managerStateForClient:withMessage:]( &OBJC_CLASS___SUControllerPolicySPI,  "managerStateForClient:withMessage:",  v3,  v4);
  }

  else
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    if (reply)
    {
      unsigned __int8 v9 = off_1000794D0;
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 attachedClients]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 simulatedStatus]);
      xpc_dictionary_set_int64(reply, v9, (int64_t)[v11 managerState]);

      id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 attachedClients]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 simulatedDescriptor]);

      if (v13)
      {
        id v14 = off_1000793F0;
        id v15 = off_100079490;
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 attachedClients]);
        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 simulatedDescriptor]);
        sub_100030EE8((uint64_t)v14, reply, v15, v17);
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 oslog]);

      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);
        int v23 = 138543362;
        int v24 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[SPI] {managerState} %{public}@: non-exclusive canned reply",  (uint8_t *)&v23,  0xCu);
      }

      id v21 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v3 connection]);
      xpc_connection_send_message(v21, reply);
    }

    else
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      id v21 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v22 oslog]);

      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10003DAE8(v3);
      }
    }
  }
}

void sub_100020B58(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerManagerServer sharedManager](&OBJC_CLASS___SUControllerManagerServer, "sharedManager"));
  if (([v3 usingExclusiveControl] & 1) != 0
    || (unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attachedClients]),
        unsigned __int8 v7 = [v6 underExclusiveControl],
        v6,
        (v7 & 1) == 0))
  {
    +[SUControllerPolicySPI managerConfigForClient:withMessage:]( &OBJC_CLASS___SUControllerPolicySPI,  "managerConfigForClient:withMessage:",  v3,  v4);
  }

  else
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    if (reply)
    {
      unsigned __int8 v9 = off_1000793F8;
      id v10 = off_1000794D8;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 attachedClients]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 simulatedConfig]);
      sub_100030EE8((uint64_t)v9, reply, v10, v12);

      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);
        int v18 = 138543362;
        int v19 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[SPI] {managerConfig} %{public}@: non-exclusive canned reply",  (uint8_t *)&v18,  0xCu);
      }

      id v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v3 connection]);
      xpc_connection_send_message(v16, reply);
    }

    else
    {
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      id v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10003DB60(v3);
      }
    }
  }
}

void sub_100020D7C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerManagerServer sharedManager](&OBJC_CLASS___SUControllerManagerServer, "sharedManager"));
  if (([v3 usingExclusiveControl] & 1) != 0
    || (unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attachedClients]),
        unsigned __int8 v7 = [v6 underExclusiveControl],
        v6,
        (v7 & 1) == 0))
  {
    unsigned int v17 = off_100079400;
    int v18 = off_1000794D8;
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___SUControllerConfig);
    id v20 = sub_1000311AC((uint64_t)v17, v4, v18, v19);
    xpc_object_t reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v20);
    int64_t int64 = xpc_dictionary_get_int64(v4, off_1000794E0);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 oslog]);

    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);
      unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([reply changeSummary:int64]);
      *(_DWORD *)buf = 138543618;
      v31 = v24;
      __int16 v32 = 2114;
      id v33 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[SPI] {modifyConfig...} %{public}@ | changes: %{public}@",  buf,  0x16u);
    }

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1000231E0;
    v27[3] = &unk_100065420;
    unsigned int v28 = (_xpc_connection_s *)v3;
    id v29 = v4;
    [v5 modifyConfig:reply modifying:int64 completion:v27];

    id v16 = v28;
  }

  else
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    if (reply)
    {
      unsigned __int8 v9 = off_100079400;
      id v10 = off_1000794D8;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 attachedClients]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 simulatedConfig]);
      sub_100030EE8((uint64_t)v9, reply, v10, v12);

      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);
        *(_DWORD *)buf = 138543362;
        v31 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[SPI] {modifyConfig} %{public}@: non-exclusive canned reply",  buf,  0xCu);
      }

      id v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v3 connection]);
      xpc_connection_send_message(v16, reply);
    }

    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      id v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v26 oslog]);

      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10003DBD8(v3);
      }
    }
  }
}

void sub_1000210E0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerManagerServer sharedManager](&OBJC_CLASS___SUControllerManagerServer, "sharedManager"));
  if (([v3 usingExclusiveControl] & 1) != 0
    || (unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attachedClients]),
        unsigned __int8 v7 = [v6 underExclusiveControl],
        v6,
        (v7 & 1) == 0))
  {
    +[SUControllerPolicySPI purgeUpdateForClient:withMessage:]( &OBJC_CLASS___SUControllerPolicySPI,  "purgeUpdateForClient:withMessage:",  v3,  v4);
  }

  else
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

    if (reply)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);
        int v12 = 138543362;
        id v13 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[SPI] {purgeUpdate} %{public}@: non-exclusive canned reply",  (uint8_t *)&v12,  0xCu);
      }

      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 connection]);
      xpc_connection_send_message(v10, reply);
    }

    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      sub_10003DC50(v3);
    }
  }
}

void sub_100021284(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 oslog]);

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v1 summary]);
    int v5 = 138543362;
    unsigned int v6 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[SPI] {Data Migration Indication} %{public}@: no action taken",  (uint8_t *)&v5,  0xCu);
  }
}

void sub_100021364(void *a1)
{
  id v1 = a1;
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[SUControllerManagerServer sharedManager](&OBJC_CLASS___SUControllerManagerServer, "sharedManager"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v3 attachedClients]);
  [v2 addPolicyClient:v1];
}

void sub_1000213C4(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerManagerServer sharedManager](&OBJC_CLASS___SUControllerManagerServer, "sharedManager"));
  if (([v3 usingExclusiveControl] & 1) != 0
    || (unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attachedClients]),
        unsigned __int8 v7 = [v6 underExclusiveControl],
        v6,
        (v7 & 1) == 0))
  {
    +[SUControllerPolicySPI scanForUpdatesForClient:withMessage:]( &OBJC_CLASS___SUControllerPolicySPI,  "scanForUpdatesForClient:withMessage:",  v3,  v4);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);
      int v11 = 138543362;
      int v12 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[SPI] {scanForUpdates} %{public}@: non-exclusive request ignored",  (uint8_t *)&v11,  0xCu);
    }
  }
}

void sub_100021518(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerManagerServer sharedManager](&OBJC_CLASS___SUControllerManagerServer, "sharedManager"));
  if (([v1 usingExclusiveControl] & 1) != 0
    || (id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 attachedClients]),
        unsigned __int8 v4 = [v3 underExclusiveControl],
        v3,
        (v4 & 1) == 0))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[SPI] {startDownload} no-op when using SUCore",  (uint8_t *)&v9,  2u);
    }
  }

  else
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 oslog]);

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v1 summary]);
      int v9 = 138543362;
      id v10 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[SPI] {startDownload} %{public}@: non-exclusive request ignored",  (uint8_t *)&v9,  0xCu);
    }
  }
}

void sub_10002169C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerManagerServer sharedManager](&OBJC_CLASS___SUControllerManagerServer, "sharedManager"));
  if (([v3 usingExclusiveControl] & 1) != 0
    || (unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attachedClients]),
        unsigned __int8 v7 = [v6 underExclusiveControl],
        v6,
        (v7 & 1) == 0))
  {
    +[SUControllerPolicySPI installUpdateForClient:withMessage:]( &OBJC_CLASS___SUControllerPolicySPI,  "installUpdateForClient:withMessage:",  v3,  v4);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);
      int v11 = 138543362;
      int v12 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[SPI] {installUpdate} %{public}@: non-exclusive request ignored",  (uint8_t *)&v11,  0xCu);
    }
  }
}

void sub_1000217F0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerManagerServer sharedManager](&OBJC_CLASS___SUControllerManagerServer, "sharedManager"));
  if (([v3 usingExclusiveControl] & 1) != 0
    || (unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attachedClients]),
        unsigned __int8 v7 = [v6 underExclusiveControl],
        v6,
        (v7 & 1) == 0))
  {
    +[SUControllerPolicySPI userDidAcceptTermsAndConditionsForClient:withMessage:]( &OBJC_CLASS___SUControllerPolicySPI,  "userDidAcceptTermsAndConditionsForClient:withMessage:",  v3,  v4);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);
      int v11 = 138543362;
      int v12 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[SPI] {acceptTerms} %{public}@: non-exclusive request ignored",  (uint8_t *)&v11,  0xCu);
    }
  }
}

void sub_100021944(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerManagerServer sharedManager](&OBJC_CLASS___SUControllerManagerServer, "sharedManager"));
  if (([v3 usingExclusiveControl] & 1) != 0
    || (unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attachedClients]),
        unsigned __int8 v7 = [v6 underExclusiveControl],
        v6,
        (v7 & 1) == 0))
  {
    +[SUControllerPolicySPI useSSOTokenToPersonalizeForClient:withMessage:]( &OBJC_CLASS___SUControllerPolicySPI,  "useSSOTokenToPersonalizeForClient:withMessage:",  v3,  v4);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);
      int v11 = 138543362;
      int v12 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[SPI] {useSSOToken} %{public}@: non-exclusive request ignored",  (uint8_t *)&v11,  0xCu);
    }
  }
}

void sub_100021A98(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerManagerServer sharedManager](&OBJC_CLASS___SUControllerManagerServer, "sharedManager"));
  if (([v1 usingExclusiveControl] & 1) != 0
    || (id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 attachedClients]),
        unsigned __int8 v4 = [v3 underExclusiveControl],
        v3,
        (v4 & 1) == 0))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003DCC8(v1);
    }
  }

  else
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 oslog]);

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v1 summary]);
      int v9 = 138543362;
      id v10 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[SPI] {useCredentials} %{public}@: non-exclusive request ignored",  (uint8_t *)&v9,  0xCu);
    }
  }
}

void sub_100021C04(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerManagerServer sharedManager](&OBJC_CLASS___SUControllerManagerServer, "sharedManager"));
  if (([v3 usingExclusiveControl] & 1) != 0
    || (unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attachedClients]),
        unsigned __int8 v7 = [v6 underExclusiveControl],
        v6,
        (v7 & 1) == 0))
  {
    +[SUControllerPolicySPI updateAcceptingTermsForClient:withMessage:]( &OBJC_CLASS___SUControllerPolicySPI,  "updateAcceptingTermsForClient:withMessage:",  v3,  v4);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);
      int v11 = 138543362;
      int v12 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[SPI] {updateAcceptingTerms} %{public}@: non-exclusive request ignored",  (uint8_t *)&v11,  0xCu);
    }
  }
}

void start()
{
  v0 = objc_autoreleasePoolPush();
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
  [v1 useDomain:@"com.apple.sucontroller"];

  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 oslog]);

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MAIN] startup of SUController daemon", buf, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice"));
  int v5 = (char *)objc_claimAutoreleasedReturnValue([v4 deviceClass]);

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 oslog]);

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v52 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MAIN] This daemon is running on: %{public}@",  buf,  0xCu);
  }

  if (![v5 isEqualToString:@"AppleTV"])
  {
LABEL_17:
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerManagerServer sharedManager](&OBJC_CLASS___SUControllerManagerServer, "sharedManager"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 oslog]);

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[MAIN] instantiated shared manager", buf, 2u);
    }

    sub_10002E49C(1LL);
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v14 config]);
    unsigned int v18 = [v17 vpnOnDemandAsInternal];

    if (v18)
    {
      xpc_object_t v19 = xpc_array_create(0LL, 0LL);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 oslog]);

      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        v52 = "basejumper.apple.com";
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[MAIN] external | configuring for VPN-on-demand trigger on access to internal asset server: %{public}s",  buf,  0xCu);
      }

      xpc_array_set_string(v19, 0xFFFFFFFFFFFFFFFFLL, "basejumper.apple.com");
      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 oslog]);

      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      *(_DWORD *)buf = 136446210;
      v52 = "gdmf-staging-int.apple.com";
      int v24 = "[MAIN] external | configuring for VPN-on-demand trigger on access to internal Pallas server: %{public}s";
    }

    else
    {
      if ([v14 currentReleaseType] != (id)1 && objc_msgSend(v14, "currentReleaseType") != (id)2) {
        goto LABEL_32;
      }
      xpc_object_t v19 = xpc_array_create(0LL, 0LL);
      unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 oslog]);

      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        v52 = "basejumper.apple.com";
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[MAIN] configuring for VPN-on-demand trigger on access to internal asset server: %{public}s",  buf,  0xCu);
      }

      xpc_array_set_string(v19, 0xFFFFFFFFFFFFFFFFLL, "basejumper.apple.com");
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 oslog]);

      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
LABEL_31:

        xpc_array_set_string(v19, 0xFFFFFFFFFFFFFFFFLL, "gdmf-staging-int.apple.com");
        NEHelperSettingsSetArray("CriticalDomains", v19);

LABEL_32:
        unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
        [v28 logAtLevel:1, "main", @"\n========== %@ (%@) ======================================================================\n", @"LOAD CORE PERSISTED STATE", @"4.2.1" label format];

        BOOL v29 = +[SUControllerCore activateLoadingPersisted](&OBJC_CLASS___SUControllerCore, "activateLoadingPersisted");
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v14 status]);
        [v30 setFailForwardMode:v29];

        v31 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 oslog]);

        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v14 currentReleaseTypeName]);
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v14 config]);
          v35 = (void *)objc_claimAutoreleasedReturnValue([v34 summary]);
          *(_DWORD *)buf = 138544130;
          v52 = @"[__MILESTONE__]";
          __int16 v53 = 2114;
          v54 = @"4.2.1";
          __int16 v55 = 2114;
          v56 = v33;
          __int16 v57 = 2114;
          unsigned __int8 v58 = v35;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%{public}@:(STARTUP) [%{public}@][%{public}@] Initial configuration:%{public}@",  buf,  0x2Au);
        }

        id v36 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
        id v37 = (void *)objc_claimAutoreleasedReturnValue([v14 status]);
        unsigned int v38 = [v37 failForwardMode];
        unsigned int v39 = @"Loaded";
        if (v38) {
          unsigned int v39 = @"FailForward";
        }
        [v36 logAtLevel:1, "main", @"\n========== %@ (%@) ======================================================================\n", @"LOAD CORE PERSISTED STATE", v39 label format];

        objc_autoreleasePoolPop(v0);
        xpc_set_event_stream_handler("com.apple.notifyd.matching", 0LL, &stru_1000653A8);
        xpc_connection_t mach_service = xpc_connection_create_mach_service(off_100079380, 0LL, 1uLL);
        if (!mach_service)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
          v42 = (os_log_s *)objc_claimAutoreleasedReturnValue([v41 oslog]);

          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "[MAIN] Failed to create mach service listener connection",  buf,  2u);
          }

          abort();
        }

        v43 = mach_service;
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472LL;
        handler[2] = sub_10002276C;
        handler[3] = &unk_1000653F8;
        id v44 = v14;
        handler[4] = v44;
        xpc_connection_set_event_handler(v43, handler);
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        unsigned int v46 = (os_log_s *)objc_claimAutoreleasedReturnValue([v45 oslog]);

        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "[MAIN] activated XPC peer connection listener",  buf,  2u);
        }

        xpc_connection_resume(v43);
        v47 = objc_autoreleasePoolPush();
        [v44 activityRegister];
        [v44 activityBackupTimerStart];
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        v49 = (os_log_s *)objc_claimAutoreleasedReturnValue([v48 oslog]);

        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v52 = @"4.2.1";
          _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "[MAIN] SUController (version %{public}@) entering run loop",  buf,  0xCu);
        }

        objc_autoreleasePoolPop(v47);
        notify_post((const char *)[@"com.apple.SoftwareUpdateController.Daemon.Launched" UTF8String]);
        goto LABEL_45;
      }

      *(_DWORD *)buf = 136446210;
      v52 = "gdmf-staging-int.apple.com";
      int v24 = "[MAIN] configuring for VPN-on-demand trigger on access to internal Pallas server: %{public}s";
    }

    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
    goto LABEL_31;
  }

  if (_os_feature_enabled_impl("PineBoard", "AdoptTVOSUpdate"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 oslog]);

    if (!os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
LABEL_16:

      goto LABEL_17;
    }

    *(_WORD *)buf = 0;
    id v10 = "[MAIN] This daemon is running on AppleTV, and Pineboard's AdoptTVOSUpdate feature flag is set.  Allowing daemon to run.";
  }

  else
  {
    int AppBooleanValue = CFPreferencesGetAppBooleanValue( @"enableForAppleTVDev",  @"com.apple.SUController",  0LL);
    int v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v12 oslog]);

    BOOL v13 = os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT);
    if (!AppBooleanValue)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "[MAIN] This daemon is running on AppleTV, but 'enableForAppleTVDev' is not set and Pineboard's AdoptTVOSUpdate feature flag is not set.  Skipping all setup",  buf,  2u);
      }

LABEL_45:
      CFRunLoopRun();
      exit(1);
    }

    if (!v13) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    id v10 = "[MAIN] This daemon is running on AppleTV, and 'enableForAppleTVDev' is set.  Allowing daemon to run.";
  }

  _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
  goto LABEL_16;
}

void sub_10002263C(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  id v3 = objc_autoreleasePoolPush();
  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 oslog]);

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446210;
    int v9 = string;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[NOTIFY] got notifyd event: %{public}s",  (uint8_t *)&v8,  0xCu);
  }

  if (!strncmp(string, "com.apple.MobileAsset.SoftwareUpdate.cached-metadata-updated", 0x3CuLL))
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerManagerServer sharedManager](&OBJC_CLASS___SUControllerManagerServer, "sharedManager"));
    [v7 activityMetadataUpdate];
  }

  objc_autoreleasePoolPop(v3);
}

void sub_10002276C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_autoreleasePoolPush();
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    int v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    BOOL v13 = sub_10002297C;
    id v14 = &unk_1000653D0;
    id v8 = v3;
    id v15 = v8;
    id v16 = *(id *)(a1 + 32);
    xpc_connection_set_event_handler((xpc_connection_t)v8, &v11);
    int v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger", v11, v12, v13, v14));
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      xpc_type_t v18 = (xpc_type_t)v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[LISTENER] accepted XPC peer connection %{public}@",  buf,  0xCu);
    }

    xpc_connection_resume((xpc_connection_t)v8);
  }

  else
  {
    xpc_type_t v6 = type;
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v8 = (id)objc_claimAutoreleasedReturnValue([v7 oslog]);

    if (v6 == (xpc_type_t)&_xpc_type_error)
    {
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
        sub_10003DD40(v3);
      }

      abort();
    }

    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      xpc_type_t v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "[LISTENER] ignored XPC event(%ld)",  buf,  0xCu);
    }
  }

  objc_autoreleasePoolPop(v4);
}

void sub_10002297C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = sub_100022F8C(*(void **)(a1 + 32), v3);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      int v45 = 138543362;
      unsigned int v46 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ got XPC error",  (uint8_t *)&v45,  0xCu);
    }

    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) attachedClients]);
    uint64_t v12 = v17;
    uint64_t v18 = *(void *)(a1 + 32);
    xpc_object_t v19 = @"XPC error on peer connection";
    goto LABEL_13;
  }

  string = xpc_dictionary_get_string(v3, off_100079388);
  if (qword_100079638 != -1) {
    dispatch_once(&qword_100079638, &stru_100065368);
  }
  if (byte_100079630 != 1)
  {
LABEL_8:
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) attachedClients]);
    uint64_t v10 = *(void *)(a1 + 32);
    int v9 = (void **)(a1 + 32);
    [v8 removeClientForConnection:v10 forReason:@"unsupported request"];

    int v11 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 oslog]);

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10003E08C(v9, v3);
    }
    goto LABEL_14;
  }

  int v5 = (void *)(qword_100079628 + 16);
  uint64_t v6 = -1LL;
  while (1)
  {
    size_t v7 = strlen((const char *)*(v5 - 2));
    v5 += 3;
  }

  if (*((_BYTE *)v5 - 8) && !sub_100031300(*(void *)(a1 + 32)))
  {
    int v23 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 oslog]);

    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10003E010((void **)(a1 + 32), v3);
    }

    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) attachedClients]);
    uint64_t v12 = v17;
    uint64_t v18 = *(void *)(a1 + 32);
    xpc_object_t v19 = @"not entitled";
    goto LABEL_13;
  }

  if (!*v5)
  {
    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 oslog]);

    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10003DDB8(a1);
    }

    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) attachedClients]);
    uint64_t v12 = v17;
    uint64_t v18 = *(void *)(a1 + 32);
    xpc_object_t v19 = @"request not handled";
LABEL_13:
    -[os_log_s removeClientForConnection:forReason:](v17, "removeClientForConnection:forReason:", v18, v19);
    goto LABEL_14;
  }

  id v20 = off_100079390;
  size_t v21 = strlen(off_100079390);
  if (strncmp(string, off_100079390, v21))
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) attachedClients]);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 policyClientForConnection:*(void *)(a1 + 32)]);

    goto LABEL_45;
  }

  v27 = sub_100031258((uint64_t)v20, v3, off_100079470);
  uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
  BOOL v29 = sub_1000311BC((uint64_t)off_100079390, v3, off_100079460);
  BOOL v30 = sub_1000311BC((uint64_t)off_100079390, v3, off_100079468);
  if (v29)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice"));
    unsigned __int8 v32 = [v31 isBootedOSSecureInternal];

    if ((v32 & 1) != 0)
    {
      BOOL v29 = 1LL;
    }

    else
    {
      id v33 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33 oslog]);

      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_10003DF98(a1);
      }

      BOOL v29 = 0LL;
    }
  }

  if (v30)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice"));
    unsigned __int8 v36 = [v35 isBootedOSSecureInternal];

    if ((v36 & 1) != 0)
    {
      if (v29)
      {
        BOOL v30 = 1LL;
        goto LABEL_41;
      }

      unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      unsigned int v38 = (os_log_s *)objc_claimAutoreleasedReturnValue([v39 oslog]);

      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_10003DEA8(a1);
      }
    }

    else
    {
      id v37 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      unsigned int v38 = (os_log_s *)objc_claimAutoreleasedReturnValue([v37 oslog]);

      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_10003DF20(a1);
      }
    }

    BOOL v30 = 0LL;
  }

LABEL_14:
}

NSString *sub_100022F8C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  xpc_type_t type = xpc_get_type(v4);
  string = xpc_dictionary_get_string(v4, off_100079388);
  if (string) {
    size_t v7 = string;
  }
  else {
    size_t v7 = "?";
  }
  if (type != (xpc_type_t)&_xpc_type_error
    && (id v8 = off_100079390, v9 = strlen(off_100079390), !strncmp(v7, off_100079390, v9)))
  {
    id v20 = sub_100031258((uint64_t)v8, v4, off_100079470);
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue(v20);
    BOOL v21 = sub_1000311BC((uint64_t)off_100079390, v4, off_100079460);
    BOOL v22 = sub_1000311BC((uint64_t)off_100079390, v4, off_100079468);
    int v23 = objc_alloc(&OBJC_CLASS___NSString);
    int v24 = @"general";
    if (v10) {
      int v24 = v10;
    }
    unsigned int v25 = @"NO";
    if (v21) {
      v26 = @"YES";
    }
    else {
      v26 = @"NO";
    }
    if (v22) {
      unsigned int v25 = @"YES";
    }
    xpc_object_t v19 = -[NSString initWithFormat:]( v23,  "initWithFormat:",  @"[XPC(ADD) %s] received | clientName:%@, exclusiveControl:%@, communalUponDisconnect:%@ |",  v7,  v24,  v26,  v25);
  }

  else
  {
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue( +[SUControllerManagerServer sharedManager]( &OBJC_CLASS___SUControllerManagerServer,  "sharedManager"));
    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString attachedClients](v10, "attachedClients"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 policyClientForConnection:v3]);

    if (v12) {
      BOOL v13 = (__CFString *)objc_claimAutoreleasedReturnValue([v12 summary]);
    }
    else {
      BOOL v13 = @"client";
    }
    id v14 = objc_alloc(&OBJC_CLASS___NSString);
    id v15 = v14;
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      xpc_object_t v19 = -[NSString initWithFormat:](v14, "initWithFormat:", @"[XPC(ERROR)] received | policyClient:%@ |", v13);
    }

    else
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString attachedClients](v10, "attachedClients"));
      unsigned int v17 = [v16 restrictingControlToExclusiveClients];
      uint64_t v18 = @"(communal)";
      if (v17) {
        uint64_t v18 = @"(exclusive)";
      }
      xpc_object_t v19 = -[NSString initWithFormat:]( v15,  "initWithFormat:",  @"[XPC%@ %s] received | policyClient:%@ |",  v18,  v7,  v13);
    }
  }

  return v19;
}

void sub_1000231E0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 oslog]);

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) summary]);
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[SPI] {...modifyConfig} %{public}@: useSUCore=YES",  (uint8_t *)&v5,  0xCu);
  }
}

void sub_1000232C8( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

uint64_t sub_1000232F4(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

void sub_100027B24(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attachedClients]);
  [v2 broadcastMessage:*(void *)(a1 + 40)];
}

void sub_100027F38(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v2 scanFSM]);
  id v4 = -[SUControllerScanManagerParam initWithError:]( objc_alloc(&OBJC_CLASS___SUControllerScanManagerParam),  "initWithError:",  v3);

  [v5 postEvent:@"ScanCanceled" withInfo:v4];
}

void sub_100028330(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  uint64_t v6 = *(void **)(a1 + 32);
  id v20 = v5;
  if (v5)
  {
    size_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 scanFSM]);
    id v8 = -[SUControllerScanManagerParam initWithError:]( objc_alloc(&OBJC_CLASS___SUControllerScanManagerParam),  "initWithError:",  v20);
    [v7 postEvent:@"CollectDocFailed" withInfo:v8];
  }

  else
  {
    size_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) primaryDescriptor]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 documentation]);
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 summary]);
    [v6 scanLog:@"[SCAN-FOUND] Documentation asset for primary descriptor: %@", v11];

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) secondaryDescriptor]);
    if (v12)
    {
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) secondaryDescriptor]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) primaryDescriptor]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 documentationAsset]);
      [v13 assignDocumentationFromAsset:v15];

      id v16 = *(void **)(a1 + 32);
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) secondaryDescriptor]);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 documentation]);
      xpc_object_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 summary]);
      [v16 scanLog:@"[SCAN-FOUND] Documentation asset for secondary descriptor: %@", v19];
    }

    size_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) scanFSM]);
    [v7 postEvent:@"CollectDocSuccess" withInfo:*(void *)(a1 + 40)];
  }
}

LABEL_15:
        -[SUControllerScanManager scanLog:]( self,  "scanLog:",  @"[SCAN_DECIDE] found newer update when no older doc to be removed");
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
        id v16 = v15;
        unsigned int v17 = @"FoundNewerSameDoc";
        goto LABEL_16;
      }
    }

    goto LABEL_15;
  }

  -[SUControllerScanManager scanLog:]( self,  "scanLog:",  @"[SCAN_DECIDE] found available update matching already found");
LABEL_6:
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  id v16 = v15;
  unsigned int v17 = @"FoundSame";
LABEL_16:
  [v15 followupEvent:v17 withInfo:v5];

  return 0LL;
}

  id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeClients]);
  [v15 addObject:*(void *)(a1 + 40)];

  if (![*(id *)(a1 + 40) usingExclusiveControl])
  {
    BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 oslog]);

    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    else {
      int v23 = @"communal";
    }
    uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
    *(_DWORD *)buf = 138543618;
    __int16 v55 = v23;
    v56 = 2114;
    __int16 v57 = v18;
    xpc_object_t v19 = "[ATTACHED_CLIENTS(%{public}@)] %{public}@: added communal client";
    id v20 = v17;
    BOOL v21 = 22;
    goto LABEL_24;
  }

  if ([*(id *)(a1 + 32) underExclusiveControl])
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
    *(_DWORD *)buf = 138543362;
    __int16 v55 = v18;
    xpc_object_t v19 = "[ATTACHED_CLIENTS(exclusive)] %{public}@: added exclusive client";
    id v20 = v17;
    BOOL v21 = 12;
LABEL_24:
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);

    goto LABEL_28;
  }

  unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[SUControllerManagerServer sharedManager]( &OBJC_CLASS___SUControllerManagerServer,  "sharedManager"));
  [*(id *)(a1 + 32) setUnderExclusiveControl:1];
  int v24 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s config](v17, "config"));
  unsigned int v25 = [v24 copy];
  [*(id *)(a1 + 32) setSimulatedConfig:v25];

  v26 = objc_alloc_init(&OBJC_CLASS___SUControllerStatus);
  [*(id *)(a1 + 32) setSimulatedStatus:v26];

  v27 = objc_alloc_init(&OBJC_CLASS___SUControllerDescriptor);
  [*(id *)(a1 + 32) setSimulatedDescriptor:v27];

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  BOOL v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 oslog]);

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v30 = (__CFString *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
    v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) simulatedStatus]);
    unsigned __int8 v32 = sub_100030320((uint64_t)[v31 managerState]);
    id v33 = (__CFString *)objc_claimAutoreleasedReturnValue(v32);
    *(_DWORD *)buf = 138543618;
    __int16 v55 = v30;
    v56 = 2114;
    __int16 v57 = v33;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[ATTACHED_CLIENTS(communal => exclusive)] %{public}@: requesting status from policy engine for more accurate simul ated status (temporary managerState:%{public}@)",  buf,  0x16u);
  }

  v42 = _NSConcreteStackBlock;
  v43 = 3221225472LL;
  id v44 = sub_10002D5FC;
  int v45 = &unk_100065750;
  uint64_t v34 = *(void **)(a1 + 40);
  unsigned int v46 = *(void *)(a1 + 32);
  v47 = v34;
  +[SUControllerCore managerStatusForClient:completion:]( &OBJC_CLASS___SUControllerCore,  "managerStatusForClient:completion:",  v47,  &v42);

LABEL_28:
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079388));
  v52 = v35;
  unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079398));
  __int16 v53 = v36;
  id v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));

  unsigned int v38 = sub_100031460(v37, 0LL);
  unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  if (v39)
  {
    v40 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) connection]);
    xpc_connection_send_message(v40, v39);
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag", v42, v43, v44, v45, v46));
  [v41 trackEnd:@"addPolicyClient" atLevel:1];
}

void sub_1000295E4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 copy];
    [*(id *)(a1 + 48) setScanConfig:v3];

    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) scanConfig]);
    unsigned int v5 = [v4 ignoreRamping];

    if (v5) {
      [*(id *)(a1 + 48) clearLatchedRamp];
    }
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
    size_t v7 = objc_alloc(&OBJC_CLASS___NSString);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
    size_t v9 = -[NSString initWithFormat:]( v7,  "initWithFormat:",  @"%@ {modifyConfigForClient} invalid request - no configuration provided",  v8);
    [v6 trackAnomaly:@"[SCAN_MANAGER]" forReason:v9 withResult:8101 withError:0];
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
  int v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v10 completionQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100029744;
  block[3] = &unk_100064888;
  id v13 = *(id *)(a1 + 56);
  dispatch_async(v11, block);
}

uint64_t sub_100029744(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100029B04(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v20 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
    if ([v13 isEqualToString:kSUCoreErrorDomain])
    {
      id v14 = [v12 code];

      if (v14 == (id)8406)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) scanFSM]);
        id v16 = -[SUControllerScanManagerParam initWithError:]( objc_alloc(&OBJC_CLASS___SUControllerScanManagerParam),  "initWithError:",  v12);
        unsigned int v17 = @"NoUpdateFound";
LABEL_8:
        [v15 postEvent:v17 withInfo:v16];
        goto LABEL_9;
      }
    }

    else
    {
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) scanFSM]);
    id v16 = -[SUControllerScanManagerParam initWithError:]( objc_alloc(&OBJC_CLASS___SUControllerScanManagerParam),  "initWithError:",  v12);
    unsigned int v17 = @"ScanFailed";
    goto LABEL_8;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) scanFSM]);
  uint64_t v18 = objc_alloc(&OBJC_CLASS___SUControllerScanManagerParam);
  id v16 = (SUControllerScanManagerParam *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) scanPolicy]);
  xpc_object_t v19 = -[SUControllerScanManagerParam initWithScanPolicy:withPrimaryDescriptor:withSecondaryDescriptor:]( v18,  "initWithScanPolicy:withPrimaryDescriptor:withSecondaryDescriptor:",  v16,  v9,  v10);
  [v15 postEvent:@"UpdateFound" withInfo:v19];

LABEL_9:
}

void sub_10002A5A0(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attachedClients]);
  [v2 broadcastMessage:*(void *)(a1 + 40)];
}

void sub_10002A988(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attachedClients]);
  [v2 broadcastMessage:*(void *)(a1 + 40)];
}

void sub_10002AC68(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attachedClients]);
  [v2 broadcastMessage:*(void *)(a1 + 40)];
}

void sub_10002AEF0(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attachedClients]);
  [v2 broadcastMessage:*(void *)(a1 + 40)];
}

void sub_10002B3B8(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
    objc_msgSend( v4,  "trackError:forReason:withResult:withError:",  @"[SCAN_MANAGER]",  @"unable to remove documentation assets",  objc_msgSend(v3, "code"),  v3);
  }

  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) scanFSM]);
  unsigned int v5 = objc_alloc_init(&OBJC_CLASS___SUControllerScanManagerParam);
  [v6 postEvent:@"Removed" withInfo:v5];
}

uint64_t sub_10002B558(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

CFStringRef sub_10002C38C(uint64_t a1)
{
  else {
    return off_1000656F0[a1 - 1];
  }
}

void sub_10002D02C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
  [v2 trackBegin:@"addPolicyClient" atLevel:1];

  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeClients]);
  id v4 = [v3 countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v49;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v49 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) clientName]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 clientName]);
        unsigned int v11 = [v9 isEqualToString:v10];

        if (v11)
        {
          id v12 = [v8 uniqueInstance];
          if ((uint64_t)v12 > (uint64_t)[*(id *)(a1 + 40) uniqueInstance])
          {
            objc_msgSend(*(id *)(a1 + 40), "setUniqueInstance:", (char *)objc_msgSend(v8, "uniqueInstance") + 1);
            if ((uint64_t)[*(id *)(a1 + 40) uniqueInstance] <= 0)
            {
              id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
              id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[ATTACHED_CLIENTS] unique client instance wrapped - using 1 as unique instance",  buf,  2u);
              }

              [*(id *)(a1 + 40) setUniqueInstance:1];
              goto LABEL_15;
            }
          }
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v48 objects:v58 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

void sub_10002D5FC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  size_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeClientsQueue]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002D6CC;
  v11[3] = &unk_100065728;
  id v8 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v6;
  id v14 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);
}

void sub_10002D6CC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 oslog]);

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) summary]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) simulatedStatus]);
    id v6 = sub_100030320((uint64_t)[v5 managerState]);
    size_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v8 = 138543618;
    id v9 = v4;
    __int16 v10 = 2114;
    unsigned int v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[ATTACHED_CLIENTS(communal => exclusive)] %{public}@: refreshed simulated status with information from policy engi ne (simulated managerState:%{public}@)",  (uint8_t *)&v8,  0x16u);
  }
}

void sub_10002D8B0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
  [v2 trackBegin:@"removeClientForConnection" atLevel:1];

  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _policyClientForConnection:*(void *)(a1 + 40)]);
  if (!v3)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003E334(a1, v6);
    }
    goto LABEL_23;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeClients]);
  [v4 removeObject:v3];

  if (![v3 usingExclusiveControl])
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    else {
      id v14 = @"communal";
    }
    size_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 summary]);
    uint64_t v15 = *(void *)(a1 + 48);
    int v21 = 138543874;
    BOOL v22 = v14;
    __int16 v23 = 2114;
    int v24 = v7;
    __int16 v25 = 2114;
    uint64_t v26 = v15;
    id v9 = "[ATTACHED_CLIENTS(%{public}@)] %{public}@: removed non-exclusive client (%{public}@)";
LABEL_19:
    __int16 v10 = v6;
    uint32_t v11 = 32;
    goto LABEL_20;
  }

  if (![v3 communalAfterDisconnecting])
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    else {
      unsigned int v17 = @"communal";
    }
    size_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 summary]);
    uint64_t v18 = *(void *)(a1 + 48);
    int v21 = 138543874;
    BOOL v22 = v17;
    __int16 v23 = 2114;
    int v24 = v7;
    __int16 v25 = 2114;
    uint64_t v26 = v18;
    id v9 = "[ATTACHED_CLIENTS(%{public}@)] %{public}@: removed exclusive client (%{public}@)";
    goto LABEL_19;
  }

  if ([*(id *)(a1 + 32) underExclusiveControl])
  {
    [*(id *)(a1 + 32) setUnderExclusiveControl:0];
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 oslog]);

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      size_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 summary]);
      int v8 = *(__CFString **)(a1 + 48);
      int v21 = 138543618;
      BOOL v22 = v7;
      __int16 v23 = 2114;
      int v24 = v8;
      id v9 = "[ATTACHED_CLIENTS(exclusive => communal)] %{public}@: removed exclusive client (%{public}@)";
      __int16 v10 = v6;
      uint32_t v11 = 22;
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v21, v11);
    }
  }

  else
  {
    xpc_object_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003E3AC(v3, a1, v6);
    }
  }

LABEL_23:
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
  [v20 trackEnd:@"removeClientForConnection" atLevel:1];
}

void sub_10002DCC8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
  [v2 trackBegin:@"broadcastMessage" atLevel:1];

  id v3 = sub_100031460(*(void **)(a1 + 32), 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  size_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 oslog]);

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = *(NSMutableArray **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    BOOL v30 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[ATTACHED_CLIENTS] broadcast message: %{public}@",  buf,  0xCu);
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) activeClients]);
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v25;
    *(void *)&__int128 v11 = 138543362LL;
    __int128 v23 = v11;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v15, "usingExclusiveControl", v23) & 1) != 0
          || ([*(id *)(a1 + 40) underExclusiveControl] & 1) == 0)
        {
          xpc_object_t v19 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v15 connection]);
          xpc_connection_send_message(v19, v4);

          unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 clientName]);
          -[NSMutableArray addObject:](v5, "addObject:", v17);
        }

        else
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
          unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v15 summary]);
            *(_DWORD *)buf = v23;
            BOOL v30 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[BROADCAST_CLIENTS] %{public}@: not informed (non-exclusive)",  buf,  0xCu);
          }
        }
      }

      id v12 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v12);
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 oslog]);

  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    BOOL v30 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[BROADCAST_CLIENTS] message was broadcasted to the following clients: %{public}@",  buf,  0xCu);
  }

  BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
  [v22 trackEnd:@"broadcastMessage" atLevel:1];
}

void sub_10002E10C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10002E124(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10002E134(uint64_t a1)
{
}

void sub_10002E13C(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _policyClientForConnection:*(void *)(a1 + 40)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10002E234( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_10002E24C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) underExclusiveControl];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

LABEL_11:
  return v7;
}
}

uint64_t sub_10002E49C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  uint64_t v3 = v2;
  id v4 = "disabling";
  if ((_DWORD)a1) {
    id v4 = "enabling";
  }
  objc_msgSend(v2, "logAtLevel:label:format:", 1, "SUControllerCacheDeleteSetCacheable", @"%s cacheing", v4);

  return CacheDeleteSetCacheable(a1);
}

void sub_10002E668(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  if (reply)
  {
    if (v9)
    {
      sub_100030EE8((uint64_t)off_1000793E8, reply, off_100079478, v9);
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 oslog]);

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10003E4D4();
      }
    }

    else
    {
      sub_100030EE8((uint64_t)off_1000793E8, reply, off_100079480, v7);
      if (v8) {
        sub_100030EE8((uint64_t)off_1000793E8, reply, off_100079490, v8);
      }
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 oslog]);

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v7 summary]);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 summary]);
        int v19 = 138543874;
        id v20 = v16;
        __int16 v21 = 2114;
        BOOL v22 = v17;
        __int16 v23 = 2114;
        __int128 v24 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[SPI] <<< %{public}@ {managerStatus} status:%{public}@, descriptor:%{public}@",  (uint8_t *)&v19,  0x20u);
      }
    }

    id v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) connection]);
    xpc_connection_send_message(v14, reply);
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10003E45C(a1);
    }
  }
}

void sub_10002EA34(uint64_t a1, int64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  id v10 = reply;
  if (reply)
  {
    if (v8)
    {
      sub_100030EE8((uint64_t)off_1000793F0, reply, off_100079478, v8);
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 oslog]);

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10003E5DC();
      }
    }

    else
    {
      xpc_dictionary_set_int64(reply, off_1000794D0, a2);
      if (v7) {
        sub_100030EE8((uint64_t)off_1000793F0, v10, off_100079490, v7);
      }
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 oslog]);

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
        unsigned int v17 = sub_100030320(a2);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        int v19 = (void *)objc_claimAutoreleasedReturnValue([v7 summary]);
        int v20 = 138543874;
        __int16 v21 = v16;
        __int16 v22 = 2114;
        __int16 v23 = v18;
        __int16 v24 = 2114;
        __int128 v25 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[SPI] <<< %{public}@ {managerState} state:%{public}@, descriptor:%{public}@",  (uint8_t *)&v20,  0x20u);
      }
    }

    id v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) connection]);
    xpc_connection_send_message(v14, v10);
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10003E564(a1);
    }
  }
}

void sub_10002EDF4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  if (reply)
  {
    if (v6)
    {
      sub_100030EE8((uint64_t)off_1000793F8, reply, off_100079478, v6);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10003E75C();
      }
    }

    else
    {
      id v16 = off_1000793F8;
      if (v5)
      {
        sub_100030EE8((uint64_t)off_1000793F8, reply, off_1000794D8, v5);
        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
          int v19 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
          *(_DWORD *)__int16 v24 = 138543618;
          *(void *)&v24[4] = v18;
          __int16 v25 = 2114;
          __int128 v26 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[SPI] <<< %{public}@ {managerConfig} activeConfig:%{public}@",  v24,  0x16u);
        }
      }

      else
      {
        int v20 = off_100079478;
        id v21 = sub_1000382D8( @"SUControllerError",  36LL,  0LL,  @"Unable to query configuration",  v7,  v8,  v9,  v10,  *(uint64_t *)v24);
        __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        sub_100030EE8((uint64_t)v16, reply, v20, v22);

        __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 oslog]);

        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_10003E6E4(a1);
        }
      }
    }

    id v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) connection]);
    xpc_connection_send_message(v14, reply);
  }

  else
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v15 oslog]);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10003E66C(a1);
    }
  }
}

void sub_10002F3F8(xpc_object_t *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  xpc_object_t reply = xpc_dictionary_create_reply(a1[4]);
  if (reply)
  {
    if (v6)
    {
      sub_100030EE8((uint64_t)off_100079400, reply, off_100079478, v6);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10003EA44();
      }
    }

    else
    {
      id v16 = off_100079400;
      if (v5)
      {
        sub_100030EE8((uint64_t)off_100079400, reply, off_1000794D8, v5);
        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([a1[5] summary]);
          int v19 = (void *)objc_claimAutoreleasedReturnValue([a1[6] summary]);
          *(_DWORD *)__int16 v24 = 138543618;
          *(void *)&v24[4] = v18;
          __int16 v25 = 2114;
          __int128 v26 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[SPI] <<< %{public}@ {modifyConfig} modifiedConfig:%{public}@",  v24,  0x16u);
        }
      }

      else
      {
        int v20 = off_100079478;
        id v21 = sub_1000382D8( @"SUControllerError",  36LL,  0LL,  @"No modified configuration provided",  v7,  v8,  v9,  v10,  *(uint64_t *)v24);
        __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        sub_100030EE8((uint64_t)v16, reply, v20, v22);

        __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 oslog]);

        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_10003E9CC((uint64_t)a1);
        }
      }
    }

    id v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([a1[5] connection]);
    xpc_connection_send_message(v14, reply);
  }

  else
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v15 oslog]);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10003E954((uint64_t)a1);
    }
  }
}

void sub_1000300F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  if (reply)
  {
    if (v3)
    {
      sub_100030EE8((uint64_t)off_100079428, reply, off_100079478, v3);
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 oslog]);

      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10003EBC4();
      }
    }

    else
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
        int v11 = 138543362;
        id v12 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[SPI] <<< %{public}@ {purgeUpdate}",  (uint8_t *)&v11,  0xCu);
      }
    }

    uint64_t v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) connection]);
    xpc_connection_send_message(v8, reply);
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10003EB4C(a1);
    }
  }
}

void sub_1000302C4( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

uint64_t sub_100030300(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

id sub_10003030C(void *a1, const char *a2)
{
  return [a1 newSafeErrorDescription:v2];
}

  ;
}

CFStringRef sub_100030320(uint64_t a1)
{
  else {
    return off_100065830[a1 - 1];
  }
}

LABEL_17:
  return v8;
}

LABEL_46:
    id v12 = @"SUCore error with no equivalent SUController error";
    goto LABEL_19;
  }

  id v14 = 0LL;
LABEL_31:

  return v14;
}

  if ((-[__CFString isEqualToString:](v5, "isEqualToString:", &stru_100066480) & 1) == 0)
  {
    __int16 v23 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", @"|"));

    id v5 = (__CFString *)v23;
  }

  __int16 v24 = v5;

  return v24;
}

void sub_100030EE8(uint64_t a1, void *a2, const char *a3, void *a4)
{
  xpc_object_t xdict = a2;
  id v7 = a4;
  if (xdict && a3 && v7)
  {
    uint64_t v8 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
    -[NSKeyedArchiver encodeObject:forKey:](v8, "encodeObject:forKey:", v7, NSKeyedArchiveRootObjectKey);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v8, "encodedData"));
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
      xpc_dictionary_set_data(xdict, a3, [v11 bytes], (size_t)objc_msgSend(v11, "length"));
    }

    else
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
      [v15 logAtLevel:0 label:"SUControllerIPCEncodeObject" format:@"{SUControllerIPCEncodeObject} failed to encode using archiver"];
    }
  }

  else
  {
    id v12 = (NSKeyedArchiver *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    uint64_t v8 = v12;
    uint64_t v13 = "MISSING";
    if (a3) {
      uint64_t v13 = a3;
    }
    id v14 = @"PROVIDED";
    if (!v7) {
      id v14 = @"MISSING";
    }
    -[NSKeyedArchiver logAtLevel:label:format:]( v12,  "logAtLevel:label:format:",  0LL,  "SUControllerIPCEncodeObject",  @"{SUControllerIPCEncodeObject} missing required parameter(s): message:PROVIDED(%s), key:%s, object:%@",  a1,  v13,  v14);
  }
}

id sub_100031058(uint64_t a1, xpc_object_t xdict, char *key, uint64_t a4, int a5)
{
  if (!xdict || !key)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    id v16 = v15;
    unsigned int v17 = "MISSING";
    if (key) {
      unsigned int v17 = key;
    }
    objc_msgSend( v15,  "logAtLevel:label:format:",  0,  "_SUControllerIPCDecodeObjectForKey",  @"{_SUControllerIPCDecodeObjectForKey} missing required parameter(s): message:PROVIDED(%s), key:%s",  a1,  v17);

    return 0LL;
  }

  data = xpc_dictionary_get_data(xdict, key, &length);
  if (!data)
  {
    if (a5)
    {
      uint64_t v13 = (NSKeyedUnarchiver *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
      -[NSKeyedUnarchiver logAtLevel:label:format:]( v13,  "logAtLevel:label:format:",  0LL,  "_SUControllerIPCDecodeObjectForKey",  @"{SUControllerIPCDecodeObjectForKey} unable to get data for key:%s",  key);
      id v14 = 0LL;
      goto LABEL_11;
    }

    return 0LL;
  }

  uint64_t v10 = data;
  id v11 = objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v10, length));
  uint64_t v13 = -[NSKeyedUnarchiver initForReadingFromData:error:](v11, "initForReadingFromData:error:", v12, 0LL);

  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v13,  "decodeObjectOfClass:forKey:",  a4,  NSKeyedArchiveRootObjectKey));
  -[NSKeyedUnarchiver finishDecoding](v13, "finishDecoding");
LABEL_11:

  return v14;
}

id sub_1000311AC(uint64_t a1, void *a2, char *a3, uint64_t a4)
{
  return sub_100031058(a1, a2, a3, a4, 1);
}

id sub_1000311B4(uint64_t a1, void *a2, char *a3, uint64_t a4)
{
  return sub_100031058(a1, a2, a3, a4, 0);
}

BOOL sub_1000311BC(uint64_t a1, xpc_object_t xdict, char *key)
{
  if (xdict && key) {
    return xpc_dictionary_get_BOOL(xdict, key);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  id v7 = v6;
  uint64_t v8 = "MISSING";
  if (key) {
    uint64_t v8 = key;
  }
  objc_msgSend( v6,  "logAtLevel:label:format:",  0,  "SUControllerIPCDecodeBooleanForKey",  @"{SUControllerIPCDecodeBooleanForKey} missing required parameter(s): message:PROVIDED(%s), key:%s",  a1,  v8);

  return 0LL;
}

char *sub_100031258(uint64_t a1, xpc_object_t xdict, char *key)
{
  if (xdict && key)
  {
    string = (char *)xpc_dictionary_get_string(xdict, key);
    if (string) {
      string = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
    }
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    id v7 = v6;
    uint64_t v8 = "MISSING";
    if (key) {
      uint64_t v8 = key;
    }
    objc_msgSend( v6,  "logAtLevel:label:format:",  0,  "SUControllerIPCDecodeStringForKey",  @"{SUControllerIPCDecodeStringForKey} missing required parameter(s): message:PROVIDED(%s), key:%s",  a1,  v8);

    string = 0LL;
  }

  return string;
}

BOOL sub_100031300(uint64_t a1)
{
  CFErrorRef error = 0LL;
  xpc_connection_get_audit_token(a1, &v13);
  audit_token_t token = v13;
  id v1 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v1, @"com.apple.private.allow-SUController", &error);
    if (v3)
    {
      id v4 = v3;
      CFTypeID v5 = CFGetTypeID(v3);
      if (v5 == CFBooleanGetTypeID())
      {
        BOOL v6 = CFBooleanGetValue(v4) != 0;
      }

      else
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
        [v9 logAtLevel:0 label:"SUControllerIPCClientIsEntitled" format:@"entitlement has wrong type"];

        BOOL v6 = 0LL;
      }

      CFRelease(v2);
      uint64_t v2 = v4;
    }

    else
    {
      CFErrorRef v7 = error;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
      if (v7) {
        objc_msgSend( v8,  "logAtLevel:label:format:",  0,  "SUControllerIPCClientIsEntitled",  @"unable to look up client entitlement: %ld",  CFErrorGetCode(error));
      }
      else {
        objc_msgSend( v8,  "logAtLevel:label:format:",  0,  "SUControllerIPCClientIsEntitled",  @"client is not entitled",  v11);
      }

      BOOL v6 = 0LL;
    }

    CFRelease(v2);
  }

  else
  {
    BOOL v6 = 0LL;
  }

  if (error) {
    CFRelease(error);
  }
  return v6;
}

id sub_100031460(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  CFTypeID v5 = v4;
  if (v4) {
    xpc_object_t v6 = v4;
  }
  else {
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10003150C;
  v9[3] = &unk_1000658D0;
  id v7 = v6;
  id v10 = v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

void sub_10003150C(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    xpc_object_t v10 = xpc_string_create((const char *)[v8 UTF8String]);
  }

  else
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSData);
    if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
    {
      id v12 = v8;
      xpc_object_t v10 = xpc_data_create([v12 bytes], (size_t)objc_msgSend(v12, "length"));
    }

    else
    {
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v8, v13) & 1) == 0)
      {
        id v14 = 0LL;
        goto LABEL_8;
      }

      xpc_object_t v10 = xpc_int64_create((int64_t)[v8 integerValue]);
    }
  }

  id v14 = v10;
LABEL_8:
  uint64_t v15 = *(void **)(a1 + 32);
  id v16 = v7;
  xpc_dictionary_set_value(v15, (const char *)[v16 UTF8String], v14);
  *a4 = 0;
}

id sub_100031638(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && xpc_get_type(v1) == (xpc_type_t)&_xpc_type_dictionary)
  {
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472LL;
    applier[2] = sub_1000316E8;
    applier[3] = &unk_1000658F8;
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v6 = v3;
    xpc_dictionary_apply(v2, applier);
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

uint64_t sub_1000316E8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  xpc_type_t type = xpc_get_type(v5);
  if (type == (xpc_type_t)&_xpc_type_string)
  {
    uint64_t v9 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_string_get_string_ptr(v5));
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v9);
  }

  else if (type == (xpc_type_t)&_xpc_type_data)
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v5);
    uint64_t v11 = +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  bytes_ptr,  xpc_data_get_length(v5));
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v11);
  }

  else
  {
    id v7 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", xpc_int64_get_value(v5));
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
  }

  id v12 = (void *)v8;
  if (v8)
  {
    uint64_t v13 = *(void **)(a1 + 32);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
    [v13 setObject:v12 forKey:v14];
  }

LABEL_9:
  return 1LL;
}

void sub_100031850(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___SUControllerLogger);
  uint64_t v2 = (void *)qword_100079640;
  qword_100079640 = (uint64_t)v1;
}

void sub_100031EFC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  [v2 logAtLevel:1 label:"-[SUAutoInstallManager modifyConfig:]_block_invoke" format:@"modify auto-install configuration"];

  id v3 = [*(id *)(a1 + 40) copy];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 32LL);
  if ((unint64_t)(v6 - 2) >= 2)
  {
    if (v6 == 1) {
      return;
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 32LL);
    id v11 = v7;
    uint64_t v8 = @"adjust install window from unknown state: %d";
    uint64_t v9 = 0LL;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    uint64_t v8 = @"change in auto-install config will apply the next time we wait for the auto-install window";
    id v11 = v7;
    uint64_t v9 = 1LL;
  }

  objc_msgSend(v7, "logAtLevel:label:format:", v9, "-[SUAutoInstallManager modifyConfig:]_block_invoke", v8, v10);
}

void sub_100032078(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  [v2 logAtLevel:1 label:"-[SUAutoInstallManager awaitInstallAllowed:]_block_invoke" format:@"wait to be within the auto-install allowed window"];

  [*(id *)(a1 + 32) setWithinAllowedWindowCompletion:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3[4];
  switch(v4)
  {
    case 3LL:
      [v3 _startWaitingForInstallAllowed];
      id v10 = (id)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) suWindowName]);
      uint64_t v9 = v5;
      uint64_t v6 = @"waiting again for auto-install window: %@";
      break;
    case 2LL:
      id v10 = (id)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) suWindowName]);
      uint64_t v9 = v5;
      uint64_t v6 = @"already waiting for auto-install window: %@";
      id v7 = v10;
      uint64_t v8 = 0LL;
      goto LABEL_8;
    case 1LL:
      [v3 _startWaitingForInstallAllowed];
      id v10 = (id)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) suWindowName]);
      uint64_t v9 = v5;
      uint64_t v6 = @"now waiting for auto-install window: %@";
      break;
    default:
      id v10 = (id)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
      objc_msgSend( v10,  "logAtLevel:label:format:",  0,  "-[SUAutoInstallManager awaitInstallAllowed:]_block_invoke",  @"wait to be within the auto-install window from unknown state: %d",  *(void *)(*(void *)(a1 + 32) + 32));
      goto LABEL_10;
  }

  id v7 = v10;
  uint64_t v8 = 1LL;
LABEL_8:
  objc_msgSend(v7, "logAtLevel:label:format:", v8, "-[SUAutoInstallManager awaitInstallAllowed:]_block_invoke", v6, v9);

LABEL_10:
}

void sub_100032348(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40LL);
  if (v2)
  {
    if (([v2 isPersistedStateLoaded] & 1) != 0
      || [*(id *)(*(void *)(a1 + 32) + 40) loadPersistedState])
    {
      id v19 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) dateForKey:@"ScheduledAutoInstallStart"]);
      id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) dateForKey:@"ScheduledAutoInstallEnd"]);
      if (v19) {
        BOOL v4 = v3 == 0LL;
      }
      else {
        BOOL v4 = 1;
      }
      if (v4)
      {
        id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
        uint64_t v6 = v5;
        id v7 = @"There is no previous auto install window";
        uint64_t v8 = 1LL;
      }

      else
      {
        [v3 timeIntervalSinceNow];
        uint64_t v12 = (uint64_t)v11;
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
        [v13 logAtLevel:1, "-[SUAutoInstallManager _loadAndSchedulePreviousForecastStartEndWindow]_block_invoke", @"Loaded previous auto install start: %@, end: %@", v19, v3 label format];

        if ((unint64_t)(v12 - 1) <= 0x1517E)
        {
          [*(id *)(*(void *)(a1 + 32) + 16) provideSUStartEndDates:v19 endingAt:v3];
          id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) suWindowName]);
          [v14 logAtLevel:1, "-[SUAutoInstallManager _loadAndSchedulePreviousForecastStartEndWindow]_block_invoke", @"Will be using previous install window: %@", v15 label format];

          id v16 = *(id **)(a1 + 32);
          uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v16[2] suStartDate]);
          unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) suEndDate]);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) suWindowName]);
          [v16 _scheduleStartAndEndInstallWindow:v6 withEndTime:v17 withWindowName:v18];

LABEL_17:
          goto LABEL_18;
        }

        id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger", v19));
        uint64_t v6 = v5;
        id v7 = @"Previous auto install window already ended, but sucontrollerd was not invoked";
        uint64_t v8 = 0LL;
      }

      [v5 logAtLevel:v8 label:"-[SUAutoInstallManager _loadAndSchedulePreviousForecastStartEndWindow]_block_invoke" format:v7];
      goto LABEL_17;
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    id v19 = v9;
    id v10 = @"Failed to load persisted state";
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    id v19 = v9;
    id v10 = @"_corePersisteed is nil.  It should not be!";
  }

  [v9 logAtLevel:0 label:"-[SUAutoInstallManager _loadAndSchedulePreviousForecastStartEndWindow]_block_invoke" format:v10];
LABEL_18:
}

id sub_100032888(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelWaitInstallAllowed:*(void *)(a1 + 40)];
}

uint64_t sub_100032AD8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

id sub_100032B40(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  [v2 logAtLevel:1 label:"-[SUAutoInstallManager noteAutoInstallOperationWantsToBegin]_block_invoke" format:@"auto-install operation wants to begin"];

  [*(id *)(*(void *)(a1 + 32) + 8) cancelAutoInstallExpirationTask];
  *(void *)(*(void *)(a1 + 32) + 32LL) = 3LL;
  [*(id *)(a1 + 32) _setPersistedStartTime:0 endTime:0];
  return [*(id *)(a1 + 32) _notifyNoLongerWaitingInstallWindow:0];
}

void sub_100032C14(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 32LL);
  if (v2 == 3)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    objc_msgSend( v7,  "logAtLevel:label:format:",  0,  "-[SUAutoInstallManager noteAutoInstallOperationDidExpire]_block_invoke",  @"auto-install expired in unexpected state: %d",  *(void *)(*(void *)(a1 + 32) + 32));
  }

  else
  {
    if (v2 == 2)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
      [v5 logAtLevel:1 label:"-[SUAutoInstallManager noteAutoInstallOperationDidExpire]_block_invoke" format:@"auto-install expired - Core Duet never triggered the install"];

      [*(id *)(a1 + 32) _cancelWaitInstallAllowed:41];
      return;
    }

    if (v2 == 1)
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
      id v7 = v3;
      BOOL v4 = @"auto-install expired when Idle";
    }

    else
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 32LL);
      id v7 = v3;
      BOOL v4 = @"auto-install expired in unknown state: %d";
    }

    objc_msgSend( v3,  "logAtLevel:label:format:",  0,  "-[SUAutoInstallManager noteAutoInstallOperationDidExpire]_block_invoke",  v4,  v6);
  }
}

id sub_100034E04(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
    -[NSKeyedArchiver encodeObject:forKey:](v2, "encodeObject:forKey:", v1, NSKeyedArchiveRootObjectKey);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v2, "encodedData"));
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }

  return v3;
}

id sub_100034E90(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 objectForKey:v6]);
  if (v7
    && (uint64_t v8 = (void *)v7,
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v6]),
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null")),
        unsigned __int8 v11 = [v9 isEqual:v10],
        v10,
        v9,
        v8,
        (v11 & 1) == 0))
  {
    uint64_t v13 = objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v6]);
    uint64_t v15 = -[NSKeyedUnarchiver initForReadingFromData:error:](v13, "initForReadingFromData:error:", v14, 0LL);

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v15,  "decodeObjectOfClass:forKey:",  a3,  NSKeyedArchiveRootObjectKey));
    -[NSKeyedUnarchiver finishDecoding](v15, "finishDecoding");
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return v12;
}

void sub_100034FF4(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___SUControllerMessageEndpoint);
  uint64_t v2 = (void *)qword_100079650;
  qword_100079650 = (uint64_t)v1;
}

void sub_100035494(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) messageHandlers]);
  id v2 = objc_retainBlock(*(id *)(a1 + 48));
  [v3 setObject:v2 forKey:*(void *)(a1 + 40)];
}

void sub_1000355A8(id *a1)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v2 = a1[4];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8LL * (void)v6);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "messageHandlers", (void)v10));
        id v9 = objc_retainBlock(a1[6]);
        [v8 setObject:v9 forKey:v7];

        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v4);
  }
}

void sub_100035BC8(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v10 = a2;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  unsigned __int8 v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0) {
    [*(id *)(a1 + 32) setObject:v7 forKey:v10];
  }
  *a4 = 0;
}

void sub_100036234(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pendingMessageReplies]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) incomingResponseIdentifier]);
  __int128 v13 = (void (**)(id, void, void *))objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v3]);

  if (!v13)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    id v5 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) incomingResponseIdentifier]);
    objc_msgSend( v4,  "logAtLevel:label:format:",  0,  "-[SUControllerMessageEndpoint service:account:incomingData:fromID:context:]_block_invoke",  @"No reply handler set for message identifier %s",  objc_msgSend(v5, "UTF8String"));
    goto LABEL_8;
  }

  if (!*(void *)(a1 + 48))
  {
    id v6 = *(void **)(a1 + 56);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079478));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);

    if (v8)
    {
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSError);
      id v10 = *(void **)(a1 + 56);
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079478));
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v11]);
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v9,  v12,  0LL));

      v13[2](v13, 0LL, v4);
LABEL_9:

      goto LABEL_10;
    }

    v13[2](v13, *(void *)(a1 + 56), 0LL);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pendingMessageReplies]);
    id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) incomingResponseIdentifier]);
    [v4 removeObjectForKey:v5];
LABEL_8:

    goto LABEL_9;
  }

  ((void (*)(void (**)(id, void, void *), void))v13[2])(v13, 0LL);
LABEL_10:
}

void sub_100036428(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  [v2 logAtLevel:2, "-[SUControllerMessageEndpoint service:account:incomingData:fromID:context:]_block_invoke_2", @"Received message: %@", *(void *)(a1 + 32) label format];

  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) outgoingResponseIdentifier]);
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, v4, v5);
}

void sub_100036584( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void **)(a1 + 32);
  if (v9)
  {
    id v10 = sub_1000382D8(@"SUControllerError", 2LL, v9, @"failed to send message", a5, a6, a7, a8, v17);
    id v18 = (id)objc_claimAutoreleasedReturnValue(v10);
  }

  else
  {
    id v18 = 0LL;
  }

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) pendingMessageCompletions]);
  __int128 v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:*(void *)(a1 + 48)]);

  if (v12)
  {
    ((void (**)(void, id))v12)[2](v12, v18);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) pendingMessageCompletions]);
    [v13 removeObjectForKey:*(void *)(a1 + 48)];
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) pendingMessageReplies]);
  uint64_t v15 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( [v14 objectForKeyedSubscript:*(void *)(a1 + 48)]);

  if (!*(_BYTE *)(a1 + 56) && v15)
  {
    ((void (**)(void, void, id))v15)[2](v15, 0LL, v18);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) pendingMessageReplies]);
    [v16 removeObjectForKey:*(void *)(a1 + 48)];
  }
}

id sub_100036870(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleBTACallback:a2 jobParameters:a3];
}

id sub_1000369A0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  objc_msgSend( v2,  "logAtLevel:label:format:",  1,  "-[SUBackgroundTaskAgent handleBTACallback:jobParameters:]_block_invoke",  @"BTA (Background Task Agent) invoked the callback handler for job %s",  *(void *)(a1 + 56));

  if (!strcmp(*(const char **)(a1 + 56), "com.apple.softwareupdate.autoinstall.installWindowEnd"))
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v3 = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  "com.apple.softwareupdate.autoinstall.installWindowEnd");
    [v4 _handleAutoInstallExpirationTask:v3 parameters:*(void *)(a1 + 40)];
  }

  else
  {
    uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    -[NSString logAtLevel:label:format:]( v3,  "logAtLevel:label:format:",  0LL,  "-[SUBackgroundTaskAgent handleBTACallback:jobParameters:]_block_invoke",  @"BTA (Background Task Agent) invoked the callback handler of usnupported job: %s",  *(void *)(a1 + 56));
  }

  return [*(id *)(a1 + 48) endTransaction:@"BackgroundTask"];
}

id sub_100036E7C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleDuetCallback:*(void *)(a1 + 40) criteria:*(void *)(a1 + 48) activity:a2];
}

id sub_100037060(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  [v2 logAtLevel:1 label:"-[SUBackgroundTaskAgent handleDuetCallback:criteria:activity:]_block_invoke" format:@"Duet criteria met - notifying to start install"];

  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  "com.apple.softwareupdate.autoinstall.startInstall");
  [v3 _handleAutoInstallStartInstall:v4 parameters:0];

  return [*(id *)(a1 + 40) endTransaction:@"BackgroundTask"];
}

id sub_100037238(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  [v2 logAtLevel:1, "-[SUBackgroundTaskAgent _handleAutoInstallStartInstall:parameters:]_block_invoke", @"notifying WantsToBegin job: %@", *(void *)(a1 + 32) label format];

  return [*(id *)(*(void *)(a1 + 40) + 8) noteAutoInstallOperationWantsToBegin];
}

id sub_100037318(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  [v2 logAtLevel:1, "-[SUBackgroundTaskAgent _handleAutoInstallExpirationTask:parameters:]_block_invoke", @"notifying DidExpire job: %@", *(void *)(a1 + 32) label format];

  return [*(id *)(*(void *)(a1 + 40) + 8) noteAutoInstallOperationDidExpire];
}

void sub_100037E58(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___SUControllerTransactionManager);
  id v2 = (void *)qword_100079660;
  qword_100079660 = (uint64_t)v1;
}

void sub_100037FA0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) transactions]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:*(void *)(a1 + 40)]);

  if (v3)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    [v9 logAtLevel:0, "-[SUControllerTransactionManager beginTransaction:]_block_invoke", @"beginTransaction failed,transaction with name %@ already exists.", *(void *)(a1 + 40) label format];
  }

  else
  {
    id v4 = [*(id *)(a1 + 40) cStringUsingEncoding:1];
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) transactions]);
    id v6 = (void *)os_transaction_create(v4);
    [v5 setObject:v6 forKey:*(void *)(a1 + 40)];

    id v9 = (id)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) transactions]);
    [v9 logAtLevel:1, "-[SUControllerTransactionManager beginTransaction:]_block_invoke", @"begin transaction %@ (%lu active transactions)", v7, objc_msgSend(v8, "count") label format];
  }
}

void sub_100038160(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) transactions]);
  id v7 = (id)objc_claimAutoreleasedReturnValue([v2 objectForKey:*(void *)(a1 + 40)]);

  if (v7)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) transactions]);
    [v3 removeObjectForKey:*(void *)(a1 + 40)];

    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) transactions]);
    [v4 logAtLevel:1, "-[SUControllerTransactionManager endTransaction:]_block_invoke", @"end transaction %@ (%lu active transactions)", v5, objc_msgSend(v6, "count") label format];
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    [v4 logAtLevel:0, "-[SUControllerTransactionManager endTransaction:]_block_invoke", @"endTransaction failed,no transaction found with name %@.", *(void *)(a1 + 40) label format];
  }
}

id sub_1000382D8( void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = sub_100038310(a1, a2, 0LL, a3, a4, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue(v9);
}

id sub_100038310(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11 = a1;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (v12) {
    id v15 = [v12 mutableCopy];
  }
  else {
    id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  id v16 = v15;
  if (v14)
  {
    uint64_t v17 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v14,  a6);
    if (v17) {
      [v16 setObject:v17 forKeyedSubscript:NSLocalizedDescriptionKey];
    }
  }

  if (v13) {
    [v16 setObject:v13 forKeyedSubscript:NSUnderlyingErrorKey];
  }
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v11,  a2,  v16));

  return v18;
}

id sub_10003842C( void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = sub_100038310(a1, a2, a3, a4, a5, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue(v9);
}

uint64_t sub_100038458(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  uint64_t v5 = (void *)v4;
  if (v3 | v4)
  {
    uint64_t v6 = 0LL;
    if (v3 && v4) {
      uint64_t v6 = (uint64_t)[(id)v3 isEqualToString:v4];
    }
  }

  else
  {
    uint64_t v6 = 1LL;
  }

  return v6;
}

uint64_t sub_1000384C4()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice"));
  id v1 = (void *)objc_claimAutoreleasedReturnValue([v0 deviceClass]);
  unsigned int v2 = [v1 isEqualToString:@"AppleTV"];

  return v2 ^ 1;
}

void sub_100038560(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___SUControllerAdmissionController);
  unsigned int v2 = (void *)qword_100079670;
  qword_100079670 = (uint64_t)v1;
}

uint64_t sub_100038618(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

LABEL_16:
  if ((v4 & 2) != 0)
  {
    -[SUControllerConfig setPerformAutoDownloadAndPrepare:]( self,  "setPerformAutoDownloadAndPrepare:",  -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:]( self,  "_storeBooleanToDefaults:toValue:isStoredInverted:",  @"SUDisableAutoDownloadAndPrepare",  [v7 performAutoDownloadAndPrepare],  1));
    id v7 = v35;
    if ((v4 & 4) == 0)
    {
LABEL_18:
      if ((v4 & 8) == 0) {
        goto LABEL_19;
      }
      goto LABEL_48;
    }
  }

  else if ((v4 & 4) == 0)
  {
    goto LABEL_18;
  }

  -[SUControllerConfig setPerformAutoInstall:]( self,  "setPerformAutoInstall:",  -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:]( self,  "_storeBooleanToDefaults:toValue:isStoredInverted:",  @"SUDisableAutoInstall",  [v7 performAutoInstall],  1));
  id v7 = v35;
  if ((v4 & 8) == 0)
  {
LABEL_19:
    if ((v4 & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_49;
  }

LABEL_48:
  -[SUControllerConfig setAutoAcceptTermsAndConditions:]( self,  "setAutoAcceptTermsAndConditions:",  -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:]( self,  "_storeBooleanToDefaults:toValue:isStoredInverted:",  @"SUAutoAcceptTermsAndConditions",  [v7 autoAcceptTermsAndConditions],  0));
  id v7 = v35;
  if ((v4 & 0x10) == 0)
  {
LABEL_20:
    if ((v4 & 0x2000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_50;
  }

LABEL_49:
  -[SUControllerConfig setAutoActivityCheckPeriod:]( self,  "setAutoActivityCheckPeriod:",  -[SUControllerConfig _storeIntegerToDefaults:toValue:]( self,  "_storeIntegerToDefaults:toValue:",  @"SUAutoActivityCheckPeriod",  [v7 autoActivityCheckPeriod]));
  id v7 = v35;
  if ((v4 & 0x2000) == 0)
  {
LABEL_21:
    if ((v4 & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_51;
  }

LABEL_50:
  -[SUControllerConfig setAutoInstallForceMaxWait:]( self,  "setAutoInstallForceMaxWait:",  -[SUControllerConfig _storeIntegerToDefaults:toValue:]( self,  "_storeIntegerToDefaults:toValue:",  @"SUAutoInstallForceMaxWait",  [v7 autoInstallForceMaxWait]));
  id v7 = v35;
  if ((v4 & 0x80) == 0)
  {
LABEL_22:
    if ((v4 & 0x100) == 0) {
      goto LABEL_23;
    }
    goto LABEL_52;
  }

LABEL_51:
  -[SUControllerConfig setAutoInstallWindowBeginHour:]( self,  "setAutoInstallWindowBeginHour:",  -[SUControllerConfig _storeIntegerToDefaults:toValue:]( self,  "_storeIntegerToDefaults:toValue:",  @"SUAutoInstallWindowBeginHour",  [v7 autoInstallWindowBeginHour]));
  id v7 = v35;
  if ((v4 & 0x100) == 0)
  {
LABEL_23:
    if ((v4 & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_53;
  }

LABEL_52:
  -[SUControllerConfig setAutoInstallWindowBeginMinute:]( self,  "setAutoInstallWindowBeginMinute:",  -[SUControllerConfig _storeIntegerToDefaults:toValue:]( self,  "_storeIntegerToDefaults:toValue:",  @"SUAutoInstallWindowBeginMinute",  [v7 autoInstallWindowBeginMinute]));
  id v7 = v35;
  if ((v4 & 0x200) == 0)
  {
LABEL_24:
    if ((v4 & 0x400) == 0) {
      goto LABEL_25;
    }
    goto LABEL_54;
  }

LABEL_53:
  -[SUControllerConfig setAutoInstallWindowEndHour:]( self,  "setAutoInstallWindowEndHour:",  -[SUControllerConfig _storeIntegerToDefaults:toValue:]( self,  "_storeIntegerToDefaults:toValue:",  @"SUAutoInstallWindowEndHour",  [v7 autoInstallWindowEndHour]));
  id v7 = v35;
  if ((v4 & 0x400) == 0)
  {
LABEL_25:
    if ((v4 & 0x400000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_55;
  }

LABEL_54:
  -[SUControllerConfig setAutoInstallWindowEndMinute:]( self,  "setAutoInstallWindowEndMinute:",  -[SUControllerConfig _storeIntegerToDefaults:toValue:]( self,  "_storeIntegerToDefaults:toValue:",  @"SUAutoInstallWindowEndMinute",  [v7 autoInstallWindowEndMinute]));
  id v7 = v35;
  if ((v4 & 0x400000) == 0)
  {
LABEL_26:
    if ((v4 & 0x800000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_56;
  }

LABEL_55:
  -[SUControllerConfig setDownloadDocAsset:]( self,  "setDownloadDocAsset:",  -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:]( self,  "_storeBooleanToDefaults:toValue:isStoredInverted:",  @"SUDownloadDocAsset",  [v7 downloadDocAsset],  0));
  id v7 = v35;
  if ((v4 & 0x800000) == 0)
  {
LABEL_27:
    if ((v4 & 0x10000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_57;
  }

LABEL_56:
  -[SUControllerConfig setIgnoreRamping:]( self,  "setIgnoreRamping:",  -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:]( self,  "_storeBooleanToDefaults:toValue:isStoredInverted:",  @"SUIgnoreRamping",  [v7 ignoreRamping],  0));
  id v7 = v35;
  if ((v4 & 0x10000000) == 0)
  {
LABEL_28:
    if ((v4 & 0x20000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_58;
  }

LABEL_57:
  -[SUControllerConfig setSupervisedMDM:]( self,  "setSupervisedMDM:",  -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:]( self,  "_storeBooleanToDefaults:toValue:isStoredInverted:",  @"supervisedMDM",  [v7 supervisedMDM],  0));
  id v7 = v35;
  if ((v4 & 0x20000000) == 0)
  {
LABEL_29:
    if ((v4 & 0x40000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_59;
  }

  uint64_t v34 = objc_alloc(&OBJC_CLASS___NSString);
  if (-[SUControllerConfig autoAcceptTermsAndConditions](self, "autoAcceptTermsAndConditions")) {
    v35 = @"Y";
  }
  else {
    v35 = @"N";
  }
  unsigned __int8 v36 = -[NSString initWithFormat:](v34, "initWithFormat:", @"|autoAccept:%@", v35);
  id v37 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v36));

  uint64_t v5 = (__CFString *)v37;
  if ((v3 & 0x10) == 0)
  {
LABEL_17:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }

LABEL_58:
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v7 requestedPMV]);
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( -[SUControllerConfig _storeStringToDefaults:toValue:]( self,  "_storeStringToDefaults:toValue:",  @"requestedPMV",  v21));
  -[SUControllerConfig setRequestedPMV:](self, "setRequestedPMV:", v22);

  id v7 = v35;
  if ((v4 & 0x40000000) == 0)
  {
LABEL_30:
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_60;
  }

LABEL_59:
  -[SUControllerConfig setDelayPeriod:]( self,  "setDelayPeriod:",  -[SUControllerConfig _storeIntegerToDefaults:toValue:]( self,  "_storeIntegerToDefaults:toValue:",  @"delayPeriod",  [v7 delayPeriod]));
  id v7 = v35;
  if ((v4 & 0x80000000) == 0)
  {
LABEL_31:
    if ((v4 & 0x20) == 0) {
      goto LABEL_32;
    }
    goto LABEL_61;
  }

LABEL_60:
  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v7 installPhaseOSBackgroundImagePath]);
  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( -[SUControllerConfig _storeStringToDefaults:toValue:]( self,  "_storeStringToDefaults:toValue:",  @"installPhaseOSBackgroundImagePath",  v23));
  -[SUControllerConfig setInstallPhaseOSBackgroundImagePath:](self, "setInstallPhaseOSBackgroundImagePath:", v24);

  id v7 = v35;
  if ((v4 & 0x20) == 0)
  {
LABEL_32:
    if ((v4 & 0x40) == 0) {
      goto LABEL_33;
    }
    goto LABEL_62;
  }

LABEL_61:
  -[SUControllerConfig setRestrictToFullReplacement:]( self,  "setRestrictToFullReplacement:",  -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:]( self,  "_storeBooleanToDefaults:toValue:isStoredInverted:",  @"SURestrictToFullReplacement",  [v7 restrictToFullReplacement],  0));
  id v7 = v35;
  if ((v4 & 0x40) == 0)
  {
LABEL_33:
    if ((v4 & 0x4000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_63;
  }

  id v38 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"|activityPeriod:%d",  -[SUControllerConfig autoActivityCheckPeriod](self, "autoActivityCheckPeriod"));
  unsigned int v39 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v38));

  uint64_t v5 = (__CFString *)v39;
  if ((v3 & 0x2000) != 0)
  {
LABEL_18:
    id v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"|forceMaxWait:%d",  -[SUControllerConfig autoInstallForceMaxWait](self, "autoInstallForceMaxWait"));
    id v14 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v13));

    uint64_t v5 = (__CFString *)v14;
  }

LABEL_62:
  -[SUControllerConfig setAllowSameVersionUpdates:]( self,  "setAllowSameVersionUpdates:",  -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:]( self,  "_storeBooleanToDefaults:toValue:isStoredInverted:",  @"SUAllowSameVersionUpdates",  [v7 allowSameVersionUpdates],  0));
  id v7 = v35;
  if ((v4 & 0x4000000) == 0)
  {
LABEL_34:
    if ((v4 & 0x20000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_64;
  }

LABEL_63:
  __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v7 updateMetricContext]);
  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( -[SUControllerConfig _storeStringToDefaults:toValue:]( self,  "_storeStringToDefaults:toValue:",  @"SUUpdateMetricContext",  v25));
  -[SUControllerConfig setUpdateMetricContext:](self, "setUpdateMetricContext:", v26);

  id v7 = v35;
  if ((v4 & 0x20000) == 0)
  {
LABEL_35:
    if ((v4 & 0x40000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_65;
  }

LABEL_64:
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v7 prerequisiteBuildVersion]);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( -[SUControllerConfig _storeStringToDefaults:toValue:]( self,  "_storeStringToDefaults:toValue:",  @"SUPrerequisiteBuildVersion",  v27));
  -[SUControllerConfig setPrerequisiteBuildVersion:](self, "setPrerequisiteBuildVersion:", v28);

  id v7 = v35;
  if ((v4 & 0x40000) == 0)
  {
LABEL_36:
    if ((v4 & 0x80000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_66;
  }

LABEL_65:
  BOOL v29 = (void *)objc_claimAutoreleasedReturnValue([v7 prerequisiteProductVersion]);
  BOOL v30 = (void *)objc_claimAutoreleasedReturnValue( -[SUControllerConfig _storeStringToDefaults:toValue:]( self,  "_storeStringToDefaults:toValue:",  @"SUPrerequisiteProductVersion",  v29));
  -[SUControllerConfig setPrerequisiteProductVersion:](self, "setPrerequisiteProductVersion:", v30);

  id v7 = v35;
  if ((v4 & 0x80000) == 0)
  {
LABEL_37:
    if ((v4 & 0x200000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_67;
  }

LABEL_66:
  v31 = (void *)objc_claimAutoreleasedReturnValue([v7 asReleaseType]);
  unsigned __int8 v32 = (void *)objc_claimAutoreleasedReturnValue( -[SUControllerConfig _storeStringToDefaults:toValue:]( self,  "_storeStringToDefaults:toValue:",  @"SUAsReleaseType",  v31));
  -[SUControllerConfig setAsReleaseType:](self, "setAsReleaseType:", v32);

  id v7 = v35;
  if ((v4 & 0x200000) == 0)
  {
LABEL_38:
    if ((v4 & 0x800) == 0) {
      goto LABEL_39;
    }
    goto LABEL_68;
  }

LABEL_67:
  id v33 = (void *)objc_claimAutoreleasedReturnValue([v7 simulatorCommandsFile]);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( -[SUControllerConfig _storeStringToDefaults:toValue:]( self,  "_storeStringToDefaults:toValue:",  @"SUSimulatorCommandsFile",  v33));
  -[SUControllerConfig setSimulatorCommandsFile:](self, "setSimulatorCommandsFile:", v34);

  id v7 = v35;
  if ((v4 & 0x800) == 0)
  {
LABEL_39:
    if ((v4 & 0x100000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_69;
  }

LABEL_68:
  -[SUControllerConfig setUseSpecifiedInstallWindow:]( self,  "setUseSpecifiedInstallWindow:",  -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:]( self,  "_storeBooleanToDefaults:toValue:isStoredInverted:",  @"SUUseSpecifiedInstallWindow",  [v7 useSpecifiedInstallWindow],  0));
  id v7 = v35;
  if ((v4 & 0x100000) == 0)
  {
LABEL_40:
    if ((v4 & 0x1000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_70;
  }

LABEL_69:
  -[SUControllerConfig setExpiredSpecifiedAsExpired:]( self,  "setExpiredSpecifiedAsExpired:",  -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:]( self,  "_storeBooleanToDefaults:toValue:isStoredInverted:",  @"SUExpiredSpecifiedAsExpired",  [v7 expiredSpecifiedAsExpired],  0));
  id v7 = v35;
  if ((v4 & 0x1000) == 0)
  {
LABEL_41:
    if ((v4 & 0x2000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_71;
  }

LABEL_70:
  -[SUControllerConfig setHideIndicationMayReboot:]( self,  "setHideIndicationMayReboot:",  -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:]( self,  "_storeBooleanToDefaults:toValue:isStoredInverted:",  @"SUHideIndicationMayReboot",  [v7 hideIndicationMayReboot],  0));
  id v7 = v35;
  if ((v4 & 0x2000000) == 0)
  {
LABEL_42:
    if ((v4 & 0x4000) == 0) {
      goto LABEL_43;
    }
LABEL_72:
    -[SUControllerConfig setRequirePrepareSize:]( self,  "setRequirePrepareSize:",  -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:]( self,  "_storeBooleanToDefaults:toValue:isStoredInverted:",  @"SURequirePrepareSize",  [v7 requirePrepareSize],  0));
    id v7 = v35;
    if ((v4 & 0x8000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }

LABEL_71:
  -[SUControllerConfig setInternalDefaultsAsExternal:]( self,  "setInternalDefaultsAsExternal:",  -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:]( self,  "_storeBooleanToDefaults:toValue:isStoredInverted:",  @"SUInternalDefaultsAsExternal",  [v7 internalDefaultsAsExternal],  0));
  id v7 = v35;
  if ((v4 & 0x4000) != 0) {
    goto LABEL_72;
  }
LABEL_43:
  if ((v4 & 0x8000) != 0)
  {
LABEL_44:
    -[SUControllerConfig setInstallWindowAsDeltas:]( self,  "setInstallWindowAsDeltas:",  -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:]( self,  "_storeBooleanToDefaults:toValue:isStoredInverted:",  @"SUInstallWindowAsDeltas",  [v7 installWindowAsDeltas],  0));
    id v7 = v35;
  }

  __int128 v48 = objc_alloc(&OBJC_CLASS___NSString);
  if (-[SUControllerConfig supervisedMDM](self, "supervisedMDM")) {
    __int128 v49 = @"Y";
  }
  else {
    __int128 v49 = @"N";
  }
  __int128 v50 = -[NSString initWithFormat:](v48, "initWithFormat:", @"|supervisedMDM:%@", v49);
  __int128 v51 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v50));

  uint64_t v5 = (__CFString *)v51;
  if ((v3 & 0x20000000) == 0)
  {
LABEL_27:
    if ((v3 & 0x40000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_81;
  }

LABEL_45:
}

LABEL_19:
  if ((v3 & 0x180) != 0)
  {
    id v15 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"|windowBegin:%02d:%02d",  -[SUControllerConfig autoInstallWindowBeginHour](self, "autoInstallWindowBeginHour"),  -[SUControllerConfig autoInstallWindowBeginMinute](self, "autoInstallWindowBeginMinute"));
    id v16 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v15));

    uint64_t v5 = (__CFString *)v16;
  }

  if ((v3 & 0x600) != 0)
  {
    uint64_t v17 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"|windowEnd:%02d:%02d",  -[SUControllerConfig autoInstallWindowEndHour](self, "autoInstallWindowEndHour"),  -[SUControllerConfig autoInstallWindowEndMinute](self, "autoInstallWindowEndMinute"));
    id v18 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v17));

    uint64_t v5 = (__CFString *)v18;
  }

  if ((v3 & 0x400000) != 0)
  {
    v40 = objc_alloc(&OBJC_CLASS___NSString);
    if (-[SUControllerConfig downloadDocAsset](self, "downloadDocAsset")) {
      v41 = @"Y";
    }
    else {
      v41 = @"N";
    }
    v42 = -[NSString initWithFormat:](v40, "initWithFormat:", @"|downloadDoc:%@", v41);
    uint64_t v43 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v42));

    uint64_t v5 = (__CFString *)v43;
    if ((v3 & 0x800000) == 0)
    {
LABEL_25:
      if ((v3 & 0x10000000) == 0) {
        goto LABEL_26;
      }
      goto LABEL_71;
    }
  }

  else if ((v3 & 0x800000) == 0)
  {
    goto LABEL_25;
  }

  id v44 = objc_alloc(&OBJC_CLASS___NSString);
  if (-[SUControllerConfig ignoreRamping](self, "ignoreRamping")) {
    int v45 = @"Y";
  }
  else {
    int v45 = @"N";
  }
  uint64_t v46 = -[NSString initWithFormat:](v44, "initWithFormat:", @"|ignoreRamping:%@", v45);
  id v47 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v46));

  uint64_t v5 = (__CFString *)v47;
  if ((v3 & 0x10000000) == 0)
  {
LABEL_26:
    if ((v3 & 0x20000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_75;
  }

LABEL_75:
  v52 = objc_alloc(&OBJC_CLASS___NSString);
  __int16 v53 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig requestedPMV](self, "requestedPMV"));
  if (v53) {
    v54 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig requestedPMV](self, "requestedPMV"));
  }
  else {
    v54 = @"!";
  }
  __int16 v55 = -[NSString initWithFormat:](v52, "initWithFormat:", @"|requestedPMV:%@", v54);
  __int16 v56 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v55));

  if (v53) {
  uint64_t v5 = (__CFString *)v56;
  }
  if ((v3 & 0x40000000) == 0)
  {
LABEL_28:
    if ((v3 & 0x80000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_82;
  }

LABEL_81:
  __int16 v57 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"|delayPeriod:%d",  -[SUControllerConfig delayPeriod](self, "delayPeriod"));
  unsigned __int8 v58 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v57));

  uint64_t v5 = (__CFString *)v58;
  if ((v3 & 0x80000000) == 0)
  {
LABEL_29:
    if ((v3 & 0x20) == 0) {
      goto LABEL_30;
    }
    goto LABEL_88;
  }

LABEL_82:
  __int16 v59 = objc_alloc(&OBJC_CLASS___NSString);
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig installPhaseOSBackgroundImagePath](self, "installPhaseOSBackgroundImagePath"));
  if (v60) {
    v61 = (__CFString *)objc_claimAutoreleasedReturnValue( -[SUControllerConfig installPhaseOSBackgroundImagePath]( self,  "installPhaseOSBackgroundImagePath"));
  }
  else {
    v61 = @"!";
  }
  v62 = -[NSString initWithFormat:](v59, "initWithFormat:", @"|installPhaseOSBgImgPath:%@", v61);
  v63 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v62));

  if (v60) {
  uint64_t v5 = (__CFString *)v63;
  }
  if ((v3 & 0x20) == 0)
  {
LABEL_30:
    if ((v3 & 0x40) == 0) {
      goto LABEL_31;
    }
    goto LABEL_92;
  }

LABEL_88:
  v64 = objc_alloc(&OBJC_CLASS___NSString);
  if (-[SUControllerConfig restrictToFullReplacement](self, "restrictToFullReplacement")) {
    v65 = @"Y";
  }
  else {
    v65 = @"N";
  }
  v66 = -[NSString initWithFormat:](v64, "initWithFormat:", @"|restrictToFull:%@", v65);
  v67 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v66));

  uint64_t v5 = (__CFString *)v67;
  if ((v3 & 0x40) == 0)
  {
LABEL_31:
    if ((v3 & 0x4000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_96;
  }

LABEL_92:
  v68 = objc_alloc(&OBJC_CLASS___NSString);
  if (-[SUControllerConfig allowSameVersionUpdates](self, "allowSameVersionUpdates")) {
    v69 = @"Y";
  }
  else {
    v69 = @"N";
  }
  v70 = -[NSString initWithFormat:](v68, "initWithFormat:", @"|allowSame:%@", v69);
  v71 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v70));

  uint64_t v5 = (__CFString *)v71;
  if ((v3 & 0x4000000) == 0)
  {
LABEL_32:
    if ((v3 & 0x20000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_102;
  }

LABEL_96:
  v72 = objc_alloc(&OBJC_CLASS___NSString);
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig updateMetricContext](self, "updateMetricContext"));
  if (v73) {
    v74 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig updateMetricContext](self, "updateMetricContext"));
  }
  else {
    v74 = @"!";
  }
  v75 = -[NSString initWithFormat:](v72, "initWithFormat:", @"|context:%@", v74);
  v76 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v75));

  if (v73) {
  uint64_t v5 = (__CFString *)v76;
  }
  if ((v3 & 0x20000) == 0)
  {
LABEL_33:
    if ((v3 & 0x40000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_108;
  }

LABEL_102:
  v77 = objc_alloc(&OBJC_CLASS___NSString);
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig prerequisiteBuildVersion](self, "prerequisiteBuildVersion"));
  if (v78) {
    v79 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig prerequisiteBuildVersion](self, "prerequisiteBuildVersion"));
  }
  else {
    v79 = @"!";
  }
  v80 = -[NSString initWithFormat:](v77, "initWithFormat:", @"|asBuild:%@", v79);
  v81 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v80));

  if (v78) {
  uint64_t v5 = (__CFString *)v81;
  }
  if ((v3 & 0x40000) == 0)
  {
LABEL_34:
    if ((v3 & 0x80000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_114;
  }

LABEL_108:
  v82 = objc_alloc(&OBJC_CLASS___NSString);
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig prerequisiteProductVersion](self, "prerequisiteProductVersion"));
  if (v83) {
    v84 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig prerequisiteProductVersion](self, "prerequisiteProductVersion"));
  }
  else {
    v84 = @"!";
  }
  v85 = -[NSString initWithFormat:](v82, "initWithFormat:", @"|asProduct:%@", v84);
  v86 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v85));

  if (v83) {
  uint64_t v5 = (__CFString *)v86;
  }
  if ((v3 & 0x80000) == 0)
  {
LABEL_35:
    if ((v3 & 0x200000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_120;
  }

LABEL_114:
  v87 = objc_alloc(&OBJC_CLASS___NSString);
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig asReleaseType](self, "asReleaseType"));
  if (v88) {
    v89 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig asReleaseType](self, "asReleaseType"));
  }
  else {
    v89 = @"!";
  }
  v90 = -[NSString initWithFormat:](v87, "initWithFormat:", @"|asRelease:%@", v89);
  v91 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v90));

  if (v88) {
  uint64_t v5 = (__CFString *)v91;
  }
  if ((v3 & 0x200000) == 0)
  {
LABEL_36:
    if ((v3 & 0x800) == 0) {
      goto LABEL_37;
    }
    goto LABEL_126;
  }

LABEL_120:
  v92 = objc_alloc(&OBJC_CLASS___NSString);
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig simulatorCommandsFile](self, "simulatorCommandsFile"));
  if (v93) {
    v94 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SUControllerConfig simulatorCommandsFile](self, "simulatorCommandsFile"));
  }
  else {
    v94 = @"!";
  }
  v95 = -[NSString initWithFormat:](v92, "initWithFormat:", @"|simFile:%@", v94);
  v96 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v95));

  if (v93) {
  uint64_t v5 = (__CFString *)v96;
  }
  if ((v3 & 0x800) == 0)
  {
LABEL_37:
    if ((v3 & 0x100000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_130;
  }

LABEL_126:
  v97 = objc_alloc(&OBJC_CLASS___NSString);
  if (-[SUControllerConfig useSpecifiedInstallWindow](self, "useSpecifiedInstallWindow")) {
    v98 = @"Y";
  }
  else {
    v98 = @"N";
  }
  v99 = -[NSString initWithFormat:](v97, "initWithFormat:", @"|useInstallWindow:%@", v98);
  v100 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v99));

  uint64_t v5 = (__CFString *)v100;
  if ((v3 & 0x100000) == 0)
  {
LABEL_38:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_134;
  }

LABEL_130:
  v101 = objc_alloc(&OBJC_CLASS___NSString);
  if (-[SUControllerConfig expiredSpecifiedAsExpired](self, "expiredSpecifiedAsExpired")) {
    v102 = @"Y";
  }
  else {
    v102 = @"N";
  }
  v103 = -[NSString initWithFormat:](v101, "initWithFormat:", @"|expiredAsExpired:%@", v102);
  v104 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v103));

  uint64_t v5 = (__CFString *)v104;
  if ((v3 & 0x1000) == 0)
  {
LABEL_39:
    if ((v3 & 0x2000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_138;
  }

LABEL_134:
  v105 = objc_alloc(&OBJC_CLASS___NSString);
  if (-[SUControllerConfig hideIndicationMayReboot](self, "hideIndicationMayReboot")) {
    v106 = @"Y";
  }
  else {
    v106 = @"N";
  }
  v107 = -[NSString initWithFormat:](v105, "initWithFormat:", @"|hideMayReboot:%@", v106);
  v108 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v107));

  uint64_t v5 = (__CFString *)v108;
  if ((v3 & 0x2000000) == 0)
  {
LABEL_40:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_41;
    }
LABEL_142:
    v113 = objc_alloc(&OBJC_CLASS___NSString);
    if (-[SUControllerConfig requirePrepareSize](self, "requirePrepareSize")) {
      v114 = @"Y";
    }
    else {
      v114 = @"N";
    }
    v115 = -[NSString initWithFormat:](v113, "initWithFormat:", @"|requirePrepSize:%@", v114);
    v116 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v115));

    uint64_t v5 = (__CFString *)v116;
    if ((v3 & 0x8000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_42;
  }

LABEL_138:
  v109 = objc_alloc(&OBJC_CLASS___NSString);
  else {
    v110 = @"N";
  }
  v111 = -[NSString initWithFormat:](v109, "initWithFormat:", @"|asExternal:%@", v110);
  v112 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v111));

  uint64_t v5 = (__CFString *)v112;
  if ((v3 & 0x4000) != 0) {
    goto LABEL_142;
  }
LABEL_41:
  if ((v3 & 0x8000) != 0)
  {
LABEL_42:
    id v19 = objc_alloc(&OBJC_CLASS___NSString);
    if (-[SUControllerConfig installWindowAsDeltas](self, "installWindowAsDeltas")) {
      int v20 = @"Y";
    }
    else {
      int v20 = @"N";
    }
    id v21 = -[NSString initWithFormat:](v19, "initWithFormat:", @"|windowDeltas:%@", v20);
    __int16 v22 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v21));

    uint64_t v5 = (__CFString *)v22;
  }

void sub_10003C020(id a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  [v1 logAtLevel:1 label:"+[SUControllerManagerServer sharedManager]_block_invoke" format:@"[SHARED_MANAGER] init"];

  unsigned int v2 = -[SUControllerManagerServer initWithPersistencePath:]( objc_alloc(&OBJC_CLASS___SUControllerManagerServer),  "initWithPersistencePath:",  @"/var/mobile/Library/SoftwareUpdate/SUController.plist");
  unint64_t v3 = (void *)qword_100079680;
  qword_100079680 = (uint64_t)v2;

  unint64_t v4 = objc_alloc(&OBJC_CLASS___SUAutoInstallManager);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100079680 config]);
  id v12 = -[SUAutoInstallManager initWithConfig:](v4, "initWithConfig:", v5);

  [(id)qword_100079680 setAutoInstallManager:v12];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerAdmissionController sharedController]( &OBJC_CLASS___SUControllerAdmissionController,  "sharedController"));
  [(id)qword_100079680 setAdmissionController:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerTransactionManager sharedManager]( &OBJC_CLASS___SUControllerTransactionManager,  "sharedManager"));
  [v7 setPathState:@"/var/mobile/Library/SoftwareUpdate/SUController.state"];

  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___SUControllerAttachedClients);
  [(id)qword_100079680 setAttachedClients:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100079680 attachedClients]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100079680 config]);
  id v11 =  +[SUControllerCore initWithAttachedClients:withConfig:withAutoInstallManager:]( &OBJC_CLASS___SUControllerCore,  "initWithAttachedClients:withConfig:withAutoInstallManager:",  v9,  v10,  v12);
}

uint64_t sub_10003C540(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

void sub_10003CA58(uint64_t a1)
{
  unsigned int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v2 config]);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
  [v2 _trackStateEvent:4, 0, @"modify config (mask=0x%llX) to:%@", v3, v4 withError forReason];
}

void sub_10003CE54(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = objc_autoreleasePoolPush();
  [*(id *)(a1 + 32) _activityTrigger:v4];
  objc_autoreleasePoolPop(v3);
}

id sub_10003D5A4(uint64_t a1)
{
  return [*(id *)(a1 + 40) endTransaction:@"AutoUpdateActivityTask"];
}

void sub_10003D7A8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003D7D8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003D808( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003D838(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "[POLICY_ENGINE] failed to initialize policy FSM",  v1,  2u);
}

void sub_10003D878(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 updateInfoLogString]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 updateUUIDLogString]);
  int v8 = 138543874;
  id v9 = v6;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2114;
  uint64_t v13 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%{public}@%{public}@%{public}@",  (uint8_t *)&v8,  0x20u);
}

void sub_10003D944( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003D9A8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003DA0C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003DA70(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  sub_1000232E8();
  sub_1000232C8( (void *)&_mh_execute_header,  v2,  v3,  "[SPI] {managerStatus} %{public}@: non-exclusive no canned reply",  v4,  v5,  v6,  v7,  v8);

  sub_1000232DC();
}

void sub_10003DAE8(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  sub_1000232E8();
  sub_1000232C8( (void *)&_mh_execute_header,  v2,  v3,  "[SPI] {managerState} %{public}@: non-exclusive no canned reply",  v4,  v5,  v6,  v7,  v8);

  sub_1000232DC();
}

void sub_10003DB60(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  sub_1000232E8();
  sub_1000232C8( (void *)&_mh_execute_header,  v2,  v3,  "[SPI] {managerConfig} %{public}@: non-exclusive no canned reply",  v4,  v5,  v6,  v7,  v8);

  sub_1000232DC();
}

void sub_10003DBD8(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  sub_1000232E8();
  sub_1000232C8( (void *)&_mh_execute_header,  v2,  v3,  "[SPI] {modifyConfig} %{public}@: non-exclusive no canned reply",  v4,  v5,  v6,  v7,  v8);

  sub_1000232DC();
}

void sub_10003DC50(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  sub_1000232E8();
  sub_1000232C8( (void *)&_mh_execute_header,  v2,  v3,  "[SPI] {purgeUpdate} %{public}@: non-exclusive no canned reply",  v4,  v5,  v6,  v7,  v8);

  sub_1000232DC();
}

void sub_10003DCC8(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  sub_1000232E8();
  sub_1000232C8( (void *)&_mh_execute_header,  v2,  v3,  "[SPI] {useCredentials} %{public}@: not supported when using SUCore",  v4,  v5,  v6,  v7,  v8);

  sub_1000232DC();
}

void sub_10003DD40(void *a1)
{
}

void sub_10003DDB8(uint64_t a1)
{
  uint64_t v1 = (void *)sub_1000232F4(a1);
  uint64_t v3 = sub_100022F8C(v1, v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_1000232E8();
  sub_1000232C8((void *)&_mh_execute_header, v5, v6, "%{public}@ [NOT HANDLED]", v7, v8, v9, v10, v11);

  sub_1000232DC();
}

void sub_10003DE30(uint64_t a1)
{
  uint64_t v1 = (void *)sub_1000232F4(a1);
  uint64_t v3 = sub_100022F8C(v1, v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_1000232E8();
  sub_1000232C8( (void *)&_mh_execute_header,  v5,  v6,  "%{public}@ no policy client for peer connection",  v7,  v8,  v9,  v10,  v11);

  sub_1000232DC();
}

void sub_10003DEA8(uint64_t a1)
{
  uint64_t v1 = (void *)sub_1000232F4(a1);
  uint64_t v3 = sub_100022F8C(v1, v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_1000232E8();
  sub_1000232C8( (void *)&_mh_execute_header,  v5,  v6,  "%{public}@ requesting communal upon disconnect without exclusive control - communal upon disconnect ignored",  v7,  v8,  v9,  v10,  v11);

  sub_1000232DC();
}

void sub_10003DF20(uint64_t a1)
{
  uint64_t v1 = (void *)sub_1000232F4(a1);
  uint64_t v3 = sub_100022F8C(v1, v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_1000232E8();
  sub_1000232C8( (void *)&_mh_execute_header,  v5,  v6,  "%{public}@ requesting communal upon disconnect when not supported by build type - communal upon disconnect ignored",  v7,  v8,  v9,  v10,  v11);

  sub_1000232DC();
}

void sub_10003DF98(uint64_t a1)
{
  uint64_t v1 = (void *)sub_1000232F4(a1);
  uint64_t v3 = sub_100022F8C(v1, v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_1000232E8();
  sub_1000232C8( (void *)&_mh_execute_header,  v5,  v6,  "%{public}@ requesting exclusive control when not supported by build type - exclusive ignored",  v7,  v8,  v9,  v10,  v11);

  sub_1000232DC();
}

void sub_10003E010(void **a1, void *a2)
{
  uint64_t v2 = sub_100022F8C(*a1, a2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_1000232E8();
  sub_1000232C8((void *)&_mh_execute_header, v4, v5, "%{public}@ [NOT ENTITLED]", v6, v7, v8, v9, v10);

  sub_1000232DC();
}

void sub_10003E08C(void **a1, void *a2)
{
  uint64_t v2 = sub_100022F8C(*a1, a2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_1000232E8();
  sub_1000232C8((void *)&_mh_execute_header, v4, v5, "%{public}@ [UNKNOWN TYPE]", v6, v7, v8, v9, v10);

  sub_1000232DC();
}

void sub_10003E108(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "[EVENT_REPORT(preflightOptions)] failed to setup preflight options",  v1,  2u);
}

void sub_10003E148(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "[EVENT_REPORT(%{public}@)] failed to allocate event so not reported",  (uint8_t *)&v2,  0xCu);
}

void sub_10003E1BC(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 scanName]);
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_10003E268(void *a1, uint64_t a2, os_log_s *a3)
{
  int v6 = (void *)objc_claimAutoreleasedReturnValue([a1 scanName]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 scanUUID]);
  int v8 = 138543874;
  uint64_t v9 = v6;
  __int16 v10 = 2114;
  uint8_t v11 = v7;
  __int16 v12 = 2114;
  uint64_t v13 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%{public}@[%{public}@] %{public}@",  (uint8_t *)&v8,  0x20u);
}

void sub_10003E334(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "[ATTACHED_CLIENTS] remove inactive client connection (%{public}@)",  (uint8_t *)&v3,  0xCu);
}

void sub_10003E3AC(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  uint64_t v6 = *(void *)(a2 + 48);
  int v7 = 138543618;
  int v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "[ATTACHED_CLIENTS(communal)] %{public}@: removed exclusive client (%{public}@)",  (uint8_t *)&v7,  0x16u);
}

void sub_10003E45C(uint64_t a1)
{
  id v1 = [(id)sub_100030300(a1) summary];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_1000232E8();
  sub_1000232C8( (void *)&_mh_execute_header,  v3,  v4,  "[SPI] <!< %{public}@ {managerStatus} failed to create reply",  v5,  v6,  v7,  v8,  v9);

  sub_1000232DC();
}

void sub_10003E4D4()
{
  id v1 = [(id)sub_100030300(v0) summary];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v4 = sub_10003030C(&OBJC_CLASS___SUControllerSUCore, v3);
  sub_1000302D8();
  sub_1000302C4( (void *)&_mh_execute_header,  v5,  v6,  "[SPI] <<< %{public}@ {managerStatus} error:%{public}@",  v7,  v8,  v9,  v10,  v11);

  sub_1000302F0();
}

void sub_10003E564(uint64_t a1)
{
  id v1 = [(id)sub_100030300(a1) summary];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_1000232E8();
  sub_1000232C8( (void *)&_mh_execute_header,  v3,  v4,  "[SPI] <!< %{public}@ {managerState} failed to create reply",  v5,  v6,  v7,  v8,  v9);

  sub_1000232DC();
}

void sub_10003E5DC()
{
  id v1 = [(id)sub_100030300(v0) summary];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v4 = sub_10003030C(&OBJC_CLASS___SUControllerSUCore, v3);
  sub_1000302D8();
  sub_1000302C4( (void *)&_mh_execute_header,  v5,  v6,  "[SPI] <<< %{public}@ {managerState} error:%{public}@",  v7,  v8,  v9,  v10,  v11);

  sub_1000302F0();
}

void sub_10003E66C(uint64_t a1)
{
  id v1 = [(id)sub_100030300(a1) summary];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_1000232E8();
  sub_1000232C8( (void *)&_mh_execute_header,  v3,  v4,  "[SPI] <!< %{public}@ {managerConfig} failed to create reply",  v5,  v6,  v7,  v8,  v9);

  sub_1000232DC();
}

void sub_10003E6E4(uint64_t a1)
{
  id v1 = [(id)sub_100030300(a1) summary];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_1000232E8();
  sub_1000232C8( (void *)&_mh_execute_header,  v3,  v4,  "[SPI] <<< %{public}@ {managerConfig} unable to query configuration",  v5,  v6,  v7,  v8,  v9);

  sub_1000232DC();
}

void sub_10003E75C()
{
  id v1 = [(id)sub_100030300(v0) summary];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v4 = sub_10003030C(&OBJC_CLASS___SUControllerSUCore, v3);
  sub_1000302D8();
  sub_1000302C4( (void *)&_mh_execute_header,  v5,  v6,  "[SPI] <<< %{public}@ {managerConfig} error:%{public}@",  v7,  v8,  v9,  v10,  v11);

  sub_1000302F0();
}

void sub_10003E7EC(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  sub_1000232E8();
  sub_1000232C8( (void *)&_mh_execute_header,  v2,  v3,  "[SPI] <!< %{public}@ {modifyConfig} (missing config) failed to create reply",  v4,  v5,  v6,  v7,  v8);

  sub_1000232DC();
}

void sub_10003E864(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  sub_1000232E8();
  sub_1000232C8( (void *)&_mh_execute_header,  v2,  v3,  "[SPI] <<< %{public}@ {modifyConfig} (missing config)",  v4,  v5,  v6,  v7,  v8);

  sub_1000232DC();
}

void sub_10003E8DC(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  sub_1000232E8();
  sub_1000232C8( (void *)&_mh_execute_header,  v2,  v3,  "[SPI] >>> %{public}@ {modifyConfig} (missing config)",  v4,  v5,  v6,  v7,  v8);

  sub_1000232DC();
}

void sub_10003E954(uint64_t a1)
{
  id v1 = [(id)sub_100030300(a1) summary];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_1000232E8();
  sub_1000232C8( (void *)&_mh_execute_header,  v3,  v4,  "[SPI] <!< %{public}@ {modifyConfig} failed to create reply",  v5,  v6,  v7,  v8,  v9);

  sub_1000232DC();
}

void sub_10003E9CC(uint64_t a1)
{
  id v1 = [(id)sub_100030300(a1) summary];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_1000232E8();
  sub_1000232C8( (void *)&_mh_execute_header,  v3,  v4,  "[SPI] <<< %{public}@ {modifyConfig} No modified configuration provided",  v5,  v6,  v7,  v8,  v9);

  sub_1000232DC();
}

void sub_10003EA44()
{
  id v1 = [(id)sub_100030300(v0) summary];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v4 = sub_10003030C(&OBJC_CLASS___SUControllerSUCore, v3);
  sub_1000302D8();
  sub_1000302C4( (void *)&_mh_execute_header,  v5,  v6,  "[SPI] <<< %{public}@ {modifyConfig} error:%{public}@",  v7,  v8,  v9,  v10,  v11);

  sub_1000302F0();
}

void sub_10003EAD4(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  sub_1000232E8();
  sub_1000232C8( (void *)&_mh_execute_header,  v2,  v3,  "[SPI] >-> %{public}@ {useSSOTokenToPersonalize} missing SSOToken",  v4,  v5,  v6,  v7,  v8);

  sub_1000232DC();
}

void sub_10003EB4C(uint64_t a1)
{
  id v1 = [(id)sub_100030300(a1) summary];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_1000232E8();
  sub_1000232C8( (void *)&_mh_execute_header,  v3,  v4,  "[SPI] <!< %{public}@ {purgeUpdate} failed to create reply",  v5,  v6,  v7,  v8,  v9);

  sub_1000232DC();
}

void sub_10003EBC4()
{
  id v1 = [(id)sub_100030300(v0) summary];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v4 = sub_10003030C(&OBJC_CLASS___SUControllerSUCore, v3);
  sub_1000302D8();
  sub_1000302C4( (void *)&_mh_execute_header,  v5,  v6,  "[SPI] <<< %{public}@ {purgeUpdate} error:%{public}@",  v7,  v8,  v9,  v10,  v11);

  sub_1000302F0();
}

void sub_10003EC54(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "[DESCRIPTOR_FROM_CORE] SUCore descriptor is missing documentation information",  v1,  2u);
}

void sub_10003EC94(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136446466;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%{public}s: %{public}@",  (uint8_t *)&v3,  0x16u);
}

id objc_msgSend__describeAndReportEvent_withControllerConfig_withControllerStatus_forSessionUUID_fromCurrentState_targetingUpdateState_activeDescriptor_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_describeAndReportEvent:withControllerConfig:withControllerStatus:forSessionUUID:fromCurrentState:targetingUp dateState:activeDescriptor:");
}

id objc_msgSend__loadIntegerFromDefaults_releaseType_externalDefault_internalDefault_withLimit_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadIntegerFromDefaults:releaseType:externalDefault:internalDefault:withLimit:");
}

id objc_msgSend_acceptPreservedState_loadedPrimaryDescriptor_loadedSecondaryDescriptor_adoptingLoadedState_updateIsPrepared_targetingApplied_updateIsApplied_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "acceptPreservedState:loadedPrimaryDescriptor:loadedSecondaryDescriptor:adoptingLoadedState:updateIsPrepared:t argetingApplied:updateIsApplied:");
}

id objc_msgSend_collectDocumentationMetadataWithPolicy_descriptor_downloadDocumentation_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectDocumentationMetadataWithPolicy:descriptor:downloadDocumentation:completion:");
}

id objc_msgSend_initWithClientName_forConnection_withExclusiveControl_communalUponDisconnect_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithClientName:forConnection:withExclusiveControl:communalUponDisconnect:");
}

id objc_msgSend_initWithDocumentationBundleURL_serverAssetURL_serverAssetMeasurement_serverAssetAlgorithm_serverAssetChunkSize_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithDocumentationBundleURL:serverAssetURL:serverAssetMeasurement:serverAssetAlgorithm:serverAssetChunkSize:");
}

id objc_msgSend_initWithParamType_withScanOptions_withScanPolicy_withBaseScanUUID_withRampingForeground_withPrimaryDescriptor_withSecondaryDescriptor_withSSOToken_withError_withPurgeCompletion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithParamType:withScanOptions:withScanPolicy:withBaseScanUUID:withRampingForeground:withPrimaryDescriptor :withSecondaryDescriptor:withSSOToken:withError:withPurgeCompletion:");
}

id objc_msgSend_initWithParamType_withSuccessfulOTA_withTetheredRestore_withFailedForward_withFailedBackward_withBrainAssetID_withSUAssetID_isPrepared_isApplied_hasAcceptedTerms_withDocAssetIDs_withSUAssetIDs_withScanPolicy_withScanUUID_withRampingForeground_withPrimaryDescriptor_withSecondaryDescriptor_withVerifyDescriptor_withDifferentPrimary_withDifferentSecondary_withActiveDescriptor_withSSOToken_withScanOptions_withProgress_withApplyInvokedBy_reachingPolicyState_withError_withPurgeCompletion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID :withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUU ID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrim ary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy: reachingPolicyState:withError:withPurgeCompletion:");
}

id objc_msgSend_initWithScanPolicy_scanUUID_rampingForeground_primaryDescriptor_secondaryDescriptor_hasAcceptedTerms_withSSOToken_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithScanPolicy:scanUUID:rampingForeground:primaryDescriptor:secondaryDescriptor:hasAcceptedTerms:withSSOToken:");
}

id objc_msgSend_initWithScanPolicy_scanUUID_rampingForeground_primaryDescriptor_secondaryDescriptor_scanOptions_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithScanPolicy:scanUUID:rampingForeground:primaryDescriptor:secondaryDescriptor:scanOptions:");
}

id objc_msgSend_initWithSoftwareUpdateAssetType_documentationAssetType_usingPolicies_usingExtensions_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:");
}

id objc_msgSend_notifyScanPostponedForReason_locatedPrimaryDescriptor_locatedSecondaryDescrtiptor_scanPolicy_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "notifyScanPostponedForReason:locatedPrimaryDescriptor:locatedSecondaryDescrtiptor:scanPolicy:");
}

id objc_msgSend_notifyUpdateFoundUsingPolicy_locatedPrimaryDescriptor_locatedSecondaryDescrtiptor_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyUpdateFoundUsingPolicy:locatedPrimaryDescriptor:locatedSecondaryDescrtiptor:");
}

id objc_msgSend_reportAbandonedEvent_withControllerConfig_forSessionUUID_fromCurrentState_targetingUpdateState_abandonedDescriptor_dueToError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "reportAbandonedEvent:withControllerConfig:forSessionUUID:fromCurrentState:targetingUpdateState:abandonedDescr iptor:dueToError:");
}

id objc_msgSend_reportAvailableEvent_withControllerConfig_forSessionUUID_fromCurrentState_targetingUpdateState_availableDescriptor_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "reportAvailableEvent:withControllerConfig:forSessionUUID:fromCurrentState:targetingUpdateState:availableDescriptor:");
}

id objc_msgSend_reportDownloadedEvent_withControllerConfig_forSessionUUID_fromCurrentState_targetingUpdateState_downloadedDescriptor_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "reportDownloadedEvent:withControllerConfig:forSessionUUID:fromCurrentState:targetingUpdateState:downloadedDescriptor:");
}

id objc_msgSend_reportPostponedEvent_withControllerConfig_forSessionUUID_fromCurrentState_targetingUpdateState_postponedDescriptor_dueToError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "reportPostponedEvent:withControllerConfig:forSessionUUID:fromCurrentState:targetingUpdateState:postponedDescr iptor:dueToError:");
}

id objc_msgSend_scanFoundPostponedUpdate_controllerStatus_scanUUID_rampingForeground_primaryDescriptor_secondaryDescriptor_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "scanFoundPostponedUpdate:controllerStatus:scanUUID:rampingForeground:primaryDescriptor:secondaryDescriptor:error:");
}

id objc_msgSend_scanFoundUpdate_scanUUID_rampingForeground_primaryDescriptor_secondaryDescriptor_scanOptions_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "scanFoundUpdate:scanUUID:rampingForeground:primaryDescriptor:secondaryDescriptor:scanOptions:");
}

id objc_msgSend_scanFoundUpdateImmediateAttempt_scanUUID_rampingForeground_primaryDescriptor_secondaryDescriptor_withSSOToken_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "scanFoundUpdateImmediateAttempt:scanUUID:rampingForeground:primaryDescriptor:secondaryDescriptor:withSSOToken:");
}

id objc_msgSend_scheduleAutoInstallTaskAtDate_jobName_windowName_needsNetwork_needsPower_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleAutoInstallTaskAtDate:jobName:windowName:needsNetwork:needsPower:");
}

id objc_msgSend_updateAbandonedNewerFound_eventInfo_persistingScanState_reportingStatus_withErrorCode_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAbandonedNewerFound:eventInfo:persistingScanState:reportingStatus:withErrorCode:");
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}