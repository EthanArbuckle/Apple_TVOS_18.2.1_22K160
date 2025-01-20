@interface CWFNetworkDenyList
- (BOOL)_evaluateTriggersForDenyListRemove:(id)a3 denyListRemoveReason:(unint64_t)a4 SSID:(id)a5;
- (BOOL)_evaluateTriggersForDenyListing:(id)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5 BSSID:(id)a6 SSID:(id)a7 state:(unint64_t)a8;
- (BOOL)_ignoreTriggersForDeviceProfile:(unint64_t)a3 denyListItem:(id)a4;
- (BOOL)_meetsThresholds:(unint64_t)a3 count:(unsigned int)a4 forSSIDThresholds:(BOOL)a5 BSSID:(id)a6 SSID:(id)a7;
- (BOOL)enabled;
- (BOOL)isNetworkDenyListedForAutoJoinDueToTrigDisc:(id)a3 RSSI:(int64_t *)a4 timestamp:(double *)a5;
- (BOOL)isNetworkInDenyListedState:(unint64_t)a3 scanResult:(id)a4;
- (BOOL)isNetworkTemporarilyDenyListedForAutoJoin:(id)a3;
- (CWFNetworkDenyList)initWithDenyListDeviceProfile:(unint64_t)a3;
- (NSArray)BSSIDThresholds;
- (NSArray)SSIDThresholds;
- (double)BSSDenyListExpiry;
- (double)networkDenyListExpiry;
- (double)wowDenyListExpiry;
- (id)_findNetworkDenyListItem:(id)a3;
- (id)_findNetworkDenyListItemsForSSID:(id)a3;
- (id)batteryInfoHandler;
- (id)denyList;
- (id)denyListDidUpdateHandler;
- (id)denyListedNetworkSSIDs:(unint64_t)a3;
- (id)denyListedReasonHistoryForNetwork:(id)a3 state:(unint64_t)a4 timestamps:(id)a5 reasonData:(id)a6;
- (id)isUserModeInteractiveHandler;
- (id)networksInDenyListedState:(unint64_t)a3;
- (id)networksInDenyListedStateHistory:(unint64_t)a3;
- (id)reasonsForNetworkInDenyListedState:(id)a3 state:(unint64_t)a4 timestamps:(id)a5 reasonData:(id)a6;
- (int64_t)RSSIWhenNetworkWasDenyListed:(id)a3;
- (int64_t)denyListThresholdForReason:(unint64_t)a3 forSSIDThresholds:(BOOL)a4;
- (unint64_t)denyListedNetworkCount;
- (void)_printDenyList;
- (void)_setDenyListState:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5 reasonData:(int64_t)a6;
- (void)processDenyListedBSSForMetrics:(id)a3;
- (void)removeAllDenyListEntriesWithNetworkName:(id)a3;
- (void)removeAllDenyListedItems;
- (void)removeDenyListStateWithDenyListRemoveReason:(unint64_t)a3;
- (void)removeExpiredDenyListedState:(unint64_t)a3;
- (void)removeNetworkDenyListInfoForTrigger:(unint64_t)a3 forNetwork:(id)a4;
- (void)removeNetworkDenyListInfoWithReason:(unint64_t)a3 forScanResult:(id)a4;
- (void)setBSSDenyListExpiry:(double)a3;
- (void)setBSSIDThresholds:(id)a3;
- (void)setBatteryInfoHandler:(id)a3;
- (void)setDefaultDenyListThresholds;
- (void)setDenyListDidUpdateHandler:(id)a3;
- (void)setDenyListedStateExpiryIntervalInSec:(double)a3 state:(unint64_t)a4;
- (void)setDenyListingThresholds:(unint64_t)a3 value:(unsigned int)a4 forSSIDThresholds:(BOOL)a5;
- (void)setEnabled:(BOOL)a3;
- (void)setIsUserModeInteractiveHandler:(id)a3;
- (void)setNetworkDenyListExpiry:(double)a3;
- (void)setNetworkDenyListInfo:(id)a3 forScanResult:(id)a4;
- (void)setSSIDThresholds:(id)a3;
- (void)setWowDenyListExpiry:(double)a3;
@end

@implementation CWFNetworkDenyList

- (CWFNetworkDenyList)initWithDenyListDeviceProfile:(unint64_t)a3
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___CWFNetworkDenyList;
  v4 = -[CWFNetworkDenyList init](&v46, sel_init);
  v8 = v4;
  if (!v4)
  {
    CWFGetOSLog();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      CWFGetOSLog();
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v34 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v38 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    int v47 = 136446210;
    v48 = "-[CWFNetworkDenyList initWithDenyListDeviceProfile:]";
    goto LABEL_27;
  }

  objc_msgSend_setEnabled_(v4, v5, 0, v6, v7);
  objc_msgSend_setWowDenyListExpiry_(v8, v9, v10, v11, v12, 600.0);
  objc_msgSend_setNetworkDenyListExpiry_(v8, v13, v14, v15, v16, 300.0);
  objc_msgSend_setBSSDenyListExpiry_(v8, v17, v18, v19, v20, 300.0);
  v8->_profile = a3;
  v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  denyList = v8->_denyList;
  v8->_denyList = v21;

  if (!v8->_denyList)
  {
    CWFGetOSLog();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      CWFGetOSLog();
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v34 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v39 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    int v47 = 136446210;
    v48 = "-[CWFNetworkDenyList initWithDenyListDeviceProfile:]";
    goto LABEL_27;
  }

  v23 = (NSArray *)objc_alloc_init(MEMORY[0x189603F18]);
  SSIDThresholds = v8->_SSIDThresholds;
  v8->_SSIDThresholds = v23;

  if (!v8->_SSIDThresholds)
  {
    CWFGetOSLog();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      CWFGetOSLog();
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v34 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v40 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    int v47 = 136446210;
    v48 = "-[CWFNetworkDenyList initWithDenyListDeviceProfile:]";
    goto LABEL_27;
  }

  v25 = (NSArray *)objc_alloc_init(MEMORY[0x189603F18]);
  BSSIDThresholds = v8->_BSSIDThresholds;
  v8->_BSSIDThresholds = v25;

  if (!v8->_BSSIDThresholds)
  {
    CWFGetOSLog();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      CWFGetOSLog();
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v34 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v41 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    int v47 = 136446210;
    v48 = "-[CWFNetworkDenyList initWithDenyListDeviceProfile:]";
LABEL_27:
    _os_log_send_and_compose_impl();
LABEL_28:

    objc_msgSend_removeAllObjects(v8->_denyList, v42, v43, v44, v45);
    v31 = 0LL;
    goto LABEL_6;
  }

  objc_msgSend_setDefaultDenyListThresholds(v8, v27, v28, v29, v30);
  v31 = v8;
LABEL_6:

  return v31;
}

- (void)setDefaultDenyListThresholds
{
  uint64_t v6 = (NSArray *)objc_msgSend_mutableCopy(self->_SSIDThresholds, a2, v2, v3, v4);
  uint64_t v11 = (NSArray *)objc_msgSend_mutableCopy(self->_BSSIDThresholds, v7, v8, v9, v10);
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v12, 1, v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v11, v16, (uint64_t)v15, 0, v17);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v18, 1, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v11, v22, (uint64_t)v21, 1, v23);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v24, 1, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v11, v28, (uint64_t)v27, 2, v29);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v30, 3, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v11, v34, (uint64_t)v33, 3, v35);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v36, 3, v37, v38);
  id v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v11, v40, (uint64_t)v39, 4, v41);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v42, 10, v43, v44);
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v11, v46, (uint64_t)v45, 5, v47);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v48, 1, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v11, v52, (uint64_t)v51, 6, v53);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v54, 3, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v11, v58, (uint64_t)v57, 7, v59);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v60, 1, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v6, v64, (uint64_t)v63, 0, v65);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v66, 1, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v6, v70, (uint64_t)v69, 1, v71);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v72, 1, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v6, v76, (uint64_t)v75, 2, v77);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v78, 5, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v6, v82, (uint64_t)v81, 3, v83);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v84, 5, v85, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v6, v88, (uint64_t)v87, 4, v89);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v90, 10, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v6, v94, (uint64_t)v93, 5, v95);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v96, 1, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v6, v100, (uint64_t)v99, 6, v101);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v102, 3, v103, v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(v6, v106, (uint64_t)v105, 7, v107);

  SSIDThresholds = self->_SSIDThresholds;
  self->_SSIDThresholds = v6;
  v110 = v6;

  BSSIDThresholds = self->_BSSIDThresholds;
  self->_BSSIDThresholds = v11;
}

- (void)setDenyListedStateExpiryIntervalInSec:(double)a3 state:(unint64_t)a4
{
  if (a4 != 3)
  {
    if (a4 == 2)
    {
      if (a3 != 0.0 && a3 <= 300.0)
      {
        objc_msgSend_setBSSDenyListExpiry_(self, a2, 2, v4, v5, a3);
        return;
      }

      CWFGetOSLog();
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        CWFGetOSLog();
        uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v7 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v12 = MEMORY[0x1895F8DA0];
      }

      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_33;
      }
    }

    else if (a4 == 1)
    {
      if (a3 != 0.0 && a3 <= 86400.0)
      {
        objc_msgSend_setNetworkDenyListExpiry_(self, a2, 1, v4, v5, a3);
        return;
      }

      CWFGetOSLog();
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        CWFGetOSLog();
        uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v7 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v14 = MEMORY[0x1895F8DA0];
      }

      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_33;
      }
    }

    else
    {
      CWFGetOSLog();
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        CWFGetOSLog();
        uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v7 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v11 = MEMORY[0x1895F8DA0];
      }

      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_33;
      }
    }

    goto LABEL_32;
  }

  if (a3 != 0.0 && a3 <= 3600.0)
  {
    objc_msgSend_setWowDenyListExpiry_(self, a2, 3, v4, v5, a3);
    return;
  }

  CWFGetOSLog();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    CWFGetOSLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v7 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v13 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
LABEL_32:
  }
    _os_log_send_and_compose_impl();
LABEL_33:
}

- (void)setDenyListingThresholds:(unint64_t)a3 value:(unsigned int)a4 forSSIDThresholds:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  if (a3 > 6 || a4 >= 0xFF)
  {
    CWFGetOSLog();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      CWFGetOSLog();
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v34 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v38 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      _os_log_send_and_compose_impl();
    }
  }

  else
  {
    objc_msgSend_SSIDThresholds(self, a2, a3, *(uint64_t *)&a4, a5);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v39 = (id)objc_msgSend_mutableCopy(v9, v10, v11, v12, v13);

    objc_msgSend_BSSIDThresholds(self, v14, v15, v16, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = (void *)objc_msgSend_mutableCopy(v18, v19, v20, v21, v22);

    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v24, v6, v25, v26);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend_setObject_atIndexedSubscript_(v39, v27, (uint64_t)v29, a3, v28);

      objc_msgSend_setSSIDThresholds_(self, v30, (uint64_t)v39, v31, v32);
    }

    else
    {
      objc_msgSend_setObject_atIndexedSubscript_(v23, v27, (uint64_t)v29, a3, v28);

      objc_msgSend_setBSSIDThresholds_(self, v35, (uint64_t)v23, v36, v37);
    }
  }

- (int64_t)denyListThresholdForReason:(unint64_t)a3 forSSIDThresholds:(BOOL)a4
{
  if (a4) {
    objc_msgSend_SSIDThresholds(self, a2, a3, a4, v4);
  }
  else {
    objc_msgSend_BSSIDThresholds(self, a2, a3, a4, v4);
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v6, v7, a3, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v15 = objc_msgSend_integerValue(v10, v11, v12, v13, v14);

  return v15;
}

- (void)_setDenyListState:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5 reasonData:(int64_t)a6
{
}

- (void)setNetworkDenyListInfo:(id)a3 forScanResult:(id)a4
{
  uint64_t v159 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_enabled(self, v8, v9, v10, v11))
  {
    uint64_t v15 = objc_msgSend__findNetworkDenyListItem_(self, v12, (uint64_t)v7, v13, v14);
    if (v15)
    {
      uint64_t v20 = (void *)v15;
      id v21 = 0LL;
    }

    else
    {
      uint64_t v23 = objc_alloc(&OBJC_CLASS___CWFNetworkDenyListItem);
      v27 = (void *)objc_msgSend_initWithDenyListNetwork_(v23, v24, (uint64_t)v7, v25, v26);
      if (!v27)
      {
        CWFGetOSLog();
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        if (v135)
        {
          CWFGetOSLog();
          v134 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          v134 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v136 = MEMORY[0x1895F8DA0];
        }

        if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
        {
          int v141 = 136446210;
          v142 = "-[CWFNetworkDenyList setNetworkDenyListInfo:forScanResult:]";
          _os_log_send_and_compose_impl();
        }

        uint64_t v35 = 0LL;
        id v21 = 0LL;
        uint64_t v20 = 0LL;
        goto LABEL_25;
      }

      id v21 = v27;
      uint64_t v20 = v21;
    }

    if (!objc_msgSend_state(v6, v16, v17, v18, v19)) {
      objc_msgSend_setState_(v6, v28, 5, v30, v31);
    }
    uint64_t v32 = objc_msgSend_reason(v6, v28, v29, v30, v31);
    if (objc_msgSend__ignoreTriggersForDeviceProfile_denyListItem_(self, v33, v32, (uint64_t)v20, v34))
    {
      uint64_t v35 = 0LL;
LABEL_26:

      goto LABEL_27;
    }

    id v36 = objc_alloc(NSString);
    objc_msgSend_scanResultForNetworkDenyListItem(v20, v37, v38, v39, v40);
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_SSID(v41, v42, v43, v44, v45);
    objc_super v46 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v35 = (void *)objc_msgSend_initWithData_encoding_(v36, v47, (uint64_t)v46, 4, v48);

    CWFGetOSLog();
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      CWFGetOSLog();
      uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v50 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v52 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      unint64_t v57 = objc_msgSend_reason(v6, v53, v54, v55, v56);
      CWFStringFromDenyListAddReason(v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_BSSID(v6, v59, v60, v61, v62);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      id v140 = v21;
      objc_msgSend_redactedForWiFi(v139, v63, v64, v65, v66);
      uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
      int v141 = 136448258;
      v142 = "-[CWFNetworkDenyList setNetworkDenyListInfo:forScanResult:]";
      __int16 v143 = 2082;
      v144 = "CWFNetworkDenyList.m";
      __int16 v145 = 1024;
      int v146 = 189;
      __int16 v147 = 2114;
      v148 = v58;
      __int16 v149 = 2114;
      v150 = v35;
      __int16 v151 = 2114;
      v152 = v67;
      __int16 v153 = 2048;
      uint64_t v154 = objc_msgSend_reason(v6, v68, v69, v70, v71);
      __int16 v155 = 2048;
      uint64_t v156 = objc_msgSend_reasonData(v6, v72, v73, v74, v75);
      __int16 v157 = 2048;
      uint64_t v158 = objc_msgSend_state(v6, v76, v77, v78, v79);
      int v138 = 88;
      v137 = &v141;
      _os_log_send_and_compose_impl();

      id v21 = v140;
    }

    uint64_t v84 = objc_msgSend_reason(v6, v80, v81, v82, v83);
    uint64_t v89 = objc_msgSend_reasonData(v6, v85, v86, v87, v88);
    objc_msgSend_BSSID(v6, v90, v91, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addDenyListTrigger_reasonData_BSSID_(v20, v95, v84, v89, (uint64_t)v94);

    uint64_t v100 = objc_msgSend_reason(v6, v96, v97, v98, v99);
    uint64_t v105 = objc_msgSend_reasonData(v6, v101, v102, v103, v104);
    objc_msgSend_BSSID(v6, v106, v107, v108, v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v115 = objc_msgSend_state(v6, v111, v112, v113, v114);
    int v117 = objc_msgSend__evaluateTriggersForDenyListing_reason_reasonData_BSSID_SSID_state_( self,  v116,  (uint64_t)v20,  v100,  v105,  v110,  v35,  v115);

    objc_msgSend__printDenyList(self, v121, v122, v123, v124, v137, v138);
    if (!v117) {
      goto LABEL_26;
    }
    objc_msgSend_denyListDidUpdateHandler(self, v125, v126, v127, v128);
    v129 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v129) {
      goto LABEL_26;
    }
    objc_msgSend_denyListDidUpdateHandler(self, v130, v131, v132, v133);
    v134 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(os_log_s *, void *))v134 + 2))(v134, &unk_189E5D690);
LABEL_25:

    goto LABEL_26;
  }

  CWFGetOSLog();
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    CWFGetOSLog();
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v20 = (void *)MEMORY[0x1895F8DA0];
    id v51 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_INFO))
  {
    int v141 = 136446210;
    v142 = "-[CWFNetworkDenyList setNetworkDenyListInfo:forScanResult:]";
    _os_log_send_and_compose_impl();
  }

- (BOOL)_evaluateTriggersForDenyListing:(id)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5 BSSID:(id)a6 SSID:(id)a7 state:(unint64_t)a8
{
  uint64_t v180 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a6;
  id v154 = a7;
  if (!v12)
  {
    CWFGetOSLog();
    int v146 = (void *)objc_claimAutoreleasedReturnValue();
    if (v146)
    {
      CWFGetOSLog();
      __int16 v147 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      __int16 v147 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v148 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
    {
      int v171 = 136446210;
      v172 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListing:reason:reasonData:BSSID:SSID:state:]";
      _os_log_send_and_compose_impl();
    }

    char v144 = 0;
    goto LABEL_122;
  }

  __int128 v169 = 0u;
  __int128 v170 = 0u;
  __int128 v167 = 0u;
  __int128 v168 = 0u;
  objc_msgSend_denyListTriggers(v12, v14, v15, v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v166 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v167, (uint64_t)v179, 16);
  if (!v166)
  {

    char v144 = 0;
    goto LABEL_121;
  }

  uint64_t v152 = 0LL;
  uint64_t v153 = 0LL;
  unint64_t v162 = 0LL;
  unsigned int v164 = 0;
  unsigned int v159 = 0;
  char v157 = 0;
  char v155 = 0;
  uint64_t v165 = *(void *)v168;
  unint64_t v151 = a8 & 0xFFFFFFFFFFFFFFFELL;
  id v158 = v13;
  unint64_t v160 = a8;
  id obj = v18;
  do
  {
    uint64_t v24 = 0LL;
    do
    {
      if (*(void *)v168 != v165) {
        objc_enumerationMutation(obj);
      }
      uint64_t v25 = *(void **)(*((void *)&v167 + 1) + 8 * v24);
      objc_msgSend_date(MEMORY[0x189603F50], v20, v21, v22, v23, v149, v150);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSince1970(v26, v27, v28, v29, v30);
      double v32 = v31;

      unint64_t v37 = objc_msgSend_reason(v25, v33, v34, v35, v36);
      uint64_t v42 = objc_msgSend_reasonData(v25, v38, v39, v40, v41);
      objc_msgSend_reasonTimestamp(v25, v43, v44, v45, v46);
      double v48 = v47;
      if (!objc_msgSend_enterprisePolicy(v12, v49, v50, v51, v52)
        || a4 > 7
        || (double v57 = v32 - v48, v32 - v48 > 300.0))
      {
        CWFGetOSLog();
        uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();
        if (v66)
        {
          CWFGetOSLog();
          uint64_t v67 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v67 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v68 = MEMORY[0x1895F8DA0];
        }

        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          CWFStringFromDenyListAddReason(v37);
          uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_BSSID(v25, v70, v71, v72, v73);
          uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_redactedForWiFi(v74, v75, v76, v77, v78);
          uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue();
          int v171 = 136446978;
          v172 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListing:reason:reasonData:BSSID:SSID:state:]";
          __int16 v173 = 2114;
          v174 = v69;
          __int16 v175 = 2114;
          v176 = v79;
          __int16 v177 = 2048;
          double v178 = v32 - v48;
          LODWORD(v150) = 42;
          __int16 v149 = &v171;
          _os_log_send_and_compose_impl();

          a8 = v160;
          goto LABEL_27;
        }

- (BOOL)_ignoreTriggersForDeviceProfile:(unint64_t)a3 denyListItem:(id)a4
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  uint64_t v11 = v6;
  uint64_t v42 = 0LL;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x2020000000LL;
  char v45 = 0;
  if (self->_profile == 2)
  {
    CWFGetOSLog();
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      CWFGetOSLog();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v13 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v35 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      unint64_t profile = self->_profile;
      int v46 = 136446722;
      double v47 = "-[CWFNetworkDenyList _ignoreTriggersForDeviceProfile:denyListItem:]";
      __int16 v48 = 2048;
      unint64_t v49 = a3;
      __int16 v50 = 2048;
      unint64_t v51 = profile;
      _os_log_send_and_compose_impl();
    }

    BOOL v37 = 1;
  }

  else
  {
    if ((objc_msgSend_enterprisePolicy(v6, v7, v8, v9, v10) & 1) != 0
      || (objc_msgSend_scanResultForNetworkDenyListItem(v11, v14, v15, v16, v17),
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend_matchingKnownNetworkProfile(v18, v19, v20, v21, v22),
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(),
          int isProfileBased = objc_msgSend_isProfileBased(v23, v24, v25, v26, v27),
          v23,
          v18,
          isProfileBased))
    {
      objc_msgSend_batteryInfoHandler(self, v14, v15, v16, v17);
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend_batteryInfoHandler(self, v30, v31, v32, v33);
        uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x1895F87A8];
        v41[1] = 3221225472LL;
        v41[2] = sub_1864E7C94;
        v41[3] = &unk_189E5D6B8;
        v41[4] = &v42;
        v41[5] = a3;
        (*((void (**)(os_log_s *, void *))v34 + 2))(v34, v41);
      }

      else
      {
        CWFGetOSLog();
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          CWFGetOSLog();
          uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v34 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v39 = MEMORY[0x1895F8DA0];
        }

        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          int v46 = 136446210;
          double v47 = "-[CWFNetworkDenyList _ignoreTriggersForDeviceProfile:denyListItem:]";
          _os_log_send_and_compose_impl();
        }
      }
    }

    BOOL v37 = *((_BYTE *)v43 + 24) != 0;
  }

  _Block_object_dispose(&v42, 8);

  return v37;
}

- (void)removeDenyListStateWithDenyListRemoveReason:(unint64_t)a3
{
  uint64_t v271 = *MEMORY[0x1895F89C0];
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v7 = v6;
  if (!v5)
  {
    CWFGetOSLog();
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    if (v229)
    {
      CWFGetOSLog();
      v230 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v230 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v232 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v230, OS_LOG_TYPE_ERROR)) {
      goto LABEL_110;
    }
    int v262 = 136446210;
    v263 = "-[CWFNetworkDenyList removeDenyListStateWithDenyListRemoveReason:]";
    goto LABEL_109;
  }

  if (!v6)
  {
    CWFGetOSLog();
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    if (v231)
    {
      CWFGetOSLog();
      v230 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v230 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v233 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v230, OS_LOG_TYPE_ERROR)) {
      goto LABEL_110;
    }
    int v262 = 136446210;
    v263 = "-[CWFNetworkDenyList removeDenyListStateWithDenyListRemoveReason:]";
LABEL_109:
    _os_log_send_and_compose_impl();
LABEL_110:

    goto LABEL_98;
  }

  __int128 v260 = 0u;
  __int128 v261 = 0u;
  __int128 v258 = 0u;
  __int128 v259 = 0u;
  id obj = self->_denyList;
  uint64_t v241 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v258, (uint64_t)v270, 16);
  int v9 = 0;
  if (!v241) {
    goto LABEL_87;
  }
  id v10 = 0LL;
  uint64_t v240 = *(void *)v259;
  v236 = v7;
  v244 = self;
  do
  {
    uint64_t v11 = 0LL;
    id v12 = v10;
    do
    {
      if (*(void *)v259 != v240) {
        objc_enumerationMutation(obj);
      }
      uint64_t v242 = v11;
      id v10 = *(id *)(*((void *)&v258 + 1) + 8 * v11);

      if (a3 == 7)
      {
        objc_msgSend_denyListTriggers(v10, v13, v14, v15, v16);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeAllObjects(v17, v18, v19, v20, v21);

        objc_msgSend_statesCurrent(v10, v22, v23, v24, v25);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        v256[0] = MEMORY[0x1895F87A8];
        v256[1] = 3221225472LL;
        v256[2] = sub_1864E8AFC;
        v256[3] = &unk_189E5D6E0;
        uint64_t v27 = (char *)v10;
        v257 = v27;
        objc_msgSend_enumerateObjectsUsingBlock_(v26, v28, (uint64_t)v256, v29, v30);

        objc_msgSend_statesCurrent(v27, v31, v32, v33, v34);
        id v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeAllObjects(v35, v36, v37, v38, v39);

        objc_msgSend_addObject_(v7, v40, (uint64_t)v27, v41, v42);
        int v9 = 1;
        uint64_t v43 = v257;
        goto LABEL_84;
      }

      id v44 = objc_alloc(NSString);
      objc_msgSend_scanResultForNetworkDenyListItem(v10, v45, v46, v47, v48);
      unint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_SSID(v49, v50, v51, v52, v53);
      uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v43 = (char *)objc_msgSend_initWithData_encoding_(v44, v55, (uint64_t)v54, 4, v56);

      objc_msgSend_scanResultForNetworkDenyListItem(v10, v57, v58, v59, v60);
      uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_BSSID(v61, v62, v63, v64, v65);
      v243 = (char *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_scanResultForNetworkDenyListItem(v10, v66, v67, v68, v69);
      uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v49) = objc_msgSend_isNetworkInDenyListedState_scanResult_(self, v71, 1, (uint64_t)v70, v72);

      double v77 = 0.0;
      int v239 = v9;
      id v238 = v10;
      if ((_DWORD)v49)
      {
        objc_msgSend_denyListTriggers(v10, v73, v74, v75, v76);
        uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeAllObjects(v78, v79, v80, v81, v82);

        __int128 v254 = 0u;
        __int128 v255 = 0u;
        __int128 v252 = 0u;
        __int128 v253 = 0u;
        objc_msgSend_statesCurrent(v10, v83, v84, v85, v86);
        uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v88, (uint64_t)&v252, (uint64_t)v269, 16);
        if (!v89) {
          goto LABEL_50;
        }
        uint64_t v94 = v89;
        uint64_t v95 = *(void *)v253;
        while (1)
        {
          uint64_t v96 = 0LL;
          do
          {
            if (*(void *)v253 != v95) {
              objc_enumerationMutation(v87);
            }
            uint64_t v97 = *(void **)(*((void *)&v252 + 1) + 8 * v96);
            if (objc_msgSend_state(v97, v90, v91, v92, v93, v234, v235) != 1) {
              goto LABEL_36;
            }
            if (objc_msgSend_reason(v97, v98, v99, v100, v101) == 6) {
              goto LABEL_43;
            }
            if (a3 != 5) {
              goto LABEL_30;
            }
            objc_msgSend_stateTimestamp(v97, v90, v91, v92, v93);
            if (v106 > v77)
            {
              objc_msgSend_stateTimestamp(v97, v102, v103, v104, v105);
              double v77 = v107;
            }

            objc_msgSend_date(MEMORY[0x189603F50], v102, v103, v104, v105);
            id v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_timeIntervalSince1970(v108, v109, v110, v111, v112);
            double v114 = v113;

            double v115 = v114 - v77;
            objc_msgSend_networkDenyListExpiry(v244, v116, v117, v118, v119);
            double v121 = v120;
            uint64_t v122 = CWFGetOSLog();
            uint64_t v123 = (void *)v122;
            if (v115 > v121)
            {
              if (v122)
              {
                CWFGetOSLog();
                id v124 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                id v124 = (os_log_s *)MEMORY[0x1895F8DA0];
                id v126 = MEMORY[0x1895F8DA0];
              }

              if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
              {
                int v262 = 138543362;
                v263 = v43;
                LODWORD(v235) = 12;
                v234 = &v262;
                _os_log_send_and_compose_impl();
              }

LABEL_30:
              CWFGetOSLog();
              uint64_t v127 = (void *)objc_claimAutoreleasedReturnValue();
              if (v127)
              {
                CWFGetOSLog();
                uint64_t v128 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                uint64_t v128 = (os_log_s *)MEMORY[0x1895F8DA0];
                id v129 = MEMORY[0x1895F8DA0];
              }

              if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
              {
                int v262 = 136446466;
                v263 = "-[CWFNetworkDenyList removeDenyListStateWithDenyListRemoveReason:]";
                __int16 v264 = 2114;
                v265 = v43;
                LODWORD(v235) = 22;
                v234 = &v262;
                _os_log_send_and_compose_impl();
              }

              objc_msgSend_addObject_(v5, v130, (uint64_t)v97, v131, v132);
LABEL_36:
              if (objc_msgSend_state(v97, v98, v99, v100, v101, v234, v235) == 3)
              {
                CWFGetOSLog();
                uint64_t v133 = (void *)objc_claimAutoreleasedReturnValue();
                if (v133)
                {
                  CWFGetOSLog();
                  id v134 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                }

                else
                {
                  id v134 = (os_log_s *)MEMORY[0x1895F8DA0];
                  id v135 = MEMORY[0x1895F8DA0];
                }

                if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
                {
                  int v262 = 136446466;
                  v263 = "-[CWFNetworkDenyList removeDenyListStateWithDenyListRemoveReason:]";
                  __int16 v264 = 2114;
                  v265 = v43;
                  LODWORD(v235) = 22;
                  v234 = &v262;
                  _os_log_send_and_compose_impl();
                }

                objc_msgSend_addObject_(v5, v136, (uint64_t)v97, v137, v138);
              }

              goto LABEL_43;
            }

            if (v122)
            {
              CWFGetOSLog();
              v125 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              v125 = (os_log_s *)MEMORY[0x1895F8DA0];
              id v139 = MEMORY[0x1895F8DA0];
            }

            if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
            {
              int v262 = 138543362;
              v263 = v43;
              LODWORD(v235) = 12;
              v234 = &v262;
              _os_log_send_and_compose_impl();
            }

LABEL_43:
            ++v96;
          }

          while (v94 != v96);
          uint64_t v140 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v90, (uint64_t)&v252, (uint64_t)v269, 16);
          uint64_t v94 = v140;
          if (!v140)
          {
LABEL_50:

            id v7 = v236;
            self = v244;
            int v9 = v239;
            id v10 = v238;
            break;
          }
        }
      }

      objc_msgSend_scanResultForNetworkDenyListItem(v10, v73, v74, v75, v76, v234, v235);
      uint64_t v141 = (void *)objc_claimAutoreleasedReturnValue();
      int isNetworkInDenyListedState_scanResult = objc_msgSend_isNetworkInDenyListedState_scanResult_( self,  v142,  2,  (uint64_t)v141,  v143);

      if (!isNetworkInDenyListedState_scanResult) {
        goto LABEL_83;
      }
      __int128 v250 = 0u;
      __int128 v251 = 0u;
      __int128 v248 = 0u;
      __int128 v249 = 0u;
      objc_msgSend_statesCurrent(v10, v145, v146, v147, v148);
      __int16 v149 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v151 = objc_msgSend_countByEnumeratingWithState_objects_count_(v149, v150, (uint64_t)&v248, (uint64_t)v268, 16);
      if (!v151) {
        goto LABEL_82;
      }
      uint64_t v156 = v151;
      uint64_t v157 = *(void *)v249;
      do
      {
        for (uint64_t i = 0LL; i != v156; ++i)
        {
          if (*(void *)v249 != v157) {
            objc_enumerationMutation(v149);
          }
          unsigned int v159 = *(void **)(*((void *)&v248 + 1) + 8 * i);
          if (objc_msgSend_state(v159, v152, v153, v154, v155, v234, v235) == 2)
          {
            if (a3 != 5) {
              goto LABEL_70;
            }
            objc_msgSend_stateTimestamp(v159, v152, v153, v154, v155);
            if (v164 > v77)
            {
              objc_msgSend_stateTimestamp(v159, v160, v161, v162, v163);
              double v77 = v165;
            }

            objc_msgSend_date(MEMORY[0x189603F50], v160, v161, v162, v163);
            uint64_t v166 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_timeIntervalSince1970(v166, v167, v168, v169, v170);
            double v172 = v171;

            double v173 = v172 - v77;
            objc_msgSend_BSSDenyListExpiry(v244, v174, v175, v176, v177);
            double v179 = v178;
            uint64_t v180 = CWFGetOSLog();
            v181 = (void *)v180;
            if (v173 > v179)
            {
              if (v180)
              {
                CWFGetOSLog();
                v182 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                v182 = (os_log_s *)MEMORY[0x1895F8DA0];
                id v184 = MEMORY[0x1895F8DA0];
              }

              if (os_log_type_enabled(v182, OS_LOG_TYPE_ERROR))
              {
                int v262 = 138543618;
                v263 = v43;
                __int16 v264 = 2114;
                v265 = v243;
                LODWORD(v235) = 22;
                v234 = &v262;
                _os_log_send_and_compose_impl();
              }

LABEL_70:
              CWFGetOSLog();
              v185 = (void *)objc_claimAutoreleasedReturnValue();
              if (v185)
              {
                CWFGetOSLog();
                v186 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                v186 = (os_log_s *)MEMORY[0x1895F8DA0];
                id v187 = MEMORY[0x1895F8DA0];
              }

              if (os_log_type_enabled(v186, OS_LOG_TYPE_ERROR))
              {
                int v262 = 136446722;
                v263 = "-[CWFNetworkDenyList removeDenyListStateWithDenyListRemoveReason:]";
                __int16 v264 = 2114;
                v265 = v43;
                __int16 v266 = 2114;
                v267 = v243;
                LODWORD(v235) = 32;
                v234 = &v262;
                _os_log_send_and_compose_impl();
              }

              objc_msgSend_addObject_(v5, v188, (uint64_t)v159, v189, v190);
              continue;
            }

            if (v180)
            {
              CWFGetOSLog();
              v183 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              v183 = (os_log_s *)MEMORY[0x1895F8DA0];
              id v191 = MEMORY[0x1895F8DA0];
            }

            if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
            {
              int v262 = 138543618;
              v263 = v43;
              __int16 v264 = 2114;
              v265 = v243;
              LODWORD(v235) = 22;
              v234 = &v262;
              _os_log_send_and_compose_impl();
            }
          }
        }

        uint64_t v156 = objc_msgSend_countByEnumeratingWithState_objects_count_(v149, v152, (uint64_t)&v248, (uint64_t)v268, 16);
      }

      while (v156);
LABEL_82:

      id v7 = v236;
      self = v244;
      int v9 = v239;
      id v10 = v238;
LABEL_83:
      v245[0] = MEMORY[0x1895F87A8];
      v245[1] = 3221225472LL;
      v245[2] = sub_1864E8B10;
      v245[3] = &unk_189E5D708;
      id v192 = v10;
      id v246 = v192;
      unint64_t v247 = a3;
      objc_msgSend_enumerateObjectsUsingBlock_(v5, v193, (uint64_t)v245, v194, v195);
      objc_msgSend_statesCurrent(v192, v196, v197, v198, v199);
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObjectsInArray_(v200, v201, (uint64_t)v5, v202, v203);

      v9 |= objc_msgSend_count(v5, v204, v205, v206, v207) != 0;
      objc_msgSend_removeAllObjects(v5, v208, v209, v210, v211);

LABEL_84:
      uint64_t v11 = v242 + 1;
      id v12 = v10;
    }

    while (v242 + 1 != v241);
    uint64_t v241 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v212, (uint64_t)&v258, (uint64_t)v270, 16);
  }

  while (v241);

LABEL_87:
  if (objc_msgSend_count(v7, v213, v214, v215, v216))
  {
    CWFGetOSLog();
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    if (v221)
    {
      CWFGetOSLog();
      v222 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v222 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v223 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v222, OS_LOG_TYPE_ERROR))
    {
      int v262 = 136446210;
      v263 = "-[CWFNetworkDenyList removeDenyListStateWithDenyListRemoveReason:]";
      LODWORD(v235) = 12;
      v234 = &v262;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_removeObjectsInArray_(self->_denyList, v224, (uint64_t)v7, v225, v226);
  }

  if ((v9 & 1) != 0)
  {
    objc_msgSend_denyListDidUpdateHandler(self, v217, v218, v219, v220);
    v227 = (void *)objc_claimAutoreleasedReturnValue();

    if (v227)
    {
      objc_msgSend_denyListDidUpdateHandler(self, v217, v218, v219, v220);
      v228 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *))v228)[2](v228, &unk_189E5D728);
    }
  }

  objc_msgSend__printDenyList(self, v217, v218, v219, v220, v234, v235);
LABEL_98:
}

- (void)removeExpiredDenyListedState:(unint64_t)a3
{
  uint64_t v244 = *MEMORY[0x1895F89C0];
  id v215 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (v215)
  {
    __int128 v229 = 0u;
    __int128 v230 = 0u;
    __int128 v227 = 0u;
    __int128 v228 = 0u;
    id obj = self->_denyList;
    uint64_t v211 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v227, (uint64_t)v243, 16);
    id v6 = 0LL;
    if (v211)
    {
      uint64_t v210 = *(void *)v228;
      uint64_t v216 = self;
LABEL_4:
      uint64_t v7 = 0LL;
      uint64_t v8 = v6;
      while (1)
      {
        if (*(void *)v228 != v210) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(id *)(*((void *)&v227 + 1) + 8 * v7);

        objc_msgSend_statesCurrent(v6, v9, v10, v11, v12);
        id v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13) {
          break;
        }
LABEL_88:
        ++v7;
        uint64_t v8 = v6;
        if (v7 == v211)
        {
          uint64_t v211 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v227, (uint64_t)v243, 16);
          if (!v211)
          {
            v200 = (os_log_s *)v6;
            id v6 = 0LL;
            goto LABEL_91;
          }

          goto LABEL_4;
        }
      }

      objc_msgSend_scanResultForNetworkDenyListItem(v6, v14, v15, v16, v17);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_SSID(v18, v19, v20, v21, v22);
      *(double *)&uint64_t v23 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

      uint64_t v214 = (void *)v23;
      if (*(double *)&v23 != 0.0)
      {
        objc_msgSend_statesHistory(v6, v24, v25, v26, v27);
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v33 = objc_msgSend_count(v28, v29, v30, v31, v32);

        uint64_t v212 = v7;
        if (v33)
        {
          __int128 v225 = 0u;
          __int128 v226 = 0u;
          __int128 v223 = 0u;
          __int128 v224 = 0u;
          objc_msgSend_statesHistory(v6, v34, v35, v36, v37);
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_reverseObjectEnumerator(v38, v39, v40, v41, v42);
          uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();

          uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v223, (uint64_t)v242, 16);
          double v50 = 0.0;
          if (!v45) {
            goto LABEL_22;
          }
          uint64_t v51 = v45;
          uint64_t v52 = *(void *)v224;
          do
          {
            for (uint64_t i = 0LL; i != v51; ++i)
            {
              if (*(void *)v224 != v52) {
                objc_enumerationMutation(v43);
              }
              uint64_t v54 = *(void **)(*((void *)&v223 + 1) + 8 * i);
              if (v54
                && (objc_msgSend_state(*(void **)(*((void *)&v223 + 1) + 8 * i), v46, v47, v48, v49) == a3
                 || objc_msgSend_state(v54, v46, v47, v48, v49) == 5))
              {
                objc_msgSend_stateTimestamp(v54, v46, v47, v48, v49);
                double v50 = v55;
                goto LABEL_22;
              }
            }

            uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v223, (uint64_t)v242, 16);
          }

          while (v51);
LABEL_22:
        }

        else
        {
          double v50 = 0.0;
        }

        __int128 v221 = 0u;
        __int128 v222 = 0u;
        __int128 v219 = 0u;
        __int128 v220 = 0u;
        v213 = v6;
        objc_msgSend_statesCurrent(v6, v34, v35, v36, v37);
        uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v57, (uint64_t)&v219, (uint64_t)v241, 16);
        if (!v58) {
          goto LABEL_84;
        }
        uint64_t v63 = v58;
        uint64_t v64 = *(void *)v220;
LABEL_26:
        uint64_t v65 = 0LL;
        while (1)
        {
          if (*(void *)v220 != v64) {
            objc_enumerationMutation(v56);
          }
          uint64_t v66 = *(void **)(*((void *)&v219 + 1) + 8 * v65);
          objc_msgSend_date(MEMORY[0x189603F50], v59, v60, v61, v62, v205, v207);
          uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_timeIntervalSince1970(v67, v68, v69, v70, v71);
          double v73 = v72;

          if (objc_msgSend_state(v66, v74, v75, v76, v77) == a3 && objc_msgSend_state(v66, v78, v79, v80, v81) == 3)
          {
            objc_msgSend_wowDenyListExpiry(v216, v78, v79, v80, v81);
            if (v50 == 0.0)
            {
              CWFGetOSLog();
              uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue();
              if (v87)
              {
                CWFGetOSLog();
                id v88 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                id v88 = (os_log_s *)MEMORY[0x1895F8DA0];
                id v97 = MEMORY[0x1895F8DA0];
              }

              if (!os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
                goto LABEL_77;
              }
              int v231 = 136446210;
              id v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
              LODWORD(v207) = 12;
              uint64_t v205 = &v231;
              goto LABEL_41;
            }

            double v89 = v86;
            if (objc_msgSend_reason(v66, v82, v83, v84, v85) == 2)
            {
              objc_msgSend_stateTimestamp(v66, v90, v91, v92, v93);
              if (v73 - v94 <= 3600.0)
              {
                CWFGetOSLog();
                id v108 = (void *)objc_claimAutoreleasedReturnValue();
                if (v108)
                {
                  CWFGetOSLog();
                  id v88 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                }

                else
                {
                  id v88 = (os_log_s *)MEMORY[0x1895F8DA0];
                  id v172 = MEMORY[0x1895F8DA0];
                }

                if (!os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_77;
                }
                int v231 = 136446210;
                id v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
                LODWORD(v207) = 12;
                uint64_t v205 = &v231;
LABEL_41:
                _os_log_send_and_compose_impl();
                goto LABEL_77;
              }
            }

            CWFGetOSLog();
            uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue();
            if (v95)
            {
              CWFGetOSLog();
              uint64_t v96 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              uint64_t v96 = (os_log_s *)MEMORY[0x1895F8DA0];
              id v98 = MEMORY[0x1895F8DA0];
            }

            if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
            {
              int v231 = 136446722;
              id v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
              __int16 v233 = 2048;
              double v234 = v73 - v50;
              __int16 v235 = 2048;
              double v236 = v89;
              LODWORD(v207) = 32;
              uint64_t v205 = &v231;
              _os_log_send_and_compose_impl();
            }

            if (v73 - v50 > v89)
            {
              objc_msgSend_stateString(v66, v78, v79, v80, v81);
              uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_stateTimestamp(v66, v100, v101, v102, v103);
              double v105 = v104;
              CWFGetOSLog();
              double v106 = (void *)objc_claimAutoreleasedReturnValue();
              if (v106)
              {
                CWFGetOSLog();
                double v107 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                double v107 = (os_log_s *)MEMORY[0x1895F8DA0];
                id v109 = MEMORY[0x1895F8DA0];
              }

              if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x189603F50], v110, v111, v112, v113, v105);
                double v114 = (void *)objc_claimAutoreleasedReturnValue();
                int v231 = 136447234;
                id v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
                __int16 v233 = 2114;
                double v234 = *(double *)&v214;
                __int16 v235 = 2114;
                double v236 = *(double *)&v99;
                __int16 v237 = 2114;
                id v238 = v114;
                __int16 v239 = 2114;
                uint64_t v240 = v214;
                LODWORD(v207) = 52;
                uint64_t v205 = &v231;
                _os_log_send_and_compose_impl();
              }

              objc_msgSend_addObject_(v215, v115, (uint64_t)v66, v116, v117);
            }
          }

          if (objc_msgSend_state(v66, v78, v79, v80, v81, v205, v207) == a3
            && objc_msgSend_state(v66, v118, v119, v120, v121) == 2
            && objc_msgSend_reason(v66, v118, v119, v120, v121) == 8)
          {
            objc_msgSend_BSSDenyListExpiry(v216, v118, v119, v120, v121);
            double v123 = v122;
            CWFGetOSLog();
            id v124 = (void *)objc_claimAutoreleasedReturnValue();
            if (v124)
            {
              CWFGetOSLog();
              v125 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              v125 = (os_log_s *)MEMORY[0x1895F8DA0];
              id v126 = MEMORY[0x1895F8DA0];
            }

            if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend_stateTimestamp(v66, v127, v128, v129, v130);
              int v231 = 136446722;
              id v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
              __int16 v233 = 2048;
              double v234 = v73 - v131;
              __int16 v235 = 2048;
              double v236 = v123;
              LODWORD(v208) = 32;
              uint64_t v206 = &v231;
              _os_log_send_and_compose_impl();
            }

            objc_msgSend_stateTimestamp(v66, v132, v133, v134, v135);
            if (v73 - v136 > v123)
            {
              objc_msgSend_stateString(v66, v118, v119, v120, v121);
              uint64_t v137 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_stateTimestamp(v66, v138, v139, v140, v141);
              double v143 = v142;
              CWFGetOSLog();
              char v144 = (void *)objc_claimAutoreleasedReturnValue();
              if (v144)
              {
                CWFGetOSLog();
                __int16 v145 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                __int16 v145 = (os_log_s *)MEMORY[0x1895F8DA0];
                id v146 = MEMORY[0x1895F8DA0];
              }

              if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x189603F50], v147, v148, v149, v150, v143);
                uint64_t v151 = (void *)objc_claimAutoreleasedReturnValue();
                int v231 = 136447234;
                id v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
                __int16 v233 = 2114;
                double v234 = *(double *)&v214;
                __int16 v235 = 2114;
                double v236 = *(double *)&v137;
                __int16 v237 = 2114;
                id v238 = v151;
                __int16 v239 = 2114;
                uint64_t v240 = v214;
                LODWORD(v208) = 52;
                uint64_t v206 = &v231;
                _os_log_send_and_compose_impl();
              }

              objc_msgSend_addObject_(v215, v152, (uint64_t)v66, v153, v154);
            }
          }

          if (objc_msgSend_state(v66, v118, v119, v120, v121, v206, v208) != a3
            || objc_msgSend_state(v66, v59, v60, v61, v62) != 4)
          {
            goto LABEL_78;
          }

          objc_msgSend_stateString(v66, v59, v60, v61, v62);
          id v88 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stateTimestamp(v66, v155, v156, v157, v158);
          double v160 = v159;
          CWFGetOSLog();
          uint64_t v161 = (void *)objc_claimAutoreleasedReturnValue();
          if (v161)
          {
            CWFGetOSLog();
            uint64_t v162 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            uint64_t v162 = (os_log_s *)MEMORY[0x1895F8DA0];
            id v163 = MEMORY[0x1895F8DA0];
          }

          if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x189603F50], v164, v165, v166, v167, v160);
            uint64_t v168 = (void *)objc_claimAutoreleasedReturnValue();
            int v231 = 136447234;
            id v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
            __int16 v233 = 2114;
            double v234 = *(double *)&v214;
            __int16 v235 = 2114;
            double v236 = *(double *)&v88;
            __int16 v237 = 2114;
            id v238 = v168;
            __int16 v239 = 2114;
            uint64_t v240 = v214;
            LODWORD(v207) = 52;
            uint64_t v205 = &v231;
            _os_log_send_and_compose_impl();
          }

          objc_msgSend_addObject_(v215, v169, (uint64_t)v66, v170, v171);
LABEL_77:

LABEL_78:
          if (v63 == ++v65)
          {
            uint64_t v173 = objc_msgSend_countByEnumeratingWithState_objects_count_( v56,  v59,  (uint64_t)&v219,  (uint64_t)v241,  16);
            uint64_t v63 = v173;
            if (!v173)
            {
LABEL_84:

              v217[0] = MEMORY[0x1895F87A8];
              v217[1] = 3221225472LL;
              v217[2] = sub_1864E9820;
              v217[3] = &unk_189E5D6E0;
              id v6 = v213;
              id v174 = v213;
              id v218 = v174;
              objc_msgSend_enumerateObjectsUsingBlock_(v215, v175, (uint64_t)v217, v176, v177);
              objc_msgSend_statesCurrent(v174, v178, v179, v180, v181);
              v182 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_removeObjectsInArray_(v182, v183, (uint64_t)v215, v184, v185);

              if (objc_msgSend_count(v215, v186, v187, v188, v189))
              {
                objc_msgSend_denyListDidUpdateHandler(v216, v190, v191, v192, v193);
                uint64_t v194 = (void *)objc_claimAutoreleasedReturnValue();

                if (v194)
                {
                  objc_msgSend_denyListDidUpdateHandler(v216, v190, v191, v192, v193);
                  uint64_t v195 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
                  ((void (**)(void, void *))v195)[2](v195, &unk_189E5D748);
                }
              }

              objc_msgSend_removeAllObjects(v215, v190, v191, v192, v193, v205, v207);
              objc_msgSend__printDenyList(v216, v196, v197, v198, v199);

              uint64_t v7 = v212;
              goto LABEL_88;
            }

            goto LABEL_26;
          }
        }
      }

      CWFGetOSLog();
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      if (v201)
      {
        CWFGetOSLog();
        v200 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v200 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v202 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v200, OS_LOG_TYPE_ERROR))
      {
        int v231 = 136446210;
        id v232 = "-[CWFNetworkDenyList removeExpiredDenyListedState:]";
        _os_log_send_and_compose_impl();
      }

- (void)removeAllDenyListedItems
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  CWFGetOSLog();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    CWFGetOSLog();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v4 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v5 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v54 = 136446210;
    double v55 = "-[CWFNetworkDenyList removeAllDenyListedItems]";
    int v45 = 12;
    id v44 = &v54;
    _os_log_send_and_compose_impl();
  }

  if (objc_msgSend_count(self->_denyList, v6, v7, v8, v9))
  {
    id v14 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    id obj = self->_denyList;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v49, (uint64_t)v53, 16);
    if (v16)
    {
      uint64_t v17 = v16;
      id v18 = 0LL;
      uint64_t v19 = *(void *)v50;
      uint64_t v20 = MEMORY[0x1895F87A8];
      do
      {
        for (uint64_t i = 0LL; i != v17; ++i)
        {
          if (*(void *)v50 != v19) {
            objc_enumerationMutation(obj);
          }
          id v22 = *(id *)(*((void *)&v49 + 1) + 8 * i);

          objc_msgSend_addObject_(v14, v23, (uint64_t)v22, v24, v25);
          objc_msgSend_statesCurrent(v22, v26, v27, v28, v29);
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
          v47[0] = v20;
          v47[1] = 3221225472LL;
          v47[2] = sub_1864E9BB8;
          v47[3] = &unk_189E5D6E0;
          id v18 = v22;
          id v48 = v18;
          objc_msgSend_enumerateObjectsUsingBlock_(v30, v31, (uint64_t)v47, v32, v33);
        }

        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v49, (uint64_t)v53, 16);
      }

      while (v17);
    }

    objc_msgSend_removeObjectsInArray_(self->_denyList, v35, (uint64_t)v14, v36, v37);
    objc_msgSend_denyListDidUpdateHandler(self, v38, v39, v40, v41);
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend_denyListDidUpdateHandler(self, v10, v11, v12, v13);
      uint64_t v43 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *))v43)[2](v43, &unk_189E5D768);
    }
  }

  else
  {
    id v14 = 0LL;
  }

  objc_msgSend__printDenyList(self, v10, v11, v12, v13, v44, v45);
}

- (void)removeNetworkDenyListInfoWithReason:(unint64_t)a3 forScanResult:(id)a4
{
  uint64_t v365 = *MEMORY[0x1895F89C0];
  id v9 = a4;
  if (!v9)
  {
    objc_msgSend__printDenyList(self, v5, v6, v7, v8);
    CWFGetOSLog();
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      CWFGetOSLog();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v11 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v12 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v350 = 136446210;
      v351 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
      LODWORD(v319) = 12;
      v316 = &v350;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_removeAllDenyListedItems(self, v13, v14, v15, v16);
  }

  if (a3 == 1)
  {
    objc_msgSend_SSID(v9, v5, v6, v7, v8);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__findNetworkDenyListItemsForSSID_(self, v18, (uint64_t)v17, v19, v20);
    id v21 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_count(v21, v22, v23, v24, v25)) {
      goto LABEL_24;
    }
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
      id v37 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_SSID(v9, v38, v39, v40, v41);
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_BSSID(v9, v43, v44, v45, v46);
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
      int v350 = 136446722;
      v351 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
      __int16 v352 = 2114;
      v353 = v42;
      __int16 v354 = 2114;
      v355 = v47;
      LODWORD(v319) = 32;
      v316 = &v350;
      _os_log_send_and_compose_impl();
    }
  }

  else
  {
    id v21 = objc_alloc_init(MEMORY[0x189603FA8]);
    uint64_t v31 = objc_msgSend__findNetworkDenyListItem_(self, v28, (uint64_t)v9, v29, v30);
    if (v31)
    {
      uint64_t v27 = (os_log_s *)v31;
      objc_msgSend_addObject_(v21, v32, v31, v33, v34);
    }

    else
    {
      CWFGetOSLog();
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        CWFGetOSLog();
        uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v36 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v48 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_SSID(v9, v49, v50, v51, v52);
        uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_BSSID(v9, v54, v55, v56, v57);
        uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
        int v350 = 136446722;
        v351 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
        __int16 v352 = 2114;
        v353 = v53;
        __int16 v354 = 2114;
        v355 = v58;
        LODWORD(v319) = 32;
        v316 = &v350;
        _os_log_send_and_compose_impl();
      }

      uint64_t v27 = 0LL;
    }
  }

LABEL_24:
  id v332 = objc_alloc_init(MEMORY[0x189603FA8]);
  v322 = v21;
  if (!v332)
  {
    CWFGetOSLog();
    v312 = (void *)objc_claimAutoreleasedReturnValue();
    if (v312)
    {
      CWFGetOSLog();
      uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v59 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v314 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      goto LABEL_151;
    }
    int v350 = 136446210;
    v351 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
    goto LABEL_150;
  }

  id v330 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (!v330)
  {
    CWFGetOSLog();
    v313 = (void *)objc_claimAutoreleasedReturnValue();
    if (v313)
    {
      CWFGetOSLog();
      uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v59 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v315 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      goto LABEL_151;
    }
    int v350 = 136446210;
    v351 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
LABEL_150:
    _os_log_send_and_compose_impl();
LABEL_151:
    v307 = 0LL;
    uint64_t v63 = 0LL;
    id v330 = 0LL;
    goto LABEL_139;
  }

  __int128 v347 = 0u;
  __int128 v348 = 0u;
  __int128 v345 = 0u;
  __int128 v346 = 0u;
  uint64_t v59 = (os_log_s *)v21;
  uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v60, (uint64_t)&v345, (uint64_t)v364, 16);
  if (v61)
  {
    uint64_t v62 = v61;
    unint64_t v328 = a3;
    v331 = 0LL;
    uint64_t v63 = 0LL;
    unint64_t v64 = 0x189607000uLL;
    uint64_t v325 = *(void *)v346;
    v323 = v59;
    do
    {
      uint64_t v65 = 0LL;
      uint64_t v324 = v62;
      do
      {
        uint64_t v66 = v63;
        if (*(void *)v346 != v325) {
          objc_enumerationMutation(v59);
        }
        uint64_t v326 = v65;
        uint64_t v67 = *(void **)(*((void *)&v345 + 1) + 8 * v65);
        id v68 = objc_alloc(*(Class *)(v64 + 2600));
        objc_msgSend_scanResultForNetworkDenyListItem(v67, v69, v70, v71, v72);
        double v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_SSID(v73, v74, v75, v76, v77);
        uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v63 = (void *)objc_msgSend_initWithData_encoding_(v68, v79, (uint64_t)v78, 4, v80);

        if (v63)
        {
          objc_msgSend_scanResultForNetworkDenyListItem(v67, v81, v82, v83, v84);
          uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v90 = objc_msgSend_BSSID(v85, v86, v87, v88, v89);

          if (v90)
          {
            v331 = (void *)v90;
            __int128 v343 = 0u;
            __int128 v344 = 0u;
            __int128 v341 = 0u;
            __int128 v342 = 0u;
            objc_msgSend_statesCurrent(v67, v91, v92, v93, v94);
            uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v96, (uint64_t)&v341, (uint64_t)v363, 16);
            if (v97)
            {
              uint64_t v102 = v97;
              uint64_t v103 = *(void *)v342;
              do
              {
                for (uint64_t i = 0LL; i != v102; ++i)
                {
                  if (*(void *)v342 != v103) {
                    objc_enumerationMutation(v95);
                  }
                  double v105 = *(void **)(*((void *)&v341 + 1) + 8 * i);
                  if (objc_msgSend_state(v105, v98, v99, v100, v101, v316, v319) == 1)
                  {
                    CWFGetOSLog();
                    uint64_t v110 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v110)
                    {
                      CWFGetOSLog();
                      uint64_t v111 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    }

                    else
                    {
                      uint64_t v111 = (os_log_s *)MEMORY[0x1895F8DA0];
                      id v112 = MEMORY[0x1895F8DA0];
                    }

                    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
                    {
                      int v350 = 136446722;
                      v351 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
                      __int16 v352 = 2114;
                      v353 = v63;
                      __int16 v354 = 2114;
                      v355 = v331;
                      LODWORD(v320) = 32;
                      v317 = &v350;
                      _os_log_send_and_compose_impl();
                    }

                    objc_msgSend_addObject_(v332, v113, (uint64_t)v105, v114, v115);
                  }

                  if (objc_msgSend_state(v105, v106, v107, v108, v109, v317, v320) == 3
                    && objc_msgSend__evaluateTriggersForDenyListRemove_denyListRemoveReason_SSID_( self,  v116,  (uint64_t)v67,  v328,  (uint64_t)v63))
                  {
                    CWFGetOSLog();
                    uint64_t v120 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v120)
                    {
                      CWFGetOSLog();
                      uint64_t v121 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    }

                    else
                    {
                      uint64_t v121 = (os_log_s *)MEMORY[0x1895F8DA0];
                      id v122 = MEMORY[0x1895F8DA0];
                    }

                    if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
                    {
                      int v350 = 136446722;
                      v351 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
                      __int16 v352 = 2114;
                      v353 = v63;
                      __int16 v354 = 2114;
                      v355 = v331;
                      LODWORD(v321) = 32;
                      v318 = &v350;
                      _os_log_send_and_compose_impl();
                    }

                    objc_msgSend_addObject_(v332, v123, (uint64_t)v105, v124, v125);
                  }

                  if (objc_msgSend_state(v105, v116, v117, v118, v119, v318, v321) == 2)
                  {
                    CWFGetOSLog();
                    id v126 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v126)
                    {
                      CWFGetOSLog();
                      uint64_t v127 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    }

                    else
                    {
                      uint64_t v127 = (os_log_s *)MEMORY[0x1895F8DA0];
                      id v128 = MEMORY[0x1895F8DA0];
                    }

                    if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
                    {
                      int v350 = 136446722;
                      v351 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
                      __int16 v352 = 2114;
                      v353 = v63;
                      __int16 v354 = 2114;
                      v355 = v331;
                      LODWORD(v319) = 32;
                      v316 = &v350;
                      _os_log_send_and_compose_impl();
                    }

                    objc_msgSend_addObject_(v332, v129, (uint64_t)v105, v130, v131);
                  }
                }

                uint64_t v102 = objc_msgSend_countByEnumeratingWithState_objects_count_( v95,  v98,  (uint64_t)&v341,  (uint64_t)v363,  16);
              }

              while (v102);
            }

            __int128 v339 = 0u;
            __int128 v340 = 0u;
            __int128 v337 = 0u;
            __int128 v338 = 0u;
            objc_msgSend_denyListTriggers(v67, v132, v133, v134, v135);
            id obj = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v137 = objc_msgSend_countByEnumeratingWithState_objects_count_( obj,  v136,  (uint64_t)&v337,  (uint64_t)v362,  16);
            if (v137)
            {
              uint64_t v142 = v137;
              uint64_t v143 = *(void *)v338;
              do
              {
                uint64_t v144 = 0LL;
                do
                {
                  if (*(void *)v338 != v143) {
                    objc_enumerationMutation(obj);
                  }
                  __int16 v145 = *(void **)(*((void *)&v337 + 1) + 8 * v144);
                  objc_msgSend_reasonString(v145, v138, v139, v140, v141, v316, v319);
                  id v146 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_reasonTimestamp(v145, v147, v148, v149, v150);
                  double v152 = v151;
                  objc_msgSend_date(MEMORY[0x189603F50], v153, v154, v155, v156);
                  uint64_t v157 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_timeIntervalSince1970(v157, v158, v159, v160, v161);
                  double v163 = v162;

                  if (!objc_msgSend_reason(v145, v164, v165, v166, v167)
                    || objc_msgSend_reason(v145, v168, v169, v170, v171) == 1
                    || objc_msgSend_reason(v145, v172, v173, v174, v175) == 5
                    || objc_msgSend_reason(v145, v176, v177, v178, v179) == 7
                    || objc_msgSend_reason(v145, v180, v181, v182, v183) == 2
                    || objc_msgSend_reason(v145, v184, v185, v186, v187) == 3
                    || objc_msgSend_reason(v145, v188, v189, v190, v191) == 11
                    || objc_msgSend_reason(v145, v192, v193, v194, v195) == 12)
                  {
                    CWFGetOSLog();
                    v200 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v200)
                    {
                      CWFGetOSLog();
                      v201 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    }

                    else
                    {
                      v201 = (os_log_s *)MEMORY[0x1895F8DA0];
                      id v202 = MEMORY[0x1895F8DA0];
                    }

                    if (os_log_type_enabled(v201, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_79;
                    }
                    goto LABEL_81;
                  }

                  if (v328 == 1)
                  {
                    double v215 = v163 - v152;
                    if (objc_msgSend_reason(v145, v196, v197, v198, v199) == 4 && v152 != 0.0 && v215 > 300.0)
                    {
                      CWFGetOSLog();
                      uint64_t v216 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v216)
                      {
                        CWFGetOSLog();
                        v201 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      }

                      else
                      {
                        v201 = (os_log_s *)MEMORY[0x1895F8DA0];
                        id v231 = MEMORY[0x1895F8DA0];
                      }

                      if (os_log_type_enabled(v201, OS_LOG_TYPE_ERROR))
                      {
LABEL_79:
                        objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x189603F50], v203, v204, v205, v206, v152);
                        uint64_t v207 = (void *)objc_claimAutoreleasedReturnValue();
                        int v350 = 136447234;
                        v351 = "-[CWFNetworkDenyList removeNetworkDenyListInfoWithReason:forScanResult:]";
                        __int16 v352 = 2114;
                        v353 = v146;
                        __int16 v354 = 2114;
                        v355 = v207;
                        __int16 v356 = 2114;
                        v357 = v63;
                        __int16 v358 = 2114;
                        v359 = v331;
                        LODWORD(v319) = 52;
                        v316 = &v350;
                        goto LABEL_80;
                      }

- (BOOL)_evaluateTriggersForDenyListRemove:(id)a3 denyListRemoveReason:(unint64_t)a4 SSID:(id)a5
{
  uint64_t v85 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v69 = a5;
  uint64_t v76 = 0LL;
  uint64_t v77 = &v76;
  uint64_t v78 = 0x2020000000LL;
  char v79 = 0;
  uint64_t v70 = v7;
  objc_msgSend_statesHistory(v7, v8, v9, v10, v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = objc_msgSend_count(v12, v13, v14, v15, v16);

  objc_msgSend_isUserModeInteractiveHandler(self, v18, v19, v20, v21);
  id v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend_isUserModeInteractiveHandler(self, v23, v24, v25, v26);
    uint64_t v27 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    v75[0] = MEMORY[0x1895F87A8];
    v75[1] = 3221225472LL;
    v75[2] = sub_1864EB368;
    v75[3] = &unk_189E5D7B0;
    v75[4] = &v76;
    ((void (**)(void, void *))v27)[2](v27, v75);

    CWFGetOSLog();
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      CWFGetOSLog();
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v29 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v32 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      if (*((_BYTE *)v77 + 24)) {
        uint64_t v33 = "interactive";
      }
      else {
        uint64_t v33 = "non-interactive";
      }
      int v81 = 136446466;
      uint64_t v82 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListRemove:denyListRemoveReason:SSID:]";
      __int16 v83 = 2082;
      uint64_t v84 = v33;
      LODWORD(v67) = 22;
      uint64_t v66 = &v81;
      _os_log_send_and_compose_impl();
    }

    if (*((_BYTE *)v77 + 24))
    {
      LOBYTE(v38) = 1;
    }

    else
    {
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      objc_msgSend_statesHistory(v7, v34, v35, v36, v37);
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v71, (uint64_t)v80, 16);
      if (v44)
      {
        uint64_t v45 = 0LL;
        char v46 = 0;
        uint64_t v47 = *(void *)v72;
        uint64_t v48 = v17 - 1;
        unint64_t v49 = 13LL;
        do
        {
          for (uint64_t i = 0LL; i != v44; ++i)
          {
            if (*(void *)v72 != v47) {
              objc_enumerationMutation(v38);
            }
            uint64_t v51 = *(void **)(*((void *)&v71 + 1) + 8 * i);
            if (objc_msgSend_state(v51, v40, v41, v42, v43, v66, v67) != 1)
            {
              if (objc_msgSend_reason(v51, v40, v41, v42, v43) == 2)
              {
                objc_msgSend_date(MEMORY[0x189603F50], v40, v41, v42, v43);
                uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_timeIntervalSince1970(v52, v53, v54, v55, v56);
                double v58 = v57;

                objc_msgSend_stateTimestamp(v51, v59, v60, v61, v62);
                v46 |= v58 - v63 < 21600.0;
              }

              if (v45 == v48) {
                unint64_t v49 = objc_msgSend_reason(v51, v40, v41, v42, v43);
              }
              ++v45;
            }
          }

          uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v40, (uint64_t)&v71, (uint64_t)v80, 16);
        }

        while (v44);
      }

      else
      {
        char v46 = 0;
        unint64_t v49 = 13LL;
      }

      LOBYTE(v38) = 0;
      if (!((a4 != 1) | v46 & 1) && v49 <= 7) {
        LODWORD(v38) = (0xB0u >> v49) & 1;
      }
    }
  }

  else
  {
    CWFGetOSLog();
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      CWFGetOSLog();
      uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v31 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v64 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      int v81 = 136446210;
      uint64_t v82 = "-[CWFNetworkDenyList _evaluateTriggersForDenyListRemove:denyListRemoveReason:SSID:]";
      _os_log_send_and_compose_impl();
    }

    LOBYTE(v38) = 1;
    *((_BYTE *)v77 + 24) = 1;
  }

  _Block_object_dispose(&v76, 8);

  return (char)v38;
}

- (void)processDenyListedBSSForMetrics:(id)a3
{
  uint64_t v75 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (v4)
  {
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    id obj = self->_denyList;
    uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v64, (uint64_t)v74, 16);
    if (v6)
    {
      uint64_t v7 = v6;
      id v62 = v4;
      id v8 = 0LL;
      uint64_t v9 = *(void *)v65;
      do
      {
        uint64_t v10 = 0LL;
        uint64_t v11 = v8;
        do
        {
          if (*(void *)v65 != v9) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(id *)(*((void *)&v64 + 1) + 8 * v10);

          CWFGetOSLog();
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
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

          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend_scanResultForNetworkDenyListItem(v8, v15, v16, v17, v18);
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_SSID(v19, v20, v21, v22, v23);
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_scanResultForNetworkDenyListItem(v8, v25, v26, v27, v28);
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_BSSID(v29, v30, v31, v32, v33);
            uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
            int v68 = 136446722;
            id v69 = "-[CWFNetworkDenyList processDenyListedBSSForMetrics:]";
            __int16 v70 = 2114;
            __int128 v71 = v24;
            __int16 v72 = 2114;
            __int128 v73 = v34;
            _os_log_send_and_compose_impl();
          }

          ++v10;
          uint64_t v11 = v8;
        }

        while (v7 != v10);
        uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v64, (uint64_t)v74, 16);
      }

      while (v7);

      id v4 = v62;
    }

    CWFGetOSLog();
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      CWFGetOSLog();
      uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v37 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v38 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_SSID(v4, v39, v40, v41, v42);
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_BSSID(v4, v44, v45, v46, v47);
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
      int v68 = 136446722;
      id v69 = "-[CWFNetworkDenyList processDenyListedBSSForMetrics:]";
      __int16 v70 = 2114;
      __int128 v71 = v43;
      __int16 v72 = 2114;
      __int128 v73 = v48;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend__findNetworkDenyListItem_(self, v49, (uint64_t)v4, v50, v51);
    uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      double v57 = v52;
      objc_msgSend_processDenyListedBSSForMetrics(v52, v53, v54, v55, v56);
      goto LABEL_22;
    }

    CWFGetOSLog();
    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      CWFGetOSLog();
      double v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      double v57 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v61 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      int v68 = 136446210;
      id v69 = "-[CWFNetworkDenyList processDenyListedBSSForMetrics:]";
      goto LABEL_33;
    }
  }

  else
  {
    CWFGetOSLog();
    double v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      CWFGetOSLog();
      double v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      double v57 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v60 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      int v68 = 136446210;
      id v69 = "-[CWFNetworkDenyList processDenyListedBSSForMetrics:]";
LABEL_33:
      _os_log_send_and_compose_impl();
    }
  }

- (void)removeAllDenyListEntriesWithNetworkName:(id)a3
{
  uint64_t v125 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v114 = 0u;
  __int128 v115 = 0u;
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  id obj = self->_denyList;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v114, (uint64_t)v124, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v109 = self;
    uint64_t v110 = v5;
    char v9 = 0;
    id v10 = 0LL;
    uint64_t v11 = *(void *)v115;
    do
    {
      uint64_t v12 = 0LL;
      uint64_t v13 = v10;
      do
      {
        if (*(void *)v115 != v11) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(id *)(*((void *)&v114 + 1) + 8 * v12);

        id v14 = objc_alloc(NSString);
        objc_msgSend_scanResultForNetworkDenyListItem(v10, v15, v16, v17, v18);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_SSID(v19, v20, v21, v22, v23);
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v27 = (void *)objc_msgSend_initWithData_encoding_(v14, v25, (uint64_t)v24, 4, v26);
        int isEqualToString = objc_msgSend_isEqualToString_(v4, v28, (uint64_t)v27, v29, v30);

        if (isEqualToString)
        {
          CWFGetOSLog();
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            CWFGetOSLog();
            uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            uint64_t v34 = (os_log_s *)MEMORY[0x1895F8DA0];
            id v35 = MEMORY[0x1895F8DA0];
          }

          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend_scanResultForNetworkDenyListItem(v10, v36, v37, v38, v39);
            uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_SSID(v40, v41, v42, v43, v44);
            uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_scanResultForNetworkDenyListItem(v10, v46, v47, v48, v49);
            uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_SSID(v50, v51, v52, v53, v54);
            uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
            int v118 = 136446722;
            uint64_t v119 = "-[CWFNetworkDenyList removeAllDenyListEntriesWithNetworkName:]";
            __int16 v120 = 2114;
            uint64_t v121 = v45;
            __int16 v122 = 2114;
            double v123 = v55;
            _os_log_send_and_compose_impl();
          }

          objc_msgSend_denyListTriggers(v10, v56, v57, v58, v59);
          id v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeAllObjects(v60, v61, v62, v63, v64);

          objc_msgSend_statesCurrent(v10, v65, v66, v67, v68);
          id v69 = (void *)objc_claimAutoreleasedReturnValue();
          v112[0] = MEMORY[0x1895F87A8];
          v112[1] = 3221225472LL;
          v112[2] = sub_1864EBB80;
          v112[3] = &unk_189E5D6E0;
          id v70 = v10;
          id v113 = v70;
          objc_msgSend_enumerateObjectsUsingBlock_(v69, v71, (uint64_t)v112, v72, v73);

          objc_msgSend_statesCurrent(v70, v74, v75, v76, v77);
          uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeAllObjects(v78, v79, v80, v81, v82);

          objc_msgSend_statesHistory(v70, v83, v84, v85, v86);
          uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeAllObjects(v87, v88, v89, v90, v91);

          objc_msgSend_addObject_(v110, v92, (uint64_t)v70, v93, v94);
          char v9 = 1;
        }

        ++v12;
        uint64_t v13 = v10;
      }

      while (v8 != v12);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v114, (uint64_t)v124, 16);
    }

    while (v8);

    id v5 = v110;
    self = v109;
  }

  else
  {
    char v9 = 0;
  }

  if (objc_msgSend_count(v5, v95, v96, v97, v98)) {
    objc_msgSend_removeObjectsInArray_(self->_denyList, v99, (uint64_t)v5, v101, v102);
  }
  if ((v9 & 1) != 0)
  {
    objc_msgSend_denyListDidUpdateHandler(self, v99, v100, v101, v102);
    uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue();

    if (v103)
    {
      objc_msgSend_denyListDidUpdateHandler(self, v104, v105, v106, v107);
      uint64_t v108 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *))v108)[2](v108, &unk_189E5D7D0);
    }
  }
}

- (void)removeNetworkDenyListInfoForTrigger:(unint64_t)a3 forNetwork:(id)a4
{
  uint64_t v155 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  id v123 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v126 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v8 = objc_alloc(NSString);
  objc_msgSend_SSID(v6, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = (void *)objc_msgSend_initWithData_encoding_(v8, v14, (uint64_t)v13, 4, v15);

  __int128 v145 = 0u;
  __int128 v146 = 0u;
  __int128 v143 = 0u;
  __int128 v144 = 0u;
  uint64_t v130 = self;
  id obj = self->_denyList;
  uint64_t v128 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v143, (uint64_t)v154, 16);
  if (v128)
  {
    uint64_t v22 = *(void *)v144;
    uint64_t v124 = *(void *)v144;
    id v125 = v6;
    do
    {
      uint64_t v23 = 0LL;
      do
      {
        if (*(void *)v144 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v129 = v23;
        uint64_t v24 = *(void **)(*((void *)&v143 + 1) + 8 * v23);
        objc_msgSend_scanResultForNetworkDenyListItem(v24, v18, v19, v20, v21, v121, v122);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_SSID(v25, v26, v27, v28, v29);
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_SSID(v6, v31, v32, v33, v34);
        id v35 = (void *)objc_claimAutoreleasedReturnValue();
        int isEqual = objc_msgSend_isEqual_(v30, v36, (uint64_t)v35, v37, v38);

        if (isEqual)
        {
          __int128 v141 = 0u;
          __int128 v142 = 0u;
          __int128 v139 = 0u;
          __int128 v140 = 0u;
          objc_msgSend_denyListTriggers(v24, v18, v19, v20, v21);
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v139, (uint64_t)v153, 16);
          if (v42)
          {
            uint64_t v47 = v42;
            uint64_t v48 = *(void *)v140;
            do
            {
              for (uint64_t i = 0LL; i != v47; ++i)
              {
                if (*(void *)v140 != v48) {
                  objc_enumerationMutation(v40);
                }
                uint64_t v50 = *(void **)(*((void *)&v139 + 1) + 8 * i);
                if (objc_msgSend_reason(v50, v43, v44, v45, v46) == a3) {
                  objc_msgSend_addObject_(v7, v43, (uint64_t)v50, v45, v46);
                }
              }

              uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_( v40,  v43,  (uint64_t)&v139,  (uint64_t)v153,  16);
            }

            while (v47);
          }

          __int128 v137 = 0u;
          __int128 v138 = 0u;
          __int128 v135 = 0u;
          __int128 v136 = 0u;
          objc_msgSend_statesCurrent(v24, v51, v52, v53, v54);
          uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v56, (uint64_t)&v135, (uint64_t)v152, 16);
          if (v57)
          {
            uint64_t v62 = v57;
            uint64_t v63 = *(void *)v136;
            do
            {
              for (uint64_t j = 0LL; j != v62; ++j)
              {
                if (*(void *)v136 != v63) {
                  objc_enumerationMutation(v55);
                }
                __int128 v65 = *(void **)(*((void *)&v135 + 1) + 8 * j);
                if (objc_msgSend_reason(v65, v58, v59, v60, v61, v121, v122) == a3)
                {
                  if (objc_msgSend_state(v65, v58, v59, v60, v61) == 3
                    && objc_msgSend__evaluateTriggersForDenyListRemove_denyListRemoveReason_SSID_( v130,  v66,  (uint64_t)v24,  1,  (uint64_t)v16))
                  {
                    objc_msgSend_addObject_(v7, v66, (uint64_t)v65, v67, v68);
                    CWFGetOSLog();
                    id v69 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v69)
                    {
                      CWFGetOSLog();
                      id v70 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    }

                    else
                    {
                      id v70 = (os_log_s *)MEMORY[0x1895F8DA0];
                      id v71 = MEMORY[0x1895F8DA0];
                    }

                    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                    {
                      int v148 = 136446466;
                      uint64_t v149 = "-[CWFNetworkDenyList removeNetworkDenyListInfoForTrigger:forNetwork:]";
                      __int16 v150 = 2114;
                      double v151 = v16;
                      LODWORD(v122) = 22;
                      uint64_t v121 = &v148;
                      _os_log_send_and_compose_impl();
                    }
                  }

                  else
                  {
                    objc_msgSend_addObject_(v7, v66, (uint64_t)v65, v67, v68);
                  }
                }
              }

              uint64_t v62 = objc_msgSend_countByEnumeratingWithState_objects_count_( v55,  v58,  (uint64_t)&v135,  (uint64_t)v152,  16);
            }

            while (v62);
          }

          __int128 v133 = 0u;
          __int128 v134 = 0u;
          __int128 v131 = 0u;
          __int128 v132 = 0u;
          id v72 = v126;
          uint64_t v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v73, (uint64_t)&v131, (uint64_t)v147, 16);
          if (v74)
          {
            uint64_t v76 = v74;
            uint64_t v77 = *(void *)v132;
            do
            {
              for (uint64_t k = 0LL; k != v76; ++k)
              {
                if (*(void *)v132 != v77) {
                  objc_enumerationMutation(v72);
                }
                objc_msgSend_processDenyListStateMetric_denyListRemove_denyListRemoveReason_( v24,  v75,  *(void *)(*((void *)&v131 + 1) + 8 * k),  1,  1,  v121,  v122);
              }

              uint64_t v76 = objc_msgSend_countByEnumeratingWithState_objects_count_( v72,  v75,  (uint64_t)&v131,  (uint64_t)v147,  16);
            }

            while (v76);
          }

          objc_msgSend_statesCurrent(v24, v79, v80, v81, v82);
          __int16 v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObjectsInArray_(v83, v84, (uint64_t)v72, v85, v86);

          objc_msgSend_denyListTriggers(v24, v87, v88, v89, v90);
          uint64_t v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObjectsInArray_(v91, v92, (uint64_t)v7, v93, v94);

          objc_msgSend_denyListTriggers(v24, v95, v96, v97, v98);
          uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_count(v99, v100, v101, v102, v103))
          {

            uint64_t v22 = v124;
            id v6 = v125;
          }

          else
          {
            objc_msgSend_statesCurrent(v24, v104, v105, v106, v107);
            uint64_t v108 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v113 = objc_msgSend_count(v108, v109, v110, v111, v112);

            uint64_t v22 = v124;
            id v6 = v125;
            if (!v113) {
              objc_msgSend_addObject_(v123, v18, (uint64_t)v24, v20, v21);
            }
          }
        }

        uint64_t v23 = v129 + 1;
      }

      while (v129 + 1 != v128);
      uint64_t v128 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v143, (uint64_t)v154, 16);
    }

    while (v128);
  }

  objc_msgSend_removeObjectsInArray_(v130->_denyList, v114, (uint64_t)v123, v115, v116);
  objc_msgSend_removeAllObjects(v123, v117, v118, v119, v120);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  if (a3)
  {
    self->_enabled = 1;
  }

  else
  {
    self->_enabled = 0;
    objc_msgSend_removeAllDenyListedItems(self, a2, a3, v3, v4);
  }

- (BOOL)_meetsThresholds:(unint64_t)a3 count:(unsigned int)a4 forSSIDThresholds:(BOOL)a5 BSSID:(id)a6 SSID:(id)a7
{
  BOOL v8 = a5;
  id v12 = a6;
  id v17 = a7;
  if (v8)
  {
    objc_msgSend_SSIDThresholds(self, v13, v14, v15, v16);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v18, v19, a3, v20, v21);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v27) = objc_msgSend_unsignedIntValue(v22, v23, v24, v25, v26) <= a4;

    CWFGetOSLog();
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      CWFGetOSLog();
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v29 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v40 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_SSIDThresholds(self, v41, v42, v43, v44);
      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v45, v46, a3, v47, v48);
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_unsignedIntValue(v49, v50, v51, v52, v53);
LABEL_12:
      _os_log_send_and_compose_impl();
    }
  }

  else
  {
    objc_msgSend_BSSIDThresholds(self, v13, v14, v15, v16);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v30, v31, a3, v32, v33);
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v27 = objc_msgSend_unsignedIntValue(v34, v35, v36, v37, v38) <= a4;

    CWFGetOSLog();
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      CWFGetOSLog();
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v29 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v54 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_BSSIDThresholds(self, v55, v56, v57, v58);
      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v45, v59, a3, v60, v61);
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_unsignedIntValue(v49, v62, v63, v64, v65);
      goto LABEL_12;
    }
  }

  return v27;
}

- (id)_findNetworkDenyListItemsForSSID:(id)a3
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v41 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id obj = self->_denyList;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v43, (uint64_t)v47, 16);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0LL;
    uint64_t v9 = *(void *)v44;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        uint64_t v11 = v8;
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(id *)(*((void *)&v43 + 1) + 8 * i);

        objc_msgSend_scanResultForNetworkDenyListItem(v8, v12, v13, v14, v15);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_SSID(v16, v17, v18, v19, v20);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v26 = v21;
        if (v4 && v21)
        {
          objc_msgSend_scanResultForNetworkDenyListItem(v8, v22, v23, v24, v25);
          BOOL v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_SSID(v27, v28, v29, v30, v31);
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
          int isEqual = objc_msgSend_isEqual_(v32, v33, (uint64_t)v4, v34, v35);

          if (isEqual) {
            objc_msgSend_addObject_(v41, v37, (uint64_t)v8, v38, v39);
          }
        }

        else
        {
        }
      }

      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v43, (uint64_t)v47, 16);
    }

    while (v7);
  }

  return v41;
}

- (id)_findNetworkDenyListItem:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v5 = self->_denyList;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0LL;
    uint64_t v10 = *(void *)v19;
LABEL_3:
    uint64_t v11 = 0LL;
    id v12 = v9;
    while (1)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v5);
      }
      id v9 = *(id *)(*((void *)&v18 + 1) + 8 * v11);

      ++v11;
      id v12 = v9;
      if (v8 == v11)
      {
        uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v16, (uint64_t)&v18, (uint64_t)v22, 16);
        if (v8) {
          goto LABEL_3;
        }

        goto LABEL_10;
      }
    }
  }

  else
  {
LABEL_10:
    id v9 = 0LL;
  }

  return v9;
}

- (id)networksInDenyListedState:(unint64_t)a3
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (v5)
  {
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    uint64_t v6 = self->_denyList;
    uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v45, (uint64_t)v50, 16);
    if (v40)
    {
      id v8 = 0LL;
      id obj = v6;
      uint64_t v39 = *(void *)v46;
      do
      {
        uint64_t v9 = 0LL;
        uint64_t v10 = v8;
        do
        {
          if (*(void *)v46 != v39) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(id *)(*((void *)&v45 + 1) + 8 * v9);

          __int128 v43 = 0u;
          __int128 v44 = 0u;
          __int128 v41 = 0u;
          __int128 v42 = 0u;
          objc_msgSend_statesCurrent(v8, v11, v12, v13, v14);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v41, (uint64_t)v49, 16);
          if (v17)
          {
            uint64_t v22 = v17;
            uint64_t v23 = *(void *)v42;
            do
            {
              for (uint64_t i = 0LL; i != v22; ++i)
              {
                if (*(void *)v42 != v23) {
                  objc_enumerationMutation(v15);
                }
                if (objc_msgSend_state(*(void **)(*((void *)&v41 + 1) + 8 * i), v18, v19, v20, v21) == a3)
                {
                  objc_msgSend_scanResultForNetworkDenyListItem(v8, v18, v19, v20, v21);
                  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v25)
                  {
                    objc_msgSend_scanResultForNetworkDenyListItem(v8, v18, v19, v20, v21);
                    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
                    uint64_t v30 = (void *)objc_msgSend_copyWithZone_(v26, v27, 0, v28, v29);

                    if (v30) {
                      objc_msgSend_addObject_(v5, v31, (uint64_t)v30, v32, v33);
                    }
                  }
                }
              }

              uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v41, (uint64_t)v49, 16);
            }

            while (v22);
          }

          ++v9;
          uint64_t v10 = v8;
        }

        while (v9 != v40);
        uint64_t v6 = obj;
        uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v45, (uint64_t)v50, 16);
      }

      while (v40);
    }
  }

  else
  {
    CWFGetOSLog();
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      CWFGetOSLog();
      uint64_t v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v6 = (NSMutableArray *)MEMORY[0x1895F8DA0];
      id v37 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      int v51 = 136446210;
      uint64_t v52 = "-[CWFNetworkDenyList networksInDenyListedState:]";
      _os_log_send_and_compose_impl();
    }
  }

  return v5;
}

- (id)networksInDenyListedStateHistory:(unint64_t)a3
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  id v41 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (v41)
  {
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id v5 = self->_denyList;
    uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v47, (uint64_t)v52, 16);
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0LL;
      uint64_t v10 = *(void *)v48;
      id obj = v5;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          uint64_t v12 = v9;
          if (*(void *)v48 != v10) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(id *)(*((void *)&v47 + 1) + 8 * i);

          __int128 v45 = 0u;
          __int128 v46 = 0u;
          __int128 v43 = 0u;
          __int128 v44 = 0u;
          objc_msgSend_statesHistory(v9, v13, v14, v15, v16);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v43, (uint64_t)v51, 16);
          if (v19)
          {
            uint64_t v24 = v19;
            uint64_t v25 = *(void *)v44;
            while (2)
            {
              for (uint64_t j = 0LL; j != v24; ++j)
              {
                if (*(void *)v44 != v25) {
                  objc_enumerationMutation(v17);
                }
                BOOL v27 = *(void **)(*((void *)&v43 + 1) + 8 * j);
                if (objc_msgSend_state(v27, v20, v21, v22, v23) == a3
                  || objc_msgSend_state(v27, v20, v21, v22, v23) == 5)
                {
                  objc_msgSend_scanResultForNetworkDenyListItem(v9, v20, v21, v22, v23);
                  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v28)
                  {
                    objc_msgSend_scanResultForNetworkDenyListItem(v9, v20, v21, v22, v23);
                    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
                    uint64_t v33 = (void *)objc_msgSend_copyWithZone_(v29, v30, 0, v31, v32);

                    if (v33) {
                      objc_msgSend_addObject_(v41, v34, (uint64_t)v33, v35, v36);
                    }

                    goto LABEL_21;
                  }
                }
              }

              uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v43, (uint64_t)v51, 16);
              if (v24) {
                continue;
              }
              break;
            }
          }

- (id)denyListedReasonHistoryForNetwork:(id)a3 state:(unint64_t)a4 timestamps:(id)a5 reasonData:(id)a6
{
  uint64_t v96 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!objc_msgSend_isNetworkInDenyListedState_scanResult_(self, v13, a4, (uint64_t)v10, v14))
  {
    id v88 = 0LL;
    goto LABEL_40;
  }

  objc_msgSend__findNetworkDenyListItem_(self, v15, (uint64_t)v10, v16, v17);
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    id v88 = objc_alloc_init(MEMORY[0x189603FA8]);
    if (v88)
    {
      __int128 v91 = 0u;
      __int128 v92 = 0u;
      __int128 v89 = 0u;
      __int128 v90 = 0u;
      objc_msgSend_statesHistory(v18, v19, v20, v21, v22);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v89, (uint64_t)v93, 16);
      if (!v25) {
        goto LABEL_38;
      }
      uint64_t v30 = v25;
      uint64_t v85 = v18;
      id v86 = v10;
      uint64_t v31 = *(void *)v90;
      id obj = v23;
      while (1)
      {
        uint64_t v32 = 0LL;
        do
        {
          if (*(void *)v90 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = *(void **)(*((void *)&v89 + 1) + 8 * v32);
          uint64_t v34 = objc_msgSend_reason(v33, v26, v27, v28, v29, v83, v84);
          objc_msgSend_stateTimestamp(v33, v35, v36, v37, v38);
          double v40 = v39;
          uint64_t v45 = objc_msgSend_reasonData(v33, v41, v42, v43, v44);
          objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v46, v34, v47, v48);
          int v53 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v53)
          {
            CWFGetOSLog();
            uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
            if (v67)
            {
              CWFGetOSLog();
              uint64_t v68 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              uint64_t v68 = (os_log_s *)MEMORY[0x1895F8DA0];
              id v72 = MEMORY[0x1895F8DA0];
            }

            if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
            {
              int v94 = 136446210;
              uint64_t v95 = "-[CWFNetworkDenyList denyListedReasonHistoryForNetwork:state:timestamps:reasonData:]";
              LODWORD(v84) = 12;
              __int16 v83 = &v94;
              goto LABEL_30;
            }

- (id)reasonsForNetworkInDenyListedState:(id)a3 state:(unint64_t)a4 timestamps:(id)a5 reasonData:(id)a6
{
  uint64_t v97 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v89 = a5;
  id v11 = a6;
  if (!objc_msgSend_isNetworkInDenyListedState_scanResult_(self, v12, a4, (uint64_t)v10, v13))
  {
    uint64_t v23 = 0LL;
    goto LABEL_36;
  }

  objc_msgSend__findNetworkDenyListItem_(self, v14, (uint64_t)v10, v15, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    id v18 = objc_alloc_init(MEMORY[0x189603FA8]);
    if (v18)
    {
      uint64_t v23 = v18;
      __int128 v92 = 0u;
      __int128 v93 = 0u;
      __int128 v90 = 0u;
      __int128 v91 = 0u;
      objc_msgSend_denyListTriggers(v17, v19, v20, v21, v22);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v90, (uint64_t)v94, 16);
      if (!v26) {
        goto LABEL_34;
      }
      uint64_t v31 = v26;
      id v87 = v10;
      id obj = v24;
      id v86 = v17;
      uint64_t v32 = *(void *)v91;
      while (1)
      {
        uint64_t v33 = 0LL;
        do
        {
          if (*(void *)v91 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = *(void **)(*((void *)&v90 + 1) + 8 * v33);
          uint64_t v35 = objc_msgSend_reason(v34, v27, v28, v29, v30, v84, v85);
          objc_msgSend_reasonTimestamp(v34, v36, v37, v38, v39);
          double v41 = v40;
          uint64_t v46 = objc_msgSend_reasonData(v34, v42, v43, v44, v45);
          objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v47, v35, v48, v49);
          uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (v54)
          {
            uint64_t v55 = objc_msgSend_numberWithDouble_(MEMORY[0x189607968], v50, v51, v52, v53, v41);
            if (v55)
            {
              uint64_t v59 = (os_log_s *)v55;
              uint64_t v60 = objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v56, v46, v57, v58);
              if (v60)
              {
                uint64_t v64 = (void *)v60;
                objc_msgSend_addObject_(v23, v61, (uint64_t)v54, v62, v63);
                objc_msgSend_addObject_(v89, v65, (uint64_t)v59, v66, v67);
                objc_msgSend_addObject_(v11, v68, (uint64_t)v64, v69, v70);
              }

              else
              {
                CWFGetOSLog();
                id v73 = (void *)objc_claimAutoreleasedReturnValue();
                if (v73)
                {
                  CWFGetOSLog();
                  id v74 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                }

                else
                {
                  id v74 = (os_log_s *)MEMORY[0x1895F8DA0];
                  id v77 = MEMORY[0x1895F8DA0];
                }

                if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                {
                  int v95 = 136446210;
                  uint64_t v96 = "-[CWFNetworkDenyList reasonsForNetworkInDenyListedState:state:timestamps:reasonData:]";
                  LODWORD(v85) = 12;
                  uint64_t v84 = &v95;
                  _os_log_send_and_compose_impl();
                }
              }
            }

            else
            {
              CWFGetOSLog();
              id v72 = (void *)objc_claimAutoreleasedReturnValue();
              if (v72)
              {
                CWFGetOSLog();
                uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                uint64_t v59 = (os_log_s *)MEMORY[0x1895F8DA0];
                id v76 = MEMORY[0x1895F8DA0];
              }

              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                int v95 = 136446210;
                uint64_t v96 = "-[CWFNetworkDenyList reasonsForNetworkInDenyListedState:state:timestamps:reasonData:]";
                LODWORD(v85) = 12;
                uint64_t v84 = &v95;
                goto LABEL_27;
              }
            }
          }

          else
          {
            CWFGetOSLog();
            id v71 = (void *)objc_claimAutoreleasedReturnValue();
            if (v71)
            {
              CWFGetOSLog();
              uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              uint64_t v59 = (os_log_s *)MEMORY[0x1895F8DA0];
              id v75 = MEMORY[0x1895F8DA0];
            }

            if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            {
              int v95 = 136446210;
              uint64_t v96 = "-[CWFNetworkDenyList reasonsForNetworkInDenyListedState:state:timestamps:reasonData:]";
              LODWORD(v85) = 12;
              uint64_t v84 = &v95;
LABEL_27:
              _os_log_send_and_compose_impl();
            }
          }

          ++v33;
        }

        while (v31 != v33);
        uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v90, (uint64_t)v94, 16);
        uint64_t v31 = v78;
        if (!v78)
        {
          uint64_t v17 = v86;
          id v10 = v87;
          uint64_t v24 = obj;
          goto LABEL_34;
        }
      }
    }

    CWFGetOSLog();
    id v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (v81)
    {
      CWFGetOSLog();
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v24 = (void *)MEMORY[0x1895F8DA0];
      id v83 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    int v95 = 136446210;
    uint64_t v96 = "-[CWFNetworkDenyList reasonsForNetworkInDenyListedState:state:timestamps:reasonData:]";
    goto LABEL_47;
  }

  CWFGetOSLog();
  uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (v80)
  {
    CWFGetOSLog();
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v24 = (void *)MEMORY[0x1895F8DA0];
    id v82 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
  {
    int v95 = 136446210;
    uint64_t v96 = "-[CWFNetworkDenyList reasonsForNetworkInDenyListedState:state:timestamps:reasonData:]";
LABEL_47:
    _os_log_send_and_compose_impl();
  }

- (BOOL)isNetworkInDenyListedState:(unint64_t)a3 scanResult:(id)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v6;
  if (v6) {
    char hasDenyListState = objc_msgSend_hasDenyListState_(v6, v7, a3, v8, v9);
  }
  else {
    char hasDenyListState = 0;
  }

  return hasDenyListState;
}

- (BOOL)isNetworkTemporarilyDenyListedForAutoJoin:(id)a3
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v5 = self->_denyList;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v47, (uint64_t)v52, 16);
  if (v7)
  {
    uint64_t v12 = v7;
    uint64_t v13 = *(void *)v48;
    do
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v5);
        }
        uint64_t v15 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        objc_msgSend_scanResultForNetworkDenyListItem(v15, v8, v9, v10, v11);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_SSID(v16, v17, v18, v19, v20);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_SSID(v4, v22, v23, v24, v25);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        int isEqual = objc_msgSend_isEqual_(v21, v27, (uint64_t)v26, v28, v29);

        if (isEqual && objc_msgSend_hasDenyListState_(v15, v8, 1, v10, v11))
        {
          __int128 v45 = 0u;
          __int128 v46 = 0u;
          __int128 v43 = 0u;
          __int128 v44 = 0u;
          objc_msgSend_statesCurrent(v15, v8, v9, v10, v11, 0);
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v43, (uint64_t)v51, 16);
          if (v33)
          {
            uint64_t v38 = v33;
            uint64_t v39 = *(void *)v44;
            while (2)
            {
              for (uint64_t j = 0LL; j != v38; ++j)
              {
                if (*(void *)v44 != v39) {
                  objc_enumerationMutation(v31);
                }
                if (!objc_msgSend_reason(*(void **)(*((void *)&v43 + 1) + 8 * j), v34, v35, v36, v37))
                {

                  BOOL v41 = 1;
                  goto LABEL_22;
                }
              }

              uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v43, (uint64_t)v51, 16);
              if (v38) {
                continue;
              }
              break;
            }
          }
        }
      }

      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v47, (uint64_t)v52, 16);
      BOOL v41 = 0;
    }

    while (v12);
  }

  else
  {
    BOOL v41 = 0;
  }

- (int64_t)RSSIWhenNetworkWasDenyListed:(id)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v5;
  if (v5)
  {
    objc_msgSend_scanResultForNetworkDenyListItem(v5, v6, v7, v8, v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v16 = objc_msgSend_RSSI(v11, v12, v13, v14, v15);
  }

  else
  {
    int64_t v16 = 0LL;
  }

  return v16;
}

- (BOOL)isNetworkDenyListedForAutoJoinDueToTrigDisc:(id)a3 RSSI:(int64_t *)a4 timestamp:(double *)a5
{
  uint64_t v68 = *MEMORY[0x1895F89C0];
  id v57 = a3;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  uint64_t v8 = self->_denyList;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v62, (uint64_t)v67, 16);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v55 = a4;
    uint64_t v56 = a5;
    id v12 = 0LL;
    uint64_t v13 = *(void *)v63;
    do
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        uint64_t v15 = v12;
        if (*(void *)v63 != v13) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(id *)(*((void *)&v62 + 1) + 8 * i);

        if (objc_msgSend_hasDenyListState_(v12, v16, 1, v17, v18))
        {
          objc_msgSend_scanResultForNetworkDenyListItem(v12, v19, v20, v21, v22);
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_SSID(v23, v24, v25, v26, v27);
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_SSID(v57, v29, v30, v31, v32);
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
          int isEqual = objc_msgSend_isEqual_(v28, v34, (uint64_t)v33, v35, v36);

          if (isEqual)
          {
            __int128 v60 = 0u;
            __int128 v61 = 0u;
            __int128 v58 = 0u;
            __int128 v59 = 0u;
            objc_msgSend_statesCurrent(v12, v19, v38, v39, v40);
            BOOL v41 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v58, (uint64_t)v66, 16);
            if (v43)
            {
              uint64_t v48 = v43;
              uint64_t v49 = *(void *)v59;
              while (2)
              {
                for (uint64_t j = 0LL; j != v48; ++j)
                {
                  if (*(void *)v59 != v49) {
                    objc_enumerationMutation(v41);
                  }
                  uint64_t v51 = *(void **)(*((void *)&v58 + 1) + 8 * j);
                  if (objc_msgSend_reason(v51, v44, v45, v46, v47) == 6)
                  {
                    if (v55) {
                      *uint64_t v55 = (int)objc_msgSend_reasonData(v51, v44, v45, v46, v47);
                    }
                    if (v56)
                    {
                      objc_msgSend_stateTimestamp(v51, v44, v45, v46, v47);
                      *(void *)uint64_t v56 = v53;
                    }

                    BOOL v52 = 1;
                    goto LABEL_25;
                  }
                }

                uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_( v41,  v44,  (uint64_t)&v58,  (uint64_t)v66,  16);
                if (v48) {
                  continue;
                }
                break;
              }
            }
          }
        }
      }

      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v19, (uint64_t)&v62, (uint64_t)v67, 16);
    }

    while (v11);
    BOOL v52 = 0;
    BOOL v41 = v12;
    id v12 = 0LL;
LABEL_25:
  }

  else
  {
    id v12 = 0LL;
    BOOL v52 = 0;
  }

  return v52;
}

- (id)denyListedNetworkSSIDs:(unint64_t)a3
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  id v5 = objc_alloc_init(MEMORY[0x189607940]);
  if (v5)
  {
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    id obj = self->_denyList;
    uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v52, (uint64_t)v61, 16);
    if (v46)
    {
      id v7 = 0LL;
      uint64_t v45 = *(void *)v53;
      do
      {
        uint64_t v8 = 0LL;
        uint64_t v9 = v7;
        do
        {
          if (*(void *)v53 != v45) {
            objc_enumerationMutation(obj);
          }
          uint64_t v47 = v8;
          id v7 = *(id *)(*((void *)&v52 + 1) + 8 * v8);

          __int128 v50 = 0u;
          __int128 v51 = 0u;
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          objc_msgSend_statesCurrent(v7, v10, v11, v12, v13);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v48, (uint64_t)v60, 16);
          if (v16)
          {
            uint64_t v21 = v16;
            uint64_t v22 = *(void *)v49;
            do
            {
              for (uint64_t i = 0LL; i != v21; ++i)
              {
                if (*(void *)v49 != v22) {
                  objc_enumerationMutation(v14);
                }
                if (objc_msgSend_state(*(void **)(*((void *)&v48 + 1) + 8 * i), v17, v18, v19, v20) == a3)
                {
                  objc_msgSend_scanResultForNetworkDenyListItem(v7, v17, v18, v19, v20);
                  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_SSID(v24, v25, v26, v27, v28);
                  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

                  id v30 = objc_alloc(NSString);
                  uint64_t v33 = (void *)objc_msgSend_initWithData_encoding_(v30, v31, (uint64_t)v29, 4, v32);
                  objc_msgSend_appendFormat_(v5, v34, (uint64_t)@"%@ ", v35, v36, v33);
                }
              }

              uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v48, (uint64_t)v60, 16);
            }

            while (v21);
          }

          uint64_t v8 = v47 + 1;
          uint64_t v9 = v7;
        }

        while (v47 + 1 != v46);
        uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v52, (uint64_t)v61, 16);
      }

      while (v46);
    }

    CWFGetOSLog();
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      CWFGetOSLog();
      uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v39 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v40 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      int v56 = 136446466;
      id v57 = "-[CWFNetworkDenyList denyListedNetworkSSIDs:]";
      __int16 v58 = 2114;
      id v59 = v5;
LABEL_24:
      _os_log_send_and_compose_impl();
    }
  }

  else
  {
    CWFGetOSLog();
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      CWFGetOSLog();
      uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v39 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v43 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      int v56 = 136446210;
      id v57 = "-[CWFNetworkDenyList denyListedNetworkSSIDs:]";
      goto LABEL_24;
    }
  }

  return v5;
}

- (unint64_t)denyListedNetworkCount
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  uint64_t v2 = self->_denyList;
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v34, (uint64_t)v43, 16);
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0LL;
    unint64_t v7 = 0LL;
    uint64_t v8 = *(void *)v35;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        uint64_t v10 = v6;
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(id *)(*((void *)&v34 + 1) + 8 * i);

        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        objc_msgSend_statesCurrent(v6, v11, v12, v13, v14);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v30, (uint64_t)v42, 16);
        if (v17)
        {
          uint64_t v22 = v17;
          uint64_t v23 = *(void *)v31;
LABEL_8:
          uint64_t v24 = 0LL;
          while (1)
          {
            if (*(void *)v31 != v23) {
              objc_enumerationMutation(v15);
            }
            if (v22 == ++v24)
            {
              uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v30, (uint64_t)v42, 16);
              if (v22) {
                goto LABEL_8;
              }
              break;
            }
          }
        }
      }

      v7 += v5;
      uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v25, (uint64_t)&v34, (uint64_t)v43, 16);
    }

    while (v5);
  }

  else
  {
    unint64_t v7 = 0LL;
  }

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
    id v28 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    int v38 = 136446466;
    uint64_t v39 = "-[CWFNetworkDenyList denyListedNetworkCount]";
    __int16 v40 = 2048;
    unint64_t v41 = v7;
    _os_log_send_and_compose_impl();
  }

  return v7;
}

- (void)_printDenyList
{
  uint64_t v230 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (void *)MEMORY[0x186E3AE7C](self, a2);
  if (objc_msgSend_count(self->_denyList, v4, v5, v6, v7))
  {
    CWFGetOSLog();
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      CWFGetOSLog();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v9 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v10 = MEMORY[0x1895F8DA0];
    }

    uint64_t v192 = v3;

    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446210;
      double v224 = "-[CWFNetworkDenyList _printDenyList]";
      LODWORD(v191) = 12;
      uint64_t v190 = buf;
      _os_log_send_and_compose_impl();
    }

    id v203 = objc_alloc_init(MEMORY[0x189607848]);
    objc_msgSend_setDateFormat_(v203, v11, (uint64_t)@"MM/dd/yy HH:mm:ss.SSS", v12, v13);
    __int128 v218 = 0u;
    __int128 v219 = 0u;
    __int128 v216 = 0u;
    __int128 v217 = 0u;
    id obj = self->_denyList;
    uint64_t v195 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v216, (uint64_t)v229, 16);
    if (v195)
    {
      uint64_t v194 = *(void *)v217;
      do
      {
        uint64_t v15 = 0LL;
        do
        {
          if (*(void *)v217 != v194) {
            objc_enumerationMutation(obj);
          }
          uint64_t v198 = v15;
          uint64_t v16 = *(void **)(*((void *)&v216 + 1) + 8 * v15);
          id v17 = objc_alloc(NSString);
          objc_msgSend_scanResultForNetworkDenyListItem(v16, v18, v19, v20, v21);
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_SSID(v22, v23, v24, v25, v26);
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v30 = objc_msgSend_initWithData_encoding_(v17, v28, (uint64_t)v27, 4, v29);

          objc_msgSend_scanResultForNetworkDenyListItem(v16, v31, v32, v33, v34);
          __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_BSSID(v35, v36, v37, v38, v39);
          __int16 v40 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v45 = objc_msgSend_copy(v40, v41, v42, v43, v44);

          objc_msgSend_statesCurrent(v16, v46, v47, v48, v49);
          __int128 v50 = (void *)objc_claimAutoreleasedReturnValue();
          int v55 = objc_msgSend_count(v50, v51, v52, v53, v54);

          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            id v59 = "YES";
            if (!v55) {
              id v59 = "NO";
            }
            double v224 = (const char *)v30;
            __int16 v225 = 2112;
            uint64_t v226 = v45;
            __int16 v227 = 2080;
            uint64_t v228 = v59;
            _os_log_impl( &dword_18644D000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Network '%@' BSSID %@ isDenyListed:%s ",  buf,  0x20u);
          }

          v196 = (void *)v45;
          uint64_t v197 = (void *)v30;
          objc_msgSend_stringWithString_( MEMORY[0x189607940],  v56,  (uint64_t)@" DenyListHistory: ",  v57,  v58,  v190,  v191);
          id v202 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v212 = 0u;
          __int128 v213 = 0u;
          __int128 v214 = 0u;
          __int128 v215 = 0u;
          id v199 = v16;
          objc_msgSend_statesHistory(v16, v60, v61, v62, v63);
          __int128 v64 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v65, (uint64_t)&v212, (uint64_t)v222, 16);
          if (v66)
          {
            uint64_t v71 = v66;
            uint64_t v72 = 0LL;
            uint64_t v73 = *(void *)v213;
            do
            {
              for (uint64_t i = 0LL; i != v71; ++i)
              {
                if (*(void *)v213 != v73) {
                  objc_enumerationMutation(v64);
                }
                id v75 = *(void **)(*((void *)&v212 + 1) + 8 * i);
                objc_msgSend_stateString(v75, v67, v68, v69, v70);
                id v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stateTimestamp(v75, v77, v78, v79, v80);
                id v81 = (void *)NSString;
                objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x189603F50], v82, v83, v84, v85);
                id v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stringFromDate_(v203, v87, (uint64_t)v86, v88, v89);
                __int128 v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stringWithFormat_(v81, v91, (uint64_t)@"[%d] %@ @ %@, ", v92, v93, v72 + i, v76, v90);
                int v94 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_appendString_(v202, v95, (uint64_t)v94, v96, v97);
              }

              uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_( v64,  v67,  (uint64_t)&v212,  (uint64_t)v222,  16);
              uint64_t v72 = (v72 + i);
            }

            while (v71);
          }

          CWFGetOSLog();
          uint64_t v98 = (void *)objc_claimAutoreleasedReturnValue();
          if (v98)
          {
            CWFGetOSLog();
            uint64_t v99 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            uint64_t v99 = (os_log_s *)MEMORY[0x1895F8DA0];
            id v100 = MEMORY[0x1895F8DA0];
          }

          if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            double v224 = (const char *)v202;
            LODWORD(v191) = 12;
            uint64_t v190 = buf;
            _os_log_send_and_compose_impl();
          }

          objc_msgSend_stringWithString_(MEMORY[0x189607940], v101, (uint64_t)@" States: ", v102, v103);
          v201 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v208 = 0u;
          __int128 v209 = 0u;
          __int128 v210 = 0u;
          __int128 v211 = 0u;
          objc_msgSend_statesCurrent(v199, v104, v105, v106, v107);
          uint64_t v108 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v110 = objc_msgSend_countByEnumeratingWithState_objects_count_( v108,  v109,  (uint64_t)&v208,  (uint64_t)v221,  16);
          if (v110)
          {
            uint64_t v115 = v110;
            uint64_t v116 = 0LL;
            uint64_t v117 = *(void *)v209;
            do
            {
              for (uint64_t j = 0LL; j != v115; ++j)
              {
                if (*(void *)v209 != v117) {
                  objc_enumerationMutation(v108);
                }
                uint64_t v119 = *(void **)(*((void *)&v208 + 1) + 8 * j);
                objc_msgSend_stateString(v119, v111, v112, v113, v114, v190, v191);
                uint64_t v120 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stateTimestamp(v119, v121, v122, v123, v124);
                id v125 = (void *)NSString;
                objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x189603F50], v126, v127, v128, v129);
                uint64_t v130 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stringFromDate_(v203, v131, (uint64_t)v130, v132, v133);
                __int128 v134 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stringWithFormat_( v125,  v135,  (uint64_t)@"[%d] %@ @ %@, ",  v136,  v137,  v116 + j,  v120,  v134);
                __int128 v138 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_appendString_(v201, v139, (uint64_t)v138, v140, v141);
              }

              uint64_t v115 = objc_msgSend_countByEnumeratingWithState_objects_count_( v108,  v111,  (uint64_t)&v208,  (uint64_t)v221,  16);
              uint64_t v116 = (v116 + j);
            }

            while (v115);
          }

          CWFGetOSLog();
          __int128 v142 = (void *)objc_claimAutoreleasedReturnValue();
          if (v142)
          {
            CWFGetOSLog();
            __int128 v143 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            __int128 v143 = (os_log_s *)MEMORY[0x1895F8DA0];
            id v144 = MEMORY[0x1895F8DA0];
          }

          if (os_log_type_enabled(v143, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            double v224 = (const char *)v201;
            LODWORD(v191) = 12;
            uint64_t v190 = buf;
            _os_log_send_and_compose_impl();
          }

          objc_msgSend_stringWithString_(MEMORY[0x189607940], v145, (uint64_t)@" Triggers: ", v146, v147);
          int v148 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v204 = 0u;
          __int128 v205 = 0u;
          __int128 v206 = 0u;
          __int128 v207 = 0u;
          objc_msgSend_denyListTriggers(v199, v149, v150, v151, v152);
          id v200 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v154 = objc_msgSend_countByEnumeratingWithState_objects_count_( v200,  v153,  (uint64_t)&v204,  (uint64_t)v220,  16);
          if (v154)
          {
            uint64_t v159 = v154;
            uint64_t v160 = 0LL;
            uint64_t v161 = *(void *)v205;
            do
            {
              for (uint64_t k = 0LL; k != v159; ++k)
              {
                if (*(void *)v205 != v161) {
                  objc_enumerationMutation(v200);
                }
                double v163 = *(void **)(*((void *)&v204 + 1) + 8 * k);
                objc_msgSend_reasonString(v163, v155, v156, v157, v158, v190, v191);
                double v164 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_reasonTimestamp(v163, v165, v166, v167, v168);
                uint64_t v169 = (void *)NSString;
                objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x189603F50], v170, v171, v172, v173);
                uint64_t v174 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stringFromDate_(v203, v175, (uint64_t)v174, v176, v177);
                uint64_t v178 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stringWithFormat_( v169,  v179,  (uint64_t)@"[%d] %@ @ %@, ",  v180,  v181,  v160 + k,  v164,  v178);
                uint64_t v182 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_appendString_(v148, v183, (uint64_t)v182, v184, v185);
              }

              uint64_t v159 = objc_msgSend_countByEnumeratingWithState_objects_count_( v200,  v155,  (uint64_t)&v204,  (uint64_t)v220,  16);
              uint64_t v160 = (v160 + k);
            }

            while (v159);
          }

          CWFGetOSLog();
          uint64_t v186 = (void *)objc_claimAutoreleasedReturnValue();
          if (v186)
          {
            CWFGetOSLog();
            uint64_t v187 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            uint64_t v187 = (os_log_s *)MEMORY[0x1895F8DA0];
            id v188 = MEMORY[0x1895F8DA0];
          }

          if (os_log_type_enabled(v187, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            double v224 = (const char *)v148;
            LODWORD(v191) = 12;
            uint64_t v190 = buf;
            _os_log_send_and_compose_impl();
          }

          uint64_t v15 = v198 + 1;
        }

        while (v198 + 1 != v195);
        uint64_t v195 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v189, (uint64_t)&v216, (uint64_t)v229, 16);
      }

      while (v195);
    }

    uint64_t v3 = v192;
  }

  objc_autoreleasePoolPop(v3);
}

- (id)denyList
{
  return self->_denyList;
}

- (id)batteryInfoHandler
{
  return objc_getProperty(self, a2, 32LL, 1);
}

- (void)setBatteryInfoHandler:(id)a3
{
}

- (id)isUserModeInteractiveHandler
{
  return objc_getProperty(self, a2, 40LL, 1);
}

- (void)setIsUserModeInteractiveHandler:(id)a3
{
}

- (id)denyListDidUpdateHandler
{
  return objc_getProperty(self, a2, 48LL, 1);
}

- (void)setDenyListDidUpdateHandler:(id)a3
{
}

- (NSArray)SSIDThresholds
{
  return (NSArray *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setSSIDThresholds:(id)a3
{
}

- (NSArray)BSSIDThresholds
{
  return (NSArray *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setBSSIDThresholds:(id)a3
{
}

- (double)wowDenyListExpiry
{
  return self->_wowDenyListExpiry;
}

- (void)setWowDenyListExpiry:(double)a3
{
  self->_wowDenyListExpiry = a3;
}

- (double)networkDenyListExpiry
{
  return self->_networkDenyListExpiry;
}

- (void)setNetworkDenyListExpiry:(double)a3
{
  self->_networkDenyListExpiry = a3;
}

- (double)BSSDenyListExpiry
{
  return self->_BSSDenyListExpiry;
}

- (void)setBSSDenyListExpiry:(double)a3
{
  self->_BSSDenyListExpiry = a3;
}

- (void).cxx_destruct
{
}

@end