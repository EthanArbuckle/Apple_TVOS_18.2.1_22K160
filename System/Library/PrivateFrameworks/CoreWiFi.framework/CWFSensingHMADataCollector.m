@interface CWFSensingHMADataCollector
+ (id)createCWFSensingHMADataCollectorFor:(id)a3 withOptions:(id)a4 andDelegate:(id)a5;
- (CWFSensingHMADataCollector)initWithAccessory:(id)a3 andOptions:(id)a4 andDelegate:(id)a5;
- (CWFSensingHMADataCollectorDelegate)_delegate;
- (HMAccessory)_accessory;
- (NSDictionary)_sensingParams;
- (NSError)_serviceRegistrationError;
- (OS_dispatch_queue)_serviceQueue;
- (id)currentRoomIdentifier;
- (id)getSensingParams;
- (int64_t)_attempt;
- (void)accessory:(id)a3 service:(id)a4 didUpdateValueForCharacteristic:(id)a5;
- (void)deregisterForPrimaryServiceNotificationWith:(id)a3;
- (void)handleSensingResult:(id)a3;
- (void)registerForPrimaryServiceNotificationWith:(id)a3;
- (void)set_accessory:(id)a3;
- (void)set_attempt:(int64_t)a3;
- (void)set_delegate:(id)a3;
- (void)set_sensingParams:(id)a3;
- (void)set_serviceQueue:(id)a3;
- (void)set_serviceRegistrationError:(id)a3;
@end

@implementation CWFSensingHMADataCollector

+ (id)createCWFSensingHMADataCollectorFor:(id)a3 withOptions:(id)a4 andDelegate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    CWFGetOSLog();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      CWFGetOSLog();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v15 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v17 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
LABEL_13:
    _os_log_send_and_compose_impl();
LABEL_14:

    v12 = 0LL;
    goto LABEL_3;
  }

  v10 = objc_alloc(&OBJC_CLASS___CWFSensingHMADataCollector);
  v12 = (void *)objc_msgSend_initWithAccessory_andOptions_andDelegate_(v10, v11, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9);
  if (!v12)
  {
    CWFGetOSLog();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      CWFGetOSLog();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v15 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v18 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

- (CWFSensingHMADataCollector)initWithAccessory:(id)a3 andOptions:(id)a4 andDelegate:(id)a5
{
  uint64_t v73 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v66.receiver = self;
  v66.super_class = (Class)&OBJC_CLASS___CWFSensingHMADataCollector;
  v11 = -[CWFSensingHMADataCollector init](&v66, sel_init);
  v15 = v11;
  if (!v11) {
    goto LABEL_9;
  }
  objc_msgSend_set_accessory_(v11, v12, (uint64_t)v8, v13, v14);
  objc_msgSend__accessory(v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {

    CWFGetOSLog();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      CWFGetOSLog();
      v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v60 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v63 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    int v67 = 136446722;
    v68 = "-[CWFSensingHMADataCollector initWithAccessory:andOptions:andDelegate:]";
    __int16 v69 = 2082;
    v70 = "CWFSensingHMADataCollector.m";
    __int16 v71 = 1024;
    int v72 = 88;
    goto LABEL_25;
  }

  dispatch_queue_t v21 = dispatch_queue_create("com.apple.wifi.CWFSensingHMADataCollector", 0LL);
  objc_msgSend_set_serviceQueue_(v15, v22, (uint64_t)v21, v23, v24);

  objc_msgSend__serviceQueue(v15, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {

    CWFGetOSLog();
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (v61)
    {
      CWFGetOSLog();
      v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v60 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v64 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    int v67 = 136446722;
    v68 = "-[CWFSensingHMADataCollector initWithAccessory:andOptions:andDelegate:]";
    __int16 v69 = 2082;
    v70 = "CWFSensingHMADataCollector.m";
    __int16 v71 = 1024;
    int v72 = 94;
    goto LABEL_25;
  }

  objc_msgSend_defaultCenter(MEMORY[0x189607958], v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_( v34,  v35,  (uint64_t)v15,  (uint64_t)sel_handleSensingResult_,  (uint64_t)@"SensingResult",  0);

  objc_msgSend_set_delegate_(v15, v36, (uint64_t)v10, v37, v38);
  objc_msgSend__delegate(v15, v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v43)
  {

    CWFGetOSLog();
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
    {
      CWFGetOSLog();
      v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v60 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v65 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    int v67 = 136446722;
    v68 = "-[CWFSensingHMADataCollector initWithAccessory:andOptions:andDelegate:]";
    __int16 v69 = 2082;
    v70 = "CWFSensingHMADataCollector.m";
    __int16 v71 = 1024;
    int v72 = 103;
LABEL_25:
    _os_log_send_and_compose_impl();
LABEL_26:

    v15 = 0LL;
    goto LABEL_9;
  }

  if (v9)
  {
    objc_msgSend_set_sensingParams_(v15, v44, (uint64_t)v9, v46, v47);
  }

  else
  {
    objc_msgSend_getSensingParams(v15, v44, v45, v46, v47);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_set_sensingParams_(v15, v52, (uint64_t)v51, v53, v54);
  }

  objc_msgSend_set_serviceRegistrationError_(v15, v48, 0, v49, v50);
  objc_msgSend_set_attempt_(v15, v55, 0, v56, v57);
LABEL_9:

  return v15;
}

- (id)currentRoomIdentifier
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_room(v5, v6, v7, v8, v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uniqueIdentifier(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)getSensingParams
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___CWFSensingParameters);
  objc_msgSend_setSubmitMetric_(v2, v3, 1, v4, v5);
  objc_msgSend_setScheduleDailyAt_(v2, v6, -2, v7, v8);
  objc_msgSend_setScheduleOnceAfter_(v2, v9, 0, v10, v11);
  objc_msgSend_dictionary(MEMORY[0x189603FC8], v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = (void *)MEMORY[0x189607968];
  uint64_t v22 = objc_msgSend_numberOfReports(v2, v18, v19, v20, v21);
  objc_msgSend_numberWithInteger_(v17, v23, v22, v24, v25);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v16,  v27,  (uint64_t)v26,  (uint64_t)@"SENSING_PARAMS_NUMBER_OF_REPORTS",  v28);

  v29 = (void *)MEMORY[0x189607968];
  uint64_t matched = objc_msgSend_matchFrameType(v2, v30, v31, v32, v33);
  objc_msgSend_numberWithInt_(v29, v35, matched, v36, v37);
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v16,  v39,  (uint64_t)v38,  (uint64_t)@"SENSING_PARAMS_MATCH_FRAME_TYPE",  v40);

  objc_msgSend_matchMACAddresses(v2, v41, v42, v43, v44);
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v16,  v46,  (uint64_t)v45,  (uint64_t)@"SENSING_PARAMS_MATCH_MAC_ADDRESS",  v47);

  v48 = (void *)MEMORY[0x189607968];
  uint64_t v53 = objc_msgSend_timeout(v2, v49, v50, v51, v52);
  objc_msgSend_numberWithInteger_(v48, v54, v53, v55, v56);
  uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v16, v58, (uint64_t)v57, (uint64_t)@"SENSING_PARAMS_TIMEOUT", v59);

  v60 = (void *)MEMORY[0x189607968];
  uint64_t v65 = objc_msgSend_submitMetric(v2, v61, v62, v63, v64);
  objc_msgSend_numberWithBool_(v60, v66, v65, v67, v68);
  __int16 v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v16, v70, (uint64_t)v69, (uint64_t)@"SENSING_PARAMS_SUBMIT_METRIC", v71);

  int v72 = (void *)MEMORY[0x189607968];
  uint64_t v77 = objc_msgSend_scheduleDailyAt(v2, v73, v74, v75, v76);
  objc_msgSend_numberWithInteger_(v72, v78, v77, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v16,  v82,  (uint64_t)v81,  (uint64_t)@"SENSING_PARAMS_SCHEDULE_DAILY_AT",  v83);

  objc_msgSend_placeLabels(v2, v84, v85, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v16, v89, (uint64_t)v88, (uint64_t)@"SENSING_PARAMS_PLACE_LABELS", v90);

  v91 = (void *)MEMORY[0x189607968];
  uint64_t v96 = objc_msgSend_scheduleOnceAfter(v2, v92, v93, v94, v95);
  objc_msgSend_numberWithInteger_(v91, v97, v96, v98, v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v16,  v101,  (uint64_t)v100,  (uint64_t)@"SENSING_PARAMS_SCHEDULE_ONCE_AFTER",  v102);

  return v16;
}

- (void)registerForPrimaryServiceNotificationWith:(id)a3
{
  uint64_t v93 = *MEMORY[0x1895F89C0];
  id v66 = a3;
  uint64_t v71 = self;
  objc_msgSend__accessory(self, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDelegate_(v8, v9, (uint64_t)self, v10, v11);

  uint64_t v83 = 0LL;
  v84 = &v83;
  uint64_t v85 = 0x3032000000LL;
  uint64_t v86 = sub_1864E35B4;
  uint64_t v87 = sub_1864E35C4;
  dispatch_group_t v88 = dispatch_group_create();
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  objc_msgSend__accessory(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_services(v16, v17, v18, v19, v20);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v79, (uint64_t)v92, 16);
  if (v69)
  {
    uint64_t v68 = *(void *)v80;
    do
    {
      for (uint64_t i = 0LL; i != v69; ++i)
      {
        if (*(void *)v80 != v68) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        if (objc_msgSend_isPrimaryService(v26, v22, v23, v24, v25, v64, v65))
        {
          __int128 v77 = 0u;
          __int128 v78 = 0u;
          __int128 v75 = 0u;
          __int128 v76 = 0u;
          objc_msgSend_characteristics(v26, v22, v23, v24, v25);
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v75, (uint64_t)v91, 16);
          if (v33)
          {
            uint64_t v34 = *(void *)v76;
            do
            {
              for (uint64_t j = 0LL; j != v33; ++j)
              {
                if (*(void *)v76 != v34) {
                  objc_enumerationMutation(v27);
                }
                uint64_t v36 = *(void **)(*((void *)&v75 + 1) + 8 * j);
                objc_msgSend_properties(v36, v29, v30, v31, v32, v64, v65);
                uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
                off_18C4A4220();
                uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend_containsObject_(v37, v39, (uint64_t)v38, v40, v41))
                {
                  objc_msgSend_properties(v36, v42, v43, v44, v45);
                  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
                  off_18C4A4228();
                  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
                  int v51 = objc_msgSend_containsObject_(v46, v48, (uint64_t)v47, v49, v50);

                  if (v51)
                  {
                    CWFGetOSLog();
                    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v52)
                    {
                      CWFGetOSLog();
                      uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    }

                    else
                    {
                      uint64_t v53 = (os_log_s *)MEMORY[0x1895F8DA0];
                      id v54 = MEMORY[0x1895F8DA0];
                    }

                    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                    {
                      int v89 = 138543362;
                      uint64_t v90 = v36;
                      LODWORD(v65) = 12;
                      uint64_t v64 = &v89;
                      _os_log_send_and_compose_impl();
                    }

                    dispatch_group_enter((dispatch_group_t)v84[5]);
                    v74[0] = MEMORY[0x1895F87A8];
                    v74[1] = 3221225472LL;
                    v74[2] = sub_1864E35CC;
                    v74[3] = &unk_189E5D548;
                    v74[4] = v71;
                    v74[5] = v36;
                    v74[6] = &v83;
                    objc_msgSend_enableNotification_completionHandler_(v36, v55, 1, (uint64_t)v74, v56);
                  }
                }

                else
                {
                }
              }

              uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v29, (uint64_t)&v75, (uint64_t)v91, 16);
            }

            while (v33);
          }
        }
      }

      uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v79, (uint64_t)v92, 16);
    }

    while (v69);
  }

  uint64_t v57 = (dispatch_group_s *)v84[5];
  objc_msgSend__serviceQueue(v71, v58, v59, v60, v61);
  uint64_t v62 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864E3708;
  block[3] = &unk_189E5C4C8;
  block[4] = v71;
  id v73 = v66;
  id v63 = v66;
  dispatch_group_notify(v57, v62, block);

  _Block_object_dispose(&v83, 8);
}

- (void)deregisterForPrimaryServiceNotificationWith:(id)a3
{
  uint64_t v78 = *MEMORY[0x1895F89C0];
  id v53 = a3;
  uint64_t v70 = 0LL;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x3032000000LL;
  id v73 = sub_1864E35B4;
  uint64_t v74 = sub_1864E35C4;
  dispatch_group_t v75 = dispatch_group_create();
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  v58 = self;
  objc_msgSend__accessory(self, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_services(v8, v9, v10, v11, v12);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v66, (uint64_t)v77, 16);
  if (v56)
  {
    uint64_t v55 = *(void *)v67;
    do
    {
      for (uint64_t i = 0LL; i != v56; ++i)
      {
        if (*(void *)v67 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        if (objc_msgSend_isPrimaryService(v18, v14, v15, v16, v17))
        {
          __int128 v64 = 0u;
          __int128 v65 = 0u;
          __int128 v62 = 0u;
          __int128 v63 = 0u;
          objc_msgSend_characteristics(v18, v14, v15, v16, v17);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v62, (uint64_t)v76, 16);
          if (v25)
          {
            uint64_t v26 = *(void *)v63;
            do
            {
              for (uint64_t j = 0LL; j != v25; ++j)
              {
                if (*(void *)v63 != v26) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v28 = *(void **)(*((void *)&v62 + 1) + 8 * j);
                objc_msgSend_properties(v28, v21, v22, v23, v24);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                off_18C4A4220();
                uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend_containsObject_(v29, v31, (uint64_t)v30, v32, v33))
                {
                  objc_msgSend_properties(v28, v34, v35, v36, v37);
                  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
                  off_18C4A4228();
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  int v43 = objc_msgSend_containsObject_(v38, v40, (uint64_t)v39, v41, v42);

                  if (v43)
                  {
                    dispatch_group_enter((dispatch_group_t)v71[5]);
                    v61[0] = MEMORY[0x1895F87A8];
                    v61[1] = 3221225472LL;
                    v61[2] = sub_1864E3C58;
                    v61[3] = &unk_189E5D548;
                    v61[4] = v58;
                    v61[5] = v28;
                    v61[6] = &v70;
                    objc_msgSend_enableNotification_completionHandler_(v28, v44, 0, (uint64_t)v61, v45);
                  }
                }

                else
                {
                }
              }

              uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v21, (uint64_t)&v62, (uint64_t)v76, 16);
            }

            while (v25);
          }
        }
      }

      uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v66, (uint64_t)v77, 16);
    }

    while (v56);
  }

  uint64_t v46 = (dispatch_group_s *)v71[5];
  objc_msgSend__serviceQueue(v58, v47, v48, v49, v50);
  int v51 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864E3D94;
  block[3] = &unk_189E5C4C8;
  block[4] = v58;
  id v60 = v53;
  id v52 = v53;
  dispatch_group_notify(v46, v51, block);

  _Block_object_dispose(&v70, 8);
}

- (void)handleSensingResult:(id)a3
{
  id v4 = a3;
  objc_msgSend_userInfo(v4, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)@"CWF_ACCESSORY_UUID", v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__accessory(self, v14, v15, v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uniqueIdentifier(v18, v19, v20, v21, v22);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  int isEqual = objc_msgSend_isEqual_(v13, v24, (uint64_t)v23, v25, v26);

  if (isEqual)
  {
    CWFGetOSLog();
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      CWFGetOSLog();
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v29 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v30 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_userInfo(v4, v31, v32, v33, v34);
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v35, v36, (uint64_t)@"WiFiInterfaceReturn", v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_userInfo(v4, v40, v41, v42, v43);
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v44, v45, (uint64_t)@"SensingResult", v46, v47);
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();
    }
  }
}

- (void)accessory:(id)a3 service:(id)a4 didUpdateValueForCharacteristic:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = v10;
  if (v8 && v9 && v10)
  {
    objc_msgSend__serviceQueue(self, v11, v12, v13, v14);
    uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = sub_1864E40A0;
    v17[3] = &unk_189E5D0C0;
    id v18 = v9;
    id v19 = v15;
    uint64_t v20 = self;
    id v21 = v8;
    dispatch_async(v16, v17);
  }
}

- (NSDictionary)_sensingParams
{
  return self->__sensingParams;
}

- (void)set_sensingParams:(id)a3
{
}

- (HMAccessory)_accessory
{
  return self->__accessory;
}

- (void)set_accessory:(id)a3
{
}

- (NSError)_serviceRegistrationError
{
  return self->__serviceRegistrationError;
}

- (void)set_serviceRegistrationError:(id)a3
{
}

- (OS_dispatch_queue)_serviceQueue
{
  return self->__serviceQueue;
}

- (void)set_serviceQueue:(id)a3
{
}

- (CWFSensingHMADataCollectorDelegate)_delegate
{
  return self->__delegate;
}

- (void)set_delegate:(id)a3
{
}

- (int64_t)_attempt
{
  return self->__attempt;
}

- (void)set_attempt:(int64_t)a3
{
  self->__attempt = a3;
}

- (void).cxx_destruct
{
}

@end