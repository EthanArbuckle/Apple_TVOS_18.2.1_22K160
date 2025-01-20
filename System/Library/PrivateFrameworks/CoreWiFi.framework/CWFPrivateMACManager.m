@interface CWFPrivateMACManager
- (BOOL)__calloutToAllowRotation;
- (BOOL)allowUserJoinFailureUIForNetworkProfile:(id)a3;
- (CWFPrivateMACManager)init;
- (CWFPrivateMACManager)initWithInterfaceName:(id)a3 hardwareMACAddress:(id)a4;
- (NSData)deviceKey;
- (NSData)rotationKey;
- (NSDate)rotationKeyUpdatedAt;
- (NSString)hardwareMACAddress;
- (NSString)interfaceName;
- (OS_dispatch_queue)targetQueue;
- (id)__calloutToGetEffectiveHardwareMACAddress;
- (id)allowRotationHandler;
- (id)effectiveHardwareMACAddress;
- (id)privateMACAddressForNetworkProfile:(id)a3;
- (id)updatedDeviceKeyHandler;
- (id)updatedPrivateMACAddressHandler;
- (id)updatedRotationKeyHandler;
- (id)updatedSystemSettingHandler;
- (int64_t)privateMACAddressModeForNetworkProfile:(id)a3;
- (int64_t)systemSetting;
- (int64_t)temporaryUserSettingForNetworkProfile:(id)a3;
- (void)clearTemporaryUserSettings;
- (void)invalidate;
- (void)setAllowRotationHandler:(id)a3;
- (void)setDeviceKey:(id)a3;
- (void)setEffectiveHardwareMACAddress:(id)a3;
- (void)setNetworkIDForAssociationWithMACAddress:(id)a3 networkProfile:(id)a4;
- (void)setRotationKey:(id)a3;
- (void)setRotationKeyUpdatedAt:(id)a3;
- (void)setSystemSetting:(int64_t)a3;
- (void)setTargetQueue:(id)a3;
- (void)setTemporaryUserSetting:(int64_t)a3 networkProfile:(id)a4;
- (void)setUpdatedDeviceKeyHandler:(id)a3;
- (void)setUpdatedPrivateMACAddressHandler:(id)a3;
- (void)setUpdatedRotationKeyHandler:(id)a3;
- (void)setUpdatedSystemSettingHandler:(id)a3;
- (void)setUserJoinFailureUIState:(BOOL)a3 networkProfile:(id)a4;
- (void)submitPrivateMACStatsMetricWithEventType:(id)a3 networkProfile:(id)a4;
@end

@implementation CWFPrivateMACManager

- (CWFPrivateMACManager)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  return -[CWFPrivateMACManager initWithInterfaceName:hardwareMACAddress:](v3, v4, v5, v6);
}

- (CWFPrivateMACManager)initWithInterfaceName:(id)a3 hardwareMACAddress:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___CWFPrivateMACManager;
  v9 = -[CWFPrivateMACManager init](&v39, sel_init);
  v10 = v9;
  if (!v7) {
    goto LABEL_16;
  }
  if (!v9)
  {
    rotationKeyUpdatedAt = 0LL;
    goto LABEL_15;
  }

  objc_storeStrong((id *)&v9->_interfaceName, a3);
  if (!v8) {
    goto LABEL_16;
  }
  objc_storeStrong((id *)&v10->_hardwareMACAddress, a4);
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v12 = dispatch_queue_create("com.apple.corewifi.private-mac.target", v11);
  targetQueue = v10->_targetQueue;
  v10->_targetQueue = (OS_dispatch_queue *)v12;

  if (!v10->_targetQueue) {
    goto LABEL_16;
  }
  v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  privateMACAddressCache = v10->_privateMACAddressCache;
  v10->_privateMACAddressCache = v14;

  if (!v10->_privateMACAddressCache) {
    goto LABEL_16;
  }
  v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  privateMACAddressCacheIDList = v10->_privateMACAddressCacheIDList;
  v10->_privateMACAddressCacheIDList = v16;

  if (!v10->_privateMACAddressCacheIDList) {
    goto LABEL_16;
  }
  v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  userJoinFailureTimestampMap = v10->_userJoinFailureTimestampMap;
  v10->_userJoinFailureTimestampMap = v18;

  if (!v10->_userJoinFailureTimestampMap) {
    goto LABEL_16;
  }
  v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  userJoinFailureCountMap = v10->_userJoinFailureCountMap;
  v10->_userJoinFailureCountMap = v20;

  if (!v10->_userJoinFailureCountMap) {
    goto LABEL_16;
  }
  v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  tempUserSettingMap = v10->_tempUserSettingMap;
  v10->_tempUserSettingMap = v22;

  if (!v10->_tempUserSettingMap) {
    goto LABEL_16;
  }
  v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  networkIDCache = v10->_networkIDCache;
  v10->_networkIDCache = v24;

  if (!v10->_networkIDCache) {
    goto LABEL_16;
  }
  v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  networkIDCacheIDList = v10->_networkIDCacheIDList;
  v10->_networkIDCacheIDList = v26;

  if (v10->_networkIDCacheIDList)
  {
    v10->_rotationInterval = 86400LL;
    uint64_t v28 = sub_1864541C4(0x100uLL);
    deviceKey = v10->_deviceKey;
    v10->_deviceKey = (NSData *)v28;

    uint64_t v30 = sub_1864541C4(0x100uLL);
    rotationKey = v10->_rotationKey;
    v10->_rotationKey = (NSData *)v30;

    uint64_t v36 = objc_msgSend_date(MEMORY[0x189603F50], v32, v33, v34, v35);
    rotationKeyUpdatedAt = v10->_rotationKeyUpdatedAt;
    v10->_rotationKeyUpdatedAt = (NSDate *)v36;
  }

  else
  {
LABEL_16:
    rotationKeyUpdatedAt = v10;
    v10 = 0LL;
  }

- (void)invalidate
{
}

- (NSData)rotationKey
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_rotationKey;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRotationKey:(id)a3
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v5 = (NSData *)a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  rotationKey = v6->_rotationKey;
  if (rotationKey == v5 || v5 && rotationKey && (objc_msgSend_isEqual_(rotationKey, v7, (uint64_t)v5, v8, v9) & 1) != 0)
  {
    objc_sync_exit(v6);
  }

  else
  {
    objc_storeStrong((id *)&v6->_rotationKey, a3);
    objc_msgSend_removeAllObjects(v6->_privateMACAddressCache, v11, v12, v13, v14);
    objc_msgSend_removeAllObjects(v6->_privateMACAddressCacheIDList, v15, v16, v17, v18);
    objc_sync_exit(v6);

    CWFGetOSLog();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      CWFGetOSLog();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v20 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v21 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      CWFHexadecimalStringFromData(v5, v22, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_redactedForWiFi(v26, v27, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t rotationInterval = v6->_rotationInterval;
      int v39 = 138543618;
      v40 = v31;
      __int16 v41 = 2048;
      unint64_t v42 = rotationInterval;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_targetQueue(v6, v33, v34, v35, v36);
    v37 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_186461C00;
    block[3] = &unk_189E5BC10;
    block[4] = v6;
    dispatch_async(v37, block);
  }
}

- (NSDate)rotationKeyUpdatedAt
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_rotationKeyUpdatedAt;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRotationKeyUpdatedAt:(id)a3
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v5 = (NSDate *)a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  rotationKeyUpdatedAt = v6->_rotationKeyUpdatedAt;
  if (rotationKeyUpdatedAt == v5
    || v5 && rotationKeyUpdatedAt && (objc_msgSend_isEqual_(rotationKeyUpdatedAt, v7, (uint64_t)v5, v8, v9) & 1) != 0)
  {
    objc_sync_exit(v6);
  }

  else
  {
    objc_storeStrong((id *)&v6->_rotationKeyUpdatedAt, a3);
    objc_msgSend_removeAllObjects(v6->_privateMACAddressCache, v11, v12, v13, v14);
    objc_msgSend_removeAllObjects(v6->_privateMACAddressCacheIDList, v15, v16, v17, v18);
    objc_sync_exit(v6);

    CWFGetOSLog();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      CWFGetOSLog();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v20 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v21 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t rotationInterval = v6->_rotationInterval;
      int v29 = 134217984;
      unint64_t v30 = rotationInterval;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_targetQueue(v6, v23, v24, v25, v26);
    v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_186461EA4;
    block[3] = &unk_189E5BC10;
    block[4] = v6;
    dispatch_async(v27, block);
  }
}

- (NSData)deviceKey
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_deviceKey;
  objc_sync_exit(v2);

  return v3;
}

- (void)setDeviceKey:(id)a3
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v5 = (NSData *)a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  deviceKey = v6->_deviceKey;
  if (deviceKey == v5 || v5 && deviceKey && (objc_msgSend_isEqual_(deviceKey, v7, (uint64_t)v5, v8, v9) & 1) != 0)
  {
    objc_sync_exit(v6);
  }

  else
  {
    objc_storeStrong((id *)&v6->_deviceKey, a3);
    objc_msgSend_removeAllObjects(v6->_privateMACAddressCache, v11, v12, v13, v14);
    objc_msgSend_removeAllObjects(v6->_privateMACAddressCacheIDList, v15, v16, v17, v18);
    objc_sync_exit(v6);

    CWFGetOSLog();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      CWFGetOSLog();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v20 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v21 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      CWFHexadecimalStringFromData(v5, v22, v23, v24, v25);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_redactedForWiFi(v26, v27, v28, v29, v30);
      int v37 = 138543362;
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_targetQueue(v6, v31, v32, v33, v34);
    uint64_t v35 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_186462170;
    block[3] = &unk_189E5BC10;
    block[4] = v6;
    dispatch_async(v35, block);
  }
}

- (int64_t)systemSetting
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  int64_t systemSetting = v2->_systemSetting;
  objc_sync_exit(v2);

  return systemSetting;
}

- (void)setSystemSetting:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  obj = self;
  objc_sync_enter(obj);
  if (obj->_systemSetting == a3)
  {
    objc_sync_exit(obj);
  }

  else
  {
    obj->_int64_t systemSetting = a3;
    objc_msgSend_removeAllObjects(obj->_privateMACAddressCache, v4, v5, v6, v7);
    objc_msgSend_removeAllObjects(obj->_privateMACAddressCacheIDList, v8, v9, v10, v11);
    objc_sync_exit(obj);

    CWFGetOSLog();
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      CWFGetOSLog();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v13 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v14 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      sub_1864542D4(a3);
      int v22 = 138543362;
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_targetQueue(obj, v15, v16, v17, v18);
    v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_18646240C;
    block[3] = &unk_189E5BC10;
    block[4] = obj;
    dispatch_async(v19, block);
  }

- (BOOL)__calloutToAllowRotation
{
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  v15[0] = 0LL;
  v15[1] = v15;
  v15[2] = 0x2020000000LL;
  int v16 = 0;
  dispatch_block_t v3 = dispatch_block_create((dispatch_block_flags_t)0LL, &unk_189E5BE40);
  objc_msgSend_targetQueue(self, v4, v5, v6, v7);
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = sub_1864625B0;
  v11[3] = &unk_189E5BE90;
  uint64_t v13 = &v17;
  id v14 = v15;
  v11[4] = self;
  id v12 = v3;
  id v9 = v3;
  dispatch_async(v8, v11);

  dispatch_block_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v8) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v17, 8);
  return (char)v8;
}

- (id)privateMACAddressForNetworkProfile:(id)a3
{
  uint64_t v191 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend_identifier(v4, v5, v6, v7, v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    uint64_t v179 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v10, *MEMORY[0x189607688], 22, 0);
LABEL_46:
    v131 = (void *)v179;
    v55 = 0LL;
    v50 = 0LL;
    goto LABEL_48;
  }

  if (objc_msgSend_privateMACAddressModeForNetworkProfile_(self, v10, (uint64_t)v4, v11, v12) == 1)
  {
    uint64_t v179 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v13, *MEMORY[0x189607688], 45, 0);
    goto LABEL_46;
  }

  if (objc_msgSend___calloutToAllowRotation(self, v13, v14, v15, v16))
  {
    id v21 = self;
    objc_sync_enter(v21);
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x189603F50], v22, v23, v24, v25);
    double v27 = v26;
    unint64_t rotationInterval = v21->_rotationInterval;
    objc_msgSend_timeIntervalSinceReferenceDate(v21->_rotationKeyUpdatedAt, v29, v30, v31, v32);
    if (ceil(v27 / (double)rotationInterval) != ceil(v33 / (double)v21->_rotationInterval))
    {
      sub_1864541C4(0x100uLL);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setRotationKey_(v21, v35, (uint64_t)v34, v36, v37);

      objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x189603F50], v38, v39, v40, v41, v27);
      unint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setRotationKeyUpdatedAt_(v21, v43, (uint64_t)v42, v44, v45);
    }

    objc_sync_exit(v21);
  }

  objc_msgSend_deviceKey(self, v17, v18, v19, v20);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v50)
  {
    uint64_t v179 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v46, *MEMORY[0x189607688], 6, 0);
    goto LABEL_46;
  }

  objc_msgSend_rotationKey(self, v46, v47, v48, v49);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    if (objc_msgSend_isPublicAirPlayNetwork(v4, v51, v52, v53, v54))
    {
      objc_msgSend_cachedPrivateMACAddress(v4, v56, v57, v58, v59);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v64) {
        goto LABEL_23;
      }
      objc_msgSend_lastJoinedAt(v4, v60, v61, v62, v63);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v65, v66, v67, v68, v69);
      double v71 = v70;
      objc_msgSend_lastDisconnectTimestamp(v4, v72, v73, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v76, v77, v78, v79, v80);
      double v82 = v81;

      if (v71 <= v82)
      {
LABEL_23:
        uint64_t v120 = sub_1864541C4(0x100uLL);

        objc_msgSend_hardwareMACAddress(self, v121, v122, v123, v124);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        _os_feature_enabled_impl();

        objc_msgSend_targetQueue(self, v126, v127, v128, v129);
        v130 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = sub_186462D28;
        block[3] = &unk_189E5BEB8;
        block[4] = self;
        id v181 = v4;
        id v182 = 0LL;
        dispatch_async(v130, block);

        v131 = 0LL;
        v132 = 0LL;
        v55 = (void *)v120;
        goto LABEL_31;
      }

      goto LABEL_29;
    }

    objc_msgSend_cachedPrivateMACAddress(v4, v87, v88, v89, v90);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    if (v94 && objc_msgSend_privateMACAddressModeForNetworkProfile_(self, v91, (uint64_t)v4, v92, v93) == 2)
    {
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x189603F50], v95, v96, v97, v98);
      double v100 = v99;
      objc_msgSend_cachedPrivateMACAddressUpdatedAt(v4, v101, v102, v103, v104);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v105, v106, v107, v108, v109);
      if (v100 - v114 < 1209600.0)
      {

        goto LABEL_29;
      }

      objc_msgSend_lastJoinedAt(v4, v110, v111, v112, v113);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v149, v150, v151, v152, v153);
      double v155 = v154;
      objc_msgSend_lastDisconnectTimestamp(v4, v156, v157, v158, v159);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v160, v161, v162, v163, v164);
      double v166 = v165;

      if (v155 > v166) {
        goto LABEL_29;
      }
    }

    else
    {
    }

    objc_msgSend_cachedPrivateMACAddress(v4, v83, v84, v85, v86);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v118
      || (uint64_t v119 = objc_msgSend_privateMACAddressModeForNetworkProfile_(self, v115, (uint64_t)v4, v116, v117),
          v118,
          v119 != 3))
    {
      v133 = self;
      objc_sync_enter(v133);
      privateMACAddressCache = v133->_privateMACAddressCache;
      objc_msgSend_identifier(v4, v135, v136, v137, v138);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(privateMACAddressCache, v140, (uint64_t)v139, v141, v142);
      v132 = (void *)objc_claimAutoreleasedReturnValue();

      if (v132)
      {
        id v147 = v132;
      }

      else
      {
        objc_msgSend_hardwareMACAddress(v133, v143, v144, v145, v146);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        _os_feature_enabled_impl();
      }

      objc_sync_exit(v133);
      goto LABEL_30;
    }

- (id)__calloutToGetEffectiveHardwareMACAddress
{
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  id v21 = sub_186462EE8;
  int v22 = sub_186462EF8;
  id v23 = 0LL;
  v16[0] = 0LL;
  v16[1] = v16;
  v16[2] = 0x2020000000LL;
  int v17 = 0;
  dispatch_block_t v3 = dispatch_block_create((dispatch_block_flags_t)0LL, &unk_189E5BED8);
  objc_msgSend_targetQueue(self, v4, v5, v6, v7);
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = sub_186462F04;
  v12[3] = &unk_189E5BE90;
  uint64_t v14 = &v18;
  uint64_t v15 = v16;
  v12[4] = self;
  id v13 = v3;
  id v9 = v3;
  dispatch_async(v8, v12);

  dispatch_block_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v19[5];

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  return v10;
}

- (int64_t)privateMACAddressModeForNetworkProfile:(id)a3
{
  id v4 = a3;
  int64_t v9 = objc_msgSend_identifier(v4, v5, v6, v7, v8);

  if (v9)
  {
    int64_t v9 = objc_msgSend_privateMACAddressModeUserSetting(v4, v10, v11, v12, v13);
    if (!v9)
    {
      int64_t v9 = objc_msgSend_privateMACAddressModeConfigurationProfileSetting(v4, v14, v15, v16, v17);
      if (!v9)
      {
        int64_t v9 = objc_msgSend_systemSetting(self, v14, v15, v16, v17);
        if (!v9)
        {
          if (objc_msgSend_privateMACAddressDisabledByEvaluation(v4, v14, v15, v16, v17))
          {
            int64_t v9 = 1LL;
          }

          else if ((objc_msgSend_isHotspot(v4, v14, v15, v16, v17) & 1) != 0 {
                 || (objc_msgSend_isPublicAirPlayNetwork(v4, v14, v15, v16, v17) & 1) != 0
          }
                 || (objc_msgSend_isCarPlay(v4, v14, v15, v16, v17) & 1) != 0
                 || objc_msgSend_addReason(v4, v14, v15, v16, v17) == 10
                 || objc_msgSend_addReason(v4, v14, v15, v16, v17) == 17
                 || objc_msgSend_addReason(v4, v14, v15, v16, v17) == 15
                 || objc_msgSend_addReason(v4, v14, v15, v16, v17) == 14
                 || objc_msgSend_addReason(v4, v14, v15, v16, v17) == 18
                 || (objc_msgSend_isOpen(v4, v14, v15, v16, v17) & 1) != 0
                 || (objc_msgSend_isOWE(v4, v14, v15, v16, v17) & 1) != 0
                 || (objc_msgSend_isWEP(v4, v14, v15, v16, v17) & 1) != 0
                 || (objc_msgSend_isWAPI(v4, v14, v15, v16, v17) & 1) != 0
                 || objc_msgSend_isWPA(v4, v14, v15, v16, v17))
          {
            int64_t v9 = 2LL;
          }

          else
          {
            int64_t v9 = 3LL;
          }
        }
      }
    }

    objc_msgSend_addedAt(v4, v14, v15, v16, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      uint64_t v22 = objc_msgSend_temporaryUserSettingForNetworkProfile_(self, v19, (uint64_t)v4, v20, v21);
      if (v22) {
        int64_t v9 = v22;
      }
    }
  }

  return v9;
}

- (void)submitPrivateMACStatsMetricWithEventType:(id)a3 networkProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!objc_opt_class()) {
    goto LABEL_40;
  }
  objc_msgSend_dictionary(MEMORY[0x189603FC8], v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v12, v13, (uint64_t)v6, (uint64_t)@"privateMacEvent", v14);
  uint64_t v18 = objc_msgSend_privateMACAddressModeForNetworkProfile_(self, v15, (uint64_t)v7, v16, v17);
  objc_msgSend_privateMACAddressForNetworkProfile_(self, v19, (uint64_t)v7, v20, v21);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hardwareMACAddress(self, v23, v24, v25, v26);
  double v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___calloutToGetEffectiveHardwareMACAddress(self, v28, v29, v30, v31);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v37 = v32;
  switch(v18)
  {
    case 3LL:
      if (v32 == v22 || v32 && v22 && objc_msgSend_isEqual_(v32, v33, (uint64_t)v22, v35, v36))
      {
        objc_msgSend_setObject_forKeyedSubscript_( v12,  v33,  (uint64_t)@"Static",  (uint64_t)@"privateMacType",  v36);
        break;
      }

      goto LABEL_20;
    case 2LL:
      if (v32 == v22 || v32 && v22 && objc_msgSend_isEqual_(v32, v33, (uint64_t)v22, v35, v36))
      {
        objc_msgSend_setObject_forKeyedSubscript_( v12,  v33,  (uint64_t)@"Rotating",  (uint64_t)@"privateMacType",  v36);
        break;
      }

      goto LABEL_20;
    case 1LL:
      if (v32 == v27 || v32 && v27 && objc_msgSend_isEqual_(v32, v33, (uint64_t)v27, v35, v36))
      {
        objc_msgSend_setObject_forKeyedSubscript_( v12,  v33,  (uint64_t)@"Physical",  (uint64_t)@"privateMacType",  v36);
        break;
      }

- (void)setUserJoinFailureUIState:(BOOL)a3 networkProfile:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_msgSend_identifier(v6, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11) {
    goto LABEL_13;
  }
  uint64_t v12 = self;
  objc_sync_enter(v12);
  userJoinFailureTimestampMap = v12->_userJoinFailureTimestampMap;
  objc_msgSend_identifier(v6, v14, v15, v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(userJoinFailureTimestampMap, v19, (uint64_t)v18, v20, v21);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

  userJoinFailureCountMap = v12->_userJoinFailureCountMap;
  objc_msgSend_identifier(v6, v24, v25, v26, v27);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(userJoinFailureCountMap, v29, (uint64_t)v28, v30, v31);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v37 = objc_msgSend_unsignedIntegerValue(v32, v33, v34, v35, v36);

  objc_msgSend_date(MEMORY[0x189603F50], v38, v39, v40, v41);
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v47 = v42;
  if (v4)
  {
    _os_feature_enabled_impl();
    id v48 = objc_alloc_init(MEMORY[0x189603F58]);
    objc_msgSend_setHour_(v48, v49, 5, v50, v51);
    objc_msgSend_setMinute_(v48, v52, 0, v53, v54);
    objc_msgSend_setSecond_(v48, v55, 0, v56, v57);
    objc_msgSend_currentCalendar(MEMORY[0x189603F38], v58, v59, v60, v61);
    uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v64 = objc_msgSend_nextDateAfterDate_matchingComponents_options_(v62, v63, (uint64_t)v47, (uint64_t)v48, 1024);

    v65 = v12->_userJoinFailureCountMap;
    objc_msgSend_identifier(v6, v66, v67, v68, v69);
    double v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v65, v71, 0, (uint64_t)v70, v72);

    uint64_t v73 = v12->_userJoinFailureTimestampMap;
    objc_msgSend_identifier(v6, v74, v75, v76, v77);
    uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v73, v79, v64, (uint64_t)v78, v80);
    uint64_t v22 = (void *)v64;
LABEL_6:

    goto LABEL_7;
  }

  objc_msgSend_timeIntervalSinceReferenceDate(v42, v43, v44, v45, v46);
  double v82 = v81;
  objc_msgSend_timeIntervalSinceReferenceDate(v22, v83, v84, v85, v86);
  if (v82 >= v90)
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v87, v37 + 1, v88, v89);
    uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v12->_userJoinFailureCountMap;
    objc_msgSend_identifier(v6, v92, v93, v94, v95);
    uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v91, v97, (uint64_t)v78, (uint64_t)v96, v98);

    goto LABEL_6;
  }

- (BOOL)allowUserJoinFailureUIForNetworkProfile:(id)a3
{
  id v4 = a3;
  objc_msgSend_identifier(v4, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    uint64_t v10 = self;
    objc_sync_enter(v10);
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x189603F50], v11, v12, v13, v14);
    double v16 = v15;
    userJoinFailureTimestampMap = v10->_userJoinFailureTimestampMap;
    objc_msgSend_identifier(v4, v18, v19, v20, v21);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(userJoinFailureTimestampMap, v23, (uint64_t)v22, v24, v25);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v26, v27, v28, v29, v30);
    if (v16 >= v35)
    {
      userJoinFailureCountMap = v10->_userJoinFailureCountMap;
      objc_msgSend_identifier(v4, v31, v32, v33, v34);
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(userJoinFailureCountMap, v39, (uint64_t)v38, v40, v41);
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v36 = (unint64_t)objc_msgSend_unsignedIntegerValue(v42, v43, v44, v45, v46) > 1;
    }

    else
    {
      BOOL v36 = 0;
    }

    objc_sync_exit(v10);
  }

  else
  {
    BOOL v36 = 0;
  }

  return v36;
}

- (int64_t)temporaryUserSettingForNetworkProfile:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_identifier(v4, v6, v7, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    tempUserSettingMap = v5->_tempUserSettingMap;
    objc_msgSend_identifier(v4, v11, v12, v13, v14);
    double v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(tempUserSettingMap, v17, (uint64_t)v16, v18, v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v25 = objc_msgSend_integerValue(v20, v21, v22, v23, v24);
  }

  else
  {
    int64_t v25 = 0LL;
  }

  objc_sync_exit(v5);

  return v25;
}

- (void)setTemporaryUserSetting:(int64_t)a3 networkProfile:(id)a4
{
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  objc_msgSend_identifier(v6, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (a3)
    {
      objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v13, a3, v15, v16);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      tempUserSettingMap = v7->_tempUserSettingMap;
      objc_msgSend_identifier(v6, v19, v20, v21, v22);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(tempUserSettingMap, v24, (uint64_t)v17, (uint64_t)v23, v25);

      CWFGetOSLog();
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        CWFGetOSLog();
        uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v27 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v33 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        sub_1864542D4(a3);
        double v35 = (void *)objc_claimAutoreleasedReturnValue();
        _os_log_send_and_compose_impl();
      }
    }

    else
    {
      uint64_t v28 = v7->_tempUserSettingMap;
      objc_msgSend_identifier(v6, v13, v14, v15, v16);
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v28, v30, 0, (uint64_t)v29, v31);

      CWFGetOSLog();
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        CWFGetOSLog();
        uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v27 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v34 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
        _os_log_send_and_compose_impl();
      }
    }
  }

  objc_sync_exit(v7);
}

- (void)clearTemporaryUserSettings
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_removeAllObjects(v2->_tempUserSettingMap, v3, v4, v5, v6);
  CWFGetOSLog();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    CWFGetOSLog();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v8 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v9 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }

  objc_sync_exit(v2);
}

- (void)setNetworkIDForAssociationWithMACAddress:(id)a3 networkProfile:(id)a4
{
  uint64_t v144 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v11 = a4;
  uint64_t v12 = v6;
  if (!v6)
  {
    objc_msgSend_hardwareMACAddress(self, v7, v8, v9, v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v135 = v6;
  BOOL v13 = v6 == 0LL;
  id v137 = 0LL;
  sub_186454370(v11, v12, &v137);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v136 = v137;
  if (v13) {

  }
  if (v14)
  {
    uint64_t v15 = self;
    objc_sync_enter(v15);
    networkIDCache = v15->_networkIDCache;
    objc_msgSend_identifier(v11, v17, v18, v19, v20);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(networkIDCache, v22, (uint64_t)v21, v23, v24);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 == v29)
    {
      char isEqual = 1;
    }

    else
    {
      uint64_t v30 = v15->_networkIDCache;
      objc_msgSend_identifier(v11, v25, v26, v27, v28);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v30, v32, (uint64_t)v31, v33, v34);
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        uint64_t v40 = v15->_networkIDCache;
        objc_msgSend_identifier(v11, v35, v36, v37, v38);
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v40, v42, (uint64_t)v41, v43, v44);
        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
        char isEqual = objc_msgSend_isEqual_(v14, v46, (uint64_t)v45, v47, v48);
      }

      else
      {
        char isEqual = 0;
      }
    }

    uint64_t v50 = v15->_networkIDCache;
    objc_msgSend_identifier(v11, v51, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v50, v56, (uint64_t)v14, (uint64_t)v55, v57);

    networkIDCacheIDList = v15->_networkIDCacheIDList;
    objc_msgSend_identifier(v11, v59, v60, v61, v62);
    uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObject_(networkIDCacheIDList, v64, (uint64_t)v63, v65, v66);

    uint64_t v67 = v15->_networkIDCacheIDList;
    objc_msgSend_identifier(v11, v68, v69, v70, v71);
    uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_insertObject_atIndex_(v67, v73, (uint64_t)v72, 0, v74);

    if (objc_msgSend_count(v15->_networkIDCacheIDList, v75, v76, v77, v78) == 10)
    {
      v83 = v15->_networkIDCache;
      objc_msgSend_lastObject(v15->_networkIDCacheIDList, v79, v80, v81, v82);
      uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v83, v85, 0, (uint64_t)v84, v86);

      objc_msgSend_removeLastObject(v15->_networkIDCacheIDList, v87, v88, v89, v90);
    }

    objc_sync_exit(v15);

    if ((isEqual & 1) == 0)
    {
      objc_msgSend_networkName(v11, v91, v92, v93, v94);
      uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue();

      if (v95)
      {
        CWFGetOSLog();
        uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue();
        if (v96)
        {
          CWFGetOSLog();
          uint64_t v97 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v97 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v98 = MEMORY[0x1895F8DA0];
        }

        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
        {
          int v138 = 138543362;
          v139 = (const char *)v11;
          int v134 = 12;
          v133 = &v138;
          _os_log_send_and_compose_impl();
        }

        objc_msgSend_interfaceName(v15, v99, v100, v101, v102);
        uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_networkName(v11, v104, v105, v106, v107);
        uint64_t v108 = (void *)objc_claimAutoreleasedReturnValue();
        IPConfigurationForgetNetwork();
      }
    }

    objc_msgSend_interfaceName(v15, v109, v110, v111, v112);
    uint64_t v113 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18645457C(v14, v113);
    id v136 = 0LL;
  }

  else
  {
    CWFGetOSLog();
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    if (v131)
    {
      CWFGetOSLog();
      uint64_t v113 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v113 = (void *)MEMORY[0x1895F8DA0];
      id v132 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled((os_log_t)v113, OS_LOG_TYPE_ERROR))
    {
      int v138 = 138412546;
      v139 = (const char *)v136;
      __int16 v140 = 2114;
      id v141 = v11;
      int v134 = 22;
      v133 = &v138;
      _os_log_send_and_compose_impl();
    }
  }

  CWFGetOSLog();
  double v114 = (void *)objc_claimAutoreleasedReturnValue();
  if (v114)
  {
    CWFGetOSLog();
    v115 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v115 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v116 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v115, (os_log_type_t)(16 * (v136 != 0LL))))
  {
    if (v136) {
      uint64_t v119 = "FAILED to";
    }
    else {
      uint64_t v119 = "Successfully";
    }
    objc_msgSend_subdataWithRange_(v14, v117, 0, 32, v118, v133, v134, v135);
    uint64_t v120 = (void *)objc_claimAutoreleasedReturnValue();
    CWFHexadecimalStringFromData(v120, v121, v122, v123, v124);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_redactedForWiFi(v125, v126, v127, v128, v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    int v138 = 136446722;
    v139 = v119;
    __int16 v140 = 2114;
    id v141 = v130;
    __int16 v142 = 2114;
    id v143 = v11;
    _os_log_send_and_compose_impl();
  }
}

- (NSString)interfaceName
{
  return (NSString *)objc_getProperty(self, a2, 104LL, 1);
}

- (NSString)hardwareMACAddress
{
  return (NSString *)objc_getProperty(self, a2, 112LL, 1);
}

- (id)updatedSystemSettingHandler
{
  return objc_getProperty(self, a2, 120LL, 1);
}

- (void)setUpdatedSystemSettingHandler:(id)a3
{
}

- (id)updatedDeviceKeyHandler
{
  return objc_getProperty(self, a2, 128LL, 1);
}

- (void)setUpdatedDeviceKeyHandler:(id)a3
{
}

- (id)updatedPrivateMACAddressHandler
{
  return objc_getProperty(self, a2, 136LL, 1);
}

- (void)setUpdatedPrivateMACAddressHandler:(id)a3
{
}

- (id)updatedRotationKeyHandler
{
  return objc_getProperty(self, a2, 144LL, 1);
}

- (void)setUpdatedRotationKeyHandler:(id)a3
{
}

- (id)effectiveHardwareMACAddress
{
  return objc_getProperty(self, a2, 152LL, 1);
}

- (void)setEffectiveHardwareMACAddress:(id)a3
{
}

- (id)allowRotationHandler
{
  return objc_getProperty(self, a2, 160LL, 1);
}

- (void)setAllowRotationHandler:(id)a3
{
}

- (OS_dispatch_queue)targetQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setTargetQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end