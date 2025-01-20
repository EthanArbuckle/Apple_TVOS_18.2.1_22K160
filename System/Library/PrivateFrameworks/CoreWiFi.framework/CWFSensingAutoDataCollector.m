@interface CWFSensingAutoDataCollector
+ (id)sharedCWFSensingAutoDataCollectorInstanceWith:(id)a3;
- (BOOL)currentAccessoryInfo:(id)a3;
- (CWFSensingAutoDataCollector)initWithHomes:(id)a3;
- (HMAccessory)_currentAccessory;
- (NSMutableDictionary)_serviceObjects;
- (OS_dispatch_queue)_serviceQueue;
- (void)cleanUpOutOfScopeAccessory;
- (void)registerForAccessoriesInRoomWithDelegate:(id)a3;
- (void)set_currentAccessory:(id)a3;
- (void)set_serviceObjects:(id)a3;
- (void)set_serviceQueue:(id)a3;
- (void)updateRegisteredServiceWithDelegate:(id)a3;
@end

@implementation CWFSensingAutoDataCollector

+ (id)sharedCWFSensingAutoDataCollectorInstanceWith:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186467828;
  block[3] = &unk_189E5BC10;
  id v11 = v3;
  uint64_t v4 = qword_18C4A4278;
  id v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }

  else
  {
    dispatch_once(&qword_18C4A4278, block);
    v7 = v11;
  }

  id v8 = (id)qword_18C4A4270;

  return v8;
}

- (CWFSensingAutoDataCollector)initWithHomes:(id)a3
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___CWFSensingAutoDataCollector;
  id v5 = -[CWFSensingAutoDataCollector init](&v25, sel_init);
  v9 = v5;
  if (v5)
  {
    if (objc_msgSend_currentAccessoryInfo_(v5, v6, (uint64_t)v4, v7, v8))
    {
      dispatch_queue_t v10 = dispatch_queue_create("com.apple.wifi.CWFSensingAutoDataCollector", 0LL);
      objc_msgSend_set_serviceQueue_(v9, v11, (uint64_t)v10, v12, v13);

      objc_msgSend_dictionary(MEMORY[0x189603FC8], v14, v15, v16, v17);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_set_serviceObjects_(v9, v19, (uint64_t)v18, v20, v21);
    }

    else
    {

      CWFGetOSLog();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        CWFGetOSLog();
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v18 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v24 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v26 = 136446722;
        v27 = "-[CWFSensingAutoDataCollector initWithHomes:]";
        __int16 v28 = 2082;
        v29 = "CWFSensingAutoDataCollector.m";
        __int16 v30 = 1024;
        int v31 = 90;
        _os_log_send_and_compose_impl();
      }

      v9 = 0LL;
    }
  }

  return v9;
}

- (BOOL)currentAccessoryInfo:(id)a3
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  obuint64_t j = a3;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v32, (uint64_t)v37, 16);
  if (v5)
  {
    uint64_t v10 = v5;
    char v11 = 0;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        objc_msgSend_accessories(v14, v6, v7, v8, v9);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v28, (uint64_t)v36, 16);
        if (v17)
        {
          uint64_t v22 = v17;
          uint64_t v23 = *(void *)v29;
          while (2)
          {
            for (uint64_t j = 0LL; j != v22; ++j)
            {
              if (*(void *)v29 != v23) {
                objc_enumerationMutation(v15);
              }
              objc_super v25 = *(void **)(*((void *)&v28 + 1) + 8 * j);
              if (objc_msgSend_isCurrentAccessory(v25, v18, v19, v20, v21))
              {
                objc_msgSend_set_currentAccessory_(self, v18, (uint64_t)v25, v20, v21);
                char v11 = 1;
                goto LABEL_16;
              }
            }

            uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v28, (uint64_t)v36, 16);
            if (v22) {
              continue;
            }
            break;
          }
        }

- (void)cleanUpOutOfScopeAccessory
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  objc_msgSend__serviceObjects(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v8)
  {
    uint64_t v13 = v8;
    uint64_t v14 = *(void *)v21;
    uint64_t v15 = MEMORY[0x1895F87A8];
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v6);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * v16);
        objc_msgSend__serviceQueue(self, v9, v10, v11, v12);
        v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        v19[0] = v15;
        v19[1] = 3221225472LL;
        v19[2] = sub_186467D08;
        v19[3] = &unk_189E5BF78;
        v19[4] = self;
        v19[5] = v17;
        dispatch_async(v18, v19);

        ++v16;
      }

      while (v13 != v16);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v20, (uint64_t)v24, 16);
    }

    while (v13);
  }
}

- (void)registerForAccessoriesInRoomWithDelegate:(id)a3
{
  uint64_t v107 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend__currentAccessory(self, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_room(v9, v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v94 = 0u;
  __int128 v95 = 0u;
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  v87 = v14;
  objc_msgSend_accessories(v14, v15, v16, v17, v18);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v92, (uint64_t)v106, 16);
  if (!v21) {
    goto LABEL_19;
  }
  uint64_t v26 = v21;
  uint64_t v27 = *(void *)v93;
  while (2)
  {
    for (uint64_t i = 0LL; i != v26; ++i)
    {
      if (*(void *)v93 != v27) {
        objc_enumerationMutation(v19);
      }
      __int128 v29 = *(void **)(*((void *)&v92 + 1) + 8 * i);
      objc_msgSend__serviceObjects(self, v22, v23, v24, v25, v85, v86);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_uniqueIdentifier(v29, v31, v32, v33, v34);
      __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v30, v36, (uint64_t)v35, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
      }

      else
      {
        char isCurrentAccessory = objc_msgSend_isCurrentAccessory(v29, v40, v41, v42, v43);

        if ((isCurrentAccessory & 1) != 0) {
          continue;
        }
        uint64_t v45 = objc_msgSend_createCWFSensingHMADataCollectorFor_withOptions_andDelegate_( CWFSensingHMADataCollector,  v22,  (uint64_t)v29,  0,  (uint64_t)v4);
        if (!v45)
        {
          CWFGetOSLog();
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          if (v77)
          {
            CWFGetOSLog();
            v78 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            v78 = (os_log_s *)MEMORY[0x1895F8DA0];
            id v79 = MEMORY[0x1895F8DA0];
          }

          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend_uniqueIdentifier(v29, v80, v81, v82, v83);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            int v96 = 136446978;
            v97 = "-[CWFSensingAutoDataCollector registerForAccessoriesInRoomWithDelegate:]";
            __int16 v98 = 2082;
            v99 = "CWFSensingAutoDataCollector.m";
            __int16 v100 = 1024;
            int v101 = 137;
            __int16 v102 = 2114;
            v103 = v84;
            _os_log_send_and_compose_impl();
          }

          goto LABEL_19;
        }

        v50 = (void *)v45;
        objc_msgSend__serviceQueue(self, v46, v47, v48, v49);
        v51 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = sub_1864682FC;
        block[3] = &unk_189E5BEB8;
        id v30 = v50;
        id v89 = v30;
        v90 = v29;
        v91 = self;
        dispatch_async(v51, block);

        objc_msgSend__serviceObjects(self, v52, v53, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_uniqueIdentifier(v29, v57, v58, v59, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v56, v62, (uint64_t)v30, (uint64_t)v61, v63);

        CWFGetOSLog();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        if (v64)
        {
          CWFGetOSLog();
          v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          v65 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v66 = MEMORY[0x1895F8DA0];
        }

        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_uniqueIdentifier(v29, v67, v68, v69, v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__serviceObjects(self, v72, v73, v74, v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          int v96 = 136447234;
          v97 = "-[CWFSensingAutoDataCollector registerForAccessoriesInRoomWithDelegate:]";
          __int16 v98 = 2082;
          v99 = "CWFSensingAutoDataCollector.m";
          __int16 v100 = 1024;
          int v101 = 150;
          __int16 v102 = 2114;
          v103 = v71;
          __int16 v104 = 2114;
          v105 = v76;
          LODWORD(v86) = 48;
          v85 = &v96;
          _os_log_send_and_compose_impl();
        }

        __int128 v35 = v89;
      }
    }

    uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v92, (uint64_t)v106, 16);
    if (v26) {
      continue;
    }
    break;
  }

- (void)updateRegisteredServiceWithDelegate:(id)a3
{
}

- (NSMutableDictionary)_serviceObjects
{
  return self->__serviceObjects;
}

- (void)set_serviceObjects:(id)a3
{
}

- (OS_dispatch_queue)_serviceQueue
{
  return self->__serviceQueue;
}

- (void)set_serviceQueue:(id)a3
{
}

- (HMAccessory)_currentAccessory
{
  return self->__currentAccessory;
}

- (void)set_currentAccessory:(id)a3
{
}

- (void).cxx_destruct
{
}

@end