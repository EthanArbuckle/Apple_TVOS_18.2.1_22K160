@interface PKHost
+ (id)defaultHost;
- (NSDictionary)hostInfoPlist;
- (NSMapTable)discoveryMap;
- (NSMutableDictionary)activeOneShots;
- (NSMutableDictionary)activePlugIns;
- (OS_dispatch_queue)hostQueue;
- (PKDaemonClient)daemon;
- (PKExternalProviders)external;
- (PKHost)init;
- (PKHost)initWithDaemon:(id)a3 externalProviders:(id)a4;
- (id)activatePlugIn:(id)a3;
- (id)activePlugInForIdentifier:(id)a3;
- (id)continuouslyDiscoverPlugInsForAttributes:(id)a3 flags:(unint64_t)a4 found:(id)a5;
- (id)findPlugInByUUID:(id)a3 withError:(id *)a4;
- (id)rewriteDiscoveryAttributes:(id)a3 flags:(unint64_t)a4;
- (void)_findPlugInByUUID:(id)a3 synchronously:(BOOL)a4 reply:(id)a5;
- (void)accessPlugIns:(id)a3 synchronously:(BOOL)a4 flags:(unint64_t)a5 extensions:(id)a6;
- (void)cancelPlugInDiscovery:(id)a3;
- (void)deactivatePlugIn:(id)a3;
- (void)discoverPlugInsForAttributes:(id)a3 flags:(unint64_t)a4 found:(id)a5;
- (void)findPlugInByPathURL:(id)a3 reply:(id)a4;
- (void)findPlugInByUUID:(id)a3 reply:(id)a4;
- (void)readyPlugIns:(id)a3 synchronously:(BOOL)a4 environment:(id)a5 languages:(id)a6 persona:(id)a7 sandbox:(id)a8 ready:(id)a9;
- (void)setActiveOneShots:(id)a3;
- (void)setActivePlugIns:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setDiscoveryMap:(id)a3;
- (void)setElection:(int64_t)a3 forPlugIn:(id)a4;
- (void)setExtensionState:(id)a3 forPlugIn:(id)a4;
- (void)setHostQueue:(id)a3;
@end

@implementation PKHost

- (PKHost)init
{
  v3 = objc_alloc(&OBJC_CLASS___PKDaemonClient);
  v7 = (void *)objc_msgSend_initWithServiceName_(v3, v4, 0, v5, v6);
  v8 = (void *)objc_opt_new();
  v11 = (PKHost *)objc_msgSend_initWithDaemon_externalProviders_(self, v9, (uint64_t)v7, (uint64_t)v8, v10);

  return v11;
}

- (PKHost)initWithDaemon:(id)a3 externalProviders:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___PKHost;
  v12 = -[PKHost init](&v45, sel_init);
  if (v12)
  {
    objc_msgSend_frameworkQueueAttr(PKCapabilities, v8, v9, v10, v11);
    v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v14 = dispatch_queue_create("host", v13);
    objc_msgSend_setHostQueue_(v12, v15, (uint64_t)v14, v16, v17);

    objc_msgSend_dictionaryWithCapacity_(MEMORY[0x189603FC8], v18, 100, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setActivePlugIns_(v12, v22, (uint64_t)v21, v23, v24);

    objc_msgSend_dictionary(MEMORY[0x189603FC8], v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setActiveOneShots_(v12, v30, (uint64_t)v29, v31, v32);

    objc_msgSend_strongToWeakObjectsMapTable(MEMORY[0x189607920], v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDiscoveryMap_(v12, v38, (uint64_t)v37, v39, v40);

    objc_msgSend_setDaemon_(v12, v41, (uint64_t)v6, v42, v43);
    objc_storeStrong((id *)&v12->_external, a4);
  }

  return v12;
}

+ (id)defaultHost
{
  if (qword_18C4AE200 != -1) {
    dispatch_once(&qword_18C4AE200, &unk_189F20AF0);
  }
  return (id)qword_18C4AE1F8;
}

- (void)_findPlugInByUUID:(id)a3 synchronously:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  objc_msgSend_daemon(self, v10, v11, v12, v13);
  dispatch_queue_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = sub_186A0EE2C;
  v17[3] = &unk_189F20B68;
  v17[4] = self;
  id v18 = v8;
  id v15 = v8;
  objc_msgSend_findPlugInByUUID_synchronously_reply_(v14, v16, (uint64_t)v9, v5, (uint64_t)v17);
}

- (void)findPlugInByUUID:(id)a3 reply:(id)a4
{
}

- (id)findPlugInByUUID:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_186A0F0CC;
  v21 = sub_186A0F0DC;
  id v22 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  dispatch_queue_t v14 = sub_186A0F0CC;
  id v15 = sub_186A0F0DC;
  id v16 = 0LL;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = sub_186A0F324;
  v10[3] = &unk_189F20B90;
  v10[4] = &v11;
  v10[5] = &v17;
  objc_msgSend__findPlugInByUUID_synchronously_reply_(self, v7, (uint64_t)v6, 1, (uint64_t)v10);
  if (a4) {
    *a4 = (id) v12[5];
  }
  id v8 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (void)findPlugInByPathURL:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_daemon(self, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = sub_186A0F440;
  v16[3] = &unk_189F20B68;
  v16[4] = self;
  id v17 = v6;
  id v13 = v6;
  objc_msgSend_findPlugInByPathURL_reply_(v12, v14, (uint64_t)v7, (uint64_t)v16, v15);
}

- (void)discoverPlugInsForAttributes:(id)a3 flags:(unint64_t)a4 found:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_msgSend_UUID(MEMORY[0x189607AB8], v10, v11, v12, v13);
  dispatch_queue_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  activity = _os_activity_create(&dword_186A04000, "discovery", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186A0F8F0;
  block[3] = &unk_189F20C08;
  id v20 = v8;
  v21 = self;
  id v23 = v9;
  unint64_t v24 = a4;
  id v22 = v14;
  id v15 = v9;
  id v16 = v14;
  id v17 = v8;
  os_activity_apply(activity, block);
}

- (id)rewriteDiscoveryAttributes:(id)a3 flags:(unint64_t)a4
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)@"NSExtensionPointName", v6, v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    id v13 = v4;
  }

  else
  {
    dispatch_queue_t v14 = (void *)MEMORY[0x189603FC8];
    uint64_t v15 = objc_msgSend_count(v4, v9, v10, v11, v12);
    objc_msgSend_dictionaryWithCapacity_(v14, v16, v15, v17, v18);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    id v52 = v4;
    id v19 = v4;
    unint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v54, (uint64_t)v58, 16);
    if (v21)
    {
      uint64_t v25 = *(void *)v55;
      uint64_t v26 = @"com.apple.version";
      uint64_t v27 = @"NSExtensionIdentifier";
      do
      {
        uint64_t v28 = 0LL;
        if (v21 <= 1) {
          uint64_t v29 = 1LL;
        }
        else {
          uint64_t v29 = v21;
        }
        uint64_t v53 = v29;
        do
        {
          if (*(void *)v55 != v25) {
            objc_enumerationMutation(v19);
          }
          v33 = *(void **)(*((void *)&v54 + 1) + 8 * v28);
          if (objc_msgSend_isEqualToString_(v33, v22, (uint64_t)@"com.apple.identifier", v23, v24))
          {
            objc_msgSend_objectForKeyedSubscript_(v19, v34, (uint64_t)v33, v35, v36);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v13, v31, (uint64_t)v30, (uint64_t)v27, v32);
          }

          else if (objc_msgSend_isEqualToString_(v33, v34, (uint64_t)v26, v35, v36))
          {
            objc_msgSend_objectForKeyedSubscript_(v19, v37, (uint64_t)v33, v38, v39);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v13, v40, (uint64_t)v30, (uint64_t)@"NSExtensionVersion", v41);
          }

          else
          {
            uint64_t v42 = v25;
            uint64_t v43 = v27;
            v44 = v26;
            int isEqualToString = objc_msgSend_isEqualToString_(v33, v37, (uint64_t)@"com.apple.protocol", v38, v39);
            objc_msgSend_objectForKeyedSubscript_(v19, v46, (uint64_t)v33, v47, v48);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (isEqualToString) {
              objc_msgSend_setObject_forKeyedSubscript_( v13,  v49,  (uint64_t)v30,  (uint64_t)@"NSExtensionPointName",  v50);
            }
            else {
              objc_msgSend_setObject_forKeyedSubscript_(v13, v49, (uint64_t)v30, (uint64_t)v33, v50);
            }
            uint64_t v26 = v44;
            uint64_t v27 = v43;
            uint64_t v25 = v42;
            uint64_t v29 = v53;
          }

          ++v28;
        }

        while (v29 != v28);
        unint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v54, (uint64_t)v58, 16);
      }

      while (v21);
    }

    id v4 = v52;
  }

  return v13;
}

- (id)continuouslyDiscoverPlugInsForAttributes:(id)a3 flags:(unint64_t)a4 found:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = objc_alloc(&OBJC_CLASS___PKDiscoveryDriver);
  uint64_t v12 = (void *)objc_msgSend_initWithAttributes_flags_host_report_(v10, v11, (uint64_t)v9, a4, (uint64_t)self, v8);

  objc_msgSend_performWithPreviousResults_forceNotify_(v12, v13, 0, 1, v14);
  return v12;
}

- (void)cancelPlugInDiscovery:(id)a3
{
}

- (void)accessPlugIns:(id)a3 synchronously:(BOOL)a4 flags:(unint64_t)a5 extensions:(id)a6
{
  BOOL v6 = a4;
  id v9 = a6;
  id v10 = a3;
  objc_msgSend_daemon(self, v11, v12, v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = sub_186A109A4;
  v18[3] = &unk_189F20C30;
  id v19 = v9;
  id v16 = v9;
  objc_msgSend_accessPlugIns_synchronously_flags_reply_(v15, v17, (uint64_t)v10, v6, 0, v18);
}

- (void)readyPlugIns:(id)a3 synchronously:(BOOL)a4 environment:(id)a5 languages:(id)a6 persona:(id)a7 sandbox:(id)a8 ready:(id)a9
{
  BOOL v13 = a4;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a3;
  objc_msgSend_daemon(self, v22, v23, v24, v25);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1895F87A8];
  v29[1] = 3221225472LL;
  v29[2] = sub_186A10B38;
  v29[3] = &unk_189F20C58;
  v29[4] = self;
  id v30 = v16;
  id v27 = v16;
  objc_msgSend_readyPlugIns_synchronously_flags_environment_languages_persona_sandbox_reply_( v26,  v28,  (uint64_t)v21,  v13,  0,  v20,  v19,  v18,  v17,  v29);
}

- (void)setElection:(int64_t)a3 forPlugIn:(id)a4
{
  v47[1] = *MEMORY[0x1895F89C0];
  id v6 = a4;
  uint64_t v7 = (void *)objc_opt_new();
  objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v8, a3, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v7, v12, (uint64_t)v11, (uint64_t)@"election", v13);

  objc_msgSend_bootInstance(v6, v14, v15, v16, v17);
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v7, v19, (uint64_t)v18, (uint64_t)@"bootuuid", v20);

  id v21 = (void *)MEMORY[0x189607968];
  uint64_t v26 = objc_msgSend_annotationTimestamp(v6, v22, v23, v24, v25);
  objc_msgSend_numberWithUnsignedLongLong_(v21, v27, v26, v28, v29);
  id v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v7, v31, (uint64_t)v30, (uint64_t)@"timestamp", v32);

  objc_msgSend_daemon(self, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uuid(v6, v38, v39, v40, v41);
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();

  v47[0] = v42;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v43, (uint64_t)v47, 1, v44);
  objc_super v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPluginAnnotations_annotations_reply_(v37, v46, (uint64_t)v45, (uint64_t)v7, (uint64_t)&unk_189F20C98);
}

- (void)setExtensionState:(id)a3 forPlugIn:(id)a4
{
  v45[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = (void *)MEMORY[0x189604A60];
  }
  id v8 = a4;
  uint64_t v9 = (void *)objc_opt_new();
  objc_msgSend_setObject_forKeyedSubscript_(v9, v10, (uint64_t)v7, (uint64_t)@"extension", v11);
  objc_msgSend_bootInstance(v8, v12, v13, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v9, v17, (uint64_t)v16, (uint64_t)@"bootuuid", v18);

  id v19 = (void *)MEMORY[0x189607968];
  uint64_t v24 = objc_msgSend_annotationTimestamp(v8, v20, v21, v22, v23);
  objc_msgSend_numberWithUnsignedLongLong_(v19, v25, v24, v26, v27);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v9, v29, (uint64_t)v28, (uint64_t)@"timestamp", v30);

  objc_msgSend_daemon(self, v31, v32, v33, v34);
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uuid(v8, v36, v37, v38, v39);
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();

  v45[0] = v40;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v41, (uint64_t)v45, 1, v42);
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPluginAnnotations_annotations_reply_(v35, v44, (uint64_t)v43, (uint64_t)v9, (uint64_t)&unk_189F20CB8);
}

- (id)activePlugInForIdentifier:(id)a3
{
  id v8 = a3;
  if (!v8) {
    objc_msgSend_raise_format_( MEMORY[0x189603F70],  v4,  *MEMORY[0x189603A58],  (uint64_t)@"activePlugInForIdentifier: nil not allowed",  v7);
  }
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = sub_186A0F0CC;
  uint64_t v20 = sub_186A0F0DC;
  id v21 = 0LL;
  objc_msgSend_hostQueue(self, v4, v5, v6, v7);
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186A110C8;
  block[3] = &unk_189F20B40;
  id v14 = v8;
  uint64_t v15 = &v16;
  void block[4] = self;
  id v10 = v8;
  dispatch_sync(v9, block);

  id v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

- (id)activatePlugIn:(id)a3
{
  id v5 = a3;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  id v21 = sub_186A0F0CC;
  uint64_t v22 = sub_186A0F0DC;
  id v23 = 0LL;
  objc_msgSend_hostQueue(self, v6, v7, v8, v9);
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = sub_186A11258;
  v14[3] = &unk_189F20CE0;
  v14[4] = self;
  id v15 = v5;
  uint64_t v16 = &v18;
  SEL v17 = a2;
  id v11 = v5;
  dispatch_sync(v10, v14);

  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

- (void)deactivatePlugIn:(id)a3
{
  id v5 = a3;
  objc_msgSend_hostQueue(self, v6, v7, v8, v9);
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186A116E0;
  block[3] = &unk_189F20D08;
  id v13 = v5;
  id v14 = self;
  SEL v15 = a2;
  id v11 = v5;
  dispatch_sync(v10, block);
}

- (NSDictionary)hostInfoPlist
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186A11A78;
  block[3] = &unk_189F20630;
  void block[4] = self;
  if (qword_18C697328 != -1) {
    dispatch_once(&qword_18C697328, block);
  }
  return self->_hostInfoPlist;
}

- (NSMutableDictionary)activePlugIns
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setActivePlugIns:(id)a3
{
}

- (NSMutableDictionary)activeOneShots
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setActiveOneShots:(id)a3
{
}

- (NSMapTable)discoveryMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setDiscoveryMap:(id)a3
{
}

- (OS_dispatch_queue)hostQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setHostQueue:(id)a3
{
}

- (PKDaemonClient)daemon
{
  return (PKDaemonClient *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setDaemon:(id)a3
{
}

- (PKExternalProviders)external
{
  return (PKExternalProviders *)objc_getProperty(self, a2, 56LL, 1);
}

- (void).cxx_destruct
{
}

@end