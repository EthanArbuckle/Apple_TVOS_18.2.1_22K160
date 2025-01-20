uint64_t rtadvdLog( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t result;
  uint64_t *v10;
  if (rtadvdLogger
    || (rtadvdLogger = (uint64_t)os_log_create("com.apple.rtadvd", "daemon")) != 0
    || (result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR), (_DWORD)result)
    && (result = rtadvdLog_cold_1(&v10), (result & 1) == 0))
  {
    v10 = &a9;
    return os_log_with_args();
  }

  return result;
}

uint64_t agetent(uint64_t a1, unsigned __int8 *a2)
{
  if (conffile) {
    v2 = (char *)conffile;
  }
  else {
    v2 = "/etc/rtadvd.conf";
  }
  remotefile = (uint64_t)v2;
  return getent(a1, a2, v2);
}

uint64_t getent(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  tbuf = a1;
  if (a3 && *a3)
  {
    RM = (uint64_t)a3;
    int v5 = open(a3, 0);
    if (v5 < 0)
    {
      v6 = __error();
      strerror(*v6);
      rtadvdLog(1LL, (uint64_t)"<%s> open: %s", v7, v8, v9, v10, v11, v12, (uint64_t)"getent");
      return 4294967294LL;
    }
  }

  else
  {
    int v5 = 0;
  }

  uint64_t v14 = 0LL;
  int v15 = 0;
  int v16 = 0;
  while (v15 != v16)
  {
LABEL_10:
    v17 = (_BYTE *)(a1 + v14);
    int v18 = v20[v15++];
    if (v18 == 10)
    {
      BOOL v19 = v14-- < 1;
      if (v19 || *(v17 - 1) != 92) {
        goto LABEL_17;
      }
    }

    else if (v14 >= 1023)
    {
      write(2, "Remcap entry too long\n", 0x16uLL);
LABEL_17:
      _BYTE *v17 = 0;
      uint64_t v14 = 0LL;
      if (anamatch(a2))
      {
        close(v5);
        return anchktc();
      }
    }

    else
    {
      ++v14;
      _BYTE *v17 = v18;
    }
  }

  int v16 = read(v5, v20, 0x400uLL);
  if (v16 > 0)
  {
    int v15 = 0;
    goto LABEL_10;
  }

  close(v5);
  return 0LL;
}

uint64_t anamatch(unsigned __int8 *a1)
{
  v1 = (_BYTE *)tbuf;
  if (*(_BYTE *)tbuf == 35) {
    return 0LL;
  }
  int v4 = *a1;
  v2 = a1 + 1;
  int v3 = v4;
LABEL_3:
  if (v3)
  {
    int v5 = v2;
    int v6 = v3;
    do
    {
      int v7 = *v1;
      if (v7 != v6) {
        goto LABEL_10;
      }
      ++v1;
      int v8 = *v5++;
      int v6 = v8;
    }

    while (v8);
  }

  int v7 = *v1;
  if (*v1 && v7 != 58 && v7 != 124)
  {
LABEL_10:
    ++v1;
    if (v7)
    {
      do
      {
        if (v7 == 58) {
          break;
        }
        if (v7 == 124) {
          goto LABEL_3;
        }
        int v9 = *v1++;
        int v7 = v9;
      }

      while (v9);
    }

    return 0LL;
  }

  return 1LL;
}

uint64_t anchktc()
{
  uint64_t v0 = tbuf;
  size_t v1 = strlen((const char *)tbuf);
  uint64_t v2 = 0LL;
  size_t v3 = tbuf + v1;
  while (1)
  {
    size_t v4 = v3 + v2;
    if (*(_BYTE *)(v3 + v2 - 3) == 58) {
      break;
    }
    --v2;
    if (v3 + v2 - 2 < tbuf)
    {
      int v5 = "Bad remcap entry\n";
      goto LABEL_5;
    }
  }

  int v8 = *(unsigned __int8 *)(v4 - 2);
  int v7 = (char *)(v4 - 2);
  if (v8 == 116)
  {
    size_t v9 = v3 + v2;
    if (*(_BYTE *)(v9 - 1) == 99)
    {
      uint64_t v10 = &__s[-v1 + 1026 - v2];
      uint64_t v11 = v16;
      __strlcpy_chk(v16, v9 + 1, 16LL, 16LL);
      while (*v11 && *v11 != 58)
        ++v11;
      *uint64_t v11 = 0;
      int v12 = hopcount++;
      if (v12 >= 32)
      {
        int v5 = "Infinite tc= loop\n";
LABEL_5:
        write(2, v5, 0x12uLL);
        return 0LL;
      }

      v13 = __s;
      do
      {
        int v14 = *v13++;
        ++v10;
      }

      while (v14 != 58);
      if ((int)(v1 + v2 + strlen(v13) - 2) >= 1025)
      {
        write(2, "Remcap entry too long\n", 0x17uLL);
        *uint64_t v10 = 0;
      }

      strlcpy(v7, v13, v1 + v0 - tbuf + v2 - 2);
      tbuf = v0;
    }
  }

  return 1LL;
}

uint64_t agetnum(const char *a1)
{
  uint64_t v2 = tskip((char *)tbuf);
  if (!*v2) {
    return -1LL;
  }
  size_t v3 = v2;
  size_t v4 = strlen(a1);
  while (strncmp(v3, a1, v4))
  {
LABEL_7:
    size_t v3 = tskip(v3);
    if (!*v3) {
      return -1LL;
    }
  }

  int v5 = v3[v4];
  if (v5 == 64) {
    return -1LL;
  }
  if (v5 != 35)
  {
    v3 += v4;
    goto LABEL_7;
  }

  unsigned int v7 = v3[v4 + 1] - 48;
  if (v7 > 9) {
    return 0LL;
  }
  uint64_t result = 0LL;
  uint64_t v8 = 10LL;
  if (v3[v4 + 1] == 48) {
    uint64_t v8 = 8LL;
  }
  size_t v9 = &v3[v4 + 2];
  do
  {
    uint64_t result = result * v8 + v7;
    int v10 = *v9++;
    unsigned int v7 = v10 - 48;
  }

  while ((v10 - 48) < 0xA);
  return result;
}

char *tskip(char *result)
{
  char v1 = *result;
  if (*result)
  {
    do
    {
      if (v1 == 92)
      {
        if ((result[1] - 48) > 9)
        {
          result += 2;
        }

        else
        {
          ++result;
          do
            int v2 = *result++;
          while ((v2 - 48) < 0xA);
        }
      }

      else if (v1 == 58)
      {
        break;
      }

      int v3 = *++result;
      char v1 = v3;
    }

    while (v3);
  }

  if (v1 == 58) {
    ++result;
  }
  return result;
}

uint64_t agetflag(const char *a1)
{
  int v2 = tskip((char *)tbuf);
  if (*v2)
  {
    int v3 = v2;
    size_t v4 = strlen(a1);
    do
    {
      if (!strncmp(v3, a1, v4))
      {
        v3 += v4;
        int v5 = *v3;
        uint64_t result = 1LL;
        if (!*v3 || v5 == 58) {
          return result;
        }
        if (v5 == 64) {
          return 0LL;
        }
      }

      int v3 = tskip(v3);
    }

    while (*v3);
  }

  return 0LL;
}

_BYTE *agetstr(const char *a1, _BYTE **a2)
{
  size_t v4 = tskip((char *)tbuf);
  if (!*v4) {
    return 0LL;
  }
  int v5 = v4;
  size_t v6 = strlen(a1);
  while (1)
  {
    if (!strncmp(v5, a1, v6))
    {
      v5 += v6;
      int v7 = *v5;
      if (v7 == 64) {
        return 0LL;
      }
      if (v7 == 61) {
        break;
      }
    }

    int v5 = tskip(v5);
    if (!*v5) {
      return 0LL;
    }
  }

  size_t v9 = v5 + 1;
  int v10 = *a2;
  do
  {
    int v11 = *v9;
    if (v11 == 34) {
      int v12 = v9 + 1;
    }
    else {
      int v12 = v9;
    }
    if (v11 == 34) {
      int v13 = 34;
    }
    else {
      int v13 = 58;
    }
    size_t v9 = v12 + 1;
    int v14 = *v12;
    if (*v12) {
      BOOL v15 = v13 == v14;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15)
    {
      while (v14 != 92)
      {
        if (v14 != 94) {
          goto LABEL_30;
        }
        int v16 = v12 + 2;
        LOBYTE(v14) = *v9 & 0x1F;
LABEL_32:
        *v10++ = v14;
        size_t v9 = v16 + 1;
        int v14 = *v16;
        if (*v16) {
          BOOL v23 = v13 == v14;
        }
        else {
          BOOL v23 = 1;
        }
        int v12 = v16;
        if (v23) {
          goto LABEL_37;
        }
      }

      int v16 = v12 + 2;
      int v14 = *v9;
      unsigned __int8 v17 = 69;
      int v18 = "^^\\\\::n\nr\rt\tb\bf\f";
      do
      {
        if (v17 == v14)
        {
          LOBYTE(v14) = *(v18 - 1);
          goto LABEL_32;
        }

        int v19 = *v18;
        v18 += 2;
        unsigned __int8 v17 = v19;
      }

      while (v19);
      char v20 = 0;
      size_t v9 = v12 + 4;
      char v21 = v12[2];
      LOBYTE(v14) = v14 - 48;
      while (1)
      {
        LOBYTE(v14) = (v21 - 48) | (8 * v14);
        if ((v20 & 1) != 0) {
          break;
        }
        int v22 = *++v16;
        char v21 = v22;
        char v20 = 1;
      }

LABEL_30:
      int v16 = v9;
      goto LABEL_32;
    }

LABEL_37:
    ;
  }

  while (v11 == 34 && v13 == v14);
  *int v10 = 0;
  uint64_t result = *a2;
  *a2 = v10 + 1;
  return result;
}

void getconfig(unsigned __int8 *a1)
{
  v173 = &v178;
  if ((int)agetent((uint64_t)v179, a1) <= 0)
  {
    bzero(v179, 0x400uLL);
    rtadvdLog( 0LL,  (uint64_t)"<%s> %s isn't defined in the configuration file or the configuration file doesn't exist. Treat it as default",  v2,  v3,  v4,  v5,  v6,  v7,  (uint64_t)"getconfig");
  }

  uint64_t v8 = malloc(0x1E8uLL);
  if (!v8)
  {
    v161 = __error();
    strerror(*v161);
    goto LABEL_202;
  }

  uint64_t v9 = (uint64_t)v8;
  v8[60] = 0LL;
  *((_OWORD *)v8 + 28) = 0u;
  *((_OWORD *)v8 + 29) = 0u;
  *((_OWORD *)v8 + 26) = 0u;
  *((_OWORD *)v8 + 27) = 0u;
  *((_OWORD *)v8 + 24) = 0u;
  *((_OWORD *)v8 + 25) = 0u;
  *((_OWORD *)v8 + 22) = 0u;
  *((_OWORD *)v8 + 23) = 0u;
  *((_OWORD *)v8 + 20) = 0u;
  *((_OWORD *)v8 + 21) = 0u;
  *((_OWORD *)v8 + 18) = 0u;
  *((_OWORD *)v8 + 19) = 0u;
  *((_OWORD *)v8 + 16) = 0u;
  *((_OWORD *)v8 + 17) = 0u;
  *((_OWORD *)v8 + 13) = 0u;
  *((_OWORD *)v8 + 14) = 0u;
  *((_OWORD *)v8 + 11) = 0u;
  *((_OWORD *)v8 + 12) = 0u;
  *((_OWORD *)v8 + 9) = 0u;
  *((_OWORD *)v8 + 10) = 0u;
  *((_OWORD *)v8 + 6) = 0u;
  *((_OWORD *)v8 + 7) = 0u;
  *((_OWORD *)v8 + 4) = 0u;
  *((_OWORD *)v8 + 5) = 0u;
  *((_OWORD *)v8 + 2) = 0u;
  *((_OWORD *)v8 + 3) = 0u;
  *(_OWORD *)uint64_t v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_OWORD *)v8 + 15) = 0u;
  *((_OWORD *)v8 + 8) = 0u;
  int v10 = v8 + 16;
  v8[17] = v8 + 16;
  v8[16] = v8 + 16;
  v8[30] = v8 + 30;
  v172 = v8 + 30;
  v8[31] = v8 + 30;
  int v11 = (char *)(v8 + 37);
  v8[37] = v8 + 37;
  v8[38] = v8 + 37;
  v8[42] = v8 + 42;
  v8[43] = v8 + 42;
  v170 = v8 + 42;
  if (getconfig_forwarding < 0)
  {
    *(void *)v176 = 0x1E00000004LL;
    uint64_t v177 = 0x100000029LL;
    v175[0].tv_sec = 4LL;
    if (sysctl(v176, 4u, &v174, (size_t *)v175, 0LL, 0LL) < 0)
    {
      v162 = __error();
      strerror(*v162);
      rtadvdLog( 0LL,  (uint64_t)"<%s>: failed to get ip6 sysctl(%d): %s",  v163,  v164,  v165,  v166,  v167,  v168,  (uint64_t)"getinet6sysctl");
      getconfig_forwarding = -1;
      goto LABEL_212;
    }

    getconfig_forwarding = v174;
    if (v174 < 0) {
      goto LABEL_212;
    }
  }

  if (agetflag("nolladdr"))
  {
    *(_DWORD *)(v9 + 48) = 0;
    unsigned int v12 = if_nametoindex((const char *)a1);
  }

  else
  {
    *(_DWORD *)(v9 + 48) = 1;
    int v13 = (unsigned __int16 *)if_nametosdl((const char *)a1);
    *(void *)(v9 + 56) = v13;
    if (!v13)
    {
      rtadvdLog(0LL, (uint64_t)"<%s> can't get information of %s", v14, v15, v16, v17, v18, v19, (uint64_t)"getconfig");
      goto LABEL_212;
    }

    unsigned int v12 = v13[1];
  }

  *(_DWORD *)(v9 + 44) = v12;
  __strlcpy_chk(v9 + 64, a1, 16LL, 16LL);
  uint64_t v20 = if_getmtu((const char *)a1);
  *(_DWORD *)(v9 + 80) = v20;
  if (!(_DWORD)v20)
  {
    *(_DWORD *)(v9 + 80) = 1280;
    rtadvdLog( v20,  (uint64_t)"<%s> can't get interface mtu of %s. Treat as %d",  v21,  v22,  v23,  v24,  v25,  v26,  (uint64_t)"getconfig");
  }

  uint64_t v27 = agetnum("maxinterval");
  uint64_t v34 = 600LL;
  if (v27 >= 0) {
    uint64_t v34 = v27;
  }
  if ((unint64_t)(v34 - 1801) <= 0xFFFFFFFFFFFFF8FALL)
  {
    v160 = "<%s> maxinterval (%ld) on %s is invalid (must be between %u and %u)";
    goto LABEL_211;
  }

  v171 = (const char *)a1;
  *(_DWORD *)(v9 + 88) = v34;
  uint64_t v35 = agetnum("mininterval");
  unsigned int v36 = *(_DWORD *)(v9 + 88);
  unint64_t v37 = v36 / 3uLL;
  if (v35 >= 0) {
    unint64_t v37 = v35;
  }
  unint64_t v38 = (3 * v36) >> 2;
  if (v37 < 3 || v37 > v38)
  {
    v160 = "<%s> mininterval (%ld) on %s is invalid (must be between %d and %d)";
    goto LABEL_211;
  }

  *(_DWORD *)(v9 + 92) = v37;
  uint64_t v39 = agetnum("chlim");
  int v40 = v39;
  if (v39 < 0) {
    int v40 = 64;
  }
  *(_DWORD *)(v9 + 120) = v40;
  v41 = agetstr("raflags", &v173);
  if (v41)
  {
    v42 = v41;
    int v43 = strchr(v41, 109) != 0LL;
    if (strchr(v42, 111)) {
      LODWORD(v44) = ((v43 & 1) << 7) | 0x40;
    }
    else {
      LODWORD(v44) = v43 << 7;
    }
    if (strchr(v42, 104)) {
      LODWORD(v44) = v44 | 8;
    }
    if (strchr(v42, 108))
    {
      if ((v44 & 8) != 0)
      {
        v160 = "<%s> the 'h' and 'l' router flags are exclusive";
        goto LABEL_211;
      }

      LODWORD(v44) = v44 | 0x18;
    }
  }

  else
  {
    uint64_t v45 = agetnum("raflags");
    uint64_t v44 = v45 & ~(v45 >> 63);
  }

  *(int8x8_t *)(v9 + 96) = vand_s8((int8x8_t)vdup_n_s32(v44), (int8x8_t)0x4000000080LL);
  *(_DWORD *)(v9 + 104) = v44 & 0x18;
  if ((v44 & 0x18) == 0x10)
  {
    v160 = "<%s> invalid router preference (%02x) on %s";
    goto LABEL_211;
  }

  unint64_t v46 = agetnum("rltime");
  if ((v46 & 0x8000000000000000LL) == 0)
  {
    if (!v46) {
      goto LABEL_40;
    }
LABEL_37:
    if (v46 > 0x2328 || v46 < *(unsigned int *)(v9 + 88))
    {
      v160 = "<%s> router lifetime (%ld) on %s is invalid (must be 0 or between %d and %d)";
      goto LABEL_211;
    }

    if (!getconfig_forwarding)
    {
      v160 = "<%s> non zero router lifetime is specified for %s, which must not be allowed for hosts.  you must change ro"
             "uter lifetime or enable IPv6 forwarding.";
      goto LABEL_211;
    }

    goto LABEL_40;
  }

  int v47 = *(_DWORD *)(v9 + 88);
  unint64_t v46 = (3 * v47);
  if (3 * v47) {
    goto LABEL_37;
  }
LABEL_40:
  *(_WORD *)(v9 + 84) = v46;
  uint64_t v48 = agetnum("rtime");
  unint64_t v49 = v48 & ~(v48 >> 63);
  if (v49 >= 0x36EE81)
  {
    v160 = "<%s> reachable time (%ld) on %s is invalid (must be no greater than %d)";
    goto LABEL_211;
  }

  *(_DWORD *)(v9 + 112) = v49;
  uint64_t v50 = agetnum("retrans");
  unint64_t v51 = v50 & ~(v50 >> 63);
  if (HIDWORD(v51))
  {
    v160 = "<%s> retrans time (%lld) on %s out of range";
    goto LABEL_211;
  }

  v169 = v11;
  *(_DWORD *)(v9 + 116) = v51;
  if (agetnum("hapref") != -1 || agetnum("hatime") != -1)
  {
    v160 = "<%s> mobile-ip6 configuration not supported";
    goto LABEL_211;
  }

  uint64_t v52 = agetnum("clockskew");
  *(void *)(v9 + 232) = v52 & ~(v52 >> 63);
  *(_DWORD *)(v9 + 224) = 0;
  for (int i = -1; i != 100; ++i)
  {
    makeentry((char *)v176, 0x100uLL, i, "addr");
    v54 = agetstr((const char *)v176, &v173);
    if (!v54) {
      continue;
    }
    v55 = v54;
    v56 = (int8x8_t *)malloc(0x60uLL);
    if (!v56)
    {
LABEL_201:
      v159 = __error();
      strerror(*v159);
LABEL_202:
      v160 = "<%s> malloc failed: %s";
      goto LABEL_211;
    }

    v57 = v56;
    *(_OWORD *)v56[6].i8 = 0u;
    *(_OWORD *)v56[8].i8 = 0u;
    *(_OWORD *)v56[2].i8 = 0u;
    *(_OWORD *)v56[4].i8 = 0u;
    *(_OWORD *)v56->i8 = 0u;
    *(_OWORD *)v56[10].i8 = 0u;
    v58 = v56 + 10;
    v56[2] = (int8x8_t)v9;
    v56[9].i32[1] = 2;
    if (inet_pton(30, v55, &v56[10]) != 1) {
      goto LABEL_210;
    }
    int v59 = v58->u8[0];
    if (v59 == 254)
    {
      if ((v57[10].i8[1] & 0xC0) == 0x80) {
        rtadvdLog( 0LL,  (uint64_t)"<%s> link-local prefix (%s) will be advertised on %s",  v28,  v29,  v30,  v31,  v32,  v33,  (uint64_t)"getconfig");
      }
    }

    else if (v59 == 255)
    {
      v160 = "<%s> multicast prefix (%s) must not be advertised on %s";
      goto LABEL_211;
    }

    makeentry((char *)v176, 0x100uLL, i, "prefixlen");
    uint64_t v60 = agetnum((const char *)v176);
    uint64_t v61 = 64LL;
    if (v60 >= 0) {
      uint64_t v61 = v60;
    }
    if (v61 >= 129)
    {
LABEL_206:
      v160 = "<%s> prefixlen (%ld) for %s on %s out of range";
      goto LABEL_211;
    }

    v57[9].i32[0] = v61;
    makeentry((char *)v176, 0x100uLL, i, "pinfoflags");
    v62 = agetstr((const char *)v176, &v173);
    if (v62)
    {
      v63 = v62;
      int v64 = strchr(v62, 108) != 0LL;
      v65 = strchr(v63, 97);
      unsigned int v66 = ((v64 & 1) << 7) | 0x40;
      if (!v65) {
        unsigned int v66 = v64 << 7;
      }
    }

    else
    {
      uint64_t v67 = agetnum((const char *)v176);
      unsigned int v66 = 192;
      if (v67 >= 0) {
        unsigned int v66 = v67;
      }
    }

    v57[8] = vand_s8((int8x8_t)vdup_n_s32(v66), (int8x8_t)0x4000000080LL);
    makeentry((char *)v176, 0x100uLL, i, "vltime");
    uint64_t v68 = agetnum((const char *)v176);
    uint64_t v69 = 2592000LL;
    if (v68 >= 0) {
      uint64_t v69 = v68;
    }
    if (v69 >= (uint64_t)&_mh_execute_header)
    {
      v160 = "<%s> vltime (%lld) for %s/%d on %s is out of range";
      goto LABEL_211;
    }

    v57[4].i32[0] = v69;
    makeentry((char *)v176, 0x100uLL, i, "vltimedecr");
    if (agetflag((const char *)v176))
    {
      gettimeofday(v175, 0LL);
      v57[5] = (int8x8_t)(v175[0].tv_sec + v57[4].u32[0]);
    }

    makeentry((char *)v176, 0x100uLL, i, "pltime");
    uint64_t v70 = agetnum((const char *)v176);
    uint64_t v71 = 604800LL;
    if (v70 >= 0) {
      uint64_t v71 = v70;
    }
    if (v71 >= (uint64_t)&_mh_execute_header)
    {
      v160 = "<%s> pltime (%lld) for %s/%d on %s is out of range";
      goto LABEL_211;
    }

    v57[6].i32[0] = v71;
    makeentry((char *)v176, 0x100uLL, i, "pltimedecr");
    if (agetflag((const char *)v176))
    {
      gettimeofday(v175, 0LL);
      v57[7] = (int8x8_t)(v175[0].tv_sec + v57[6].u32[0]);
    }

    insque(v57, v10);
    ++*(_DWORD *)(v9 + 224);
  }

  if (!*(_DWORD *)(v9 + 224)) {
    get_prefix(v9);
  }
  uint64_t v72 = agetnum("mtu");
  unint64_t v73 = v72 & ~(v72 >> 63);
  if (HIDWORD(v73))
  {
    v160 = "<%s> mtu (%ld) on %s out of range";
    goto LABEL_211;
  }

  *(_DWORD *)(v9 + 108) = v73;
  if ((_DWORD)v73)
  {
    if (v73 < 0x500 || *(_DWORD *)(v9 + 80) < v73)
    {
      v160 = "<%s> advertised link mtu (%lu) on %s is invalid (must be between least MTU (%d) and physical link MTU (%d)";
      goto LABEL_211;
    }
  }

  else
  {
    v108 = agetstr("mtu", &v173);
    if (v108 && !strcmp(v108, "auto")) {
      *(_DWORD *)(v9 + 108) = *(_DWORD *)(v9 + 80);
    }
  }

  int v74 = -1;
  *(_DWORD *)(v9 + 288) = 0;
  while (2)
  {
    makeentry((char *)v176, 0x100uLL, v74, "rtprefix");
    v75 = agetstr((const char *)v176, &v173);
    if (v75)
    {
LABEL_84:
      v77 = malloc(0x30uLL);
      if (!v77) {
        goto LABEL_201;
      }
      v78 = v77;
      v77[1] = 0u;
      v77[2] = 0u;
      _OWORD *v77 = 0u;
      insque(v77, v172);
      ++*(_DWORD *)(v9 + 288);
      if (inet_pton(30, v75, v78 + 7) != 1) {
        goto LABEL_210;
      }
      makeentry((char *)v176, 0x100uLL, v74, "rtplen");
      unint64_t v79 = agetnum((const char *)v176);
      if ((v79 & 0x8000000000000000LL) != 0 || v79 == 256)
      {
        makeentry((char *)v175, 0x100uLL, v74, "rtrplen");
        unint64_t v79 = agetnum((const char *)v175);
        if ((v79 & 0x8000000000000000LL) != 0)
        {
          LODWORD(v79) = 64;
          goto LABEL_92;
        }

        unint64_t v80 = v79;
        LODWORD(v79) = 64;
        if (v80 == 256) {
          goto LABEL_92;
        }
        fprintf(__stderrp, "%s was obsoleted.  Use %s.\n", (const char *)v175, (const char *)v176);
        unint64_t v79 = v80;
      }

      if (v79 >= 0x81) {
        goto LABEL_206;
      }
LABEL_92:
      v78[6] = v79;
      makeentry((char *)v176, 0x100uLL, v74, "rtflags");
      v81 = agetstr((const char *)v176, &v173);
      if (v81)
      {
        v82 = v81;
        v83 = strchr(v81, 104);
        v84 = strchr(v82, 108);
        if (v84) {
          char v85 = 24;
        }
        else {
          char v85 = 8 * (v83 != 0LL);
        }
        if (v84 && v83)
        {
          v160 = "<%s> the 'h' and 'l' route preferences are exclusive";
          goto LABEL_211;
        }
      }

      else
      {
        uint64_t v86 = agetnum((const char *)v176);
        if (v86 < 0 || (char v85 = v86, v86 == 256))
        {
          makeentry((char *)v175, 0x100uLL, v74, "rtrflags");
          uint64_t v87 = agetnum((const char *)v175);
          if (v87 < 0 || (char v85 = v87, v87 == 256))
          {
            v78[5] = 0;
            goto LABEL_105;
          }

          fprintf(__stderrp, "%s was obsoleted.  Use %s.\n", (const char *)v175, (const char *)v176);
        }
      }

      v78[5] = v85 & 0x18;
      if ((v85 & 0x18) == 0x10)
      {
        v160 = "<%s> invalid route preference (%02x) for %s/%d on %s";
        goto LABEL_211;
      }

LABEL_105:
      makeentry((char *)v176, 0x100uLL, v74, "rtltime");
      uint64_t v88 = agetnum((const char *)v176);
      if (v88 < 0) {
        unint64_t v89 = -1LL;
      }
      else {
        unint64_t v89 = v88;
      }
      if (v88 < 0)
      {
        makeentry((char *)v175, 0x100uLL, v74, "rtrltime");
        unint64_t v89 = agetnum((const char *)v175);
        if ((v89 & 0x8000000000000000LL) != 0)
        {
          fprintf(__stderrp, "%s should be specified for interface %s.\n", (const char *)v176, v171);
          LODWORD(v89) = *(unsigned __int16 *)(v9 + 84);
LABEL_112:
          v78[4] = v89;
          goto LABEL_113;
        }

        fprintf(__stderrp, "%s was obsoleted.  Use %s.\n", (const char *)v175, (const char *)v176);
      }

      if (HIDWORD(v89))
      {
        v160 = "<%s> route lifetime (%lld) for %s/%d on %s out of range";
        goto LABEL_211;
      }

      goto LABEL_112;
    }

    makeentry((char *)v175, 0x100uLL, v74, "rtrprefix");
    v76 = agetstr((const char *)v175, &v173);
    if (v76)
    {
      v75 = v76;
      fprintf(__stderrp, "%s was obsoleted.  Use %s.\n", (const char *)v175, (const char *)v176);
      goto LABEL_84;
    }

LABEL_113:
    if (++v74 != 100) {
      continue;
    }
    break;
  }

  uint64_t v90 = agetnum("rdnsslifetime");
  unint64_t v97 = *(unsigned int *)(v9 + 88);
  if (v90 >= 0) {
    unint64_t v98 = v90;
  }
  else {
    unint64_t v98 = (2 * v97);
  }
  BOOL v99 = v98 < v97 || v98 > (2 * v97);
  if (v99) {
    rtadvdLog( 0LL,  (uint64_t)"<%s> rdnsslifetime (%lu) on %s SHOULD be between %u and %u",  v91,  v92,  v93,  v94,  v95,  v96,  (uint64_t)"getconfig");
  }
  *(_DWORD *)(v9 + 332) = v98;
  int v100 = agetnum("rdnssaddrs");
  int v101 = v100;
  if (v100 < 0)
  {
    *(_DWORD *)(v9 + 328) = 0;
  }

  else
  {
    *(_DWORD *)(v9 + 328) = v100;
    if (v100)
    {
      int v102 = v100 + 1;
      while (1)
      {
        v103 = malloc(0x20uLL);
        if (!v103) {
          goto LABEL_201;
        }
        v104 = v103;
        _OWORD *v103 = 0u;
        v103[1] = 0u;
        insque(v103, v169);
        makeentry((char *)v176, 0x100uLL, v102 - 2, "rdnssaddr");
        v105 = agetstr((const char *)v176, &v173);
        v106 = v105;
        if (v101 == 1 && !v105)
        {
          __strlcpy_chk(v176, "rdnssaddr", 256LL, 256LL);
          v106 = agetstr((const char *)v176, &v173);
        }

        if (!v106)
        {
          v160 = "<%s> need %s as a DNS server address for interface %s";
          goto LABEL_211;
        }

        v107 = (unsigned __int8 *)(v104 + 1);
        if (inet_pton(30, v106, v107) != 1) {
          goto LABEL_210;
        }
        if (*v107 == 255) {
          break;
        }
      }

      v160 = "<%s> multicast address (%s) must not be advertised as recursive DNS server";
LABEL_211:
      rtadvdLog(0LL, (uint64_t)v160, v28, v29, v30, v31, v32, v33, (uint64_t)"getconfig");
LABEL_212:
      exit(1);
    }
  }

LABEL_143:
  uint64_t v109 = agetnum("dnssllifetime");
  unint64_t v116 = *(unsigned int *)(v9 + 88);
  if (v109 >= 0) {
    unint64_t v117 = v109;
  }
  else {
    unint64_t v117 = (2 * v116);
  }
  if (v117 < v116 || v117 > (2 * v116)) {
    rtadvdLog( 0LL,  (uint64_t)"<%s> dnssllifetime (%lu) on %s SHOULD be between %u and %u",  v110,  v111,  v112,  v113,  v114,  v115,  (uint64_t)"getconfig");
  }
  *(_DWORD *)(v9 + 364) = v117;
  *(_DWORD *)(v9 + 368) = 8;
  int v118 = agetnum("dnssldomains");
  int v119 = v118;
  if (v118 < 0)
  {
    *(_DWORD *)(v9 + 360) = 0;
  }

  else
  {
    *(_DWORD *)(v9 + 360) = v118;
    if (v118)
    {
      while (1)
      {
        makeentry((char *)v176, 0x20uLL, v119 - 1, "dnssldomain");
        v120 = agetstr((const char *)v176, &v173);
        if (!v120)
        {
          if (*(_DWORD *)(v9 + 360) != 1) {
            break;
          }
          __strlcpy_chk(v176, "dnssldomain", 32LL, 32LL);
          v120 = agetstr((const char *)v176, &v173);
          if (!v120) {
            break;
          }
        }

        int v121 = strlen(v120);
        if (v121 >= 1)
        {
          v122 = &v120[v121 - 1 + 1];
          while (*v120 == 46)
          {
            ++v120;
            BOOL v123 = __OFSUB__(v121--, 1);
            if ((v121 < 0) ^ v123 | (v121 == 0))
            {
              int v121 = 0;
              goto LABEL_161;
            }
          }
        }

        v122 = v120;
LABEL_161:
        uint64_t v124 = v121;
        int64_t v125 = ((unint64_t)v121 << 32) + 0x1A00000000LL;
        int v126 = v121 + 3;
        while ((int)v124 >= 1)
        {
          uint64_t v127 = v124 - 1;
          int v128 = v122[v124 - 1];
          v125 -= 0x100000000LL;
          --v126;
          --v124;
          if (v128 != 46)
          {
            size_t v129 = v127 + 1;
            size_t v130 = v125 >> 32;
            v131 = (char *)malloc(v125 >> 32);
            bzero(v131, v130);
            insque(v131, v170);
            memcpy(v131 + 16, v122, v129);
            *(_DWORD *)(v9 + 368) += v126;
            break;
          }
        }

        BOOL v99 = v119-- <= 1;
        if (v99) {
          goto LABEL_167;
        }
      }

      v160 = "<%s> need %s as a DNS search domain for interface %s";
      goto LABEL_211;
    }

LABEL_167:
    *(_DWORD *)(v9 + 368) = (*(_DWORD *)(v9 + 368) & 0xFFFFFFF8) + 8;
  }

  v132 = agetstr("capport", &v173);
  if (v132)
  {
    v133 = v132;
    *(void *)(v9 + 376) = strdup(v132);
    int v134 = strlen(v133);
    *(_DWORD *)(v9 + 384) = v134;
    *(_DWORD *)(v9 + 388) = v134 - (((_BYTE)v134 + 2) & 7) + 10;
  }

  v135 = agetstr("pref64addr", &v173);
  if (v135)
  {
    if (inet_pton(30, v135, (void *)(v9 + 396)) == 1)
    {
      *(_BYTE *)(v9 + 392) = 1;
      uint64_t v136 = agetnum("pref64len");
      if (v136 >= 0) {
        int v137 = v136;
      }
      else {
        int v137 = 64;
      }
      HIDWORD(v139) = v137;
      LODWORD(v139) = v137 - 32;
      unsigned int v138 = v139 >> 3;
      if (v138 >= 9 || ((0x11Fu >> v138) & 1) == 0)
      {
        v160 = "<%s> invalid pref64len";
        goto LABEL_211;
      }

      uint64_t v140 = qword_10000BE30[v138];
      *(_BYTE *)(v9 + 393) = v137;
      unint64_t v141 = agetnum("pref64lifetime");
      if ((v141 & 0x8000000000000000LL) != 0)
      {
        else {
          LOWORD(v141) = 3 * *(_WORD *)(v9 + 88);
        }
      }

      else if (v141 >= 0xFFF9)
      {
        v160 = "<%s> invalid pref64lifetime %d > %d";
        goto LABEL_211;
      }

      __int16 v142 = (v141 & 0xFFF8) + 8;
      if ((v141 & 7) == 0) {
        __int16 v142 = v141;
      }
      *(_WORD *)(v9 + 394) = v142 | v140;
      goto LABEL_187;
    }

LABEL_210:
    v160 = "<%s> inet_pton failed for %s";
    goto LABEL_211;
  }

LABEL_187:
  if (agetflag("pvd"))
  {
    int v143 = agetflag("ra");
    char v144 = *(_BYTE *)(v9 + 413);
    if (v143)
    {
      v144 |= 0x20u;
      *(_BYTE *)(v9 + 413) = v144;
    }

    if (v144 < 0)
    {
      uint64_t v145 = agetnum("delay");
      unint64_t v146 = v145 & ~(v145 >> 63);
      if (v146 >= 0x100)
      {
        v160 = "<%s> invalid pvd option: max 'delay' is %u";
        goto LABEL_211;
      }

      *(_BYTE *)(v9 + 412) = v146 & 0xF;
      uint64_t v147 = agetnum("seqnr");
      unint64_t v148 = v147 & ~(v147 >> 63);
      if (v148 >= 0x10000)
      {
        v160 = "<%s> invalid pvd option: max 'seqnr' is %u";
        goto LABEL_211;
      }

      *(_WORD *)(v9 + 414) = v148;
    }

    v149 = agetstr("pvdid", &v173);
    if (!v149)
    {
      rtadvdLog( 0LL,  (uint64_t)"<%s> invalid pvd option: missing 'pvdid'",  v150,  v151,  v152,  v153,  v154,  v155,  (uint64_t)"getconfig");
      goto LABEL_212;
    }

    v156 = v149;
    *(void *)(v9 + 416) = strdup(v149);
    int v157 = strlen(v156);
    *(_DWORD *)(v9 + 424) = v157;
    *(_DWORD *)(v9 + 428) = v157 - (((_BYTE)v157 + 6) & 7) + 14;
  }

  *(void *)uint64_t v9 = ralist;
  ralist = v9;
  make_packet(v9);
  v158 = rtadvd_add_timer((uint64_t)ra_timeout, (uint64_t)ra_timer_update, v9, v9);
  *(void *)(v9 + 8) = v158;
  ra_timer_update((_DWORD *)v9, (uint64_t)(v158 + 24));
  rtadvd_set_timer(*(void *)(v9 + 8) + 24LL, *(void *)(v9 + 8));
}

size_t makeentry(char *a1, size_t __size, int a3, char *__source)
{
  if (a3 < 0) {
    return strlcpy(a1, __source, __size);
  }
  else {
    return snprintf(a1, __size, "%s%d", __source, a3);
  }
}

void get_prefix(uint64_t a1)
{
  if (getifaddrs(&v33) < 0)
  {
    uint64_t v30 = "<%s> can't get interface addresses";
    goto LABEL_27;
  }

  uint64_t v8 = v33;
  if (!v33)
  {
    uint64_t v29 = 0LL;
    goto LABEL_23;
  }

  uint64_t v9 = (void *)(a1 + 128);
  do
  {
    ifa_addr = v8->ifa_addr;
    if (ifa_addr->sa_family != 30) {
      goto LABEL_20;
    }
    int v11 = (unsigned __int8 *)&ifa_addr->sa_data[6];
    ifa_netmask = v8->ifa_netmask;
    unint64_t v13 = (unint64_t)ifa_netmask + ifa_netmask->sa_len;
    int v14 = prefixlen(&ifa_netmask->sa_data[6], v13);
    if ((v14 - 129) <= 0xFFFFFF7F)
    {
      uint64_t v30 = "<%s> failed to get prefixlen or prefix is invalid";
LABEL_27:
      rtadvdLog(0LL, (uint64_t)v30, v2, v3, v4, v5, v6, v7, (uint64_t)"get_prefix");
      goto LABEL_28;
    }

    int v15 = v14;
    if (v14 == 128 || find_prefix(a1, v11, v14)) {
      goto LABEL_20;
    }
    uint64_t v32 = v9;
    uint64_t v16 = malloc(0x60uLL);
    if (!v16)
    {
      uint64_t v31 = __error();
      strerror(*v31);
      uint64_t v30 = "<%s> malloc failed: %s";
      goto LABEL_27;
    }

    uint64_t v17 = v16;
    v16[3] = 0u;
    v16[4] = 0u;
    v16[1] = 0u;
    v16[2] = 0u;
    v16[5] = 0u;
    uint64_t v18 = v16 + 5;
    *uint64_t v16 = 0u;
    *((_DWORD *)v16 + 18) = v15;
    v16[5] = *(_OWORD *)v11;
    uint64_t v19 = v16 + 5;
    unint64_t v20 = (unint64_t)(v17 + 96);
    uint64_t v21 = (unsigned __int8 *)&ifa_netmask->sa_data[7];
    uint64_t v19 = v18;
    do
    {
      *v19++ &= *(v21 - 1);
      ++v21;
    }

    while ((unint64_t)v19 < v20);
    if ((unint64_t)v19 < v20) {
LABEL_17:
    }
      bzero(v19, v17 - v19 + 96);
    if (!inet_ntop(30, v18, v34, 0x2Eu))
    {
      rtadvdLog(0LL, (uint64_t)"<%s> inet_ntop failed", v22, v23, v24, v25, v26, v27, (uint64_t)"get_prefix");
LABEL_28:
      exit(1);
    }

    rtadvdLog(2LL, (uint64_t)"<%s> add %s/%d to prefix list on %s", v22, v23, v24, v25, v26, v27, (uint64_t)"get_prefix");
    *((_DWORD *)v17 + 8) = 2592000;
    *((_DWORD *)v17 + 12) = 604800;
    *((void *)v17 + 8) = 0x100000001LL;
    *((_DWORD *)v17 + 19) = 1;
    *((void *)v17 + 2) = a1;
    uint64_t v28 = v17;
    uint64_t v9 = v32;
    insque(v28, v32);
    ++*(_DWORD *)(a1 + 224);
LABEL_20:
    uint64_t v8 = v8->ifa_next;
  }

  while (v8);
  uint64_t v29 = v33;
LABEL_23:
  freeifaddrs(v29);
}

void make_packet(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 48))
  {
    int v2 = lladdropt_length(*(void *)(a1 + 56));
    uint64_t v9 = v2;
    if (!v2)
    {
      rtadvdLog( 1LL,  (uint64_t)"<%s> link-layer address option has null length on %s.  Treat as not included.",  v3,  v4,  v5,  v6,  v7,  v8,  (uint64_t)"make_packet");
      *(_DWORD *)(a1 + 48) = 0;
    }

    uint64_t v10 = v9 + 16;
  }

  else
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = 16LL;
  }

  uint64_t v11 = v10 + 32LL * *(int *)(a1 + 224);
  if (*(_DWORD *)(a1 + 108)) {
    v11 += 8LL;
  }
  uint64_t v12 = a1 + 240;
  for (uint64_t i = *(void *)(a1 + 248); i != v12; uint64_t i = *(void *)(i + 8))
    v11 += (int)((((*(_DWORD *)(i + 24) + 63) >> 3) & 0xFFFFFFF8) + 8);
  uint64_t v14 = *(unsigned int *)(a1 + 328);
  else {
    uint64_t v15 = (16 * v14) | 8;
  }
  uint64_t v16 = v15 + v11;
  uint64_t v17 = v16 + *(unsigned int *)(a1 + 388);
  if (*(_BYTE *)(a1 + 392)) {
    v17 += 16LL;
  }
  size_t v18 = v17 + *(unsigned int *)(a1 + 428);
  uint64_t v19 = (int8x8_t *)malloc(v18);
  if (!v19)
  {
    rtadvdLog( 0LL,  (uint64_t)"<%s> can't get enough memory for an RA packet",  v20,  v21,  v22,  v23,  v24,  v25,  (uint64_t)"make_packet");
    goto LABEL_76;
  }

  uint64_t v26 = v19;
  uint64_t v27 = *(void **)(a1 + 440);
  if (v27) {
    free(v27);
  }
  *(void *)(a1 + 432) = v18;
  *(void *)(a1 + 440) = v26;
  v26->i32[0] = 134;
  v26->i8[4] = *(_DWORD *)(a1 + 120);
  v26->i8[5] = *(_DWORD *)(a1 + 104) | ((*(_DWORD *)(a1 + 96) != 0) << 7) | ((*(_DWORD *)(a1 + 100) != 0) << 6);
  v26->i16[3] = bswap32(*(unsigned __int16 *)(a1 + 84)) >> 16;
  v26[1] = vrev32_s8(*(int8x8_t *)(a1 + 112));
  uint64_t v28 = (uint64_t)&v26[2];
  if (*(_DWORD *)(a1 + 48))
  {
    lladdropt_fill(*(void *)(a1 + 56), v28, v20, v21, v22, v23, v24, v25);
    v28 += v9;
  }

  unsigned int v29 = *(_DWORD *)(a1 + 108);
  if (v29)
  {
    *(_DWORD *)uint64_t v28 = 261;
    *(_DWORD *)(v28 + 4) = bswap32(v29);
    v28 += 8LL;
  }

  for (j = *(uint64_t **)(a1 + 128); j != (uint64_t *)(a1 + 128); j = (uint64_t *)*j)
  {
    *(_WORD *)uint64_t v28 = 1027;
    *(_BYTE *)(v28 + 2) = *((_DWORD *)j + 18);
    int v31 = *((_DWORD *)j + 16);
    char v32 = v31 != 0;
    if (v31) {
      char v33 = 0x80;
    }
    else {
      char v33 = 0;
    }
    *(_BYTE *)(v28 + 3) = v32 << 7;
    if (*((_DWORD *)j + 17)) {
      *(_BYTE *)(v28 + 3) = v33 | 0x40;
    }
    if (j[3])
    {
      unsigned int v34 = 0;
    }

    else
    {
      if ((j[5] || j[7]) && (gettimeofday(&v57, 0LL), (__darwin_time_t v35 = j[5]) != 0))
      {
        if (v35 <= v57.tv_sec) {
          unsigned int v34 = 0;
        }
        else {
          unsigned int v34 = v35 - LODWORD(v57.tv_sec);
        }
      }

      else
      {
        unsigned int v34 = *((_DWORD *)j + 8);
      }

      if (!j[3])
      {
        __darwin_time_t v37 = j[7];
        if (v37)
        {
          if (v37 <= v57.tv_sec) {
            unsigned int v36 = 0;
          }
          else {
            unsigned int v36 = v37 - LODWORD(v57.tv_sec);
          }
        }

        else
        {
          unsigned int v36 = *((_DWORD *)j + 12);
        }

        goto LABEL_42;
      }
    }

    unsigned int v36 = 0;
LABEL_42:
    if (v34 < v36) {
      unsigned int v36 = v34;
    }
    *(_DWORD *)(v28 + 4) = bswap32(v34);
    *(void *)(v28 + 8) = bswap32(v36);
    *(_OWORD *)(v28 + 16) = *((_OWORD *)j + 5);
    v28 += 32LL;
  }

  for (uint64_t k = *(void *)(a1 + 248); k != v12; uint64_t k = *(void *)(k + 8))
  {
    int v39 = *(_DWORD *)(k + 24);
    *(_BYTE *)uint64_t v28 = 24;
    *(_BYTE *)(v28 + 1) = ((v39 + 63) >> 6) + 1;
    *(_BYTE *)(v28 + 2) = v39;
    *(_BYTE *)(v28 + 3) = *(_DWORD *)(k + 20);
    *(_DWORD *)(v28 + 4) = bswap32(*(_DWORD *)(k + 16));
    int v40 = (void *)(v28 + 8);
    size_t v41 = ((v39 + 63) >> 3) & 0x7F8;
    memcpy(v40, (const void *)(k + 28), v41);
    uint64_t v28 = (uint64_t)v40 + v41;
  }

  int v42 = *(_DWORD *)(a1 + 328);
  if (v42 >= 1)
  {
    *(_BYTE *)uint64_t v28 = 25;
    *(_BYTE *)(v28 + 1) = (2 * v42) | 1;
    *(_WORD *)(v28 + 2) = 0;
    *(_DWORD *)(v28 + 4) = bswap32(*(_DWORD *)(a1 + 332));
    v28 += 8LL;
    for (m = *(uint64_t **)(a1 + 296); m != (uint64_t *)(a1 + 296); m = (uint64_t *)*m)
    {
      *(_OWORD *)uint64_t v28 = *((_OWORD *)m + 1);
      v28 += 16LL;
    }
  }

  if (*(int *)(a1 + 360) >= 1)
  {
    bzero((void *)v28, *(unsigned int *)(a1 + 368));
    *(_BYTE *)uint64_t v28 = 31;
    unsigned int v44 = *(_DWORD *)(a1 + 368);
    *(_BYTE *)(v28 + 1) = v44 >> 3;
    *(_WORD *)(v28 + 2) = 0;
    *(_DWORD *)(v28 + 4) = bswap32(*(_DWORD *)(a1 + 364));
    uint64_t v45 = *(const char **)(a1 + 336);
    if (v45 != (const char *)(a1 + 336))
    {
      unint64_t v46 = (char *)(v28 + 8);
      do
      {
        v46 += (int)encode_domain(v45 + 16, v46);
        uint64_t v45 = *(const char **)v45;
      }

      while (v45 != (const char *)(a1 + 336));
      unsigned int v44 = *(_DWORD *)(a1 + 368);
    }

    v28 += v44;
  }

  int v47 = *(const void **)(a1 + 376);
  if (v47)
  {
    *(_BYTE *)uint64_t v28 = 37;
    *(_BYTE *)(v28 + 1) = *(_DWORD *)(a1 + 388) >> 3;
    uint64_t v48 = (void *)(v28 + 2);
    memmove(v48, v47, *(unsigned int *)(a1 + 384));
    uint64_t v49 = *(unsigned int *)(a1 + 384);
    uint64_t v28 = (uint64_t)v48 + v49;
    int v50 = *(_DWORD *)(a1 + 388) - 2;
    uint64_t v51 = (v50 - v49);
    if (v50 != (_DWORD)v49)
    {
      bzero((void *)v28, (v50 - v49));
      v28 += v51;
    }
  }

  if (*(_BYTE *)(a1 + 392))
  {
    uint64_t v52 = v28 + 16;
    *(_WORD *)uint64_t v28 = 550;
    *(_WORD *)(v28 + 2) = bswap32(*(unsigned __int16 *)(a1 + 394)) >> 16;
    unint64_t v53 = *(unsigned __int8 *)(a1 + 393);
    v54 = (char *)(v28 + 4);
    memmove(v54, (const void *)(a1 + 396), v53 >> 3);
  }

  else
  {
    uint64_t v52 = v28;
  }

  unsigned int v55 = *(_DWORD *)(a1 + 428);
  if (v55)
  {
    *(_BYTE *)uint64_t v52 = 21;
    *(_BYTE *)(v52 + 1) = v55 >> 3;
    *(_BYTE *)(v52 + 2) = *(_BYTE *)(a1 + 413);
    *(_BYTE *)(v52 + 3) = *(_BYTE *)(a1 + 412);
    *(_WORD *)(v52 + 4) = bswap32(*(unsigned __int16 *)(a1 + 414)) >> 16;
    int v56 = encode_domain(*(const char **)(a1 + 416), (char *)(v52 + 6));
    bzero((void *)(v52 + 6 + v56), (*(_BYTE *)(a1 + 428) - v56 - 6));
    v52 += *(unsigned int *)(a1 + 428);
  }

  if (*(void *)(a1 + 432) != v52 - *(void *)(a1 + 440))
  {
    rtadvdLog( 0LL,  (uint64_t)"<%s> computed size %lu != populated size %lu",  v20,  v21,  v22,  v23,  v24,  v25,  (uint64_t)"make_packet");
LABEL_76:
    exit(1);
  }
}

void delete_prefix(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  remque((void *)a1);
  inet_ntop(30, (const void *)(a1 + 80), v9, 0x2Eu);
  rtadvdLog(2LL, (uint64_t)"<%s> prefix %s/%d was deleted on %s", v3, v4, v5, v6, v7, v8, (uint64_t)"delete_prefix");
  if (*(void *)(a1 + 24)) {
    rtadvd_remove_timer((void **)(a1 + 24));
  }
  free((void *)a1);
  --*(_DWORD *)(v2 + 224);
}

void invalidate_prefix( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(void *)(a1 + 24))
  {
    rtadvdLog( 0LL,  (uint64_t)"<%s> assumption failure: timer already exists",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"invalidate_prefix");
    exit(1);
  }

  inet_ntop(30, (const void *)(a1 + 80), v24, 0x2Eu);
  rtadvdLog( 2LL,  (uint64_t)"<%s> prefix %s/%d was invalidated on %s, will expire in %ld seconds",  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"invalidate_prefix");
  uint64_t v15 = rtadvd_add_timer((uint64_t)prefix_timeout, 0LL, a1, 0LL);
  *(void *)(a1 + 24) = v15;
  if (v15)
  {
    uint64_t v22 = 7200LL;
    int v23 = 0;
    rtadvd_set_timer((uint64_t)&v22, (uint64_t)v15);
  }

  else
  {
    rtadvdLog( 0LL,  (uint64_t)"<%s> failed to add a timer for a prefix. remove the prefix",  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)"invalidate_prefix");
    delete_prefix(a1);
  }

uint64_t prefix_timeout(uint64_t a1)
{
  return 0LL;
}

void update_prefix( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (void **)(a1 + 24);
  if (!*(void *)(a1 + 24))
  {
    rtadvdLog( 0LL,  (uint64_t)"<%s> assumption failure: timer does not exist",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"update_prefix");
    exit(1);
  }

  inet_ntop(30, (const void *)(a1 + 80), v15, 0x2Eu);
  rtadvdLog( 2LL,  (uint64_t)"<%s> prefix %s/%d was re-enabled on %s",  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"update_prefix");
  rtadvd_remove_timer(v8);
}

void make_prefix(uint64_t a1, unsigned int a2, _OWORD *a3, unsigned __int8 a4)
{
  *(_OWORD *)uint64_t v28 = 0u;
  __int128 v29 = 0u;
  if (!if_indextoname(a2, v28))
  {
    uint64_t v14 = __error();
    strerror(*v14);
    rtadvdLog( 0LL,  (uint64_t)"<%s> Prefix added interface No.%d doesn'texist. This should not happen! %s",  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t)"make_prefix");
    goto LABEL_6;
  }

  WORD2(v30[0]) = 7708;
  *(_OWORD *)((char *)v30 + 12) = *a3;
  BYTE1(v29) = a4;
  *(void *)((char *)&v29 + 4) = 0x93A8000278D00LL;
  BYTE12(v29) |= 3u;
  uint64_t v7 = malloc(0x60uLL);
  if (!v7)
  {
    uint64_t v21 = __error();
    strerror(*v21);
    rtadvdLog(0LL, (uint64_t)"<%s> malloc failed: %s", v22, v23, v24, v25, v26, v27, (uint64_t)"add_prefix");
LABEL_6:
    exit(1);
  }

  v7[2] = 0u;
  v7[3] = 0u;
  *uint64_t v7 = 0u;
  v7[1] = 0u;
  v7[5] = *a3;
  *((_DWORD *)v7 + 8) = 2592000;
  *((_DWORD *)v7 + 12) = 604800;
  *((void *)v7 + 8) = 0x100000001LL;
  *((_DWORD *)v7 + 18) = a4;
  *((_DWORD *)v7 + 19) = 3;
  *((void *)v7 + 2) = a1;
  insque(v7, (void *)(a1 + 128));
  inet_ntop(30, (char *)v30 + 12, v31, 0x2Eu);
  rtadvdLog(2LL, (uint64_t)"<%s> new prefix %s/%d was added on %s", v8, v9, v10, v11, v12, v13, (uint64_t)"add_prefix");
  free(*(void **)(a1 + 440));
  *(void *)(a1 + 440) = 0LL;
  ++*(_DWORD *)(a1 + 224);
  make_packet(a1);
}

uint64_t encode_domain(const char *a1, char *a2)
{
  uint64_t v3 = strdup(a1);
  __stringp = v3;
  uint64_t v4 = strsep(&__stringp, ".");
  uint64_t v5 = a2;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v5 = a2;
    do
    {
      char v7 = strlen(v6);
      if ((v7 & 0x3F) != 0)
      {
        *uint64_t v5 = v7 & 0x3F;
        uint64_t v8 = v5 + 1;
        size_t v9 = v7 & 0x3F;
        memcpy(v8, v6, v9);
        uint64_t v5 = &v8[v9];
      }

      uint64_t v6 = strsep(&__stringp, ".");
    }

    while (v6);
  }

  *uint64_t v5 = 0;
  free(v3);
  return ((_DWORD)v5 - (_DWORD)a2 + 1);
}

uint64_t rtadvd_dump_file( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  fp = (uint64_t)fopen(a1, "w");
  if (!fp) {
    return rtadvdLog( 0LL,  (uint64_t)"<%s> open a dump file(%s)",  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"rtadvd_dump_file");
  }
  gettimeofday(&v57, 0LL);
  for (uint64_t i = ralist; i; uint64_t i = *(void *)i)
  {
    fprintf((FILE *)fp, "%s:\n", (const char *)(i + 64));
    interface_entry = get_interface_entry(*(_DWORD *)(i + 44));
    if (interface_entry)
    {
      uint64_t v23 = "UP";
      fprintf((FILE *)fp, "  Status: %s\n", v23);
      if (*(void *)(i + 24))
      {
        uint64_t v24 = (FILE *)fp;
        uint64_t v25 = ctime((const time_t *)(i + 24));
        fprintf(v24, "  Last RA sent: %s", v25);
      }

      uint64_t v26 = *(void *)(i + 8);
      uint64_t v27 = (FILE *)fp;
      if (v26)
      {
        uint64_t v28 = ctime((const time_t *)(v26 + 24));
        fprintf(v27, "  Next RA will be sent: %s", v28);
      }

      else
      {
        fwrite("  RA timer is stopped", 0x15uLL, 1uLL, (FILE *)fp);
      }

      fprintf((FILE *)fp, "  waits: %d, initcount: %d\n", *(_DWORD *)(i + 40), *(_DWORD *)(i + 16));
      fprintf( (FILE *)fp,  "  statistics: RA(out/in/inconsistent): %llu/%llu/%llu, ",  *(void *)(i + 448),  *(void *)(i + 456),  *(void *)(i + 464));
      fprintf((FILE *)fp, "RS(input): %llu\n", *(void *)(i + 472));
      if (*(_DWORD *)(i + 48))
      {
        __int128 v29 = (FILE *)fp;
        uint64_t v30 = *(void *)(i + 56);
        if (*(unsigned __int8 *)(v30 + 6) >= 6u)
        {
          int v31 = (unsigned __int8 *)(v30 + *(unsigned __int8 *)(v30 + 5));
          snprintf( (char *)&ether_str_hbuf,  0x20uLL,  "%x:%x:%x:%x:%x:%x",  v31[8],  v31[9],  v31[10],  v31[11],  v31[12],  v31[13]);
        }

        else
        {
          strcpy((char *)&ether_str_hbuf, "NONE");
        }

        fprintf(v29, "  Link-layer address: %s\n", (const char *)&ether_str_hbuf);
      }

      fprintf((FILE *)fp, "  MTU: %d\n", *(_DWORD *)(i + 80));
      fprintf( (FILE *)fp,  "  DefaultLifetime: %d, MaxAdvInterval: %d, MinAdvInterval: %d\n",  *(unsigned __int16 *)(i + 84),  *(_DWORD *)(i + 88),  *(_DWORD *)(i + 92));
      char v32 = "M";
      if (!*(_DWORD *)(i + 96)) {
        char v32 = (const char *)&unk_10000A8BE;
      }
      char v33 = "O";
      if (!*(_DWORD *)(i + 100)) {
        char v33 = (const char *)&unk_10000A8BE;
      }
      fprintf((FILE *)fp, "  Flags: %s%s%s, ", v32, v33, (const char *)&unk_10000A8BE);
      fprintf((FILE *)fp, "Preference: %s, ", *(char **)((char *)rtpref_str + (*(_DWORD *)(i + 104) & 0x7F8)));
      fprintf((FILE *)fp, "MTU: %d\n", *(_DWORD *)(i + 108));
      fprintf( (FILE *)fp,  "  ReachableTime: %d, RetransTimer: %d, CurHopLimit: %d\n",  *(_DWORD *)(i + 112),  *(_DWORD *)(i + 116),  *(_DWORD *)(i + 120));
      if (*(void *)(i + 232)) {
        fprintf((FILE *)fp, "  Clock skew: %ldsec\n", *(void *)(i + 232));
      }
      unsigned int v34 = *(uint64_t **)(i + 128);
      if (v34 != (uint64_t *)(i + 128))
      {
        char v35 = 0;
        __darwin_time_t tv_sec = v57.tv_sec;
        while (1)
        {
          if ((v35 & 1) == 0) {
            fwrite("  Prefixes:\n", 0xCuLL, 1uLL, (FILE *)fp);
          }
          __darwin_time_t v37 = (FILE *)fp;
          unint64_t v38 = inet_ntop(30, v34 + 10, v58, 0x2Eu);
          fprintf(v37, "    %s/%d(", v38, *((_DWORD *)v34 + 18));
          int v39 = *((_DWORD *)v34 + 19);
          if (v39 == 3) {
            break;
          }
          if (v39 == 2)
          {
            int v40 = (FILE *)fp;
            size_t v41 = "CONFIG, ";
LABEL_33:
            size_t v42 = 8LL;
LABEL_34:
            fwrite(v41, v42, 1uLL, v40);
            goto LABEL_35;
          }

          if (v39 == 1)
          {
            int v40 = (FILE *)fp;
            size_t v41 = "KERNEL, ";
            goto LABEL_33;
          }

LABEL_35:
          if (*((_DWORD *)v34 + 8) == -1) {
            fwrite("vltime: infinity", 0x10uLL, 1uLL, (FILE *)fp);
          }
          else {
            fprintf((FILE *)fp, "vltime: %ld", *((unsigned int *)v34 + 8));
          }
          __darwin_time_t v43 = v34[5];
          if (v43)
          {
            BOOL v44 = v43 <= tv_sec;
            __darwin_time_t v45 = v43 - tv_sec;
            if (v44) {
              __darwin_time_t v45 = 0LL;
            }
            fprintf((FILE *)fp, "(decr,expire %ld), ", v45);
          }

          else
          {
            fwrite(", ", 2uLL, 1uLL, (FILE *)fp);
          }

          if (*((_DWORD *)v34 + 12) == -1) {
            fwrite("pltime: infinity", 0x10uLL, 1uLL, (FILE *)fp);
          }
          else {
            fprintf((FILE *)fp, "pltime: %ld", *((unsigned int *)v34 + 12));
          }
          __darwin_time_t v46 = v34[7];
          if (v46)
          {
            BOOL v44 = v46 <= tv_sec;
            __darwin_time_t v47 = v46 - tv_sec;
            if (v44) {
              __darwin_time_t v47 = 0LL;
            }
            fprintf((FILE *)fp, "(decr,expire %ld), ", v47);
          }

          else
          {
            fwrite(", ", 2uLL, 1uLL, (FILE *)fp);
          }

          uint64_t v48 = "L";
          if (!*((_DWORD *)v34 + 16)) {
            uint64_t v48 = (const char *)&unk_10000A8BE;
          }
          uint64_t v49 = "A";
          if (!*((_DWORD *)v34 + 17)) {
            uint64_t v49 = (const char *)&unk_10000A8BE;
          }
          fprintf((FILE *)fp, "flags: %s%s%s", v48, v49, (const char *)&unk_10000A8BE);
          uint64_t v50 = v34[3];
          if (v50)
          {
            uint64_t v51 = rtadvd_timer_rest(v50);
            if (v51) {
              fprintf((FILE *)fp, ", expire in: %ld", *v51);
            }
          }

          char v35 = 1;
          fwrite(")\n", 2uLL, 1uLL, (FILE *)fp);
          unsigned int v34 = (uint64_t *)*v34;
        }

        int v40 = (FILE *)fp;
        size_t v41 = "DYNAMIC, ";
        size_t v42 = 9LL;
        goto LABEL_34;
      }

LABEL_61:
      uint64_t v52 = *(void *)(i + 248);
      if (v52 != i + 240)
      {
        char v53 = 0;
        do
        {
          if ((v53 & 1) == 0) {
            fwrite("  Route Information:\n", 0x15uLL, 1uLL, (FILE *)fp);
          }
          v54 = (FILE *)fp;
          unsigned int v55 = inet_ntop(30, (const void *)(v52 + 28), v58, 0x2Eu);
          fprintf(v54, "    %s/%d (", v55, *(_DWORD *)(v52 + 24));
          fprintf((FILE *)fp, "preference: %s, ", *(char **)((char *)rtpref_str + (*(_DWORD *)(v52 + 20) & 0x7F8)));
          if (*(_DWORD *)(v52 + 16) == -1) {
            fwrite("lifetime: infinity", 0x12uLL, 1uLL, (FILE *)fp);
          }
          else {
            fprintf((FILE *)fp, "lifetime: %ld", *(unsigned int *)(v52 + 16));
          }
          char v53 = 1;
          fwrite(")\n", 2uLL, 1uLL, (FILE *)fp);
          uint64_t v52 = *(void *)(v52 + 8);
        }

        while (v52 != i + 240);
      }
    }

    else
    {
      rtadvdLog( 2LL,  (uint64_t)"Skippingg RA entry for interface %sas we couldn't find interface entry for it.",  v17,  v18,  v19,  v20,  v21,  v22,  i + 64);
    }
  }

  return fclose((FILE *)fp);
}

void *if_nametosdl(const char *a1)
{
  *(_OWORD *)uint64_t v21 = xmmword_10000BE80;
  uint64_t v22 = 3LL;
  if (sysctl(v21, 6u, 0LL, __size, 0LL, 0LL) < 0) {
    return 0LL;
  }
  uint64_t v2 = (unsigned __int16 *)malloc(__size[0]);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = v2;
  if (sysctl(v21, 6u, v2, __size, 0LL, 0LL) < 0)
  {
LABEL_32:
    free(v3);
    return 0LL;
  }

  if ((uint64_t)__size[0] < 1)
  {
    if (__size[0]) {
      goto LABEL_30;
    }
    goto LABEL_32;
  }

  uint64_t v4 = 0LL;
  uint64_t v5 = (unsigned __int16 *)((char *)v3 + __size[0]);
  uint64_t v6 = v3;
  while (1)
  {
    if (*((_BYTE *)v6 + 3) != 14) {
      goto LABEL_24;
    }
    uint64_t v7 = 0LL;
    uint64_t v8 = v6 + 56;
    unsigned int v9 = *((_DWORD *)v6 + 1);
    do
    {
      if (((v9 >> v7) & 1) != 0)
      {
        __size[v7 + 1] = (size_t)v8;
        uint64_t v10 = *v8;
        if ((v10 & 3) != 0) {
          uint64_t v11 = (v10 | 3) + 1;
        }
        else {
          uint64_t v11 = *v8;
        }
        if (*v8) {
          uint64_t v12 = v11;
        }
        else {
          uint64_t v12 = 4LL;
        }
        v8 += v12;
      }

      else
      {
        __size[v7 + 1] = 0LL;
      }

      ++v7;
    }

    while (v7 != 8);
    uint64_t v13 = v20;
    if (!v20 || v20[1] != 18) {
      goto LABEL_24;
    }
    size_t v14 = strlen(a1);
    if (v14 != *((unsigned __int8 *)v20 + 5))
    {
      uint64_t v4 = v20;
      goto LABEL_24;
    }

    uint64_t v4 = v20;
    if (!strncmp(v20 + 8, a1, v14)) {
      break;
    }
LABEL_24:
    uint64_t v6 = (unsigned __int16 *)((char *)v6 + *v6);
    if (v6 >= v5) {
      goto LABEL_25;
    }
  }

  uint64_t v4 = v13;
LABEL_25:
  if (v6 == v5) {
    goto LABEL_32;
  }
  if (!v4)
  {
LABEL_30:
    uint64_t v17 = 0LL;
    goto LABEL_31;
  }

  size_t v15 = *(unsigned __int8 *)v4;
  uint64_t v16 = malloc(v15);
  uint64_t v17 = v16;
  if (v16) {
    memcpy(v16, v4, v15);
  }
LABEL_31:
  free(v3);
  return v17;
}

uint64_t if_getmtu(const char *a1)
{
  if (getifaddrs(&v8) < 0) {
    return 0LL;
  }
  uint64_t v2 = &v8;
  do
  {
    uint64_t v2 = (ifaddrs **)*v2;
    if (!v2) {
      goto LABEL_8;
    }
  }

  while (strcmp((const char *)v2[1], a1));
  uint64_t v3 = v2[6];
  if (!v3)
  {
LABEL_8:
    freeifaddrs(v8);
    goto LABEL_9;
  }

  uint64_t ifa_name_low = LODWORD(v3->ifa_name);
  freeifaddrs(v8);
  if ((_DWORD)ifa_name_low) {
    return ifa_name_low;
  }
LABEL_9:
  int v5 = socket(30, 2, 0);
  if (v5 < 0) {
    return 0LL;
  }
  int v6 = v5;
  BYTE1(v10) = 30;
  __strlcpy_chk(v9, a1, 16LL, 16LL);
  if (ioctl(v6, 0xC0206933uLL, v9) < 0)
  {
    close(v6);
    return 0LL;
  }

  close(v6);
  return v10;
}

uint64_t if_getflags(unsigned int a1, int a2)
{
  int v4 = socket(30, 2, 0);
  if (v4 < 0)
  {
    uint64_t v13 = __error();
    strerror(*v13);
    rtadvdLog(0LL, (uint64_t)"<%s> socket: %s", v14, v15, v16, v17, v18, v19, (uint64_t)"if_getflags");
  }

  else
  {
    int v5 = v4;
    if_indextoname(a1, v20);
    if ((ioctl(v5, 0xC0206911uLL, v20) & 0x80000000) == 0)
    {
      close(v5);
      return v21;
    }

    rtadvdLog(0LL, (uint64_t)"<%s> ioctl:SIOCGIFFLAGS: failed for %s", v6, v7, v8, v9, v10, v11, (uint64_t)"if_getflags");
    close(v5);
  }

  return a2 & 0xFFFFFFFE;
}

uint64_t lladdropt_length(uint64_t a1)
{
  return 8 * (*(_BYTE *)(a1 + 4) == 6);
}

uint64_t lladdropt_fill( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)a2 = 1;
  if (*(_BYTE *)(result + 4) != 6)
  {
    rtadvdLog(0LL, (uint64_t)"<%s> unsupported link type(%d)", a3, a4, a5, a6, a7, a8, (uint64_t)"lladdropt_fill");
    exit(1);
  }

  *(_BYTE *)(a2 + 1) = 1;
  uint64_t v8 = result + *(unsigned __int8 *)(result + 5);
  int v9 = *(_DWORD *)(v8 + 8);
  *(_WORD *)(a2 + 6) = *(_WORD *)(v8 + 12);
  *(_DWORD *)(a2 + 2) = v9;
  return result;
}

unsigned __int16 *get_next_msg( unsigned __int16 *a1, unint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *a4 = 0LL;
  if ((unint64_t)a1 < a2)
  {
    uint64_t v8 = a1;
    while (1)
    {
      uint64_t v9 = *v8;
      if (!*v8)
      {
        rtadvdLog( 0LL,  (uint64_t)"<%s> rtm_msglen is 0 (buf=%p lim=%p rtm=%p)",  a3,  (uint64_t)a4,  a5,  a6,  a7,  a8,  (uint64_t)"get_next_msg");
        return v8;
      }

      unsigned int v10 = *((unsigned __int8 *)v8 + 3);
      if (((a5 >> v10) & 1) != 0 && v10 <= 0xE)
      {
        if (((1 << v10) & 0x16) != 0)
        {
          uint64_t v11 = 0LL;
          uint64_t v12 = v8 + 46;
          unsigned int v13 = *((_DWORD *)v8 + 3);
          do
          {
            if (((v13 >> v11) & 1) != 0)
            {
              (&v27)[v11] = v12;
              uint64_t v14 = *v12;
              if ((v14 & 3) != 0) {
                uint64_t v15 = (v14 | 3) + 1;
              }
              else {
                uint64_t v15 = *v12;
              }
              if (*v12) {
                uint64_t v16 = v15;
              }
              else {
                uint64_t v16 = 4LL;
              }
              v12 += v16;
            }

            else
            {
              (&v27)[v11] = 0LL;
            }

            ++v11;
          }

          while (v11 != 8);
          if (v27)
          {
            if (v27[1] == 30)
            {
              int v17 = v27[8];
              if (v17 != 255
                && (v17 != 254 || (v27[9] & 0xC0) != 0x80)
                && v28
                && *(_BYTE *)(v28 + 1) == 18
                && (!(_DWORD)a3 || *(unsigned __int16 *)(v28 + 2) == (_DWORD)a3)
                && v29)
              {
                goto LABEL_56;
              }
            }
          }
        }

        else if (((1 << v10) & 0x3000) != 0)
        {
          uint64_t v18 = 0LL;
          uint64_t v19 = v8 + 10;
          unsigned int v20 = *((_DWORD *)v8 + 1);
          do
          {
            if (((v20 >> v18) & 1) != 0)
            {
              (&v27)[v18] = v19;
              uint64_t v21 = *v19;
              if ((v21 & 3) != 0) {
                uint64_t v22 = (v21 | 3) + 1;
              }
              else {
                uint64_t v22 = *v19;
              }
              if (*v19) {
                uint64_t v23 = v22;
              }
              else {
                uint64_t v23 = 4LL;
              }
              v19 += v23;
            }

            else
            {
              (&v27)[v18] = 0LL;
            }

            ++v18;
          }

          while (v18 != 8);
          if (v30)
          {
            int v24 = v30[1];
            if (v24 == 2 || v24 == 30 && (int v25 = v30[8], v25 != 255) && (v25 != 254 || (v30[9] & 0xC0) != 0x80))
            {
              if (!(_DWORD)a3 || v8[6] == (_DWORD)a3)
              {
LABEL_56:
                *a4 = v9;
                return v8;
              }
            }
          }
        }

        else if (v10 == 14)
        {
          goto LABEL_56;
        }
      }

      uint64_t v8 = (unsigned __int16 *)((char *)v8 + v9);
    }
  }

  return a1;
}

uint64_t get_addr(uint64_t a1)
{
  uint64_t v1 = 0LL;
  uint64_t v2 = (_BYTE *)(a1 + 92);
  unsigned int v3 = *(_DWORD *)(a1 + 12);
  do
  {
    if (((v3 >> v1) & 1) != 0)
    {
      v8[v1] = v2;
      uint64_t v4 = *v2;
      if ((v4 & 3) != 0) {
        uint64_t v5 = (v4 | 3) + 1;
      }
      else {
        uint64_t v5 = *v2;
      }
      if (*v2) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 4LL;
      }
      v2 += v6;
    }

    else
    {
      v8[v1] = 0LL;
    }

    ++v1;
  }

  while (v1 != 8);
  return v8[0] + 8LL;
}

uint64_t get_rtm_ifindex(uint64_t a1)
{
  uint64_t v1 = 0LL;
  uint64_t v2 = (_BYTE *)(a1 + 92);
  unsigned int v3 = *(_DWORD *)(a1 + 12);
  do
  {
    if (((v3 >> v1) & 1) != 0)
    {
      *(void *)&v8[8 * v1] = v2;
      uint64_t v4 = *v2;
      if ((v4 & 3) != 0) {
        uint64_t v5 = (v4 | 3) + 1;
      }
      else {
        uint64_t v5 = *v2;
      }
      if (*v2) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 4LL;
      }
      v2 += v6;
    }

    else
    {
      *(void *)&v8[8 * v1] = 0LL;
    }

    ++v1;
  }

  while (v1 != 8);
  return *(unsigned __int16 *)(v9 + 2);
}

uint64_t get_ifm_ifindex(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 12);
}

uint64_t get_ifm_flags(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t get_prefixlen(uint64_t a1)
{
  uint64_t v1 = 0LL;
  uint64_t v2 = (_BYTE *)(a1 + 92);
  unsigned int v3 = *(_DWORD *)(a1 + 12);
  do
  {
    if (((v3 >> v1) & 1) != 0)
    {
      v8[v1] = v2;
      uint64_t v4 = *v2;
      if ((v4 & 3) != 0) {
        uint64_t v5 = (v4 | 3) + 1;
      }
      else {
        uint64_t v5 = *v2;
      }
      if (*v2) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 4LL;
      }
      v2 += v6;
    }

    else
    {
      v8[v1] = 0LL;
    }

    ++v1;
  }

  while (v1 != 8);
  return prefixlen(v9 + 8, (unint64_t)&v9[*v9]);
}

uint64_t prefixlen(_BYTE *a1, unint64_t a2)
{
  uint64_t v2 = 0LL;
  unint64_t v3 = a2 - (void)a1;
  do
  {
    unsigned int v4 = *a1;
    uint64_t v5 = 0xFFFFFFFFLL;
    if (v4 > 0xDF)
    {
      switch(*a1)
      {
        case 0xF8:
          uint64_t v2 = (v2 + 5);
          break;
        case 0xF9:
        case 0xFA:
        case 0xFB:
        case 0xFD:
          return v5;
        case 0xFC:
          uint64_t v2 = (v2 + 6);
          break;
        case 0xFE:
          uint64_t v2 = (v2 + 7);
          break;
        case 0xFF:
          uint64_t v2 = (v2 + 8);
          break;
        default:
          if (v4 == 224)
          {
            uint64_t v2 = (v2 + 3);
          }

          else
          {
            if (v4 != 240) {
              return v5;
            }
            uint64_t v2 = (v2 + 4);
          }

          break;
      }
    }

    else if (*a1)
    {
      if (v4 == 128)
      {
        uint64_t v2 = (v2 + 1);
      }

      else
      {
        if (v4 != 192) {
          return v5;
        }
        uint64_t v2 = (v2 + 2);
      }
    }

    ++a1;
    uint64_t v5 = v2;
    --v3;
  }

  while (v3);
  return v5;
}

uint64_t rtmsg_type(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 3);
}

uint64_t rtmsg_len(unsigned __int16 *a1)
{
  return *a1;
}

unsigned __int16 *get_interface_entry(int a1)
{
  uint64_t v1 = &ifilist;
  while (1)
  {
    uint64_t v1 = (_UNKNOWN **)*v1;
    if (!v1) {
      break;
    }
    uint64_t v2 = (unsigned __int16 *)v1[2];
    if (v2[6] == a1) {
      return v2;
    }
  }

  return 0LL;
}

uint64_t init_iflist()
{
  for (uint64_t i = (uint64_t *)ifilist; ifilist; uint64_t i = (uint64_t *)ifilist)
  {
    uint64_t v1 = *i;
    uint64_t v2 = (void *)i[1];
    if (*i)
    {
      *(void *)(v1 + 8) = v2;
      uint64_t v2 = (void *)i[1];
    }

    else
    {
      off_100010010 = (_UNKNOWN **)i[1];
    }

    void *v2 = v1;
    free(i);
  }

  if (ifblock)
  {
    free((void *)ifblock);
    ifblock_size = 0LL;
  }

  *(_OWORD *)int v25 = xmmword_10000BEA0;
  uint64_t v26 = 3LL;
  if (sysctl(v25, 6u, 0LL, (size_t *)&ifblock_size, 0LL, 0LL) < 0)
  {
    uint64_t v24 = (uint64_t)"get_iflist";
    uint64_t v22 = "<%s> sysctl: iflist size get failed";
LABEL_35:
    rtadvdLog(0LL, (uint64_t)v22, v3, v4, v5, v6, v7, v8, v24);
LABEL_36:
    exit(1);
  }

  uint64_t v9 = malloc(ifblock_size);
  ifblocuint64_t k = (uint64_t)v9;
  if (!v9)
  {
    rtadvdLog(0LL, (uint64_t)"<%s> malloc failed", v10, v11, v12, v13, v14, v15, (uint64_t)"get_iflist");
    goto LABEL_36;
  }

  uint64_t result = sysctl(v25, 6u, v9, (size_t *)&ifblock_size, 0LL, 0LL);
  if ((result & 0x80000000) != 0)
  {
    uint64_t v24 = (uint64_t)"get_iflist";
    uint64_t v22 = "<%s> sysctl: iflist get failed";
    goto LABEL_35;
  }

  if (ifblock_size >= 1)
  {
    unint64_t v17 = ifblock + ifblock_size;
    j = (unsigned __int16 *)ifblock;
LABEL_13:
    while (1)
    {
      unsigned int v19 = *j;
      if (!*j) {
        return rtadvdLog( 0LL,  (uint64_t)"<%s> ifm_msglen is 0 (buf=%p lim=%p ifm=%p)",  v3,  v4,  v5,  v6,  v7,  v8,  (uint64_t)"parse_iflist");
      }
      if (*((_BYTE *)j + 3) != 14)
      {
        uint64_t v24 = 14LL;
        uint64_t v22 = "out of sync parsing NET_RT_IFLIST\nexpected %d, got %d\n msglen = %d\nbuf:%p, ifm:%p, lim:%p\n";
        goto LABEL_35;
      }

      unsigned int v20 = &ifilist;
      while (1)
      {
        unsigned int v20 = (_UNKNOWN **)*v20;
        if (!v20) {
          break;
        }
        if (*((unsigned __int16 *)v20[2] + 6) == j[6])
        {
          rtadvdLog( 2LL,  (uint64_t)"Interface entry is already present for interface index: %d. Skipping.",  v3,  v4,  v5,  v6,  v7,  v8,  j[6]);
          goto LABEL_13;
        }
      }

      uint64_t result = (uint64_t)malloc(0x18uLL);
      if (!result)
      {
        uint64_t v23 = __error();
        uint64_t v24 = (uint64_t)"parse_iflist";
        strerror(*v23);
        uint64_t v22 = "<%s> malloc failed: %s";
        goto LABEL_35;
      }

      uint64_t v21 = (uint64_t *)off_100010010;
      *(void *)uint64_t result = 0LL;
      *(void *)(result + 8) = v21;
      *(void *)(result + 16) = j;
      *uint64_t v21 = result;
      off_100010010 = (_UNKNOWN **)result;
      for (j = (unsigned __int16 *)((char *)j + v19); (unint64_t)j < v17; j = (unsigned __int16 *)((char *)j + *j))
      {
        if (!*j) {
          return rtadvdLog( 0LL,  (uint64_t)"<%s> ifa_msglen is 0 (buf=%p lim=%p ifam=%p)",  v3,  v4,  v5,  v6,  v7,  v8,  (uint64_t)"parse_iflist");
        }
        if (*((_BYTE *)j + 3) != 12) {
          break;
        }
      }
    }
  }

  return result;
}

_DWORD *rr_input(unsigned int a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, void *a5)
{
  char v144 = a5;
  uint64_t v8 = (const void *)(a4 + 8);
  uint64_t v9 = inet_ntop(30, (const void *)(a4 + 8), v147, 0x2Eu);
  unint64_t v139 = inet_ntop(30, &v144, v148, 0x2Eu);
  uint64_t v140 = if_indextoname(*((_DWORD *)a3 + 4), v146);
  unsigned int v138 = (char *)v9;
  uint64_t result = (_DWORD *)rtadvdLog( 2LL,  (uint64_t)"<%s> RR received from %s to %s on %s",  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"rr_input");
  if (a1 <= 0xF)
  {
    inet_ntop(30, v8, v147, 0x2Eu);
    inet_ntop(30, &v144, v148, 0x2Eu);
    if_indextoname(*((_DWORD *)a3 + 4), v146);
    return (_DWORD *)rtadvdLog( 0LL,  (uint64_t)"<%s>: RR short message (size %d) from %s to %s on %s",  v23,  v24,  v25,  v26,  v27,  v28,  (uint64_t)"rr_input");
  }

  if (*a3 == 255
    && ((void)in6a_site_allrouters != *(void *)a3 || *((void *)&in6a_site_allrouters + 1) != *((void *)a3 + 1)))
  {
    inet_ntop(30, &v144, v147, 0x2Eu);
    inet_ntop(30, v8, v148, 0x2Eu);
    if_indextoname(*((_DWORD *)a3 + 4), v146);
    return (_DWORD *)rtadvdLog( 0LL,  (uint64_t)"<%s>: RR message with invalid destination (%s) from %s on %s",  v37,  v38,  v39,  v40,  v41,  v42,  (uint64_t)"rr_input");
  }

  int v29 = *(unsigned __int8 *)(a2 + 1);
  if (v29 != 255 && v29 != 1)
  {
    if (*(_BYTE *)(a2 + 1)) {
      return (_DWORD *)rtadvdLog( 0LL,  (uint64_t)"<%s> received unknown code %d",  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)"rr_input");
    }
    if (a1 <= 0x27)
    {
      rtadvdLog( 0LL,  (uint64_t)"<%s> rr_command len %d is too short",  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)"rr_command_check");
      return (_DWORD *)rtadvdLog( 0LL,  (uint64_t)"<%s> received RR was invalid",  v30,  v31,  v32,  v33,  v34,  v35,  (uint64_t)"rr_command_input");
    }

    if (*(unsigned __int8 *)v144 == 255)
    {
      char v57 = *((_BYTE *)v144 + 1);
      int v58 = v57 & 0xF;
      BOOL v59 = (v57 & 0xF0) != 0x30 && v58 == 2;
      BOOL v60 = v59;
      if (v58 != 5 && !v60)
      {
        inet_ntop(30, v144, (char *)&v149, 0x2Eu);
        rtadvdLog( 0LL,  (uint64_t)"<%s> dst mcast addr %s is illegal",  v61,  v62,  v63,  v64,  v65,  v66,  (uint64_t)"rr_command_check");
        return (_DWORD *)rtadvdLog( 0LL,  (uint64_t)"<%s> received RR was invalid",  v30,  v31,  v32,  v33,  v34,  v35,  (uint64_t)"rr_command_input");
      }
    }

    unint64_t v43 = *(unsigned int *)(a2 + 4);
    if (rro > v43)
    {
      inet_ntop(30, v8, (char *)&v149, 0x2Eu);
      rtadvdLog( 0LL,  (uint64_t)"<%s> rcvd old seqnum %d from %s",  v44,  v45,  v46,  v47,  v48,  v49,  (uint64_t)"rr_command_check");
      return (_DWORD *)rtadvdLog( 0LL,  (uint64_t)"<%s> received RR was invalid",  v30,  v31,  v32,  v33,  v34,  v35,  (uint64_t)"rr_command_input");
    }

    if (rro == v43)
    {
      int v50 = *(char *)(a2 + 9);
      if ((v50 & 0x80000000) == 0
        && (*(uint64_t *)((char *)&rro + (((unint64_t)*(unsigned __int8 *)(a2 + 8) >> 2) & 0x38) + 8) & (1 << *(_BYTE *)(a2 + 8))) != 0)
      {
        if ((v50 & 0x40) != 0)
        {
          unsigned int v138 = (char *)*(unsigned __int8 *)(a2 + 8);
          unint64_t v139 = inet_ntop(30, v8, (char *)&v149, 0x2Eu);
          uint64_t result = (_DWORD *)rtadvdLog( 0LL,  (uint64_t)"<%s> rcvd duped segnum %d from %s",  v51,  v52,  v53,  v54,  v55,  v56,  (uint64_t)"rr_command_check");
        }

        goto LABEL_35;
      }
    }

    else
    {
      xmmword_1000100E0 = 0u;
      unk_1000100F0 = 0u;
      xmmword_1000100C0 = 0u;
      *(_OWORD *)algn_1000100D0 = 0u;
    }

    rro = v43;
LABEL_35:
    if ((*(_BYTE *)(a2 + 9) & 0xC0) == 0x80) {
      return result;
    }
    unint64_t v67 = a2 + (int)a1;
    uint64_t v68 = (unsigned __int8 *)(a2 + 16);
    uint64_t result = (_DWORD *)init_iflist();
    if (a2 + 16 >= v67)
    {
LABEL_102:
      *(uint64_t *)((char *)&rro + (((unint64_t)*(unsigned __int8 *)(a2 + 8) >> 2) & 0x38) + 8) |= 1 << *(_BYTE *)(a2 + 8);
      return result;
    }

    unsigned int v75 = a1 - 16;
    v76 = v152;
    while (1)
    {
      if (v75 < 0x18 || (v77 = v68[1], v78 = 8LL * v68[1], unsigned int v79 = v75 - 8 * v77, (int)v75 < (int)(8 * v77)))
      {
        rtadvdLog( 0LL,  (uint64_t)"<%s> pkt too short. left len = %d. gabage at end of pkt?",  v69,  v70,  v71,  v72,  v73,  v74,  (uint64_t)"do_rr");
        return (_DWORD *)rtadvdLog( 0LL,  (uint64_t)"<%s> received RR was invalid",  v30,  v31,  v32,  v33,  v34,  v35,  (uint64_t)"rr_command_input");
      }

      if (v77 >= 3 && (((_BYTE)v77 + 1) & 3) == 0)
      {
        if (*v68 - 1 >= 3)
        {
          unsigned int v138 = (char *)*v68;
          rtadvdLog(0LL, (uint64_t)"<%s> unknown rpm_code %d", v69, v70, v71, v72, v73, v74, (uint64_t)"rr_pco_check");
        }

        else
        {
          unsigned int v87 = v68[3];
          if (v87 < 0x81)
          {
            uint64_t v88 = &v68[v78];
            unint64_t v89 = v68 + 24;
            if (v68 + 24 >= &v68[v78])
            {
LABEL_55:
              int v143 = v68 + 24;
              if (s == -1)
              {
                s = socket(30, 2, 0);
                if (s < 0)
                {
                  v131 = __error();
                  strerror(*v131);
                  rtadvdLog(0LL, (uint64_t)"<%s> socket: %s", v132, v133, v134, v135, v136, v137, (uint64_t)"do_pco");
                  exit(1);
                }

                LOBYTE(v87) = v68[3];
              }

              unint64_t v141 = v76;
              unint64_t v142 = v67;
              __int128 v151 = 0u;
              memset(v152, 0, sizeof(v152));
              __int128 v149 = 0u;
              __int128 v150 = 0u;
              LOBYTE(v150) = 1;
              BYTE1(v150) = v87;
              WORD1(v150) = *((_WORD *)v68 + 2);
              WORD4(v151) = 7708;
              _OWORD *v76 = *(_OWORD *)(v68 + 8);
              if (if_indextoname(1u, (char *)&v149))
              {
                uint64_t v92 = 1LL;
                do
                {
                  interface_entry = get_interface_entry(v92);
                  if (interface_entry)
                  {
                    if ((*(_BYTE *)(a2 + 9) & 0x20) != 0 || (interface_entry[4] & 1) != 0)
                    {
                      int v100 = v68 + 24;
                      if (v143 == v88)
                      {
                        uint64_t v116 = *v68;
                        if (v116 != 1)
                        {
                          WORD2(v150) = 0;
                          BYTE6(v150) &= 0xFCu;
                          WORD2(v152[1]) = 0;
                          *((void *)&v150 + 1) = 0LL;
                          *(void *)&__int128 v151 = 0LL;
                          *(in6_addr *)((char *)&v152[1] + 12) = in6addr_any;
                          if (ioctl(s, rrcmd2pco[v116], &v149, v138, v139, v140) < 0 && *__error() != 49)
                          {
                            unint64_t v117 = __error();
                            unsigned int v138 = strerror(*v117);
                            rtadvdLog( 0LL,  (uint64_t)"<%s> ioctl: %s",  v118,  v119,  v120,  v121,  v122,  v123,  (uint64_t)"do_use_prefix");
                          }
                        }
                      }

                      else if (v143 < v88)
                      {
                        do
                        {
                          WORD2(v150) = *(_WORD *)v100;
                          BYTE6(v150) = BYTE6(v150) & 0xFC | (v100[2] >> 7) | (v100[2] >> 5) & 2;
                          *((int8x8_t *)&v150 + 1) = vrev32_s8(*(int8x8_t *)(v100 + 4));
                          LOBYTE(v151) = v151 & 0xFC | (v100[3] >> 7) | (v100[3] >> 5) & 2;
                          BYTE4(v151) = BYTE4(v151) & 0xFC | ((*((_DWORD *)v100 + 3) & 0x80) != 0) | (*((_DWORD *)v100 + 3) >> 5) & 2;
                          WORD2(v152[1]) = 7708;
                          *(_OWORD *)((char *)&v152[1] + 12) = *((_OWORD *)v100 + 1);
                          if (ioctl(s, rrcmd2pco[*v68], &v149) < 0 && *__error() != 49)
                          {
                            int v101 = __error();
                            unsigned int v138 = strerror(*v101);
                            rtadvdLog( 0LL,  (uint64_t)"<%s> ioctl: %s",  v102,  v103,  v104,  v105,  v106,  v107,  (uint64_t)"do_use_prefix");
                          }

                          if (*v68 == 2
                            && *((void *)v68 + 1) == *((void *)v100 + 2)
                            && *((void *)v68 + 2) == *((void *)v100 + 3))
                          {
                            int v109 = v68[3];
                            if (v109 == *v100 && v109 == v100[1])
                            {
                              uint64_t v110 = if_indextorainfo(v92);
                              if (v110)
                              {
                                uint64_t v112 = v110 + 16;
                                for (uint64_t i = v110[16]; (uint64_t *)i != v112; uint64_t i = *(void *)i)
                                {
                                  if (prefix_match((unsigned __int8 *)(i + 80), *(_DWORD *)(i + 72), v68 + 8, v68[3]))
                                  {
                                    *(_DWORD *)(i + 32) = bswap32(*((_DWORD *)v100 + 1));
                                    *(_DWORD *)(i + 48) = bswap32(*((_DWORD *)v100 + 2));
                                    char v113 = BYTE4(v151);
                                    if ((BYTE4(v151) & 1) != 0)
                                    {
                                      gettimeofday(&v145, 0LL);
                                      __darwin_time_t v114 = v145.tv_sec + *(unsigned int *)(i + 32);
                                      char v113 = BYTE4(v151);
                                    }

                                    else
                                    {
                                      __darwin_time_t v114 = 0LL;
                                    }

                                    *(void *)(i + 40) = v114;
                                    if ((v113 & 2) != 0)
                                    {
                                      gettimeofday(&v145, 0LL);
                                      __darwin_time_t v115 = v145.tv_sec + *(unsigned int *)(i + 48);
                                    }

                                    else
                                    {
                                      __darwin_time_t v115 = 0LL;
                                    }

                                    *(void *)(i + 56) = v115;
                                  }
                                }
                              }
                            }
                          }

                          v100 += 32;
                        }

                        while (v100 < v88);
                      }
                    }
                  }

                  else
                  {
                    rtadvdLog( 2LL,  (uint64_t)"Couldn't find interface entry for %d. Skipping.",  v94,  v95,  v96,  v97,  v98,  v99,  v92);
                  }

                  uint64_t v92 = (v92 + 1);
                }

                while (if_indextoname(v92, (char *)&v149));
              }

              uint64_t result = __error();
              if (*result == 6 || (uint64_t result = __error(), !*result))
              {
                v76 = v141;
                unint64_t v67 = v142;
                goto LABEL_46;
              }

              uint64_t v124 = __error();
              unsigned int v138 = strerror(*v124);
              rtadvdLog(0LL, (uint64_t)"<%s> if_indextoname: %s", v125, v126, v127, v128, v129, v130, (uint64_t)"do_pco");
              v76 = v141;
              unint64_t v67 = v142;
            }

            else
            {
              while (1)
              {
                int v90 = *v89;
                int v91 = v89[1];
                v89 += 32;
                if (v89 >= v88) {
                  goto LABEL_55;
                }
              }

              unint64_t v139 = (const char *)v89[1];
              uint64_t v140 = (char *)(v91 + v90);
              unsigned int v138 = (char *)*v89;
              rtadvdLog( 0LL,  (uint64_t)"<%s> sum of rpu_uselen %d and rpu_keeplen %d is %d(over 128)",  v69,  v70,  v71,  v72,  v73,  v74,  (uint64_t)"rr_pco_check");
            }
          }

          else
          {
            unsigned int v138 = (char *)v68[3];
            rtadvdLog( 0LL,  (uint64_t)"<%s> rpm_matchlen %d is over 128",  v69,  v70,  v71,  v72,  v73,  v74,  (uint64_t)"rr_pco_check");
          }
        }
      }

      else
      {
        unsigned int v138 = (char *)v68[1];
        rtadvdLog(0LL, (uint64_t)"<%s> rpm_len %d is not 4N * 3", v69, v70, v71, v72, v73, v74, (uint64_t)"rr_pco_check");
      }

      uint64_t result = (_DWORD *)rtadvdLog(0LL, (uint64_t)"<%s> invalid PCO", v81, v82, v83, v84, v85, v86, (uint64_t)"do_rr");
      uint64_t v78 = v78;
LABEL_46:
      v68 += v78;
      unsigned int v75 = v79;
    }
  }

  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  int v5 = 0;
  do
  {
    while (1)
    {
      while (1)
      {
        while (1)
        {
          while (1)
          {
            int v6 = getopt(argc, (char *const *)argv, "c:dDF:fMp:Rs");
            if (v6 <= 98) {
              break;
            }
            if (v6 <= 101)
            {
              if (v6 == 99)
              {
                conffile = (uint64_t)optarg;
              }

              else if (v6 == 100)
              {
                dflag = 1;
              }
            }

            else
            {
              switch(v6)
              {
                case 'f':
                  int v5 = 1;
                  break;
                case 'p':
                  pidfilename = optarg;
                  break;
                case 's':
                  sflag = 1;
                  break;
              }
            }
          }

          if (v6 <= 76) {
            break;
          }
          if (v6 == 77)
          {
            mcastif = (uint64_t)optarg;
          }

          else if (v6 == 82)
          {
            fwrite("rtadvd: the -R option is currently ignored.\n", 0x2CuLL, 1uLL, __stderrp);
          }
        }

        if (v6 != 68) {
          break;
        }
        dflag = 2;
      }

      if (v6 != 70) {
        break;
      }
      dumpfilename = optarg;
    }
  }

  while (v6 != -1);
  int v7 = optind;
  if (argc == optind)
  {
    uint64_t v8 = __stderrp;
    uint64_t v9 = "usage: rtadvd [-dDfMRs] [-c conffile] [-F dumpfile] [-p pidfile] interfaces...\n";
    size_t v10 = 79LL;
LABEL_34:
    fwrite(v9, v10, 1uLL, v8);
    goto LABEL_35;
  }

  uint64_t v11 = (unsigned __int8 **)&argv[optind];
  rtadvd_timer_init();
  unsigned int v12 = time(0LL);
  srandom(v12);
  init_iflist();
  int v13 = v7 - argc;
  do
  {
    uint64_t v14 = *v11++;
    getconfig(v14);
  }

  while (!__CFADD__(v13++, 1));
  if (inet_pton(30, "ff02::1", &unk_100010028) != 1)
  {
    uint64_t v8 = __stderrp;
    uint64_t v9 = "fatal: inet_pton failed\n";
    size_t v10 = 24LL;
    goto LABEL_34;
  }

  pfh = pidfile_open(pidfilename, 384LL, &v353);
  if (!pfh)
  {
    if (*__error() == 17)
    {
      uint64_t v22 = getprogname();
      errx(1, "%s already running, pid: %d", v22, v353);
    }

    rtadvdLog( 0LL,  (uint64_t)"<%s> failed to open the pid log file, run anyway.",  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)"main");
  }

  if (!v5) {
    daemon(1, 0);
  }
  uint64_t v23 = ralist;
  uint64_t v24 = malloc(0x30uLL);
  rcvcmsgbuf = (uint64_t)v24;
  if (!v24 || (uint64_t v24 = malloc(0x30uLL), (sndcmsgbuf = (uint64_t)v24) == 0))
  {
    rtadvdLog((uint64_t)v24, (uint64_t)"<%s> not enough core", v25, v26, v27, v28, v29, v30, (uint64_t)"sock_open");
    goto LABEL_35;
  }

  int v31 = socket(30, 3, 58);
  socuint64_t k = v31;
  if (v31 < 0)
  {
    uint64_t v32 = __error();
    strerror(*v32);
    uint64_t v39 = "sock_open";
LABEL_44:
    v347 = v39;
    uint64_t v40 = "<%s> socket: %s";
LABEL_68:
    rtadvdLog(0LL, (uint64_t)v40, v33, v34, v35, v36, v37, v38, (uint64_t)v347);
    goto LABEL_35;
  }

  setsockopt(v31, 0xFFFF, 4230, &so_traffic_class, 4u);
  *(_DWORD *)v360 = 1;
  if (setsockopt(sock, 41, 61, v360, 4u) < 0)
  {
    uint64_t v41 = __error();
    v347 = "sock_open";
    strerror(*v41);
    uint64_t v40 = "<%s> IPV6_RECVPKTINFO: %s";
    goto LABEL_68;
  }

  *(_DWORD *)v360 = 1;
  if (setsockopt(sock, 41, 37, v360, 4u) < 0)
  {
    uint64_t v42 = __error();
    v347 = "sock_open";
    strerror(*v42);
    uint64_t v40 = "<%s> IPV6_RECVHOPLIMIT: %s";
    goto LABEL_68;
  }

  *(_DWORD *)v360 = 1;
  if (setsockopt(sock, 41, 62, v360, 4u) < 0)
  {
    unint64_t v43 = __error();
    v347 = "sock_open";
    strerror(*v43);
    uint64_t v40 = "<%s> IPV6_DONTFRAG: %s";
    goto LABEL_68;
  }

  *(_OWORD *)v354 = 0u;
  *(_OWORD *)__s1 = 0u;
  if (accept_rr) {
    int v44 = 1120;
  }
  else {
    int v44 = 96;
  }
  LODWORD(__s1[0]) = v44;
  if (setsockopt(sock, 58, 18, v354, 0x20u) < 0)
  {
    uint64_t v45 = __error();
    v347 = "sock_open";
    strerror(*v45);
    uint64_t v40 = "<%s> IICMP6_FILTER: %s";
    goto LABEL_68;
  }

  if (inet_pton(30, "ff02::2", &v361) == 1)
  {
    if (v23)
    {
      while (1)
      {
        int v362 = *(_DWORD *)(v23 + 44);
        if (setsockopt(sock, 41, 12, &v361, 0x14u) < 0) {
          break;
        }
        uint64_t v23 = *(void *)v23;
        if (!v23) {
          goto LABEL_60;
        }
      }

      uint64_t v49 = __error();
      strerror(*v49);
      v347 = "sock_open";
      uint64_t v40 = "<%s> IPV6_JOIN_GROUP(link) on %s: %s";
      goto LABEL_68;
    }

LABEL_60:
    if (!accept_rr)
    {
LABEL_61:
      rcviov = (uint64_t)&sock_open_answer;
      unk_1000107F0 = 1500LL;
      rcvmhdr = (uint64_t)&rcvfrom;
      dword_100010810 = 28;
      qword_100010818 = (uint64_t)&rcviov;
      dword_100010820 = 1;
      qword_100010828 = rcvcmsgbuf;
      dword_100010860 = 28;
      dword_100010830 = 48;
      qword_100010868 = (uint64_t)&sndiov;
      dword_100010870 = 1;
      qword_100010878 = sndcmsgbuf;
      dword_100010880 = 48;
      getpid();
      pidfile_write(pfh);
      int v46 = sock;
      if (sflag)
      {
        rtsocuint64_t k = -1;
        int v50 = sock;
      }

      else
      {
        int v47 = socket(17, 3, 0);
        rtsocuint64_t k = v47;
        if (v47 < 0)
        {
          uint64_t v48 = __error();
          strerror(*v48);
          uint64_t v39 = "rtsock_open";
          goto LABEL_44;
        }

        int v50 = sock;
        if (v47 > sock) {
          int v46 = v47;
        }
      }

      int v51 = v46 + 1;
      unint64_t v52 = (unint64_t)(v46 + 1) >> 5;
      size_t v53 = 4 * (int)v52;
      uint64_t v54 = (char *)malloc(v53);
      if (!v54 || (uint64_t v55 = v54, v349 = v51, (__dst = (fd_set *)malloc(v53)) == 0LL)) {
        err(1, "malloc");
      }
      size_t v350 = v53;
      bzero(v55, v53);
      if (__darwin_check_fd_set_overflow(v50, v55, 0)) {
        *(_DWORD *)&v55[((unint64_t)v50 >> 3) & 0x1FFFFFFFFFFFFFFCLL] |= 1 << v50;
      }
      unint64_t v64 = rtsock;
      if ((rtsock & 0x80000000) == 0 && __darwin_check_fd_set_overflow(rtsock, v55, 0)) {
        *(_DWORD *)&v55[(v64 >> 3) & 0x1FFFFFFC] |= 1 << v64;
      }
      signal(15, (void (__cdecl *)(int))set_die);
      signal(30, (void (__cdecl *)(int))rtadvd_set_dump_file);
      uint64_t v65 = &getconfig_forwarding;
      uint64_t v66 = &getconfig_forwarding;
      int v67 = v51;
      size_t v68 = v350;
      v351 = v55;
LABEL_88:
      uint64_t v69 = __dst;
      do
      {
        while (1)
        {
LABEL_89:
          memcpy(v69, v55, v68);
          if (do_dump)
          {
            do_dump = 0;
            rtadvd_dump_file(dumpfilename, v70, v71, v72, v73, v74, v75, v76);
          }

          if (do_die)
          {
            if (dflag >= 2) {
              rtadvdLog( 2LL,  (uint64_t)"<%s> cease to be an advertising router\n",  v71,  v72,  v73,  v74,  v75,  v76,  (uint64_t)"die");
            }
            uint64_t v344 = ralist;
            if (ralist)
            {
              do
              {
                *(_WORD *)(v344 + 84) = 0;
                make_packet(v344);
                uint64_t v344 = *(void *)v344;
              }

              while (v344);
              v345 = (void *)ralist;
              if (ralist)
              {
                do
                {
                  ra_output((uint64_t)v345);
                  v345 = (void *)*v345;
                }

                while (v345);
              }
            }

            pidfile_remove(pfh);
            exit(0);
          }

          uint64_t v83 = (timeval *)rtadvd_check_timer();
          if (v83) {
            rtadvdLog( 2LL,  (uint64_t)"<%s> set timer to %ld:%ld. waiting for inputs or timeout",  v77,  v78,  v79,  v80,  v81,  v82,  (uint64_t)"main");
          }
          else {
            rtadvdLog( 2LL,  (uint64_t)"<%s> there's no timer. waiting for inputs",  v77,  v78,  v79,  v80,  v81,  v82,  (uint64_t)"main");
          }
          int v84 = select(v67, v69, 0LL, 0LL, v83);
          if ((v84 & 0x80000000) == 0) {
            break;
          }
          if (*__error() != 4)
          {
            v171 = __error();
            strerror(*v171);
            rtadvdLog(0LL, (uint64_t)"<%s> select: %s", v172, v173, v174, v175, v176, v177, (uint64_t)"main");
          }
        }
      }

      while (!v84);
      unint64_t v85 = v66[15];
      if ((_DWORD)v85 == -1
        || !__darwin_check_fd_set_overflow(v66[15], v69, 0)
        || ((*(unsigned int *)((char *)v69->fds_bits + ((v85 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v85) & 1) == 0)
      {
        goto LABEL_164;
      }

      ssize_t v86 = read(v66[15], v354, 0x800uLL);
      if (dflag >= 2)
      {
        rtmsg_type((uint64_t)v354);
        rtadvdLog( 2LL,  (uint64_t)"<%s> received a routing message (type = %d, len = %d)",  v87,  v88,  v89,  v90,  v91,  v92,  (uint64_t)"rtmsg_input");
      }

      if ((int)rtmsg_len((unsigned __int16 *)v354) < (int)v86 && dflag >= 2)
      {
        rtmsg_len((unsigned __int16 *)v354);
        rtadvdLog( 2LL,  (uint64_t)"<%s> received data length is larger than 1st routing message len. multiple messages? read %d bytes, b ut 1st msg len = %d",  v96,  v97,  v98,  v99,  v100,  v101,  (uint64_t)"rtmsg_input");
      }

      if (v86 << 32 < 1) {
        goto LABEL_163;
      }
      LODWORD(v102) = 0;
      int v348 = 0;
      uint64_t v103 = (unsigned __int16 *)v354;
      uint64_t v104 = &v354[(int)v86];
      while (1)
      {
        next_msg = get_next_msg(v103, (unint64_t)v104, 0LL, &v359, 28678LL, v93, v94, v95);
        if (!*(void *)v359.__u6_addr8) {
          goto LABEL_163;
        }
        uint64_t v106 = (uint64_t)next_msg;
        int v107 = rtmsg_type((uint64_t)next_msg);
        int v108 = v107;
        if ((v107 - 1) < 2)
        {
          uint64_t rtm_ifindex = get_rtm_ifindex(v106);
        }

        else
        {
          if ((v107 - 12) >= 2 && v107 != 14)
          {
            if (dflag >= 2)
            {
              if_indextoname(v102, v360);
              rtadvdLog( 2LL,  (uint64_t)"<%s:%d> unknown rtmsg %d on %s",  v130,  v131,  v132,  v133,  v134,  v135,  (uint64_t)"rtmsg_input");
            }

            goto LABEL_140;
          }

          uint64_t rtm_ifindex = get_ifm_ifindex(v106);
        }

        uint64_t v102 = rtm_ifindex;
        uint64_t v110 = &ralist;
        do
        {
          uint64_t v110 = (uint64_t *)*v110;
          if (!v110)
          {
            if (dflag >= 2)
            {
              if_indextoname(rtm_ifindex, v360);
              rtadvdLog( 2LL,  (uint64_t)"<%s> route changed on non advertising interface(%s)",  v124,  v125,  v126,  v127,  v128,  v129,  (uint64_t)"rtmsg_input");
            }

            goto LABEL_140;
          }
        }

        while (*((_DWORD *)v110 + 11) != (_DWORD)rtm_ifindex);
        interface_entry = get_interface_entry(rtm_ifindex);
        if (!interface_entry)
        {
          rtadvdLog( 2LL,  (uint64_t)"Couldn't find interface entry for %d. Skipping.",  v112,  v113,  v114,  v115,  v116,  v117,  v102);
          goto LABEL_140;
        }

        uint64_t v118 = interface_entry;
        int v119 = *((_DWORD *)interface_entry + 2);
        if (v108 <= 11)
        {
          if (v108 == 1)
          {
            *((_DWORD *)interface_entry + 2) = if_getflags(v102, v119);
            if (sflag) {
              goto LABEL_134;
            }
            addr = (unsigned __int8 *)get_addr((uint64_t)v354);
            int prefixlen = get_prefixlen((uint64_t)v354);
            unsigned __int8 v154 = prefixlen;
            if ((prefixlen - 128) <= 0xFFFFFF83)
            {
              rtadvdLog( 1LL,  (uint64_t)"<%s> new interface route'splen %d is invalid for a prefix",  v148,  v149,  v150,  v151,  v152,  v153,  (uint64_t)"rtmsg_input");
              goto LABEL_134;
            }

            prefix = find_prefix((uint64_t)v110, addr, prefixlen);
            if (prefix)
            {
              if (!prefix[3])
              {
                if (dflag >= 2)
                {
                  inet_ntop(30, addr, (char *)&v361, 0x2Eu);
                  rtadvdLog( 2LL,  (uint64_t)"<%s> new prefix(%s/%d) added on %s, but it was already in list",  v165,  v166,  v167,  v168,  v169,  v170,  (uint64_t)"rtmsg_input");
                }

                goto LABEL_134;
              }

              update_prefix((uint64_t)prefix, v158, v121, v122, v123, v93, v94, v95);
            }

            else
            {
              make_prefix((uint64_t)v110, v102, addr, v154);
            }

LABEL_156:
            int v348 = 1;
            goto LABEL_134;
          }

          if (v108 == 2)
          {
            *((_DWORD *)interface_entry + 2) = if_getflags(v102, v119);
            if (sflag) {
              goto LABEL_134;
            }
            uint64_t v136 = (unsigned __int8 *)get_addr((uint64_t)v354);
            int v137 = get_prefixlen((uint64_t)v354);
            if ((v137 - 128) <= 0xFFFFFF83)
            {
              rtadvdLog( 1LL,  (uint64_t)"<%s> deleted interface route's plen %d is invalid for a prefix",  v138,  v139,  v140,  v141,  v142,  v143,  (uint64_t)"rtmsg_input");
              goto LABEL_134;
            }

            uint64_t v155 = find_prefix((uint64_t)v110, v136, v137);
            if (!v155)
            {
              if (dflag >= 2)
              {
                inet_ntop(30, v136, (char *)&v361, 0x2Eu);
                rtadvdLog( 2LL,  (uint64_t)"<%s> prefix(%s/%d) was deleted on %s, but it was not in list",  v159,  v160,  v161,  v162,  v163,  v164,  (uint64_t)"rtmsg_input");
              }

              goto LABEL_134;
            }

            invalidate_prefix((uint64_t)v155, v156, v121, v122, v123, v93, v94, v95);
            goto LABEL_156;
          }

LABEL_161:
          uint64_t v55 = v351;
          if (dflag >= 2)
          {
            if_indextoname(v102, v360);
            rtadvdLog( 2LL,  (uint64_t)"<%s:%d> unknown rtmsg %d on %s",  v178,  v179,  v180,  v181,  v182,  v183,  (uint64_t)"rtmsg_input");
          }

LABEL_163:
          uint64_t v65 = &getconfig_forwarding;
          uint64_t v66 = &getconfig_forwarding;
          int v67 = v349;
          size_t v68 = v350;
          uint64_t v69 = __dst;
LABEL_164:
          int v184 = v65[546];
          if (__darwin_check_fd_set_overflow(v184, v69, 0)
            && ((*(unsigned int *)((char *)v69->fds_bits + (((unint64_t)v184 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v184) & 1) != 0)
          {
            in6_addr v359 = in6addr_any;
            dword_100010830 = 48;
            unsigned int v191 = recvmsg(v65[546], (msghdr *)&rcvmhdr, 0);
            if ((v191 & 0x80000000) != 0) {
              goto LABEL_88;
            }
            if (dword_100010830 < 0xC || (v192 = (unsigned int *)qword_100010828) == 0LL)
            {
LABEL_184:
              rtadvdLog( 0LL,  (uint64_t)"<%s> failed to get receiving interface",  v185,  v186,  v187,  v188,  v189,  v190,  (uint64_t)"rtadvd_input");
LABEL_185:
              int v67 = v349;
              size_t v68 = v350;
              goto LABEL_88;
            }

            v193 = 0LL;
            unsigned int v194 = 0;
            v195 = 0LL;
            while (2)
            {
              if (v192[1] == 41)
              {
                unsigned int v196 = v192[2];
                if (v196 != 46) {
                  goto LABEL_175;
                }
                if (*v192 == 32)
                {
                  v193 = v192 + 3;
                  unsigned int v194 = v192[7];
                  in6_addr v359 = *(in6_addr *)(v192 + 3);
                  if (v192[1] == 41)
                  {
                    unsigned int v196 = v192[2];
LABEL_175:
                    if (v196 == 47 && *v192 == 16) {
                      v195 = v192 + 3;
                    }
                  }
                }
              }

              v192 = (unsigned int *)((char *)v192 + ((*v192 + 3LL) & 0x1FFFFFFFCLL));
              break;
            }

            if (!v194) {
              goto LABEL_184;
            }
            if (!v195)
            {
              rtadvdLog( 0LL,  (uint64_t)"<%s> failed to get receiving hop limit",  v185,  v186,  v187,  v188,  v189,  v190,  (uint64_t)"rtadvd_input");
              goto LABEL_185;
            }

            v197 = get_interface_entry(v193[4]);
            if (!v197) {
              goto LABEL_187;
            }
            if ((v197[4] & 1) != 0)
            {
              if (v191 <= 7uLL)
              {
                rtadvdLog( 0LL,  (uint64_t)"<%s> packet size(%d) is too short",  v198,  v199,  v200,  v201,  v202,  v203,  (uint64_t)"rtadvd_input");
                goto LABEL_185;
              }

              uint64_t v204 = *(void *)qword_100010818;
              int v205 = **(unsigned __int8 **)qword_100010818;
              if (v205 == 138)
              {
                size_t v68 = v350;
                if (accept_rr) {
                  rr_input(v191, *(void *)qword_100010818, (unsigned __int8 *)v193, (uint64_t)&rcvfrom, &v359);
                }
                else {
                  rtadvdLog( 0LL,  (uint64_t)"<%s> received a router renumbering message, but not allowed to be accepted",  v198,  v199,  v200,  v201,  v202,  v203,  (uint64_t)"rtadvd_input");
                }
                goto LABEL_188;
              }

              if (v205 == 134)
              {
                if (*v195 == 255)
                {
                  if (*(_BYTE *)(v204 + 1))
                  {
                    inet_ntop(30, &dword_1000107D0, v354, 0x2Eu);
                    if_indextoname(v193[4], (char *)&v361);
                    rtadvdLog( 0LL,  (uint64_t)"<%s> RA with invalid ICMP6 code(%d) received from %s on %s",  v212,  v213,  v214,  v215,  v216,  v217,  (uint64_t)"rtadvd_input");
                  }

                  else
                  {
                    if (v191 > 0xFuLL)
                    {
                      inet_ntop(30, &dword_1000107D0, (char *)&v361, 0x2Eu);
                      if_indextoname(v193[4], v360);
                      rtadvdLog( 2LL,  (uint64_t)"<%s> RA received from %s on %s",  v252,  v253,  v254,  v255,  v256,  v257,  (uint64_t)"ra_input");
                      uint64_t v358 = 0LL;
                      __int128 v356 = 0u;
                      *(_OWORD *)v357 = 0u;
                      *(_OWORD *)v354 = 0u;
                      *(_OWORD *)__s1 = 0u;
                      if (nd6_options( (unsigned __int8 *)(v204 + 16),  v191 - 16,  (uint64_t)v354,  21LL,  v258,  v259,  v260,  v261))
                      {
                        inet_ntop(30, &dword_1000107D0, (char *)&v361, 0x2Eu);
                        if_indextoname(v193[4], v360);
                        rtadvdLog( 1LL,  (uint64_t)"<%s> ND option check failed for an RA from %s on %s",  v262,  v263,  v264,  v265,  v266,  v267,  (uint64_t)"ra_input");
                        size_t v68 = v350;
                      }

                      else
                      {
                        v278 = &ralist;
                        size_t v68 = v350;
                        do
                        {
                          v278 = (uint64_t *)*v278;
                          if (!v278)
                          {
                            inet_ntop(30, &dword_1000107D0, (char *)&v361, 0x2Eu);
                            if_indextoname(v193[4], v360);
                            rtadvdLog( 1LL,  (uint64_t)"<%s> received RA from %s on non-advertising interface(%s)",  v290,  v291,  v292,  v293,  v294,  v295,  (uint64_t)"ra_input");
                            v296 = v357[0];
                            goto LABEL_270;
                          }
                        }

                        while (*((_DWORD *)v278 + 11) != v193[4]);
                        ++v278[57];
                        int v279 = *(unsigned __int8 *)(v204 + 4);
                        if (*(_BYTE *)(v204 + 4))
                        {
                          int v280 = *((_DWORD *)v278 + 30);
                          if (v280) {
                            BOOL v281 = v280 == v279;
                          }
                          else {
                            BOOL v281 = 1;
                          }
                          if (v281)
                          {
                            int v279 = 0;
                          }

                          else
                          {
                            inet_ntop(30, &dword_1000107D0, (char *)&v361, 0x2Eu);
                            int v279 = 1;
                            rtadvdLog( 1LL,  (uint64_t)"<%s> CurHopLimit inconsistent on %s: %d from %s, %d from us",  v297,  v298,  v299,  v300,  v301,  v302,  (uint64_t)"ra_input");
                          }
                        }

                        char v303 = *(_BYTE *)(v204 + 5);
                        if (*((_DWORD *)v278 + 24) != (v303 & 0x80))
                        {
                          inet_ntop(30, &dword_1000107D0, (char *)&v361, 0x2Eu);
                          rtadvdLog( 1LL,  (uint64_t)"<%s> M flag inconsistent on %s: %s from %s, %s from us",  v304,  v305,  v306,  v307,  v308,  v309,  (uint64_t)"ra_input");
                          ++v279;
                          char v303 = *(_BYTE *)(v204 + 5);
                        }

                        if (*((_DWORD *)v278 + 25) != (v303 & 0x40))
                        {
                          inet_ntop(30, &dword_1000107D0, (char *)&v361, 0x2Eu);
                          rtadvdLog( 1LL,  (uint64_t)"<%s> O flag inconsistent on %s: %s from %s, %s from us",  v310,  v311,  v312,  v313,  v314,  v315,  (uint64_t)"ra_input");
                          ++v279;
                        }

                        uint64_t v55 = v351;
                        unsigned int v316 = *(_DWORD *)(v204 + 8);
                        if (v316)
                        {
                          unsigned int v317 = bswap32(v316);
                          int v318 = *((_DWORD *)v278 + 28);
                          if (v318 && v317 != v318)
                          {
                            inet_ntop(30, &dword_1000107D0, (char *)&v361, 0x2Eu);
                            uint64_t v55 = v351;
                            rtadvdLog( 1LL,  (uint64_t)"<%s> ReachableTime inconsistent on %s: %d from %s, %d from us",  v320,  v321,  v322,  v323,  v324,  v325,  (uint64_t)"ra_input");
                            ++v279;
                          }
                        }

                        unsigned int v326 = *(_DWORD *)(v204 + 12);
                        if (v326)
                        {
                          int v327 = *((_DWORD *)v278 + 29);
                          if (v327)
                          {
                            if (bswap32(v326) != v327)
                            {
                              inet_ntop(30, &dword_1000107D0, (char *)&v361, 0x2Eu);
                              rtadvdLog( 1LL,  (uint64_t)"<%s> RetranceTimer inconsistent on %s: %d from %s, %d from us",  v328,  v329,  v330,  v331,  v332,  v333,  (uint64_t)"ra_input");
                              ++v279;
                            }
                          }
                        }

                        if (*((void *)&v356 + 1))
                        {
                          unsigned int v334 = *(_DWORD *)(*((void *)&v356 + 1) + 4LL);
                          if (v334)
                          {
                            int v335 = *((_DWORD *)v278 + 27);
                            if (v335)
                            {
                              if (bswap32(v334) != v335)
                              {
                                inet_ntop(30, &dword_1000107D0, (char *)&v361, 0x2Eu);
                                rtadvdLog( 1LL,  (uint64_t)"<%s> MTU option value inconsistent on %s: %d from %s, %d from us",  v336,  v337,  v338,  v339,  v340,  v341,  (uint64_t)"ra_input");
                                ++v279;
                              }
                            }
                          }
                        }

                        v296 = v357[0];
                        if (v296)
                        {
                          v342 = v296;
                          do
                          {
                            v342 = (void *)*v342;
                          }

                          while (v342);
                        }

                        if (v279) {
                          ++v278[58];
                        }
                        size_t v68 = v350;
LABEL_270:
                        if (v296)
                        {
                          do
                          {
                            v343 = (void *)*v296;
                            free(v296);
                            v296 = v343;
                          }

                          while (v343);
                        }
                      }

                      goto LABEL_188;
                    }

                    inet_ntop(30, &dword_1000107D0, v354, 0x2Eu);
                    if_indextoname(v193[4], (char *)&v361);
                    rtadvdLog( 0LL,  (uint64_t)"<%s> RA from %s on %s does not have enough length (len = %d)",  v246,  v247,  v248,  v249,  v250,  v251,  (uint64_t)"rtadvd_input");
                  }
                }

                else
                {
                  inet_ntop(30, &dword_1000107D0, v354, 0x2Eu);
                  if_indextoname(v193[4], (char *)&v361);
                  rtadvdLog( 0LL,  (uint64_t)"<%s> RA with invalid hop limit(%d) received from %s on %s",  v224,  v225,  v226,  v227,  v228,  v229,  (uint64_t)"rtadvd_input");
                }

                goto LABEL_185;
              }

              if (v205 != 133)
              {
                rtadvdLog( 0LL,  (uint64_t)"<%s> invalid icmp type(%d)",  v198,  v199,  v200,  v201,  v202,  v203,  (uint64_t)"rtadvd_input");
                goto LABEL_185;
              }

              if (*v195 != 255)
              {
                inet_ntop(30, &dword_1000107D0, v354, 0x2Eu);
                if_indextoname(v193[4], (char *)&v361);
                rtadvdLog( 0LL,  (uint64_t)"<%s> RS with invalid hop limit(%d) received from %s on %s",  v218,  v219,  v220,  v221,  v222,  v223,  (uint64_t)"rtadvd_input");
                goto LABEL_185;
              }

              if (*(_BYTE *)(v204 + 1))
              {
                inet_ntop(30, &dword_1000107D0, v354, 0x2Eu);
                if_indextoname(v193[4], (char *)&v361);
                rtadvdLog( 0LL,  (uint64_t)"<%s> RS with invalid ICMP6 code(%d) received from %s on %s",  v206,  v207,  v208,  v209,  v210,  v211,  (uint64_t)"rtadvd_input");
                goto LABEL_185;
              }

              inet_ntop(30, &dword_1000107D0, (char *)&v361, 0x2Eu);
              if_indextoname(v193[4], v360);
              rtadvdLog( 2LL,  (uint64_t)"<%s> RS received from %s on %s",  v230,  v231,  v232,  v233,  v234,  v235,  (uint64_t)"rs_input");
              uint64_t v358 = 0LL;
              __int128 v356 = 0u;
              *(_OWORD *)v357 = 0u;
              *(_OWORD *)v354 = 0u;
              *(_OWORD *)__s1 = 0u;
              if (nd6_options( (unsigned __int8 *)(v204 + 8),  v191 - 8,  (uint64_t)v354,  1LL,  v236,  v237,  v238,  v239))
              {
                inet_ntop(30, &dword_1000107D0, (char *)&v361, 0x2Eu);
                if_indextoname(v193[4], v360);
                rtadvdLog( 1LL,  (uint64_t)"<%s> ND option check failed for an RS from %s on %s",  v240,  v241,  v242,  v243,  v244,  v245,  (uint64_t)"rs_input");
                goto LABEL_185;
              }

              if (dword_1000107D0 || dword_1000107D4 || dword_1000107D8 || dword_1000107DC || !*(void *)&v354[8])
              {
                unsigned int v274 = v193[4];
                v275 = &ralist;
                int v67 = v349;
                size_t v68 = v350;
                do
                {
                  v275 = (uint64_t *)*v275;
                  if (!v275)
                  {
                    if_indextoname(v274, v360);
                    rtadvdLog( 1LL,  (uint64_t)"<%s> RS received on non advertising interface(%s)",  v282,  v283,  v284,  v285,  v286,  v287,  (uint64_t)"rs_input");
                    goto LABEL_236;
                  }
                }

                while (v274 != *((_DWORD *)v275 + 11));
                ++v275[59];
                v276 = (char *)malloc(0x28uLL);
                if (v276)
                {
                  *(_OWORD *)(v276 + 8) = rcvfrom;
                  *(_OWORD *)(v276 + 20) = *(_OWORD *)&dword_1000107D4;
                  *((_DWORD *)v276 + 3) = 0;
                  *(void *)v276 = v275[60];
                  v275[60] = (uint64_t)v276;
                }

                int v277 = *((_DWORD *)v275 + 10);
                *((_DWORD *)v275 + 10) = v277 + 1;
                if (!v277) {
                  set_short_delay((uint64_t)v275);
                }
              }

              else
              {
                if_indextoname(v193[4], v360);
                rtadvdLog( 1LL,  (uint64_t)"<%s> RS from unspecified src on %s has a link-layer address option",  v268,  v269,  v270,  v271,  v272,  v273,  (uint64_t)"rs_input");
                int v67 = v349;
                size_t v68 = v350;
              }

LABEL_236:
              v288 = v357[0];
              if (v357[0])
              {
                do
                {
                  v289 = (void *)*v288;
                  free(v288);
                  v288 = v289;
                }

                while (v289);
              }
            }

            else
            {
              if_indextoname(v193[4], (char *)&v361);
LABEL_187:
              size_t v68 = v350;
              rtadvdLog( 1LL,  (uint64_t)"<%s> received data on a disabled interface (%s)",  v198,  v199,  v200,  v201,  v202,  v203,  (uint64_t)"rtadvd_input");
LABEL_188:
              int v67 = v349;
            }

            goto LABEL_88;
          }

          goto LABEL_89;
        }

        if ((v108 - 12) < 2)
        {
          int ifm_flags = if_getflags(v102, v119);
          goto LABEL_133;
        }

        if (v108 != 14) {
          goto LABEL_161;
        }
        int ifm_flags = get_ifm_flags(v106);
LABEL_133:
        *((_DWORD *)v118 + 2) = ifm_flags;
LABEL_134:
        int v144 = *((_DWORD *)v118 + 2);
        if ((v119 & 1) != 0)
        {
          if ((v144 & 1) == 0)
          {
            rtadvdLog( 1LL,  (uint64_t)"<%s> interface %s becomes down. stop timer.",  v121,  v122,  v123,  v93,  v94,  v95,  (uint64_t)"rtmsg_input");
            rtadvd_remove_timer((void **)v110 + 1);
            goto LABEL_139;
          }

          uint64_t v55 = v351;
          if (v348)
          {
            *((_DWORD *)v110 + 4) = 0;
            set_short_delay((uint64_t)v110);
          }

          else
          {
            int v348 = 0;
          }
        }

        else
        {
          if ((v144 & 1) != 0)
          {
            rtadvdLog( 1LL,  (uint64_t)"<%s> interface %s becomes up. restart timer.",  v121,  v122,  v123,  v93,  v94,  v95,  (uint64_t)"rtmsg_input");
            *((_DWORD *)v110 + 4) = 0;
            *((_DWORD *)v110 + 10) = 0;
            timeval v145 = rtadvd_add_timer((uint64_t)ra_timeout, (uint64_t)ra_timer_update, (uint64_t)v110, (uint64_t)v110);
            v110[1] = (uint64_t)v145;
            ra_timer_update(v110, (uint64_t)(v145 + 24));
            rtadvd_set_timer(v110[1] + 24, v110[1]);
          }

LABEL_139:
          uint64_t v55 = v351;
        }

LABEL_140:
        uint64_t v103 = (unsigned __int16 *)(v106 + *(void *)v359.__u6_addr8);
      }
    }

    if (inet_pton(30, "ff05::2", &in6a_site_allrouters) == 1)
    {
      __int128 v361 = in6a_site_allrouters;
      if (mcastif)
      {
        uint64_t v56 = if_nametoindex((const char *)mcastif);
        int v362 = v56;
        if (!(_DWORD)v56)
        {
          rtadvdLog(v56, (uint64_t)"<%s> invalid interface: %s", v57, v58, v59, v60, v61, v62, (uint64_t)"sock_open");
LABEL_35:
          exit(1);
        }
      }

      else
      {
        int v362 = *(_DWORD *)(ralist + 44);
      }

      if (setsockopt(sock, 41, 12, &v361, 0x14u) < 0)
      {
        uint64_t v63 = __error();
        strerror(*v63);
        v347 = "sock_open";
        uint64_t v40 = "<%s> IPV6_JOIN_GROUP(site) on %s: %s";
        goto LABEL_68;
      }

      goto LABEL_61;
    }
  }

  v347 = "sock_open";
  uint64_t v40 = "<%s> inet_pton failed(library bug?)";
  goto LABEL_68;
}

void set_die()
{
  do_die = 1;
}

void rtadvd_set_dump_file()
{
  do_dump = 1;
}

uint64_t *find_prefix(uint64_t a1, unsigned __int8 *__s1, int a3)
{
  uint64_t v4 = (uint64_t *)(a1 + 128);
  uint64_t v3 = *(uint64_t **)(a1 + 128);
  int v5 = a3 + 7;
  if (a3 >= 0) {
    int v5 = a3;
  }
  if (v3 == v4) {
    return 0LL;
  }
  size_t v8 = (uint64_t)v5 >> 3;
  int v9 = a3 - 8 * v8;
  int v10 = 255 << (8 - (a3 - 8 * v8));
  while (*((_DWORD *)v3 + 18) != a3
       || memcmp(__s1, v3 + 10, v8)
       || v9 && (v10 & (*((unsigned __int8 *)v3 + v8 + 80) ^ __s1[v8])) != 0)
  {
    uint64_t v3 = (uint64_t *)*v3;
    if (v3 == v4) {
      return 0LL;
    }
  }

  return v3;
}

BOOL prefix_match(unsigned __int8 *a1, int a2, unsigned __int8 *__s2, int a4)
{
  if (a2 < a4) {
    return 0LL;
  }
  if (a4 >= 0) {
    int v8 = a4;
  }
  else {
    int v8 = a4 + 7;
  }
  unsigned int v9 = a4 - (v8 & 0xFFFFFFF8);
  return !v9 || ((255 << (8 - v9)) & (__s2[(uint64_t)v8 >> 3] ^ a1[(uint64_t)v8 >> 3])) == 0;
}

uint64_t *if_indextorainfo(int a1)
{
  uint64_t result = &ralist;
  do
    uint64_t result = (uint64_t *)*result;
  while (result && *((_DWORD *)result + 11) != a1);
  return result;
}

uint64_t ra_timeout( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return *(void *)(a1 + 8);
}

uint64_t ra_output(uint64_t a1)
{
  interface_entry = get_interface_entry(*(_DWORD *)(a1 + 44));
  make_packet(a1);
  sndmhdr = (uint64_t)&sin6_allnodes;
  uint64_t v16 = qword_100010868;
  uint64_t v17 = *(void *)(a1 + 432);
  *(void *)qword_100010868 = *(void *)(a1 + 440);
  *(void *)(v16 + 8) = v17;
  else {
    uint64_t v18 = qword_100010878;
  }
  *(_DWORD *)(v18 + 8) = 46;
  *(void *)uint64_t v18 = 0x2900000020LL;
  *(void *)(v18 + 12) = 0LL;
  *(void *)(v18 + 20) = 0LL;
  *(_DWORD *)(v18 + 28) = *(_DWORD *)(a1 + 44);
  *(void *)(v18 + 32) = 0x2900000010LL;
  *(_DWORD *)(v18 + 40) = 47;
  *(_DWORD *)(v18 + 44) = 255;
  rtadvdLog(2LL, (uint64_t)"<%s> send RA on %s, # of waitings = %d", v10, v11, v12, v13, v14, v15, (uint64_t)"ra_output");
  if ((sendmsg(sock, (const msghdr *)&sndmhdr, 0) & 0x80000000) != 0)
  {
    uint64_t v19 = __error();
    strerror(*v19);
    rtadvdLog(0LL, (uint64_t)"<%s> sendmsg on %s: %s", v20, v21, v22, v23, v24, v25, (uint64_t)"ra_output");
  }

  int v26 = *(_DWORD *)(a1 + 16);
  if (v26 <= 2) {
    *(_DWORD *)(a1 + 16) = v26 + 1;
  }
  ++*(void *)(a1 + 448);
  uint64_t v27 = *(void **)(a1 + 480);
  if (v27)
  {
    do
    {
      uint64_t v28 = (void *)*v27;
      free(v27);
      uint64_t v27 = v28;
    }

    while (v28);
  }

  *(void *)(a1 + 480) = 0LL;
  uint64_t result = gettimeofday((timeval *)(a1 + 24), 0LL);
  *(_DWORD *)(a1 + 40) = 0;
  return result;
}

uint64_t ra_timer_update(_DWORD *a1, uint64_t a2)
{
  uint64_t v4 = a1[23];
  uint64_t v11 = random() % (a1[22] - a1[23]) + v4;
  int v12 = a1[4];
  if (v11 > 16 && v12 < 3) {
    uint64_t v11 = 16LL;
  }
  if (!v12) {
    uint64_t v11 = 0LL;
  }
  *(void *)a2 = v11;
  *(_DWORD *)(a2 + 8) = 0;
  return rtadvdLog( 2LL,  (uint64_t)"<%s> RA timer on %s is set to %ld:%ld",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)"ra_timer_update");
}

double set_short_delay(uint64_t a1)
{
  if (*(void *)(a1 + 8))
  {
    int v2 = (int)random() % 500000;
    *(void *)&__int128 v17 = 0LL;
    DWORD2(v17) = v2;
    uint64_t v3 = rtadvd_timer_rest(*(void *)(a1 + 8));
    uint64_t v10 = v3;
    if (*v3 < 0 || !*v3 && *((_DWORD *)v3 + 2) < v2)
    {
      rtadvdLog( 2LL,  (uint64_t)"<%s> random delay is larger than the rest of the current timer",  v4,  v5,  v6,  v7,  v8,  v9,  (uint64_t)"set_short_delay");
      __int128 v17 = *(_OWORD *)v10;
    }

    gettimeofday(&v16, 0LL);
    TIMEVAL_SUB((uint64_t)&v16, a1 + 24, (uint64_t)&v12);
    uint64_t v14 = 3LL;
    int v15 = 0;
    if (v12 < 3 || v12 == 3 && v13 < 0)
    {
      TIMEVAL_SUB((uint64_t)&v14, (uint64_t)&v12, (uint64_t)&v14);
      TIMEVAL_ADD((uint64_t)&v14, (uint64_t)&v17, (uint64_t)&v17);
    }

    *(void *)&double result = rtadvd_set_timer((uint64_t)&v17, *(void *)(a1 + 8)).n128_u64[0];
  }

  return result;
}

uint64_t nd6_options( unsigned __int8 *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 < 1) {
    return 0LL;
  }
  int v8 = a4;
  int v10 = a2;
  unsigned int v12 = 0;
  while (1)
  {
    if (v10 == 1)
    {
      __int128 v17 = "<%s> short option header";
LABEL_32:
      rtadvdLog(1LL, (uint64_t)v17, a3, a4, a5, a6, a7, a8, (uint64_t)"nd6_options");
      goto LABEL_33;
    }

    a1 += v12;
    int v13 = a1[1];
    if (!a1[1])
    {
      __int128 v17 = "<%s> bad ND option length(0) (type = %d)";
      goto LABEL_32;
    }

    if (v10 < (8 * v13))
    {
      __int128 v17 = "<%s> short option";
      goto LABEL_32;
    }

    uint64_t v14 = *a1;
    if (v14 >= 6)
    {
      rtadvdLog(1LL, (uint64_t)"<%s> unknown ND option(type %d)", a3, a4, a5, a6, a7, a8, (uint64_t)"nd6_options");
      goto LABEL_15;
    }

    if ((ndopt_flags[v14] & v8) == 0)
    {
      rtadvdLog(1LL, (uint64_t)"<%s> unexpected ND option(type %d)", a3, a4, a5, a6, a7, a8, (uint64_t)"nd6_options");
      goto LABEL_15;
    }

    if (v13 != 1 && (_DWORD)v14 == 5 || v13 != 4 && (_DWORD)v14 == 3)
    {
      rtadvdLog(1LL, (uint64_t)"<%s> invalid option length", a3, a4, a5, a6, a7, a8, (uint64_t)"nd6_options");
      goto LABEL_15;
    }

    if ((_DWORD)v14 == 5) {
      goto LABEL_21;
    }
    if ((_DWORD)v14 == 3) {
      break;
    }
    if ((_DWORD)v14 == 1)
    {
LABEL_21:
      if (*(void *)(a3 + 8 * v14))
      {
        rtadvdLog(1LL, (uint64_t)"<%s> duplicated ND option (type = %d)", a3, a4, a5, a6, a7, a8, (uint64_t)"nd6_options");
        uint64_t v14 = *a1;
      }

      *(void *)(a3 + 8 * v14) = a1;
    }

LABEL_15:
    unsigned int v12 = 8 * v13;
    BOOL v15 = __OFSUB__(v10, 8 * v13);
    v10 -= 8 * v13;
    if ((v10 < 0) ^ v15 | (v10 == 0)) {
      return 0LL;
    }
  }

  if (!*(void *)(a3 + 24))
  {
    *(void *)(a3 + 24) = a1;
    goto LABEL_15;
  }

  timeval v16 = malloc(0x10uLL);
  if (v16)
  {
    *timeval v16 = *(void *)(a3 + 48);
    v16[1] = a1;
    *(void *)(a3 + 48) = v16;
    goto LABEL_15;
  }

  rtadvdLog(0LL, (uint64_t)"<%s> can't allocate memory", a3, a4, a5, a6, a7, a8, (uint64_t)"nd6_options");
LABEL_33:
  uint64_t v18 = *(void **)(a3 + 48);
  if (v18)
  {
    do
    {
      uint64_t v19 = (void *)*v18;
      free(v18);
      uint64_t v18 = v19;
    }

    while (v19);
  }

  return 0xFFFFFFFFLL;
}

uint64_t prefix_check(char *__s1, uint64_t a2)
{
  uint64_t v4 = __s1 + 16;
  if (__s1[16] == 254 && (__s1[17] & 0xC0) == 0x80)
  {
    inet_ntop(30, v4, v46, 0x2Eu);
    inet_ntop(30, &dword_1000107D0, v47, 0x2Eu);
    rtadvdLog( 1LL,  (uint64_t)"<%s> link-local prefix %s/%d is advertised from %s on %s",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)"prefix_check");
  }

  prefix = find_prefix(a2, (unsigned __int8 *)v4, __s1[2]);
  if (!prefix)
  {
    inet_ntop(30, v4, v46, 0x2Eu);
    inet_ntop(30, &dword_1000107D0, v47, 0x2Eu);
    rtadvdLog( 1LL,  (uint64_t)"<%s> prefix %s/%d from %s on %s is not in our list",  v23,  v24,  v25,  v26,  v27,  v28,  (uint64_t)"prefix_check");
    return 0LL;
  }

  unsigned int v12 = prefix;
  unsigned int v13 = bswap32(*((_DWORD *)__s1 + 2));
  if (prefix[7])
  {
    gettimeofday(&v45, 0LL);
    uint64_t v14 = v13 + LODWORD(v45.tv_sec);
    if (!v12[3])
    {
      uint64_t v15 = *(void *)(a2 + 232);
      if (v15)
      {
        if (v14 - v12[7] > v15)
        {
          inet_ntop(30, v4, v46, 0x2Eu);
          inet_ntop(30, &dword_1000107D0, v47, 0x2Eu);
          uint64_t v16 = 1LL;
          rtadvdLog( 1LL,  (uint64_t)"<%s> preferred lifetime for %s/%d (decr. in real time) inconsistent on %s: %d from %s, %ld from us",  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)"prefix_check");
          goto LABEL_15;
        }
      }
    }
  }

  else if (!prefix[3] && v13 != *((_DWORD *)prefix + 12))
  {
    inet_ntop(30, v4, v46, 0x2Eu);
    inet_ntop(30, &dword_1000107D0, v47, 0x2Eu);
    rtadvdLog( 1LL,  (uint64_t)"<%s> preferred lifetime for %s/%d inconsistent on %s: %d from %s, %d from us",  v29,  v30,  v31,  v32,  v33,  v34,  (uint64_t)"prefix_check");
  }

  uint64_t v16 = 0LL;
LABEL_15:
  unsigned int v35 = bswap32(*((_DWORD *)__s1 + 1));
  if (v12[5])
  {
    gettimeofday(&v45, 0LL);
    if (!v12[3])
    {
      int64_t v36 = *(void *)(a2 + 232);
      if (v36)
      {
        if (v35 + LODWORD(v45.tv_sec) - v12[5] > v36)
        {
          inet_ntop(30, v4, v46, 0x2Eu);
          inet_ntop(30, &dword_1000107D0, v47, 0x2Eu);
          unint64_t v43 = "<%s> valid lifetime for %s/%d (decr. in real time) inconsistent on %s: %d from %s, %ld from us";
LABEL_23:
          rtadvdLog(1LL, (uint64_t)v43, v37, v38, v39, v40, v41, v42, (uint64_t)"prefix_check");
          return (v16 + 1);
        }
      }
    }
  }

  else if (!v12[3] && v35 != *((_DWORD *)v12 + 8))
  {
    inet_ntop(30, v4, v46, 0x2Eu);
    inet_ntop(30, &dword_1000107D0, v47, 0x2Eu);
    unint64_t v43 = "<%s> valid lifetime for %s/%d inconsistent on %s: %d from %s, %d from us";
    goto LABEL_23;
  }

  return v16;
}

double rtadvd_timer_init()
{
  xmmword_100010710 = 0u;
  *(_OWORD *)&dword_100010720 = 0u;
  qword_100010740 = 0LL;
  xmmword_100010730 = 0u;
  timer_head = (uint64_t)&timer_head;
  *(void *)algn_100010708 = &timer_head;
  double result = *(double *)&tm_max;
  *(__int128 *)((char *)&xmmword_100010710 + 8) = tm_max;
  return result;
}

char *rtadvd_add_timer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (char *)malloc(0x48uLL);
  if (!v8)
  {
    rtadvdLog(0LL, (uint64_t)"<%s> can't allocate memory", v9, v10, v11, v12, v13, v14, (uint64_t)"rtadvd_add_timer");
    goto LABEL_6;
  }

  uint64_t v15 = v8;
  *(void *)uint64_t v8 = 0LL;
  *((void *)v8 + 1) = 0LL;
  *((void *)v8 + 2) = 0LL;
  if (!a1)
  {
    rtadvdLog( 0LL,  (uint64_t)"<%s> timeout function unspecified",  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"rtadvd_add_timer");
LABEL_6:
    exit(1);
  }

  *((void *)v8 + 5) = a1;
  *((void *)v8 + 6) = a3;
  *((void *)v8 + 7) = a2;
  *((void *)v8 + 8) = a4;
  *(_OWORD *)(v8 + 24) = tm_max;
  insque(v8, &timer_head);
  return v15;
}

void rtadvd_remove_timer(void **a1)
{
  *a1 = 0LL;
}

__n128 rtadvd_set_timer(uint64_t a1, uint64_t a2)
{
  int v5 = *(_DWORD *)(a1 + 8) + v8.tv_usec;
  if (v5 > 999999)
  {
    v5 -= 1000000;
    __darwin_time_t v6 = v8.tv_sec + *(void *)a1 + 1;
  }

  else
  {
    __darwin_time_t v6 = *(void *)a1 + v8.tv_sec;
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(void *)(a2 + 24) = v6;
  if (v6 < *((uint64_t *)&xmmword_100010710 + 1)
    || (v6 == *((void *)&xmmword_100010710 + 1) ? (BOOL v7 = v5 < dword_100010720) : (BOOL v7 = 0), v7))
  {
    __n128 result = *(__n128 *)(a2 + 24);
    *(__int128 *)((char *)&xmmword_100010710 + 8) = (__int128)result;
  }

  return result;
}

uint64_t TIMEVAL_ADD(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(a2 + 8) + *(_DWORD *)(result + 8);
  if (v3 > 999999)
  {
    v3 -= 1000000;
    uint64_t v4 = *(void *)result + *(void *)a2 + 1LL;
  }

  else
  {
    uint64_t v4 = *(void *)a2 + *(void *)result;
  }

  *(_DWORD *)(a3 + 8) = v3;
  *(void *)a3 = v4;
  return result;
}

uint64_t *rtadvd_check_timer()
{
  *(__int128 *)((char *)&xmmword_100010710 + 8) = tm_max;
  uint64_t v0 = timer_head;
  if ((uint64_t *)timer_head == &timer_head)
  {
    int v9 = 0x7FFFFFFF;
    __darwin_time_t v8 = 0x7FFFFFFFLL;
    goto LABEL_20;
  }

  __darwin_time_t tv_sec = v16.tv_sec;
  __darwin_suseconds_t tv_usec = v16.tv_usec;
  do
  {
    int v3 = *(uint64_t **)v0;
    int v5 = (void *)(v0 + 24);
    uint64_t v4 = *(void *)(v0 + 24);
    if (v4 < tv_sec || v4 == tv_sec && (uint64_t v4 = tv_sec, *(_DWORD *)(v0 + 32) <= tv_usec))
    {
      __darwin_time_t v6 = *(void (**)(void, uint64_t))(v0 + 56);
      if (v6) {
        v6(*(void *)(v0 + 64), v0 + 24);
      }
      int v7 = tv_usec + *(_DWORD *)(v0 + 32);
      if (v7 >= 1000000)
      {
        v7 -= 1000000;
        uint64_t v4 = *v5 + tv_sec + 1;
      }

      else
      {
        uint64_t v4 = tv_sec + *v5;
      }

      *(_DWORD *)(v0 + 32) = v7;
      *(void *)(v0 + 24) = v4;
    }

    if (v4 < *((uint64_t *)&xmmword_100010710 + 1)
      || v4 == *((void *)&xmmword_100010710 + 1) && *(_DWORD *)(v0 + 32) < dword_100010720)
    {
      *(__int128 *)((char *)&xmmword_100010710 + 8) = *(_OWORD *)v5;
    }

LABEL_17:
    uint64_t v0 = (uint64_t)v3;
  }

  while (v3 != &timer_head);
  __darwin_time_t v8 = *((void *)&xmmword_100010710 + 1);
  int v9 = dword_100010720;
LABEL_20:
  if (v8 == 0x7FFFFFFF && v9 == 0x7FFFFFFF) {
    return 0LL;
  }
  if (v8 < v16.tv_sec || v8 == v16.tv_sec && v9 < v16.tv_usec)
  {
    int v11 = 0;
    uint64_t v12 = 0LL;
  }

  else
  {
    BOOL v13 = __OFSUB__(v9, v16.tv_usec);
    int v11 = v9 - v16.tv_usec;
    char v14 = (v11 < 0) ^ v13;
    if (v14) {
      v11 += 1000000;
    }
    if (v14) {
      __darwin_time_t v15 = ~v16.tv_sec;
    }
    else {
      __darwin_time_t v15 = -v16.tv_sec;
    }
    uint64_t v12 = v15 + v8;
  }

  __n128 result = &rtadvd_check_timer_returnval;
  dword_100010750 = v11;
  rtadvd_check_timer_returnval = v12;
  return result;
}

uint64_t TIMEVAL_SUB(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(result + 8) - *(_DWORD *)(a2 + 8);
  if (v3 < 0)
  {
    v3 += 1000000;
    uint64_t v4 = *(void *)result + ~*(void *)a2;
  }

  else
  {
    uint64_t v4 = *(void *)result - *(void *)a2;
  }

  *(_DWORD *)(a3 + 8) = v3;
  *(void *)a3 = v4;
  return result;
}

uint64_t *rtadvd_timer_rest(uint64_t a1)
{
  uint64_t v8 = *(void *)(a1 + 24);
  if (v8 < rtadvd_timer_rest_now
    || ((int v9 = *(_DWORD *)(a1 + 32), v8 == rtadvd_timer_rest_now) ? (v10 = v9 <= dword_100010770) : (v10 = 0), v10))
  {
    rtadvdLog( 2LL,  (uint64_t)"<%s> a timer must be expired, but not yet",  v2,  v3,  v4,  v5,  v6,  v7,  (uint64_t)"rtadvd_timer_rest");
    int v13 = 0;
    uint64_t v15 = 0LL;
  }

  else
  {
    BOOL v11 = __OFSUB__(v9, dword_100010770);
    int v13 = v9 - dword_100010770;
    char v12 = (v13 < 0) ^ v11;
    if (v12) {
      v13 += 1000000;
    }
    if (v12) {
      uint64_t v14 = ~rtadvd_timer_rest_now;
    }
    else {
      uint64_t v14 = -rtadvd_timer_rest_now;
    }
    uint64_t v15 = v14 + v8;
  }

  __n128 result = &rtadvd_timer_rest_returnval;
  dword_100010760 = v13;
  rtadvd_timer_rest_returnval = v15;
  return result;
}

BOOL rtadvdLog_cold_1(void *a1)
{
  *(_WORD *)uint64_t v4 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Couldn't create os log object",  v4,  2u);
  uint64_t v2 = rtadvdLogger;
  *a1 = rtadvdLogger;
  return v2 == 0;
}