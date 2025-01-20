uint64_t DPFUSessionGetTypeID()
{
  uint64_t result;
  result = __kDPFUSessionTypeID;
  if (!__kDPFUSessionTypeID)
  {
    pthread_once(&__DPFUSessionTypeInit, (void (*)(void))__DPFUSessionRegister);
    return __kDPFUSessionTypeID;
  }

  return result;
}

uint64_t __DPFUSessionRegister()
{
  uint64_t result = _CFRuntimeRegisterClass(&__DPFUSessionClass);
  __kDPFUSessionTypeID = result;
  return result;
}

uint64_t DPFUSessionCreate(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t v3 = 0LL;
  if (a3 >= 3) {
    v4 = 0LL;
  }
  else {
    v4 = (char *)&__DPFUProtocolInfo + 24 * a3;
  }
  if (a2 && a3 <= 2)
  {
    if (!__kDPFUSessionTypeID) {
      pthread_once(&__DPFUSessionTypeInit, (void (*)(void))__DPFUSessionRegister);
    }
    uint64_t Instance = _CFRuntimeCreateInstance(a1);
    uint64_t v3 = Instance;
    if (Instance)
    {
      *(void *)(Instance + 48) = 0LL;
      *(_OWORD *)(Instance + 16) = 0u;
      *(_OWORD *)(Instance + 32) = 0u;
      *(void *)(Instance + 16) = a2;
      *(void *)(Instance + 24) = v4;
      *(_DWORD *)(Instance + 48) = 5;
      *(_BYTE *)(Instance + 53) = 1;
      CFRetain(a2);
    }
  }

  return v3;
}

uint64_t DPFUSessionSetProgressCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 32) = a2;
  *(void *)(result + 40) = a3;
  return result;
}

double DPFUSessionGetDeviceInfo(uint64_t a1, uint64_t a2)
{
  if (!IODPDeviceReadDPCD(*(void *)(a1 + 16), 1280LL, &v4, 12LL))
  {
    double result = v4;
    *(double *)a2 = v4;
    *(_DWORD *)(a2 + 8) = v5;
  }

  return result;
}

uint64_t DPFUSessionSetRestartAfterUpdate(uint64_t result, char a2)
{
  *(_BYTE *)(result + 53) = a2;
  return result;
}

uint64_t DPFUSessionSetExpectDeviceTerminationUponRestart(uint64_t result, char a2)
{
  *(_BYTE *)(result + 54) = a2;
  return result;
}

uint64_t DPFUSessionEnterUpdateMode(uint64_t a1)
{
  uint64_t result = __DPFUDeviceSetProperty(*(void *)(a1 + 16), (uint64_t)@"UpdateMode", (uint64_t)kCFBooleanTrue);
  if (!(_DWORD)result)
  {
    uint64_t result = __DPFUDeviceSetProperty(*(void *)(a1 + 16), (uint64_t)@"Updated", (uint64_t)kCFBooleanFalse);
    if (!(_DWORD)result)
    {
      uint64_t result = __DPFUSessionWrite(a1, 768, (uint64_t)&kAppleOUI, 3u);
      if (!(_DWORD)result)
      {
        uint64_t v3 = (_BYTE *)(a1 + 52);
        uint64_t result = __DPFUSessionGetMode(a1, (_BYTE *)(a1 + 52));
        if (!(_DWORD)result)
        {
          unsigned int v10 = *v3;
          if (v10 > 0x77)
          {
            if (v10 == 120)
            {
              v11 = "Eight-Byte Update Mode";
              goto LABEL_16;
            }

            if (v10 == 127)
            {
              v11 = "32-KByte Update Mode";
              goto LABEL_16;
            }
          }

          else
          {
            if (!*v3)
            {
              v11 = "Normal Mode";
              goto LABEL_16;
            }

            if (v10 == 113)
            {
              v11 = "Single-Byte Update Mode";
LABEL_16:
              __DPFULog(6, "Initial Device Mode: %s (0x%02x)", v4, v5, v6, v7, v8, v9, (char)v11);
              return 0LL;
            }
          }

          v11 = "Unknown Mode";
          goto LABEL_16;
        }
      }
    }
  }

  return result;
}

uint64_t __DPFUDeviceSetProperty(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 3758097088LL;
  if (!a1) {
    return 3758097101LL;
  }
  uint64_t AVDevice = IODPDeviceGetAVDevice();
  if (AVDevice) {
    return IOAVDeviceSetProperty(AVDevice, a2, a3);
  }
  return v3;
}

uint64_t __DPFUSessionWrite(uint64_t a1, int a2, uint64_t a3, unsigned int a4)
{
  if (!a4) {
    return 0LL;
  }
  for (unsigned int i = 0; i < a4; i += v9)
  {
    if (a4 - i >= 0x1000) {
      uint64_t v9 = 4096LL;
    }
    else {
      uint64_t v9 = a4 - i;
    }
    uint64_t v10 = IODPDeviceWriteDPCD(*(void *)(a1 + 16), i + a2, a3 + i, v9);
    uint64_t v11 = v10;
    if ((_DWORD)v10 && (*(_DWORD *)(a1 + 48) & 0x80000000) == 0)
    {
      mach_error_string(v10);
      __DPFULog( 0,  "Error writing to device address 0x%08x offset 0x%08x: %s (0x%08x)",  v12,  v13,  v14,  v15,  v16,  v17,  a2);
    }
  }

  return v11;
}

uint64_t __DPFUSessionGetMode(uint64_t a1, _BYTE *a2)
{
  char v12 = 0;
  if (!a2) {
    return 3758097090LL;
  }
  uint64_t result = __DPFUSessionRead(a1, 1293LL, (uint64_t)&v12);
  if (!(_DWORD)result)
  {
    if (*(int *)(a1 + 48) >= 7)
    {
      if (v12 < 0) {
        uint64_t v11 = "Requesting ";
      }
      else {
        uint64_t v11 = "";
      }
      __DPFULog(7, "Current Device Mode: %s%s (0x%02x)", v5, v6, v7, v8, v9, v10, (char)v11);
    }

    uint64_t result = 0LL;
    *a2 = v12;
  }

  return result;
}

void __DPFULog( int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (isatty(2))
  {
    fputs("dpfu: ", __stderrp);
    vfprintf(__stderrp, a2, &a9);
    fputc(10, __stderrp);
  }

  else
  {
    vsyslog(a1, a2, &a9);
  }
}

const char *DPFUGetDeviceModeString(int a1)
{
  if (a1 > 119)
  {
    if (a1 != 120)
    {
      if (a1 == 127) {
        return "32-KByte Update Mode";
      }
      return "Unknown Mode";
    }

    return "Eight-Byte Update Mode";
  }

  else
  {
    if (a1)
    {
      if (a1 == 113) {
        return "Single-Byte Update Mode";
      }
      return "Unknown Mode";
    }

    return "Normal Mode";
  }

uint64_t DPFUSessionLeaveUpdateMode(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 54)) {
    return 0LL;
  }
  else {
    return __DPFUDeviceSetProperty(*(void *)(a1 + 16), (uint64_t)@"UpdateMode", (uint64_t)kCFBooleanFalse);
  }
}

uint64_t dpfuUpdateDeviceWithContentsOfFile( const char *a1, unsigned int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  char v12 = (const void *)IODPDeviceCreate(kCFAllocatorDefault);
  uint64_t v13 = DPFUSessionCreate((uint64_t)kCFAllocatorDefault, v12, a2);
  CFRelease(v12);
  if (v13)
  {
    *(void *)(v13 + 32) = a5;
    *(void *)(v13 + 40) = a6;
    uint64_t updated = DPFUSessionEnterUpdateMode(v13);
    if ((_DWORD)updated)
    {
      uint64_t v26 = updated;
    }

    else
    {
      uint64_t v26 = DPFUSessionInstallFilePayload(v13, a1, a3, v21, v22, v23, v24, v25);
      if (a4 && !*(_BYTE *)(v13 + 54)) {
        __DPFUDeviceSetProperty(*(void *)(v13 + 16), (uint64_t)@"UpdateMode", (uint64_t)kCFBooleanFalse);
      }
    }

    CFRelease((CFTypeRef)v13);
  }

  else
  {
    uint64_t v26 = 3758097136LL;
    if ((MEMORY[0x30] & 0x80000000) == 0) {
      __DPFULog(0, "Can't create device update session", v14, v15, v16, v17, v18, v19, v28);
    }
  }

  return v26;
}

uint64_t DPFUSessionInstallFilePayload( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a3;
  uint64_t v11 = *(void *)(a1 + 24);
  if ((*(_DWORD *)(a1 + 48) & 0x80000000) == 0) {
    __DPFULog(0, "DPFUSessionInstallFilePayload( %s)", a3, a4, a5, a6, a7, a8, (char)a2);
  }
  uint64_t v12 = 3758097136LL;
  uint64_t v13 = calloc(1uLL, *(unsigned int *)(v11 + 8));
  if (!v13) {
    return 3758097085LL;
  }
  v20 = v13;
  uint64_t v21 = fopen(a2, "rb");
  int v28 = *(_DWORD *)(a1 + 48);
  if (!v21)
  {
    if (v28 >= 5) {
      __DPFULog(5, "  Error opening file: %s", v22, v23, v24, v25, v26, v27, (char)a2);
    }
    goto LABEL_26;
  }

  v29 = v21;
  if (v28 >= 5) {
    __DPFULog(5, "  Successfully opened %s", v22, v23, v24, v25, v26, v27, (char)a2);
  }
  uint64_t v30 = __DPFUSessionPrepareForDownload(a1);
  if ((_DWORD)v30)
  {
LABEL_30:
    uint64_t v12 = v30;
    goto LABEL_24;
  }

  uint64_t v43 = 0LL;
  if (feof(v29))
  {
LABEL_21:
    uint64_t v30 = __DPFUSessionFinishDownload(a1, v43, v37, v38, v39, v40, v41, v42);
    if (!(_DWORD)v30)
    {
      uint64_t v30 = __DPFUSessionInstallUpdate(a1, v52, v31, v32, v33, v34, v35, v36);
      if (!(_DWORD)v30)
      {
        uint64_t v12 = __DPFUSessionFinishUpdate(a1, v8, v31, v32, v33, v34, v35, v36);
        if ((_DWORD)v12) {
          goto LABEL_24;
        }
        goto LABEL_25;
      }
    }

    goto LABEL_30;
  }

  while (1)
  {
    size_t v44 = fread(v20, 1uLL, *(unsigned int *)(v11 + 8), v29);
    if (v44 != *(_DWORD *)(v11 + 8) && !feof(v29) && *(int *)(a1 + 48) >= 7) {
      __DPFULog( 7,  "Warning: attempted to read %u bytes, fread returned %lu",  v45,  v46,  v47,  v48,  v49,  v50,  *(_DWORD *)(v11 + 8));
    }
    if (!v44) {
      goto LABEL_20;
    }
    uint64_t v51 = __DPFUSessionDownloadData(a1, (uint64_t)v20, v44);
    if ((_DWORD)v51) {
      break;
    }
    uint64_t v43 = (v43 + v44);
    __DPFUSessionUpdateProgress(a1, v43, 0LL, v32, v33, v34, v35, v36);
LABEL_20:
    if (feof(v29)) {
      goto LABEL_21;
    }
  }

  uint64_t v12 = v51;
LABEL_24:
  __DPFUSessionRequestMode(a1, 0, v31, v32, v33, v34, v35, v36);
LABEL_25:
  fclose(v29);
LABEL_26:
  free(v20);
  return v12;
}

uint64_t __DPFUSessionPrepareForDownload(uint64_t a1)
{
  v2 = *(_BYTE **)(a1 + 24);
  uint64_t Status = __DPFUSessionGetStatus(a1, (char *)&v60);
  if ((_DWORD)Status) {
    return Status;
  }
  int v10 = v60;
  if (*(int *)(a1 + 48) >= 6)
  {
    char v11 = DPFUGetDeviceStatusString(v60);
    __DPFULog(6, "Initial Device Status: %s (0x%02x)", v12, v13, v14, v15, v16, v17, v11);
  }

  int v18 = *(unsigned __int8 *)(a1 + 52);
  int v19 = *v2;
  if (v18 == v19 && v10 == 2)
  {
    if (*(unsigned __int8 *)(a1 + 52) > 0x77u)
    {
      if (v18 == 120)
      {
        uint64_t v22 = "Eight-Byte Update Mode";
        goto LABEL_42;
      }

      if (v18 == 127)
      {
        uint64_t v22 = "32-KByte Update Mode";
        goto LABEL_42;
      }
    }

    else
    {
      if (!*(_BYTE *)(a1 + 52))
      {
        uint64_t v22 = "Normal Mode";
        goto LABEL_42;
      }

      if (v18 == 113)
      {
        uint64_t v22 = "Single-Byte Update Mode";
LABEL_42:
        __DPFULog(6, "Device already in %s", v4, v5, v6, v7, v8, v9, (char)v22);
        goto LABEL_76;
      }
    }

    uint64_t v22 = "Unknown Mode";
    goto LABEL_42;
  }

  if (*v2 > 0x77u)
  {
    if (v19 == 120)
    {
      uint64_t v21 = "Eight-Byte Update Mode";
      goto LABEL_28;
    }

    if (v19 == 127)
    {
      uint64_t v21 = "32-KByte Update Mode";
      goto LABEL_28;
    }

LABEL_27:
    uint64_t v21 = "Unknown Mode";
    goto LABEL_28;
  }

  if (!*v2)
  {
    uint64_t v21 = "Normal Mode";
    goto LABEL_28;
  }

  if (v19 != 113) {
    goto LABEL_27;
  }
  uint64_t v21 = "Single-Byte Update Mode";
LABEL_28:
  __DPFULog(5, "Requesting %s...", v4, v5, v6, v7, v8, v9, (char)v21);
  int v19 = *v2;
LABEL_29:
  uint64_t Status = __DPFUSessionRequestMode(a1, v19, v4, v5, v6, v7, v8, v9);
  if ((_DWORD)Status) {
    return Status;
  }
  do
  {
    uint64_t Status = __DPFUSessionGetMode(a1, &v59);
    if ((_DWORD)Status) {
      return Status;
    }
    usleep(0x3E8u);
    int v29 = v59;
  }

  while ((v59 & 0x80) != 0);
  if (*(int *)(a1 + 48) >= 6)
  {
    if (v59 > 0x77u)
    {
      if (v59 == 120)
      {
        uint64_t v30 = "Eight-Byte Update Mode";
        goto LABEL_46;
      }

      if (v59 == 127)
      {
        uint64_t v30 = "32-KByte Update Mode";
        goto LABEL_46;
      }
    }

    else
    {
      if (!v59)
      {
        uint64_t v30 = "Normal Mode";
        goto LABEL_46;
      }

      if (v59 == 113)
      {
        uint64_t v30 = "Single-Byte Update Mode";
LABEL_46:
        __DPFULog(6, "  New Mode: %s (0x%02x)", v23, v24, v25, v26, v27, v28, (char)v30);
        int v29 = v59;
        goto LABEL_47;
      }
    }

    uint64_t v30 = "Unknown Mode";
    goto LABEL_46;
  }

LABEL_47:
  int v31 = v29;
  if (!v29)
  {
    unsigned int v32 = *v2;
    if (v32 > 0x77)
    {
      if (v32 == 120)
      {
        uint64_t v33 = "Eight-Byte Update Mode";
        goto LABEL_59;
      }

      if (v32 == 127)
      {
        uint64_t v33 = "32-KByte Update Mode";
        goto LABEL_59;
      }
    }

    else
    {
      if (!*v2)
      {
        uint64_t v33 = "Normal Mode";
        goto LABEL_59;
      }

      if (v32 == 113)
      {
        uint64_t v33 = "Single-Byte Update Mode";
LABEL_59:
        __DPFULog(5, "Requesting %s Again...", v23, v24, v25, v26, v27, v28, (char)v33);
LABEL_60:
        uint64_t Status = __DPFUSessionRequestMode(a1, *v2, v23, v24, v25, v26, v27, v28);
        if (!(_DWORD)Status)
        {
          do
          {
            uint64_t Status = __DPFUSessionGetMode(a1, &v59);
            if ((_DWORD)Status) {
              return Status;
            }
            usleep(0x3E8u);
            int v31 = v59;
          }

          while ((v59 & 0x80) != 0);
          if (v59 > 0x77u)
          {
            if (v59 == 120)
            {
              uint64_t v34 = "Eight-Byte Update Mode";
              goto LABEL_74;
            }

            if (v59 == 127)
            {
              uint64_t v34 = "32-KByte Update Mode";
              goto LABEL_74;
            }
          }

          else
          {
            if (!v59)
            {
              uint64_t v34 = "Normal Mode";
              goto LABEL_74;
            }

            if (v59 == 113)
            {
              uint64_t v34 = "Single-Byte Update Mode";
LABEL_74:
              __DPFULog(6, "  New Mode: %s (0x%02x)", v23, v24, v25, v26, v27, v28, (char)v34);
              int v31 = v59;
              goto LABEL_75;
            }
          }

          uint64_t v34 = "Unknown Mode";
          goto LABEL_74;
        }

        return Status;
      }
    }

    uint64_t v33 = "Unknown Mode";
    goto LABEL_59;
  }

LABEL_75:
  int v35 = *v2;
  if (v31 != v35)
  {
    uint64_t v49 = 3758097112LL;
    if (*v2 > 0x77u)
    {
      if (v35 == 120)
      {
        v57 = "Eight-Byte Update Mode";
        goto LABEL_101;
      }

      if (v35 == 127)
      {
        v57 = "32-KByte Update Mode";
        goto LABEL_101;
      }
    }

    else
    {
      if (!*v2)
      {
        v57 = "Normal Mode";
        goto LABEL_101;
      }

      if (v35 == 113)
      {
        v57 = "Single-Byte Update Mode";
LABEL_101:
        __DPFULog(5, "Unable to Enter %s...", v23, v24, v25, v26, v27, v28, (char)v57);
        return v49;
      }
    }

    v57 = "Unknown Mode";
    goto LABEL_101;
  }

LABEL_76:
  uint64_t Status = __DPFUSessionPollStatus(a1, &v60, 0x3E8u, 0x3E8u);
  if ((_DWORD)Status) {
    return Status;
  }
  if (*(int *)(a1 + 48) >= 6)
  {
    char v42 = DPFUGetDeviceStatusString(v60);
    __DPFULog(6, "  Current Status in this Mode: %s (0x%02x)", v43, v44, v45, v46, v47, v48, v42);
  }

  uint64_t v49 = 3758097112LL;
  if (v60 == 2)
  {
    uint64_t Status = __DPFUSessionSendHostCommand(a1, 1, v36, v37, v38, v39, v40, v41);
    if (!(_DWORD)Status)
    {
      uint64_t Status = __DPFUSessionPollStatus(a1, &v60, 0x3E8u, 0x3E8u);
      if (!(_DWORD)Status)
      {
        if (v60 == 2)
        {
          return 0LL;
        }

        return v49;
      }
    }

    return Status;
  }

  return v49;
}

uint64_t __DPFUSessionDownloadData(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (!a2) {
    return 3758097090LL;
  }
  uint64_t result = __DPFUSessionWrite(a1, *(_DWORD *)(*(void *)(a1 + 24) + 4LL), a2, a3);
  if (!(_DWORD)result)
  {
    uint64_t result = __DPFUSessionSendHostCommand(a1, 2, v5, v6, v7, v8, v9, v10);
    if (!(_DWORD)result)
    {
      uint64_t result = __DPFUSessionPollStatus(a1, &v11, 0, 0xAu);
      if (!(_DWORD)result)
      {
        if ((v11 & 0xFE) == 2) {
          return 0LL;
        }
        else {
          return 3758097084LL;
        }
      }
    }
  }

  return result;
}

void __DPFUSessionUpdateProgress( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a2 & 0x3FF) == 0 || (_DWORD)a3)
  {
    uint64_t v10 = *(void (**)(uint64_t, void))(a1 + 32);
    if (v10) {
      v10(a2, *(void *)(a1 + 40));
    }
  }

uint64_t __DPFUSessionFinishDownload( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = a2;
  __DPFUSessionUpdateProgress(a1, a2, 1LL, a4, a5, a6, a7, a8);
  uint64_t result = __DPFUSessionGetStatus(a1, (char *)&v25);
  if (!(_DWORD)result)
  {
    int v17 = v25;
    if (*(int *)(a1 + 48) >= 6)
    {
      char v18 = DPFUGetDeviceStatusString(v25);
      __DPFULog(6, "Final Status: %s (0x%02x)", v19, v20, v21, v22, v23, v24, v18);
    }

    if (v17 == 3)
    {
      return 0LL;
    }

    else
    {
      return 3758097098LL;
    }
  }

  return result;
}

uint64_t __DPFUSessionInstallUpdate( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = __DPFUSessionSendHostCommand(a1, 4, a3, a4, a5, a6, a7, a8);
  if ((_DWORD)v9) {
    return v9;
  }
  uint64_t v9 = __DPFUSessionPollStatus(a1, &v26, 0, 0x186A0u);
  if ((_DWORD)v9) {
    return v9;
  }
  uint64_t v16 = 3758097084LL;
  if (v26 != 4) {
    return 3758097105LL;
  }
  if (*(int *)(a1 + 48) >= 5)
  {
    __DPFULog(5, "  Validated", v10, v11, v12, v13, v14, v15, v25);
  }

  uint64_t v9 = __DPFUSessionSendHostCommand(a1, 5, v10, v11, v12, v13, v14, v15);
  if ((_DWORD)v9) {
    return v9;
  }
  uint64_t v9 = __DPFUSessionPollStatus(a1, &v26, 0, 0xAu);
  if ((_DWORD)v9) {
    return v9;
  }
  int v23 = v26;
  if (v26 == 127)
  {
    __DPFULog(5, "  Error Installing image!", v17, v18, v19, v20, v21, v22, v25);
    int v23 = v26;
  }

  if (v23 == 5)
  {
    return 0LL;
  }

  return v16;
}

uint64_t __DPFUSessionFinishUpdate( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_BYTE *)(a1 + 53)) {
    return __DPFUDeviceSetProperty(*(void *)(a1 + 16), (uint64_t)@"Updated", (uint64_t)kCFBooleanTrue);
  }
  uint64_t result = __DPFUSessionSendHostCommand(a1, 6, a3, a4, a5, a6, a7, a8);
  if (!(_DWORD)result)
  {
    if (*(_BYTE *)(a1 + 54)) {
      return 0LL;
    }
    while (1)
    {
      uint64_t result = __DPFUSessionGetMode(a1, &v21);
      if ((_DWORD)result) {
        return result;
      }
      if (v21 > 0x77u)
      {
        if (v21 == 120)
        {
          uint64_t v17 = "Eight-Byte Update Mode";
          goto LABEL_19;
        }

        if (v21 != 127) {
          goto LABEL_16;
        }
        uint64_t v17 = "32-KByte Update Mode";
      }

      else
      {
        if (!v21)
        {
          uint64_t v17 = "Normal Mode";
          goto LABEL_19;
        }

        if (v21 != 113)
        {
LABEL_16:
          uint64_t v17 = "Unknown Mode";
          goto LABEL_19;
        }

        uint64_t v17 = "Single-Byte Update Mode";
      }

LABEL_19:
      __DPFULog(6, "Device Mode: %s (0x%02x)", v11, v12, v13, v14, v15, v16, (char)v17);
LABEL_20:
      int v18 = v21;
      if (v21)
      {
        usleep(0x3E8u);
        int v18 = v21;
      }

      if (v18 == a2)
      {
        if (a2 > 119)
        {
          if (a2 == 120)
          {
            uint64_t v19 = "Eight-Byte Update Mode";
            goto LABEL_34;
          }

          if (a2 == 127)
          {
            uint64_t v19 = "32-KByte Update Mode";
            goto LABEL_34;
          }
        }

        else
        {
          if (!a2)
          {
            uint64_t v19 = "Normal Mode";
            goto LABEL_34;
          }

          if (a2 == 113)
          {
            uint64_t v19 = "Single-Byte Update Mode";
LABEL_34:
            __DPFULog(5, "  Restarted in mode: %s (0x%02x)", v11, v12, v13, v14, v15, v16, (char)v19);
            return __DPFUDeviceSetProperty(*(void *)(a1 + 16), (uint64_t)@"Updated", (uint64_t)kCFBooleanTrue);
          }
        }

        uint64_t v19 = "Unknown Mode";
        goto LABEL_34;
      }
    }
  }

  return result;
}

uint64_t __DPFUSessionRequestMode( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v11 = a2 | 0x80;
  if (*(int *)(a1 + 48) >= 7)
  {
    if (a2 > 119)
    {
      if (a2 == 120)
      {
        uint64_t v9 = "Eight-Byte Update Mode";
        goto LABEL_12;
      }

      if (a2 == 127)
      {
        uint64_t v9 = "32-KByte Update Mode";
        goto LABEL_12;
      }
    }

    else
    {
      if (!a2)
      {
        uint64_t v9 = "Normal Mode";
        goto LABEL_12;
      }

      if (a2 == 113)
      {
        uint64_t v9 = "Single-Byte Update Mode";
LABEL_12:
        __DPFULog(7, "Requesting Device Mode: %s (0x%02x)", a3, a4, a5, a6, a7, a8, (char)v9);
        return __DPFUSessionWrite(a1, 1293, (uint64_t)&v11, 1u);
      }
    }

    uint64_t v9 = "Unknown Mode";
    goto LABEL_12;
  }

  return __DPFUSessionWrite(a1, 1293, (uint64_t)&v11, 1u);
}

uint64_t DPFUSessionInstallMemoryPayload(uint64_t a1, uint64_t a2, unint64_t a3, int a4)
{
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = __DPFUSessionPrepareForDownload(a1);
  if ((_DWORD)v9) {
    goto LABEL_20;
  }
  if (a3)
  {
    uint64_t v16 = 0LL;
    unsigned int v17 = 0;
    while (1)
    {
      unsigned int v18 = a3 - v16 >= *(unsigned int *)(v8 + 8) ? *(_DWORD *)(v8 + 8) : a3 - v16;
      uint64_t v19 = __DPFUSessionDownloadData(a1, a2 + v16, v18);
      if ((_DWORD)v19) {
        break;
      }
      __DPFUSessionUpdateProgress(a1, v18 + v17, 0LL, v11, v12, v13, v14, v15);
      v17 += v18;
      uint64_t v16 = v17;
      if (v17 >= a3) {
        goto LABEL_13;
      }
    }

    uint64_t v21 = v19;
    goto LABEL_16;
  }

  uint64_t v16 = 0LL;
LABEL_13:
  uint64_t v9 = __DPFUSessionFinishDownload(a1, v16, v10, v11, v12, v13, v14, v15);
  if ((_DWORD)v9 || (uint64_t v9 = __DPFUSessionInstallUpdate(a1, v20, v10, v11, v12, v13, v14, v15), (_DWORD)v9))
  {
LABEL_20:
    uint64_t v21 = v9;
    goto LABEL_16;
  }

  uint64_t v21 = __DPFUSessionFinishUpdate(a1, a4, v10, v11, v12, v13, v14, v15);
  if ((_DWORD)v21) {
LABEL_16:
  }
    __DPFUSessionRequestMode(a1, 0, v10, v11, v12, v13, v14, v15);
  return v21;
}

uint64_t DPFUSessionSetLogLevel(uint64_t result, int a2)
{
  *(_DWORD *)(result + 48) = a2;
  return result;
}

const char *DPFUGetDeviceStatusString(int a1)
{
  uint64_t result = "Idle";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = "Busy";
      break;
    case 2:
      uint64_t result = "Ready";
      break;
    case 3:
      uint64_t result = "Data End";
      break;
    case 4:
      uint64_t result = "Validated";
      break;
    case 5:
      uint64_t result = "Installed";
      break;
    default:
      uint64_t v4 = "None";
      if (a1 != 255) {
        uint64_t v4 = "Unknown";
      }
      if (a1 == 127) {
        uint64_t result = "Error";
      }
      else {
        uint64_t result = v4;
      }
      break;
  }

  return result;
}

void __DPFUSessionFinalize(uint64_t a1)
{
  v2 = *(const void **)(a1 + 16);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 16) = 0LL;
  }

uint64_t __DPFUSessionRead(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DPCD = IODPDeviceReadDPCD(*(void *)(a1 + 16), a2, a3, 1LL);
  uint64_t v5 = DPCD;
  if ((_DWORD)DPCD && (*(_DWORD *)(a1 + 48) & 0x80000000) == 0)
  {
    char v6 = mach_error_string(DPCD);
    __DPFULog(0, "Error reading from device: %s (0x%08x)", v7, v8, v9, v10, v11, v12, v6);
  }

  return v5;
}

uint64_t __DPFUSessionGetStatus(uint64_t a1, char *a2)
{
  uint64_t result = __DPFUClockIntervalToDeadline(&deadline);
  if (!(_DWORD)result)
  {
    uint64_t result = __DPFUSessionRead(a1, 1294LL, (uint64_t)&v8);
    if (!(_DWORD)result)
    {
      char v5 = v8;
      while (1)
      {
        char v6 = v5;
        mach_wait_until(deadline);
        uint64_t result = __DPFUClockIntervalToDeadline(&deadline);
        if ((_DWORD)result) {
          break;
        }
        uint64_t result = __DPFUSessionRead(a1, 1294LL, (uint64_t)&v8);
        if ((_DWORD)result) {
          break;
        }
        char v5 = v8;
        if (v8 == v6)
        {
          uint64_t result = 0LL;
          char v7 = v6;
          if (v6 < 0) {
            char v7 = -1;
          }
          *a2 = v7;
          return result;
        }
      }
    }
  }

  return result;
}

uint64_t __DPFUSessionPollStatus(uint64_t a1, _BYTE *a2, useconds_t a3, useconds_t a4)
{
  if (!a2) {
    return 3758097090LL;
  }
  for (uint64_t result = __DPFUSessionGetStatus(a1, (char *)&v18);
        !(_DWORD)result;
        uint64_t result = __DPFUSessionGetStatus(a1, (char *)&v18))
  {
    int v9 = v18;
    if (*(int *)(a1 + 48) >= 6)
    {
      char v10 = DPFUGetDeviceStatusString(v18);
      __DPFULog(6, "  Device Status: %s (0x%02x)", v11, v12, v13, v14, v15, v16, v10);
    }

    useconds_t v17 = a4;
    if (v9 == 1 || a3 && (useconds_t v17 = a3, v9 == 255))
    {
      usleep(v17);
    }

    else if (v9 != 255)
    {
      uint64_t result = 0LL;
      *a2 = v9;
      return result;
    }
  }

  return result;
}

uint64_t __DPFUSessionSendHostCommand( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v11 = a2 | 0x80;
  if (*(int *)(a1 + 48) >= 7)
  {
    else {
      int v9 = (&off_100004200)[a2 - 1];
    }
    __DPFULog(7, "Sending Host Command: %s (0x%02x)", a3, a4, a5, a6, a7, a8, (char)v9);
  }

  return __DPFUSessionWrite(a1, 1294, (uint64_t)&v11, 1u);
}

uint64_t __DPFUClockIntervalToDeadline(void *a1)
{
  uint64_t v2 = mach_timebase_info(&info);
  if (!(_DWORD)v2)
  {
    unint64_t v3 = 100000 * (unint64_t)info.denom / info.numer;
    *a1 = mach_absolute_time() + v3;
  }

  return v2;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}