uint64_t makepath(const char *a1)
{
  mode_t v2;
  size_t v3;
  char *v4;
  char *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  stat v10;
  v2 = umask(0);
  v3 = (int)(strlen(a1) + 1);
  v4 = (char *)malloc(v3);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  v5 = v4;
  strlcpy(v4, a1, v3);
  v6 = *v5 == 47;
  while (1)
  {
    if (v5[v6])
    {
      if (v5[v6] != 47)
      {
        v7 = 0;
        goto LABEL_13;
      }

      v7 = 0;
      v5[v6] = 0;
    }

    else
    {
      v7 = 1;
    }

    if (mkdir(v5, 0x1EDu) && (*__error() != 17 && *__error() != 21 || stat(v5, &v10) < 0)) {
      break;
    }
    v5[v6] = 47;
LABEL_13:
    ++v6;
    if (v7)
    {
      v8 = 0LL;
      goto LABEL_17;
    }
  }

  v8 = 0xFFFFFFFFLL;
LABEL_17:
  free(v5);
  umask(v2);
  return v8;
}

FILE *racoon_pid()
{
  unsigned int v3 = 0;
  result = fopen("/var/run/racoon.pid", "r");
  if (result)
  {
    v1 = result;
    fscanf(result, "%d", &v3);
    fclose(v1);
    *(void *)v6 = 0xE00000001LL;
    int v7 = 1;
    unsigned int v8 = v3;
    bzero(v4, 0x288uLL);
    size_t v2 = 648LL;
    if (sysctl(v6, 4u, v4, &v2, 0LL, 0LL))
    {
      return 0LL;
    }

    else if (v5[0] ^ 0x6F636172 | *(_DWORD *)((char *)v5 + 3) ^ 0x6E6F6F)
    {
      return 0LL;
    }

    else
    {
      return (FILE *)v3;
    }
  }

  return result;
}

void IPSecConfigureVerboseLogging(__CFDictionary *a1, int a2)
{
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(a1, @"VerboseLogging", v3);
  CFRelease(v3);
}

uint64_t IPSecApplyConfiguration(const void *a1, const char **a2)
{
  return sub_3D14(a1, a2, 1);
}

uint64_t sub_3D14(const void *a1, const char **a2, int a3)
{
  __str[0] = 0;
  if (!isDictionary(a1))
  {
    *a2 = "IPSec dictionary not present";
    return 0xFFFFFFFFLL;
  }

  GetIntFromDict((const __CFDictionary *)a1, @"VerboseLogging", &v89, 0);
  if (!GetStrAddrFromDict((const __CFDictionary *)a1, @"LocalAddress", cStr, 256))
  {
    v10 = "incorrect local address found";
LABEL_19:
    *a2 = v10;
    goto LABEL_20;
  }

  if (!racoon_validate_cfg_str(cStr))
  {
    v10 = "invalid local address";
    goto LABEL_19;
  }

  if (!GetStrAddrFromDict((const __CFDictionary *)a1, @"RemoteAddress", v94, 256))
  {
    v10 = "incorrect remote address found";
    goto LABEL_19;
  }

  if (!racoon_validate_cfg_str(v94))
  {
    v10 = "invalid remote address";
    goto LABEL_19;
  }

  in_addr_t v6 = inet_addr(v94);
  in_addr_t v7 = v6;
  if (a3)
  {
    if (v6) {
      unsigned int v8 = v94;
    }
    else {
      unsigned int v8 = "anonymous";
    }
    v9 = __str;
    snprintf(__str, 0x100uLL, "/var/run/racoon/%s.conf", v8);
    remove(__str);
    if (stat("/var/run/racoon", &v90))
    {
      if (*__error() == 2 && makepath("/var/run/racoon"))
      {
        __error();
        snprintf(v96, 0x100uLL, "cannot create racoon configuration file path (error %d)");
LABEL_68:
        *a2 = v96;
        goto LABEL_20;
      }

      v9 = __str;
    }
  }

  else
  {
    v9 = "/dev/null";
  }

  mode_t v12 = umask(0x3Fu);
  v13 = fopen(v9, "w");
  umask(v12);
  if (!v13)
  {
    __error();
    snprintf(v96, 0x100uLL, "cannot create racoon configuration file (error %d)");
    goto LABEL_68;
  }

  if (v89)
  {
    fprintf(v13, "%s%s", TAB_LEVEL, "log debug2;\n");
    fprintf(v13, "%s%s", TAB_LEVEL, "path logfile /var/log/racoon.log;\n\n");
  }

  BOOL v14 = CFDictionaryGetValue((CFDictionaryRef)a1, @"UseAnonymousPolicy") == 0LL && v7 != 0;
  BOOL v31 = !v14;
  BOOL v82 = v14;
  v15 = v94;
  if (v31) {
    v15 = "anonymous";
  }
  snprintf(v96, 0x100uLL, "remote %s {\n", v15);
  fprintf(v13, "%s%s", TAB_LEVEL, v96);
  fprintf(v13, "%s%s", off_40008[0], "doi ipsec_doi;\n");
  v86 = v13;
  fprintf(v13, "%s%s", off_40008[0], "situation identity_only;\n");
  Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, @"AuthenticationMethod");
  if (Value) {
    v17 = Value;
  }
  else {
    v17 = @"SharedSecret";
  }
  __strlcpy_chk(__ptr, "exchange_mode ", 1024LL, 1024LL);
  v18 = CFDictionaryGetValue((CFDictionaryRef)a1, @"ExchangeMode");
  v84 = a2;
  CFIndex Count = CFArrayGetCount((CFArrayRef)v18);
  unint64_t v20 = Count - 1;
  if (Count >= 1)
  {
    CFIndex v21 = 0LL;
    if (v20 >= 2) {
      unint64_t v20 = 2LL;
    }
    unint64_t v22 = v20 + 1;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v18, v21);
      if (isString(ValueAtIndex))
      {
        if (v21) {
          __strlcat_chk(__ptr, ", ", 1024LL, 1024LL);
        }
        int v24 = CFEqual(ValueAtIndex, @"Main");
        v25 = "main";
        if (!v24)
        {
          int v26 = CFEqual(ValueAtIndex, @"Aggressive");
          v25 = "aggressive";
          if (!v26)
          {
            int v27 = CFEqual(ValueAtIndex, @"Base");
            v25 = "base";
            if (!v27)
            {
              v40 = "incorrect phase 1 exchange mode";
              goto LABEL_104;
            }
          }
        }

        __strlcat_chk(__ptr, v25, 1024LL, 1024LL);
      }
    }

    while (v22 != ++v21);
  }

  a2 = v84;
  if (!Count)
  {
LABEL_49:
    int StrFromDict = GetStrFromDict((const __CFDictionary *)a1, @"LocalIdentifier", v100, 256, "");
    if (IPSecIsAggressiveMode(v17, StrFromDict, 1)) {
      v29 = "aggressive";
    }
    else {
      v29 = "main";
    }
    __strlcat_chk(__ptr, v29, 1024LL, 1024LL);
  }

  __strlcat_chk(__ptr, ";\n", 1024LL, 1024LL);
  v30 = v13;
  fprintf(v13, "%s%s", off_40008[0], __ptr);
  if (!CFEqual(v17, @"SharedSecret") && !CFEqual(v17, @"Certificate") && !CFEqual(v17, @"Hybrid"))
  {
    v37 = "incorrect authentication method found";
    goto LABEL_258;
  }

  if (GetStrFromDict((const __CFDictionary *)a1, @"LocalIdentifierType", v99, 256, ""))
  {
    if (*(_DWORD *)v99 ^ 0x4E445146 | v99[4])
    {
      if (*(void *)v99 ^ 0x4E44514672657355LL | v99[8])
      {
        BOOL v31 = *(_DWORD *)v99 == 1232692555 && *(unsigned __int16 *)&v99[4] == 68;
        if (v31)
        {
          v32 = "keyid_use";
        }

        else if (*(void *)v99 == 0x73736572646441LL)
        {
          v32 = "address";
        }

        else
        {
          v32 = *(_DWORD *)v99 ^ 0x314E5341 | *(_DWORD *)&v99[3] ^ 0x4E4431u ? "" : "asn1dn";
        }
      }

      else
      {
        v32 = "user_fqdn";
      }
    }

    else
    {
      v32 = "fqdn";
    }

    __strlcpy_chk(v99, v32, 256LL, 256LL);
    if (!racoon_validate_cfg_str(v99))
    {
      v37 = "invalid LocalIdentifierType";
      goto LABEL_258;
    }
  }

  if (GetStrFromDict((const __CFDictionary *)a1, @"LocalIdentifier", v100, 256, ""))
  {
    if (!racoon_validate_cfg_str(v100))
    {
      v37 = "invalid LocalIdentifier";
      goto LABEL_258;
    }

    v33 = v99;
    if (!v99[0]) {
      v33 = "fqdn";
    }
    snprintf(__ptr, 0x400uLL, "my_identifier %s %s;\n", v33, v100);
    goto LABEL_79;
  }

  if (!CFEqual(v17, @"SharedSecret") && !CFEqual(v17, @"Hybrid") && CFEqual(v17, @"Certificate"))
  {
    strcpy(__ptr, "my_identifier asn1dn;\n");
LABEL_79:
    fprintf(v13, "%s%s", off_40008[0], __ptr);
  }

  v34 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, @"IdentifierVerification");
  if (!CFEqual(v34, @"None"))
  {
    if (CFEqual(v34, @"GenerateFromRemoteAddress"))
    {
      if (!GetStrAddrFromDict((const __CFDictionary *)a1, @"RemoteAddress", v100, 256))
      {
        v37 = "no remote address found";
        goto LABEL_169;
      }

      snprintf(__ptr, 0x400uLL, "peers_identifier address %s;\n", v100);
      v30 = v13;
      fprintf(v13, "%s%s", off_40008[0], __ptr);
      int v38 = CFEqual(v17, @"Certificate");
      v39 = "off";
      if (!v38) {
        v39 = "on";
      }
      int v35 = 2 * (v38 != 0);
      goto LABEL_110;
    }

    if (CFEqual(v34, @"UseRemoteIdentifier"))
    {
      v30 = v13;
      if (!GetStrFromDict((const __CFDictionary *)a1, @"RemoteIdentifier", v100, 256, ""))
      {
        v37 = "no remote identifier found";
        goto LABEL_258;
      }

      if (!racoon_validate_cfg_str(v100))
      {
        v37 = "invalid RemoteIdentifier";
        goto LABEL_258;
      }

      snprintf(__ptr, 0x400uLL, "peers_identifier fqdn %s;\n", v100);
      fprintf(v13, "%s%s", off_40008[0], __ptr);
      if (!CFEqual(v17, @"Certificate") && !CFEqual(v17, @"Hybrid"))
      {
        int v35 = 0;
        v39 = "on";
        goto LABEL_110;
      }

      int v35 = 2;
    }

    else
    {
      if (!CFEqual(v34, @"UseOpenDirectory"))
      {
        v37 = "incorrect verification method";
        goto LABEL_169;
      }

      v30 = v13;
      if (!CFEqual(v17, @"Certificate"))
      {
        v37 = "open directory can only be used with certificate authentication";
        goto LABEL_258;
      }

      int v35 = 1;
    }

    v39 = "off";
LABEL_110:
    v36 = __ptr;
    snprintf(__ptr, 0x400uLL, "verify_identifier %s;\n", v39);
    goto LABEL_111;
  }

  int v35 = 0;
  v36 = "verify_identifier off;\n";
  v30 = v86;
LABEL_111:
  fprintf(v30, "%s%s", off_40008[0], v36);
  if (CFEqual(v17, @"SharedSecret") || CFEqual(v17, @"Hybrid"))
  {
    if (!GetStrFromDict((const __CFDictionary *)a1, @"SharedSecret", v100, 256, ""))
    {
      v37 = "no shared secret found";
      goto LABEL_258;
    }

    if (!racoon_validate_cfg_str(v100))
    {
      v37 = "invalid SharedSecret";
      goto LABEL_258;
    }

    __strlcpy_chk(v99, "use", 256LL, 256LL);
    v41 = CFDictionaryGetValue((CFDictionaryRef)a1, @"SharedSecretEncryption");
    if (!isString(v41))
    {
LABEL_126:
      snprintf(__ptr, 0x400uLL, "shared_secret %s %s;\n", v99, v100);
      v30 = v86;
      fprintf(v86, "%s%s", off_40008[0], __ptr);
      if (CFEqual(v17, @"Hybrid"))
      {
        strcpy(__ptr, "certificate_verification sec_framework use_peers_identifier;\n");
LABEL_135:
        fprintf(v30, "%s%s", off_40008[0], __ptr);
        goto LABEL_136;
      }

      goto LABEL_136;
    }

    if (CFEqual(v41, @"Key"))
    {
      v42 = "key";
LABEL_125:
      __strlcpy_chk(v99, v42, 256LL, 256LL);
      goto LABEL_126;
    }

    if (CFEqual(v41, @"Keychain"))
    {
      v42 = "keychain";
      goto LABEL_125;
    }

    v37 = "incorrect shared secret encryption found";
LABEL_169:
    v30 = v86;
    goto LABEL_258;
  }

  if (CFEqual(v17, @"Certificate"))
  {
    v43 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a1, @"LocalCertificate");
    if (isData(v43))
    {
      fprintf(v86, "%s%s", off_40008[0], "certificate_type x509 in_keychain ");
      v44 = v43;
      v30 = v86;
      int v45 = sub_A060(v44, (uint64_t)__ptr);
      fwrite(__ptr, 1uLL, v45, v86);
      fputs(";\n", v86);
    }

    else
    {
      v30 = v86;
      fprintf(v86, "%s%s", off_40008[0], "certificate_type x509 in_keychain;\n");
    }

    fprintf(v30, "%s%s", off_40008[0], "verify_cert on;\n");
    v46 = " use_peers_identifier";
    if (v35 != 2) {
      v46 = "";
    }
    if (v35 == 1) {
      v46 = " use_open_dir";
    }
    snprintf(__ptr, 0x400uLL, "certificate_verification sec_framework%s;\n", v46);
    goto LABEL_135;
  }

LABEL_136:
  if (CFDictionaryContainsKey((CFDictionaryRef)a1, @"ForceLocalAddress")
    && CFDictionaryGetValue((CFDictionaryRef)a1, @"ForceLocalAddress") == kCFBooleanTrue)
  {
    GetStrAddrFromDict((const __CFDictionary *)a1, @"LocalAddress", v100, 256);
    if (racoon_validate_cfg_str(v100))
    {
      snprintf(__ptr, 0x400uLL, "local_address %s;\n", v100);
      fprintf(v30, "%s%s", off_40008[0], __ptr);
      goto LABEL_140;
    }

    v37 = "invalid force local address";
LABEL_258:
    *a2 = v37;
    goto LABEL_259;
  }

LABEL_140:
  GetIntFromDict((const __CFDictionary *)a1, @"NonceSize", v100, 16);
  snprintf(__ptr, 0x400uLL, "nonce_size %d;\n", *(_DWORD *)v100);
  fprintf(v30, "%s%s", off_40008[0], __ptr);
  if (GetIntFromDict((const __CFDictionary *)a1, @"NattMultipleUsersEnabled", v100, 0))
  {
    if (*(_DWORD *)v100) {
      v47 = "on";
    }
    else {
      v47 = "off";
    }
    snprintf(__ptr, 0x400uLL, "nat_traversal_multi_user %s;\n", v47);
    fprintf(v30, "%s%s", off_40008[0], __ptr);
  }

  if (GetIntFromDict((const __CFDictionary *)a1, @"NattKeepAliveEnabled", v100, 1))
  {
    if (*(_DWORD *)v100) {
      v48 = "on";
    }
    else {
      v48 = "off";
    }
    snprintf(__ptr, 0x400uLL, "nat_traversal_keepalive %s;\n", v48);
    fprintf(v30, "%s%s", off_40008[0], __ptr);
  }

  if (GetIntFromDict((const __CFDictionary *)a1, @"DeadPeerDetectionEnabled", v100, 0))
  {
    GetIntFromDict((const __CFDictionary *)a1, @"DeadPeerDetectionDelay", v99, 30);
    GetIntFromDict((const __CFDictionary *)a1, @"DeadPeerDetectionRetry", &v93, 5);
    GetIntFromDict((const __CFDictionary *)a1, @"DeadPeerDetectionMaxFail", &v92, 5);
    GetIntFromDict((const __CFDictionary *)a1, @"BlackHoleDetectionEnabled", &v91, 1);
    snprintf(__ptr, 0x400uLL, "dpd_delay %d;\n", *(_DWORD *)v99);
    fprintf(v30, "%s%s", off_40008[0], __ptr);
    snprintf(__ptr, 0x400uLL, "dpd_retry %d;\n", v93);
    fprintf(v30, "%s%s", off_40008[0], __ptr);
    snprintf(__ptr, 0x400uLL, "dpd_maxfail %d;\n", v92);
    fprintf(v30, "%s%s", off_40008[0], __ptr);
    if (v91) {
      v49 = "dpd_blackhole_detect";
    }
    else {
      v49 = "dpd_inbound_detect";
    }
    snprintf(__ptr, 0x400uLL, "dpd_algorithm %s;\n", v49);
    fprintf(v30, "%s%s", off_40008[0], __ptr);
  }

  if (GetIntFromDict((const __CFDictionary *)a1, @"DisconnectOnIdle", v100, 0) && *(_DWORD *)v100)
  {
    GetIntFromDict((const __CFDictionary *)a1, @"DisconnectOnIdleTimer", v99, 120);
    snprintf(__ptr, 0x400uLL, "disconnect_on_idle idle_timeout %d idle_direction idle_outbound;\n", *(_DWORD *)v99);
    fprintf(v30, "%s%s", off_40008[0], __ptr);
  }

  fprintf(v30, "%s%s", off_40008[0], "initial_contact on;\n");
  fprintf(v30, "%s%s", off_40008[0], "support_proxy on;\n");
  __strlcpy_chk(v100, "claim", 256LL, 256LL);
  v50 = CFDictionaryGetValue((CFDictionaryRef)a1, @"ProposalsBehavior");
  if (isString(v50))
  {
    if (CFEqual(v50, @"Claim"))
    {
      v51 = "claim";
    }

    else if (CFEqual(v50, @"Obey"))
    {
      v51 = "obey";
    }

    else if (CFEqual(v50, @"Strict"))
    {
      v51 = "strict";
    }

    else
    {
      if (!CFEqual(v50, @"Exact"))
      {
        *a2 = "incorrect proposal behavior";
        goto LABEL_105;
      }

      v51 = "exact";
    }

    __strlcpy_chk(v100, v51, 256LL, 256LL);
  }

  snprintf(__ptr, 0x400uLL, "proposal_check %s;\n", v100);
  v30 = v86;
  fprintf(v86, "%s%s", off_40008[0], __ptr);
  if (!racoon_validate_cfg_str(v100))
  {
    v37 = "invalid XauthName";
    goto LABEL_258;
  }

  snprintf(__ptr, 0x400uLL, "xauth_login %s;\n", v100);
  fprintf(v86, "%s%s", off_40008[0], __ptr);
LABEL_177:
  if (GetIntFromDict((const __CFDictionary *)a1, @"ModeConfigEnabled", v100, 0))
  {
    if (*(_DWORD *)v100) {
      v52 = "on";
    }
    else {
      v52 = "off";
    }
    snprintf(__ptr, 0x400uLL, "mode_cfg %s;\n", v52);
    fprintf(v86, "%s%s", off_40008[0], __ptr);
  }

  v53 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)a1, @"Proposals");
  v84 = a2;
  int v83 = a3;
  else {
    CFIndex v54 = 0LL;
  }
  CFIndex v55 = 0LL;
  v56 = 0LL;
  if (v54 <= 1) {
    uint64_t v57 = 1LL;
  }
  else {
    uint64_t v57 = v54;
  }
  uint64_t v85 = v57;
  do
  {
    if (v54)
    {
      v56 = CFArrayGetValueAtIndex(v53, v55);
      if (!isDictionary(v56))
      {
        *v84 = "incorrect phase 1 proposal";
        goto LABEL_259;
      }
    }

    fprintf(v30, "%s%s", off_40008[0], "\n");
    fprintf(v30, "%s%s", off_40008[0], "proposal {\n");
    int v93 = 0;
    v58 = CFDictionaryGetValue((CFDictionaryRef)a1, @"AuthenticationMethod");
    GetIntFromDict((const __CFDictionary *)a1, @"XAuthEnabled", &v93, 0);
    __strlcpy_chk(v99, "pre_shared_key", 256LL, 256LL);
    if (isString(v58))
    {
      if (CFEqual(v58, @"SharedSecret"))
      {
        if (v93) {
          v59 = "xauth_psk_client";
        }
        else {
          v59 = "pre_shared_key";
        }
      }

      else if (CFEqual(v58, @"Certificate"))
      {
        if (v93) {
          v59 = "xauth_rsa_client";
        }
        else {
          v59 = "rsasig";
        }
      }

      else
      {
        int v60 = CFEqual(v58, @"Hybrid");
        v59 = "hybrid_rsa_client";
        if (!v60)
        {
          v40 = "incorrect authentication method";
          goto LABEL_104;
        }
      }

      __strlcpy_chk(v99, v59, 256LL, 256LL);
    }

    snprintf(v100, 0x400uLL, "authentication_method %s;\n", v99);
    fprintf(v86, "%s%s", off_40010[0], v100);
    __strlcpy_chk(v99, "sha1", 256LL, 256LL);
    if (!v56)
    {
      snprintf(v100, 0x400uLL, "hash_algorithm %s;\n", v99);
      fprintf(v86, "%s%s", off_40010[0], v100);
      v69 = "3des";
LABEL_216:
      __strlcpy_chk(v99, v69, 256LL, 256LL);
      goto LABEL_217;
    }

    v61 = CFDictionaryGetValue((CFDictionaryRef)v56, @"HashAlgorithm");
    if (isString(v61))
    {
      int v62 = CFEqual(v61, @"MD5");
      v63 = "md5";
      if (!v62)
      {
        int v64 = CFEqual(v61, @"SHA1");
        v63 = "sha1";
        if (!v64)
        {
          int v65 = CFEqual(v61, @"SHA256");
          v63 = "sha256";
          if (!v65)
          {
            int v66 = CFEqual(v61, @"SHA512");
            v63 = "sha512";
            if (!v66)
            {
              v40 = "incorrect authentication algorithm";
              goto LABEL_104;
            }
          }
        }
      }

      __strlcpy_chk(v99, v63, 256LL, 256LL);
    }

    snprintf(v100, 0x400uLL, "hash_algorithm %s;\n", v99);
    fprintf(v86, "%s%s", off_40010[0], v100);
    __strlcpy_chk(v99, "3des", 256LL, 256LL);
    v67 = CFDictionaryGetValue((CFDictionaryRef)v56, @"EncryptionAlgorithm");
    if (isString(v67))
    {
      int v68 = CFEqual(v67, @"DES");
      v69 = "des";
      if (!v68)
      {
        int v70 = CFEqual(v67, @"3DES");
        v69 = "3des";
        if (!v70)
        {
          int v71 = CFEqual(v67, @"AES");
          v69 = "aes";
          if (!v71)
          {
            int v72 = CFEqual(v67, @"AES256");
            v69 = "aes 256";
            if (!v72)
            {
              v40 = "incorrect encryption algorithm";
LABEL_104:
              *v84 = v40;
LABEL_105:
              v30 = v86;
              goto LABEL_259;
            }
          }
        }
      }

      goto LABEL_216;
    }

LABEL_217:
    snprintf(v100, 0x400uLL, "encryption_algorithm %s;\n", v99);
    v30 = v86;
    fprintf(v86, "%s%s", off_40010[0], v100);
    *(_DWORD *)v99 = 3600;
    if (v56)
    {
      GetIntFromDict((const __CFDictionary *)v56, @"Lifetime", v99, 3600);
      snprintf(v100, 0x400uLL, "lifetime time %d sec;\n", *(_DWORD *)v99);
      fprintf(v86, "%s%s", off_40010[0], v100);
      *(_DWORD *)v99 = 14;
      GetIntFromDict((const __CFDictionary *)v56, @"DHGroup", v99, 14);
      int v73 = *(_DWORD *)v99;
    }

    else
    {
      snprintf(v100, 0x400uLL, "lifetime time %d sec;\n", 3600);
      fprintf(v86, "%s%s", off_40010[0], v100);
      int v73 = 14;
      *(_DWORD *)v99 = 14;
    }

    snprintf(v100, 0x400uLL, "dh_group %d;\n", v73);
    fprintf(v86, "%s%s", off_40010[0], v100);
    fprintf(v86, "%s%s", off_40008[0], "}\n");
    ++v55;
  }

  while (v85 != v55);
  fprintf(v86, "%s%s", TAB_LEVEL, "}\n\n");
  v74 = CFDictionaryGetValue((CFDictionaryRef)a1, @"Policies");
  if (!isArray(v74)
    || (CFIndex v75 = CFArrayGetCount((CFArrayRef)v74)) == 0
    || (!v82 ? (uint64_t v76 = 1LL) : (uint64_t v76 = v75), v76 < 1))
  {
LABEL_253:
    fclose(v30);
    if (v83) {
      sub_59EC();
    }
    return 0LL;
  }

  CFIndex v77 = 0LL;
  v78 = "incorrect policy found";
  while (2)
  {
    v79 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v74, v77);
    if (isDictionary(v79))
    {
      v80 = CFDictionaryGetValue(v79, @"Level");
      if (!CFEqual(v80, @"Require"))
      {
        v78 = "incorrect policy level found";
LABEL_272:
        v30 = v86;
        break;
      }

      if (v82)
      {
        v81 = CFDictionaryGetValue(v79, @"Mode");
        if (!isString(v81) || CFEqual(v81, @"Tunnel"))
        {
          if (!GetStrNetFromDict(v79, @"LocalAddress", __ptr, 256))
          {
            v78 = "incorrect policy local network";
            goto LABEL_272;
          }

          v30 = v86;
          if (!racoon_validate_cfg_str(__ptr))
          {
            v78 = "invalid local network";
            break;
          }

          if (!GetStrNetFromDict(v79, @"RemoteAddress", v99, 256))
          {
            v78 = "incorrect policy remote network";
            break;
          }

          if (!racoon_validate_cfg_str(v99))
          {
            v78 = "invalid remote network";
            break;
          }

          GetIntFromDict(v79, @"LocalPrefix", &v91, 24);
          if (!v91)
          {
            v78 = "incorrect policy local prefix";
            break;
          }

          GetIntFromDict(v79, @"RemotePrefix", &v88, 24);
          if (!v88)
          {
            v78 = "incorrect policy remote prefix";
            break;
          }

          snprintf(v96, 0x100uLL, "sainfo address %s/%d 0 address %s/%d 0 {\n", __ptr, v91, v99, v88);
          snprintf(v100, 0x100uLL, "sainfo address %s/%d 0 address %s/%d 0 {\n", v99, v88, __ptr, v91);
LABEL_245:
          fprintf(v30, "%s%s", TAB_LEVEL, v96);
          fprintf(v30, "%s%s", TAB_LEVEL, "}\n\n");
          if (v82)
          {
            v30 = v86;
            fprintf(v86, "%s%s", TAB_LEVEL, v100);
            fprintf(v86, "%s%s", TAB_LEVEL, "}\n\n");
          }

LABEL_249:
          ++v77;
          v30 = v86;
          if (v76 == v77) {
            goto LABEL_253;
          }
          continue;
        }

        if (!CFEqual(v81, @"Transport"))
        {
          v78 = "incorrect policy type found";
          goto LABEL_272;
        }

        GetIntFromDict(v79, @"LocalPort", &v93, 0);
        GetIntFromDict(v79, @"RemotePort", &v92, 0);
        GetIntFromDict(v79, @"Protocol", &v87, 0);
        GetIntFromDict(v79, @"LocalPrefix", &v91, 32);
        GetIntFromDict(v79, @"RemotePrefix", &v88, 32);
        snprintf( v96,  0x100uLL,  "sainfo address %s/%d [%d] %d address %s/%d [%d] %d {\n",  cStr,  v91,  v93,  v87,  v94,  v88,  v92,  v87);
        snprintf( v100,  0x100uLL,  "sainfo address %s/%d [%d] %d address %s/%d [%d] %d {\n",  v94,  v88,  v92,  v87,  cStr,  v91,  v93,  v87);
      }

      else
      {
        strcpy(v96, "sainfo anonymous {\n");
      }

      v30 = v86;
      goto LABEL_245;
    }

    break;
  }

  *v84 = v78;
LABEL_259:
  fclose(v30);
LABEL_20:
  if (__str[0]) {
    remove(__str);
  }
  return 0xFFFFFFFFLL;
}

uint64_t IPSecValidateConfiguration(const void *a1, const char **a2)
{
  return sub_3D14(a1, a2, 0);
}

uint64_t IPSecRemoveConfiguration(const void *a1, const char **a2)
{
  __str[0] = 0;
  if (!isDictionary(a1))
  {
    v5 = "IPSec dictionary not present";
LABEL_7:
    *a2 = v5;
    return 0xFFFFFFFFLL;
  }

  if (!GetStrAddrFromDict((const __CFDictionary *)a1, @"RemoteAddress", v6, 32))
  {
    v5 = "incorrect remote address found";
    goto LABEL_7;
  }

  uint64_t result = inet_addr(v6);
  if ((_DWORD)result)
  {
    snprintf(__str, 0x100uLL, "/var/run/racoon/%s.conf", v6);
    remove(__str);
    sub_59EC();
    return 0LL;
  }

  return result;
}

FILE *sub_59EC()
{
  uint64_t result = racoon_pid();
  if ((_DWORD)result) {
    return (FILE *)kill((pid_t)result, 30);
  }
  return result;
}

uint64_t IPSecRemoveConfigurationFile(const void *a1, const char **a2)
{
  __str[0] = 0;
  if (!isDictionary(a1))
  {
    v5 = "IPSec dictionary not present";
LABEL_7:
    *a2 = v5;
    return 0xFFFFFFFFLL;
  }

  if (!GetStrAddrFromDict((const __CFDictionary *)a1, @"RemoteAddress", v6, 32))
  {
    v5 = "incorrect remote address found";
    goto LABEL_7;
  }

  uint64_t result = inet_addr(v6);
  if ((_DWORD)result)
  {
    snprintf(__str, 0x100uLL, "/var/run/racoon/%s.conf", v6);
    remove(__str);
    return 0LL;
  }

  return result;
}

uint64_t IPSecKickConfiguration()
{
  return 0LL;
}

const void *IPSecCountPolicies(const __CFDictionary *a1)
{
  Value = CFDictionaryGetValue(a1, @"Policies");
  uint64_t result = isArray(Value);
  if ((_DWORD)result) {
    return (const void *)CFArrayGetCount((CFArrayRef)Value);
  }
  return result;
}

BOOL get_address_from_string(const char *a1, void *a2, size_t a3)
{
  BOOL v3 = 0LL;
  if (a1)
  {
    if (a2)
    {
      v13 = 0LL;
      int v6 = getaddrinfo(a1, 0LL, &stru_2EB98, &v13);
      BOOL v3 = v6 == 0;
      if (!v6)
      {
        in_addr_t v7 = v13;
        if (v13)
        {
          unsigned int v8 = v13;
          while (1)
          {
            ai_addr = v8->ai_addr;
            int sa_family = ai_addr->sa_family;
            if (sa_family == 30 || sa_family == 2) {
              break;
            }
            unsigned int v8 = v8->ai_next;
            if (!v8) {
              goto LABEL_14;
            }
          }

          if (ai_addr->sa_len <= a3)
          {
            bzero(a2, a3);
            memcpy(a2, v8->ai_addr, v8->ai_addr->sa_len);
          }
        }

LABEL_14:
        freeaddrinfo(v7);
      }
    }
  }

  return v3;
}

uint64_t IPSecInstallPolicies(const __CFDictionary *a1, CFIndex a2, const char **a3)
{
  socklen_t v49 = 4;
  int v46 = 255;
  int v6 = pfkey_open();
  if (v6 < 0)
  {
    v9 = "cannot open a pfkey socket";
    goto LABEL_77;
  }

  if (!GetStrAddrFromDict(a1, @"LocalAddress", v59, 256))
  {
    v9 = "incorrect local address";
    goto LABEL_77;
  }

  if (!GetStrAddrFromDict(a1, @"RemoteAddress", v58, 256))
  {
    v9 = "incorrect remote address";
    goto LABEL_77;
  }

  Value = CFDictionaryGetValue(a1, @"Policies");
  if (!isArray(Value))
  {
    v9 = "no policies found";
    goto LABEL_77;
  }

  CFIndex Count = CFArrayGetCount((CFArrayRef)Value);
  v9 = "no policies found";
  if (!Count || Count < a2)
  {
LABEL_77:
    *a3 = v9;
LABEL_78:
    SCLog(1LL, 3LL, @"Failed to add policy. Number of policies processed %d (with %d drained).\n");
    goto LABEL_79;
  }

  CFIndex v10 = a2 + 1;
  if (a2 == -1) {
    CFIndex v11 = 0LL;
  }
  else {
    CFIndex v11 = a2;
  }
  if (a2 == -1) {
    CFIndex v10 = Count;
  }
  CFIndex v40 = v10;
  if (v11 >= v10)
  {
LABEL_82:
    SCLog(1LL, 7LL, @"Number of policies processed successfully: %d (with %d drained).\n");
    uint64_t v36 = 0LL;
    goto LABEL_80;
  }

  int v12 = 0;
  int v13 = 0;
  int v14 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)Value, v11);
    if (!isDictionary(ValueAtIndex))
    {
      int v38 = "incorrect policy found";
LABEL_85:
      *a3 = v38;
      goto LABEL_78;
    }

    CFIndex v43 = v11;
    v16 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Mode");
    if (isString(v16) && !CFEqual(v16, @"Tunnel"))
    {
      if (!CFEqual(v16, @"Transport"))
      {
        int v38 = "incorrect policy type found";
        goto LABEL_85;
      }

      char v17 = 1;
    }

    else
    {
      char v17 = 0;
    }

    v18 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Direction");
    if (CFEqual(v18, @"In"))
    {
      uint64_t v44 = 0x100000000LL;
    }

    else
    {
      if (!CFEqual(v18, @"Out"))
      {
        if (!CFEqual(v18, @"InOut"))
        {
          int v38 = "incorrect policy direction found";
          goto LABEL_85;
        }

LABEL_26:
        uint64_t v44 = 0LL;
        goto LABEL_27;
      }

      uint64_t v44 = 1LL;
    }

    CFIndex v40 = makeref(a1);
    int v41 = geteuid();
    int v42 = getegid();
    CFIndex v43 = makeref(a1);
    uint64_t v44 = SCNCPluginExecCommand2( 0LL,  (uint64_t)sub_119CC,  v40,  v41,  v42,  (uint64_t)"/usr/sbin/pppd",  (uint64_t)v156,  (uint64_t)sub_11B7C,  v43);
    *(_DWORD *)(a1 + 608) = v44;
    if (v44 != -1)
    {
      v153 = 0LL;
      v152 = 0;
      int v45 = (__CFString *)kSCEntNetPPP;
      int v46 = (const __CFDictionary *)CFDictionaryGetValue(v36, kSCEntNetPPP);
      if (v46)
      {
        unsigned int v47 = v46;
        unsigned int v48 = CFGetTypeID(v46);
        if (v48 == CFDictionaryGetTypeID())
        {
          socklen_t v49 = *(_DWORD *)(a1 + 596);
          sub_10A98(v49, "[OPTIONS]");
          if (gPluginsDir)
          {
            CFStringGetCString((CFStringRef)gPluginsDir, buffer, 1024LL, 0x8000100u);
            __strlcat_chk(buffer, "PPPDialogs.ppp", 1024LL, 1024LL);
            sub_12F6C(v49, "plugin", buffer);
            if (*(_WORD *)(a1 + 66) == 5) {
              sub_12EF0(v49, "dialogtype", 1);
            }
          }

          get_int_option(a1, kSCEntNetPPP, kSCPropNetPPPVerboseLogging, (CFDictionaryRef)cf1, v36, &Count, 0);
          if (Count) {
            sub_10A98(v49, "debug");
          }
          *(_DWORD *)(a1 + 72) &= 0xFFFFFF3F;
          ppp_getoptval(a1, (CFDictionaryRef)cf1, v36, 20, (char *)&Count, 4u, &v155);
          int v50 = Count;
          if ((Count & 2) != 0) {
            *(_DWORD *)(a1 + 72) |= 0x40u;
          }
          if ((v50 & 8) != 0) {
            *(_DWORD *)(a1 + 72) |= 0x80u;
          }
          if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v36, 17, cStr, 0x100u, &v155) && cStr[0])
          {
            if (cStr[0] == 47) {
              v51 = "";
            }
            else {
              v51 = "/var/log/ppp/";
            }
            snprintf(buffer, 0x400uLL, "%s%s", v51, cStr);
            sub_12F6C(v49, "logfile", buffer);
          }

          __int16 v52 = *(const __CFString **)(a1 + 40);
          if (v52)
          {
            CFStringGetCString(v52, __str, 252LL, 0x8000100u);
            __strlcat_chk(__str, ".ppp", 256LL, 256LL);
            sub_12F6C(v49, "plugin", __str);
          }

          if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v36, 2, (char *)&Count, 4u, &v155) && Count)
          {
            snprintf(buffer, 0x400uLL, "%d", Count);
            sub_10A98(v49, buffer);
          }

          if (cf1
            && GetStrFromDict((const __CFDictionary *)cf1, @"OutgoingInterface", v157, 24, ""))
          {
            sub_12F6C(v49, "ifscope", v157);
          }

          theDict = v47;
          v149 = v49;
          if (*(_WORD *)(a1 + 66) != 5)
          {
            if (!*(_WORD *)(a1 + 66))
            {
              get_str_option( a1,  kSCEntNetInterface,  kSCPropNetInterfaceHardware,  (CFDictionaryRef)cf1,  0LL,  cStr,  0x100u,  &Count,  "");
              if (*(_DWORD *)cStr == 1701080909 && v159 == 109)
              {
                CFIndex v54 = (void *)copyEntity( (const __SCDynamicStore *)gDynamicStore,  kSCDynamicStoreDomainSetup,  *(const __CFString **)(a1 + 24),  kSCEntNetModem);
                if (v54)
                {
                  __int16 v55 = v54;
                  if (cf1)
                  {
                    int v56 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)cf1, kSCEntNetModem);
                    if (v56
                      && (uint64_t v57 = v56, v58 = CFGetTypeID(v56), v58 == CFDictionaryGetTypeID())
                      && CFDictionaryGetCount(v57)
                      && (MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, (CFDictionaryRef)v55)) != 0LL)
                    {
                      int v60 = MutableCopy;
                      v61 = CFDictionaryGetValue(v57, kSCPropNetModemConnectionScript);
                      if (v61) {
                        CFDictionarySetValue(v60, kSCPropNetModemConnectionScript, v61);
                      }
                      int v62 = CFDictionaryGetValue(v57, kSCPropNetModemSpeaker);
                      if (v62) {
                        CFDictionarySetValue(v60, kSCPropNetModemSpeaker, v62);
                      }
                      v63 = CFDictionaryGetValue(v57, kSCPropNetModemErrorCorrection);
                      if (v63) {
                        CFDictionarySetValue(v60, kSCPropNetModemErrorCorrection, v63);
                      }
                      int v64 = CFDictionaryGetValue(v57, kSCPropNetModemDataCompression);
                      if (v64) {
                        CFDictionarySetValue(v60, kSCPropNetModemDataCompression, v64);
                      }
                      int v65 = CFDictionaryGetValue(v57, kSCPropNetModemPulseDial);
                      if (v65) {
                        CFDictionarySetValue(v60, kSCPropNetModemPulseDial, v65);
                      }
                      int v66 = CFDictionaryGetValue(v57, kSCPropNetModemDialMode);
                      if (v66) {
                        CFDictionarySetValue(v60, kSCPropNetModemDialMode, v66);
                      }
                      CFRelease(v55);
                    }

                    else
                    {
                      int v60 = (__CFDictionary *)v55;
                    }

                    socklen_t v49 = v149;
                  }

                  else
                  {
                    int v60 = (__CFDictionary *)v54;
                  }

                  v144 = Serialize(v60, &v153, &v152);
                  if (v144)
                  {
                    v145 = v144;
                    sub_13024(v49, v153, v152);
                    CFRelease(v145);
                  }

                  CFRelease(v60);
                  int v45 = (__CFString *)kSCEntNetPPP;
                }
              }
            }

            CFRelease(v13);
          }
        }
      }
    }

LABEL_27:
    v19 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Level");
    if (!isString(v19) || CFEqual(v19, @"None"))
    {
      strcpy(__str, "out none");
      uint64_t v20 = 0x656E6F6E206E69LL;
LABEL_30:
      *(void *)__s = v20;
      goto LABEL_31;
    }

    if (CFEqual(v19, @"Unique"))
    {
      if ((v17 & 1) != 0)
      {
        strcpy(__str, "out ipsec esp/transport//unique");
        strcpy(__s, "in ipsec esp/transport//unique");
      }

      else
      {
        snprintf(__str, 0x200uLL, "out ipsec esp/tunnel/%s-%s/unique", v59, v58);
        snprintf(__s, 0x200uLL, "in ipsec esp/tunnel/%s-%s/unique");
      }
    }

    else
    {
      if (!CFEqual(v19, @"Require"))
      {
        if (!CFEqual(v19, @"Discard"))
        {
          int v38 = "incorrect policy level";
          goto LABEL_85;
        }

        strcpy(__str, "out discard");
        strcpy(&__s[7], "ard");
        uint64_t v20 = *(void *)"in discard";
        goto LABEL_30;
      }

      if ((v17 & 1) != 0)
      {
        strcpy(__str, "out ipsec esp/transport//require");
        strcpy(__s, "in ipsec esp/transport//require");
      }

      else
      {
        snprintf(__str, 0x200uLL, "out ipsec esp/tunnel/%s-%s/require", v59, v58);
        snprintf(__s, 0x200uLL, "in ipsec esp/tunnel/%s-%s/require");
      }
    }

    SCLog(1LL, 7LL, @"SCNC: Dropping start request due to traffic class (tc = %d)\n");
    return 5LL;
  }

    v9 = v9->ai_next;
  }

  while (v9);
  caddr_t v26 = (CFArrayRef *)(a3 + 1024);
  my_CFRelease((const void **)(a3 + 1024));
  *(void *)(a3 + 1024) = Mutable;
  *(_DWORD *)(a3 + 1032) = 0;
  if (CFArrayGetCount(Mutable) || v7 < 1)
  {
    CFRelease(theArray);
    v39 = *v26;
  }

  else
  {
    sub_20090( 5LL,  @"IPSec Controller: dns reply: no synthesized IPv6 address in reply on NAT64 network",  v27,  v28,  v29,  v30,  v31,  v32,  v94);
    my_CFRelease((const void **)(a3 + 1024));
    v39 = theArray;
    *caddr_t v26 = theArray;
  }

  a2 = v98;
  sub_20090(7LL, @"IPSec Controller: dns reply: resolvedAddress %@", v33, v34, v35, v36, v37, v38, (uint64_t)v39);
  if (!CFArrayGetCount(*v26))
  {
    my_CFRelease((const void **)(a3 + 1024));
    int v68 = @"IPSec Controller: dns reply: no IPv4 address in reply";
LABEL_40:
    sub_20090(3LL, v68, v53, v54, v55, v56, v57, v58, v97);
    a1 = 0;
    goto LABEL_41;
  }

  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*v26, 0LL);
  if (!ValueAtIndex)
  {
    v97 = *(unsigned int *)(a3 + 1036);
    int v68 = @"IPSec Controller: dns reply: failed to get elem %d from addr array";
    goto LABEL_40;
  }

  v59 = ValueAtIndex;
  Value = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, @"RemoteAddress");
  a1 = 0;
  if (!Value || (v67 = Value, (unint64_t)CFDataGetLength(Value) <= 0xF))
  {
    sub_20090( 3LL,  @"IPSec Controller: dns reply: failed to get elem %d from addr array",  v61,  v62,  v63,  v64,  v65,  v66,  *(unsigned int *)(a3 + 1036));
    goto LABEL_41;
  }

  buffer = 0uLL;
  v103.length = CFDataGetLength(v67);
  v103.location = 0LL;
  CFDataGetBytes(v67, v103, (UInt8 *)&buffer);
  *(_DWORD *)(a3 + 1036) = 1;
  v101 = 0uLL;
  BOOL v82 = (const __CFData *)CFDictionaryGetValue(v59, @"RemoteAddressNAT64Prefix");
  if (v82)
  {
    int v87 = v82;
    if (CFDataGetLength(v82) == 16)
    {
      v104.length = CFDataGetLength(v87);
      v104.location = 0LL;
      CFDataGetBytes(v87, v104, (UInt8 *)&v101);
      goto LABEL_48;
    }

    sub_20090( 3LL,  @"IPSec Controller: dns reply: failed to get elem %d from nat64 array",  v88,  v89,  v90,  v91,  v92,  v93,  *(unsigned int *)(a3 + 1036));
LABEL_41:
    sub_20090(5LL, @"IPSec Controller: dns reply: Stopping service", v46, v47, v48, v49, v50, v51, v96);
    *(_DWORD *)(a3 + 596) = 5;
    ipsec_stop(a3, v69, v70, v71, v72, v73, v74, v75);
    *(void *)(a3 + 1024) = CFRetain(kCFNull);
    *(_DWORD *)(a3 + 1032) = a1;
  }

  else
  {
LABEL_48:
    sub_25C8C(a3, &buffer, &v101, 0LL, v83, v84, v85, v86);
  }

  sub_20090(7LL, @"IPSec Controller: dns reply: done", v76, v77, v78, v79, v80, v81, v97);
  if (a2) {
    freeaddrinfo(a2);
  }
}

LABEL_31:
    int v21 = strlen(__s);
    caddr_t v22 = ipsec_set_policy(__s, v21);
    if (!v22)
    {
      int v38 = "cannot set policy in";
      goto LABEL_85;
    }

    v23 = (unsigned __int16 *)v22;
    int v24 = strlen(__str);
    caddr_t v25 = ipsec_set_policy(__str, v24);
    caddr_t v26 = v25;
    if (!v25) {
      break;
    }
    int v42 = v14;
    int v27 = *v23;
    int v41 = *(unsigned __int16 *)v25;
    if ((v17 & 1) != 0)
    {
      if (!get_address_from_string(v59, v54, 0x80uLL))
      {
        v39 = "incorrect local address";
        goto LABEL_95;
      }

      int v28 = v27;
      GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"LocalPort", &v45, 0);
      __int16 v55 = bswap32((unsigned __int16)v45) >> 16;
      if (v54[1] == 2) {
        int v29 = 32 * (v56 != 0);
      }
      else {
        int v29 = 128;
      }
      unsigned int v48 = v29;
      if (!get_address_from_string(v58, v51, 0x80uLL))
      {
        v39 = "incorrect remote address";
        goto LABEL_95;
      }

      GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"RemotePort", &v45, 0);
      __int16 v52 = bswap32((unsigned __int16)v45) >> 16;
      if (v51[1] == 2) {
        int v30 = 32 * (v53 != 0);
      }
      else {
        int v30 = 128;
      }
      unsigned int v47 = v30;
      BOOL v31 = &v46;
      v32 = (const __CFDictionary *)ValueAtIndex;
      v33 = @"Protocol";
      int v34 = 0;
    }

    else
    {
      if (!GetStrNetFromDict((const __CFDictionary *)ValueAtIndex, @"LocalAddress", v57, 256))
      {
        v39 = "incorrect local network (0)";
        goto LABEL_95;
      }

      if (!get_address_from_string(v57, v54, 0x80uLL))
      {
        v39 = "incorrect local network (1)";
        goto LABEL_95;
      }

      GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"LocalPrefix", &v48, 24);
      if (!GetStrNetFromDict((const __CFDictionary *)ValueAtIndex, @"RemoteAddress", v57, 256))
      {
        v39 = "incorrect remote network (0)";
        goto LABEL_95;
      }

      if (!get_address_from_string(v57, v51, 0x80uLL))
      {
        v39 = "incorrect remote network (1)";
        goto LABEL_95;
      }

      int v28 = v27;
      BOOL v31 = (int *)&v47;
      v32 = (const __CFDictionary *)ValueAtIndex;
      v33 = @"RemotePrefix";
      int v34 = 24;
    }

    GetIntFromDict(v32, v33, v31, v34);
    if ((v44 & 0x100000000LL) != 0)
    {
      int v14 = v42;
    }

    else
    {
      ++v12;
      if ((pfkey_send_spdadd(v6, v54, v48, v51, v47, v46, v26, 8 * v41, v42) & 0x80000000) != 0)
      {
        v39 = "cannot add policy out";
        goto LABEL_95;
      }

      int v14 = v42 + 1;
    }

    if ((v44 & 1) == 0)
    {
      ++v12;
      if ((pfkey_send_spdadd(v6, v51, v47, v54, v48, v46, v23, 8 * v28, v14) & 0x80000000) != 0)
      {
        v39 = "cannot add policy in";
        goto LABEL_95;
      }

      ++v14;
    }

    if ((getsockopt(v6, 0xFFFF, 4128, &v50, &v49) & 0x80000000) == 0 && v50 >= 1)
    {
      do
      {
        int v35 = pfkey_recv(v6);
        if (v35)
        {
          ++v13;
          free(v35);
        }
      }

      while ((getsockopt(v6, 0xFFFF, 4128, &v50, &v49) & 0x80000000) == 0 && v50 > 0);
    }

    free(v23);
    free(v26);
    CFIndex v11 = v43 + 1;
    if (v43 + 1 == v40) {
      goto LABEL_82;
    }
  }

  v39 = "cannot set policy out";
LABEL_95:
  *a3 = v39;
  SCLog(1LL, 3LL, @"Failed to add policy. Number of policies processed %d (with %d drained).\n");
  free(v23);
  if (v26) {
    free(v26);
  }
LABEL_79:
  uint64_t v36 = 0xFFFFFFFFLL;
  if (v6 != -1) {
LABEL_80:
  }
    pfkey_close(v6);
  return v36;
}

    v32 = __rev16(v18);
    if (v19 >> 16 >= 0) {
      v33 = v32;
    }
    else {
      v33 = 0LL;
    }
    int v34 = (char *)v17 + v33;
    int v35 = v15 - v33;
    char v17 = (unsigned __int16 *)(v34 + 4);
    v15 = v35 - 4;
  }

  while (v35 > 4);
  uint64_t v36 = a1;
  if (!v237)
  {
LABEL_39:
    sub_20090( 3LL,  @"IPSec Controller: Internal IP Address missing from Mode Config packet ",  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)v211);
    return;
  }

  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v214 = v16;
  theArray = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 608), @"ForceLocalAddress")
    && CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 608), @"ForceLocalAddress") == kCFBooleanTrue)
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 608), @"LocalAddress");
    CFDictionarySetValue(Mutable, @"LocalAddress", Value);
    int v42 = v221;
    CFIndex v43 = (const UInt8 *)(v4 + 44);
    if (*(_DWORD *)(a1 + 760))
    {
      LODWORD(__s) = 7708;
      p_s = &__s;
      nw_nat64_synthesize_v6(a1 + 760, a1 + 748, &v241);
    }

    else
    {
      p_s = (char **)(a1 + 744);
    }

    getnameinfo((const sockaddr *)p_s, *(unsigned __int8 *)p_s, buf, 0x39u, 0LL, 0, 10);
    AddString(Mutable, @"RemoteAddress", buf);
  }

  else
  {
    v37.s_addr = *(_DWORD *)(v4 + 20);
    int v38 = inet_ntoa(v37);
    AddString(Mutable, @"LocalAddress", v38);
    v250 = *(_DWORD *)(v4 + 16);
    v39.s_addr = v250;
    CFIndex v40 = inet_ntoa(v39);
    AddString(Mutable, @"RemoteAddress", v40);
    int v42 = v221;
    CFIndex v43 = (const UInt8 *)(v4 + 44);
  }

  v220 = 0LL;
  int v46 = 0;
  v233 = 0;
  unsigned int v47 = 0;
  v217 = 0;
  v218 = 1;
  v219 = 1;
  while (2)
  {
    unsigned int v48 = *((unsigned __int16 *)v43 + 1);
    socklen_t v49 = bswap32(*(unsigned __int16 *)v43);
    int v50 = HIWORD(v49) & 0x7FFF;
    v51 = __rev16(v48);
    switch(v50)
    {
      case 28672:
        if (!*(void *)(v36 + 960))
        {
          __int16 v52 = CFStringCreateWithBytes(0LL, v43 + 4, v51, 0, 0);
          *(void *)(v36 + 960) = v52;
          int v53 = (os_log_s *)ne_log_obj(v52);
          int v41 = (__CFArray *)os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
          if ((_DWORD)v41)
          {
            CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(v36 + 960), 0);
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = CStringPtr;
            __int16 v55 = v53;
            int v56 = "IPSec Network Configuration: BANNER = %s.\n";
            goto LABEL_61;
          }
        }

        goto LABEL_160;
      case 28673:
      case 28677:
      case 28679:
      case 28680:
      case 28681:
      case 28682:
        goto LABEL_160;
      case 28674:
        if (!v247)
        {
          v247 = CFStringCreateWithBytes(0LL, v43 + 4, v51, 0, 0);
          int v62 = (os_log_s *)ne_log_obj(v247);
          int v41 = (__CFArray *)os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT);
          if ((_DWORD)v41)
          {
            v63 = CFStringGetCStringPtr(v247, 0);
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = v63;
            __int16 v55 = v62;
            int v56 = "IPSec Network Configuration: DEF-DOMAIN = %s.\n";
LABEL_61:
            _os_log_impl(&dword_0, v55, OS_LOG_TYPE_DEFAULT, v56, buf, 0xCu);
          }
        }

        goto LABEL_160;
      case 28675:
        if (v246) {
          goto LABEL_160;
        }
        int v41 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
        v246 = v41;
        if (!v41 || v48 == 0) {
          goto LABEL_160;
        }
        v222 = v42;
        int v65 = (const char *)(v43 + 4);
        int v66 = v51;
        v230 = v43;
        v227 = v49;
        v225 = v51;
        do
        {
          v67 = CFStringCreateWithCString(0LL, v65, 0);
          if (!v67)
          {
            my_CFRelease((const void **)&v246);
            break;
          }

          int v68 = v67;
          v69 = CFStringGetLength(v67) + 2;
          int v70 = (char *)malloc(v69);
          __s = v70;
          if (!v70) {
            goto LABEL_90;
          }
          int v71 = v70;
          CFStringGetCString(v68, v70, v69, 0);
          int v72 = __s;
          int v73 = ",";
          if (!strchr(__s, 44))
          {
            int v73 = ";";
            if (!strchr(v72, 59))
            {
              int v73 = "\n";
              if (!strchr(v72, 10))
              {
                int v73 = "\r";
                if (!strchr(v72, 13))
                {
                  if (strchr(v72, 32)) {
                    int v73 = " ";
                  }
                  else {
                    int v73 = (const char *)&unk_2EEC2;
                  }
                }
              }
            }
          }

          v74 = strsep(&__s, v73);
          while (v74)
          {
            if (*v74) {
              goto LABEL_82;
            }
LABEL_86:
            v74 = strsep(&__s, v73);
            if (!v74) {
              goto LABEL_89;
            }
          }

          v74 = __s;
LABEL_82:
          CFIndex v75 = CFStringCreateWithCString(0LL, v74, 0);
          if (v75)
          {
            CFArrayAppendValue(v246, v75);
            CFIndex v77 = (os_log_s *)ne_log_obj(v76);
            if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
            {
              v78 = CFStringGetCStringPtr(v75, 0);
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = v46;
              *(_WORD *)&buf[8] = 2080;
              *(void *)&buf[10] = v78;
              _os_log_impl( &dword_0,  v77,  OS_LOG_TYPE_DEFAULT,  "IPSec Network Configuration: SPLITDNS-NAME[%d] = %s.\n",  buf,  0x12u);
            }

            CFRelease(v75);
            ++v46;
            goto LABEL_86;
          }

          my_CFRelease((const void **)&v246);
LABEL_89:
          free(v71);
          socklen_t v49 = v227;
LABEL_90:
          v65 += v69;
          v66 -= v69;
          CFRelease(v68);
          CFIndex v43 = v230;
          LODWORD(v51) = v225;
        }

        while (v66 > 0);
        uint64_t v36 = v234;
        int v42 = v222;
LABEL_160:
        if (v49 >> 16 >= 0) {
          v136 = v51;
        }
        else {
          v136 = 0LL;
        }
        int v42 = v42 - v136 - 4;
        v43 += v136 + 4;
        if (v42 > 0) {
          continue;
        }
        if (v218)
        {
          v137 = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFCopyStringDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          CFDictionarySetValue(v137, @"Mode", @"Tunnel");
          CFDictionarySetValue(v137, @"Direction", @"InOut");
          CFDictionarySetValue(v137, @"Level", @"Require");
          v139 = v237;
          v138.s_addr = v237;
          v250 = v237;
          v140 = inet_ntoa(v138);
          AddString(v137, @"LocalAddress", v140);
          AddNumber(v137, @"LocalPrefix", 32);
          v142 = (os_log_s *)ne_log_obj(v141);
          if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
          {
            v143.s_addr = v237;
            v144 = inet_ntoa(v143);
            *(_DWORD *)buf = 136315394;
            *(void *)&buf[4] = v144;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 32;
            _os_log_impl( &dword_0,  v142,  OS_LOG_TYPE_DEFAULT,  "IPSec Network Configuration: DEFAULT-ROUTE = local-address %s/%d.\n",  buf,  0x12u);
          }

          *(_DWORD *)(v36 + 908) = v237;
          CFDictionarySetValue(v137, @"RemoteAddress", @"0.0.0.0");
          AddNumber(v137, @"RemotePrefix", 0);
          update_service_route(v36, v237, -1, 0, 0, 0, 0, 0);
          v145 = theArray;
          CFArrayAppendValue(theArray, v137);
          CFRelease(v137);
          v146 = v218;
        }

        else
        {
          v146 = 0;
          v139 = v237;
          v145 = theArray;
        }

        CFDictionarySetValue(Mutable, @"Policies", v145);
        CFRelease(v145);
        v153 = a3;
        if (!a3) {
          goto LABEL_185;
        }
        sub_20090( 7LL,  @"IPSec Controller: Mode Config Policies %@",  v147,  v148,  v149,  v150,  v151,  v152,  (uint64_t)Mutable);
        if ((IPSecInstallPolicies(Mutable, -1LL, (const char **)buf) & 0x80000000) != 0)
        {
          sub_20090( 3LL,  @"IPSec Controller: IPSecInstallPolicies failed '%s'",  v154,  v155,  v156,  v157,  v158,  v159,  *(uint64_t *)buf);
          goto LABEL_179;
        }

        *(void *)(v36 + 880) = my_CFRetain(Mutable);
        *(_DWORD *)(v36 + 888) = v146;
        *(_DWORD *)(v36 + 896) = v139;
        *(_DWORD *)(v36 + 900) = v214;
        tun_interface = create_tun_interface((void *)(v36 + 104), 0x10u, (unsigned int *)(v36 + 120), 3, 0);
        *(_DWORD *)(v36 + 904) = tun_interface;
        if (tun_interface == -1)
        {
          v167 = @"IPSec Controller: cannot create tunnel interface";
          goto LABEL_178;
        }

        if (set_tun_delegate(tun_interface, (char *)(v36 + 918)))
        {
          v167 = @"IPSec Controller: cannot set delegate interface for tunnel interface";
          goto LABEL_178;
        }

        set_ifmtu(v36 + 104, 1280);
        set_ifaddr(v36 + 104, v139, v139, v214);
        if (!racoon_send_cmd_start_ph2(*(_DWORD *)(v36 + 784), *(_DWORD *)(v36 + 748), Mutable))
        {
          sub_25364((const char *)(v36 + 104), v235, v161, v162, v163, v164, v165, v166, (uint64_t)v212);
LABEL_185:
          if (!a2)
          {
            my_CFRelease((const void **)&v246);
            my_CFRelease((const void **)&v247);
            my_CFRelease((const void **)&v245);
            my_CFRelease((const void **)&v244);
            my_CFRelease((const void **)&v243);
            my_CFRelease((const void **)&v249);
            my_CFRelease((const void **)&v248);
            my_CFRelease((const void **)&Mutable);
LABEL_222:
            if (v153) {
              *(_DWORD *)(v36 + 876) = 1;
            }
            v210 = (os_log_s *)ne_log_obj(v178);
            if (os_log_type_enabled(v210, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(__s) = 0;
              _os_log_impl( &dword_0,  v210,  OS_LOG_TYPE_DEFAULT,  "IPSec Network Configuration established.\n",  (uint8_t *)&__s,  2u);
            }

            return;
          }

          v169 = SCNetworkReachabilityCreateWithAddress(0LL, (const sockaddr *)(v36 + 744));
          v170 = SCNetworkReachabilityGetFlags(v169, &flags);
          v171 = flags;
          CFRelease(v169);
          __s = 0LL;
          v238 = 0LL;
          if (v170 && (v171 & 0x20000) != 0 || !*(_DWORD *)(v36 + 940))
          {
            if (!*(_BYTE *)(v36 + 918))
            {
              v173 = 0LL;
              if (v218) {
                goto LABEL_193;
              }
              goto LABEL_196;
            }

            v172 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
            v173 = v172;
            v238 = v172;
            v174 = *(_DWORD *)(v36 + 748);
            v175 = 0;
            v176 = v36 + 918;
          }

          else
          {
            v172 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
            v173 = v172;
            v238 = v172;
            v174 = *(_DWORD *)(v36 + 748);
            v175 = *(_DWORD *)(v36 + 940);
            v176 = 0LL;
          }

          sub_25514(v172, v174, 0xFFFFFFFF, v175, 1, v176);
          if (v218)
          {
LABEL_193:
            v177 = 0LL;
            goto LABEL_198;
          }

uint64_t IPSecInstallRoutes(uint64_t a1, const __CFDictionary *a2, CFIndex a3, const char **a4, int a5)
{
  return sub_640C(a1, 1, a2, a3, a4, a5);
}

uint64_t sub_640C(uint64_t a1, int a2, const __CFDictionary *a3, CFIndex a4, const char **a5, int a6)
{
  int v35 = a6;
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
  if (!Mutable)
  {
    *a5 = "cannot allocate CFString";
    return 0xFFFFFFFFLL;
  }

  int v12 = Mutable;
  int v13 = socket(17, 3, 17);
  if (v13 < 0)
  {
    v18 = "cannot open a routing socket";
LABEL_52:
    *a5 = v18;
    CFRelease(v12);
    if (v13 == -1) {
      return 0xFFFFFFFFLL;
    }
    goto LABEL_58;
  }

  if (!GetStrAddrFromDict(a3, @"LocalAddress", v50, 256))
  {
    v16 = "incorrect local address";
LABEL_57:
    *a5 = v16;
    CFRelease(v12);
LABEL_58:
    close(v13);
    return 0xFFFFFFFFLL;
  }

  if (!GetStrAddrFromDict(a3, @"RemoteAddress", v49, 256))
  {
    v16 = "incorrect remote address";
    goto LABEL_57;
  }

  Value = CFDictionaryGetValue(a3, @"Policies");
  if (!isArray(Value))
  {
    v16 = "no policies found";
    goto LABEL_57;
  }

  CFIndex Count = CFArrayGetCount((CFArrayRef)Value);
  v16 = "no policies found";
  if (!Count || Count < a4) {
    goto LABEL_57;
  }
  CFIndex v17 = a4 + 1;
  if (a4 == -1)
  {
    CFIndex v17 = Count;
    a4 = 0LL;
  }

  CFIndex v33 = v17;
  if (a4 < v17)
  {
    int v32 = 0;
    v18 = "incorrect policy found";
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)Value, a4);
      uint64_t v20 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Mode");
      if (isString(v20) && !CFEqual(v20, @"Tunnel"))
      {
        if (!CFEqual(v20, @"Transport"))
        {
          v18 = "incorrect policy type found";
          goto LABEL_52;
        }
      }

      else
      {
        int v21 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Direction");
        if (isString(v21))
        {
          if (CFEqual(v21, @"In")) {
            goto LABEL_45;
          }
          if (!CFEqual(v21, @"Out") && !CFEqual(v21, @"InOut"))
          {
            v18 = "incorrect policy direction found";
            goto LABEL_52;
          }
        }

        caddr_t v22 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Level");
        if (isString(v22) && !CFEqual(v22, @"None"))
        {
          if (!CFEqual(v22, @"Require") && !CFEqual(v22, @"Discard") && !CFEqual(v22, @"Unique"))
          {
            v18 = "incorrect policy level";
            goto LABEL_52;
          }

          if (!GetStrNetFromDict((const __CFDictionary *)ValueAtIndex, @"LocalAddress", v48, 256)
            || (v46[3].s_addr = 528, !inet_aton(v48, &v47)))
          {
            v18 = "incorrect local network";
            goto LABEL_52;
          }

          if (!GetStrNetFromDict((const __CFDictionary *)ValueAtIndex, @"RemoteAddress", v48, 256))
          {
            v18 = "incorrect remote network0";
            goto LABEL_52;
          }

          v45[10] = 528;
          if (!inet_aton(v48, v46))
          {
            v18 = "incorrect remote network1";
            goto LABEL_52;
          }

          if (a2 != 2) {
            goto LABEL_37;
          }
          v23 = *(uint64_t **)(a1 + 1048);
          if (!v23) {
            goto LABEL_33;
          }
          while (*((_DWORD *)v23 + 2) != v47.s_addr || *((_DWORD *)v23 + 4) != v46[0].s_addr)
          {
            v23 = (uint64_t *)*v23;
            if (!v23) {
              goto LABEL_33;
            }
          }

          if (*((_DWORD *)v23 + 8))
          {
LABEL_37:
            __buf[0] = 327680LL;
            __int128 v39 = 0u;
            __int128 v44 = 0u;
            memset(v45, 0, 28);
            __int128 v42 = 0u;
            __int128 v43 = 0u;
            __int128 v40 = 0u;
            __int128 v41 = 0u;
            BYTE3(__buf[0]) = a2;
            DWORD1(v39) = ++v32;
            __buf[1] = 0x700000803LL;
            WORD6(v43) = 528;
            LODWORD(v44) = v46[0];
            WORD6(v44) = 528;
            v45[0] = v35;
            LOWORD(v45[3]) = 528;
            GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"RemotePrefix", &v34, 24);
            int v24 = v34;
            if (v34)
            {
              unsigned int v25 = 0;
              do
              {
                unsigned int v25 = (v25 >> 1) | 0x80000000;
                --v24;
              }

              while (v24);
              int v34 = 0;
            }

            else
            {
              unsigned int v25 = 0;
            }

            v45[4] = bswap32(v25);
            LOWORD(__buf[0]) = 140;
            if (write(v13, __buf, 0x8CuLL) < 0)
            {
              caddr_t v26 = __error();
              strerror(*v26);
              addr2ascii(2, v46, 4, v37);
              addr2ascii(2, &v35, 4, v36);
              syslog(3, "cannot write on routing socket: %s (address %s, gateway %s)\n");
            }

            else
            {
              update_service_route(a1, v47.s_addr, -1, v46[0].s_addr, bswap32(v45[4]), v35, 0, a2 == 1);
              sub_A20C(v46[0].s_addr, v45[4]);
              CFStringAppendFormat(v12, 0LL, @"%s, ", byte_40410);
            }
          }

          else
          {
LABEL_33:
            addr2ascii(2, v46, 4, v37);
            addr2ascii(2, &v35, 4, v36);
            syslog(6, "ignoring uninstalled route: (address %s, gateway %s)\n");
          }
        }
      }

LABEL_45:
      ++a4;
    }

    while (a4 != v33);
  }

  CFIndex Length = CFStringGetLength(v12);
  if (Length >= 1)
  {
    CFIndex v28 = Length + 1;
    int v29 = (char *)calloc(1uLL, Length + 1);
    if (v29)
    {
      int v30 = v29;
      CFStringGetCString(v12, v29, v28, 0x600u);
      addr2ascii(2, &v35, 4, v36);
      syslog(5, "installed routes: addresses %sgateway %s\n", v30, v36);
      free(v30);
    }
  }

  CFRelease(v12);
  close(v13);
  return 0LL;
}

uint64_t IPSecRemoveRoutes(uint64_t a1, const __CFDictionary *a2, CFIndex a3, const char **a4, int a5)
{
  return sub_640C(a1, 2, a2, a3, a4, a5);
}

uint64_t IPSecRemovePolicies(const __CFDictionary *a1, CFIndex a2, const char **a3)
{
  int v41 = 255;
  int v6 = pfkey_open();
  if ((v6 & 0x80000000) == 0)
  {
    if (GetStrAddrFromDict(a1, @"LocalAddress", v45, 256))
    {
      if (GetStrAddrFromDict(a1, @"RemoteAddress", v44, 256))
      {
        Value = (const __CFArray *)CFDictionaryGetValue(a1, @"Policies");
        if (isArray(Value))
        {
          CFIndex Count = CFArrayGetCount(Value);
          v9 = "no policies found";
          if (Count && Count >= a2)
          {
            BOOL v10 = __CFADD__(a2, 1LL);
            CFIndex v11 = a2 + 1;
            if (a2 == -1) {
              a2 = 0LL;
            }
            if (v10) {
              CFIndex v11 = Count;
            }
            CFIndex v37 = v11;
            if (a2 < v11)
            {
              int v12 = 0;
              uint64_t v36 = Value;
              while (1)
              {
                ValueAtIndex = CFArrayGetValueAtIndex(Value, a2);
                if (!isDictionary(ValueAtIndex))
                {
                  int v32 = "incorrect policy found";
                  goto LABEL_52;
                }

                int v14 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Mode");
                if (isString(v14) && !CFEqual(v14, @"Tunnel"))
                {
                  if (!CFEqual(v14, @"Transport"))
                  {
                    int v32 = "incorrect policy type found";
                    goto LABEL_52;
                  }

                  char v15 = 1;
                }

                else
                {
                  char v15 = 0;
                }

                v16 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Direction");
                if (isString(v16))
                {
                  if (CFEqual(v16, @"In"))
                  {
                    char v17 = 0;
                    char v18 = 1;
                    goto LABEL_26;
                  }

                  if (CFEqual(v16, @"Out"))
                  {
                    char v18 = 0;
                    char v17 = 1;
                    goto LABEL_26;
                  }

                  if (!CFEqual(v16, @"InOut"))
                  {
                    int v32 = "incorrect policy direction found";
                    goto LABEL_52;
                  }
                }

                char v17 = 0;
                char v18 = 0;
LABEL_26:
                strcpy(v53, "out");
                strcpy(__s, "in");
                int v19 = strlen(__s);
                caddr_t v20 = ipsec_set_policy(__s, v19);
                if (!v20)
                {
                  int v32 = "cannot set policy in";
                  goto LABEL_52;
                }

                int v21 = v20;
                int v22 = strlen(v53);
                caddr_t v23 = ipsec_set_policy(v53, v22);
                if (!v23)
                {
                  *a3 = "cannot set policy out";
                  caddr_t v34 = v21;
LABEL_74:
                  free(v34);
                  goto LABEL_53;
                }

                caddr_t v24 = v23;
                int v38 = *(unsigned __int16 *)v21;
                int v39 = *(unsigned __int16 *)v23;
                if ((v15 & 1) != 0)
                {
                  if (!get_address_from_string(v45, v49, 0x80uLL))
                  {
                    int v35 = "incorrect local address";
LABEL_73:
                    *a3 = v35;
                    free(v21);
                    caddr_t v34 = v24;
                    goto LABEL_74;
                  }

                  GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"LocalPort", &v40, 0);
                  __int16 v50 = bswap32((unsigned __int16)v40) >> 16;
                  if (v49[1] == 2) {
                    int v25 = 32 * (v51 != 0);
                  }
                  else {
                    int v25 = 128;
                  }
                  unsigned int v43 = v25;
                  if (!get_address_from_string(v44, v46, 0x80uLL))
                  {
                    int v35 = "incorrect remote address";
                    goto LABEL_73;
                  }

                  GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"RemotePort", &v40, 0);
                  __int16 v47 = bswap32((unsigned __int16)v40) >> 16;
                  if (v46[1] == 2) {
                    int v26 = 32 * (v48 != 0);
                  }
                  else {
                    int v26 = 128;
                  }
                  unsigned int v42 = v26;
                  int v27 = &v41;
                  CFIndex v28 = (const __CFDictionary *)ValueAtIndex;
                  int v29 = @"Protocol";
                  int v30 = 0;
                }

                else
                {
                  if (!GetStrNetFromDict( (const __CFDictionary *)ValueAtIndex,  @"LocalAddress",  v52,  32))
                  {
                    int v35 = "incorrect local network (0)";
                    goto LABEL_73;
                  }

                  if (!get_address_from_string(v52, v49, 0x80uLL))
                  {
                    int v35 = "incorrect local network (1)";
                    goto LABEL_73;
                  }

                  GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"LocalPrefix", &v43, 24);
                  if (!GetStrNetFromDict( (const __CFDictionary *)ValueAtIndex,  @"RemoteAddress",  v52,  32))
                  {
                    int v35 = "incorrect remote network (0)";
                    goto LABEL_73;
                  }

                  if (!get_address_from_string(v52, v46, 0x80uLL))
                  {
                    int v35 = "incorrect remote network (1)";
                    goto LABEL_73;
                  }

                  int v27 = (int *)&v42;
                  CFIndex v28 = (const __CFDictionary *)ValueAtIndex;
                  int v29 = @"RemotePrefix";
                  int v30 = 24;
                }

                GetIntFromDict(v28, v29, v27, v30);
                if ((v18 & 1) == 0)
                {
                  if ((pfkey_send_spddelete(v6, v49, v43, v46, v42, v41, v24, 8 * v39, v12) & 0x80000000) != 0)
                  {
                    int v35 = "cannot delete policy out";
                    goto LABEL_73;
                  }

                  ++v12;
                }

                if ((v17 & 1) == 0)
                {
                  if ((pfkey_send_spddelete(v6, v46, v42, v49, v43, v41, v21, 8 * v38, v12) & 0x80000000) != 0)
                  {
                    int v35 = "cannot delete policy in";
                    goto LABEL_73;
                  }

                  ++v12;
                }

                free(v21);
                free(v24);
                uint64_t v31 = 0LL;
                ++a2;
                Value = v36;
                if (v37 == a2) {
                  goto LABEL_59;
                }
              }
            }

            uint64_t v31 = 0LL;
            goto LABEL_59;
          }
        }

        else
        {
          v9 = "no policies found";
        }
      }

      else
      {
        v9 = "incorrect remote address";
      }
    }

    else
    {
      v9 = "incorrect local address";
    }

    *a3 = v9;
    uint64_t v31 = 0xFFFFFFFFLL;
LABEL_59:
    pfkey_close(v6);
    return v31;
  }

  int v32 = "cannot open a pfkey socket";
LABEL_52:
  *a3 = v32;
LABEL_53:
  uint64_t v31 = 0xFFFFFFFFLL;
  if (v6 != -1) {
    goto LABEL_59;
  }
  return v31;
}

uint64_t IPSecRemoveSecurityAssociations(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v4 = pfkey_open();
  if (v4 < 0) {
    return 0xFFFFFFFFLL;
  }
  int v5 = v4;
  uint64_t v6 = pfkey_send_delete_all(v4, 3, 0LL, a1, a2);
  if ((v6 & 0x80000000) == 0) {
    uint64_t v6 = pfkey_send_delete_all(v5, 3, 0LL, a2, a1);
  }
  uint64_t v7 = v6;
  pfkey_close(v5);
  return v7;
}

BOOL IPSecIsAggressiveMode(const void *a1, int a2, int a3)
{
  BOOL result = 0LL;
  if (a2 && a3) {
    return !isString(a1) || CFEqual(a1, @"Certificate") == 0;
  }
  return result;
}

uint64_t sockaddr_to_string(unsigned __int8 *a1, void *a2, unint64_t a3)
{
  int v6 = a1[1];
  switch(v6)
  {
    case 30:
      uint64_t result = (uint64_t)inet_ntop(30, a1 + 8, (char *)a2, a3);
      if (*((_DWORD *)a1 + 6))
      {
        uint64_t result = strlen((const char *)a2);
        if (a3 >= ((result << 32) + 0x1100000000LL) >> 32)
        {
          *((_BYTE *)a2 + (int)result) = 37;
          return (uint64_t)if_indextoname(*((_DWORD *)a1 + 6), (char *)a2 + (((result << 32) + 0x100000000LL) >> 32));
        }
      }

      break;
    case 18:
      unsigned int v10 = *a1;
      v9 = a1 + 8;
      size_t v8 = v10;
      if (v10 >= a3) {
        size_t v11 = a3 - 1;
      }
      else {
        size_t v11 = v8;
      }
      return (uint64_t)memmove(a2, v9, v11);
    case 2:
      return (uint64_t)inet_ntop(2, a1 + 4, (char *)a2, a3);
    default:
      return snprintf((char *)a2, a3, "unexpected address family %d", a1[1]);
  }

  return result;
}

uint64_t get_src_address(_BYTE *a1, unsigned __int8 *a2, const char *a3, char *a4)
{
  pid_t v8 = getpid();
  uint64_t result = socket(17, 3, 17);
  if ((_DWORD)result != -1)
  {
    int v10 = result;
    bzero(v40, 0x258uLL);
    int __buf = 285540444;
    uint64_t v41 = 0x1100000807LL;
    pid_t v42 = v8;
    int v43 = 1;
    if (a3)
    {
      LODWORD(a3) = if_nametoindex(a3);
      LODWORD(v41) = 16779271;
      v40[0] = (_WORD)a3;
    }

    size_t v11 = v44;
    __memmove_chk(v44, a2, *a2, 512LL);
    __int16 v12 = __buf + v44[0];
    *(_WORD *)&v44[v44[0]] = 4628;
    LOWORD(__buf) = v12 + 20;
    while (write(v10, &__buf, (unsigned __int16)__buf) == -1)
    {
      if (*__error() != 4) {
        goto LABEL_7;
      }
    }

    while (read(v10, &__buf, 0x25CuLL) == -1)
    {
      if (*__error() != 4) {
        goto LABEL_7;
      }
    }

    uint64_t v13 = 0LL;
    int v14 = HIDWORD(v41);
    do
    {
      if (((1 << v13) & v14) != 0)
      {
        *(void *)&v36[2 * v13 + 1] = v11;
        uint64_t v15 = *v11;
        if ((v15 & 3) != 0) {
          uint64_t v16 = (v15 | 3) + 1;
        }
        else {
          uint64_t v16 = *v11;
        }
        if (*v11) {
          uint64_t v17 = v16;
        }
        else {
          uint64_t v17 = 4LL;
        }
        v11 += v17;
        v14 ^= 1 << v13;
      }

      else
      {
        *(void *)&v36[2 * v13 + 1] = 0LL;
      }

      ++v13;
    }

    while (v13 != 8);
    if (!a1 || (char v18 = (_DWORD *)v38) == 0LL || (v19 = v37, a4) && !v37)
    {
LABEL_7:
      close(v10);
      return 0xFFFFFFFFLL;
    }

    if (*(_BYTE *)(v38 + 1) == 30 && *(unsigned __int8 *)(v38 + 8) == 254 && (*(_BYTE *)(v38 + 9) & 0xC0) == 0x80)
    {
      unsigned int v20 = *(unsigned __int16 *)(v38 + 10);
      if (*(_WORD *)(v38 + 10))
      {
        *(_WORD *)(v38 + 10) = 0;
        if (!v18[6]) {
          v18[6] = __rev16(v20);
        }
      }
    }

    memmove(a1, v18, *(unsigned __int8 *)v18);
    if (a4) {
      strncpy(a4, (const char *)(v19 + 8), 0x10uLL);
    }
    close(v10);
    if (a1[1] != 30) {
      return 0LL;
    }
    socklen_t v35 = 128;
    v36[0] = (_DWORD)a3;
    int v21 = (sockaddr *)calloc(1uLL, 0x80uLL);
    if (v21)
    {
      int v22 = v21;
      int v23 = socket(a2[1], 2, 0);
      if (v23 < 0)
      {
        int v29 = __error();
        int v30 = strerror(*v29);
        syslog(3, "socket (%s)\n", v30);
      }

      else
      {
        int v24 = v23;
        if (fcntl(v23, 4, 4LL) == -1) {
          syslog(3, "failed to put localaddr socket in non-blocking mode\n");
        }
        if ((_DWORD)a3)
        {
          int v25 = a2[1] == 2 ? 0 : 41;
          int v26 = a2[1] == 2 ? 25 : 125;
          if (setsockopt(v24, v25, v26, v36, 4u))
          {
            int v27 = __error();
            CFIndex v28 = strerror(*v27);
            syslog(3, "failed to set IP family on localaddr socket: %s\n", v28);
          }
        }

        __memcpy_chk(&v45, a2, *a2, 128LL);
        if (v45.sa_family == 30 || v45.sa_family == 2) {
          *(_WORD *)v45.sa_data = -14161;
        }
        if (connect(v24, &v45, v45.sa_len) < 0)
        {
          uint64_t v31 = __error();
          int v32 = strerror(*v31);
          syslog(3, "connect (%s)\n", v32);
          close(v24);
        }

        else
        {
          if (getsockname(v24, v22, &v35) < 0)
          {
            CFIndex v33 = __error();
            caddr_t v34 = strerror(*v33);
            syslog(3, "getsockname (%s)\n", v34);
            close(v24);
            return 0LL;
          }

          close(v24);
          memcpy(a1, v22, v22->sa_len);
        }
      }

      free(v22);
    }

    else
    {
      syslog(3, "failed to get address buffer.\n");
    }

    return 0LL;
  }

  return result;
}

uint64_t get_if_mtu(uint64_t a1)
{
  uint64_t v2 = 1500LL;
  unsigned int v7 = 1500;
  int v3 = socket(2, 2, 0);
  if ((v3 & 0x80000000) == 0)
  {
    int v4 = v3;
    __strlcpy_chk(v6, a1, 16LL, 16LL);
    ioctl(v4, 0xC0206933uLL, v6);
    close(v4);
    return v7;
  }

  return v2;
}

uint64_t get_if_media(uint64_t a1)
{
  int v2 = socket(2, 2, 0);
  if (v2 < 0) {
    return 0LL;
  }
  int v3 = v2;
  __strlcpy_chk(v5, a1, 16LL, 16LL);
  ioctl(v3, 0xC02C6938uLL, v5);
  close(v3);
  return LODWORD(v5[1]);
}

uint64_t get_if_baudrate(const char *a1)
{
  size_t __size = 0LL;
  unsigned int v1 = if_nametoindex(a1);
  if (!v1) {
    return 0LL;
  }
  *(_OWORD *)int v6 = xmmword_2EB80;
  int v7 = 3;
  unsigned int v8 = v1;
  if (sysctl(v6, 6u, 0LL, &__size, 0LL, 0LL) < 0) {
    return 0LL;
  }
  int v2 = malloc(__size);
  if (sysctl(v6, 6u, v2, &__size, 0LL, 0LL) < 0)
  {
    uint64_t v3 = 0LL;
    if (!v2) {
      return v3;
    }
  }

  else if (v2[3] == 14)
  {
    uint64_t v3 = *((unsigned int *)v2 + 8);
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  free(v2);
  return v3;
}

uint64_t IPSecSetSecurityAssociationsPreference(void *a1, unsigned int a2)
{
  unsigned int v4 = a2;
  size_t v3 = 4LL;
  if (a2 <= 1) {
    return sysctlbyname("net.key.prefered_oldsa", a1, &v3, &v4, 4uLL);
  }
  else {
    return 0LL;
  }
}

__CFDictionary *IPSecCreateL2TPDefaultConfiguration( const sockaddr *a1, const sockaddr *a2, const char *a3, const void *a4, int a5, int a6, int a7, const __CFString *a8, int a9)
{
  int v68 = 1;
  int v69 = 0;
  int v67 = 17;
  int sa_family = a2->sa_family;
  if (a1->sa_family != sa_family)
  {
    syslog(3, "address families don't match (%u != %u)\n", a1->sa_family, sa_family);
    return 0LL;
  }

  CFMutableStringRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFStringRef v19 = 0LL;
  if (a3) {
    CFStringRef v19 = CFStringCreateWithCString(0LL, a3, 0x600u);
  }
  CFStringRef v60 = v19;
  if (a2->sa_family == 30)
  {
    getnameinfo(a1, a1->sa_len, cStr, 0x39u, 0LL, 0, 10);
    CFStringRef value = CFStringCreateWithCString(0LL, cStr, 0x600u);
    getnameinfo(a2, a2->sa_len, cStr, 0x39u, 0LL, 0, 10);
    CFStringRef v62 = CFStringCreateWithCString(0LL, cStr, 0x600u);
    unsigned int valuePtr = bswap32(*(unsigned __int16 *)a1->sa_data) >> 16;
    CFNumberRef v58 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
    unsigned int valuePtr = bswap32(*(unsigned __int16 *)a2->sa_data) >> 16;
    CFNumberRef v20 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
    unsigned int valuePtr = 128;
    CFNumberRef v56 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
    CFNumberRef v55 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
  }

  else
  {
    int v22 = addr2ascii(2, &a1->sa_data[2], 4, 0LL);
    CFStringRef value = CFStringCreateWithCString(0LL, v22, 0x600u);
    int v23 = addr2ascii(2, &a2->sa_data[2], 4, 0LL);
    CFStringRef v62 = CFStringCreateWithCString(0LL, v23, 0x600u);
    unsigned int valuePtr = bswap32(*(unsigned __int16 *)a1->sa_data) >> 16;
    CFNumberRef v58 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
    unsigned int valuePtr = bswap32(*(unsigned __int16 *)a2->sa_data) >> 16;
    CFNumberRef v20 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
    CFNumberRef v55 = 0LL;
    CFNumberRef v56 = 0LL;
  }

  CFNumberRef v54 = CFNumberCreate(0LL, kCFNumberIntType, &v69);
  CFNumberRef v61 = CFNumberCreate(0LL, kCFNumberIntType, &v67);
  if (a6)
  {
    CFNumberRef v53 = 0LL;
    int v24 = @"Obey";
  }

  else
  {
    if (a7) {
      int v25 = &v68;
    }
    else {
      int v25 = &v69;
    }
    CFNumberRef v53 = CFNumberCreate(0LL, kCFNumberIntType, v25);
    int v24 = @"Claim";
  }

  CFDictionarySetValue(Mutable, @"AuthenticationMethod", a4);
  CFDictionarySetValue(Mutable, @"LocalAddress", value);
  CFDictionarySetValue(Mutable, @"RemoteAddress", v62);
  CFDictionarySetValue(Mutable, @"ProposalsBehavior", v24);
  if (a6 && CFEqual(a4, @"Certificate"))
  {
    if (a8) {
      int v26 = a8;
    }
    else {
      int v26 = @"GenerateFromRemoteAddress";
    }
    if (!a8 && a3)
    {
      CFDictionarySetValue(Mutable, @"RemoteIdentifier", v60);
      int v26 = @"UseRemoteIdentifier";
    }

    CFDictionarySetValue(Mutable, @"IdentifierVerification", v26);
    BOOL IsAggressiveMode = IPSecIsAggressiveMode(a4, a5, a6);
  }

  else
  {
    CFDictionarySetValue(Mutable, @"IdentifierVerification", @"None");
    BOOL IsAggressiveMode = IPSecIsAggressiveMode(a4, a5, a6);
    if (!a6) {
      CFDictionarySetValue(Mutable, @"NattMultipleUsersEnabled", v53);
    }
  }

  CFNumberRef v57 = v20;
  int v59 = a6;
  theArray = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  unsigned int valuePtr = 3600;
  CFNumberRef cf = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
  if (a9)
  {
    unsigned int v28 = 0;
  }

  else
  {
    unsigned int valuePtr = 14;
    CFNumberRef v37 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
    int v39 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v39, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v39, @"HashAlgorithm", @"SHA256");
    CFDictionarySetValue(v39, @"DHGroup", v37);
    CFDictionarySetValue(v39, @"Lifetime", cf);
    CFArraySetValueAtIndex(theArray, 0LL, v39);
    CFRelease(v39);
    int v40 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v40, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v40, @"HashAlgorithm", @"SHA1");
    CFDictionarySetValue(v40, @"DHGroup", v37);
    CFDictionarySetValue(v40, @"Lifetime", cf);
    CFArraySetValueAtIndex(theArray, 1LL, v40);
    CFRelease(v40);
    uint64_t v41 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v41, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v41, @"HashAlgorithm", @"MD5");
    CFDictionarySetValue(v41, @"DHGroup", v37);
    CFDictionarySetValue(v41, @"Lifetime", cf);
    CFArraySetValueAtIndex(theArray, 2LL, v41);
    CFRelease(v41);
    pid_t v42 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v42, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v42, @"HashAlgorithm", @"SHA512");
    CFDictionarySetValue(v42, @"DHGroup", v37);
    CFDictionarySetValue(v42, @"Lifetime", cf);
    CFArraySetValueAtIndex(theArray, 3LL, v42);
    CFRelease(v42);
    if (IsAggressiveMode) {
      goto LABEL_29;
    }
    CFRelease(v37);
    unsigned int valuePtr = 5;
    CFNumberRef v49 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
    __int16 v50 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v50, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v50, @"HashAlgorithm", @"SHA256");
    CFDictionarySetValue(v50, @"DHGroup", v49);
    CFDictionarySetValue(v50, @"Lifetime", cf);
    CFArraySetValueAtIndex(theArray, 4LL, v50);
    CFRelease(v50);
    int v51 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v51, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v51, @"HashAlgorithm", @"SHA1");
    CFDictionarySetValue(v51, @"DHGroup", v49);
    CFDictionarySetValue(v51, @"Lifetime", cf);
    CFArraySetValueAtIndex(theArray, 5LL, v51);
    CFRelease(v51);
    __int16 v52 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v52, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v52, @"HashAlgorithm", @"MD5");
    CFDictionarySetValue(v52, @"DHGroup", v49);
    CFDictionarySetValue(v52, @"Lifetime", cf);
    CFArraySetValueAtIndex(theArray, 6LL, v52);
    CFRelease(v52);
    CFRelease(v49);
    unsigned int v28 = 7;
  }

  unsigned int valuePtr = 2;
  CFNumberRef v29 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
  int v30 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v30, @"EncryptionAlgorithm", @"AES256");
  CFDictionarySetValue(v30, @"HashAlgorithm", @"SHA256");
  CFDictionarySetValue(v30, @"DHGroup", v29);
  CFDictionarySetValue(v30, @"Lifetime", cf);
  CFArraySetValueAtIndex(theArray, v28, v30);
  CFRelease(v30);
  uint64_t v31 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v31, @"EncryptionAlgorithm", @"AES256");
  CFDictionarySetValue(v31, @"HashAlgorithm", @"SHA1");
  CFDictionarySetValue(v31, @"DHGroup", v29);
  CFDictionarySetValue(v31, @"Lifetime", cf);
  CFArraySetValueAtIndex(theArray, v28 + 1, v31);
  CFRelease(v31);
  int v32 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v32, @"EncryptionAlgorithm", @"AES256");
  CFDictionarySetValue(v32, @"HashAlgorithm", @"MD5");
  CFDictionarySetValue(v32, @"DHGroup", v29);
  CFDictionarySetValue(v32, @"Lifetime", cf);
  CFArraySetValueAtIndex(theArray, v28 + 2, v32);
  CFRelease(v32);
  CFIndex v33 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v33, @"EncryptionAlgorithm", @"AES");
  CFDictionarySetValue(v33, @"HashAlgorithm", @"SHA1");
  CFDictionarySetValue(v33, @"DHGroup", v29);
  CFDictionarySetValue(v33, @"Lifetime", cf);
  CFArraySetValueAtIndex(theArray, v28 + 3, v33);
  CFRelease(v33);
  caddr_t v34 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v34, @"EncryptionAlgorithm", @"AES");
  CFDictionarySetValue(v34, @"HashAlgorithm", @"MD5");
  CFDictionarySetValue(v34, @"DHGroup", v29);
  CFDictionarySetValue(v34, @"Lifetime", cf);
  CFArraySetValueAtIndex(theArray, v28 + 4, v34);
  CFRelease(v34);
  socklen_t v35 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v35, @"EncryptionAlgorithm", @"3DES");
  CFDictionarySetValue(v35, @"HashAlgorithm", @"SHA1");
  CFDictionarySetValue(v35, @"DHGroup", v29);
  CFDictionarySetValue(v35, @"Lifetime", cf);
  CFIndex v36 = v28 + 6;
  CFArraySetValueAtIndex(theArray, v28 + 5, v35);
  CFRelease(v35);
  CFNumberRef v37 = v29;
  uint64_t v38 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v38, @"EncryptionAlgorithm", @"3DES");
  CFDictionarySetValue(v38, @"HashAlgorithm", @"MD5");
  CFDictionarySetValue(v38, @"DHGroup", v29);
  CFDictionarySetValue(v38, @"Lifetime", cf);
  CFArraySetValueAtIndex(theArray, v36, v38);
  CFRelease(v38);
LABEL_29:
  CFRelease(v37);
  CFRelease(cf);
  int v21 = Mutable;
  CFDictionarySetValue(Mutable, @"Proposals", theArray);
  CFRelease(theArray);
  int v43 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v43, @"LocalPort", v58);
  CFDictionarySetValue(v43, @"RemotePort", v57);
  if (v56) {
    CFDictionarySetValue(v43, @"LocalPrefix", v56);
  }
  if (v55) {
    CFDictionarySetValue(v43, @"RemotePrefix", v55);
  }
  CFDictionarySetValue(v43, @"Protocol", v61);
  CFDictionarySetValue(v43, @"Mode", @"Transport");
  CFDictionarySetValue(v43, @"Level", @"Require");
  __int128 v44 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  CFArraySetValueAtIndex(v44, 0LL, @"AES256");
  CFArraySetValueAtIndex(v44, 1LL, @"AES");
  CFArraySetValueAtIndex(v44, 2LL, @"3DES");
  CFDictionarySetValue(v43, @"EncryptionAlgorithm", v44);
  CFRelease(v44);
  sockaddr v45 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  CFArraySetValueAtIndex(v45, 0LL, @"SHA256");
  CFArraySetValueAtIndex(v45, 1LL, @"SHA1");
  CFArraySetValueAtIndex(v45, 2LL, @"MD5");
  CFDictionarySetValue(v43, @"HashAlgorithm", v45);
  CFRelease(v45);
  if (v59)
  {
    MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, v43);
    CFDictionarySetValue(MutableCopy, @"RemotePort", v54);
    CFDictionarySetValue(MutableCopy, @"Direction", @"In");
  }

  else
  {
    MutableCopy = 0LL;
  }

  __int16 v47 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  CFArraySetValueAtIndex(v47, 0LL, v43);
  if (v59)
  {
    CFArraySetValueAtIndex(v47, 1LL, MutableCopy);
    CFRelease(v43);
  }

  else
  {
    MutableCopy = v43;
  }

  CFRelease(MutableCopy);
  CFDictionarySetValue(Mutable, @"Policies", v47);
  CFRelease(v47);
  CFRelease(value);
  CFRelease(v62);
  CFRelease(v58);
  CFRelease(v57);
  if (v56) {
    CFRelease(v56);
  }
  if (v55) {
    CFRelease(v55);
  }
  CFRelease(v54);
  CFRelease(v61);
  if (!v59) {
    CFRelease(v53);
  }
  if (v60) {
    CFRelease(v60);
  }
  return v21;
}

__CFDictionary *IPSecCreateCiscoDefaultConfiguration( const sockaddr *a1, uint64_t a2, const void *a3, const void *a4, int a5, int a6, int a7, const __CFString *a8, int a9)
{
  int v60 = 1;
  int v61 = 0;
  int v59 = -1;
  CFMutableStringRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (a1->sa_family == 30)
  {
    getnameinfo(a1, a1->sa_len, v62, 0x39u, 0LL, 0, 10);
    syslog(3, "IPv6 IPSec Address: %s\n", v62);
    char v18 = v62;
    CFStringEncoding v19 = 134217984;
  }

  else
  {
    char v18 = addr2ascii(2, &a1->sa_data[2], 4, 0LL);
    CFStringEncoding v19 = 1536;
  }

  CFStringRef value = CFStringCreateWithCString(0LL, v18, v19);
  CFNumberRef v20 = addr2ascii(2, (const void *)(a2 + 4), 4, 0LL);
  CFStringRef v51 = CFStringCreateWithCString(0LL, v20, 0x600u);
  signed int valuePtr = bswap32(*(unsigned __int16 *)a1->sa_data) >> 16;
  CFNumberRef v49 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
  signed int valuePtr = bswap32(*(unsigned __int16 *)(a2 + 2)) >> 16;
  CFNumberRef v48 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
  CFNumberRef v47 = CFNumberCreate(0LL, kCFNumberIntType, &v61);
  CFNumberRef v46 = CFNumberCreate(0LL, kCFNumberIntType, &v59);
  if (a6)
  {
    CFNumberRef v44 = 0LL;
    int v21 = @"Obey";
  }

  else
  {
    if (a7) {
      int v22 = &v60;
    }
    else {
      int v22 = &v61;
    }
    CFNumberRef v44 = CFNumberCreate(0LL, kCFNumberIntType, v22);
    int v21 = @"Claim";
  }

  CFNumberRef v45 = CFNumberCreate(0LL, kCFNumberIntType, &v61);
  CFNumberRef v23 = CFNumberCreate(0LL, kCFNumberIntType, &v60);
  CFDictionarySetValue(Mutable, @"ModeConfigEnabled", v23);
  CFDictionarySetValue(Mutable, @"XAuthEnabled", v23);
  CFDictionarySetValue(Mutable, @"LocalAddress", value);
  CFDictionarySetValue(Mutable, @"RemoteAddress", v51);
  CFDictionarySetValue(Mutable, @"ProposalsBehavior", v21);
  if (a6 && CFEqual(a4, @"Certificate"))
  {
    if (!a8)
    {
      if (a3)
      {
        CFDictionarySetValue(Mutable, @"RemoteIdentifier", a3);
        a8 = @"UseRemoteIdentifier";
      }

      else
      {
        a8 = @"GenerateFromRemoteAddress";
      }
    }

    CFDictionarySetValue(Mutable, @"IdentifierVerification", a8);
    BOOL IsAggressiveMode = IPSecIsAggressiveMode(a4, a5, a6);
  }

  else
  {
    CFDictionarySetValue(Mutable, @"IdentifierVerification", @"None");
    BOOL IsAggressiveMode = IPSecIsAggressiveMode(a4, a5, a6);
    if (!a6) {
      CFDictionarySetValue(Mutable, @"NattMultipleUsersEnabled", v44);
    }
  }

  CFDictionarySetValue(Mutable, @"DeadPeerDetectionEnabled", v23);
  CFDictionarySetValue(Mutable, @"BlackHoleDetectionEnabled", v23);
  signed int valuePtr = 20;
  CFNumberRef v25 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
  if (v25)
  {
    CFNumberRef v26 = v25;
    CFDictionarySetValue(Mutable, @"DeadPeerDetectionDelay", v25);
    CFRelease(v26);
  }

  theArray = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  signed int valuePtr = 3600;
  CFNumberRef cf = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
  *(_OWORD *)CFStringRef v62 = xmmword_2EBC8;
  int v27 = 14;
  theDict = Mutable;
  if (IsAggressiveMode)
  {
    if (a9) {
      int v27 = 2;
    }
    else {
      int v27 = 14;
    }
    *(_DWORD *)CFStringRef v62 = v27;
    *(_DWORD *)&v62[4] = 0;
  }

  int v57 = 0;
  signed int valuePtr = v27;
  uint64_t v28 = 4LL;
  do
  {
    CFNumberRef v29 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
    uint64_t v54 = v28;
    if (valuePtr < 5)
    {
      uint64_t v31 = theArray;
    }

    else
    {
      int v30 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v30, @"EncryptionAlgorithm", @"AES256");
      CFDictionarySetValue(v30, @"HashAlgorithm", @"SHA256");
      CFDictionarySetValue(v30, @"DHGroup", v29);
      CFDictionarySetValue(v30, @"Lifetime", cf);
      uint64_t v31 = theArray;
      CFArraySetValueAtIndex(theArray, v57, v30);
      CFRelease(v30);
      ++v57;
    }

    int v32 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v32, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v32, @"HashAlgorithm", @"SHA1");
    CFDictionarySetValue(v32, @"DHGroup", v29);
    CFDictionarySetValue(v32, @"Lifetime", cf);
    CFArraySetValueAtIndex(v31, v57, v32);
    CFRelease(v32);
    CFIndex v33 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v33, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v33, @"HashAlgorithm", @"MD5");
    CFDictionarySetValue(v33, @"DHGroup", v29);
    CFDictionarySetValue(v33, @"Lifetime", cf);
    int v34 = v57 + 2;
    CFArraySetValueAtIndex(v31, v57 + 1, v33);
    CFRelease(v33);
    int v35 = valuePtr;
    if (valuePtr < 14)
    {
      v57 += 2;
    }

    else
    {
      CFIndex v36 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v36, @"EncryptionAlgorithm", @"AES256");
      CFDictionarySetValue(v36, @"HashAlgorithm", @"SHA512");
      CFDictionarySetValue(v36, @"DHGroup", v29);
      CFDictionarySetValue(v36, @"Lifetime", cf);
      v57 += 3;
      CFArraySetValueAtIndex(theArray, v34, v36);
      CFRelease(v36);
      int v35 = valuePtr;
    }

    if (v35 <= 2)
    {
      CFNumberRef v37 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v37, @"EncryptionAlgorithm", @"AES");
      CFDictionarySetValue(v37, @"HashAlgorithm", @"SHA1");
      CFDictionarySetValue(v37, @"DHGroup", v29);
      CFDictionarySetValue(v37, @"Lifetime", cf);
      CFArraySetValueAtIndex(theArray, v57, v37);
      CFRelease(v37);
      uint64_t v38 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v38, @"EncryptionAlgorithm", @"AES");
      CFDictionarySetValue(v38, @"HashAlgorithm", @"MD5");
      CFDictionarySetValue(v38, @"DHGroup", v29);
      CFDictionarySetValue(v38, @"Lifetime", cf);
      CFArraySetValueAtIndex(theArray, v57 + 1, v38);
      CFRelease(v38);
      int v39 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v39, @"EncryptionAlgorithm", @"3DES");
      CFDictionarySetValue(v39, @"HashAlgorithm", @"SHA1");
      CFDictionarySetValue(v39, @"DHGroup", v29);
      CFDictionarySetValue(v39, @"Lifetime", cf);
      CFArraySetValueAtIndex(theArray, v57 + 2, v39);
      CFRelease(v39);
      int v40 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v40, @"EncryptionAlgorithm", @"3DES");
      CFDictionarySetValue(v40, @"HashAlgorithm", @"MD5");
      CFDictionarySetValue(v40, @"DHGroup", v29);
      CFDictionarySetValue(v40, @"Lifetime", cf);
      CFArraySetValueAtIndex(theArray, v57 + 3, v40);
      CFRelease(v40);
      uint64_t v41 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v41, @"EncryptionAlgorithm", @"DES");
      CFDictionarySetValue(v41, @"HashAlgorithm", @"SHA1");
      CFDictionarySetValue(v41, @"DHGroup", v29);
      CFDictionarySetValue(v41, @"Lifetime", cf);
      int v53 = v57 + 5;
      CFArraySetValueAtIndex(theArray, v57 + 4, v41);
      CFRelease(v41);
      pid_t v42 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v42, @"EncryptionAlgorithm", @"DES");
      CFDictionarySetValue(v42, @"HashAlgorithm", @"MD5");
      CFDictionarySetValue(v42, @"DHGroup", v29);
      CFDictionarySetValue(v42, @"Lifetime", cf);
      v57 += 6;
      CFArraySetValueAtIndex(theArray, v53, v42);
      CFRelease(v42);
    }

    CFRelease(v29);
    signed int valuePtr = *(_DWORD *)&v62[v54];
    uint64_t v28 = v54 + 4;
  }

  while (valuePtr);
  CFRelease(cf);
  CFDictionarySetValue(theDict, @"Proposals", theArray);
  CFRelease(theArray);
  CFRelease(value);
  CFRelease(v51);
  CFRelease(v49);
  CFRelease(v48);
  CFRelease(v47);
  CFRelease(v46);
  if (v23) {
    CFRelease(v23);
  }
  if (v45) {
    CFRelease(v45);
  }
  if (!a6) {
    CFRelease(v44);
  }
  return theDict;
}

uint64_t IPSecSelfRepair()
{
  pid_t v0 = racoon_pid();
  if (v0) {
    kill(v0, 15);
  }
  return 0LL;
}

uint64_t IPSecFlushAll()
{
  int v0 = pfkey_open();
  if ((v0 & 0x80000000) == 0)
  {
    int v1 = v0;
    pfkey_send_spdflush(v0);
    pfkey_send_flush(v1, 0);
    pfkey_close(v1);
  }

  return 0LL;
}

void IPSecLogVPNInterfaceAddressEvent(uint64_t a1, uint64_t a2, int a3, char *a4, void *a5)
{
  if (a2)
  {
    unsigned int v42 = bswap32(*(_DWORD *)(a2 + 64));
    unsigned int v8 = (char *)*(unsigned int *)(a2 + 20);
    switch((int)v8)
    {
      case 1:
        v9 = addr2ascii(2, a5, 4, v46);
        uint64_t v10 = *(unsigned int *)(a2 + 28);
        size_t v11 = sub_9708(*(_DWORD *)(a2 + 24));
        __int16 v12 = addr2ascii(2, (const void *)(a2 + 48), 4, v45);
        CFIndex v36 = addr2ascii(2, &v42, 4, v44);
        CFNumberRef v37 = addr2ascii(2, (const void *)(a2 + 72), 4, v43);
        int v34 = v11;
        int v35 = v12;
        int v32 = (char *)(a2 + 32);
        uint64_t v33 = v10;
        uint64_t v31 = v9;
        uint64_t v13 = "%s: Address added. previous interface setting (name: %s, address: %s), current interface setting (name: %s"
              "%d, family: %s, address: %s, subnet: %s, destination: %s).";
        goto LABEL_9;
      case 2:
        int v14 = addr2ascii(2, a5, 4, v46);
        uint64_t v15 = *(unsigned int *)(a2 + 28);
        uint64_t v16 = sub_9708(*(_DWORD *)(a2 + 24));
        uint64_t v17 = addr2ascii(2, (const void *)(a2 + 48), 4, v45);
        CFIndex v36 = addr2ascii(2, &v42, 4, v44);
        CFNumberRef v37 = addr2ascii(2, (const void *)(a2 + 72), 4, v43);
        int v34 = v16;
        int v35 = v17;
        int v32 = (char *)(a2 + 32);
        uint64_t v33 = v15;
        uint64_t v31 = v14;
        uint64_t v13 = "%s: Address changed. previous interface setting (name: %s, address: %s), current interface setting (name: "
              "%s%d, family: %s, address: %s, subnet: %s, destination: %s).";
        goto LABEL_9;
      case 3:
        char v18 = addr2ascii(2, a5, 4, v46);
        uint64_t v19 = *(unsigned int *)(a2 + 28);
        CFNumberRef v20 = sub_9708(*(_DWORD *)(a2 + 24));
        int v21 = addr2ascii(2, (const void *)(a2 + 48), 4, v45);
        CFIndex v36 = addr2ascii(2, &v42, 4, v44);
        CFNumberRef v37 = addr2ascii(2, (const void *)(a2 + 72), 4, v43);
        int v34 = v20;
        int v35 = v21;
        int v32 = (char *)(a2 + 32);
        uint64_t v33 = v19;
        uint64_t v31 = v18;
        uint64_t v13 = "%s: Address deleted. previous interface setting (name: %s, address: %s), deleted interface setting (name: "
              "%s%d, family: %s, address: %s, subnet: %s, destination: %s).";
        goto LABEL_9;
      case 7:
        CFNumberRef v26 = addr2ascii(2, a5, 4, v46);
        uint64_t v27 = *(unsigned int *)(a2 + 28);
        uint64_t v28 = sub_9708(*(_DWORD *)(a2 + 24));
        CFNumberRef v29 = addr2ascii(2, (const void *)(a2 + 48), 4, v45);
        uint64_t v40 = *(unsigned __int8 *)(a2 + 54);
        uint64_t v41 = *(unsigned __int8 *)(a2 + 53);
        uint64_t v38 = (char *)*(unsigned __int8 *)(a2 + 56);
        uint64_t v39 = *(unsigned __int8 *)(a2 + 55);
        CFIndex v36 = (char *)*(unsigned __int8 *)(a2 + 58);
        CFNumberRef v37 = (char *)*(unsigned __int8 *)(a2 + 57);
        int v34 = v28;
        int v35 = v29;
        int v32 = (char *)(a2 + 32);
        uint64_t v33 = v27;
        uint64_t v31 = v26;
        uint64_t v13 = "%s: ARP collided. previous interface setting (name: %s, address: %s), conflicting interface setting (name:"
              " %s%d, family: %s, address: %s, mac: %x:%x:%x:%x:%x:%x).";
LABEL_9:
        int v30 = a4;
        break;
      default:
        int v22 = addr2ascii(2, a5, 4, v46);
        CFNumberRef v23 = (char *)*(unsigned int *)(a2 + 28);
        int v24 = sub_9708(*(_DWORD *)(a2 + 24));
        CFNumberRef v25 = addr2ascii(2, (const void *)(a2 + 48), 4, v45);
        CFNumberRef v37 = addr2ascii(2, &v42, 4, v44);
        uint64_t v38 = addr2ascii(2, (const void *)(a2 + 72), 4, v43);
        int v35 = v24;
        CFIndex v36 = v25;
        uint64_t v33 = a2 + 32;
        int v34 = v23;
        uint64_t v31 = a4;
        int v32 = v22;
        uint64_t v13 = "%s: Unknown Address event (%d). previous interface setting (name: %s, address: %s), other interface settin"
              "g (name: %s%d, family: %s, address: %s, subnet: %s, destination: %s).";
        int v30 = v8;
        break;
    }

    syslog(5, v13, a1, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41);
  }

  else
  {
    addr2ascii(2, a5, 4, v46);
    syslog(5, "%s: %d secs TIMEOUT waiting for interface to be reconfigured. previous setting (name: %s, address: %s).");
  }
}

char *sub_9708(int a1)
{
  int v1 = byte_40510;
  snprintf(byte_40510, 0x10uLL, "%d", a1);
  return v1;
}

void update_service_route(uint64_t a1, int a2, int a3, int a4, int a5, int a6, __int16 a7, int a8)
{
  uint64_t v16 = *(_DWORD **)(a1 + 1048);
  if (v16)
  {
    while (v16[2] != a2 || v16[3] != a3 || v16[4] != a4 || v16[5] != a5)
    {
      uint64_t v16 = *(_DWORD **)v16;
      if (!v16) {
        goto LABEL_7;
      }
    }

    goto LABEL_9;
  }

LABEL_7:
  uint64_t v16 = calloc(1uLL, 0x28uLL);
  if (v16)
  {
    v16[2] = a2;
    v16[3] = a3;
    v16[4] = a4;
    v16[5] = a5;
    *(void *)uint64_t v16 = *(void *)(a1 + 1048);
    *(void *)(a1 + 1048) = v16;
LABEL_9:
    v16[6] = a6;
    *((_WORD *)v16 + 14) = a7;
    v16[8] = a8;
    return;
  }

  syslog(3, "%s: no memory\n", "update_service_route");
}

    AddNumber(v7, kSCPropNetPPPLastCause, *(_DWORD *)(a1 + 632));
    AddNumber(v7, kSCPropNetPPPDeviceLastCause, *(_DWORD *)(a1 + 636));
    goto LABEL_17;
  }

  size_t v11 = *(void *)(a1 + 584);
  if (v11)
  {
    __int16 v12 = ne_sm_bridge_get_connect_time(v11);
    AddNumber64(v7, kSCPropNetPPPConnectTime, v12);
    goto LABEL_17;
  }

  uint64_t v13 = (const __SCDynamicStore *)gDynamicStore;
  int v14 = *(const __CFString **)(a1 + 24);
  uint64_t v15 = (const void **)&kSCPropNetPPPRetryConnectTime;
LABEL_16:
  AddNumberFromState(v13, v14, kSCEntNetPPP, *v15, v7);
LABEL_17:
  CFDictionaryAddValue(v5, kSCEntNetPPP, v7);
  my_CFRelease((const void **)&value);
  if (!*(_WORD *)(a1 + 66))
  {
    uint64_t v16 = *(_DWORD *)(a1 + 628);
    if ((v16 | 4) != 0xC) {
      goto LABEL_19;
    }
    int v32 = CFDictionaryCreateMutable(0LL, 0LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFStringRef value = v32;
    if (v32)
    {
      AddNumberFromState( (const __SCDynamicStore *)gDynamicStore,  *(const __CFString **)(a1 + 24),  kSCEntNetModem,  kSCPropNetModemConnectSpeed,  v32);
      CFDictionaryAddValue(v5, kSCEntNetModem, value);
      my_CFRelease((const void **)&value);
      goto LABEL_18;
    }

void *free_service_routes(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 1048);
  if (result)
  {
    do
    {
      size_t v3 = (void *)*result;
      free(result);
      uint64_t result = v3;
    }

    while (v3);
  }

  *(void *)(a1 + 1048) = 0LL;
  return result;
}

uint64_t find_injection(const __CFString *a1, const __CFString *a2, uint64_t a3)
{
  if ((unint64_t)CFStringFind(a1, @"", 0LL).length)
  {
    int v6 = @"injection: string contains  ";
  }

  else
  {
    CFRange v7 = CFStringFind(a1, @";", 0LL);
    if (!v7.length
      || (v11.location = v7.location + v7.length,
          v11.length = a3 - (v7.location + v7.length),
          !CFStringFindWithOptions(a1, a2, v11, 0LL, 0LL)))
    {
      CFRange v8 = CFStringFind(a1, a2, 0LL);
      if (!v8.length) {
        return 0LL;
      }
      v12.location = v8.location + v8.length;
      v12.length = a3 - (v8.location + v8.length);
      if (!CFStringFindWithOptions(a1, @";", v12, 0LL, 0LL)) {
        return 0LL;
      }
    }

    int v6 = @"injection: string contains %@";
  }

  uint64_t v9 = 1LL;
  SCLog(1LL, 3LL, v6);
  return v9;
}

uint64_t racoon_validate_cfg_str(char *cStr)
{
  int v1 = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
  int v2 = v1;
  if (!v1
    || (CFIndex Length = CFStringGetLength(v1), find_injection(v2, @"include ", Length))
    || find_injection(v2, @"privsep ", Length)
    || find_injection(v2, @"path ", Length)
    || find_injection(v2, @"timer ", Length)
    || find_injection(v2, @"listen ", Length)
    || find_injection(v2, @"remote ", Length)
    || find_injection(v2, @"sainfo ", Length)
    || find_injection(v2, @"banner ", Length)
    || find_injection(v2, @"my_identifier ", Length)
    || find_injection(v2, @"peers_identifier ", Length))
  {
    CFRelease(v2);
    return 0LL;
  }

  else
  {
    CFRelease(v2);
    return 1LL;
  }

uint64_t sub_9AC0(FILE *a1, const __CFDictionary *a2, const char **a3)
{
  if (a2)
  {
    Value = (const __CFArray *)CFDictionaryGetValue(a2, @"EncryptionAlgorithm");
    if (isArray(Value))
    {
      CFIndex Count = CFArrayGetCount(Value);
      if (Count >= 1)
      {
        CFIndex v7 = Count;
        CFIndex v8 = 0LL;
        uint64_t v9 = 0LL;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(Value, v8);
          if (isString(ValueAtIndex))
          {
            if (v9) {
              __strlcat_chk(__str, ", ", 1024LL, 1024LL);
            }
            int v11 = CFEqual(ValueAtIndex, @"DES");
            CFRange v12 = "des";
            if (!v11)
            {
              int v13 = CFEqual(ValueAtIndex, @"3DES");
              CFRange v12 = "3des";
              if (!v13)
              {
                int v14 = CFEqual(ValueAtIndex, @"AES");
                CFRange v12 = "aes";
                if (!v14)
                {
                  int v15 = CFEqual(ValueAtIndex, @"AES256");
                  CFRange v12 = "aes 256";
                  if (!v15)
                  {
                    int v34 = "incorrect encryption algorithm";
LABEL_51:
                    *a3 = v34;
                    return 0xFFFFFFFFLL;
                  }
                }
              }
            }

            __strlcat_chk(__str, v12, 1024LL, 1024LL);
            uint64_t v9 = 1LL;
          }

          ++v8;
        }

        while (v7 != v8);
        if (v9) {
          goto LABEL_16;
        }
      }
    }
  }

  __strlcat_chk(__str, "aes", 1024LL, 1024LL);
LABEL_16:
  __strlcat_chk(__str, ";\n", 1024LL, 1024LL);
  fprintf(a1, "%s%s", off_40008[0], __str);
  __strlcpy_chk(__str, "authentication_algorithm ", 1024LL, 1024LL);
  if (a2)
  {
    uint64_t v16 = (const __CFArray *)CFDictionaryGetValue(a2, @"HashAlgorithm");
    if (isArray(v16))
    {
      CFIndex v17 = CFArrayGetCount(v16);
      if (v17 >= 1)
      {
        CFIndex v18 = v17;
        uint64_t v19 = 0LL;
        for (CFIndex i = 0LL; i != v18; ++i)
        {
          int v21 = CFArrayGetValueAtIndex(v16, i);
          if (isString(v21))
          {
            if (v19) {
              __strlcat_chk(__str, ", ", 1024LL, 1024LL);
            }
            int v22 = CFEqual(v21, @"SHA512");
            CFNumberRef v23 = "hmac_sha512";
            if (!v22)
            {
              int v24 = CFEqual(v21, @"SHA256");
              CFNumberRef v23 = "hmac_sha256";
              if (!v24)
              {
                int v25 = CFEqual(v21, @"SHA1");
                CFNumberRef v23 = "hmac_sha1";
                if (!v25)
                {
                  int v26 = CFEqual(v21, @"MD5");
                  CFNumberRef v23 = "hmac_md5";
                  if (!v26)
                  {
                    int v34 = "incorrect authentication algorithm";
                    goto LABEL_51;
                  }
                }
              }
            }

            __strlcat_chk(__str, v23, 1024LL, 1024LL);
            uint64_t v19 = 1LL;
          }
        }

        if (v19) {
          goto LABEL_31;
        }
      }
    }
  }

  __strlcat_chk(__str, "hmac_sha1", 1024LL, 1024LL);
LABEL_31:
  __strlcat_chk(__str, ";\n", 1024LL, 1024LL);
  fprintf(a1, "%s%s", off_40008[0], __str);
  __strlcpy_chk(__str, "compression_algorithm ", 1024LL, 1024LL);
  if (a2)
  {
    uint64_t v27 = (const __CFArray *)CFDictionaryGetValue(a2, @"CompressionAlgorithm");
    if (isArray(v27))
    {
      CFIndex v28 = CFArrayGetCount(v27);
      if (v28 >= 1)
      {
        CFIndex v29 = v28;
        uint64_t v30 = 0LL;
        for (CFIndex j = 0LL; j != v29; ++j)
        {
          int v32 = CFArrayGetValueAtIndex(v27, j);
          if (isString(v32))
          {
            if (v30) {
              __strlcat_chk(__str, ", ", 1024LL, 1024LL);
            }
            if (!CFEqual(v32, @"Deflate"))
            {
              int v34 = "incorrect compression algorithm";
              goto LABEL_51;
            }

            __strlcat_chk(__str, "deflate", 1024LL, 1024LL);
            uint64_t v30 = 1LL;
          }
        }

        if (v30) {
          goto LABEL_43;
        }
      }
    }
  }

  __strlcat_chk(__str, "deflate", 1024LL, 1024LL);
LABEL_43:
  __strlcat_chk(__str, ";\n", 1024LL, 1024LL);
  fprintf(a1, "%s%s", off_40008[0], __str);
  int v36 = 3600;
  if (a2)
  {
    GetIntFromDict(a2, @"Lifetime", &v36, 3600);
    snprintf(__str, 0x400uLL, "lifetime time %d sec;\n", v36);
    fprintf(a1, "%s%s", off_40008[0], __str);
    int v36 = 0;
    if (GetIntFromDict(a2, @"PFSGroup", &v36, 0))
    {
      if (v36)
      {
        snprintf(__str, 0x400uLL, "pfs_group %d;\n", v36);
        fprintf(a1, "%s%s", off_40008[0], __str);
      }
    }
  }

  else
  {
    snprintf(__str, 0x400uLL, "lifetime time %d sec;\n", 3600);
    fprintf(a1, "%s%s", off_40008[0], __str);
  }

  return 0LL;
}

uint64_t sub_A060(const __CFData *a1, uint64_t a2)
{
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  if (Length / 3 + Length + Length % 3 > 1023) {
    return 0LL;
  }
  unint64_t v7 = Length;
  if (Length < 1)
  {
    uint64_t result = 0LL;
    goto LABEL_20;
  }

  uint64_t result = 0LL;
  unint64_t v8 = 0LL;
  unint64_t v9 = v7;
  do
  {
    unint64_t v10 = v8 % 3;
    if (v8 % 3 == 2)
    {
      uint64_t v12 = result + 1;
      *(_BYTE *)(a2 + result) = aAbcdefghijklmn[((unint64_t)(*BytePtr | (*(BytePtr - 1) << 8)) >> 6) & 0x3F];
      unint64_t v11 = *BytePtr & 0x3F;
      uint64_t v13 = 2LL;
    }

    else
    {
      if (v10 == 1)
      {
        unint64_t v11 = ((unint64_t)(*BytePtr | (*(BytePtr - 1) << 8)) >> 4) & 0x3F;
      }

      else
      {
        if (v10) {
          goto LABEL_13;
        }
        unint64_t v11 = (unint64_t)*BytePtr >> 2;
      }

      uint64_t v13 = 1LL;
      uint64_t v12 = result;
    }

    result += v13;
    *(_BYTE *)(a2 + v12) = aAbcdefghijklmn[v11];
LABEL_13:
    ++v8;
    ++BytePtr;
    --v9;
  }

  while (v9);
  unint64_t v14 = v7 % 3;
  if (v14 == 2)
  {
    char v16 = aAbcdefghijklmn[4 * (*(BytePtr - 1) & 0xF)];
    uint64_t v17 = 2LL;
    uint64_t v18 = 1LL;
    uint64_t v15 = result;
LABEL_19:
    uint64_t v19 = result + v18;
    *(_BYTE *)(a2 + v15) = v16;
    result += v17;
    *(_BYTE *)(a2 + v19) = 61;
  }

  else if (v14 == 1)
  {
    uint64_t v15 = result + 1;
    *(_BYTE *)(a2 + result) = aAbcdefghijklmn[16 * (*(BytePtr - 1) & 3)];
    char v16 = 61;
    uint64_t v17 = 3LL;
    uint64_t v18 = 2LL;
    goto LABEL_19;
  }

LABEL_20:
  *(_BYTE *)(a2 + result) = 0;
  return result;
}

  SCLog(1LL, 3LL, v12);
  uint64_t result = gNotifyOnDemandToken;
  if (gNotifyOnDemandToken != -1)
  {
    uint64_t result = notify_cancel(gNotifyOnDemandToken);
    gNotifyOnDemandToken = -1;
  }

  return result;
}

char *sub_A20C(unsigned int a1, unsigned int a2)
{
  unsigned int v3 = bswap32(a1);
  if ((v3 & 0xFFFFFF) != 0)
  {
    if ((_WORD)v3)
    {
      if ((_BYTE)v3) {
        snprintf(byte_40410, 0x100uLL, "%u.%u.%u.%u");
      }
      else {
        snprintf(byte_40410, 0x100uLL, "%u.%u.%u");
      }
    }

    else
    {
      snprintf(byte_40410, 0x100uLL, "%u.%u");
    }
  }

  else
  {
    snprintf(byte_40410, 0x100uLL, "%u");
  }

  uint64_t result = &byte_40410[strlen(byte_40410)];
  if (a2)
  {
    int v5 = 0;
    unsigned int v6 = bswap32(a2);
    while (((v6 >> v5) & 1) == 0)
    {
      if (++v5 == 32) {
        return (char *)snprintf(result, 8uLL, "/%d");
      }
    }

    int v7 = v5;
    while (v7 != 31)
    {
      unsigned int v8 = v6 >> v7++;
      if ((v8 & 2) == 0) {
        return (char *)snprintf(result, 8uLL, "&0x%x");
      }
    }

    return (char *)snprintf(result, 8uLL, "/%d");
  }

  else
  {
    char *result = 0;
  }

  return result;
}

uint64_t scnc_cache_routing_table(uint64_t a1, const __CFDictionary *a2, int a3, int a4)
{
  if (qword_40528 != -1) {
    dispatch_once(&qword_40528, &stru_39330);
  }
  unsigned int v8 = (const __SCPreferences *)qword_40520;
  if (!qword_40520) {
    return 0LL;
  }
  Value = (const __CFDictionary *)SCPreferencesGetValue((SCPreferencesRef)qword_40520, *(CFStringRef *)(a1 + 24));
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID) {
    MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, Value);
  }
  else {
    MutableCopy = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  }
  uint64_t v12 = MutableCopy;
  if (!MutableCopy) {
    return 0LL;
  }
  if (a3) {
    uint64_t v13 = (__CFString *)kSCEntNetIPv4;
  }
  else {
    uint64_t v13 = 0LL;
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 0x40000000LL;
  v19[2] = sub_A7E0;
  v19[3] = &unk_39290;
  char v20 = a4;
  char v21 = a3;
  if (a3) {
    unint64_t v14 = (__CFString *)kSCEntNetIPv6;
  }
  else {
    unint64_t v14 = 0LL;
  }
  sub_A558(MutableCopy, a2, a4, @"IPv4", v13, (uint64_t)v19);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 0x40000000LL;
  v16[2] = sub_AAEC;
  v16[3] = &unk_392F0;
  char v17 = a4;
  char v18 = a3;
  sub_A558(v12, a2, a4, @"IPv6", v14, (uint64_t)v16);
  if (my_CFEqual((unint64_t)Value, (unint64_t)v12))
  {
    CFRelease(v12);
    return 0LL;
  }

  SCPreferencesSetValue(v8, *(CFStringRef *)(a1 + 24), v12);
  SCPreferencesCommitChanges(v8);
  SCPreferencesApplyChanges(v8);
  my_CFRelease((const void **)(a1 + 504));
  *(void *)(a1 + 504) = v12;
  return 1LL;
}

void sub_A558(CFDictionaryRef theDict, const __CFDictionary *a2, int a3, void *key, void *a5, uint64_t a6)
{
  if (a6)
  {
    Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, key);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (a2 && CFGetTypeID(a2) == TypeID)
    {
      if (a5) {
        unint64_t v14 = a5;
      }
      else {
        unint64_t v14 = key;
      }
      uint64_t v15 = CFDictionaryGetValue(a2, v14);
      CFTypeID v16 = CFDictionaryGetTypeID();
      if (v15)
      {
        BOOL v17 = CFGetTypeID(v15) == v16;
        if (a3) {
          goto LABEL_29;
        }
LABEL_12:
        if (!v17)
        {
          if (!Value) {
            return;
          }
LABEL_33:
          CFDictionaryRemoveValue(theDict, key);
          return;
        }

LABEL_29:
        CFTypeID v23 = CFDictionaryGetTypeID();
        if (Value && CFGetTypeID(Value) == v23) {
          CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, Value);
        }
        else {
          CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        }
        CFMutableDictionaryRef v25 = MutableCopy;
        if (MutableCopy)
        {
          (*(void (**)(uint64_t, CFMutableDictionaryRef, const void *))(a6 + 16))(a6, MutableCopy, v15);
          if (CFDictionaryGetCount(v25) < 1)
          {
            if (Value) {
              CFDictionaryRemoveValue(theDict, key);
            }
          }

          else if (!my_CFEqual((unint64_t)Value, (unint64_t)v25))
          {
            CFDictionarySetValue(theDict, key, v25);
          }

          CFRelease(v25);
        }

        return;
      }
    }

    else
    {
      CFDictionaryGetTypeID();
      uint64_t v15 = 0LL;
    }

    BOOL v17 = 0;
    if (a3) {
      goto LABEL_29;
    }
    goto LABEL_12;
  }

  CFTypeID v18 = CFDictionaryGetTypeID();
  if (a2 && CFGetTypeID(a2) == v18)
  {
    uint64_t v19 = a5 ? a5 : key;
    char v20 = CFDictionaryGetValue(a2, v19);
    if (v20)
    {
      char v21 = v20;
      CFTypeID v22 = CFGetTypeID(v20);
      if (v22 == CFArrayGetTypeID()
        || v22 == CFBooleanGetTypeID()
        || v22 == CFDataGetTypeID()
        || v22 == CFDateGetTypeID()
        || v22 == CFDictionaryGetTypeID()
        || v22 == CFNumberGetTypeID()
        || v22 == CFStringGetTypeID())
      {
        CFDictionarySetValue(theDict, key, v21);
        return;
      }
    }
  }

  if (CFDictionaryContainsKey(theDict, key)) {
    goto LABEL_33;
  }
}

void sub_A7E0(uint64_t a1, CFDictionaryRef theDict, const __CFDictionary *a3)
{
  int v6 = *(unsigned __int8 *)(a1 + 32);
  char v7 = *(_BYTE *)(a1 + 33);
  if (v7) {
    unsigned int v8 = (void *)kSCPropNetIPv4IncludedRoutes;
  }
  else {
    unsigned int v8 = 0LL;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 0x40000000LL;
  v13[2] = sub_A8D8;
  v13[3] = &unk_39250;
  char v14 = v6;
  char v15 = v7;
  sub_A558(theDict, a3, v6, @"IncludedRoutes", v8, (uint64_t)v13);
  char v9 = *(_BYTE *)(a1 + 33);
  if (v9) {
    unint64_t v10 = (void *)kSCPropNetIPv4ExcludedRoutes;
  }
  else {
    unint64_t v10 = 0LL;
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 0x40000000LL;
  v11[2] = sub_AA5C;
  v11[3] = &unk_39270;
  char v12 = v9;
  sub_A558(theDict, a3, 0, @"ExcludedRoutes", v10, (uint64_t)v11);
}

void sub_A8D8(uint64_t a1, CFDictionaryRef theDict, const __CFDictionary *a3)
{
  if (*(_BYTE *)(a1 + 32))
  {
    *(_DWORD *)bytes = 0;
    CFDataRef v4 = CFDataCreate(kCFAllocatorDefault, bytes, 4LL);
    CFDataRef v13 = v4;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    int v6 = Mutable;
    CFMutableDictionaryRef v12 = Mutable;
    if (v4) {
      BOOL v7 = Mutable == 0LL;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7)
    {
      CFDictionaryAddValue(Mutable, @"Addresses", v4);
      CFDictionaryAddValue(v6, @"Masks", v4);
    }

    sub_A558(theDict, v6, 0, @"Addresses", 0LL, 0LL);
    sub_A558(theDict, v6, 0, @"Masks", 0LL, 0LL);
    my_CFRelease((const void **)&v12);
    my_CFRelease((const void **)&v13);
  }

  else
  {
    if (*(_BYTE *)(a1 + 33)) {
      unint64_t v10 = (void *)kSCPropNetIPv4RouteDestinationAddress;
    }
    else {
      unint64_t v10 = 0LL;
    }
    sub_A558(theDict, a3, 0, @"Addresses", v10, 0LL);
    if (*(_BYTE *)(a1 + 33)) {
      unint64_t v11 = (void *)kSCPropNetIPv4RouteSubnetMask;
    }
    else {
      unint64_t v11 = 0LL;
    }
    sub_A558(theDict, a3, 0, @"Masks", v11, 0LL);
  }

void sub_AA5C(uint64_t a1, CFDictionaryRef theDict, const __CFDictionary *a3)
{
  if (*(_BYTE *)(a1 + 32)) {
    int v6 = (void *)kSCPropNetIPv4RouteDestinationAddress;
  }
  else {
    int v6 = 0LL;
  }
  sub_A558(theDict, a3, 0, @"Addresses", v6, 0LL);
  if (*(_BYTE *)(a1 + 32)) {
    BOOL v7 = @"Masks";
  }
  else {
    BOOL v7 = 0LL;
  }
  sub_A558(theDict, a3, 0, kSCPropNetIPv4RouteSubnetMask, v7, 0LL);
}

void sub_AAEC(uint64_t a1, CFDictionaryRef theDict, const __CFDictionary *a3)
{
  int v6 = *(unsigned __int8 *)(a1 + 32);
  char v7 = *(_BYTE *)(a1 + 33);
  if (v7) {
    unsigned int v8 = (void *)kSCPropNetIPv6IncludedRoutes;
  }
  else {
    unsigned int v8 = 0LL;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 0x40000000LL;
  v13[2] = sub_ABE4;
  v13[3] = &unk_392B0;
  char v14 = v6;
  char v15 = v7;
  sub_A558(theDict, a3, v6, @"IncludedRoutes", v8, (uint64_t)v13);
  char v9 = *(_BYTE *)(a1 + 33);
  if (v9) {
    unint64_t v10 = (void *)kSCPropNetIPv6ExcludedRoutes;
  }
  else {
    unint64_t v10 = 0LL;
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 0x40000000LL;
  v11[2] = sub_AD68;
  v11[3] = &unk_392D0;
  char v12 = v9;
  sub_A558(theDict, a3, 0, @"ExcludedRoutes", v10, (uint64_t)v11);
}

void sub_ABE4(uint64_t a1, CFDictionaryRef theDict, const __CFDictionary *a3)
{
  if (*(_BYTE *)(a1 + 32))
  {
    *(void *)bytes = 0LL;
    uint64_t v15 = 0LL;
    CFDataRef v4 = CFDataCreate(kCFAllocatorDefault, bytes, 16LL);
    CFDataRef v13 = v4;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    int v6 = Mutable;
    CFMutableDictionaryRef v12 = Mutable;
    if (v4) {
      BOOL v7 = Mutable == 0LL;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7)
    {
      CFDictionaryAddValue(Mutable, @"Addresses", v4);
      CFDictionaryAddValue(v6, @"Masks", v4);
    }

    sub_A558(theDict, v6, 0, @"Addresses", 0LL, 0LL);
    sub_A558(theDict, v6, 0, @"Masks", 0LL, 0LL);
    my_CFRelease((const void **)&v12);
    my_CFRelease((const void **)&v13);
  }

  else
  {
    if (*(_BYTE *)(a1 + 33)) {
      unint64_t v10 = (void *)kSCPropNetIPv6RouteDestinationAddress;
    }
    else {
      unint64_t v10 = 0LL;
    }
    sub_A558(theDict, a3, 0, @"Addresses", v10, 0LL);
    if (*(_BYTE *)(a1 + 33)) {
      unint64_t v11 = (void *)kSCPropNetIPv6RoutePrefixLength;
    }
    else {
      unint64_t v11 = 0LL;
    }
    sub_A558(theDict, a3, 0, @"Masks", v11, 0LL);
  }

void sub_AD68(uint64_t a1, CFDictionaryRef theDict, const __CFDictionary *a3)
{
  if (*(_BYTE *)(a1 + 32)) {
    int v6 = (void *)kSCPropNetIPv6RouteDestinationAddress;
  }
  else {
    int v6 = 0LL;
  }
  sub_A558(theDict, a3, 0, @"Addresses", v6, 0LL);
  if (*(_BYTE *)(a1 + 32)) {
    BOOL v7 = (void *)kSCPropNetIPv6RoutePrefixLength;
  }
  else {
    BOOL v7 = 0LL;
  }
  sub_A558(theDict, a3, 0, @"Masks", v7, 0LL);
}

CFTypeRef scnc_cache_init_service(uint64_t a1)
{
  if (qword_40528 != -1) {
    dispatch_once(&qword_40528, &stru_39330);
  }
  if (qword_40520) {
    CFPropertyListRef Value = SCPreferencesGetValue((SCPreferencesRef)qword_40520, *(CFStringRef *)(a1 + 24));
  }
  else {
    CFPropertyListRef Value = 0LL;
  }
  my_CFRelease((const void **)(a1 + 504));
  CFTypeRef result = my_CFRetain(Value);
  *(void *)(a1 + 504) = result;
  return result;
}

void scnc_cache_flush_removed_services(const __CFArray *a1)
{
  if (qword_40528 != -1) {
    dispatch_once(&qword_40528, &stru_39330);
  }
  int v2 = (const __SCPreferences *)qword_40520;
  CFArrayRef v3 = SCPreferencesCopyKeyList((SCPreferencesRef)qword_40520);
  CFArrayRef v11 = v3;
  CFIndex Count = CFArrayGetCount(v3);
  CFIndex v5 = CFArrayGetCount(a1);
  if (Count <= 0)
  {
    my_CFRelease((const void **)&v11);
  }

  else
  {
    CFIndex v6 = v5;
    CFIndex v7 = 0LL;
    int v8 = 0;
    do
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v3, v7);
      unint64_t v10 = CFArrayGetValueAtIndex(v3, v7);
      v12.location = 0LL;
      v12.length = v6;
      if (!CFArrayContainsValue(a1, v12, v10))
      {
        SCPreferencesRemoveValue(v2, ValueAtIndex);
        int v8 = 1;
      }

      ++v7;
    }

    while (Count != v7);
    my_CFRelease((const void **)&v11);
    if (v8)
    {
      SCPreferencesCommitChanges(v2);
      SCPreferencesApplyChanges(v2);
    }
  }

void sub_AF88(id a1)
{
  int v1 = SCPreferencesCreate(kCFAllocatorDefault, @"PPPController", @"com.apple.scnc-cache.plist");
  qword_40520 = (uint64_t)v1;
  if (!v1)
  {
    int v2 = SCError();
    SCErrorString(v2);
    SCLog(1LL, 3LL, @"SCPreferencesCreate failed: %s");
    int v1 = (const __SCPreferences *)qword_40520;
  }

  SCPreferencesSynchronize(v1);
}

uint64_t ipsec_check_keylen(int a1, int a2, unsigned int a3)
{
  int v5 = 2;
  if (a1 != 14)
  {
    if (a1 != 15) {
      goto LABEL_6;
    }
    int v5 = 3;
  }

  CFIndex v6 = sub_B0DC(v5, a2);
  if (v6)
  {
    CFIndex v7 = v6;
    unsigned int v8 = *((unsigned __int16 *)v6 + 1);
    int v5 = 14;
    if (v8 <= a3)
    {
      unsigned int v10 = *((unsigned __int16 *)v7 + 2);
      if (v10 >= a3) {
        int v5 = 0;
      }
      else {
        int v5 = 14;
      }
      if (v10 >= a3) {
        uint64_t v9 = 0LL;
      }
      else {
        uint64_t v9 = 0xFFFFFFFFLL;
      }
      goto LABEL_14;
    }

LABEL_6:
    uint64_t v9 = 0xFFFFFFFFLL;
LABEL_14:
    __ipsec_errcode = v5;
    return v9;
  }

  return 0xFFFFFFFFLL;
}

uint64_t ipsec_check_keylen2(int a1, int a2, unsigned int a3)
{
  CFDataRef v4 = sub_B0DC(a1, a2);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  int v5 = 14;
  if (*((unsigned __int16 *)v4 + 1) <= a3)
  {
    unsigned int v7 = *((unsigned __int16 *)v4 + 2);
    if (v7 >= a3) {
      int v5 = 0;
    }
    else {
      int v5 = 14;
    }
    if (v7 >= a3) {
      uint64_t result = 0LL;
    }
    else {
      uint64_t result = 0xFFFFFFFFLL;
    }
  }

  else
  {
    uint64_t result = 0xFFFFFFFFLL;
  }

  __ipsec_errcode = v5;
  return result;
}

unsigned __int8 *sub_B0DC(int a1, int a2)
{
  uint64_t v2 = 0LL;
  while (dword_2EBF4[v2] != a1)
  {
    if (++v2 == 3) {
      goto LABEL_6;
    }
  }

  if (v2 == 0xFFFFFFFFLL)
  {
LABEL_6:
    int v3 = 2;
LABEL_7:
    uint64_t result = 0LL;
    __ipsec_errcode = v3;
    return result;
  }

  int v5 = (unsigned __int16 *)qword_40530[v2];
  if (!v5)
  {
    int v3 = 22;
    goto LABEL_7;
  }

  unsigned int v6 = *v5;
  if (v6 < 0x10)
  {
LABEL_14:
    int v3 = 1;
    goto LABEL_7;
  }

  uint64_t result = (unsigned __int8 *)(v5 + 4);
  int v7 = v6 + 8;
  while (*result != a2)
  {
    result += 8;
    v7 -= 8;
    if (v7 <= 23) {
      goto LABEL_14;
    }
  }

  return result;
}

uint64_t ipsec_get_keylen(int a1, int a2, void *a3)
{
  if (a3)
  {
    int v5 = 2;
    if (a1 != 14)
    {
      if (a1 != 15)
      {
        uint64_t v8 = 0xFFFFFFFFLL;
        goto LABEL_9;
      }

      int v5 = 3;
    }

    unsigned int v6 = sub_B0DC(v5, a2);
    if (!v6) {
      return 0xFFFFFFFFLL;
    }
    int v7 = v6;
    int v5 = 0;
    uint64_t v8 = 0LL;
    *a3 = *(void *)v7;
  }

  else
  {
    uint64_t v8 = 0xFFFFFFFFLL;
    int v5 = 2;
  }

LABEL_9:
  __ipsec_errcode = v5;
  return v8;
}

  CFDataRef v4 = &service_head;
  int v5 = *(void *)a1;
  if (*(void *)a1) {
    CFDataRef v4 = *(uint64_t **)a1;
  }
  v4[1] = *((void *)a1 + 1);
  **((void **)a1 + 1) = v5;
  reachability_clear((uint64_t)a1);
  client_notify(*((CFStringRef *)a1 + 3), *((char **)a1 + 7), a1[34] | (a1[33] << 16), 0, 0, 8);
  unsigned int v6 = (void *)*((void *)a1 + 7);
  if (v6) {
    free(v6);
  }
  int v7 = (__CFUserNotification *)*((void *)a1 + 21);
  if (v7)
  {
    CFUserNotificationCancel(v7);
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, *((CFRunLoopSourceRef *)a1 + 22), kCFRunLoopDefaultMode);
    my_CFRelease((const void **)a1 + 21);
    my_CFRelease((const void **)a1 + 22);
  }

  uint64_t v9 = *((_DWORD *)a1 + 24);
  if (v9)
  {
    mach_port_deallocate(mach_task_self_, v9);
    *((_DWORD *)a1 + 24) = 0;
  }

  unsigned int v10 = *((_DWORD *)a1 + 25);
  if (v10)
  {
    mach_port_deallocate(mach_task_self_, v10);
    *((_DWORD *)a1 + 25) = 0;
  }

  my_CFRelease((const void **)a1 + 3);
  my_CFRelease((const void **)a1 + 5);
  my_CFRelease((const void **)a1 + 6);
  my_CFRelease((const void **)a1 + 4);
  my_CFRelease((const void **)a1 + 52);
  my_CFRelease((const void **)a1 + 53);
  my_CFRelease((const void **)a1 + 56);
  my_CFRelease((const void **)a1 + 54);
  my_CFRelease((const void **)a1 + 57);
  my_CFRelease((const void **)a1 + 62);
  my_CFRelease((const void **)a1 + 63);
  CFArrayRef v11 = (void *)*((void *)a1 + 64);
  if (v11) {
    free(v11);
  }
  CFRange v12 = (void *)*((void *)a1 + 65);
  if (v12) {
    free(v12);
  }
  free(a1);
}

uint64_t pfkey_set_softrate(unsigned int a1, int a2)
{
  __ipsec_errcode = 0;
  else {
    int v2 = 100;
  }
  switch(a1)
  {
    case 0u:
      uint64_t result = 0LL;
      dword_40020 = v2;
      break;
    case 1u:
      uint64_t result = 0LL;
      dword_40024 = v2;
      break;
    case 2u:
      uint64_t result = 0LL;
      dword_40028 = v2;
      break;
    case 3u:
      uint64_t result = 0LL;
      dword_4002C = v2;
      break;
    default:
      *(_DWORD *)a1 = 2;
      uint64_t result = 1LL;
      break;
  }

  return result;
}

uint64_t pfkey_get_softrate(int a1)
{
  switch(a1)
  {
    case 0:
      uint64_t result = dword_40020;
      break;
    case 1:
      uint64_t result = dword_40024;
      break;
    case 2:
      uint64_t result = dword_40028;
      break;
    case 3:
      uint64_t result = dword_4002C;
      break;
    default:
      uint64_t result = 0xFFFFFFFFLL;
      break;
  }

  return result;
}

uint64_t pfkey_send_getspi( int a1, char a2, char a3, unsigned __int8 *a4, unsigned __int8 *a5, unsigned int a6, unsigned int a7, int a8, int a9)
{
  if (a4 && a5)
  {
    int v11 = a4[1];
    if (v11 == a5[1])
    {
      if (a6 > a7 || a6 - 1 <= 0xFE)
      {
        SCLog(1LL, 3LL, @"%s: invalid SPI\n");
        int v19 = 18;
      }

      else
      {
        if (v11 == 2)
        {
          char v18 = 32;
LABEL_13:
          char v36 = v18;
          BOOL v20 = a6 < 0x100 || a7 == -1;
          char v21 = v20;
          char v35 = v21;
          if (v20) {
            uint64_t v22 = 50LL;
          }
          else {
            uint64_t v22 = 66LL;
          }
          size_t v23 = ((*a4 - 1LL) | 7) + ((*a5 - 1LL) | 7) + v22;
          int v24 = calloc(1uLL, v23);
          if (v24)
          {
            CFMutableDictionaryRef v25 = v24;
            pid_t v26 = getpid();
            if ((int)v23 > 15)
            {
              void *v25 = 0LL;
              v25[1] = 0LL;
              *(_WORD *)CFMutableDictionaryRef v25 = 258;
              *((_BYTE *)v25 + 2) = 0;
              *((_BYTE *)v25 + 3) = a2;
              *((_DWORD *)v25 + 1) = (unsigned __int16)(v23 >> 3);
              *((_DWORD *)v25 + 2) = a9;
              *((_DWORD *)v25 + 3) = v26;
              if (v23 > 0x1F)
              {
                unint64_t v32 = (unint64_t)v25 + v23;
                v25[2] = 0LL;
                v25[3] = 0LL;
                *((_DWORD *)v25 + 4) = 1245186;
                *((_BYTE *)v25 + 20) = a3;
                *((_DWORD *)v25 + 7) = a8;
                uint64_t v33 = sub_B6B4((_WORD *)v25 + 16, (unint64_t)v25 + v23, 5, a4, v36, 255);
                if (!v33)
                {
                  free(v25);
                  uint64_t v27 = @"%s: pfkey_setsadbaddr(SRC) failed\n";
                  goto LABEL_42;
                }

                int v34 = sub_B6B4(v33, (unint64_t)v25 + v23, 6, a5, v36, 255);
                if (!v34)
                {
                  free(v25);
                  uint64_t v27 = @"%s: pfkey_setsadbaddr(DST) failed\n";
                  goto LABEL_42;
                }

                if ((v35 & 1) == 0)
                {
                  if ((unint64_t)(v34 + 16) > v32)
                  {
                    free(v25);
                    uint64_t v27 = @"%s: response too long\n";
                    goto LABEL_42;
                  }

                  *(_DWORD *)int v34 = 1048578;
                  *((_DWORD *)v34 + 1) = a6;
                  *((_DWORD *)v34 + 2) = a7;
                  *((_DWORD *)v34 + 3) = 0;
                  v34 += 16;
                }

                if (v34 == (char *)v32)
                {
                  ssize_t v28 = pfkey_send(a1, v25, v23);
                  free(v25);
                  if ((v28 & 0x80000000) == 0)
                  {
                    __ipsec_errcode = 0;
                    return v28;
                  }

                  uint64_t v27 = @"%s: pfkey_send() failed\n";
                }

                else
                {
                  free(v25);
                  uint64_t v27 = @"%s: bad response length\n";
                }

                goto LABEL_42;
              }

              free(v25);
              uint64_t v27 = @"%s: pfkey_setsadbxsa2() failed\n";
            }

            else
            {
              free(v25);
              uint64_t v27 = @"%s: pfkey_setsadbmsg() failed\n";
            }
          }

          else
          {
            uint64_t v30 = __error();
            uint64_t v31 = strerror(*v30);
            __ipsec_set_strerror(v31);
            uint64_t v27 = @"%s: allocation failure\n";
          }

LABEL_42:
          SCLog(1LL, 3LL, v27);
          return 0xFFFFFFFFLL;
        }

        if (v11 == 30)
        {
          char v18 = 0x80;
          goto LABEL_13;
        }

        SCLog(1LL, 3LL, @"%s: invalid address family\n");
        int v19 = 15;
      }
    }

    else
    {
      SCLog(1LL, 3LL, @"%s: address family mismatch\n");
      int v19 = 24;
    }
  }

  else
  {
    SCLog(1LL, 3LL, @"%s: null param\n");
    int v19 = 2;
  }

  __ipsec_errcode = v19;
  return 0xFFFFFFFFLL;
}

    size_t v23 = @"SCNC: stop%s, type %@, reason %s";
    goto LABEL_43;
  }

  if (v22 == 2) {
    goto LABEL_44;
  }
  if (v22 != 1)
  {
    size_t v23 = @"SCNC: stop%s, type %@, reason %s, status Unknown";
    goto LABEL_43;
  }

  if (!ipsec_error_to_string(*(_DWORD *)(a1 + 596)))
  {
    if (*(_DWORD *)(a1 + 596))
    {
      size_t v23 = @"SCNC: stop%s, type %@, reason %s, status (%d)";
      goto LABEL_43;
    }

    goto LABEL_42;
  }

  size_t v23 = @"SCNC: stop%s, type %@, reason %s, status %s";
LABEL_43:
  SCLog(1LL, 5LL, v23);
LABEL_44:
  if (*(_WORD *)(a1 + 64) == 1) {
    return ipsec_stop(a1, a3, v16, v17, v18, v19, v20, v21);
  }
  if (*(_WORD *)(a1 + 64)) {
    return 0xFFFFFFFFLL;
  }
  return ppp_stop((_DWORD *)a1, a3);
}

char *sub_B6B4(_WORD *a1, unint64_t a2, __int16 a3, unsigned __int8 *a4, char a5, char a6)
{
  int v6 = (*a4 - 1) | 7;
  uint64_t v7 = (v6 + 9);
  uint64_t v8 = (char *)a1 + v7;
  bzero(a1, (v6 + 9));
  *a1 = v7 >> 3;
  a1[1] = a3;
  *((_BYTE *)a1 + 4) = a6;
  *((_BYTE *)a1 + 5) = a5;
  a1[3] = 0;
  memcpy(a1 + 4, a4, *a4);
  return v8;
}

ssize_t pfkey_send(int a1, const void *a2, int a3)
{
  ssize_t result = send(a1, a2, a3, 0);
  if ((result & 0x80000000) != 0)
  {
    CFDataRef v4 = __error();
    int v5 = strerror(*v4);
    __ipsec_set_strerror(v5);
    return 0xFFFFFFFFLL;
  }

  else
  {
    __ipsec_errcode = 0;
  }

  return result;
}

uint64_t pfkey_send_update( int a1, int a2, char a3, unsigned __int8 *a4, unsigned __int8 *a5, int a6, int a7, char a8, char *a9, int a10, unsigned int a11, int a12, unsigned int a13, int a14, int a15, unsigned int a16, int a17, unsigned int a18, int a19, unsigned int a20, int a21, int a22)
{
  return sub_B7F0(a1, 2, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a18, a20, a22);
}

uint64_t sub_B7F0( int a1, char a2, int a3, char a4, unsigned __int8 *a5, unsigned __int8 *a6, int a7, int a8, char a9, char *a10, int a11, unsigned int a12, int a13, unsigned int a14, int a15, int a16, unsigned int a17, unsigned int a18, unsigned int a19, int a20)
{
  if (!a5 || !a6)
  {
    SCLog(1LL, 3LL, @"%s: null param\n");
    int v30 = 2;
    goto LABEL_39;
  }

  int v22 = a5[1];
  if (v22 != a6[1])
  {
    SCLog(1LL, 3LL, @"%s: address family mismatch\n");
    int v30 = 24;
    goto LABEL_39;
  }

  char v26 = a3;
  if (v22 == 2)
  {
    char v29 = 32;
  }

  else
  {
    if (v22 != 30)
    {
      SCLog(1LL, 3LL, @"%s: invalid address family\n");
      int v30 = 15;
      goto LABEL_39;
    }

    char v29 = 0x80;
  }

  switch(a3)
  {
    case 2:
      if (!a11)
      {
        if (!a13)
        {
          uint64_t v31 = @"%s: no AHa algs\n";
          goto LABEL_38;
        }

        goto LABEL_23;
      }

      unint64_t v32 = @"%s: no AHe algs\n";
LABEL_32:
      SCLog(1LL, 3LL, v32);
      int v30 = 13;
      goto LABEL_39;
    case 9:
      if (a11)
      {
        if (a13)
        {
          uint64_t v31 = @"%s: no IPCOMPa algs\n";
          goto LABEL_38;
        }

LABEL_23:
        char v49 = v29;
        int v33 = ((a12 - 1) | 7) + 139;
        int v34 = ((a14 - 1) | 7) + 9;
        if (!a13) {
          int v34 = 0;
        }
        if (!a11) {
          int v33 = 130;
        }
        size_t v35 = v33 + v34 + ((*a5 - 1) | 7) + ((*a6 - 1) | 7);
        char v36 = calloc(1uLL, v35);
        if (v36)
        {
          __int16 v50 = v36;
          pid_t v37 = getpid();
          if ((int)v35 > 15)
          {
            void *v50 = 0LL;
            v50[1] = 0LL;
            *(_BYTE *)__int16 v50 = 2;
            *((_BYTE *)v50 + 1) = a2;
            *((_BYTE *)v50 + 2) = 0;
            *((_BYTE *)v50 + 3) = v26;
            *((_DWORD *)v50 + 1) = (unsigned __int16)(v35 >> 3);
            *((_DWORD *)v50 + 2) = a20;
            *((_DWORD *)v50 + 3) = v37;
            if (v35 > 0x1F)
            {
              v50[2] = 0LL;
              v50[3] = 0LL;
              *((_DWORD *)v50 + 4) = 65538;
              *((_DWORD *)v50 + 5) = a7;
              *((_BYTE *)v50 + 24) = a9;
              *((_BYTE *)v50 + 25) = 0;
              *((_BYTE *)v50 + 26) = a13;
              *((_BYTE *)v50 + 27) = a11;
              *((_DWORD *)v50 + 7) = a15;
              if (v35 > 0x2F)
              {
                int v43 = v35;
                unint64_t v44 = (unint64_t)v50 + v35;
                v50[4] = 0LL;
                v50[5] = 0LL;
                *((_DWORD *)v50 + 8) = 1245186;
                *((_BYTE *)v50 + 36) = a4;
                *((_DWORD *)v50 + 11) = a8;
                CFNumberRef v45 = sub_B6B4((_WORD *)v50 + 24, (unint64_t)v50 + v35, 5, a5, v49, 255);
                if (!v45)
                {
                  free(v50);
                  uint64_t v38 = @"%s: pfkey_setsadbaddr(SRC) failed\n";
                  goto LABEL_61;
                }

                CFNumberRef v46 = sub_B6B4(v45, v44, 6, a6, v49, 255);
                if (!v46)
                {
                  free(v50);
                  uint64_t v38 = @"%s: pfkey_setsadbaddr(DST) failed\n";
                  goto LABEL_61;
                }

                if (a11)
                {
                  unsigned int v47 = a12;
                  CFNumberRef v46 = sub_D2B4(v46, v44, 9, a10, a12);
                  if (!v46)
                  {
                    free(v50);
                    uint64_t v38 = @"%s: pfkey_setsadbkey(ENC) failed\n";
                    goto LABEL_61;
                  }
                }

                else
                {
                  unsigned int v47 = a12;
                }

                if (a13 && (CFNumberRef v46 = sub_D2B4(v46, v44, 8, &a10[v47], a14)) == 0LL)
                {
                  free(v50);
                  uint64_t v38 = @"%s: pfkey_setsadbkey(AUTH) failed\n";
                }

                else if ((unint64_t)(v46 + 32) <= v44)
                {
                  *(_OWORD *)CFNumberRef v46 = 0u;
                  *((_OWORD *)v46 + 1) = 0u;
                  *(_DWORD *)CFNumberRef v46 = 196612;
                  *((_DWORD *)v46 + 1) = a16;
                  *((void *)v46 + 1) = a17;
                  *((void *)v46 + 2) = a18;
                  *((void *)v46 + 3) = a19;
                  unint64_t v48 = sub_D340((uint64_t)(v46 + 32), v44, 4, a16, a17, a18, a19);
                  if (v48 && v48 == v44)
                  {
                    ssize_t v41 = pfkey_send(a1, v50, v43);
                    free(v50);
                    if ((v41 & 0x80000000) == 0)
                    {
                      __ipsec_errcode = 0;
                      return v41;
                    }

                    uint64_t v38 = @"%s: pfkey_send() failed\n";
                  }

                  else
                  {
                    free(v50);
                    uint64_t v38 = @"%s: pfkey_setsadblifetime(SOFT) failed\n";
                  }
                }

                else
                {
                  free(v50);
                  uint64_t v38 = @"%s: pfkey_setsadblifetime(HARD) failed\n";
                }

                goto LABEL_61;
              }

              free(v50);
              uint64_t v38 = @"%s: pfkey_setsadbxsa2() failed\n";
            }

            else
            {
              free(v50);
              uint64_t v38 = @"%s: pfkey_setsadbsa() failed\n";
            }
          }

          else
          {
            free(v50);
            uint64_t v38 = @"%s: pfkey_setsadbmsg() failed\n";
          }
        }

        else
        {
          uint64_t v39 = __error();
          uint64_t v40 = strerror(*v39);
          __ipsec_set_strerror(v40);
          uint64_t v38 = @"%s: allocation failure\n";
        }

    mach_msg_destroy(&msg);
    return v8;
  }

  mig_put_reply_port(msg.msgh_local_port);
  return v8;
}

    mach_msg_destroy(&msg);
    return v9;
  }

  mig_put_reply_port(msg.msgh_local_port);
  return v9;
}

    mach_msg_destroy(&v10);
    return v7;
  }

  mig_put_reply_port(v10.msgh_local_port);
  return v7;
}

    mach_msg_destroy(&v9);
    return v6;
  }

  mig_put_reply_port(v9.msgh_local_port);
  return v6;
}

    mach_msg_destroy(&v9);
    return v6;
  }

  mig_put_reply_port(v9.msgh_local_port);
  return v6;
}

    mach_msg_destroy(&v10);
    return v7;
  }

  mig_put_reply_port(v10.msgh_local_port);
  return v7;
}

LABEL_61:
        SCLog(1LL, 3LL, v38);
        return 0xFFFFFFFFLL;
      }

      unint64_t v32 = @"%s: no IPCOMPe algs\n";
      goto LABEL_32;
    case 3:
      if (!a11)
      {
        uint64_t v31 = @"%s: no ESP algs\n";
LABEL_38:
        SCLog(1LL, 3LL, v31);
        int v30 = 20;
        goto LABEL_39;
      }

      goto LABEL_23;
  }

  SCLog(1LL, 3LL, @"%s: invalid SA type\n");
  int v30 = 10;
LABEL_39:
  __ipsec_errcode = v30;
  return 0xFFFFFFFFLL;
}

uint64_t pfkey_send_add( int a1, int a2, char a3, unsigned __int8 *a4, unsigned __int8 *a5, int a6, int a7, char a8, char *a9, int a10, unsigned int a11, int a12, unsigned int a13, int a14, int a15, unsigned int a16, int a17, unsigned int a18, int a19, unsigned int a20, int a21, int a22)
{
  return sub_B7F0(a1, 3, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a18, a20, a22);
}

uint64_t pfkey_send_delete(int a1, char a2, uint64_t a3, unsigned __int8 *a4, unsigned __int8 *a5, int a6)
{
  return sub_BE28(a1, 4, a2, a4, a5, a6);
}

uint64_t sub_BE28(int a1, char a2, char a3, unsigned __int8 *a4, unsigned __int8 *a5, int a6)
{
  if (!a4 || !a5)
  {
    SCLog(1LL, 3LL, @"%s: null param\n");
    int v14 = 2;
LABEL_14:
    __ipsec_errcode = v14;
    return 0xFFFFFFFFLL;
  }

  int v8 = a4[1];
  if (v8 != a5[1])
  {
    SCLog(1LL, 3LL, @"%s: address family mismatch\n");
    int v14 = 24;
    goto LABEL_14;
  }

  if (v8 == 2)
  {
    char v13 = 32;
    goto LABEL_10;
  }

  if (v8 != 30)
  {
    SCLog(1LL, 3LL, @"%s: invalid address family\n");
    int v14 = 15;
    goto LABEL_14;
  }

  char v13 = 0x80;
LABEL_10:
  uint64_t v15 = ((*a5 - 1LL) | 7) + ((*a4 - 1LL) | 7);
  uint64_t v16 = v15 + 50;
  BOOL v17 = calloc(1uLL, v15 + 50);
  if (v17)
  {
    char v18 = v17;
    pid_t v19 = getpid();
    if ((int)v15 > -35)
    {
      void *v18 = 0LL;
      v18[1] = 0LL;
      *(_BYTE *)char v18 = 2;
      *((_BYTE *)v18 + 1) = a2;
      *((_BYTE *)v18 + 2) = 0;
      *((_BYTE *)v18 + 3) = a3;
      *((_DWORD *)v18 + 1) = (unsigned __int16)(v16 >> 3);
      *((_DWORD *)v18 + 2) = 0;
      *((_DWORD *)v18 + 3) = v19;
      if ((int)v15 > -19)
      {
        v18[2] = 0LL;
        v18[3] = 0LL;
        *((_DWORD *)v18 + 4) = 65538;
        *((_DWORD *)v18 + 5) = a6;
        v18[3] = 0LL;
        CFMutableDictionaryRef v25 = sub_B6B4((_WORD *)v18 + 16, (unint64_t)v18 + v16, 5, a4, v13, 255);
        if (v25)
        {
          char v26 = sub_B6B4(v25, (unint64_t)v18 + v16, 6, a5, v13, 255);
          if (v26) {
            BOOL v27 = v26 == (char *)v18 + v16;
          }
          else {
            BOOL v27 = 0;
          }
          if (v27)
          {
            ssize_t v21 = pfkey_send(a1, v18, v16);
            free(v18);
            if ((v21 & 0x80000000) == 0)
            {
              __ipsec_errcode = 0;
              return v21;
            }

            BOOL v20 = @"%s: pfkey_send() failed\n";
          }

          else
          {
            free(v18);
            BOOL v20 = @"%s: pfkey_setsadbaddr(DST) failed\n";
          }
        }

        else
        {
          free(v18);
          BOOL v20 = @"%s: pfkey_setsadbaddr(SRC) failed\n";
        }
      }

      else
      {
        free(v18);
        BOOL v20 = @"%s: pfkey_setsadbsa() failed\n";
      }
    }

    else
    {
      free(v18);
      BOOL v20 = @"%s: pfkey_setsadbmsg() failed\n";
    }
  }

  else
  {
    size_t v23 = __error();
    int v24 = strerror(*v23);
    __ipsec_set_strerror(v24);
    BOOL v20 = @"%s: allocation failure\n";
  }

  SCLog(1LL, 3LL, v20);
  return 0xFFFFFFFFLL;
}

uint64_t pfkey_send_delete_all(int a1, char a2, uint64_t a3, unsigned __int8 *a4, unsigned __int8 *a5)
{
  if (!a4 || !a5)
  {
    SCLog(1LL, 3LL, @"%s: null param\n");
    int v11 = 2;
LABEL_14:
    __ipsec_errcode = v11;
    return 0xFFFFFFFFLL;
  }

  int v7 = a4[1];
  if (v7 != a5[1])
  {
    SCLog(1LL, 3LL, @"%s: address family mismatch\n");
    int v11 = 24;
    goto LABEL_14;
  }

  if (v7 == 2)
  {
    char v10 = 32;
    goto LABEL_10;
  }

  if (v7 != 30)
  {
    SCLog(1LL, 3LL, @"%s: invalid address family\n");
    int v11 = 15;
    goto LABEL_14;
  }

  char v10 = 0x80;
LABEL_10:
  uint64_t v12 = ((*a5 - 1LL) | 7) + ((*a4 - 1LL) | 7);
  uint64_t v13 = v12 + 34;
  int v14 = calloc(1uLL, v12 + 34);
  if (v14)
  {
    uint64_t v15 = v14;
    pid_t v16 = getpid();
    if ((int)v12 > -19)
    {
      void *v15 = 0LL;
      v15[1] = 0LL;
      *(_WORD *)uint64_t v15 = 1026;
      *((_BYTE *)v15 + 2) = 0;
      *((_BYTE *)v15 + 3) = a2;
      *((_DWORD *)v15 + 1) = (unsigned __int16)(v13 >> 3);
      *((_DWORD *)v15 + 2) = 0;
      *((_DWORD *)v15 + 3) = v16;
      int v22 = sub_B6B4((_WORD *)v15 + 8, (unint64_t)v15 + v13, 5, a4, v10, 255);
      if (v22)
      {
        size_t v23 = sub_B6B4(v22, (unint64_t)v15 + v13, 6, a5, v10, 255);
        if (v23) {
          BOOL v24 = v23 == (char *)v15 + v13;
        }
        else {
          BOOL v24 = 0;
        }
        if (v24)
        {
          ssize_t v18 = pfkey_send(a1, v15, v13);
          free(v15);
          if ((v18 & 0x80000000) == 0)
          {
            __ipsec_errcode = 0;
            return v18;
          }

          BOOL v17 = @"%s: pfkey_send() failed\n";
        }

        else
        {
          free(v15);
          BOOL v17 = @"%s: pfkey_setsadbaddr(DST) failed\n";
        }
      }

      else
      {
        free(v15);
        BOOL v17 = @"%s: pfkey_setsadbaddr(SRC) failed\n";
      }
    }

    else
    {
      free(v15);
      BOOL v17 = @"%s: pfkey_setsadbmsg() failed\n";
    }
  }

  else
  {
    BOOL v20 = __error();
    ssize_t v21 = strerror(*v20);
    __ipsec_set_strerror(v21);
    BOOL v17 = @"%s: allocation failure\n";
  }

  SCLog(1LL, 3LL, v17);
  return 0xFFFFFFFFLL;
}

uint64_t pfkey_send_get(int a1, char a2, uint64_t a3, unsigned __int8 *a4, unsigned __int8 *a5, int a6)
{
  return sub_BE28(a1, 5, a2, a4, a5, a6);
}

uint64_t pfkey_send_register(int a1, unsigned int a2)
{
  uint64_t v4 = 0LL;
  if (a2)
  {
    while (dword_2EBF4[v4] != a2)
    {
      if (++v4 == 3) {
        goto LABEL_10;
      }
    }

    if (v4 == 0xFFFFFFFFLL)
    {
LABEL_10:
      __ipsec_errcode = 2;
      return 0xFFFFFFFFLL;
    }

    int v7 = (void *)qword_40530[v4];
    if (v7)
    {
      free(v7);
      qword_40530[v4] = 0LL;
    }
  }

  else
  {
    do
    {
      int v5 = *(void **)((char *)qword_40530 + v4);
      if (v5)
      {
        free(v5);
        *(uint64_t *)((char *)qword_40530 + v4) = 0LL;
      }

      v4 += 8LL;
    }

    while (v4 != 24);
  }

  return sub_C494(a1, 7, a2);
}

uint64_t sub_C494(int a1, int a2, unsigned int a3)
{
  char v3 = a3;
  char v4 = a2;
  if (a2 == 11)
  {
    if (a3 >= 2)
    {
      int v6 = @"%s: invalid PROMISC satype %u (type %u)\n";
LABEL_13:
      SCLog(1LL, 3LL, v6);
      __ipsec_errcode = 10;
      return 0xFFFFFFFFLL;
    }
  }

  else if (a3 > 9 || ((1 << a3) & 0x20D) == 0)
  {
    int v6 = @"%s: invalid satype %u\n";
    goto LABEL_13;
  }

  int v7 = (char *)calloc(1uLL, 0x10uLL);
  if (!v7)
  {
    int v11 = __error();
    uint64_t v12 = strerror(*v11);
    __ipsec_set_strerror(v12);
    uint64_t v13 = @"%s: allocation failure\n";
LABEL_11:
    SCLog(1LL, 3LL, v13);
    return 0xFFFFFFFFLL;
  }

  int v8 = v7;
  pid_t v9 = getpid();
  *int v8 = 2;
  v8[1] = v4;
  v8[2] = 0;
  v8[3] = v3;
  *(void *)(v8 + 4) = 2LL;
  *((_DWORD *)v8 + 3) = v9;
  ssize_t v10 = pfkey_send(a1, v8, 16);
  free(v8);
  if ((v10 & 0x80000000) != 0)
  {
    uint64_t v13 = @"%s: pfkey_send() failed\n";
    goto LABEL_11;
  }

  __ipsec_errcode = 0;
  return v10;
}

uint64_t pfkey_recv_register(int a1)
{
  pid_t v2 = getpid();
  char v3 = pfkey_recv(a1);
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  char v4 = v3;
  while (*((_BYTE *)v4 + 1) != 7 || *((_DWORD *)v4 + 3) != v2)
  {
    char v4 = pfkey_recv(a1);
    if (!v4) {
      return 0xFFFFFFFFLL;
    }
  }

  unsigned __int16 v5 = 8 * v4[2];
  v4[2] = v5;
  int v6 = pfkey_set_supported((uint64_t)v4, v5 & 0xFFF8);
  free(v4);
  if (v6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0LL;
  __ipsec_errcode = 0;
  return result;
}

unsigned __int16 *pfkey_recv(int a1)
{
  while (1)
  {
    unint64_t v2 = recv(a1, v13, 0x10uLL, 2);
    if ((v2 & 0x8000000000000000LL) == 0) {
      break;
    }
    if (*__error() != 4)
    {
      char v3 = __error();
      char v4 = strerror(*v3);
      __ipsec_set_strerror(v4);
      return 0LL;
    }
  }

  if (v2 <= 0xF)
  {
    recv(a1, v13, 0x10uLL, 0);
    unsigned __int16 v5 = 0LL;
    __ipsec_errcode = 27;
    return v5;
  }

  size_t v6 = 8LL * v13[2];
  unsigned __int16 v5 = (unsigned __int16 *)calloc(1uLL, v6);
  if (!v5)
  {
    ssize_t v10 = __error();
    int v11 = strerror(*v10);
    __ipsec_set_strerror(v11);
    return v5;
  }

  while (1)
  {
    ssize_t v7 = recv(a1, v5, v6, 0);
    if ((v7 & 0x8000000000000000LL) == 0) {
      break;
    }
    if (*__error() != 4)
    {
      int v8 = __error();
      pid_t v9 = strerror(*v8);
      __ipsec_set_strerror(v9);
      goto LABEL_15;
    }
  }

  if (v7 == v6 && v6 == 8LL * v5[2])
  {
    __ipsec_errcode = 0;
    return v5;
  }

  __ipsec_errcode = 26;
LABEL_15:
  free(v5);
  return 0LL;
}

uint64_t pfkey_set_supported(uint64_t a1, unsigned int a2)
{
  if (*(unsigned __int16 *)(a1 + 4) == a2)
  {
    unint64_t v2 = a1 + a2;
    char v3 = (unsigned __int16 *)(a1 + 16);
    if (a2 >= 0x18)
    {
      do
      {
        uint64_t v6 = *v3;
        int v8 = v3[1];
        if ((v8 & 0xFFFE) != 0xE) {
          goto LABEL_4;
        }
        unsigned __int16 v9 = 8 * v6;
        *char v3 = v9;
        if (v8 == 14)
        {
          uint64_t v10 = 0LL;
        }

        else
        {
          if (v8 != 15) {
            goto LABEL_4;
          }
          uint64_t v10 = 1LL;
        }

        int v11 = (void *)qword_40530[v10];
        if (v11)
        {
          free(v11);
          unsigned __int16 v9 = *v3;
        }

        size_t v12 = v9;
        uint64_t v13 = malloc(v9);
        qword_40530[v10] = (uint64_t)v13;
        if (!v13)
        {
          int v14 = __error();
          uint64_t v15 = strerror(*v14);
          __ipsec_set_strerror(v15);
          return 0xFFFFFFFFLL;
        }

        memcpy(v13, v3, v12);
        char v3 = (unsigned __int16 *)((char *)v3 + v12);
      }

      while ((unint64_t)v3 < v2 && v2 >= (unint64_t)(v3 + 4));
    }

    if (v3 == (unsigned __int16 *)v2)
    {
      uint64_t result = 0LL;
      __ipsec_errcode = 0;
      return result;
    }

LABEL_4:
    int v4 = 10;
  }

  else
  {
    int v4 = 2;
  }

  __ipsec_errcode = v4;
  return 0xFFFFFFFFLL;
}

  Native = CFSocketGetNative(a1);
  uint64_t result = writen(Native, (char *)&__buf, 0x14uLL);
  if (__s)
  {
    if ((_DWORD)result == 20)
    {
      pid_t v16 = CFSocketGetNative(a1);
      return writen(v16, __s, v13);
    }
  }

  return result;
}

uint64_t pfkey_send_flush(int a1, unsigned int a2)
{
  return sub_C494(a1, 9, a2);
}

uint64_t pfkey_send_dump(int a1, unsigned int a2)
{
  return sub_C494(a1, 10, a2);
}

uint64_t pfkey_send_promisc_toggle(int a1, int a2)
{
  return sub_C494(a1, 11, a2 != 0);
}

ssize_t pfkey_send_spdadd( int a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4, unsigned int a5, char a6, void *a7, int a8, int a9)
{
  return sub_C994(a1, 14, a2, a3, a4, a5, a6, 0, 0LL, a7, a8, a9);
}

ssize_t sub_C994( int a1, char a2, unsigned __int8 *a3, unsigned int a4, unsigned __int8 *a5, unsigned int a6, char a7, unsigned int a8, uint64_t a9, void *__src, int a11, int a12)
{
  if (!a3 || !a5)
  {
    SCLog(1LL, 3LL, @"%s: null param\n");
    int v22 = 2;
LABEL_17:
    __ipsec_errcode = v22;
    return 0xFFFFFFFFLL;
  }

  int v14 = a3[1];
  if (v14 != a5[1])
  {
    SCLog(1LL, 3LL, @"%s: address family mismatch\n");
    int v22 = 24;
    goto LABEL_17;
  }

  char v17 = a6;
  char v18 = a4;
  if (v14 == 2)
  {
    unsigned int v21 = 32;
    goto LABEL_10;
  }

  if (v14 != 30)
  {
    SCLog(1LL, 3LL, @"%s: unknown address family\n");
    int v22 = 15;
    goto LABEL_17;
  }

  unsigned int v21 = 128;
LABEL_10:
  if (v21 < a4 || v21 < a6)
  {
    SCLog(1LL, 3LL, @"%s: invalid prefix length\n");
    int v22 = 16;
    goto LABEL_17;
  }

  size_t v23 = a11 + ((2 * *a3 - 2) | 0xE) + 66;
  BOOL v24 = calloc(1uLL, v23);
  if (v24)
  {
    CFMutableDictionaryRef v25 = v24;
    pid_t v26 = getpid();
    if ((int)v23 > 15)
    {
      void *v25 = 0LL;
      v25[1] = 0LL;
      *(_BYTE *)CFMutableDictionaryRef v25 = 2;
      *((_BYTE *)v25 + 1) = a2;
      unint64_t v32 = (char *)v25 + v23;
      *((_WORD *)v25 + 1) = 0;
      *((_DWORD *)v25 + 1) = (unsigned __int16)(v23 >> 3);
      *((_DWORD *)v25 + 2) = a12;
      *((_DWORD *)v25 + 3) = v26;
      int v33 = sub_B6B4((_WORD *)v25 + 8, (unint64_t)v25 + v23, 5, a3, v18, a7);
      if (v33)
      {
        int v34 = sub_B6B4(v33, (unint64_t)v25 + v23, 6, a5, v17, a7);
        if (v34)
        {
          size_t v35 = v34;
          char v36 = v34 + 32;
          if (v36 <= v32
            && (*(_OWORD *)size_t v35 = 0u,
                *((_OWORD *)v35 + 1) = 0u,
                *(void *)size_t v35 = 196612LL,
                *((void *)v35 + 1) = 0LL,
                *((void *)v35 + 2) = a8,
                *((void *)v35 + 3) = a9,
                &v36[a11] == v32))
          {
            memcpy(v36, __src, a11);
            ssize_t v28 = pfkey_send(a1, v25, v23);
            free(v25);
            if ((v28 & 0x80000000) == 0)
            {
              __ipsec_errcode = 0;
              return v28;
            }

            BOOL v27 = @"%s: pfkey_send() failed\n";
          }

          else
          {
            free(v25);
            BOOL v27 = @"%s: pfkey_setsadblifetime() failed\n";
          }
        }

        else
        {
          free(v25);
          BOOL v27 = @"%s: pfkey_setsadbaddr(DST) failed\n";
        }
      }

      else
      {
        free(v25);
        BOOL v27 = @"%s: pfkey_setsadbaddr(SRC) failed\n";
      }
    }

    else
    {
      free(v25);
      BOOL v27 = @"%s: pfkey_setsadbmsg() failed\n";
    }
  }

  else
  {
    int v30 = __error();
    uint64_t v31 = strerror(*v30);
    __ipsec_set_strerror(v31);
    BOOL v27 = @"%s: allocation failure\n";
  }

  SCLog(1LL, 3LL, v27);
  return 0xFFFFFFFFLL;
}

ssize_t pfkey_send_spdadd2( int a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4, unsigned int a5, char a6, unsigned int a7, uint64_t a8, void *a9, int a10, int a11)
{
  return sub_C994(a1, 14, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

ssize_t pfkey_send_spdupdate( int a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4, unsigned int a5, char a6, void *a7, int a8, int a9)
{
  return sub_C994(a1, 13, a2, a3, a4, a5, a6, 0, 0LL, a7, a8, a9);
}

ssize_t pfkey_send_spdupdate2( int a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4, unsigned int a5, char a6, unsigned int a7, uint64_t a8, void *a9, int a10, int a11)
{
  return sub_C994(a1, 13, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

ssize_t pfkey_send_spddelete( int a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4, unsigned int a5, char a6, void *a7, int a8, int a9)
{
  if (a8 == 16) {
    return sub_C994(a1, 15, a2, a3, a4, a5, a6, 0, 0LL, a7, 16, a9);
  }
  __ipsec_errcode = 2;
  return 0xFFFFFFFFLL;
}

uint64_t pfkey_send_spddelete2(int a1, int a2)
{
  return sub_CE58(a1, 22, a2);
}

uint64_t sub_CE58(int a1, char a2, int a3)
{
  uint64_t v6 = (char *)calloc(1uLL, 0x20uLL);
  if (!v6)
  {
    uint64_t v10 = __error();
    int v11 = strerror(*v10);
    __ipsec_set_strerror(v11);
    size_t v12 = @"%s: allocation failure\n";
LABEL_6:
    SCLog(1LL, 3LL, v12);
    return 0xFFFFFFFFLL;
  }

  ssize_t v7 = v6;
  pid_t v8 = getpid();
  *ssize_t v7 = 2;
  v7[1] = a2;
  *((_WORD *)v7 + 1) = 0;
  *(void *)(v7 + 4) = 4LL;
  *((_DWORD *)v7 + 3) = v8;
  *((void *)v7 + 2) = 1179776LL;
  *((_DWORD *)v7 + 6) = a3;
  *((_DWORD *)v7 + 7) = 0;
  ssize_t v9 = pfkey_send(a1, v7, 32);
  free(v7);
  if ((v9 & 0x80000000) != 0)
  {
    size_t v12 = @"%s: pfkey_send() failed\n";
    goto LABEL_6;
  }

  __ipsec_errcode = 0;
  return v9;
}

uint64_t pfkey_send_spdget(int a1, int a2)
{
  return sub_CE58(a1, 16, a2);
}

ssize_t pfkey_send_spdsetidx( int a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4, unsigned int a5, char a6, void *a7, int a8, int a9)
{
  if (a8 == 16) {
    return sub_C994(a1, 20, a2, a3, a4, a5, a6, 0, 0LL, a7, 16, a9);
  }
  __ipsec_errcode = 2;
  return 0xFFFFFFFFLL;
}

uint64_t pfkey_send_spdflush(int a1)
{
  return sub_C494(a1, 19, 0);
}

uint64_t pfkey_send_spddump(int a1)
{
  return sub_C494(a1, 18, 0);
}

uint64_t pfkey_open()
{
  int v5 = 0x20000;
  uint64_t v0 = socket(29, 3, 2);
  if ((v0 & 0x80000000) != 0)
  {
    unint64_t v2 = __error();
    char v3 = strerror(*v2);
    __ipsec_set_strerror(v3);
    return 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v1 = v0;
    setsockopt(v0, 0xFFFF, 4097, &v5, 4u);
    setsockopt(v1, 0xFFFF, 4098, &v5, 4u);
    __ipsec_errcode = 0;
  }

  return v1;
}

uint64_t pfkey_close(int a1)
{
  uint64_t result = close(a1);
  __ipsec_errcode = 0;
  return result;
}

uint64_t pfkey_align(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  int v4 = 2;
  if (a1 && a2)
  {
    *(void *)(a2 + 232) = 0LL;
    *(_OWORD *)(a2 + 216) = 0u;
    *(_OWORD *)(a2 + 200) = 0u;
    *(_OWORD *)(a2 + 184) = 0u;
    *(_OWORD *)(a2 + 168) = 0u;
    *(_OWORD *)(a2 + 152) = 0u;
    *(_OWORD *)(a2 + 136) = 0u;
    *(_OWORD *)(a2 + 120) = 0u;
    *(_OWORD *)(a2 + 104) = 0u;
    *(_OWORD *)(a2 + 88) = 0u;
    *(_OWORD *)(a2 + 72) = 0u;
    *(_OWORD *)(a2 + 56) = 0u;
    *(_OWORD *)(a2 + 40) = 0u;
    *(_OWORD *)(a2 + 24) = 0u;
    *(_OWORD *)(a2 + 8) = 0u;
    unint64_t v5 = *(unsigned __int16 *)(a1 + 4);
    unint64_t v6 = a1 + 8 * v5;
    *(void *)a2 = a1;
    ssize_t v7 = (unsigned __int16 *)(a1 + 16);
    if (v5 >= 3)
    {
      while (1)
      {
        pid_t v8 = &v7[4 * *v7];
        uint64_t v11 = v7[1];
        if (*(void *)(a2 + 8 * v11) || (v11 - 1) >= 0x10 && (v11 - 18) > 1)
        {
          uint64_t result = 0xFFFFFFFFLL;
          int v4 = 12;
          goto LABEL_11;
        }

        *(void *)(a2 + 8 * v11) = v7;
        BOOL v12 = (unint64_t)v8 < v6 && v6 >= (unint64_t)(v8 + 2);
        ssize_t v7 = v8;
        if (!v12) {
          goto LABEL_5;
        }
      }
    }

    pid_t v8 = v7;
LABEL_5:
    BOOL v9 = v8 == (unsigned __int16 *)v6;
    else {
      int v4 = 3;
    }
    if (v9) {
      uint64_t result = 0LL;
    }
    else {
      uint64_t result = 0xFFFFFFFFLL;
    }
  }

LABEL_11:
  __ipsec_errcode = v4;
  return result;
}

  my_CFRelease((const void **)&v56);
  my_CFRelease((const void **)&v53);
  my_CFRelease((const void **)&v58);
  my_CFRelease((const void **)&v57);
  my_CFRelease((const void **)&v55);
  my_CFRelease((const void **)&v54);
  CFRunLoopRun();
  return 0LL;
}

      if (++v7 == v11)
      {
        if (v8) {
          sub_16D64();
        }
        if (v9) {
          sub_14EA0();
        }
        goto LABEL_76;
      }
    }
  }

  *(_DWORD *)(a2 + 4) = v12;
  *(_DWORD *)(a2 + 16) = v11;
  return result;
}

    uint64_t v10 = 0;
    BOOL v9 = 12;
    goto LABEL_14;
  }

  uint64_t result = my_Allocate(4);
  *a3 = result;
  if (!result) {
    goto LABEL_11;
  }
  uint64_t result = makeref((uint64_t)v7);
  pid_t v8 = (_DWORD *)*a3;
  *(_DWORD *)*a3 = result;
  BOOL v9 = 0;
  if ((*(_BYTE *)(v5 + 116) & 0x20) != 0) {
    *pid_t v8 = bswap32(result);
  }
  uint64_t v10 = 4;
LABEL_14:
  *((_DWORD *)a2 + 1) = v9;
  *((_DWORD *)a2 + 4) = v10;
  return result;
}

uint64_t pfkey_check(uint64_t a1)
{
  if (a1 && (unint64_t v2 = *(_BYTE **)a1) != 0LL)
  {
    if (*v2 == 2)
    {
      unsigned int v3 = v2[1];
      if (v3 <= 0x1A)
      {
        int v6 = v2[3];
        uint64_t result = 0xFFFFFFFFLL;
        int v5 = 1;
        switch(v6)
        {
          case 0:
            char v7 = v3 - 1;
            unsigned int v8 = 191;
            goto LABEL_14;
          case 1:
            if (v3 == 11) {
              goto LABEL_17;
            }
            goto LABEL_24;
          case 2:
          case 3:
          case 9:
            char v7 = v3 - 14;
            if (v3 - 14 < 6)
            {
              unsigned int v8 = 55;
LABEL_14:
              if (((v8 >> v7) & 1) != 0) {
                goto LABEL_25;
              }
            }

LABEL_17:
            uint64_t v9 = *(void *)(a1 + 40);
            if (!v9) {
              goto LABEL_23;
            }
            uint64_t v10 = *(void *)(a1 + 48);
            if (!v10) {
              goto LABEL_23;
            }
            if (*(unsigned __int8 *)(v9 + 4) == *(unsigned __int8 *)(v10 + 4))
            {
              int v11 = *(unsigned __int8 *)(v9 + 9);
              if (v11 == *(unsigned __int8 *)(v10 + 9))
              {
                if (v11 == 30 || v11 == 2)
                {
LABEL_23:
                  int v5 = 0;
                  uint64_t result = 0LL;
                }

                else
                {
                  int v5 = 15;
                }
              }

              else
              {
                int v5 = 24;
              }
            }

            else
            {
              int v5 = 23;
            }

            break;
          case 5:
          case 6:
          case 7:
          case 8:
            break;
          default:
LABEL_24:
            uint64_t result = 0xFFFFFFFFLL;
LABEL_25:
            int v5 = 10;
            break;
        }
      }

      else
      {
        uint64_t result = 0xFFFFFFFFLL;
        int v5 = 11;
      }
    }

    else
    {
      uint64_t result = 0xFFFFFFFFLL;
      int v5 = 4;
    }
  }

  else
  {
    uint64_t result = 0xFFFFFFFFLL;
    int v5 = 2;
  }

  __ipsec_errcode = v5;
  return result;
}

  my_CFRelease(&v17);
  my_CFRelease((const void **)&v18);
  my_CFRelease((const void **)&v16);
}

char *sub_D2B4(_WORD *a1, unint64_t a2, __int16 a3, const void *a4, unsigned int a5)
{
  int v5 = (a5 - 1) | 7;
  uint64_t v6 = (v5 + 9);
  char v7 = (char *)a1 + v6;
  bzero(a1, (v5 + 9));
  *a1 = v6 >> 3;
  a1[1] = a3;
  a1[2] = 8 * a5;
  a1[3] = 0;
  memcpy(a1 + 4, a4, a5);
  return v7;
}

unint64_t sub_D340( uint64_t a1, unint64_t a2, int a3, int a4, unsigned int a5, unsigned int a6, unsigned int a7)
{
  unint64_t result = a1 + 32;
  if (result > a2) {
    return 0LL;
  }
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_WORD *)a1 = 4;
  *(_WORD *)(a1 + 2) = a3;
  if (a3 == 3)
  {
    *(_DWORD *)(a1 + 4) = a4;
    *(void *)(a1 + 8) = a5;
    *(void *)(a1 + 16) = a6;
    goto LABEL_8;
  }

  if (a3 == 4)
  {
    *(_DWORD *)(a1 + 4) = dword_40020 * a4 / 0x64u;
    unint64_t v9 = dword_40028 * a6 / 0x64uLL;
    *(void *)(a1 + 8) = dword_40024 * a5 / 0x64uLL;
    *(void *)(a1 + 16) = v9;
    a7 = dword_4002C * a7 / 0x64;
LABEL_8:
    *(void *)(a1 + 24) = a7;
  }

  return result;
}

uint64_t get_addr_option( uint64_t a1, const __CFString *key, const void *a3, CFDictionaryRef theDict, uint64_t a5, unsigned int *a6, unsigned int a7)
{
  if (*(_DWORD *)(a1 + 628)
    && getAddressFromEntity( (const __SCDynamicStore *)gDynamicStore,  kSCDynamicStoreDomainState,  *(const __CFString **)(a1 + 24),  key,  a3,  a6))
  {
    return 1LL;
  }

  if (theDict
    && (CFPropertyListRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, key)) != 0LL
    && (uint64_t v15 = Value, v16 = CFGetTypeID(Value), v16 == CFDictionaryGetTypeID())
    && (char v17 = (const __CFArray *)CFDictionaryGetValue(v15, a3)) != 0LL
    && (char v18 = v17, v19 = CFGetTypeID(v17), v19 == CFArrayGetTypeID())
    && CFArrayGetCount(v18))
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v18, 0LL);
    a7 = CFStringAddrToLong(ValueAtIndex);
    uint64_t result = 2LL;
  }

  else
  {
    if (getAddressFromEntity( (const __SCDynamicStore *)gDynamicStore,  kSCDynamicStoreDomainSetup,  *(const __CFString **)(a1 + 24),  key,  a3,  a6)) {
      return 3LL;
    }
    uint64_t result = 0LL;
  }

  *a6 = a7;
  return result;
}

uint64_t get_int_option( uint64_t a1, const __CFString *key, const void *a3, CFDictionaryRef theDict, CFDictionaryRef a5, _DWORD *a6, int a7)
{
  if (*(_DWORD *)(a1 + 628)
    && getNumberFromEntity( (const __SCDynamicStore *)gDynamicStore,  kSCDynamicStoreDomainState,  *(const __CFString **)(a1 + 24),  key,  a3,  a6))
  {
    return 1LL;
  }

  if (theDict)
  {
    CFPropertyListRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, key);
    if (Value)
    {
      CFTypeID v16 = Value;
      CFTypeID v17 = CFGetTypeID(Value);
      if (v17 == CFDictionaryGetTypeID())
      {
      }
    }
  }

  if (a5)
  {
    char v18 = (const __CFDictionary *)CFDictionaryGetValue(a5, key);
    if (!v18) {
      goto LABEL_13;
    }
    CFTypeID v19 = v18;
    CFTypeID v20 = CFGetTypeID(v18);
  }

  else if (!getNumberFromEntity( (const __SCDynamicStore *)gDynamicStore,  kSCDynamicStoreDomainSetup,  *(const __CFString **)(a1 + 24),  key,  a3,  a6))
  {
LABEL_13:
    uint64_t result = 0LL;
    *a6 = a7;
    return result;
  }

  return 3LL;
}

uint64_t get_str_option( uint64_t a1, const __CFString *key, const void *a3, CFDictionaryRef theDict, CFDictionaryRef a5, char *a6, unsigned int a7, _DWORD *a8, char *__source)
{
  if (!*(_DWORD *)(a1 + 628)
    || !getStringFromEntity( (const __SCDynamicStore *)gDynamicStore,  kSCDynamicStoreDomainState,  *(const __CFString **)(a1 + 24),  key,  a3,  a6,  (unsigned __int16)a7))
  {
    if (theDict)
    {
      CFPropertyListRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, key);
      if (Value)
      {
        CFTypeID v19 = Value;
        CFTypeID v20 = CFGetTypeID(Value);
        if (v20 == CFDictionaryGetTypeID())
        {
          if (getString(v19, a3, a6, (unsigned __int16)a7))
          {
            uint64_t v17 = 2LL;
            goto LABEL_16;
          }
        }
      }
    }

    if (a5)
    {
      unsigned int v21 = (const __CFDictionary *)CFDictionaryGetValue(a5, key);
      if (!v21) {
        goto LABEL_13;
      }
      int v22 = v21;
      CFTypeID v23 = CFGetTypeID(v21);
    }

    else if (!getStringFromEntity( (const __SCDynamicStore *)gDynamicStore,  kSCDynamicStoreDomainSetup,  *(const __CFString **)(a1 + 24),  key,  a3,  a6,  (unsigned __int16)a7))
    {
LABEL_13:
      strlcpy(a6, __source, a7);
      uint64_t v17 = 0LL;
      goto LABEL_16;
    }

    uint64_t v17 = 3LL;
    goto LABEL_16;
  }

  uint64_t v17 = 1LL;
LABEL_16:
  *a8 = strlen(a6);
  return v17;
}

const void *get_cf_option( void *key, const void *a2, uint64_t a3, CFDictionaryRef theDict, CFDictionaryRef a5, uint64_t a6)
{
  if (!theDict
    || (int v11 = (const __CFDictionary *)CFDictionaryGetValue(theDict, key)) == 0LL
    || (BOOL v12 = v11, v13 = CFGetTypeID(v11), v13 != CFDictionaryGetTypeID())
    || (int v14 = CFDictionaryGetValue(v12, a2)) == 0LL
    || (uint64_t v15 = v14, CFGetTypeID(v14) != a3))
  {
    if (!a5) {
      return (const void *)a6;
    }
    CFPropertyListRef Value = (const __CFDictionary *)CFDictionaryGetValue(a5, key);
    if (!Value) {
      return (const void *)a6;
    }
    uint64_t v17 = Value;
    CFTypeID v18 = CFGetTypeID(Value);
    if (v18 != CFDictionaryGetTypeID()) {
      return (const void *)a6;
    }
    CFTypeID v19 = CFDictionaryGetValue(v17, a2);
    if (!v19) {
      return (const void *)a6;
    }
    uint64_t v15 = v19;
    if (CFGetTypeID(v19) != a3) {
      return (const void *)a6;
    }
  }

  return v15;
}

uint64_t ppp_getoptval( uint64_t a1, CFDictionaryRef theDict, CFDictionaryRef a3, int a4, char *a5, unsigned int a6, unsigned int *a7)
{
  uint64_t v11 = a1;
  *a7 = 4;
  *(_DWORD *)a5 = 0;
  switch(a4)
  {
    case 1:
      if (a3)
      {
        if (!*(_WORD *)(a1 + 66))
        {
          CFPropertyListRef Value = CFDictionaryGetValue(a3, kSCEntNetInterface);
          if (Value)
          {
            int v14 = Value;
            CFTypeID v15 = CFGetTypeID(Value);
            if (v15 == CFDictionaryGetTypeID())
            {
              uint64_t v16 = _SCNetworkInterfaceCreateWithEntity(0LL, v14, 0LL);
              if (v16)
              {
                uint64_t v17 = (const void *)v16;
                CFTypeID v18 = (const __CFString *)_SCNetworkInterfaceCopySlashDevPath();
                CFRelease(v17);
                if (v18)
                {
                  CFStringGetCString(v18, a5, 256LL, 0x8000100u);
                  CFRelease(v18);
                  goto LABEL_66;
                }
              }
            }
          }
        }
      }

      ssize_t v41 = "";
      if (*(_WORD *)(v11 + 66) == 2) {
        ssize_t v41 = "en0";
      }
      if (*(_WORD *)(v11 + 66)) {
        unsigned int v42 = (char *)v41;
      }
      else {
        unsigned int v42 = "modem";
      }
      get_str_option(v11, kSCEntNetInterface, kSCPropNetInterfaceDeviceName, theDict, a3, a5, a6, a7, v42);
      goto LABEL_87;
    case 2:
      if (*(_WORD *)(a1 + 66)) {
        goto LABEL_87;
      }
      CFTypeID v19 = kSCEntNetModem;
      CFTypeID v20 = &kSCPropNetModemSpeed;
      goto LABEL_84;
    case 3:
      unsigned int v21 = kSCEntNetModem;
      CFStringRef v22 = kSCPropNetModemConnectionScript;
      if (*(_WORD *)(a1 + 66)) {
        __source = "";
      }
      else {
        __source = "Apple Internal 56K Modem (v.34)";
      }
      goto LABEL_62;
    case 4:
      CFStringRef v24 = kSCEntNetPPP;
      get_int_option(a1, kSCEntNetPPP, kSCPropNetPPPDisconnectOnIdle, theDict, a3, &v43, 0);
      if (!v43) {
        goto LABEL_87;
      }
      CFMutableDictionaryRef v25 = &kSCPropNetPPPDisconnectOnIdleTimer;
      goto LABEL_56;
    case 5:
      unsigned int v21 = kSCEntNetPPP;
      pid_t v26 = &kSCPropNetPPPCommRemoteAddress;
      goto LABEL_61;
    case 6:
      goto LABEL_72;
    case 7:
      unsigned int v21 = kSCEntNetPPP;
      pid_t v26 = &kSCPropNetPPPAuthName;
      goto LABEL_61;
    case 8:
      get_str_option(a1, kSCEntNetPPP, kSCPropNetPPPAuthPassword, theDict, a3, a5, a6, a7, "");
      uint64_t result = 1LL;
      if (*a7)
      {
        *a5 = 42;
        *a7 = 1;
      }

      return result;
    case 9:
      get_int_option( a1,  kSCEntNetPPP,  kSCPropNetPPPLCPCompressionPField,  theDict,  a3,  &v43,  *(unsigned __int16 *)(a1 + 66) != 2);
      if (*(_WORD *)(v11 + 66) == 2)
      {
        int v28 = 0;
      }

      else
      {
        get_int_option(v11, kSCEntNetPPP, kSCPropNetPPPLCPCompressionACField, theDict, a3, __s1, 1);
        int v28 = 2 * *(_DWORD *)__s1;
      }

      int v39 = v28 + v43;
      goto LABEL_82;
    case 10:
      if (*(_WORD *)(a1 + 66) == 2) {
        int v29 = 1492;
      }
      else {
        int v29 = 1500;
      }
      CFTypeID v19 = kSCEntNetPPP;
      int v30 = &kSCPropNetPPPLCPMRU;
      goto LABEL_35;
    case 11:
      int v31 = *(unsigned __int16 *)(a1 + 66);
      if (v31 == 5) {
        int v32 = 1280;
      }
      else {
        int v32 = 1500;
      }
      if (v31 == 2) {
        int v29 = 1492;
      }
      else {
        int v29 = v32;
      }
      CFTypeID v19 = kSCEntNetPPP;
      int v30 = &kSCPropNetPPPLCPMTU;
LABEL_35:
      CFStringRef v33 = *v30;
      goto LABEL_41;
    case 12:
      if (*(_WORD *)(a1 + 66) == 2) {
        goto LABEL_39;
      }
      CFTypeID v19 = kSCEntNetPPP;
      CFTypeID v20 = &kSCPropNetPPPLCPReceiveACCM;
      goto LABEL_84;
    case 13:
      if (*(_WORD *)(a1 + 66) == 2) {
        goto LABEL_39;
      }
      CFTypeID v19 = kSCEntNetPPP;
      CFTypeID v20 = &kSCPropNetPPPLCPTransmitACCM;
      goto LABEL_84;
    case 14:
      CFTypeID v19 = kSCEntNetPPP;
      CFStringRef v33 = kSCPropNetPPPIPCPCompressionVJ;
      int v29 = *(unsigned __int16 *)(a1 + 66) != 2;
LABEL_41:
      int v34 = theDict;
      size_t v35 = a3;
      char v36 = a5;
      goto LABEL_86;
    case 15:
      pid_t v37 = kSCEntNetIPv4;
      uint64_t v38 = (const void **)&kSCPropNetIPv4Addresses;
      goto LABEL_44;
    case 16:
      pid_t v37 = kSCEntNetIPv4;
      uint64_t v38 = (const void **)&kSCPropNetIPv4DestAddresses;
LABEL_44:
      get_addr_option(a1, v37, *v38, theDict, (uint64_t)a5, (unsigned int *)a5, 0);
      goto LABEL_87;
    case 17:
      get_str_option(a1, kSCEntNetPPP, kSCPropNetPPPLogfile, 0LL, a3, a5, a6, a7, "");
      uint64_t result = 1LL;
      if (!*a5 || *a5 == 47) {
        return result;
      }
      strncpy(a5 + 13, a5, *a7);
      qmemcpy(a5, "/var/log/ppp/", 13);
      *a7 += 13;
      goto LABEL_87;
    case 18:
    case 26:
    case 27:
      goto LABEL_39;
    case 19:
      CFStringRef v24 = kSCEntNetPPP;
      get_int_option(a1, kSCEntNetPPP, kSCPropNetPPPIdleReminder, theDict, a3, &v43, 0);
      if (!v43) {
        goto LABEL_87;
      }
      CFMutableDictionaryRef v25 = &kSCPropNetPPPIdleReminderTimer;
      goto LABEL_56;
    case 20:
      CFTypeID v19 = kSCEntNetPPP;
      CFStringRef v33 = @"AlertEnable";
      int v34 = theDict;
      size_t v35 = a3;
      char v36 = a5;
      int v29 = -1;
      goto LABEL_86;
    case 21:
      get_int_option(a1, kSCEntNetPPP, kSCPropNetPPPLCPEchoEnabled, theDict, a3, &v43, 0);
      if (!v43) {
        goto LABEL_87;
      }
      get_int_option(v11, kSCEntNetPPP, kSCPropNetPPPLCPEchoInterval, theDict, a3, __s1, 10);
      get_int_option(v11, kSCEntNetPPP, kSCPropNetPPPLCPEchoFailure, theDict, a3, buffer, 4);
      int v39 = *(_DWORD *)buffer + (*(_DWORD *)__s1 << 16);
      goto LABEL_82;
    case 22:
      CFTypeID v19 = kSCEntNetPPP;
      CFTypeID v20 = &kSCPropNetPPPCommConnectDelay;
      goto LABEL_84;
    case 23:
      CFStringRef v24 = kSCEntNetPPP;
      get_int_option(a1, kSCEntNetPPP, kSCPropNetPPPUseSessionTimer, theDict, a3, &v43, 0);
      if (!v43) {
        goto LABEL_87;
      }
      CFMutableDictionaryRef v25 = &kSCPropNetPPPSessionTimer;
LABEL_56:
      CFStringRef v33 = *v25;
      a1 = v11;
      CFTypeID v19 = v24;
      goto LABEL_85;
    case 24:
      get_int_option(a1, kSCEntNetPPP, kSCPropNetPPPCommDisplayTerminalWindow, theDict, a3, &v43, 0);
      if (v43) {
        goto LABEL_71;
      }
      get_int_option(v11, kSCEntNetPPP, kSCPropNetPPPCommUseTerminalScript, theDict, a3, &v43, 0);
      uint64_t result = 1LL;
      if (!v43) {
        return result;
      }
      goto LABEL_73;
    case 25:
      unsigned int v21 = kSCEntNetPPP;
      pid_t v26 = &kSCPropNetPPPCommTerminalScript;
LABEL_61:
      CFStringRef v22 = *v26;
      __source = "";
LABEL_62:
      get_str_option(a1, v21, v22, theDict, a3, a5, a6, a7, __source);
      goto LABEL_87;
    case 28:
      if (*(_WORD *)(a1 + 66)) {
        goto LABEL_87;
      }
      CFTypeID v19 = kSCEntNetModem;
      CFTypeID v20 = &kSCPropNetModemConnectSpeed;
      goto LABEL_84;
    case 29:
      *a5 = 0;
      CFStringGetCString(*(CFStringRef *)(a1 + 24), a5, 256LL, 0x8000100u);
LABEL_66:
      uint64_t v40 = a5;
      goto LABEL_68;
    case 30:
      uint64_t v40 = strncpy(a5, (const char *)(a1 + 104), 0x10uLL);
LABEL_68:
      *a7 = strlen(v40);
      goto LABEL_87;
    case 31:
      *a7 = 4;
      *(_DWORD *)a5 = 0;
      __s1[0] = 0;
      int v43 = 256;
      get_str_option(a1, kSCEntNetModem, kSCPropNetModemDialMode, theDict, a3, __s1, 0x100u, &v43, "");
      buffer[0] = 0;
      CFStringGetCString(kSCValNetModemDialModeIgnoreDialTone, buffer, 256LL, 0x8000100u);
      if (strcmp(__s1, buffer))
      {
        buffer[0] = 0;
        CFStringGetCString(kSCValNetModemDialModeManual, buffer, 256LL, 0x8000100u);
        if (!strcmp(__s1, buffer))
        {
LABEL_71:
          int v39 = 2;
LABEL_82:
          *(_DWORD *)a5 = v39;
        }

        goto LABEL_87;
      }

LABEL_72:
      uint64_t result = 1LL;
LABEL_73:
      *(_DWORD *)a5 = 1;
      break;
    case 32:
      goto LABEL_10;
    default:
      if (a4 == 0x80000000)
      {
LABEL_10:
        CFTypeID v19 = kSCEntNetPPP;
        CFTypeID v20 = &kSCPropNetPPPDialOnDemand;
LABEL_84:
        CFStringRef v33 = *v20;
LABEL_85:
        int v34 = theDict;
        size_t v35 = a3;
        char v36 = a5;
        int v29 = 0;
LABEL_86:
        get_int_option(a1, v19, v33, v34, v35, v36, v29);
LABEL_87:
        uint64_t result = 1LL;
      }

      else
      {
LABEL_39:
        uint64_t result = 0LL;
        *a7 = 0;
      }

      break;
  }

  return result;
}

uint64_t ppp_subtype(unint64_t a1)
{
  if (my_CFEqual(a1, (unint64_t)kSCValNetInterfaceSubTypePPPSerial))
  {
    return 0;
  }

  else if (my_CFEqual(a1, (unint64_t)kSCValNetInterfaceSubTypePPPoE))
  {
    return 2;
  }

  else if (my_CFEqual(a1, (unint64_t)kSCValNetInterfaceSubTypeL2TP))
  {
    return 5;
  }

  else
  {
    return (unsigned __int16)-16;
  }

uint64_t ppp_new_service(uint64_t a1)
{
  *(void *)(a1 + 624) = 0xFFFFFFFFLL;
  *(void *)(a1 + 592) = -1LL;
  *(void *)(a1 + 600) = -1LL;
  *(_DWORD *)(a1 + 608) = -1;
  if (*(void *)(a1 + 40))
  {
    __strlcpy_chk(__s, "/System/Library/SystemConfiguration/PPPController.bundle/PlugIns/", 1024LL, 1024LL);
    buffer[0] = 0;
    CFStringGetCString(*(CFStringRef *)(a1 + 40), buffer, 32LL, 0x8000100u);
    __strlcat_chk(__s, buffer, 1024LL, 1024LL);
    __strlcat_chk(__s, ".ppp", 1024LL, 1024LL);
    size_t v2 = strlen(__s);
    CFURLRef v3 = CFURLCreateFromFileSystemRepresentation(0LL, (const UInt8 *)__s, v2, 1u);
    if (v3)
    {
      int v4 = v3;
      my_CFRelease((const void **)(a1 + 616));
      *(void *)(a1 + 616) = CFBundleCreate(0LL, v4);
      CFRelease(v4);
    }
  }

  return 0LL;
}

uint64_t ppp_dispose_service(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 628)) {
    return 1LL;
  }
  sub_E3A4(a1);
  my_CFRelease((const void **)(a1 + 472));
  my_CFRelease((const void **)(a1 + 480));
  my_CFRelease((const void **)(a1 + 136));
  return 0LL;
}

void sub_E3A4(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 624);
  if (v2 != -1)
  {
    close(v2);
    *(_DWORD *)(a1 + 624) = -1;
  }

  CFURLRef v3 = *(const void **)(a1 + 80);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 80) = 0LL;
  }

uint64_t ppp_setup_service(uint64_t a1)
{
  pid_t v26 = 0LL;
  *(_DWORD *)(a1 + 72) &= 0xF780FEFF;
  int v2 = (const __CFDictionary **)(a1 + 136);
  my_CFRelease((const void **)(a1 + 136));
  uint64_t v3 = *(void *)(a1 + 584);
  if (v3)
  {
    int v4 = (__CFString *)ne_sm_bridge_copy_configuration(v3);
    int v5 = v4;
    pid_t v26 = v4;
    if (v4 && (CFPropertyListRef Value = CFDictionaryGetValue((CFDictionaryRef)v4, kSCEntNetPPP)) != 0LL)
    {
      char v7 = (const __CFDictionary *)CFRetain(Value);
      *int v2 = v7;
      if (!v7) {
        goto LABEL_26;
      }
    }

    else
    {
      char v7 = *v2;
      if (!*v2) {
        goto LABEL_26;
      }
    }
  }

  else
  {
    char v7 = (const __CFDictionary *)copyEntity( (const __SCDynamicStore *)gDynamicStore,  kSCDynamicStoreDomainSetup,  *(const __CFString **)(a1 + 24),  kSCEntNetPPP);
    int v5 = 0LL;
    *(void *)(a1 + 136) = v7;
    if (!v7) {
      goto LABEL_26;
    }
  }

  int v27 = 0;
  getNumber(v7, kSCPropNetPPPDialOnDemand, &v27);
  if (v27) {
    *(_DWORD *)(a1 + 72) |= 0x10000u;
  }
  int v27 = 0;
  getNumber(*v2, kSCPropNetPPPDisconnectOnLogout, &v27);
  if (v27) {
    *(_DWORD *)(a1 + 72) |= 0x20000u;
  }
  int v27 = *(unsigned __int16 *)(a1 + 66) != 5;
  getNumber(*(const __CFDictionary **)(a1 + 136), kSCPropNetPPPDisconnectOnSleep, &v27);
  if (v27) {
    *(_DWORD *)(a1 + 72) |= 0x40000u;
  }
  int v27 = 0;
  getNumber(*v2, kSCPropNetPPPOnDemandEnabled, &v27);
  if (v27)
  {
    int v8 = 18874368;
  }

  else
  {
    if (!CFDictionaryGetValue(*v2, kSCPropNetVPNOnDemandRules)
      || !controller_options_is_useVODDisconnectRulesWhenVODDisabled())
    {
      goto LABEL_18;
    }

    int v8 = 0x1000000;
  }

  *(_DWORD *)(a1 + 72) |= v8;
LABEL_18:
  int v27 = *(unsigned __int16 *)(a1 + 66) != 5;
  getNumber(*(const __CFDictionary **)(a1 + 136), @"PreventIdleSleep", &v27);
  int v9 = *(_DWORD *)(a1 + 72);
  if (v27)
  {
    v9 |= 0x80000u;
    *(_DWORD *)(a1 + 72) = v9;
  }

  int v27 = v9 & 0x20000;
  getNumber(*v2, @"DisconnectOnFastUserSwitch", &v27);
  if (v27) {
    *(_DWORD *)(a1 + 72) |= 0x100000u;
  }
  int v27 = 1;
  *(_DWORD *)(a1 + 196) = 0;
  getNumber(*(const __CFDictionary **)(a1 + 136), kSCPropNetPPPDisconnectOnWake, &v27);
  if (v27)
  {
    *(_DWORD *)(a1 + 72) |= 0x8000000u;
    getNumber(*(const __CFDictionary **)(a1 + 136), kSCPropNetPPPDisconnectOnWakeTimer, (void *)(a1 + 196));
  }

  int v27 = 0;
  getNumber(*v2, @"ConnectionPersist", &v27);
  if (v27) {
    *(_DWORD *)(a1 + 72) |= 0x400000u;
  }
LABEL_26:
  if (*(_WORD *)(a1 + 66) == 2)
  {
    uint64_t v10 = (const __CFDictionary *)copyEntity( (const __SCDynamicStore *)gDynamicStore,  kSCDynamicStoreDomainSetup,  *(const __CFString **)(a1 + 24),  kSCEntNetInterface);
    if (v10)
    {
      uint64_t v11 = v10;
      BOOL v12 = (const __CFString *)CFDictionaryGetValue(v10, kSCPropNetInterfaceDeviceName);
      CFTypeID v13 = (const __CFString *)CFDictionaryGetValue(v11, kSCPropNetInterfaceHardware);
      CFTypeID TypeID = CFStringGetTypeID();
      if (!v13) {
        goto LABEL_34;
      }
      if (CFGetTypeID(v13) != TypeID) {
        goto LABEL_34;
      }
      CFTypeID v15 = CFStringGetTypeID();
      if (!v12
        || CFGetTypeID(v12) != v15
        || CFStringCompare(v13, kSCEntNetAirPort, 0LL) && CFStringCompare(v13, kSCEntNetEthernet, 0LL))
      {
        goto LABEL_34;
      }

      CFStringRef v24 = *(const __CFString **)(a1 + 80);
      if (!v24) {
        goto LABEL_68;
      }
      if (CFStringCompare(v12, v24, 0LL)) {
        sub_E3A4(a1);
      }
      if (!*(void *)(a1 + 80))
      {
LABEL_68:
        int v25 = socket(27, 3, 0);
        *(_DWORD *)(a1 + 624) = v25;
        if ((v25 & 0x80000000) == 0)
        {
          *(void *)(a1 + 80) = v12;
          CFRetain(v12);
          CFStringGetCString(v12, v30.sa_data, 16LL, 0);
          *(_WORD *)&v30.sa_len = 6930;
          if (bind(*(_DWORD *)(a1 + 624), &v30, 0x12u) < 0) {
LABEL_34:
          }
            sub_E3A4(a1);
        }
      }

      CFRelease(v11);
    }
  }

  int v16 = *(_DWORD *)(a1 + 628);
  if (v16 == 11 || v16 == 3)
  {
    *(_DWORD *)(a1 + 72) = *(_DWORD *)(a1 + 72) & 0xFFFFFFE7 | 8;
    scnc_stop(a1, 0LL, 15LL, 0LL);
  }

  else if (v16)
  {
    *(_DWORD *)(a1 + 72) = *(_DWORD *)(a1 + 72) & 0xFFFFFFE7 | 0x10;
    if (v5
      || (v5 = copyService( (const __SCDynamicStore *)gDynamicStore,  kSCDynamicStoreDomainSetup,  *(const __CFString **)(a1 + 24)),  (pid_t v26 = v5) != 0LL))
    {
      CFTypeID v19 = *(const __CFDictionary **)(a1 + 128);
      CFTypeID v20 = CFDictionaryGetValue((CFDictionaryRef)v5, kSCEntNetPPP);
      if (v20)
      {
        CFTypeID v21 = CFGetTypeID(v20);
        if (v21 == CFDictionaryGetTypeID())
        {
          int v22 = *(_DWORD *)(a1 + 596);
          sub_10A98(v22, "[OPTIONS]");
          get_int_option(a1, kSCEntNetPPP, kSCPropNetPPPIdleReminder, v19, (CFDictionaryRef)v5, &v29, 0);
          if (v29)
          {
            get_int_option(a1, kSCEntNetPPP, kSCPropNetPPPIdleReminderTimer, v19, (CFDictionaryRef)v5, &v29, 0);
            int v23 = v29;
          }

          else
          {
            int v23 = 0;
          }

          sub_12EF0(v22, "reminder", v23);
          ppp_getoptval(a1, v19, (CFDictionaryRef)v5, 4, (char *)&v29, 4u, &v28);
          sub_12EF0(v22, "idle", v29);
          sub_10A98(v22, "[EOP]");
        }
      }
    }
  }

  else
  {
    int v17 = *(_DWORD *)(a1 + 72);
    if ((v17 & 0x10000) != 0 && ((v17 & 0x20000) == 0 || gLoggedInUser)) {
      ppp_start(a1, 0LL);
    }
  }

  my_CFRelease((const void **)&v26);
  return 0LL;
}

uint64_t ppp_start( unint64_t a1, CFTypeRef cf1, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  mach_port_name_t v8 = a6;
  mach_port_name_t v9 = a5;
  int v10 = a4;
  int v11 = a3;
  int v150 = 1;
  unsigned int v151 = 0;
  *(_DWORD *)(a1 + 72) &= 0xFFFFFDE7;
  int v14 = *(_DWORD *)(a1 + 628);
  if (v14)
  {
    if (v14 == 11 || v14 == 3)
    {
      my_CFRelease((const void **)(a1 + 640));
      *(void *)(a1 + 640) = cf1;
      *(_DWORD *)(a1 + 648) = v11;
      *(_DWORD *)(a1 + 652) = v10;
      *(_DWORD *)(a1 + 656) = v9;
      *(_DWORD *)(a1 + 660) = v8;
      my_CFRetain(cf1);
      scnc_stop(a1, 0LL, 15LL, 0);
      uint64_t result = 0LL;
      *(_DWORD *)(a1 + 72) |= 4u;
    }

    else if (my_CFEqual((unint64_t)cf1, *(void *)(a1 + 128)))
    {
      phase_changed(a1, *(unsigned int *)(a1 + 628), v30, v31, v32, v33, v34, v35);
      return 0LL;
    }

    else
    {
      return 5LL;
    }

    return result;
  }

  int v17 = a8;
  int v18 = a7;
  scnc_log(7LL, @"PPP Controller: VPN System Prefs %@", a3, a4, a5, a6, a7, a8, *(void *)(a1 + 136));
  scnc_log(7LL, @"PPP Controller: VPN User Options %@", v19, v20, v21, v22, v23, v24, (uint64_t)cf1);
  int v25 = *(__CFUserNotification **)(a1 + 168);
  if (v25)
  {
    CFUserNotificationCancel(v25);
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 176), kCFRunLoopDefaultMode);
    my_CFRelease((const void **)(a1 + 168));
    my_CFRelease((const void **)(a1 + 176));
  }

  *(void *)(a1 + 632) = 1LL;
  uint64_t v27 = *(void *)(a1 + 584);
  if (v27) {
    uint64_t v28 = ne_sm_bridge_copy_configuration(v27);
  }
  else {
    uint64_t v28 = (uint64_t)copyService( (const __SCDynamicStore *)gDynamicStore,  kSCDynamicStoreDomainSetup,  *(const __CFString **)(a1 + 24));
  }
  char v36 = (const __CFDictionary *)v28;
  if (v28)
  {
    memset(v156, 0, sizeof(v156));
    sub_11964((uint64_t)v156, &v151, "pppd");
    sub_11964((uint64_t)v156, &v151, "serviceid");
    sub_11964((uint64_t)v156, &v151, *(char **)(a1 + 56));
    sub_11964((uint64_t)v156, &v151, "controlled");
    if (socketpair(1, 1, 0, (int *)(a1 + 592)) == -1
      || socketpair(1, 1, 0, (int *)(a1 + 600)) == -1
      || setsockopt(*(_DWORD *)(a1 + 596), 0xFFFF, 4130, &v150, 4u) == -1)
    {
      goto LABEL_309;
    }

    *(_DWORD *)(a1 + 72) = *(_DWORD *)(a1 + 72) & 0xFFFFFBFF | ((v17 != 0) << 10);
    *(_DWORD *)(a1 + 88) = v11;
    *(_DWORD *)(a1 + 92) = v10;
    scnc_bootstrap_retain(a1, v9);
    scnc_ausession_retain(a1, v8);
    if (*(void *)(a1 + 584))
    {
      CFPropertyListRef Value = CFDictionaryGetValue(v36, @"EnvironmentVariables");
      if (!Value) {
        goto LABEL_26;
      }
      uint64_t v38 = (const __CFDictionary *)CFRetain(Value);
    }

    else
    {
      uint64_t v38 = (const __CFDictionary *)collectEnvironmentVariables( (const __SCDynamicStore *)gDynamicStore,  *(const __CFString **)(a1 + 24));
    }

    int v39 = v38;
    if (v38)
    {
      extractEnvironmentVariables(v38, a1);
      CFRelease(v39);
    }

LABEL_98:
            if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v36, 24, (char *)&Count, 4u, &v155))
            {
              unsigned int v76 = Count;
              if (Count)
              {
                if (*(_WORD *)(a1 + 66))
                {
                  sub_12F6C(v49, "plugin", "PPPSerial.ppp");
                  unsigned int v76 = Count;
                }

                if (v76 == 1)
                {
                }

                else if (v76 == 2)
                {
                  sub_10A98(v49, "terminalwindow");
                }
              }
            }

            get_int_option(a1, v45, kSCPropNetPPPCommRedialEnabled, (CFDictionaryRef)cf1, v36, &Count, 0);
            if (Count)
            {
              get_str_option( a1,  v45,  kSCPropNetPPPCommAlternateRemoteAddress,  (CFDictionaryRef)cf1,  v36,  cStr,  0x100u,  &Count,  "");
              if (cStr[0]) {
                sub_12F6C(v49, "altremoteaddress", cStr);
              }
              get_int_option(a1, v45, kSCPropNetPPPCommRedialCount, (CFDictionaryRef)cf1, v36, &Count, 0);
              if (Count) {
                sub_12EF0(v49, "redialcount", Count);
              }
              get_int_option(a1, v45, kSCPropNetPPPCommRedialInterval, (CFDictionaryRef)cf1, v36, &Count, 0);
              if (Count) {
                sub_12EF0(v49, "redialtimer", Count);
              }
            }

            double v77 = 0.0;
            if (!gSleeping) {
              double v77 = *(double *)&gTimeScaleSeconds * (double)(mach_absolute_time() - gWakeUpTime);
            }
            if ((int)v77 <= 19)
            {
              else {
                int v78 = 20 - (int)v77;
              }
              sub_12EF0(v49, "extraconnecttime", v78);
            }

            if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v36, 4, (char *)&Count, 4u, &v155) && Count)
            {
              sub_12EF0(v49, "idle", Count);
              sub_10A98(v49, "noidlerecv");
            }

            if (v18)
            {
              sub_10A98(v49, "demand");
              get_int_option(a1, v45, @"HoldOffTime", 0LL, v36, &Count, 30);
              sub_12EF0(v49, "holdoff", Count);
              if ((v18 & 2) != 0 && Count) {
                sub_10A98(v49, "holdfirst");
              }
              get_int_option(a1, v45, @"MaxFailure", 0LL, v36, &Count, 3);
              sub_12EF0(v49, "maxfail", Count);
            }

            if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v36, 21, (char *)&Count, 4u, &v155))
            {
              unsigned __int16 v79 = Count;
              if (Count)
              {
                if (Count >= 0x10000)
                {
                  sub_12EF0(v49, "lcp-echo-interval", HIWORD(Count));
                  unsigned __int16 v79 = Count;
                }

                if (v79) {
                  sub_12EF0(v49, "lcp-echo-failure", v79);
                }
              }
            }

            if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v36, 9, (char *)&Count, 4u, &v155))
            {
              char v80 = Count;
              if ((Count & 1) == 0)
              {
                sub_10A98(v49, "nopcomp");
                char v80 = Count;
              }

              if ((v80 & 2) == 0) {
                sub_10A98(v49, "noaccomp");
              }
            }

            if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v36, 12, (char *)&Count, 4u, &v155))
            {
              if (Count)
              {
                sub_12EF0(v49, "asyncmap", Count);
LABEL_159:
                if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v36, 13, (char *)&Count, 4u, &v155) && Count)
                {
                  sub_10A98(v49, "escape");
                  int v82 = 0;
                  buffer[0] = 0;
                  do
                  {
                    if (((Count >> v82) & 1) != 0)
                    {
                      snprintf(__str, 0x100uLL, "%d,", v82);
                      __strlcat_chk(buffer, __str, 1024LL, 1024LL);
                    }

                    ++v82;
                  }

                  while (v82 != 32);
                  buffer[strlen(buffer) - 1] = 0;
                  sub_10A98(v49, buffer);
                }

                if (CFDictionaryContainsKey(v36, kSCEntNetIPv4))
                {
                  if (getStringFromEntity( (const __SCDynamicStore *)gDynamicStore,  kSCDynamicStoreDomainState,  0LL,  kSCEntNetIPv4,  kSCPropNetIPv4Router,  cStr,  0x100u)) {
                    BOOL v83 = cStr[0] == 0;
                  }
                  else {
                    BOOL v83 = 1;
                  }
                  if (!v83) {
                    sub_12F6C(v49, "ipparam", cStr);
                  }
                  get_int_option(a1, kSCEntNetIPv4, kSCPropNetOverridePrimary, 0LL, v36, &Count, 0);
                  if (Count)
                  {
                    sub_10A98(v49, "defaultroute");
                    int v84 = 1;
                  }

                  else
                  {
                    int v84 = 0;
                  }

                  if (!ppp_getoptval(a1, (CFDictionaryRef)cf1, v36, 14, (char *)&Count, 4u, &v155)
                    || !Count)
                  {
                    sub_10A98(v49, "novj");
                  }

                  if (*(_WORD *)(a1 + 66) == 5) {
                    sub_12EF0(v49, "ip-src-address-filter", 2);
                  }
                  if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v36, 15, (char *)&Count, 4u, &v155)
                    && Count)
                  {
                    snprintf( __str,  0x100uLL,  "%d.%d.%d.%d",  HIBYTE(Count),  BYTE2(Count),  BYTE1(Count),  Count);
                  }

                  else
                  {
                    __strlcpy_chk(__str, "0", 256LL, 256LL);
                  }

                  __strlcpy_chk(buffer, __str, 1024LL, 1024LL);
                  __strlcat_chk(buffer, ":", 1024LL, 1024LL);
                  if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v36, 16, (char *)&Count, 4u, &v155)
                    && Count)
                  {
                    snprintf( __str,  0x100uLL,  "%d.%d.%d.%d",  HIBYTE(Count),  BYTE2(Count),  BYTE1(Count),  Count);
                  }

                  else
                  {
                    __strlcpy_chk(__str, "0", 256LL, 256LL);
                  }

                  __strlcat_chk(buffer, __str, 1024LL, 1024LL);
                  sub_10A98(v49, buffer);
                  sub_10A98(v49, "noipdefault");
                  sub_10A98(v49, "ipcp-accept-local");
                  sub_10A98(v49, "ipcp-accept-remote");
                  get_int_option(a1, v45, @"IPCPUsePeerDNS", (CFDictionaryRef)cf1, v36, &Count, 1);
                  if (Count) {
                    sub_10A98(v49, "usepeerdns");
                  }
                  if (*(_WORD *)(a1 + 66) != 5)
                  {
LABEL_194:
                    if (CFDictionaryContainsKey(v36, kSCEntNetIPv6))
                    {
                      sub_10A98(v49, "+ipv6");
                      sub_10A98(v49, "ipv6cp-use-persistent");
                    }

                    if (v84)
                    {
                      sub_10A98(v49, "noacsp");
                      v86 = "no-use-dhcp";
                    }

                    else
                    {
                      get_int_option(a1, v45, kSCPropNetPPPACSPEnabled, (CFDictionaryRef)cf1, v36, &Count, 0);
                      if (!Count) {
                        sub_10A98(v49, "noacsp");
                      }
                      get_int_option( a1,  v45,  @"UseDHCP",  (CFDictionaryRef)cf1,  v36,  &Count,  *(unsigned __int16 *)(a1 + 66) == 5);
                      if (Count != 1)
                      {
LABEL_203:
                        sub_10A98(v49, "noauth");
                        int v87 = ppp_getoptval(a1, (CFDictionaryRef)cf1, v36, 6, (char *)&Count, 4u, &v155);
                        BOOL v88 = 0;
                        int v89 = 1;
                        if (v87 && Count)
                        {
                          if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v36, 7, cStr, 0x100u, &v155)
                            && cStr[0])
                          {
                            sub_12F6C(v49, "user", cStr);
                            int str_option = get_str_option( a1,  v45,  kSCPropNetPPPAuthPassword,  (CFDictionaryRef)cf1,  v36,  cStr,  0x100u,  &Count,  "");
                            int v91 = cStr[0];
                            CFTypeID TypeID = CFStringGetTypeID();
                            if (v91)
                            {
                              if (str_option == 3) {
                                int v93 = 0LL;
                              }
                              else {
                                int v93 = (const __CFDictionary *)cf1;
                              }
                              if (str_option == 3) {
                                v94 = v36;
                              }
                              else {
                                v94 = 0LL;
                              }
                              cf_option = (const __CFString *)get_cf_option( v45,  kSCPropNetPPPAuthPasswordEncryption,  TypeID,  v93,  v94,  0LL);
                              if (!cf_option) {
                                goto LABEL_217;
                              }
                              v96 = cf_option;
                              if (CFStringCompare(cf_option, kSCValNetPPPAuthPasswordEncryptionKeychain, 0LL) == kCFCompareEqualTo)
                              {
                                if (str_option == 3) {
                                  v99 = "keychainpassword";
                                }
                                else {
                                  v99 = "userkeychainpassword";
                                }
LABEL_231:
                                sub_12F6C(v49, v99, cStr);
LABEL_232:
                                int v89 = 1;
                                BOOL v88 = 1;
                                goto LABEL_233;
                              }

                              if (CFStringCompare(v96, kSCValNetPPPAuthPasswordEncryptionToken, 0LL))
                              {
LABEL_217:
                                v97 = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
                                if (v97)
                                {
                                  v98 = v97;
                                  CFStringGetCString(v97, cStr, 256LL, 0x500u);
                                  CFRelease(v98);
                                }

                                v99 = "password";
                                goto LABEL_231;
                              }
                            }

                            else
                            {
                              v102 = (const __CFString *)get_cf_option( v45,  kSCPropNetPPPAuthPasswordEncryption,  TypeID,  (CFDictionaryRef)cf1,  v36,  0LL);
                              if (!v102 || CFStringCompare(v102, kSCValNetPPPAuthPasswordEncryptionToken, 0LL)) {
                                goto LABEL_232;
                              }
                            }

                            goto LABEL_225;
                          }

                          CFTypeID v100 = CFStringGetTypeID();
                          v101 = (const __CFString *)get_cf_option( v45,  kSCPropNetPPPAuthPasswordEncryption,  v100,  (CFDictionaryRef)cf1,  v36,  0LL);
                          if (v101
                            && CFStringCompare(v101, kSCValNetPPPAuthPasswordEncryptionToken, 0LL) == kCFCompareEqualTo)
                          {
LABEL_225:
                            BOOL v88 = 1;
                            sub_12EF0(v49, "tokencard", 1);
                            int v89 = 0;
                            goto LABEL_233;
                          }

                          BOOL v88 = *(unsigned __int16 *)(a1 + 66) == 5;
                          int v89 = 1;
                        }

LABEL_233:
                        int v146 = v89;
                        int v147 = v88;
                        if (!cf1
                          || (v103 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)cf1, v45)) == 0LL
                          || (v104 = v103, CFTypeID v105 = CFGetTypeID(v103), v105 != CFDictionaryGetTypeID())
                          || (v106 = CFDictionaryGetValue(v104, kSCPropNetPPPAuthProtocol)) == 0LL
                          || (v107 = v106, CFTypeID v108 = CFGetTypeID(v106), v108 != CFArrayGetTypeID()))
                        {
                          v107 = CFDictionaryGetValue(theDict, kSCPropNetPPPAuthProtocol);
                          if (!v107) {
                            goto LABEL_257;
                          }
                        }

                        CFTypeID v109 = CFGetTypeID(v107);
                        if (v109 == CFArrayGetTypeID() && (unsigned int Count = CFArrayGetCount((CFArrayRef)v107)) != 0)
                        {
                          unint64_t v110 = 0LL;
                          int v111 = 0;
                          do
                          {
                            ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v107, v110);
                            if (ValueAtIndex)
                            {
                              v113 = ValueAtIndex;
                              CFTypeID v114 = CFGetTypeID(ValueAtIndex);
                              if (v114 == CFStringGetTypeID())
                              {
                                if (CFStringCompare(v113, kSCValNetPPPAuthProtocolPAP, 0LL))
                                {
                                  if (CFStringCompare(v113, kSCValNetPPPAuthProtocolCHAP, 0LL))
                                  {
                                    if (CFStringCompare(v113, @"MSCHAP1", 0LL))
                                    {
                                      if (CFStringCompare(v113, @"MSCHAP2", 0LL))
                                      {
                                        if (CFStringCompare(v113, @"EAP", 0LL) == kCFCompareEqualTo) {
                                          v111 |= 0x10u;
                                        }
                                      }

                                      else
                                      {
                                        v111 |= 8u;
                                      }
                                    }

                                    else
                                    {
                                      v111 |= 4u;
                                    }
                                  }

                                  else
                                  {
                                    v111 |= 2u;
                                  }
                                }

                                else
                                {
                                  v111 |= 1u;
                                }
                              }
                            }

                            ++v110;
                          }

                          while (v110 < Count);
                        }

                        else
                        {
LABEL_257:
                          int v111 = 15;
                        }

                        if (v146)
                        {
                          CFStringRef v115 = kSCEntNetPPP;
                          get_int_option(a1, kSCEntNetPPP, @"TokenCard", (CFDictionaryRef)cf1, v36, &Count, 0);
                          if (Count)
                          {
                            sub_12EF0(v149, "tokencard", Count);
                            int v147 = 1;
                          }
                        }

                        else
                        {
                          CFStringRef v115 = kSCEntNetPPP;
                        }

                        if ((v111 & 0x10) != 0)
                        {
                          v111 &= ~0x10u;
                          if (cf1
                            && (v116 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)cf1, v115)) != 0LL
                            && (v117 = v116, CFTypeID v118 = CFGetTypeID(v116), v118 == CFDictionaryGetTypeID())
                            && (v119 = CFDictionaryGetValue(v117, @"AuthEAPPlugins")) != 0LL
                            && (v120 = v119, CFTypeID v121 = CFGetTypeID(v119), v121 == CFArrayGetTypeID()))
                          {
                            int v122 = 1;
                          }

                          else
                          {
                            v123 = CFDictionaryGetValue(theDict, @"AuthEAPPlugins");
                            if (!v123) {
                              goto LABEL_281;
                            }
                            v120 = v123;
                            int v122 = 0;
                          }

                          CFTypeID v124 = CFGetTypeID(v120);
                          if (v124 == CFArrayGetTypeID())
                          {
                            unsigned int Count = CFArrayGetCount((CFArrayRef)v120);
                            if (Count)
                            {
                              for (unint64_t i = 0LL; i < Count; ++i)
                              {
                                v126 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v120, i);
                                if (v126)
                                {
                                  v127 = v126;
                                  CFTypeID v128 = CFGetTypeID(v126);
                                  if (v128 == CFStringGetTypeID())
                                  {
                                    CFStringGetCString(v127, buffer, 1020LL, 0x8000100u);
                                    if (!v122 || !strchr(buffer, 92))
                                    {
                                      __strlcat_chk(buffer, ".ppp", 1024LL, 1024LL);
                                      sub_12F6C(v149, "eapplugin", buffer);
                                      v111 |= 0x10u;
                                    }
                                  }

                                  CFStringRef v115 = kSCEntNetPPP;
                                }
                              }
                            }
                          }
                        }

LABEL_281:
                        sub_10A98(v149, "noccp");
                        if ((v111 & 1) != 0)
                        {
                          if ((v111 & 2) != 0) {
                            goto LABEL_283;
                          }
                        }

                        else
                        {
                          sub_10A98(v149, "refuse-pap");
                          if ((v111 & 2) != 0)
                          {
LABEL_283:
                            if ((v111 & 4) != 0) {
                              goto LABEL_284;
                            }
                            goto LABEL_318;
                          }
                        }

                        sub_10A98(v149, "refuse-chap-md5");
                        if ((v111 & 4) != 0)
                        {
LABEL_284:
                          if ((v111 & 8) != 0) {
                            goto LABEL_285;
                          }
                          goto LABEL_319;
                        }

LABEL_318:
                        sub_10A98(v149, "refuse-mschap");
                        if ((v111 & 8) != 0)
                        {
LABEL_285:
                          if ((v111 & 0x10) != 0) {
                            goto LABEL_287;
                          }
                          goto LABEL_286;
                        }

LABEL_319:
                        sub_10A98(v149, "refuse-mschap-v2");
                        if ((v111 & 0x10) != 0)
                        {
LABEL_287:
                          if (v111 == 16 || !v147 || (*(_DWORD *)(a1 + 72) & 0x80) == 0) {
                            sub_10A98(v149, "noaskpassword");
                          }
                          get_str_option( a1,  v115,  kSCPropNetPPPAuthPrompt,  (CFDictionaryRef)cf1,  v36,  cStr,  0x100u,  &Count,  "");
                          if (cStr[0])
                          {
                            __str[0] = 0;
                            CFStringGetCString(kSCValNetPPPAuthPromptAfter, __str, 256LL, 0x8000100u);
                            if (!strcmp(cStr, __str)) {
                              sub_10A98(v149, "askpasswordafter");
                            }
                          }

                          sub_10A98(v149, "nodetach");
                          get_int_option(a1, v115, kSCPropNetPPPIdleReminder, (CFDictionaryRef)cf1, v36, &Count, 0);
                          if (Count)
                          {
                            get_int_option( a1,  v115,  kSCPropNetPPPIdleReminderTimer,  (CFDictionaryRef)cf1,  v36,  &Count,  0);
                            if (Count) {
                              sub_12EF0(v149, "reminder", Count);
                            }
                          }

                          v129 = (const __CFArray *)CFDictionaryGetValue(theDict, kSCPropNetPPPPlugins);
                          if (v129)
                          {
                            v130 = v129;
                            CFTypeID v131 = CFGetTypeID(v129);
                            if (v131 == CFArrayGetTypeID())
                            {
                              unsigned int Count = CFArrayGetCount(v130);
                              if (Count)
                              {
                                for (unint64_t j = 0LL; j < Count; ++j)
                                {
                                  v133 = (const __CFString *)CFArrayGetValueAtIndex(v130, j);
                                  if (v133)
                                  {
                                    v134 = v133;
                                    CFTypeID v135 = CFGetTypeID(v133);
                                    if (v135 == CFStringGetTypeID())
                                    {
                                      CFStringGetCString(v134, buffer, 1020LL, 0x8000100u);
                                      __strlcat_chk(buffer, ".ppp", 1024LL, 1024LL);
                                      sub_12F6C(v149, "plugin", buffer);
                                    }
                                  }
                                }
                              }
                            }
                          }

                          if (GetStrFromDict(theDict, kSCPropUserDefinedName, cStr, 256, "")
                            || GetStrFromDict(v36, kSCPropUserDefinedName, cStr, 256, ""))
                          {
                            sub_12F6C(v149, "call", cStr);
                          }

                          sub_10A98(v149, "[EOP]");
                          ppp_socket_create_client(*(_DWORD *)(a1 + 600), 1, 0, 0);
                          *(_DWORD *)(a1 + 632) = 0;
                          ppp_updatephase(a1, 1LL, 0LL, v136, v137, v138, v139, v140);
                          *(_DWORD *)(a1 + 396) = 0;
                          service_started(a1);
                          *(_DWORD *)(a1 + 72) = *(_DWORD *)(a1 + 72) & 0xFFFFFFDF | (32 * (v18 != 0));
                          *(void *)(a1 + 128) = cf1;
                          my_CFRetain(cf1);
                          goto LABEL_309;
                        }

LABEL_286:
                        sub_10A98(v149, "refuse-eap");
                        goto LABEL_287;
                      }

                      v86 = "use-dhcp";
                    }

                    sub_10A98(v49, v86);
                    goto LABEL_203;
                  }

                  uint64_t v85 = "addifroute";
                }

                else
                {
                  int v84 = 0;
                  uint64_t v85 = "noip";
                }

                sub_10A98(v49, v85);
                goto LABEL_194;
              }

              v81 = "receive-all";
            }

            else
            {
              v81 = "default-asyncmap";
            }

            sub_10A98(v49, v81);
            goto LABEL_159;
          }

          CFTypeID v67 = CFStringGetTypeID();
          int v68 = (const __CFString *)get_cf_option( (void *)kSCEntNetL2TP,  kSCPropNetL2TPTransport,  v67,  (CFDictionaryRef)cf1,  v36,  0LL);
          if (v68 && CFStringCompare(v68, kSCValNetL2TPTransportIP, 0LL) == kCFCompareEqualTo) {
            sub_10A98(v49, "l2tpnoipsec");
          }
          get_str_option( a1,  kSCEntNetL2TP,  kSCPropNetL2TPIPSecSharedSecret,  (CFDictionaryRef)cf1,  v36,  cStr,  0x100u,  &Count,  "");
          if (cStr[0])
          {
            sub_12F6C(v49, "l2tpipsecsharedsecret", cStr);
            CFTypeID v69 = CFStringGetTypeID();
            int v70 = (const __CFString *)get_cf_option( (void *)kSCEntNetL2TP,  kSCPropNetL2TPIPSecSharedSecretEncryption,  v69,  (CFDictionaryRef)cf1,  v36,  0LL);
            if (!v70) {
              goto LABEL_97;
            }
            int v71 = v70;
            if (CFStringCompare(v70, @"Key", 0LL))
            {
              int v72 = (CFStringRef *)&kSCValNetL2TPIPSecSharedSecretEncryptionKeychain;
              goto LABEL_93;
            }
          }

          else
          {
            get_str_option( a1,  kSCEntNetIPSec,  kSCPropNetIPSecSharedSecret,  (CFDictionaryRef)cf1,  v36,  cStr,  0x100u,  &Count,  "");
            if (!cStr[0]) {
              goto LABEL_97;
            }
            sub_12F6C(v49, "l2tpipsecsharedsecret", cStr);
            CFTypeID v73 = CFStringGetTypeID();
            v74 = (const __CFString *)get_cf_option( (void *)kSCEntNetL2TP,  kSCPropNetIPSecSharedSecretEncryption,  v73,  (CFDictionaryRef)cf1,  v36,  0LL);
            if (!v74) {
              goto LABEL_97;
            }
            int v71 = v74;
            if (CFStringCompare(v74, @"Key", 0LL))
            {
              int v72 = (CFStringRef *)&kSCValNetIPSecSharedSecretEncryptionKeychain;
LABEL_93:
              if (CFStringCompare(v71, *v72, 0LL) == kCFCompareEqualTo)
              {
                CFIndex v75 = "keychain";
LABEL_96:
                sub_12F6C(v49, "l2tpipsecsharedsecrettype", v75);
              }

LABEL_97:
              get_int_option(a1, kSCEntNetL2TP, @"UDPPort", (CFDictionaryRef)cf1, v36, &Count, 0);
              sub_12EF0(v49, "l2tpudpport", Count);
              goto LABEL_98;
            }
          }

          CFIndex v75 = "key";
          goto LABEL_96;
        }
      }

      kill(*(_DWORD *)(a1 + 608), 15);
    }

LABEL_309:
    CFRelease(v36);
  }

  uint64_t v141 = v151;
  if (v151)
  {
    v142 = (void **)v156;
    do
    {
      v143 = *v142++;
      free(v143);
      --v141;
    }

    while (v141);
  }

  if (*(_DWORD *)(a1 + 608) == -1)
  {
    my_close(*(unsigned int *)(a1 + 600));
    *(_DWORD *)(a1 + 600) = -1;
    my_close(*(unsigned int *)(a1 + 604));
    *(_DWORD *)(a1 + 604) = -1;
    my_close(*(unsigned int *)(a1 + 592));
    *(_DWORD *)(a1 + 592) = -1;
    my_close(*(unsigned int *)(a1 + 596));
    *(_DWORD *)(a1 + 596) = -1;
    sub_11E28(a1);
  }

  return *(unsigned int *)(a1 + 632);
}

BOOL ppp_can_sleep(uint64_t a1)
{
  return *(_DWORD *)(a1 + 628) != 8 || (*(_BYTE *)(a1 + 74) & 8) == 0;
}

uint64_t ppp_will_sleep(uint64_t a1, int a2)
{
  int v2 = *(_DWORD *)(a1 + 628);
  if (!v2) {
    goto LABEL_4;
  }
  if ((*(_BYTE *)(a1 + 74) & 4) == 0)
  {
    int v2 = 0;
LABEL_4:
    int v3 = 0;
    return v3 | v2;
  }

  int v3 = 2 * (((v2 - 3) & 0xFFFFFFF7) != 0);
  if (!a2) {
    scnc_stop(a1, 0LL, 15LL, 2);
  }
  int v2 = 1;
  return v3 | v2;
}

_DWORD *ppp_wake_up(_DWORD *result)
{
  if (result[157]) {
    return (_DWORD *)scnc_disconnectifoverslept((uint64_t)"ppp_wake_up", (uint64_t)result);
  }
  int v1 = result[18];
  if ((v1 & 0x10000) != 0 && ((v1 & 0x20000) == 0 || gLoggedInUser)) {
    return (_DWORD *)ppp_start( (unint64_t)result,  0LL,  0LL,  0LL,  result[24],  result[25],  1LL,  0LL);
  }
  return result;
}

uint64_t ppp_log_out(uint64_t result)
{
  if (*(_DWORD *)(result + 628))
  {
    if ((*(_BYTE *)(result + 74) & 2) != 0) {
      return scnc_stop(result, 0LL, 15LL, 3);
    }
  }

  return result;
}

unint64_t ppp_log_in(unint64_t result)
{
  if (!*(_DWORD *)(result + 628) && (*(_BYTE *)(result + 74) & 1) != 0) {
    return ppp_start(result, 0LL, 0LL, 0LL, *(unsigned int *)(result + 96), *(unsigned int *)(result + 100), 1LL, 0LL);
  }
  return result;
}

_DWORD *ppp_log_switch(_DWORD *result)
{
  unsigned int v1 = result[18];
  if (result[157])
  {
    if ((v1 & 0x100000) != 0)
    {
      result[18] = (v1 >> 13) & 8 | v1 & 0xFFFFFFE7;
      return (_DWORD *)scnc_stop((uint64_t)result, 0LL, 15LL, 4);
    }
  }

  else if ((v1 & 0x10000) != 0)
  {
    return (_DWORD *)ppp_start( (unint64_t)result,  0LL,  0LL,  0LL,  result[24],  result[25],  1LL,  0LL);
  }

  return result;
}

uint64_t ppp_ondemand_add_service_data(uint64_t a1, __CFDictionary *a2)
{
  int v3 = *(const __CFDictionary **)(a1 + 136);
  if (v3)
  {
    CFPropertyListRef Value = CFDictionaryGetValue(v3, kSCPropNetPPPOnDemandMatchDomainsAlways);
    uint64_t v6 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), kSCPropNetPPPOnDemandMatchDomainsOnRetry);
    char v7 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), kSCPropNetPPPOnDemandMatchDomainsNever);
    mach_port_name_t v8 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), kSCPropNetPPPCommRemoteAddress);
  }

  return 0LL;
}

uint64_t ppp_install(uint64_t a1)
{
  return 0LL;
}

ssize_t sub_10A98(int a1, char *__s)
{
  size_t v4 = strlen(__s);
  write(a1, __s, v4);
  return write(a1, " ", 1uLL);
}

uint64_t ppp_uninstall(uint64_t a1)
{
  return 0LL;
}

void MT_pppGetTracerOptions(uint64_t a1, char *a2)
{
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v96 = 0u;
  __int128 v97 = 0u;
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  __int128 cStr = 0u;
  __int128 v87 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v61 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v54 = 0u;
  int v50 = 0;
  bzero(a2, 0x338uLL);
  size_t v4 = copyService((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainSetup, *(const __CFString **)(a1 + 24));
  if (!v4) {
    return;
  }
  int v5 = (const __CFDictionary *)v4;
  CFPropertyListRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v4, kSCEntNetModem);
  if (Value)
  {
    char v7 = Value;
    if (getString(Value, kSCPropNetModemDeviceVendor, (char *)&cStr, 0x100u))
    {
      __int128 v84 = 0u;
      __int128 v85 = 0u;
      __int128 v82 = 0u;
      __int128 v83 = 0u;
      __int128 v80 = 0u;
      __int128 v81 = 0u;
      __int128 v78 = 0u;
      __int128 v79 = 0u;
      __int128 v76 = 0u;
      __int128 v77 = 0u;
      __int128 v74 = 0u;
      __int128 v75 = 0u;
      __int128 v72 = 0u;
      __int128 v73 = 0u;
      __int128 v70 = 0u;
      __int128 v71 = 0u;
      __strlcpy_chk(&v70, &cStr, 256LL, 256LL);
      __int128 cStr = 0u;
      __int128 v87 = 0u;
      __int128 v88 = 0u;
      __int128 v89 = 0u;
      __int128 v90 = 0u;
      __int128 v91 = 0u;
      __int128 v92 = 0u;
      __int128 v93 = 0u;
      __int128 v94 = 0u;
      __int128 v95 = 0u;
      __int128 v96 = 0u;
      __int128 v97 = 0u;
      __int128 v98 = 0u;
      __int128 v99 = 0u;
      __int128 v100 = 0u;
      __int128 v101 = 0u;
    }

    if (getString(v7, kSCPropNetModemDeviceModel, (char *)&cStr, 0x100u))
    {
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      __int128 v61 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      __int128 v54 = 0u;
      __strlcpy_chk(&v54, &cStr, 256LL, 256LL);
      __int128 cStr = 0u;
      __int128 v87 = 0u;
      __int128 v88 = 0u;
      __int128 v89 = 0u;
      __int128 v90 = 0u;
      __int128 v91 = 0u;
      __int128 v92 = 0u;
      __int128 v93 = 0u;
      __int128 v94 = 0u;
      __int128 v95 = 0u;
      __int128 v96 = 0u;
      __int128 v97 = 0u;
      __int128 v98 = 0u;
      __int128 v99 = 0u;
      __int128 v100 = 0u;
      __int128 v101 = 0u;
    }

    if ((_BYTE)v70 && (_BYTE)v54)
    {
      *((_OWORD *)a2 + 14) = 0u;
      *((_OWORD *)a2 + 15) = 0u;
      *((_OWORD *)a2 + 12) = 0u;
      *((_OWORD *)a2 + 13) = 0u;
      *((_OWORD *)a2 + 10) = 0u;
      *((_OWORD *)a2 + 11) = 0u;
      *((_OWORD *)a2 + 8) = 0u;
      *((_OWORD *)a2 + 9) = 0u;
      *((_OWORD *)a2 + 6) = 0u;
      *((_OWORD *)a2 + 7) = 0u;
      *((_OWORD *)a2 + 4) = 0u;
      *((_OWORD *)a2 + 5) = 0u;
      *((_OWORD *)a2 + 2) = 0u;
      *((_OWORD *)a2 + 3) = 0u;
      *(_OWORD *)a2 = 0u;
      *((_OWORD *)a2 + 1) = 0u;
      __strlcat_chk(a2, &v70, 256LL, 256LL);
      __strlcat_chk(a2, "/", 256LL, 256LL);
      __strlcat_chk(a2, &v54, 256LL, 256LL);
    }
  }

  mach_port_name_t v8 = (const __CFDictionary *)CFDictionaryGetValue(v5, kSCEntNetPPP);
  if (v8)
  {
    mach_port_name_t v9 = v8;
    getNumber(v8, kSCPropNetPPPDialOnDemand, &v50);
    snprintf(a2 + 516, 4uLL, "%u", v50);
    int v50 = 0;
    getNumber(v9, kSCPropNetPPPIdleReminder, &v50);
    snprintf(a2 + 520, 4uLL, "%u", v50);
    int v50 = 0;
    getNumber(v9, kSCPropNetPPPDisconnectOnLogout, &v50);
    snprintf(a2 + 524, 4uLL, "%u", v50);
    int v50 = 0;
    getNumber(v9, kSCPropNetPPPDisconnectOnFastUserSwitch, &v50);
    snprintf(a2 + 528, 4uLL, "%u", v50);
    int v50 = 0;
    if (getString(v9, kSCPropNetPPPAuthPrompt, (char *)&cStr, 0x100u))
    {
      *(_OWORD *)(a2 + 756) = 0u;
      *(_OWORD *)(a2 + 772) = 0u;
      *(_OWORD *)(a2 + 724) = 0u;
      *(_OWORD *)(a2 + 740) = 0u;
      *(_OWORD *)(a2 + 692) = 0u;
      *(_OWORD *)(a2 + 708) = 0u;
      *(_OWORD *)(a2 + 660) = 0u;
      *(_OWORD *)(a2 + 676) = 0u;
      *(_OWORD *)(a2 + 628) = 0u;
      *(_OWORD *)(a2 + 6memset(v5, 0, 44) = 0u;
      *(_OWORD *)(a2 + 596) = 0u;
      *(_OWORD *)(a2 + 612) = 0u;
      *(_OWORD *)(a2 + 564) = 0u;
      *(_OWORD *)(a2 + 580) = 0u;
      *(_OWORD *)(a2 + 532) = 0u;
      *(_OWORD *)(a2 + 548) = 0u;
      __strlcpy_chk(a2 + 532, &cStr, 256LL, 256LL);
      __int128 cStr = 0u;
      __int128 v87 = 0u;
      __int128 v88 = 0u;
      __int128 v89 = 0u;
      __int128 v90 = 0u;
      __int128 v91 = 0u;
      __int128 v92 = 0u;
      __int128 v93 = 0u;
      __int128 v94 = 0u;
      __int128 v95 = 0u;
      __int128 v96 = 0u;
      __int128 v97 = 0u;
      __int128 v98 = 0u;
      __int128 v99 = 0u;
      __int128 v100 = 0u;
      __int128 v101 = 0u;
    }

    getNumber(v9, kSCPropNetPPPCommRedialEnabled, &v50);
    snprintf(a2 + 788, 4uLL, "%u", v50);
    int v50 = 0;
    getNumber(v9, kSCPropNetPPPLCPEchoEnabled, &v50);
    snprintf(a2 + 792, 4uLL, "%u", v50);
    int v50 = 0;
    getNumber(v9, kSCPropNetPPPVerboseLogging, &v50);
    snprintf(a2 + 796, 4uLL, "%u", v50);
    int v50 = 0;
    getNumber(v9, kSCPropNetPPPIPCPCompressionVJ, &v50);
    snprintf(a2 + 800, 4uLL, "%u", v50);
    int v50 = 0;
    getNumber(v9, kSCPropNetPPPCommDisplayTerminalWindow, &v50);
    snprintf(a2 + 804, 4uLL, "%u", v50);
    int v50 = 0;
  }

  int v10 = (const __CFDictionary *)CFDictionaryGetValue(v5, kSCEntNetDNS);
  if (v10)
  {
    int v11 = (const __CFArray *)CFDictionaryGetValue(v10, kSCPropNetDNSServerAddresses);
    if (v11)
    {
      if (CFArrayGetCount(v11) >= 1) {
        int v50 = 1;
      }
    }
  }

  snprintf(a2 + 512, 4uLL, "%u", v50);
  int v50 = 0;
  BOOL v12 = (const __CFDictionary *)CFDictionaryGetValue(v5, kSCEntNetIPv4);
  if (v12 && getString(v12, kSCPropNetIPv4ConfigMethod, (char *)&cStr, 0x100u))
  {
    CFStringRef v13 = CFStringCreateWithCString(0LL, (const char *)&cStr, 0x8000100u);
    if (v13)
    {
      CFStringRef v14 = v13;
      if (CFEqual(v13, kSCValNetIPv4ConfigMethodManual)) {
        int v50 = 1;
      }
      CFRelease(v14);
    }

    __int128 v100 = 0u;
    __int128 v101 = 0u;
    __int128 v98 = 0u;
    __int128 v99 = 0u;
    __int128 v96 = 0u;
    __int128 v97 = 0u;
    __int128 v94 = 0u;
    __int128 v95 = 0u;
    __int128 v92 = 0u;
    __int128 v93 = 0u;
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    __int128 v88 = 0u;
    __int128 v89 = 0u;
    __int128 cStr = 0u;
    __int128 v87 = 0u;
  }

  snprintf(a2 + 808, 4uLL, "%u", v50);
  int v50 = 0;
  CFTypeID v15 = (const __CFDictionary *)CFDictionaryGetValue(v5, kSCEntNetIPv6);
  if (v15 && getString(v15, kSCPropNetIPv6ConfigMethod, (char *)&cStr, 0x100u))
  {
    CFStringRef v16 = CFStringCreateWithCString(0LL, (const char *)&cStr, 0x8000100u);
    if (v16)
    {
      CFStringRef v17 = v16;
      if (CFEqual(v16, kSCValNetIPv6ConfigMethodManual)) {
        int v50 = 1;
      }
      CFRelease(v17);
    }

    __int128 v100 = 0u;
    __int128 v101 = 0u;
    __int128 v98 = 0u;
    __int128 v99 = 0u;
    __int128 v96 = 0u;
    __int128 v97 = 0u;
    __int128 v94 = 0u;
    __int128 v95 = 0u;
    __int128 v92 = 0u;
    __int128 v93 = 0u;
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    __int128 v88 = 0u;
    __int128 v89 = 0u;
    __int128 cStr = 0u;
    __int128 v87 = 0u;
  }

  snprintf(a2 + 812, 4uLL, "%u", v50);
  int v50 = 0;
  snprintf(a2 + 816, 4uLL, "%u", 0);
  int v50 = 0;
  int v18 = SCPreferencesCreate(0LL, @"Plugin:PPPController", @"preferences.plist");
  uint64_t v19 = v18;
  if (v18
    && (uint64_t v20 = (const __CFDictionary *)SCPreferencesGetValue(v18, kSCPrefNetworkServices)) != 0LL
    && (uint64_t v21 = (const __CFDictionary *)CFDictionaryGetValue(v20, *(const void **)(a1 + 24))) != 0LL)
  {
    uint64_t v22 = (const __CFDictionary *)CFDictionaryGetValue(v21, kSCEntNetProxies);
    snprintf(a2 + 820, 4uLL, "%u", v50);
    if (v22) {
      CFDictionaryApplyFunction(v22, (CFDictionaryApplierFunction)sub_118E4, a2);
    }
  }

  else
  {
    snprintf(a2 + 820, 4uLL, "%u", v50);
  }

  if (!a2 || *(_WORD *)(a1 + 66) == 2 || !v19) {
    goto LABEL_58;
  }
  uint64_t v23 = SCNetworkServiceCopy(v19, *(CFStringRef *)(a1 + 24));
  if (!v23 || (uint64_t v24 = v23, (Interface = SCNetworkServiceGetInterface(v23)) == 0LL))
  {
LABEL_59:
    CFRelease(v19);
    goto LABEL_60;
  }

  do
  {
    pid_t v26 = Interface;
    Interface = SCNetworkInterfaceGetInterface(Interface);
  }

  while (Interface);
  CFStringRef BSDName = SCNetworkInterfaceGetBSDName(v26);
  if (!BSDName) {
    goto LABEL_58;
  }
  CFStringRef v28 = BSDName;
  int v29 = IOServiceMatching("IOSerialBSDClient");
  CFDictionarySetValue(v29, @"IOSerialBSDClientType", @"IOSerialStream");
  memset(v104, 0, 256);
  if (IOServiceGetMatchingServices(kIOMasterPortDefault, v29, &existing)) {
    goto LABEL_58;
  }
  io_object_t v30 = IOIteratorNext(existing);
  if (!v30) {
    goto LABEL_54;
  }
  io_registry_entry_t v31 = v30;
  while (1)
  {
    if (IORegistryEntryCreateCFProperties(v31, &properties, kCFAllocatorDefault, 0) || !properties) {
      goto LABEL_53;
    }
    uint64_t v32 = CFDictionaryGetValue(properties, @"IOTTYDevice");
    if (v32)
    {
      if (CFEqual(v32, v28)) {
        break;
      }
    }

    CFRelease(properties);
LABEL_53:
    IOObjectRelease(v31);
    io_registry_entry_t v31 = IOIteratorNext(existing);
    if (!v31) {
      goto LABEL_54;
    }
  }

  memset(v103, 0, sizeof(v103));
  memset(v102, 0, sizeof(v102));
  uint64_t v35 = CFDictionaryGetValue(properties, @"IOTTYBaseName");
  if (CFEqual(v35, @"usbmodem"))
  {
    __strlcat_chk(v104, "usbmodem", 256LL, 256LL);
    char v36 = CFStringCreateWithFormat(0LL, 0LL, @"idVendor");
    pid_t v37 = (const __CFNumber *)IORegistryEntrySearchCFProperty(v31, "IOService", v36, 0LL, 3u);
    if (v37 && (uint64_t v38 = v37, TypeID = CFNumberGetTypeID(), CFGetTypeID(v38) == TypeID))
    {
      CFNumberGetValue(v38, kCFNumberIntType, &valuePtr);
      __sprintf_chk((char *)v103, 0, 0x100uLL, "%0.4x", valuePtr);
      __strlcat_chk(v104, ".", 256LL, 256LL);
      __strlcat_chk(v104, v103, 256LL, 256LL);
      CFRelease(v38);
    }

    else
    {
      __strlcat_chk(v104, ".", 256LL, 256LL);
      __strlcat_chk(v104, "X", 256LL, 256LL);
    }

    CFRelease(v36);
    uint64_t v40 = CFStringCreateWithFormat(0LL, 0LL, @"idProduct");
    uint64_t v41 = (const __CFNumber *)IORegistryEntrySearchCFProperty(v31, "IOService", v40, 0LL, 3u);
    if (v41)
    {
      uint64_t v42 = v41;
      CFTypeID v43 = CFNumberGetTypeID();
      if (CFGetTypeID(v42) == v43)
      {
        CFNumberGetValue(v42, kCFNumberIntType, &valuePtr);
        __sprintf_chk((char *)v102, 0, 0x100uLL, "%0.4x");
        goto LABEL_78;
      }
    }

LABEL_79:
    __strlcat_chk(v104, ".", 256LL, 256LL);
    __strlcat_chk(v104, "X", 256LL, 256LL);
    goto LABEL_80;
  }

  if (CFEqual(v35, @"pci-serial"))
  {
    __strlcat_chk(v104, "pci-serial", 256LL, 256LL);
    int v44 = CFStringCreateWithFormat(0LL, 0LL, @"vendor-id");
    CFNumberRef v45 = (const __CFData *)IORegistryEntrySearchCFProperty(v31, "IOService", v44, 0LL, 3u);
    if (v45 && (CFNumberRef v46 = v45, v47 = CFDataGetTypeID(), CFGetTypeID(v46) == v47))
    {
      int valuePtr = 0;
      v105.length = CFDataGetLength(v46);
      v105.location = 0LL;
      CFDataGetBytes(v46, v105, (UInt8 *)&valuePtr);
      __sprintf_chk((char *)v103, 0, 0x100uLL, "%0.2x%0.2x", BYTE1(valuePtr), valuePtr);
      __strlcat_chk(v104, ".", 256LL, 256LL);
      __strlcat_chk(v104, v103, 256LL, 256LL);
      CFRelease(v46);
    }

    else
    {
      __strlcat_chk(v104, ".", 256LL, 256LL);
      __strlcat_chk(v104, "X", 256LL, 256LL);
    }

    CFRelease(v44);
    uint64_t v40 = CFStringCreateWithFormat(0LL, 0LL, @"device-id");
    CFTypeID v48 = (const __CFNumber *)IORegistryEntrySearchCFProperty(v31, "IOService", v40, 0LL, 3u);
    if (!v48) {
      goto LABEL_79;
    }
    uint64_t v42 = v48;
    CFTypeID v49 = CFDataGetTypeID();
    if (CFGetTypeID(v42) != v49) {
      goto LABEL_79;
    }
    int valuePtr = 0;
    v106.length = CFDataGetLength(v42);
    v106.location = 0LL;
    CFDataGetBytes(v42, v106, (UInt8 *)&valuePtr);
    __sprintf_chk((char *)v102, 0, 0x100uLL, "%0.2x%0.2x");
LABEL_78:
    __strlcat_chk(v104, ".", 256LL, 256LL);
    __strlcat_chk(v104, v102, 256LL, 256LL);
    CFRelease(v42);
LABEL_80:
    CFRelease(v40);
  }

  else if (CFEqual(v35, @"Bluetooth-Modem"))
  {
    __strlcat_chk(v104, "Bluetooth-Modem", 256LL, 256LL);
  }

  if (properties) {
    CFRelease(properties);
  }
LABEL_54:
  int v33 = v104[0];
  *((_OWORD *)a2 + 16) = 0u;
  *((_OWORD *)a2 + 17) = 0u;
  if (v33) {
    uint64_t v34 = v104;
  }
  else {
    uint64_t v34 = "No modem information";
  }
  *((_OWORD *)a2 + 18) = 0uLL;
  *((_OWORD *)a2 + 19) = 0uLL;
  *((_OWORD *)a2 + 20) = 0uLL;
  *((_OWORD *)a2 + 21) = 0uLL;
  *((_OWORD *)a2 + 22) = 0uLL;
  *((_OWORD *)a2 + 23) = 0uLL;
  *((_OWORD *)a2 + 24) = 0uLL;
  *((_OWORD *)a2 + 25) = 0uLL;
  *((_OWORD *)a2 + 26) = 0uLL;
  *((_OWORD *)a2 + 27) = 0uLL;
  *((_OWORD *)a2 + 28) = 0uLL;
  *((_OWORD *)a2 + 29) = 0uLL;
  *((_OWORD *)a2 + 30) = 0uLL;
  *((_OWORD *)a2 + 31) = 0uLL;
  __strlcpy_chk(a2 + 256, v34, 256LL, 256LL);
  CFRelease(v24);
LABEL_58:
  if (v19) {
    goto LABEL_59;
  }
LABEL_60:
  CFRelease(v5);
}

    mach_port_name_t v8 = 0LL;
  }

CFTypeID sub_118E4(const __CFString *a1, const void *a2, uint64_t a3)
{
  CFTypeID result = CFStringHasSuffix(a1, @"Enable");
  if ((_DWORD)result)
  {
    int valuePtr = 0;
    CFTypeID v6 = CFGetTypeID(a2);
    CFTypeID result = CFNumberGetTypeID();
    if (v6 == result)
    {
      CFTypeID result = CFNumberGetValue((CFNumberRef)a2, kCFNumberIntType, &valuePtr);
      if ((_DWORD)result)
      {
        if (valuePtr) {
          *(_WORD *)(a3 + 820) = 49;
        }
      }
    }
  }

  return result;
}

char *sub_11964(uint64_t a1, _DWORD *a2, char *__s)
{
  CFTypeID result = (char *)strlen(__s);
  if (result)
  {
    size_t v7 = (size_t)(result + 1);
    CFTypeID result = (char *)malloc((size_t)(result + 1));
    *(void *)(a1 + 8LL * *a2) = result;
    if (result)
    {
      CFTypeID result = (char *)strlcpy(result, __s, v7);
      ++*a2;
    }
  }

  return result;
}

void sub_119CC(uint64_t a1, __int16 a2, uint64_t a3, unsigned int a4)
{
  int v5 = (_DWORD *)findbyref(0, a4);
  if (!v5) {
    return;
  }
  unint64_t v11 = (unint64_t)v5;
  if ((a2 & 0x7F) != 0) {
    goto LABEL_3;
  }
  int v13 = HIBYTE(a2);
  BOOL v14 = HIBYTE(a2) > 0x19u;
  int v12 = v14;
  if (v14)
  {
    int v13 = 127;
  }

  else if (v5[157] != 1)
  {
LABEL_3:
    int v12 = 1;
    goto LABEL_9;
  }

  v5[158] = v13;
  v5[159] = 0;
  sub_11E28((uint64_t)v5);
LABEL_9:
  ppp_updatephase(v11, 0LL, 0LL, v6, v7, v8, v9, v10);
  *(_DWORD *)(v11 + 396) = 0;
  service_ended(v11);
  *(_DWORD *)(v11 + 600) = -1;
  my_close(*(unsigned int *)(v11 + 596));
  *(_DWORD *)(v11 + 596) = -1;
  my_CFRelease((const void **)(v11 + 128));
  *(void *)(v11 + 128) = 0LL;
  cleanup_dynamicstore(v11);
  uint64_t v15 = *(void *)(v11 + 584);
  if (v15) {
    ne_sm_bridge_acknowledge_sleep(v15);
  }
  else {
    allow_sleep();
  }
  uint64_t v16 = allow_dispose(v11);
  if (!(_DWORD)v16 && !allow_stop(v16, v17, v18, v19, v20, v21, v22, v23))
  {
    int v24 = *(_DWORD *)(v11 + 72);
    if ((v24 & 4) != 0)
    {
      ppp_start(v11, *(CFTypeRef *)(v11 + 640));
      my_CFRelease((const void **)(v11 + 640));
      *(void *)(v11 + 648) = 0LL;
      *(void *)(v11 + 640) = 0LL;
      *(void *)(v11 + 656) = 0LL;
      *(_DWORD *)(v11 + 72) &= ~4u;
    }

    else if (v12 {
           && (*(_DWORD *)(v11 + 72) & 0x38) != 0x20
    }
           && (v24 & 0x10000) != 0
           && ((v24 & 0x20000) == 0 || gLoggedInUser))
    {
      ppp_start(v11, 0LL);
    }

    else
    {
      scnc_bootstrap_dealloc(v11);
      scnc_ausession_dealloc(v11);
    }
  }

void sub_11B7C(int a1, unsigned int a2)
{
  uint64_t v3 = findbyref(0, a2);
  size_t v4 = (_DWORD *)v3;
  if (a1)
  {
    int v11 = 1;
    my_close(*(unsigned int *)(v3 + 592));
    v4[148] = -1;
    my_close(v4[151]);
    v4[151] = -1;
    ioctl(v4[149], 0x8004667EuLL, &v11);
  }

  else
  {
    my_close(*(unsigned int *)(v3 + 596));
    v4[149] = -1;
    my_close(v4[150]);
    v4[150] = -1;
    int v5 = v4[148];
    if (v5) {
      dup2(v5, 0);
    }
    int v6 = v4[151];
    if (v6 != 1) {
      dup2(v6, 1);
    }
    close(2);
    open("/dev/null", 2, 0LL);
    int v7 = getdtablesize();
    if (v7 >= 4)
    {
      unsigned int v8 = v7 + 1;
      do
      {
        close(v8 - 2);
        --v8;
      }

      while (v8 > 4);
    }

    uid_t v9 = geteuid();
    uid_t v10 = v4[22];
    if (v9 != v10) {
      setruid(v10);
    }
    applyEnvironmentVariables((uint64_t)v4);
  }

unint64_t ppp_updatephase( unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = result;
  if (*(_DWORD *)(result + 600) == -1)
  {
    *(_DWORD *)(result + 628) = 0;
    return phase_changed(result, 0LL, a3, a4, a5, a6, a7, a8);
  }

  if (*(_DWORD *)(result + 628) == (_DWORD)a2) {
    return result;
  }
  int v9 = a3;
  *(_DWORD *)(result + 628) = a2;
  CFTypeID result = phase_changed(result, a2, a3, a4, a5, a6, a7, a8);
  int v10 = *(_DWORD *)(v8 + 628);
  if (v10 > 7)
  {
    if (v10 == 8)
    {
      *(_BYTE *)(v8 + 104) = 0;
      CFTypeID result = snprintf((char *)(v8 + 104), 0x10uLL, "ppp%d", v9);
      *(_DWORD *)(v8 + 396) = 1;
      if (!*(_DWORD *)(v8 + 188))
      {
        CFTypeID result = mach_absolute_time();
        *(_DWORD *)(v8 + 188) = (*(double *)&gTimeScaleSeconds * (double)result);
      }

      return result;
    }

    if (v10 != 11) {
      return result;
    }
LABEL_11:
    if ((*(_BYTE *)(v8 + 72) & 0x10) != 0) {
      return scnc_stop(v8, 0LL, 15LL, 0);
    }
    return result;
  }

  if (v10 == 1)
  {
    CFTypeID result = mach_absolute_time();
    *(_DWORD *)(v8 + 184) = (*(double *)&gTimeScaleSeconds * (double)result);
    *(_DWORD *)(v8 + 192) = 0;
    return result;
  }

  if (v10 == 3)
  {
    *(_BYTE *)(v8 + 104) = 0;
    CFTypeID result = (unint64_t)getStringFromEntity( (const __SCDynamicStore *)gDynamicStore,  kSCDynamicStoreDomainState,  *(const __CFString **)(v8 + 24),  kSCEntNetPPP,  kSCPropInterfaceName,  (char *)(v8 + 104),  0x10u);
    goto LABEL_11;
  }

  return result;
}

void sub_11E28(uint64_t a1)
{
  CFMutableDictionaryRef v16 = 0LL;
  *(void *)(a1 + 184) = 0LL;
  int v1 = *(_DWORD *)(a1 + 632);
  if (v1 != 5)
  {
    int v3 = *(_DWORD *)(a1 + 72);
    if ((v3 & 0x440) == 0x40)
    {
      int v4 = v3 & 0x20;
      if (v1 != 21 || v4 == 0)
      {
        uint64_t v6 = *(unsigned int *)(a1 + 636);
        if ((_DWORD)v6)
        {
          if ((_DWORD)v6 == 6 && *(_WORD *)(a1 + 66) == 5) {
            return;
          }
          CFStringRef v7 = CFStringCreateWithFormat(0LL, 0LL, @"%@ Error %d", *(void *)(a1 + 40), v6);
          CFStringRef v17 = v7;
          if (v7) {
            goto LABEL_33;
          }
        }

        if (*(_DWORD *)(a1 + 632) == 5) {
          return;
        }
        CFStringRef v7 = CFStringCreateWithFormat(0LL, 0LL, @"PPP Error %d", *(unsigned int *)(a1 + 632));
        CFStringRef v17 = v7;
        if (v7)
        {
LABEL_33:
          if (CFStringGetLength(v7))
          {
            CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFCopyStringDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
            CFMutableDictionaryRef v16 = Mutable;
            if (Mutable)
            {
              int v9 = Mutable;
              if (gIconURLRef) {
                CFDictionaryAddValue(Mutable, kCFUserNotificationIconURLKey, (const void *)gIconURLRef);
              }
              if (gBundleURLRef) {
                CFDictionaryAddValue(v9, kCFUserNotificationLocalizationURLKey, (const void *)gBundleURLRef);
              }
              CFDictionaryAddValue(v9, kCFUserNotificationAlertMessageKey, v7);
              if (*(_WORD *)(a1 + 66) == 5) {
                int v10 = @"VPN Connection";
              }
              else {
                int v10 = @"Network Connection";
              }
              CFDictionaryAddValue(v9, kCFUserNotificationAlertHeaderKey, v10);
              int v11 = *(__CFUserNotification **)(a1 + 168);
              if (v11)
              {
                SInt32 error = CFUserNotificationUpdate(v11, 0.0, 1uLL, v9);
              }

              else
              {
                int v12 = CFUserNotificationCreate(0LL, 0.0, 1uLL, &error, v9);
                *(void *)(a1 + 168) = v12;
                if (v12)
                {
                  CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource( 0LL,  v12,  (CFUserNotificationCallBack)user_notification_callback,  0LL);
                  *(void *)(a1 + 176) = RunLoopSource;
                  if (RunLoopSource)
                  {
                    Current = CFRunLoopGetCurrent();
                    CFRunLoopAddSource(Current, *(CFRunLoopSourceRef *)(a1 + 176), kCFRunLoopDefaultMode);
                  }

                  else
                  {
                    my_CFRelease((const void **)(a1 + 168));
                  }
                }
              }
            }
          }
        }

        my_CFRelease((const void **)&v16);
        my_CFRelease((const void **)&v17);
      }
    }
  }

uint64_t ppp_stop(_DWORD *a1, int a2)
{
  int v3 = a1[18];
  if ((v3 & 0x18) != 0) {
    a2 = 15;
  }
  uint64_t v5 = 10LL;
  switch(a1[157])
  {
    case 0:
      return 0LL;
    case 1:
      a1[18] = v3 & 0xFFFFFFFB;
      goto LABEL_9;
    case 2:
      goto LABEL_9;
    case 3:
    case 0xB:
      if (a2 == 1) {
        return 0LL;
      }
      goto LABEL_10;
    case 9:
    case 0xA:
      goto LABEL_10;
    default:
      uint64_t v5 = 9LL;
LABEL_9:
      ppp_updatephase(a1, v5, 0LL);
LABEL_10:
      int v6 = a1[149];
      if (v6 == -1) {
        goto LABEL_14;
      }
      if (a2 == 1)
      {
        CFStringRef v7 = "[DISCONNECT]";
      }

      else
      {
        if (a2 != 15)
        {
LABEL_14:
          kill(a1[152], a2);
          return 0LL;
        }

        CFStringRef v7 = "[TERMINATE]";
      }

      sub_10A98(v6, v7);
      return 0LL;
  }

uint64_t ppp_suspend(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 628)) {
    kill(*(_DWORD *)(a1 + 608), 18);
  }
  return 0LL;
}

uint64_t ppp_resume(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 628)) {
    kill(*(_DWORD *)(a1 + 608), 19);
  }
  return 0LL;
}

void ppp_updatestatus(uint64_t a1, int a2, int a3)
{
  *(_DWORD *)(a1 + 632) = a2;
  *(_DWORD *)(a1 + 636) = a3;
  sub_11E28(a1);
}

BOOL ppp_is_pid(uint64_t a1, int a2)
{
  return *(_DWORD *)(a1 + 608) == a2;
}

uint64_t ppp_getstatus(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 628) - 1;
  else {
    return dword_2ECCC[v1];
  }
}

uint64_t ppp_getstatus1(uint64_t a1, vm_address_t *a2, _WORD *a3)
{
  vm_address_t v6 = my_Allocate(36);
  *a2 = v6;
  if (!v6) {
    return 12LL;
  }
  CFStringRef v7 = (_DWORD *)v6;
  *(_DWORD *)(v6 + 32) = 0;
  *(_OWORD *)vm_address_t v6 = 0u;
  *(_OWORD *)(v6 + 16) = 0u;
  int v8 = *(_DWORD *)(a1 + 628);
  if ((v8 | 8) == 0xB)
  {
    *(_DWORD *)vm_address_t v6 = 0;
LABEL_4:
    *(_DWORD *)(v6 + 4) = ppp_translate_error( *(unsigned __int16 *)(a1 + 66),  *(_DWORD *)(a1 + 632),  *(_DWORD *)(a1 + 636));
LABEL_5:
    uint64_t result = 0LL;
    *a3 = 36;
    return result;
  }

  *(_DWORD *)vm_address_t v6 = v8;
  if (v8 != 8)
  {
    if (v8 == 13)
    {
      *(_DWORD *)(v6 + 4) = 0;
      *(_DWORD *)__dst = 0;
      getNumberFromEntity( (const __SCDynamicStore *)gDynamicStore,  kSCDynamicStoreDomainState,  *(const __CFString **)(a1 + 24),  kSCEntNetPPP,  kSCPropNetPPPRetryConnectTime,  __dst);
      if (*(_DWORD *)__dst)
      {
        double v18 = *(double *)&gTimeScaleSeconds * (double)mach_absolute_time();
        unsigned int v19 = *(_DWORD *)__dst - v18;
        v7[1] = v19;
      }

      goto LABEL_5;
    }

    if (v8 != 12) {
      goto LABEL_4;
    }
  }

  int v10 = socket(2, 2, 0);
  if ((v10 & 0x80000000) == 0)
  {
    int v11 = v10;
    memset(v26, 0, sizeof(v26));
    __int128 v25 = 0u;
    __int128 v24 = 0u;
    __int128 v23 = 0u;
    strncpy(__dst, (const char *)(a1 + 104), 0x10uLL);
    int v12 = ioctl(v11, 0xC05C697BuLL, __dst);
    close(v11);
    if ((v12 & 0x80000000) == 0)
    {
      int v21 = 0;
      getNumberFromEntity( (const __SCDynamicStore *)gDynamicStore,  kSCDynamicStoreDomainState,  *(const __CFString **)(a1 + 24),  kSCEntNetPPP,  kSCPropNetPPPConnectTime,  &v21);
      unsigned int v20 = 0;
      getNumberFromEntity( (const __SCDynamicStore *)gDynamicStore,  kSCDynamicStoreDomainState,  *(const __CFString **)(a1 + 24),  kSCEntNetPPP,  kSCPropNetPPPDisconnectTime,  &v20);
      unsigned int v13 = (*(double *)&gTimeScaleSeconds * (double)mach_absolute_time());
      if (v21) {
        v7[1] = v13 - v21;
      }
      BOOL v14 = v20 >= v13;
      int v15 = v20 - v13;
      if (!v14) {
        int v15 = 0;
      }
      if (!v20) {
        int v15 = -1;
      }
      v7[2] = v15;
      int v16 = DWORD1(v23);
      v7[6] = DWORD2(v24);
      v7[3] = v16;
      v7[4] = HIDWORD(v23);
      v7[7] = v25;
      int v17 = v24;
      v7[5] = v24;
      v7[8] = v17;
      goto LABEL_5;
    }
  }

  my_Deallocate(*a2, 36);
  return *__error();
}

uint64_t ppp_translate_error(int a1, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x14)
  {
    uint64_t result = 256LL;
    if (a1) {
      return result;
    }
  }

  else
  {
    uint64_t result = dword_2EC54[a2];
    if (a1) {
      return result;
    }
  }

  if (a3)
  {
    if (a3 > 9) {
      return 257LL;
    }
    else {
      return dword_2ECA8[a3 - 1];
    }
  }

  return result;
}

uint64_t ppp_copyextendedstatus(uint64_t a1, void *a2)
{
  CFStringRef value = 0LL;
  *a2 = 0LL;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFMutableDictionaryRef v36 = Mutable;
  if (!Mutable) {
    goto LABEL_44;
  }
  uint64_t v5 = Mutable;
  CFMutableDictionaryRef v6 = CFDictionaryCreateMutable(0LL, 0LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFStringRef value = v6;
  if (!v6) {
    goto LABEL_44;
  }
  CFStringRef v7 = v6;
  AddNumber(v6, kSCPropNetPPPStatus, *(_DWORD *)(a1 + 628));
  if (!*(_DWORD *)(a1 + 628)) {
    goto LABEL_7;
  }
  AddStringFromState( (const __SCDynamicStore *)gDynamicStore,  *(const __CFString **)(a1 + 24),  kSCEntNetPPP,  kSCPropNetPPPCommRemoteAddress,  v7);
  int v8 = *(_DWORD *)(a1 + 628);
  if (v8 <= 11)
  {
    if (v8 == 3) {
      goto LABEL_17;
    }
    if (v8 != 8) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }

  if (v8 != 13)
  {
    if (v8 == 12)
    {
LABEL_10:
      uint64_t v9 = *(void *)(a1 + 584);
      if (v9)
      {
        uint64_t connect_time = ne_sm_bridge_get_connect_time(v9);
        AddNumber64(v7, kSCPropNetPPPConnectTime, connect_time);
      }

      else
      {
        AddNumberFromState( (const __SCDynamicStore *)gDynamicStore,  *(const __CFString **)(a1 + 24),  kSCEntNetPPP,  kSCPropNetPPPConnectTime,  v7);
      }

      AddNumberFromState( (const __SCDynamicStore *)gDynamicStore,  *(const __CFString **)(a1 + 24),  kSCEntNetPPP,  kSCPropNetPPPDisconnectTime,  v7);
      AddNumberFromState( (const __SCDynamicStore *)gDynamicStore,  *(const __CFString **)(a1 + 24),  kSCEntNetPPP,  kSCPropNetPPPLCPCompressionPField,  v7);
      AddNumberFromState( (const __SCDynamicStore *)gDynamicStore,  *(const __CFString **)(a1 + 24),  kSCEntNetPPP,  kSCPropNetPPPLCPCompressionACField,  v7);
      AddNumberFromState( (const __SCDynamicStore *)gDynamicStore,  *(const __CFString **)(a1 + 24),  kSCEntNetPPP,  kSCPropNetPPPLCPMRU,  v7);
      AddNumberFromState( (const __SCDynamicStore *)gDynamicStore,  *(const __CFString **)(a1 + 24),  kSCEntNetPPP,  kSCPropNetPPPLCPMTU,  v7);
      AddNumberFromState( (const __SCDynamicStore *)gDynamicStore,  *(const __CFString **)(a1 + 24),  kSCEntNetPPP,  kSCPropNetPPPLCPReceiveACCM,  v7);
      AddNumberFromState( (const __SCDynamicStore *)gDynamicStore,  *(const __CFString **)(a1 + 24),  kSCEntNetPPP,  kSCPropNetPPPLCPTransmitACCM,  v7);
      unsigned int v13 = (const __SCDynamicStore *)gDynamicStore;
      BOOL v14 = *(const __CFString **)(a1 + 24);
      int v15 = (const void **)&kSCPropNetPPPIPCPCompressionVJ;
      goto LABEL_16;
    }

LABEL_44:
    uint64_t v31 = 12LL;
    goto LABEL_45;
  }

LABEL_18:
  int v16 = *(_DWORD *)(a1 + 628);
LABEL_19:
  if ((v16 | 4) == 0xC)
  {
    int v17 = (void *)copyEntity( (const __SCDynamicStore *)gDynamicStore,  kSCDynamicStoreDomainState,  *(const __CFString **)(a1 + 24),  kSCEntNetIPv4);
    CFStringRef value = v17;
    if (v17)
    {
      CFDictionaryAddValue(v5, kSCEntNetIPv4, v17);
      my_CFRelease((const void **)&value);
    }

    CFPropertyListRef v18 = copyEntity( (const __SCDynamicStore *)gDynamicStore,  kSCDynamicStoreDomainState,  *(const __CFString **)(a1 + 24),  kSCEntNetDNS);
    uint64_t v34 = v18;
    if (v18)
    {
      unsigned int v19 = (const __CFDictionary *)v18;
      unsigned int v20 = CFDictionaryGetValue((CFDictionaryRef)v18, kSCPropNetDNSServerAddresses);
      CFTypeID TypeID = CFArrayGetTypeID();
      if (v20 && CFGetTypeID(v20) == TypeID) {
        CFDictionarySetValue(v5, @"DNSServers", v20);
      }
      uint64_t v22 = CFDictionaryGetValue(v19, kSCPropNetDNSDomainName);
      CFTypeID v23 = CFStringGetTypeID();
      if (v22 && CFGetTypeID(v22) == v23) {
        CFDictionarySetValue(v5, @"DNSDomain", v22);
      }
      __int128 v24 = CFDictionaryGetValue(v19, kSCPropNetDNSSearchDomains);
      CFTypeID v25 = CFArrayGetTypeID();
      if (v24 && CFGetTypeID(v24) == v25) {
        CFDictionarySetValue(v5, @"DNSSearchDomains", v24);
      }
      pid_t v26 = CFDictionaryGetValue(v19, kSCPropNetDNSSupplementalMatchDomains);
      CFTypeID v27 = CFArrayGetTypeID();
      if (v26 && CFGetTypeID(v26) == v27) {
        CFDictionarySetValue(v5, @"DNSSupplementalMatchDomains", v26);
      }
      my_CFRelease(&v34);
    }

    int v16 = *(_DWORD *)(a1 + 628);
  }

  unsigned int v28 = v16 - 1;
  if (v28 > 0xD) {
    int v29 = 0;
  }
  else {
    int v29 = dword_2ECCC[v28];
  }
  AddNumber(v5, @"Status", v29);
  CFTypeRef v30 = CFRetain(v5);
  uint64_t v31 = 0LL;
  *a2 = v30;
LABEL_45:
  my_CFRelease((const void **)&value);
  my_CFRelease((const void **)&v36);
  return v31;
}

  *((_DWORD *)a2 + 4) = 0;
}

uint64_t ppp_copystatistics(uint64_t a1, void *a2)
{
  CFMutableDictionaryRef v12 = 0LL;
  *a2 = 0LL;
  if ((*(_DWORD *)(a1 + 628) | 4) != 0xC) {
    return 22LL;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFMutableDictionaryRef v13 = Mutable;
  if (Mutable
    && (uint64_t v5 = Mutable,
        CFMutableDictionaryRef v6 = CFDictionaryCreateMutable(0LL, 0LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks),
        (CFMutableDictionaryRef v12 = v6) != 0LL))
  {
    CFStringRef v7 = v6;
    int v8 = socket(2, 2, 0);
    if (v8 < 0
      || (memset(v18, 0, sizeof(v18)),
          __int128 v17 = 0u,
          __int128 v16 = 0u,
          __int128 v15 = 0u,
          strncpy(__dst, (const char *)(a1 + 104), 0x10uLL),
          ioctl(v8, 0xC05C697BuLL, __dst, v12, v13) < 0))
    {
      uint64_t v10 = *__error();
    }

    else
    {
      AddNumber(v7, @"BytesIn", SDWORD1(v15));
      AddNumber(v7, @"BytesOut", SDWORD2(v16));
      AddNumber(v7, @"PacketsIn", SHIDWORD(v15));
      AddNumber(v7, @"PacketsOut", v17);
      AddNumber(v7, @"ErrorsIn", v16);
      AddNumber(v7, @"ErrorsOut", v16);
      CFDictionaryAddValue(v5, kSCEntNetPPP, v7);
      CFTypeRef v9 = CFRetain(v5);
      uint64_t v10 = 0LL;
      *a2 = v9;
    }
  }

  else
  {
    uint64_t v10 = 12LL;
    int v8 = -1;
  }

  my_CFRelease((const void **)&v12);
  my_CFRelease((const void **)&v13);
  if (v8 != -1) {
    close(v8);
  }
  return v10;
}

uint64_t ppp_getconnectsystemdata(uint64_t a1, void *a2, _WORD *a3)
{
  uint64_t v5 = copyService((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainSetup, *(const __CFString **)(a1 + 24));
  if (v5)
  {
    CFMutableDictionaryRef v6 = v5;
    CFStringRef v7 = Serialize(v5, (const UInt8 **)&__len[1], __len);
    if (v7)
    {
      int v8 = v7;
      CFTypeRef v9 = (void *)my_Allocate(__len[0]);
      *a2 = v9;
      if (v9)
      {
        memmove(v9, *(const void **)&__len[1], __len[0]);
        uint64_t v10 = 0LL;
        *a3 = __len[0];
      }

      else
      {
        uint64_t v10 = 12LL;
      }

      CFRelease(v6);
      CFRelease(v8);
    }

    else
    {
      CFRelease(v6);
      return 12LL;
    }
  }

  else
  {
    uint64_t v10 = 0LL;
    *a3 = 0;
  }

  return v10;
}

uint64_t ppp_getconnectdata(uint64_t a1, CFTypeRef *a2, int a3)
{
  *a2 = 0LL;
  int v3 = *(const __CFDictionary **)(a1 + 128);
  if (v3)
  {
    if (a3)
    {
      *a2 = CFRetain(*(CFTypeRef *)(a1 + 128));
    }

    else
    {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, v3);
      if (MutableCopy)
      {
        CFMutableDictionaryRef v6 = MutableCopy;
        CFPropertyListRef Value = (const __CFDictionary *)CFDictionaryGetValue(MutableCopy, kSCEntNetPPP);
        if (Value)
        {
          int v8 = Value;
          CFTypeID v9 = CFGetTypeID(Value);
          if (v9 == CFDictionaryGetTypeID())
          {
            uint64_t v10 = CFDictionaryCreateMutableCopy(0LL, 0LL, v8);
            if (v10)
            {
              uint64_t v11 = v10;
              CFDictionaryRemoveValue(v10, kSCPropNetPPPAuthPassword);
              CFDictionarySetValue(v6, kSCEntNetPPP, v11);
              CFRelease(v11);
            }
          }
        }

        CFMutableDictionaryRef v12 = (const __CFDictionary *)CFDictionaryGetValue(v6, kSCEntNetL2TP);
        if (v12)
        {
          CFMutableDictionaryRef v13 = v12;
          CFTypeID v14 = CFGetTypeID(v12);
          if (v14 == CFDictionaryGetTypeID())
          {
            __int128 v15 = CFDictionaryCreateMutableCopy(0LL, 0LL, v13);
            if (v15)
            {
              __int128 v16 = v15;
              CFDictionaryRemoveValue(v15, kSCPropNetL2TPIPSecSharedSecret);
              CFDictionarySetValue(v6, kSCEntNetL2TP, v16);
              CFRelease(v16);
            }
          }
        }

        __int128 v17 = (const __CFDictionary *)CFDictionaryGetValue(v6, kSCEntNetIPSec);
        if (v17)
        {
          CFPropertyListRef v18 = v17;
          CFTypeID v19 = CFGetTypeID(v17);
          if (v19 == CFDictionaryGetTypeID())
          {
            unsigned int v20 = CFDictionaryCreateMutableCopy(0LL, 0LL, v18);
            if (v20)
            {
              int v21 = v20;
              CFDictionaryRemoveValue(v20, kSCPropNetIPSecSharedSecret);
              CFDictionarySetValue(v6, kSCEntNetIPSec, v21);
              CFRelease(v21);
            }
          }
        }

        *a2 = CFRetain(v6);
        CFRelease(v6);
      }
    }
  }

  return 0LL;
}

ssize_t sub_12EF0(int a1, char *a2, int a3)
{
  return sub_10A98(a1, __str);
}

ssize_t sub_12F6C(int a1, char *__s, char *a3)
{
  size_t v6 = strlen(__s);
  write(a1, __s, v6);
  write(a1, " ", 2uLL);
  char v7 = *a3;
  if (*a3)
  {
    do
    {
      if (v7 == 92 || v7 == 34) {
        write(a1, "\\"", 1uLL);
      }
      write(a1, a3, 1uLL);
      int v8 = *++a3;
      char v7 = v8;
    }

    while (v8);
  }

  return write(a1, " ", 2uLL);
}

ssize_t sub_13024(int a1, const void *a2, int a3)
{
  return write(a1, " ", 1uLL);
}

uint64_t terminate_all()
{
  int v8 = (void *)service_head;
  if (service_head)
  {
    do
    {
      uint64_t v0 = scnc_stop((uint64_t)v8, 0LL, 15LL, 11);
      int v8 = (void *)*v8;
    }

    while (v8);
  }

  return allow_stop(v0, v1, v2, v3, v4, v5, v6, v7);
}

uint64_t scnc_stop(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (!a2)
  {
    pid_t v7 = 0;
    goto LABEL_17;
  }

  pid_t v7 = *(_DWORD *)(a2 + 72);
  if (a4 == 6 || a4 == 10)
  {
LABEL_17:
    while (1)
    {
      __int128 v15 = *(uint64_t **)(a1 + 568);
      if (!v15) {
        break;
      }
      uint64_t v13 = *v15;
      CFTypeID v14 = (void *)v15[1];
      if (*v15)
      {
        *(void *)(v13 + 8) = v14;
        CFTypeID v14 = (void *)v15[1];
      }

      else
      {
        *(void *)(a1 + 576) = v14;
      }

      *CFTypeID v14 = v13;
      free(v15);
    }

    goto LABEL_18;
  }

  int v8 = (void *)(a1 + 568);
  CFTypeID v9 = (void *)(a1 + 568);
  while (1)
  {
    CFTypeID v9 = (void *)*v9;
    if (!v9) {
      break;
    }
    if (v9[2] == a2)
    {
      uint64_t v10 = (void *)(a1 + 568);
      while (1)
      {
        uint64_t v10 = (void *)*v10;
        if (!v10) {
          goto LABEL_39;
        }
        if (v10[2] == a2)
        {
          uint64_t v11 = (void *)*v10;
          CFMutableDictionaryRef v12 = (void *)v10[1];
          if (*v10)
          {
            v11[1] = v12;
            CFMutableDictionaryRef v12 = (void *)v10[1];
          }

          else
          {
            *(void *)(a1 + 576) = v12;
          }

          *CFMutableDictionaryRef v12 = v11;
          free(v10);
          goto LABEL_39;
        }
      }
    }
  }

LABEL_39:
  if (*v8) {
    return 0LL;
  }
LABEL_18:
  if (!scnc_get_reason_str(a4)) {
    goto LABEL_44;
  }
  if (!v7) {
    pid_t v7 = getpid();
  }
  sub_170A4(v7, __str);
  int v22 = *(unsigned __int16 *)(a1 + 64);
  if (!*(_WORD *)(a1 + 64))
  {
    __int128 v24 = ppp_error_to_string(*(_DWORD *)(a1 + 632));
    CFTypeID v25 = ppp_dev_error_to_string(*(unsigned __int16 *)(a1 + 66), *(_DWORD *)(a1 + 636));
    if (v24 && v25)
    {
      CFTypeID v23 = @"SCNC: stop%s, type %@, reason %s, status %s.%s";
      goto LABEL_43;
    }

    if (v24)
    {
      CFTypeID v23 = @"SCNC: stop%s, type %@, reason %s, status %s.(%d)";
      goto LABEL_43;
    }

    if (v25)
    {
      CFTypeID v23 = @"SCNC: stop%s, type %@, reason %s, status (%d).%s";
      goto LABEL_43;
    }

    if (*(void *)(a1 + 632))
    {
      CFTypeID v23 = @"SCNC: stop%s, type %@, reason %s, status (%d.%d)";
      goto LABEL_43;
    }

uint64_t allow_stop( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!gStopRls) {
    return 0LL;
  }
  int v8 = &service_head;
  while (1)
  {
    int v8 = (uint64_t *)*v8;
    if (!v8) {
      break;
    }
    if (*((_WORD *)v8 + 32) == 1)
    {
      int v9 = ipsec_getstatus((uint64_t)v8, a2, a3, a4, a5, a6, a7, a8);
    }

    else
    {
      if (*((_WORD *)v8 + 32)) {
        return 0LL;
      }
      int v9 = ppp_getstatus((uint64_t)v8);
    }

    if (v9) {
      return 0LL;
    }
  }

  CFRunLoopSourceSignal((CFRunLoopSourceRef)gStopRls);
  if (gPluginRunloop) {
    CFRunLoopWakeUp((CFRunLoopRef)gPluginRunloop);
  }
  return 1LL;
}

uint64_t pppcntl_run_thread()
{
  if (ppp_mach_start_server()
    || ppp_mach_start_server_priv()
    || ppp_socket_start_server()
    || client_init_all())
  {
    pthread_exit((char *)&dword_0 + 1);
  }

  CFStringRef v57 = 0LL;
  CFStringRef v58 = 0LL;
  CFMutableArrayRef v55 = 0LL;
  __int128 v56 = 0LL;
  CFArrayRef v53 = 0LL;
  CFMutableArrayRef v54 = 0LL;
  CFRunLoopSourceRef source = 0LL;
  thePortRef[1] = (IONotificationPortRef)kSCEntNetPPP;
  v61[0] = kSCEntNetModem;
  v61[1] = kSCEntNetInterface;
  v61[2] = kSCEntNetIPv4;
  v61[3] = kSCEntNetIPv6;
  v61[4] = kSCEntNetDNS;
  uint64_t v0 = kSCEntNetVPN;
  v61[5] = kSCEntNetIPSec;
  v61[6] = kSCEntNetVPN;
  v61[7] = @"com.apple.payload";
  v61[8] = 0LL;
  scnc_init_resources((__CFBundle *)gBundleRef);
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  reachability_init((uint64_t)Current, (uint64_t)kCFRunLoopDefaultMode, (uint64_t)&stru_393C0);
  sub_150B0(0LL);
  gSleeping = 0;
  gStopRls = 0LL;
  gIOPort = IORegisterForSystemPower(0LL, thePortRef, (IOServiceInterestCallback)sub_16368, &notifier);
  if (!gIOPort)
  {
    uint64_t v6 = @"SCNC Controller: IORegisterForSystemPower failed";
    goto LABEL_9;
  }

  uint64_t v2 = CFRunLoopGetCurrent();
  CFRunLoopSourceRef RunLoopSource = IONotificationPortGetRunLoopSource(thePortRef[0]);
  CFRunLoopAddSource(v2, RunLoopSource, kCFRunLoopDefaultMode);
  if (mach_timebase_info(&info))
  {
    uint64_t v6 = @"SCNC Controller: mach_timebase_info failed";
LABEL_9:
    SCLog(1LL, 3LL, v6);
    goto LABEL_10;
  }

  LODWORD(v4) = info.numer;
  LODWORD(v5) = info.denom;
  *(double *)&gTimeScaleSeconds = (double)v4 / (double)v5 / 1000000000.0;
  int v8 = SCDynamicStoreCreate(0LL, @"SCNCController", (SCDynamicStoreCallBack)sub_16560, 0LL);
  gDynamicStore = (uint64_t)v8;
  if (!v8) {
    goto LABEL_10;
  }
  int v9 = SCDynamicStoreCreateRunLoopSource(0LL, v8, 0LL);
  CFRunLoopSourceRef source = v9;
  if (!v9) {
    goto LABEL_10;
  }
  uint64_t v10 = v9;
  uint64_t v11 = CFRunLoopGetCurrent();
  CFRunLoopAddSource(v11, v10, kCFRunLoopDefaultMode);
  my_CFRelease((const void **)&source);
  NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0LL, kSCDynamicStoreDomainState, kSCEntNetOnDemand);
  gOndemand_key = (uint64_t)NetworkGlobalEntity;
  if (NetworkGlobalEntity) {
    SCDynamicStoreRemoveValue((SCDynamicStoreRef)gDynamicStore, NetworkGlobalEntity);
  }
  ipsec_init_things();
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  CFMutableArrayRef v55 = Mutable;
  CFMutableArrayRef v14 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  CFMutableArrayRef v54 = v14;
  theArray = Mutable;
  if (!Mutable) {
    goto LABEL_10;
  }
  __int128 v15 = v14;
  if (!v14) {
    goto LABEL_10;
  }
  if (kSCEntNetPPP)
  {
    uint64_t v16 = (const __CFString **)v61;
    uint64_t v17 = kSCEntNetPPP;
    do
    {
      CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( 0LL,  kSCDynamicStoreDomainSetup,  kSCCompAnyRegex,  v17);
      CFStringRef v58 = NetworkServiceEntity;
      if (!NetworkServiceEntity) {
        goto LABEL_10;
      }
      CFStringRef v19 = NetworkServiceEntity;
      CFArrayAppendValue(v15, NetworkServiceEntity);
      CFRelease(v19);
      uint64_t v20 = *v16++;
      uint64_t v17 = v20;
    }

    while (v20);
  }

  CFStringRef v21 = SCDynamicStoreKeyCreateNetworkGlobalEntity(0LL, kSCDynamicStoreDomainSetup, kSCEntNetIPv4);
  CFStringRef v58 = v21;
  if (!v21) {
    goto LABEL_10;
  }
  CFStringRef v22 = v21;
  CFArrayAppendValue(theArray, v21);
  CFRelease(v22);
  CFStringRef v23 = SCDynamicStoreKeyCreateNetworkGlobalEntity(0LL, kSCDynamicStoreDomainState, kSCEntNetIPv4);
  CFStringRef v58 = v23;
  if (!v23) {
    goto LABEL_10;
  }
  CFStringRef v24 = v23;
  CFArrayAppendValue(theArray, v23);
  CFRelease(v24);
  CFStringRef v25 = SCDynamicStoreKeyCreateNetworkGlobalEntity(0LL, kSCDynamicStoreDomainState, kSCEntNetDNS);
  CFStringRef v58 = v25;
  if (!v25) {
    goto LABEL_10;
  }
  CFStringRef v26 = v25;
  CFArrayAppendValue(theArray, v25);
  CFRelease(v26);
  CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity( 0LL,  kSCDynamicStoreDomainState,  kSCCompAnyRegex,  kSCEntNetAirPort);
  CFArrayAppendValue(v15, NetworkInterfaceEntity);
  CFRelease(NetworkInterfaceEntity);
  uint64_t v28 = SCDynamicStoreSetNotificationKeys((SCDynamicStoreRef)gDynamicStore, theArray, v15);
  int out_token = 0;
  mach_port_t notify_port = 0;
  notify_key = (const char *)nwi_state_get_notify_key(v28);
  uint64_t v30 = notify_register_mach_port(notify_key, &notify_port, 0, &out_token);
  if (!(_DWORD)v30)
  {
    uint64_t v48 = 0LL;
    memset(v47, 0, sizeof(v47));
    uint64_t v31 = nwi_state_get_notify_key(v30);
    CFMutableDictionaryRef v32 = (void *)_SC_CFMachPortCreateWithPort(v31, notify_port, sub_16A0C, v47);
    CFNumberRef v46 = v32;
    if (v32)
    {
      CFRunLoopSourceRef source = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, (CFMachPortRef)v32, 0LL);
      if (source)
      {
        int v33 = CFRunLoopGetCurrent();
        CFRunLoopAddSource(v33, source, kCFRunLoopCommonModes);
        my_CFRelease((const void **)&source);
      }

      else
      {
        notify_cancel(out_token);
      }

      my_CFRelease(&v46);
    }

    else
    {
      notify_cancel(out_token);
    }
  }

  service_head = 0LL;
  qword_436E8 = (uint64_t)&service_head;
  controller_options_modify_ondemand();
  __int128 v56 = CFStringCreateWithFormat(0LL, 0LL, @"(%@|%@|%@)", kSCEntNetPPP, kSCEntNetIPSec, v0);
  CFStringRef v34 = SCDynamicStoreKeyCreateNetworkServiceEntity(0LL, kSCDynamicStoreDomainSetup, kSCCompAnyRegex, v56);
  CFStringRef v58 = v34;
  CFStringRef v35 = SCDynamicStoreKeyCreate(0LL, @"%@/%@/%@/", kSCDynamicStoreDomainSetup, kSCCompNetwork, kSCCompService);
  CFStringRef v57 = v35;
  if (!v34 || (CFMutableDictionaryRef v36 = v35) == 0LL)
  {
LABEL_10:
    my_CFRelease((const void **)&gDynamicStore);
    goto LABEL_11;
  }

  CFArrayRef v37 = SCDynamicStoreCopyKeyList((SCDynamicStoreRef)gDynamicStore, v34);
  CFArrayRef v53 = v37;
  if (v37)
  {
    uint64_t v38 = v37;
    int Count = CFArrayGetCount(v37);
    if (Count >= 1)
    {
      CFIndex v40 = 0LL;
      uint64_t v41 = Count;
      do
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v38, v40);
        CFTypeID v43 = parse_component(ValueAtIndex, v36);
        if (v43)
        {
          int v44 = v43;
          sub_16A5C(v43);
          CFRelease(v44);
        }

        ++v40;
      }

      while (v41 != v40);
    }

    sub_16D64();
    sub_14EA0();
    if (gSCNCVerbose) {
      sub_16E34();
    }
  }

void load(const void *a1, int a2)
{
  *(_OWORD *)&v3.cancel = unk_39390;
  memset(&v3, 0, 64);
  gBundleRef = (uint64_t)a1;
  gSCNCVerbose = _sc_verbose | a2;
  gSCNCDebug = a2;
  gPluginRunloop = (uint64_t)CFRunLoopGetCurrent();
  gTerminalrls = (uint64_t)CFRunLoopSourceCreate(0LL, 0LL, &v3);
  if (gTerminalrls)
  {
    pthread_attr_init(&v5);
    pthread_attr_setdetachstate(&v5, 2);
    if (pthread_create(&v4, &v5, (void *(__cdecl *)(void *))pppcntl_run_thread, 0LL))
    {
      CFRelease((CFTypeRef)gTerminalrls);
      gTerminalrls = 0LL;
    }

    else
    {
      pthread_attr_destroy(&v5);
      CFRetain(a1);
    }
  }

  else
  {
    SCLog(1LL, 3LL, @"SCNC Controller: cannot create signal gTerminalrls in load");
  }

void stop(uint64_t a1)
{
  if (gOndemand_key) {
    SCDynamicStoreRemoveValue((SCDynamicStoreRef)gDynamicStore, (CFStringRef)gOndemand_key);
  }
  if (!gStopRls)
  {
    gStopRls = a1;
    if (gTerminalrls) {
      CFRunLoopSourceSignal((CFRunLoopSourceRef)gTerminalrls);
    }
    if (gControllerRunloop) {
      CFRunLoopWakeUp((CFRunLoopRef)gControllerRunloop);
    }
  }

uint64_t allow_dispose(uint64_t a1)
{
  if (*(void *)(a1 + 584))
  {
    ne_sm_bridge_allow_dispose(*(void *)(a1 + 584));
  }

  else
  {
    if ((*(_BYTE *)(a1 + 72) & 2) == 0) {
      return 0LL;
    }
    sub_13C24((unsigned __int16 *)a1);
  }

  return 1LL;
}

void sub_13C24(unsigned __int16 *a1)
{
  if (a1[32])
  {
    if (a1[32] != 1)
    {
      *((_DWORD *)a1 + 18) &= ~2u;
LABEL_25:
      my_CFRelease((const void **)a1 + 18);
      unsigned int v3 = *((_DWORD *)a1 + 18);
      if ((v3 & 0x200000) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }

    if (ipsec_dispose_service((uint64_t)a1))
    {
LABEL_4:
      *((_DWORD *)a1 + 18) |= 2u;
      return;
    }
  }

  else if (ppp_dispose_service((uint64_t)a1))
  {
    goto LABEL_4;
  }

  int v2 = a1[32];
  unsigned int v3 = *((_DWORD *)a1 + 18) & 0xFFFFFFFD;
  *((_DWORD *)a1 + 18) = v3;
  if (v2 != 1) {
    goto LABEL_25;
  }
  if ((v3 & 0x200000) != 0)
  {
LABEL_8:
    *((_DWORD *)a1 + 18) = v3 & 0xFFDFFFFF;
    sub_16F2C((uint64_t)a1);
  }

void scnc_init_resources(__CFBundle *a1)
{
  gBundleURLRef = (uint64_t)CFBundleCopyBundleURL(a1);
  int v2 = CFURLCopyAbsoluteURL((CFURLRef)gBundleURLRef);
  if (v2)
  {
    unsigned int v3 = v2;
    gBundleDir = (uint64_t)CFURLCopyPath(v2);
    CFRelease(v3);
  }

  pthread_t v4 = CFBundleCopyBuiltInPlugInsURL(a1);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = CFURLCopyAbsoluteURL(v4);
    if (v6)
    {
      pid_t v7 = v6;
      gPluginsDir = (uint64_t)CFURLCopyPath(v6);
      CFRelease(v7);
    }

    CFRelease(v5);
  }

  int v8 = CFBundleCopyResourcesDirectoryURL(a1);
  if (v8)
  {
    mach_port_name_t v9 = v8;
    mach_port_name_t v10 = CFURLCopyAbsoluteURL(v8);
    if (v10)
    {
      uint64_t v11 = v10;
      gResourcesDir = (uint64_t)CFURLCopyPath(v10);
      CFRelease(v11);
    }

    CFRelease(v9);
  }

  CFMutableDictionaryRef v12 = CFBundleCopyResourceURL(a1, @"NetworkConnect.icns", 0LL, 0LL);
  gIconURLRef = (uint64_t)v12;
  if (v12)
  {
    uint64_t v13 = CFURLCopyAbsoluteURL(v12);
    if (v13)
    {
      CFMutableArrayRef v14 = v13;
      gIconDir = (uint64_t)CFURLCopyPath(v13);
      CFRelease(v14);
    }
  }

  __int128 v15 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (v15)
  {
    uint64_t v16 = v15;
    CFPropertyListRef Value = (const __CFString *)CFDictionaryGetValue(v15, _kCFSystemVersionProductNameKey);
    uint64_t v18 = (const __CFString *)CFDictionaryGetValue(v16, _kCFSystemVersionProductVersionKey);
    if (Value)
    {
      CFStringRef v19 = v18;
      if (v18)
      {
        CFMutableArrayRef Mutable = CFStringCreateMutable(0LL, 0LL);
        if (Mutable)
        {
          CFStringRef v21 = Mutable;
          CFStringAppend(Mutable, @"Cisco Systems VPN Client ");
          CFStringAppend(v21, v19);
          CFStringAppend(v21, @":");
          CFStringAppend(v21, Value);
          CFIndex v22 = CFStringGetLength(v21) + 1;
          CFStringRef v23 = (char *)malloc(v22);
          gIPSecAppVersion = (uint64_t)v23;
          if (v23) {
            CFStringGetCString(v21, v23, v22, 0x8000100u);
          }
          CFRelease(v21);
        }
      }
    }

    CFRelease(v16);
  }

void do_network_signature_changed()
{
  CFStringRef v10 = 0LL;
  uint64_t v11 = 0LL;
  mach_port_name_t v9 = 0LL;
  if (!controller_options_is_onDemandPauseUntilNetChangeCheckSignature())
  {
    int v8 = @"do_network_signature_changed: network signature change ignored";
LABEL_14:
    SCLog(1LL, 7LL, v8);
    goto LABEL_15;
  }

  uint64_t v0 = copyPrimaryService((const __SCDynamicStore *)gDynamicStore);
  mach_port_name_t v9 = v0;
  if (v0)
  {
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  v0,  kSCEntNetIPv4);
    CFStringRef v10 = NetworkServiceEntity;
    if (NetworkServiceEntity)
    {
      CFPropertyListRef v2 = SCDynamicStoreCopyValue((SCDynamicStoreRef)gDynamicStore, NetworkServiceEntity);
      uint64_t v11 = v2;
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (v2)
      {
        if (CFGetTypeID(v2) == TypeID)
        {
          CFPropertyListRef Value = CFDictionaryGetValue((CFDictionaryRef)v2, kSCPropInterfaceName);
          uint64_t v5 = CFDictionaryGetValue((CFDictionaryRef)v2, @"NetworkSignature");
          CFTypeID v6 = CFStringGetTypeID();
          if (Value)
          {
            if (CFGetTypeID(Value) == v6)
            {
              CFTypeID v7 = CFStringGetTypeID();
              if (v5)
              {
                if (CFGetTypeID(v5) == v7)
                {
                  if (!my_CFEqual(qword_40548, (unint64_t)Value))
                  {
                    my_CFRelease((const void **)&qword_40548);
                    CFRetain(Value);
                    qword_40548 = (uint64_t)Value;
LABEL_17:
                    my_CFRelease((const void **)&qword_40550);
                    CFRetain(v5);
                    qword_40550 = (uint64_t)v5;
                    int v8 = @"ondemand_clear_pause_all called";
                    goto LABEL_14;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

LABEL_15:
  my_CFRelease((const void **)&v10);
  my_CFRelease((const void **)&v9);
  my_CFRelease(&v11);
}

uint64_t ondemand_clear_pause_all()
{
  return SCLog(1LL, 7LL, @"ondemand_clear_pause_all called");
}

uint64_t allow_sleep()
{
  uint64_t v0 = 1LL;
  SCLog(1LL, 7LL, @"SCNC Controller: can sleep now, sleep arg %ld.");
  if (gSleepArgument)
  {
    IOAllowPowerChange(gIOPort, gSleepArgument);
    gSleepArgument = 0LL;
  }

  return v0;
}

uint64_t sub_14268(int a1)
{
  uint64_t v1 = service_head;
  if (service_head)
  {
    uint64_t v3 = 0LL;
    while (1)
    {
      int v4 = *(unsigned __int16 *)(v1 + 64);
      if (v4 == 2)
      {
        uint64_t v3 = 0LL;
      }

      else
      {
        if (v4 == 1)
        {
          int v5 = ipsec_will_sleep(v1, a1);
          goto LABEL_9;
        }

        if (!*(_WORD *)(v1 + 64))
        {
          int v5 = ppp_will_sleep(v1, a1);
LABEL_9:
          uint64_t v3 = v5 | v3;
        }
      }

      uint64_t v1 = *(void *)v1;
      if (!v1) {
        return v3;
      }
    }
  }

  return 0LL;
}

void service_ended(uint64_t a1)
{
  CFPropertyListRef v2 = (CFRunLoopTimerRef *)(a1 + 160);
  if (*(void *)(a1 + 160))
  {
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveTimer(Current, *v2, kCFRunLoopCommonModes);
    my_CFRelease((const void **)v2);
  }

  my_CFRelease((const void **)(a1 + 152));
  if ((byte_40558 & 1) == 0 && (*(_WORD *)(a1 + 64) || *(unsigned __int16 *)(a1 + 66) >= 3u))
  {
    int v4 = copyPrimaryService((const __SCDynamicStore *)gDynamicStore);
    if (v4)
    {
      uint64_t v11 = v4;
      CFMutableDictionaryRef v12 = *(const __CFString **)(a1 + 24);
      if (v12 == v11 || v12 && CFEqual(v12, v11))
      {
        byte_40558 = 1;
        scnc_log( 6LL,  @"SCNC Controller: %s, waiting for PrimaryService. status = %x.",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)"service_ending_verify_primaryservice");
      }

      CFRelease(v11);
    }

    else
    {
      byte_40558 = 1;
      scnc_log( 6LL,  @"SCNC Controller: %s, waiting for PrimaryService. status = %x.",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)"service_ending_verify_primaryservice");
    }
  }

BOOL hasDNS()
{
  CFPropertyListRef v2 = copyEntity((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainState, 0LL, kSCEntNetDNS);
  BOOL v0 = isDictionary(v2) != 0;
  my_CFRelease(&v2);
  return v0;
}

uint64_t *findbyserviceID(CFStringRef theString2)
{
  CFPropertyListRef v2 = &service_head;
  do
    CFPropertyListRef v2 = (uint64_t *)*v2;
  while (v2 && CFStringCompare((CFStringRef)v2[3], theString2, 0LL));
  return v2;
}

uint64_t findbypid(int a1)
{
  for (uint64_t i = service_head; i; uint64_t i = *(void *)i)
  {
    if (*(_WORD *)(i + 64))
    {
      if (*(_WORD *)(i + 64) == 2) {
        return 0LL;
      }
    }

    else if (ppp_is_pid(i, a1))
    {
      return i;
    }
  }

  return i;
}

uint64_t findbysid(const char *a1, int a2)
{
  uint64_t v2 = service_head;
  if (service_head)
  {
    size_t v4 = a2;
    do
    {
      uint64_t v5 = *(const char **)(v2 + 56);
      uint64_t v2 = *(void *)v2;
    }

    while (v2);
  }

  return v2;
}

uint64_t makeref(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 68) | (*(unsigned __int16 *)(a1 + 66) << 16);
}

uint64_t findbyref(int a1, unsigned int a2)
{
  uint64_t result = service_head;
  if (service_head)
  {
    unsigned int v4 = HIWORD(a2);
    do
    {
      if (*(unsigned __int16 *)(result + 64) == a1
        && (v4 == 0xFFFF || v4 == *(unsigned __int16 *)(result + 66))
        && ((unsigned __int16)a2 == 0xFFFF || *(unsigned __int16 *)(result + 68) == (unsigned __int16)a2))
      {
        break;
      }

      uint64_t result = *(void *)result;
    }

    while (result);
  }

  return result;
}

uint64_t findfreeunit(int a1, int a2)
{
  uint64_t v2 = (uint64_t *)service_head;
  if (service_head)
  {
    unsigned __int16 v3 = 0;
    while (1)
    {
      if (*((unsigned __int16 *)v2 + 32) == a1
        && *((unsigned __int16 *)v2 + 33) == a2
        && *((unsigned __int16 *)v2 + 34) == v3)
      {
        if (++v3 == 0xFFFF) {
          return (unsigned __int16)-1;
        }
        uint64_t v2 = &service_head;
      }

      uint64_t v2 = (uint64_t *)*v2;
      if (!v2) {
        return v3;
      }
    }
  }

  return 0;
}

uint64_t phase_changed( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 584);
  if (v9) {
    return ne_sm_bridge_status_changed(v9, a2, a3, a4, a5, a6, a7, a8);
  }
  unsigned int v11 = a2;
  if ((*(_BYTE *)(a1 + 74) & 0x20) != 0) {
    ondemand_add_service(a1, 0LL, a3, a4, a5, a6, a7, a8);
  }
  CFMutableDictionaryRef v12 = *(const __CFString **)(a1 + 24);
  uint64_t v13 = *(char **)(a1 + 56);
  unsigned int v14 = *(unsigned __int16 *)(a1 + 68) | (*(unsigned __int16 *)(a1 + 66) << 16);
  scnc_getstatus(a1, a2, a3, a4, a5, a6, a7, a8);
  return client_notify(v12, v13, v14, v11, 0, 8);
}

uint64_t ondemand_add_service( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 0LL;
  CFMutableDictionaryRef theDict = 0LL;
  CFMutableDictionaryRef v51 = 0LL;
  CFMutableArrayRef theArray = 0LL;
  CFTypeID v49 = 0LL;
  int valuePtr = 0;
  if ((*(_BYTE *)(a1 + 74) & 0x20) != 0 && gOndemand_key)
  {
    int v9 = a2;
    int valuePtr = scnc_getstatus(a1, a2, a3, a4, a5, a6, a7, a8);
    if (valuePtr == 2)
    {
      ondemand_unpublish_dns_triggering_dicts(a1);
    }

    else
    {
      unsigned int v11 = *(const __CFDictionary **)(a1 + 432);
      if (v11 && !*(_BYTE *)(a1 + 440) && SCDynamicStoreSetMultiple((SCDynamicStoreRef)gDynamicStore, v11, 0LL, 0LL)) {
        *(_BYTE *)(a1 + 440) = 1;
      }
    }

    CFPropertyListRef v12 = SCDynamicStoreCopyValue((SCDynamicStoreRef)gDynamicStore, (CFStringRef)gOndemand_key);
    CFTypeID v49 = v12;
    if (v12)
    {
      uint64_t v13 = (const __CFDictionary *)v12;
      CFPropertyListRef Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v12, @"Triggers");
      __int128 v15 = Value;
      if (Value)
      {
        CFIndex Count = CFArrayGetCount(Value);
        if (Count < 1)
        {
          int v22 = 0;
          LODWORD(v18) = 0;
          BOOL v19 = 1;
        }

        else
        {
          CFIndex v17 = Count;
          CFIndex v18 = 0LL;
          BOOL v19 = 0;
          while (1)
          {
            ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v15, v18);
            if (ValueAtIndex)
            {
              CFStringRef v21 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"ServiceID");
              if (v21)
              {
                if (CFStringCompare(v21, *(CFStringRef *)(a1 + 24), 0LL) == kCFCompareEqualTo) {
                  break;
                }
              }
            }

            BOOL v19 = v17 <= ++v18;
            if (v17 == v18)
            {
              int v22 = 0;
              LODWORD(v18) = 0;
              goto LABEL_22;
            }
          }

          int v22 = 1;
        }

LABEL_22:
        CFMutableDictionaryRef MutableCopy = CFArrayCreateMutableCopy(0LL, 0LL, v15);
        CFStringRef v25 = MutableCopy;
        CFMutableArrayRef theArray = MutableCopy;
        if (v19 || !MutableCopy)
        {
          if (!MutableCopy) {
            goto LABEL_79;
          }
          CFStringRef v23 = 0LL;
          __int128 v15 = 0LL;
        }

        else
        {
          __int128 v15 = (const __CFArray *)CFArrayGetValueAtIndex(v15, v18);
          if (v9)
          {
            CFStringRef v23 = 0LL;
          }

          else
          {
            CFStringRef v23 = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, v15);
            CFMutableDictionaryRef theDict = v23;
          }

          CFArrayRemoveValueAtIndex(v25, v18);
        }
      }

      else
      {
        CFStringRef v23 = 0LL;
        int v22 = 0;
        LODWORD(v18) = 0;
      }

      CFMutableDictionaryRef v51 = CFDictionaryCreateMutableCopy(0LL, 0LL, v13);
      if (!v51) {
        goto LABEL_79;
      }
      if (v23)
      {
LABEL_34:
        CFNumberRef v27 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
        if (v27)
        {
          CFNumberRef v28 = v27;
          CFDictionarySetValue(v23, @"Status", v27);
          CFRelease(v28);
        }

        int v29 = *(const void **)(a1 + 416);
        uint64_t v30 = theDict;
        uint64_t v31 = (const void *)kSCPropNetVPNOnDemandRuleAction;
        if (v29)
        {
          CFDictionarySetValue(theDict, kSCPropNetVPNOnDemandRuleAction, v29);
        }

        else if (CFDictionaryContainsKey(theDict, kSCPropNetVPNOnDemandRuleAction))
        {
          CFDictionaryRemoveValue(v30, v31);
        }

        CFMutableDictionaryRef v32 = *(const void **)(a1 + 424);
        int v33 = (const void *)kSCPropNetVPNOnDemandRuleActionParameters;
        if (v32)
        {
          CFDictionarySetValue(v30, kSCPropNetVPNOnDemandRuleActionParameters, v32);
        }

        else if (CFDictionaryContainsKey(v30, kSCPropNetVPNOnDemandRuleActionParameters))
        {
          CFDictionaryRemoveValue(v30, v33);
        }

        CFStringRef v34 = *(const void **)(a1 + 448);
        if (v34)
        {
          CFDictionarySetValue(v30, @"ProbeResults", v34);
        }

        else if (CFDictionaryContainsKey(v30, @"ProbeResults"))
        {
          CFDictionaryRemoveValue(v30, @"ProbeResults");
        }

        if (*(_BYTE *)(a1 + 488))
        {
          CFDictionarySetValue(v30, @"DNSRedirectDetected", kCFBooleanTrue);
          CFStringRef v35 = *(const void **)(a1 + 496);
          CFTypeID TypeID = CFDictionaryGetTypeID();
          if (v35 && CFGetTypeID(v35) == TypeID) {
            CFDictionarySetValue(v30, @"DNSRedirectedAddresses", *(const void **)(a1 + 496));
          }
        }

        else if (CFDictionaryContainsKey(v30, @"DNSRedirectDetected"))
        {
          CFDictionaryRemoveValue(v30, @"DNSRedirectDetected");
          CFDictionaryRemoveValue(v30, @"DNSRedirectedAddresses");
        }

        CFArrayRef v37 = *(const void **)(a1 + 504);
        if (v37)
        {
          CFDictionarySetValue(v30, @"TunneledNetworks", v37);
        }

        else if (CFDictionaryContainsKey(v30, @"TunneledNetworks"))
        {
          CFDictionaryRemoveValue(v30, @"TunneledNetworks");
        }

        CFNumberRef v38 = CFNumberCreate(0LL, kCFNumberIntType, (const void *)(a1 + 544));
        if (v38)
        {
          CFNumberRef v39 = v38;
          CFDictionarySetValue(v30, @"ReachFlags", v38);
          CFRelease(v39);
        }

        CFNumberRef v40 = CFNumberCreate(0LL, kCFNumberIntType, (const void *)(a1 + 548));
        if (v40)
        {
          CFNumberRef v41 = v40;
          CFDictionarySetValue(v30, @"ReachInterfaceIndex", v40);
          CFRelease(v41);
        }

        CFNumberRef v42 = CFNumberCreate(0LL, kCFNumberIntType, (const void *)(a1 + 412));
        if (v42)
        {
          CFNumberRef v43 = v42;
          CFDictionarySetValue(v30, kSCPropNetVPNOnDemandSuspended, v42);
          CFRelease(v43);
        }

        if (v9)
        {
          if (*(_WORD *)(a1 + 64) == 1)
          {
            ipsec_ondemand_add_service_data(a1, v30);
          }

          else if (!*(_WORD *)(a1 + 64))
          {
            ppp_ondemand_add_service_data(a1, v30);
          }

          CFDictionarySetValue(v30, @"ServiceID", *(const void **)(a1 + 24));
          sub_14EA0();
        }

        int v44 = v51;
        if (v51
          || (int v44 = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks),  (v51 = v44) != 0LL))
        {
          CFMutableArrayRef Mutable = theArray;
          if (theArray
            || (CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 1LL, &kCFTypeArrayCallBacks), (theArray = Mutable) != 0LL))
          {
            if (!v22 || v9) {
              CFArrayAppendValue(Mutable, theDict);
            }
            else {
              CFArrayInsertValueAtIndex(Mutable, (int)v18, theDict);
            }
            CFDictionarySetValue(v44, @"Triggers", Mutable);
            SCDynamicStoreSetValue((SCDynamicStoreRef)gDynamicStore, (CFStringRef)gOndemand_key, v44);
            sub_150B0(Mutable);
LABEL_82:
            uint64_t v8 = 1LL;
            goto LABEL_83;
          }
        }

        goto LABEL_79;
      }
    }

    else
    {
      LODWORD(v18) = 0;
      int v22 = 0;
      __int128 v15 = 0LL;
    }

    CFStringRef v26 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFMutableDictionaryRef theDict = v26;
    if (v26)
    {
      CFStringRef v23 = v26;
      int v9 = 1;
      goto LABEL_34;
    }

  BYTE2(__buf) = 5;
  DWORD1(v28) = 1;
  HIDWORD(__buf) = 7;
  if (*(_BYTE *)(a2 + 1) == 2)
  {
    *(_OWORD *)((char *)v32 + 12) = *(_OWORD *)a2;
    if (a3) {
      *(_OWORD *)((char *)&v32[1] + 12) = *(_OWORD *)a3;
    }
    WORD6(v32[2]) = 528;
    LODWORD(v32[3]) = -1;
    BOOL v19 = (char *)&v32[3] + 12;
    uint64_t v20 = 160;
    if (a4)
    {
LABEL_26:
      *(_WORD *)BOOL v19 = 4628;
      CFStringRef v21 = strlen(a4);
      if (v21 >= 0xC) {
        int v22 = 12LL;
      }
      else {
        int v22 = v21;
      }
      v19[5] = v22;
      HIDWORD(__buf) = 23;
      memmove(v19 + 8, a4, v22);
      goto LABEL_34;
    }
  }

  else
  {
    *(_OWORD *)((char *)v32 + 12) = *(_OWORD *)a2;
    *(_OWORD *)((char *)&v32[1] + 8) = *(_OWORD *)(a2 + 12);
    if (a3)
    {
      *(_OWORD *)((char *)&v32[2] + 8) = *(_OWORD *)a3;
      *(_OWORD *)((char *)&v32[3] + 4) = *(_OWORD *)(a3 + 12);
    }

    WORD2(v32[4]) = 7708;
    BOOL v19 = (char *)&v33;
    *(void *)((char *)&v32[4] + 12) = -1LL;
    *(void *)((char *)&v32[5] + 4) = -1LL;
    uint64_t v20 = 196;
    if (a4) {
      goto LABEL_26;
    }
  }

  v20 -= 20;
LABEL_34:
  LOWORD(__buf) = v20;
  if ((write(v13, &__buf, v20) & 0x8000000000000000LL) == 0)
  {
    close(v13);
    return 1LL;
  }

  if (a1 == 2) {
    CFStringRef v24 = 7;
  }
  else {
    CFStringRef v24 = 3;
  }
  CFStringRef v25 = __error();
  CFStringRef v26 = strerror(*v25);
  syslog(v24, "host_gateway: write routing socket failed, command %d, %s", a1, v26);
  close(v13);
  return 0LL;
}

LABEL_83:
  my_CFRelease((const void **)&v51);
  my_CFRelease((const void **)&theDict);
  my_CFRelease((const void **)&theArray);
  my_CFRelease(&v49);
  return v8;
}

uint64_t scnc_getstatus( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_WORD *)(a1 + 64) == 1) {
    return ipsec_getstatus(a1, a2, a3, a4, a5, a6, a7, a8);
  }
  if (*(_WORD *)(a1 + 64)) {
    return 0LL;
  }
  return ppp_getstatus(a1);
}

void user_notification_callback(void *cf, uint64_t a2)
{
  unsigned int v4 = &service_head;
  while (1)
  {
    unsigned int v4 = (uint64_t *)*v4;
    if (!v4) {
      break;
    }
    if ((void *)v4[21] == cf)
    {
      CFRetain(cf);
      CFRunLoopRef Current = CFRunLoopGetCurrent();
      CFRunLoopRemoveSource(Current, (CFRunLoopSourceRef)v4[22], kCFRunLoopDefaultMode);
      my_CFRelease((const void **)v4 + 21);
      my_CFRelease((const void **)v4 + 22);
      if (*((_WORD *)v4 + 32) == 1)
      {
        ipsec_user_notification_callback((uint64_t)v4, (CFUserNotificationRef)cf, a2, v6, v7, v8, v9, v10);
      }

      else if (!*((_WORD *)v4 + 32))
      {
        ppp_user_notification_callback(v4, cf, a2);
      }

      CFRelease(cf);
      return;
    }
  }

BOOL ondemand_unpublish_dns_triggering_dicts(uint64_t a1)
{
  CFArrayRef v9 = 0LL;
  uint64_t v2 = *(const __CFDictionary **)(a1 + 432);
  if (v2)
  {
    if (*(_BYTE *)(a1 + 440))
    {
      size_t Count = CFDictionaryGetCount(v2);
      if (Count)
      {
        CFIndex v4 = Count;
        uint64_t v5 = (const void **)calloc(Count, 8uLL);
        if (v5)
        {
          uint64_t v6 = v5;
          CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 432), v5, 0LL);
          CFArrayRef v7 = CFArrayCreate(kCFAllocatorDefault, v6, v4, &kCFTypeArrayCallBacks);
          CFArrayRef v9 = v7;
          if (v7 && SCDynamicStoreSetMultiple((SCDynamicStoreRef)gDynamicStore, 0LL, v7, 0LL)) {
            *(_BYTE *)(a1 + 440) = 0;
          }
          free(v6);
        }
      }
    }
  }

  my_CFRelease((const void **)&v9);
  return *(_BYTE *)(a1 + 440) == 0;
}

void sub_14EA0()
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  uint64_t v1 = (void *)service_head;
  if (Mutable) {
    BOOL v2 = service_head == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2)
  {
    do
    {
      unsigned __int16 v3 = (const void *)v1[3];
      uint64_t v1 = (void *)*v1;
      if (v3) {
        CFArrayAppendValue(Mutable, v3);
      }
    }

    while (v1);
  }

  __int128 v15 = Mutable;
  if (Mutable)
  {
    scnc_cache_flush_removed_services(Mutable);
    my_CFRelease((const void **)&v15);
  }

  CFIndex v4 = (void *)service_head;
  if (service_head)
  {
    int v5 = 0;
    while (1)
    {
      while (1)
      {
        uint64_t v6 = (uint64_t)v4;
        CFIndex v4 = (void *)*v4;
        int v7 = *(_DWORD *)(v6 + 72);
        if ((v7 & 1) != 0) {
          break;
        }
LABEL_35:
        if (!v4) {
          return;
        }
      }

      *(_DWORD *)(v6 + 72) = v7 & 0xFFFFFFFC;
      if ((v7 & 0x200000) != 0)
      {
        *(_DWORD *)(v6 + 72) = v7 & 0xFFDFFFFC;
        sub_16F2C(v6);
      }

      int v8 = *(unsigned __int16 *)(v6 + 64);
      if (v8 == 2)
      {
        int v5 = -1;
        goto LABEL_29;
      }

      if (v8 == 1) {
        break;
      }
      if (!*(_WORD *)(v6 + 64))
      {
        int v9 = ppp_setup_service(v6);
LABEL_20:
        int v5 = v9;
      }

      if (v5 < 0)
      {
LABEL_29:
        *(_BYTE *)(v6 + 16) = 0;
        if (!v4) {
          return;
        }
      }

      else
      {
        *(_BYTE *)(v6 + 16) = 1;
        uint64_t v10 = (void *)(v6 + 144);
        my_CFRelease((const void **)(v6 + 144));
        unsigned int v11 = (const __CFDictionary *)copyEntity( (const __SCDynamicStore *)gDynamicStore,  kSCDynamicStoreDomainSetup,  *(const __CFString **)(v6 + 24),  @"com.apple.payload/PayloadRoot");
        if (v11)
        {
          CFPropertyListRef v12 = v11;
          CFPropertyListRef Value = CFDictionaryGetValue(v11, @"PayloadIdentifier");
          void *v10 = Value;
          CFTypeID TypeID = CFStringGetTypeID();
          if (Value && CFGetTypeID(Value) == TypeID)
          {
            void *v10 = Value;
            CFRetain(Value);
          }

          else
          {
            void *v10 = 0LL;
          }

          CFRelease(v12);
        }

        if ((*(_BYTE *)(v6 + 74) & 0x20) == 0)
        {
          reachability_clear(v6);
          goto LABEL_35;
        }

        scnc_cache_init_service(v6);
        reachability_reset(v6);
        ondemand_add_service(v6, 1LL);
        if (!v4) {
          return;
        }
      }
    }

    int v9 = ipsec_setup_service(v6);
    goto LABEL_20;
  }

uint64_t sub_150B0(const __CFArray *a1)
{
  if (isArray(a1) && (CFIndex Count = CFArrayGetCount(a1), Count >= 1))
  {
    CFIndex v3 = Count;
    uint64_t v4 = 0LL;
    CFIndex v5 = 0LL;
    uint64_t v6 = (const void *)kSCPropNetVPNOnDemandRuleAction;
    int v7 = (const void *)kSCValNetVPNOnDemandRuleActionIgnore;
    int v8 = (const void *)kSCValNetVPNOnDemandRuleActionDisconnect;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v5);
      if (isDictionary(ValueAtIndex))
      {
        CFPropertyListRef Value = CFDictionaryGetValue(ValueAtIndex, v6);
        if (CFDictionaryGetValue(ValueAtIndex, @"OnDemandMatchAppEnabled")
          || !Value
          || !CFEqual(Value, v7) && !CFEqual(Value, v8))
        {
          ++v4;
        }
      }

      ++v5;
    }

    while (v3 != v5);
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  int v11 = gNotifyOnDemandToken;
  if (gNotifyOnDemandToken == -1)
  {
    if (notify_register_check("com.apple.system.SCNetworkConnectionOnDemand", &gNotifyOnDemandToken))
    {
      CFPropertyListRef v12 = @"SCNC Controller: notify_register_check failed, status = %d";
      goto LABEL_20;
    }

    int v11 = gNotifyOnDemandToken;
  }

  if (notify_set_state(v11, v4))
  {
    CFPropertyListRef v12 = @"SCNC Controller: notify_set_state failed, status = %d";
  }

  else
  {
    uint64_t result = notify_post("com.apple.system.SCNetworkConnectionOnDemand");
    if (!(_DWORD)result) {
      return result;
    }
    CFPropertyListRef v12 = @"SCNC Controller: notify_post failed, status = %d";
  }

uint64_t bringup_cellular(uint64_t a1)
{
  v12[0] = 0LL;
  __int128 v13 = 0u;
  uint64_t v14 = 0LL;
  v12[1] = a1;
  context.version = 0LL;
  memset(&context.retain, 0, 24);
  context.mach_timebase_info info = (void *)a1;
  char v10 = 0;
  uint64_t v2 = _CTServerConnectionCreate(kCFAllocatorDefault, sub_15424, v12);
  *(void *)(a1 + 152) = v2;
  CFIndex v3 = (void *)(a1 + 152);
  if (v2 && !((unint64_t)_CTServerConnectionGetPacketContextActive(v2, 0LL, &v10) >> 32))
  {
    SCLog(gSCNCVerbose, 6LL, @"SCNC Controller: BringUpEDGE active = %d");
    if (v10)
    {
      my_CFRelease((const void **)(a1 + 152));
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      CFRunLoopTimerRef v5 = CFRunLoopTimerCreate(0LL, Current + 2.0, 3.1536e10, 0LL, 0LL, (CFRunLoopTimerCallBack)sub_155A8, &context);
      *(void *)(a1 + 160) = v5;
      if (v5)
      {
        uint64_t v6 = CFRunLoopGetCurrent();
        CFRunLoopAddTimer(v6, *(CFRunLoopTimerRef *)(a1 + 160), kCFRunLoopCommonModes);
        return 1LL;
      }

      SCLog(1LL, 3LL, @"SCNC Controller: BringUpCellular, cannot create RunLoop timer");
    }

    else if (!((unint64_t)_CTServerConnectionRegisterForNotification( *v3,  kCTRegistrationDataStatusChangedNotification) >> 32) {
           && !((unint64_t)_CTServerConnectionRegisterForNotification( *v3,  kCTRegistrationDataActivateFailedNotification) >> 32)
    }
           && !((unint64_t)_CTServerConnectionSetPacketContextActiveByServiceType( *v3,  kCTDataConnectionServiceTypeInternet,  1LL) >> 32))
    {
      uint64_t v8 = *v3;
      CFRunLoopRef v9 = CFRunLoopGetCurrent();
      _CTServerConnectionAddToRunLoop(v8, v9, kCFRunLoopCommonModes);
      return 1LL;
    }
  }

  SCLog(1LL, 3LL, @"SCNC Controller: BringUpEDGE cannot bring up cellular, SInt32 error = %d");
  my_CFRelease((const void **)(a1 + 152));
  return 0LL;
}

void sub_15424(int a1, const void *a2, CFDictionaryRef theDict, uint64_t a4)
{
  v21.version = 0LL;
  memset(&v21.retain, 0, 24);
  v21.mach_timebase_info info = (void *)a4;
  CFPropertyListRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, kCTRegistrationDataContextID);
  if (CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr)) {
    BOOL v8 = valuePtr == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8) {
    return;
  }
  if (!CFEqual(a2, kCTRegistrationDataStatusChangedNotification))
  {
    SCLog(gSCNCVerbose, 6LL, @"SCNC Controller: callbackEDGE activation failed");
    if (*(_WORD *)(a4 + 64) != 1) {
      return;
    }
    uint64_t v19 = a4;
    uint64_t v20 = 2LL;
    goto LABEL_14;
  }

  CFRunLoopRef v9 = CFDictionaryGetValue(theDict, kCTRegistrationDataActive);
  if (!CFEqual(v9, kCFBooleanTrue)) {
    return;
  }
  SCLog(gSCNCVerbose, 6LL, @"SCNC Controller: cellular_callback activation succeeded");
  my_CFRelease((const void **)(a4 + 152));
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFRunLoopTimerRef v11 = CFRunLoopTimerCreate(0LL, Current + 2.0, 3.1536e10, 0LL, 0LL, (CFRunLoopTimerCallBack)sub_155A8, &v21);
  *(void *)(a4 + 160) = v11;
  if (v11)
  {
    CFPropertyListRef v12 = CFRunLoopGetCurrent();
    CFRunLoopAddTimer(v12, *(CFRunLoopTimerRef *)(a4 + 160), kCFRunLoopCommonModes);
    return;
  }

  SCLog(1LL, 3LL, @"SCNC Controller: cellular_callback, cannot create RunLoop timer");
  if (*(_WORD *)(a4 + 64) == 1)
  {
    uint64_t v19 = a4;
    uint64_t v20 = 1LL;
LABEL_14:
    ipsec_cellular_event(v19, v20, v13, v14, v15, v16, v17, v18);
  }

void sub_155A8(uint64_t a1, uint64_t a2)
{
  if (*(_WORD *)(a2 + 64) == 1) {
    ipsec_cellular_event(a2, 0LL, v3, v4, v5, v6, v7, v8);
  }
}

CFStringRef check_interface_captive_and_not_ready(const __SCDynamicStore *a1, uint64_t a2)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v3 = CFStringCreateWithFormat(0LL, 0LL, @"State:/Network/Interface/%s/CaptiveNetwork", a2);
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = v3;
  NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0LL, kSCDynamicStoreDomainState, v3);
  if (NetworkGlobalEntity)
  {
    uint64_t v6 = (const __CFDictionary *)SCDynamicStoreCopyValue(a1, NetworkGlobalEntity);
    CFRelease(NetworkGlobalEntity);
    if (v6)
    {
      CFPropertyListRef Value = (const __CFString *)CFDictionaryGetValue(v6, @"Stage");
      NetworkGlobalEntity = Value;
      if (Value)
      {
        if (CFStringCompare(Value, @"Uknown", 0LL) && CFStringCompare(NetworkGlobalEntity, @"Online", 0LL))
        {
          NetworkGlobalEntity = (const __CFString *)(&dword_0 + 1);
          uint64_t v8 = @"underlying interface %s is captive and not yet ready.";
        }

        else
        {
          NetworkGlobalEntity = 0LL;
          uint64_t v8 = @"underlying interface %s is either unknown or captive and ready.";
        }

        SCLog(1LL, 5LL, v8);
      }

      CFRelease(v6);
    }

    else
    {
      NetworkGlobalEntity = 0LL;
    }
  }

  CFRelease(v4);
  return NetworkGlobalEntity;
}

uint64_t client_gone(uint64_t a1)
{
  uint64_t v1 = (void *)service_head;
  if (service_head)
  {
    do
    {
      uint64_t v3 = v1 + 71;
      while (1)
      {
        uint64_t v3 = (void *)*v3;
        if (!v3) {
          break;
        }
        if (v3[2] == a1)
        {
          if (*((_DWORD *)v3 + 6))
          {
            *(_DWORD *)(a1 + 116) &= ~2u;
            scnc_stop((uint64_t)v1, a1, 15LL, 0);
          }

          break;
        }
      }

      uint64_t v1 = (void *)*v1;
    }

    while (v1);
  }

  return 0LL;
}

uint64_t scnc_bootstrap_dealloc(uint64_t result)
{
  mach_port_name_t v1 = *(_DWORD *)(result + 96);
  if (v1)
  {
    uint64_t v2 = result;
    uint64_t result = mach_port_deallocate(mach_task_self_, v1);
    *(_DWORD *)(v2 + 96) = 0;
  }

  return result;
}

uint64_t scnc_bootstrap_retain(uint64_t result, mach_port_name_t name)
{
  mach_port_name_t v3 = *(_DWORD *)(result + 96);
  if (v3 != name)
  {
    uint64_t v4 = result;
    if (v3) {
      uint64_t result = mach_port_deallocate(mach_task_self_, v3);
    }
    if (name) {
      uint64_t result = mach_port_mod_refs(mach_task_self_, name, 0, 1);
    }
    *(_DWORD *)(v4 + 96) = name;
  }

  return result;
}

uint64_t scnc_ausession_dealloc(uint64_t result)
{
  mach_port_name_t v1 = *(_DWORD *)(result + 100);
  if (v1)
  {
    uint64_t v2 = result;
    uint64_t result = mach_port_deallocate(mach_task_self_, v1);
    *(_DWORD *)(v2 + 100) = 0;
  }

  return result;
}

uint64_t scnc_ausession_retain(uint64_t result, mach_port_name_t name)
{
  mach_port_name_t v3 = *(_DWORD *)(result + 100);
  if (v3 != name)
  {
    uint64_t v4 = result;
    if (v3) {
      uint64_t result = mach_port_deallocate(mach_task_self_, v3);
    }
    if (name) {
      uint64_t result = mach_port_mod_refs(mach_task_self_, name, 0, 1);
    }
    *(_DWORD *)(v4 + 100) = name;
  }

  return result;
}

uint64_t scnc_start( unint64_t a1, const __CFDictionary *a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, unsigned int a9)
{
  uint64_t v15 = a2;
  int v46 = 0;
  if (!a2)
  {
    uint64_t v45 = a3;
LABEL_26:
    uint64_t v23 = 0LL;
    char v24 = 1;
    goto LABEL_30;
  }

  if (GetIntFromDict(a2, @"OnDemandTrafficClass", &v46, 0))
  {
    if (v46 != 100)
    {
      if (v46 == 200)
      {
        char v17 = 0;
      }

      else
      {
        if (v46 == 900) {
          goto LABEL_27;
        }
        char v17 = 1;
      }

      int v18 = *(_DWORD *)(a1 + 412);
      if (!v18) {
        char v17 = 1;
      }
      if (v18 != 1 && (v17 & 1) != 0) {
        goto LABEL_13;
      }
    }

LABEL_13:
  uint64_t v45 = a3;
  if (!CFDictionaryContainsKey(v15, @"OnDemandHostName")) {
    goto LABEL_26;
  }
  CFPropertyListRef Value = CFDictionaryGetValue(v15, @"OnDemandHostName");
  CFStringGetTypeID();
  if (Value) {
    CFGetTypeID(Value);
  }
  uint64_t v20 = (const __CFString *)CFDictionaryGetValue(v15, kSCPropNetPPPOnDemandPriority);
  if (CFStringCompare(v20, kSCValNetPPPOnDemandPriorityLow, 0LL))
  {
    if (CFStringCompare(v20, kSCValNetPPPOnDemandPriorityDefault, 0LL)) {
      goto LABEL_29;
    }
    CFRunLoopTimerContext v21 = (const __CFDictionary *)CFDictionaryGetValue(v15, kSCEntNetPPP);
    if (!v21) {
      goto LABEL_29;
    }
    int v22 = (const __CFString *)CFDictionaryGetValue(v21, kSCPropNetPPPOnDemandMode);
    if (!isString(v22)
      || CFStringCompare(v22, kSCValNetPPPOnDemandModeAggressive, 0LL) == kCFCompareEqualTo)
    {
      goto LABEL_29;
    }

    if (CFStringCompare(v22, kSCValNetPPPOnDemandModeConservative, 0LL))
    {
      if (CFStringCompare(v22, kSCValNetPPPOnDemandModeCompatible, 0LL) == kCFCompareEqualTo) {
        return 5LL;
      }
      goto LABEL_29;
    }
  }

  if ((*(_DWORD *)(a1 + 72) & 0x200) == 0) {
    return 5LL;
  }
LABEL_29:
  char v24 = 0;
  uint64_t v23 = 1LL;
LABEL_30:
  uint64_t v25 = controller_options_get_onDemandBlacklistedProcesses();
  if (v25)
  {
    CFNumberRef v27 = (const __CFArray *)v25;
    int v44 = v15;
    unint64_t v28 = a1;
    uint64_t v29 = v23;
    char v30 = v24;
    uint64_t v31 = a5;
    uint64_t v32 = a6;
    uint64_t v33 = a8;
    int v34 = a4;
    proc_name(a7, buffer, 0x40u);
    CFStringRef v35 = CFStringCreateWithCString(kCFAllocatorDefault, buffer, 0x600u);
    if (v35)
    {
      CFStringRef v36 = v35;
      v48.length = CFArrayGetCount(v27);
      v48.location = 0LL;
      if (CFArrayContainsValue(v27, v48, v36))
      {
        SCLog(1LL, 7LL, @"SCNC: Dropping start request due to blacklisted app (%@)\n");
        CFRelease(v36);
        return 5LL;
      }

      CFRelease(v36);
    }

    a4 = v34;
    a8 = v33;
    a6 = v32;
    a5 = v31;
    char v24 = v30;
    uint64_t v23 = v29;
    a1 = v28;
    uint64_t v15 = v44;
  }

  if (gStopRls || gSleeping && (*(_BYTE *)(a1 + 74) & 4) != 0) {
    return 5LL;
  }
  *(void *)(a1 + 400) = 0LL;
  *(_DWORD *)(a1 + 408) = 0;
  int v39 = *(unsigned __int16 *)(a1 + 64);
  if (v39 == 2)
  {
    uint64_t v37 = 0LL;
    goto LABEL_49;
  }

  if (v39 == 1)
  {
    uint64_t v40 = ipsec_start(a1, v15, a5, a6, a8, 0LL, v23, v26);
    goto LABEL_47;
  }

  if (!*(_WORD *)(a1 + 64))
  {
    uint64_t v40 = ppp_start(a1, v15, a5, a6, a8, a9, 0LL, v23);
LABEL_47:
    uint64_t v37 = v40;
    goto LABEL_49;
  }

  uint64_t v37 = 5LL;
LABEL_49:
  sub_170A4(a7, buffer);
  if ((v24 & 1) != 0) {
    CFNumberRef v41 = @"SCNC: start%s, type %@, status %d, trafficClass %d";
  }
  else {
    CFNumberRef v41 = @"SCNC: start%s, type %@, onDemandHostName %@, status %d, trafficClass %d";
  }
  SCLog(1LL, 5LL, v41);
  if (!(_DWORD)v37)
  {
    *(_DWORD *)(a1 + 72) &= ~0x200u;
    if (v45 && (CFNumberRef v42 = malloc(0x20uLL)) != 0LL)
    {
      uint64_t v37 = 0LL;
      v42[6] = a4;
      CFNumberRef v43 = *(void **)(a1 + 576);
      *(void *)CFNumberRef v42 = 0LL;
      *((void *)v42 + 1) = v43;
      *((void *)v42 + 2) = v45;
      void *v43 = v42;
      *(void *)(a1 + 576) = v42;
    }

    else
    {
      return 0LL;
    }
  }

  return v37;
}

      if (!scnc_start( v12,  v15,  v10,  a4 == 0,  *(unsigned int *)(v10 + 64),  *(unsigned int *)(v10 + 68),  *(_DWORD *)(v10 + 72),  *(unsigned int *)(v10 + 56),  *(_DWORD *)(v10 + 60)))
      {
        my_CFRelease(&v18);
        *a5 = 0;
        return 0LL;
      }

      goto LABEL_14;
    }
  }

  uint64_t v16 = 1002;
LABEL_15:
  *a5 = v16;
  my_CFRelease(&v18);
  return 0LL;
}

uint64_t scnc_suspend(uint64_t a1)
{
  if (*(_WORD *)(a1 + 64)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return ppp_suspend(a1);
  }
}

uint64_t scnc_resume(uint64_t a1)
{
  if (*(_WORD *)(a1 + 64)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return ppp_resume(a1);
  }
}

uint64_t scnc_copyextendedstatus(uint64_t a1, void *a2, _WORD *a3)
{
  CFTypeRef cf = 0LL;
  *a2 = 0LL;
  *a3 = 0;
  if (*(_WORD *)(a1 + 64) == 1)
  {
    uint64_t v6 = ipsec_copyextendedstatus(a1, &cf);
  }

  else
  {
    if (*(_WORD *)(a1 + 64))
    {
      uint64_t v7 = 22LL;
LABEL_21:
      uint64_t v12 = *(void *)(a1 + 24);
      strerror(v7);
      scnc_log(5LL, @"Copy extended status for %@ failed: %s", v13, v14, v15, v16, v17, v18, v12);
      return v7;
    }

    uint64_t v6 = ppp_copyextendedstatus(a1, &cf);
  }

  uint64_t v7 = v6;
  CFTypeRef v8 = cf;
  if (cf) {
    BOOL v9 = (_DWORD)v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9)
  {
    char v10 = 0LL;
    if (!cf) {
      goto LABEL_18;
    }
LABEL_17:
    CFRelease(v8);
    goto LABEL_18;
  }

  memset(__len, 0, sizeof(__len));
  char v10 = Serialize(cf, (const UInt8 **)&__len[1], __len);
  if (v10 && (CFRunLoopTimerRef v11 = (void *)my_Allocate(__len[0]), (*a2 = v11) != 0LL))
  {
    memmove(v11, *(const void **)&__len[1], __len[0]);
    uint64_t v7 = 0LL;
    *a3 = __len[0];
  }

  else
  {
    uint64_t v7 = 12LL;
  }

  CFTypeRef v8 = cf;
  if (cf) {
    goto LABEL_17;
  }
LABEL_18:
  if (v10) {
    CFRelease(v10);
  }
  if ((_DWORD)v7) {
    goto LABEL_21;
  }
  return v7;
}

uint64_t scnc_copystatistics(uint64_t a1, void *a2, _WORD *a3)
{
  CFTypeRef cf = 0LL;
  *a2 = 0LL;
  *a3 = 0;
  if (*(_WORD *)(a1 + 64) == 1)
  {
    uint64_t v6 = ipsec_copystatistics(a1, &cf);
  }

  else
  {
    if (*(_WORD *)(a1 + 64))
    {
      uint64_t v7 = 22LL;
LABEL_21:
      uint64_t v12 = *(void *)(a1 + 24);
      strerror(v7);
      scnc_log(5LL, @"Copy statistics for %@ failed: %s", v13, v14, v15, v16, v17, v18, v12);
      return v7;
    }

    uint64_t v6 = ppp_copystatistics(a1, &cf);
  }

  uint64_t v7 = v6;
  CFTypeRef v8 = cf;
  if (cf) {
    BOOL v9 = (_DWORD)v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9)
  {
    char v10 = 0LL;
    if (!cf) {
      goto LABEL_18;
    }
LABEL_17:
    CFRelease(v8);
    goto LABEL_18;
  }

  memset(__len, 0, sizeof(__len));
  char v10 = Serialize(cf, (const UInt8 **)&__len[1], __len);
  if (v10 && (CFRunLoopTimerRef v11 = (void *)my_Allocate(__len[0]), (*a2 = v11) != 0LL))
  {
    memmove(v11, *(const void **)&__len[1], __len[0]);
    uint64_t v7 = 0LL;
    *a3 = __len[0];
  }

  else
  {
    uint64_t v7 = 12LL;
  }

  CFTypeRef v8 = cf;
  if (cf) {
    goto LABEL_17;
  }
LABEL_18:
  if (v10) {
    CFRelease(v10);
  }
  if ((_DWORD)v7) {
    goto LABEL_21;
  }
  return v7;
}

uint64_t scnc_getconnectdata(uint64_t a1, void *a2, _WORD *a3, int a4)
{
  CFTypeRef cf = 0LL;
  *a2 = 0LL;
  *a3 = 0;
  if (*(_WORD *)(a1 + 64) == 1)
  {
    uint64_t v6 = ipsec_getconnectdata(a1, &cf, a4);
  }

  else
  {
    if (*(_WORD *)(a1 + 64)) {
      return 22LL;
    }
    uint64_t v6 = ppp_getconnectdata(a1, &cf, a4);
  }

  uint64_t v7 = v6;
  CFTypeRef v8 = cf;
  if (cf) {
    BOOL v9 = (_DWORD)v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    memset(__len, 0, sizeof(__len));
    char v10 = Serialize(cf, (const UInt8 **)&__len[1], __len);
    if (v10)
    {
      CFRunLoopTimerRef v11 = v10;
      uint64_t v12 = (void *)my_Allocate(__len[0]);
      *a2 = v12;
      if (v12)
      {
        memmove(v12, *(const void **)&__len[1], __len[0]);
        uint64_t v7 = 0LL;
        *a3 = __len[0];
      }

      else
      {
        uint64_t v7 = 12LL;
      }

      CFRelease(v11);
    }

    else
    {
      uint64_t v7 = 12LL;
    }

    CFTypeRef v8 = cf;
  }

  if (v8) {
    CFRelease(v8);
  }
  return v7;
}

uint64_t scnc_getconnectsystemdata(uint64_t a1, void *a2, _WORD *a3)
{
  if (*(_WORD *)(a1 + 64)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return ppp_getconnectsystemdata(a1, a2, a3);
  }
}

uint64_t scnc_idle_disconnect( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_WORD *)(result + 64) == 1)
  {
    *(_DWORD *)(result + 596) = 19;
    return ipsec_stop(result, 15LL, a3, a4, a5, a6, a7, a8);
  }

  else if (!*(_WORD *)(result + 64))
  {
    *(_DWORD *)(result + 632) = 12;
    return ppp_stop((_DWORD *)result, 15);
  }

  return result;
}

uint64_t scnc_disconnectifoverslept(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0LL;
  if ((*(_BYTE *)(a2 + 75) & 8) != 0 && gWokeAt != -1 && gSleptAt != -1)
  {
    difftime(gWokeAt, gSleptAt);
    uint64_t v2 = 1LL;
    SCLog(1LL, 3LL, @"%s: System slept for %f secs, interface %s will disconnect.");
    scnc_idle_disconnect(a2, v5, v6, v7, v8, v9, v10, v11);
  }

  return v2;
}

uint64_t set_ondemand_pause_timer(uint64_t a1, unsigned int a2, int a3, int a4)
{
  uint64_t result = 0LL;
  context.version = 0LL;
  memset(&context.retain, 0, 24);
  context.mach_timebase_info info = (void *)a1;
  if (a2 && a3 != a4)
  {
    SCLog(gSCNCDebug, 7LL, @"SCNC Controller: Setting ondemand puase timer for %d seconds");
    clear_ondemand_pause_timer(a1);
    *(_DWORD *)(a1 + 560) = a4;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFRunLoopTimerRef v9 = CFRunLoopTimerCreate(0LL, Current + (double)a2, 0.0, 0LL, 0LL, (CFRunLoopTimerCallBack)sub_16318, &context);
    *(void *)(a1 + 552) = v9;
    if (v9)
    {
      uint64_t v10 = CFRunLoopGetCurrent();
      CFRunLoopAddTimer(v10, *(CFRunLoopTimerRef *)(a1 + 552), kCFRunLoopCommonModes);
      return 1LL;
    }

    else
    {
      SCLog(1LL, 3LL, @"SCNC Controller: cannot create ondemand pause timer");
      return 0LL;
    }
  }

  return result;
}

__CFRunLoopTimer *clear_ondemand_pause_timer(uint64_t a1)
{
  uint64_t result = *(__CFRunLoopTimer **)(a1 + 552);
  if (result)
  {
    mach_port_name_t v3 = (const void **)(a1 + 552);
    CFRunLoopTimerInvalidate(result);
    my_CFRelease(v3);
    return (__CFRunLoopTimer *)SCLog( gSCNCDebug,  7LL,  @"SCNC Controller: ondemand pause timer invalidated");
  }

  return result;
}

void sub_16318(uint64_t a1, uint64_t a2)
{
}

void sub_16350(id a1, service *a2)
{
  if ((a2->var10 & 0x200000) != 0) {
    ondemand_add_service((uint64_t)a2, 0LL, v2, v3, v4, v5, v6, v7);
  }
}

uint64_t sub_16368(uint64_t a1, uint64_t a2, int a3, intptr_t a4)
{
  uint64_t result = SCLog(1LL, 7LL, @"SCNC Controller: iosleep_notifier event %lx");
  if (a3 > -536870145)
  {
    if (a3 == -536870144)
    {
      time(&gWokeAt);
      for (uint64_t i = service_head; i; uint64_t i = *(void *)i)
      {
        *(_DWORD *)(i + 72) |= 0x200u;
        if (*(_WORD *)(i + 64) == 1)
        {
          ipsec_wake_up(i);
        }

        else if (!*(_WORD *)(i + 64))
        {
          ppp_wake_up((_DWORD *)i);
        }
      }

      uint64_t v7 = @"SCNC Controller: iosleep_notifier kIOMessageSystemHasPoweredOn";
    }

    else
    {
      if (a3 != -536870112) {
        return result;
      }
      gSleeping = 0;
      gWakeUpTime = mach_absolute_time();
      uint64_t v7 = @"SCNC Controller: iosleep_notifier kIOMessageSystemWillPowerOn";
    }

    return SCLog(1LL, 7LL, v7);
  }

  if (a3 == -536870288)
  {
    SCLog(1LL, 7LL, @"SCNC Controller: iosleep_notifier kIOMessageCanSystemSleep");
    for (uint64_t j = service_head; j; uint64_t j = *(void *)j)
    {
      if (*(_WORD *)(j + 64))
      {
        if (*(_WORD *)(j + 64) == 1 && !ipsec_can_sleep(j)) {
          return IOCancelPowerChange(gIOPort, a4);
        }
      }

      else if (!ppp_can_sleep(j))
      {
        return IOCancelPowerChange(gIOPort, a4);
      }
    }

    return IOAllowPowerChange(gIOPort, a4);
  }

  if (a3 == -536870272)
  {
    SCLog(1LL, 7LL, @"SCNC Controller: iosleep_notifier kIOMessageSystemWillSleep, sleep arg %ld");
    gSleeping = 1;
    time(&gSleptAt);
    uint64_t result = sub_14268(0);
    if ((_DWORD)result)
    {
      gSleepArgument = a4;
      return result;
    }

    return IOAllowPowerChange(gIOPort, a4);
  }

  return result;
}

void sub_16560(uint64_t a1, const __CFArray *a2)
{
  if (a2)
  {
    CFNumberRef v42 = SCDynamicStoreKeyCreate(0LL, @"%@/%@/%@/", kSCDynamicStoreDomainSetup, kSCCompNetwork, kSCCompService);
    CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0LL, kSCDynamicStoreDomainSetup, kSCEntNetIPv4);
    CFTypeRef cf2 = NetworkGlobalEntity;
    CFStringRef v4 = SCDynamicStoreKeyCreateNetworkGlobalEntity(0LL, kSCDynamicStoreDomainState, kSCEntNetIPv4);
    CFTypeRef v40 = v4;
    CFStringRef value = (void *)SCDynamicStoreKeyCreateNetworkGlobalEntity(0LL, kSCDynamicStoreDomainState, kSCEntNetDNS);
    if (!v42 || (NetworkGlobalEntity ? (BOOL v5 = v4 == 0LL) : (BOOL v5 = 1), v5))
    {
      SCLog(1LL, 3LL, @"SCNC Controller: cache_notifier can't allocate keys");
LABEL_78:
      my_CFRelease((const void **)&v42);
      my_CFRelease(&cf2);
      my_CFRelease(&v40);
      my_CFRelease((const void **)&value);
      return;
    }

    int Count = CFArrayGetCount(a2);
    if (Count < 1)
    {
LABEL_76:
      if (gSCNCVerbose) {
        sub_16E34();
      }
      goto LABEL_78;
    }

    CFIndex v7 = 0LL;
    int v8 = 0;
    int v9 = 0;
    CFIndex v10 = Count;
    unint64_t v34 = kSCValNetVPNOnDemandRuleInterfaceTypeMatchCellular;
    uint64_t v11 = Count;
    while (1)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a2, v7);
      if (CFEqual(ValueAtIndex, cf2))
      {
        int v8 = 1;
      }

      else
      {
        if (CFEqual(ValueAtIndex, v40))
        {
          if (byte_40558 == 1) {
            uint64_t v13 = copyPrimaryService((const __SCDynamicStore *)gDynamicStore);
          }
          else {
            uint64_t v13 = 0LL;
          }
          uint64_t v16 = service_head;
          if (!service_head)
          {
LABEL_35:
            if (!v13 || !byte_40558) {
              goto LABEL_38;
            }
            byte_40558 = 0;
            SCLog(1LL, 3LL, @"SCNC Controller: %s, done waiting for ServiceID.");
LABEL_39:
            CFRelease(v13);
LABEL_40:
            v43.location = 0LL;
            v43.length = v10;
            if (!CFArrayContainsValue(a2, v43, value)) {
              do_network_signature_changed();
            }
            goto LABEL_11;
          }

          BOOL v17 = 0;
          while (2)
          {
            *(_DWORD *)(v16 + 72) |= 0x200u;
            if (*(_WORD *)(v16 + 64) == 1)
            {
              ipsec_ipv4_state_changed(v16);
              if (v17) {
                goto LABEL_33;
              }
            }

            else
            {
              if (!*(_WORD *)(v16 + 64)) {
                ppp_ipv4_state_changed(v16);
              }
              if (v17)
              {
LABEL_33:
                uint64_t v16 = *(void *)v16;
                if (!v16)
                {
                  if (!v17) {
                    goto LABEL_35;
                  }
LABEL_38:
                  if (v13) {
                    goto LABEL_39;
                  }
                  goto LABEL_40;
                }

                continue;
              }
            }

            break;
          }

          if (v13)
          {
            uint64_t v18 = *(const __CFString **)(v16 + 24);
            BOOL v17 = v18 == v13 || v18 && CFEqual(v18, v13);
          }

          goto LABEL_33;
        }

        uint64_t v14 = parse_component(ValueAtIndex, v42);
        if (v14)
        {
          uint64_t v15 = v14;
          sub_16A5C(v14);
          CFRelease(v15);
          int v9 = 1;
        }

        else if (!v9)
        {
          uint64_t v19 = (const __CFString *)value;
          int v20 = CFEqual(ValueAtIndex, value);
          int v21 = CFEqual(ValueAtIndex, @"NWI_NOTIFICATION");
          if (v20 | v21)
          {
            int v22 = v21;
            CFTypeRef cf1 = SCDynamicStoreCopyValue((SCDynamicStoreRef)gDynamicStore, v19);
            uint64_t v37 = copy_primary_interface_name(0LL);
            CFStringRef v36 = (const __CFString *)copy_service_id_for_interface((unint64_t)v37);
            for (uint64_t i = service_head; i; uint64_t i = *(void *)i)
            {
              if ((*(_BYTE *)(i + 75) & 1) != 0)
              {
                if (v22 && my_CFEqual(*(void *)(i + 24), (unint64_t)v36)
                  || v20 && (CFTypeRef v30 = *(CFTypeRef *)(i + 456), cf1 != v30) && (!cf1 || !v30 || !CFEqual(cf1, v30)))
                {
                  if (*(_WORD *)(i + 64) == 1
                    && scnc_getstatus(i, (uint64_t)v30, v23, v24, v25, v26, v27, v28)
                    && *(_BYTE *)(i + 934))
                  {
                    if (my_CFEqual(*(void *)(i + 24), (unint64_t)v36))
                    {
                      my_CFRelease((const void **)&v37);
                      my_CFRelease((const void **)&v36);
                      uint64_t v37 = copy_primary_interface_name(*(const __CFString **)(i + 24));
                      uint64_t v31 = (const __CFString *)copy_service_id_for_interface((unint64_t)v37);
                      CFStringRef v36 = v31;
                    }

                    else
                    {
                      uint64_t v31 = v36;
                    }

                    CFTypeRef v32 = copy_interface_type(v31);
                    CFStringRef v35 = v32;
                    my_CFRelease(&v35);
                  }

                  my_CFRelease((const void **)(i + 456));
                  if (cf1)
                  {
                    CFRetain(cf1);
                    CFTypeRef v33 = cf1;
                  }

                  else
                  {
                    CFTypeRef v33 = 0LL;
                  }

                  *(void *)(i + 456) = v33;
                }
              }
            }

            my_CFRelease(&cf1);
            my_CFRelease((const void **)&v37);
            my_CFRelease((const void **)&v36);
          }

          int v9 = 0;
        }
      }

void sub_16A0C()
{
  values = @"NWI_NOTIFICATION";
  BOOL v0 = CFArrayCreate(0LL, (const void **)&values, 1LL, &kCFTypeArrayCallBacks);
  sub_16560((uint64_t)v0, v0);
  my_CFRelease((const void **)&v0);
}

void sub_16A5C(const __CFString *a1)
{
  uint64_t v18 = 0LL;
  uint64_t v2 = &service_head;
  do
    uint64_t v2 = (uint64_t *)*v2;
  while (v2 && CFStringCompare((CFStringRef)v2[3], a1, 0LL));
  CFPropertyListRef v3 = copyEntity((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainSetup, a1, kSCEntNetInterface);
  BOOL v17 = v3;
  if (!v3)
  {
    if (!v2) {
      goto LABEL_35;
    }
    goto LABEL_10;
  }

  CFStringRef v4 = (const __CFDictionary *)v3;
  CFPropertyListRef Value = CFDictionaryGetValue((CFDictionaryRef)v3, kSCPropNetInterfaceType);
  uint64_t v6 = Value;
  if (!v2)
  {
    CFIndex v7 = CFDictionaryGetValue(v4, kSCPropNetInterfaceSubType);
    goto LABEL_12;
  }

  if (!my_CFEqual((unint64_t)Value, v2[4]))
  {
LABEL_10:
    sub_13C24((unsigned __int16 *)v2);
    goto LABEL_35;
  }

  CFIndex v7 = CFDictionaryGetValue(v4, kSCPropNetInterfaceSubType);
  if (my_CFEqual((unint64_t)v7, v2[5]))
  {
LABEL_29:
    *((_DWORD *)v2 + 18) |= 1u;
    goto LABEL_35;
  }

  sub_13C24((unsigned __int16 *)v2);
LABEL_12:
  int v8 = (uint64_t *)malloc(0x420uLL);
  if (!v8) {
    goto LABEL_35;
  }
  uint64_t v2 = v8;
  bzero(v8, 0x420uLL);
  v2[3] = (uint64_t)my_CFRetain(a1);
  v2[4] = (uint64_t)my_CFRetain(v6);
  v2[5] = (uint64_t)my_CFRetain(v7);
  size_t v9 = (unsigned __int16)(CFStringGetLength(a1) + 1);
  CFIndex v10 = (char *)malloc(v9);
  v2[7] = (uint64_t)v10;
  if (v10) {
    CFStringGetCString(a1, v10, v9, 0x8000100u);
  }
  if (my_CFEqual((unint64_t)v6, (unint64_t)kSCValNetInterfaceTypePPP))
  {
    *((_WORD *)v2 + 32) = 0;
    int v11 = ppp_subtype((unint64_t)v7);
LABEL_19:
    int v12 = v11;
    *((_WORD *)v2 + 33) = v11;
LABEL_20:
    int v13 = *((unsigned __int16 *)v2 + 32);
    int v14 = findfreeunit(v13, v12);
    *((_WORD *)v2 + 34) = v14;
    if (v14 != 0xFFFF && v13 != 2)
    {
      if (v13 == 1)
      {
      }

      else
      {
        if (v13)
        {
LABEL_28:
          *((_DWORD *)v2 + 22) = 0;
          *((_DWORD *)v2 + 18) |= 0x200u;
          v2[71] = 0LL;
          v2[72] = (uint64_t)(v2 + 71);
          uint64_t v15 = (uint64_t **)qword_436E8;
          *uint64_t v2 = 0LL;
          v2[1] = (uint64_t)v15;
          CFStringRef v15 = v2;
          qword_436E8 = (uint64_t)v2;
          client_notify((CFStringRef)v2[3], (char *)v2[7], v14 | (v12 << 16), 0, 0, 8);
          goto LABEL_29;
        }

        if (!ppp_new_service((uint64_t)v2))
        {
LABEL_27:
          int v12 = *((unsigned __int16 *)v2 + 33);
          int v14 = *((unsigned __int16 *)v2 + 34);
          goto LABEL_28;
        }
      }
    }

    goto LABEL_32;
  }

  if (my_CFEqual((unint64_t)v6, (unint64_t)kSCValNetInterfaceTypeIPSec))
  {
    *((_WORD *)v2 + 32) = 1;
    int v11 = ipsec_subtype();
    goto LABEL_19;
  }

  if (my_CFEqual((unint64_t)v6, kSCValNetInterfaceTypeVPN))
  {
    int v12 = *((unsigned __int16 *)v2 + 33);
    goto LABEL_20;
  }

LABEL_32:
  my_CFRelease((const void **)v2 + 3);
  my_CFRelease((const void **)v2 + 4);
  my_CFRelease((const void **)v2 + 5);
  uint64_t v16 = (void *)v2[7];
  if (v16) {
    free(v16);
  }
  free(v2);
LABEL_35:
  my_CFRelease(&v17);
  my_CFRelease(&v18);
}

void sub_16D64()
{
  BOOL v0 = (const __CFArray *)copy_service_order();
  if (v0)
  {
    mach_port_name_t v1 = v0;
    CFIndex Count = CFArrayGetCount(v0);
    if (Count >= 1)
    {
      CFIndex v3 = Count;
      for (CFIndex i = 0LL; i != v3; ++i)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v1, i);
        uint64_t v6 = &service_head;
        while (1)
        {
          uint64_t v6 = (uint64_t *)*v6;
          if (!v6) {
            break;
          }
          if (CFStringCompare((CFStringRef)v6[3], ValueAtIndex, 0LL) == kCFCompareEqualTo)
          {
            uint64_t v7 = *v6;
            if (*v6) {
              int v8 = (uint64_t *)*v6;
            }
            else {
              int v8 = &service_head;
            }
            v8[1] = v6[1];
            *(void *)v6[1] = v7;
            uint64_t v9 = qword_436E8;
            *uint64_t v6 = 0LL;
            v6[1] = v9;
            *(void *)qword_436E8 = v6;
            qword_436E8 = (uint64_t)v6;
            break;
          }
        }
      }
    }

    CFRelease(v1);
  }

uint64_t sub_16E34()
{
  uint64_t result = SCLog(1LL, 6LL, @"SCNC Controller: Printing list of services : ");
  for (uint64_t i = service_head; i; uint64_t i = *(void *)i)
  {
    int v2 = *(unsigned __int16 *)(i + 64);
    if (v2 == 2)
    {
      CFIndex v3 = @"SCNC Controller: Service = %@, type = VPN, BundleID = %@";
    }

    else if (v2 == 1)
    {
      CFIndex v3 = @"SCNC Controller: Service = %@, type = IPSec";
    }

    else if (*(_WORD *)(i + 64))
    {
      CFIndex v3 = @"SCNC Controller: Service = %@, type = Unknown";
    }

    else
    {
      CFIndex v3 = @"SCNC Controller: Service = %@, type = PPP, subtype = %@";
    }

    uint64_t result = SCLog(1LL, 6LL, v3);
  }

  return result;
}

void sub_16F2C(uint64_t a1)
{
  CFMutableDictionaryRef v18 = 0LL;
  CFMutableArrayRef v16 = 0LL;
  if (gOndemand_key)
  {
    ondemand_unpublish_dns_triggering_dicts(a1);
    CFPropertyListRef v2 = SCDynamicStoreCopyValue((SCDynamicStoreRef)gDynamicStore, (CFStringRef)gOndemand_key);
    BOOL v17 = v2;
    if (v2)
    {
      CFIndex v3 = (const __CFDictionary *)v2;
      CFPropertyListRef Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v2, @"Triggers");
      if (Value)
      {
        BOOL v5 = Value;
        CFIndex Count = CFArrayGetCount(Value);
        if (Count >= 1)
        {
          CFIndex v7 = Count;
          CFIndex v8 = 0LL;
          while (1)
          {
            ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v8);
            if (ValueAtIndex)
            {
              CFIndex v10 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"ServiceID");
              if (v10)
              {
                if (CFStringCompare(v10, *(CFStringRef *)(a1 + 24), 0LL) == kCFCompareEqualTo) {
                  break;
                }
              }
            }

            if (v7 == ++v8) {
              goto LABEL_17;
            }
          }

          if (v7 == 1)
          {
            SCDynamicStoreRemoveValue((SCDynamicStoreRef)gDynamicStore, (CFStringRef)gOndemand_key);
            int v11 = 0LL;
LABEL_16:
            sub_150B0(v11);
            goto LABEL_17;
          }

          CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(0LL, 0LL, v5);
          CFMutableArrayRef v16 = MutableCopy;
          if (MutableCopy)
          {
            CFMutableArrayRef v13 = MutableCopy;
            CFArrayRemoveValueAtIndex(MutableCopy, v8);
            CFMutableDictionaryRef v14 = CFDictionaryCreateMutableCopy(0LL, 0LL, v3);
            CFMutableDictionaryRef v18 = v14;
            if (v14)
            {
              CFMutableDictionaryRef v15 = v14;
              CFDictionarySetValue(v14, @"Triggers", v13);
              SCDynamicStoreSetValue((SCDynamicStoreRef)gDynamicStore, (CFStringRef)gOndemand_key, v15);
              int v11 = v13;
              goto LABEL_16;
            }
          }
        }
      }
    }
  }

char *sub_170A4(int a1, char *__str)
{
  int v4 = snprintf(__str, 0x80uLL, ", triggered by (%d) ", a1);
  if (v4 < 1) {
    *__str = 0;
  }
  else {
    proc_name(a1, &__str[v4], 128 - v4);
  }
  return __str;
}

uint64_t client_init_all()
{
  client_head = 0LL;
  qword_43710 = (uint64_t)&client_head;
  return 0LL;
}

uint64_t client_new_socket(const void *a1, int a2, int a3, int a4)
{
  CFIndex v8 = (char *)malloc(0x98uLL);
  uint64_t v9 = (uint64_t)v8;
  if (v8)
  {
    *(_OWORD *)(v8 + 120) = 0u;
    *(_OWORD *)(v8 + 104) = 0u;
    *(_OWORD *)(v8 + 88) = 0u;
    *(_OWORD *)(v8 + 72) = 0u;
    *(_OWORD *)(v8 + 56) = 0u;
    *(_OWORD *)(v8 + 40) = 0u;
    *(_OWORD *)(v8 + 24) = 0u;
    CFRetain(a1);
    if (a2) {
      int v10 = 17;
    }
    else {
      int v10 = 16;
    }
    *(_DWORD *)(v9 + 64) = a3;
    *(_DWORD *)(v9 + 68) = a4;
    *(_DWORD *)(v9 + 116) = v10;
    *(void *)(v9 + 136) = 0LL;
    *(void *)(v9 + 1memset(v5, 0, 44) = v9 + 136;
    int v11 = (uint64_t *)qword_43710;
    *(void *)uint64_t v9 = 0LL;
    *(void *)(v9 + 8) = v11;
    *(void *)(v9 + 16) = a1;
    *int v11 = v9;
    qword_43710 = v9;
  }

  return v9;
}

uint64_t client_new_mach( const void *a1, const void *a2, const void *a3, int a4, int a5, int a6, int a7, int a8, int a9, char a10)
{
  CFMutableDictionaryRef v18 = malloc(0x98uLL);
  uint64_t v19 = (uint64_t)v18;
  if (v18)
  {
    v18[16] = 0LL;
    *((_OWORD *)v18 + 6) = 0u;
    *((_OWORD *)v18 + 7) = 0u;
    *((_OWORD *)v18 + 4) = 0u;
    *((_OWORD *)v18 + 5) = 0u;
    *((_OWORD *)v18 + 2) = 0u;
    *((_OWORD *)v18 + 3) = 0u;
    *((_OWORD *)v18 + 1) = 0u;
    CFRetain(a1);
    CFRetain(a2);
    CFRetain(a3);
    *(void *)(v19 + 24) = a1;
    *(void *)(v19 + 40) = a2;
    *(void *)(v19 + 48) = a3;
    *(_DWORD *)(v19 + 64) = a4;
    *(_DWORD *)(v19 + 68) = a5;
    *(_DWORD *)(v19 + 72) = a6;
    *(_DWORD *)(v19 + 32) = a8;
    *(_DWORD *)(v19 + 116) = 0;
    *(_DWORD *)(v19 + 56) = a7;
    *(_DWORD *)(v19 + 60) = a9;
    *(_BYTE *)(v19 + 132) = a10;
    *(void *)(v19 + 136) = 0LL;
    *(void *)(v19 + 1memset(v5, 0, 44) = v19 + 136;
    int v20 = (uint64_t *)qword_43710;
    *(void *)uint64_t v19 = 0LL;
    *(void *)(v19 + 8) = v20;
    *int v20 = v19;
    qword_43710 = v19;
  }

  return v19;
}

void client_dispose(uint64_t a1)
{
  CFPropertyListRef v2 = &client_head;
  CFIndex v3 = *(uint64_t **)a1;
  if (*(void *)a1) {
    CFPropertyListRef v2 = *(uint64_t **)a1;
  }
  v2[1] = *(void *)(a1 + 8);
  **(void **)(a1 + 8) = v3;
  client_gone(a1);
  while (1)
  {
    int v4 = *(uint64_t **)(a1 + 136);
    if (!v4) {
      break;
    }
    uint64_t v5 = *v4;
    uint64_t v6 = (void *)v4[1];
    if (*v4)
    {
      *(void *)(v5 + 8) = v6;
      uint64_t v6 = (void *)v4[1];
    }

    else
    {
      *(void *)(a1 + 1memset(v5, 0, 44) = v6;
    }

    *uint64_t v6 = v5;
    CFRelease((CFTypeRef)v4[2]);
    free(v4);
  }

  *(_DWORD *)(a1 + 128) = 0;
  CFIndex v7 = *(void **)(a1 + 120);
  if (v7)
  {
    free(v7);
    *(void *)(a1 + 120) = 0LL;
  }

  vm_address_t v8 = *(void *)(a1 + 80);
  if (v8)
  {
    my_Deallocate(v8, *(_DWORD *)(a1 + 92) + 1);
    *(void *)(a1 + 80) = 0LL;
  }

  *(void *)(a1 + 88) = 0LL;
  mach_port_name_t v9 = *(_DWORD *)(a1 + 56);
  if (v9)
  {
    mach_port_deallocate(mach_task_self_, v9);
    *(_DWORD *)(a1 + 56) = 0;
  }

  mach_port_name_t v10 = *(_DWORD *)(a1 + 32);
  if (v10)
  {
    mach_port_deallocate(mach_task_self_, v10);
    *(_DWORD *)(a1 + 32) = 0;
  }

  mach_port_name_t v11 = *(_DWORD *)(a1 + 60);
  if (v11)
  {
    mach_port_deallocate(mach_task_self_, v11);
    *(_DWORD *)(a1 + 60) = 0;
  }

  int v12 = *(__CFSocket **)(a1 + 16);
  if (v12)
  {
    CFSocketInvalidate(v12);
    my_CFRelease((const void **)(a1 + 16));
  }

  CFMutableArrayRef v13 = *(__CFMachPort **)(a1 + 24);
  if (v13)
  {
    CFMachPortInvalidate(v13);
    my_CFRelease((const void **)(a1 + 24));
  }

  if (*(void *)(a1 + 40))
  {
    CFAbsoluteTime Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 40), kCFRunLoopDefaultMode);
    my_CFRelease((const void **)(a1 + 40));
  }

  my_CFRelease((const void **)(a1 + 48));
  free((void *)a1);
}

CFMutableDictionaryRef client_newoptset(uint64_t a1, const void *a2)
{
  int v4 = malloc(0x20uLL);
  if (!v4) {
    return 0LL;
  }
  uint64_t v5 = v4;
  *int v4 = 0LL;
  v4[1] = 0LL;
  v4[2] = 0LL;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  _OWORD v5[3] = Mutable;
  if (Mutable)
  {
    v5[2] = a2;
    CFRetain(a2);
    CFIndex v7 = *(void **)(a1 + 144);
    void *v5 = 0LL;
    v5[1] = v7;
    *CFIndex v7 = v5;
    *(void *)(a1 + 1memset(v5, 0, 44) = v5;
  }

  else
  {
    free(v5);
  }

  return Mutable;
}

uint64_t *client_findoptset(uint64_t a1, CFStringRef theString2)
{
  CFIndex v3 = (uint64_t **)(a1 + 136);
  while (1)
  {
    CFIndex v3 = (uint64_t **)*v3;
    if (!v3) {
      break;
    }
    if (CFStringCompare((CFStringRef)v3[2], theString2, 0LL) == kCFCompareEqualTo) {
      return v3[3];
    }
  }

  return 0LL;
}

uint64_t client_notify( CFStringRef theString2, char *__s2, unsigned int a3, unsigned int a4, unsigned int a5, int a6)
{
  for (uint64_t i = client_head; i; uint64_t i = *(void *)i)
  {
    int v13 = *(_DWORD *)(i + 116);
    if ((v13 & a6) != 0)
    {
      if ((v13 & 0x10) != 0)
      {
        CFMutableDictionaryRef v14 = *(const char **)(i + 120);
        if (!v14)
        {
          unsigned int v15 = *(_DWORD *)(i + 128);
          if (v15 != a3 && v15 <= 0xFFFEFFFF) {
            continue;
          }
          goto LABEL_15;
        }

        if (!*v14 || !strcmp(v14, __s2)) {
          goto LABEL_15;
        }
      }

      else if (CFStringCompare(*(CFStringRef *)(i + 48), theString2, 0LL) == kCFCompareEqualTo)
      {
        int v13 = *(_DWORD *)(i + 116);
LABEL_15:
        if ((v13 & 0x10) != 0)
        {
          if (*(void *)(i + 120)) {
            BOOL v17 = __s2;
          }
          else {
            BOOL v17 = 0LL;
          }
          socket_client_notify(*(__CFSocket **)(i + 16), v17, a3, a4, a5, v13);
        }

        else
        {
          mach_client_notify(*(_DWORD *)(i + 32));
        }
      }
    }
  }

  return 0LL;
}

uint64_t *client_findbysocketref(uint64_t a1)
{
  uint64_t result = &client_head;
  do
    uint64_t result = (uint64_t *)*result;
  while (result && result[2] != a1);
  return result;
}

void *client_findbymachport(int a1)
{
  mach_port_name_t v1 = (void *)client_head;
  if (client_head)
  {
    do
    {
      CFIndex v3 = (__CFMachPort *)v1[3];
      if (v3 && CFMachPortGetPort(v3) == a1) {
        break;
      }
      mach_port_name_t v1 = (void *)*v1;
    }

    while (v1);
  }

  return v1;
}

uint64_t ppp_socket_start_server()
{
  int v0 = socket(1, 1, 0);
  if (v0 == -1)
  {
    uint64_t v6 = 1LL;
    SCLog(1LL, 6LL, @"PPPController: initialization failed...");
  }

  else
  {
    int v1 = v0;
    unlink("/var/run/pppconfd");
    sockaddr v12 = (sockaddr)0;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    memset(v17, 0, sizeof(v17));
    v12.int sa_family = 1;
    __strlcpy_chk(v12.sa_data, "/var/run/pppconfd", 104LL, 104LL);
    mode_t v2 = umask(0);
    int v3 = strlen(v12.sa_data);
    int v4 = bind(v1, &v12, v3 + 2);
    umask(v2);
    if (v4)
    {
      uint64_t v5 = 0LL;
    }

    else
    {
      uint64_t v5 = CFSocketCreateWithNative(0LL, v1, 1uLL, (CFSocketCallBack)sub_17840, &v11);
      if (v5)
      {
        CFRunLoopSourceRef RunLoopSource = CFSocketCreateRunLoopSource(0LL, v5, 0LL);
        if (RunLoopSource)
        {
          mach_port_name_t v9 = RunLoopSource;
          CFAbsoluteTime Current = CFRunLoopGetCurrent();
          CFRunLoopAddSource(Current, v9, kCFRunLoopDefaultMode);
          CFRelease(v9);
          listen(v1, 128);
          CFRelease(v5);
          return 0LL;
        }
      }
    }

    uint64_t v6 = 1LL;
    SCLog(1LL, 6LL, @"PPPController: initialization failed...");
    close(v1);
    if (v5)
    {
      CFSocketInvalidate(v5);
      CFRelease(v5);
    }
  }

  return v6;
}

uint64_t sub_17840(__CFSocket *a1)
{
  socklen_t v5 = 106;
  CFSocketNativeHandle Native = CFSocketGetNative(a1);
  uint64_t result = accept(Native, &v6, &v5);
  if ((_DWORD)result != -1)
  {
    int v3 = result;
    socklen_t v5 = 76;
    if (getsockopt(result, 0, 1, v4, &v5) == -1)
    {
      __error();
      return SCLog(1LL, 3LL, @"PPPController: can't get LOCAL_PEERCRED, errno = %d.");
    }

    else
    {
      return ppp_socket_create_client(v3, 0, 0, 0);
    }
  }

  return result;
}

uint64_t ppp_socket_create_client(int a1, int a2, int a3, int a4)
{
  int v8 = fcntl(a1, 3);
  if (v8 == -1 || fcntl(a1, 4, v8 | 4u) == -1)
  {
    __error();
    SCLog(1LL, 6LL, @"Couldn't set client socket in non-blocking mode, errno = %d.");
  }

  mach_port_name_t v9 = CFSocketCreateWithNative(0LL, a1, 1uLL, (CFSocketCallBack)sub_17A48, &context);
  if (v9)
  {
    mach_port_name_t v10 = v9;
    CFRunLoopSourceRef RunLoopSource = CFSocketCreateRunLoopSource(0LL, v9, 0LL);
    if (RunLoopSource)
    {
      sockaddr v12 = RunLoopSource;
      CFAbsoluteTime Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v12, kCFRunLoopDefaultMode);
      CFRelease(v12);
      if (client_new_socket(v10, a2, a3, a4))
      {
        CFRelease(v10);
        return 0LL;
      }
    }

    CFSocketInvalidate(v10);
    CFRelease(v10);
  }

  else
  {
    close(a1);
  }

  return 0xFFFFFFFFLL;
}

void sub_17A48(__CFSocket *a1)
{
  CFSocketNativeHandle Native = CFSocketGetNative(a1);
  int v3 = client_findbysocketref((uint64_t)a1);
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    uint64_t v5 = *((unsigned int *)v3 + 22);
    sockaddr v6 = (__int16 *)(v3 + 12);
    int v7 = readn(Native, (char *)v3 + v5 + 96, 20 - (int)v5);
    if (v7 == -1)
    {
LABEL_25:
      client_dispose(v4);
      return;
    }

    LODWORD(v5) = *(_DWORD *)(v4 + 88) + v7;
    *(_DWORD *)(v4 + 88) = v5;
    if ((_DWORD)v5 == 20)
    {
      int v8 = *(_DWORD *)(v4 + 116);
      if ((v8 & 1) != 0 || (unsigned int v9 = *(unsigned __int16 *)(v4 + 98), v9 < 0x13))
      {
        *(_DWORD *)(v4 + 116) = v8 & 0xFFFFFFDF;
        unsigned int v11 = *(_DWORD *)(v4 + 112);
      }

      else
      {
        *(_DWORD *)(v4 + 116) = v8 | 0x20;
        *(_WORD *)(v4 + 96) = bswap32(*(unsigned __int16 *)(v4 + 96)) >> 16;
        *(_WORD *)(v4 + 98) = __rev16(v9);
        int8x16_t v10 = vrev32q_s8(*(int8x16_t *)(v4 + 100));
        *(int8x16_t *)(v4 + 100) = v10;
        unsigned int v11 = v10.u32[3];
      }

      if (v11 > 0x10000)
      {
        sockaddr v12 = @"Invalid client message header: length %d...";
LABEL_24:
        SCLog(1LL, 3LL, v12);
        goto LABEL_25;
      }

      if (*v6 < 0)
      {
        unsigned int v13 = *(_DWORD *)(v4 + 108);
        if (v13 >= 0x41)
        {
          sockaddr v12 = @"Invalid client message header: service-id %d...";
          goto LABEL_24;
        }
      }

      else
      {
        unsigned int v13 = 0;
      }

      unsigned int v14 = v11 + v13;
      *(_DWORD *)(v4 + 92) = v14 + 20;
      vm_address_t v15 = my_Allocate(v14 + 21);
      *(void *)(v4 + 80) = v15;
      if (!v15)
      {
        sockaddr v12 = @"Failed to allocate client message...";
        goto LABEL_24;
      }

      __int128 v16 = *(_OWORD *)v6;
      *(_DWORD *)(v15 + 16) = *(_DWORD *)(v4 + 112);
      *(_OWORD *)vm_address_t v15 = v16;
      *(_BYTE *)(*(void *)(v4 + 80) + *(unsigned int *)(v4 + 92)) = 0;
      LODWORD(v5) = *(_DWORD *)(v4 + 88);
    }

    if (v5 >= 0x14)
    {
LABEL_18:
      BOOL v17 = (__int16 **)(v4 + 80);
      int v18 = readn(Native, (char *)(*(void *)(v4 + 80) + v5), *(_DWORD *)(v4 + 92) - (int)v5);
      if (v18 == -1)
      {
        sockaddr v12 = @"Failed to read client message...";
        goto LABEL_24;
      }

      int v19 = *(_DWORD *)(v4 + 92);
      int v20 = *(_DWORD *)(v4 + 88) + v18;
      *(_DWORD *)(v4 + 88) = v20;
      if (v20 == v19)
      {
        int v21 = *v17;
        vm_address_t address = 0LL;
        uint64_t v22 = (unsigned __int16)v21[1];
        if (v22 <= 0x12)
        {
          uint64_t v23 = (void (*)(uint64_t, __int16 *, vm_address_t *))requests[v22];
          if (v23) {
            v23(v4, v21, &address);
          }
          goto LABEL_27;
        }

        if ((*(_BYTE *)(v4 + 116) & 1) == 0) {
          goto LABEL_27;
        }
        if ((_DWORD)v22 == 268)
        {
          unint64_t v34 = ppp_find(v21);
          if (*v21 < 0) {
            uint64_t v40 = *((unsigned int *)v21 + 3);
          }
          else {
            uint64_t v40 = 0LL;
          }
          CFTypeID v47 = (char *)v21 + v40;
          uint64_t v48 = *((unsigned int *)v47 + 5);
          uint64_t v49 = *((unsigned int *)v47 + 6);
          *((_DWORD *)v21 + 4) = -1;
          if (v34) {
            ppp_updatephase(v34, v48, v49, v35, v36, v37, v38, v39);
          }
          goto LABEL_27;
        }

        if ((_DWORD)v22 == 267)
        {
          uint64_t v41 = ppp_find(v21);
          if (*v21 < 0) {
            uint64_t v42 = *((unsigned int *)v21 + 3);
          }
          else {
            uint64_t v42 = 0LL;
          }
          int v50 = (char *)v21 + v42;
          int v51 = *((_DWORD *)v50 + 5);
          int v52 = *((_DWORD *)v50 + 6);
          *((_DWORD *)v21 + 4) = -1;
          if (v41) {
            ppp_updatestatus(v41, v51, v52);
          }
          goto LABEL_27;
        }

        if ((_DWORD)v22 != 266
          || ((uint64_t v31 = ppp_find(v21), v32 = (void *)v31, *v21 < 0) ? (v33 = *((unsigned int *)v21 + 3)) : (v33 = 0LL),
              CFRange v43 = (char *)v21 + v33,
              unsigned int v44 = *((_DWORD *)v43 + 5),
              unsigned int v45 = *((_DWORD *)v43 + 6),
              *((_DWORD *)v21 + 4) = -1,
              !v31))
        {
LABEL_27:
          signed int v24 = *v21;
          uint64_t v25 = *(void *)(v21 + 6);
          if ((*(_BYTE *)(v4 + 116) & 0x20) != 0)
          {
            *int v21 = bswap32(v24) >> 16;
            v21[1] = bswap32((unsigned __int16)v21[1]) >> 16;
            v26.i64[0] = *(void *)(v21 + 2);
            v26.i64[1] = v25;
            *(int8x16_t *)(v21 + 2) = vrev32q_s8(v26);
          }

          size_t v27 = HIDWORD(v25);
          if (HIDWORD(v25) != -1)
          {
            int v57 = v25;
            CFSocketNativeHandle v28 = CFSocketGetNative(*(CFSocketRef *)(v4 + 16));
            if (v24 < 0) {
              size_t v29 = (v57 + 20);
            }
            else {
              size_t v29 = 20LL;
            }
            writen(v28, (char *)v21, v29);
            if ((_DWORD)v27)
            {
              CFSocketNativeHandle v30 = CFSocketGetNative(*(CFSocketRef *)(v4 + 16));
              writen(v30, (char *)address, v27);
              my_Deallocate(address, v27);
            }
          }

          my_Deallocate(*(void *)(v4 + 80), *(_DWORD *)(v4 + 92) + 1);
          char *v17 = 0LL;
          *(void *)(v4 + 88) = 0LL;
          return;
        }

        if (v44 != 23)
        {
          if (v44 == 22)
          {
            uint64_t v53 = *(void *)(v31 + 584);
            if (v53) {
              ne_sm_bridge_request_install(v53);
            }
            goto LABEL_64;
          }

          if (v44 != 1)
          {
            unsigned int v45 = 0;
LABEL_64:
            CFMutableArrayRef v54 = (const __CFString *)v32[3];
            CFMutableArrayRef v55 = (char *)v32[7];
            unsigned int v56 = makeref((uint64_t)v32);
            ppp_getstatus((uint64_t)v32);
            client_notify(v54, v55, v56, v44, v45, 4);
            goto LABEL_27;
          }

          unsigned int v45 = ppp_translate_error(*(unsigned __int16 *)(v31 + 66), v45, 0);
        }

        uint64_t v46 = v32[73];
        if (v46) {
          ne_sm_bridge_request_uninstall(v46);
        }
        goto LABEL_64;
      }
    }
  }

uint64_t readn(int a1, char *a2, int a3)
{
  LODWORD(v4) = a3;
  if (a3 < 1) {
    return (a3 - v4);
  }
  int64_t v4 = a3;
  int v7 = 10;
  while (1)
  {
    ssize_t v8 = read(a1, a2, v4);
    if ((v8 & 0x8000000000000000LL) == 0) {
      break;
    }
    __error();
    SCLog(1LL, 3LL, @"PPPController: readn, retry %d, errno %d.");
    if (*__error() == 35)
    {
      if (!v7) {
        return (a3 - v4);
      }
      --v7;
      if (!usleep(0x9C40u)) {
        continue;
      }
    }

    if (*__error() != 4) {
      return 0xFFFFFFFFLL;
    }
    ssize_t v8 = 0LL;
LABEL_10:
    a2 += v8;
    BOOL v9 = v4 <= v8;
    v4 -= v8;
    if (v9) {
      return (a3 - v4);
    }
  }

  if (v8) {
    goto LABEL_10;
  }
  return 0xFFFFFFFFLL;
}

size_t writen(int __fd, char *__buf, size_t __nbyte)
{
  size_t v3 = __nbyte;
  if ((int)__nbyte >= 1)
  {
    int64_t v6 = __nbyte;
    int v7 = 10;
    while (1)
    {
      ssize_t v8 = write(__fd, __buf, v6);
      if (v8 > 0) {
        goto LABEL_9;
      }
      __error();
      SCLog(1LL, 3LL, @"PPPController writen: retry %d, errno %d.");
      if (*__error() == 35)
      {
        if (!v7) {
          return (v3 - v6);
        }
        --v7;
        if (!usleep(0x9C40u)) {
          continue;
        }
      }

      if (*__error() != 4) {
        return 0xFFFFFFFFLL;
      }
      ssize_t v8 = 0LL;
LABEL_9:
      __buf += v8;
      BOOL v9 = v6 <= v8;
      v6 -= v8;
      if (v9) {
        return v3;
      }
    }
  }

  return v3;
}

_DWORD *sub_18040(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = (_DWORD *)my_Allocate(4);
  *a3 = result;
  if (result)
  {
    *(_DWORD *)(a2 + 4) = 0;
    *(_DWORD *)(a2 + 16) = 4;
    _DWORD *result = 1;
    if ((*(_DWORD *)(a1 + 116) & 0x20) != 0) {
      int v7 = 0x1000000;
    }
    else {
      int v7 = 1;
    }
    _DWORD *result = v7;
  }

  else
  {
    *(_DWORD *)(a2 + 4) = 12;
    *(_DWORD *)(a2 + 16) = 0;
  }

  return result;
}

uint64_t sub_180B4(uint64_t a1, uint64_t a2, int8x16_t **a3)
{
  uint64_t result = ppp_find((__int16 *)a2);
  if (result)
  {
    uint64_t result = ppp_getstatus1(result, (vm_address_t *)a3, &v10);
    if ((_DWORD)result)
    {
      int v7 = 0;
      *(_DWORD *)(a2 + 4) = result;
    }

    else
    {
      if ((*(_BYTE *)(a1 + 116) & 0x20) != 0)
      {
        vm_address_t v8 = (vm_address_t)*a3;
        int8x16_t v9 = vrev32q_s8((*a3)[1]);
        *(int8x16_t *)vm_address_t v8 = vrev32q_s8(**a3);
        *(int8x16_t *)(v8 + 16) = v9;
        *(_DWORD *)(v8 + 32) = bswap32(*(_DWORD *)(v8 + 32));
      }

      *(_DWORD *)(a2 + 4) = 0;
      int v7 = v10;
    }
  }

  else
  {
    int v7 = 0;
    *(_DWORD *)(a2 + 4) = 19;
  }

  *(_DWORD *)(a2 + 16) = v7;
  return result;
}

void sub_18154(uint64_t a1, __int16 *a2)
{
  if (*a2 < 0) {
    uint64_t v4 = *((unsigned int *)a2 + 3);
  }
  else {
    uint64_t v4 = 0LL;
  }
  uint64_t v5 = ppp_find(a2);
  if (v5)
  {
    unint64_t v6 = v5;
    CFIndex v7 = *((unsigned int *)a2 + 4);
    if (!(_DWORD)v7)
    {
      int8x16_t v9 = client_findoptset(a1, *(CFStringRef *)(v5 + 24));
LABEL_11:
      unsigned int v12 = (unsigned __int16)*a2;
      if ((v12 & 1) != 0) {
        uint64_t v13 = a1;
      }
      else {
        uint64_t v13 = 0LL;
      }
      *((_DWORD *)a2 + 1) = scnc_start( v6,  (const __CFDictionary *)v9,  v13,  (v12 >> 1) & 1,  *(unsigned int *)(a1 + 64),  *(unsigned int *)(a1 + 68),  *(_DWORD *)(a1 + 72),  0LL,  0);
      if (v9)
      {
        if (*((_DWORD *)a2 + 4)) {
          CFRelease(v9);
        }
      }

      goto LABEL_19;
    }

    vm_address_t v8 = Unserialize((UInt8 *)a2 + v4 + 20, v7);
    if (v8)
    {
      int8x16_t v9 = (uint64_t *)v8;
      CFTypeID v10 = CFGetTypeID(v8);
      if (v10 != CFDictionaryGetTypeID())
      {
        *((_DWORD *)a2 + 1) = 12;
        *((_DWORD *)a2 + 4) = 0;
        CFRelease(v9);
        return;
      }

      goto LABEL_11;
    }

    int v11 = 12;
  }

  else
  {
    int v11 = 19;
  }

  *((_DWORD *)a2 + 1) = v11;
LABEL_19:
  *((_DWORD *)a2 + 4) = 0;
}

uint64_t sub_18274(uint64_t a1, uint64_t a2)
{
  uint64_t result = ppp_find((__int16 *)a2);
  if (result)
  {
    if ((*(_WORD *)a2 & 1) == 0 || a1 == 0) {
      int v6 = 6;
    }
    else {
      int v6 = 5;
    }
    uint64_t result = scnc_stop(result, a1, 1LL, v6);
    int v7 = 0;
  }

  else
  {
    int v7 = 19;
  }

  *(_DWORD *)(a2 + 4) = v7;
  *(_DWORD *)(a2 + 16) = 0;
  return result;
}

vm_address_t sub_182D4(uint64_t a1, __int16 *a2, uint64_t a3)
{
  if (*a2 < 0) {
    uint64_t v6 = *((unsigned int *)a2 + 3);
  }
  else {
    uint64_t v6 = 0LL;
  }
  vm_address_t result = ppp_find(a2);
  if (!result)
  {
    *((_DWORD *)a2 + 4) = 0;
    int v11 = 19;
LABEL_19:
    *((_DWORD *)a2 + 1) = v11;
    return result;
  }

  uint64_t v8 = result;
  int8x16_t v9 = (unsigned int *)((char *)a2 + v6 + 20);
  if ((*(_BYTE *)(a1 + 116) & 0x20) != 0) {
    unsigned int *v9 = bswap32(*v9);
  }
  if (*(_DWORD *)(result + 628)) {
    CFTypeID v10 = *(uint64_t **)(result + 128);
  }
  else {
    CFTypeID v10 = client_findoptset(a1, *(CFStringRef *)(result + 24));
  }
  vm_address_t result = ppp_getoptval(v8, (CFDictionaryRef)v10, 0LL, *v9, (char *)__len_4, 0x101u, &__len);
  if (!(_DWORD)result)
  {
    *((_DWORD *)a2 + 4) = 0;
    int v11 = 102;
    goto LABEL_19;
  }

  vm_address_t result = my_Allocate(__len + 4);
  *(void *)a3 = result;
  if (result)
  {
    if ((*(_BYTE *)(a1 + 116) & 0x20) != 0 && *v9 <= 0x20 && ((1LL << *v9) & 0x191FDFE54LL) != 0) {
      __len_4[0] = bswap32(__len_4[0]);
    }
    *(_DWORD *)vm_address_t result = *v9;
    vm_address_t result = (vm_address_t)memmove((void *)(*(void *)a3 + 4LL), __len_4, __len);
    *((_DWORD *)a2 + 1) = 0;
    *((_DWORD *)a2 + 4) = __len + 4;
  }

  else
  {
    *((_DWORD *)a2 + 1) = 12;
    *((_DWORD *)a2 + 4) = 0;
  }

  return result;
}

void sub_18464(uint64_t a1, __int16 *a2)
{
  if (*a2 < 0) {
    unsigned int v4 = *((_DWORD *)a2 + 3);
  }
  else {
    unsigned int v4 = 0;
  }
  uint64_t v5 = (char *)a2 + v4;
  unsigned int v8 = *((_DWORD *)v5 + 6);
  uint64_t v6 = v5 + 24;
  unsigned int v7 = v8;
  int v9 = *((_DWORD *)a2 + 4);
  uint64_t v10 = ppp_find(a2);
  if (!v10)
  {
    LODWORD(v14) = 19;
    goto LABEL_69;
  }

  uint64_t v11 = v10;
  unsigned int v12 = (unsigned int *)(v6 - 4);
  if ((*(_BYTE *)(a1 + 116) & 0x20) != 0)
  {
    *unsigned int v12 = bswap32(*v12);
    unsigned int v7 = bswap32(v7);
  }

  uint64_t v13 = (const __CFDictionary *)client_findoptset(a1, *(CFStringRef *)(v10 + 24));
  if (!v13)
  {
    uint64_t v13 = client_newoptset(a1, *(const void **)(v11 + 24));
    if (!v13)
    {
      LODWORD(v14) = 12;
      goto LABEL_69;
    }
  }

  LODWORD(v14) = 102;
  switch(*v12)
  {
    case 1u:
      CFStringRef v15 = kSCEntNetInterface;
      __int128 v16 = (const void **)&kSCPropNetInterfaceDeviceName;
      goto LABEL_67;
    case 2u:
      uint64_t v17 = 2400LL;
      uint64_t v18 = 9600LL;
      uint64_t v19 = 19200LL;
      uint64_t v20 = 38400LL;
      uint64_t v21 = 115200LL;
      if (v7 < 0xE101) {
        uint64_t v21 = 57600LL;
      }
      if (v7 >= 0x9601) {
        uint64_t v20 = v21;
      }
      if (v7 >= 0x4B01) {
        uint64_t v19 = v20;
      }
      if (v7 >= 0x2581) {
        uint64_t v18 = v19;
      }
      if (v7 >= 0x961) {
        uint64_t v17 = v18;
      }
      if (v7 >= 0x4B1) {
        unint64_t v22 = v17;
      }
      else {
        unint64_t v22 = 1200LL;
      }
      CFStringRef v23 = kSCEntNetModem;
      CFStringRef v24 = kSCPropNetModemSpeed;
      uint64_t v25 = v13;
      unint64_t v26 = 0xFFFFFFFFLL;
      uint64_t v27 = 0LL;
      goto LABEL_56;
    case 3u:
      CFStringRef v15 = kSCEntNetModem;
      __int128 v16 = (const void **)&kSCPropNetModemConnectionScript;
      goto LABEL_67;
    case 4u:
      CFStringRef v28 = kSCEntNetPPP;
      unint64_t v29 = v7;
      LODWORD(v14) = 1;
      CFSocketNativeHandle v30 = &kSCPropNetPPPDisconnectOnIdle;
      goto LABEL_59;
    case 5u:
      CFStringRef v15 = kSCEntNetPPP;
      __int128 v16 = (const void **)&kSCPropNetPPPCommRemoteAddress;
      goto LABEL_67;
    case 6u:
      CFStringRef v31 = 0LL;
      CFStringRef v32 = @"None";
      switch(v7)
      {
        case 0u:
          goto LABEL_87;
        case 1u:
          LODWORD(v14) = 0;
          CFStringRef v31 = kSCValNetPPPAuthProtocolPAP;
          goto LABEL_85;
        case 2u:
          LODWORD(v14) = 0;
          CFStringRef v48 = 0LL;
          CFStringRef v31 = kSCValNetPPPAuthProtocolPAP;
          break;
        case 3u:
          LODWORD(v14) = 0;
          CFStringRef v31 = 0LL;
LABEL_85:
          CFStringRef v48 = kSCValNetPPPAuthProtocolCHAP;
          break;
        default:
          LODWORD(v14) = 22;
          CFStringRef v48 = 0LL;
          break;
      }

      CFStringRef v32 = v31;
      CFStringRef v31 = v48;
LABEL_87:
      unsigned int v44 = sub_195DC(v13, kSCEntNetPPP, kSCPropNetPPPAuthProtocol, v32, v31);
      goto LABEL_68;
    case 7u:
      CFStringRef v15 = kSCEntNetPPP;
      __int128 v16 = (const void **)&kSCPropNetPPPAuthName;
      goto LABEL_67;
    case 8u:
      CFStringRef v15 = kSCEntNetPPP;
      __int128 v16 = (const void **)&kSCPropNetPPPAuthPassword;
      goto LABEL_67;
    case 9u:
      LODWORD(v14) = 1;
      CFStringRef v33 = kSCPropNetPPPLCPCompressionACField;
      unint64_t v34 = v7 & 1;
      uint64_t v35 = v13;
      CFStringRef v36 = kSCEntNetPPP;
      goto LABEL_60;
    case 0xAu:
      CFStringRef v23 = kSCEntNetPPP;
      uint64_t v37 = &kSCPropNetPPPLCPMRU;
      goto LABEL_53;
    case 0xBu:
      CFStringRef v23 = kSCEntNetPPP;
      uint64_t v37 = &kSCPropNetPPPLCPMTU;
      goto LABEL_53;
    case 0xCu:
      CFStringRef v23 = kSCEntNetPPP;
      uint64_t v37 = &kSCPropNetPPPLCPReceiveACCM;
      goto LABEL_53;
    case 0xDu:
      CFStringRef v23 = kSCEntNetPPP;
      uint64_t v37 = &kSCPropNetPPPLCPTransmitACCM;
      goto LABEL_53;
    case 0xEu:
      CFStringRef v23 = kSCEntNetPPP;
      CFStringRef v24 = kSCPropNetPPPIPCPCompressionVJ;
      unint64_t v22 = v7;
      uint64_t v25 = v13;
      unint64_t v26 = 1LL;
      goto LABEL_55;
    case 0xFu:
      CFStringRef v38 = CFStringCreateWithFormat( 0LL,  0LL,  @"%d.%d.%d.%d",  HIBYTE(v7),  BYTE2(v7),  BYTE1(v7),  v7);
      if (!v38) {
        goto LABEL_77;
      }
      CFStringRef v39 = v38;
      CFStringRef v40 = kSCEntNetIPv4;
      uint64_t v41 = (const void **)&kSCPropNetIPv4Addresses;
      goto LABEL_46;
    case 0x10u:
      CFStringRef v42 = CFStringCreateWithFormat( 0LL,  0LL,  @"%d.%d.%d.%d",  HIBYTE(v7),  BYTE2(v7),  BYTE1(v7),  v7);
      if (!v42) {
        goto LABEL_77;
      }
      CFStringRef v39 = v42;
      CFStringRef v40 = kSCEntNetIPv4;
      uint64_t v41 = (const void **)&kSCPropNetIPv4DestAddresses;
LABEL_46:
      LODWORD(v14) = sub_195DC(v13, v40, *v41, v39, 0LL);
      CFRelease(v39);
      goto LABEL_69;
    case 0x13u:
      CFStringRef v28 = kSCEntNetPPP;
      unint64_t v29 = v7;
      LODWORD(v14) = 1;
      CFSocketNativeHandle v30 = &kSCPropNetPPPIdleReminder;
      goto LABEL_59;
    case 0x14u:
      CFStringRef v23 = kSCEntNetPPP;
      unint64_t v22 = v7;
      CFStringRef v24 = @"AlertEnable";
      goto LABEL_54;
    case 0x15u:
      LODWORD(v14) = 1;
      if (sub_194EC( v13,  kSCEntNetPPP,  kSCPropNetPPPLCPEchoInterval,  *(unsigned __int16 *)v6,  0xFFFFFFFFuLL,  1LL)) {
        goto LABEL_69;
      }
      CFStringRef v33 = kSCPropNetPPPLCPEchoFailure;
      unint64_t v34 = *((unsigned __int16 *)v6 + 1);
      uint64_t v35 = v13;
      CFStringRef v36 = kSCEntNetPPP;
      unint64_t v43 = 0xFFFFFFFFLL;
      goto LABEL_61;
    case 0x16u:
      CFStringRef v23 = kSCEntNetPPP;
      uint64_t v37 = &kSCPropNetPPPCommConnectDelay;
LABEL_53:
      CFStringRef v24 = *v37;
      unint64_t v22 = v7;
LABEL_54:
      uint64_t v25 = v13;
      unint64_t v26 = 0xFFFFFFFFLL;
LABEL_55:
      uint64_t v27 = 1LL;
LABEL_56:
      unsigned int v44 = sub_194EC(v25, v23, v24, v22, v26, v27);
      goto LABEL_68;
    case 0x17u:
      CFStringRef v28 = kSCEntNetPPP;
      unint64_t v29 = v7;
      LODWORD(v14) = 1;
      CFSocketNativeHandle v30 = &kSCPropNetPPPUseSessionTimer;
LABEL_59:
      CFStringRef v33 = *v30;
      uint64_t v35 = v13;
      CFStringRef v36 = v28;
      unint64_t v34 = v29;
      goto LABEL_60;
    case 0x18u:
      switch(v7)
      {
        case 2u:
          LODWORD(v14) = 1;
          CFStringRef v33 = kSCPropNetPPPCommDisplayTerminalWindow;
          uint64_t v35 = v13;
          CFStringRef v36 = kSCEntNetPPP;
          unint64_t v34 = 1LL;
LABEL_60:
          unint64_t v43 = 1LL;
LABEL_61:
          LODWORD(v14) = sub_194EC(v35, v36, v33, v34, v43, 1LL) != 0;
          goto LABEL_69;
        case 1u:
          LODWORD(v14) = 1;
          CFStringRef v33 = kSCPropNetPPPCommDisplayTerminalWindow;
          uint64_t v35 = v13;
          CFStringRef v36 = kSCEntNetPPP;
          unint64_t v34 = 0LL;
          goto LABEL_60;
        case 0u:
          sub_19580(v13, kSCEntNetPPP, kSCPropNetPPPCommDisplayTerminalWindow);
          sub_19580(v13, kSCEntNetPPP, kSCPropNetPPPCommUseTerminalScript);
          break;
      }

LABEL_77:
      LODWORD(v14) = 0;
LABEL_69:
      *((_DWORD *)a2 + 1) = (_DWORD)v14;
      *((_DWORD *)a2 + 4) = 0;
      return;
    case 0x19u:
      CFStringRef v15 = kSCEntNetPPP;
      __int128 v16 = (const void **)&kSCPropNetPPPCommTerminalScript;
LABEL_67:
      unsigned int v44 = sub_1944C(v13, v15, *v16, v6, v9 - 4, 0LL);
LABEL_68:
      LODWORD(v14) = v44;
      goto LABEL_69;
    case 0x1Fu:
      unsigned int v45 = &kSCValNetModemDialModeIgnoreDialTone;
      uint64_t v46 = &kSCValNetModemDialModeManual;
      if (v7 != 2) {
        uint64_t v46 = &kSCValNetModemDialModeWaitForDialTone;
      }
      if (v7 != 1) {
        unsigned int v45 = v46;
      }
      CFStringRef v14 = *v45;
      if (!*v45) {
        goto LABEL_69;
      }
      CFTypeID v47 = sub_1967C(v13, kSCEntNetModem, kSCPropNetModemDialMode);
      if (v47) {
        CFDictionaryAddValue(v47, kSCPropNetModemDialMode, v14);
      }
      goto LABEL_77;
    default:
      goto LABEL_69;
  }

void sub_18BD8(uint64_t a1, __int16 *a2)
{
  if (*((_DWORD *)a2 + 4) == 4)
  {
    if (*a2 < 0) {
      uint64_t v4 = *((unsigned int *)a2 + 3);
    }
    else {
      uint64_t v4 = 0LL;
    }
    unsigned int v6 = *(_DWORD *)((char *)a2 + v4 + 20);
    int v5 = *(_DWORD *)(a1 + 116);
    unsigned int v7 = bswap32(v6);
    if ((v5 & 0x20) != 0) {
      unsigned int v6 = v7;
    }
    if (v6 - 4 <= 0xFFFFFFFC)
    {
      int v8 = 22;
LABEL_17:
      *((_DWORD *)a2 + 1) = v8;
      goto LABEL_18;
    }
  }

  else
  {
    int v5 = *(_DWORD *)(a1 + 116);
    LOBYTE(v6) = 1;
  }

  *((_DWORD *)a2 + 1) = 0;
  *(_DWORD *)(a1 + 116) = v5 & 0xFFFFFFF3 | (4 * (v6 & 3));
  *(_DWORD *)(a1 + 128) = 0;
  int v9 = *(void **)(a1 + 120);
  if (v9)
  {
    free(v9);
    *(void *)(a1 + 120) = 0LL;
  }

  size_t v10 = *((unsigned int *)a2 + 3);
  if (*a2 < 0)
  {
    uint64_t v11 = (char *)malloc((v10 + 1));
    *(void *)(a1 + 120) = v11;
    if (!v11)
    {
      int v8 = 12;
      goto LABEL_17;
    }

    strncpy(v11, (const char *)a2 + 20, v10);
    *(_BYTE *)(*(void *)(a1 + 120) + *((unsigned int *)a2 + 3)) = 0;
  }

  else
  {
    *(_DWORD *)(a1 + 128) = v10;
  }

void sub_18CC4(uint64_t a1, _DWORD *a2)
{
  if (a2[4] != 4)
  {
    int v5 = *(_DWORD *)(a1 + 116);
    LOBYTE(v6) = 1;
LABEL_5:
    v5 &= ~4u;
    *(_DWORD *)(a1 + 116) = v5;
    goto LABEL_6;
  }

  else {
    uint64_t v4 = 0LL;
  }
  unsigned int v6 = *(_DWORD *)((char *)a2 + v4 + 20);
  int v5 = *(_DWORD *)(a1 + 116);
  unsigned int v10 = bswap32(v6);
  if ((v5 & 0x20) != 0) {
    unsigned int v6 = v10;
  }
  if (v6 - 4 < 0xFFFFFFFD)
  {
    int v9 = 22;
    goto LABEL_18;
  }

  if ((v6 & 1) != 0) {
    goto LABEL_5;
  }
LABEL_6:
  if ((v6 & 2) != 0)
  {
    unsigned int v7 = v5 & 0xFFFFFFF7;
    *(_DWORD *)(a1 + 116) = v7;
    if ((v7 & 8) != 0)
    {
LABEL_12:
      int v9 = 0;
      goto LABEL_18;
    }
  }

  else if ((v5 & 8) != 0)
  {
    goto LABEL_12;
  }

  *(_DWORD *)(a1 + 128) = 0;
  int v8 = *(void **)(a1 + 120);
  if (!v8) {
    goto LABEL_12;
  }
  free(v8);
  int v9 = 0;
  *(void *)(a1 + 120) = 0LL;
LABEL_18:
  a2[1] = v9;
  a2[4] = 0;
}

_DWORD *sub_18D88(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = service_head;
  if (service_head)
  {
    unsigned int v7 = 0;
    int v8 = *(unsigned __int16 *)(a2 + 14);
    do
    {
      uint64_t v6 = *(void *)v6;
    }

    while (v6);
  }

  else
  {
    unsigned int v7 = 0;
  }

  vm_address_t result = (_DWORD *)my_Allocate(4);
  *a3 = result;
  if (result)
  {
    *(_DWORD *)(a2 + 4) = 0;
    *(_DWORD *)(a2 + 16) = 4;
    _DWORD *result = v7;
    if ((*(_BYTE *)(a1 + 116) & 0x20) != 0) {
      _DWORD *result = bswap32(v7);
    }
  }

  else
  {
    *(_DWORD *)(a2 + 4) = 12;
    *(_DWORD *)(a2 + 16) = 0;
  }

  return result;
}

vm_address_t sub_18E40(vm_address_t result, uint64_t a2, vm_address_t *a3)
{
  unsigned int v4 = *(_DWORD *)(a2 + 20);
  unsigned int v5 = bswap32(v4);
  if ((*(_BYTE *)(result + 116) & 0x20) != 0) {
    unsigned int v4 = v5;
  }
  uint64_t v6 = service_head;
  if (!service_head)
  {
LABEL_10:
    int v11 = 0;
    int v12 = 19;
    goto LABEL_11;
  }

  vm_address_t v8 = result;
  int v9 = 0;
  int v10 = *(unsigned __int16 *)(a2 + 14);
  while (1)
  {
    if (v9 == v4) {
      break;
    }
    ++v9;
LABEL_9:
    uint64_t v6 = *(void *)v6;
    if (!v6) {
      goto LABEL_10;
    }
  }

  vm_address_t result = my_Allocate(4);
  *a3 = result;
  if (result)
  {
    vm_address_t result = makeref(v6);
    uint64_t v13 = (_DWORD *)*a3;
    *(_DWORD *)*a3 = result;
    int v12 = 0;
    if ((*(_BYTE *)(v8 + 116) & 0x20) != 0) {
      _DWORD *v13 = bswap32(result);
    }
    int v11 = 4;
  }

  else
  {
    int v11 = 0;
    int v12 = 12;
  }

void sub_18F24(uint64_t a1, uint64_t a2, vm_address_t *a3)
{
  uint64_t v6 = (const char *)(a2 + 20);
  v6[*(unsigned int *)(a2 + 16)] = 0;
  unsigned int v7 = CFStringCreateWithCString(0LL, v6, 0x8000100u);
  if (v7)
  {
    vm_address_t v8 = v7;
    int v9 = findbyserviceID(v7);
    if (v9)
    {
      uint64_t v10 = (uint64_t)v9;
      vm_address_t v11 = my_Allocate(4);
      *a3 = v11;
      if (v11)
      {
        unsigned int v12 = makeref(v10);
        uint64_t v13 = (_DWORD *)*a3;
        *(_DWORD *)*a3 = v12;
        int v14 = 0;
        if ((*(_BYTE *)(a1 + 116) & 0x20) != 0) {
          _DWORD *v13 = bswap32(v12);
        }
        int v15 = 4;
      }

      else
      {
        int v15 = 0;
        int v14 = 12;
      }
    }

    else
    {
      int v15 = 0;
      int v14 = 19;
    }

    CFRelease(v8);
  }

  else
  {
    int v15 = 0;
    int v14 = 12;
  }

  *(_DWORD *)(a2 + 4) = v14;
  *(_DWORD *)(a2 + 16) = v15;
}

vm_address_t sub_18FFC(vm_address_t result, __int16 *a2, vm_address_t *a3)
{
  vm_address_t v5 = result;
  uint64_t v6 = (const char *)(a2 + 10);
  unsigned int v7 = &service_head;
  do
  {
    unsigned int v7 = (uint64_t *)*v7;
    if (!v7)
    {
      unsigned int v10 = 0;
      int v9 = 19;
      goto LABEL_14;
    }

    vm_address_t result = strncmp((const char *)v7 + 104, v6, 0x10uLL);
  }

  while ((_DWORD)result);
  if (*a2 < 0)
  {
    int v11 = strlen((const char *)v7[7]);
    vm_address_t result = my_Allocate(v11);
    *a3 = result;
    if (result)
    {
      unsigned int v12 = (void *)result;
      uint64_t v13 = (const char *)v7[7];
      unsigned int v10 = strlen(v13);
      vm_address_t result = (vm_address_t)memmove(v12, v13, v10);
      int v9 = 0;
      goto LABEL_14;
    }

uint64_t sub_19100(uint64_t a1, uint64_t a2)
{
  uint64_t result = ppp_find((__int16 *)a2);
  if (result)
  {
    uint64_t result = ppp_suspend(result);
    int v4 = 0;
  }

  else
  {
    int v4 = 19;
  }

  *(_DWORD *)(a2 + 4) = v4;
  *(_DWORD *)(a2 + 16) = 0;
  return result;
}

uint64_t sub_19140(uint64_t a1, uint64_t a2)
{
  uint64_t result = ppp_find((__int16 *)a2);
  if (result)
  {
    uint64_t result = ppp_resume(result);
    int v4 = 0;
  }

  else
  {
    int v4 = 19;
  }

  *(_DWORD *)(a2 + 4) = v4;
  *(_DWORD *)(a2 + 16) = 0;
  return result;
}

void sub_19180(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = ppp_find((__int16 *)a2);
  LODWORD(__len) = 0;
  CFTypeRef cf = 0LL;
  if (v5)
  {
    int v6 = ppp_copyextendedstatus(v5, &cf);
    unsigned int v7 = 0LL;
    int v8 = 0;
    CFTypeRef v9 = cf;
    if (!v6 && cf)
    {
      __src = 0LL;
      unsigned int v7 = Serialize(cf, (const UInt8 **)&__src, &__len);
      if (v7 && (unsigned int v10 = (void *)my_Allocate(__len), (*a3 = v10) != 0LL))
      {
        memmove(v10, __src, __len);
        int v6 = 0;
      }

      else
      {
        int v6 = 12;
      }

      int v8 = (unsigned __int16)__len;
      CFTypeRef v9 = cf;
    }

    *(_DWORD *)(a2 + 4) = v6;
    if (v6) {
      int v11 = 0;
    }
    else {
      int v11 = v8;
    }
    *(_DWORD *)(a2 + 16) = v11;
    if (v9) {
      CFRelease(v9);
    }
    if (v7) {
      CFRelease(v7);
    }
  }

  else
  {
    *(_DWORD *)(a2 + 4) = 19;
    *(_DWORD *)(a2 + 16) = 0;
  }

void sub_19260(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = ppp_find((__int16 *)a2);
  LODWORD(__len) = 0;
  CFTypeRef cf = 0LL;
  if (v5)
  {
    int v6 = ppp_getconnectdata(v5, &cf, 0);
    unsigned int v7 = 0LL;
    int v8 = 0;
    CFTypeRef v9 = cf;
    if (!v6 && cf)
    {
      __src = 0LL;
      unsigned int v7 = Serialize(cf, (const UInt8 **)&__src, &__len);
      if (v7 && (unsigned int v10 = (void *)my_Allocate(__len), (*a3 = v10) != 0LL))
      {
        memmove(v10, __src, __len);
        int v6 = 0;
      }

      else
      {
        int v6 = 12;
      }

      int v8 = (unsigned __int16)__len;
      CFTypeRef v9 = cf;
    }

    *(_DWORD *)(a2 + 4) = v6;
    if (v6) {
      int v11 = 0;
    }
    else {
      int v11 = v8;
    }
    *(_DWORD *)(a2 + 16) = v11;
    if (v9) {
      CFRelease(v9);
    }
    if (v7) {
      CFRelease(v7);
    }
  }

  else
  {
    *(_DWORD *)(a2 + 4) = 19;
    *(_DWORD *)(a2 + 16) = 0;
  }

uint64_t ppp_find(__int16 *a1)
{
  if (*a1 < 0) {
    return findbysid((const char *)a1 + 20, *((_DWORD *)a1 + 3));
  }
  else {
    return findbyref(0, *((_DWORD *)a1 + 3));
  }
}

uint64_t socket_client_notify( __CFSocket *a1, char *__s, unsigned int a3, unsigned int a4, unsigned int a5, char a6)
{
  int __buf = 655360;
  int v20 = 0;
  unsigned int __buf_4 = a4;
  unint64_t v19 = __PAIR64__(a3, a5);
  if (__s)
  {
    LOWORD(__buf) = 0x8000;
    size_t v11 = strlen(__s);
    a3 = v11;
    HIDWORD(v19) = v11;
    __int16 v12 = 128;
    size_t v13 = v11;
    if ((a6 & 0x20) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  __int16 v12 = 0;
  size_t v13 = 0LL;
  if ((a6 & 0x20) != 0)
  {
LABEL_3:
    LOWORD(__buf) = v12;
    HIWORD(__buf) = 2560;
    unsigned int __buf_4 = bswap32(a4);
    unint64_t v19 = _byteswap_uint64(__PAIR64__(a5, a3));
    int v20 = 0;
  }

CFStringRef sub_1944C( const __CFDictionary *a1, const void *a2, const void *a3, const char *a4, int a5, const void *a6)
{
  unsigned int v10 = sub_1967C(a1, a2, a3);
  if (!v10) {
    return (CFStringRef)&dword_C;
  }
  size_t v11 = v10;
  if (a6)
  {
    CFDictionaryAddValue(v10, a3, a6);
  }

  else
  {
    a4[a5] = 0;
    CFStringRef result = CFStringCreateWithCString(0LL, a4, 0x8000100u);
    if (!result) {
      return result;
    }
    CFStringRef v13 = result;
    CFDictionaryAddValue(v11, a3, result);
    CFRelease(v13);
  }

  return 0LL;
}

CFNumberRef sub_194EC( const __CFDictionary *a1, const void *a2, const void *a3, unint64_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t valuePtr = a4;
  if (a4 > a5)
  {
    if (!a6) {
      return (CFNumberRef)(&dword_14 + 2);
    }
    unint64_t valuePtr = a5;
  }

  CFMutableDictionaryRef v7 = sub_1967C(a1, a2, a3);
  if (!v7) {
    return (CFNumberRef)&dword_C;
  }
  int v8 = v7;
  CFNumberRef result = CFNumberCreate(0LL, kCFNumberLongType, &valuePtr);
  if (result)
  {
    CFNumberRef v10 = result;
    CFDictionaryAddValue(v8, a3, result);
    CFRelease(v10);
    return 0LL;
  }

  return result;
}

void sub_19580(const __CFDictionary *a1, const void *a2, const void *a3)
{
  CFPropertyListRef Value = (__CFDictionary *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    uint64_t v5 = Value;
    CFTypeID v6 = CFGetTypeID(Value);
    if (v6 == CFDictionaryGetTypeID()) {
      CFDictionaryRemoveValue(v5, a3);
    }
  }

uint64_t sub_195DC(const __CFDictionary *a1, const void *a2, const void *a3, const void *a4, const void *a5)
{
  CFMutableDictionaryRef v8 = sub_1967C(a1, a2, a3);
  if (!v8) {
    return 12LL;
  }
  CFTypeRef v9 = v8;
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  if (!Mutable) {
    return 12LL;
  }
  size_t v11 = Mutable;
  if (a4) {
    CFArrayAppendValue(Mutable, a4);
  }
  if (a5) {
    CFArrayAppendValue(v11, a5);
  }
  CFDictionaryAddValue(v9, a3, v11);
  CFRelease(v11);
  return 0LL;
}

CFMutableDictionaryRef sub_1967C(const __CFDictionary *a1, const void *a2, const void *a3)
{
  CFPropertyListRef Value = (__CFDictionary *)CFDictionaryGetValue(a1, a2);
  if (!Value)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFCopyStringDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    if (!Mutable) {
      return Mutable;
    }
    CFDictionaryAddValue(a1, a2, Mutable);
    CFRelease(Mutable);
LABEL_6:
    CFDictionaryRemoveValue(Mutable, a3);
    return Mutable;
  }

  CFMutableDictionaryRef Mutable = Value;
  CFTypeID v8 = CFGetTypeID(Value);
  if (v8 == CFDictionaryGetTypeID()) {
    goto LABEL_6;
  }
  return 0LL;
}

uint64_t sub_19718( int a1, uint64_t a2, unsigned int a3, mach_port_name_t a4, mach_port_name_t a5, int a6, int a7, int a8, int a9, mach_port_name_t *a10, int *a11, _OWORD *a12)
{
  CFMachPortRef port = 0LL;
  uint64_t v41 = 0LL;
  CFRunLoopSourceRef source = 0LL;
  gid_t egidp = -1;
  uid_t euidp = -1;
  pid_t pidp = -1;
  if (dword_40560 == a1)
  {
    char v18 = 1;
    SCLog(1LL, 7LL, @"_pppcontroller_attach_proxy server is priv server gServer_machport_priv %u");
  }

  else
  {
    SCLog(1LL, 7LL, @"_pppcontroller_attach_proxy server is norm %u");
    char v18 = 0;
  }

  *a10 = 0;
  SCLog(1LL, 7LL, @"_pppcontroller_attach_proxy client uid %u, gid %u, pid %u");
  if (!_SCUnserializeString(&v41, 0LL, a2, a3))
  {
LABEL_13:
    int v23 = 1001;
    goto LABEL_14;
  }

  unint64_t v19 = v41;
  CFTypeID TypeID = CFStringGetTypeID();
  if (v19 && CFGetTypeID(v19) == TypeID)
  {
    __int128 v21 = a12[1];
    *(_OWORD *)atoken.val = *a12;
    *(_OWORD *)&atoken.val[4] = v21;
    audit_token_to_au32(&atoken, 0LL, &euidp, &egidp, 0LL, 0LL, &pidp, 0LL, 0LL);
    if (euidp == a7 && egidp == a8 && pidp == a9)
    {
LABEL_10:
      mach_port_allocate(mach_task_self_, 1u, a10);
      CFMachPortRef port = (CFMachPortRef)_SC_CFMachPortCreateWithPort("PPPController/PPP", *a10, server_handle_request, 0LL);
      mach_port_insert_right(mach_task_self_, *a10, *a10, 0x14u);
      mach_port_request_notification(mach_task_self_, *a10, 70, 1u, *a10, 0x15u, atoken.val);
      CFRunLoopSourceRef source = CFMachPortCreateRunLoopSource(0LL, port, 0LL);
      CFAbsoluteTime Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, source, kCFRunLoopDefaultMode);
      if (client_new_mach(port, source, v41, a7, a8, a9, a4, a5, a6, v18))
      {
        *a11 = 0;
        my_CFRelease(&v41);
        my_CFRelease((const void **)&port);
        my_CFRelease((const void **)&source);
        return 0LL;
      }

      goto LABEL_13;
    }

    __int128 v26 = a12[1];
    *(_OWORD *)atoken.val = *a12;
    *(_OWORD *)&atoken.val[4] = v26;
    uint64_t v27 = SecTaskCreateWithAuditToken(0LL, &atoken);
    if (!v27)
    {
      SCLog(1LL, 3LL, @"SCNC Controller: SecTaskCreateWithAuditToken() failed: %@");
      goto LABEL_38;
    }

    CFStringRef v28 = v27;
    *(void *)atoken.val = 0LL;
    unint64_t v29 = (const __CFBoolean *)SecTaskCopyValueForEntitlement( v27,  @"com.apple.private.SCNetworkConnection-proxy-user",  (CFErrorRef *)&atoken);
    if (v29)
    {
      CFSocketNativeHandle v30 = v29;
      CFTypeID v32 = CFBooleanGetTypeID();
      if (CFGetTypeID(v30) == v32)
      {
        int Value = CFBooleanGetValue(v30);
        CFRelease(v30);
        CFRelease(v28);
        if (Value) {
          goto LABEL_10;
        }
LABEL_38:
        SCLog(1LL, 3LL, @"_pppcontroller_attach_proxy client fails entitlement for client uid change");
        int v23 = 1003;
        goto LABEL_14;
      }

      CFTypeID v34 = CFArrayGetTypeID();
      if (CFGetTypeID(v30) == v34)
      {
        CFRelease(v30);
        CFRelease(v28);
        goto LABEL_10;
      }

      SCLog(1LL, 3LL, @"SCNC Controller: entitlement not valid: %@");
      CFStringRef v31 = v30;
    }

    else
    {
      if (!*(void *)atoken.val)
      {
LABEL_37:
        CFRelease(v28);
        goto LABEL_38;
      }

      SCLog(1LL, 3LL, @"SCNC Controller: SecTaskCopyValueForEntitlement() failed, error=%@: %@");
      CFStringRef v31 = *(const __CFBoolean **)atoken.val;
    }

    CFRelease(v31);
    goto LABEL_37;
  }

  int v23 = 1002;
LABEL_14:
  *a11 = v23;
  my_CFRelease(&v41);
  if (port)
  {
    CFMachPortInvalidate(port);
    my_CFRelease((const void **)&port);
  }

  if (source)
  {
    CFStringRef v24 = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(v24, source, kCFRunLoopDefaultMode);
    my_CFRelease((const void **)&source);
  }

  if (*a10)
  {
    mach_port_mod_refs(mach_task_self_, *a10, 0, -1);
    mach_port_mod_refs(mach_task_self_, *a10, 1u, -1);
    *a10 = 0;
  }

  if (a4) {
    mach_port_deallocate(mach_task_self_, a4);
  }
  if (a5) {
    mach_port_deallocate(mach_task_self_, a5);
  }
  return 0LL;
}

void server_handle_request(uint64_t a1, mach_msg_header_t *a2)
{
  mach_msg_return_t v5;
  char *v6;
  mach_port_name_t msgh_local_port;
  void *v8;
  mode_t v2 = a2;
  mach_msg_id_t msgh_id = a2->msgh_id;
  if ((msgh_id - 78) >= 0xFFFFFFF2)
  {
    if (msgh_id == 70)
    {
      msgh_local_CFMachPortRef port = a2->msgh_local_port;
      CFTypeID v8 = client_findbymachport(msgh_local_port);
      if (v8) {
        client_dispose((uint64_t)v8);
      }
      mach_port_mod_refs(mach_task_self_, msgh_local_port, 1u, -1);
    }
  }

  else
  {
    if (!sub_2DA68(a2, (uint64_t)&dword_40568))
    {
      syslog(6, "unknown message ID (%d) received", v2->msgh_id);
      goto LABEL_13;
    }

    if ((dword_40568 & 0x1F) == 0x11) {
      mach_msg_option_t v4 = 17;
    }
    else {
      mach_msg_option_t v4 = 1;
    }
    uint64_t v5 = mach_msg((mach_msg_header_t *)&dword_40568, v4, unk_4056C, 0, 0, 0, 0);
    if (v5)
    {
      CFTypeID v6 = mach_error_string(v5);
      syslog(6, "PPPController: mach_msg(send): %s", v6);
      mode_t v2 = (mach_msg_header_t *)&dword_40568;
LABEL_13:
      mach_msg_destroy(v2);
    }
  }

uint64_t sub_19CF0( int a1, uint64_t a2, unsigned int a3, mach_port_name_t a4, mach_port_name_t a5, int a6, mach_port_name_t *a7, int *a8, _OWORD *a9)
{
  gid_t egidp = -1;
  uid_t euidp = -1;
  pid_t pidp = -1;
  __int128 v17 = a9[1];
  *(_OWORD *)atoken.val = *a9;
  *(_OWORD *)&atoken.val[4] = v17;
  audit_token_to_au32(&atoken, 0LL, &euidp, &egidp, 0LL, 0LL, &pidp, 0LL, 0LL);
  __int128 v18 = a9[1];
  *(_OWORD *)atoken.val = *a9;
  *(_OWORD *)&atoken.val[4] = v18;
  sub_19718(a1, a2, a3, a4, a5, a6, euidp, egidp, pidp, a7, a8, &atoken);
  return 0LL;
}

uint64_t sub_19DD0(int a1, _DWORD *a2, int *a3)
{
  *a2 = -1;
  uint64_t v5 = client_findbymachport(a1);
  if (v5)
  {
    CFTypeID v6 = findbyserviceID((CFStringRef)v5[6]);
    if (v6)
    {
      int v14 = scnc_getstatus((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
      int v15 = 0;
      *a2 = v14;
    }

    else
    {
      int v15 = 5001;
    }
  }

  else
  {
    int v15 = 1002;
  }

  *a3 = v15;
  return 0LL;
}

uint64_t sub_19E30(int a1, void *a2, int *a3, int *a4)
{
  uint64_t v12 = 0LL;
  unsigned __int16 v11 = 0;
  uint64_t v7 = client_findbymachport(a1);
  if (v7)
  {
    uint64_t v8 = findbyserviceID((CFStringRef)v7[6]);
    if (v8)
    {
      if (!scnc_copyextendedstatus((uint64_t)v8, &v12, &v11))
      {
        *a2 = v12;
        *a3 = v11;
        a3 = a4;
        goto LABEL_8;
      }

      int v9 = 1001;
    }

    else
    {
      int v9 = 5001;
    }
  }

  else
  {
    int v9 = 1002;
  }

  *a4 = v9;
  *a2 = 0LL;
LABEL_8:
  *a3 = 0;
  return 0LL;
}

uint64_t sub_19ECC(int a1, void *a2, int *a3, int *a4)
{
  uint64_t v12 = 0LL;
  unsigned __int16 v11 = 0;
  uint64_t v7 = client_findbymachport(a1);
  if (v7)
  {
    uint64_t v8 = findbyserviceID((CFStringRef)v7[6]);
    if (v8)
    {
      if (!scnc_copystatistics((uint64_t)v8, &v12, &v11))
      {
        *a2 = v12;
        *a3 = v11;
        a3 = a4;
        goto LABEL_8;
      }

      int v9 = 1001;
    }

    else
    {
      int v9 = 5001;
    }
  }

  else
  {
    int v9 = 1002;
  }

  *a4 = v9;
  *a2 = 0LL;
LABEL_8:
  *a3 = 0;
  return 0LL;
}

uint64_t sub_19F68(int a1, void *a2, int *a3, int *a4)
{
  uint64_t v12 = 0LL;
  unsigned __int16 v11 = 0;
  uint64_t v7 = client_findbymachport(a1);
  if (v7)
  {
    uint64_t v8 = findbyserviceID((CFStringRef)v7[6]);
    if (v8)
    {
      if (!scnc_getconnectdata((uint64_t)v8, &v12, &v11, 0))
      {
        *a2 = v12;
        *a3 = v11;
        a3 = a4;
        goto LABEL_8;
      }

      int v9 = 1001;
    }

    else
    {
      int v9 = 5001;
    }
  }

  else
  {
    int v9 = 1002;
  }

  *a4 = v9;
  *a2 = 0LL;
LABEL_8:
  *a3 = 0;
  return 0LL;
}

uint64_t sub_1A008(int a1, uint64_t a2, unsigned int a3, int a4, int *a5)
{
  __int128 v18 = 0LL;
  int v9 = client_findbymachport(a1);
  if (v9)
  {
    uint64_t v10 = (uint64_t)v9;
    unsigned __int16 v11 = findbyserviceID((CFStringRef)v9[6]);
    if (!v11)
    {
      int v16 = 5001;
      goto LABEL_15;
    }

    unint64_t v12 = (unint64_t)v11;
    if (!a3)
    {
      int v15 = 0LL;
      goto LABEL_13;
    }

    if (!_SCUnserialize(&v18, 0LL, a2, a3))
    {
LABEL_14:
      int v16 = 1001;
      goto LABEL_15;
    }

    uint64_t v13 = v18;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (v13 && CFGetTypeID(v13) == TypeID)
    {
      int v15 = (const __CFDictionary *)v18;
      if (v18 && !*(_BYTE *)(v10 + 132))
      {
        SCLog(1LL, 3LL, @"SCNC Controller: _pppcontroller_start has no mach port priv");
        goto LABEL_14;
      }

uint64_t sub_1A12C(int a1, int a2, int *a3)
{
  uint64_t v5 = client_findbymachport(a1);
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    uint64_t v7 = findbyserviceID((CFStringRef)v5[6]);
    if (v7)
    {
      uint64_t v8 = (uint64_t)v7;
      if (a2) {
        int v9 = 10;
      }
      else {
        int v9 = 9;
      }
      scnc_stop(v8, v6, 1LL, v9);
      int v10 = 0;
    }

    else
    {
      int v10 = 5001;
    }
  }

  else
  {
    int v10 = 1002;
  }

  *a3 = v10;
  return 0LL;
}

uint64_t sub_1A1CC(int a1, int *a2)
{
  size_t v3 = client_findbymachport(a1);
  if (v3)
  {
    mach_msg_option_t v4 = findbyserviceID((CFStringRef)v3[6]);
    if (v4)
    {
      scnc_suspend((uint64_t)v4);
      int v5 = 0;
    }

    else
    {
      int v5 = 5001;
    }
  }

  else
  {
    int v5 = 1002;
  }

  *a2 = v5;
  return 0LL;
}

uint64_t sub_1A21C(int a1, int *a2)
{
  size_t v3 = client_findbymachport(a1);
  if (v3)
  {
    mach_msg_option_t v4 = findbyserviceID((CFStringRef)v3[6]);
    if (v4)
    {
      scnc_resume((uint64_t)v4);
      int v5 = 0;
    }

    else
    {
      int v5 = 5001;
    }
  }

  else
  {
    int v5 = 1002;
  }

  *a2 = v5;
  return 0LL;
}

uint64_t sub_1A26C(int a1, int a2, int *a3)
{
  int v5 = client_findbymachport(a1);
  if (v5)
  {
    int v6 = 0;
    *((_DWORD *)v5 + 29) = *((_DWORD *)v5 + 29) & 0xFFFFFFF7 | (8 * (a2 != 0));
  }

  else
  {
    int v6 = 1002;
  }

  *a3 = v6;
  return 0LL;
}

uint64_t sub_1A2BC(uint64_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _OWORD *a5)
{
  __int128 v8 = a5[1];
  *(_OWORD *)atoken.val = *a5;
  *(_OWORD *)&atoken.val[4] = v8;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
  uint64_t v9 = findbypid(pidp);
  if (v9)
  {
    *a2 = *(_DWORD *)(v9 + 96);
    *a3 = *(_DWORD *)(v9 + 100);
    a3 = a4;
  }

  else
  {
    *a4 = 1002;
    *a2 = 0;
  }

  *a3 = 0;
  return 0LL;
}

uint64_t sub_1A358(uint64_t a1, int a2, void *a3, int *a4, int *a5, _OWORD *a6)
{
  uint64_t v16 = 0LL;
  unsigned __int16 v15 = 0;
  __int128 v10 = a6[1];
  *(_OWORD *)atoken.val = *a6;
  *(_OWORD *)&atoken.val[4] = v10;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
  uint64_t v11 = findbypid(pidp);
  if (!v11)
  {
    int v12 = 1002;
    goto LABEL_7;
  }

  if (a2 != 1)
  {
LABEL_9:
    *a3 = v16;
    *a4 = v15;
    goto LABEL_10;
  }

LABEL_5:
  int v12 = 1001;
LABEL_7:
  *a5 = v12;
  *a3 = 0LL;
  a5 = a4;
LABEL_10:
  *a5 = 0;
  return 0LL;
}

uint64_t sub_1A438(uint64_t a1, int *a2, _OWORD *a3)
{
  pid_t pidp = 0;
  __int128 v4 = a3[1];
  *(_OWORD *)atoken.val = *a3;
  *(_OWORD *)&atoken.val[4] = v4;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
  if (findbypid(pidp)) {
    int v5 = 0;
  }
  else {
    int v5 = 1002;
  }
  *a2 = v5;
  return 0LL;
}

void mach_client_notify(mach_port_t a1)
{
  mach_msg_return_t v1;
  mach_msg_header_t msg;
  *(void *)&msg.msgh_bits = 0x1800000013LL;
  msg.msgh_remote_CFMachPortRef port = a1;
  msg.msgh_local_CFMachPortRef port = 0;
  msg.mach_msg_id_t msgh_id = 0;
  int v1 = mach_msg(&msg, 17, 0x18u, 0, 0, 0, 0);
  if (v1 == 268435459 || v1 == 16) {
    mach_msg_destroy(&msg);
  }
}

uint64_t ppp_mach_start_server_priv()
{
  kern_return_t v0;
  CFStringRef v1;
  __CFMachPort *v3;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v5;
  _OWORD v6[2];
  CFStringRef (*v7)();
  mach_port_t sp;
  sp = 0;
  v6[0] = xmmword_393E0;
  v6[1] = *(_OWORD *)algn_393F0;
  uint64_t v7 = sub_1A670;
  int v0 = bootstrap_check_in(bootstrap_port, "com.apple.SystemConfiguration.PPPController-priv", &sp);
  if (v0)
  {
    bootstrap_strerror(v0);
    int v1 = @"PPPController: bootstrap_check_in %s error = %s";
LABEL_3:
    SCLog(1LL, 3LL, v1);
    return 0xFFFFFFFFLL;
  }

  size_t v3 = (__CFMachPort *)_SC_CFMachPortCreateWithPort("PPPController", sp, server_handle_request, v6);
  qword_435C8 = (uint64_t)v3;
  if (!v3)
  {
    int v1 = @"PPPController: cannot create priv mach port";
    goto LABEL_3;
  }

  dword_40560 = sp;
  CFRunLoopSourceRef RunLoopSource = CFMachPortCreateRunLoopSource(0LL, v3, 0LL);
  if (RunLoopSource)
  {
    int v5 = RunLoopSource;
    gControllerRunloop = (uint64_t)CFRunLoopGetCurrent();
    CFRunLoopAddSource((CFRunLoopRef)gControllerRunloop, v5, kCFRunLoopDefaultMode);
    CFRunLoopAddSource((CFRunLoopRef)gControllerRunloop, (CFRunLoopSourceRef)gTerminalrls, kCFRunLoopDefaultMode);
    CFRelease(v5);
    return 0LL;
  }

  SCLog(1LL, 3LL, @"PPPController: cannot create rls");
  CFRelease((CFTypeRef)qword_435C8);
  qword_435C8 = 0LL;
  dword_40560 = 0;
  return 0xFFFFFFFFLL;
}

CFStringRef sub_1A670()
{
  return CFStringCreateWithFormat(0LL, 0LL, @"PPPController-Priv");
}

uint64_t ppp_mach_start_server()
{
  kern_return_t v0;
  CFStringRef v1;
  __CFMachPort *v3;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v5;
  _OWORD v6[2];
  CFStringRef (*v7)();
  mach_port_t sp;
  sp = 0;
  v6[0] = xmmword_39408;
  v6[1] = unk_39418;
  uint64_t v7 = sub_1A7DC;
  int v0 = bootstrap_check_in(bootstrap_port, "com.apple.SystemConfiguration.PPPController", &sp);
  if (v0)
  {
    bootstrap_strerror(v0);
    int v1 = @"PPPController: bootstrap_check_in %s error = %s";
LABEL_3:
    SCLog(1LL, 3LL, v1);
    return 0xFFFFFFFFLL;
  }

  size_t v3 = (__CFMachPort *)_SC_CFMachPortCreateWithPort("PPPController", sp, server_handle_request, v6);
  qword_435D0 = (uint64_t)v3;
  if (!v3)
  {
    int v1 = @"PPPController: cannot create mach port";
    goto LABEL_3;
  }

  dword_40564 = sp;
  CFRunLoopSourceRef RunLoopSource = CFMachPortCreateRunLoopSource(0LL, v3, 0LL);
  if (RunLoopSource)
  {
    int v5 = RunLoopSource;
    gControllerRunloop = (uint64_t)CFRunLoopGetCurrent();
    CFRunLoopAddSource((CFRunLoopRef)gControllerRunloop, v5, kCFRunLoopDefaultMode);
    CFRunLoopAddSource((CFRunLoopRef)gControllerRunloop, (CFRunLoopSourceRef)gTerminalrls, kCFRunLoopDefaultMode);
    CFRelease(v5);
    return 0LL;
  }

  SCLog(1LL, 3LL, @"PPPController: cannot create rls");
  CFRelease((CFTypeRef)qword_435D0);
  qword_435D0 = 0LL;
  dword_40564 = 0;
  return 0xFFFFFFFFLL;
}

CFStringRef sub_1A7DC()
{
  return CFStringCreateWithFormat(0LL, 0LL, @"PPPController");
}

CFMutableStringRef parse_component(const __CFString *a1, const __CFString *a2)
{
  if (!CFStringHasPrefix(a1, a2)) {
    return 0LL;
  }
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0LL, 0LL, a1);
  v8.length = CFStringGetLength(a2);
  v8.CFIndex location = 0LL;
  CFStringDelete(MutableCopy, v8);
  CFIndex location = CFStringFind(MutableCopy, @"/", 0LL).location;
  if (location == -1)
  {
    CFRelease(MutableCopy);
    return 0LL;
  }

  CFIndex v6 = location;
  v9.length = CFStringGetLength(MutableCopy) - location;
  v9.CFIndex location = v6;
  CFStringDelete(MutableCopy, v9);
  return MutableCopy;
}

__CFString *copyService(const __SCDynamicStore *a1, const __CFString *a2, const __CFString *a3)
{
  CFIndex v6 = kSCEntNetPPP;
  v14[0] = kSCEntNetModem;
  v14[1] = kSCEntNetInterface;
  v14[2] = kSCEntNetIPv4;
  v14[3] = kSCEntNetIPv6;
  v14[4] = kSCEntNetDNS;
  v14[5] = kSCEntNetL2TP;
  v14[6] = kSCEntNetPPTP;
  v14[7] = kSCEntNetIPSec;
  v14[8] = 0LL;
  CFMutableStringRef MutableCopy = (__CFString *)SCDynamicStoreKeyCreate(0LL, @"%@/%@/%@/%@", a2, kSCCompNetwork, kSCCompService, a3);
  if (MutableCopy)
  {
    CFRange v8 = (const __CFDictionary *)SCDynamicStoreCopyValue(a1, MutableCopy);
    if (v8
      || (CFRange v8 = CFDictionaryCreate(0LL, 0LL, 0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks)) != 0LL)
    {
      CFRelease(MutableCopy);
      CFMutableStringRef MutableCopy = (__CFString *)CFDictionaryCreateMutableCopy(0LL, 0LL, v8);
      CFRelease(v8);
      if (MutableCopy && kSCEntNetPPP)
      {
        CFRange v9 = (const __CFString **)v14;
        do
        {
          CFPropertyListRef v10 = copyEntity(a1, a2, a3, v6);
          if (v10)
          {
            uint64_t v11 = v10;
            CFDictionaryAddValue((CFMutableDictionaryRef)MutableCopy, v6, v10);
            CFRelease(v11);
          }

          int v12 = *v9++;
          CFIndex v6 = v12;
        }

        while (v12);
      }
    }

    else
    {
      CFRelease(MutableCopy);
      return 0LL;
    }
  }

  return MutableCopy;
}

CFPropertyListRef copyEntity( const __SCDynamicStore *a1, const __CFString *a2, const __CFString *a3, CFStringRef entity)
{
  if (a3) {
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0LL, a2, a3, entity);
  }
  else {
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0LL, a2, entity);
  }
  CFIndex v6 = NetworkServiceEntity;
  if (!NetworkServiceEntity) {
    return 0LL;
  }
  CFPropertyListRef v7 = SCDynamicStoreCopyValue(a1, NetworkServiceEntity);
  CFRelease(v6);
  return v7;
}

CFPropertyListRef existEntity( const __SCDynamicStore *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4)
{
  CFPropertyListRef result = copyEntity(a1, a2, a3, a4);
  if (result)
  {
    CFRelease(result);
    return &dword_0 + 1;
  }

  return result;
}

CFStringRef getString(const __CFDictionary *a1, const void *a2, char *a3, unsigned int a4)
{
  *a3 = 0;
  CFPropertyListRef result = (const __CFString *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    CFPropertyListRef v7 = result;
    CFTypeID v8 = CFGetTypeID(result);
    if (v8 == CFStringGetTypeID())
    {
      CFStringGetCString(v7, a3, a4, 0x8000100u);
      return (const __CFString *)(&dword_0 + 1);
    }

    CFTypeID v9 = CFGetTypeID(v7);
    if (v9 == CFDataGetTypeID())
    {
      CFPropertyListRef result = (const __CFString *)CFDataGetLength((CFDataRef)v7);
      if (result)
      {
        CFIndex v10 = (CFIndex)result;
        CFPropertyListRef result = (const __CFString *)CFDataGetBytePtr((CFDataRef)v7);
        if (result)
        {
          CFStringEncoding v11 = LOBYTE(result->isa) ? 335544576 : 268435712;
          CFPropertyListRef result = CFStringCreateWithBytes(0LL, (const UInt8 *)result, v10, v11, 0);
          if (result)
          {
            int v12 = result;
            CFStringGetCString(result, a3, a4, 0x8000100u);
            CFRelease(v12);
            return (const __CFString *)(&dword_0 + 1);
          }
        }
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

CFNumberRef getNumber(const __CFDictionary *a1, const void *a2, void *a3)
{
  CFPropertyListRef result = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    int v5 = result;
    CFTypeID v6 = CFGetTypeID(result);
    if (v6 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v5, kCFNumberSInt32Type, a3);
      return (const __CFNumber *)(&dword_0 + 1);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

CFDictionaryRef getNumberFromEntity( const __SCDynamicStore *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const void *a5, void *a6)
{
  CFPropertyListRef result = (const __CFDictionary *)copyEntity(a1, a2, a3, a4);
  if (result)
  {
    CFTypeID v9 = result;
    Number = getNumber(result, a5, a6);
    CFRelease(v9);
    return Number;
  }

  return result;
}

CFDictionaryRef getStringFromEntity( const __SCDynamicStore *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const void *a5, char *a6, unsigned int a7)
{
  CFPropertyListRef result = (const __CFDictionary *)copyEntity(a1, a2, a3, a4);
  if (result)
  {
    CFStringEncoding v11 = result;
    String = getString(result, a5, a6, a7);
    CFRelease(v11);
    return (const __CFDictionary *)String;
  }

  return result;
}

const void *copyCFStringFromEntity( const __SCDynamicStore *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const void *a5)
{
  CFTypeID v6 = (const __CFDictionary *)copyEntity(a1, a2, a3, a4);
  if (!v6) {
    return 0LL;
  }
  CFPropertyListRef v7 = v6;
  int Value = CFDictionaryGetValue(v6, a5);
  CFTypeID v9 = Value;
  if (Value)
  {
    CFTypeID v10 = CFGetTypeID(Value);
    if (v10 == CFStringGetTypeID()) {
      CFRetain(v9);
    }
    else {
      CFTypeID v9 = 0LL;
    }
  }

  CFRelease(v7);
  return v9;
}

CFStringRef CFStringAddrToLong(const __CFString *result)
{
  if (result)
  {
    buffer[0] = 0;
    CFStringGetCString(result, buffer, 100LL, 0);
    return (const __CFString *)bswap32(inet_addr(buffer));
  }

  return result;
}

uint64_t getAddressFromEntity( const __SCDynamicStore *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const void *a5, _DWORD *a6)
{
  CFTypeID v8 = (const __CFDictionary *)copyEntity(a1, a2, a3, a4);
  if (!v8) {
    return 0LL;
  }
  CFTypeID v9 = v8;
  int Value = (const __CFArray *)CFDictionaryGetValue(v8, a5);
  if (Value && (CFStringEncoding v11 = Value, CFArrayGetCount(Value)))
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v11, 0LL);
    *a6 = CFStringAddrToLong(ValueAtIndex);
    uint64_t v13 = 1LL;
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  CFRelease(v9);
  return v13;
}

uint64_t my_CFEqual(unint64_t cf1, unint64_t a2)
{
  if (!(cf1 | a2)) {
    return 1LL;
  }
  uint64_t result = 0LL;
  if (cf1)
  {
    if (a2) {
      return CFEqual((CFTypeRef)cf1, (CFTypeRef)a2);
    }
  }

  return result;
}

void my_CFRelease(const void **a1)
{
  if (a1)
  {
    mode_t v2 = *a1;
    if (v2)
    {
      CFRelease(v2);
      *a1 = 0LL;
    }
  }

uint64_t my_close(uint64_t result)
{
  if ((_DWORD)result != -1) {
    return close(result);
  }
  return result;
}

CFTypeRef my_CFRetain(CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  return cf;
}

const void *isDictionary(const void *result)
{
  if (result)
  {
    CFTypeID v1 = CFGetTypeID(result);
    return (const void *)(v1 == CFDictionaryGetTypeID());
  }

  return result;
}

const void *isArray(const void *result)
{
  if (result)
  {
    CFTypeID v1 = CFGetTypeID(result);
    return (const void *)(v1 == CFArrayGetTypeID());
  }

  return result;
}

const void *isString(const void *result)
{
  if (result)
  {
    CFTypeID v1 = CFGetTypeID(result);
    return (const void *)(v1 == CFStringGetTypeID());
  }

  return result;
}

const void *isNumber(const void *result)
{
  if (result)
  {
    CFTypeID v1 = CFGetTypeID(result);
    return (const void *)(v1 == CFNumberGetTypeID());
  }

  return result;
}

const void *isData(const void *result)
{
  if (result)
  {
    CFTypeID v1 = CFGetTypeID(result);
    return (const void *)(v1 == CFDataGetTypeID());
  }

  return result;
}

void AddNumber(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0LL, kCFNumberSInt32Type, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    CFDictionaryAddValue(a1, a2, v5);
    CFRelease(v6);
  }

void AddNumber64(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0LL, kCFNumberSInt64Type, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    CFDictionaryAddValue(a1, a2, v5);
    CFRelease(v6);
  }

void AddString(__CFDictionary *a1, const void *a2, char *cStr)
{
  CFStringRef v5 = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
  if (v5)
  {
    CFStringRef v6 = v5;
    CFDictionaryAddValue(a1, a2, v5);
    CFRelease(v6);
  }

void AddNumberFromState( const __SCDynamicStore *a1, const __CFString *a2, const __CFString *a3, const void *a4, __CFDictionary *a5)
{
}

void AddStringFromState( const __SCDynamicStore *a1, const __CFString *a2, const __CFString *a3, const void *a4, __CFDictionary *a5)
{
  int v7 = copyCFStringFromEntity(a1, kSCDynamicStoreDomainState, a2, a3, a4);
  if (v7)
  {
    CFTypeID v8 = v7;
    CFDictionaryAddValue(a5, a4, v7);
    CFRelease(v8);
  }

CFDataRef Serialize(CFPropertyListRef propertyList, const UInt8 **a2, _DWORD *a3)
{
  XMLData = CFPropertyListCreateXMLData(0LL, propertyList);
  CFStringRef v6 = XMLData;
  if (XMLData)
  {
    *a2 = CFDataGetBytePtr(XMLData);
    *a3 = CFDataGetLength(v6);
  }

  return v6;
}

CFDataRef Unserialize(UInt8 *bytes, CFIndex length)
{
  uint64_t result = CFDataCreate(0LL, bytes, length);
  if (result)
  {
    size_t v3 = result;
    CFPropertyListRef v4 = CFPropertyListCreateFromXMLData(0LL, result, 0LL, 0LL);
    CFRelease(v3);
    return (const __CFData *)v4;
  }

  return result;
}

vm_address_t my_Allocate(int a1)
{
  if (vm_allocate(mach_task_self_, &address, a1, 1)) {
    return 0LL;
  }
  else {
    return address;
  }
}

vm_address_t my_Deallocate(vm_address_t address, int a2)
{
  if (address) {
    return vm_deallocate(mach_task_self_, address, a2);
  }
  return address;
}

uint64_t GetIntFromDict(const __CFDictionary *a1, const void *a2, _DWORD *a3, int a4)
{
  int Value = CFDictionaryGetValue(a1, a2);
  uint64_t result = 0LL;
  *a3 = a4;
  return result;
}

size_t GetStrFromDict(const __CFDictionary *a1, const void *a2, char *a3, int a4, const char *a5)
{
  int Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
  return strlen(a3);
}

BOOL GetStrAddrFromDict(const __CFDictionary *a1, const void *a2, char *a3, int a4)
{
  int Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
  return isString(Value) && CFStringGetCString(Value, a3, a4, 0x8000100u);
}

const void *GetStrNetFromDict(const __CFDictionary *a1, const void *a2, char *a3, int a4)
{
  int Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
  uint64_t result = isString(Value);
  if ((_DWORD)result)
  {
    uint64_t result = (const void *)CFStringGetCString(Value, a3, a4, 0x8000100u);
    if ((_DWORD)result) {
      return (const void *)(inet_network(a3) != -1);
    }
  }

  return result;
}

uint64_t publish_keyentry(const __SCDynamicStore *a1, const __CFString *a2, const void *a3, const void *a4)
{
  CFTypeID v8 = (const __CFDictionary *)SCDynamicStoreCopyValue(a1, a2);
  if (v8)
  {
    CFTypeID v9 = v8;
    CFMutableStringRef MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, v8);
    CFRelease(v9);
    if (MutableCopy)
    {
LABEL_3:
      CFDictionarySetValue(MutableCopy, a3, a4);
      SCDynamicStoreSetValue(a1, a2, MutableCopy);
      CFRelease(MutableCopy);
      return 1LL;
    }
  }

  else
  {
    CFMutableStringRef MutableCopy = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (MutableCopy) {
      goto LABEL_3;
    }
  }

  return 0LL;
}

uint64_t unpublish_keyentry(const __SCDynamicStore *a1, const __CFString *a2, const void *a3)
{
  CFStringRef v6 = (const __CFDictionary *)SCDynamicStoreCopyValue(a1, a2);
  if (v6)
  {
    int v7 = v6;
    CFMutableStringRef MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, v6);
    if (MutableCopy)
    {
      CFTypeID v9 = MutableCopy;
      CFDictionaryRemoveValue(MutableCopy, a3);
      SCDynamicStoreSetValue(a1, a2, v9);
      CFRelease(v9);
    }

    CFRelease(v7);
  }

  return 0LL;
}

uint64_t publish_dictnumentry( const __SCDynamicStore *a1, CFStringRef serviceID, CFStringRef entity, const void *a4, int a5)
{
  int valuePtr = a5;
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0LL, kSCDynamicStoreDomainState, serviceID, entity);
  if (!NetworkServiceEntity) {
    return 12LL;
  }
  CFTypeID v8 = NetworkServiceEntity;
  CFNumberRef v9 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
  if (v9)
  {
    CFNumberRef v10 = v9;
    publish_keyentry(a1, v8, a4, v9);
    CFRelease(v10);
    uint64_t v11 = 0LL;
  }

  else
  {
    uint64_t v11 = 12LL;
  }

  CFRelease(v8);
  return v11;
}

uint64_t unpublish_dictentry( const __SCDynamicStore *a1, CFStringRef serviceID, CFStringRef entity, const void *a4)
{
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0LL, kSCDynamicStoreDomainState, serviceID, entity);
  if (!NetworkServiceEntity) {
    return 12LL;
  }
  int v7 = NetworkServiceEntity;
  unpublish_keyentry(a1, NetworkServiceEntity, a4);
  CFRelease(v7);
  return 0LL;
}

uint64_t publish_multiple_dicts( const __SCDynamicStore *a1, const __CFString *a2, CFArrayRef theArray, const __CFArray *a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0xFFFFFFFFLL;
  if (theArray && a4)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count == CFArrayGetCount(a4))
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (Count >= 1)
      {
        for (CFIndex i = 0LL; i != Count; ++i)
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, i);
          uint64_t v13 = CFArrayGetValueAtIndex(a4, i);
          CFTypeID TypeID = CFStringGetTypeID();
          if (ValueAtIndex)
          {
            if (CFGetTypeID(ValueAtIndex) == TypeID)
            {
              CFTypeID v15 = CFDictionaryGetTypeID();
              if (v13)
              {
                if (CFGetTypeID(v13) == v15)
                {
                  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( 0LL,  kSCDynamicStoreDomainState,  a2,  ValueAtIndex);
                  if (NetworkServiceEntity)
                  {
                    CFStringRef v17 = NetworkServiceEntity;
                    CFDictionaryAddValue(Mutable, NetworkServiceEntity, v13);
                    CFRelease(v17);
                  }
                }
              }
            }
          }
        }
      }

      SCDynamicStoreSetMultiple(a1, Mutable, 0LL, 0LL);
      if (Mutable) {
        CFRelease(Mutable);
      }
      return 12LL;
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

uint64_t unpublish_dict(const __SCDynamicStore *a1, CFStringRef serviceID, CFStringRef entity)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (entity) {
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( 0LL,  kSCDynamicStoreDomainState,  serviceID,  entity);
  }
  else {
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreate( 0LL,  @"%@/%@/%@/%@",  kSCDynamicStoreDomainState,  kSCCompNetwork,  kSCCompService,  serviceID);
  }
  CFStringRef v6 = NetworkServiceEntity;
  if (!NetworkServiceEntity) {
    return 12LL;
  }
  SCDynamicStoreRemoveValue(a1, NetworkServiceEntity);
  CFRelease(v6);
  return 0LL;
}

uint64_t unpublish_multiple_dicts( const __SCDynamicStore *a1, const __CFString *a2, const __CFArray *a3, int a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  if (a3)
  {
    CFIndex Count = CFArrayGetCount(a3);
    if (Count >= 1)
    {
      CFIndex v10 = Count;
      for (CFIndex i = 0LL; i != v10; ++i)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a3, i);
        CFTypeID TypeID = CFStringGetTypeID();
        if (ValueAtIndex)
        {
          if (CFGetTypeID(ValueAtIndex) == TypeID)
          {
            CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( 0LL,  kSCDynamicStoreDomainState,  a2,  ValueAtIndex);
            if (NetworkServiceEntity)
            {
              CFStringRef v15 = NetworkServiceEntity;
              CFArrayAppendValue(Mutable, NetworkServiceEntity);
              CFRelease(v15);
            }
          }
        }
      }
    }
  }

  if (a4)
  {
    CFStringRef v16 = SCDynamicStoreKeyCreate( 0LL,  @"%@/%@/%@/%@",  kSCDynamicStoreDomainState,  kSCCompNetwork,  kSCCompService,  a2);
    if (v16)
    {
      CFStringRef v17 = v16;
      CFArrayAppendValue(Mutable, v16);
      CFRelease(v17);
    }
  }

  SCDynamicStoreSetMultiple(a1, 0LL, Mutable, 0LL);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return 12LL;
}

uint64_t publish_dictstrentry( const __SCDynamicStore *a1, CFStringRef serviceID, CFStringRef entity, const void *a4, const char *a5, CFStringEncoding a6)
{
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0LL, kSCDynamicStoreDomainState, serviceID, entity);
  if (!NetworkServiceEntity) {
    return 12LL;
  }
  uint64_t v11 = NetworkServiceEntity;
  CFStringRef v12 = CFStringCreateWithCString(0LL, a5, a6);
  if (v12)
  {
    CFStringRef v13 = v12;
    publish_keyentry(a1, v11, a4, v12);
    CFRelease(v13);
    uint64_t v14 = 0LL;
  }

  else
  {
    uint64_t v14 = 12LL;
  }

  CFRelease(v11);
  return v14;
}

uint64_t cfstring_is_ip(const __CFString *a1)
{
  v9.s_addr = 0;
  CFIndex Length = CFStringGetLength(a1);
  CFIndex usedBufLen = Length;
  if (!Length) {
    return 0LL;
  }
  CFIndex v3 = Length;
  CFPropertyListRef v4 = (UInt8 *)malloc(Length + 1);
  if (!v4)
  {
    SCLog(1LL, 3LL, @"Failed to allocate memory");
    return 0LL;
  }

  CFStringRef v5 = (char *)v4;
  v10.CFIndex location = 0LL;
  v10.length = v3;
  CFStringGetBytes(a1, v10, 0, 0, 0, v4, v3, &usedBufLen);
  v5[usedBufLen] = 0;
  uint64_t v6 = inet_aton(v5, &v9);
  free(v5);
  return v6;
}

CFStringRef copyPrimaryService(const __SCDynamicStore *a1)
{
  CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0LL, kSCDynamicStoreDomainState, kSCEntNetIPv4);
  if (NetworkGlobalEntity)
  {
    CFIndex v3 = (const __CFDictionary *)SCDynamicStoreCopyValue(a1, NetworkGlobalEntity);
    CFRelease(NetworkGlobalEntity);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (!v3) {
      return 0LL;
    }
    if (CFGetTypeID(v3) == TypeID)
    {
      CFStringRef NetworkGlobalEntity = (const __CFString *)CFDictionaryGetValue(v3, kSCDynamicStorePropNetPrimaryService);
      CFTypeID v5 = CFStringGetTypeID();
      if (!NetworkGlobalEntity)
      {
LABEL_8:
        CFRelease(v3);
        return NetworkGlobalEntity;
      }

      if (CFGetTypeID(NetworkGlobalEntity) == v5)
      {
        CFRetain(NetworkGlobalEntity);
        goto LABEL_8;
      }
    }

    CFStringRef NetworkGlobalEntity = 0LL;
    goto LABEL_8;
  }

  return NetworkGlobalEntity;
}

uint64_t UpdatePasswordPrefs( const __CFString *a1, const void *a2, uint64_t a3, const void *a4, const void *a5)
{
  CFRange v10 = SCPreferencesCreate(0LL, @"UpdatePassword", 0LL);
  if (v10)
  {
    uint64_t v11 = v10;
    if (!SCPreferencesLock(v10, 1u))
    {
      SCLog(1LL, 3LL, @"%@: SCPreferencesLock fails");
      uint64_t v19 = 0LL;
LABEL_33:
      CFRelease(v11);
      return v19;
    }

    CFStringRef v12 = SCNetworkServiceCopy(v11, a1);
    if (!v12)
    {
      SCLog(1LL, 3LL, @"%@: SCNetworkServiceCopy fails");
      uint64_t v19 = 0LL;
LABEL_32:
      SCPreferencesUnlock(v11);
      goto LABEL_33;
    }

    CFStringRef v13 = v12;
    Interface = SCNetworkServiceGetInterface(v12);
    if (Interface
      && (CFStringRef v15 = Interface, InterfaceType = SCNetworkInterfaceGetInterfaceType(Interface), CFEqual(InterfaceType, a2)))
    {
      if (SCNetworkInterfaceCheckPassword(v15, a3)
        && !SCNetworkInterfaceRemovePassword(v15, a3))
      {
        SCLog(1LL, 3LL, @"%@: SCNetworkInterfaceRemovePassword fails");
      }

      Configuration = SCNetworkInterfaceGetConfiguration(v15);
      if (Configuration) {
        CFMutableStringRef MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, Configuration);
      }
      else {
        CFMutableStringRef MutableCopy = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      }
      __int128 v21 = MutableCopy;
      if (MutableCopy)
      {
        if (a5) {
          CFDictionarySetValue(MutableCopy, a4, a5);
        }
        else {
          CFDictionaryRemoveValue(MutableCopy, a4);
        }
        if (SCNetworkInterfaceSetConfiguration(v15, v21))
        {
          if (SCPreferencesCommitChanges(v11))
          {
            if (SCPreferencesApplyChanges(v11))
            {
              uint64_t v19 = 1LL;
LABEL_30:
              CFRelease(v21);
              goto LABEL_31;
            }

            unint64_t v22 = @"%@: SCPreferencesApplyChanges fails";
          }

          else
          {
            unint64_t v22 = @"%@: SCPreferencesCommitChanges fails";
          }
        }

        else
        {
          unint64_t v22 = @"%@: SCNetworkInterfaceSetConfiguration fails";
        }

        SCLog(1LL, 3LL, v22);
        uint64_t v19 = 0LL;
        goto LABEL_30;
      }

      int v20 = @"%@: cannot allocate new interface configuration";
    }

    else
    {
      int v20 = @"%@: interface not %@";
    }

    SCLog(1LL, 3LL, v20);
    uint64_t v19 = 0LL;
LABEL_31:
    CFRelease(v13);
    goto LABEL_32;
  }

  SCLog(1LL, 3LL, @"%@: SCPreferencesCreate fails");
  return 0LL;
}

uint64_t set_ifmtu(uint64_t a1, int a2)
{
  int v4 = socket(2, 2, 0);
  if (v4 < 0)
  {
    int v7 = __error();
    CFTypeID v8 = strerror(*v7);
    syslog(6, "sifmtu: cannot create ip socket, %s", v8);
    return 0LL;
  }

  else
  {
    int v5 = v4;
    __strlcpy_chk(v9, a1, 16LL, 16LL);
    int v10 = a2;
    ioctl(v5, 0x80206934uLL, v9);
    close(v5);
    return 1LL;
  }

uint64_t set_ifaddr(uint64_t a1, int a2, int a3, int a4)
{
  int v8 = socket(2, 2, 0);
  if (v8 < 0)
  {
    uint64_t v11 = __error();
    CFStringRef v12 = strerror(*v11);
    syslog(6, "sifaddr: cannot create ip socket, %s", v12);
  }

  else
  {
    int v9 = v8;
    __strlcpy_chk(v13, a1, 16LL, 16LL);
    uint64_t v16 = 0LL;
    int v14 = 528;
    int v15 = a2;
    uint64_t v19 = 0LL;
    int v17 = 528;
    int v18 = a3;
    uint64_t v20 = 0LL;
    uint64_t v21 = 0LL;
    if (a4)
    {
      LOWORD(v20) = 528;
      HIDWORD(v20) = a4;
    }

    if ((ioctl(v9, 0x8040691AuLL, v13) & 0x80000000) == 0 || *__error() == 17)
    {
      close(v9);
      return 1LL;
    }

    close(v9);
  }

  return 0LL;
}

BOOL clear_ifaddr(uint64_t a1, int a2)
{
  int v4 = socket(2, 2, 0);
  if (v4 < 0)
  {
    int v8 = __error();
    int v9 = strerror(*v8);
    syslog(6, "cifaddr: cannot create ip socket, %s", v9);
    return 0LL;
  }

  else
  {
    int v5 = v4;
    __strlcpy_chk(v10, a1, 16LL, 16LL);
    uint64_t v13 = 0LL;
    int v11 = 528;
    int v12 = a2;
    int v6 = ioctl(v5, 0x80206919uLL, v10);
    close(v5);
    return v6 >= 0;
  }

void *in6_len2mask(void *__b, int a2)
{
  CFIndex v3 = __b;
  size_t v4 = 0LL;
  *__b = 0LL;
  __b[1] = 0LL;
  if (a2 >= 8)
  {
    size_t v4 = (a2 >> 3) - 1 + 1LL;
    __b = memset(__b, 255, v4);
  }

  if (a2 <= 0) {
    int v5 = -(-a2 & 7);
  }
  else {
    int v5 = a2 & 7;
  }
  if (v5) {
    *((_BYTE *)v3 + v4) = 0xFF00u >> v5;
  }
  return __b;
}

uint64_t in6_maskaddr(uint64_t result, uint64_t a2)
{
  for (uint64_t i = 0LL; i != 16; ++i)
    *(_BYTE *)(result + i) &= *(_BYTE *)(a2 + i);
  return result;
}

void *in6_addr2net(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result = in6_len2mask(v7, a2);
  for (uint64_t i = 0LL; i != 16; ++i)
    *(_BYTE *)(a3 + i) = *((_BYTE *)v7 + i) & *(_BYTE *)(a1 + i);
  return result;
}

uint64_t set_ifaddr6(uint64_t a1, unsigned __int8 *a2, int a3)
{
  int v6 = socket(30, 2, 0);
  if ((v6 & 0x80000000) == 0)
  {
    int v7 = v6;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    memset(v14, 0, sizeof(v14));
    __strlcpy_chk(v14, a1, 16LL, 16LL);
    LOWORD(v14[1]) = 7708;
    *(_OWORD *)((char *)&v14[1] + 8) = *(_OWORD *)a2;
    WORD4(v15) = 7708;
    in6_len2mask(&__b, a3);
    __int128 v16 = __b;
    *((void *)&v18 + 1) = -1LL;
    if (*a2 == 254 && (a2[1] & 0xC0) == 0x80)
    {
      if (ioctl(v7, 0xC0806982uLL, v14) < 0)
      {
        int v8 = __error();
        strerror(*v8);
        syslog(3, "set_ifaddr6: can't set link-local IPv6 address, %s");
LABEL_10:
        close(v7);
        return 0LL;
      }
    }

    else if (ioctl(v7, 0x8080691AuLL, v14) < 0)
    {
      int v12 = __error();
      strerror(*v12);
      syslog(3, "set_ifaddr6: can't set IPv6 address, %s");
      goto LABEL_10;
    }

    close(v7);
    return 1LL;
  }

  int v10 = __error();
  int v11 = strerror(*v10);
  syslog(3, "set_ifaddr6: can't create IPv6 socket, %s", v11);
  return 0LL;
}

uint64_t clear_ifaddr6(uint64_t a1, _OWORD *a2)
{
  int v4 = socket(30, 2, 0);
  if (v4 < 0)
  {
    int v7 = __error();
    int v8 = strerror(*v7);
    syslog(3, "set_ifaddr6: can't create IPv6 socket, %s", v8);
  }

  else
  {
    int v5 = v4;
    memset(v11, 0, sizeof(v11));
    __strlcpy_chk(v11, a1, 16LL, 16LL);
    LOWORD(v11[1]) = 7708;
    *(_OWORD *)((char *)&v11[1] + 8) = *a2;
    if ((ioctl(v5, 0x81206919uLL, v11) & 0x80000000) == 0)
    {
      close(v5);
      return 1LL;
    }

    int v9 = __error();
    int v10 = strerror(*v9);
    syslog(3, "set_ifaddr6: can't set IPv6 address, %s", v10);
    close(v5);
  }

  return 0LL;
}

const char *inet_sockaddr_to_p(unsigned __int8 *a1, char *a2, socklen_t a3)
{
  int v6 = a1[1];
  if (v6 == 30)
  {
    int v7 = a1 + 8;
    return inet_ntop(v6, v7, a2, a3);
  }

  if (v6 == 2)
  {
    int v7 = a1 + 4;
    return inet_ntop(v6, v7, a2, a3);
  }

  return 0LL;
}

uint64_t inet_p_to_sockaddr(const char *a1, char *a2, unsigned int a3)
{
  if (a3 < 0x10) {
    return 0LL;
  }
  char v6 = 2;
  if (inet_pton(2, a1, a2 + 4))
  {
    char v7 = 16;
LABEL_4:
    *a2 = v7;
    a2[1] = v6;
    return 1LL;
  }

  if (a3 < 0x1C) {
    return 0LL;
  }
  char v6 = 30;
  uint64_t result = inet_pton(30, a1, a2 + 8);
  if ((_DWORD)result)
  {
    char v7 = 28;
    goto LABEL_4;
  }

  return result;
}

BOOL copyGateway(const __SCDynamicStore *a1, int a2, char *a3, int a4, void *a5, int a6)
{
  if (a3) {
    *a3 = 0;
  }
  if (a5) {
    bzero(a5, a6);
  }
  if (a2 != 30 && a2 != 2) {
    return 0LL;
  }
  int v12 = (CFStringRef *)&kSCEntNetIPv6;
  if (a2 == 2) {
    int v12 = (CFStringRef *)&kSCEntNetIPv4;
  }
  CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0LL, kSCDynamicStoreDomainState, *v12);
  if (NetworkGlobalEntity)
  {
    int v14 = (const __CFDictionary *)SCDynamicStoreCopyValue(a1, NetworkGlobalEntity);
    CFRelease(NetworkGlobalEntity);
    if (v14)
    {
      int Value = (const __CFString *)CFDictionaryGetValue(v14, kSCDynamicStorePropNetPrimaryInterface);
      LODWORD(NetworkGlobalEntity) = Value != 0LL;
      if (a3 && Value)
      {
        CFStringGetCString(Value, a3, a4, 0x8000100u);
        LODWORD(NetworkGlobalEntity) = 1;
      }

      __int128 v16 = (const void **)&kSCPropNetIPv4Router;
      if (a2 != 2) {
        __int128 v16 = (const void **)&kSCPropNetIPv6Router;
      }
      __int128 v17 = (const __CFString *)CFDictionaryGetValue(v14, *v16);
      if (v17 && (buffer[0] = 0, CFStringGetCString(v17, buffer, 256LL, 0x8000100u), buffer[0]))
      {
        int v18 = inet_p_to_sockaddr(buffer, __src, 0x80u);
        BOOL v19 = v18 != 0;
        if (a5 && v18)
        {
          BOOL v19 = 1;
        }
      }

      else
      {
        BOOL v19 = 0;
      }

      CFRelease(v14);
      goto LABEL_28;
    }

    LODWORD(NetworkGlobalEntity) = 0;
  }

  BOOL v19 = 0;
LABEL_28:
  if ((_DWORD)NetworkGlobalEntity) {
    BOOL v21 = !v19;
  }
  else {
    BOOL v21 = 1;
  }
  return !v21;
}

BOOL hasGateway(const __SCDynamicStore *a1, int a2)
{
  return copyGateway(a1, a2, 0LL, 0, 0LL, 0);
}

__CFDictionary *create_ipv6_dummy_primary(uint64_t a1)
{
  int valuePtr = 1;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    CFIndex v3 = CFArrayCreateMutable(0LL, 1LL, &kCFTypeArrayCallBacks);
    if (v3)
    {
      int v4 = v3;
      CFArrayAppendValue(v3, @"::1");
      CFDictionarySetValue(Mutable, kSCPropNetIPv6Addresses, v4);
      CFRelease(v4);
    }

    CFDictionarySetValue(Mutable, kSCPropNetIPv6Router, @"::1");
    CFNumberRef v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (v5)
    {
      CFNumberRef v6 = v5;
      CFDictionarySetValue(Mutable, kSCPropNetOverridePrimary, v5);
      CFRelease(v6);
    }

    CFDictionarySetValue(Mutable, @"IsNULL", kCFBooleanTrue);
    if (a1)
    {
      CFStringRef v7 = CFStringCreateWithFormat(0LL, 0LL, @"%s", a1);
      if (v7)
      {
        CFStringRef v8 = v7;
        CFDictionarySetValue(Mutable, kSCPropInterfaceName, v7);
        CFRelease(v8);
      }
    }
  }

  return Mutable;
}

__CFDictionary *create_stateaddr( uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, unsigned int a6, int a7, int a8, void *value, void *a10)
{
  int valuePtr = a8;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    CFMutableArrayRef v17 = CFArrayCreateMutable(0LL, 1LL, &kCFTypeArrayCallBacks);
    if (v17)
    {
      int v18 = v17;
      CFStringRef v19 = CFStringCreateWithFormat( 0LL,  0LL,  @"%d.%d.%d.%d",  a5,  BYTE1(a5),  BYTE2(a5),  HIBYTE(a5));
      if (v19)
      {
        CFStringRef v20 = v19;
        CFArrayAppendValue(v18, v19);
        CFRelease(v20);
        CFDictionarySetValue(Mutable, kSCPropNetIPv4Addresses, v18);
      }

      CFRelease(v18);
    }

    CFStringRef v21 = CFStringCreateWithFormat( 0LL,  0LL,  @"%d.%d.%d.%d",  a6,  BYTE1(a6),  BYTE2(a6),  HIBYTE(a6));
    if (v21)
    {
      CFStringRef v22 = v21;
      CFDictionarySetValue(Mutable, kSCPropNetIPv4Router, v21);
      CFRelease(v22);
    }

    CFNumberRef v23 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
    if (v23)
    {
      CFNumberRef v24 = v23;
      CFDictionarySetValue(Mutable, kSCPropNetOverridePrimary, v23);
      CFRelease(v24);
    }

    if (a3)
    {
      CFStringRef v25 = CFStringCreateWithFormat(0LL, 0LL, @"%s", a3);
      if (v25)
      {
        CFStringRef v26 = v25;
        CFDictionarySetValue(Mutable, kSCPropInterfaceName, v25);
        CFRelease(v26);
      }
    }

    CFStringRef v27 = CFStringCreateWithFormat( 0LL,  0LL,  @"%d.%d.%d.%d",  a4,  BYTE1(a4),  BYTE2(a4),  HIBYTE(a4));
    if (v27)
    {
      CFStringRef v28 = v27;
      CFDictionarySetValue(Mutable, @"ServerAddress", v27);
      CFRelease(v28);
    }

    if (!valuePtr)
    {
      uint64_t v29 = _SCNetworkServiceCopyActive(a1, a2);
      if (v29)
      {
        CFSocketNativeHandle v30 = (const void *)v29;
        SCNetworkServiceSetPrimaryRank(v29, 3LL);
        CFRelease(v30);
      }
    }

    if (value) {
      CFDictionarySetValue(Mutable, kSCPropNetIPv4AdditionalRoutes, value);
    }
    if (a10) {
      CFDictionarySetValue(Mutable, kSCPropNetIPv4ExcludedRoutes, a10);
    }
  }

  return Mutable;
}

const __SCDynamicStore *create_dns( const __SCDynamicStore *a1, CFStringRef serviceID, const void *a3, const void *a4, const void *a5, int a6)
{
  CFMutableStringRef MutableCopy = a1;
  if (a1)
  {
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( 0LL,  kSCDynamicStoreDomainState,  serviceID,  kSCEntNetDNS);
    if (NetworkServiceEntity)
    {
      uint64_t v13 = NetworkServiceEntity;
      int v14 = (const __CFDictionary *)SCDynamicStoreCopyValue(MutableCopy, NetworkServiceEntity);
      if (v14)
      {
        __int128 v15 = v14;
        CFMutableStringRef MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, v14);
        CFRelease(v15);
        if (!MutableCopy) {
          goto LABEL_16;
        }
      }

      else
      {
        CFMutableStringRef MutableCopy = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        if (!MutableCopy)
        {
LABEL_16:
          CFRelease(v13);
          return MutableCopy;
        }
      }

      CFTypeID v16 = CFGetTypeID(MutableCopy);
      if (v16 == CFDictionaryGetTypeID())
      {
        CFDictionarySetValue(MutableCopy, kSCPropNetDNSServerAddresses, a3);
        if (a4) {
          CFDictionarySetValue(MutableCopy, kSCPropNetDNSDomainName, a4);
        }
        if (a5) {
          CFDictionarySetValue(MutableCopy, kSCPropNetDNSSupplementalMatchDomains, a5);
        }
        if (a6) {
          AddNumber(MutableCopy, kSCPropNetDNSSupplementalMatchDomainsNoSearch, 1);
        }
        CFDictionarySetValue(MutableCopy, kSCPropNetDNSConfirmedServiceID, serviceID);
        notify_post("com.apple.system.dns.delay");
      }

      goto LABEL_16;
    }

    return 0LL;
  }

  return MutableCopy;
}

BOOL equal_address(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 1);
  if (v2 == 30) {
    return *(void *)(a1 + 8) == *(void *)(a2 + 8) && *(void *)(a1 + 16) == *(void *)(a2 + 16);
  }
  if (v2 != 2) {
    return 0LL;
  }
  return *(_DWORD *)(a1 + 4) == *(_DWORD *)(a2 + 4);
}

uint64_t route_gateway(int a1, uint64_t a2, _OWORD *a3, _OWORD *a4, int a5, int a6)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  int v7 = *(unsigned __int8 *)(a2 + 1);
  if (v7 == 30 || v7 == 2)
  {
    int v14 = socket(17, 3, 17);
    if (v14 < 0)
    {
      CFStringRef v19 = __error();
      CFStringRef v20 = strerror(*v19);
      syslog(6, "route_gateway: open routing socket failed, %s", v20);
    }

    else
    {
      int v15 = v14;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      memset(v32, 0, sizeof(v32));
      __int128 v31 = 0u;
      __int128 v30 = 0u;
      __int128 v29 = 0u;
      char v26 = a1;
      if (a5) {
        unsigned int v16 = 2051;
      }
      else {
        unsigned int v16 = 2049;
      }
      if (a6) {
        v16 |= 0x1000u;
      }
      char v25 = 5;
      LODWORD(v28) = 1;
      *(void *)((char *)&v27 + 4) = v16 | 0x700000000LL;
      if (*(_BYTE *)(a2 + 1) == 2)
      {
        *(_OWORD *)&v32[8] = *(_OWORD *)a2;
        if (a4) {
          *(_OWORD *)&v32[24] = *a4;
        }
        if (a3) {
          *(_OWORD *)&v32[40] = *a3;
        }
        unsigned int v17 = 140;
      }

      else
      {
        *(_OWORD *)&v32[8] = *(_OWORD *)a2;
        *(_OWORD *)&v32[20] = *(_OWORD *)(a2 + 12);
        if (a4)
        {
          *(_OWORD *)&v32[36] = *a4;
          *(_OWORD *)&v32[48] = *(_OWORD *)((char *)a4 + 12);
        }

        if (a3)
        {
          *(_OWORD *)&v32[64] = *a3;
          *(_OWORD *)&v32[76] = *(_OWORD *)((char *)a3 + 12);
        }

        unsigned int v17 = 176;
      }

      __int16 __buf = v17;
      if ((write(v14, &__buf, v17) & 0x8000000000000000LL) == 0)
      {
        close(v15);
        return 0LL;
      }

      if (a1 == 2) {
        int v21 = 7;
      }
      else {
        int v21 = 3;
      }
      CFStringRef v22 = __error();
      CFNumberRef v23 = strerror(*v22);
      syslog(v21, "route_gateway: write routing socket failed, %s", v23);
      close(v15);
    }
  }

  return 0xFFFFFFFFLL;
}

uint64_t set_host_gateway(int a1, uint64_t a2, uint64_t a3, const char *a4, int a5)
{
  if (!a2) {
    return 0LL;
  }
  int v6 = *(unsigned __int8 *)(a2 + 1);
  if (v6 != 30 && v6 != 2) {
    return 0LL;
  }
  int v12 = socket(17, 3, 17);
  if (v12 < 0)
  {
    unsigned int v16 = __error();
    unsigned int v17 = strerror(*v16);
    syslog(6, "host_gateway: open routing socket failed, %s", v17);
    return 0LL;
  }

  int v13 = v12;
  int v34 = 0;
  __int128 v33 = 0u;
  memset(v32, 0, sizeof(v32));
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 __buf = 0u;
  BYTE3(__buf) = a1;
  if (a5) {
    int v14 = 2305;
  }
  else {
    int v14 = 2053;
  }
  DWORD2(__buf) = v14;
  if (a3)
  {
    int v15 = *(unsigned __int8 *)(a3 + 1);
    if (v15 != 30)
    {
      if (v15 != 2 || !*(_DWORD *)(a3 + 4)) {
        goto LABEL_22;
      }
LABEL_21:
      DWORD2(__buf) = v14 | 2;
      goto LABEL_22;
    }

    if (*(void *)(a3 + 8)) {
      BOOL v18 = 0;
    }
    else {
      BOOL v18 = *(void *)(a3 + 16) == 0LL;
    }
    if (!v18) {
      goto LABEL_21;
    }
  }

__CFDictionary *create_proxies( uint64_t a1, uint64_t a2, int a3, const void *a4, int a5, int a6, const __CFString *a7, const void *a8)
{
  int v23 = a6;
  int v24 = a5;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    int valuePtr = 1;
    CFNumberRef v13 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
    if (v13)
    {
      CFNumberRef v14 = v13;
      if (a3)
      {
        CFDictionarySetValue(Mutable, kSCPropNetProxiesProxyAutoDiscoveryEnable, v13);
      }

      else if (a4)
      {
        CFDictionarySetValue(Mutable, kSCPropNetProxiesFTPEnable, v13);
        CFDictionarySetValue(Mutable, kSCPropNetProxiesHTTPEnable, v14);
        CFDictionarySetValue(Mutable, kSCPropNetProxiesHTTPSEnable, v14);
        CFNumberRef v16 = CFNumberCreate(0LL, kCFNumberIntType, &v24);
        if (!v16) {
          goto LABEL_7;
        }
        CFNumberRef v17 = v16;
        CFDictionarySetValue(Mutable, kSCPropNetProxiesFTPPort, v16);
        CFDictionarySetValue(Mutable, kSCPropNetProxiesHTTPPort, v17);
        CFDictionarySetValue(Mutable, kSCPropNetProxiesHTTPSPort, v17);
        CFRelease(v17);
        CFDictionarySetValue(Mutable, kSCPropNetProxiesFTPProxy, a4);
        CFDictionarySetValue(Mutable, kSCPropNetProxiesHTTPProxy, a4);
        CFDictionarySetValue(Mutable, kSCPropNetProxiesHTTPSProxy, a4);
        CFNumberRef v18 = CFNumberCreate(0LL, kCFNumberIntType, &v23);
        if (!v18)
        {
LABEL_7:
          CFRelease(v14);
          return Mutable;
        }

        CFNumberRef v19 = v18;
        CFDictionarySetValue(Mutable, kSCPropNetProxiesExcludeSimpleHostnames, v18);
        CFRelease(v19);
        if (a7)
        {
          CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0LL, a7, @";");
          if (ArrayBySeparatingStrings)
          {
            CFArrayRef v21 = ArrayBySeparatingStrings;
            CFDictionarySetValue(Mutable, kSCPropNetProxiesExceptionsList, ArrayBySeparatingStrings);
            CFRelease(v21);
          }
        }
      }

      if (a8) {
        CFDictionarySetValue(Mutable, kSCPropNetProxiesSupplementalMatchDomains, a8);
      }
      goto LABEL_7;
    }
  }

  return Mutable;
}

uint64_t create_tun_interface(void *a1, socklen_t a2, unsigned int *a3, int a4, int a5)
{
  socklen_t v15 = 0;
  uint64_t v10 = socket(32, 2, 2);
  if ((_DWORD)v10 == -1)
  {
    __error();
    SCLog(1LL, 3LL, @"create_tun_interface: cannot create kernel control socket (errno = %d)");
    return v10;
  }

  int v20 = 0;
  memset(v19, 0, sizeof(v19));
  __strlcpy_chk((char *)v19 + 4, "com.apple.net.utun_control", 96LL, 96LL);
  if (ioctl(v10, 0xC0644E03uLL, v19))
  {
    __error();
    int v11 = @"create_tun_interface: ioctl failed on kernel control socket (errno = %d)";
LABEL_11:
    SCLog(1LL, 3LL, v11);
    close(v10);
    return 0xFFFFFFFFLL;
  }

  uint64_t v17 = 0LL;
  *(void *)&v16[12] = 0LL;
  int v18 = 0;
  *(_DWORD *)CFNumberRef v16 = 139296;
  *(_DWORD *)&void v16[4] = v19[0];
  *(_DWORD *)&v16[8] = 0;
  if (a4)
  {
    if (!bind(v10, (const sockaddr *)v16, 0x20u))
    {
      int v14 = a4;
      socklen_t v15 = 4;
      if (setsockopt(v10, 2, 1, &v14, 4u))
      {
        int v12 = @"create_tun_interface: setsockopt flags failed on kernel control socket (errno = %d)";
LABEL_15:
        __error();
        int v11 = v12;
        goto LABEL_11;
      }

      if (connect(v10, (const sockaddr *)v16, 0x20u))
      {
        int v12 = @"create_tun_interface: connect failed on kernel control socket (errno = %d)";
        goto LABEL_15;
      }

      goto LABEL_16;
    }

LABEL_10:
    __error();
    int v11 = @"create_tun_interface: connect failed on kernel control socket (errno = %d)";
    goto LABEL_11;
  }

  if (connect(v10, (const sockaddr *)v16, 0x20u)) {
    goto LABEL_10;
  }
LABEL_16:
  socklen_t v15 = a2;
  if (getsockopt(v10, 2, 2, a1, &v15))
  {
    __error();
    int v11 = @"create_tun_interface: getsockopt ifname failed on kernel control socket (errno = %d)";
    goto LABEL_11;
  }

  *a3 = if_nametoindex((const char *)a1);
  if (a5)
  {
    int v14 = 1;
    if (setsockopt(v10, 2, 3, &v14, 4u))
    {
      __error();
      int v11 = @"create_tun_interface: setsockopt externat stats failed on kernel control socket (errno = %d)";
      goto LABEL_11;
    }
  }

  return v10;
}

  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

uint64_t set_tun_delegate(int a1, char *__s)
{
  socklen_t v4 = strlen(__s);
  uint64_t v5 = setsockopt(a1, 2, 15, __s, v4);
  if ((_DWORD)v5)
  {
    int v6 = __error();
    strerror(*v6);
    SCLog( 1LL,  3LL,  @"set_tun_delegate: setsockopt delegate interface failed on kernel control socket (errno = %s)");
  }

  return v5;
}

uint64_t event_create_socket( void *a1, CFSocketNativeHandle *a2, CFSocketRef *a3, void (__cdecl *a4)(CFSocketRef, CFSocketCallBackType, CFDataRef, const void *, void *), int a5)
{
  context.version = 0LL;
  memset(&context.retain, 0, 24);
  context.mach_timebase_info info = a1;
  int v9 = socket(32, 3, 1);
  *a2 = v9;
  if (v9 < 0)
  {
    __error();
    SCLog(1LL, 3LL, @"event_create_socket cannot create event socket (errno = %d) ");
  }

  else
  {
    uint64_t v15 = 0x100000001LL;
    BOOL v16 = a5 == 0;
    ioctl(v9, 0x800C6502uLL, &v15);
    uint64_t v10 = CFSocketCreateWithNative(0LL, *a2, 1uLL, a4, &context);
    *a3 = v10;
    if (!v10) {
      goto LABEL_8;
    }
    CFRunLoopSourceRef RunLoopSource = CFSocketCreateRunLoopSource(0LL, v10, 0LL);
    if (RunLoopSource)
    {
      int v12 = RunLoopSource;
      CFAbsoluteTime Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v12, kCFRunLoopDefaultMode);
      CFRelease(v12);
      return 0LL;
    }
  }

  if (!*a3)
  {
LABEL_8:
    if ((*a2 & 0x80000000) == 0) {
      close(*a2);
    }
    goto LABEL_10;
  }

  CFSocketInvalidate(*a3);
  CFRelease(*a3);
LABEL_10:
  *a3 = 0LL;
  uint64_t result = 0xFFFFFFFFLL;
  *a2 = -1;
  return result;
}

__CFData *SCNCPluginExecCallbackRunLoopSourceInit(CFRunLoopRef Current, uint64_t a2, uint64_t a3)
{
  CFMutableDictionaryRef Mutable = CFDataCreateMutable(0LL, 264LL);
  int v7 = Mutable;
  if (Mutable)
  {
    CFDataSetLength(Mutable, 264LL);
    MutableBytePtr = CFDataGetMutableBytePtr(v7);
    CFRunLoopRef v10 = 0LL;
    v12.version = 0LL;
    memset(&v12.retain, 0, 56);
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    uint64_t v23 = 0LL;
    v12.mach_timebase_info info = v7;
    v12.perform = (void (__cdecl *)(void *))sub_1DAA4;
    CFRunLoopSourceRef v11 = CFRunLoopSourceCreate(0LL, 0LL, &v12);
    if (v11)
    {
      *((void *)&v22 + 1) = a2;
      uint64_t v23 = a3;
      if (!Current) {
        CFAbsoluteTime Current = CFRunLoopGetCurrent();
      }
      CFRunLoopRef v10 = Current;
      CFRetain(Current);
      CFRunLoopAddSource(Current, v11, kCFRunLoopDefaultMode);
      memmove(MutableBytePtr, &v10, 0x108uLL);
    }

    else
    {
      CFRelease(v7);
      return 0LL;
    }
  }

  return v7;
}

void sub_1DAA4(__CFData *a1)
{
  CFTypeID TypeID = CFDataGetTypeID();
  if (a1 && CFGetTypeID(a1) == TypeID)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(a1);
    socklen_t v4 = MutableBytePtr;
    uint64_t v5 = (void (*)(void, void, UInt8 *, void))*((void *)MutableBytePtr + 31);
    if (v5) {
      v5( *((unsigned int *)MutableBytePtr + 24),  *((unsigned int *)MutableBytePtr + 25),  MutableBytePtr + 104,  *((void *)MutableBytePtr + 32));
    }
    CFRunLoopSourceInvalidate(*((CFRunLoopSourceRef *)v4 + 1));
    CFRelease(*((CFTypeRef *)v4 + 1));
    CFRelease(*(CFTypeRef *)v4);
    CFRelease(a1);
  }

uint64_t SCNCPluginExecCommand( __CFRunLoop *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  CFRunLoopSourceRef v11 = SCNCPluginExecCallbackRunLoopSourceInit(a1, a2, a3);
  if (v11) {
    return _SCDPluginExecCommand(sub_1DBA4, v11, a4, a5, a6, a7);
  }
  SCLog(1LL, 3LL, @"SCNC: failed to initialize plugin exec_callback's runloop source");
  return 0xFFFFFFFFLL;
}

void sub_1DBA4(int a1, int a2, const void *a3, __CFData *a4)
{
  CFTypeID TypeID = CFDataGetTypeID();
  if (a4)
  {
    if (CFGetTypeID(a4) == TypeID)
    {
      MutableBytePtr = CFDataGetMutableBytePtr(a4);
      *((_DWORD *)MutableBytePtr + 24) = a1;
      *((_DWORD *)MutableBytePtr + 25) = a2;
      memmove(MutableBytePtr + 104, a3, 0x90uLL);
      CFRunLoopSourceSignal(*((CFRunLoopSourceRef *)MutableBytePtr + 1));
      CFRunLoopWakeUp(*(CFRunLoopRef *)MutableBytePtr);
    }
  }

uint64_t SCNCPluginExecCommand2( __CFRunLoop *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __int128 v14 = SCNCPluginExecCallbackRunLoopSourceInit(a1, a2, a3);
  if (v14) {
    return _SCDPluginExecCommand2(sub_1DBA4, v14, a4, a5, a6, a7, a8, a9);
  }
  SCLog(1LL, 3LL, @"SCNC: failed to initialize plugin exec_callback's runloop source");
  return 0xFFFFFFFFLL;
}

uint64_t SCNCExecSBSLauncherCommandWithArguments( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  __int128 v14 = CFBundleCopyResourcesDirectoryURL((CFBundleRef)gBundleRef);
  if (!v14) {
    return 0LL;
  }
  __int128 v15 = v14;
  __int128 v16 = CFURLCopyAbsoluteURL(v14);
  if (v16)
  {
    __int128 v17 = v16;
    __int128 v18 = CFURLCopyPath(v16);
    if (v18)
    {
      __int128 v19 = v18;
      if (CFStringGetCString(v18, buffer, 1024LL, 0))
      {
        __strlcat_chk(buffer, "sbslauncher", 1024LL, 1024LL);
        v29[0] = "sbslauncher";
        v29[1] = a1;
        __int128 v28 = &a10;
        uint64_t v20 = a9;
        if (a9)
        {
          unint64_t v21 = 2LL;
          do
          {
            uint64_t v22 = v21 + 1;
            v29[v21] = v20;
            uint64_t v23 = v28++;
            uint64_t v20 = *v23;
            if (v20) {
              BOOL v24 = v21 >= 0xE;
            }
            else {
              BOOL v24 = 1;
            }
            ++v21;
          }

          while (!v24);
        }

        else
        {
          uint64_t v22 = 2LL;
        }

        v29[v22] = 0LL;
        if (a2) {
          uint64_t v26 = SCNCPluginExecCommand2(0LL, a3, a4, 0LL, 0LL, (uint64_t)buffer, (uint64_t)v29, a2, a4);
        }
        else {
          uint64_t v26 = SCNCPluginExecCommand(0LL, a3, a4, 0LL, 0LL, (uint64_t)buffer, (uint64_t)v29);
        }
        uint64_t v25 = v26;
      }

      else
      {
        uint64_t v25 = 0LL;
      }

      CFRelease(v19);
    }

    else
    {
      uint64_t v25 = 0LL;
    }

    CFRelease(v17);
  }

  else
  {
    uint64_t v25 = 0LL;
  }

  CFRelease(v15);
  return v25;
}

CFIndex extractEnvironmentVariablesApplierFunction(const __CFString *a1, const __CFString *a2, uint64_t a3)
{
  CFTypeID TypeID = CFStringGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID) {
    return SCLog(1LL, 3LL, @"invalid EnvironmentVariables key");
  }
  uint64_t v7 = *(int *)(a3 + 528);
  CFStringRef v8 = (UInt8 *)(*(void *)(a3 + 512) + (v7 << 8));
  uint64_t v9 = *(void *)(a3 + 520);
  *CFStringRef v8 = 0;
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v11 = Length;
  v20.CFIndex location = 0LL;
  v20.length = Length;
  if (CFStringGetBytes(a1, v20, 0x8000100u, 0, 0, v8, 256LL, 0LL) <= 0) {
    return SCLog(1LL, 3LL, @"invalid EnvironmentVariables key %@, value %@");
  }
  CFRunLoopSourceContext v12 = (UInt8 *)(v9 + (v7 << 8));
  v8[v11] = 0;
  ++*(_DWORD *)(a3 + 528);
  *CFRunLoopSourceContext v12 = 0;
  CFTypeID v13 = CFStringGetTypeID();
  if (!a2)
  {
    CFNumberGetTypeID();
    CFBooleanGetTypeID();
    return SCLog(1LL, 3LL, @"invalid EnvironmentVariables key %@, value %@");
  }

  if (CFGetTypeID(a2) == v13)
  {
    CFIndex v14 = CFStringGetLength(a2);
    if ((unint64_t)(v14 - 256) >= 0xFFFFFFFFFFFFFF01LL)
    {
      CFIndex v15 = v14;
      v21.CFIndex location = 0LL;
      v21.length = v14;
      CFIndex result = CFStringGetBytes(a2, v21, 0x8000100u, 0, 0, v12, 256LL, 0LL);
      if (result > 0)
      {
        v12[v15] = 0;
        return result;
      }
    }

    return SCLog(1LL, 3LL, @"invalid EnvironmentVariables key %@, value %@");
  }

  CFTypeID v17 = CFNumberGetTypeID();
  if (CFGetTypeID(a2) == v17)
  {
    uint64_t valuePtr = 0LL;
    if (CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt64Type, &valuePtr)) {
      return snprintf((char *)v12, 0x100uLL, "%lld");
    }
    return SCLog(1LL, 3LL, @"invalid EnvironmentVariables key %@, value %@");
  }

  CFTypeID v18 = CFBooleanGetTypeID();
  if (CFGetTypeID(a2) != v18) {
    return SCLog(1LL, 3LL, @"invalid EnvironmentVariables key %@, value %@");
  }
  CFBooleanGetValue((CFBooleanRef)a2);
  return snprintf((char *)v12, 0x100uLL, "%s");
}

CFPropertyListRef collectEnvironmentVariables(const __SCDynamicStore *a1, const __CFString *a2)
{
  if (a1)
  {
    if (a2) {
      return copyEntity(a1, kSCDynamicStoreDomainSetup, a2, @"EnvironmentVariables");
    }
    CFIndex v3 = @"invalid serviceID passed to %s";
  }

  else
  {
    CFIndex v3 = @"invalid DynamicStore passed to %s";
  }

  SCLog(1LL, 3LL, v3);
  return 0LL;
}

void extractEnvironmentVariables(const __CFDictionary *a1, uint64_t a2)
{
  if (a1)
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (CFGetTypeID(a1) == TypeID && CFDictionaryGetCount(a1) >= 1)
    {
      CFIndex Count = CFDictionaryGetCount(a1);
      int v6 = *(void **)(a2 + 512);
      if (v6)
      {
        free(v6);
        *(void *)(a2 + 512) = 0LL;
      }

      uint64_t v7 = *(void **)(a2 + 520);
      if (v7) {
        free(v7);
      }
      *(_DWORD *)(a2 + 528) = 0;
      size_t v8 = Count << 8;
      uint64_t v9 = malloc(v8);
      *(void *)(a2 + 512) = v9;
      CFRunLoopRef v10 = malloc(v8);
      *(void *)(a2 + 520) = v10;
      if (v9 && v10)
      {
        CFDictionaryApplyFunction( a1,  (CFDictionaryApplierFunction)extractEnvironmentVariablesApplierFunction,  (void *)a2);
        return;
      }

      CFIndex v11 = @"Failed to allocate for environment variables";
    }

    else
    {
      CFIndex v11 = @"empty or invalid EnvironmentVariables dictionary";
    }

    SCLog(1LL, 3LL, v11);
  }

void applyEnvironmentVariables(uint64_t a1)
{
  if (*(int *)(a1 + 528) >= 1)
  {
    uint64_t v2 = 0LL;
    uint64_t v3 = 0LL;
    do
    {
      uint64_t v4 = *(void *)(a1 + 512);
      if (v4)
      {
        unsetenv((const char *)(v4 + v2));
        uint64_t v5 = *(void *)(a1 + 520);
        if (v5) {
          setenv((const char *)(*(void *)(a1 + 512) + v2), (const char *)(v5 + v2), 1);
        }
      }

      ++v3;
      v2 += 256LL;
    }

    while (v3 < *(int *)(a1 + 528));
  }

  *(_DWORD *)(a1 + 528) = 0;
  int v6 = *(void **)(a1 + 512);
  if (v6)
  {
    free(v6);
    *(void *)(a1 + 512) = 0LL;
  }

  uint64_t v7 = *(void **)(a1 + 520);
  if (v7)
  {
    free(v7);
    *(void *)(a1 + 520) = 0LL;
  }

char *scnc_get_reason_str(int a1)
{
  switch(a1)
  {
    case 1:
      CFIndex result = scnc_ctrl_stopped[0];
      break;
    case 2:
      CFIndex result = scnc_sys_sleep[0];
      break;
    case 3:
      CFIndex result = scnc_usr_logout[0];
      break;
    case 4:
      CFIndex result = scnc_usr_switch[0];
      break;
    case 5:
    case 6:
      CFIndex result = scnc_sock_disco[0];
      break;
    case 7:
      CFIndex result = scnc_plugin_chg[0];
      break;
    case 8:
      CFIndex result = scnc_app_rem[0];
      break;
    case 9:
    case 10:
      CFIndex result = scnc_usr_req[0];
      break;
    case 11:
      CFIndex result = scnc_term_all[0];
      break;
    case 12:
      CFIndex result = scnc_serv_disp[0];
      break;
    default:
      CFIndex result = 0LL;
      break;
  }

  return result;
}

char *ppp_error_to_string(int a1)
{
  CFIndex result = 0LL;
  switch(a1)
  {
    case 1:
      CFIndex result = ppp_fatal[0];
      break;
    case 2:
      CFIndex result = ppp_option[0];
      break;
    case 3:
      CFIndex result = ppp_not_root[0];
      break;
    case 4:
      CFIndex result = ppp_no_kern[0];
      break;
    case 5:
      CFIndex result = ppp_user_req[0];
      break;
    case 6:
      CFIndex result = ppp_lock_fail[0];
      break;
    case 7:
      CFIndex result = ppp_open_fail[0];
      break;
    case 8:
      CFIndex result = ppp_conn_fail[0];
      break;
    case 9:
      CFIndex result = ppp_pty_fail[0];
      break;
    case 10:
      CFIndex result = ppp_nego_fail[0];
      break;
    case 11:
      CFIndex result = ppp_peer_auth_fail[0];
      break;
    case 12:
      CFIndex result = ppp_idle_tmo[0];
      break;
    case 13:
      CFIndex result = ppp_sess_tmo[0];
      break;
    case 14:
      CFIndex result = ppp_callback[0];
      break;
    case 15:
      CFIndex result = ppp_peer_dead[0];
      break;
    case 16:
      CFIndex result = ppp_disco_by_dev[0];
      break;
    case 17:
      CFIndex result = ppp_loopback[0];
      break;
    case 18:
      CFIndex result = ppp_init_fail[0];
      break;
    case 19:
      CFIndex result = ppp_auth_fail[0];
      break;
    case 20:
      CFIndex result = ppp_term_fail[0];
      break;
    case 21:
      CFIndex result = ppp_dev_err[0];
      break;
    case 23:
      CFIndex result = ppp_peer_unauth[0];
      break;
    case 24:
      CFIndex result = ppp_cnid_auth_fail[0];
      break;
    case 25:
      CFIndex result = ppp_peer_unreach[0];
      break;
    default:
      return result;
  }

  return result;
}

char *ppp_dev_error_to_string(int a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a1)
  {
    if (a1 != 2)
    {
      if (a1 == 5)
      {
        CFIndex result = 0LL;
        switch(a2)
        {
          case 1:
            goto LABEL_10;
          case 2:
            goto LABEL_12;
          case 5:
            CFIndex result = ppp_dev_prot_err[0];
            break;
          case 6:
            CFIndex result = ppp_dev_net_chg[0];
            break;
          case 7:
            CFIndex result = ppp_dev_psk[0];
            break;
          case 8:
            CFIndex result = ppp_dev_cert[0];
            break;
          default:
            return result;
        }

        return result;
      }

      return 0LL;
    }

    switch(a2)
    {
      case 1:
LABEL_10:
        CFIndex result = ppp_dev_no_srvr[0];
        break;
      case 2:
        CFIndex result = ppp_dev_no_srvc[0];
        break;
      case 3:
        CFIndex result = ppp_dev_no_ac[0];
        break;
      case 4:
        CFIndex result = ppp_dev_no_ac_srvc[0];
        break;
      case 5:
        CFIndex result = ppp_dev_conn_refuse[0];
        break;
      default:
        return 0LL;
    }
  }

  else
  {
    CFIndex result = 0LL;
    switch(a2)
    {
      case 1:
        CFIndex result = ppp_dev_no_car[0];
        break;
      case 2:
        CFIndex result = ppp_dev_no_num[0];
        break;
      case 3:
        CFIndex result = ppp_dev_busy[0];
        break;
      case 4:
        CFIndex result = ppp_dev_no_dial[0];
        break;
      case 5:
        CFIndex result = ppp_dev_modem_err[0];
        break;
      case 6:
LABEL_12:
        CFIndex result = ppp_dev_no_ans[0];
        break;
      case 7:
        CFIndex result = ppp_dev_hang[0];
        break;
      case 9:
        CFIndex result = ppp_dev_bad_script[0];
        break;
      default:
        return result;
    }
  }

  return result;
}

char *ipsec_error_to_string(int a1)
{
  switch(a1)
  {
    case 1:
      CFIndex result = ipsec_gen_err[0];
      break;
    case 2:
      CFIndex result = ipsec_no_srvr_addr[0];
      break;
    case 3:
      CFIndex result = ipsec_no_psk[0];
      break;
    case 4:
      CFIndex result = ipsec_no_cert[0];
      break;
    case 5:
      CFIndex result = ipsec_dns_err[0];
      break;
    case 6:
      CFIndex result = ipsec_no_local[0];
      break;
    case 7:
      CFIndex result = ipsec_cfg_err[0];
      break;
    case 8:
      CFIndex result = ipsec_ctrl_err[0];
      break;
    case 9:
      CFIndex result = ipsec_conn_err[0];
      break;
    case 10:
      CFIndex result = ipsec_nego_err[0];
      break;
    case 11:
      CFIndex result = ipsec_psk_err[0];
      break;
    case 12:
      CFIndex result = ipsec_srvr_cert_err[0];
      break;
    case 13:
      CFIndex result = ipsec_cli_cert_err[0];
      break;
    case 14:
      CFIndex result = ipsec_xauth_err[0];
      break;
    case 15:
      CFIndex result = ipsec_net_chg[0];
      break;
    case 16:
      CFIndex result = ipsec_peer_disco[0];
      break;
    case 17:
      CFIndex result = ipsec_peer_dead[0];
      break;
    case 18:
      CFIndex result = ipsec_edge_err[0];
      break;
    case 19:
      CFIndex result = ipsec_idle_tmo[0];
      break;
    case 20:
      CFIndex result = ipsec_cli_cert_pre[0];
      break;
    case 21:
      CFIndex result = ipsec_cli_cert_exp[0];
      break;
    case 22:
      CFIndex result = ipsec_srvr_cert_pre[0];
      break;
    case 23:
      CFIndex result = ipsec_srvr_cert_exp[0];
      break;
    case 24:
      CFIndex result = ipsec_srvr_cert_id[0];
      break;
    default:
      CFIndex result = 0LL;
      break;
  }

  return result;
}

char *vpn_error_to_string(int a1)
{
  CFIndex result = 0LL;
  switch(a1)
  {
    case 1:
      CFIndex result = vpn_gen_err[0];
      break;
    case 2:
      CFIndex result = vpn_no_srvr_addr[0];
      break;
    case 3:
      CFIndex result = vpn_no_cert[0];
      break;
    case 4:
      CFIndex result = vpn_dns_err[0];
      break;
    case 5:
      CFIndex result = vpn_no_local[0];
      break;
    case 6:
      CFIndex result = vpn_cfg_err[0];
      break;
    case 7:
      CFIndex result = vpn_ctrl_err[0];
      break;
    case 8:
      CFIndex result = vpn_conn_err[0];
      break;
    case 9:
      CFIndex result = vpn_net_chg[0];
      break;
    case 10:
      CFIndex result = vpn_peer_disco[0];
      break;
    case 11:
      CFIndex result = vpn_peer_dead[0];
      break;
    case 12:
      CFIndex result = vpn_peer_unresp[0];
      break;
    case 13:
      CFIndex result = vpn_nego_err[0];
      break;
    case 14:
      CFIndex result = vpn_xauth_err[0];
      break;
    case 15:
      CFIndex result = vpn_edge_err[0];
      break;
    case 16:
      CFIndex result = vpn_idle_tmo[0];
      break;
    case 17:
      CFIndex result = vpn_addr_invalid[0];
      break;
    case 18:
      CFIndex result = vpn_ap_req[0];
      break;
    case 20:
      CFIndex result = vpn_cli_cert_pre[0];
      break;
    case 21:
      CFIndex result = vpn_cli_cert_exp[0];
      break;
    case 22:
      CFIndex result = vpn_srvr_cert_pre[0];
      break;
    case 23:
      CFIndex result = vpn_srvr_cert_exp[0];
      break;
    case 24:
      CFIndex result = vpn_srvr_cert_id[0];
      break;
    case 25:
      CFIndex result = vpn_plugin_upd[0];
      break;
    case 26:
      CFIndex result = vpn_plugin_dis;
      break;
    default:
      return result;
  }

  return result;
}

void cleanup_dynamicstore(uint64_t a1)
{
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( 0LL,  kSCDynamicStoreDomainState,  *(CFStringRef *)(a1 + 24),  kSCCompAnyRegex);
  if (NetworkServiceEntity)
  {
    uint64_t v2 = NetworkServiceEntity;
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      uint64_t v4 = Mutable;
      CFArrayAppendValue(Mutable, v2);
      uint64_t v5 = SCDynamicStoreCopyMultiple((SCDynamicStoreRef)gDynamicStore, 0LL, v4);
      if (v5)
      {
        int v6 = v5;
        CFDictionaryApplyFunction(v5, (CFDictionaryApplierFunction)sub_1E994, (void *)gDynamicStore);
        CFRelease(v2);
        uint64_t v2 = v4;
        uint64_t v4 = v6;
      }

      CFRelease(v2);
      uint64_t v2 = v4;
    }

    CFRelease(v2);
  }

uint64_t sub_1E994(CFStringRef key, int a2, SCDynamicStoreRef store)
{
  uint64_t result = SCDynamicStoreRemoveValue(store, key);
  if (!(_DWORD)result) {
    return SCLog(1LL, 3LL, @"PPP Controller: removekeys SCDynamicStoreRemoveValue fails to remove key %@.");
  }
  return result;
}

CFStringRef copy_primary_interface_name(const __CFString *a1)
{
  CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0LL, kSCDynamicStoreDomainState, kSCEntNetIPv4);
  if (NetworkGlobalEntity)
  {
    CFPropertyListRef v3 = SCDynamicStoreCopyValue((SCDynamicStoreRef)gDynamicStore, NetworkGlobalEntity);
    CFRelease(NetworkGlobalEntity);
    int Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v3, kSCDynamicStorePropNetPrimaryInterface);
    if (isString(Value))
    {
      uint64_t v5 = CFDictionaryGetValue((CFDictionaryRef)v3, kSCDynamicStorePropNetPrimaryService);
      if (a1 && v5 && CFEqual(v5, a1))
      {
        CFStringRef NetworkGlobalEntity = 0LL;
        int v6 = 1;
      }

      else
      {
        CFStringRef NetworkGlobalEntity = CFStringCreateCopy(0LL, Value);
        int v6 = 0;
      }
    }

    else
    {
      int v6 = 0;
      CFStringRef NetworkGlobalEntity = 0LL;
    }

    CFRelease(v3);
    if (a1)
    {
      if (v6 && !NetworkGlobalEntity)
      {
        CFStringRef v7 = copy_interface_name(a1);
        uint64_t v8 = nwi_state_copy();
        uint64_t v9 = v8;
        if (!v7 || !v8)
        {
LABEL_24:
          if (v7) {
            goto LABEL_27;
          }
          goto LABEL_28;
        }

        uint64_t first_ifstate = nwi_state_get_first_ifstate(v8, 2LL);
        if (!first_ifstate)
        {
          CFStringRef NetworkGlobalEntity = 0LL;
          goto LABEL_27;
        }

        uint64_t next = first_ifstate;
        while (1)
        {
          ifname = (const char *)nwi_ifstate_get_ifname(next);
          CFStringRef v13 = CFStringCreateWithCString(kCFAllocatorDefault, ifname, 0x600u);
          if (v13)
          {
            CFStringRef NetworkGlobalEntity = v13;
            if (!CFEqual(v13, v7) && (~nwi_ifstate_get_flags(next) & 5) == 0)
            {
              CFRetain(NetworkGlobalEntity);
              CFRelease(NetworkGlobalEntity);
LABEL_27:
              CFRelease(v7);
LABEL_28:
              nwi_state_release(v9);
              return NetworkGlobalEntity;
            }

            CFRelease(NetworkGlobalEntity);
          }

          uint64_t next = nwi_ifstate_get_next(next, 2LL);
          if (!next)
          {
            CFStringRef NetworkGlobalEntity = 0LL;
            goto LABEL_24;
          }
        }
      }
    }
  }

  return NetworkGlobalEntity;
}

CFStringRef copy_interface_name(const __CFString *a1)
{
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  a1,  kSCEntNetIPv4);
  if (!NetworkServiceEntity) {
    return 0LL;
  }
  CFPropertyListRef v3 = NetworkServiceEntity;
  uint64_t v4 = (const __CFDictionary *)SCDynamicStoreCopyValue((SCDynamicStoreRef)gDynamicStore, NetworkServiceEntity);
  if (v4)
  {
    uint64_t v5 = v4;
    int Value = (const __CFString *)CFDictionaryGetValue(v4, kSCPropInterfaceName);
    if (Value) {
      CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, Value);
    }
    else {
      CFStringRef Copy = 0LL;
    }
    CFRelease(v3);
  }

  else
  {
    CFStringRef Copy = 0LL;
    uint64_t v5 = (const __CFDictionary *)v3;
  }

  CFRelease(v5);
  return Copy;
}

const void *copy_service_id_for_interface(unint64_t a1)
{
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  kSCCompAnyRegex,  kSCEntNetIPv4);
  CFStringRef v4 = NetworkServiceEntity;
  uint64_t v5 = 0LL;
  int v6 = 0LL;
  CFStringRef v7 = 0LL;
  uint64_t v8 = 0LL;
  if (Mutable) {
    BOOL v9 = NetworkServiceEntity == 0LL;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
LABEL_20:
    if (!v4) {
      goto LABEL_21;
    }
    goto LABEL_32;
  }

  CFArrayAppendValue(Mutable, NetworkServiceEntity);
  uint64_t v5 = SCDynamicStoreCopyMultiple((SCDynamicStoreRef)gDynamicStore, 0LL, Mutable);
  int64_t Count = CFDictionaryGetCount(v5);
  int v6 = (const void **)calloc(Count, 8uLL);
  CFIndex v11 = (const void **)calloc(Count, 8uLL);
  CFStringRef v7 = v11;
  if (v6) {
    BOOL v12 = v11 == 0LL;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12 || (CFDictionaryGetKeysAndValues(v5, v6, v11), Count < 1))
  {
    uint64_t v8 = 0LL;
    goto LABEL_32;
  }

  CFRange v20 = v5;
  uint64_t v13 = 0LL;
  while (1)
  {
    CFIndex v14 = (const __CFString *)v6[v13];
    CFIndex v15 = (const __CFDictionary *)v7[v13];
    if (isString(v14))
    {
      if (isDictionary(v15))
      {
        unint64_t Value = (unint64_t)CFDictionaryGetValue(v15, kSCPropInterfaceName);
        if (!(a1 | Value) || a1 && Value && CFEqual((CFTypeRef)Value, (CFTypeRef)a1)) {
          break;
        }
      }
    }

    if (Count == ++v13) {
      goto LABEL_19;
    }
  }

  if (!CFStringHasPrefix(v14, kSCDynamicStoreDomainState) || !CFStringHasSuffix(v14, kSCEntNetIPv4))
  {
LABEL_19:
    uint64_t v8 = 0LL;
    uint64_t v5 = v20;
    goto LABEL_20;
  }

  CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0LL, v14, @"/");
  uint64_t v8 = 0LL;
  uint64_t v5 = v20;
  if (CFArrayGetCount(ArrayBySeparatingStrings) == 5)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 3LL);
    uint64_t v8 = ValueAtIndex;
    if (ValueAtIndex) {
      CFRetain(ValueAtIndex);
    }
  }

  CFRelease(ArrayBySeparatingStrings);
  if (v4)
  {
LABEL_32:
    CFRelease(v4);
    if (!Mutable) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }

LABEL_21:
  if (Mutable) {
LABEL_22:
  }
    CFRelease(Mutable);
LABEL_23:
  if (v5) {
    CFRelease(v5);
  }
  if (v6) {
    free(v6);
  }
  if (v7) {
    free(v7);
  }
  return v8;
}

CFTypeRef copy_interface_type(const __CFString *a1)
{
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainSetup,  a1,  kSCEntNetInterface);
  CFPropertyListRef v3 = (const __CFDictionary *)SCDynamicStoreCopyValue((SCDynamicStoreRef)gDynamicStore, NetworkServiceEntity);
  if (isDictionary(v3))
  {
    unint64_t Value = (unint64_t)CFDictionaryGetValue(v3, kSCPropNetInterfaceHardware);
    if (isString((const void *)Value))
    {
      if (!(Value | (unint64_t)kSCEntNetAirPort))
      {
LABEL_14:
        CFRunLoopRef v10 = (CFTypeRef *)&kSCValNetVPNOnDemandRuleInterfaceTypeMatchWiFi;
LABEL_27:
        CFTypeRef v8 = CFRetain(*v10);
        goto LABEL_28;
      }

      if (Value) {
        BOOL v5 = kSCEntNetAirPort == 0LL;
      }
      else {
        BOOL v5 = 1;
      }
      if (v5)
      {
        CFStringRef v6 = kSCEntNetEthernet;
        BOOL v7 = kSCEntNetEthernet == 0LL;
      }

      else
      {
        if (CFEqual((CFTypeRef)Value, kSCEntNetAirPort)) {
          goto LABEL_14;
        }
        CFStringRef v6 = kSCEntNetEthernet;
        BOOL v7 = kSCEntNetEthernet == 0LL;
      }

      if (!Value || v7)
      {
        CFIndex v11 = (const void *)kSCEntNetCommCenter;
        BOOL v12 = kSCEntNetCommCenter == 0LL;
        if (!(Value | kSCEntNetCommCenter))
        {
LABEL_26:
          CFRunLoopRef v10 = (CFTypeRef *)&kSCValNetVPNOnDemandRuleInterfaceTypeMatchCellular;
          goto LABEL_27;
        }
      }

      else
      {
        if (CFEqual((CFTypeRef)Value, v6))
        {
LABEL_19:
          CFRunLoopRef v10 = (CFTypeRef *)&kSCValNetVPNOnDemandRuleInterfaceTypeMatchEthernet;
          goto LABEL_27;
        }

        CFIndex v11 = (const void *)kSCEntNetCommCenter;
        BOOL v12 = kSCEntNetCommCenter == 0LL;
      }

      CFTypeRef v8 = 0LL;
      if (!Value || v12)
      {
LABEL_28:
        if (!NetworkServiceEntity) {
          goto LABEL_30;
        }
        goto LABEL_29;
      }

      if (CFEqual((CFTypeRef)Value, v11)) {
        goto LABEL_26;
      }
    }
  }

  CFTypeRef v8 = 0LL;
  if (NetworkServiceEntity) {
LABEL_29:
  }
    CFRelease(NetworkServiceEntity);
LABEL_30:
  if (v3) {
    CFRelease(v3);
  }
  return v8;
}

uint64_t primary_interface_is_cellular(char *a1)
{
  uint64_t v2 = nwi_state_copy();
  if (!v2)
  {
    char v11 = 0;
    uint64_t v10 = 0LL;
    if (!a1) {
      return v10;
    }
    goto LABEL_11;
  }

  uint64_t v3 = v2;
  uint64_t v4 = 0LL;
  char v5 = 1;
  while (1)
  {
    char v6 = v5;
    uint64_t v7 = *((unsigned int *)&unk_2EDF0 + v4);
    uint64_t first_ifstate = nwi_state_get_first_ifstate(v3, v7);
    if (first_ifstate) {
      break;
    }
LABEL_7:
    char v5 = 0;
    uint64_t v4 = 1LL;
    if ((v6 & 1) == 0)
    {
      uint64_t v10 = 0LL;
      char v11 = 0;
      goto LABEL_10;
    }
  }

  uint64_t next = first_ifstate;
  while (nwi_ifstate_get_vpn_server(next))
  {
    uint64_t next = nwi_ifstate_get_next(next, v7);
    if (!next) {
      goto LABEL_7;
    }
  }

  uint64_t v10 = (nwi_ifstate_get_reachability_flags(next) >> 18) & 1;
  char v11 = 1;
LABEL_10:
  nwi_state_release(v3);
  if (a1) {
LABEL_11:
  }
    *a1 = v11;
  return v10;
}

uint64_t interface_is_cellular(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = nwi_state_copy();
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t ifstate = nwi_state_get_ifstate(v2, v1);
      if (ifstate) {
        uint64_t v1 = (nwi_ifstate_get_reachability_flags(ifstate) >> 18) & 1;
      }
      else {
        uint64_t v1 = 0LL;
      }
      nwi_state_release(v3);
    }

    else
    {
      return 0LL;
    }
  }

  return v1;
}

CFPropertyListRef copy_dns_dict(const __CFString *a1)
{
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  a1,  kSCEntNetDNS);
  if (!NetworkServiceEntity) {
    return 0LL;
  }
  uint64_t v3 = NetworkServiceEntity;
  CFPropertyListRef v4 = SCDynamicStoreCopyValue((SCDynamicStoreRef)gDynamicStore, NetworkServiceEntity);
  CFRelease(v3);
  return v4;
}

const void *copy_service_order()
{
  CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0LL, kSCDynamicStoreDomainSetup, kSCEntNetIPv4);
  if (!NetworkGlobalEntity) {
    return 0LL;
  }
  uint64_t v1 = NetworkGlobalEntity;
  uint64_t v2 = (const __CFDictionary *)SCDynamicStoreCopyValue((SCDynamicStoreRef)gDynamicStore, NetworkGlobalEntity);
  if (v2)
  {
    uint64_t v3 = v2;
    unint64_t Value = CFDictionaryGetValue(v2, kSCPropNetServiceOrder);
    char v5 = Value;
    if (Value) {
      CFRetain(Value);
    }
    CFRelease(v3);
  }

  else
  {
    char v5 = 0LL;
  }

  CFRelease(v1);
  return v5;
}

CFStringRef scnc_copy_remote_server(uint64_t a1, BOOL *a2)
{
  if (*(_WORD *)(a1 + 64) == 1)
  {
    uint64_t v3 = &kSCPropNetIPSecRemoteAddress;
LABEL_5:
    CFStringRef v4 = *v3;
    if (!a2) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  if (!*(_WORD *)(a1 + 64))
  {
    uint64_t v3 = &kSCPropNetPPPCommRemoteAddress;
    goto LABEL_5;
  }

  CFStringRef v4 = 0LL;
  if (a2) {
LABEL_6:
  }
    *a2 = 0;
LABEL_7:
  if (!v4) {
    return 0LL;
  }
  unint64_t Value = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), v4);
  CFTypeID TypeID = CFStringGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID && CFStringGetLength(Value) >= 1)
  {
    uint64_t v7 = CFCharacterSetCreateWithCharactersInString(kCFAllocatorDefault, @"/");
    CFTypeRef v8 = CFCharacterSetCreateWithCharactersInString(kCFAllocatorDefault, @":");
    CFRetain(Value);
    v20.length = CFStringGetLength(Value);
    v20.CFIndex location = 0LL;
    if (CFStringFindCharacterFromSet(Value, v7, v20, 0LL, &result))
    {
      BOOL v9 = CFURLCreateWithString(kCFAllocatorDefault, Value, 0LL);
      if (v9)
      {
        uint64_t v10 = v9;
        if (CFURLGetByteRangeForComponent(v9, kCFURLComponentScheme, 0LL).location != -1
          || (CFRelease(v10),
              char v11 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"https://%@", Value),
              uint64_t v10 = CFURLCreateWithString(kCFAllocatorDefault, v11, 0LL),
              CFRelease(v11),
              v10))
        {
          CFRelease(Value);
          CFStringRef v12 = CFURLCopyHostName(v10);
          unint64_t Value = (const __CFString *)v10;
LABEL_22:
          CFRelease(Value);
          unint64_t Value = v12;
        }
      }
    }

    else
    {
      v21.length = CFStringGetLength(Value);
      v21.CFIndex location = 0LL;
      if (CFStringFindCharacterFromSet(Value, v8, v21, 0LL, &range))
      {
        v22.length = range.location;
        v22.CFIndex location = 0LL;
        CFStringRef v12 = CFStringCreateWithSubstring(kCFAllocatorDefault, Value, v22);
        goto LABEL_22;
      }
    }

    CFRelease(v7);
    CFRelease(v8);
    if (Value && a2)
    {
      memset(v19, 0, sizeof(v19));
      CFIndex Length = CFStringGetLength(Value);
      CFIndex v15 = (char *)CFAllocatorAllocate(kCFAllocatorDefault, Length + 1, 0LL);
      CFStringGetCString(Value, v15, Length, 0x600u);
      BOOL v16 = inet_pton(2, v15, (char *)v19 + 4) != 1 && inet_pton(30, v15, (char *)v19 + 8) != 1;
      *a2 = v16;
      CFAllocatorDeallocate(kCFAllocatorDefault, v15);
    }
  }

  return Value;
}

uint64_t scnc_log( uint64_t a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t result = ne_sm_bridge_is_logging_at_level();
  if ((_DWORD)result)
  {
    uint64_t result = ne_sm_bridge_logv();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)CFStringGetCStringPtr(a2, 0x8000100u);
      if (result)
      {
        uint64_t v13 = result;
        uint64_t v14 = _SC_syslog_os_log_mapping(a1);
        return os_log_with_args(&_os_log_default, v14, v13, &a9, v9);
      }
    }
  }

  return result;
}

uint64_t ipsec_init_things()
{
  return 0LL;
}

const char *ipsec_error_to_str(int a1)
{
  int v1 = a1 + 1;
  uint64_t result = "Invalid payload type";
  switch(v1)
  {
    case 0:
      uint64_t result = "Internal error";
      break;
    case 1:
LABEL_7:
      uint64_t result = "Unknown error";
      break;
    case 2:
      return result;
    case 3:
      uint64_t result = "DOI not supported";
      break;
    case 4:
      uint64_t result = "Situation not supported";
      break;
    case 5:
      uint64_t result = "Invalid cookie";
      break;
    case 6:
      uint64_t result = "Invalid major version";
      break;
    case 7:
      uint64_t result = "Invalid minor version";
      break;
    case 8:
      uint64_t result = "Invalid exchange type";
      break;
    case 9:
      uint64_t result = "Invalid flags";
      break;
    case 10:
      uint64_t result = "Invalid message id";
      break;
    case 11:
      uint64_t result = "Invalid protocol id";
      break;
    case 12:
      uint64_t result = "Invalid SPI";
      break;
    case 13:
      uint64_t result = "Invalid transform id";
      break;
    case 14:
      uint64_t result = "Attributes not supported";
      break;
    case 15:
      uint64_t result = "No proposal chosen";
      break;
    case 16:
      uint64_t result = "Bad proposal syntax";
      break;
    case 17:
      uint64_t result = "Payload malformed";
      break;
    case 18:
      uint64_t result = "Invalid key information";
      break;
    case 19:
      uint64_t result = "Invalid id information";
      break;
    case 20:
      uint64_t result = "Invalid cert encoding";
      break;
    case 21:
      uint64_t result = "Invalid certificate";
      break;
    case 22:
      uint64_t result = "Bad cert request syntax";
      break;
    case 23:
      uint64_t result = "Invalid cert authority";
      break;
    case 24:
      uint64_t result = "Invalid hash information";
      break;
    case 25:
      uint64_t result = "Authentication Failed";
      break;
    case 26:
      uint64_t result = "Invalid signature";
      break;
    case 27:
      uint64_t result = "Address notification";
      break;
    case 28:
      uint64_t result = "Notify SA lifetime";
      break;
    case 29:
      uint64_t result = "Certificate unavailable";
      break;
    case 30:
      uint64_t result = "Unsupported exchange type";
      break;
    case 31:
      uint64_t result = "Unequal payload lengths";
      break;
    default:
      switch("Invalid payload type")
      {
        case 0xC351u:
          uint64_t result = "Dead Peer";
          break;
        case 0xC352u:
          uint64_t result = "Phase 1 Delete";
          break;
        case 0xC353u:
          uint64_t result = "Idle Timeout";
          break;
        case 0xC354u:
          uint64_t result = "Certificate premature";
          break;
        case 0xC355u:
          uint64_t result = "Certificate expired";
          break;
        case 0xC356u:
          uint64_t result = "Server certificate premature";
          break;
        case 0xC357u:
          uint64_t result = "Server certificate expired";
          break;
        case 0xC358u:
          uint64_t result = "Server certificate subjectName invalid";
          break;
        case 0xC359u:
          uint64_t result = "Server certificate subjectAltName invalid";
          break;
        default:
          uint64_t result = "Load balance";
          break;
      }

      break;
  }

  return result;
}

uint64_t ipsec_error_to_status(uint64_t a1, int a2, int a3)
{
  uint64_t result = 10LL;
  switch(a3)
  {
    case -1:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 21:
    case 29:
    case 30:
      return result;
    case 0:
LABEL_9:
      uint64_t result = 1LL;
      break;
    case 20:
    case 22:
    case 25:
      if (a2 == 1) {
        uint64_t result = 13LL;
      }
      else {
        uint64_t result = 12LL;
      }
      break;
    case 23:
      uint64_t result = 11LL;
      break;
    case 24:
      uint64_t result = 14LL;
      break;
    case 26:
    case 27:
LABEL_8:
      uint64_t result = 0LL;
      break;
    case 28:
      uint64_t result = 4LL;
      break;
    default:
      switch(a3)
      {
        case 50001:
        case 50002:
        case 50003:
          goto LABEL_8;
        case 50004:
          uint64_t result = 20LL;
          break;
        case 50005:
          uint64_t result = 21LL;
          break;
        case 50006:
          uint64_t result = 22LL;
          break;
        case 50007:
          uint64_t result = 23LL;
          break;
        case 50008:
        case 50009:
          uint64_t result = 24LL;
          break;
        default:
          if (a3 == 40501) {
            goto LABEL_8;
          }
          goto LABEL_9;
      }

      break;
  }

  return result;
}

const char *ipsec_msgtype_to_str(int a1)
{
  if (a1 > 0x8000)
  {
    if (a1 > 32800)
    {
      if (a1 > 33024)
      {
        if (a1 == 33025) {
          return "VPNCTL_STATUS_NEED_AUTHINFO";
        }
        if (a1 == 33026) {
          return "VPNCTL_STATUS_NEED_REAUTHINFO";
        }
      }

      else
      {
        if (a1 == 32801) {
          return "VPNCTL_STATUS_PH2_START";
        }
        if (a1 == 32802) {
          return "VPNCTL_STATUS_PH2_ESTABLISHED";
        }
      }
    }

    else if (a1 > 32785)
    {
      if (a1 == 32786) {
        return "VPNCTL_STATUS_PH1_START_PEER";
      }
      if (a1 == 32787) {
        return "VPNCTL_STATUS_PH1_ESTABLISHED";
      }
    }

    else
    {
      if (a1 == 32769) {
        return "VPNCTL_STATUS_IKE_FAILED";
      }
      if (a1 == 32785) {
        return "VPNCTL_STATUS_PH1_START_US";
      }
    }

    return "Unknown message type";
  }

  else
  {
    int v1 = a1 - 1;
    uint64_t result = "VPNCTL_CMD_BIND";
    switch(v1)
    {
      case 0:
        return result;
      case 1:
        uint64_t result = "VPNCTL_CMD_UNBIND";
        break;
      case 2:
        uint64_t result = "VPNCTL_CMD_REDIRECT";
        break;
      case 3:
        uint64_t result = "VPNCTL_CMD_PING";
        break;
      case 16:
        uint64_t result = "VPNCTL_CMD_CONNECT";
        break;
      case 17:
        uint64_t result = "VPNCTL_CMD_DISCONNECT";
        break;
      case 18:
        uint64_t result = "VPNCTL_CMD_START_PH2";
        break;
      case 19:
        uint64_t result = "VPNCTL_CMD_XAUTH_INFO";
        break;
      case 21:
        uint64_t result = "VPNCTL_CMD_ASSERT";
        break;
      case 22:
        uint64_t result = "VPNCTL_CMD_RECONNECT";
        break;
      default:
        return "Unknown message type";
    }
  }

  return result;
}

const char *ipsec_xauthtype_to_str(int a1)
{
  int v1 = a1 - 16520;
  uint64_t result = "XAUTH_TYPE";
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = "XAUTH_USER_NAME";
      break;
    case 2:
      uint64_t result = "XAUTH_USER_PASSWORD";
      break;
    case 3:
      uint64_t result = "XAUTH_PASSCODE";
      break;
    case 4:
      uint64_t result = "XAUTH_MESSAGE";
      break;
    case 5:
      uint64_t result = "XAUTH_CHALLENGE";
      break;
    case 6:
      uint64_t result = "XAUTH_DOMAIN";
      break;
    case 7:
      uint64_t result = "XAUTH_STATUS";
      break;
    case 8:
      uint64_t result = "XAUTH_NEXT_PIN";
      break;
    case 9:
      uint64_t result = "XAUTH_ANSWER";
      break;
    default:
      else {
        uint64_t result = "XAUTH_TYPE unknown type";
      }
      break;
  }

  return result;
}

const char *ipsec_modecfgtype_to_str(int a1)
{
  int v1 = a1 - 1;
  uint64_t result = "INTERNAL_IP4_ADDRESS";
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = "INTERNAL_IP4_NETMASK";
      break;
    case 2:
      uint64_t result = "INTERNAL_IP4_DNS";
      break;
    case 3:
      uint64_t result = "INTERNAL_IP4_NBNS";
      break;
    case 4:
      uint64_t result = "INTERNAL_ADDRESS_EXPIRY";
      break;
    case 5:
      uint64_t result = "INTERNAL_IP4_DHCP";
      break;
    case 6:
      uint64_t result = "APPLICATION_VERSION";
      break;
    case 7:
      uint64_t result = "INTERNAL_IP6_ADDRESS";
      break;
    case 8:
      uint64_t result = "INTERNAL_IP6_NETMASK";
      break;
    case 9:
      uint64_t result = "INTERNAL_IP6_DNS";
      break;
    case 10:
      uint64_t result = "INTERNAL_IP6_NBNS";
      break;
    case 11:
      uint64_t result = "INTERNAL_IP6_DHCP";
      break;
    case 12:
      uint64_t result = "INTERNAL_IP4_SUBNET";
      break;
    case 13:
      uint64_t result = "SUPPORTED_ATTRIBUTES";
      break;
    case 14:
      uint64_t result = "INTERNAL_IP6_SUBNET";
      break;
    default:
      switch("INTERNAL_IP4_ADDRESS")
      {
        case 0x7000u:
          uint64_t result = "UNITY_BANNER";
          break;
        case 0x7001u:
          uint64_t result = "UNITY_SAVE_PASSWD";
          break;
        case 0x7002u:
          uint64_t result = "UNITY_DEF_DOMAIN";
          break;
        case 0x7003u:
          uint64_t result = "UNITY_SPLITDNS_NAME";
          break;
        case 0x7004u:
          uint64_t result = "UNITY_SPLIT_INCLUDE";
          break;
        case 0x7005u:
          uint64_t result = "UNITY_NATT_PORT";
          break;
        case 0x7006u:
          uint64_t result = "UNITY_LOCAL_LAN";
          break;
        case 0x7007u:
          uint64_t result = "UNITY_PFS";
          break;
        case 0x7008u:
          uint64_t result = "UNITY_FW_TYPE";
          break;
        case 0x7009u:
          uint64_t result = "UNITY_BACKUP_SERVERS";
          break;
        case 0x700Au:
          uint64_t result = "UNITY_DDNS_HOSTNAME";
          break;
        case 0x700Bu:
          uint64_t result = "UNITY_BROWSER_PROXY";
          break;
        default:
          uint64_t result = "MODECFG_TYPE unknown type";
          break;
      }

      break;
  }

  return result;
}

uint64_t ipsec_subtype()
{
  return 0LL;
}

uint64_t ipsec_new_service(uint64_t a1)
{
  *(_DWORD *)(a1 + 592) = 0;
  *(_DWORD *)(a1 + 784) = -1;
  *(_DWORD *)(a1 + 904) = -1;
  *(_DWORD *)(a1 + 800) = -1;
  *(void *)(a1 + 1048) = 0LL;
  return 0LL;
}

uint64_t ipsec_dispose_service(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 592)) {
    return 1LL;
  }
  free_service_routes(a1);
  my_CFRelease((const void **)(a1 + 136));
  my_CFRelease((const void **)(a1 + 144));
  return 0LL;
}

uint64_t ipsec_setup_service(uint64_t a1)
{
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a1 + 72) & 0xF780DE3F | 0xC0;
  uint64_t v2 = (CFDictionaryRef *)(a1 + 136);
  my_CFRelease((const void **)(a1 + 136));
  uint64_t v3 = *(void *)(a1 + 584);
  if (v3) {
    CFStringRef v4 = (const __CFDictionary *)ne_sm_bridge_copy_configuration(v3);
  }
  else {
    CFStringRef v4 = (const __CFDictionary *)copyEntity( (const __SCDynamicStore *)gDynamicStore,  kSCDynamicStoreDomainSetup,  *(const __CFString **)(a1 + 24),  kSCEntNetIPSec);
  }
  *uint64_t v2 = v4;
  if (!v4)
  {
    sub_20090(3LL, @"IPSec Controller: Cannot copy IPSec dictionary from setup", v5, v6, v7, v8, v9, v10, v16);
    ipsec_stop(a1);
    return 0xFFFFFFFFLL;
  }

  int v17 = 0;
  getNumber(v4, kSCPropNetIPSecOnDemandEnabled, &v17);
  if (v17)
  {
    int v11 = 18874368;
  }

  else
  {
    if (!CFDictionaryGetValue(*v2, kSCPropNetVPNOnDemandRules)
      || !controller_options_is_useVODDisconnectRulesWhenVODDisabled())
    {
      goto LABEL_12;
    }

    int v11 = 0x1000000;
  }

  *(_DWORD *)(a1 + 72) |= v11;
LABEL_12:
  int v17 = 0;
  getNumber(*v2, @"DisconnectOnLogout", &v17);
  if (v17) {
    *(_DWORD *)(a1 + 72) |= 0x20000u;
  }
  int v17 = 0;
  getNumber(*v2, @"DisconnectOnSleep", &v17);
  if (v17) {
    *(_DWORD *)(a1 + 72) |= 0x40000u;
  }
  int v17 = 0;
  getNumber(*(const __CFDictionary **)(a1 + 136), @"PreventIdleSleep", &v17);
  int v13 = *(_DWORD *)(a1 + 72);
  if (v17)
  {
    v13 |= 0x80000u;
    *(_DWORD *)(a1 + 72) = v13;
  }

  int v17 = v13 & 0x20000;
  getNumber(*v2, @"DisconnectOnFastUserSwitch", &v17);
  if (v17) {
    *(_DWORD *)(a1 + 72) |= 0x100000u;
  }
  int v17 = 1;
  *(_DWORD *)(a1 + 196) = 0;
  getNumber(*(const __CFDictionary **)(a1 + 136), kSCPropNetIPSecDisconnectOnWake, &v17);
  if (v17)
  {
    *(_DWORD *)(a1 + 72) |= 0x8000000u;
    getNumber(*(const __CFDictionary **)(a1 + 136), kSCPropNetIPSecDisconnectOnWakeTimer, (void *)(a1 + 196));
  }

  int v17 = 1;
  getNumber(*v2, @"AlertEnable", &v17);
  if (!v17) {
    *(_DWORD *)(a1 + 72) &= 0xFFFFFF3F;
  }
  int v17 = 0;
  getNumber(*v2, @"ConnectionPersist", &v17);
  if (v17) {
    *(_DWORD *)(a1 + 72) |= 0x400000u;
  }
  uint64_t result = CFDictionaryContainsKey(*v2, @"ProfileIdentifier");
  if ((_DWORD)result)
  {
    my_CFRelease((const void **)(a1 + 144));
    unint64_t Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), @"ProfileIdentifier");
    CFTypeRef v15 = my_CFRetain(Value);
    uint64_t result = 0LL;
    *(void *)(a1 + 1memset(v5, 0, 44) = v15;
  }

  return result;
}

uint64_t sub_20090( uint64_t a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t result = ne_sm_bridge_is_logging_at_level();
  if ((_DWORD)result)
  {
    uint64_t result = ne_sm_bridge_logv();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)CFStringGetCStringPtr(a2, 0x8000100u);
      if (result)
      {
        uint64_t v13 = result;
        uint64_t v14 = _SC_syslog_os_log_mapping(a1);
        return os_log_with_args(&_os_log_default, v14, v13, &a9, v9);
      }
    }
  }

  return result;
}

uint64_t ipsec_stop( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 592) == 4)
  {
    CFTypeRef v15 = *(__CFUserNotification **)(a1 + 168);
    if (v15)
    {
      CFUserNotificationCancel(v15);
      CFAbsoluteTime Current = CFRunLoopGetCurrent();
      CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 176), kCFRunLoopDefaultMode);
      my_CFRelease((const void **)(a1 + 168));
      my_CFRelease((const void **)(a1 + 176));
    }
  }

  int v17 = *(_DWORD *)(a1 + 72);
  if ((v17 & 0x2000) != 0
    || ((v18 = *(_DWORD *)(a1 + 596), v19 = v18 > 0x10, int v20 = (1 << v18) & 0x10600, !v19) ? (v21 = v20 == 0) : (v21 = 1),
        v21 || (CFRange v22 = *(const __CFDictionary **)(a1 + 608)) == 0LL))
  {
LABEL_15:
    *(_DWORD *)(a1 + 72) = v17 & 0xFFFFDFFF;
    int v32 = *(_DWORD *)(a1 + 592);
    if (!v32 || v32 == 7) {
      return 0LL;
    }
    uint64_t v33 = sub_208B0(a1, 7LL, v9, v10, v11, v12, v13, v14);
    int v34 = (os_log_s *)ne_log_obj(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v41.s_addr = *(_DWORD *)(a1 + 748);
      CFStringRef v42 = inet_ntoa(v41);
      *(_DWORD *)__int128 v79 = 136315138;
      *(void *)&v79[4] = v42;
      _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "IPSec disconnecting from server %s\n", v79, 0xCu);
    }

    unint64_t v43 = *(__CFMachPort **)(a1 + 1000);
    if (v43)
    {
      uint64_t Port = CFMachPortGetPort(v43);
      CFMachPortInvalidate(*(CFMachPortRef *)(a1 + 1000));
      CFRelease(*(CFTypeRef *)(a1 + 1000));
      *(void *)(a1 + 1000) = 0LL;
      getaddrinfo_async_cancel(Port);
    }

    int v45 = *(_DWORD *)(a1 + 784);
    if (v45 != -1) {
      racoon_send_cmd_disconnect(v45, *(_DWORD *)(a1 + 748), v35, v36, v37, v38, v39, v40);
    }
    if (*(_DWORD *)(a1 + 868))
    {
      if (IPSecRemovePolicies(*(const __CFDictionary **)(a1 + 608), -1LL, (const char **)v79)) {
        sub_20090( 3LL,  @"IPSec Controller: Cannot remove policies, error '%s'",  v46,  v47,  v48,  v49,  v50,  v51,  *(uint64_t *)v79);
      }
      IPSecRemoveSecurityAssociations((unsigned __int8 *)(a1 + 616), (unsigned __int8 *)(a1 + 744));
      *(_DWORD *)(a1 + 868) = 0;
    }

    uint64_t v52 = *(void *)(a1 + 584);
    if (v52) {
      ne_sm_bridge_request_uninstall(v52);
    }
    sub_22420(a1, 1);
    if (*(_DWORD *)(a1 + 864))
    {
      if (IPSecRemoveConfiguration(*(const void **)(a1 + 608), (const char **)v79)) {
        sub_20090( 3LL,  @"IPSec Controller: Cannot remove configuration, error '%s'",  v53,  v54,  v55,  v56,  v57,  v58,  *(uint64_t *)v79);
      }
      *(_DWORD *)(a1 + 864) = 0;
    }

    vm_address_t v59 = *(void *)(a1 + 832);
    if (v59)
    {
      my_Deallocate(v59, *(_DWORD *)(a1 + 844) + 1);
      *(void *)(a1 + 832) = 0LL;
    }

    *(void *)(a1 + 840) = 0LL;
    vm_address_t v60 = *(void *)(a1 + 816);
    if (v60)
    {
      my_Deallocate(v60, *(_DWORD *)(a1 + 824));
      *(void *)(a1 + 816) = 0LL;
    }

    *(_DWORD *)(a1 + 824) = 0;
    *(void *)(a1 + 88) = 0LL;
    *(_DWORD *)(a1 + 96) = 0;
    *(_DWORD *)(a1 + 912) = 0;
    *(_BYTE *)(a1 + 918) = 0;
    *(_BYTE *)(a1 + 934) = 0;
    my_CFRelease((const void **)(a1 + 1024));
    *(void *)(a1 + 1024) = 0LL;
    __int128 v61 = *(__CFSocket **)(a1 + 792);
    if (v61)
    {
      CFSocketInvalidate(v61);
      my_CFRelease((const void **)(a1 + 792));
    }

    else
    {
      int v62 = *(_DWORD *)(a1 + 784);
      if (v62) {
        close(v62);
      }
    }

    *(_DWORD *)(a1 + 784) = -1;
    __int128 v63 = *(__CFSocket **)(a1 + 808);
    if (v63)
    {
      CFSocketInvalidate(v63);
      my_CFRelease((const void **)(a1 + 808));
    }

    else
    {
      int v64 = *(_DWORD *)(a1 + 800);
      if (v64) {
        close(v64);
      }
    }

    *(_DWORD *)(a1 + 800) = -1;
    *(void *)(a1 + 768) = 0LL;
    *(void *)(a1 + 760) = 0LL;
    scnc_bootstrap_dealloc(a1);
    scnc_ausession_dealloc(a1);
    my_CFRelease((const void **)(a1 + 128));
    my_CFRelease((const void **)(a1 + 608));
    if (*(void *)(a1 + 776))
    {
      __int128 v65 = CFRunLoopGetCurrent();
      CFRunLoopRemoveTimer(v65, *(CFRunLoopTimerRef *)(a1 + 776), kCFRunLoopCommonModes);
      my_CFRelease((const void **)(a1 + 776));
    }

    if (*(void *)(a1 + 952))
    {
      __int128 v66 = CFRunLoopGetCurrent();
      CFRunLoopRemoveTimer(v66, *(CFRunLoopTimerRef *)(a1 + 952), kCFRunLoopCommonModes);
      my_CFRelease((const void **)(a1 + 952));
    }

    if (gNattKeepAliveInterval != -1)
    {
      *(_DWORD *)buf = gNattKeepAliveInterval;
      sysctlbyname("net.key.natt_keepalive_interval", 0LL, 0LL, buf, 4uLL);
      gNattKeepAliveInterval = -1;
    }

    if (*(void *)(a1 + 984))
    {
      __int128 v67 = CFRunLoopGetCurrent();
      CFRunLoopRemoveTimer(v67, *(CFRunLoopTimerRef *)(a1 + 984), kCFRunLoopCommonModes);
      my_CFRelease((const void **)(a1 + 984));
    }

    my_CFRelease((const void **)(a1 + 976));
    uint64_t v73 = *(unsigned int *)(a1 + 596);
    if (v73 <= 0x15 && ((1 << v73) & 0x302000) != 0)
    {
      if (*(void *)(a1 + 144))
      {
        __int128 v74 = CFStringCreateWithFormat(0LL, 0LL, @"IPSec Error %d, Re-enroll", *(unsigned int *)(a1 + 596));
        if (v74)
        {
          __int128 v75 = v74;
          sub_247C4(a1, v74, 0LL, 2);
          CFRelease(v75);
        }

        goto LABEL_61;
      }
    }

    else if (!(_DWORD)v73 || (*(_DWORD *)(a1 + 72) & 0x400) != 0)
    {
LABEL_61:
      sub_208B0(a1, 0LL, v73, v68, v69, v70, v71, v72);
      cleanup_dynamicstore(a1);
      *(_DWORD *)(a1 + 600) = 0;
      *(void *)(a1 + 396) = 0LL;
      service_ended(a1);
      if (*(void *)(a1 + 584)) {
        allow_dispose(a1);
      }
      return 0LL;
    }

    sub_247C4(a1, 0LL, v73, 0);
    goto LABEL_61;
  }

  unint64_t Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 608), @"AuthenticationMethod");
  int StrFromDict = GetStrFromDict(v22, @"LocalIdentifier", v79, 256, "");
  BOOL IsAggressiveMode = IPSecIsAggressiveMode(Value, StrFromDict, 1);
  if (!IsAggressiveMode) {
    goto LABEL_14;
  }
  uint64_t v26 = (os_log_s *)ne_log_obj(IsAggressiveMode);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_0,  v26,  OS_LOG_TYPE_DEFAULT,  "IPSec Controller: retry IPSec aggressive mode with DH Group 2",  buf,  2u);
  }

  *(_DWORD *)(a1 + 72) |= 0x2000u;
  if (!sub_24AD8(a1, 64, 1LL, v27, v28, v29, v30, v31))
  {
LABEL_14:
    int v17 = *(_DWORD *)(a1 + 72);
    goto LABEL_15;
  }

  return 0LL;
}

CFTypeID ipsec_set_initial_values(uint64_t a1, const void *a2)
{
  CFTypeID result = CFDictionaryGetTypeID();
  if (a2)
  {
    CFTypeID v5 = result;
    CFTypeID result = CFGetTypeID(a2);
    if (result == v5)
    {
      int v6 = 0;
      CFTypeID result = (CFTypeID)getNumber((const __CFDictionary *)a2, @"LastCause", &v6);
      *(_DWORD *)(a1 + 596) = v6;
    }
  }

  return result;
}

uint64_t ipsec_user_notification_callback( uint64_t result, CFUserNotificationRef userNotification, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = result;
  int v9 = *(_DWORD *)(result + 592);
  if ((a3 & 3) != 0)
  {
    if (v9) {
      return ipsec_stop(result);
    }
    unsigned int v16 = *(_DWORD *)(result + 596);
    BOOL v17 = v16 > 0x15;
    int v18 = (1 << v16) & 0x302000;
    if (!v17 && v18 != 0)
    {
      CFTypeID result = *(void *)(result + 584);
      if (result) {
        return ne_sm_bridge_start_profile_janitor(result, *(CFStringRef *)(v8 + 144));
      }
    }

    return result;
  }

  if (v9 != 4) {
    return result;
  }
  __int16 v11 = *(_WORD *)(result + 916);
  if ((v11 & 8) != 0)
  {
    __int16 v20 = 16529;
LABEL_18:
    v23[0] = v20;
    Responseunint64_t Value = CFUserNotificationGetResponseValue(userNotification, kCFUserNotificationTextFieldValuesKey, 0LL);
    unsigned int v12 = 1;
    goto LABEL_19;
  }

  if ((v11 & 0x10) != 0)
  {
    __int16 v20 = 16528;
    goto LABEL_18;
  }

  if ((v11 & 1) != 0)
  {
    v23[0] = 16521;
    Responseunint64_t Value = CFUserNotificationGetResponseValue(userNotification, kCFUserNotificationTextFieldValuesKey, 0LL);
    __int16 v11 = *(_WORD *)(v8 + 916);
    unsigned int v12 = 1;
    if ((v11 & 4) != 0) {
      goto LABEL_9;
    }
  }

  else
  {
    unsigned int v12 = 0;
    if ((v11 & 4) != 0)
    {
LABEL_9:
      CFIndex v13 = v12;
      uint64_t v14 = &v23[8 * v12];
      __int16 v15 = 16523;
LABEL_26:
      *uint64_t v14 = v15;
      *((void *)v14 + 1) = CFUserNotificationGetResponseValue( userNotification,  kCFUserNotificationTextFieldValuesKey,  v13);
      ++v12;
      goto LABEL_19;
    }
  }

  if ((v11 & 2) != 0)
  {
    CFIndex v13 = v12;
    uint64_t v14 = &v23[8 * v12];
    __int16 v15 = 16522;
    goto LABEL_26;
  }

LABEL_19:
  BOOL v21 = *(__CFRunLoopTimer **)(v8 + 776);
  if (v21)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFRunLoopTimerSetNextFireDate(v21, Current + 30.0);
  }

  sub_208B0(v8, 3LL, a3, a4, a5, a6, a7, a8);
  return racoon_send_cmd_xauthinfo(*(_DWORD *)(v8 + 784), *(_DWORD *)(v8 + 748), (uint64_t)v23, v12);
}

uint64_t sub_208B0( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(result + 592) != (_DWORD)a2)
  {
    int v8 = a2;
    uint64_t v9 = result;
    *(_DWORD *)(result + 592) = a2;
    phase_changed(result, a2, a3, a4, a5, a6, a7, a8);
    return publish_dictnumentry( (const __SCDynamicStore *)gDynamicStore,  *(CFStringRef *)(v9 + 24),  kSCEntNetIPSec,  kSCPropNetIPSecStatus,  v8);
  }

  return result;
}

uint64_t racoon_send_cmd_xauthinfo(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t v8 = a4;
  if (a4 < 1)
  {
    size_t v13 = 20LL;
  }

  else
  {
    uint64_t v9 = (const __CFString **)(a3 + 8);
    int v10 = 20;
    uint64_t v11 = a4;
    do
    {
      unsigned int v12 = *v9;
      if (*v9) {
        LODWORD(v12) = CFStringGetLength(v12);
      }
      v10 += (_DWORD)v12 + 4;
      v9 += 2;
      --v11;
    }

    while (v11);
    size_t v13 = v10;
  }

  uint64_t v14 = (UInt8 *)malloc(v13);
  if (!v14) {
    return 0xFFFFFFFFLL;
  }
  __int16 v20 = v14;
  *(void *)uint64_t v14 = 0LL;
  *((void *)v14 + 1) = 0LL;
  *(_WORD *)uint64_t v14 = 5120;
  *((_WORD *)v14 + 7) = bswap32(v13 - 16) >> 16;
  *((_DWORD *)v14 + 4) = a2;
  if (a4 >= 1)
  {
    BOOL v21 = v14 + 20;
    CFRange v22 = (CFStringRef *)(a3 + 8);
    do
    {
      if (*v22) {
        CFIndex Length = CFStringGetLength(*v22);
      }
      else {
        CFIndex Length = 0LL;
      }
      *(_DWORD *)BOOL v21 = bswap32((unsigned __int16)Length | (*((unsigned __int16 *)v22 - 4) << 16));
      v21 += 4;
      if (Length)
      {
        v29.CFIndex location = 0LL;
        v29.length = Length;
        CFStringGetBytes(*v22, v29, 0x8000100u, 0, 0, v21, Length, &usedBufLen);
        v21 += Length;
      }

      v22 += 2;
      --v8;
    }

    while (v8);
  }

  uint64_t v24 = sub_2270C(a1, (uint64_t)v20, v13, v15, v16, v17, v18, v19);
  uint64_t v25 = (os_log_s *)ne_log_obj(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "IPSec sending Extended Authentication.\n", buf, 2u);
  }

  free(v20);
  return 0LL;
}

uint64_t ipsec_install(uint64_t a1)
{
  return 0LL;
}

void sub_20AD8(uint64_t a1, int a2, int a3)
{
  v248 = 0LL;
  v249 = 0LL;
  v246 = 0LL;
  v247 = 0LL;
  v244 = 0LL;
  v245 = 0LL;
  v243 = 0LL;
  *(_DWORD *)(a1 + 908) = 0;
  uint64_t v4 = *(void *)(a1 + 816);
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v4 = *(void *)(a1 + 832);
    if (!v4) {
      return;
    }
    uint64_t v5 = a1 + 848;
  }

  unsigned int v6 = bswap32(*(unsigned __int16 *)(v5 + 14)) >> 16;
  uint64_t v7 = (os_log_s *)ne_log_obj(a1);
  uint64_t updated = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)updated)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "IPSec Network Configuration started.\n", buf, 2u);
  }

  if (v6 < 0x1D) {
    goto LABEL_39;
  }
  in_addr_t v237 = 0;
  int v15 = v6 - 28;
  uint64_t v234 = a1;
  v235 = (in_addr_t *)(a1 + 908);
  in_addr_t v16 = -1;
  int v221 = v6 - 28;
  uint64_t v17 = (unsigned __int16 *)(v4 + 44);
  do
  {
    unsigned int v18 = v17[1];
    int v19 = bswap32(*v17);
    int v20 = HIWORD(v19) & 0x7FFF;
    if (v20 != 28673)
    {
      if (v20 == 2)
      {
        in_addr_t v16 = *((_DWORD *)v17 + 1);
        in_addr_t v250 = v16;
        uint64_t v24 = (os_log_s *)ne_log_obj(updated);
        uint64_t updated = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)updated)
        {
          v25.s_addr = v16;
          uint64_t v26 = inet_ntoa(v25);
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v26;
          _os_log_impl( &dword_0,  v24,  OS_LOG_TYPE_DEFAULT,  "IPSec Network Configuration: INTERNAL-IP4-MASK = %s.\n",  buf,  0xCu);
        }
      }

      else if (v20 == 1)
      {
        in_addr_t v250 = *((_DWORD *)v17 + 1);
        BOOL v21 = (os_log_s *)ne_log_obj(updated);
        uint64_t updated = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
        in_addr_t v237 = v250;
        if ((_DWORD)updated)
        {
          v22.s_addr = v250;
          uint64_t v23 = inet_ntoa(v22);
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v23;
          _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_DEFAULT,  "IPSec Network Configuration: INTERNAL-IP4-ADDRESS = %s.\n",  buf,  0xCu);
        }
      }

      goto LABEL_31;
    }

    uint64_t v27 = (os_log_s *)ne_log_obj(updated);
    uint64_t updated = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)updated)
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v18 != 256;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "IPSec Network Configuration: SAVE-PASSWORD = %d.\n", buf, 8u);
    }

    __int16 v28 = *(_WORD *)(a1 + 916);
    if ((v18 != 256) == ((v28 & 0x40) == 0))
    {
      uint64_t v29 = *(void *)(a1 + 584);
      if (v29)
      {
        ne_sm_bridge_clear_saved_password(v29);
      }

      else
      {
        if (v18 == 256) {
          CFStringRef v30 = 0LL;
        }
        else {
          CFStringRef v30 = kSCValNetIPSecXAuthPasswordEncryptionPrompt;
        }
        uint64_t updated = UpdatePasswordPrefs( *(const __CFString **)(a1 + 24),  *(const void **)(a1 + 32),  4LL,  kSCPropNetIPSecXAuthPasswordEncryption,  v30);
        if (!(_DWORD)updated) {
          goto LABEL_27;
        }
      }

      __int16 v31 = *(_WORD *)(a1 + 916);
      if (v18 == 256)
      {
        *(_WORD *)(a1 + 916) = v31 & 0xFFBF;
        CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 608), kSCPropNetIPSecXAuthPasswordEncryption);
        if ((v28 & 0x20) == 0) {
          goto LABEL_31;
        }
LABEL_30:
        if ((*(_WORD *)(a1 + 916) & 0xC0) == 0x40)
        {
          sub_25C8C(a1, a1 + 744, a1 + 760, 0LL);
          return;
        }

        goto LABEL_31;
      }

      *(_WORD *)(a1 + 916) = v31 | 0x40;
      CFDictionarySetValue( *(CFMutableDictionaryRef *)(a1 + 608),  kSCPropNetIPSecXAuthPasswordEncryption,  kSCValNetIPSecXAuthPasswordEncryptionPrompt);
LABEL_27:
      if ((v28 & 0x20) == 0) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }

LABEL_196:
          in_addr_t v250 = v139;
          v177 = (char *)sub_25728(Mutable, v237);
          __s = v177;
          if (!v177) {
            sub_20090( 3LL,  @"IPSec Controller: create_ipv4_route_array failed",  v179,  v180,  v181,  v182,  v183,  v184,  (uint64_t)v211);
          }
LABEL_198:
          if (!*(void *)(v36 + 584)) {
            sub_259F8(v36, &v250, v146);
          }
          v249 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
          v248 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
          stateaddr = create_stateaddr( gDynamicStore,  *(void *)(v36 + 24),  v36 + 104,  *(_DWORD *)(v36 + 748),  v139,  v139,  v214,  v146,  v177,  v173);
          my_CFRelease((const void **)&__s);
          my_CFRelease((const void **)&v238);
          if (stateaddr)
          {
            CFArrayAppendValue(v248, kSCEntNetIPv4);
            CFArrayAppendValue(v249, stateaddr);
            CFRelease(stateaddr);
          }

          if (v218)
          {
            ipv6_dummy_primary = create_ipv6_dummy_primary(v36 + 104);
            if (ipv6_dummy_primary)
            {
              v187 = ipv6_dummy_primary;
              *(_DWORD *)(v36 + 892) = 1;
              CFArrayAppendValue(v248, kSCEntNetIPv6);
              CFArrayAppendValue(v249, v187);
              CFRelease(v187);
            }
          }

          if (v245)
          {
            v189 = v246;
            v188 = v247;
            if (!v246 && v247)
            {
              CFMutableArrayRef v190 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
              v246 = v190;
              v188 = v247;
              if (v190)
              {
                CFArrayAppendValue(v190, v247);
                v189 = v246;
                v188 = v247;
              }

              else
              {
                v189 = 0LL;
              }
            }

            dns = create_dns((const __SCDynamicStore *)gDynamicStore, *(CFStringRef *)(v36 + 24), v245, v188, v189, 0);
            if (dns)
            {
              v192 = dns;
              CFArrayAppendValue(v248, kSCEntNetDNS);
              CFArrayAppendValue(v249, v192);
              CFRelease(v192);
            }
          }

          if (v219 == 2)
          {
            uint64_t v193 = gDynamicStore;
            uint64_t v194 = *(void *)(v36 + 24);
            v196 = v243;
            v195 = v244;
            v197 = v246;
            int v198 = v220;
            int v199 = HIDWORD(v220);
            int v200 = v217;
          }

          else
          {
            v197 = v246;
            if (!v246)
            {
LABEL_219:
              uint64_t v203 = *(void *)(v36 + 584);
              if (v203) {
                ne_sm_bridge_filter_state_dictionaries(v203);
              }
              publish_multiple_dicts( (const __SCDynamicStore *)gDynamicStore,  *(const __CFString **)(v36 + 24),  v248,  v249);
              sub_20090( 7LL,  @"IPSec Controller: Published dictionaries to dynamic store.",  v204,  v205,  v206,  v207,  v208,  v209,  (uint64_t)v213);
              my_CFRelease((const void **)&v246);
              my_CFRelease((const void **)&v247);
              my_CFRelease((const void **)&v245);
              my_CFRelease((const void **)&v244);
              my_CFRelease((const void **)&v243);
              my_CFRelease((const void **)&v249);
              my_CFRelease((const void **)&v248);
              my_CFRelease((const void **)&Mutable);
              *(_DWORD *)(v36 + 872) = 1;
              int v153 = a3;
              goto LABEL_222;
            }

            uint64_t v193 = gDynamicStore;
            uint64_t v194 = *(void *)(v36 + 24);
            int v198 = 0;
            v195 = 0LL;
            int v199 = 0;
            int v200 = 0;
            v196 = 0LL;
          }

          proxies = create_proxies(v193, v194, v198, v195, v199, v200, v196, v197);
          if (proxies)
          {
            v202 = proxies;
            CFArrayAppendValue(v248, kSCEntNetProxies);
            CFArrayAppendValue(v249, v202);
            CFRelease(v202);
          }

          goto LABEL_219;
        }

        v212 = *(void **)buf;
        v167 = @"IPSec Controller: racoon_send_cmd_start_ph2 failed '%s'";
LABEL_178:
        sub_20090(3LL, v167, v161, v162, v163, v164, v165, v166, (uint64_t)v212);
LABEL_179:
        my_CFRelease((const void **)&v246);
        my_CFRelease((const void **)&v247);
        my_CFRelease((const void **)&v245);
        my_CFRelease((const void **)&v244);
        my_CFRelease((const void **)&v243);
        my_CFRelease((const void **)(v36 + 960));
        my_CFRelease((const void **)&v249);
        my_CFRelease((const void **)&v248);
        my_CFRelease((const void **)&Mutable);
        v168 = *(const __CFDictionary **)(v36 + 880);
        if (v168)
        {
          IPSecRemovePolicies(v168, -1LL, (const char **)buf);
          my_CFRelease((const void **)(v36 + 880));
        }

        if (*(_DWORD *)(v36 + 888)) {
          *(_DWORD *)(v36 + 888) = 0;
        }
        my_close(*(unsigned int *)(v36 + 904));
        *(_DWORD *)(v36 + 904) = -1;
        return;
      case 28676:
        if (!*((_WORD *)v43 + 1))
        {
          int v218 = 0;
          goto LABEL_160;
        }

        int v228 = v49;
        int v223 = v42;
        v231 = v43;
        __int128 v79 = (in_addr_t *)(v43 + 4);
        int v80 = v250;
        unsigned int v81 = ((int)v51 - 1) / 0xEu;
        int v226 = v51;
        int v82 = v51 + 14;
        int v83 = v233;
        break;
      case 28678:
        if (*((_WORD *)v43 + 1))
        {
          int v228 = v49;
          int v223 = v42;
          v231 = v43;
          __int128 v94 = (in_addr_t *)(v43 + 4);
          int v95 = v250;
          int v226 = v51;
          int v96 = v51 + 14;
          do
          {
            __int128 v97 = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFCopyStringDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
            CFDictionarySetValue(v97, @"Mode", @"Tunnel");
            CFDictionarySetValue(v97, @"Direction", @"InOut");
            CFDictionarySetValue(v97, @"Level", @"None");
            v98.s_addr = v237;
            __int128 v99 = inet_ntoa(v98);
            AddString(v97, @"LocalAddress", v99);
            AddNumber(v97, @"LocalPrefix", 32);
            in_addr_t v100 = *v94;
            v101.s_addr = *v94;
            v102 = inet_ntoa(v101);
            AddString(v97, @"RemoteAddress", v102);
            unsigned int v103 = v94[1];
            unsigned int v104 = 32 - __clz(__rbit32(bswap32(v103)));
            if (v103) {
              int v105 = v104;
            }
            else {
              int v105 = 0;
            }
            AddNumber(v97, @"RemotePrefix", v105);
            v107 = (os_log_s *)ne_log_obj(v106);
            if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
            {
              v108.s_addr = v100;
              CFTypeID v109 = inet_ntoa(v108);
              v110.s_addr = v237;
              int v111 = inet_ntoa(v110);
              *(_DWORD *)buf = 67110146;
              *(_DWORD *)&buf[4] = v233;
              *(_WORD *)&uint8_t buf[8] = 2080;
              *(void *)&buf[10] = v109;
              __int16 v252 = 1024;
              int v253 = v105;
              __int16 v254 = 2080;
              v255 = v111;
              __int16 v256 = 1024;
              int v257 = 32;
              _os_log_impl( &dword_0,  v107,  OS_LOG_TYPE_DEFAULT,  "IPSec Network Configuration: LOCAL-LAN[%d] = destination %s/%d -> gateway %s/%d.\n",  buf,  0x28u);
            }

            update_service_route(v234, v237, -1, v95, 0, 0, 0, 0);
            CFArrayAppendValue(theArray, v97);
            CFRelease(v97);
            v96 -= 14;
            __int128 v94 = (in_addr_t *)((char *)v94 + 14);
          }

          while (v96 > 14);
          uint64_t v36 = v234;
LABEL_116:
          int v42 = v223;
          unint64_t v43 = v231;
          int v49 = v228;
          LODWORD(v51) = v226;
        }

        goto LABEL_160;
      case 28683:
        if (*((_WORD *)v43 + 1))
        {
          int v229 = v49;
          v112 = v43;
          int v224 = v42;
          uint64_t v220 = 0LL;
          int v113 = 0;
          v232 = v43;
          int v114 = v51;
          do
          {
            CFStringRef v115 = v112 + 4;
            int v116 = bswap32(*((unsigned __int16 *)v112 + 2));
            CFIndex v117 = __rev16(*((unsigned __int16 *)v112 + 3));
            switch(HIWORD(v116) & 0x7FFF)
            {
              case 1:
                CFTypeID v118 = (os_log_s *)ne_log_obj(v41);
                in_addr v41 = (__CFArray *)os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT);
                if ((_DWORD)v41)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v47;
                  *(_WORD *)&uint8_t buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v117;
                  _os_log_impl( &dword_0,  v118,  OS_LOG_TYPE_DEFAULT,  "IPSec Network Configuration: BROWSER-PROXY[%d] = setting %d.\n",  buf,  0xEu);
                }

                int v219 = v117;
                break;
              case 2:
                v119 = (os_log_s *)ne_log_obj(v41);
                in_addr v41 = (__CFArray *)os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT);
                if ((_DWORD)v41)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v47;
                  *(_WORD *)&uint8_t buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v117;
                  v120 = v119;
                  CFTypeID v121 = "IPSec Network Configuration: BROWSER-PROXY[%d] = browser-type %d.\n";
                  goto LABEL_132;
                }

                break;
              case 3:
                int v122 = (os_log_s *)ne_log_obj(v41);
                in_addr v41 = (__CFArray *)os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT);
                if ((_DWORD)v41)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v47;
                  *(_WORD *)&uint8_t buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v117;
                  v120 = v122;
                  CFTypeID v121 = "IPSec Network Configuration: BROWSER-PROXY[%d] = connection-type %d.\n";
                  goto LABEL_132;
                }

                break;
              case 4:
                v123 = (os_log_s *)ne_log_obj(v41);
                in_addr v41 = (__CFArray *)os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT);
                if ((_DWORD)v41)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v47;
                  *(_WORD *)&uint8_t buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v117;
                  _os_log_impl( &dword_0,  v123,  OS_LOG_TYPE_DEFAULT,  "IPSec Network Configuration: BROWSER-PROXY[%d] = auto-detect %d.\n",  buf,  0xEu);
                }

                LODWORD(v220) = v117;
                break;
              case 5:
                CFTypeID v124 = (os_log_s *)ne_log_obj(v41);
                in_addr v41 = (__CFArray *)os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT);
                if ((_DWORD)v41)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v47;
                  *(_WORD *)&uint8_t buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v117;
                  v120 = v124;
                  CFTypeID v121 = "IPSec Network Configuration: BROWSER-PROXY[%d] = protocol %d.\n";
LABEL_132:
                  uint32_t v125 = 14;
                  goto LABEL_150;
                }

                break;
              case 6:
                if (!v244)
                {
                  v126 = v112 + 8;
                  if (*((_WORD *)v112 + 3))
                  {
                    unsigned int v127 = v117 - 1;
                  }

                  else
                  {
                    unsigned int v127 = 0;
                  }

                  v244 = CFStringCreateWithBytes(0LL, v126, v127, 0x8000100u, 0);
                  v132 = (os_log_s *)ne_log_obj(v244);
                  in_addr v41 = (__CFArray *)os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT);
                  if ((_DWORD)v41)
                  {
                    v133 = CFStringGetCStringPtr(v244, 0);
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)&buf[4] = v47;
                    *(_WORD *)&uint8_t buf[8] = 2080;
                    *(void *)&buf[10] = v133;
                    v120 = v132;
                    CFTypeID v121 = "IPSec Network Configuration: BROWSER-PROXY[%d] = server %s.\n";
                    goto LABEL_149;
                  }
                }

                break;
              case 7:
                CFTypeID v128 = (os_log_s *)ne_log_obj(v41);
                in_addr v41 = (__CFArray *)os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT);
                if ((_DWORD)v41)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v47;
                  *(_WORD *)&uint8_t buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v117;
                  _os_log_impl( &dword_0,  v128,  OS_LOG_TYPE_DEFAULT,  "IPSec Network Configuration: BROWSER-PROXY[%d] = port %d.\n",  buf,  0xEu);
                }

                HIDWORD(v220) = v117;
                break;
              case 8:
                v129 = (os_log_s *)ne_log_obj(v41);
                in_addr v41 = (__CFArray *)os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT);
                if ((_DWORD)v41)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v47;
                  *(_WORD *)&uint8_t buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v117;
                  _os_log_impl( &dword_0,  v129,  OS_LOG_TYPE_DEFAULT,  "IPSec Network Configuration: BROWSER-PROXY[%d] = bypass-local %d.\n",  buf,  0xEu);
                }

                int v113 = v117;
                break;
              case 9:
                if (!v243)
                {
                  v243 = CFStringCreateWithBytes(0LL, v112 + 8, v117, 0, 0);
                  v130 = (os_log_s *)ne_log_obj(v243);
                  in_addr v41 = (__CFArray *)os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT);
                  if ((_DWORD)v41)
                  {
                    CFTypeID v131 = CFStringGetCStringPtr(v243, 0);
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)&buf[4] = v47;
                    *(_WORD *)&uint8_t buf[8] = 2080;
                    *(void *)&buf[10] = v131;
                    v120 = v130;
                    CFTypeID v121 = "IPSec Network Configuration: BROWSER-PROXY[%d] = bypass-address-list %s.\n";
LABEL_149:
                    uint32_t v125 = 18;
LABEL_150:
                    _os_log_impl(&dword_0, v120, OS_LOG_TYPE_DEFAULT, v121, buf, v125);
                  }
                }

                break;
              default:
                break;
            }

            if (v116 >> 16 >= 0) {
              uint64_t v134 = v117;
            }
            else {
              uint64_t v134 = 0LL;
            }
            int v135 = v114 - v134;
            v112 = &v115[v134];
            ++v47;
            int v114 = v135 - 4;
          }

          while (v135 > 4);
          int v217 = v113;
          int v42 = v224;
          unint64_t v43 = v232;
          int v49 = v229;
        }

        else
        {
          int v217 = 0;
          uint64_t v220 = 0LL;
        }

        goto LABEL_160;
      default:
        if (v50 == 3)
        {
          if (v245 || (in_addr v41 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks), (v245 = v41) != 0LL))
          {
            int v57 = v49;
            in_addr v41 = (__CFArray *)CFStringCreateWithFormat(0LL, 0LL, @"%d.%d.%d.%d", v43[4], v43[5], v43[6], v43[7]);
            if (v41)
            {
              uint64_t v58 = (const __CFString *)v41;
              CFArrayAppendValue((CFMutableArrayRef)v245, v41);
              vm_address_t v60 = (os_log_s *)ne_log_obj(v59);
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
              {
                __int128 v61 = CFStringGetCStringPtr(v58, 0);
                *(_DWORD *)buf = 136315138;
                *(void *)&buf[4] = v61;
                _os_log_impl( &dword_0,  v60,  OS_LOG_TYPE_DEFAULT,  "IPSec Network Configuration: INTERNAL-IP4-DNS = %s.\n",  buf,  0xCu);
              }

              CFRelease(v58);
            }

            int v49 = v57;
          }
        }

        goto LABEL_160;
    }

    break;
  }

  while (2)
  {
    __int128 v84 = CFDictionaryCreateMutable(0LL, 0LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v84, @"Mode", @"Tunnel");
    CFDictionarySetValue(v84, @"Direction", @"InOut");
    CFDictionarySetValue(v84, @"Level", @"Unique");
    v85.s_addr = v237;
    v86 = inet_ntoa(v85);
    AddString(v84, @"LocalAddress", v86);
    AddNumber(v84, @"LocalPrefix", 32);
    in_addr_t v87 = *v79;
    v88.s_addr = *v79;
    __int128 v89 = inet_ntoa(v88);
    AddString(v84, @"RemoteAddress", v89);
    unsigned int v90 = v79[1];
    if (*v235)
    {
      if (!v90)
      {
LABEL_99:
        int v91 = 0;
LABEL_102:
        AddNumber(v84, @"RemotePrefix", v91);
        if (!v83)
        {
          __int128 v93 = (os_log_s *)ne_log_obj(v92);
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v93, OS_LOG_TYPE_DEFAULT, "IPSec Network Configuration: SPLIT-INCLUDE.\n", buf, 2u);
          }
        }

        update_service_route(v36, v237, -1, v80, 0, 0, 0, 0);
        CFArrayAppendValue(theArray, v84);
        CFRelease(v84);
        ++v83;
        v82 -= 14;
        __int128 v79 = (in_addr_t *)((char *)v79 + 14);
        if (v82 <= 14)
        {
          int v218 = 0;
          v233 += v81 + 1;
          goto LABEL_116;
        }

        continue;
      }
    }

    else if (v90 == -1)
    {
      in_addr_t *v235 = v87;
    }

    else
    {
      in_addr_t *v235 = v87 | 0x1000000;
      if (!v90) {
        goto LABEL_99;
      }
    }

    break;
  }

  int v91 = 32 - __clz(__rbit32(bswap32(v90)));
  goto LABEL_102;
}

uint64_t ipsec_uninstall(uint64_t a1)
{
  return 0LL;
}

void sub_22420(uint64_t a1, int a2)
{
  if (*(_DWORD *)(a1 + 872))
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    CFMutableArrayRef v13 = Mutable;
    CFArrayAppendValue(Mutable, kSCEntNetIPv4);
    if (*(_DWORD *)(a1 + 892))
    {
      CFArrayAppendValue(Mutable, kSCEntNetIPv6);
      *(_DWORD *)(a1 + 892) = 0;
    }

    CFArrayAppendValue(Mutable, kSCEntNetDNS);
    CFArrayAppendValue(Mutable, kSCEntNetProxies);
    unpublish_multiple_dicts((const __SCDynamicStore *)gDynamicStore, *(const __CFString **)(a1 + 24), Mutable, 1);
    my_CFRelease((const void **)&v13);
    if (*(_DWORD *)(a1 + 888)) {
      *(_DWORD *)(a1 + 888) = 0;
    }
    my_CFRelease((const void **)(a1 + 960));
    *(_DWORD *)(a1 + 872) = 0;
  }

  if (a2 && *(_DWORD *)(a1 + 876))
  {
    uint64_t v5 = *(const __CFDictionary **)(a1 + 880);
    if (v5)
    {
      if (IPSecRemovePolicies(v5, -1LL, &v12)) {
        sub_20090( 3LL,  @"IPSec Controller: Cannot remove mode config policies, error '%s'",  v6,  v7,  v8,  v9,  v10,  v11,  (uint64_t)v12);
      }
      my_CFRelease((const void **)(a1 + 880));
    }

    IPSecRemoveSecurityAssociations((unsigned __int8 *)(a1 + 616), (unsigned __int8 *)(a1 + 744));
    clear_ifaddr(a1 + 104, *(_DWORD *)(a1 + 896));
    my_close(*(unsigned int *)(a1 + 904));
    *(_DWORD *)(a1 + 904) = -1;
    free_service_routes(a1);
    *(_DWORD *)(a1 + 876) = 0;
  }

uint64_t ipsec_ondemand_add_service_data(uint64_t a1, __CFDictionary *a2)
{
  unint64_t Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), kSCPropNetIPSecOnDemandMatchDomainsAlways);
  uint64_t v5 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), kSCPropNetIPSecOnDemandMatchDomainsOnRetry);
  uint64_t v6 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), kSCPropNetIPSecOnDemandMatchDomainsNever);
  uint64_t v7 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), @"RemoteAddress");
  return 0LL;
}

uint64_t racoon_send_cmd_reconnect( int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v16[1] = 0x400000000000000LL;
  v16[0] = 5888LL;
  int v17 = a2;
  sub_20090(5LL, @"IPSec Controller: sending RECONNECT to racoon control socket", a3, a4, a5, a6, a7, a8, v15);
  sub_2270C(a1, (uint64_t)v16, 0x14uLL, v9, v10, v11, v12, v13);
  return 0LL;
}

uint64_t sub_2270C( int __fd, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3)
  {
    unint64_t v11 = 0LL;
    while (1)
    {
      ssize_t v12 = write(__fd, (const void *)(a2 + v11), a3 - v11);
      if (v12 < 1)
      {
        int v13 = *__error();
        if (v13 == 35)
        {
          int v20 = strerror(35);
          sub_20090(3LL, @"Received write error %s", v21, v22, v23, v24, v25, v26, (uint64_t)v20);
          if (write_barrier(__fd))
          {
            sub_20090(3LL, @"Failed to write packet", v27, v28, v29, v30, v31, v32, v41);
            return sub_20090(5LL, @"Sent %zd/%zu bytes", a3, a4, a5, a6, a7, a8, v11);
          }

          sub_20090(6LL, @"Received writeable event", v27, v28, v29, v30, v31, v32, v41);
        }

        else
        {
          if (v13 != 4)
          {
            int v42 = strerror(v13);
            sub_20090(3LL, @"Received write error %s", v33, v34, v35, v36, v37, v38, (uint64_t)v42);
            return sub_20090(5LL, @"Sent %zd/%zu bytes", a3, a4, a5, a6, a7, a8, v11);
          }

          uint64_t v40 = strerror(4);
          sub_20090(5LL, @"Received write error %s", v14, v15, v16, v17, v18, v19, (uint64_t)v40);
        }
      }

      else
      {
        v11 += v12;
      }

      if (v11 >= a3) {
        return sub_20090(5LL, @"Sent %zd/%zu bytes", a3, a4, a5, a6, a7, a8, v11);
      }
    }
  }

  unint64_t v11 = 0LL;
  return sub_20090(5LL, @"Sent %zd/%zu bytes", a3, a4, a5, a6, a7, a8, v11);
}

void ipsec_network_event(uint64_t a1, uint64_t a2)
{
  context.version = 0LL;
  memset(&context.retain, 0, 24);
  context.mach_timebase_info info = (void *)a1;
  in_addr v88 = 0LL;
  if (*(_BYTE *)(a1 + 617) == 2) {
    IPSecLogVPNInterfaceAddressEvent( (uint64_t)"ipsec_network_event",  a2,  *(_DWORD *)(a1 + 972),  (char *)(a1 + 918),  (void *)(a1 + 620));
  }
  if (*(void *)(a1 + 584))
  {
    if ((*(_BYTE *)(a1 + 74) & 0x20) != 0)
    {
      if (*(_BYTE *)(a1 + 934))
      {
        v93[0] = 0;
        int is_cellular = primary_interface_is_cellular(v93);
        if (v93[0])
        {
          if (!is_cellular)
          {
            unint64_t v11 = @"IPSec Controller: Disconnecting tunnel over cellular in favor of better interface";
            uint64_t v12 = 5LL;
LABEL_19:
            sub_20090(v12, v11, v5, v6, v7, v8, v9, v10, (uint64_t)v83);
            *(_DWORD *)(a1 + 596) = 15;
            ipsec_stop(a1, v13, v14, v15, v16, v17, v18, v19);
            return;
          }
        }
      }
    }
  }

  snprintf(__str, 0x20uLL, "%s%d", (const char *)(a2 + 32), *(_DWORD *)(a2 + 28));
  if (strncmp(__str, (const char *)(a1 + 918), 0x10uLL))
  {
    if (*(_DWORD *)(a1 + 592) != 8
      || !*(void *)(a1 + 952)
      || (*(_DWORD *)(a2 + 20) - 1) > 1
      || *(__int16 *)(a2 + 48) == -343)
    {
      return;
    }

    int v83 = __str;
    unint64_t v11 = @"IPSec Controller: an alternative interface %s was detected while the underlying interface %s was down.";
    goto LABEL_18;
  }

  if (*(_DWORD *)(a2 + 24) == 6)
  {
    unint64_t v11 = @"IPSec Controller: Network changed on underlying PPP interface";
LABEL_18:
    uint64_t v12 = 3LL;
    goto LABEL_19;
  }

  if (getifaddrs(&v88))
  {
LABEL_22:
    int v20 = (const __SCDynamicStore *)gDynamicStore;
    if (gDynamicStore)
    {
      if ((*(_DWORD *)(a2 + 20) & 0xFFFFFFFE) != 2) {
        goto LABEL_47;
      }
      CFStringRef v21 = CFStringCreateWithCStringNoCopy(0LL, (const char *)(a1 + 918), 0x600u, kCFAllocatorNull);
      if (v21)
      {
        uint64_t v22 = v21;
        CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
        uint64_t v24 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
        CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity( 0LL,  kSCDynamicStoreDomainSetup,  v22,  kSCEntNetAirPort);
        CFArrayAppendValue(Mutable, NetworkInterfaceEntity);
        CFRelease(NetworkInterfaceEntity);
        CFStringRef v26 = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0LL, kSCDynamicStoreDomainState, v22, kSCEntNetAirPort);
        CFArrayAppendValue(Mutable, v26);
        CFRelease(v26);
        CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( 0LL,  kSCDynamicStoreDomainSetup,  kSCCompAnyRegex,  kSCEntNetInterface);
        CFArrayAppendValue(v24, NetworkServiceEntity);
        CFRelease(NetworkServiceEntity);
        CFStringRef v28 = SCDynamicStoreKeyCreateNetworkServiceEntity( 0LL,  kSCDynamicStoreDomainSetup,  kSCCompAnyRegex,  kSCEntNetIPv4);
        CFArrayAppendValue(v24, v28);
        CFRelease(v28);
        uint64_t v29 = SCDynamicStoreCopyMultiple(v20, Mutable, v24);
        CFRelease(Mutable);
        CFRelease(v24);
        if (v29)
        {
          CFIndex Count = CFDictionaryGetCount(v29);
          if (Count <= 0)
          {
            syslog(3, "%s: empty SCDynamicStore dictionary", "ipsec_network_event");
            CFRelease(v22);
            int v65 = 0;
            int v66 = 0;
          }

          else
          {
            CFIndex v31 = Count;
            CFTypeRef cf1 = v22;
            if ((unint64_t)Count < 0x81)
            {
              uint64_t v32 = (const void **)v93;
              uint64_t v33 = (const void **)&v92;
            }

            else
            {
              uint64_t v32 = (const void **)CFAllocatorAllocate(0LL, 8 * Count, 0LL);
              uint64_t v33 = (const void **)CFAllocatorAllocate(0LL, 8 * v31, 0LL);
            }

            CFMutableDictionaryRef theDict = v29;
            CFDictionaryGetKeysAndValues(v29, v32, v33);
            uint64_t v67 = 0LL;
            int v86 = 0;
            do
            {
              uint64_t v68 = (const __CFString *)v32[v67];
              int v69 = (const __CFDictionary *)v33[v67];
              CFTypeID TypeID = CFStringGetTypeID();
              if (v68)
              {
                if (CFGetTypeID(v68) == TypeID)
                {
                  CFTypeID v71 = CFDictionaryGetTypeID();
                  if (v69)
                  {
                    if (CFGetTypeID(v69) == v71)
                    {
                      if (CFStringHasSuffix(v68, kSCEntNetInterface))
                      {
                        unint64_t Value = CFDictionaryGetValue(v69, kSCPropNetInterfaceDeviceName);
                        CFTypeID v73 = CFStringGetTypeID();
                        if (Value && CFGetTypeID(Value) == v73 && CFEqual(cf1, Value))
                        {
                          CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0LL, v68, @"/");
                          if (CFArrayGetCount(ArrayBySeparatingStrings) < 4)
                          {
                            int v78 = 0;
                          }

                          else
                          {
                            ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 3LL);
                            CFStringRef v76 = SCDynamicStoreKeyCreateNetworkServiceEntity( 0LL,  kSCDynamicStoreDomainSetup,  ValueAtIndex,  kSCEntNetIPv4);
                            if (v76)
                            {
                              CFStringRef v77 = v76;
                              if (CFDictionaryGetValue(theDict, v76))
                              {
                                int v78 = 0;
                              }

                              else
                              {
                                syslog(5, "%s: detected disabled IPv4 Config", "ipsec_network_event");
                                int v78 = 1;
                              }

                              CFRelease(v77);
                            }

                            else
                            {
                              syslog(5, "%s: detected disabled IPv4 Config", "ipsec_network_event");
                              int v78 = 1;
                            }
                          }

                          if (ArrayBySeparatingStrings) {
                            CFRelease(ArrayBySeparatingStrings);
                          }
                          int v86 = 1;
                          int v66 = 1;
                          if (v78) {
                            goto LABEL_98;
                          }
                        }
                      }

                      else if (CFStringHasSuffix(v68, kSCEntNetAirPort))
                      {
                        if (CFStringHasPrefix(v68, kSCDynamicStoreDomainSetup))
                        {
                          __int128 v79 = CFDictionaryGetValue(v69, @"PowerEnabled");
                          CFTypeID v80 = CFBooleanGetTypeID();
                          if (v79 && CFGetTypeID(v79) == v80 && CFEqual(v79, kCFBooleanFalse))
                          {
                            syslog(5, "%s: detected AirPort, PowerEnable == FALSE", "ipsec_network_event");
                            int v66 = 1;
                            goto LABEL_98;
                          }
                        }

                        else if (CFStringHasPrefix(v68, kSCDynamicStoreDomainState))
                        {
                          unsigned int v81 = CFDictionaryGetValue(v69, @"Power Status");
                          CFTypeID v82 = CFNumberGetTypeID();
                          if (v81)
                          {
                            if (CFGetTypeID(v81) == v82
                              && CFNumberGetValue((CFNumberRef)v81, kCFNumberShortType, &valuePtr)
                              && !valuePtr)
                            {
                              syslog(5, "%s: detected AirPort, PowerStatus == 0", "ipsec_network_event");
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }

              ++v67;
            }

            while (v31 != v67);
            int v66 = 0;
LABEL_98:
            CFRelease(cf1);
            if (v32 != (const void **)v93)
            {
              CFAllocatorDeallocate(0LL, v32);
              CFAllocatorDeallocate(0LL, v33);
            }

            uint64_t v29 = theDict;
            int v65 = v86;
          }

          CFRelease(v29);
          if (!v65 || v66) {
            goto LABEL_103;
          }
LABEL_47:
          if (*(void *)(a1 + 952))
          {
            if (*(_BYTE *)(a1 + 617) != 2
              || *(_DWORD *)(a1 + 592) != 8
              || (*(_DWORD *)(a2 + 20) - 1) > 1
              || *(_DWORD *)(a1 + 620) == *(_DWORD *)(a2 + 48)
              || (unsigned __int16)*(_DWORD *)(a2 + 48) == 65193)
            {
              return;
            }

            int v83 = (char *)(a1 + 918);
            unint64_t v11 = @"IPSec Controller: the underlying interface %s address changed.";
          }

          else
          {
            sub_20090( 3LL,  @"IPSec Controller: Network changed, address disappeared on underlying interface, install timer %d secs",  v5,  v6,  v7,  v8,  v9,  v10,  *(unsigned int *)(a1 + 972));
            CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
            LODWORD(v60) = *(_DWORD *)(a1 + 972);
            CFRunLoopTimerRef v61 = CFRunLoopTimerCreate( 0LL,  Current + (double)v60,  3.1536e10,  0LL,  0LL,  (CFRunLoopTimerCallBack)sub_2334C,  &context);
            *(void *)(a1 + 952) = v61;
            if (v61)
            {
              sub_208B0(a1, 8LL, v5, v6, v7, v8, v9, v10);
              int v62 = CFRunLoopGetCurrent();
              CFRunLoopAddTimer(v62, *(CFRunLoopTimerRef *)(a1 + 952), kCFRunLoopCommonModes);
              if (*(void *)(a1 + 984))
              {
                __int128 v63 = (CFRunLoopTimerRef *)(a1 + 984);
                int v64 = CFRunLoopGetCurrent();
                CFRunLoopRemoveTimer(v64, *v63, kCFRunLoopCommonModes);
                my_CFRelease((const void **)v63);
              }

              return;
            }

            unint64_t v11 = @"IPSec Controller: Network changed, cannot create RunLoop timer";
          }

          goto LABEL_18;
        }

        syslog(3, "%s: failed to initialize SCDynamicStore dictionary", "ipsec_network_event");
        CFRelease(v22);
      }

      else
      {
        syslog(3, "%s: failed to initialize interface CFString", "ipsec_network_event");
      }

LABEL_103:
      unint64_t v11 = @"IPSec Controller: the underlying interface/service has changed unrecoverably.";
      goto LABEL_18;
    }

    syslog(7, "%s: invalid SCDynamicStore reference", "ipsec_network_event");
    goto LABEL_47;
  }

  uint64_t v34 = v88;
  if (!v88)
  {
    freeifaddrs(0LL);
    goto LABEL_22;
  }

  uint64_t v35 = v88;
  do
  {
    ifa_name = v35->ifa_name;
    if (!ifa_name) {
      goto LABEL_37;
    }
    ifa_addr = v35->ifa_addr;
    if (!ifa_addr) {
      goto LABEL_38;
    }
    else {
LABEL_37:
    }
      LODWORD(ifa_addr) = 0;
LABEL_38:
    uint64_t v35 = v35->ifa_next;
    if (v35) {
      BOOL v38 = (_DWORD)ifa_addr == 0;
    }
    else {
      BOOL v38 = 0;
    }
  }

  while (v38);
  freeifaddrs(v34);
  if (!(_DWORD)ifa_addr) {
    goto LABEL_22;
  }
  if (*(void *)(a1 + 952))
  {
    sub_208B0(a1, 6LL, v5, v6, v7, v8, v9, v10);
    sub_20090( 3LL,  @"IPSec Controller: Network changed, address came back on underlying interface, cancel timer",  v39,  v40,  v41,  v42,  v43,  v44,  (uint64_t)v83);
    int v45 = CFRunLoopGetCurrent();
    CFRunLoopRemoveTimer(v45, *(CFRunLoopTimerRef *)(a1 + 952), kCFRunLoopCommonModes);
    my_CFRelease((const void **)(a1 + 952));
    if ((*(_BYTE *)(a1 + 73) & 4) != 0)
    {
      racoon_send_cmd_start_dpd(*(_DWORD *)(a1 + 784), *(_DWORD *)(a1 + 748), v46, v47, v48, v49, v50, v51);
      *(_DWORD *)(a1 + 992) = 1;
    }

    else
    {
      sub_20090(5LL, @"IPSec Controller: asserting connection", v46, v47, v48, v49, v50, v51, v84);
      racoon_send_cmd_assert(a1, v52, v53, v54, v55, v56, v57, v58);
    }
  }

uint64_t racoon_send_cmd_start_dpd( int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v16[1] = 0x400000000000000LL;
  v16[0] = 5376LL;
  int v17 = a2;
  sub_20090(5LL, @"IPSec Controller: sending START_DPD to racoon control socket", a3, a4, a5, a6, a7, a8, v15);
  sub_2270C(a1, (uint64_t)v16, 0x14uLL, v9, v10, v11, v12, v13);
  return 0LL;
}

uint64_t racoon_send_cmd_assert( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  context.version = 0LL;
  memset(&context.retain, 0, 24);
  context.mach_timebase_info info = (void *)a1;
  uint64_t v42 = 5632LL;
  uint64_t v43 = 0LL;
  int v44 = 0;
  if (*(_BYTE *)(a1 + 617) == 2) {
    int v44 = *(_DWORD *)(a1 + 620);
  }
  int v45 = *(_DWORD *)(a1 + 748);
  HIWORD(v43) = 2048;
  sub_2270C(*(_DWORD *)(a1 + 784), (uint64_t)&v42, 0x18uLL, a4, a5, a6, a7, a8);
  *(_DWORD *)(a1 + 912) = 0;
  if (*(_DWORD *)(a1 + 592) == 6) {
    *(_DWORD *)(a1 + 600) = 1;
  }
  uint64_t v9 = *(__CFRunLoopTimer **)(a1 + 776);
  double v10 = CFAbsoluteTimeGetCurrent() + 3.0;
  if (v9)
  {
    CFRunLoopTimerSetNextFireDate(v9, v10);
LABEL_9:
    sub_20090( 5LL,  @"IPSec Controller: wait for %d secs before forcing SAs to rekey",  v11,  v12,  v13,  v14,  v15,  v16,  3LL);
    return 0LL;
  }

  CFRunLoopTimerRef v17 = CFRunLoopTimerCreate(0LL, v10, 3.1536e10, 0LL, 0LL, (CFRunLoopTimerCallBack)sub_23E9C, &context);
  *(void *)(a1 + 776) = v17;
  if (v17)
  {
    CFAbsoluteTime Current = CFRunLoopGetCurrent();
    CFRunLoopAddTimer(Current, *(CFRunLoopTimerRef *)(a1 + 776), kCFRunLoopCommonModes);
    goto LABEL_9;
  }

  sub_20090(3LL, @"IPSec Controller: assert cannot create RunLoop timer", v18, v19, v20, v21, v22, v23, v39);
  if (!*(_DWORD *)(a1 + 596)) {
    *(_DWORD *)(a1 + 596) = 1;
  }
  sub_20090(3LL, @"IPSec Controller: ASSERT failed", v26, v27, v28, v29, v30, v31, v40);
  ipsec_stop(a1, v32, v33, v34, v35, v36, v37, v38);
  return 0xFFFFFFFFLL;
}

uint64_t sub_2334C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_BYTE *)(a2 + 617) == 2) {
    IPSecLogVPNInterfaceAddressEvent( (uint64_t)"event_timer",  0LL,  *(_DWORD *)(a2 + 972),  (char *)(a2 + 918),  (void *)(a2 + 620));
  }
  *(_DWORD *)(a2 + 596) = 15;
  return ipsec_stop(a2, v9, v10, v11, v12, v13, v14, v15);
}

uint64_t racoon_send_cmd_connect( int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v18[1] = 0x400000000000000LL;
  v18[0] = 4352LL;
  int v19 = a2;
  sub_20090(5LL, @"IPSec Controller: sending CONNECT to racoon control socket", a3, a4, a5, a6, a7, a8, v17);
  uint64_t v14 = sub_2270C(a1, (uint64_t)v18, 0x14uLL, v9, v10, v11, v12, v13);
  uint64_t v15 = (os_log_s *)ne_log_obj(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "IPSec Phase1 starting.\n", (uint8_t *)&v17, 2u);
  }

  return 0LL;
}

uint64_t racoon_send_cmd_disconnect( int a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v15[1] = 0x400000000000000LL;
  v15[0] = 4608LL;
  unsigned int v16 = a2;
  sub_20090( 5LL,  @"IPSec Controller: sending DISCONNECT to racoon control socket, address 0x%x",  a3,  a4,  a5,  a6,  a7,  a8,  bswap32(a2));
  sub_2270C(a1, (uint64_t)v15, 0x14uLL, v9, v10, v11, v12, v13);
  return 0LL;
}

uint64_t racoon_send_cmd_bind( int a1, int a2, char *__s, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (__s) {
    signed int v11 = strlen(__s);
  }
  else {
    signed int v11 = 0;
  }
  uint64_t v25 = 0LL;
  HIWORD(v25) = bswap32(v11 + 8) >> 16;
  uint64_t v24 = 256LL;
  int v26 = a2;
  unsigned int v27 = bswap32(v11) >> 16;
  sub_20090( 5LL,  @"IPSec Controller: sending BIND to racoon control socket",  (uint64_t)__s,  a4,  a5,  a6,  a7,  a8,  v23);
  sub_2270C(a1, (uint64_t)&v24, 0x18uLL, v12, v13, v14, v15, v16);
  if (v11) {
    sub_2270C(a1, (uint64_t)__s, v11, v17, v18, v19, v20, v21);
  }
  return 0LL;
}

uint64_t racoon_send_cmd_set_nat64_prefix( int a1, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v16[1] = 0x1000000000000000LL;
  v16[0] = 6144LL;
  __int128 v17 = *a2;
  sub_20090( 5LL,  @"IPSec Controller: sending SET_NAT64_PREFIX to racoon control socket",  a3,  a4,  a5,  a6,  a7,  a8,  v15);
  sub_2270C(a1, (uint64_t)v16, 0x20uLL, v9, v10, v11, v12, v13);
  return 0LL;
}

uint64_t racoon_send_cmd_unbind( int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v16[1] = 0x400000000000000LL;
  v16[0] = 512LL;
  int v17 = a2;
  sub_20090(5LL, @"IPSec Controller: sending UNBIND to racoon control socket", a3, a4, a5, a6, a7, a8, v15);
  sub_2270C(a1, (uint64_t)v16, 0x14uLL, v9, v10, v11, v12, v13);
  return 0LL;
}

uint64_t racoon_send_cmd_start_ph2(int a1, int a2, const __CFDictionary *a3)
{
  int v6 = IPSecCountPolicies(a3);
  if (v6 < 1)
  {
    uint64_t v48 = "cannot create ph2 config - no policies found";
LABEL_60:
    sub_20090(3LL, @"IPSec Controller: failed to start phase2 - '%s'", v7, v8, v9, v10, v11, v12, (uint64_t)v48);
    return 0xFFFFFFFFLL;
  }

  size_t v13 = 48LL * v6 + 88;
  uint64_t v14 = malloc(v13);
  if (!v14)
  {
    uint64_t v48 = "out of memory";
    goto LABEL_60;
  }

  uint64_t v15 = v14;
  bzero(v14, v13);
  *(_WORD *)uint64_t v15 = 4864;
  v15[4] = a2;
  v15[5] = 269352960;
  *(_DWORD *)((char *)v15 + 26) = 117440512;
  if (!GetStrAddrFromDict(a3, @"LocalAddress", v73, 256))
  {
LABEL_61:
    uint64_t v49 = "incorrect local address";
    goto LABEL_64;
  }

  if (!GetStrAddrFromDict(a3, @"RemoteAddress", v72, 256))
  {
LABEL_62:
    uint64_t v49 = "incorrect remote address";
    goto LABEL_64;
  }

  unint64_t Value = CFDictionaryGetValue(a3, @"Policies");
  if (!isArray(Value) || (CFIndex Count = CFArrayGetCount((CFArrayRef)Value)) == 0)
  {
    uint64_t v49 = "no policy found";
    goto LABEL_64;
  }

  int __fd = a1;
  uint64_t v24 = (char *)(v15 + 8);
  if (Count < 1)
  {
    LODWORD(v26) = 0;
LABEL_67:
    *((_WORD *)v15 + 13) = bswap32(v26) >> 16;
    *(_DWORD *)uint64_t v24 = 201326592;
    *((_WORD *)v24 + 2) = 1;
    *((_DWORD *)v24 + 2) = 201326592;
    *((_WORD *)v24 + 6) = 0;
    *((_DWORD *)v24 + 4) = 50331648;
    *((_WORD *)v24 + 10) = 0;
    *((_DWORD *)v24 + 6) = 318767360;
    *((_WORD *)v24 + 14) = 0;
    *((_DWORD *)v24 + 8) = 251658496;
    *((_WORD *)v24 + 18) = 0;
    *((_DWORD *)v24 + 10) = 234881280;
    *((_WORD *)v24 + 22) = 0;
    *((_DWORD *)v24 + 12) = 419430912;
    *((_WORD *)v24 + 26) = 0;
    uint64_t v51 = 24LL * (unsigned __int16)v26;
    unint64_t v52 = v51 + 88;
    *((_WORD *)v15 + 7) = bswap32(v51 + 72) >> 16;
    sub_20090( 5LL,  @"IPSec Controller: sending START_PH2 to racoon control socket",  v16,  v17,  v18,  v19,  v20,  v21,  v60);
    uint64_t v58 = sub_2270C(__fd, (uint64_t)v15, v52, v53, v54, v55, v56, v57);
    uint64_t v59 = (os_log_s *)ne_log_obj(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v70.s_addr) = 0;
      _os_log_impl(&dword_0, v59, OS_LOG_TYPE_DEFAULT, "IPSec Phase2 starting.\n", (uint8_t *)&v70, 2u);
    }

    free(v15);
    return 0LL;
  }

  CFIndex v25 = Count;
  uint64_t v26 = 0LL;
  CFIndex v27 = 0LL;
  CFIndex v62 = Count;
  __int128 v63 = Value;
  while (1)
  {
    int v66 = 255;
    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)Value, v27);
    if (!isDictionary(ValueAtIndex))
    {
      uint64_t v49 = "incorrect policy found";
      goto LABEL_64;
    }

    uint64_t v29 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Mode");
    if (isString(v29) && !CFEqual(v29, @"Tunnel"))
    {
      if (!CFEqual(v29, @"Transport"))
      {
        uint64_t v49 = "incorrect policy type found";
        goto LABEL_64;
      }

      char v30 = 1;
    }

    else
    {
      char v30 = 0;
    }

    uint64_t v31 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Direction");
    if (!CFEqual(v31, @"In")) {
      break;
    }
    char v32 = 0;
    char v64 = 1;
LABEL_22:
    uint64_t v33 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Level");
    if (isString(v33) && (CFEqual(v33, @"Unique") || CFEqual(v33, @"Require")))
    {
      if ((v30 & 1) != 0)
      {
        GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"LocalPort", &v65, 0);
        unsigned int v34 = (unsigned __int16)v65;
        if (!inet_aton(v73, &v70)) {
          goto LABEL_61;
        }
        uint64_t v35 = v26;
        in_addr_t s_addr = v70.s_addr;
        GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"RemotePort", &v65, 0);
        unsigned int v37 = v65;
        if (!inet_aton(v72, &v69)) {
          goto LABEL_62;
        }
        unsigned int v38 = bswap32(v34) >> 16;
        unsigned int v39 = bswap32(v37) >> 16;
        if (s_addr) {
          unsigned int v40 = -1;
        }
        else {
          unsigned int v40 = 0;
        }
        if (v69.s_addr) {
          unsigned int v41 = -1;
        }
        else {
          unsigned int v41 = 0;
        }
        GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"Protocol", &v66, 0);
LABEL_49:
        char v45 = v64;
      }

      else
      {
        if (!GetStrAddrFromDict((const __CFDictionary *)ValueAtIndex, @"LocalAddress", v71, 256)
          || !inet_aton(v71, &v70))
        {
          uint64_t v49 = "incorrect local network";
          goto LABEL_64;
        }

        GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"LocalPrefix", &v68, 32);
        int v42 = v68;
        if (v68)
        {
          unsigned int v43 = 0;
          do
          {
            unsigned int v40 = (v43 >> 1) | 0x80000000;
            unsigned int v43 = v40;
            --v42;
          }

          while (v42);
        }

        else
        {
          unsigned int v40 = 0;
        }

        if (!GetStrAddrFromDict((const __CFDictionary *)ValueAtIndex, @"RemoteAddress", v71, 256)
          || !inet_aton(v71, &v69))
        {
          uint64_t v49 = "incorrect remote network";
          goto LABEL_64;
        }

        uint64_t v35 = v26;
        GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"RemotePrefix", &v67, 32);
        int v44 = v67;
        if (!v67)
        {
          LOWORD(v38) = 0;
          LOWORD(v39) = 0;
          unsigned int v41 = 0;
          goto LABEL_49;
        }

        unsigned int v41 = 0;
        char v45 = v64;
        do
        {
          unsigned int v41 = (v41 >> 1) | 0x80000000;
          --v44;
        }

        while (v44);
        LOWORD(v38) = 0;
        LOWORD(v39) = 0;
      }

      unsigned int v46 = bswap32(v40);
      unsigned int v47 = bswap32(v41);
      if ((v45 & 1) != 0)
      {
        uint64_t v26 = v35;
      }

      else
      {
        *(in_addr *)uint64_t v24 = v70;
        *((_DWORD *)v24 + 1) = v46;
        *((_WORD *)v24 + 8) = v38;
        *((in_addr *)v24 + 2) = v69;
        *((_DWORD *)v24 + 3) = v47;
        *((_WORD *)v24 + 9) = v39;
        *((_WORD *)v24 + 10) = bswap32((unsigned __int16)v66) >> 16;
        uint64_t v26 = (v35 + 1);
        v24 += 24;
      }

      CFIndex v25 = v62;
      if ((v32 & 1) == 0)
      {
        *((in_addr *)v24 + 2) = v70;
        *((_DWORD *)v24 + 3) = v46;
        *((_WORD *)v24 + 9) = v38;
        *(in_addr *)uint64_t v24 = v69;
        *((_DWORD *)v24 + 1) = v47;
        *((_WORD *)v24 + 8) = v39;
        *((_WORD *)v24 + 10) = bswap32((unsigned __int16)v66) >> 16;
        uint64_t v26 = (v26 + 1);
        v24 += 24;
      }

      unint64_t Value = v63;
    }

    if (++v27 == v25) {
      goto LABEL_67;
    }
  }

  if (CFEqual(v31, @"Out"))
  {
    char v64 = 0;
    char v32 = 1;
    goto LABEL_22;
  }

  if (CFEqual(v31, @"InOut"))
  {
LABEL_21:
    char v32 = 0;
    char v64 = 0;
    goto LABEL_22;
  }

  uint64_t v49 = "incorrect policy direction found";
LABEL_64:
  sub_20090(3LL, @"IPSec Controller: failed to start phase2 - '%s'", v16, v17, v18, v19, v20, v21, (uint64_t)v49);
  free(v15);
  return 0xFFFFFFFFLL;
}

uint64_t write_barrier(int a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0LL);
  uint64_t v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_write, a1, 0LL, 0LL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000LL;
  handler[2] = sub_23E6C;
  handler[3] = &unk_39430;
  handler[4] = v2;
  dispatch_source_set_event_handler(v3, handler);
  dispatch_retain(v3);
  dispatch_retain(v2);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 0x40000000LL;
  void v7[2] = sub_23E74;
  v7[3] = &unk_39450;
  v7[4] = v2;
  v7[5] = v3;
  dispatch_source_set_cancel_handler(v3, v7);
  dispatch_activate(v3);
  dispatch_time_t v4 = dispatch_time(0LL, 250000000LL);
  uint64_t v5 = dispatch_semaphore_wait(v2, v4);
  dispatch_source_cancel(v3);
  dispatch_release(v3);
  dispatch_release(v2);
  return v5;
}

uint64_t sub_23E6C(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_23E74(uint64_t a1)
{
}

void sub_23E9C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v15 = *(_DWORD *)(a2 + 592);
  if ((v15 - 1) > 1 || (uint64_t v16 = *(const __CFArray **)(a2 + 1024)) == 0LL)
  {
LABEL_12:
    int v30 = v15 - 1;
    int v31 = 7;
    switch(v30)
    {
      case 0:
        goto LABEL_22;
      case 1:
        int v31 = 9;
        goto LABEL_22;
      case 2:
        int v32 = *(_DWORD *)(a2 + 912);
        if (v32 < 1) {
          goto LABEL_21;
        }
        goto LABEL_19;
      case 5:
        int v33 = *(_DWORD *)(a2 + 600);
        if (v33 == 1)
        {
          int v36 = *(_DWORD *)(a2 + 784);
          int v37 = *(_DWORD *)(a2 + 748);
          uint64_t v50 = 0x400000000000000LL;
          *(void *)buffer = 5888LL;
          int v51 = v37;
          sub_20090( 5LL,  @"IPSec Controller: sending RECONNECT to racoon control socket",  v9,  v10,  v11,  v12,  v13,  v14,  v46);
          sub_2270C(v36, (uint64_t)buffer, 0x14uLL, v38, v39, v40, v41, v42);
          if (*(_DWORD *)(a2 + 592) == 6) {
            *(_DWORD *)(a2 + 600) = 2;
          }
          unsigned int v43 = *(__CFRunLoopTimer **)(a2 + 776);
          if (v43)
          {
            CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
            CFRunLoopTimerSetNextFireDate(v43, Current + 10.0);
          }
        }

        else if (v33 == 4 && (int v32 = *(_DWORD *)(a2 + 912), v32 > 0))
        {
LABEL_19:
          *(_DWORD *)(a2 + 912) = v32 - 1;
          sub_25364((const char *)(a2 + 104), (_DWORD *)(a2 + 908), v9, v10, v11, v12, v13, v14, v46);
          unsigned int v34 = *(__CFRunLoopTimer **)(a2 + 776);
          if (v34)
          {
            CFAbsoluteTime v35 = CFAbsoluteTimeGetCurrent();
            CFRunLoopTimerSetNextFireDate(v34, v35 + 1.0);
          }
        }

        else
        {
LABEL_21:
          int v31 = 10;
LABEL_22:
          *(_DWORD *)(a2 + 596) = v31;
          ipsec_stop(a2);
        }

        break;
      default:
        goto LABEL_21;
    }

    return;
  }

  CFIndex v17 = *(int *)(a2 + 1036);
  if (CFArrayGetCount(v16) <= v17)
  {
    int v15 = *(_DWORD *)(a2 + 592);
    goto LABEL_12;
  }

  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a2 + 1024), *(int *)(a2 + 1036));
  if (ValueAtIndex)
  {
    uint64_t v19 = ValueAtIndex;
    ++*(_DWORD *)(a2 + 1036);
    unint64_t Value = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, @"RemoteAddress");
    if (Value)
    {
      uint64_t v21 = Value;
      if ((unint64_t)CFDataGetLength(Value) >= 0x10)
      {
        *(void *)buffer = 0LL;
        uint64_t v50 = 0LL;
        v52.length = CFDataGetLength(v21);
        v52.CFIndex location = 0LL;
        CFDataGetBytes(v21, v52, buffer);
        *(void *)unsigned int v47 = 0LL;
        uint64_t v48 = 0LL;
        uint64_t v22 = (const __CFData *)CFDictionaryGetValue(v19, @"RemoteAddressNAT64Prefix");
        if (v22)
        {
          uint64_t v29 = v22;
          if (CFDataGetLength(v22) != 16) {
            return;
          }
          v53.length = CFDataGetLength(v29);
          v53.CFIndex location = 0LL;
          CFDataGetBytes(v29, v53, v47);
        }

        sub_20090( 5LL,  @"IPSec Controller: racoon_timer call racoon_restart_cisco_ipsec",  v23,  v24,  v25,  v26,  v27,  v28,  v46);
        sub_25C8C(a2, buffer, v47, 0LL);
      }
    }
  }

uint64_t ipsec_cellular_event( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a2 - 1) >= 2)
  {
    if (!(_DWORD)a2) {
      return sub_24180(a1);
    }
  }

  else
  {
    *(_DWORD *)(a1 + 596) = 18;
    return ipsec_stop(a1, a2, a3, a4, a5, a6, a7, a8);
  }

  return a1;
}

uint64_t sub_24180(uint64_t a1)
{
  *(_DWORD *)(a1 + 7memset(v5, 0, 44) = 528;
  if (inet_aton(v25, (in_addr *)(a1 + 748))) {
    return sub_25C8C(a1, (_OWORD *)(a1 + 744), (_OWORD *)(a1 + 760), 0LL, v2, v3, v4, v5);
  }
  v18[0] = 0LL;
  __int128 v19 = 0u;
  uint64_t v20 = 0LL;
  v18[1] = a1;
  gettimeofday((timeval *)(a1 + 1008), 0LL);
  __int128 v23 = 0u;
  memset(v24, 0, sizeof(v24));
  DWORD2(v23) = 17;
  int v22 = 1032;
  int v7 = getaddrinfo_async_start(&v21, v25, 0LL, &v22, sub_28064, a1);
  if (v7)
  {
    sub_28064(v7, 0LL, a1);
    *(_DWORD *)(a1 + 596) = 5;
    ipsec_stop(a1, v8, v9, v10, v11, v12, v13, v14);
    return *(unsigned int *)(a1 + 596);
  }

  else
  {
    int v15 = (__CFMachPort *)_SC_CFMachPortCreateWithPort("PPPController/DNS", v21, sub_2851C, v18);
    *(void *)(a1 + 1000) = v15;
    if (v15)
    {
      CFRunLoopSourceRef RunLoopSource = CFMachPortCreateRunLoopSource(0LL, v15, 0LL);
      CFAbsoluteTime Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopCommonModes);
      CFRelease(RunLoopSource);
    }

    return 0LL;
  }

uint64_t ipsec_start( uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_BYTE *)(a1 + 16))
  {
    *(_DWORD *)(a1 + 596) = 7;
    sub_247C4(a1, 0LL, 7LL, 0);
    return *(unsigned int *)(a1 + 596);
  }

  int v9 = a7;
  mach_port_name_t v10 = a5;
  int v11 = a4;
  int v12 = a3;
  sub_20090(5LL, @"IPSec Controller: ipsec_start, ondemand flag = %d", a3, a4, a5, a6, a7, a8, a7);
  if (!*(_DWORD *)(a1 + 592))
  {
    uint64_t v27 = *(__CFUserNotification **)(a1 + 168);
    if (v27)
    {
      if (v9)
      {
        unsigned int v28 = *(_DWORD *)(a1 + 596);
        if (v28 <= 0x15 && ((1 << v28) & 0x302000) != 0)
        {
          sub_20090( 3LL,  @"IPSec Controller: ipsec_start fails cert validity, returns error %d ",  v14,  v15,  v16,  v17,  v18,  v19,  *(unsigned int *)(a1 + 596));
          return *(unsigned int *)(a1 + 596);
        }
      }

      CFUserNotificationCancel(v27);
      CFAbsoluteTime Current = CFRunLoopGetCurrent();
      CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 176), kCFRunLoopDefaultMode);
      my_CFRelease((const void **)(a1 + 168));
      my_CFRelease((const void **)(a1 + 176));
    }

    sub_208B0(a1, 1LL, v14, v15, v16, v17, v18, v19);
    *(_DWORD *)(a1 + 600) = 0;
    *(_DWORD *)(a1 + 396) = 0;
    service_started(a1);
    *(_DWORD *)(a1 + 596) = 0;
    *(_DWORD *)(a1 + 912) = 0;
    *(_DWORD *)(a1 + 992) = 0;
    *(void *)(a1 + 1032) = 0LL;
    *(void *)(a1 + 1024) = 0LL;
    *(void *)(a1 + 128) = a2;
    my_CFRetain(a2);
    *(_DWORD *)(a1 + 88) = v12;
    *(_DWORD *)(a1 + 92) = v11;
    scnc_bootstrap_retain(a1, v10);
    *(_DWORD *)(a1 + 72) = *(_DWORD *)(a1 + 72) & 0xFFFFF3FF | ((v9 != 0) << 10);
    sub_20090( 7LL,  @"IPSec Controller: IPSec System Prefs %@",  v30,  v31,  v32,  v33,  v34,  v35,  *(void *)(a1 + 136));
    sub_20090( 7LL,  @"IPSec Controller: IPSec User Options %@",  v36,  v37,  v38,  v39,  v40,  v41,  *(void *)(a1 + 128));
    if (GetStrFromDict(*(const __CFDictionary **)(a1 + 136), @"RemoteAddress", cStr, 255, ""))
    {
      uint64_t v48 = racoon_validate_cfg_str(cStr);
      if ((_DWORD)v48)
      {
        uint64_t v49 = (os_log_s *)ne_log_obj(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)&buf.sa_len = 136315138;
          *(void *)&buf.sa_data[2] = cStr;
          _os_log_impl(&dword_0, v49, OS_LOG_TYPE_DEFAULT, "IPSec connecting to server %s\n", &buf.sa_len, 0xCu);
        }

        *(_WORD *)(a1 + 916) = 0x8000;
        unint64_t Value = (const __CFString *)CFDictionaryGetValue( *(CFDictionaryRef *)(a1 + 136),  kSCPropNetIPSecXAuthPasswordEncryption);
        if (isString(Value)
          && CFStringCompare(Value, kSCValNetIPSecXAuthPasswordEncryptionPrompt, 0LL) == kCFCompareEqualTo)
        {
          *(_WORD *)(a1 + 916) |= 0x40u;
        }

        if (*(void *)(a1 + 584)
          || *(_DWORD *)(a1 + 800) != -1
          || (event_create_socket( (void *)a1,  (CFSocketNativeHandle *)(a1 + 800),  (CFSocketRef *)(a1 + 808),  (void (__cdecl *)(CFSocketRef, CFSocketCallBackType, CFDataRef, const void *, void *))sub_24A38,  0) & 0x80000000) == 0)
        {
          SCNetworkReachabilityFlags flags = 0;
          *(void *)&buf.sa_data[6] = 0LL;
          *(void *)&buf.sa_len = 528LL;
          int v51 = SCNetworkReachabilityCreateWithAddress(0LL, &buf);
          if (v51)
          {
            CFRange v52 = v51;
            if (SCNetworkReachabilityGetFlags(v51, &flags))
            {
              BOOL v59 = (~flags & 0x40006) == 0;
              sub_20090( 5LL,  @"IPSec Controller: ipsec_start reachability SCNetworkReachabilityFlags flags = 0x%x, need_cellular = %d",  v53,  v54,  v55,  v56,  v57,  v58,  flags);
            }

            else
            {
              BOOL v59 = 0;
            }

            CFRelease(v52);
          }

          else
          {
            BOOL v59 = 0;
          }

          int valuePtr = 1;
          int v68 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), @"NattKeepAliveEnabled");
          CFTypeID TypeID = CFNumberGetTypeID();
          if (!v68
            || CFGetTypeID(v68) != TypeID
            || (CFNumberGetValue((CFNumberRef)v68, kCFNumberIntType, &valuePtr), valuePtr))
          {
            if ((flags & 0x40000) != 0) {
              int v70 = 0;
            }
            else {
              int v70 = 60;
            }
            int v82 = v70;
            CFTypeID v71 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), @"NattKeepAliveTimer");
            CFTypeID v72 = CFNumberGetTypeID();
            if (v71)
            {
              if (CFGetTypeID(v71) == v72) {
                CFNumberGetValue(v71, kCFNumberIntType, &v82);
              }
            }

            size_t v81 = 4LL;
            sysctlbyname("net.key.natt_keepalive_interval", &gNattKeepAliveInterval, &v81, &v82, 4uLL);
          }

          if (!v59) {
            return sub_24180(a1);
          }
          int v67 = 18;
          goto LABEL_48;
        }

        uint64_t v60 = @"IPSec Controller: cannot create event socket";
LABEL_30:
        sub_20090(3LL, v60, v42, v43, v44, v45, v46, v47, v80);
        if (*(_DWORD *)(a1 + 596))
        {
LABEL_49:
          sub_20090(3LL, @"IPSec Controller: ipsec_start failed", v61, v62, v63, v64, v65, v66, v80);
          ipsec_stop(a1, v73, v74, v75, v76, v77, v78, v79);
          return *(unsigned int *)(a1 + 596);
        }

        int v67 = 1;
LABEL_48:
        *(_DWORD *)(a1 + 596) = v67;
        goto LABEL_49;
      }

      uint64_t v60 = @"IPSec Controller: invalid RemoteAddress ...";
    }

    else
    {
      uint64_t v60 = @"IPSec Controller: cannot find RemoteAddress ...";
    }

    *(_DWORD *)(a1 + 596) = 2;
    goto LABEL_30;
  }

  if (my_CFEqual((unint64_t)a2, *(void *)(a1 + 128)))
  {
    phase_changed(a1, *(unsigned int *)(a1 + 592), v20, v21, v22, v23, v24, v25);
    return 0LL;
  }

  return 5LL;
}

void sub_247C4(uint64_t a1, CFStringRef theString, uint64_t a3, int a4)
{
  CFMutableDictionaryRef v15 = 0LL;
  if ((*(_BYTE *)(a1 + 72) & 0x40) != 0)
  {
    if (theString)
    {
      CFStringRef v16 = theString;
      CFStringRef v7 = theString;
    }

    else
    {
      CFStringRef v7 = CFStringCreateWithFormat(0LL, 0LL, @"IPSec Error %d", a3);
      CFStringRef v16 = v7;
      if (!v7)
      {
        my_CFRelease((const void **)&v15);
LABEL_24:
        my_CFRelease((const void **)&v16);
        return;
      }
    }

    if (CFStringGetLength(v7) && (a4 != 2 || (*(_BYTE *)(a1 + 73) & 4) == 0 || !*(_BYTE *)(a1 + 1040)))
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFCopyStringDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      CFMutableDictionaryRef v15 = Mutable;
      if (Mutable)
      {
        int v9 = Mutable;
        if (gIconURLRef) {
          CFDictionaryAddValue(Mutable, kCFUserNotificationIconURLKey, (const void *)gIconURLRef);
        }
        if (gBundleURLRef) {
          CFDictionaryAddValue(v9, kCFUserNotificationLocalizationURLKey, (const void *)gBundleURLRef);
        }
        CFDictionaryAddValue(v9, kCFUserNotificationAlertMessageKey, v7);
        CFDictionaryAddValue(v9, kCFUserNotificationAlertHeaderKey, @"VPN Connection");
        if (a4 == 2)
        {
          CFDictionaryAddValue(v9, kCFUserNotificationDefaultButtonTitleKey, @"Ignore");
          CFDictionaryAddValue(v9, kCFUserNotificationAlternateButtonTitleKey, @"Settings");
          *(_BYTE *)(a1 + 1040) = 1;
        }

        else if (a4 == 1)
        {
          CFDictionaryAddValue(v9, kCFUserNotificationAlternateButtonTitleKey, @"Disconnect");
        }

        mach_port_name_t v10 = *(__CFUserNotification **)(a1 + 168);
        if (v10)
        {
          SInt32 error = CFUserNotificationUpdate(v10, 0.0, 1uLL, v9);
        }

        else
        {
          int v11 = CFUserNotificationCreate(0LL, 0.0, 1uLL, &error, v9);
          *(void *)(a1 + 168) = v11;
          if (v11)
          {
            CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource( 0LL,  v11,  (CFUserNotificationCallBack)user_notification_callback,  0LL);
            *(void *)(a1 + 176) = RunLoopSource;
            if (RunLoopSource)
            {
              CFAbsoluteTime Current = CFRunLoopGetCurrent();
              CFRunLoopAddSource(Current, *(CFRunLoopSourceRef *)(a1 + 176), kCFRunLoopDefaultMode);
            }

            else
            {
              my_CFRelease((const void **)(a1 + 168));
            }
          }
        }
      }
    }

    my_CFRelease((const void **)&v15);
    if (!theString) {
      goto LABEL_24;
    }
  }

void sub_24A38(__CFSocket *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  CFSocketNativeHandle Native = CFSocketGetNative(a1);
  if (recv(Native, v7, 0x100uLL, 0) != -1) {
    ipsec_network_event(a5, (uint64_t)v7);
  }
}

uint64_t ipsec_getstatus_hack_notify(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 592) - 1;
  else {
    return dword_2EF30[v1];
  }
}

uint64_t sub_24AD8( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!(_DWORD)a3) {
    return 0LL;
  }
  sub_208B0(a1, 1LL, a3, a4, a5, a6, a7, a8);
  *(_DWORD *)(a1 + 72) |= a2;
  *(void *)(a1 + 596) = 0LL;
  *(_DWORD *)(a1 + 1036) = 1;
  *(_DWORD *)(a1 + 912) = 0;
  *(_DWORD *)(a1 + 992) = 0;
  vm_address_t v10 = *(void *)(a1 + 832);
  if (v10)
  {
    my_Deallocate(v10, *(_DWORD *)(a1 + 844) + 1);
    *(void *)(a1 + 832) = 0LL;
  }

  *(void *)(a1 + 840) = 0LL;
  vm_address_t v11 = *(void *)(a1 + 816);
  if (v11)
  {
    my_Deallocate(v11, *(_DWORD *)(a1 + 824));
    *(void *)(a1 + 816) = 0LL;
  }

  *(_DWORD *)(a1 + 824) = 0;
  if (*(void *)(a1 + 776))
  {
    CFAbsoluteTime Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveTimer(Current, *(CFRunLoopTimerRef *)(a1 + 776), kCFRunLoopCommonModes);
    my_CFRelease((const void **)(a1 + 776));
  }

  if (*(void *)(a1 + 952))
  {
    uint64_t v13 = CFRunLoopGetCurrent();
    CFRunLoopRemoveTimer(v13, *(CFRunLoopTimerRef *)(a1 + 952), kCFRunLoopCommonModes);
    my_CFRelease((const void **)(a1 + 952));
  }

  if (*(void *)(a1 + 984))
  {
    uint64_t v14 = CFRunLoopGetCurrent();
    CFRunLoopRemoveTimer(v14, *(CFRunLoopTimerRef *)(a1 + 984), kCFRunLoopCommonModes);
    my_CFRelease((const void **)(a1 + 984));
  }

  my_CFRelease((const void **)(a1 + 976));
  sub_20090(5LL, @"IPSec Controller: reconnecting", v15, v16, v17, v18, v19, v20, v27);
  my_CFRelease((const void **)(a1 + 472));
  my_CFRelease((const void **)(a1 + 480));
  uint64_t v21 = 1LL;
  sub_25C8C(a1, (_OWORD *)(a1 + 744), (_OWORD *)(a1 + 760), 1LL, v22, v23, v24, v25);
  return v21;
}

uint64_t ipsec_getstatus( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = *(_DWORD *)(a1 + 592) - 1;
  if (v8 > 7)
  {
    uint64_t v10 = 0LL;
    int v9 = "Disconnected";
  }

  else
  {
    int v9 = off_39470[v8];
    uint64_t v10 = dword_2EF4C[v8];
  }

  if (gSCNCVerbose) {
    sub_20090(5LL, @"IPSec Controller: ipsec_getstatus = %s", a3, a4, a5, a6, a7, a8, (uint64_t)v9);
  }
  return v10;
}

uint64_t ipsec_copyextendedstatus(uint64_t a1, void *a2)
{
  CFMutableDictionaryRef v46 = 0LL;
  *a2 = 0LL;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFMutableDictionaryRef v47 = Mutable;
  if (!Mutable
    || (uint64_t v5 = Mutable,
        CFMutableDictionaryRef v6 = CFDictionaryCreateMutable(0LL, 0LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks),
        (CFMutableDictionaryRef v46 = v6) == 0LL))
  {
    uint64_t v12 = 12LL;
    goto LABEL_36;
  }

  CFStringRef v7 = v6;
  AddNumber(v6, kSCPropNetIPSecStatus, *(_DWORD *)(a1 + 592));
  if (!*(_DWORD *)(a1 + 592)) {
    goto LABEL_10;
  }
  v8.in_addr_t s_addr = *(_DWORD *)(a1 + 748);
  int v9 = inet_ntoa(v8);
  if (v9) {
    AddString(v7, @"RemoteAddress", v9);
  }
  if (*(_DWORD *)(a1 + 592) != 6)
  {
LABEL_10:
    int v13 = *(_DWORD *)(a1 + 596);
    CFStringRef v14 = @"LastCause";
    uint64_t v15 = v7;
LABEL_11:
    AddNumber(v15, v14, v13);
    goto LABEL_12;
  }

  uint64_t v10 = *(void *)(a1 + 584);
  if (!v10)
  {
    int v13 = *(_DWORD *)(a1 + 184);
    uint64_t v15 = v7;
    CFStringRef v14 = kSCPropNetIPSecConnectTime;
    goto LABEL_11;
  }

  uint64_t connect_time = ne_sm_bridge_get_connect_time(v10);
  AddNumber64(v7, kSCPropNetIPSecConnectTime, connect_time);
LABEL_12:
  CFDictionaryAddValue(v5, kSCEntNetIPSec, v7);
  int v22 = *(_DWORD *)(a1 + 592);
  if (v22 == 6)
  {
    CFPropertyListRef v23 = copyEntity( (const __SCDynamicStore *)gDynamicStore,  kSCDynamicStoreDomainState,  *(const __CFString **)(a1 + 24),  kSCEntNetIPv4);
    if (v23)
    {
      uint64_t v24 = v23;
      CFDictionaryAddValue(v5, kSCEntNetIPv4, v23);
      CFRelease(v24);
    }

    uint64_t v25 = (const __CFDictionary *)copyEntity( (const __SCDynamicStore *)gDynamicStore,  kSCDynamicStoreDomainState,  *(const __CFString **)(a1 + 24),  kSCEntNetDNS);
    if (v25)
    {
      uint64_t v26 = v25;
      unint64_t Value = CFDictionaryGetValue(v25, kSCPropNetDNSServerAddresses);
      CFTypeID TypeID = CFArrayGetTypeID();
      if (Value && CFGetTypeID(Value) == TypeID) {
        CFDictionarySetValue(v5, @"DNSServers", Value);
      }
      uint64_t v29 = CFDictionaryGetValue(v26, kSCPropNetDNSDomainName);
      CFTypeID v30 = CFStringGetTypeID();
      if (v29 && CFGetTypeID(v29) == v30) {
        CFDictionarySetValue(v5, @"DNSDomain", v29);
      }
      uint64_t v31 = CFDictionaryGetValue(v26, kSCPropNetDNSSearchDomains);
      CFTypeID v32 = CFArrayGetTypeID();
      if (v31 && CFGetTypeID(v31) == v32) {
        CFDictionarySetValue(v5, @"DNSSearchDomains", v31);
      }
      uint64_t v33 = CFDictionaryGetValue(v26, kSCPropNetDNSSupplementalMatchDomains);
      CFTypeID v34 = CFArrayGetTypeID();
      if (v33 && CFGetTypeID(v33) == v34) {
        CFDictionarySetValue(v5, @"DNSSupplementalMatchDomains", v33);
      }
      CFRelease(v26);
    }

    int v22 = *(_DWORD *)(a1 + 592);
  }

  int v35 = v22 - 1;
  if ((v22 - 1) > 7)
  {
    int v37 = 0;
    uint64_t v36 = "Disconnected";
  }

  else
  {
    uint64_t v36 = off_39470[v35];
    int v37 = dword_2EF4C[v35];
  }

  if (gSCNCVerbose) {
    sub_20090(5LL, @"IPSec Controller: ipsec_getstatus = %s", v16, v17, v18, v19, v20, v21, (uint64_t)v36);
  }
  AddNumber(v5, @"Status", v37);
  sub_20090(7LL, @"IPSec Controller: Copy Extended Status %@", v38, v39, v40, v41, v42, v43, (uint64_t)v5);
  CFTypeRef v44 = CFRetain(v5);
  uint64_t v12 = 0LL;
  *a2 = v44;
LABEL_36:
  my_CFRelease((const void **)&v46);
  my_CFRelease((const void **)&v47);
  return v12;
}

uint64_t ipsec_getconnectdata(uint64_t a1, CFTypeRef *a2, int a3)
{
  CFMutableDictionaryRef v12 = 0LL;
  *a2 = 0LL;
  uint64_t v3 = *(const __CFDictionary **)(a1 + 128);
  if (v3)
  {
    if (!a3)
    {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, v3);
      CFMutableDictionaryRef v12 = MutableCopy;
      if (!MutableCopy) {
        return 0LL;
      }
      uint64_t v3 = MutableCopy;
      unint64_t Value = (const __CFDictionary *)CFDictionaryGetValue(MutableCopy, kSCEntNetIPSec);
      if (Value)
      {
        in_addr v8 = Value;
        CFTypeID v9 = CFGetTypeID(Value);
        if (v9 == CFDictionaryGetTypeID())
        {
          uint64_t v10 = CFDictionaryCreateMutableCopy(0LL, 0LL, v8);
          if (v10)
          {
            vm_address_t v11 = v10;
            CFDictionaryRemoveValue(v10, kSCPropNetIPSecSharedSecret);
            CFDictionarySetValue(v3, kSCEntNetIPSec, v11);
            CFRelease(v11);
          }
        }
      }
    }

    *a2 = CFRetain(v3);
    my_CFRelease((const void **)&v12);
  }

  return 0LL;
}

uint64_t ipsec_copystatistics(uint64_t a1, void *a2)
{
  uint64_t v10 = 0LL;
  *a2 = 0LL;
  if (*(_DWORD *)(a1 + 592) != 6) {
    return 22LL;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFMutableDictionaryRef v11 = Mutable;
  if (Mutable
    && (uint64_t v4 = Mutable,
        uint64_t v5 = CFDictionaryCreateMutable(0LL, 0LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks),
        (uint64_t v10 = v5) != 0LL))
  {
    CFMutableDictionaryRef v6 = v5;
    AddNumber(v5, @"BytesIn", 0);
    AddNumber(v6, @"BytesOut", 0);
    AddNumber(v6, @"PacketsIn", 0);
    AddNumber(v6, @"PacketsOut", 0);
    AddNumber(v6, @"ErrorsIn", 0);
    AddNumber(v6, @"ErrorsOut", 0);
    CFDictionaryAddValue(v4, kSCEntNetIPSec, v6);
    CFTypeRef v7 = CFRetain(v4);
    uint64_t v8 = 0LL;
    *a2 = v7;
  }

  else
  {
    uint64_t v8 = 12LL;
  }

  my_CFRelease((const void **)&v10);
  my_CFRelease((const void **)&v11);
  return v8;
}

uint64_t ipsec_device_unlock(uint64_t result)
{
  *(_BYTE *)(result + 1040) = 0;
  return result;
}

uint64_t ipsec_log_out(uint64_t result)
{
  if (*(_DWORD *)(result + 592))
  {
    if ((*(_BYTE *)(result + 74) & 2) != 0) {
      return scnc_stop(result, 0LL, 15LL, 3);
    }
  }

  return result;
}

uint64_t ipsec_log_switch(uint64_t result)
{
  if (*(_DWORD *)(result + 592))
  {
    if ((*(_BYTE *)(result + 74) & 0x10) != 0) {
      return scnc_stop(result, 0LL, 15LL, 4);
    }
  }

  return result;
}

BOOL ipsec_can_sleep(uint64_t a1)
{
  return *(_DWORD *)(a1 + 592) != 6 || (*(_BYTE *)(a1 + 74) & 8) == 0;
}

uint64_t ipsec_will_sleep(uint64_t a1, int a2)
{
  if (*(_DWORD *)(a1 + 592) && !a2 && (*(_DWORD *)(a1 + 72) & 0x40000) != 0) {
    scnc_stop(a1, 0LL, 15LL, 2);
  }
  return 0LL;
}

uint64_t ipsec_wake_up(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 592);
  if (v1 == 8 || v1 == 6) {
    return scnc_disconnectifoverslept((uint64_t)"ipsec_wake_up", result);
  }
  return result;
}

uint64_t sub_25364( const char *a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v11 = socket(2, 3, 1);
  if (v11 < 0) {
    return sub_20090(3LL, @"racoon_trigger_phase2 failed to create socket", v12, v13, v14, v15, v16, v17, a9);
  }
  int v18 = v11;
  unsigned int v36 = if_nametoindex(a1);
  if (!setsockopt(v18, 0, 25, &v36, 4u))
  {
    v40.int sa_family = 2;
    *(_WORD *)v40.sa_data = 0;
    *(_DWORD *)&v40.sa_data[2] = *a2;
    char v38 = 8;
    v39[0] = 0;
    *(_DWORD *)((char *)v39 + 3) = 0;
    size_t v35 = 4LL;
    if (sysctlbyname("net.key.blockacq_count", &v37, &v35, 0LL, 0LL))
    {
      int v37 = 10;
    }

    else if (v37 < 0)
    {
      return close(v18);
    }

    int v26 = -1;
    do
    {
      ssize_t v27 = sendto(v18, &v38, 8uLL, 0, &v40, 0x10u);
      sub_20090(3LL, @"racoon_trigger_phase2 sent ping, wrote %ld", v28, v29, v30, v31, v32, v33, v27);
      if (v27 <= 7) {
        break;
      }
      ++v26;
    }

    while (v26 < v37);
    return close(v18);
  }

  sub_20090(3LL, @"racoon_trigger_phase2 failed to set IP_BOUND_IF", v19, v20, v21, v22, v23, v24, v34);
  return close(v18);
}

void sub_25514(__CFArray *a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5, uint64_t a6)
{
  CFTypeID TypeID = CFArrayGetTypeID();
  if (a1)
  {
    if (CFGetTypeID(a1) == TypeID)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      CFMutableDictionaryRef v19 = Mutable;
      CFTypeID v14 = CFDictionaryGetTypeID();
      if (Mutable)
      {
        if (CFGetTypeID(Mutable) == v14)
        {
          CFStringRef v15 = CFStringCreateWithFormat( 0LL,  0LL,  @"%d.%d.%d.%d",  a2,  BYTE1(a2),  BYTE2(a2),  HIBYTE(a2),  v19);
          CFTypeRef cf = v15;
          if (v15)
          {
            CFDictionarySetValue(Mutable, kSCPropNetIPv4RouteDestinationAddress, v15);
            my_CFRelease(&cf);
          }

          if (a3)
          {
            CFStringRef v16 = CFStringCreateWithFormat( 0LL,  0LL,  @"%d.%d.%d.%d",  a3,  BYTE1(a3),  BYTE2(a3),  HIBYTE(a3));
            CFTypeRef cf = v16;
            if (v16)
            {
              CFDictionarySetValue(Mutable, kSCPropNetIPv4RouteSubnetMask, v16);
              my_CFRelease(&cf);
            }
          }

          if (a4)
          {
            CFStringRef v17 = CFStringCreateWithFormat( 0LL,  0LL,  @"%d.%d.%d.%d",  a4,  BYTE1(a4),  BYTE2(a4),  HIBYTE(a4));
            CFTypeRef cf = v17;
            if (v17)
            {
              CFDictionarySetValue(Mutable, kSCPropNetIPv4RouteGatewayAddress, v17);
              my_CFRelease(&cf);
            }
          }

          if (a5 && a6)
          {
            CFStringRef v18 = CFStringCreateWithFormat(0LL, 0LL, @"%s", a6);
            CFTypeRef cf = v18;
            if (v18)
            {
              CFDictionarySetValue(Mutable, kSCPropNetIPv4RouteInterfaceName, v18);
              CFRelease(cf);
            }
          }

          CFArrayAppendValue(a1, Mutable);
          my_CFRelease((const void **)&v19);
        }
      }
    }
  }

__CFArray *sub_25728(const __CFDictionary *a1, unsigned int a2)
{
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  unint64_t Value = (const __CFArray *)CFDictionaryGetValue(a1, @"Policies");
  CFTypeID TypeID = CFArrayGetTypeID();
  if (Value)
  {
    if (CFGetTypeID(Value) == TypeID)
    {
      CFIndex Count = CFArrayGetCount(Value);
      if (Count >= 1)
      {
        CFIndex v8 = Count;
        for (CFIndex i = 0LL; i != v8; ++i)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, i);
          if (isDictionary(ValueAtIndex))
          {
            int v11 = CFDictionaryGetValue(ValueAtIndex, @"Mode");
            CFTypeID v12 = CFStringGetTypeID();
            if (v11)
            {
              if (CFGetTypeID(v11) == v12)
              {
                if (CFEqual(v11, @"Tunnel"))
                {
                  uint64_t v13 = CFDictionaryGetValue(ValueAtIndex, @"Direction");
                  CFTypeID v14 = CFStringGetTypeID();
                  if (v13)
                  {
                    if (CFGetTypeID(v13) == v14 && (CFEqual(v13, @"Out") || CFEqual(v13, @"InOut")))
                    {
                      CFStringRef v15 = CFDictionaryGetValue(ValueAtIndex, @"Level");
                      CFTypeID v16 = CFStringGetTypeID();
                      if (v15)
                      {
                        if (CFGetTypeID(v15) == v16
                          && !CFEqual(v15, @"None")
                          && (CFEqual(v15, @"Require")
                           || CFEqual(v15, @"Discard")
                           || CFEqual(v15, @"Unique")))
                        {
                          if (GetStrNetFromDict(ValueAtIndex, @"RemoteAddress", v21, 32))
                          {
                            int v22 = 528;
                            if (inet_aton(v21, &v23))
                            {
                              GetIntFromDict(ValueAtIndex, @"RemotePrefix", &v20, 24);
                              int v17 = v20;
                              if (v20)
                              {
                                unsigned int v18 = 0;
                                do
                                {
                                  unsigned int v18 = (v18 >> 1) | 0x80000000;
                                  --v17;
                                }

                                while (v17);
                                int v20 = 0;
                              }

                              else
                              {
                                unsigned int v18 = 0;
                              }

                              sub_25514(Mutable, v23.s_addr, bswap32(v18), a2, 0, 0LL);
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
    }
  }

  return Mutable;
}

void sub_259F8(uint64_t a1, _DWORD *a2, int a3)
{
  CFMutableDataRef Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
  CFMutableDataRef v32 = Mutable;
  CFMutableDataRef v7 = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
  CFMutableDataRef v31 = v7;
  CFMutableDataRef v8 = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
  CFMutableDataRef v30 = v8;
  CFMutableDataRef v9 = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
  CFMutableDataRef v29 = v9;
  if (Mutable) {
    BOOL v10 = v7 == 0LL;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && v8 != 0LL && v9 != 0LL)
  {
    uint64_t v13 = v9;
    uint64_t v28 = a1;
    for (CFIndex i = *(uint64_t **)(a1 + 1048); i; CFIndex i = (uint64_t *)*i)
    {
      int v15 = *((_DWORD *)i + 6);
      if (v15 == *a2) {
        CFTypeID v16 = Mutable;
      }
      else {
        CFTypeID v16 = v8;
      }
      if (v15 == *a2) {
        int v17 = v7;
      }
      else {
        int v17 = v13;
      }
      CFDataAppendBytes(v16, (const UInt8 *)i + 16, 4LL);
      CFDataAppendBytes(v17, (const UInt8 *)i + 20, 4LL);
    }

    CFMutableDictionaryRef v18 = CFDictionaryCreateMutable( kCFAllocatorDefault,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    int v19 = a3;
    uint64_t v20 = a1;
    if (v18)
    {
      uint64_t v21 = v18;
      CFMutableDictionaryRef v22 = CFDictionaryCreateMutable( kCFAllocatorDefault,  2LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      if (v22)
      {
        in_addr v23 = v22;
        if (CFDataGetLength(Mutable))
        {
          uint64_t v24 = CFDictionaryCreateMutable( kCFAllocatorDefault,  2LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          if (v24)
          {
            uint64_t v25 = v24;
            CFDictionaryAddValue(v24, @"Addresses", Mutable);
            CFDictionaryAddValue(v25, @"Masks", v7);
            CFDictionaryAddValue(v23, @"IncludedRoutes", v25);
            CFRelease(v25);
          }
        }

        if (CFDataGetLength(v8))
        {
          int v26 = CFDictionaryCreateMutable( kCFAllocatorDefault,  2LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          if (v26)
          {
            ssize_t v27 = v26;
            CFDictionaryAddValue(v26, @"Addresses", v8);
            CFDictionaryAddValue(v27, @"Masks", v13);
            CFDictionaryAddValue(v23, @"ExcludedRoutes", v27);
            CFRelease(v27);
          }
        }

        CFDictionaryAddValue(v21, @"IPv4", v23);
        CFRelease(v23);
        uint64_t v20 = v28;
      }

      scnc_cache_routing_table(v20, v21, 0, v19 != 0);
      CFRelease(v21);
    }
  }

  my_CFRelease((const void **)&v32);
  my_CFRelease((const void **)&v31);
  my_CFRelease((const void **)&v30);
  my_CFRelease((const void **)&v29);
}

uint64_t sub_25C8C( uint64_t a1, _OWORD *a2, _OWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a4;
  context.version = 0LL;
  memset(&context.retain, 0, 24);
  context.mach_timebase_info info = (void *)a1;
  sub_20090(5LL, @"IPSec Controller: racoon_restart_cisco_ipsec...", (uint64_t)a3, a4, a5, a6, a7, a8, v150);
  if (a3 && *(_DWORD *)a3)
  {
    *(_OWORD *)(a1 + 760) = *a3;
    sub_20090( 5LL,  @"IPSec Controller: NAT64 prefix with length %d",  v12,  v13,  v14,  v15,  v16,  v17,  *(unsigned int *)(a1 + 760));
  }

  else
  {
    *(void *)SCNetworkReachabilityFlags flags = 0LL;
    CFMutableDictionaryRef v18 = (unsigned int *)(a1 + 760);
    if ((int)nw_nat64_copy_prefixes(0LL, flags) >= 1 && (int v19 = *(_OWORD **)flags) != 0LL)
    {
      *(_OWORD *)CFMutableDictionaryRef v18 = **(_OWORD **)flags;
      free(v19);
      sub_20090(5LL, @"IPSec Controller: Found NAT64 prefix with length %d", v20, v21, v22, v23, v24, v25, *v18);
    }

    else
    {
      *(void *)CFMutableDictionaryRef v18 = 0LL;
      *(void *)(a1 + 768) = 0LL;
    }
  }

  if (*(_DWORD *)(a1 + 868))
  {
    if (IPSecRemovePolicies(*(const __CFDictionary **)(a1 + 608), -1LL, &v160)) {
      sub_20090( 3LL,  @"IPSec Controller: Cannot remove policies, error '%s'",  v26,  v27,  v28,  v29,  v30,  v31,  (uint64_t)v160);
    }
    IPSecRemoveSecurityAssociations((unsigned __int8 *)(a1 + 616), (unsigned __int8 *)(a1 + 744));
    *(_DWORD *)(a1 + 868) = 0;
  }

  uint64_t v32 = *(void *)(a1 + 584);
  if (v32) {
    ne_sm_bridge_request_uninstall(v32);
  }
  sub_22420(a1, 1);
  if (*(_DWORD *)(a1 + 864))
  {
    if (IPSecRemoveConfigurationFile(*(const void **)(a1 + 608), &v160)) {
      sub_20090( 3LL,  @"IPSec Controller: Cannot remove configuration, error '%s'",  v33,  v34,  v35,  v36,  v37,  v38,  (uint64_t)v160);
    }
    *(_DWORD *)(a1 + 864) = 0;
    int v39 = 1;
  }

  else
  {
    int v39 = 0;
  }

  *(_DWORD *)(a1 + 912) = 0;
  *(_OWORD *)(a1 + 7memset(v5, 0, 44) = *a2;
  sockaddr v40 = *(const __CFDictionary **)(a1 + 128);
  if (v40) {
    BOOL v41 = GetStrFromDict(v40, @"OutgoingInterface", (char *)(a1 + 918), 16, "") != 0;
  }
  else {
    BOOL v41 = 0;
  }
  uint64_t v42 = (__int128 *)(a1 + 760);
  uint64_t v43 = (unsigned __int8 *)(a1 + 744);
  if (*(_DWORD *)(a1 + 760))
  {
    int v157 = 7708;
    uint64_t v43 = (unsigned __int8 *)&v157;
    nw_nat64_synthesize_v6(a1 + 760, a1 + 748, &v158);
  }

  if (v41) {
    CFTypeRef v44 = (const char *)(a1 + 918);
  }
  else {
    CFTypeRef v44 = 0LL;
  }
  if (!get_src_address((_BYTE *)(a1 + 616), v43, v44, 0LL))
  {
    if (!v41) {
      copyGateway((const __SCDynamicStore *)gDynamicStore, 2, (char *)(a1 + 918), 16, (void *)(a1 + 936), 16);
    }
    if (*(_BYTE *)(a1 + 918))
    {
      *(_BYTE *)(a1 + 934) = interface_is_cellular(a1 + 918);
      sub_20090( 5LL,  @"IPSec Controller: lower interface (%s) is%s cellular",  v59,  v60,  v61,  v62,  v63,  v64,  a1 + 918);
    }

    else
    {
      uint64_t v65 = SCNetworkReachabilityCreateWithAddress(0LL, (const sockaddr *)(a1 + 744));
      int v66 = SCNetworkReachabilityGetFlags(v65, flags);
      SCNetworkReachabilityFlags v67 = (flags[0] >> 18) & 1;
      if (!v66) {
        LOBYTE(v67) = 0;
      }
      *(_BYTE *)(a1 + 934) = v67;
      CFRelease(v65);
    }

    if (*(void *)(a1 + 584))
    {
      if ((*(_BYTE *)(a1 + 74) & 0x20) != 0)
      {
        if (*(_BYTE *)(a1 + 934))
        {
          LOBYTE(flags[0]) = 0;
          int is_cellular = primary_interface_is_cellular((char *)flags);
          if (LOBYTE(flags[0]))
          {
            if (!is_cellular)
            {
              int v51 = @"IPSec Controller: Skipping tunnel creation over cellular in favor of better interface";
              uint64_t v52 = 5LL;
              goto LABEL_30;
            }
          }
        }
      }
    }

    *(_DWORD *)(a1 + 968) = 0;
    if ((*(_DWORD *)(a1 + 72) & 0x400) != 0) {
      int v69 = 5;
    }
    else {
      int v69 = 20;
    }
    sub_20090(5LL, @"getting interface (media %x) timeout for ipsec: %d secs", v45, v46, v47, v48, v49, v50, 0LL);
    *(_DWORD *)(a1 + 972) = v69;
    int v70 = (CFMutableDictionaryRef *)(a1 + 608);
    if (!v8 && *(void *)(a1 + 608))
    {
      getnameinfo((const sockaddr *)(a1 + 616), *(unsigned __int8 *)(a1 + 616), (char *)flags, 0x39u, 0LL, 0, 10);
      CFStringRef v71 = CFStringCreateWithCString(0LL, (const char *)flags, 0x600u);
      if (v71)
      {
        CFStringRef v72 = v71;
        CFDictionarySetValue(*v70, @"LocalAddress", v71);
        CFRelease(v72);
      }

      uint64_t v73 = addr2ascii(2, (const void *)(a1 + 748), 4, 0LL);
      CFStringRef v74 = CFStringCreateWithCString(0LL, v73, 0x600u);
      if (v74)
      {
        CFStringRef v81 = v74;
        CFDictionarySetValue(*v70, @"RemoteAddress", v74);
        CFRelease(v81);
      }

      if (v41) {
        CFDictionarySetValue(*v70, @"ForceLocalAddress", kCFBooleanTrue);
      }
      goto LABEL_100;
    }

    int v82 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), @"AuthenticationMethod");
    if (isString(v82))
    {
      uint64_t v155 = @"SharedSecret";
      if (!CFEqual(v82, @"SharedSecret"))
      {
        if (CFEqual(v82, @"Certificate")) {
          *(_DWORD *)(a1 + 72) |= 0x800u;
        }
        uint64_t v155 = v82;
      }
    }

    else
    {
      uint64_t v155 = @"SharedSecret";
    }

    int v83 = v39;
    uint64_t v84 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), @"IdentifierVerification");
    in_addr v85 = v84;
    if (v84) {
      isString(v84);
    }
    int v86 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), @"RemoteAddress");
    if (*(void *)(a1 + 608)) {
      my_CFRelease((const void **)(a1 + 608));
    }
    CFStringRef value = v86;
    int StrFromDict = GetStrFromDict(*(const __CFDictionary **)(a1 + 136), @"LocalIdentifier", (char *)flags, 256, "");
    in_addr v88 = v155;
    CiscoDefaultConfiguration = IPSecCreateCiscoDefaultConfiguration( (const sockaddr *)(a1 + 616),  a1 + 744,  v86,  v155,  StrFromDict,  1,  0,  v85,  v8);
    *(void *)(a1 + 608) = CiscoDefaultConfiguration;
    if (!CiscoDefaultConfiguration)
    {
      int v51 = @"IPSec Controller: cannot create IPSec dictionary...";
      int v39 = v83;
      goto LABEL_29;
    }

    CFDictionaryApplyFunction( *(CFDictionaryRef *)(a1 + 136),  (CFDictionaryApplierFunction)sub_2675C,  CiscoDefaultConfiguration);
    int v39 = v83;
    if (v41) {
      CFDictionarySetValue(*v70, @"ForceLocalAddress", kCFBooleanTrue);
    }
    uint64_t v42 = (__int128 *)(a1 + 760);
    if ((*(_BYTE *)(a1 + 73) & 4) != 0)
    {
      int valuePtr = 1;
      CFNumberRef v90 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
      if (v90)
      {
        CFNumberRef v91 = v90;
        CFDictionarySetValue(*v70, @"DisconnectOnIdle", v90);
        CFRelease(v91);
      }

      int valuePtr = 120;
      CFNumberRef v92 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
      if (v92)
      {
        CFNumberRef v93 = v92;
        CFDictionarySetValue(*v70, @"DisconnectOnIdleTimer", v92);
        CFRelease(v93);
      }
    }

    __int128 v94 = *(const __CFDictionary **)(a1 + 128);
    if (v94)
    {
      int v95 = (const __CFDictionary *)CFDictionaryGetValue(v94, kSCEntNetIPSec);
      int v96 = v95;
      if (v95)
      {
        __int128 v97 = CFDictionaryGetValue(v95, @"XAuthName");
        in_addr v98 = CFDictionaryGetValue(v96, @"XAuthPassword");
      }
    }

    else
    {
      int v96 = 0LL;
    }

    __int128 v99 = (const __CFString *)CFDictionaryGetValue(*v70, @"LocalIdentifier");
    if (isString(v99))
    {
      if (CFStringHasSuffix(v99, @"[hybrid]"))
      {
        CFIndex Length = CFStringGetLength(v99);
        v162.length = Length - CFStringGetLength(@"[hybrid]");
        in_addr v88 = v155;
        v162.CFIndex location = 0LL;
        CFStringRef v101 = CFStringCreateWithSubstring(0LL, v99, v162);
        if (v101)
        {
          CFStringRef v102 = v101;
          CFDictionarySetValue(*v70, @"LocalIdentifier", v101);
          CFDictionarySetValue(*v70, @"AuthenticationMethod", @"Hybrid");
          CFRelease(v102);
          CFDictionarySetValue(*v70, @"RemoteIdentifier", value);
          CFDictionarySetValue(*v70, @"IdentifierVerification", @"UseRemoteIdentifier");
        }
      }
    }

    if (!CFEqual(v88, @"SharedSecret"))
    {
LABEL_100:
      sub_20090( 7LL,  @"IPSec Controller: Complete IPsec dictionary %@",  v75,  v76,  v77,  v78,  v79,  v80,  (uint64_t)*v70);
      int v110 = CFDictionaryContainsKey(*v70, @"XAuthName");
      CFMutableDictionaryRef v111 = *v70;
      if (v110)
      {
        if (IPSecApplyConfiguration(v111, &v160))
        {
LABEL_102:
          sub_20090( 3LL,  @"IPSec Controller: Cannot apply configuration, error '%s'",  v112,  v113,  v114,  v115,  v116,  v117,  (uint64_t)v160);
LABEL_103:
          int v118 = 7;
LABEL_104:
          *(_DWORD *)(a1 + 596) = v118;
          goto LABEL_105;
        }
      }

      else
      {
        CFDictionarySetValue(v111, @"XAuthName", @" ");
        int v120 = IPSecApplyConfiguration(*v70, &v160);
        CFDictionaryRemoveValue(*v70, @"XAuthName");
        if (v120) {
          goto LABEL_102;
        }
      }

      *(_DWORD *)(a1 + 864) = 1;
      if (IPSecCountPolicies(*(const __CFDictionary **)(a1 + 608)))
      {
        if (IPSecInstallPolicies(*v70, -1LL, &v160))
        {
          sub_20090( 3LL,  @"IPSec Controller: Cannot install policies, error '%s'",  v121,  v122,  v123,  v124,  v125,  v126,  (uint64_t)v160);
          int v39 = 0;
          goto LABEL_103;
        }

        *(_DWORD *)(a1 + 868) = 1;
      }

      int v127 = *(_DWORD *)(a1 + 784);
      if (v127 == -1)
      {
        if ((sub_267B8(a1) & 0x80000000) != 0)
        {
          sub_20090( 3LL,  @"IPSec Controller: cannot create racoon control socket",  v133,  v128,  v129,  v130,  v131,  v132,  v153);
          int v39 = 0;
          int v118 = 8;
          goto LABEL_104;
        }
      }

      else
      {
        racoon_send_cmd_unbind(v127, -1, v121, v122, v123, v124, v125, v126);
      }

      racoon_send_cmd_bind( *(_DWORD *)(a1 + 784),  *(_DWORD *)(a1 + 748),  (char *)gIPSecAppVersion,  v128,  v129,  v130,  v131,  v132);
      if (*(_DWORD *)(a1 + 760)) {
        racoon_send_cmd_set_nat64_prefix(*(_DWORD *)(a1 + 784), v42, v134, v135, v136, v137, v138, v139);
      }
      racoon_send_cmd_connect(*(_DWORD *)(a1 + 784), *(_DWORD *)(a1 + 748), v134, v135, v136, v137, v138, v139);
      uint64_t v140 = *(__CFRunLoopTimer **)(a1 + 776);
      double v141 = CFAbsoluteTimeGetCurrent() + 10.0;
      if (v140)
      {
        CFRunLoopTimerSetNextFireDate(v140, v141);
      }

      else
      {
        CFRunLoopTimerRef v142 = CFRunLoopTimerCreate(0LL, v141, 3.1536e10, 0LL, 0LL, (CFRunLoopTimerCallBack)sub_23E9C, &context);
        *(void *)(a1 + 776) = v142;
        if (!v142)
        {
          sub_20090( 3LL,  @"IPSec Controller: cannot create RunLoop timer",  v143,  v144,  v145,  v146,  v147,  v148,  v153);
          int v39 = 0;
          goto LABEL_105;
        }

        CFAbsoluteTime Current = CFRunLoopGetCurrent();
        CFRunLoopAddTimer(Current, *(CFRunLoopTimerRef *)(a1 + 776), kCFRunLoopCommonModes);
      }

      return 0LL;
    }

    unsigned int v103 = CFDictionaryGetValue(*v70, @"SharedSecret");
    unsigned int v104 = CFDictionaryGetValue(*v70, @"SharedSecretEncryption");
    int v105 = (const void *)ne_sm_bridge_copy_password_from_keychain(*(void *)(a1 + 584));
    if (!v105)
    {
LABEL_130:
      if (v96 && *(void *)(a1 + 128))
      {
        uint64_t v106 = CFDictionaryGetValue(v96, @"SharedSecret");
        if (isString(v106))
        {
          CFDictionarySetValue(*v70, @"SharedSecret", v106);
          CFDictionaryRemoveValue(*v70, @"SharedSecretEncryption");
          goto LABEL_100;
        }

LABEL_125:
        *(_DWORD *)(a1 + 596) = 3;
        int v51 = @"IPSec Controller: incorrect shared secret found.";
        goto LABEL_29;
      }

      v107 = CFDictionaryGetValue(*v70, @"SharedSecretEncryption");
      uint64_t v151 = *(void *)(a1 + 24);
      CFStringRef v108 = CFStringCreateWithFormat(0LL, 0LL, @"%@.SS");
      if (!v108) {
        goto LABEL_125;
      }
      CFStringRef v109 = v108;
      CFDictionarySetValue(*v70, @"SharedSecret", v108);
      int v105 = v109;
    }

    CFRelease(v105);
    goto LABEL_100;
  }

  *(_DWORD *)(a1 + 596) = 6;
  int v51 = @"IPSec Controller: cannot get our local address...";
LABEL_29:
  uint64_t v52 = 3LL;
LABEL_30:
  sub_20090(v52, v51, v45, v46, v47, v48, v49, v50, v151);
LABEL_105:
  if (!*(_DWORD *)(a1 + 596)) {
    *(_DWORD *)(a1 + 596) = 1;
  }
  sub_20090(3LL, @"IPSec Controller: restart failed", v53, v54, v55, v56, v57, v58, v152);
  if (v39) {
    IPSecKickConfiguration();
  }
  ipsec_stop(a1);
  return *(unsigned int *)(a1 + 596);
}

void sub_2675C(const __CFString *a1, const void *a2, __CFDictionary *a3)
{
  if (CFStringCompare(a1, @"RemoteAddress", 0LL)) {
    CFDictionarySetValue(a3, a1, a2);
  }
}

uint64_t sub_267B8(uint64_t a1)
{
  context.version = 0LL;
  memset(&context.retain, 0, 24);
  context.mach_timebase_info info = (void *)a1;
  int v2 = socket(1, 1, 0);
  *(_DWORD *)(a1 + 784) = v2;
  if (v2 < 0)
  {
    uint64_t v30 = *__error();
    sub_20090( 3LL,  @"IPSec Controller: cannot create racoon control socket (errno = %d) ",  v16,  v17,  v18,  v19,  v20,  v21,  v30);
  }

  else
  {
    __int128 v37 = xmmword_2EEE4;
    __int128 v38 = unk_2EEF4;
    __int128 v39 = xmmword_2EF04;
    __int128 v40 = unk_2EF14;
    strcpy(&v33[2], "/var/run/vpncontrol.sock");
    char v34 = unk_2EEDD;
    __int16 v35 = unk_2EEDE;
    int v36 = unk_2EEE0;
    *(_WORD *)uint64_t v33 = 256;
    uint64_t v41 = 0LL;
    if (connect(v2, (const sockaddr *)v33, 0x6Au) < 0)
    {
      uint64_t v31 = *__error();
      sub_20090( 3LL,  @"IPSec Controller: cannot connect racoon control socket (errno = %d)",  v22,  v23,  v24,  v25,  v26,  v27,  v31);
    }

    else
    {
      int v3 = fcntl(*(_DWORD *)(a1 + 784), 3);
      if (v3 == -1 || fcntl(*(_DWORD *)(a1 + 784), 4, v3 | 4u) == -1)
      {
        uint64_t v4 = __error();
        sub_20090( 3LL,  @"IPSec Controller: Couldn't set client socket in non-blocking mode, errno = %d",  v5,  v6,  v7,  v8,  v9,  v10,  *v4);
      }

      int v11 = CFSocketCreateWithNative(0LL, *(_DWORD *)(a1 + 784), 1uLL, (CFSocketCallBack)sub_2698C, &context);
      *(void *)(a1 + 792) = v11;
      if (v11)
      {
        CFRunLoopSourceRef RunLoopSource = CFSocketCreateRunLoopSource(0LL, v11, 0LL);
        if (RunLoopSource)
        {
          uint64_t v13 = RunLoopSource;
          CFAbsoluteTime Current = CFRunLoopGetCurrent();
          CFRunLoopAddSource(Current, v13, kCFRunLoopDefaultMode);
          CFRelease(v13);
          return 0LL;
        }
      }
    }
  }

  uint64_t v28 = *(__CFSocket **)(a1 + 792);
  if (v28)
  {
    CFSocketInvalidate(v28);
    CFRelease(*(CFTypeRef *)(a1 + 792));
  }

  else
  {
    int v29 = *(_DWORD *)(a1 + 784);
    if ((v29 & 0x80000000) == 0) {
      close(v29);
    }
  }

  *(void *)(a1 + 792) = 0LL;
  uint64_t result = 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 784) = -1;
  return result;
}

_OWORD *sub_2698C(__CFSocket *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  CFSocketNativeHandle Native = CFSocketGetNative(a1);
  int v7 = Native;
  uint64_t v8 = *(unsigned int *)(a5 + 840);
  if (v8 <= 0xF)
  {
    uint64_t result = (_OWORD *)readn(Native, (char *)(a5 + 848 + v8), 16 - (int)v8);
    if ((_DWORD)result == -1)
    {
      int v17 = 2;
    }

    else
    {
      LODWORD(v8) = *(_DWORD *)(a5 + 840) + (_DWORD)result;
      *(_DWORD *)(a5 + 840) = v8;
      if ((_DWORD)v8 != 16)
      {
        int v17 = 0;
        goto LABEL_11;
      }

      unsigned int v16 = bswap32(*(unsigned __int16 *)(a5 + 862)) >> 16;
      *(_DWORD *)(a5 + 8memset(v5, 0, 44) = v16 + 16;
      uint64_t result = (_OWORD *)my_Allocate(v16 + 17);
      *(void *)(a5 + 832) = result;
      if (result)
      {
        int v17 = 0;
        _OWORD *result = *(_OWORD *)(a5 + 848);
        *(_BYTE *)(*(void *)(a5 + 832) + *(unsigned int *)(a5 + 844)) = 0;
      }

      else
      {
        int v17 = 3;
      }
    }

    LODWORD(v8) = *(_DWORD *)(a5 + 840);
LABEL_11:
    goto LABEL_12;
  }

  int v17 = 0;
LABEL_12:
  uint64_t result = (_OWORD *)readn(v7, (char *)(*(void *)(a5 + 832) + v8), *(_DWORD *)(a5 + 844) - (int)v8);
  if ((_DWORD)result == -1) {
    goto LABEL_15;
  }
  int v18 = *(_DWORD *)(a5 + 840) + (_DWORD)result;
  *(_DWORD *)(a5 + 840) = v18;
  if (v18 != *(_DWORD *)(a5 + 844))
  {
LABEL_14:
LABEL_15:
    sub_20090( 5LL,  @"IPSec Controller: connection closed by client, call ipsec_stop",  v10,  v11,  v12,  v13,  v14,  v15,  v359);
    *(_DWORD *)(a5 + 596) = 1;
    return (_OWORD *)ipsec_stop(a5);
  }

  if (!gSCNCVerbose) {
    goto LABEL_25;
  }
  sub_20090( 5LL,  @"IPSec Controller: ====================================================",  v10,  v11,  v12,  v13,  v14,  v15,  v359);
  sub_20090(5LL, @"IPSec Controller: Process Message:", v19, v20, v21, v22, v23, v24, v360);
  unsigned int v25 = bswap32(*(unsigned __int16 *)(a5 + 848));
  uint64_t v26 = HIWORD(v25);
  ipsec_msgtype_to_str(HIWORD(v25));
  sub_20090(5LL, @"IPSec Controller:\tmsg_type = 0x%x (%s)", v27, v28, v29, v30, v31, v32, v26);
  sub_20090( 5LL,  @"IPSec Controller:\tSCNetworkReachabilityFlags flags = 0x%x %s",  v33,  v34,  v35,  v36,  v37,  v38,  __rev16(*(unsigned __int16 *)(a5 + 850)));
  sub_20090( 5LL,  @"IPSec Controller:\tcookie = 0x%x",  v39,  v40,  v41,  v42,  v43,  v44,  bswap32(*(_DWORD *)(a5 + 852)));
  sub_20090( 5LL,  @"IPSec Controller:\treserved = 0x%x",  v45,  v46,  v47,  v48,  v49,  v50,  bswap32(*(_DWORD *)(a5 + 856)));
  sub_20090( 5LL,  @"IPSec Controller:\tuint64_t result = 0x%x",  v51,  v52,  v53,  v54,  v55,  v56,  bswap32(*(unsigned __int16 *)(a5 + 860)) >> 16);
  sub_20090( 5LL,  @"IPSec Controller:\tlen = %d",  v57,  v58,  v59,  v60,  v61,  v62,  bswap32(*(unsigned __int16 *)(a5 + 862)) >> 16);
  signed int v69 = bswap32(*(unsigned __int16 *)(a5 + 848)) >> 16;
  if (v69 <= 0x8000)
  {
    uint64_t v70 = *(void *)(a5 + 832);
    sub_20090(5LL, @"IPSec Controller:\t----------------------------", v63, v64, v65, v66, v67, v68, v361);
    v71.in_addr_t s_addr = *(_DWORD *)(v70 + 16);
    v362 = inet_ntoa(v71);
    CFStringRef v72 = @"IPSec Controller:\taddress = %s";
    goto LABEL_22;
  }

  if (v69 <= 33024)
  {
    if (v69 != 32769)
    {
      if (v69 == 32787)
      {
        uint64_t v94 = *(void *)(a5 + 832);
        v95.in_addr_t s_addr = *(_DWORD *)(v94 + 16);
        int v96 = inet_ntoa(v95);
        sub_20090(5LL, @"IPSec Controller:\tvm_address_t address = %s", v97, v98, v99, v100, v101, v102, (uint64_t)v96);
        if ((*(_WORD *)(v94 + 2) & 0x100) != 0)
        {
          uint64_t v103 = *(void *)(a5 + 832);
          unsigned int v104 = bswap32(*(unsigned __int16 *)(a5 + 862)) >> 16;
          v105.in_addr_t s_addr = *(_DWORD *)(v103 + 20);
          uint64_t v106 = inet_ntoa(v105);
          sub_20090( 5LL,  @"IPSec Controller:\touter_local_addr = %s",  v107,  v108,  v109,  v110,  v111,  v112,  (uint64_t)v106);
          sub_20090( 5LL,  @"IPSec Controller:\touter_remote_CFMachPortRef port = %d",  v113,  v114,  v115,  v116,  v117,  v118,  bswap32(*(unsigned __int16 *)(v103 + 24)) >> 16);
          sub_20090( 5LL,  @"IPSec Controller:\touter_local_CFMachPortRef port = %d",  v119,  v120,  v121,  v122,  v123,  v124,  bswap32(*(unsigned __int16 *)(v103 + 26)) >> 16);
          sub_20090(5LL, @"IPSec Controller:\tifname = %s", v125, v126, v127, v128, v129, v130, v103 + 28);
          if (v104 >= 0x1D)
          {
            int v131 = v104 - 28;
            uint64_t v132 = (unsigned __int16 *)(v103 + 44);
            do
            {
              unsigned int v133 = v132[1];
              unsigned int v134 = bswap32(*v132);
              ipsec_modecfgtype_to_str(HIWORD(v134) & 0x7FFF);
              sub_20090( 5LL,  @"IPSec Controller:\tModeConfig Attribute Type = %d (%s)",  v135,  v136,  v137,  v138,  v139,  v140,  HIWORD(v134) & 0x7FFF);
              unsigned int v147 = bswap32(v133);
              unsigned int v148 = HIWORD(v147);
              if ((v134 & 0x80000000) != 0)
              {
                sub_20090( 5LL,  @"IPSec Controller:\tModeConfig Attribute unint64_t Value = %d",  v141,  v142,  v143,  v144,  v145,  v146,  HIWORD(v147));
              }

              else
              {
                sub_20090( 5LL,  @"IPSec Controller:\tModeConfig Attribute CFIndex Length = %d Value = ...",  v141,  v142,  v143,  v144,  v145,  v146,  HIWORD(v147));
                v131 -= v148;
                uint64_t v132 = (unsigned __int16 *)((char *)v132 + v148);
              }

              v132 += 2;
              BOOL v149 = __OFSUB__(v131, 4);
              v131 -= 4;
            }

            while (!((v131 < 0) ^ v149 | (v131 == 0)));
          }
        }
      }

      goto LABEL_24;
    }

    uint64_t v211 = *(void *)(a5 + 832);
    sub_20090(5LL, @"IPSec Controller:\t----------------------------", v63, v64, v65, v66, v67, v68, v361);
    v212.in_addr_t s_addr = *(_DWORD *)(v211 + 16);
    v213 = inet_ntoa(v212);
    sub_20090(5LL, @"IPSec Controller:\tvm_address_t address = %s", v214, v215, v216, v217, v218, v219, (uint64_t)v213);
    unsigned int v220 = bswap32(*(unsigned __int16 *)(v211 + 20));
    uint64_t v367 = HIWORD(v220);
    v369 = ipsec_error_to_str(HIWORD(v220));
    sub_20090(5LL, @"IPSec Controller:\tike_code = %d 0x%x (%s)", v221, v222, v223, v224, v225, v226, v367);
    sub_20090( 5LL,  @"IPSec Controller:\tfrom = %d",  v227,  v228,  v229,  v230,  v231,  v232,  bswap32(*(unsigned __int16 *)(v211 + 22)) >> 16);
    if (*(_WORD *)(v211 + 20) != 13726) {
      goto LABEL_24;
    }
    v233.in_addr_t s_addr = *(_DWORD *)(v211 + 24);
    v362 = inet_ntoa(v233);
    CFStringRef v72 = @"IPSec Controller:\tredirect address = %s";
LABEL_22:
    uint64_t v73 = 5LL;
    goto LABEL_23;
  }

  if (v69 != 33025)
  {
    if (v69 != 33027) {
      goto LABEL_24;
    }
    uint64_t v186 = *(void *)(a5 + 832);
    sub_20090(5LL, @"IPSec Controller:\t----------------------------", v63, v64, v65, v66, v67, v68, v361);
    v187.in_addr_t s_addr = *(_DWORD *)(v186 + 16);
    v188 = inet_ntoa(v187);
    sub_20090( 5LL,  @"IPSec Controller:\tresponse from vm_address_t address = %s",  v189,  v190,  v191,  v192,  v193,  v194,  (uint64_t)v188);
    v362 = (char *)(bswap32(*(unsigned __int16 *)(v186 + 20)) >> 16);
    CFStringRef v72 = @"IPSec Controller:\tike_code = %d";
    goto LABEL_22;
  }

  uint64_t v234 = *(void *)(a5 + 832);
  sub_20090(5LL, @"IPSec Controller:\t----------------------------", v63, v64, v65, v66, v67, v68, v361);
  v235.in_addr_t s_addr = *(_DWORD *)(v234 + 16);
  v236 = inet_ntoa(v235);
  sub_20090(5LL, @"IPSec Controller:\tvm_address_t address = %s", v237, v238, v239, v240, v241, v242, (uint64_t)v236);
  LODWORD(v243) = bswap32(*(unsigned __int16 *)(a5 + 862)) >> 16;
  v244 = (unsigned __int16 *)(*(void *)(a5 + 832) + 20LL);
  while (1)
  {
    unint64_t v243 = (v243 - 4);
    if (v243 <= 3)
    {
      v362 = (char *)&dword_4;
      CFStringRef v72 = @"IPSec Controller: invalid length of isakmp data, expected %zu actual %d";
      goto LABEL_178;
    }

    unsigned int v245 = *v244;
    unsigned int v246 = bswap32(v245);
    uint64_t v247 = HIWORD(v246) & 0x7FFF;
    size_t v248 = __rev16(v244[1]);
    if ((v246 & 0x80000000) == 0) {
      break;
    }
    ipsec_xauthtype_to_str(HIWORD(v246) & 0x7FFF);
    sub_20090(5LL, @"IPSec Controller:\tXAuth Attribute Type = %d (%s)", v269, v270, v271, v272, v273, v274, v247);
    sub_20090(5LL, @"IPSec Controller:\tXAuth Attribute unint64_t Value = %d", v275, v276, v277, v278, v279, v280, v248);
LABEL_106:
    v244 += 2;
  }

  if (v248 + 4 <= v243)
  {
    ipsec_xauthtype_to_str(HIWORD(v246) & 0x7FFF);
    sub_20090(5LL, @"IPSec Controller:\tXAuth Attribute Type = %d (%s)", v249, v250, v251, v252, v253, v254, v247);
    if (v245 == 35904)
    {
      v261 = malloc(v248 + 1);
      if (v261)
      {
        v262 = v261;
        memmove(v261, v244 + 2, v248);
        v262[v248] = 0;
        sub_20090( 5LL,  @"IPSec Controller:\tXAuth Attribute unint64_t Value = %s",  v263,  v264,  v265,  v266,  v267,  v268,  (uint64_t)v262);
        free(v262);
      }
    }

    else
    {
      sub_20090( 5LL,  @"IPSec Controller:\tXAuth Attribute CFIndex Length = %d Value = ...",  v255,  v256,  v257,  v258,  v259,  v260,  v248);
    }

    LODWORD(v243) = v243 - v248;
    v244 = (unsigned __int16 *)((char *)v244 + v248);
    goto LABEL_106;
  }

  v362 = (char *)(v248 + 4);
  CFStringRef v72 = @"IPSec Controller: invalid length of xauth message, expected %zu actual %d";
LABEL_178:
  uint64_t v73 = 3LL;
LABEL_23:
  sub_20090(v73, v72, v63, v64, v65, v66, v67, v68, (uint64_t)v362);
LABEL_24:
  sub_20090( 5LL,  @"IPSec Controller: ====================================================",  v63,  v64,  v65,  v66,  v67,  v68,  v361);
LABEL_25:
  signed int v74 = bswap32(*(unsigned __int16 *)(a5 + 848)) >> 16;
  if (v74 > 32800)
  {
    if (v74 <= 33024)
    {
      if (v74 != 32801)
      {
        if (v74 != 32802) {
          goto LABEL_274;
        }
        sub_20090( 5LL,  @"IPSec Controller: PH2 ESTABLISHED. phase %d, assert %d",  v10,  v11,  v12,  v13,  v14,  v15,  *(unsigned int *)(a5 + 592));
        int v84 = *(_DWORD *)(a5 + 592);
        if (v84 != 5 && (v84 != 6 || *(_DWORD *)(a5 + 600) != 5)) {
          goto LABEL_274;
        }
        if (*(void *)(a5 + 776))
        {
          CFAbsoluteTime Current = CFRunLoopGetCurrent();
          CFRunLoopRemoveTimer(Current, *(CFRunLoopTimerRef *)(a5 + 776), kCFRunLoopCommonModes);
        }

        my_CFRelease((const void **)(a5 + 776));
        int v92 = *(_DWORD *)(a5 + 592);
        if (v92 == 6)
        {
          if (*(_DWORD *)(a5 + 600) == 5) {
            *(_DWORD *)(a5 + 600) = 0;
          }
        }

        else if (v92 == 5)
        {
          CFNumberRef v93 = *(const __CFString **)(a5 + 960);
          if (v93)
          {
            if ((*(_BYTE *)(a5 + 73) & 4) == 0)
            {
              sub_247C4(a5, v93, 0LL, 1);
              my_CFRelease((const void **)(a5 + 960));
            }
          }
        }

        uint64_t v321 = sub_208B0(a5, 6LL, v86, v87, v88, v89, v90, v91);
        *(_DWORD *)(a5 + 396) = 1;
        v299 = (os_log_s *)ne_log_obj(v321);
        if (!os_log_type_enabled(v299, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_274;
        }
        *(_WORD *)sockaddr buf = 0;
        v300 = "IPSec Phase2 established.\n";
        goto LABEL_171;
      }

      sub_20090( 5LL,  @"IPSec Controller: PH2 START. phase %d, assert %d",  v10,  v11,  v12,  v13,  v14,  v15,  *(unsigned int *)(a5 + 592));
      int v205 = *(_DWORD *)(a5 + 592);
      if (v205 != 3)
      {
        if (v205 != 6 || *(_DWORD *)(a5 + 600) != 4) {
          goto LABEL_274;
        }
        int v206 = 5;
LABEL_174:
        *(_DWORD *)(a5 + 600) = v206;
        goto LABEL_274;
      }

      v301 = *(__CFRunLoopTimer **)(a5 + 776);
      if (v301)
      {
        CFAbsoluteTime v302 = CFAbsoluteTimeGetCurrent();
        CFRunLoopTimerSetNextFireDate(v301, v302 + 30.0);
      }

      uint64_t v82 = a5;
      uint64_t v83 = 5LL;
LABEL_130:
      sub_208B0(v82, v83, v75, v76, v77, v78, v79, v80);
      goto LABEL_274;
    }

    if (v74 != 33025)
    {
      if (v74 == 33027)
      {
        sub_20090( 5LL,  @"IPSec Controller: PEER RESP. phase %d, assert %d",  v10,  v11,  v12,  v13,  v14,  v15,  *(unsigned int *)(a5 + 592));
        uint64_t v159 = *(void *)(a5 + 832);
        sub_20090( 5LL,  @"IPSec Controller:\t----------------------------",  v160,  v161,  v162,  v163,  v164,  v165,  v364);
        v166.in_addr_t s_addr = *(_DWORD *)(v159 + 16);
        v167 = inet_ntoa(v166);
        sub_20090( 5LL,  @"IPSec Controller:\tresponse from vm_address_t address = %s",  v168,  v169,  v170,  v171,  v172,  v173,  (uint64_t)v167);
        sub_20090( 5LL,  @"IPSec Controller:\tike_code = %d",  v174,  v175,  v176,  v177,  v178,  v179,  bswap32(*(unsigned __int16 *)(v159 + 20)) >> 16);
        if (!*(_DWORD *)(a5 + 992)) {
          sub_20090( 3LL,  @"IPSec Controller: unsolicited peer response notification",  v180,  v181,  v182,  v183,  v184,  v185,  v365);
        }
        *(_DWORD *)(a5 + 992) = 0;
      }

      goto LABEL_274;
    }

    uint64_t v366 = *(unsigned int *)(a5 + 600);
    sub_20090( 5LL,  @"IPSec Controller: AUTHINFO. phase %d, assert %d",  v10,  v11,  v12,  v13,  v14,  v15,  *(unsigned int *)(a5 + 592));
    int v210 = *(_DWORD *)(a5 + 592);
    if (v210 == 3)
    {
      sub_208B0(a5, 4LL, v152, v153, v154, v155, v156, v157);
    }

    else
    {
      if (v210 != 6 || *(_DWORD *)(a5 + 600) != 4) {
        goto LABEL_274;
      }
      if ((*(_WORD *)(a5 + 916) & 0x40) != 0)
      {
        int v158 = @"IPSec Controller: session asserting but XAuth dialog required, so connection aborted";
        goto LABEL_272;
      }
    }

    v303 = *(__CFRunLoopTimer **)(a5 + 776);
    if (v303) {
      CFRunLoopTimerSetNextFireDate(v303, 3.1536e10);
    }
    v304 = (os_log_s *)ne_log_obj(v303);
    if (os_log_type_enabled(v304, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)sockaddr buf = 0;
      _os_log_impl(&dword_0, v304, OS_LOG_TYPE_DEFAULT, "IPSec requesting Extended Authentication.\n", buf, 2u);
    }

    uint64_t v305 = *(void *)(a5 + 832);
    LODWORD(v306) = bswap32(*(unsigned __int16 *)(a5 + 862)) >> 16;
    __int16 v307 = *(_WORD *)(a5 + 916) & 0xFFD0 | 0x20;
    *(_WORD *)(a5 + 916) = v307;
    if (v306 >= 5)
    {
      v308 = 0LL;
      v309 = (unsigned __int16 *)(v305 + 20);
      while (1)
      {
        unint64_t v306 = (v306 - 4);
        if (v306 <= 3)
        {
          sub_20090( 3LL,  @"IPSec Controller: invalid length of isakmp data, expected %zu actual %d",  v152,  v153,  v154,  v155,  v156,  v157,  4LL);
          goto LABEL_269;
        }

        int v310 = bswap32(*v309);
        int v311 = v310 >> 16;
        if (((v310 >> 16) & 0x80000000) == 0)
        {
          unint64_t v312 = (bswap32(v309[1]) >> 16) + 4LL;
          if (v312 > v306) {
            break;
          }
        }

        int v313 = HIWORD(v310) & 0x7FFF;
        switch(v313)
        {
          case 16520:
            if (!v309[1]) {
              goto LABEL_157;
            }
            sub_20090( 3LL,  @"IPSec Controller: Received unsupported Xauth Type (value %d)",  v152,  v153,  v154,  v155,  v156,  v157,  __rev16(v309[1]));
            goto LABEL_269;
          case 16521:
            __int16 v315 = *(_WORD *)(a5 + 916) & 0xFFE6 | 1;
            goto LABEL_156;
          case 16522:
            __int16 v315 = *(_WORD *)(a5 + 916) & 0xFFE1 | 2;
            goto LABEL_156;
          case 16523:
            __int16 v315 = *(_WORD *)(a5 + 916) & 0xFFE1 | 4;
            goto LABEL_156;
          case 16524:
            if (!v308)
            {
              size_t v316 = bswap32(v309[1]) >> 16;
              v317 = malloc(v316 + 1);
              v308 = v317;
              if (v317)
              {
                memmove(v317, v309 + 2, v316);
                v308[bswap32(v309[1]) >> 16] = 0;
              }
            }

            goto LABEL_157;
          case 16525:
            v324 = @"IPSec Controller: Received unsupported Xauth Challenge";
            goto LABEL_183;
          case 16526:
            sub_20090( 3LL,  @"IPSec Controller: Ignoring unsupported Xauth Domain",  v152,  v153,  v154,  v155,  v156,  v157,  v363);
            goto LABEL_157;
          case 16527:
            v324 = @"IPSec Controller: Received unsupported Xauth Status";
            goto LABEL_183;
          case 16528:
            __int16 v315 = *(_WORD *)(a5 + 916) & 0xFFE0 | 0x10;
            goto LABEL_156;
          case 16529:
            __int16 v315 = *(_WORD *)(a5 + 916) & 0xFFE0 | 8;
LABEL_156:
            *(_WORD *)(a5 + 916) = v315;
            goto LABEL_157;
          default:
            if (v313 == 32136)
            {
              unsigned int v314 = v309[1];
              if (v314 != 256)
              {
                sub_20090( 3LL,  @"IPSec Controller: Received unsupported Xauth Vendor attribute (value %d)",  v152,  v153,  v154,  v155,  v156,  v157,  __rev16(v314));
                goto LABEL_269;
              }
            }

LABEL_157:
            if ((v311 & 0x80000000) == 0)
            {
              unsigned int v318 = bswap32(v309[1]);
              LODWORD(v306) = v306 - HIWORD(v318);
              v309 = (unsigned __int16 *)((char *)v309 + HIWORD(v318));
            }

            v309 += 2;
            if ((int)v306 <= 4)
            {
              __int16 v307 = *(_WORD *)(a5 + 916);
              goto LABEL_162;
            }

            break;
        }
      }

      uint64_t v363 = v312;
      v324 = @"IPSec Controller: invalid length of xauth message, expected %zu actual %d";
LABEL_183:
      sub_20090(3LL, v324, v152, v153, v154, v155, v156, v157, v363);
      goto LABEL_269;
    }

    v308 = 0LL;
LABEL_162:
    if ((v307 & 0x8000) == 0 && *(_DWORD *)(a5 + 592) != 6
      || (LOBYTE(v319) = v307, *(_WORD *)(a5 + 916) = v307 & 0x7FFF, (v307 & 0x40) != 0))
    {
LABEL_203:
      CFMutableDictionaryRef v377 = 0LL;
      if ((*(_BYTE *)(a5 + 72) & 0x80) == 0)
      {
LABEL_269:
        *(_WORD *)(a5 + 916) = 0;
        if (v308) {
          free(v308);
        }
        int v158 = @"IPSec Controller: XAuth authentication failed";
        goto LABEL_272;
      }

      v331 = *(__CFUserNotification **)(a5 + 168);
      if (v331)
      {
        CFUserNotificationCancel(v331);
        v332 = CFRunLoopGetCurrent();
        CFRunLoopRemoveSource(v332, *(CFRunLoopSourceRef *)(a5 + 176), kCFRunLoopDefaultMode);
        my_CFRelease((const void **)(a5 + 168));
        my_CFRelease((const void **)(a5 + 176));
      }

      if (v308) {
        CFStringRef v333 = CFStringCreateWithFormat(0LL, 0LL, @"%s", v308, v366, v369);
      }
      else {
        CFStringRef v333 = CFStringCreateWithFormat(0LL, 0LL, @"Enter your user authentication", v363, v366, v369);
      }
      CFStringRef v334 = v333;
      *(void *)sockaddr buf = v333;
      if (!v333 && !CFStringGetLength(0LL)
        || (CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFCopyStringDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks),  (v377 = Mutable) == 0LL))
      {
LABEL_268:
        my_CFRelease((const void **)&v377);
        my_CFRelease((const void **)buf);
        goto LABEL_269;
      }

      v336 = Mutable;
      if (gIconURLRef) {
        CFDictionaryAddValue(Mutable, kCFUserNotificationIconURLKey, (const void *)gIconURLRef);
      }
      if (gBundleURLRef) {
        CFDictionaryAddValue(v336, kCFUserNotificationLocalizationURLKey, (const void *)gBundleURLRef);
      }
      CFDictionaryAddValue(v336, kCFUserNotificationAlertMessageKey, v334);
      CFDictionaryAddValue(v336, kCFUserNotificationAlertHeaderKey, @"VPN Connection");
      CFDictionaryAddValue(v336, kCFUserNotificationAlternateButtonTitleKey, @"Cancel");
      v337 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
      if (!v337)
      {
        uint64_t v341 = 0LL;
        CFIndex Count = 0LL;
LABEL_245:
        if ((*(_WORD *)(a5 + 916) & 1) != 0)
        {
          unint64_t Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a5 + 608), @"XAuthName");
          if (isString(Value))
          {
            v348 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
            if (v348)
            {
              v349 = v348;
              CFArrayAppendValue(v348, Value);
              if ((*(_WORD *)(a5 + 916) & 6) != 0) {
                CFArrayAppendValue(v349, &stru_3D150);
              }
              CFDictionaryAddValue(v336, kCFUserNotificationTextFieldValuesKey, v349);
              CFRelease(v349);
            }
          }
        }

        if (Count >= 1)
        {
          CFMutableArrayRef v350 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
          CFMutableArrayRef v375 = v350;
          CFMutableArrayRef v351 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
          CFMutableArrayRef v374 = v351;
          int v372 = 1;
          int valuePtr = 0;
          CFNumberRef v352 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
          CFNumberRef v371 = v352;
          CFNumberRef v353 = CFNumberCreate(0LL, kCFNumberIntType, &v372);
          CFNumberRef v370 = v353;
          if (v350)
          {
            if (v351)
            {
              if (v352)
              {
                CFNumberRef v354 = v353;
                if (v353)
                {
                  do
                  {
                    CFArrayAppendValue(v350, v352);
                    CFArrayAppendValue(v351, v354);
                    --Count;
                  }

                  while (Count);
                  CFDictionarySetValue(v336, @"SBUserNotificationTextAutocapitalizationType", v350);
                  CFDictionarySetValue(v336, @"SBUserNotificationTextAutocorrectionType", v351);
                }
              }
            }
          }

          my_CFRelease((const void **)&v375);
          my_CFRelease((const void **)&v374);
          my_CFRelease((const void **)&v371);
          my_CFRelease((const void **)&v370);
        }

        if (v341) {
          CFOptionFlags v355 = 0x8000LL << v341;
        }
        else {
          CFOptionFlags v355 = 0LL;
        }
        v356 = CFUserNotificationCreate(0LL, 150.0, v355, &error, v336);
        *(void *)(a5 + 168) = v356;
        if (v356)
        {
          CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource( 0LL,  v356,  (CFUserNotificationCallBack)user_notification_callback,  0LL);
          *(void *)(a5 + 176) = RunLoopSource;
          if (RunLoopSource)
          {
            v358 = CFRunLoopGetCurrent();
            CFRunLoopAddSource(v358, *(CFRunLoopSourceRef *)(a5 + 176), kCFRunLoopDefaultMode);
            my_CFRelease((const void **)&v377);
            my_CFRelease((const void **)buf);
            *(_WORD *)(a5 + 916) |= 0x80u;
LABEL_265:
            if (v308) {
              free(v308);
            }
            goto LABEL_274;
          }

          my_CFRelease((const void **)(a5 + 168));
        }

        goto LABEL_268;
      }

      v338 = v337;
      __int16 v339 = *(_WORD *)(a5 + 916);
      if ((v339 & 8) != 0)
      {
        CFArrayAppendValue(v337, @"Answer");
      }

      else
      {
        if ((v339 & 0x10) != 0)
        {
          CFArrayAppendValue(v337, @"Next PIN");
          uint64_t v341 = 1LL;
          goto LABEL_244;
        }

        if ((v339 & 1) != 0)
        {
          CFArrayAppendValue(v337, @"Account");
          __int16 v339 = *(_WORD *)(a5 + 916);
        }

        if ((v339 & 4) != 0)
        {
          v340 = @"Passcode";
LABEL_241:
          CFArrayAppendValue(v338, v340);
          if ((*(_WORD *)(a5 + 916) & 1) != 0) {
            uint64_t v341 = 2LL;
          }
          else {
            uint64_t v341 = 1LL;
          }
          goto LABEL_244;
        }

        if ((v339 & 2) != 0)
        {
          v340 = @"Password";
          goto LABEL_241;
        }
      }

      uint64_t v341 = 0LL;
LABEL_244:
      CFIndex Count = CFArrayGetCount(v338);
      CFDictionaryAddValue(v336, kCFUserNotificationTextFieldTitlesKey, v338);
      CFRelease(v338);
      goto LABEL_245;
    }

    if ((v307 & 1) != 0)
    {
      v320 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a5 + 608), @"XAuthName");
      if (isString(v320))
      {
        CFIndex Length = CFStringGetLength(v320);
        __int16 v319 = *(_WORD *)(a5 + 916);
        if (Length)
        {
          BOOL v323 = 1;
          goto LABEL_187;
        }
      }

      else
      {
        __int16 v319 = *(_WORD *)(a5 + 916);
      }
    }

    else
    {
      v320 = 0LL;
    }

    if ((v319 & 1) != 0) {
      goto LABEL_203;
    }
    BOOL v323 = 0;
LABEL_187:
    if ((v319 & 6) == 0)
    {
      v327 = 0LL;
      goto LABEL_198;
    }

    v325 = (const __CFString *)CFDictionaryGetValue( *(CFDictionaryRef *)(a5 + 608),  kSCPropNetIPSecXAuthPasswordEncryption);
    CFTypeID TypeID = CFStringGetTypeID();
    if (!v325
      || CFGetTypeID(v325) != TypeID
      || CFStringCompare(v325, kSCValNetIPSecXAuthPasswordEncryptionKeychain, 0LL))
    {
      v327 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a5 + 608), kSCPropNetIPSecXAuthPassword);
      CFTypeID v328 = CFStringGetTypeID();
      if (!v327)
      {
LABEL_196:
        if (!isString(v327))
        {
LABEL_201:
          if (v327) {
            CFRelease(v327);
          }
          goto LABEL_203;
        }

        BOOL v323 = CFStringGetLength(v327) != 0;
LABEL_198:
        if (v323)
        {
          __int16 v329 = *(_WORD *)(a5 + 916);
          if ((v329 & 1) != 0)
          {
            *(_WORD *)sockaddr buf = 16521;
            v379 = v320;
            int v330 = 1;
          }

          else
          {
            int v330 = 0;
          }

          if ((v329 & 4) != 0)
          {
            __int16 v343 = 16523;
          }

          else
          {
            if ((v329 & 2) == 0)
            {
LABEL_233:
              v345 = *(__CFRunLoopTimer **)(a5 + 776);
              if (v345)
              {
                CFAbsoluteTime v346 = CFAbsoluteTimeGetCurrent();
                CFRunLoopTimerSetNextFireDate(v345, v346 + 30.0);
              }

              sub_208B0(a5, 3LL, v152, v153, v154, v155, v156, v157);
              racoon_send_cmd_xauthinfo(*(_DWORD *)(a5 + 784), *(_DWORD *)(a5 + 748), (uint64_t)buf, v330);
              if (v327) {
                CFRelease(v327);
              }
              goto LABEL_265;
            }

            __int16 v343 = 16522;
          }

          v344 = &buf[16 * v330];
          *(_WORD *)v344 = v343;
          *((void *)v344 + 1) = v327;
          ++v330;
          goto LABEL_233;
        }

        goto LABEL_201;
      }

      if (CFGetTypeID(v327) == v328)
      {
        CFRetain(v327);
        goto LABEL_196;
      }
    }

    v327 = 0LL;
    goto LABEL_196;
  }

  if (v74 > 32785)
  {
    if (v74 != 32786)
    {
      if (v74 != 32787) {
        goto LABEL_274;
      }
      sub_20090( 5LL,  @"IPSec Controller: PH1 ESTABLISHED. phase %d, assert %d",  v10,  v11,  v12,  v13,  v14,  v15,  *(unsigned int *)(a5 + 592));
      int v150 = *(_DWORD *)(a5 + 592);
      if (v150 == 3)
      {
        uint64_t v292 = *(void *)(a5 + 832);
        if (!*(void *)(a5 + 584)) {
          goto LABEL_120;
        }
        vm_address_t v293 = *(void *)(a5 + 816);
        if (v293)
        {
          my_Deallocate(v293, *(_DWORD *)(a5 + 824));
          *(void *)(a5 + 816) = 0LL;
        }

        int v294 = *(_DWORD *)(a5 + 844) + 1;
        *(_DWORD *)(a5 + 824) = v294;
        v295 = (void *)my_Allocate(v294);
        *(void *)(a5 + 816) = v295;
        memcpy(v295, *(const void **)(a5 + 832), *(unsigned int *)(a5 + 824));
        uint64_t v296 = *(void *)(a5 + 584);
        sub_27F80(a5);
        LOBYTE(v296) = ne_sm_bridge_request_install(v296);
        sub_20AD8(a5, 0, 1);
        if ((v296 & 1) == 0)
        {
LABEL_120:
          if ((*(_WORD *)(v292 + 2) & 0x100) != 0) {
            sub_20AD8(a5, 1, 1);
          }
        }

        *(_DWORD *)(a5 + 912) = 15;
        v297 = *(__CFRunLoopTimer **)(a5 + 776);
        if (v297)
        {
          CFAbsoluteTime v298 = CFAbsoluteTimeGetCurrent();
          CFRunLoopTimerSetNextFireDate(v297, v298 + 1.0);
        }

        unint64_t v151 = mach_absolute_time();
        *(_DWORD *)(a5 + 184) = (*(double *)&gTimeScaleSeconds * (double)v151);
        *(_DWORD *)(a5 + 192) = 0;
      }

      else
      {
        if (v150 != 6 || *(_DWORD *)(a5 + 600) != 4) {
          goto LABEL_274;
        }
        unint64_t v151 = sub_27FF4(a5);
        if ((_DWORD)v151)
        {
          int v158 = @"IPSec Controller: unassert failed";
LABEL_272:
          sub_20090(3LL, v158, v152, v153, v154, v155, v156, v157, v363);
LABEL_273:
          ipsec_stop(a5);
          goto LABEL_274;
        }
      }

      v299 = (os_log_s *)ne_log_obj(v151);
      if (!os_log_type_enabled(v299, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_274;
      }
      *(_WORD *)sockaddr buf = 0;
      v300 = "IPSec Phase1 established.\n";
LABEL_171:
      _os_log_impl(&dword_0, v299, OS_LOG_TYPE_DEFAULT, v300, buf, 2u);
      goto LABEL_274;
    }

    sub_20090( 5LL,  @"IPSec Controller: PH1 STARTPEER. phase %d, assert %d",  v10,  v11,  v12,  v13,  v14,  v15,  *(unsigned int *)(a5 + 592));
    int v207 = *(_DWORD *)(a5 + 592);
    if (v207 != 2 && (v207 != 6 || *(_DWORD *)(a5 + 600) != 3)) {
      goto LABEL_274;
    }
    uint64_t v208 = *(__CFRunLoopTimer **)(a5 + 776);
    if (v208)
    {
      CFAbsoluteTime v209 = CFAbsoluteTimeGetCurrent();
      CFRunLoopTimerSetNextFireDate(v208, v209 + 30.0);
      int v207 = *(_DWORD *)(a5 + 592);
    }

    if (v207 == 6)
    {
      if (*(_DWORD *)(a5 + 600) != 3) {
        goto LABEL_274;
      }
      int v206 = 4;
      goto LABEL_174;
    }

    if (v207 != 2) {
      goto LABEL_274;
    }
    uint64_t v82 = a5;
    uint64_t v83 = 3LL;
    goto LABEL_130;
  }

  if (v74 == 32769)
  {
    sub_20090( 3LL,  @"IPSec Controller: IKE FAILED. phase %d, assert %d",  v10,  v11,  v12,  v13,  v14,  v15,  *(unsigned int *)(a5 + 592));
    uint64_t v195 = *(void *)(a5 + 832);
    unsigned int v196 = *(unsigned __int16 *)(v195 + 20);
    if (v196 == 13726)
    {
      v379 = 0LL;
      v197.in_addr_t s_addr = *(_DWORD *)(v195 + 24);
      *(_DWORD *)sockaddr buf = 528;
      *(in_addr *)&buf[4] = v197;
      int v198 = inet_ntoa(v197);
      sub_20090( 5LL,  @"IPSec Controller: connection redirected to server '%s'...",  v199,  v200,  v201,  v202,  v203,  v204,  (uint64_t)v198);
      sub_25C8C(a5, buf, a5 + 760, 0LL);
      goto LABEL_274;
    }

    uint64_t v368 = __rev16(v196);
    ipsec_error_to_str(v368);
    uint64_t v287 = sub_20090( 3LL,  @"IPSec Controller: connection failed <IKE Error %d (0x%x) %s>",  v281,  v282,  v283,  v284,  v285,  v286,  v368);
    int v288 = ipsec_error_to_status( v287,  bswap32(*(unsigned __int16 *)(v195 + 22)) >> 16,  bswap32(*(unsigned __int16 *)(v195 + 20)) >> 16);
    *(_DWORD *)(a5 + 596) = v288;
    if (v288 == 14 && *(_DWORD *)(a5 + 592) >= 5u) {
      *(_DWORD *)(a5 + 596) = 16;
    }
    goto LABEL_273;
  }

  if (v74 != 32785) {
    goto LABEL_274;
  }
  sub_20090( 5LL,  @"IPSec Controller: PH1 STARTUS. phase %d, assert %d",  v10,  v11,  v12,  v13,  v14,  v15,  *(unsigned int *)(a5 + 592));
  int v81 = *(_DWORD *)(a5 + 592);
  if (v81 == 6)
  {
    int v289 = *(_DWORD *)(a5 + 600);
    if (v289 != 2)
    {
      if (v289 != 1) {
        goto LABEL_274;
      }
      v290 = *(__CFRunLoopTimer **)(a5 + 776);
      if (v290)
      {
        CFAbsoluteTime v291 = CFAbsoluteTimeGetCurrent();
        CFRunLoopTimerSetNextFireDate(v290, v291 + 10.0);
        if (*(_DWORD *)(a5 + 592) != 6) {
          goto LABEL_274;
        }
      }
    }

    int v206 = 3;
    goto LABEL_174;
  }

  if (v81 == 1)
  {
    uint64_t v82 = a5;
    uint64_t v83 = 2LL;
    goto LABEL_130;
  }

LABEL_274:
  uint64_t result = (_OWORD *)my_Deallocate(*(void *)(a5 + 832), *(_DWORD *)(a5 + 844) + 1);
  *(void *)(a5 + 840) = 0LL;
  *(void *)(a5 + 832) = 0LL;
  return result;
}

BOOL sub_27F80(uint64_t a1)
{
  unsigned int v1 = bswap32(*(unsigned __int16 *)(a1 + 862)) >> 16;
  if (v1 < 0x1D) {
    return 1LL;
  }
  int v3 = v1 - 28;
  uint64_t v4 = (unsigned __int16 *)(*(void *)(a1 + 832) + 44LL);
  do
  {
    int v5 = bswap32(*v4);
    int v6 = HIWORD(v5) & 0x7FFF;
    BOOL result = v6 != 28676;
    if (v6 == 28676) {
      break;
    }
    unsigned int v7 = bswap32(v4[1]) >> 16;
    uint64_t v8 = v5 >> 16 >= 0 ? v7 : 0LL;
    int v9 = v3 - v8;
    uint64_t v4 = (unsigned __int16 *)((char *)v4 + v8 + 4);
    BOOL v10 = __OFSUB__(v9, 4);
    int v3 = v9 - 4;
  }

  while (!((v3 < 0) ^ v10 | (v3 == 0)));
  return result;
}

uint64_t sub_27FF4(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 872)) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a1 + 592) == 6 && *(_DWORD *)(a1 + 600) == 4)
  {
    unsigned int v1 = (CFRunLoopTimerRef *)(a1 + 776);
    if (*(void *)(a1 + 776))
    {
      CFAbsoluteTime Current = CFRunLoopGetCurrent();
      CFRunLoopRemoveTimer(Current, *v1, kCFRunLoopCommonModes);
    }

    my_CFRelease((const void **)v1);
  }

  return 0LL;
}

void sub_28064(int a1, addrinfo *a2, uint64_t a3)
{
  bytes = 0LL;
  int v6 = nw_nat64_copy_prefixes(0LL, &bytes);
  if (a1 || !a2)
  {
    in_addr v95 = gai_strerror(a1);
    sub_20090( 3LL,  @"IPSec Controller: dns reply: getaddrinfo() failed: %s",  v40,  v41,  v42,  v43,  v44,  v45,  (uint64_t)v95);
    goto LABEL_41;
  }

  int v7 = v6;
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  CFMutableArrayRef theArray = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  uint64_t v98 = a2;
  int v9 = a2;
  do
  {
    ai_addr = v9->ai_addr;
    int sa_family = ai_addr->sa_family;
    if (sa_family == 2)
    {
      if (ai_addr->sa_len <= 0x10u)
      {
        CFMutableDictionaryRef v12 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        if (v12)
        {
          uint64_t v13 = v12;
          CFDataRef v14 = CFDataCreate(0LL, &v9->ai_addr->sa_len, v9->ai_addr->sa_len);
          if (v14)
          {
            CFDataRef v15 = v14;
            CFDictionarySetValue(v13, @"RemoteAddress", v14);
            CFRelease(v15);
            if (v7 < 1) {
              goto LABEL_25;
            }
            CFDataRef v16 = CFDataCreate(kCFAllocatorDefault, bytes, 16LL);
            if (v16)
            {
              CFDataRef v17 = v16;
              CFDictionarySetValue(v13, @"RemoteAddressNAT64Prefix", v16);
              CFArrayAppendValue(theArray, v13);
              CFRelease(v17);
            }

            goto LABEL_26;
          }
        }
      }
    }

    else
    {
      BOOL v18 = sa_family != 30 || v7 < 1;
      if (!v18 && ai_addr->sa_len <= 0x1Cu)
      {
        uint64_t v19 = 0LL;
        uint64_t v20 = v7;
        while (1)
        {
          LODWORD(v101) = 0;
          if ((nw_nat64_extract_v4(&bytes[v19], &v9->ai_addr->sa_data[6], &v101) & 1) != 0) {
            break;
          }
          v19 += 16LL;
          if (!--v20) {
            goto LABEL_27;
          }
        }

        if ((_DWORD)v20)
        {
          CFMutableDictionaryRef v21 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          if (v21)
          {
            uint64_t v13 = v21;
            CFDataRef v22 = CFDataCreate(0LL, &bytes[v19], 16LL);
            if (v22)
            {
              CFDataRef v23 = v22;
              CFDictionarySetValue(v13, @"RemoteAddressNAT64Prefix", v22);
              CFRelease(v23);
              *((void *)&buffer + 1) = 0LL;
              LODWORD(buffer) = 528;
              DWORD1(buffer) = v101;
              CFDataRef v24 = CFDataCreate(0LL, (const UInt8 *)&buffer, 16LL);
              if (!v24) {
                goto LABEL_27;
              }
              CFDataRef v25 = v24;
              CFDictionarySetValue(v13, @"RemoteAddress", v24);
              CFRelease(v25);
LABEL_25:
              CFArrayAppendValue(Mutable, v13);
            }

__CFMachPort *sub_2851C(__CFMachPort *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(__CFMachPort **)(a4 + 1000) == result)
  {
    CFMachPortInvalidate(result);
    CFRelease(*(CFTypeRef *)(a4 + 1000));
    *(void *)(a4 + 1000) = 0LL;
    return (__CFMachPort *)getaddrinfo_async_handle_reply(a2);
  }

  return result;
}

double nat_port_mapping_set(uint64_t a1)
{
  if (a1)
  {
    if (*(_DWORD *)(a1 + 888))
    {
      SCLog(1LL, 5LL, @"%s port-mapping API for %s ignored: VPN is the primary interface.");
      return result;
    }

    if (*(_DWORD *)(a1 + 392)) {
      sub_28788(a1);
    }
    if (*(_WORD *)(a1 + 64) == 1)
    {
      if_nametoindex((const char *)(a1 + 918));
      if (!strstr((const char *)(a1 + 918), "ppp") && !strstr((const char *)(a1 + 918), "utun"))
      {
        int v3 = (_DNSServiceRef_t **)(a1 + 200);
        if (!*(void *)(a1 + 200))
        {
          if (DNSServiceCreateConnection((DNSServiceRef *)(a1 + 200)) || (int v5 = *v3) == 0LL)
          {
            uint64_t v4 = @"%s Error calling DNSServiceCreateConnection for %s, error: %d.";
            goto LABEL_15;
          }

          current_queue = dispatch_get_current_queue();
          if (DNSServiceSetDispatchQueue(v5, current_queue))
          {
            uint64_t v4 = @"%s Error calling DNSServiceSetDispatchQueue for %s, error: %d.";
            goto LABEL_15;
          }

          if (!*(void *)(a1 + 976))
          {
            CFRunLoopRef Current = CFRunLoopGetCurrent();
            *(void *)(a1 + 976) = my_CFRetain(Current);
          }
        }

        *(void *)(a1 + 208) = *(void *)(a1 + 200);
        if (!DNSServiceNATPortMappingCreate( (DNSServiceRef *)(a1 + 208),  0x4000u,  0,  0,  0,  0,  0,  (DNSServiceNATPortMappingReply)sub_288DC,  (void *)a1))
        {
          *(_DWORD *)(a1 + 220) = 0;
          *(_DWORD *)(a1 + 224) = 0;
          *(_WORD *)(a1 + 228) = 0;
          *(void *)(a1 + 232) = 0LL;
          SCLog(1LL, 6LL, @"%s set port-mapping for %s, interface: %d, protocol: %d, privatePort: %d.");
          ++*(_DWORD *)(a1 + 392);
          return result;
        }

        uint64_t v4 = @"%s Error calling DNSServiceNATPortMappingCreate for %s, error: %d.";
LABEL_15:
        SCLog(1LL, 3LL, v4);
        return sub_288A4(a1 + 200);
      }
    }
  }

  return result;
}

void sub_28788(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 392))
  {
    SCLog(1LL, 6LL, @"%s clearing port-mapping for %s.");
    if (*(_DWORD *)(a1 + 392))
    {
      unint64_t v2 = 0LL;
      uint64_t v3 = a1 + 200;
      do
      {
        sub_288A4(v3);
        if (v2 > 2) {
          break;
        }
        ++v2;
        v3 += 48LL;
      }

      while (v2 < *(unsigned int *)(a1 + 392));
    }

    *(_DWORD *)(a1 + 392) = 0;
  }

void nat_port_mapping_clear(uint64_t a1)
{
  if (a1) {
    sub_28788(a1);
  }
}

void sub_28850(uint64_t a1)
{
  if (*(_WORD *)(a1 + 64) == 1)
  {
    unsigned int v1 = *(__CFRunLoopTimer **)(a1 + 984);
    if (v1)
    {
      unint64_t v2 = (const void **)(a1 + 984);
      CFRunLoopRemoveTimer(*(CFRunLoopRef *)(a1 + 976), v1, kCFRunLoopCommonModes);
      my_CFRelease(v2);
    }
  }

double sub_288A4(uint64_t a1)
{
  if (a1)
  {
    unint64_t v2 = *(_DNSServiceRef_t **)a1;
    if (v2) {
      DNSServiceRefDeallocate(v2);
    }
    double result = 0.0;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
  }

  return result;
}

void sub_288DC( uint64_t a1, uint64_t a2, unsigned int a3, int a4, unsigned int a5, int a6, unsigned int a7, unsigned int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
  {
    uint64_t v13 = (unsigned __int16 *)(a10 + 64);
    if (*(_WORD *)(a10 + 64) == 1)
    {
      BOOL v14 = *(_DWORD *)(a10 + 592) != 0;
      CFDataRef v15 = (const char *)(a10 + 918);
      size_t v16 = 16LL;
    }

    else
    {
      BOOL v14 = 0;
      CFDataRef v15 = "NULL";
      size_t v16 = 4LL;
    }
  }

  else
  {
    uint64_t v13 = (_WORD *)(&stru_20 + 32);
    BOOL v14 = 0;
    CFDataRef v15 = "NULL";
    size_t v16 = 4LL;
  }

  unsigned int v17 = bswap32(a5);
  unsigned int v18 = __rev16(a7);
  unsigned int v19 = __rev16(a8);
  if (*(_DWORD *)(a10 + 888))
  {
    SCLog( 1LL,  5LL,  @"%s port-mapping update for %s ignored: VPN is the Primary interface. Public Address: %x, Protocol: %s, Private Port: %d, Public Port: %d");
    goto LABEL_8;
  }

  unsigned int v71 = v18;
  unsigned int v70 = v19;
  BOOL v68 = v14;
  if (a4 != -65558 && a4)
  {
    SCLog(1LL, 3LL, @"%s failed to set port-mapping for %s, errorCode: %d.");
    if ((a4 + 65565) > 1)
    {
      if (a4 != -65563) {
        return;
      }
    }

    else
    {
      if (*(_DWORD *)(a10 + 392) >= 4u) {
        unsigned int v23 = 4;
      }
      else {
        unsigned int v23 = *(_DWORD *)(a10 + 392);
      }
      if (!v23) {
        return;
      }
      uint64_t v24 = 0LL;
      uint64_t v25 = 48LL * v23;
      while (1)
      {
        uint64_t v26 = a10 + v24;
        if (*(void *)(a10 + v24 + 208) == a1) {
          break;
        }
        v24 += 48LL;
        if (v25 == v24) {
          return;
        }
      }

      SCLog( 1LL,  3LL,  @"%s port-mapping for %s became invalid. is Connected: %d, Protocol: %s, Private Port: %d, Previous publicAddress: (%x), Previous publicPort: (%d).");
      if (*(_DWORD *)(v26 + 240) && v68)
      {
        SCLog(1LL, 5LL, @"%s public port-mapping for %s changed... starting faster probe.");
        int v45 = *v13;
        goto LABEL_67;
      }
    }

LABEL_8:
    sub_28788(a10);
    return;
  }

  unsigned int v69 = v17;
  uint64_t v72 = 0LL;
  if (getifaddrs(&v72))
  {
    uint64_t v20 = @"%s port-mapping update for %s ignored: failed to get interface list.";
    uint64_t v21 = 3LL;
    goto LABEL_13;
  }

  uint64_t v62 = v13;
  uint64_t v27 = v72;
  if (!v72)
  {
    freeifaddrs(0LL);
    int v63 = 0;
    goto LABEL_47;
  }

  int v63 = 0;
  int v28 = 0;
  do
  {
    ifa_name = v27->ifa_name;
    if (ifa_name)
    {
      ifa_addr = v27->ifa_addr;
      if (ifa_addr)
      {
        if ((!strncmp(v27->ifa_name, "utun", 4uLL) || !strncmp(ifa_name, "ppp", 3uLL))
          && ifa_addr->sa_family == 2
          && *(_DWORD *)&ifa_addr->sa_data[2] == a5)
        {
          SCLog( 1LL,  6LL,  @"%s port-mapping update for %s ignored: related to VPN interface. Public Address: %x, Protocol: %s, Private Port: %d, Public Port: %d.");
          ifa_name = v27->ifa_name;
          if (!ifa_name)
          {
            int v28 = 1;
            goto LABEL_41;
          }

          ifa_addr = v27->ifa_addr;
          int v28 = 1;
          if (!ifa_addr) {
            goto LABEL_41;
          }
        }

        if (!strncmp(ifa_name, v15, v16) && ifa_addr->sa_family == 2 && *(_BYTE *)(a10 + 617) == 2)
        {
          int v31 = v63;
          if (*(_DWORD *)&ifa_addr->sa_data[2] == *(_DWORD *)(a10 + 620)) {
            int v31 = 1;
          }
          int v63 = v31;
        }
      }
    }

LABEL_41:
    uint64_t v27 = v27->ifa_next;
  }

  while (v27);
  freeifaddrs(v72);
  if (v28) {
    return;
  }
LABEL_47:
  if_indextoname(a3, (char *)&__s1);
  if (!strncmp((const char *)&__s1, v15, v16))
  {
    if (strstr(v15, "ppp") || strstr(v15, "utun"))
    {
      uint64_t v20 = @"%s port-mapping update for %s ignored: underlying interface is PPP/VPN. Public Address: %x, Protocol: %s, Private Port: %d, Public Port: %d.";
      goto LABEL_63;
    }

    if (v63) {
      goto LABEL_53;
    }
    if (!a5 || a7 && !a8)
    {
      SCLog( 1LL,  6LL,  @"%s port-mapping update for %s ignored: underlying interface down. Public Address: %x, Protocol: %s, Private Port: %d, Public Port: %d.");
      unint64_t v53 = *(unsigned int *)(a10 + 392);
      if ((_DWORD)v53)
      {
        unint64_t v54 = 0LL;
        uint64_t v55 = (_DWORD *)(a10 + 240);
        do
        {
          if (*((void *)v55 - 4) == a1)
          {
            *uint64_t v55 = 0;
            SCLog(1LL, 6LL, @"%s port-mapping for %s flagged down because of no connectivity.");
            unint64_t v53 = *(unsigned int *)(a10 + 392);
          }

          if (v54 > 2) {
            break;
          }
          ++v54;
          v55 += 12;
        }

        while (v54 < v53);
      }

      return;
    }

    uint64_t v20 = @"%s port-mapping update for %s ignored: underlying interface's address changed. Public Address: %x, Protocol: %s, Private Port: %d, Public Port: %d.";
    goto LABEL_92;
  }

  int v32 = v70 | v71;
  if ((a6 || !a5 || v32)
    && (v69 | a6 || v32)
    && (*v62 != 1 || *(_BYTE *)(a10 + 617) != 2 || *(_DWORD *)(a10 + 620) != a5 || !v63))
  {
    uint64_t v20 = @"%s port-mapping update for %s ignored: not for interface %s. Public Address: %x, Protocol: %s, Private Port: %d, Public Port: %d.";
    goto LABEL_92;
  }

LABEL_53:
  SCLog( 1LL,  6LL,  @"%s port-mapping for %s, Protocol: %s, Private Port: %d, Public Address: %x, Public Port: %d, TTL: %d%s.");
  unsigned int v33 = *(_DWORD *)(a10 + 392);
  if (v33 >= 4) {
    unsigned int v33 = 4;
  }
  unsigned int v34 = a7;
  unsigned int v35 = a3;
  if (!v33) {
    return;
  }
  uint64_t v36 = 0LL;
  uint64_t v37 = 48LL * v33;
  while (1)
  {
    uint64_t v38 = a10 + v36;
    if (*(void *)(a10 + v36 + 208) == a1) {
      break;
    }
    v36 += 48LL;
    if (v37 == v36) {
      return;
    }
  }

  int v46 = *(_DWORD *)(v38 + 240);
  if (v46) {
    BOOL v47 = a5 == 0;
  }
  else {
    BOOL v47 = 0;
  }
  if (v47 && a8 == 0)
  {
    SCLog( 1LL,  5LL,  @"%s port-mapping for %s indicates public interface down. Public Address: %x, Protocol: %s, Private Port: %d, Public Port: %d.");
    __s1.version = 0LL;
    memset(&__s1.retain, 0, 24);
    __s1.mach_timebase_info info = (void *)a10;
    if (*(_WORD *)(a10 + 64) != 1 || *(void *)(a10 + 952) || *(void *)(a10 + 984)) {
      return;
    }
    SCLog(1LL, 6LL, @"starting wait-port-mapping timer for IPSec: %d secs");
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    uint64_t v52 = CFRunLoopTimerCreate(0LL, Current + 20.0, 3.1536e10, 0LL, 0LL, (CFRunLoopTimerCallBack)sub_294CC, &__s1);
    *(void *)(a10 + 984) = v52;
    if (v52)
    {
      CFRunLoopAddTimer(*(CFRunLoopRef *)(a10 + 976), v52, kCFRunLoopCommonModes);
      return;
    }

    uint64_t v61 = @"IPSec Controller: public interface down, cannot create RunLoop timer... starting faster probe.";
LABEL_140:
    SCLog(1LL, 3LL, v61);
    int v45 = (unsigned __int16)*v62;
LABEL_67:
    if (v45 == 1)
    {
      racoon_send_cmd_start_dpd(*(_DWORD *)(a10 + 784), *(_DWORD *)(a10 + 748), v39, v40, v41, v42, v43, v44);
      *(_DWORD *)(a10 + 992) = 1;
    }

    return;
  }

  if (v46)
  {
    sub_28850(a10);
    unsigned int v35 = a3;
    unsigned int v34 = a7;
  }

  if (*v62 == 1 && *(_BYTE *)(a10 + 617) == 2 && *(_DWORD *)(a10 + 620) == a5 && v34 == a8)
  {
    SCLog( 1LL,  5LL,  @"%s port-mapping update for %s indicates no NAT. Public Address: %x, Protocol: %s, Private Port: %d, Public Port: %d.");
    unsigned int v35 = a3;
  }

  uint64_t v49 = a10 + v36;
  if (*(_DWORD *)(a10 + v36 + 220) == v35)
  {
    int v50 = *(_DWORD *)(v49 + 224);
    if (v50 == a6)
    {
      if (*(unsigned __int16 *)(a10 + v36 + 228) == v71)
      {
        SCLog( 1LL,  6LL,  @"%s port-mapping for %s consistent. is Connected: %d, interface: %d, protocol: %d, privatePort: %d.");
        goto LABEL_114;
      }

LABEL_111:
      if (*(unsigned __int16 *)(a10 + v36 + 228) != v71)
      {
        SCLog( 1LL,  6LL,  @"%s port-mapping for %s inconsistent. is Connected: %d, Previous privatePort: %d, Current privatePort %d.");
        *(_WORD *)(a10 + v36 + 228) = v71;
      }

      goto LABEL_114;
    }
  }

  else
  {
    unsigned int v56 = v35;
    SCLog( 1LL,  6LL,  @"%s port-mapping for %s inconsistent. is Connected: %d, Previous interface: %d, Current interface %d.");
    *(_DWORD *)(v49 + 220) = v56;
    int v50 = *(_DWORD *)(v49 + 224);
  }

  if (v50 == a6) {
    goto LABEL_111;
  }
  SCLog( 1LL,  6LL,  @"%s port-mapping for %s inconsistent. is Connected: %d, Previous protocol: %x, Current protocol %x.");
  *(_DWORD *)(a10 + v36 + 224) = a6;
LABEL_114:
  uint64_t v57 = a10 + v36;
  int v58 = *(_DWORD *)(a10 + v36 + 232);
  unsigned int v59 = a7;
  unsigned int v60 = v69;
  if (!*(_DWORD *)(v38 + 240))
  {
    if (v58 != v69)
    {
      SCLog( 1LL,  6LL,  @"%s port-mapping for %s initialized. is Connected: %d, Previous publicAddress: (%x), Current publicAddress %x.");
      unsigned int v60 = v69;
      unsigned int v59 = a7;
      *(_DWORD *)(v57 + 232) = v69;
    }

    if (*(unsigned __int16 *)(a10 + v36 + 236) != v70)
    {
      SCLog( 1LL,  6LL,  @"%s port-mapping for %s initialized. is Connected: %d, Previous publicPort: (%d), Current publicPort %d.");
      unsigned int v59 = a7;
      *(_WORD *)(a10 + v36 + 236) = v70;
      unsigned int v60 = *(_DWORD *)(v57 + 232);
    }

    if (!v60 || v59 && !a8) {
      return;
    }
    *(_DWORD *)(v38 + 240) = 1;
    uint64_t v20 = @"%s port-mapping for %s fully initialized. Flagging up.";
LABEL_92:
    uint64_t v21 = 6LL;
    goto LABEL_13;
  }

  if (v58 != v69)
  {
    SCLog( 1LL,  3LL,  @"%s port-mapping for %s changed. is Connected: %d, Previous publicAddress: (%x), Current publicAddress %x.");
    if (v68)
    {
      if (!a7 || a5)
      {
        uint64_t v61 = @"NAT's public address down or changed... starting faster probe.";
        goto LABEL_140;
      }
    }

    else
    {
      *(_DWORD *)(v57 + 232) = v69;
    }

    return;
  }

  if (*(unsigned __int16 *)(a10 + v36 + 236) == v70)
  {
    if (a4 != -65558) {
      return;
    }
    uint64_t v20 = @"%s port-mapping for %s hasn't changed, however there's a Double NAT.  is Connected: %d.";
LABEL_63:
    uint64_t v21 = 5LL;
LABEL_13:
    SCLog(1LL, v21, v20);
    return;
  }

  SCLog( 1LL,  3LL,  @"%s port-mapping for %s changed. is Connected: %d, Previous publicPort: (%d), Current publicPort %d.");
  if (!v68)
  {
    *(_WORD *)(a10 + v36 + 236) = v70;
    return;
  }

  if (!a7 || a8)
  {
    uint64_t v61 = @"NAT's public port down or changed... starting faster probe.";
    goto LABEL_140;
  }

uint64_t sub_294CC(uint64_t a1, uint64_t a2)
{
  if (*(_WORD *)(a2 + 64) == 1)
  {
    uint64_t result = SCLog(1LL, 3LL, @"NAT's public interface down for more than %d secs... starting faster probe.");
    if (*(_WORD *)(a2 + 64) == 1)
    {
      uint64_t result = racoon_send_cmd_start_dpd(*(_DWORD *)(a2 + 784), *(_DWORD *)(a2 + 748), v4, v5, v6, v7, v8, v9);
      *(_DWORD *)(a2 + 992) = 1;
    }
  }

  return result;
}

uint64_t ne_sm_bridge_logv()
{
  if (!qword_435D8 || !*(void *)qword_435D8) {
    return 0LL;
  }
  (*(void (**)(void))qword_435D8)();
  return 1LL;
}

uint64_t ne_sm_bridge_is_logging_at_level()
{
  else {
    return 1LL;
  }
}

uint64_t ne_sm_bridge_copy_configuration(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t ne_sm_bridge_status_changed( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_435D8)
  {
    uint64_t v8 = *(void *)(qword_435D8 + 24);
    if (v8)
    {
      uint64_t v9 = *(void *)(result + 1064);
      uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(qword_435D8 + 24);
      uint64_t v10 = scnc_getstatus(result + 8, v8, a3, a4, a5, a6, a7, a8);
      return v11(v9, v10);
    }
  }

  return result;
}

uint64_t ne_sm_bridge_acknowledge_sleep(uint64_t result)
{
  if (qword_435D8)
  {
    unsigned int v1 = *(uint64_t (**)(void))(qword_435D8 + 32);
    if (v1) {
      return v1(*(void *)(result + 1064));
    }
  }

  return result;
}

uint64_t ne_sm_bridge_filter_state_dictionaries(uint64_t result)
{
  if (qword_435D8)
  {
    unsigned int v1 = *(uint64_t (**)(void))(qword_435D8 + 40);
    if (v1) {
      return v1(*(void *)(result + 1064));
    }
  }

  return result;
}

uint64_t ne_sm_bridge_copy_password_from_keychain(uint64_t a1)
{
  else {
    return 0LL;
  }
}

void ne_sm_bridge_allow_dispose(uint64_t a1)
{
  unsigned int v1 = *(void (***)(void))(a1 + 1072);
  *(void *)(a1 + 1072) = 0LL;
  if (v1)
  {
    v1[2](v1);
    _Block_release(v1);
  }

uint64_t ne_sm_bridge_get_connect_time(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t ne_sm_bridge_request_install(uint64_t a1)
{
  if (!qword_435D8) {
    return 0LL;
  }
  unsigned int v1 = *(void (**)(void))(qword_435D8 + 64);
  if (!v1) {
    return 0LL;
  }
  v1(*(void *)(a1 + 1064));
  return 1LL;
}

uint64_t ne_sm_bridge_request_uninstall(uint64_t a1)
{
  if (!qword_435D8) {
    return 0LL;
  }
  unsigned int v1 = *(void (**)(void))(qword_435D8 + 72);
  if (!v1) {
    return 0LL;
  }
  v1(*(void *)(a1 + 1064));
  return 1LL;
}

uint64_t ne_sm_bridge_start_profile_janitor(uint64_t a1, CFStringRef theString)
{
  if (!theString) {
    return 0LL;
  }
  uint64_t result = CFStringGetCString(theString, buffer, 256LL, 0x8000100u);
  if (!(_DWORD)result) {
    return result;
  }
  if (!qword_435D8) {
    return 0LL;
  }
  uint64_t v4 = *(void (**)(void, char *))(qword_435D8 + 80);
  if (!v4) {
    return 0LL;
  }
  v4(*(void *)(a1 + 1064), buffer);
  return 1LL;
}

uint64_t ne_sm_bridge_clear_saved_password(uint64_t result)
{
  if (qword_435D8)
  {
    unsigned int v1 = *(uint64_t (**)(void))(qword_435D8 + 88);
    if (v1) {
      return v1(*(void *)(result + 1064));
    }
  }

  return result;
}

uint64_t ne_sm_bridge_copy_functions(uint64_t a1, uint64_t a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 0x40000000LL;
  v3[2] = sub_2987C;
  v3[3] = &unk_394B0;
  v3[4] = a1;
  v3[5] = a2;
  if (qword_435E0 != -1) {
    dispatch_once(&qword_435E0, v3);
  }
  return qword_435E8;
}

CFTypeRef sub_2987C(uint64_t a1)
{
  unint64_t v2 = malloc(0xB8uLL);
  qword_435E8 = (uint64_t)v2;
  *unint64_t v2 = sub_299D0;
  v2[1] = sub_29BEC;
  v2[2] = sub_29CA4;
  v2[3] = sub_29ED8;
  v2[4] = sub_29F68;
  v2[5] = sub_29FE8;
  v2[6] = sub_2A078;
  v2[7] = sub_2A0F4;
  v2[8] = sub_2A150;
  v2[9] = sub_2A1D0;
  v2[10] = sub_2A29C;
  v2[11] = sub_2A2D4;
  v2[12] = sub_2A348;
  v2[13] = sub_2A3BC;
  v2[14] = sub_2A56C;
  v2[15] = sub_2A5D0;
  v2[16] = sub_2A634;
  v2[17] = sub_2A6A0;
  v2[18] = sub_2A6CC;
  v2[19] = sub_2A6F8;
  v2[20] = sub_2A710;
  v2[21] = sub_2A728;
  v2[22] = sub_2A790;
  uint64_t v3 = malloc(0x60uLL);
  qword_435D8 = (uint64_t)v3;
  uint64_t v5 = *(_OWORD **)(a1 + 32);
  uint64_t v4 = *(const void **)(a1 + 40);
  __int128 v6 = v5[1];
  *uint64_t v3 = *v5;
  v3[1] = v6;
  __int128 v7 = v5[5];
  __int128 v9 = v5[2];
  __int128 v8 = v5[3];
  v3[4] = v5[4];
  v3[5] = v7;
  v3[2] = v9;
  v3[3] = v8;
  CFTypeRef result = CFRetain(v4);
  gBundleRef = (uint64_t)result;
  return result;
}

_BYTE *sub_299D0(int a1, const __CFString *a2, uint64_t a3)
{
  if (qword_435F0 != -1) {
    dispatch_once(&qword_435F0, &stru_394F0);
  }
  if (byte_435F8 != 1) {
    return 0LL;
  }
  __int128 v6 = malloc(0x438uLL);
  bzero(v6 + 4, 0x434uLL);
  *(_DWORD *)__int128 v6 = a1;
  *((void *)v6 + 133) = a3;
  __int128 v7 = v6 + 8;
  *((void *)v6 + 4) = CFRetain(a2);
  CFIndex v8 = CFStringGetLength(a2) + 1;
  __int128 v9 = (char *)malloc(v8);
  *((void *)v6 + 8) = v9;
  CFStringGetCString(a2, v9, v8, 0x8000100u);
  *((void *)v6 + 74) = v6;
  if (a1 == 1)
  {
    *((void *)v6 + 5) = CFRetain(kSCValNetInterfaceTypeIPSec);
    *((_WORD *)v6 + 36) = 1;
    ipsec_new_service((uint64_t)(v6 + 8));
    uint64_t v10 = ipsec_setup_service((uint64_t)(v6 + 8));
    if (!(_DWORD)v10) {
      goto LABEL_14;
    }
    sub_2A7E4(3LL, (uint64_t)@"bridge_create: ipsec_setup_service failed: %d", v11, v12, v13, v14, v15, v16, v10);
    goto LABEL_12;
  }

  if ((a1 & 0xFFFFFFFE) == 2)
  {
    *((void *)v6 + 5) = CFRetain(kSCValNetInterfaceTypePPP);
    unsigned int v17 = (CFTypeRef *)&kSCValNetInterfaceSubTypeL2TP;
    *((_WORD *)v6 + 36) = 0;
    if (a1 != 3) {
      unsigned int v17 = (CFTypeRef *)&kSCValNetInterfaceSubTypePPTP;
    }
    CFTypeRef v18 = CFRetain(*v17);
    *((void *)v6 + 6) = v18;
    *((_WORD *)v6 + 37) = ppp_subtype((unint64_t)v18);
    ppp_new_service((uint64_t)(v6 + 8));
    uint64_t v19 = ppp_setup_service((uint64_t)(v6 + 8));
    if ((_DWORD)v19)
    {
      sub_2A7E4(3LL, (uint64_t)@"bridge_create: ppp_setup_service failed: %d", v20, v21, v22, v23, v24, v25, v19);
LABEL_12:
      LOBYTE(a1) = 0;
      goto LABEL_14;
    }
  }

  LOBYTE(a1) = 1;
LABEL_14:
  int v26 = findfreeunit(*((unsigned __int16 *)v6 + 36), *((unsigned __int16 *)v6 + 37));
  *((_WORD *)v6 + 38) = v26;
  if (v26 == 0xFFFF)
  {
    sub_2A7E4(3LL, (uint64_t)@"bridge_create: findfreeunit failed", v27, v28, v29, v30, v31, v32, v36);
    unsigned int v34 = (void *)qword_436E8;
    *((void *)v6 + 1) = 0LL;
    *((void *)v6 + 2) = v34;
    void *v34 = v7;
    qword_436E8 = (uint64_t)(v6 + 8);
    goto LABEL_18;
  }

  unsigned int v33 = (void *)qword_436E8;
  *((void *)v6 + 1) = 0LL;
  *((void *)v6 + 2) = v33;
  void *v33 = v7;
  qword_436E8 = (uint64_t)(v6 + 8);
  if ((a1 & 1) == 0)
  {
LABEL_18:
    sub_29BEC(v6);
    return 0LL;
  }

  v6[24] = 1;
  return v6;
}

void sub_29BEC(void *a1)
{
  if ((*(_DWORD *)a1 - 2) >= 2)
  {
    if (*(_DWORD *)a1 == 1) {
      ipsec_dispose_service((uint64_t)a1 + 8);
    }
  }

  else
  {
    ppp_dispose_service((uint64_t)a1 + 8);
  }

  CFRelease(*((CFTypeRef *)a1 + 4));
  CFRelease(*((CFTypeRef *)a1 + 5));
  unint64_t v2 = (const void *)*((void *)a1 + 6);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *((void *)a1 + 1);
  uint64_t v4 = (void *)*((void *)a1 + 2);
  if (v3)
  {
    *(void *)(v3 + 8) = v4;
    uint64_t v4 = (void *)*((void *)a1 + 2);
  }

  else
  {
    qword_436E8 = *((void *)a1 + 2);
  }

  *uint64_t v4 = v3;
  uint64_t v5 = (const void *)*((void *)a1 + 134);
  if (v5) {
    _Block_release(v5);
  }
  __int128 v6 = (void *)*((void *)a1 + 65);
  if (v6) {
    free(v6);
  }
  __int128 v7 = (void *)*((void *)a1 + 66);
  if (v7) {
    free(v7);
  }
  free(*((void **)a1 + 8));
  free(a1);
}

void sub_29CA4( _DWORD *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*a1 == 1)
  {
    char v8 = a3;
    uint64_t v10 = (uint64_t)(a1 + 2);
    if (scnc_getstatus((uint64_t)(a1 + 2), (uint64_t)a2, a3, a4, a5, a6, a7, a8))
    {
      memset(v46, 0, sizeof(v46));
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v43 = 0u;
      if ((v8 & 1) != 0)
      {
        uint64_t v40 = 0LL;
        uint64_t v41 = 512LL;
        uint64_t v42 = 0LL;
        strncpy(__dst, a2, 0xFuLL);
        int v11 = socket(2, 2, 0);
        int v12 = ioctl(v11, 0xC0206921uLL, __dst);
        close(v11);
        if (v12 < 0)
        {
          uint64_t v31 = __error();
          uint64_t v32 = strerror(*v31);
          sub_2A7E4(3LL, (uint64_t)@"ioctl(SIOCGIFADDR) failed: %s", v33, v34, v35, v36, v37, v38, (uint64_t)v32);
          return;
        }

        LODWORD(v46[0]) = HIDWORD(v41);
      }

      uint64_t v13 = -1LL;
      do
      {
        int v14 = a2[++v13];
        if (v14) {
          BOOL v15 = (v14 - 58) >= 0xFFFFFFF6;
        }
        else {
          BOOL v15 = 1;
        }
      }

      while (!v15);
      uint64_t v16 = &a2[v13];
      __strncpy_chk(&v45, a2);
      if ((_DWORD)v45 == 7368816) {
        DWORD2(vmemset(v5, 0, 44) = 6;
      }
      if ((v8 & 1) != 0) {
        int v23 = 1;
      }
      else {
        int v23 = 3;
      }
      DWORD1(vmemset(v5, 0, 44) = v23;
      if (qword_435D8)
      {
        uint64_t v24 = *(unsigned int (**)(uint64_t))(qword_435D8 + 8);
        if (v24)
        {
          if (!v24(7LL))
          {
LABEL_27:
            ipsec_network_event(v10, (uint64_t)&v43);
            return;
          }

          int v23 = DWORD1(v44);
        }
      }

      if (v23 == 3)
      {
        sub_2A7E4( 7LL,  (uint64_t)@"Network change event: deleted address from interface %s%d (family %d)",  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)&v45);
      }

      else if (v23 == 1)
      {
        *(void *)__dst = 0LL;
        uint64_t v40 = 0LL;
        inet_ntop(2, v46, __dst, 0x10u);
        sub_2A7E4( 7LL,  (uint64_t)@"Network change event: added address %s to interface %s%d (family %d)",  v25,  v26,  v27,  v28,  v29,  v30,  (uint64_t)__dst);
      }

      goto LABEL_27;
    }
  }

BOOL sub_29ED8( _DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  else {
    BOOL v9 = (int)ppp_will_sleep((uint64_t)(a1 + 2), 0) > 0;
  }
  sub_2A7E4( 7LL,  (uint64_t)@"handle sleep for bridge type %d returning %d",  a3,  a4,  a5,  a6,  a7,  a8,  *a1);
  return v9;
}

BOOL sub_29F68( _DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((*a1 - 2) >= 2)
  {
    if (*a1 != 1)
    {
      BOOL v10 = 1LL;
      goto LABEL_7;
    }

    BOOL can_sleep = ipsec_can_sleep((uint64_t)(a1 + 2));
  }

  else
  {
    BOOL can_sleep = ppp_can_sleep((uint64_t)(a1 + 2));
  }

  BOOL v10 = can_sleep;
LABEL_7:
  sub_2A7E4(7LL, (uint64_t)@"can sleep for bridge type %d returning %d", a3, a4, a5, a6, a7, a8, *a1);
  return v10;
}

uint64_t sub_29FE8( uint64_t a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t result = sub_2A7E4(6LL, (uint64_t)@"System slept for %f secs", a4, a5, a6, a7, a8, a9, *(uint64_t *)&a2);
  if ((*(_BYTE *)(a1 + 83) & 8) != 0)
  {
    uint64_t result = sub_2A7E4( 6LL,  (uint64_t)@"Session is configured to disconnect on wake if slept for more than %f seconds",  v12,  v13,  v14,  v15,  v16,  v17,  0LL);
    *(_DWORD *)(a1 + 200) += a2;
    if (a2 > 0.0) {
      return scnc_idle_disconnect(a1 + 8, v18, v19, v20, v21, v22, v23, v24);
    }
  }

  return result;
}

_DWORD *sub_2A078( unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = (_DWORD *)sub_2A7E4(5LL, (uint64_t)@"Handling wake up for bridge type %d", a3, a4, a5, a6, a7, a8, *a1);
  if (*a1 - 2 < 2) {
    return ppp_wake_up(a1 + 2);
  }
  if (*a1 == 1) {
    return (_DWORD *)ipsec_wake_up((uint64_t)(a1 + 2));
  }
  return result;
}

BOOL sub_2A0F4(_DWORD *a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if ((*a1 - 2) < 2)
  {
    int v7 = ppp_start((unint64_t)(a1 + 2), a2, a3, a4, a5, a6, 0LL, a7);
    return v7 == 0;
  }

  if (*a1 == 1)
  {
    int v7 = ipsec_start((uint64_t)(a1 + 2), a2, a3, a4, a5, 0LL, a7, a7);
    return v7 == 0;
  }

  return 0LL;
}

BOOL sub_2A150( unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*a1 - 2 < 2)
  {
    int v15 = ppp_stop(a1 + 2, 15);
    return v15 == 0;
  }

  if (*a1 == 1)
  {
    int v15 = ipsec_stop((uint64_t)(a1 + 2), 0LL, v9, v10, v11, v12, v13, v14);
    return v15 == 0;
  }

  return 0LL;
}

void sub_2A1D0(_DWORD *a1, xpc_object_t xdict, _DWORD *a3, _DWORD *a4)
{
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(xdict);
  char v8 = (void *)xpc_connection_copy_entitlement_value(remote_connection, "com.apple.private.nesessionmanager.privileged");
  uint64_t v9 = v8;
  if (*a1 == 3)
  {
    if (!v8)
    {
      *a3 = 0;
      *a4 = 0;
      return;
    }

    goto LABEL_11;
  }

  if (*a1 == 2 && v8 != 0LL)
  {
LABEL_11:
    if (xpc_get_type(v8) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v9))
    {
      *a3 = a1[26];
      int v11 = a1[27];
    }

    else
    {
      int v11 = 0;
      *a3 = 0;
    }

    *a4 = v11;
    goto LABEL_16;
  }

  *a3 = 0;
  *a4 = 0;
  if (v8) {
LABEL_16:
  }
    xpc_release(v9);
}

void *sub_2A29C(uint64_t a1, void *aBlock)
{
  uint64_t v4 = *(const void **)(a1 + 1072);
  if (v4) {
    _Block_release(v4);
  }
  uint64_t result = _Block_copy(aBlock);
  *(void *)(a1 + 1072) = result;
  return result;
}

uint64_t sub_2A2D4(_DWORD *a1)
{
  uint64_t v10 = 0LL;
  if ((*a1 - 2) < 2)
  {
    int v1 = ppp_copystatistics((uint64_t)(a1 + 2), &v10);
    if (!v1) {
      return v10;
    }
    goto LABEL_6;
  }

  if (*a1 == 1)
  {
    int v1 = ipsec_copystatistics((uint64_t)(a1 + 2), &v10);
    if (v1)
    {
LABEL_6:
      unint64_t v2 = strerror(v1);
      sub_2A7E4(5LL, (uint64_t)@"Failed to copy statistics: %s", v3, v4, v5, v6, v7, v8, (uint64_t)v2);
    }
  }

  return v10;
}

uint64_t sub_2A348(_DWORD *a1)
{
  uint64_t v10 = 0LL;
  if ((*a1 - 2) < 2)
  {
    int v1 = ppp_copyextendedstatus((uint64_t)(a1 + 2), &v10);
    if (!v1) {
      return v10;
    }
    goto LABEL_6;
  }

  if (*a1 == 1)
  {
    int v1 = ipsec_copyextendedstatus((uint64_t)(a1 + 2), &v10);
    if (v1)
    {
LABEL_6:
      unint64_t v2 = strerror(v1);
      sub_2A7E4(5LL, (uint64_t)@"Failed to copy extended status: %s", v3, v4, v5, v6, v7, v8, (uint64_t)v2);
    }
  }

  return v10;
}

__CFDictionary *sub_2A3BC(uint64_t a1, xpc_object_t xdict)
{
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(xdict);
  else {
    uint64_t v5 = 0LL;
  }
  CFStringRef value = 0LL;
  if ((*(_DWORD *)a1 - 2) >= 2)
  {
    if (*(_DWORD *)a1 != 1)
    {
      int v10 = 0;
      goto LABEL_17;
    }

    int v9 = ipsec_getconnectdata(a1 + 8, (CFTypeRef *)&value, 0);
LABEL_16:
    int v10 = v9;
    goto LABEL_17;
  }

  uint64_t v6 = (void *)xpc_connection_copy_entitlement_value(remote_connection, "com.apple.private.nesessionmanager.privileged");
  if (!v6)
  {
    int v9 = ppp_getconnectdata(a1 + 8, (CFTypeRef *)&value, 0);
    goto LABEL_16;
  }

  uint64_t v7 = v6;
  BOOL v8 = xpc_get_type(v6) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v7);
  int v10 = ppp_getconnectdata(a1 + 8, (CFTypeRef *)&value, v8);
  xpc_release(v7);
LABEL_17:
  CFMutableDictionaryRef Mutable = 0LL;
  uint64_t v12 = value;
  if (!v10 && value)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(Mutable, @"SessionLegacyUserConfiguration", value);
    uint64_t v12 = value;
  }

  if (v12) {
    CFRelease(v12);
  }
  if (v5)
  {
    if (!Mutable) {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    }
    CFDictionarySetValue(Mutable, @"SessionLegacyServiceConfiguration", v5);
    CFRelease(v5);
  }

  return Mutable;
}

_DWORD *sub_2A56C(_DWORD *result)
{
  if ((*result - 2) < 2)
  {
    uint64_t result = (_DWORD *)ppp_install((uint64_t)(result + 2));
    if (!(_DWORD)result) {
      return result;
    }
LABEL_6:
    int v1 = strerror((int)result);
    return (_DWORD *)sub_2A7E4(5LL, (uint64_t)@"Failed to install: %s", v2, v3, v4, v5, v6, v7, (uint64_t)v1);
  }

  if (*result == 1)
  {
    uint64_t result = (_DWORD *)ipsec_install((uint64_t)(result + 2));
    if ((_DWORD)result) {
      goto LABEL_6;
    }
  }

  return result;
}

_DWORD *sub_2A5D0(_DWORD *result)
{
  if ((*result - 2) < 2)
  {
    uint64_t result = (_DWORD *)ppp_uninstall((uint64_t)(result + 2));
    if (!(_DWORD)result) {
      return result;
    }
LABEL_6:
    int v1 = strerror((int)result);
    return (_DWORD *)sub_2A7E4(5LL, (uint64_t)@"Failed to uninstall: %s", v2, v3, v4, v5, v6, v7, (uint64_t)v1);
  }

  if (*result == 1)
  {
    uint64_t result = (_DWORD *)ipsec_uninstall((uint64_t)(result + 2));
    if ((_DWORD)result) {
      goto LABEL_6;
    }
  }

  return result;
}

_DWORD *sub_2A634(_DWORD *result)
{
  if ((*result - 2) >= 2)
  {
    if (*result == 1)
    {
      uint64_t result = (_DWORD *)ipsec_setup_service((uint64_t)(result + 2));
      if ((_DWORD)result) {
        return (_DWORD *)sub_2A7E4( 3LL,  (uint64_t)@"bridge_create: ipsec_setup_service failed: %d",  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)result);
      }
    }
  }

  else
  {
    uint64_t result = (_DWORD *)ppp_setup_service((uint64_t)(result + 2));
    if ((_DWORD)result) {
      return (_DWORD *)sub_2A7E4( 3LL,  (uint64_t)@"bridge_create: ppp_setup_service failed: %d",  v1,  v2,  v3,  v4,  v5,  v6,  (uint64_t)result);
    }
  }

  return result;
}

_DWORD *sub_2A6A0(_DWORD *result)
{
  if (*result == 1) {
    return (_DWORD *)ipsec_log_out((uint64_t)(result + 2));
  }
  return result;
}

_DWORD *sub_2A6CC(_DWORD *result)
{
  if (*result == 1) {
    return (_DWORD *)ipsec_log_switch((uint64_t)(result + 2));
  }
  return result;
}

_DWORD *sub_2A6F8(_DWORD *result)
{
  if (*result == 1) {
    return (_DWORD *)ipsec_device_lock(result + 2);
  }
  return result;
}

_DWORD *sub_2A710(_DWORD *result)
{
  if (*result == 1) {
    return (_DWORD *)ipsec_device_unlock((uint64_t)(result + 2));
  }
  return result;
}

CFTypeID sub_2A728(_DWORD *a1, const void *a2)
{
  CFTypeID result = CFDictionaryGetTypeID();
  if (a2)
  {
    CFTypeID v5 = result;
    CFTypeID result = CFGetTypeID(a2);
    if (result == v5 && *a1 == 1) {
      return ipsec_set_initial_values((uint64_t)(a1 + 2), a2);
    }
  }

  return result;
}

FILE *sub_2A790(FILE *result, _DWORD *a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    CFTypeID result = racoon_pid();
    *a2 = (_DWORD)result;
    if ((LODWORD(v3->_p) - 2) >= 2)
    {
      if (LODWORD(v3->_p) != 1) {
        return result;
      }
      int r = 0;
    }

    else
    {
      int r = v3[4]._r;
    }

    a2[1] = r;
  }

  return result;
}

uint64_t sub_2A7E4( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (qword_435D8)
  {
    if (*(void *)qword_435D8) {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *))qword_435D8)(result, a2, &a9);
    }
  }

  return result;
}

void sub_2A820(id a1)
{
  values = kCFBooleanTrue;
  keys = (void *)kSCDynamicStoreUseSessionKeys;
  scnc_init_resources((__CFBundle *)gBundleRef);
  if (mach_timebase_info(&info))
  {
    sub_2A7E4(3LL, (uint64_t)@"init_controller: mach_timebase_info failed", v1, v2, v3, v4, v5, v6, v18);
    return;
  }

  LODWORD(v7) = info.numer;
  LODWORD(v8) = info.denom;
  *(double *)&gTimeScaleSeconds = (double)v7 / (double)v8 / 1000000000.0;
  uint64_t v9 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)&keys,  (const void **)&values,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  gDynamicStore = (uint64_t)SCDynamicStoreCreateWithOptions(kCFAllocatorDefault, @"NE - SCNC bridge", v9, 0LL, 0LL);
  if (gDynamicStore)
  {
    service_head = 0LL;
    qword_436E8 = (uint64_t)&service_head;
    client_init_all();
    ipsec_init_things();
    byte_435F8 = 1;
    if (!v9) {
      return;
    }
  }

  else
  {
    int v10 = SCError();
    uint64_t v11 = SCErrorString(v10);
    sub_2A7E4( 3LL,  (uint64_t)@"init_controller: SCDynamicStoreCreateWithOptions failed: %s",  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)v11);
    if (!v9) {
      return;
    }
  }

  CFRelease(v9);
}

uint64_t setup_security_context()
{
  kern_return_t v0;
  uint64_t v1;
  __int128 v3;
  int v4;
  mach_port_name_t v5;
  mach_port_t sp[2];
  *(void *)sp = 0LL;
  uint64_t v5 = 0;
  int v0 = bootstrap_look_up(bootstrap_port, "com.apple.SystemConfiguration.PPPController-priv", &sp[1]);
  if (v0)
  {
    if (v0 == 1102) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 4294967294LL;
    }
  }

  else
  {
    uint64_t v1 = sub_2CAB0(sp[1], sp, &v5, &v4, &v3);
    mach_port_deallocate(mach_task_self_, sp[1]);
    if (!(_DWORD)v1)
    {
      if (!sp[0]
        || (uint64_t v1 = task_set_special_port(mach_task_self_, 4, sp[0]),
            mach_port_deallocate(mach_task_self_, sp[0]),
            !(_DWORD)v1))
      {
        if (v5)
        {
          if (!audit_session_join(v5)) {
            return 4294967293LL;
          }
          mach_port_deallocate(mach_task_self_, v5);
        }

        return 0LL;
      }
    }
  }

  return v1;
}

uint64_t controller_options_get_onDemandPauseIntervalOnAuthCancel()
{
  return dword_40408;
}

uint64_t controller_options_is_onDemandPauseUntilNetChangeCheckWakeup()
{
  return byte_4040C;
}

uint64_t controller_options_is_onDemandPauseUntilNetChangeCheckSignature()
{
  return byte_4040D;
}

uint64_t controller_options_is_onDemandAutoPauseUponDisconnect()
{
  return byte_4040E;
}

uint64_t controller_options_is_useVODDisconnectRulesWhenVODDisabled()
{
  return byte_43600;
}

uint64_t controller_options_get_onDemandBlacklistedProcesses()
{
  return qword_43608;
}

void controller_options_modify_ondemand()
{
  uint64_t v1 = 0LL;
  uint64_t v2 = &v1;
  uint64_t v3 = 0x2000000000LL;
  char v4 = 1;
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_2AB8C;
  block[3] = &unk_39518;
  block[4] = &v1;
  if (qword_43618 != -1) {
    dispatch_once(&qword_43618, block);
  }
  if (*((_BYTE *)v2 + 24))
  {
    sub_2AD20(*(const __SCPreferences **)qword_43610);
    SCPreferencesSynchronize(*(SCPreferencesRef *)qword_43610);
  }

  _Block_object_dispose(&v1, 8);
}

void sub_2AB8C(uint64_t a1)
{
  qword_43610 = (uint64_t)CFAllocatorAllocate(kCFAllocatorDefault, 8LL, 0LL);
  uint64_t v2 = SCPreferencesCreate(kCFAllocatorDefault, @"PPPController", @"com.apple.pppcontroller-options.plist");
  uint64_t v3 = (void *)qword_43610;
  *(void *)qword_43610 = v2;
  if (v2)
  {
    context.version = 0LL;
    memset(&context.retain, 0, 24);
    context.mach_timebase_info info = v3;
    if (SCPreferencesSetCallback(v2, (SCPreferencesCallBack)sub_2ACD8, &context))
    {
      char v4 = *(const __SCPreferences **)qword_43610;
      CFAbsoluteTime Current = CFRunLoopGetCurrent();
      if (SCPreferencesScheduleWithRunLoop(v4, Current, kCFRunLoopDefaultMode)) {
        goto LABEL_8;
      }
      int v6 = SCError();
      SCErrorString(v6);
      unint64_t v7 = @"SCPreferencesSetDispatchQueue failed: %s";
    }

    else
    {
      int v9 = SCError();
      SCErrorString(v9);
      unint64_t v7 = @"SCPreferencesSetCallback failed: %s";
    }
  }

  else
  {
    int v8 = SCError();
    SCErrorString(v8);
    unint64_t v7 = @"SCPreferencesCreate failed: %s";
  }

  SCLog(1LL, 3LL, v7);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
LABEL_8:
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    int v10 = (void *)qword_43610;
    if (*(void *)qword_43610)
    {
      CFRelease(*(CFTypeRef *)qword_43610);
      int v10 = (void *)qword_43610;
    }

    CFAllocatorDeallocate(kCFAllocatorDefault, v10);
    qword_43610 = 0LL;
  }

void sub_2ACD8(const __SCPreferences *a1, int a2)
{
  if (a2 == 1)
  {
    SCLog(1LL, 7LL, @"controller option commmit notification: update the config");
    sub_2AD20(a1);
    SCPreferencesSynchronize(a1);
  }

const void *sub_2AD20(const __SCPreferences *a1)
{
  unint64_t Value = (const __CFBoolean *)SCPreferencesGetValue(a1, @"Debug");
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID)
  {
    int v4 = CFBooleanGetValue(Value);
    SCLog(1LL, 7LL, @"PPPController option: Debug %d\n");
  }

  else
  {
    SCLog(1LL, 7LL, @"PPPController option: Debug option %s\n");
    int v4 = 0;
  }

  gSCNCVerbose = _sc_verbose | v4;
  gSCNCDebug = v4;
  dword_40408 = 10;
  uint64_t v5 = (const __CFNumber *)SCPreferencesGetValue(a1, @"OnDemandPauseIntervalOnAuthCancel");
  CFTypeID v6 = CFNumberGetTypeID();
  if (v5 && CFGetTypeID(v5) == v6)
  {
    CFNumberGetValue(v5, kCFNumberSInt32Type, &dword_40408);
    unint64_t v7 = @"PPPController option: OnDemandPauseIntervalOnAuthCancel interval %d\n";
  }

  else
  {
    unint64_t v7 = @"PPPController option: OnDemandPauseIntervalOnAuthCancel option %s\n";
  }

  SCLog(1LL, 7LL, v7);
  byte_4040C = 1;
  int v8 = (const __CFBoolean *)SCPreferencesGetValue(a1, @"PauseUntilNetChangeCheckWakeup");
  CFTypeID v9 = CFBooleanGetTypeID();
  if (v8 && CFGetTypeID(v8) == v9)
  {
    byte_4040C = CFBooleanGetValue(v8);
    int v10 = @"PPPController option: PauseUntilNetChangeCheckWakeup %d\n";
  }

  else
  {
    int v10 = @"PPPController option: PauseUntilNetChangeCheckWakeup option %s\n";
  }

  SCLog(1LL, 7LL, v10);
  byte_4040D = 1;
  uint64_t v11 = (const __CFBoolean *)SCPreferencesGetValue(a1, @"PauseUntilNetChangeCheckNetSignature");
  CFTypeID v12 = CFBooleanGetTypeID();
  if (v11 && CFGetTypeID(v11) == v12)
  {
    byte_4040D = CFBooleanGetValue(v11);
    uint64_t v13 = @"PPPController option: PauseUntilNetChangeCheckNetSignature %d\n";
  }

  else
  {
    uint64_t v13 = @"PPPController option: PauseUntilNetChangeCheckNetSignature option %s\n";
  }

  SCLog(1LL, 7LL, v13);
  byte_4040E = 1;
  uint64_t v14 = (const __CFBoolean *)SCPreferencesGetValue(a1, @"OnDemandAutoPauseUponDisconnect");
  CFTypeID v15 = CFBooleanGetTypeID();
  if (v14 && CFGetTypeID(v14) == v15)
  {
    byte_4040E = CFBooleanGetValue(v14);
    uint64_t v16 = @"PPPController option: OnDemandAutoPauseUponDisconnect %d\n";
  }

  else
  {
    uint64_t v16 = @"PPPController option: OnDemandAutoPauseUponDisconnect option %s\n";
  }

  SCLog(1LL, 7LL, v16);
  if (qword_43608) {
    CFRelease((CFTypeRef)qword_43608);
  }
  qword_43608 = 0LL;
  uint64_t v17 = (const __CFArray *)SCPreferencesGetValue(a1, @"OnDemandBlacklistedProcesses");
  CFTypeID v18 = CFArrayGetTypeID();
  if (v17 && CFGetTypeID(v17) == v18)
  {
    CFIndex Count = CFArrayGetCount(v17);
    if (Count < 1)
    {
LABEL_30:
      qword_43608 = (uint64_t)CFArrayCreateCopy(kCFAllocatorDefault, v17);
    }

    else
    {
      CFIndex v20 = Count;
      CFIndex v21 = 0LL;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v17, v21);
        CFTypeID v23 = CFStringGetTypeID();
        if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != v23) {
          break;
        }
        if (v20 == ++v21) {
          goto LABEL_30;
        }
      }
    }
  }

  else
  {
    SCLog(1LL, 7LL, @"PPPController option: OnDemandBlacklistedProcesses option %s\n");
  }

  int v24 = byte_43600;
  byte_43600 = 0;
  uint64_t v25 = (const __CFBoolean *)SCPreferencesGetValue(a1, @"UseVODDisconnectRulesWhenVODDisabled");
  CFTypeID v26 = CFBooleanGetTypeID();
  if (v25 && CFGetTypeID(v25) == v26)
  {
    byte_43600 = CFBooleanGetValue(v25);
    uint64_t v27 = @"PPPController option: UseVODDisconnectRulesWhenVODDisabled %d\n";
  }

  else
  {
    uint64_t v27 = @"PPPController option: UseVODDisconnectRulesWhenVODDisabled option %s\n";
  }

  CFTypeID result = (const void *)SCLog(1LL, 7LL, v27);
  if (byte_43600 != v24)
  {
    uint64_t v29 = (void *)service_head;
    if (service_head)
    {
      uint64_t v30 = (const void *)kSCPropNetVPNOnDemandRules;
      do
      {
        uint64_t v31 = v29;
        uint64_t v29 = (void *)*v29;
        int v32 = *((_DWORD *)v31 + 18);
        if ((v32 & 0x200000) == 0)
        {
          if (!byte_43600)
          {
            unsigned int v33 = v32 & 0xFEFFFFFF;
            goto LABEL_44;
          }

          CFTypeID result = CFDictionaryGetValue((CFDictionaryRef)v31[17], v30);
          if (result)
          {
            unsigned int v33 = *((_DWORD *)v31 + 18) | 0x1000000;
LABEL_44:
            *((_DWORD *)v31 + 18) = v33;
          }
        }
      }

      while (v29);
    }
  }

  return result;
}

void reachability_init(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_2B28C;
  block[3] = &unk_39540;
  void block[5] = a1;
  block[6] = a2;
  block[4] = a3;
  if (qword_43620 != -1) {
    dispatch_once(&qword_43620, block);
  }
}

void *sub_2B28C(uint64_t a1)
{
  qword_43628 = (uint64_t)dispatch_queue_create("PPPController reachability dispatch queue", 0LL);
  qword_43630 = *(void *)(a1 + 40);
  CFRetain((CFTypeRef)qword_43630);
  qword_43638 = *(void *)(a1 + 48);
  CFRetain((CFTypeRef)qword_43638);
  CFTypeID result = _Block_copy(*(const void **)(a1 + 32));
  qword_43640 = (uint64_t)result;
  return result;
}

double reachability_clear(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 536);
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_2B894;
    block[3] = &unk_395C0;
    block[4] = v2;
    dispatch_async((dispatch_queue_t)qword_43628, block);
  }

  *(void *)(a1 + 536) = 0LL;
  double result = NAN;
  *(void *)(a1 + 5memset(v5, 0, 44) = 0xFFFFFFFF00000000LL;
  return result;
}

void reachability_reset(uint64_t a1)
{
  uint64_t v2 = scnc_copy_remote_server(a1, 0LL);
  CFTypeID TypeID = CFStringGetTypeID();
  if (v2 && CFGetTypeID(v2) == TypeID && CFStringGetLength(v2) >= 1)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v17 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    *(_OWORD *)bytes = 0u;
    CFIndex Length = CFStringGetLength(v2);
    uint64_t v5 = (char *)CFAllocatorAllocate(kCFAllocatorDefault, Length + 1, 0LL);
    CFStringGetCString(v2, v5, Length, 0x600u);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    if (inet_pton(2, v5, &bytes[4]) == 1)
    {
      *(_WORD *)bytes = 528;
      unint64_t v7 = kCFAllocatorDefault;
      CFIndex v8 = 16LL;
    }

    else
    {
      if (inet_pton(30, v5, &bytes[8]) != 1)
      {
        CFDictionarySetValue(Mutable, @"nodename", v2);
        goto LABEL_10;
      }

      *(_WORD *)bytes = 7708;
      unint64_t v7 = kCFAllocatorDefault;
      CFIndex v8 = 28LL;
    }

    CFDataRef v9 = CFDataCreate(v7, bytes, v8);
    CFDictionarySetValue(Mutable, @"remote-address", v9);
    CFRelease(v9);
LABEL_10:
    CFRelease(v2);
    CFAllocatorDeallocate(kCFAllocatorDefault, v5);
    CFDictionarySetValue(Mutable, @"ConnectionOnDemandBypass", kCFBooleanTrue);
    int v10 = *(const void **)(a1 + 24);
    CFRetain(v10);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_2B5A8;
    block[3] = &unk_395A0;
    block[4] = Mutable;
    void block[5] = v10;
    block[6] = v2;
    dispatch_async((dispatch_queue_t)qword_43628, block);
  }

void sub_2B5A8(uint64_t a1)
{
  uint64_t v2 = (const __SCNetworkReachability *)SCNetworkReachabilityCreateWithOptions( kCFAllocatorDefault,  *(void *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    context.version = 0LL;
    context.mach_timebase_info info = v3;
    context.retain = (const void *(__cdecl *)(const void *))&_CFRetain;
    context.release = (void (__cdecl *)(const void *))&_CFRelease;
    context.copyDescription = (CFStringRef (__cdecl *)(const void *))&CFCopyDescription;
    SCNetworkReachabilitySetCallback(v2, (SCNetworkReachabilityCallBack)sub_2B6C0, &context);
    SCNetworkReachabilitySetDispatchQueue(v2, (dispatch_queue_t)qword_43628);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_2B770;
    block[3] = &unk_39580;
    block[4] = *(void *)(a1 + 40);
    void block[5] = v2;
    CFRunLoopPerformBlock((CFRunLoopRef)qword_43630, (CFTypeRef)qword_43638, block);
    CFRunLoopWakeUp((CFRunLoopRef)qword_43630);
  }

  else
  {
    SCLog(1LL, 3LL, @"reset_reachability: failed to create a reachability target for %@");
  }

  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void sub_2B6C0(const void *a1, SCNetworkReachabilityFlags a2, const void *a3)
{
  SCNetworkReachabilityFlags flags = a2;
  CFRetain(a1);
  CFRetain(a3);
  SCNetworkReachabilityGetFlags((SCNetworkReachabilityRef)a1, &flags);
  int InterfaceIndex = SCNetworkReachabilityGetInterfaceIndex(a1);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 0x40000000LL;
  int v6[2] = sub_2B8D0;
  v6[3] = &unk_395E0;
  int v6[4] = a3;
  v6[5] = a1;
  SCNetworkReachabilityFlags v7 = flags;
  int v8 = InterfaceIndex;
  CFRunLoopPerformBlock((CFRunLoopRef)qword_43630, (CFTypeRef)qword_43638, v6);
  CFRunLoopWakeUp((CFRunLoopRef)qword_43630);
}

void sub_2B770(uint64_t a1)
{
  uint64_t v2 = findbyserviceID(*(CFStringRef *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = v2[67];
    if (v4)
    {
      block = _NSConcreteStackBlock;
      uint64_t v11 = 0x40000000LL;
      CFTypeID v12 = sub_2B894;
      __int128 v13 = &unk_395C0;
      uint64_t v14 = v4;
      dispatch_async((dispatch_queue_t)qword_43628, &block);
      v3[67] = 0LL;
    }

    v3[67] = *(void *)(a1 + 40);
    uint64_t v5 = (dispatch_queue_s *)qword_43628;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 0x40000000LL;
    v8[2] = sub_2B884;
    v8[3] = &unk_39560;
    int8x16_t v9 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    p_block = (void ***)v8;
  }

  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v5 = (dispatch_queue_s *)qword_43628;
    block = _NSConcreteStackBlock;
    uint64_t v11 = 0x40000000LL;
    CFTypeID v12 = sub_2B894;
    __int128 v13 = &unk_395C0;
    uint64_t v14 = v7;
    p_block = &block;
  }

  dispatch_async(v5, p_block);
}

void sub_2B884(uint64_t a1)
{
}

void sub_2B894(uint64_t a1)
{
}

void sub_2B8D0(uint64_t a1)
{
  uint64_t v2 = findbyserviceID(*(CFStringRef *)(a1 + 32));
  if (v2 && v2[67] == *(void *)(a1 + 40))
  {
    *((_DWORD *)v2 + 136) = *(_DWORD *)(a1 + 48);
    *((_DWORD *)v2 + 137) = *(_DWORD *)(a1 + 52);
    (*(void (**)(void))(qword_43640 + 16))();
  }

  CFRelease(*(CFTypeRef *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t sub_2B938(mach_port_t a1, uint64_t a2, int a3, int a4, int a5, int a6, _DWORD *a7, _DWORD *a8)
{
  int v17 = 4;
  uint64_t v18 = a2;
  int v19 = 16777472;
  int v20 = a3;
  int v21 = a4;
  int v23 = 1245184;
  int v24 = a5;
  int v25 = 1114112;
  int v26 = a6;
  int v27 = 1245184;
  NDR_record_t v28 = NDR_record;
  int v29 = a3;
  reply_CFMachPortRef port = mig_get_reply_port();
  msg.msgh_remote_CFMachPortRef port = a1;
  msg.msgh_local_CFMachPortRef port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_CFMachPortRef port = 0x465000000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    reply_CFMachPortRef port = msg.msgh_local_port;
  }

  uint64_t v12 = mach_msg(&msg, 3, 0x5Cu, 0x3Cu, reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v12)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v13 = 4294966988LL;
      }

      else if (msg.msgh_id == 18100)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v13 = 4294966996LL;
          if (v17 == 1 && msg.msgh_size == 52 && !msg.msgh_remote_port && HIWORD(v19) << 16 == 1114112)
          {
            uint64_t v13 = 0LL;
            int v14 = v22;
            *a7 = v18;
            *a8 = v14;
            return v13;
          }
        }

        else if (msg.msgh_size == 36)
        {
          uint64_t v13 = 4294966996LL;
          if (HIDWORD(v18))
          {
            if (msg.msgh_remote_port) {
              uint64_t v13 = 4294966996LL;
            }
            else {
              uint64_t v13 = HIDWORD(v18);
            }
          }
        }

        else
        {
          uint64_t v13 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v13 = 4294966995LL;
      }

      mach_msg_destroy(&msg);
      return v13;
    }

    mig_dealloc_reply_port(msg.msgh_local_port);
  }

  return v13;
}

uint64_t sub_2BB24(mach_port_t a1, _DWORD *a2, _DWORD *a3)
{
  reply_CFMachPortRef port = mig_get_reply_port();
  msg.msgh_remote_CFMachPortRef port = a1;
  msg.msgh_local_CFMachPortRef port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_CFMachPortRef port = 0x465100000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    reply_CFMachPortRef port = msg.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&msg, 3, 0x18u, 0x34u, reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v7)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v8;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v8 = 4294966988LL;
    }

    else if (msg.msgh_id == 18101)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 44)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v8 = v13;
            if (!v13)
            {
              int v11 = v15;
              *a2 = v14;
              *a3 = v11;
              return v8;
            }

            goto LABEL_23;
          }
        }

        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v9 = 1;
          }
          else {
            BOOL v9 = v13 == 0;
          }
          if (v9) {
            uint64_t v8 = 4294966996LL;
          }
          else {
            uint64_t v8 = v13;
          }
          goto LABEL_23;
        }
      }

      uint64_t v8 = 4294966996LL;
    }

    else
    {
      uint64_t v8 = 4294966995LL;
    }

uint64_t sub_2BC84(mach_port_t a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  reply_CFMachPortRef port = mig_get_reply_port();
  msg.msgh_remote_CFMachPortRef port = a1;
  msg.msgh_local_CFMachPortRef port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_CFMachPortRef port = 0x465200000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    reply_CFMachPortRef port = msg.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&msg, 3, 0x18u, 0x44u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (msg.msgh_id == 18102)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v10 = 4294966996LL;
          if (v14 == 1 && msg.msgh_size == 60 && !msg.msgh_remote_port && v16 == 1)
          {
            int v11 = v17;
            if (v17 == v18)
            {
              uint64_t v10 = 0LL;
              *a2 = v15;
              *a3 = v11;
              *a4 = v19;
              return v10;
            }
          }
        }

        else if (msg.msgh_size == 36)
        {
          uint64_t v10 = 4294966996LL;
          if (HIDWORD(v15))
          {
            if (msg.msgh_remote_port) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
          }
        }

        else
        {
          uint64_t v10 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

      mach_msg_destroy(&msg);
      return v10;
    }

    mig_dealloc_reply_port(msg.msgh_local_port);
  }

  return v10;
}

uint64_t sub_2BE40(mach_port_t a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  reply_CFMachPortRef port = mig_get_reply_port();
  msg.msgh_remote_CFMachPortRef port = a1;
  msg.msgh_local_CFMachPortRef port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_CFMachPortRef port = 0x465300000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    reply_CFMachPortRef port = msg.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&msg, 3, 0x18u, 0x44u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (msg.msgh_id == 18103)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v10 = 4294966996LL;
          if (v14 == 1 && msg.msgh_size == 60 && !msg.msgh_remote_port && v16 == 1)
          {
            int v11 = v17;
            if (v17 == v18)
            {
              uint64_t v10 = 0LL;
              *a2 = v15;
              *a3 = v11;
              *a4 = v19;
              return v10;
            }
          }
        }

        else if (msg.msgh_size == 36)
        {
          uint64_t v10 = 4294966996LL;
          if (HIDWORD(v15))
          {
            if (msg.msgh_remote_port) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
          }
        }

        else
        {
          uint64_t v10 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

      mach_msg_destroy(&msg);
      return v10;
    }

    mig_dealloc_reply_port(msg.msgh_local_port);
  }

  return v10;
}

uint64_t sub_2BFFC(mach_port_t a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  reply_CFMachPortRef port = mig_get_reply_port();
  msg.msgh_remote_CFMachPortRef port = a1;
  msg.msgh_local_CFMachPortRef port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_CFMachPortRef port = 0x465400000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    reply_CFMachPortRef port = msg.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&msg, 3, 0x18u, 0x44u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (msg.msgh_id == 18104)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v10 = 4294966996LL;
          if (v14 == 1 && msg.msgh_size == 60 && !msg.msgh_remote_port && v16 == 1)
          {
            int v11 = v17;
            if (v17 == v18)
            {
              uint64_t v10 = 0LL;
              *a2 = v15;
              *a3 = v11;
              *a4 = v19;
              return v10;
            }
          }
        }

        else if (msg.msgh_size == 36)
        {
          uint64_t v10 = 4294966996LL;
          if (HIDWORD(v15))
          {
            if (msg.msgh_remote_port) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
          }
        }

        else
        {
          uint64_t v10 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

      mach_msg_destroy(&msg);
      return v10;
    }

    mig_dealloc_reply_port(msg.msgh_local_port);
  }

  return v10;
}

uint64_t sub_2C1B8(mach_port_t a1, uint64_t a2, int a3, int a4, int *a5)
{
  int v13 = 1;
  uint64_t v14 = a2;
  int v15 = 16777472;
  int v16 = a3;
  NDR_record_t v17 = NDR_record;
  int v18 = a3;
  int v19 = a4;
  reply_CFMachPortRef port = mig_get_reply_port();
  msg.msgh_remote_CFMachPortRef port = a1;
  msg.msgh_local_CFMachPortRef port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_CFMachPortRef port = 0x465500000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    reply_CFMachPortRef port = msg.msgh_local_port;
  }

  uint64_t v8 = mach_msg(&msg, 3, 0x3Cu, 0x30u, reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v8)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v9;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v9 = 4294966988LL;
    }

    else if (msg.msgh_id == 18105)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 40)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v9 = HIDWORD(v14);
            if (!HIDWORD(v14))
            {
              *a5 = v15;
              return v9;
            }

            goto LABEL_23;
          }
        }

        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v10 = 1;
          }
          else {
            BOOL v10 = HIDWORD(v14) == 0;
          }
          if (v10) {
            uint64_t v9 = 4294966996LL;
          }
          else {
            uint64_t v9 = HIDWORD(v14);
          }
          goto LABEL_23;
        }
      }

      uint64_t v9 = 4294966996LL;
    }

    else
    {
      uint64_t v9 = 4294966995LL;
    }

uint64_t sub_2C360(mach_port_t a1, unsigned int a2, _DWORD *a3)
{
  NDR_record_t v11 = NDR_record;
  unsigned int v12 = a2;
  reply_CFMachPortRef port = mig_get_reply_port();
  v10.msgh_remote_CFMachPortRef port = a1;
  v10.msgh_local_CFMachPortRef port = reply_port;
  v10.msgh_bits = 5395;
  *(void *)&v10.msgh_voucher_CFMachPortRef port = 0x465600000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v10);
    reply_CFMachPortRef port = v10.msgh_local_port;
  }

  uint64_t v6 = mach_msg(&v10, 3, 0x24u, 0x30u, reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }

    if (v10.msgh_id == 71)
    {
      uint64_t v7 = 4294966988LL;
    }

    else if (v10.msgh_id == 18106)
    {
      if ((v10.msgh_bits & 0x80000000) == 0)
      {
        if (v10.msgh_size == 40)
        {
          if (!v10.msgh_remote_port)
          {
            uint64_t v7 = v12;
            if (!v12)
            {
              *a3 = v13;
              return v7;
            }

            goto LABEL_23;
          }
        }

        else if (v10.msgh_size == 36)
        {
          if (v10.msgh_remote_port) {
            BOOL v8 = 1;
          }
          else {
            BOOL v8 = v12 == 0;
          }
          if (v8) {
            uint64_t v7 = 4294966996LL;
          }
          else {
            uint64_t v7 = v12;
          }
          goto LABEL_23;
        }
      }

      uint64_t v7 = 4294966996LL;
    }

    else
    {
      uint64_t v7 = 4294966995LL;
    }

uint64_t sub_2C4C4(mach_port_t a1, _DWORD *a2)
{
  reply_CFMachPortRef port = mig_get_reply_port();
  v9.msgh_remote_CFMachPortRef port = a1;
  v9.msgh_local_CFMachPortRef port = reply_port;
  v9.msgh_bits = 5395;
  *(void *)&v9.msgh_voucher_CFMachPortRef port = 0x465700000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v9);
    reply_CFMachPortRef port = v9.msgh_local_port;
  }

  uint64_t v5 = mach_msg(&v9, 3, 0x18u, 0x30u, reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      uint64_t v6 = 4294966988LL;
    }

    else if (v9.msgh_id == 18107)
    {
      if ((v9.msgh_bits & 0x80000000) == 0)
      {
        if (v9.msgh_size == 40)
        {
          if (!v9.msgh_remote_port)
          {
            uint64_t v6 = v10;
            if (!v10)
            {
              *a2 = v11;
              return v6;
            }

            goto LABEL_23;
          }
        }

        else if (v9.msgh_size == 36)
        {
          if (v9.msgh_remote_port) {
            BOOL v7 = 1;
          }
          else {
            BOOL v7 = v10 == 0;
          }
          if (v7) {
            uint64_t v6 = 4294966996LL;
          }
          else {
            uint64_t v6 = v10;
          }
          goto LABEL_23;
        }
      }

      uint64_t v6 = 4294966996LL;
    }

    else
    {
      uint64_t v6 = 4294966995LL;
    }

uint64_t sub_2C614(mach_port_t a1, _DWORD *a2)
{
  reply_CFMachPortRef port = mig_get_reply_port();
  v9.msgh_remote_CFMachPortRef port = a1;
  v9.msgh_local_CFMachPortRef port = reply_port;
  v9.msgh_bits = 5395;
  *(void *)&v9.msgh_voucher_CFMachPortRef port = 0x465800000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v9);
    reply_CFMachPortRef port = v9.msgh_local_port;
  }

  uint64_t v5 = mach_msg(&v9, 3, 0x18u, 0x30u, reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      uint64_t v6 = 4294966988LL;
    }

    else if (v9.msgh_id == 18108)
    {
      if ((v9.msgh_bits & 0x80000000) == 0)
      {
        if (v9.msgh_size == 40)
        {
          if (!v9.msgh_remote_port)
          {
            uint64_t v6 = v10;
            if (!v10)
            {
              *a2 = v11;
              return v6;
            }

            goto LABEL_23;
          }
        }

        else if (v9.msgh_size == 36)
        {
          if (v9.msgh_remote_port) {
            BOOL v7 = 1;
          }
          else {
            BOOL v7 = v10 == 0;
          }
          if (v7) {
            uint64_t v6 = 4294966996LL;
          }
          else {
            uint64_t v6 = v10;
          }
          goto LABEL_23;
        }
      }

      uint64_t v6 = 4294966996LL;
    }

    else
    {
      uint64_t v6 = 4294966995LL;
    }

uint64_t sub_2C764(mach_port_t a1, unsigned int a2, _DWORD *a3)
{
  NDR_record_t v11 = NDR_record;
  unsigned int v12 = a2;
  reply_CFMachPortRef port = mig_get_reply_port();
  v10.msgh_remote_CFMachPortRef port = a1;
  v10.msgh_local_CFMachPortRef port = reply_port;
  v10.msgh_bits = 5395;
  *(void *)&v10.msgh_voucher_CFMachPortRef port = 0x465900000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v10);
    reply_CFMachPortRef port = v10.msgh_local_port;
  }

  uint64_t v6 = mach_msg(&v10, 3, 0x24u, 0x30u, reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }

    if (v10.msgh_id == 71)
    {
      uint64_t v7 = 4294966988LL;
    }

    else if (v10.msgh_id == 18109)
    {
      if ((v10.msgh_bits & 0x80000000) == 0)
      {
        if (v10.msgh_size == 40)
        {
          if (!v10.msgh_remote_port)
          {
            uint64_t v7 = v12;
            if (!v12)
            {
              *a3 = v13;
              return v7;
            }

            goto LABEL_23;
          }
        }

        else if (v10.msgh_size == 36)
        {
          if (v10.msgh_remote_port) {
            BOOL v8 = 1;
          }
          else {
            BOOL v8 = v12 == 0;
          }
          if (v8) {
            uint64_t v7 = 4294966996LL;
          }
          else {
            uint64_t v7 = v12;
          }
          goto LABEL_23;
        }
      }

      uint64_t v7 = 4294966996LL;
    }

    else
    {
      uint64_t v7 = 4294966995LL;
    }

uint64_t sub_2C8C8( mach_port_t a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, _DWORD *a10, _DWORD *a11)
{
  int v18 = 4;
  uint64_t v19 = a2;
  int v20 = 16777472;
  int v21 = a3;
  int v22 = a4;
  int v24 = 1245184;
  int v25 = a5;
  int v26 = 1114112;
  int v27 = a6;
  int v28 = 1245184;
  NDR_record_t v29 = NDR_record;
  int v30 = a3;
  int v31 = a7;
  int v32 = a8;
  int v33 = a9;
  reply_CFMachPortRef port = mig_get_reply_port();
  v17.msgh_remote_CFMachPortRef port = a1;
  v17.msgh_local_CFMachPortRef port = reply_port;
  v17.msgh_bits = -2147478253;
  *(void *)&v17.msgh_voucher_CFMachPortRef port = 0x465D00000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v17);
    reply_CFMachPortRef port = v17.msgh_local_port;
  }

  uint64_t v13 = mach_msg(&v17, 3, 0x68u, 0x3Cu, reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v17.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v13)
    {
      if (v17.msgh_id == 71)
      {
        uint64_t v14 = 4294966988LL;
      }

      else if (v17.msgh_id == 18113)
      {
        if ((v17.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v14 = 4294966996LL;
          if (v18 == 1 && v17.msgh_size == 52 && !v17.msgh_remote_port && HIWORD(v20) << 16 == 1114112)
          {
            uint64_t v14 = 0LL;
            int v15 = v23;
            *a10 = v19;
            *a11 = v15;
            return v14;
          }
        }

        else if (v17.msgh_size == 36)
        {
          uint64_t v14 = 4294966996LL;
          if (HIDWORD(v19))
          {
            if (v17.msgh_remote_port) {
              uint64_t v14 = 4294966996LL;
            }
            else {
              uint64_t v14 = HIDWORD(v19);
            }
          }
        }

        else
        {
          uint64_t v14 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v14 = 4294966995LL;
      }

      mach_msg_destroy(&v17);
      return v14;
    }

    mig_dealloc_reply_port(v17.msgh_local_port);
  }

  return v14;
}

uint64_t sub_2CAB0(mach_port_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _OWORD *a5)
{
  reply_CFMachPortRef port = mig_get_reply_port();
  msg.msgh_remote_CFMachPortRef port = a1;
  msg.msgh_local_CFMachPortRef port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_CFMachPortRef port = 0x465F00000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    reply_CFMachPortRef port = msg.msgh_local_port;
  }

  uint64_t v11 = mach_msg(&msg, 50331651, 0x18u, 0x84u, reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v12;
  }

  if ((_DWORD)v11)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v12;
  }

  if (msg.msgh_id == 71)
  {
    uint64_t v12 = 4294966988LL;
    goto LABEL_27;
  }

  if (msg.msgh_id != 18115)
  {
    uint64_t v12 = 4294966995LL;
    goto LABEL_27;
  }

  if ((msg.msgh_bits & 0x80000000) == 0)
  {
    if (msg.msgh_size == 36)
    {
      uint64_t v12 = 4294966996LL;
      if (v19)
      {
        if (msg.msgh_remote_port) {
          uint64_t v12 = 4294966996LL;
        }
        else {
          uint64_t v12 = v19;
        }
      }
    }

    else
    {
      uint64_t v12 = 4294966996LL;
    }

    goto LABEL_27;
  }

  uint64_t v12 = 4294966996LL;
  if (v17 != 2 || msg.msgh_size != 64 || msg.msgh_remote_port || v20 << 16 != 1114112 || v22 << 16 != 1114112)
  {
LABEL_27:
    mach_msg_destroy(&msg);
    return v12;
  }

  if (v24 || v25 < 0x20) {
    return 4294966987LL;
  }
  uint64_t v12 = 0LL;
  int v14 = v21;
  *a2 = v18;
  *a3 = v14;
  *a4 = v23;
  __int128 v15 = v27;
  *a5 = v26;
  a5[1] = v15;
  return v12;
}

uint64_t sub_2CC88(mach_port_t a1, int a2, void *a3, _DWORD *a4, _DWORD *a5, _OWORD *a6)
{
  *(NDR_record_t *)int v18 = NDR_record;
  *(_DWORD *)&v18[8] = a2;
  reply_CFMachPortRef port = mig_get_reply_port();
  msg.msgh_remote_CFMachPortRef port = a1;
  msg.msgh_local_CFMachPortRef port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_CFMachPortRef port = 0x466000000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    reply_CFMachPortRef port = msg.msgh_local_port;
  }

  uint64_t v12 = mach_msg(&msg, 50331651, 0x24u, 0x80u, reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v13;
  }

  if ((_DWORD)v12)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v13;
  }

  if (msg.msgh_id == 71)
  {
    uint64_t v13 = 4294966988LL;
    goto LABEL_27;
  }

  if (msg.msgh_id != 18116)
  {
    uint64_t v13 = 4294966995LL;
    goto LABEL_27;
  }

  if ((msg.msgh_bits & 0x80000000) == 0)
  {
    if (msg.msgh_size == 36)
    {
      uint64_t v13 = 4294966996LL;
      if (*(_DWORD *)&v18[8])
      {
        if (msg.msgh_remote_port) {
          uint64_t v13 = 4294966996LL;
        }
        else {
          uint64_t v13 = *(unsigned int *)&v18[8];
        }
      }
    }

    else
    {
      uint64_t v13 = 4294966996LL;
    }

    goto LABEL_27;
  }

  uint64_t v13 = 4294966996LL;
  if (*(_DWORD *)v18 != 1 || msg.msgh_size != 60 || msg.msgh_remote_port || v19 != 1 || (int v14 = v20, v20 != v21))
  {
LABEL_27:
    mach_msg_destroy(&msg);
    return v13;
  }

  if (v23 || v24 < 0x20) {
    return 4294966987LL;
  }
  uint64_t v13 = 0LL;
  *a3 = *(void *)&v18[4];
  *a4 = v14;
  *a5 = v22;
  __int128 v16 = v26;
  *a6 = v25;
  a6[1] = v16;
  return v13;
}

uint64_t sub_2CE98(mach_port_t a1, _DWORD *a2, _OWORD *a3)
{
  reply_CFMachPortRef port = mig_get_reply_port();
  msg.msgh_remote_CFMachPortRef port = a1;
  msg.msgh_local_CFMachPortRef port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_CFMachPortRef port = 0x466100000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    reply_CFMachPortRef port = msg.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&msg, 50331651, 0x18u, 0x6Cu, reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v8;
  }

  if ((_DWORD)v7)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v8;
  }

  if (msg.msgh_id == 71)
  {
    uint64_t v8 = 4294966988LL;
LABEL_23:
    mach_msg_destroy(&msg);
    return v8;
  }

  if (msg.msgh_id != 18117)
  {
    uint64_t v8 = 4294966995LL;
    goto LABEL_23;
  }

  if ((msg.msgh_bits & 0x80000000) != 0) {
    goto LABEL_22;
  }
  if (msg.msgh_size != 40)
  {
    if (msg.msgh_size == 36)
    {
      if (msg.msgh_remote_port) {
        BOOL v9 = 1;
      }
      else {
        BOOL v9 = v14 == 0;
      }
      if (v9) {
        uint64_t v8 = 4294966996LL;
      }
      else {
        uint64_t v8 = v14;
      }
      goto LABEL_23;
    }

    goto LABEL_22;
  }

  if (msg.msgh_remote_port)
  {
LABEL_22:
    uint64_t v8 = 4294966996LL;
    goto LABEL_23;
  }

  uint64_t v8 = v14;
  if (v14) {
    goto LABEL_23;
  }
  uint64_t v11 = (char *)&msg + ((msg.msgh_size + 3LL) & 0x1FFFFFFFCLL);
  if (*(_DWORD *)v11 || *((_DWORD *)v11 + 1) < 0x20u) {
    return 4294966987LL;
  }
  uint64_t v8 = 0LL;
  *a2 = v15;
  __int128 v12 = *(_OWORD *)(v11 + 36);
  *a3 = *(_OWORD *)(v11 + 20);
  a3[1] = v12;
  return v8;
}

uint64_t sub_2D034(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

uint64_t sub_2D070(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 4 || *(_DWORD *)(result + 4) != 92)
  {
    int v3 = -304;
    goto LABEL_13;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(unsigned __int16 *)(result + 54) << 16 != 1114112
    || *(unsigned __int16 *)(result + 66) << 16 != 1114112
    || *(unsigned __int16 *)(result + 78) << 16 != 1114112
    || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 88))
  {
    int v3 = -300;
    goto LABEL_13;
  }

  if (*(_DWORD *)(result + 92) || *(_DWORD *)(result + 96) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_13:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_14;
  }

  uint64_t v4 = (mach_port_name_t *)(a2 + 28);
  *(void *)(a2 + 32) = 0x11000000000000LL;
  int v5 = *(_DWORD *)(result + 12);
  uint64_t v6 = *(void *)(result + 28);
  unsigned int v7 = *(_DWORD *)(result + 40);
  mach_port_name_t v8 = *(_DWORD *)(result + 44);
  mach_port_name_t v9 = *(_DWORD *)(result + 56);
  int v10 = *(_DWORD *)(result + 68);
  __int128 v11 = *(_OWORD *)(result + 128);
  v12[0] = *(_OWORD *)(result + 112);
  v12[1] = v11;
  double result = sub_19CF0(v5, v6, v7, v8, v9, v10, v4, (int *)(a2 + 48), v12);
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 40) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 52;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }

  *(_DWORD *)(a2 + 32) = result;
LABEL_14:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_2D1BC(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    double result = (_DWORD *)sub_19DD0(result[3], (_DWORD *)(a2 + 36), (int *)(a2 + 40));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 44;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_2D238(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  double result = (_DWORD *)sub_19E30(result[3], (void *)(a2 + 28), (int *)(a2 + 52), (int *)(a2 + 56));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + memset(v5, 0, 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

_DWORD *sub_2D2E0(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  double result = (_DWORD *)sub_19ECC(result[3], (void *)(a2 + 28), (int *)(a2 + 52), (int *)(a2 + 56));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + memset(v5, 0, 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

_DWORD *sub_2D388(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  double result = (_DWORD *)sub_19F68(result[3], (void *)(a2 + 28), (int *)(a2 + 52), (int *)(a2 + 56));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + memset(v5, 0, 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_2D430(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 60)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    NDR_record_t v4 = NDR_record;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }

  double result = sub_1A008(*(_DWORD *)(result + 12), *(void *)(result + 28), v3, *(_DWORD *)(result + 56), (int *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

_DWORD *sub_2D4E4(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    double result = (_DWORD *)sub_1A12C(result[3], result[8], (int *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_2D564(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    double result = (_DWORD *)sub_1A1CC(result[3], (int *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_2D5DC(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    double result = (_DWORD *)sub_1A21C(result[3], (int *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_2D654(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    double result = (_DWORD *)sub_1A26C(result[3], result[8], (int *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

uint64_t sub_2D6D4(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 4 || *(_DWORD *)(result + 4) != 104)
  {
    int v3 = -304;
    goto LABEL_13;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(unsigned __int16 *)(result + 54) << 16 != 1114112
    || *(unsigned __int16 *)(result + 66) << 16 != 1114112
    || *(unsigned __int16 *)(result + 78) << 16 != 1114112
    || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 88))
  {
    int v3 = -300;
    goto LABEL_13;
  }

  if (*(_DWORD *)(result + 104) || *(_DWORD *)(result + 108) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_13:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_14;
  }

  *(void *)(a2 + 32) = 0x11000000000000LL;
  int v4 = *(_DWORD *)(result + 12);
  uint64_t v5 = *(void *)(result + 28);
  unsigned int v6 = *(_DWORD *)(result + 40);
  mach_port_name_t v7 = *(_DWORD *)(result + 44);
  mach_port_name_t v8 = *(_DWORD *)(result + 56);
  int v9 = *(_DWORD *)(result + 68);
  int v10 = *(_DWORD *)(result + 92);
  int v11 = *(_DWORD *)(result + 96);
  int v12 = *(_DWORD *)(result + 100);
  __int128 v13 = *(_OWORD *)(result + 140);
  v14[0] = *(_OWORD *)(result + 124);
  v14[1] = v13;
  double result = sub_19718(v4, v5, v6, v7, v8, v9, v10, v11, v12, (mach_port_name_t *)(a2 + 28), (int *)(a2 + 48), v14);
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 40) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 52;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }

  *(_DWORD *)(a2 + 32) = result;
LABEL_14:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_2D830(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 24)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(result + 24) || *(_DWORD *)(result + 28) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
LABEL_8:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(void *)(a2 + 32) = 0x13000000000000LL;
  *(void *)(a2 + memset(v5, 0, 44) = 0x13000000000000LL;
  double result = sub_1A2BC( *(unsigned int *)(result + 12),  (_DWORD *)(a2 + 28),  (_DWORD *)(a2 + 40),  (_DWORD *)(a2 + 60),  (_OWORD *)(result + 44));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
    goto LABEL_8;
  }

  *(NDR_record_t *)(a2 + 52) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 64;
  *(_DWORD *)(a2 + 24) = 2;
  return result;
}

uint64_t sub_2D8F8(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
LABEL_8:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  double result = sub_1A358( *(unsigned int *)(result + 12),  *(_DWORD *)(result + 32),  (void *)(a2 + 28),  (int *)(a2 + 52),  (int *)(a2 + 56),  (_OWORD *)(result + 56));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
    goto LABEL_8;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + memset(v5, 0, 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_2D9CC(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 24)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(result + 24) || *(_DWORD *)(result + 28) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
LABEL_8:
    *(NDR_record_t *)(a2 + 24) = v4;
    return result;
  }

  double result = sub_1A438(*(unsigned int *)(result + 12), (int *)(a2 + 36), (_OWORD *)(result + 44));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if ((_DWORD)result) {
    goto LABEL_8;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

uint64_t sub_2DA68(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 18022) >= 0xFFFFFFEA
    && (uint64_t v5 = (void (*)(void))*(&_pppcontroller_subsystem + 5 * (v4 - 18000) + 5)) != 0LL)
  {
    v5();
    return 1LL;
  }

  else
  {
    uint64_t result = 0LL;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }

  return result;
}