@interface PKPlugInCore
+ (id)readSDKDictionary:(id)a3 forPlatform:(unsigned int)a4 externalProviders:(id)a5;
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)isAppExtension;
- (BOOL)isData;
- (BOOL)isDedicated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHybrid;
- (BOOL)isMultiplexed;
- (BOOL)isRBManaged;
- (BOOL)oldStyle;
- (BOOL)onSystemVolume;
- (BOOL)setDictionaries:(id)a3;
- (BOOL)setupWithForm:(id)a3;
- (BOOL)setupWithName:(id)a3 extensionPointPlatform:(unsigned int)a4 url:(id)a5 bundleInfo:(id)a6 uuid:(id)a7 discoveryInstanceUUID:(id)a8 extensionPointCache:(id)a9;
- (BOOL)shouldTerminateOnHold;
- (BOOL)useBundle:(id)a3 error:(id *)a4;
- (BOOL)usesHostPersona;
- (NSArray)launchPersonas;
- (NSData)cdhash;
- (NSDate)timestamp;
- (NSDictionary)annotations;
- (NSDictionary)attributes;
- (NSDictionary)bundleInfoDictionary;
- (NSDictionary)entitlements;
- (NSDictionary)localizedFileProviderActionNames;
- (NSDictionary)plugInDictionary;
- (NSString)bootInstance;
- (NSString)containingBundleIdentifier;
- (NSString)containingPath;
- (NSString)identifier;
- (NSString)localizedContainingName;
- (NSString)localizedName;
- (NSString)localizedShortName;
- (NSString)originalIdentifier;
- (NSString)path;
- (NSString)principalSpec;
- (NSString)requirement;
- (NSString)sdkSpec;
- (NSString)version;
- (NSURL)containingUrl;
- (NSURL)dataContainerURL;
- (NSURL)url;
- (NSUUID)discoveryInstanceUUID;
- (NSUUID)uuid;
- (PKExternalProviders)external;
- (PKPlugInCore)init;
- (PKPlugInCore)initWithExternalProviders:(id)a3;
- (PKPlugInCore)initWithForm:(id)a3 externalProviders:(id)a4;
- (PKPlugInCore)initWithName:(id)a3 extensionPointPlatform:(unsigned int)a4 url:(id)a5 bundleInfo:(id)a6 uuid:(id)a7 discoveryInstanceUUID:(id)a8 extensionPointCache:(id)a9 externalProviders:(id)a10;
- (id)_localizedFileProviderActionNamesForPKDict:(id)a3 fromBundle:(id)a4;
- (id)attribute:(id)a3;
- (id)augmentInterface:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)diagnose;
- (id)embeddedCodePath;
- (id)embeddedProtocolSpec;
- (id)export:(id *)a3;
- (id)infoKey:(id)a3;
- (id)mergeSDKDictionary:(id)a3 intoExtensionDictionary:(id)a4;
- (id)mergeSharedResources:(id)a3 into:(id)a4;
- (id)normalizeInfoDictionary:(id)a3;
- (id)pluginKey:(id)a3;
- (id)protocolSpec;
- (id)resolveSDKWithInfoPlist:(id)a3 extensionPointCache:(id)a4;
- (id)sdkOnlyKeyPaths;
- (id)valueForEntitlement:(id)a3;
- (int64_t)lastModified;
- (unint64_t)annotationTimestamp;
- (unint64_t)hash;
- (unint64_t)hubProtocolVersion;
- (unsigned)extensionPointPlatform;
- (void)_loadLocalizedFileProviderActionNames;
- (void)_loadLocalizedNames;
- (void)canonicalize;
- (void)localizedInfoDictionaryForKeys:(id)a3 completion:(id)a4;
- (void)setAnnotation:(id)a3 value:(id)a4;
- (void)setAnnotationTimestamp:(unint64_t)a3;
- (void)setAnnotations:(id)a3;
- (void)setBundleInfoDictionary:(id)a3;
- (void)setCdhash:(id)a3;
- (void)setContainingBundleIdentifier:(id)a3;
- (void)setContainingUrl:(id)a3;
- (void)setEntitlements:(id)a3;
- (void)setHubProtocolVersion:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsRBManaged:(BOOL)a3;
- (void)setLastModified:(int64_t)a3;
- (void)setLaunchPersonas:(id)a3;
- (void)setLocalizedContainingName:(id)a3;
- (void)setOnSystemVolume:(BOOL)a3;
- (void)setOriginalIdentifier:(id)a3;
- (void)setPlugInDictionary:(id)a3;
- (void)setRequirement:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUuid:(id)a3;
- (void)updateFromForm:(id)a3;
@end

@implementation PKPlugInCore

- (PKPlugInCore)init
{
  v3 = (void *)objc_opt_new();
  v7 = (PKPlugInCore *)objc_msgSend_initWithExternalProviders_(self, v4, (uint64_t)v3, v5, v6);

  return v7;
}

- (PKPlugInCore)initWithExternalProviders:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PKPlugInCore;
  uint64_t v6 = -[PKPlugInCore init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_external, a3);
  }

  return v7;
}

- (PKPlugInCore)initWithName:(id)a3 extensionPointPlatform:(unsigned int)a4 url:(id)a5 bundleInfo:(id)a6 uuid:(id)a7 discoveryInstanceUUID:(id)a8 extensionPointCache:(id)a9 externalProviders:(id)a10
{
  uint64_t v14 = *(void *)&a4;
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v25 = (PKPlugInCore *)objc_msgSend_initWithExternalProviders_(self, v22, (uint64_t)a10, v23, v24);
  v27 = v25;
  if (v25
    && (objc_msgSend_setupWithName_extensionPointPlatform_url_bundleInfo_uuid_discoveryInstanceUUID_extensionPointCache_( v25,  v26,  (uint64_t)v16,  v14,  (uint64_t)v17,  v18,  v19,  v20,  v21) & 1) == 0)
  {

    v27 = 0LL;
  }

  return v27;
}

- (PKPlugInCore)initWithForm:(id)a3 externalProviders:(id)a4
{
  id v6 = a3;
  v10 = (PKPlugInCore *)objc_msgSend_initWithExternalProviders_(self, v7, (uint64_t)a4, v8, v9);
  uint64_t v14 = v10;
  if (v10 && (objc_msgSend_setupWithForm_(v10, v11, (uint64_t)v6, v12, v13) & 1) == 0)
  {

    uint64_t v14 = 0LL;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKPlugInCore *)a3;
  objc_msgSend_uuid(self, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9) {
    sub_186A254A8();
  }

  if (self == v4)
  {
    char isEqual = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_uuid(self, v10, v11, v12, v13);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_uuid(v4, v15, v16, v17, v18);
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      char isEqual = objc_msgSend_isEqual_(v14, v20, (uint64_t)v19, v21, v22);
    }

    else
    {
      char isEqual = 0;
    }
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6) {
    sub_186A254D0();
  }

  objc_msgSend_uuid(self, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v16 = objc_msgSend_hash(v11, v12, v13, v14, v15);

  return v16;
}

- (BOOL)setupWithName:(id)a3 extensionPointPlatform:(unsigned int)a4 url:(id)a5 bundleInfo:(id)a6 uuid:(id)a7 discoveryInstanceUUID:(id)a8 extensionPointCache:(id)a9
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v25 = v21;
  if (!v17) {
    goto LABEL_22;
  }
  if (v16)
  {
    self->_extensionPointPlatform = a4;
    if (!v18) {
      goto LABEL_16;
    }
    if (v21)
    {
      id v50 = v20;
      objc_msgSend_normalizeInfoDictionary_(self, v22, (uint64_t)v18, v23, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v29 = objc_msgSend_resolveSDKWithInfoPlist_extensionPointCache_(self, v27, (uint64_t)v26, (uint64_t)v25, v28);

      v51 = (void *)v29;
      char v37 = objc_msgSend_setDictionaries_(self, v30, v29, v31, v32);
      if ((v37 & 1) != 0)
      {
        objc_msgSend_canonicalize(self, v33, v34, v35, v36);
        id v20 = v50;
      }

      else
      {
        pklog_handle_for_category(6);
        log = (os_log_s *)objc_claimAutoreleasedReturnValue();
        id v20 = v50;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          id v53 = v50;
          __int16 v54 = 2114;
          id v55 = v16;
          __int16 v56 = 2114;
          id v57 = v17;
          __int16 v58 = 2114;
          id v59 = v18;
          _os_log_error_impl( &dword_186A04000,  log,  OS_LOG_TYPE_ERROR,  "[d %@] malformed plugin dictionary in plugin [%{public}@] at [%{public}@]: %{public}@",  buf,  0x2Au);
        }
      }

      if ((v37 & 1) != 0) {
        goto LABEL_16;
      }
LABEL_22:
      BOOL v41 = 0;
      goto LABEL_23;
    }

    if (objc_msgSend_setDictionaries_(self, v22, (uint64_t)v18, v23, v24))
    {
LABEL_16:
      objc_storeStrong((id *)&self->_identifier, a3);
      objc_storeStrong((id *)&self->_url, a5);
      v46 = v19;
      if (!v19)
      {
        objc_msgSend_UUID(MEMORY[0x189607AB8], v42, v43, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_storeStrong((id *)&self->_uuid, v46);
      if (!v19) {

      }
      v47 = (NSUUID *)v20;
      discoveryInstanceUUID = (os_log_s *)self->_discoveryInstanceUUID;
      self->_discoveryInstanceUUID = v47;
      BOOL v41 = 1;
      goto LABEL_21;
    }

    pklog_handle_for_category(6);
    discoveryInstanceUUID = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(discoveryInstanceUUID, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      id v53 = v20;
      __int16 v54 = 2114;
      id v55 = v16;
      __int16 v56 = 2114;
      id v57 = v17;
      __int16 v58 = 2114;
      id v59 = v18;
      _os_log_error_impl( &dword_186A04000,  discoveryInstanceUUID,  OS_LOG_TYPE_ERROR,  "[d %@] malformed plugin dictionary in plugin [%{public}@] at [%{public}@]: %{public}@",  buf,  0x2Au);
      BOOL v41 = 0;
      goto LABEL_21;
    }
  }

  else
  {
    pklog_handle_for_category(6);
    discoveryInstanceUUID = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(discoveryInstanceUUID, OS_LOG_TYPE_ERROR))
    {
      sub_186A254F8((uint64_t)v20, v17, (uint64_t)discoveryInstanceUUID, v39, v40);
      BOOL v41 = 0;
      goto LABEL_21;
    }
  }

  BOOL v41 = 0;
LABEL_21:

LABEL_23:
  return v41;
}

- (BOOL)setDictionaries:(id)a3
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)&self->_bundleInfoDictionary, a3);
    objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)@"NSExtension", v7, v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)&self->_plugInDictionary, v9);
      objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)@"Multiple", v11, v12);
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        pklog_handle_for_category(6);
        id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_discoveryInstanceUUID(self, v19, v20, v21, v22);
          BOOL v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_uuid(self, v23, v24, v25, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_identifier(self, v28, v29, v30, v31);
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_version(self, v33, v34, v35, v36);
          *(_DWORD *)buf = 138413314;
          uint64_t v43 = v41;
          __int16 v44 = 2114;
          uint64_t v45 = v27;
          __int16 v46 = 2112;
          v47 = v32;
          v49 = __int16 v48 = 2112;
          char v37 = (void *)v49;
          __int16 v50 = 2114;
          v51 = @"Multiple";
          _os_log_impl( &dword_186A04000,  v18,  OS_LOG_TYPE_DEFAULT,  "[d %@] [u %{public}@] [%@(%@)] multiplexed plug-ins (%{public}@ key) obsolete and ignored",  buf,  0x34u);
        }
      }

      objc_msgSend_plugInDictionary(self, v13, v14, v15, v16);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }

    else
    {
      char isKindOfClass = 0;
    }
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)normalizeInfoDictionary:(id)a3
{
  return a3;
}

- (BOOL)setupWithForm:(id)a3
{
  uint64_t v203 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x189604030]);
  objc_msgSend_objectForKeyedSubscript_(v4, v6, (uint64_t)@"path", v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  inited = (void *)objc_msgSend_initFileURLWithPath_(v5, v10, (uint64_t)v9, v11, v12);

  objc_msgSend_objectForKeyedSubscript_(v4, v13, (uint64_t)@"discoveryInstanceUUID", v14, v15);
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    id v20 = objc_alloc(MEMORY[0x189607AB8]);
    uint64_t v24 = (void *)objc_msgSend_initWithUUIDString_(v20, v21, (uint64_t)v19, v22, v23);
  }

  else
  {
    uint64_t v24 = 0LL;
  }

  objc_msgSend_objectForKeyedSubscript_(v4, v16, (uint64_t)@"epPlatform", v17, v18);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v48 = objc_msgSend_unsignedIntValue(v25, v26, v27, v28, v29);
  objc_msgSend_objectForKeyedSubscript_(v4, v30, (uint64_t)@"identifier", v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v34, (uint64_t)@"bundleInfo", v35, v36);
  char v37 = (void *)objc_claimAutoreleasedReturnValue();
  id v38 = objc_alloc(MEMORY[0x189607AB8]);
  objc_msgSend_objectForKeyedSubscript_(v4, v39, (uint64_t)@"uuid", v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  __int16 v46 = (void *)objc_msgSend_initWithUUIDString_(v38, v43, (uint64_t)v42, v44, v45);
  LODWORD(v48) = objc_msgSend_setupWithName_extensionPointPlatform_url_bundleInfo_uuid_discoveryInstanceUUID_extensionPointCache_( self,  v47,  (uint64_t)v33,  v48,  (uint64_t)inited,  v37,  v46,  v24,  0);

  if ((_DWORD)v48)
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v49, (uint64_t)@"hubProtocolVersion", v50, v51);
    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v57 = objc_msgSend_unsignedIntegerValue(v52, v53, v54, v55, v56);
    objc_msgSend_setHubProtocolVersion_(self, v58, v57, v59, v60);

    objc_msgSend_objectForKeyedSubscript_(v4, v61, (uint64_t)@"hubProtocolVersion", v62, v63);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v67) {
      objc_msgSend_setHubProtocolVersion_(self, v64, 1, v65, v66);
    }
    objc_msgSend_objectForKeyedSubscript_(v4, v64, (uint64_t)@"original-identifier", v65, v66);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOriginalIdentifier_(self, v69, (uint64_t)v68, v70, v71);

    objc_msgSend_objectForKeyedSubscript_(v4, v72, (uint64_t)@"hash", v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCdhash_(self, v76, (uint64_t)v75, v77, v78);

    objc_msgSend_objectForKeyedSubscript_(v4, v79, (uint64_t)@"requirement", v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRequirement_(self, v83, (uint64_t)v82, v84, v85);

    objc_msgSend_objectForKeyedSubscript_(v4, v86, (uint64_t)@"lastmodified", v87, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v94 = objc_msgSend_longValue(v89, v90, v91, v92, v93);
    objc_msgSend_setLastModified_(self, v95, v94, v96, v97);

    objc_msgSend_objectForKeyedSubscript_(v4, v98, (uint64_t)@"entitlements", v99, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEntitlements_(self, v102, (uint64_t)v101, v103, v104);

    objc_msgSend_objectForKeyedSubscript_(v4, v105, (uint64_t)@"containingPath", v106, v107);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    if (v111)
    {
      id v112 = objc_alloc(MEMORY[0x189604030]);
      v116 = (void *)objc_msgSend_initFileURLWithPath_(v112, v113, (uint64_t)v111, v114, v115);
      objc_msgSend_setContainingUrl_(self, v117, (uint64_t)v116, v118, v119);
    }

    objc_msgSend_objectForKeyedSubscript_(v4, v108, (uint64_t)@"containingBundleIdentifier", v109, v110);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setContainingBundleIdentifier_(self, v121, (uint64_t)v120, v122, v123);

    objc_msgSend_objectForKeyedSubscript_(v4, v124, (uint64_t)@"systemResident", v125, v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v132 = objc_msgSend_BOOLValue(v127, v128, v129, v130, v131);
    objc_msgSend_setOnSystemVolume_(self, v133, v132, v134, v135);

    objc_msgSend_objectForKeyedSubscript_(v4, v136, (uint64_t)@"annotations", v137, v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAnnotations_(self, v140, (uint64_t)v139, v141, v142);

    pklog_handle_for_category(6);
    v143 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v143, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_identifier(self, v144, v145, v146, v147);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_annotations(self, v149, v150, v151, v152);
      v197 = v19;
      v153 = v111;
      char v154 = v48;
      uint64_t v48 = (uint64_t)v25;
      v155 = v24;
      v156 = v67;
      v157 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v200 = v148;
      __int16 v201 = 2112;
      v202 = v157;
      _os_log_impl(&dword_186A04000, v143, OS_LOG_TYPE_INFO, "%@: annotations = %@", buf, 0x16u);

      v67 = v156;
      uint64_t v24 = v155;
      uint64_t v25 = (void *)v48;
      LOBYTE(v48) = v154;
      v111 = v153;
      id v19 = v197;
    }

    objc_msgSend_objectForKeyedSubscript_(v4, v158, (uint64_t)@"localizedContainingDisplayName", v159, v160);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLocalizedContainingName_(self, v162, (uint64_t)v161, v163, v164);

    objc_msgSend_objectForKeyedSubscript_(v4, v165, (uint64_t)@"isRBManaged", v166, v167);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v173 = objc_msgSend_BOOLValue(v168, v169, v170, v171, v172);
    objc_msgSend_setIsRBManaged_(self, v174, v173, v175, v176);

    pklog_handle_for_category(6);
    v177 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v177, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_identifier(self, v178, v179, v180, v181);
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      int isRBManaged = objc_msgSend_isRBManaged(self, v183, v184, v185, v186);
      v188 = "will not";
      if (isRBManaged) {
        v188 = "will";
      }
      *(_DWORD *)buf = 138412546;
      v200 = v182;
      __int16 v201 = 2080;
      v202 = v188;
      _os_log_impl(&dword_186A04000, v177, OS_LOG_TYPE_INFO, "%@: %s be managed by runningboard", buf, 0x16u);
    }

    objc_msgSend_objectForKeyedSubscript_(v4, v189, (uint64_t)@"launchPersonas", v190, v191);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLaunchPersonas_(self, v193, (uint64_t)v192, v194, v195);
  }

  return v48;
}

- (void)canonicalize
{
  uint64_t v6 = (void *)MEMORY[0x189603FC8];
  objc_msgSend_attributes(self, a2, v2, v3, v4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithDictionary_(v6, v8, (uint64_t)v7, v9, v10);
  id v37 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v11 = (void *)MEMORY[0x189603FC8];
  objc_msgSend_plugInDictionary(self, v12, v13, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithDictionary_(v11, v17, (uint64_t)v16, v18, v19);
  id v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v20, v21, (uint64_t)v37, (uint64_t)@"NSExtensionAttributes", v22);
  objc_msgSend_setPlugInDictionary_(self, v23, (uint64_t)v20, v24, v25);
  objc_msgSend_attribute_(self, v26, (uint64_t)@"NSExtensionVersion", v27, v28);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
    uint64_t v33 = objc_msgSend_infoKey_(self, v30, (uint64_t)@"CFBundleShortVersionString", v31, v32);
    if (v33)
    {
      uint64_t v36 = (__CFString *)v33;
      objc_msgSend_setObject_forKeyedSubscript_(v37, v34, v33, (uint64_t)@"NSExtensionVersion", v35);
    }

    else
    {
      uint64_t v36 = @"1";
      objc_msgSend_setObject_forKeyedSubscript_( v37,  v34,  (uint64_t)@"1",  (uint64_t)@"NSExtensionVersion",  v35);
    }
  }
}

+ (id)readSDKDictionary:(id)a3 forPlatform:(unsigned int)a4 externalProviders:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a5;
  pklog_handle_for_category(3);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, v7);

  pklog_handle_for_category(3);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    int v35 = 138543362;
    id v36 = v7;
    _os_signpost_emit_with_name_impl( &dword_186A04000,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "LSSDKDictionary",  " name=%{public, signpost.description:attribute}@ ",  (uint8_t *)&v35,  0xCu);
  }

  objc_msgSend_ls(v8, v13, v14, v15, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v18, v6, v19, v20);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extensionPointForIdentifier_platform_(v17, v22, (uint64_t)v7, (uint64_t)v21, v23);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sdkEntry(v24, v25, v26, v27, v28);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

  pklog_handle_for_category(3);
  uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v31 = v30;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    LOWORD(v35) = 0;
    _os_signpost_emit_with_name_impl( &dword_186A04000,  v31,  OS_SIGNPOST_INTERVAL_END,  v10,  "LSSDKDictionary",  (const char *)&unk_186A2C58B,  (uint8_t *)&v35,  2u);
  }

  if (v29)
  {
    id v32 = v29;
  }

  else
  {
    pklog_handle_for_category(3);
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_186A255A0((uint64_t)v7, v6, v33);
    }

    id v32 = 0LL;
  }

  return v32;
}

- (id)resolveSDKWithInfoPlist:(id)a3 extensionPointCache:(id)a4
{
  id v7 = a3;
  id v12 = a4;
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], v8, v9, v10, v11);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v19,  v20,  (uint64_t)a2,  (uint64_t)self,  (uint64_t)@"PKPlugInCore.m",  361,  @"cannot resolve SDK without materialized Info.plist");
  }

  objc_msgSend_sdkDictionaryWithInfoPlist_extensionPointCache_(self, v8, (uint64_t)v7, (uint64_t)v12, v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = v7;
  uint64_t v17 = v16;
  if (v13)
  {
    objc_msgSend_mergeSDKDictionary_intoExtensionDictionary_(self, v14, (uint64_t)v13, (uint64_t)v16, v15);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)mergeSDKDictionary:(id)a3 intoExtensionDictionary:(id)a4
{
  v65[2] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v11 = (void *)objc_msgSend_mutableCopy(a4, v7, v8, v9, v10);
  objc_msgSend_sdkOnlyKeyPaths(self, v12, v13, v14, v15);
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pk_removeItemsAtKeyPaths_(v11, v17, (uint64_t)v16, v18, v19);

  uint64_t v20 = (void *)MEMORY[0x189604010];
  v65[0] = @"NSExtension";
  v65[1] = @"Shared";
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v21, (uint64_t)v65, 2, v22);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithObjects_(v20, v24, (uint64_t)v23, v25, v26, 0);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

  v54[0] = MEMORY[0x1895F87A8];
  v54[1] = 3221225472LL;
  v54[2] = sub_186A15780;
  v54[3] = &unk_189F20DF0;
  v54[4] = self;
  objc_msgSend_pk_overlayDictionary_existingValuesTakePrecedent_exceptKeyPaths_exemptionHandler_( v11,  v28,  (uint64_t)v6,  1,  (uint64_t)v27,  v54);

  pklog_handle_for_category(6);
  uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_uuid(self, v30, v31, v32, v33);
    int v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(self, v36, v37, v38, v39);
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_version(self, v41, v42, v43, v44);
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v11, v46, (uint64_t)@"NSExtension", v47, v48);
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v11, v50, (uint64_t)@"XPCService", v51, v52);
    id v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    uint64_t v56 = v35;
    __int16 v57 = 2112;
    __int16 v58 = v40;
    __int16 v59 = 2112;
    uint64_t v60 = v45;
    __int16 v61 = 2112;
    uint64_t v62 = v49;
    __int16 v63 = 2112;
    v64 = v53;
    _os_log_debug_impl( &dword_186A04000,  v29,  OS_LOG_TYPE_DEBUG,  "[u %{public}@] [%@(%@)] Merged plugin dictionary; NSExtension = %@, XPCService = %@",
      buf,
      0x34u);
  }

  return v11;
}

- (id)sdkOnlyKeyPaths
{
  if (qword_18C4AE1F0 != -1) {
    dispatch_once(&qword_18C4AE1F0, &unk_189F20E10);
  }
  return (id)qword_18C4AE1E8;
}

- (id)mergeSharedResources:(id)a3 into:(id)a4
{
  id v5 = (void *)MEMORY[0x189603FE0];
  id v6 = a3;
  objc_msgSend_setWithArray_(v5, v7, (uint64_t)a4, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v10, v11, (uint64_t)v6, v12, v13);

  objc_msgSend_allObjects(v10, v14, v15, v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)export:(id *)a3
{
  v172[11] = *MEMORY[0x1895F89C0];
  objc_msgSend_bundleInfoDictionary(self, a2, (uint64_t)a3, v3, v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (void *)objc_msgSend_mutableCopy(v6, v7, v8, v9, v10);

  objc_msgSend_removeObjectForKey_(v11, v12, (uint64_t)@"CFBundleInfoPlistURL", v13, v14);
  uint64_t v166 = (void *)MEMORY[0x189603FC8];
  v171[0] = @"hubProtocolVersion";
  uint64_t v15 = (void *)MEMORY[0x189607968];
  uint64_t v20 = objc_msgSend_hubProtocolVersion(self, v16, v17, v18, v19);
  objc_msgSend_numberWithUnsignedInteger_(v15, v21, v20, v22, v23);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v172[0] = v169;
  v171[1] = @"path";
  objc_msgSend_path(self, v24, v25, v26, v27);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v172[1] = v168;
  v171[2] = @"systemResident";
  uint64_t v28 = (void *)MEMORY[0x189607968];
  uint64_t v33 = objc_msgSend_onSystemVolume(self, v29, v30, v31, v32);
  objc_msgSend_numberWithBool_(v28, v34, v33, v35, v36);
  uint64_t v167 = (void *)objc_claimAutoreleasedReturnValue();
  v172[2] = v167;
  v171[3] = @"identifier";
  objc_msgSend_identifier(self, v37, v38, v39, v40);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v172[3] = v165;
  v171[4] = @"original-identifier";
  objc_msgSend_originalIdentifier(self, v41, v42, v43, v44);
  uint64_t v164 = (void *)objc_claimAutoreleasedReturnValue();
  v172[4] = v164;
  v171[5] = @"version";
  objc_msgSend_version(self, v45, v46, v47, v48);
  id v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    objc_msgSend_version(self, v49, v50, v51, v52);
    uint64_t v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v54 = @"<none>";
  }

  v172[5] = v54;
  v172[6] = v11;
  uint64_t v170 = v11;
  v171[6] = @"bundleInfo";
  v171[7] = @"uuid";
  objc_msgSend_uuid(self, v49, v50, v51, v52);
  uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v55, v56, v57, v58, v59);
  uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
  v172[7] = v60;
  v171[8] = @"lastmodified";
  __int16 v61 = (void *)MEMORY[0x189607968];
  uint64_t Modified = objc_msgSend_lastModified(self, v62, v63, v64, v65);
  objc_msgSend_numberWithLong_(v61, v67, Modified, v68, v69);
  uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
  v172[8] = v70;
  v171[9] = @"annotations";
  uint64_t v75 = objc_msgSend_annotations(self, v71, v72, v73, v74);
  uint64_t v80 = (void *)v75;
  uint64_t v81 = MEMORY[0x189604A60];
  if (v75) {
    uint64_t v81 = v75;
  }
  v172[9] = v81;
  v171[10] = @"isRBManaged";
  v82 = (void *)MEMORY[0x189607968];
  uint64_t isRBManaged = objc_msgSend_isRBManaged(self, v76, v77, v78, v79);
  objc_msgSend_numberWithBool_(v82, v84, isRBManaged, v85, v86);
  uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue();
  v172[10] = v87;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v88, (uint64_t)v172, (uint64_t)v171, 11);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithDictionary_(v166, v90, (uint64_t)v89, v91, v92);
  uint64_t v93 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53) {
  objc_msgSend_entitlements(self, v94, v95, v96, v97);
  }
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  if (v98)
  {
    objc_msgSend_entitlements(self, v99, v100, v101, v102);
    uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v93, v104, (uint64_t)v103, (uint64_t)@"entitlements", v105);
  }

  objc_msgSend_containingPath(self, v99, v100, v101, v102);
  uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue();

  if (v106)
  {
    objc_msgSend_containingPath(self, v107, v108, v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v93, v112, (uint64_t)v111, (uint64_t)@"containingPath", v113);
  }

  objc_msgSend_containingBundleIdentifier(self, v107, v108, v109, v110);
  uint64_t v114 = (void *)objc_claimAutoreleasedReturnValue();

  if (v114)
  {
    objc_msgSend_containingBundleIdentifier(self, v115, v116, v117, v118);
    uint64_t v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_( v93,  v120,  (uint64_t)v119,  (uint64_t)@"containingBundleIdentifier",  v121);
  }

  objc_msgSend_localizedContainingName(self, v115, v116, v117, v118);
  uint64_t v122 = (void *)objc_claimAutoreleasedReturnValue();

  if (v122)
  {
    objc_msgSend_localizedContainingName(self, v123, v124, v125, v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_( v93,  v128,  (uint64_t)v127,  (uint64_t)@"localizedContainingDisplayName",  v129);
  }

  objc_msgSend_discoveryInstanceUUID(self, v123, v124, v125, v126);
  uint64_t v130 = (void *)objc_claimAutoreleasedReturnValue();

  if (v130)
  {
    objc_msgSend_discoveryInstanceUUID(self, v131, v132, v133, v134);
    uint64_t v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v135, v136, v137, v138, v139);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v93, v141, (uint64_t)v140, (uint64_t)@"discoveryInstanceUUID", v142);
  }

  v143 = (void *)MEMORY[0x189607968];
  uint64_t v144 = objc_msgSend_extensionPointPlatform(self, v131, v132, v133, v134);
  objc_msgSend_numberWithUnsignedInt_(v143, v145, v144, v146, v147);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v93, v149, (uint64_t)v148, (uint64_t)@"epPlatform", v150);

  objc_msgSend_launchPersonas(self, v151, v152, v153, v154);
  v155 = (void *)objc_claimAutoreleasedReturnValue();

  if (v155)
  {
    objc_msgSend_launchPersonas(self, v156, v157, v158, v159);
    uint64_t v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v93, v161, (uint64_t)v160, (uint64_t)@"launchPersonas", v162);
  }

  return v93;
}

- (id)diagnose
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    uint64_t v37 = @"missing identifier (no NSExtensionIdentifier, nor even CFBundleIdentifier)";
LABEL_21:
    pkErrorf(12LL, v37, v9, v10, v11, v12, v13, v14, (uint64_t)v52);
    goto LABEL_22;
  }

  objc_msgSend_protocolSpec(self, v8, v9, v10, v11);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    uint64_t v38 = PKProtocolInfoKey;
LABEL_10:
    pkErrorf(12LL, @"missing %@ key in Info.plist or SDK", v17, v18, v19, v20, v21, v22, (uint64_t)*v38);
LABEL_22:
    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
    return v50;
  }

  objc_msgSend_attributes(self, v16, v17, v18, v19);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    uint64_t v38 = PKAttributesInfoKey;
    goto LABEL_10;
  }

  int isAppExtension = objc_msgSend_isAppExtension(self, v24, v17, v18, v19);
  if (!isAppExtension)
  {
    int v36 = 0;
    goto LABEL_17;
  }

  objc_msgSend_principalSpec(self, v25, v26, v27, v28);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v5, v33, (uint64_t)@"NSObject", v34, v35))
  {
    int v36 = 0;
    goto LABEL_17;
  }

  if (!pkUseInternalDiagnostics())
  {
    int v36 = 1;
LABEL_17:
    if (isAppExtension) {
      goto LABEL_18;
    }
LABEL_13:
    if (!v36) {
      goto LABEL_19;
    }
    goto LABEL_14;
  }

  objc_msgSend_url(self, v25, v26, v27, v28);
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v39, v40, v41, v42, v43);
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
  int v36 = objc_msgSend_hasPrefix_(v44, v45, (uint64_t)@"/AppleInternal/", v46, v47) ^ 1;

  if (!isAppExtension) {
    goto LABEL_13;
  }
LABEL_18:

  if (v36)
  {
LABEL_14:
    pkErrorf( 12LL,  @"Application Extensions may not use the %@ key",  v26,  v27,  v28,  v29,  v30,  v31,  (uint64_t)@"PrincipalClass");
    goto LABEL_22;
  }

- (NSString)bootInstance
{
  if (qword_18C697330 != -1) {
    dispatch_once(&qword_18C697330, &unk_189F20E30);
  }
  return (NSString *)(id)qword_18C697338;
}

- (void)updateFromForm:(id)a3
{
  uint64_t v91 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  pklog_handle_for_category(10);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_186A25750( (uint64_t)self,  (uint64_t)v4,  (uint64_t)v5,  v6,  v7,  v8,  v9,  v10,  v85,  *(__int128 *)v87,  *(void **)&v87[16],  *(__int128 *)&v87[24],  *(uint64_t *)v88,  *(uint64_t *)&v88[8],  *(uint64_t *)&v88[16],  *(uint64_t *)&v88[24],  v89,  v90,  *((uint64_t *)&v90 + 1),  v91,  v92,  v93);
  }

  if (!objc_msgSend_annotationTimestamp(self, v11, v12, v13, v14)) {
    goto LABEL_21;
  }
  objc_msgSend_objectForKeyedSubscript_(v4, v15, (uint64_t)@"annotations", v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)@"bootuuid", v20, v21);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v4, v23, (uint64_t)@"annotations", v24, v25);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v26, v27, (uint64_t)@"timestamp", v28, v29);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30) {
    BOOL v35 = v22 == 0LL;
  }
  else {
    BOOL v35 = 1;
  }
  int v36 = !v35;
  if (v35)
  {
    BOOL v49 = 1;
    if (!v36) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  objc_msgSend_bootInstance(self, v31, v32, v33, v34);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v22, v37, (uint64_t)v26, v38, v39))
  {
    unint64_t v44 = objc_msgSend_unsignedLongLongValue(v30, v40, v41, v42, v43);
    BOOL v49 = v44 <= objc_msgSend_annotationTimestamp(self, v45, v46, v47, v48);
    if (!v36) {
      goto LABEL_16;
    }
LABEL_15:

    goto LABEL_16;
  }

  BOOL v49 = 1;
  if (v36) {
    goto LABEL_15;
  }
LABEL_16:
  if (!v49)
  {

LABEL_21:
    objc_msgSend_setAnnotationTimestamp_(self, v15, 0, v16, v17);
    objc_msgSend_objectForKeyedSubscript_(v4, v78, (uint64_t)@"annotations", v79, v80);
    uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAnnotations_(self, v82, (uint64_t)v81, v83, v84);

    goto LABEL_22;
  }

  pklog_handle_for_category(10);
  uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)uint64_t v87 = objc_msgSend_uuid(self, v51, v52, v53, v54);
    objc_msgSend_identifier(self, v55, v56, v57, v58);
    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_version(self, v60, v61, v62, v63);
    uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v86 = objc_msgSend_unsignedLongLongValue(v30, v65, v66, v67, v68);
    objc_msgSend_bootInstance(self, v69, v70, v71, v72);
    uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)&v87[8] = 138545154;
    *(void *)&v87[12] = *(void *)v87;
    *(_WORD *)&v87[20] = 2112;
    *(void *)&v87[22] = v59;
    *(_WORD *)&v87[30] = 2112;
    *(void *)&v87[32] = v64;
    *(_WORD *)uint64_t v88 = 2080;
    *(void *)&v88[2] = "-[PKPlugInCore updateFromForm:]";
    *(_WORD *)&v88[10] = 2112;
    *(void *)&v88[12] = v22;
    *(_WORD *)&v88[20] = 2048;
    *(void *)&v88[22] = v86;
    *(_WORD *)&v88[30] = 2112;
    uint64_t v89 = (uint64_t)v73;
    LOWORD(v90) = 2048;
    *(void *)((char *)&v90 + 2) = objc_msgSend_annotationTimestamp(self, v74, v75, v76, v77);
    _os_log_impl( &dword_186A04000,  v50,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@] [%@(%@)] %s ignoring annotation update (%@, %llu) vs. (%@, %llu)",  &v87[8],  0x52u);
  }

LABEL_22:
}

- (void)setAnnotation:(id)a3 value:(id)a4
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = mach_continuous_time();
  objc_msgSend_setAnnotationTimestamp_(self, v9, v8, v10, v11);
  objc_msgSend_annotations(self, v12, v13, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = (void *)objc_msgSend_copy(v7, v17, v18, v19, v20);
  objc_msgSend_dictionaryChanging_to_(v16, v22, (uint64_t)v6, (uint64_t)v21, v23);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAnnotations_(self, v25, (uint64_t)v24, v26, v27);

  pklog_handle_for_category(10);
  uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_uuid(self, v29, v30, v31, v32);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(self, v34, v35, v36, v37);
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_version(self, v39, v40, v41, v42);
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
    int v44 = 138544642;
    uint64_t v45 = v33;
    __int16 v46 = 2112;
    uint64_t v47 = v38;
    __int16 v48 = 2112;
    __int16 v50 = 2080;
    BOOL v49 = v43;
    uint64_t v51 = "-[PKPlugInCore setAnnotation:value:]";
    __int16 v52 = 2112;
    id v53 = v6;
    __int16 v54 = 2112;
    id v55 = v7;
    _os_log_debug_impl( &dword_186A04000,  v28,  OS_LOG_TYPE_DEBUG,  "[u %{public}@] [%@(%@)] %s set annotation %@ : %@",  (uint8_t *)&v44,  0x3Eu);
  }
}

- (BOOL)oldStyle
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend_infoKey_(self, v7, (uint64_t)@"PlugInKit", v8, v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend_currentHandler(MEMORY[0x1896077D8], v11, v12, v13, v14);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v16,  v17,  (uint64_t)a2,  (uint64_t)self,  (uint64_t)@"PKPlugInCore.m",  570,  @"unknown plug-in configuration style");
    }
  }

  return v6 == 0LL;
}

- (NSString)path
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v5, v6, v7, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSString)containingPath
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v5, v6, v7, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)version
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)protocolSpec
{
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    else {
      id v5 = 0LL;
    }
  }

  return v5;
}

- (NSString)principalSpec
{
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    else {
      id v5 = 0LL;
    }
  }

  return (NSString *)v5;
}

- (NSString)sdkSpec
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)embeddedCodePath
{
  return 0LL;
}

- (id)embeddedProtocolSpec
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend_protocolSpec(self, v6, v7, v8, v9);
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)isAppExtension
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v5, v6, v7, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  char hasSuffix = objc_msgSend_hasSuffix_(v10, v11, (uint64_t)@".appex", v12, v13);

  return hasSuffix;
}

- (BOOL)isMultiplexed
{
  return 0;
}

- (BOOL)isHybrid
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = v4 != 0LL;

  return v5;
}

- (BOOL)isDedicated
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isData
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  char isEqual = objc_msgSend_isEqual_(@"#Data", v6, (uint64_t)v5, v7, v8);

  return isEqual;
}

- (NSDate)timestamp
{
  BOOL v5 = (void *)MEMORY[0x189603F50];
  uint64_t Modified = objc_msgSend_lastModified(self, a2, v2, v3, v4);
  objc_msgSend_dateWithTimeIntervalSince1970_(v5, v7, v8, v9, v10, (double)Modified);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldTerminateOnHold
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (id)infoKey:(id)a3
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend_bundleInfoDictionary(self, v5, v6, v7, v8);
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  pklog_handle_for_category(3);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_uuid(self, v15, v16, v17, v18);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(self, v21, v22, v23, v24);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_version(self, v26, v27, v28, v29);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    int v31 = 138544386;
    uint64_t v32 = v20;
    __int16 v33 = 2112;
    uint64_t v34 = v25;
    __int16 v35 = 2112;
    uint64_t v36 = v30;
    __int16 v37 = 2112;
    id v38 = v4;
    __int16 v39 = 2112;
    uint64_t v40 = v13;
    _os_log_debug_impl( &dword_186A04000,  v14,  OS_LOG_TYPE_DEBUG,  "[u %{public}@] [%@(%@)] info [%@] => [%@]",  (uint8_t *)&v31,  0x34u);
  }

  return v13;
}

- (id)pluginKey:(id)a3
{
  id v4 = a3;
  objc_msgSend_plugInDictionary(self, v5, v6, v7, v8);
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)attribute:(id)a3
{
  id v4 = a3;
  objc_msgSend_attributes(self, v5, v6, v7, v8);
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)valueForEntitlement:(id)a3
{
  id v4 = a3;
  objc_msgSend_entitlements(self, v5, v6, v7, v8);
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)hasEntitlement:(id)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = v5;
  if (v5) {
    int v10 = objc_msgSend_isEqual_(v5, v6, MEMORY[0x189604A80], v7, v8) ^ 1;
  }
  else {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)usesHostPersona
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_7:
    char isEqualToString = 0;
    goto LABEL_8;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    pklog_handle_for_category(7);
    char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_186A25850();
    }

    goto LABEL_7;
  }

  char isEqualToString = objc_msgSend_isEqualToString_(v4, v5, (uint64_t)@"host", v6, v7);
LABEL_8:

  return isEqualToString;
}

- (id)augmentInterface:(id)a3
{
  return 0LL;
}

- (void)localizedInfoDictionaryForKeys:(id)a3 completion:(id)a4
{
  uint64_t v68 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void *))a4;
  objc_msgSend_dictionary(MEMORY[0x189603FC8], v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = v12;
  if (self->_bundleInfoDictionary)
  {
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id v14 = v6;
    unint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v59, (uint64_t)v67, 16);
    if (v16)
    {
      id v55 = v7;
      id v56 = v6;
      uint64_t v58 = 0LL;
      uint64_t v20 = *(void *)v60;
      uint64_t v57 = *MEMORY[0x1896075E0];
      while (1)
      {
        uint64_t v21 = 0LL;
        if (v16 <= 1) {
          uint64_t v22 = 1LL;
        }
        else {
          uint64_t v22 = v16;
        }
        do
        {
          if (*(void *)v60 != v20) {
            objc_enumerationMutation(v14);
          }
          uint64_t v23 = *(void **)(*((void *)&v59 + 1) + 8 * v21);
          if (objc_msgSend_isEqualToString_(v23, v17, (uint64_t)@"CFBundleName", v18, v19))
          {
            objc_msgSend_localizedShortName(self, v24, v25, v26, v27);
            int v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v31) {
              goto LABEL_14;
            }
          }

          else if (!objc_msgSend_isEqualToString_( v23,  v24,  (uint64_t)@"CFBundleDisplayName",  v26,  v27) {
                 || (objc_msgSend_localizedName(self, v28, v32, v29, v30),
          }
                     (int v31 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL))
          {
LABEL_14:
            objc_msgSend_infoKey_(self, v28, (uint64_t)v23, v29, v30);
            int v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v31)
            {
              objc_msgSend_objectForKey_(self->_bundleInfoDictionary, v28, (uint64_t)v23, v29, v30);
              int v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v31) {
                goto LABEL_18;
              }
            }
          }

          if (!objc_msgSend_conformsToProtocol_(v31, v28, (uint64_t)&unk_18C69D160, v29, v30))
          {

            __int16 v35 = (void *)MEMORY[0x189607870];
            uint64_t v65 = v57;
            objc_msgSend_stringWithFormat_( NSString,  v36,  (uint64_t)@"Value of info dictionary key %@ for plugin %@ does not conform to secure coding!",  v37,  v38,  v23,  self->_identifier);
            __int16 v39 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v66 = v39;
            objc_msgSend_dictionaryWithObjects_forKeys_count_( MEMORY[0x189603F68],  v40,  (uint64_t)&v66,  (uint64_t)&v65,  1);
            uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_userInfo_(v35, v42, (uint64_t)@"PlugInKit", -1, (uint64_t)v41);
            v44 = id v43 = v14;

            uint64_t v58 = (void *)v44;
            id v14 = v43;
            uint64_t v13 = 0LL;

            goto LABEL_22;
          }

          objc_msgSend_setObject_forKeyedSubscript_(v13, v33, (uint64_t)v31, (uint64_t)v23, v34);
LABEL_18:

          ++v21;
        }

        while (v22 != v21);
        unint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v59, (uint64_t)v67, 16);
        if (!v16)
        {
LABEL_22:
          uint64_t v7 = v55;
          id v6 = v56;
          uint64_t v45 = v58;
          goto LABEL_25;
        }
      }
    }

    uint64_t v45 = 0LL;
  }

  else
  {

    __int16 v46 = (void *)MEMORY[0x189607870];
    uint64_t v63 = *MEMORY[0x1896075E0];
    uint64_t v50 = objc_msgSend_stringWithFormat_( NSString,  v47,  (uint64_t)@"Unable to resolve plugin for %@",  v48,  v49,  self->_identifier);
    uint64_t v64 = v50;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v51, (uint64_t)&v64, (uint64_t)&v63, 1);
    __int16 v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v46, v53, (uint64_t)@"PlugInKit", -1, (uint64_t)v52);
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();

    id v14 = (id)v50;
    uint64_t v13 = 0LL;
  }

- (NSString)localizedName
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_localizedName) {
    objc_msgSend__loadLocalizedNames(v2, v3, v4, v5, v6);
  }
  objc_sync_exit(v2);

  pklog_handle_for_category(3);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_uuid(v2, v8, v9, v10, v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v2, v13, v14, v15, v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_version(v2, v18, v19, v20, v21);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    localizedName = v2->_localizedName;
    int v25 = 138544130;
    uint64_t v26 = v12;
    __int16 v27 = 2112;
    uint64_t v28 = v17;
    __int16 v29 = 2112;
    uint64_t v30 = v22;
    __int16 v31 = 2112;
    uint64_t v32 = localizedName;
    _os_log_impl( &dword_186A04000,  v7,  OS_LOG_TYPE_INFO,  "[u %{public}@] [%@(%@)] got localized name: %@",  (uint8_t *)&v25,  0x2Au);
  }

  return v2->_localizedName;
}

- (NSString)localizedShortName
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_localizedShortName) {
    objc_msgSend__loadLocalizedNames(v2, v3, v4, v5, v6);
  }
  objc_sync_exit(v2);

  pklog_handle_for_category(3);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_uuid(v2, v8, v9, v10, v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v2, v13, v14, v15, v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_version(v2, v18, v19, v20, v21);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    localizedShortName = v2->_localizedShortName;
    int v25 = 138544130;
    uint64_t v26 = v12;
    __int16 v27 = 2112;
    uint64_t v28 = v17;
    __int16 v29 = 2112;
    uint64_t v30 = v22;
    __int16 v31 = 2112;
    uint64_t v32 = localizedShortName;
    _os_log_impl( &dword_186A04000,  v7,  OS_LOG_TYPE_INFO,  "[u %{public}@] [%@(%@)] got localized short name: %@",  (uint8_t *)&v25,  0x2Au);
  }

  return v2->_localizedShortName;
}

- (NSDictionary)localizedFileProviderActionNames
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_localizedFileProviderActionNames) {
    objc_msgSend__loadLocalizedFileProviderActionNames(v2, v3, v4, v5, v6);
  }
  objc_sync_exit(v2);

  return v2->_localizedFileProviderActionNames;
}

- (BOOL)useBundle:(id)a3 error:(id *)a4
{
  return 1;
}

- (void)_loadLocalizedNames
{
  uint64_t v132 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (void *)MEMORY[0x186E413A8](self, a2);
  objc_msgSend_external(self, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ls(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  int hasLSDatabaseAccess = objc_msgSend_hasLSDatabaseAccess(v13, v14, v15, v16, v17);

  if (!hasLSDatabaseAccess) {
    goto LABEL_7;
  }
  objc_msgSend_external(self, v19, v20, v21, v22);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ls(v23, v24, v25, v26, v27);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uuid(self, v29, v30, v31, v32);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_plugInRecordForUUID_(v28, v34, (uint64_t)v33, v35, v36);
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend_localizedName(v37, v38, v39, v40, v41);
    uint64_t v42 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedName = self->_localizedName;
    self->_localizedName = v42;

    objc_msgSend_localizedShortName(v37, v44, v45, v46, v47);
    uint64_t v48 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedShortName = (char *)self->_localizedShortName;
    self->_localizedShortName = v48;
  }

  else
  {
    pklog_handle_for_category(3);
    localizedShortName = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)localizedShortName, OS_LOG_TYPE_ERROR)) {
      sub_186A25A00(self, localizedShortName, v50, v51, v52);
    }
  }

  if (!v37)
  {
LABEL_7:
    id v121 = 0LL;
    int v53 = objc_msgSend_useBundle_error_(self, v19, (uint64_t)@".", (uint64_t)&v121, v22);
    id v58 = v121;
    if (v53)
    {
      objc_msgSend_external(self, v54, v55, v56, v57);
      __int128 v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_filesystem(v59, v60, v61, v62, v63);
      uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_url(self, v65, v66, v67, v68);
      uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bundleWithURL_(v64, v70, (uint64_t)v69, v71, v72);
      uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_localizedInfoDictionary(v73, v74, v75, v76, v77);
      uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v78, v79, (uint64_t)@"CFBundleDisplayName", v80, v81);
      uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v87 = v86;
      if (!v86)
      {
        objc_msgSend_bundleInfoDictionary(self, v82, v83, v84, v85);
        uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v69, v88, (uint64_t)@"CFBundleDisplayName", v89, v90);
        uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_storeStrong((id *)&self->_localizedName, v87);
      if (!v86)
      {
      }

      objc_msgSend_objectForKeyedSubscript_(v78, v91, (uint64_t)@"CFBundleName", v92, v93);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v99 = v98;
      if (!v98)
      {
        objc_msgSend_bundleInfoDictionary(self, v94, v95, v96, v97);
        uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v69, v100, (uint64_t)@"CFBundleName", v101, v102);
        uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_storeStrong((id *)&self->_localizedShortName, v99);
      if (!v98)
      {
      }

      pklog_handle_for_category(3);
      uint64_t v103 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_uuid(self, v104, v105, v106, v107);
        uint64_t v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(self, v109, v110, v111, v112);
        uint64_t v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_version(self, v114, v115, v116, v117);
        uint64_t v118 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v119 = self->_localizedName;
        v120 = self->_localizedShortName;
        *(_DWORD *)buf = 138544386;
        uint64_t v123 = v108;
        __int16 v124 = 2112;
        uint64_t v125 = v113;
        __int16 v126 = 2112;
        v127 = v118;
        __int16 v128 = 2112;
        uint64_t v129 = v119;
        __int16 v130 = 2112;
        uint64_t v131 = v120;
        _os_log_debug_impl( &dword_186A04000,  v103,  OS_LOG_TYPE_DEBUG,  "[u %{public}@] [%@(%@)] BundleInfo[BundleDisplayName] is [%@], BundleInfo[BundleName] is [%@]",  buf,  0x34u);
      }
    }

    else
    {
      pklog_handle_for_category(4);
      uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v73, OS_LOG_TYPE_FAULT)) {
        sub_186A25970(self, v58, v73);
      }
    }
  }

  objc_autoreleasePoolPop(v3);
}

- (void)_loadLocalizedFileProviderActionNames
{
  uint64_t v3 = (void *)MEMORY[0x186E413A8](self, a2);
  id v37 = 0LL;
  int v6 = objc_msgSend_useBundle_error_(self, v4, (uint64_t)@".", (uint64_t)&v37, v5);
  id v11 = v37;
  if (v6)
  {
    objc_msgSend_external(self, v7, v8, v9, v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_filesystem(v12, v13, v14, v15, v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_url(self, v18, v19, v20, v21);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bundleWithURL_(v17, v23, (uint64_t)v22, v24, v25);
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_plugInDictionary(self, v27, v28, v29, v30);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__localizedFileProviderActionNamesForPKDict_fromBundle_(self, v32, (uint64_t)v31, (uint64_t)v26, v33);
    uint64_t v34 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    localizedFileProviderActionNames = self->_localizedFileProviderActionNames;
    self->_localizedFileProviderActionNames = v34;

    pklog_handle_for_category(3);
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      sub_186A25AA4(self, &self->_localizedFileProviderActionNames, v36);
    }
  }

  else
  {
    pklog_handle_for_category(4);
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      sub_186A25B64(self, v11, v26);
    }
  }

  objc_autoreleasePoolPop(v3);
}

- (id)_localizedFileProviderActionNamesForPKDict:(id)a3 fromBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_opt_new();
  uint64_t v9 = (void *)MEMORY[0x186E413A8]();
  objc_msgSend_objectForKeyedSubscript_(v6, v10, (uint64_t)@"NSExtensionFileProviderActions", v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = sub_186A17B88;
    v27[3] = &unk_189F20E58;
    uint64_t v28 = v8;
    id v29 = v7;
    uint64_t v30 = self;
    objc_msgSend_enumerateObjectsUsingBlock_(v13, v14, (uint64_t)v27, v15, v16);

    uint64_t v17 = v28;
  }

  else
  {
    pklog_handle_for_category(3);
    uint64_t v17 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEBUG)) {
      sub_186A25BF4(self, v17, v18, v19, v20);
    }
  }

  objc_autoreleasePoolPop(v9);
  uint64_t v25 = (void *)objc_msgSend_copy(v8, v21, v22, v23, v24);

  return v25;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  objc_msgSend_uuid(self, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(self, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(self, v14, v15, v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_discoveryInstanceUUID(self, v19, v20, v21, v22);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(self, v24, v25, v26, v27);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = (void *)objc_msgSend_initWithFormat_( v3,  v29,  (uint64_t)@"<[u %@] [%@(%@)],[d %@] [%@]>",  v30,  v31,  v8,  v13,  v18,  v23,  v28);

  return v32;
}

- (id)debugDescription
{
  id v53 = objc_alloc(NSString);
  objc_msgSend_uuid(self, v3, v4, v5, v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(self, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(self, v13, v14, v15, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int isAppExtension = objc_msgSend_isAppExtension(self, v18, v19, v20, v21);
  unsigned int v27 = objc_msgSend_onSystemVolume(self, v23, v24, v25, v26);
  objc_msgSend_containingBundleIdentifier(self, v28, v29, v30, v31);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t Modified = objc_msgSend_lastModified(self, v33, v34, v35, v36);
  objc_msgSend_discoveryInstanceUUID(self, v38, v39, v40, v41);
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(self, v43, v44, v45, v46);
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v51 = (void *)objc_msgSend_initWithFormat_( v53,  v48,  (uint64_t)@"<PKPlugInCore: %p; uuid = [%@], identifier = [%@(%@)], isAppExtension = %d, onSystemVolume = %d, containingBundle = [%@], lastModified = %ld, discoveryInstanceUUID = [%@], path = [%@]>",
                  v49,
                  v50,
                  self,
                  v7,
                  v12,
                  v17,
                  isAppExtension,
                  v27,
                  v32,
                  Modified,
                  v42,
                  v47);

  return v51;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)originalIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setOriginalIdentifier:(id)a3
{
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setUrl:(id)a3
{
}

- (NSURL)containingUrl
{
  return (NSURL *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setContainingUrl:(id)a3
{
}

- (NSString)containingBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setContainingBundleIdentifier:(id)a3
{
}

- (BOOL)onSystemVolume
{
  return self->_onSystemVolume;
}

- (void)setOnSystemVolume:(BOOL)a3
{
  self->_onSystemVolume = a3;
}

- (NSDictionary)bundleInfoDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setBundleInfoDictionary:(id)a3
{
}

- (NSDictionary)plugInDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setPlugInDictionary:(id)a3
{
}

- (NSDictionary)entitlements
{
  return (NSDictionary *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setEntitlements:(id)a3
{
}

- (NSUUID)discoveryInstanceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 192LL, 1);
}

- (unint64_t)hubProtocolVersion
{
  return self->_hubProtocolVersion;
}

- (void)setHubProtocolVersion:(unint64_t)a3
{
  self->_hubProtocolVersion = a3;
}

- (NSString)localizedContainingName
{
  return (NSString *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setLocalizedContainingName:(id)a3
{
}

- (NSDictionary)annotations
{
  return (NSDictionary *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setAnnotations:(id)a3
{
}

- (int64_t)lastModified
{
  return self->_lastModified;
}

- (void)setLastModified:(int64_t)a3
{
  self->_lastuint64_t Modified = a3;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSData)cdhash
{
  return (NSData *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setCdhash:(id)a3
{
}

- (NSString)requirement
{
  return (NSString *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setRequirement:(id)a3
{
}

- (NSURL)dataContainerURL
{
  return self->_dataContainerURL;
}

- (BOOL)isRBManaged
{
  return self->_isRBManaged;
}

- (void)setIsRBManaged:(BOOL)a3
{
  self->_uint64_t isRBManaged = a3;
}

- (NSArray)launchPersonas
{
  return (NSArray *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setLaunchPersonas:(id)a3
{
}

- (unsigned)extensionPointPlatform
{
  return self->_extensionPointPlatform;
}

- (unint64_t)annotationTimestamp
{
  return self->_annotationTimestamp;
}

- (void)setAnnotationTimestamp:(unint64_t)a3
{
  self->_annotationTimestamp = a3;
}

- (PKExternalProviders)external
{
  return self->_external;
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

  ;
}

  ;
}

@end