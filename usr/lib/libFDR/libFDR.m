uint64_t AMFDRCopyDeviceKeys(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t result;
  unint64_t v6;
  if (!a2 || !a3)
  {
    v6 = 0x18C6E4000LL;
    result = 1LL;
LABEL_9:
    *(_DWORD *)(v6 + 4072) = result;
    return result;
  }

  if (*MEMORY[0x18960B9D0] != a1)
  {
    v6 = 0x18C6E4000uLL;
    result = 9LL;
    goto LABEL_9;
  }

  if (AMFDRCopyDeviceKeys_onceToken != -1) {
    dispatch_once(&AMFDRCopyDeviceKeys_onceToken, &__block_literal_global);
  }
  *a2 = AMSupportSafeRetain();
  *a3 = AMSupportSafeRetain();
  return AMFDRCopyDeviceKeys_error;
}

void __AMFDRCopyDeviceKeys_block_invoke()
{
  kern_return_t v9;
  int key_deterministic;
  size_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  UInt8 *v15;
  UInt8 *v16;
  int v17;
  CFAllocatorRef v18;
  char v19;
  size_t outputStructCnt[4];
  io_connect_t connect[534];
  uint64_t v22;
  v22 = *MEMORY[0x1895F89C0];
  connect[0] = 0;
  CFMutableDictionaryRef v0 = IOServiceMatching("IOAESAccelerator");
  if (v0)
  {
    v1 = v0;
    CFRetain(v0);
    io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1896086A8], v1);
    if (MatchingService)
    {
      io_object_t v3 = MatchingService;
      IOServiceOpen(MatchingService, *MEMORY[0x1895FBBE0], 0, connect);
      CFRelease(v1);
      IOObjectRelease(v3);
      io_connect_t v4 = connect[0];
      if (connect[0])
      {
        *(void *)connect = 0LL;
        int v5 = posix_memalign((void **)connect, 0x10uLL, 0x40uLL);
        v6 = *(_OWORD **)connect;
        if (v5)
        {
          if (!*(void *)connect)
          {
            AMFDRCopyDeviceKeys_error = 2;
            IOServiceClose(v4);
            return;
          }
        }

        else
        {
          *(_OWORD *)(*(void *)connect + 32LL) = 0u;
          v6[3] = 0u;
          _OWORD *v6 = 0u;
          v6[1] = 0u;
        }

        _OWORD *v6 = kAMDDeviceKeySeed;
        v6[1] = unk_187991520;
        v6[2] = xmmword_187991530;
        v6[3] = unk_187991540;
        *(void *)connect = 0LL;
        int v7 = posix_memalign((void **)connect, 0x10uLL, 0x40uLL);
        v8 = *(_OWORD **)connect;
        if (v7)
        {
          if (!*(void *)connect)
          {
            AMFDRCopyDeviceKeys_error = 2;
            IOServiceClose(v4);
LABEL_24:
            free(v6);
            return;
          }
        }

        else
        {
          *(_OWORD *)(*(void *)connect + 32LL) = 0u;
          v8[3] = 0u;
          _OWORD *v8 = 0u;
          v8[1] = 0u;
        }

        *(void *)&connect[20] = 0LL;
        *(void *)&connect[7] = 0LL;
        *(void *)&connect[5] = 0LL;
        memset(&connect[11], 0, 32);
        outputStructCnt[0] = 88LL;
        *(void *)connect = v6;
        *(void *)&connect[2] = v8;
        connect[4] = 64;
        *(void *)&connect[9] = 0x8000000000LL;
        connect[19] = 2105;
        v9 = IOConnectCallStructMethod(v4, 1u, connect, 0x58uLL, connect, outputStructCnt);
        switch(v9)
        {
          case -536870212:
          case -536870211:
          case -536870210:
          case -536870209:
          case -536870208:
          case -536870207:
          case -536870206:
          case -536870205:
          case -536870204:
          case -536870203:
          case -536870202:
          case -536870201:
          case -536870200:
          case -536870199:
          case -536870198:
          case -536870197:
          case -536870196:
          case -536870195:
          case -536870194:
          case -536870193:
          case -536870192:
          case -536870191:
          case -536870190:
          case -536870189:
          case -536870188:
            goto LABEL_22;
          default:
            if (v9)
            {
LABEL_22:
              AMSupportLogInternal();
              v17 = 6;
              goto LABEL_23;
            }

            AMSupportLogInternal();
            memset(connect, 170, 2132);
            if (!ccrng()
              || (strcpy((char *)outputStructCnt, "pseudo_ccrng_allocate"),
                  key_deterministic = ccrsa_generate_key_deterministic(),
                  AMSupportLogInternal(),
                  key_deterministic))
            {
              v19 = 0;
              v17 = 6;
              goto LABEL_33;
            }

            v11 = ccrsa_export_priv_size();
            v12 = malloc(v11);
            v13 = ccrsa_ctx_public();
            v14 = MEMORY[0x1895AFC4C](v13);
            v15 = (UInt8 *)malloc(v14);
            v16 = v15;
            if (v12 && v15)
            {
              ccrsa_ctx_public();
              else {
                AMSupportLogDumpMemory();
              }
              if (AMSupportRsaCreatePemFromData())
              {
LABEL_40:
                v19 = 0;
                v17 = 6;
              }

              else
              {
                v18 = (const __CFAllocator *)*MEMORY[0x189604DB0];
                AMFDRCopyDeviceKeys_privKey = (uint64_t)CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL);
                if (AMFDRCopyDeviceKeys_privKey
                  && (AMSupportLogInternal(), (AMFDRCopyDeviceKeys_pubKey = (uint64_t)CFDataCreate(v18, v16, v14)) != 0))
                {
                  AMSupportLogInternal();
                  v17 = 0;
                  v19 = 1;
                }

                else
                {
                  v19 = 0;
                  v17 = 2;
                }
              }
            }

            else
            {
              v19 = 0;
              v17 = 2;
              if (!v12)
              {
LABEL_31:
                if (v16) {
                  free(v16);
                }
LABEL_33:
                if ((v19 & 1) == 0)
                {
                  if (AMFDRCopyDeviceKeys_pubKey)
                  {
                    CFRelease((CFTypeRef)AMFDRCopyDeviceKeys_pubKey);
                    AMFDRCopyDeviceKeys_pubKey = 0LL;
                  }

                  if (AMFDRCopyDeviceKeys_privKey)
                  {
                    CFRelease((CFTypeRef)AMFDRCopyDeviceKeys_privKey);
                    AMFDRCopyDeviceKeys_privKey = 0LL;
                  }
                }

LABEL_23:
                AMFDRCopyDeviceKeys_error = v17;
                IOServiceClose(v4);
                free(v8);
                goto LABEL_24;
              }
            }

            free(v12);
            goto LABEL_31;
        }
      }
    }

    else
    {
      CFRelease(v1);
    }
  }

  AMFDRCopyDeviceKeys_error = 6;
}

    v23 = 3LL;
    AMSupportLogInternal();
LABEL_24:
    free(v7);
    if (!v10) {
      return v23;
    }
    goto LABEL_21;
  }

  v14 = 0;
LABEL_20:
  v23 = 0LL;
  *a2 = v7;
  *a3 = v14;
  if (v10) {
LABEL_21:
  }
    free(v10);
  return v23;
}

void *AMFDRDeviceRefKeyCreate(const __CFAllocator *a1)
{
  return _AMFDRDeviceRefKeyCreateInternal(a1, 0LL);
}

void *_AMFDRDeviceRefKeyCreateInternal(const __CFAllocator *a1, CFDataRef theData)
{
  v27 = 0LL;
  v25 = 0LL;
  CFIndex length = 0LL;
  v23 = 0LL;
  CFIndex v24 = 0LL;
  v21 = 0LL;
  uint64_t v22 = 0LL;
  uint64_t v20 = 1LL;
  if (theData)
  {
    BytePtr = CFDataGetBytePtr(theData);
    CFIndex v5 = CFDataGetLength(theData);
    if (aks_ref_key_create_with_blob(0, BytePtr, v5, (uint64_t *)&v25))
    {
      AMSupportLogInternal();
      v6 = 0LL;
      CFDataRef v12 = 0LL;
      int v7 = 0LL;
      goto LABEL_45;
    }

    v6 = 0LL;
    int v7 = 0LL;
  }

  else
  {
    v8 = (const __CFBoolean *)MGCopyAnswer();
    int v7 = v8;
    if (!v8 || (CFTypeID v9 = CFGetTypeID(v8), v9 != CFBooleanGetTypeID()))
    {
      AMSupportLogInternal();
      v6 = 0LL;
LABEL_44:
      CFDataRef v12 = 0LL;
      goto LABEL_45;
    }

    if (CFBooleanGetValue(v7)) {
      unsigned int v10 = 5;
    }
    else {
      unsigned int v10 = 4;
    }
    v11 = (void **)aks_params_create(0LL);
    v6 = v11;
    v21 = v11;
    if (!v11
      || aks_params_set_number(v11, 9, &v20)
      || aks_params_get_der(v6, &v23, &v22)
      || aks_ref_key_create(-1, 13, v10, (uint64_t)v23, v22, &v25))
    {
LABEL_43:
      AMSupportLogInternal();
      goto LABEL_44;
    }
  }

  if (!v25
    || aks_sik_attest((uint64_t *)v25, (uint64_t)v23, v22, (uint64_t)&v27, (uint64_t)&length)
    || !v27
    || !length)
  {
    goto LABEL_43;
  }

  CFDataRef v12 = CFDataCreate(a1, v27, length);
  if (!v12)
  {
    AMSupportLogInternal();
LABEL_45:
    CFDataRef v14 = 0LL;
    goto LABEL_46;
  }

  public_key = (const UInt8 *)aks_ref_key_get_public_key(v25, &v24);
  if (!public_key || !v24) {
    goto LABEL_45;
  }
  CFDataRef v14 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], public_key, v24);
  if (v14)
  {
    pthread_once(&_AMFDRDeviceRefKeyClassInitializeOnce, (void (*)(void))_AMFDRDeviceRefKeyClassInitialize);
    Instance = (void *)_CFRuntimeCreateInstance();
    if (Instance)
    {
      v16 = Instance;
      Instance[2] = 0LL;
      Instance[3] = 0LL;
      Instance[4] = 0LL;
      CFTypeRef v17 = CFRetain(v12);
      v18 = v25;
      v16[2] = v17;
      v16[3] = v18;
      v25 = 0LL;
      v16[4] = v14;
      CFDataRef v14 = 0LL;
      if (!v6) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
  }

  else
  {
    AMSupportLogInternal();
  }

LABEL_46:
  if (v25) {
    aks_ref_key_free((uint64_t *)&v25);
  }
  v16 = 0LL;
  if (v6) {
LABEL_23:
  }
    aks_params_free(&v21);
LABEL_24:
  if (v14) {
    CFRelease(v14);
  }
  if (v7) {
    CFRelease(v7);
  }
  if (v12) {
    CFRelease(v12);
  }
  if (v27)
  {
    free(v27);
    v27 = 0LL;
  }

  if (v23) {
    free(v23);
  }
  return v16;
}

void *AMFDRDeviceRefKeyCreateWithData(const __CFAllocator *a1, const __CFData *a2)
{
  if (a2) {
    return _AMFDRDeviceRefKeyCreateInternal(a1, a2);
  }
  AMSupportLogInternal();
  return 0LL;
}

uint64_t AMFDRDeviceRefKeySign(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v9[0] = v5;
  v9[1] = v5;
  if (a1 && a2 && a3 && a4 && a5)
  {
    ccsha256_di();
    ccdigest();
    aks_ref_key_sign(*(uint64_t **)(a1 + 24), 0LL, 0LL, (uint64_t)v9);
    AMSupportLogInternal();
    return 6LL;
  }

  else
  {
    AMSupportLogInternal();
    return 1LL;
  }
}

CFTypeRef AMFDRDeviceRefKeyCopyAttestation(uint64_t a1)
{
  if (a1)
  {
    v1 = *(const void **)(a1 + 16);
    if (v1) {
      return CFRetain(v1);
    }
  }

  AMSupportLogInternal();
  return 0LL;
}

uint64_t AMFDRDeviceRefKeyGetPublicKey(uint64_t a1)
{
  if (a1) {
    return *(void *)(a1 + 32);
  }
  AMSupportLogInternal();
  return 0LL;
}

CFDataRef AMFDRDeviceCopySikPub(const __CFAllocator *a1)
{
  CFIndex length = 0LL;
  bytes = 0LL;
  if (!aks_system_key_get_public(1u, 1u, 0LL, 0LL, &bytes, &length) && bytes && length)
  {
    CFDataRef SikPubDigestIfNecessary = AMFDRDataCreateSikPubDigestIfNecessary(a1, bytes, length);
  }

  else
  {
    AMSupportLogInternal();
    CFDataRef SikPubDigestIfNecessary = 0LL;
  }

  if (bytes) {
    free(bytes);
  }
  return SikPubDigestIfNecessary;
}

CFDataRef AMFDRDeviceRefKeyCopyKeyBlob(uint64_t a1)
{
  CFIndex length = 0LL;
  if (!a1
    || (v1 = *(uint64_t **)(a1 + 24)) == 0LL
    || (blob = (const UInt8 *)aks_ref_key_get_blob(v1, &length)) == 0LL
    || (CFDataRef result = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], blob, length)) == 0LL)
  {
    AMSupportLogInternal();
    return 0LL;
  }

  return result;
}

uint64_t _AMFDRDeviceRefKeyClassInitialize()
{
  uint64_t result = _CFRuntimeRegisterClass();
  _AMFDRDeviceRefKeyTypeID = result;
  return result;
}

void _AMFDRDeviceRefKeyClassFinalize(void *a1)
{
  if (!a1) {
    _AMFDRDeviceRefKeyClassFinalize_cold_1();
  }
  io_object_t v3 = a1 + 2;
  v2 = (const void *)a1[2];
  if (v2)
  {
    CFRelease(v2);
    *io_object_t v3 = 0LL;
  }

  if (a1[3])
  {
    aks_ref_key_free(a1 + 3);
    a1[3] = 0LL;
  }

  io_connect_t v4 = (const void *)a1[4];
  if (v4) {
    CFRelease(v4);
  }
  *io_object_t v3 = 0LL;
  v3[1] = 0LL;
  v3[2] = 0LL;
}

CFStringRef _AMFDRDeviceRefKeyCopyFormattingDescription(uint64_t a1)
{
  CFIndex length = 0LL;
  if (!a1) {
    _AMFDRDeviceRefKeyCopyFormattingDescription_cold_1();
  }
  v1 = *(void **)(a1 + 24);
  if (!v1) {
    return @"Invalid AMFDRDeviceRefKey";
  }
  public_key = (const UInt8 *)aks_ref_key_get_public_key(v1, &length);
  if (!public_key) {
    return @"Invalid AMFDRDeviceRefKey";
  }
  if (!length) {
    return @"Invalid AMFDRDeviceRefKey";
  }
  io_object_t v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFDataRef v4 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], public_key, length);
  if (!v4) {
    return @"Invalid AMFDRDeviceRefKey";
  }
  CFDataRef v5 = v4;
  uint64_t v6 = AMSupportCopyHexStringFromData();
  if (!v6)
  {
    uint64_t v10 = @"Invalid AMFDRDeviceRefKey";
    CFStringRef v9 = (CFStringRef)v5;
LABEL_10:
    CFRelease(v9);
    return v10;
  }

  int v7 = (const void *)v6;
  CFStringRef v8 = CFStringCreateWithFormat(v3, 0LL, @"AMFDRDeviceRefKey: %@", v6);
  CFStringRef v9 = v8;
  if (v8) {
    uint64_t v10 = (const __CFString *)CFRetain(v8);
  }
  else {
    uint64_t v10 = @"Invalid AMFDRDeviceRefKey";
  }
  CFRelease(v5);
  CFRelease(v7);
  if (v9) {
    goto LABEL_10;
  }
  return v10;
}

uint64_t AMFDRCopyDisposableKeys(uint64_t a1, CFTypeRef *a2, CFTypeRef *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  memset(__b, 170, sizeof(__b));
  char v5 = 0;
  uint64_t v6 = 1LL;
  if (!a2 || !a3) {
    goto LABEL_15;
  }
  ccrng();
  int key = ccrsa_generate_key();
  AMSupportLogInternal();
  if (key)
  {
    char v5 = 0;
    uint64_t v6 = 6LL;
    goto LABEL_15;
  }

  size_t v8 = ccrsa_export_priv_size();
  CFStringRef v9 = malloc(v8);
  uint64_t v10 = ccrsa_ctx_public();
  uint64_t v11 = MEMORY[0x1895AFC4C](v10);
  CFDataRef v12 = (UInt8 *)malloc(v11);
  v13 = v12;
  if (v9 && v12)
  {
    if (ccrsa_export_priv()
      || (ccrsa_ctx_public(), ccrsa_export_pub())
      || AMSupportRsaCreatePemFromData())
    {
      char v5 = 0;
      uint64_t v6 = 6LL;
    }

    else
    {
      CFDataRef v14 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      *a3 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL);
      AMSupportLogInternal();
      if (*a3 && (*a2 = CFDataCreate(v14, v13, v11), AMSupportLogInternal(), *a2))
      {
        uint64_t v6 = 0LL;
        char v5 = 1;
      }

      else
      {
        char v5 = 0;
        uint64_t v6 = 2LL;
      }
    }

    goto LABEL_12;
  }

  char v5 = 0;
  uint64_t v6 = 2LL;
  if (v9) {
LABEL_12:
  }
    free(v9);
  if (v13) {
    free(v13);
  }
LABEL_15:
  if ((v5 & 1) == 0)
  {
    if (*a2)
    {
      CFRelease(*a2);
      *a2 = 0LL;
    }

    if (*a3)
    {
      CFRelease(*a3);
      *a3 = 0LL;
    }
  }

  return v6;
}

CFDataRef AMFDRCryptoCreateCsr(uint64_t a1, const __CFString *a2)
{
  CFDataRef PemFromData = (CFDataRef)a1;
  unsigned int v20 = 0;
  CFTypeRef cf = 0LL;
  CFDataRef theData = 0LL;
  if (!a1)
  {
    AMSupportLogInternal();
    goto LABEL_25;
  }

  if ((v20 & 0x10000) != 0)
  {
    v13 = (void *)*((void *)PemFromData + 17);
    if (*v13 >= 0x29uLL && (CFDataRef v14 = (uint64_t (*)(CFDataRef, void))v13[5]) != 0LL)
    {
      CFTypeRef v12 = (CFTypeRef)v14(PemFromData, *((void *)PemFromData + 18));
      CFTypeRef cf = v12;
      if (v12) {
        goto LABEL_19;
      }
    }

    else
    {
      CFTypeRef cf = 0LL;
    }

LABEL_24:
    AMSupportLogInternal();
    CFDataRef PemFromData = 0LL;
    goto LABEL_25;
  }

  PrivateKey = (const __CFData *)AMFDRCryptoGetPrivateKey((uint64_t)PemFromData);
  CFDataRef theData = PrivateKey;
  if (!PrivateKey || (CFDataRef v5 = PrivateKey, v6 = CFGetTypeID(PrivateKey), v6 != CFDataGetTypeID()))
  {
    int v7 = (void *)*((void *)PemFromData + 17);
    if (*v7 < 0x51uLL) {
      goto LABEL_24;
    }
    size_t v8 = (unsigned int (*)(CFDataRef, CFTypeRef *, CFDataRef *, void))v7[10];
    if (!v8) {
      goto LABEL_24;
    }
    if (v8(PemFromData, &cf, &theData, *((void *)PemFromData + 18))) {
      goto LABEL_24;
    }
    CFDataRef v5 = theData;
    if (!theData) {
      goto LABEL_24;
    }
  }

  CFTypeID v9 = CFGetTypeID(v5);
  if (v9 != CFDataGetTypeID()) {
    goto LABEL_24;
  }
  uint64_t v10 = cf;
  if (!cf)
  {
    CFDataGetBytePtr(theData);
    CFDataGetLength(theData);
    uint64_t v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL);
    CFTypeRef cf = v10;
    if (!v10) {
      goto LABEL_24;
    }
  }

  CFTypeID v11 = CFGetTypeID(v10);
  if (v11 != CFDataGetTypeID()) {
    goto LABEL_24;
  }
  CFTypeRef v12 = cf;
LABEL_19:
  CFDataRef SignedCsr = AMFDRCryptoCreateSignedCsr( (const __CFDictionary **)PemFromData,  v20,  a2,  (const __CFData *)v12,  (uint64_t (*)(void, void, void, void))AMFDRCryptoCreateCsrSignature,  (uint64_t)PemFromData);
  if (!SignedCsr) {
    goto LABEL_24;
  }
  CFDataRef v16 = SignedCsr;
  CFDataRef PemFromData = AMFDRCryptoCreatePemFromData((uint64_t)SignedCsr, 1);
  if (!PemFromData) {
    AMSupportLogInternal();
  }
  CFRelease(v16);
LABEL_25:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0LL;
  }

  return PemFromData;
}

  if (DEREncoderAddSequenceFromEncoder()
    || AMFDREncodeAddBitString(v12, a2, a3)
    || DEREncoderAddSequenceFromEncoder())
  {
    goto LABEL_44;
  }

  DEREncoderDestroy();
  v13 = DEREncoderCreate();
  if (!v13)
  {
LABEL_68:
    AMSupportLogInternal();
    goto LABEL_69;
  }

  unsigned int v20 = _FDREncodeCreateDataFromOid("1.2.840.113549.1.9.14", &v30, &v29);
  v18 = v30;
  if (v20) {
    goto LABEL_71;
  }
  if (v18)
  {
    free(v18);
    v30 = 0LL;
  }

  v21 = *(void *)(*(void *)a1 + 8LL);
  v33 = 0;
  v32 = 0LL;
  if (!v21) {
    goto LABEL_44;
  }
  EncodedBuffer = DEREncoderCreateEncodedBuffer();
  if (!EncodedBuffer) {
    EncodedBuffer = DEREncoderAddData();
  }
  if (v32) {
    free(v32);
  }
  if (EncodedBuffer
    || DEREncoderAddSetFromEncoder()
    || DEREncoderAddSequenceFromEncoder()
    || DEREncoderAddDataFromEncoder()
    || DEREncoderAddSequenceFromEncoder()
    || DEREncoderCreateEncodedBuffer())
  {
    goto LABEL_44;
  }

  v23 = 0LL;
  *a6 = 0LL;
  *a7 = 0;
LABEL_46:
  DEREncoderDestroy();
LABEL_47:
  if (v13) {
    DEREncoderDestroy();
  }
  if (v12) {
    DEREncoderDestroy();
  }
  if (v11) {
    DEREncoderDestroy();
  }
  if (v7) {
    DEREncoderDestroy();
  }
  return v23;
}

uint64_t AMFDRCryptoCreateDataSignature(int a1, uint64_t a2, uint64_t a3, void **a4, void *a5, CFTypeRef cf)
{
  uint64_t v21 = 0LL;
  uint64_t v22 = 0LL;
  if (!cf) {
    goto LABEL_36;
  }
  CFTypeID v12 = CFGetTypeID(cf);
  if (v12 != AMFDRGetTypeID() || !a2 || !a3 || !a4 || !a5) {
    goto LABEL_36;
  }
  uint64_t PrivateKeyFromPEMBuffer = 103LL;
  if (a1 != 66050 && a1 != 66562)
  {
    PrivateKey = (const __CFData *)AMFDRCryptoGetPrivateKey((uint64_t)cf);
    if (!PrivateKey) {
      goto LABEL_36;
    }
    v15 = PrivateKey;
    CFTypeID v16 = CFGetTypeID(PrivateKey);
    if (v16 != CFDataGetTypeID()) {
      goto LABEL_36;
    }
    CFDataGetBytePtr(v15);
    CFDataGetLength(v15);
    uint64_t PrivateKeyFromPEMBuffer = AMSupportRsaCreatePrivateKeyFromPEMBuffer();
    if ((_DWORD)PrivateKeyFromPEMBuffer) {
      goto LABEL_26;
    }
  }

  if (a1 > 1024)
  {
    if (a1 != 66562 && a1 != 66050)
    {
      uint64_t PrivateKeyFromPEMBuffer = 105LL;
      if (a1 != 1025) {
        goto LABEL_27;
      }
LABEL_36:
      AMSupportLogInternal();
      uint64_t PrivateKeyFromPEMBuffer = 103LL;
      goto LABEL_27;
    }

    v18 = (void *)*((void *)cf + 17);
    if (*v18 >= 0x39uLL)
    {
      v19 = (unsigned int (*)(CFTypeRef, uint64_t, uint64_t, void **, uint64_t *, void))v18[7];
      if (v19)
      {
        if (!v19(cf, a2, a3, &v22, &v21, *((void *)cf + 18)))
        {
          if (v22)
          {
            uint64_t v17 = v21;
            if (v21)
            {
              *a4 = v22;
              uint64_t v22 = 0LL;
              uint64_t PrivateKeyFromPEMBuffer = 100LL;
              *a5 = v17;
              return PrivateKeyFromPEMBuffer;
            }
          }
        }
      }
    }

LABEL_26:
    AMSupportLogInternal();
    goto LABEL_27;
  }

  if (a1 == 257) {
    goto LABEL_36;
  }
  uint64_t PrivateKeyFromPEMBuffer = 105LL;
  if (a1 == 513) {
    goto LABEL_36;
  }
LABEL_27:
  if (v22)
  {
    free(v22);
    uint64_t v22 = 0LL;
  }

  return PrivateKeyFromPEMBuffer;
}

uint64_t AMFDRCreateRsaSignature( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t *a7)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v10 = ccrsa_import_priv_n();
  MEMORY[0x1895F8858]();
  CFTypeID v12 = (uint64_t *)((char *)&v21 - v11);
  if (v13 >= 0x20)
  {
    *(void *)&__int128 v14 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v15 = (_OWORD *)((char *)&v21 - v11);
    do
    {
      _OWORD *v15 = v14;
      v15[1] = v14;
      v15 += 2;
      v11 -= 32LL;
    }

    while (v11);
  }

  *(void *)&__int128 v16 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v24 = v16;
  __int128 v25 = v16;
  __int128 v23 = v16;
  uint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
  *CFTypeID v12 = v10;
  uint64_t v22 = 8 * v10;
  uint64_t v17 = calloc(1uLL, 8 * v10);
  if (!v17) {
    return 6LL;
  }
  v18 = v17;
  switch(a1)
  {
    case 1025:
      ccsha384_di();
      ccdigest();
      break;
    case 513:
      ccsha256_di();
      ccdigest();
      break;
    case 257:
      ccsha1_di();
      ccdigest();
      break;
    default:
      uint64_t v19 = 105LL;
LABEL_15:
      free(v18);
      return v19;
  }

  if (ccrsa_sign_pkcs1v15())
  {
    uint64_t v19 = 6LL;
    goto LABEL_15;
  }

  uint64_t v19 = 0LL;
  *a6 = v18;
  *a7 = v22;
  return v19;
}

uint64_t AMFDRCryptoCreateLocalSignedDataSignature(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = 0LL;
  CFTypeID v9 = 0LL;
  if (!a2 || !a3 || !a4 || !a5) {
    goto LABEL_14;
  }
  if ((a1 & 3) != 1 && (a1 & 3) != 2) {
    return 105LL;
  }
  uint64_t DataFromPem = AMSupportRsaCreateDataFromPem();
  if (!(_DWORD)DataFromPem)
  {
LABEL_14:
    AMSupportLogInternal();
    return 103LL;
  }

  uint64_t v6 = DataFromPem;
  AMSupportLogInternal();
  return v6;
}

uint64_t AMFDRCreateEcDsaSignature(int a1)
{
  if (a1 == 66562)
  {
    SignatureSha384 = AMSupportEcDsaCreateSignatureSha384();
  }

  else
  {
    if (a1 != 66050) {
      return 6LL;
    }
    SignatureSha384 = AMSupportEcDsaCreateSignatureSha256();
  }

  if (SignatureSha384) {
    return 6LL;
  }
  else {
    return 0LL;
  }
}

uint64_t AMFDRCryptoCreateLocalSignedCertificateData(char a1, void *a2, _DWORD *a3)
{
  if (a2 && a3)
  {
    if ((a1 & 3) == 1)
    {
      CFDataRef v5 = "-----BEGIN CERTIFICATE-----\n"
           "MIIEKTCCAxGgAwIBAgIJAIpZXkx8FEc8MA0GCSqGSIb3DQEBBQUAMIGbMQswCQYD\n"
           "VQQGEwJVUzETMBEGA1UECAwKQ2FsaWZvcm5pYTESMBAGA1UEBwwJQ3VwZXJ0aW5v\n"
           "MRMwEQYDVQQKDApBcHBsZSBJbmMuMQ8wDQYDVQQLDAZDb3JlT1MxFTATBgNVBAMM\n"
           "DEZEUi1MT0NBTC1WMTEmMCQGCSqGSIb3DQEJARYXZmRyLWRldkBncm91cC5hcHBs\n"
           "ZS5jb20wHhcNMjIwNTA5MTUyOTQxWhcNMzIwNTA2MTUyOTQxWjCBmzELMAkGA1UE\n"
           "BhMCVVMxEzARBgNVBAgMCkNhbGlmb3JuaWExEjAQBgNVBAcMCUN1cGVydGlubzET\n"
           "MBEGA1UECgwKQXBwbGUgSW5jLjEPMA0GA1UECwwGQ29yZU9TMRUwEwYDVQQDDAxG\n"
           "RFItTE9DQUwtVjExJjAkBgkqhkiG9w0BCQEWF2Zkci1kZXZAZ3JvdXAuYXBwbGUu\n"
           "Y29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqDSCzDVLKL1ti0A5\n"
           "6ddmfyNhDRWpSTQM1eWgkOXeOrmXGuUF0l183cNLHmCDLCQF/gN2ZDOlH/mGv4DU\n"
           "KsVWZ4MV0fmoBUddlXlMH3lYT+4ZvWlH0bp5OX5UmVKxfvKMBl5jKkmANEZYmHu7\n"
           "VFiy3/7S4ca064Lfq1lNefMc0OM9oxulXlAICBwiwxiJKoPOa3/fgdx61lzMnWRa\n"
           "U72XCh8jZdDBJDd5wFgPVGYJMFCbAlgKrEvLPT0Ih9TiWZO97YlnvTeO2PrJtztb\n"
           "c3coQKfq9fOkLL9CyUrMUY4q7IJGBI1z4pB+UBS/ZgJ3/cBNvdhW5is2JVx113hl\n"
           "IskfCQIDAQABo24wbDAdBgNVHQ4EFgQU0QoF+nE1hlJxSQU0TutWjH2N2dUwCQYD\n"
           "VR0TBAIwADALBgNVHQ8EBAMCBeAwGgYJKoZIhvdjZAYQBA0MC3Blcm1pc3Npb25z\n"
           "MBcGCSqGSIb3Y2QGEQQKDAhjbGllbnRpZDANBgkqhkiG9w0BAQUFAAOCAQEAFjVa\n"
           "sSNfZOzLK10c16i06IRkqLx7xRo7ycnbSazwgNLxsGYNqzueBKI634nX4/MkFzgn\n"
           "sIz3rayMogDSgcZmrMe63JmvKJwOWYNFQDs2fTCFNyHBU3lQRL67dddJ8vKKUgPF\n"
           "4zLSbg80sYVkMAxpAjdIxDoXAGZX9ss8l4Z7QtbNHEUZoihXz5dWhjTUHfsNZsG4\n"
           "MxCIO9wniOpG5C/bUquZXq+Q75j4P4fC/KEfC70G/LVXzCTii+vEE6WTz8XhG2Ek\n"
           "oZt6eUiXbC8LjA4Iss8POlr9oTj1y9zsZwdUN7E6/crQhtc68El3XcGWTvveMWIw\n"
           "/Ry4bOUy5w0BVWlJEA==\n"
           "-----END CERTIFICATE-----";
      size_t v6 = 1505LL;
    }

    else
    {
      if ((a1 & 3) != 2) {
        return 9LL;
      }
      CFDataRef v5 = "-----BEGIN CERTIFICATE-----\n"
           "MIIDzDCCAbSgAwIBAgIGAflWiCu0MA0GCSqGSIb3DQEBCwUAMEcxEzARBgNVBAgM\n"
           "CkNhbGlmb3JuaWExEzARBgNVBAoMCkFwcGxlIEluYy4xGzAZBgNVBAMMEkZEUi1D\n"
           "QTEtUk9PVC1MT0NBTDAeFw0yMjA0MjEwODQ0MTFaFw0zMjA0MTgwODQ0MTFaMEgx\n"
           "CzAJBgNVBAYTAlVTMRMwEQYDVQQKDApBcHBsZSBJbmMuMRAwDgYDVQQLDAdEZXZp\n"
           "Y2VzMRIwEAYDVQQDDAlGRFItTE9DQUwwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNC\n"
           "AATstM3jcCQWuq9Bg83QA8IlrIKWDtWxssWc1c4hdDg/wsmD6Xb+xb45NCRgFnBW\n"
           "SS1+dvn52D3WUU5HVS412NMxo4GHMIGEMFoGCiqGSIb3Y2QGAQ8ETDFK/4T6iZRQ\n"
           "QzBBFgRPQkpQMTn/hKKdplQMMAoWBERHU1SgAgUA/4absdJkDDAKFgRjbGlkoAIF\n"
           "AP+Gy7nmdAwwChYEaW5zdKACBQAwEAYJKoZIhvdjZAYQBAMMASowFAYJKoZIhvdj\n"
           "ZAYRBAcMBUxvY2FsMA0GCSqGSIb3DQEBCwUAA4ICAQBvsxDEZweOcEo10OpMUpx2\n"
           "NZTy4BvSNqKOlv1nHTLqESHYTfik/L3mqTeOoWe20UkMY/e3vKwJWbgavzw7WOxb\n"
           "65bQ+ixU5VQUZzy1XlaQkIW49Tqid1WViSNNlqEXJLTj8lsplpuy5iT/WndNWczq\n"
           "opM3SkdS5YgjAqP4r8qoOAK7pSoMvLd6LTijbp9pTKDTseoXoJsVgPA/LNbW0FvR\n"
           "QxJyVVYkFnN1jtZB2ge5tqpuEuXwyCa/1bC9H8WE49uHyABIzfRaLEs7JbYvIaDH\n"
           "rgcoErGtyADmR/OvhMXryBz+USUG8bZtD/VoCsoIhoJFSVOBNDZXD59arISbjl8q\n"
           "8lbmCloZmocbUPMRinXDbpwMcAfQhv2sV/J6T5+TFAeRdSORhnwnle+56sedvugJ\n"
           "e8QOz85eTifA/KIuSTh+uKkrod3chBgHrh0PvJafOhcmYqhRbqV4guMXi53UrTLi\n"
           "VP68jydKSP2+gLinzYw/J0G/fE88SoWNBcihGjgNrfn8MIAZpVVEQ34PLozWKiXq\n"
           "hZ1VOA54XfeKlNp9Fxuuif0ZNPZ4q7ztbeR3aALN8lVkh/AfmpHNi6oN6LBu0zJw\n"
           "Z9AX2sUNOH0DOOMdojFblTdyuINrt2Tr4ccpHS1htnNR0ro82kZpkJH/zES/oYTA\n"
           "h0Sm4iIj1I5P1NFGq/jR8A==\n"
           "-----END CERTIFICATE-----";
      size_t v6 = 1379LL;
    }

    int v7 = calloc(1uLL, v6);
    *a2 = v7;
    if (v7)
    {
      memcpy(v7, v5, v6);
      uint64_t result = 0LL;
      *a3 = v6;
      return result;
    }
  }

  AMSupportLogInternal();
  return 199LL;
}

uint64_t AMFDRCryptoCopyAttestation(void *a1)
{
  if (a1 && (CFTypeID v2 = CFGetTypeID(a1), v2 == AMFDRGetTypeID()))
  {
    io_object_t v3 = (void *)a1[17];
    if (*v3 >= 0x31uLL)
    {
      CFDataRef v4 = (uint64_t (*)(void *, void))v3[6];
      if (v4) {
        return v4(a1, a1[18]);
      }
    }
  }

  else
  {
    AMSupportLogInternal();
  }

  return 0LL;
}

uint64_t AMFDRCryptoCopyRefKeyPub(void *a1)
{
  if (a1 && (CFTypeID v2 = CFGetTypeID(a1), v2 == AMFDRGetTypeID()))
  {
    io_object_t v3 = (void *)a1[17];
    if (*v3 >= 0x29uLL)
    {
      CFDataRef v4 = (uint64_t (*)(void *, void))v3[5];
      if (v4) {
        return v4(a1, a1[18]);
      }
    }
  }

  else
  {
    AMSupportLogInternal();
  }

  return 0LL;
}

BOOL AMFDRDigestMd5(uint64_t a1)
{
  if (a1)
  {
    ccmd5_di();
    ccdigest();
  }

  else
  {
    AMSupportLogInternal();
  }

  return a1 != 0;
}

uint64_t FDREncodeReStitchManifest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, _DWORD *a6)
{
  uint64_t v6 = 1LL;
  if (a1 && a3 && a5 && a6)
  {
    if (Img4DecodeInit() || Img4EncodeStitchManifest() != 100)
    {
      AMSupportLogInternal();
      return 16LL;
    }

    else if (*a5 && *a6)
    {
      return 0LL;
    }

    else
    {
      AMSupportLogInternal();
      return 10LL;
    }
  }

  return v6;
}

uint64_t FDREncodeCreateCombinedFast( uint64_t a1, int a2, void *a3, unsigned int a4, const void *a5, unsigned int a6, char **a7, _DWORD *a8)
{
  uint64_t v98 = *MEMORY[0x1895F89C0];
  v68[0] = 0LL;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v65 = 0u;
  uint64_t result = 1LL;
  if (a1 && a2 && (!a3 || a4))
  {
    BOOL v16 = a6 || a5 == 0LL;
    if (v16 && a7 && a8)
    {
      unint64_t v97 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&__int128 v17 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 v95 = v17;
      __int128 v96 = v17;
      __int128 v93 = v17;
      __int128 v94 = v17;
      __int128 v91 = v17;
      __int128 v92 = v17;
      __int128 v89 = v17;
      __int128 v90 = v17;
      __int128 v87 = v17;
      __int128 v88 = v17;
      __int128 v85 = v17;
      __int128 v86 = v17;
      __int128 v83 = v17;
      __int128 v84 = v17;
      __int128 v81 = v17;
      __int128 v82 = v17;
      __int128 v79 = v17;
      __int128 v80 = v17;
      __int128 v77 = v17;
      __int128 v78 = v17;
      __int128 v75 = v17;
      __int128 v76 = v17;
      __int128 v73 = v17;
      __int128 v74 = v17;
      __int128 v71 = v17;
      __int128 v72 = v17;
      __int128 v69 = v17;
      __int128 v70 = v17;
      if (Img4DecodeInit())
      {
        AMSupportLogInternal();
        return 16LL;
      }

      if (a3) {
        size_t v18 = a4;
      }
      else {
        size_t v18 = v71;
      }
      if (a3) {
        uint64_t v19 = a3;
      }
      else {
        uint64_t v19 = (void *)*((void *)&v70 + 1);
      }
      unsigned int v20 = _FDREncodeLength(&v65, v18);
      if (!v20) {
        return 3LL;
      }
      unsigned int v21 = v20;
      unsigned int v22 = v20 + v18 + v70 + 7;
      unsigned int v23 = _FDREncodeLength((_BYTE *)&v65 + 8, v22);
      if (!v23) {
        return 3LL;
      }
      unsigned int v24 = v23;
      v63 = v19;
      unsigned int v25 = v23 + v22;
      int v26 = v23 + v22 + 1;
      unsigned int v27 = _FDREncodeLength(&v66, v25 + 1);
      if (!v27) {
        return 3LL;
      }
      unsigned int v28 = v27;
      size_t __n = v18;
      v64 = a5;
      unsigned int v29 = v26 + v27 + 7;
      unsigned int v30 = _FDREncodeLength((_BYTE *)&v66 + 8, v29);
      if (!v30) {
        return 3LL;
      }
      unsigned int v31 = v30;
      v58 = a7;
      v59 = a8;
      if (v64)
      {
        unsigned int v32 = _FDREncodeLength(&v67, a6);
        if (!v32) {
          return 3LL;
        }
        unsigned int v33 = a6 + v32 + 7;
        size_t v60 = v32;
      }

      else
      {
        size_t v60 = 0LL;
        unsigned int v33 = 6;
      }

      unsigned int v34 = _FDREncodeLength((_BYTE *)&v67 + 8, v33);
      if (v34)
      {
        unsigned int v35 = v34;
        unsigned int v36 = v29 + v31 + v33 + v34 + 8;
        unsigned int v37 = _FDREncodeLength(v68, v36);
        if (v37)
        {
          unsigned int v38 = v37;
          size_t v39 = v36 + v37 + 1;
          v40 = (char *)calloc(1uLL, v39);
          if (!v40) {
            return 2LL;
          }
          v41 = v40;
          size_t v61 = v39;
          char *v40 = 48;
          v42 = v40 + 1;
          memcpy(v40 + 1, v68, v38);
          v43 = &v42[v38];
          *(_WORD *)v43 = 1046;
          *(_DWORD *)(v43 + 2) = *(_DWORD *)"comb";
          v44 = v43 + 7;
          v43[6] = 48;
          memcpy(v43 + 7, (char *)&v66 + 8, v31);
          v45 = &v44[v31];
          *(_WORD *)v45 = 1046;
          *(_DWORD *)(v45 + 2) = *(_DWORD *)"fdrd";
          v46 = v45 + 7;
          v45[6] = 4;
          memcpy(v45 + 7, &v66, v28);
          v47 = &v46[v28];
          *v47++ = 48;
          memcpy(v47, (char *)&v65 + 8, v24);
          v48 = &v47[v24];
          v49 = (_DWORD *)MEMORY[0x189613B40];
          *(_WORD *)v48 = 1046;
          *(_DWORD *)(v48 + 2) = *v49;
          v50 = v48 + 6;
          memcpy(v48 + 6, *((const void **)&v69 + 1), v70);
          v51 = &v50[v70];
          *v51++ = -96;
          memcpy(v51, &v65, v21);
          v52 = &v51[v21];
          memcpy(v52, v63, __n);
          v53 = &v52[__n];
          *v53++ = 48;
          memcpy(v53, (char *)&v67 + 8, v35);
          v54 = &v53[v35];
          *(_WORD *)v54 = 1046;
          *(_DWORD *)(v54 + 2) = *(_DWORD *)"secb";
          if (v64)
          {
            v55 = v54 + 7;
            v54[6] = 4;
            memcpy(v54 + 7, &v67, v60);
            v56 = &v55[v60];
            memcpy(v56, v64, a6);
            v57 = &v56[a6];
          }

          else
          {
            v57 = v54 + 6;
          }

          if (&v57[-v61] == v41)
          {
            uint64_t result = 0LL;
            *v58 = v41;
            _DWORD *v59 = v61;
          }

          else
          {
            AMSupportLogInternal();
            free(v41);
            return 10LL;
          }

          return result;
        }
      }

      return 3LL;
    }
  }

  return result;
}

_BYTE *_FDREncodeLength(_BYTE *result, unsigned int a2)
{
  v5[1] = *MEMORY[0x1895F89C0];
  if (result)
  {
    if (a2 > 0x7F)
    {
      uint64_t v3 = 0LL;
      v5[0] = 0LL;
      do
      {
        *((_BYTE *)v5 + v3++) = a2;
        BOOL v4 = a2 > 0xFF;
        a2 >>= 8;
      }

      while (v4);
      LODWORD(v2) = (_DWORD)result;
      if (v3 <= 7)
      {
        *uint64_t result = v3 | 0x80;
        CFTypeID v2 = result + 1;
        if ((_DWORD)v3)
        {
          do
            *v2++ = *((_BYTE *)&v5[-1] + v3-- + 7);
          while (v3);
        }
      }
    }

    else
    {
      *uint64_t result = a2;
      LODWORD(v2) = (_DWORD)result + 1;
    }

    return (_BYTE *)((_DWORD)v2 - (_DWORD)result);
  }

  return result;
}

uint64_t FDREncoderAddSequenceProperty(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a1 && a2 && (a3 || !a4) && DEREncoderCreate())
  {
    if (DEREncoderAddDataNoCopy()
      || a3 && DEREncoderAddDataNoCopy()
      || DEREncoderAddSequenceFromEncoder())
    {
      AMSupportLogInternal();
      uint64_t v5 = 3LL;
      AMSupportLogInternal();
    }

    else
    {
      uint64_t v5 = 0LL;
    }

    DEREncoderDestroy();
  }

  else
  {
    uint64_t v5 = 3LL;
    AMSupportLogInternal();
  }

  return v5;
}

uint64_t FDREncodeCreateFDR2Data(uint64_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v8 = DEREncoderCreate();
  if (!v8) {
    return 2LL;
  }
  uint64_t v9 = v8;
  if (DEREncoderAddDataNoCopy())
  {
    uint64_t v12 = 3LL;
  }

  else
  {
    uint64_t v10 = FDREncoderAddSequenceProperty(v9, (uint64_t)"fdrd", a1, a2);
    if ((_DWORD)v10)
    {
      uint64_t v12 = v10;
    }

    else
    {
      uint64_t v11 = FDREncoderAddSequenceProperty(v9, (uint64_t)"mft2", a3, a4);
      if (!(_DWORD)v11)
      {
        if (DEREncoderCreate())
        {
          if (DEREncoderAddSequenceFromEncoder() || DEREncoderCreateEncodedBuffer())
          {
            uint64_t v12 = 3LL;
            AMSupportLogInternal();
          }

          else
          {
            uint64_t v12 = 0LL;
          }

          DEREncoderDestroy();
        }

        else
        {
          AMSupportLogInternal();
          uint64_t v12 = 2LL;
        }

        goto LABEL_10;
      }

      uint64_t v12 = v11;
    }
  }

  AMSupportLogInternal();
LABEL_10:
  DEREncoderDestroy();
  return v12;
}

uint64_t FDREncodeSealingRequest(uint64_t **a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (!a1) {
    return 1LL;
  }
  uint64_t v8 = DEREncoderCreate();
  if (!v8) {
    return 2LL;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *a1;
  if (!*a1)
  {
    uint64_t v11 = (uint64_t *)calloc(1uLL, 8uLL);
    *a1 = v11;
    if (!v11 || (**a1 = DEREncoderCreate()) == 0)
    {
      uint64_t v12 = 2LL;
      goto LABEL_14;
    }

    if (DEREncoderAddData())
    {
      uint64_t v12 = 3LL;
      goto LABEL_23;
    }

    uint64_t v10 = *a1;
  }

  if (!*v10) {
    goto LABEL_21;
  }
  uint64_t v12 = 0LL;
  if (!a4 || !a5) {
    goto LABEL_14;
  }
  uint64_t v13 = FDREncoderAddSequenceProperty(v9, MEMORY[0x189613B38], a4, a5);
  if ((_DWORD)v13)
  {
    uint64_t v12 = v13;
LABEL_23:
    AMSupportLogInternal();
    goto LABEL_14;
  }

  if (DEREncoderAddSequenceFromEncoder())
  {
LABEL_21:
    AMSupportLogInternal();
    uint64_t v12 = 10LL;
    goto LABEL_14;
  }

  uint64_t v12 = 0LL;
LABEL_14:
  DEREncoderDestroy();
  return v12;
}

uint64_t FDREncodeSealingRequestEnd(void **a1, void *a2, _DWORD *a3)
{
  if (!a1) {
    return 1LL;
  }
  BOOL v4 = *a1;
  if (!v4) {
    return 1LL;
  }
  uint64_t v6 = 1LL;
  if (a3 && a2 && *v4)
  {
    uint64_t v8 = DEREncoderCreate();
    BOOL v4 = *a1;
    if (v8)
    {
      if (DEREncoderAddSequenceFromEncoder())
      {
        uint64_t v6 = 3LL;
      }

      else if (DEREncoderCreateEncodedBuffer())
      {
        uint64_t v6 = 2LL;
      }

      else if (*a2)
      {
        if (*a3)
        {
          uint64_t v6 = 0LL;
          goto LABEL_12;
        }

        uint64_t v6 = 10LL;
      }

      else
      {
        uint64_t v6 = 10LL;
      }

      AMSupportLogInternal();
LABEL_12:
      DEREncoderDestroy();
      BOOL v4 = *a1;
      if (!*a1) {
        return v6;
      }
      goto LABEL_13;
    }

    uint64_t v6 = 2LL;
    if (!v4) {
      return v6;
    }
  }

LABEL_13:
  if (!*v4 || (DEREncoderDestroy(), **a1 = 0LL, (BOOL v4 = *a1) != 0LL))
  {
    free(v4);
    *a1 = 0LL;
  }

  return v6;
}

  if (!*v4 || (DEREncoderDestroy(), **a1 = 0LL, (BOOL v4 = *a1) != 0LL))
  {
    free(v4);
    *a1 = 0LL;
  }

  return v6;
}

  AMFDREncodeMetadataDestroy(a1);
  return v5;
}

  AMFDREncodeMetadataDestroy(a1);
  return v5;
}

      uint64_t v10 = 1LL;
LABEL_14:
      CFRelease(v12);
      return v10;
    }

uint64_t AMFDREncodeProducerIDBegin(void *a1)
{
  if (!a1) {
    return 1LL;
  }
  CFTypeID v2 = calloc(1uLL, 8uLL);
  *a1 = v2;
  if (!v2) {
    return 2LL;
  }
  *(void *)*a1 = DEREncoderCreate();
  return 2 * (*(void *)*a1 == 0LL);
}

uint64_t AMFDREncodeProducerIDAddDigest(void *a1, uint64_t a2, int a3)
{
  if (!a1 || !*a1) {
    return 1LL;
  }
  uint64_t v3 = 1LL;
  if (a3)
  {
    if (a2)
    {
      if (*(void *)*a1)
      {
        uint64_t v3 = 0LL;
        if (DEREncoderAddData())
        {
          uint64_t v3 = 3LL;
          AMSupportLogInternal();
        }
      }
    }
  }

  return v3;
}

uint64_t AMFDREncodeProducerIDAddDigestFromData(void *a1, int *a2, uint64_t a3, unsigned int a4)
{
  uint64_t v8 = calloc(1uLL, 0x30uLL);
  if (!v8) {
    return 2LL;
  }
  uint64_t v9 = v8;
  uint64_t v10 = 1LL;
  if (a3 && a4)
  {
    else {
      uint64_t v10 = AMFDREncodeProducerIDAddDigest(a1, (uint64_t)v9, *a2);
    }
  }

  free(v9);
  return v10;
}

uint64_t _FDREncodeDigestCompute( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t *a5)
{
  uint64_t result = 6LL;
  if (a1 && a2 && a3 && a5 && *a5 <= a4)
  {
    if (DEROidCompare(a5[1], (uint64_t)&oidSha1))
    {
    }

    else if (DEROidCompare(a5[1], (uint64_t)&oidSha256))
    {
    }

    else
    {
    }

    return 3LL;
  }

  return result;
}

uint64_t AMFDREncodeProducerIDEnd(void **a1, void *a2, _DWORD *a3)
{
  if (!a1) {
    return 1LL;
  }
  BOOL v4 = *a1;
  if (!v4) {
    return 1LL;
  }
  uint64_t v6 = 1LL;
  if (a3 && a2 && *v4)
  {
    uint64_t v8 = DEREncoderCreate();
    BOOL v4 = *a1;
    if (v8)
    {
      if (DEREncoderAddSequenceFromEncoder())
      {
        uint64_t v6 = 3LL;
      }

      else if (DEREncoderCreateEncodedBuffer())
      {
        uint64_t v6 = 2LL;
      }

      else if (*a2)
      {
        if (*a3)
        {
          uint64_t v6 = 0LL;
          goto LABEL_12;
        }

        uint64_t v6 = 10LL;
      }

      else
      {
        uint64_t v6 = 10LL;
      }

      AMSupportLogInternal();
LABEL_12:
      DEREncoderDestroy();
      BOOL v4 = *a1;
      if (!*a1) {
        return v6;
      }
      goto LABEL_13;
    }

    uint64_t v6 = 2LL;
    if (!v4) {
      return v6;
    }
  }

uint64_t FDREncodeExtendedProperties(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a1) {
    return 1LL;
  }
  uint64_t result = 101LL;
  if (a2 && a3 && a4 && a5)
  {
    for (uint64_t i = 0LL; i != a2; ++i)
    {
      if (!*(_DWORD *)(a3 + 4 * i) || !*(void *)(a4 + 8 * i) || !*(_DWORD *)(a5 + 4 * i)) {
        return 101LL;
      }
    }

    __int128 v14 = *(void **)a1;
    if (!*(void *)a1)
    {
      __int128 v14 = calloc(1uLL, 0x28uLL);
      *(void *)a1 = v14;
    }

    uint64_t result = 0LL;
    *(_DWORD *)__int128 v14 = a2;
    v14[1] = a3;
    *(void *)(*(void *)a1 + 16LL) = a4;
    *(void *)(*(void *)a1 + 24LL) = a5;
    *(void *)(*(void *)a1 + 32LL) = a6;
  }

  return result;
}

uint64_t FDREncodeCreateSignedManifest()
{
  if (AMSupportRsaCreateDataFromPem())
  {
    uint64_t v1 = 3LL;
    AMSupportLogInternal();
  }

  else if (Img4EncodeCreateManifest() == 100)
  {
    AMSupportLogInternal();
    return 10LL;
  }

  else
  {
    AMSupportLogInternal();
    return 16LL;
  }

  return v1;
}

uint64_t _FDREncodeAddManifestProperties(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 101LL;
  if (!a1) {
    goto LABEL_31;
  }
  if (!a2) {
    goto LABEL_31;
  }
  if (!a3) {
    goto LABEL_31;
  }
  uint64_t v3 = Img4EncodeItemBegin();
  if ((_DWORD)v3 != 100) {
    goto LABEL_31;
  }
  uint64_t v5 = (char *)malloc(0x20uLL);
  if (!v5)
  {
    AMSupportLogInternal();
    uint64_t v3 = 2LL;
LABEL_31:
    Img4EncodeItemDestroy();
    return v3;
  }

  uint64_t v6 = v5;
  for (uint64_t i = 0LL; i != 32; i += 4LL)
    *(_DWORD *)&v6[i] = arc4random();
  uint64_t v3 = Img4EncodeItemPropertyData();
  if ((_DWORD)v3 == 100)
  {
    if (!*(void *)a3 || !*(_DWORD *)(a3 + 8) || (uint64_t v3 = Img4EncodeItemPropertyData(), (_DWORD)v3 == 100))
    {
      if (!*(void *)(a3 + 16) || !*(_DWORD *)(a3 + 24) || (uint64_t v3 = Img4EncodeItemPropertyData(), (_DWORD)v3 == 100))
      {
        uint64_t v3 = Img4EncodeItemPropertyBool();
        if ((_DWORD)v3 == 100)
        {
          uint64_t v8 = *(unsigned int **)(a3 + 48);
          if (v8 && *v8)
          {
            for (unint64_t j = 0LL; j < *v8; ++j)
            {
              int v10 = *(_DWORD *)(*((void *)v8 + 4) + 4 * j);
              if (v10)
              {
                if (v10 != 1 || *(_DWORD *)(*((void *)v8 + 3) + 4 * j) != 8)
                {
                  AMSupportLogInternal();
                  uint64_t v3 = 101LL;
                  goto LABEL_28;
                }

                uint64_t v11 = Img4EncodeItemPropertyInt64();
              }

              else
              {
                uint64_t v11 = Img4EncodeItemPropertyData();
              }

              uint64_t v3 = v11;
              if ((_DWORD)v11 != 100) {
                goto LABEL_28;
              }
              uint64_t v8 = *(unsigned int **)(a3 + 48);
            }
          }

          uint64_t v3 = Img4EncodeItemEnd();
          if ((_DWORD)v3 == 100) {
            uint64_t v3 = Img4EncodeItemCopyBuffer();
          }
        }
      }
    }
  }

LABEL_28:
  Img4EncodeItemDestroy();
  free(v6);
  return v3;
}

    AMSupportLogInternal();
    return AMSupportSafeRelease();
  }

  if (CFEqual(a2, @"Certificate"))
  {
    v15 = *(const void **)(cf + 32);
    if (v15)
    {
      CFRelease(v15);
      *(void *)(cf + 32) = 0LL;
    }

    AMFDRCryptoGetCert(cf);
  }

  return AMSupportSafeRelease();
}

uint64_t _FDREncodeAddObjectProperties(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 101LL;
  if (a1 && a2)
  {
    if (a3)
    {
      if (!*(_DWORD *)(a3 + 32))
      {
LABEL_21:
        uint64_t v3 = Img4EncodeItemCopyBuffer();
        goto LABEL_22;
      }

      uint64_t v5 = 0LL;
      unint64_t v6 = 0LL;
      while (1)
      {
        uint64_t v7 = *(void *)(a3 + 40);
        uint64_t v8 = Img4EncodeItemBegin();
        if ((_DWORD)v8 != 100) {
          break;
        }
        uint64_t v8 = Img4EncodeItemPropertyData();
        if ((_DWORD)v8 != 100) {
          break;
        }
        uint64_t v8 = Img4EncodeItemPropertyData();
        if ((_DWORD)v8 != 100) {
          break;
        }
        uint64_t v8 = Img4EncodeItemPropertyData();
        if ((_DWORD)v8 != 100) {
          break;
        }
        if (*(void *)(v7 + v5 + 48))
        {
          uint64_t v8 = Img4EncodeItemPropertyData();
          if ((_DWORD)v8 != 100) {
            break;
          }
        }

        if (*(void *)(v7 + v5 + 64))
        {
          uint64_t v8 = Img4EncodeItemPropertyData();
          if ((_DWORD)v8 != 100) {
            break;
          }
        }

        if (*(void *)(v7 + v5 + 80))
        {
          uint64_t v8 = Img4EncodeItemPropertyData();
          if ((_DWORD)v8 != 100) {
            break;
          }
        }

        uint64_t v8 = Img4EncodeItemEnd();
        if ((_DWORD)v8 != 100) {
          break;
        }
        ++v6;
        v5 += 96LL;
      }

      uint64_t v3 = v8;
    }

    AMSupportLogInternal();
  }

LABEL_22:
  Img4EncodeItemDestroy();
  return v3;
}

uint64_t FDREncodeCreateSignedData( uint64_t a1, uint64_t a2, char *a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  v48 = 0LL;
  unsigned int v47 = 0;
  v46 = 0LL;
  int v45 = 0;
  v44 = 0LL;
  int v43 = 0;
  uint64_t v41 = 0LL;
  v42 = 0LL;
  int v40 = 0;
  uint64_t v19 = *(int **)(a1 + 24);
  size_t v39 = 0LL;
  int v38 = 0;
  char v37 = 0;
  *(_DWORD *)__dst = 0;
  unsigned int v35 = 0LL;
  memset(v34, 170, sizeof(v34));
  *(void *)&__int128 v20 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v33[17] = v20;
  v33[18] = v20;
  v33[15] = v20;
  v33[16] = v20;
  v33[13] = v20;
  v33[14] = v20;
  v33[11] = v20;
  v33[12] = v20;
  v33[9] = v20;
  v33[10] = v20;
  v33[7] = v20;
  v33[8] = v20;
  v33[5] = v20;
  v33[6] = v20;
  v33[3] = v20;
  v33[4] = v20;
  v33[1] = v20;
  v33[2] = v20;
  v33[0] = v20;
  unsigned int v32 = v33;
  unsigned int v21 = calloc(1uLL, 0x30uLL);
  if (!v21)
  {
    AMSupportLogInternal();
    uint64_t v22 = 2LL;
    goto LABEL_13;
  }

  if (a4 == 4)
  {
    strncpy(__dst, a3, 4uLL);
    if (Img4EncodeCreatePayload() == 100)
    {
      if (!v48 || !v47) {
        goto LABEL_12;
      }
      uint64_t v22 = _FDREncodeDigestCompute( (uint64_t)v48,  v47,  (uint64_t)v21,  **(void **)(a1 + 16),  *(unint64_t **)(a1 + 16));
      if ((_DWORD)v22) {
        goto LABEL_13;
      }
      uint64_t v23 = AMFDREncodeProducerIDBegin(&v35);
      if ((_DWORD)v23)
      {
        uint64_t v22 = v23;
LABEL_9:
        AMSupportLogInternal();
        goto LABEL_13;
      }

      unsigned int v25 = *(uint64_t (**)(void **, int *, uint64_t))(a1 + 40);
      if (!v25) {
        goto LABEL_37;
      }
      uint64_t v26 = v25(&v39, &v38, a2);
      if ((_DWORD)v26)
      {
        uint64_t v22 = v26;
        goto LABEL_9;
      }

      if (!v39 || !v38) {
        goto LABEL_37;
      }
      uint64_t DataFromPem = AMSupportRsaCreateDataFromPem();
      if ((_DWORD)DataFromPem)
      {
        uint64_t v22 = DataFromPem;
LABEL_34:
        AMSupportLogInternal();
        goto LABEL_13;
      }

      if (AMFDRDecodeIterateCertChainBegin(v34, (uint64_t)v42, v41)
        || (AMFDRDecodeIterateCertChainNext((uint64_t)v34, &v32, &v40), v28))
      {
LABEL_37:
        AMSupportLogInternal();
LABEL_38:
        uint64_t v22 = 0LL;
        goto LABEL_13;
      }

      while (v32)
      {
        uint64_t v29 = AMFDREncodeProducerIDAddDigestFromData(&v35, v19, *((void *)v32 + 18), *((_DWORD *)v32 + 38));
        if ((_DWORD)v29
          || (uint64_t v29 = AMFDREncodeProducerIDAddDigestFromData(&v35, v19, *((void *)v32 + 32), *((_DWORD *)v32 + 66)),
              (_DWORD)v29))
        {
          uint64_t v22 = v29;
          goto LABEL_34;
        }

        uint64_t v22 = AMFDREncodeProducerIDAddDigestFromData(&v35, v19, *((void *)v32 + 34), *((_DWORD *)v32 + 70));
        if ((_DWORD)v22) {
          AMSupportLogInternal();
        }
        AMFDRDecodeIterateCertChainNext((uint64_t)v34, &v32, &v40);
        if (v30) {
          goto LABEL_34;
        }
      }

      uint64_t v31 = AMFDREncodeProducerIDEnd(&v35, &v44, &v43);
      if ((_DWORD)v31)
      {
        uint64_t v22 = v31;
        goto LABEL_34;
      }

      AMFDRTagsStringToTag((unsigned int *)a3);
      if (!FDREncodeCreateSignedManifest())
      {
        if (!v46 || !v45) {
          goto LABEL_12;
        }
        if (Img4EncodeStitchManifest() == 100)
        {
          if (a14 && a15) {
            goto LABEL_38;
          }
LABEL_12:
          AMSupportLogInternal();
          uint64_t v22 = 10LL;
          goto LABEL_13;
        }
      }
    }

    AMSupportLogInternal();
    uint64_t v22 = 16LL;
    goto LABEL_13;
  }

  AMSupportLogInternal();
  uint64_t v22 = 199LL;
LABEL_13:
  if (v48)
  {
    free(v48);
    v48 = 0LL;
  }

  if (v46) {
    free(v46);
  }
  if (v44)
  {
    free(v44);
    v44 = 0LL;
  }

  if (v42)
  {
    free(v42);
    v42 = 0LL;
  }

  if (v21) {
    free(v21);
  }
  if (v39)
  {
    free(v39);
    size_t v39 = 0LL;
  }

  if (v35) {
    AMFDREncodeProducerIDEnd(&v35, &v44, &v43);
  }
  return v22;
}

uint64_t FDREncodeCreateOfflineSignedData( uint64_t a1, uint64_t a2, uint64_t a3, int a4, char *a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v29 = 0LL;
  unsigned int v28 = 0;
  unsigned int v27 = 0LL;
  int v26 = 0;
  char v25 = 0;
  *(_DWORD *)__dst = 0;
  size_t v18 = calloc(1uLL, 0x30uLL);
  if (!v18)
  {
    AMSupportLogInternal();
    unsigned int v21 = 0LL;
    uint64_t v22 = 0LL;
LABEL_9:
    uint64_t v20 = 2LL;
    goto LABEL_14;
  }

  if (a6 == 4)
  {
    strncpy(__dst, a5, 4uLL);
    if (Img4EncodeCreatePayload() != 100)
    {
      AMSupportLogInternal();
      unsigned int v21 = 0LL;
      uint64_t v22 = 0LL;
      goto LABEL_11;
    }

    if (!v29 || !v28)
    {
      AMSupportLogInternal();
      unsigned int v21 = 0LL;
      uint64_t v22 = 0LL;
      goto LABEL_13;
    }

    uint64_t v19 = _FDREncodeDigestCompute( (uint64_t)v29,  v28,  (uint64_t)v18,  **(void **)(a1 + 16),  *(unint64_t **)(a1 + 16));
    if ((_DWORD)v19)
    {
      uint64_t v20 = v19;
      unsigned int v21 = 0LL;
      uint64_t v22 = 0LL;
      goto LABEL_14;
    }

    AMFDRTagsStringToTag((unsigned int *)a5);
    uint64_t v22 = 0LL;
    if (!a3 || !a4)
    {
LABEL_30:
      uint64_t v31 = 0LL;
      int v30 = 0;
      if (Img4EncodeCreateManifest() == 100 && (unsigned int v21 = v31) != 0LL && v30)
      {
        if (Img4EncodeStitchManifest() == 100)
        {
          if (a12 && a13)
          {
            uint64_t v20 = 0LL;
            goto LABEL_14;
          }

          AMSupportLogInternal();
LABEL_13:
          uint64_t v20 = 10LL;
          goto LABEL_14;
        }

        AMSupportLogInternal();
      }

      else
      {
        AMSupportLogInternal();
        if (v31) {
          free(v31);
        }
        AMSupportLogInternal();
        unsigned int v21 = 0LL;
      }

LABEL_11:
      uint64_t v20 = 16LL;
      goto LABEL_14;
    }

    uint64_t v22 = DEREncoderCreate();
    if (!v22) {
      goto LABEL_45;
    }
    if (!DEREncoderAddDataNoCopy())
    {
      AMSupportLogInternal();
LABEL_45:
      unsigned int v21 = 0LL;
      goto LABEL_9;
    }

    uint64_t v20 = 3LL;
    AMSupportLogInternal();
    unsigned int v21 = 0LL;
  }

  else
  {
    AMSupportLogInternal();
    unsigned int v21 = 0LL;
    uint64_t v22 = 0LL;
    uint64_t v20 = 199LL;
  }

  AMSupportLogInternal();
}

LABEL_14:
  if (v29)
  {
    free(v29);
    uint64_t v29 = 0LL;
  }

  if (v21) {
    free(v21);
  }
  if (v18) {
    free(v18);
  }
  if (v22) {
    DEREncoderDestroy();
  }
  if (v27) {
    free(v27);
  }
  return v20;
}

    uint64_t v9 = 0LL;
LABEL_17:
    int v10 = v18;
  }

  if (v10)
  {
    MEMORY[0x1895AFD60](v10);
    size_t v18 = 0LL;
  }

  if (v6) {
    free(v6);
  }
  return v9;
}

uint64_t AMFDREncodeMultiRequestBegin(uint64_t a1, int a2)
{
  if (!a2) {
    return 1LL;
  }
  uint64_t v3 = calloc(1uLL, 0x18uLL);
  *(void *)a1 = v3;
  if (v3
    && (**(void **)a1 = DEREncoderCreate()) != 0LL
    && (*(void *)(*(void *)a1 + 8LL) = DEREncoderCreate()) != 0LL
    && (*(void *)(*(void *)a1 + 16LL) = DEREncoderCreate()) != 0LL)
  {
    uint64_t v4 = 0LL;
    if (DEREncoderAddData())
    {
      uint64_t v4 = 3LL;
      AMSupportLogInternal();
    }
  }

  else
  {
    AMSupportLogInternal();
    return 2LL;
  }

  return v4;
}

uint64_t AMFDREncodeMultiRequestAddRecord( uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  if (!a1 || !*(void *)a1) {
    return 1LL;
  }
  uint64_t v7 = 1LL;
  if (a3 && a2 && *(void *)(*(void *)a1 + 16LL))
  {
    if (a4)
    {
      if (!a5) {
        goto LABEL_32;
      }
    }

    else if (a5)
    {
      goto LABEL_32;
    }

    if (a6)
    {
      if (!a7) {
        goto LABEL_32;
      }
LABEL_14:
      if (DEREncoderCreate())
      {
        if (DEREncoderCreate())
        {
          if (DEREncoderAddDataNoCopy()
            || a4 && (DEREncoderAddDataNoCopy() || DEREncoderAddDataFromEncoder())
            || a6 && DEREncoderAddDataNoCopy()
            || DEREncoderAddSequenceFromEncoder())
          {
            uint64_t v7 = 3LL;
            AMSupportLogInternal();
          }

          else
          {
            uint64_t v7 = 0LL;
          }

          DEREncoderDestroy();
          DEREncoderDestroy();
          return v7;
        }

        AMSupportLogInternal();
        DEREncoderDestroy();
      }

      else
      {
        AMSupportLogInternal();
      }

      return 2LL;
    }

    if (!a7) {
      goto LABEL_14;
    }
LABEL_32:
    AMSupportLogInternal();
  }

  return v7;
}

uint64_t AMFDREncodeMultiRequestEnd(void *a1, void *a2, _DWORD *a3)
{
  if (!a1 || (uint64_t v4 = (void *)*a1) == 0LL || !*v4 || !v4[1])
  {
    uint64_t v6 = 1LL;
    goto LABEL_17;
  }

  uint64_t v6 = 1LL;
  if (a3 && a2 && v4[2])
  {
    if (!DEREncoderCreate())
    {
      AMSupportLogInternal();
      uint64_t v6 = 2LL;
      goto LABEL_17;
    }

    if (DEREncoderAddSetFromEncoder())
    {
      uint64_t v6 = 3LL;
    }

    else if (DEREncoderAddSequenceFromEncoder() || DEREncoderAddSequenceFromEncoder())
    {
      uint64_t v6 = 3LL;
    }

    else if (DEREncoderCreateEncodedBuffer())
    {
      uint64_t v6 = 3LL;
    }

    else if (*a2)
    {
      if (*a3)
      {
        uint64_t v6 = 0LL;
LABEL_16:
        DEREncoderDestroy();
        goto LABEL_17;
      }

      uint64_t v6 = 199LL;
    }

    else
    {
      uint64_t v6 = 199LL;
    }

    AMSupportLogInternal();
    goto LABEL_16;
  }

LABEL_17:
  AMFDREncodeMultiRequestDestroy((uint64_t)a1);
  return v6;
}

      ++v13;
      uint64_t v12 = strtok_r(0LL, ".", &__lasts);
      if (!v12) {
        goto LABEL_20;
      }
    }

void AMFDREncodeMultiRequestDestroy(uint64_t a1)
{
  if (a1)
  {
    CFTypeID v2 = *(void **)a1;
    if (v2)
    {
      if (*v2)
      {
        DEREncoderDestroy();
        **(void **)a1 = 0LL;
        CFTypeID v2 = *(void **)a1;
      }

      if (v2[1])
      {
        DEREncoderDestroy();
        *(void *)(*(void *)a1 + 8LL) = 0LL;
        CFTypeID v2 = *(void **)a1;
      }

      if (!v2[2] || (DEREncoderDestroy(), *(void *)(*(void *)a1 + 16LL) = 0LL, (CFTypeID v2 = *(void **)a1) != 0LL)) {
        free(v2);
      }
      *(void *)a1 = 0LL;
    }
  }

uint64_t AMFDREncodeMultiResponseBegin(uint64_t a1)
{
  CFTypeID v2 = calloc(1uLL, 0x18uLL);
  *(void *)a1 = v2;
  if (v2
    && (**(void **)a1 = DEREncoderCreate()) != 0LL
    && (*(void *)(*(void *)a1 + 8LL) = DEREncoderCreate()) != 0LL
    && (*(void *)(*(void *)a1 + 16LL) = DEREncoderCreate()) != 0LL)
  {
    uint64_t v3 = 0LL;
    if (DEREncoderAddData())
    {
      uint64_t v3 = 3LL;
      AMSupportLogInternal();
    }
  }

  else
  {
    AMSupportLogInternal();
    return 2LL;
  }

  return v3;
}

uint64_t AMFDREncodeMultiResponseAddRecord( uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9)
{
  if (!a1 || !*(void *)a1) {
    return 1LL;
  }
  uint64_t v9 = 1LL;
  if (a5 && a4 && a3 && a2 && *(void *)(*(void *)a1 + 16LL))
  {
    if (a6)
    {
      if (!a7) {
        goto LABEL_33;
      }
    }

    else if (a7)
    {
LABEL_33:
      AMSupportLogInternal();
      return v9;
    }

    if (a8)
    {
      if (!a9) {
        goto LABEL_34;
      }
    }

    else if (a9)
    {
LABEL_34:
      AMSupportLogInternal();
      return 1LL;
    }

    if (DEREncoderCreate())
    {
      if (DEREncoderCreate())
      {
        if (DEREncoderAddDataNoCopy()
          || DEREncoderAddDataNoCopy()
          || DEREncoderAddDataFromEncoder()
          || a6 && DEREncoderAddDataNoCopy()
          || a8 && DEREncoderAddDataNoCopy()
          || DEREncoderAddSequenceFromEncoder())
        {
          uint64_t v9 = 3LL;
          AMSupportLogInternal();
        }

        else
        {
          uint64_t v9 = 0LL;
        }

        DEREncoderDestroy();
        DEREncoderDestroy();
        return v9;
      }

      AMSupportLogInternal();
      DEREncoderDestroy();
    }

    else
    {
      AMSupportLogInternal();
    }

    return 2LL;
  }

  return v9;
}

uint64_t AMFDREncodeMultiResponseEnd(uint64_t *a1, void *a2, _DWORD *a3)
{
  if (!a1 || (uint64_t v4 = *a1) == 0 || !*(void *)(v4 + 8))
  {
    uint64_t v6 = 1LL;
    goto LABEL_19;
  }

  uint64_t v6 = 1LL;
  if (a3 && a2 && *(void *)(v4 + 16))
  {
    if (!DEREncoderCreate())
    {
      AMSupportLogInternal();
      uint64_t v6 = 2LL;
      goto LABEL_19;
    }

    if (!DEREncoderCreate())
    {
      AMSupportLogInternal();
      uint64_t v6 = 2LL;
      goto LABEL_18;
    }

    if (DEREncoderAddSetFromEncoder())
    {
      uint64_t v6 = 3LL;
    }

    else if (DEREncoderAddDataFromEncoder())
    {
      uint64_t v6 = 3LL;
    }

    else if (DEREncoderAddSequenceFromEncoder() || DEREncoderAddSequenceFromEncoder())
    {
      uint64_t v6 = 3LL;
    }

    else if (DEREncoderCreateEncodedBuffer())
    {
      uint64_t v6 = 3LL;
    }

    else if (*a2)
    {
      if (*a3)
      {
        uint64_t v6 = 0LL;
LABEL_17:
        DEREncoderDestroy();
LABEL_18:
        DEREncoderDestroy();
        goto LABEL_19;
      }

      uint64_t v6 = 199LL;
    }

    else
    {
      uint64_t v6 = 199LL;
    }

    AMSupportLogInternal();
    goto LABEL_17;
  }

LABEL_19:
  AMFDREncodeMultiRequestDestroy((uint64_t)a1);
  return v6;
}

uint64_t AMFDREncodeMetadataBegin(void *a1)
{
  CFTypeID v2 = calloc(1uLL, 8uLL);
  *a1 = v2;
  if (!v2 || (uint64_t v3 = DEREncoderCreate(), result = 0LL, (*(void *)*a1 = v3) == 0LL))
  {
    AMSupportLogInternal();
    return 2LL;
  }

  return result;
}

uint64_t AMFDREncodeMetadataAddRecord(void *a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  if (!a1 || !*a1) {
    return 1LL;
  }
  uint64_t v5 = 1LL;
  if (a3 && a2 && *(void *)*a1)
  {
    if (a4)
    {
      if (!a5) {
        goto LABEL_21;
      }
    }

    else if (a5)
    {
LABEL_21:
      AMSupportLogInternal();
      return v5;
    }

    if (DEREncoderCreate())
    {
      if (DEREncoderAddDataNoCopy()
        || a4 && DEREncoderAddDataNoCopy()
        || DEREncoderAddSequenceFromEncoder())
      {
        uint64_t v5 = 3LL;
        AMSupportLogInternal();
      }

      else
      {
        uint64_t v5 = 0LL;
      }

      DEREncoderDestroy();
    }

    else
    {
      AMSupportLogInternal();
      return 2LL;
    }
  }

  return v5;
}

uint64_t AMFDREncodeMetadataEnd(void **a1, void *a2, _DWORD *a3)
{
  if (!a1 || !*a1)
  {
    uint64_t v5 = 1LL;
    goto LABEL_13;
  }

  uint64_t v5 = 1LL;
  if (a3 && a2 && **a1)
  {
    if (!DEREncoderCreate())
    {
      AMSupportLogInternal();
      uint64_t v5 = 2LL;
      goto LABEL_13;
    }

    if (DEREncoderAddSetFromEncoder())
    {
      uint64_t v5 = 3LL;
    }

    else if (DEREncoderCreateEncodedBuffer())
    {
      uint64_t v5 = 3LL;
    }

    else if (*a2)
    {
      if (*a3)
      {
        uint64_t v5 = 0LL;
LABEL_12:
        DEREncoderDestroy();
        goto LABEL_13;
      }

      uint64_t v5 = 199LL;
    }

    else
    {
      uint64_t v5 = 199LL;
    }

    AMSupportLogInternal();
    goto LABEL_12;
  }

void AMFDREncodeMetadataDestroy(void **a1)
{
  if (a1)
  {
    CFTypeID v2 = *a1;
    if (v2)
    {
      if (!*v2 || (DEREncoderDestroy(), **a1 = 0LL, (CFTypeID v2 = *a1) != 0LL)) {
        free(v2);
      }
      *a1 = 0LL;
    }
  }

uint64_t AMFDREncodeMetaPropertyBegin(void *a1)
{
  CFTypeID v2 = calloc(1uLL, 8uLL);
  *a1 = v2;
  if (!v2 || (uint64_t v3 = DEREncoderCreate(), result = 0LL, (*(void *)*a1 = v3) == 0LL))
  {
    AMSupportLogInternal();
    return 2LL;
  }

  return result;
}

uint64_t AMFDREncodeMetaPropertyAddData(int a1, void *a2, uint64_t a3, int a4)
{
  if (!a2 || !*a2 || !*(void *)*a2) {
    return 1LL;
  }
  if (a1) {
    return 0LL;
  }
  if (a3)
  {
    if (a4)
    {
      uint64_t v4 = 0LL;
      uint64_t v4 = 3LL;
    }

    else
    {
      uint64_t v4 = 1LL;
    }

LABEL_15:
    AMSupportLogInternal();
    return v4;
  }

  if (a4)
  {
    uint64_t v4 = 1LL;
    goto LABEL_15;
  }

  return 0LL;
}

uint64_t AMFDREncodeMetaPropertyEnd(void **a1, uint64_t a2, uint64_t a3, void *a4, _DWORD *a5)
{
  if (!a1 || !*a1)
  {
    uint64_t v7 = 1LL;
    goto LABEL_19;
  }

  uint64_t v7 = 1LL;
  if (!a5 || !a4 || !**a1) {
    goto LABEL_19;
  }
  if (!DEREncoderCreate())
  {
    AMSupportLogInternal();
    uint64_t v7 = 2LL;
    goto LABEL_19;
  }

  if (DEREncoderAddDataNoCopy())
  {
    uint64_t v7 = 3LL;
LABEL_25:
    AMSupportLogInternal();
    goto LABEL_18;
  }

  if (DEREncoderAddSequenceFromEncoder())
  {
    uint64_t v7 = 3LL;
    goto LABEL_25;
  }

  if (!DEREncoderCreate())
  {
    uint64_t v7 = 2LL;
    goto LABEL_25;
  }

  if (DEREncoderAddSequenceFromEncoder())
  {
    uint64_t v9 = 0LL;
LABEL_27:
    uint64_t v7 = 3LL;
    goto LABEL_32;
  }

  uint64_t v9 = DEREncoderCreate();
  if (!v9)
  {
    uint64_t v7 = 2LL;
    goto LABEL_32;
  }

  if (DEREncoderCreateEncodedBuffer())
  {
    uint64_t v7 = 3LL;
  }

  else if (*a4)
  {
    if (*a5)
    {
      uint64_t v7 = 0LL;
      goto LABEL_17;
    }

    uint64_t v7 = 199LL;
  }

  else
  {
    uint64_t v7 = 199LL;
  }

LABEL_32:
  AMSupportLogInternal();
LABEL_17:
  DEREncoderDestroy();
  DEREncoderDestroy();
  if (v9) {
LABEL_18:
  }
    DEREncoderDestroy();
LABEL_19:
  AMFDREncodeMetadataDestroy(a1);
  return v7;
}

uint64_t AMFDREncodeCreateOfflineBlob( uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5, int a6, void *a7, _DWORD *a8)
{
  uint64_t result = 1LL;
  if (a1 && a2 && a3 && a4 && a5 && a6 && a7 && a8)
  {
    if (DEREncoderCreate())
    {
      if (DEREncoderCreate())
      {
        if (DEREncoderAddDataNoCopy())
        {
          uint64_t v12 = 3LL;
        }

        else if (DEREncoderAddDataNoCopy())
        {
          uint64_t v12 = 3LL;
        }

        else if (DEREncoderAddDataNoCopy() || DEREncoderAddSequenceFromEncoder())
        {
          uint64_t v12 = 3LL;
        }

        else if (DEREncoderCreateEncodedBuffer())
        {
          uint64_t v12 = 3LL;
        }

        else if (*a7)
        {
          if (*a8)
          {
            uint64_t v12 = 0LL;
LABEL_19:
            DEREncoderDestroy();
            DEREncoderDestroy();
            return v12;
          }

          uint64_t v12 = 199LL;
        }

        else
        {
          uint64_t v12 = 199LL;
        }

        AMSupportLogInternal();
        goto LABEL_19;
      }

      AMSupportLogInternal();
      DEREncoderDestroy();
    }

    else
    {
      AMSupportLogInternal();
    }

    return 2LL;
  }

  return result;
}

uint64_t AMFDREncodeCertificateRequestBegin(uint64_t a1)
{
  if (!a1) {
    return 1LL;
  }
  CFTypeID v2 = calloc(1uLL, 0x18uLL);
  *(void *)a1 = v2;
  if (!v2
    || (**(void **)a1 = DEREncoderCreate()) == 0LL
    || (*(void *)(*(void *)a1 + 8LL) = DEREncoderCreate()) == 0LL
    || (uint64_t v3 = DEREncoderCreate(), result = 0LL, (*(void *)(*(void *)a1 + 16LL) = v3) == 0LL))
  {
    AMSupportLogInternal();
    return 2LL;
  }

  return result;
}

uint64_t AMFDREncodeCertificateRequestAddSubject(uint64_t a1, char *a2, int a3, uint64_t a4, int a5)
{
  uint64_t v11 = 0LL;
  int v10 = 0;
  uint64_t v5 = 1LL;
  if (a1 && a2 && a3 && a4 && a5)
  {
    if (DEREncoderCreate())
    {
      if (DEREncoderCreate())
      {
        int v7 = _FDREncodeCreateDataFromOid(a2, &v11, &v10);
        uint64_t v8 = v11;
        if (v7)
        {
          uint64_t v5 = 3LL;
        }

        else if (DEREncoderAddDataNoCopy() {
               || DEREncoderAddDataNoCopy()
        }
               || DEREncoderAddSequenceFromEncoder()
               || DEREncoderAddSetFromEncoder())
        {
          uint64_t v5 = 3LL;
          AMSupportLogInternal();
        }

        else
        {
          uint64_t v5 = 0LL;
        }

        if (v8) {
          free(v8);
        }
        DEREncoderDestroy();
      }

      else
      {
        AMSupportLogInternal();
        uint64_t v5 = 2LL;
      }

      DEREncoderDestroy();
    }

    else
    {
      AMSupportLogInternal();
      return 2LL;
    }
  }

  return v5;
}

uint64_t _FDREncodeCreateDataFromOid(char *a1, void *a2, _DWORD *a3)
{
  __lasts = a1;
  uint64_t v6 = malloc(0x100uLL);
  if (!v6)
  {
    AMSupportLogInternal();
    return 2LL;
  }

  int v7 = v6;
  size_t v8 = strlen(a1) + 1;
  uint64_t v9 = (char *)malloc(v8);
  int v10 = v9;
  if (!v9)
  {
    AMSupportLogInternal();
    uint64_t v23 = 2LL;
    goto LABEL_24;
  }

  memcpy(v9, a1, v8);
  uint64_t v11 = strtok_r(v10, ".", &__lasts);
  if (v11)
  {
    uint64_t v12 = v11;
    int v13 = 0;
    int v14 = 0;
    while (1)
    {
      *__error() = 0;
      unint64_t v15 = strtoul(v12, 0LL, 10);
      if (*__error() || HIDWORD(v15)) {
        break;
      }
      if (v13)
      {
        if (v13 != 1)
        {
          uint64_t v16 = 0LL;
          char v17 = 0;
          int v18 = 0;
          int v19 = v14;
          while (1)
          {
            uint64_t v20 = v16;
            for (int i = v19; v20; --v20)
            {
              v7[i] = v7[i - 1];
              --i;
            }

            v7[v14] = v15 & 0x7F | v17;
            ++v16;
            ++v19;
            char v17 = 0x80;
            BOOL v22 = v15 >= 0x80;
            v15 >>= 7;
            if (!v22)
            {
              v14 += v18;
              goto LABEL_17;
            }
          }
        }

        v7[v14] = v15 + 40 * v7[v14];
        ++v14;
      }

      else
      {
        v7[v14] = v15;
      }

uint64_t AMFDREncodeCertificateRequestAddAttribute(uint64_t a1, char *a2, int a3, uint64_t a4, int a5, int a6)
{
  uint64_t v6 = 0LL;
  int v19 = 0LL;
  int v18 = 0;
  char v17 = 0LL;
  int v16 = 0;
  uint64_t v7 = 1LL;
  if (!a1 || !a2 || !a4)
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    goto LABEL_20;
  }

  uint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  if (!a5) {
    goto LABEL_20;
  }
  uint64_t v10 = DEREncoderCreate();
  if (!v10)
  {
    AMSupportLogInternal();
    uint64_t v6 = 0LL;
    uint64_t v9 = 0LL;
LABEL_33:
    uint64_t v7 = 2LL;
    goto LABEL_20;
  }

  uint64_t v9 = DEREncoderCreate();
  if (!v9)
  {
    AMSupportLogInternal();
    uint64_t v6 = 0LL;
    goto LABEL_33;
  }

  uint64_t v6 = DEREncoderCreate();
  if (!v6)
  {
    AMSupportLogInternal();
    goto LABEL_33;
  }

  int v13 = _FDREncodeCreateDataFromOid(a2, &v17, &v16);
  int v14 = v17;
  if (v13)
  {
    uint64_t v7 = 3LL;
  }

  else if (DEREncoderAddDataNoCopy() {
         || a6 && DEREncoderAddBoolean()
  }
         || !a3 && (DEREncoderAddDataNoCopy() || DEREncoderCreateEncodedBuffer())
         || DEREncoderAddDataNoCopy()
         || DEREncoderAddSequenceFromEncoder())
  {
    uint64_t v7 = 3LL;
    AMSupportLogInternal();
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  if (v14) {
    free(v14);
  }
LABEL_20:
  if (v19)
  {
    free(v19);
    int v19 = 0LL;
  }

  if (v10) {
    DEREncoderDestroy();
  }
  if (v9) {
    DEREncoderDestroy();
  }
  if (v6) {
    DEREncoderDestroy();
  }
  return v7;
}

uint64_t AMFDREncodeCertificateRequestCreateUnsginedData( uint64_t a1, const void *a2, unsigned int a3, char *a4, char *a5, void *a6, _DWORD *a7)
{
  uint64_t v7 = 0LL;
  char v31 = 2;
  int v30 = 0LL;
  int v29 = 0;
  unsigned int v27 = 1;
  if (!a1 || !a2 || !a3 || !a4 || !a6)
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
    goto LABEL_45;
  }

  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  if (!a7) {
    goto LABEL_45;
  }
  uint64_t v14 = DEREncoderCreate();
  if (!v14)
  {
    AMSupportLogInternal();
    uint64_t v7 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
LABEL_69:
    int v25 = 2;
LABEL_74:
    unsigned int v27 = v25;
LABEL_45:
    uint64_t v23 = v27;
    if (!v14) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }

  uint64_t v13 = DEREncoderCreate();
  if (!v13)
  {
    AMSupportLogInternal();
    uint64_t v7 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    goto LABEL_69;
  }

  uint64_t v12 = DEREncoderCreate();
  if (!v12)
  {
    AMSupportLogInternal();
    uint64_t v7 = 0LL;
    uint64_t v11 = 0LL;
    goto LABEL_69;
  }

  uint64_t v11 = DEREncoderCreate();
  if (!v11)
  {
    AMSupportLogInternal();
    uint64_t v7 = 0LL;
    goto LABEL_69;
  }

  uint64_t v7 = DEREncoderCreate();
  if (!v7) {
    goto LABEL_68;
  }
  int v17 = _FDREncodeCreateDataFromOid(a4, &v30, &v29);
  int v18 = v30;
  if (v17)
  {
LABEL_71:
    if (v18)
    {
      free(v18);
      int v30 = 0LL;
    }

    int v25 = 3;
    goto LABEL_74;
  }

  if (v18)
  {
    free(v18);
    int v30 = 0LL;
  }

  if (!a5)
  {
LABEL_44:
    unsigned int v27 = 3;
    AMSupportLogInternal();
    goto LABEL_45;
  }

  int v19 = _FDREncodeCreateDataFromOid(a5, &v30, &v29);
  int v18 = v30;
  if (v19) {
    goto LABEL_71;
  }
  if (DEREncoderAddData())
  {
LABEL_70:
    AMSupportLogInternal();
    goto LABEL_71;
  }

  if (v18)
  {
    free(v18);
    int v30 = 0LL;
  }

uint64_t AMFDREncodeAddBitString(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t v5 = malloc(a3 + 1);
  if (!v5) {
    return 2LL;
  }
  uint64_t v6 = v5;
  *uint64_t v5 = 0;
  memcpy(v5 + 1, a2, a3);
  uint64_t v7 = DEREncoderAddData();
  free(v6);
  return v7;
}

uint64_t AMFDREncodeCertificateRequestEnd( uint64_t a1, const void *a2, unsigned int a3, char *a4, char *a5, char a6, void *a7, _DWORD *a8)
{
  uint64_t v8 = a1;
  uint64_t v9 = 0LL;
  int v25 = 0LL;
  int v24 = 0;
  uint64_t v10 = 1LL;
  if (!a1 || !a2 || !a3 || !a4 || !a7)
  {
    uint64_t v16 = 0LL;
    goto LABEL_40;
  }

  uint64_t v16 = 0LL;
  if (!a8) {
    goto LABEL_40;
  }
  uint64_t v16 = DEREncoderCreate();
  if (!v16)
  {
    AMSupportLogInternal();
    uint64_t v9 = 0LL;
LABEL_32:
    uint64_t v10 = 2LL;
LABEL_33:
    uint64_t v8 = a1;
    goto LABEL_40;
  }

  uint64_t v9 = DEREncoderCreate();
  if (!v9)
  {
    AMSupportLogInternal();
    goto LABEL_32;
  }

  int v19 = _FDREncodeCreateDataFromOid(a4, &v25, &v24);
  int v20 = v25;
  if (v19) {
    goto LABEL_37;
  }
  if (DEREncoderAddData())
  {
LABEL_36:
    AMSupportLogInternal();
    goto LABEL_37;
  }

  if (v20)
  {
    free(v20);
    int v25 = 0LL;
  }

  if (a5)
  {
    int v21 = _FDREncodeCreateDataFromOid(a5, &v25, &v24);
    int v20 = v25;
    if (!v21)
    {
      if (!DEREncoderAddData())
      {
        if (v20)
        {
          free(v20);
          int v25 = 0LL;
        }

        goto LABEL_20;
      }

      goto LABEL_36;
    }

LABEL_37:
    uint64_t v8 = a1;
    if (v20)
    {
      free(v20);
      int v25 = 0LL;
    }

    uint64_t v10 = 3LL;
    goto LABEL_40;
  }

  if ((a6 & 1) == 0 && DEREncoderAddDataNoCopy())
  {
    uint64_t v10 = 3LL;
    AMSupportLogInternal();
    goto LABEL_33;
  }

LABEL_20:
  uint64_t v8 = a1;
  if (!DEREncoderAddSequenceFromEncoder()
    && !AMFDREncodeAddBitString(*(void *)(*(void *)a1 + 16LL), a2, a3)
    && !DEREncoderAddSequenceFromEncoder()
    && !DEREncoderCreateEncodedBuffer())
  {
    uint64_t v10 = 0LL;
    *a7 = 0LL;
    *a8 = 0;
LABEL_25:
    DEREncoderDestroy();
    goto LABEL_26;
  }

  uint64_t v10 = 3LL;
  AMSupportLogInternal();
LABEL_40:
  if (v16) {
    goto LABEL_25;
  }
LABEL_26:
  if (v9) {
    DEREncoderDestroy();
  }
  AMFDREncodeMultiRequestDestroy(v8);
  return v10;
}

uint64_t AMFDREncodeCreatePayloadAndDigest( uint64_t a1, const char *a2, int a3, uint64_t a4, uint64_t a5, void **a6, unsigned int *a7, void *a8, _DWORD *a9)
{
  int v21 = 0LL;
  unsigned int v20 = 0;
  char v19 = 0;
  *(_DWORD *)__dst = 0;
  unint64_t v15 = calloc(1uLL, 0x30uLL);
  if (v15)
  {
    if (a3 == 4)
    {
      strncpy(__dst, a2, 4uLL);
      if (Img4EncodeCreatePayload() == 100)
      {
        if (v21
          && v20
          && !_FDREncodeDigestCompute( (uint64_t)v21,  v20,  (uint64_t)v15,  **(void **)(a1 + 16),  *(unint64_t **)(a1 + 16)))
        {
          if (a6 && a7)
          {
            *a6 = v21;
            *a7 = v20;
            int v21 = 0LL;
          }

          uint64_t v16 = 0LL;
          if (a8 && a9)
          {
            uint64_t v16 = 0LL;
            *a8 = v15;
            *a9 = **(void **)(a1 + 16);
            unint64_t v15 = 0LL;
          }
        }

        else
        {
          AMSupportLogInternal();
          uint64_t v16 = 10LL;
        }
      }

      else
      {
        AMSupportLogInternal();
        uint64_t v16 = 16LL;
      }
    }

    else
    {
      AMSupportLogInternal();
      uint64_t v16 = 199LL;
    }
  }

  else
  {
    AMSupportLogInternal();
    uint64_t v16 = 2LL;
  }

  if (v21) {
    free(v21);
  }
  if (v15) {
    free(v15);
  }
  return v16;
}

uint64_t AMFDREncodeRepairConfigurationBegin(void *a1)
{
  if (!a1)
  {
    uint64_t v3 = 1LL;
LABEL_8:
    AMSupportLogInternal();
    return v3;
  }

  CFTypeID v2 = calloc(1uLL, 8uLL);
  *a1 = v2;
  if (!v2)
  {
    uint64_t v3 = 2LL;
    goto LABEL_8;
  }

  uint64_t v3 = 0LL;
  *(void *)*a1 = DEREncoderCreate();
  if (!*(void *)*a1)
  {
    uint64_t v3 = 2LL;
    goto LABEL_8;
  }

  return v3;
}

uint64_t AMFDREncodeRepairConfigurationAddSequence(uint64_t **a1, uint64_t **a2)
{
  if ((_AMFDREncodeIsRepairConfigurationContextValid(a1) & 1) != 0
    && (uint64_t v4 = **a1, (_AMFDREncodeIsRepairConfigurationContextValid(a2) & 1) != 0))
  {
    if (a1 == a2)
    {
      uint64_t v5 = DEREncoderCreate();
      if (!v5)
      {
        AMSupportLogInternal();
        return 2LL;
      }

      uint64_t v6 = v5;
      if (DEREncoderAddSequenceFromEncoder())
      {
        DEREncoderDestroy();
LABEL_15:
        uint64_t v7 = 3LL;
        AMSupportLogInternal();
        return v7;
      }

      **a1 = v6;
      if (v4) {
        DEREncoderDestroy();
      }
    }

    else if (DEREncoderAddSequenceFromEncoder())
    {
      goto LABEL_15;
    }

    return 0LL;
  }

  else
  {
    AMSupportLogInternal();
    return 1LL;
  }

uint64_t _AMFDREncodeIsRepairConfigurationContextValid(void *a1)
{
  if (a1 && *a1 && *(void *)*a1) {
    return 1LL;
  }
  AMSupportLogInternal();
  return 0LL;
}

uint64_t AMFDREncodeRepairConfigurationAddSequenceWithKey(uint64_t **a1)
{
  if ((_AMFDREncodeIsRepairConfigurationContextValid(a1) & 1) != 0)
  {
    uint64_t v2 = **a1;
    uint64_t v3 = DEREncoderCreate();
    if (v3)
    {
      uint64_t v4 = v3;
      if (DEREncoderAddDataNoCopy() || DEREncoderAddSequenceFromEncoder())
      {
        DEREncoderDestroy();
        uint64_t v5 = 3LL;
        AMSupportLogInternal();
      }

      else
      {
        **a1 = v4;
        if (v2) {
          DEREncoderDestroy();
        }
        return 0LL;
      }
    }

    else
    {
      AMSupportLogInternal();
      return 2LL;
    }
  }

  else
  {
    AMSupportLogInternal();
    return 1LL;
  }

  return v5;
}

uint64_t AMFDREncodeRepairConfigurationAddSetWithKey(uint64_t **a1)
{
  if ((_AMFDREncodeIsRepairConfigurationContextValid(a1) & 1) != 0)
  {
    uint64_t v2 = **a1;
    uint64_t v3 = DEREncoderCreate();
    if (v3)
    {
      uint64_t v4 = v3;
      if (DEREncoderAddDataNoCopy() || DEREncoderAddSetFromEncoder())
      {
        DEREncoderDestroy();
        uint64_t v5 = 3LL;
        AMSupportLogInternal();
      }

      else
      {
        **a1 = v4;
        if (v2) {
          DEREncoderDestroy();
        }
        return 0LL;
      }
    }

    else
    {
      AMSupportLogInternal();
      return 2LL;
    }
  }

  else
  {
    AMSupportLogInternal();
    return 1LL;
  }

  return v5;
}

uint64_t AMFDREncodeRepairConfigurationAddData(void *a1, int a2, uint64_t a3, int a4)
{
  if ((_AMFDREncodeIsRepairConfigurationContextValid(a1) & 1) != 0 && a4 && a3)
  {
    switch(a2)
    {
      case 0:
      case 1:
      case 2:
        goto LABEL_10;
      case 3:
        if (DEREncoderAddUInt32())
        {
LABEL_10:
          uint64_t v7 = 3LL;
          AMSupportLogInternal();
        }

        else
        {
LABEL_7:
          uint64_t v7 = 0LL;
        }

        break;
      default:
        goto LABEL_5;
    }
  }

  else
  {
LABEL_5:
    AMSupportLogInternal();
    return 1LL;
  }

  return v7;
}

uint64_t AMFDREncodeRepairConfigurationEnd(void *a1, void *a2, _DWORD *a3)
{
  if (!_AMFDREncodeIsRepairConfigurationContextValid(a1))
  {
    uint64_t v5 = 1LL;
LABEL_15:
    AMSupportLogInternal();
    return v5;
  }

  if (!a2)
  {
    uint64_t v5 = 1LL;
    goto LABEL_15;
  }

  if (!a3)
  {
    uint64_t v5 = 1LL;
    goto LABEL_15;
  }

  if (DEREncoderCreateEncodedBuffer())
  {
    uint64_t v5 = 3LL;
    goto LABEL_15;
  }

  if (!*a2)
  {
    uint64_t v5 = 199LL;
    goto LABEL_15;
  }

  if (!*a3)
  {
    uint64_t v5 = 199LL;
    goto LABEL_15;
  }

  return 0LL;
}

uint64_t AMFDREncodeMultiCombinedDataPayloadBegin(void *a1)
{
  if (!a1)
  {
    uint64_t v3 = 199LL;
LABEL_9:
    AMSupportLogInternal();
    return v3;
  }

  uint64_t v2 = calloc(1uLL, 8uLL);
  *a1 = v2;
  if (!v2)
  {
    uint64_t v3 = 2LL;
    goto LABEL_9;
  }

  uint64_t v3 = 0LL;
  *(void *)*a1 = DEREncoderCreate();
  if (!*(void *)*a1)
  {
    uint64_t v3 = 2LL;
    goto LABEL_9;
  }

  return v3;
}

uint64_t AMFDREncodeMultiCombinedDataPayloadAddData( void *a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9)
{
  if (!a1 || !*a1) {
    return 1LL;
  }
  uint64_t v9 = 1LL;
  if (a5 && a4 && a3 && a2 && *(void *)*a1)
  {
    if (a6)
    {
      if (!a7) {
        goto LABEL_29;
      }
    }

    else if (a7)
    {
LABEL_29:
      AMSupportLogInternal();
      return v9;
    }

    if (a8)
    {
      if (!a9) {
        goto LABEL_30;
      }
    }

    else if (a9)
    {
LABEL_30:
      AMSupportLogInternal();
      return 1LL;
    }

    if (DEREncoderCreate())
    {
      if (DEREncoderAddDataNoCopy()
        || DEREncoderAddDataNoCopy()
        || a6 && DEREncoderAddDataNoCopy()
        || a8 && DEREncoderAddDataNoCopy()
        || DEREncoderAddSequenceFromEncoder())
      {
        uint64_t v9 = 3LL;
        AMSupportLogInternal();
      }

      else
      {
        uint64_t v9 = 0LL;
      }

      DEREncoderDestroy();
    }

    else
    {
      AMSupportLogInternal();
      return 2LL;
    }
  }

  return v9;
}

uint64_t AMFDREncodeMultiCombinedDataPayloadEnd(void **a1, void *a2, _DWORD *a3)
{
  if (!a1)
  {
    uint64_t v6 = 1LL;
    goto LABEL_14;
  }

  if (!*a1)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = 1LL;
    goto LABEL_20;
  }

  uint64_t v5 = 0LL;
  uint64_t v6 = 1LL;
  if (!a3 || !a2 || !**a1)
  {
LABEL_20:
    if (!v5) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  uint64_t v5 = DEREncoderCreate();
  if (!v5)
  {
    AMSupportLogInternal();
    uint64_t v6 = 2LL;
    goto LABEL_20;
  }

  if (DEREncoderAddSetFromEncoder() || DEREncoderCreateEncodedBuffer())
  {
    uint64_t v6 = 3LL;
    AMSupportLogInternal();
    goto LABEL_20;
  }

  if (Img4EncodeCreatePayload() != 100 || !*a2 || !*a3)
  {
    AMSupportLogInternal();
    uint64_t v6 = 199LL;
    goto LABEL_20;
  }

  uint64_t v6 = 0LL;
LABEL_13:
  DEREncoderDestroy();
LABEL_14:
  AMFDREncodeMetadataDestroy(a1);
  return v6;
}

uint64_t AMFDREncodeSubCCDigestsBegin(void *a1)
{
  if (!a1)
  {
    uint64_t v3 = 199LL;
LABEL_8:
    AMSupportLogInternal();
    return v3;
  }

  uint64_t v2 = calloc(1uLL, 8uLL);
  *a1 = v2;
  if (!v2)
  {
    uint64_t v3 = 2LL;
    goto LABEL_8;
  }

  uint64_t v3 = 0LL;
  *(void *)*a1 = DEREncoderCreate();
  if (!*(void *)*a1)
  {
    uint64_t v3 = 2LL;
    goto LABEL_8;
  }

  return v3;
}

uint64_t AMFDREncodeSubCCDigestsAddData(void *a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  if (!a1 || !*a1) {
    return 1LL;
  }
  uint64_t v5 = 1LL;
  if (a5 && a4 && a3 && a2 && *(void *)*a1)
  {
    if (DEREncoderCreate())
    {
      if (DEREncoderAddDataNoCopy()
        || DEREncoderAddDataNoCopy()
        || DEREncoderAddSequenceFromEncoder())
      {
        uint64_t v5 = 3LL;
        AMSupportLogInternal();
      }

      else
      {
        uint64_t v5 = 0LL;
      }

      DEREncoderDestroy();
    }

    else
    {
      AMSupportLogInternal();
      return 2LL;
    }
  }

  return v5;
}

uint64_t AMFDREncodeSubCCDigestsEnd(void **a1, void *a2, _DWORD *a3)
{
  if (!a1 || !*a1)
  {
    uint64_t v5 = 1LL;
    goto LABEL_13;
  }

  uint64_t v5 = 1LL;
  if (a3 && a2 && **a1)
  {
    if (!DEREncoderCreate())
    {
      AMSupportLogInternal();
      uint64_t v5 = 2LL;
      goto LABEL_13;
    }

    if (DEREncoderAddSetFromEncoder())
    {
      uint64_t v5 = 3LL;
    }

    else if (DEREncoderCreateEncodedBuffer())
    {
      uint64_t v5 = 3LL;
    }

    else if (*a2)
    {
      if (*a3)
      {
        uint64_t v5 = 0LL;
LABEL_12:
        DEREncoderDestroy();
        goto LABEL_13;
      }

      uint64_t v5 = 199LL;
    }

    else
    {
      uint64_t v5 = 199LL;
    }

    AMSupportLogInternal();
    goto LABEL_12;
  }

uint64_t AMFDRTagsStringToTag(unsigned int *a1)
{
  return bswap32(*a1);
}

uint64_t AMFDRErrorPushInternal( uint64_t a1, CFIndex a2, const __CFNumber *a3, const void *a4, const void *a5, const void *a6, const void *a7, const void *a8, void *value, void *a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, CFStringRef format, char a17)
{
  CFNumberRef v22 = a3;
  valuePtr = a3;
  int v25 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFStringRef v26 = CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, format, &a17);
  if (v26) {
    AMSupportLogInternal();
  }
  if (!a1)
  {
    unsigned int v28 = 0LL;
    CFNumberRef v22 = 0LL;
    if (!v26) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }

  CFIndex code = a2;
  Mutable = CFDictionaryCreateMutable(v25, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  unsigned int v28 = Mutable;
  if (!Mutable)
  {
    CFNumberRef v22 = 0LL;
    a1 = 0LL;
    if (!v26) {
      goto LABEL_39;
    }
LABEL_38:
    CFRelease(v26);
    goto LABEL_39;
  }

  if (v26) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x189604F38], v26);
  }
  if (v22)
  {
    CFNumberRef v22 = CFNumberCreate(v25, kCFNumberSInt64Type, &valuePtr);
    if (v22)
    {
      AMSupportLogInternal();
      CFDictionaryAddValue(v28, @"AMFDRTrustError", v22);
    }
  }

  if (a4) {
    CFDictionarySetValue(v28, @"MissingDataInstances", a4);
  }
  if (a5) {
    CFDictionarySetValue(v28, @"MissingMultiManifests", a5);
  }
  if (a6) {
    CFDictionarySetValue(v28, @"DigestMismatchedDataInstances", a6);
  }
  if (a7) {
    CFDictionarySetValue(v28, @"UnverifiedCombinedManifests", a7);
  }
  if (a8) {
    CFDictionarySetValue(v28, @"UnverifiedDataInstances", a8);
  }
  if (value) {
    CFDictionarySetValue(v28, @"MultiRequestErrors", value);
  }
  if (a10) {
    CFDictionarySetValue(v28, @"MissingMinimalManifests", a10);
  }
  if (a11) {
    CFDictionarySetValue(v28, @"UnverifiedMinimalManifests", a11);
  }
  if (a12) {
    CFDictionarySetValue(v28, @"MissingMinimalSealingInstances", a12);
  }
  if (a13) {
    CFDictionarySetValue(v28, @"MissingSubCCDataInstances", a13);
  }
  if (a14) {
    CFDictionarySetValue(v28, @"MismatchedProperties", a14);
  }
  if (*(void *)a1)
  {
    CFDictionaryAddValue(v28, (const void *)*MEMORY[0x189604F88], *(const void **)a1);
    if (*(void *)a1)
    {
      CFRelease(*(CFTypeRef *)a1);
      *(void *)a1 = 0LL;
    }
  }

  *(void *)a1 = CFErrorCreate(v25, @"AMFDRError", code, v28);
  a1 = 1LL;
  if (v26) {
    goto LABEL_38;
  }
LABEL_39:
  if (v28) {
    CFRelease(v28);
  }
  if (v22) {
    CFRelease(v22);
  }
  return a1;
}

uint64_t AMFDRGetTypeID()
{
  return _AMFDRTypeID;
}

uint64_t _AMFDRClassInitialize()
{
  _AMFDRTypeID = _CFRuntimeRegisterClass();
  return AMFDRCryptoInit();
}

void *AMFDRCreateWithImplementation( const __CFAllocator *a1, CFDictionaryRef theDict, void *a3, uint64_t a4)
{
  if (!theDict || (CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(a1, 0LL, theDict)) == 0LL)
  {
    AMSupportLogInternal();
    return 0LL;
  }

  uint64_t v9 = MutableCopy;
  pthread_once(&_AMFDRClassInitializeOnce, (void (*)(void))_AMFDRClassInitialize);
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v11 = (void *)Instance;
  if (Instance)
  {
    *(void *)(Instance + 144) = 0LL;
    *(_OWORD *)(Instance + 112) = 0u;
    *(_OWORD *)(Instance + 128) = 0u;
    *(_OWORD *)(Instance + 80) = 0u;
    *(_OWORD *)(Instance + 96) = 0u;
    *(_OWORD *)(Instance + 48) = 0u;
    *(_OWORD *)(Instance + 64) = 0u;
    *(_OWORD *)(Instance + 16) = 0u;
    *(_OWORD *)(Instance + 32) = 0u;
    *(void *)(Instance + 48) = AMFDRLocalStore;
    AMFDRPlatformSetImplementation(Instance, a3, a4);
    if (!CFDictionaryGetValue(theDict, @"DSURL")) {
      CFDictionarySetValue(v9, @"DSURL", @"https://skl.apple.com");
    }
    if (!CFDictionaryGetValue(theDict, @"CAURL")) {
      CFDictionarySetValue(v9, @"CAURL", @"https://gg.apple.com");
    }
    if (!CFDictionaryGetValue(theDict, @"SealingURL")) {
      CFDictionarySetValue(v9, @"SealingURL", @"https://ig.apple.com");
    }
    if ((AMFDRSetOptions((uint64_t)v11, v9) & 1) != 0)
    {
      AMFDRCryptoGetPrivateKey((uint64_t)v11);
      AMFDRCryptoGetCert((uint64_t)v11);
      if (v11[9]
        || (CFMutableDictionaryRef v12 = CFDictionaryCreateMutable(a1, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]), (v11[9] = v12) != 0LL))
      {
        if (v11[13]
          || (CFMutableDictionaryRef v13 = CFDictionaryCreateMutable(a1, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]), (v11[13] = v13) != 0LL))
        {
          if (v11[14]
            || (CFMutableDictionaryRef v14 = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]),  (v11[14] = v14) != 0LL))
          {
            if (v11[16]) {
              goto LABEL_20;
            }
            CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
            v11[16] = Mutable;
            if (Mutable) {
              goto LABEL_20;
            }
          }
        }
      }
    }

    else
    {
      CFRelease(v11);
      uint64_t v11 = 0LL;
    }
  }

  AMSupportLogInternal();
LABEL_20:
  CFRelease(v9);
  return v11;
}

uint64_t AMFDRSetOptions(uint64_t a1, CFTypeRef cf)
{
  if (!a1 || !cf)
  {
LABEL_20:
    AMSupportLogInternal();
    return 0LL;
  }

  uint64_t v4 = *(const void **)(a1 + 16);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 16) = cf;
  CFRetain(cf);
  Value = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"DataStore");
  if (!Value) {
    return 1LL;
  }
  uint64_t v6 = Value;
  CFTypeID TypeID = CFStringGetTypeID();
  if (TypeID != CFGetTypeID(v6)) {
    return 1LL;
  }
  if (CFStringCompare(v6, @"Remote", 1uLL) == kCFCompareEqualTo)
  {
    uint64_t v10 = AMFDRHTTPStore;
LABEL_17:
    *(void *)(a1 + 48) = v10;
    return 1LL;
  }

  if (CFStringCompare(v6, @"Local", 1uLL) == kCFCompareEqualTo)
  {
    uint64_t v10 = AMFDRLocalStore;
    goto LABEL_17;
  }

  uint64_t v8 = 1LL;
  if (CFStringCompare(v6, @"Memory", 1uLL) == kCFCompareEqualTo)
  {
    *(void *)(a1 + 48) = &AMFDRMemoryStore;
    if (CFDictionaryGetValue((CFDictionaryRef)cf, @"MemoryStoreURL")) {
      AMFDRLoadMemoryStoreFromFile(a1);
    }
    if (!*(void *)(a1 + 80))
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
      *(void *)(a1 + 80) = Mutable;
      if (!Mutable) {
        goto LABEL_20;
      }
    }

    return 1LL;
  }

  return v8;
}

void *AMFDRCreateWithOptions(const __CFAllocator *a1, const __CFDictionary *a2)
{
  return AMFDRCreateWithImplementation(a1, a2, 0LL, 0LL);
}

void *AMFDRCreateTypeWithOptions(CFAllocatorRef allocator, const void *a2, const __CFDictionary *a3)
{
  if (a2
    && (!a3
      ? (CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(allocator, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]))
      : (CFMutableDictionaryRef Mutable = CFDictionaryCreateMutableCopy(allocator, 0LL, a3)),
        (uint64_t v6 = Mutable) != 0LL))
  {
    CFDictionarySetValue(Mutable, @"DataStore", a2);
    uint64_t v7 = AMFDRCreateWithImplementation(allocator, v6, 0LL, 0LL);
  }

  else
  {
    AMSupportLogInternal();
    uint64_t v7 = 0LL;
  }

  AMSupportSafeRelease();
  return v7;
}

uint64_t AMFDRSetOption(uint64_t cf, const void *a2, const __CFString *a3)
{
  if (!cf) {
    goto LABEL_28;
  }
  if (!*(void *)(cf + 16)) {
    goto LABEL_28;
  }
  if (!a2) {
    goto LABEL_28;
  }
  uint64_t v6 = CFGetAllocator((CFTypeRef)cf);
  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v6, 0LL, *(CFDictionaryRef *)(cf + 16));
  uint64_t v8 = MutableCopy;
  if (!MutableCopy) {
    goto LABEL_28;
  }
  if (a3)
  {
    if (CFEqual(a2, @"Permissions"))
    {
      Value = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(cf + 16), @"Permissions");
      if (Value)
      {
        if (CFStringCompare(a3, Value, 0LL))
        {
          uint64_t v10 = *(const void **)(cf + 32);
          if (v10)
          {
            CFRelease(v10);
            *(void *)(cf + 32) = 0LL;
          }
        }
      }
    }

    CFDictionarySetValue(v8, a2, a3);
  }

  else
  {
    CFDictionaryRemoveValue(MutableCopy, a2);
  }

  if ((AMFDRSetOptions(cf, v8) & 1) == 0) {
    goto LABEL_28;
  }
  if (CFEqual(a2, @"PrivateKey"))
  {
    uint64_t v11 = &kAMFDRPlatformImplementationStation;
    if (*(_UNKNOWN **)(cf + 136) == &kAMFDRPlatformImplementationStation)
    {
      if (_AMFDRPlatformDefaultRelease)
      {
        CFMutableDictionaryRef v12 = *(void **)(cf + 144);
        if (v12)
        {
          _AMFDRPlatformDefaultRelease(v12);
          *(void *)(cf + 144) = 0LL;
          uint64_t v11 = *(void **)(cf + 136);
        }
      }

      CFMutableDictionaryRef v13 = (uint64_t (*)(void))v11[2];
      if (v13) {
        uint64_t v14 = v13(0LL);
      }
      else {
        uint64_t v14 = 0LL;
      }
      *(void *)(cf + 144) = v14;
      AMFDRCryptoGetPrivateKey(cf);
      return AMSupportSafeRelease();
    }

uint64_t AMFDRLoadMemoryStoreFromFile(uint64_t a1)
{
  uint64_t v1 = a1;
  CFDictionaryRef theDict = 0LL;
  if (!a1)
  {
    AMSupportLogInternal();
    goto LABEL_15;
  }

  uint64_t v2 = *(const __CFDictionary **)(a1 + 16);
  if (!v2 || !CFDictionaryGetValue(v2, @"MemoryStoreURL"))
  {
    AMSupportLogInternal();
    uint64_t v1 = 0LL;
    goto LABEL_15;
  }

  uint64_t URLFromString = AMSupportCreateURLFromString();
  if (!URLFromString) {
    goto LABEL_18;
  }
  char v7 = 0;
  else {
    BOOL v4 = v7 == 1;
  }
  if (v4)
  {
    else {
      BOOL v5 = theDict == 0LL;
    }
    if (!v5)
    {
      uint64_t v1 = AMFDRSetMemoryStore(v1, theDict);
      goto LABEL_15;
    }

LABEL_18:
    AMSupportLogInternal();
    uint64_t v1 = 0LL;
    goto LABEL_15;
  }

  AMSupportLogInternal();
  uint64_t v1 = 1LL;
LABEL_15:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return v1;
}

void AMFDRSetAssemblyIdentifierToVerify(uint64_t a1, void *key, const __CFString *a3)
{
  if (a1 && (BOOL v4 = *(__CFDictionary **)(a1 + 104)) != 0LL && key)
  {
    CFDictionaryRemoveValue(v4, key);
    if (a3)
    {
      CFTypeID v7 = CFGetTypeID(a3);
      if (v7 == CFStringGetTypeID() && CFStringGetLength(a3) >= 1) {
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 104), key, a3);
      }
    }
  }

  else
  {
    AMSupportLogInternal();
  }

const void *AMFDRGetAssemblyIDToVerify(uint64_t a1, const void *a2)
{
  if (a1)
  {
    uint64_t v2 = *(const __CFDictionary **)(a1 + 104);
    if (v2)
    {
      if (a2) {
        return CFDictionaryGetValue(v2, a2);
      }
    }
  }

  AMSupportLogInternal();
  return 0LL;
}

void AMFDRSetSubCCDigestsToVerify(uint64_t a1, void *key, const void *a3)
{
  if (a1 && (BOOL v4 = *(__CFDictionary **)(a1 + 128)) != 0LL && key)
  {
    CFDictionaryRemoveValue(v4, key);
    if (a3)
    {
      CFTypeID v7 = CFGetTypeID(a3);
      if (v7 == CFArrayGetTypeID() && CFArrayGetCount((CFArrayRef)a3) >= 1) {
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 128), key, a3);
      }
    }
  }

  else
  {
    AMSupportLogInternal();
  }

const void *AMFDRGetSubCCDigestsToVerify(uint64_t a1, const void *a2)
{
  if (a1)
  {
    uint64_t v2 = *(const __CFDictionary **)(a1 + 128);
    if (v2)
    {
      if (a2) {
        return CFDictionaryGetValue(v2, a2);
      }
    }
  }

  AMSupportLogInternal();
  return 0LL;
}

uint64_t AMFDRGetOptions(uint64_t a1)
{
  if (a1) {
    return *(void *)(a1 + 16);
  }
  AMSupportLogInternal();
  return 0LL;
}

uint64_t AMFDRGetInfo(uint64_t a1)
{
  if (a1) {
    return *(void *)(a1 + 72);
  }
  AMSupportLogInternal();
  return 0LL;
}

uint64_t AMFDRGetCert(uint64_t a1)
{
  if (a1) {
    return *(void *)(a1 + 32);
  }
  AMSupportLogInternal();
  return 0LL;
}

void AMFDRIncrementStat(CFMutableDictionaryRef *a1, void *key)
{
  uint64_t valuePtr = 0LL;
  if (!a1 || (uint64_t v3 = a1[9]) == 0LL || !key)
  {
    AMSupportLogInternal();
    return;
  }

  Value = (const __CFNumber *)CFDictionaryGetValue(v3, key);
  if (!Value)
  {
    uint64_t v6 = 1LL;
LABEL_8:
    uint64_t valuePtr = v6;
    CFTypeID v7 = CFGetAllocator(a1);
    CFNumberRef v8 = CFNumberCreate(v7, kCFNumberLongType, &valuePtr);
    if (v8)
    {
      CFNumberRef v9 = v8;
      CFDictionarySetValue(a1[9], key, v8);
      CFRelease(v9);
      return;
    }

    goto LABEL_11;
  }

  if (CFNumberGetValue(Value, kCFNumberLongType, &valuePtr))
  {
    uint64_t v6 = valuePtr + 1;
    goto LABEL_8;
  }

void AMFDRSetStat(CFMutableDictionaryRef *cf, const void *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  if (cf && cf[9] && a2)
  {
    BOOL v5 = CFGetAllocator(cf);
    CFNumberRef v6 = CFNumberCreate(v5, kCFNumberLongType, &valuePtr);
    if (v6)
    {
      CFNumberRef v7 = v6;
      CFDictionarySetValue(cf[9], a2, v6);
      CFRelease(v7);
    }

    else
    {
      AMSupportLogInternal();
    }
  }

  else
  {
    AMSupportLogInternal();
  }

void AMFDRCopyStatString(CFMutableDictionaryRef *cf, const void *a2, const __CFString *a3)
{
  if (cf && cf[9] && a2 && a3 && (CFNumberRef v6 = CFGetAllocator(cf), (Copy = CFStringCreateCopy(v6, a3)) != 0LL))
  {
    CFStringRef v8 = Copy;
    CFDictionarySetValue(cf[9], a2, Copy);
    CFRelease(v8);
  }

  else
  {
    AMSupportLogInternal();
  }

uint64_t AMFDRGetMemoryStore(uint64_t a1)
{
  if (a1) {
    return *(void *)(a1 + 80);
  }
  AMSupportLogInternal();
  return 0LL;
}

uint64_t AMFDRFlushMemoryStoreToFile(uint64_t a1)
{
  if (!a1) {
    goto LABEL_12;
  }
  uint64_t v2 = *(const __CFDictionary **)(a1 + 16);
  if (!v2) {
    goto LABEL_12;
  }
  uint64_t Value = (uint64_t)CFDictionaryGetValue(v2, @"MemoryStoreURL");
  if (!Value)
  {
    AMSupportLogInternal();
    goto LABEL_8;
  }

  if (!*(void *)(a1 + 80) || !AMSupportCreateURLFromString() || AMSupportWriteDictionarytoFileURL())
  {
LABEL_12:
    AMSupportLogInternal();
    uint64_t Value = 0LL;
    goto LABEL_8;
  }

  AMSupportLogInternal();
  uint64_t Value = 1LL;
LABEL_8:
  AMSupportSafeRelease();
  return Value;
}

uint64_t AMFDRSetMemoryStore(uint64_t a1, CFDictionaryRef theDict)
{
  if (a1 && theDict)
  {
    BOOL v4 = *(const __CFDictionary **)(a1 + 80);
    if (v4)
    {
      CFDictionaryGetCount(v4);
      AMSupportLogInternal();
      BOOL v5 = *(const void **)(a1 + 80);
      if (v5) {
        CFRelease(v5);
      }
      *(void *)(a1 + 80) = 0LL;
    }

    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, theDict);
    *(void *)(a1 + 80) = MutableCopy;
    if (MutableCopy) {
      return 1LL;
    }
  }

  AMSupportLogInternal();
  return 0LL;
}

uint64_t AMFDRClearMemoryStore(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(const __CFDictionary **)(a1 + 80);
    if (v2)
    {
      CFDictionaryGetCount(v2);
      AMSupportLogInternal();
      uint64_t v3 = *(const void **)(a1 + 80);
      if (v3) {
        CFRelease(v3);
      }
      *(void *)(a1 + 80) = 0LL;
    }

    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    *(void *)(a1 + 80) = Mutable;
    if (Mutable) {
      return 1LL;
    }
  }

  AMSupportLogInternal();
  return 0LL;
}

uint64_t AMFDRSetCopyMGOverrideCallback(uint64_t a1, uint64_t a2)
{
  if ((AMFDREntitlementIsEntitled(@"com.apple.libFDR.AllowIdentifierOverride") & 1) != 0 && a1)
  {
    *(void *)(a1 + 88) = a2;
    return 1LL;
  }

  else
  {
    AMSupportLogInternal();
    return 0LL;
  }

uint64_t AMFDRPerformManifestCheck(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t AMFDRCopyClientId(uint64_t a1)
{
  if (a1
    && (uint64_t v1 = *(void **)(a1 + 136), *v1 >= 0x59uLL)
    && (uint64_t v2 = (uint64_t (*)(uint64_t, void))v1[11]) != 0LL)
  {
    return v2(a1, *(void *)(a1 + 144));
  }

  else
  {
    return 0LL;
  }

uint64_t AMFDRCopyCertifyClientId(void *a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = (const __CFDictionary *)a1[2];
  if (!v2 || (uint64_t Value = CFDictionaryGetValue(v2, @"CertifyClientId")) == 0LL)
  {
    BOOL v5 = (void *)a1[17];
    if (*v5 >= 0x59uLL)
    {
      CFNumberRef v6 = (uint64_t (*)(void *, void))v5[11];
      if (v6) {
        return v6(a1, a1[18]);
      }
    }

    return 0LL;
  }

  BOOL v4 = Value;
  CFRetain(Value);
  return (uint64_t)v4;
}

CFStringRef AMFDRCopyCertifyClientIdSik(void *a1)
{
  if (!a1) {
    goto LABEL_14;
  }
  uint64_t v2 = (const __CFDictionary *)a1[2];
  if (v2 && (uint64_t Value = (const __CFData *)CFDictionaryGetValue(v2, @"CertifySikPub")) != 0LL)
  {
    BOOL v4 = Value;
    CFTypeID v5 = CFGetTypeID(Value);
    if (v5 != CFDataGetTypeID()) {
      goto LABEL_14;
    }
    CFNumberRef v6 = CFGetAllocator(a1);
    BytePtr = (UInt8 *)CFDataGetBytePtr(v4);
    CFIndex Length = CFDataGetLength(v4);
    CFDataRef SikPubDigestIfNecessary = (const __CFString *)AMFDRDataCreateSikPubDigestIfNecessary(v6, BytePtr, Length);
    if (!SikPubDigestIfNecessary) {
      goto LABEL_14;
    }
    uint64_t v10 = CFGetAllocator(a1);
    CFStringRef v11 = AMFDRCreateInstanceString(v10, SikPubDigestIfNecessary);
    if (!v11) {
      goto LABEL_14;
    }
    uint64_t v12 = (uint64_t)v11;
  }

  else
  {
    uint64_t SikPub = AMFDRCryptoGetSikPub((uint64_t)a1);
    if (!SikPub)
    {
LABEL_14:
      AMSupportLogInternal();
      CFStringRef v17 = 0LL;
      goto LABEL_13;
    }

    uint64_t v12 = SikPub;
  }

  uint64_t v14 = AMFDRCopyCertifyClientId(a1);
  if (!v14) {
    goto LABEL_14;
  }
  unint64_t v15 = CFGetAllocator(a1);
  CFStringRef v16 = CFStringCreateWithFormat(v15, 0LL, @"sik-%@-%@", v14, v12);
  if (!v16) {
    goto LABEL_14;
  }
  CFStringRef v17 = v16;
LABEL_13:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return v17;
}

CFStringRef AMFDRCopyLibraryVersionString()
{
  CFMutableDictionaryRef v0 = CFStringCreateWithFormat(0LL, 0LL, @"%s", "@(#)PROGRAM:FDR  PROJECT:libFDR-1300.60.13\n");
  if (!v0) {
    return @"libFDR-??";
  }
  CFTypeRef v1 = v0;
  CFMutableDictionaryRef MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, v0);
  if (MutableCopy)
  {
    uint64_t v3 = MutableCopy;
    CFStringTrimWhitespace(MutableCopy);
    CFRelease(v1);
    CFTypeRef v1 = CFRetain(v3);
    CFRelease(v3);
  }

  return (const __CFString *)v1;
}

uint64_t AMFDRGetTrustError(__CFError *a1)
{
  uint64_t valuePtr = 0LL;
  if (a1)
  {
    CFDictionaryRef v1 = CFErrorCopyUserInfo(a1);
    if (v1)
    {
      uint64_t v2 = v1;
      uint64_t v3 = (const void *)*MEMORY[0x189604F88];
      do
      {
        uint64_t Value = (const __CFNumber *)CFDictionaryGetValue(v2, @"AMFDRTrustError");
        CFTypeID v5 = (__CFError *)CFDictionaryGetValue(v2, v3);
        if (!v5) {
          break;
        }
        CFNumberRef v6 = v5;
        CFRelease(v2);
        uint64_t v2 = CFErrorCopyUserInfo(v6);
      }

      while (v2);
      if (Value) {
        CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
      }
      if (v2) {
        CFRelease(v2);
      }
    }
  }

  return valuePtr;
}

uint64_t AMFDRCopyUnderlyingDictionary(__CFError *a1, const void *a2)
{
  if (a1)
  {
    CFDictionaryRef v3 = CFErrorCopyUserInfo(a1);
    if (v3)
    {
      BOOL v4 = v3;
      CFTypeID v5 = (const void *)*MEMORY[0x189604F88];
      do
      {
        CFDictionaryGetValue(v4, a2);
        uint64_t Value = (__CFError *)CFDictionaryGetValue(v4, v5);
        CFRelease(v4);
        if (!Value) {
          break;
        }
        BOOL v4 = CFErrorCopyUserInfo(Value);
      }

      while (v4);
    }
  }

  return AMSupportSafeRetain();
}

CFArrayRef AMFDRNonEmptyArrayValueExists(CFDictionaryRef theDict, const void *a2)
{
  uint64_t result = 0LL;
  if (theDict)
  {
    if (a2)
    {
      uint64_t result = (const __CFArray *)CFDictionaryGetValue(theDict, a2);
      if (result)
      {
        BOOL v4 = result;
        CFTypeID v5 = CFGetTypeID(result);
        if (v5 == CFArrayGetTypeID()) {
          return (const __CFArray *)(CFArrayGetCount(v4) > 0);
        }
        else {
          return 0LL;
        }
      }
    }
  }

  return result;
}

BOOL AMFDRSetSsoCreateServiceTicketCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    *(void *)(a1 + 56) = a2;
    *(void *)(a1 + 64) = a3;
  }

  else
  {
    AMSupportLogInternal();
  }

  return a1 != 0;
}

BOOL AMFDROptionsGetBooleanValue(uint64_t a1, const void *a2, uint64_t a3)
{
  BOOL v4 = *(const __CFDictionary **)(a1 + 16);
  if (v4)
  {
    uint64_t Value = (const __CFBoolean *)CFDictionaryGetValue(v4, a2);
    if (Value)
    {
      CFNumberRef v6 = Value;
      CFTypeID v7 = CFGetTypeID(Value);
      if (v7 == CFBooleanGetTypeID()) {
        return CFBooleanGetValue(v6) != 0;
      }
    }
  }

  return a3;
}

uint64_t AMFDRIsSupported()
{
  return 1LL;
}

uint64_t _CFDictionaryAddDictionary(__CFDictionary *a1, CFDictionaryRef theDict)
{
  if (!theDict || !a1)
  {
    AMSupportLogInternal();
    return 0LL;
  }

  CFIndex Count = CFDictionaryGetCount(theDict);
  CFTypeID v5 = (const void **)malloc(8 * Count);
  CFNumberRef v6 = (const void **)malloc(8 * Count);
  CFDictionaryGetKeysAndValues(theDict, v5, v6);
  if (Count >= 1)
  {
    CFTypeID v7 = v5;
    CFStringRef v8 = v6;
    do
    {
      uint64_t v10 = *v7++;
      CFNumberRef v9 = v10;
      CFStringRef v11 = *v8++;
      CFDictionarySetValue(a1, v9, v11);
      --Count;
    }

    while (Count);
    goto LABEL_8;
  }

  if (v5) {
LABEL_8:
  }
    free(v5);
  if (v6) {
    free(v6);
  }
  return 1LL;
}

uint64_t AMFDRRegisterModuleChallengeCallback(void *a1, CFStringRef theString2, const __CFString *a3)
{
  if (!theString2 || !a3) {
    goto LABEL_11;
  }
  uint64_t v6 = a1[12];
  if (v6)
  {
    while (CFStringCompare(*(CFStringRef *)v6, theString2, 0LL))
    {
      uint64_t v6 = *(void *)(v6 + 16);
      if (!v6) {
        goto LABEL_6;
      }
    }

    *(void *)(v6 + 8) = a3;
    AMSupportLogInternal();
    return 1LL;
  }

LABEL_6:
  CFTypeID v7 = (CFStringRef *)malloc(0x18uLL);
  if (v7)
  {
    CFStringRef v8 = v7;
    CFNumberRef v9 = CFGetAllocator(a1);
    CFStringRef Copy = CFStringCreateCopy(v9, theString2);
    CFStringRef *v8 = Copy;
    if (Copy)
    {
      CFStringRef v11 = (const __CFString *)a1[12];
      v8[1] = a3;
      v8[2] = v11;
      a1[12] = v8;
      return 1LL;
    }

    AMSupportLogInternal();
    free(v8);
  }

  else
  {
LABEL_11:
    AMSupportLogInternal();
  }

  return 0LL;
}

__CFString *AMFDRCreateRecoveryPermissions( __CFString *a1, const __CFString *a2, const __CFString *a3, CFArrayRef theArray, const __CFArray *a5, uint64_t a6)
{
  if (!a1)
  {
    int v25 = @"amfdr is NULL";
LABEL_37:
    AMFDRErrorPushInternal( a6,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  (uint64_t)"AMFDRCreateRecoveryPermissions",  v25,  v26);
    return 0LL;
  }

  if (!a2)
  {
    int v25 = @"sealedDataClass is NULL";
    goto LABEL_37;
  }

  if (!a3)
  {
    int v25 = @"sealedDataInstance is NULL";
    goto LABEL_37;
  }

  if (!theArray)
  {
    int v25 = @"dataClasses is NULL";
    goto LABEL_37;
  }

  if (!a5)
  {
    int v25 = @"dataInstances is NULL";
    goto LABEL_37;
  }

  CFIndex Count = CFArrayGetCount(theArray);
  CFIndex v12 = CFArrayGetCount(a5);
  CFIndex v13 = CFArrayGetCount(theArray);
  char v14 = v13;
  if (Count != v12)
  {
    CFArrayGetCount(a5);
    AMFDRErrorPushInternal( a6,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  (uint64_t)"AMFDRCreateRecoveryPermissions",  @"CFArrayGetCount(dataClasses) (%ld) != CFArrayGetCount(dataInstances) (%ld)",  v14);
    return 0LL;
  }

  if (v13 >= 1)
  {
    CFIndex v15 = 0LL;
    PermissionsString = 0LL;
    while (1)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v15);
      if (!ValueAtIndex)
      {
        format = @"dataClass is NULL";
LABEL_27:
        AMFDRErrorPushInternal( a6,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  (uint64_t)"AMFDRCreateRecoveryPermissions",  format,  v26);
        goto LABEL_28;
      }

      int v18 = ValueAtIndex;
      CFTypeID v19 = CFGetTypeID(ValueAtIndex);
      if (v19 != CFStringGetTypeID())
      {
        AMFDRErrorPushInternal( a6,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  (uint64_t)"AMFDRCreateRecoveryPermissions",  @"Object of unexpected type '%@' for key dataClass, expected CFString",  (char)v18);
        goto LABEL_28;
      }

      unsigned int v20 = (const __CFString *)CFArrayGetValueAtIndex(a5, v15);
      if (!v20)
      {
        format = @"dataInstance is NULL";
        goto LABEL_27;
      }

      int v21 = v20;
      CFTypeID v22 = CFGetTypeID(v20);
      if (v22 != CFStringGetTypeID())
      {
        char v26 = (char)v21;
        format = @"Object of unexpected type '%@' for key dataInstance, expected CFString";
        goto LABEL_27;
      }

      if (PermissionsString)
      {
        if ((AMFDRDataAppendPermissionsString(a1, 0, v18, v21, PermissionsString) & 1) == 0)
        {
          AMFDRErrorPushInternal( a6,  2LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  (uint64_t)"AMFDRCreateRecoveryPermissions",  @"Failed to append permissions string with data class '%@', data instance '%@', action '%d'",  (char)v18);
          goto LABEL_29;
        }
      }

      else
      {
        PermissionsString = (__CFString *)AMFDRDataCreatePermissionsString(a1, 0, v18, v21);
        if (!PermissionsString)
        {
          AMFDRErrorPushInternal( a6,  2LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  (uint64_t)"AMFDRCreateRecoveryPermissions",  @"Failed to create permissions string for data class '%@', data instance '%@', action '%d'",  (char)v18);
          return PermissionsString;
        }
      }

      if (++v15 >= CFArrayGetCount(theArray)) {
        goto LABEL_20;
      }
    }
  }

  PermissionsString = 0LL;
LABEL_20:
  if ((AMFDRDataAppendPermissionsString(a1, 0, a2, a3, PermissionsString) & 1) == 0
    || (AMFDRDataAppendPermissionsString(a1, 5u, a2, a3, PermissionsString) & 1) == 0)
  {
    AMFDRErrorPushInternal( a6,  2LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  (uint64_t)"AMFDRCreateRecoveryPermissions",  @"Failed to append permissions string with data class '%@', data instance '%@', action '%d'",  (char)a2);
LABEL_28:
    if (PermissionsString)
    {
LABEL_29:
      CFRelease(PermissionsString);
      return 0LL;
    }
  }

  return PermissionsString;
}

unint64_t AMFDRSetDigest(CFTypeRef cf, uint64_t a2, uint64_t a3, const void *a4)
{
  unint64_t v4 = (unint64_t)cf;
  if (cf)
  {
    if (a2 && a3 && (CFStringRef v8 = CFGetAllocator(cf), (FullKey = AMFDRDataLocalCreateFullKey(v8, a2, a3)) != 0LL))
    {
      CFStringRef v10 = FullKey;
      CFStringRef v11 = *(__CFDictionary **)(v4 + 112);
      unint64_t v4 = v11 != 0LL;
      if (v11)
      {
        if (a4) {
          CFDictionarySetValue(v11, v10, a4);
        }
        else {
          CFDictionaryRemoveValue(v11, v10);
        }
      }

      else
      {
        AMSupportLogInternal();
      }

      CFRelease(v10);
    }

    else
    {
      AMSupportLogInternal();
      return 0LL;
    }
  }

  else
  {
    AMSupportLogInternal();
  }

  return v4;
}

BOOL AMFDRCreateDataSignature(CFTypeRef cf, int a2, uint64_t a3, uint64_t a4, void **a5, void *a6)
{
  int DataSignature = AMFDRCryptoCreateDataSignature(a2, a3, a4, a5, a6, cf);
  if (DataSignature != 100) {
    AMSupportLogInternal();
  }
  return DataSignature == 100;
}

void *AMFDRGetSikOverride(void *cf, uint64_t a2, uint64_t a3)
{
  uint64_t Value = cf;
  if (!cf) {
    return Value;
  }
  if ((*(_BYTE *)(cf[17] + 8LL) & 2) != 0) {
    return 0LL;
  }
  if (!a2 || !a3 || (uint64_t v6 = CFGetAllocator(cf), (FullKey = AMFDRDataLocalCreateFullKey(v6, a2, a3)) == 0LL))
  {
    AMSupportLogInternal();
    return 0LL;
  }

  CFStringRef v8 = FullKey;
  CFNumberRef v9 = (const __CFDictionary *)Value[15];
  if (v9) {
    uint64_t Value = CFDictionaryGetValue(v9, v8);
  }
  else {
    uint64_t Value = 0LL;
  }
  CFRelease(v8);
  return Value;
}

void AMFDRSetRestorePeriodOptions(CFTypeRef a1)
{
  CFDictionaryRef v1 = (const void *)_restorePeriodOptions;
  if ((CFTypeRef)_restorePeriodOptions != a1)
  {
    if (a1) {
      a1 = CFRetain(a1);
    }
    _restorePeriodOptions = (uint64_t)a1;
    if (v1) {
      CFRelease(v1);
    }
  }

uint64_t AMFDRGetRestorePeriodOptions()
{
  return _restorePeriodOptions;
}

uint64_t AMFDRSetRestorePeriodSsoCallback(uint64_t result, uint64_t a2)
{
  _restorePeriodSsoCallback = result;
  _restorePeriodSsoContext = a2;
  return result;
}

uint64_t AMFDREnableRestorePeriodSsoCallback(uint64_t a1)
{
  if (a1) {
    BOOL v1 = _restorePeriodSsoCallback == 0;
  }
  else {
    BOOL v1 = 1;
  }
  uint64_t v2 = !v1;
  if (!v1)
  {
    uint64_t v3 = _restorePeriodSsoContext;
    *(void *)(a1 + 56) = _restorePeriodSsoCallback;
    *(void *)(a1 + 64) = v3;
  }

  return v2;
}

uint64_t AMFDRAddMinimalManifestPropertyItemsToVerify(uint64_t a1, const __CFDictionary *cf)
{
  uint64_t v2 = a1;
  if (a1)
  {
    if (*(void *)(a1 + 16)
      && cf
      && (CFTypeID v4 = CFGetTypeID(cf), v4 == CFDictionaryGetTypeID())
      && CFDictionaryGetCount(cf) > 0)
    {
      uint64_t Value = (const __CFDictionary *)CFDictionaryGetValue( *(CFDictionaryRef *)(v2 + 16),  @"MinimalManifestPropertyCheck");
      if (Value && (v6 = Value, CFTypeID v7 = CFGetTypeID(Value), v7 == CFDictionaryGetTypeID()))
      {
        CFStringRef v8 = CFGetAllocator((CFTypeRef)v2);
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v8, 0LL, v6);
      }

      else
      {
        CFStringRef v10 = CFGetAllocator((CFTypeRef)v2);
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable(v10, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
      }

      CFStringRef v11 = (__CFString *)MutableCopy;
      if (MutableCopy)
      {
        CFIndex Count = CFDictionaryGetCount(cf);
        CFIndex v13 = (const void **)malloc(8 * Count);
        char v14 = (const void **)malloc(8 * Count);
        CFIndex v15 = v14;
        if (v13)
        {
          if (v14)
          {
            CFDictionaryGetKeysAndValues(cf, v13, v14);
            if (Count < 1)
            {
LABEL_38:
              AMFDRSetOption(v2, @"MinimalManifestPropertyCheck", v11);
              uint64_t v2 = 1LL;
              goto LABEL_41;
            }

            uint64_t v16 = 0LL;
            CFIndex v36 = Count;
            char v37 = v11;
            while (1)
            {
              CFStringRef v17 = v13[v16];
              if (!v17) {
                break;
              }
              CFTypeID v18 = CFGetTypeID(v17);
              if (v18 != CFStringGetTypeID()) {
                break;
              }
              CFTypeID v19 = v15[v16];
              if (!v19) {
                break;
              }
              CFTypeID v20 = CFGetTypeID(v19);
              if (v20 != CFArrayGetTypeID()) {
                break;
              }
              int v21 = (const __CFArray *)v15[v16];
              if (CFDictionaryContainsKey((CFDictionaryRef)v11, v13[v16]))
              {
                CFTypeID v22 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v11, v13[v16]);
                if (!v22) {
                  break;
                }
                uint64_t v23 = v22;
                CFTypeID v24 = CFGetTypeID(v22);
                if (v24 != CFArrayGetTypeID()) {
                  break;
                }
                int v25 = CFGetAllocator((CFTypeRef)v2);
                CFMutableArrayRef v26 = CFArrayCreateMutableCopy(v25, 0LL, v23);
                if (!v26) {
                  break;
                }
                unsigned int v27 = v26;
                if (CFArrayGetCount(v21) >= 1)
                {
                  unsigned int v28 = v15;
                  uint64_t v29 = v2;
                  CFIndex v30 = 0LL;
                  do
                  {
                    ValueAtIndex = CFArrayGetValueAtIndex(v21, v30);
                    if (ValueAtIndex)
                    {
                      unsigned int v32 = ValueAtIndex;
                      CFTypeID v33 = CFGetTypeID(ValueAtIndex);
                      if (v33 == CFStringGetTypeID())
                      {
                        v38.CFIndex length = CFArrayGetCount(v23);
                        v38.location = 0LL;
                        if (!CFArrayContainsValue(v23, v38, v32)) {
                          CFArrayAppendValue(v27, v32);
                        }
                      }
                    }

                    ++v30;
                  }

                  while (v30 < CFArrayGetCount(v21));
                  uint64_t v2 = v29;
                  CFIndex v15 = v28;
                  CFIndex Count = v36;
                  CFStringRef v11 = v37;
                }
              }

              else
              {
                unsigned int v27 = 0LL;
              }

              if (v27) {
                unsigned int v34 = v27;
              }
              else {
                unsigned int v34 = v21;
              }
              CFDictionarySetValue((CFMutableDictionaryRef)v11, v13[v16], v34);
              if (v27) {
                CFRelease(v27);
              }
              if (++v16 == Count) {
                goto LABEL_38;
              }
            }
          }
        }
      }

      AMSupportLogInternal();
    }

    else
    {
      AMSupportLogInternal();
      CFStringRef v11 = 0LL;
    }

    uint64_t v2 = 0LL;
  }

  else
  {
    AMSupportLogInternal();
    CFStringRef v11 = 0LL;
  }

LABEL_41:
  AMSupportSafeFree();
  AMSupportSafeFree();
  if (v11) {
    CFRelease(v11);
  }
  return v2;
}

    CFRelease(v5);
    return v23;
  }

  while (AMFDRRegisterModuleChallengeCallback(v5, *(CFStringRef *)v14, *(const __CFString **)(v14 + 8)))
  {
    char v14 = *(void *)(v14 + 16);
    if (!v14) {
      goto LABEL_21;
    }
  }

  AMSupportLogInternal();
  AMSupportLogInternal();
  uint64_t v23 = 0LL;
  if (v5) {
    goto LABEL_41;
  }
  return v23;
}

uint64_t AMFDRMigrateCredentials(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a1)
  {
    CFIndex v12 = @"amfdr is NULL";
LABEL_19:
    AMFDRErrorPushInternal( a3,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  (uint64_t)"AMFDRMigrateCredentials",  v12,  v13);
    return 0LL;
  }

  if (!a2)
  {
    CFIndex v12 = @"amfdrSource is NULL";
    goto LABEL_19;
  }

  CFTypeID v5 = (const __CFDictionary *)a2[2];
  if (!v5)
  {
    CFIndex v12 = @"amfdrSource optionsDict is NULL";
    goto LABEL_19;
  }

  if (*(void *)(a1 + 136) != a2[17])
  {
    CFIndex v12 = @"amfdr and amfdrSource have different platform implementations";
    goto LABEL_19;
  }

  uint64_t Value = (const __CFString *)CFDictionaryGetValue(v5, @"Permissions");
  if (Value) {
    AMFDRSetOption(a1, @"Permissions", Value);
  }
  CFTypeID v7 = (const __CFString *)a2[4];
  if (v7) {
    AMFDRSetOption(a1, @"Certificate", v7);
  }
  CFStringRef v8 = *(void (**)(void))(*(void *)(a1 + 136) + 24LL);
  if (v8 && *(void *)(a1 + 144))
  {
    v8();
    *(void *)(a1 + 144) = 0LL;
  }

  uint64_t v9 = a2[18];
  CFStringRef v10 = *(uint64_t (**)(uint64_t))(a2[17] + 16LL);
  if (v10) {
    uint64_t v9 = v10(v9);
  }
  *(void *)(a1 + 144) = v9;
  return 1LL;
}

CFTypeRef AMFDRCreateCopyWithOptionsOverride(uint64_t a1, const __CFDictionary *a2)
{
  context[1] = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    AMSupportLogInternal();
    return 0LL;
  }

  CFTypeID v4 = CFGetAllocator((CFTypeRef)a1);
  CFTypeID v5 = AMFDRCreateWithImplementation(v4, *(CFDictionaryRef *)(a1 + 16), 0LL, 0LL);
  uint64_t v6 = (const void *)v5[3];
  if (v6) {
    CFRelease(v6);
  }
  CFTypeID v7 = *(const void **)(a1 + 24);
  v5[3] = v7;
  if (v7) {
    CFRetain(v7);
  }
  CFStringRef v8 = (const void *)v5[4];
  if (v8) {
    CFRelease(v8);
  }
  uint64_t v9 = *(const void **)(a1 + 32);
  v5[4] = v9;
  if (v9) {
    CFRetain(v9);
  }
  *((_WORD *)v5 + 20) = *(_WORD *)(a1 + 40);
  *(_OWORD *)(v5 + 7) = *(_OWORD *)(a1 + 56);
  CFStringRef v10 = (const void *)v5[9];
  if (v10) {
    CFRelease(v10);
  }
  CFStringRef v11 = *(const void **)(a1 + 72);
  v5[9] = v11;
  if (v11) {
    CFRetain(v11);
  }
  CFIndex v12 = (const void *)v5[10];
  if (v12) {
    CFRelease(v12);
  }
  char v13 = *(const void **)(a1 + 80);
  v5[10] = v13;
  if (v13) {
    CFRetain(v13);
  }
  v5[11] = *(void *)(a1 + 88);
  uint64_t v14 = *(void *)(a1 + 96);
  if (!v14)
  {
LABEL_21:
    CFIndex v15 = (const void *)v5[13];
    if (v15) {
      CFRelease(v15);
    }
    uint64_t v16 = *(const void **)(a1 + 104);
    v5[13] = v16;
    if (v16) {
      CFRetain(v16);
    }
    CFStringRef v17 = (const void *)v5[14];
    if (v17) {
      CFRelease(v17);
    }
    CFTypeID v18 = *(const void **)(a1 + 112);
    v5[14] = v18;
    if (v18) {
      CFRetain(v18);
    }
    CFTypeID v19 = (const void *)v5[15];
    if (v19) {
      CFRelease(v19);
    }
    CFTypeID v20 = *(const void **)(a1 + 120);
    v5[15] = v20;
    if (v20) {
      CFRetain(v20);
    }
    int v21 = (const void *)v5[16];
    if (v21) {
      CFRelease(v21);
    }
    CFTypeID v22 = *(const void **)(a1 + 128);
    v5[16] = v22;
    if (v22) {
      CFRetain(v22);
    }
    if ((AMFDRPlatformSetImplementation((uint64_t)v5, *(void **)(a1 + 136), *(void *)(a1 + 144)) & 1) != 0)
    {
      if (a2)
      {
        context[0] = v5;
        CFDictionaryApplyFunction(a2, (CFDictionaryApplierFunction)_AMFDRSetCFDictionaryOptionCallback, context);
      }

      CFTypeRef v23 = CFRetain(v5);
    }

    else
    {
      AMSupportLogInternal();
      CFTypeRef v23 = 0LL;
    }

uint64_t _AMFDRSetCFDictionaryOptionCallback(const void *a1, const __CFString *a2, uint64_t *a3)
{
  return AMFDRSetOption(*a3, a1, a2);
}

CFTypeRef AMFDRCreateCopy(uint64_t a1)
{
  return AMFDRCreateCopyWithOptionsOverride(a1, 0LL);
}

double _AMFDRFinalize(void *a1)
{
  if (!a1) {
    _AMFDRFinalize_cold_1();
  }
  uint64_t v3 = a1 + 2;
  uint64_t v2 = (const void *)a1[2];
  if (v2)
  {
    CFRelease(v2);
    *uint64_t v3 = 0LL;
  }

  CFTypeID v4 = (const void *)a1[3];
  if (v4)
  {
    CFRelease(v4);
    a1[3] = 0LL;
  }

  CFTypeID v5 = (const void *)a1[4];
  if (v5)
  {
    CFRelease(v5);
    a1[4] = 0LL;
  }

  uint64_t v6 = (const void *)a1[9];
  if (v6)
  {
    CFRelease(v6);
    a1[9] = 0LL;
  }

  CFTypeID v7 = (const void *)a1[10];
  if (v7)
  {
    CFRelease(v7);
    a1[10] = 0LL;
  }

  CFStringRef v8 = (const void *)a1[13];
  if (v8)
  {
    CFRelease(v8);
    a1[13] = 0LL;
  }

  uint64_t v9 = (const void *)a1[14];
  if (v9)
  {
    CFRelease(v9);
    a1[14] = 0LL;
  }

  CFStringRef v10 = (const void *)a1[15];
  if (v10)
  {
    CFRelease(v10);
    a1[15] = 0LL;
  }

  CFStringRef v11 = (const void *)a1[16];
  if (v11)
  {
    CFRelease(v11);
    a1[16] = 0LL;
  }

  CFIndex v12 = *(void (**)(void))(a1[17] + 24LL);
  if (v12 && a1[18])
  {
    v12();
    a1[18] = 0LL;
  }

  while (1)
  {
    uint64_t v13 = a1[12];
    if (!v13) {
      break;
    }
    a1[12] = *(void *)(v13 + 16);
    if (*(void *)v13) {
      CFRelease(*(CFTypeRef *)v13);
    }
    *(void *)uint64_t v13 = 0LL;
    *(void *)(v13 + 8) = 0LL;
    *(void *)(v13 + 16) = 0LL;
    free((void *)v13);
  }

  v3[16] = 0LL;
  double result = 0.0;
  *((_OWORD *)v3 + 6) = 0u;
  *((_OWORD *)v3 + 7) = 0u;
  *((_OWORD *)v3 + 4) = 0u;
  *((_OWORD *)v3 + 5) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *(_OWORD *)uint64_t v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  return result;
}

CFStringRef _AMFDRCopyFormattingDescription(uint64_t a1)
{
  if (!a1) {
    _AMFDRCopyFormattingDescription_cold_1();
  }
  return CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"optionsDict=%@",  *(void *)(a1 + 16));
}

__SecTask *AMFDREntitlementIsEntitled(const __CFString *a1)
{
  CFErrorRef error = 0LL;
  uint64_t v2 = SecTaskCreateFromSelf(0LL);
  uint64_t v3 = v2;
  if (!v2) {
    return v3;
  }
  CFTypeID v4 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v2, a1, &error);
  CFTypeID v5 = v4;
  if (error) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0LL;
  }
  if (v6 || (CFTypeID v7 = CFGetTypeID(v4), v7 != CFBooleanGetTypeID()))
  {
    AMSupportLogInternal();
    CFRelease(v3);
    BOOL v8 = 0LL;
    uint64_t v3 = 0LL;
    if (!v5) {
      goto LABEL_10;
    }
  }

  else
  {
    BOOL v8 = CFBooleanGetValue(v5) != 0;
    CFRelease(v3);
  }

  CFRelease(v5);
  uint64_t v3 = (__SecTask *)v8;
LABEL_10:
  if (error) {
    CFRelease(error);
  }
  return v3;
}

CFTypeRef AMFDRPlatformCopyDefaultClientIdByInterface(const void *a1)
{
  if (a1)
  {
    for (uint64_t i = 0LL; i != 4; ++i)
    {
      size_t v3 = strlen(off_18A0D9388[i]);
      CFTypeRef v4 = _CopyClientIdForAdapter(a1, off_18A0D9388[i], v3);
      if (v4)
      {
        CFTypeRef v12 = v4;
        AMSupportLogInternal();
        return v12;
      }
    }

    CFTypeID v5 = if_nameindex();
    if (!v5) {
      goto LABEL_17;
    }
    BOOL v6 = v5;
    if_name = v5->if_name;
    if (if_name)
    {
      p_if_name = &v5[1].if_name;
      do
      {
        if (!strncmp(if_name, "lo0", 3uLL))
        {
          AMSupportLogInternal();
        }

        else
        {
          size_t v9 = strlen(if_name);
          CFTypeRef v10 = _CopyClientIdForAdapter(a1, if_name, v9);
          if (v10)
          {
            CFTypeRef v12 = v10;
            AMSupportLogInternal();
            goto LABEL_15;
          }
        }

        CFStringRef v11 = *p_if_name;
        p_if_name += 2;
        if_name = v11;
      }

      while (v11);
    }

    AMSupportLogInternal();
    CFTypeRef v12 = 0LL;
LABEL_15:
    MEMORY[0x1895AFD9C](v6);
  }

  else
  {
LABEL_17:
    AMSupportLogInternal();
    return 0LL;
  }

  return v12;
}

CFTypeRef _CopyClientIdForAdapter(const void *a1, char *a2, size_t a3)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  CFTypeID v18 = 0LL;
  memset(v19, 170, sizeof(v19));
  size_t __size = 0xAAAAAAAAAAAAAAAALL;
  if (!a1 || !a2 || !a3)
  {
    AMSupportLogInternal();
LABEL_24:
    CFTypeRef v9 = 0LL;
    BOOL v6 = 0LL;
    goto LABEL_17;
  }

  *(_OWORD *)CFTypeID v19 = xmmword_187992860;
  v19[4] = 3;
  v19[5] = if_nametoindex(a2);
  if (!v19[5] || sysctl(v19, 6u, 0LL, &__size, 0LL, 0LL) < 0) {
    goto LABEL_24;
  }
  BOOL v6 = (unsigned __int8 *)malloc(__size);
  if (!v6 || sysctl(v19, 6u, v6, &__size, 0LL, 0LL) < 0) {
    goto LABEL_14;
  }
  uint64_t v7 = v6[117];
  int v8 = getifaddrs(&v18);
  CFTypeRef v9 = 0LL;
  CFTypeRef v10 = v18;
  if (!v8 && v18)
  {
    CFStringRef v11 = &v6[v7 + 120];
    while (1)
    {
      if (!strncmp(a2, v10->ifa_name, a3))
      {
        ifa_addr = v10->ifa_addr;
        if (ifa_addr->sa_family == 2) {
          break;
        }
      }

      CFTypeRef v10 = v10->ifa_next;
      if (!v10) {
        goto LABEL_14;
      }
    }

    uint64_t v13 = CFGetAllocator(a1);
    CFStringRef v14 = CFStringCreateWithFormat( v13,  0LL,  @"%02x:%02x:%02x:%02x:%02x:%02x/%u.%u.%u.%u",  *v11,  v11[1],  v11[2],  v11[3],  v11[4],  v11[5],  ifa_addr->sa_data[2],  ifa_addr->sa_data[3],  ifa_addr->sa_data[4],  ifa_addr->sa_data[5]);
    if (v14)
    {
      CFStringRef v15 = v14;
      CFTypeRef v9 = CFRetain(v14);
      CFRelease(v15);
      goto LABEL_17;
    }

uint64_t AMFDRPlatformCopyDefaultClientIdByECID()
{
  CFMutableDictionaryRef v0 = AMFDRSealingMapCallMGCopyAnswer(@"UniqueChipID", 0LL);
  if (!v0)
  {
    AMSupportLogInternal();
    return 0LL;
  }

  BOOL v1 = v0;
  uint64_t v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFStringRef v3 = AMFDRCreateInstanceString((const __CFAllocator *)*MEMORY[0x189604DB0], v0);
  if (!v3)
  {
    AMSupportLogInternal();
    CFRelease(v1);
    return 0LL;
  }

  CFStringRef v4 = v3;
  CFTypeID v5 = AMFDRSealingMapCallMGCopyAnswer(@"ChipID", 0LL);
  if (v5)
  {
    CFStringRef v6 = AMFDRCreateInstanceString(v2, v5);
    CFStringRef v7 = v6;
    if (v6)
    {
      CFStringRef v8 = CFStringCreateWithFormat(v2, 0LL, @"%@-%@", v6, v4);
      if (v8)
      {
        uint64_t v9 = AMSupportSafeRetain();
      }

      else
      {
        AMSupportLogInternal();
        uint64_t v9 = 0LL;
      }

      goto LABEL_7;
    }

    AMSupportLogInternal();
    uint64_t v9 = 0LL;
  }

  else
  {
    AMSupportLogInternal();
    uint64_t v9 = 0LL;
    CFStringRef v7 = 0LL;
  }

  CFStringRef v8 = 0LL;
LABEL_7:
  CFRelease(v4);
  CFRelease(v1);
  if (v5) {
    CFRelease(v5);
  }
  if (v7) {
    CFRelease(v7);
  }
  if (v8) {
    CFRelease(v8);
  }
  return v9;
}

uint64_t AMFDRPlatformCopyDefaultDataDirectoryAppendingPathComponent(const void *a1)
{
  uid_t v2 = getuid();
  CFStringRef v3 = getpwuid(v2);
  if (v3)
  {
    pw_dir = v3->pw_dir;
    if (pw_dir)
    {
      CFTypeID v5 = CFGetAllocator(a1);
      CFIndex v6 = strlen(pw_dir);
      CFURLRef v7 = CFURLCreateFromFileSystemRepresentation(v5, (const UInt8 *)pw_dir, v6, 0);
      if (v7)
      {
        CFStringRef v8 = v7;
        uint64_t v9 = CFGetAllocator(a1);
        CFURLRef v10 = CFURLCreateCopyAppendingPathComponent(v9, v8, @"Library/Application Support/FDR", 1u);
        if (v10)
        {
          CFURLRef v11 = v10;
          if (!MEMORY[0x1895AF1E4]())
          {
            CFGetAllocator(a1);
            AMSupportCopyURLWithAppendedComponent();
          }

          CFRelease(v8);
        }

        else
        {
          CFURLRef v11 = v8;
        }

        CFRelease(v11);
      }
    }
  }

  return 0LL;
}

CFURLRef AMFDRPlatformCopyDefaultDataStoragePath()
{
  if (MEMORY[0x189610B78])
  {
    CFMutableDictionaryRef v0 = (const char *)calloc(1uLL, 0x400uLL);
    if (!v0 || lookupPathForPersistentData()) {
      goto LABEL_11;
    }
    CFIndex v1 = strlen(v0);
    CFURLRef v2 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x189604DB0], (const UInt8 *)v0, v1, 0);
  }

  else
  {
    CFStringRef v3 = (const __CFBoolean *)MGCopyAnswer();
    CFStringRef v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFTypeID v5 = @"/System/Library/Caches/com.apple.factorydata";
    if (v3 && CFBooleanGetValue(v3) == 1) {
      CFTypeID v5 = @"/mnt1/System/Library/Caches/com.apple.factorydata";
    }
    CFURLRef v2 = CFURLCreateWithFileSystemPath(v4, v5, kCFURLPOSIXPathStyle, 1u);
  }

  if (!v2)
  {
LABEL_11:
    AMSupportLogInternal();
    CFURLRef v2 = 0LL;
  }

  AMSupportSafeFree();
  AMSupportSafeRelease();
  return v2;
}

CFStringRef AMFDRDataCreateString(const __CFAllocator *a1, const __CFString *cf, int a3)
{
  if (!cf) {
    return 0LL;
  }
  CFTypeID v6 = CFGetTypeID(cf);
  if (v6 == CFStringGetTypeID())
  {
    if (!a3) {
      return CFStringCreateCopy(a1, cf);
    }
    CFTypeID v7 = CFGetTypeID(cf);
    if (v7 == CFStringGetTypeID())
    {
      CFIndex Length = CFStringGetLength(cf);
      if ((unint64_t)(Length - 211) < 0xFFFFFFFFFFFFFF2ELL)
      {
        AMSupportLogInternal();
      }

      else
      {
        CFIndex v9 = Length;
        BOOL v10 = 0;
        CFIndex v11 = 0LL;
        do
        {
          int CharacterAtIndex = CFStringGetCharacterAtIndex(cf, v11);
          if ((CharacterAtIndex - 48) >= 0xA && (CharacterAtIndex & 0xFFFFFFDF) - 65 >= 0x1A)
          {
            uint64_t v14 = 0LL;
            while (CharacterAtIndex != asc_18799A86B[v14])
            {
              if (++v14 == 4) {
                goto LABEL_16;
              }
            }
          }

          BOOL v10 = ++v11 >= v9;
        }

        while (v11 != v9);
LABEL_16:
        if (v10) {
          return CFStringCreateCopy(a1, cf);
        }
      }
    }

    goto LABEL_37;
  }

  CFTypeID v16 = CFGetTypeID(cf);
  if (v16 == CFDataGetTypeID()) {
    return (CFStringRef)AMSupportCopyHexStringFromData();
  }
  CFTypeID v17 = CFGetTypeID(cf);
  if (v17 == CFBooleanGetTypeID())
  {
    if ((const __CFString *)*MEMORY[0x189604DE8] == cf) {
      CFTypeID v18 = "1";
    }
    else {
      CFTypeID v18 = "0";
    }
    return CFStringCreateWithFormat(a1, 0LL, @"%s", v18);
  }

  CFTypeID v19 = CFGetTypeID(cf);
  if (v19 != CFNumberGetTypeID() || CFNumberIsFloatType((CFNumberRef)cf)) {
    goto LABEL_37;
  }
  unint64_t ByteSize = CFNumberGetByteSize((CFNumberRef)cf);
  if (ByteSize <= 4)
  {
    int valuePtr = -1431655766;
    if (CFNumberGetValue((CFNumberRef)cf, kCFNumberIntType, &valuePtr)) {
      goto LABEL_29;
    }
    goto LABEL_43;
  }

  if (ByteSize != 8)
  {
LABEL_37:
    AMSupportLogInternal();
    return 0LL;
  }

  unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
  if (CFNumberGetValue((CFNumberRef)cf, kCFNumberLongLongType, &v22))
  {
    if (HIDWORD(v22))
    {
      CFStringRef result = (CFStringRef)AMSupportCopyHexStringFromUInt64();
      goto LABEL_30;
    }

LABEL_29:
    CFStringRef result = (CFStringRef)AMSupportCopyHexStringFromUInt32();
LABEL_30:
    int v21 = 1;
    goto LABEL_31;
  }

LABEL_43:
  CFStringRef result = (CFStringRef)AMSupportLogInternal();
  int v21 = 4;
LABEL_31:
  if (v21 == 4) {
    return 0LL;
  }
  return result;
}

CFStringRef AMFDRCreateInstanceString(const __CFAllocator *a1, const __CFString *a2)
{
  return AMFDRDataCreateString(a1, a2, 1);
}

CFStringRef AMFDRDataCreateSikInstanceString(const __CFAllocator *a1, uint64_t a2)
{
  CFStringRef v3 = (__CFString *)AMFDRCreateTypeWithOptions(a1, @"Local", 0LL);
  if (v3)
  {
    SikInstanceStringInternal = AMFDRDataCreateSikInstanceStringInternal(v3, 0LL, a2);
  }

  else
  {
    AMSupportLogInternal();
    SikInstanceStringInternal = 0LL;
  }

  AMSupportSafeRelease();
  return SikInstanceStringInternal;
}

CFStringRef AMFDRDataCreateSikInstanceStringInternal(__CFString *cf, uint64_t a2, uint64_t a3)
{
  CFStringRef v3 = cf;
  if (cf)
  {
    if (a3
      && (a2 && (uint64_t SikPub = (uint64_t)AMFDRGetSikOverride(cf, a2, a3)) != 0
       || (uint64_t SikPub = AMFDRCryptoGetSikPub((uint64_t)v3)) != 0)
      && (CFTypeID v6 = CFGetAllocator(v3),
          CFTypeID v7 = CFStringCreateWithFormat(v6, 0LL, @"sik-%@-%@", a3, SikPub),
          (CFStringRef v8 = v7) != 0LL)
      && CFStringGetLength(v7) < 211)
    {
      CFStringRef v3 = v8;
    }

    else
    {
      AMSupportLogInternal();
      CFStringRef v3 = 0LL;
    }
  }

  else
  {
    AMSupportLogInternal();
  }

  AMSupportSafeRelease();
  return v3;
}

CFStringRef AMFDRDataCreateInstanceString(__CFString *a1, uint64_t a2, const void *a3)
{
  if (a3)
  {
    else {
      return (const __CFString *)CFRetain(a3);
    }
  }

  else
  {
    AMSupportLogInternal();
    return 0LL;
  }

BOOL AMFDRDataInstanceUseSikFormat(uint64_t a1)
{
  if (!a1) {
    return AMFDRSealingMapGetFDRDataVersionForDeviceInternal(0LL) == 2;
  }
  uint64_t v2 = *(void *)(*(void *)(a1 + 136) + 8LL);
  if ((v2 & 8) != 0)
  {
    BOOL v3 = 1LL;
    if ((v2 & 2) != 0) {
      return 0LL;
    }
  }

  else
  {
    BOOL v3 = AMFDRSealingMapGetFDRDataVersionForDeviceInternal(a1) == 2;
    if ((*(void *)(*(void *)(a1 + 136) + 8LL) & 2) != 0) {
      return 0LL;
    }
  }

  CFStringRef v4 = (const __CFDictionary *)AMFDRGetOptions(a1);
  if (v4)
  {
    uint64_t Value = (const __CFBoolean *)CFDictionaryGetValue(v4, @"UseSikDataInstance");
    if (Value) {
      return CFBooleanGetValue(Value) != 0;
    }
  }

  else
  {
    AMSupportLogInternal();
  }

  return v3;
}

CFStringRef AMFDRDataCreatePermissionsString( __CFString *cf, unsigned int a2, const __CFString *a3, const __CFString *a4)
{
  CFStringRef v4 = a4;
  if (a4)
  {
    if (cf) {
      CFStringRef v8 = CFGetAllocator(cf);
    }
    else {
      CFStringRef v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    }
    CFMutableDictionaryRef Mutable = CFStringCreateMutable(v8, 0LL);
    if (Mutable)
    {
      BOOL v10 = Mutable;
      if ((AMFDRDataAppendPermissionsString(cf, a2, a3, v4, Mutable) & 1) != 0)
      {
        CFStringRef v4 = (const __CFString *)CFRetain(v10);
      }

      else
      {
        AMSupportLogInternal();
        CFStringRef v4 = 0LL;
      }

      CFRelease(v10);
    }

    else
    {
      AMSupportLogInternal();
      return 0LL;
    }
  }

  else
  {
    AMSupportLogInternal();
  }

  return v4;
}

uint64_t AMFDRDataAppendPermissionsString( __CFString *cf, unsigned int a2, const __CFString *a3, const __CFString *a4, __CFString *a5)
{
  if (!a4) {
    goto LABEL_16;
  }
  if (a2 == 10) {
    goto LABEL_7;
  }
  if (a2 != 8)
  {
    InstanceString = AMFDRDataCreateInstanceString(cf, (uint64_t)a3, a4);
    if (InstanceString)
    {
      CFTypeRef v12 = InstanceString;
      if ((AMFDRAppendPermissionsString(a2, a3, InstanceString, a5) & 1) == 0)
      {
LABEL_17:
        AMSupportLogInternal();
        uint64_t v10 = 0LL;
        goto LABEL_14;
      }

LABEL_16:
    AMSupportLogInternal();
    return 0LL;
  }

  if (!AMFDRSealingMapEntryHasAttributeForClassInternal((uint64_t)cf, a3, @"ChallengeClaim", 0LL))
  {
LABEL_7:
    SikInstanceStringInternal = AMFDRDataCreateSikInstanceStringInternal(cf, (uint64_t)a3, (uint64_t)a4);
    if (SikInstanceStringInternal)
    {
      CFTypeRef v12 = SikInstanceStringInternal;
      if ((AMFDRAppendPermissionsString(1u, a3, SikInstanceStringInternal, a5) & 1) == 0
        || (AMFDRAppendPermissionsString(0, a3, a4, a5) & 1) == 0)
      {
        goto LABEL_17;
      }

      goto LABEL_13;
    }

    goto LABEL_16;
  }

  if ((AMFDRAppendPermissionsString(8u, a3, a4, a5) & 1) == 0) {
    goto LABEL_16;
  }
  return 1LL;
}

CFStringRef AMFDRCreatePermissionsString( const __CFAllocator *a1, unsigned int a2, const __CFString *a3, const __CFString *a4)
{
  if (!a3) {
    goto LABEL_10;
  }
  CFStringRef v4 = a4;
  if (!a4)
  {
    AMSupportLogInternal();
    return v4;
  }

  CFMutableDictionaryRef Mutable = CFStringCreateMutable(a1, 0LL);
  if (!Mutable)
  {
LABEL_10:
    AMSupportLogInternal();
    return 0LL;
  }

  CFStringRef v8 = Mutable;
  if ((AMFDRAppendPermissionsString(a2, a3, v4, Mutable) & 1) != 0)
  {
    CFStringRef v4 = (const __CFString *)CFRetain(v8);
  }

  else
  {
    AMSupportLogInternal();
    CFStringRef v4 = 0LL;
  }

  CFRelease(v8);
  return v4;
}

uint64_t AMFDRAppendPermissionsString( unsigned int a1, CFStringRef theString, const __CFString *a3, __CFString *a4)
{
  if (!theString
    || !a3
    || !a4
    || a1 >= 0xF
    || ((0x7BFFu >> a1) & 1) == 0
    || (uint64_t v9 = *((void *)&off_18A0D9448 + (int)a1), !CFStringGetLength(theString))
    || !CFStringGetLength(a3))
  {
    AMSupportLogInternal();
    return 0LL;
  }

  if (a1 == 13)
  {
    CFIndex Length = CFStringGetLength(a4);
    CFTypeRef v12 = @";%@/Mothership";
    uint64_t v13 = @"%@/Mothership";
  }

  else
  {
    if (a1 != 7 || CFStringCompare(theString, @"*", 0LL) || CFStringCompare(a3, @"*", 0LL))
    {
      if (CFStringGetLength(a4)) {
        uint64_t v10 = @";%@/%@:%@";
      }
      else {
        uint64_t v10 = @"%@/%@:%@";
      }
      CFStringAppendFormat(a4, 0LL, v10, v9, theString, a3);
      return 1LL;
    }

    CFIndex Length = CFStringGetLength(a4);