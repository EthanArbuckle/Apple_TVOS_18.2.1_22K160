BOOL sub_100003E74(uint64_t a1, BOOL *a2)
{
  int v4;
  char v5;
  BOOL result;
  char *v7;
  char *v8;
  char *v9;
  char v10;
  v10 = -86;
  if (!a1)
  {
    v7 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v7, 13);
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_100015F10();
    return 0LL;
  }

  if (!a2)
  {
    v8 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v8, 14);
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_100015F98();
    return 0LL;
  }

  if (!Img4DecodePayloadPropertiesExists(a1, (BOOL *)&v10))
  {
    if (!v10)
    {
      *a2 = 0;
      return 1LL;
    }

    Img4DecodePayloadPropertyExistsByTag(a1, 0xE000000072646467LL, a2);
    if (v4 == 1)
    {
      v5 = 0;
      goto LABEL_10;
    }

    if (!v4)
    {
      v5 = 1;
LABEL_10:
      *a2 = v5;
      return 1LL;
    }

    fprintf(__stderrp, "Img4DecodePayloadPropertyExistsByTag('rddg') returned %d\n", v4);
    return 0LL;
  }

  v9 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v9, 17);
  result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_100016020();
    return 0LL;
  }

  return result;
}

BOOL sub_100004000(uint64_t a1, _DWORD *a2)
{
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  __src = (void *)0xAAAAAAAAAAAAAAAALL;
  if (!a1)
  {
    v7 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v7, 57);
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_1000160A8();
    return 0LL;
  }

  if (!a2)
  {
    v8 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v8, 58);
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_100016130();
    return 0LL;
  }

  Img4DecodeGetRestoreInfoData(a1, 1969448306LL, &__src, &v13);
  if (v4)
  {
    v9 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v9, 61);
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_100016350();
    return 0LL;
  }

  if (v13 != 588)
  {
    v10 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v10, 63);
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_1000162C8();
    return 0LL;
  }

  memcpy(a2, __src, 0x24CuLL);
  a2[147] = 0;
  Img4DecodeGetRestoreInfoData(a1, 1969450862LL, &__src, &v13);
  if (v5)
  {
    v11 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v11, 69);
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_100016240();
    return 0LL;
  }

  if (v13 == 1324)
  {
    memcpy(a2 + 148, __src, 0x52CuLL);
    return 1LL;
  }

  v12 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v12, 70);
  BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_1000161B8();
    return 0LL;
  }

  return result;
}

BOOL sub_10000426C(uint64_t a1, unint64_t a2, void *a3, _DWORD *a4)
{
  if (!a1)
  {
    v10 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v10, 85);
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_1000163D8();
    return 0LL;
  }

  if (!a3)
  {
    v11 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v11, 86);
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_100016460();
    return 0LL;
  }

  if (!a4)
  {
    v12 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v12, 87);
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_1000164E8();
    return 0LL;
  }

  if (a2 >= 0xFFFFFFE8)
  {
    unint64_t v13 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v13, 89);
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_100016570();
    return 0LL;
  }

  *a4 = 1;
  uint64_t v4 = a3[1];
  if (!v4)
  {
    v14 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v14, 93);
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_1000165F8();
    return 0LL;
  }

  int v5 = v4 - a1 + 24;
  uint64_t v7 = a3[2];
  uint64_t v6 = a3[3];
  a4[2] = v5;
  a4[3] = v7;
  if (v6)
  {
    uint64_t v8 = a3[4];
    a4[4] = v6 - a1 + 24;
    a4[5] = v8;
    a4[1] = a2 + 24;
    return 1LL;
  }

  v15 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v15, 98);
  BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_100016680();
    return 0LL;
  }

  return result;
}

  ;
}

void sub_1000044A8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

uint64_t sub_1000044D4(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[2] = v3;
  __int128 v13 = v3;
  v12[0] = v3;
  v12[1] = v3;
  if (!a1) {
    sub_100016708();
  }
  int v5 = sub_1000045B0((uint64_t *)v12, a1, a1 + a2);
  if (v5)
  {
    printf("img4: failed to parse ART: %d\n", v5);
    return 0LL;
  }

  else
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
    if ((SEPARTCounterFind(8LL, (uint64_t)&v11, *((uint64_t *)&v13 + 1), v14) & 1) != 0)
    {
      BOOL v7 = 1;
    }

    else
    {
      uint64_t v8 = 9LL;
      do
      {
        uint64_t v9 = v8;
        if (v8 == 28) {
          break;
        }
        unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
        int v10 = SEPARTCounterFind(v8, (uint64_t)&v11, *((uint64_t *)&v13 + 1), v14);
        uint64_t v8 = v9 + 1;
      }

      while (!v10);
      BOOL v7 = (unint64_t)(v9 - 1) < 0x1B;
    }

    return v7 ^ a3 ^ 1u;
  }
}

uint64_t sub_1000045B0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
  if (!SEPARTExtract(a2, a3, &v8, &v7))
  {
    int v5 = "img4: extract returned NULL";
    goto LABEL_5;
  }

  uint64_t v4 = SEPARTPayloadDecode((uint64_t)a1, a1 + 1, a1 + 2, a1 + 3, a1 + 4, a1 + 5, a1 + 6, a1 + 7, a1 + 8, v8, v7);
  if (v4 != v7)
  {
    int v5 = "img4: payload decode failed";
LABEL_5:
    puts(v5);
    return 1LL;
  }

  return 0LL;
}

uint64_t sub_100004664(unint64_t a1, unint64_t a2)
{
  if (a1 < a2)
  {
    unint64_t v4 = a2 - a1;
    int v5 = (unsigned __int8 *)a1;
    do
    {
      unsigned int v6 = *v5++;
      printf("%c%c", a0123456789abcd[(unint64_t)v6 >> 4], a0123456789abcd[v6 & 0xF]);
      --v4;
    }

    while (v4);
  }

  uint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v13 = v7;
  __int128 v14 = v7;
  __int128 v11 = v7;
  __int128 v12 = v7;
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  putchar(10);
  if (sub_1000045B0((uint64_t *)&v11, a1, a2))
  {
    puts("img4: failed to parse ART");
    return 1LL;
  }

  else
  {
    puts("Successfully parsed ART:");
    printf("counter: %lld\n", (void)v11);
    sub_1000047C8("manifest hash", *((uint64_t *)&v11 + 1), (unsigned __int8 *)v12);
    sub_1000047C8("sleep hash", *((uint64_t *)&v12 + 1), (unsigned __int8 *)v13);
    sub_1000047C8("restore nonce", *((uint64_t *)&v13 + 1), (unsigned __int8 *)v14);
    for (uint64_t i = 255LL; i != -1; --i)
    {
    }

    return 0LL;
  }

uint64_t sub_1000047C8(const char *a1, uint64_t a2, unsigned __int8 *a3)
{
  if (!a2) {
    return printf("%s absent\n", a1);
  }
  uint64_t v4 = a2;
  printf("%s (%ld bytes): ", a1, a2);
  do
  {
    unsigned int v5 = *a3++;
    printf("%c%c", a0123456789abcd[(unint64_t)v5 >> 4], a0123456789abcd[v5 & 0xF]);
    --v4;
  }

  while (v4);
  return putchar(10);
}

uint64_t sub_10000486C(uint64_t a1, uint64_t a2)
{
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  int v19 = -1431655766;
  int v15 = -1431655766;
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  v20[26] = v2;
  v20[27] = v2;
  v20[24] = v2;
  v20[25] = v2;
  v20[22] = v2;
  v20[23] = v2;
  v20[20] = v2;
  v20[21] = v2;
  v20[18] = v2;
  v20[19] = v2;
  v20[16] = v2;
  v20[17] = v2;
  v20[14] = v2;
  v20[15] = v2;
  v20[12] = v2;
  v20[13] = v2;
  v20[10] = v2;
  v20[11] = v2;
  v20[8] = v2;
  v20[9] = v2;
  v20[6] = v2;
  v20[7] = v2;
  v20[4] = v2;
  v20[5] = v2;
  v20[2] = v2;
  v20[3] = v2;
  v20[0] = v2;
  v20[1] = v2;
  v8[0] = sub_100004D8C;
  v8[1] = sub_100004D8C;
  v8[2] = sub_100004D8C;
  v8[3] = sub_100004D8C;
  memset(v7, 0, sizeof(v7));
  v8[5] = 0LL;
  v8[6] = 0LL;
  v8[4] = v7;
  __int128 v13 = 0LL;
  unsigned int v14 = 0;
  v16 = 0LL;
  uint64_t v17 = 0LL;
  int v18 = 0;
  uint64_t v9 = 0LL;
  __int128 v10 = 0xAAAAAAAA00000000LL;
  uint64_t v11 = 0LL;
  unint64_t v12 = 0xAAAAAAAA00000000LL;
  if (!sub_100004A4C((uint64_t)v20, a1, a2, (uint64_t)&v13, (uint64_t)&v9, 0LL, 0LL, (uint64_t)v8))
  {
    if (v18)
    {
      sub_1000047C8("sepi digest", v14, v13);
      sub_1000047C8("sepi nonce", v17, v16);
      if (!HIDWORD(v17)) {
        goto LABEL_8;
      }
      uint64_t v4 = "sepi allows mix 'n match";
    }

    else
    {
      uint64_t v4 = "sepi absent";
    }

    puts(v4);
LABEL_8:
    if ((_DWORD)v12)
    {
      sub_1000047C8("rsep digest", v10, v9);
      sub_1000047C8("rsep nonce", v11, *((unsigned __int8 **)&v10 + 1));
      if (!HIDWORD(v11)) {
        return 0LL;
      }
      unsigned int v5 = "rsep allows mix 'n match";
    }

    else
    {
      unsigned int v5 = "rsep absent";
    }

    puts(v5);
    return 0LL;
  }

  uint64_t v3 = 1LL;
  fwrite("img4: img4 parse failed\n", 0x18uLL, 1uLL, __stderrp);
  return v3;
}

uint64_t sub_100004A4C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, _DWORD *a7, uint64_t a8)
{
  if (v14)
  {
    printf("img4: Img4DecodeInit failed: %d\n", v14);
    return 1LL;
  }

  else
  {
    __int128 v18 = off_1000205E8;
    uint64_t v19 = 0LL;
    Img4DecodePerformTrustEvaluatationWithCallbacks(0x73657069u, a1, (uint64_t)&v18, a8, a4);
    *(_DWORD *)(a4 + 32) = v16 == 0;
    Img4DecodePerformTrustEvaluatationWithCallbacks(0x72736570u, a1, (uint64_t)&v18, a8, a5);
    *(_DWORD *)(a5 + 32) = v17 == 0;
    if (a8 && a1 && a6)
    {
      if (a7)
      {
        *a6 = a1 + 328;
        *a7 = **(void **)(a8 + 32);
      }
    }

    return 0LL;
  }

uint64_t sub_100004B50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  v35 = 0LL;
  int v34 = 0;
  if (!qword_100024920) {
    qword_100024920 = ccsha1_di();
  }
  *(void *)&__int128 v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  int v29 = -1431655766;
  int v33 = -1431655766;
  int v22 = -1431655766;
  int v26 = -1431655766;
  v36[0] = v10;
  v36[1] = v10;
  v36[2] = v10;
  v36[3] = v10;
  v36[4] = v10;
  v36[5] = v10;
  v36[6] = v10;
  v36[7] = v10;
  v36[8] = v10;
  v36[9] = v10;
  v36[10] = v10;
  v36[11] = v10;
  v36[12] = v10;
  v36[13] = v10;
  v36[14] = v10;
  v36[15] = v10;
  v36[16] = v10;
  v36[17] = v10;
  v36[18] = v10;
  v36[19] = v10;
  v36[20] = v10;
  v36[21] = v10;
  v36[22] = v10;
  v36[23] = v10;
  v36[24] = v10;
  v36[25] = v10;
  v36[26] = v10;
  v36[27] = v10;
  unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v27 = 0LL;
  int v28 = 0;
  uint64_t v30 = 0LL;
  uint64_t v31 = 0LL;
  int v32 = 0;
  uint64_t v20 = 0LL;
  int v21 = 0;
  __s2 = 0LL;
  uint64_t v24 = 0LL;
  int v25 = 0;
  *(_OWORD *)int v15 = 0u;
  *(_OWORD *)int v16 = 0u;
  *(_OWORD *)__n = 0u;
  *(_OWORD *)__s1 = 0u;
  uint64_t v19 = 0LL;
  if (sub_100004A4C( (uint64_t)v36,  a1,  a2,  (uint64_t)&v27,  (uint64_t)&v20,  &v35,  &v34,  (uint64_t)kImg4DecodeSecureBootRsa1kSha1))
  {
    LOBYTE(v11) = 0;
    unint64_t v12 = "preflight: FAIL: could not parse img4";
LABEL_5:
    puts(v12);
    return v11 & 1;
  }

  if (a3 && sub_1000045B0((uint64_t *)v15, a3, a4))
  {
    LOBYTE(v11) = 0;
    unint64_t v12 = "preflight: FAIL: could not parse ART";
    goto LABEL_5;
  }

  int v11 = (HIDWORD(v31) | HIDWORD(v24)) != 0;
  if (HIDWORD(v31) | HIDWORD(v24)) {
    puts("preflight: mix 'n match specified");
  }
  if (__n[1] && __n[1] == v24 && !memcmp(__s1[0], __s2, __n[1]))
  {
    if ((a5 & 2) != 0) {
      int v14 = "preflight: restore nonce matches";
    }
    else {
      int v14 = "preflight: nonce matches, but not checking restore";
    }
    v11 |= (a5 & 2) >> 1;
    puts(v14);
  }

  if (v15[1] && v15[1] == v34 && !memcmp(v16[0], v35, v15[1]))
  {
    if ((a5 & 1) != 0) {
      unint64_t v12 = "preflight: manifest hash matches sepi";
    }
    else {
      unint64_t v12 = "preflight: manifest hash matches, but not checking load";
    }
    LOBYTE(v11) = a5 | v11;
    goto LABEL_5;
  }

  return v11 & 1;
}

uint64_t sub_100004D8C()
{
  return 0LL;
}

uint64_t sub_100004D94(int a1, uint64_t *a2, int a3, uint64_t a4)
{
  unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
  int v6 = -1431655766;
  if (a1 == 1095585357)
  {
    char v8 = -86;
    if (Img4DecodeGetPropertyBoolean((uint64_t)a2, 1095585357LL, (BOOL *)&v8))
    {
      puts("img4: couldn't get BOOL property - fatal");
      exit(1);
    }

    if (v8) {
      *(_DWORD *)(a4 + 28) = 1;
    }
  }

  else if (a1 == 1936617326)
  {
    if (!a3 && !Img4DecodeGetPropertyData(a2, 1936617326LL, &v7, &v6))
    {
      *(void *)(a4 + 16) = v7;
      *(_DWORD *)(a4 + 24) = v6;
    }
  }

  else if (a1 == 1145525076 && a3 == 1 && !Img4DecodeGetPropertyData(a2, 1145525076LL, &v7, &v6))
  {
    *(void *)a4 = v7;
    *(_DWORD *)(a4 + 8) = v6;
  }

  return 0LL;
}

uint64_t sub_100004EAC()
{
  v0 = (const char *)qword_100024960;
  if (!qword_100024960)
  {
    v0 = "AppleSEPUtil";
    qword_100024960 = (uint64_t)"AppleSEPUtil";
  }

  fprintf(__stderrp, "Usage: %s ...\n", v0);
  fputc(10, __stderrp);
  fwrite("OPTIONS:\n\n", 0xAuLL, 1uLL, __stderrp);
  fwrite("\tGeneric commands\n", 0x12uLL, 1uLL, __stderrp);
  fwrite("\t\t--ping                   Send a PING operation to the SEP OS\n", 0x3FuLL, 1uLL, __stderrp);
  fwrite("\t\t--rawlog                 Dump the mailbox message RAW log without decoding\n", 0x4DuLL, 1uLL, __stderrp);
  fwrite( "\t\t--securitymode           Request SEP effective production status and security mode\n",  0x55uLL,  1uLL,  __stderrp);
  fwrite("\t\t--nap                    Nap the SEP NOW!\n", 0x2CuLL, 1uLL, __stderrp);
  fwrite("\t\t--sleep                  Sleep the SEP NOW!\n", 0x2EuLL, 1uLL, __stderrp);
  fwrite("\t\t--pingflood              Ping SEP endlessly\n", 0x2EuLL, 1uLL, __stderrp);
  fwrite("\t\t--rng-dump <count>       Dump specified count bytes worth of data from TRNG\n", 0x4EuLL, 1uLL, __stderrp);
  fwrite( "\t\t--launch-macos-app <ver> Launch MacOS serving app variant for the specified 16-bit hex version\n",  0x61uLL,  1uLL,  __stderrp);
  fwrite("\t\t--outfile <path>         Output file path. - for stdout\n", 0x3CuLL, 1uLL, __stderrp);
  fwrite("\t\t--infile <path>          Input file path if passing in some data\n", 0x43uLL, 1uLL, __stderrp);
  fwrite("\t\t--l4panic                Force an L4 panic\n", 0x2DuLL, 1uLL, __stderrp);
  fwrite("\t\t--sepospanic             Force a SEP/OS panic\n", 0x30uLL, 1uLL, __stderrp);
  fwrite("\t\t--requestpanic           Force a SEP/OS client requested panic\n", 0x41uLL, 1uLL, __stderrp);
  fwrite( "\t\t--read-file              Test seputil file reading functionality, Requires infile and outfile\n",  0x60uLL,  1uLL,  __stderrp);
  fwrite("\t\t--report-code-coverage   Output a structured data file with coverage data\n", 0x4CuLL, 1uLL, __stderrp);
  fwrite("\t\t--help                   Display this usage\n", 0x2EuLL, 1uLL, __stderrp);
  fwrite("\t\t--process-info           Display information for SEP processes\n", 0x41uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tFirmware commands\n", 0x13uLL, 1uLL, __stderrp);
  fwrite("\t\t--load <file>            Load <file> as the SEP runtime firmware\n", 0x43uLL, 1uLL, __stderrp);
  fwrite( "\t\t--restore <file>         Load <file> as the SEP runtime firmware in restore mode\n",  0x53uLL,  1uLL,  __stderrp);
  fwrite( "\t\t--restore+art <file>     Load <file> as the SEP runtime firmware in restore mode with ART\n",  0x5CuLL,  1uLL,  __stderrp);
  fwrite( "\t\t--slot <slot id>         Set nonce slot to be used to boot the SEP FW that is being loaded \n",  0x5EuLL,  1uLL,  __stderrp);
  fwrite("\t\t--wait <file>            Pause for kernel driver to load before failing\n", 0x4AuLL, 1uLL, __stderrp);
  fwrite( "\t\t--preflight              Pre-flight load/restore firmware against ART to pre-check for boot failures\n",  0x67uLL,  1uLL,  __stderrp);
  fwrite( "\t\t--boot-check <file>      Check whether the installed SEPFW might be bootable WRT the current ART\n",  0x63uLL,  1uLL,  __stderrp);
  fwrite("\t\t--dump-fw <file>         Dump measurements of installed SEP FW file \n", 0x47uLL, 1uLL, __stderrp);
  fwrite( "\t\t--commit-hash       Commit the SEP hash of the currently loaded firmware. Requires slot to be passed with --slot where nonce slots supported.\n",  0x90uLL,  1uLL,  __stderrp);
  fwrite( "\t\t--commit-hash-ap    Commit the AP hash of the currently loaded firmware. Requires slot to be passed with --slot where nonce slots supported.\n",  0x8FuLL,  1uLL,  __stderrp);
  fprintf(__stderrp, "\tExample: %s --wait --load /path/to/foo\n", (const char *)qword_100024960);
  fputc(10, __stderrp);
  fwrite("\tROM commands\n", 0xEuLL, 1uLL, __stderrp);
  fwrite("\t\t--rom status             Get the ROM status\n", 0x2EuLL, 1uLL, __stderrp);
  fwrite("\t\t--rom tz0                Send a ROM TZ0 command\n", 0x32uLL, 1uLL, __stderrp);
  fwrite("\t\t--rom nop                Send a ROM NOP command\n", 0x32uLL, 1uLL, __stderrp);
  fwrite("\t\t--new-rom-nonce          Request new ROM nonce. Requires --outfile\n", 0x45uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tART commands\n", 0xEuLL, 1uLL, __stderrp);
  fwrite("\t\t--art get                Dump current ART from Memory\n", 0x38uLL, 1uLL, __stderrp);
  fwrite("\t\t--art clear              Clear the persisted ART\n", 0x33uLL, 1uLL, __stderrp);
  fwrite("\t\t--art ctrtest            Counter self-test\n", 0x2DuLL, 1uLL, __stderrp);
  fwrite( "\t\t--minblocks <value>      Optional argument to compare --art ctrtest good pages against\n",  0x5BuLL,  1uLL,  __stderrp);
  fwrite("\t\t--art-set <value>        Persist the supplied ART value to storage\n", 0x45uLL, 1uLL, __stderrp);
  fwrite("\t\t--get-nonce              Get current SEP/OS nonce\n", 0x34uLL, 1uLL, __stderrp);
  fwrite("\t\t--new-nonce              Request new SEP/OS nonce\n", 0x34uLL, 1uLL, __stderrp);
  fwrite("\t\t--kill-nonce             Request invalidate SEP/OS nonce\n", 0x3BuLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tOOL Object commands\n", 0x15uLL, 1uLL, __stderrp);
  fwrite("\t\t--size <size>            Size of object in case requesting object create\n", 0x4BuLL, 1uLL, __stderrp);
  fwrite("\t\t--create <obj>           Create an object in SEP. Requires --size\n", 0x44uLL, 1uLL, __stderrp);
  fwrite("\t\t--service <srvc>         Service handle with which an object is to be shared\n", 0x4FuLL, 1uLL, __stderrp);
  fwrite("\t\t--share <obj>            Share an object. Requires --service\n", 0x3FuLL, 1uLL, __stderrp);
  fwrite("\t\t--get <obj>              Read obj and write to stdout\n", 0x38uLL, 1uLL, __stderrp);
  fwrite("\t\t--put <obj>              Read stdin and write to obj\n", 0x37uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tPairing commands\n", 0x12uLL, 1uLL, __stderrp);
  fwrite("\t\t--pair <obj>             Factory pairing commands. Requires: --outfile\n", 0x49uLL, 1uLL, __stderrp);
  fwrite("\t\t                         Valid arguments for <obj>- STCK, SIGN\n", 0x41uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tUnit test commands\n", 0x14uLL, 1uLL, __stderrp);
  fwrite("\t\t--test-run <category>[/<test>]\n", 0x21uLL, 1uLL, __stderrp);
  fwrite("\t\t                         Run a test or set of tests in a category\n", 0x44uLL, 1uLL, __stderrp);
  fwrite("\t\t--test-all               Run all available tests\n", 0x33uLL, 1uLL, __stderrp);
  fwrite("\t\t--test-list              List all available tests\n", 0x34uLL, 1uLL, __stderrp);
  fwrite("\t\t--test-input <file>      Set testing input data\n", 0x32uLL, 1uLL, __stderrp);
  fwrite("\t\t--test-output <file>     Set testing output data\n", 0x33uLL, 1uLL, __stderrp);
  fwrite( "\t\t--test-offset <value>    Set data transfer offset within input data (default=0)\n",  0x52uLL,  1uLL,  __stderrp);
  fwrite( "\t\t--test-timeout <value>   Set the default delay in milliseconds to wait for test completion (default=120000)\n",  0x6EuLL,  1uLL,  __stderrp);
  fputc(10, __stderrp);
  fwrite("\t\tExamples:\n", 0xCuLL, 1uLL, __stderrp);
  fprintf( __stderrp,  "\t\t%s --test-run test/pass (run the test 'pass' in the category 'test')\n",  (const char *)qword_100024960);
  fprintf(__stderrp, "\t\t%s --test-run test (run all tests in the category 'test')\n", (const char *)qword_100024960);
  fputc(10, __stderrp);
  fwrite("\tSystem testing commands\n", 0x19uLL, 1uLL, __stderrp);
  fwrite("\t\t--tunable-check <value>  Enable or disable tunable check mode.\n", 0x41uLL, 1uLL, __stderrp);
  fwrite("\t\t                         'value' should be 'enable' or 'disable'.\n", 0x44uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tDebugging and Diagnostic commands\n", 0x23uLL, 1uLL, __stderrp);
  fwrite("\t\t--list-var <app>                  List all debug variables in app\n", 0x44uLL, 1uLL, __stderrp);
  fwrite("\t\t--get-var <app>:<name>            Get value of debug variable\n", 0x40uLL, 1uLL, __stderrp);
  fwrite( "\t\t--set-var <app>:<name>:<value>    Set value of debug variable. If the value is out of range of the debug variabl e (signed or unsigned), throws an error\n",  0x9AuLL,  1uLL,  __stderrp);
  fputc(10, __stderrp);
  fwrite("\tCoverage commands\n", 0x13uLL, 1uLL, __stderrp);
  fwrite("\t\t--dump-cov <app>      Dump and reset coverage counters to object\n", 0x43uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tSMC test command\n", 0x12uLL, 1uLL, __stderrp);
  fwrite("\t\t--send-smc-events <count> Send <count> test SMC events to SEP\n", 0x40uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tDynamic Scheme3 test command\n", 0x1EuLL, 1uLL, __stderrp);
  fwrite("\t\t--alloc-dynamic-object \t Request allocation of test Dynamic Scheme3 object\n", 0x4DuLL, 1uLL, __stderrp);
  fwrite( "\t\t--dealloc-dynamic-object \t Request deallocation of test Dynamic Scheme3 object\n",  0x51uLL,  1uLL,  __stderrp);
  fputc(10, __stderrp);
  fwrite("\tProvisional AP slot commands (only supported where nonce slots supported)\n", 0x4BuLL, 1uLL, __stderrp);
  fwrite( "\t\t--set-provisional <value> \tSet the provisional state of AP slot to 1 (provisional) or 0 (not provisional). Requ ires slot to be passed with --slot.\n",  0x95uLL,  1uLL,  __stderrp);
  fwrite("\t\t--get-provisional \tRequires slot to be passed with --slot\n", 0x3CuLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tBare words on the commandline are sent to the SEP as a console command\n", 0x48uLL, 1uLL, __stderrp);
  return fprintf(__stderrp, "\tExample: %s help\n\n", (const char *)qword_100024960);
}

uint64_t start(int a1, char **a2)
{
  __int128 v196 = 0u;
  __int128 v197 = 0u;
  *(_OWORD *)v194 = 0u;
  __int128 v195 = 0u;
  *(_OWORD *)v192 = 0u;
  __int128 v193 = 0u;
  *(void *)__dst = 0LL;
  uint64_t v189 = 0LL;
  *(void *)inputStruct = 0LL;
  int v191 = 0;
  uint64_t v190 = 0LL;
  memset(uu, 0, sizeof(uu));
  setlinebuf(__stdoutp);
  setlinebuf(__stderrp);
  uint64_t v4 = &off_100024000;
  qword_100024960 = (uint64_t)basename(*a2);
  if (!qword_100024960)
  {
    int v6 = __stderrp;
    unint64_t v7 = __error();
    strerror(*v7);
    fprintf(v6, "ERROR: failed to determine utility name: %s\n");
    return *__error();
  }

  if (geteuid())
  {
    fprintf(__stderrp, "%s: must be run as root\n", (const char *)qword_100024960);
    return 13LL;
  }

  io_registry_entry_t v9 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/arm-io/sep");
  if (!v9)
  {
    printf("%s: No SEP present on this device\n", (const char *)qword_100024960);
    return 0LL;
  }

  IOObjectRelease(v9);
  if (!strncmp((const char *)qword_100024960, "init_data_protection", 0x20uLL))
  {
    bzero(v206, 0x400uLL);
    bzero(v205, 0x400uLL);
    unsigned int v185 = 0;
    byte_10002496D = 1;
    io_registry_entry_t v10 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/arm-io/sep");
    if (!v10)
    {
      fprintf(__stderrp, "%s: can't find arm-io/sep\n", (const char *)qword_100024960);
      return 2LL;
    }

    io_object_t v11 = v10;
    unsigned int v186 = -1431655766;
    unint64_t v12 = (const __CFData *)IORegistryEntrySearchCFProperty( v10,  "IODeviceTree",  @"sepfw-loaded",  kCFAllocatorDefault,  0);
    __int128 v13 = v12;
    if (v12)
    {
      CFTypeID v14 = CFGetTypeID(v12);
      if (v14 == CFDataGetTypeID())
      {
        if (CFDataGetLength(v13) == 4)
        {
          BytePtr = CFDataGetBytePtr(v13);
          BOOL v16 = *(_DWORD *)BytePtr != 0;
          int v17 = "was not ";
          if (*(_DWORD *)BytePtr) {
            int v17 = (const char *)&unk_10001A129;
          }
          printf("SEP firmware %spreloaded in memory\n", v17);
LABEL_194:
          if (sub_10000C46C("sepfw-load-at-boot"))
          {
            unint64_t v204 = 0xAAAAAAAAAAAAAAAALL;
            *(void *)&__int128 v64 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v64 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v203[27] = v64;
            v203[26] = v64;
            v203[25] = v64;
            v203[24] = v64;
            v203[23] = v64;
            v203[22] = v64;
            v203[21] = v64;
            v203[20] = v64;
            v203[19] = v64;
            v203[18] = v64;
            v203[17] = v64;
            v203[16] = v64;
            v203[15] = v64;
            v203[14] = v64;
            v203[13] = v64;
            v203[12] = v64;
            v203[11] = v64;
            v203[10] = v64;
            v203[9] = v64;
            v203[8] = v64;
            v203[7] = v64;
            v203[6] = v64;
            v203[5] = v64;
            v203[4] = v64;
            v203[3] = v64;
            v203[2] = v64;
            v203[1] = v64;
            v203[0] = v64;
            char v184 = -86;
            uint64_t v65 = sub_100008038();
            if ((_DWORD)v65)
            {
              uint64_t v5 = v65;
              fprintf(__stderrp, "%s: Failed to connect to sep\n", (const char *)qword_100024960);
LABEL_200:
              v66 = 0LL;
LABEL_201:
              v67 = 0LL;
              goto LABEL_202;
            }

            if (sub_10000C46C("protected-data-access"))
            {
              uint64_t v68 = sub_100008C10(0);
              if ((_DWORD)v68)
              {
                uint64_t v5 = v68;
                fprintf(__stderrp, "%s: Failed to initialize gigalocker: %d\n", (const char *)qword_100024960, v68);
                v66 = 0LL;
                v67 = 0LL;
                goto LABEL_202;
              }
            }

            if (!v16)
            {
              uint64_t v69 = sub_100007F40((uint64_t)v206, 5LL);
              if ((_DWORD)v69)
              {
                uint64_t v5 = v69;
                v88 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                printf( "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n",  0LL,  (const char *)&unk_10001A129,  v88,  4006);
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  sub_100016B60();
                }
                goto LABEL_200;
              }

              v70 = malloc(0x2000000uLL);
              if (v70)
              {
                v66 = v70;
                uint64_t v71 = sub_10000BAE4(v70, 0x2000000uLL, (char *)v206, &v186);
                if ((_DWORD)v71)
                {
                  uint64_t v5 = v71;
                  v90 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                  printf( "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n",  0LL,  (const char *)&unk_10001A129,  v90,  4013);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    sub_100016AD8();
                  }
                  goto LABEL_201;
                }

                Img4DecodeInit((uint64_t)v66, v186, (uint64_t)v203);
                if (v72)
                {
                  v91 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                  printf( "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n",  0LL,  (const char *)&unk_10001A129,  v91,  4016);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    sub_100016A50();
                  }
                }

                else if (sub_100003E74((uint64_t)v203, (BOOL *)&v184))
                {
                  if (!v184)
                  {
                    v67 = 0LL;
                    unsigned int v79 = 255;
                    goto LABEL_261;
                  }

                  v73 = malloc(0x40000uLL);
                  if (v73)
                  {
                    v67 = v73;
                    uint64_t v74 = sub_100007F40((uint64_t)v205, 8LL);
                    if ((_DWORD)v74)
                    {
                      uint64_t v5 = v74;
                      v94 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                      printf( "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n",  0LL,  (const char *)&unk_10001A129,  v94,  4027);
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                        sub_100016940();
                      }
                      goto LABEL_202;
                    }

                    uint64_t v75 = sub_10000BAE4(v67, 0x40000uLL, v205, &v185);
                    if ((_DWORD)v75)
                    {
                      uint64_t v5 = v75;
                      v95 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                      printf( "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n",  0LL,  (const char *)&unk_10001A129,  v95,  4031);
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                        sub_1000168B8();
                      }
                      goto LABEL_202;
                    }

                    unint64_t v202 = 0xAAAAAAAAAAAAAAAALL;
                    *(void *)&__int128 v76 = 0xAAAAAAAAAAAAAAAALL;
                    *((void *)&v76 + 1) = 0xAAAAAAAAAAAAAAAALL;
                    v201[27] = v76;
                    v201[26] = v76;
                    v201[25] = v76;
                    v201[24] = v76;
                    v201[23] = v76;
                    v201[22] = v76;
                    v201[21] = v76;
                    v201[20] = v76;
                    v201[19] = v76;
                    v201[18] = v76;
                    v201[17] = v76;
                    v201[16] = v76;
                    v201[15] = v76;
                    v201[14] = v76;
                    v201[13] = v76;
                    v201[12] = v76;
                    v201[11] = v76;
                    v201[10] = v76;
                    v201[9] = v76;
                    v201[8] = v76;
                    v201[7] = v76;
                    v201[6] = v76;
                    v201[5] = v76;
                    v201[4] = v76;
                    v201[3] = v76;
                    v201[2] = v76;
                    v201[1] = v76;
                    v201[0] = v76;
                    Img4DecodeInit((uint64_t)v67, v185, (uint64_t)v201);
                    if (v77)
                    {
                      v96 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                      printf( "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n",  0LL,  (const char *)&unk_10001A129,  v96,  4036);
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                        sub_100016830();
                      }
                      goto LABEL_262;
                    }

                    int v183 = -1431655766;
                    Img4DecodeGetRestoreInfoInteger((uint64_t)v201, 1936615780LL, &v183);
                    if (v78)
                    {
                      unsigned int v79 = 2;
                      printf("Didn't find snid in patches IM4R, using default slot %u\n", 2);
                    }

                    else
                    {
                      unsigned int v79 = v183;
                      printf("Found slot %u in patches IM4R\n", v183);
                    }

LABEL_261:
                    printf("Loading SEP FW in %s with slot %u\n", "defaultInit", v79);
                    if (sub_10000BCB8((uint64_t)v66, v186, v67, v185, 6u, v79))
                    {
LABEL_262:
                      uint64_t v5 = 0LL;
                      goto LABEL_202;
                    }

                    fprintf(__stderrp, "%s: auto load failed\n", (const char *)qword_100024960);
                    uint64_t v5 = 5LL;
LABEL_202:
                    if (!v13) {
                      goto LABEL_212;
                    }
                    goto LABEL_211;
                  }

                  v93 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                  printf( "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n",  0LL,  (const char *)&unk_10001A129,  v93,  4023);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    sub_1000167A8();
                  }
                }

                else
                {
                  v92 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                  printf( "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n",  0LL,  (const char *)&unk_10001A129,  v92,  4017);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    sub_1000169C8();
                  }
                }

                v67 = 0LL;
                uint64_t v5 = 1LL;
                goto LABEL_202;
              }

              v89 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
              printf( "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n",  0LL,  (const char *)&unk_10001A129,  v89,  4009);
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_100016720();
              }
            }
          }

          else
          {
            puts("Skipping SEP firmware load");
          }

          uint64_t v5 = 0LL;
          goto LABEL_200;
        }

        fprintf(__stderrp, "%s: Incorrect value size for sepfw-loaded property\n");
      }

      else
      {
        fprintf(__stderrp, "%s: Incorrect sepfw-loaded entry value type\n");
      }

      v67 = 0LL;
      v66 = 0LL;
      uint64_t v5 = 33LL;
LABEL_211:
      CFRelease(v13);
LABEL_212:
      IOObjectRelease(v11);
      if (v66) {
        free(v66);
      }
      if (v67) {
        free(v67);
      }
      return v5;
    }

    BOOL v16 = 0;
    goto LABEL_194;
  }

  if (a1 < 2)
  {
    fprintf(__stderrp, "%s: ERROR: At least one option required\n");
    goto LABEL_11;
  }

  int v18 = getopt_long(a1, a2, "a:b:c:d:f:g:hkmno:pq:r:s:t:uv:wx:CDFI:L:NO:PR:ST:W:", (const option *)&off_100024000, 0LL);
  if (v18 != -1)
  {
    LODWORD(v180) = 0;
    int v178 = 0;
    int v126 = 0;
    char v160 = 0;
    uint64_t v158 = 0LL;
    uint64_t v159 = 0LL;
    int v19 = 0;
    BOOL v20 = 0LL;
    int v124 = 0;
    int v165 = 0;
    uint64_t v166 = 0LL;
    unsigned int v143 = 0;
    unsigned __int16 v144 = 0;
    char v133 = 0;
    char v157 = 0;
    uint64_t v154 = 0LL;
    uint64_t v155 = 0LL;
    v156 = 0LL;
    v147 = 0LL;
    char v148 = 0;
    char v152 = 0;
    v150 = 0LL;
    char v149 = 0;
    char v146 = 0;
    unsigned int v132 = 0;
    char v130 = 0;
    char v131 = 0;
    unsigned int v128 = 0;
    uint64_t v129 = 0LL;
    char v127 = 0;
    unint64_t v21 = 0LL;
    uint64_t v136 = 0LL;
    v137 = 0LL;
    v138 = 0LL;
    unint64_t v139 = 0LL;
    unsigned int v123 = 0;
    uint64_t v134 = 0LL;
    uint64_t v135 = 0LL;
    int v179 = 0;
    uint64_t v141 = 0LL;
    uint64_t v142 = 0LL;
    uint64_t v175 = 0LL;
    *(void *)v176 = 0LL;
    unint64_t v125 = 0LL;
    int v161 = 0;
    unint64_t v162 = 0LL;
    uint64_t v163 = 0LL;
    int v140 = 0;
    uint64_t v177 = 0LL;
    int v171 = 0;
    unint64_t v167 = 0LL;
    int v168 = 0;
    int v173 = 0;
    uint64_t v174 = 0LL;
    int v172 = 255;
    int v22 = &optarg;
    memset(v164, 170, sizeof(v164));
    v153 = (char *)0xAAAAAAAAAAAAAAAALL;
    v151 = (char *)0xAAAAAAAAAAAAAAAALL;
    v145 = (char *)0xAAAAAAAAAAAAAAAALL;
    int v170 = 255;
    int v169 = 255;
    while (1)
    {
      if (v18 <= 256)
      {
        switch(v18)
        {
          case 'C':
            uint64_t v25 = sub_100007F40((uint64_t)v200, 5LL);
            if ((_DWORD)v25) {
              return v25;
            }
            HIDWORD(v141) = 1;
            goto LABEL_179;
          case 'D':
            uint64_t v25 = sub_100007F40((uint64_t)v200, 5LL);
            if ((_DWORD)v25) {
              return v25;
            }
            LODWORD(v141) = 1;
            goto LABEL_179;
          case 'E':
          case 'G':
          case 'H':
          case 'J':
          case 'K':
          case 'M':
          case 'Q':
          case 'U':
          case 'V':
          case 'X':
          case 'Y':
          case 'Z':
          case '[':
          case '\\':
          case ']':
          case '^':
          case '_':
          case 'e':
          case 'i':
          case 'l':
            goto LABEL_264;
          case 'F':
            int v173 = 1;
            break;
          case 'I':
            v46 = (const char **)v22;
            unint64_t v47 = v21;
            v48 = *v46;
            if (!strcmp(*v46, "-"))
            {
              int v170 = fileno(__stdinp);
              unint64_t v21 = v47;
              int v22 = &optarg;
            }

            else
            {
              int v49 = open(v48, 0);
              unint64_t v21 = v47;
              int v170 = v49;
              int v22 = &optarg;
              if ((v49 & 0x80) != 0) {
                goto LABEL_259;
              }
            }

            break;
          case 'L':
            v206[0] = (char *)0xAAAAAAAAAAAAAAAALL;
            if (!sub_100007FD4(*v22, 16, (unint64_t *)v206))
            {
              fprintf(__stderrp, "%s: Missing or invalid version\n");
              goto LABEL_11;
            }

            unsigned __int16 v144 = (unsigned __int16)v206[0];
            if (v206[0] >= (char *)0x10000)
            {
              fprintf(__stderrp, "%s: version argument 0x%lx is not a valid uint16 value\n");
              return 22LL;
            }

            char v130 = 1;
            break;
          case 'N':
            HIDWORD(v174) = 1;
            break;
          case 'O':
            int v54 = fileno(__stdinp);
            if (isatty(v54))
            {
              fprintf(__stderrp, "%s: not reading object data from a terminal, re-direct data from another file\n");
              return 22LL;
            }

            if (!*v22)
            {
LABEL_241:
              fprintf(__stderrp, "%s: Missing name \n");
              goto LABEL_11;
            }

            strncpy(v194, *v22, 0x20uLL);
            LODWORD(v129) = 1;
            break;
          case 'P':
            break;
          case 'R':
            if (!*v22) {
              goto LABEL_252;
            }
            strncpy(v192, *v22, 0x20uLL);
            LODWORD(v134) = 1;
            break;
          case 'S':
            LODWORD(v174) = 1;
            break;
          case 'T':
            if (!*v22) {
              goto LABEL_241;
            }
            strncpy(v194, *v22, 0x20uLL);
            HIDWORD(v134) = 1;
            break;
          case 'W':
            v50 = *v22;
            if (!strcmp(v50, "-"))
            {
              int v169 = 1;
LABEL_179:
              int v22 = &optarg;
              break;
            }

            int v169 = creat(v50, 0x1A5u);
            int v22 = &optarg;
            if ((v169 & 0x80) != 0)
            {
LABEL_259:
              fprintf(__stderrp, "%s: can't open '%s'\n");
              return *__error();
            }

            break;
          case 'a':
            v51 = *v22;
            if (!*v22) {
              goto LABEL_252;
            }
            v52 = (char *)&v196;
            size_t v53 = 32LL;
            goto LABEL_123;
          case 'b':
            __int128 v196 = *(_OWORD *)"set";
            __int128 v197 = *(_OWORD *)&algn_10001959D[12];
            v51 = *v22;
            if (!*v22)
            {
              fprintf(__stderrp, "%s: Missing value \n");
LABEL_11:
              sub_100004EAC();
              return 22LL;
            }

            v52 = &byte_10002496E;
            size_t v53 = 2048LL;
LABEL_123:
            strncpy(v52, v51, v53);
            LODWORD(v175) = 1;
            break;
          case 'c':
            if (!*v22) {
              goto LABEL_241;
            }
            strncpy(v194, *v22, 0x20uLL);
            LODWORD(v135) = 1;
            break;
          case 'd':
            int v45 = fileno(__stdoutp);
            if (isatty(v45))
            {
              fprintf(__stderrp, "%s: not writing data to a terminal, re-direct data to another file\n");
              return 22LL;
            }

            if (!*v22)
            {
LABEL_256:
              fprintf(__stderrp, "%s: Missing count \n");
              goto LABEL_11;
            }

            unint64_t v167 = strtol(*v22, 0LL, 10);
            int v168 = 1;
            break;
          case 'f':
            if (!*v22) {
              goto LABEL_240;
            }
            strncpy(v200, *v22, 0x400uLL);
            HIDWORD(v177) = 1;
            int v43 = 6;
            goto LABEL_130;
          case 'g':
            if (!*v22) {
              goto LABEL_256;
            }
            unint64_t v139 = strtol(*v22, 0LL, 10);
            break;
          case 'h':
            sub_100004EAC();
            break;
          case 'j':
            int v171 = 1;
            break;
          case 'k':
            LODWORD(v163) = 1;
            break;
          case 'm':
            HIDWORD(v175) = 1;
            break;
          case 'n':
            HIDWORD(v163) = 1;
            break;
          case 'o':
            int v44 = fileno(__stdoutp);
            if (isatty(v44))
            {
              fprintf(__stderrp, "%s: not writing object data to a terminal, re-direct data to another file\n");
              return 22LL;
            }

            if (!*v22) {
              goto LABEL_241;
            }
            strncpy(v194, *v22, 0x20uLL);
            HIDWORD(v129) = 1;
            break;
          case 'p':
            LODWORD(v180) = 1;
            break;
          case 'q':
            if (!*v22) {
              goto LABEL_240;
            }
            strncpy(v199, *v22, 0x400uLL);
            break;
          case 'r':
            if (!*v22) {
              goto LABEL_240;
            }
            strncpy(v200, *v22, 0x400uLL);
            HIDWORD(v177) = 1;
            int v43 = 7;
            goto LABEL_130;
          case 's':
            if (!*v22)
            {
LABEL_252:
              fprintf(__stderrp, "%s: Missing sub-command\n");
              goto LABEL_11;
            }

            strncpy((char *)v198, *v22, 0x20uLL);
            int v140 = 1;
            break;
          case 't':
            if (!*v22)
            {
LABEL_240:
              fprintf(__stderrp, "%s: Missing file path\n");
              goto LABEL_11;
            }

            strncpy(v200, *v22, 0x400uLL);
            HIDWORD(v177) = 1;
            int v43 = 8;
LABEL_130:
            LODWORD(v177) = v43;
            break;
          case 'u':
            int v178 = 1;
            break;
          case 'v':
            unint64_t v162 = strtol(*v22, 0LL, 10);
            break;
          case 'w':
            byte_10002496D = 1;
            break;
          case 'x':
            int v161 = string_to_handle((unint64_t)*v22);
            break;
          default:
            if (v18) {
              goto LABEL_264;
            }
            break;
        }
      }

      else
      {
        if (v18 <= 1023)
        {
          switch(v18)
          {
            case 257:
              v23 = *v22;
              if (!v23)
              {
                fprintf(__stderrp, "%s: Missing test name\n");
                goto LABEL_11;
              }

              uint64_t v24 = strchr(v23, 47);
              if (v24)
              {
                *uint64_t v24 = 0;
                unsigned int v123 = string_to_handle((unint64_t)(v24 + 1));
              }

              HIDWORD(v135) = string_to_handle((unint64_t)v23);
              int v179 = 3;
              goto LABEL_179;
            case 258:
              int v34 = 1;
              goto LABEL_60;
            case 259:
              int v34 = 4;
              goto LABEL_60;
            case 260:
              if (!*v22)
              {
                fprintf(__stderrp, "%s: Missing test input file\n");
                goto LABEL_11;
              }

              v137 = fopen(*v22, "r");
              if (v137) {
                goto LABEL_180;
              }
              fprintf(__stderrp, "%s: Couldn't open testing input\n");
              return *__error();
            case 261:
              if (!*v22)
              {
                fprintf(__stderrp, "%s: Missing test output file\n");
                goto LABEL_11;
              }

              v138 = fopen(*v22, "w");
              if (v138) {
                goto LABEL_180;
              }
              fprintf(__stderrp, "%s: Couldn't open testing output\n");
              return *__error();
            case 262:
              v206[0] = (char *)0xAAAAAAAAAAAAAAAALL;
              if (!sub_100007FD4(*v22, 10, (unint64_t *)v206))
              {
                fprintf(__stderrp, "%s: Missing or invalid test offset value\n");
                goto LABEL_11;
              }

              LODWORD(v136) = v206[0];
              goto LABEL_180;
            case 263:
            case 265:
            case 266:
            case 268:
            case 269:
              goto LABEL_264;
            case 264:
              v206[0] = (char *)0xAAAAAAAAAAAAAAAALL;
              if (!sub_100007FD4(*v22, 10, (unint64_t *)v206))
              {
                fprintf(__stderrp, "%s: Missing or invalid test timeout value\n");
                goto LABEL_11;
              }

              HIDWORD(v136) = v206[0];
              int v34 = 5;
LABEL_60:
              int v179 = v34;
              goto LABEL_180;
            case 267:
              if (!*v22)
              {
                fprintf(__stderrp, "%s: Missing output file\n");
                goto LABEL_11;
              }

              sub_10000E590(*v22);
              goto LABEL_180;
            case 270:
              if (!*v22)
              {
                fprintf(__stderrp, "%s: Missing dump coverage name \n");
                goto LABEL_11;
              }

              strncpy(&__dst[4], *v22, 4uLL);
              byte_100025178 = 1;
              goto LABEL_180;
            case 271:
              if (!*v22)
              {
                fprintf(__stderrp, "%s: Missing SMC event count \n");
                goto LABEL_11;
              }

              strtoull(*v22, 0LL, 10);
              goto LABEL_180;
            case 272:
              if (!*v22) {
                goto LABEL_251;
              }
              strncpy(__dst, *v22, 4uLL);
              *(void *)v176 = 6LL;
              goto LABEL_180;
            case 273:
              int v26 = *v22;
              if (!*v22) {
                goto LABEL_251;
              }
              BOOL v27 = v20;
              int v28 = v22;
              unint64_t v29 = v21;
              BOOL v30 = v27;
              uint64_t v31 = strtok(v26, ":");
              strncpy(__dst, v31, 4uLL);
              int v32 = strtok(0LL, ":");
              if (!v32)
              {
                v83 = __stderrp;
                goto LABEL_283;
              }

              strncpy(inputStruct, v32, 0x1CuLL);
              *(void *)v176 = 7LL;
              BOOL v33 = v30;
              unint64_t v21 = v29;
              goto LABEL_82;
            case 274:
              v36 = *v22;
              if (!*v22)
              {
LABEL_251:
                fprintf(__stderrp, "%s: Missing arguments \n");
                goto LABEL_11;
              }

              BOOL v37 = v20;
              int v28 = v22;
              unint64_t v38 = v21;
              BOOL v39 = v37;
              v40 = strtok(v36, ":");
              strncpy(__dst, v40, 4uLL);
              v41 = strtok(0LL, ":");
              if (!v41)
              {
                v83 = __stderrp;
LABEL_283:
                fprintf(v83, "%s: Missing debug var name \n");
                goto LABEL_11;
              }

              strncpy(inputStruct, v41, 0x1CuLL);
              v42 = strtok(0LL, ":");
              if (!v42)
              {
                fprintf(__stderrp, "%s: Missing debug var new value \n");
                goto LABEL_11;
              }

              unint64_t v125 = strtoull(v42, 0LL, 0);
              *(void *)v176 = 8LL;
              BOOL v33 = v39;
              unint64_t v21 = v38;
              uint64_t v4 = &off_100024000;
LABEL_82:
              int v22 = v28;
              BOOL v20 = v33;
              goto LABEL_180;
            case 275:
              if (!*v22) {
                goto LABEL_253;
              }
              unint64_t v21 = string_to_handle((unint64_t)*v22);
              byte_100024968 = 1;
              goto LABEL_180;
            case 276:
              if (!*v22)
              {
LABEL_253:
                fprintf(__stderrp, "%s: Missing object handle \n");
                goto LABEL_11;
              }

              unint64_t v21 = string_to_handle((unint64_t)*v22);
              byte_10002496C = 1;
              goto LABEL_180;
            case 277:
              v35 = *v22;
              if (!strcmp(v35, "enable"))
              {
                uint64_t v142 = 0x100000001LL;
              }

              else
              {
                if (strcmp(v35, "disable"))
                {
                  fprintf(__stderrp, "%s: Tunable mode must be 'enable' or 'disable'.\n");
                  return 22LL;
                }

                uint64_t v142 = 0x100000000LL;
              }

              break;
            default:
              switch(v18)
              {
                case 768:
                  if (!*v22)
                  {
                    fprintf(__stderrp, "%s: missing UUID \n");
                    return 22LL;
                  }

                  if (uuid_parse(*v22, uu))
                  {
                    fprintf(__stderrp, "%s: invalid UUID\n");
                    return 22LL;
                  }

                  int v126 = 1;
                  goto LABEL_180;
                case 770:
                  v164[2] = *v22;
                  HIDWORD(v166) = 1;
                  goto LABEL_180;
                case 771:
                  v164[1] = *v22;
                  LODWORD(v166) = 1;
                  goto LABEL_180;
                case 772:
                  byte_100025170 = 1;
                  goto LABEL_180;
                case 773:
                  byte_100025174 = 1;
                  goto LABEL_180;
                case 774:
                  v56 = *v22;
                  if (!*v22)
                  {
                    fprintf(__stderrp, "%s: Missing slot ID\n");
                    goto LABEL_11;
                  }

                  if (*v56)
                  {
                    v206[0] = (char *)0xAAAAAAAAAAAAAAAALL;
                    int v57 = strtoul(v56, v206, 10);
                    int v58 = v172;
                    if (!*v206[0]) {
                      int v58 = v57;
                    }
                    int v172 = v58;
                  }

                  break;
                case 775:
                  v164[0] = *v22;
                  int v165 = 1;
                  goto LABEL_180;
                case 776:
                  v59 = *v22;
                  if (!*v22)
                  {
                    fprintf(__stderrp, "%s: Missing set provisional state \n");
                    goto LABEL_11;
                  }

                  v206[0] = (char *)0xAAAAAAAAAAAAAAAALL;
                  unsigned int v60 = strtoull(v59, v206, 10);
                  v61 = (const char **)v22;
                  unsigned int v62 = v60;
                  if (v206[0] != &(*v61)[strlen(*v61)])
                  {
                    v84 = "%s: Unable to parse provisional AP slot state\n";
LABEL_289:
                    fprintf(__stderrp, v84, v4[300]);
                    goto LABEL_11;
                  }

                  if (v62 >= 2)
                  {
                    v84 = "%s: Invalid value for provisional AP slot state\n";
                    goto LABEL_289;
                  }

                  BOOL v20 = v62 == 1;
                  fprintf(__stderrp, "set_provisional_ap_value %d\n", v62 == 1);
                  int v124 = 1;
                  int v22 = &optarg;
                  goto LABEL_180;
                case 777:
                  int v19 = 1;
                  goto LABEL_180;
                default:
                  goto LABEL_264;
              }

              goto LABEL_180;
          }

          goto LABEL_179;
        }

        switch(v18)
        {
          case 1024:
            v206[0] = (char *)0xAAAAAAAAAAAAAAAALL;
            if (!sub_100007FD4(*v22, 10, (unint64_t *)v206) || v206[0] > (char *)1)
            {
              fprintf(__stderrp, "%s: Missing or invalid BIS bits per subpixel type value\n");
              goto LABEL_11;
            }

            unsigned int v128 = v206[0];
            char v127 = 1;
            break;
          case 1025:
            v206[0] = (char *)0xAAAAAAAAAAAAAAAALL;
            unsigned int v132 = v206[0];
            char v131 = 1;
            break;
          case 1026:
            v147 = *v22;
            char v146 = 1;
            break;
          case 1027:
            v150 = *v22;
            char v149 = 1;
            break;
          case 1028:
            BYTE4(v158) = 1;
            break;
          case 1029:
            char v152 = 1;
            break;
          case 1030:
            char v148 = 1;
            break;
          case 1031:
            LOBYTE(v154) = 1;
            break;
          case 1032:
            BYTE4(v159) = 1;
            break;
          case 1033:
            BYTE4(v155) = 1;
            break;
          case 1034:
            v156 = *v22;
            LOBYTE(v155) = 1;
            break;
          case 1035:
            v145 = *v22;
            BYTE4(v154) = 1;
            break;
          case 1036:
            v151 = *v22;
            char v157 = 1;
            break;
          case 1037:
            v153 = *v22;
            LOBYTE(v158) = 1;
            break;
          case 1038:
            v206[0] = (char *)0xAAAAAAAAAAAAAAAALL;
            if (!sub_100007FD4(*v22, 10, (unint64_t *)v206)
              || (unsigned int v143 = v206[0], v206[0] > (char *)0x29))
            {
LABEL_255:
              fprintf(__stderrp, "%s: Missing or invalid gain test set\n");
              goto LABEL_11;
            }

            char v133 = 1;
            break;
          default:
            if (v18 == 1792)
            {
              LOBYTE(v159) = 1;
            }

            else
            {
              if (v18 != 1793)
              {
LABEL_264:
                fprintf(__stderrp, "%s: ERROR: Invalid option\n");
                goto LABEL_11;
              }

              char v160 = 1;
            }

            break;
        }
      }

LABEL_180:
      int v18 = getopt_long( a1,  a2,  "a:b:c:d:f:g:hkmno:pq:r:s:t:uv:wx:CDFI:L:NO:PR:ST:W:",  (const option *)&off_100024000,  0LL);
      if (v18 == -1) {
        goto LABEL_184;
      }
    }
  }

  uint64_t v174 = 0LL;
  uint64_t v175 = 0LL;
  int v173 = 0;
  int v168 = 0;
  unint64_t v167 = 0LL;
  int v171 = 0;
  *(void *)v176 = 0LL;
  uint64_t v177 = 0LL;
  uint64_t v141 = 0LL;
  uint64_t v142 = 0LL;
  int v140 = 0;
  v138 = 0LL;
  unint64_t v139 = 0LL;
  unint64_t v162 = 0LL;
  uint64_t v163 = 0LL;
  char v130 = 0;
  char v131 = 0;
  uint64_t v134 = 0LL;
  uint64_t v135 = 0LL;
  int v161 = 0;
  unsigned int v128 = 0;
  uint64_t v129 = 0LL;
  unint64_t v125 = 0LL;
  int v179 = 0;
  unsigned int v123 = 0;
  uint64_t v136 = 0LL;
  v137 = 0LL;
  unsigned int v143 = 0;
  unsigned __int16 v144 = 0;
  LODWORD(v21) = 0;
  char v127 = 0;
  unsigned int v132 = 0;
  char v146 = 0;
  v147 = 0LL;
  char v148 = 0;
  char v149 = 0;
  v150 = 0LL;
  uint64_t v158 = 0LL;
  uint64_t v159 = 0LL;
  char v152 = 0;
  uint64_t v154 = 0LL;
  uint64_t v155 = 0LL;
  v156 = 0LL;
  char v157 = 0;
  char v133 = 0;
  uint64_t v166 = 0LL;
  int v165 = 0;
  int v124 = 0;
  BOOL v20 = 0LL;
  int v19 = 0;
  char v160 = 0;
  int v126 = 0;
  int v178 = 0;
  LODWORD(v180) = 0;
  int v169 = 255;
  int v170 = 255;
  v145 = (char *)0xAAAAAAAAAAAAAAAALL;
  v151 = (char *)0xAAAAAAAAAAAAAAAALL;
  v153 = (char *)0xAAAAAAAAAAAAAAAALL;
  memset(v164, 170, sizeof(v164));
  int v172 = 255;
LABEL_184:
  if ((byte_100025179 & 1) == 0)
  {
    uint64_t v63 = sub_100008038();
    if ((_DWORD)v63)
    {
      uint64_t v5 = v63;
      fprintf(__stderrp, "%s: Failed to connect to sep\n");
      return v5;
    }
  }

  if (v180 && IOConnectCallScalarMethod(dword_100024928, 0, 0LL, 0, 0LL, 0LL))
  {
    fprintf(__stderrp, "%s: ping failed\n");
    return 5LL;
  }

  if (v178 && sub_100008328())
  {
    fprintf(__stderrp, "%s: mailbox raw log print failed\n");
    return 5LL;
  }

  if (HIDWORD(v175) && !sub_1000085D0())
  {
    fprintf(__stderrp, "%s: security mode query failed\n");
    return 5LL;
  }

  if (HIDWORD(v174) && IOConnectCallScalarMethod(dword_100024928, 2u, 0LL, 0, 0LL, 0LL))
  {
    fprintf(__stderrp, "%s: Nap failed\n");
    return 5LL;
  }

  if ((_DWORD)v174 && IOConnectCallScalarMethod(dword_100024928, 1u, 0LL, 0, 0LL, 0LL))
  {
    fprintf(__stderrp, "%s: Sleep failed\n");
    return 5LL;
  }

  if (v173)
  {
    sub_100008674();
    v80 = __stderrp;
    outputStruct = v4[300];
    v81 = "%s: pingflood failed\n";
LABEL_238:
    fprintf(v80, v81, outputStruct, v122);
    return 5LL;
  }

  if (v168 && (sub_100008864(v167) & 1) == 0)
  {
    fprintf(__stderrp, "%s: rng-dump %ld failed\n");
    return 5LL;
  }

  if (dword_100024930 && !sub_100008A7C())
  {
    fprintf(__stderrp, "%s: process info failed\n");
    return 5LL;
  }

  BOOL v180 = v20;
  if (dword_100024934)
  {
    uint64_t v82 = sub_100008C10(1);
    if ((_DWORD)v82)
    {
      uint64_t v5 = v82;
      fprintf(__stderrp, "%s: Gigalocker initialization failed: %d\n");
      return v5;
    }
  }

  if (dword_100024938)
  {
    if (!dword_100024928) {
      sub_100016BE8();
    }
    uint64_t v85 = IOConnectCallMethod(dword_100024928, 0x2Eu, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    if ((_DWORD)v85)
    {
      uint64_t v5 = v85;
      uint64_t v100 = (int)v85;
      v101 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
      printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v100, (const char *)&unk_10001A129, v101, 1978);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100016BFC();
      }
      return v5;
    }
  }

  BOOL v181 = 0;
  if (sub_10000CB78(&v181))
  {
    fwrite("Failed to query nonce slot support\n", 0x23uLL, 1uLL, __stderrp);
    return 5LL;
  }

  if (HIDWORD(v177))
  {
    if (v181 && (_BYTE)v172 == 0xFF)
    {
      puts("Boot slot not provided to load SEPFW, setting to default");
      int v172 = 2;
    }

    v86 = v199[0] ? v199 : 0LL;
    if (!sub_100008FC0(v200, v86, v177, v172))
    {
      fprintf(__stderrp, "%s: failed to load %s in %c%c%c%c mode\n");
      return 5LL;
    }
  }

  if (dword_10002493C && !sub_1000094A8())
  {
    fprintf(__stderrp, "%s: failed to notify SEP/OS about erase install\n");
    return 5LL;
  }

  if (byte_100025170 == 1)
  {
    if (v181 && (_BYTE)v172 == 0xFF)
    {
      fprintf(__stderrp, "%s: didn't provide slot ID to commit-hash");
      return 22LL;
    }

    if (!sub_100009530(v172, 0))
    {
      fprintf(__stderrp, "%s: failed to commit SEP hash\n");
      return 5LL;
    }
  }

  if (byte_100025174 == 1)
  {
    if (v181 && (_BYTE)v172 == 0xFF)
    {
      fprintf(__stderrp, "%s: didn't provide slot ID to commit-hash-ap");
      return 22LL;
    }

    if (!sub_100009530(v172, 1u))
    {
      fprintf(__stderrp, "%s: failed to commit AP hash\n");
      return 5LL;
    }
  }

  if (dword_100024948)
  {
    if ((v170 & 0x80) != 0) {
      fprintf(__stderrp, "%s: No lcrt file provided\n", v4[300]);
    }
    if ((sub_1000095F8((char)v170) & 1) == 0)
    {
      fprintf(__stderrp, "%s: lcrt verification failed\n");
      return 5LL;
    }
  }

  if ((v166 & 0x100000000LL) != 0 && (sub_100009710(v164[2]) & 1) == 0)
  {
    fprintf(__stderrp, "%s: failed to get lynx chip serial number\n");
    return 5LL;
  }

  if ((v166 & 1) != 0 && (sub_10000983C(v164[1]) & 1) == 0)
  {
    fprintf(__stderrp, "%s: failed to get lynx public key\n");
    return 5LL;
  }

  if ((v165 & 1) != 0 && (sub_100009968(v164[0]) & 1) == 0)
  {
    fprintf(__stderrp, "%s: failed to get lynx app hash\n");
    return 5LL;
  }

  if (HIDWORD(v141))
  {
    if (dword_10002517C == 2)
    {
      if (sub_100009A6C(v200))
      {
        fprintf(__stderrp, "%s: boot check failed\n");
        return 5LL;
      }
    }

    else
    {
      puts("bootCheck: Cannot perform boot check on non-ART platform. Assuming OK");
    }
  }

  if ((_DWORD)v141)
  {
    uint64_t v87 = sub_100009C4C(v200);
    if ((_DWORD)v87)
    {
      uint64_t v5 = v87;
      fprintf(__stderrp, "%s: dump firmware failed\n");
      return v5;
    }
  }

  if (v140 && (sub_100009D1C((const char *)v198) & 1) == 0)
  {
    fprintf(__stderrp, "%s: ROM command %s failed\n");
    return 5LL;
  }

  if ((_DWORD)v175 && (sub_100009F4C((const char *)&v196, v139, v160 & 1) & 1) == 0)
  {
    fprintf(__stderrp, "%s: ART command %s failed\n");
    return 5LL;
  }

  if (dword_100024944 && !sub_10000A370())
  {
    fprintf(__stderrp, "%s: ART get nonce request failed\n");
    return 5LL;
  }

  if (HIDWORD(v163) && (sub_10000A42C() & 1) == 0)
  {
    fprintf(__stderrp, "%s: ART new-nonce request failed\n");
    return 5LL;
  }

  if ((_DWORD)v163 && IOConnectCallStructMethod(dword_100024928, 0x10u, 0LL, 0LL, 0LL, 0LL))
  {
    fprintf(__stderrp, "%s: ART invalidate nonce request failed\n");
    return 5LL;
  }

  if ((v130 & 1) != 0)
  {
    uint64_t v97 = sub_10000A55C(v144);
    if ((_DWORD)v97)
    {
      v98 = __stderrp;
      outputStruct = v4[300];
      uint64_t v122 = v97;
      v81 = "%s: Failed to start versioned apps result=0x%x\n";
LABEL_382:
      v80 = v98;
      goto LABEL_238;
    }
  }

  if ((_DWORD)v135)
  {
    if (!v162)
    {
      fprintf(__stderrp, "%s: Invalid/No object size specified\n");
      return 5LL;
    }

    if (!sub_10000A5CC((unint64_t)v194, v162))
    {
      fprintf(__stderrp, "%s: Object create failed\n");
      return 5LL;
    }
  }

  if (HIDWORD(v134))
  {
    if (!v161)
    {
      fprintf(__stderrp, "%s: Invalid/No service handle\n");
      return 5LL;
    }

    if ((sub_10000A6EC((unint64_t)v194, v161) & 1) == 0)
    {
      fprintf(__stderrp, "%s: Share %s failed\n");
      return 5LL;
    }
  }

  if (HIDWORD(v129) && (sub_10000A7EC((unint64_t)v194) & 1) == 0)
  {
    fprintf(__stderrp, "%s: Get %s failed\n");
    return 5LL;
  }

  if ((_DWORD)v129 && (sub_10000A968((unint64_t)v194) & 1) == 0)
  {
    fprintf(__stderrp, "%s: Put %s failed\n");
    return 5LL;
  }

  if ((_DWORD)v134 && (sub_10000AB38((unint64_t)v192, (char)v170, (char)v169) & 1) == 0)
  {
    fprintf(__stderrp, "%s: pairing failed\n");
    return 5LL;
  }

  if (v126 && !sub_10000ADD4(uu)) {
    return 22LL;
  }
  if (v179)
  {
    LOBYTE(v206[0]) = -86;
    if (!sepTesting(v179, v137, v136, HIDWORD(v136), v138, v123, HIDWORD(v135), v206))
    {
      uint64_t v5 = 5LL;
      v99 = "%s: test command failed\n";
      goto LABEL_420;
    }

    if (v179 == 3 && !LOBYTE(v206[0]))
    {
      uint64_t v5 = 1LL;
      v99 = "%s: test returned failure\n";
LABEL_420:
      fprintf(__stderrp, v99, v4[300]);
      return v5;
    }
  }

  if (v176[0])
  {
    uint64_t v102 = sepDebugVar(v176[0], __dst, inputStruct, v125);
    if ((_DWORD)v102)
    {
      v98 = __stderrp;
      outputStruct = *(char **)v176;
      uint64_t v122 = v102;
      v81 = "Debug var command %d failed, ret: 0x%x\n";
      goto LABEL_382;
    }
  }

  if ((v142 & 0x100000000LL) != 0)
  {
    uint64_t v103 = sub_10000AE5C(v142 & 1);
    if ((_DWORD)v103)
    {
      v98 = __stderrp;
      outputStruct = (char *)v103;
      v81 = "Failed to update tunable check mode. ret: 0x%x\n";
      goto LABEL_382;
    }
  }

  if ((v127 & 1) != 0)
  {
    v206[0] = (char *)v128;
    uint64_t v104 = IOConnectCallScalarMethod(dword_100024928, 0x30u, (const uint64_t *)v206, 1u, 0LL, 0LL);
    if ((_DWORD)v104)
    {
      uint64_t v5 = v104;
      fprintf(__stderrp, "%s: Hilo accumulate test pattern failed: 0x%x\n");
      return v5;
    }
  }

  if ((v131 & 1) != 0)
  {
    v206[0] = (char *)v132;
    uint64_t v105 = IOConnectCallScalarMethod(dword_100024928, 0x31u, (const uint64_t *)v206, 1u, 0LL, 0LL);
    int v106 = (v148 & 1) != 0 ? -536870174 : 0;
    if ((_DWORD)v105 != v106)
    {
      uint64_t v5 = v105;
      fprintf(__stderrp, "%s: Hilo gain calculation had unexpected return value: 0x%x, hilo_expect_gain_failure: %d\n");
      return v5;
    }
  }

  if ((v146 & 1) != 0)
  {
    uint64_t v107 = sub_10000AED4(v147);
    if ((_DWORD)v107)
    {
      uint64_t v5 = v107;
      fprintf(__stderrp, "%s: Hilo get LTH failed: 0x%x\n");
      return v5;
    }
  }

  if ((v149 & 1) != 0)
  {
    int v108 = (v158 & 0x100000000LL) != 0 ? -536870174 : 0;
    uint64_t v109 = sub_10000AF90(v150, BYTE4(v158) & 1);
    if ((_DWORD)v109 != v108) {
      goto LABEL_488;
    }
  }

  if ((v152 & 1) != 0)
  {
    v206[0] = (char *)0xAAAAAAAAAAAAAAAALL;
    uint64_t v110 = sub_10000B0A0(v206);
    if ((_DWORD)v110)
    {
      uint64_t v5 = v110;
      fprintf(__stderrp, "%s: Couldn't get raw LTH, return value: 0x%x");
      return v5;
    }

    v111 = v206[0];
    char v112 = sub_10000B1A4((uint64_t)v206[0]);
    free(v111);
    if ((v112 & 1) == 0) {
      fprintf(__stderrp, "%s: Raw LTH didn't have expected value", v4[300]);
    }
  }

  if ((v154 & 1) != 0)
  {
    uint64_t v113 = IOConnectCallScalarMethod(dword_100024928, 0x35u, 0LL, 0, 0LL, 0LL);
    if ((_DWORD)v113)
    {
      uint64_t v5 = v113;
      fprintf(__stderrp, "%s: Hilo update timer failed: 0x%x\n");
      return v5;
    }
  }

  if ((v154 & 0x100000000LL) != 0)
  {
    uint64_t v114 = sub_10000B2E8(v145);
    if ((_DWORD)v114)
    {
      uint64_t v5 = v114;
      fprintf(__stderrp, "%s: Raw LTH fetch operation failed: 0x%x\n");
      return v5;
    }
  }

  if ((v155 & 1) == 0 || (uint64_t v5 = sub_10000B3B4(v156, BYTE4(v155) & 1), !(_DWORD)v5))
  {
    if ((v157 & 1) == 0 || (uint64_t v5 = sub_10000B650(v151), !(_DWORD)v5))
    {
      if ((v158 & 1) == 0
        || ((v158 & 0x100000000LL) == 0 ? (int v115 = 0) : (int v115 = -536870174),
            uint64_t v109 = sub_10000B6F8(v153, BYTE4(v158) & 1),
            (_DWORD)v109 == v115))
      {
        if ((v133 & 1) != 0)
        {
          v206[0] = (char *)v143;
          uint64_t v5 = IOConnectCallScalarMethod(dword_100024928, 0x3Au, (const uint64_t *)v206, 1u, 0LL, 0LL);
          if ((_DWORD)v5) {
            return v5;
          }
        }

        if (dword_10002494C) {
          sub_10000C304();
        }
        if (dword_100024950) {
          sub_10000C37C();
        }
        if (dword_100024954) {
          sub_10000C3F4();
        }
        if ((v159 & 1) != 0 && !sub_10000B7BC())
        {
          fprintf(__stderrp, "%s: Purge system token failed\n", v4[300]);
        }

        else
        {
          if ((v159 & 0x100000000LL) != 0) {
            sub_10000C6F8();
          }
          if (byte_100025178 == 1 && !sub_10000B838((unint64_t)&__dst[4]))
          {
            fprintf(__stderrp, "%s: dump coverage failed\n", v4[300]);
            return 0LL;
          }

          if (!dword_100024958 || sub_10000C7D4())
          {
            if ((byte_100024968 & 1) != 0 || byte_10002496C) {
              sub_10000B898(v21, byte_100024968);
            }
            if (((v124 | v19) & 1) != 0)
            {
              if ((_BYTE)v172 == 0xFF)
              {
                fprintf(__stderrp, "%s: Provisional AP command missing slot ID\n");
                return 5LL;
              }

              if (!sub_10000B910(v172, v124 & 1, v180))
              {
                fprintf(__stderrp, "%s: Provisional AP command failed\n");
                return 5LL;
              }
            }

            int v116 = a1 - optind;
            if (v116 >= 1)
            {
              for (uint64_t i = &a2[optind]; ; ++i)
              {
                char v118 = **i;
                if (v118)
                {
                  v119 = (unsigned __int8 *)(*i + 1);
                  while (sub_10000BA04(v118))
                  {
                    int v120 = *v119++;
                    char v118 = v120;
                    if (!v120) {
                      goto LABEL_485;
                    }
                  }

                  fprintf(__stderrp, "%s: ttyin '%c' failed\n");
                  return 5LL;
                }

LABEL_485:
                if (v116 < 2) {
                  break;
                }
                if (!sub_10000BA04(32))
                {
                  fprintf(__stderrp, "%s: ttyin ' ' failed\n");
                  return 5LL;
                }

                --v116;
              }

              if (!sub_10000BA04(10))
              {
                fprintf(__stderrp, "%s: ttyin '\\n' failed");
                return 5LL;
              }

              if (isatty(0)) {
                usleep(0x3D090u);
              }
            }

            return 0LL;
          }
        }

        return 3758097084LL;
      }

LABEL_488:
      uint64_t v5 = v109;
      fprintf(__stderrp, "%s: Hilo load LTH had unexpected return value: 0x%x\n");
    }
  }

  return v5;
}

uint64_t sub_100007F40(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t result = lookupPathForPersonalizedData(a2, a1, 1024LL);
    if (result)
    {
      fprintf( __stderrp,  "%s: error %ld while retrieving path for personalized data\n",  (const char *)qword_100024960,  result);
      return 5LL;
    }
  }

  else
  {
    fprintf(__stderrp, "%s: invalid argument passed to %s\n", (const char *)qword_100024960, "get_firmware_path");
    return 22LL;
  }

  return result;
}

BOOL sub_100007FD4(const char *a1, int __base, unint64_t *a3)
{
  uint64_t v3 = 0LL;
  if (a1)
  {
    if (a3)
    {
      uint64_t v3 = *(unsigned __int8 *)a1;
      if (*a1)
      {
        __endptr = (char *)0xAAAAAAAAAAAAAAAALL;
        *a3 = strtoul(a1, &__endptr, __base);
        return *__endptr == 0;
      }
    }
  }

  return v3;
}

uint64_t sub_100008038()
{
  mach_port_t mainPort = -1431655766;
  if ((byte_100025179 & 1) != 0)
  {
LABEL_2:
    uint64_t v0 = 0LL;
    goto LABEL_5;
  }

  uint64_t v1 = IOMasterPort(0, &mainPort);
  if ((_DWORD)v1)
  {
    uint64_t v0 = v1;
    fprintf(__stderrp, "%s: could not get master port\n");
  }

  else
  {
    CFMutableDictionaryRef v3 = IOServiceMatching("AppleSEPManager");
    if (v3)
    {
      uint64_t v4 = v3;
      if (signal(2, (void (__cdecl *)(int))sub_10000BA4C) == (void (__cdecl *)(int))-1LL) {
        fprintf( __stderrp,  "%s: Could not register SIGINT handler. We may leak an IOKit iterator if interrupted\n",  (const char *)qword_100024960);
      }
      qword_100025180 = (uint64_t)CFRunLoopGetCurrent();
      qword_100025188 = (uint64_t)IONotificationPortCreate(mainPort);
      uint64_t v5 = (__CFRunLoop *)qword_100025180;
      RunLoopSource = IONotificationPortGetRunLoopSource((IONotificationPortRef)qword_100025188);
      CFRunLoopAddSource(v5, RunLoopSource, kCFRunLoopDefaultMode);
      uint64_t v7 = IOServiceAddMatchingNotification( (IONotificationPortRef)qword_100025188,  "IOServiceFirstMatch",  v4,  (IOServiceMatchingCallback)sub_10000BA74,  0LL,  (io_iterator_t *)&dword_100025190);
      if ((_DWORD)v7)
      {
        uint64_t v0 = v7;
        fprintf(__stderrp, "%s: could not add async match notification\n");
      }

      else
      {
        sub_10000BA74(0, dword_100025190);
        if ((byte_100025179 & 1) != 0
          || byte_10002496D == 1
          && (fprintf(__stderrp, "%s: Waiting %d seconds for AppleSEPManager...\n", (const char *)qword_100024960, 60),
              CFRunLoopRunInMode(kCFRunLoopDefaultMode, 60.0, 1u),
              (byte_100025179 & 1) != 0))
        {
          io_registry_entry_t v8 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/arm-io/sep");
          if (v8)
          {
            io_object_t v9 = v8;
            CFTypeRef v10 = IORegistryEntrySearchCFProperty(v8, "IODeviceTree", @"has-art", kCFAllocatorDefault, 0);
            if (v10)
            {
              CFRelease(v10);
              int v11 = 2;
            }

            else
            {
              int v11 = 1;
            }

            dword_10002517C = v11;
            IOObjectRelease(v9);
            goto LABEL_2;
          }

          fprintf(__stderrp, "%s: find arm-io/sep failed\n", (const char *)qword_100024960);
          fprintf(__stderrp, "%s: ART query failed\n", (const char *)qword_100024960);
          uint64_t v0 = 2LL;
        }

        else
        {
          fprintf(__stderrp, "%s: Timeout trying to connect to the SEP\n", (const char *)qword_100024960);
          uint64_t v0 = 60LL;
        }
      }
    }

    else
    {
      fprintf( __stderrp,  "%s: could not make matching dictionary for '%s'\n",  (const char *)qword_100024960,  "AppleSEPManager");
      uint64_t v0 = 93LL;
    }
  }

LABEL_5:
  if (dword_100025190)
  {
    IOObjectRelease(dword_100025190);
    dword_100025190 = 0;
  }

  return v0;
}

uint64_t sub_100008328()
{
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  uint64_t v0 = IOConnectCallMethod(dword_100024928, 0xDu, 0LL, 0, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
  if ((_DWORD)v0)
  {
    uint64_t v1 = v0;
    fprintf(__stderrp, "%s: getLogSize returned error 0x%x\n", (const char *)qword_100024960, v0);
  }

  else if (HIDWORD(output))
  {
    return 3758097090LL;
  }

  else
  {
    size_t v13 = output;
    uint64_t v1 = output & 7;
    if ((output & 7) != 0)
    {
      fprintf(__stderrp, "%s: inconsistent mailbox Log size : %d\n", (const char *)qword_100024960, output & 7);
    }

    else
    {
      outputStruct = calloc(1uLL, output);
      if (outputStruct)
      {
        uint64_t v4 = outputStruct;
        uint64_t v15 = 0LL;
        unint64_t v16 = 0LL;
        uint32_t outputCnt = 2;
        uint64_t v5 = IOConnectCallMethod(dword_100024928, 0xEu, 0LL, 0, 0LL, 0LL, &v15, &outputCnt, outputStruct, &v13);
        if ((_DWORD)v5)
        {
          uint64_t v1 = v5;
          fprintf(__stderrp, "%s: Get mailbox log failed : %d\n", (const char *)qword_100024960, v5);
        }

        else
        {
          printf("Kernel message log has %llu entries\n", v15 / v16);
          uint64_t v6 = v15;
          if (v15)
          {
            uint64_t v7 = 0LL;
            int v8 = 0;
            do
            {
              io_object_t v9 = &v4[v7];
              uint64_t v10 = *v9;
              if (*v9)
              {
                if (v8)
                {
                  printf("<skipped %d empty entries>\n", v8);
                  uint64_t v10 = *v9;
                }

                printf("0x%016llx:\t0x%016llx", &v4[v7], v10);
                if (v16 >= 2)
                {
                  for (unint64_t i = 1LL; i < v16; ++i)
                    printf("\t0x%016llx", v4[v7 + i]);
                }

                putchar(10);
                int v8 = 0;
                uint64_t v6 = v15;
              }

              else
              {
                ++v8;
              }

              v7 += v16;
            }

            while (v7 < v6);
            if (v8) {
              printf("<skipped %d empty entries>\n", v8);
            }
          }

          uint64_t v1 = 0LL;
        }

        free(v4);
      }

      else
      {
        fprintf(__stderrp, "%s: Failed to allocate memory for fetching mailbox logs\n", (const char *)qword_100024960);
        return 12LL;
      }
    }
  }

  return v1;
}

BOOL sub_1000085D0()
{
  kern_return_t v0;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t output = 0xAAAAAAAAAAAAAAAALL;
  uint32_t outputCnt = 1;
  uint64_t v0 = IOConnectCallScalarMethod(dword_100024928, 4u, 0LL, 0, &output, &outputCnt);
  if (v0) {
    fprintf(__stderrp, "%s: Security mode command error: %x\n", (const char *)qword_100024960, v0);
  }
  else {
    printf("Production Status = %llu\nSecurity Mode     = %llu\n", output & 1, (output >> 1) & 1);
  }
  return v0 == 0;
}

uint64_t sub_100008674()
{
  int v0 = -1;
  unsigned int v1 = 1;
  do
  {
    int v2 = random();
    usleep(v2 % 2000);
    uint64_t result = IOConnectCallScalarMethod(dword_100024928, 0, 0LL, 0, 0LL, 0LL);
    int v4 = result;
    if (!(v0 + 1000 * (v1 / 0x3E8))) {
      uint64_t result = printf("SEP ping #%d\n", v1);
    }
    --v0;
    ++v1;
  }

  while (!v4);
  return result;
}

uint64_t sub_10000874C(int a1, int a2)
{
  size_t __nbyte = 0LL;
  __buf = 0LL;
  if ((sub_10000C95C(&__buf, &__nbyte, 0x400uLL, a1) & 1) == 0) {
    fprintf(__stderrp, "%s: fd_to_buf returned false\n", (const char *)qword_100024960);
  }
  if (!__buf)
  {
    fprintf(__stderrp, "%s: fd_to_buf returned NULL in read file test\n");
    goto LABEL_9;
  }

  if (__nbyte >= 0x401)
  {
    fprintf(__stderrp, "%s: fd_to_buf read more data than max permissible limit (max_len = %d)\n");
LABEL_9:
    uint64_t v4 = 0LL;
    goto LABEL_10;
  }

  unint64_t v3 = write(a2, __buf, __nbyte);
  if (v3 < __nbyte)
  {
    fprintf(__stderrp, "%s: Writing to output file failed in read file test\n");
    goto LABEL_9;
  }

  uint64_t v4 = 1LL;
LABEL_10:
  if (__buf) {
    free(__buf);
  }
  return v4;
}

uint64_t sub_100008864(unint64_t a1)
{
  int v2 = fileno(__stdoutp);
  if (HIDWORD(a1))
  {
    fprintf(__stderrp, "%s: Data out size missing/out of range\n");
    return 0LL;
  }

  int v3 = v2;
  memset(__b, 170, sizeof(__b));
  uint64_t output = 0xAAAAAAAAAAAAAAAALL;
  uint32_t outputCnt = -1431655766;
  size_t outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v4 = mach_absolute_time();
  if ((_DWORD)a1)
  {
    while (1)
    {
      else {
        uint64_t v5 = a1;
      }
      uint64_t output = v5;
      uint32_t outputCnt = 1;
      size_t outputStructCnt = 1024LL;
      if (IOConnectCallMethod( dword_100024928,  0x23u,  &output,  1u,  0LL,  0LL,  &output,  &outputCnt,  __b,  &outputStructCnt))
      {
        fprintf(__stderrp, "%s: ERROR: %d\n");
        return 0LL;
      }

      int v6 = output;
      if (output >= 0x401) {
        break;
      }
      if (output) {
        write(v3, __b, output);
      }
      LODWORD(a1) = a1 - v6;
      if (!(_DWORD)a1) {
        goto LABEL_11;
      }
    }

    fprintf(__stderrp, "%s: kSEP_RngDump: returned bad data size %lu");
    return 0LL;
  }

LABEL_11:
  uint64_t v7 = mach_absolute_time() - v4;
  int v8 = __stderrp;
  io_object_t v9 = (const char *)qword_100024960;
  unsigned int v10 = dword_100025198;
  if (!dword_100025198)
  {
    mach_timebase_info((mach_timebase_info_t)&dword_100025194);
    unsigned int v10 = dword_100025198;
  }

  fprintf(v8, "\n%s: Time taken: %lld ns\n", v9, v7 * dword_100025194 / v10);
  return 1LL;
}

BOOL sub_100008A7C()
{
  kern_return_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint32_t outputCnt;
  size_t v6;
  uint64_t output;
  uuid_string_t out;
  _BYTE __b[1024];
  memset(__b, 170, sizeof(__b));
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v0 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v0 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)out = v0;
  *(_OWORD *)&out[16] = v0;
  int v6 = 1024LL;
  uint64_t output = 1024LL;
  uint32_t outputCnt = 1;
  unsigned int v1 = IOConnectCallMethod(dword_100024928, 0x41u, &output, 1u, 0LL, 0LL, &output, &outputCnt, __b, &v6);
  if (v1)
  {
    fprintf(__stderrp, "%s: ERROR: %d\n", (const char *)qword_100024960, v1);
  }

  else if (output >= 0x20)
  {
    int v2 = 0LL;
    int v3 = __b;
    do
    {
      printf( "%u %c%c%c%c\n",  *(_DWORD *)v3,  (*((int *)v3 + 1) >> 24),  ((int)(*((_DWORD *)v3 + 1) << 8) >> 24),  ((__int16)*((_DWORD *)v3 + 1) >> 8),  (char)*((_DWORD *)v3 + 1));
      uuid_unparse(v3 + 8, out);
      printf("\t UUID: %s\n", out);
      printf("\tSlide: 0x%llx\n", *((void *)v3 + 3));
      ++v2;
      v3 += 32;
    }

    while (v2 < output >> 5);
  }

  return v1 == 0;
}

uint64_t sub_100008C10(int a1)
{
  BOOL v21 = 0;
  bzero(inputStruct, 0x400uLL);
  memset(&__s, 0, sizeof(__s));
  uint64_t v2 = sub_10000CAC8(&v21);
  if ((_DWORD)v2)
  {
    uint64_t v10 = v2;
    uint64_t v14 = (int)v2;
    uint64_t v15 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v14, (const char *)&unk_10001A129, v15, 4466);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100016F28();
    }
  }

  else
  {
    if (!v21)
    {
      printf("%s: xART is not supported on platform, skipping initialization\n", (const char *)qword_100024960);
      return 0LL;
    }

    if (a1) {
      sub_10000CC28();
    }
    int v3 = sub_10000CC38();
    if (stat(v3, &__s) || (__s.st_mode & 0xF000) != 0x4000)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100016EE4();
      }
      return 20LL;
    }

    else
    {
      uint64_t v4 = sub_10000CF8C(inputStruct, 0x400uLL, (uint64_t)v3, 1);
      if ((_DWORD)v4)
      {
        uint64_t v10 = v4;
        uint64_t v16 = (int)v4;
        int v17 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
        printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v16, (const char *)&unk_10001A129, v17, 4487);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100016E4C();
        }
      }

      else
      {
        memset_s(&__s, 0x90uLL, 0, 0x90uLL);
        int v5 = stat(inputStruct, &__s);
        int v6 = (const char *)qword_100024960;
        if (v5)
        {
          uint64_t v7 = __error();
          int v8 = strerror(*v7);
          printf("%s: Gigalocker file (%s) doesn't exist: %s\n", v6, inputStruct, v8);
          if ((a1 & 1) == 0) {
            return *__error();
          }
          uint64_t v9 = sub_10000CC5C(inputStruct, 0x600000uLL);
          if ((_DWORD)v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = (int)v9;
            unint64_t v12 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
            printf( "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n",  v11,  (const char *)&unk_10001A129,  v12,  4504);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_100016DB4();
            }
            return v10;
          }

          goto LABEL_19;
        }

        printf("%s: Gigalocker file (%s) exists\n", (const char *)qword_100024960, inputStruct);
        if ((unint64_t)__s.st_size >> 21 > 2)
        {
LABEL_19:
          if (!dword_100024928) {
            sub_100016BE8();
          }
          uint64_t v10 = IOConnectCallMethod(dword_100024928, 0x2Cu, 0LL, 0, inputStruct, 0x400uLL, 0LL, 0LL, 0LL, 0LL);
          if ((_DWORD)v10)
          {
            int v18 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
            printf( "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n",  (int)v10,  (const char *)&unk_10001A129,  v18,  4528);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_100016D1C();
            }
          }

          else
          {
            printf("%s: Gigalocker initialization completed\n", (const char *)qword_100024960);
          }

          return v10;
        }

        int v19 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
        printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v19, 4508);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100016C94();
        }
        return 17LL;
      }
    }
  }

  return v10;
}

BOOL sub_100008FC0(char *a1, char *a2, uint32_t a3, unsigned int a4)
{
  unsigned int v32 = 0;
  unsigned int v33 = -1431655766;
  if (!a1)
  {
    v23 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v23, 3060);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100016FC0();
    }
    return 0LL;
  }

  if (!strcmp(a1, "-"))
  {
    if (a2)
    {
      int v28 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
      printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v28, 3063);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000171E0();
      }
    }

    else
    {
      size_t v13 = malloc(0x2040001uLL);
      if (v13)
      {
        uint64_t v14 = (uint64_t)v13;
        unint64_t v15 = 0LL;
        ssize_t v16 = -1LL;
        while (v16)
        {
          ssize_t v16 = read(0, (void *)(v14 + v15), 33816577 - v15);
          if (v16 == -1)
          {
            fprintf(__stderrp, "%s: error reading from stdin");
            goto LABEL_26;
          }

          v15 += v16;
          if (v15 == 33816577)
          {
            fprintf(__stderrp, "%s: stdin data too large");
LABEL_26:
            BOOL v17 = 0LL;
            goto LABEL_31;
          }
        }

        unint64_t v35 = 0xAAAAAAAAAAAAAAAALL;
        if (Img4DecodeParseLengthFromBuffer(v14, v15, &v35))
        {
          unint64_t v29 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
          printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v29, 2973);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100017158();
          }
          goto LABEL_26;
        }

        uint64_t v19 = v35;
        if (v15 < v35) {
          sub_100016BE8();
        }
        if (v15 == v35)
        {
          size_t v20 = 0LL;
          BOOL v21 = 0LL;
        }

        else
        {
          unint64_t v34 = 0xAAAAAAAAAAAAAAAALL;
          if (Img4DecodeParseLengthFromBuffer(v14 + v35, v15 - v35, &v34))
          {
            BOOL v30 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
            printf( "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n",  0LL,  (const char *)&unk_10001A129,  v30,  2983);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_1000170D0();
            }
            goto LABEL_26;
          }

          size_t v20 = v15 - v35;
          if (v15 - v35 != v34)
          {
            uint64_t v31 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
            printf( "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n",  0LL,  (const char *)&unk_10001A129,  v31,  2985);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_100017048();
            }
            goto LABEL_26;
          }

          BOOL v21 = (const void *)(v14 + v35);
        }

        BOOL v17 = sub_10000BCB8(v14, v19, v21, v20, a3, a4);
LABEL_31:
        int v18 = (void *)v14;
        goto LABEL_32;
      }

      fprintf(__stderrp, "%s: could not allocate data buffer", (const char *)qword_100024960);
    }

    return 0LL;
  }

  int v8 = malloc(0x2000000uLL);
  if (!v8)
  {
    uint64_t v24 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v24, 3070);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100017268();
    }
    return 0LL;
  }

  uint64_t v9 = v8;
  if (sub_10000BAE4(v8, 0x2000000uLL, a1, &v33))
  {
    uint64_t v25 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v25, 3073);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100017400();
    }
LABEL_42:
    free(v9);
    return 0LL;
  }

  if (a2)
  {
    uint64_t v10 = malloc(0x40000uLL);
    if (v10)
    {
      uint64_t v11 = v10;
      if (sub_10000BAE4(v10, 0x40000uLL, a2, &v32))
      {
        BOOL v27 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
        printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v27, 3080);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100017378();
        }
        free(v9);
        BOOL v17 = 0LL;
        goto LABEL_18;
      }

      size_t v12 = v32;
      goto LABEL_17;
    }

    int v26 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v26, 3077);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000172F0();
    }
    goto LABEL_42;
  }

  size_t v12 = 0LL;
  uint64_t v11 = 0LL;
LABEL_17:
  BOOL v17 = sub_10000BCB8((uint64_t)v9, v33, v11, v12, a3, a4);
  free(v9);
  if (v11)
  {
LABEL_18:
    int v18 = (void *)v11;
LABEL_32:
    free(v18);
  }

  return v17;
}

BOOL sub_1000094A8()
{
  kern_return_t v0;
  if (!dword_100024928) {
    sub_100016BE8();
  }
  __int128 v0 = IOConnectCallMethod(dword_100024928, 0xAu, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if (v0) {
    fprintf(__stderrp, "%s: Erase install notification returned 0x%x\n", (const char *)qword_100024960, v0);
  }
  return v0 == 0;
}

BOOL sub_100009530(unsigned int a1, unsigned int a2)
{
  kern_return_t v2;
  uint64_t input[2];
  input[0] = a1;
  input[1] = a2;
  printf("%s called with slot %u, for_ap %u\n", "sepCommitHash", a1, a2);
  uint64_t v2 = IOConnectCallScalarMethod(dword_100024928, 9u, input, 2u, 0LL, 0LL);
  if (v2) {
    fprintf(__stderrp, "%s: commit hash returned 0x%x\n", (const char *)qword_100024960, v2);
  }
  return v2 == 0;
}

uint64_t sub_1000095F8(int a1)
{
  size_t v7 = 0LL;
  int v8 = 0LL;
  mach_port_t v2 = dword_100024928;
  if (!dword_100024928) {
    sub_100016BE8();
  }
  if (a1 < 0)
  {
    size_t v3 = 0LL;
    uint64_t v4 = 0LL;
  }

  else
  {
    if ((sub_10000C95C(&v8, &v7, 0x8000uLL, a1) & 1) == 0)
    {
      fprintf(__stderrp, "%s: can't read in lcrt\n");
      goto LABEL_12;
    }

    size_t v3 = v7;
    if (!v7)
    {
      fprintf(__stderrp, "%s: Zero sized input file\n");
      goto LABEL_12;
    }

    mach_port_t v2 = dword_100024928;
    uint64_t v4 = v8;
  }

  if (!IOConnectCallMethod(v2, 0x29u, 0LL, 0, v4, v3, 0LL, 0LL, 0LL, 0LL))
  {
    uint64_t v5 = 1LL;
    goto LABEL_13;
  }

  fprintf(__stderrp, "%s: lcrt verification request returned 0x%x\n");
LABEL_12:
  uint64_t v5 = 0LL;
LABEL_13:
  if (v8) {
    free(v8);
  }
  return v5;
}

uint64_t sub_100009710(char *a1)
{
  size_t outputStructCnt = 0x8000LL;
  if (IOConnectCallMethod(dword_100024928, 0x2Au, 0LL, 0, 0LL, 0LL, 0LL, 0LL, __b, &outputStructCnt))
  {
    fprintf(__stderrp, "%s: lynx get chip serial number returned 0x%x\n");
  }

  else
  {
    fprintf(__stderrp, "%s: couldn't write out Lynx Chip Serial Number\n");
  }

  return 0LL;
}

uint64_t sub_10000983C(char *a1)
{
  size_t outputStructCnt = 0x8000LL;
  if (IOConnectCallMethod(dword_100024928, 0x2Bu, 0LL, 0, 0LL, 0LL, 0LL, 0LL, __b, &outputStructCnt))
  {
    fprintf(__stderrp, "%s: lynx get public key returned 0x%x\n");
  }

  else
  {
    fprintf(__stderrp, "%s: couldn't write out Lynx Public Key\n");
  }

  return 0LL;
}

uint64_t sub_100009968(char *a1)
{
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  outputStruct[0] = v2;
  outputStruct[1] = v2;
  *(void *)uint64_t v4 = 32LL;
  if (IOConnectCallMethod(dword_100024928, 0x5Au, 0LL, 0, 0LL, 0LL, 0LL, 0LL, outputStruct, (size_t *)v4))
  {
    fprintf(__stderrp, "%s: lynx get app hash returned 0x%x\n");
  }

  else
  {
    fprintf(__stderrp, "%s: couldn't write out Lynx app hash\n");
  }

  return 0LL;
}

uint64_t sub_100009A6C(char *a1)
{
  kern_return_t v7;
  const char *v8;
  int v9;
  unsigned int v11;
  size_t outputStructCnt;
  _BYTE __b[2048];
  __int128 v2 = malloc(0x2000000uLL);
  if (v2)
  {
    size_t v3 = v2;
    uint64_t v11 = -1431655766;
    uint64_t v4 = sub_10000BAE4(v2, 0x2000000uLL, a1, &v11);
    if ((_DWORD)v4)
    {
      uint64_t v5 = v4;
      fprintf(__stderrp, "%s: failed to read the firmware file\n", (const char *)qword_100024960);
    }

    else
    {
      uint64_t v6 = v11;
      if (v11)
      {
        memset(__b, 170, sizeof(__b));
        size_t outputStructCnt = 2048LL;
        size_t v7 = IOConnectCallStructMethod(dword_100024928, 0x12u, 0LL, 0LL, __b, &outputStructCnt);
        if (v7)
        {
          fprintf(__stderrp, "%s: Get ART command error: 0x%x\n", (const char *)qword_100024960, v7);
          int v8 = "CAN NOT";
        }

        else
        {
          uint64_t v9 = sub_100004B50((uint64_t)v3, v6, (uint64_t)__b, (uint64_t)&__b[outputStructCnt], 3);
          int v8 = "CAN NOT";
          if (v9) {
            int v8 = "may";
          }
        }

        printf("bootCheck: SEP %s boot with ART\n", v8);
        uint64_t v5 = 0LL;
      }

      else
      {
        fprintf(__stderrp, "%s: incorrect file size reported\n", (const char *)qword_100024960);
        uint64_t v5 = 5LL;
      }
    }

    free(v3);
  }

  else
  {
    fprintf(__stderrp, "%s: can't allocate memory for '%s'\n", (const char *)qword_100024960, a1);
    return 12LL;
  }

  return v5;
}

uint64_t sub_100009C4C(char *a1)
{
  __int128 v2 = malloc(0x2000000uLL);
  if (v2)
  {
    size_t v3 = v2;
    unsigned int v7 = -1431655766;
    uint64_t v4 = sub_10000BAE4(v2, 0x2000000uLL, a1, &v7);
    if ((_DWORD)v4)
    {
      uint64_t v5 = v4;
      fprintf(__stderrp, "%s: read firmware failed\n");
    }

    else
    {
      uint64_t v5 = sub_10000486C((uint64_t)v3, v7);
      if ((_DWORD)v5) {
        fprintf(__stderrp, "%s: img4 dump failed\n");
      }
    }

    free(v3);
  }

  else
  {
    fprintf(__stderrp, "%s: can't allocate memory for '%s'\n", (const char *)qword_100024960, a1);
    return 12LL;
  }

  return v5;
}

uint64_t sub_100009D1C(const char *a1)
{
  kern_return_t v3;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t input;
  if (!strcmp(a1, "status"))
  {
    uint64_t v2 = 131583LL;
  }

  else if (!strcmp(a1, "nop"))
  {
    uint64_t v2 = 66303LL;
  }

  else
  {
    if (strcmp(a1, "tz0"))
    {
      puts("unknown ROM command");
      return 0LL;
    }

    uint64_t v2 = 328703LL;
  }

  uint64_t output = v2;
  input = v2;
  uint32_t outputCnt = 1;
  size_t v3 = IOConnectCallScalarMethod(dword_100024928, 3u, &input, 1u, &output, &outputCnt);
  if (v3)
  {
    fprintf(__stderrp, "%s: ROM command error: %x\n", (const char *)qword_100024960, v3);
    return 0LL;
  }

  printf("SEP status 0x%llx\n", output);
  return 1LL;
}

uint64_t sub_100009E24(int a1)
{
  size_t outputStructCnt = 20LL;
  if (a1 <= 0)
  {
    fprintf(__stderrp, "%s: No/Illegal outfile provided\n");
  }

  else if (IOConnectCallStructMethod(dword_100024928, 0x43u, 0LL, 0LL, outputStruct, &outputStructCnt))
  {
    fprintf(__stderrp, "%s: Failed to generate ROM nonce: %x\n");
  }

  else
  {
    size_t v2 = outputStructCnt;
    if (v2 == write(a1, outputStruct, outputStructCnt)) {
      return 1LL;
    }
    fprintf(__stderrp, "%s: can't write to output\n");
  }

  return 0LL;
}

uint64_t sub_100009F4C(const char *a1, unint64_t a2, int a3)
{
  if (!strcasecmp(a1, "get"))
  {
    size_t outputStructCnt = 2048LL;
    uint64_t v6 = IOConnectCallStructMethod(dword_100024928, 0x12u, 0LL, 0LL, __b, &outputStructCnt);
    if ((_DWORD)v6)
    {
LABEL_9:
      int v8 = __stderrp;
      uint64_t v23 = qword_100024960;
      uint64_t v24 = v6;
      uint64_t v9 = "%s: Get ART command error: 0x%x\n";
LABEL_43:
      fprintf(v8, v9, v23, v24);
      return 0LL;
    }

    sub_100004664((unint64_t)__b, (unint64_t)&__b[outputStructCnt]);
    return 1LL;
  }

  if (!strcasecmp(a1, "set"))
  {
    uint64_t v10 = &byte_10002496E;
    if (byte_10002496E == 48 && ((byte_10002496F - 88) & 0xDF) == 0) {
      uint64_t v10 = (const char *)&unk_100024970;
    }
    size_t v11 = strlen(v10);
    if (v11 >> 1 > 0x800 || (v11 & 1) != 0 || v11 == 1) {
      goto LABEL_31;
    }
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    unsigned int v14 = 2;
    do
    {
      unsigned int v15 = v10[v13];
      if (v15 - 97 > 5)
      {
        if (v15 - 65 > 5)
        {
          v15 -= 48;
          if (v15 > 9) {
            break;
          }
        }

        else
        {
          LOBYTE(v15) = v15 - 55;
        }
      }

      else
      {
        LOBYTE(v15) = v15 - 87;
      }

      char v16 = 16 * v15;
      __b[v12] = v16;
      unsigned int v17 = v10[v14 - 1];
      if (v17 - 97 > 5)
      {
        if (v17 - 65 > 5)
        {
          v17 -= 48;
          if (v17 > 9) {
            break;
          }
        }

        else
        {
          LOBYTE(v17) = v17 - 55;
        }
      }

      else
      {
        LOBYTE(v17) = v17 - 87;
      }

      __b[v12++] = v17 | v16;
      uint64_t v13 = v14;
      BOOL v18 = v11 - 1 > v14;
      v14 += 2;
    }

    while (v18);
    if ((int)v12 <= 0)
    {
LABEL_31:
      fprintf(__stderrp, "%s: Set ART command error: malformed hex string provided");
      return 0LL;
    }

    uint64_t v19 = IOConnectCallStructMethod(dword_100024928, 0x13u, __b, v12, 0LL, 0LL);
    if ((_DWORD)v19)
    {
      int v8 = __stderrp;
      uint64_t v23 = qword_100024960;
      uint64_t v24 = v19;
      uint64_t v9 = "%s: Set ART error: 0x%x\n";
      goto LABEL_43;
    }

    int v22 = "ART persisted successfully";
    goto LABEL_46;
  }

  if (!strcasecmp(a1, "clear"))
  {
    uint64_t v20 = IOConnectCallStructMethod(dword_100024928, 0x14u, 0LL, 0LL, 0LL, 0LL);
    if ((_DWORD)v20)
    {
      int v8 = __stderrp;
      uint64_t v23 = qword_100024960;
      uint64_t v24 = v20;
      uint64_t v9 = "%s: Clear ART error: 0x%x\n";
      goto LABEL_43;
    }

    int v22 = "ART cleared from storage";
LABEL_46:
    puts(v22);
    return 1LL;
  }

  if (strcasecmp(a1, "ctrtest"))
  {
    if (!strcasecmp(a1, "has_system_token"))
    {
      size_t outputStructCnt = 2048LL;
      uint64_t v6 = IOConnectCallStructMethod(dword_100024928, 0x12u, 0LL, 0LL, __b, &outputStructCnt);
      if (!(_DWORD)v6) {
        return sub_1000044D4((uint64_t)__b, outputStructCnt, a3);
      }
      goto LABEL_9;
    }

    return 0LL;
  }

  if ((a2 & 0x8000000000000000LL) != 0)
  {
    fprintf(__stderrp, "%s: minblocks out of range\n");
    return 0LL;
  }

  size_t outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
  uint32_t outputCnt = 2;
  uint64_t v21 = IOConnectCallScalarMethod(dword_100024928, 0x24u, 0LL, 0, &outputStructCnt, &outputCnt);
  if ((_DWORD)v21 || outputCnt != 2)
  {
    int v8 = __stderrp;
    uint64_t v23 = qword_100024960;
    uint64_t v24 = v21;
    uint64_t v9 = "%s: Counter self-test error: 0x%x\n";
    goto LABEL_43;
  }

  printf("Counter self-test result: %u/%u good\n", v27, outputStructCnt);
  if (v27 < a2)
  {
    fprintf(__stderrp, "%s: Minimum good blocks criteria not met\n");
    return 0LL;
  }

  return 1LL;
}

BOOL sub_10000A370()
{
  kern_return_t v0;
  size_t outputStructCnt;
  void outputStruct[3];
  memset(outputStruct, 170, 20);
  size_t outputStructCnt = 20LL;
  if (!dword_100024928) {
    sub_100016BE8();
  }
  __int128 v0 = IOConnectCallStructMethod(dword_100024928, 0x44u, 0LL, 0LL, outputStruct, &outputStructCnt);
  if (v0) {
    fprintf(__stderrp, "%s: Get nonce command error: %x\n", (const char *)qword_100024960, v0);
  }
  return v0 == 0;
}

uint64_t sub_10000A42C()
{
  kern_return_t v0;
  uint32_t outputCnt;
  BOOL v3;
  size_t outputStructCnt;
  uint64_t output;
  void outputStruct[3];
  memset(outputStruct, 170, 20);
  size_t outputStructCnt = 20LL;
  size_t v3 = 0;
  if (!sub_10000CB78(&v3))
  {
    if (v3)
    {
      uint64_t output = 0LL;
      uint32_t outputCnt = 1;
      __int128 v0 = IOConnectCallMethod( dword_100024928,  0x53u,  0LL,  0,  0LL,  0LL,  &output,  &outputCnt,  outputStruct,  &outputStructCnt);
      if (v0)
      {
LABEL_5:
        fprintf(__stderrp, "%s: New nonce command error: %x\n", (const char *)qword_100024960, v0);
        return 0LL;
      }
    }

    else
    {
      __int128 v0 = IOConnectCallStructMethod(dword_100024928, 0xFu, 0LL, 0LL, outputStruct, &outputStructCnt);
      if (v0) {
        goto LABEL_5;
      }
    }

    return 1LL;
  }

  fwrite("Failed to query nonce slot support\n", 0x23uLL, 1uLL, __stderrp);
  return 0LL;
}

uint64_t sub_10000A55C(unsigned int a1)
{
  input[0] = a1 >> 8;
  input[1] = a1;
  return IOConnectCallScalarMethod(dword_100024928, 0x11u, input, 2u, 0LL, 0LL);
}

BOOL sub_10000A5CC(unint64_t a1, unint64_t a2)
{
  kern_return_t v3;
  BOOL v4;
  int inputStruct;
  uint64_t input;
  LODWORD(input) = string_to_handle(a1);
  if (!(_DWORD)input)
  {
    fprintf(__stderrp, "%s: Invalid object name\n");
    return 0LL;
  }

  if (HIDWORD(a2))
  {
    fprintf(__stderrp, "%s: Object size missing/out of range/invalid\n");
    return 0LL;
  }

  inputStruct = a2;
  size_t v3 = IOConnectCallMethod(dword_100024928, 0x1Fu, &input, 1u, &inputStruct, 4uLL, 0LL, 0LL, 0LL, 0LL);
  uint64_t v4 = v3 == 0;
  if (v3) {
    fprintf(__stderrp, "%s: ERROR: %d\n", (const char *)qword_100024960, v3);
  }
  else {
    printf( "Created '%c%c%c%c' of size %u\n",  ((int)input >> 24),  ((int)((_DWORD)input << 8) >> 24),  ((__int16)input >> 8),  (char)input,  inputStruct);
  }
  return v4;
}

uint64_t sub_10000A6EC(unint64_t a1, int a2)
{
  HIDWORD(input) = a2;
  LODWORD(input) = string_to_handle(a1);
  if ((_DWORD)input && a2)
  {
    if (!IOConnectCallMethod(dword_100024928, 0x20u, &input, 1u, (char *)&input + 4, 4uLL, 0LL, 0LL, 0LL, 0LL))
    {
      printf( "Shared '%c%c%c%c' with '%c%c%c%c'\n",  ((int)input >> 24),  ((int)((_DWORD)input << 8) >> 24),  ((__int16)input >> 8),  (char)input,  (SHIDWORD(input) >> 24),  ((int)(HIDWORD(input) << 8) >> 24),  (SWORD2(input) >> 8),  SBYTE4(input));
      return 1LL;
    }

    fprintf(__stderrp, "%s: ERROR: %d\n");
  }

  else
  {
    fprintf(__stderrp, "%s: Invalid object/service name\n");
  }

  return 0LL;
}

uint64_t sub_10000A7EC(unint64_t a1)
{
  unsigned int v1 = string_to_handle(a1);
  int v2 = fileno(__stdoutp);
  unsigned int v3 = 0;
  uint64_t v4 = v1;
  while (1)
  {
    memset(__b, 170, sizeof(__b));
    output[0] = v4;
    output[1] = v3;
    size_t __nbyte = 1024LL;
    uint32_t outputCnt = 3;
    size_t outputStructCnt = 1024LL;
    if (IOConnectCallMethod(dword_100024928, 0x21u, output, 3u, 0LL, 0LL, output, &outputCnt, __b, &outputStructCnt))
    {
      fprintf(__stderrp, "%s: ERROR: %d\n");
      return 0LL;
    }

    size_t v5 = __nbyte;
    if (__nbyte >= 0x401) {
      break;
    }
    if (!__nbyte) {
      return 1LL;
    }
    write(v2, __b, __nbyte);
    if (v5 < 0x400) {
      return 1LL;
    }
    v3 += v5;
  }

  fprintf(__stderrp, "%s: kSEP_ObjRead: returned bad data size %lu");
  return 0LL;
}

uint64_t sub_10000A968(unint64_t a1)
{
  int v1 = string_to_handle(a1);
  int v2 = fileno(__stdinp);
  memset(__b, 170, sizeof(__b));
  ssize_t v3 = read(v2, __b, 0x400uLL);
  if (v3 < 1)
  {
    unsigned int v5 = 0;
LABEL_8:
    if (!ferror(__stdinp))
    {
LABEL_10:
      printf( "Copied %u bytes to %c%c%c%C\n",  v5,  (v1 >> 24),  (v1 << 8 >> 24),  ((__int16)v1 >> 8),  (char)v1);
      return 1LL;
    }

    fprintf(__stderrp, "%s: error reading data\n");
  }

  else
  {
    ssize_t v4 = v3;
    unsigned int v5 = 0;
    while (1)
    {
      output[0] = v1;
      output[1] = v5;
      ssize_t v9 = v4;
      uint32_t outputCnt = 3;
      if (IOConnectCallMethod(dword_100024928, 0x22u, output, 3u, __b, v4, output, &outputCnt, 0LL, 0LL)) {
        break;
      }
      if (v9 != v4) {
        goto LABEL_10;
      }
      v5 += v4;
      memset(__b, 170, sizeof(__b));
      ssize_t v4 = read(v2, __b, 0x400uLL);
      if (v4 < 1) {
        goto LABEL_8;
      }
    }

    fprintf(__stderrp, "%s: ERROR: %d\n");
  }

  return 0LL;
}

uint64_t sub_10000AB38(unint64_t a1, int a2, int a3)
{
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  BOOL v18 = 0LL;
  size_t __nbyte = 0xAAAAAAAAAAAAAAAALL;
  unsigned int v5 = string_to_handle(a1);
  uint64_t input = v5;
  if (!v5)
  {
    fprintf(__stderrp, "%s: Invalid pair method\n", (const char *)qword_100024960);
    uint64_t v12 = 0LL;
    outputStruct = 0LL;
    goto LABEL_30;
  }

  int v6 = v5;
  size_t __nbyte = 0x4000LL;
  unsigned int v7 = malloc(0x4000uLL);
  outputStruct = v7;
  if (!v7)
  {
    fprintf(__stderrp, "%s: Failed to allocate memory for out_buffer\n");
    goto LABEL_29;
  }

  bzero(v7, 0x4000uLL);
  if (v6 <= 1396788559)
  {
    if (v6 != 1280921176 && v6 != 1347636041) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  if (v6 == 1396788560 || v6 == 1397311310)
  {
LABEL_15:
    if (a3 <= 0) {
      goto LABEL_19;
    }
    goto LABEL_16;
  }

  if (v6 == 1398031179)
  {
    if (a2 < 0)
    {
      fprintf(__stderrp, "%s: No/Illegal infile provided\n");
      goto LABEL_29;
    }

    if ((sub_10000C95C(&v18, &v17, 0x4000uLL, a2) & 1) != 0)
    {
      if (a3 > 0)
      {
        mach_port_t v9 = dword_100024928;
        size_t v11 = v17;
        uint64_t v10 = v18;
        goto LABEL_23;
      }

LABEL_19:
      fprintf(__stderrp, "%s: No/Illegal outfile provided\n");
      goto LABEL_29;
    }

LABEL_20:
    fprintf(__stderrp, "%s: can't read in infile\n");
    goto LABEL_29;
  }

LABEL_16:
  if (a2 < 0)
  {
    size_t v11 = 0LL;
    uint64_t v10 = 0LL;
    unint64_t v17 = 0LL;
  }

  else
  {
    size_t v11 = v17;
    uint64_t v10 = v18;
  }

  mach_port_t v9 = dword_100024928;
LABEL_23:
  if (!IOConnectCallMethod(v9, 0x15u, &input, 1u, v10, v11, 0LL, 0LL, outputStruct, &__nbyte))
  {
    if (a3 < 1 || (size_t v13 = __nbyte, v13 == write(a3, outputStruct, __nbyte)))
    {
      uint64_t v12 = 1LL;
      goto LABEL_30;
    }

    fprintf(__stderrp, "%s: can't write out_buffer (to outfile)\n");
  }

LABEL_29:
  uint64_t v12 = 0LL;
LABEL_30:
  if (v18) {
    free(v18);
  }
  if (outputStruct) {
    free(outputStruct);
  }
  return v12;
}

BOOL sub_10000ADD4(void *inputStruct)
{
  kern_return_t v1;
  if (!dword_100024928) {
    sub_100016BE8();
  }
  int v1 = IOConnectCallMethod(dword_100024928, 0x28u, 0LL, 0, inputStruct, 0x10uLL, 0LL, 0LL, 0LL, 0LL);
  if (v1) {
    fprintf(__stderrp, "%s: xART OS UUID setup failed: %d\n", (const char *)qword_100024960, v1);
  }
  return v1 == 0;
}

uint64_t sub_10000AE5C(unsigned int a1)
{
  uint64_t input = a1;
  return IOConnectCallMethod(dword_100024928, 0x5Bu, &input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t sub_10000AED4(char *a1)
{
  uint64_t v2 = 3758097098LL;
  if (sub_10000C5E0())
  {
    size_t v3 = qword_1000251A0;
    ssize_t v4 = malloc(qword_1000251A0);
    if (v4)
    {
      unsigned int v5 = v4;
      size_t outputStructCnt = v3;
      uint64_t v2 = IOConnectCallStructMethod(dword_100024928, 0x32u, 0LL, 0LL, v4, &outputStructCnt);
      if (!(_DWORD)v2)
      {
        else {
          uint64_t v2 = 0LL;
        }
      }

      free(v5);
    }

    else
    {
      return 3758097085LL;
    }
  }

  return v2;
}

uint64_t sub_10000AF90(char *a1, int a2)
{
  uint64_t v4 = 3758097098LL;
  if (sub_10000C5E0())
  {
    unint64_t v5 = qword_1000251A0;
    int v6 = malloc(qword_1000251A0);
    if (v6)
    {
      unsigned int v7 = v6;
      int v10 = -1431655766;
      if (!sub_10000BAE4(v6, v5, a1, &v10))
      {
        size_t v8 = qword_1000251A0;
        if (qword_1000251A0 != v10)
        {
          uint64_t v4 = 3758097090LL;
          goto LABEL_12;
        }

        if (a2)
        {
          if ((unint64_t)qword_1000251A0 <= 0x1000)
          {
            fprintf(__stderrp, "%s: HILO_BYTE_TO_CORRUPT is not within LTH backup\n", (const char *)qword_100024960);
            uint64_t v4 = 3758097097LL;
            goto LABEL_12;
          }

          ++v7[4096];
        }

        uint64_t v4 = IOConnectCallStructMethod(dword_100024928, 0x33u, v7, v8, 0LL, 0LL);
      }

LABEL_12:
      free(v7);
      return v4;
    }

    return 3758097085LL;
  }

  return v4;
}

uint64_t sub_10000B0A0(void *a1)
{
  size_t v2 = qword_1000251C8;
  size_t v3 = malloc(qword_1000251C8);
  if (v3)
  {
    uint64_t v4 = v3;
    size_t outputStructCnt = v2;
    uint64_t v5 = IOConnectCallStructMethod(dword_100024928, 0x34u, 0LL, 0LL, v3, &outputStructCnt);
    if ((_DWORD)v5)
    {
      uint64_t v6 = v5;
      *a1 = v4;
LABEL_10:
      free(v4);
      return v6;
    }

    if (qword_1000251C8 != outputStructCnt)
    {
      fprintf(__stderrp, "%s: unexpected return call size\n", (const char *)qword_100024960);
      uint64_t v6 = 5LL;
      goto LABEL_10;
    }

    uint64_t v6 = 0LL;
    *a1 = v4;
  }

  else
  {
    fprintf(__stderrp, "%s: can't allocate memory for LTH\n", (const char *)qword_100024960);
    return 12LL;
  }

  return v6;
}

uint64_t sub_10000B1A4(uint64_t a1)
{
  if ((sub_10000C5E0() & 1) != 0)
  {
    uint64_t v2 = 0LL;
    uint64_t v7 = a1;
    uint64_t v8 = a1 + 4LL * dword_1000251B8[0];
    uint64_t v9 = v8 + 4LL * dword_1000251BC;
    while (1)
    {
      uint64_t v3 = dword_1000251B8[v2];
      if ((_DWORD)v3) {
        break;
      }
LABEL_7:
      if (++v2 == 3) {
        return 1LL;
      }
    }

    uint64_t v4 = 0LL;
    unsigned int v5 = v2;
    while (dword_100019508[3 * v4 + 3 * ((_DWORD)v2 - 5 * (v5 / 5))] == *(_DWORD *)(*(&v7 + v2) + 4 * v4))
    {
      ++v4;
      ++v5;
      if (v3 == v4) {
        goto LABEL_7;
      }
    }

    fprintf(__stderrp, "%s: Channel %d sample %u had bad LTH value (expected %u, got %u)\n");
  }

  else
  {
    fprintf(__stderrp, "%s: No display params when expected!\n");
  }

  return 0LL;
}

uint64_t sub_10000B2E8(char *a1)
{
  *(void *)uint64_t v6 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v2 = sub_10000B0A0(v6);
  if ((_DWORD)v2)
  {
    uint64_t v3 = v2;
    fprintf(__stderrp, "%s: Couldn't get raw LTH, return value: 0x%x\n");
  }

  else
  {
    uint64_t v4 = *(void **)v6;
    uint64_t v3 = sub_10000C208(*(const void **)v6, qword_1000251C8, a1);
    free(v4);
    if ((_DWORD)v3) {
      fprintf(__stderrp, "%s: LTH write to %s failed");
    }
  }

  return v3;
}

uint64_t sub_10000B3B4(char *a1, int a2)
{
  unint64_t v4 = qword_1000251C8;
  unsigned int v5 = (char *)malloc(qword_1000251C8);
  if (v5)
  {
    uint64_t v6 = v5;
    int v15 = -1431655766;
    if (a2)
    {
      if (!sub_10000C5E0())
      {
        uint64_t v12 = 3758097098LL;
        fprintf(__stderrp, "%s: Couldn't populate gain test LTH: %d\n");
        goto LABEL_18;
      }

      uint64_t v7 = 0LL;
      char v16 = v6;
      unint64_t v17 = &v6[4 * dword_1000251B8[0]];
      BOOL v18 = &v17[4 * dword_1000251BC];
      do
      {
        if (dword_1000251B8[v7])
        {
          unint64_t v8 = 0LL;
          uint64_t v9 = (&v16)[v7];
          unsigned int v10 = v7;
          do
          {
            *(_DWORD *)&v9[4 * v8] = dword_100019508[3 * v8 + 3 * ((_DWORD)v7 - 5 * (v10 / 5))];
            ++v8;
            ++v10;
          }

          while (v8 < dword_1000251B8[v7]);
        }

        ++v7;
      }

      while (v7 != 3);
      uint64_t v11 = sub_10000C208(v6, qword_1000251C8, a1);
      if ((_DWORD)v11)
      {
        uint64_t v12 = v11;
        fprintf(__stderrp, "%s: Couldn't write gain test LTH to %s\n");
LABEL_18:
        free(v6);
        return v12;
      }

      unint64_t v4 = qword_1000251C8;
    }

    uint64_t v13 = sub_10000BAE4(v6, v4, a1, &v15);
    if ((_DWORD)v13)
    {
      uint64_t v12 = v13;
      fprintf(__stderrp, "%s: Couldn't read LTH from %s\n");
    }

    else if (qword_1000251C8 == v15)
    {
      uint64_t v12 = IOConnectCallStructMethod(dword_100024928, 0x36u, v6, qword_1000251C8, 0LL, 0LL);
      if ((_DWORD)v12) {
        fprintf(__stderrp, "%s: Couldn't load raw LTH, return value: 0x%x\n", (const char *)qword_100024960, v12);
      }
    }

    else
    {
      fprintf(__stderrp, "%s: Read LTH size is %u, expected %lu\n", (const char *)qword_100024960, v15, qword_1000251C8);
      uint64_t v12 = 22LL;
    }

    goto LABEL_18;
  }

  fprintf(__stderrp, "%s: Couldn't allocate memory for LTH\n", (const char *)qword_100024960);
  return 12LL;
}

uint64_t sub_10000B650(char *a1)
{
  uint64_t v2 = malloc(0x300000uLL);
  if (!v2) {
    return 3758097085LL;
  }
  uint64_t v3 = v2;
  size_t outputStructCnt = 3145728LL;
  uint64_t v4 = IOConnectCallStructMethod(dword_100024928, 0x37u, 0LL, 0LL, v2, &outputStructCnt);
  if (!(_DWORD)v4)
  {
    else {
      uint64_t v4 = 0LL;
    }
  }

  free(v3);
  return v4;
}

uint64_t sub_10000B6F8(char *a1, int a2)
{
  uint64_t v4 = 3758097085LL;
  unsigned int v5 = malloc(0x300000uLL);
  if (v5)
  {
    uint64_t v6 = v5;
    int v8 = -1431655766;
    if (sub_10000BAE4(v5, 0x300000uLL, a1, &v8))
    {
      uint64_t v4 = 3758097098LL;
    }

    else if (v8 == 3145728)
    {
      if (a2) {
        ++v6[4096];
      }
      uint64_t v4 = IOConnectCallStructMethod(dword_100024928, 0x38u, v6, 0x300000uLL, 0LL, 0LL);
    }

    else
    {
      uint64_t v4 = 3758097090LL;
    }

    free(v6);
  }

  return v4;
}

BOOL sub_10000B7BC()
{
  kern_return_t v0;
  if (!dword_100024928) {
    sub_100016BE8();
  }
  __int128 v0 = IOConnectCallScalarMethod(dword_100024928, 0x42u, 0LL, 0, 0LL, 0LL);
  if (v0) {
    fprintf(__stderrp, "%s: purge system token failed: 0x%x", (const char *)qword_100024960, v0);
  }
  return v0 == 0;
}

BOOL sub_10000B838(unint64_t a1)
{
  if (!dword_100024928) {
    sub_100016BE8();
  }
  uint64_t input = string_to_handle(a1);
  return IOConnectCallScalarMethod(dword_100024928, 0x46u, &input, 1u, 0LL, 0LL) == 0;
}

uint64_t sub_10000B898(unsigned int a1, unsigned int a2)
{
  input[0] = a1;
  input[1] = a2;
  if (!dword_100024928) {
    sub_100016BE8();
  }
  return IOConnectCallScalarMethod(dword_100024928, 0x52u, input, 2u, 0LL, 0LL);
}

BOOL sub_10000B910(unsigned int a1, int a2, unsigned int a3)
{
  kern_return_t v3;
  kern_return_t v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  if (a2)
  {
    input[0] = a1;
    input[1] = a3;
    uint64_t v3 = IOConnectCallScalarMethod(dword_100024928, 0x5Cu, input, 2u, 0LL, 0LL);
  }

  else
  {
    uint64_t output = 0LL;
    input[0] = a1;
    uint32_t outputCnt = 1;
    unsigned int v5 = IOConnectCallScalarMethod(dword_100024928, 0x5Du, input, 1u, &output, &outputCnt);
    if (outputCnt != 1) {
      sub_100016BE8();
    }
    uint64_t v3 = v5;
    if (!v5) {
      printf("Slot %u provisional: %d, used: %d\n", a1, output & 1, (output >> 1) & 1);
    }
  }

  return v3 == 0;
}

BOOL sub_10000BA04(int a1)
{
  uint64_t input = a1;
  return IOConnectCallScalarMethod(dword_100024928, 5u, &input, 1u, 0LL, 0LL) == 0;
}

void sub_10000BA4C()
{
  if (dword_100025190)
  {
    IOObjectRelease(dword_100025190);
    dword_100025190 = 0;
  }

  _exit(-1);
}

void sub_10000BA74(int a1, io_iterator_t iterator)
{
  io_service_t v2 = IOIteratorNext(iterator);
  if (v2)
  {
    io_object_t v3 = v2;
    if (!IOServiceOpen(v2, mach_task_self_, 0, (io_connect_t *)&dword_100024928))
    {
      byte_100025179 = 1;
      IOObjectRelease(v3);
      CFRunLoopStop((CFRunLoopRef)qword_100025180);
    }
  }

uint64_t sub_10000BAE4(void *a1, unint64_t a2, char *a3, _DWORD *a4)
{
  if (!a1 || !a3 || !a4)
  {
    fprintf(__stderrp, "%s: invalid argument\n", a3);
    return 22LL;
  }

  v8.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v8.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v19.st_blksize = v8;
  *(timespec *)v19.st_qspare = v8;
  v19.st_birthtimespec = v8;
  *(timespec *)&v19.st_size = v8;
  v19.st_mtimespec = v8;
  v19.st_ctimespec = v8;
  *(timespec *)&v19.st_uid = v8;
  v19.st_atimespec = v8;
  *(timespec *)&v19.st_dev = v8;
  int v9 = open(a3, 0);
  if (v9 < 0)
  {
    uint64_t v12 = __stderrp;
    uint64_t v13 = (const char *)qword_100024960;
    unsigned int v14 = __error();
    int v15 = strerror(*v14);
    char v16 = __error();
    fprintf(v12, "%s: can't open '%s', errno: %s(%d)\n", v13, a3, v15, *v16);
    return 5LL;
  }

  int v10 = v9;
  if (fstat(v9, &v19) < 0)
  {
    fprintf(__stderrp, "%s: can't stat '%s'\n");
    return *__error();
  }

  if (v19.st_size < 0)
  {
    fprintf(__stderrp, "%s: unexpected file size (size %lld)", v19.st_size);
    return 22LL;
  }

  if (v19.st_size > a2)
  {
    fprintf(__stderrp, "%s: '%s' is too large for buffer", (const char *)qword_100024960, a3);
    return 12LL;
  }

  ssize_t v17 = read(v10, a1, v19.st_size);
  if (v17 == v19.st_size)
  {
    int v18 = v17;
    uint64_t result = 0LL;
    *a4 = v18;
    return result;
  }

  fprintf(__stderrp, "%s: can't read '%s'\n");
  return *__error();
}

BOOL sub_10000BCB8(uint64_t a1, uint64_t a2, const void *a3, size_t a4, uint32_t a5, unsigned int a6)
{
  kern_return_t v19;
  BOOL v20;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  char v32;
  _OWORD v33[28];
  unint64_t v34;
  __int128 input;
  __int128 v36;
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  uint64_t input = v6;
  v36 = v6;
  unint64_t v34 = 0xAAAAAAAAAAAAAAAALL;
  v33[26] = v6;
  v33[27] = v6;
  v33[24] = v6;
  v33[25] = v6;
  v33[22] = v6;
  v33[23] = v6;
  v33[20] = v6;
  v33[21] = v6;
  v33[18] = v6;
  v33[19] = v6;
  v33[16] = v6;
  v33[17] = v6;
  v33[14] = v6;
  v33[15] = v6;
  v33[12] = v6;
  v33[13] = v6;
  v33[10] = v6;
  v33[11] = v6;
  v33[8] = v6;
  v33[9] = v6;
  v33[6] = v6;
  v33[7] = v6;
  v33[4] = v6;
  v33[5] = v6;
  v33[2] = v6;
  v33[3] = v6;
  v33[0] = v6;
  v33[1] = v6;
  unsigned int v32 = -86;
  if (!a1) {
    sub_100016BE8();
  }
  size_t v11 = a2;
  uint64_t v12 = (void *)a1;
  Img4DecodeInit(a1, a2, (uint64_t)v33);
  if (v13)
  {
    int v22 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v22, 2861);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100017950();
    }
    return 0LL;
  }

  if (!sub_100003E74((uint64_t)v33, (BOOL *)&v32))
  {
    uint64_t v23 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v23, 2863);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000178C8();
    }
    return 0LL;
  }

  if (v32 != (a3 != 0LL))
  {
    uint64_t v24 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v24, 2864);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100017840();
    }
    return 0LL;
  }

  if (a3)
  {
    if (v11 >= 0x2000001)
    {
      uint64_t v25 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
      printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v25, 2878);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100017488();
      }
    }

    else
    {
      *(void *)&uint64_t input = v11 + 24;
      if (a4 > 0x40000)
      {
        int v26 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
        printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v26, 2880);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100017510();
        }
      }

      else
      {
        *((void *)&input + 1) = a4 + 24;
        *(void *)&v36 = 1916LL;
        size_t v14 = v11 + a4 + 24 + 1940;
        int v15 = malloc(v14);
        if (v15)
        {
          char v16 = v15;
          if (sub_10000426C((uint64_t)v12, v11, v33, v15))
          {
            memcpy(v16 + 6, v12, v11);
            ssize_t v17 = (_DWORD *)((char *)v16 + v11 + 24);
            if (sub_100004000((uint64_t)v33, (_DWORD *)((char *)v17 + a4 + 24)))
            {
              Img4DecodeInit((uint64_t)a3, a4, (uint64_t)v33);
              if (v18)
              {
                BOOL v30 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                printf( "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n",  0LL,  (const char *)&unk_10001A129,  v30,  2900);
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  sub_1000176A8();
                }
              }

              else
              {
                if (sub_10000426C((uint64_t)a3, a4, v33, v17))
                {
                  memcpy(v17 + 6, a3, a4);
                  size_t v11 = v14;
                  uint64_t v12 = v16;
                  goto LABEL_15;
                }

                uint64_t v31 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                printf( "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n",  0LL,  (const char *)&unk_10001A129,  v31,  2903);
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  sub_100017620();
                }
              }
            }

            else
            {
              unint64_t v29 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
              printf( "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n",  0LL,  (const char *)&unk_10001A129,  v29,  2898);
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_100017730();
              }
            }
          }

          else
          {
            int v28 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
            printf( "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n",  0LL,  (const char *)&unk_10001A129,  v28,  2891);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_1000177B8();
            }
          }

          uint64_t v20 = 0LL;
          uint64_t v12 = v16;
LABEL_18:
          free(v12);
          return v20;
        }

        unint64_t v27 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
        printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v27, 2887);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100017598();
        }
      }
    }

    return 0LL;
  }

  uint64_t input = v11;
  *(void *)&v36 = 0LL;
LABEL_15:
  *((void *)&v36 + 1) = a6;
  stat v19 = IOConnectCallMethod(dword_100024928, a5, (const uint64_t *)&input, 4u, v12, v11, 0LL, 0LL, 0LL, 0LL);
  uint64_t v20 = v19 == 0;
  if (v19) {
    fprintf(__stderrp, "%s: load fw returned 0x%x\n", (const char *)qword_100024960, v19);
  }
  if (a3) {
    goto LABEL_18;
  }
  return v20;
}

uint64_t sub_10000C208(const void *a1, size_t a2, char *a3)
{
  if (a1 && a3)
  {
    int v5 = open(a3, 1538, 288LL);
    if (v5 < 0)
    {
      fprintf(__stderrp, "%s: can't open '%s' for writing\n");
    }

    else
    {
      int v6 = v5;
      ssize_t v7 = write(v5, a1, a2);
      if ((v7 & 0x8000000000000000LL) == 0 && v7 == a2)
      {
        close(v6);
        return 0LL;
      }

      fprintf(__stderrp, "%s: can't write '%s'\n");
    }

    return *__error();
  }

  else
  {
    fprintf(__stderrp, "%s: invalid argument\n", (const char *)qword_100024960);
    return 22LL;
  }

uint64_t sub_10000C304()
{
  if (!dword_100024928) {
    sub_100016BE8();
  }
  uint64_t result = IOConnectCallMethod(dword_100024928, 0xBu, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if ((_DWORD)result) {
    return fprintf(__stderrp, "%s: L4 panic notification returned 0x%x\n", (const char *)qword_100024960, result);
  }
  return result;
}

uint64_t sub_10000C37C()
{
  if (!dword_100024928) {
    sub_100016BE8();
  }
  uint64_t result = IOConnectCallMethod(dword_100024928, 0xCu, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if ((_DWORD)result) {
    return fprintf(__stderrp, "%s: SEP/OS panic notification returned 0x%x\n", (const char *)qword_100024960, result);
  }
  return result;
}

uint64_t sub_10000C3F4()
{
  if (!dword_100024928) {
    sub_100016BE8();
  }
  uint64_t result = IOConnectCallMethod(dword_100024928, 0x45u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if ((_DWORD)result) {
    return fprintf(__stderrp, "%s: SEP/OS panic request returned 0x%x\n", (const char *)qword_100024960, result);
  }
  return result;
}

uint64_t sub_10000C46C(const char *a1)
{
  io_registry_entry_t v2 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/chosen");
  if (!v2)
  {
    fprintf(__stderrp, "%s: Warning: can't find /chosen\n", (const char *)qword_100024960);
    return 1LL;
  }

  io_registry_entry_t v3 = v2;
  uint64_t v4 = CFStringCreateWithCString(0LL, a1, 0x8000100u);
  int v5 = (const __CFData *)IORegistryEntrySearchCFProperty(v3, "IODeviceTree", v4, kCFAllocatorDefault, 0);
  if (!v5)
  {
    BOOL v8 = 1LL;
    goto LABEL_12;
  }

  int v6 = v5;
  CFTypeID v7 = CFGetTypeID(v5);
  if (v7 != CFDataGetTypeID())
  {
    fprintf(__stderrp, "%s: Warning: Incorrect %s property value type\n");
LABEL_10:
    BOOL v8 = 1LL;
    goto LABEL_11;
  }

  if (CFDataGetLength(v6) != 4)
  {
    fprintf(__stderrp, "%s: Warning: Incorrect value size for %s property\n");
    goto LABEL_10;
  }

  BOOL v8 = *(_DWORD *)CFDataGetBytePtr(v6) != 0;
LABEL_11:
  CFRelease(v6);
LABEL_12:
  IOObjectRelease(v3);
  if (v4) {
    CFRelease(v4);
  }
  return v8;
}

uint64_t sub_10000C5E0()
{
  kern_return_t v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  size_t outputStructCnt;
  if ((byte_1000251A8 & 1) != 0) {
    return 1LL;
  }
  size_t outputStructCnt = 10LL;
  int v1 = IOConnectCallStructMethod(dword_100024928, 0x39u, 0LL, 0LL, &dword_1000251AC, &outputStructCnt);
  BOOL v0 = v1 == 0;
  if (v1)
  {
    fprintf(__stderrp, "%s: HiloGetParams failed: %d\n", (const char *)qword_100024960, v1);
  }

  else
  {
    io_registry_entry_t v2 = 0LL;
    io_registry_entry_t v3 = 0;
    uint64_t v4 = (dword_1000251AC + 1) >> 1;
    if (!byte_1000251B4) {
      uint64_t v4 = dword_1000251AC;
    }
    dword_1000251BC = unk_1000251B0 * dword_1000251AC;
    unk_1000251C0 = v4 * unk_1000251B0;
    dword_1000251B8[0] = v4 * unk_1000251B0;
    do
      v3 += dword_1000251B8[v2++];
    while (v2 != 3);
    qword_1000251C8 = 4LL * v3;
    qword_1000251A0 = 4 * v3 + 32;
    byte_1000251A8 = 1;
  }

  return v0;
}

void sub_10000C6F8()
{
}

void sub_10000C724(id a1, _xpc_activity_s *a2)
{
  kern_return_t v2;
  _BYTE v3[256];
  if (xpc_activity_get_state(a2))
  {
    io_registry_entry_t v2 = IOConnectCallScalarMethod(dword_100024928, 0x35u, 0LL, 0, 0LL, 0LL);
    if (v2) {
      sub_1000179D8(v3, v2);
    }
    xpc_transaction_exit_clean();
  }

uint64_t sub_10000C7D4()
{
  mach_port_t v0 = dword_100024928;
  if (!dword_100024928) {
    sub_100016BE8();
  }
  size_t outputStructCnt = 2277LL;
  int v1 = (unsigned __int8 *)malloc(0x8E5uLL);
  if (v1)
  {
    io_registry_entry_t v2 = v1;
    if (IOConnectCallStructMethod(v0, 0x47u, 0LL, 0LL, v1, &outputStructCnt))
    {
      fprintf(__stderrp, "%s: get endpoint info returned 0x%x\n");
    }

    else
    {
      size_t v4 = outputStructCnt / 9;
      if (outputStructCnt == 9 * (outputStructCnt / 9))
      {
        if (outputStructCnt >= 9)
        {
          int v6 = v2 + 4;
          do
          {
            printf( "Endpoint %d name '%c%c%c%c' ool_in_pages [%u,%u] ool_out_pages [%u,%u]\n",  *v6,  (char)*(v6 - 1),  (char)*(v6 - 2),  (char)*(v6 - 3),  (char)*(v6 - 4),  v6[1],  v6[2],  v6[3],  v6[4]);
            v6 += 9;
            --v4;
          }

          while (v4);
        }

        uint64_t v3 = 1LL;
        goto LABEL_9;
      }

      fprintf(__stderrp, "%s: unexpected result size %lu\n");
    }

    uint64_t v3 = 0LL;
LABEL_9:
    free(v2);
    return v3;
  }

  return 0LL;
}

  ;
}

uint64_t sub_10000C948()
{
  return _os_assert_log(0LL);
}

  ;
}

uint64_t sub_10000C95C(void *a1, void *a2, unint64_t a3, int a4)
{
  uint64_t result = 0LL;
  if (!a1 || !a2) {
    return result;
  }
  int v9 = 0LL;
  uint64_t v10 = -256LL;
  do
  {
    if (v10 + 256 > a3)
    {
      fprintf(__stderrp, "input file too large in fd_to_buf (max size %zu)\n");
      goto LABEL_12;
    }

    size_t v11 = (char *)realloc(v9, v10 + 512);
    if (!v11)
    {
      fprintf(__stderrp, "realloc failed in fd_to_buf for size %zu\n");
LABEL_12:
      if (!v9) {
        return 0LL;
      }
      goto LABEL_16;
    }

    uint64_t v12 = v11;
    ssize_t v13 = read(a4, &v11[v10 + 256], 0x100uLL);
    if (v13 == -1)
    {
      fwrite("read failed in fd_to_buf\n", 0x19uLL, 1uLL, __stderrp);
LABEL_15:
      int v9 = v12;
LABEL_16:
      free(v9);
      return 0LL;
    }

    v10 += 256LL;
    int v9 = v12;
  }

  while (v13 > 255);
  if (v13 + v10 > a3)
  {
    fprintf(__stderrp, "input file too large in fd_to_buf (max size %zu)\n", a3);
    goto LABEL_15;
  }

  *a2 = v13 + v10;
  *a1 = v12;
  bzero(&v12[v13 + v10], 256 - v13);
  return 1LL;
}

uint64_t sub_10000CAC8(BOOL *a1)
{
  if (a1)
  {
    io_registry_entry_t v2 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/arm-io/sep/iop-sep-nub/xART");
    io_registry_entry_t v3 = v2;
    if (v2) {
      IOObjectRelease(v2);
    }
    uint64_t result = 0LL;
    *a1 = v3 != 0;
  }

  else
  {
    int v5 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v5, 158);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100017A20();
    }
    return 22LL;
  }

  return result;
}

uint64_t sub_10000CB78(BOOL *a1)
{
  if (a1)
  {
    io_registry_entry_t v2 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/arm-io/sep/iop-sep-nub/Sandcat");
    io_registry_entry_t v3 = v2;
    if (v2) {
      IOObjectRelease(v2);
    }
    uint64_t result = 0LL;
    *a1 = v3 != 0;
  }

  else
  {
    int v5 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v5, 186);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100017AA8();
    }
    return 22LL;
  }

  return result;
}

void sub_10000CC28()
{
  byte_1000251D0 = 1;
}

const char *sub_10000CC38()
{
  if (byte_1000251D0) {
    return "/mnt7";
  }
  else {
    return "/private/xarts";
  }
}

uint64_t sub_10000CC5C(const char *a1, unint64_t a2)
{
  v25[0] = 0x300000004LL;
  v25[1] = 0LL;
  unint64_t v26 = a2;
  uint64_t v27 = 0LL;
  if (a1)
  {
    unint64_t v2 = a2;
    int v4 = open(a1, 2562, 384LL);
    if ((v4 & 0x80000000) == 0)
    {
      int v5 = v4;
      *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&v28.f_ffree = v6;
      *(_OWORD *)&v28.f_flag = v6;
      *(_OWORD *)&v28.f_bsize = v6;
      *(_OWORD *)&v28.f_blocks = v6;
      uint64_t v7 = statvfs(a1, &v28);
      if ((_DWORD)v7)
      {
        uint64_t v12 = v7;
        uint64_t v16 = (int)v7;
        ssize_t v17 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
        printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v16, (const char *)&unk_10001A129, v17, 291);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100017EA0();
        }
        int v18 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
        printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v16, (const char *)&unk_10001A129, v18, 322);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100017E08();
        }
      }

      else
      {
        vm_size_t f_frsize = vm_page_size;
        if (v28.f_frsize > vm_page_size) {
          vm_size_t f_frsize = v28.f_frsize;
        }
        if (v2 % f_frsize)
        {
          v2 += f_frsize - v2 % f_frsize;
          unint64_t v26 = v2;
        }

        uint64_t v9 = fcntl(v5, 42, v25);
        if ((_DWORD)v9)
        {
          uint64_t v12 = v9;
          uint64_t v19 = (int)v9;
          uint64_t v20 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
          printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v19, (const char *)&unk_10001A129, v20, 329);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100017D70();
          }
        }

        else
        {
          uint64_t v10 = ftruncate(v5, v2);
          if (!(_DWORD)v10)
          {
            int v11 = close(v5);
            if (!v11) {
              return 0LL;
            }
            uint64_t v23 = v11;
            uint64_t v24 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
            printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v23, (const char *)&unk_10001A129, v24, 336);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_100017C40();
            }
            return *__error();
          }

          uint64_t v12 = v10;
          uint64_t v21 = (int)v10;
          int v22 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
          printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v21, (const char *)&unk_10001A129, v22, 332);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100017CD8();
          }
        }
      }

      close(v5);
      return v12;
    }

    int v15 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v15, 318);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100017BB8();
    }
    return *__error();
  }

  size_t v14 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
  printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v14, 315);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100017B30();
  }
  return 22LL;
}

uint64_t sub_10000CF8C(char *a1, size_t a2, uint64_t a3, int a4)
{
  if (!a1) {
    sub_100016708();
  }
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v7;
  *(_OWORD *)&out[16] = v7;
  memset(uu, 0, sizeof(uu));
  v14.tv_sec = 0LL;
  v14.tv_nsec = 0LL;
  if (gethostuuid(uu, &v14) < 0)
  {
    uint64_t v9 = __stderrp;
    uint64_t v10 = __error();
    int v11 = strerror(*v10);
    fprintf(v9, "ERR: could not get the machine's unique identifier, reason: %s\n", v11);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100017FC0();
    }
    uint64_t v12 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0LL, (const char *)&unk_10001A129, v12, 355);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100017F38();
    }
    return 14LL;
  }

  else
  {
    uuid_unparse_upper(uu, out);
    if (a4) {
      int v8 = snprintf(a1, a2, "%s/%s.gl");
    }
    else {
      int v8 = snprintf(a1, a2, "%s.gl");
    }
    if (v8 < 0)
    {
      return *__error();
    }

    else if (v8 >= (int)a2)
    {
      return 28LL;
    }

    else
    {
      return 0LL;
    }
  }

uint64_t sub_10000D140(char *a1)
{
  __argv[0] = "/bin/bash";
  __argv[1] = "-c";
  __argv[2] = a1;
  __argv[3] = 0LL;
  pid_t v2 = -1431655766;
  int v3 = -1;
  uint64_t result = posix_spawnp(&v2, "/bin/bash", 0LL, 0LL, __argv, 0LL);
  if (!(_DWORD)result)
  {
    while (waitpid(v2, &v3, 0) == -1)
      ;
    return v3;
  }

  return result;
}

uint64_t sub_10000D1E0@<X0>(void *a1@<X8>)
{
  values = @"com.apple.driver.AppleSEPManager";
  CFArrayRef v2 = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 1LL, &kCFTypeArrayCallBacks);
  int v3 = (const __CFDictionary *)OSKextCopyLoadedKextInfo(v2, 0LL);
  Value = (const __CFDictionary *)CFDictionaryGetValue(v3, @"com.apple.driver.AppleSEPManager");
  CFRelease(v2);
  int v5 = (const __CFData *)CFDictionaryGetValue(Value, @"OSBundleUUID");
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v6;
  *(_OWORD *)&out[16] = v6;
  BytePtr = CFDataGetBytePtr(v5);
  uuid_unparse(BytePtr, out);
  CFRelease(v3);
  unint64_t v46 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v45[7] = v8;
  v45[8] = v8;
  v45[5] = v8;
  v45[6] = v8;
  v45[3] = v8;
  v45[4] = v8;
  v45[1] = v8;
  v45[2] = v8;
  __int128 v44 = v8;
  v45[0] = v8;
  __int128 v42 = v8;
  __int128 v43 = v8;
  v41[2] = v8;
  v41[3] = v8;
  v41[0] = v8;
  v41[1] = v8;
  __int128 v40 = v8;
  sub_10000D660((uint64_t)&v40);
  uint64_t v9 = sub_10000E97C(v41, (uint64_t)"/usr/local/bin/kpgo", 19LL);
  uint64_t v10 = sub_10000E97C(v9, (uint64_t)" ", 1LL);
  size_t v11 = strlen(out);
  uint64_t v12 = sub_10000E97C(v10, (uint64_t)out, v11);
  ssize_t v13 = sub_10000E97C(v12, (uint64_t)" > ", 3LL);
  sub_10000E97C(v13, (uint64_t)"/tmp/sep_manager_coverage.raw", 29LL);
  std::stringbuf::str((std::stringbuf::string_type *)&v33, (const std::stringbuf *)((char *)v41 + 8));
  if ((SBYTE7(v34[0]) & 0x80u) == 0) {
    timespec v14 = (char *)&v33;
  }
  else {
    timespec v14 = (char *)v33;
  }
  uint64_t v15 = sub_10000D140(v14);
  if (SBYTE7(v34[0]) < 0) {
    operator delete((void *)v33);
  }
  if ((_DWORD)v15)
  {
    uint64_t v16 = sub_10000E97C( &std::cout,  (uint64_t)"kpgo failed.  Was code coverage enabled at build time? Return code was ",  71LL);
    ssize_t v17 = (void *)std::ostream::operator<<(v16, v15);
    std::ios_base::getloc((const std::ios_base *)((char *)v17 + *(void *)(*v17 - 24LL)));
    int v18 = std::locale::use_facet((const std::locale *)&v33, &std::ctype<char>::id);
    uint64_t v19 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v18->__vftable[2].~facet_0)(v18, 10LL);
    std::locale::~locale((std::locale *)&v33);
    std::ostream::put(v17, v19);
    std::ostream::flush(v17);
    sub_10000ECD8(a1, (char *)&unk_10001A129);
  }

  else
  {
    unint64_t v39 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v23 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v38[7] = v23;
    v38[8] = v23;
    v38[5] = v23;
    v38[6] = v23;
    v38[3] = v23;
    v38[4] = v23;
    v38[1] = v23;
    v38[2] = v23;
    __int128 v37 = v23;
    v38[0] = v23;
    *(_OWORD *)__p = v23;
    __int128 v36 = v23;
    v34[2] = v23;
    v34[3] = v23;
    v34[0] = v23;
    v34[1] = v23;
    __int128 v33 = v23;
    sub_10000D660((uint64_t)&v33);
    uint64_t v24 = sub_10000E97C(v34, (uint64_t)"/usr/bin/llvm-profdata", 22LL);
    uint64_t v25 = sub_10000E97C(v24, (uint64_t)" merge -o ", 10LL);
    unint64_t v26 = sub_10000E97C(v25, (uint64_t)"/tmp/sep_manager_coverage.profdata", 34LL);
    uint64_t v27 = sub_10000E97C(v26, (uint64_t)" ", 1LL);
    sub_10000E97C(v27, (uint64_t)"/tmp/sep_manager_coverage.raw", 29LL);
    std::stringbuf::str(&v32, (const std::stringbuf *)((char *)v34 + 8));
    if ((v32.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      statvfs v28 = &v32;
    }
    else {
      statvfs v28 = (std::stringbuf::string_type *)v32.__r_.__value_.__r.__words[0];
    }
    int v29 = sub_10000D140((char *)v28);
    if (v29) {
      BOOL v30 = (char *)&unk_10001A129;
    }
    else {
      BOOL v30 = "/tmp/sep_manager_coverage.profdata";
    }
    sub_10000ECD8(a1, v30);
    *(void *)((char *)&v34[-1]
    *(void *)&v34[0] = v22;
    if (SHIBYTE(v36) < 0) {
      operator delete(__p[1]);
    }
    std::streambuf::~streambuf((char *)v34 + 8);
    std::ios::~ios(v38);
  }

  *(void *)&__int128 v40 = v20;
  *(void *)((char *)&v41[-1] + *(void *)(v20 - 24)) = v21;
  *(void *)&v41[0] = v22;
  if (SHIBYTE(v43) < 0) {
    operator delete(*((void **)&v42 + 1));
  }
  std::streambuf::~streambuf((char *)v41 + 8);
  return std::ios::~ios(v45);
}

void sub_10000D5E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, std::locale a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

uint64_t sub_10000D660(uint64_t a1)
{
  uint64_t v2 = a1 + 16;
  uint64_t v3 = a1 + 24;
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v5;
  *(void *)(a1 + 8) = 0LL;
  __int128 v6 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24LL));
  std::ios_base::init(v6, (void *)(a1 + 24));
  v6[1].__vftable = 0LL;
  v6[1].__fmtflags_ = -1;
  *(void *)(a1 + 16) = v7;
  *(void *)(v2 + *(void *)(v7 - 24)) = v8;
  *(void *)a1 = v9;
  std::streambuf::basic_streambuf(v3);
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 1memset(outputStruct, 170, 20) = 24;
  return a1;
}

void sub_10000D764(_Unwind_Exception *a1)
{
}

uint64_t sub_10000D78C(uint64_t a1)
{
  uint64_t v4 = a1 + 24;
  *(void *)(a1 + 16) = v3;
  std::streambuf::~streambuf(v4);
  std::ios::~ios(a1 + 128);
  return a1;
}

std::string *sub_10000D814@<X0>(std::string *__str@<X0>, std::string *a2@<X8>)
{
  if ((char)__str->__r_.__value_.__s.__size_ < 0)
  {
    uint64_t v5 = (std::string *)__str->__r_.__value_.__r.__words[0];
    std::string::size_type size = __str->__r_.__value_.__l.__size_;
  }

  else
  {
    std::string::size_type size = __str->__r_.__value_.__s.__size_;
    uint64_t v5 = __str;
  }

  p_std::string::size_type size = (std::string::__short::$654DBF3D633A6121C0B197AC38B89F76 *)&v5[-1].__r_.__value_.__s.__size_;
  while (size)
  {
    int v7 = p_size[size--].__size_;
    if (v7 == 47)
    {
      std::string::size_type v8 = size + 1;
      return std::string::basic_string(a2, __str, v8, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v10);
    }
  }

  std::string::size_type v8 = 0LL;
  return std::string::basic_string(a2, __str, v8, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v10);
}

void sub_10000D87C(uint64_t a1, const char *a2)
{
  uint64_t v4 = embeddedtest_results_create(1);
  uint64_t v5 = embeddedtest_test_case_result_create(1, "AppleSEPManager Code Coverage");
  __int128 v6 = v5;
  if (__b[17])
  {
    uint64_t v49 = (uint64_t)v5;
    char v48 = 0;
LABEL_3:
    while (1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)__b + (unint64_t)*(__b[0] - 3)));
      int v7 = std::locale::use_facet(v55, &std::ctype<char>::id);
      unsigned __int8 v8 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v7->__vftable[2].~facet_0)(v7, 10LL);
      std::locale::~locale(v55);
      uint64_t v9 = sub_10000ED88(__b, &v62, v8);
      if ((*((_BYTE *)v9 + *(void *)(*v9 - 24LL) + 32) & 5) != 0) {
        break;
      }
      uint64_t size = v62.__r_.__value_.__s.__size_;
      if ((v62.__r_.__value_.__s.__size_ & 0x80u) == 0)
      {
        size_t v11 = &v62;
      }

      else
      {
        uint64_t size = v62.__r_.__value_.__l.__size_;
        size_t v11 = (std::string *)v62.__r_.__value_.__r.__words[0];
      }

      if (size >= 23)
      {
        uint64_t v12 = (char *)v11 + size;
        ssize_t v13 = v11;
        while (1)
        {
          timespec v14 = (char *)memchr(v13, 83, size - 22);
          if (!v14) {
            break;
          }
          if (*(void *)v14 == 0x2F73656372756F53LL
            && *((void *)v14 + 1) == 0x504553656C707041LL
            && *(void *)(v14 + 15) == 0x726567616E614D50LL)
          {
            if (v14 != v12 && v14 - (char *)v11 != -1)
            {
              unint64_t v61 = 0xAAAAAAAAAAAAAAAALL;
              *(void *)&__int128 v17 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v60[7] = v17;
              v60[8] = v17;
              v60[5] = v17;
              v60[6] = v17;
              v60[3] = v17;
              v60[4] = v17;
              v60[1] = v17;
              v60[2] = v17;
              __int128 v59 = v17;
              v60[0] = v17;
              __int128 v57 = v17;
              __int128 v58 = v17;
              v56[2] = v17;
              v56[3] = v17;
              v56[0] = v17;
              v56[1] = v17;
              *(_OWORD *)&v55[0].__locale_ = v17;
              sub_10000E1E4((void (__cdecl ***)(std::basic_stringstream<char> *__hidden))v55, &v62, 24);
              memset(&__p, 0, sizeof(__p));
              sub_10000E304((uint64_t *)v55, &__p);
              else {
                std::string __str = __p;
              }
              sub_10000D814(&__str, &v53);
              std::string __p = v53;
              v53.__r_.__value_.__s.__size_ = 0;
              v53.__r_.__value_.__s.__data_[0] = 0;
              double v51 = 0.0;
              std::istream::operator>>(v55, &v51);
              int v50 = 0;
              std::istream::operator>>(v55, &v50);
              if (v51 == 0.0)
              {
                int v18 = sub_10000E97C(&std::cout, (uint64_t)"Skipping ", 9LL);
                if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
                  p_p = &__p;
                }
                else {
                  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
                }
                if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
                  uint64_t v20 = __p.__r_.__value_.__s.__size_;
                }
                else {
                  uint64_t v20 = __p.__r_.__value_.__l.__size_;
                }
                uint64_t v21 = sub_10000E97C(v18, (uint64_t)p_p, v20);
                uint64_t v22 = sub_10000E97C(v21, (uint64_t)" becuase it doesnt have any regions to cover", 44LL);
                std::ios_base::getloc((const std::ios_base *)((char *)v22 + *(void *)(*v22 - 24LL)));
                __int128 v23 = std::locale::use_facet((const std::locale *)&v53, &std::ctype<char>::id);
                uint64_t v24 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v23->__vftable[2].~facet_0)( v23,  10LL);
                std::locale::~locale((std::locale *)&v53);
                std::ostream::put(v22, v24);
                std::ostream::flush(v22);
              }

              else
              {
                double v25 = 100.0 - (double)(100 * v50) / v51;
                if (v25 == 0.0)
                {
                  unint64_t v26 = sub_10000E97C(&std::cout, (uint64_t)"Skipping ", 9LL);
                  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
                    uint64_t v27 = &__p;
                  }
                  else {
                    uint64_t v27 = (std::string *)__p.__r_.__value_.__r.__words[0];
                  }
                  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
                    uint64_t v28 = __p.__r_.__value_.__s.__size_;
                  }
                  else {
                    uint64_t v28 = __p.__r_.__value_.__l.__size_;
                  }
                  int v29 = sub_10000E97C(v26, (uint64_t)v27, v28);
                  BOOL v30 = sub_10000E97C(v29, (uint64_t)" because coverage was 0%", 24LL);
                  std::ios_base::getloc((const std::ios_base *)((char *)v30 + *(void *)(*v30 - 24LL)));
                  uint64_t v31 = std::locale::use_facet((const std::locale *)&v53, &std::ctype<char>::id);
                  uint64_t v32 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v31->__vftable[2].~facet_0)( v31,  10LL);
                  std::locale::~locale((std::locale *)&v53);
                  std::ostream::put(v30, v32);
                  std::ostream::flush(v30);
                }

                else
                {
                  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
                    __int128 v33 = &__p;
                  }
                  else {
                    __int128 v33 = (std::string *)__p.__r_.__value_.__r.__words[0];
                  }
                  embeddedtest_test_case_result_add_metric(v49, (const char *)v33, v25);
                  char v48 = 1;
                }
              }

              v55[0].__locale_ = v47;
              *(std::locale::__imp **)((char *)&v55[0].__locale_ + *((void *)v47 - 3)) = v46;
              *(void *)&v56[0] = v45;
              if (SHIBYTE(v58) < 0) {
                operator delete(*((void **)&v57 + 1));
              }
              std::streambuf::~streambuf((char *)v56 + 8);
              std::ios::~ios(v60);
            }

            goto LABEL_3;
          }

          ssize_t v13 = (std::string *)(v14 + 1);
          uint64_t size = v12 - (char *)v13;
        }
      }
    }

    __int128 v6 = (void *)v49;
    if (!std::filebuf::close(&__b[2])) {
      std::ios_base::clear( (std::ios_base *)((char *)__b + (unint64_t)*(__b[0] - 3)),  *(_DWORD *)((char *)&__b[4] + (unint64_t)*(__b[0] - 3)) | 4);
    }
    if ((v48 & 1) != 0) {
      embeddedtest_test_case_result_pass(v49);
    }
    else {
      embeddedtest_test_case_result_fail(v49, "Did not see a valid file");
    }
  }

  else
  {
    embeddedtest_test_case_result_fail((uint64_t)v5, "Unable to open %s", (const char *)a1);
  }

  if (embeddedtest_test_case_result_did_pass((uint64_t)v6))
  {
    unint64_t v34 = sub_10000E97C(&std::cout, (uint64_t)"Report parsing was successful.  Results will be written to ", 59LL);
    size_t v35 = strlen(a2);
    __int128 v36 = sub_10000E97C(v34, (uint64_t)a2, v35);
  }

  else
  {
    unint64_t v39 = sub_10000E97C(&std::cout, (uint64_t)"Report parsing failed. Check ", 29LL);
    size_t v40 = strlen(a2);
    v41 = sub_10000E97C(v39, (uint64_t)a2, v40);
    __int128 v36 = sub_10000E97C(v41, (uint64_t)" for more detail", 16LL);
  }

  std::ios_base::getloc((const std::ios_base *)((char *)v36 + *(void *)(*v36 - 24LL)));
  __int128 v37 = std::locale::use_facet(v55, &std::ctype<char>::id);
  uint64_t v38 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v37->__vftable[2].~facet_0)(v37, 10LL);
  std::locale::~locale(v55);
  std::ostream::put(v36, v38);
  std::ostream::flush(v36);
  embeddedtest_results_add_test_case((uint64_t)v4, (uint64_t)v6);
  embeddedtest_test_case_result_free(v6);
  if (embeddedtest_results_save_to_file((uint64_t)v4, a2))
  {
    __int128 v42 = sub_10000E97C(&std::cout, (uint64_t)"Failed to write out the JSON file", 33LL);
    std::ios_base::getloc((const std::ios_base *)((char *)v42 + *(void *)(*v42 - 24LL)));
    __int128 v43 = std::locale::use_facet(v55, &std::ctype<char>::id);
    uint64_t v44 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v43->__vftable[2].~facet_0)(v43, 10LL);
    std::locale::~locale(v55);
    std::ostream::put(v42, v44);
    std::ostream::flush(v42);
  }

  embeddedtest_results_free(v4);
  std::filebuf::~filebuf(&__b[2]);
  std::ios::~ios(&__b[53]);
}

void sub_10000E01C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, void *a23, uint64_t a24, uint64_t a25, std::locale a26, uint64_t a27, uint64_t a28, void *__p, uint64_t a30, int a31, __int16 a32, char a33, char a34, uint64_t a35, std::locale a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if (a34 < 0) {
    operator delete(__p);
  }
  sub_10000D78C((uint64_t)&a36);
  sub_10000E538(&a73);
  if (a72 < 0) {
    operator delete(*(void **)(v73 + 288));
  }
  _Unwind_Resume(a1);
}

void (__cdecl ***sub_10000E0CC( void (__cdecl ***a1)(std::ifstream *__hidden this), uint64_t *a2, int a3))(std::ifstream *__hidden this)
{
  __int128 v6 = a1 + 2;
  *a1 = v7;
  *(void *)((char *)*(v7 - 3) + (void)a1) = v8;
  a1[1] = 0LL;
  uint64_t v9 = (std::ios_base *)((char *)*(*a1 - 3) + (void)a1);
  std::ios_base::init(v9, a1 + 2);
  v9[1].__vftable = 0LL;
  v9[1].__fmtflags_ = -1;
  std::filebuf::basic_filebuf(v6);
  else {
    char v10 = (uint64_t *)*a2;
  }
  if (!std::filebuf::open(v6, v10, a3 | 8u)) {
    std::ios_base::clear( (std::ios_base *)((char *)*(*a1 - 3) + (void)a1),  *(_DWORD *)((char *)*(*a1 - 3) + (void)a1 + 32) | 4);
  }
  return a1;
}

void sub_10000E1AC(_Unwind_Exception *a1)
{
}

void (__cdecl ***sub_10000E1E4( void (__cdecl ***a1)(std::basic_stringstream<char> *__hidden this), const std::string *a2, int a3))(std::basic_stringstream<char> *__hidden this)
{
  uint64_t v5 = a1 + 2;
  uint64_t v6 = (uint64_t)(a1 + 3);
  *a1 = v7;
  *(void *)((char *)*(v7 - 3) + (void)a1) = v8;
  a1[1] = 0LL;
  uint64_t v9 = (std::ios_base *)((char *)*(*a1 - 3) + (void)a1);
  std::ios_base::init(v9, a1 + 3);
  v9[1].__vftable = 0LL;
  v9[1].__fmtflags_ = -1;
  a1[2] = v10;
  *(void *)((char *)*(v10 - 3) + (void)v5) = v11;
  *a1 = v12;
  sub_10000EF14(v6, a2, a3);
  return a1;
}

void sub_10000E2DC(_Unwind_Exception *a1)
{
}

uint64_t *sub_10000E304(uint64_t *a1, std::string *a2)
{
  char v20 = -86;
  std::istream::sentry::sentry(&v20, a1, 0LL);
  if (!v20) {
    return a1;
  }
  if ((char)a2->__r_.__value_.__s.__size_ < 0)
  {
    *a2->__r_.__value_.__l.__data_ = 0;
    a2->__r_.__value_.__l.__size_ = 0LL;
  }

  else
  {
    a2->__r_.__value_.__s.__data_[0] = 0;
    a2->__r_.__value_.__s.__size_ = 0;
  }

  uint64_t v4 = *(void *)(*a1 - 24);
  uint64_t v5 = *(uint64_t *)((char *)a1 + v4 + 24);
  if (v5 <= 1) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = *(uint64_t *)((char *)a1 + v4 + 24);
  }
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + v4));
  int v7 = std::locale::use_facet(&v19, &std::ctype<char>::id);
  std::locale::~locale(&v19);
  uint64_t v8 = 0LL;
  uint64_t v9 = a1 + 5;
  if (v5 >= 1) {
    uint64_t v10 = v6;
  }
  else {
    uint64_t v10 = 0x7FFFFFFFFFFFFFF7LL;
  }
  while (1)
  {
    uint64_t v11 = *(void **)((char *)v9 + *(void *)(*a1 - 24));
    uint64_t v12 = (_BYTE *)v11[3];
    if (v12 == (_BYTE *)v11[4]) {
      break;
    }
    LOBYTE(v13) = *v12;
LABEL_14:
    if ((v13 & 0x80) == 0 && (*((_DWORD *)&v7[1].~facet + v13) & 0x4000) != 0)
    {
      int v16 = 0;
      goto LABEL_23;
    }

    std::string::push_back(a2, v13);
    timespec v14 = *(void **)((char *)v9 + *(void *)(*a1 - 24));
    uint64_t v15 = v14[3];
    if (v15 == v14[4]) {
      (*(void (**)(void *))(*v14 + 80LL))(v14);
    }
    else {
      v14[3] = v15 + 1;
    }
    if (v10 == ++v8)
    {
      int v16 = 0;
      uint64_t v17 = *a1;
      *(uint64_t *)((char *)a1 + *(void *)(*a1 - 24) + 24) = 0LL;
      goto LABEL_25;
    }
  }

  int v13 = (*(uint64_t (**)(void *))(*v11 + 72LL))(v11);
  if (v13 != -1) {
    goto LABEL_14;
  }
  int v16 = 2;
LABEL_23:
  uint64_t v17 = *a1;
  *(uint64_t *)((char *)a1 + *(void *)(*a1 - 24) + 24) = 0LL;
  if (!v8) {
    v16 |= 4u;
  }
LABEL_25:
  std::ios_base::clear( (std::ios_base *)((char *)a1 + *(void *)(v17 - 24)),  *(_DWORD *)((char *)a1 + *(void *)(v17 - 24) + 32) | v16);
  return a1;
}

void sub_10000E4C0( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  uint64_t v11 = *v9;
  *(_DWORD *)((char *)v9 + *(void *)(*v9 - 24LL) + 32) |= 1u;
  if ((*((_BYTE *)v9 + *(void *)(v11 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x10000E48CLL);
  }

  __cxa_rethrow();
}

void sub_10000E524(_Unwind_Exception *a1)
{
}

void *sub_10000E538(void *a1)
{
  return a1;
}

void sub_10000E590(const char *a1)
{
  unint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v27[7] = v2;
  v27[8] = v2;
  v27[5] = v2;
  v27[6] = v2;
  v27[3] = v2;
  v27[4] = v2;
  v27[1] = v2;
  v27[2] = v2;
  __int128 v26 = v2;
  v27[0] = v2;
  *(_OWORD *)uint64_t v24 = v2;
  __int128 v25 = v2;
  v23[2] = v2;
  v23[3] = v2;
  v23[0] = v2;
  v23[1] = v2;
  __int128 v22 = v2;
  sub_10000D660((uint64_t)&v22);
  uint64_t v3 = sub_10000E97C(v23, (uint64_t)"/usr/bin/llvm-cov", 17LL);
  uint64_t v4 = sub_10000E97C(v3, (uint64_t)" report ", 8LL);
  uint64_t v5 = sub_10000E97C(v4, (uint64_t)"/System/Library/Extensions/AppleSEPManager.kext/AppleSEPManager", 63LL);
  uint64_t v6 = sub_10000E97C(v5, (uint64_t)" -instr-profile=", 16LL);
  if (SHIBYTE(v29[2]) >= 0) {
    int v7 = v29;
  }
  else {
    int v7 = (void **)v29[0];
  }
  if (SHIBYTE(v29[2]) >= 0) {
    uint64_t v8 = HIBYTE(v29[2]);
  }
  else {
    uint64_t v8 = (uint64_t)v29[1];
  }
  uint64_t v9 = sub_10000E97C(v6, (uint64_t)v7, v8);
  uint64_t v10 = sub_10000E97C(v9, (uint64_t)" -arch arm64 > ", 15LL);
  sub_10000E97C(v10, (uint64_t)"/tmp/sep_manager_report.txt", 27LL);
  std::stringbuf::str(&v21, (const std::stringbuf *)((char *)v23 + 8));
  if ((v21.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v11 = &v21;
  }
  else {
    uint64_t v11 = (std::stringbuf::string_type *)v21.__r_.__value_.__r.__words[0];
  }
  uint64_t v12 = sub_10000D140((char *)v11);
  uint64_t v13 = v12;
  if ((char)v21.__r_.__value_.__s.__size_ < 0)
  {
    operator delete(v21.__r_.__value_.__l.__data_);
    if ((_DWORD)v13) {
      goto LABEL_12;
    }
  }

  else if ((_DWORD)v12)
  {
LABEL_12:
    timespec v14 = sub_10000E97C(&std::cout, (uint64_t)"llvm-cov report failed. Return code was ", 40LL);
    uint64_t v15 = (void *)std::ostream::operator<<(v14, v13);
    std::ios_base::getloc((const std::ios_base *)((char *)v15 + *(void *)(*v15 - 24LL)));
    int v16 = std::locale::use_facet((const std::locale *)&v21, &std::ctype<char>::id);
    uint64_t v17 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v16->__vftable[2].~facet_0)(v16, 10LL);
    std::locale::~locale((std::locale *)&v21);
    std::ostream::put(v15, v17);
    std::ostream::flush(v15);
    goto LABEL_16;
  }

  sub_10000ECD8(__p, "/tmp/sep_manager_report.txt");
  sub_10000D87C((uint64_t)__p, a1);
  if (v20 < 0) {
    operator delete(__p[0]);
  }
LABEL_16:
  *(void *)((char *)&v23[-1]
  *(void *)&v23[0] = v18;
  if (SHIBYTE(v25) < 0) {
    operator delete(v24[1]);
  }
  std::streambuf::~streambuf((char *)v23 + 8);
  std::ios::~ios(v27);
  if (SHIBYTE(v29[2]) < 0) {
    operator delete(v29[0]);
  }
}

void sub_10000E7E8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, std::locale a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, char a21)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  sub_10000D78C((uint64_t)&a21);
  _Unwind_Resume(a1);
}

void sub_10000E858(void *a1)
{
}

void *sub_10000E868(_BYTE *__dst, void *__src, unint64_t a3)
{
  uint64_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8LL) {
      sub_10000E8F4();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000LL;
    *uint64_t v5 = v8;
    uint64_t v5 = v8;
  }

  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

void sub_10000E8F4()
{
}

void sub_10000E908(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10000E958(exception, a1);
}

void sub_10000E944(_Unwind_Exception *a1)
{
}

std::logic_error *sub_10000E958(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_10000E97C(void *a1, uint64_t a2, uint64_t a3)
{
  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  std::ostream::sentry::sentry(v13, a1);
  if (LOBYTE(v13[0]))
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)));
      uint64_t v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32LL);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }

    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!sub_10000EAE8(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear( (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)),  *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24LL) + 32) | 5);
    }
  }

  std::ostream::sentry::~sentry(v13);
  return a1;
}

void sub_10000EA8C( void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
}

void sub_10000EAD4(_Unwind_Exception *a1)
{
}

uint64_t sub_10000EAE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0LL;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (v12 >= 1)
    {
      memset(__p, 170, sizeof(__p));
      sub_10000EC30(__p, v12, __c);
      uint64_t v13 = SHIBYTE(__p[2]) >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96LL))(v6, v13, v12);
      if (SHIBYTE(__p[2]) < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0LL;
      }
    }

    uint64_t v15 = a4 - a3;
    else {
      return 0LL;
    }
  }

  return v6;
}

void sub_10000EC14( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_10000EC30(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_10000E8F4();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000LL;
    *__b = v6;
  }

  else
  {
    *((_BYTE *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }

  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

void *sub_10000ECD8(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_10000E8F4();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void *sub_10000ED88(void *a1, std::string *a2, unsigned __int8 a3)
{
  char v11 = -86;
  std::istream::sentry::sentry(&v11, a1, 1LL);
  if (!v11) {
    return a1;
  }
  if ((char)a2->__r_.__value_.__s.__size_ < 0)
  {
    *a2->__r_.__value_.__l.__data_ = 0;
    a2->__r_.__value_.__l.__size_ = 0LL;
  }

  else
  {
    a2->__r_.__value_.__s.__data_[0] = 0;
    a2->__r_.__value_.__s.__size_ = 0;
  }

  uint64_t v6 = 0LL;
  while (1)
  {
    uint64_t v7 = *(void **)((char *)a1 + *(void *)(*a1 - 24LL) + 40);
    uint64_t v8 = (_BYTE *)v7[3];
    if (v8 != (_BYTE *)v7[4])
    {
      void v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }

    LODWORD(v7) = (*(uint64_t (**)(void *))(*v7 + 80LL))(v7);
    if ((_DWORD)v7 == -1) {
      break;
    }
LABEL_9:
    if (v7 == a3)
    {
      int v9 = 0;
      goto LABEL_17;
    }

    std::string::push_back(a2, (std::string::value_type)v7);
    --v6;
    if ((char)a2->__r_.__value_.__s.__size_ < 0 && a2->__r_.__value_.__l.__size_ == 0x7FFFFFFFFFFFFFF7LL)
    {
      int v9 = 4;
      goto LABEL_17;
    }
  }

  if (v6) {
    int v9 = 2;
  }
  else {
    int v9 = 6;
  }
LABEL_17:
  std::ios_base::clear( (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)),  *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24LL) + 32) | v9);
  return a1;
}

void sub_10000EEBC(void *a1)
{
  uint64_t v2 = *v1;
  *(_DWORD *)((char *)v1 + *(void *)(*v1 - 24LL) + 32) |= 1u;
  if ((*((_BYTE *)v1 + *(void *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x10000EE88LL);
  }

  __cxa_rethrow();
}

void sub_10000EF00(_Unwind_Exception *a1)
{
}

uint64_t sub_10000EF14(uint64_t a1, const std::string *a2, int a3)
{
  uint64_t v6 = std::streambuf::basic_streambuf(a1);
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_DWORD *)(v6 + 96) = a3;
  std::string::operator=((std::string *)(v6 + 64), a2);
  sub_10000EFA4(a1);
  return a1;
}

void sub_10000EF80(_Unwind_Exception *a1)
{
}

void sub_10000EFA4(uint64_t a1)
{
  *(void *)(a1 + 8std::iostream::~basic_iostream(v2, v3 + 8) = 0LL;
  uint64_t v2 = (std::string *)(a1 + 64);
  char v3 = *(_BYTE *)(a1 + 87);
  if (v3 < 0)
  {
    size_t v4 = *(std::string **)(a1 + 64);
    unint64_t v5 = *(void *)(a1 + 72);
  }

  else
  {
    size_t v4 = v2;
    unint64_t v5 = *(unsigned __int8 *)(a1 + 87);
  }

  int v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 8) != 0)
  {
    *(void *)(a1 + 8std::iostream::~basic_iostream(v2, v3 + 8) = (char *)v4 + v5;
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = (char *)v4 + v5;
  }

  if ((v6 & 0x10) != 0)
  {
    *(void *)(a1 + 8std::iostream::~basic_iostream(v2, v3 + 8) = (char *)v4 + v5;
    std::string::size_type v7 = v3 < 0 ? (*(void *)(a1 + 80) & 0x7FFFFFFFFFFFFFFFLL) - 1 : 22LL;
    std::string::resize(v2, v7, 0);
    uint64_t v8 = *(char *)(a1 + 87) < 0 ? *(void *)(a1 + 72) : *(unsigned __int8 *)(a1 + 87);
    *(void *)(a1 + 40) = v4;
    *(void *)(a1 + 4std::iostream::~basic_iostream(v2, v3 + 8) = v4;
    *(void *)(a1 + 56) = (char *)v4 + v8;
    if ((*(_BYTE *)(a1 + 96) & 3) != 0)
    {
      if (v5 >> 31)
      {
        uint64_t v9 = ((v5 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        unint64_t v10 = 0x7FFFFFFF * ((v9 + ((v5 - 0x80000000 - v9) >> 1)) >> 30);
        size_t v4 = (std::string *)((char *)v4 + v10 + 0x7FFFFFFF);
        unint64_t v5 = v5 - v10 - 0x7FFFFFFF;
        *(void *)(a1 + 4std::iostream::~basic_iostream(v2, v3 + 8) = v4;
      }

      if (v5) {
        *(void *)(a1 + 4std::iostream::~basic_iostream(v2, v3 + 8) = (char *)v4 + v5;
      }
    }
  }

unint64_t string_to_handle(unint64_t result)
{
  if (result)
  {
    uint64_t v1 = (_BYTE *)result;
    LODWORD(result) = 0;
    int v2 = 4;
    do
    {
      int v3 = *v1;
      if (*v1) {
        ++v1;
      }
      if (v3) {
        char v4 = v3;
      }
      else {
        char v4 = 32;
      }
      uint64_t result = (((_DWORD)result << 8) + v4);
      --v2;
    }

    while (v2);
  }

  return result;
}

uint64_t sepTesting( int a1, FILE *a2, unsigned int a3, unsigned int a4, FILE *a5, unsigned int a6, unsigned int a7, _BYTE *a8)
{
  kern_return_t v30;
  __int16 v31;
  uint32_t v32;
  char __s2[5];
  char v34[5];
  uint32_t outputCnt[2];
  uint32_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t input[2];
  uint64_t output;
  switch(a1)
  {
    case 1:
      if ((unint64_t)a2 | (unint64_t)a5)
      {
        fwrite("Test data can only be passed in or out of a single test\n", 0x38uLL, 1uLL, __stderrp);
        return 0LL;
      }

      input[0] = 0LL;
      outputCnt[0] = 1;
      outputStruct = malloc(0x100000uLL);
      uint64_t output = 0x100000LL;
      if (IOConnectCallMethod(dword_100024928, 0x1Bu, 0LL, 0, 0LL, 0LL, input, outputCnt, outputStruct, &output))
      {
        if (outputStruct) {
          free(outputStruct);
        }
        printf("IOKit returned %x for kSEP_RunAll\n");
        return 0LL;
      }

      if (!output) {
        return 0LL;
      }
      sub_10000FFF8((uint64_t)outputStruct, input[0], 0LL);
      if (outputStruct)
      {
        uint64_t v24 = outputStruct;
        goto LABEL_41;
      }

      return 1LL;
    case 3:
      if (!a6)
      {
        if (!a8) {
          sub_100016708();
        }
        sub_10000F790(0LL);
        LOBYTE(outputCnt[0]) = HIBYTE(a7);
        BYTE1(outputCnt[0]) = BYTE2(a7);
        BYTE2(outputCnt[0]) = BYTE1(a7);
        HIBYTE(outputCnt[0]) = a7;
        LOBYTE(outputCnt[1]) = 0;
        if (sub_10000FEE0((const char *)outputCnt))
        {
          __int128 v23 = malloc(0x100000uLL);
          input[0] = 0x100000LL;
          uint64_t output = a7;
          if (IOConnectCallMethod(dword_100024928, 0x1Cu, &output, 1u, 0LL, 0LL, 0LL, 0LL, v23, input))
          {
            if (v23) {
              free(v23);
            }
            printf("IOKit returned %x for kSEP_RunCat\n");
            return 0LL;
          }

          if (input[0])
          {
            BOOL v21 = 1LL;
            sub_10000FFF8((uint64_t)v23, 1LL, a8);
            if (v23)
            {
              uint64_t v24 = v23;
LABEL_41:
              free(v24);
              return 1LL;
            }

            return v21;
          }
        }

        else
        {
          printf("%s does not appear to be a supported test category\n", (const char *)outputCnt);
          sub_10000FF58();
          printf("Categories Found: %s\n");
        }

        return 0LL;
      }

      if (!a8) {
        sub_100016708();
      }
      sub_10000F790(1LL);
      v34[0] = HIBYTE(a7);
      v34[1] = BYTE2(a7);
      v34[2] = BYTE1(a7);
      v34[3] = a7;
      _OWORD v34[4] = 0;
      __s2[0] = HIBYTE(a6);
      __s2[1] = BYTE2(a6);
      __s2[2] = BYTE1(a6);
      __s2[3] = a6;
      __s2[4] = 0;
      uint64_t v14 = sub_10000FEE0(v34);
      if (!v14)
      {
        sub_10000FF58();
        printf("%s does not appear to be a supported test category\nCategories Found: %s\n");
        return 0LL;
      }

      LODWORD(input[0]) = 0;
      uint64_t test_cases = embeddedtest_test_suite_get_test_cases(v14, input);
      if (!LODWORD(input[0])) {
        goto LABEL_35;
      }
      uint64_t v16 = test_cases;
      uint64_t v17 = 0LL;
      while (1)
      {
        uint64_t v18 = *(void *)(v16 + 8 * v17);
        name = (const char *)embeddedtest_test_case_get_name(v18);
        if (!strcmp(name, __s2)) {
          break;
        }
      }

      if (!v18)
      {
LABEL_35:
        printf("%s/%s does not appear to be a supported test category\n");
        return 0LL;
      }

      if ((embeddedtest_test_case_get_flags(v18) & 2) != 0)
      {
        input[0] = a3;
        fseeko(a2, 0LL, 2);
        unint64_t v25 = ftello(a2);
        fseeko(a2, 0LL, 0);
        if (v25 <= 0x100000)
        {
          __int128 v26 = malloc(v25);
          if (fread(v26, 1uLL, v25, a2) == v25)
          {
            uint64_t output = 0xAAAAAAAAAAAAAAAALL;
            outputCnt[0] = 1;
            IOConnectCallMethod(dword_100024928, 0x16u, input, 1u, v26, v25, &output, outputCnt, 0LL, 0LL);
          }

          else
          {
            fwrite("Failed to read input data file\n", 0x1FuLL, 1uLL, __stderrp);
          }

          if (v26) {
            free(v26);
          }
        }

        else
        {
          fwrite("Test data input too big\n", 0x18uLL, 1uLL, __stderrp);
        }
      }

      input[0] = a7;
      input[1] = a6;
      uint64_t v38 = 0LL;
      uint64_t v32 = 1;
      if (IOConnectCallMethod(dword_100024928, 0x1Du, input, 2u, 0LL, 0LL, &v38, &v32, 0LL, 0LL))
      {
        printf("IOKit returned %x for kSEP_RunHandle\n");
        return 0LL;
      }

      if ((embeddedtest_test_case_get_flags(v18) & 4) != 0)
      {
        uint64_t output = 0xAAAAAAAAAAAAAAAALL;
        uint64_t v27 = malloc(0x100000uLL);
        *(void *)uint32_t outputCnt = 0x100000LL;
        __int128 v36 = 1;
        if (!IOConnectCallMethod(dword_100024928, 0x17u, &v37, 0, 0LL, 0LL, &output, &v36, v27, (size_t *)outputCnt))
        {
          size_t v28 = fwrite(v27, 1uLL, *(size_t *)outputCnt, a5);
          if (v28 != *(void *)outputCnt) {
            fwrite("Failed to write output data file\n", 0x21uLL, 1uLL, __stderrp);
          }
        }

        if (v27) {
          free(v27);
        }
      }

      int v29 = malloc(0x100000uLL);
      uint64_t output = 0x100000LL;
      BOOL v30 = IOConnectCallMethod(dword_100024928, 0x1Eu, 0LL, 0, 0LL, 0LL, 0LL, 0LL, v29, &output);
      BOOL v21 = v30 == 0;
      if (v30)
      {
        uint64_t v31 = v30;
        if (v29) {
          free(v29);
        }
        printf("IOKit returned %x for kSEP_GetResult\n", v31 & 0x3FFF);
      }

      else
      {
        sub_10000FFF8((uint64_t)v29, 1LL, a8);
        if (v29) {
          free(v29);
        }
      }

      return v21;
    case 4:
      return sub_10000F790(1LL);
    case 5:
      if (!a4) {
        return 0LL;
      }
      input[0] = a4;
      return IOConnectCallScalarMethod(dword_100024928, 0x19u, input, 1u, 0LL, 0LL) == 0;
    default:
      fprintf(__stderrp, "Unsupported testing command (cmd=%d)\n", a1);
      return 0LL;
  }

uint64_t sub_10000F790(uint64_t a1)
{
  kern_return_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int size;
  const char *name;
  uint64_t test_cases;
  uint64_t v18;
  unint64_t i;
  uint64_t v20;
  int flags;
  uint64_t v22;
  const char *v23;
  void *v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  size_t v30;
  uint32_t outputCnt;
  int v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[28];
  uint64_t output;
  int v2 = &unk_100025000;
  uint64_t result = 1LL;
  if (!qword_1000251E0)
  {
    uint64_t output = 0xAAAAAAAAAAAAAAAALL;
    uint32_t outputCnt = 1;
    outputStruct = malloc(0x100000uLL);
    BOOL v30 = 0x100000LL;
    unint64_t v5 = IOConnectCallMethod(dword_100024928, 0x1Au, 0LL, 0, 0LL, 0LL, &output, &outputCnt, outputStruct, &v30);
    if (v5)
    {
      int v6 = v5;
      if (outputStruct) {
        free(outputStruct);
      }
      printf("IOKit returned %x for kSEP_QueryTests\n", v6 & 0x3FFF);
      return 0LL;
    }

    if (!v30)
    {
      fwrite("kSEP_QueryTests returned test_suites_size of 0!\n", 0x30uLL, 1uLL, __stderrp);
      return 0LL;
    }

    std::string::size_type v7 = output;
    qword_1000251D8 = output;
    if (qword_1000251E0) {
      free((void *)qword_1000251E0);
    }
    qword_1000251E0 = (uint64_t)calloc(v7, 8uLL);
    if (!qword_1000251E0) {
      sub_100010128();
    }
    if (qword_1000251D8)
    {
      uint64_t v8 = 0LL;
      uint64_t v9 = 0LL;
      unint64_t v25 = a1;
      uint64_t v24 = outputStruct;
      do
      {
        uint64_t v27 = v9;
        unint64_t v10 = (uint64_t)outputStruct + v9;
        char v11 = outputStruct;
        int64_t v12 = a1;
        uint64_t v13 = v8;
        uint64_t v14 = embeddedtest_test_suite_create_from_resume_data(v10);
        size_t v28 = v13;
        *(void *)(v2[60] + 8 * v13) = v14;
        a1 = v12;
        outputStruct = v11;
        uint64_t size = embeddedtest_test_suite_get_size((uint64_t)v14);
        if ((_DWORD)a1)
        {
          __int128 v26 = size;
          name = (const char *)embeddedtest_test_suite_get_name((uint64_t)v14);
          printf("Category %s\n", name);
          int v29 = 0;
          uint64_t test_cases = embeddedtest_test_suite_get_test_cases((uint64_t)v14, &v29);
          if (v29)
          {
            uint64_t v18 = test_cases;
            for (unint64_t i = 0LL; i < v29; ++i)
            {
              char v20 = *(void *)(v18 + 8 * i);
              flags = embeddedtest_test_case_get_flags(v20);
              __int128 v22 = 0LL;
              uint64_t v38 = 0u;
              memset(v39, 0, sizeof(v39));
              __int128 v36 = 0u;
              __int128 v37 = 0u;
              unint64_t v34 = 0u;
              size_t v35 = 0u;
              __int128 v33 = 0u;
              uint64_t v32 = 1701736270;
              do
              {
                if ((testing_flag_enum[v22] & flags) != 0)
                {
                  if (v32 ^ 0x656E6F4E | v33)
                  {
                    __strcat_chk(&v32, " | ", 128LL);
                    __strcat_chk(&v32, (&testing_flag_strings)[v22], 128LL);
                  }

                  else
                  {
                    __strcpy_chk(&v32, (&testing_flag_strings)[v22], 128LL);
                  }
                }

                ++v22;
              }

              while (v22 != 4);
              __int128 v23 = (const char *)embeddedtest_test_case_get_name(v20);
              printf("\t%s (Flags: %s)\n", v23, (const char *)&v32);
            }
          }

          a1 = v25;
          uint64_t size = v26;
          int v2 = (void *)&unk_100025000;
          outputStruct = v24;
        }

        uint64_t v9 = v27 + size;
        uint64_t v8 = v28 + 1;
      }

      while (v28 + 1 < (unint64_t)qword_1000251D8);
    }

    if (outputStruct) {
      free(outputStruct);
    }
    return 1LL;
  }

  return result;
}

uint64_t sepDebugVar(int a1, _BYTE *a2, void *inputStruct, int64_t a4)
{
  if (a2)
  {
    LODWORD(v6) = 0;
    int v7 = 4;
    do
    {
      int v8 = *a2;
      if (*a2) {
        ++a2;
      }
      if (v8) {
        char v9 = v8;
      }
      else {
        char v9 = 32;
      }
      uint64_t v6 = (((_DWORD)v6 << 8) + v9);
      --v7;
    }

    while (v7);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  switch(a1)
  {
    case 8:
      int v22 = -1431655766;
      char v21 = -86;
      puts("Retrieving old value: ");
      uint64_t v11 = sub_10000FD58(v6, inputStruct, &v22, &v21);
      if ((_DWORD)v11)
      {
        uint64_t v10 = v11;
        int64_t v12 = __stderrp;
        uint64_t v13 = "Failed to get debug variable\n";
        size_t v14 = 29LL;
LABEL_22:
        fwrite(v13, v14, 1uLL, v12);
        return v10;
      }

      int v16 = v22 - 1;
      if ((v22 - 1) >= 8 || ((0x8Bu >> v16) & 1) == 0)
      {
        uint64_t v10 = 3758097090LL;
        int64_t v12 = __stderrp;
        uint64_t v13 = "Width is invalid";
        size_t v14 = 16LL;
        goto LABEL_22;
      }

      uint64_t v17 = v16;
      if (v21 == 1)
      {
        int64_t v18 = qword_100019630[v16];
        int64_t v19 = qword_1000195F0[v17];
        if (v19 <= a4 && v18 >= a4) {
          goto LABEL_33;
        }
      }

      else
      {
        int64_t v18 = qword_100019670[v16];
        if (v18 >= (unint64_t)a4)
        {
LABEL_33:
          input[0] = v6;
          input[1] = a4;
          uint64_t v10 = IOConnectCallMethod(dword_100024928, 0x4Cu, input, 2u, inputStruct, 0x1CuLL, 0LL, 0LL, 0LL, 0LL);
          if (!(_DWORD)v10) {
            puts("Successfully set new variable value");
          }
          return v10;
        }

        int64_t v19 = 0LL;
      }

      uint64_t v10 = 3758097090LL;
      printf("New value is out of range of debug variable [%lld, %lld]\n", v19, v18);
      return v10;
    case 7:
      return sub_10000FD58(v6, inputStruct, 0LL, 0LL);
    case 6:
      input[0] = v6;
      return IOConnectCallMethod(dword_100024928, 0x4Au, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    default:
      uint64_t v10 = 3758097090LL;
      fprintf(__stderrp, "Unsupported debug var command (cmd=%d)\n", a1);
      break;
  }

  return v10;
}

uint64_t sub_10000FD58(uint64_t a1, void *inputStruct, _DWORD *a3, _BYTE *a4)
{
  uint64_t v13 = 0LL;
  uint64_t input = a1;
  uint64_t output = 0LL;
  uint64_t v12 = 0LL;
  uint32_t outputCnt = 3;
  uint64_t v6 = IOConnectCallMethod(dword_100024928, 0x4Bu, &input, 1u, inputStruct, 0x1CuLL, &output, &outputCnt, 0LL, 0LL);
  if (!(_DWORD)v6)
  {
    int v7 = v12;
    char v8 = v13;
    switch((int)v12)
    {
      case 1:
      case 2:
      case 4:
        printf("%d");
        break;
      case 8:
        else {
LABEL_9:
        }
          printf("0x%llx");
        break;
      default:
        fwrite("Width is invalid", 0x10uLL, 1uLL, __stderrp);
        break;
    }

    putchar(10);
    if (a3) {
      *a3 = v7;
    }
    if (a4) {
      *a4 = v8;
    }
  }

  return v6;
}

uint64_t sub_10000FEE0(const char *a1)
{
  if (!qword_1000251D8) {
    return 0LL;
  }
  uint64_t v2 = 0LL;
  while (1)
  {
    uint64_t v3 = *(void *)(qword_1000251E0 + 8 * v2);
    name = (const char *)embeddedtest_test_suite_get_name(v3);
    if (!strcmp(a1, name)) {
      break;
    }
  }

  return v3;
}

char *sub_10000FF58()
{
  uint64_t v0 = 3 * qword_1000251D8;
  uint64_t v1 = (char *)calloc((6 * qword_1000251D8) | 1, 1uLL);
  if (qword_1000251D8)
  {
    unint64_t v2 = 0LL;
    size_t v3 = 2 * v0;
    do
    {
      name = (const char *)embeddedtest_test_suite_get_name(*(void *)(qword_1000251E0 + 8 * v2));
      unint64_t v5 = strncat(v1, name, v3);
      strncat(v5, ", ", v3);
      ++v2;
    }

    while (v2 < qword_1000251D8);
  }

  return v1;
}

void sub_10000FFF8(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  if (a3) {
    *a3 = 1;
  }
  if (a2)
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = 0LL;
    do
    {
      char v8 = embeddedtest_results_create_from_resume_data(a1 + v7);
      v7 += embeddedtest_results_get_size((uint64_t)v8);
      embeddedtest_results_test_case_print((uint64_t)v8);
      uint64_t name = embeddedtest_results_get_name((uint64_t)v8);
      uint64_t v10 = (const char *)name;
      LODWORD(v11) = 4;
      do
      {
        uint64_t v11 = (v11 - 1);
        *(_BYTE *)(name + v11) = 0;
      }

      while (v11 > 1);
      if (embeddedtest_results_did_pass((uint64_t)v8))
      {
        printf("[PASS] %s\n", v10);
      }

      else
      {
        printf("[FAIL] %s\n", v10);
        if (a3) {
          *a3 = 0;
        }
      }

      uint64_t v12 = (char *)0xAAAAAAAAAAAAAAAALL;
      asprintf(&v12, "/tmp/%s_test_results.json", v10);
      embeddedtest_results_save_to_file((uint64_t)v8, v12);
      if (v12) {
        free(v12);
      }
      embeddedtest_results_free(v8);
      ++v6;
    }

    while (v6 != a2);
  }

void sub_100010128()
{
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0LL);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3LL;
  }
  char v4 = *(_BYTE **)result;
  if (*(void *)result == -1LL) {
    goto LABEL_68;
  }
  unint64_t v5 = &v4[v3];
  uint64_t v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    uint64_t v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1LL)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      size_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15) {
            unint64_t v17 = *v12;
          }
          else {
            unint64_t v17 = v7 - 1;
          }
          BOOL v10 = v5 >= v14;
          unint64_t v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3) {
              return 0LL;
            }
LABEL_34:
            uint64_t result = 0LL;
            *a3 = v15;
            return result;
          }

LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }

        return 3LL;
      }

      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3LL;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3LL;
      }
      if (v14 >= v5 || v14 < v4) {
        goto LABEL_69;
      }
      if (!*v14) {
        return 3LL;
      }
      unint64_t v15 = 0LL;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1LL)
      {
        if (v14 >= v5) {
          goto LABEL_69;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_70;
        }
        unsigned int v24 = *v14++;
        unint64_t v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (a3) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v15 > v22;
          }
          char v26 = v25;
          uint64_t result = 3LL;
          if (v15 < 0x80 || (v26 & 1) != 0) {
            return result;
          }
          if (v15 >= v22) {
            unint64_t v27 = v22;
          }
          else {
            unint64_t v27 = v15;
          }
          BOOL v10 = (unint64_t)v5 >= v23;
          size_t v28 = &v5[-v23];
          a2[1] = v23;
          a2[2] = v27;
          if (a3) {
            goto LABEL_34;
          }
          return 0LL;
        }
      }
    }

LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }

  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3LL;
  }
  unint64_t v8 = 0LL;
  uint64_t result = 3LL;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_69;
    }
    uint64_t v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3LL;
      }
      goto LABEL_20;
    }
  }

  return result;
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, _BYTE *a3)
{
  *a3 = 0;
  *a2 = 0LL;
  a2[1] = 0LL;
  if (!*(void *)(result + 8)) {
    return 3LL;
  }
  unsigned int v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  uint64_t v4 = *(void *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      unint64_t v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }

      unint64_t v6 = *(void *)result;
      unint64_t v7 = *(void *)result + v4;
      unint64_t v8 = (unsigned __int8 *)(*(void *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }

      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1LL)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }

        unint64_t v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          uint64_t result = 0LL;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }

        goto LABEL_19;
      }
    }

    return 3LL;
  }

  if (v3) {
    return 3LL;
  }
  else {
    return 0LL;
  }
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  int v2 = **a1;
  if (v2 != 255 && v2 != 0) {
    return 3LL;
  }
  uint64_t result = 0LL;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  unint64_t v4 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = DERParseInteger64(a1, &v4);
  if (!(_DWORD)result)
  {
    if (HIDWORD(v4))
    {
      return 7LL;
    }

    else
    {
      uint64_t result = 0LL;
      *a2 = v4;
    }
  }

  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2 = (unint64_t)a1[1];
  if (!v2) {
    return 3LL;
  }
  unsigned int v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0) {
    return 3LL;
  }
  if (**a1)
  {
    if (v2 > 8) {
      return 7LL;
    }
    goto LABEL_10;
  }

  if (v2 >= 2)
  {
    if (v2 > 9) {
      return 7LL;
    }
  }

LABEL_10:
  unint64_t v5 = 0LL;
  do
  {
    unsigned int v6 = *v3++;
    unint64_t v5 = v6 | (v5 << 8);
    --v2;
  }

  while (v2);
  uint64_t result = 0LL;
  *a2 = v5;
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v8, 0LL);
  if (!(_DWORD)result)
  {
    unint64_t v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008LL)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }

      else
      {
        unint64_t v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          uint64_t result = 0LL;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }

      __break(0x5519u);
    }

    else
    {
      return 2LL;
    }
  }

  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2 = *result;
  unint64_t v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }

  else
  {
    unint64_t v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0LL;
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  v10[0] = 0LL;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 >= v3) {
    return 1LL;
  }
  v10[0] = *a1;
  v10[1] = v3 - v2;
  uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0LL);
  if (!(_DWORD)result)
  {
    unint64_t v8 = a2[1];
    unint64_t v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      unint64_t v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        uint64_t result = 0LL;
        *a1 = v9;
        return result;
      }

      __break(0x5519u);
    }

    __break(0x5513u);
  }

  return result;
}

uint64_t DERParseSequenceToObject( uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v12, 0LL);
  if (!(_DWORD)result)
  {
    if (v12[0] == 0x2000000000000010LL) {
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    }
    else {
      return 2LL;
    }
  }

  return result;
}

uint64_t DERParseSequenceContentToObject( unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  unint64_t v32 = 0LL;
  if (a6)
  {
    if (a6 > a5) {
      goto LABEL_59;
    }
    bzero((void *)a4, a6);
  }

  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  if (__CFADD__(*a1, v11)) {
    goto LABEL_58;
  }
  unint64_t v12 = v10 + v11;
  if (v10 > v12) {
LABEL_59:
  }
    __break(0x5519u);
  unint64_t v32 = *a1;
  unint64_t v33 = v12;
  if (a2)
  {
    unsigned __int16 v13 = 0;
    int v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      unint64_t v15 = v32;
      unint64_t v14 = v33;
      uint64_t result = DERDecodeSeqNext(&v32, v31);
      if ((_DWORD)result) {
        break;
      }
      if (a2 <= v13) {
        return 2LL;
      }
      while (1)
      {
        unsigned __int16 v17 = v13;
        __int16 v18 = *(_WORD *)(a3 + 24LL * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(void *)(a3 + 24LL * v13 + 8)) {
          break;
        }
        uint64_t result = 2LL;
        if ((v18 & 1) != 0)
        {
          ++v13;
        }

        return result;
      }

      if ((v18 & 4) == 0)
      {
        unint64_t v19 = *(void *)(a3 + 24LL * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5) {
          return 7LL;
        }
        if (v19 > ~a4) {
          goto LABEL_58;
        }
        uint64_t v21 = (char *)(a4 + v19);
        *(_OWORD *)uint64_t v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((void *)v21 + 1) <= v14 - v15)
            {
              *(void *)uint64_t v21 = v15;
              return 3LL;
            }

            goto LABEL_59;
          }

          if (v21 + 16 > v29) {
            goto LABEL_59;
          }
          uint64_t v23 = *((void *)v21 + 1);
          unint64_t v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }

          if (v14 < v15 || v24 > v14 - v15) {
            goto LABEL_59;
          }
          *(void *)uint64_t v21 = v15;
          *((void *)v21 + 1) = v24;
        }
      }

      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          unint64_t v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            unint64_t v10 = v31[1] + v31[2];
            unint64_t v12 = *a1 + v28;
            goto LABEL_47;
          }
        }

LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }

      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        unint64_t v10 = v32;
        unint64_t v12 = v33;
        goto LABEL_47;
      }
    }

    if ((_DWORD)result == 1)
    {
      if (a2 <= v13)
      {
        return 0LL;
      }

      else
      {
        BOOL v25 = (__int16 *)(a3 + 24LL * v13 + 16);
        unint64_t v26 = a2 - (unint64_t)v13;
        uint64_t result = 0LL;
        while (1)
        {
          __int16 v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0) {
            break;
          }
          if (!--v26) {
            return result;
          }
        }

        return 5LL;
      }
    }
  }

  else
  {
LABEL_47:
    if (v10 == v12) {
      return 0LL;
    }
    else {
      return 3LL;
    }
  }

  return result;
}

BOOL DEROidCompare(uint64_t a1, uint64_t a2)
{
  BOOL result = 0LL;
  if (a1 && a2)
  {
    size_t v4 = *(void *)(a1 + 8);
    return v4 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v4) == 0;
  }

  return result;
}

double DERImg4DecodeFindInSequence(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  unint64_t v7 = 0LL;
  __int128 v8 = 0uLL;
  while (!DERDecodeSeqNext(a1, &v7))
  {
    if (v7 == a2)
    {
      double result = *(double *)&v8;
      *a3 = v8;
      return result;
    }
  }

  return result;
}

double DERImg4DecodeContentFindItemWithTag(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  v6[0] = 0LL;
  v6[1] = 0LL;
  return result;
}

uint64_t DERImg4DecodeTagCompare(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 < 4) {
    return 0xFFFFFFFFLL;
  }
  if (v2 != 4) {
    return 1LL;
  }
  unsigned int v5 = 0;
  if (v5 < a2) {
    return 0xFFFFFFFFLL;
  }
  return v5 > a2;
}

uint64_t DERImg4Decode(void *a1, unint64_t a2)
{
  uint64_t result = 6LL;
  if (a1)
  {
    if (a2)
    {
      unint64_t v6 = 0LL;
      unint64_t v7 = 0LL;
      uint64_t v8 = 0LL;
      uint64_t result = DERDecodeItem((uint64_t)a1, &v6);
      if (!(_DWORD)result)
      {
        if (v6 == 0x2000000000000010LL)
        {
          uint64_t v5 = a1[1];
          if (__CFADD__(*a1, v5) || __CFADD__(v7, v8))
          {
            __break(0x5513u);
          }

          else if (*a1 + v5 == v7 + v8)
          {
            uint64_t result = DERParseSequenceContentToObject(&v7, 4u, (uint64_t)&DERImg4ItemSpecs, a2, 0x40uLL, 0LL);
            if (!(_DWORD)result) {
              return 2 * (DERImg4DecodeTagCompare(a2, 0x494D4734u) != 0);
            }
          }

          else
          {
            return 7LL;
          }
        }

        else
        {
          return 2LL;
        }
      }
    }
  }

  return result;
}

uint64_t DERImg4DecodePayloadCompression(unint64_t *a1, char **a2)
{
  unsigned int v5 = 2;
  uint64_t result = 6LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceContentToObject( a1,  2u,  (uint64_t)&DERImg4CompressionItemSpecs,  (unint64_t)a2,  0x20uLL,  0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = DERParseInteger(a2, &v5);
        if (!(_DWORD)result)
        {
          if (v5 <= 1) {
            return 0LL;
          }
          else {
            return 6LL;
          }
        }
      }
    }
  }

  return result;
}

uint64_t DERImg4DecodePayloadWithProperties(uint64_t a1, unint64_t a2)
{
  uint64_t result = 6LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceToObject(a1, 7u, (uint64_t)&DERImg4PayloadWithPropertiesItemSpecs, a2, 0xA0uLL, 0LL);
      if (!(_DWORD)result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2LL;
        }

        else if (!*(void *)(a2 + 80) {
               || (__int128 v7 = 0u,
        }
                   __int128 v8 = 0u,
                   uint64_t result = DERImg4DecodePayloadCompression((unint64_t *)(a2 + 80), (char **)&v7),
                   !(_DWORD)result))
        {
          uint64_t v6 = *(void *)(a2 + 96);
          uint64_t v5 = a2 + 96;
          if (!v6) {
            return 0LL;
          }
          __int128 v7 = 0u;
          __int128 v8 = 0u;
          uint64_t result = DERImg4DecodePayloadProperties(v5, (unint64_t)&v7);
          if (!(_DWORD)result) {
            return 0LL;
          }
        }
      }
    }
  }

  return result;
}

uint64_t DERImg4DecodePayloadProperties(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6LL;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4PayloadPropertiesItemSpecs, a2, 0x20uLL, 0LL);
      if ((_DWORD)result) {
        return result;
      }
    }

    return 0LL;
  }

  return result;
}

uint64_t DERImg4DecodePayload(uint64_t a1, unint64_t a2)
{
  uint64_t result = 6LL;
  if (a1 && a2)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    uint64_t result = DERImg4DecodePayloadWithProperties(a1, (unint64_t)&v11);
    if ((_DWORD)result)
    {
      uint64_t result = DERParseSequenceToObject(a1, 6u, (uint64_t)&DERImg4PayloadItemSpecs, a2, 0x90uLL, 0LL);
      if (!(_DWORD)result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2LL;
        }

        else
        {
          uint64_t v6 = *(void *)(a2 + 80);
          uint64_t v5 = (unint64_t *)(a2 + 80);
          if (!v6) {
            return 0LL;
          }
          memset(v10, 0, sizeof(v10));
          uint64_t result = DERImg4DecodePayloadCompression(v5, (char **)v10);
          if (!(_DWORD)result) {
            return 0LL;
          }
        }
      }
    }

    else
    {
      __int128 v7 = v12;
      *(_OWORD *)a2 = v11;
      *(_OWORD *)(a2 + 16) = v7;
      __int128 v8 = v14;
      *(_OWORD *)(a2 + 32) = v13;
      *(_OWORD *)(a2 + 4std::iostream::~basic_iostream(v2, v3 + 8) = v8;
      __int128 v9 = v16;
      *(_OWORD *)(a2 + 64) = v15;
      *(_OWORD *)(a2 + 80) = v9;
    }
  }

  return result;
}

uint64_t DERImg4DecodeManifest(void *a1, unint64_t a2)
{
  return sub_100010F94(a1, 5uLL, (uint64_t)&DERImg4ManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t sub_100010F94(void *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5)
{
  uint64_t result = 6LL;
  if (a1 && a4)
  {
    if (!*a1 || !a1[1]) {
      return 0LL;
    }
    if (a2 >= 0x10000)
    {
      __break(0x5507u);
      return result;
    }

    uint64_t result = DERParseSequenceToObject((uint64_t)a1, (unsigned __int16)a2, a3, a4, 0xC0uLL, 0LL);
    if (!(_DWORD)result)
    {
      unsigned int v9 = 0;
      uint64_t result = DERParseInteger((char **)(a4 + 16), &v9);
      if ((_DWORD)result) {
        return result;
      }
      if (v9 > 2) {
        return 2LL;
      }
      return 0LL;
    }
  }

  return result;
}

uint64_t DERImg4DecodeRestoreInfo(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6LL;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4RestoreInfoItemSpecs, a2, 0x20uLL, 0LL);
      if ((_DWORD)result) {
        return result;
      }
    }

    return 0LL;
  }

  return result;
}

uint64_t DERImg4DecodeProperty(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 6LL;
  if (a1)
  {
    if (a3)
    {
      unint64_t v14 = 0LL;
      __int128 v15 = 0uLL;
      __int128 v13 = 0uLL;
      uint64_t v11 = 0LL;
      unint64_t v12 = 0LL;
      uint64_t v9 = 0LL;
      unint64_t v10 = 0LL;
      unsigned int v8 = 0;
      uint64_t result = DERDecodeSeqInit((uint64_t)a1, &v9, &v10);
      if (!(_DWORD)result)
      {
        if (v9 != 0x2000000000000010LL) {
          return 2LL;
        }
        uint64_t result = DERDecodeSeqNext(&v10, &v14);
        if ((_DWORD)result) {
          return result;
        }
        if (v14 != 22) {
          return 2LL;
        }
        uint64_t result = DERParseInteger((char **)&v15, &v8);
        if ((_DWORD)result) {
          return result;
        }
        if ((v8 | 0xE000000000000000LL) != a2) {
          return 2LL;
        }
        *(_OWORD *)a3 = v15;
        uint64_t result = DERDecodeSeqNext(&v10, &v12);
        if ((_DWORD)result) {
          return result;
        }
        *(void *)(a3 + 40) = v12;
        *(_OWORD *)(a3 + 24) = v13;
        uint64_t result = DERDecodeSeqNext(&v10, &v12);
        if ((_DWORD)result != 1) {
          return 2LL;
        }
        uint64_t v7 = a1[1];
        if (__CFADD__(*a1, v7))
        {
          __break(0x5513u);
        }

        else if (v11 == *a1 + v7)
        {
          return 0LL;
        }

        else
        {
          return 7LL;
        }
      }
    }
  }

  return result;
}

uint64_t DERImg4DecodePropertyWithItem(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unsigned int v8 = 0;
  v9[0] = 0LL;
  v9[2] = 0LL;
  v9[1] = 22LL;
  v9[3] = 24LL;
  __int128 v10 = a3;
  uint64_t result = DERParseSequenceToObject(a1, 2u, (uint64_t)v9, a4, 0x30uLL, 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = DERParseInteger((char **)a4, &v8);
    if (!(_DWORD)result)
    {
      if ((v8 | 0xE000000000000000LL) == a2)
      {
        uint64_t result = 0LL;
        *(void *)(a4 + 16) = a2 | 0xE000000000000000LL;
        *(void *)(a4 + 40) = a3;
      }

      else
      {
        return 2LL;
      }
    }
  }

  return result;
}

void DERImg4DecodeFindPropertyInSequence( unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  __int128 v8 = 0uLL;
  DERImg4DecodeFindInSequence(a1, a2, &v8);
  if (!v7) {
    DERImg4DecodePropertyWithItem((uint64_t)&v8, a2, a3, a4);
  }
}

void DERImg4DecodeFindProperty(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  v7[0] = 0LL;
  v7[1] = 0LL;
}

void DERImg4DecodeParseManifestProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

void sub_100011374(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4)
{
  int v11 = 0;
  if (a1)
  {
    if (a2 | a3)
    {
      unint64_t v14 = 0LL;
      v15[0] = 0LL;
      v15[1] = 0LL;
      memset(v13, 0, sizeof(v13));
      memset(v12, 0, sizeof(v12));
      if (!DERDecodeItem(a1 + 264, &v14)
        && v14 == 0x2000000000000011LL
        && !DERParseInteger((char **)(a1 + 248), &v11))
      {
        unint64_t v8 = v11 == 2 ? 0x2000000000000010LL : 0x2000000000000011LL;
        DERImg4DecodeFindProperty(v15, a4 | 0xE000000000000000LL, v8, (unint64_t)v13);
        if (!v9)
        {
          if (a2) {
            *(_OWORD *)a2 = *(_OWORD *)((char *)&v13[1] + 8);
          }
          DERImg4DecodeFindProperty( (unint64_t *)&v13[1] + 1,  0xE00000004D414E50LL,  0x2000000000000011uLL,  (unint64_t)v12);
          if (a3)
          {
            if (!v10) {
              *(_OWORD *)a3 = *(_OWORD *)((char *)&v12[1] + 8);
            }
          }
        }
      }
    }
  }

uint64_t Img4DecodeParseLengthFromBufferWithTag(uint64_t a1, uint64_t a2, unsigned int a3, void *a4)
{
  unint64_t v11 = 0LL;
  unint64_t v12 = 0LL;
  v16[0] = 0LL;
  v16[1] = 0LL;
  v14[1] = 0LL;
  unint64_t v15 = 0LL;
  uint64_t result = 0xFFFFFFFFLL;
  unint64_t v13 = 0LL;
  v14[0] = 0LL;
  if (a1)
  {
    if (a4)
    {
      v17[0] = a1;
      v17[1] = a2;
      uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v17, &v15, &v12);
      if (!(_DWORD)result)
      {
        if (v12)
        {
          if (v15 != 0x2000000000000010LL) {
            return 2LL;
          }
          uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v16, &v13, &v11);
          if ((_DWORD)result) {
            return result;
          }
          if (v11)
          {
            uint64_t result = DERImg4DecodeTagCompare((uint64_t)v14, a3);
            if (!(_DWORD)result)
            {
              uint64_t v8 = v16[0] - a1;
              if (v12 >= ~(v16[0] - a1)) {
                return 7LL;
              }
              BOOL v9 = __CFADD__(v12, v8);
              uint64_t v10 = v12 + v8;
              if (v9)
              {
                __break(0x5500u);
              }

              else
              {
                uint64_t result = 0LL;
                *a4 = v10;
              }

              return result;
            }

            return 2LL;
          }
        }

        return 3LL;
      }
    }
  }

  return result;
}

uint64_t Img4DecodeParseLengthFromBuffer(uint64_t a1, uint64_t a2, void *a3)
{
  return Img4DecodeParseLengthFromBufferWithTag(a1, a2, 0x494D4734u, a3);
}

uint64_t Img4DecodePayloadExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6LL;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 136)) {
      BOOL v4 = *(void *)(a1 + 144) != 0LL;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0LL;
    *a2 = v4;
  }

  return result;
}

uint64_t Img4DecodeSectionExists(void *a1, unsigned int a2, char *a3)
{
  uint64_t v3 = 6LL;
  if (a2 <= 1 && a1 && a3)
  {
    if (a2 == 1)
    {
      if (!a1[55] || !a1[56]) {
        goto LABEL_11;
      }
    }

    else if (!a1[33] || !a1[34])
    {
LABEL_11:
      char v4 = 0;
      goto LABEL_12;
    }

    char v4 = 1;
LABEL_12:
    uint64_t v3 = 0LL;
    *a3 = v4;
  }

  return v3;
}

void Img4DecodeGetRestoreInfoInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
}

void Img4DecodeGetIntegerFromSection(uint64_t a1, unsigned int a2, uint64_t a3, _DWORD *a4)
{
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000LL, 2uLL, v6);
      if (!v5)
      {
      }
    }
  }

void Img4DecodeGetRestoreInfoData(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
}

void Img4DecodeGetDataFromSection(uint64_t a1, unsigned int a2, uint64_t a3, void *a4, void *a5)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000LL, 4uLL, &v9);
    if (v7)
    {
      *a5 = 0LL;
      *a4 = 0LL;
    }

    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
      *a5 = v8;
    }
  }

uint64_t Img4DecodePayloadPropertiesExists(uint64_t a1, BOOL *a2)
{
  if (!a1) {
    return 6LL;
  }
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  uint64_t result = 6LL;
  memset(v7, 0, sizeof(v7));
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    uint64_t v5 = a1 + 8;
    if (v6)
    {
      uint64_t result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v7);
      if (!(_DWORD)result) {
        *a2 = (void)v8 != 0LL;
      }
    }
  }

  return result;
}

void Img4DecodePayloadPropertyExistsByTag(uint64_t a1, uint64_t a2, BOOL *a3)
{
  if (a1)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v10 = 0uLL;
    __int128 v9 = 0uLL;
    __int128 v8 = 0uLL;
    if (a3)
    {
      if (*(void *)(a1 + 8))
      {
        __int128 v19 = 0uLL;
        __int128 v20 = 0uLL;
        __int128 v17 = 0uLL;
        __int128 v18 = 0uLL;
        __int128 v15 = 0uLL;
        __int128 v16 = 0uLL;
        __int128 v13 = 0uLL;
        __int128 v14 = 0uLL;
        __int128 v11 = 0uLL;
        __int128 v12 = 0uLL;
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)&v11))
        {
          if ((void)v17)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v17, 0x2000000000000010LL, &v10);
            if (!v5)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011LL, &v9);
              if (!v6)
              {
                DERImg4DecodeContentFindItemWithTag((unint64_t *)&v9, a2, &v8);
                if (!v7) {
                  *a3 = (void)v8 != 0LL;
                }
              }
            }
          }
        }
      }
    }
  }

double Img4DecodeGetPropertyFromSection( uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  *(_OWORD *)__int128 v13 = 0uLL;
  if (a2 <= 1 && a1 && a5)
  {
    char v14 = 0;
    if (!Img4DecodeSectionExists((void *)a1, a2, &v14) && v14)
    {
      if (a2)
      {
        *(_OWORD *)__int128 v13 = *(_OWORD *)(a1 + 440);
        goto LABEL_9;
      }

      DERImg4DecodeParseManifestProperties(a1, 0LL, (unint64_t)v13);
      if (!v10)
      {
LABEL_9:
        DERImg4DecodeFindProperty(v13, a3, a4, (unint64_t)a5);
        if (!v12) {
          return result;
        }
      }
    }

    double result = 0.0;
    a5[1] = 0u;
    a5[2] = 0u;
    *a5 = 0u;
  }

  return result;
}

uint64_t Img4DecodeGetPropertyBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000LL, (uint64_t)&v7);
  if (!(_DWORD)result)
  {
    if (*((void *)&v9 + 1) == 1LL)
    {
      if (a3) {
        return DERParseBoolean((unsigned __int8 **)&v8 + 1, a3);
      }
      else {
        return 6LL;
      }
    }

    else
    {
      return 2LL;
    }
  }

  return result;
}

uint64_t Img4DecodeGetPropertyData(uint64_t *a1, uint64_t a2, void *a3, _DWORD *a4)
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v12 = 0u;
  uint64_t result = 6LL;
  if (a3 && a4)
  {
    uint64_t v8 = *a1;
    uint64_t v9 = *((unsigned int *)a1 + 2);
    v11[0] = v8;
    v11[1] = v9;
    uint64_t result = DERImg4DecodeProperty(v11, a2 | 0xE000000000000000LL, (uint64_t)&v12);
    if (!(_DWORD)result)
    {
      if (*((void *)&v14 + 1) == 4LL)
      {
        uint64_t result = 0LL;
        *a3 = *((void *)&v13 + 1);
        int v10 = v14;
LABEL_6:
        *a4 = v10;
        return result;
      }

      uint64_t result = 2LL;
    }

    int v10 = 0;
    *a3 = 0LL;
    goto LABEL_6;
  }

  return result;
}

void Img4DecodeEvaluateCertificateProperties(void *a1)
{
}

void sub_100011B0C(void *a1, _OWORD *a2)
{
  v21[0] = 0LL;
  v21[1] = 0LL;
  v20[0] = 0LL;
  v20[1] = 0LL;
  uint64_t v19 = 0LL;
  __int128 v18 = 0uLL;
  size_t __n = 0LL;
  uint64_t v17 = 0LL;
  uint64_t v14 = 0LL;
  __s1 = 0LL;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  memset(v9, 0, sizeof(v9));
  __int128 __s2 = 0uLL;
  __int128 v7 = 0uLL;
  if (a1 && a1[40] && !DERDecodeSeqInit((uint64_t)(a1 + 39), &v19, v21) && v19 == 0x2000000000000011LL)
  {
    while (1)
    {
      uint64_t v4 = (__int128 *)(a1 + 7);
      switch(v17)
      {
        case 0xE00000004D414E50LL:
LABEL_11:
          __int128 v7 = *v4;
          if (DERImg4DecodeProperty(&v18, v17, (uint64_t)&v11)
            || *((void *)&v13 + 1) != 0x2000000000000011LL
            || DERDecodeSeqContentInit((unint64_t *)&v12 + 1, v20))
          {
            return;
          }

          while (1)
          {
            int v5 = DERDecodeSeqNext(v20, (unint64_t *)&v14);
            if (v5) {
              break;
            }
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v7, v14, &__s2);
            if (*((void *)&v10 + 1) <= 4uLL && ((1LL << SBYTE8(v10)) & 0x16) != 0)
            {
              if (v6) {
                return;
              }
              if (__n != *((void *)&__s2 + 1)) {
                return;
              }
              int v6 = memcmp(__s1, (const void *)__s2, __n);
              if (v6) {
                return;
              }
            }

            else if (*((void *)&v10 + 1) != 0xA000000000000000LL)
            {
              if (*((void *)&v10 + 1) != 0xA000000000000001LL || v6 != 1) {
                return;
              }
              int v6 = 0;
            }

            if (v6) {
              return;
            }
          }

          if (v5 != 1) {
            return;
          }
          break;
        case 0xE00000006D616E78LL:
          if (a2) {
            *a2 = v18;
          }
          break;
        case 0xE00000004F424A50LL:
          uint64_t v4 = (__int128 *)(a1 + 9);
          if (a1[9]) {
            goto LABEL_11;
          }
          uint64_t v4 = (__int128 *)(a1 + 9);
          if (a1[10]) {
            goto LABEL_11;
          }
          break;
        default:
          return;
      }
    }
  }

uint64_t Img4DecodeEvaluateDictionaryProperties( unint64_t *a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v15 = 0LL;
  unint64_t v16 = 0LL;
  unint64_t v14 = 0LL;
  v13[0] = 0LL;
  v13[1] = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v10 = 0LL;
  memset(v8, 0, sizeof(v8));
  __int128 v9 = 0u;
  if (!a3) {
    return 6LL;
  }
  uint64_t result = (uint64_t)DERDecodeSeqContentInit(a1, v13);
  if (!(_DWORD)result)
  {
    while (1)
    {
      uint64_t result = DERDecodeSeqNext(v13, &v14);
      if ((_DWORD)result == 1) {
        return 0LL;
      }
      if ((_DWORD)result) {
        return result;
      }
      uint64_t result = DERImg4DecodeProperty(&v15, v14, (uint64_t)v8);
      if ((_DWORD)result) {
        return result;
      }
      uint64_t result = 2LL;
      if (*((void *)&v9 + 1) > 0x16uLL
        || ((1LL << SBYTE8(v9)) & 0x400016) == 0
        || !(v14 >> 62)
        || (v14 & 0x2000000000000000LL) == 0)
      {
        return result;
      }

      if (HIDWORD(v16)) {
        break;
      }
      uint64_t v10 = v15;
      LODWORD(v11) = v16;
      uint64_t v12 = *((void *)&v9 + 1);
      uint64_t result = a3(v14, &v10, a2, a4);
      if ((_DWORD)result) {
        return result;
      }
    }

    return 7LL;
  }

  return result;
}

double Img4DecodeInit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a3)
    {
      v9[0] = a1;
      v9[1] = a2;
      __int128 v7 = 0u;
      __int128 v8 = 0u;
      __int128 v5 = 0u;
      __int128 v6 = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 4std::iostream::~basic_iostream(v2, v3 + 8) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 12std::iostream::~basic_iostream(v2, v3 + 8) = 0u;
      *(_OWORD *)(a3 + 144) = 0u;
      *(_OWORD *)(a3 + 160) = 0u;
      *(_OWORD *)(a3 + 176) = 0u;
      *(_OWORD *)(a3 + 192) = 0u;
      *(_OWORD *)(a3 + 20std::iostream::~basic_iostream(v2, v3 + 8) = 0u;
      *(_OWORD *)(a3 + 224) = 0u;
      *(_OWORD *)(a3 + 240) = 0u;
      *(_OWORD *)(a3 + 256) = 0u;
      *(_OWORD *)(a3 + 272) = 0u;
      *(_OWORD *)(a3 + 28std::iostream::~basic_iostream(v2, v3 + 8) = 0u;
      *(_OWORD *)(a3 + 304) = 0u;
      *(_OWORD *)(a3 + 3memset(outputStruct, 170, 20) = 0u;
      *(_OWORD *)(a3 + 336) = 0u;
      *(_OWORD *)(a3 + 352) = 0u;
      *(_OWORD *)(a3 + 36std::iostream::~basic_iostream(v2, v3 + 8) = 0u;
      *(_OWORD *)(a3 + 384) = 0u;
      *(_OWORD *)(a3 + 400) = 0u;
      *(_OWORD *)(a3 + 416) = 0u;
      *(_OWORD *)(a3 + 432) = 0u;
      *(void *)(a3 + 44std::iostream::~basic_iostream(v2, v3 + 8) = 0LL;
      if (!DERImg4Decode(v9, (unint64_t)&v5)
        && !DERImg4DecodePayload((uint64_t)&v6, a3 + 88)
        && !DERImg4DecodeManifest(&v7, a3 + 232)
        && !DERImg4DecodeRestoreInfo((uint64_t)&v8, a3 + 424))
      {
        *(_OWORD *)(a3 + std::iostream::~basic_iostream(v2, v3 + 8) = v6;
        double result = *(double *)&v7;
        *(_OWORD *)(a3 + 24) = v7;
      }
    }
  }

  return result;
}

void Img4DecodePerformTrustEvaluatationWithCallbacks( unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void sub_100011F88(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v22 = 0LL;
  uint64_t v23 = 0LL;
  memset(v24, 0, sizeof(v24));
  if (a2)
  {
    if (a3)
    {
      BOOL v21 = 0;
      if (a4)
      {
        if (*(void *)a3)
        {
          if (*(void *)a4)
          {
            if (*(void *)(a4 + 24))
            {
              if (*(void *)(a4 + 8))
              {
                if (*(void *)(a4 + 16))
                {
                  __int128 v9 = *(void **)(a4 + 32);
                  if (v9)
                  {
                    if (*(void *)(a2 + 24) && *v9 <= 0x30uLL && !(*(unsigned int (**)(void))a4)())
                    {
                      *(_BYTE *)(a2 + 1) = 1;
                      __int128 v13 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 8);
                      if (v13
                        && (unint64_t v14 = (const void *)v13(a2, a6)) != 0LL
                        && !memcmp((const void *)(a2 + 328), v14, **(void **)(a4 + 32)))
                      {
                        int v15 = 0;
                      }

                      else
                      {
                        if ((*(unsigned int (**)(void, void, uint64_t *, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 8))( *(void *)(a2 + 296),  *(void *)(a2 + 304),  &v22,  &v23,  a2 + 312,  a2 + 320,  a4,  a6)
                          || **(void **)(a4 + 32) > 0x30uLL
                          || (*(unsigned int (**)(void, void, uint64_t))a4)( *(void *)(a2 + 264),  *(void *)(a2 + 272),  a2 + 376)
                          || (*(unsigned int (**)(uint64_t, uint64_t, void, void, uint64_t, void, uint64_t, uint64_t))(a4 + 16))( v22,  v23,  *(void *)(a2 + 280),  *(void *)(a2 + 288),  a2 + 376,  **(void **)(a4 + 32),  a4,  a6))
                        {
                          return;
                        }

                        int v15 = 1;
                      }

                      DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
                      if (v16) {
                        return;
                      }
                      if ((a5 & 1) == 0)
                      {
                        uint64_t v17 = *(unsigned int (**)(unint64_t *, unint64_t, uint64_t, _OWORD *, uint64_t))(a3 + 16);
                        unint64_t v18 = a1 | 0xE000000000000000LL;
                        uint64_t v19 = (unint64_t *)(a2 + 40);
                        if (v17)
                        {
                          if (v17(v19, v18, 0x2000000000000011LL, v24, a6)) {
                            return;
                          }
                        }

                        else
                        {
                          DERImg4DecodeFindProperty(v19, v18, 0x2000000000000011uLL, (unint64_t)v24);
                          if (v20) {
                            return;
                          }
                        }

                        *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v24[1] + 8);
                      }

                      if ((!v15 || !(*(unsigned int (**)(uint64_t, uint64_t))(a4 + 24))(a2, a6))
                        && **(void **)(a4 + 32) <= 0x30uLL
                        && !Img4DecodePayloadExists(a2, &v21))
                      {
                        if (v21)
                        {
                          if ((*(unsigned int (**)(void, void, uint64_t, void, uint64_t))a4)( *(void *)(a2 + 8),  *(void *)(a2 + 16),  a2 + 184,  **(void **)(a4 + 32),  a4))
                          {
                            return;
                          }

                          *(_BYTE *)a2 = 1;
                        }

                        if (!Img4DecodeEvaluateDictionaryProperties( (unint64_t *)(a2 + 56),  0LL,  *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3,  a6)
                          && (a5 & 1) == 0)
                        {
                          Img4DecodeEvaluateDictionaryProperties( (unint64_t *)(a2 + 72),  1LL,  *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3,  a6);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

uint64_t sub_100012230(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  if (a5 != 4096 && a5 != 3072) {
    return 0xFFFFFFFFLL;
  }
  v24[0] = 0LL;
  v24[1] = 0LL;
  unint64_t v9 = (unint64_t)(a5 + 63) >> 6;
  __chkstk_darwin();
  uint64_t v11 = (unint64_t *)((char *)&v21 - v10);
  bzero((char *)&v21 - v10, v10);
  unint64_t *v11 = v9;
  uint64_t v12 = *(unsigned int *)(a1 + 8);
  v23[0] = *(void *)a1;
  v23[1] = v12;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t result = DERParseSequenceToObject( (uint64_t)v23,  (unsigned __int16)DERNumRSAPubKeyPKCS1ItemSpecs,  (uint64_t)&DERRSAPubKeyPKCS1ItemSpecs,  (unint64_t)&v21,  0x20uLL,  0x20uLL);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v14 = *((void *)&v21 + 1);
  int v15 = (_BYTE *)v21;
  for (__int128 i = v22; v14; --v14)
  {
    if (*v15) {
      break;
    }
    if (v15 == (_BYTE *)-1LL) {
      __break(0x5513u);
    }
    ++v15;
  }

  if (v14 >= 0xFFFFFFFFFFFFFFF8LL)
  {
    __break(0x5500u);
    return result;
  }

  unint64_t v17 = (v14 + 7) >> 3;
  if (v17 > *v11) {
    return 0xFFFFFFFFLL;
  }
  unint64_t *v11 = v17;
  if (&_ccrsa_verify_pkcs1v15_digest) {
    BOOL v18 = &CCRSA_PKCS1_FAULT_CANARY == 0LL;
  }
  else {
    BOOL v18 = 1;
  }
  if (!v18)
  {
    int v20 = ccrsa_verify_pkcs1v15_digest(v11, a2, a3[1], *a3, a4[1], *a4, v24);
    return 0xFFFFFFFFLL;
  }

  LOBYTE(v21) = 0;
  int v19 = ccrsa_verify_pkcs1v15(v11, a2, a3[1], *a3, a4[1], *a4, &v21);
  uint64_t result = 0xFFFFFFFFLL;
  if (!v19 && (_BYTE)v21) {
    return 0LL;
  }
  return result;
}

uint64_t verify_signature_rsa( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v13[0] = a1;
  v13[1] = a2;
  v12[0] = a3;
  v12[1] = a4;
  v11[0] = a5;
  v11[1] = a6;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  if (!a4) {
    return 0xFFFFFFFFLL;
  }
  if (!a5) {
    return 0xFFFFFFFFLL;
  }
  if (!a6) {
    return 0xFFFFFFFFLL;
  }
  if (!a7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = *(void *)(a7 + 32);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  __int128 v8 = *(void ***)(v7 + 16);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v9 = *v8;
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  if (*v9 != a6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = sub_100012230((uint64_t)v13, v9[4], v11, v12, 4096LL);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t verify_chain_img4_v1( unint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v9 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(&v28, 0x2F0uLL);
        v26[0] = a1;
        v26[1] = v9;
        v27[0] = &ROOT_CA_CERTIFICATE;
        v27[1] = 1215LL;
        if (!sub_100012C2C(v26, (uint64_t)v27, 3u)
          && !sub_1000127B4((uint64_t)v27, 3u, (uint64_t)&v29, (uint64_t)v31, (uint64_t)v34, (uint64_t)v37))
        {
          unint64_t v24 = a6;
          uint64_t v15 = 0LL;
          int v16 = (const void **)v32;
          unint64_t v17 = &v30;
          BOOL v18 = (const void **)v32;
          while (1)
          {
            int v19 = &v26[20 * v15];
            size_t v20 = v19[37];
            __int128 v21 = *v18;
            v18 += 20;
            uint64_t result = sub_100012A18(&v34[v15], v17, a7);
            if ((_DWORD)result) {
              break;
            }
            v17 += 6;
            ++v15;
            int v16 = v18;
            if (v15 == 2)
            {
              __int128 v25 = 0uLL;
              if ((unint64_t)v31 > 0xFFFFFFFFFFFFFF5FLL)
              {
LABEL_34:
                __break(0x5513u);
                return result;
              }

              v42[0] = 0LL;
              v42[1] = 0LL;
              unint64_t v40 = 0LL;
              v41[0] = 0LL;
              v41[1] = 0LL;
LABEL_14:
              if (!DERDecodeSeqNext(v42, &v40) && v40 == 0x2000000000000011LL)
              {
                v47[0] = 0LL;
                v47[1] = 0LL;
                unint64_t v45 = 0LL;
                v46[0] = 0LL;
                v46[1] = 0LL;
                __int128 v43 = 0u;
                __int128 v44 = 0u;
                if (!DERDecodeSeqContentInit(v41, v47))
                {
                  do
                  {
                    int v22 = DERDecodeSeqNext(v47, &v45);
                    if (v22)
                    {
                      if (v22 == 1) {
                        goto LABEL_14;
                      }
                      return 0xFFFFFFFFLL;
                    }

                    if (v45 != 0x2000000000000010LL
                      || DERParseSequenceContentToObject( v46,  (unsigned __int16)DERNumAttributeTypeAndValueItemSpecs,  (uint64_t)&DERAttributeTypeAndValueItemSpecs,  (unint64_t)&v43,  0x20uLL,  0x20uLL))
                    {
                      return 0xFFFFFFFFLL;
                    }
                  }

                  while (!DEROidCompare((uint64_t)&oidCommonName, (uint64_t)&v43));
                  __int128 v25 = v44;
                  uint64_t result = DEROidCompare((uint64_t)&off_1000206F0, (uint64_t)&v25);
                  if (!(_DWORD)result) {
                    return 0xFFFFFFFFLL;
                  }
                  *a3 = v35;
                  *a4 = v36;
                  if (!v38) {
                    return 0LL;
                  }
                  uint64_t v23 = v39;
                  if (!v39) {
                    return 0LL;
                  }
                  uint64_t result = 0LL;
                  if (a5)
                  {
                    if (v24)
                    {
                      uint64_t result = 0LL;
                      *a5 = v38;
                      *unint64_t v24 = v23;
                    }
                  }

                  return result;
                }
              }

              return 0xFFFFFFFFLL;
            }
          }
        }

        return 0xFFFFFFFFLL;
      }
    }
  }

  return result;
}

uint64_t sub_1000127B4(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = 0LL;
  uint64_t v15 = result;
  unint64_t v18 = ~result;
  unint64_t v17 = ~a3;
  unint64_t v14 = ~a4;
  unint64_t v13 = ~a5;
  unint64_t v11 = ~a6;
  uint64_t v10 = a2;
  while (1)
  {
    unint64_t v9 = 16 * v8;
    if (16 * v8 > v18 || 48 * v8 > v17) {
      break;
    }
    uint64_t result = DERParseSequenceToObject( v15 + 16 * v8,  (unsigned __int16)DERNumSignedCertCrlItemSpecs,  (uint64_t)&DERSignedCertCrlItemSpecs,  a3 + 48 * v8,  0x30uLL,  0x30uLL);
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (160 * v8 > v14) {
      break;
    }
    uint64_t result = DERParseSequenceToObject( a3 + 48 * v8,  (unsigned __int16)DERNumTBSCertItemSpecs,  (uint64_t)&DERTBSCertItemSpecs,  a4 + 160 * v8,  0xA0uLL,  0xA0uLL);
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v13) {
      break;
    }
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    char v21 = 0;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    if (DERParseSequenceContentToObject( (unint64_t *)(a4 + 160 * v8 + 96),  (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs,  (uint64_t)&DERSubjPubKeyInfoItemSpecs,  (unint64_t)&v22,  0x20uLL,  0x20uLL)) {
      return 0xFFFFFFFFLL;
    }
    if (DERParseSequenceContentToObject( (unint64_t *)&v22,  (unsigned __int16)DERNumAlgorithmIdItemSpecs,  (uint64_t)&DERAlgorithmIdItemSpecs,  (unint64_t)&v19,  0x20uLL,  0x20uLL)) {
      return 0xFFFFFFFFLL;
    }
    uint64_t result = DEROidCompare((uint64_t)&v19, (uint64_t)&oidRsa);
    if (!(_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (*((void *)&v20 + 1))
    {
      if (*((void *)&v20 + 1) != 2LL || *(_BYTE *)v20 != 5) {
        return 0xFFFFFFFFLL;
      }
      if ((void)v20 == -1LL) {
        break;
      }
      if (*(_BYTE *)(v20 + 1)) {
        return 0xFFFFFFFFLL;
      }
    }

    uint64_t result = DERParseBitString((uint64_t)&v23, (unint64_t *)(a5 + 16 * v8), &v21);
    if ((_DWORD)result || v21) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v11) {
      break;
    }
    uint64_t result = sub_100012D04(a4 + 160 * v8, (void *)(a6 + 16 * v8));
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (++v8 == v10) {
      return 0LL;
    }
  }

  __break(0x5513u);
  return result;
}

uint64_t sub_100012A18(void *a1, void *a2, uint64_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  char v10 = 0;
  memset(v13, 0, sizeof(v13));
  unint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  __int128 v5 = *(void **)(a3 + 32);
  if (!v5
    || !v5[2]
    || !*(void *)a3
    || !*(void *)(a3 + 40)
    || *v5 > 0x30uLL
    || DERParseSequenceContentToObject( a2 + 2,  (unsigned __int16)DERNumAlgorithmIdItemSpecs,  (uint64_t)&DERAlgorithmIdItemSpecs,  (unint64_t)&v11,  0x20uLL,  0x20uLL))
  {
    return 0xFFFFFFFFLL;
  }

  if (*((void *)&v12 + 1))
  {
    uint64_t result = DEROidCompare((uint64_t)&v11, (uint64_t)&oidEcPubKey);
    if ((result & 1) == 0)
    {
      if (*((void *)&v12 + 1) != 2LL || *(_BYTE *)v12 != 5) {
        return 0xFFFFFFFFLL;
      }
      if ((void)v12 == -1LL)
      {
        __break(0x5513u);
        return result;
      }

      if (*(_BYTE *)(v12 + 1)) {
        return 0xFFFFFFFFLL;
      }
    }
  }

  if ((*(unsigned int (**)(void, void, _OWORD *, void, uint64_t))a3)( *a2,  a2[1],  v13,  **(void **)(a3 + 32),  a3))
  {
    return 0xFFFFFFFFLL;
  }

  if (v10) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = (*(uint64_t (**)(void, void, unint64_t, uint64_t, _OWORD *, void, uint64_t, void))(a3 + 16))( *a1,  a1[1],  v8,  v9,  v13,  **(void **)(a3 + 32),  a3,  0LL);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t Img4DecodeComputeDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a5)
  {
    unint64_t v8 = *(void **)(a5 + 32);
    if (v8 && (uint64_t v9 = (void *)v8[2]) != 0LL && *v8 == a4 && *v9 && *(void *)*v9 == a4)
    {
      ccdigest();
      return 0LL;
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

uint64_t sub_100012C2C(unint64_t *a1, uint64_t a2, unsigned int a3)
{
  unint64_t v18 = 0LL;
  unint64_t v19 = 0LL;
  unint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = 0LL;
  unint64_t v5 = ~a2;
  unsigned int v6 = 1;
  unint64_t v7 = *a1;
  unint64_t v8 = a1[1];
  while (1)
  {
    unint64_t v18 = v7;
    unint64_t v19 = v8;
    uint64_t result = DERDecodeItem((uint64_t)&v18, &v15);
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (__CFADD__(v16, v17)) {
      break;
    }
    unint64_t v10 = v16 + v17;
    unint64_t v11 = v16 + v17 - v7;
    BOOL v12 = !(v11 >> 17) && v8 >= v11;
    if (!v12 || v6 >= a3) {
      return 0xFFFFFFFFLL;
    }
    unint64_t v14 = (unint64_t *)(a2 + 16LL * v6);
    unint64_t *v14 = v7;
    v14[1] = v11;
    if (v10 < v7) {
      break;
    }
    BOOL v12 = v8 >= v11;
    v8 -= v11;
    if (!v12) {
      goto LABEL_21;
    }
    ++v6;
    unint64_t v7 = v10;
    if (!v8)
    {
      if (v6 == a3) {
        return 0LL;
      }
      return 0xFFFFFFFFLL;
    }
  }

  __break(0x5513u);
LABEL_21:
  __break(0x5515u);
  return result;
}

uint64_t sub_100012D04(uint64_t a1, void *a2)
{
  v11[0] = 0LL;
  v11[1] = 0LL;
  v9[1] = 0LL;
  uint64_t v10 = 0LL;
  unint64_t v8 = 0LL;
  v9[0] = 0LL;
  __int128 v7 = 0u;
  memset(v6, 0, sizeof(v6));
  *a2 = 0LL;
  a2[1] = 0LL;
  if (!*(void *)(a1 + 152)) {
    return 0LL;
  }
  char v3 = 1;
  while (1)
  {
    int v4 = DERDecodeSeqNext(v11, &v8);
    if (v4) {
      break;
    }
    if (v8 != 0x2000000000000010LL
      || DERParseSequenceContentToObject( v9,  (unsigned __int16)DERNumExtensionItemSpecs,  (uint64_t)&DERExtensionItemSpecs,  (unint64_t)v6,  0x30uLL,  0x30uLL))
    {
      return 0xFFFFFFFFLL;
    }

    char v3 = 0;
    if (DEROidCompare((uint64_t)&oidAppleImg4ManifestCertSpec, (uint64_t)v6))
    {
      memset(v12, 0, sizeof(v12));
      char v3 = 0;
      *(_OWORD *)a2 = v7;
    }
  }

  if (v4 != 1 || (v3 & 1) != 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0LL;
  }
}

uint64_t SEPART_decode(uint64_t *a1, void *a2, void *a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  if (!a5) {
    return 0LL;
  }
  uint64_t v11 = ccder_decode_sequence_tl(&v16, a5, a6);
  uint64_t v12 = ccder_decode_uint64(&v15, v11, a6);
  if (v15) {
    return 0LL;
  }
  *a1 = v12;
  uint64_t result = ccder_decode_sequence_tl(&v16, v12, a6);
  if (result)
  {
    *a2 = v16;
    *a3 = 0LL;
    uint64_t v14 = ccder_decode_tl(4LL, a3);
    *a4 = v14;
    return v14 + *a3;
  }

  return result;
}

uint64_t SEPARTExtract(uint64_t a1, uint64_t a2, uint64_t *a3, void *a4)
{
  return SEPART_decode(a3, a4, &v6, &v5, a1, a2);
}

uint64_t SEPARTPayloadDecode( uint64_t a1, void *a2, uint64_t *a3, void *a4, uint64_t *a5, void *a6, uint64_t *a7, uint64_t *a8, void *a9, uint64_t a10, uint64_t a11)
{
  if (!a10) {
    return 0LL;
  }
  uint64_t v19 = ccder_decode_sequence_tl(&v24, a10, a11);
  if (v24 != a11) {
    return 0LL;
  }
  ccder_decode_uint64(a1, v19, a11);
  sub_100013074(a2, a3);
  sub_100013074(a4, a5);
  uint64_t v21 = sub_100013074(a6, a7);
  uint64_t v22 = ccder_decode_constructed_tl(0x2000000000000011LL, &v23);
  if (a9) {
    *a9 = v23;
  }
  if (a8) {
    *a8 = v21;
  }
  if (v22) {
    return v23;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100013074(void *a1, uint64_t *a2)
{
  uint64_t result = ccder_decode_tl(4LL, &v5);
  if (result)
  {
    if (a1) {
      *a1 = v5;
    }
    if (a2) {
      *a2 = result;
    }
    result += v5;
  }

  return result;
}

uint64_t SEPARTCounterFind(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v15 = 0LL;
  uint64_t v7 = ccder_decode_constructed_tl(0x2000000000000011LL, &v15);
  unint64_t v8 = a1 | 0xC000000000000000LL;
  while (1)
  {
    uint64_t v9 = ccder_decode_tag(&v14, v7, a4);
    uint64_t v10 = (char *)ccder_decode_len(&v16, v9, a4);
    if (!v10 || v16 == 0) {
      break;
    }
    uint64_t v12 = v10;
    uint64_t v7 = (uint64_t)&v12[v16];
    if (v14 == v8) {
      return 1LL;
    }
  }

  return 0LL;
}

double *embeddedtest_test_case_statistic_metric_create(const char *a1, double a2)
{
  if (a1)
  {
    int v4 = (double *)calloc(1uLL, 0x38uLL);
    if (!v4) {
      sub_100018048();
    }
    uint64_t v5 = v4;
    uint64_t v6 = strdup(a1);
    *(void *)uint64_t v5 = v6;
    if (!v6) {
      sub_100018080();
    }
    v5[1] = a2;
    v5[2] = a2;
    v5[3] = a2;
    v5[4] = a2;
    v5[5] = 0.0;
    *((_DWORD *)v5 + 12) = 1;
  }

  else
  {
    puts("Unable to create test case statistic metric with a null name");
    return 0LL;
  }

  return v5;
}

void embeddedtest_test_case_statistic_metric_free(void **a1)
{
  if (a1)
  {
    unint64_t v2 = *a1;
    if (v2) {
      free(v2);
    }
    free(a1);
  }

uint64_t embeddedtest_test_case_statistic_metric_get_name(uint64_t a1)
{
  return *(void *)a1;
}

void *embeddedtest_test_case_statistic_metric_copy_json_representation( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return v9;
}

uint64_t embeddedtest_test_case_statistic_metric_merge(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 48);
  unsigned int v3 = *(_DWORD *)(a2 + 48);
  double v4 = *(double *)(a1 + 32) + *(double *)(a2 + 32);
  double v5 = v4 / (double)(v3 + v2);
  double v6 = sqrt( (*(double *)(a2 + 40) * *(double *)(a2 + 40) * (double)v3 + (double)v2 * (*(double *)(a1 + 40) * *(double *)(a1 + 40))
        + (*(double *)(a2 + 24) - v5) * (*(double *)(a2 + 24) - v5) * (double)v3
  *(double *)(a1 + 32) = v4;
  *(double *)(a1 + 40) = v6;
  *(_DWORD *)(a1 + 4std::iostream::~basic_iostream(v2, v3 + 8) = v3 + v2;
  *(double *)(a1 + 24) = v5;
  v7.f64[0] = *(float64_t *)(a1 + 8);
  v7.f64[1] = *(float64_t *)(a2 + 16);
  v8.f64[0] = *(float64_t *)(a2 + 8);
  v8.f64[1] = *(float64_t *)(a1 + 16);
  *(int8x16_t *)(a1 + std::iostream::~basic_iostream(v2, v3 + 8) = vbslq_s8((int8x16_t)vcgeq_f64(v7, v8), *(int8x16_t *)(a1 + 8), *(int8x16_t *)(a2 + 8));
  return 0LL;
}

__n128 embeddedtest_test_case_statistic_metric_copy(uint64_t a1)
{
  if (a1)
  {
    unsigned int v2 = embeddedtest_test_case_statistic_metric_create(*(const char **)a1, 0.0);
    v2[3] = *(double *)(a1 + 24);
    *(_OWORD *)(v2 + 1) = *(_OWORD *)(a1 + 8);
    __n128 result = *(__n128 *)(a1 + 32);
    *((__n128 *)v2 + 2) = result;
    *((_DWORD *)v2 + 12) = *(_DWORD *)(a1 + 48);
  }

  return result;
}

double *embeddedtest_test_case_statistic_metric_create_from_buffer(uint64_t a1, _DWORD *a2)
{
  double v4 = (double *)calloc(1uLL, 0x38uLL);
  if (!v4) {
    sub_1000180B8();
  }
  double v5 = v4;
  *(void *)double v4 = embeddedtest_create_string_from_buffer(a1, a2);
  v5[1] = embeddedtest_deserialize_metric_value(a1, a2);
  v5[2] = embeddedtest_deserialize_metric_value(a1, a2);
  v5[3] = embeddedtest_deserialize_metric_value(a1, a2);
  v5[4] = embeddedtest_deserialize_metric_value(a1, a2);
  v5[5] = embeddedtest_deserialize_metric_value(a1, a2);
  *((_DWORD *)v5 + 12) = embeddedtest_deserialize_count(a1, a2);
  return v5;
}

uint64_t embeddedtest_test_case_statistic_metric_get_size(const char **a1)
{
  return strlen(*a1) + 48;
}

uint64_t embeddedtest_asprintf( void **a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return embeddedtest_vasprintf(a1, a2, &a9);
}

uint64_t embeddedtest_vasprintf(void **a1, char *__format, va_list a3)
{
  uint64_t v5 = vsnprintf(0LL, 0LL, __format, a3);
  uint64_t v6 = v5;
  if (a1)
  {
    size_t v7 = (int)v5 + 1;
    float64x2_t v8 = (char *)calloc(v7, 8uLL);
    *a1 = v8;
    if (!v8) {
      sub_1000180F0();
    }
    uint64_t v6 = vsnprintf(v8, v7, __format, a3);
    if ((v6 & 0x80000000) != 0)
    {
      if (*a1) {
        free(*a1);
      }
      printf("vsnprintf returned an error...%d\n", v6);
    }
  }

  return v6;
}

_BYTE *embeddedtest_escape_json_string(_BYTE *a1, int a2)
{
  __n128 result = calloc(1uLL, (2 * a2) | 1u);
  if (!result) {
    sub_100018128();
  }
  char v4 = *a1;
  if (*a1)
  {
    uint64_t v5 = a1 + 1;
    uint64_t v6 = result;
    do
    {
      if (v4 == 10)
      {
        *(_WORD *)uint64_t v6 = 28252;
        v6 += 2;
      }

      else if (v4 == 92 || v4 == 34)
      {
        *uint64_t v6 = 92;
        v6[1] = v4;
        v6 += 2;
      }

      else
      {
        *v6++ = v4;
      }

      int v7 = *v5++;
      char v4 = v7;
    }

    while (v7);
  }

  return result;
}

char *embeddedtest_create_json_string_from_array( void *a1, unsigned int a2, const char *a3, uint64_t (*a4)(void))
{
  if (!a2) {
    return (char *)calloc(1uLL, 8uLL);
  }
  int v7 = 0LL;
  uint64_t v8 = a2;
  do
  {
    uint64_t v9 = a4(*a1);
    uint64_t v10 = (char *)v9;
    if (v7)
    {
      int v11 = strlen(v7);
      size_t v12 = v11 + strlen(v10) + 2;
      unint64_t v13 = (char *)realloc(v7, v12);
      if (!v13) {
        sub_100018160();
      }
      int v7 = v13;
      snprintf(v13, v12, a3, v13, v10);
      if (v10) {
        free(v10);
      }
    }

    else
    {
      int v7 = (char *)v9;
    }

    ++a1;
    --v8;
  }

  while (v8);
  if (v7) {
    return v7;
  }
  else {
    return (char *)calloc(1uLL, 8uLL);
  }
}

uint64_t embeddedtest_results_save_to_file(uint64_t a1, const char *a2)
{
  if (!a1)
  {
    uint64_t v9 = "Results object must be provided to save to disk";
LABEL_9:
    uint64_t v10 = 1LL;
    return embeddedtest_error_get_error(v10, v9);
  }

  if (!a2)
  {
    uint64_t v9 = "Filepath must be provided to save to disk";
    goto LABEL_9;
  }

  unsigned int v3 = (char *)embeddedtest_results_copy_json_representation(a1);
  if (!v3) {
    sub_100018198();
  }
  char v4 = v3;
  uint64_t v5 = fopen(a2, "w+");
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = fputs(v4, v5);
    fclose(v6);
    free(v4);
    if (v7 > 0) {
      return 0LL;
    }
    uint64_t v9 = "Unable to write full json to file";
  }

  else
  {
    uint64_t v9 = "Unable to open requested file";
  }

  uint64_t v10 = 4LL;
  return embeddedtest_error_get_error(v10, v9);
}

_BYTE *embeddedtest_test_case_result_create(char a1, const char *a2)
{
  if (a2)
  {
    char v4 = calloc(1uLL, 0x30uLL);
    if (!v4) {
      sub_1000181D0();
    }
    uint64_t v5 = v4;
    uint64_t v6 = strdup(a2);
    *(void *)uint64_t v5 = v6;
    if (!v6) {
      sub_100018208();
    }
    v5[28] = a1;
    *((_DWORD *)v5 + 6) = -1;
    *((void *)v5 + 1) = 0LL;
    *((_DWORD *)v5 + std::iostream::~basic_iostream(v2, v3 + 8) = 0;
    *((void *)v5 + 5) = 0LL;
    *((_DWORD *)v5 + 4) = time(0LL);
    *((_DWORD *)v5 + 5) = 0;
  }

  else
  {
    puts("Unable to create a test case result with NULL name");
    return 0LL;
  }

  return v5;
}

void embeddedtest_test_case_result_free(void *a1)
{
  if (a1)
  {
    unsigned int v2 = (void *)*a1;
    if (v2) {
      free(v2);
    }
    unsigned int v3 = (void *)a1[1];
    if (v3) {
      free(v3);
    }
    if (*((_DWORD *)a1 + 8))
    {
      unint64_t v4 = 0LL;
      do
        embeddedtest_test_case_metric_free(*(void ***)(a1[5] + 8 * v4++));
      while (v4 < *((unsigned int *)a1 + 8));
    }

    uint64_t v5 = (void *)a1[5];
    if (v5) {
      free(v5);
    }
    free(a1);
  }

uint64_t embeddedtest_test_case_result_pass(uint64_t a1)
{
  if (!a1)
  {
    uint64_t v1 = "Unable to pass NULL result";
    return embeddedtest_error_get_error(1LL, v1);
  }

  if ((*(_BYTE *)(a1 + 28) & 0xFE) == 2)
  {
    uint64_t v1 = "Cannot pass a histogram";
    return embeddedtest_error_get_error(1LL, v1);
  }

  *(_DWORD *)(a1 + 24) = 0;
  return 0LL;
}

BOOL embeddedtest_test_case_result_is_histogram(uint64_t a1)
{
  return (*(_BYTE *)(a1 + 28) & 0xFE) == 2;
}

uint64_t embeddedtest_test_case_result_fail(uint64_t a1, char *__format, ...)
{
  if (!a1)
  {
    unint64_t v4 = "Unable to fail NULL result";
    return embeddedtest_error_get_error(1LL, v4);
  }

  if (!__format)
  {
    unint64_t v4 = "Reason cannot be null when failing a test case";
    return embeddedtest_error_get_error(1LL, v4);
  }

  if ((*(_BYTE *)(a1 + 28) & 0xFE) == 2)
  {
    unint64_t v4 = "Cannot fail a histogram";
    return embeddedtest_error_get_error(1LL, v4);
  }

  int v7 = (void *)(a1 + 8);
  uint64_t v6 = *(void **)(a1 + 8);
  if (v6) {
    free(v6);
  }
  embeddedtest_vasprintf((void **)(a1 + 8), __format, va);
  if (!*v7) {
    sub_100018240();
  }
  *(_DWORD *)(a1 + 24) = 1;
  return 0LL;
}

uint64_t embeddedtest_test_case_result_add_metric(uint64_t a1, const char *a2, double a3)
{
  if (!a1)
  {
    uint64_t v5 = "Unable to add metric to NULL result";
    return embeddedtest_error_get_error(1LL, v5);
  }

  if (!a2)
  {
    uint64_t v5 = "Metric name cannot be null";
    return embeddedtest_error_get_error(1LL, v5);
  }

  if ((*(_BYTE *)(a1 + 28) & 0xFE) == 2)
  {
    uint64_t v5 = "Metrics cannot be added to a histogram";
    return embeddedtest_error_get_error(1LL, v5);
  }

  int v7 = embeddedtest_test_case_metric_create(a2, a3);
  if (*(_DWORD *)(a1 + 32))
  {
    unint64_t v8 = 0LL;
    while (1)
    {
      uint64_t v9 = *(void **)(*(void *)(a1 + 40) + 8 * v8);
      uint64_t name = (const char *)embeddedtest_test_case_metric_get_name((uint64_t)v9);
      if (!strcmp(a2, name)) {
        break;
      }
      ++v8;
      unint64_t v11 = *(unsigned int *)(a1 + 32);
      if (v8 >= v11)
      {
        unsigned int v12 = v11 + 1;
        goto LABEL_14;
      }
    }

    if (v9) {
      free(v9);
    }
    *(void *)(*(void *)(a1 + 40) + 8 * vstd::iostream::~basic_iostream(v2, v3 + 8) = v7;
  }

  else
  {
    unsigned int v12 = 1;
LABEL_14:
    *(_DWORD *)(a1 + 32) = v12;
    if (*(void *)(a1 + 40)) {
      unint64_t v13 = realloc(*(void **)(a1 + 40), 8LL * v12);
    }
    else {
      unint64_t v13 = calloc(v12, 8uLL);
    }
    *(void *)(a1 + 40) = v13;
    if (!v13) {
      sub_100018278();
    }
    v13[*(_DWORD *)(a1 + 32) - 1] = v7;
  }

  return 0LL;
}

BOOL embeddedtest_test_case_result_did_pass(uint64_t a1)
{
  return *(_DWORD *)(a1 + 24) == 0;
}

uint64_t embeddedtest_test_case_result_check_validity(uint64_t a1)
{
  if (!a1) {
    return embeddedtest_error_get_error(1LL, "Unable to check validity of NULL result");
  }
  if ((*(_BYTE *)(a1 + 28) & 0xFE) == 2) {
    return sub_100013B04(a1);
  }
  if (*(_DWORD *)(a1 + 24) == -1) {
    return embeddedtest_error_get_error(2LL, "Result did not have pass/fail set");
  }
  return 0LL;
}

uint64_t sub_100013B04(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 28) == 2 && !*(_DWORD *)(a1 + 20))
  {
    unsigned int v2 = "Histogram by time did not have a end time";
  }

  else
  {
    if (*(void *)(a1 + 8)) {
      return 0LL;
    }
    unsigned int v2 = "Histogram requires bucket to be set";
  }

  return embeddedtest_error_get_error(2LL, v2);
}

uint64_t embeddedtest_test_case_result_get_metrics(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

uint64_t embeddedtest_test_case_result_get_metric_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t embeddedtest_test_case_result_get_name(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t embeddedtest_test_case_result_get_bucket(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t embeddedtest_test_case_result_get_class(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 28);
}

uint64_t embeddedtest_test_case_result_get_duration(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20) - *(_DWORD *)(a1 + 16);
  return v1 & ~(v1 >> 31);
}

uint64_t embeddedtest_test_case_statistic_create(uint64_t a1)
{
  if (a1)
  {
    unsigned int v2 = calloc(1uLL, 0x30uLL);
    if (!v2) {
      sub_1000182B0();
    }
    uint64_t v3 = (uint64_t)v2;
    uint64_t name = (const char *)embeddedtest_test_case_result_get_name(a1);
    uint64_t v5 = strdup(name);
    *(void *)uint64_t v3 = v5;
    if (!v5) {
      sub_1000182E8();
    }
    *(_BYTE *)(v3 + std::iostream::~basic_iostream(v2, v3 + 8) = embeddedtest_test_case_result_get_class(a1);
    if (embeddedtest_test_case_result_is_histogram(a1) || !embeddedtest_test_case_result_did_pass(a1))
    {
      int v7 = calloc(1uLL, 8uLL);
      *(void *)(v3 + 24) = v7;
      if (!v7) {
        sub_100018320();
      }
      if (*(_BYTE *)(v3 + 8) == 2) {
        int duration = embeddedtest_test_case_result_get_duration(a1);
      }
      else {
        int duration = 1;
      }
      bucket = (const char *)embeddedtest_test_case_result_get_bucket(a1);
      **(void **)(v3 + 24) = embeddedtest_test_case_statistic_bucket_create(bucket, duration);
      int v6 = 1;
    }

    else
    {
      int v6 = 0;
      *(void *)(v3 + 24) = 0LL;
    }

    *(_DWORD *)(v3 + memset(outputStruct, 170, 20) = v6;
    if (embeddedtest_test_case_result_is_histogram(a1))
    {
      *(_DWORD *)(v3 + 12) = 0;
      *(void *)(v3 + 40) = 0LL;
      *(_DWORD *)(v3 + 32) = 0;
      int v10 = *(unsigned __int8 *)(v3 + 8);
      if (v10 == 3)
      {
        int v11 = 1;
        goto LABEL_19;
      }

      if (v10 == 2)
      {
        int v11 = embeddedtest_test_case_result_get_duration(a1);
LABEL_19:
        *(_DWORD *)(v3 + 16) = v11;
      }
    }

    else
    {
      sub_100013CC4(v3, a1);
    }
  }

  else
  {
    puts("Unable to create test case statistic with NULL initial result");
    return 0LL;
  }

  return v3;
}

uint64_t sub_100013CC4(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 16) = 1;
  *(_DWORD *)(a1 + 12) = !embeddedtest_test_case_result_did_pass(a2);
  uint64_t result = embeddedtest_test_case_result_get_metric_count(a2);
  *(_DWORD *)(a1 + 32) = result;
  if ((_DWORD)result)
  {
    uint64_t v5 = result;
    int v6 = calloc(result, 8uLL);
    *(void *)(a1 + 40) = v6;
    if (!v6) {
      sub_100018358();
    }
    uint64_t metrics = embeddedtest_test_case_result_get_metrics(a2);
    uint64_t v8 = 0LL;
    uint64_t v9 = 8 * v5;
    do
    {
      uint64_t v10 = *(void *)(metrics + v8);
      uint64_t name = (const char *)embeddedtest_test_case_metric_get_name(v10);
      double value = embeddedtest_test_case_metric_get_value(v10);
      uint64_t result = (uint64_t)embeddedtest_test_case_statistic_metric_create(name, value);
      *(void *)(*(void *)(a1 + 40) + vstd::iostream::~basic_iostream(v2, v3 + 8) = result;
      v8 += 8LL;
    }

    while (v9 != v8);
  }

  return result;
}

void embeddedtest_test_case_statistic_free(void **a1)
{
  if (a1)
  {
    unsigned int v2 = *a1;
    if (v2) {
      free(v2);
    }
    sub_100013DC4((uint64_t)a1);
    sub_100013E1C((uint64_t)a1);
    free(a1);
  }

void sub_100013DC4(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 32))
  {
    unint64_t v2 = 0LL;
    do
      embeddedtest_test_case_statistic_metric_free(*(void ***)(*(void *)(a1 + 40) + 8 * v2++));
    while (v2 < *(unsigned int *)(a1 + 32));
  }

  uint64_t v3 = *(void **)(a1 + 40);
  if (v3) {
    free(v3);
  }
}

void sub_100013E1C(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 20))
  {
    unint64_t v2 = 0LL;
    do
      embeddedtest_test_case_statistic_bucket_free(*(void ***)(*(void *)(a1 + 24) + 8 * v2++));
    while (v2 < *(unsigned int *)(a1 + 20));
  }

  uint64_t v3 = *(void **)(a1 + 24);
  if (v3) {
    free(v3);
  }
}

void *embeddedtest_test_case_statistic_copy_json_representation(uint64_t a1)
{
  json_string_from_array = embeddedtest_create_json_string_from_array( *(void **)(a1 + 24),  *(_DWORD *)(a1 + 20),  "%s,%s",  (uint64_t (*)(void))embeddedtest_test_case_statistic_bucket_copy_json_representation);
  if ((*(_BYTE *)(a1 + 8) & 0xFE) == 2)
  {
    embeddedtest_asprintf( &v17,  "{Name:%s,Instances:%d,Buckets:{%s}}",  v2,  v3,  v4,  v5,  v6,  v7,  *(void *)a1);
    uint64_t v9 = json_string_from_array;
    if (!json_string_from_array) {
      return v17;
    }
    goto LABEL_7;
  }

  uint64_t v9 = embeddedtest_create_json_string_from_array( *(void **)(a1 + 40),  *(_DWORD *)(a1 + 32),  "%s,%s",  (uint64_t (*)(void))embeddedtest_test_case_statistic_metric_copy_json_representation);
  embeddedtest_asprintf( &v17,  "{Name:%s,Instances:%d,Failure Count:%d,Failure Buckets:{%s},Metrics:[%s]}",  v10,  v11,  v12,  v13,  v14,  v15,  *(void *)a1);
  if (json_string_from_array) {
    free(json_string_from_array);
  }
  if (v9) {
LABEL_7:
  }
    free(v9);
  return v17;
}

uint64_t embeddedtest_test_case_statistic_add_result(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void **)embeddedtest_test_case_statistic_create(a2);
  uint64_t v4 = embeddedtest_test_case_statistic_merge(a1, (uint64_t)v3);
  embeddedtest_test_case_statistic_free(v3);
  return v4;
}

uint64_t embeddedtest_test_case_statistic_merge(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100014020(a1, a2);
  if (!(_DWORD)v4)
  {
    sub_100014088(a1, a2);
    sub_1000141CC(a1, a2);
    if ((*(_BYTE *)(a1 + 8) & 0xFE) != 2) {
      *(_DWORD *)(a1 + 12) += *(_DWORD *)(a2 + 12);
    }
    *(_DWORD *)(a1 + 16) += *(_DWORD *)(a2 + 16);
  }

  return v4;
}

uint64_t sub_100014020(uint64_t a1, uint64_t a2)
{
  if (!strcmp(*(const char **)a1, *(const char **)a2))
  {
    uint64_t v4 = "Cannot merge statistics with mismatching classes";
  }

  else
  {
    uint64_t v4 = "Cannot merge statistics with mismatching names";
  }

  return embeddedtest_error_get_error(1LL, v4);
}

uint64_t sub_100014088(uint64_t a1, uint64_t a2)
{
  LODWORD(__count) = 0;
  uint64_t v4 = (char *)sub_100014474(a1, a2, &__count);
  uint64_t v5 = v4;
  uint64_t v6 = __count;
  if (!(_DWORD)__count)
  {
    free(v4);
    uint64_t v8 = 0LL;
    goto LABEL_16;
  }

  uint64_t v7 = (char *)calloc(__count, 8uLL);
  if (!v7) {
    sub_100018390();
  }
  uint64_t v8 = v7;
  uint64_t v9 = 0LL;
  uint64_t v10 = 8 * v6;
  do
  {
    uint64_t v11 = *(const char **)&v5[v9];
    uint64_t v12 = sub_10001458C(a1, v11);
    uint64_t v13 = sub_10001458C(a2, v11);
    uint64_t v14 = v13;
    if (v12)
    {
      double value = (double)embeddedtest_test_case_statistic_bucket_get_value(v12);
      if (!v14) {
        goto LABEL_7;
      }
LABEL_6:
      double value = value + (double)embeddedtest_test_case_statistic_bucket_get_value(v14);
      goto LABEL_7;
    }

    double value = 0.0;
    if (v13) {
      goto LABEL_6;
    }
LABEL_7:
    *(void *)&v8[v9] = embeddedtest_test_case_statistic_bucket_create(v11, value);
    v9 += 8LL;
  }

  while (v10 != v9);
  uint64_t v16 = 0LL;
  do
  {
    uint64_t v17 = *(void **)&v5[v16];
    if (v17) {
      free(v17);
    }
    v16 += 8LL;
  }

  while (v10 != v16);
  free(v5);
  sub_100013E1C(a1);
LABEL_16:
  *(void *)(a1 + 24) = v8;
  *(_DWORD *)(a1 + memset(outputStruct, 170, 20) = v6;
  return 0LL;
}

uint64_t sub_1000141CC(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 32))
  {
    unint64_t v4 = 0LL;
    do
    {
      uint64_t v5 = *(void *)(*(void *)(a2 + 40) + 8 * v4);
      uint64_t name = (const char *)embeddedtest_test_case_statistic_metric_get_name(v5);
      uint64_t v7 = sub_1000145F4(a1, name);
      if (v7)
      {
        embeddedtest_test_case_statistic_metric_merge(v7, v5);
      }

      else
      {
        embeddedtest_test_case_statistic_metric_copy(v5);
        if (!v8) {
          sub_1000183C8();
        }
        uint64_t v9 = v8;
        uint64_t v10 = realloc(*(void **)(a1 + 40), 8LL * (*(_DWORD *)(a1 + 32) + 1));
        *(void *)(a1 + 40) = v10;
        if (!v10) {
          sub_100018400();
        }
        uint64_t v11 = *(unsigned int *)(a1 + 32);
        v10[v11] = v9;
        *(_DWORD *)(a1 + 32) = v11 + 1;
      }

      ++v4;
    }

    while (v4 < *(unsigned int *)(a2 + 32));
  }

  return 0LL;
}

uint64_t embeddedtest_test_case_statistic_get_name(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t embeddedtest_test_case_statistic_get_failure_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

void *embeddedtest_test_case_statistic_create_from_buffer(uint64_t a1, _DWORD *a2)
{
  unint64_t v4 = calloc(1uLL, 0x30uLL);
  if (!v4) {
    sub_100018438();
  }
  uint64_t v5 = v4;
  *unint64_t v4 = embeddedtest_create_string_from_buffer(a1, a2);
  uint64_t v6 = *a2;
  char v7 = *(_BYTE *)(a1 + v6);
  *a2 = v6 + 1;
  *((_BYTE *)v5 + std::iostream::~basic_iostream(v2, v3 + 8) = v7;
  *((_DWORD *)v5 + 4) = embeddedtest_deserialize_count(a1, a2);
  *((_DWORD *)v5 + 3) = embeddedtest_deserialize_count(a1, a2);
  unsigned int v8 = embeddedtest_deserialize_count(a1, a2);
  *((_DWORD *)v5 + 5) = v8;
  uint64_t v9 = calloc(v8, 8uLL);
  v5[3] = v9;
  if (!v9) {
    sub_100018470();
  }
  if (*((_DWORD *)v5 + 5))
  {
    unint64_t v10 = 0LL;
    do
      *(void *)(v5[3] + 8 * v10++) = embeddedtest_test_case_statistic_bucket_create_from_buffer(a1, a2);
    while (v10 < *((unsigned int *)v5 + 5));
  }

  unsigned int v11 = embeddedtest_deserialize_count(a1, a2);
  *((_DWORD *)v5 + std::iostream::~basic_iostream(v2, v3 + 8) = v11;
  uint64_t v12 = calloc(v11, 8uLL);
  v5[5] = v12;
  if (!v12) {
    sub_1000184A8();
  }
  if (*((_DWORD *)v5 + 8))
  {
    unint64_t v13 = 0LL;
    do
      *(void *)(v5[5] + 8 * v13++) = embeddedtest_test_case_statistic_metric_create_from_buffer(a1, a2);
    while (v13 < *((unsigned int *)v5 + 8));
  }

  return v5;
}

uint64_t embeddedtest_test_case_statistic_get_size(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 20))
  {
    unint64_t v2 = 0LL;
    int v3 = 0;
    do
      v3 += embeddedtest_test_case_statistic_bucket_get_size(*(const char ***)(*(void *)(a1 + 24) + 8 * v2++));
    while (v2 < *(unsigned int *)(a1 + 20));
    int v4 = v3 + 21;
  }

  else
  {
    int v4 = 21;
  }

  if (*(_DWORD *)(a1 + 32))
  {
    unint64_t v5 = 0LL;
    int v6 = 0;
    do
      v6 += embeddedtest_test_case_statistic_metric_get_size(*(const char ***)(*(void *)(a1 + 40) + 8 * v5++));
    while (v5 < *(unsigned int *)(a1 + 32));
  }

  else
  {
    int v6 = 0;
  }

  return v4 + v6 + strlen(*(const char **)a1);
}

void *sub_100014474(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  unsigned int v6 = *(_DWORD *)(a1 + 20);
  if (v6 <= 1) {
    size_t v7 = 1LL;
  }
  else {
    size_t v7 = v6;
  }
  unsigned int v8 = calloc(v7, 8uLL);
  if (!v8) {
    sub_1000184E0();
  }
  uint64_t v9 = v8;
  if (*(_DWORD *)(a1 + 20))
  {
    unint64_t v10 = 0LL;
    do
    {
      uint64_t name = (const char *)embeddedtest_test_case_statistic_bucket_get_name(*(void *)(*(void *)(a1 + 24) + 8 * v10));
      uint64_t v12 = strdup(name);
      if (!v12) {
        sub_100018588();
      }
      v9[v10++] = v12;
    }

    while (v10 < *(unsigned int *)(a1 + 20));
  }

  else
  {
    LODWORD(v10) = 0;
  }

  if (*(_DWORD *)(a2 + 20))
  {
    unint64_t v13 = 0LL;
    do
    {
      uint64_t v14 = (const char *)embeddedtest_test_case_statistic_bucket_get_name(*(void *)(*(void *)(a2 + 24) + 8 * v13));
      if (!sub_10001458C(a1, v14))
      {
        uint64_t v15 = strdup(v14);
        if (!v15) {
          sub_100018518();
        }
        uint64_t v16 = v15;
        uint64_t v17 = realloc(v9, 8LL * (v10 + 1));
        if (!v17) {
          sub_100018550();
        }
        uint64_t v9 = v17;
        v17[v10] = v16;
        LODWORD(v10) = v10 + 1;
      }

      ++v13;
    }

    while (v13 < *(unsigned int *)(a2 + 20));
  }

  *a3 = v10;
  return v9;
}

uint64_t sub_10001458C(uint64_t a1, const char *a2)
{
  if (!*(_DWORD *)(a1 + 20)) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  while (1)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 24) + 8 * v4);
    uint64_t name = (const char *)embeddedtest_test_case_statistic_bucket_get_name(v5);
    if (!strcmp(name, a2)) {
      break;
    }
  }

  return v5;
}

uint64_t sub_1000145F4(uint64_t a1, const char *a2)
{
  if (!*(_DWORD *)(a1 + 32)) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  while (1)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8 * v4);
    uint64_t name = (const char *)embeddedtest_test_case_statistic_metric_get_name(v5);
    if (!strcmp(a2, name)) {
      break;
    }
  }

  return v5;
}

void *embeddedtest_results_create(int a1)
{
  char v1 = a1;
  if ((a1 - 1) >= 2)
  {
    printf("Impossible results class %d\n", a1);
    return 0LL;
  }

  else
  {
    unint64_t v2 = calloc(1uLL, 0x30uLL);
    if (!v2) {
      sub_1000185C0();
    }
    int v3 = v2;
    uint64_t v4 = calloc(1uLL, 8uLL);
    v3[2] = v4;
    if (!v4) {
      sub_1000185F8();
    }
    *(void *)v3[2] = embeddedtest_info_pair_create("Embedded Test Version", "23");
    *((_DWORD *)v3 + 6) = 1;
    uint64_t v5 = calloc(1uLL, 8uLL);
    *int v3 = v5;
    if (!v5) {
      sub_100018630();
    }
    *((_DWORD *)v3 + 2) = 0;
    unsigned int v6 = calloc(1uLL, 8uLL);
    v3[4] = v6;
    if (!v6) {
      sub_100018668();
    }
    *((_DWORD *)v3 + 10) = 0;
    *((_BYTE *)v3 + 44) = v1;
  }

  return v3;
}

void embeddedtest_results_free(void *a1)
{
  if (a1)
  {
    if (*((_DWORD *)a1 + 6))
    {
      unint64_t v2 = 0LL;
      do
        embeddedtest_info_pair_free(*(void ***)(a1[2] + 8 * v2++));
      while (v2 < *((unsigned int *)a1 + 6));
    }

    int v3 = (void *)a1[2];
    if (v3) {
      free(v3);
    }
    if (*((_DWORD *)a1 + 2))
    {
      unint64_t v4 = 0LL;
      do
        embeddedtest_issue_aggregate_free(*(void ***)(*a1 + 8 * v4++));
      while (v4 < *((unsigned int *)a1 + 2));
    }

    if (*a1) {
      free((void *)*a1);
    }
    if (*((_DWORD *)a1 + 10))
    {
      unint64_t v5 = 0LL;
      do
        embeddedtest_test_case_statistic_free(*(void ***)(a1[4] + 8 * v5++));
      while (v5 < *((unsigned int *)a1 + 10));
    }

    unsigned int v6 = (void *)a1[4];
    if (v6) {
      free(v6);
    }
    free(a1);
  }

void *embeddedtest_results_copy_json_representation(uint64_t a1)
{
  json_string_from_array = embeddedtest_create_json_string_from_array( *(void **)(a1 + 16),  *(_DWORD *)(a1 + 24),  "%s,%s",  (uint64_t (*)(void))embeddedtest_info_pair_copy_json_representation);
  int v3 = embeddedtest_create_json_string_from_array( *(void **)a1,  *(_DWORD *)(a1 + 8),  "%s,%s",  (uint64_t (*)(void))embeddedtest_issue_aggregate_copy_json_representation);
  unint64_t v4 = embeddedtest_create_json_string_from_array( *(void **)(a1 + 32),  *(_DWORD *)(a1 + 40),  "%s,%s",  (uint64_t (*)(void))embeddedtest_test_case_statistic_copy_json_representation);
  embeddedtest_asprintf( &v12,  "{Info:{%s},Issues:[%s],Test Cases:[%s]}",  v5,  v6,  v7,  v8,  v9,  v10,  (char)json_string_from_array);
  if (json_string_from_array) {
    free(json_string_from_array);
  }
  if (v3) {
    free(v3);
  }
  if (v4) {
    free(v4);
  }
  return v12;
}

_BYTE *embeddedtest_results_create_from_resume_data(uint64_t a1)
{
  unint64_t v2 = calloc(1uLL, 0x30uLL);
  if (!v2) {
    sub_1000186A0();
  }
  int v3 = v2;
  int v14 = 0;
  embeddedtest_deserialize_size(a1, &v14);
  v3[44] = embeddedtest_deserialize_results_class(a1, &v14);
  unsigned int v4 = embeddedtest_deserialize_count(a1, &v14);
  *((_DWORD *)v3 + 6) = v4;
  uint64_t v5 = calloc(v4, 8uLL);
  *((void *)v3 + 2) = v5;
  if (!v5) {
    sub_1000186D8();
  }
  if (*((_DWORD *)v3 + 6))
  {
    unint64_t v6 = 0LL;
    do
      *(void *)(*((void *)v3 + 2) + 8 * v6++) = embeddedtest_info_pair_create_from_buffer(a1, &v14);
    while (v6 < *((unsigned int *)v3 + 6));
  }

  unsigned int v7 = embeddedtest_deserialize_count(a1, &v14);
  *((_DWORD *)v3 + 2) = v7;
  uint64_t v8 = calloc(v7, 8uLL);
  *(void *)int v3 = v8;
  if (!v8) {
    sub_100018710();
  }
  if (*((_DWORD *)v3 + 2))
  {
    unint64_t v9 = 0LL;
    do
      *(void *)(*(void *)v3 + 8 * v9++) = embeddedtest_issue_aggregate_create_from_buffer(a1, &v14);
    while (v9 < *((unsigned int *)v3 + 2));
  }

  unsigned int v10 = embeddedtest_deserialize_count(a1, &v14);
  *((_DWORD *)v3 + 10) = v10;
  unsigned int v11 = calloc(v10, 8uLL);
  *((void *)v3 + 4) = v11;
  if (!v11) {
    sub_100018748();
  }
  if (*((_DWORD *)v3 + 10))
  {
    unint64_t v12 = 0LL;
    do
      *(void *)(*((void *)v3 + 4) + 8 * v12++) = embeddedtest_test_case_statistic_create_from_buffer(a1, &v14);
    while (v12 < *((unsigned int *)v3 + 10));
  }

  return v3;
}

uint64_t embeddedtest_results_get_size(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 24))
  {
    unint64_t v2 = 0LL;
    int v3 = 0;
    do
      v3 += embeddedtest_info_pair_get_size(*(const char ***)(*(void *)(a1 + 16) + 8 * v2++));
    while (v2 < *(unsigned int *)(a1 + 24));
    int v4 = v3 + 17;
  }

  else
  {
    int v4 = 17;
  }

  if (*(_DWORD *)(a1 + 8))
  {
    unint64_t v5 = 0LL;
    int v6 = 0;
    do
      v6 += embeddedtest_issue_aggregate_get_size(*(const char ***)(*(void *)a1 + 8 * v5++));
    while (v5 < *(unsigned int *)(a1 + 8));
  }

  else
  {
    int v6 = 0;
  }

  if (*(_DWORD *)(a1 + 40))
  {
    unint64_t v7 = 0LL;
    int v8 = 0;
    do
      v8 += embeddedtest_test_case_statistic_get_size(*(void *)(*(void *)(a1 + 32) + 8 * v7++));
    while (v7 < *(unsigned int *)(a1 + 40));
  }

  else
  {
    int v8 = 0;
  }

  return (v4 + v6 + v8);
}

uint64_t embeddedtest_results_test_case_print(uint64_t a1)
{
  if (!a1) {
    return embeddedtest_error_get_error(1LL, "Cannot print tests cases for NULL result to syslog");
  }
  if (*(_DWORD *)(a1 + 40))
  {
    unint64_t v2 = 0LL;
    do
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8 * v2);
      else {
        int v4 = "[Pass]";
      }
      uint64_t name = (const char *)embeddedtest_results_get_name(a1);
      int v6 = (const char *)embeddedtest_test_case_statistic_get_name(v3);
      printf("%s %s/%s\n", v4, name, v6);
      ++v2;
    }

    while (v2 < *(unsigned int *)(a1 + 40));
  }

  return 0LL;
}

uint64_t embeddedtest_results_get_name(uint64_t a1)
{
  if (!a1 || !*(_DWORD *)(a1 + 24)) {
    return 0LL;
  }
  uint64_t v2 = 0LL;
  while (1)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 16) + 8 * v2);
    key = (const char *)embeddedtest_info_pair_get_key(v3);
    if (!strcmp("Name", key)) {
      break;
    }
  }

  return embeddedtest_info_pair_get_value(v3);
}

uint64_t embeddedtest_results_add_test_case(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = embeddedtest_test_case_result_check_validity(a2);
  uint64_t name = (const char *)embeddedtest_test_case_result_get_name(a2);
  if ((_DWORD)v4)
  {
    embeddedtest_log_error(v4);
    int v6 = (void **)embeddedtest_issue_create();
    __s1 = 0LL;
    embeddedtest_asprintf((void **)&__s1, "Had to drop an instance of %s (%d)", v7, v8, v9, v10, v11, v12, (char)name);
    embeddedtest_issue_set_reason(v6, __s1);
    if (__s1) {
      free(__s1);
    }
    int v13 = time(0LL);
    embeddedtest_issue_set_time((uint64_t)v6, v13);
    embeddedtest_issue_set_class((uint64_t)v6, 3);
    embeddedtest_issue_set_group((uint64_t)v6, "libembeddedtest");
    embeddedtest_results_add_issue(a1, (uint64_t)v6);
    embeddedtest_issue_free(v6);
    return v4;
  }

  if (*(_BYTE *)(a1 + 44) == 1 && embeddedtest_test_case_result_is_histogram(a2)) {
    return embeddedtest_error_get_error(3LL, "Unit test results only accept pass fail test cases");
  }
  uint64_t v15 = sub_100014F40(a1, name);
  if (!v15)
  {
    uint64_t v16 = embeddedtest_test_case_statistic_create(a2);
    if (!v16) {
      sub_100018780();
    }
    uint64_t v17 = v16;
    unint64_t v18 = realloc(*(void **)(a1 + 32), 8LL * (*(_DWORD *)(a1 + 40) + 1));
    *(void *)(a1 + 32) = v18;
    if (!v18) {
      sub_1000187B8();
    }
    uint64_t v4 = 0LL;
    uint64_t v19 = *(unsigned int *)(a1 + 40);
    v18[v19] = v17;
    *(_DWORD *)(a1 + 40) = v19 + 1;
    return v4;
  }

  if (*(_BYTE *)(a1 + 44) == 1) {
    return embeddedtest_error_get_error(1LL, "Unit test results cannot accept two instances of the same test case");
  }
  else {
    return embeddedtest_test_case_statistic_add_result(v15, a2);
  }
}

uint64_t embeddedtest_results_add_issue(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = embeddedtest_issue_check_validity(a2);
  if ((_DWORD)v4)
  {
    uint64_t v5 = v4;
    int v6 = (void **)embeddedtest_issue_create();
    __s1 = 0LL;
    embeddedtest_asprintf((void **)&__s1, "Had to drop an issue (%d)", v7, v8, v9, v10, v11, v12, v5);
    embeddedtest_issue_set_reason(v6, __s1);
    if (__s1) {
      free(__s1);
    }
    int v13 = time(0LL);
    embeddedtest_issue_set_time((uint64_t)v6, v13);
    embeddedtest_issue_set_class((uint64_t)v6, 3);
    embeddedtest_issue_set_group((uint64_t)v6, "libembeddedtest");
    embeddedtest_results_add_issue(a1, v6);
    embeddedtest_issue_free(v6);
    return v5;
  }

  uint64_t v15 = sub_100014FAC(a1, a2);
  if (!v15)
  {
    uint64_t v16 = embeddedtest_issue_aggregate_create(a2);
    if (!v16) {
      sub_1000187F0();
    }
    uint64_t v17 = v16;
    unint64_t v18 = realloc(*(void **)a1, 8LL * (*(_DWORD *)(a1 + 8) + 1));
    *(void *)a1 = v18;
    if (!v18) {
      sub_100018828();
    }
    uint64_t v5 = 0LL;
    uint64_t v19 = *(unsigned int *)(a1 + 8);
    v18[v19] = v17;
    *(_DWORD *)(a1 + std::iostream::~basic_iostream(v2, v3 + 8) = v19 + 1;
    return v5;
  }

  return embeddedtest_issue_aggregate_merge_with_issue(v15, a2);
}

uint64_t sub_100014F40(uint64_t a1, const char *a2)
{
  if (!*(_DWORD *)(a1 + 40)) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  while (1)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8 * v4);
    uint64_t name = (const char *)embeddedtest_test_case_statistic_get_name(v5);
    if (!strcmp(a2, name)) {
      break;
    }
  }

  return v5;
}

uint64_t sub_100014FAC(uint64_t a1, uint64_t a2)
{
  if (!*(_DWORD *)(a1 + 8)) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  while (1)
  {
    uint64_t v5 = *(void *)(*(void *)a1 + 8 * v4);
    reason = (const char *)embeddedtest_issue_get_reason(a2);
    group = (const char *)embeddedtest_issue_get_group(a2);
    int v8 = embeddedtest_issue_get_class(a2);
    uint64_t v9 = (const char *)embeddedtest_issue_aggregate_get_reason(v5);
    uint64_t v10 = (const char *)embeddedtest_issue_aggregate_get_group(v5);
    int v11 = embeddedtest_issue_aggregate_get_class(v5);
    if (!strcmp(reason, v9) && !strcmp(group, v10) && v8 == v11) {
      break;
    }
  }

  return v5;
}

BOOL embeddedtest_results_did_pass(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 44) != 1 || *(_DWORD *)(a1 + 8)) {
    return 0LL;
  }
  if (!*(_DWORD *)(a1 + 40)) {
    return 1LL;
  }
  unint64_t v3 = 0LL;
  do
  {
    int failure_count = embeddedtest_test_case_statistic_get_failure_count(*(void *)(*(void *)(a1 + 32) + 8 * v3));
    BOOL result = failure_count == 0;
    if (failure_count) {
      break;
    }
    ++v3;
  }

  while (v3 < *(unsigned int *)(a1 + 40));
  return result;
}

double *embeddedtest_test_case_metric_create(const char *a1, double a2)
{
  if (a1)
  {
    uint64_t v4 = (double *)calloc(1uLL, 0x10uLL);
    if (!v4) {
      sub_100018860();
    }
    uint64_t v5 = v4;
    int v6 = strdup(a1);
    *(void *)uint64_t v5 = v6;
    if (!v6) {
      sub_100018898();
    }
    v5[1] = a2;
  }

  else
  {
    printf("Unable to create a test case metric with a NULL name...%s\n", 0LL);
    return 0LL;
  }

  return v5;
}

void embeddedtest_test_case_metric_free(void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2) {
      free(v2);
    }
    free(a1);
  }

uint64_t embeddedtest_test_case_metric_get_name(uint64_t a1)
{
  return *(void *)a1;
}

double embeddedtest_test_case_metric_get_value(uint64_t a1)
{
  return *(double *)(a1 + 8);
}

double embeddedtest_deserialize_metric_value(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *a2;
  double result = *(double *)(a1 + v2);
  *a2 = v2 + 8;
  return result;
}

_BYTE *embeddedtest_issue_create()
{
  double result = calloc(1uLL, 0x20uLL);
  if (!result) {
    sub_1000188D0();
  }
  result[24] = 3;
  *((void *)result + 2) = 0LL;
  *(void *)double result = 0LL;
  *((_DWORD *)result + 2) = 0;
  return result;
}

void embeddedtest_issue_free(void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2) {
      free(v2);
    }
    unint64_t v3 = a1[2];
    if (v3) {
      free(v3);
    }
    free(a1);
  }

char *embeddedtest_convert_error_class_to_string(char a1)
{
  else {
    return (&off_100020700)[(char)(a1 - 1)];
  }
}

uint64_t embeddedtest_issue_set_reason(void **a1, char *__s1)
{
  if (!a1)
  {
    uint64_t v7 = "Cannot set the reason for a NULL issue";
    return embeddedtest_error_get_error(1LL, v7);
  }

  if (!__s1)
  {
    uint64_t v7 = "Cannot set issue reason to NULL";
    return embeddedtest_error_get_error(1LL, v7);
  }

  uint64_t v4 = *a1;
  if (v4) {
    free(v4);
  }
  uint64_t v5 = strdup(__s1);
  *a1 = v5;
  if (!v5) {
    sub_100018908();
  }
  return 0LL;
}

uint64_t embeddedtest_issue_set_group(uint64_t a1, char *__s1)
{
  if (!a1)
  {
    uint64_t v7 = "Cannot set the group for a NULL issue";
    return embeddedtest_error_get_error(1LL, v7);
  }

  if (!__s1)
  {
    uint64_t v7 = "Cannot set issue group to NULL";
    return embeddedtest_error_get_error(1LL, v7);
  }

  uint64_t v4 = *(void **)(a1 + 16);
  if (v4) {
    free(v4);
  }
  uint64_t v5 = strdup(__s1);
  *(void *)(a1 + 16) = v5;
  if (!v5) {
    sub_100018940();
  }
  return 0LL;
}

uint64_t embeddedtest_issue_set_time(uint64_t a1, int a2)
{
  if (a1)
  {
    if (a2)
    {
      *(_DWORD *)(a1 + std::iostream::~basic_iostream(v2, v3 + 8) = a2;
      return 0LL;
    }

    unint64_t v3 = "Cannot set issue time to 0";
  }

  else
  {
    unint64_t v3 = "Cannot set the time for a NULL issue";
  }

  return embeddedtest_error_get_error(1LL, v3);
}

uint64_t embeddedtest_issue_set_class(uint64_t a1, int a2)
{
  if (a1)
  {
    if ((a2 - 1) < 4)
    {
      *(_BYTE *)(a1 + 24) = a2;
      return 0LL;
    }

    unint64_t v3 = "Error class requested does not match anything in enum";
  }

  else
  {
    unint64_t v3 = "Cannot set the class for a NULL issue";
  }

  return embeddedtest_error_get_error(1LL, v3);
}

uint64_t embeddedtest_issue_get_reason(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t embeddedtest_issue_get_group(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t embeddedtest_issue_get_class(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t embeddedtest_issue_check_validity(uint64_t a1)
{
  if (!a1)
  {
    uint64_t v2 = "Unable to check validity of NULL issue";
    uint64_t v3 = 1LL;
    return embeddedtest_error_get_error(v3, v2);
  }

  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = "Issue must have a group";
LABEL_11:
    uint64_t v3 = 2LL;
    return embeddedtest_error_get_error(v3, v2);
  }

  if (!*(void *)a1)
  {
    uint64_t v2 = "Issue must have a reason";
    goto LABEL_11;
  }

  else {
    return 0LL;
  }
}

char **embeddedtest_issue_aggregate_create(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = (char **)calloc(1uLL, 0x20uLL);
    if (!v2) {
      sub_100018978();
    }
    uint64_t v3 = v2;
    reason = (const char *)embeddedtest_issue_get_reason(a1);
    uint64_t v5 = strdup(reason);
    *uint64_t v3 = v5;
    if (!v5) {
      sub_1000189B0();
    }
    group = (const char *)embeddedtest_issue_get_group(a1);
    uint64_t v7 = strdup(group);
    v3[2] = v7;
    if (!v7) {
      sub_1000189E8();
    }
    *((_BYTE *)v3 + 24) = embeddedtest_issue_get_class(a1);
    *((_DWORD *)v3 + 2) = 1;
  }

  else
  {
    puts("embeddedtest_issue_t object is required to create an issue aggregate");
    return 0LL;
  }

  return v3;
}

void embeddedtest_issue_aggregate_free(void **a1)
{
  if (a1)
  {
    uint64_t v2 = a1[2];
    if (v2) {
      free(v2);
    }
    if (*a1) {
      free(*a1);
    }
    free(a1);
  }

uint64_t embeddedtest_issue_aggregate_get_reason(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t embeddedtest_issue_aggregate_get_group(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t embeddedtest_issue_aggregate_get_class(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

void *embeddedtest_issue_aggregate_copy_json_representation(uint64_t a1)
{
  return v9;
}

uint64_t embeddedtest_issue_aggregate_merge_with_issue(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void **)embeddedtest_issue_aggregate_create(a2);
  uint64_t v4 = embeddedtest_issue_aggregate_merge_with_aggregate(a1, (uint64_t)v3);
  embeddedtest_issue_aggregate_free(v3);
  return v4;
}

uint64_t embeddedtest_issue_aggregate_merge_with_aggregate(uint64_t a1, uint64_t a2)
{
  if (!strcmp(*(const char **)a1, *(const char **)a2))
  {
    if (!strcmp(*(const char **)(a1 + 16), *(const char **)(a2 + 16)))
    {
      if (*(unsigned __int8 *)(a1 + 24) == *(unsigned __int8 *)(a2 + 24))
      {
        *(_DWORD *)(a1 + 8) += *(_DWORD *)(a2 + 8);
        return 0LL;
      }

      uint64_t v4 = "Cannot merge issues with different classes";
    }

    else
    {
      uint64_t v4 = "Cannot merge issues with different groups";
    }
  }

  else
  {
    uint64_t v4 = "Cannot merge issues with different reasons";
  }

  return embeddedtest_error_get_error(1LL, v4);
}

void *embeddedtest_issue_aggregate_create_from_buffer(uint64_t a1, _DWORD *a2)
{
  uint64_t v4 = calloc(1uLL, 0x20uLL);
  if (!v4) {
    sub_100018A20();
  }
  uint64_t v5 = v4;
  *uint64_t v4 = embeddedtest_create_string_from_buffer(a1, a2);
  v5[2] = embeddedtest_create_string_from_buffer(a1, a2);
  *((_DWORD *)v5 + 2) = embeddedtest_deserialize_count(a1, a2);
  uint64_t v6 = *a2;
  char v7 = *(_BYTE *)(a1 + v6);
  *a2 = v6 + 1;
  *((_BYTE *)v5 + 24) = v7;
  return v5;
}

uint64_t embeddedtest_issue_aggregate_get_size(const char **a1)
{
  int v2 = strlen(*a1);
  return v2 + strlen(a1[2]) + 13;
}

uint64_t embeddedtest_deserialize_size(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *a2;
  uint64_t result = *(unsigned int *)(a1 + v2);
  *a2 = v2 + 4;
  return result;
}

uint64_t embeddedtest_deserialize_count(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *a2;
  uint64_t result = *(unsigned int *)(a1 + v2);
  *a2 = v2 + 4;
  return result;
}

_BYTE *embeddedtest_create_string_from_buffer(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *a2;
  size_t v3 = *(unsigned int *)(a1 + v2);
  *a2 = v2 + 4;
  uint64_t v6 = calloc(1uLL, v3 + 1);
  if (!v6) {
    sub_100018A70();
  }
  char v7 = v6;
  memcpy(v6, (const void *)(a1 + *a2), v3);
  v7[v3] = 0;
  *a2 += v3;
  return v7;
}

uint64_t embeddedtest_deserialize_flags(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *a2;
  uint64_t result = *(unsigned int *)(a1 + v2);
  *a2 = v2 + 4;
  return result;
}

uint64_t embeddedtest_deserialize_results_class(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *a2;
  uint64_t result = *(unsigned __int8 *)(a1 + v2);
  *a2 = v2 + 1;
  return result;
}

uint64_t embeddedtest_deserialize_test_suite_class(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *a2;
  uint64_t result = *(unsigned __int8 *)(a1 + v2);
  *a2 = v2 + 1;
  return result;
}

uint64_t embeddedtest_deserialize_BOOL(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *a2;
  char v3 = *(_BYTE *)(a1 + v2);
  *a2 = v2 + 1;
  return v3 & 1;
}

uint64_t embeddedtest_deserialize_time(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *a2;
  uint64_t result = *(unsigned int *)(a1 + v2);
  *a2 = v2 + 4;
  return result;
}

uint64_t embeddedtest_test_suite_get_name(uint64_t a1)
{
  return *(void *)a1;
}

unsigned int *embeddedtest_test_suite_create_from_resume_data(uint64_t a1)
{
  uint64_t v2 = (unsigned int *)calloc(1uLL, 0x38uLL);
  if (!v2) {
    sub_100018AA8();
  }
  char v3 = v2;
  int v8 = 0;
  embeddedtest_deserialize_size(a1, &v8);
  *(void *)char v3 = embeddedtest_create_string_from_buffer(a1, &v8);
  unsigned int v4 = embeddedtest_deserialize_count(a1, &v8);
  v3[8] = v4;
  uint64_t v5 = calloc(v4, 8uLL);
  *((void *)v3 + 3) = v5;
  if (!v5) {
    sub_100018AE0();
  }
  if (v3[8])
  {
    unint64_t v6 = 0LL;
    do
      *(void *)(*((void *)v3 + 3) + 8 * v6++) = embeddedtest_test_case_create_from_buffer(a1, &v8);
    while (v6 < v3[8]);
  }

  *((_BYTE *)v3 + 36) = embeddedtest_deserialize_test_suite_class(a1, &v8);
  *((_BYTE *)v3 + 37) = embeddedtest_deserialize_BOOL(a1, &v8);
  v3[10] = embeddedtest_deserialize_count(a1, &v8);
  v3[11] = embeddedtest_deserialize_time(a1, &v8);
  *((_BYTE *)v3 + 4std::iostream::~basic_iostream(v2, v3 + 8) = 0;
  return v3;
}

uint64_t embeddedtest_test_suite_get_size(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 32))
  {
    unint64_t v2 = 0LL;
    int v3 = 0;
    do
      v3 += embeddedtest_test_case_get_size(*(const char ***)(*(void *)(a1 + 24) + 8 * v2++));
    while (v2 < *(unsigned int *)(a1 + 32));
    int v4 = v3 + 22;
  }

  else
  {
    int v4 = 22;
  }

  return v4 + strlen(*(const char **)a1);
}

uint64_t embeddedtest_test_suite_get_test_cases(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 32);
  return *(void *)(a1 + 24);
}

_DWORD *embeddedtest_test_case_statistic_bucket_create(const char *a1, int a2)
{
  if (a1)
  {
    int v4 = calloc(1uLL, 0x10uLL);
    if (!v4) {
      sub_100018B18();
    }
    uint64_t v5 = v4;
    unint64_t v6 = strdup(a1);
    *(void *)uint64_t v5 = v6;
    if (!v6) {
      sub_100018B50();
    }
    v5[2] = a2;
  }

  else
  {
    puts("Unable to create a statistic bucket with a null name");
    return 0LL;
  }

  return v5;
}

void embeddedtest_test_case_statistic_bucket_free(void **a1)
{
  if (a1)
  {
    unint64_t v2 = *a1;
    if (v2) {
      free(v2);
    }
    free(a1);
  }

uint64_t embeddedtest_test_case_statistic_bucket_get_value(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t embeddedtest_test_case_statistic_bucket_get_name(uint64_t a1)
{
  return *(void *)a1;
}

void *embeddedtest_test_case_statistic_bucket_copy_json_representation(const char **a1)
{
  char v1 = (char *)*a1;
  int v2 = strlen(*a1);
  int v3 = embeddedtest_escape_json_string(v1, v2);
  embeddedtest_asprintf(&v11, "%s:%d", v4, v5, v6, v7, v8, v9, (char)v3);
  if (v3) {
    free(v3);
  }
  return v11;
}

void *embeddedtest_test_case_statistic_bucket_create_from_buffer(uint64_t a1, _DWORD *a2)
{
  uint64_t v4 = calloc(1uLL, 0x10uLL);
  if (!v4) {
    sub_100018B88();
  }
  uint64_t v5 = v4;
  *uint64_t v4 = embeddedtest_create_string_from_buffer(a1, a2);
  *((_DWORD *)v5 + 2) = embeddedtest_deserialize_count(a1, a2);
  return v5;
}

uint64_t embeddedtest_test_case_statistic_bucket_get_size(const char **a1)
{
  return strlen(*a1) + 8;
}

uint64_t embeddedtest_error_get_error(uint64_t a1, const char *a2)
{
  else {
    int v3 = (&off_100020720)[(__int16)(a1 - 1)];
  }
  printf("Error seen...%s - %s\n", v3, a2);
  return a1;
}

uint64_t embeddedtest_log_error(__int16 a1)
{
  else {
    char v1 = (&off_100020720)[(__int16)(a1 - 1)];
  }
  return printf("Error: %s\n", v1);
}

void *embeddedtest_test_case_create(const char *a1, const char *a2, uint64_t a3, uint64_t a4, int a5)
{
  if (a1 && a2)
  {
    uint64_t v10 = calloc(1uLL, 0x28uLL);
    if (!v10) {
      sub_100018BC0();
    }
    int v11 = v10;
    void *v10 = strdup(a1);
    v11[1] = strdup(a2);
    unint64_t v11[2] = a3;
    v11[3] = a4;
    *((_DWORD *)v11 + std::iostream::~basic_iostream(v2, v3 + 8) = a5;
    *((_BYTE *)v11 + 36) = 0;
  }

  else
  {
    printf("Test cases require a name and category (uint64_t name = %s, category = %s)\n", a1, a2);
    return 0LL;
  }

  return v11;
}

uint64_t embeddedtest_test_case_get_name(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t embeddedtest_test_case_get_flags(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

void *embeddedtest_test_case_create_from_buffer(uint64_t a1, _DWORD *a2)
{
  string_from_buffer = embeddedtest_create_string_from_buffer(a1, a2);
  uint64_t v5 = embeddedtest_create_string_from_buffer(a1, a2);
  int v6 = embeddedtest_deserialize_flags(a1, a2);
  return embeddedtest_test_case_create(string_from_buffer, v5, 0LL, 0LL, v6);
}

uint64_t embeddedtest_test_case_get_size(const char **a1)
{
  int v2 = strlen(*a1);
  return v2 + strlen(a1[1]) + 12;
}

char **embeddedtest_info_pair_create(const char *a1, const char *a2)
{
  if (a1 && a2)
  {
    uint64_t v4 = (char **)calloc(1uLL, 0x10uLL);
    if (!v4) {
      sub_100018BF8();
    }
    uint64_t v5 = v4;
    int v6 = strdup(a1);
    *uint64_t v5 = v6;
    if (!v6) {
      sub_100018C30();
    }
    uint64_t v7 = strdup(a2);
    v5[1] = v7;
    if (!v7) {
      sub_100018C68();
    }
  }

  else
  {
    printf("Key and value are required to create info pair.  Key was %s and value was %s\n", a1, a2);
    return 0LL;
  }

  return v5;
}

void embeddedtest_info_pair_free(void **a1)
{
  if (a1)
  {
    int v2 = *a1;
    if (v2) {
      free(v2);
    }
    int v3 = a1[1];
    if (v3) {
      free(v3);
    }
    free(a1);
  }

uint64_t embeddedtest_info_pair_get_key(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t embeddedtest_info_pair_get_value(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

void *embeddedtest_info_pair_copy_json_representation( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return v9;
}

char **embeddedtest_info_pair_create_from_buffer(uint64_t a1, _DWORD *a2)
{
  string_from_buffer = embeddedtest_create_string_from_buffer(a1, a2);
  uint64_t v5 = embeddedtest_create_string_from_buffer(a1, a2);
  int v6 = embeddedtest_info_pair_create(string_from_buffer, v5);
  if (string_from_buffer) {
    free(string_from_buffer);
  }
  if (v5) {
    free(v5);
  }
  return v6;
}

uint64_t embeddedtest_info_pair_get_size(const char **a1)
{
  int v2 = strlen(*a1);
  return v2 + strlen(a1[1]) + 8;
}

void sub_100015F10()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100015F98()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100016020()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_1000160A8()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100016130()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_1000161B8()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100016240()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_1000162C8()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100016350()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_1000163D8()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100016460()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_1000164E8()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100016570()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_1000165F8()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100016680()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100016708()
{
  uint64_t v0 = _os_assert_log(0LL);
  _os_crash(v0);
  __break(1u);
}

void sub_100016720()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_1000167A8()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100016830()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_1000168B8()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100016940()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_1000169C8()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100016A50()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100016AD8()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100016B60()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100016BE8()
{
  uint64_t v0 = sub_10000C948();
  _os_crash(v0);
  __break(1u);
}

void sub_100016BFC()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  2u);
  sub_10000C950();
}

void sub_100016C94()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100016D1C()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  2u);
  sub_10000C950();
}

void sub_100016DB4()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  2u);
  sub_10000C950();
}

void sub_100016E4C()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  2u);
  sub_10000C950();
}

void sub_100016EE4()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Gigalocker partition does not exist",  v0,  2u);
}

void sub_100016F28()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  2u);
  sub_10000C950();
}

void sub_100016FC0()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100017048()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_1000170D0()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100017158()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_1000171E0()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100017268()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_1000172F0()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100017378()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100017400()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100017488()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100017510()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100017598()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100017620()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_1000176A8()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100017730()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_1000177B8()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100017840()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_1000178C8()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100017950()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_1000179D8(void *a1, int a2)
{
}

void sub_100017A20()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100017AA8()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100017B30()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100017BB8()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100017C40()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  2u);
  sub_10000C950();
}

void sub_100017CD8()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  2u);
  sub_10000C950();
}

void sub_100017D70()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  2u);
  sub_10000C950();
}

void sub_100017E08()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  2u);
  sub_10000C950();
}

void sub_100017EA0()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  2u);
  sub_10000C950();
}

void sub_100017F38()
{
  sub_1000044A8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n",  v1,  v2,  v3,  v4,  v5);
  sub_1000044CC();
}

void sub_100017FC0()
{
  uint64_t v0 = __error();
  uint64_t v1 = strerror(*v0);
  int v2 = 136315138;
  uint64_t v3 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "could not get the machine's unique identifier, reason: %s",  (uint8_t *)&v2,  0xCu);
}

void sub_100018048()
{
}

void sub_100018080()
{
}

void sub_1000180B8()
{
}

void sub_1000180F0()
{
}

void sub_100018128()
{
}

void sub_100018160()
{
}

void sub_100018198()
{
}

void sub_1000181D0()
{
}

void sub_100018208()
{
}

void sub_100018240()
{
}

void sub_100018278()
{
}

void sub_1000182B0()
{
}

void sub_1000182E8()
{
}

void sub_100018320()
{
}

void sub_100018358()
{
}

void sub_100018390()
{
}

void sub_1000183C8()
{
}

void sub_100018400()
{
}

void sub_100018438()
{
}

void sub_100018470()
{
}

void sub_1000184A8()
{
}

void sub_1000184E0()
{
}

void sub_100018518()
{
}

void sub_100018550()
{
}

void sub_100018588()
{
}

void sub_1000185C0()
{
}

void sub_1000185F8()
{
}

void sub_100018630()
{
}

void sub_100018668()
{
}

void sub_1000186A0()
{
}

void sub_1000186D8()
{
}

void sub_100018710()
{
}

void sub_100018748()
{
}

void sub_100018780()
{
}

void sub_1000187B8()
{
}

void sub_1000187F0()
{
}

void sub_100018828()
{
}

void sub_100018860()
{
}

void sub_100018898()
{
}

void sub_1000188D0()
{
}

void sub_100018908()
{
}

void sub_100018940()
{
}

void sub_100018978()
{
}

void sub_1000189B0()
{
}

void sub_1000189E8()
{
}

void sub_100018A20()
{
}

void sub_100018A58()
{
}

void sub_100018A70()
{
}

void sub_100018AA8()
{
}

void sub_100018AE0()
{
}

void sub_100018B18()
{
}

void sub_100018B50()
{
}

void sub_100018B88()
{
}

void sub_100018BC0()
{
}

void sub_100018BF8()
{
}

void sub_100018C30()
{
}

void sub_100018C68()
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}