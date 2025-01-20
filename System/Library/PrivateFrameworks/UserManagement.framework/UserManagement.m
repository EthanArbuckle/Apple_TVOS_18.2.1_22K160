id sub_185F3644C()
{
  uint64_t v0;
  void block[5];
  v0 = objc_opt_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_185F364C4;
  block[3] = &unk_189DD45B8;
  block[4] = v0;
  if (qword_18C682B00 != -1) {
    dispatch_once(&qword_18C682B00, block);
  }
  return (id)qword_18C682AF8;
}

void sub_185F364C4()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)qword_18C682AF8;
  qword_18C682AF8 = v0;

  dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
  v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v2 = dispatch_queue_create("UMQueueClient", v3);
  sub_185F3653C(qword_18C682AF8, v2);
}

void sub_185F3653C(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

id sub_185F3654C()
{
  uint64_t v0 = objc_opt_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_185F365C4;
  block[3] = &unk_189DD45B8;
  block[4] = v0;
  if (qword_18C49E1F8 != -1) {
    dispatch_once(&qword_18C49E1F8, block);
  }
  return (id)qword_18C49E200;
}

void sub_185F365C4()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)qword_18C49E200;
  qword_18C49E200 = v0;

  dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
  v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v2 = dispatch_queue_create("UMQueueServer", v3);
  sub_185F3653C(qword_18C49E200, v2);
}

id sub_185F3663C()
{
  uint64_t v0 = objc_opt_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_185F366B4;
  block[3] = &unk_189DD45B8;
  block[4] = v0;
  if (qword_18C682B10 != -1) {
    dispatch_once(&qword_18C682B10, block);
  }
  return (id)qword_18C682B08;
}

void sub_185F366B4()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)qword_18C682B08;
  qword_18C682B08 = v0;

  dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
  v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v2 = dispatch_queue_create("UMQueueUserList", v3);
  sub_185F3653C(qword_18C682B08, v2);
}

void sub_185F3672C(uint64_t a1, void *a2, void *a3)
{
  if (a1) {
    sub_185F3673C(a1, a2, a3, 0);
  }
}

void sub_185F3673C(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7 = a3;
  if (a1)
  {
    objc_initWeak(&location, a2);
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = sub_185F3682C;
    v10[3] = &unk_189DD45E0;
    objc_copyWeak(&v12, &location);
    v10[4] = a1;
    id v11 = v7;
    v8 = (void *)MEMORY[0x186E2FEC4](v10);
    v9 = *(dispatch_queue_s **)(a1 + 8);
    if (a4) {
      dispatch_sync(v9, v8);
    }
    else {
      dispatch_async(v9, v8);
    }

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void sub_185F3681C(uint64_t a1, void *a2, void *a3)
{
  if (a1) {
    sub_185F3673C(a1, a2, a3, 1);
  }
}

void sub_185F3682C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    uint64_t v2 = sub_185F43818();
    v9 = (void *)v2;
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      uint64_t v10 = *(void *)(v10 + 8);
    }
    sub_185F43A40(v2, @"Object was released before block was called in queue: %@", v3, v4, v5, v6, v7, v8, v10);
  }
}

uint64_t sub_185F368B0(uint64_t result)
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

id *sub_185F368C8(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = a2;
  objc_opt_self();
  v15 = sub_185F36974((id *)objc_alloc(&OBJC_CLASS___UMGenerationCache), v14, v13, v12, v11, v10);

  return v15;
}

id *sub_185F36974(id *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)&OBJC_CLASS___UMGenerationCache;
    v17 = (id *)objc_msgSendSuper2(&v21, sel_init);
    a1 = v17;
    if (v17)
    {
      objc_storeStrong(v17 + 5, a5);
      objc_storeStrong(a1 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      a1[4] = v14;
      uint64_t v18 = MEMORY[0x186E2FEC4](v16);
      id v19 = a1[6];
      a1[6] = (id)v18;

      a1[7] = 0LL;
      a1[1] = (id)0xFFFFFFFF00000000LL;
    }
  }

  return a1;
}

uint64_t sub_185F36A7C(uint64_t a1, void *a2)
{
  if (!a1) {
    return 0LL;
  }
  if (a2) {
    *a2 = 0LL;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  uint64_t v4 = *(void *)(a1 + 56);
  if (!v4)
  {
    sub_185F36FC0(a1, a2);
    uint64_t v4 = *(void *)(a1 + 56);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  return v4;
}

uint64_t sub_185F36AFC(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (*(_DWORD *)(a1 + 12) != -1) {
      goto LABEL_4;
    }
    id v2 = *(id *)(a1 + 40);
    objc_msgSend_libNotify(v2, v3, v4, v5);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = *(id *)(a1 + 24);
    *(_DWORD *)(a1 + 12) = objc_msgSend_registerCheck_(v6, v8, (uint64_t)v7, v9);

    if (*(_DWORD *)(a1 + 12) != -1)
    {
LABEL_4:
      id v10 = *(id *)(a1 + 40);
      objc_msgSend_libNotify(v10, v11, v12, v13);
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = *(unsigned int *)(a1 + 12);
      id v25 = 0LL;
      uint64_t HasPostedForToken_error = objc_msgSend_notificationHasPostedForToken_error_(v14, v16, v15, (uint64_t)&v25);
      id v18 = v25;

      if ((HasPostedForToken_error & 1) == 0)
      {
        if (v18)
        {
          id v19 = (os_log_s *)*(id *)(a1 + 32);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            int v20 = sub_185F385E4();
            if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
              v20 &= ~1u;
            }
            if (v20)
            {
              uint64_t v21 = *(void *)(a1 + 16);
              int v26 = 138543362;
              uint64_t v27 = v21;
              v22 = v19;
              v23 = (void *)_os_log_send_and_compose_impl();

              if (v23) {
                sub_185F385EC();
              }
            }

            else
            {
              v23 = 0LL;
            }

            free(v23);
          }

          *(void *)(a1 + 56) = 0LL;
          goto LABEL_18;
        }

        if (!*(void *)(a1 + 56)) {
LABEL_18:
        }
          uint64_t HasPostedForToken_error = 1LL;
      }

      return HasPostedForToken_error;
    }
  }

  return 0LL;
}

void sub_185F36CE8(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v2 = *(id *)(a1 + 40);
    objc_msgSend_libNotify(v2, v3, v4, v5);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = *(unsigned int *)(a1 + 12);
    id v21 = 0LL;
    uint64_t v9 = objc_msgSend_stateForToken_error_(v6, v8, v7, (uint64_t)&v21);
    id v10 = v21;
    *(void *)(a1 + 56) = v9;

    if (*(void *)(a1 + 56))
    {
      if (qword_18C682AC0 != -1) {
        dispatch_once(&qword_18C682AC0, &unk_189DD4630);
      }
      id v11 = (os_log_s *)(id)qword_18C682AA8;
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_25;
      }
      int v12 = sub_185F385E4();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        v12 &= ~1u;
      }
      if (v12)
      {
        uint64_t v13 = *(void *)(a1 + 16);
        uint64_t v14 = *(void *)(a1 + 56);
        int v22 = 138543618;
        uint64_t v23 = v13;
        __int16 v24 = 2048;
        uint64_t v25 = v14;
        uint64_t v15 = v11;
        goto LABEL_21;
      }

LABEL_23:
      int v20 = 0LL;
LABEL_24:
      free(v20);
      goto LABEL_25;
    }

    id v11 = (os_log_s *)*(id *)(a1 + 32);
    BOOL v16 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v16)
      {
        int v17 = sub_185F385E4();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
          v17 &= ~1u;
        }
        if (!v17) {
          goto LABEL_23;
        }
LABEL_20:
        uint64_t v19 = *(void *)(a1 + 16);
        int v22 = 138543362;
        uint64_t v23 = v19;
        uint64_t v15 = v11;
LABEL_21:
        int v20 = (void *)_os_log_send_and_compose_impl();

        if (v20) {
          sub_185F385EC();
        }
        goto LABEL_24;
      }
    }

    else if (v16)
    {
      int v18 = sub_185F385E4();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        v18 &= ~1u;
      }
      if (!v18) {
        goto LABEL_23;
      }
      goto LABEL_20;
    }

LABEL_25:
  }
}

BOOL sub_185F36FAC(BOOL result)
{
  if (result) {
    return *(void *)(result + 56) == 0LL;
  }
  return result;
}

void sub_185F36FC0(uint64_t a1, void *a2)
{
  if (a1)
  {
    if (a2) {
      *a2 = 0LL;
    }
    uint64_t v4 = *(void **)(a1 + 48);
    uint64_t v5 = (uint64_t (*)(void))v4[2];
    uint64_t v6 = v4;
    uint64_t v7 = v5();
    id v8 = 0LL;
    *(void *)(a1 + 56) = v7;

    if (*(void *)(a1 + 56))
    {
      if (qword_18C682AC0 != -1) {
        dispatch_once(&qword_18C682AC0, &unk_189DD4630);
      }
      uint64_t v9 = (os_log_s *)(id)qword_18C682AA8;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v10 = sub_185F385E4();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          v10 &= ~1u;
        }
        if (v10)
        {
          id v11 = v9;
          int v12 = (void *)_os_log_send_and_compose_impl();

          if (v12) {
            sub_185F385EC();
          }
        }

        else
        {
          int v12 = 0LL;
        }

        free(v12);
      }
    }

    else
    {
      uint64_t v13 = (os_log_s *)*(id *)(a1 + 32);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v14 = sub_185F385E4();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          v14 &= ~1u;
        }
        if (v14)
        {
          uint64_t v15 = v13;
          BOOL v16 = (void *)_os_log_send_and_compose_impl();

          if (v16) {
            sub_185F385EC();
          }
        }

        else
        {
          BOOL v16 = 0LL;
        }

        free(v16);
      }

      if (a2) {
        *a2 = v8;
      }
    }
  }

uint64_t sub_185F37254(uint64_t result)
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

uint64_t sub_185F37260(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 12);
  }
  return result;
}

uint64_t sub_185F3726C(uint64_t result)
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

uint64_t sub_185F37278(uint64_t result)
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

uint64_t sub_185F37284(uint64_t result, int a2)
{
  if (result) {
    *(_DWORD *)(result + 12) = a2;
  }
  return result;
}

uint64_t sub_185F37290(uint64_t result)
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

uint64_t sub_185F3729C(uint64_t result)
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

uint64_t sub_185F372A8(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 56) = a2;
  }
  return result;
}

uint64_t sub_185F372B4(uint64_t result)
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

uint64_t sub_185F372C0(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

uint64_t sub_185F372CC(uint64_t result, int a2)
{
  if (result) {
    *(_DWORD *)(result + 8) = a2;
  }
  return result;
}

void sub_185F37320()
{
  os_log_t v0 = os_log_create(off_18C6820F0, "persona");
  v1 = (void *)qword_18C682AA8;
  qword_18C682AA8 = (uint64_t)v0;
}

id sub_185F37354(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = objc_opt_self();
  return sub_185F3737C(v3, a2, 0LL);
}

id sub_185F3737C(uint64_t a1, unint64_t a2, void *a3)
{
  v12[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v6 = objc_opt_self();
  if (a2 > 9) {
    uint64_t v7 = @"An error occurred";
  }
  else {
    uint64_t v7 = off_189DD4660[a2];
  }
  uint64_t v11 = *MEMORY[0x1896075E0];
  v12[0] = v7;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v5, (uint64_t)v12, (uint64_t)&v11, 1);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F37534(v6, a2, v8, v4);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id sub_185F37464(uint64_t a1, unint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v6 = objc_opt_self();
  if (v4)
  {
    uint64_t v10 = *MEMORY[0x189607798];
    v11[0] = v4;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v5, (uint64_t)v11, (uint64_t)&v10, 1);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  sub_185F3737C(v6, a2, v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id sub_185F37534(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  objc_opt_self();
  if (v7) {
    uint64_t v11 = objc_msgSend_mutableCopy(v7, v8, v9, v10);
  }
  else {
    uint64_t v11 = objc_opt_new();
  }
  int v12 = (void *)v11;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v13 = v6;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v15)
  {
    uint64_t v18 = v15;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t i = 0LL; i != v18; ++i)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v13);
        }
        uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v13, v16, v21, v17, (void)v27);
        int v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v12, v23, (uint64_t)v22, v21);
      }

      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v27, (uint64_t)v31, 16);
    }

    while (v18);
  }

  objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v24,  (uint64_t)@"UMUserManagerErrorDomain",  a2,  v12);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

__CFDictionary *UMUserTypeDeviceMode(uint64_t a1, CFErrorRef *a2)
{
  uint64_t v3 = sub_185F380F8();
  uint32_t v25 = 0;
  uint64_t v4 = sub_185F3821C(&v25);
  if ((_DWORD)v4)
  {
    sub_185F436A0();
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to get multiuser_config flags from kernel with error:%d",  v6,  v7,  v8,  v9,  v10,  v11,  v4);
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v5, v12);

    sub_185F436A0();
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v4 == 2) {
      int v20 = @"FAILED to UMUserTypeDeviceMode, EPERM";
    }
    else {
      int v20 = @"FAILED to UMUserTypeDeviceMode, EINVAL";
    }
    if ((_DWORD)v4 == 2) {
      CFIndex v21 = 1LL;
    }
    else {
      CFIndex v21 = 22LL;
    }
    sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, v20, v13, v14, v15, v16, v17, v18, v24);
    int v22 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v19, v22);
  }

  else
  {
    if ((v25 & 0x80000000) != 0)
    {
      CFDictionarySetValue(v3, kUMDeviceModeKey, kUMDeviceModeSharedIPad);
      CFDictionarySetValue(v3, kUMUserTypeKey, kUMUserTypeEphemeral);
      return v3;
    }

    CFIndex v21 = 0LL;
  }

  CFDictionarySetValue(v3, kUMDeviceModeKey, kUMDeviceModeSingleUser);
  CFDictionarySetValue(v3, kUMUserTypeKey, kUMUserTypePermanent);
  if (a2 && (_DWORD)v4) {
    *a2 = CFErrorCreate(0LL, (CFErrorDomain)*MEMORY[0x189604F58], v21, 0LL);
  }
  return v3;
}

uint64_t UMUserSessionSetSecureBackupBlob()
{
  return 0LL;
}

uint64_t UMUserSessionRetrieveSecureBackupBlob()
{
  return 0LL;
}

uint64_t UMUserSessionDeleteSecureBackupBlob()
{
  return 0LL;
}

uint64_t UMUserSessionIsLoginWindow()
{
  return 0LL;
}

uint64_t UMUserSessionConfigureLoginWindow()
{
  return 0LL;
}

uint64_t UMUserSessionSwitchToLoginWindow()
{
  return 0LL;
}

uint64_t UMForegroundUserSessionID()
{
  return 0xFFFFFFFFLL;
}

uint64_t UMUserSessionLoadWithPasscode()
{
  return 0LL;
}

uint64_t UMCurrentSyncBubbleSessionID(void *a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = 0LL;
  uint64_t v3 = sub_185F519E4(v2, &v6);
  id v4 = v6;

  if (a1 && v4) {
    *a1 = v4;
  }

  return v3;
}

void *UMUserSessionListSyncMachServices(void *a1, void *a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = 0LL;
  sub_185F51C4C(v4, a1, &v9);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v9;

  if (v5)
  {
    id v7 = v5;
  }

  else if (a2 && v6)
  {
    *a2 = v6;
  }

  if (a2 && v6) {
    *a2 = v6;
  }

  return v5;
}

BOOL UMUserSessionIsLoginSession(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = 0LL;
  BOOL v4 = sub_185F51F4C(v3, &v7);
  id v5 = v7;

  if (v5) {
    *a2 = v5;
  }

  return v4;
}

uint64_t UMUserSessionForegroundSession()
{
  return 0LL;
}

uint64_t UMUserSessionAttributes()
{
  return 0LL;
}

uint64_t UMUserSessionSwitchWithBlob()
{
  return 0LL;
}

uint64_t UMUserSessionDataMigrationSetup()
{
  return 0LL;
}

const void *sub_185F37A68(const __CFDictionary *a1, const void *a2)
{
  result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    uint64_t v3 = result;
    CFTypeID v4 = CFGetTypeID(result);
    if (v4 == CFDataGetTypeID()) {
      return v3;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

const void *sub_185F37AA0(const __CFDictionary *a1, const void *a2)
{
  result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    uint64_t v3 = result;
    CFTypeID v4 = CFGetTypeID(result);
    if (v4 == CFArrayGetTypeID()) {
      return v3;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_185F37AD8(const __CFDictionary *a1, const void *a2)
{
  uint64_t v2 = 0xFFFFFFFFLL;
  unsigned int valuePtr = -1;
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    CFTypeID v4 = Value;
    CFTypeID v5 = CFGetTypeID(Value);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
      return valuePtr;
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  return v2;
}

uint64_t sub_185F37B40(const __CFDictionary *a1, const void *a2)
{
  uint64_t v2 = -1LL;
  uint64_t valuePtr = -1LL;
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    CFTypeID v4 = Value;
    CFTypeID v5 = CFGetTypeID(Value);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberLongLongType, &valuePtr);
      return valuePtr;
    }

    else
    {
      return -1LL;
    }
  }

  return v2;
}

uint64_t sub_185F37BA8(const __CFDictionary *a1, const void *a2)
{
  uint64_t v2 = -1LL;
  uint64_t valuePtr = -1LL;
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    CFTypeID v4 = Value;
    CFTypeID v5 = CFGetTypeID(Value);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberSInt64Type, &valuePtr);
      return valuePtr;
    }

    else
    {
      return -1LL;
    }
  }

  return v2;
}

CFBooleanRef sub_185F37C10(const __CFDictionary *a1, const void *a2)
{
  result = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    uint64_t v3 = result;
    CFTypeID v4 = CFGetTypeID(result);
    if (v4 == CFBooleanGetTypeID()) {
      return (const __CFBoolean *)(CFBooleanGetValue(v3) != 0);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

const void *sub_185F37C60(const __CFDictionary *a1, const void *a2)
{
  Value = CFDictionaryGetValue(a1, a2);
  if (!Value) {
    return 0LL;
  }
  uint64_t v3 = Value;
  CFTypeID v4 = CFGetTypeID(Value);
  if (v4 != CFStringGetTypeID()) {
    return 0LL;
  }
  return v3;
}

BOOL sub_185F37CA0(const __CFDictionary *a1, const void *a2, char *a3, int a4)
{
  id v6 = (const __CFString *)sub_185F37C60(a1, a2);
  return v6 && CFStringGetCString(v6, a3, a4, 0x8000100u);
}

CFTypeRef sub_185F37CEC(const __CFDictionary *a1, const void *a2)
{
  Value = CFDictionaryGetValue(a1, a2);
  if (Value && (uint64_t v3 = Value, v4 = CFGetTypeID(Value), v4 == CFDictionaryGetTypeID())) {
    return CFRetain(v3);
  }
  else {
    return 0LL;
  }
}

CFTypeRef sub_185F37D38(const void *a1)
{
  uint64_t v2 = CFWriteStreamCreateWithAllocatedBuffers( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFAllocatorRef)*MEMORY[0x189604DB0]);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = v2;
  if (CFWriteStreamOpen(v2))
  {
    if (CFPropertyListWrite(a1, v3, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL) < 1) {
      CFTypeRef v4 = 0LL;
    }
    else {
      CFTypeRef v4 = CFWriteStreamCopyProperty(v3, (CFStreamPropertyKey)*MEMORY[0x1896051D0]);
    }
    CFWriteStreamClose(v3);
  }

  else
  {
    CFTypeRef v4 = 0LL;
  }

  CFRelease(v3);
  return v4;
}

CFPropertyListRef sub_185F37DDC(UInt8 *bytes, CFIndex length)
{
  CFPropertyListFormat format = kCFPropertyListBinaryFormat_v1_0;
  uint64_t v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  uint64_t v3 = CFReadStreamCreateWithBytesNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  bytes,  length,  (CFAllocatorRef)*MEMORY[0x189604DC8]);
  if (v3)
  {
    CFTypeRef v4 = v3;
    if (CFReadStreamOpen(v3))
    {
      CFPropertyListRef v5 = CFPropertyListCreateWithStream(v2, v4, 0LL, 2uLL, &format, 0LL);
      if (!v5) {
        syslog(7, "Could not create object from stream");
      }
      CFReadStreamClose(v4);
    }

    else
    {
      syslog(7, "Could not open the stream");
      CFPropertyListRef v5 = 0LL;
    }

    CFRelease(v4);
  }

  else
  {
    syslog(7, "Could not create stream for serialized data");
    return 0LL;
  }

  return v5;
}

const void *sub_185F37EB8(UInt8 *bytes, CFIndex length)
{
  uint64_t v2 = 0LL;
  CFPropertyListFormat format = kCFPropertyListBinaryFormat_v1_0;
  if (bytes && length)
  {
    CFTypeRef v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFPropertyListRef v5 = CFReadStreamCreateWithBytesNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  bytes,  length,  (CFAllocatorRef)*MEMORY[0x189604DC8]);
    if (!v5)
    {
      syslog(7, "Could not create stream from serialized data");
      return 0LL;
    }

    id v6 = v5;
    if (CFReadStreamOpen(v5))
    {
      CFPropertyListRef v7 = CFPropertyListCreateWithStream(v4, v6, length, 2uLL, &format, 0LL);
      uint64_t v2 = v7;
      if (!v7)
      {
        syslog(7, "Could not create dictionary from stream");
        goto LABEL_9;
      }

      CFTypeID v8 = CFGetTypeID(v7);
      if (v8 == CFDictionaryGetTypeID())
      {
LABEL_9:
        CFReadStreamClose(v6);
        CFRelease(v6);
        return v2;
      }

      CFRelease(v2);
    }

    else
    {
      syslog(7, "Could not open the stream");
    }

    uint64_t v2 = 0LL;
    goto LABEL_9;
  }

  return v2;
}

const void *sub_185F37FCC(const char *a1)
{
  int v2 = open(a1, 0);
  if (v2 == -1)
  {
    id v9 = __error();
    uint64_t v10 = strerror(*v9);
    syslog(7, "Could not open %s: %s", a1, v10);
    CFPropertyListRef v5 = 0LL;
    CFPropertyListRef v7 = 0LL;
    goto LABEL_7;
  }

  int v3 = v2;
  if (fstat(v2, &v14))
  {
    uint64_t v11 = __error();
    int v12 = strerror(*v11);
    syslog(7, "Could not fstat %s: %s", a1, v12);
    CFPropertyListRef v7 = 0LL;
    CFPropertyListRef v5 = 0LL;
    goto LABEL_6;
  }

  size_t st_size = v14.st_size;
  CFPropertyListRef v5 = malloc(LODWORD(v14.st_size));
  if (!v5)
  {
    syslog(7, "Could not allocate buffer");
LABEL_12:
    CFPropertyListRef v7 = 0LL;
    goto LABEL_6;
  }

  ssize_t v6 = read(v3, v5, st_size);
  if (v6 != v14.st_size)
  {
    uint64_t v13 = __error();
    strerror(*v13);
    syslog(7, "Could not read %s: %s");
    goto LABEL_12;
  }

  CFPropertyListRef v7 = sub_185F37EB8((UInt8 *)v5, v6);
LABEL_6:
  close(v3);
LABEL_7:
  free(v5);
  return v7;
}

CFMutableDictionaryRef sub_185F380F8()
{
  CFMutableDictionaryRef result = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (!result)
  {
    syslog(7, "Out of Memory!!! Dying!...so...cold....");
    exit(-1);
  }

  return result;
}

CFMutableDictionaryRef sub_185F38148(CFDictionaryRef theDict)
{
  CFMutableDictionaryRef result = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, theDict);
  if (!result)
  {
    syslog(7, "Out of Memory!!! Dying!...so...cold....");
    exit(-1);
  }

  return result;
}

CFMutableArrayRef sub_185F3818C()
{
  CFMutableArrayRef result = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  if (!result)
  {
    syslog(7, "Out of Memory!!! Dying!...so...cold....");
    exit(-1);
  }

  return result;
}

CFStringRef sub_185F381D4(char *cStr)
{
  CFStringRef result = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], cStr, 0x8000100u);
  if (!result)
  {
    syslog(7, "Out of Memory!!! Dying!...so...cold....");
    exit(-1);
  }

  return result;
}

uint64_t sub_185F3821C(uint32_t *a1)
{
  uint32_t multiuser_flags = 0;
  host_t v2 = MEMORY[0x186E2FC9C]();
  uint64_t result = host_get_multiuser_config_flags(v2, &multiuser_flags);
  if (a1)
  {
    if (!(_DWORD)result) {
      *a1 = multiuser_flags;
    }
  }

  return result;
}

uint64_t sub_185F38260(mach_port_name_t name)
{
  mach_port_type_t ptype = 0;
  if (mach_port_type(*MEMORY[0x1895FBBE0], name, &ptype)) {
    return 0LL;
  }
  else {
    return ptype;
  }
}

void sub_185F382A0(mach_port_name_t name)
{
  kern_return_t v2;
  mach_port_type_t v3;
  BOOL v4;
  mach_port_type_t ptype;
  mach_port_type_t ptype = 0;
  host_t v2 = mach_port_type(*MEMORY[0x1895FBBE0], name, &ptype);
  int v3 = ptype;
  if (v2) {
    CFTypeRef v4 = 1;
  }
  else {
    CFTypeRef v4 = ptype == 0;
  }
  if (v4)
  {
    syslog(7, "Port:%d has NORIGHTS");
    return;
  }

  if ((ptype & 0x10000) != 0)
  {
    syslog(7, "Port:%d has SENDRIGHT", name);
    if ((v3 & 0x20000) == 0)
    {
LABEL_9:
      if ((v3 & 0x40000) == 0) {
        goto LABEL_10;
      }
LABEL_14:
      syslog(7, "Port:%d has SENDONCERIGHT", name);
      if ((v3 & 0x100000) == 0) {
        return;
      }
      goto LABEL_15;
    }
  }

  else if ((ptype & 0x20000) == 0)
  {
    goto LABEL_9;
  }

  syslog(7, "Port:%d has RECEIVERIGHT", name);
  if ((v3 & 0x40000) != 0) {
    goto LABEL_14;
  }
LABEL_10:
  if ((v3 & 0x100000) != 0) {
LABEL_15:
  }
    syslog(7, "Port:%d has DEADNAME");
}

uint64_t sub_185F38378()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  size_t __len = 1023LL;
  bzero(__big, 0x400uLL);
  if (sysctlbyname("kern.bootargs", __big, &__len, 0LL, 0LL) || strnstr(__big, "um-migration-debug=0", __len)) {
    return 0LL;
  }
  if (strnstr(__big, "um-migration-debug=1", __len)) {
    return 1LL;
  }
  if (strnstr(__big, "um-migration-debug=2", __len)) {
    return 2LL;
  }
  if (strnstr(__big, "um-migration-debug=3", __len)) {
    return 3LL;
  }
  if (strnstr(__big, "um-migration-debug=4", __len)) {
    return 4LL;
  }
  if (strnstr(__big, "um-migration-debug=5", __len)) {
    return 5LL;
  }
  if (strnstr(__big, "um-migration-debug=100", __len)) {
    return 100LL;
  }
  if (strnstr(__big, "um-migration-debug=101", __len)) {
    return 101LL;
  }
  return 0LL;
}

void sub_185F384F8( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a2;
  objc_opt_self();
  id v10 = objc_alloc(NSString);
  uint64_t v12 = objc_msgSend_initWithFormat_arguments_(v10, v11, (uint64_t)v9, (uint64_t)&a9);
  sub_185F43988();
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v13, @"%@", v14, v15, v16, v17, v18, v19, v12);

  abort();
}

void sub_185F3856C(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v4 = a3;
  uint64_t v8 = objc_opt_self();
  if (v15 && objc_msgSend_code(v15, v5, v6, v7) == 1) {
    sub_185F384F8( v8,  @"You do not have the correct entitlements for operation: %@",  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)v4);
  }
}

uint64_t sub_185F385E4()
{
  return 1LL;
}

void sub_185F385EC()
{
}

void sub_185F3893C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userListDidUpdate(v7, v4, v5, v6);
}

uint64_t sub_185F38970(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v10 = a3;
  objc_opt_self();
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  char v36 = 0;
  uint64_t v27 = 0LL;
  __int128 v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  __int128 v30 = sub_185F38B70;
  v31 = sub_185F38B80;
  id v32 = 0LL;
  uint64_t v11 = objc_alloc(&OBJC_CLASS___UMPersonaMachPort);
  uint64_t v13 = (void *)objc_msgSend_initWithMachPort_options_(v11, v12, a2, 1);
  sub_185F4773C();
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4D830(v14);
  id v15 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v16 = MEMORY[0x1895F87A8];
  v26[0] = MEMORY[0x1895F87A8];
  v26[1] = 3221225472LL;
  v26[2] = sub_185F38B88;
  v26[3] = &unk_189DD46E0;
  v26[4] = &v27;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v15, v17, (uint64_t)v26, v18);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = getpid();
  v25[0] = v16;
  v25[1] = 3221225472LL;
  v25[2] = sub_185F38C14;
  v25[3] = &unk_189DD4708;
  v25[4] = &v27;
  v25[5] = &v33;
  v25[6] = a5;
  objc_msgSend_replacePersonaMachPortVoucher_withAccountID_generationSet_forPid_withReply_( v19,  v21,  (uint64_t)v13,  (uint64_t)v10,  a4,  v20,  v25);

  if (a6)
  {
    int v22 = (void *)v28[5];
    if (v22) {
      *a6 = v22;
    }
  }

  uint64_t v23 = *((unsigned __int8 *)v34 + 24);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v23;
}

void sub_185F38B48( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t sub_185F38B70(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_185F38B80(uint64_t a1)
{
}

void sub_185F38B88(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F38C14(uint64_t a1, void *a2, void *a3)
{
  id v26 = a2;
  id v8 = a3;
  if (!v8)
  {
    if (v26)
    {
      if (*(void *)(a1 + 48))
      {
        **(_DWORD **)(a1 + 4_Block_object_dispose((const void *)(v13 - 128), 8) = objc_msgSend_machPort(v26, v5, v6, v7);
        *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
        goto LABEL_8;
      }
    }

    else
    {
      sub_185F43818();
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"no targetPort received from replacePersonaPortVoucher",  v10,  v11,  v12,  v13,  v14,  v15,  v25);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A98((uint64_t)v9, v16);
    }

    sub_185F43818();
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"INVALID CALLBACK from replacePersonaPortVoucher with null targetPortPtr",  v18,  v19,  v20,  v21,  v22,  v23,  v25);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v17, v24);

    goto LABEL_8;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a3);
LABEL_8:
}

id sub_185F38D30(void *a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v7 = v3;
  if (a1)
  {
    if (!v3) {
      goto LABEL_7;
    }
    a1 = (void *)objc_msgSend_length(v3, v4, v5, v6);
    if (a1)
    {
      if (pipe(v27) != -1)
      {
        int v8 = v27[1];
        id v9 = v7;
        uint64_t v13 = (const void *)objc_msgSend_bytes(v9, v10, v11, v12);
        write(v8, v13, (size_t)a1);
        close(v27[1]);
        id v14 = objc_alloc(MEMORY[0x189607898]);
        a1 = (void *)objc_msgSend_initWithFileDescriptor_closeOnDealloc_(v14, v15, v27[0], 1);
        goto LABEL_8;
      }

      int v16 = *__error();
      sub_185F436A0();
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = strerror(v16);
      sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"failed to get fds(1) with error:%s",  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)v18);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A98((uint64_t)v17, v25);

LABEL_7:
      a1 = 0LL;
    }
  }

LABEL_8:
  return a1;
}
}

    *((void *)v2 + 3) = 0x6400000064LL;
    v2[23] = 0;
    *(_DWORD *)(v2 + 17) = 0;
    *(_WORD *)(v2 + 21) = 0;
    uint64_t v19 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = @"Invalid";
    *((void *)v2 + 6) = 1000LL;

    uint64_t v20 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = 0LL;
LABEL_14:

    uint64_t v25 = v2;
  }

  return (UMUserPersona *)v2;
}

uint64_t sub_185F38E68()
{
  return byte_18C49E258;
}

uint64_t sub_185F38E84()
{
  uint64_t v0 = objc_opt_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_185F38EFC;
  block[3] = &unk_189DD45B8;
  block[4] = v0;
  if (qword_18C682B20 != -1) {
    dispatch_once(&qword_18C682B20, block);
  }
  return byte_18C682B19;
}

uint64_t sub_185F38EFC()
{
  uint64_t result = getuid();
  if (result < 0x1F6)
  {
    BOOL v3 = 0;
  }

  else
  {
    int v1 = result;
    uint64_t v2 = objc_opt_self();
    uint64_t result = sub_185F3F7D8(v2, 0LL);
    BOOL v3 = (_DWORD)result != v1;
  }

  byte_18C682B19 = v3;
  return result;
}

uint64_t sub_185F38F50()
{
  uint64_t v0 = objc_opt_self();
  return sub_185F3F7D8(v0, 0LL);
}

uint64_t sub_185F38F68()
{
  if (qword_18C682B30 != -1) {
    dispatch_once(&qword_18C682B30, &unk_189DD4728);
  }
  return byte_18C682B28;
}

void sub_185F38FAC()
{
  uint64_t v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    int v1 = v0;
    byte_18C682B28 = CFEqual(v0, @"Internal") != 0;
    CFRelease(v1);
  }

uint64_t sub_185F39008()
{
  return byte_18C682B18;
}

uint64_t sub_185F39024()
{
  uint64_t v0 = objc_opt_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_185F3909C;
  block[3] = &unk_189DD45B8;
  block[4] = v0;
  if (qword_18C682B38 != -1) {
    dispatch_once(&qword_18C682B38, block);
  }
  return qword_18C6821B8;
}

void sub_185F3909C(uint64_t a1)
{
  int v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    id v9 = v1;
    objc_msgSend_objectForKeyedSubscript_(v1, v2, kUMUserSessionTotalUsers, v3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = v4;
    if (v4) {
      qword_18C6821B8 = objc_msgSend_unsignedIntegerValue(v4, v5, v6, v7);
    }

    int v1 = v9;
  }
}

id sub_185F3910C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = objc_opt_self();
  sub_185F3E5E4();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v7, a2, v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v10, (uint64_t)v9, kUMUserSessionIDKey);

  uint64_t v32 = 0LL;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  uint64_t v35 = sub_185F38B70;
  char v36 = sub_185F38B80;
  id v37 = 0LL;
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  uint64_t v29 = sub_185F38B70;
  __int128 v30 = sub_185F38B80;
  id v31 = 0LL;
  if (v6)
  {
    sub_185F4773C();
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F4D830(v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v14 = MEMORY[0x1895F87A8];
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = sub_185F3FBF8;
    v25[3] = &unk_189DD46E0;
    v25[4] = &v32;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v13, v15, (uint64_t)v25, v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v14;
    v24[1] = 3221225472LL;
    v24[2] = sub_185F3FC84;
    v24[3] = &unk_189DD4890;
    v24[4] = &v32;
    v24[5] = &v26;
    objc_msgSend_getUserSessionAttributes_reply_(v17, v18, (uint64_t)v6, (uint64_t)v24);

    uint64_t v19 = (void *)v27[5];
    if (!v19)
    {
      sub_185F3E53C(v5, (void *)v33[5], a3);
      uint64_t v19 = (void *)v27[5];
    }

    id v20 = v19;
  }

  else
  {
    uint64_t v21 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v11, *MEMORY[0x189607688], 22, 0);
    uint64_t v22 = (void *)v33[5];
    v33[5] = v21;

    id v20 = 0LL;
    if (a3) {
      *a3 = (id) v33[5];
    }
  }

  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v20;
}

void sub_185F3933C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t sub_185F39364()
{
  uint64_t v0 = objc_opt_self();
  objc_opt_self();
  if (byte_18C49E258)
  {
    sub_185F3910C(v0, 502LL, 0LL);
    int v1 = (void *)objc_claimAutoreleasedReturnValue();
    id v4 = v1;
    if (v1)
    {
      objc_msgSend_objectForKeyedSubscript_(v1, v2, kUMUserSessionEachUserSize, v3);
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      id v9 = v5;
      if (v5) {
        qword_18C682B40 = objc_msgSend_unsignedLongLongValue(v5, v6, v7, v8);
      }
    }
  }

  return qword_18C682B40;
}

uint64_t sub_185F393F4()
{
  uint64_t v0 = objc_opt_self();
  objc_opt_self();
  if (byte_18C49E258)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_185F39488;
    block[3] = &unk_189DD45B8;
    block[4] = v0;
    if (qword_18C682B50 != -1) {
      dispatch_once(&qword_18C682B50, block);
    }
  }

  return dword_18C682B48;
}

void sub_185F39488(uint64_t a1)
{
  int v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    id v9 = v1;
    objc_msgSend_objectForKeyedSubscript_(v1, v2, kUMUserSessionPreviousLoggedinIDKey, v3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = v4;
    if (v4) {
      dword_18C682B48 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7);
    }

    int v1 = v9;
  }
}

id sub_185F394F8()
{
  uint64_t v0 = objc_opt_self();
  uint64_t v1 = sub_185F3F7D8(v0, 0LL);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_18C682B58);
  if (!qword_18C682A88 || objc_msgSend_uid((void *)qword_18C682A88, v2, v3, v4) != (_DWORD)v1)
  {
    uint64_t v5 = sub_185F54870((uint64_t)&OBJC_CLASS___UMUser, v1);
    uint64_t v6 = (void *)qword_18C682A88;
    qword_18C682A88 = v5;
  }

  id v7 = (id)qword_18C682A88;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_18C682B58);
  return v7;
}

id sub_185F39584()
{
  uint64_t v0 = objc_opt_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_185F395FC;
  block[3] = &unk_189DD45B8;
  block[4] = v0;
  if (qword_18C682B68 != -1) {
    dispatch_once(&qword_18C682B68, block);
  }
  return (id)qword_18C682B60;
}

void sub_185F395FC()
{
  if (byte_18C49E258)
  {
    sub_185F54870((uint64_t)&OBJC_CLASS___UMUser, 502LL);
    uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v0 = (void *)objc_opt_new();
    uint64_t v1 = getuid();
    objc_msgSend_setUid_(v0, v2, v1, v3);
    uint64_t v4 = getgid();
    objc_msgSend_setGid_(v0, v5, v4, v6);
    objc_msgSend_setGivenName_(v0, v7, (uint64_t)@"login", v8);
    objc_msgSend_setFamilyName_(v0, v9, (uint64_t)@"login", v10);
  }

  uint64_t v11 = (void *)qword_18C682B60;
  qword_18C682B60 = (uint64_t)v0;
}

void sub_185F39884( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_185F398AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F39938(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v6 = a3;
  if (v15) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  }
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
    sub_185F436A0();
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote userSessionLRUInfoWithReply: %@",  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)v6);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v7, v14);
  }
}

id sub_185F39A00(uint64_t a1, int a2)
{
  uint64_t v71 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v64 = 0LL;
  v65 = &v64;
  uint64_t v66 = 0x3032000000LL;
  v67 = sub_185F38B70;
  v68 = sub_185F38B80;
  id v69 = 0LL;
  uint64_t v58 = 0LL;
  v59 = &v58;
  uint64_t v60 = 0x3032000000LL;
  v61 = sub_185F38B70;
  v62 = sub_185F38B80;
  id v63 = 0LL;
  sub_185F4773C();
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4D830(v3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = MEMORY[0x1895F87A8];
  v57[0] = MEMORY[0x1895F87A8];
  v57[1] = 3221225472LL;
  v57[2] = sub_185F39D74;
  v57[3] = &unk_189DD46E0;
  v57[4] = &v64;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v4, v6, (uint64_t)v57, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v5;
  v56[1] = 3221225472LL;
  v56[2] = sub_185F39E00;
  v56[3] = &unk_189DD4750;
  v56[4] = &v58;
  v56[5] = &v64;
  objc_msgSend_listAllUserSessionIDsWithAReply_(v8, v9, (uint64_t)v56, v10);

  uint64_t v17 = (void *)v59[5];
  if (v17)
  {
    id v21 = v17;
    if (a2)
    {
      objc_msgSend_predicateWithBlock_(MEMORY[0x1896079C8], v18, (uint64_t)&unk_189DD4790, v20);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v25 = objc_msgSend_filteredArrayUsingPredicate_(v21, v23, (uint64_t)v22, v24);

      id v21 = (id)v25;
    }

    uint64_t v26 = (void *)MEMORY[0x189603FA8];
    uint64_t v27 = objc_msgSend_count(v21, v18, v19, v20);
    objc_msgSend_arrayWithCapacity_(v26, v28, v27, v29);
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    id v31 = v21;
    uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v52, (uint64_t)v70, 16);
    if (v36)
    {
      uint64_t v37 = *(void *)v53;
      do
      {
        uint64_t v38 = 0LL;
        do
        {
          if (*(void *)v53 != v37) {
            objc_enumerationMutation(v31);
          }
          uint64_t v39 = objc_msgSend_intValue(*(void **)(*((void *)&v52 + 1) + 8 * v38), v33, v34, v35);
          sub_185F54870((uint64_t)&OBJC_CLASS___UMUser, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v30, v41, (uint64_t)v40, v42);

          ++v38;
        }

        while (v36 != v38);
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v33, (uint64_t)&v52, (uint64_t)v70, 16);
      }

      while (v36);
    }

    v43 = v31;
  }

  else
  {
    if (!v65[5])
    {
      __int128 v30 = (void *)MEMORY[0x189604A58];
      goto LABEL_15;
    }

    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Could not get user UIDs",  v11,  v12,  v13,  v14,  v15,  v16,  v51);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F46B40((uint64_t)v43, @"error: %@", v44, v45, v46, v47, v48, v49, v65[5]);
    sub_185F436A0();
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v31, v43);
    __int128 v30 = (void *)MEMORY[0x189604A58];
  }

LABEL_15:
  _Block_object_dispose(&v58, 8);

  _Block_object_dispose(&v64, 8);
  return v30;
}

void sub_185F39D30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, char a36)
{
}

void sub_185F39D74(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F39E00(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v6 = a3;
  if (v15) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  }
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
    sub_185F436A0();
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote listAllUserSessionIDsWithAReply: %@",  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)v6);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v7, v14);
  }
}

BOOL sub_185F39EC8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_unsignedIntValue(a2, (const char *)a2, a3, a4) != 502;
}

UMUserPersona *sub_185F39EE8()
{
  return objc_alloc_init(&OBJC_CLASS___UMUserPersona);
}

id sub_185F39F08()
{
  if (qword_18C682AA0 != -1) {
    dispatch_once(&qword_18C682AA0, &unk_189DD47B0);
  }
  return (id)qword_18C682A98;
}

void sub_185F39F4C()
{
  if (qword_18C682AC8 != -1) {
    dispatch_once(&qword_18C682AC8, &unk_189DD48D8);
  }
  id v0 = (id)qword_18C682AB0;
  sub_185F43DCC();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = sub_185F368C8( (uint64_t)&OBJC_CLASS___UMGenerationCache,  @"persona",  @"com.apple.mobile.usermanagerd.personageneration_changed",  v0,  v3,  &unk_189DD47F0);
  uint64_t v2 = (void *)qword_18C682A98;
  qword_18C682A98 = v1;
}

uint64_t sub_185F39FFC(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = sub_185F4E03C(v3, a2);

  return v4;
}

uint64_t sub_185F3A040()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = 0LL;
  uint64_t v1 = sub_185F36A7C((uint64_t)v0, &v12);
  id v2 = v12;

  if (v2)
  {
    sub_185F438D0();
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A40( (uint64_t)v3,  @"Failed to fetch test if generation has changed: failed to fetch new generation value: %@",  v4,  v5,  v6,  v7,  v8,  v9,  (uint64_t)v2);

LABEL_6:
    uint64_t v10 = 1LL;
    goto LABEL_7;
  }

  if (v1 != qword_18C682A90)
  {
    qword_18C682A90 = v1;
    goto LABEL_6;
  }

  uint64_t v10 = 0LL;
LABEL_7:

  return v10;
}

uint64_t sub_185F3A0F0(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  objc_opt_self();
  if (a3) {
    *a3 = 0LL;
  }
  if (!v4)
  {
    sub_185F43818();
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"dropping voucher due to nil personaUniqueString",  v80,  v81,  v82,  v83,  v84,  v85,  v123);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v79, v86);

LABEL_14:
    id v87 = 0LL;
LABEL_19:
    uint64_t v114 = 1LL;
    goto LABEL_20;
  }

  if (qword_18C49E1F0 && sub_185F3A040())
  {
    sub_185F436A0();
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Persona generation has changed; dropping cached vouchers.",
      v6,
      v7,
      v8,
      v9,
      v10,
      v11,
      v123);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v5, v12);

    objc_msgSend_removeAllObjects((void *)qword_18C49E1F0, v13, v14, v15);
  }

  sub_185F43818();
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Adopting Voucher for accountID:%@",  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)v4);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v16, v23);

  if (qword_18C49E1F0)
  {
    objc_msgSend_allKeys((void *)qword_18C49E1F0, v24, v25, v26);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27
      && (sub_185F43818(),
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(),
          sub_185F468A0( (uint64_t)UMLogMessage,  @"AllKeys is:%@",  v29,  v30,  v31,  v32,  v33,  v34,  (uint64_t)v4),  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(),  sub_185F43A98((uint64_t)v28, v35),  v35,  v28,  (objc_msgSend_containsObject_(v27, v36, (uint64_t)v4, v37) & 1) != 0))
    {
      objc_msgSend_objectForKey_((void *)qword_18C49E1F0, v38, (uint64_t)v4, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43818();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"has Cache key and its value is:%@",  v42,  v43,  v44,  v45,  v46,  v47,  (uint64_t)v40);
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A98((uint64_t)v41, v48);

      if (v40)
      {
        sub_185F43818();
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
        sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Found Cached Copy of voucher for Account:%@",  v50,  v51,  v52,  v53,  v54,  v55,  (uint64_t)v4);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        sub_185F43A98((uint64_t)v49, v56);

        objc_msgSend_contextAdopt(v40, v57, v58, v59);
        sub_185F436A0();
        uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
        sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Adopted cached Voucher for accountID:%@",  v61,  v62,  v63,  v64,  v65,  v66,  (uint64_t)v4);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        sub_185F43A98((uint64_t)v60, v67);

        objc_msgSend_removeObjectForKey_((void *)qword_18C49E1F0, v68, (uint64_t)v4, v69);
        uint64_t v71 = objc_alloc_init(&OBJC_CLASS___UMUserPersonaContext);
        if (v71)
        {
          objc_msgSend_setObject_forKey_((void *)qword_18C49E1F0, v70, (uint64_t)v71, (uint64_t)v4);
          sub_185F43818();
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Cached personaVocuherDictionary is :%@",  v73,  v74,  v75,  v76,  v77,  v78,  qword_18C49E1F0);
        }

        else
        {
          sub_185F43818();
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"could not generate a cached Copy after adoption for Account:%@",  v116,  v117,  v118,  v119,  v120,  v121,  (uint64_t)v4);
        }

        v122 = (void *)objc_claimAutoreleasedReturnValue();
        sub_185F43A98((uint64_t)v72, v122);

        goto LABEL_14;
      }
    }

    else
    {
      sub_185F43818();
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, @"has NO Cache key", v89, v90, v91, v92, v93, v94, v124);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A98((uint64_t)v88, v95);
    }
  }

  sub_185F43818();
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"No Cached Copy of voucher for Account:%@, generating one from usermanagerd",  v97,  v98,  v99,  v100,  v101,  v102,  (uint64_t)v4);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v96, v103);

  int v104 = mach_voucher_persona_self();
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v105, *MEMORY[0x189607630], v104, 0);
  id v87 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F436A0();
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to get existing mach voucher Port with error:%@",  v107,  v108,  v109,  v110,  v111,  v112,  (uint64_t)v87);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v106, v113);

  if (!v87) {
    goto LABEL_19;
  }
  if (a3)
  {
    id v87 = v87;
    uint64_t v114 = 0LL;
    *a3 = v87;
  }

  else
  {
    uint64_t v114 = 0LL;
  }

LABEL_20:
  return v114;
}

id sub_185F3A96C()
{
  if (byte_18C49E258)
  {
    uint64_t v41 = 0LL;
    uint64_t v42 = &v41;
    uint64_t v43 = 0x3032000000LL;
    uint64_t v44 = sub_185F38B70;
    uint64_t v45 = sub_185F38B80;
    id v46 = 0LL;
    uint64_t v35 = 0LL;
    uint64_t v36 = &v35;
    uint64_t v37 = 0x3032000000LL;
    uint64_t v38 = sub_185F38B70;
    uint64_t v39 = sub_185F38B80;
    id v40 = 0LL;
    sub_185F4773C();
    id v0 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F4D830(v0);
    uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v2 = MEMORY[0x1895F87A8];
    v34[0] = MEMORY[0x1895F87A8];
    v34[1] = 3221225472LL;
    v34[2] = sub_185F3ABB8;
    v34[3] = &unk_189DD46E0;
    v34[4] = &v35;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v1, v3, (uint64_t)v34, v4);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v2;
    v33[1] = 3221225472LL;
    v33[2] = sub_185F3AC44;
    v33[3] = &unk_189DD4818;
    v33[4] = &v35;
    v33[5] = &v41;
    objc_msgSend_retrieveUserSessionBlobwithReply_(v5, v6, (uint64_t)v33, v7);

    uint64_t v8 = (void *)v42[5];
    if (v8)
    {
      sub_185F5393C((uint64_t)&OBJC_CLASS___UMUserSwitchContext, v8);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v10 = (void *)v36[5];
      if (v10)
      {
        sub_185F3856C((uint64_t)&OBJC_CLASS___UMAbort, v10, @"get user switch context");
        sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Error retrieving context",  v11,  v12,  v13,  v14,  v15,  v16,  v32);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        sub_185F46B40((uint64_t)v17, @"error: %@", v18, v19, v20, v21, v22, v23, v36[5]);
        sub_185F436A0();
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        sub_185F43A98((uint64_t)v24, v17);
      }

      else
      {
        sub_185F436A0();
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        sub_185F43A40( (uint64_t)v17,  @"Could not retrieve context, but we have no error",  v25,  v26,  v27,  v28,  v29,  v30,  v32);
      }

      uint64_t v9 = 0LL;
    }

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v41, 8);
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

void sub_185F3AB90( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_185F3ABB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F3AC44(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a3);
    sub_185F436A0();
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote retrieveUserSessionBlobwithReply: %@",  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)v5);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v6, v13);
  }

  else
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v15 = v16;
    uint64_t v6 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v15;
  }
}

void sub_185F3AD08()
{
  if (byte_18C49E258)
  {
    uint64_t v30 = 0LL;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000LL;
    uint64_t v33 = sub_185F38B70;
    uint64_t v34 = sub_185F38B80;
    id v35 = 0LL;
    uint64_t v26 = 0LL;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x2020000000LL;
    char v29 = 0;
    sub_185F4773C();
    id v0 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F4D830(v0);
    uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v2 = MEMORY[0x1895F87A8];
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = sub_185F3AEFC;
    v25[3] = &unk_189DD46E0;
    v25[4] = &v30;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v1, v3, (uint64_t)v25, v4);
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v2;
    v24[1] = 3221225472LL;
    v24[2] = sub_185F3AF88;
    v24[3] = &unk_189DD4840;
    v24[4] = &v30;
    v24[5] = &v26;
    objc_msgSend_deleteUserSessionBlobwithReply_(v5, v6, (uint64_t)v24, v7);

    if (!*((_BYTE *)v27 + 24))
    {
      uint64_t v8 = (void *)v31[5];
      if (v8)
      {
        sub_185F3856C((uint64_t)&OBJC_CLASS___UMAbort, v8, @"delete user switch context");
        sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Error deleting context",  v9,  v10,  v11,  v12,  v13,  v14,  v23);
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        sub_185F46B40((uint64_t)v15, @"error: %@", v16, v17, v18, v19, v20, v21, v31[5]);
        sub_185F436A0();
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        sub_185F43A98((uint64_t)v22, v15);
      }
    }

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);
  }

void sub_185F3AED4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_185F3AEFC(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F3AF88(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v13 = (uint64_t)v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    sub_185F436A0();
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote deleteUserSessionBlobwithReply: %@",  v6,  v7,  v8,  v9,  v10,  v11,  v13);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v5, v12);

    id v4 = (id)v13;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

id sub_185F3B034(uint64_t a1, void *a2, void *a3)
{
  v60[1] = *MEMORY[0x1895F89C0];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_self();
  objc_opt_self();
  if (!byte_18C49E258)
  {
    sub_185F3B4B0(v6, v4, v5);
    sub_185F3B59C(v6, v4);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v51 = 0LL;
    sub_185F3BCC0(v6, v12, v5, &v51);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = v51;
    uint64_t v16 = v15;
    uint64_t v13 = 0LL;
    if (v14 || !v15) {
      goto LABEL_21;
    }
    sub_185F3856C((uint64_t)&OBJC_CLASS___UMAbort, v15, @"load user");
    uint64_t v20 = objc_msgSend_code(v16, v17, v18, v19);
    uint64_t v55 = *MEMORY[0x189607798];
    v56 = v16;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v21, (uint64_t)&v56, (uint64_t)&v55, 1);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = (void *)objc_msgSend_mutableCopy(v22, v23, v24, v25);

    if (v20 == -15) {
      goto LABEL_16;
    }
    if (v20 != 73)
    {
      if (v20 != -14) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }

LABEL_17:
    unint64_t v42 = 9LL;
    goto LABEL_20;
  }

  if (sub_185F3B3F4(v6, v4) <= 0.0)
  {
    sub_185F3B4B0(v6, v4, v5);
    sub_185F3B59C(v6, v4);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v54 = 0LL;
    sub_185F3BCC0(v6, v12, v5, &v54);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v27 = v54;
    uint64_t v16 = v27;
    uint64_t v13 = 0LL;
    if (v14 || !v27) {
      goto LABEL_21;
    }
    sub_185F3856C((uint64_t)&OBJC_CLASS___UMAbort, v27, @"load user");
    uint64_t v31 = objc_msgSend_code(v16, v28, v29, v30);
    uint64_t v59 = *MEMORY[0x189607798];
    v60[0] = v16;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v32, (uint64_t)v60, (uint64_t)&v59, 1);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = (void *)objc_msgSend_mutableCopy(v33, v34, v35, v36);

    if (v31 != 73)
    {
      if (v31 != -14)
      {
        if (v31 == -15)
        {
          objc_msgSend_sharedManager(UMUserManager, v37, v38, v39);
          id v40 = (void *)objc_claimAutoreleasedReturnValue();
          v52[0] = MEMORY[0x1895F87A8];
          v52[1] = 3221225472LL;
          v52[2] = sub_185F3BEE0;
          v52[3] = &unk_189DD4868;
          id v53 = v4;
          objc_msgSend_disableUser_completionHandler_(v40, v41, (uint64_t)v53, (uint64_t)v52);

LABEL_16:
          unint64_t v42 = 4LL;
LABEL_20:
          sub_185F3737C((uint64_t)&OBJC_CLASS___UMError, v42, v26);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
          goto LABEL_22;
        }

LABEL_19:
        unint64_t v42 = 3LL;
        goto LABEL_20;
      }

      uint64_t v14 = 0LL;
LABEL_20:
      free(v14);
    }
  }

  else
  {
    if (qword_18C682AE8 != -1) {
      dispatch_once(&qword_18C682AE8, &unk_189DD4A58);
    }
    uint64_t v9 = (os_log_s *)(id)qword_18C682AD8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = sub_185F385E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = v12 & 0xFFFFFFFE;
      }
      if (v13) {
        goto LABEL_17;
      }
      goto LABEL_19;
    }
  }

  return v8 == 0;
}

      uint64_t v10 = 0LL;
LABEL_20:
      free(v10);
    }
  }

  else
  {
    if (qword_18C682AE8 != -1) {
      dispatch_once(&qword_18C682AE8, &unk_189DD4A58);
    }
    id v5 = (os_log_s *)(id)qword_18C682AD8;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = sub_185F385E4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = v8 & 0xFFFFFFFE;
      }
      if (v9) {
        goto LABEL_17;
      }
      goto LABEL_19;
    }
  }

  return v4 == 0;
}

LABEL_18:
      uint64_t v43 = (void *)MEMORY[0x189607968];
      double v44 = sub_185F3B3F4(v6, v4);
      objc_msgSend_numberWithDouble_(v43, v45, v46, v47, v44);
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_( v26,  v49,  (uint64_t)v48,  (uint64_t)@"UMErrorPasscodeBackOffInterval");

      unint64_t v42 = 6LL;
      goto LABEL_20;
    }

    goto LABEL_17;
  }

  v57 = @"UMErrorPasscodeBackOffInterval";
  objc_msgSend_numberWithDouble_(MEMORY[0x189607968], v7, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v58 = v10;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v11, (uint64_t)&v58, (uint64_t)&v57, 1);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  sub_185F3737C((uint64_t)&OBJC_CLASS___UMError, 6uLL, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v13;
}

double sub_185F3B3F4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_self();
  objc_msgSend_sharedManager(UMUserManager, v4, v5, v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = objc_msgSend_userExists_(v7, v8, (uint64_t)v2, v9);

  double v11 = -1.0;
  if (v10)
  {
    sub_185F3D96C(v3, v2);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    UserLockStateInfo = (void *)MKBUserSessionGetUserLockStateInfo();
    objc_msgSend_objectForKeyedSubscript_(UserLockStateInfo, v14, *MEMORY[0x189611560], v15);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v16, v17, v18, v19);
    double v11 = v20;
  }

  return v11;
}

void sub_185F3B4B0(uint64_t a1, void *a2, void *a3)
{
  id v27 = a2;
  id v4 = a3;
  objc_opt_self();
  if (v4)
  {
    id v5 = objc_alloc(NSString);
    uint64_t v7 = (void *)objc_msgSend_initWithData_encoding_(v5, v6, (uint64_t)v4, 4);
    objc_msgSend_decimalDigitCharacterSet(MEMORY[0x189607810], v8, v9, v10);
    double v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByTrimmingCharactersInSet_(v7, v12, (uint64_t)v11, v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = objc_msgSend_length(v14, v15, v16, v17);

    if (!v18)
    {
      if (objc_msgSend_length(v7, v19, v20, v21) == 4)
      {
        objc_msgSend_setPasscodeType_(v27, v22, 0, v24);
      }

      else if (objc_msgSend_length(v7, v22, v23, v24) == 6)
      {
        objc_msgSend_setPasscodeType_(v27, v25, 1, v26);
      }
    }
  }
}

id sub_185F3B59C(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_self();
  sub_185F3E5E4();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_alternateDSID(v2, v4, v5, v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_alternateDSID(v2, v8, v9, v10);
    double v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v12, (uint64_t)v11, kUMUserSessionAlternateDSIDKey);
  }

  objc_msgSend_username(v2, v8, v9, v10);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_username(v2, v14, v15, v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v18, (uint64_t)v17, kUMUserSessionNameKey);
  }

  objc_msgSend_givenName(v2, v14, v15, v16);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend_givenName(v2, v20, v21, v22);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)v23, kUMUserSessionFirstNameKey);
  }

  objc_msgSend_familyName(v2, v20, v21, v22);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend_familyName(v2, v26, v27, v28);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v30, (uint64_t)v29, kUMUserSessionLastNameKey);
  }

  objc_msgSend_displayName(v2, v26, v27, v28);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend_displayName(v2, v32, v33, v34);
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v36, (uint64_t)v35, kUMUserSessionDisplayNameKey);
  }

  objc_msgSend_photoURL(v2, v32, v33, v34);
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend_photoURL(v2, v38, v39, v40);
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_absoluteString(v41, v42, v43, v44);
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v46, (uint64_t)v45, kUMUserSessionFileInfoKey);
  }

  objc_msgSend_userAuxiliaryString(v2, v38, v39, v40);
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend_userAuxiliaryString(v2, v48, v49, v50);
    id v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v52, (uint64_t)v51, kUMUserSessionLanguageKey);
  }

  objc_msgSend_lastRemoteAuthDate(v2, v48, v49, v50);
  id v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    objc_msgSend_lastRemoteAuthDate(v2, v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v58, (uint64_t)v57, kUMUserSessionCloudLoginTimeStampKey);
  }

  uint64_t v59 = (void *)MEMORY[0x189607968];
  uint64_t isAuditor = objc_msgSend_isAuditor(v2, v54, v55, v56);
  objc_msgSend_numberWithBool_(v59, v61, isAuditor, v62);
  uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v64, (uint64_t)v63, kUMUserSessionAuditorKey);

  uint64_t v65 = (void *)MEMORY[0x189607968];
  uint64_t isDisabled = objc_msgSend_isDisabled(v2, v66, v67, v68);
  objc_msgSend_numberWithBool_(v65, v70, isDisabled, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v73, (uint64_t)v72, kUMUserSessionDisabledKey);

  uint64_t v74 = (void *)MEMORY[0x189607968];
  uint64_t isTransientUser = objc_msgSend_isTransientUser(v2, v75, v76, v77);
  objc_msgSend_numberWithBool_(v74, v79, isTransientUser, v80);
  uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v82, (uint64_t)v81, kUMUserSessionisTransientKey);

  uint64_t v83 = (void *)MEMORY[0x189607968];
  uint64_t isPrimaryUser = objc_msgSend_isPrimaryUser(v2, v84, v85, v86);
  objc_msgSend_numberWithBool_(v83, v88, isPrimaryUser, v89);
  uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v91, (uint64_t)v90, kUMUserSessionisPrimaryKey);

  uint64_t v92 = (void *)MEMORY[0x189607968];
  uint64_t isAdminUser = objc_msgSend_isAdminUser(v2, v93, v94, v95);
  objc_msgSend_numberWithBool_(v92, v97, isAdminUser, v98);
  uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v100, (uint64_t)v99, kUMUserSessionisAdminKey);

  uint64_t v101 = (void *)MEMORY[0x189607968];
  uint64_t v105 = objc_msgSend_passcodeLockGracePeriod(v2, v102, v103, v104);
  objc_msgSend_numberWithUnsignedInteger_(v101, v106, v105, v107);
  uint64_t v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v109, (uint64_t)v108, kUMUserSessionRequiresPasscodeKey);

  uint64_t v110 = (void *)objc_opt_new();
  uint64_t v111 = (void *)MEMORY[0x189607968];
  uint64_t v115 = objc_msgSend_passcodeType(v2, v112, v113, v114);
  objc_msgSend_numberWithUnsignedInteger_(v111, v116, v115, v117);
  uint64_t v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v110, v119, (uint64_t)v118, (uint64_t)@"passcodeType");

  objc_msgSend_languages(v2, v120, v121, v122);
  uint64_t v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v110, v124, (uint64_t)v123, (uint64_t)@"languages");

  v125 = (void *)MEMORY[0x189607968];
  uint64_t hasManagedCredentials = objc_msgSend_hasManagedCredentials(v2, v126, v127, v128);
  objc_msgSend_numberWithBool_(v125, v130, hasManagedCredentials, v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v110, v133, (uint64_t)v132, (uint64_t)@"hasManagedCredentials");

  objc_msgSend_errorCausingLogout(v2, v134, v135, v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();

  if (v137)
  {
    v141 = (void *)MEMORY[0x1896078F8];
    objc_msgSend_errorCausingLogout(v2, v138, v139, v140);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    id v198 = 0LL;
    objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(v141, v143, (uint64_t)v142, 1, &v198);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    id v145 = v198;

    objc_msgSend_setObject_forKeyedSubscript_(v110, v146, (uint64_t)v144, (uint64_t)@"errorCausingLogout");
    sub_185F436A0();
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    if (v144)
    {
      v154 = @"Successful archive of logout error\n";
    }

    else
    {
      uint64_t v195 = (uint64_t)v145;
      v154 = @"Failed to archive the logout error with an error:%@ \n";
    }

    sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, v154, v147, v148, v149, v150, v151, v152, v195);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v153, v155);
  }

  else
  {
    id v145 = 0LL;
  }

  objc_msgSend_debugErrorCausingLogout(v2, v138, v139, v140);
  v156 = (void *)objc_claimAutoreleasedReturnValue();

  if (v156)
  {
    v160 = (void *)MEMORY[0x1896078F8];
    objc_msgSend_debugErrorCausingLogout(v2, v157, v158, v159);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    id v197 = v145;
    objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(v160, v162, (uint64_t)v161, 1, &v197);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    id v164 = v197;

    objc_msgSend_setObject_forKeyedSubscript_(v110, v165, (uint64_t)v163, (uint64_t)@"debugErrorCausingLogout");
    sub_185F436A0();
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    if (v163)
    {
      v173 = @"Successful archive of debug logout error\n";
    }

    else
    {
      uint64_t v195 = (uint64_t)v164;
      v173 = @"Failed to archive the debug logout error with an error:%@ \n";
    }

    sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, v173, v166, v167, v168, v169, v170, v171, v195);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v172, v174);
  }

  else
  {
    id v164 = v145;
  }

  id v196 = 0LL;
  objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1896079E8], v157, (uint64_t)v110, 200, 0, &v196);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  if (v175)
  {
    uint64_t v176 = kUMUserSessionOpaqueDataKey;
    id v177 = v196;
    objc_msgSend_setObject_forKeyedSubscript_(v3, v178, (uint64_t)v175, v176);
  }

  else
  {
    id v179 = v196;
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Could not save user's opaque data",  v180,  v181,  v182,  v183,  v184,  v185,  v195);
    id v177 = (id)objc_claimAutoreleasedReturnValue();
    sub_185F46B40((uint64_t)v177, @"error: %@", v186, v187, v188, v189, v190, v191, (uint64_t)v179);

    sub_185F436A0();
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v192, v177);
  }

  id v193 = v3;
  return v193;
}

id sub_185F3BCC0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = objc_opt_self();
  uint64_t v36 = 0LL;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  uint64_t v39 = sub_185F38B70;
  uint64_t v40 = sub_185F38B80;
  id v41 = 0LL;
  uint64_t v30 = 0LL;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  uint64_t v33 = sub_185F38B70;
  uint64_t v34 = sub_185F38B80;
  id v35 = 0LL;
  if (v7 && (uint64_t v12 = v8, objc_msgSend_length(v7, v9, v10, v11)))
  {
    sub_185F3BF74(v12, v7);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend_length(v7, v14, v15, v16);
  }

  else
  {
    uint64_t v13 = 0LL;
    uint64_t v17 = 0LL;
  }

  sub_185F4773C();
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4D830(v18);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v20 = MEMORY[0x1895F87A8];
  v29[0] = MEMORY[0x1895F87A8];
  v29[1] = 3221225472LL;
  v29[2] = sub_185F3C090;
  v29[3] = &unk_189DD46E0;
  v29[4] = &v30;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v19, v21, (uint64_t)v29, v22);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v20;
  v28[1] = 3221225472LL;
  v28[2] = sub_185F3C11C;
  v28[3] = &unk_189DD4890;
  v28[4] = &v36;
  v28[5] = &v30;
  objc_msgSend_loadUserSession_withSecret_oldSize_reply_(v23, v24, (uint64_t)v6, (uint64_t)v13, v17, v28);

  if (a4)
  {
    uint64_t v25 = (void *)v31[5];
    if (v25) {
      *a4 = v25;
    }
  }

  id v26 = (id)v37[5];

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v26;
}

void sub_185F3BEB8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_185F3BEE0(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = *(void **)(a1 + 32);
    id v3 = a2;
    sub_185F46CA8((uint64_t)&OBJC_CLASS___UMLogMessage, v2, @"Could not disable user", v4, v5, v6, v7, v8, v16);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    sub_185F46B40((uint64_t)v17, @"error: %@", v9, v10, v11, v12, v13, v14, (uint64_t)v3);

    sub_185F436A0();
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v15, v17);
  }

id sub_185F3BF74(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  objc_opt_self();
  if (!v2) {
    goto LABEL_6;
  }
  uint64_t v6 = (void *)objc_msgSend_length(v2, v3, v4, v5);
  if (v6)
  {
    if (pipe(v25) != -1)
    {
      int v7 = v25[1];
      id v8 = v2;
      uint64_t v12 = (const void *)objc_msgSend_bytes(v8, v9, v10, v11);
      write(v7, v12, (size_t)v6);
      close(v25[1]);
      id v13 = objc_alloc(MEMORY[0x189607898]);
      uint64_t v6 = (void *)objc_msgSend_initWithFileDescriptor_closeOnDealloc_(v13, v14, v25[0], 1);
      goto LABEL_7;
    }

    int v15 = *__error();
    sub_185F436A0();
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v17 = strerror(v15);
    sub_185F43C5C((uint64_t)v16, @"failed to get fds(1) with error:%s", v18, v19, v20, v21, v22, v23, (uint64_t)v17);

LABEL_6:
    uint64_t v6 = 0LL;
  }

LABEL_7:
  return v6;
}

    uint64_t v23 = 0LL;
    goto LABEL_8;
  }

  objc_msgSend_currentUser(v6, v7, v8, v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11) {
    goto LABEL_7;
  }
  int v15 = objc_msgSend_uid(v11, v12, v13, v14);
  uint64_t v16 = objc_alloc(NSString);
  uint64_t v19 = objc_msgSend_initWithFormat_(v16, v17, (uint64_t)@"%d", v18, v15);
LABEL_6:
  uint64_t v23 = (void *)v19;
LABEL_8:

  return v23;
}

void sub_185F3C090(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F3C11C(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  }
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
  }
}

uint64_t sub_185F3C19C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = objc_opt_self();
  uint64_t v34 = 0LL;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  uint64_t v37 = sub_185F38B70;
  uint64_t v38 = sub_185F38B80;
  id v39 = 0LL;
  uint64_t v30 = 0LL;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000LL;
  char v33 = 0;
  if (v7 && (uint64_t v12 = v8, objc_msgSend_length(v7, v9, v10, v11)))
  {
    sub_185F3BF74(v12, v7);
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend_length(v7, v14, v15, v16);
  }

  else
  {
    id v13 = 0LL;
    uint64_t v17 = 0LL;
  }

  sub_185F4773C();
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4D830(v18);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v20 = MEMORY[0x1895F87A8];
  v29[0] = MEMORY[0x1895F87A8];
  v29[1] = 3221225472LL;
  v29[2] = sub_185F3C3B0;
  v29[3] = &unk_189DD46E0;
  v29[4] = &v34;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v19, v21, (uint64_t)v29, v22);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v20;
  v28[1] = 3221225472LL;
  v28[2] = sub_185F3C43C;
  v28[3] = &unk_189DD4840;
  v28[4] = &v34;
  v28[5] = &v30;
  objc_msgSend_dataMigrationSetup_withSecret_oldSize_reply_(v23, v24, (uint64_t)v6, (uint64_t)v13, v17, v28);

  if (a4)
  {
    uint64_t v25 = (void *)v35[5];
    if (v25) {
      *a4 = v25;
    }
  }

  uint64_t v26 = *((unsigned __int8 *)v31 + 24);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v26;
}

void sub_185F3C388( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_185F3C3B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F3C43C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    id v4 = v5;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

uint64_t sub_185F3C49C(uint64_t a1, void *a2)
{
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_185F38B70;
  uint64_t v24 = sub_185F38B80;
  id v25 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  sub_185F4773C();
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4D830(v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = sub_185F3C628;
  v15[3] = &unk_189DD46E0;
  v15[4] = &v20;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v4, v6, (uint64_t)v15, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v14[1] = 3221225472LL;
  v14[2] = sub_185F3C6B4;
  v14[3] = &unk_189DD4840;
  v14[4] = &v20;
  v14[5] = &v16;
  objc_msgSend_migrateSharedAndPrimaryUserVolumeWithReply_(v8, v9, (uint64_t)v14, v10);

  if (a2)
  {
    uint64_t v11 = (void *)v21[5];
    if (v11) {
      *a2 = v11;
    }
  }

  uint64_t v12 = *((unsigned __int8 *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v12;
}

void sub_185F3C604( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_185F3C628(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F3C6B4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    id v4 = v5;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

uint64_t sub_185F3C714(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  objc_opt_self();
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_185F38B70;
  id v25 = sub_185F38B80;
  id v26 = 0LL;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  sub_185F4773C();
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4D830(v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = MEMORY[0x1895F87A8];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = sub_185F3C8C0;
  v16[3] = &unk_189DD46E0;
  v16[4] = &v21;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v6, v8, (uint64_t)v16, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = 3221225472LL;
  v15[2] = sub_185F3C94C;
  v15[3] = &unk_189DD4840;
  v15[4] = &v21;
  void v15[5] = &v17;
  objc_msgSend_migrateGuestUserVolume_withReply_(v10, v11, (uint64_t)v4, (uint64_t)v15);

  if (a3)
  {
    uint64_t v12 = (void *)v22[5];
    if (v12) {
      *a3 = v12;
    }
  }

  uint64_t v13 = *((unsigned __int8 *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v13;
}

void sub_185F3C89C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_185F3C8C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F3C94C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    id v4 = v5;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

id sub_185F3C9AC(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_self();
  sub_185F3B59C(v3, v2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = 0LL;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 0;
  uint64_t v19 = 0LL;
  char v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_185F38B70;
  uint64_t v23 = sub_185F38B80;
  id v24 = 0LL;
  if (v5)
  {
    sub_185F4773C();
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F4D830(v6);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v8 = MEMORY[0x1895F87A8];
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_185F3CBD8;
    v18[3] = &unk_189DD46E0;
    v18[4] = &v19;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v7, v9, (uint64_t)v18, v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    v17[1] = 3221225472LL;
    v17[2] = sub_185F3CC64;
    v17[3] = &unk_189DD4840;
    v17[4] = &v19;
    v17[5] = &v25;
    objc_msgSend_removeUserSession_reply_(v11, v12, (uint64_t)v5, (uint64_t)v17);

    if (*((_BYTE *)v26 + 24) || (uint64_t v15 = (void *)v20[5]) == 0LL)
    {
      uint64_t v13 = 0LL;
    }

    else
    {
      sub_185F3856C((uint64_t)&OBJC_CLASS___UMAbort, v15, @"delete user");
      sub_185F37464((uint64_t)&OBJC_CLASS___UMError, 8uLL, (void *)v20[5]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    id v14 = v13;
  }

  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v4, *MEMORY[0x189607688], 22, 0);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v14;
}

void sub_185F3CBB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_185F3CBD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F3CC64(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v14 = (uint64_t)v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    sub_185F436A0();
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote removeUserSession: %@",  v6,  v7,  v8,  v9,  v10,  v11,  v14);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v5, v12);

    id v4 = (id)v14;
    char v13 = 0;
  }

  else
  {
    char v13 = 1;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v13;
}

id sub_185F3CD1C(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_self();
  id v4 = (void *)objc_opt_new();
  sub_185F3CD7C(v3, v2, v4);

  return v4;
}

void sub_185F3CD7C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_self();
  if (v4)
  {
    id v6 = v5;
    objc_msgSend_objectForKeyedSubscript_(v4, v7, kUMUserSessionIDKey, v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = objc_msgSend_unsignedIntValue(v9, v10, v11, v12);
    objc_msgSend_setUid_(v6, v14, v13, v15);

    objc_msgSend_objectForKeyedSubscript_(v4, v16, kUMUserSessionGroupIDKey, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = objc_msgSend_unsignedIntValue(v18, v19, v20, v21);
    objc_msgSend_setGid_(v6, v23, v22, v24);

    objc_msgSend_objectForKeyedSubscript_(v4, v25, kUMUserSessionAlternateDSIDKey, v26);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v30 = (uint64_t *)&kUMUserSessionUUIDKey;
    if (v27) {
      uint64_t v30 = (uint64_t *)&kUMUserSessionAlternateDSIDKey;
    }
    objc_msgSend_objectForKeyedSubscript_(v4, v28, *v30, v29);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAlternateDSID_(v6, v32, (uint64_t)v31, v33);

    objc_msgSend_objectForKeyedSubscript_(v4, v34, kUMUserSessionHomeDirKey, v35);
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend_URLWithString_(MEMORY[0x189604030], v36, (uint64_t)v38, v37);
      id v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setHomeDirectoryURL_(v6, v40, (uint64_t)v39, v41);
    }

    objc_msgSend_objectForKeyedSubscript_(v4, v36, kUMUserSessionNameKey, v37);
    unint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUsername_(v6, v43, (uint64_t)v42, v44);

    objc_msgSend_objectForKeyedSubscript_(v4, v45, kUMUserSessionFirstNameKey, v46);
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGivenName_(v6, v48, (uint64_t)v47, v49);

    objc_msgSend_objectForKeyedSubscript_(v4, v50, kUMUserSessionLastNameKey, v51);
    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFamilyName_(v6, v53, (uint64_t)v52, v54);

    objc_msgSend_objectForKeyedSubscript_(v4, v55, kUMUserSessionDisplayNameKey, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDisplayName_(v6, v58, (uint64_t)v57, v59);

    objc_msgSend_objectForKeyedSubscript_(v4, v60, kUMUserSessionFileInfoKey, v61);
    uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64)
    {
      objc_msgSend_URLWithString_(MEMORY[0x189604030], v62, (uint64_t)v64, v63);
      uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPhotoURL_(v6, v66, (uint64_t)v65, v67);
    }

    objc_msgSend_objectForKeyedSubscript_(v4, v62, kUMUserSessionLanguageKey, v63);
    uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserAuxiliaryString_(v6, v69, (uint64_t)v68, v70);

    objc_msgSend_objectForKeyedSubscript_(v4, v71, kUMUserSessionCreateTimeStampKey, v72);
    uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCreationDate_(v6, v74, (uint64_t)v73, v75);

    objc_msgSend_objectForKeyedSubscript_(v4, v76, kUMUserSessionLoginTimeStampKey, v77);
    uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastLoginDate_(v6, v79, (uint64_t)v78, v80);

    objc_msgSend_objectForKeyedSubscript_(v4, v81, kUMUserSessionCloudLoginTimeStampKey, v82);
    uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastRemoteAuthDate_(v6, v84, (uint64_t)v83, v85);

    objc_msgSend_objectForKeyedSubscript_(v4, v86, kUMUserSessionLoginUserKey, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v92 = objc_msgSend_BOOLValue(v88, v89, v90, v91);
    objc_msgSend_setIsLoginUser_(v6, v93, v92, v94);

    objc_msgSend_objectForKeyedSubscript_(v4, v95, kUMUserSessionAuditorKey, v96);
    uint64_t v97 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v101 = objc_msgSend_BOOLValue(v97, v98, v99, v100);
    objc_msgSend_setIsAuditor_(v6, v102, v101, v103);

    objc_msgSend_objectForKeyedSubscript_(v4, v104, kUMUserSessionDisabledKey, v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v110 = objc_msgSend_BOOLValue(v106, v107, v108, v109);
    objc_msgSend_setIsDisabled_(v6, v111, v110, v112);

    objc_msgSend_objectForKeyedSubscript_(v4, v113, kUMUserSessionisTransientKey, v114);
    uint64_t v115 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v119 = objc_msgSend_BOOLValue(v115, v116, v117, v118);
    objc_msgSend_setIsTransientUser_(v6, v120, v119, v121);

    objc_msgSend_objectForKeyedSubscript_(v4, v122, kUMUserSessionisPrimaryKey, v123);
    uint64_t v124 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v128 = objc_msgSend_BOOLValue(v124, v125, v126, v127);
    objc_msgSend_setIsPrimaryUser_(v6, v129, v128, v130);

    objc_msgSend_objectForKeyedSubscript_(v4, v131, kUMUserSessionisAdminKey, v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v137 = objc_msgSend_BOOLValue(v133, v134, v135, v136);
    objc_msgSend_setIsAdminUser_(v6, v138, v137, v139);

    objc_msgSend_objectForKeyedSubscript_(v4, v140, kUMUserSessionRequiresPasscodeKey, v141);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v146 = objc_msgSend_unsignedLongValue(v142, v143, v144, v145);
    objc_msgSend_setPasscodeLockGracePeriod_(v6, v147, v146, v148);

    objc_msgSend_objectForKeyedSubscript_(v4, v149, kUMUserSessionQuotaLimitKey, v150);
    uint64_t v151 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v155 = objc_msgSend_unsignedLongLongValue(v151, v152, v153, v154);
    objc_msgSend_setDataQuota_(v6, v156, v155, v157);

    objc_msgSend_objectForKeyedSubscript_(v4, v158, kUMUserSessionQuotaUsedKey, v159);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v164 = objc_msgSend_unsignedLongLongValue(v160, v161, v162, v163);
    objc_msgSend_setDataUsed_(v6, v165, v164, v166);

    objc_msgSend_objectForKeyedSubscript_(v4, v167, kUMUserSessionDirtyKey, v168);
    uint64_t v169 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v173 = objc_msgSend_BOOLValue(v169, v170, v171, v172);
    objc_msgSend_setHasDataToSync_(v6, v174, v173, v175);

    objc_msgSend_objectForKeyedSubscript_(v4, v176, kUMUserSessionFirstLoginStartTimeKey, v177);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFirstLoginStartDate_(v6, v179, (uint64_t)v178, v180);

    objc_msgSend_objectForKeyedSubscript_(v4, v181, kUMUserSessionFirstLoginEndTimeKey, v182);
    uint64_t v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFirstLoginEndDate_(v6, v184, (uint64_t)v183, v185);

    objc_msgSend_objectForKeyedSubscript_(v4, v186, kUMUserSessionCachedLoginStartTimeKey, v187);
    uint64_t v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastCachedLoginStartDate_(v6, v189, (uint64_t)v188, v190);

    objc_msgSend_objectForKeyedSubscript_(v4, v191, kUMUserSessionCachedLoginEndTimeKey, v192);
    id v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastCachedLoginEndDate_(v6, v194, (uint64_t)v193, v195);

    objc_msgSend_objectForKeyedSubscript_(v4, v196, kUMUserSessionLogoutStartTimeKey, v197);
    id v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastLogoutStartDate_(v6, v199, (uint64_t)v198, v200);

    objc_msgSend_objectForKeyedSubscript_(v4, v201, kUMUserSessionLogoutEndTimeKey, v202);
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastLogoutEndDate_(v6, v204, (uint64_t)v203, v205);

    objc_msgSend_objectForKeyedSubscript_(v4, v206, kUMUserSessionOpaqueDataKey, v207);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v209) {
      goto LABEL_32;
    }
    id v291 = 0LL;
    objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1896079E8], v208, (uint64_t)v209, 0, &v292, &v291);
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    id v211 = v291;
    v212 = (void *)MEMORY[0x189604010];
    uint64_t v213 = objc_opt_class();
    uint64_t v278 = 0LL;
    objc_msgSend_setWithObjects_(v212, v214, v213, v215);
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    if (v210)
    {
      if (v292 != 200) {
        goto LABEL_31;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_31;
      }
      uint64_t v287 = (uint64_t)v216;
      objc_msgSend_objectForKeyedSubscript_(v210, v217, (uint64_t)@"passcodeType", v218);
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      v223 = v219;
      if (v219)
      {
        uint64_t v224 = objc_msgSend_unsignedLongValue(v219, v220, v221, v222);
        objc_msgSend_setPasscodeType_(v6, v225, v224, v226);
      }

      v286 = v223;
      objc_msgSend_objectForKeyedSubscript_(v210, v220, (uint64_t)@"languages", v222);
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setLanguages_(v6, v228, (uint64_t)v227, v229);

      objc_msgSend_objectForKeyedSubscript_(v210, v230, (uint64_t)@"hasManagedCredentials", v231);
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      v236 = v232;
      if (v232)
      {
        uint64_t v237 = objc_msgSend_BOOLValue(v232, v233, v234, v235);
        objc_msgSend_setHasManagedCredentials_(v6, v238, v237, v239);
      }

      v285 = v236;
      uint64_t v240 = objc_msgSend_objectForKeyedSubscript_(v210, v233, (uint64_t)@"errorCausingLogout", v235);
      v284 = (void *)v240;
      v288 = v38;
      if (v240)
      {
        id v282 = v211;
        id v290 = 0LL;
        objc_msgSend_unarchivedObjectOfClasses_fromData_error_(MEMORY[0x189607908], v241, v287, v240, &v290);
        v243 = (void *)objc_claimAutoreleasedReturnValue();
        id v244 = v290;
        objc_msgSend_setErrorCausingLogout_(v6, v245, (uint64_t)v243, v246);
        sub_185F436A0();
        v253 = (void *)objc_claimAutoreleasedReturnValue();
        if (v243)
        {
          v254 = @"Successful Unarchive of logout error\n";
        }

        else
        {
          uint64_t v278 = (uint64_t)v244;
          v254 = @"Failed to Unarchive logout error with error:%@ \n";
        }

        sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, v254, v247, v248, v249, v250, v251, v252, v278);
        v264 = (void *)objc_claimAutoreleasedReturnValue();
        sub_185F43A98((uint64_t)v253, v264);

        id v211 = v282;
        v263 = v244;
      }

      else
      {
        v263 = 0LL;
      }

      objc_msgSend_objectForKeyedSubscript_(v210, v241, (uint64_t)@"debugErrorCausingLogout", v242);
      v266 = (void *)objc_claimAutoreleasedReturnValue();
      if (v266)
      {
        id v280 = v5;
        id v255 = v211;
        id v289 = v263;
        v283 = v266;
        uint64_t v267 = objc_msgSend_unarchivedObjectOfClasses_fromData_error_(MEMORY[0x189607908], v265, v287, (uint64_t)v266, &v289);
        id v256 = v289;

        objc_msgSend_setDebugErrorCausingLogout_(v6, v268, v267, v269);
        sub_185F436A0();
        v279 = (void *)objc_claimAutoreleasedReturnValue();
        v281 = (void *)v267;
        if (v267)
        {
          v276 = @"Successful Unarchive of debug logout error \n";
        }

        else
        {
          uint64_t v278 = (uint64_t)v256;
          v276 = @"Failed to Unarchive debug logout error with error:%@ \n";
        }

        sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, v276, v270, v271, v272, v273, v274, v275, v278);
        v277 = (void *)objc_claimAutoreleasedReturnValue();
        id v5 = v280;
        sub_185F43A98((uint64_t)v279, v277);

        v216 = (void *)v287;
        v266 = v283;
      }

      else
      {
        id v255 = v211;
        id v256 = v263;
        v216 = (void *)v287;
      }
    }

    else
    {
      v288 = v38;
      id v255 = v211;
      sub_185F436A0();
      id v256 = (id)objc_claimAutoreleasedReturnValue();
      sub_185F43A40( (uint64_t)v256,  @"Could not properly get user's opaque data",  v257,  v258,  v259,  v260,  v261,  v262,  0LL);
    }

    id v211 = v255;
    uint64_t v38 = v288;
LABEL_31:

LABEL_32:
  }
}

BOOL sub_185F3D6F4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = objc_opt_self();
  objc_opt_self();
  if (byte_18C49E258 && !objc_msgSend_uid(v4, v6, v7, v8))
  {
    BOOL v11 = 0LL;
  }

  else
  {
    uint64_t v9 = objc_msgSend_uid(v4, v6, v7, v8);
    sub_185F3910C(v5, v9, a3);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v11 = v10 != 0LL;
    if (v10) {
      sub_185F3CD7C(v5, v10, v4);
    }
  }

  return v11;
}

id sub_185F3D79C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = objc_opt_self();
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  char v28 = sub_185F38B70;
  uint64_t v29 = sub_185F38B80;
  id v30 = 0LL;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_185F38B70;
  uint64_t v23 = sub_185F38B80;
  id v24 = 0LL;
  sub_185F3D96C(v5, v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4773C();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4D830(v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = sub_185F3DA3C;
  v18[3] = &unk_189DD46E0;
  v18[4] = &v19;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v8, v10, (uint64_t)v18, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v17[1] = 3221225472LL;
  v17[2] = sub_185F3DAC8;
  v17[3] = &unk_189DD4818;
  v17[4] = &v19;
  v17[5] = &v25;
  objc_msgSend_userKeybagOpaqueData_KeybagBlobwithReply_(v12, v13, (uint64_t)v6, (uint64_t)v17);

  if (a3)
  {
    uint64_t v14 = (void *)v20[5];
    if (v14) {
      *a3 = v14;
    }
  }

  id v15 = (id)v26[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v15;
}

void sub_185F3D944( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

id sub_185F3D96C(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x1895F89C0];
  id v2 = a2;
  objc_opt_self();
  uint64_t v14 = kUMUserSessionIDKey;
  uint64_t v3 = (void *)MEMORY[0x189607968];
  uint64_t v7 = objc_msgSend_uid(v2, v4, v5, v6);

  objc_msgSend_numberWithUnsignedInt_(v3, v8, v7, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v11, (uint64_t)v15, (uint64_t)&v14, 1);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void sub_185F3DA3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F3DAC8(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a3);
    sub_185F436A0();
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote KeybagOpaqueDataForUser: %@",  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)v5);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v6, v13);
  }

  else
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v15 = v16;
    uint64_t v6 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v15;
  }
}

uint64_t sub_185F3DB8C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = objc_opt_self();
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  uint64_t v29 = sub_185F38B70;
  id v30 = sub_185F38B80;
  id v31 = 0LL;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 0;
  sub_185F3D96C(v8, v6);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4773C();
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4D830(v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v12 = MEMORY[0x1895F87A8];
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = sub_185F3DD6C;
  v21[3] = &unk_189DD46E0;
  v21[4] = &v26;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v11, v13, (uint64_t)v21, v14);
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472LL;
  v20[2] = sub_185F3DDF8;
  v20[3] = &unk_189DD4840;
  v20[4] = &v26;
  v20[5] = &v22;
  objc_msgSend_setUserKeybagOpaqueData_keybagBlob_withReply_(v15, v16, (uint64_t)v9, (uint64_t)v7, v20);

  if (a4)
  {
    uint64_t v17 = (void *)v27[5];
    if (v17) {
      *a4 = v17;
    }
  }

  uint64_t v18 = *((unsigned __int8 *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v18;
}

void sub_185F3DD44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_185F3DD6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F3DDF8(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v13 = (uint64_t)v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    sub_185F436A0();
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote setUserKeybagOpaqueData: %@",  v6,  v7,  v8,  v9,  v10,  v11,  v13);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v5, v12);

    id v4 = (id)v13;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

uint64_t sub_185F3DEA4()
{
  if (byte_18C49E258 && (byte_18C682B71 & 1) == 0)
  {
    v24[0] = 0LL;
    v24[1] = v24;
    v24[2] = 0x3032000000LL;
    v24[3] = sub_185F38B70;
    v24[4] = sub_185F38B80;
    id v25 = 0LL;
    uint64_t v20 = 0LL;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000LL;
    char v23 = 0;
    sub_185F4773C();
    id v0 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F4D830(v0);
    uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v2 = MEMORY[0x1895F87A8];
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = sub_185F3E0AC;
    v19[3] = &unk_189DD46E0;
    v19[4] = v24;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v1, v3, (uint64_t)v19, v4);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v2;
    v18[1] = 3221225472LL;
    v18[2] = sub_185F3E138;
    v18[3] = &unk_189DD4840;
    v18[4] = v24;
    void v18[5] = &v20;
    objc_msgSend_isLoginSessionwithReply_(v5, v6, (uint64_t)v18, v7);

    byte_18C682B70 = *((_BYTE *)v21 + 24);
    byte_18C682B71 = 1;
    sub_185F436A0();
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (byte_18C682B70) {
      id v15 = "TRUE";
    }
    else {
      id v15 = "FALSE";
    }
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"isLoginSession:%s",  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)v15);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v14, v16);

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(v24, 8);
  }

  return byte_18C682B70;
}

void sub_185F3E088( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_185F3E0AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F3E138(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    id v4 = v5;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

uint64_t sub_185F3E198()
{
  uint64_t result = objc_opt_self();
  byte_18C682B71 = 0;
  return result;
}

BOOL sub_185F3E1B4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = objc_opt_self();
  sub_185F43818();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F46CA8((uint64_t)&OBJC_CLASS___UMLogMessage, v4, @"Commit changes", v7, v8, v9, v10, v11, v27);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v6, v12);

  sub_185F3B59C(v5, v4);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v13, v14, v15, v16))
  {
    uint64_t v36 = 0LL;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x3032000000LL;
    id v39 = sub_185F38B70;
    uint64_t v40 = sub_185F38B80;
    id v41 = 0LL;
    uint64_t v30 = 0LL;
    id v31 = &v30;
    uint64_t v32 = 0x3032000000LL;
    uint64_t v33 = sub_185F38B70;
    uint64_t v34 = sub_185F38B80;
    id v35 = 0LL;
    sub_185F4773C();
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F4D830(v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v19 = MEMORY[0x1895F87A8];
    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 3221225472LL;
    v29[2] = sub_185F3E3E8;
    v29[3] = &unk_189DD46E0;
    v29[4] = &v36;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v18, v20, (uint64_t)v29, v21);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v19;
    v28[1] = 3221225472LL;
    v28[2] = sub_185F3E474;
    v28[3] = &unk_189DD4890;
    v28[4] = &v30;
    v28[5] = &v36;
    objc_msgSend_setUserSessionAttributes_reply_(v22, v23, (uint64_t)v13, (uint64_t)v28);

    uint64_t v24 = v31[5];
    BOOL v25 = v24 != 0;
    if (!v24) {
      sub_185F3E53C(v5, (void *)v37[5], a3);
    }

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v36, 8);
  }

  else
  {
    BOOL v25 = 0LL;
  }

  return v25;
}

void sub_185F3E3C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_185F3E3E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F3E474(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v6 = a3;
  if (v15) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  }
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
    sub_185F436A0();
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote setUserSessionAttributes: %@",  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)v6);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v7, v14);
  }
}

void sub_185F3E53C(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  objc_opt_self();
  id v6 = v17;
  if (v17)
  {
    if (objc_msgSend_code(v17, v4, (uint64_t)v17, v5) == 1)
    {
      sub_185F436A0();
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A40( (uint64_t)v7,  @"Error: this process is not entitled to access user properties",  v8,  v9,  v10,  v11,  v12,  v13,  v16);

      unint64_t v14 = 7LL;
    }

    else
    {
      unint64_t v14 = 8LL;
    }

    id v6 = v17;
    if (a3)
    {
      sub_185F37464((uint64_t)&OBJC_CLASS___UMError, v14, v17);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      id v6 = v17;
      *a3 = v15;
    }
  }
}

id sub_185F3E5E4()
{
  v8[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v7 = kUMUserSessionTypeKey;
  v8[0] = kUMUserSessionManagedDevice;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v0, (uint64_t)v8, (uint64_t)&v7, 1);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)objc_msgSend_mutableCopy(v1, v2, v3, v4);

  return v5;
}

id sub_185F3E684(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_self();
  objc_msgSend_objectForKeyedSubscript_(v2, v3, kUMUserSwitchTaskNameKey, v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v2, v6, kUMUserSwitchTaskReasonKey, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v2, v9, kUMUserSwitchTaskBundleIDKey, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_taskWithName_reason_forBundleID_(UMTask, v12, (uint64_t)v5, (uint64_t)v8, v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v2, v14, kUMUserSwitchTaskPIDKey, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = objc_msgSend_intValue(v16, v17, v18, v19);
  objc_msgSend_setPid_(v13, v21, v20, v22);
  objc_msgSend_objectForKeyedSubscript_(v2, v23, kUMUserSwitchTaskUUIDKey, v24);
  BOOL v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    sub_185F472D8(MEMORY[0x189607AB8], v25);
    uint64_t v26 = (char *)objc_claimAutoreleasedReturnValue();
    sub_185F55EAC(v13, v26);
  }

  return v13;
}

id sub_185F3E7CC(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_self();
  uint64_t v3 = (void *)objc_opt_new();
  objc_msgSend_name(v2, v4, v5, v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_name(v2, v8, v9, v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v12, (uint64_t)v11, kUMUserSwitchTaskNameKey);
  }

  objc_msgSend_reason(v2, v8, v9, v10);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_reason(v2, v14, v15, v16);
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v18, (uint64_t)v17, kUMUserSwitchTaskReasonKey);
  }

  objc_msgSend_bundleID(v2, v14, v15, v16);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend_bundleID(v2, v20, v21, v22);
    char v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)v23, kUMUserSwitchTaskBundleIDKey);
  }

  BOOL v25 = (void *)MEMORY[0x189607968];
  uint64_t v26 = objc_msgSend_pid(v2, v20, v21, v22);
  objc_msgSend_numberWithInt_(v25, v27, v26, v28);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v30, (uint64_t)v29, kUMUserSwitchTaskPIDKey);

  sub_185F3726C((uint64_t)v2);
  id v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    sub_185F3726C((uint64_t)v2);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v32, v33, v34, v35);
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v37, (uint64_t)v36, kUMUserSwitchTaskUUIDKey);
  }

  return v3;
}

uint64_t sub_185F3EAC0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_isEqualToUser_(a2, (const char *)a2, *(void *)(a1 + 32), a4) ^ 1;
}

void sub_185F3EDAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, char a36)
{
}

void sub_185F3EDF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F3EE7C(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v6 = a3;
  if (v15) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  }
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
    sub_185F436A0();
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote listSyncBubbleUserswithReply: %@",  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)v6);
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v7, v14);
  }
}

void sub_185F3F118( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_185F3F13C(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F3F1C8(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v6 = a3;
  if (v15) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  }
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
    sub_185F436A0();
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote listSyncServiceSourcesForUserSession: %@",  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)v6);
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v7, v14);
  }
}

BOOL sub_185F3F298(uint64_t a1, int a2, void *a3, void *a4)
{
  id v6 = a3;
  objc_opt_self();
  uint64_t v34 = 0LL;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  uint64_t v37 = sub_185F38B70;
  uint64_t v38 = sub_185F38B80;
  id v39 = 0LL;
  uint64_t v30 = 0LL;
  id v31 = &v30;
  uint64_t v32 = 0x2020000000LL;
  char v33 = 0;
  sub_185F4773C();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4D830(v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v11 = MEMORY[0x1895F87A8];
  if (a2)
  {
    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 3221225472LL;
    v29[2] = sub_185F3F988;
    v29[3] = &unk_189DD46E0;
    v29[4] = &v34;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v8, v9, (uint64_t)v29, v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = objc_msgSend_uid(v6, v13, v14, v15);
    v28[0] = v11;
    v28[1] = 3221225472LL;
    v28[2] = sub_185F3FA14;
    v28[3] = &unk_189DD4840;
    v28[4] = &v34;
    v28[5] = &v30;
    objc_msgSend_startUserSyncBubble_withReply_(v12, v17, v16, (uint64_t)v28);
  }

  else
  {
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    int v27[2] = sub_185F3FAC0;
    v27[3] = &unk_189DD46E0;
    v27[4] = &v34;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v8, v9, (uint64_t)v27, v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = objc_msgSend_uid(v6, v18, v19, v20);
    v26[0] = v11;
    v26[1] = 3221225472LL;
    v26[2] = sub_185F3FB4C;
    v26[3] = &unk_189DD4840;
    v26[4] = &v34;
    void v26[5] = &v30;
    objc_msgSend_stoptUserSyncBubble_withReply_(v12, v22, v21, (uint64_t)v26);
  }

  int v23 = *((unsigned __int8 *)v31 + 24);
  if (!*((_BYTE *)v31 + 24))
  {
    id v24 = (id)v35[5];
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  id v24 = 0LL;
  if (a4) {
LABEL_6:
  }
    *a4 = v24;
LABEL_7:

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v23 != 0;
}

void sub_185F3F4D8(_Unwind_Exception *a1)
{
}

void sub_185F3F67C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_185F3F6A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F3F72C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v13 = (uint64_t)v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    sub_185F436A0();
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote clearSyncBubbleUserswithReply: %@",  v6,  v7,  v8,  v9,  v10,  v11,  v13);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v5, v12);

    id v4 = (id)v13;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

uint64_t sub_185F3F7D8(uint64_t a1, void *a2)
{
  uint32_t v43 = 0;
  uint64_t v3 = sub_185F3821C(&v43);
  if ((_DWORD)v3)
  {
    uint64_t v5 = v3;
    sub_185F436A0();
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to get multiuser_config flags from kernel with error:%d",  v7,  v8,  v9,  v10,  v11,  v12,  v5);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v6, v13);

    sub_185F436A0();
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v5 == 2) {
      uint64_t v21 = @"FAILED to MKBUserTypeDeviceMode, EPERM";
    }
    else {
      uint64_t v21 = @"FAILED to MKBUserTypeDeviceMode, EINVAL";
    }
    if ((_DWORD)v5 == 2) {
      uint64_t v22 = 1LL;
    }
    else {
      uint64_t v22 = 22LL;
    }
    sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, v21, v14, v15, v16, v17, v18, v19, v42);
    int v23 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v20, v23);
  }

  else
  {
    uint64_t v24 = v43 & 0x3FFFFFFF;
    if ((v43 & 0x80000000) != 0 || v24 > 0x1F4)
    {
      dword_18C681EA0 = v43 & 0x3FFFFFFF;
      return v24;
    }

    uint64_t v22 = 2LL;
  }

  dword_18C681EA0 = -1;
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v4, *MEMORY[0x189607688], v22, 0);
  BOOL v25 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Could not get the foreground UID",  v26,  v27,  v28,  v29,  v30,  v31,  v41);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v32, @"error: %@", v33, v34, v35, v36, v37, v38, (uint64_t)v25);
  sub_185F436A0();
  id v39 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v39, v32);

  if (a2) {
    *a2 = v25;
  }

  uint64_t v24 = dword_18C681EA0;
  return v24;
}

void sub_185F3F988(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F3FA14(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v13 = (uint64_t)v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    sub_185F436A0();
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote startUserSyncBubble: %@",  v6,  v7,  v8,  v9,  v10,  v11,  v13);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v5, v12);

    id v4 = (id)v13;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

void sub_185F3FAC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F3FB4C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v13 = (uint64_t)v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    sub_185F436A0();
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote stoptUserSyncBubble: %@",  v6,  v7,  v8,  v9,  v10,  v11,  v13);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v5, v12);

    id v4 = (id)v13;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

void sub_185F3FBF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F3FC84(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a3);
    sub_185F436A0();
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote getUserSessionAttributes: %@",  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)v5);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v6, v13);
  }

  else
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v15 = v16;
    uint64_t v6 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v15;
  }
}

void sub_185F3FD48()
{
  os_log_t v0 = os_log_create(off_18C6820F0, "persona");
  uint64_t v1 = (void *)qword_18C682AB0;
  qword_18C682AB0 = (uint64_t)v0;
}

void sub_185F3FDF0()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_18C49E250;
  qword_18C49E250 = v0;
}

void sub_185F3FF08(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = 0LL;
  BOOL v5 = sub_185F548EC(v4, &v12);
  id v6 = v12;
  uint64_t v10 = v6;
  if (v5 || !v6)
  {
  }

  else
  {
    uint64_t v11 = objc_msgSend_code(v6, v7, v8, v9);

    if (v11 == 7) {
      byte_18C682B78 = 1;
    }
  }
}

void sub_185F3FFAC(void *a1)
{
  if (a1)
  {
    sub_185F3663C();
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    int v25[2] = sub_185F4008C;
    v25[3] = &unk_189DD4928;
    v25[4] = a1;
    sub_185F3672C((uint64_t)v2, a1, v25);

    objc_msgSend_sharedManager(UMUserManager, v3, v4, v5);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentUser(v6, v7, v8, v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    sub_185F436A0();
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = objc_msgSend_uid(v10, v12, v13, v14);
    sub_185F43A40( (uint64_t)v11,  @"CurrentUser with UID:%d set to refetch attributes",  v16,  v17,  v18,  v19,  v20,  v21,  v15);

    objc_msgSend_refetchUser(v10, v22, v23, v24);
  }

void sub_185F4008C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  *(void *)(v1 + _Block_object_dispose((const void *)(v13 - 112), 8) = 0LL;
}

id *sub_185F40104(id *WeakRetained)
{
  if (WeakRetained) {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 3);
  }
  return WeakRetained;
}

void sub_185F4020C(void **a1, void *a2)
{
  id v3 = a2;
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = sub_185F40364;
  v22[3] = &unk_189DD4950;
  id v23 = a1[7];
  uint64_t v4 = (void (**)(void, void))MEMORY[0x186E2FEC4](v22);
  sub_185F436A0();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F46CA8((uint64_t)&OBJC_CLASS___UMLogMessage, a1[4], @"Load user", v6, v7, v8, v9, v10, v21);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v5, v11);

  if (objc_msgSend_isSharedIPad(v3, v12, v13, v14)
    && !objc_msgSend_isLoginSession(a1[5], v15, v16, v17))
  {
    unint64_t v19 = 0LL;
    goto LABEL_7;
  }

  if (!objc_msgSend_userExists_(v3, v15, (uint64_t)a1[4], v17))
  {
    unint64_t v19 = 2LL;
LABEL_7:
    uint64_t v18 = sub_185F37354((uint64_t)&OBJC_CLASS___UMError, v19);
    goto LABEL_8;
  }

  uint64_t v18 = sub_185F3B034((uint64_t)&OBJC_CLASS___UMMobileKeyBag, a1[4], a1[6]);
LABEL_8:
  uint64_t v20 = (void *)v18;
  v4[2](v4, v18);
}

uint64_t sub_185F40364(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_185F40464(void **a1, void *a2)
{
  id v3 = a2;
  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = sub_185F40610;
  v24[3] = &unk_189DD4950;
  id v25 = a1[7];
  uint64_t v4 = (void (**)(void, void))MEMORY[0x186E2FEC4](v24);
  sub_185F436A0();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F46CA8((uint64_t)&OBJC_CLASS___UMLogMessage, a1[4], @"Create user", v6, v7, v8, v9, v10, v23);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v5, v11);

  else {
    int isLoginSession = 1;
  }
  if (objc_msgSend_isSharedIPad(v3, v15, v16, v17) && sub_185F38F68())
  {
    if (((_os_feature_enabled_impl() | isLoginSession) & 1) == 0)
    {
LABEL_7:
      unint64_t v21 = 0LL;
LABEL_11:
      sub_185F37354((uint64_t)&OBJC_CLASS___UMError, v21);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }

  else if (!isLoginSession)
  {
    goto LABEL_7;
  }

  if (objc_msgSend_userExists_(v3, v19, (uint64_t)a1[4], v20))
  {
    unint64_t v21 = 1LL;
    goto LABEL_11;
  }

  sub_185F3B034((uint64_t)&OBJC_CLASS___UMMobileKeyBag, a1[4], a1[6]);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22) {
    sub_185F3FFAC(v3);
  }
LABEL_12:
  ((void (**)(void, void *))v4)[2](v4, v22);
}

uint64_t sub_185F40610(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_185F406E8(void **a1, void *a2)
{
  id v3 = a2;
  v32[0] = MEMORY[0x1895F87A8];
  v32[1] = 3221225472LL;
  v32[2] = sub_185F40874;
  v32[3] = &unk_189DD4950;
  id v33 = a1[6];
  uint64_t v4 = (void (**)(void, void))MEMORY[0x186E2FEC4](v32);
  sub_185F436A0();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F46CA8((uint64_t)&OBJC_CLASS___UMLogMessage, a1[4], @"Delete user", v6, v7, v8, v9, v10, v31);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v5, v11);

  if (objc_msgSend_uid(a1[4], v12, v13, v14) == 501
    || (objc_msgSend_currentUser(a1[5], v15, v16, v17),
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(),
        int v22 = objc_msgSend_uid(v18, v19, v20, v21),
        int v26 = objc_msgSend_uid(a1[4], v23, v24, v25),
        v18,
        v22 == v26))
  {
    unint64_t v29 = 0LL;
LABEL_4:
    sub_185F37354((uint64_t)&OBJC_CLASS___UMError, v29);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }

  if (!objc_msgSend_userExists_(v3, v27, (uint64_t)a1[4], v28))
  {
    unint64_t v29 = 2LL;
    goto LABEL_4;
  }

  sub_185F3C9AC((uint64_t)&OBJC_CLASS___UMMobileKeyBag, a1[4]);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v30) {
    sub_185F3FFAC(v3);
  }
LABEL_5:
  ((void (**)(void, void *))v4)[2](v4, v30);
}

uint64_t sub_185F40874(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_185F40948(uint64_t a1, void *a2)
{
  id v3 = a2;
  v34[0] = MEMORY[0x1895F87A8];
  v34[1] = 3221225472LL;
  v34[2] = sub_185F40AD4;
  v34[3] = &unk_189DD4950;
  id v35 = *(id *)(a1 + 40);
  uint64_t v4 = (void (**)(void, void))MEMORY[0x186E2FEC4](v34);
  sub_185F436A0();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F46CA8( (uint64_t)&OBJC_CLASS___UMLogMessage,  *(void **)(a1 + 32),  @"Disable user",  v6,  v7,  v8,  v9,  v10,  v33);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v5, v11);

  if (!objc_msgSend_isSharedIPad(v3, v12, v13, v14))
  {
    unint64_t v31 = 0LL;
LABEL_6:
    sub_185F37354((uint64_t)&OBJC_CLASS___UMError, v31);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *))v4)[2](v4, v32);

    goto LABEL_7;
  }

  if (!objc_msgSend_userExists_(v3, v15, *(void *)(a1 + 32), v16))
  {
    unint64_t v31 = 2LL;
    goto LABEL_6;
  }

  id v17 = *(id *)(a1 + 32);
  objc_msgSend_setIsDisabled_(v17, v18, 1, v19);
  objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x189603F50], v20, v21, v22, -604800.0);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLastRemoteAuthDate_(v17, v24, (uint64_t)v23, v25);

  objc_msgSend_commitChanges(v17, v26, v27, v28);
  objc_msgSend_switchToLoginUserWithCompletionHandler_(v3, v29, (uint64_t)v4, v30);
LABEL_7:
}

uint64_t sub_185F40AD4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id *sub_185F40B58(id *result, void *a2)
{
  if (result) {
    return (id *)objc_storeWeak(result + 3, a2);
  }
  return result;
}

void sub_185F40D64(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    *(_BYTE *)(v4 + 16) = 0;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    id v6 = v3;
    (*(void (**)(void))(v5 + 16))();
    id v3 = v6;
  }
}

uint64_t sub_185F40DB4(uint64_t result, char a2)
{
  if (result) {
    *(_BYTE *)(result + 16) = a2;
  }
  return result;
}

BOOL sub_185F40DC0(BOOL result)
{
  if (result) {
    return *(_BYTE *)(result + 16) != 0;
  }
  return result;
}

void sub_185F40F24(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    *(_BYTE *)(v4 + 16) = 0;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    id v6 = v3;
    (*(void (**)(void))(v5 + 16))();
    id v3 = v6;
  }
}

void sub_185F4133C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    *(_BYTE *)(v4 + 16) = 0;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    id v6 = v3;
    (*(void (**)(void))(v5 + 16))();
    id v3 = v6;
  }
}

LABEL_34:
  uint64_t v66 = v65;
  return v66;
}

        if ((objc_msgSend_isEqualToString_(v11, v74, (uint64_t)@"prod", v75) & 1) == 0)
        {
          if (v73) {
            goto LABEL_38;
          }
          sub_185F436A0();
          uint64_t v73 = (id)objc_claimAutoreleasedReturnValue();
          sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Environment '%@' not found for service '%@'.\n\n",  v76,  v77,  v78,  v79,  v80,  v81,  (uint64_t)v11);
          uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue();
          sub_185F43A98((uint64_t)v73, v82);
        }

        uint64_t v73 = 0LL;
LABEL_38:
        v138 = 0LL;
        uint64_t v139 = &v138;
        uint64_t v140 = 0x2020000000LL;
        uint64_t v141 = 0;
        uint64_t v132 = 0LL;
        v133 = &v132;
        v134 = 0x3032000000LL;
        uint64_t v135 = sub_185F54614;
        uint64_t v136 = sub_185F54624;
        uint64_t v137 = 0LL;
        uint64_t v83 = dispatch_semaphore_create(0LL);

        v128[0] = MEMORY[0x1895F87A8];
        v128[1] = 3221225472LL;
        v128[2] = sub_185F546B4;
        v128[3] = &unk_189DD5408;
        uint64_t v130 = &v138;
        uint64_t v131 = &v132;
        uint64_t v84 = v83;
        v129 = v84;
        objc_msgSend_switchToEnvironment_service_completion_(v126, v85, (uint64_t)v73, (uint64_t)v127, v128);
        dispatch_semaphore_wait(v84, 0xFFFFFFFFFFFFFFFFLL);
        objc_msgSend_identifier(v73, v86, v87, v88);
        uint64_t v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v73, v90, v91, v92);
        uint64_t v93 = (__CFString *)objc_claimAutoreleasedReturnValue();
        uint64_t v94 = v93;
        if (!v89)
        {

          uint64_t v89 = @"prod";
          uint64_t v94 = @"Production";
        }

        if (*((_BYTE *)v139 + 24))
        {
          sub_185F436A0();
          uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_identifier(v127, v96, v97, v98);
          uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_name(v127, v100, v101, v102);
          uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue();
          sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Success: Switched to '%@' (%@) environment for service '%@' (%@)\n",  v104,  v105,  v106,  v107,  v108,  v109,  (uint64_t)v89);
          uint64_t v110 = (void *)objc_claimAutoreleasedReturnValue();
          sub_185F43A98((uint64_t)v95, v110);
        }

        else
        {
          sub_185F436A0();
          uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_description((void *)v133[5], v111, v112, v113);
          uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue();
          sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to switch to environment '%@': %@\n",  v114,  v115,  v116,  v117,  v118,  v119,  (uint64_t)v94);
          uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue();
          sub_185F43A98((uint64_t)v95, v103);
        }

        _Block_object_dispose(&v132, 8);
        _Block_object_dispose(&v138, 8);

        _Block_object_dispose(&v154, 8);
        _Block_object_dispose(&v160, 8);

        id v6 = v124 + 1;
      }

      while (v124 + 1 != v122);
      uint64_t v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v120, (uint64_t)&v166, (uint64_t)v172, 16);
    }

    while (v122);
  }
}

id *sub_185F42CE0(id *WeakRetained)
{
  if (WeakRetained) {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 4);
  }
  return WeakRetained;
}

id *sub_185F42CFC(id *result, void *a2)
{
  if (result) {
    return (id *)objc_storeWeak(result + 4, a2);
  }
  return result;
}

void sub_185F42E14( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_185F42E2C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_185F42E3C(uint64_t a1)
{
}

void sub_185F42E44(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = (void *)v6[1];
  if (!v3)
  {
    uint64_t v4 = sub_185F39A00((uint64_t)&OBJC_CLASS___UMMobileKeyBag, 1);
    uint64_t v5 = (void *)v6[1];
    v6[1] = v4;

    id v3 = (void *)v6[1];
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), v3);
}

void sub_185F42F8C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_185F42FA4(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = (void *)v6[1];
  if (!v3)
  {
    uint64_t v4 = sub_185F39A00((uint64_t)&OBJC_CLASS___UMMobileKeyBag, 0);
    uint64_t v5 = (void *)v6[1];
    v6[1] = v4;

    id v3 = (void *)v6[1];
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), v3);
}

LABEL_11:
  return v12;
}

  if (a2) {
    *a2 = v13;
  }
  objc_msgSend_setShouldFetchAttributes_(v3, v11, 0, v12);

  objc_sync_exit(v3);
  return v14;
}

LABEL_13:
      ((void (**)(void, void *))v18)[2](v18, v43);
LABEL_14:

      goto LABEL_15;
    }

    uint64_t v42 = 2LL;
    goto LABEL_12;
  }

  v18[2](v18, 0LL);
LABEL_15:
}

void sub_185F4356C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    *(_BYTE *)(v4 + 16) = 0;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    id v6 = v3;
    (*(void (**)(void))(v5 + 16))();
    id v3 = v6;
  }
}

id sub_185F436A0()
{
  uint64_t v0 = objc_opt_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_185F43718;
  block[3] = &unk_189DD45B8;
  block[4] = v0;
  if (qword_18C49E210 != -1) {
    dispatch_once(&qword_18C49E210, block);
  }
  return (id)qword_18C49E208;
}

void sub_185F43718()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_18C49E208;
  qword_18C49E208 = v0;

  if (qword_18C49E208) {
    *(void *)(qword_18C49E208 + _Block_object_dispose(va, 8) = 0LL;
  }
}

uint64_t sub_185F43754(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + _Block_object_dispose(va, 8) = a2;
  }
  return result;
}

id sub_185F43760()
{
  uint64_t v0 = objc_opt_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_185F437D8;
  block[3] = &unk_189DD45B8;
  block[4] = v0;
  if (qword_18C682B90 != -1) {
    dispatch_once(&qword_18C682B90, block);
  }
  return (id)qword_18C682B88;
}

void sub_185F437D8()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_18C682B88;
  qword_18C682B88 = v0;

  if (qword_18C682B88) {
    *(void *)(qword_18C682B88 + _Block_object_dispose(va, 8) = 1LL;
  }
}

id sub_185F43818()
{
  uint64_t v0 = objc_opt_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_185F43890;
  block[3] = &unk_189DD45B8;
  block[4] = v0;
  if (qword_18C49E220 != -1) {
    dispatch_once(&qword_18C49E220, block);
  }
  return (id)qword_18C49E218;
}

void sub_185F43890()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_18C49E218;
  qword_18C49E218 = v0;

  if (qword_18C49E218) {
    *(void *)(qword_18C49E218 + _Block_object_dispose(va, 8) = 2LL;
  }
}

id sub_185F438D0()
{
  uint64_t v0 = objc_opt_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_185F43948;
  block[3] = &unk_189DD45B8;
  block[4] = v0;
  if (qword_18C49E1E8 != -1) {
    dispatch_once(&qword_18C49E1E8, block);
  }
  return (id)qword_18C49E1E0;
}

void sub_185F43948()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_18C49E1E0;
  qword_18C49E1E0 = v0;

  if (qword_18C49E1E0) {
    *(void *)(qword_18C49E1E0 + _Block_object_dispose(va, 8) = 3LL;
  }
}

id sub_185F43988()
{
  uint64_t v0 = objc_opt_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_185F43A00;
  block[3] = &unk_189DD45B8;
  block[4] = v0;
  if (qword_18C682BA0 != -1) {
    dispatch_once(&qword_18C682BA0, block);
  }
  return (id)qword_18C682B98;
}

void sub_185F43A00()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_18C682B98;
  qword_18C682B98 = v0;

  if (qword_18C682B98) {
    *(void *)(qword_18C682B98 + _Block_object_dispose(va, 8) = 4LL;
  }
}

void sub_185F43A40( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1)
  {
    sub_185F469C0((uint64_t)&OBJC_CLASS___UMLogMessage, a2, (uint64_t)&a9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98(a1, v10);
  }

void sub_185F43A98(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    unint64_t v2 = *(void *)(a1 + 8);
    if (v2 >= 5) {
      os_log_type_t v3 = OS_LOG_TYPE_DEFAULT;
    }
    else {
      os_log_type_t v3 = (0x1110020100uLL >> (8 * v2));
    }
    uint64_t v4 = a2;
    sub_185F47258(v4);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F47278(v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1895F8DA0], v3);
      if (v6)
      {
        if (v7)
        {
          int v12 = 67240707;
          uid_t v13 = getuid();
          __int16 v14 = 2114;
          uint64_t v15 = v5;
          __int16 v16 = 2113;
          id v17 = v6;
          os_log_type_t v8 = v3;
          uint64_t v9 = (os_log_s *)MEMORY[0x1895F8DA0];
          uint64_t v10 = "(%{public}d) %{public}@; %{private}@";
          uint32_t v11 = 28;
LABEL_15:
          _os_log_impl(&dword_185F35000, v9, v8, v10, (uint8_t *)&v12, v11);
        }

LABEL_16:
        return;
      }

      if (!v7) {
        goto LABEL_16;
      }
      int v12 = 67240450;
      uid_t v13 = getuid();
      __int16 v14 = 2114;
      uint64_t v15 = v5;
      os_log_type_t v8 = v3;
      uint64_t v9 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v10 = "(%{public}d) %{public}@";
    }

    else
    {
      if (!v6 || !os_log_type_enabled(MEMORY[0x1895F8DA0], v3)) {
        goto LABEL_16;
      }
      int v12 = 67240451;
      uid_t v13 = getuid();
      __int16 v14 = 2113;
      uint64_t v15 = v6;
      uint64_t v9 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v10 = "(%{public}d) %{private}@";
      os_log_type_t v8 = v3;
    }

    uint32_t v11 = 18;
    goto LABEL_15;
  }

void sub_185F43C5C( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1)
  {
    sub_185F46ABC((uint64_t)&OBJC_CLASS___UMLogMessage, a2, (uint64_t)&a9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98(a1, v10);
  }

id sub_185F43CB4()
{
  if (qword_18C49E238 != -1) {
    dispatch_once(&qword_18C49E238, &unk_189DD4A38);
  }
  return (id)qword_18C49E240;
}

void sub_185F43CF8()
{
  uint64_t v0 = objc_alloc_init(&OBJC_CLASS___UMSideEffects);
  uint64_t v1 = (void *)qword_18C49E240;
  qword_18C49E240 = (uint64_t)v0;

  unint64_t v2 = objc_alloc_init(&OBJC_CLASS___UMLibInfoProvider);
  objc_msgSend_setLibInfo_((void *)qword_18C49E240, v3, (uint64_t)v2, v4);

  BOOL v7 = objc_alloc_init(&OBJC_CLASS___UMLibNotifyProvider);
  objc_msgSend_setLibNotify_((void *)qword_18C49E240, v5, (uint64_t)v7, v6);
}

id sub_185F43DCC()
{
  return sub_185F43CB4();
}

uint64_t sub_185F43DD8(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = v3;
  if (a1)
  {
    if (v3)
    {
      objc_msgSend_valueForEntitlement_(a1, v4, (uint64_t)v3, v5);
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        uint64_t v11 = objc_msgSend_BOOLValue(v7, v8, v9, v10);
      }
      else {
        uint64_t v11 = 0LL;
      }
    }

    else
    {
      uint64_t v11 = 1LL;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  return v11;
}

LABEL_6:
        objc_msgSend_setUpPersonaAttributesWithDictionary_( UMUserPersonaAttributes,  v12,  (uint64_t)v10,  v14);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

        os_log_type_t v8 = v11;
LABEL_16:

        goto LABEL_17;
      }
    }

    else
    {
    }

    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"personaAttributesForPersonaUniqueString:%@ failed with error %@",  v23,  v24,  v25,  v26,  v27,  v28,  (uint64_t)v7);
    unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = sub_185F438D0();
    goto LABEL_13;
  }

  uint64_t v15 = 0LL;
LABEL_17:

  return v15;
}

void sub_185F44698(void *a1, void *a2)
{
  if (a1)
  {
    id v3 = a2;
    objc_msgSend_personaLayoutPathURL(v3, v4, v5, v6);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPersonaLayoutPathURL_(a1, v8, (uint64_t)v7, v9);

    objc_msgSend_userPersonaUniqueString(v3, v10, v11, v12);
    uid_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserPersonaUniqueString_(a1, v14, (uint64_t)v13, v15);

    uint64_t v19 = objc_msgSend_userPersonaType(v3, v16, v17, v18);
    objc_msgSend_setUserPersonaType_(a1, v20, v19, v21);
    uint64_t v25 = objc_msgSend_userPersona_id(v3, v22, v23, v24);
    objc_msgSend_setUserPersona_id_(a1, v26, v25, v27);
    uint64_t isEnterprisePersona = objc_msgSend_isEnterprisePersona(v3, v28, v29, v30);
    objc_msgSend_setIsEnterprisePersona_(a1, v32, isEnterprisePersona, v33);
    uint64_t isPersonalPersona = objc_msgSend_isPersonalPersona(v3, v34, v35, v36);
    objc_msgSend_setIsPersonalPersona_(a1, v38, isPersonalPersona, v39);
    uint64_t isUniversalPersona = objc_msgSend_isUniversalPersona(v3, v40, v41, v42);
    objc_msgSend_setIsUniversalPersona_(a1, v44, isUniversalPersona, v45);
    uint64_t isSystemPersona = objc_msgSend_isSystemPersona(v3, v46, v47, v48);
    objc_msgSend_setIsSystemPersona_(a1, v50, isSystemPersona, v51);
    uint64_t isDefaultPersona = objc_msgSend_isDefaultPersona(v3, v52, v53, v54);
    objc_msgSend_setIsDefaultPersona_(a1, v56, isDefaultPersona, v57);
    uint64_t isGuestPersona = objc_msgSend_isGuestPersona(v3, v58, v59, v60);
    objc_msgSend_setIsGuestPersona_(a1, v62, isGuestPersona, v63);
    uint64_t isDataSeparatedPersona = objc_msgSend_isDataSeparatedPersona(v3, v64, v65, v66);
    objc_msgSend_setIsDataSeparatedPersona_(a1, v68, isDataSeparatedPersona, v69);
    objc_msgSend_userPersonaBundleIDList(v3, v70, v71, v72);
    uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserPersonaBundleIDList_(a1, v74, (uint64_t)v73, v75);

    objc_msgSend_creationDate(v3, v76, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCreationDate_(a1, v80, (uint64_t)v79, v81);

    objc_msgSend_lastLoginDate(v3, v82, v83, v84);
    uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastLoginDate_(a1, v86, (uint64_t)v85, v87);

    objc_msgSend_lastDisableDate(v3, v88, v89, v90);
    uint64_t v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastDisableDate_(a1, v92, (uint64_t)v91, v93);

    objc_msgSend_lastEnableDate(v3, v94, v95, v96);
    id v99 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setLastEnableDate_(a1, v97, (uint64_t)v99, v98);
  }

void sub_185F459C0()
{
  os_log_t v0 = os_log_create(off_18C6820F0, "sideeffect");
  uint64_t v1 = (void *)qword_18C682AD8;
  qword_18C682AD8 = (uint64_t)v0;
}

id sub_185F459F4(void *a1)
{
  if (a1)
  {
    sub_185F472D8(MEMORY[0x189607AB8], a1);
    uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v1, v2, v3, v4);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

uint64_t sub_185F45A44(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 0LL;
  }
  objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2, a4);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v8 = objc_msgSend_BOOLValue(v4, v5, v6, v7);
    int v9 = 0;
  }

  else
  {
    uint64_t v8 = 0LL;
    int v9 = 2;
  }

  *__error() = v9;

  return v8;
}

uint64_t sub_185F45AC8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 0LL;
  }
  objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2, a4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a3 = objc_msgSend_intValue(v5, v6, v7, v8);
    int v9 = 0;
  }

  else
  {
    int v9 = 2;
  }

  *__error() = v9;

  return a3;
}

uint64_t sub_185F45B4C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 0LL;
  }
  objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2, a4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a3 = objc_msgSend_unsignedIntValue(v5, v6, v7, v8);
    int v9 = 0;
  }

  else
  {
    int v9 = 2;
  }

  *__error() = v9;

  return a3;
}

uint64_t sub_185F45BD0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 0LL;
  }
  objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2, a4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a3 = objc_msgSend_longLongValue(v5, v6, v7, v8);
    int v9 = 0;
  }

  else
  {
    int v9 = 2;
  }

  *__error() = v9;

  return a3;
}

uint64_t sub_185F45C54(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 0LL;
  }
  objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2, a4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a3 = objc_msgSend_unsignedLongLongValue(v5, v6, v7, v8);
    int v9 = 0;
  }

  else
  {
    int v9 = 2;
  }

  *__error() = v9;

  return a3;
}

id sub_185F45CD8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2, a4);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v6 = __error();
    if ((isKindOfClass & 1) != 0)
    {
      *uint64_t v6 = 0;
      id v7 = v4;
    }

    else
    {
      id v7 = 0LL;
      *uint64_t v6 = 2;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

id sub_185F45D54(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2, a4);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v5 = v4;
    uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v16, (uint64_t)v20, 16);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v5);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            *__error() = 2;

            __int16 v14 = 0LL;
            goto LABEL_14;
          }

          ++v10;
        }

        while (v8 != v10);
        uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v16, (uint64_t)v20, 16);
        if (v8) {
          continue;
        }
        break;
      }
    }

    objc_msgSend_setWithArray_(MEMORY[0x189604010], v12, (uint64_t)v5, v13, v16);
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue();
    *__error() = 0;
LABEL_14:
  }

  else
  {
    __int16 v14 = 0LL;
    *__error() = 2;
  }

  return v14;
}

id sub_185F45EEC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2, a4);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      sub_185F472D8(MEMORY[0x189607AB8], v4);
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      int v6 = 2 * (v5 == 0LL);
    }

    else
    {
      id v5 = 0LL;
      int v6 = 2;
    }

    *__error() = v6;
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

id sub_185F45F84(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2, a4);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    int v6 = __error();
    if ((isKindOfClass & 1) != 0)
    {
      *int v6 = 0;
      id v7 = v4;
    }

    else
    {
      id v7 = 0LL;
      *int v6 = 2;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

id sub_185F46000(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2, a4);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    int v6 = __error();
    if ((isKindOfClass & 1) != 0)
    {
      *int v6 = 0;
      id v7 = v4;
    }

    else
    {
      id v7 = 0LL;
      *int v6 = 2;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

id sub_185F4607C(uint64_t a1, const char *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v9 = 0LL;
  objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1896079E8], a2, a1, 200, 0, &v9);
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = v9;
  if (!v2)
  {
    if (qword_18C682BB0 != -1) {
      dispatch_once(&qword_18C682BB0, &unk_189DD4A78);
    }
    uint64_t v4 = (os_log_s *)(id)qword_18C682BA8;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      unsigned int v5 = sub_185F385E4();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        unsigned int v6 = v5;
      }
      else {
        unsigned int v6 = v5 & 0xFFFFFFFE;
      }
      if (v6)
      {
        int v10 = 138543362;
        id v11 = v3;
        id v7 = (void *)_os_log_send_and_compose_impl();
        if (v7) {
          sub_185F385EC();
        }
      }

      else
      {
        id v7 = 0LL;
      }

      free(v7);
    }
  }

  return v2;
}

id sub_185F461F8(uint64_t a1, const char *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v9 = 0LL;
  objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1896079E8], a2, a1, 200, 0, &v9);
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = v9;
  if (!v2)
  {
    if (qword_18C682BB0 != -1) {
      dispatch_once(&qword_18C682BB0, &unk_189DD4A78);
    }
    uint64_t v4 = (os_log_s *)(id)qword_18C682BA8;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      unsigned int v5 = sub_185F385E4();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        unsigned int v6 = v5;
      }
      else {
        unsigned int v6 = v5 & 0xFFFFFFFE;
      }
      if (v6)
      {
        int v10 = 138412290;
        id v11 = v3;
        id v7 = (void *)_os_log_send_and_compose_impl();
        if (v7) {
          sub_185F385EC();
        }
      }

      else
      {
        id v7 = 0LL;
      }

      free(v7);
    }
  }

  return v2;
}

id sub_185F46374(uint64_t a1, const char *a2)
{
  v15[3] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v14 = 0LL;
    objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1896079E8], a2, a1, 0, 0, &v14);
    unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    id v3 = v14;
    if (v2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (qword_18C682BB0 != -1) {
          dispatch_once(&qword_18C682BB0, &unk_189DD4A78);
        }
        uint64_t v4 = (os_log_s *)(id)qword_18C682BA8;
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          v15[0] = 0LL;
          unsigned int v5 = sub_185F385E4();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
            unsigned int v6 = v5;
          }
          else {
            unsigned int v6 = v5 & 0xFFFFFFFE;
          }
          if (v6)
          {
            id v7 = (void *)_os_log_send_and_compose_impl();
            if (v7) {
              sub_185F385EC();
            }
          }

          else
          {
            id v7 = 0LL;
          }

          free(v7);
        }

        id v12 = 0LL;
        goto LABEL_29;
      }
    }

    else
    {
      if (qword_18C682BB0 != -1) {
        dispatch_once(&qword_18C682BB0, &unk_189DD4A78);
      }
      uint64_t v8 = (os_log_s *)(id)qword_18C682BA8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        unsigned int v9 = sub_185F385E4();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          unsigned int v10 = v9;
        }
        else {
          unsigned int v10 = v9 & 0xFFFFFFFE;
        }
        if (v10)
        {
          LODWORD(v15[0]) = 138543362;
          *(void *)((char *)v15 + 4) = v3;
          id v11 = (void *)_os_log_send_and_compose_impl();
          if (v11) {
            sub_185F385EC();
          }
        }

        else
        {
          id v11 = 0LL;
        }

        free(v11);
      }
    }

    id v12 = v2;
LABEL_29:

    return v12;
  }

  return 0LL;
}

id sub_185F465F0(uint64_t a1, const char *a2)
{
  v15[3] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v14 = 0LL;
    objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1896079E8], a2, a1, 0, 0, &v14);
    unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    id v3 = v14;
    if (v2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (qword_18C682BB0 != -1) {
          dispatch_once(&qword_18C682BB0, &unk_189DD4A78);
        }
        uint64_t v4 = (os_log_s *)(id)qword_18C682BA8;
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          v15[0] = 0LL;
          unsigned int v5 = sub_185F385E4();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
            unsigned int v6 = v5;
          }
          else {
            unsigned int v6 = v5 & 0xFFFFFFFE;
          }
          if (v6)
          {
            id v7 = (void *)_os_log_send_and_compose_impl();
            if (v7) {
              sub_185F385EC();
            }
          }

          else
          {
            id v7 = 0LL;
          }

          free(v7);
        }

        id v12 = 0LL;
        goto LABEL_29;
      }
    }

    else
    {
      if (qword_18C682BB0 != -1) {
        dispatch_once(&qword_18C682BB0, &unk_189DD4A78);
      }
      uint64_t v8 = (os_log_s *)(id)qword_18C682BA8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        unsigned int v9 = sub_185F385E4();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          unsigned int v10 = v9;
        }
        else {
          unsigned int v10 = v9 & 0xFFFFFFFE;
        }
        if (v10)
        {
          LODWORD(v15[0]) = 138543362;
          *(void *)((char *)v15 + 4) = v3;
          id v11 = (void *)_os_log_send_and_compose_impl();
          if (v11) {
            sub_185F385EC();
          }
        }

        else
        {
          id v11 = 0LL;
        }

        free(v11);
      }
    }

    id v12 = v2;
LABEL_29:

    return v12;
  }

  return 0LL;
}

void sub_185F4686C()
{
  os_log_t v0 = os_log_create(off_18C6820F0, "default");
  uint64_t v1 = (void *)qword_18C682BA8;
  qword_18C682BA8 = (uint64_t)v0;
}

void **sub_185F468A0( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a2;
  objc_opt_self();
  unsigned int v10 = (void **)objc_opt_new();
  id v11 = objc_alloc(NSString);
  uint64_t v13 = (void *)objc_msgSend_initWithFormat_arguments_(v11, v12, (uint64_t)v9, (uint64_t)&a9);

  if (v13)
  {
    if (v10) {
      objc_msgSend_addObject_(v10[1], v14, (uint64_t)v13, v15);
    }
    else {
      objc_msgSend_addObject_(0, v14, (uint64_t)v13, v15);
    }
  }

  return v10;
}

void **sub_185F46930( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a2;
  objc_opt_self();
  unsigned int v10 = (void **)objc_opt_new();
  id v11 = objc_alloc(NSString);
  uint64_t v13 = (void *)objc_msgSend_initWithFormat_arguments_(v11, v12, (uint64_t)v9, (uint64_t)&a9);

  if (v13)
  {
    if (v10) {
      objc_msgSend_addObject_(v10[2], v14, (uint64_t)v13, v15);
    }
    else {
      objc_msgSend_addObject_(0, v14, (uint64_t)v13, v15);
    }
  }

  return v10;
}

id sub_185F469C0(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  objc_opt_self();
  unsigned int v5 = (void *)objc_opt_new();
  id v6 = objc_alloc(NSString);
  uint64_t v8 = (void *)objc_msgSend_initWithFormat_arguments_(v6, v7, (uint64_t)v4, a3);

  sub_185F46A44((uint64_t)v5, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v8);
  return v5;
}

void sub_185F46A44( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1)
  {
    uint64_t v10 = (objc_class *)NSString;
    id v11 = a2;
    id v12 = objc_alloc(v10);
    uint64_t v14 = (void *)objc_msgSend_initWithFormat_arguments_(v12, v13, (uint64_t)v11, (uint64_t)&a9);

    if (v14) {
      objc_msgSend_addObject_(*(void **)(a1 + 8), v15, (uint64_t)v14, v16);
    }
  }

id sub_185F46ABC(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  objc_opt_self();
  unsigned int v5 = (void *)objc_opt_new();
  id v6 = objc_alloc(NSString);
  uint64_t v8 = (void *)objc_msgSend_initWithFormat_arguments_(v6, v7, (uint64_t)v4, a3);

  sub_185F46B40((uint64_t)v5, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v8);
  return v5;
}

void sub_185F46B40( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1)
  {
    uint64_t v10 = (objc_class *)NSString;
    id v11 = a2;
    id v12 = objc_alloc(v10);
    uint64_t v14 = (void *)objc_msgSend_initWithFormat_arguments_(v12, v13, (uint64_t)v11, (uint64_t)&a9);

    if (v14) {
      objc_msgSend_addObject_(*(void **)(a1 + 16), v15, (uint64_t)v14, v16);
    }
  }

void sub_185F46BB8(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  objc_opt_self();
  uint64_t v9 = objc_msgSend_uid(v5, v6, v7, v8);
  sub_185F46A44((uint64_t)v4, @"uid: %d", v10, v11, v12, v13, v14, v15, v9);
  objc_msgSend_username(v5, v16, v17, v18);
  id v25 = (id)objc_claimAutoreleasedReturnValue();

  sub_185F46B40((uint64_t)v4, @"username: %@", v19, v20, v21, v22, v23, v24, (uint64_t)v25);
}

id sub_185F46C50(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_self();
  id v4 = (void *)objc_opt_new();
  sub_185F46BB8(v3, v2, v4);

  return v4;
}

void **sub_185F46CA8( uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  id v11 = a3;
  uint64_t v12 = objc_opt_self();
  uint64_t v13 = (void **)objc_opt_new();
  id v14 = objc_alloc(NSString);
  uint64_t v16 = (void *)objc_msgSend_initWithFormat_arguments_(v14, v15, (uint64_t)v11, (uint64_t)&a9);

  if (v16)
  {
    if (v13) {
      objc_msgSend_addObject_(v13[1], v17, (uint64_t)v16, v18);
    }
    else {
      objc_msgSend_addObject_(0, v17, (uint64_t)v16, v18);
    }
  }

  sub_185F46BB8(v12, v10, v13);

  return v13;
}

void **sub_185F46D64( uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  id v11 = a3;
  uint64_t v12 = objc_opt_self();
  uint64_t v13 = (void **)objc_opt_new();
  id v14 = objc_alloc(NSString);
  uint64_t v16 = (void *)objc_msgSend_initWithFormat_arguments_(v14, v15, (uint64_t)v11, (uint64_t)&a9);

  if (v16)
  {
    if (v13) {
      objc_msgSend_addObject_(v13[2], v17, (uint64_t)v16, v18);
    }
    else {
      objc_msgSend_addObject_(0, v17, (uint64_t)v16, v18);
    }
  }

  sub_185F46BB8(v12, v10, v13);

  return v13;
}

void sub_185F46E20(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v18 = a2;
  objc_opt_self();
  sub_185F3726C((uint64_t)v18);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F46A44((uint64_t)v4, @"uuid: %@", v6, v7, v8, v9, v10, v11, (uint64_t)v5);

  sub_185F46B40((uint64_t)v4, @"task: %@", v12, v13, v14, v15, v16, v17, (uint64_t)v18);
}

id sub_185F46EB0(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_self();
  id v4 = (void *)objc_opt_new();
  sub_185F46E20(v3, v2, v4);

  return v4;
}

void **sub_185F46F08( uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  id v11 = a3;
  uint64_t v12 = objc_opt_self();
  uint64_t v13 = (void **)objc_opt_new();
  id v14 = objc_alloc(NSString);
  uint64_t v16 = (void *)objc_msgSend_initWithFormat_arguments_(v14, v15, (uint64_t)v11, (uint64_t)&a9);

  if (v16)
  {
    if (v13) {
      objc_msgSend_addObject_(v13[1], v17, (uint64_t)v16, v18);
    }
    else {
      objc_msgSend_addObject_(0, v17, (uint64_t)v16, v18);
    }
  }

  sub_185F46E20(v12, v10, v13);

  return v13;
}

void **sub_185F46FC4( uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  id v11 = a3;
  uint64_t v12 = objc_opt_self();
  uint64_t v13 = (void **)objc_opt_new();
  id v14 = objc_alloc(NSString);
  uint64_t v16 = (void *)objc_msgSend_initWithFormat_arguments_(v14, v15, (uint64_t)v11, (uint64_t)&a9);

  if (v16)
  {
    if (v13) {
      objc_msgSend_addObject_(v13[2], v17, (uint64_t)v16, v18);
    }
    else {
      objc_msgSend_addObject_(0, v17, (uint64_t)v16, v18);
    }
  }

  sub_185F46E20(v12, v10, v13);

  return v13;
}

id sub_185F470F4(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v7 = v3;
  uint64_t v8 = 0LL;
  if (a1 && v3)
  {
    if (objc_msgSend_count(v3, v4, v5, v6))
    {
      uint64_t v8 = (void *)objc_opt_new();
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      id v9 = v7;
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v19, (uint64_t)v23, 16);
      if (v11)
      {
        uint64_t v14 = v11;
        uint64_t v15 = *(void *)v20;
        uint64_t v16 = &stru_189DD7250;
        do
        {
          uint64_t v17 = 0LL;
          do
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v9);
            }
            objc_msgSend_appendFormat_( v8,  v12,  (uint64_t)@"%@%@",  v13,  v16,  *(void *)(*((void *)&v19 + 1) + 8 * v17++),  (void)v19);
            uint64_t v16 = @", ";
          }

          while (v14 != v17);
          uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v19, (uint64_t)v23, 16);
          uint64_t v16 = @", ";
        }

        while (v14);
      }
    }

    else
    {
      uint64_t v8 = 0LL;
    }
  }

  return v8;
}

void **sub_185F47258(void **a1)
{
  if (a1)
  {
    sub_185F470F4((uint64_t)a1, a1[1]);
    a1 = (void **)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

void **sub_185F47278(void **a1)
{
  if (a1)
  {
    sub_185F470F4((uint64_t)a1, a1[2]);
    a1 = (void **)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

void sub_185F47298(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

id sub_185F472D8(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_self();
  id v3 = objc_alloc(MEMORY[0x189607AB8]);
  uint64_t v6 = (void *)objc_msgSend_initWithUUIDString_(v3, v4, (uint64_t)v2, v5);

  return v6;
}

id sub_185F47324(uint64_t a1, const __CFUUID *a2)
{
  if (a2)
  {
    id v3 = (__CFString *)CFUUIDCreateString((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
    if (!v3) {
      sub_185F56E1C();
    }
    id v4 = v3;
    sub_185F472D8(MEMORY[0x189607AB8], v3);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v4);
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

CFUUIDRef sub_185F47394(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 0LL;
  }
  id v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  objc_msgSend_UUIDString(a1, a2, a3, a4);
  uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFUUIDRef v6 = CFUUIDCreateFromString(v4, v5);

  if (!v6) {
    sub_185F56E1C();
  }
  return v6;
}

UMPasswd *sub_185F473F0(uint64_t a1, uint64_t a2)
{
  id v3 = objc_alloc_init(&OBJC_CLASS___UMPasswd);
  sub_185F372CC((uint64_t)v3, *(_DWORD *)(a2 + 20));
  return v3;
}

void sub_185F476E8()
{
  os_log_t v0 = os_log_create(off_18C6820F0, "sideeffect");
  uint64_t v1 = (void *)qword_18C682AE0;
  qword_18C682AE0 = (uint64_t)v0;
}

id sub_185F4773C()
{
  uint64_t v0 = objc_opt_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_185F477B4;
  block[3] = &unk_189DD45B8;
  block[4] = v0;
  if (qword_18C49E228 != -1) {
    dispatch_once(&qword_18C49E228, block);
  }
  return (id)qword_18C49E230;
}

void sub_185F477B4()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_18C49E230;
  qword_18C49E230 = v0;
}

void sub_185F47888(uint64_t a1)
{
  if (a1)
  {
    if (!*(void *)(a1 + 224))
    {
      id v2 = objc_alloc(MEMORY[0x189607B30]);
      id v4 = (id)objc_msgSend_initWithMachServiceName_options_( v2,  v3,  (uint64_t)@"com.apple.mobile.keybagd.UserManager.xpc",  0);
      sub_185F49DE4((id *)a1, v4, 1);
    }
  }

void sub_185F478FC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (!WeakRetained) {
      sub_185F384F8( (uint64_t)&OBJC_CLASS___UMAbort,  @"You must have a stakeholder registered",  v10,  v11,  v12,  v13,  v14,  v15,  a9);
    }
  }

void sub_185F47948( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (!WeakRetained || (uint64_t v17 = *(void *)(a1 + 40), WeakRetained, v17 != 3)) {
      sub_185F384F8( (uint64_t)&OBJC_CLASS___UMAbort,  @"You must have a sync stakeholder registered",  v11,  v12,  v13,  v14,  v15,  v16,  a9);
    }
  }

void sub_185F47A68(uint64_t a1, void *a2)
{
  self = a2;
  if (self)
  {
    self[5] = 1LL;
    objc_setProperty_nonatomic_copy(self, v3, *(id *)(a1 + 40), 128LL);
  }

  sub_185F47AE0((uint64_t)self, *(void **)(a1 + 32));
}

uint64_t sub_185F47AC0(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 40) = a2;
  }
  return result;
}

void sub_185F47ACC(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 128LL);
  }
}

void sub_185F47AE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id obj = v3;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (WeakRetained) {
      sub_185F384F8( (uint64_t)&OBJC_CLASS___UMAbort,  @"There is already a registered stakeholder",  v5,  v6,  v7,  v8,  v9,  v10,  v11);
    }
    objc_storeWeak((id *)(a1 + 32), obj);
    sub_185F48D04(a1, 2LL, 0LL);
    id v3 = obj;
  }
}

void sub_185F47C04(uint64_t a1, uint64_t a2)
{
  if (a2) {
    *(void *)(a2 + 40) = 2LL;
  }
  sub_185F47AE0(a2, *(void **)(a1 + 32));
}

void sub_185F47CE4(uint64_t a1, void *a2)
{
  unint64_t v31 = a2;
  if (sub_185F38E84())
  {
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Setting up a listener for mach service",  v3,  v4,  v5,  v6,  v7,  v8,  v30);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F46B40((uint64_t)v9, @"name: %@", v10, v11, v12, v13, v14, v15, *(void *)(a1 + 32));
    sub_185F43818();
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v16, v9);

    id v17 = objc_alloc(MEMORY[0x189607B50]);
    __int128 v20 = (void *)objc_msgSend_initWithMachServiceName_(v17, v18, *(void *)(a1 + 32), v19);
    sub_185F47DF8((uint64_t)v31, v20);

    uint64_t v23 = *(void *)(a1 + 40);
    if (v31)
    {
      objc_msgSend_setDelegate_(v31[30], v21, v23, v22);
      objc_msgSend_resume(v31[30], v24, v25, v26);
    }

    else
    {
      objc_msgSend_setDelegate_(0, v21, v23, v22);
      objc_msgSend_resume(0, v27, v28, v29);
    }
  }

  if (v31) {
    v31[5] = (void *)3;
  }
  sub_185F47E14((uint64_t)v31, *(void **)(a1 + 32));
  sub_185F47AE0((uint64_t)v31, *(void **)(a1 + 48));
}

void sub_185F47DF8(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 240), a2);
  }
}

uint64_t sub_185F47E08(uint64_t result)
{
  if (result) {
    return *(void *)(result + 240);
  }
  return result;
}

void sub_185F47E14(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

void sub_185F47EF4(uint64_t a1, void *a2)
{
  uint64_t v36 = a2;
  sub_185F43818();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v3, @"Unregister stakeholder", v4, v5, v6, v7, v8, v9, v34);

  sub_185F478FC((uint64_t)v36, v10, v11, v12, v13, v14, v15, v16, v35);
  if (v36)
  {
    id WeakRetained = objc_loadWeakRetained(v36 + 4);
    char isEqual = objc_msgSend_isEqual_(WeakRetained, v20, *(void *)(a1 + 32), v21);
  }

  else
  {
    id WeakRetained = 0LL;
    char isEqual = objc_msgSend_isEqual_(0, v17, *(void *)(a1 + 32), v18);
  }

  char v23 = isEqual;

  if ((v23 & 1) == 0) {
    sub_185F384F8( (uint64_t)&OBJC_CLASS___UMAbort,  @"%@ is not the current stakeholder",  v24,  v25,  v26,  v27,  v28,  v29,  *(void *)(a1 + 32));
  }
  if (v36)
  {
    v36[7] = *(id *)(a1 + 48);
    sub_185F48018((uint64_t)v36, *(void **)(a1 + 40));
    sub_185F48D04((uint64_t)v36, 3LL, 0LL);
    if (v36[5] == (id)3) {
      objc_msgSend_invalidate(v36[30], v30, v31, v32);
    }
    objc_storeWeak(v36 + 4, 0LL);
    uint64_t v33 = v36;
    v36[5] = 0LL;
    *((_BYTE *)v36 + 9) = 0;
  }

  else
  {
    sub_185F48018(0LL, *(void **)(a1 + 40));
    uint64_t v33 = 0LL;
  }
}

void sub_185F48018(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

void sub_185F48028(uint64_t a1, uint64_t a2)
{
  if (a1) {
    sub_185F48D04(a1, a2, 0LL);
  }
}

uint64_t sub_185F48038(uint64_t result, char a2)
{
  if (result) {
    *(_BYTE *)(result + 9) = a2;
  }
  return result;
}

void sub_185F480F0(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = *(void **)(a1 + 32);
    id v4 = a2;
    objc_setProperty_nonatomic_copy(v4, v3, v2, 136LL);
    sub_185F48D04((uint64_t)v4, 1LL, 0LL);
  }

void sub_185F48144(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 136LL);
  }
}

void sub_185F481F8(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = *(void **)(a1 + 32);
    id v4 = a2;
    objc_setProperty_nonatomic_copy(v4, v3, v2, 160LL);
    sub_185F48D04((uint64_t)v4, 12LL, 0LL);
  }

void sub_185F4824C(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 160LL);
  }
}

void sub_185F483A4(uint64_t a1, void *a2)
{
  self = a2;
  sub_185F54504(*(uint64_t **)(a1 + 32), v3, v4, v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F3B59C((uint64_t)&OBJC_CLASS___UMMobileKeyBag, *(void **)(a1 + 40));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F48464((uint64_t)self, v7);

  sub_185F48474((uint64_t)self, *(void **)(a1 + 48));
  sub_185F48484((uint64_t)self, v6);
  sub_185F48494((uint64_t)self, *(void **)(a1 + 56));
  if (self)
  {
    objc_setProperty_nonatomic_copy(self, v8, *(id *)(a1 + 64), 136LL);
    sub_185F48D04((uint64_t)self, 0LL, 0LL);
  }
}

void sub_185F48464(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

void sub_185F48474(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

void sub_185F48484(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

void sub_185F48494(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 96), a2);
  }
}

void sub_185F485DC(uint64_t a1, void *a2)
{
  self = a2;
  sub_185F54504(*(uint64_t **)(a1 + 32), v3, v4, v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F3B59C((uint64_t)&OBJC_CLASS___UMMobileKeyBag, *(void **)(a1 + 40));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F48464((uint64_t)self, v7);

  sub_185F48474((uint64_t)self, *(void **)(a1 + 48));
  sub_185F48484((uint64_t)self, v6);
  sub_185F48494((uint64_t)self, *(void **)(a1 + 56));
  if (self)
  {
    objc_setProperty_nonatomic_copy(self, v8, *(id *)(a1 + 64), 152LL);
    sub_185F48D04((uint64_t)self, 13LL, 0LL);
  }
}

void sub_185F4869C(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 152LL);
  }
}

void sub_185F48750(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = *(void **)(a1 + 32);
    id v4 = a2;
    objc_setProperty_nonatomic_copy(v4, v3, v2, 168LL);
    sub_185F48D04((uint64_t)v4, 14LL, 0LL);
  }

void sub_185F487A4(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 168LL);
  }
}

void sub_185F48858(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = *(void **)(a1 + 32);
    id v4 = a2;
    objc_setProperty_nonatomic_copy(v4, v3, v2, 144LL);
    sub_185F48D04((uint64_t)v4, 10LL, 0LL);
  }

void sub_185F488AC(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 144LL);
  }
}

void sub_185F4890C(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    objc_setProperty_nonatomic_copy(v3, v2, 0LL, 144LL);
    sub_185F48D04((uint64_t)v3, 11LL, 0LL);
  }

void sub_185F489F4(uint64_t a1, void *a2)
{
  if (a2)
  {
    SEL v2 = *(void **)(a1 + 32);
    id v4 = a2;
    objc_setProperty_nonatomic_copy(v4, v3, v2, 208LL);
    sub_185F48D04((uint64_t)v4, 8LL, 0LL);
  }

void sub_185F48A48(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 208LL);
  }
}

void sub_185F48AA8(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    objc_setProperty_nonatomic_copy(v3, v2, 0LL, 208LL);
    sub_185F48D04((uint64_t)v3, 9LL, 0LL);
  }

void sub_185F48AF0(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    sub_185F3654C();
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = sub_185F48B90;
    v5[3] = &unk_189DD4AE8;
    id v6 = v3;
    sub_185F3672C((uint64_t)v4, a1, v5);
  }
}

void sub_185F48B90(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v47 = v3;
  if (v3) {
    id v4 = (void *)v3[24];
  }
  else {
    id v4 = 0LL;
  }
  id v5 = v4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = sub_185F43818();
  uint64_t v14 = (void *)v7;
  if ((isKindOfClass & 1) != 0)
  {
    sub_185F43A40(v7, @"Add user sync task", v8, v9, v10, v11, v12, v13, v43);

    sub_185F47948((uint64_t)v47, v15, v16, v17, v18, v19, v20, v21, v44);
    if (v47) {
      uint64_t v22 = (void *)v47[25];
    }
    else {
      uint64_t v22 = 0LL;
    }
    id v23 = v22;

    uint64_t v24 = 6LL;
    id v5 = v23;
    objc_msgSend_addObject_(v23, v25, *(void *)(a1 + 32), v26);
  }

  else
  {
    sub_185F43A40(v7, @"Add user switch blocking task", v8, v9, v10, v11, v12, v13, v43);

    sub_185F478FC((uint64_t)v47, v27, v28, v29, v30, v31, v32, v33, v46);
    uint64_t v24 = 4LL;
    objc_msgSend_addObject_(v5, v34, *(void *)(a1 + 32), v35);
  }

  if (v47 && *((_BYTE *)v47 + 9))
  {
    sub_185F43818();
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A40( (uint64_t)v36,  @"Already registered stakeholder, so telling server to add task",  v37,  v38,  v39,  v40,  v41,  v42,  v45);

    sub_185F48D04((uint64_t)v47, v24, *(void **)(a1 + 32));
  }
}

uint64_t sub_185F48CD8(uint64_t result)
{
  if (result) {
    return *(void *)(result + 192);
  }
  return result;
}

uint64_t sub_185F48CE4(uint64_t result)
{
  if (result) {
    return *(void *)(result + 200);
  }
  return result;
}

BOOL sub_185F48CF0(BOOL result)
{
  if (result) {
    return *(_BYTE *)(result + 9) != 0;
  }
  return result;
}

void sub_185F48D04(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!a1) {
    goto LABEL_48;
  }
  if ((sub_185F38E68() & 1) == 0 && a2 && a2 != 15)
  {
    sub_185F436A0();
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = @"_sendXPCMessageToServerOfType not applicable, bailing as its not multiUser";
    goto LABEL_17;
  }

  if ((sub_185F38E84() & 1) != 0)
  {
    sub_185F436A0();
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"RD: _sendXPCMessageToServerOfType in sync bubble",  v7,  v8,  v9,  v10,  v11,  v12,  v247);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v6, v13);
  }

  else
  {
    sub_185F47888(a1);
  }

  if (!*(void *)(a1 + 224))
  {
    sub_185F436A0();
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = @"no xpc connection to send message to server";
LABEL_17:
    sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, v26, v19, v20, v21, v22, v23, v24, v247);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v25, v27);

    goto LABEL_48;
  }

  if (qword_18C682BC0 != -1) {
    dispatch_once(&qword_18C682BC0, &unk_189DD4C48);
  }
  unsigned int v250 = dword_18C682BB8;
  objc_initWeak(location, (id)a1);
  uint64_t v14 = MEMORY[0x1895F87A8];
  v271[0] = MEMORY[0x1895F87A8];
  v271[1] = 3221225472LL;
  v271[2] = sub_185F4A3F8;
  v271[3] = &unk_189DD4CD8;
  objc_copyWeak(&v272, location);
  v254 = (void *)MEMORY[0x186E2FEC4](v271);
  v269[0] = v14;
  v269[1] = 3221225472LL;
  v269[2] = sub_185F4A4CC;
  v269[3] = &unk_189DD4CD8;
  objc_copyWeak(&v270, location);
  v253 = (void *)MEMORY[0x186E2FEC4](v269);
  v267[0] = v14;
  v267[1] = 3221225472LL;
  v267[2] = sub_185F4A594;
  v267[3] = &unk_189DD4CD8;
  objc_copyWeak(&v268, location);
  uint64_t v252 = (void *)MEMORY[0x186E2FEC4](v267);
  v265[0] = v14;
  v265[1] = 3221225472LL;
  v265[2] = sub_185F4A668;
  v265[3] = &unk_189DD4CD8;
  objc_copyWeak(&v266, location);
  uint64_t v251 = (void *)MEMORY[0x186E2FEC4](v265);
  v263[0] = v14;
  v263[1] = 3221225472LL;
  v263[2] = sub_185F4A73C;
  v263[3] = &unk_189DD4D00;
  objc_copyWeak(&v264, location);
  uint64_t v15 = (void *)MEMORY[0x186E2FEC4](v263);
  switch(a2)
  {
    case 0LL:
      uint64_t v40 = v15;
      sub_185F436A0();
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A40((uint64_t)v41, @"Tell server switch to user", v42, v43, v44, v45, v46, v47, v247);

      id v48 = *(id *)(a1 + 224);
      objc_msgSend_remoteObjectProxyWithErrorHandler_(v48, v49, (uint64_t)&unk_189DD4D20, v50);
      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
      id v52 = *(id *)(a1 + 72);
      id v53 = *(id *)(a1 + 80);
      id v54 = *(id *)(a1 + 88);
      id v55 = *(id *)(a1 + 96);
      objc_msgSend_switchToUser_passcodeData_context_preferences_pid_completionHandler_( v51,  v56,  (uint64_t)v52,  (uint64_t)v53,  v54,  v55,  v250,  v254);
      goto LABEL_35;
    case 1LL:
      uint64_t v40 = v15;
      sub_185F436A0();
      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A40((uint64_t)v57, @"Tell server switch to login screen", v58, v59, v60, v61, v62, v63, v247);

      id v64 = *(id *)(a1 + 224);
      objc_msgSend_remoteObjectProxyWithErrorHandler_(v64, v65, (uint64_t)&unk_189DD4D60, v66);
      uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_switchToLoginUserWithPID_completionHandler_(v67, v68, v250, (uint64_t)v254);
      goto LABEL_37;
    case 2LL:
      uint64_t v249 = v15;
      v261[0] = v14;
      v261[1] = 3221225472LL;
      v261[2] = sub_185F4AAC8;
      v261[3] = &unk_189DD4CD8;
      objc_copyWeak(&v262, location);
      uint64_t v69 = (void *)MEMORY[0x186E2FEC4](v261);
      uint64_t v70 = *(void *)(a1 + 40);
      switch(v70)
      {
        case 1LL:
          sub_185F436A0();
          v227 = (void *)objc_claimAutoreleasedReturnValue();
          sub_185F43A40( (uint64_t)v227,  @"Tell server register user switch stakeholder",  v228,  v229,  v230,  v231,  v232,  v233,  v247);

          id v71 = *(id *)(a1 + 224);
          objc_msgSend_remoteObjectProxyWithErrorHandler_(v71, v234, (uint64_t)&unk_189DD4DE0, v235);
          uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_registerUserSwitchStakeholderForPID_completionHandler_(v78, v236, v250, (uint64_t)v69);
          break;
        case 2LL:
          sub_185F436A0();
          uint64_t v237 = (void *)objc_claimAutoreleasedReturnValue();
          sub_185F43A40( (uint64_t)v237,  @"Tell server register critical user switch stakeholder",  v238,  v239,  v240,  v241,  v242,  v243,  v247);

          id v71 = *(id *)(a1 + 224);
          objc_msgSend_remoteObjectProxyWithErrorHandler_(v71, v244, (uint64_t)&unk_189DD4E00, v245);
          uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_registerCriticalUserSwitchStakeholderForPID_completionHandler_(v78, v246, v250, (uint64_t)v69);
          break;
        case 3LL:
          id v71 = *(id *)(a1 + 48);
          sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Tell server register user sync stakeholder with mach service",  v72,  v73,  v74,  v75,  v76,  v77,  v247);
          uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
          sub_185F46B40((uint64_t)v78, @"name: %@", v79, v80, v81, v82, v83, v84, (uint64_t)v71);
          sub_185F436A0();
          uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue();
          sub_185F43A98((uint64_t)v85, v78);

          id v86 = *(id *)(a1 + 224);
          objc_msgSend_remoteObjectProxyWithErrorHandler_(v86, v87, (uint64_t)&unk_189DD4E20, v88);
          uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_registerUserSyncStakeholderForPID_machServiceName_completionHandler_( v89,  v90,  v250,  (uint64_t)v71,  v69);

          break;
        default:
          goto LABEL_54;
      }

LABEL_54:
      objc_destroyWeak(&v262);
      uint64_t v15 = v249;
LABEL_47:

      objc_destroyWeak(&v264);
      objc_destroyWeak(&v266);

      objc_destroyWeak(&v268);
      objc_destroyWeak(&v270);

      objc_destroyWeak(&v272);
      objc_destroyWeak(location);
      break;
    case 3LL:
      unint64_t v91 = *(void *)(a1 + 56);
      uint64_t v40 = v15;
      if (v91 >= 3) {
        uint64_t v92 = 0LL;
      }
      else {
        uint64_t v92 = off_189DD53C0[v91];
      }
      sub_185F436A0();
      uint64_t v213 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A40( (uint64_t)v213,  @"Tell server unregister stakeholder, status: %@",  v214,  v215,  v216,  v217,  v218,  v219,  (uint64_t)v92);

      id v220 = *(id *)(a1 + 224);
      objc_msgSend_remoteObjectProxyWithErrorHandler_(v220, v221, (uint64_t)&unk_189DD4E40, v222);
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v224 = *(void *)(a1 + 56);
      id v225 = *(id *)(a1 + 64);
      objc_msgSend_unregisterStakeholderForPID_status_reason_completionHandler_( v223,  v226,  v250,  v224,  v225,  &unk_189DD4E60);

      goto LABEL_40;
    case 4LL:
    case 5LL:
    case 6LL:
    case 7LL:
      uint64_t v248 = v15;
      id v16 = v5;
      sub_185F3E7CC((uint64_t)&OBJC_CLASS___UMMobileKeyBag, v16);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((a2 | 2) == 6 && *(_BYTE *)(a1 + 8))
      {
        ++*(void *)(a1 + 216);
        v259[0] = v14;
        v259[1] = 3221225472LL;
        v259[2] = sub_185F4B1F4;
        v259[3] = &unk_189DD4CD8;
        objc_copyWeak(&v260, location);
        uint64_t v18 = (void *)MEMORY[0x186E2FEC4](v259);
        objc_destroyWeak(&v260);
      }

      else
      {
        uint64_t v18 = &unk_189DD4E80;
      }

      switch(a2)
      {
        case 4LL:
          sub_185F436A0();
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
          sub_185F46F08( (uint64_t)&OBJC_CLASS___UMLogMessage,  v16,  @"Tell server add user switch blocking task",  v29,  v30,  v31,  v32,  v33,  v247);
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
          sub_185F43A98((uint64_t)v28, v34);

          id v35 = *(id *)(a1 + 224);
          objc_msgSend_remoteObjectProxyWithErrorHandler_(v35, v36, (uint64_t)&unk_189DD4EC0, v37);
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addUserSwitchBlockingTask_forPID_completionHandler_(v38, v39, (uint64_t)v17, v250, v18);
          goto LABEL_44;
        case 5LL:
          sub_185F436A0();
          uint64_t v183 = (void *)objc_claimAutoreleasedReturnValue();
          sub_185F46F08( (uint64_t)&OBJC_CLASS___UMLogMessage,  v16,  @"Tell server remove user switch blocking task",  v184,  v185,  v186,  v187,  v188,  v247);
          uint64_t v189 = (void *)objc_claimAutoreleasedReturnValue();
          sub_185F43A98((uint64_t)v183, v189);

          id v35 = *(id *)(a1 + 224);
          objc_msgSend_remoteObjectProxyWithErrorHandler_(v35, v190, (uint64_t)&unk_189DD4EE0, v191);
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeUserSwitchBlockingTask_forPID_completionHandler_(v38, v192, (uint64_t)v17, v250, v18);
          goto LABEL_44;
        case 6LL:
          sub_185F436A0();
          id v193 = (void *)objc_claimAutoreleasedReturnValue();
          sub_185F46F08( (uint64_t)&OBJC_CLASS___UMLogMessage,  v16,  @"Tell server add user sync task",  v194,  v195,  v196,  v197,  v198,  v247);
          v199 = (void *)objc_claimAutoreleasedReturnValue();
          sub_185F43A98((uint64_t)v193, v199);

          id v35 = *(id *)(a1 + 224);
          objc_msgSend_remoteObjectProxyWithErrorHandler_(v35, v200, (uint64_t)&unk_189DD4F00, v201);
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addUserSyncTask_forPID_completionHandler_(v38, v202, (uint64_t)v17, v250, v18);
          goto LABEL_44;
        case 7LL:
          sub_185F436A0();
          v203 = (void *)objc_claimAutoreleasedReturnValue();
          sub_185F46F08( (uint64_t)&OBJC_CLASS___UMLogMessage,  v16,  @"Tell server remove user sync task",  v204,  v205,  v206,  v207,  v208,  v247);
          v209 = (void *)objc_claimAutoreleasedReturnValue();
          sub_185F43A98((uint64_t)v203, v209);

          id v35 = *(id *)(a1 + 224);
          objc_msgSend_remoteObjectProxyWithErrorHandler_(v35, v210, (uint64_t)&unk_189DD4F20, v211);
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeUserSyncTask_forPID_completionHandler_(v38, v212, (uint64_t)v17, v250, v18);
LABEL_44:

          break;
        default:
          break;
      }

      goto LABEL_46;
    case 8LL:
      uint64_t v248 = v15;
      sub_185F436A0();
      uint64_t v93 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A40((uint64_t)v93, @"Tell server terminate sync", v94, v95, v96, v97, v98, v99, v247);

      id v100 = *(id *)(a1 + 224);
      objc_msgSend_remoteObjectProxyWithErrorHandler_(v100, v101, (uint64_t)&unk_189DD4F40, v102);
      uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue();
      v257[0] = v14;
      v257[1] = 3221225472LL;
      v257[2] = sub_185F4B578;
      v257[3] = &unk_189DD4CD8;
      objc_copyWeak(&v258, location);
      objc_msgSend_terminateSyncBubbleForPID_completionHandler_(v103, v104, v250, (uint64_t)v257);

      objc_destroyWeak(&v258);
LABEL_46:
      uint64_t v15 = v248;
      goto LABEL_47;
    case 9LL:
      uint64_t v40 = v15;
      sub_185F436A0();
      uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A40((uint64_t)v105, @"Tell server resume sync", v106, v107, v108, v109, v110, v111, v247);

      id v64 = *(id *)(a1 + 224);
      objc_msgSend_remoteObjectProxyWithErrorHandler_(v64, v112, (uint64_t)&unk_189DD4F80, v113);
      uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_resumeSyncBubbleForPID_completionHandler_(v67, v114, v250, (uint64_t)&unk_189DD4FA0);
      goto LABEL_37;
    case 10LL:
      uint64_t v115 = v15;
      sub_185F436A0();
      uint64_t v116 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A40((uint64_t)v116, @"Tell server suspend quotas", v117, v118, v119, v120, v121, v122, v247);

      id v123 = *(id *)(a1 + 144);
      id v124 = *(id *)(a1 + 224);
      objc_msgSend_remoteObjectProxyWithErrorHandler_(v124, v125, (uint64_t)&unk_189DD4FC0, v126);
      uint64_t v127 = (void *)objc_claimAutoreleasedReturnValue();
      v255[0] = v14;
      v255[1] = 3221225472LL;
      v255[2] = sub_185F4B770;
      v255[3] = &unk_189DD4950;
      id v128 = v123;
      id v256 = v128;
      objc_msgSend_suspendUserQuotaForPID_completionHandler_(v127, v129, v250, (uint64_t)v255);

      uint64_t v15 = v115;
      goto LABEL_47;
    case 11LL:
      uint64_t v40 = v15;
      sub_185F436A0();
      uint64_t v130 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A40((uint64_t)v130, @"Tell server resume quotas", v131, v132, v133, v134, v135, v136, v247);

      id v64 = *(id *)(a1 + 224);
      objc_msgSend_remoteObjectProxyWithErrorHandler_(v64, v137, (uint64_t)&unk_189DD4FE0, v138);
      uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_reengageUserQuotaForPID_completionHandler_(v67, v139, v250, (uint64_t)&unk_189DD5000);
      goto LABEL_37;
    case 12LL:
      uint64_t v40 = v15;
      sub_185F436A0();
      uint64_t v140 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A40( (uint64_t)v140,  @"Tell server Logout to LoginSession Screen",  v141,  v142,  v143,  v144,  v145,  v146,  v247);

      id v64 = *(id *)(a1 + 224);
      objc_msgSend_remoteObjectProxyWithErrorHandler_(v64, v147, (uint64_t)&unk_189DD4DA0, v148);
      uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_logoutToLoginSessionWithPID_completionHandler_(v67, v149, v250, (uint64_t)v252);
      goto LABEL_37;
    case 13LL:
      uint64_t v40 = v15;
      sub_185F436A0();
      uint64_t v150 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A40( (uint64_t)v150,  @"Tell server switch to direct switch to User",  v151,  v152,  v153,  v154,  v155,  v156,  v247);

      id v48 = *(id *)(a1 + 224);
      objc_msgSend_remoteObjectProxyWithErrorHandler_(v48, v157, (uint64_t)&unk_189DD4D40, v158);
      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
      id v52 = *(id *)(a1 + 72);
      id v53 = *(id *)(a1 + 80);
      id v54 = *(id *)(a1 + 88);
      id v55 = *(id *)(a1 + 96);
      objc_msgSend_directSwitchToUser_passcodeData_context_preferences_pid_completionHandler_( v51,  v159,  (uint64_t)v52,  (uint64_t)v53,  v54,  v55,  v250,  v253);
LABEL_35:

      goto LABEL_39;
    case 14LL:
      uint64_t v40 = v15;
      sub_185F436A0();
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A40( (uint64_t)v160,  @"Tell server switch to checkinLoginUI",  v161,  v162,  v163,  v164,  v165,  v166,  v247);

      id v64 = *(id *)(a1 + 224);
      objc_msgSend_remoteObjectProxyWithErrorHandler_(v64, v167, (uint64_t)&unk_189DD4D80, v168);
      uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v169 = getpid();
      objc_msgSend_loginUICheckinForPID_completionHandler_(v67, v170, v169, (uint64_t)v251);
LABEL_37:

      goto LABEL_40;
    case 15LL:
      uint64_t v40 = v15;
      sub_185F436A0();
      uint64_t v171 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A40((uint64_t)v171, @"Tell server to Provision Device", v172, v173, v174, v175, v176, v177, v247);

      id v48 = *(id *)(a1 + 224);
      objc_msgSend_remoteObjectProxyWithErrorHandler_(v48, v178, (uint64_t)&unk_189DD5020, v179);
      uint64_t v180 = (void *)objc_claimAutoreleasedReturnValue();
      id v181 = *(id *)(a1 + 112);
      objc_msgSend_provisionDevice_forPid_completionHandler_(v180, v182, (uint64_t)v181, v250, v40);

LABEL_39:
LABEL_40:
      uint64_t v15 = v40;
      goto LABEL_47;
    default:
      goto LABEL_47;
  }

LABEL_48:
}

void sub_185F49A10( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, id *a12, uint64_t a13, id *a14, id *a15)
{
}

void sub_185F49AD8(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    sub_185F3654C();
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = sub_185F49B78;
    v5[3] = &unk_189DD4AE8;
    id v6 = v3;
    sub_185F3672C((uint64_t)v4, a1, v5);
  }
}

void sub_185F49B78(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v47 = v3;
  if (v3) {
    id v4 = (void *)v3[24];
  }
  else {
    id v4 = 0LL;
  }
  id v5 = v4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = sub_185F43818();
  uint64_t v14 = (void *)v7;
  if ((isKindOfClass & 1) != 0)
  {
    sub_185F43A40(v7, @"Remove user sync task", v8, v9, v10, v11, v12, v13, v43);

    sub_185F47948((uint64_t)v47, v15, v16, v17, v18, v19, v20, v21, v44);
    if (v47) {
      uint64_t v22 = (void *)v47[25];
    }
    else {
      uint64_t v22 = 0LL;
    }
    id v23 = v22;

    uint64_t v24 = 7LL;
    id v5 = v23;
    objc_msgSend_removeObject_(v23, v25, *(void *)(a1 + 32), v26);
  }

  else
  {
    sub_185F43A40(v7, @"Remove user switch blocking task", v8, v9, v10, v11, v12, v13, v43);

    sub_185F478FC((uint64_t)v47, v27, v28, v29, v30, v31, v32, v33, v46);
    uint64_t v24 = 5LL;
    objc_msgSend_removeObject_(v5, v34, *(void *)(a1 + 32), v35);
  }

  if (v47 && *((_BYTE *)v47 + 9))
  {
    sub_185F43818();
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A40( (uint64_t)v36,  @"Already registered stakeholder, so telling server to remove task",  v37,  v38,  v39,  v40,  v41,  v42,  v45);

    sub_185F48D04((uint64_t)v47, v24, *(void **)(a1 + 32));
  }
}

uint64_t sub_185F49CFC(uint64_t result)
{
  if (result) {
    return *(void *)(result + 224);
  }
  return result;
}

void sub_185F49D08(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to notify usermanagerd that login is complete: ",  v3,  v4,  v5,  v6,  v7,  v8,  v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_185F436A0();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v15, v17);
}

uint64_t sub_185F49D84(uint64_t result)
{
  if (result)
  {
    if (qword_18C682BC0 != -1) {
      dispatch_once(&qword_18C682BC0, &unk_189DD4C48);
    }
    return dword_18C682BB8;
  }

  return result;
}

uint64_t sub_185F49DC8()
{
  uint64_t result = getpid();
  dword_18C682BB8 = result;
  return result;
}

void sub_185F49DE4(id *a1, void *a2, int a3)
{
  id v8 = a2;
  if (a1 && !a1[28])
  {
    objc_msgSend_interfaceWithProtocol_(MEMORY[0x189607B48], v6, (uint64_t)&unk_18C688608, v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRemoteObjectInterface_(v8, v10, (uint64_t)v9, v11);

    objc_msgSend_interfaceWithProtocol_(MEMORY[0x189607B48], v12, (uint64_t)&unk_18C685EB0, v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setExportedInterface_(v8, v15, (uint64_t)v14, v16);

    objc_msgSend_setExportedObject_(v8, v17, (uint64_t)a1, v18);
    objc_initWeak(&location, a1);
    uint64_t v19 = MEMORY[0x1895F87A8];
    v33[0] = MEMORY[0x1895F87A8];
    v33[1] = 3221225472LL;
    v33[2] = sub_185F4A038;
    v33[3] = &unk_189DD4C90;
    objc_copyWeak(&v34, &location);
    objc_msgSend_setInterruptionHandler_(v8, v20, (uint64_t)v33, v21);
    v31[0] = v19;
    v31[1] = 3221225472LL;
    v31[2] = sub_185F4A328;
    v31[3] = &unk_189DD4C90;
    objc_copyWeak(&v32, &location);
    objc_msgSend_setInvalidationHandler_(v8, v22, (uint64_t)v31, v23);
    if (a3 && xpc_user_sessions_enabled())
    {
      xpc_user_sessions_get_foreground_uid();
      objc_msgSend__xpcConnection(v8, v27, v28, v29);
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_connection_set_target_user_session_uid();
    }

    objc_msgSend_resume(v8, v24, v25, v26);
    objc_storeStrong(a1 + 28, a2);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
}

void sub_185F4A004( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id location)
{
}

void sub_185F4A038(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v2, @"XPC connection interrupted", v3, v4, v5, v6, v7, v8, v10);

  sub_185F3654C();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_185F3672C((uint64_t)v11, WeakRetained, &unk_189DD4C68);
}

void sub_185F4A0BC(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (!v2) {
    goto LABEL_4;
  }
  unsigned int v3 = v2[4];
  if (v3 <= 4)
  {
    v2[4] = v3 + 1;
LABEL_4:
    uint64_t v4 = v2;
    sub_185F4A114((uint64_t)v2);
    id v2 = v4;
  }
}

uint64_t sub_185F4A0FC(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 16);
  }
  return result;
}

uint64_t sub_185F4A108(uint64_t result, int a2)
{
  if (result) {
    *(_DWORD *)(result + 16) = a2;
  }
  return result;
}

void sub_185F4A114(uint64_t a1)
{
  if (a1)
  {
    sub_185F436A0();
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A40((uint64_t)v2, @"Resend XPC messages", v3, v4, v5, v6, v7, v8, v61);

    *(_BYTE *)(a1 + 9) = 0;
    *(_BYTE *)(a1 + 11) = 0;
    if (*(void *)(a1 + 144))
    {
      sub_185F43818();
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A40((uint64_t)v9, @"Quota suspension requested", v10, v11, v12, v13, v14, v15, v62);

      sub_185F48D04(a1, 10LL, 0LL);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (WeakRetained)
    {
      sub_185F43818();
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A40((uint64_t)v17, @"We have a stakeholder, so re-register", v18, v19, v20, v21, v22, v23, v62);

      sub_185F48D04(a1, 2LL, 0LL);
    }

    if (*(void *)(a1 + 208)) {
      sub_185F48D04(a1, 8LL, 0LL);
    }
    if (*(void *)(a1 + 136))
    {
      uint64_t v24 = *(void *)(a1 + 72);
      uint64_t v25 = sub_185F43818();
      id v32 = (void *)v25;
      BOOL v33 = v24 == 0;
      BOOL v34 = v24 == 0;
      if (v33) {
        uint64_t v35 = @"Switch to login user initiated";
      }
      else {
        uint64_t v35 = @"Switch to user initiated";
      }
      sub_185F43A40(v25, v35, v26, v27, v28, v29, v30, v31, v62);

      sub_185F48D04(a1, v34, 0LL);
    }

    if (*(void *)(a1 + 120) && *(void *)(a1 + 112))
    {
      sub_185F43818();
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A40((uint64_t)v36, @"Provision of Device Reinitiated", v37, v38, v39, v40, v41, v42, v62);

      sub_185F48D04(a1, 15LL, 0LL);
    }

    if (*(void *)(a1 + 160))
    {
      sub_185F43818();
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A40((uint64_t)v43, @"logout to Login Session initiated", v44, v45, v46, v47, v48, v49, v62);

      sub_185F48D04(a1, 12LL, 0LL);
    }

    if (*(void *)(a1 + 152))
    {
      uint64_t v50 = *(void *)(a1 + 72);
      uint64_t v51 = sub_185F43818();
      uint64_t v58 = (void *)v51;
      if (v50) {
        uint64_t v59 = @"Switch to Direct user initiated";
      }
      else {
        uint64_t v59 = @"Switch to login user initiated";
      }
      if (v50) {
        uint64_t v60 = 13LL;
      }
      else {
        uint64_t v60 = 1LL;
      }
      sub_185F43A40(v51, v59, v52, v53, v54, v55, v56, v57, v62);

      sub_185F48D04(a1, v60, 0LL);
    }
  }

void sub_185F4A328(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v2, @"XPC connection invalidated", v3, v4, v5, v6, v7, v8, v10);

  sub_185F3654C();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_185F3672C((uint64_t)v11, WeakRetained, &unk_189DD4CB0);
}

void sub_185F4A3AC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
}

void sub_185F4A3B4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    objc_msgSend_invalidate(*(void **)(a1 + 224), a2, a3, a4);
    uint64_t v5 = *(void **)(a1 + 224);
    *(void *)(a1 + 224) = 0LL;
  }

void sub_185F4A3E8(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 224), a2);
  }
}

void sub_185F4A3F8(uint64_t a1, void *a2)
{
  id v12 = a2;
  sub_185F3856C((uint64_t)&OBJC_CLASS___UMAbort, v12, @"switch user");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    uint64_t v5 = (void *)*((void *)WeakRetained + 17);
  }
  else {
    uint64_t v5 = 0LL;
  }
  uint64_t v6 = v5;

  if (v6)
  {
    if (v12)
    {
      if (objc_msgSend_code(v12, v7, v8, v9) == 16) {
        unint64_t v10 = 5LL;
      }
      else {
        unint64_t v10 = 8LL;
      }
      sub_185F37464((uint64_t)&OBJC_CLASS___UMError, v10, v12);
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v11 = 0LL;
    }

    v6[2](v6, v11);
  }
}

uint64_t sub_185F4A4C0(uint64_t result)
{
  if (result) {
    return *(void *)(result + 136);
  }
  return result;
}

void sub_185F4A4CC(uint64_t a1, void *a2)
{
  id v12 = a2;
  sub_185F3856C((uint64_t)&OBJC_CLASS___UMAbort, v12, @"Direct switch user");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    uint64_t v5 = (void *)*((void *)WeakRetained + 17);
  }
  else {
    uint64_t v5 = 0LL;
  }
  uint64_t v6 = v5;

  if (v6)
  {
    if (v12)
    {
      if (objc_msgSend_code(v12, v7, v8, v9) == 16) {
        unint64_t v10 = 5LL;
      }
      else {
        unint64_t v10 = 8LL;
      }
      sub_185F37464((uint64_t)&OBJC_CLASS___UMError, v10, v12);
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v11 = 0LL;
    }

    v6[2](v6, v11);
  }
}

void sub_185F4A594(uint64_t a1, void *a2)
{
  id v12 = a2;
  sub_185F3856C((uint64_t)&OBJC_CLASS___UMAbort, v12, @"Logout to Login Session");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    uint64_t v5 = (void *)*((void *)WeakRetained + 20);
  }
  else {
    uint64_t v5 = 0LL;
  }
  uint64_t v6 = v5;

  if (v6)
  {
    if (v12)
    {
      if (objc_msgSend_code(v12, v7, v8, v9) == 16) {
        unint64_t v10 = 5LL;
      }
      else {
        unint64_t v10 = 8LL;
      }
      sub_185F37464((uint64_t)&OBJC_CLASS___UMError, v10, v12);
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v11 = 0LL;
    }

    v6[2](v6, v11);
  }
}

uint64_t sub_185F4A65C(uint64_t result)
{
  if (result) {
    return *(void *)(result + 160);
  }
  return result;
}

void sub_185F4A668(uint64_t a1, void *a2)
{
  id v12 = a2;
  sub_185F3856C((uint64_t)&OBJC_CLASS___UMAbort, v12, @"LoginUI Checkin");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    uint64_t v5 = (void *)*((void *)WeakRetained + 21);
  }
  else {
    uint64_t v5 = 0LL;
  }
  uint64_t v6 = v5;

  if (v6)
  {
    if (v12)
    {
      if (objc_msgSend_code(v12, v7, v8, v9) == 16) {
        unint64_t v10 = 5LL;
      }
      else {
        unint64_t v10 = 8LL;
      }
      sub_185F37464((uint64_t)&OBJC_CLASS___UMError, v10, v12);
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v11 = 0LL;
    }

    v6[2](v6, v11);
  }
}

uint64_t sub_185F4A730(uint64_t result)
{
  if (result) {
    return *(void *)(result + 168);
  }
  return result;
}

void sub_185F4A73C(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  sub_185F3856C((uint64_t)&OBJC_CLASS___UMAbort, v5, @"Provisioning of the Device");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    uint64_t v8 = (void *)*((void *)WeakRetained + 15);
  }
  else {
    uint64_t v8 = 0LL;
  }
  uint64_t v9 = v8;

  if (v9)
  {
    if (v5)
    {
      if (objc_msgSend_code(v5, v10, v11, v12) == 16) {
        unint64_t v13 = 5LL;
      }
      else {
        unint64_t v13 = 8LL;
      }
      sub_185F37464((uint64_t)&OBJC_CLASS___UMError, v13, v5);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v14 = 0LL;
    }

    v9[2](v9, v15, v14);
  }
}

uint64_t sub_185F4A820(uint64_t result)
{
  if (result) {
    return *(void *)(result + 120);
  }
  return result;
}

void sub_185F4A82C(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, @"Failed to switch to user: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_185F436A0();
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v15, v17);
}

uint64_t sub_185F4A8A8(uint64_t result)
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

uint64_t sub_185F4A8B4(uint64_t result)
{
  if (result) {
    return *(void *)(result + 80);
  }
  return result;
}

uint64_t sub_185F4A8C0(uint64_t result)
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

uint64_t sub_185F4A8CC(uint64_t result)
{
  if (result) {
    return *(void *)(result + 96);
  }
  return result;
}

void sub_185F4A8D8(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to direct switch to user: ",  v3,  v4,  v5,  v6,  v7,  v8,  v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_185F436A0();
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v15, v17);
}

void sub_185F4A954(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to switch to login user: ",  v3,  v4,  v5,  v6,  v7,  v8,  v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_185F436A0();
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v15, v17);
}

void sub_185F4A9D0(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to checkin with LoginUI: ",  v3,  v4,  v5,  v6,  v7,  v8,  v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_185F436A0();
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v15, v17);
}

void sub_185F4AA4C(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to logout to login session: ",  v3,  v4,  v5,  v6,  v7,  v8,  v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_185F436A0();
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v15, v17);
}

void sub_185F4AAC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    sub_185F3654C();
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    sub_185F3672C((uint64_t)v4, WeakRetained, &unk_189DD4DC0);
  }

  sub_185F3644C();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = objc_loadWeakRetained((id *)(a1 + 32));
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = sub_185F4AEA4;
  v9[3] = &unk_189DD4AE8;
  id v10 = v3;
  id v8 = v3;
  sub_185F3672C((uint64_t)v6, v7, v9);
}

void sub_185F4ABBC(uint64_t a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  sub_185F43760();
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v3, @"Registered stakeholder successfully", v4, v5, v6, v7, v8, v9, v55);

  if (v2)
  {
    v2[9] = 1;
    sub_185F43760();
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A40((uint64_t)v10, @"Will send tasks", v11, v12, v13, v14, v15, v16, v55);

    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id v17 = (void *)*((void *)v2 + 24);
  }

  else
  {
    sub_185F43760();
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A40((uint64_t)v48, @"Will send tasks", v49, v50, v51, v52, v53, v54, v55);

    id v17 = 0LL;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
  }

  id v18 = v17;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v59, (uint64_t)v64, 16);
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v60;
    do
    {
      for (uint64_t i = 0LL; i != v21; ++i)
      {
        if (*(void *)v60 != v22) {
          objc_enumerationMutation(v18);
        }
        sub_185F48D04((uint64_t)v2, 4LL, *(void **)(*((void *)&v59 + 1) + 8 * i));
      }

      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v24, (uint64_t)&v59, (uint64_t)v64, 16);
    }

    while (v21);
  }

  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  if (v2) {
    uint64_t v25 = (void *)*((void *)v2 + 25);
  }
  else {
    uint64_t v25 = 0LL;
  }
  id v26 = v25;
  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v55, (uint64_t)v63, 16);
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v56;
    do
    {
      for (uint64_t j = 0LL; j != v29; ++j)
      {
        if (*(void *)v56 != v30) {
          objc_enumerationMutation(v26);
        }
        sub_185F48D04((uint64_t)v2, 6LL, *(void **)(*((void *)&v55 + 1) + 8 * j));
      }

      uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v32, (uint64_t)&v55, (uint64_t)v63, 16);
    }

    while (v29);
  }

  sub_185F43760();
  BOOL v33 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v33, @"Did send tasks", v34, v35, v36, v37, v38, v39, v55);

  if (v2)
  {
    v2[11] = 1;
    if (*((void *)v2 + 22))
    {
      sub_185F436A0();
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A40( (uint64_t)v40,  @"Calling stored upload content completion handler",  v41,  v42,  v43,  v44,  v45,  v46,  v55);

      (*(void (**)(void))(*((void *)v2 + 22) + 16LL))();
      objc_setProperty_nonatomic_copy(v2, v47, 0LL, 176LL);
    }
  }
}

uint64_t sub_185F4AE78(uint64_t result, char a2)
{
  if (result) {
    *(_BYTE *)(result + 11) = a2;
  }
  return result;
}

uint64_t sub_185F4AE84(uint64_t result)
{
  if (result) {
    return *(void *)(result + 176);
  }
  return result;
}

void sub_185F4AE90(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 176LL);
  }
}

void sub_185F4AEA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v25 = v3;
  if (!v4)
  {
    uint64_t v23 = 0LL;
    if (!v3) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }

  sub_185F3856C((uint64_t)&OBJC_CLASS___UMAbort, v4, @"register stakeholder");
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Error registering stakeholder",  v5,  v6,  v7,  v8,  v9,  v10,  v24);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v11, @"error: %@", v12, v13, v14, v15, v16, v17, *(void *)(a1 + 32));
  sub_185F436A0();
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v18, v11);

  else {
    unint64_t v22 = 8LL;
  }
  sub_185F37464((uint64_t)&OBJC_CLASS___UMError, v22, *(void **)(a1 + 32));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

  id v3 = v25;
  if (v25)
  {
LABEL_6:
    if (v3[16]) {
      (*(void (**)(void))(v25[16] + 16LL))();
    }
  }

uint64_t sub_185F4AFB8(uint64_t result)
{
  if (result) {
    return *(void *)(result + 128);
  }
  return result;
}

void sub_185F4AFC4(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to register user switch stakeholder: ",  v3,  v4,  v5,  v6,  v7,  v8,  v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_185F436A0();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v15, v17);
}

void sub_185F4B040(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to register user switch critical stakeholder: ",  v3,  v4,  v5,  v6,  v7,  v8,  v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_185F436A0();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v15, v17);
}

void sub_185F4B0BC(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to register user sync stakeholder mach service: ",  v3,  v4,  v5,  v6,  v7,  v8,  v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_185F436A0();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v15, v17);
}

void sub_185F4B138(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to unregister stakeholder: ",  v3,  v4,  v5,  v6,  v7,  v8,  v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_185F436A0();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v15, v17);
}

uint64_t sub_185F4B1B4(uint64_t result)
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

BOOL sub_185F4B1C8(BOOL result)
{
  if (result) {
    return *(_BYTE *)(result + 8) != 0;
  }
  return result;
}

uint64_t sub_185F4B1DC(uint64_t result)
{
  if (result) {
    return *(void *)(result + 216);
  }
  return result;
}

uint64_t sub_185F4B1E8(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 216) = a2;
  }
  return result;
}

void sub_185F4B1F4(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_185F3672C((uint64_t)v3, WeakRetained, &unk_189DD4EA0);
}

void sub_185F4B254(uint64_t a1, void *a2)
{
  id v20 = a2;
  sub_185F43818();
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v2, @"Server received added task", v3, v4, v5, v6, v7, v8, v18);

  uint64_t v9 = v20;
  if (v20)
  {
    uint64_t v10 = *((void *)v20 + 27) - 1LL;
    *((void *)v20 + 27) = v10;
    if (!v10)
    {
      if (*((void *)v20 + 23))
      {
        sub_185F43818();
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        sub_185F43A40( (uint64_t)v11,  @"Calling stored will switch completion handler",  v12,  v13,  v14,  v15,  v16,  v17,  v19);

        (*(void (**)(void))(*((void *)v20 + 23) + 16LL))();
        uint64_t v9 = v20;
      }
    }
  }
}

uint64_t sub_185F4B300(uint64_t result)
{
  if (result) {
    return *(void *)(result + 184);
  }
  return result;
}

void sub_185F4B30C(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to add user switch blocking task: ",  v3,  v4,  v5,  v6,  v7,  v8,  v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_185F436A0();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v15, v17);
}

void sub_185F4B388(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to remove user switch blocking task: ",  v3,  v4,  v5,  v6,  v7,  v8,  v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_185F436A0();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v15, v17);
}

void sub_185F4B404(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to add user sync task: ",  v3,  v4,  v5,  v6,  v7,  v8,  v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_185F436A0();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v15, v17);
}

void sub_185F4B480(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to add user sync task: ",  v3,  v4,  v5,  v6,  v7,  v8,  v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_185F436A0();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v15, v17);
}

void sub_185F4B4FC(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, @"Failed to terminate sync: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_185F436A0();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v15, v17);
}

void sub_185F4B578(uint64_t a1, void *a2)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_185F3672C((uint64_t)v4, WeakRetained, &unk_189DD4F60);
}

void sub_185F4B5EC(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && v2[26])
  {
    self = v2;
    (*(void (**)(void))(v2[26] + 16LL))();
    objc_setProperty_nonatomic_copy(self, v3, 0LL, 208LL);
    id v2 = self;
  }
}

uint64_t sub_185F4B65C(uint64_t result)
{
  if (result) {
    return *(void *)(result + 208);
  }
  return result;
}

void sub_185F4B668(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, @"Failed to resume sync: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_185F436A0();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v15, v17);
}

uint64_t sub_185F4B6E8(uint64_t result)
{
  if (result) {
    return *(void *)(result + 144);
  }
  return result;
}

void sub_185F4B6F4(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, @"Failed to suspend quotas: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_185F436A0();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v15, v17);
}

void sub_185F4B770(uint64_t a1, void *a2)
{
  id v4 = a2;
  sub_185F3856C((uint64_t)&OBJC_CLASS___UMAbort, v4, @"suspend quota");
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void sub_185F4B7CC(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, @"Failed to resume quotas: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_185F436A0();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v15, v17);
}

void sub_185F4B848(uint64_t a1, void *a2)
{
}

void sub_185F4B85C(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to add user switch blocking task: ",  v3,  v4,  v5,  v6,  v7,  v8,  v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_185F436A0();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v15, v17);
}

uint64_t sub_185F4B8D8(uint64_t result)
{
  if (result) {
    return *(void *)(result + 112);
  }
  return result;
}

uint64_t sub_185F4B8E4(uint64_t result)
{
  if (result) {
    return *(void *)(result + 152);
  }
  return result;
}

void sub_185F4B8F0(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (a1)
  {
    sub_185F3654C();
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F3672C((uint64_t)v3, (void *)a1, &unk_189DD5040);

    uint64_t v4 = *(void *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v9 = WeakRetained;
    if (v4 == 2) {
      objc_msgSend_willSwitchToUser_(WeakRetained, v6, (uint64_t)v11, v8);
    }
    else {
      objc_msgSend_willSwitchUser(WeakRetained, v6, v7, v8);
    }

    sub_185F3654C();
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F3672C((uint64_t)v10, (void *)a1, &unk_189DD5060);

    *(_BYTE *)(a1 + 10) = 1;
  }
}

void sub_185F4B9AC(uint64_t a1, uint64_t a2)
{
  if (a2) {
    *(_BYTE *)(a2 + _Block_object_dispose(va, 8) = 1;
  }
}

uint64_t sub_185F4B9BC(uint64_t result, char a2)
{
  if (result) {
    *(_BYTE *)(result + _Block_object_dispose(va, 8) = a2;
  }
  return result;
}

void sub_185F4B9C8(uint64_t a1, uint64_t a2)
{
  if (a2) {
    *(_BYTE *)(a2 + _Block_object_dispose(va, 8) = 0;
  }
}

uint64_t sub_185F4B9D4(uint64_t result, char a2)
{
  if (result) {
    *(_BYTE *)(result + 10) = a2;
  }
  return result;
}

void sub_185F4B9E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    if (!*(_BYTE *)(a1 + 10))
    {
      id v15 = v3;
      sub_185F4B8F0(a1, v3);
      id v3 = v15;
    }

    if (*(void *)(a1 + 40) == 2LL)
    {
      uint64_t v16 = (uint64_t)v3;
      sub_185F436A0();
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A40((uint64_t)v4, @"readyToSwitchToUser", v5, v6, v7, v8, v9, v10, v14);

      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend_readyToSwitchToUser_(WeakRetained, v12, v16, v13);

      id v3 = (id)v16;
    }
  }
}

BOOL sub_185F4BA78(BOOL result)
{
  if (result) {
    return *(_BYTE *)(result + 10) != 0;
  }
  return result;
}

void sub_185F4BA8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    if (!*(_BYTE *)(a1 + 10))
    {
      id v15 = v3;
      sub_185F4B8F0(a1, v3);
      id v3 = v15;
    }

    if (*(void *)(a1 + 40) == 2LL)
    {
      uint64_t v16 = (uint64_t)v3;
      sub_185F436A0();
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A40((uint64_t)v4, @"readyToSwitchToLoginSession", v5, v6, v7, v8, v9, v10, v14);

      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend_readyToSwitchToLoginSession_(WeakRetained, v12, v16, v13);

      id v3 = (id)v16;
    }
  }
}

void sub_185F4BBE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v4, @"Will switch user", v5, v6, v7, v8, v9, v10, v15);

  id v11 = *(void **)(a1 + 32);
  if (v11)
  {
    sub_185F3CD1C((uint64_t)&OBJC_CLASS___UMMobileKeyBag, v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  sub_185F4B8F0((uint64_t)v3, v12);
  sub_185F3654C();
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = sub_185F4BCE8;
  v16[3] = &unk_189DD4B60;
  uint64_t v14 = *(void **)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  sub_185F3672C((uint64_t)v13, v14, v16);
}

void sub_185F4BCE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  self = v3;
  if (v3 && *((void *)v3 + 27))
  {
    sub_185F43818();
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A40( (uint64_t)v4,  @"Waiting on sending added tasks, storing will switch completion handler",  v5,  v6,  v7,  v8,  v9,  v10,  v19);

    objc_setProperty_nonatomic_copy(self, v11, *(id *)(a1 + 32), 184LL);
  }

  else
  {
    sub_185F43818();
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A40( (uint64_t)v12,  @"Not waiting on sending any added tasks, calling will switch completion handler",  v13,  v14,  v15,  v16,  v17,  v18,  v19);

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void sub_185F4BD8C(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 184LL);
  }
}

void sub_185F4BE64(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v4, @"Ready to switch user", v5, v6, v7, v8, v9, v10, v15);

  SEL v11 = *(void **)(a1 + 32);
  if (v11)
  {
    sub_185F3CD1C((uint64_t)&OBJC_CLASS___UMMobileKeyBag, v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  sub_185F4B9E0((uint64_t)v3, v12);
  sub_185F3654C();
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = sub_185F4BF64;
  v16[3] = &unk_189DD4B60;
  uint64_t v14 = *(void **)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  sub_185F3672C((uint64_t)v13, v14, v16);
}

uint64_t sub_185F4BF64(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v2, @"Calling ready to switch user completion handler", v3, v4, v5, v6, v7, v8, v10);

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_185F4C06C(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40( (uint64_t)v4,  @"Ready to readyToSwitchToLoginSession And Restart Self",  v5,  v6,  v7,  v8,  v9,  v10,  v19);

  SEL v11 = *(void **)(a1 + 32);
  if (v11)
  {
    sub_185F3CD1C((uint64_t)&OBJC_CLASS___UMMobileKeyBag, v11);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v21 = 0LL;
  }

  sub_185F436A0();
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40( (uint64_t)v12,  @"Calling readyToSwitchToLoginSession completion handler",  v13,  v14,  v15,  v16,  v17,  v18,  v20);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  sub_185F4BA8C((uint64_t)v3, v21);
}

void sub_185F4C1E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F43818();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v4, @"User switch task list did update", v5, v6, v7, v8, v9, v10, v18[0]);

  objc_initWeak(&location, v3);
  SEL v11 = *(void **)(a1 + 32);
  if (v11) {
    SEL v11 = (void *)v11[28];
  }
  uint64_t v12 = v11;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v12, v13, (uint64_t)&unk_189DD50D0, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = (uint64_t)sub_185F4C374;
  v18[3] = (uint64_t)&unk_189DD50F8;
  objc_copyWeak(&v19, &location);
  objc_msgSend_fetchUserSwitchBlockingTaskListWithCompletionHandler_(v15, v16, (uint64_t)v18, v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void sub_185F4C2D4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_185F4C2F8(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to fetch user switch blocking task list: ",  v3,  v4,  v5,  v6,  v7,  v8,  v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_185F436A0();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v15, v17);
}

void sub_185F4C374(uint64_t a1, void *a2)
{
  uint64_t v29 = a1;
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  uint64_t v3 = (void *)objc_opt_new();
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v4 = v2;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v32, (uint64_t)v36, 16);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v4);
        }
        sub_185F3E684((uint64_t)&OBJC_CLASS___UMMobileKeyBag, *(void **)(*((void *)&v32 + 1) + 8 * v9));
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_bundleID(v10, v11, v12, v13);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v3, v15, (uint64_t)v14, v16);
        id v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          uint64_t v20 = (void *)objc_opt_new();
          objc_msgSend_setObject_forKeyedSubscript_(v3, v21, (uint64_t)v20, (uint64_t)v14);
        }

        objc_msgSend_objectForKeyedSubscript_(v3, v18, (uint64_t)v14, v19, v29);
        unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v22, v23, (uint64_t)v10, v24);

        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v25, (uint64_t)&v32, (uint64_t)v36, 16);
    }

    while (v7);
  }

  sub_185F3644C();
  id v26 = (void *)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)(v29 + 32));
  v30[0] = MEMORY[0x1895F87A8];
  v30[1] = 3221225472LL;
  v30[2] = sub_185F4C58C;
  v30[3] = &unk_189DD4AE8;
  id v31 = v3;
  id v28 = v3;
  sub_185F3672C((uint64_t)v26, WeakRetained, v30);
}

void sub_185F4C58C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    id WeakRetained = objc_loadWeakRetained((id *)(a2 + 32));
  }
  else {
    id WeakRetained = 0LL;
  }
  id v6 = WeakRetained;
  objc_msgSend_userSwitchBlockingTasksDidUpdate_(WeakRetained, (const char *)a2, *(void *)(a1 + 32), a4);
}

void sub_185F4C6B8(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  sub_185F436A0();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v4, @"Upload content", v5, v6, v7, v8, v9, v10, v26[0]);

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained(v3 + 4);
    if (WeakRetained)
    {
      id v12 = v3[5];

      if (v12 == (id)3)
      {
        if (*((_BYTE *)v3 + 12))
        {
          sub_185F436A0();
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          sub_185F43A40( (uint64_t)v13,  @"Already called upload content, resending tasks",  v14,  v15,  v16,  v17,  v18,  v19,  v26[0]);

          sub_185F3654C();
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          sub_185F3672C((uint64_t)v20, v3, &unk_189DD5118);
        }

        else
        {
          uint64_t v20 = objc_loadWeakRetained(v3 + 4);
          objc_msgSend_uploadContent(v20, v21, v22, v23);
        }
      }
    }

    *((_BYTE *)v3 + 12) = 1;
  }

  sub_185F3654C();
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1895F87A8];
  v26[1] = 3221225472LL;
  v26[2] = (uint64_t)sub_185F4C84C;
  v26[3] = (uint64_t)&unk_189DD50B0;
  uint64_t v27 = v3;
  id v28 = *(id *)(a1 + 32);
  uint64_t v25 = v3;
  sub_185F3672C((uint64_t)v24, v25, v26);
}

BOOL sub_185F4C824(BOOL result)
{
  if (result) {
    return *(_BYTE *)(result + 12) != 0;
  }
  return result;
}

void sub_185F4C838(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_185F4C840(uint64_t result, char a2)
{
  if (result) {
    *(_BYTE *)(result + 12) = a2;
  }
  return result;
}

void sub_185F4C84C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 11))
  {
    sub_185F43818();
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A40( (uint64_t)v3,  @"Already sent tasks, calling upload content completion handler",  v4,  v5,  v6,  v7,  v8,  v9,  v19);

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    sub_185F43818();
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A40( (uint64_t)v10,  @"Have not sent tasks, storing upload content completion handler",  v11,  v12,  v13,  v14,  v15,  v16,  v19);

    uint64_t v18 = *(void **)(a1 + 32);
    if (v18) {
      objc_setProperty_nonatomic_copy(v18, v17, *(id *)(a1 + 40), 176LL);
    }
  }

BOOL sub_185F4C8F0(BOOL result)
{
  if (result) {
    return *(_BYTE *)(result + 11) != 0;
  }
  return result;
}

void sub_185F4C950(uint64_t a1, void *a2)
{
  id v11 = a2;
  sub_185F436A0();
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v2, @"Bubble did pop", v3, v4, v5, v6, v7, v8, v10);

  uint64_t v9 = v11;
  if (v11 && *((void *)v11 + 26))
  {
    (*(void (**)(void))(*((void *)v11 + 26) + 16LL))();
    uint64_t v9 = v11;
  }
}

void sub_185F4C9CC(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = (id *)(a1 + 248);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 248));

    uint64_t v3 = sub_185F436A0();
    id v14 = (id)v3;
    if (WeakRetained)
    {
      sub_185F43A40(v3, @"calling stakeholder for  personaListDidUpdate", v4, v5, v6, v7, v8, v9, v13);

      id v14 = objc_loadWeakRetained(v1);
      objc_msgSend_personaListDidUpdate(v14, v10, v11, v12);
    }

    else
    {
      sub_185F43A40(v3, @"NO stakeholder for  personaListDidUpdate", v4, v5, v6, v7, v8, v9, v13);
    }
  }

id *sub_185F4CA58(id *WeakRetained)
{
  if (WeakRetained) {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 31);
  }
  return WeakRetained;
}

void sub_185F4CB14(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v4, @"persona List Did Update", v5, v6, v7, v8, v9, v10, v13);

  sub_185F4C9CC((uint64_t)v3);
  sub_185F3654C();
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = sub_185F4CBE4;
  v14[3] = &unk_189DD4B60;
  uint64_t v12 = *(void **)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  sub_185F3672C((uint64_t)v11, v12, v14);
}

uint64_t sub_185F4CBE4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v2, @"Calling personaListDidUpdate completion handler", v3, v4, v5, v6, v7, v8, v10);

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_185F4CCCC(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v4, @"persona List Did Update Callback", v5, v6, v7, v8, v9, v10, v13);

  sub_185F4C9CC((uint64_t)v3);
  sub_185F3654C();
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = sub_185F4CD9C;
  v14[3] = &unk_189DD4B60;
  uint64_t v12 = *(void **)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  sub_185F3672C((uint64_t)v11, v12, v14);
}

uint64_t sub_185F4CD9C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v2, @"persona Update callback completion handler", v3, v4, v5, v6, v7, v8, v10);

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_185F4CEE4(uint64_t a1, void *a2)
{
  uint64_t v11 = a2;
  sub_185F43818();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v3, @"Set up server with connection", v4, v5, v6, v7, v8, v9, v10);

  sub_185F49DE4(v11, *(void **)(a1 + 32), 0);
  sub_185F4A114((uint64_t)v11);
}

void sub_185F4CF54(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  if (a1)
  {
    id v10 = a3;
    id v11 = a2;
    sub_185F47888(a1);
    uint64_t v12 = *(void **)(a1 + 224);
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_185F4D050;
    v20[3] = &unk_189DD4950;
    id v13 = v9;
    id v21 = v13;
    id v14 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v14, v15, (uint64_t)v20, v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = getpid();
    objc_msgSend_createPersona_passcodeData_passcodeDataType_forPid_completionHandler_( v17,  v19,  (uint64_t)v11,  (uint64_t)v10,  a4,  v18,  v13);
  }
}

void sub_185F4D050(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, @"Failed creating persona: ", v4, v5, v6, v7, v8, v9, v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v18, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  sub_185F436A0();
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v16, v18);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_185F4D0EC(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (a1)
  {
    id v7 = a2;
    sub_185F47888(a1);
    uint64_t v8 = *(void **)(a1 + 224);
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = sub_185F4D1C4;
    v16[3] = &unk_189DD4950;
    id v9 = v6;
    id v17 = v9;
    id v10 = v8;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v10, v11, (uint64_t)v16, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = getpid();
    objc_msgSend_deletePersona_forPid_completionHandler_(v13, v15, (uint64_t)v7, v14, v9);
  }
}

void sub_185F4D1C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, @"Failed to delete persona: ", v4, v5, v6, v7, v8, v9, v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v18, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  sub_185F436A0();
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v16, v18);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_185F4D25C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = a2;
    sub_185F47888(a1);
    uint64_t v7 = *(void **)(a1 + 224);
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    void v15[2] = sub_185F4D334;
    v15[3] = &unk_189DD4950;
    id v8 = v5;
    id v16 = v8;
    id v9 = v7;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v9, v10, (uint64_t)v15, v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = getpid();
    objc_msgSend_disablePersona_forPid_completionHandler_(v12, v14, (uint64_t)v6, v13, v8);
  }
}

void sub_185F4D334(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, @"Failed to disable persona: ", v4, v5, v6, v7, v8, v9, v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v18, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  sub_185F436A0();
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v16, v18);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_185F4D3CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    sub_185F47888(a1);
    uint64_t v4 = *(void **)(a1 + 224);
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    void v12[2] = sub_185F4D488;
    v12[3] = &unk_189DD4950;
    id v5 = v3;
    id v13 = v5;
    id v6 = v4;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v6, v7, (uint64_t)v12, v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = getpid();
    objc_msgSend_fetchPersonaListforPid_withCompletionHandler_(v9, v11, v10, (uint64_t)v5);
  }
}

void sub_185F4D488(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to fetch persona list: ",  v4,  v5,  v6,  v7,  v8,  v9,  v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v18, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  sub_185F436A0();
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v16, v18);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_185F4D524(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    sub_185F47888(a1);
    uint64_t v4 = *(void **)(a1 + 224);
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    void v12[2] = sub_185F4D5E0;
    v12[3] = &unk_189DD4950;
    id v5 = v3;
    id v13 = v5;
    id v6 = v4;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v6, v7, (uint64_t)v12, v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = getpid();
    objc_msgSend_fetchAllUsersPersonaListforPid_withCompletionHandler_(v9, v11, v10, (uint64_t)v5);
  }
}

void sub_185F4D5E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to persona list for all users: ",  v4,  v5,  v6,  v7,  v8,  v9,  v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v18, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  sub_185F436A0();
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v16, v18);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_185F4D67C(void *a1, void *a2)
{
  if (a1)
  {
    uint64_t v21 = 0LL;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000LL;
    uint64_t v24 = sub_185F4D818;
    uint64_t v25 = sub_185F4D828;
    id v26 = 0LL;
    uint64_t v15 = 0LL;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000LL;
    id v18 = sub_185F4D818;
    uint64_t v19 = sub_185F4D828;
    id v20 = 0LL;
    if (a2) {
      *a2 = 0LL;
    }
    sub_185F4D830(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = MEMORY[0x1895F87A8];
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = sub_185F4DA58;
    v14[3] = &unk_189DD46E0;
    void v14[4] = &v21;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v5, (uint64_t)v14, v6);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = getpid();
    v13[0] = v4;
    v13[1] = 3221225472LL;
    v13[2] = sub_185F4DAE4;
    v13[3] = &unk_189DD4750;
    v13[4] = &v21;
    v13[5] = &v15;
    objc_msgSend_fetchPersonaListforPid_withCompletionHandler_(v7, v9, v8, (uint64_t)v13);

    if (a2)
    {
      uint64_t v10 = (void *)v22[5];
      if (v10) {
        *a2 = v10;
      }
    }

    id v11 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

void sub_185F4D7F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t sub_185F4D818(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_185F4D828(uint64_t a1)
{
}

id sub_185F4D830(void *a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    objc_sync_enter(v1);
    if (v1[29])
    {
LABEL_7:
      id v35 = v1[29];
      objc_sync_exit(v1);

      return v35;
    }

    id v2 = objc_alloc(MEMORY[0x189607B30]);
    uint64_t v4 = objc_msgSend_initWithMachServiceName_options_(v2, v3, (uint64_t)@"com.apple.mobile.usermanagerd.xpc", 0);
    id v5 = v1[29];
    v1[29] = (id)v4;

    if (v1[29])
    {
      objc_msgSend_interfaceWithProtocol_(MEMORY[0x189607B48], v6, (uint64_t)&unk_18C688668, v7);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      id v9 = v1[29];
      objc_msgSend_setRemoteObjectInterface_(v9, v10, (uint64_t)v8, v11);

      id v12 = v1[29];
      objc_msgSend_setInterruptionHandler_(v12, v13, (uint64_t)&unk_189DD51C8, v14);

      id v15 = v1[29];
      objc_msgSend_setInvalidationHandler_(v15, v16, (uint64_t)&unk_189DD51E8, v17);

      if (xpc_user_sessions_enabled())
      {
        xpc_user_sessions_get_foreground_uid();
        id v18 = v1[29];
        objc_msgSend__xpcConnection(v18, v19, v20, v21);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        xpc_connection_set_target_user_session_uid();
      }

      sub_185F436A0();
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"SYNC CONNECTION SETUP",  v24,  v25,  v26,  v27,  v28,  v29,  v37);
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A98((uint64_t)v23, v30);

      id v31 = v1[29];
      objc_msgSend_resume(v31, v32, v33, v34);

      goto LABEL_7;
    }

    objc_sync_exit(v1);
  }

  return 0LL;
}

void sub_185F4DA40(_Unwind_Exception *a1)
{
}

void sub_185F4DA58(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to fetch persona list: got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F4DAE4(uint64_t a1, void *a2, void *a3)
{
  id v26 = a2;
  id v5 = a3;
  if (v5)
  {
    sub_185F436A0();
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to fetch persona list: %@",  v7,  v8,  v9,  v10,  v11,  v12,  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v6, v13);

    uint64_t v14 = (void *)MEMORY[0x189607870];
    uint64_t v15 = *MEMORY[0x189607688];
    uint64_t v19 = objc_msgSend_code(v5, v16, v17, v18);
    uint64_t v21 = objc_msgSend_errorWithDomain_code_userInfo_(v14, v20, v15, v19, 0);
    uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;
  }

  else
  {
    uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v25 = v26;
    uint64_t v23 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v25;
  }
}

void sub_185F4DBE8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = a2;
    sub_185F47888(a1);
    uint64_t v7 = *(void **)(a1 + 224);
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    void v15[2] = sub_185F4DCC0;
    v15[3] = &unk_189DD4950;
    id v8 = v5;
    id v16 = v8;
    id v9 = v7;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v9, v10, (uint64_t)v15, v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = getpid();
    objc_msgSend_fetchPersona_forPid_completionHandler_(v12, v14, (uint64_t)v6, v13, v8);
  }
}

void sub_185F4DCC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, @"Failed to fetch persona: ", v4, v5, v6, v7, v8, v9, v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v18, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  sub_185F436A0();
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v16, v18);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_185F4DD5C(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v24 = 0LL;
    id v25 = &v24;
    uint64_t v26 = 0x3032000000LL;
    uint64_t v27 = sub_185F4D818;
    uint64_t v28 = sub_185F4D828;
    id v29 = 0LL;
    uint64_t v18 = 0LL;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000LL;
    uint64_t v21 = sub_185F4D818;
    uint64_t v22 = sub_185F4D828;
    id v23 = 0LL;
    if (a3) {
      *a3 = 0LL;
    }
    sub_185F4D830(a1);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = MEMORY[0x1895F87A8];
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = sub_185F4DF10;
    v17[3] = &unk_189DD46E0;
    v17[4] = &v24;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v6, v8, (uint64_t)v17, v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = getpid();
    v16[0] = v7;
    v16[1] = 3221225472LL;
    v16[2] = sub_185F4DF9C;
    v16[3] = &unk_189DD4890;
    void v16[4] = &v24;
    void v16[5] = &v18;
    objc_msgSend_fetchPersona_forPid_completionHandler_(v10, v12, (uint64_t)v5, v11, v16);

    if (a3)
    {
      uint64_t v13 = (void *)v25[5];
      if (v13) {
        *a3 = v13;
      }
    }

    id v14 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }

  else
  {
    id v14 = 0LL;
  }

  return v14;
}

void sub_185F4DEEC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_185F4DF10(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to fetch persona: got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F4DF9C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v18 = v5;
  if (a3)
  {
    uint64_t v9 = (void *)MEMORY[0x189607870];
    uint64_t v10 = *MEMORY[0x189607688];
    uint64_t v11 = objc_msgSend_code(a3, v6, v7, v8);
    uint64_t v13 = objc_msgSend_errorWithDomain_code_userInfo_(v9, v12, v10, v11, 0);
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }

  else
  {
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v17 = v5;
    uint64_t v15 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v17;
  }
}

uint64_t sub_185F4E03C(void *a1, void *a2)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_185F4D818;
  id v23 = sub_185F4D828;
  id v24 = 0LL;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  uint64_t v18 = 0LL;
  if (a2) {
    *a2 = 0LL;
  }
  sub_185F4D830(a1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = sub_185F4E1BC;
  v14[3] = &unk_189DD46E0;
  void v14[4] = &v19;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v5, (uint64_t)v14, v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v13[1] = 3221225472LL;
  v13[2] = sub_185F4E30C;
  v13[3] = &unk_189DD5160;
  v13[4] = &v19;
  v13[5] = &v15;
  objc_msgSend_fetchPersonaGenerationNumberWithCompletionHandler_(v7, v8, (uint64_t)v13, v9);

  if (a2)
  {
    uint64_t v10 = (void *)v20[5];
    if (v10) {
      *a2 = v10;
    }
  }

  uint64_t v11 = v16[3];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v11;
}

void sub_185F4E198( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_185F4E1BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_18C682AD0 != -1) {
    dispatch_once(&qword_18C682AD0, &unk_189DD53A0);
  }
  uint64_t v4 = (os_log_s *)(id)qword_18C682AB8;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    unsigned int v5 = sub_185F385E4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      unsigned int v6 = v5;
    }
    else {
      unsigned int v6 = v5 & 0xFFFFFFFE;
    }
    if (v6)
    {
      uint64_t v7 = (void *)_os_log_send_and_compose_impl();
      if (v7) {
        sub_185F385EC();
      }
    }

    else
    {
      uint64_t v7 = 0LL;
    }

    free(v7);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void sub_185F4E30C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a3);
    id v6 = v7;
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  }
}

void sub_185F4E374(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    sub_185F47888(a1);
    uint64_t v4 = *(void **)(a1 + 224);
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    void v12[2] = sub_185F4E430;
    v12[3] = &unk_189DD4950;
    id v5 = v3;
    id v13 = v5;
    id v6 = v4;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v6, v7, (uint64_t)v12, v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = getpid();
    objc_msgSend_fetchAsidMapforPid_withCompletionHandler_(v9, v11, v10, (uint64_t)v5);
  }
}

void sub_185F4E430(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, @"Failed to fetch ASID map: ", v4, v5, v6, v7, v8, v9, v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v18, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  sub_185F436A0();
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v16, v18);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_185F4E4CC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  if (a1)
  {
    id v8 = a3;
    id v9 = a2;
    sub_185F47888(a1);
    uint64_t v10 = *(void **)(a1 + 224);
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_185F4E5B8;
    v18[3] = &unk_189DD4950;
    id v11 = v7;
    id v19 = v11;
    id v12 = v10;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v12, v13, (uint64_t)v18, v14);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = getpid();
    objc_msgSend_setSinglePersonaBundlesIdentifiers_forPersona_forPid_completionHandler_( v15,  v17,  (uint64_t)v9,  (uint64_t)v8,  v16,  v11);
  }
}

void sub_185F4E5B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to set bundle identifiers: ",  v4,  v5,  v6,  v7,  v8,  v9,  v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v18, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  sub_185F436A0();
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v16, v18);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

BOOL sub_185F4E650(void *a1, void *a2, void *a3, void *a4)
{
  v34[1] = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  uint64_t v10 = v8;
  if (a1)
  {
    uint64_t v27 = 0LL;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000LL;
    uint64_t v30 = sub_185F4D818;
    id v31 = sub_185F4D828;
    id v32 = 0LL;
    uint64_t v23 = 0LL;
    id v24 = &v23;
    uint64_t v25 = 0x2020000000LL;
    char v26 = 0;
    if (a4) {
      *a4 = 0LL;
    }
    uint64_t v33 = kUMUserPersonaUniqueStringKey;
    v34[0] = v8;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v9, (uint64_t)v34, (uint64_t)&v33, 1);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F4D830(a1);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = MEMORY[0x1895F87A8];
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = sub_185F4E888;
    v22[3] = &unk_189DD46E0;
    void v22[4] = &v27;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v12, v14, (uint64_t)v22, v15);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v13;
    v21[1] = 3221225472LL;
    v21[2] = sub_185F4E914;
    v21[3] = &unk_189DD4840;
    v21[4] = &v27;
    void v21[5] = &v23;
    objc_msgSend_setBundlesIdentifiers_forPersona_completionHandler_(v16, v17, (uint64_t)v7, (uint64_t)v11, v21);

    if (a4)
    {
      id v18 = (void *)v28[5];
      if (v18) {
        *a4 = v18;
      }
    }

    BOOL v19 = *((_BYTE *)v24 + 24) != 0;

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v27, 8);
  }

  else
  {
    BOOL v19 = 0LL;
  }

  return v19;
}

void sub_185F4E858( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_185F4E888(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to set synchronous bundleIds: got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F4E914(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    sub_185F436A0();
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to set synchronous bundleIds: %@",  v5,  v6,  v7,  v8,  v9,  v10,  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v4, v11);

    uint64_t v12 = (void *)MEMORY[0x189607870];
    uint64_t v13 = *MEMORY[0x189607688];
    uint64_t v17 = objc_msgSend_code(v3, v14, v15, v16);

    uint64_t v19 = objc_msgSend_errorWithDomain_code_userInfo_(v12, v18, v13, v17, 0);
    uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

void sub_185F4EA20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = a2;
    sub_185F47888(a1);
    uint64_t v7 = *(void **)(a1 + 224);
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    void v15[2] = sub_185F4EAF8;
    v15[3] = &unk_189DD4950;
    id v8 = v5;
    id v16 = v8;
    id v9 = v7;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v9, v10, (uint64_t)v15, v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = getpid();
    objc_msgSend_fetchBundleIdentifiersForPersona_forPid_completionHandler_(v12, v14, (uint64_t)v6, v13, v8);
  }
}

void sub_185F4EAF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to fetch bundle identifiers: ",  v4,  v5,  v6,  v7,  v8,  v9,  v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v18, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  sub_185F436A0();
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v16, v18);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_185F4EB94(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = a2;
    sub_185F47888(a1);
    uint64_t v7 = *(void **)(a1 + 224);
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    void v15[2] = sub_185F4EC6C;
    v15[3] = &unk_189DD4950;
    id v8 = v5;
    id v16 = v8;
    id v9 = v7;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v9, v10, (uint64_t)v15, v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = getpid();
    objc_msgSend_setMultiPersonaBundlesIdentifiers_forPid_WithcompletionHandler_(v12, v14, (uint64_t)v6, v13, v8);
  }
}

void sub_185F4EC6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to set multi-persona bundle identifiers: ",  v4,  v5,  v6,  v7,  v8,  v9,  v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v18, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  sub_185F436A0();
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v16, v18);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_185F4ED04(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    sub_185F47888(a1);
    uint64_t v4 = *(void **)(a1 + 224);
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    void v12[2] = sub_185F4EDC0;
    v12[3] = &unk_189DD4950;
    id v5 = v3;
    id v13 = v5;
    id v6 = v4;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v6, v7, (uint64_t)v12, v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = getpid();
    objc_msgSend_fetchMultiPersonaBundleIdentifiersforPid_withCompletionHandler_(v9, v11, v10, (uint64_t)v5);
  }
}

void sub_185F4EDC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to fetch multi-persona bundle identifiers: ",  v4,  v5,  v6,  v7,  v8,  v9,  v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F46B40((uint64_t)v18, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  sub_185F436A0();
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v16, v18);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_185F4EE5C(void *a1, void *a2, void *a3)
{
  v33[1] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  uint64_t v7 = v5;
  if (a1)
  {
    uint64_t v26 = 0LL;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x3032000000LL;
    uint64_t v29 = sub_185F4D818;
    uint64_t v30 = sub_185F4D828;
    id v31 = 0LL;
    uint64_t v20 = 0LL;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000LL;
    uint64_t v23 = sub_185F4D818;
    id v24 = sub_185F4D828;
    id v25 = 0LL;
    if (a3) {
      *a3 = 0LL;
    }
    id v32 = kUMUserPersonaUniqueStringKey;
    v33[0] = v5;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v6, (uint64_t)v33, (uint64_t)&v32, 1);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F4D830(a1);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = MEMORY[0x1895F87A8];
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = sub_185F4F07C;
    v19[3] = &unk_189DD46E0;
    v19[4] = &v26;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v9, v11, (uint64_t)v19, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    v18[1] = 3221225472LL;
    v18[2] = sub_185F4F108;
    v18[3] = &unk_189DD4750;
    void v18[4] = &v26;
    void v18[5] = &v20;
    objc_msgSend_bundleIdentifiersForPersona_completionHandler_(v13, v14, (uint64_t)v8, (uint64_t)v18);

    if (a3)
    {
      uint64_t v15 = (void *)v27[5];
      if (v15) {
        *a3 = v15;
      }
    }

    id v16 = (id)v21[5];

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);
  }

  else
  {
    id v16 = 0LL;
  }

  return v16;
}

void sub_185F4F04C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

void sub_185F4F07C(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to fetch synchronous bundleIDs: got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F4F108(uint64_t a1, void *a2, void *a3)
{
  id v26 = a2;
  id v5 = a3;
  if (v5)
  {
    sub_185F436A0();
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to fetch synchronous bundleIDs: %@",  v7,  v8,  v9,  v10,  v11,  v12,  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v6, v13);

    uint64_t v14 = (void *)MEMORY[0x189607870];
    uint64_t v15 = *MEMORY[0x189607688];
    uint64_t v19 = objc_msgSend_code(v5, v16, v17, v18);
    uint64_t v21 = objc_msgSend_errorWithDomain_code_userInfo_(v14, v20, v15, v19, 0);
    uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;
  }

  else
  {
    uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v25 = v26;
    uint64_t v23 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v25;
  }
}

id sub_185F4F20C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v26 = 0LL;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x3032000000LL;
    uint64_t v29 = sub_185F4D818;
    uint64_t v30 = sub_185F4D828;
    id v31 = 0LL;
    sub_185F47888(a1);
    uint64_t v4 = MEMORY[0x1895F87A8];
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    int v25[2] = sub_185F4F3D0;
    v25[3] = &unk_189DD46E0;
    v25[4] = &v26;
    id v5 = (void *)MEMORY[0x186E2FEC4](v25);
    sub_185F436A0();
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Registering machservice:%@ with UserManager",  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)v3);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v6, v13);

    id v14 = *(id *)(a1 + 224);
    v23[0] = v4;
    v23[1] = 3221225472LL;
    v23[2] = sub_185F4F490;
    v23[3] = &unk_189DD4950;
    id v15 = v5;
    id v24 = v15;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v14, v16, (uint64_t)v23, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = getpid();
    objc_msgSend_registerUserPersonaObserverForPID_withMachServiceName_completionHandler_( v18,  v20,  v19,  (uint64_t)v3,  v15);

    id v21 = (id)v27[5];
    _Block_object_dispose(&v26, 8);
  }

  else
  {
    id v21 = 0LL;
  }

  return v21;
}

void sub_185F4F3B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_185F4F3D0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v5 = objc_msgSend_copy(a2, (const char *)a2, a3, a4);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    sub_185F436A0();
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"registerUserPersonaObserverForPID returned with error:%@",  v8,  v9,  v10,  v11,  v12,  v13,  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
  }

  else
  {
    sub_185F43818();
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"registerUserPersonaObserverForPID Successful",  v14,  v15,  v16,  v17,  v18,  v19,  v21);
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v22, v20);
}

uint64_t sub_185F4F490(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_185F4F49C(uint64_t a1)
{
  if (a1)
  {
    sub_185F43818();
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, @"launchPersonaCallback", v3, v4, v5, v6, v7, v8, v23);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v2, v9);

    uint64_t v10 = (id *)(a1 + 248);
    id WeakRetained = objc_loadWeakRetained(v10);

    if (WeakRetained)
    {
      sub_185F43818();
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"calling personaStakeholder",  v13,  v14,  v15,  v16,  v17,  v18,  v24);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A98((uint64_t)v12, v19);

      id v25 = objc_loadWeakRetained(v10);
      objc_msgSend_personaListDidUpdate(v25, v20, v21, v22);
    }
  }

id sub_185F4F598(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!a1)
  {
    id v25 = 0LL;
    goto LABEL_16;
  }

  id v8 = v6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 248));

  if (WeakRetained) {
    sub_185F384F8( (uint64_t)&OBJC_CLASS___UMAbort,  @"There is already a registered stakeholder",  v10,  v11,  v12,  v13,  v14,  v15,  v93);
  }
  if (v8) {
    goto LABEL_5;
  }
  uint64_t v34 = sub_185F4F93C();
  if (!v34)
  {
    sub_185F436A0();
    uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Unable to find bundleCstring",  v68,  v69,  v70,  v71,  v72,  v73,  v93);
    uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v67, v74);

    goto LABEL_13;
  }

  uint64_t v36 = v34;
  objc_msgSend_stringWithCString_encoding_(NSString, v35, (uint64_t)v34, 4);
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43818();
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @" bundlename:%@; Cstring:%s",
    v39,
    v40,
    v41,
    v42,
    v43,
    v44,
    (uint64_t)v37);
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v38, v45);

  free(v36);
  if (!v37)
  {
LABEL_13:
    sub_185F436A0();
    uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Unable to find bundlename",  v76,  v77,  v78,  v79,  v80,  v81,  v95);
    uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v75, v82);

    goto LABEL_14;
  }

  sub_185F436A0();
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"computing bundlename:%@",  v47,  v48,  v49,  v50,  v51,  v52,  (uint64_t)v37);
  uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v46, v53);

  id v8 = (id)objc_msgSend_mutableCopy(v37, v54, v55, v56);
  objc_msgSend_appendString_(v8, v57, (uint64_t)@".personaobserver", v58);
  sub_185F43818();
  __int128 v59 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"computed machservice for callback:%@",  v60,  v61,  v62,  v63,  v64,  v65,  (uint64_t)v8);
  uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v59, v66);

  if (v8)
  {
LABEL_5:
    sub_185F436A0();
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Setting up XPC listner for %@",  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)v8);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v16, v23);

    sub_185F4FAA0();
    uint64_t v24 = (id *)objc_claimAutoreleasedReturnValue();
    sub_185F4FB98(v24, v8, &unk_189DD5180);
    id v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      sub_185F43818();
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Successful Setting up XPC listner, registering with UMServer",  v27,  v28,  v29,  v30,  v31,  v32,  v94);
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A98((uint64_t)v26, v33);

      sub_185F4F20C(a1, v8);
      id v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25) {
        objc_storeWeak((id *)(a1 + 248), v5);
      }
    }

    goto LABEL_15;
  }

LABEL_14:
  sub_185F436A0();
  uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Unable to compute machservice name",  v84,  v85,  v86,  v87,  v88,  v89,  v96);
  uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v83, v90);

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v91, *MEMORY[0x189607688], 22, 0);
  id v25 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = 0LL;
LABEL_15:

LABEL_16:
  return v25;
}

char *sub_185F4F93C()
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  memset(v7, 0, sizeof(v7));
  task_info_outCnt[0] = 8;
  if (task_info(*MEMORY[0x1895FBBE0], 0xFu, (task_info_t)v7, task_info_outCnt))
  {
    if (os_log_type_enabled(0LL, OS_LOG_TYPE_ERROR)) {
      sub_185F56E34();
    }
    return 0LL;
  }

  getpid();
  *(void *)task_info_outCnt = 0LL;
  int v2 = csops_audittoken();
  uint64_t v3 = bswap32(task_info_outCnt[1]);
  task_info_outCnt[0] = bswap32(task_info_outCnt[0]);
  task_info_outCnt[1] = v3;
  if ((v2 & 0x80000000) == 0)
  {
    if (!v2) {
      return strndup(v9, v3 - 8);
    }
    return 0LL;
  }

  if (*__error() != 34) {
    return 0LL;
  }
  uint64_t v4 = malloc(task_info_outCnt[1]);
  int v5 = csops_audittoken();
  uint64_t v6 = bswap32(*((_DWORD *)v4 + 1));
  *(_DWORD *)uint64_t v4 = bswap32(*(_DWORD *)v4);
  *((_DWORD *)v4 + 1) = v6;
  if (v5) {
    uint64_t v0 = 0LL;
  }
  else {
    uint64_t v0 = strndup((const char *)v4 + 8, v6 - 8);
  }
  free(v4);
  return v0;
}

id sub_185F4FAA0()
{
  uint64_t v0 = objc_opt_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_185F529BC;
  block[3] = &unk_189DD45B8;
  block[4] = v0;
  if (qword_18C682BD0 != -1) {
    dispatch_once(&qword_18C682BD0, block);
  }
  return (id)qword_18C682BC8;
}

void sub_185F4FB18()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Persona Observer machservice Callback",  v1,  v2,  v3,  v4,  v5,  v6,  v8);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v0, v7);

  sub_185F4773C();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F4F49C((uint64_t)v9);
}

id sub_185F4FB98(id *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v13 = a3;
  if (a1)
  {
    if (v6)
    {
      objc_storeStrong(a1 + 1, a2);
      sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"registering personalistener",  v14,  v15,  v16,  v17,  v18,  v19,  v45);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43818();
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A98((uint64_t)v21, v20);

      objc_setProperty_nonatomic_copy(a1, v22, v13, 32LL);
      id v23 = objc_alloc(MEMORY[0x189607B50]);
      uint64_t v26 = objc_msgSend_initWithMachServiceName_(v23, v24, (uint64_t)v6, v25);
      id v27 = a1[3];
      a1[3] = (id)v26;

      objc_msgSend_setDelegate_(a1[3], v28, (uint64_t)a1, v29);
      objc_msgSend_resume(a1[3], v30, v31, v32);
      sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Completed registration of personalistener",  v33,  v34,  v35,  v36,  v37,  v38,  v46);
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();

      sub_185F436A0();
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A98((uint64_t)v40, v39);

      uint64_t v41 = 0LL;
    }

    else
    {
      sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"nil machserviceName, registration failed",  v7,  v8,  v9,  v10,  v11,  v12,  v45);
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F436A0();
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A98((uint64_t)v42, v39);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v43, *MEMORY[0x189607688], 22, 0);
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    uint64_t v41 = 0LL;
  }

  return v41;
}

id *sub_185F4FD34(id *result, void *a2)
{
  if (result) {
    return (id *)objc_storeWeak(result + 31, a2);
  }
  return result;
}

void sub_185F4FD44(void *a1, void *a2, void *a3)
{
  if (a1) {
    sub_185F4FD58(a1, a2, 0LL, a3);
  }
}

void sub_185F4FD58(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    sub_185F3654C();
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    void v11[2] = sub_185F4FE40;
    v11[3] = &unk_189DD51A8;
    id v14 = v9;
    id v12 = v7;
    id v13 = v8;
    sub_185F3672C((uint64_t)v10, a1, v11);
  }
}

void sub_185F4FE40(void **a1, void *a2)
{
  id v3 = a2;
  self = v3;
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, v4, a1[6], 256LL);
    id v3 = self;
  }

  sub_185F4F598((uint64_t)v3, a1[4], a1[5]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F436A0();
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5) {
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to registerPersonaListUpdateObserver:%@",  v6,  v7,  v8,  v9,  v10,  v11,  (uint64_t)v5);
  }
  else {
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Successful registration of registerPersonaListUpdateObserver",  v6,  v7,  v8,  v9,  v10,  v11,  v14);
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v12, v13);

  (*((void (**)(void))a1[6] + 2))();
}

void sub_185F4FF0C(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 256LL);
  }
}

void sub_185F4FF20(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    sub_185F3654C();
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    void v8[2] = sub_185F4FFE0;
    v8[3] = &unk_189DD50B0;
    id v9 = v5;
    id v10 = v6;
    sub_185F3672C((uint64_t)v7, a1, v8);
  }
}

void sub_185F4FFE0(uint64_t a1, void *a2)
{
  self = a2;
  sub_185F50040((uint64_t)self, *(void **)(a1 + 32));
  if (self)
  {
    objc_setProperty_nonatomic_copy(self, v3, *(id *)(a1 + 40), 120LL);
    sub_185F48D04((uint64_t)self, 15LL, 0LL);
  }
}

void sub_185F50040(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 112), a2);
  }
}

void sub_185F50050(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 120LL);
  }
}

void sub_185F50064(void *a1)
{
  if (a1)
  {
    id obj = a1;
    objc_sync_enter(obj);
    id v1 = obj[29];
    objc_msgSend_invalidate(v1, v2, v3, v4);

    id v5 = obj[29];
    obj[29] = 0LL;

    sub_185F436A0();
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"SYNC CONNECTION TEARDOWN",  v7,  v8,  v9,  v10,  v11,  v12,  v14);
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v6, v13);

    objc_sync_exit(obj);
  }

void sub_185F5011C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t sub_185F50130(uint64_t result)
{
  if (result) {
    return *(void *)(result + 232);
  }
  return result;
}

void sub_185F5013C(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 232), a2);
  }
}

void sub_185F5014C()
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, @"Interruption handler invoked", v0, v1, v2, v3, v4, v5, v7);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v8, v6);
}

void sub_185F501B0()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Invalidation handler invoked, clearing connection",  v1,  v2,  v3,  v4,  v5,  v6,  v8);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v0, v7);

  sub_185F4773C();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F50064(v9);
}

uint64_t sub_185F50230(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v20 = 0LL;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000LL;
    int v23 = 5;
    sub_185F4D830(a1);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = MEMORY[0x1895F87A8];
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = sub_185F50380;
    v17[3] = &unk_189DD5210;
    id v8 = v5;
    id v18 = v8;
    uint64_t v19 = &v20;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v6, v9, (uint64_t)v17, v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = getpid();
    v16[0] = v7;
    v16[1] = 3221225472LL;
    v16[2] = sub_185F50420;
    v16[3] = &unk_189DD46E0;
    void v16[4] = &v20;
    objc_msgSend_personaLoginWithPid_WithUserODuuid_withUid_completionHandler_(v11, v13, v12, (uint64_t)v8, a3, v16);

    uint64_t v14 = *((unsigned int *)v21 + 6);
    _Block_object_dispose(&v20, 8);
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  return v14;
}

void sub_185F50368( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_185F50380(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to perform persona login for user %@: got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  *(void *)(a1 + 32));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  LODWORD(v4) = objc_msgSend_code(v3, v12, v13, v14);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_DWORD)v4;
}

uint64_t sub_185F50420(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    uint64_t result = objc_msgSend_code(a2, (const char *)a2, a3, a4);
  }
  else {
    uint64_t result = 0LL;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_185F5045C(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v20 = 0LL;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000LL;
    int v23 = 5;
    sub_185F4D830(a1);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = MEMORY[0x1895F87A8];
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = sub_185F505AC;
    v17[3] = &unk_189DD5210;
    id v8 = v5;
    id v18 = v8;
    uint64_t v19 = &v20;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v6, v9, (uint64_t)v17, v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = getpid();
    v16[0] = v7;
    v16[1] = 3221225472LL;
    v16[2] = sub_185F5064C;
    v16[3] = &unk_189DD46E0;
    void v16[4] = &v20;
    objc_msgSend_personaLogoutWithPid_WithUserODuuid_withUid_completionHandler_(v11, v13, v12, (uint64_t)v8, a3, v16);

    uint64_t v14 = *((unsigned int *)v21 + 6);
    _Block_object_dispose(&v20, 8);
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  return v14;
}

void sub_185F50594( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_185F505AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to perform persona logout for user %@: got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  *(void *)(a1 + 32));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  LODWORD(v4) = objc_msgSend_code(v3, v12, v13, v14);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_DWORD)v4;
}

uint64_t sub_185F5064C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    uint64_t result = objc_msgSend_code(a2, (const char *)a2, a3, a4);
  }
  else {
    uint64_t result = 0LL;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

id sub_185F50688(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v18 = 0LL;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000LL;
    uint64_t v21 = sub_185F4D818;
    uint64_t v22 = sub_185F4D828;
    id v23 = 0LL;
    sub_185F4D830(a1);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = MEMORY[0x1895F87A8];
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = sub_185F507F4;
    v16[3] = &unk_189DD4868;
    id v6 = v3;
    id v17 = v6;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v4, v7, (uint64_t)v16, v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v5;
    v13[1] = 3221225472LL;
    v13[2] = sub_185F5087C;
    v13[3] = &unk_189DD5238;
    id v14 = v6;
    uint64_t v15 = &v18;
    objc_msgSend_grantSandboxExtensionForPersonaWithUniqueString_completionHandler_(v9, v10, (uint64_t)v14, (uint64_t)v13);

    id v11 = (id)v19[5];
    _Block_object_dispose(&v18, 8);
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

void sub_185F507DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_185F507F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F438D0();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to grant sandbox extension for persona %@: got error from remote proxy: %@",  v4,  v5,  v6,  v7,  v8,  v9,  *(void *)(a1 + 32));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  sub_185F43A98((uint64_t)v11, v10);
}

void sub_185F5087C(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  if (v16)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v7 = v16;
    uint64_t v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }

  else
  {
    sub_185F438D0();
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to grant sandbox extension for persona %@: %@",  v9,  v10,  v11,  v12,  v13,  v14,  *(void *)(a1 + 32));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v8, v15);
  }
}

BOOL sub_185F50930(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v23 = 0LL;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2020000000LL;
    char v26 = 0;
    uint64_t v17 = 0LL;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000LL;
    uint64_t v20 = sub_185F4D818;
    uint64_t v21 = sub_185F4D828;
    id v22 = 0LL;
    sub_185F4D830(a1);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = MEMORY[0x1895F87A8];
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = sub_185F50AC8;
    v16[3] = &unk_189DD46E0;
    void v16[4] = &v17;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v6, v8, (uint64_t)v16, v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v7;
    v15[1] = 3221225472LL;
    void v15[2] = sub_185F50B54;
    v15[3] = &unk_189DD4840;
    void v15[4] = &v17;
    void v15[5] = &v23;
    objc_msgSend_setUserSessionSecureBackupBlob_withReply_(v10, v11, (uint64_t)v5, (uint64_t)v15);

    if (a3)
    {
      uint64_t v12 = (void *)v18[5];
      if (v12) {
        *a3 = v12;
      }
    }

    BOOL v13 = *((_BYTE *)v24 + 24) != 0;

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);
  }

  else
  {
    BOOL v13 = 0LL;
  }

  return v13;
}

void sub_185F50AA4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_185F50AC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to setSecureBackup blob, got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F50B54(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    id v4 = v5;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

id sub_185F50BB4(void *a1, void *a2)
{
  if (a1)
  {
    uint64_t v21 = 0LL;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000LL;
    uint64_t v24 = sub_185F4D818;
    uint64_t v25 = sub_185F4D828;
    id v26 = 0LL;
    uint64_t v15 = 0LL;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000LL;
    uint64_t v18 = sub_185F4D818;
    uint64_t v19 = sub_185F4D828;
    id v20 = 0LL;
    sub_185F4D830(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = MEMORY[0x1895F87A8];
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = sub_185F50D38;
    v14[3] = &unk_189DD46E0;
    void v14[4] = &v15;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v5, (uint64_t)v14, v6);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v4;
    v13[1] = 3221225472LL;
    v13[2] = sub_185F50DC4;
    v13[3] = &unk_189DD4818;
    void v13[4] = &v21;
    v13[5] = &v15;
    objc_msgSend_retrieveUserSessionSecureBackupBlobwithReply_(v7, v8, (uint64_t)v13, v9);

    if (a2)
    {
      uint64_t v10 = (void *)v16[5];
      if (v10) {
        *a2 = v10;
      }
    }

    id v11 = (id)v22[5];

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

void sub_185F50D14( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_185F50D38(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @" Failed to retrieve Secure BackupBlob, got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F50DC4(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  }
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
  }
}

BOOL sub_185F50E44(void *a1, void *a2)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = sub_185F4D818;
  uint64_t v19 = sub_185F4D828;
  id v20 = 0LL;
  sub_185F4D830(a1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = sub_185F50FBC;
  v14[3] = &unk_189DD46E0;
  void v14[4] = &v15;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v5, (uint64_t)v14, v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v13[1] = 3221225472LL;
  v13[2] = sub_185F51048;
  v13[3] = &unk_189DD4840;
  void v13[4] = &v15;
  v13[5] = &v21;
  objc_msgSend_deleteUserSessionSecureBlobwithReply_(v7, v8, (uint64_t)v13, v9);

  if (a2)
  {
    uint64_t v10 = (void *)v16[5];
    if (v10) {
      *a2 = v10;
    }
  }

  BOOL v11 = *((_BYTE *)v22 + 24) != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v11;
}

void sub_185F50F98( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_185F50FBC(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to delete Secure BackupBlob, got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F51048(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    id v4 = v5;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

id sub_185F510A8(void *a1, uint64_t a2, void *a3)
{
  if (a1)
  {
    uint64_t v22 = 0LL;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000LL;
    uint64_t v25 = sub_185F4D818;
    id v26 = sub_185F4D828;
    id v27 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000LL;
    uint64_t v19 = sub_185F4D818;
    id v20 = sub_185F4D828;
    id v21 = 0LL;
    sub_185F4D830(a1);
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = MEMORY[0x1895F87A8];
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    void v15[2] = sub_185F51234;
    v15[3] = &unk_189DD46E0;
    void v15[4] = &v22;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5, v7, (uint64_t)v15, v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    v14[1] = 3221225472LL;
    v14[2] = sub_185F512C0;
    v14[3] = &unk_189DD4890;
    void v14[4] = &v16;
    void v14[5] = &v22;
    objc_msgSend_configureLoginUIWithUserSessionCount_reply_(v9, v10, a2, (uint64_t)v14);

    if (a3)
    {
      BOOL v11 = (void *)v23[5];
      if (v11) {
        *a3 = v11;
      }
    }

    id v12 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

void sub_185F51210( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_185F51234(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to configure LoginWindow, got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F512C0(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  }
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
  }
}

BOOL sub_185F51340(void *a1, void *a2)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = sub_185F4D818;
  uint64_t v19 = sub_185F4D828;
  id v20 = 0LL;
  sub_185F4D830(a1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = sub_185F514B8;
  v14[3] = &unk_189DD46E0;
  void v14[4] = &v15;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v5, (uint64_t)v14, v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v13[1] = 3221225472LL;
  v13[2] = sub_185F51544;
  v13[3] = &unk_189DD4840;
  void v13[4] = &v15;
  v13[5] = &v21;
  objc_msgSend_switchToLoginUIUserSessionWithReply_(v7, v8, (uint64_t)v13, v9);

  if (a2)
  {
    uint64_t v10 = (void *)v16[5];
    if (v10) {
      *a2 = v10;
    }
  }

  BOOL v11 = *((_BYTE *)v22 + 24) != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v11;
}

void sub_185F51494( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_185F514B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to switch to Loginwindow, got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F51544(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    id v4 = v5;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

BOOL sub_185F515A4(uint64_t a1, void *a2)
{
  if (!a1) {
    return 0LL;
  }
  id v8 = 0LL;
  int v3 = sub_185F3F7D8((uint64_t)&OBJC_CLASS___UMMobileKeyBag, &v8);
  id v4 = v8;
  id v5 = v4;
  if (v4)
  {
    BOOL v6 = 0LL;
    if (a2) {
      *a2 = v4;
    }
  }

  else
  {
    BOOL v6 = v3 == 502;
  }

  return v6;
}

uint64_t sub_185F51634(uint64_t result, void *a2)
{
  if (result) {
    return sub_185F3F7D8((uint64_t)&OBJC_CLASS___UMMobileKeyBag, a2);
  }
  return result;
}

id sub_185F51648(void *a1, void *a2)
{
  if (a1)
  {
    uint64_t v20 = 0LL;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000LL;
    uint64_t v23 = sub_185F4D818;
    char v24 = sub_185F4D828;
    id v25 = 0LL;
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000LL;
    uint64_t v17 = sub_185F4D818;
    uint64_t v18 = sub_185F4D828;
    id v19 = 0LL;
    sub_185F4D830(a1);
    int v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = MEMORY[0x1895F87A8];
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = sub_185F517C8;
    v13[3] = &unk_189DD46E0;
    void v13[4] = &v20;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v5, (uint64_t)v13, v6);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    v12[1] = 3221225472LL;
    void v12[2] = sub_185F51854;
    v12[3] = &unk_189DD4890;
    void v12[4] = &v14;
    v12[5] = &v20;
    objc_msgSend_foregroundUserSessionAttributesWithReply_(v7, v8, (uint64_t)v12, v9);

    if (a2) {
      *a2 = (id) v21[5];
    }
    id v10 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v20, 8);
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

void sub_185F517A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_185F517C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed Foreground usersession attributes, got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F51854(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v6 = a3;
  if (v19) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  }
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
    sub_185F436A0();
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = objc_msgSend_code(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8, v9, v10);
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote foregroundUserSessionAttributesWithReply: %ld",  v12,  v13,  v14,  v15,  v16,  v17,  v11);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v7, v18);
  }
}

id sub_185F51930(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v9 = a3;
  if (!a1)
  {
LABEL_7:
    uint64_t v10 = 0LL;
    goto LABEL_8;
  }

  if (!v7)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v8, *MEMORY[0x189607688], 22, 0);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = v11;
    if (a4) {
      *a4 = v11;
    }

    goto LABEL_7;
  }

  sub_185F3BCC0((uint64_t)&OBJC_CLASS___UMMobileKeyBag, v7, v9, a4);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v10;
}

uint64_t sub_185F519E4(void *a1, void *a2)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  int v24 = -1;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = sub_185F4D818;
  id v19 = sub_185F4D828;
  id v20 = 0LL;
  sub_185F4D830(a1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = sub_185F51B58;
  v14[3] = &unk_189DD46E0;
  void v14[4] = &v15;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v5, (uint64_t)v14, v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v13[1] = 3221225472LL;
  v13[2] = sub_185F51BE4;
  v13[3] = &unk_189DD5260;
  void v13[4] = &v15;
  void v13[5] = &v21;
  objc_msgSend_currentSyncBubbleIDwithReply_(v7, v8, (uint64_t)v13, v9);

  if (a2)
  {
    uint64_t v10 = (void *)v16[5];
    if (v10) {
      *a2 = v10;
    }
  }

  uint64_t v11 = *((unsigned int *)v22 + 6);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v11;
}

void sub_185F51B34( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_185F51B58(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed Current SyncBubble ID, got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F51BE4(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a3);
    id v6 = v7;
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  }
}

id sub_185F51C4C(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v22 = 0LL;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000LL;
    id v25 = sub_185F4D818;
    id v26 = sub_185F4D828;
    id v27 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000LL;
    id v19 = sub_185F4D818;
    id v20 = sub_185F4D828;
    id v21 = 0LL;
    sub_185F4D830(a1);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = MEMORY[0x1895F87A8];
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    void v15[2] = sub_185F51DE4;
    v15[3] = &unk_189DD46E0;
    void v15[4] = &v22;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v6, v8, (uint64_t)v15, v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v14[1] = 3221225472LL;
    v14[2] = sub_185F51E70;
    v14[3] = &unk_189DD4750;
    void v14[4] = &v16;
    void v14[5] = &v22;
    objc_msgSend_listSyncServiceSourcesForUserSession_withReply_(v10, v11, (uint64_t)v5, (uint64_t)v14);

    if (a3) {
      *a3 = (id) v23[5];
    }
    id v12 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

void sub_185F51DC0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_185F51DE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed list syncservices for usersession, got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F51E70(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v6 = a3;
  if (v19) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  }
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
    sub_185F436A0();
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = objc_msgSend_code(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8, v9, v10);
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"got error from remote listSyncServiceSourcesForUserSession: %ld",  v12,  v13,  v14,  v15,  v16,  v17,  v11);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v7, v18);
  }
}

BOOL sub_185F51F4C(void *a1, void *a2)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 0;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = sub_185F4D818;
  uint64_t v18 = sub_185F4D828;
  id v19 = 0LL;
  sub_185F4D830(a1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = MEMORY[0x1895F87A8];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = sub_185F520C0;
  v13[3] = &unk_189DD46E0;
  void v13[4] = &v14;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v5, (uint64_t)v13, v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v12[1] = 3221225472LL;
  void v12[2] = sub_185F5214C;
  v12[3] = &unk_189DD4840;
  void v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend_isLoginSessionwithReply_(v7, v8, (uint64_t)v12, v9);

  if (a2) {
    *a2 = (id) v15[5];
  }
  BOOL v10 = *((_BYTE *)v21 + 24) != 0;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return v10;
}

void sub_185F5209C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_185F520C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed isLoginSession,got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F5214C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    id v4 = v5;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

id sub_185F521AC(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v22 = 0LL;
    char v23 = &v22;
    uint64_t v24 = 0x3032000000LL;
    id v25 = sub_185F4D818;
    id v26 = sub_185F4D828;
    id v27 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000LL;
    id v19 = sub_185F4D818;
    uint64_t v20 = sub_185F4D828;
    id v21 = 0LL;
    sub_185F4D830(a1);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = MEMORY[0x1895F87A8];
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    void v15[2] = sub_185F52344;
    v15[3] = &unk_189DD46E0;
    void v15[4] = &v22;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v6, v8, (uint64_t)v15, v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v14[1] = 3221225472LL;
    v14[2] = sub_185F523D0;
    v14[3] = &unk_189DD4890;
    void v14[4] = &v22;
    void v14[5] = &v16;
    objc_msgSend_getUserSessionAttributes_reply_(v10, v11, (uint64_t)v5, (uint64_t)v14);

    if (a3) {
      *a3 = (id) v23[5];
    }
    id v12 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

void sub_185F52320( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_185F52344(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed Usersession attributes  info, got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F523D0(uint64_t a1, void *a2, void *a3)
{
  id v20 = a2;
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a3);
    sub_185F436A0();
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = objc_msgSend_code(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v7, v8, v9);
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"getUserSessionAttributes error: %ld",  v11,  v12,  v13,  v14,  v15,  v16,  v10);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v6, v17);
  }

  else
  {
    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v19 = v20;
    uint64_t v6 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v19;
  }
}

BOOL sub_185F524A8(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v9 = a3;
  if (a1)
  {
    uint64_t v28 = 0LL;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000LL;
    char v31 = 0;
    uint64_t v22 = 0LL;
    char v23 = &v22;
    uint64_t v24 = 0x3032000000LL;
    id v25 = sub_185F4D818;
    id v26 = sub_185F4D828;
    id v27 = 0LL;
    if (v7)
    {
      sub_185F4D830(a1);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = MEMORY[0x1895F87A8];
      v21[0] = MEMORY[0x1895F87A8];
      v21[1] = 3221225472LL;
      v21[2] = sub_185F526B8;
      v21[3] = &unk_189DD46E0;
      v21[4] = &v22;
      objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v10, v12, (uint64_t)v21, v13);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v11;
      v20[1] = 3221225472LL;
      v20[2] = sub_185F52744;
      v20[3] = &unk_189DD4840;
      void v20[4] = &v22;
      v20[5] = &v28;
      objc_msgSend_switchToUserSession_withOpaqueData_reply_(v14, v15, (uint64_t)v7, (uint64_t)v9, v20);

      if (a4) {
        *a4 = (id) v23[5];
      }
      BOOL v16 = *((_BYTE *)v29 + 24) != 0;
    }

    else
    {
      uint64_t v17 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v8, *MEMORY[0x189607688], 22, 0);
      uint64_t v18 = (void *)v23[5];
      v23[5] = v17;

      BOOL v16 = 0LL;
      if (a4) {
        *a4 = (id) v23[5];
      }
    }

    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v28, 8);
  }

  else
  {
    BOOL v16 = 0LL;
  }

  return v16;
}

void sub_185F52690( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_185F526B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_185F436A0();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to Switch Usersession, got error from remote proxy: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_185F52744(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v6 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    id v4 = v6;
    char v5 = 0;
  }

  else
  {
    char v5 = 1;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v5;
}

uint64_t sub_185F527A8(uint64_t result, void *a2, void *a3, void *a4)
{
  if (result) {
    return sub_185F3C19C((uint64_t)&OBJC_CLASS___UMMobileKeyBag, a2, a3, a4);
  }
  return result;
}

void sub_185F527BC(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

uint64_t sub_185F527CC(uint64_t result)
{
  if (result) {
    return *(void *)(result + 104);
  }
  return result;
}

void sub_185F527D8(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 104), a2);
  }
}

void sub_185F527E8(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 192), a2);
  }
}

void sub_185F527F8(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 200), a2);
  }
}

uint64_t sub_185F52808(uint64_t result)
{
  if (result) {
    return *(void *)(result + 256);
  }
  return result;
}

id *sub_185F52814(id *WeakRetained)
{
  if (WeakRetained) {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 33);
  }
  return WeakRetained;
}

id *sub_185F52830(id *result, void *a2)
{
  if (result) {
    return (id *)objc_storeWeak(result + 33, a2);
  }
  return result;
}

BOOL sub_185F52840(BOOL result)
{
  if (result) {
    return *(_BYTE *)(result + 13) != 0;
  }
  return result;
}

uint64_t sub_185F52854(uint64_t result, char a2)
{
  if (result) {
    *(_BYTE *)(result + 13) = a2;
  }
  return result;
}

void sub_185F529BC()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_18C682BC8;
  qword_18C682BC8 = v0;
}

void sub_185F52A44(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 32LL);
  }
}

uint64_t sub_185F52AF8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v2, @"willSwitchToUser on UMPersonaCallbackListener ", v3, v4, v5, v6, v7, v8, v10);

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_185F52BE0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v2, @"readyToSwitchToUser on UMPersonaCallbackListener ", v3, v4, v5, v6, v7, v8, v10);

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_185F52CC8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40( (uint64_t)v2,  @"readyToSwitchToLoginSession on UMPersonaCallbackListener ",  v3,  v4,  v5,  v6,  v7,  v8,  v10);

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_185F52D5C()
{
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F43A40( (uint64_t)v7,  @"userSwitchTaskListDidUpdate on UMPersonaCallbackListener ",  v0,  v1,  v2,  v3,  v4,  v5,  v6);
}

void sub_185F52DE4()
{
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F43A40( (uint64_t)v7,  @"deviceLoginSessionStateDidUpdate on UMPersonaCallbackListener ",  v0,  v1,  v2,  v3,  v4,  v5,  v6);
}

uint64_t sub_185F52EC0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v2, @"Upload content on UMPersonaCallbackListener ", v3, v4, v5, v6, v7, v8, v10);

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_185F52F54()
{
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v7, @"bubbleDidPop on UMPersonaCallbackListener ", v0, v1, v2, v3, v4, v5, v6);
}

uint64_t sub_185F53030(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40( (uint64_t)v2,  @"personaListDidUpdateCompletionHandler on UMPersonaCallbackListener ",  v3,  v4,  v5,  v6,  v7,  v8,  v10);

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_185F53118(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  sub_185F43818();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v4, @"persona Update callback", v5, v6, v7, v8, v9, v10, v22);

  if (v3 && v3[4])
  {
    (*(void (**)(void))(v3[4] + 16LL))();
    uint64_t v11 = sub_185F436A0();
    uint64_t v18 = (void *)v11;
    id v19 = @"personaUpdateCallbackHandler:DONE";
  }

  else
  {
    uint64_t v11 = sub_185F436A0();
    uint64_t v18 = (void *)v11;
    id v19 = @"NO personaUpdateCallbackHandler";
  }

  sub_185F43A40(v11, v19, v12, v13, v14, v15, v16, v17, v23);

  sub_185F3654C();
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = sub_185F53238;
  v24[3] = &unk_189DD4B60;
  id v21 = *(void **)(a1 + 32);
  id v25 = *(id *)(a1 + 40);
  sub_185F3672C((uint64_t)v20, v21, v24);
}

uint64_t sub_185F53238(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40( (uint64_t)v2,  @"Calling personaUpdateCallbackHandler completion handler",  v3,  v4,  v5,  v6,  v7,  v8,  v10);

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_185F53348(uint64_t a1, void *a2)
{
  uint64_t v10 = a2;
  sub_185F43818();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v3, @"<%p> Set up server with connection", v4, v5, v6, v7, v8, v9, *(void *)(a1 + 32));

  sub_185F533B4(v10, *(void **)(a1 + 32));
}

void sub_185F533B4(id *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = a1[2];
    objc_sync_enter(v4);
    id v5 = a1[2];
    objc_msgSend_addObject_(v5, v6, (uint64_t)v3, v7);

    objc_sync_exit(v4);
    objc_msgSend_interfaceWithProtocol_(MEMORY[0x189607B48], v8, (uint64_t)&unk_18C688608, v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRemoteObjectInterface_(v3, v11, (uint64_t)v10, v12);

    objc_msgSend_interfaceWithProtocol_(MEMORY[0x189607B48], v13, (uint64_t)&unk_18C685EB0, v14);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setExportedInterface_(v3, v16, (uint64_t)v15, v17);

    objc_msgSend_setExportedObject_(v3, v18, (uint64_t)a1, v19);
    objc_initWeak(&location, a1);
    objc_initWeak(&from, v3);
    uint64_t v20 = MEMORY[0x1895F87A8];
    v31[0] = MEMORY[0x1895F87A8];
    v31[1] = 3221225472LL;
    v31[2] = sub_185F535BC;
    v31[3] = &unk_189DD4C90;
    objc_copyWeak(&v32, &from);
    objc_msgSend_setInterruptionHandler_(v3, v21, (uint64_t)v31, v22);
    v28[0] = v20;
    v28[1] = 3221225472LL;
    v28[2] = sub_185F5361C;
    v28[3] = &unk_189DD5380;
    objc_copyWeak(&v29, &from);
    objc_copyWeak(&v30, &location);
    objc_msgSend_setInvalidationHandler_(v3, v23, (uint64_t)v28, v24);
    objc_msgSend_resume(v3, v25, v26, v27);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void sub_185F5356C(_Unwind_Exception *a1)
{
}

void sub_185F535BC(uint64_t a1)
{
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_185F43A40((uint64_t)v9, @"<%p> XPC connection interrupted", v3, v4, v5, v6, v7, v8, (uint64_t)WeakRetained);
}

void sub_185F5361C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_185F436A0();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v3, @"<%p> XPC connection invalidated", v4, v5, v6, v7, v8, v9, (uint64_t)WeakRetained);

  sub_185F3654C();
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = objc_loadWeakRetained((id *)(a1 + 40));
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = sub_185F536F8;
  v13[3] = &unk_189DD5358;
  id v14 = WeakRetained;
  id v12 = WeakRetained;
  sub_185F3672C((uint64_t)v10, v11, v13);
}

void sub_185F536F8(uint64_t a1, uint64_t a2)
{
}

void sub_185F53708(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (a1)
  {
    id v3 = *(id *)(a1 + 16);
    objc_sync_enter(v3);
    id v4 = *(id *)(a1 + 16);
    objc_msgSend_removeObject_(v4, v5, (uint64_t)v7, v6);

    objc_sync_exit(v3);
  }
}

void sub_185F53770(_Unwind_Exception *a1)
{
}

void sub_185F537CC()
{
  os_log_t v0 = os_log_create(off_18C6820F0, "persona");
  uint64_t v1 = (void *)qword_18C682AB8;
  qword_18C682AB8 = (uint64_t)v0;
}

id sub_185F5393C(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v53 = (void *)objc_opt_self();
  id v3 = (void *)MEMORY[0x189604010];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  objc_opt_class();
  objc_opt_class();
  uint64_t v52 = v5;
  objc_msgSend_setWithObjects_(v3, v6, v4, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v54 = 0LL;
  objc_msgSend_unarchivedObjectOfClasses_fromData_error_(MEMORY[0x189607908], v9, (uint64_t)v8, (uint64_t)v2, &v54);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  id v11 = v54;
  sub_185F436A0();
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    uint64_t v19 = @"SUCCESSFUL unarchive of switch context \n";
  }

  else
  {
    uint64_t v52 = (uint64_t)v11;
    uint64_t v19 = @"Failed to unarchive the switch context with an error:%@ \n";
  }

  sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, v19, v12, v13, v14, v15, v16, v17, v52);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v18, v20);

  objc_msgSend_objectForKeyedSubscript_(v10, v21, (uint64_t)@"setupData", v22);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v24, (uint64_t)@"shortLivedToken", v25);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v27, (uint64_t)@"secondaryActionRequired", v28);
  id v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v30, (uint64_t)@"environmentsByServices", v31);
  id v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (sub_185F38F68())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      sub_185F436A0();
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_description(v32, v37, v38, v39);
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Switching to the following environments: \n%@",  v41,  v42,  v43,  v44,  v45,  v46,  (uint64_t)v40);
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A98((uint64_t)v36, v47);

      sub_185F53BB0((uint64_t)v53, v32);
    }
  }

  uint64_t v48 = objc_msgSend_BOOLValue(v29, v33, v34, v35);
  objc_msgSend_contextWithSetupData_shortLivedToken_secondaryActionRequired_(v53, v49, (uint64_t)v23, (uint64_t)v26, v48);
  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();

  return v50;
}

void sub_185F53BB0(uint64_t a1, void *a2)
{
  uint64_t v173 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  objc_opt_self();
  uint64_t v154 = 0LL;
  uint64_t v155 = &v154;
  uint64_t v156 = 0x2050000000LL;
  id v3 = (void *)qword_18C682BD8;
  uint64_t v157 = (uint64_t (*)(uint64_t, uint64_t))qword_18C682BD8;
  if (!qword_18C682BD8)
  {
    uint64_t v160 = MEMORY[0x1895F87A8];
    uint64_t v161 = 3221225472LL;
    uint64_t v162 = (uint64_t)sub_185F5477C;
    uint64_t v163 = (uint64_t (*)(uint64_t, uint64_t))&unk_189DD5430;
    uint64_t v164 = (void (*)(uint64_t))&v154;
    sub_185F5477C((uint64_t)&v160);
    id v3 = (void *)v155[3];
  }

  uint64_t v4 = v3;
  _Block_object_dispose(&v154, 8);
  id v126 = objc_alloc_init(v4);
  __int128 v168 = 0u;
  __int128 v169 = 0u;
  __int128 v166 = 0u;
  __int128 v167 = 0u;
  id obj = v2;
  uint64_t v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v166, (uint64_t)v172, 16);
  if (v122)
  {
    uint64_t v121 = *(void *)v167;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v167 != v121)
        {
          uint64_t v7 = v6;
          objc_enumerationMutation(obj);
          uint64_t v6 = v7;
        }

        uint64_t v124 = v6;
        id v8 = *(id *)(*((void *)&v166 + 1) + 8 * v6);
        objc_msgSend_objectForKeyedSubscript_(obj, v9, (uint64_t)v8, v10);
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        sub_185F436A0();
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"About to switch to:\n\tService name: '%@'\n\tEnvironment name: '%@'\n\n",  v13,  v14,  v15,  v16,  v17,  v18,  (uint64_t)v8);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        sub_185F43A98((uint64_t)v12, v19);

        uint64_t v160 = 0LL;
        uint64_t v161 = (uint64_t)&v160;
        uint64_t v162 = 0x3032000000LL;
        uint64_t v163 = sub_185F54614;
        uint64_t v164 = sub_185F54624;
        id v165 = 0LL;
        uint64_t v154 = 0LL;
        uint64_t v155 = &v154;
        uint64_t v156 = 0x3032000000LL;
        uint64_t v157 = sub_185F54614;
        uint64_t v158 = sub_185F54624;
        id v159 = 0LL;
        dispatch_semaphore_t v20 = dispatch_semaphore_create(0LL);
        v150[0] = MEMORY[0x1895F87A8];
        v150[1] = 3221225472LL;
        v150[2] = sub_185F5462C;
        v150[3] = &unk_189DD53E0;
        uint64_t v152 = &v160;
        uint64_t v153 = &v154;
        id v21 = v20;
        uint64_t v151 = v21;
        objc_msgSend_servicesWithForcePoll_completion_(v126, v22, 0, (uint64_t)v150);
        v125 = v21;
        dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
        __int128 v148 = 0u;
        __int128 v149 = 0u;
        __int128 v146 = 0u;
        __int128 v147 = 0u;
        id v23 = *(id *)(v161 + 40);
        uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v146, (uint64_t)v171, 16);
        if (v28)
        {
          uint64_t v29 = *(void *)v147;
LABEL_10:
          uint64_t v30 = 0LL;
          while (1)
          {
            if (*(void *)v147 != v29) {
              objc_enumerationMutation(v23);
            }
            uint64_t v31 = *(void **)(*((void *)&v146 + 1) + 8 * v30);
            objc_msgSend_identifier(v31, v25, v26, v27);
            id v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_name(v31, v35, v36, v37);
            uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
            BOOL v41 = objc_msgSend_caseInsensitiveCompare_(v38, v39, (uint64_t)v8, v40) == 0;

            if (v41) {
              goto LABEL_19;
            }
            if (v28 == ++v30)
            {
              uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_( v23,  v25,  (uint64_t)&v146,  (uint64_t)v171,  16);
              if (v28) {
                goto LABEL_10;
              }
              goto LABEL_17;
            }
          }

LABEL_19:
          id v42 = v31;

          if (v42) {
            goto LABEL_21;
          }
        }

        else
        {
LABEL_17:
        }

        sub_185F436A0();
        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
        sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Service '%@' not found.\n\n",  v47,  v48,  v49,  v50,  v51,  v52,  (uint64_t)v8);
        uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
        sub_185F43A98((uint64_t)v46, v53);

        id v42 = 0LL;
LABEL_21:
        __int128 v144 = 0u;
        __int128 v145 = 0u;
        __int128 v142 = 0u;
        __int128 v143 = 0u;
        objc_msgSend_environments(v42, v43, v44, v45);
        id v54 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v55, (uint64_t)&v142, (uint64_t)v170, 16);
        uint64_t v127 = v42;
        if (v59)
        {
          uint64_t v60 = *(void *)v143;
          while (2)
          {
            for (uint64_t i = 0LL; i != v59; ++i)
            {
              if (*(void *)v143 != v60) {
                objc_enumerationMutation(v54);
              }
              uint64_t v62 = *(void **)(*((void *)&v142 + 1) + 8 * i);
              objc_msgSend_identifier(v62, v56, v57, v58);
              uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend_caseInsensitiveCompare_(v63, v64, (uint64_t)v11, v65))
              {

LABEL_33:
                id v73 = v62;
                goto LABEL_34;
              }

              objc_msgSend_name(v62, v66, v67, v68);
              uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
              BOOL v72 = objc_msgSend_caseInsensitiveCompare_(v69, v70, (uint64_t)v11, v71) == 0;

              if (v72) {
                goto LABEL_33;
              }
            }

            uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v56, (uint64_t)&v142, (uint64_t)v170, 16);
            id v73 = 0LL;
            if (v59) {
              continue;
            }
            break;
          }
        }

        else
        {
          id v73 = 0LL;
        }

void sub_185F54358( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

uint64_t *sub_185F543D8(uint64_t *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a1;
  if (a1)
  {
    objc_msgSend_dictionaryWithCapacity_(MEMORY[0x189603FC8], a2, 3, a4);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setupData(v4, v6, v7, v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend_setupData(v4, v10, v11, v12);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v5, v14, (uint64_t)v13, (uint64_t)@"setupData");
    }

    objc_msgSend_shortLivedToken(v4, v10, v11, v12);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend_shortLivedToken(v4, v16, v17, v18);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v5, v20, (uint64_t)v19, (uint64_t)@"shortLivedToken");
    }

    id v21 = (void *)MEMORY[0x189607968];
    uint64_t v22 = objc_msgSend_secondaryActionRequired(v4, v16, v17, v18);
    objc_msgSend_numberWithBool_(v21, v23, v22, v24);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v5, v26, (uint64_t)v25, (uint64_t)@"secondaryActionRequired");

    if (v4[4]) {
      objc_msgSend_setObject_forKeyedSubscript_(v5, v27, v4[4], (uint64_t)@"environmentsByServices");
    }
    uint64_t v4 = (uint64_t *)objc_msgSend_copy(v5, v27, v28, v29);
  }

  return v4;
}

id sub_185F54504(uint64_t *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = (void *)MEMORY[0x1896078F8];
  sub_185F543D8(a1, a2, a3, a4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v20 = 0LL;
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(v4, v6, (uint64_t)v5, 1, &v20);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v20;

  sub_185F436A0();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    uint64_t v16 = @"SUCCESSFUL archive of switch context\n";
  }

  else
  {
    uint64_t v19 = (uint64_t)v8;
    uint64_t v16 = @"Failed to archive the switch context with an error:%@ \n";
  }

  sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, v16, v9, v10, v11, v12, v13, v14, v19);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v15, v17);

  return v7;
}

uint64_t sub_185F54614(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_185F54624(uint64_t a1)
{
}

void sub_185F5462C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_185F546B4(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

Class sub_185F5477C(uint64_t a1)
{
  if (!qword_18C682BE0)
  {
    qword_18C682BE0 = _sl_dlopen();
    if (!qword_18C682BE0)
    {
      abort_report_np();
LABEL_6:
      sub_185F56E74();
    }
  }

  Class result = objc_getClass("SWSwitchController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    goto LABEL_6;
  }
  qword_18C682BD8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

id sub_185F54870(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)objc_opt_new();
  objc_msgSend_setUid_(v3, v4, a2, v5);
  return v3;
}

BOOL sub_185F548EC(void *a1, void *a2)
{
  if (!a1) {
    return 0LL;
  }
  id v3 = a1;
  objc_sync_enter(v3);
  if ((byte_18C682BE8 & 1) != 0)
  {
    sub_185F436A0();
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A40( (uint64_t)v4,  @"Error: this process is not entitled to access user properties",  v5,  v6,  v7,  v8,  v9,  v10,  v19);

    sub_185F37354((uint64_t)&OBJC_CLASS___UMError, 7uLL);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    BOOL v14 = 0LL;
    goto LABEL_11;
  }

  id v20 = 0LL;
  BOOL v14 = sub_185F3D6F4((uint64_t)&OBJC_CLASS___UMMobileKeyBag, v3, &v20);
  id v15 = v20;
  uint64_t v13 = v15;
  if (v15) {
    char v17 = v14;
  }
  else {
    char v17 = 1;
  }
  if ((v17 & 1) == 0)
  {
    if (objc_msgSend_code(v15, v11, v16, v12) != 7) {
      goto LABEL_10;
    }
    BOOL v14 = 0LL;
    byte_18C682BE8 = 1;
  }

void sub_185F54A0C(_Unwind_Exception *a1)
{
}

void sub_185F54A20(void *a1)
{
  if (a1)
  {
    id obj = a1;
    objc_sync_enter(obj);
    objc_sync_exit(obj);
  }

void sub_185F54A84( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_185F54F20(void *a1@<X0>, const char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(_OWORD *)(a5 + 32) = 0u;
  *(_OWORD *)(a5 + 4_Block_object_dispose((const void *)(v13 - 112), 8) = 0u;
  *(_OWORD *)a5 = 0u;
  *(_OWORD *)(a5 + 16) = 0u;
  if (a1)
  {
    int v6 = objc_msgSend_uid(a1, a2, a3, a4);
    if (quotactl("/private/var", 458752, v6, &v30))
    {
      uint64_t v13 = *__error();
      BOOL v14 = @"Error getting quota status";
LABEL_4:
      sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, v14, v7, v8, v9, v10, v11, v12, v29);
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F46B40((uint64_t)v15, @"error num: %d", v16, v17, v18, v19, v20, v21, v13);
      sub_185F436A0();
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A98((uint64_t)v22, v15);

LABEL_5:
      return;
    }

    if (!v30)
    {
      sub_185F436A0();
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A40((uint64_t)v15, @"Quotas are off", v23, v24, v25, v26, v27, v28, v29);
      goto LABEL_5;
    }

    if (quotactl("/private/var", 196608, v6, (caddr_t)a5))
    {
      uint64_t v13 = *__error();
      BOOL v14 = @"Error getting quota";
      goto LABEL_4;
    }
  }

uint64_t sub_185F5540C(uint64_t result, void *a2)
{
  if (result)
  {
    uint64_t v2 = (void *)result;
    id v3 = a2;
    uint64_t v7 = objc_msgSend_uid(v3, v4, v5, v6);
    objc_msgSend_setUid_(v2, v8, v7, v9);
    uint64_t v13 = objc_msgSend_gid(v3, v10, v11, v12);
    objc_msgSend_setGid_(v2, v14, v13, v15);
    objc_msgSend_alternateDSID(v3, v16, v17, v18);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAlternateDSID_(v2, v20, (uint64_t)v19, v21);

    objc_msgSend_homeDirectoryURL(v3, v22, v23, v24);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHomeDirectoryURL_(v2, v26, (uint64_t)v25, v27);

    objc_msgSend_username(v3, v28, v29, v30);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUsername_(v2, v32, (uint64_t)v31, v33);

    objc_msgSend_givenName(v3, v34, v35, v36);
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGivenName_(v2, v38, (uint64_t)v37, v39);

    objc_msgSend_familyName(v3, v40, v41, v42);
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFamilyName_(v2, v44, (uint64_t)v43, v45);

    objc_msgSend_displayName(v3, v46, v47, v48);
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDisplayName_(v2, v50, (uint64_t)v49, v51);

    objc_msgSend_photoURL(v3, v52, v53, v54);
    uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPhotoURL_(v2, v56, (uint64_t)v55, v57);

    objc_msgSend_userAuxiliaryString(v3, v58, v59, v60);
    uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserAuxiliaryString_(v2, v62, (uint64_t)v61, v63);

    objc_msgSend__photo(v3, v64, v65, v66);
    uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_set_photo_(v2, v68, (uint64_t)v67, v69);

    objc_msgSend_creationDate(v3, v70, v71, v72);
    id v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCreationDate_(v2, v74, (uint64_t)v73, v75);

    objc_msgSend_lastLoginDate(v3, v76, v77, v78);
    uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastLoginDate_(v2, v80, (uint64_t)v79, v81);

    objc_msgSend_lastRemoteAuthDate(v3, v82, v83, v84);
    uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastRemoteAuthDate_(v2, v86, (uint64_t)v85, v87);

    uint64_t v91 = objc_msgSend_passcodeType(v3, v88, v89, v90);
    objc_msgSend_setPasscodeType_(v2, v92, v91, v93);
    uint64_t isAuditor = objc_msgSend_isAuditor(v3, v94, v95, v96);
    objc_msgSend_setIsAuditor_(v2, v98, isAuditor, v99);
    uint64_t isLoginUser = objc_msgSend_isLoginUser(v3, v100, v101, v102);
    objc_msgSend_setIsLoginUser_(v2, v104, isLoginUser, v105);
    uint64_t isDisabled = objc_msgSend_isDisabled(v3, v106, v107, v108);
    objc_msgSend_setIsDisabled_(v2, v110, isDisabled, v111);
    uint64_t isTransientUser = objc_msgSend_isTransientUser(v3, v112, v113, v114);
    objc_msgSend_setIsTransientUser_(v2, v116, isTransientUser, v117);
    uint64_t isPrimaryUser = objc_msgSend_isPrimaryUser(v3, v118, v119, v120);
    objc_msgSend_setIsPrimaryUser_(v2, v122, isPrimaryUser, v123);
    uint64_t isAdminUser = objc_msgSend_isAdminUser(v3, v124, v125, v126);
    objc_msgSend_setIsAdminUser_(v2, v128, isAdminUser, v129);
    uint64_t v133 = objc_msgSend_passcodeLockGracePeriod(v3, v130, v131, v132);
    objc_msgSend_setPasscodeLockGracePeriod_(v2, v134, v133, v135);
    objc_msgSend_languages(v3, v136, v137, v138);
    uint64_t v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLanguages_(v2, v140, (uint64_t)v139, v141);

    uint64_t hasManagedCredentials = objc_msgSend_hasManagedCredentials(v3, v142, v143, v144);
    objc_msgSend_setHasManagedCredentials_(v2, v146, hasManagedCredentials, v147);
    uint64_t v151 = objc_msgSend_dataQuota(v3, v148, v149, v150);
    objc_msgSend_setDataQuota_(v2, v152, v151, v153);
    uint64_t v157 = objc_msgSend_dataUsed(v3, v154, v155, v156);
    objc_msgSend_setDataUsed_(v2, v158, v157, v159);
    uint64_t hasDataToSync = objc_msgSend_hasDataToSync(v3, v160, v161, v162);
    objc_msgSend_setHasDataToSync_(v2, v164, hasDataToSync, v165);
    objc_msgSend_errorCausingLogout(v3, v166, v167, v168);
    __int128 v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setErrorCausingLogout_(v2, v170, (uint64_t)v169, v171);

    objc_msgSend_debugErrorCausingLogout(v3, v172, v173, v174);
    uint64_t v175 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setDebugErrorCausingLogout_(v2, v176, (uint64_t)v175, v177);
    return objc_msgSend_setShouldFetchAttributes_(v2, v178, 0, v179);
  }

  return result;
}

void sub_185F55808(_Unwind_Exception *a1)
{
}

uint64_t sub_185F55D40()
{
  uint64_t result = getpid();
  dword_18C682BF0 = result;
  return result;
}

void sub_185F55EAC(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 40LL);
  }
}

void sub_185F565A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_185F565C0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_185F565D0(uint64_t a1)
{
}

void sub_185F565D8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v6 = 0LL;
  char v3 = sub_185F3A0F0((uint64_t)&OBJC_CLASS___UMMobileKeyBag, v2, &v6);
  id v4 = v6;
  id v5 = v6;
  if ((v3 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), v4);
  }
}

uint64_t sub_185F56948(uint64_t result, void *a2)
{
  if (result)
  {
    uint64_t v2 = (void *)result;
    id v3 = a2;
    uint64_t v7 = objc_msgSend_uid(v3, v4, v5, v6);
    objc_msgSend_setUid_(v2, v8, v7, v9);
    uint64_t v13 = objc_msgSend_gid(v3, v10, v11, v12);
    objc_msgSend_setGid_(v2, v14, v13, v15);
    uint64_t isEnterprisePersona = objc_msgSend_isEnterprisePersona(v3, v16, v17, v18);
    objc_msgSend_setIsEnterprisePersona_(v2, v20, isEnterprisePersona, v21);
    uint64_t isPersonalPersona = objc_msgSend_isPersonalPersona(v3, v22, v23, v24);
    objc_msgSend_setIsPersonalPersona_(v2, v26, isPersonalPersona, v27);
    uint64_t isSystemPersona = objc_msgSend_isSystemPersona(v3, v28, v29, v30);
    objc_msgSend_setIsSystemPersona_(v2, v32, isSystemPersona, v33);
    uint64_t isDefaultPersona = objc_msgSend_isDefaultPersona(v3, v34, v35, v36);
    objc_msgSend_setIsDefaultPersona_(v2, v38, isDefaultPersona, v39);
    uint64_t isGuestPersona = objc_msgSend_isGuestPersona(v3, v40, v41, v42);
    objc_msgSend_setIsGuestPersona_(v2, v44, isGuestPersona, v45);
    uint64_t isDataSeparatedPersona = objc_msgSend_isDataSeparatedPersona(v3, v46, v47, v48);
    objc_msgSend_setIsDataSeparatedPersona_(v2, v50, isDataSeparatedPersona, v51);
    uint64_t isDisabled = objc_msgSend_isDisabled(v3, v52, v53, v54);
    objc_msgSend_setIsDisabled_(v2, v56, isDisabled, v57);
    objc_msgSend_userPersonaUniqueString(v3, v58, v59, v60);
    uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserPersonaUniqueString_(v2, v62, (uint64_t)v61, v63);

    objc_msgSend_userPersonaNickName(v3, v64, v65, v66);
    uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserPersonaNickName_(v2, v68, (uint64_t)v67, v69);

    uint64_t v73 = objc_msgSend_userPersonaType(v3, v70, v71, v72);
    return objc_msgSend_setUserPersonaType_(v2, v74, v73, v75);
  }

  return result;
}

LABEL_15:
  return isEqualToString;
}

void sub_185F56E1C()
{
}

void sub_185F56E34()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_error_impl(&dword_185F35000, 0LL, OS_LOG_TYPE_ERROR, "Failed to fetch our own audit token", v0, 2u);
}

void sub_185F56E74()
{
  os_log_t v0 = (const __CFAllocator *)abort_report_np();
  CFArrayCreateMutable(v0, v1, v2);
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602690]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1896027D0](BOOLean);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x189602AC8]();
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy( CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BC8](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFErrorRef CFErrorCreate( CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x189602C60](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

void CFNotificationCenterAddObserver( CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x189602E50]();
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithStream( CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x189603000](allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWrite( CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x189603018](propertyList, stream, format, options, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithBytesNoCopy( CFAllocatorRef alloc, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFReadStreamRef)MEMORY[0x189603050](alloc, bytes, length, bytesDeallocator);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x189603098](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x189603878](alloc, uuidStr);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x189603888](alloc, uuid);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x189603920](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x189603930](alloc, bufferAllocator);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x189603960](stream);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1896136F0]();
}

uint64_t MKBUserSessionGetUserLockStateInfo()
{
  return MEMORY[0x189611530]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1895F8D68]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1895F8D78]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1895F8D88]();
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1895F8DE0]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x189612738]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x1895F9308]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

uint64_t csops_audittoken()
{
  return MEMORY[0x1895FAAA8]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class( dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD78](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

gid_t getgid(void)
{
  return MEMORY[0x1895FB550]();
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1895FB670](*(void *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1895FB6E8]();
}

kern_return_t host_get_multiuser_config_flags(host_t host, uint32_t *multiuser_flags)
{
  return MEMORY[0x1895FB778](*(void *)&host, multiuser_flags);
}

uint64_t kpersona_getpath()
{
  return MEMORY[0x1895FB900]();
}

uint64_t kpersona_info()
{
  return MEMORY[0x1895FB908]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1895FBAD0]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FBB28](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1895FBBA8](*(void *)&task, *(void *)&name, ptype);
}

uint64_t mach_voucher_persona_self()
{
  return MEMORY[0x1895FBC60]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1895FC190](*(void *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1895FC198](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1895FC1B0](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1895FC1B8](name, out_token);
}

uint64_t notify_register_plain()
{
  return MEMORY[0x1895FC1D8]();
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1895FC1E8](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1896166B8](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pipe(int a1[2])
{
  return MEMORY[0x1895FC7B0](a1);
}

int quotactl(const char *a1, int a2, int a3, caddr_t a4)
{
  return MEMORY[0x1895FCBD8](a1, *(void *)&a2, *(void *)&a3, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895FCC80](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F8](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1895FD108](__big, __little, __len);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

kern_return_t task_info( task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1895FD320](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

uint64_t voucher_adopt()
{
  return MEMORY[0x1895FD5B8]();
}

uint64_t voucher_copy()
{
  return MEMORY[0x1895FD5C0]();
}

uint64_t voucher_copy_with_persona_mach_voucher()
{
  return MEMORY[0x1895FD5C8]();
}

uint64_t voucher_get_current_persona()
{
  return MEMORY[0x1895FD5D0]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1895FDA60]();
}

uint64_t xpc_mach_send_copy_right()
{
  return MEMORY[0x1895FDF10]();
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x1895FDF18]();
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1895FE040]();
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1895FE0E8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1895FE0F0]();
}

uint64_t objc_msgSend_addUserSwitchBlockingTask_forPID_completionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_addUserSwitchBlockingTask_forPID_completionHandler_, a3, a4);
}

uint64_t objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_archivedDataWithRootObject_requiringSecureCoding_error_, a3, a4);
}

uint64_t objc_msgSend_bundleIdentifiersForPersona_completionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_bundleIdentifiersForPersona_completionHandler_, a3, a4);
}

uint64_t objc_msgSend_contextWithSetupData_shortLivedToken_secondaryActionRequired_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_contextWithSetupData_shortLivedToken_secondaryActionRequired_, a3, a4);
}

uint64_t objc_msgSend_createPersona_passcodeData_passcodeDataType_forPid_completionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_createPersona_passcodeData_passcodeDataType_forPid_completionHandler_, a3, a4);
}

uint64_t objc_msgSend_dataMigrationSetup_withSecret_oldSize_reply_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_dataMigrationSetup_withSecret_oldSize_reply_, a3, a4);
}

uint64_t objc_msgSend_directSwitchToUser_passcodeData_context_preferences_completionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_directSwitchToUser_passcodeData_context_preferences_completionHandler_, a3, a4);
}

uint64_t objc_msgSend_directSwitchToUser_passcodeData_context_preferences_pid_completionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_directSwitchToUser_passcodeData_context_preferences_pid_completionHandler_, a3, a4);
}

uint64_t objc_msgSend_fetchAllUsersPersonaListforPid_withCompletionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_fetchAllUsersPersonaListforPid_withCompletionHandler_, a3, a4);
}

uint64_t objc_msgSend_fetchBundleIdentifiersForPersona_forPid_completionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_fetchBundleIdentifiersForPersona_forPid_completionHandler_, a3, a4);
}

uint64_t objc_msgSend_fetchMultiPersonaBundleIdentifiersforPid_withCompletionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_fetchMultiPersonaBundleIdentifiersforPid_withCompletionHandler_, a3, a4);
}

uint64_t objc_msgSend_fetchPersonaGenerationNumberWithCompletionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_fetchPersonaGenerationNumberWithCompletionHandler_, a3, a4);
}

uint64_t objc_msgSend_fetchPersonaListforPid_withCompletionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_fetchPersonaListforPid_withCompletionHandler_, a3, a4);
}

uint64_t objc_msgSend_fetchUserSwitchBlockingTaskListWithCompletionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_fetchUserSwitchBlockingTaskListWithCompletionHandler_, a3, a4);
}

uint64_t objc_msgSend_grantSandboxExtensionForPersonaWithUniqueString_completionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_grantSandboxExtensionForPersonaWithUniqueString_completionHandler_, a3, a4);
}

uint64_t objc_msgSend_listSyncServiceSourcesForUserSession_withReply_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_listSyncServiceSourcesForUserSession_withReply_, a3, a4);
}

uint64_t objc_msgSend_localizedStringFromPersonNameComponents_style_options_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_localizedStringFromPersonNameComponents_style_options_, a3, a4);
}

uint64_t objc_msgSend_logoutToLoginSessionWithPID_completionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_logoutToLoginSessionWithPID_completionHandler_, a3, a4);
}

uint64_t objc_msgSend_personaAttributesForPersonaUniqueString_withError_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_personaAttributesForPersonaUniqueString_withError_, a3, a4);
}

uint64_t objc_msgSend_personaLoginWithPid_WithUserODuuid_withUid_completionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_personaLoginWithPid_WithUserODuuid_withUid_completionHandler_, a3, a4);
}

uint64_t objc_msgSend_personaLogoutWithPid_WithUserODuuid_withUid_completionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_personaLogoutWithPid_WithUserODuuid_withUid_completionHandler_, a3, a4);
}

uint64_t objc_msgSend_registerCriticalUserSwitchStakeholderForPID_completionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_registerCriticalUserSwitchStakeholderForPID_completionHandler_, a3, a4);
}

uint64_t objc_msgSend_registerUserPersonaObserverForPID_withMachServiceName_completionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_registerUserPersonaObserverForPID_withMachServiceName_completionHandler_, a3, a4);
}

uint64_t objc_msgSend_registerUserSwitchStakeHolder_completionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_registerUserSwitchStakeHolder_completionHandler_, a3, a4);
}

uint64_t objc_msgSend_registerUserSwitchStakeholderForPID_completionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_registerUserSwitchStakeholderForPID_completionHandler_, a3, a4);
}

uint64_t objc_msgSend_registerUserSyncStakeholder_withMachServiceName_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_registerUserSyncStakeholder_withMachServiceName_, a3, a4);
}

uint64_t objc_msgSend_registerUserSyncStakeholderForPID_machServiceName_completionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_registerUserSyncStakeholderForPID_machServiceName_completionHandler_, a3, a4);
}

uint64_t objc_msgSend_removeUserSwitchBlockingTask_forPID_completionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_removeUserSwitchBlockingTask_forPID_completionHandler_, a3, a4);
}

uint64_t objc_msgSend_removeUserSyncTask_forPID_completionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_removeUserSyncTask_forPID_completionHandler_, a3, a4);
}

uint64_t objc_msgSend_replacePersonaMachPortVoucher_withAccountID_generationSet_forPid_withReply_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718]( a1,  sel_replacePersonaMachPortVoucher_withAccountID_generationSet_forPid_withReply_,  a3,  a4);
}

uint64_t objc_msgSend_retrieveUserSessionSecureBackupBlobwithReply_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_retrieveUserSessionSecureBackupBlobwithReply_, a3, a4);
}

uint64_t objc_msgSend_setBundlesIdentifiers_forPersona_completionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_setBundlesIdentifiers_forPersona_completionHandler_, a3, a4);
}

uint64_t objc_msgSend_setMultiPersonaBundlesIdentifiers_forPid_WithcompletionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_setMultiPersonaBundlesIdentifiers_forPid_WithcompletionHandler_, a3, a4);
}

uint64_t objc_msgSend_setSinglePersonaBundlesIdentifiers_forPersona_forPid_completionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_setSinglePersonaBundlesIdentifiers_forPersona_forPid_completionHandler_, a3, a4);
}

uint64_t objc_msgSend_setUserKeybagOpaqueData_keybagBlob_withReply_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_setUserKeybagOpaqueData_keybagBlob_withReply_, a3, a4);
}

uint64_t objc_msgSend_switchToUser_passcodeData_context_preferences_completionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_switchToUser_passcodeData_context_preferences_completionHandler_, a3, a4);
}

uint64_t objc_msgSend_switchToUser_passcodeData_context_preferences_pid_completionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_switchToUser_passcodeData_context_preferences_pid_completionHandler_, a3, a4);
}

uint64_t objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_synchronousRemoteObjectProxyWithErrorHandler_, a3, a4);
}

uint64_t objc_msgSend_terminateSyncBubbleForPID_completionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_terminateSyncBubbleForPID_completionHandler_, a3, a4);
}

uint64_t objc_msgSend_unregisterStakeholderForPID_status_reason_completionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, ...)
{
  return MEMORY[0x189616718](a1, sel_unregisterStakeholderForPID_status_reason_completionHandler_, a3, a4);
}