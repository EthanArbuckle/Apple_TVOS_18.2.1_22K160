@interface PKDPlugIn
+ (id)nullPlugIn;
+ (id)sandboxOverrideForExtensionPoint:(id)a3 attributes:(id)a4;
- (BOOL)ageRestricted;
- (BOOL)enableForClient:(id)a3 environment:(id)a4 languages:(id)a5 oneShotUUID:(id)a6 persona:(id)a7 sandbox:(id)a8 pid:(int *)a9 error:(id *)a10;
- (BOOL)isRBManaged;
- (BOOL)match:(id)a3 discoveryInstanceUUID:(id)a4 server:(id)a5;
- (BOOL)matchDictionary:(id)a3 pattern:(id)a4 discoveryInstanceUUID:(id)a5;
- (BOOL)matchKey:(id)a3 pattern:(id)a4 discoveryInstanceUUID:(id)a5 server:(id)a6;
- (BOOL)matchValue:(id)a3 pattern:(id)a4;
- (BOOL)matchValue:(id)a3 patterns:(id)a4;
- (NSDictionary)infoPlist;
- (NSNumber)containerAgeRestriction;
- (NSObject)fileID;
- (NSObject)launchFileID;
- (NSString)annotationKey;
- (NSString)sandboxProfile;
- (PKDPersonaCache)personaCache;
- (PKDPlugIn)initWithLSData:(id)a3 personaCache:(id)a4 discoveryInstanceUUID:(id)a5 extensionPointCache:(id)a6 externalProviders:(id)a7;
- (id)_personaIDForClient:(id)a3 requestedPersona:(id)a4;
- (id)allowForClient:(id)a3 discoveryInstanceUUID:(id)a4;
- (id)allowedTCCServices;
- (id)checkBusy;
- (id)debugDescription;
- (id)diagnose;
- (id)issueResourceExtensions:(id)a3 auditToken:(id *)a4;
- (id)launchdIdentifier;
- (id)launchdVersion;
- (id)prunedInfoDictionaryFor:(id)a3;
- (unsigned)platform;
- (void)augmentForm:(id)a3 host:(id)a4;
- (void)dealloc;
- (void)setIsRBManaged:(BOOL)a3;
@end

@implementation PKDPlugIn

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___PKDPlugIn;
  -[PKDPlugIn dealloc](&v2, "dealloc");
}

+ (id)nullPlugIn
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __23__PKDPlugIn_nullPlugIn__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (nullPlugIn_onceToken != -1) {
    dispatch_once(&nullPlugIn_onceToken, block);
  }
  return (id)nullPlugIn_nullPlugIn;
}

void __23__PKDPlugIn_nullPlugIn__block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_opt_new(*(void *)(a1 + 32));
  objc_super v2 = (void *)nullPlugIn_nullPlugIn;
  nullPlugIn_nullPlugIn = v1;

  v3 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", &UUID_NULL);
  [(id)nullPlugIn_nullPlugIn setUuid:v3];
}

- (PKDPlugIn)initWithLSData:(id)a3 personaCache:(id)a4 discoveryInstanceUUID:(id)a5 extensionPointCache:(id)a6 externalProviders:(id)a7
{
  id v12 = a3;
  id v110 = a4;
  id v114 = a5;
  id v111 = a6;
  id v112 = a7;
  v113 = (void *)objc_claimAutoreleasedReturnValue([v12 pluginUUID]);
  uint64_t v14 = pklog_handle_for_category(3LL, v13);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, v12);

  uint64_t v18 = pklog_handle_for_category(3LL, v17);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  v20 = v19;
  unint64_t v21 = v16 - 1;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_DWORD *)buf = 138543362;
    id v118 = v113;
    _os_signpost_emit_with_name_impl( &dword_0,  v20,  OS_SIGNPOST_INTERVAL_BEGIN,  v16,  "LSPlugInKitProxy",  " uuid=%{public, signpost.description:attribute}@ ",  buf,  0xCu);
  }

  v115 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleURL]);
  if (!v115)
  {
    uint64_t v41 = pklog_handle_for_category(6LL, v22);
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[PKDPlugIn initWithLSData:personaCache:discoveryInstanceUUID:extensionPointCache:externalProviders:].cold.1( (uint64_t)v114,  (uint64_t)v12,  (uint64_t)v42,  v43,  v44,  v45,  v46,  v47,  v85,  v86,  v87,  v88,  v90,  (uint64_t)v92,  (uint64_t)v94,  (uint64_t)v96,  (uint64_t)v98,  (uint64_t)v100,  (uint64_t)obj,  v104,  v106,  v108,  (uint64_t)v110,  (uint64_t)v111);
    }

    uint64_t v49 = pklog_handle_for_category(3LL, v48);
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    v28 = v50;
    if (v21 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v50))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( &dword_0,  v28,  OS_SIGNPOST_INTERVAL_END,  v16,  "LSPlugInKitProxy",  (const char *)&unk_1DDCE,  buf,  2u);
    }

    goto LABEL_36;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v12 extensionPoint]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 platform]);
  id v25 = [v24 unsignedIntValue];

  if (!(_DWORD)v25)
  {
    uint64_t v74 = pklog_handle_for_category(3LL, v26);
    v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
    v76 = v75;
    if (v21 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v75))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( &dword_0,  v76,  OS_SIGNPOST_INTERVAL_END,  v16,  "LSPlugInKitProxy",  (const char *)&unk_1DDCE,  buf,  2u);
    }

    uint64_t v78 = pklog_handle_for_category(6LL, v77);
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[PKDPlugIn initWithLSData:personaCache:discoveryInstanceUUID:extensionPointCache:externalProviders:].cold.2( (uint64_t)v114,  (uint64_t)v12,  (uint64_t)v28,  v79,  v80,  v81,  v82,  v83,  v85,  v86,  v87,  v88,  v90,  (uint64_t)v92,  (uint64_t)v94,  (uint64_t)v96,  (uint64_t)v98,  (uint64_t)v100,  (uint64_t)obj,  v104,  v106,  v108,  (uint64_t)v110,  (uint64_t)v111);
    }
LABEL_36:
    v69 = 0LL;
    goto LABEL_37;
  }

  BOOL v27 = v21 < 0xFFFFFFFFFFFFFFFELL;
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 pluginIdentifier]);
  v105 = (void *)objc_claimAutoreleasedReturnValue([v12 registrationDate]);
  unsigned __int8 v29 = [v12 isOnSystemPartition];
  id obja = (id)objc_claimAutoreleasedReturnValue([v12 originalIdentifier]);
  id v101 = (id)objc_claimAutoreleasedReturnValue([v12 entitlements]);
  id v99 = (id)objc_claimAutoreleasedReturnValue([v12 dataContainerURL]);
  v107 = (void *)objc_claimAutoreleasedReturnValue([v12 infoPlist]);
  v109 = (void *)objc_claimAutoreleasedReturnValue([v12 containingBundle]);
  id v97 = (id)objc_claimAutoreleasedReturnValue([v109 bundleURL]);
  id v95 = (id)objc_claimAutoreleasedReturnValue([v109 bundleIdentifier]);
  id v93 = (id)objc_claimAutoreleasedReturnValue([v109 localizedName]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v12 platform]);
  unsigned int v31 = [v30 unsignedIntValue];

  uint64_t v33 = pklog_handle_for_category(3LL, v32);
  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  v35 = v34;
  if (v27 && os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( &dword_0,  v35,  OS_SIGNPOST_INTERVAL_END,  v16,  "LSPlugInKitProxy",  (const char *)&unk_1DDCE,  buf,  2u);
  }

  v116.receiver = self;
  v116.super_class = (Class)&OBJC_CLASS___PKDPlugIn;
  v36 = -[PKDPlugIn initWithName:extensionPointPlatform:url:bundleInfo:uuid:discoveryInstanceUUID:extensionPointCache:externalProviders:]( &v116,  "initWithName:extensionPointPlatform:url:bundleInfo:uuid:discoveryInstanceUUID:extensionPointCache:externalProviders:",  v28,  v25,  v115,  v107,  v113,  v114,  v111,  v112);
  if (v36)
  {
    [v105 timeIntervalSince1970];
    *(void *)&v36->PKPlugInCore_opaque[OBJC_IVAR___PKPlugInCore__lastModified] = (uint64_t)v37;
    v36->PKPlugInCore_opaque[OBJC_IVAR___PKPlugInCore__onSystemVolume] = v29;
    objc_storeStrong((id *)&v36->PKPlugInCore_opaque[OBJC_IVAR___PKPlugInCore__originalIdentifier], obja);
    objc_storeStrong((id *)&v36->PKPlugInCore_opaque[OBJC_IVAR___PKPlugInCore__entitlements], v101);
    objc_storeStrong((id *)&v36->PKPlugInCore_opaque[OBJC_IVAR___PKPlugInCore__dataContainerURL], v99);
    v36->_platform = v31;
    v38 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)&v36->PKPlugInCore_opaque[OBJC_IVAR___PKPlugInCore__plugInDictionary] objectForKeyedSubscript:PKHubProtocolVersionInfoKey]);
    v39 = v38;
    if (v38)
    {
      id v40 = [v38 unsignedIntegerValue];
      *(void *)&v36->PKPlugInCore_opaque[OBJC_IVAR___PKPlugInCore__hubProtocolVersion] = v40;
    }

    else
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn infoKey:](v36, "infoKey:", PKPlugInKitInfoKey_L));

      if (v51) {
        uint64_t v52 = 1LL;
      }
      else {
        uint64_t v52 = 2LL;
      }
      *(void *)&v36->PKPlugInCore_opaque[OBJC_IVAR___PKPlugInCore__hubProtocolVersion] = v52;
    }

    objc_storeStrong((id *)&v36->PKPlugInCore_opaque[OBJC_IVAR___PKPlugInCore__containingUrl], v97);
    objc_storeStrong((id *)&v36->PKPlugInCore_opaque[OBJC_IVAR___PKPlugInCore__containingBundleIdentifier], v95);
    objc_storeStrong((id *)&v36->_personaCache, a4);
    objc_storeStrong((id *)&v36->PKPlugInCore_opaque[OBJC_IVAR___PKPlugInCore__localizedContainingName], v93);
    uint64_t v53 = objc_claimAutoreleasedReturnValue([v12 launchPersonas]);
    v54 = *(void **)&v36->PKPlugInCore_opaque[OBJC_IVAR___PKPlugInCore__launchPersonas];
    *(void *)&v36->PKPlugInCore_opaque[OBJC_IVAR___PKPlugInCore__launchPersonas] = v53;

    fileID = v36->_fileID;
    v36->_fileID = 0LL;

    sandboxProfile = v36->_sandboxProfile;
    v36->_sandboxProfile = 0LL;

    v36->_isRBManaged = objc_opt_class(&OBJC_CLASS___RBSProcessIdentity) != 0;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn diagnose](v36, "diagnose"));
    if (v58)
    {
      uint64_t v59 = pklog_handle_for_category(6LL, v57);
      v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        v70 = (PKDPlugIn *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](v36, "uuid"));
        v71 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](v36, "identifier"));
        v89 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](v36, "version"));
        v91 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleURL]);
        v72 = (void *)objc_claimAutoreleasedReturnValue([v91 path]);
        v73 = (void *)objc_claimAutoreleasedReturnValue([v58 localizedDescription]);
        *(_DWORD *)buf = 138413570;
        id v118 = v114;
        __int16 v119 = 2114;
        v120 = v70;
        __int16 v121 = 2112;
        v122 = v71;
        __int16 v123 = 2112;
        v124 = v89;
        __int16 v125 = 2114;
        v126 = v72;
        __int16 v127 = 2112;
        v128 = v73;
        _os_log_error_impl( &dword_0,  v60,  OS_LOG_TYPE_ERROR,  "[d %@] [u %{public}@] [%@(%@)] rejecting; Ignoring mis-configured plugin at [%{public}@]: %@",
          buf,
          0x3Eu);
      }

      v36 = 0LL;
    }

    uint64_t v61 = pklog_handle_for_category(6LL, v57);
    v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      v63 = (PKDPlugIn *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](v36, "uuid"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](v36, "identifier"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](v36, "version"));
      *(_DWORD *)buf = 138413058;
      id v118 = v114;
      __int16 v119 = 2114;
      v120 = v63;
      __int16 v121 = 2112;
      v122 = v64;
      __int16 v123 = 2112;
      v124 = v65;
      _os_log_impl(&dword_0, v62, OS_LOG_TYPE_DEFAULT, "[d %@] [u %{public}@] [%@(%@)] Created plugin", buf, 0x2Au);
    }

    uint64_t v67 = pklog_handle_for_category(6LL, v66);
    v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v118 = v114;
      __int16 v119 = 2112;
      v120 = v36;
      _os_log_impl(&dword_0, v68, OS_LOG_TYPE_INFO, "[d %@] %@", buf, 0x16u);
    }
  }

  self = v36;

  v69 = self;
LABEL_37:

  return v69;
}

+ (id)sandboxOverrideForExtensionPoint:(id)a3 attributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"com.apple.keyboard-service"])
  {
    v4 = @"keyboard";
  }

  else if (([v6 isEqualToString:@"com.apple.app.non-ui-extension"] & 1) != 0 {
         || ([v6 isEqualToString:@"com.apple.app.non-ui-extension.multiple-instances"] & 1) != 0)
  }
  {
    v4 = @"playground-devtools";
  }

  else
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0) {
      goto LABEL_27;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"AudioComponents"]);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      id v11 = v9;
      id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v24;
        v4 = @"keyboard";
        uint64_t v22 = v9;
        while (2)
        {
          uint64_t v14 = 0LL;
          uint64_t v15 = (unint64_t)v12 <= 1 ? 1LL : (uint64_t)v12;
          do
          {
            if (*(void *)v24 != v13) {
              objc_enumerationMutation(v11);
            }
            os_signpost_id_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * v14);
            uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDictionary);
            if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0)
            {
              v4 = 0LL;
LABEL_24:
              int v20 = 1;
              v9 = v22;
              goto LABEL_25;
            }

            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"type"]);
            unsigned __int8 v19 = [v18 isEqual:@"ausp"];

            if ((v19 & 1) != 0) {
              goto LABEL_24;
            }
            ++v14;
          }

          while (v15 != v14);
          id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
          int v20 = 0;
          v9 = v22;
          if (v12) {
            continue;
          }
          break;
        }
      }

      else
      {
        int v20 = 0;
      }

- (NSString)sandboxProfile
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn pluginKey:](self, "pluginKey:", PKSDKInfoKey));
  if (!v3 || (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v3, v4) & 1) == 0))
  {
    sandboxProfile = (__CFString *)self->_sandboxProfile;
    self->_sandboxProfile = (NSString *)@"plugin";
LABEL_12:

    sandboxProfile = @"plugin";
    goto LABEL_13;
  }

  if ([v3 isEqualToString:@"com.apple.usernotifications.service"]
    && -[PKDPlugIn hasEntitlement:]( self,  "hasEntitlement:",  @"com.apple.developer.usernotifications.filtering"))
  {
    v5 = self->_sandboxProfile;
    self->_sandboxProfile = (NSString *)@"silent-nse";
  }

  p_sandboxProfile = (id *)&self->_sandboxProfile;
  if (!self->_sandboxProfile)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn pluginKey:](self, "pluginKey:", PKSandboxProfileKey));
    id v8 = *p_sandboxProfile;
    id *p_sandboxProfile = @"plugin";

    if (v7
      && (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v7, v9) & 1) != 0)
      && [v7 length])
    {
      id v10 = v7;
      id v11 = *p_sandboxProfile;
      id *p_sandboxProfile = v10;
    }

    else
    {
      id v11 = (id)objc_claimAutoreleasedReturnValue(-[PKDPlugIn attributes](self, "attributes"));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[PKDPlugIn sandboxOverrideForExtensionPoint:attributes:]( &OBJC_CLASS___PKDPlugIn,  "sandboxOverrideForExtensionPoint:attributes:",  v3,  v11));
      id v15 = v14;
      if (!v14) {
        id v15 = *p_sandboxProfile;
      }
      objc_storeStrong(p_sandboxProfile, v15);
    }
  }

  sandboxProfile = (__CFString *)*p_sandboxProfile;
  if ([*p_sandboxProfile isEqualToString:@"keyboard"])
  {
    os_signpost_id_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn attribute:](self, "attribute:", @"RequestsOpenAccess"));
    if ([v16 isEqual:&__kCFBooleanTrue])
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn allowedTCCServices](self, "allowedTCCServices"));
      unsigned int v18 = [v17 containsObject:kTCCServiceKeyboardNetwork];
    }

    else
    {
      unsigned int v18 = 0;
    }

    if (v18) {
      goto LABEL_12;
    }
  }

- (id)prunedInfoDictionaryFor:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0LL;
      else {
        uint64_t v9 = (uint64_t)v6;
      }
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        if ((objc_msgSend(v10, "hasPrefix:", @"DT", (void)v13) & 1) == 0)
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v10]);
          [v4 setObject:v11 forKeyedSubscript:v10];
        }

        ++v8;
      }

      while (v9 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v6);
  }

  return v4;
}

- (void)augmentForm:(id)a3 host:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isSandboxed])
  {
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn pluginKey:](self, "pluginKey:", PKSharedResourcesInfoKey));
    if ((-[PKDPlugIn isAppExtension](self, "isAppExtension") & 1) != 0)
    {
      id v10 = v8;
      uint64_t v8 = (os_log_s *)&off_26038;
    }

    else
    {
      uint64_t v11 = pklog_handle_for_category(4LL, v9);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](self, "version"));
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v32 = (uint64_t)v14;
        _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@] [%@(%@)] Not issuing file extension registered as [.] because this is not an app extension; this is unusual.",
          buf,
          0x20u);
      }
    }

    if (v8)
    {
      if (v7)
      {
        [v7 auditToken];
      }

      else
      {
        __int128 v29 = 0u;
        __int128 v30 = 0u;
      }

      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( -[PKDPlugIn issueResourceExtensions:auditToken:]( self,  "issueResourceExtensions:auditToken:",  v8,  &v29));
      if (v15) {
        [v6 setObject:v15 forKeyedSubscript:PKExtensionsFormKey];
      }
    }

    if ((-[PKDPlugIn isData](self, "isData") & 1) == 0)
    {
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn infoKey:](self, "infoKey:", @"CFBundleIdentifier"));
      if (v7)
      {
        [v7 auditToken];
      }

      else
      {
        __int128 v27 = 0u;
        __int128 v28 = 0u;
      }

      uint64_t v17 = pkIssueSandboxExtensionForMachService(v16, &v27);
      unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(v17);
      if (v19)
      {
        [v6 setObject:v19 forKeyedSubscript:PKServiceExtensionFormKey];
      }

      else
      {
        uint64_t v20 = pklog_handle_for_category(4LL, v18);
        unint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[PKDPlugIn augmentForm:host:].cold.1( (uint64_t)self,  (uint64_t)v16,  (uint64_t)v21,  v22,  v23,  v24,  v25,  v26,  v27,  v28,  *((void **)&v28 + 1),  v29,  v30,  *((uint64_t *)&v30 + 1),  *(uint64_t *)buf,  *(uint64_t *)&buf[8],  *(uint64_t *)&buf[16],  v32,  v33,  v34,  v35,  v36);
        }
      }
    }
  }
}

- (id)issueResourceExtensions:(id)a3 auditToken:(id *)a4
{
  id v6 = a3;
  id v7 = &AnalyticsSendEventLazy_ptr;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    id v43 = v6;
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v43, 1LL));

    id v6 = (id)v9;
  }

  id v30 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v6 count]));
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v31 objects:v42 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v32;
    do
    {
      uint64_t v13 = 0LL;
      else {
        uint64_t v14 = (uint64_t)v11;
      }
      do
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v10);
        }
        __int128 v15 = *(void **)(*((void *)&v31 + 1) + 8 * v13);
        uint64_t v16 = objc_opt_class(v7[31]);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        {
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn url](self, "url"));
          if (([v15 isEqualToString:@"."] & 1) == 0)
          {
            uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 URLByAppendingPathComponent:v15]);

            uint64_t v17 = (void *)v18;
            id v7 = &AnalyticsSendEventLazy_ptr;
          }

          __int128 v19 = *(_OWORD *)&a4->var0[4];
          *(_OWORD *)buf = *(_OWORD *)a4->var0;
          *(_OWORD *)&buf[16] = v19;
          uint64_t v20 = pkIssueSandboxExtensionForURL(v17, buf);
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v20);
          if (v22)
          {
            [v30 setObject:v22 forKeyedSubscript:v15];
          }

          else
          {
            uint64_t v23 = pklog_handle_for_category(4LL, v21);
            uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
              __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
              __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](self, "version"));
              int v25 = *__error();
              *(_DWORD *)buf = 138544642;
              *(void *)&uint8_t buf[4] = v29;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v28;
              *(_WORD *)&buf[22] = 2112;
              *(void *)&_BYTE buf[24] = v27;
              __int16 v36 = 2112;
              double v37 = v17;
              __int16 v38 = 2112;
              v39 = v15;
              __int16 v40 = 1024;
              int v41 = v25;
              _os_log_error_impl( &dword_0,  v24,  OS_LOG_TYPE_ERROR,  "[u %{public}@] [%@(%@)] failed to make file extension for [%@] identified as [%@]: %{darwin.errno}d",  buf,  0x3Au);
            }

            id v7 = &AnalyticsSendEventLazy_ptr;
          }
        }

        ++v13;
      }

      while (v14 != v13);
      id v11 = [v10 countByEnumeratingWithState:&v31 objects:v42 count:16];
    }

    while (v11);
  }

  return v30;
}

- (NSString)annotationKey
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn valueForEntitlement:](self, "valueForEntitlement:", PKOverrideEntitlement));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
  }
  id v6 = v5;

  return (NSString *)v6;
}

- (id)diagnose
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PKDPlugIn;
  id v3 = -[PKDPlugIn diagnose](&v17, "diagnose");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v4;
  if (!v4)
  {
    if ((-[PKDPlugIn isData](self, "isData") & 1) != 0
      || (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn dataContainerURL](self, "dataContainerURL")),
          v8,
          v8))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn containingUrl](self, "containingUrl"));

      if (v9) {
        goto LABEL_8;
      }
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn path](self, "path"));
      unsigned __int8 v11 = [v10 hasPrefix:@"/System/"];

      if ((v11 & 1) != 0) {
        goto LABEL_8;
      }
      if (pkUseInternalDiagnostics())
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn path](self, "path"));
        unsigned __int8 v15 = [v14 hasPrefix:@"/AppleInternal/Library/Frameworks/"];

        if ((v15 & 1) != 0)
        {
LABEL_8:
          id v7 = 0LL;
          goto LABEL_9;
        }

        uint64_t v13 = @"plug-ins outside containing apps must be in /System or /AppleInternal/Library/Frameworks. Maybe run 'mobile_install rebuild system user' to register the app containing your plugin with LS?";
      }

      else
      {
        uint64_t v13 = @"plug-ins outside containing apps must be in /System.";
      }
    }

    else if (pkUseInternalDiagnostics())
    {
      uint64_t v13 = @"this plug-in has no sandbox data container. Maybe run 'mobile_install rebuild system user' to register your plugin with LS?";
    }

    else
    {
      uint64_t v13 = @"this plug-in has no sandbox data container.";
    }

    uint64_t v16 = pkError(12LL, v13);
    id v6 = (id)objc_claimAutoreleasedReturnValue(v16);
    goto LABEL_3;
  }

  id v6 = v4;
LABEL_3:
  id v7 = v6;
LABEL_9:

  return v7;
}

- (BOOL)match:(id)a3 discoveryInstanceUUID:(id)a4 server:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v21;
      while (2)
      {
        uint64_t v14 = 0LL;
        else {
          uint64_t v15 = (uint64_t)v12;
        }
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * v14);
          objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v16, (void)v20));
          LODWORD(v16) = -[PKDPlugIn matchKey:pattern:discoveryInstanceUUID:server:]( self,  "matchKey:pattern:discoveryInstanceUUID:server:",  v16,  v17,  v9,  v10);

          if (!(_DWORD)v16)
          {
            BOOL v18 = 0;
            goto LABEL_14;
          }

          ++v14;
        }

        while (v15 != v14);
        id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    BOOL v18 = 1;
LABEL_14:
  }

  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

- (BOOL)matchKey:(id)a3 pattern:(id)a4 discoveryInstanceUUID:(id)a5 server:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 hasPrefix:@"ENTITLEMENT:"])
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v10 substringFromIndex:12]);

    id v15 = (id)objc_claimAutoreleasedReturnValue(-[PKDPlugIn valueForEntitlement:](self, "valueForEntitlement:", v14));
    id v10 = (id)v14;
  }

  else
  {
    if ([v10 hasPrefix:@"LS:"])
    {
      id v15 = 0LL;
      goto LABEL_42;
    }

    else {
      id v15 = 0LL;
    }
    if ([v10 isEqualToString:PKUUIDAttribute])
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
      uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 UUIDString]);

      id v15 = (id)v17;
    }

    if ([v10 isEqualToString:PKUserElectionAttribute])
    {
      BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v13 annotationForPlugIn:self]);
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:PKAnnotationElectionKey]);
      unint64_t v20 = (unint64_t)[v19 integerValue];

      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  v20 & 0xFFFFFFFFFFFF00FFLL));
      uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v21));

      id v15 = (id)v22;
    }

    if ([v10 isEqualToString:PKContainingAppAttribute])
    {
      uint64_t v23 = objc_claimAutoreleasedReturnValue(-[PKDPlugIn containingPath](self, "containingPath"));

      id v15 = (id)v23;
      if (!v23) {
        goto LABEL_40;
      }
    }

    if (!v15)
    {
      id v15 = (id)objc_claimAutoreleasedReturnValue(-[PKDPlugIn attribute:](self, "attribute:", v10));
      if (!v15) {
        id v15 = (id)objc_claimAutoreleasedReturnValue(-[PKDPlugIn infoKey:](self, "infoKey:", v10));
      }
    }
  }

  if (![v11 isEqual:&__kCFBooleanTrue])
  {
    if (![v11 isEqual:&__kCFBooleanFalse])
    {
      if (v15)
      {
        uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v11, v24) & 1) != 0)
        {
          LOBYTE(self) = -[PKDPlugIn matchDictionary:pattern:discoveryInstanceUUID:]( self,  "matchDictionary:pattern:discoveryInstanceUUID:",  v15,  v11,  v12);
          goto LABEL_43;
        }

        uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v15, v25) & 1) != 0)
        {
          LOBYTE(self) = -[PKDPlugIn matchValue:patterns:](self, "matchValue:patterns:", v15, v11);
          goto LABEL_43;
        }

        uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSArray);
        if ((objc_opt_isKindOfClass(v15, v26) & 1) != 0)
        {
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          id v15 = v15;
          id v27 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
          if (v27)
          {
            uint64_t v28 = *(void *)v33;
            while (2)
            {
              uint64_t v29 = 0LL;
              else {
                uint64_t v30 = (uint64_t)v27;
              }
              do
              {
                if (*(void *)v33 != v28) {
                  objc_enumerationMutation(v15);
                }
                if (-[PKDPlugIn matchValue:patterns:]( self,  "matchValue:patterns:",  *(void *)(*((void *)&v32 + 1) + 8 * v29),  v11))
                {

                  goto LABEL_42;
                }

                ++v29;
              }

              while (v30 != v29);
              id v27 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
              if (v27) {
                continue;
              }
              break;
            }
          }
        }
      }

- (BOOL)matchValue:(id)a3 patterns:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    BOOL v9 = -[PKDPlugIn matchValue:pattern:](self, "matchValue:pattern:", v6, v7);
  }

  else
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v7, v10) & 1) != 0)
    {
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      id v11 = v7;
      id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v18;
        while (2)
        {
          uint64_t v14 = 0LL;
          else {
            uint64_t v15 = (uint64_t)v12;
          }
          do
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v11);
            }
            if (-[PKDPlugIn matchValue:pattern:]( self,  "matchValue:pattern:",  v6,  *(void *)(*((void *)&v17 + 1) + 8 * v14),  (void)v17))
            {

              BOOL v9 = 1;
              goto LABEL_17;
            }

            ++v14;
          }

          while (v15 != v14);
          id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
    }

    BOOL v9 = 0;
  }

- (BOOL)matchValue:(id)a3 pattern:(id)a4
{
  id v5 = (__CFString *)a3;
  id v6 = a4;
  if (![v6 hasPrefix:@"?"])
  {
    if ([v6 hasPrefix:@"<>"])
    {
      uint64_t v10 = 0LL;
      char v11 = 1;
      uint64_t v12 = 2LL;
    }

    else if ([v6 hasPrefix:@"<="])
    {
      uint64_t v10 = 1LL;
      uint64_t v12 = 2LL;
      char v11 = 1;
    }

    else if ([v6 hasPrefix:@">="])
    {
      char v11 = 1;
      uint64_t v10 = -1LL;
      uint64_t v12 = 2LL;
    }

    else if ([v6 hasPrefix:@"="])
    {
      uint64_t v10 = 0LL;
      char v11 = 0;
      uint64_t v12 = 1LL;
    }

    else if ([v6 hasPrefix:@"<"])
    {
      char v11 = 0;
      uint64_t v10 = -1LL;
      uint64_t v12 = 1LL;
    }

    else
    {
      char v11 = 0;
      if (![v6 hasPrefix:@">"])
      {
        uint64_t v10 = 0LL;
        goto LABEL_23;
      }

      uint64_t v12 = 1LL;
      uint64_t v10 = 1LL;
    }

    uint64_t v17 = objc_claimAutoreleasedReturnValue([v6 substringFromIndex:v12]);

    id v6 = (id)v17;
LABEL_23:
    char v14 = v11 ^ (v10 == (void)-[__CFString compare:options:](v5, "compare:options:", v6, 64LL));
    goto LABEL_24;
  }

  if ([v6 hasPrefix:@"?UT-CONFORMS:"])
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 substringFromIndex:13]);

    uint64_t v8 = v5;
    BOOL v9 = (const __CFString *)v7;
LABEL_8:
    char v14 = UTTypeConformsTo(v8, v9) != 0;
    id v6 = (id)v7;
    goto LABEL_24;
  }

  if ([v6 hasPrefix:@"?UT-IS:"])
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 substringFromIndex:7]);

    uint64_t v8 = (const __CFString *)v7;
    BOOL v9 = v5;
    goto LABEL_8;
  }

  uint64_t v15 = pklog_handle_for_category(6LL, v13);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[PKDPlugIn matchValue:pattern:].cold.1((uint64_t)v6, v16);
  }

  char v14 = 0;
LABEL_24:

  return v14;
}

- (BOOL)matchDictionary:(id)a3 pattern:(id)a4 discoveryInstanceUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v12 = pklog_handle_for_category(2LL, v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](self, "version"));
    int v33 = 138544386;
    id v34 = v30;
    __int16 v35 = 2112;
    __int16 v36 = v31;
    __int16 v37 = 2112;
    __int16 v38 = v32;
    __int16 v39 = 2112;
    id v40 = v9;
    __int16 v41 = 2112;
    id v42 = v8;
    _os_log_debug_impl( &dword_0,  v13,  OS_LOG_TYPE_DEBUG,  "[u %{public}@] [%@(%@)] evaluating NSExtension filter: %@ value: %@",  (uint8_t *)&v33,  0x34u);
  }

  uint64_t v15 = pklog_handle_for_category(2LL, v14);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, v8);

  uint64_t v19 = pklog_handle_for_category(2LL, v18);
  __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  __int128 v21 = v20;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
    int v33 = 138543875;
    id v34 = v10;
    __int16 v35 = 2114;
    __int16 v36 = v22;
    __int16 v37 = 2113;
    __int16 v38 = v23;
    _os_signpost_emit_with_name_impl( &dword_0,  v21,  OS_SIGNPOST_INTERVAL_BEGIN,  v17,  "NSExtensionDiscoveryFilter",  " discoveryUUID=%{public, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@  identi fier=%{private, signpost.description:attribute}@ ",  (uint8_t *)&v33,  0x20u);
  }

  unsigned int v24 = +[NSExtension evaluateActivationRule:withExtensionItemsRepresentation:]( &OBJC_CLASS___NSExtension,  "evaluateActivationRule:withExtensionItemsRepresentation:",  v8,  v9);
  uint64_t v26 = pklog_handle_for_category(2LL, v25);
  id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  uint64_t v28 = v27;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    int v33 = 67240192;
    LODWORD(v34) = v24;
    _os_signpost_emit_with_name_impl( &dword_0,  v28,  OS_SIGNPOST_INTERVAL_END,  v17,  "NSExtensionDiscoveryFilter",  " success=%{public, signpost.description:attribute}d ",  (uint8_t *)&v33,  8u);
  }

  return v24;
}

- (id)allowForClient:(id)a3 discoveryInstanceUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 entitlementValueForKey:PKAllowedPlugInsEntitlement]);
  if (v8)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
    {
      uint64_t v13 = @"invalid host restriction entitlement";
      goto LABEL_11;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 server]);
    unsigned int v11 = -[PKDPlugIn match:discoveryInstanceUUID:server:](self, "match:discoveryInstanceUUID:server:", v8, v7, v10);

    if (!v11)
    {
      uint64_t v13 = @"the host's plug-in entitlement does not allow this plug-in";
      goto LABEL_11;
    }
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn pluginKey:](self, "pluginKey:", PKHostEntitlementInfoKey));
  if (v12 && ([v6 hasEntitlement:v12] & 1) == 0) {
    uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"the host does not have the %@ entitlement",  v12));
  }
  else {
    uint64_t v13 = 0LL;
  }

LABEL_11:
  return v13;
}

- (id)allowedTCCServices
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn containingUrl](self, "containingUrl"));

  if (v4)
  {
    id v5 = (const __CFURL *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn containingUrl](self, "containingUrl"));
    CFBundleRef v6 = CFBundleCreate(kCFAllocatorDefault, v5);

    if (v6)
    {
      _CFBundleFlushBundleCaches(v6);
      id v8 = (const __CFArray *)TCCAccessCopyInformationForBundle(v6);
      if (v8)
      {
        id v10 = v8;
        if (CFArrayGetCount(v8) >= 1)
        {
          CFIndex v11 = 0LL;
          do
          {
            ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v10, v11);
            Value = (const __CFBoolean *)CFDictionaryGetValue(ValueAtIndex, kTCCInfoGranted);
            if (Value && CFBooleanGetValue(Value)) {
              objc_msgSend(v3, "addObject:", CFDictionaryGetValue(ValueAtIndex, kTCCInfoService));
            }
            ++v11;
          }

          while (v11 < CFArrayGetCount(v10));
        }

        CFRelease(v10);
      }

      else
      {
        uint64_t v21 = pklog_handle_for_category(7LL, v9);
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
          unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](self, "version"));
          int v27 = 138544130;
          uint64_t v28 = v23;
          __int16 v29 = 2112;
          uint64_t v30 = v24;
          __int16 v31 = 2112;
          __int128 v32 = v25;
          __int16 v33 = 2112;
          CFBundleRef v34 = v6;
          _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_INFO,  "[u %{public}@] [%@(%@)] TCCAccessCopyInformationForBundle failed for %@",  (uint8_t *)&v27,  0x2Au);
        }
      }

      CFRelease(v6);
    }

    else
    {
      uint64_t v14 = pklog_handle_for_category(7LL, v7);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
        os_signpost_id_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](self, "version"));
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn url](self, "url"));
        __int128 v20 = (__CFBundle *)objc_claimAutoreleasedReturnValue([v19 path]);
        int v27 = 138544130;
        uint64_t v28 = v16;
        __int16 v29 = 2112;
        uint64_t v30 = v17;
        __int16 v31 = 2112;
        __int128 v32 = v18;
        __int16 v33 = 2112;
        CFBundleRef v34 = v20;
        _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_INFO,  "[u %{public}@] [%@(%@)] failed to create bundle for %@",  (uint8_t *)&v27,  0x2Au);
      }
    }
  }

  return v3;
}

- (BOOL)enableForClient:(id)a3 environment:(id)a4 languages:(id)a5 oneShotUUID:(id)a6 persona:(id)a7 sandbox:(id)a8 pid:(int *)a9 error:(id *)a10
{
  id v194 = a3;
  id v16 = a4;
  id v189 = a5;
  id v188 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v21 = v18;
  if (!v18) {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn sandboxProfile](self, "sandboxProfile"));
  }
  id v197 = v21;
  if (!v18) {

  }
  if (v16) {
    [v19 addEntriesFromDictionary:v16];
  }
  unsigned int v22 = -[PKDPlugIn usesHostPersona](self, "usesHostPersona");
  if (v17) {
    int v23 = 1;
  }
  else {
    int v23 = v22;
  }
  if (v23 == 1) {
    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn dataContainerURLForPersona:](self, "dataContainerURLForPersona:", v17));
  }
  else {
    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn dataContainerURL](self, "dataContainerURL"));
  }
  id v25 = v24;

  v195 = v19;
  v196 = v20;
  v193 = v25;
  int v190 = v23;
  if (v25)
  {
    int v27 = (void *)objc_claimAutoreleasedReturnValue([v25 path]);
    [v19 setObject:v27 forKeyedSubscript:@"HOME"];

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v25 path]);
    [v19 setObject:v28 forKeyedSubscript:@"CFFIXED_USER_HOME"];

    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v25 URLByAppendingPathComponent:@"tmp"]);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 path]);
    [v19 setObject:v30 forKeyedSubscript:@"TMPDIR"];

    if (!v23) {
      goto LABEL_21;
    }
    uint64_t v32 = pklog_handle_for_category(7LL, v31);
    __int16 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      CFBundleRef v34 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
      __int16 v35 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](self, "version"));
      __int16 v37 = (void *)objc_claimAutoreleasedReturnValue([v193 path]);
      *(_DWORD *)buf = 138544130;
      v201 = v34;
      __int16 v202 = 2112;
      v203 = v35;
      __int16 v204 = 2112;
      uint64_t v205 = (uint64_t)v36;
      __int16 v206 = 2112;
      *(void *)v207 = v37;
      _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@] [%@(%@)] setting sandbox container to %@",  buf,  0x2Au);

      uint64_t v19 = v195;
      __int128 v20 = v196;
    }

    __int16 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue([v193 path]);
    [v20 setObject:v38 forKeyedSubscript:@"_SandboxContainer"];
  }

  else
  {
    uint64_t v39 = pklog_handle_for_category(7LL, v26);
    __int16 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[PKDPlugIn enableForClient:environment:languages:oneShotUUID:persona:sandbox:pid:error:].cold.4(self);
    }
  }

LABEL_21:
  id v40 = getenv("PKTEST_SDK");
  __int16 v41 = &AnalyticsSendEventLazy_ptr;
  if (v40)
  {
    id v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v40));
    [v19 setObject:v42 forKeyedSubscript:@"PKTEST_SDK"];
  }

  uint64_t v43 = objc_claimAutoreleasedReturnValue(-[PKDPlugIn infoKey:](self, "infoKey:", @"XPCService"));
  v192 = (void *)v43;
  if (v43 && (uint64_t v45 = v43, v46 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v45, v46) & 1) != 0))
  {
    [v20 addEntriesFromDictionary:v45];
  }

  else
  {
    uint64_t v47 = pklog_handle_for_category(7LL, v44);
    uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](self, "version"));
      *(_DWORD *)buf = 138544130;
      v201 = v49;
      __int16 v202 = 2112;
      v203 = v50;
      __int16 v204 = 2112;
      uint64_t v205 = (uint64_t)v51;
      __int16 v206 = 2112;
      *(void *)v207 = v192;
      _os_log_impl( &dword_0,  v48,  OS_LOG_TYPE_INFO,  "[u %{public}@] [%@(%@)] no XPCService for plug-in; database returned %@",
        buf,
        0x2Au);

      __int128 v20 = v196;
      __int16 v41 = &AnalyticsSendEventLazy_ptr;
    }
  }

  uint64_t v52 = objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"EnvironmentVariables"]);
  if (v52) {
    [v19 addEntriesFromDictionary:v52];
  }
  v184 = (void *)v52;
  [v20 setObject:v19 forKeyedSubscript:@"EnvironmentVariables"];
  if (v197)
  {
    [v20 setObject:v197 forKeyedSubscript:@"_SandboxProfile"];
    [v20 setObject:&__kCFBooleanTrue forKeyedSubscript:@"_OmitSandboxParameters"];
    uint64_t v54 = pklog_handle_for_category(7LL, v53);
    v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](self, "version"));
      *(_DWORD *)buf = 138544130;
      v201 = v56;
      __int16 v202 = 2112;
      v203 = v57;
      __int16 v204 = 2112;
      uint64_t v205 = (uint64_t)v58;
      __int16 v206 = 2112;
      *(void *)v207 = v197;
      _os_log_impl( &dword_0,  v55,  OS_LOG_TYPE_INFO,  "[u %{public}@] [%@(%@)] assigning plug-in to [%@] sandbox",  buf,  0x2Au);

      __int128 v20 = v196;
      __int16 v41 = &AnalyticsSendEventLazy_ptr;
    }
  }

  uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[PKDPlugIn platform](self, "platform")));
  [v20 setObject:v59 forKeyedSubscript:@"Platform"];

  uint64_t v60 = objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"_MultipleInstances"]);
  v185 = v17;
  id v186 = v18;
  v183 = (void *)v60;
  if (v60
    && (v62 = (void *)v60, uint64_t v63 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v62, v63) & 1) != 0))
  {
    unsigned int v64 = [v62 BOOLValue];
  }

  else
  {
    unsigned int v64 = 0;
  }

  uint64_t v65 = pklog_handle_for_category(7LL, v61);
  uint64_t v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
    uint64_t v69 = objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](self, "version"));
    v70 = (void *)v69;
    *(_DWORD *)buf = 138544130;
    v201 = v67;
    if (v64) {
      v71 = "is";
    }
    else {
      v71 = "is not";
    }
    __int16 v202 = 2112;
    v203 = v68;
    __int16 v204 = 2112;
    uint64_t v205 = v69;
    __int16 v206 = 2080;
    *(void *)v207 = v71;
    _os_log_impl(&dword_0, v66, OS_LOG_TYPE_INFO, "[u %{public}@] [%@(%@)] %s multi-instance", buf, 0x2Au);

    uint64_t v19 = v195;
    __int128 v20 = v196;

    __int16 v41 = &AnalyticsSendEventLazy_ptr;
  }

  uint64_t v73 = objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"ServiceType"]);
  v182 = (void *)v73;
  if (v73)
  {
    uint64_t v74 = objc_opt_class(v41[31]);
    if ((objc_opt_isKindOfClass(v73, v74) & 1) != 0) {
      LODWORD(v73) = [(id)v73 isEqualToString:@"System"];
    }
    else {
      LODWORD(v73) = 0;
    }
  }

  v179 = a10;
  uint64_t v75 = pklog_handle_for_category(7LL, v72);
  v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
  if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
  {
    uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
    uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
    uint64_t v79 = objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](self, "version"));
    uint64_t v80 = (void *)v79;
    *(_DWORD *)buf = 138544130;
    v201 = v77;
    if ((_DWORD)v73) {
      uint64_t v81 = "is";
    }
    else {
      uint64_t v81 = "is not";
    }
    __int16 v202 = 2112;
    v203 = v78;
    __int16 v204 = 2112;
    uint64_t v205 = v79;
    __int16 v206 = 2080;
    *(void *)v207 = v81;
    _os_log_impl(&dword_0, v76, OS_LOG_TYPE_INFO, "[u %{public}@] [%@(%@)] %s a system service", buf, 0x2Au);

    uint64_t v19 = v195;
    __int128 v20 = v196;
  }

  v181 = v16;
  if ((v190 & v73) != 1)
  {
    v191 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v191, "setObject:forKeyedSubscript:", v20, @"XPCService");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v191,  "setObject:forKeyedSubscript:",  @"XPC!",  @"CFBundlePackageType");
    if (-[PKDPlugIn isRBManaged](self, "isRBManaged")) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v191,  "setObject:forKeyedSubscript:",  &off_26050,  @"RunningBoard");
    }
    uint64_t v91 = pklog_handle_for_category(7LL, v90);
    id v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      id v93 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
      id v94 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
      id v95 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](self, "version"));
      unsigned int v96 = -[PKDPlugIn isRBManaged](self, "isRBManaged");
      id v97 = "not be";
      *(_DWORD *)buf = 138544130;
      v201 = v93;
      __int16 v202 = 2112;
      v203 = v94;
      if (v96) {
        id v97 = "be";
      }
      __int16 v204 = 2112;
      uint64_t v205 = (uint64_t)v95;
      __int16 v206 = 2080;
      *(void *)v207 = v97;
      _os_log_impl( &dword_0,  v92,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@] [%@(%@)] will %s managed by runningboard",  buf,  0x2Au);

      uint64_t v19 = v195;
      __int128 v20 = v196;
    }

    uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn url](self, "url"));
    v178 = -[PKBundle initWithURL:](objc_alloc(&OBJC_CLASS___PKBundle), "initWithURL:", v86);
    id v99 = (void *)objc_claimAutoreleasedReturnValue(-[PKBundle executablePath](v178, "executablePath"));
    if (!v99)
    {
      uint64_t v118 = pklog_handle_for_category(7LL, v98);
      __int16 v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(v118);
      if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
        -[PKDPlugIn enableForClient:environment:languages:oneShotUUID:persona:sandbox:pid:error:].cold.2(self);
      }

      if (a10)
      {
        v120 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
        __int16 v121 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
        v171 = (void *)objc_claimAutoreleasedReturnValue([v121 UUIDString]);
        uint64_t v122 = pkErrorf(4LL, @"cannot obtain executable path for plug-in %@(%@)");
        *a10 = (id)objc_claimAutoreleasedReturnValue(v122);
      }

      BOOL v89 = 0;
      goto LABEL_113;
    }

    uint64_t v177 = (uint64_t)v86;
    if ((v73 & 1) == 0 && [v189 count])
    {
      id v100 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      id v101 = objc_alloc(&OBJC_CLASS___NSString);
      v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "componentsJoinedByString:", @"\", \""));
      v103 = -[NSString initWithFormat:](v101, "initWithFormat:", @"(%@)", v102);

      -[NSMutableArray setObject:atIndexedSubscript:](v100, "setObject:atIndexedSubscript:", v99, 0LL);
      -[NSMutableArray setObject:atIndexedSubscript:]( v100,  "setObject:atIndexedSubscript:",  @"-AppleLanguages",  1LL);
      -[NSMutableArray setObject:atIndexedSubscript:](v100, "setObject:atIndexedSubscript:", v103, 2LL);
      [v196 setObject:v100 forKeyedSubscript:@"ProgramArguments"];
    }

    uint64_t v104 = pklog_handle_for_category(7LL, v98);
    v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v104);
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
      v107 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
      uint64_t v108 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](self, "version"));
      unsigned int v109 = [v194 pid];
      id v110 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn path](self, "path"));
      *(_DWORD *)buf = 138544386;
      v201 = v106;
      __int16 v202 = 2112;
      v203 = v107;
      __int16 v204 = 2112;
      uint64_t v205 = (uint64_t)v108;
      __int16 v206 = 1024;
      *(_DWORD *)v207 = v109;
      *(_WORD *)&v207[4] = 2112;
      *(void *)&v207[6] = v110;
      _os_log_impl( &dword_0,  v105,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@] [%@(%@)] Allowing host pid %d to use plugin [%@]",  buf,  0x30u);

      id v18 = v186;
    }

    uint64_t v112 = pklog_handle_for_category(7LL, v111);
    v113 = (os_log_s *)objc_claimAutoreleasedReturnValue(v112);
    if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
    {
      id v114 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
      v115 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
      objc_super v116 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](self, "version"));
      *(_DWORD *)buf = 138544130;
      v201 = v114;
      __int16 v202 = 2112;
      v203 = v115;
      __int16 v204 = 2112;
      uint64_t v205 = (uint64_t)v116;
      __int16 v206 = 2112;
      *(void *)v207 = v191;
      _os_log_impl(&dword_0, v113, OS_LOG_TYPE_INFO, "[u %{public}@] [%@(%@)] Overlay: %@", buf, 0x2Au);
    }

    if (objc_opt_class(&OBJC_CLASS___RBSLaunchContext))
    {
      if ((v73 & 1) != 0) {
        v117 = 0LL;
      }
      else {
        v117 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessIdentifier identifierWithPid:]( RBSProcessIdentifier,  "identifierWithPid:",  [v194 pid]));
      }
      id v187 = v117;
      if ((v73 & 1) == 0) {

      }
      char v131 = _os_feature_enabled_impl("RunningBoard", "break_pk_dep");
      v132 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
      if ((v131 & 1) != 0)
      {
        v133 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn containingUrl](self, "containingUrl"));
        uint64_t v134 = objc_claimAutoreleasedReturnValue( +[RBSProcessIdentity extensionIdentityForPlugInKitIdentifier:bundledURL:hostIdentifier:UUID:]( &OBJC_CLASS___RBSProcessIdentity,  "extensionIdentityForPlugInKitIdentifier:bundledURL:hostIdentifier:UUID:",  v132,  v133,  v187,  v188));
      }

      else
      {
        uint64_t v134 = objc_claimAutoreleasedReturnValue( +[RBSProcessIdentity extensionIdentityForPlugInKitIdentifier:hostIdentifier:UUID:]( &OBJC_CLASS___RBSProcessIdentity,  "extensionIdentityForPlugInKitIdentifier:hostIdentifier:UUID:",  v132,  v187,  v188));
      }

      *((void *)&v176 + 1) = v134;
      v135 = (void *)objc_claimAutoreleasedReturnValue( +[RBSLaunchContext contextWithIdentity:]( &OBJC_CLASS___RBSLaunchContext,  "contextWithIdentity:",  v134));
      objc_msgSend(v135, "setHostPid:", objc_msgSend(v194, "pid"));
      [v135 setExtensionOverlay:v191];
      [v135 _setOverrideExecutablePath:v99];
      v136 = objc_alloc(&OBJC_CLASS___NSString);
      v137 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
      v173 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
      id v174 = [v194 pid];
      uint8_t v170 = v137;
      v138 = -[NSString initWithFormat:](v136, "initWithFormat:", @"Launching extension %@(%@) for host %d");
      [v135 setExplanation:v138];

      id v139 = [[RBSLaunchRequest alloc] initWithContext:v135];
      id v198 = 0LL;
      id v199 = 0LL;
      unsigned __int8 v140 = [v139 execute:&v199 error:&v198];
      id v141 = v199;
      id v142 = v198;
      v144 = v142;
      if ((v140 & 1) != 0)
      {
        id v180 = v142;
        if (a9) {
          *a9 = [v141 pid];
        }
        uint64_t v145 = pklog_handle_for_category(7LL, v143);
        v146 = (os_log_s *)objc_claimAutoreleasedReturnValue(v145);
        if (os_log_type_enabled(v146, OS_LOG_TYPE_INFO))
        {
          v147 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
          v148 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
          v149 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](self, "version"));
          *(_DWORD *)buf = 138544130;
          v201 = v147;
          __int16 v202 = 2112;
          v203 = v148;
          __int16 v204 = 2112;
          uint64_t v205 = (uint64_t)v149;
          __int16 v206 = 2112;
          *(void *)v207 = v141;
          _os_log_impl( &dword_0,  v146,  OS_LOG_TYPE_INFO,  "[u %{public}@] [%@(%@)] launched request for plug-in, process handle: %@",  buf,  0x2Au);
        }

        v144 = v180;
      }

      else
      {
        uint64_t v150 = pklog_handle_for_category(7LL, v143);
        v151 = (os_log_s *)objc_claimAutoreleasedReturnValue(v150);
        if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR)) {
          -[PKDPlugIn enableForClient:environment:languages:oneShotUUID:persona:sandbox:pid:error:].cold.3( (uint64_t)self,  (uint64_t)v144,  (uint64_t)v151,  v152,  v153,  v154,  v155,  v156,  v170,  (uint64_t)v173,  (uint64_t)v174,  v175,  v176,  v177,  (uint64_t)v178,  (uint64_t)a10,  (uint64_t)v181,  (uint64_t)v182,  (uint64_t)v183,  (uint64_t)v184,  (uint64_t)v185,  (uint64_t)v187,  (uint64_t)v188);
        }

        if (!v179)
        {
LABEL_103:

          __int128 v20 = v196;
          if ((v140 & 1) != 0)
          {
LABEL_104:
            BOOL v89 = 1;
LABEL_112:
            uint64_t v19 = v195;
            uint64_t v86 = (void *)v177;
LABEL_113:
            uint64_t v87 = v178;

            goto LABEL_114;
          }

- (id)_personaIDForClient:(id)a3 requestedPersona:(id)a4
{
  if (!+[PKDPersona personasAreSupported](&OBJC_CLASS___PKDPersona, "personasAreSupported", a3, a4)) {
    return 0LL;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn valueForEntitlement:](self, "valueForEntitlement:", PKPersonaEntitlement));
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      if ([v5 isEqualToString:PKPersonaEntitlementNoneValue])
      {
        uint64_t v8 = pklog_handle_for_category(13LL, v7);
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
          CFIndex v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](self, "version"));
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v10;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v11;
          *(_WORD *)&buf[22] = 2112;
          *(void *)&_BYTE buf[24] = v12;
          _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@] [%@(%@)] will launch with system-defined policy by entitlement",  buf,  0x20u);
        }

        id v13 = 0LL;
        goto LABEL_27;
      }

      if ([v5 isEqualToString:PKPersonaEntitlementSystemValue])
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn personaCache](self, "personaCache"));
        id v13 = (id)objc_claimAutoreleasedReturnValue([v15 systemPersonaID]);

        uint64_t v17 = pklog_handle_for_category(13LL, v16);
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](self, "version"));
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v18;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v19;
          *(_WORD *)&buf[22] = 2112;
          *(void *)&_BYTE buf[24] = v20;
          LOWORD(v67) = 2112;
          *(void *)((char *)&v67 + 2) = v13;
          uint64_t v21 = "[u %{public}@] [%@(%@)] assigning to system persona ID %@ by entitlement";
LABEL_16:
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, v21, buf, 0x2Au);

          goto LABEL_27;
        }

        goto LABEL_27;
      }

      if ([v5 isEqualToString:PKPersonaEntitlementPersonalValue])
      {
        unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn personaCache](self, "personaCache"));
        id v13 = (id)objc_claimAutoreleasedReturnValue([v22 personalPersonaID]);

        uint64_t v24 = pklog_handle_for_category(13LL, v23);
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](self, "version"));
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v18;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v19;
          *(_WORD *)&buf[22] = 2112;
          *(void *)&_BYTE buf[24] = v20;
          LOWORD(v67) = 2112;
          *(void *)((char *)&v67 + 2) = v13;
          uint64_t v21 = "[u %{public}@] [%@(%@)] assigning to personal persona ID %@ by entitlement";
          goto LABEL_16;
        }

- (id)checkBusy
{
  if (!objc_opt_class(&OBJC_CLASS___BKSProcess)) {
    goto LABEL_22;
  }
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn infoKey:](self, "infoKey:", @"CFBundleIdentifier"));
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v4));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKSProcess busyExtensionInstances:](&OBJC_CLASS___BKSProcess, "busyExtensionInstances:", v6));
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v8)
  {
    uint64_t v21 = self;
    unsigned int v22 = v6;
    uint64_t v23 = v5;
    uint64_t v9 = *(void *)v27;
    uint64_t v10 = BKSProcessExtensionPropertyBundleID;
    CFIndex v11 = (const char *)launch_extension_property_bundle_id;
    do
    {
      uint64_t v12 = 0LL;
      else {
        uint64_t v13 = (uint64_t)v8;
      }
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v26 + 1) + 8 * v12) objectForKeyedSubscript:v10]);
        if (v15)
        {
          xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
          xpc_dictionary_set_string(v2, v11, (const char *)[v15 UTF8String]);

          int v19 = 0;
          goto LABEL_19;
        }

        uint64_t v16 = pklog_handle_for_category(11LL, v14);
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v25 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](v21, "uuid"));
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](v21, "identifier"));
          id v18 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](v21, "version"));
          *(_DWORD *)buf = 138543874;
          uint64_t v31 = v25;
          __int16 v32 = 2112;
          uint64_t v33 = v24;
          __int16 v34 = 2112;
          uint64_t v35 = v18;
          _os_log_error_impl( &dword_0,  v17,  OS_LOG_TYPE_ERROR,  "[u %{public}@] [%@(%@)] assertiond reported incomplete bundle",  buf,  0x20u);
        }

        ++v12;
      }

      while (v13 != v12);
      id v8 = [v7 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }

    while (v8);
    int v19 = 1;
LABEL_19:
    uint64_t v6 = v22;
    id v5 = v23;
  }

  else
  {
    int v19 = 1;
  }

  if (v19) {
LABEL_22:
  }
    xpc_object_t v2 = 0LL;
  return v2;
}

- (id)debugDescription
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PKDPlugIn;
  id v3 = -[PKDPlugIn description](&v7, "description");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<PKDPlugIn: %p; core = %@, fileID = %@, launchFileID = %@>",
                   self,
                   v4,
                   self->_fileID,
                   self->_launchFileID));

  return v5;
}

- (NSDictionary)infoPlist
{
  return (NSDictionary *)objc_getProperty(self, a2, 192LL, 1);
}

- (PKDPersonaCache)personaCache
{
  return (PKDPersonaCache *)objc_getProperty(self, a2, 208LL, 1);
}

- (BOOL)isRBManaged
{
  return self->_isRBManaged;
}

- (void)setIsRBManaged:(BOOL)a3
{
  self->_isRBManaged = a3;
}

- (unsigned)platform
{
  return self->_platform;
}

- (NSNumber)containerAgeRestriction
{
  return (NSNumber *)objc_getProperty(self, a2, 216LL, 1);
}

- (BOOL)ageRestricted
{
  return self->_ageRestricted;
}

- (NSObject)fileID
{
  return objc_getProperty(self, a2, 224LL, 1);
}

- (NSObject)launchFileID
{
  return objc_getProperty(self, a2, 232LL, 1);
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

  ;
}

- (id)launchdIdentifier
{
  return (id)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
}

- (id)launchdVersion
{
  return (id)objc_claimAutoreleasedReturnValue(-[PKDPlugIn infoKey:](self, "infoKey:", @"CFBundleVersion"));
}

- (void)initWithLSData:(uint64_t)a3 personaCache:(uint64_t)a4 discoveryInstanceUUID:(uint64_t)a5 extensionPointCache:(uint64_t)a6 externalProviders:(uint64_t)a7 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint8_t a9,  uint64_t a10,  uint64_t a11,  uint64_t a12,  uint64_t a13,  uint64_t a14,  uint64_t a15,  uint64_t a16,  uint64_t a17,  uint64_t a18,  uint64_t a19,  uint64_t a20,  uint64_t a21,  uint64_t a22,  uint64_t a23,  uint64_t a24)
{
  a23 = v24;
  a24 = v25;
  __int128 v27 = v26;
  __int128 v29 = v28;
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v28 pluginUUID]);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v29 pluginIdentifier]);
  objc_claimAutoreleasedReturnValue([v29 bundleVersion]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5(&dword_0, v27, v32, "[d %@] [u %{public}@] [%@(%@)] rejecting; No bundle URL from LS.", &a9);

  OUTLINED_FUNCTION_0_1();
}

- (void)initWithLSData:(uint64_t)a3 personaCache:(uint64_t)a4 discoveryInstanceUUID:(uint64_t)a5 extensionPointCache:(uint64_t)a6 externalProviders:(uint64_t)a7 .cold.2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint8_t a9,  uint64_t a10,  uint64_t a11,  uint64_t a12,  uint64_t a13,  uint64_t a14,  uint64_t a15,  uint64_t a16,  uint64_t a17,  uint64_t a18,  uint64_t a19,  uint64_t a20,  uint64_t a21,  uint64_t a22,  uint64_t a23,  uint64_t a24)
{
  a23 = v24;
  a24 = v25;
  __int128 v27 = v26;
  __int128 v29 = v28;
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v28 pluginUUID]);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v29 pluginIdentifier]);
  objc_claimAutoreleasedReturnValue([v29 bundleVersion]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5(&dword_0, v27, v32, "[d %@] [u %{public}@] [%@(%@)] extensionPointPlatform == 0", &a9);

  OUTLINED_FUNCTION_0_1();
}

- (void)augmentForm:(uint64_t)a3 host:(uint64_t)a4 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  __int128 a9,  uint64_t a10,  void *a11,  __int128 a12,  uint64_t a13,  uint64_t a14,  uint64_t a15,  uint64_t a16,  uint64_t a17,  uint64_t a18,  uint64_t a19,  uint64_t a20,  uint64_t a21,  uint64_t a22)
{
  a21 = v22;
  a22 = v23;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  __int128 v29 = v28;
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v28 uuid]);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v29 identifier]);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v29 version]);
  __error();
  LODWORD(a9) = 138544386;
  *(void *)((char *)&a9 + 4) = v30;
  OUTLINED_FUNCTION_11();
  a11 = v32;
  LOWORD(a12) = v33;
  *(void *)((char *)&a12 + 2) = v27;
  WORD5(a12) = 1024;
  HIDWORD(a12) = v34;
  _os_log_error_impl( &dword_0,  v25,  OS_LOG_TYPE_ERROR,  "[u %{public}@] [%@(%@)] failed to make mach extension for [%@]: %{darwin.errno}d",  (uint8_t *)&a9,  0x30u);

  OUTLINED_FUNCTION_0_1();
}

- (void)matchValue:(uint64_t)a1 pattern:(os_log_s *)a2 .cold.1(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "unrecognized match operator:%@", (uint8_t *)&v2, 0xCu);
}

- (void)_dataContainerURLForPersona:(uint64_t)a3 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint8_t a9,  uint64_t a10,  uint64_t a11,  uint64_t a12,  __int128 a13,  uint64_t a14,  uint64_t a15,  uint64_t a16,  uint64_t a17,  uint64_t a18,  uint64_t a19,  uint64_t a20,  uint64_t a21,  uint64_t a22,  uint64_t a23)
{
  a22 = v28;
  a23 = v29;
  OUTLINED_FUNCTION_7();
  objc_claimAutoreleasedReturnValue([v30 uuid]);
  id v31 = [(id)OUTLINED_FUNCTION_12() identifier];
  objc_claimAutoreleasedReturnValue(v31);
  id v32 = [(id)OUTLINED_FUNCTION_10() version];
  objc_claimAutoreleasedReturnValue(v32);
  OUTLINED_FUNCTION_4_0();
  LOWORD(a13) = 2080;
  *(void *)((char *)&a13 + 2) = v24;
  OUTLINED_FUNCTION_5(&dword_0, v23, v33, "[u %{public}@] [%@(%@)] Failed to get container path; error = %s", &a9);

  OUTLINED_FUNCTION_0_1();
}

- (void)enableForClient:(void *)a1 environment:languages:oneShotUUID:persona:sandbox:pid:error:.cold.1( void *a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue([a1 uuid]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 identifier]);
  objc_claimAutoreleasedReturnValue([a1 version]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0( &dword_0,  v4,  v5,  "[u %{public}@] [%@(%@)] persona specified but disallowed for system extension",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_6();
}

- (void)enableForClient:(void *)a1 environment:languages:oneShotUUID:persona:sandbox:pid:error:.cold.2( void *a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue([a1 uuid]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 identifier]);
  objc_claimAutoreleasedReturnValue([a1 version]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_0, v4, v5, "[u %{public}@] [%@(%@)] failed to obtain execPath", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_6();
}

- (void)enableForClient:(uint64_t)a3 environment:(uint64_t)a4 languages:(uint64_t)a5 oneShotUUID:(uint64_t)a6 persona:(uint64_t)a7 sandbox:(uint64_t)a8 pid:(uint8_t)a9 error:(uint64_t)a10 .cold.3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint8_t a9,  uint64_t a10,  uint64_t a11,  uint64_t a12,  __int128 a13,  uint64_t a14,  uint64_t a15,  uint64_t a16,  uint64_t a17,  uint64_t a18,  uint64_t a19,  uint64_t a20,  uint64_t a21,  uint64_t a22,  uint64_t a23)
{
  a22 = v28;
  a23 = v29;
  OUTLINED_FUNCTION_7();
  objc_claimAutoreleasedReturnValue([v30 uuid]);
  id v31 = [(id)OUTLINED_FUNCTION_12() identifier];
  objc_claimAutoreleasedReturnValue(v31);
  id v32 = [(id)OUTLINED_FUNCTION_10() version];
  objc_claimAutoreleasedReturnValue(v32);
  OUTLINED_FUNCTION_4_0();
  LOWORD(a13) = v33;
  *(void *)((char *)&a13 + 2) = v24;
  OUTLINED_FUNCTION_5( &dword_0,  v23,  v34,  "[u %{public}@] [%@(%@)] RBSLaunchRequest error trying to launch plug-in: %@",  &a9);

  OUTLINED_FUNCTION_0_1();
}

- (void)enableForClient:(void *)a1 environment:languages:oneShotUUID:persona:sandbox:pid:error:.cold.4( void *a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue([a1 uuid]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 identifier]);
  objc_claimAutoreleasedReturnValue([a1 version]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_0, v4, v5, "[u %{public}@] [%@(%@)] no data container", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_6();
}

- (void)_personaIDForClient:(uint64_t)a3 requestedPersona:(uint64_t)a4 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  __int128 a9,  int a10,  __int16 a11,  __int16 a12,  void *a13,  __int128 a14,  uint64_t a15,  uint64_t a16,  uint64_t a17,  uint64_t a18,  uint64_t a19,  uint64_t a20,  uint64_t a21,  uint64_t a22,  uint64_t a23,  uint64_t a24)
{
  a23 = v26;
  a24 = v27;
  uint64_t v29 = v28;
  id v31 = v30;
  id v32 = (void *)objc_claimAutoreleasedReturnValue([v30 uuid]);
  objc_claimAutoreleasedReturnValue([v31 identifier]);
  id v33 = [(id)OUTLINED_FUNCTION_12() version];
  objc_claimAutoreleasedReturnValue(v33);
  id v34 = [(id)OUTLINED_FUNCTION_10() containingBundleIdentifier];
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  LODWORD(a9) = 138544130;
  *(void *)((char *)&a9 + 4) = v32;
  WORD6(a9) = 2112;
  *(void *)((char *)&a9 + 14) = v24;
  a12 = 2112;
  a13 = v25;
  LOWORD(a14) = 2112;
  *(void *)((char *)&a14 + 2) = v35;
  OUTLINED_FUNCTION_9( &dword_0,  v29,  v36,  "[u %{public}@] [%@(%@)] Containing bundle [%@] is associated with more than one persona. Choosing one at random.",  (uint8_t *)&a9);

  OUTLINED_FUNCTION_0_1();
}

- (void)_personaIDForClient:(uint64_t)a3 requestedPersona:(uint64_t)a4 .cold.2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  __int128 a9,  uint64_t a10,  uint64_t a11,  __int128 a12,  uint64_t a13,  uint64_t a14,  uint64_t a15,  uint64_t a16,  uint64_t a17,  uint64_t a18,  uint64_t a19,  uint64_t a20,  uint64_t a21,  uint64_t a22)
{
  a21 = v25;
  a22 = v26;
  OUTLINED_FUNCTION_7();
  objc_claimAutoreleasedReturnValue([v27 uuid]);
  id v28 = [(id)OUTLINED_FUNCTION_12() identifier];
  objc_claimAutoreleasedReturnValue(v28);
  id v29 = [(id)OUTLINED_FUNCTION_10() version];
  id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  LODWORD(a9) = 138544130;
  *(void *)((char *)&a9 + 4) = v23;
  OUTLINED_FUNCTION_11();
  a11 = v31;
  LOWORD(a12) = v32;
  *(void *)((char *)&a12 + 2) = v33;
  OUTLINED_FUNCTION_9( &dword_0,  v22,  v34,  "[u %{public}@] [%@(%@)] failed for get personas for bundle identifier: %@",  (uint8_t *)&a9);

  OUTLINED_FUNCTION_0_1();
}

@end