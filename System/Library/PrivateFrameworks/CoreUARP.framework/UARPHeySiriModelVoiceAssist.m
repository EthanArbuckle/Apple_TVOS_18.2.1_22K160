@interface UARPHeySiriModelVoiceAssist
+ (id)tag;
- (BOOL)processDynamicAsset:(id *)a3;
- (UARPHeySiriModelVoiceAssist)init;
- (id)generateAsset:(id *)a3;
- (void)currentHeySiriModel:(id)a3 fallbackModel:(id)a4 error:(id)a5;
@end

@implementation UARPHeySiriModelVoiceAssist

- (UARPHeySiriModelVoiceAssist)init
{
  return 0LL;
}

- (BOOL)processDynamicAsset:(id *)a3
{
  v5 = objc_alloc(&OBJC_CLASS___UARPSuperBinaryAsset);
  v6 = -[UARPHeySiriModelBase url](self, "url");
  v7 = -[UARPSuperBinaryAsset initWithURL:](v5, "initWithURL:", v6);
  -[UARPHeySiriModelBase setSuperbinary:](self, "setSuperbinary:", v7);
  v8 = -[UARPHeySiriModelBase superbinary](self, "superbinary");
  LOBYTE(a3) = [v8 expandHeadersAndTLVs:a3];
  v9 = -[UARPHeySiriModelBase superbinary](self, "superbinary");
  [v9 tlvs];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  76079623LL,  v10);
  [v11 valueAsVersion];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPHeySiriModelBase setMajorVersion:](self, "setMajorVersion:", [v12 majorVersion]);
  -[UARPHeySiriModelBase setMinorVersion:](self, "setMinorVersion:", [v12 minorVersion]);
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___UARPHeySiriModelVoiceAssist;
  -[UARPHeySiriModelBase setDelegate:](&v15, sel_setDelegate_, self);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___UARPHeySiriModelVoiceAssist;
  -[UARPHeySiriModelBase checkCurrentHeySiriModel](&v14, sel_checkCurrentHeySiriModel);

  return (char)a3;
}

- (void)currentHeySiriModel:(id)a3 fallbackModel:(id)a4 error:(id)a5
{
  uint64_t v125 = *MEMORY[0x1895F89C0];
  id v92 = a3;
  id v91 = a4;
  v120.receiver = self;
  v120.super_class = (Class)&OBJC_CLASS___UARPHeySiriModelVoiceAssist;
  v7 = -[UARPHeySiriModelBase accessory](&v120, sel_accessory);
  [v7 modelNumber];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[UARPSupportedAccessory findByAppleModelNumber:](&OBJC_CLASS___UARPSupportedAccessory, "findByAppleModelNumber:", v8);
  if (v9)
  {
    v10 = (void *)MEMORY[0x189607940];
    UARPStringSupplementalAssetsFilepath();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 supplementalMobileAssetAppleModelNumber];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 stringWithFormat:@"%@/%@-%@", v11, v12, @"VoiceAssist"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    id v117 = 0LL;
    LOBYTE(v10) = appendFirstUarpFilenameToFilepath(v13, (uint64_t)&v117);
    id v14 = v117;
    if ((v10 & 1) == 0)
    {
      v116.receiver = self;
      v116.super_class = (Class)&OBJC_CLASS___UARPHeySiriModelVoiceAssist;
      -[UARPHeySiriModelBase log](&v116, "log");
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:].cold.8( (uint64_t)v13,  v16,  v58,  v59,  v60,  v61,  v62,  v63);
      }
      goto LABEL_45;
    }

    v115.receiver = self;
    v115.super_class = (Class)&OBJC_CLASS___UARPHeySiriModelVoiceAssist;
    -[UARPHeySiriModelBase log](&v115, "log");
    objc_super v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v124 = v13;
      _os_log_impl(&dword_187DC0000, v15, OS_LOG_TYPE_DEFAULT, "Filename for voice assist is %@", buf, 0xCu);
    }

    [MEMORY[0x189604030] URLWithString:v13];
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v17 = -[UARPSuperBinaryAsset initWithURL:](objc_alloc(&OBJC_CLASS___UARPSuperBinaryAsset), "initWithURL:", v16);
    asset = self->_asset;
    self->_asset = v17;

    if (!self->_asset)
    {
      v114.receiver = self;
      v114.super_class = (Class)&OBJC_CLASS___UARPHeySiriModelVoiceAssist;
      -[UARPHeySiriModelBase log](&v114, "log");
      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:].cold.1();
      }
      goto LABEL_44;
    }

    if (!-[UARPSuperBinaryAsset expandHeadersAndTLVs:](self->_asset, "expandHeadersAndTLVs:", 0LL))
    {
      v113.receiver = self;
      v113.super_class = (Class)&OBJC_CLASS___UARPHeySiriModelVoiceAssist;
      -[UARPHeySiriModelBase log](&v113, "log");
      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:].cold.7();
      }
      goto LABEL_44;
    }

    v81 = v16;
    v82 = v14;
    v84 = v13;
    p_payloadModel = &self->_payloadModel;
    payloadModel = self->_payloadModel;
    self->_payloadModel = 0LL;

    v83 = self;
    payloadFallbackModel = self->_payloadFallbackModel;
    location = (id *)&self->_payloadFallbackModel;
    self->_payloadFallbackModel = 0LL;

    __int128 v111 = 0u;
    __int128 v112 = 0u;
    __int128 v109 = 0u;
    __int128 v110 = 0u;
    p_asset = (id *)&self->_asset;
    -[UARPSuperBinaryAsset payloads](self->_asset, "payloads");
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v88 = [obj countByEnumeratingWithState:&v109 objects:v122 count:16];
    if (v88)
    {
      uint64_t v87 = *(void *)v110;
      do
      {
        uint64_t v22 = 0LL;
        do
        {
          if (*(void *)v110 != v87) {
            objc_enumerationMutation(obj);
          }
          uint64_t v89 = v22;
          v23 = *(void **)(*((void *)&v109 + 1) + 8 * v22);
          __int128 v105 = 0u;
          __int128 v106 = 0u;
          __int128 v107 = 0u;
          __int128 v108 = 0u;
          [v23 tlvs];
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v25 = [v24 countByEnumeratingWithState:&v105 objects:v121 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v106;
            do
            {
              for (uint64_t i = 0LL; i != v26; ++i)
              {
                if (*(void *)v106 != v27) {
                  objc_enumerationMutation(v24);
                }
                v29 = *(void **)(*((void *)&v105 + 1) + 8 * i);
                if ([v29 type] == 76079617)
                {
                  [v29 valueAsString];
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  [v92 modelLocale];
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  char v32 = [v30 isEqualToString:v31];

                  v33 = (id *)p_payloadModel;
                  if ((v32 & 1) != 0
                    || ([v91 modelLocale],
                        v34 = (void *)objc_claimAutoreleasedReturnValue(),
                        int v35 = [v30 isEqualToString:v34],
                        v34,
                        v33 = location,
                        v35))
                  {
                    objc_storeStrong(v33, v23);
                  }
                }
              }

              uint64_t v26 = [v24 countByEnumeratingWithState:&v105 objects:v121 count:16];
            }

            while (v26);
          }

          uint64_t v22 = v89 + 1;
        }

        while (v89 + 1 != v88);
        uint64_t v88 = [obj countByEnumeratingWithState:&v109 objects:v122 count:16];
      }

      while (v88);
    }

    uint64_t v36 = UARPUtilsBuildURLForTemporaryFile();
    superBinaryMetaDataURL = v83->_superBinaryMetaDataURL;
    v83->_superBinaryMetaDataURL = (NSURL *)v36;

    id v38 = *p_asset;
    v39 = v83->_superBinaryMetaDataURL;
    uint64_t v40 = [*p_asset rangeMetadata];
    id v104 = 0LL;
    LOBYTE(v38) = objc_msgSend(v38, "exportSuperBinaryContentToFilepath:range:error:", v39, v40, v41, &v104);
    id v42 = v104;

    if ((v38 & 1) == 0)
    {
      v103.receiver = v83;
      v103.super_class = (Class)&OBJC_CLASS___UARPHeySiriModelVoiceAssist;
      -[UARPHeySiriModelBase log](&v103, "log");
      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v13 = v84;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:].cold.6();
      }
      goto LABEL_42;
    }

    v13 = v84;
    if (*p_payloadModel)
    {
      uint64_t v43 = UARPUtilsBuildURLForTemporaryFile();
      modelMetaDataURL = v83->_modelMetaDataURL;
      v83->_modelMetaDataURL = (NSURL *)v43;

      id v45 = *p_asset;
      v46 = v83->_modelMetaDataURL;
      uint64_t v47 = -[UARPSuperBinaryAssetPayload rangeMetadata](*p_payloadModel, "rangeMetadata");
      id v102 = 0LL;
      LOBYTE(v45) = objc_msgSend(v45, "exportSuperBinaryContentToFilepath:range:error:", v46, v47, v48, &v102);
      id v14 = v102;

      if ((v45 & 1) == 0)
      {
        v101.receiver = v83;
        v101.super_class = (Class)&OBJC_CLASS___UARPHeySiriModelVoiceAssist;
        -[UARPHeySiriModelBase log](&v101, "log");
        v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
          -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:].cold.5();
        }
        goto LABEL_43;
      }

      uint64_t v49 = UARPUtilsBuildURLForTemporaryFile();
      modelDataURL = v83->_modelDataURL;
      v83->_modelDataURL = (NSURL *)v49;

      id v51 = *p_asset;
      v52 = v83->_modelDataURL;
      uint64_t v53 = -[UARPSuperBinaryAssetPayload rangePayload](*p_payloadModel, "rangePayload");
      id v100 = 0LL;
      LOBYTE(v51) = objc_msgSend(v51, "exportSuperBinaryContentToFilepath:range:error:", v52, v53, v54, &v100);
      id v42 = v100;

      if ((v51 & 1) == 0)
      {
        v99.receiver = v83;
        v99.super_class = (Class)&OBJC_CLASS___UARPHeySiriModelVoiceAssist;
        -[UARPHeySiriModelBase log](&v99, "log");
        v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
          -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:].cold.4();
        }
LABEL_42:
        id v14 = v42;
LABEL_43:
        v16 = v81;
LABEL_44:

LABEL_45:
        goto LABEL_46;
      }
    }

    else
    {
      v64 = v83->_modelMetaDataURL;
      v83->_modelMetaDataURL = 0LL;

      v65 = v83->_modelDataURL;
      v83->_modelDataURL = 0LL;
    }

    if (*location)
    {
      uint64_t v66 = UARPUtilsBuildURLForTemporaryFile();
      fallbackModelMetaDataURL = v83->_fallbackModelMetaDataURL;
      v83->_fallbackModelMetaDataURL = (NSURL *)v66;

      id v68 = *p_asset;
      v69 = v83->_fallbackModelMetaDataURL;
      uint64_t v70 = [*location rangeMetadata];
      id v98 = 0LL;
      LOBYTE(v68) = objc_msgSend(v68, "exportSuperBinaryContentToFilepath:range:error:", v69, v70, v71, &v98);
      id v14 = v98;

      if ((v68 & 1) == 0)
      {
        v97.receiver = v83;
        v97.super_class = (Class)&OBJC_CLASS___UARPHeySiriModelVoiceAssist;
        -[UARPHeySiriModelBase log](&v97, "log");
        v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
          -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:].cold.3();
        }
        goto LABEL_43;
      }

      uint64_t v72 = UARPUtilsBuildURLForTemporaryFile();
      fallbackModelDataURL = v83->_fallbackModelDataURL;
      v83->_fallbackModelDataURL = (NSURL *)v72;

      id v74 = *p_asset;
      v75 = v83->_fallbackModelDataURL;
      uint64_t v76 = [*location rangePayload];
      id v96 = 0LL;
      LOBYTE(v74) = objc_msgSend(v74, "exportSuperBinaryContentToFilepath:range:error:", v75, v76, v77, &v96);
      id v42 = v96;

      if ((v74 & 1) == 0)
      {
        v95.receiver = v83;
        v95.super_class = (Class)&OBJC_CLASS___UARPHeySiriModelVoiceAssist;
        -[UARPHeySiriModelBase log](&v95, "log");
        v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
          -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:].cold.2();
        }
        goto LABEL_42;
      }
    }

    else
    {
      v78 = v83->_fallbackModelMetaDataURL;
      v83->_fallbackModelMetaDataURL = 0LL;

      v79 = v83->_fallbackModelDataURL;
      v83->_fallbackModelDataURL = 0LL;
    }

    id v94 = v42;
    -[UARPHeySiriModelVoiceAssist generateAsset:](v83, "generateAsset:", &v94);
    v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v14 = v94;
    v80 = +[UARPHeySiriModelVoiceAssist tag](&OBJC_CLASS___UARPHeySiriModelVoiceAssist, "tag");
    v93.receiver = v83;
    v93.super_class = (Class)&OBJC_CLASS___UARPHeySiriModelVoiceAssist;
    -[UARPHeySiriModelBase offerDynamicAssetToAccessory:tag:error:]( &v93,  sel_offerDynamicAssetToAccessory_tag_error_,  v55,  v80,  0LL);

    goto LABEL_43;
  }

  v119.receiver = self;
  v119.super_class = (Class)&OBJC_CLASS___UARPHeySiriModelVoiceAssist;
  -[UARPHeySiriModelBase log](&v119, "log");
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
  {
    v118.receiver = self;
    v118.super_class = (Class)&OBJC_CLASS___UARPHeySiriModelVoiceAssist;
    v56 = -[UARPHeySiriModelBase accessory](&v118, sel_accessory);
    [v56 modelNumber];
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v124 = v57;
    _os_log_error_impl( &dword_187DC0000,  (os_log_t)v14,  OS_LOG_TYPE_ERROR,  "Could not find supported accessory for  %@",  buf,  0xCu);
  }

- (id)generateAsset:(id *)a3
{
  uint64_t v53 = 0LL;
  uint64_t v52 = 0LL;
  uint64_t v54 = 0LL;
  uint64_t v49 = 0LL;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  uint64_t v46 = 0LL;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___UARPHeySiriModelVoiceAssist;
  v50[0] = -[UARPHeySiriModelBase uarpProtocolVersion](&v43, sel_uarpProtocolVersion);
  v50[1] = 44;
  payloadModel = self->_payloadModel;
  BOOL v6 = payloadModel == 0LL;
  BOOL v7 = payloadModel != 0LL;
  if (v6) {
    int v8 = 1;
  }
  else {
    int v8 = 2;
  }
  if (self->_fallbackModelMetaDataURL) {
    BOOL v7 = v8;
  }
  int v55 = 44;
  int v56 = 40 * v7;
  int v9 = 40 * v7 + 44;
  int v51 = v9;
  LODWORD(v54) = v9;
  v10 = (uint64_t *)MEMORY[0x189607548];
  if (self->_superBinaryMetaDataURL)
  {
    [MEMORY[0x1896078A8] defaultManager];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NSURL absoluteString](self->_superBinaryMetaDataURL, "absoluteString");
    [v11 attributesOfItemAtPath:v12 error:a3];
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    [v13 objectForKeyedSubscript:*v10];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    int v15 = [v14 unsignedLongValue];
    v9 += v15;
    HIDWORD(v54) = v15;
    int v51 = v9;
  }

  +[UARPHeySiriModelVoiceAssist tag](&OBJC_CLASS___UARPHeySiriModelVoiceAssist, "tag", 120LL);
  id v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_payloadModel)
  {
    LODWORD(v47) = 40;
    DWORD1(v47) = [v42 tag];
    [MEMORY[0x1896078A8] defaultManager];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSURL absoluteString](self->_modelMetaDataURL, "absoluteString");
    [v16 attributesOfItemAtPath:v17 error:a3];
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v19 = *v10;
    [v18 objectForKeyedSubscript:*v10];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    DWORD2(v48) = v9;
    HIDWORD(v48) = [v20 unsignedLongValue];
    int v21 = v9 + HIDWORD(v48);
    [MEMORY[0x1896078A8] defaultManager];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[NSURL absoluteString](self->_modelDataURL, "absoluteString");
    [v22 attributesOfItemAtPath:v23 error:a3];
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    [v24 objectForKeyedSubscript:v19];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v49) = v21;
    HIDWORD(v49) = [v25 unsignedLongValue];
    int v9 = v21 + HIDWORD(v49);
    int v51 = v21 + HIDWORD(v49);
  }

  if (self->_payloadFallbackModel)
  {
    LODWORD(v44) = 40;
    DWORD1(v44) = [v42 tag];
    [MEMORY[0x1896078A8] defaultManager];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL absoluteString](self->_fallbackModelMetaDataURL, "absoluteString");
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 attributesOfItemAtPath:v27 error:a3];
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v29 = *MEMORY[0x189607548];
    [v28 objectForKeyedSubscript:*MEMORY[0x189607548]];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    DWORD2(v45) = v9;
    HIDWORD(v45) = [v30 unsignedLongValue];
    int v31 = v9 + HIDWORD(v45);
    [MEMORY[0x1896078A8] defaultManager];
    char v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[NSURL absoluteString](self->_fallbackModelDataURL, "absoluteString");
    [v32 attributesOfItemAtPath:v33 error:a3];
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    [v34 objectForKeyedSubscript:v29];
    int v35 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v46) = v31;
    HIDWORD(v46) = [v35 unsignedLongValue];
    int v51 = v31 + HIDWORD(v46);
  }

  uarpSuperBinaryHeaderEndianSwap(v50, v50);
  uarpPayloadHeaderEndianSwap((unsigned int *)&v47, &v47);
  uarpPayloadHeaderEndianSwap((unsigned int *)&v44, &v44);
  UARPUtilsBuildURLForTemporaryFile();
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607898] fileHandleForWritingToURL:v36 error:a3];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    id v38 = objc_alloc_init(MEMORY[0x189603FB8]);
    [v38 appendBytes:v50 length:44];
    if (self->_payloadModel) {
      [v38 appendBytes:&v47 length:40];
    }
    if (self->_payloadFallbackModel) {
      [v38 appendBytes:&v44 length:40];
    }
    if ([v37 uarpWriteData:v38 error:a3]
      && [v37 uarpCloseAndReturnError:a3]
      && uarpUtilsConcatenateURLs( (uint64_t)v36,  *(void **)((char *)&self->super.super.isa + v41),  (uint64_t)a3)
      && uarpUtilsConcatenateURLs((uint64_t)v36, self->_modelMetaDataURL, (uint64_t)a3)
      && uarpUtilsConcatenateURLs((uint64_t)v36, self->_modelDataURL, (uint64_t)a3)
      && uarpUtilsConcatenateURLs((uint64_t)v36, self->_fallbackModelMetaDataURL, (uint64_t)a3)
      && uarpUtilsConcatenateURLs((uint64_t)v36, self->_fallbackModelDataURL, (uint64_t)a3))
    {
      id v39 = v36;
    }

    else
    {
      id v39 = 0LL;
    }
  }

  else
  {
    id v39 = 0LL;
  }

  return v39;
}

+ (id)tag
{
  v2 = (char *)uarpAssetTagStructVoiceAssist();
  return  -[UARPAssetTag initWithChar1:char2:char3:char4:]( objc_alloc(&OBJC_CLASS___UARPAssetTag),  "initWithChar1:char2:char3:char4:",  *v2,  v2[1],  v2[2],  v2[3]);
}

- (void).cxx_destruct
{
}

- (void)currentHeySiriModel:fallbackModel:error:.cold.1()
{
}

- (void)currentHeySiriModel:fallbackModel:error:.cold.2()
{
}

- (void)currentHeySiriModel:fallbackModel:error:.cold.3()
{
}

- (void)currentHeySiriModel:fallbackModel:error:.cold.4()
{
}

- (void)currentHeySiriModel:fallbackModel:error:.cold.5()
{
}

- (void)currentHeySiriModel:fallbackModel:error:.cold.6()
{
}

- (void)currentHeySiriModel:fallbackModel:error:.cold.7()
{
}

- (void)currentHeySiriModel:(uint64_t)a3 fallbackModel:(uint64_t)a4 error:(uint64_t)a5 .cold.8( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end