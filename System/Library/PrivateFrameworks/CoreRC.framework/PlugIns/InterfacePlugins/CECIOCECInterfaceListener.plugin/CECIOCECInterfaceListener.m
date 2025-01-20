}

id sub_1F40(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_2AE0;
  v3[3] = &unk_41B0;
  v3[4] = a2;
  v3[5] = a1;
  return [a2 dispatchAsyncHighPriority:v3];
}

id sub_1F94(int a1, _BYTE *__src, void *a3)
{
  if (gLogCategory_CoreRCInterface <= 10
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 10LL)))
  {
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  char v5 = (__src[16] & 0xF) + 1;
  memcpy(&__dst, __src, (__src[16] & 0xF) + 1LL);
  LOBYTE(v10) = v5;
  __int128 v7 = __dst;
  int v8 = v10;
  return [a3 receivedFrame:&v7];
}

id sub_209C(uint64_t a1, char a2, char a3, __int16 a4, void *a5)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_2AEC;
  v6[3] = &unk_41D8;
  v6[4] = a5;
  __int16 v7 = a4;
  char v8 = a2;
  char v9 = a3;
  return [a5 dispatchAsyncHighPriority:v6];
}

id sub_20FC(uint64_t a1)
{
  uint64_t v10 = 0LL;
  unsigned __int8 v9 = 0;
  if ((objc_msgSend( *(id *)(a1 + 32),  "setHardwareAddressMask:error:",  objc_msgSend(*(id *)(a1 + 32), "addressMask"),  &v10) & 1) == 0 && gLogCategory_CoreRCInterface <= 90 && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 90)))
  {
    uint64_t v5 = v10;
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  uint64_t CECSnoopingEnabled = IOCECInterfaceGetCECSnoopingEnabled(*(void *)(*(void *)(a1 + 32) + 32LL), &v9);
  if (!(_DWORD)CECSnoopingEnabled) {
    return objc_msgSend(*(id *)(a1 + 32), "setSnoopingMode:error:", v9, 0, v5, v7, v8);
  }
  unsigned __int8 v9 = 0;
  if (gLogCategory_CoreRCInterface > 60) {
    return objc_msgSend(*(id *)(a1 + 32), "setSnoopingMode:error:", v9, 0, v5, v7, v8);
  }
  uint64_t v3 = CECSnoopingEnabled;
  uint64_t v6 = *(void *)(a1 + 32);
  LogPrintF(&gLogCategory_CoreRCInterface);
  return objc_msgSend( *(id *)(a1 + 32),  "setSnoopingMode:error:",  v9,  0,  v6,  "-[CECIOCECInterface _open]_block_invoke",  v3);
}

id sub_2238(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interfaceTerminated:*(void *)(*(void *)(a1 + 32) + 32)];
}

id sub_2AE0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interfaceTerminated:*(void *)(a1 + 40)];
}

id sub_2AEC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStatusWithPhysicalAddress:*(unsigned __int16 *)(a1 + 40) HPD:*(unsigned __int8 *)(a1 + 42) hibernate:*(unsigned __int8 *)(a1 + 43)];
}

id sub_2C80(uint64_t a1, uint64_t a2, void *a3)
{
  if (gLogCategory_CoreRCInterface <= 50
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 50LL)))
  {
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  return [a3 addIOCECInterface:a2];
}

id objc_msgSend_setSnoopingMode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSnoopingMode:error:");
}