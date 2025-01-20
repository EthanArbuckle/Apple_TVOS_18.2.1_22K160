@interface CWFNetworkDenyListItem
- (BOOL)containsNetwork:(id)a3;
- (BOOL)enterprisePolicy;
- (BOOL)hasDenyListState:(unint64_t)a3;
- (BOOL)isEqualToDenyListScanResult:(id)a3;
- (BOOL)updateNetwork:(id)a3;
- (CWFNetworkDenyListItem)initWithDenyListNetwork:(id)a3;
- (CWFScanResult)scanResultForNetworkDenyListItem;
- (NSMutableArray)denyListTriggers;
- (NSMutableArray)statesCurrent;
- (NSMutableArray)statesHistory;
- (id)_copyCreateDenyListState:(unint64_t)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5;
- (void)addDenyListState:(unint64_t)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5;
- (void)addDenyListStateHistory:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5 reasonData:(int64_t)a6;
- (void)addDenyListTrigger:(unint64_t)a3 reasonData:(int64_t)a4 BSSID:(id)a5;
- (void)dealloc;
- (void)processDenyListStateMetric:(id)a3 denyListRemove:(BOOL)a4 denyListRemoveReason:(unint64_t)a5;
- (void)processDenyListedBSSForMetrics;
- (void)setDenyListTriggers:(id)a3;
- (void)setEnterprisePolicy:(BOOL)a3;
- (void)setScanResultForNetworkDenyListItem:(id)a3;
- (void)setStatesCurrent:(id)a3;
- (void)setStatesHistory:(id)a3;
@end

@implementation CWFNetworkDenyListItem

- (CWFNetworkDenyListItem)initWithDenyListNetwork:(id)a3
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___CWFNetworkDenyListItem;
  v5 = -[CWFNetworkDenyListItem init](&v47, sel_init);
  if (!v5)
  {
    CWFGetOSLog();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      CWFGetOSLog();
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v37 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v42 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    int v48 = 136446210;
    v49 = "-[CWFNetworkDenyListItem initWithDenyListNetwork:]";
    goto LABEL_33;
  }

  if (!v4)
  {
    CWFGetOSLog();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      CWFGetOSLog();
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v37 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v43 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    int v48 = 136446210;
    v49 = "-[CWFNetworkDenyListItem initWithDenyListNetwork:]";
    goto LABEL_33;
  }

  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  denyListTriggers = v5->_denyListTriggers;
  v5->_denyListTriggers = v6;

  if (!v5->_denyListTriggers)
  {
    CWFGetOSLog();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      CWFGetOSLog();
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v37 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v44 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    int v48 = 136446210;
    v49 = "-[CWFNetworkDenyListItem initWithDenyListNetwork:]";
    goto LABEL_33;
  }

  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  statesCurrent = v5->_statesCurrent;
  v5->_statesCurrent = v8;

  if (!v5->_statesCurrent)
  {
    CWFGetOSLog();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      CWFGetOSLog();
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v37 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v45 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    int v48 = 136446210;
    v49 = "-[CWFNetworkDenyListItem initWithDenyListNetwork:]";
    goto LABEL_33;
  }

  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  statesHistory = v5->_statesHistory;
  v5->_statesHistory = v10;

  if (!v5->_statesHistory)
  {
    CWFGetOSLog();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      CWFGetOSLog();
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v37 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v46 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    int v48 = 136446210;
    v49 = "-[CWFNetworkDenyListItem initWithDenyListNetwork:]";
LABEL_33:
    _os_log_send_and_compose_impl();
LABEL_34:

    v34 = 0LL;
    goto LABEL_7;
  }

  char isEAP = objc_msgSend_isEAP(v4, v12, v13, v14, v15);
  objc_msgSend_matchingKnownNetworkProfile(v4, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  char isProfileBased = objc_msgSend_isProfileBased(v21, v22, v23, v24, v25);

  v5->_enterprisePolicy = isEAP & isProfileBased;
  v30 = (void *)objc_msgSend_copyWithZone_(v4, v27, 0, v28, v29);
  objc_msgSend_setScanResultForNetworkDenyListItem_(v5, v31, (uint64_t)v30, v32, v33);

  v34 = v5;
LABEL_7:

  return v34;
}

- (void)dealloc
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CWFNetworkDenyListItem;
  -[CWFNetworkDenyListItem dealloc](&v14, sel_dealloc);
}

- (void)addDenyListTrigger:(unint64_t)a3 reasonData:(int64_t)a4 BSSID:(id)a5
{
  id v8 = a5;
  objc_msgSend_denyListTriggers(self, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v18 = objc_msgSend_count(v13, v14, v15, v16, v17);

  if (v18 >= 0x10)
  {
    objc_msgSend_denyListTriggers(self, v19, v20, v21, v22);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectAtIndex_(v23, v24, 0, v25, v26);
  }

  v27 = objc_alloc_init(&OBJC_CLASS___CWFNetworkDenyListInfo);
  if (v27)
  {
    CWFStringFromDenyListAddReason(a3);
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setReason_(v27, v29, a3, v30, v31);
    objc_msgSend_setReasonData_(v27, v32, a4, v33, v34);
    if (v28) {
      objc_msgSend_setReasonString_(v27, v35, (uint64_t)v28, v37, v38);
    }
    objc_msgSend_date(MEMORY[0x189603F50], v35, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSince1970(v39, v40, v41, v42, v43);
    objc_msgSend_setReasonTimestamp_(v27, v44, v45, v46, v47);

    if (v8) {
      objc_msgSend_setBSSID_(v27, v48, (uint64_t)v8, v50, v51);
    }
    objc_msgSend_denyListTriggers(self, v48, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v52, v53, (uint64_t)v27, v54, v55);
  }

  else
  {
    CWFGetOSLog();
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      CWFGetOSLog();
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v28 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v57 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      _os_log_send_and_compose_impl();
    }
  }
}

- (BOOL)containsNetwork:(id)a3
{
  if (a3) {
    return ((uint64_t (*)(CWFNetworkDenyListItem *, char *, id))MEMORY[0x189616718])( self,  sel_isEqualToDenyListScanResult_,  a3);
  }
  else {
    return 0;
  }
}

- (BOOL)hasDenyListState:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  objc_msgSend_statesCurrent(self, a2, a3, v3, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v8)
  {
    uint64_t v13 = v8;
    uint64_t v14 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0LL; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend_state(*(void **)(*((void *)&v18 + 1) + 8 * i), v9, v10, v11, v12) == a3)
        {
          BOOL v16 = 1;
          goto LABEL_11;
        }
      }

      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v18, (uint64_t)v22, 16);
      if (v13) {
        continue;
      }
      break;
    }
  }

  BOOL v16 = 0;
LABEL_11:

  return v16;
}

- (BOOL)updateNetwork:(id)a3
{
  v6 = (CWFScanResult *)objc_msgSend_copyWithZone_(a3, a2, 0, v3, v4);
  scanResultForNetworkDenyListItem = self->_scanResultForNetworkDenyListItem;
  self->_scanResultForNetworkDenyListItem = v6;

  return 1;
}

- (id)_copyCreateDenyListState:(unint64_t)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5
{
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___CWFNetworkDenyListInfo);
  if (v8)
  {
    CWFStringFromDenyListState(a3);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    CWFStringFromDenyListAddReason(a4);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setState_(v8, v11, a3, v12, v13);
    objc_msgSend_setStateString_(v8, v14, (uint64_t)v9, v15, v16);
    objc_msgSend_date(MEMORY[0x189603F50], v17, v18, v19, v20);
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSince1970(v21, v22, v23, v24, v25);
    objc_msgSend_setStateTimestamp_(v8, v26, v27, v28, v29);

    objc_msgSend_setReason_(v8, v30, a4, v31, v32);
    objc_msgSend_setReasonData_(v8, v33, a5, v34, v35);
    objc_msgSend_setReasonString_(v8, v36, (uint64_t)v10, v37, v38);
  }

  else
  {
    CWFGetOSLog();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      CWFGetOSLog();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v9 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v41 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      _os_log_send_and_compose_impl();
    }
  }

  return v8;
}

- (void)addDenyListState:(unint64_t)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5
{
  uint64_t v101 = *MEMORY[0x1895F89C0];
  DenyListState_reason_reasonData = (void *)objc_msgSend__copyCreateDenyListState_reason_reasonData_( self,  a2,  a3,  a4,  a5);
  if (!DenyListState_reason_reasonData)
  {
    CWFGetOSLog();
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (v82)
    {
      CWFGetOSLog();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v18 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v83 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v91 = 136446210;
      v92 = "-[CWFNetworkDenyListItem addDenyListState:reason:reasonData:]";
      _os_log_send_and_compose_impl();
    }

    goto LABEL_31;
  }

  objc_msgSend_scanResultForNetworkDenyListItem(self, v8, v9, v10, v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_SSID(v13, v14, v15, v16, v17);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_scanResultForNetworkDenyListItem(self, v19, v20, v21, v22);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_BSSID(v23, v24, v25, v26, v27);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_statesCurrent(self, v29, v30, v31, v32);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v38 = objc_msgSend_count(v33, v34, v35, v36, v37);

  if (v38)
  {
    __int128 v88 = 0u;
    __int128 v89 = 0u;
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    objc_msgSend_statesCurrent(self, v39, v40, v41, v42);
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v86, (uint64_t)v90, 16);
    if (v45)
    {
      uint64_t v46 = v45;
      v84 = v28;
      v85 = v18;
      id v47 = 0LL;
      uint64_t v48 = *(void *)v87;
      while (2)
      {
        uint64_t v49 = 0LL;
        uint64_t v50 = v47;
        do
        {
          if (*(void *)v87 != v48) {
            objc_enumerationMutation(v43);
          }
          id v47 = *(id *)(*((void *)&v86 + 1) + 8 * v49);

          uint64_t v55 = objc_msgSend_state(v47, v51, v52, v53, v54);
          if (v55 == objc_msgSend_state(DenyListState_reason_reasonData, v56, v57, v58, v59))
          {

            CWFGetOSLog();
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            if (v63)
            {
              CWFGetOSLog();
              v64 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              v64 = (os_log_s *)MEMORY[0x1895F8DA0];
              id v66 = MEMORY[0x1895F8DA0];
            }

            uint64_t v28 = v84;
            uint64_t v18 = v85;

            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            {
              CWFStringFromDenyListState(a3);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              CWFStringFromDenyListAddReason(a4);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              int v91 = 138544386;
              v92 = (const char *)v85;
              __int16 v93 = 2114;
              v94 = v84;
              __int16 v95 = 2114;
              v96 = v67;
              __int16 v97 = 2114;
              v98 = v68;
              __int16 v99 = 2048;
              unint64_t v100 = a4;
              _os_log_send_and_compose_impl();
            }

            goto LABEL_30;
          }

          ++v49;
          uint64_t v50 = v47;
        }

        while (v46 != v49);
        uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v60, (uint64_t)&v86, (uint64_t)v90, 16);
        if (v46) {
          continue;
        }
        break;
      }

      uint64_t v28 = v84;
      uint64_t v18 = v85;
    }

    CWFGetOSLog();
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (v61)
    {
      CWFGetOSLog();
      v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v62 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v72 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    CWFStringFromDenyListState(a3);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    CWFStringFromDenyListAddReason(a4);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    int v91 = 138544386;
    v92 = (const char *)v18;
    __int16 v93 = 2114;
    v94 = v28;
    __int16 v95 = 2114;
    v96 = v70;
    __int16 v97 = 2114;
    v98 = v71;
    __int16 v99 = 2048;
    unint64_t v100 = a4;
    goto LABEL_28;
  }

  CWFGetOSLog();
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    CWFGetOSLog();
    v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v62 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v69 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
  {
    CWFStringFromDenyListState(a3);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    CWFStringFromDenyListAddReason(a4);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    int v91 = 138544386;
    v92 = (const char *)v18;
    __int16 v93 = 2114;
    v94 = v28;
    __int16 v95 = 2114;
    v96 = v70;
    __int16 v97 = 2114;
    v98 = v71;
    __int16 v99 = 2048;
    unint64_t v100 = a4;
LABEL_28:
    _os_log_send_and_compose_impl();
  }

- (void)addDenyListStateHistory:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5 reasonData:(int64_t)a6
{
  id v10 = a3;
  uint64_t v12 = v10;
  if (v10)
  {
    DenyListState_reason_reasonData = (os_log_s *)v10;
LABEL_4:
    id v14 = objc_alloc(NSString);
    objc_msgSend_scanResultForNetworkDenyListItem(self, v15, v16, v17, v18);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_SSID(v19, v20, v21, v22, v23);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = (void *)objc_msgSend_initWithData_encoding_(v14, v25, (uint64_t)v24, 4, v26);

    objc_msgSend_statesHistory(self, v28, v29, v30, v31);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v37 = objc_msgSend_count(v32, v33, v34, v35, v36);

    if (v37 >= 5)
    {
      objc_msgSend_statesHistory(self, v38, v39, v40, v41);
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObjectAtIndex_(v42, v43, 0, v44, v45);
    }

    CWFGetOSLog();
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      CWFGetOSLog();
      id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v47 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v48 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      CWFStringFromDenyListState(a4);
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
      CWFStringFromDenyListAddReason(a5);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_statesHistory(self, v50, v51, v52, v53);
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v54, v55, (uint64_t)DenyListState_reason_reasonData, v56, v57);

    goto LABEL_12;
  }

  DenyListState_reason_reasonData = (os_log_s *)objc_msgSend__copyCreateDenyListState_reason_reasonData_( self,  v11,  a4,  a5,  a6);
  if (DenyListState_reason_reasonData) {
    goto LABEL_4;
  }
  CWFGetOSLog();
  uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    CWFGetOSLog();
    DenyListState_reason_reasonData = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    DenyListState_reason_reasonData = (os_log_s *)MEMORY[0x1895F8DA0];
    id v59 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(DenyListState_reason_reasonData, OS_LOG_TYPE_ERROR)) {
    _os_log_send_and_compose_impl();
  }
LABEL_12:
}

- (void)processDenyListedBSSForMetrics
{
  uint64_t v89 = *MEMORY[0x1895F89C0];
  if (self->_denyListMetrics)
  {
    objc_msgSend_scanResultForNetworkDenyListItem(self, a2, v2, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_BSSID(v6, v7, v8, v9, v10);
    uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue();

    id v11 = objc_alloc(NSString);
    objc_msgSend_scanResultForNetworkDenyListItem(self, v12, v13, v14, v15);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_SSID(v16, v17, v18, v19, v20);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = (void *)objc_msgSend_initWithData_encoding_(v11, v22, (uint64_t)v21, 4, v23);

    __int128 v80 = 0u;
    __int128 v81 = 0u;
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    uint64_t v25 = self->_denyListMetrics;
    uint64_t v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v78, (uint64_t)v88, 16);
    if (!v77)
    {

      goto LABEL_19;
    }

    char v75 = 0;
    uint64_t v27 = @"ssid";
    uint64_t v28 = *(void *)v79;
    uint64_t v29 = @"prunedCount";
    while (1)
    {
      for (uint64_t i = 0LL; i != v77; ++i)
      {
        if (*(void *)v79 != v28) {
          objc_enumerationMutation(v25);
        }
        id v31 = *(id *)(*((void *)&v78 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v31, v32, (uint64_t)v27, v33, v34);
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToString_(v35, v36, (uint64_t)v24, v37, v38))
        {
          objc_msgSend_objectForKeyedSubscript_(v31, v39, (uint64_t)@"bssid", v40, v41);
          uint64_t v42 = v24;
          uint64_t v43 = v27;
          uint64_t v44 = v25;
          uint64_t v45 = v29;
          uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
          int isEqualToString = objc_msgSend_isEqualToString_(v46, v47, (uint64_t)v76, v48, v49);

          uint64_t v29 = v45;
          uint64_t v25 = v44;
          uint64_t v27 = v43;
          uint64_t v24 = v42;

          if (!isEqualToString) {
            goto LABEL_14;
          }
          objc_msgSend_objectForKey_(v31, v51, (uint64_t)v29, v52, v53);
          uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();

          if (v54)
          {
            objc_msgSend_objectForKeyedSubscript_(v31, v55, (uint64_t)v29, v56, v57);
            uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v63 = objc_msgSend_unsignedIntegerValue(v58, v59, v60, v61, v62);

            objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v64, v63 + 1, v65, v66);
          }

          else
          {
            objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v55, 1, v56, v57);
          }

          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v31, v67, (uint64_t)v35, (uint64_t)v29, v68);
          char v75 = 1;
        }

LABEL_14:
      }

      uint64_t v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v69, (uint64_t)&v78, (uint64_t)v88, 16);
      if (!v77)
      {

        if ((v75 & 1) == 0)
        {
LABEL_19:
          CWFGetOSLog();
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          if (v70)
          {
            CWFGetOSLog();
            v71 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            v71 = (os_log_s *)MEMORY[0x1895F8DA0];
            id v72 = MEMORY[0x1895F8DA0];
          }

          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          {
            int v82 = 136446722;
            id v83 = "-[CWFNetworkDenyListItem processDenyListedBSSForMetrics]";
            __int16 v84 = 2114;
            v85 = v24;
            __int16 v86 = 2114;
            __int128 v87 = v76;
            _os_log_send_and_compose_impl();
          }

          goto LABEL_24;
        }

        goto LABEL_25;
      }
    }
  }

  CWFGetOSLog();
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    CWFGetOSLog();
    v71 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v71 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v74 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
  {
    int v82 = 136446210;
    id v83 = "-[CWFNetworkDenyListItem processDenyListedBSSForMetrics]";
    _os_log_send_and_compose_impl();
  }

  uint64_t v24 = 0LL;
  uint64_t v76 = 0LL;
LABEL_24:

LABEL_25:
}

- (void)processDenyListStateMetric:(id)a3 denyListRemove:(BOOL)a4 denyListRemoveReason:(unint64_t)a5
{
  BOOL v5 = a4;
  uint64_t v303 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  if (!v11)
  {
    CWFGetOSLog();
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    if (v272)
    {
      CWFGetOSLog();
      uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v33 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v280 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    int v291 = 136446210;
    v292 = "-[CWFNetworkDenyListItem processDenyListStateMetric:denyListRemove:denyListRemoveReason:]";
LABEL_63:
    _os_log_send_and_compose_impl();
    goto LABEL_38;
  }

  if (!self->_denyListMetrics)
  {
    uint64_t v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    denyListMetrics = self->_denyListMetrics;
    self->_denyListMetrics = v12;

    if (!self->_denyListMetrics)
    {
      CWFGetOSLog();
      v277 = (void *)objc_claimAutoreleasedReturnValue();
      if (v277)
      {
        CWFGetOSLog();
        uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v33 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v283 = MEMORY[0x1895F8DA0];
      }

      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        goto LABEL_38;
      }
      int v291 = 136446210;
      v292 = "-[CWFNetworkDenyListItem processDenyListStateMetric:denyListRemove:denyListRemoveReason:]";
      goto LABEL_63;
    }
  }

  objc_msgSend_scanResultForNetworkDenyListItem(self, v7, v8, v9, v10);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_BSSID(v14, v15, v16, v17, v18);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  id v20 = objc_alloc(NSString);
  objc_msgSend_scanResultForNetworkDenyListItem(self, v21, v22, v23, v24);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_SSID(v25, v26, v27, v28, v29);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v33 = (os_log_s *)objc_msgSend_initWithData_encoding_(v20, v31, (uint64_t)v30, 4, v32);

  if (v19)
  {
    if (!v33)
    {
      CWFGetOSLog();
      v275 = (void *)objc_claimAutoreleasedReturnValue();
      if (v275)
      {
        CWFGetOSLog();
        v276 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v276 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v282 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v276, OS_LOG_TYPE_ERROR))
      {
        int v291 = 136446210;
        v292 = "-[CWFNetworkDenyListItem processDenyListStateMetric:denyListRemove:denyListRemoveReason:]";
        _os_log_send_and_compose_impl();
      }

LABEL_29:
      uint64_t v33 = v19;
      goto LABEL_38;
    }

    id v289 = v11;
    if (v5)
    {
      objc_msgSend_indexSet(MEMORY[0x189607938], v34, v35, v36, v37);
      v287 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_count(self->_denyListMetrics, v38, v39, v40, v41))
      {
        for (unint64_t i = 0; i < objc_msgSend_count(self->_denyListMetrics, v152, v153, v154, v155); ++i)
        {
          objc_msgSend_objectAtIndex_(self->_denyListMetrics, v42, i, v44, v45, v285, v286);
          id v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v47, v48, (uint64_t)@"state", v49, v50);
          uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v56 = objc_msgSend_unsignedIntegerValue(v51, v52, v53, v54, v55);
          uint64_t v61 = objc_msgSend_state(v11, v57, v58, v59, v60);

          if (v56 == v61)
          {
            objc_msgSend_objectForKeyedSubscript_(v47, v62, (uint64_t)@"ssid", v63, v64);
            uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend_isEqualToString_(v65, v66, (uint64_t)v33, v67, v68) & 1) == 0)
            {

LABEL_15:
              CWFGetOSLog();
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              if (v125)
              {
                CWFGetOSLog();
                v126 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                v126 = (os_log_s *)MEMORY[0x1895F8DA0];
                id v127 = MEMORY[0x1895F8DA0];
              }

              if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend_objectForKeyedSubscript_(v47, v128, (uint64_t)@"ssid", v129, v130);
                v131 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v47, v132, (uint64_t)@"bssid", v133, v134);
                v135 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                int v291 = 136447234;
                v292 = "-[CWFNetworkDenyListItem processDenyListStateMetric:denyListRemove:denyListRemoveReason:]";
                __int16 v293 = 2114;
                v294 = v131;
                __int16 v295 = 2114;
                v296 = v135;
                __int16 v297 = 2114;
                v298 = v33;
                __int16 v299 = 2114;
                v300 = v19;
                LODWORD(v286) = 52;
                v285 = &v291;
                _os_log_send_and_compose_impl();

                id v11 = v289;
              }

              goto LABEL_25;
            }

            objc_msgSend_objectForKeyedSubscript_(v47, v69, (uint64_t)@"bssid", v70, v71);
            id v72 = (void *)objc_claimAutoreleasedReturnValue();
            int isEqualToString = objc_msgSend_isEqualToString_(v72, v73, (uint64_t)v19, v74, v75);

            if (!isEqualToString) {
              goto LABEL_15;
            }
            objc_msgSend_date(MEMORY[0x189603F50], v77, v78, v79, v80);
            __int128 v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_timeIntervalSince1970(v81, v82, v83, v84, v85);
            double v87 = v86;

            __int128 v88 = (void *)MEMORY[0x189607968];
            objc_msgSend_objectForKeyedSubscript_(v47, v89, (uint64_t)@"denyListTimestamp", v90, v91);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_doubleValue(v92, v93, v94, v95, v96);
            objc_msgSend_numberWithDouble_(v88, v98, v99, v100, v101, v87 - v97);
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_( v47,  v103,  (uint64_t)v102,  (uint64_t)@"denyListedDuration",  v104);

            objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v105, a5, v106, v107);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_( v47,  v109,  (uint64_t)v108,  (uint64_t)@"denyListRemoveReason",  v110);

            objc_msgSend_removeObjectForKey_(v47, v111, (uint64_t)@"ssid", v112, v113);
            objc_msgSend_removeObjectForKey_(v47, v114, (uint64_t)@"bssid", v115, v116);
            objc_msgSend_removeObjectForKey_(v47, v117, (uint64_t)@"state", v118, v119);
            objc_msgSend_removeObjectForKey_(v47, v120, (uint64_t)@"denyListTimestamp", v121, v122);
            CWFGetOSLog();
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            if (v123)
            {
              CWFGetOSLog();
              v124 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              v124 = (os_log_s *)MEMORY[0x1895F8DA0];
              id v136 = MEMORY[0x1895F8DA0];
            }

            if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend_objectForKeyedSubscript_(v47, v137, (uint64_t)@"denyListedDuration", v138, v139);
              v140 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v47, v141, (uint64_t)@"denyListRemoveReason", v142, v143);
              v144 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v47, v145, (uint64_t)@"prunedCount", v146, v147);
              v148 = (void *)objc_claimAutoreleasedReturnValue();
              int v291 = 136447490;
              v292 = "-[CWFNetworkDenyListItem processDenyListStateMetric:denyListRemove:denyListRemoveReason:]";
              __int16 v293 = 2114;
              v294 = v33;
              __int16 v295 = 2114;
              v296 = v19;
              __int16 v297 = 2114;
              v298 = v140;
              __int16 v299 = 2114;
              v300 = v144;
              __int16 v301 = 2114;
              id v302 = v148;
              LODWORD(v286) = 62;
              v285 = &v291;
              _os_log_send_and_compose_impl();

              id v11 = v289;
            }

            objc_msgSend_addIndex_(v287, v149, i, v150, v151);
          }

- (BOOL)isEqualToDenyListScanResult:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_SSID(self->_scanResultForNetworkDenyListItem, v5, v6, v7, v8);
  if (v9)
  {
    uint64_t v14 = (void *)v9;
    uint64_t v15 = objc_msgSend_SSID(v4, v10, v11, v12, v13);
    if (!v15)
    {
      char isEqual = 0;
LABEL_12:

      goto LABEL_13;
    }

    id v20 = (void *)v15;
    objc_msgSend_SSID(self->_scanResultForNetworkDenyListItem, v16, v17, v18, v19);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_SSID(v4, v22, v23, v24, v25);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v21, v27, (uint64_t)v26, v28, v29))
    {
      char isEqual = 0;
LABEL_11:

      goto LABEL_12;
    }

    uint64_t v34 = objc_msgSend_supportedSecurityTypes(self->_scanResultForNetworkDenyListItem, v30, v31, v32, v33);
    uint64_t v39 = objc_msgSend_supportedSecurityTypes(v4, v35, v36, v37, v38) & v34;

    if (v39)
    {
      uint64_t v44 = objc_msgSend_BSSID(v4, v40, v41, v42, v43);
      if (!v44)
      {
        char isEqual = 1;
        goto LABEL_13;
      }

      uint64_t v14 = (void *)v44;
      uint64_t v49 = objc_msgSend_BSSID(self->_scanResultForNetworkDenyListItem, v45, v46, v47, v48);
      if (!v49)
      {
        char isEqual = 1;
        goto LABEL_12;
      }

      id v20 = (void *)v49;
      objc_msgSend_BSSID(v4, v50, v51, v52, v53);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_BSSID(self->_scanResultForNetworkDenyListItem, v54, v55, v56, v57);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      char isEqual = objc_msgSend_isEqual_(v21, v58, (uint64_t)v26, v59, v60);
      goto LABEL_11;
    }
  }

  char isEqual = 0;
LABEL_13:

  return isEqual;
}

- (CWFScanResult)scanResultForNetworkDenyListItem
{
  return (CWFScanResult *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setScanResultForNetworkDenyListItem:(id)a3
{
}

- (NSMutableArray)denyListTriggers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setDenyListTriggers:(id)a3
{
}

- (NSMutableArray)statesCurrent
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setStatesCurrent:(id)a3
{
}

- (NSMutableArray)statesHistory
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setStatesHistory:(id)a3
{
}

- (BOOL)enterprisePolicy
{
  return self->_enterprisePolicy;
}

- (void)setEnterprisePolicy:(BOOL)a3
{
  self->_enterprisePolicy = a3;
}

- (void).cxx_destruct
{
}

@end