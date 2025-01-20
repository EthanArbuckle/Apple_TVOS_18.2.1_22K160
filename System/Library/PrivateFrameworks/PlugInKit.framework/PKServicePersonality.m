@interface PKServicePersonality
- (NSString)description;
- (NSUserDefaults)preferences;
- (NSXPCConnection)connection;
- (PKService)service;
- (PKServicePersonality)initWithConnection:(id)a3 service:(id)a4;
- (double)cleanExitTimeout;
- (id)defaultPrincipalObject;
- (id)embeddedPrincipal;
- (id)findProtocol:(id)a3;
- (id)hostPrincipal;
- (id)plugInPrincipal;
- (id)setupWithIdentifier:(id)a3 extensionPointPlatform:(unsigned int)a4;
- (void)beginUsingPlugIn:(id)a3 ready:(id)a4;
- (void)hostHasControl;
- (void)prefsObjectForKey:(id)a3 inPlugIn:(id)a4 result:(id)a5;
- (void)prefsSetObject:(id)a3 forKey:(id)a4 inPlugIn:(id)a5 result:(id)a6;
- (void)prepareUsing:(id)a3 reply:(id)a4;
- (void)prepareUsingPlugIn:(id)a3 hostProtocol:(id)a4 reply:(id)a5;
- (void)setConnection:(id)a3;
- (void)setEmbeddedPrincipal:(id)a3;
- (void)setHostPrincipal:(id)a3;
- (void)setPlugInPrincipal:(id)a3;
- (void)setPreferences:(id)a3;
- (void)shutdownPlugIn;
@end

@implementation PKServicePersonality

- (PKServicePersonality)initWithConnection:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_external(v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v85.receiver = self;
  v85.super_class = (Class)&OBJC_CLASS___PKServicePersonality;
  v13 = -[PKPlugInCore initWithExternalProviders:](&v85, sel_initWithExternalProviders_, v12);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_service, a4);
    objc_msgSend_setConnection_(v13, v14, (uint64_t)v6, v15, v16);
    objc_msgSend_connection(v13, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setExportedObject_(v21, v22, (uint64_t)v13, v23, v24);

    objc_msgSend_interfaceWithProtocol_(MEMORY[0x189607B48], v25, (uint64_t)&unk_18C69B430, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_connection(v13, v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setExportedInterface_(v33, v34, (uint64_t)v28, v35, v36);

    objc_msgSend_interfaceWithProtocol_(MEMORY[0x189607B48], v37, (uint64_t)&unk_18C6A1518, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_connection(v13, v41, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRemoteObjectInterface_(v45, v46, (uint64_t)v40, v47, v48);

    objc_initWeak(&location, v13);
    objc_initWeak(&from, v13->_connection);
    uint64_t v49 = MEMORY[0x1895F87A8];
    v80[0] = MEMORY[0x1895F87A8];
    v80[1] = 3221225472LL;
    v80[2] = sub_186A18494;
    v80[3] = &unk_189F20E80;
    objc_copyWeak(&v81, &location);
    objc_copyWeak(&v82, &from);
    objc_msgSend_connection(v13, v50, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInterruptionHandler_(v54, v55, (uint64_t)v80, v56, v57);

    v76[0] = v49;
    v76[1] = 3221225472LL;
    v76[2] = sub_186A185C8;
    v76[3] = &unk_189F20EA8;
    objc_copyWeak(&v78, &location);
    objc_copyWeak(&v79, &from);
    id v77 = v7;
    objc_msgSend_connection(v13, v58, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInvalidationHandler_(v62, v63, (uint64_t)v76, v64, v65);

    objc_msgSend_connection(v13, v66, v67, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resume(v70, v71, v72, v73, v74);

    objc_destroyWeak(&v79);
    objc_destroyWeak(&v78);
    objc_destroyWeak(&v82);
    objc_destroyWeak(&v81);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (id)setupWithIdentifier:(id)a3 extensionPointPlatform:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  objc_msgSend_external(self, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filesystem(v11, v12, v13, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mainBundle(v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_infoDictionary(v21, v22, v23, v24, v25);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  sub_186A12A34(v26);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_dictionary(MEMORY[0x189603FC8], v28, v29, v30, v31);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleURL(v21, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend_setupWithName_extensionPointPlatform_url_bundleInfo_uuid_discoveryInstanceUUID_extensionPointCache_( self,  v38,  (uint64_t)v6,  v4,  (uint64_t)v37,  v27,  0,  0,  v32);

  if ((v4 & 1) != 0)
  {
    objc_msgSend_service(self, v39, v40, v41, v42);
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_registerPersonality_(v43, v44, (uint64_t)self, v45, v46);

    uint64_t v47 = objc_alloc(&OBJC_CLASS___PKServiceDefaults);
    uint64_t v51 = (os_log_s *)objc_msgSend_initWithPersonality_(v47, v48, (uint64_t)self, v49, v50);
    objc_msgSend_setPreferences_(self, v52, (uint64_t)v51, v53, v54);
    v55 = 0LL;
  }

  else
  {
    objc_msgSend_bundleIdentifier(v21, v39, v40, v41, v42);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    pkErrorf( 4LL,  @"failed to initialize personality %@ for pluginkit plugin %@",  v56,  v57,  v58,  v59,  v60,  v61,  (uint64_t)v6);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    pklog_handle_for_category(7);
    uint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      sub_186A25D74();
    }
  }

  return v55;
}

- (void)prepareUsing:(id)a3 reply:(id)a4
{
  uint64_t v189 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = (void (**)(id, void *, void))a4;
  pklog_handle_for_category(7);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, v5);

  pklog_handle_for_category(7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v9;
  os_signpost_id_t spid = v8;
  unint64_t v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( &dword_186A04000,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v8,  "ExtensionPrepareUsing",  (const char *)&unk_186A2C58B,  buf,  2u);
  }

  objc_msgSend_objectForKeyedSubscript_(v5, v12, (uint64_t)@"identifier", v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v16, (uint64_t)@"hostProtocol", v17, v18);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v20, (uint64_t)@"epPlatform", v21, v22);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v171 = objc_msgSend_unsignedIntValue(v23, v24, v25, v26, v27);
  objc_msgSend_objectForKeyedSubscript_(v5, v28, (uint64_t)@"isRBManaged", v29, v30);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v36 = objc_msgSend_BOOLValue(v31, v32, v33, v34, v35);
  objc_msgSend_objectForKeyedSubscript_(v5, v37, (uint64_t)@"version", v38, v39);
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v45 = objc_msgSend_unsignedIntegerValue(v40, v41, v42, v43, v44);
  objc_msgSend_setHubProtocolVersion_(self, v46, v45, v47, v48);

  if (!objc_msgSend_hubProtocolVersion(self, v49, v50, v51, v52)) {
    objc_msgSend_setHubProtocolVersion_(self, v53, 1, v54, v55);
  }
  objc_msgSend_setIsRBManaged_(self, v53, v36, v54, v55);
  pklog_handle_for_category(7);
  uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
  {
    uint64_t v57 = "will not";
    if ((_DWORD)v36) {
      uint64_t v57 = "will";
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v57;
    _os_log_impl(&dword_186A04000, v56, OS_LOG_TYPE_INFO, "%@: %s be managed by runningboard", buf, 0x16u);
  }

  id v58 = objc_alloc(MEMORY[0x189607AB8]);
  objc_msgSend_objectForKeyedSubscript_(v5, v59, (uint64_t)@"uuid", v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v66 = objc_msgSend_initWithUUIDString_(v58, v63, (uint64_t)v62, v64, v65);

  v70 = self;
  if (v66) {
    objc_msgSend_setUuid_(self, v67, v66, v68, v69);
  }
  v173 = (void *)v66;
  pklog_handle_for_category(7);
  v71 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_uuid(self, v72, v73, v74, v75);
    id v170 = v5;
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(self, v77, v78, v79, v80);
    id v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_version(self, v82, v83, v84, v85);
    v168 = v15;
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v6;
    v88 = v31;
    v89 = v23;
    v90 = v19;
    uid_t v91 = geteuid();
    uid_t v92 = getuid();
    *(_DWORD *)buf = 138544386;
    *(void *)&buf[4] = v76;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v81;
    __int16 v183 = 2112;
    v184 = v86;
    __int16 v185 = 1024;
    uid_t v186 = v91;
    uint64_t v19 = v90;
    uint64_t v23 = v89;
    uint64_t v31 = v88;
    id v6 = v87;
    __int16 v187 = 1024;
    uid_t v188 = v92;
    _os_log_impl( &dword_186A04000,  v71,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@] [%@(%@)] Prepare received as euid = %d, uid = %d, (persona not available)",  buf,  0x2Cu);

    uint64_t v15 = v168;
    id v5 = v170;
    v70 = self;
  }

  uint64_t v95 = objc_msgSend_setupWithIdentifier_extensionPointPlatform_(v70, v93, (uint64_t)v15, v171, v94);
  if (v95)
  {
    v100 = (void *)v95;
    pklog_handle_for_category(7);
    v101 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v102 = v101;
    v103 = v100;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v101))
    {
      uint64_t v108 = objc_msgSend_code(v100, v104, v105, v106, v107);
      *(void *)buf = 67240448LL;
      *(_WORD *)&buf[8] = 2050;
      *(void *)&buf[10] = v108;
      _os_signpost_emit_with_name_impl( &dword_186A04000,  v102,  OS_SIGNPOST_INTERVAL_END,  spid,  "ExtensionPrepareUsing",  " success=%{public, signpost.description:attribute}d  error=%{public, signpost.description:attribute}llu ",  buf,  0x12u);
    }

    v6[2](v6, v100, 0LL);
  }

  else
  {
    v169 = v15;
    v166 = v19;
    v167 = v6;
    v164 = v31;
    v165 = v23;
    if (v19)
    {
      id v180 = 0LL;
      sub_186A130E4(v19, &v180);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      id v110 = v180;
      id v172 = v110;
      if (v109)
      {
        objc_msgSend_interfaceWithProtocol_(MEMORY[0x189607B48], v111, (uint64_t)v109, v113, v114);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_connection(self, v116, v117, v118, v119);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_exportedInterface(v120, v121, v122, v123, v124);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_( v125,  v126,  (uint64_t)v115,  (uint64_t)sel_beginUsingPlugIn_ready_,  0,  0);
      }

      else
      {
        v127 = (void *)MEMORY[0x189603F70];
        uint64_t v128 = *MEMORY[0x189603A58];
        objc_msgSend_localizedDescription(v110, v111, v112, v113, v114);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_raise_format_(v127, v129, v128, (uint64_t)@"%@", v130, v115);
      }

      v70 = self;
    }

    else
    {
      id v172 = 0LL;
    }

    __int128 v178 = 0u;
    __int128 v179 = 0u;
    __int128 v176 = 0u;
    __int128 v177 = 0u;
    objc_msgSend_service(v70, v96, v97, v98, v99);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_subsystems(v131, v132, v133, v134, v135);
    v136 = (void *)objc_claimAutoreleasedReturnValue();

    unint64_t v138 = objc_msgSend_countByEnumeratingWithState_objects_count_(v136, v137, (uint64_t)&v176, (uint64_t)v181, 16);
    if (v138)
    {
      uint64_t v139 = *(void *)v177;
      do
      {
        uint64_t v140 = 0LL;
        if (v138 <= 1) {
          uint64_t v141 = 1LL;
        }
        else {
          uint64_t v141 = v138;
        }
        do
        {
          if (*(void *)v177 != v139) {
            objc_enumerationMutation(v136);
          }
          uint64_t v143 = *(void *)(*((void *)&v176 + 1) + 8 * v140);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v144 = (objc_class *)objc_opt_class();
            NSStringFromClass(v144);
            v145 = (void *)objc_claimAutoreleasedReturnValue();
            pklog_handle_for_category(7);
            v146 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            v147 = v146;
            if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v146))
            {
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v173;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v145;
              _os_signpost_emit_with_name_impl( &dword_186A04000,  v147,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "ExtensionSubsystemBeginUsing",  " uuid=%{public, signpost.description:attribute}@  name=%{public, signpost.description:attribute}@ ",  buf,  0x16u);
            }

            objc_msgSend_mainBundle(MEMORY[0x1896077F8], v148, v149, v150, v151);
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            __PLUGINKIT_CALLING_OUT_TO_CLIENT_SUBSYSTEM_FOR_BEGINUSING__(v143, (uint64_t)self, (uint64_t)v152, v153, v154);

            pklog_handle_for_category(7);
            v155 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            v156 = v155;
            if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v155))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl( &dword_186A04000,  v156,  OS_SIGNPOST_INTERVAL_END,  spid,  "ExtensionSubsystemBeginUsing",  (const char *)&unk_186A2C58B,  buf,  2u);
            }
          }

          ++v140;
        }

        while (v141 != v140);
        unint64_t v138 = objc_msgSend_countByEnumeratingWithState_objects_count_(v136, v142, (uint64_t)&v176, (uint64_t)v181, 16);
      }

      while (v138);
    }

    objc_msgSend_dictionary(MEMORY[0x189603FC8], v157, v158, v159, v160);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    pklog_handle_for_category(7);
    v162 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v163 = v162;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v162))
    {
      *(void *)buf = 0x104020200LL;
      *(_WORD *)&buf[8] = 2050;
      *(void *)&buf[10] = 0LL;
      _os_signpost_emit_with_name_impl( &dword_186A04000,  v163,  OS_SIGNPOST_INTERVAL_END,  spid,  "ExtensionPrepareUsing",  " success=%{public, signpost.description:attribute}d  error=%{public, signpost.description:attribute}llu ",  buf,  0x12u);
    }

    id v6 = v167;
    ((void (**)(id, void *, void *))v167)[2](v167, 0LL, v161);

    uint64_t v15 = v169;
    uint64_t v23 = v165;
    uint64_t v19 = v166;
    uint64_t v31 = v164;
    v103 = v172;
  }
}

- (void)prepareUsingPlugIn:(id)a3 hostProtocol:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x189603FC8];
  id v11 = a3;
  objc_msgSend_dictionary(v10, v12, v13, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)v11, (uint64_t)@"identifier", v18);

  if (v8) {
    objc_msgSend_setObject_forKeyedSubscript_(v16, v19, (uint64_t)v8, (uint64_t)@"hostProtocol", v20);
  }
  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = sub_186A19274;
  v24[3] = &unk_189F20ED0;
  v24[4] = self;
  id v25 = v9;
  id v21 = v9;
  objc_msgSend_prepareUsing_reply_(self, v22, (uint64_t)v16, (uint64_t)v24, v23);
}

- (void)beginUsingPlugIn:(id)a3 ready:(id)a4
{
  uint64_t v122 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  pklog_handle_for_category(7);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_uuid(self, v12, v13, v14, v15);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(self, v17, v18, v19, v20);
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_version(self, v22, v23, v24, v25);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = geteuid();
    int v112 = 138544386;
    uint64_t v113 = v16;
    __int16 v114 = 2112;
    v115 = v21;
    __int16 v116 = 2112;
    uint64_t v117 = v4;
    __int16 v118 = 1024;
    int v119 = v5;
    __int16 v120 = 1024;
    uid_t v121 = getuid();
    _os_log_impl( &dword_186A04000,  v11,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@] [%@(%@)] Begin using received as euid = %d, uid = %d, (persona not available)",  (uint8_t *)&v112,  0x2Cu);
  }

  objc_msgSend_service(self, v26, v27, v28, v29);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_delegate(v30, v31, v32, v33, v34);
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    objc_msgSend_service(self, v35, v36, v37, v38);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = objc_msgSend_delegate(v4, v40, v41, v42, v43);
    objc_msgSend_identifier(self, v44, v45, v46, v47);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_rootObjectForPlugIn_((void *)v5, v48, (uint64_t)v6, v49, v50);
  }

  else
  {
    objc_msgSend_defaultPrincipalObject(self, v35, v36, v37, v38);
  }

  uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
  id v52 = v51;
  if (v39)
  {

    uint64_t v51 = v4;
  }

  if (v52)
  {
    objc_msgSend_setPlugInPrincipal_(self, v53, (uint64_t)v52, v54, v55);
    uint64_t v56 = (void *)MEMORY[0x189607B48];
    objc_msgSend_protocolSpec(self, v57, v58, v59, v60);
    uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_findProtocol_(self, v62, (uint64_t)v61, v63, v64);
    uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_interfaceWithProtocol_(v56, v66, (uint64_t)v65, v67, v68);
    uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_connection(self, v70, v71, v72, v73);
    uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exportedInterface(v74, v75, v76, v77, v78);
    uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_( v79,  v80,  (uint64_t)v69,  (uint64_t)sel_beginUsingPlugIn_ready_,  1,  1);

    objc_msgSend_augmentInterface_(self, v81, (uint64_t)v69, v82, v83);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    if (v87)
    {
      pklog_handle_for_category(7);
      v88 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
        sub_186A25F44();
      }

      (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
      objc_msgSend_service(self, v89, v90, v91, v92);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_beganUsingServicePersonality_(v93, v94, (uint64_t)self, v95, v96);
    }

    else
    {
      objc_msgSend_setHostPrincipal_(self, v84, (uint64_t)v9, v85, v86);
      objc_msgSend_plugInPrincipal(self, v108, v109, v110, v111);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v93);
    }
  }

  else
  {
    pklog_handle_for_category(7);
    uint64_t v97 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v97, OS_LOG_TYPE_ERROR)) {
      sub_186A25EA8(self, v97, v98, v99, v100);
    }

    (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
    objc_msgSend_service(self, v101, v102, v103, v104);
    uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_beganUsingServicePersonality_(v69, v105, (uint64_t)self, v106, v107);
  }
}

- (id)findProtocol:(id)a3
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v45 = 0LL;
    sub_186A131B8(v4, &v45);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = v45;
    if (!v6)
    {
      pklog_handle_for_category(7);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_uuid(self, v9, v10, v11, v12);
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(self, v30, v31, v32, v33);
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_version(self, v35, v36, v37, v38);
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_localizedDescription(v7, v40, v41, v42, v43);
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        uint64_t v47 = v29;
        __int16 v48 = 2112;
        uint64_t v49 = v34;
        __int16 v50 = 2112;
        uint64_t v51 = v39;
        __int16 v52 = 2112;
        uint64_t v53 = v5;
        __int16 v54 = 2112;
        uint64_t v55 = v44;
        _os_log_error_impl( &dword_186A04000,  v8,  OS_LOG_TYPE_ERROR,  "[u %{public}@] [%@(%@)] failed to find protocol for [%@]: %@",  buf,  0x34u);
      }

      uint64_t v13 = (void *)MEMORY[0x189603F70];
      uint64_t v14 = *MEMORY[0x189603A58];
      objc_msgSend_localizedDescription(v7, v15, v16, v17, v18);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_raise_format_(v13, v20, v14, (uint64_t)@"unable to start plug-in: %@", v21, v19);
    }
  }

  else
  {
    pklog_handle_for_category(7);
    uint64_t v22 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR)) {
      sub_186A25FD8(self, v22, v23, v24, v25);
    }

    objc_msgSend_raise_format_( MEMORY[0x189603F70],  v26,  *MEMORY[0x189603A58],  (uint64_t)@"missing protocol specification in Info.plist",  v27);
    id v6 = 0LL;
  }

  return v6;
}

- (void)hostHasControl
{
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_beganUsingServicePersonality_(v9, v6, (uint64_t)self, v7, v8);
}

- (id)defaultPrincipalObject
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = v6;
  if (!v6)
  {
    pklog_handle_for_category(7);
    uint64_t v16 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
      sub_186A26074(self, v16, v17, v18, v19);
    }
    goto LABEL_10;
  }

  id v8 = v6;
  uint64_t v13 = (const char *)objc_msgSend_UTF8String(v8, v9, v10, v11, v12);
  Class = objc_getClass(v13);
  if (!Class)
  {
    pklog_handle_for_category(7);
    uint64_t v16 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
      sub_186A26110();
    }
LABEL_10:
    id v15 = 0LL;
LABEL_11:

    goto LABEL_12;
  }

  id v15 = objc_alloc_init(Class);
  if (!v15)
  {
    pklog_handle_for_category(7);
    uint64_t v16 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
      sub_186A261A4();
    }
    goto LABEL_11;
  }

- (double)cleanExitTimeout
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  else {
    double v9 = 15.0;
  }
  objc_msgSend_pluginKey_(self, v6, (uint64_t)@"CleanTimeout", v7, v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  pklog_handle_for_category(7);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v12)
    {
      objc_msgSend_uuid(self, v13, v14, v15, v16);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(self, v18, v19, v20, v21);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_version(self, v23, v24, v25, v26);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      int v45 = 138544130;
      uint64_t v46 = v17;
      __int16 v47 = 2112;
      __int16 v48 = v22;
      __int16 v49 = 2112;
      __int16 v50 = v27;
      __int16 v51 = 2112;
      double v52 = *(double *)&v10;
      _os_log_impl( &dword_186A04000,  v11,  OS_LOG_TYPE_INFO,  "[u %{public}@] [%@(%@)] got CleanExit value:%@",  (uint8_t *)&v45,  0x2Au);
    }

    objc_msgSend_doubleValue(v10, v28, v29, v30, v31);
    double v9 = v32;
  }

  else
  {
    if (v12)
    {
      objc_msgSend_uuid(self, v13, v14, v15, v16);
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(self, v34, v35, v36, v37);
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_version(self, v39, v40, v41, v42);
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
      int v45 = 138544130;
      uint64_t v46 = v33;
      __int16 v47 = 2112;
      __int16 v48 = v38;
      __int16 v49 = 2112;
      __int16 v50 = v43;
      __int16 v51 = 2048;
      double v52 = v9;
      _os_log_impl( &dword_186A04000,  v11,  OS_LOG_TYPE_INFO,  "[u %{public}@] [%@(%@)] setting delta:%g",  (uint8_t *)&v45,  0x2Au);
    }
  }

  return v9;
}

- (void)shutdownPlugIn
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  objc_msgSend_service(self, a2, v2, v3, v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = objc_msgSend_unregisterPersonality_(v6, v7, (uint64_t)self, v8, v9);

  if (v10)
  {
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    objc_msgSend_service(self, v11, v12, v13, v14, 0);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_subsystems(v15, v16, v17, v18, v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

    unint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v39, (uint64_t)v43, 16);
    if (v22)
    {
      uint64_t v23 = *(void *)v40;
      do
      {
        uint64_t v24 = 0LL;
        if (v22 <= 1) {
          uint64_t v25 = 1LL;
        }
        else {
          uint64_t v25 = v22;
        }
        do
        {
          if (*(void *)v40 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v26 = *(void **)(*((void *)&v39 + 1) + 8 * v24);
          if ((objc_opt_respondsToSelector() & 1) != 0) {
            objc_msgSend_endUsing_(v26, v27, (uint64_t)self, v28, v29);
          }
          ++v24;
        }

        while (v25 != v24);
        unint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v27, (uint64_t)&v39, (uint64_t)v43, 16);
      }

      while (v22);
    }

    objc_msgSend_setPlugInPrincipal_(self, v30, 0, v31, v32);
    objc_msgSend_setEmbeddedPrincipal_(self, v33, 0, v34, v35);
    objc_msgSend_setHostPrincipal_(self, v36, 0, v37, v38);
  }

- (void)prefsObjectForKey:(id)a3 inPlugIn:(id)a4 result:(id)a5
{
  uint64_t v7 = (void (**)(id, id))a5;
  id v8 = a3;
  objc_msgSend_preferences(self, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v13, v14, (uint64_t)v8, v15, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v17);
}

- (void)prefsSetObject:(id)a3 forKey:(id)a4 inPlugIn:(id)a5 result:(id)a6
{
  uint64_t v18 = (void (**)(void))a6;
  id v9 = a4;
  id v10 = a3;
  objc_msgSend_preferences(self, v11, v12, v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v15, v16, (uint64_t)v10, (uint64_t)v9, v17);

  v18[2]();
}

- (NSString)description
{
  uint64_t v3 = (void *)NSString;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PKServicePersonality;
  -[PKPlugInCore description](&v20, sel_description);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_connection(self, v5, v6, v7, v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_processIdentifier(v9, v10, v11, v12, v13);
  objc_msgSend_stringWithFormat_( v3,  v15,  (uint64_t)@"<PKServicePersonality: %p; core = %@, host pid = %d>",
    v16,
    v17,
    self,
    v4,
    v14);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v18;
}

- (id)plugInPrincipal
{
  return objc_getProperty(self, a2, 216LL, 1);
}

- (void)setPlugInPrincipal:(id)a3
{
}

- (id)hostPrincipal
{
  return objc_getProperty(self, a2, 224LL, 1);
}

- (void)setHostPrincipal:(id)a3
{
}

- (id)embeddedPrincipal
{
  return objc_getProperty(self, a2, 232LL, 1);
}

- (void)setEmbeddedPrincipal:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setConnection:(id)a3
{
}

- (NSUserDefaults)preferences
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setPreferences:(id)a3
{
}

- (PKService)service
{
  return self->_service;
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end