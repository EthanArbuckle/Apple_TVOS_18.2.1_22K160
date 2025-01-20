BOOL _localBTAccessoryManagerCallbacksRegistered(uint64_t a1, void *a2)
{
  unint64_t v4;
  BOOL v5;
  __int128 *v6;
  BOOL v7;
  BOOL v8;
  pthread_mutex_lock(&gLock);
  v4 = 0LL;
  v5 = 1;
  v6 = &gBTAccessoryManagerCallbackList;
  do
  {
    if (*((void *)v6 + 4) == a1)
    {
      v7 = *(void *)v6 == *a2 && *((void *)v6 + 1) == a2[1];
      v8 = v7 && *((void *)v6 + 2) == a2[2];
      if (v8 && *((void *)v6 + 3) == a2[3]) {
        break;
      }
    }

    v5 = v4 < 0x3F;
    v6 += 4;
    ++v4;
  }

  while (v4 != 64);
  pthread_mutex_unlock(&gLock);
  return v5;
}

BOOL _localBTAccessoryManagerCustomCallbacksRegistered(uint64_t a1, void *a2, int a3)
{
  unint64_t v6 = 0LL;
  BOOL v7 = 1;
  v8 = &gBTAccessoryManagerCustomCallbackList;
  do
  {
    if (v8[1] == a1 && *v8 == *a2 && *((_DWORD *)v8 + 4) == a3) {
      break;
    }
    BOOL v7 = v6 < 0x3F;
    v8 += 6;
    ++v6;
  }

  while (v6 != 64);
  pthread_mutex_unlock(&gLock);
  return v7;
}

uint64_t _localBTAccessoryManagerAddCallbacks(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  pthread_mutex_lock(&gLock);
  uint64_t v10 = 0LL;
  v11 = &qword_18C4BBAB8;
  while (*v11 || v11[2])
  {
    ++v10;
    v11 += 8;
    if (v10 == 64)
    {
      uint64_t v12 = 4LL;
      goto LABEL_11;
    }
  }

  uint64_t v13 = ++gCBID;
  v11[2] = gCBID;
  v11[3] = a4;
  uint64_t *v11 = a1;
  __int128 v14 = a3[1];
  *((_OWORD *)v11 - 2) = *a3;
  *((_OWORD *)v11 - 1) = v14;
  v11[1] = a2;
  *a5 = v13;
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  v15 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = *v11;
    uint64_t v18 = v11[2];
    uint64_t v19 = v11[3];
    v20[0] = 67109888;
    v20[1] = v10;
    __int16 v21 = 2048;
    uint64_t v22 = v17;
    __int16 v23 = 2048;
    uint64_t v24 = v18;
    __int16 v25 = 2048;
    uint64_t v26 = v19;
    _os_log_debug_impl( &dword_1870FD000,  v15,  OS_LOG_TYPE_DEBUG,  "_localBTAccessoryManagerAddCallbacks[%d] manager:%p cbid:%llx userData:%p ",  (uint8_t *)v20,  0x26u);
  }

  uint64_t v12 = 0LL;
LABEL_11:
  pthread_mutex_unlock(&gLock);
  return v12;
}

uint64_t _localBTAccessoryManagerAddCustomCallbacks( uint64_t a1, uint64_t a2, void *a3, int a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  pthread_mutex_lock(&gLock);
  uint64_t v12 = 0LL;
  uint64_t v13 = &unk_18C4BE5F0;
  while (*(v13 - 4) || *(v13 - 1))
  {
    ++v12;
    v13 += 6;
    if (v12 == 64)
    {
      uint64_t v14 = 4LL;
      goto LABEL_11;
    }
  }

  *((_DWORD *)v13 - 6) = a4;
  uint64_t v15 = ++gCBID;
  *(v13 - 1) = gCBID;
  *uint64_t v13 = a5;
  *(v13 - 4) = a1;
  *(v13 - 5) = *a3;
  *(v13 - 2) = a2;
  *a6 = v15;
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  v16 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = *(v13 - 4);
    uint64_t v19 = *(v13 - 1);
    uint64_t v20 = *v13;
    v21[0] = 67110144;
    v21[1] = v12;
    __int16 v22 = 2048;
    uint64_t v23 = v18;
    __int16 v24 = 2048;
    uint64_t v25 = v19;
    __int16 v26 = 2048;
    uint64_t v27 = v20;
    __int16 v28 = 1024;
    int v29 = a4;
    _os_log_debug_impl( &dword_1870FD000,  v16,  OS_LOG_TYPE_DEBUG,  "_localBTAccessoryManagerAddCustomCallbacks[%d] manager:%p cbid:%llx userData:%p clientType:0x%X",  (uint8_t *)v21,  0x2Cu);
  }

  uint64_t v14 = 0LL;
LABEL_11:
  pthread_mutex_unlock(&gLock);
  return v14;
}

uint64_t _localBTAccessoryManagerRemoveCallbacks(uint64_t a1, void *a2)
{
  uint64_t v4 = 0LL;
  while (1)
  {
    v5 = &gBTAccessoryManagerCallbackList[v4];
    if (*(void *)&gBTAccessoryManagerCallbackList[v4 + 2] == a1)
    {
      uint64_t v6 = *(void *)v5;
      uint64_t v7 = *((void *)v5 + 1);
      uint64_t v9 = *((void *)v5 + 2);
      uint64_t v8 = *((void *)v5 + 3);
      BOOL v10 = v6 == *a2 && v7 == a2[1];
      BOOL v11 = v10 && v9 == a2[2];
      if (v11 && v8 == a2[3]) {
        break;
      }
    }

    v4 += 4LL;
    if (v4 == 256) {
      goto LABEL_16;
    }
  }

  uint64_t v13 = &gBTAccessoryManagerCallbackList[v4];
  v13[2] = 0u;
  v13[3] = 0u;
  *uint64_t v13 = 0u;
  v13[1] = 0u;
LABEL_16:
  pthread_mutex_unlock(&gLock);
  return 0LL;
}

uint64_t _localBTAccessoryManagerRemoveAllCallbacksByXpcConnection(uint64_t a1)
{
  for (uint64_t i = 0LL; i != 256; i += 4LL)
  {
    v3 = &gBTAccessoryManagerCallbackList[i];
    if (*((void *)&gBTAccessoryManagerCallbackList[i + 2] + 1) == a1)
    {
      v3[2] = 0uLL;
      v3[3] = 0uLL;
      __int128 *v3 = 0uLL;
      v3[1] = 0uLL;
    }
  }

  for (uint64_t j = 0LL; j != 384; j += 6LL)
  {
    v5 = &gBTAccessoryManagerCustomCallbackList[j];
    if (gBTAccessoryManagerCustomCallbackList[j + 3] == a1)
    {
      *((_OWORD *)v5 + 1) = 0uLL;
      *((_OWORD *)v5 + 2) = 0uLL;
      *(_OWORD *)v5 = 0uLL;
    }
  }

  pthread_mutex_unlock(&gLock);
  return 0LL;
}

uint64_t _localBTAccessoryManagerRemoveCustomCallbacks(uint64_t a1, void *a2)
{
  uint64_t v4 = 0LL;
  while (gBTAccessoryManagerCustomCallbackList[v4 + 1] != a1 || gBTAccessoryManagerCustomCallbackList[v4] != *a2)
  {
    v4 += 6LL;
    if (v4 == 384) {
      goto LABEL_7;
    }
  }

  v5 = &gBTAccessoryManagerCustomCallbackList[v4];
  *((_OWORD *)v5 + 1) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  *(_OWORD *)v5 = 0u;
LABEL_7:
  pthread_mutex_unlock(&gLock);
  return 0LL;
}

uint64_t _localBTAccessoryManagerGetCallbacksCBID(uint64_t a1, void *a2)
{
  uint64_t v4 = 0LL;
  while (1)
  {
    v5 = &gBTAccessoryManagerCallbackList[v4];
    if (*(void *)&gBTAccessoryManagerCallbackList[v4 + 2] == a1)
    {
      uint64_t v6 = *(void *)v5;
      uint64_t v7 = *((void *)v5 + 1);
      uint64_t v9 = *((void *)v5 + 2);
      uint64_t v8 = *((void *)v5 + 3);
      BOOL v10 = v6 == *a2 && v7 == a2[1];
      BOOL v11 = v10 && v9 == a2[2];
      if (v11 && v8 == a2[3]) {
        break;
      }
    }

    v4 += 4LL;
    if (v4 == 256)
    {
      uint64_t v13 = 0LL;
      goto LABEL_16;
    }
  }

  uint64_t v13 = *(void *)&gBTAccessoryManagerCallbackList[v4 + 3];
LABEL_16:
  pthread_mutex_unlock(&gLock);
  return v13;
}

uint64_t _localBTAccessoryManagerGetCustomCallbacksCBID(uint64_t a1, void *a2)
{
  uint64_t v4 = 0LL;
  v5 = gBTAccessoryManagerCustomCallbackList;
  while (v5[1] != a1 || *v5 != *a2)
  {
    v4 += 4LL;
    v5 += 6;
    if (v4 == 256)
    {
      uint64_t v6 = 0LL;
      goto LABEL_7;
    }
  }

  uint64_t v6 = *(void *)&gBTAccessoryManagerCallbackList[v4 + 3];
LABEL_7:
  pthread_mutex_unlock(&gLock);
  return v6;
}

__int128 *_localBTAccessoryManagerGetCallbacks(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0LL;
  while (*(void *)&gBTAccessoryManagerCallbackList[v4 + 2] != a1
       || *(void *)&gBTAccessoryManagerCallbackList[v4 + 3] != a2)
  {
    v4 += 4LL;
    if (v4 == 256)
    {
      v5 = 0LL;
      goto LABEL_7;
    }
  }

  v5 = &gBTAccessoryManagerCallbackList[v4];
LABEL_7:
  pthread_mutex_unlock(&gLock);
  return v5;
}

uint64_t *_localBTAccessoryManagerGetCustomCallbacks(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0LL;
  while (gBTAccessoryManagerCustomCallbackList[v4 + 1] != a1 || gBTAccessoryManagerCustomCallbackList[v4 + 4] != a2)
  {
    v4 += 6LL;
    if (v4 == 384)
    {
      v5 = 0LL;
      goto LABEL_7;
    }
  }

  v5 = &gBTAccessoryManagerCustomCallbackList[v4];
LABEL_7:
  pthread_mutex_unlock(&gLock);
  return v5;
}

uint64_t _localBTAccessoryManagerGetCustomCallbackMsgType(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0LL;
  while (gBTAccessoryManagerCustomCallbackList[v4 + 1] != a1 || gBTAccessoryManagerCustomCallbackList[v4 + 4] != a2)
  {
    v4 += 6LL;
    if (v4 == 384)
    {
      uint64_t v5 = 0LL;
      goto LABEL_7;
    }
  }

  uint64_t v5 = LODWORD(gBTAccessoryManagerCustomCallbackList[v4 + 2]);
LABEL_7:
  pthread_mutex_unlock(&gLock);
  return v5;
}

uint64_t _localBTAccessoryManagerGetUserData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0LL;
  while (*(void *)&gBTAccessoryManagerCallbackList[v4 + 2] != a1
       || *(void *)&gBTAccessoryManagerCallbackList[v4 + 3] != a2)
  {
    v4 += 4LL;
    if (v4 == 256) {
      goto LABEL_5;
    }
  }

  uint64_t v6 = *((void *)&gBTAccessoryManagerCallbackList[v4 + 3] + 1);
  if (v6) {
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v5 = 0LL;
  while (gBTAccessoryManagerCustomCallbackList[v5 + 1] != a1 || gBTAccessoryManagerCustomCallbackList[v5 + 4] != a2)
  {
    v5 += 6LL;
    if (v5 == 384)
    {
      uint64_t v6 = 0LL;
      goto LABEL_13;
    }
  }

  uint64_t v6 = gBTAccessoryManagerCustomCallbackList[v5 + 5];
LABEL_13:
  pthread_mutex_unlock(&gLock);
  return v6;
}

uint64_t BTAccessoryManagerGetDefault(uint64_t *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t SessionHandle = getSessionHandle(a1);
  uint64_t MBXpcConnection = getMBXpcConnection((uint64_t)a1);
  if (MBXpcConnection)
  {
    uint64_t v6 = MBXpcConnection;
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    uint64_t v7 = (os_log_s *)MBFLogComponent;
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = v6 + 2336;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v6 + 2080;
      *(_WORD *)&buf[22] = 2048;
      uint64_t v17 = a1;
      __int16 v18 = 2048;
      uint64_t v19 = SessionHandle;
      _os_log_debug_impl( &dword_1870FD000,  v7,  OS_LOG_TYPE_DEBUG,  "BTAccessoryManagerGetDefault service:%s, sessionName:%s session:%llx sessionID:%llx",  buf,  0x2Au);
    }

    addXpcMsgHandler(v6, (uint64_t)&accessoryManagerXpcCallbacks);
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgSessionID", SessionHandle);
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerGetDefault_block_invoke;
    v11[3] = &unk_189FE6850;
    v11[4] = buf;
    v11[5] = &v12;
    sendMessageWithReplySync(v6, "kCBMsgIdAccessoryGetDefaultMsg", v8, (uint64_t)v11);
    *a2 = *(void *)(*(void *)&buf[8] + 24LL);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerGetDefault_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerGetDefault_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgAccessoryManagerID");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetDefault_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerAddCallbacks(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTAccessoryManagerAddCallbacks_cold_4();
    if (MBXpcConnection)
    {
LABEL_5:
      if (_localBTAccessoryManagerCallbacksRegistered(a1, a2))
      {
        if (MBFLogInitOnce != -1) {
          dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
        }
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
          BTAccessoryManagerAddCallbacks_cold_2();
        }
        return 0LL;
      }

      else
      {
        uint64_t value = 0LL;
        if (_localBTAccessoryManagerAddCallbacks(a1, MBXpcConnection, a2, a3, (uint64_t *)&value))
        {
          if (MBFLogInitOnce != -1) {
            dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
          }
          if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
            BTAccessoryManagerAddCallbacks_cold_3();
          }
          return 4LL;
        }

        else
        {
          xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
          xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
          xpc_dictionary_set_uint64(v8, "kCBMsgArgID", value);
          uint64_t v11 = 0LL;
          uint64_t v12 = &v11;
          uint64_t v13 = 0x2000000000LL;
          uint64_t v14 = 0LL;
          v10[0] = MEMORY[0x1895F87A8];
          v10[1] = 0x40000000LL;
          v10[2] = __BTAccessoryManagerAddCallbacks_block_invoke;
          v10[3] = &unk_189FE6878;
          v10[4] = &v11;
          sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdAccessoryAddCallbacksMsg", v8, (uint64_t)v10);
          if (v8) {
            xpc_release(v8);
          }
          if (v12[3])
          {
            _localBTAccessoryManagerRemoveCallbacks(a1, a2);
            uint64_t v7 = *((unsigned int *)v12 + 6);
          }

          else
          {
            uint64_t v7 = 0LL;
          }

          _Block_object_dispose(&v11, 8);
        }
      }

      return v7;
    }
  }

  else if (MBXpcConnection)
  {
    goto LABEL_5;
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
    BTAccessoryManagerAddCallbacks_cold_1();
  }
  return 1LL;
}

void __BTAccessoryManagerAddCallbacks_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerAddCallbacks_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerRemoveCallbacks(uint64_t a1, void *a2)
{
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTAccessoryManagerRemoveCallbacks_cold_2();
    if (MBXpcConnection)
    {
LABEL_5:
      uint64_t CallbacksCBID = _localBTAccessoryManagerGetCallbacksCBID(a1, a2);
      uint64_t v11 = 0LL;
      uint64_t v12 = &v11;
      uint64_t v13 = 0x2000000000LL;
      uint64_t v14 = 3LL;
      if (CallbacksCBID)
      {
        uint64_t v6 = CallbacksCBID;
        _localBTAccessoryManagerRemoveCallbacks(a1, a2);
        xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
        xpc_dictionary_set_uint64(v7, "kCBMsgArgAccessoryManagerID", a1);
        xpc_dictionary_set_uint64(v7, "kCBMsgArgID", v6);
        v10[0] = MEMORY[0x1895F87A8];
        v10[1] = 0x40000000LL;
        v10[2] = __BTAccessoryManagerRemoveCallbacks_block_invoke;
        v10[3] = &unk_189FE68A0;
        v10[4] = &v11;
        sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdAccessoryRemoveCallbacksMsg", v7, (uint64_t)v10);
        if (v7) {
          xpc_release(v7);
        }
      }

      uint64_t v8 = *((unsigned int *)v12 + 6);
      _Block_object_dispose(&v11, 8);
      return v8;
    }
  }

  else if (MBXpcConnection)
  {
    goto LABEL_5;
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
    BTAccessoryManagerRemoveCallbacks_cold_1();
  }
  return 1LL;
}

void __BTAccessoryManagerRemoveCallbacks_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerRemoveCallbacks_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerRegisterDevice( uint64_t a1, const void *a2, const char *a3, unsigned int a4, const char *a5, void *a6)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerRegisterDevice_cold_3();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    if (a3 && a5)
    {
      uint64_t v13 = MBXpcConnection;
      xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_uint64(v14, "kCBMsgArgAccessoryManagerID", a1);
      xpc_dictionary_set_data(v14, "kCBMsgArgAddressBytes", a2, 6uLL);
      xpc_dictionary_set_string(v14, "kCBMsgArgName", a3);
      xpc_dictionary_set_uint64(v14, "kCBMsgArgClassOfDevice", a4);
      xpc_dictionary_set_string(v14, "kCBMsgArgPincode", a5);
      uint64_t v22 = 0LL;
      uint64_t v23 = &v22;
      uint64_t v24 = 0x2000000000LL;
      uint64_t v25 = 0LL;
      uint64_t v18 = 0LL;
      uint64_t v19 = &v18;
      uint64_t v20 = 0x2000000000LL;
      uint64_t v21 = 0LL;
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 0x40000000LL;
      v17[2] = __BTAccessoryManagerRegisterDevice_block_invoke;
      v17[3] = &unk_189FE68C8;
      v17[4] = &v22;
      v17[5] = &v18;
      sendMessageWithReplySync(v13, "kCBMsgIdAccessoryRegisterDeviceMsg", v14, (uint64_t)v17);
      *a6 = v19[3];
      if (v14) {
        xpc_release(v14);
      }
      uint64_t v15 = *((unsigned int *)v23 + 6);
      _Block_object_dispose(&v18, 8);
      _Block_object_dispose(&v22, 8);
    }

    else
    {
      if (MBFLogInitOnce != -1) {
        dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
      }
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
        BTAccessoryManagerRegisterDevice_cold_2();
      }
      return 3LL;
    }
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v15;
}

void __BTAccessoryManagerRegisterDevice_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerRegisterDevice_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerPlugInDevice(uint64_t a1, uint64_t a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerPlugInDevice_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a2);
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    uint64_t v13 = 0LL;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    v9[2] = __BTAccessoryManagerPlugInDevice_block_invoke;
    v9[3] = &unk_189FE68F0;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdAccessoryPlugInDeviceMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    uint64_t v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTAccessoryManagerPlugInDevice_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerPlugInDevice_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerUnplugDevice(uint64_t a1, uint64_t a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerUnplugDevice_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a2);
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    uint64_t v13 = 0LL;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    v9[2] = __BTAccessoryManagerUnplugDevice_block_invoke;
    v9[3] = &unk_189FE6918;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdAccessoryUnplugDeviceMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    uint64_t v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTAccessoryManagerUnplugDevice_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerUnplugDevice_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetDeviceState(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetDeviceState_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    int v15 = 0;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerGetDeviceState_block_invoke;
    v11[3] = &unk_189FE6940;
    v11[4] = &v16;
    v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetDeviceStateMsg", v8, (uint64_t)v11);
    *a3 = *((_DWORD *)v13 + 6);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerGetDeviceState_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgState");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetDeviceState_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetDevices(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetDevices_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCbMsgArgDeviceArrayMaxSize", a4);
    uint64_t v14 = 0LL;
    int v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTAccessoryManagerGetDevices_block_invoke;
    v13[3] = &unk_189FE6968;
    v13[4] = &v14;
    v13[5] = a4;
    v13[6] = a2;
    v13[7] = a3;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessoryGetDevicesMsg", v10, (uint64_t)v13);
    if (v10) {
      xpc_release(v10);
    }
    uint64_t v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerGetDevices_cold_1();
    }
    return 1LL;
  }

  return v11;
}

void __BTAccessoryManagerGetDevices_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kCBMsgArgDeviceArray");
  size_t count = xpc_array_get_count(value);
  if (count)
  {
    for (size_t i = 0LL; i != count; ++i)
    {
      if (i >= *(void *)(a1 + 40)) {
        break;
      }
      *(void *)(*(void *)(a1 + 48) + 8 * i) = xpc_array_get_uint64(value, i);
      if (MBFLogInitOnce != -1) {
        dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
      }
      uint64_t v7 = (os_log_s *)MBFLogComponent;
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8 * i);
        *(_DWORD *)buf = 134218240;
        size_t v10 = i;
        __int16 v11 = 2048;
        uint64_t v12 = v8;
        _os_log_debug_impl(&dword_1870FD000, v7, OS_LOG_TYPE_DEBUG, "i:%lx BTDevie:%llx", buf, 0x16u);
      }
    }
  }

  **(void **)(a1 + 56) = count;
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetDevices_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetTimeSyncId(uint64_t a1, uint64_t a2, void *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetTimeSyncId_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerGetTimeSyncId_block_invoke;
    v11[3] = &unk_189FE6990;
    v11[4] = &v16;
    v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetTimeSyncIdMsg", v8, (uint64_t)v11);
    *a3 = v13[3];
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerGetTimeSyncId_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgID");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetTimeSyncId_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetDeviceBatteryLevel(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetDeviceBatteryLevel_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerGetDeviceBatteryLevel_block_invoke;
    v11[3] = &unk_189FE69B8;
    v11[4] = &v16;
    v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetDeviceBatteryLevelMsg", v8, (uint64_t)v11);
    *a3 = v13[3];
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerGetDeviceBatteryLevel_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgBatteryPercent");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetDeviceBatteryLevel_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetDeviceBatteryStatus(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  xpc_object_t v6 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_1870FD000,  v6,  OS_LOG_TYPE_DEFAULT,  "BTAccessoryManagerGetDeviceBatteryStatus over XPC",  buf,  2u);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v8 = MBXpcConnection;
    xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgBTDevice", a2);
    *(void *)buf = 0LL;
    uint64_t v14 = buf;
    uint64_t v15 = 0x2000000000LL;
    uint64_t v16 = 0LL;
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 0x40000000LL;
    v12[2] = __BTAccessoryManagerGetDeviceBatteryStatus_block_invoke;
    v12[3] = &unk_189FE69E0;
    v12[4] = buf;
    v12[5] = a3;
    sendMessageWithReplySync(v8, "kCBMsgIdAccessoryGetDeviceBatteryStatusMsg", v9, (uint64_t)v12);
    if (v9) {
      xpc_release(v9);
    }
    uint64_t v10 = *((unsigned int *)v14 + 6);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v10;
}

void __BTAccessoryManagerGetDeviceBatteryStatus_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  **(_BYTE **)(a1 + 40) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBatteryPercentSingle");
  *(_BYTE *)(*(void *)(a1 + 40) + 16LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBatteryPercentLeft");
  *(_BYTE *)(*(void *)(a1 + 40) + 8LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBatteryPercentRight");
  *(_BYTE *)(*(void *)(a1 + 40) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBatteryPercentCase");
  *(_BYTE *)(*(void *)(a1 + 40) + 32LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBatteryPercentCombined");
  *(_DWORD *)(*(void *)(a1 + 40) + 4LL) = xpc_dictionary_get_BOOL(xdict, "kCBMsgArgBatteryIsChargingSingle");
  *(_DWORD *)(*(void *)(a1 + 40) + 20LL) = xpc_dictionary_get_BOOL(xdict, "kCBMsgArgBatteryIsChargingLeft");
  *(_DWORD *)(*(void *)(a1 + 40) + 12LL) = xpc_dictionary_get_BOOL(xdict, "kCBMsgArgBatteryIsChargingRight");
  *(_DWORD *)(*(void *)(a1 + 40) + 28LL) = xpc_dictionary_get_BOOL(xdict, "kCBMsgArgBatteryIsChargingCase");
  *(_DWORD *)(*(void *)(a1 + 40) + 36LL) = xpc_dictionary_get_BOOL(xdict, "kCBMsgArgBatteryIsChargingCombined");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v4 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    int v6 = 134217984;
    uint64_t v7 = v5;
    _os_log_impl( &dword_1870FD000,  v4,  OS_LOG_TYPE_DEFAULT,  "kCBMsgIdAccessoryGetDeviceBatteryStatusMsg reply result:%llx",  (uint8_t *)&v6,  0xCu);
  }
}

uint64_t BTAccessoryManagerIsAccessory(uint64_t a1, uint64_t a2, int *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerIsAccessory_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    uint64_t v17 = 0LL;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2000000000LL;
    uint64_t v20 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2000000000LL;
    uint64_t v16 = 0LL;
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 0x40000000LL;
    v12[2] = __BTAccessoryManagerIsAccessory_block_invoke;
    v12[3] = &unk_189FE6A08;
    v12[4] = &v17;
    v12[5] = &v13;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryIsAccessoryMsg", v8, (uint64_t)v12);
    if (v14[3]) {
      int v9 = -1;
    }
    else {
      int v9 = 0;
    }
    *a3 = v9;
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v10 = *((unsigned int *)v18 + 6);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v10;
}

void __BTAccessoryManagerIsAccessory_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgIsAccessory");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerIsAccessory_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGenerateLinkKey(uint64_t a1, const void *a2, uint64_t a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGenerateLinkKey_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_data(v8, "kCBMsgArgAddressBytes", a2, 6uLL);
    uint64_t v13 = 0LL;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2000000000LL;
    uint64_t v16 = 0LL;
    v12[0] = 0LL;
    v12[1] = v12;
    v12[2] = 0x2000000000LL;
    v12[3] = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerGenerateLinkKey_block_invoke;
    v11[3] = &unk_189FE6A30;
    v11[4] = &v13;
    v11[5] = v12;
    void v11[6] = a3;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGenerateLinkKeyMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v14 + 6);
    _Block_object_dispose(v12, 8);
    _Block_object_dispose(&v13, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerGenerateLinkKey_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  data = xpc_dictionary_get_data(xdict, "kCBMsgArgLinkKey", (size_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  if (data)
  {
    unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    if (v5)
    {
      if (v5 >= 0x10) {
        size_t v6 = 16LL;
      }
      else {
        size_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      }
      memcpy(*(void **)(a1 + 48), data, v6);
    }
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGenerateLinkKey_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerSetLinkKeyEx( uint64_t a1, const void *a2, const char *a3, unsigned int a4, unsigned int a5, const void *a6, void *a7)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerSetLinkKeyEx_cold_3();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    if (a3)
    {
      uint64_t v15 = MBXpcConnection;
      xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_uint64(v16, "kCBMsgArgAccessoryManagerID", a1);
      xpc_dictionary_set_data(v16, "kCBMsgArgAddressBytes", a2, 6uLL);
      xpc_dictionary_set_string(v16, "kCBMsgArgName", a3);
      xpc_dictionary_set_uint64(v16, "kCBMsgArgClassOfDevice", a4);
      xpc_dictionary_set_uint64(v16, "kCBMsgArgServiceMask", a5);
      xpc_dictionary_set_data(v16, "kCBMsgArgLinkKey", a6, 0x10uLL);
      uint64_t v24 = 0LL;
      uint64_t v25 = &v24;
      uint64_t v26 = 0x2000000000LL;
      uint64_t v27 = 0LL;
      uint64_t v20 = 0LL;
      uint64_t v21 = &v20;
      uint64_t v22 = 0x2000000000LL;
      uint64_t v23 = 0LL;
      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 0x40000000LL;
      v19[2] = __BTAccessoryManagerSetLinkKeyEx_block_invoke;
      v19[3] = &unk_189FE6A58;
      v19[4] = &v24;
      v19[5] = &v20;
      sendMessageWithReplySync(v15, "kCBMsgIdAccessorySetLinkKeyExMsg", v16, (uint64_t)v19);
      *a7 = v21[3];
      if (v16) {
        xpc_release(v16);
      }
      uint64_t v17 = *((unsigned int *)v25 + 6);
      _Block_object_dispose(&v20, 8);
      _Block_object_dispose(&v24, 8);
    }

    else
    {
      if (MBFLogInitOnce != -1) {
        dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
      }
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
        BTAccessoryManagerSetLinkKeyEx_cold_2();
      }
      return 3LL;
    }
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v17;
}

void __BTAccessoryManagerSetLinkKeyEx_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerSetLinkKeyEx_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerSetDoubleTapAction(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerSetDoubleTapAction_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgDoubleTapAction", a3);
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerSetDoubleTapAction_block_invoke;
    v11[3] = &unk_189FE6A80;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessorySetDoubleTapActionMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerSetDoubleTapAction_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerSetDoubleTapAction_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerSetDoubleTapActionEx(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerSetDoubleTapActionEx_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgDoubleTapActionLeft", a3);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgDoubleTapActionRight", a4);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTAccessoryManagerSetDoubleTapActionEx_block_invoke;
    v13[3] = &unk_189FE6AA8;
    v13[4] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessorySetDoubleTapActionExMsg", v10, (uint64_t)v13);
    if (v10) {
      xpc_release(v10);
    }
    uint64_t v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v11;
}

void __BTAccessoryManagerSetDoubleTapActionEx_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerSetDoubleTapActionEx_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerSetMicMode(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerSetMicMode_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgMicMode", a3);
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerSetMicMode_block_invoke;
    v11[3] = &unk_189FE6AD0;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessorySetFirstSettingMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerSetMicMode_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerSetMicMode_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerRemoteTimeSyncEnable(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerRemoteTimeSyncEnable_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBool", a3);
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerRemoteTimeSyncEnable_block_invoke;
    v11[3] = &unk_189FE6AF8;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessorySetRemoteTimeSyncMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerRemoteTimeSyncEnable_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerRemoteTimeSyncEnable_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerSensorStreamTimeSyncEnable(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerSensorStreamTimeSyncEnable_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBool", a3);
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerSensorStreamTimeSyncEnable_block_invoke;
    v11[3] = &unk_189FE6B20;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessorySensorStreamTimeSyncEnableMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerSensorStreamTimeSyncEnable_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerSensorStreamTimeSyncEnable_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerSetInEarDetectionEnable(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerSetInEarDetectionEnable_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBool", a3);
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerSetInEarDetectionEnable_block_invoke;
    v11[3] = &unk_189FE6B48;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessorySetSecondSettingMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerSetInEarDetectionEnable_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerSetInEarDetectionEnable_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerSetIsHidden(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerSetIsHidden_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBool", a3);
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerSetIsHidden_block_invoke;
    v11[3] = &unk_189FE6B70;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessorySetIsHiddenMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerSetIsHidden_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerSetIsHidden_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetDoubleTapAction(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetDoubleTapAction_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerGetDoubleTapAction_block_invoke;
    v11[3] = &unk_189FE6B98;
    v11[4] = &v16;
    void v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetDoubleTapActionMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    *a3 = v13[3];
    uint64_t v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerGetDoubleTapAction_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgDoubleTapAction");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetDoubleTapAction_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetDoubleTapActionEx(uint64_t a1, uint64_t a2, _DWORD *a3, _DWORD *a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetDoubleTapActionEx_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a2);
    uint64_t v22 = 0LL;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x2000000000LL;
    uint64_t v25 = 0LL;
    uint64_t v18 = 0LL;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2000000000LL;
    uint64_t v21 = 0LL;
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTAccessoryManagerGetDoubleTapActionEx_block_invoke;
    v13[3] = &unk_189FE6BC0;
    v13[4] = &v22;
    void v13[5] = &v18;
    v13[6] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessoryGetDoubleTapActionExMsg", v10, (uint64_t)v13);
    if (v10) {
      xpc_release(v10);
    }
    *a3 = v19[3];
    *a4 = v15[3];
    uint64_t v11 = *((unsigned int *)v23 + 6);
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v11;
}

void __BTAccessoryManagerGetDoubleTapActionEx_block_invoke(void *a1, xpc_object_t xdict)
{
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  uint64_t v5 = a1[4];
  a1 += 4;
  *(void *)(*(void *)(v5 + 8) + 24LL) = uint64;
  *(void *)(*(void *)(a1[1] + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgDoubleTapActionLeft");
  *(void *)(*(void *)(a1[2] + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgDoubleTapActionRight");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetDoubleTapActionEx_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetDoubleTapCapability(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetDoubleTapCapability_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerGetDoubleTapCapability_block_invoke;
    v11[3] = &unk_189FE6BE8;
    v11[4] = &v16;
    void v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetDoubleTapCapabilityMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    *a3 = v13[3];
    uint64_t v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerGetDoubleTapCapability_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgDoubleTapCapability");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetDoubleTapCapability_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetFeatureCapability(uint64_t a1, uint64_t a2, unsigned int a3, _DWORD *a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetFeatureCapability_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgFeature", a3);
    uint64_t v18 = 0LL;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2000000000LL;
    uint64_t v21 = 0LL;
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTAccessoryManagerGetFeatureCapability_block_invoke;
    v13[3] = &unk_189FE6C10;
    v13[4] = &v18;
    void v13[5] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessoryGetFeatureCapabilityMsg", v10, (uint64_t)v13);
    if (v10) {
      xpc_release(v10);
    }
    *a4 = v15[3];
    uint64_t v11 = *((unsigned int *)v19 + 6);
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v11;
}

void __BTAccessoryManagerGetFeatureCapability_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgSupported");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetFeatureCapability_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetAnnounceMessagesSupport(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetAnnounceMessagesSupport_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerGetAnnounceMessagesSupport_block_invoke;
    v11[3] = &unk_189FE6C38;
    v11[4] = &v16;
    void v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetAnnounceMessagesSupportMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    *a3 = v13[3];
    uint64_t v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerGetAnnounceMessagesSupport_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgAnnounceMsgSupport");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetAnnounceMessagesSupport_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetMicMode(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetMicMode_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerGetMicMode_block_invoke;
    v11[3] = &unk_189FE6C60;
    v11[4] = &v16;
    void v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetFirstSettingMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    *a3 = v13[3];
    uint64_t v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerGetMicMode_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgMicMode");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetMicMode_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetInEarDetectionEnable(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetInEarDetectionEnable_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerGetInEarDetectionEnable_block_invoke;
    v11[3] = &unk_189FE6C88;
    v11[4] = &v16;
    void v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetSecondSettingMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    *a3 = v13[3];
    uint64_t v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerGetInEarDetectionEnable_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgInEarDetect");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetAnnounceMessagesSupport_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetInEarStatus(uint64_t a1, uint64_t a2, _DWORD *a3, _DWORD *a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetInEarStatus_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a2);
    uint64_t v22 = 0LL;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x2000000000LL;
    uint64_t v25 = 0LL;
    uint64_t v18 = 0LL;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2000000000LL;
    uint64_t v21 = 0LL;
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTAccessoryManagerGetInEarStatus_block_invoke;
    v13[3] = &unk_189FE6CB0;
    v13[4] = &v22;
    void v13[5] = &v18;
    void v13[6] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessoryGetInEarStatusMsg", v10, (uint64_t)v13);
    if (v10) {
      xpc_release(v10);
    }
    *a3 = v19[3];
    *a4 = v15[3];
    uint64_t v11 = *((unsigned int *)v23 + 6);
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v11;
}

void __BTAccessoryManagerGetInEarStatus_block_invoke(void *a1, xpc_object_t xdict)
{
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  uint64_t v5 = a1[4];
  a1 += 4;
  *(void *)(*(void *)(v5 + 8) + 24LL) = uint64;
  *(void *)(*(void *)(a1[1] + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgInEarStatusPrimary");
  *(void *)(*(void *)(a1[2] + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgInEarStatusSecondary");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetInEarStatus_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerRegisterCustomMessageClient(uint64_t a1, void *a2, unsigned int a3, uint64_t a4)
{
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTAccessoryManagerRegisterCustomMessageClient_cold_4();
    if (MBXpcConnection)
    {
LABEL_5:
      if (_localBTAccessoryManagerCustomCallbacksRegistered(a1, a2, a3))
      {
        if (MBFLogInitOnce != -1) {
          dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
        }
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
          BTAccessoryManagerAddCallbacks_cold_2();
        }
        return 0LL;
      }

      else
      {
        uint64_t value = 0LL;
        if (_localBTAccessoryManagerAddCustomCallbacks( a1,  MBXpcConnection,  a2,  a3,  a4,  (uint64_t *)&value))
        {
          if (MBFLogInitOnce != -1) {
            dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
          }
          if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
            BTAccessoryManagerRegisterCustomMessageClient_cold_3();
          }
          return 4LL;
        }

        else
        {
          xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
          xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
          xpc_dictionary_set_uint64(v10, "kCBMsgArgID", value);
          xpc_dictionary_set_uint64(v10, "kCBMsgArgEventType", a3);
          if (a4) {
            uint64_t v11 = 0LL;
          }
          else {
            uint64_t v11 = 0xFFFFFFFFLL;
          }
          xpc_dictionary_set_uint64(v10, "kCBMsgArgUserData", v11);
          uint64_t v14 = 0LL;
          uint64_t v15 = &v14;
          uint64_t v16 = 0x2000000000LL;
          uint64_t v17 = 0LL;
          v13[0] = MEMORY[0x1895F87A8];
          v13[1] = 0x40000000LL;
          v13[2] = __BTAccessoryManagerRegisterCustomMessageClient_block_invoke;
          v13[3] = &unk_189FE6CD8;
          v13[4] = &v14;
          sendMessageWithReplySync( MBXpcConnection,  "kCBMsgIdAccessoryRegisterCustomMessageClientMsg",  v10,  (uint64_t)v13);
          if (v10) {
            xpc_release(v10);
          }
          if (v15[3])
          {
            _localBTAccessoryManagerRemoveCustomCallbacks(a1, a2);
            uint64_t v9 = *((unsigned int *)v15 + 6);
          }

          else
          {
            uint64_t v9 = 0LL;
          }

          _Block_object_dispose(&v14, 8);
        }
      }

      return v9;
    }
  }

  else if (MBXpcConnection)
  {
    goto LABEL_5;
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
    BTAccessoryManagerAddCallbacks_cold_1();
  }
  return 1LL;
}

void __BTAccessoryManagerRegisterCustomMessageClient_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerRegisterCustomMessageClient_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerDeregisterCustomMessageClient(uint64_t a1, void *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerDeregisterCustomMessageClient_cold_3();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTAccessoryManagerRemoveCallbacks_cold_2();
    if (MBXpcConnection)
    {
LABEL_9:
      Customuint64_t CallbacksCBID = _localBTAccessoryManagerGetCustomCallbacksCBID(a1, a2);
      uint64_t v11 = 0LL;
      uint64_t v12 = &v11;
      uint64_t v13 = 0x2000000000LL;
      uint64_t v14 = 3LL;
      if (CustomCallbacksCBID)
      {
        uint64_t v6 = CustomCallbacksCBID;
        _localBTAccessoryManagerRemoveCustomCallbacks(a1, a2);
        xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
        xpc_dictionary_set_uint64(v7, "kCBMsgArgAccessoryManagerID", a1);
        xpc_dictionary_set_uint64(v7, "kCBMsgArgID", v6);
        v10[0] = MEMORY[0x1895F87A8];
        v10[1] = 0x40000000LL;
        v10[2] = __BTAccessoryManagerDeregisterCustomMessageClient_block_invoke;
        v10[3] = &unk_189FE6D00;
        v10[4] = &v11;
        sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdAccessoryDeregisterCustomMessageClientMsg", v7, (uint64_t)v10);
        if (v7) {
          xpc_release(v7);
        }
      }

      uint64_t v8 = *((unsigned int *)v12 + 6);
      _Block_object_dispose(&v11, 8);
      return v8;
    }
  }

  else if (MBXpcConnection)
  {
    goto LABEL_9;
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
    BTAccessoryManagerRemoveCallbacks_cold_1();
  }
  return 1LL;
}

void __BTAccessoryManagerDeregisterCustomMessageClient_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerDeregisterCustomMessageClient_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerSendCustomMessage( uint64_t a1, unsigned int a2, uint64_t a3, const void *a4, size_t a5)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerSendCustomMessage_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v11 = MBXpcConnection;
    xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBTDevice", a3);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgClientType", a2);
    xpc_dictionary_set_data(v12, "kCBMsgArgData", a4, a5);
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 0x40000000LL;
    v15[2] = __BTAccessoryManagerSendCustomMessage_block_invoke;
    v15[3] = &unk_189FE6D28;
    v15[4] = &v16;
    sendMessageWithReplySync(v11, "kCBMsgIdAccessorySendCustomMessageMsg", v12, (uint64_t)v15);
    if (v12) {
      xpc_release(v12);
    }
    uint64_t v13 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v13;
}

void __BTAccessoryManagerSendCustomMessage_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerSendCustomMessage_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerSendAdaptiveVolumeMessage( uint64_t a1, uint64_t a2, unsigned int a3, const void *a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerSendAdaptiveVolumeMessage_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAVMsgLen", a3);
    xpc_dictionary_set_data(v10, "kCBMsgArgData", a4, a3);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTAccessoryManagerSendAdaptiveVolumeMessage_block_invoke;
    v13[3] = &unk_189FE6D50;
    v13[4] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessorySendAdaptiveVolumeMessageMsg", v10, (uint64_t)v13);
    if (v10) {
      xpc_release(v10);
    }
    uint64_t v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v11;
}

uint64_t __BTAccessoryManagerSendAdaptiveVolumeMessage_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t result = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t BTAccessoryManagerSendPMEConfigMessage(uint64_t a1, uint64_t a2, unsigned int a3, const void *a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerSendPMEConfigMessage_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgPMEMsgLen", a3);
    xpc_dictionary_set_data(v10, "kCBMsgArgData", a4, a3);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTAccessoryManagerSendPMEConfigMessage_block_invoke;
    v13[3] = &unk_189FE6D78;
    v13[4] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessorySendPMEConfigMessageMsg", v10, (uint64_t)v13);
    if (v10) {
      xpc_release(v10);
    }
    uint64_t v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v11;
}

uint64_t __BTAccessoryManagerSendPMEConfigMessage_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t result = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t BTAccessoryManagerGetDeviceDiagnostics( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetDeviceDiagnostics_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v11 = MBXpcConnection;
    xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBufferSize", a5);
    uint64_t v21 = 0LL;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2000000000LL;
    uint64_t v24 = 0LL;
    uint64_t v17 = 0LL;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2000000000LL;
    uint64_t v20 = 0LL;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 0x40000000LL;
    v16[2] = __BTAccessoryManagerGetDeviceDiagnostics_block_invoke;
    v16[3] = &unk_189FE6DA0;
    v16[4] = &v21;
    v16[5] = &v17;
    v16[6] = a3;
    v16[7] = a5;
    sendMessageWithReplySync(v11, "kCBMsgIdAccessoryGetDeviceDiagnosticsMsg", v12, (uint64_t)v16);
    if (v12) {
      xpc_release(v12);
    }
    uint64_t v13 = v18[3];
    if (v13 >= a5) {
      uint64_t v13 = a5;
    }
    *a4 = v13;
    uint64_t v14 = *((unsigned int *)v22 + 6);
    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v14;
}

void __BTAccessoryManagerGetDeviceDiagnostics_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  data = xpc_dictionary_get_data(xdict, "kCBMsgArgData", (size_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  if (data)
  {
    unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    if (v5)
    {
      if (*(void *)(a1 + 56) >= v5) {
        size_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      }
      else {
        size_t v6 = *(void *)(a1 + 56);
      }
      memcpy(*(void **)(a1 + 48), data, v6);
    }
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetDeviceDiagnostics_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerSendRequestPeriodically(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerSendRequestPeriodically_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgType", a3);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgInterval", a4);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTAccessoryManagerSendRequestPeriodically_block_invoke;
    v13[3] = &unk_189FE6DC8;
    v13[4] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessorySendRequestPeriodicallyMsg", v10, (uint64_t)v13);
    if (v10) {
      xpc_release(v10);
    }
    uint64_t v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v11;
}

void __BTAccessoryManagerSendRequestPeriodically_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerSendRequestPeriodically_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerCancelRequestPeriodically(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerCancelRequestPeriodically_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgType", a3);
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerCancelRequestPeriodically_block_invoke;
    v11[3] = &unk_189FE6DF0;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryCancelRequestPeriodicallyMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerCancelRequestPeriodically_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerCancelRequestPeriodically_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerSendControlCommand(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerSendControlCommand_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgValue", a4);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgType", a3);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTAccessoryManagerSendControlCommand_block_invoke;
    v13[3] = &unk_189FE6E18;
    v13[4] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessorySendControlCommandMsg", v10, (uint64_t)v13);
    if (v10) {
      xpc_release(v10);
    }
    uint64_t v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v11;
}

void __BTAccessoryManagerSendControlCommand_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerSendControlCommand_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetControlCommand( uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, _DWORD *a5)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetControlCommand_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v11 = MBXpcConnection;
    xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgType", a3);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgSubType", a4);
    uint64_t v20 = 0LL;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2000000000LL;
    uint64_t v23 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 0x40000000LL;
    v15[2] = __BTAccessoryManagerGetControlCommand_block_invoke;
    v15[3] = &unk_189FE6E40;
    v15[4] = &v20;
    void v15[5] = &v16;
    sendMessageWithReplySync(v11, "kCBMsgIdAccessoryGetControlCommandMsg", v12, (uint64_t)v15);
    if (v12) {
      xpc_release(v12);
    }
    *a5 = v17[3];
    uint64_t v13 = *((unsigned int *)v21 + 6);
    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v20, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v13;
}

void __BTAccessoryManagerGetControlCommand_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgValue");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetControlCommand_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetSettingFeatureBitMask(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetSettingFeatureBitMask_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerGetSettingFeatureBitMask_block_invoke;
    v11[3] = &unk_189FE6E68;
    v11[4] = &v16;
    void v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetSettingFeatureBitMaskMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    *a3 = v13[3];
    uint64_t v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerGetSettingFeatureBitMask_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMSgArgFeatureBitMask");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetSettingFeatureBitMask_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetAccessoryInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetAccessoryInfo_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v11 = MBXpcConnection;
    xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBufferSize", a5);
    uint64_t v21 = 0LL;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2000000000LL;
    uint64_t v24 = 0LL;
    uint64_t v17 = 0LL;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2000000000LL;
    uint64_t v20 = 0LL;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 0x40000000LL;
    v16[2] = __BTAccessoryManagerGetAccessoryInfo_block_invoke;
    v16[3] = &unk_189FE6E90;
    v16[4] = &v21;
    v16[5] = &v17;
    v16[6] = a3;
    v16[7] = a5;
    sendMessageWithReplySync(v11, "kCBMsgIdAccessoryGetAccessoryInfoMsg", v12, (uint64_t)v16);
    if (v12) {
      xpc_release(v12);
    }
    uint64_t v13 = v18[3];
    if (v13 >= a5) {
      uint64_t v13 = a5;
    }
    *a4 = v13;
    uint64_t v14 = *((unsigned int *)v22 + 6);
    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v14;
}

void __BTAccessoryManagerGetAccessoryInfo_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    data = xpc_dictionary_get_data(xdict, "kCBMsgArgData", (size_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
    if (data)
    {
      unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      if (v5)
      {
        if (*(void *)(a1 + 56) >= v5) {
          size_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
        }
        else {
          size_t v6 = *(void *)(a1 + 56);
        }
        memcpy(*(void **)(a1 + 48), data, v6);
      }
    }
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetAccessoryInfo_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetAACPCapabilityBits( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetAACPCapabilityBits_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v11 = MBXpcConnection;
    xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBufferSize", a5);
    uint64_t v21 = 0LL;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2000000000LL;
    uint64_t v24 = 0LL;
    uint64_t v17 = 0LL;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2000000000LL;
    uint64_t v20 = 0LL;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 0x40000000LL;
    v16[2] = __BTAccessoryManagerGetAACPCapabilityBits_block_invoke;
    v16[3] = &unk_189FE6EB8;
    v16[4] = &v21;
    v16[5] = &v17;
    v16[6] = a3;
    v16[7] = a5;
    sendMessageWithReplySync(v11, "kCBMsgIdAccessoryGetAACPCapabilityBitsMsg", v12, (uint64_t)v16);
    if (v12) {
      xpc_release(v12);
    }
    uint64_t v13 = v18[3];
    if (v13 >= a5) {
      uint64_t v13 = a5;
    }
    *a4 = v13;
    uint64_t v14 = *((unsigned int *)v22 + 6);
    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v14;
}

void __BTAccessoryManagerGetAACPCapabilityBits_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  data = xpc_dictionary_get_data(xdict, "kCBMsgArgData", (size_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  if (data)
  {
    unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    if (v5)
    {
      if (*(void *)(a1 + 56) >= v5) {
        size_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      }
      else {
        size_t v6 = *(void *)(a1 + 56);
      }
      memcpy(*(void **)(a1 + 48), data, v6);
    }
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetAACPCapabilityBits_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetAACPCapabilityInteger(uint64_t a1, uint64_t a2, unsigned int a3, _DWORD *a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  xpc_object_t v8 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_1870FD000,  v8,  OS_LOG_TYPE_DEFAULT,  "BTAccessoryManagerGetAACPCapabilityInteger over XPC",  buf,  2u);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v10 = MBXpcConnection;
    xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v11, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v11, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v11, "kCBMsgArgAACPCapabilityInteger", a3);
    *(void *)buf = 0LL;
    uint64_t v21 = buf;
    uint64_t v22 = 0x2000000000LL;
    uint64_t v23 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 0x40000000LL;
    v14[2] = __BTAccessoryManagerGetAACPCapabilityInteger_block_invoke;
    v14[3] = &unk_189FE6EE0;
    v14[4] = buf;
    v14[5] = &v16;
    unsigned int v15 = a3;
    sendMessageWithReplySync(v10, "kCBMsgIdAccessoryGetAACPCapabilityIntegerMsg", v11, (uint64_t)v14);
    if (v11) {
      xpc_release(v11);
    }
    *a4 = v17[3];
    uint64_t v12 = *((unsigned int *)v21 + 6);
    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v12;
}

void __BTAccessoryManagerGetAACPCapabilityInteger_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgValue");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v4 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    int v7 = *(_DWORD *)(a1 + 48);
    int v8 = 134218496;
    uint64_t v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    __int16 v12 = 1024;
    int v13 = v7;
    _os_log_impl( &dword_1870FD000,  v4,  OS_LOG_TYPE_DEFAULT,  "BTAccessoryManagerGetAACPCapabilityInteger reply result:%llx, value:%llu, index: %u",  (uint8_t *)&v8,  0x1Cu);
  }

uint64_t BTAccessoryManagerReadDeviceVersionInfo( uint64_t a1, _BYTE *a2, uint64_t a3, _BYTE *a4, uint64_t a5, _BYTE *a6, uint64_t a7, _BYTE *a8, uint64_t a9, _BYTE *a10, uint64_t a11, _BYTE *a12, uint64_t a13, _BYTE *a14, uint64_t a15)
{
  *a2 = 0;
  *a4 = 0;
  *a6 = 0;
  *a8 = 0;
  *a10 = 0;
  *a12 = 0;
  *a14 = 0;
  getFirstSessionHandle();
  __int16 v28 = a6;
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerReadDeviceVersionInfo_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(0LL);
  if (MBXpcConnection)
  {
    uint64_t v22 = MBXpcConnection;
    xpc_object_t v23 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v23, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v23, "kCBMsgArgAddressStringBuffSize", a3);
    xpc_dictionary_set_uint64(v23, "kCBMsgArgNameBuffSize", a5);
    xpc_dictionary_set_uint64(v23, "kCBMsgArgManufacturerBuffSize", a7);
    xpc_dictionary_set_uint64(v23, "kCBMsgArgModelNumberBuffSize", a9);
    xpc_dictionary_set_uint64(v23, "kCBMsgArgSerialNumberBuffSize", a11);
    xpc_dictionary_set_uint64(v23, "kCBMsgArgFWVersionBuffSize", a13);
    xpc_dictionary_set_uint64(v23, "kCBMsgArgHWVersionBuffSize", a15);
    uint64_t v30 = 0LL;
    v31 = &v30;
    uint64_t v32 = 0x2000000000LL;
    uint64_t v33 = 0LL;
    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 0x40000000LL;
    v29[2] = __BTAccessoryManagerReadDeviceVersionInfo_block_invoke;
    v29[3] = &unk_189FE6F08;
    v29[4] = &v30;
    v29[5] = a2;
    v29[6] = a3;
    v29[7] = a4;
    v29[8] = a5;
    v29[9] = v28;
    v29[10] = a7;
    v29[11] = a8;
    v29[12] = a9;
    v29[13] = a10;
    v29[14] = a11;
    v29[15] = a12;
    v29[16] = a13;
    v29[17] = a14;
    v29[18] = a15;
    sendMessageWithReplySync(v22, "kCBMsgIdAccessoryReadDeviceVersionInfoMsg", v23, (uint64_t)v29);
    if (v23) {
      xpc_release(v23);
    }
    uint64_t v24 = *((unsigned int *)v31 + 6);
    _Block_object_dispose(&v30, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerReadDeviceVersionInfo_cold_1();
    }
    return 1LL;
  }

  return v24;
}

void __BTAccessoryManagerReadDeviceVersionInfo_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    string = xpc_dictionary_get_string(xdict, "kCBMsgArgAddressString");
    if (string) {
      strlcpy(*(char **)(a1 + 40), string, *(void *)(a1 + 48));
    }
    uint64_t v5 = xpc_dictionary_get_string(xdict, "kCBMsgArgName");
    if (v5) {
      strlcpy(*(char **)(a1 + 56), v5, *(void *)(a1 + 64));
    }
    uint64_t v6 = xpc_dictionary_get_string(xdict, "kCBMsgArgManufacturer");
    if (v6) {
      strlcpy(*(char **)(a1 + 72), v6, *(void *)(a1 + 80));
    }
    int v7 = xpc_dictionary_get_string(xdict, "kCBMsgArgModelNumber");
    if (v7) {
      strlcpy(*(char **)(a1 + 88), v7, *(void *)(a1 + 96));
    }
    int v8 = xpc_dictionary_get_string(xdict, "kCBMsgArgSerialNumber");
    if (v8) {
      strlcpy(*(char **)(a1 + 104), v8, *(void *)(a1 + 112));
    }
    uint64_t v9 = xpc_dictionary_get_string(xdict, "kCBMsgArgFWVersion");
    if (v9) {
      strlcpy(*(char **)(a1 + 120), v9, *(void *)(a1 + 128));
    }
    __int16 v10 = xpc_dictionary_get_string(xdict, "kCBMsgArgHWVersion");
    if (v10) {
      strlcpy(*(char **)(a1 + 136), v10, *(void *)(a1 + 144));
    }
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerReadDeviceVersionInfo_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetWirelessSharingSpatial(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v6 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_1870FD000,  v6,  OS_LOG_TYPE_DEFAULT,  "BTAccessoryManagerGetWirelessSharingSpatial over XPC",  buf,  2u);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v8 = MBXpcConnection;
    xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgBTDevice", a2);
    *(void *)buf = 0LL;
    uint64_t v18 = buf;
    uint64_t v19 = 0x2000000000LL;
    uint64_t v20 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2000000000LL;
    uint64_t v16 = 0LL;
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 0x40000000LL;
    v12[2] = __BTAccessoryManagerGetWirelessSharingSpatial_block_invoke;
    v12[3] = &unk_189FE6F30;
    void v12[4] = buf;
    v12[5] = &v13;
    sendMessageWithReplySync(v8, "kCBMsgIdAccessoryGetWirelessSharingSpatialMsg", v9, (uint64_t)v12);
    if (v9) {
      xpc_release(v9);
    }
    *a3 = v14[3];
    uint64_t v10 = *((unsigned int *)v18 + 6);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v10;
}

void __BTAccessoryManagerGetWirelessSharingSpatial_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgWSSpatial");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v4 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    int v7 = 134218240;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_log_impl( &dword_1870FD000,  v4,  OS_LOG_TYPE_DEFAULT,  "BTAccessoryManagerGetWirelessSharingSpatial reply result:%llx spatialSupportedWS:%llu",  (uint8_t *)&v7,  0x16u);
  }

uint64_t BTAccessoryManagerGetDeviceColor(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetDeviceColor_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerGetDeviceColor_block_invoke;
    v11[3] = &unk_189FE6F58;
    v11[4] = &v16;
    void v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetDeviceColorMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    *a3 = v13[3];
    uint64_t v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerGetDeviceColor_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgColor");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetDeviceColor_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerSetupCommand( uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, const void *a5, unsigned int a6)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerSetupCommand_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v13 = MBXpcConnection;
    xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgSetupType", a3);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgOPType", a4);
    xpc_dictionary_set_data(v14, "kCBMsgArgData", a5, a6);
    uint64_t v18 = 0LL;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2000000000LL;
    uint64_t v21 = 0LL;
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 0x40000000LL;
    v17[2] = __BTAccessoryManagerSetupCommand_block_invoke;
    v17[3] = &unk_189FE6F80;
    v17[4] = &v18;
    sendMessageWithReplySync(v13, "kCBMsgIdAccessorySetupCommandMsg", v14, (uint64_t)v17);
    if (v14) {
      xpc_release(v14);
    }
    uint64_t v15 = *((unsigned int *)v19 + 6);
    _Block_object_dispose(&v18, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v15;
}

void __BTAccessoryManagerSetupCommand_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerSetupCommand_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerSendRelayMsg( uint64_t a1, uint64_t a2, const void *a3, unsigned int a4, const void *a5, unsigned int a6)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerSendRelayMsg_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v13 = MBXpcConnection;
    xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_data(v14, "kCBMsgArgAddressBytes", a3, 6uLL);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgRelayMsgType", a4);
    xpc_dictionary_set_data(v14, "kCBMsgArgData", a5, a6);
    uint64_t v18 = 0LL;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2000000000LL;
    uint64_t v21 = 0LL;
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 0x40000000LL;
    v17[2] = __BTAccessoryManagerSendRelayMsg_block_invoke;
    v17[3] = &unk_189FE6FA8;
    v17[4] = &v18;
    sendMessageWithReplySync(v13, "kCBMsgIdAccessorySendRelayMsgMsg", v14, (uint64_t)v17);
    if (v14) {
      xpc_release(v14);
    }
    uint64_t v15 = *((unsigned int *)v19 + 6);
    _Block_object_dispose(&v18, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v15;
}

void __BTAccessoryManagerSendRelayMsg_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerSendRelayMsg_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerUpdateConnPriorityList( uint64_t a1, uint64_t a2, unsigned int a3, char *a4, int a5)
{
  LODWORD(v5) = a5;
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerUpdateConnPriorityList_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v11 = MBXpcConnection;
    xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgCmdReqType", a3);
    xpc_object_t v13 = xpc_array_create(0LL, 0LL);
    if ((_DWORD)v5)
    {
      uint64_t v5 = v5;
      do
      {
        xpc_array_set_data(v13, 0xFFFFFFFFFFFFFFFFLL, a4, 6uLL);
        a4 += 6;
        --v5;
      }

      while (v5);
    }

    xpc_dictionary_set_value(v12, "kCBMsgArgDeviceArray", v13);
    uint64_t v17 = 0LL;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2000000000LL;
    uint64_t v20 = 0LL;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 0x40000000LL;
    v16[2] = __BTAccessoryManagerUpdateConnPriorityList_block_invoke;
    v16[3] = &unk_189FE6FD0;
    v16[4] = &v17;
    sendMessageWithReplySync(v11, "kCBMsgIdAccessoryUpdateConnPriorityListMsg", v12, (uint64_t)v16);
    if (v13) {
      xpc_release(v13);
    }
    if (v12) {
      xpc_release(v12);
    }
    uint64_t v14 = *((unsigned int *)v18 + 6);
    _Block_object_dispose(&v17, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v14;
}

void __BTAccessoryManagerUpdateConnPriorityList_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerUpdateConnPriorityList_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetNonAppleHAEPairedDevices(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetNonAppleHAEPairedDevices_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCbMsgArgDeviceArrayMaxSize", a4);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTAccessoryManagerGetNonAppleHAEPairedDevices_block_invoke;
    v13[3] = &unk_189FE6FF8;
    v13[4] = &v14;
    void v13[5] = a4;
    void v13[6] = a2;
    void v13[7] = a3;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessoryGetNonAppleHAEPairedDevicesMsg", v10, (uint64_t)v13);
    if (v10) {
      xpc_release(v10);
    }
    uint64_t v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerGetNonAppleHAEPairedDevices_cold_1();
    }
    return 1LL;
  }

  return v11;
}

void __BTAccessoryManagerGetNonAppleHAEPairedDevices_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    xpc_object_t value = xpc_dictionary_get_value(xdict, "kCBMsgArgDeviceArray");
    size_t count = xpc_array_get_count(value);
    if (count)
    {
      for (size_t i = 0LL; i != count; ++i)
      {
        if (i >= *(void *)(a1 + 40)) {
          break;
        }
        *(void *)(*(void *)(a1 + 48) + 8 * i) = xpc_array_get_uint64(value, i);
        if (MBFLogInitOnce != -1) {
          dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
        }
        uint64_t v7 = (os_log_s *)MBFLogComponent;
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8 * i);
          *(_DWORD *)buf = 134218240;
          size_t v10 = i;
          __int16 v11 = 2048;
          uint64_t v12 = v8;
          _os_log_debug_impl(&dword_1870FD000, v7, OS_LOG_TYPE_DEBUG, "i:%lx BTDevie:%llx", buf, 0x16u);
        }
      }
    }

    **(void **)(a1 + 56) = count;
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetNonAppleHAEPairedDevices_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerSmartRouteMode(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerSmartRouteMode_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryGenericConfigMode", a3);
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerSmartRouteMode_block_invoke;
    v11[3] = &unk_189FE7020;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessorySmartRouteModeMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerSmartRouteMode_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerSmartRouteMode_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerSpatialAudioConfig( uint64_t a1, uint64_t a2, const char *a3, unsigned int a4, unsigned int a5)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  size_t v10 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1870FD000, v10, OS_LOG_TYPE_DEFAULT, "BTAccessoryManagerSpatialAudioMode over XPC", buf, 2u);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v12 = MBXpcConnection;
    xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v13, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v13, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_string(v13, "kCBMsgArgAccessoryBundleID", a3);
    xpc_dictionary_set_uint64(v13, "kCBMsgArgAccessoryGenericConfigMode", a4);
    xpc_dictionary_set_uint64(v13, "kCBMsgArgAccessoryHeadTrackingStatus", a5);
    *(void *)buf = 0LL;
    uint64_t v18 = buf;
    uint64_t v19 = 0x2000000000LL;
    uint64_t v20 = 0LL;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 0x40000000LL;
    v16[2] = __BTAccessoryManagerSpatialAudioConfig_block_invoke;
    v16[3] = &unk_189FE7048;
    v16[4] = buf;
    sendMessageWithReplySync(v12, "kCBMsgIdAccessorySpatialAudioModeMsg", v13, (uint64_t)v16);
    if (v13) {
      xpc_release(v13);
    }
    uint64_t v14 = *((unsigned int *)v18 + 6);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v14;
}

void __BTAccessoryManagerSpatialAudioConfig_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  v3 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    int v5 = 134217984;
    uint64_t v6 = v4;
    _os_log_impl( &dword_1870FD000,  v3,  OS_LOG_TYPE_DEFAULT,  "kCBMsgBTAccessorySmartRouteMode reply result:%llx",  (uint8_t *)&v5,  0xCu);
  }

uint64_t BTAccessoryManagerGetSpatialAudioConfig( uint64_t a1, uint64_t a2, const char *a3, _DWORD *a4, _DWORD *a5)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  size_t v10 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_1870FD000,  v10,  OS_LOG_TYPE_DEFAULT,  "BTAccessoryManagerGetSpatialAudioConfig over XPC",  buf,  2u);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v12 = MBXpcConnection;
    xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v13, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v13, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_string(v13, "kCBMsgArgAccessoryBundleID", a3);
    *(void *)buf = 0LL;
    uint64_t v26 = buf;
    uint64_t v27 = 0x2000000000LL;
    uint64_t v28 = 0LL;
    uint64_t v21 = 0LL;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2000000000LL;
    uint64_t v24 = 0LL;
    uint64_t v17 = 0LL;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2000000000LL;
    uint64_t v20 = 1LL;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 0x40000000LL;
    v16[2] = __BTAccessoryManagerGetSpatialAudioConfig_block_invoke;
    v16[3] = &unk_189FE7070;
    v16[4] = buf;
    void v16[5] = &v21;
    v16[6] = &v17;
    sendMessageWithReplySync(v12, "kCBMsgIdAccessoryGetSpatialAudioModeMsg", v13, (uint64_t)v16);
    if (v13) {
      xpc_release(v13);
    }
    *a4 = v22[3];
    *a5 = v18[3];
    uint64_t v14 = *((unsigned int *)v26 + 6);
    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v14;
}

void __BTAccessoryManagerGetSpatialAudioConfig_block_invoke(void *a1, xpc_object_t xdict)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgAccessoryGenericConfigMode");
  *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgAccessoryHeadTrackingStatus");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v4 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
    int v6 = 134217984;
    uint64_t v7 = v5;
    _os_log_impl( &dword_1870FD000,  v4,  OS_LOG_TYPE_DEFAULT,  "BTAccessoryManagerGetSpatialAudioConfig reply result:%llx",  (uint8_t *)&v6,  0xCu);
  }

uint64_t BTAccessoryManagerGetSpatialAudioActive(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  int v6 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1870FD000, v6, OS_LOG_TYPE_DEFAULT, "BTAccessoryManagerGetSpatialAudioActive over XPC", buf, 2u);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v8 = MBXpcConnection;
    xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgBTDevice", a2);
    *(void *)buf = 0LL;
    uint64_t v18 = buf;
    uint64_t v19 = 0x2000000000LL;
    uint64_t v20 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2000000000LL;
    uint64_t v16 = 0LL;
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 0x40000000LL;
    v12[2] = __BTAccessoryManagerGetSpatialAudioActive_block_invoke;
    v12[3] = &unk_189FE7098;
    void v12[4] = buf;
    v12[5] = &v13;
    sendMessageWithReplySync(v8, "kCBMsgIdAccessoryGetSpatialAudioActiveMsg", v9, (uint64_t)v12);
    if (v9) {
      xpc_release(v9);
    }
    *a3 = v14[3];
    uint64_t v10 = *((unsigned int *)v18 + 6);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v10;
}

void __BTAccessoryManagerGetSpatialAudioActive_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgAccessoryGenericConfigMode");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v4 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    int v6 = 134217984;
    uint64_t v7 = v5;
    _os_log_impl( &dword_1870FD000,  v4,  OS_LOG_TYPE_DEFAULT,  "BTAccessoryManagerGetSpatialAudioActive reply result:%llx",  (uint8_t *)&v6,  0xCu);
  }

uint64_t BTAccessoryManagerSpatialAudioAllowed(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  int v6 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1870FD000, v6, OS_LOG_TYPE_DEFAULT, "BTAccessoryManagerSpatialAudioAllowed over XPC", buf, 2u);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v8 = MBXpcConnection;
    xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgAccessoryGenericConfigMode", a3);
    *(void *)buf = 0LL;
    uint64_t v14 = buf;
    uint64_t v15 = 0x2000000000LL;
    uint64_t v16 = 0LL;
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 0x40000000LL;
    v12[2] = __BTAccessoryManagerSpatialAudioAllowed_block_invoke;
    v12[3] = &unk_189FE70C0;
    void v12[4] = buf;
    sendMessageWithReplySync(v8, "kCBMsgIdAccessorySpatialAudioAllowedMsg", v9, (uint64_t)v12);
    if (v9) {
      xpc_release(v9);
    }
    uint64_t v10 = *((unsigned int *)v14 + 6);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v10;
}

void __BTAccessoryManagerSpatialAudioAllowed_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  v3 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    int v5 = 134217984;
    uint64_t v6 = v4;
    _os_log_impl( &dword_1870FD000,  v3,  OS_LOG_TYPE_DEFAULT,  "BTAccessoryManagerSpatialAudioAllowed reply result:%llx",  (uint8_t *)&v5,  0xCu);
  }

uint64_t BTAccessoryManagerGetSpatialAudioAllowed(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v6 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_1870FD000,  v6,  OS_LOG_TYPE_DEFAULT,  "BTAccessoryManagerGetSpatialAudioAllowed over XPC",  buf,  2u);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v8 = MBXpcConnection;
    xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgBTDevice", a2);
    *(void *)buf = 0LL;
    uint64_t v18 = buf;
    uint64_t v19 = 0x2000000000LL;
    uint64_t v20 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2000000000LL;
    uint64_t v16 = 0LL;
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 0x40000000LL;
    v12[2] = __BTAccessoryManagerGetSpatialAudioAllowed_block_invoke;
    v12[3] = &unk_189FE70E8;
    void v12[4] = buf;
    void v12[5] = &v13;
    sendMessageWithReplySync(v8, "kCBMsgIdAccessoryGetSpatialAudioAllowedMsg", v9, (uint64_t)v12);
    if (v9) {
      xpc_release(v9);
    }
    *a3 = v14[3];
    uint64_t v10 = *((unsigned int *)v18 + 6);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v10;
}

void __BTAccessoryManagerGetSpatialAudioAllowed_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgAccessoryGenericConfigMode");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v4 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    int v6 = 134217984;
    uint64_t v7 = v5;
    _os_log_impl( &dword_1870FD000,  v4,  OS_LOG_TYPE_DEFAULT,  "kCBMsgIdAccessoryGetSpatialAudioAllowed reply result:%llx",  (uint8_t *)&v6,  0xCu);
  }

uint64_t BTAccessoryManagerGetSmartRouteMode(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetSmartRouteMode_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerGetSmartRouteMode_block_invoke;
    v11[3] = &unk_189FE7110;
    v11[4] = &v16;
    void v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetSmartRouteModeMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    *a3 = v13[3];
    uint64_t v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerGetSmartRouteMode_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgAccessoryGenericConfigMode");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetSmartRouteMode_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetSmartRouteSupport(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetSmartRouteSupport_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerGetSmartRouteSupport_block_invoke;
    v11[3] = &unk_189FE7138;
    v11[4] = &v16;
    void v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetSmartRouteSupportMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    *a3 = v13[3];
    uint64_t v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerGetSmartRouteSupport_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgAccessoryGenericConfigMode");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetSmartRouteSupport_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerSetDeviceStateOnPeerSrc(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerSetDeviceStateOnPeerSrc_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_data(v10, "kCBMsgArgAddressBytes", a3, 6uLL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryDeviceState", a4);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTAccessoryManagerSetDeviceStateOnPeerSrc_block_invoke;
    v13[3] = &unk_189FE7160;
    v13[4] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessorySetDeviceStateOnPeerSrcMsg", v10, (uint64_t)v13);
    if (v10) {
      xpc_release(v10);
    }
    uint64_t v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v11;
}

void __BTAccessoryManagerSetDeviceStateOnPeerSrc_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerSetDeviceStateOnPeerSrc_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetStereoHFPSupport(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetStereoHFPSupport_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerGetStereoHFPSupport_block_invoke;
    v11[3] = &unk_189FE7188;
    v11[4] = &v16;
    void v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetStereoHFPSupportMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    *a3 = v13[3];
    uint64_t v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerGetStereoHFPSupport_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgStereoHFPSupport");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetStereoHFPSupport_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetCallManagementConfigHelper(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerGetCallManagementConfigHelper_block_invoke;
    v11[3] = &unk_189FE71B0;
    v11[4] = &v16;
    void v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetCallManagementConfigMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    *a3 = v13[3];
    uint64_t v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

uint64_t __BTAccessoryManagerGetCallManagementConfigHelper_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  uint64_t result = xpc_dictionary_get_uint64(xdict, "kCBMsgArgCallManagementMessage");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

uint64_t BTAccessoryManagerGetCallManagementConfig(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetCallManagementConfig_cold_1();
  }
  unsigned int v10 = 0;
  uint64_t result = BTAccessoryManagerGetCallManagementConfigHelper(a1, a2, &v10);
  if (a3)
  {
    unsigned int v7 = v10;
    if ((v10 & 0xF) == 1)
    {
      *a3 = 1;
      a3[3] = v7 >> 4;
      a3[4] = BYTE1(v7) & 0xF;
      a3[5] = (unsigned __int16)v7 >> 12;
      a3[6] = BYTE2(v7) & 0xF;
    }

    else if ((v10 & 0xF) == 0)
    {
      *a3 = 0;
      char v8 = v7 >> 4;
      a3[1] = v7 >> 4;
      int v9 = (v7 >> 8) & 0xF;
      a3[2] = v9;
      a3[3] = v8;
      a3[4] = v9;
    }
  }

  return result;
}

uint64_t BTAccessoryManagerGetFeatureProxCardStatus(uint64_t a1, uint64_t a2, void *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetFeatureProxCardStatus_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerGetFeatureProxCardStatus_block_invoke;
    v11[3] = &unk_189FE71D8;
    v11[4] = &v16;
    void v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetFeatureProxCardStatusMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    *a3 = *((unsigned int *)v13 + 6);
    uint64_t v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

uint64_t __BTAccessoryManagerGetFeatureProxCardStatus_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  uint64_t result = xpc_dictionary_get_uint64(xdict, "kCBMsgArgFeatureProxCardStatusMessage");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

uint64_t BTAccessoryManagerSetFeatureProxCardStatus(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerSetFeatureProxCardStatus_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgFeatureProxCardStatusMessage", a3);
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerSetFeatureProxCardStatus_block_invoke;
    v11[3] = &unk_189FE7200;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessorySetFeatureProxCardStatusMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerSetFeatureProxCardStatus_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerSetFeatureProxCardStatus_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetDeviceSoundProfileSupport(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetDeviceSoundProfileSupport_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerGetDeviceSoundProfileSupport_block_invoke;
    v11[3] = &unk_189FE7228;
    v11[4] = &v16;
    void v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetDeviceSoundProfileSupportMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    *a3 = v13[3];
    uint64_t v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerGetDeviceSoundProfileSupport_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBool");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetDeviceSoundProfileSupport_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetDeviceSoundProfileAllowed(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetDeviceSoundProfileAllowed_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerGetDeviceSoundProfileAllowed_block_invoke;
    v11[3] = &unk_189FE7250;
    v11[4] = &v16;
    void v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetDeviceSoundProfileAllowedMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    *a3 = v13[3];
    uint64_t v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerGetDeviceSoundProfileAllowed_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBool");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetDeviceSoundProfileAllowed_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerSetDeviceSoundProfileAllowed(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerSetDeviceSoundProfileAllowed_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBool", a3);
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerSetDeviceSoundProfileAllowed_block_invoke;
    v11[3] = &unk_189FE7278;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessorySetDeviceSoundProfileAllowedMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerSetDeviceSoundProfileAllowed_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerSetDeviceSoundProfileAllowed_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetSpatialAudioPlatformSupport(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetSpatialAudioPlatformSupport_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerGetSpatialAudioPlatformSupport_block_invoke;
    v11[3] = &unk_189FE72A0;
    v11[4] = &v16;
    void v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetSpatialAudioPlatformSupportMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    *a3 = v13[3];
    uint64_t v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerGetSpatialAudioPlatformSupport_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgAccessoryGenericConfigMode");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetDeviceSoundProfileSupport_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetAnnounceCallsSupport(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetAnnounceCallsSupport_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerGetAnnounceCallsSupport_block_invoke;
    v11[3] = &unk_189FE72C8;
    v11[4] = &v16;
    void v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetAnnounceCallsSupportMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    *a3 = v13[3];
    uint64_t v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerGetAnnounceCallsSupport_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgAnnounceCallsSupport");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetAnnounceCallsSupport_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetAdaptiveLatencyJitterBufferLevel(uint64_t a1, void *a2, _WORD *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  int v6 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_1870FD000,  v6,  OS_LOG_TYPE_DEFAULT,  "kCBMsgIdAccessoryGetJitterBufferLevelMsg over XPC",  buf,  2u);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v8 = MBXpcConnection;
    xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgBTDevice", (uint64_t)a2);
    *(void *)buf = 0LL;
    uint64_t v22 = buf;
    uint64_t v23 = 0x2000000000LL;
    uint64_t v24 = 0LL;
    uint64_t v17 = 0LL;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2000000000LL;
    uint64_t v20 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2000000000LL;
    uint64_t v16 = 0LL;
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 0x40000000LL;
    v12[2] = __BTAccessoryManagerGetAdaptiveLatencyJitterBufferLevel_block_invoke;
    v12[3] = &unk_189FE72F0;
    void v12[4] = buf;
    void v12[5] = &v17;
    void v12[6] = &v13;
    sendMessageWithReplySync(v8, "kCBMsgIdAccessoryGetAdaptiveLatencyJitterBufferLevelMsg", v9, (uint64_t)v12);
    if (v9) {
      xpc_release(v9);
    }
    *a3 = v18[3];
    *a2 = v14[3];
    uint64_t v10 = *((unsigned int *)v22 + 6);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v10;
}

void __BTAccessoryManagerGetAdaptiveLatencyJitterBufferLevel_block_invoke(void *a1, xpc_object_t xdict)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgAccessoryJBL");
  *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v4 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
    int v6 = 134217984;
    uint64_t v7 = v5;
    _os_log_impl( &dword_1870FD000,  v4,  OS_LOG_TYPE_DEFAULT,  "kCBMsgIdAccessoryGetJitterBufferLevelMsg reply result:%llx",  (uint8_t *)&v6,  0xCu);
  }

uint64_t BTAccessoryManagerGetSensorStreamingFrequency(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  int v6 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_1870FD000,  v6,  OS_LOG_TYPE_DEFAULT,  "BTAccessoryManagerGetSensorStreamingFrequency over XPC",  buf,  2u);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v8 = MBXpcConnection;
    xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgBTDevice", a2);
    *(void *)buf = 0LL;
    uint64_t v19 = buf;
    uint64_t v20 = 0x2000000000LL;
    uint64_t v21 = 0LL;
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    v13[0] = 0LL;
    v13[1] = v13;
    v13[2] = 0x2000000000LL;
    v13[3] = 0LL;
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 0x40000000LL;
    v12[2] = __BTAccessoryManagerGetSensorStreamingFrequency_block_invoke;
    v12[3] = &unk_189FE7318;
    void v12[4] = buf;
    void v12[5] = &v14;
    void v12[6] = v13;
    sendMessageWithReplySync(v8, "kCBMsgIdAccessoryGetSensorStreamingFrequencyMsg", v9, (uint64_t)v12);
    if (v9) {
      xpc_release(v9);
    }
    *a3 = v15[3];
    uint64_t v10 = *((unsigned int *)v19 + 6);
    _Block_object_dispose(v13, 8);
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v10;
}

void __BTAccessoryManagerGetSensorStreamingFrequency_block_invoke(void *a1, xpc_object_t xdict)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgSensorStreamingFrequency");
  *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v4 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
    int v6 = 134217984;
    uint64_t v7 = v5;
    _os_log_impl( &dword_1870FD000,  v4,  OS_LOG_TYPE_DEFAULT,  "kCBMsgIdAccessoryGetSensorStreamingFrequencyMsg reply result:%llx",  (uint8_t *)&v6,  0xCu);
  }

uint64_t BTAccessoryManagerGetGyroInformation(uint64_t a1, uint64_t a2, uint64_t a3, _WORD *a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetGyroInformation_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a2);
    uint64_t v18 = 0LL;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2000000000LL;
    uint64_t v21 = 0LL;
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTAccessoryManagerGetGyroInformation_block_invoke;
    v13[3] = &unk_189FE7340;
    void v13[4] = &v18;
    void v13[5] = &v14;
    void v13[6] = a3;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessoryGetGyroInformationMsg", v10, (uint64_t)v13);
    if (v10) {
      xpc_release(v10);
    }
    *a4 = v15[3];
    uint64_t v11 = *((unsigned int *)v19 + 6);
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v11;
}

void __BTAccessoryManagerGetGyroInformation_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    data = xpc_dictionary_get_data(xdict, "kCBMsgArgData", (size_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
    if (data)
    {
      uint64_t v5 = data;
      size_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      if (v6)
      {
        **(void **)(a1 + 48) = malloc(v6);
        memcpy(**(void ***)(a1 + 48), v5, *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
      }
    }
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetGyroInformation_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerIsGenuineAirPods(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  size_t v6 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1870FD000, v6, OS_LOG_TYPE_DEFAULT, "BTAccessoryManagerIsGenuineAirPods over XPC", buf, 2u);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v8 = MBXpcConnection;
    xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgBTDevice", a2);
    *(void *)buf = 0LL;
    uint64_t v18 = buf;
    uint64_t v19 = 0x2000000000LL;
    uint64_t v20 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2000000000LL;
    uint64_t v16 = 0LL;
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 0x40000000LL;
    v12[2] = __BTAccessoryManagerIsGenuineAirPods_block_invoke;
    v12[3] = &unk_189FE7368;
    void v12[4] = buf;
    void v12[5] = &v13;
    sendMessageWithReplySync(v8, "kCBMsgIdDeviceIsGenuineAirPodsMsg", v9, (uint64_t)v12);
    if (v9) {
      xpc_release(v9);
    }
    *a3 = v14[3];
    uint64_t v10 = *((unsigned int *)v18 + 6);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v10;
}

void __BTAccessoryManagerIsGenuineAirPods_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgGenuine");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v4 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    int v7 = 134218240;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_log_impl( &dword_1870FD000,  v4,  OS_LOG_TYPE_DEFAULT,  "BTAccessoryManagerIsGenuineAirPods reply result:%llx genuine:%llu",  (uint8_t *)&v7,  0x16u);
  }

uint64_t BTAccessoryManagerGetCaseSerialNumbersForAppleProductId( uint64_t a1, unsigned int a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetCaseSerialNumbersForAppleProductId_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v11 = MBXpcConnection;
    xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgProductId", a2);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBufferSize", a5);
    uint64_t v21 = 0LL;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2000000000LL;
    uint64_t v24 = 0LL;
    uint64_t v17 = 0LL;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2000000000LL;
    uint64_t v20 = 0LL;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 0x40000000LL;
    v16[2] = __BTAccessoryManagerGetCaseSerialNumbersForAppleProductId_block_invoke;
    v16[3] = &unk_189FE7390;
    v16[4] = &v21;
    void v16[5] = &v17;
    v16[6] = a3;
    void v16[7] = a5;
    sendMessageWithReplySync(v11, "kCBMsgIdAccessoryGetCaseSerialNumbersForAppleProductIdMsg", v12, (uint64_t)v16);
    if (v12) {
      xpc_release(v12);
    }
    uint64_t v13 = v18[3];
    if (v13 >= a5) {
      uint64_t v13 = a5;
    }
    *a4 = v13;
    uint64_t v14 = *((unsigned int *)v22 + 6);
    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v14;
}

void __BTAccessoryManagerGetCaseSerialNumbersForAppleProductId_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    data = xpc_dictionary_get_data(xdict, "kCBMsgArgData", (size_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
    if (data)
    {
      unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      if (v5)
      {
        if (*(void *)(a1 + 56) >= v5) {
          size_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
        }
        else {
          size_t v6 = *(void *)(a1 + 56);
        }
        memcpy(*(void **)(a1 + 48), data, v6);
      }
    }
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetCaseSerialNumbersForAppleProductId_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetCaseSerialNumbersForAppleProductIds( uint64_t a1, unsigned int *a2, int a3, uint64_t a4, uint64_t *a5, uint64_t a6)
{
  LODWORD(v9) = a3;
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetCaseSerialNumbersForAppleProductIds_cold_3();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v13 = MBXpcConnection;
    if (!a2 || !(_DWORD)v9)
    {
      if (MBFLogInitOnce != -1) {
        dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
      }
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
        BTAccessoryManagerGetCaseSerialNumbersForAppleProductIds_cold_2();
      }
    }

    xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgBufferSize", a6);
    xpc_object_t v15 = xpc_array_create(0LL, 0LL);
    if ((_DWORD)v9)
    {
      uint64_t v9 = v9;
      do
      {
        unsigned int v16 = *a2++;
        xpc_array_set_uint64(v15, 0xFFFFFFFFFFFFFFFFLL, v16);
        --v9;
      }

      while (v9);
    }

    xpc_dictionary_set_value(v14, "kCBMsgArgProductIds", v15);
    uint64_t v25 = 0LL;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x2000000000LL;
    uint64_t v28 = 0LL;
    uint64_t v21 = 0LL;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2000000000LL;
    uint64_t v24 = 0LL;
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 0x40000000LL;
    _DWORD v20[2] = __BTAccessoryManagerGetCaseSerialNumbersForAppleProductIds_block_invoke;
    v20[3] = &unk_189FE73B8;
    v20[4] = &v25;
    v20[5] = &v21;
    v20[6] = a4;
    v20[7] = a6;
    sendMessageWithReplySync(v13, "kCBMsgIdAccessoryGetCaseSerialNumbersForAppleProductIdsMsg", v14, (uint64_t)v20);
    if (v14) {
      xpc_release(v14);
    }
    uint64_t v17 = v22[3];
    if (v17 >= a6) {
      uint64_t v17 = a6;
    }
    *a5 = v17;
    uint64_t v18 = *((unsigned int *)v26 + 6);
    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v18;
}

void __BTAccessoryManagerGetCaseSerialNumbersForAppleProductIds_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    data = xpc_dictionary_get_data(xdict, "kCBMsgArgData", (size_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
    if (data)
    {
      unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      if (v5)
      {
        if (*(void *)(a1 + 56) >= v5) {
          size_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
        }
        else {
          size_t v6 = *(void *)(a1 + 56);
        }
        memcpy(*(void **)(a1 + 48), data, v6);
      }
    }
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetCaseSerialNumbersForAppleProductIds_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetPrimaryBudSide(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerGetPrimaryBudSide_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgResult", a3);
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTAccessoryManagerGetPrimaryBudSide_block_invoke;
    v11[3] = &unk_189FE73E0;
    v11[4] = &v12;
    void v11[5] = a3;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetPrimaryBudSideMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTAccessoryManagerGetPrimaryBudSide_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgPrimarySide");
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerGetPrimaryBudSide_block_invoke_cold_1();
  }
}

uint64_t BTAccessoryManagerGetHeadphoneFeatureValue(uint64_t a1, uint64_t a2, unsigned int a3, _DWORD *a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  xpc_object_t v8 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_1870FD000,  v8,  OS_LOG_TYPE_DEFAULT,  "BTAccessoryManagerGetHeadphoneFeatureValue over XPC",  buf,  2u);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v10 = MBXpcConnection;
    xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v11, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v11, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v11, "kCBMsgArgHeadphoneFeatureType", a3);
    *(void *)buf = 0LL;
    uint64_t v20 = buf;
    uint64_t v21 = 0x2000000000LL;
    uint64_t v22 = 0LL;
    uint64_t v15 = 0LL;
    unsigned int v16 = &v15;
    uint64_t v17 = 0x2000000000LL;
    uint64_t v18 = 0LL;
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 0x40000000LL;
    v14[2] = __BTAccessoryManagerGetHeadphoneFeatureValue_block_invoke;
    v14[3] = &unk_189FE7408;
    v14[4] = buf;
    v14[5] = &v15;
    sendMessageWithReplySync(v10, "kCBMsgIdAccessoryGetHeadphoneFeatureValueMsg", v11, (uint64_t)v14);
    if (v11) {
      xpc_release(v11);
    }
    *a4 = v16[3];
    uint64_t v12 = *((unsigned int *)v20 + 6);
    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v12;
}

void __BTAccessoryManagerGetHeadphoneFeatureValue_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgHeadphoneFeatureValue");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v4 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    int v7 = 134218240;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_log_impl( &dword_1870FD000,  v4,  OS_LOG_TYPE_DEFAULT,  "BTAccessoryManagerGetHeadphoneFeatureValue reply result:%llx value:%llu",  (uint8_t *)&v7,  0x16u);
  }

uint64_t BTAccessoryManagerSetHeadphoneFeatureValue( uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTAccessoryManagerSetDeviceSoundProfileAllowed_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgHeadphoneFeatureType", a3);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgHeadphoneFeatureValue", a4);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTAccessoryManagerSetHeadphoneFeatureValue_block_invoke;
    v13[3] = &unk_189FE7430;
    void v13[4] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessorySetHeadphoneFeatureValueMsg", v10, (uint64_t)v13);
    if (v10) {
      xpc_release(v10);
    }
    uint64_t v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v11;
}

void __BTAccessoryManagerSetHeadphoneFeatureValue_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTAccessoryManagerSetHeadphoneFeatureValue_block_invoke_cold_1();
  }
}

uint64_t accessoryManagerXpcDisconnectedHandler(uint64_t a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
    accessoryManagerXpcDisconnectedHandler_cold_1();
  }
  return _localBTAccessoryManagerRemoveAllCallbacksByXpcConnection(a1);
}

uint64_t accessoryManagerXpcMsgHandler(uint64_t a1, const char *a2, xpc_object_t xdict)
{
  uint64_t v71 = *MEMORY[0x1895F89C0];
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgAccessoryManagerID");
  uint64_t v7 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgID");
  Callbacks = _localBTAccessoryManagerGetCallbacks(uint64, v7);
  CustomCallbacks = _localBTAccessoryManagerGetCustomCallbacks(uint64, v7);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  xpc_object_t v10 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v66 = 136316674;
    *(void *)&v66[4] = a2;
    __int16 v67 = 2080;
    *(void *)v68 = a1 + 2080;
    *(_WORD *)&v68[8] = 2080;
    *(void *)&v68[10] = a1 + 2336;
    *(_WORD *)&v68[18] = 2048;
    *(void *)&v68[20] = uint64;
    *(_WORD *)&v68[28] = 2048;
    *(void *)&v68[30] = v7;
    *(_WORD *)&v68[38] = 2048;
    *(void *)&v68[40] = Callbacks;
    *(_WORD *)&v68[48] = 2048;
    *(void *)&v68[50] = CustomCallbacks;
    _os_log_debug_impl( &dword_1870FD000,  v10,  OS_LOG_TYPE_DEBUG,  "accessoryManagerXpcMsgHandler msg:%s sessionName:%s serviceName:%s manager:%llx cbid:%llx cb:%llx customCbs:%llx",  v66,  0x48u);
  }

  if (!strcmp(a2, "kCBMsgIdAccessoryEvent"))
  {
    if (!Callbacks || !*(void *)Callbacks) {
      goto LABEL_37;
    }
    uint64_t v61 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgEvent");
    uint64_t v22 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
    uint64_t v23 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgState");
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    uint64_t v24 = (os_log_s *)MBFLogComponent;
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v66 = 136315906;
      *(void *)&v66[4] = a2;
      __int16 v67 = 2048;
      *(void *)v68 = v61;
      *(_WORD *)&v68[8] = 2048;
      *(void *)&v68[10] = v22;
      *(_WORD *)&v68[18] = 2048;
      *(void *)&v68[20] = v23;
      _os_log_debug_impl( &dword_1870FD000,  v24,  OS_LOG_TYPE_DEBUG,  "accessoryManagerXpcMsgHandler msg:%s, event:%llu, device:%llu, accessoryState:%llu",  v66,  0x2Au);
      if (MBFLogInitOnce != -1) {
        dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
      }
    }

    uint64_t v25 = (os_log_s *)MBFLogComponent;
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    {
      v56 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))Callbacks;
      *(_DWORD *)v66 = 136316930;
      *(void *)&v66[4] = a2;
      __int16 v67 = 2080;
      *(void *)v68 = a1 + 2080;
      *(_WORD *)&v68[8] = 2080;
      *(void *)&v68[10] = a1 + 2336;
      *(_WORD *)&v68[18] = 2048;
      *(void *)&v68[20] = uint64;
      *(_WORD *)&v68[28] = 2048;
      *(void *)&v68[30] = v7;
      *(_WORD *)&v68[38] = 2048;
      *(void *)&v68[40] = Callbacks;
      *(_WORD *)&v68[48] = 2048;
      *(void *)&v68[50] = CustomCallbacks;
      *(_WORD *)&v68[58] = 2048;
      *(void *)&v68[60] = v56;
      _os_log_debug_impl( &dword_1870FD000,  v25,  OS_LOG_TYPE_DEBUG,  "accessoryManagerXpcMsgHandler msg:%s sessionName:%s serviceName:%s manager:%llx cbid:%llx cb:%llx customCbs:%llx cb->accevent:%llx",  v66,  0x52u);
    }

    uint64_t v26 = CustomCallbacks;
    uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))Callbacks;
    uint64_t UserData = _localBTAccessoryManagerGetUserData(uint64, v7);
    v27(uint64, v61, v22, v23, UserData);
    CustomCallbacks = v26;
    uint64_t v13 = 1LL;
    goto LABEL_38;
  }

  if (!strcmp(a2, "kCBMsgIdAccessorySetupCommand"))
  {
    if (!Callbacks || !*((void *)Callbacks + 1)) {
      goto LABEL_37;
    }
    uint64_t v62 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
    uint64_t v58 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgSetupType");
    unsigned __int8 v29 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgOPType");
    *(void *)v66 = 0LL;
    data = xpc_dictionary_get_data(xdict, "kCBMsgArgData", (size_t *)v66);
    uint64_t v31 = a1;
    uint64_t v32 = (void (*)(uint64_t, uint64_t, uint64_t, void, const void *, uint64_t, uint64_t))*((void *)Callbacks + 1);
    uint64_t v33 = CustomCallbacks;
    uint64_t v34 = *(unsigned __int16 *)v66;
    uint64_t v35 = _localBTAccessoryManagerGetUserData(uint64, v7);
    uint64_t v36 = v34;
    CustomCallbacks = v33;
    v32(uint64, v62, v58, v29, data, v36, v35);
    a1 = v31;
    goto LABEL_36;
  }

  if (!strcmp(a2, "kCBMsgIdAccessoryRelayMsgRecv"))
  {
    if (!Callbacks || !*((void *)Callbacks + 2)) {
      goto LABEL_37;
    }
    uint64_t v63 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
    uint64_t v59 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgRelayMsgType");
    v37 = (unsigned int *)xpc_dictionary_get_data(xdict, "kCBMsgArgAddressBytes", 0LL);
    unint64_t v38 = *v37 | ((unint64_t)*((unsigned __int16 *)v37 + 2) << 32);
    *(void *)v66 = 0LL;
    v39 = xpc_dictionary_get_data(xdict, "kCBMsgArgData", (size_t *)v66);
    v40 = CustomCallbacks;
    uint64_t v41 = a1;
    v42 = (void (*)(uint64_t, uint64_t, unint64_t, uint64_t, const void *, uint64_t, uint64_t))*((void *)Callbacks + 2);
    uint64_t v43 = *(unsigned __int16 *)v66;
    uint64_t v44 = _localBTAccessoryManagerGetUserData(uint64, v7);
    v42(uint64, v63, v38, v59, v39, v43, v44);
    a1 = v41;
    CustomCallbacks = v40;
    goto LABEL_36;
  }

  if (!strcmp(a2, "kCBMsgIdAccessoryCommandStatus"))
  {
    if (!Callbacks || !*((void *)Callbacks + 3)) {
      goto LABEL_37;
    }
    v64 = CustomCallbacks;
    uint64_t v45 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
    uint64_t v46 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgCmdReqType");
    unsigned __int16 v47 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
    unsigned __int16 v48 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgReason");
    uint64_t v49 = a1;
    v50 = (void (*)(uint64_t, uint64_t, uint64_t, void, void, uint64_t))*((void *)Callbacks + 3);
    uint64_t v51 = _localBTAccessoryManagerGetUserData(uint64, v7);
    uint64_t v52 = v45;
    CustomCallbacks = v64;
    v50(uint64, v52, v46, v47, v48, v51);
    a1 = v49;
LABEL_36:
    uint64_t v13 = 1LL;
    goto LABEL_38;
  }

  if (strcmp(a2, "kCBMsgIdAccessoryCustomMessage")) {
    goto LABEL_37;
  }
  uint64_t CustomCallbackMsgType = _localBTAccessoryManagerGetCustomCallbackMsgType(uint64, v7);
  int v12 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgCustomMessageType");
  uint64_t v13 = 0LL;
  if (CustomCallbacks && (_DWORD)CustomCallbackMsgType && (_DWORD)CustomCallbackMsgType == v12)
  {
    if (*CustomCallbacks)
    {
      uint64_t v60 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
      size_t length = 0LL;
      uint64_t v14 = xpc_dictionary_get_data(xdict, "kCBMsgArgData", &length);
      if (MBFLogInitOnce != -1) {
        dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
      }
      uint64_t v15 = (os_log_s *)MBFLogComponent;
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v66 = 136317442;
        *(void *)&v66[4] = a2;
        __int16 v67 = 1024;
        *(_DWORD *)v68 = CustomCallbackMsgType;
        *(_WORD *)&v68[4] = 2048;
        *(void *)&v68[6] = v60;
        *(_WORD *)&v68[14] = 2048;
        *(void *)&v68[16] = length;
        *(_WORD *)&v68[24] = 2080;
        *(void *)&v68[26] = a1 + 2080;
        *(_WORD *)&v68[34] = 2080;
        *(void *)&v68[36] = a1 + 2336;
        *(_WORD *)&v68[44] = 2048;
        *(void *)&v68[46] = uint64;
        *(_WORD *)&v68[54] = 2048;
        *(void *)&v68[56] = v7;
        *(_WORD *)&v68[64] = 2048;
        *(void *)&v68[66] = Callbacks;
        __int16 v69 = 2048;
        v70 = CustomCallbacks;
        _os_log_debug_impl( &dword_1870FD000,  v15,  OS_LOG_TYPE_DEBUG,  "accessoryManagerXpcMsgHandler msg:%s, clientType:%X, device:%llX, dataLen:%zu sessionName:%s serviceName:%s ma nager:%llx cbid:%llx cbs:%p customCbs:%p ",  v66,  0x62u);
        if ((CustomCallbackMsgType & 0x40) == 0) {
          goto LABEL_18;
        }
      }

      else if ((CustomCallbackMsgType & 0x40) == 0)
      {
LABEL_18:
        uint64_t v16 = a1;
        uint64_t v17 = (void (*)(uint64_t, uint64_t, uint64_t, const void *, size_t, uint64_t))*CustomCallbacks;
        uint64_t v18 = CustomCallbacks;
        size_t v19 = length;
        uint64_t v20 = _localBTAccessoryManagerGetUserData(uint64, v7);
        size_t v21 = v19;
        CustomCallbacks = v18;
        v17(uint64, v60, CustomCallbackMsgType, v14, v21, v20);
        a1 = v16;
LABEL_49:
        uint64_t v13 = 1LL;
        goto LABEL_38;
      }

      uint64_t v57 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgUserData");
      ((void (*)(uint64_t, uint64_t, uint64_t, const void *, size_t, uint64_t))*CustomCallbacks)( uint64,  v60,  CustomCallbackMsgType,  v14,  length,  v57);
      goto LABEL_49;
    }

LABEL_37:
    uint64_t v13 = 0LL;
  }

LABEL_38:
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  v53 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    v55 = "did not handle";
    *(_DWORD *)v66 = 136316930;
    if ((_DWORD)v13) {
      v55 = "handled";
    }
    *(void *)&v66[4] = v55;
    __int16 v67 = 2080;
    *(void *)v68 = a2;
    *(_WORD *)&v68[8] = 2080;
    *(void *)&v68[10] = a1 + 2080;
    *(_WORD *)&v68[18] = 2080;
    *(void *)&v68[20] = a1 + 2336;
    *(_WORD *)&v68[28] = 2048;
    *(void *)&v68[30] = uint64;
    *(_WORD *)&v68[38] = 2048;
    *(void *)&v68[40] = v7;
    *(_WORD *)&v68[48] = 2048;
    *(void *)&v68[50] = Callbacks;
    *(_WORD *)&v68[58] = 2048;
    *(void *)&v68[60] = CustomCallbacks;
    _os_log_debug_impl( &dword_1870FD000,  v53,  OS_LOG_TYPE_DEBUG,  "accessoryManagerXpcMsgHandler %s %s sessionName:%s serviceName:%s manager:%llx cbid:%llx cb:%llx customCbs:%llx",  v66,  0x52u);
  }

  return v13;
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_3( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
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

void OUTLINED_FUNCTION_9(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void OUTLINED_FUNCTION_10( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_13(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

os_log_t MBFLogInit()
{
  os_log_t result = os_log_create("com.apple.bluetooth", "MobileBluetoothFramework");
  MBFLogComponent = (uint64_t)result;
  return result;
}

uint64_t attachSession(uint64_t a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    attachSession_cold_2();
  }
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v2, "kCBMsgArgName", (const char *)(a1 + 2080));
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  uint64_t v10 = 0LL;
  v6[0] = 0LL;
  v6[1] = v6;
  v6[2] = 0x2000000000LL;
  v6[3] = 0LL;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 0x40000000LL;
  v5[2] = __attachSession_block_invoke;
  v5[3] = &unk_189FE7458;
  v5[4] = v6;
  v5[5] = &v7;
  sendMessageWithReplySync(a1, "kCBMsgIdSessionAttach", v2, (uint64_t)v5);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    attachSession_cold_1();
    if (!v2) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  if (v2) {
LABEL_9:
  }
    xpc_release(v2);
LABEL_10:
  uint64_t v3 = v8[3];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void sendMessageWithReplySync(uint64_t a1, const char *a2, void *a3, uint64_t a4)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    sendMessageWithReplySync_cold_2();
  }
  *(_OWORD *)keys = xmmword_189FE7500;
  object[0] = xpc_string_create(a2);
  object[1] = a3;
  xpc_object_t v8 = xpc_dictionary_create((const char *const *)keys, object, 2uLL);
  xpc_object_t v9 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(a1 + 2072), v8);
  xpc_object_t v10 = v9;
  if (v9 && MEMORY[0x1895A15DC](v9) == MEMORY[0x1895F9268])
  {
    xpc_dictionary_get_string(v10, (const char *)*MEMORY[0x1895F91B0]);
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
      sendMessageWithReplySync_cold_1();
    }
    xpc_release(v10);
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgResult", 0x515uLL);
  }

  (*(void (**)(uint64_t, xpc_object_t))(a4 + 16))(a4, v10);
  xpc_release(v10);
  xpc_release(v8);
  xpc_release(object[0]);
}

uint64_t __attachSession_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  uint64_t result = xpc_dictionary_get_uint64(xdict, "kCBMsgArgSessionID");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

void handleReset(uint64_t a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    handleReset_cold_1();
  }
  xpc_object_t v2 = *(dispatch_queue_s **)(a1 + 2056);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __handleReset_block_invoke;
  block[3] = &__block_descriptor_tmp_8;
  block[4] = a1;
  dispatch_async(v2, block);
}

uint64_t __handleReset_block_invoke(uint64_t a1)
{
  return (***(uint64_t (****)(void))(a1 + 32))(*(void *)(a1 + 32));
}

void handleInvalid(uint64_t a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    handleInvalid_cold_1();
  }
  xpc_object_t v2 = *(dispatch_queue_s **)(a1 + 2056);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __handleInvalid_block_invoke;
  block[3] = &__block_descriptor_tmp_9_0;
  block[4] = a1;
  dispatch_async(v2, block);
}

uint64_t __handleInvalid_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 32) + 8LL))(*(void *)(a1 + 32));
}

void handleMsg(uint64_t a1, xpc_object_t object)
{
  uint64_t v11 = 0LL;
  int v12 = &v11;
  uint64_t v13 = 0x2000000000LL;
  xpc_object_t v14 = 0LL;
  xpc_object_t v14 = xpc_copy(object);
  uint64_t v8 = 0LL;
  v9[0] = &v8;
  v9[1] = 0x2000000000LL;
  string = 0LL;
  string = xpc_dictionary_get_string((xpc_object_t)v12[3], "kCBMsgId");
  v6[0] = 0LL;
  v6[1] = v6;
  v6[2] = 0x2000000000LL;
  xpc_object_t value = 0LL;
  xpc_object_t value = xpc_dictionary_get_value((xpc_object_t)v12[3], "kCBMsgArgs");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v3 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    handleMsg_cold_1(a1, (uint64_t)v9, v3);
  }
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 2056);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 0x40000000LL;
  v5[2] = __handleMsg_block_invoke;
  v5[3] = &unk_189FE74C0;
  v5[4] = &v8;
  v5[5] = v6;
  void v5[6] = &v11;
  v5[7] = a1;
  dispatch_async(v4, v5);
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v11, 8);
}

void __handleMsg_block_invoke(uint64_t a1)
{
}

void handleConnectionEvent(_xpc_connection_s *a1, void *a2)
{
  uint64_t v4 = MEMORY[0x1895A15DC](a2);
  context = xpc_connection_get_context(a1);
  if (context)
  {
    uint64_t v6 = (uint64_t)context;
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
      handleConnectionEvent_cold_6();
    }
    if (v4 == MEMORY[0x1895F9250])
    {
      handleMsg(v6, a2);
    }

    else if (v4 == MEMORY[0x1895F9268])
    {
      xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1895F91B0]);
      if (a2 == (void *)MEMORY[0x1895F9198])
      {
        if (MBFLogInitOnce != -1) {
          dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
        }
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
          handleConnectionEvent_cold_2();
        }
        handleReset(v6);
      }

      else if (a2 == (void *)MEMORY[0x1895F91A0])
      {
        if (MBFLogInitOnce != -1) {
          dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
        }
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
          handleConnectionEvent_cold_3();
        }
        handleInvalid(v6);
      }

      else
      {
        if (MBFLogInitOnce != -1) {
          dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
        }
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
          handleConnectionEvent_cold_4();
        }
      }
    }

    else
    {
      if (MBFLogInitOnce != -1) {
        dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
      }
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
        handleConnectionEvent_cold_5();
      }
    }
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_FAULT)) {
      handleConnectionEvent_cold_1();
    }
  }

uint64_t createXpcConnection( uint64_t a1, dispatch_queue_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (MGGetBoolAnswer())
  {
    xpc_object_t v10 = calloc(1uLL, 0xA30uLL);
    uint64_t v11 = (uint64_t)v10;
    if (a2) {
      int v12 = a2;
    }
    else {
      int v12 = (dispatch_queue_s *)MEMORY[0x1895F8AE0];
    }
    *xpc_object_t v10 = a1;
    v10[325] = a5;
    uint64_t v13 = (const char *)(v10 + 292);
    __strlcpy_chk();
    __strlcpy_chk();
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    xpc_object_t v14 = (os_log_s *)MBFLogComponent;
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    {
      int relative_priority_ptr = 136315650;
      uint64_t v26 = v13;
      __int16 v27 = 2080;
      uint64_t v28 = v11 + 2080;
      __int16 v29 = 2048;
      uint64_t v30 = a2;
      _os_log_debug_impl( &dword_1870FD000,  v14,  OS_LOG_TYPE_DEBUG,  "createXpcConnection %s %s queue:%p",  (uint8_t *)&relative_priority_ptr,  0x20u);
    }

    label = dispatch_queue_get_label(v12);
    uint64_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    *(void *)(v11 + 2056) = dispatch_queue_create_with_target_V2(label, v16, v12);
    int relative_priority_ptr = 0;
    dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(v12, &relative_priority_ptr);
    uint64_t v18 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    size_t v19 = dispatch_queue_attr_make_with_qos_class(v18, qos_class, relative_priority_ptr);
    uint64_t v20 = dispatch_queue_create((const char *)(v11 + 2080), v19);
    *(void *)(v11 + 2064) = v20;
    *(void *)(v11 + 2072) = xpc_connection_create_mach_service(v13, v20, 0LL);
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
      createXpcConnection_cold_1();
    }
    size_t v21 = *(_xpc_connection_s **)(v11 + 2072);
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 0x40000000LL;
    handler[2] = __createXpcConnection_block_invoke;
    handler[3] = &__block_descriptor_tmp_15;
    handler[4] = v11;
    xpc_connection_set_event_handler(v21, handler);
    xpc_connection_set_context(*(xpc_connection_t *)(v11 + 2072), (void *)v11);
    xpc_connection_set_finalizer_f(*(xpc_connection_t *)(v11 + 2072), (xpc_finalizer_t)releaseMBXpcConnection);
    xpc_connection_activate(*(xpc_connection_t *)(v11 + 2072));
    *a6 = attachSession(v11);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    uint64_t v22 = (os_log_s *)MBFLogComponent;
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
      createXpcConnection_cold_2(v22);
    }
    return 0LL;
  }

  return v11;
}

void __createXpcConnection_block_invoke(uint64_t a1, void *a2)
{
}

void releaseMBXpcConnection(void *a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    releaseMBXpcConnection_cold_1();
  }
  if (a1[259]) {
    a1[259] = 0LL;
  }
  if (*a1) {
    *a1 = 0LL;
  }
  xpc_object_t v2 = (dispatch_object_s *)a1[258];
  if (v2)
  {
    dispatch_release(v2);
    a1[258] = 0LL;
  }

  uint64_t v3 = (dispatch_object_s *)a1[257];
  if (v3) {
    dispatch_release(v3);
  }
  free(a1);
}

void releaseXPCConnection(uint64_t a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    releaseXPCConnection_cold_1();
  }
  xpc_release(*(xpc_object_t *)(a1 + 2072));
}

void sendMsg(uint64_t a1, const char *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    sendMsg_cold_1();
  }
  *(_OWORD *)keys = xmmword_189FE7500;
  object[0] = xpc_string_create(a2);
  object[1] = a3;
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)keys, object, 2uLL);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 2072), v6);
  xpc_release(v6);
  xpc_release(object[0]);
}

void disconnect(uint64_t a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    disconnect_cold_1();
  }
  bzero((void *)(a1 + 8), 0x800uLL);
  *(void *)(a1 + 2600) = 0LL;
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 2072));
}

  ;
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_5_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void OUTLINED_FUNCTION_6_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

  ;
}

BOOL _localBTDeviceServiceCallbacksRegistered(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = 0LL;
  BOOL v5 = 1;
  xpc_object_t v6 = &qword_18C4BCAA0;
  do
  {
    if (*v6 == a1 && *(v6 - 1) == a2) {
      break;
    }
    BOOL v5 = v4 < 0x3F;
    v6 += 5;
    ++v4;
  }

  while (v4 != 64);
  pthread_mutex_unlock(&gLock_0);
  return v5;
}

uint64_t _localBTDeviceServiceAddCallbacks(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = 0LL;
  while (gBTDeviceServiceCallbackList[v10 + 1] || gBTDeviceServiceCallbackList[v10 + 3])
  {
    v10 += 5LL;
    if (v10 == 320)
    {
      uint64_t v11 = 4LL;
      goto LABEL_7;
    }
  }

  uint64_t v11 = 0LL;
  int v12 = &gBTDeviceServiceCallbackList[v10];
  v12[3] = a5;
  void v12[4] = a4;
  v12[1] = a1;
  v12[2] = a2;
  *int v12 = a3;
LABEL_7:
  pthread_mutex_unlock(&gLock_0);
  return v11;
}

uint64_t _localBTDeviceServiceGetCBID(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0LL;
  while (gBTDeviceServiceCallbackList[v4 + 1] != a1 || gBTDeviceServiceCallbackList[v4] != a2)
  {
    v4 += 5LL;
    if (v4 == 320)
    {
      uint64_t v5 = 0LL;
      goto LABEL_7;
    }
  }

  uint64_t v5 = gBTDeviceServiceCallbackList[v4 + 3];
LABEL_7:
  pthread_mutex_unlock(&gLock_0);
  return v5;
}

uint64_t _localBTDeviceServiceRemoveCallbacks(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0LL;
  while (gBTDeviceServiceCallbackList[v4 + 1] != a1 || gBTDeviceServiceCallbackList[v4] != a2)
  {
    v4 += 5LL;
    if (v4 == 320) {
      goto LABEL_7;
    }
  }

  uint64_t v5 = &gBTDeviceServiceCallbackList[v4];
  v5[4] = 0LL;
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
LABEL_7:
  pthread_mutex_unlock(&gLock_0);
  return 0LL;
}

uint64_t _localBTDeviceServiceRemoveCallbacksByXpcConnection(uint64_t a1)
{
  for (uint64_t i = 0LL; i != 320; i += 5LL)
  {
    uint64_t v3 = &gBTDeviceServiceCallbackList[i];
    if (gBTDeviceServiceCallbackList[i + 2] == a1)
    {
      v3[4] = 0LL;
      *(_OWORD *)uint64_t v3 = 0uLL;
      *((_OWORD *)v3 + 1) = 0uLL;
    }
  }

  pthread_mutex_unlock(&gLock_0);
  return 0LL;
}

uint64_t _localBTDeviceServiceGetCallbacks(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0LL;
  uint64_t v5 = 0LL;
  do
  {
    xpc_object_t v6 = &gBTDeviceServiceCallbackList[v4];
    if (gBTDeviceServiceCallbackList[v4 + 1] == a1 && v6[3] == a2) {
      uint64_t v5 = *v6;
    }
    v4 += 5LL;
  }

  while (v4 != 320);
  pthread_mutex_unlock(&gLock_0);
  return v5;
}

uint64_t _localBTDeviceServiceGetUserData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0LL;
  while (gBTDeviceServiceCallbackList[v4 + 1] != a1 || gBTDeviceServiceCallbackList[v4 + 3] != a2)
  {
    v4 += 5LL;
    if (v4 == 320)
    {
      uint64_t v5 = 0LL;
      goto LABEL_7;
    }
  }

  uint64_t v5 = gBTDeviceServiceCallbackList[v4 + 4];
LABEL_7:
  pthread_mutex_unlock(&gLock_0);
  return v5;
}

uint64_t BTDeviceAddressToString(const void *a1, _BYTE *a2, uint64_t a3)
{
  if (!a3) {
    return 1LL;
  }
  *a2 = 0;
  Firstuint64_t SessionHandle = getFirstSessionHandle();
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceAddressToString_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(FirstSessionHandle);
  if (!MBXpcConnection)
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceAddressToString_cold_1();
    }
    return 1LL;
  }

  uint64_t v8 = MBXpcConnection;
  xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_data(v9, "kCBMsgArgAddressBytes", a1, 6uLL);
  xpc_dictionary_set_uint64(v9, "kCBMsgArgAddressStringBuffSize", a3);
  uint64_t v13 = 0LL;
  xpc_object_t v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  uint64_t v16 = 0LL;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 0x40000000LL;
  v12[2] = __BTDeviceAddressToString_block_invoke;
  v12[3] = &unk_189FE7518;
  void v12[4] = &v13;
  void v12[5] = a2;
  void v12[6] = a3;
  sendMessageWithReplySync(v8, "kCBMsgIdDeviceAddressToStringMsg", v9, (uint64_t)v12);
  if (v9) {
    xpc_release(v9);
  }
  uint64_t v10 = *((unsigned int *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v10;
}

void __BTDeviceAddressToString_block_invoke(void *a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (!*(void *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    uint64_t v4 = (char *)a1[5];
    string = xpc_dictionary_get_string(xdict, "kCBMsgArgAddressString");
    strlcpy(v4, string, a1[6]);
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceAddressToString_block_invoke_cold_1();
  }
}

uint64_t BTDeviceAddressFromString(const char *a1, uint64_t a2)
{
  Firstuint64_t SessionHandle = getFirstSessionHandle();
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceAddressFromString_cold_3();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(FirstSessionHandle);
  if (MBXpcConnection)
  {
    if (a1)
    {
      uint64_t v6 = MBXpcConnection;
      xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_string(v7, "kCBMsgArgAddressString", a1);
      uint64_t v12 = 0LL;
      uint64_t v13 = &v12;
      uint64_t v14 = 0x2000000000LL;
      uint64_t v15 = 0LL;
      v11[0] = 0LL;
      v11[1] = v11;
      v11[2] = 0x2000000000LL;
      v11[3] = 0LL;
      v10[0] = MEMORY[0x1895F87A8];
      v10[1] = 0x40000000LL;
      v10[2] = __BTDeviceAddressFromString_block_invoke;
      v10[3] = &unk_189FE7540;
      v10[4] = &v12;
      void v10[5] = v11;
      v10[6] = a2;
      sendMessageWithReplySync(v6, "kCBMsgIdDeviceAddressFromStringMsg", v7, (uint64_t)v10);
      if (v7) {
        xpc_release(v7);
      }
      uint64_t v8 = *((unsigned int *)v13 + 6);
      _Block_object_dispose(v11, 8);
      _Block_object_dispose(&v12, 8);
    }

    else
    {
      if (MBFLogInitOnce != -1) {
        dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
      }
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
        BTDeviceAddressFromString_cold_2();
      }
      return 3LL;
    }
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceAddressToString_cold_1();
    }
    return 1LL;
  }

  return v8;
}

void __BTDeviceAddressFromString_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  data = xpc_dictionary_get_data( xdict,  "kCBMsgArgAddressBytes",  (size_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  if (data)
  {
    unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    if (v5)
    {
      if (v5 >= 6) {
        size_t v6 = 6LL;
      }
      else {
        size_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      }
      memcpy(*(void **)(a1 + 48), data, v6);
      if (MBFLogInitOnce != -1) {
        dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
      }
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
        __BTDeviceAddressFromString_block_invoke_cold_1();
      }
    }
  }

uint64_t BTDeviceFromAddress(uint64_t *a1, const void *a2, void *a3)
{
  uint64_t SessionHandle = getSessionHandle(a1);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceFromAddress_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection((uint64_t)a1);
  if (MBXpcConnection)
  {
    uint64_t v8 = MBXpcConnection;
    xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_data(v9, "kCBMsgArgAddressBytes", a2, 6uLL);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgSessionID", SessionHandle);
    uint64_t v17 = 0LL;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2000000000LL;
    uint64_t v20 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2000000000LL;
    uint64_t v16 = 0LL;
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 0x40000000LL;
    v12[2] = __BTDeviceFromAddress_block_invoke;
    v12[3] = &unk_189FE7568;
    void v12[4] = &v17;
    void v12[5] = &v13;
    sendMessageWithReplySync(v8, "kCBMsgIdDeviceFromAddressMsg", v9, (uint64_t)v12);
    if (v9) {
      xpc_release(v9);
    }
    *a3 = v14[3];
    uint64_t v10 = *((unsigned int *)v18 + 6);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceFromAddress_cold_1();
    }
    return 1LL;
  }

  return v10;
}

void __BTDeviceFromAddress_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceFromAddress_block_invoke_cold_1();
  }
}

uint64_t BTDeviceFromIdentifier(uint64_t *a1, const unsigned __int8 *a2, void *a3)
{
  uint64_t SessionHandle = getSessionHandle(a1);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceFromIdentifier_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection((uint64_t)a1);
  if (MBXpcConnection)
  {
    uint64_t v8 = MBXpcConnection;
    xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uuid(v9, "kCBMsgArgUUID", a2);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgSessionID", SessionHandle);
    uint64_t v17 = 0LL;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2000000000LL;
    uint64_t v20 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2000000000LL;
    uint64_t v16 = 0LL;
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 0x40000000LL;
    v12[2] = __BTDeviceFromIdentifier_block_invoke;
    v12[3] = &unk_189FE7590;
    void v12[4] = &v17;
    void v12[5] = &v13;
    sendMessageWithReplySync(v8, "kCBMsgIdDeviceFromIdentifierMsg", v9, (uint64_t)v12);
    if (v9) {
      xpc_release(v9);
    }
    *a3 = v14[3];
    uint64_t v10 = *((unsigned int *)v18 + 6);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceFromAddress_cold_1();
    }
    return 1LL;
  }

  return v10;
}

void __BTDeviceFromIdentifier_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceFromIdentifier_block_invoke_cold_1();
  }
}

uint64_t BTDeviceGetAddressString(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  *a2 = 0;
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceGetAddressString_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBufferSize", a3);
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTDeviceGetAddressString_block_invoke;
    v11[3] = &unk_189FE75B8;
    void v11[4] = &v12;
    void v11[5] = a2;
    void v11[6] = a3;
    sendMessageWithReplySync(v7, "kCBMsgIdDeviceGetAddressStringMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTDeviceGetAddressString_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    string = xpc_dictionary_get_string(xdict, "kCBMsgArgAddressString");
    if (string) {
      strlcpy(*(char **)(a1 + 40), string, *(void *)(a1 + 48));
    }
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceGetAddressString_block_invoke_cold_1();
  }
}

uint64_t BTDeviceGetDeviceType(uint64_t a1, _DWORD *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceGetDeviceType_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    int v13 = 0;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceGetDeviceType_block_invoke;
    v9[3] = &unk_189FE75E0;
    v9[4] = &v14;
    void v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceGetDeviceTypeMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    *a2 = *((_DWORD *)v11 + 6);
    uint64_t v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceGetDeviceType_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgDeviceType");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceGetDeviceType_block_invoke_cold_1();
  }
}

uint64_t BTDeviceGetDeviceClass(uint64_t a1, _DWORD *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceGetDeviceClass_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    int v13 = 0;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceGetDeviceClass_block_invoke;
    v9[3] = &unk_189FE7608;
    v9[4] = &v14;
    void v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceGetDeviceClassMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    *a2 = *((_DWORD *)v11 + 6);
    uint64_t v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceGetDeviceClass_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgDeviceClass");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceGetDeviceClass_block_invoke_cold_1();
  }
}

uint64_t BTDeviceGetDefaultName(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  if (!a3) {
    return 1LL;
  }
  *a2 = 0;
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceGetDefaultName_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (!MBXpcConnection)
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  uint64_t v7 = MBXpcConnection;
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a1);
  xpc_dictionary_set_uint64(v8, "kCBMsgArgBufferSize", a3);
  uint64_t v12 = 0LL;
  int v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  uint64_t v15 = 0LL;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 0x40000000LL;
  v11[2] = __BTDeviceGetDefaultName_block_invoke;
  v11[3] = &unk_189FE7630;
  void v11[4] = &v12;
  void v11[5] = a2;
  void v11[6] = a3;
  sendMessageWithReplySync(v7, "kCBMsgIdDeviceGetDefaultNameMsg", v8, (uint64_t)v11);
  if (v8) {
    xpc_release(v8);
  }
  uint64_t v9 = *((unsigned int *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v9;
}

void __BTDeviceGetDefaultName_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    string = xpc_dictionary_get_string(xdict, "kCBMsgArgName");
    if (string) {
      strlcpy(*(char **)(a1 + 40), string, *(void *)(a1 + 48));
    }
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceGetDefaultName_block_invoke_cold_1();
  }
}

uint64_t BTDeviceGetProductName(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  if (!a3) {
    return 1LL;
  }
  *a2 = 0;
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceGetProductName_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (!MBXpcConnection)
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  uint64_t v7 = MBXpcConnection;
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a1);
  xpc_dictionary_set_uint64(v8, "kCBMsgArgBufferSize", a3);
  uint64_t v12 = 0LL;
  int v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  uint64_t v15 = 0LL;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 0x40000000LL;
  v11[2] = __BTDeviceGetProductName_block_invoke;
  v11[3] = &unk_189FE7658;
  void v11[4] = &v12;
  void v11[5] = a2;
  void v11[6] = a3;
  sendMessageWithReplySync(v7, "kCBMsgIdDeviceGetProductNameMsg", v8, (uint64_t)v11);
  if (v8) {
    xpc_release(v8);
  }
  uint64_t v9 = *((unsigned int *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v9;
}

void __BTDeviceGetProductName_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    string = xpc_dictionary_get_string(xdict, "kCBMsgArgName");
    if (string) {
      strlcpy(*(char **)(a1 + 40), string, *(void *)(a1 + 48));
    }
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceGetProductName_block_invoke_cold_1();
  }
}

uint64_t BTDeviceGetName(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  if (!a3) {
    return 1LL;
  }
  *a2 = 0;
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceGetName_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (!MBXpcConnection)
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  uint64_t v7 = MBXpcConnection;
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a1);
  xpc_dictionary_set_uint64(v8, "kCBMsgArgBufferSize", a3);
  uint64_t v12 = 0LL;
  int v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  uint64_t v15 = 0LL;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 0x40000000LL;
  v11[2] = __BTDeviceGetName_block_invoke;
  v11[3] = &unk_189FE7680;
  void v11[4] = &v12;
  void v11[5] = a2;
  void v11[6] = a3;
  sendMessageWithReplySync(v7, "kCBMsgIdDeviceGetNameMsg", v8, (uint64_t)v11);
  if (v8) {
    xpc_release(v8);
  }
  uint64_t v9 = *((unsigned int *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v9;
}

void __BTDeviceGetName_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    string = xpc_dictionary_get_string(xdict, "kCBMsgArgName");
    if (string) {
      strlcpy(*(char **)(a1 + 40), string, *(void *)(a1 + 48));
    }
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceGetName_block_invoke_cold_1();
  }
}

uint64_t BTDeviceSetUserName(uint64_t a1, const char *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceSetUserName_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_string(v6, "kCBMsgArgName", a2);
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    uint64_t v13 = 0LL;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceSetUserName_block_invoke;
    v9[3] = &unk_189FE76A8;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceSetUserNameMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    uint64_t v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceSetUserName_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceSetUserName_block_invoke_cold_1();
  }
}

uint64_t BTDeviceGetSyncSettings(uint64_t a1, _DWORD *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceGetSyncSettings_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    int v13 = 0;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceGetSyncSettings_block_invoke;
    v9[3] = &unk_189FE76D0;
    v9[4] = &v14;
    void v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceGetSyncSettingsMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    *a2 = *((_DWORD *)v11 + 6);
    uint64_t v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceGetSyncSettings_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgSyncSettings");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceGetSyncSettings_block_invoke_cold_1();
  }
}

uint64_t BTDeviceSetSyncSettings(uint64_t a1, unsigned int a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceSetSyncSettings_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgSyncSettings", a2);
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    uint64_t v13 = 0LL;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceSetSyncSettings_block_invoke;
    v9[3] = &unk_189FE76F8;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceSetSyncSettingsMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    uint64_t v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceSetSyncSettings_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceSetSyncSettings_block_invoke_cold_1();
  }
}

uint64_t BTDeviceGetGroups(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceGetGroups_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgGrouIdArraySize", a4);
    uint64_t v18 = 0LL;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2000000000LL;
    uint64_t v21 = 0LL;
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTDeviceGetGroups_block_invoke;
    v13[3] = &unk_189FE7720;
    void v13[4] = &v18;
    void v13[5] = &v14;
    void v13[6] = a2;
    sendMessageWithReplySync(v9, "kCBMsgIdDeviceGetGroupsMsg", v10, (uint64_t)v13);
    if (v10) {
      xpc_release(v10);
    }
    *a3 = v15[3];
    uint64_t v11 = *((unsigned int *)v19 + 6);
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v11;
}

void __BTDeviceGetGroups_block_invoke(void *a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  xpc_object_t array = xpc_dictionary_get_array(xdict, "kCBMsgArgGrouIdArray");
  *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = xpc_array_get_count(array);
  if (*(void *)(*(void *)(a1[5] + 8LL) + 24LL))
  {
    size_t v5 = 0LL;
    do
    {
      *(_DWORD *)(a1[6] + 4 * v5) = xpc_array_get_uint64(array, v5);
      ++v5;
    }

    while (*(void *)(*(void *)(a1[5] + 8LL) + 24LL) > v5);
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceGetGroups_block_invoke_cold_1();
  }
}

uint64_t BTDeviceSetGroup(uint64_t a1, int a2, unsigned int a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceSetGroup_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgGrouId", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBool", a3);
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTDeviceSetGroup_block_invoke;
    v11[3] = &unk_189FE7748;
    void v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdDeviceSetGroupMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTDeviceSetGroup_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceSetGroup_block_invoke_cold_1();
  }
}

uint64_t BTDeviceGetPairingStatus(uint64_t a1, _DWORD *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceGetPairingStatus_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    int v13 = 0;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceGetPairingStatus_block_invoke;
    v9[3] = &unk_189FE7770;
    v9[4] = &v14;
    void v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceGetPairingStatusMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    *a2 = *((_DWORD *)v11 + 6);
    uint64_t v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceGetPairingStatus_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgPaired");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceGetPairingStatus_block_invoke_cold_1();
  }
}

uint64_t BTDeviceGetCloudPairingStatus(uint64_t a1, _DWORD *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceGetCloudPairingStatus_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    int v13 = 0;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceGetCloudPairingStatus_block_invoke;
    v9[3] = &unk_189FE7798;
    v9[4] = &v14;
    void v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceGetCloudPairingStatusMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    *a2 = *((_DWORD *)v11 + 6);
    uint64_t v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceGetCloudPairingStatus_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgPaired");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceGetCloudPairingStatus_block_invoke_cold_1();
  }
}

uint64_t BTDeviceGetMagicPairingStatus(uint64_t a1, _DWORD *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceGetMagicPairingStatus_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    int v13 = 0;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceGetMagicPairingStatus_block_invoke;
    v9[3] = &unk_189FE77C0;
    v9[4] = &v14;
    void v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceGetMagicPairingStatusMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    *a2 = *((_DWORD *)v11 + 6);
    uint64_t v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceGetMagicPairingStatus_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgPaired");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceGetMagicPairingStatus_block_invoke_cold_1();
  }
}

uint64_t BTDeviceGetConnectionStatus(uint64_t a1, _DWORD *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceGetMagicPairingStatus_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    int v13 = 0;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceGetConnectionStatus_block_invoke;
    v9[3] = &unk_189FE77E8;
    v9[4] = &v14;
    void v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceGetConnectionStatusMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    *a2 = *((_DWORD *)v11 + 6);
    uint64_t v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceGetConnectionStatus_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgConnected");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceGetConnectionStatus_block_invoke_cold_1();
  }
}

uint64_t BTDeviceIsAppleAudioDevice(uint64_t a1, _DWORD *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceIsAppleAudioDevice_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    int v13 = 0;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceIsAppleAudioDevice_block_invoke;
    v9[3] = &unk_189FE7810;
    v9[4] = &v14;
    void v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceIsAppleAudioDeviceMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    *a2 = *((_DWORD *)v11 + 6);
    uint64_t v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceIsAppleAudioDevice_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBool");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceIsAppleAudioDevice_block_invoke_cold_1();
  }
}

uint64_t BTDeviceSupportsHS(uint64_t a1, _DWORD *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceSupportsHS_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    int v13 = 0;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceSupportsHS_block_invoke;
    v9[3] = &unk_189FE7838;
    v9[4] = &v14;
    void v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceSupportsHSMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    *a2 = *((_DWORD *)v11 + 6);
    uint64_t v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceSupportsHS_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBool");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceSupportsHS_block_invoke_cold_1();
  }
}

uint64_t BTDeviceIsProController(uint64_t a1, _DWORD *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceIsProController_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    int v13 = 0;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceIsProController_block_invoke;
    v9[3] = &unk_189FE7860;
    v9[4] = &v14;
    void v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceIsProControllerMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    *a2 = *((_DWORD *)v11 + 6);
    uint64_t v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceIsProController_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBool");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceIsProController_block_invoke_cold_1();
  }
}

uint64_t BTServiceAddCallbacksWithFilter(uint64_t *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTServiceAddCallbacksWithFilter_cold_5();
  }
  uint64_t SessionHandle = getSessionHandle(a1);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTServiceAddCallbacksWithFilter_cold_4();
  }
  uint64_t MBXpcConnection = getMBXpcConnection((uint64_t)a1);
  if (MBXpcConnection)
  {
    uint64_t v10 = MBXpcConnection;
    uint64_t v11 = ++gCBID_0;
    addXpcMsgHandler(MBXpcConnection, (uint64_t)&deviceServiceManagerXpcCallbacks);
    if (_localBTDeviceServiceCallbacksRegistered(SessionHandle, a2))
    {
      if (MBFLogInitOnce != -1) {
        dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
      }
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
        BTAccessoryManagerAddCallbacks_cold_2();
      }
      return 0LL;
    }

    else if (_localBTDeviceServiceAddCallbacks(SessionHandle, v10, a2, a4, v11))
    {
      if (MBFLogInitOnce != -1) {
        dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
      }
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
        BTServiceAddCallbacksWithFilter_cold_3();
      }
      return 4LL;
    }

    else
    {
      if (MBFLogInitOnce != -1) {
        dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
      }
      int v13 = (os_log_s *)MBFLogComponent;
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218496;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = SessionHandle;
        *(_WORD *)&buf[22] = 2048;
        uint64_t v18 = v11;
        _os_log_debug_impl( &dword_1870FD000,  v13,  OS_LOG_TYPE_DEBUG,  "BTServiceAddCallbacksWithFilter session :%llx, sessionHandle:%llx, cbid:%llx",  buf,  0x20u);
      }

      xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_uint64(v14, "kCBMsgArgSessionID", SessionHandle);
      xpc_dictionary_set_uint64(v14, "kCBMsgArgID", v11);
      xpc_dictionary_set_uint64(v14, "kCBMsgArgServiceMask", a3);
      *(void *)buf = 0LL;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&buf[16] = 0x2000000000LL;
      uint64_t v18 = 0LL;
      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 0x40000000LL;
      v16[2] = __BTServiceAddCallbacksWithFilter_block_invoke;
      v16[3] = &unk_189FE7888;
      v16[4] = buf;
      sendMessageWithReplySync(v10, "kCBMsgIdDeviceServiceAddCallbacksMsg", v14, (uint64_t)v16);
      if (v14) {
        xpc_release(v14);
      }
      if (*(void *)(*(void *)&buf[8] + 24LL))
      {
        _localBTDeviceServiceRemoveCallbacks(SessionHandle, a2);
        uint64_t v12 = *(unsigned int *)(*(void *)&buf[8] + 24LL);
      }

      else
      {
        uint64_t v12 = 0LL;
      }

      _Block_object_dispose(buf, 8);
    }
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceFromAddress_cold_1();
    }
    return 1LL;
  }

  return v12;
}

void __BTServiceAddCallbacksWithFilter_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTServiceAddCallbacksWithFilter_block_invoke_cold_1();
  }
}

uint64_t BTServiceAddCallbacks(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTServiceAddCallbacks_cold_1();
  }
  return BTServiceAddCallbacksWithFilter(a1, a2, 0xFFFFFFFF, a3);
}

uint64_t BTServiceRemoveCallbacks(uint64_t *a1, uint64_t a2)
{
  uint64_t SessionHandle = getSessionHandle(a1);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTServiceRemoveCallbacks_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection((uint64_t)a1);
  if (MBXpcConnection)
  {
    uint64_t v6 = MBXpcConnection;
    uint64_t CBID = _localBTDeviceServiceGetCBID(SessionHandle, a2);
    uint64_t v13 = 0LL;
    xpc_object_t v14 = &v13;
    uint64_t v15 = 0x2000000000LL;
    uint64_t v8 = 3LL;
    uint64_t v16 = 3LL;
    if (CBID)
    {
      uint64_t v9 = CBID;
      xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_uint64(v10, "kCBMsgArgSessionID", SessionHandle);
      xpc_dictionary_set_uint64(v10, "kCBMsgArgID", v9);
      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 0x40000000LL;
      v12[2] = __BTServiceRemoveCallbacks_block_invoke;
      v12[3] = &unk_189FE78B0;
      void v12[4] = &v13;
      sendMessageWithReplySync(v6, "kCBMsgIdDeviceServiceRemoveCallbacksMsg", v10, (uint64_t)v12);
      if (v10) {
        xpc_release(v10);
      }
      uint64_t v8 = v14[3];
      if (!v8)
      {
        _localBTDeviceServiceRemoveCallbacks(SessionHandle, a2);
        uint64_t v8 = v14[3];
      }
    }

    _Block_object_dispose(&v13, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v8;
}

void __BTServiceRemoveCallbacks_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTServiceRemoveCallbacks_block_invoke_cold_1();
  }
}

uint64_t BTDeviceSetAuthorizedServices()
{
  return 2LL;
}

uint64_t BTDeviceGetAuthorizedServices()
{
  return 2LL;
}

uint64_t BTDeviceConnect(uint64_t a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceConnect_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v3 = MBXpcConnection;
    xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v4, "kCBMsgArgBTDevice", a1);
    uint64_t v8 = 0LL;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2000000000LL;
    uint64_t v11 = 0LL;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 0x40000000LL;
    v7[2] = __BTDeviceConnect_block_invoke;
    v7[3] = &unk_189FE78D8;
    v7[4] = &v8;
    sendMessageWithReplySync(v3, "kCBMsgIdDeviceConnectMsg", v4, (uint64_t)v7);
    if (v4) {
      xpc_release(v4);
    }
    uint64_t v5 = *((unsigned int *)v9 + 6);
    _Block_object_dispose(&v8, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v5;
}

void __BTDeviceConnect_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceConnect_block_invoke_cold_1();
  }
}

uint64_t BTDeviceConnectServices(uint64_t a1, unsigned int a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceConnectServices_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgServices", a2);
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    uint64_t v13 = 0LL;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceConnectServices_block_invoke;
    v9[3] = &unk_189FE7900;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceConnectServicesMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    uint64_t v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceConnectServices_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceConnectServices_block_invoke_cold_1();
  }
}

uint64_t BTDeviceConnectServicesWithParameters(uint64_t a1, unsigned int a2, unsigned int a3, const void *a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceConnectServicesWithParameters_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgServices", a2);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgConnectionMode", a3);
    xpc_dictionary_set_data(v10, "kCBMsgArgKey", a4, 0x10uLL);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTDeviceConnectServicesWithParameters_block_invoke;
    v13[3] = &unk_189FE7928;
    void v13[4] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdDeviceConnectServicesWithParametersMsg", v10, (uint64_t)v13);
    if (v10) {
      xpc_release(v10);
    }
    uint64_t v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v11;
}

void __BTDeviceConnectServicesWithParameters_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceConnectServicesWithParameters_block_invoke_cold_1();
  }
}

uint64_t BTDeviceDisconnect(uint64_t a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceDisconnect_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v3 = MBXpcConnection;
    xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v4, "kCBMsgArgBTDevice", a1);
    uint64_t v8 = 0LL;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2000000000LL;
    uint64_t v11 = 0LL;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 0x40000000LL;
    v7[2] = __BTDeviceDisconnect_block_invoke;
    v7[3] = &unk_189FE7950;
    v7[4] = &v8;
    sendMessageWithReplySync(v3, "kCBMsgIdDeviceDisconnectMsg", v4, (uint64_t)v7);
    if (v4) {
      xpc_release(v4);
    }
    uint64_t v5 = *((unsigned int *)v9 + 6);
    _Block_object_dispose(&v8, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v5;
}

void __BTDeviceDisconnect_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceDisconnect_block_invoke_cold_1();
  }
}

uint64_t BTDevicePhysicalLinkDisconnect(uint64_t a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDevicePhysicalLinkDisconnect_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v3 = MBXpcConnection;
    xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v4, "kCBMsgArgBTDevice", a1);
    uint64_t v8 = 0LL;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2000000000LL;
    uint64_t v11 = 0LL;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 0x40000000LL;
    v7[2] = __BTDevicePhysicalLinkDisconnect_block_invoke;
    v7[3] = &unk_189FE7978;
    v7[4] = &v8;
    sendMessageWithReplySync(v3, "kCBMsgIdDevicePhysicalLinkDisconnectMsg", v4, (uint64_t)v7);
    if (v4) {
      xpc_release(v4);
    }
    uint64_t v5 = *((unsigned int *)v9 + 6);
    _Block_object_dispose(&v8, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v5;
}

void __BTDevicePhysicalLinkDisconnect_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDevicePhysicalLinkDisconnect_block_invoke_cold_1();
  }
}

uint64_t BTDeviceDisconnectServices(uint64_t a1, unsigned int a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceDisconnectServices_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgServiceMask", a2);
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    uint64_t v13 = 0LL;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceDisconnectServices_block_invoke;
    v9[3] = &unk_189FE79A0;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceDisconnectServicesMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    uint64_t v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceDisconnectServices_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceDisconnectServices_block_invoke_cold_1();
  }
}

uint64_t BTDeviceGetConnectedServices(uint64_t a1, _DWORD *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceGetConnectedServices_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    int v13 = 0;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceGetConnectedServices_block_invoke;
    v9[3] = &unk_189FE79C8;
    v9[4] = &v14;
    void v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceGetConnectedServicesMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    *a2 = *((_DWORD *)v11 + 6);
    uint64_t v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceGetConnectedServices_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgServiceMask");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceGetConnectedServices_block_invoke_cold_1();
  }
}

uint64_t BTDeviceGetSupportedServices(uint64_t a1, _DWORD *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceGetSupportedServices_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    int v13 = 0;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceGetSupportedServices_block_invoke;
    v9[3] = &unk_189FE79F0;
    v9[4] = &v14;
    void v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceGetSupportedServicesMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    *a2 = *((_DWORD *)v11 + 6);
    uint64_t v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceGetSupportedServices_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgServiceMask");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceGetSupportedServices_block_invoke_cold_1();
  }
}

uint64_t BTDeviceSetServiceSettings(uint64_t a1, unsigned int a2, const char *a3, const char *a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceSetServiceSettings_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgServiceMask", a2);
    xpc_dictionary_set_string(v10, "kCBMsgArgKey", a3);
    xpc_dictionary_set_string(v10, "kCBMsgArgValue", a4);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTDeviceSetServiceSettings_block_invoke;
    v13[3] = &unk_189FE7A18;
    void v13[4] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdDeviceSetServiceSettingsMsg", v10, (uint64_t)v13);
    if (v10) {
      xpc_release(v10);
    }
    uint64_t v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v11;
}

void __BTDeviceSetServiceSettings_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceSetServiceSettings_block_invoke_cold_1();
  }
}

uint64_t BTDeviceGetServiceSettings(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceGetServiceSettings_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgServiceMask", a2);
    xpc_dictionary_set_string(v10, "kCBMsgArgKey", a3);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTDeviceGetServiceSettings_block_invoke;
    v13[3] = &unk_189FE7A40;
    void v13[4] = &v14;
    void v13[5] = a4;
    sendMessageWithReplySync(v9, "kCBMsgIdDeviceGetServiceSettingsMsg", v10, (uint64_t)v13);
    if (v10) {
      xpc_release(v10);
    }
    uint64_t v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v11;
}

void __BTDeviceGetServiceSettings_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    xpc_object_t v4 = *(char **)(a1 + 40);
    string = xpc_dictionary_get_string(xdict, "kCBMsgArgValue");
    strcpy(v4, string);
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceGetServiceSettings_block_invoke_cold_1();
  }
}

uint64_t BTDeviceGetComPortForService(uint64_t a1, unsigned int a2, _BYTE *a3, uint64_t a4)
{
  *a3 = 0;
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceGetComPortForService_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgServiceID", a2);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBufferSize", a4);
    uint64_t v15 = 0LL;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2000000000LL;
    uint64_t v18 = 0LL;
    v14[0] = 0LL;
    v14[1] = v14;
    v14[2] = 0x2000000000LL;
    v14[3] = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTDeviceGetComPortForService_block_invoke;
    v13[3] = &unk_189FE7A68;
    void v13[4] = &v15;
    void v13[5] = v14;
    void v13[6] = a4;
    void v13[7] = a3;
    sendMessageWithReplySync(v9, "kCBMsgIdDeviceGetComPortForServiceMsg", v10, (uint64_t)v13);
    if (v10) {
      xpc_release(v10);
    }
    uint64_t v11 = *((unsigned int *)v16 + 6);
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(&v15, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v11;
}

void __BTDeviceGetComPortForService_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  data = xpc_dictionary_get_data(xdict, "kCBMsgArgData", (size_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  if (data)
  {
    unint64_t v5 = *(void *)(a1 + 48);
    if (v5)
    {
      if (v5 >= *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
        size_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      }
      else {
        size_t v6 = *(void *)(a1 + 48);
      }
      memcpy(*(void **)(a1 + 56), data, v6);
    }
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceGetComPortForService_block_invoke_cold_1();
  }
}

uint64_t BTDeviceGetComPortForServiceWithSandboxExtension( uint64_t a1, unsigned int a2, _BYTE *a3, uint64_t a4, uint64_t a5)
{
  *a3 = 0;
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceGetComPortForServiceWithSandboxExtension_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v11 = MBXpcConnection;
    xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgServiceID", a2);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBufferSize", a4);
    uint64_t v17 = 0LL;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2000000000LL;
    uint64_t v20 = 0LL;
    v16[0] = 0LL;
    v16[1] = v16;
    v16[2] = 0x2000000000LL;
    v16[3] = 0LL;
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 0x40000000LL;
    v15[2] = __BTDeviceGetComPortForServiceWithSandboxExtension_block_invoke;
    v15[3] = &unk_189FE7A90;
    v15[4] = &v17;
    void v15[5] = v16;
    void v15[6] = a3;
    v15[7] = a4;
    v15[8] = a5;
    sendMessageWithReplySync(v11, "kCBMsgIdDeviceGetComPortForServiceWithSandboxExtensionMsg", v12, (uint64_t)v15);
    if (v12) {
      xpc_release(v12);
    }
    uint64_t v13 = *((unsigned int *)v18 + 6);
    _Block_object_dispose(v16, 8);
    _Block_object_dispose(&v17, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v13;
}

void __BTDeviceGetComPortForServiceWithSandboxExtension_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  data = xpc_dictionary_get_data(xdict, "kCBMsgArgData", (size_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  if (data)
  {
    unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    if (v5)
    {
      if (*(void *)(a1 + 56) >= v5) {
        size_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      }
      else {
        size_t v6 = *(void *)(a1 + 56);
      }
      memcpy(*(void **)(a1 + 48), data, v6);
    }
  }

  size_t length = 0LL;
  uint64_t v7 = xpc_dictionary_get_data(xdict, "kCBMsgArgExtensionToken", &length);
  uint64_t v8 = *(void **)(a1 + 64);
  if (v8 && v7 && length) {
    memcpy(v8, v7, length);
  }
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceGetComPortForServiceWithSandboxExtension_block_invoke_cold_1();
  }
}

uint64_t BTDeviceSetVirtualType(uint64_t a1, unsigned int a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceSetVirtualType_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgType", a2);
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    uint64_t v13 = 0LL;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceSetVirtualType_block_invoke;
    v9[3] = &unk_189FE7AB8;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceSetVirtualTypeMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    uint64_t v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceSetVirtualType_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceSetVirtualType_block_invoke_cold_1();
  }
}

uint64_t BTDeviceGetVirtualType(uint64_t a1, _DWORD *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceGetVirtualType_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    int v13 = 0;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceGetVirtualType_block_invoke;
    v9[3] = &unk_189FE7AE0;
    v9[4] = &v14;
    void v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceGetVirtualTypeMsg", v6, (uint64_t)v9);
    *a2 = *((_DWORD *)v11 + 6);
    if (v6) {
      xpc_release(v6);
    }
    uint64_t v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceGetVirtualType_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgType");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceGetVirtualType_block_invoke_cold_1();
  }
}

uint64_t BTDeviceMatchesAdvertisedKey(uint64_t a1, const void *a2, size_t a3, _DWORD *a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceMatchesAdvertisedKey_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_data(v10, "kCBMsgArgKey", a2, a3);
    uint64_t v18 = 0LL;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2000000000LL;
    uint64_t v21 = 0LL;
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    int v17 = 0;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTDeviceMatchesAdvertisedKey_block_invoke;
    v13[3] = &unk_189FE7B08;
    void v13[4] = &v18;
    void v13[5] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdDeviceMatchesAdvertisedKeyMsg", v10, (uint64_t)v13);
    *a4 = *((_DWORD *)v15 + 6);
    if (v10) {
      xpc_release(v10);
    }
    uint64_t v11 = *((unsigned int *)v19 + 6);
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v11;
}

void __BTDeviceMatchesAdvertisedKey_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBool");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceMatchesAdvertisedKey_block_invoke_cold_1();
  }
}

uint64_t BTDeviceGetAdvertisedValueForKey( uint64_t a1, const void *a2, size_t a3, uint64_t a4, unint64_t *a5, unsigned int a6)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceGetAdvertisedValueForKey_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v13 = MBXpcConnection;
    xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_data(v14, "kCBMsgArgKey", a2, a3);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgBufferSize", a6);
    uint64_t v24 = 0LL;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x2000000000LL;
    uint64_t v27 = 0LL;
    uint64_t v20 = 0LL;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2000000000LL;
    uint64_t v23 = 0LL;
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 0x40000000LL;
    v18[2] = __BTDeviceGetAdvertisedValueForKey_block_invoke;
    v18[3] = &unk_189FE7B30;
    v18[4] = &v24;
    v18[5] = &v20;
    v18[6] = a4;
    unsigned int v19 = a6;
    sendMessageWithReplySync(v13, "kCBMsgIdDeviceGetAdvertisedValueForKeyMsg", v14, (uint64_t)v18);
    if (v14) {
      xpc_release(v14);
    }
    unint64_t v15 = v21[3];
    if (v15 >= a6) {
      unint64_t v15 = a6;
    }
    *a5 = v15;
    uint64_t v16 = *((unsigned int *)v25 + 6);
    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v24, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v16;
}

void __BTDeviceGetAdvertisedValueForKey_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  data = xpc_dictionary_get_data(xdict, "kCBMsgArgData", (size_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  if (data)
  {
    unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    if (v5)
    {
      else {
        size_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      }
      memcpy(*(void **)(a1 + 48), data, v6);
    }
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceGetAdvertisedValueForKey_block_invoke_cold_1();
  }
}

uint64_t BTDeviceGetDeviceId(uint64_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceGetDeviceId_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v11 = MBXpcConnection;
    xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBTDevice", a1);
    uint64_t v32 = 0LL;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x2000000000LL;
    uint64_t v35 = 0LL;
    uint64_t v28 = 0LL;
    __int16 v29 = &v28;
    uint64_t v30 = 0x2000000000LL;
    int v31 = 0;
    uint64_t v24 = 0LL;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x2000000000LL;
    int v27 = 0;
    uint64_t v20 = 0LL;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2000000000LL;
    int v23 = 0;
    uint64_t v16 = 0LL;
    int v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    int v19 = 0;
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 0x40000000LL;
    v15[2] = __BTDeviceGetDeviceId_block_invoke;
    v15[3] = &unk_189FE7B58;
    v15[4] = &v32;
    void v15[5] = &v28;
    void v15[6] = &v24;
    v15[7] = &v20;
    v15[8] = &v16;
    sendMessageWithReplySync(v11, "kCBMsgIdDeviceGetDeviceIdMsg", v12, (uint64_t)v15);
    if (v12) {
      xpc_release(v12);
    }
    *a2 = *((_DWORD *)v29 + 6);
    *a3 = *((_DWORD *)v25 + 6);
    *a4 = *((_DWORD *)v21 + 6);
    *a5 = *((_DWORD *)v17 + 6);
    uint64_t v13 = *((unsigned int *)v33 + 6);
    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v13;
}

void __BTDeviceGetDeviceId_block_invoke(void *a1, xpc_object_t xdict)
{
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  uint64_t v5 = a1[4];
  a1 += 4;
  *(void *)(*(void *)(v5 + 8) + 24LL) = uint64;
  *(_DWORD *)(*(void *)(a1[1] + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgVendorIdSource");
  *(_DWORD *)(*(void *)(a1[2] + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgVendorId");
  *(_DWORD *)(*(void *)(a1[3] + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgProductId");
  *(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgVersionId");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceGetDeviceId_block_invoke_cold_1();
  }
}

uint64_t BTDeviceSetHIDProperties(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceSetHIDProperties_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAuthStatus", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgHIDType", a3);
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTDeviceSetHIDProperties_block_invoke;
    v11[3] = &unk_189FE7B80;
    void v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdDeviceSetHIDPropertiesMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTDeviceSetHIDProperties_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceSetHIDProperties_block_invoke_cold_1();
  }
}

uint64_t BTDeviceConfigureLinkKey(uint64_t a1, const void *a2, const void *a3, unsigned int a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceConfigureLinkKey_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a1);
    if (a4) {
      xpc_dictionary_set_data(v10, "kCBMsgArgKey", a3, 0x10uLL);
    }
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBool", a4);
    xpc_dictionary_set_data(v10, "kCBMsgArgAddressBytes", a2, 6uLL);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTDeviceConfigureLinkKey_block_invoke;
    v13[3] = &unk_189FE7BA8;
    void v13[4] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdDeviceConfigureLinkKeyMsg", v10, (uint64_t)v13);
    if (v10) {
      xpc_release(v10);
    }
    uint64_t v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v11;
}

void __BTDeviceConfigureLinkKey_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceConfigureLinkKey_block_invoke_cold_1();
  }
}

uint64_t BTDeviceIsTemporaryPaired(uint64_t a1, _DWORD *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceIsTemporaryPaired_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    int v13 = 0;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceIsTemporaryPaired_block_invoke;
    v9[3] = &unk_189FE7BD0;
    v9[4] = &v14;
    void v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceIsTemporaryPairedMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    *a2 = *((_DWORD *)v11 + 6);
    uint64_t v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceIsTemporaryPaired_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgPaired");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceIsTemporaryPaired_block_invoke_cold_1();
  }
}

uint64_t BTDeviceIsWirelessSplitterSupported(uint64_t a1, _DWORD *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceIsWirelessSplitterSupported_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    int v13 = 0;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceIsWirelessSplitterSupported_block_invoke;
    v9[3] = &unk_189FE7BF8;
    v9[4] = &v14;
    void v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceIsWirelessSplitterSupportedMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    *a2 = *((_DWORD *)v11 + 6);
    uint64_t v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceIsWirelessSplitterSupported_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBool");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceIsWirelessSplitterSupported_block_invoke_cold_1();
  }
}

uint64_t BTDeviceIsTemporaryPairedNotInContacts(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTDeviceIsTemporaryPairedNotInContacts_cold_2();
    if (MBXpcConnection) {
      goto LABEL_5;
    }
  }

  else if (MBXpcConnection)
  {
LABEL_5:
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v5, "kCBMsgArgBTDevice", a1);
    uint64_t v13 = 0LL;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2000000000LL;
    uint64_t v16 = 0LL;
    uint64_t v9 = 0LL;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2000000000LL;
    int v12 = 0;
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 0x40000000LL;
    v8[2] = __BTDeviceIsTemporaryPairedNotInContacts_block_invoke;
    v8[3] = &unk_189FE7C20;
    v8[4] = &v13;
    v8[5] = &v9;
    sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdDeviceIsTemporaryPairedNotInContactsMsg", v5, (uint64_t)v8);
    if (v5) {
      xpc_release(v5);
    }
    *a2 = *((_DWORD *)v10 + 6);
    uint64_t v6 = *((unsigned int *)v14 + 6);
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v13, 8);
    return v6;
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
    BTDeviceGetAddressString_cold_1();
  }
  return 1LL;
}

void __BTDeviceIsTemporaryPairedNotInContacts_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBool");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceIsTemporaryPairedNotInContacts_block_invoke_cold_1();
  }
}

uint64_t BTDeviceGetLowSecurityStatus(uint64_t a1, _DWORD *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceGetLowSecurityStatus_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    int v13 = 0;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceGetLowSecurityStatus_block_invoke;
    v9[3] = &unk_189FE7C48;
    v9[4] = &v14;
    void v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceGetLowSecurityStatusMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    *a2 = *((_DWORD *)v11 + 6);
    uint64_t v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceGetLowSecurityStatus_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgLowSecurityStatus");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceGetLowSecurityStatus_block_invoke_cold_1();
  }
}

uint64_t BTDeviceGetHIDDeviceBehavior(uint64_t a1, _DWORD *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceGetHIDDeviceBehavior_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    int v13 = 0;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceGetHIDDeviceBehavior_block_invoke;
    v9[3] = &unk_189FE7C70;
    v9[4] = &v14;
    void v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceGetHIDDeviceBehaviorMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    *a2 = *((_DWORD *)v11 + 6);
    uint64_t v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceGetHIDDeviceBehavior_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMSgArgHIDDeviceBehavior");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceGetHIDDeviceBehavior_block_invoke_cold_1();
  }
}

uint64_t BTDeviceSetHijackAudioRoute(uint64_t a1, unsigned int a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceSetHijackAudioRoute_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBool", a2);
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    uint64_t v13 = 0LL;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceSetHijackAudioRoute_block_invoke;
    v9[3] = &unk_189FE7C98;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceSetHijackAudioRouteMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    uint64_t v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceSetHijackAudioRoute_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceSetHijackAudioRoute_block_invoke_cold_1();
  }
}

uint64_t BTDeviceSetACLHighPriority(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceSetACLHighPriority_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgRequesterID", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBool", a3);
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTDeviceSetACLHighPriority_block_invoke;
    v11[3] = &unk_189FE7CC0;
    void v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdDeviceSetACLHighPriorityMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTDeviceSetACLHighPriority_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceSetACLHighPriority_block_invoke_cold_1();
  }
}

uint64_t BTDeviceIsMaster(uint64_t a1, _DWORD *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
    BTDeviceIsMaster_cold_1();
  }
  return BTDeviceIsCentral(a1, a2);
}

uint64_t BTDeviceIsCentral(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTDeviceIsCentral_cold_2();
    if (MBXpcConnection) {
      goto LABEL_5;
    }
  }

  else if (MBXpcConnection)
  {
LABEL_5:
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v5, "kCBMsgArgBTDevice", a1);
    uint64_t v13 = 0LL;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2000000000LL;
    uint64_t v16 = 0LL;
    uint64_t v9 = 0LL;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2000000000LL;
    int v12 = 0;
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 0x40000000LL;
    v8[2] = __BTDeviceIsCentral_block_invoke;
    v8[3] = &unk_189FE7CE8;
    v8[4] = &v13;
    v8[5] = &v9;
    sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdDeviceIsCentralMsg", v5, (uint64_t)v8);
    if (v5) {
      xpc_release(v5);
    }
    *a2 = *((_DWORD *)v10 + 6);
    uint64_t v6 = *((unsigned int *)v14 + 6);
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v13, 8);
    return v6;
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
    BTDeviceGetAddressString_cold_1();
  }
  return 1LL;
}

void __BTDeviceIsCentral_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBool");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceIsCentral_block_invoke_cold_1();
  }
}

uint64_t BTDeviceGetUserSelectedDeviceType(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTDeviceGetUserSelectedDeviceType_cold_2();
    if (MBXpcConnection) {
      goto LABEL_5;
    }
  }

  else if (MBXpcConnection)
  {
LABEL_5:
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v5, "kCBMsgArgBTDevice", a1);
    uint64_t v13 = 0LL;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2000000000LL;
    uint64_t v16 = 0LL;
    uint64_t v9 = 0LL;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2000000000LL;
    int v12 = 0;
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 0x40000000LL;
    v8[2] = __BTDeviceGetUserSelectedDeviceType_block_invoke;
    v8[3] = &unk_189FE7D10;
    v8[4] = &v13;
    v8[5] = &v9;
    sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdDeviceGetUserSelectedDeviceTypeMsg", v5, (uint64_t)v8);
    if (v5) {
      xpc_release(v5);
    }
    *a2 = *((_DWORD *)v10 + 6);
    uint64_t v6 = *((unsigned int *)v14 + 6);
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v13, 8);
    return v6;
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
    BTDeviceGetAddressString_cold_1();
  }
  return 1LL;
}

void __BTDeviceGetUserSelectedDeviceType_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgBTDeviceType");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceGetUserSelectedDeviceType_block_invoke_cold_1();
  }
}

uint64_t BTDeviceSetUserSelectedDeviceType(uint64_t a1, unsigned int a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceSetUserSelectedDeviceType_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDeviceType", a2);
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    uint64_t v13 = 0LL;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceSetUserSelectedDeviceType_block_invoke;
    v9[3] = &unk_189FE7D38;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceSetUserSelectedDeviceTypeMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    uint64_t v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceSetUserSelectedDeviceType_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceSetUserSelectedDeviceType_block_invoke_cold_1();
  }
}

uint64_t BTDeviceIsGenuineAirPods(uint64_t a1, _DWORD *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDeviceIsGenuineAirPods_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    int v13 = 0;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTDeviceIsGenuineAirPods_block_invoke;
    v9[3] = &unk_189FE7D60;
    v9[4] = &v14;
    void v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceIsGenuineAirPodsMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    *a2 = *((_DWORD *)v11 + 6);
    uint64_t v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceGetAddressString_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTDeviceIsGenuineAirPods_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgGenuine");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDeviceIsGenuineAirPods_block_invoke_cold_1();
  }
}

uint64_t deviceServiceXpcDisconnectedHandler(uint64_t a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
    deviceServiceXpcDisconnectedHandler_cold_1();
  }
  return _localBTDeviceServiceRemoveCallbacksByXpcConnection(a1);
}

uint64_t deviceServiceXpcMsgHandler(uint64_t a1, const char *a2, xpc_object_t xdict)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgSessionID");
  uint64_t v7 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgID");
  uint64_t v24 = uint64;
  Callbacks = (void (*)(void, void, void, void, void, void))_localBTDeviceServiceGetCallbacks( uint64,  v7);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v9 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v26 = a2;
    __int16 v27 = 2080;
    uint64_t v28 = (const char *)(a1 + 2080);
    __int16 v29 = 2080;
    uint64_t v30 = a1 + 2336;
    __int16 v31 = 2048;
    uint64_t v32 = uint64;
    __int16 v33 = 2048;
    uint64_t v34 = v7;
    __int16 v35 = 2048;
    uint64_t v36 = Callbacks;
    _os_log_debug_impl( &dword_1870FD000,  v9,  OS_LOG_TYPE_DEBUG,  "deviceServiceXpcMsgHandler msg:%s sessionName:%s serviceName:%s session:%llx cbid:%llx cb:%llx",  buf,  0x3Eu);
  }

  BOOL v10 = strcmp(a2, "kCBMsgIdServiceEvent") || Callbacks == 0LL;
  uint64_t v11 = !v10;
  if (!v10)
  {
    uint64_t v12 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
    uint64_t v13 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
    uint64_t v14 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgServiceMask");
    uint64_t v15 = a1;
    uint64_t v16 = a2;
    uint64_t v17 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgEventType");
    uint64_t v18 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgEvent");
    uint64_t UserData = _localBTDeviceServiceGetUserData(v24, v7);
    uint64_t v20 = v17;
    a2 = v16;
    a1 = v15;
    Callbacks(v13, v14, v20, v18, v12, UserData);
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v21 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    int v23 = "did not handle";
    *(_DWORD *)buf = 136316674;
    if ((_DWORD)v11) {
      int v23 = "handled";
    }
    uint64_t v26 = v23;
    __int16 v27 = 2080;
    uint64_t v28 = a2;
    __int16 v29 = 2080;
    uint64_t v30 = a1 + 2080;
    __int16 v31 = 2080;
    uint64_t v32 = a1 + 2336;
    __int16 v33 = 2048;
    uint64_t v34 = v24;
    __int16 v35 = 2048;
    uint64_t v36 = (void (*)(void, void, void, void, void, void))v7;
    __int16 v37 = 2048;
    unint64_t v38 = Callbacks;
    _os_log_debug_impl( &dword_1870FD000,  v21,  OS_LOG_TYPE_DEBUG,  "deviceServiceXpcMsgHandler %s %s sessionName:%s serviceName:%s session:%llx cbid:%llx cb:%llx",  buf,  0x48u);
  }

  return v11;
}

  ;
}

BOOL _localBTDiscoveryAgentCallbacksRegistered(uint64_t a1)
{
  if (qword_18C6B87D8 == a1)
  {
    BOOL v6 = 1LL;
  }

  else
  {
    unint64_t v2 = 0LL;
    uint64_t v3 = &qword_18C6B8808;
    do
    {
      unint64_t v4 = v2;
      if (v2 == 63) {
        break;
      }
      uint64_t v5 = *v3;
      v3 += 6;
      ++v2;
    }

    while (v5 != a1);
    BOOL v6 = v4 < 0x3F;
  }

  pthread_mutex_unlock(&gLock_1);
  return v6;
}

uint64_t _localBTDiscoveryAgentAddCallbacks(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = 0LL;
  while (*(void *)((char *)&gBTDiscoveryAgentCallbackList + v10 + 16)
       || *(void *)((char *)&gBTDiscoveryAgentCallbackList + v10 + 32))
  {
    v10 += 48LL;
    if (v10 == 3072)
    {
      uint64_t v11 = 4LL;
      goto LABEL_7;
    }
  }

  uint64_t v11 = 0LL;
  uint64_t v12 = (char *)&gBTDiscoveryAgentCallbackList + v10;
  *(_OWORD *)uint64_t v12 = *a3;
  *((void *)v12 + 4) = a5;
  *((void *)v12 + 5) = a4;
  *((void *)v12 + 2) = a1;
  *((void *)v12 + 3) = a2;
LABEL_7:
  pthread_mutex_unlock(&gLock_1);
  return v11;
}

uint64_t _localBTDiscoveryAgentRemoveCallbacks(uint64_t a1)
{
  uint64_t v2 = 0LL;
  while (1)
  {
    uint64_t v3 = (_OWORD *)((char *)&gBTDiscoveryAgentCallbackList + v2);
    v2 += 48LL;
    if (v2 == 3072) {
      goto LABEL_6;
    }
  }

  v3[1] = 0u;
  v3[2] = 0u;
  _OWORD *v3 = 0u;
LABEL_6:
  pthread_mutex_unlock(&gLock_1);
  return 0LL;
}

uint64_t _localBTDiscoveryAgentRemoveCallbacksByXpcConnection(uint64_t a1)
{
  for (uint64_t i = 0LL; i != 3072; i += 48LL)
  {
    uint64_t v3 = (_OWORD *)((char *)&gBTDiscoveryAgentCallbackList + i);
    if (*(void *)((char *)&gBTDiscoveryAgentCallbackList + i + 24) == a1)
    {
      v3[1] = 0uLL;
      v3[2] = 0uLL;
      _OWORD *v3 = 0uLL;
    }
  }

  pthread_mutex_unlock(&gLock_1);
  return 0LL;
}

char *_localBTDiscoveryAgentGetCallbacks(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0LL;
  while (*(void *)((char *)&gBTDiscoveryAgentCallbackList + v4 + 16) != a1
       || *(void *)((char *)&gBTDiscoveryAgentCallbackList + v4 + 32) != a2)
  {
    v4 += 48LL;
    if (v4 == 3072)
    {
      uint64_t v5 = 0LL;
      goto LABEL_7;
    }
  }

  uint64_t v5 = (char *)&gBTDiscoveryAgentCallbackList + v4;
LABEL_7:
  pthread_mutex_unlock(&gLock_1);
  return v5;
}

uint64_t _localBTDiscoveryAgentGetUserData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0LL;
  while (*(void *)((char *)&gBTDiscoveryAgentCallbackList + v4 + 16) != a1
       || *(void *)((char *)&gBTDiscoveryAgentCallbackList + v4 + 32) != a2)
  {
    v4 += 48LL;
    if (v4 == 3072)
    {
      uint64_t v5 = 0LL;
      goto LABEL_7;
    }
  }

  uint64_t v5 = *(void *)((char *)&gBTDiscoveryAgentCallbackList + v4 + 40);
LABEL_7:
  pthread_mutex_unlock(&gLock_1);
  return v5;
}

uint64_t BTDiscoveryAgentCreate(uint64_t *a1, _OWORD *a2, uint64_t a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  xpc_object_t v8 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a1;
    _os_log_debug_impl( &dword_1870FD000,  v8,  OS_LOG_TYPE_DEBUG,  "BTDiscoveryAgentCreate session :%llx",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t SessionHandle = getSessionHandle(a1);
  uint64_t MBXpcConnection = getMBXpcConnection((uint64_t)a1);
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x2000000000LL;
  uint64_t v23 = 0LL;
  if (MBXpcConnection)
  {
    uint64_t v11 = MBXpcConnection;
    uint64_t v12 = ++gCBID_1;
    xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v13, "kCBMsgArgSessionID", SessionHandle);
    xpc_dictionary_set_uint64(v13, "kCBMsgArgID", v12);
    uint64_t v17 = 0LL;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2000000000LL;
    uint64_t v20 = 0LL;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 0x40000000LL;
    v16[2] = __BTDiscoveryAgentCreate_block_invoke;
    v16[3] = &unk_189FE7D88;
    void v16[4] = &buf;
    void v16[5] = &v17;
    sendMessageWithReplySync(v11, "kCBMsgIdDiscoveryAgentCreateMsg", v13, (uint64_t)v16);
    if (v13) {
      xpc_release(v13);
    }
    uint64_t v14 = v18[3];
    if (!v14)
    {
      addXpcMsgHandler(v11, (uint64_t)&deviceServiceManagerXpcCallbacks_0);
      if (_localBTDiscoveryAgentCallbacksRegistered(*(void *)(*((void *)&buf + 1) + 24LL)))
      {
        if (MBFLogInitOnce != -1) {
          dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
        }
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
          BTAccessoryManagerAddCallbacks_cold_2();
        }
        uint64_t v14 = 0LL;
      }

      else if (_localBTDiscoveryAgentAddCallbacks( *(void *)(*((void *)&buf + 1) + 24LL),  v11,  a2,  a3,  v12))
      {
        if (MBFLogInitOnce != -1) {
          dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
        }
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
          BTDiscoveryAgentCreate_cold_3();
        }
        uint64_t v14 = 4LL;
      }

      else
      {
        *a4 = *(void *)(*((void *)&buf + 1) + 24LL);
        uint64_t v14 = v18[3];
      }
    }

    _Block_object_dispose(&v17, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceAddressToString_cold_1();
    }
    uint64_t v14 = 1LL;
  }

  _Block_object_dispose(&buf, 8);
  return v14;
}

void __BTDiscoveryAgentCreate_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgDiscoveryAgentID");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDiscoveryAgentCreate_block_invoke_cold_1();
  }
}

uint64_t BTDiscoveryAgentDestroy(uint64_t *a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDiscoveryAgentDestroy_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(*a1);
  if (MBXpcConnection)
  {
    uint64_t v3 = MBXpcConnection;
    xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v4, "kCBMsgArgDiscoveryAgentID", (uint64_t)a1);
    uint64_t v8 = 0LL;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2000000000LL;
    uint64_t v11 = 0LL;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 0x40000000LL;
    v7[2] = __BTDiscoveryAgentDestroy_block_invoke;
    v7[3] = &unk_189FE7DB0;
    v7[4] = &v8;
    sendMessageWithReplySync(v3, "kCBMsgIdDiscoveryAgentDestroyMsg", v4, (uint64_t)v7);
    if (!v9[3])
    {
      _localBTDiscoveryAgentRemoveCallbacks(*a1);
      removeXpcMsgHandler(v3, (uint64_t)&deviceServiceManagerXpcCallbacks_0);
      *a1 = 0LL;
    }

    if (v4) {
      xpc_release(v4);
    }
    uint64_t v5 = *((unsigned int *)v9 + 6);
    _Block_object_dispose(&v8, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v5;
}

void __BTDiscoveryAgentDestroy_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDiscoveryAgentDestroy_block_invoke_cold_1();
  }
}

uint64_t BTDiscoveryAgentStartScan(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDiscoveryAgentStartScan_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgDiscoveryAgentID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgDiscoveryMode", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgServices", a3);
    uint64_t v12 = 0LL;
    xpc_object_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTDiscoveryAgentStartScan_block_invoke;
    v11[3] = &unk_189FE7DD8;
    void v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdDiscoveryAgentStartScanMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTDiscoveryAgentStartScan_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDiscoveryAgentStartScan_block_invoke_cold_1();
  }
}

uint64_t BTDiscoveryAgentStartScanForAdvertizedData(uint64_t a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDiscoveryAgentStartScanForAdvertizedData_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v3 = MBXpcConnection;
    xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v4, "kCBMsgArgDiscoveryAgentID", a1);
    uint64_t v8 = 0LL;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2000000000LL;
    uint64_t v11 = 0LL;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 0x40000000LL;
    v7[2] = __BTDiscoveryAgentStartScanForAdvertizedData_block_invoke;
    v7[3] = &unk_189FE7E00;
    v7[4] = &v8;
    sendMessageWithReplySync(v3, "kCBMsgIdDiscoveryAgentStartScanForAdvertizedDataMsg", v4, (uint64_t)v7);
    if (v4) {
      xpc_release(v4);
    }
    uint64_t v5 = *((unsigned int *)v9 + 6);
    _Block_object_dispose(&v8, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v5;
}

void __BTDiscoveryAgentStartScanForAdvertizedData_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDiscoveryAgentStartScanForAdvertizedData_block_invoke_cold_1();
  }
}

uint64_t BTDiscoveryAgentStopScan(uint64_t a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDiscoveryAgentStopScan_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v3 = MBXpcConnection;
    xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v4, "kCBMsgArgDiscoveryAgentID", a1);
    uint64_t v8 = 0LL;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2000000000LL;
    uint64_t v11 = 0LL;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 0x40000000LL;
    v7[2] = __BTDiscoveryAgentStopScan_block_invoke;
    v7[3] = &unk_189FE7E28;
    v7[4] = &v8;
    sendMessageWithReplySync(v3, "kCBMsgIdDiscoveryAgentStopScanMsg", v4, (uint64_t)v7);
    if (v4) {
      xpc_release(v4);
    }
    uint64_t v5 = *((unsigned int *)v9 + 6);
    _Block_object_dispose(&v8, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v5;
}

void __BTDiscoveryAgentStopScan_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDiscoveryAgentStopScan_block_invoke_cold_1();
  }
}

uint64_t BTDiscoveryAgentGetDevices(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDiscoveryAgentGetDevices_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgDiscoveryAgentID", a1);
    xpc_dictionary_set_uint64(v10, "kCbMsgArgDeviceArrayMaxSize", a4);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTDiscoveryAgentGetDevices_block_invoke;
    v13[3] = &unk_189FE7E50;
    void v13[4] = &v14;
    void v13[5] = a4;
    void v13[6] = a2;
    void v13[7] = a3;
    sendMessageWithReplySync(v9, "kCBMsgIdDiscoveryAgentGetDevicesMsg", v10, (uint64_t)v13);
    if (v10) {
      xpc_release(v10);
    }
    uint64_t v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v11;
}

void __BTDiscoveryAgentGetDevices_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kCBMsgArgDeviceArray");
  size_t count = xpc_array_get_count(value);
  if (count)
  {
    for (size_t i = 0LL; i != count; ++i)
    {
      if (i >= *(void *)(a1 + 40)) {
        break;
      }
      *(void *)(*(void *)(a1 + 48) + 8 * i) = xpc_array_get_uint64(value, i);
      if (MBFLogInitOnce != -1) {
        dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
      }
      uint64_t v7 = (os_log_s *)MBFLogComponent;
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8 * i);
        *(_DWORD *)__int128 buf = 134218240;
        size_t v10 = i;
        __int16 v11 = 2048;
        uint64_t v12 = v8;
        _os_log_debug_impl(&dword_1870FD000, v7, OS_LOG_TYPE_DEBUG, "i:%lx BTDevie:%llx", buf, 0x16u);
      }
    }
  }

  **(void **)(a1 + 56) = count;
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDiscoveryAgentGetDevices_block_invoke_cold_1();
  }
}

uint64_t BTDiscoveryAgentAddKey(uint64_t a1, const void *a2, size_t a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDiscoveryAgentAddKey_cold_4();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (!MBXpcConnection)
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  if (!a2)
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDiscoveryAgentAddKey_cold_2();
    }
    return 1LL;
  }

  if (!a3)
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDiscoveryAgentAddKey_cold_3();
    }
    return 1LL;
  }

  uint64_t v7 = MBXpcConnection;
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v8, "kCBMsgArgDiscoveryAgentID", a1);
  xpc_dictionary_set_data(v8, "kCBMsgArgKey", a2, a3);
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  uint64_t v15 = 0LL;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 0x40000000LL;
  v11[2] = __BTDiscoveryAgentAddKey_block_invoke;
  v11[3] = &unk_189FE7E78;
  void v11[4] = &v12;
  sendMessageWithReplySync(v7, "kCBMsgIdDiscoveryAgentAddKeyMsg", v8, (uint64_t)v11);
  if (v8) {
    xpc_release(v8);
  }
  uint64_t v9 = *((unsigned int *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v9;
}

void __BTDiscoveryAgentAddKey_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDiscoveryAgentAddKey_block_invoke_cold_1();
  }
}

uint64_t BTDiscoveryAgentRemoveKey(uint64_t a1, const void *a2, size_t a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTDiscoveryAgentRemoveKey_cold_4();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (!MBXpcConnection)
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  if (!a2)
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDiscoveryAgentAddKey_cold_2();
    }
    return 1LL;
  }

  if (!a3)
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDiscoveryAgentAddKey_cold_3();
    }
    return 1LL;
  }

  uint64_t v7 = MBXpcConnection;
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v8, "kCBMsgArgDiscoveryAgentID", a1);
  xpc_dictionary_set_data(v8, "kCBMsgArgKey", a2, a3);
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  uint64_t v15 = 0LL;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 0x40000000LL;
  v11[2] = __BTDiscoveryAgentRemoveKey_block_invoke;
  v11[3] = &unk_189FE7EA0;
  void v11[4] = &v12;
  sendMessageWithReplySync(v7, "kCBMsgIdDiscoveryAgentRemoveKeyMsg", v8, (uint64_t)v11);
  if (v8) {
    xpc_release(v8);
  }
  uint64_t v9 = *((unsigned int *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v9;
}

void __BTDiscoveryAgentRemoveKey_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTDiscoveryAgentAddKey_block_invoke_cold_1();
  }
}

uint64_t discoveryAgentXpcDisconnectedHandler(uint64_t a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
    discoveryAgentXpcDisconnectedHandler_cold_1();
  }
  return _localBTDiscoveryAgentRemoveCallbacksByXpcConnection(a1);
}

uint64_t discoveryAgentXpcMsgHandler(uint64_t a1, const char *a2, xpc_object_t xdict)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgDiscoveryAgentID");
  uint64_t v7 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgID");
  Callbacks = _localBTDiscoveryAgentGetCallbacks(uint64, v7);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v9 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 136316418;
    uint64_t v22 = a2;
    __int16 v23 = 2080;
    uint64_t v24 = (const char *)(a1 + 2080);
    __int16 v25 = 2080;
    uint64_t v26 = a1 + 2336;
    __int16 v27 = 2048;
    uint64_t v28 = uint64;
    __int16 v29 = 2048;
    uint64_t v30 = v7;
    __int16 v31 = 2048;
    uint64_t v32 = (uint64_t)Callbacks;
    _os_log_debug_impl( &dword_1870FD000,  v9,  OS_LOG_TYPE_DEBUG,  "discoveryAgentXpcMsgHandler msg:%s sessionName:%s serviceName:%s agentID:%llx cbid:%llx cbs:%llx",  buf,  0x3Eu);
  }

  if (!strcmp(a2, "kCBMsgIdDiscoveryAgentStatusEvent"))
  {
    if (Callbacks && *(void *)Callbacks)
    {
      uint64_t v20 = a1;
      uint64_t v12 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
      uint64_t v14 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
      uint64_t v13 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatus");
      __int16 v11 = Callbacks;
      goto LABEL_13;
    }

    goto LABEL_14;
  }

  uint64_t v10 = 0LL;
  if (!strcmp(a2, "kCBMsgIdDiscoveryAgentDiscoveryEvent") && Callbacks)
  {
    __int16 v11 = Callbacks + 8;
    if (*((void *)Callbacks + 1))
    {
      uint64_t v20 = a1;
      uint64_t v12 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
      uint64_t v13 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgEvent");
      uint64_t v14 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgAttributes");
LABEL_13:
      uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v11;
      uint64_t UserData = _localBTDiscoveryAgentGetUserData(uint64, v7);
      v15(uint64, v13, v12, v14, UserData);
      uint64_t v10 = 1LL;
      a1 = v20;
      goto LABEL_15;
    }

LABEL_14:
    uint64_t v10 = 0LL;
  }

LABEL_15:
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v17 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = "did not handle";
    *(_DWORD *)__int128 buf = 136316674;
    if ((_DWORD)v10) {
      uint64_t v19 = "handled";
    }
    uint64_t v22 = v19;
    __int16 v23 = 2080;
    uint64_t v24 = a2;
    __int16 v25 = 2080;
    uint64_t v26 = a1 + 2080;
    __int16 v27 = 2080;
    uint64_t v28 = a1 + 2336;
    __int16 v29 = 2048;
    uint64_t v30 = uint64;
    __int16 v31 = 2048;
    uint64_t v32 = v7;
    __int16 v33 = 2048;
    uint64_t v34 = Callbacks;
    _os_log_debug_impl( &dword_1870FD000,  v17,  OS_LOG_TYPE_DEBUG,  "discoveryAgentXpcMsgHandler %s %s sessionName:%s serviceName:%s agentID:%llx cbid:%llx cbs:%llx",  buf,  0x48u);
  }

  return v10;
}

BOOL _localBTLocalDeviceCallbacksRegistered(uint64_t a1, void *a2)
{
  unint64_t v4 = 0LL;
  BOOL v5 = 1;
  BOOL v6 = &qword_18C4BD4A0;
  do
  {
    if (*(v6 - 1) == a1)
    {
      BOOL v7 = *v6 == *a2 && v6[1] == a2[1];
      if (v7 && v6[2] == a2[2]) {
        break;
      }
    }

    BOOL v5 = v4 < 0x3F;
    v6 += 7;
    ++v4;
  }

  while (v4 != 64);
  pthread_mutex_unlock(&gLock_2);
  return v5;
}

uint64_t _localBTLocalDeviceGetCallbacksCBID(uint64_t a1, void *a2)
{
  uint64_t v4 = 0LL;
  while (1)
  {
    if (gBTLocalDeviceCallbackList[v4] == a1)
    {
      BOOL v5 = gBTLocalDeviceCallbackList[v4 + 1] == *a2 && gBTLocalDeviceCallbackList[v4 + 2] == a2[1];
      if (v5 && gBTLocalDeviceCallbackList[v4 + 3] == a2[2]) {
        break;
      }
    }

    v4 += 7LL;
    if (v4 == 448)
    {
      uint64_t v7 = 0LL;
      goto LABEL_13;
    }
  }

  uint64_t v7 = gBTLocalDeviceCallbackList[v4 + 5];
LABEL_13:
  pthread_mutex_unlock(&gLock_2);
  return v7;
}

BOOL _localBTLocalDeviceStatsCallbacksRegistered(uint64_t a1, void *a2)
{
  unint64_t v4 = 0LL;
  BOOL v5 = 1;
  BOOL v6 = &qword_18C6B93D0;
  do
  {
    if (*(v6 - 1) == a1 && *v6 == *a2) {
      break;
    }
    BOOL v5 = v4 < 0x3F;
    v6 += 5;
    ++v4;
  }

  while (v4 != 64);
  pthread_mutex_unlock(&gLock_2);
  return v5;
}

uint64_t _localBTLocalDeviceStatsGetCallbacksCBID(uint64_t a1, void *a2)
{
  uint64_t v4 = 0LL;
  while (gBTLocalDevicePowerCallbackList[v4] != a1 || gBTLocalDevicePowerCallbackList[v4 + 1] != *a2)
  {
    v4 += 5LL;
    if (v4 == 320)
    {
      uint64_t v5 = 0LL;
      goto LABEL_7;
    }
  }

  uint64_t v5 = gBTLocalDevicePowerCallbackList[v4 + 3];
LABEL_7:
  pthread_mutex_unlock(&gLock_2);
  return v5;
}

uint64_t _localBTLocalDeviceAddCallbacks(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v10 = 0LL;
  while (1)
  {
    if (!gBTLocalDeviceCallbackList[v10])
    {
      __int16 v11 = &gBTLocalDeviceCallbackList[v10];
      if (!gBTLocalDeviceCallbackList[v10 + 5]) {
        break;
      }
    }

    v10 += 7LL;
    if (v10 == 448)
    {
      uint64_t v12 = 4LL;
      goto LABEL_7;
    }
  }

  uint64_t v12 = 0LL;
  uint64_t v13 = *(void *)(a3 + 16);
  *(_OWORD *)(v11 + 1) = *(_OWORD *)a3;
  uint64_t v14 = ++gCBID_2;
  uint64_t *v11 = a1;
  void v11[5] = v14;
  void v11[6] = a4;
  v11[3] = v13;
  void v11[4] = a2;
  *a5 = v14;
LABEL_7:
  pthread_mutex_unlock(&gLock_2);
  return v12;
}

uint64_t _localBTLocalDeviceAddStatsCallbacks(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v10 = 0LL;
  while (1)
  {
    if (!gBTLocalDevicePowerCallbackList[v10])
    {
      __int16 v11 = &gBTLocalDevicePowerCallbackList[v10];
      if (!gBTLocalDevicePowerCallbackList[v10 + 3]) {
        break;
      }
    }

    v10 += 5LL;
    if (v10 == 320)
    {
      uint64_t v12 = 4LL;
      goto LABEL_7;
    }
  }

  uint64_t v12 = 0LL;
  uint64_t v13 = *a3;
  uint64_t v14 = ++gCBID_2;
  uint64_t *v11 = a1;
  v11[1] = v13;
  v11[3] = v14;
  void v11[4] = a4;
  v11[2] = a2;
  *a5 = v14;
LABEL_7:
  pthread_mutex_unlock(&gLock_2);
  return v12;
}

uint64_t _localBTLocalDeviceRemoveCallbacks(uint64_t a1, void *a2)
{
  uint64_t v4 = 0LL;
  while (1)
  {
    if (gBTLocalDeviceCallbackList[v4] == a1)
    {
      uint64_t v5 = &gBTLocalDeviceCallbackList[v4];
      BOOL v6 = gBTLocalDeviceCallbackList[v4 + 1] == *a2 && gBTLocalDeviceCallbackList[v4 + 2] == a2[1];
      if (v6 && gBTLocalDeviceCallbackList[v4 + 3] == a2[2]) {
        break;
      }
    }

    v4 += 7LL;
    if (v4 == 448) {
      goto LABEL_13;
    }
  }

  void v5[6] = 0LL;
  *((_OWORD *)v5 + 1) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  *(_OWORD *)uint64_t v5 = 0u;
LABEL_13:
  pthread_mutex_unlock(&gLock_2);
  return 0LL;
}

uint64_t _localBTLocalDeviceRemoveAllCallbacksByXPCConnection(uint64_t a1)
{
  for (uint64_t i = 0LL; i != 448; i += 7LL)
  {
    uint64_t v3 = &gBTLocalDeviceCallbackList[i];
    if (gBTLocalDeviceCallbackList[i + 4] == a1)
    {
      v3[6] = 0LL;
      *((_OWORD *)v3 + 1) = 0uLL;
      *((_OWORD *)v3 + 2) = 0uLL;
      *(_OWORD *)uint64_t v3 = 0uLL;
    }
  }

  for (uint64_t j = 0LL; j != 320; j += 5LL)
  {
    uint64_t v5 = &gBTLocalDevicePowerCallbackList[j];
    if (gBTLocalDevicePowerCallbackList[j + 2] == a1)
    {
      v5[4] = 0LL;
      *(_OWORD *)uint64_t v5 = 0uLL;
      *((_OWORD *)v5 + 1) = 0uLL;
    }
  }

  pthread_mutex_unlock(&gLock_2);
  return 0LL;
}

uint64_t _localBTLocalDeviceRemoveStatsCallbacks(uint64_t a1)
{
  uint64_t v2 = 0LL;
  while (1)
  {
    if (gBTLocalDevicePowerCallbackList[v2] == a1)
    {
      uint64_t v3 = &gBTLocalDevicePowerCallbackList[v2];
      if (gBTLocalDevicePowerCallbackList[v2 + 1]) {
        break;
      }
    }

    v2 += 5LL;
    if (v2 == 320) {
      goto LABEL_7;
    }
  }

  v3[4] = 0LL;
  *(_OWORD *)uint64_t v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
LABEL_7:
  pthread_mutex_unlock(&gLock_2);
  return 0LL;
}

uint64_t *_localBTLocalDeviceGetCallbacks(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0LL;
  while (gBTLocalDeviceCallbackList[v4] != a1 || gBTLocalDeviceCallbackList[v4 + 5] != a2)
  {
    v4 += 7LL;
    if (v4 == 448)
    {
      uint64_t v5 = 0LL;
      goto LABEL_7;
    }
  }

  uint64_t v5 = &gBTLocalDeviceCallbackList[v4 + 1];
LABEL_7:
  pthread_mutex_unlock(&gLock_2);
  return v5;
}

uint64_t *_localBTLocalDeviceGetStatsCallbacks(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0LL;
  while (gBTLocalDevicePowerCallbackList[v4] != a1 || gBTLocalDevicePowerCallbackList[v4 + 3] != a2)
  {
    v4 += 5LL;
    if (v4 == 320)
    {
      uint64_t v5 = 0LL;
      goto LABEL_7;
    }
  }

  uint64_t v5 = &gBTLocalDevicePowerCallbackList[v4 + 1];
LABEL_7:
  pthread_mutex_unlock(&gLock_2);
  return v5;
}

uint64_t _localBTLocalDeviceGetUserData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0LL;
  while (gBTLocalDeviceCallbackList[v4] != a1 || gBTLocalDeviceCallbackList[v4 + 5] != a2)
  {
    v4 += 7LL;
    if (v4 == 448) {
      goto LABEL_5;
    }
  }

  uint64_t v6 = gBTLocalDeviceCallbackList[v4 + 6];
  if (v6) {
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v5 = 0LL;
  while (gBTLocalDevicePowerCallbackList[v5] != a1 || gBTLocalDevicePowerCallbackList[v5 + 3] != a2)
  {
    v5 += 5LL;
    if (v5 == 320)
    {
      uint64_t v6 = 0LL;
      goto LABEL_13;
    }
  }

  uint64_t v6 = gBTLocalDevicePowerCallbackList[v5 + 4];
LABEL_13:
  pthread_mutex_unlock(&gLock_2);
  return v6;
}

uint64_t BTLocalDeviceGetDefault(uint64_t *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t SessionHandle = getSessionHandle(a1);
  uint64_t MBXpcConnection = getMBXpcConnection((uint64_t)a1);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTLocalDeviceGetDefault_cold_2();
  }
  if (MBXpcConnection)
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    uint64_t v6 = (os_log_s *)MBFLogComponent;
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 136315906;
      *(void *)&uint8_t buf[4] = MBXpcConnection + 2336;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = MBXpcConnection + 2080;
      *(_WORD *)&buf[22] = 2048;
      uint64_t v16 = a1;
      __int16 v17 = 2048;
      uint64_t v18 = SessionHandle;
      _os_log_debug_impl( &dword_1870FD000,  v6,  OS_LOG_TYPE_DEBUG,  "BTLocalDeviceGetDefault service:%s, sessionName:%s session:%llx sessionID:%llx",  buf,  0x2Au);
    }

    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgSessionID", SessionHandle);
    *(void *)__int128 buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2000000000LL;
    uint64_t v16 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2000000000LL;
    uint64_t v14 = 0LL;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 0x40000000LL;
    v10[2] = __BTLocalDeviceGetDefault_block_invoke;
    v10[3] = &unk_189FE7EC8;
    v10[4] = buf;
    void v10[5] = &v11;
    sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdLocalDeviceGetDefaultMsg", v7, (uint64_t)v10);
    *a2 = *(void *)(*(void *)&buf[8] + 24LL);
    if (v7) {
      xpc_release(v7);
    }
    uint64_t v8 = *((unsigned int *)v12 + 6);
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTLocalDeviceGetDefault_cold_1();
    }
    return 1LL;
  }

  return v8;
}

void __BTLocalDeviceGetDefault_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgLocalDeviceID");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceGetDefault_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceAddCallbacks(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTLocalDeviceAddCallbacks_cold_4();
    if (MBXpcConnection)
    {
LABEL_5:
      addXpcMsgHandler(MBXpcConnection, (uint64_t)&localDeviceXpcCallbacks);
      if (_localBTLocalDeviceCallbacksRegistered(a1, a2))
      {
        if (MBFLogInitOnce != -1) {
          dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
        }
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
          BTAccessoryManagerAddCallbacks_cold_2();
        }
        return 0LL;
      }

      else
      {
        uint64_t value = 0LL;
        if (_localBTLocalDeviceAddCallbacks(a1, MBXpcConnection, (uint64_t)a2, a3, (uint64_t *)&value))
        {
          if (MBFLogInitOnce != -1) {
            dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
          }
          if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
            BTDiscoveryAgentCreate_cold_3();
          }
          return 4LL;
        }

        else
        {
          xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
          xpc_dictionary_set_uint64(v8, "kCBMsgArgLocalDeviceID", a1);
          xpc_dictionary_set_uint64(v8, "kCBMsgArgID", value);
          uint64_t v11 = 0LL;
          uint64_t v12 = &v11;
          uint64_t v13 = 0x2000000000LL;
          uint64_t v14 = 0LL;
          v10[0] = MEMORY[0x1895F87A8];
          v10[1] = 0x40000000LL;
          v10[2] = __BTLocalDeviceAddCallbacks_block_invoke;
          v10[3] = &unk_189FE7EF0;
          v10[4] = &v11;
          sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdLocalDeviceAddCallbacksMsg", v8, (uint64_t)v10);
          if (v8) {
            xpc_release(v8);
          }
          if (v12[3])
          {
            _localBTLocalDeviceRemoveCallbacks(a1, a2);
            uint64_t v7 = *((unsigned int *)v12 + 6);
          }

          else
          {
            uint64_t v7 = 0LL;
          }

          _Block_object_dispose(&v11, 8);
        }
      }

      return v7;
    }
  }

  else if (MBXpcConnection)
  {
    goto LABEL_5;
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
    BTAccessoryManagerRemoveCallbacks_cold_1();
  }
  return 1LL;
}

void __BTLocalDeviceAddCallbacks_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceAddCallbacks_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceRemoveCallbacks(uint64_t a1, void *a2)
{
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTLocalDeviceRemoveCallbacks_cold_2();
    if (MBXpcConnection)
    {
LABEL_5:
      uint64_t CallbacksCBID = _localBTLocalDeviceGetCallbacksCBID(a1, a2);
      uint64_t v11 = 0LL;
      uint64_t v12 = &v11;
      uint64_t v13 = 0x2000000000LL;
      uint64_t v14 = 3LL;
      if (CallbacksCBID)
      {
        uint64_t v6 = CallbacksCBID;
        _localBTLocalDeviceRemoveCallbacks(a1, a2);
        removeXpcMsgHandler(MBXpcConnection, (uint64_t)&localDeviceXpcCallbacks);
        xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
        xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
        xpc_dictionary_set_uint64(v7, "kCBMsgArgID", v6);
        v10[0] = MEMORY[0x1895F87A8];
        v10[1] = 0x40000000LL;
        v10[2] = __BTLocalDeviceRemoveCallbacks_block_invoke;
        v10[3] = &unk_189FE7F18;
        v10[4] = &v11;
        sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdLocalDeviceRemoveCallbacksMsg", v7, (uint64_t)v10);
        if (v7) {
          xpc_release(v7);
        }
      }

      uint64_t v8 = *((unsigned int *)v12 + 6);
      _Block_object_dispose(&v11, 8);
      return v8;
    }
  }

  else if (MBXpcConnection)
  {
    goto LABEL_5;
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
    BTAccessoryManagerRemoveCallbacks_cold_1();
  }
  return 1LL;
}

void __BTLocalDeviceRemoveCallbacks_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceRemoveCallbacks_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceMaskCallbacks(uint64_t a1, unsigned int a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTLocalDeviceMaskCallbacks_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgLocalDeviceEventMask", a2);
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    uint64_t v13 = 0LL;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTLocalDeviceMaskCallbacks_block_invoke;
    v9[3] = &unk_189FE7F40;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdLocalDeviceMaskCallbacks", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    uint64_t v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRemoveCallbacks_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTLocalDeviceMaskCallbacks_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceMaskCallbacks_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceSetModulePower(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTLocalDeviceSetModulePower_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTPowerModule", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTPowerMode", a3);
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTLocalDeviceSetModulePower_block_invoke;
    v11[3] = &unk_189FE7F68;
    void v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdLocalDeviceSetModulePowerMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRemoveCallbacks_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTLocalDeviceSetModulePower_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceSetModulePower_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceGetModulePower(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTLocalDeviceGetModulePower_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTPowerModule", a2);
    uint64_t v16 = 0LL;
    __int16 v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTLocalDeviceGetModulePower_block_invoke;
    v11[3] = &unk_189FE7F90;
    void v11[4] = &v16;
    void v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdLocalDeviceGetModulePowerMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v17 + 6);
    if (!*((_DWORD *)v17 + 6)) {
      *a3 = v13[3];
    }
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRemoveCallbacks_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTLocalDeviceGetModulePower_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTPowerMode");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v4 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    int v7 = 134218240;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_log_impl( &dword_1870FD000,  v4,  OS_LOG_TYPE_DEFAULT,  "kCBMsgIdLocalDeviceGetModulePowerMsg reply with power state: %llx, result: %llx",  (uint8_t *)&v7,  0x16u);
  }

uint64_t BTLocalDeviceGetSpatialPlatformSupport(uint64_t a1, _DWORD *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTLocalDeviceGetModulePower_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgLocalDeviceID", a1);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    uint64_t v13 = 0LL;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTLocalDeviceGetSpatialPlatformSupport_block_invoke;
    v9[3] = &unk_189FE7FB8;
    v9[4] = &v14;
    void v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdLocalDeviceGetSpatialPlatformSupportMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    *a2 = v11[3];
    uint64_t v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRemoveCallbacks_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTLocalDeviceGetSpatialPlatformSupport_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgSpatialPlatformSupport");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceGetSpatialPlatformSupport_block_invoke_cold_1();
  }
}

uint64_t BTLocalDevicePowerReset(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v2 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a1;
    _os_log_debug_impl( &dword_1870FD000,  v2,  OS_LOG_TYPE_DEBUG,  "BTLocalDevicePowerReset over XPC localDevice:%llx",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v4 = MBXpcConnection;
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v5, "kCBMsgArgLocalDeviceID", a1);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v10 = 0x2000000000LL;
    uint64_t v11 = 0LL;
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 0x40000000LL;
    v8[2] = __BTLocalDevicePowerReset_block_invoke;
    v8[3] = &unk_189FE7FE0;
    v8[4] = &buf;
    sendMessageWithReplySync(v4, "kCBMsgIdLocalDevicePowerResetMsg", v5, (uint64_t)v8);
    if (v5) {
      xpc_release(v5);
    }
    uint64_t v6 = *(unsigned int *)(*((void *)&buf + 1) + 24LL);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRemoveCallbacks_cold_1();
    }
    return 1LL;
  }

  return v6;
}

void __BTLocalDevicePowerReset_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDevicePowerReset_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceGetPower(uint64_t a1, _DWORD *a2)
{
  return BTLocalDeviceGetModulePower(a1, 1u, a2);
}

uint64_t BTLocalDeviceGetAirplaneModeStatus(uint64_t a1, _DWORD *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v4 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a1;
    _os_log_debug_impl( &dword_1870FD000,  v4,  OS_LOG_TYPE_DEBUG,  "BTLocalDeviceGetAirplaneModeStatus over XPC localDevice:%llx",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v6 = MBXpcConnection;
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2000000000LL;
    uint64_t v14 = 0LL;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 0x40000000LL;
    v10[2] = __BTLocalDeviceGetAirplaneModeStatus_block_invoke;
    v10[3] = &unk_189FE8008;
    v10[4] = &buf;
    void v10[5] = &v11;
    sendMessageWithReplySync(v6, "kCBMsgIdLocalDeviceGetAirplaneModeStatusMsg", v7, (uint64_t)v10);
    if (v7) {
      xpc_release(v7);
    }
    *a2 = v12[3];
    uint64_t v8 = *(unsigned int *)(*((void *)&buf + 1) + 24LL);
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRemoveCallbacks_cold_1();
    }
    return 1LL;
  }

  return v8;
}

void __BTLocalDeviceGetAirplaneModeStatus_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgAirplaneMode");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceGetAirplaneModeStatus_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceGetAddressString(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTLocalDeviceGetAddressString_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBufferSize", a3);
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTLocalDeviceGetAddressString_block_invoke;
    v11[3] = &unk_189FE8030;
    void v11[4] = &v12;
    void v11[5] = a2;
    void v11[6] = a3;
    sendMessageWithReplySync(v7, "kCBMsgIdLocalDeviceGetAddressStringMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRemoveCallbacks_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTLocalDeviceGetAddressString_block_invoke(void *a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (!*(void *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    uint64_t v4 = (char *)a1[5];
    string = xpc_dictionary_get_string(xdict, "kCBMsgArgAddressString");
    strlcpy(v4, string, a1[6]);
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceGetAddressString_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceGetName(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTLocalDeviceGetName_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBufferSize", a3);
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTLocalDeviceGetName_block_invoke;
    v11[3] = &unk_189FE8058;
    void v11[4] = &v12;
    void v11[5] = a2;
    void v11[6] = a3;
    sendMessageWithReplySync(v7, "kCBMsgIdLocalDeviceGetNameMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRemoveCallbacks_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTLocalDeviceGetName_block_invoke(void *a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (!*(void *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    uint64_t v4 = (char *)a1[5];
    string = xpc_dictionary_get_string(xdict, "kCBMsgArgDeviceName");
    strlcpy(v4, string, a1[6]);
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceGetName_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceSetDiscoverable(uint64_t a1, unsigned int a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v4 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 134218240;
    *(void *)&uint8_t buf[4] = a1;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = (unsigned __int16)a2;
    _os_log_debug_impl( &dword_1870FD000,  v4,  OS_LOG_TYPE_DEBUG,  "BTLocalDeviceSetDiscoverable over XPC localDevice:%llx discoverable:%d",  buf,  0x12u);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v6 = MBXpcConnection;
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgDiscoverable", a2);
    *(void *)__int128 buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2000000000LL;
    uint64_t v12 = 0LL;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 0x40000000LL;
    v10[2] = __BTLocalDeviceSetDiscoverable_block_invoke;
    v10[3] = &unk_189FE8080;
    v10[4] = buf;
    sendMessageWithReplySync(v6, "kCBMsgIdLocalDeviceSetDiscoverableMsg", v7, (uint64_t)v10);
    if (v7) {
      xpc_release(v7);
    }
    uint64_t v8 = *(unsigned int *)(*(void *)&buf[8] + 24LL);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRemoveCallbacks_cold_1();
    }
    return 1LL;
  }

  return v8;
}

void __BTLocalDeviceSetDiscoverable_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceSetDiscoverable_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceGetDiscoverable(uint64_t a1, _DWORD *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v4 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a1;
    _os_log_debug_impl( &dword_1870FD000,  v4,  OS_LOG_TYPE_DEBUG,  "BTLocalDeviceGetDiscoverable over XPC localDevice:%llx",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v6 = MBXpcConnection;
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2000000000LL;
    uint64_t v14 = 0LL;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 0x40000000LL;
    v10[2] = __BTLocalDeviceGetDiscoverable_block_invoke;
    v10[3] = &unk_189FE80A8;
    v10[4] = &buf;
    void v10[5] = &v11;
    sendMessageWithReplySync(v6, "kCBMsgIdLocalDeviceGetDiscoverableMsg", v7, (uint64_t)v10);
    if (v7) {
      xpc_release(v7);
    }
    *a2 = v12[3];
    uint64_t v8 = *(unsigned int *)(*((void *)&buf + 1) + 24LL);
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRemoveCallbacks_cold_1();
    }
    return 1LL;
  }

  return v8;
}

void __BTLocalDeviceGetDiscoverable_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgDiscoverable");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceGetDiscoverable_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceSetConnectable(uint64_t a1, unsigned int a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v4 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 134218240;
    *(void *)&uint8_t buf[4] = a1;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = (unsigned __int16)a2;
    _os_log_debug_impl( &dword_1870FD000,  v4,  OS_LOG_TYPE_DEBUG,  "BTLocalDeviceSetConnectable over XPC localDevice:%llx connectable:%d",  buf,  0x12u);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v6 = MBXpcConnection;
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgConnectable", a2);
    *(void *)__int128 buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2000000000LL;
    uint64_t v12 = 0LL;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 0x40000000LL;
    v10[2] = __BTLocalDeviceSetConnectable_block_invoke;
    v10[3] = &unk_189FE80D0;
    v10[4] = buf;
    sendMessageWithReplySync(v6, "kCBMsgIdLocalDeviceSetConnectableMsg", v7, (uint64_t)v10);
    if (v7) {
      xpc_release(v7);
    }
    uint64_t v8 = *(unsigned int *)(*(void *)&buf[8] + 24LL);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRemoveCallbacks_cold_1();
    }
    return 1LL;
  }

  return v8;
}

void __BTLocalDeviceSetConnectable_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceSetConnectable_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceGetConnectable(uint64_t a1, _DWORD *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v4 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a1;
    _os_log_debug_impl( &dword_1870FD000,  v4,  OS_LOG_TYPE_DEBUG,  "BTLocalDeviceGetConnectable over XPC localDevice:%llx",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v6 = MBXpcConnection;
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2000000000LL;
    uint64_t v14 = 0LL;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 0x40000000LL;
    v10[2] = __BTLocalDeviceGetConnectable_block_invoke;
    v10[3] = &unk_189FE80F8;
    v10[4] = &buf;
    void v10[5] = &v11;
    sendMessageWithReplySync(v6, "kCBMsgIdLocalDeviceGetConnectableMsg", v7, (uint64_t)v10);
    if (v7) {
      xpc_release(v7);
    }
    *a2 = v12[3];
    uint64_t v8 = *(unsigned int *)(*((void *)&buf + 1) + 24LL);
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRemoveCallbacks_cold_1();
    }
    return 1LL;
  }

  return v8;
}

void __BTLocalDeviceGetConnectable_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgConnectable");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceGetConnectable_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceGetPairingStatus(uint64_t a1, _DWORD *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v4 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a1;
    _os_log_debug_impl( &dword_1870FD000,  v4,  OS_LOG_TYPE_DEBUG,  "BTLocalDeviceGetPairingStatus over XPC localDevice:%llx",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v6 = MBXpcConnection;
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2000000000LL;
    uint64_t v14 = 0LL;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 0x40000000LL;
    v10[2] = __BTLocalDeviceGetPairingStatus_block_invoke;
    v10[3] = &unk_189FE8120;
    v10[4] = &buf;
    void v10[5] = &v11;
    sendMessageWithReplySync(v6, "kCBMsgIdLocalDeviceGetPairingStatusMsg", v7, (uint64_t)v10);
    if (v7) {
      xpc_release(v7);
    }
    *a2 = v12[3];
    uint64_t v8 = *(unsigned int *)(*((void *)&buf + 1) + 24LL);
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRemoveCallbacks_cold_1();
    }
    return 1LL;
  }

  return v8;
}

void __BTLocalDeviceGetPairingStatus_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgPaired");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceGetPairingStatus_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceGetPairedDevices(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTLocalDeviceGetPairedDevices_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v10, "kCbMsgArgDeviceArrayMaxSize", a4);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTLocalDeviceGetPairedDevices_block_invoke;
    v13[3] = &unk_189FE8148;
    void v13[4] = &v14;
    void v13[5] = a4;
    void v13[6] = a2;
    void v13[7] = a3;
    sendMessageWithReplySync(v9, "kCBMsgIdLocalDeviceGetPairedDevicesMsg", v10, (uint64_t)v13);
    if (v10) {
      xpc_release(v10);
    }
    uint64_t v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerGetDevices_cold_1();
    }
    return 1LL;
  }

  return v11;
}

void __BTLocalDeviceGetPairedDevices_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    xpc_object_t value = xpc_dictionary_get_value(xdict, "kCBMsgArgDeviceArray");
    size_t count = xpc_array_get_count(value);
    if (count)
    {
      for (size_t i = 0LL; i != count; ++i)
      {
        if (i >= *(void *)(a1 + 40)) {
          break;
        }
        *(void *)(*(void *)(a1 + 48) + 8 * i) = xpc_array_get_uint64(value, i);
        if (MBFLogInitOnce != -1) {
          dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
        }
        xpc_object_t v7 = (os_log_s *)MBFLogComponent;
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8 * i);
          *(_DWORD *)__int128 buf = 134218240;
          size_t v10 = i;
          __int16 v11 = 2048;
          uint64_t v12 = v8;
          _os_log_debug_impl(&dword_1870FD000, v7, OS_LOG_TYPE_DEBUG, "i:%lx BTDevie:%llx", buf, 0x16u);
        }
      }
    }

    **(void **)(a1 + 56) = count;
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceGetPairedDevices_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceGetConnectionStatus(uint64_t a1, _DWORD *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v4 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a1;
    _os_log_debug_impl( &dword_1870FD000,  v4,  OS_LOG_TYPE_DEBUG,  "BTLocalDeviceGetConnectionStatus localDevice:%llx",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v6 = MBXpcConnection;
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2000000000LL;
    uint64_t v14 = 0LL;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 0x40000000LL;
    v10[2] = __BTLocalDeviceGetConnectionStatus_block_invoke;
    v10[3] = &unk_189FE8170;
    v10[4] = &buf;
    void v10[5] = &v11;
    sendMessageWithReplySync(v6, "kCBMsgIdLocalDeviceGetConnectionStatusMsg", v7, (uint64_t)v10);
    if (v7) {
      xpc_release(v7);
    }
    *a2 = v12[3];
    uint64_t v8 = *(unsigned int *)(*((void *)&buf + 1) + 24LL);
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRemoveCallbacks_cold_1();
    }
    return 1LL;
  }

  return v8;
}

void __BTLocalDeviceGetConnectionStatus_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgConnected");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceGetConnectionStatus_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceGetConnectedDevices(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTLocalDeviceGetConnectedDevices_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v10, "kCbMsgArgDeviceArrayMaxSize", a4);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTLocalDeviceGetConnectedDevices_block_invoke;
    v13[3] = &unk_189FE8198;
    void v13[4] = &v14;
    void v13[5] = a4;
    void v13[6] = a2;
    void v13[7] = a3;
    sendMessageWithReplySync(v9, "kCBMsgIdLocalDeviceGetConnectedDevicesMsg", v10, (uint64_t)v13);
    if (v10) {
      xpc_release(v10);
    }
    uint64_t v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerGetDevices_cold_1();
    }
    return 1LL;
  }

  return v11;
}

void __BTLocalDeviceGetConnectedDevices_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    xpc_object_t value = xpc_dictionary_get_value(xdict, "kCBMsgArgDeviceArray");
    size_t count = xpc_array_get_count(value);
    if (count)
    {
      for (size_t i = 0LL; i != count; ++i)
      {
        if (i >= *(void *)(a1 + 40)) {
          break;
        }
        *(void *)(*(void *)(a1 + 48) + 8 * i) = xpc_array_get_uint64(value, i);
        if (MBFLogInitOnce != -1) {
          dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
        }
        xpc_object_t v7 = (os_log_s *)MBFLogComponent;
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8 * i);
          *(_DWORD *)__int128 buf = 134218240;
          size_t v10 = i;
          __int16 v11 = 2048;
          uint64_t v12 = v8;
          _os_log_debug_impl(&dword_1870FD000, v7, OS_LOG_TYPE_DEBUG, "i:%lx BTDevie:%llx", buf, 0x16u);
        }
      }
    }

    **(void **)(a1 + 56) = count;
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceGetConnectedDevices_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceGetConnectingDevices(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTLocalDeviceGetConnectingDevices_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v10, "kCbMsgArgDeviceArrayMaxSize", a4);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTLocalDeviceGetConnectingDevices_block_invoke;
    v13[3] = &unk_189FE81C0;
    void v13[4] = &v14;
    void v13[5] = a4;
    void v13[6] = a2;
    void v13[7] = a3;
    sendMessageWithReplySync(v9, "kCBMsgIdLocalDeviceGetConnectingDevicesMsg", v10, (uint64_t)v13);
    if (v10) {
      xpc_release(v10);
    }
    uint64_t v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerGetDevices_cold_1();
    }
    return 1LL;
  }

  return v11;
}

void __BTLocalDeviceGetConnectingDevices_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    xpc_object_t value = xpc_dictionary_get_value(xdict, "kCBMsgArgDeviceArray");
    size_t count = xpc_array_get_count(value);
    if (count)
    {
      for (size_t i = 0LL; i != count; ++i)
      {
        if (i >= *(void *)(a1 + 40)) {
          break;
        }
        *(void *)(*(void *)(a1 + 48) + 8 * i) = xpc_array_get_uint64(value, i);
        if (MBFLogInitOnce != -1) {
          dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
        }
        xpc_object_t v7 = (os_log_s *)MBFLogComponent;
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8 * i);
          *(_DWORD *)__int128 buf = 134218240;
          size_t v10 = i;
          __int16 v11 = 2048;
          uint64_t v12 = v8;
          _os_log_debug_impl(&dword_1870FD000, v7, OS_LOG_TYPE_DEBUG, "i:%lx BTDevie:%llx", buf, 0x16u);
        }
      }
    }

    **(void **)(a1 + 56) = count;
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceGetConnectingDevices_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceGetAdvertisingStatus(uint64_t a1, _DWORD *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v4 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a1;
    _os_log_debug_impl( &dword_1870FD000,  v4,  OS_LOG_TYPE_DEBUG,  "BTLocalDeviceGetAdvertisingStatus over XPC localDevice:%llx",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v6 = MBXpcConnection;
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2000000000LL;
    uint64_t v14 = 0LL;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 0x40000000LL;
    v10[2] = __BTLocalDeviceGetAdvertisingStatus_block_invoke;
    v10[3] = &unk_189FE81E8;
    v10[4] = &buf;
    void v10[5] = &v11;
    sendMessageWithReplySync(v6, "kCBMsgIdLocalDeviceGetAdvertisingStatusMsg", v7, (uint64_t)v10);
    if (v7) {
      xpc_release(v7);
    }
    *a2 = v12[3];
    uint64_t v8 = *(unsigned int *)(*((void *)&buf + 1) + 24LL);
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRemoveCallbacks_cold_1();
    }
    return 1LL;
  }

  return v8;
}

void __BTLocalDeviceGetAdvertisingStatus_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgAdvertising");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceGetAdvertisingStatus_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceEnableDUTMode(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v2 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a1;
    _os_log_debug_impl( &dword_1870FD000,  v2,  OS_LOG_TYPE_DEBUG,  "BTLocalDeviceEnableDUTMode over XPC localDevice:%llx",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v4 = MBXpcConnection;
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v5, "kCBMsgArgLocalDeviceID", a1);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v10 = 0x2000000000LL;
    uint64_t v11 = 0LL;
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 0x40000000LL;
    v8[2] = __BTLocalDeviceEnableDUTMode_block_invoke;
    v8[3] = &unk_189FE8210;
    v8[4] = &buf;
    sendMessageWithReplySync(v4, "kCBMsgIdLocalDeviceEnableDUTModeMsg", v5, (uint64_t)v8);
    if (v5) {
      xpc_release(v5);
    }
    uint64_t v6 = *(unsigned int *)(*((void *)&buf + 1) + 24LL);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRemoveCallbacks_cold_1();
    }
    return 1LL;
  }

  return v6;
}

void __BTLocalDeviceEnableDUTMode_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceSetConnectable_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceGetScanning(uint64_t a1, _DWORD *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v4 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a1;
    _os_log_debug_impl( &dword_1870FD000,  v4,  OS_LOG_TYPE_DEBUG,  "BTLocalDeviceGetScanning over XPC localDevice:%llx",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v6 = MBXpcConnection;
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2000000000LL;
    uint64_t v14 = 0LL;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 0x40000000LL;
    v10[2] = __BTLocalDeviceGetScanning_block_invoke;
    v10[3] = &unk_189FE8238;
    v10[4] = &buf;
    void v10[5] = &v11;
    sendMessageWithReplySync(v6, "kCBMsgIdLocalDeviceGetScanningMsg", v7, (uint64_t)v10);
    if (v7) {
      xpc_release(v7);
    }
    *a2 = v12[3];
    uint64_t v8 = *(unsigned int *)(*((void *)&buf + 1) + 24LL);
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRemoveCallbacks_cold_1();
    }
    return 1LL;
  }

  return v8;
}

void __BTLocalDeviceGetScanning_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgScanning");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceGetScanning_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceGetDUTModeEnabled(uint64_t a1, _DWORD *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v4 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a1;
    _os_log_debug_impl( &dword_1870FD000,  v4,  OS_LOG_TYPE_DEBUG,  "BTLocalDeviceGetDUTModeEnabled over XPC localDevice:%llx",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v6 = MBXpcConnection;
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2000000000LL;
    uint64_t v14 = 0LL;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 0x40000000LL;
    v10[2] = __BTLocalDeviceGetDUTModeEnabled_block_invoke;
    v10[3] = &unk_189FE8260;
    v10[4] = &buf;
    void v10[5] = &v11;
    sendMessageWithReplySync(v6, "kCBMsgIdLocalDeviceGetDUTModeEnabledMsg", v7, (uint64_t)v10);
    if (v7) {
      xpc_release(v7);
    }
    *a2 = v12[3];
    uint64_t v8 = *(unsigned int *)(*((void *)&buf + 1) + 24LL);
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRemoveCallbacks_cold_1();
    }
    return 1LL;
  }

  return v8;
}

void __BTLocalDeviceGetDUTModeEnabled_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgDutModeEnabled");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceGetDUTModeEnabled_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceEnableLeTxTestMode(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v8 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 134218752;
    *(void *)&uint8_t buf[4] = a1;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a2;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = a3;
    LOWORD(v16) = 1024;
    *(_DWORD *)((char *)&v16 + 2) = a4;
    _os_log_debug_impl( &dword_1870FD000,  v8,  OS_LOG_TYPE_DEBUG,  "BTLocalDeviceEnableLeTxTestMode over XPC localDevice:%llx testFrequency:%d payloadSize:%d payload:%d",  buf,  0x1Eu);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v10 = MBXpcConnection;
    xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v11, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v11, "kCBMsgArgTestFrequency", a2);
    xpc_dictionary_set_uint64(v11, "kCBMsgArgPayloadSize", a3);
    xpc_dictionary_set_uint64(v11, "kCBMsgArgPayload", a4);
    *(void *)__int128 buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2000000000LL;
    uint64_t v16 = 0LL;
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 0x40000000LL;
    v14[2] = __BTLocalDeviceEnableLeTxTestMode_block_invoke;
    v14[3] = &unk_189FE8288;
    void v14[4] = buf;
    sendMessageWithReplySync(v10, "kCBMsgIdLocalDeviceEnableLeTxTestModeMsg", v11, (uint64_t)v14);
    if (v11) {
      xpc_release(v11);
    }
    uint64_t v12 = *(unsigned int *)(*(void *)&buf[8] + 24LL);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRemoveCallbacks_cold_1();
    }
    return 1LL;
  }

  return v12;
}

void __BTLocalDeviceEnableLeTxTestMode_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceEnableLeTxTestMode_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceEnableLeRxTestMode(uint64_t a1, unsigned int a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v4 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 134218240;
    *(void *)&uint8_t buf[4] = a1;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a2;
    _os_log_debug_impl( &dword_1870FD000,  v4,  OS_LOG_TYPE_DEBUG,  "BTLocalDeviceEnableLeTxTestMode over XPC localDevice:%llx testFrequency:%d",  buf,  0x12u);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v6 = MBXpcConnection;
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgTestFrequency", a2);
    *(void *)__int128 buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2000000000LL;
    uint64_t v12 = 0LL;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 0x40000000LL;
    v10[2] = __BTLocalDeviceEnableLeRxTestMode_block_invoke;
    v10[3] = &unk_189FE82B0;
    v10[4] = buf;
    sendMessageWithReplySync(v6, "kCBMsgIdLocalDeviceEnableLeRxTestModeMsg", v7, (uint64_t)v10);
    if (v7) {
      xpc_release(v7);
    }
    uint64_t v8 = *(unsigned int *)(*(void *)&buf[8] + 24LL);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRemoveCallbacks_cold_1();
    }
    return 1LL;
  }

  return v8;
}

void __BTLocalDeviceEnableLeRxTestMode_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceEnableLeRxTestMode_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceDisableLeTestMode(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v2 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a1;
    _os_log_debug_impl( &dword_1870FD000,  v2,  OS_LOG_TYPE_DEBUG,  "BTLocalDeviceDisableLeTestMode over XPC localDevice:%llx",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v4 = MBXpcConnection;
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v5, "kCBMsgArgLocalDeviceID", a1);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v10 = 0x2000000000LL;
    uint64_t v11 = 0LL;
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 0x40000000LL;
    v8[2] = __BTLocalDeviceDisableLeTestMode_block_invoke;
    v8[3] = &unk_189FE82D8;
    v8[4] = &buf;
    sendMessageWithReplySync(v4, "kCBMsgIdLocalDeviceDisableLeTestModeMsg", v5, (uint64_t)v8);
    if (v5) {
      xpc_release(v5);
    }
    uint64_t v6 = *(unsigned int *)(*((void *)&buf + 1) + 24LL);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRemoveCallbacks_cold_1();
    }
    return 1LL;
  }

  return v6;
}

void __BTLocalDeviceDisableLeTestMode_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceDisableLeTestMode_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceSupportsService(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v6 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 134218240;
    *(void *)&uint8_t buf[4] = a1;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a2;
    _os_log_debug_impl( &dword_1870FD000,  v6,  OS_LOG_TYPE_DEBUG,  "BTLocalDeviceSupportsService over XPC localDevice:%llx service:%d",  buf,  0x12u);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v8 = MBXpcConnection;
    xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgServices", a2);
    *(void *)__int128 buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2000000000LL;
    uint64_t v18 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2000000000LL;
    uint64_t v16 = 0LL;
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 0x40000000LL;
    v12[2] = __BTLocalDeviceSupportsService_block_invoke;
    v12[3] = &unk_189FE8300;
    void v12[4] = buf;
    void v12[5] = &v13;
    sendMessageWithReplySync(v8, "kCBMsgIdLocalDeviceSupportsServiceMsg", v9, (uint64_t)v12);
    if (v9) {
      xpc_release(v9);
    }
    *a3 = v14[3];
    uint64_t v10 = *(unsigned int *)(*(void *)&buf[8] + 24LL);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRemoveCallbacks_cold_1();
    }
    return 1LL;
  }

  return v10;
}

void __BTLocalDeviceSupportsService_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgServiceSuppored");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceSupportsService_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceAdvertiseData(uint64_t a1, const void *a2, size_t a3, const void *a4, size_t a5)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v5 = 3LL;
  if (a5 && a3 && a2 && a4)
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    uint64_t v11 = (os_log_s *)MBFLogComponent;
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = a1;
      _os_log_debug_impl( &dword_1870FD000,  v11,  OS_LOG_TYPE_DEBUG,  "BTLocalDeviceAdvertiseData over XPC localDevice:%llx",  (uint8_t *)&buf,  0xCu);
    }

    uint64_t MBXpcConnection = getMBXpcConnection(a1);
    if (MBXpcConnection)
    {
      uint64_t v13 = MBXpcConnection;
      xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_uint64(v14, "kCBMsgArgLocalDeviceID", a1);
      xpc_dictionary_set_data(v14, "kCBMsgArgKey", a2, a3);
      xpc_dictionary_set_data(v14, "kCBMsgArgValue", a4, a5);
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v18 = 0x2000000000LL;
      uint64_t v19 = 0LL;
      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 0x40000000LL;
      v16[2] = __BTLocalDeviceAdvertiseData_block_invoke;
      v16[3] = &unk_189FE8328;
      void v16[4] = &buf;
      sendMessageWithReplySync(v13, "kCBMsgIdLocalDeviceAdvertiseDataMsg", v14, (uint64_t)v16);
      if (v14) {
        xpc_release(v14);
      }
      uint64_t v5 = *(unsigned int *)(*((void *)&buf + 1) + 24LL);
      _Block_object_dispose(&buf, 8);
    }

    else
    {
      if (MBFLogInitOnce != -1) {
        dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
      }
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
        BTLocalDeviceAdvertiseData_cold_1();
      }
      return 1LL;
    }
  }

  return v5;
}

void __BTLocalDeviceAdvertiseData_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceAdvertiseData_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceRemoveData(uint64_t a1, const void *a2, size_t a3, const void *a4, size_t a5)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v5 = 3LL;
  if (a5 && a3 && a2 && a4)
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    uint64_t v11 = (os_log_s *)MBFLogComponent;
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = a1;
      _os_log_debug_impl( &dword_1870FD000,  v11,  OS_LOG_TYPE_DEBUG,  "BTLocalDeviceRemoveData over XPC localDevice:%llx",  (uint8_t *)&buf,  0xCu);
    }

    uint64_t MBXpcConnection = getMBXpcConnection(a1);
    if (MBXpcConnection)
    {
      uint64_t v13 = MBXpcConnection;
      xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_uint64(v14, "kCBMsgArgLocalDeviceID", a1);
      xpc_dictionary_set_data(v14, "kCBMsgArgKey", a2, a3);
      xpc_dictionary_set_data(v14, "kCBMsgArgValue", a4, a5);
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v18 = 0x2000000000LL;
      uint64_t v19 = 0LL;
      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 0x40000000LL;
      v16[2] = __BTLocalDeviceRemoveData_block_invoke;
      v16[3] = &unk_189FE8350;
      void v16[4] = &buf;
      sendMessageWithReplySync(v13, "kCBMsgIdLocalDeviceRemoveDataMsg", v14, (uint64_t)v16);
      if (v14) {
        xpc_release(v14);
      }
      uint64_t v5 = *(unsigned int *)(*((void *)&buf + 1) + 24LL);
      _Block_object_dispose(&buf, 8);
    }

    else
    {
      if (MBFLogInitOnce != -1) {
        dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
      }
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
        BTLocalDeviceAdvertiseData_cold_1();
      }
      return 1LL;
    }
  }

  return v5;
}

void __BTLocalDeviceRemoveData_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceRemoveData_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceRegisterForPowerUpdates(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTLocalDeviceRegisterForPowerUpdates_cold_4();
    if (MBXpcConnection)
    {
LABEL_5:
      addXpcMsgHandler(MBXpcConnection, (uint64_t)&localDeviceXpcCallbacks);
      if (_localBTLocalDeviceStatsCallbacksRegistered(a1, a2))
      {
        if (MBFLogInitOnce != -1) {
          dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
        }
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
          BTAccessoryManagerAddCallbacks_cold_2();
        }
        return 0LL;
      }

      else
      {
        uint64_t value = 0LL;
        if (_localBTLocalDeviceAddStatsCallbacks(a1, MBXpcConnection, a2, a3, (uint64_t *)&value))
        {
          if (MBFLogInitOnce != -1) {
            dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
          }
          if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
            BTDiscoveryAgentCreate_cold_3();
          }
          return 4LL;
        }

        else
        {
          xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
          xpc_dictionary_set_uint64(v8, "kCBMsgArgLocalDeviceID", a1);
          xpc_dictionary_set_uint64(v8, "kCBMsgArgID", value);
          uint64_t v11 = 0LL;
          uint64_t v12 = &v11;
          uint64_t v13 = 0x2000000000LL;
          uint64_t v14 = 0LL;
          v10[0] = MEMORY[0x1895F87A8];
          v10[1] = 0x40000000LL;
          v10[2] = __BTLocalDeviceRegisterForPowerUpdates_block_invoke;
          v10[3] = &unk_189FE8378;
          v10[4] = &v11;
          sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdLocalDeviceRegisterForPowerUpdatesMsg", v8, (uint64_t)v10);
          if (v8) {
            xpc_release(v8);
          }
          if (v12[3])
          {
            _localBTLocalDeviceRemoveStatsCallbacks(a1);
            uint64_t v7 = *((unsigned int *)v12 + 6);
          }

          else
          {
            uint64_t v7 = 0LL;
          }

          _Block_object_dispose(&v11, 8);
        }
      }

      return v7;
    }
  }

  else if (MBXpcConnection)
  {
    goto LABEL_5;
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
    BTAccessoryManagerRemoveCallbacks_cold_1();
  }
  return 1LL;
}

void __BTLocalDeviceRegisterForPowerUpdates_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceRegisterForPowerUpdates_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceUnregisterForPowerUpdates(uint64_t a1)
{
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTLocalDeviceUnregisterForPowerUpdates_cold_2();
    if (MBXpcConnection) {
      goto LABEL_5;
    }
  }

  else if (MBXpcConnection)
  {
LABEL_5:
    _localBTLocalDeviceRemoveStatsCallbacks(a1);
    removeXpcMsgHandler(MBXpcConnection, (uint64_t)&localDeviceXpcCallbacks);
    xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v3, "kCBMsgArgLocalDeviceID", a1);
    uint64_t v7 = 0LL;
    xpc_object_t v8 = &v7;
    uint64_t v9 = 0x2000000000LL;
    uint64_t v10 = 0LL;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 0x40000000LL;
    v6[2] = __BTLocalDeviceUnregisterForPowerUpdates_block_invoke;
    void v6[3] = &unk_189FE83A0;
    void v6[4] = &v7;
    sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdLocalDeviceUnregisterForPowerUpdatesMsg", v3, (uint64_t)v6);
    if (v3) {
      xpc_release(v3);
    }
    uint64_t v4 = *((unsigned int *)v8 + 6);
    _Block_object_dispose(&v7, 8);
    return v4;
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
    BTAccessoryManagerRemoveCallbacks_cold_1();
  }
  return 1LL;
}

void __BTLocalDeviceUnregisterForPowerUpdates_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceUnregisterForPowerUpdates_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceReadPowerConsumption(uint64_t a1, _DWORD *a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v4 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a1;
    _os_log_debug_impl( &dword_1870FD000,  v4,  OS_LOG_TYPE_DEBUG,  "BTLocalDeviceReadPowerConsumption device:%llx",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTLocalDeviceReadPowerConsumption_cold_2();
    if (MBXpcConnection) {
      goto LABEL_9;
    }
  }

  else if (MBXpcConnection)
  {
LABEL_9:
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgLocalDeviceID", a1);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v15 = 0x2000000000LL;
    uint64_t v16 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    uint64_t v13 = 0LL;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTLocalDeviceReadPowerConsumption_block_invoke;
    v9[3] = &unk_189FE83C8;
    v9[4] = &buf;
    void v9[5] = &v10;
    sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdLocalDeviceReadPowerConsumptionMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    *a2 = v11[3];
    uint64_t v7 = *(unsigned int *)(*((void *)&buf + 1) + 24LL);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&buf, 8);
    return v7;
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
    BTAccessoryManagerRemoveCallbacks_cold_1();
  }
  return 1LL;
}

void __BTLocalDeviceReadPowerConsumption_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgPowerConsumed");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceReadPowerConsumption_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceRegisterForPowerProfileStatistics(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTLocalDeviceRegisterForPowerProfileStatistics_cold_4();
    if (MBXpcConnection)
    {
LABEL_5:
      addXpcMsgHandler(MBXpcConnection, (uint64_t)&localDeviceXpcCallbacks);
      if (_localBTLocalDeviceStatsCallbacksRegistered(a1, a2))
      {
        if (MBFLogInitOnce != -1) {
          dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
        }
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
          BTAccessoryManagerAddCallbacks_cold_2();
        }
        return 0LL;
      }

      else
      {
        uint64_t value = 0LL;
        if (_localBTLocalDeviceAddStatsCallbacks(a1, MBXpcConnection, a2, a3, (uint64_t *)&value))
        {
          if (MBFLogInitOnce != -1) {
            dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
          }
          if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
            BTDiscoveryAgentCreate_cold_3();
          }
          return 4LL;
        }

        else
        {
          xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
          xpc_dictionary_set_uint64(v8, "kCBMsgArgLocalDeviceID", a1);
          xpc_dictionary_set_uint64(v8, "kCBMsgArgID", value);
          uint64_t v11 = 0LL;
          uint64_t v12 = &v11;
          uint64_t v13 = 0x2000000000LL;
          uint64_t v14 = 0LL;
          v10[0] = MEMORY[0x1895F87A8];
          v10[1] = 0x40000000LL;
          v10[2] = __BTLocalDeviceRegisterForPowerProfileStatistics_block_invoke;
          v10[3] = &unk_189FE83F0;
          v10[4] = &v11;
          sendMessageWithReplySync( MBXpcConnection,  "kCBMsgIdLocalDeviceRegisterForPowerProfileStatisticsMsg",  v8,  (uint64_t)v10);
          if (v8) {
            xpc_release(v8);
          }
          if (v12[3])
          {
            _localBTLocalDeviceRemoveStatsCallbacks(a1);
            uint64_t v7 = *((unsigned int *)v12 + 6);
          }

          else
          {
            uint64_t v7 = 0LL;
          }

          _Block_object_dispose(&v11, 8);
        }
      }

      return v7;
    }
  }

  else if (MBXpcConnection)
  {
    goto LABEL_5;
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
    BTAccessoryManagerRemoveCallbacks_cold_1();
  }
  return 1LL;
}

void __BTLocalDeviceRegisterForPowerProfileStatistics_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceRegisterForPowerProfileStatistics_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceUnregisterForPowerProfileStatistics(uint64_t a1)
{
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTLocalDeviceUnregisterForPowerProfileStatistics_cold_2();
    if (MBXpcConnection) {
      goto LABEL_5;
    }
  }

  else if (MBXpcConnection)
  {
LABEL_5:
    _localBTLocalDeviceRemoveStatsCallbacks(a1);
    removeXpcMsgHandler(MBXpcConnection, (uint64_t)&localDeviceXpcCallbacks);
    xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v3, "kCBMsgArgLocalDeviceID", a1);
    uint64_t v7 = 0LL;
    xpc_object_t v8 = &v7;
    uint64_t v9 = 0x2000000000LL;
    uint64_t v10 = 0LL;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 0x40000000LL;
    v6[2] = __BTLocalDeviceUnregisterForPowerProfileStatistics_block_invoke;
    void v6[3] = &unk_189FE8418;
    void v6[4] = &v7;
    sendMessageWithReplySync( MBXpcConnection,  "kCBMsgIdLocalDeviceUnregisterForPowerProfileStatisticsMsg",  v3,  (uint64_t)v6);
    if (v3) {
      xpc_release(v3);
    }
    uint64_t v4 = *((unsigned int *)v8 + 6);
    _Block_object_dispose(&v7, 8);
    return v4;
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
    BTAccessoryManagerRemoveCallbacks_cold_1();
  }
  return 1LL;
}

void __BTLocalDeviceUnregisterForPowerProfileStatistics_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceUnregisterForPowerProfileStatistics_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceReadPowerProfileStatistics( uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTLocalDeviceReadPowerProfileStatistics_cold_2();
    if (MBXpcConnection) {
      goto LABEL_5;
    }
  }

  else if (MBXpcConnection)
  {
LABEL_5:
    xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v13, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v13, "kCBMsgArgReset", a2);
    uint64_t v17 = 0LL;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2000000000LL;
    uint64_t v20 = 0LL;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 0x40000000LL;
    v16[2] = __BTLocalDeviceReadPowerProfileStatistics_block_invoke;
    v16[3] = &unk_189FE8440;
    void v16[4] = &v17;
    void v16[5] = a3;
    void v16[6] = a4;
    void v16[7] = a5;
    void v16[8] = a6;
    sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdLocalDeviceReadPowerProfileStatisticsMsg", v13, (uint64_t)v16);
    if (v13) {
      xpc_release(v13);
    }
    uint64_t v14 = *((unsigned int *)v18 + 6);
    _Block_object_dispose(&v17, 8);
    return v14;
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
    BTAccessoryManagerGetDevices_cold_1();
  }
  return 1LL;
}

void __BTLocalDeviceReadPowerProfileStatistics_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  uint64_t v5 = *(void *)(a1 + 32);
  a1 += 32LL;
  *(void *)(*(void *)(v5 + 8) + 24LL) = uint64;
  **(_WORD **)(a1 + 8) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsTransmitting");
  **(_WORD **)(a1 + 16) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsReceiving");
  **(_WORD **)(a1 + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsSleep");
  **(_WORD **)(a1 + 32) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsOthers");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceReadPowerProfileStatistics_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceReadEnhancedPowerProfileStatistics(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTLocalDeviceReadEnhancedPowerProfileStatistics_cold_2();
    if (MBXpcConnection) {
      goto LABEL_5;
    }
  }

  else if (MBXpcConnection)
  {
LABEL_5:
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgReset", a2);
    uint64_t v11 = 0LL;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2000000000LL;
    uint64_t v14 = 0LL;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 0x40000000LL;
    v10[2] = __BTLocalDeviceReadEnhancedPowerProfileStatistics_block_invoke;
    v10[3] = &unk_189FE8468;
    v10[4] = &v11;
    void v10[5] = a3;
    sendMessageWithReplySync( MBXpcConnection,  "kCBMsgIdLocalDeviceReadEnhancedPowerProfileStatisticsMsg",  v7,  (uint64_t)v10);
    if (v7) {
      xpc_release(v7);
    }
    uint64_t v8 = *((unsigned int *)v12 + 6);
    _Block_object_dispose(&v11, 8);
    return v8;
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
    BTAccessoryManagerGetDevices_cold_1();
  }
  return 1LL;
}

void __BTLocalDeviceReadEnhancedPowerProfileStatistics_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v4 = a1 + 32;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  size_t length = 0LL;
  data = xpc_dictionary_get_data(xdict, "kCBMsgArgData", &length);
  if (length == 248)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    __int128 v7 = *data;
    __int128 v8 = data[1];
    __int128 v9 = data[3];
    *(_OWORD *)(v6 + 32) = data[2];
    *(_OWORD *)(v6 + 48) = v9;
    *(_OWORD *)uint64_t v6 = v7;
    *(_OWORD *)(v6 + 16) = v8;
    __int128 v10 = data[4];
    __int128 v11 = data[5];
    __int128 v12 = data[7];
    *(_OWORD *)(v6 + 96) = data[6];
    *(_OWORD *)(v6 + 112) = v12;
    *(_OWORD *)(v6 + 64) = v10;
    *(_OWORD *)(v6 + 80) = v11;
    __int128 v13 = data[8];
    __int128 v14 = data[9];
    __int128 v15 = data[11];
    *(_OWORD *)(v6 + 160) = data[10];
    *(_OWORD *)(v6 + 176) = v15;
    *(_OWORD *)(v6 + 128) = v13;
    *(_OWORD *)(v6 + 144) = v14;
    __int128 v16 = data[12];
    __int128 v17 = data[13];
    __int128 v18 = data[14];
    *(void *)(v6 + 240) = *((void *)data + 30);
    *(_OWORD *)(v6 + 208) = v17;
    *(_OWORD *)(v6 + 224) = v18;
    *(_OWORD *)(v6 + 192) = v16;
  }

  else
  {
    *(void *)(*(void *)(*(void *)v4 + 8LL) + 24LL) = 3LL;
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceReadEnhancedPowerProfileStatistics_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceReadTransportSwitchStatistics( uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTLocalDeviceReadTransportSwitchStatistics_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v13 = MBXpcConnection;
    xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgReset", a2);
    uint64_t v18 = 0LL;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2000000000LL;
    uint64_t v21 = 0LL;
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 0x40000000LL;
    v17[2] = __BTLocalDeviceReadTransportSwitchStatistics_block_invoke;
    v17[3] = &unk_189FE8490;
    v17[4] = &v18;
    void v17[5] = a3;
    void v17[6] = a4;
    v17[7] = a5;
    v17[8] = a6;
    sendMessageWithReplySync(v13, "kCBMsgIdLocalDeviceReadTransportSwitchStatisticsMsg", v14, (uint64_t)v17);
    if (v14) {
      xpc_release(v14);
    }
    uint64_t v15 = *((unsigned int *)v19 + 6);
    _Block_object_dispose(&v18, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerGetDevices_cold_1();
    }
    return 1LL;
  }

  return v15;
}

void __BTLocalDeviceReadTransportSwitchStatistics_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  uint64_t v5 = *(void *)(a1 + 32);
  a1 += 32LL;
  *(void *)(*(void *)(v5 + 8) + 24LL) = uint64;
  **(_DWORD **)(a1 + 8) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsTotal");
  **(_DWORD **)(a1 + 16) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsSuccesful");
  **(_DWORD **)(a1 + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsDowngraded");
  **(_DWORD **)(a1 + 32) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsInvolundaryDowngraded");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceReadTransportSwitchStatistics_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceReadDetailedPowerProfileStatistics( uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTLocalDeviceReadDetailedPowerProfileStatistics_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v24 = MBXpcConnection;
    uint64_t v25 = a4;
    xpc_object_t v26 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v26, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v26, "kCBMsgArgReset", a2);
    uint64_t v31 = 0LL;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x2000000000LL;
    uint64_t v34 = 0LL;
    v30[0] = MEMORY[0x1895F87A8];
    v30[1] = 0x40000000LL;
    v30[2] = __BTLocalDeviceReadDetailedPowerProfileStatistics_block_invoke;
    v30[3] = &unk_189FE84B8;
    v30[4] = &v31;
    v30[5] = a3;
    v30[6] = v25;
    v30[7] = a5;
    v30[8] = a6;
    v30[9] = a7;
    v30[10] = a8;
    v30[11] = a9;
    v30[12] = a10;
    v30[13] = a11;
    v30[14] = a12;
    v30[15] = a13;
    v30[16] = a14;
    v30[17] = a15;
    v30[18] = a16;
    sendMessageWithReplySync(v24, "kCBMsgIdLocalDeviceReadDetailedPowerProfileStatisticsMsg", v26, (uint64_t)v30);
    if (v26) {
      xpc_release(v26);
    }
    uint64_t v27 = *((unsigned int *)v32 + 6);
    _Block_object_dispose(&v31, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerGetDevices_cold_1();
    }
    return 1LL;
  }

  return v27;
}

void __BTLocalDeviceReadDetailedPowerProfileStatistics_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  uint64_t v5 = *(void *)(a1 + 32);
  a1 += 32LL;
  *(void *)(*(void *)(v5 + 8) + 24LL) = uint64;
  **(_DWORD **)(a1 + 8) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsDurationTotal");
  **(_DWORD **)(a1 + 16) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsDurationActive");
  **(_DWORD **)(a1 + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsDurationIdle");
  **(_DWORD **)(a1 + 32) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsDurationSleep");
  **(_DWORD **)(a1 + 40) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsDisableCounter");
  **(_DWORD **)(a1 + 48) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsiPATxBT");
  **(_DWORD **)(a1 + 56) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsePATxBT");
  **(_DWORD **)(a1 + 64) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsiPATxLE");
  **(_DWORD **)(a1 + 72) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsePATxLE");
  **(_DWORD **)(a1 + 80) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsConnectedRxBT");
  **(_DWORD **)(a1 + 88) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsConnectedRxLE");
  **(_DWORD **)(a1 + 96) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsScanRxBT");
  **(_DWORD **)(a1 + 104) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsScanRxLE");
  **(_DWORD **)(a1 + 112) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatsTotalPHYCal");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceReadDetailedPowerProfileStatistics_block_invoke_cold_1();
  }
}

uint64_t BTStartHCITraces(uint64_t a1)
{
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTStartHCITraces_cold_2();
    if (MBXpcConnection) {
      goto LABEL_5;
    }
  }

  else if (MBXpcConnection)
  {
LABEL_5:
    xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v3, "kCBMsgArgLocalDeviceID", a1);
    uint64_t v7 = 0LL;
    __int128 v8 = &v7;
    uint64_t v9 = 0x2000000000LL;
    uint64_t v10 = 0LL;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 0x40000000LL;
    v6[2] = __BTStartHCITraces_block_invoke;
    void v6[3] = &unk_189FE84E0;
    void v6[4] = &v7;
    sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdLocalDeviceStartHCITracesMsg", v3, (uint64_t)v6);
    if (v3) {
      xpc_release(v3);
    }
    uint64_t v4 = *((unsigned int *)v8 + 6);
    _Block_object_dispose(&v7, 8);
    return v4;
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
    BTAccessoryManagerGetDevices_cold_1();
  }
  return 1LL;
}

void __BTStartHCITraces_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTStartHCITraces_block_invoke_cold_1();
  }
}

uint64_t BTStopHCITraces(uint64_t a1, const char *a2, const char *a3, uint64_t a4, uint64_t a5)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTStopHCITraces_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v11 = MBXpcConnection;
    xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_string(v12, "kCBMsgArgPath", a2);
    xpc_dictionary_set_string(v12, "kCBMsgArgExtensionToken", a3);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBufferSize", a5);
    uint64_t v16 = 0LL;
    __int128 v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 0x40000000LL;
    v15[2] = __BTStopHCITraces_block_invoke;
    v15[3] = &unk_189FE8508;
    v15[4] = &v16;
    void v15[5] = a4;
    void v15[6] = a5;
    sendMessageWithReplySync(v11, "kCBMsgIdLocalDeviceStopHCITracesMsg", v12, (uint64_t)v15);
    if (v12) {
      xpc_release(v12);
    }
    uint64_t v13 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerGetDevices_cold_1();
    }
    return 1LL;
  }

  return v13;
}

void __BTStopHCITraces_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    string = xpc_dictionary_get_string(xdict, "kCBMsgArgName");
    if (string) {
      strlcpy(*(char **)(a1 + 40), string, *(void *)(a1 + 48));
    }
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTStopHCITraces_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceShowPowerPrompt(uint64_t a1, const char *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTLocalDeviceShowPowerPrompt_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_string(v6, "kCBMsgArgBundleIdString", a2);
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    uint64_t v13 = 0LL;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTLocalDeviceShowPowerPrompt_block_invoke;
    v9[3] = &unk_189FE8530;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdLocalDeviceShowPowerPromptMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    uint64_t v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerGetDevices_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTLocalDeviceShowPowerPrompt_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceShowPowerPrompt_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceSetAFHMap(uint64_t a1, const void *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTLocalDeviceSetAFHMap_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_data(v6, "kCBMsgArgData", a2, 0xAuLL);
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    uint64_t v13 = 0LL;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTLocalDeviceSetAFHMap_block_invoke;
    v9[3] = &unk_189FE8558;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdLocalDeviceSetAFHMapMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    uint64_t v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerGetDevices_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTLocalDeviceSetAFHMap_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceSetAFHMap_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceReadAFHMap(uint64_t a1, uint64_t a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTLocalDeviceReadAFHMap_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a2);
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    uint64_t v13 = 0LL;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTLocalDeviceReadAFHMap_block_invoke;
    v9[3] = &unk_189FE8580;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdLocalDeviceReadAFHMapMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    uint64_t v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerGetDevices_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTLocalDeviceReadAFHMap_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceReadAFHMap_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceSetDelayedWake(unsigned int a1)
{
  Firstuint64_t SessionHandle = getFirstSessionHandle();
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTLocalDeviceSetDelayedWake_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(FirstSessionHandle);
  if (MBXpcConnection)
  {
    uint64_t v4 = MBXpcConnection;
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v5, "kCBMsgArgDelay", a1);
    uint64_t v9 = 0LL;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2000000000LL;
    uint64_t v12 = 0LL;
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 0x40000000LL;
    v8[2] = __BTLocalDeviceSetDelayedWake_block_invoke;
    v8[3] = &unk_189FE85A8;
    v8[4] = &v9;
    sendMessageWithReplySync(v4, "kCBMsgIdLocalDeviceSetDelayedWakeMsg", v5, (uint64_t)v8);
    if (v5) {
      xpc_release(v5);
    }
    uint64_t v6 = *((unsigned int *)v10 + 6);
    _Block_object_dispose(&v9, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceAddressToString_cold_1();
    }
    return 1LL;
  }

  return v6;
}

void __BTLocalDeviceSetDelayedWake_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceSetDelayedWake_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceSetDenylistEnabled(uint64_t a1, unsigned int a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTLocalDeviceSetDenylistEnabled_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBool", a2);
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    uint64_t v13 = 0LL;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTLocalDeviceSetDenylistEnabled_block_invoke;
    v9[3] = &unk_189FE85D0;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdLocalDeviceSetDenylistEnabledMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    uint64_t v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTLocalDeviceSetDenylistEnabled_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTLocalDeviceSetDenylistEnabled_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceSetDenylistEnabled_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceGetDenylistEnabled(uint64_t a1, _DWORD *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTLocalDeviceGetDenylistEnabled_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgLocalDeviceID", a1);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    int v13 = 0;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTLocalDeviceGetDenylistEnabled_block_invoke;
    v9[3] = &unk_189FE85F8;
    v9[4] = &v14;
    void v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdLocalDeviceGetDenylistEnabledMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    *a2 = *((_DWORD *)v11 + 6);
    uint64_t v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTLocalDeviceSetDenylistEnabled_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTLocalDeviceGetDenylistEnabled_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBool");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceGetDenylistEnabled_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceGetDeviceNamesThatMayBeDenylisted(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTLocalDeviceGetDeviceNamesThatMayBeDenylisted_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v10, "kCbMsgArgDeviceArrayMaxSize", a4);
    uint64_t v15 = 0LL;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2000000000LL;
    uint64_t v18 = 0LL;
    v14[0] = 0LL;
    v14[1] = v14;
    v14[2] = 0x2000000000LL;
    v14[3] = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTLocalDeviceGetDeviceNamesThatMayBeDenylisted_block_invoke;
    v13[3] = &unk_189FE8620;
    void v13[4] = &v15;
    void v13[5] = v14;
    void v13[6] = a4;
    void v13[7] = a2;
    void v13[8] = a3;
    sendMessageWithReplySync(v9, "kCBMsgIdLocalDeviceGetDeviceNamesThatMayBeDenylistedMsg", v10, (uint64_t)v13);
    if (v10) {
      xpc_release(v10);
    }
    uint64_t v11 = *((unsigned int *)v16 + 6);
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(&v15, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTLocalDeviceSetDenylistEnabled_cold_1();
    }
    return 1LL;
  }

  return v11;
}

void __BTLocalDeviceGetDeviceNamesThatMayBeDenylisted_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kCBMsgArgDeviceArray");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_array_get_count(value);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    uint64_t v5 = 0LL;
    size_t v6 = 0LL;
    do
    {
      if (*(void *)(a1 + 48) <= v6) {
        break;
      }
      uint64_t v7 = (char *)(*(void *)(a1 + 56) + v5);
      string = xpc_array_get_string(value, v6);
      strlcpy(v7, string, 0xF8uLL);
      ++v6;
      v5 += 248LL;
    }

    while (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) > v6);
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceGetDeviceNamesThatMayBeDenylisted_block_invoke_cold_1();
  }
  unint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (v9 >= *(void *)(a1 + 48)) {
    unint64_t v9 = *(void *)(a1 + 48);
  }
  **(void **)(a1 + 64) = v9;
}

uint64_t BTLocalDeviceGetSharingAddresses(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTLocalDeviceGetSharingAddresses_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v9 = MBXpcConnection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v10, "kCbMsgArgDeviceArrayMaxSize", a4);
    uint64_t v18 = 0LL;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2000000000LL;
    uint64_t v21 = 0LL;
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = __BTLocalDeviceGetSharingAddresses_block_invoke;
    v13[3] = &unk_189FE8648;
    void v13[4] = &v18;
    void v13[5] = &v14;
    void v13[6] = a4;
    void v13[7] = a2;
    sendMessageWithReplySync(v9, "kCBMsgIdLocalDeviceGetSharingAddressesMsg", v10, (uint64_t)v13);
    *a3 = v15[3];
    if (v10) {
      xpc_release(v10);
    }
    uint64_t v11 = *((unsigned int *)v19 + 6);
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTLocalDeviceSetDenylistEnabled_cold_1();
    }
    return 1LL;
  }

  return v11;
}

void __BTLocalDeviceGetSharingAddresses_block_invoke(void *a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kCBMsgArgDeviceArray");
  *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = xpc_array_get_count(value);
  if (*(void *)(*(void *)(a1[5] + 8LL) + 24LL))
  {
    uint64_t v5 = 0LL;
    size_t v6 = 0LL;
    do
    {
      if (a1[6] <= v6) {
        break;
      }
      size_t length = 0LL;
      uint64_t v7 = (void *)(a1[7] + v5);
      data = xpc_array_get_data(value, v6, &length);
      size_t v9 = length >= 6 ? 6LL : length;
      memcpy(v7, data, v9);
      ++v6;
      v5 += 6LL;
    }

    while (*(void *)(*(void *)(a1[5] + 8LL) + 24LL) > v6);
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceGetSharingAddresses_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceIsSharingEnabled(uint64_t a1, _DWORD *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTLocalDeviceIsSharingEnabled_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgLocalDeviceID", a1);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    int v13 = 0;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTLocalDeviceIsSharingEnabled_block_invoke;
    v9[3] = &unk_189FE8670;
    v9[4] = &v14;
    void v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdLocalDeviceIsSharingEnabledMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    *a2 = *((_DWORD *)v11 + 6);
    uint64_t v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTLocalDeviceSetDenylistEnabled_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTLocalDeviceIsSharingEnabled_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBool");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceIsSharingEnabled_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceDumpExposureNotificationDatabase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTLocalDeviceDumpExposureNotificationDatabase_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBufferSize", a3);
    uint64_t v12 = 0LL;
    int v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTLocalDeviceDumpExposureNotificationDatabase_block_invoke;
    v11[3] = &unk_189FE8698;
    void v11[4] = &v12;
    void v11[5] = a2;
    void v11[6] = a3;
    sendMessageWithReplySync(v7, "kCBMsgIdLocalDeviceDumpExposureNotificationDatabaseMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRemoveCallbacks_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTLocalDeviceDumpExposureNotificationDatabase_block_invoke(void *a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (!*(void *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    uint64_t v4 = (char *)a1[5];
    string = xpc_dictionary_get_string(xdict, "kCBMsgArgBufferName");
    strlcpy(v4, string, a1[6]);
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceDumpExposureNotificationDatabase_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceLinkQualityGetData(uint64_t a1, void *a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTLocalDeviceLinkQualityGetData_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgLocalDeviceID", a1);
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x23800000000LL;
    bzero(&v13, 0x21AuLL);
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTLocalDeviceLinkQualityGetData_block_invoke;
    v9[3] = &unk_189FE86C0;
    v9[4] = &v14;
    void v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdLocalDeviceLinkQualityGetDataMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    memcpy(a2, v11 + 3, 0x21AuLL);
    uint64_t v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTLocalDeviceSetDenylistEnabled_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTLocalDeviceLinkQualityGetData_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  xpc_object_t array = xpc_dictionary_get_array(xdict, "kCBMsgArgBTLinkQualityData");
  *(_WORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_array_get_count(array);
  unsigned int v5 = *(unsigned __int16 *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (v5 >= 2) {
    unsigned int v5 = 2;
  }
  if (v5)
  {
    uint64_t v6 = 0LL;
    size_t v7 = 0LL;
    do
    {
      xpc_object_t value = xpc_array_get_value(array, v7);
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + v6 + 28) = xpc_dictionary_get_uint64(value, "kCBMsgArgRetX");
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + v6 + 29) = xpc_dictionary_get_uint64(value, "kCBMsgArgRssi");
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + v6 + 30) = xpc_dictionary_get_uint64(value, "kCBMsgArgNoise");
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + v6 + 31) = xpc_dictionary_get_uint64(value, "kCBMsgArgSnr");
      *(_WORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + v6 + 32) = xpc_dictionary_get_uint64( value,  "kCBMsgArgDataRate");
      *(_WORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + v6 + 34) = xpc_dictionary_get_uint64( value,  "kCBMsgArgJitterBuffer");
      *(_WORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + v6 + 36) = xpc_dictionary_get_uint64( value,  "kCBMsgArgCodecType");
      uint64_t v9 = (char *)(*(void *)(*(void *)(a1 + 40) + 8LL) + v6 + 38);
      string = xpc_dictionary_get_string(value, "kCBMsgArgName");
      strlcpy(v9, string, 0x100uLL);
      ++v7;
      else {
        unint64_t v11 = *(unsigned __int16 *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      }
      v6 += 268LL;
    }

    while (v7 < v11);
  }

  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceLinkQualityGetData_block_invoke_cold_1();
  }
}

uint64_t BTLocalDeviceSetCallScreening(uint64_t a1, const unsigned __int8 *a2, unsigned int a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v6 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl(&dword_1870FD000, v6, OS_LOG_TYPE_DEFAULT, "BTLocalDeviceSetCallScreening over XPC", buf, 2u);
  }

  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v8 = MBXpcConnection;
    xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uuid(v9, "kCBMsgArgUUID", a2);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgBool", a3);
    *(void *)__int128 buf = 0LL;
    uint64_t v14 = buf;
    uint64_t v15 = 0x2000000000LL;
    uint64_t v16 = 0LL;
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 0x40000000LL;
    v12[2] = __BTLocalDeviceSetCallScreening_block_invoke;
    v12[3] = &unk_189FE86E8;
    void v12[4] = buf;
    sendMessageWithReplySync(v8, "kCBMsgIdLocalDeviceSetCallScreeningMsg", v9, (uint64_t)v12);
    if (v9) {
      xpc_release(v9);
    }
    uint64_t v10 = *((unsigned int *)v14 + 6);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTLocalDeviceSetDenylistEnabled_cold_1();
    }
    return 1LL;
  }

  return v10;
}

void __BTLocalDeviceSetCallScreening_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTLocalDeviceSetCallScreening_block_invoke_cold_1();
  }
}

uint64_t localDeviceXpcDisconnectedHandler(uint64_t a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
    localDeviceXpcDisconnectedHandler_cold_1();
  }
  return _localBTLocalDeviceRemoveAllCallbacksByXPCConnection(a1);
}

uint64_t localDeviceXpcMsgHandler(uint64_t a1, const char *a2, xpc_object_t xdict)
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgLocalDeviceID");
  uint64_t v7 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgID");
  Callbacks = _localBTLocalDeviceGetCallbacks(uint64, v7);
  StatsCallbacks = _localBTLocalDeviceGetStatsCallbacks(uint64, v7);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v10 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t v34 = 136316674;
    *(void *)&v34[4] = a2;
    __int16 v35 = 2080;
    uint64_t v36 = (const char *)(a1 + 2080);
    __int16 v37 = 2080;
    uint64_t v38 = a1 + 2336;
    __int16 v39 = 2048;
    uint64_t v40 = uint64;
    __int16 v41 = 2048;
    uint64_t v42 = v7;
    __int16 v43 = 2048;
    uint64_t v44 = (uint64_t)Callbacks;
    __int16 v45 = 2048;
    uint64_t v46 = StatsCallbacks;
    _os_log_debug_impl( &dword_1870FD000,  v10,  OS_LOG_TYPE_DEBUG,  "localDeviceXpcMsgHandler msg:%s sessionName:%s serviceName:%s localDeviceId:%llx cbid:%llx cbs:%llx linkCBs:%llx",  v34,  0x48u);
  }

  if (!strcmp(a2, "kCBMsgIdLocalDeviceAFHMapChangedEvent"))
  {
    if (Callbacks && Callbacks[2])
    {
      uint64_t v16 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
      uint64_t v17 = StatsCallbacks;
      uint64_t v18 = a1;
      uint64_t v19 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
      *(void *)uint64_t v34 = 0LL;
      data = xpc_dictionary_get_data(xdict, "kCBMsgArgAFHMap", (size_t *)v34);
      uint64_t v21 = (void (*)(uint64_t, uint64_t, uint64_t, const void *, uint64_t))Callbacks[2];
      uint64_t UserData = _localBTLocalDeviceGetUserData(uint64, v7);
      uint64_t v23 = v19;
      a1 = v18;
      StatsCallbacks = v17;
      v21(uint64, v23, v16, data, UserData);
      goto LABEL_18;
    }

    goto LABEL_22;
  }

  if (!strcmp(a2, "kCBMsgIdLocalDeviceLETestStoppedEvent"))
  {
    if (Callbacks && Callbacks[1])
    {
      uint64_t v24 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
      uint64_t v25 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgNumberOfPackets");
      xpc_object_t v26 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))Callbacks[1];
      uint64_t v27 = _localBTLocalDeviceGetUserData(uint64, v7);
      v26(uint64, v24, v25, v27);
      goto LABEL_18;
    }

    goto LABEL_22;
  }

  if (!strcmp(a2, "kCBMsgIdLocalDeviceLinkModeChangedEvent"))
  {
    if (StatsCallbacks && *StatsCallbacks)
    {
      uint64_t v28 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
      __int16 v29 = (void (*)(uint64_t, uint64_t, uint64_t))*StatsCallbacks;
      uint64_t v30 = _localBTLocalDeviceGetUserData(uint64, v7);
      v29(uint64, v28, v30);
      goto LABEL_18;
    }

LABEL_22:
    uint64_t v11 = 0LL;
    goto LABEL_23;
  }

  uint64_t v11 = 0LL;
  if (!strcmp(a2, "kCBMsgIdLocalDeviceStatusEvent") && Callbacks)
  {
    if (*Callbacks)
    {
      uint64_t v12 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
      uint64_t v13 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgEvent");
      uint64_t v14 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))*Callbacks;
      uint64_t v15 = _localBTLocalDeviceGetUserData(uint64, v7);
      v14(uint64, v13, v12, v15);
LABEL_18:
      uint64_t v11 = 1LL;
      goto LABEL_23;
    }

    goto LABEL_22;
  }

LABEL_23:
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v31 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v33 = "did not handle";
    *(_DWORD *)uint64_t v34 = 136316930;
    if ((_DWORD)v11) {
      uint64_t v33 = "handled";
    }
    *(void *)&v34[4] = v33;
    __int16 v35 = 2080;
    uint64_t v36 = a2;
    __int16 v37 = 2080;
    uint64_t v38 = a1 + 2080;
    __int16 v39 = 2080;
    uint64_t v40 = a1 + 2336;
    __int16 v41 = 2048;
    uint64_t v42 = uint64;
    __int16 v43 = 2048;
    uint64_t v44 = v7;
    __int16 v45 = 2048;
    uint64_t v46 = Callbacks;
    __int16 v47 = 2048;
    unsigned __int16 v48 = StatsCallbacks;
    _os_log_debug_impl( &dword_1870FD000,  v31,  OS_LOG_TYPE_DEBUG,  "localDeviceXpcMsgHandler %s %s sessionName:%s serviceName:%s localDeviceId:%llx cbid:%llx cbs:%llx linkCBs:%llx",  v34,  0x52u);
  }

  return v11;
}

void OUTLINED_FUNCTION_9_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

BOOL _localBTPairingAgentCallbacksRegistered(uint64_t a1, const void *a2)
{
  unint64_t v4 = 0LL;
  BOOL v5 = 1;
  uint64_t v6 = &gBTPairingAgentCallbackList;
  do
  {
    if (v6[7] == a1 && !memcmp(v6, a2, 0x30uLL)) {
      break;
    }
    BOOL v5 = v4 < 0x3F;
    v6 += 10;
    ++v4;
  }

  while (v4 != 64);
  pthread_mutex_unlock(&gLock_3);
  return v5;
}

uint64_t _localBTPairingAgentAddCallbacks(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5)
{
  unint64_t v10 = 0xFFFFFFFFFFFFEC00LL;
  while (*(void *)((char *)&gBTPairingAgentCallbackList + v10 + 5176)
       || *(void *)((char *)&gBTPairingAgentCallbackList + v10 + 5184))
  {
    v10 += 80LL;
    if (!v10)
    {
      uint64_t v11 = 4LL;
      goto LABEL_7;
    }
  }

  uint64_t v11 = 0LL;
  uint64_t v12 = (char *)&gBTPairingAgentCallbackList + v10;
  __int128 v13 = *a3;
  __int128 v14 = a3[1];
  *((_OWORD *)v12 + 322) = a3[2];
  *((_OWORD *)v12 + 321) = v14;
  *((_OWORD *)v12 + 320) = v13;
  *((void *)v12 + 649) = a4;
  *((void *)v12 + 647) = a1;
  *((void *)v12 + 648) = a5;
  *((void *)v12 + 646) = a2;
LABEL_7:
  pthread_mutex_unlock(&gLock_3);
  return v11;
}

uint64_t _localBTPairingAgentRemoveCallbacks(uint64_t a1)
{
  unint64_t v2 = 0xFFFFFFFFFFFFEC00LL;
  while (1)
  {
    xpc_object_t v3 = (_OWORD *)((char *)&gBTPairingAgentCallbackList + v2);
    v2 += 80LL;
    if (!v2) {
      goto LABEL_6;
    }
  }

  v3[324] = 0u;
  v3[323] = 0u;
  v3[322] = 0u;
  v3[321] = 0u;
  v3[320] = 0u;
LABEL_6:
  pthread_mutex_unlock(&gLock_3);
  return 0LL;
}

uint64_t _localBTPairingAgentRemoveCallbacksByXpcConnection(uint64_t a1)
{
  unint64_t v2 = 0xFFFFFFFFFFFFEC00LL;
  do
  {
    xpc_object_t v3 = (_OWORD *)((char *)&gBTPairingAgentCallbackList + v2);
    if (*(void *)((char *)&gBTPairingAgentCallbackList + v2 + 5168) == a1)
    {
      v3[324] = 0uLL;
      v3[323] = 0uLL;
      v3[322] = 0uLL;
      v3[321] = 0uLL;
      v3[320] = 0uLL;
    }

    v2 += 80LL;
  }

  while (v2);
  pthread_mutex_unlock(&gLock_3);
  return 0LL;
}

void *_localBTPairingAgentGetCallbacks(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = &gBTPairingAgentCallbackList;
  uint64_t v5 = 64LL;
  while (v4[7] != a1 || v4[8] != a2)
  {
    v4 += 10;
    if (!--v5)
    {
      unint64_t v4 = 0LL;
      break;
    }
  }

  pthread_mutex_unlock(&gLock_3);
  return v4;
}

uint64_t _localBTPairingAgentGetUserData(uint64_t a1)
{
  unint64_t v2 = 0xFFFFFFFFFFFFEC00LL;
  while (*(void *)((char *)&gBTPairingAgentCallbackList + v2 + 5176) != a1)
  {
    v2 += 80LL;
    if (!v2)
    {
      uint64_t v3 = 0LL;
      goto LABEL_6;
    }
  }

  uint64_t v3 = *(void *)((char *)&gBTPairingAgentCallbackList + v2 + 5192);
LABEL_6:
  pthread_mutex_unlock(&gLock_3);
  return v3;
}

uint64_t BTPairingAgentCreate(uint64_t *a1, __int128 *a2, uint64_t a3, void *a4)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTPairingAgentCreate_cold_4();
  }
  uint64_t SessionHandle = getSessionHandle(a1);
  uint64_t MBXpcConnection = getMBXpcConnection(SessionHandle);
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2000000000LL;
  uint64_t v23 = 0LL;
  if (MBXpcConnection)
  {
    uint64_t v10 = MBXpcConnection;
    uint64_t v11 = ++gCBID_3;
    xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgSessionID", SessionHandle);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgID", v11);
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    uint64_t v19 = 0LL;
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 0x40000000LL;
    v15[2] = __BTPairingAgentCreate_block_invoke;
    v15[3] = &unk_189FE8710;
    v15[4] = &v20;
    void v15[5] = &v16;
    sendMessageWithReplySync(v10, "kCBMsgIdPairingAgentCreateMsg", v12, (uint64_t)v15);
    if (v12) {
      xpc_release(v12);
    }
    uint64_t v13 = v17[3];
    if (!v13)
    {
      addXpcMsgHandler(v10, (uint64_t)&pairingAgentXpcCallbacks);
      if (_localBTPairingAgentCallbacksRegistered(v21[3], a2))
      {
        if (MBFLogInitOnce != -1) {
          dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
        }
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
          BTAccessoryManagerAddCallbacks_cold_2();
        }
        uint64_t v13 = 0LL;
      }

      else if (_localBTPairingAgentAddCallbacks(v21[3], v10, a2, a3, v11))
      {
        if (MBFLogInitOnce != -1) {
          dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
        }
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
          BTDiscoveryAgentCreate_cold_3();
        }
        uint64_t v13 = 4LL;
      }

      else
      {
        *a4 = v21[3];
        uint64_t v13 = v17[3];
      }
    }

    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTDeviceFromAddress_cold_1();
    }
    uint64_t v13 = 1LL;
  }

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __BTPairingAgentCreate_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64( xdict,  "kCBMsgArgPairingAgentID");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTPairingAgentCreate_block_invoke_cold_1();
  }
}

uint64_t BTPairingAgentDestroy(uint64_t *a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTPairingAgentDestroy_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(*a1);
  if (MBXpcConnection)
  {
    uint64_t v3 = MBXpcConnection;
    xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v4, "kCBMsgArgPairingAgentID", *a1);
    uint64_t v8 = 0LL;
    xpc_object_t v9 = &v8;
    uint64_t v10 = 0x2000000000LL;
    uint64_t v11 = 0LL;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 0x40000000LL;
    v7[2] = __BTPairingAgentDestroy_block_invoke;
    v7[3] = &unk_189FE8738;
    v7[4] = &v8;
    sendMessageWithReplySync(v3, "kCBMsgIdPairingAgentDestroyMsg", v4, (uint64_t)v7);
    if (!v9[3])
    {
      _localBTPairingAgentRemoveCallbacks(*a1);
      *a1 = 0LL;
    }

    if (v4) {
      xpc_release(v4);
    }
    uint64_t v5 = *((unsigned int *)v9 + 6);
    _Block_object_dispose(&v8, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTPairingAgentDestroy_cold_1();
    }
    return 1LL;
  }

  return v5;
}

void __BTPairingAgentDestroy_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTPairingAgentDestroy_block_invoke_cold_1();
  }
}

uint64_t BTPairingAgentStart(uint64_t a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTPairingAgentStart_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v3 = MBXpcConnection;
    xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v4, "kCBMsgArgPairingAgentID", a1);
    uint64_t v8 = 0LL;
    xpc_object_t v9 = &v8;
    uint64_t v10 = 0x2000000000LL;
    uint64_t v11 = 0LL;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 0x40000000LL;
    v7[2] = __BTPairingAgentStart_block_invoke;
    v7[3] = &unk_189FE8760;
    v7[4] = &v8;
    sendMessageWithReplySync(v3, "kCBMsgIdPairingAgentStartMsg", v4, (uint64_t)v7);
    if (v4) {
      xpc_release(v4);
    }
    uint64_t v5 = *((unsigned int *)v9 + 6);
    _Block_object_dispose(&v8, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v5;
}

void __BTPairingAgentStart_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTPairingAgentStart_block_invoke_cold_1();
  }
}

uint64_t BTPairingAgentStop(uint64_t a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTPairingAgentStop_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v3 = MBXpcConnection;
    xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v4, "kCBMsgArgPairingAgentID", a1);
    uint64_t v8 = 0LL;
    xpc_object_t v9 = &v8;
    uint64_t v10 = 0x2000000000LL;
    uint64_t v11 = 0LL;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 0x40000000LL;
    v7[2] = __BTPairingAgentStop_block_invoke;
    v7[3] = &unk_189FE8788;
    v7[4] = &v8;
    sendMessageWithReplySync(v3, "kCBMsgIdPairingAgentStopMsg", v4, (uint64_t)v7);
    if (v4) {
      xpc_release(v4);
    }
    uint64_t v5 = *((unsigned int *)v9 + 6);
    _Block_object_dispose(&v8, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v5;
}

void __BTPairingAgentStop_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTPairingAgentStop_block_invoke_cold_1();
  }
}

uint64_t BTPairingAgentCancelPairing(uint64_t a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTPairingAgentCancelPairing_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v3 = MBXpcConnection;
    xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v4, "kCBMsgArgPairingAgentID", a1);
    uint64_t v8 = 0LL;
    xpc_object_t v9 = &v8;
    uint64_t v10 = 0x2000000000LL;
    uint64_t v11 = 0LL;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 0x40000000LL;
    v7[2] = __BTPairingAgentCancelPairing_block_invoke;
    v7[3] = &unk_189FE87B0;
    v7[4] = &v8;
    sendMessageWithReplySync(v3, "kCBMsgIdPairingAgentCancelPairingMsg", v4, (uint64_t)v7);
    if (v4) {
      xpc_release(v4);
    }
    uint64_t v5 = *((unsigned int *)v9 + 6);
    _Block_object_dispose(&v8, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v5;
}

void __BTPairingAgentCancelPairing_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTPairingAgentCancelPairing_block_invoke_cold_1();
  }
}

uint64_t BTPairingAgentSetPincode(uint64_t a1, uint64_t a2, const char *a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTPairingAgentSetPincode_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgPairingAgentID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_string(v8, "kCBMsgIdPairingAgentPincode", a3);
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTPairingAgentSetPincode_block_invoke;
    v11[3] = &unk_189FE87D8;
    void v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdPairingAgentSetPincodeMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTPairingAgentSetPincode_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTPairingAgentSetPincode_block_invoke_cold_1();
  }
}

uint64_t BTPairingAgentAcceptSSP(uint64_t a1, uint64_t a2, int a3)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTPairingAgentAcceptSSP_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v7 = MBXpcConnection;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgPairingAgentID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgError", a3);
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2000000000LL;
    uint64_t v15 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __BTPairingAgentAcceptSSP_block_invoke;
    v11[3] = &unk_189FE8800;
    void v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdPairingAgentAcceptSSPMsg", v8, (uint64_t)v11);
    if (v8) {
      xpc_release(v8);
    }
    uint64_t v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v9;
}

void __BTPairingAgentAcceptSSP_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTPairingAgentAcceptSSP_block_invoke_cold_1();
  }
}

uint64_t BTPairingAgentDeletePairedDevice(uint64_t a1, uint64_t a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTPairingAgentDeletePairedDevice_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgPairingAgentID", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a2);
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    uint64_t v13 = 0LL;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTPairingAgentDeletePairedDevice_block_invoke;
    v9[3] = &unk_189FE8828;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdPairingAgentDeletePairedDeviceMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    uint64_t v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTPairingAgentDeletePairedDevice_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTPairingAgentDeletePairedDevice_block_invoke_cold_1();
  }
}

uint64_t BTPairingAgentSetIOCapability(uint64_t a1, unsigned int a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTPairingAgentSetIOCapability_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgPairingAgentID", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgIOCapabilities", a2);
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    uint64_t v13 = 0LL;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTPairingAgentSetIOCapability_block_invoke;
    v9[3] = &unk_189FE8850;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdPairingAgentSetIOCapabilityMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    uint64_t v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTPairingAgentSetIOCapability_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTPairingAgentSetIOCapability_block_invoke_cold_1();
  }
}

uint64_t BTPairingAgentClearOOBDataForDevice(uint64_t a1, uint64_t a2)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTPairingAgentClearOOBDataForDevice_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v5 = MBXpcConnection;
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgPairingAgentID", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a2);
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    uint64_t v13 = 0LL;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    void v9[2] = __BTPairingAgentClearOOBDataForDevice_block_invoke;
    v9[3] = &unk_189FE8878;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdPairingAgentClearOOBDataForDeviceMsg", v6, (uint64_t)v9);
    if (v6) {
      xpc_release(v6);
    }
    uint64_t v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v7;
}

void __BTPairingAgentClearOOBDataForDevice_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTPairingAgentClearOOBDataForDevice_block_invoke_cold_1();
  }
}

uint64_t BTPairingAgentSetOOBDataForDevice( uint64_t a1, uint64_t a2, const void *a3, const void *a4, const void *a5, const void *a6)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTPairingAgentSetOOBDataForDevice_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v13 = MBXpcConnection;
    xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgPairingAgentID", a1);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgBTDevice", a2);
    if (a3) {
      xpc_dictionary_set_data(v14, "kCBMsgArgC192", a3, 0x10uLL);
    }
    if (a5) {
      xpc_dictionary_set_data(v14, "kCBMsgArgC256", a5, 0x10uLL);
    }
    if (a4) {
      xpc_dictionary_set_data(v14, "kCBMsgArgR192", a4, 0x10uLL);
    }
    if (a6) {
      xpc_dictionary_set_data(v14, "kCBMsgArgR256", a6, 0x10uLL);
    }
    uint64_t v18 = 0LL;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2000000000LL;
    uint64_t v21 = 0LL;
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 0x40000000LL;
    v17[2] = __BTPairingAgentSetOOBDataForDevice_block_invoke;
    v17[3] = &unk_189FE88A0;
    v17[4] = &v18;
    sendMessageWithReplySync(v13, "kCBMsgIdPairingAgentSetOOBDataForDeviceMsg", v14, (uint64_t)v17);
    if (v14) {
      xpc_release(v14);
    }
    uint64_t v15 = *((unsigned int *)v19 + 6);
    _Block_object_dispose(&v18, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v15;
}

void __BTPairingAgentSetOOBDataForDevice_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTPairingAgentSetOOBDataForDevice_block_invoke_cold_1();
  }
}

uint64_t BTPairingAgentGetLocalOOBData(uint64_t a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTPairingAgentGetLocalOOBData_cold_2();
  }
  uint64_t MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    uint64_t v3 = MBXpcConnection;
    xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v4, "kCBMsgArgPairingAgentID", a1);
    uint64_t v8 = 0LL;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2000000000LL;
    uint64_t v11 = 0LL;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 0x40000000LL;
    v7[2] = __BTPairingAgentGetLocalOOBData_block_invoke;
    v7[3] = &unk_189FE88C8;
    v7[4] = &v8;
    sendMessageWithReplySync(v3, "kCBMsgIdPairingAgentGetLocalOOBDataMsg", v4, (uint64_t)v7);
    if (v4) {
      xpc_release(v4);
    }
    uint64_t v5 = *((unsigned int *)v9 + 6);
    _Block_object_dispose(&v8, 8);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      BTAccessoryManagerRegisterDevice_cold_1();
    }
    return 1LL;
  }

  return v5;
}

void __BTPairingAgentGetLocalOOBData_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    __BTPairingAgentGetLocalOOBData_block_invoke_cold_1();
  }
}

uint64_t pairingAgentXpcDisconnectedHandler(uint64_t a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
    pairingAgentXpcDisconnectedHandler_cold_1();
  }
  return _localBTPairingAgentRemoveCallbacksByXpcConnection(a1);
}

uint64_t pairingAgentXpcMsgHandler(uint64_t a1, const char *a2, xpc_object_t xdict)
{
  uint64_t v63 = *MEMORY[0x1895F89C0];
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgPairingAgentID");
  uint64_t v7 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgID");
  Callbacks = _localBTPairingAgentGetCallbacks(uint64, v7);
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  uint64_t v9 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)size_t length = 136316418;
    *(void *)&length[4] = a2;
    __int16 v51 = 2080;
    uint64_t v52 = (const char *)(a1 + 2080);
    __int16 v53 = 2080;
    uint64_t v54 = a1 + 2336;
    __int16 v55 = 2048;
    uint64_t v56 = uint64;
    __int16 v57 = 2048;
    uint64_t v58 = v7;
    __int16 v59 = 2048;
    uint64_t v60 = Callbacks;
    _os_log_debug_impl( &dword_1870FD000,  v9,  OS_LOG_TYPE_DEBUG,  "pairingAgentXpcMsgHandler msg:%s sessionName:%s serviceName:%s agentID:%llx cbid:%llx cbs:%llx",  length,  0x3Eu);
  }

  if (!strcmp(a2, "kCBMsgIdPairingAgentStatusEvent"))
  {
    if (!Callbacks || !*Callbacks) {
      goto LABEL_35;
    }
    uint64_t v21 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
    uint64_t v22 = a1;
    uint64_t v23 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
    uint64_t v24 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgEvent");
    uint64_t v25 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*Callbacks;
    uint64_t UserData = _localBTPairingAgentGetUserData(uint64);
    uint64_t v27 = v23;
    a1 = v22;
    v25(uint64, v24, v27, v21, UserData);
    goto LABEL_34;
  }

  if (!strcmp(a2, "kCBMsgIdPairingAgentPincode"))
  {
    if (!Callbacks || !Callbacks[1]) {
      goto LABEL_35;
    }
    unsigned __int8 v28 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgMinLength");
    uint64_t v29 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
    uint64_t v30 = (void (*)(uint64_t, uint64_t, void, uint64_t))Callbacks[1];
    uint64_t v31 = _localBTPairingAgentGetUserData(uint64);
    v30(uint64, v29, v28, v31);
    goto LABEL_34;
  }

  if (!strcmp(a2, "kCBMsgIdPairingAgentAuthorization"))
  {
    if (Callbacks && Callbacks[2])
    {
      uint64_t v32 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
      uint64_t v33 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgServices");
      uint64_t v34 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))Callbacks[2];
LABEL_33:
      uint64_t v42 = _localBTPairingAgentGetUserData(uint64);
      v34(uint64, v32, v33, v42);
      goto LABEL_34;
    }

LABEL_35:
    uint64_t v10 = 0LL;
    goto LABEL_36;
  }

  if (!strcmp(a2, "kCBMsgIdPairingAgentUserConfirmation"))
  {
    if (!Callbacks || !Callbacks[3]) {
      goto LABEL_35;
    }
    uint64_t v35 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
    uint64_t v36 = a1;
    uint64_t v37 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgValue");
    uint64_t v38 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgMITM");
    __int16 v39 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))Callbacks[3];
    uint64_t v40 = _localBTPairingAgentGetUserData(uint64);
    uint64_t v41 = v37;
    a1 = v36;
    v39(uint64, v35, v41, v38, v40);
LABEL_34:
    uint64_t v10 = 1LL;
    goto LABEL_36;
  }

  if (!strcmp(a2, "kCBMsgIdPairingAgentPassKeyDisplay"))
  {
    if (Callbacks && Callbacks[4])
    {
      uint64_t v32 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
      uint64_t v33 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgValue");
      uint64_t v34 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))Callbacks[4];
      goto LABEL_33;
    }

    goto LABEL_35;
  }

  uint64_t v10 = 0LL;
  if (strcmp(a2, "kCBMsgIdPairingAgentOOBDataReady") || !Callbacks) {
    goto LABEL_36;
  }
  if (!Callbacks[5]) {
    goto LABEL_35;
  }
  *(void *)size_t length = 0LL;
  data = xpc_dictionary_get_data(xdict, "kCBMsgArgC192", (size_t *)length);
  if (*(void *)length != 16LL)
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_FAULT)) {
      pairingAgentXpcMsgHandler_cold_4();
    }
    return 0LL;
  }

  uint64_t v12 = data;
  uint64_t v13 = a1;
  size_t v49 = 0LL;
  xpc_object_t v14 = xpc_dictionary_get_data(xdict, "kCBMsgArgC256", &v49);
  if (v49 != 16)
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_FAULT)) {
      pairingAgentXpcMsgHandler_cold_3();
    }
    return 0LL;
  }

  uint64_t v15 = v14;
  size_t v48 = 0LL;
  uint64_t v16 = xpc_dictionary_get_data(xdict, "kCBMsgArgR192", &v48);
  if (v48 != 16)
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_FAULT)) {
      pairingAgentXpcMsgHandler_cold_2();
    }
    return 0LL;
  }

  uint64_t v46 = v16;
  size_t v47 = 0LL;
  uint64_t v17 = xpc_dictionary_get_data(xdict, "kCBMsgArgR256", &v47);
  if (v47 != 16)
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_FAULT)) {
      pairingAgentXpcMsgHandler_cold_1();
    }
    return 0LL;
  }

  uint64_t v18 = v17;
  uint64_t v19 = (void (*)(uint64_t, const void *, const void *, const void *, const void *, uint64_t))Callbacks[5];
  uint64_t v20 = _localBTPairingAgentGetUserData(uint64);
  v19(uint64, v12, v46, v15, v18, v20);
  uint64_t v10 = 1LL;
  a1 = v13;
LABEL_36:
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  __int16 v43 = (os_log_s *)MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    __int16 v45 = "did not handle";
    *(_DWORD *)size_t length = 136316674;
    if ((_DWORD)v10) {
      __int16 v45 = "handled";
    }
    *(void *)&length[4] = v45;
    __int16 v51 = 2080;
    uint64_t v52 = a2;
    __int16 v53 = 2080;
    uint64_t v54 = a1 + 2080;
    __int16 v55 = 2080;
    uint64_t v56 = a1 + 2336;
    __int16 v57 = 2048;
    uint64_t v58 = uint64;
    __int16 v59 = 2048;
    uint64_t v60 = (void *)v7;
    __int16 v61 = 2048;
    uint64_t v62 = Callbacks;
    _os_log_debug_impl( &dword_1870FD000,  v43,  OS_LOG_TYPE_DEBUG,  "pairingAgentXpcMsgHandler %s %s sessionName:%s serviceName:%s agentID:%llx cbid:%llx cbs:%llx",  length,  0x48u);
  }

  return v10;
}

void OUTLINED_FUNCTION_8_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t addFWSession(uint64_t a1)
{
  if (!a1) {
    return 3LL;
  }
  pthread_mutex_lock(&gLock_4);
  unint64_t v2 = 0LL;
  do
    unint64_t v3 = v2++;
  while (v3 <= 0x63 && gFWSessionList[v3]);
  if (v3 > 0x63)
  {
    uint64_t v4 = 4LL;
  }

  else
  {
    uint64_t v4 = 0LL;
    ++sessionCount;
    gFWSessionList[v2 - 1] = a1;
  }

  pthread_mutex_unlock(&gLock_4);
  return v4;
}

uint64_t removeFWSession(uint64_t a1)
{
  if (!a1) {
    return 3LL;
  }
  pthread_mutex_lock(&gLock_4);
  unint64_t v2 = 0LL;
  do
    unint64_t v3 = v2++;
  while (v3 <= 0x63 && gFWSessionList[v3] != a1);
  if (v3 > 0x63)
  {
    uint64_t v4 = 7LL;
  }

  else
  {
    uint64_t v4 = 0LL;
    --sessionCount;
    gFWSessionList[v2 - 1] = 0LL;
  }

  pthread_mutex_unlock(&gLock_4);
  return v4;
}

uint64_t getSessionHandle(uint64_t *a1)
{
  uint64_t v2 = 0LL;
  while (1)
  {
    unint64_t v3 = (uint64_t *)gFWSessionList[v2];
    if (v3)
    {
      uint64_t v4 = *v3;
    }

    if (++v2 == 100)
    {
      uint64_t v4 = 0LL;
      break;
    }
  }

  pthread_mutex_unlock(&gLock_4);
  return v4;
}

uint64_t getFirstSessionHandle()
{
  uint64_t v0 = 0LL;
  while (1)
  {
    uint64_t v1 = (uint64_t *)gFWSessionList[v0];
    if (v1) {
      break;
    }
    if (++v0 == 100)
    {
      uint64_t v2 = 0LL;
      goto LABEL_6;
    }
  }

  uint64_t v2 = *v1;
LABEL_6:
  pthread_mutex_unlock(&gLock_4);
  return v2;
}

BOOL isSessionValid(int a1)
{
  unint64_t v2 = 0LL;
  uint64_t v3 = a1 & 0xFFFF0000;
  BOOL v4 = 1;
  do
  {
    uint64_t v5 = (void *)gFWSessionList[v2];
    if (v5 && *v5 == v3) {
      break;
    }
    BOOL v4 = v2++ < 0x63;
  }

  while (v2 != 100);
  pthread_mutex_unlock(&gLock_4);
  return v4;
}

BOOL isDispatchSessionValid(uint64_t a1)
{
  if (gFWSessionList[0]) {
    BOOL v2 = gFWSessionList[0] == a1;
  }
  else {
    BOOL v2 = 0;
  }
  if (v2)
  {
    BOOL v7 = 1LL;
  }

  else
  {
    unint64_t v3 = 0LL;
    do
    {
      unint64_t v4 = v3;
      if (v3 == 99) {
        break;
      }
      uint64_t v5 = gFWSessionList[++v3];
    }

    while (!v5 || v5 != a1);
    BOOL v7 = v4 < 0x63;
  }

  pthread_mutex_unlock(&gLock_4);
  return v7;
}

void *getFWSessionByHandle(int a1)
{
  uint64_t v2 = 0LL;
  uint64_t v3 = a1 & 0xFFFF0000;
  while (1)
  {
    unint64_t v4 = (void *)gFWSessionList[v2];
    if (v4)
    {
      if (*v4 == v3) {
        break;
      }
    }

    if (++v2 == 100)
    {
      unint64_t v4 = 0LL;
      break;
    }
  }

  pthread_mutex_unlock(&gLock_4);
  return v4;
}

uint64_t getFWSessionByXpcConnection(uint64_t a1)
{
  uint64_t v2 = 0LL;
  while (1)
  {
    uint64_t v3 = gFWSessionList[v2];
    if (v3)
    {
      if (*(void *)(v3 + 88) == a1) {
        break;
      }
    }

    if (++v2 == 100)
    {
      uint64_t v3 = 0LL;
      break;
    }
  }

  pthread_mutex_unlock(&gLock_4);
  return v3;
}

uint64_t getFWSessionByUint64(uint64_t a1)
{
  uint64_t v2 = 0LL;
  while (1)
  {
    uint64_t v3 = gFWSessionList[v2];
    if (v3 && v3 == a1) {
      break;
    }
    if (++v2 == 100)
    {
      a1 = 0LL;
      break;
    }
  }

  pthread_mutex_unlock(&gLock_4);
  return a1;
}

uint64_t getFirstFWSession()
{
  uint64_t v0 = 0LL;
  do
  {
    uint64_t v1 = gFWSessionList[v0];
    if (v1) {
      break;
    }
  }

  while (v0++ != 99);
  pthread_mutex_unlock(&gLock_4);
  return v1;
}

uint64_t addXpcMsgHandler(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 3LL;
  if (a1 && a2)
  {
    uint64_t v3 = 0LL;
    int v4 = -1;
    do
    {
      uint64_t v5 = *(void *)(a1 + 8 + 8 * v3);
      if (v5) {
        BOOL v6 = 0;
      }
      else {
        BOOL v6 = v4 == -1;
      }
      if (v6)
      {
        int v4 = v3;
      }

      else if (v5 == a2)
      {
        return 15LL;
      }

      ++v3;
    }

    while (v3 != 256);
    if (v4 == -1)
    {
      return 4LL;
    }

    else
    {
      uint64_t v2 = 0LL;
      *(void *)(a1 + 8LL * v4 + 8) = a2;
    }
  }

  return v2;
}

uint64_t removeXpcMsgHandler(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 3LL;
  if (a1 && a2)
  {
    uint64_t v3 = 0LL;
    while (*(void *)(a1 + 8 + v3) != a2)
    {
      v3 += 8LL;
      if (v3 == 2048) {
        return 3LL;
      }
    }

    uint64_t v2 = 0LL;
    *(void *)(a1 + v3 + 8) = 0LL;
  }

  return v2;
}

uint64_t getMBXpcConnection(uint64_t a1)
{
  uint64_t FWSessionByHandle = (uint64_t)getFWSessionByHandle(a1);
  if (FWSessionByHandle)
  {
    if (a1) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t FWSessionByHandle = getFWSessionByUint64(a1);
    if (a1)
    {
LABEL_3:
      if (!FWSessionByHandle) {
        return 0LL;
      }
LABEL_7:
      uint64_t result = *(void *)(FWSessionByHandle + 88);
      if (result) {
        return result;
      }
      return 0LL;
    }
  }

  uint64_t FWSessionByHandle = getFirstFWSession();
  if (FWSessionByHandle) {
    goto LABEL_7;
  }
  return 0LL;
}

uint64_t BTSessionAttachWithQueue(const char *a1, uint64_t *a2, uint64_t a3, dispatch_object_s *a4)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t result = 3LL;
  if (a1 && a2)
  {
    if (MGGetBoolAnswer()
      && (MGGetBoolAnswer() & 1) == 0
      && ((v9 = IOServiceNameMatching("marconi-bt"), uint64_t v10 = (mach_port_t *)MEMORY[0x1896086A8], v9)
       && (io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1896086A8], v9)) != 0
       || (uint64_t v12 = IOServiceNameMatching("bluetooth")) != 0LL
       && (io_service_t MatchingService = IOServiceGetMatchingService(*v10, v12)) != 0))
    {
      IOObjectRelease(MatchingService);
      uint64_t v13 = malloc(0x60uLL);
      *(void *)uint64_t v13 = 0LL;
      v13[21] = 0;
      xpc_object_t v14 = strdup(a1);
      uint64_t v15 = *a2;
      *((void *)v13 + 1) = v14;
      *((void *)v13 + 2) = v15;
      if (a4) {
        uint64_t v16 = a4;
      }
      else {
        uint64_t v16 = (dispatch_object_s *)MEMORY[0x1895F8AE0];
      }
      *((void *)v13 + 3) = a3;
      *((void *)v13 + 4) = v16;
      dispatch_retain(v16);
      *((void *)v13 + 5) = 0LL;
      v13[12] = 0;
      *((void *)v13 + 8) = 0LL;
      *((void *)v13 + 9) = 0LL;
      *((void *)v13 + 7) = 0LL;
      if (gSessionAttachTries)
      {
        double v17 = exp2((double)(unint64_t)gSessionAttachTries) * 100.0 * 1000000.0;
        else {
          int64_t v18 = (uint64_t)v17;
        }
      }

      else
      {
        int64_t v18 = 0LL;
      }

      if (MBFLogInitOnce != -1) {
        dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
      }
      uint64_t v19 = (os_log_s *)MBFLogComponent;
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 134218240;
        int64_t v23 = v18;
        __int16 v24 = 2048;
        uint64_t v25 = gSessionAttachTries;
        _os_log_impl( &dword_1870FD000,  v19,  OS_LOG_TYPE_DEFAULT,  "Delaying BTSessionAttach by %lldmS. Connection attempt:%llu",  (uint8_t *)&v22,  0x16u);
      }

      dispatch_time_t v20 = dispatch_time(0LL, v18);
      dispatch_queue_global_t v21 = _MBTGetAsyncAttachQueue((uint64_t)v13);
      dispatch_after_f(v20, v21, v13, (dispatch_function_t)_MBTAsyncAttach);
      return 0LL;
    }

    else
    {
      return 9LL;
    }
  }

  return result;
}

dispatch_queue_global_t _MBTGetAsyncAttachQueue(uint64_t a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    _MBTGetAsyncAttachQueue_cold_3();
  }
  if (*(void *)(a1 + 32) == MEMORY[0x1895F8AE0])
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
      _MBTGetAsyncAttachQueue_cold_1();
    }
    return dispatch_get_global_queue(25LL, 0LL);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
      _MBTGetAsyncAttachQueue_cold_2();
    }
    return *(dispatch_queue_global_t *)(a1 + 32);
  }

void _MBTAsyncAttach(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    _MBTAsyncAttach_cold_3();
  }
  if (isDispatchSessionValid(a1))
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
      _MBTAsyncAttach_cold_1();
    }
  }

  else
  {
    uint64_t v7 = 0LL;
    *(void *)(a1 + 88) = createXpcConnection( (uint64_t)&xpcCBs,  *(dispatch_queue_s **)(a1 + 32),  *(void *)(a1 + 8),  0LL,  a1,  &v7);
    *(void *)a1 = v7;
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    uint64_t v2 = (os_log_s *)MBFLogComponent;
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)a1;
      uint64_t v4 = *(void *)(a1 + 88);
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)__int128 buf = 134218752;
      uint64_t v9 = a1;
      __int16 v10 = 2048;
      uint64_t v11 = v3;
      __int16 v12 = 2048;
      uint64_t v13 = v4;
      __int16 v14 = 2048;
      uint64_t v15 = v5;
      _os_log_debug_impl( &dword_1870FD000,  v2,  OS_LOG_TYPE_DEBUG,  "_MBTAsyncAttach fwSession:%llx sessionHandle:%llx xpcConnection:%llx queue:%p",  buf,  0x2Au);
    }

    addFWSession(a1);
    if (*(void *)(a1 + 88) && v7)
    {
      v6[0] = (void (*)(void))MEMORY[0x1895F87A8];
      v6[1] = (void (*)(void))0x40000000;
      v6[2] = (void (*)(void))___MBTAsyncAttach_block_invoke;
      void v6[3] = (void (*)(void))&__block_descriptor_tmp_5;
      void v6[4] = (void (*)(void))a1;
      _MBTDispachAsyncAttachCompletionBlock(a1, v6);
    }

    else
    {
      if (MBFLogInitOnce != -1) {
        dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
      }
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
        _MBTAsyncAttach_cold_2();
      }
      *(_DWORD *)(a1 + 84) = 3;
    }
  }

uint64_t BTSessionDetachWithQueue(uint64_t *a1)
{
  if (!a1) {
    return 3LL;
  }
  uint64_t v2 = *a1;
  if (!*a1) {
    return 3LL;
  }
  if (!isDispatchSessionValid(*a1))
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
      BTSessionDetachWithQueue_cold_2();
    }
    return 3LL;
  }

  *a1 = 0LL;
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    BTSessionDetachWithQueue_cold_1();
  }
  notifyStubsOfDisconnection(*(void *)(v2 + 88));
  *(_DWORD *)(v2 + 84) = 1;
  disconnect(*(void *)(v2 + 88));
  return 0LL;
}

void notifyStubsOfDisconnection(uint64_t a1)
{
  uint64_t FWSessionByXpcConnection = getFWSessionByXpcConnection(a1);
  if (FWSessionByXpcConnection)
  {
    uint64_t v3 = FWSessionByXpcConnection;
    for (uint64_t i = 8LL; i != 2056; i += 8LL)
    {
      uint64_t v5 = *(void (***)(uint64_t))(*(void *)(v3 + 88) + i);
      if (v5) {
        (*v5)(a1);
      }
    }
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
      notifyStubsOfDisconnection_cold_1();
    }
  }

void _MBTDispachAsyncAttachCompletionBlock(uint64_t a1, void (**a2)(void))
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    _MBTDispachAsyncAttachCompletionBlock_cold_3();
  }
  if (_MBTGetAsyncAttachQueue(a1) == *(dispatch_queue_global_t *)(a1 + 32))
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
      _MBTDispachAsyncAttachCompletionBlock_cold_1();
    }
    a2[2](a2);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
      _MBTDispachAsyncAttachCompletionBlock_cold_2();
    }
    dispatch_async(*(dispatch_queue_t *)(a1 + 32), a2);
  }

uint64_t _MBTSignalSessionEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a3) {
    uint64_t v6 = 0LL;
  }
  else {
    uint64_t v6 = a1;
  }
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    _MBTSignalSessionEvent_cold_1();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(a1 + 16))(v6, a2, a3, *(void *)(a1 + 24));
}

void xpcConnectionDidReset(uint64_t a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    xpcConnectionDidReset_cold_3();
  }
  uint64_t FWSessionByXpcConnection = getFWSessionByXpcConnection(a1);
  if (FWSessionByXpcConnection)
  {
    uint64_t v3 = FWSessionByXpcConnection;
    notifyStubsOfDisconnection(a1);
    *(_DWORD *)(v3 + 84) = 2;
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
      xpcConnectionDidReset_cold_2();
    }
    disconnect(*(void *)(v3 + 88));
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
      xpcConnectionDidReset_cold_1();
    }
  }

void xpcConnectionInvalid(uint64_t a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    xpcConnectionInvalid_cold_2();
  }
  uint64_t FWSessionByXpcConnection = (void (*)(void))getFWSessionByXpcConnection(a1);
  if (FWSessionByXpcConnection)
  {
    v3[0] = (void (*)(void))MEMORY[0x1895F87A8];
    v3[1] = (void (*)(void))0x40000000;
    v3[2] = __xpcConnectionInvalid_block_invoke;
    v3[3] = (void (*)(void))&__block_descriptor_tmp_4;
    v3[4] = FWSessionByXpcConnection;
    _MBTDispachAsyncAttachCompletionBlock((uint64_t)FWSessionByXpcConnection, v3);
  }

  else
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
      xpcConnectionInvalid_cold_1();
    }
  }

void xpcConnectionDidReceiveMsg(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 2600);
  if (*a2) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (MBFLogInitOnce != -1) {
      dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
    }
    uint64_t v5 = (os_log_s *)MBFLogComponent;
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    {
      if (v3) {
        uint64_t v11 = *(const char **)(v3 + 8);
      }
      else {
        uint64_t v11 = "UNKNOWN";
      }
      int v12 = 136315138;
      uint64_t v13 = v11;
      _os_log_error_impl( &dword_1870FD000,  v5,  OS_LOG_TYPE_ERROR,  "Invalid message received for session %s",  (uint8_t *)&v12,  0xCu);
    }
  }

  else
  {
    for (uint64_t i = 0LL; ; ++i)
    {
      uint64_t v10 = *(void *)(a1 + 8 * i + 8);
      if (v10)
      {
      }
    }
  }

void __xpcConnectionInvalid_block_invoke(uint64_t a1)
{
  uint64_t v1 = (uint64_t *)(a1 + 32);
  int v2 = *(_DWORD *)(*(void *)(a1 + 32) + 84LL);
  switch(v2)
  {
    case 3:
      if (MBFLogInitOnce != -1) {
        dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
      }
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
        __xpcConnectionInvalid_block_invoke_cold_3();
      }
      _MBTSignalSessionEvent(*v1, 0LL, 1LL);
      ++gSessionAttachTries;
      break;
    case 2:
      if (MBFLogInitOnce != -1) {
        dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
      }
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
        __xpcConnectionInvalid_block_invoke_cold_4();
      }
      _MBTSignalSessionEvent(*v1, 2LL, 0LL);
      gSessionAttachTries = 0LL;
      break;
    case 1:
      if (MBFLogInitOnce != -1) {
        dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
      }
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
        __xpcConnectionInvalid_block_invoke_cold_2();
      }
      _MBTSignalSessionEvent(*v1, 1LL, 0LL);
      break;
    default:
      if (MBFLogInitOnce != -1) {
        dispatch_once_f(&MBFLogInitOnce, 0LL, (dispatch_function_t)MBFLogInit);
      }
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR)) {
        __xpcConnectionInvalid_block_invoke_cold_1();
      }
      break;
  }

  removeFWSession(*v1);
  releaseXPCConnection(*(void *)(*v1 + 88));
  dispatch_release(*(dispatch_object_t *)(*v1 + 32));
  free(*(void **)(*v1 + 8));
  free((void *)*v1);
}

  ;
}

void OUTLINED_FUNCTION_6_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_12_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void BTAccessoryManagerGetDefault_cold_1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_13( &dword_1870FD000,  v0,  (uint64_t)v0,  "Failed to get a valid XPC connection for session %llx sessionHandle:%llx",  v1);
  OUTLINED_FUNCTION_4();
}

void __BTAccessoryManagerGetDefault_block_invoke_cold_1()
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)v0 + 8LL) + 24LL);
  int v4 = 134218240;
  uint64_t v5 = v2;
  __int16 v6 = 2048;
  uint64_t v7 = v1;
  OUTLINED_FUNCTION_9( &dword_1870FD000,  v3,  (uint64_t)v3,  "kCBMsgIdAccessoryGetDefaultMsg reply accessoryManagerID:%llx result:%llx",  (uint8_t *)&v4);
  OUTLINED_FUNCTION_4();
}

void BTAccessoryManagerAddCallbacks_cold_1()
{
}

void BTAccessoryManagerAddCallbacks_cold_2()
{
}

void BTAccessoryManagerAddCallbacks_cold_3()
{
}

void BTAccessoryManagerAddCallbacks_cold_4()
{
}

void __BTAccessoryManagerAddCallbacks_block_invoke_cold_1()
{
}

void BTAccessoryManagerRemoveCallbacks_cold_1()
{
}

void BTAccessoryManagerRemoveCallbacks_cold_2()
{
}

void __BTAccessoryManagerRemoveCallbacks_block_invoke_cold_1()
{
}

void BTAccessoryManagerRegisterDevice_cold_1()
{
}

void BTAccessoryManagerRegisterDevice_cold_2()
{
}

void BTAccessoryManagerRegisterDevice_cold_3()
{
}

void __BTAccessoryManagerRegisterDevice_block_invoke_cold_1()
{
}

void BTAccessoryManagerPlugInDevice_cold_2()
{
}

void __BTAccessoryManagerPlugInDevice_block_invoke_cold_1()
{
}

void BTAccessoryManagerUnplugDevice_cold_2()
{
}

void __BTAccessoryManagerUnplugDevice_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetDeviceState_cold_2()
{
}

void __BTAccessoryManagerGetDeviceState_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetDevices_cold_1()
{
}

void BTAccessoryManagerGetDevices_cold_2()
{
}

void __BTAccessoryManagerGetDevices_block_invoke_cold_1()
{
  int v2 = 134218240;
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9( &dword_1870FD000,  v1,  (uint64_t)v1,  "kCBMsgIdAccessoryGetDevicesMsg reply result:%llx count:%lx",  (uint8_t *)&v2);
  OUTLINED_FUNCTION_4();
}

void BTAccessoryManagerGetTimeSyncId_cold_2()
{
}

void __BTAccessoryManagerGetTimeSyncId_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetDeviceBatteryLevel_cold_2()
{
}

void __BTAccessoryManagerGetDeviceBatteryLevel_block_invoke_cold_1()
{
}

void BTAccessoryManagerIsAccessory_cold_2()
{
}

void __BTAccessoryManagerIsAccessory_block_invoke_cold_1()
{
}

void BTAccessoryManagerGenerateLinkKey_cold_2()
{
}

void __BTAccessoryManagerGenerateLinkKey_block_invoke_cold_1()
{
}

void BTAccessoryManagerSetLinkKeyEx_cold_2()
{
}

void BTAccessoryManagerSetLinkKeyEx_cold_3()
{
}

void __BTAccessoryManagerSetLinkKeyEx_block_invoke_cold_1()
{
}

void BTAccessoryManagerSetDoubleTapAction_cold_2()
{
}

void __BTAccessoryManagerSetDoubleTapAction_block_invoke_cold_1()
{
}

void BTAccessoryManagerSetDoubleTapActionEx_cold_2()
{
}

void __BTAccessoryManagerSetDoubleTapActionEx_block_invoke_cold_1()
{
}

void BTAccessoryManagerSetMicMode_cold_2()
{
}

void __BTAccessoryManagerSetMicMode_block_invoke_cold_1()
{
}

void BTAccessoryManagerRemoteTimeSyncEnable_cold_2()
{
}

void __BTAccessoryManagerRemoteTimeSyncEnable_block_invoke_cold_1()
{
}

void BTAccessoryManagerSensorStreamTimeSyncEnable_cold_2()
{
}

void __BTAccessoryManagerSensorStreamTimeSyncEnable_block_invoke_cold_1()
{
}

void BTAccessoryManagerSetInEarDetectionEnable_cold_2()
{
}

void __BTAccessoryManagerSetInEarDetectionEnable_block_invoke_cold_1()
{
}

void BTAccessoryManagerSetIsHidden_cold_2()
{
}

void __BTAccessoryManagerSetIsHidden_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetDoubleTapAction_cold_2()
{
}

void __BTAccessoryManagerGetDoubleTapAction_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetDoubleTapActionEx_cold_2()
{
}

void __BTAccessoryManagerGetDoubleTapActionEx_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetDoubleTapCapability_cold_2()
{
}

void __BTAccessoryManagerGetDoubleTapCapability_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetFeatureCapability_cold_2()
{
}

void __BTAccessoryManagerGetFeatureCapability_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetAnnounceMessagesSupport_cold_2()
{
}

void __BTAccessoryManagerGetAnnounceMessagesSupport_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetMicMode_cold_2()
{
}

void __BTAccessoryManagerGetMicMode_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetInEarDetectionEnable_cold_2()
{
}

void BTAccessoryManagerGetInEarStatus_cold_2()
{
}

void __BTAccessoryManagerGetInEarStatus_block_invoke_cold_1()
{
}

void BTAccessoryManagerRegisterCustomMessageClient_cold_3()
{
}

void BTAccessoryManagerRegisterCustomMessageClient_cold_4()
{
}

void __BTAccessoryManagerRegisterCustomMessageClient_block_invoke_cold_1()
{
}

void BTAccessoryManagerDeregisterCustomMessageClient_cold_3()
{
}

void __BTAccessoryManagerDeregisterCustomMessageClient_block_invoke_cold_1()
{
}

void BTAccessoryManagerSendCustomMessage_cold_2()
{
}

void __BTAccessoryManagerSendCustomMessage_block_invoke_cold_1()
{
}

void BTAccessoryManagerSendAdaptiveVolumeMessage_cold_2()
{
}

void BTAccessoryManagerSendPMEConfigMessage_cold_2()
{
}

void BTAccessoryManagerGetDeviceDiagnostics_cold_2()
{
}

void __BTAccessoryManagerGetDeviceDiagnostics_block_invoke_cold_1()
{
}

void BTAccessoryManagerSendRequestPeriodically_cold_2()
{
}

void __BTAccessoryManagerSendRequestPeriodically_block_invoke_cold_1()
{
}

void BTAccessoryManagerCancelRequestPeriodically_cold_2()
{
}

void __BTAccessoryManagerCancelRequestPeriodically_block_invoke_cold_1()
{
}

void BTAccessoryManagerSendControlCommand_cold_2()
{
}

void __BTAccessoryManagerSendControlCommand_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetControlCommand_cold_2()
{
}

void __BTAccessoryManagerGetControlCommand_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetSettingFeatureBitMask_cold_2()
{
}

void __BTAccessoryManagerGetSettingFeatureBitMask_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetAccessoryInfo_cold_2()
{
}

void __BTAccessoryManagerGetAccessoryInfo_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetAACPCapabilityBits_cold_2()
{
}

void __BTAccessoryManagerGetAACPCapabilityBits_block_invoke_cold_1()
{
}

void BTAccessoryManagerReadDeviceVersionInfo_cold_1()
{
}

void BTAccessoryManagerReadDeviceVersionInfo_cold_2()
{
}

void __BTAccessoryManagerReadDeviceVersionInfo_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetDeviceColor_cold_2()
{
}

void __BTAccessoryManagerGetDeviceColor_block_invoke_cold_1()
{
}

void BTAccessoryManagerSetupCommand_cold_2()
{
}

void __BTAccessoryManagerSetupCommand_block_invoke_cold_1()
{
}

void BTAccessoryManagerSendRelayMsg_cold_2()
{
}

void __BTAccessoryManagerSendRelayMsg_block_invoke_cold_1()
{
}

void BTAccessoryManagerUpdateConnPriorityList_cold_2()
{
}

void __BTAccessoryManagerUpdateConnPriorityList_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetNonAppleHAEPairedDevices_cold_1()
{
}

void BTAccessoryManagerGetNonAppleHAEPairedDevices_cold_2()
{
}

void __BTAccessoryManagerGetNonAppleHAEPairedDevices_block_invoke_cold_1()
{
  int v2 = 134218240;
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9( &dword_1870FD000,  v1,  (uint64_t)v1,  "kCBMsgIdAccessoryGetNonAppleHAEPairedDevicesMsg reply result:%llx count:%lx",  (uint8_t *)&v2);
  OUTLINED_FUNCTION_4();
}

void BTAccessoryManagerSmartRouteMode_cold_2()
{
}

void __BTAccessoryManagerSmartRouteMode_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetSmartRouteMode_cold_2()
{
}

void __BTAccessoryManagerGetSmartRouteMode_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetSmartRouteSupport_cold_2()
{
}

void __BTAccessoryManagerGetSmartRouteSupport_block_invoke_cold_1()
{
}

void BTAccessoryManagerSetDeviceStateOnPeerSrc_cold_2()
{
}

void __BTAccessoryManagerSetDeviceStateOnPeerSrc_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetStereoHFPSupport_cold_2()
{
}

void __BTAccessoryManagerGetStereoHFPSupport_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetCallManagementConfig_cold_1()
{
}

void BTAccessoryManagerGetFeatureProxCardStatus_cold_2()
{
}

void BTAccessoryManagerSetFeatureProxCardStatus_cold_2()
{
}

void __BTAccessoryManagerSetFeatureProxCardStatus_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetDeviceSoundProfileSupport_cold_2()
{
}

void __BTAccessoryManagerGetDeviceSoundProfileSupport_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetDeviceSoundProfileAllowed_cold_2()
{
}

void __BTAccessoryManagerGetDeviceSoundProfileAllowed_block_invoke_cold_1()
{
}

void BTAccessoryManagerSetDeviceSoundProfileAllowed_cold_2()
{
}

void __BTAccessoryManagerSetDeviceSoundProfileAllowed_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetSpatialAudioPlatformSupport_cold_2()
{
}

void BTAccessoryManagerGetAnnounceCallsSupport_cold_2()
{
}

void __BTAccessoryManagerGetAnnounceCallsSupport_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetGyroInformation_cold_2()
{
}

void __BTAccessoryManagerGetGyroInformation_block_invoke_cold_1()
{
  v2[0] = 136315394;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9(&dword_1870FD000, v0, v1, "%s reply result:%llx", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

void BTAccessoryManagerGetCaseSerialNumbersForAppleProductId_cold_2()
{
}

void __BTAccessoryManagerGetCaseSerialNumbersForAppleProductId_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetCaseSerialNumbersForAppleProductIds_cold_2()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_5();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl( &dword_1870FD000,  v1,  OS_LOG_TYPE_ERROR,  "Invalid product ID parameters. productID = %p, numProductIds = %u",  v2,  0x12u);
  OUTLINED_FUNCTION_4();
}

void BTAccessoryManagerGetCaseSerialNumbersForAppleProductIds_cold_3()
{
}

void __BTAccessoryManagerGetCaseSerialNumbersForAppleProductIds_block_invoke_cold_1()
{
}

void BTAccessoryManagerGetPrimaryBudSide_cold_2()
{
}

void __BTAccessoryManagerGetPrimaryBudSide_block_invoke_cold_1()
{
  v2[0] = 136315394;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9(&dword_1870FD000, v0, v1, "%s reply result:%llx", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

void __BTAccessoryManagerSetHeadphoneFeatureValue_block_invoke_cold_1()
{
}

void accessoryManagerXpcDisconnectedHandler_cold_1()
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_8();
  __int16 v4 = 2080;
  uint64_t v5 = v0;
  OUTLINED_FUNCTION_13( &dword_1870FD000,  v1,  v2,  "WARNING: accessoryManagerXpcDisconnectedHandler Disconnected from bluetoothd serviceName:%s sessionName:%s",  v3);
  OUTLINED_FUNCTION_4();
}

void attachSession_cold_1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_9(&dword_1870FD000, v0, (uint64_t)v0, "  attachSession reply session:%llx result:%llx", v1);
  OUTLINED_FUNCTION_4();
}

void attachSession_cold_2()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_9(&dword_1870FD000, v0, v1, "  attachSession service:%s, sessionName:%s", v2);
  OUTLINED_FUNCTION_4();
}

void sendMessageWithReplySync_cold_1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl( &dword_1870FD000,  v0,  OS_LOG_TYPE_DEBUG,  "MBFXPC LOG Failed to send sendMessageWithReplySync because of XPC ERROR: %s",  v1,  0xCu);
  OUTLINED_FUNCTION_4();
}

void sendMessageWithReplySync_cold_2()
{
}

void handleReset_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_9(&dword_1870FD000, v0, v1, "  handleReset service:%s, sessionName:%s", v2);
  OUTLINED_FUNCTION_4();
}

void handleInvalid_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_9(&dword_1870FD000, v0, v1, "  handleInvalid service:%s, sessionName:%s", v2);
  OUTLINED_FUNCTION_4();
}

void handleMsg_cold_1(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(*(void *)a2 + 24LL);
  int v4 = 136315650;
  uint64_t v5 = a1 + 2336;
  __int16 v6 = 2080;
  uint64_t v7 = a1 + 2080;
  __int16 v8 = 2080;
  uint64_t v9 = v3;
  OUTLINED_FUNCTION_5_0( &dword_1870FD000,  a3,  (uint64_t)a3,  "  handleMsg service:%s, sessionName:%s, msgId:%s",  (uint8_t *)&v4);
  OUTLINED_FUNCTION_11_0();
}

void handleConnectionEvent_cold_1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl( &dword_1870FD000,  v0,  OS_LOG_TYPE_FAULT,  "MBFXPC LOG Skipped handleConnectionEvent because MBXpcConnection for connection %p was NULL",  v1,  0xCu);
  OUTLINED_FUNCTION_4();
}

void handleConnectionEvent_cold_2()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9(&dword_1870FD000, v0, (uint64_t)v0, "MBFXPC LOG calling handleReset because %p %s", v1);
  OUTLINED_FUNCTION_4();
}

void handleConnectionEvent_cold_3()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9(&dword_1870FD000, v0, (uint64_t)v0, "MBFXPC LOG calling handleInvalid because XPC:%p %s", v1);
  OUTLINED_FUNCTION_4();
}

void handleConnectionEvent_cold_4()
{
}

void handleConnectionEvent_cold_5()
{
}

void handleConnectionEvent_cold_6()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_9(&dword_1870FD000, v0, v1, "handleConnectionEvent service:%s, sessionName:%s", v2);
  OUTLINED_FUNCTION_4();
}

void createXpcConnection_cold_1()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_5();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_9( &dword_1870FD000,  v1,  (uint64_t)v1,  "MBFXPC LOG ---------- MBFXPC BEGIN SESSION :%s XPC:%p ---------- ",  v2);
  OUTLINED_FUNCTION_4();
}

void createXpcConnection_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1870FD000, log, OS_LOG_TYPE_DEBUG, "MBFXPC LOG Device is not BT Capable.", v1, 2u);
}

void releaseMBXpcConnection_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_9(&dword_1870FD000, v0, v1, "---------- MBFXPC END SESSION :%s XPC:%p---------- ", v2);
  OUTLINED_FUNCTION_4();
}

void releaseXPCConnection_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0( &dword_1870FD000,  v0,  v1,  "MBFXPC LOG releasing Last XPC reference for :%s, sessionName:%s XPC:%p",  v2);
  OUTLINED_FUNCTION_11_0();
}

void sendMsg_cold_1()
{
}

void disconnect_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_1870FD000, v0, v1, "MBFXPC LOG disconnect service:%s, sessionName:%s fwSession:%llx", v2);
  OUTLINED_FUNCTION_11_0();
}

void BTDeviceAddressToString_cold_1()
{
}

void BTDeviceAddressToString_cold_2()
{
}

void __BTDeviceAddressToString_block_invoke_cold_1()
{
}

void BTDeviceAddressFromString_cold_2()
{
}

void BTDeviceAddressFromString_cold_3()
{
}

void __BTDeviceAddressFromString_block_invoke_cold_1()
{
  __int16 v8 = v0;
  int v9 = v1;
  __int16 v10 = v0;
  int v11 = v2;
  __int16 v12 = v0;
  int v13 = v3;
  __int16 v14 = v0;
  int v15 = v4;
  __int16 v16 = v0;
  int v17 = v5;
  _os_log_debug_impl( &dword_1870FD000,  v6,  OS_LOG_TYPE_DEBUG,  "kCBMsgIdDeviceAddressFromStringMsg reply result:%llx address:%x%x%x%x%x%x",  v7,  0x30u);
}

void BTDeviceFromAddress_cold_1()
{
}

void BTDeviceFromAddress_cold_2()
{
}

void __BTDeviceFromAddress_block_invoke_cold_1()
{
}

void BTDeviceFromIdentifier_cold_2()
{
}

void __BTDeviceFromIdentifier_block_invoke_cold_1()
{
}

void BTDeviceGetAddressString_cold_1()
{
}

void BTDeviceGetAddressString_cold_2()
{
}

void __BTDeviceGetAddressString_block_invoke_cold_1()
{
}

void BTDeviceGetDeviceType_cold_2()
{
}

void __BTDeviceGetDeviceType_block_invoke_cold_1()
{
}

void BTDeviceGetDeviceClass_cold_2()
{
}

void __BTDeviceGetDeviceClass_block_invoke_cold_1()
{
}

void BTDeviceGetDefaultName_cold_2()
{
}

void __BTDeviceGetDefaultName_block_invoke_cold_1()
{
}

void BTDeviceGetProductName_cold_2()
{
}

void __BTDeviceGetProductName_block_invoke_cold_1()
{
}

void BTDeviceGetName_cold_2()
{
}

void __BTDeviceGetName_block_invoke_cold_1()
{
}

void BTDeviceSetUserName_cold_2()
{
}

void __BTDeviceSetUserName_block_invoke_cold_1()
{
}

void BTDeviceGetSyncSettings_cold_2()
{
}

void __BTDeviceGetSyncSettings_block_invoke_cold_1()
{
}

void BTDeviceSetSyncSettings_cold_2()
{
}

void __BTDeviceSetSyncSettings_block_invoke_cold_1()
{
}

void BTDeviceGetGroups_cold_2()
{
}

void __BTDeviceGetGroups_block_invoke_cold_1()
{
}

void BTDeviceSetGroup_cold_2()
{
}

void __BTDeviceSetGroup_block_invoke_cold_1()
{
}

void BTDeviceGetPairingStatus_cold_2()
{
}

void __BTDeviceGetPairingStatus_block_invoke_cold_1()
{
}

void BTDeviceGetCloudPairingStatus_cold_2()
{
}

void __BTDeviceGetCloudPairingStatus_block_invoke_cold_1()
{
}

void BTDeviceGetMagicPairingStatus_cold_2()
{
}

void __BTDeviceGetMagicPairingStatus_block_invoke_cold_1()
{
}

void __BTDeviceGetConnectionStatus_block_invoke_cold_1()
{
}

void BTDeviceIsAppleAudioDevice_cold_2()
{
}

void __BTDeviceIsAppleAudioDevice_block_invoke_cold_1()
{
}

void BTDeviceSupportsHS_cold_2()
{
}

void __BTDeviceSupportsHS_block_invoke_cold_1()
{
}

void BTDeviceIsProController_cold_2()
{
}

void __BTDeviceIsProController_block_invoke_cold_1()
{
}

void BTServiceAddCallbacksWithFilter_cold_3()
{
}

void BTServiceAddCallbacksWithFilter_cold_4()
{
}

void BTServiceAddCallbacksWithFilter_cold_5()
{
}

void __BTServiceAddCallbacksWithFilter_block_invoke_cold_1()
{
}

void BTServiceAddCallbacks_cold_1()
{
}

void BTServiceRemoveCallbacks_cold_2()
{
}

void __BTServiceRemoveCallbacks_block_invoke_cold_1()
{
}

void BTDeviceConnect_cold_2()
{
}

void __BTDeviceConnect_block_invoke_cold_1()
{
}

void BTDeviceConnectServices_cold_2()
{
}

void __BTDeviceConnectServices_block_invoke_cold_1()
{
}

void BTDeviceConnectServicesWithParameters_cold_2()
{
}

void __BTDeviceConnectServicesWithParameters_block_invoke_cold_1()
{
}

void BTDeviceDisconnect_cold_2()
{
}

void __BTDeviceDisconnect_block_invoke_cold_1()
{
}

void BTDevicePhysicalLinkDisconnect_cold_2()
{
}

void __BTDevicePhysicalLinkDisconnect_block_invoke_cold_1()
{
}

void BTDeviceDisconnectServices_cold_2()
{
}

void __BTDeviceDisconnectServices_block_invoke_cold_1()
{
}

void BTDeviceGetConnectedServices_cold_2()
{
}

void __BTDeviceGetConnectedServices_block_invoke_cold_1()
{
}

void BTDeviceGetSupportedServices_cold_2()
{
}

void __BTDeviceGetSupportedServices_block_invoke_cold_1()
{
}

void BTDeviceSetServiceSettings_cold_2()
{
}

void __BTDeviceSetServiceSettings_block_invoke_cold_1()
{
}

void BTDeviceGetServiceSettings_cold_2()
{
}

void __BTDeviceGetServiceSettings_block_invoke_cold_1()
{
}

void BTDeviceGetComPortForService_cold_2()
{
}

void __BTDeviceGetComPortForService_block_invoke_cold_1()
{
}

void BTDeviceGetComPortForServiceWithSandboxExtension_cold_2()
{
}

void __BTDeviceGetComPortForServiceWithSandboxExtension_block_invoke_cold_1()
{
}

void BTDeviceSetVirtualType_cold_2()
{
}

void __BTDeviceSetVirtualType_block_invoke_cold_1()
{
}

void BTDeviceGetVirtualType_cold_2()
{
}

void __BTDeviceGetVirtualType_block_invoke_cold_1()
{
}

void BTDeviceMatchesAdvertisedKey_cold_2()
{
}

void __BTDeviceMatchesAdvertisedKey_block_invoke_cold_1()
{
}

void BTDeviceGetAdvertisedValueForKey_cold_2()
{
}

void __BTDeviceGetAdvertisedValueForKey_block_invoke_cold_1()
{
}

void BTDeviceGetDeviceId_cold_2()
{
}

void __BTDeviceGetDeviceId_block_invoke_cold_1()
{
}

void BTDeviceSetHIDProperties_cold_2()
{
}

void __BTDeviceSetHIDProperties_block_invoke_cold_1()
{
}

void BTDeviceConfigureLinkKey_cold_2()
{
}

void __BTDeviceConfigureLinkKey_block_invoke_cold_1()
{
}

void BTDeviceIsTemporaryPaired_cold_2()
{
}

void __BTDeviceIsTemporaryPaired_block_invoke_cold_1()
{
}

void BTDeviceIsWirelessSplitterSupported_cold_2()
{
}

void __BTDeviceIsWirelessSplitterSupported_block_invoke_cold_1()
{
}

void BTDeviceIsTemporaryPairedNotInContacts_cold_2()
{
}

void __BTDeviceIsTemporaryPairedNotInContacts_block_invoke_cold_1()
{
}

void BTDeviceGetLowSecurityStatus_cold_2()
{
}

void __BTDeviceGetLowSecurityStatus_block_invoke_cold_1()
{
}

void BTDeviceGetHIDDeviceBehavior_cold_2()
{
}

void __BTDeviceGetHIDDeviceBehavior_block_invoke_cold_1()
{
}

void BTDeviceSetHijackAudioRoute_cold_2()
{
}

void __BTDeviceSetHijackAudioRoute_block_invoke_cold_1()
{
}

void BTDeviceSetACLHighPriority_cold_2()
{
}

void __BTDeviceSetACLHighPriority_block_invoke_cold_1()
{
}

void BTDeviceIsMaster_cold_1()
{
}

void BTDeviceIsCentral_cold_2()
{
}

void __BTDeviceIsCentral_block_invoke_cold_1()
{
}

void BTDeviceGetUserSelectedDeviceType_cold_2()
{
}

void __BTDeviceGetUserSelectedDeviceType_block_invoke_cold_1()
{
}

void BTDeviceSetUserSelectedDeviceType_cold_2()
{
}

void __BTDeviceSetUserSelectedDeviceType_block_invoke_cold_1()
{
}

void BTDeviceIsGenuineAirPods_cold_2()
{
}

void __BTDeviceIsGenuineAirPods_block_invoke_cold_1()
{
}

void deviceServiceXpcDisconnectedHandler_cold_1()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_8();
  __int16 v3 = 2080;
  uint64_t v4 = v0;
  _os_log_error_impl( &dword_1870FD000,  v1,  OS_LOG_TYPE_ERROR,  "WARNING: deviceServiceXpcDisconnectedHandler Disconnected from bluetoothd serviceName:%s sessionName:%s",  v2,  0x16u);
  OUTLINED_FUNCTION_4();
}

void BTDiscoveryAgentCreate_cold_3()
{
}

void __BTDiscoveryAgentCreate_block_invoke_cold_1()
{
}

void BTDiscoveryAgentDestroy_cold_2()
{
}

void __BTDiscoveryAgentDestroy_block_invoke_cold_1()
{
}

void BTDiscoveryAgentStartScan_cold_2()
{
}

void __BTDiscoveryAgentStartScan_block_invoke_cold_1()
{
}

void BTDiscoveryAgentStartScanForAdvertizedData_cold_2()
{
}

void __BTDiscoveryAgentStartScanForAdvertizedData_block_invoke_cold_1()
{
}

void BTDiscoveryAgentStopScan_cold_2()
{
}

void __BTDiscoveryAgentStopScan_block_invoke_cold_1()
{
}

void BTDiscoveryAgentGetDevices_cold_2()
{
}

void __BTDiscoveryAgentGetDevices_block_invoke_cold_1()
{
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl( &dword_1870FD000,  v1,  OS_LOG_TYPE_DEBUG,  "kCBMsgIdDiscoveryAgentGetDevicesMsg reply result:%llx count:%lx",  v2,  0x16u);
  OUTLINED_FUNCTION_4();
}

void BTDiscoveryAgentAddKey_cold_2()
{
}

void BTDiscoveryAgentAddKey_cold_3()
{
}

void BTDiscoveryAgentAddKey_cold_4()
{
}

void __BTDiscoveryAgentAddKey_block_invoke_cold_1()
{
}

void BTDiscoveryAgentRemoveKey_cold_4()
{
}

void discoveryAgentXpcDisconnectedHandler_cold_1()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_8();
  __int16 v3 = 2080;
  uint64_t v4 = v0;
  _os_log_error_impl( &dword_1870FD000,  v1,  OS_LOG_TYPE_ERROR,  "WARNING: discoveryAgentXpcDisconnectedHandler Disconnected from bluetoothd serviceName:%s sessionName:%s",  v2,  0x16u);
  OUTLINED_FUNCTION_4();
}

void BTLocalDeviceGetDefault_cold_1()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_5();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_13( &dword_1870FD000,  v1,  (uint64_t)v1,  "Failed to get a valid XPC connection for session %llx sessionHandle:%llx",  v2);
  OUTLINED_FUNCTION_4();
}

void BTLocalDeviceGetDefault_cold_2()
{
}

void __BTLocalDeviceGetDefault_block_invoke_cold_1()
{
  *(_DWORD *)uint64_t v3 = 134218240;
  *(void *)&v3[4] = v1;
  *(_WORD *)&uint8_t v3[12] = 2048;
  *(void *)&v3[14] = *(void *)(*(void *)(*(void *)v0 + 8LL) + 24LL);
  OUTLINED_FUNCTION_9_0( &dword_1870FD000,  v0,  v2,  "kCBMsgIdLocalDeviceGetDefaultMsg reply deviceID:%llx result:%llx",  *(void *)v3,  *(void *)&v3[8]);
  OUTLINED_FUNCTION_4();
}

void BTLocalDeviceAddCallbacks_cold_4()
{
}

void __BTLocalDeviceAddCallbacks_block_invoke_cold_1()
{
}

void BTLocalDeviceRemoveCallbacks_cold_2()
{
}

void __BTLocalDeviceRemoveCallbacks_block_invoke_cold_1()
{
}

void BTLocalDeviceMaskCallbacks_cold_2()
{
}

void __BTLocalDeviceMaskCallbacks_block_invoke_cold_1()
{
}

void BTLocalDeviceSetModulePower_cold_2()
{
}

void __BTLocalDeviceSetModulePower_block_invoke_cold_1()
{
}

void BTLocalDeviceGetModulePower_cold_2()
{
}

void __BTLocalDeviceGetSpatialPlatformSupport_block_invoke_cold_1()
{
}

void __BTLocalDevicePowerReset_block_invoke_cold_1()
{
}

void __BTLocalDeviceGetAirplaneModeStatus_block_invoke_cold_1()
{
}

void BTLocalDeviceGetAddressString_cold_2()
{
}

void __BTLocalDeviceGetAddressString_block_invoke_cold_1()
{
}

void BTLocalDeviceGetName_cold_2()
{
}

void __BTLocalDeviceGetName_block_invoke_cold_1()
{
}

void __BTLocalDeviceSetDiscoverable_block_invoke_cold_1()
{
}

void __BTLocalDeviceGetDiscoverable_block_invoke_cold_1()
{
}

void __BTLocalDeviceSetConnectable_block_invoke_cold_1()
{
}

void __BTLocalDeviceGetConnectable_block_invoke_cold_1()
{
}

void __BTLocalDeviceGetPairingStatus_block_invoke_cold_1()
{
}

void BTLocalDeviceGetPairedDevices_cold_2()
{
}

void __BTLocalDeviceGetPairedDevices_block_invoke_cold_1()
{
}

void __BTLocalDeviceGetConnectionStatus_block_invoke_cold_1()
{
}

void BTLocalDeviceGetConnectedDevices_cold_2()
{
}

void __BTLocalDeviceGetConnectedDevices_block_invoke_cold_1()
{
}

void BTLocalDeviceGetConnectingDevices_cold_2()
{
}

void __BTLocalDeviceGetConnectingDevices_block_invoke_cold_1()
{
}

void __BTLocalDeviceGetAdvertisingStatus_block_invoke_cold_1()
{
}

void __BTLocalDeviceGetScanning_block_invoke_cold_1()
{
}

void __BTLocalDeviceGetDUTModeEnabled_block_invoke_cold_1()
{
}

void __BTLocalDeviceEnableLeTxTestMode_block_invoke_cold_1()
{
}

void __BTLocalDeviceEnableLeRxTestMode_block_invoke_cold_1()
{
}

void __BTLocalDeviceDisableLeTestMode_block_invoke_cold_1()
{
}

void __BTLocalDeviceSupportsService_block_invoke_cold_1()
{
}

void BTLocalDeviceAdvertiseData_cold_1()
{
}

void __BTLocalDeviceAdvertiseData_block_invoke_cold_1()
{
}

void __BTLocalDeviceRemoveData_block_invoke_cold_1()
{
}

void BTLocalDeviceRegisterForPowerUpdates_cold_4()
{
}

void __BTLocalDeviceRegisterForPowerUpdates_block_invoke_cold_1()
{
}

void BTLocalDeviceUnregisterForPowerUpdates_cold_2()
{
}

void __BTLocalDeviceUnregisterForPowerUpdates_block_invoke_cold_1()
{
}

void BTLocalDeviceReadPowerConsumption_cold_2()
{
}

void __BTLocalDeviceReadPowerConsumption_block_invoke_cold_1()
{
}

void BTLocalDeviceRegisterForPowerProfileStatistics_cold_4()
{
}

void __BTLocalDeviceRegisterForPowerProfileStatistics_block_invoke_cold_1()
{
}

void BTLocalDeviceUnregisterForPowerProfileStatistics_cold_2()
{
}

void __BTLocalDeviceUnregisterForPowerProfileStatistics_block_invoke_cold_1()
{
}

void BTLocalDeviceReadPowerProfileStatistics_cold_2()
{
}

void __BTLocalDeviceReadPowerProfileStatistics_block_invoke_cold_1()
{
}

void BTLocalDeviceReadEnhancedPowerProfileStatistics_cold_2()
{
}

void __BTLocalDeviceReadEnhancedPowerProfileStatistics_block_invoke_cold_1()
{
}

void BTLocalDeviceReadTransportSwitchStatistics_cold_2()
{
}

void __BTLocalDeviceReadTransportSwitchStatistics_block_invoke_cold_1()
{
}

void BTLocalDeviceReadDetailedPowerProfileStatistics_cold_2()
{
}

void __BTLocalDeviceReadDetailedPowerProfileStatistics_block_invoke_cold_1()
{
}

void BTStartHCITraces_cold_2()
{
}

void __BTStartHCITraces_block_invoke_cold_1()
{
}

void BTStopHCITraces_cold_2()
{
}

void __BTStopHCITraces_block_invoke_cold_1()
{
}

void BTLocalDeviceShowPowerPrompt_cold_2()
{
}

void __BTLocalDeviceShowPowerPrompt_block_invoke_cold_1()
{
}

void BTLocalDeviceSetAFHMap_cold_2()
{
}

void __BTLocalDeviceSetAFHMap_block_invoke_cold_1()
{
}

void BTLocalDeviceReadAFHMap_cold_2()
{
}

void __BTLocalDeviceReadAFHMap_block_invoke_cold_1()
{
}

void BTLocalDeviceSetDelayedWake_cold_2()
{
}

void __BTLocalDeviceSetDelayedWake_block_invoke_cold_1()
{
}

void BTLocalDeviceSetDenylistEnabled_cold_1()
{
}

void BTLocalDeviceSetDenylistEnabled_cold_2()
{
}

void __BTLocalDeviceSetDenylistEnabled_block_invoke_cold_1()
{
}

void BTLocalDeviceGetDenylistEnabled_cold_2()
{
}

void __BTLocalDeviceGetDenylistEnabled_block_invoke_cold_1()
{
}

void BTLocalDeviceGetDeviceNamesThatMayBeDenylisted_cold_2()
{
}

void __BTLocalDeviceGetDeviceNamesThatMayBeDenylisted_block_invoke_cold_1()
{
}

void BTLocalDeviceGetSharingAddresses_cold_2()
{
}

void __BTLocalDeviceGetSharingAddresses_block_invoke_cold_1()
{
}

void BTLocalDeviceIsSharingEnabled_cold_2()
{
}

void __BTLocalDeviceIsSharingEnabled_block_invoke_cold_1()
{
}

void BTLocalDeviceDumpExposureNotificationDatabase_cold_2()
{
}

void __BTLocalDeviceDumpExposureNotificationDatabase_block_invoke_cold_1()
{
}

void BTLocalDeviceLinkQualityGetData_cold_2()
{
}

void __BTLocalDeviceLinkQualityGetData_block_invoke_cold_1()
{
}

void __BTLocalDeviceSetCallScreening_block_invoke_cold_1()
{
}

void localDeviceXpcDisconnectedHandler_cold_1()
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_8();
  __int16 v4 = 2080;
  uint64_t v5 = v0;
  OUTLINED_FUNCTION_13( &dword_1870FD000,  v1,  v2,  "WARNING: localDeviceXpcDisconnectedHandler Disconnected from bluetoothd serviceName:%s sessionName:%s",  v3);
  OUTLINED_FUNCTION_4();
}

void BTPairingAgentCreate_cold_4()
{
}

void __BTPairingAgentCreate_block_invoke_cold_1()
{
}

void BTPairingAgentDestroy_cold_1()
{
}

void BTPairingAgentDestroy_cold_2()
{
}

void __BTPairingAgentDestroy_block_invoke_cold_1()
{
}

void BTPairingAgentStart_cold_2()
{
}

void __BTPairingAgentStart_block_invoke_cold_1()
{
}

void BTPairingAgentStop_cold_2()
{
}

void __BTPairingAgentStop_block_invoke_cold_1()
{
}

void BTPairingAgentCancelPairing_cold_2()
{
}

void __BTPairingAgentCancelPairing_block_invoke_cold_1()
{
}

void BTPairingAgentSetPincode_cold_2()
{
}

void __BTPairingAgentSetPincode_block_invoke_cold_1()
{
}

void BTPairingAgentAcceptSSP_cold_2()
{
}

void __BTPairingAgentAcceptSSP_block_invoke_cold_1()
{
}

void BTPairingAgentDeletePairedDevice_cold_2()
{
}

void __BTPairingAgentDeletePairedDevice_block_invoke_cold_1()
{
}

void BTPairingAgentSetIOCapability_cold_2()
{
}

void __BTPairingAgentSetIOCapability_block_invoke_cold_1()
{
}

void BTPairingAgentClearOOBDataForDevice_cold_2()
{
}

void __BTPairingAgentClearOOBDataForDevice_block_invoke_cold_1()
{
}

void BTPairingAgentSetOOBDataForDevice_cold_2()
{
}

void __BTPairingAgentSetOOBDataForDevice_block_invoke_cold_1()
{
}

void BTPairingAgentGetLocalOOBData_cold_2()
{
}

void __BTPairingAgentGetLocalOOBData_block_invoke_cold_1()
{
}

void pairingAgentXpcDisconnectedHandler_cold_1()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_8();
  __int16 v3 = 2080;
  uint64_t v4 = v0;
  _os_log_error_impl( &dword_1870FD000,  v1,  OS_LOG_TYPE_ERROR,  "WARNING: pairingAgentXpcDisconnectedHandler Disconnected from bluetoothd serviceName:%s sessionName:%s",  v2,  0x16u);
  OUTLINED_FUNCTION_4();
}

void pairingAgentXpcMsgHandler_cold_1()
{
}

void pairingAgentXpcMsgHandler_cold_2()
{
}

void pairingAgentXpcMsgHandler_cold_3()
{
}

void pairingAgentXpcMsgHandler_cold_4()
{
}

void _MBTGetAsyncAttachQueue_cold_1()
{
  OUTLINED_FUNCTION_9_0( &dword_1870FD000,  v0,  v1,  "_MBTGetAsyncAttachQueue session:%p queue:%p returning main queue",  v2,  v3);
  OUTLINED_FUNCTION_4();
}

void _MBTGetAsyncAttachQueue_cold_2()
{
  OUTLINED_FUNCTION_9_0( &dword_1870FD000,  v0,  v1,  "_MBTGetAsyncAttachQueue session:%p queue:%p returning client queue",  v2,  v3);
  OUTLINED_FUNCTION_4();
}

void _MBTGetAsyncAttachQueue_cold_3()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9(&dword_1870FD000, v0, v1, "_MBTGetAsyncAttachQueue session:%p queue:%p", v2);
  OUTLINED_FUNCTION_4();
}

void _MBTAsyncAttach_cold_1()
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_5();
  __int16 v4 = 2080;
  uint64_t v5 = v0;
  __int16 v6 = 1024;
  int v7 = v1;
  _os_log_debug_impl( &dword_1870FD000,  v2,  OS_LOG_TYPE_DEBUG,  "_MBTAsyncAttach previous session found:%llx, disconnecting %s and retrying. xpcConnection is NULL:%d",  v3,  0x1Cu);
}

void _MBTAsyncAttach_cold_2()
{
}

void _MBTAsyncAttach_cold_3()
{
}

void BTSessionDetachWithQueue_cold_1()
{
}

void BTSessionDetachWithQueue_cold_2()
{
}

void notifyStubsOfDisconnection_cold_1()
{
}

void _MBTDispachAsyncAttachCompletionBlock_cold_1()
{
}

void _MBTDispachAsyncAttachCompletionBlock_cold_2()
{
}

void _MBTDispachAsyncAttachCompletionBlock_cold_3()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9(&dword_1870FD000, v0, v1, "_MBTDispachAsyncAttachCompletionBlock session %llx queue:%p", v2);
  OUTLINED_FUNCTION_4();
}

void _MBTSignalSessionEvent_cold_1()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_5();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl( &dword_1870FD000,  v1,  OS_LOG_TYPE_DEBUG,  "_MBTSignalSessionEvent Session : %llx Event:%d",  v2,  0x12u);
  OUTLINED_FUNCTION_4();
}

void xpcConnectionDidReset_cold_1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl( &dword_1870FD000,  v0,  OS_LOG_TYPE_ERROR,  "MBFXPC LOG Skipped xpcConnectionDidReset because fwSession for connection %p was NULL",  v1,  0xCu);
  OUTLINED_FUNCTION_4();
}

void xpcConnectionDidReset_cold_2()
{
}

void xpcConnectionDidReset_cold_3()
{
}

void xpcConnectionInvalid_cold_1()
{
}

void xpcConnectionInvalid_cold_2()
{
}

void __xpcConnectionInvalid_block_invoke_cold_1()
{
}

void __xpcConnectionInvalid_block_invoke_cold_2()
{
}

void __xpcConnectionInvalid_block_invoke_cold_3()
{
}

void __xpcConnectionInvalid_block_invoke_cold_4()
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x189608560](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608590](name);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x189613710]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

void dispatch_after_f(dispatch_time_t when, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class( dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD78](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2( const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD90](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1895FAD98](queue);
}

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return MEMORY[0x1895FADA0](queue, relative_priority_ptr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

double exp2(double a1)
{
  return result;
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1895FD068](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0B0](__dst, __source, __size);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FD7D8](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1895FD808](xarray);
}

const void *__cdecl xpc_array_get_data(xpc_object_t xarray, size_t index, size_t *length)
{
  return (const void *)MEMORY[0x1895FD810](xarray, index, length);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1895FD840](xarray, index);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1895FD848](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1895FD860](xarray, index);
}

void xpc_array_set_data(xpc_object_t xarray, size_t index, const void *bytes, size_t length)
{
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return (void *)MEMORY[0x1895FD980](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1895FD9F0](connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1895FDA70](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDBD0](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBE8](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1895FDC00](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC50](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

void xpc_release(xpc_object_t object)
{
}