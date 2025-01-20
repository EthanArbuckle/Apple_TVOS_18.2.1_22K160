@interface UARPHeySiriModelBase
- (BOOL)offerDynamicAssetToAccessory:(id)a3 tag:(id)a4 error:(id *)a5;
- (BOOL)processDynamicAsset:(id *)a3;
- (UARPAccessory)accessory;
- (UARPHeySiriModelBase)init;
- (UARPHeySiriModelBase)initWithAccessory:(id)a3 controller:(id)a4 url:(id)a5;
- (UARPHeySiriModelBase)initWithAccessory:(id)a3 uarpProtocolVersion:(unint64_t)a4 controller:(id)a5 url:(id)a6;
- (UARPHeySiriModelDelegateProtocol)delegate;
- (id)log;
- (id)superbinary;
- (id)uarpPayloadWithHSModel:(id)a3 tag:(id)a4;
- (id)url;
- (unint64_t)engineType;
- (unint64_t)majorVersion;
- (unint64_t)minorVersion;
- (unint64_t)uarpProtocolVersion;
- (void)addDownloadedModel:(id)a3;
- (void)addPreInstalledModel:(id)a3;
- (void)checkCurrentHeySiriModel;
- (void)checkCurrentJustSiriModelAvailable;
- (void)offerDownloadModel:(id)a3 fallbackModel:(id)a4 tag:(id)a5 assetVersion:(id)a6 error:(id)a7;
- (void)setDelegate:(id)a3;
- (void)setEngineType:(unint64_t)a3;
- (void)setMajorVersion:(unint64_t)a3;
- (void)setMinorVersion:(unint64_t)a3;
- (void)setSuperbinary:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation UARPHeySiriModelBase

- (UARPHeySiriModelBase)init
{
  return 0LL;
}

- (UARPHeySiriModelBase)initWithAccessory:(id)a3 controller:(id)a4 url:(id)a5
{
  return -[UARPHeySiriModelBase initWithAccessory:uarpProtocolVersion:controller:url:]( self,  "initWithAccessory:uarpProtocolVersion:controller:url:",  a3,  3LL,  a4,  a5);
}

- (UARPHeySiriModelBase)initWithAccessory:(id)a3 uarpProtocolVersion:(unint64_t)a4 controller:(id)a5 url:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___UARPHeySiriModelBase;
  v14 = -[UARPHeySiriModelBase init](&v25, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_accessory, a3);
    v15->_uarpProtocolVersion = a4;
    objc_storeStrong((id *)&v15->_controller, a5);
    objc_storeStrong((id *)&v15->_url, a6);
    os_log_t v16 = os_log_create("com.apple.accessoryupdater.uarp", "heySiri");
    log = v15->_log;
    v15->_log = v16;

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.UARP.UARPHeySiriModelBase", 0LL);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    downloadedModels = v15->_downloadedModels;
    v15->_downloadedModels = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    preinstalledModels = v15->_preinstalledModels;
    v15->_preinstalledModels = v22;
  }

  return v15;
}

- (id)log
{
  return self->_log;
}

- (id)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  v4 = (NSURL *)a3;
  obj = self;
  objc_sync_enter(obj);
  url = obj->_url;
  obj->_url = v4;

  objc_sync_exit(obj);
}

- (id)superbinary
{
  return self->_superbinary;
}

- (void)setSuperbinary:(id)a3
{
  v4 = (UARPSuperBinaryAsset *)a3;
  obj = self;
  objc_sync_enter(obj);
  superbinary = obj->_superbinary;
  obj->_superbinary = v4;

  objc_sync_exit(obj);
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (void)setMajorVersion:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_majorVersion = a3;
  objc_sync_exit(obj);
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (void)setMinorVersion:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_minorVersion = a3;
  objc_sync_exit(obj);
}

- (unint64_t)uarpProtocolVersion
{
  return self->_uarpProtocolVersion;
}

- (unint64_t)engineType
{
  return self->_engineType;
}

- (void)setEngineType:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_engineType = a3;
  objc_sync_exit(obj);
}

- (BOOL)processDynamicAsset:(id *)a3
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  v5 = objc_alloc(&OBJC_CLASS___UARPSuperBinaryAsset);
  v42 = self;
  v6 = -[UARPHeySiriModelBase url](self, "url");
  v7 = -[UARPSuperBinaryAsset initWithURL:](v5, "initWithURL:", v6);
  -[UARPHeySiriModelBase setSuperbinary:](self, "setSuperbinary:", v7);
  v8 = -[UARPHeySiriModelBase superbinary](self, "superbinary");
  int v9 = [v8 expandHeadersAndTLVs:a3];

  if (v9)
  {
    char v35 = v9;
    v10 = -[UARPHeySiriModelBase superbinary](v42, "superbinary");
    [v10 tlvs];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  1619725831LL,  v11);
    [v38 valueAsVersion];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPHeySiriModelBase setMajorVersion:](v42, "setMajorVersion:", [v37 majorVersion]);
    -[UARPHeySiriModelBase setMinorVersion:](v42, "setMinorVersion:", [v37 minorVersion]);
    -[UARPHeySiriModelBase superbinary](v42, "superbinary");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 tlvs];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  1619725832LL,  v13);
    [v36 valueAsNumber];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPHeySiriModelBase setEngineType:](v42, "setEngineType:", [v39 unsignedShortValue]);
    log = v42->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v39;
      _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "HSML: process rx asset; Engine Type %@", buf, 0xCu);
    }

    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    v15 = -[UARPHeySiriModelBase superbinary](v42, "superbinary");
    [v15 payloads];
    id obj = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v16 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v16)
    {
      uint64_t v41 = *(void *)v44;
      do
      {
        for (uint64_t i = 0LL; i != v16; ++i)
        {
          if (*(void *)v44 != v41) {
            objc_enumerationMutation(obj);
          }
          dispatch_queue_t v18 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          [v18 tlvs];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  1619725826LL,  v19);
          [v20 valueAsString];
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          [v18 tlvs];
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  1619725825LL,  v22);
          [v23 valueAsString];
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          [v18 tlvs];
          objc_super v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  1619725824LL,  v25);
          [v26 valueAsNumber];
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          int v28 = [v27 shortValue];
          uint64_t v47 = 0LL;
          v48 = &v47;
          uint64_t v49 = 0x2050000000LL;
          v29 = (void *)getCSVoiceTriggerRTModelClass_softClass_0;
          uint64_t v50 = getCSVoiceTriggerRTModelClass_softClass_0;
          if (!getCSVoiceTriggerRTModelClass_softClass_0)
          {
            *(void *)buf = MEMORY[0x1895F87A8];
            *(void *)&buf[8] = 3221225472LL;
            *(void *)&buf[16] = __getCSVoiceTriggerRTModelClass_block_invoke_0;
            v53 = &unk_18A143128;
            v54 = &v47;
            __getCSVoiceTriggerRTModelClass_block_invoke_0((uint64_t)buf);
            v29 = (void *)v48[3];
          }

          v30 = v29;
          _Block_object_dispose(&v47, 8);
          v31 = (void *)[[v30 alloc] initWithHash:v21 locale:v24];
          if (v28 == 1)
          {
            v33 = v42->_log;
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v24;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v21;
              _os_log_impl( &dword_187DC0000,  v33,  OS_LOG_TYPE_INFO,  "HSML: rx pre-installed model locale <%@>, hash <%@>",  buf,  0x16u);
            }

            -[UARPHeySiriModelBase addPreInstalledModel:](v42, "addPreInstalledModel:", v31);
          }

          else if (!(_WORD)v28)
          {
            v32 = v42->_log;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v24;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v21;
              _os_log_impl( &dword_187DC0000,  v32,  OS_LOG_TYPE_INFO,  "HSML: rx downloaded model locale <%@>, hash <%@>",  buf,  0x16u);
            }

            -[UARPHeySiriModelBase addDownloadedModel:](v42, "addDownloadedModel:", v31);
          }
        }

        uint64_t v16 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
      }

      while (v16);
    }

    LOBYTE(v9) = v35;
  }

  return v9;
}

- (void)addDownloadedModel:(id)a3
{
}

- (void)addPreInstalledModel:(id)a3
{
}

- (id)uarpPayloadWithHSModel:(id)a3 tag:(id)a4
{
  v42.wbuf[7] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  v7 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]( objc_alloc(&OBJC_CLASS___UARPAssetVersion),  "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:",  0LL,  0LL,  0LL,  0LL);
  v8 = -[UARPSuperBinaryAssetPayload initWithPayloadTag:assetVersion:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetPayload),  "initWithPayloadTag:assetVersion:",  v6,  v7);

  [v5 modelLocale];
  int v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV);
    [v5 modelLocale];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = -[UARPSuperBinaryAssetTLV initWithType:stringValue:](v10, "initWithType:stringValue:", 1619725825LL, v11);

    -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v8, "addMetaDataTLV:", v12);
  }

  [v5 modelHash];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV);
    [v5 modelHash];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = -[UARPSuperBinaryAssetTLV initWithType:stringValue:](v14, "initWithType:stringValue:", 1619725826LL, v15);

    -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v8, "addMetaDataTLV:", v16);
  }

  [v5 digest];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    dispatch_queue_t v18 = objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV);
    [v5 digest];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[UARPSuperBinaryAssetTLV initWithType:dataValue:](v18, "initWithType:dataValue:", 1619725828LL, v19);

    -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v8, "addMetaDataTLV:", v20);
  }

  [v5 signature];
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV);
    [v5 signature];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[UARPSuperBinaryAssetTLV initWithType:dataValue:](v22, "initWithType:dataValue:", 1619725829LL, v23);

    -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v8, "addMetaDataTLV:", v24);
  }

  [v5 certificate];
  objc_super v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV);
    [v5 certificate];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    int v28 = -[UARPSuperBinaryAssetTLV initWithType:dataValue:](v26, "initWithType:dataValue:", 1619725830LL, v27);

    -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v8, "addMetaDataTLV:", v28);
  }

  uint64_t v29 = [v5 modelData];
  if (v29)
  {
    v30 = (void *)v29;
    [v5 modelData];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v32 = [v31 length];

    if (v32)
    {
      [v5 digest];
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v33)
      {
        v34 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt16:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV),  "initWithType:unsignedInt16:",  3436347666LL,  1LL);
        -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v8, "addMetaDataTLV:", v34);
        uarpPlatformDarwinHashInit(1LL, &v42);
        id v35 = [v5 modelData];
        v36 = (void *)[v35 bytes];
        [v5 modelData];
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        uarpPlatformDarwinHashUpdate(1, &v42, v36, [v37 length]);

        uarpPlatformDarwinHashFinal(1LL, &v42, (unsigned __int8 *)&v42.wbuf[3], 32);
        [MEMORY[0x189603F48] dataWithBytes:&v42.wbuf[3] length:32];
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[UARPSuperBinaryAssetTLV initWithType:dataValue:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV),  "initWithType:dataValue:",  3436347655LL,  v38);
        -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v8, "addMetaDataTLV:", v39);
      }

      [v5 modelData];
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[UARPSuperBinaryAssetPayload setPayloadToData:](v8, "setPayloadToData:", v40);
    }
  }

  return v8;
}

- (void)checkCurrentHeySiriModel
{
  id CSCoreSpeechServicesClass = getCSCoreSpeechServicesClass();
  unint64_t majorVersion = self->_majorVersion;
  unint64_t minorVersion = self->_minorVersion;
  downloadedModels = self->_downloadedModels;
  preinstalledModels = self->_preinstalledModels;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __48__UARPHeySiriModelBase_checkCurrentHeySiriModel__block_invoke;
  v8[3] = &unk_18A1439F0;
  v8[4] = self;
  [CSCoreSpeechServicesClass voiceTriggerRTModelForVersion:majorVersion minorVersion:minorVersion downloadedModels:downloadedModels preinstalledModels:preinstalledModels completion:v8];
}

void __48__UARPHeySiriModelBase_checkCurrentHeySiriModel__block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    v10 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v7;
      _os_log_impl(&dword_187DC0000, v10, OS_LOG_TYPE_INFO, "HSML: Voice Trigger Download Model %@", buf, 0xCu);
    }

    if (!v8) {
      goto LABEL_11;
    }
LABEL_7:
    id v11 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v8;
      _os_log_impl(&dword_187DC0000, v11, OS_LOG_TYPE_INFO, "HSML: Voice Trigger Fallback Model %@", buf, 0xCu);
    }

    goto LABEL_11;
  }

  if (v8) {
    goto LABEL_7;
  }
  id v12 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    __48__UARPHeySiriModelBase_checkCurrentHeySiriModel__block_invoke_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
  }
LABEL_11:
  uint64_t v20 = *(void *)(a1 + 32);
  v21 = *(dispatch_queue_s **)(v20 + 16);
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __48__UARPHeySiriModelBase_checkCurrentHeySiriModel__block_invoke_8;
  v25[3] = &unk_18A143730;
  v25[4] = v20;
  id v26 = v7;
  id v27 = v8;
  id v28 = v9;
  id v22 = v9;
  id v23 = v8;
  id v24 = v7;
  dispatch_async(v21, v25);
}

void __48__UARPHeySiriModelBase_checkCurrentHeySiriModel__block_invoke_8(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 104LL));
  char v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    id v4 = objc_loadWeakRetained((id *)(a1[4] + 104LL));
    [v4 currentHeySiriModel:a1[5] fallbackModel:a1[6] error:a1[7]];
  }

- (void)checkCurrentJustSiriModelAvailable
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2050000000LL;
  id v4 = (void *)getCSCoreSpeechServicesAccessoryInfoClass_softClass;
  uint64_t v18 = getCSCoreSpeechServicesAccessoryInfoClass_softClass;
  uint64_t v5 = MEMORY[0x1895F87A8];
  if (!getCSCoreSpeechServicesAccessoryInfoClass_softClass)
  {
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __getCSCoreSpeechServicesAccessoryInfoClass_block_invoke;
    v14[3] = &unk_18A143128;
    v14[4] = &v15;
    __getCSCoreSpeechServicesAccessoryInfoClass_block_invoke((uint64_t)v14);
    id v4 = (void *)v16[3];
  }

  id v6 = v4;
  _Block_object_dispose(&v15, 8);
  id v7 = objc_alloc_init(v6);
  [v7 setSupportsJustSiri:1];
  id CSCoreSpeechServicesClass = getCSCoreSpeechServicesClass();
  unint64_t majorVersion = self->_majorVersion;
  unint64_t minorVersion = self->_minorVersion;
  downloadedModels = self->_downloadedModels;
  preinstalledModels = self->_preinstalledModels;
  v13[1] = 3221225472LL;
  v13[2] = __58__UARPHeySiriModelBase_checkCurrentJustSiriModelAvailable__block_invoke;
  v13[3] = &unk_18A1439F0;
  v13[4] = self;
  v13[0] = v5;
  [CSCoreSpeechServicesClass voiceTriggerRTModelForVersion:majorVersion minorVersion:minorVersion accessoryRTModelType:0 accessoryInfo:v7 endpointId:v3 downloadedModels:downloadedModels preinstall edModels:preinstalledModels completion:v13];
}

void __58__UARPHeySiriModelBase_checkCurrentJustSiriModelAvailable__block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    v10 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v7;
      _os_log_impl(&dword_187DC0000, v10, OS_LOG_TYPE_INFO, "Download Model %@", buf, 0xCu);
    }
  }

  if (v8)
  {
    id v11 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v8;
      _os_log_impl(&dword_187DC0000, v11, OS_LOG_TYPE_INFO, "Fallback Model %@", buf, 0xCu);
    }
  }

  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(dispatch_queue_s **)(v12 + 16);
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __58__UARPHeySiriModelBase_checkCurrentJustSiriModelAvailable__block_invoke_14;
  v17[3] = &unk_18A143730;
  v17[4] = v12;
  id v18 = v7;
  id v19 = v8;
  id v20 = v9;
  id v14 = v9;
  id v15 = v8;
  id v16 = v7;
  dispatch_async(v13, v17);
}

void __58__UARPHeySiriModelBase_checkCurrentJustSiriModelAvailable__block_invoke_14(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 104LL));
  char v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    id v4 = objc_loadWeakRetained((id *)(a1[4] + 104LL));
    [v4 currentHeySiriModel:a1[5] fallbackModel:a1[6] error:a1[7]];
  }

- (void)offerDownloadModel:(id)a3 fallbackModel:(id)a4 tag:(id)a5 assetVersion:(id)a6 error:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  unsigned int uarpProtocolVersion_low = LOWORD(self->_uarpProtocolVersion);
  id v15 = a6;
  id v16 = -[UARPSuperBinaryAsset initWithFormatVersion:assetVersion:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAsset),  "initWithFormatVersion:assetVersion:",  uarpAssetSuperBinaryVersionForProtocolVersion(uarpProtocolVersion_low),  v15);

  if (-[UARPHeySiriModelBase engineType](self, "engineType")
    && -[UARPHeySiriModelBase engineType](self, "engineType") != 1)
  {
    uint64_t v17 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt16:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV),  "initWithType:unsignedInt16:",  1619725832LL,  (unsigned __int16)-[UARPHeySiriModelBase engineType](self, "engineType"));
    -[UARPSuperBinaryAsset addMetaDataTLV:](v16, "addMetaDataTLV:", v17);
  }

  if (v11)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[UARPHeySiriModelBase offerDownloadModel:fallbackModel:tag:assetVersion:error:].cold.4( log,  v19,  v20,  v21,  v22,  v23,  v24,  v25);
    }
    -[UARPHeySiriModelBase uarpPayloadWithHSModel:tag:](self, "uarpPayloadWithHSModel:tag:", v11, v13);
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    id v27 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt16:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV),  "initWithType:unsignedInt16:",  1619725827LL,  0LL);
    [v26 addMetaDataTLV:v27];
    -[UARPSuperBinaryAsset addPayload:](v16, "addPayload:", v26);
  }

  if (v12)
  {
    id v28 = self->_log;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[UARPHeySiriModelBase offerDownloadModel:fallbackModel:tag:assetVersion:error:].cold.3( v28,  v29,  v30,  v31,  v32,  v33,  v34,  v35);
    }
    v36 = -[UARPHeySiriModelBase uarpPayloadWithHSModel:tag:](self, "uarpPayloadWithHSModel:tag:", v12, v13);
    v37 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt16:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV),  "initWithType:unsignedInt16:",  1619725827LL,  1LL);
    [v36 addMetaDataTLV:v37];
    -[UARPSuperBinaryAsset addPayload:](v16, "addPayload:", v36);
  }

  uarpDynamicAssetComponentURL(v13);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  id v58 = 0LL;
  BOOL v39 = -[UARPSuperBinaryAsset writeToURL:error:](v16, "writeToURL:error:", v38, &v58);
  id v40 = v58;
  if (v39)
  {
    id v57 = 0LL;
    BOOL v41 = -[UARPHeySiriModelBase offerDynamicAssetToAccessory:tag:error:]( self,  "offerDynamicAssetToAccessory:tag:error:",  v38,  v13,  &v57);
    id v42 = v57;

    if (!v41)
    {
      __int128 v43 = self->_log;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        -[UARPHeySiriModelBase offerDownloadModel:fallbackModel:tag:assetVersion:error:].cold.1( (uint64_t)v42,  v43,  v44,  v45,  v46,  v47,  v48,  v49);
      }
    }

    id v40 = v42;
  }

  else
  {
    uint64_t v50 = self->_log;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      -[UARPHeySiriModelBase offerDownloadModel:fallbackModel:tag:assetVersion:error:].cold.2( (uint64_t)v40,  v50,  v51,  v52,  v53,  v54,  v55,  v56);
    }
  }
}

- (BOOL)offerDynamicAssetToAccessory:(id)a3 tag:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = -[UARPAssetID initWithLocationType:assetTag:url:]( objc_alloc(&OBJC_CLASS___UARPAssetID),  "initWithLocationType:assetTag:url:",  0LL,  v8,  v9);

  if (v10)
  {
    -[UARPAssetID setReportProgressToDelegates:](v10, "setReportProgressToDelegates:", 0LL);
    BOOL v11 = -[UARPController dynamicAssetAvailableForAccessory:assetID:error:]( self->_controller,  "dynamicAssetAvailableForAccessory:assetID:error:",  self->_accessory,  v10,  a5);
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (UARPAccessory)accessory
{
  return (UARPAccessory *)objc_getProperty(self, a2, 96LL, 1);
}

- (UARPHeySiriModelDelegateProtocol)delegate
{
  return (UARPHeySiriModelDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

void __48__UARPHeySiriModelBase_checkCurrentHeySiriModel__block_invoke_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)offerDownloadModel:(uint64_t)a3 fallbackModel:(uint64_t)a4 tag:(uint64_t)a5 assetVersion:(uint64_t)a6 error:(uint64_t)a7 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)offerDownloadModel:(uint64_t)a3 fallbackModel:(uint64_t)a4 tag:(uint64_t)a5 assetVersion:(uint64_t)a6 error:(uint64_t)a7 .cold.2( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)offerDownloadModel:(uint64_t)a3 fallbackModel:(uint64_t)a4 tag:(uint64_t)a5 assetVersion:(uint64_t)a6 error:(uint64_t)a7 .cold.3( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)offerDownloadModel:(uint64_t)a3 fallbackModel:(uint64_t)a4 tag:(uint64_t)a5 assetVersion:(uint64_t)a6 error:(uint64_t)a7 .cold.4( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end