BOOL NEVirtualInterfaceDisableChannel(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  os_log_s *v4;
  int v5;
  os_log_s *v6;
  BOOL result;
  const char *v8;
  uint8_t *v9;
  os_log_s *v10;
  uint32_t v11;
  os_log_s *v12;
  int v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  char *v21;
  char __strerrbuf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;
  v26 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 312) & 0x10) != 0)
    {
      *(_BYTE *)(a1 + 312) &= ~0x10u;
      v1 = *(void *)(a1 + 256);
      if (v1 != 2)
      {
        v2 = *(_DWORD *)(a1 + 296);
        v13 = 0;
        if (v1 == 1)
        {
          v3 = 17;
        }

        else
        {
          v4 = (os_log_s *)ne_log_obj();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__strerrbuf = 136315394;
            v23 = "NEVirtualInterfaceGetEnableChannelOption";
            v24 = 1024;
            v25 = 1639;
            _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "NEVirtualInterface Failure in %s at line %d.",  (uint8_t *)__strerrbuf,  0x12u);
          }

          v3 = 0;
        }

        if (setsockopt(v2, 2, v3, &v13, 4u))
        {
          v5 = *__error();
          if (strerror_r(v5, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          v6 = (os_log_s *)ne_log_obj();
          if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
            return 0LL;
          }
          *(_DWORD *)buf = 67109890;
          v15 = v2;
          v16 = 1024;
          v17 = v3;
          v18 = 1024;
          v19 = v5;
          v20 = 2080;
          v21 = __strerrbuf;
          v8 = "setsockopt(%d, SYSPROTO_CONTROL, %d, disable): [%d] %s";
          v9 = buf;
          v10 = v6;
          v11 = 30;
LABEL_17:
          _os_log_fault_impl(&dword_1876B1000, v10, OS_LOG_TYPE_FAULT, v8, v9, v11);
          return 0LL;
        }
      }
    }

    return 1LL;
  }

  else
  {
    v12 = (os_log_s *)ne_log_obj();
    result = os_log_type_enabled(v12, OS_LOG_TYPE_FAULT);
    if (result)
    {
      *(_DWORD *)__strerrbuf = 136315138;
      v23 = "NEVirtualInterfaceDisableChannel";
      v8 = "%s called with null interface";
      v9 = (uint8_t *)__strerrbuf;
      v10 = v12;
      v11 = 12;
      goto LABEL_17;
    }
  }

  return result;
}

BOOL NEVirtualInterfaceAdjustReadBufferSize(uint64_t a1, unsigned int a2)
{
  *(void *)&v38[5] = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 256) != 2LL)
  {
    int v34 = 16000;
    if (interface_get_mtu(a1 + 265, &v34, (int *)(a1 + 308)))
    {
      v6 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v27 = *__error();
        *(_DWORD *)buf = 136315394;
        v36 = "NEVirtualInterfaceAdjustReadBufferSize";
        __int16 v37 = 1024;
        *(_DWORD *)v38 = v27;
        _os_log_error_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_ERROR,  "%s: interface_get_mtu failed (%d), defaulting to max mtu",  buf,  0x12u);
      }

      int v7 = 16000;
    }

    else
    {
      int v7 = v34;
    }

    uint64_t v8 = v7 + 20LL;
    LODWORD(v9) = *(_DWORD *)(a1 + 96);
    uint64_t v10 = *(void *)(a1 + 88);
    if ((_DWORD)v9 == a2 && v8 == v10) {
      return 1LL;
    }
    *(void *)(a1 + 88) = v8;
    if (v8 != v10 && (_DWORD)v9)
    {
      unint64_t v11 = 0LL;
      while (1)
      {
        v12 = realloc(*(void **)(*(void *)(a1 + 80) + 8 * v11), *(void *)(a1 + 88));
        if (!v12) {
          break;
        }
        *(void *)(*(void *)(a1 + 80) + 8 * v11++) = v12;
        unint64_t v9 = *(unsigned int *)(a1 + 96);
        if (v11 >= v9) {
          goto LABEL_16;
        }
      }

      v19 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = *(void *)(a1 + 88);
        *(_DWORD *)buf = 136315394;
        v36 = "NEVirtualInterfaceAdjustReadBufferSize";
        __int16 v37 = 2048;
        *(void *)v38 = v33;
        _os_log_error_impl( &dword_1876B1000,  v19,  OS_LOG_TYPE_ERROR,  "%s: failed to change read buffer size (length=%zu)",  buf,  0x16u);
      }

      unsigned int v20 = *(_DWORD *)(a1 + 96);
      uint64_t v21 = a1;
      goto LABEL_51;
    }

void NEVirtualInterfaceAdjustSendCount(uint64_t a1, unsigned int a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 256);
  if (v2 == 2)
  {
    v3 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v12 = 136315394;
    uint64_t v13 = "NEVirtualInterfaceAdjustSendCount";
    __int16 v14 = 1024;
    int v15 = 1173;
    v4 = "NEVirtualInterface Failure in %s at line %d.";
    goto LABEL_19;
  }

  if (*(_DWORD *)(a1 + 212) == a2) {
    return;
  }
  *(_DWORD *)(a1 + 212) = a2;
  if (a2)
  {
    BOOL v7 = v2 == 1;
    uint64_t v8 = 1LL;
    if (v7) {
      uint64_t v8 = 2LL;
    }
    if (*(_BYTE *)(a1 + 72)) {
      ++v8;
    }
    *(void *)(a1 + 216) = reallocf(*(void **)(a1 + 216), 16 * a2 * v8);
    *(void *)(a1 + 224) = reallocf(*(void **)(a1 + 224), 56LL * a2);
    unsigned int v9 = 60;
    if (!*(_BYTE *)(a1 + 72)) {
      unsigned int v9 = 44;
    }
    *(void *)(a1 + 232) = reallocf(*(void **)(a1 + 232), v9 * (unint64_t)a2);
    *(void *)(a1 + 240) = reallocf(*(void **)(a1 + 240), 8LL * a2);
    uint64_t v10 = reallocf(*(void **)(a1 + 248), 8LL * a2);
    *(void *)(a1 + 248) = v10;
    unint64_t v11 = *(void **)(a1 + 216);
    if (!v11 || !*(void *)(a1 + 224) || !*(void *)(a1 + 232) || !v10 || !*(void *)(a1 + 240))
    {
      free(v11);
      *(void *)(a1 + 216) = 0LL;
      free(*(void **)(a1 + 224));
      *(void *)(a1 + 224) = 0LL;
      free(*(void **)(a1 + 232));
      *(void *)(a1 + 232) = 0LL;
      free(*(void **)(a1 + 240));
      *(void *)(a1 + 240) = 0LL;
      free(*(void **)(a1 + 248));
      *(void *)(a1 + 248) = 0LL;
      *(_DWORD *)(a1 + 212) = 0;
      v3 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315394;
        uint64_t v13 = "NEVirtualInterfaceAdjustSendCount";
        __int16 v14 = 1024;
        int v15 = a2;
        v4 = "%s: failed to allocate send buffers (cnt=%d)";
LABEL_19:
        _os_log_error_impl(&dword_1876B1000, v3, OS_LOG_TYPE_ERROR, v4, (uint8_t *)&v12, 0x12u);
      }
    }
  }

  else
  {
    free(*(void **)(a1 + 216));
    *(void *)(a1 + 216) = 0LL;
    free(*(void **)(a1 + 224));
    *(void *)(a1 + 224) = 0LL;
    free(*(void **)(a1 + 232));
    *(void *)(a1 + 232) = 0LL;
    free(*(void **)(a1 + 240));
    *(void *)(a1 + 240) = 0LL;
    free(*(void **)(a1 + 248));
    *(void *)(a1 + 248) = 0LL;
  }

uint64_t interface_get_mtu(uint64_t a1, _DWORD *a2, int *a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (*a3 == -1 && (int v5 = socket(2, 2, 0), *a3 = v5, v5 < 0))
  {
    uint64_t v8 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unint64_t v11 = __error();
      int v12 = strerror(*v11);
      *(_DWORD *)int v15 = 136315138;
      uint64_t v16 = v12;
      _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "Failed to create ioctl socket to get MTU: %s",  v15,  0xCu);
    }
  }

  else
  {
    __strlcpy_chk();
    int v17 = 0;
    if ((ioctl(*a3, 0xC0206933uLL, v15) & 0x80000000) == 0)
    {
      uint64_t result = 0LL;
      *a2 = v17;
      return result;
    }

    BOOL v7 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unsigned int v9 = __error();
      uint64_t v10 = strerror(*v9);
      *(_DWORD *)buf = 136315138;
      __int16 v14 = v10;
      _os_log_error_impl(&dword_1876B1000, v7, OS_LOG_TYPE_ERROR, "SIOCGIFMTU failed: %s", buf, 0xCu);
    }

    close(*a3);
    *a3 = -1;
  }

  return *__error();
}

uint64_t NEVirtualInterfaceCleanupBuffersOnFailure(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = 8LL * a2;
    do
    {
      free(*(void **)(*(void *)(a1 + 80) + v4));
      v4 += 8LL;
    }

    while (v5 != v4);
  }

  free(*(void **)(a1 + 80));
  *(void *)(a1 + 80) = 0LL;
  *(_DWORD *)(a1 + 96) = 0;
  return NEVirtualInterfaceAdjustMetadataBufferSize(a1, a2, 0);
}

uint64_t NEVirtualInterfaceAdjustMetadataBufferSize(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (a2 == a3) {
    return 1LL;
  }
  uint64_t v5 = *(void **)(a1 + 104);
  if (!a3)
  {
    free(v5);
    *(void *)(a1 + 104) = 0LL;
    free(*(void **)(a1 + 112));
    *(void *)(a1 + 112) = 0LL;
    free(*(void **)(a1 + 120));
    *(void *)(a1 + 120) = 0LL;
    free(*(void **)(a1 + 128));
    *(void *)(a1 + 128) = 0LL;
    free(*(void **)(a1 + 136));
    *(void *)(a1 + 136) = 0LL;
    free(*(void **)(a1 + 144));
    *(void *)(a1 + 144) = 0LL;
    free(*(void **)(a1 + 152));
    *(void *)(a1 + 152) = 0LL;
    free(*(void **)(a1 + 160));
    *(void *)(a1 + 160) = 0LL;
    free(*(void **)(a1 + 168));
    *(void *)(a1 + 168) = 0LL;
    free(*(void **)(a1 + 176));
    *(void *)(a1 + 176) = 0LL;
    free(*(void **)(a1 + 184));
    *(void *)(a1 + 184) = 0LL;
    free(*(void **)(a1 + 192));
    *(void *)(a1 + 192) = 0LL;
    free(*(void **)(a1 + 200));
    uint64_t result = 1LL;
    uint64_t v10 = (void *)(a1 + 200);
LABEL_30:
    *uint64_t v10 = 0LL;
    return result;
  }

  size_t v6 = a3;
  *(void *)(a1 + 104) = reallocf(v5, 4LL * a3);
  BOOL v7 = *(void **)(a1 + 112);
  if (*(_BYTE *)(a1 + 72))
  {
    uint64_t v8 = 16 * v6;
    unsigned int v9 = reallocf(v7, 16 * v6);
  }

  else
  {
    free(v7);
    unsigned int v9 = 0LL;
    uint64_t v8 = 16 * v6;
  }

  *(void *)(a1 + 112) = v9;
  *(void *)(a1 + 120) = reallocf(*(void **)(a1 + 120), 8 * v6);
  *(void *)(a1 + 128) = reallocf(*(void **)(a1 + 128), 8 * v6);
  *(void *)(a1 + 136) = reallocf(*(void **)(a1 + 136), 8 * v6);
  *(void *)(a1 + 144) = reallocf(*(void **)(a1 + 144), 8 * v6);
  *(void *)(a1 + 152) = reallocf(*(void **)(a1 + 152), 8 * v6);
  *(void *)(a1 + 160) = reallocf(*(void **)(a1 + 160), 8 * v6);
  *(void *)(a1 + 168) = reallocf(*(void **)(a1 + 168), 28 * v6);
  *(void *)(a1 + 176) = reallocf(*(void **)(a1 + 176), 28 * v6);
  *(void *)(a1 + 184) = reallocf(*(void **)(a1 + 184), v6);
  uint64_t v11 = 1LL;
  if (*(void *)(a1 + 256) == 1LL) {
    uint64_t v11 = 2LL;
  }
  if (*(_BYTE *)(a1 + 72)) {
    ++v11;
  }
  *(void *)(a1 + 192) = reallocf(*(void **)(a1 + 192), v8 * v11);
  uint64_t v10 = (void *)(a1 + 200);
  *(void *)(a1 + 200) = reallocf(*(void **)(a1 + 200), 56 * v6);
  if (!*(void *)(a1 + 104)
    || !*(void *)(a1 + 120)
    || *(_BYTE *)(a1 + 72) && !*(void *)(a1 + 112)
    || !*(void *)(a1 + 128)
    || !*(void *)(a1 + 136)
    || !*(void *)(a1 + 144)
    || !*(void *)(a1 + 152)
    || !*(void *)(a1 + 160)
    || !*(void *)(a1 + 168)
    || !*(void *)(a1 + 176)
    || !*(void *)(a1 + 184))
  {
    __int16 v14 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315394;
      uint64_t v16 = "NEVirtualInterfaceAdjustMetadataBufferSize";
      __int16 v17 = 1024;
      int v18 = 2010;
      _os_log_error_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_ERROR,  "NEVirtualInterface Failure in %s at line %d.",  (uint8_t *)&v15,  0x12u);
    }

    free(*(void **)(a1 + 104));
    *(void *)(a1 + 104) = 0LL;
    free(*(void **)(a1 + 112));
    *(void *)(a1 + 112) = 0LL;
    free(*(void **)(a1 + 120));
    *(void *)(a1 + 120) = 0LL;
    free(*(void **)(a1 + 128));
    *(void *)(a1 + 128) = 0LL;
    free(*(void **)(a1 + 136));
    *(void *)(a1 + 136) = 0LL;
    free(*(void **)(a1 + 144));
    *(void *)(a1 + 144) = 0LL;
    free(*(void **)(a1 + 152));
    *(void *)(a1 + 152) = 0LL;
    free(*(void **)(a1 + 160));
    *(void *)(a1 + 160) = 0LL;
    free(*(void **)(a1 + 168));
    *(void *)(a1 + 168) = 0LL;
    free(*(void **)(a1 + 176));
    *(void *)(a1 + 176) = 0LL;
    free(*(void **)(a1 + 184));
    *(void *)(a1 + 184) = 0LL;
    free(*(void **)(a1 + 192));
    *(void *)(a1 + 192) = 0LL;
    free(*(void **)(a1 + 200));
    uint64_t result = 0LL;
    goto LABEL_30;
  }

  uint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  uint64_t result = 1LL;
  do
  {
    *(void *)(*(void *)(a1 + 152) + 8 * v13) = *(void *)(a1 + 168) + v12;
    *(void *)(*(void *)(a1 + 160) + 8 * v13++) = *(void *)(a1 + 176) + v12;
    v12 += 28LL;
  }

  while (v6 != v13);
  return result;
}

_OWORD *NEVirtualInterfaceCreateNexusExtended( const __CFAllocator *a1, uint64_t a2, dispatch_object_s *a3, uint64_t a4, int a5, int a6, unsigned int a7, int a8, int a9, int a10, int a11, unsigned __int8 *uu)
{
  return NEVirtualInterfaceCreateNexusExtendedWithOptions(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, uu, 0LL);
}

_OWORD *NEVirtualInterfaceCreateNexus( const __CFAllocator *a1, uint64_t a2, dispatch_object_s *a3, uint64_t a4, int a5, unsigned int a6, int a7, int a8, int a9, int a10)
{
  return NEVirtualInterfaceCreateNexusExtendedWithOptions(a1, a2, a3, a4, a5, 0, a6, a7, a8, a9, a10, 0LL, 0LL);
}

_OWORD *NEVirtualInterfaceCreate(const __CFAllocator *a1, uint64_t a2, dispatch_object_s *a3, uint64_t a4)
{
  return NEVirtualInterfaceCreateNexusExtendedWithOptions(a1, a2, a3, a4, 0, 0, 0, 0, 0, 0, 0, 0LL, 0LL);
}

_OWORD *NEVirtualInterfaceCreateWithOptions( const __CFAllocator *a1, uint64_t a2, const void *a3, dispatch_object_s *a4, uint64_t a5)
{
  return NEVirtualInterfaceCreateNexusExtendedWithOptions(a1, a2, a4, a5, 0, 0, 0, 0, 0, 0, 0, 0LL, a3);
}

_OWORD *NEVirtualInterfaceCreateUserEthernet( const __CFAllocator *a1, dispatch_object_s *a2, uint64_t a3, int a4, const char *a5, const void *a6)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  Base = NEVirtualInterfaceCreateBase(a1, 3LL, a2, a3);
  if (Base)
  {
    int v10 = dup(a4);
    *((_DWORD *)Base + 74) = v10;
    if (v10 < 0)
    {
      uint64_t v13 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v15 = __error();
        uint64_t v16 = strerror(*v15);
        int v17 = 136315138;
        int v18 = v16;
        _os_log_error_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_ERROR,  "Failed to dup the user ethernet control socket: %s",  (uint8_t *)&v17,  0xCu);
      }

      CFRelease(Base);
      return 0LL;
    }

    else
    {
      __strlcpy_chk();
      *((_DWORD *)Base + 73) = if_nametoindex(a5);
      *((_BYTE *)Base + 72) = 0;
      *((_BYTE *)Base + 264) = 0;
      if (a6)
      {
        CFRetain(a6);
        *((void *)Base + 63) = a6;
      }

      uint64_t v11 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *((void *)Base + 61);
        int v17 = 136315394;
        int v18 = (char *)Base + 265;
        __int16 v19 = 2112;
        uint64_t v20 = v12;
        _os_log_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_DEFAULT,  "Created a new NEVirtualInterface %s (%@)",  (uint8_t *)&v17,  0x16u);
      }
    }
  }

  return Base;
}

char *NEVirtualInterfaceCreateRedirect(const __CFAllocator *a1, dispatch_object_s *a2, int a3, uint64_t a4)
{
  return NEVirtualInterfaceCreateRedirectInner(a1, a2, @"rd", a3, a4);
}

char *NEVirtualInterfaceCreateRedirectInner( const __CFAllocator *a1, dispatch_object_s *a2, const __CFString *a3, int a4, uint64_t a5)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    uint64_t v13 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    *(_WORD *)buffer = 0;
    __int16 v14 = "interface name is NULL";
    int v15 = v13;
    uint32_t v16 = 2;
LABEL_14:
    _os_log_error_impl(&dword_1876B1000, v15, OS_LOG_TYPE_ERROR, v14, (uint8_t *)buffer, v16);
    return 0LL;
  }

  if ((a4 - 1) >= 3)
  {
    int v17 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    *(_DWORD *)buffer = 67109120;
    *(_DWORD *)&buffer[4] = a4;
    __int16 v14 = "invalid interface type %u";
    int v15 = v17;
    uint32_t v16 = 8;
    goto LABEL_14;
  }

  Base = (char *)NEVirtualInterfaceCreateBase(a1, 4LL, a2, a5);
  if (!Base) {
    return Base;
  }
  *(void *)buffer = 0LL;
  uint64_t v24 = 0LL;
  uint64_t v25 = 0LL;
  CFStringGetCString(a3, buffer, 24LL, 0x8000100u);
  uint64_t v8 = (void *)NEHelperInterfaceCreate();
  if (!v8)
  {
    CFRelease(Base);
    return 0LL;
  }

  unsigned int v9 = v8;
  string_ptr = xpc_string_get_string_ptr(v8);
  __strlcpy_chk();
  *((_DWORD *)Base + 73) = if_nametoindex(string_ptr);
  Base[72] = 0;
  Base[264] = 0;
  *((_DWORD *)Base + 74) = -1;
  xpc_release(v9);
  uint64_t v11 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *((void *)Base + 61);
    int v19 = 136315394;
    uint64_t v20 = Base + 265;
    __int16 v21 = 2112;
    uint64_t v22 = v12;
    _os_log_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_DEFAULT,  "Created a new NEVirtualInterface %s (%@)",  (uint8_t *)&v19,  0x16u);
  }

  return Base;
}

char *NEVirtualInterfaceCreateRedirectFromName( const __CFAllocator *a1, CFStringRef theString, dispatch_object_s *a3, int a4, dispatch_object_s *a5)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if ((a4 - 1) >= 3)
  {
    uint64_t v13 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    *(_DWORD *)buffer = 67109120;
    *(_DWORD *)&buffer[4] = a4;
    __int16 v14 = "invalid interface type %u";
    int v15 = v13;
    uint32_t v16 = 8;
LABEL_15:
    _os_log_error_impl(&dword_1876B1000, v15, OS_LOG_TYPE_ERROR, v14, (uint8_t *)buffer, v16);
    return 0LL;
  }

  if (!theString || !CFStringHasPrefix(theString, @"rd"))
  {
    int v17 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    *(_WORD *)buffer = 0;
    __int16 v14 = "invalid interface name";
    int v15 = v17;
    uint32_t v16 = 2;
    goto LABEL_15;
  }

  *(void *)buffer = 0LL;
  uint64_t v24 = 0LL;
  uint64_t v25 = 0LL;
  CFStringGetCString(theString, buffer, 24LL, 0x8000100u);
  Base = NEVirtualInterfaceCreateBase(a1, 4LL, a3, (uint64_t)a5);
  if (Base)
  {
    __strlcpy_chk();
    *((_DWORD *)Base + 73) = if_nametoindex((const char *)Base + 265);
    *((_BYTE *)Base + 72) = 0;
    *((_BYTE *)Base + 264) = 0;
    *((_DWORD *)Base + 74) = -1;
    uint64_t v11 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *((void *)Base + 61);
      int v19 = 136315394;
      uint64_t v20 = (char *)Base + 265;
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      _os_log_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_DEFAULT,  "Created a new NEVirtualInterface %s (%@)",  (uint8_t *)&v19,  0x16u);
    }
  }

  return (char *)Base;
}

uint64_t NEVirtualInterfaceCreateFromSocket(uint64_t a1, int a2, dispatch_object_s *a3, uint64_t a4)
{
  return NEVirtualInterfaceCreateFromSocketAndName(a1, a2, 0LL, 0LL, a3, a4);
}

uint64_t NEVirtualInterfaceCreateFromSocketAndName( uint64_t a1, int a2, uint64_t a3, unint64_t a4, dispatch_object_s *a5, uint64_t a6)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (a2 < 0)
  {
    int v18 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v26 = "NEVirtualInterfaceCreateFromSocketAndName";
      __int16 v27 = 1024;
      int v28 = 1551;
LABEL_21:
      _os_log_error_impl( &dword_1876B1000,  v18,  OS_LOG_TYPE_ERROR,  "NEVirtualInterface Failure in %s at line %d.",  buf,  0x12u);
    }

    return 0LL;
  }

  if (__NEVirtualInterfaceInitialize_onceToken != -1) {
    dispatch_once(&__NEVirtualInterfaceInitialize_onceToken, &__block_literal_global_50);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (!Instance)
  {
    int v18 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v26 = "NEVirtualInterfaceCreateFromSocketAndName";
      __int16 v27 = 1024;
      int v28 = 1559;
      goto LABEL_21;
    }

    return 0LL;
  }

  uint64_t v12 = Instance;
  *(_OWORD *)(Instance + 16) = 0u;
  uint64_t v13 = (dispatch_object_s **)(Instance + 16);
  *(_OWORD *)(Instance + 480) = 0u;
  *(_OWORD *)(Instance + 496) = 0u;
  *(_OWORD *)(Instance + 448) = 0u;
  *(_OWORD *)(Instance + 464) = 0u;
  *(_OWORD *)(Instance + 416) = 0u;
  *(_OWORD *)(Instance + 432) = 0u;
  *(_OWORD *)(Instance + 384) = 0u;
  *(_OWORD *)(Instance + 400) = 0u;
  *(_OWORD *)(Instance + 352) = 0u;
  *(_OWORD *)(Instance + 368) = 0u;
  *(_OWORD *)(Instance + 320) = 0u;
  *(_OWORD *)(Instance + 336) = 0u;
  *(_OWORD *)(Instance + 288) = 0u;
  *(_OWORD *)(Instance + 304) = 0u;
  *(_OWORD *)(Instance + 256) = 0u;
  *(_OWORD *)(Instance + 272) = 0u;
  *(_OWORD *)(Instance + 224) = 0u;
  *(_OWORD *)(Instance + 240) = 0u;
  *(_OWORD *)(Instance + 192) = 0u;
  *(_OWORD *)(Instance + 208) = 0u;
  *(_OWORD *)(Instance + 160) = 0u;
  *(_OWORD *)(Instance + 176) = 0u;
  *(_OWORD *)(Instance + 128) = 0u;
  *(_OWORD *)(Instance + 144) = 0u;
  *(_OWORD *)(Instance + 96) = 0u;
  *(_OWORD *)(Instance + 112) = 0u;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 80) = 0u;
  *(_OWORD *)(Instance + 32) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  *(_DWORD *)(Instance + 308) = -1;
  *(_BYTE *)(Instance + 264) = 1;
  *(_BYTE *)(Instance + 73) = 1;
  *(_DWORD *)(Instance + 296) = a2;
  int v24 = 0;
  if (a3) {
    __strlcpy_chk();
  }
  __int16 v14 = (unint64_t *)(v12 + 256);
  int v15 = (uint64_t *)(v12 + 256);
  if (a4)
  {
    int v15 = 0LL;
    unint64_t *v14 = a4;
  }

  if (a4 >= 2) {
    uint32_t v16 = 0LL;
  }
  else {
    uint32_t v16 = &v24;
  }
  if (!virtual_interface_get_properties( *(_DWORD *)(v12 + 296),  (_BYTE *)(v12 + 265),  (unsigned int *)(v12 + 292),  v15,  v16))
  {
    int v17 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v26 = "NEVirtualInterfaceCreateFromSocketAndName";
      __int16 v27 = 1024;
      int v28 = 1588;
      goto LABEL_36;
    }

CFArrayRef NEVirtualInterfaceGetNexusInstance(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    unsigned int v9 = (os_log_s *)ne_log_obj();
    uint64_t result = (const __CFArray *)os_log_type_enabled(v9, OS_LOG_TYPE_FAULT);
    if (!(_DWORD)result) {
      return result;
    }
    *(_DWORD *)int v10 = 136315138;
    *(void *)&v10[4] = "NEVirtualInterfaceGetNexusInstance";
    _os_log_fault_impl(&dword_1876B1000, v9, OS_LOG_TYPE_FAULT, "%s called with null interface", v10, 0xCu);
    return 0LL;
  }

  uint64_t result = NEVirtualInterfaceCopyNexusInstances(a1, 1u);
  if (result)
  {
    uint64_t v4 = result;
    CFIndex Count = CFArrayGetCount(result);
    if (Count == 1)
    {
      ValueAtIndex = (const __CFUUID *)CFArrayGetValueAtIndex(v4, 0LL);
      *(CFUUIDBytes *)int v10 = CFUUIDGetUUIDBytes(ValueAtIndex);
      uuid_copy(a2, v10);
      CFRelease(v4);
      return (const __CFArray *)1;
    }

    CFIndex v7 = Count;
    uint64_t v8 = (os_log_s *)ne_log_obj();
    uint64_t result = (const __CFArray *)os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      *(void *)int v10 = 0x104000200LL;
      *(_WORD *)&v10[8] = 2048;
      *(void *)&v10[10] = v7;
      _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "Received unexpected number of channels (%d != %ld)",  v10,  0x12u);
      return 0LL;
    }
  }

  return result;
}

__CFArray *NEVirtualInterfaceCopyNexusInstances(uint64_t a1, socklen_t a2)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    int v28 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "NEVirtualInterfaceCopyNexusInstances";
      _os_log_fault_impl(&dword_1876B1000, v28, OS_LOG_TYPE_FAULT, "%s called with null interface", buf, 0xCu);
    }

    return 0LL;
  }

  uint64_t v4 = *(void *)(a1 + 256);
  if (v4 != 1)
  {
    if (v4 == 2)
    {
      int v5 = *(_DWORD *)(a1 + 296);
      int v6 = 9;
      goto LABEL_17;
    }

    uint64_t v12 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "NEVirtualInterfaceGetEnableChannelOption";
      __int16 v32 = 1024;
      int v33 = 1639;
      _os_log_error_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_ERROR,  "NEVirtualInterface Failure in %s at line %d.",  buf,  0x12u);
    }

    if ((unint64_t)(*(void *)(a1 + 256) - 1LL) >= 2)
    {
      uint64_t v13 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v31 = "NEVirtualInterfaceGetChannelOption";
        __int16 v32 = 1024;
        int v33 = 1655;
        _os_log_error_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_ERROR,  "NEVirtualInterface Failure in %s at line %d.",  buf,  0x12u);
      }
    }

    __int16 v14 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    *(_DWORD *)buf = 136315394;
    v31 = "NEVirtualInterfaceCopyNexusInstances";
    __int16 v32 = 1024;
    int v33 = 1704;
    unsigned int v9 = "NEVirtualInterface Failure in %s at line %d.";
    int v10 = v14;
    uint32_t v11 = 18;
    goto LABEL_15;
  }

  int v5 = *(_DWORD *)(a1 + 296);
  socklen_t v29 = a2;
  if (setsockopt(v5, 2, 17, &v29, 4u))
  {
    CFIndex v7 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    int v8 = *__error();
    *(_DWORD *)buf = 67109120;
    LODWORD(v31) = v8;
    unsigned int v9 = "setsockopt ENABLE_CHANNEL failed (errno = %d)\n";
    int v10 = v7;
    uint32_t v11 = 8;
LABEL_15:
    _os_log_error_impl(&dword_1876B1000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
    return 0LL;
  }

  int v6 = 18;
LABEL_17:
  socklen_t v29 = 16 * a2;
  int v15 = (char *)calloc(1uLL, 16 * a2);
  if (!v15)
  {
    int v18 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1876B1000, v18, OS_LOG_TYPE_FAULT, "calloc failed", buf, 2u);
    }

    NEVirtualInterfaceDisableChannel(a1);
    return 0LL;
  }

  uint32_t v16 = v15;
  if (getsockopt(v5, 2, v6, v15, &v29))
  {
    int v17 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v27 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v31) = v27;
      _os_log_error_impl( &dword_1876B1000,  v17,  OS_LOG_TYPE_ERROR,  "getsockopt GET_CHANNEL_UUID failed (errno %d)\n",  buf,  8u);
    }

    NEVirtualInterfaceDisableChannel(a1);
    free(v16);
    return 0LL;
  }

  *(_BYTE *)(a1 + 312) |= 0x10u;
  __int16 v21 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  if (a2)
  {
    uint64_t v22 = a2;
    uint64_t v23 = v16 + 8;
    do
    {
      CFUUIDRef v24 = CFUUIDCreateFromUUIDBytes(v21, *(CFUUIDBytes *)(v23 - 8));
      if (v24)
      {
        CFUUIDRef v25 = v24;
        CFArrayAppendValue(Mutable, v24);
        CFRelease(v25);
      }

      v23 += 16;
      --v22;
    }

    while (v22);
  }

  uint64_t v26 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v31 = (const char *)Mutable;
    _os_log_impl(&dword_1876B1000, v26, OS_LOG_TYPE_INFO, "nexus instances created: %@", buf, 0xCu);
  }

  free(v16);
  return Mutable;
}

uint64_t NEVirtualInterfaceCreateChannel(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    int v10 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      return 0LL;
    }
    int v12 = 136315138;
    uint64_t v13 = "NEVirtualInterfaceCreateChannel";
    int v5 = "%s called with null interface";
    int v6 = (uint8_t *)&v12;
    CFIndex v7 = v10;
    uint32_t v8 = 12;
    goto LABEL_11;
  }

  if (!NEVirtualInterfaceGetNexusInstance(a1, (unsigned __int8 *)&v12))
  {
    uint64_t v4 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      return 0LL;
    }
    LOWORD(v11[0]) = 0;
    int v5 = "NEVirtualInterfaceGetNexusInstance failed";
    int v6 = (uint8_t *)v11;
    CFIndex v7 = v4;
    uint32_t v8 = 2;
LABEL_11:
    _os_log_fault_impl(&dword_1876B1000, v7, OS_LOG_TYPE_FAULT, v5, v6, v8);
    return 0LL;
  }

  uint64_t result = nw_channel_create_with_nexus();
  if (result) {
    return result;
  }
  v3 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v9 = *__error();
    v11[0] = 67109120;
    v11[1] = v9;
    _os_log_error_impl( &dword_1876B1000,  v3,  OS_LOG_TYPE_ERROR,  "nw_channel_create_with_nexus failed (errno %d)",  (uint8_t *)v11,  8u);
  }

  NEVirtualInterfaceDisableChannel(a1);
  return 0LL;
}

BOOL NEVirtualInterfaceEnableFlowswitch(uint64_t a1, int a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    uint64_t v13 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v13, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136315138;
    uint32_t v16 = "NEVirtualInterfaceEnableFlowswitch";
    _os_log_fault_impl(&dword_1876B1000, v13, OS_LOG_TYPE_FAULT, "%s called with null interface", buf, 0xCu);
    return 0LL;
  }

  int v3 = *(_DWORD *)(a1 + 296);
  BOOL v14 = a2 != 0;
  uint64_t v4 = *(void *)(a1 + 256);
  if (v4 == 1)
  {
    int v5 = 19;
  }

  else
  {
    if (v4 != 2)
    {
      CFIndex v7 = (os_log_s *)ne_log_obj();
      BOOL result = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      *(_DWORD *)buf = 136315394;
      uint32_t v16 = "NEVirtualInterfaceEnableFlowswitch";
      __int16 v17 = 1024;
      int v18 = 1909;
      uint32_t v8 = "NEVirtualInterface Failure in %s at line %d.";
      int v9 = v7;
      uint32_t v10 = 18;
      goto LABEL_13;
    }

    int v5 = 10;
  }

  if (setsockopt(v3, 2, v5, &v14, 4u) != -1) {
    return 1LL;
  }
  uint32_t v11 = (os_log_s *)ne_log_obj();
  BOOL result = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
  if (result)
  {
    int v12 = *__error();
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = v12;
    uint32_t v8 = "setsockopt ENABLE_FLOWSWITCH failed (errno = %d)\n";
    int v9 = v11;
    uint32_t v10 = 8;
LABEL_13:
    _os_log_error_impl(&dword_1876B1000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
    return 0LL;
  }

  return result;
}

BOOL NEVirtualInterfaceNameIsVPN(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    uint32_t v8 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v8, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    *(_DWORD *)uint32_t v11 = 136315138;
    *(void *)&_DWORD v11[4] = "NEVirtualInterfaceNameIsVPN";
    _os_log_fault_impl(&dword_1876B1000, v8, OS_LOG_TYPE_FAULT, "%s called with null interfaceName", v11, 0xCu);
    return 0LL;
  }

  int v4 = socket(30, 2, 0);
  if (v4 < 0) {
    return 0LL;
  }
  int v5 = v4;
  *(_OWORD *)uint32_t v11 = 0u;
  __int128 v12 = 0u;
  __strlcpy_chk();
  LOBYTE(v12) = a2 != 0;
  if (ioctl(v5, 0xC02069DFuLL, v11) < 0)
  {
    int v6 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v10 = a1;
      _os_log_error_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_ERROR,  "Failed to set is VPN flag for interface %s",  buf,  0xCu);
    }
  }

  close(v5);
  return 1LL;
}

BOOL NEVirtualInterfaceIsVPN(uint64_t a1, int a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (a1) {
    return NEVirtualInterfaceNameIsVPN(a1 + 265, a2);
  }
  int v3 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v4 = 136315138;
    int v5 = "NEVirtualInterfaceIsVPN";
    _os_log_fault_impl(&dword_1876B1000, v3, OS_LOG_TYPE_FAULT, "%s called with null interface", (uint8_t *)&v4, 0xCu);
  }

  return 0LL;
}

void NEVirtualInterfaceInvalidate(uint64_t a1)
{
  if (a1 && (*(_BYTE *)(a1 + 312) & 0x20) == 0)
  {
    *(_BYTE *)(a1 + 312) |= 0x20u;
    v1 = *(dispatch_source_s **)(a1 + 64);
    if (v1)
    {
      *(void *)(a1 + 64) = 0LL;
      if (*(_BYTE *)(a1 + 74))
      {
        *(_BYTE *)(a1 + 74) = 0;
        dispatch_resume(v1);
      }

      dispatch_source_cancel(v1);
    }

    else
    {
      NEVirtualInterfaceTearDown(a1);
    }
  }

BOOL NEVirtualInterfaceSetReadIPPacketHandler(void *a1, const void *a2)
{
  return NEVirtualInterfaceSetBothReadIPPacketHandlers(a1, a2, 0LL, 1u);
}

BOOL NEVirtualInterfaceSetBothReadIPPacketHandlers( void *a1, const void *a2, const void *a3, unsigned int a4)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    int v5 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    int v15 = 136315394;
    uint32_t v16 = "NEVirtualInterfaceSetBothReadIPPacketHandlers";
    __int16 v17 = 1024;
    int v18 = 2398;
    CFIndex v7 = "NEVirtualInterface Failure in %s at line %d.";
    goto LABEL_27;
  }

  if (a1[32] == 2LL)
  {
    int v5 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    int v15 = 136315394;
    uint32_t v16 = "NEVirtualInterfaceSetBothReadIPPacketHandlers";
    __int16 v17 = 1024;
    int v18 = 2402;
    CFIndex v7 = "NEVirtualInterface Failure in %s at line %d.";
LABEL_27:
    uint32_t v11 = v5;
    uint32_t v12 = 18;
LABEL_28:
    _os_log_error_impl(&dword_1876B1000, v11, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v15, v12);
    return 0LL;
  }

  if (!a4)
  {
    int v5 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    int v15 = 136315394;
    uint32_t v16 = "NEVirtualInterfaceSetBothReadIPPacketHandlers";
    __int16 v17 = 1024;
    int v18 = 2406;
    CFIndex v7 = "NEVirtualInterface Failure in %s at line %d.";
    goto LABEL_27;
  }

  if (a2 && a3)
  {
    uint64_t v10 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    int v15 = 136315138;
    uint32_t v16 = "NEVirtualInterfaceSetBothReadIPPacketHandlers";
    CFIndex v7 = "%s: Error: cannot set both single and mutliple packet handlers";
    uint32_t v11 = v10;
    uint32_t v12 = 12;
    goto LABEL_28;
  }

  if (!NEVirtualInterfaceAdjustReadBufferSize((uint64_t)a1, a4))
  {
    int v5 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    int v15 = 136315394;
    uint32_t v16 = "NEVirtualInterfaceSetBothReadIPPacketHandlers";
    __int16 v17 = 1024;
    int v18 = 2415;
    CFIndex v7 = "NEVirtualInterface Failure in %s at line %d.";
    goto LABEL_27;
  }

  uint64_t v13 = (const void *)a1[4];
  if (v13)
  {
    _Block_release(v13);
    a1[4] = 0LL;
  }

  BOOL v14 = (const void *)a1[6];
  if (v14)
  {
    _Block_release(v14);
    a1[6] = 0LL;
  }

  if (a2) {
    a1[4] = _Block_copy(a2);
  }
  if (a3) {
    a1[6] = _Block_copy(a3);
  }
  return !a1[2] || NEVirtualInterfaceCreateReadSource((uint64_t)a1);
}

BOOL NEVirtualInterfaceCreateReadSource(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 256) == 2LL)
  {
    v1 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v1, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_WORD *)buf = 0;
    int v3 = "Invalid interface type for creating read source\n";
LABEL_4:
    int v4 = v1;
    uint32_t v5 = 2;
    goto LABEL_5;
  }

  CFIndex v7 = *(dispatch_source_s **)(a1 + 64);
  if (v7)
  {
    int v8 = *(unsigned __int8 *)(a1 + 74);
    *(_DWORD *)(a1 + 208) = *(_DWORD *)(a1 + 96);
    if (!v8) {
      return 1LL;
    }
    goto LABEL_12;
  }

  int v15 = 1;
  if (ioctl(*(_DWORD *)(a1 + 296), 0x8004667EuLL, &v15) != -1)
  {
    dispatch_source_t v9 = dispatch_source_create(MEMORY[0x1895F8B60], *(int *)(a1 + 296), 0LL, *(dispatch_queue_t *)(a1 + 16));
    if (!v9)
    {
      v1 = (os_log_s *)ne_log_obj();
      if (!os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
        return 0LL;
      }
      *(_WORD *)buf = 0;
      int v3 = "NEVirtualInterface could not create read source\n";
      goto LABEL_4;
    }

    CFIndex v7 = v9;
    CFRetain((CFTypeRef)a1);
    uint64_t v10 = MEMORY[0x1895F87A8];
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 0x40000000LL;
    handler[2] = __NEVirtualInterfaceCreateReadSource_block_invoke;
    handler[3] = &__block_descriptor_tmp_56;
    handler[4] = a1;
    handler[5] = v7;
    dispatch_source_set_cancel_handler(v7, handler);
    v13[0] = v10;
    v13[1] = 0x40000000LL;
    v13[2] = __NEVirtualInterfaceCreateReadSource_block_invoke_2;
    v13[3] = &__block_descriptor_tmp_57;
    v13[4] = a1;
    dispatch_source_set_event_handler(v7, v13);
    *(void *)(a1 + 64) = v7;
    *(_DWORD *)(a1 + 208) = *(_DWORD *)(a1 + 96);
LABEL_12:
    *(_BYTE *)(a1 + 74) = 0;
    dispatch_resume(v7);
    return 1LL;
  }

  uint32_t v11 = (os_log_s *)ne_log_obj();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    return 0LL;
  }
  int v12 = *__error();
  *(_DWORD *)buf = 67109120;
  int v17 = v12;
  int v3 = "FIONBIO failed: %d\n";
  int v4 = v11;
  uint32_t v5 = 8;
LABEL_5:
  _os_log_error_impl(&dword_1876B1000, v4, OS_LOG_TYPE_ERROR, v3, buf, v5);
  return 0LL;
}

void __NEVirtualInterfaceCreateReadSource_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 74))
  {
    *(_BYTE *)(v2 + 74) = 0;
    dispatch_resume(*(dispatch_object_t *)(a1 + 40));
  }

  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    NEVirtualInterfaceTearDown(v3);
    CFRelease(*(CFTypeRef *)(a1 + 32));
  }

uint64_t __NEVirtualInterfaceCreateReadSource_block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (*(void *)(result + 64))
  {
    unsigned int v3 = *(_DWORD *)(result + 208);
    int v4 = *(unsigned __int8 *)(result + 73);
    if (!*(_BYTE *)(result + 73))
    {
      dispatch_suspend(*(dispatch_object_t *)(result + 64));
      uint64_t result = *(void *)(a1 + 32);
      *(_BYTE *)(result + 74) = 1;
      int v4 = *(unsigned __int8 *)(result + 73);
    }

    do
    {
      if (v4) {
        unsigned int v3 = *(_DWORD *)(result + 96);
      }
      uint64_t result = NEVirtualInterfaceReadMultiplePackets(result, v3);
      if (!(_DWORD)result) {
        break;
      }
      uint64_t result = *(void *)(a1 + 32);
      int v4 = *(unsigned __int8 *)(result + 73);
    }

    while (*(_BYTE *)(result + 73));
  }

  return result;
}

BOOL NEVirtualInterfaceReadMultiplePackets(uint64_t a1, unsigned int a2)
{
  unsigned int v3 = *(_DWORD *)(a1 + 96);
  if (v3 >= a2) {
    uint64_t v4 = a2;
  }
  else {
    uint64_t v4 = v3;
  }
  uint64_t v5 = *(void *)(a1 + 112);
  uint64_t v6 = *(void *)(a1 + 256);
  bzero(*(void **)(a1 + 200), 56LL * v4);
  if (v6 == 1)
  {
    bzero(*(void **)(a1 + 104), 4 * v4);
    int v7 = 1;
    unint64_t v8 = 4LL;
    if (v5)
    {
LABEL_6:
      v8 |= 0x10uLL;
      bzero(*(void **)(a1 + 112), 16 * v4);
      int v9 = v7++;
      goto LABEL_9;
    }
  }

  else
  {
    unint64_t v8 = 0LL;
    int v7 = 0;
    if (v5) {
      goto LABEL_6;
    }
  }

  int v9 = -1;
LABEL_9:
  if ((_DWORD)v4)
  {
    unsigned int v10 = 0;
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    int v13 = v7 + 1;
    uint64_t v14 = *(void *)(a1 + 192);
    int v15 = (int *)(*(void *)(a1 + 200) + 24LL);
    uint32_t v16 = *(uint64_t **)(a1 + 80);
    uint64_t v17 = *(void *)(a1 + 88);
    do
    {
      uint64_t v18 = v10;
      uint64_t v19 = (void *)(v14 + 16LL * v10);
      *((void *)v15 - 1) = v19;
      int *v15 = v13;
      if (v6 == 1)
      {
        void *v19 = *(void *)(a1 + 104) + v12;
        *(void *)(v14 + 16 * v18 + 8) = 4LL;
      }

      if ((v9 & 0x80000000) == 0)
      {
        uint64_t v20 = (void *)(v14 + 16LL * (v9 + v18));
        *uint64_t v20 = *(void *)(a1 + 112) + v11;
        v20[1] = 16LL;
      }

      uint64_t v21 = *v16++;
      uint64_t v22 = (void *)(v14 + 16LL * (v7 + v18));
      v12 += 4LL;
      void *v22 = v21;
      v22[1] = v17;
      v11 += 16LL;
      v15 += 14;
      unsigned int v10 = v18 + v13;
    }

    while (4 * v4 != v12);
  }

  uint64_t v23 = recvmsg_x();
  uint64_t v24 = v23;
  if (*(void *)(a1 + 32)) {
    BOOL v25 = 1;
  }
  else {
    BOOL v25 = *(void *)(a1 + 48) != 0LL;
  }
  if (*(void *)(a1 + 40))
  {
    BOOL v26 = 1;
    if (v23 < 0) {
      return v24 >= 0;
    }
  }

  else
  {
    BOOL v26 = *(void *)(a1 + 56) != 0LL;
    if (v23 < 0) {
      return v24 >= 0;
    }
  }

  if (v25 || v26)
  {
    uint64_t v27 = v23;
    bzero(*(void **)(a1 + 168), 28LL * v23);
    bzero(*(void **)(a1 + 176), 28LL * v24);
    bzero(*(void **)(a1 + 184), v24);
    if ((_DWORD)v24)
    {
      uint64_t v28 = 0LL;
      uint64_t v29 = 0LL;
      uint64_t v30 = 48LL;
      while (1)
      {
        unint64_t v31 = *(void *)(*(void *)(a1 + 200) + v30);
        if (v31 && v31 >= v8) {
          break;
        }
        *(_DWORD *)(*(void *)(a1 + 104) + 4LL * v29) = 0;
        *(void *)(*(void *)(a1 + 128) + 8LL * v29) = 0LL;
        *(void *)(*(void *)(a1 + 144) + 8LL * v29) = 0LL;
LABEL_43:
        ++v28;
        v30 += 56LL;
        if (v27 == v28) {
          goto LABEL_49;
        }
      }

      unint64_t v33 = v31 - v8;
      uint64_t v34 = *(void *)(a1 + 136);
      *(void *)(*(void *)(a1 + 144) + 8LL * v29) = v33;
      *(_DWORD *)(*(void *)(a1 + 104) + 4LL * v29) = bswap32(*(_DWORD *)(*(void *)(a1 + 104) + 4 * v28));
      *(void *)(v34 + 8LL * v29) = *(void *)(*(void *)(a1 + 80) + 8 * v28);
      if (!v26)
      {
LABEL_40:
        uint64_t v47 = *(void *)(a1 + 32);
        if (v47) {
          (*(void (**)(uint64_t, uint64_t, void, void, void, void))(v47 + 16))( v47,  a1,  *(unsigned int *)(*(void *)(a1 + 104) + 4 * v28),  *(void *)(*(void *)(a1 + 136) + 8 * v28),  *(void *)(*(void *)(a1 + 144) + 8 * v28),  *(void *)(a1 + 24));
        }
        uint64_t v29 = (v29 + 1);
        goto LABEL_43;
      }

      int v35 = *(_DWORD *)(*(void *)(a1 + 104) + 4LL * v29);
      if (v35 == 30)
      {
        uint64_t v41 = *(void *)(*(void *)(a1 + 152) + 8LL * v29);
        uint64_t v42 = *(void *)(*(void *)(a1 + 160) + 8LL * v29);
        uint64_t v43 = *(void *)(*(void *)(a1 + 136) + 8LL * v29);
        *(_WORD *)uint64_t v42 = 7708;
        *(_WORD *)uint64_t v41 = 7708;
        *(_OWORD *)(v41 + 8) = *(_OWORD *)(v43 + 8);
        *(_OWORD *)(v42 + 8) = *(_OWORD *)(v43 + 24);
        v39 = (_BYTE *)(v43 + 6);
        uint64_t v40 = 40LL;
      }

      else
      {
        if (v35 != 2)
        {
          uint64_t v40 = 0LL;
LABEL_38:
          *(void *)(*(void *)(a1 + 120) + 8LL * v29) = *(void *)(*(void *)(a1 + 136)
          unint64_t v44 = v33 - v40;
          uint64_t v45 = *(void *)(a1 + 128);
          *(void *)(v45 + 8LL * v29) = v44;
          uint64_t v46 = *(void *)(a1 + 40);
          if (v46) {
            (*(void (**)(uint64_t, uint64_t, void, void, void, void, void, void))(v46 + 16))( v46,  a1,  *(void *)(*(void *)(a1 + 152) + 8 * v28),  *(void *)(*(void *)(a1 + 160) + 8 * v28),  *(unsigned __int8 *)(*(void *)(a1 + 184) + v28),  *(void *)(*(void *)(a1 + 120) + 8 * v28),  *(void *)(v45 + 8 * v28),  *(void *)(a1 + 24));
          }
          goto LABEL_40;
        }

        uint64_t v36 = *(void *)(*(void *)(a1 + 152) + 8LL * v29);
        uint64_t v37 = *(void *)(*(void *)(a1 + 160) + 8LL * v29);
        uint64_t v38 = *(void *)(*(void *)(a1 + 136) + 8LL * v29);
        *(_WORD *)uint64_t v37 = 528;
        *(_WORD *)uint64_t v36 = 528;
        *(_DWORD *)(v36 + 4) = *(_DWORD *)(v38 + 12);
        *(_DWORD *)(v37 + 4) = *(_DWORD *)(v38 + 16);
        v39 = (_BYTE *)(v38 + 9);
        uint64_t v40 = 20LL;
      }

      *(_BYTE *)(*(void *)(a1 + 184) + v29) = *v39;
      goto LABEL_38;
    }

    uint64_t v29 = 0LL;
LABEL_49:
    uint64_t v49 = *(void *)(a1 + 56);
    if (v49) {
      (*(void (**)(uint64_t, uint64_t, void, void, void, void, void, uint64_t, void))(v49 + 16))( v49,  a1,  *(void *)(a1 + 152),  *(void *)(a1 + 160),  *(void *)(a1 + 184),  *(void *)(a1 + 120),  *(void *)(a1 + 128),  v29,  *(void *)(a1 + 24));
    }
    uint64_t v50 = *(void *)(a1 + 48);
    if (v50) {
      (*(void (**)(uint64_t, uint64_t, void, void, void, void, uint64_t, void))(v50 + 16))( v50,  a1,  *(void *)(a1 + 104),  *(void *)(a1 + 112),  *(void *)(a1 + 136),  *(void *)(a1 + 144),  v29,  *(void *)(a1 + 24));
    }
  }

  else if (*(_BYTE *)(a1 + 74))
  {
    v48 = *(dispatch_object_s **)(a1 + 64);
    if (v48)
    {
      *(_DWORD *)(a1 + 208) = *(_DWORD *)(a1 + 96);
      dispatch_resume(v48);
      *(_BYTE *)(a1 + 74) = 0;
    }
  }

  return v24 >= 0;
}

BOOL NEVirtualInterfaceSetReadMultipleIPPacketsHandler(void *a1, const void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  unsigned int v6 = 0;
  uint64_t v5 = (os_log_s *)ne_log_obj();
  BOOL result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_DWORD *)buf = 136315394;
    unint64_t v8 = "NEVirtualInterfaceSetReadMultipleIPPacketsHandler";
    __int16 v9 = 1024;
    int v10 = 2453;
    _os_log_error_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_ERROR,  "NEVirtualInterface Failure in %s at line %d.",  buf,  0x12u);
    return 0LL;
  }

  return result;
}

BOOL NEVirtualInterfaceGetMaxPendingPackets(uint64_t a1, int *a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    unsigned int v6 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "NEVirtualInterfaceGetMaxPendingPackets";
    __int16 v19 = 1024;
    LODWORD(v20) = 3139;
    int v7 = "NEVirtualInterface Failure in %s at line %d.";
LABEL_21:
    uint64_t v12 = v6;
    uint32_t v13 = 18;
    goto LABEL_22;
  }

  uint64_t v3 = *(void *)(a1 + 256);
  if (v3 != 1)
  {
    if (v3 == 3)
    {
      if (!a2) {
        return 1LL;
      }
      int v4 = 64;
LABEL_6:
      *a2 = v4;
      return 1LL;
    }

    unsigned int v6 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "NEVirtualInterfaceGetMaxPendingPackets";
    __int16 v19 = 1024;
    LODWORD(v20) = 3151;
    int v7 = "NEVirtualInterface Failure in %s at line %d.";
    goto LABEL_21;
  }

  socklen_t v15 = 4;
  int v16 = 0;
  int v8 = getsockopt(*(_DWORD *)(a1 + 296), 2, 16, &v16, &v15);
  if (v8)
  {
    int v9 = v8;
    int v10 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    uint64_t v11 = strerror(v9);
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "NEVirtualInterfaceGetMaxPendingPackets";
    __int16 v19 = 2080;
    uint64_t v20 = v11;
    int v7 = "%s failed to get max pending packets: %s\n";
    uint64_t v12 = v10;
    uint32_t v13 = 22;
LABEL_22:
    _os_log_error_impl(&dword_1876B1000, v12, OS_LOG_TYPE_ERROR, v7, buf, v13);
    return 0LL;
  }

  if (v15 == 4)
  {
    if (!a2) {
      return 1LL;
    }
    int v4 = v16;
    goto LABEL_6;
  }

  uint64_t v14 = (os_log_s *)ne_log_obj();
  BOOL result = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v18 = "NEVirtualInterfaceGetMaxPendingPackets";
    int v7 = "%s failed to get correct output length when getting max pending packets\n";
    uint64_t v12 = v14;
    uint32_t v13 = 12;
    goto LABEL_22;
  }

  return result;
}

BOOL NEVirtualInterfaceSetReadIPPayloadHandler(void *a1, const void *a2)
{
  return NEVirtualInterfaceSetBothReadIPPayloadHandler(a1, a2, 0LL, 1u);
}

BOOL NEVirtualInterfaceSetBothReadIPPayloadHandler( void *a1, const void *a2, const void *a3, unsigned int a4)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    uint64_t v5 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    int v15 = 136315394;
    int v16 = "NEVirtualInterfaceSetBothReadIPPayloadHandler";
    __int16 v17 = 1024;
    int v18 = 2466;
    int v7 = "NEVirtualInterface Failure in %s at line %d.";
    goto LABEL_27;
  }

  if (a1[32] == 2LL)
  {
    uint64_t v5 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    int v15 = 136315394;
    int v16 = "NEVirtualInterfaceSetBothReadIPPayloadHandler";
    __int16 v17 = 1024;
    int v18 = 2470;
    int v7 = "NEVirtualInterface Failure in %s at line %d.";
LABEL_27:
    uint64_t v11 = v5;
    uint32_t v12 = 18;
LABEL_28:
    _os_log_error_impl(&dword_1876B1000, v11, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v15, v12);
    return 0LL;
  }

  if (!a4)
  {
    uint64_t v5 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    int v15 = 136315394;
    int v16 = "NEVirtualInterfaceSetBothReadIPPayloadHandler";
    __int16 v17 = 1024;
    int v18 = 2474;
    int v7 = "NEVirtualInterface Failure in %s at line %d.";
    goto LABEL_27;
  }

  if (a2 && a3)
  {
    int v10 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    int v15 = 136315138;
    int v16 = "NEVirtualInterfaceSetBothReadIPPayloadHandler";
    int v7 = "%s: Error: cannot set both single and mutliple payload handlers";
    uint64_t v11 = v10;
    uint32_t v12 = 12;
    goto LABEL_28;
  }

  if (!NEVirtualInterfaceAdjustReadBufferSize((uint64_t)a1, a4))
  {
    uint64_t v5 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    int v15 = 136315394;
    int v16 = "NEVirtualInterfaceSetBothReadIPPayloadHandler";
    __int16 v17 = 1024;
    int v18 = 2483;
    int v7 = "NEVirtualInterface Failure in %s at line %d.";
    goto LABEL_27;
  }

  uint32_t v13 = (const void *)a1[5];
  if (v13)
  {
    _Block_release(v13);
    a1[5] = 0LL;
  }

  uint64_t v14 = (const void *)a1[7];
  if (v14)
  {
    _Block_release(v14);
    a1[7] = 0LL;
  }

  if (a2) {
    a1[5] = _Block_copy(a2);
  }
  if (a3) {
    a1[7] = _Block_copy(a3);
  }
  return !a1[2] || NEVirtualInterfaceCreateReadSource((uint64_t)a1);
}

BOOL NEVirtualInterfaceSetReadMultipleIPPayloadsHandler(void *a1, const void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  unsigned int v6 = 0;
  uint64_t v5 = (os_log_s *)ne_log_obj();
  BOOL result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_DWORD *)buf = 136315394;
    int v8 = "NEVirtualInterfaceSetReadMultipleIPPayloadsHandler";
    __int16 v9 = 1024;
    int v10 = 2521;
    _os_log_error_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_ERROR,  "NEVirtualInterface Failure in %s at line %d.",  buf,  0x12u);
    return 0LL;
  }

  return result;
}

uint64_t NEVirtualInterfaceSetReadAutomatically(uint64_t result, char a2)
{
  if (result) {
    *(_BYTE *)(result + 73) = a2;
  }
  return result;
}

uint64_t NEVirtualInterfaceGetReadAutomatically(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (a1) {
    return *(unsigned __int8 *)(a1 + 73);
  }
  uint64_t v2 = (os_log_s *)ne_log_obj();
  uint64_t result = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
  {
    int v3 = 136315394;
    int v4 = "NEVirtualInterfaceGetReadAutomatically";
    __int16 v5 = 1024;
    int v6 = 2537;
    _os_log_error_impl( &dword_1876B1000,  v2,  OS_LOG_TYPE_ERROR,  "NEVirtualInterface Failure in %s at line %d.",  (uint8_t *)&v3,  0x12u);
    return 0LL;
  }

  return result;
}

void NEVirtualInterfaceReadyToReadMultiple(uint64_t a1, unsigned int a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    uint64_t v2 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v7 = "NEVirtualInterfaceReadyToReadMultiple";
    __int16 v8 = 1024;
    int v9 = 2546;
    goto LABEL_14;
  }

  if (*(void *)(a1 + 256) == 2LL)
  {
    uint64_t v2 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v7 = "NEVirtualInterfaceReadyToReadMultiple";
    __int16 v8 = 1024;
    int v9 = 2550;
LABEL_14:
    _os_log_error_impl( &dword_1876B1000,  v2,  OS_LOG_TYPE_ERROR,  "NEVirtualInterface Failure in %s at line %d.",  buf,  0x12u);
    return;
  }

  if (!a2)
  {
    uint64_t v2 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v7 = "NEVirtualInterfaceReadyToReadMultiple";
    __int16 v8 = 1024;
    int v9 = 2554;
    goto LABEL_14;
  }

  int v3 = *(dispatch_queue_s **)(a1 + 16);
  if (v3)
  {
    if (*(void *)(a1 + 64))
    {
      if (*(_BYTE *)(a1 + 74))
      {
        v4[0] = MEMORY[0x1895F87A8];
        v4[1] = 0x40000000LL;
        v4[2] = __NEVirtualInterfaceReadyToReadMultiple_block_invoke;
        v4[3] = &__block_descriptor_tmp_22721;
        v4[4] = a1;
        unsigned int v5 = a2;
        dispatch_async(v3, v4);
      }
    }
  }

  else
  {
    NEVirtualInterfaceReadMultiplePackets(a1, a2);
  }

void __NEVirtualInterfaceReadyToReadMultiple_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2
    && *(void *)(v2 + 64)
    && *(_BYTE *)(v2 + 74)
    && !NEVirtualInterfaceReadMultiplePackets(v2, *(_DWORD *)(a1 + 40)))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_BYTE *)(v3 + 74) = 0;
    *(_DWORD *)(v3 + 208) = *(_DWORD *)(a1 + 40);
    dispatch_resume(*(dispatch_object_t *)(v3 + 64));
  }

void NEVirtualInterfaceReadyToRead(uint64_t a1)
{
}

uint64_t NEVirtualInterfaceWriteIPPacket(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  int v7 = a2;
  uint64_t v5 = a4;
  uint64_t v6 = a3;
  return NEVirtualInterfaceWriteMultipleIPPackets(a1, (uint64_t)&v7, (uint64_t)&v6, (uint64_t)&v5, 1u);
}

uint64_t NEVirtualInterfaceWriteMultipleIPPackets( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    int v7 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v44 = "NEVirtualInterfaceWriteMultipleIPPackets";
      __int16 v45 = 1024;
      int v46 = 2592;
      goto LABEL_58;
    }

    return 0LL;
  }

  uint64_t v6 = *(void *)(a1 + 256);
  if (v6 == 2)
  {
    int v7 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v44 = "NEVirtualInterfaceWriteMultipleIPPackets";
      __int16 v45 = 1024;
      int v46 = 2596;
LABEL_58:
      _os_log_error_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_ERROR,  "NEVirtualInterface Failure in %s at line %d.",  buf,  0x12u);
      return 0LL;
    }

    return 0LL;
  }

  if (!a2 && v6 == 1)
  {
    int v7 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v44 = "NEVirtualInterfaceWriteMultipleIPPackets";
      __int16 v45 = 1024;
      int v46 = 2600;
      goto LABEL_58;
    }

    return 0LL;
  }

  if (!a3)
  {
    int v7 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v44 = "NEVirtualInterfaceWriteMultipleIPPackets";
      __int16 v45 = 1024;
      int v46 = 2604;
      goto LABEL_58;
    }

    return 0LL;
  }

  if (!a4)
  {
    int v7 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v44 = "NEVirtualInterfaceWriteMultipleIPPackets";
      __int16 v45 = 1024;
      int v46 = 2608;
      goto LABEL_58;
    }

    return 0LL;
  }

  if ((*(_DWORD *)(a1 + 296) & 0x80000000) != 0)
  {
    int v7 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v44 = "NEVirtualInterfaceWriteMultipleIPPackets";
      __int16 v45 = 1024;
      int v46 = 2612;
      goto LABEL_58;
    }

    return 0LL;
  }

  if (!a5)
  {
    int v7 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v44 = "NEVirtualInterfaceWriteMultipleIPPackets";
      __int16 v45 = 1024;
      int v46 = 2616;
      goto LABEL_58;
    }

    return 0LL;
  }

  unsigned int v12 = *(_DWORD *)(a1 + 212);
  if (!v12)
  {
    NEVirtualInterfaceAdjustSendCount(a1, 0x10u);
    unsigned int v12 = *(_DWORD *)(a1 + 212);
  }

  if (a2) {
    BOOL v13 = *(void *)(a1 + 256) == 1LL;
  }
  else {
    BOOL v13 = 0;
  }
  int v14 = *(unsigned __int8 *)(a1 + 72);
  BOOL v41 = v13;
  if (*(_BYTE *)(a1 + 72)) {
    int v15 = v13 + 1;
  }
  else {
    int v15 = v13;
  }
  int v16 = v15 + 1;
  if (v12 <= a5)
  {
    uint64_t v19 = (char *)malloc(16LL * v16 * a5);
    if (!v19)
    {
      int v7 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        unint64_t v44 = "NEVirtualInterfaceWriteMultipleIPPackets";
        __int16 v45 = 1024;
        int v46 = 2648;
        goto LABEL_58;
      }

      return 0LL;
    }

    __int16 v17 = v19;
    unsigned int v40 = v12;
    uint64_t v18 = a5;
    uint64_t v20 = (int *)calloc(a5, 0x38uLL);
    if (!v20)
    {
      int v35 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        unint64_t v44 = "NEVirtualInterfaceWriteMultipleIPPackets";
        __int16 v45 = 1024;
        int v46 = 2653;
        _os_log_error_impl( &dword_1876B1000,  v35,  OS_LOG_TYPE_ERROR,  "NEVirtualInterface Failure in %s at line %d.",  buf,  0x12u);
      }

      free(v17);
      return 0LL;
    }

    v39 = v20;
  }

  else
  {
    unsigned int v40 = v12;
    __int16 v17 = *(char **)(a1 + 216);
    uint64_t v18 = a5;
    v39 = *(int **)(a1 + 224);
    bzero(v39, 56LL * a5);
  }

  uuid_clear(uu);
  int v21 = 0;
  uint64_t v22 = 0LL;
  if (a2) {
    BOOL v23 = v41;
  }
  else {
    BOOL v23 = 0;
  }
  uint64_t v24 = v39 + 6;
  uint64_t v25 = a2;
  do
  {
    if (!*(void *)(a3 + 8 * v22))
    {
      uint64_t v30 = v39;
      __int16 v32 = (os_log_s *)ne_log_obj();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
LABEL_52:
        uint64_t v31 = 0LL;
        goto LABEL_53;
      }

      *(_DWORD *)buf = 136315394;
      unint64_t v44 = "NEVirtualInterfaceWriteMultipleIPPackets";
      __int16 v45 = 1024;
      int v46 = 2667;
LABEL_68:
      _os_log_error_impl( &dword_1876B1000,  v32,  OS_LOG_TYPE_ERROR,  "NEVirtualInterface Failure in %s at line %d.",  buf,  0x12u);
      goto LABEL_52;
    }

    if (!*(void *)(a4 + 8 * v22))
    {
      uint64_t v30 = v39;
      __int16 v32 = (os_log_s *)ne_log_obj();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        goto LABEL_52;
      }
      *(_DWORD *)buf = 136315394;
      unint64_t v44 = "NEVirtualInterfaceWriteMultipleIPPackets";
      __int16 v45 = 1024;
      int v46 = 2672;
      goto LABEL_68;
    }

    BOOL v26 = &v17[16 * v21];
    *((void *)v24 - 1) = v26;
    *uint64_t v24 = v16;
    if (v23)
    {
      *(_DWORD *)(a2 + 4 * v22) = bswap32(*(_DWORD *)(a2 + 4 * v22));
      *(void *)BOOL v26 = v25;
      *(void *)&v17[16 * v21 + 8] = 4LL;
    }

    if (v14)
    {
      uint64_t v27 = (unsigned __int8 **)&v17[16 * v41 + 16 * v21];
      *uint64_t v27 = uu;
      v27[1] = (unsigned __int8 *)16;
    }

    uint64_t v28 = &v17[16 * v15 + 16 * v21];
    *(void *)uint64_t v28 = *(void *)(a3 + 8 * v22);
    uint64_t v29 = *(void *)(a4 + 8 * v22++);
    *((void *)v28 + 1) = v29;
    v25 += 4LL;
    v24 += 14;
    v21 += v16;
  }

  while (v18 != v22);
  uint64_t v30 = v39;
  if (sendmsg_x() > 0)
  {
    uint64_t v31 = 1LL;
LABEL_53:
    unsigned int v33 = v40;
    goto LABEL_54;
  }

  uint64_t v36 = (os_log_s *)ne_log_obj();
  unsigned int v33 = v40;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    uint64_t v37 = __error();
    uint64_t v38 = strerror(*v37);
    *(_DWORD *)buf = 136315138;
    unint64_t v44 = v38;
    _os_log_error_impl(&dword_1876B1000, v36, OS_LOG_TYPE_ERROR, "User Tunnel write error: %s", buf, 0xCu);
  }

  uint64_t v31 = 0LL;
LABEL_54:
  if (v33 <= a5)
  {
    free(v17);
    free(v30);
  }

  return v31;
}

uint64_t NEVirtualInterfaceWriteMultipleIPPayloads( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  return NEVirtualInterfaceWriteMultipleIPPayloadsInner(a1, a2, a3, a4, a5, a6, a7, 0);
}

uint64_t NEVirtualInterfaceWriteMultipleIPPayloadsInner( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7, int a8)
{
  uint64_t v67 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    int v46 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    *(_DWORD *)buf = 136315394;
    v64 = "NEVirtualInterfaceWriteMultipleIPPayloadsInner";
    __int16 v65 = 1024;
    int v66 = 2716;
    goto LABEL_68;
  }

  if (*(void *)(a1 + 256) != 1LL)
  {
    int v46 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    *(_DWORD *)buf = 136315394;
    v64 = "NEVirtualInterfaceWriteMultipleIPPayloadsInner";
    __int16 v65 = 1024;
    int v66 = 2720;
    goto LABEL_68;
  }

  if (!a2)
  {
    int v46 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    *(_DWORD *)buf = 136315394;
    v64 = "NEVirtualInterfaceWriteMultipleIPPayloadsInner";
    __int16 v65 = 1024;
    int v66 = 2724;
    goto LABEL_68;
  }

  if (!a3)
  {
    int v46 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    *(_DWORD *)buf = 136315394;
    v64 = "NEVirtualInterfaceWriteMultipleIPPayloadsInner";
    __int16 v65 = 1024;
    int v66 = 2728;
    goto LABEL_68;
  }

  if (!a4)
  {
    int v46 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    *(_DWORD *)buf = 136315394;
    v64 = "NEVirtualInterfaceWriteMultipleIPPayloadsInner";
    __int16 v65 = 1024;
    int v66 = 2732;
    goto LABEL_68;
  }

  if (!a5)
  {
    int v46 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    *(_DWORD *)buf = 136315394;
    v64 = "NEVirtualInterfaceWriteMultipleIPPayloadsInner";
    __int16 v65 = 1024;
    int v66 = 2736;
    goto LABEL_68;
  }

  if (!a6)
  {
    int v46 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    *(_DWORD *)buf = 136315394;
    v64 = "NEVirtualInterfaceWriteMultipleIPPayloadsInner";
    __int16 v65 = 1024;
    int v66 = 2740;
    goto LABEL_68;
  }

  if ((*(_DWORD *)(a1 + 296) & 0x80000000) != 0)
  {
    int v46 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    *(_DWORD *)buf = 136315394;
    v64 = "NEVirtualInterfaceWriteMultipleIPPayloadsInner";
    __int16 v65 = 1024;
    int v66 = 2744;
    goto LABEL_68;
  }

  if (!a7)
  {
    int v46 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    *(_DWORD *)buf = 136315394;
    v64 = "NEVirtualInterfaceWriteMultipleIPPayloadsInner";
    __int16 v65 = 1024;
    int v66 = 2748;
    goto LABEL_68;
  }

  unsigned int v16 = *(_DWORD *)(a1 + 212);
  if (!v16)
  {
    NEVirtualInterfaceAdjustSendCount(a1, 0x10u);
    unsigned int v16 = *(_DWORD *)(a1 + 212);
  }

  if (*(_BYTE *)(a1 + 72)) {
    size_t v17 = 60LL;
  }
  else {
    size_t v17 = 44LL;
  }
  if (v16 <= a7)
  {
    uint64_t v47 = (char *)malloc(32LL * a7);
    if (v47)
    {
      unsigned int v60 = v16;
      v62 = v47;
      uint64_t v19 = a7;
      v48 = (char *)calloc(a7, 0x38uLL);
      if (v48)
      {
        v61 = v48;
        uint64_t v49 = (char *)calloc(a7, v17);
        if (v49)
        {
          uint64_t v18 = v49;
          goto LABEL_17;
        }

        v55 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v64 = "NEVirtualInterfaceWriteMultipleIPPayloadsInner";
          __int16 v65 = 1024;
          int v66 = 2777;
          _os_log_error_impl( &dword_1876B1000,  v55,  OS_LOG_TYPE_ERROR,  "NEVirtualInterface Failure in %s at line %d.",  buf,  0x12u);
        }

        free(v62);
        v52 = v61;
      }

      else
      {
        v51 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v64 = "NEVirtualInterfaceWriteMultipleIPPayloadsInner";
          __int16 v65 = 1024;
          int v66 = 2771;
          _os_log_error_impl( &dword_1876B1000,  v51,  OS_LOG_TYPE_ERROR,  "NEVirtualInterface Failure in %s at line %d.",  buf,  0x12u);
        }

        v52 = v62;
      }

      free(v52);
      return 0LL;
    }

    int v46 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    *(_DWORD *)buf = 136315394;
    v64 = "NEVirtualInterfaceWriteMultipleIPPayloadsInner";
    __int16 v65 = 1024;
    int v66 = 2766;
LABEL_68:
    _os_log_error_impl( &dword_1876B1000,  v46,  OS_LOG_TYPE_ERROR,  "NEVirtualInterface Failure in %s at line %d.",  buf,  0x12u);
    return 0LL;
  }

  unsigned int v60 = v16;
  v61 = *(char **)(a1 + 224);
  v62 = *(char **)(a1 + 216);
  unsigned int v59 = v17;
  uint64_t v18 = *(char **)(a1 + 232);
  uint64_t v19 = a7;
  bzero(v61, 56LL * a7);
  bzero(v18, v59 * (unint64_t)a7);
LABEL_17:
  uint64_t v20 = 0LL;
  LODWORD(v21) = 0;
  do
  {
    if (a8) {
      uint64_t v21 = v21;
    }
    else {
      uint64_t v21 = v20;
    }
    if (!*(void *)(a5 + 8 * v20))
    {
      v53 = v18;
      v54 = (os_log_s *)ne_log_obj();
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        goto LABEL_85;
      }
      *(_DWORD *)buf = 136315394;
      v64 = "NEVirtualInterfaceWriteMultipleIPPayloadsInner";
      __int16 v65 = 1024;
      int v66 = 2796;
LABEL_84:
      _os_log_error_impl( &dword_1876B1000,  v54,  OS_LOG_TYPE_ERROR,  "NEVirtualInterface Failure in %s at line %d.",  buf,  0x12u);
      goto LABEL_85;
    }

    uint64_t v22 = *(void *)(a6 + 8 * v20);
    if (!v22)
    {
      v53 = v18;
      v54 = (os_log_s *)ne_log_obj();
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        goto LABEL_85;
      }
      *(_DWORD *)buf = 136315394;
      v64 = "NEVirtualInterfaceWriteMultipleIPPayloadsInner";
      __int16 v65 = 1024;
      int v66 = 2801;
      goto LABEL_84;
    }

    uint64_t v23 = *(void *)(a2 + 8LL * v21);
    if (!v23)
    {
      v53 = v18;
      v54 = (os_log_s *)ne_log_obj();
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        goto LABEL_85;
      }
      *(_DWORD *)buf = 136315394;
      v64 = "NEVirtualInterfaceWriteMultipleIPPayloadsInner";
      __int16 v65 = 1024;
      int v66 = 2806;
      goto LABEL_84;
    }

    uint64_t v24 = *(void *)(a3 + 8 * v21);
    if (!v24)
    {
      v53 = v18;
      v54 = (os_log_s *)ne_log_obj();
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        goto LABEL_85;
      }
      *(_DWORD *)buf = 136315394;
      v64 = "NEVirtualInterfaceWriteMultipleIPPayloadsInner";
      __int16 v65 = 1024;
      int v66 = 2811;
      goto LABEL_84;
    }

    if (*(unsigned __int8 *)(v23 + 1) != *(unsigned __int8 *)(v24 + 1))
    {
      v53 = v18;
      v54 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v64 = "NEVirtualInterfaceWriteMultipleIPPayloadsInner";
        __int16 v65 = 1024;
        int v66 = 2816;
        goto LABEL_84;
      }

uint64_t NEVirtualInterfaceWriteMultipleIPPayloadsFromArray( uint64_t a1, uint64_t a2, uint64_t a3, char a4, CFArrayRef theArray)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v20 = a3;
  uint64_t v21 = a2;
  char v19 = a4;
  unsigned int Count = CFArrayGetCount(theArray);
  size_t v8 = 8LL * Count;
  int v9 = malloc(v8);
  if (!v9)
  {
    unsigned int v16 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = "NEVirtualInterfaceWriteMultipleIPPayloadsFromArray";
      __int16 v24 = 1024;
      int v25 = 2901;
      _os_log_error_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_ERROR,  "NEVirtualInterface Failure in %s at line %d.",  buf,  0x12u);
    }

    return 0LL;
  }

  uint64_t v10 = v9;
  uint64_t v11 = malloc(v8);
  if (!v11)
  {
    size_t v17 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = "NEVirtualInterfaceWriteMultipleIPPayloadsFromArray";
      __int16 v24 = 1024;
      int v25 = 2906;
      _os_log_error_impl( &dword_1876B1000,  v17,  OS_LOG_TYPE_ERROR,  "NEVirtualInterface Failure in %s at line %d.",  buf,  0x12u);
    }

    free(v10);
    return 0LL;
  }

  unsigned int v12 = v11;
  if (Count)
  {
    for (CFIndex i = 0LL; i != Count; v12[i++] = CFDataGetLength(ValueAtIndex))
    {
      ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(theArray, i);
      *((void *)v10 + i) = CFDataGetBytePtr(ValueAtIndex);
    }
  }

  uint64_t v15 = NEVirtualInterfaceWriteMultipleIPPayloadsInner( a1,  (uint64_t)&v21,  (uint64_t)&v20,  (uint64_t)&v19,  (uint64_t)v10,  (uint64_t)v12,  Count,  1);
  free(v10);
  free(v12);
  return v15;
}

uint64_t NEVirtualInterfaceWriteIPPayload( uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = a3;
  uint64_t v11 = a2;
  char v9 = a4;
  uint64_t v7 = a6;
  uint64_t v8 = a5;
  return NEVirtualInterfaceWriteMultipleIPPayloadsInner( a1,  (uint64_t)&v11,  (uint64_t)&v10,  (uint64_t)&v9,  (uint64_t)&v8,  (uint64_t)&v7,  1u,  1);
}

uint64_t NEVirtualInterfaceSetDelegateInterface(uint64_t result, const __CFString *a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  uint64_t v2 = result;
  if (*(_BYTE *)(result + 264)) {
    return 0LL;
  }
  CFTypeID TypeID = CFStringGetTypeID();
  if (a2 && CFGetTypeID(a2) == TypeID && CFStringGetLength(a2) >= 1)
  {
    CFIndex Length = CFStringGetLength(a2);
    uint64_t result = (uint64_t)malloc(Length + 1);
    if (!result) {
      return result;
    }
    uint64_t v6 = (char *)result;
    CFIndex v7 = CFStringGetLength(a2);
    CFStringGetCString(a2, v6, v7 + 1, 0x600u);
    strlen(v6);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  uint64_t v8 = *(void *)(v2 + 256);
  if (v8 == 4)
  {
    int v9 = NEHelperInterfaceSetDelegate();
    goto LABEL_16;
  }

  if (v8 == 2 || v8 == 1)
  {
    int v9 = NEHelperInterfaceSetOption();
LABEL_16:
    int v10 = v9;
    if (!v6) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  int v10 = 0;
  if (v6) {
LABEL_17:
  }
    free(v6);
LABEL_18:
  if (v10)
  {
    uint64_t v11 = (os_log_s *)ne_log_obj();
    uint64_t result = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      int v14 = 136315138;
      uint64_t v15 = strerror(v10);
      _os_log_error_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_ERROR,  "Could not set delegate interface: %s",  (uint8_t *)&v14,  0xCu);
      return 0LL;
    }
  }

  else
  {
    unsigned int v12 = *(const void **)(v2 + 480);
    if (v12)
    {
      CFRelease(v12);
      *(void *)(v2 + 480) = 0LL;
    }

    CFTypeID v13 = CFStringGetTypeID();
    if (a2)
    {
      if (CFGetTypeID(a2) == v13) {
        *(void *)(v2 + 480) = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
      }
    }

    NEVirtualInterfaceUpdateMTUWithDelegate(v2);
    return 1LL;
  }

  return result;
}

void NEVirtualInterfaceUpdateMTUWithDelegate(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 300))
  {
    uint64_t v2 = *(const void **)(a1 + 480);
    CFTypeID TypeID = CFStringGetTypeID();
    if (v2)
    {
      if (CFGetTypeID(v2) == TypeID && CFStringGetLength(*(CFStringRef *)(a1 + 480)) >= 1)
      {
        CFIndex Length = CFStringGetLength(*(CFStringRef *)(a1 + 480));
        uint64_t v5 = (char *)malloc(Length + 1);
        if (v5)
        {
          uint64_t v6 = v5;
          CFIndex v7 = *(const __CFString **)(a1 + 480);
          CFIndex v8 = CFStringGetLength(v7);
          CFStringGetCString(v7, v6, v8 + 1, 0x600u);
          int v9 = 0;
          LODWORD(v7) = interface_get_mtu((uint64_t)v6, &v9, (int *)(a1 + 308));
          free(v6);
          if (!(_DWORD)v7) {
            NEVirtualInterfaceSetMTU(a1, v9 - *(_DWORD *)(a1 + 300));
          }
        }
      }
    }
  }

uint64_t NEVirtualInterfaceSetMTU(uint64_t result, int a2)
{
  *(void *)&v15[5] = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v2 = result;
    if (*(_BYTE *)(result + 264)) {
      return 0LL;
    }
    uint64_t v3 = *(void *)(result + 256);
    if (v3 == 3) {
      return 0LL;
    }
    if (v3 != 1 || a2 < 16001)
    {
      int v6 = NEHelperInterfaceSetMTU();
      if (v6)
      {
        int v7 = v6;
        CFIndex v8 = (os_log_s *)ne_log_obj();
        uint64_t result = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
        if ((_DWORD)result)
        {
          int v14 = 136315138;
          *(void *)uint64_t v15 = strerror(v7);
          int v9 = "Failed to set MTU with NEHelper: %s\n";
          int v10 = v8;
          uint32_t v11 = 12;
LABEL_20:
          _os_log_error_impl(&dword_1876B1000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v14, v11);
          return 0LL;
        }
      }

      else
      {
        if (*(void *)(v2 + 256) == 1LL)
        {
          unsigned int v12 = *(_DWORD *)(v2 + 96);
          if (v12) {
            NEVirtualInterfaceAdjustReadBufferSize(v2, v12);
          }
        }

        return 1LL;
      }
    }

    else
    {
      CFTypeID v13 = (os_log_s *)ne_log_obj();
      uint64_t result = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if ((_DWORD)result)
      {
        int v14 = 67109376;
        v15[0] = a2;
        LOWORD(v15[1]) = 1024;
        *(_DWORD *)((char *)&v15[1] + 2) = 16000;
        int v9 = "Requested MTU (%d) is larger than maximum allowed (%d)\n";
        int v10 = v13;
        uint32_t v11 = 14;
        goto LABEL_20;
      }
    }
  }

  return result;
}

CFStringRef NEVirtualInterfaceCopyDelegateInterfaceName(uint64_t a1)
{
  if (a1 && !*(_BYTE *)(a1 + 264) && (uint64_t v2 = *(const __CFString **)(a1 + 480)) != 0LL) {
    return CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], v2);
  }
  else {
    return 0LL;
  }
}

BOOL NEVirtualInterfaceSetDescription(uint64_t a1, CFStringRef theString)
{
  BOOL result = 0LL;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (a1 && theString)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    *(_OWORD *)buffer = 0u;
    __int128 v10 = 0u;
    CFStringGetCString(theString, buffer, 128LL, 0x8000100u);
    if (*(void *)(a1 + 256) == 4LL && (int v4 = NEHelperInterfaceSetDescription()) != 0)
    {
      int v5 = v4;
      int v6 = (os_log_s *)ne_log_obj();
      BOOL result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
      if (result)
      {
        int v7 = 136315138;
        CFIndex v8 = strerror(v5);
        _os_log_error_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_ERROR,  "Could not set description on redirect interface: %s",  (uint8_t *)&v7,  0xCu);
        return 0LL;
      }
    }

    else
    {
      return 1LL;
    }
  }

  return result;
}

uint64_t NEVirtualInterfaceSetMTUOverhead(uint64_t result, int a2)
{
  if (result)
  {
    if (*(_BYTE *)(result + 264))
    {
      return 0LL;
    }

    else
    {
      *(_DWORD *)(result + 300) = a2;
      NEVirtualInterfaceUpdateMTUWithDelegate(result);
      return 1LL;
    }
  }

  return result;
}

BOOL NEVirtualInterfaceSetMaxPendingPackets(uint64_t a1, unsigned int a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (*(void *)(a1 + 256) == 1LL)
    {
      if (*(_BYTE *)(a1 + 264))
      {
        uint64_t v3 = (os_log_s *)ne_log_obj();
        BOOL result = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
        if (result)
        {
          *(_DWORD *)buf = 136315394;
          *(void *)__int128 v11 = "NEVirtualInterfaceSetMaxPendingPackets";
          *(_WORD *)&v11[8] = 1024;
          *(_DWORD *)&v11[10] = 3110;
          int v5 = "NEVirtualInterface Failure in %s at line %d.";
LABEL_24:
          _os_log_error_impl(&dword_1876B1000, v3, OS_LOG_TYPE_ERROR, v5, buf, 0x12u);
          return 0LL;
        }
      }

      else if (a2)
      {
        if (a2 >= 0x400) {
          unsigned int v6 = 1024;
        }
        else {
          unsigned int v6 = a2;
        }
        int v7 = NEHelperInterfaceSetOption();
        if (v7)
        {
          int v8 = v7;
          uint64_t v3 = (os_log_s *)ne_log_obj();
          BOOL result = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
          if (result)
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)__int128 v11 = a2;
            *(_WORD *)&_DWORD v11[4] = 2080;
            *(void *)&v11[6] = strerror(v8);
            int v5 = "Failed to set max pending packets to %u with NEHelper: %s\n";
            goto LABEL_24;
          }
        }

        else
        {
          if (!*(void *)(a1 + 48) && !*(void *)(a1 + 56)) {
            unsigned int v6 = 1;
          }
          return NEVirtualInterfaceAdjustReadBufferSize(a1, v6);
        }
      }

      else
      {
        uint64_t v3 = (os_log_s *)ne_log_obj();
        BOOL result = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
        if (result)
        {
          *(_DWORD *)buf = 136315394;
          *(void *)__int128 v11 = "NEVirtualInterfaceSetMaxPendingPackets";
          *(_WORD *)&v11[8] = 1024;
          *(_DWORD *)&v11[10] = 3114;
          int v5 = "NEVirtualInterface Failure in %s at line %d.";
          goto LABEL_24;
        }
      }
    }

    else
    {
      uint64_t v3 = (os_log_s *)ne_log_obj();
      BOOL result = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
      if (result)
      {
        *(_DWORD *)buf = 136315394;
        *(void *)__int128 v11 = "NEVirtualInterfaceSetMaxPendingPackets";
        *(_WORD *)&v11[8] = 1024;
        *(_DWORD *)&v11[10] = 3106;
        int v5 = "NEVirtualInterface Failure in %s at line %d.";
        goto LABEL_24;
      }
    }
  }

  else
  {
    uint64_t v3 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_DWORD *)buf = 136315394;
      *(void *)__int128 v11 = "NEVirtualInterfaceSetMaxPendingPackets";
      *(_WORD *)&v11[8] = 1024;
      *(_DWORD *)&v11[10] = 3102;
      int v5 = "NEVirtualInterface Failure in %s at line %d.";
      goto LABEL_24;
    }
  }

  return result;
}

uint64_t NEVirtualInterfaceSetOutputTrafficClass(uint64_t result, int a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (result)
  {
    if (*(_BYTE *)(result + 264) || *(void *)(result + 256) != 2LL) {
      return 0LL;
    }
    int v2 = NEHelperInterfaceSetOption();
    if (!v2) {
      return 1LL;
    }
    int v3 = v2;
    int v4 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      *(_DWORD *)buf = 67109378;
      int v7 = a2;
      __int16 v8 = 2080;
      int v9 = strerror(v3);
      _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "Failed to set output traffic class to %d with NEHelper: %s\n",  buf,  0x12u);
      return 0LL;
    }
  }

  return result;
}

uint64_t NEVirtualInterfaceSetDSCPMapping(uint64_t result, int a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (result)
  {
    if (*(_BYTE *)(result + 264) || *(void *)(result + 256) != 2LL) {
      return 0LL;
    }
    int v2 = NEHelperInterfaceSetOption();
    if (!v2) {
      return 1LL;
    }
    int v3 = v2;
    int v4 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      *(_DWORD *)buf = 67109378;
      int v7 = a2;
      __int16 v8 = 2080;
      int v9 = strerror(v3);
      _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "Failed to set output DSCP mapping to %d with NEHelper: %s\n",  buf,  0x12u);
      return 0LL;
    }
  }

  return result;
}

uint64_t NEVirtualInterfaceSetVPNServerAddress(uint64_t result, const __CFString *a2)
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(_BYTE *)(result + 264)) {
      return 0LL;
    }
    CFTypeID TypeID = CFStringGetTypeID();
    if (!a2)
    {
      int v7 = *(const void **)(v2 + 472);
      if (v7)
      {
        CFRelease(v7);
        *(void *)(v2 + 472) = 0LL;
      }

      return 1LL;
    }

    if (CFGetTypeID(a2) != TypeID || (BOOL result = (uint64_t)NEGetAddressFamilyFromString(a2), (_DWORD)result))
    {
      CFTypeID v5 = CFStringGetTypeID();
      if (CFGetTypeID(a2) != v5) {
        return 0LL;
      }
      unsigned int v6 = *(const void **)(v2 + 472);
      if (v6)
      {
        CFRelease(v6);
        *(void *)(v2 + 472) = 0LL;
      }

      *(void *)(v2 + 472) = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
      return 1LL;
    }
  }

  return result;
}

CFTypeRef NEVirtualInterfaceCopyVPNServerAddress(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t NEVirtualInterfaceSetAsPrimary(uint64_t result, int a2)
{
  if (result)
  {
    if (*(_BYTE *)(result + 264))
    {
      return 0LL;
    }

    else
    {
      char v2 = *(_BYTE *)(result + 312);
      if ((v2 & 1) != a2) {
        *(_BYTE *)(result + 312) = v2 & 0xFE | a2 & 1;
      }
      return 1LL;
    }
  }

  return result;
}

uint64_t NEVirtualInterfaceIsPrimary(uint64_t result)
{
  if (result)
  {
    if (*(_BYTE *)(result + 264)) {
      return 0LL;
    }
    else {
      return *(_BYTE *)(result + 312) & 1;
    }
  }

  return result;
}

uint64_t NEVirtualInterfaceSetServiceID(uint64_t a1, CFStringRef theString)
{
  uint64_t result = 0LL;
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a1 && theString)
  {
    CFTypeID v5 = *(const void **)(a1 + 488);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(a1 + 488) = 0LL;
    }

    *(void *)(a1 + 488) = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], theString);
    unsigned int v6 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(a1 + 488);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_debug_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_DEBUG,  "Reset serviceID for NEVirtualInterface (%@)\n",  (uint8_t *)&v8,  0xCu);
    }

    return 1LL;
  }

  return result;
}

uint64_t NEVirtualInterfaceSetRankPrimaryEligible(uint64_t result, int a2)
{
  if (result)
  {
    if (*(_BYTE *)(result + 264))
    {
      return 0LL;
    }

    else
    {
      unsigned int v2 = *(unsigned __int8 *)(result + 312);
      if (((v2 >> 1) & 1) != a2) {
        *(_BYTE *)(result + 312) = v2 & 0xFD | (2 * (a2 & 1));
      }
      return 1LL;
    }
  }

  return result;
}

uint64_t NEVirtualInterfaceSetRankLast(uint64_t result, int a2)
{
  if (result)
  {
    if (*(_BYTE *)(result + 264))
    {
      return 0LL;
    }

    else
    {
      unsigned int v2 = *(unsigned __int8 *)(result + 312);
      if (((v2 >> 2) & 1) != a2) {
        *(_BYTE *)(result + 312) = v2 & 0xFB | (4 * (a2 & 1));
      }
      return 1LL;
    }
  }

  return result;
}

uint64_t NEVirtualInterfaceSetRankNever(uint64_t result, int a2)
{
  if (result)
  {
    if (*(_BYTE *)(result + 264))
    {
      return 0LL;
    }

    else
    {
      unsigned int v2 = *(unsigned __int8 *)(result + 312);
      if (((v2 >> 3) & 1) != a2) {
        *(_BYTE *)(result + 312) = v2 & 0xF7 | (8 * (a2 & 1));
      }
      return 1LL;
    }
  }

  return result;
}

uint64_t NEVirtualInterfaceSetServiceIndex(uint64_t result, int a2)
{
  if (result)
  {
    if (*(_BYTE *)(result + 264))
    {
      return 0LL;
    }

    else
    {
      *(_DWORD *)(result + 316) = a2;
      return 1LL;
    }
  }

  return result;
}

uint64_t NEVirtualInterfaceSetIPv4Router(uint64_t result, const __CFString *a2)
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(_BYTE *)(result + 264)) {
      return 0LL;
    }
    if (a2)
    {
      CFTypeID TypeID = CFStringGetTypeID();
      if (CFGetTypeID(a2) != TypeID) {
        return 0LL;
      }
      CFTypeID v5 = *(const void **)(v2 + 456);
      if (v5)
      {
        CFRelease(v5);
        *(void *)(v2 + 456) = 0LL;
      }

      *(void *)(v2 + 456) = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
    }

    else
    {
      unsigned int v6 = *(const void **)(result + 456);
      if (v6)
      {
        CFRelease(v6);
        *(void *)(v2 + 456) = 0LL;
      }
    }

    return 1LL;
  }

  return result;
}

uint64_t NEVirtualInterfaceSetIPv6Router(uint64_t result, const __CFString *a2)
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(_BYTE *)(result + 264)) {
      return 0LL;
    }
    if (a2)
    {
      CFTypeID TypeID = CFStringGetTypeID();
      if (CFGetTypeID(a2) != TypeID) {
        return 0LL;
      }
      CFTypeID v5 = *(const void **)(v2 + 464);
      if (v5)
      {
        CFRelease(v5);
        *(void *)(v2 + 464) = 0LL;
      }

      *(void *)(v2 + 464) = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
    }

    else
    {
      unsigned int v6 = *(const void **)(result + 464);
      if (v6)
      {
        CFRelease(v6);
        *(void *)(v2 + 464) = 0LL;
      }
    }

    return 1LL;
  }

  return result;
}

CFStringRef NEVirtualInterfaceCopyIPv4Router(uint64_t a1)
{
  if (a1 && !*(_BYTE *)(a1 + 264) && (uint64_t v2 = *(const __CFString **)(a1 + 456)) != 0LL) {
    return CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], v2);
  }
  else {
    return 0LL;
  }
}

CFStringRef NEVirtualInterfaceCopyIPv6Router(uint64_t a1)
{
  if (a1 && !*(_BYTE *)(a1 + 264) && (uint64_t v2 = *(const __CFString **)(a1 + 464)) != 0LL) {
    return CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], v2);
  }
  else {
    return 0LL;
  }
}

uint64_t NEVirtualInterfaceSetIPv4ConfigurationMethod(uint64_t result, uint64_t a2)
{
  if (result)
  {
    if (*(void *)(result + 256) == 3LL)
    {
      *(void *)(result + 376) = a2;
      return 1LL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t NEVirtualInterfaceGetIPv4ConfigurationMethod(uint64_t a1)
{
  if (a1) {
    return *(void *)(a1 + 376);
  }
  else {
    return 1LL;
  }
}

uint64_t NEVirtualInterfaceSetIPv6ConfigurationMethod(uint64_t result, uint64_t a2)
{
  if (result)
  {
    if (*(void *)(result + 256) == 3LL)
    {
      *(void *)(result + 384) = a2;
      return 1LL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t NEVirtualInterfaceGetIPv6ConfigurationMethod(uint64_t a1)
{
  if (a1) {
    return *(void *)(a1 + 384);
  }
  else {
    return 1LL;
  }
}

uint64_t NEVirtualInterfaceAddAddressInternal( uint64_t a1, const __CFString *a2, const __CFString *a3, uint64_t a4)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v5 = 0LL;
  if (a2 && !*(_BYTE *)(a1 + 264))
  {
    int v21 = 0;
    CFDataRef v9 = NECreateAddressStructDataFromString(a2, 0LL, &v21);
    uint64_t v10 = v9;
    if (a3)
    {
      __int128 v11 = NECreateAddressStructDataFromString(a3, 0LL, 0LL);
      if (v10) {
        goto LABEL_6;
      }
    }

    else
    {
      __int128 v11 = 0LL;
      if (v9)
      {
LABEL_6:
        if (a4)
        {
          if (v21 != 30)
          {
            uint64_t v12 = (os_log_s *)ne_log_obj();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              LOWORD(valuePtr) = 0;
              _os_log_error_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_ERROR,  "Error: trying to add lifetime with a non-IPv6 address\n",  (uint8_t *)&valuePtr,  2u);
            }
          }

          BytePtr = CFDataGetBytePtr(v10);
          if (v11) {
            __int128 v14 = CFDataGetBytePtr(v11);
          }
          else {
            __int128 v14 = 0LL;
          }
          int v15 = MEMORY[0x1895ABEBC](a1 + 265, BytePtr, v14, a4);
        }

        else
        {
          CFDataGetBytePtr(v10);
          if (v11) {
            CFDataGetBytePtr(v11);
          }
          int v15 = NEHelperInterfaceSetAddress();
        }

        int v16 = v15;
        if (v15)
        {
          uint64_t v17 = (os_log_s *)ne_log_obj();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            uint64_t v20 = strerror(v16);
            int valuePtr = 136315138;
            uint64_t v23 = v20;
            _os_log_error_impl( &dword_1876B1000,  v17,  OS_LOG_TYPE_ERROR,  "Failed to set address with NEHelper: %s\n",  (uint8_t *)&valuePtr,  0xCu);
          }

          uint64_t v5 = 0LL;
        }

        else
        {
          if (v21 == 30)
          {
            CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 328), a2);
            int valuePtr = 64;
            if (a3) {
              int valuePtr = NEGetPrefixForIPv6NetmaskString(a3);
            }
            CFNumberRef v18 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
            CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 336), v18);
            if (v18) {
              CFRelease(v18);
            }
          }

          else if (v21 == 2)
          {
            CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 320), a2);
          }

          uint64_t v5 = 1LL;
        }

        CFRelease(v10);
        if (v11)
        {
LABEL_34:
          CFRelease(v11);
          return v5;
        }

        return v5;
      }
    }

    uint64_t v5 = 0LL;
    if (!v11) {
      return v5;
    }
    goto LABEL_34;
  }

  return v5;
}

uint64_t NEVirtualInterfaceAddAddress(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  return NEVirtualInterfaceAddAddressInternal(a1, a2, a3, 0LL);
}

uint64_t NEVirtualInterfaceRemoveAddress(uint64_t a1, const __CFString *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v3 = 0LL;
  if (a2 && !*(_BYTE *)(a1 + 264))
  {
    int v21 = 0;
    CFDataRef v5 = NECreateAddressStructDataFromString(a2, 0LL, &v21);
    CFTypeID TypeID = CFDataGetTypeID();
    if (v5)
    {
      if (CFGetTypeID(v5) == TypeID && v21 == 2)
      {
        uint64_t v3 = *(void *)(a1 + 320);
        if (!v3)
        {
LABEL_27:
          CFRelease(v5);
          return v3;
        }

        v25.length = CFArrayGetCount(*(CFArrayRef *)(a1 + 320));
        v25.location = 0LL;
        if (!CFArrayContainsValue((CFArrayRef)v3, v25, a2)) {
          goto LABEL_20;
        }
        CFDataGetBytePtr(v5);
        int v7 = NEHelperInterfaceRemoveAddress();
        if (v7)
        {
          int v8 = v7;
          CFDataRef v9 = (os_log_s *)ne_log_obj();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            goto LABEL_29;
          }
          goto LABEL_20;
        }

        uint64_t v12 = *(const __CFArray **)(a1 + 320);
        v27.length = CFArrayGetCount(v12);
        v27.location = 0LL;
        CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v12, v27, a2);
        if (FirstIndexOfValue != -1)
        {
          CFIndex v14 = FirstIndexOfValue;
          int v15 = *(__CFArray **)(a1 + 320);
LABEL_25:
          CFArrayRemoveValueAtIndex(v15, v14);
        }
      }

      else
      {
        CFTypeID v10 = CFDataGetTypeID();
        uint64_t v3 = 0LL;
        if (CFGetTypeID(v5) != v10) {
          goto LABEL_27;
        }
        if (v21 != 30) {
          goto LABEL_27;
        }
        uint64_t v3 = *(void *)(a1 + 328);
        if (!v3) {
          goto LABEL_27;
        }
        v26.length = CFArrayGetCount(*(CFArrayRef *)(a1 + 328));
        v26.location = 0LL;
        if (!CFArrayContainsValue((CFArrayRef)v3, v26, a2)) {
          goto LABEL_20;
        }
        CFDataGetBytePtr(v5);
        int v11 = NEHelperInterfaceRemoveAddress();
        if (v11)
        {
          int v8 = v11;
          CFDataRef v9 = (os_log_s *)ne_log_obj();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
LABEL_29:
            uint64_t v20 = strerror(v8);
            *(_DWORD *)buf = 136315138;
            uint64_t v23 = v20;
            _os_log_error_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_ERROR,  "Failed to remove address with NEHelper: %s\n",  buf,  0xCu);
          }

uint64_t NEVirtualInterfaceRemoveAllAddresses(uint64_t result)
{
  if (!result) {
    return result;
  }
  v1 = (__CFArray **)result;
  if (*(_BYTE *)(result + 264)) {
    return 0LL;
  }
  uint64_t v2 = *(const __CFArray **)(result + 320);
  if (!v2)
  {
LABEL_15:
    CFTypeID v10 = v1[41];
    if (v10)
    {
      for (CFIndex i = 0LL; ; ++i)
      {
        CFIndex Count = CFArrayGetCount(v10);
        __int128 v13 = v1[41];
        if (i >= Count) {
          break;
        }
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v13, i);
        CFTypeID TypeID = CFStringGetTypeID();
        if (ValueAtIndex)
        {
          if (CFGetTypeID(ValueAtIndex) == TypeID)
          {
            int v8 = NECreateAddressStructDataFromString(ValueAtIndex, 0LL, 0LL);
            CFTypeID v16 = CFDataGetTypeID();
            if (v8)
            {
              if (CFGetTypeID(v8) == v16)
              {
                CFDataGetBytePtr(v8);
              }

              CFRelease(v8);
            }
          }
        }

        CFTypeID v10 = v1[41];
      }

      CFArrayRemoveAllValues(v13);
      CFArrayRemoveAllValues(v1[42]);
    }

    return 1LL;
  }

  for (CFIndex j = 0LL; ; ++j)
  {
    CFIndex v4 = CFArrayGetCount(v2);
    CFDataRef v5 = v1[40];
    if (j >= v4)
    {
      CFArrayRemoveAllValues(v5);
      goto LABEL_15;
    }

    unsigned int v6 = (const __CFString *)CFArrayGetValueAtIndex(v5, j);
    CFTypeID v7 = CFStringGetTypeID();
    if (v6)
    {
      if (CFGetTypeID(v6) == v7)
      {
        int v8 = NECreateAddressStructDataFromString(v6, 0LL, 0LL);
        CFTypeID v9 = CFDataGetTypeID();
        if (v8) {
          break;
        }
      }
    }

__CFArray *NEVirtualInterfaceCopyAddresses(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  uint64_t v3 = *(const void **)(a1 + 320);
  CFTypeID TypeID = CFArrayGetTypeID();
  if (v3 && CFGetTypeID(v3) == TypeID)
  {
    CFDataRef v5 = *(const __CFArray **)(a1 + 320);
    v10.length = CFArrayGetCount(v5);
    v10.location = 0LL;
    CFArrayAppendArray(Mutable, v5, v10);
  }

  unsigned int v6 = *(const void **)(a1 + 328);
  CFTypeID v7 = CFArrayGetTypeID();
  if (v6 && CFGetTypeID(v6) == v7)
  {
    int v8 = *(const __CFArray **)(a1 + 328);
    v11.length = CFArrayGetCount(v8);
    v11.location = 0LL;
    CFArrayAppendArray(Mutable, v8, v11);
  }

  return Mutable;
}

uint64_t NEVirtualInterfaceRemoveRoute(uint64_t result, const __CFString *a2, int a3)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  if (*(_BYTE *)(result + 264)) {
    return 0LL;
  }
  CFTypeID TypeID = CFStringGetTypeID();
  if (!a2 || CFGetTypeID(a2) != TypeID) {
    return 0LL;
  }
  int v7 = NEGetAddressFamilyFromString(a2);
  if (v7 != 30)
  {
    if (v7 == 2)
    {
      int v8 = (void **)(v3 + 352);
      CFTypeID v9 = (void **)(v3 + 344);
      goto LABEL_11;
    }

    return 0LL;
  }

  int v8 = (void **)(v3 + 368);
  CFTypeID v9 = (void **)(v3 + 360);
LABEL_11:
  if (!a3) {
    int v8 = v9;
  }
  CFRange v10 = *v8;
  CFTypeID v11 = CFArrayGetTypeID();
  if (!v10 || CFGetTypeID(v10) != v11) {
    return 0LL;
  }
  CFIndex v12 = 0LL;
  __int128 v13 = (const void *)*MEMORY[0x18960C6F8];
  while (v12 < CFArrayGetCount((CFArrayRef)v10))
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v10, v12);
    CFTypeID v15 = CFDictionaryGetTypeID();
    if (ValueAtIndex)
    {
      if (CFGetTypeID(ValueAtIndex) == v15)
      {
        Value = CFDictionaryGetValue(ValueAtIndex, v13);
        if (Value)
        {
          if (CFEqual(a2, Value))
          {
            CFArrayRemoveValueAtIndex((CFMutableArrayRef)v10, v12);
            break;
          }
        }
      }
    }

    ++v12;
  }

  if (nelog_is_extra_vpn_logging_enabled())
  {
    CFIndex v17 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 136315650;
      uint64_t v20 = v3 + 265;
      if (a3) {
        CFIndex v18 = "excluded ";
      }
      else {
        CFIndex v18 = "";
      }
      __int16 v21 = 2080;
      uint64_t v22 = v18;
      __int16 v23 = 2112;
      uint64_t v24 = a2;
      _os_log_debug_impl(&dword_1876B1000, v17, OS_LOG_TYPE_DEBUG, "%s: removed %s route to %@", (uint8_t *)&v19, 0x20u);
    }
  }

  return 1LL;
}

uint64_t NEVirtualInterfaceRemoveAllRoutes(uint64_t result, int a2, int a3)
{
  if (result)
  {
    uint64_t v3 = (void *)result;
    if (*(_BYTE *)(result + 264))
    {
      return 0LL;
    }

    else
    {
      if (a2)
      {
        CFDataRef v5 = *(__CFArray **)(result + 344);
        if (v5) {
          CFArrayRemoveAllValues(v5);
        }
        unsigned int v6 = (__CFArray *)v3[45];
        if (v6) {
          CFArrayRemoveAllValues(v6);
        }
      }

      if (a3)
      {
        int v7 = (__CFArray *)v3[44];
        if (v7) {
          CFArrayRemoveAllValues(v7);
        }
        int v8 = (__CFArray *)v3[46];
        if (v8) {
          CFArrayRemoveAllValues(v8);
        }
      }

      return 1LL;
    }
  }

  return result;
}

__CFArray *NEVirtualInterfaceCopyRoutes(uint64_t a1, int a2)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = 352LL;
  if (!a2) {
    uint64_t v2 = 344LL;
  }
  uint64_t v3 = *(const __CFArray **)(a1 + v2);
  uint64_t v4 = 368LL;
  if (!a2) {
    uint64_t v4 = 360LL;
  }
  CFDataRef v5 = *(const __CFArray **)(a1 + v4);
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  CFTypeID TypeID = CFArrayGetTypeID();
  if (v3 && CFGetTypeID(v3) == TypeID)
  {
    v10.length = CFArrayGetCount(v3);
    v10.location = 0LL;
    CFArrayAppendArray(Mutable, v3, v10);
  }

  CFTypeID v8 = CFArrayGetTypeID();
  if (v5 && CFGetTypeID(v5) == v8)
  {
    v11.length = CFArrayGetCount(v5);
    v11.location = 0LL;
    CFArrayAppendArray(Mutable, v5, v11);
  }

  return Mutable;
}

CFArrayRef NEVirtualInterfaceCopyIPv4Routes(uint64_t a1, int a2)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = 352LL;
  if (!a2) {
    uint64_t v2 = 344LL;
  }
  uint64_t v3 = *(const __CFArray **)(a1 + v2);
  if (v3) {
    return CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], v3);
  }
  else {
    return 0LL;
  }
}

CFArrayRef NEVirtualInterfaceCopyIPv6Routes(uint64_t a1, int a2)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = 368LL;
  if (!a2) {
    uint64_t v2 = 360LL;
  }
  uint64_t v3 = *(const __CFArray **)(a1 + v2);
  if (v3) {
    return CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], v3);
  }
  else {
    return 0LL;
  }
}

uint64_t NEVirtualInterfaceSetDNSDomain(uint64_t result, const __CFString *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v2 = result;
    if (*(_BYTE *)(result + 264)) {
      return 0LL;
    }
    if (a2)
    {
      CFTypeID TypeID = CFStringGetTypeID();
      if (CFGetTypeID(a2) != TypeID) {
        return 0LL;
      }
      CFDataRef v5 = *(const void **)(v2 + 432);
      if (v5)
      {
        CFRelease(v5);
        *(void *)(v2 + 432) = 0LL;
      }

      *(void *)(v2 + 432) = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
    }

    else
    {
      unsigned int v6 = *(const void **)(result + 432);
      if (v6)
      {
        CFRelease(v6);
        *(void *)(v2 + 432) = 0LL;
      }
    }

    if (nelog_is_extra_vpn_logging_enabled())
    {
      int v7 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315394;
        uint64_t v9 = v2 + 265;
        __int16 v10 = 2112;
        CFRange v11 = a2;
        _os_log_impl(&dword_1876B1000, v7, OS_LOG_TYPE_DEFAULT, "%s: set DNS domain to %@", (uint8_t *)&v8, 0x16u);
      }
    }

    return 1LL;
  }

  return result;
}

CFStringRef NEVirtualInterfaceCopyDNSDomain(uint64_t a1)
{
  if (a1 && !*(_BYTE *)(a1 + 264) && (uint64_t v2 = *(const __CFString **)(a1 + 432)) != 0LL) {
    return CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], v2);
  }
  else {
    return 0LL;
  }
}

uint64_t NEVirtualInterfaceSetDNSServers(uint64_t result, const void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v2 = result;
    if (*(_BYTE *)(result + 264)) {
      return 0LL;
    }
    if (a2)
    {
      CFTypeID TypeID = CFArrayGetTypeID();
      if (CFGetTypeID(a2) != TypeID) {
        return 0LL;
      }
      CFDataRef v5 = *(const void **)(v2 + 416);
      if (v5)
      {
        CFRelease(v5);
        *(void *)(v2 + 416) = 0LL;
      }

      *(void *)(v2 + 416) = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], (CFArrayRef)a2);
    }

    else
    {
      unsigned int v6 = *(const void **)(result + 416);
      if (v6)
      {
        CFRelease(v6);
        *(void *)(v2 + 416) = 0LL;
      }
    }

    if (nelog_is_extra_vpn_logging_enabled())
    {
      int v7 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315394;
        uint64_t v9 = v2 + 265;
        __int16 v10 = 2112;
        CFRange v11 = a2;
        _os_log_impl(&dword_1876B1000, v7, OS_LOG_TYPE_DEFAULT, "%s: set DNS servers to %@", (uint8_t *)&v8, 0x16u);
      }
    }

    return 1LL;
  }

  return result;
}

CFArrayRef NEVirtualInterfaceCopyDNSServers(uint64_t a1)
{
  if (a1 && !*(_BYTE *)(a1 + 264) && (uint64_t v2 = *(const __CFArray **)(a1 + 416)) != 0LL) {
    return CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], v2);
  }
  else {
    return 0LL;
  }
}

uint64_t NEVirtualInterfaceSetDNSSearchDomains(uint64_t result, const void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v2 = result;
    if (*(_BYTE *)(result + 264)) {
      return 0LL;
    }
    if (a2)
    {
      CFTypeID TypeID = CFArrayGetTypeID();
      if (CFGetTypeID(a2) != TypeID) {
        return 0LL;
      }
      CFDataRef v5 = *(const void **)(v2 + 424);
      if (v5)
      {
        CFRelease(v5);
        *(void *)(v2 + 424) = 0LL;
      }

      *(void *)(v2 + 424) = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], (CFArrayRef)a2);
    }

    else
    {
      unsigned int v6 = *(const void **)(result + 424);
      if (v6)
      {
        CFRelease(v6);
        *(void *)(v2 + 424) = 0LL;
      }
    }

    if (nelog_is_extra_vpn_logging_enabled())
    {
      int v7 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315394;
        uint64_t v9 = v2 + 265;
        __int16 v10 = 2112;
        CFRange v11 = a2;
        _os_log_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: set DNS search domains to %@",  (uint8_t *)&v8,  0x16u);
      }
    }

    return 1LL;
  }

  return result;
}

CFArrayRef NEVirtualInterfaceCopyDNSSearchDomains(uint64_t a1)
{
  if (a1 && !*(_BYTE *)(a1 + 264) && (uint64_t v2 = *(const __CFArray **)(a1 + 424)) != 0LL) {
    return CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], v2);
  }
  else {
    return 0LL;
  }
}

uint64_t NEVirtualInterfaceSetDNSSupplementalMatchDomains(uint64_t result, const void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v2 = result;
    if (*(_BYTE *)(result + 264)) {
      return 0LL;
    }
    if (a2)
    {
      CFTypeID TypeID = CFArrayGetTypeID();
      if (CFGetTypeID(a2) != TypeID) {
        return 0LL;
      }
      CFDataRef v5 = *(const void **)(v2 + 392);
      if (v5)
      {
        CFRelease(v5);
        *(void *)(v2 + 392) = 0LL;
      }

      *(void *)(v2 + 392) = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], (CFArrayRef)a2);
    }

    else
    {
      unsigned int v6 = *(const void **)(result + 392);
      if (v6)
      {
        CFRelease(v6);
        *(void *)(v2 + 392) = 0LL;
      }
    }

    if (nelog_is_extra_vpn_logging_enabled())
    {
      int v7 = (os_log_s *)ne_log_large_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315394;
        uint64_t v9 = v2 + 265;
        __int16 v10 = 2112;
        CFRange v11 = a2;
        _os_log_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: set DNS supplemental match domains to %@",  (uint8_t *)&v8,  0x16u);
      }
    }

    return 1LL;
  }

  return result;
}

CFArrayRef NEVirtualInterfaceCopyDNSSupplementalMatchDomains(uint64_t a1)
{
  if (a1 && !*(_BYTE *)(a1 + 264) && (uint64_t v2 = *(const __CFArray **)(a1 + 392)) != 0LL) {
    return CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], v2);
  }
  else {
    return 0LL;
  }
}

uint64_t NEVirtualInterfaceSetDNSSupplementalMatchOrders(uint64_t result, const void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v2 = result;
    if (*(_BYTE *)(result + 264)) {
      return 0LL;
    }
    if (a2)
    {
      CFTypeID TypeID = CFArrayGetTypeID();
      if (CFGetTypeID(a2) != TypeID) {
        return 0LL;
      }
      CFDataRef v5 = *(const void **)(v2 + 400);
      if (v5)
      {
        CFRelease(v5);
        *(void *)(v2 + 400) = 0LL;
      }

      *(void *)(v2 + 400) = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], (CFArrayRef)a2);
    }

    else
    {
      unsigned int v6 = *(const void **)(result + 400);
      if (v6)
      {
        CFRelease(v6);
        *(void *)(v2 + 400) = 0LL;
      }
    }

    if (nelog_is_extra_vpn_logging_enabled())
    {
      int v7 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315394;
        uint64_t v9 = v2 + 265;
        __int16 v10 = 2112;
        CFRange v11 = a2;
        _os_log_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: set DNS supplemental match orders to %@",  (uint8_t *)&v8,  0x16u);
      }
    }

    return 1LL;
  }

  return result;
}

CFArrayRef NEVirtualInterfaceCopyDNSSupplementalMatchOrders(uint64_t a1)
{
  if (a1 && !*(_BYTE *)(a1 + 264) && (uint64_t v2 = *(const __CFArray **)(a1 + 400)) != 0LL) {
    return CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], v2);
  }
  else {
    return 0LL;
  }
}

uint64_t NEVirtualInterfaceSetDNSSupplementalMatchDomainsNoSearch(uint64_t result, int a2)
{
  if (result)
  {
    if (*(_BYTE *)(result + 264))
    {
      return 0LL;
    }

    else
    {
      *(_DWORD *)(result + 408) = a2;
      return 1LL;
    }
  }

  return result;
}

uint64_t NEVirtualInterfaceGetDNSSupplementalMatchDomainsNoSearch(uint64_t result)
{
  if (result)
  {
    if (*(_BYTE *)(result + 264)) {
      return 0LL;
    }
    else {
      return *(unsigned int *)(result + 408);
    }
  }

  return result;
}

uint64_t NEVirtualInterfaceSetDNSServiceIdentifier(uint64_t result, int a2)
{
  if (result)
  {
    if (*(_BYTE *)(result + 264))
    {
      return 0LL;
    }

    else
    {
      *(_DWORD *)(result + 440) = a2;
      return 1LL;
    }
  }

  return result;
}

uint64_t NEVirtualInterfaceSetDNSPort(uint64_t result, int a2)
{
  if (result)
  {
    if (*(_BYTE *)(result + 264))
    {
      return 0LL;
    }

    else
    {
      *(_DWORD *)(result + 444) = a2;
      return 1LL;
    }
  }

  return result;
}

uint64_t NEVirtualInterfaceSetProxies(uint64_t result, const void *a2)
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(_BYTE *)(result + 264)) {
      return 0LL;
    }
    if (a2)
    {
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (CFGetTypeID(a2) != TypeID) {
        return 0LL;
      }
      CFDataRef v5 = *(const void **)(v2 + 448);
      if (v5)
      {
        CFRelease(v5);
        *(void *)(v2 + 448) = 0LL;
      }

      *(void *)(v2 + 448) = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], (CFDictionaryRef)a2);
    }

    else
    {
      unsigned int v6 = *(const void **)(result + 448);
      if (v6)
      {
        CFRelease(v6);
        *(void *)(v2 + 448) = 0LL;
      }
    }

    return 1LL;
  }

  return result;
}

CFDictionaryRef NEVirtualInterfaceCopyProxies(uint64_t a1)
{
  if (!a1 || *(_BYTE *)(a1 + 264) || *(void *)(a1 + 448)) {
    return 0LL;
  }
  else {
    return CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  }
}

uint64_t NEVirtualInterfaceGetType(uint64_t result)
{
  if (result) {
    return *(void *)(result + 256);
  }
  return result;
}

uint64_t NEVirtualInterfaceDupSocket(uint64_t a1)
{
  if (a1) {
    return dup(*(_DWORD *)(a1 + 296));
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t NEVirtualInterfaceGetIndex(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (a1) {
    return *(unsigned int *)(a1 + 292);
  }
  uint64_t v2 = (os_log_s *)ne_log_obj();
  uint64_t result = os_log_type_enabled(v2, OS_LOG_TYPE_FAULT);
  if ((_DWORD)result)
  {
    int v3 = 136315138;
    uint64_t v4 = "NEVirtualInterfaceGetIndex";
    _os_log_fault_impl(&dword_1876B1000, v2, OS_LOG_TYPE_FAULT, "%s called with null interface", (uint8_t *)&v3, 0xCu);
    return 0LL;
  }

  return result;
}

__CFDictionary *NEVirtualInterfaceCopyStatistics(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189604E40],  MEMORY[0x189605250]);
    if (Mutable)
    {
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      *(_OWORD *)__int128 v13 = xmmword_1878732C0;
      int v14 = *(_DWORD *)(a1 + 292);
      int v15 = 1;
      size_t v8 = 180LL;
      if (sysctl(v13, 6u, v16, &v8, 0LL, 0LL) == -1)
      {
        int v3 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        {
          uint64_t v5 = __error();
          unsigned int v6 = strerror(*v5);
          *(_DWORD *)buf = 136315394;
          uint64_t v10 = a1 + 265;
          __int16 v11 = 2080;
          uint64_t v12 = v6;
          _os_log_error_impl( &dword_1876B1000,  v3,  OS_LOG_TYPE_ERROR,  "Failed to get statistics from interface %s: %s",  buf,  0x16u);
        }
      }

      NEAddInt64ToDictionary(Mutable, @"BytesIn", v22);
      NEAddInt64ToDictionary(Mutable, @"BytesOut", *((uint64_t *)&v22 + 1));
      NEAddInt64ToDictionary(Mutable, @"PacketsIn", *((uint64_t *)&v19 + 1));
      NEAddInt64ToDictionary(Mutable, @"PacketsOut", *((uint64_t *)&v20 + 1));
      NEAddInt64ToDictionary(Mutable, @"ErrorsIn", v20);
      NEAddInt64ToDictionary(Mutable, @"ErrorsOut", v21);
    }
  }

  else
  {
    int v7 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)CFTypeID v16 = 136315138;
      CFIndex v17 = "NEVirtualInterfaceCopyStatistics";
      _os_log_fault_impl(&dword_1876B1000, v7, OS_LOG_TYPE_FAULT, "%s called with null interface", v16, 0xCu);
    }

    return 0LL;
  }

  return Mutable;
}

uint64_t NEVirtualInterfaceGetDelegateInterfaceFunctionalType(uint64_t result)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(const __CFString **)(result + 480);
    if (v2)
    {
      uint64_t result = *(unsigned int *)(result + 304);
      if ((_DWORD)result) {
        return result;
      }
      *(void *)buffer = 0LL;
      uint64_t v17 = 0LL;
      if (CFStringGetCString(v2, buffer, 16LL, 0x8000100u))
      {
        if (*(_DWORD *)(v1 + 308) == -1 && (int v3 = socket(2, 2, 0), *(_DWORD *)(v1 + 308) = v3, v3 < 0))
        {
          uint64_t v10 = (os_log_s *)ne_log_obj();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            int v14 = __error();
            int v15 = strerror(*v14);
            *(_DWORD *)__int128 v18 = 136315138;
            __int128 v19 = v15;
            _os_log_error_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_ERROR,  "Failed to create ioctl socket to get functional type: %s",  v18,  0xCu);
          }
        }

        else
        {
          __strlcpy_chk();
          unsigned int v22 = 0;
          if ((ioctl(*(_DWORD *)(v1 + 308), 0xC02069ADuLL, buf) & 0x80000000) == 0)
          {
            uint64_t result = v22;
LABEL_22:
            *(_DWORD *)(v1 + 304) = result;
            return result;
          }

          uint64_t v9 = (os_log_s *)ne_log_obj();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            uint64_t v12 = __error();
            __int128 v13 = strerror(*v12);
            *(_DWORD *)__int128 v18 = 136315138;
            __int128 v19 = v13;
            _os_log_error_impl(&dword_1876B1000, v9, OS_LOG_TYPE_ERROR, "SIOCGIFFUNCTIONALTYPE failed: %s", v18, 0xCu);
          }

          close(*(_DWORD *)(v1 + 308));
          *(_DWORD *)(v1 + 308) = -1;
        }

        if (!*__error())
        {
          uint64_t result = 0LL;
          goto LABEL_22;
        }

        __int16 v11 = (os_log_s *)ne_log_obj();
        uint64_t result = os_log_type_enabled(v11, OS_LOG_TYPE_FAULT);
        if (!(_DWORD)result) {
          return result;
        }
        *(_WORD *)buf = 0;
        unsigned int v6 = "interface_get_functional_type failed";
        int v7 = v11;
        uint32_t v8 = 2;
      }

      else
      {
        uint64_t v4 = (os_log_s *)ne_log_obj();
        uint64_t result = os_log_type_enabled(v4, OS_LOG_TYPE_FAULT);
        if (!(_DWORD)result) {
          return result;
        }
        uint64_t v5 = *(void *)(v1 + 480);
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v5;
        unsigned int v6 = "CFStringGetCString(%@) failed";
        int v7 = v4;
        uint32_t v8 = 12;
      }

      _os_log_fault_impl(&dword_1876B1000, v7, OS_LOG_TYPE_FAULT, v6, buf, v8);
    }

    return 0LL;
  }

  return result;
}

__int128 *nw_utun_protocol_identifier()
{
  if (nw_utun_protocol_identifier_packetProtocolOnceToken != -1) {
    dispatch_once(&nw_utun_protocol_identifier_packetProtocolOnceToken, &__block_literal_global_22821);
  }
  return &g_nw_utun_protocol_identifier;
}

uint64_t __nw_utun_protocol_identifier_block_invoke()
{
  qword_18C6E3E08 = 0LL;
  g_nw_utun_protocol_identifier = 0u;
  unk_18C6E3DF8 = 0u;
  g_nw_utun_protocol_callbacks = 0u;
  unk_18C6E3E20 = 0u;
  xmmword_18C6E3E30 = 0u;
  unk_18C6E3E40 = 0u;
  xmmword_18C6E3E50 = 0u;
  *(_OWORD *)&qword_18C6E3E60 = 0u;
  xmmword_18C6E3E70 = 0u;
  unk_18C6E3E80 = 0u;
  xmmword_18C6E3E90 = 0u;
  unk_18C6E3EA0 = 0u;
  xmmword_18C6E3EB0 = 0u;
  unk_18C6E3EC0 = 0u;
  xmmword_18C6E3ED0 = 0u;
  unk_18C6E3EE0 = 0u;
  xmmword_18C6E3EF0 = 0u;
  unk_18C6E3F00 = 0u;
  xmmword_18C6E3F10 = 0u;
  __strlcpy_chk();
  qword_18C6E3E08 = 0x100000002LL;
  nw_protocol_set_default_one_to_one_callbacks();
  *(void *)&g_nw_utun_protocol_callbacks = nw_utun_protocol_add_input_handler;
  *((void *)&g_nw_utun_protocol_callbacks + 1) = nw_utun_protocol_remove_input_handler;
  qword_18C6E3E60 = (uint64_t)nw_utun_protocol_get_input_frames;
  unk_18C6E3E68 = nw_utun_protocol_get_output_frames;
  *(void *)&xmmword_18C6E3E70 = nw_utun_protocol_finalize_output_frames;
  return nw_protocol_register();
}

uint64_t nw_utun_protocol_add_input_handler(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 48) = a2;
  uuid_copy((unsigned __int8 *)a1, (const unsigned __int8 *)a2);
  *(void *)(a2 + 32) = a1;
  return 1LL;
}

BOOL nw_utun_protocol_remove_input_handler(void *a1, uint64_t a2, int a3)
{
  *(void *)(a2 + 32) = 0LL;
  uint64_t v4 = a1[6];
  if (v4 == a2)
  {
    uint64_t v7 = a1[4];
    if (v7) {
      (*(void (**)(void))(*(void *)(v7 + 24) + 8LL))();
    }
    a1[6] = 0LL;
    if (a3) {
      free(a1);
    }
  }

  return v4 == a2;
}

uint64_t nw_utun_protocol_get_input_frames(uint64_t a1)
{
  uint64_t v1 = (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 24LL) + 80LL))();
  nw_frame_array_foreach();
  return v1;
}

uint64_t nw_utun_protocol_get_output_frames(uint64_t a1)
{
  uint64_t v1 = (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 24LL) + 88LL))();
  nw_frame_array_foreach();
  return v1;
}

uint64_t nw_utun_protocol_finalize_output_frames(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 24LL) + 96LL))();
}

void *nw_utun_protocol_create()
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v0 = calloc(1uLL, 0x40uLL);
  uint64_t v1 = v0;
  if (v0)
  {
    v0[2] = &g_nw_utun_protocol_identifier;
    v0[3] = &g_nw_utun_protocol_callbacks;
    v0[5] = 0LL;
  }

  else
  {
    uint64_t v2 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      int v4 = 134217984;
      uint64_t v5 = 64LL;
      _os_log_fault_impl(&dword_1876B1000, v2, OS_LOG_TYPE_FAULT, "calloc(%zu) failed", (uint8_t *)&v4, 0xCu);
    }
  }

  return v1;
}

uint64_t __nw_utun_protocol_finalize_output_frames_block_invoke()
{
  char v0 = *(_BYTE *)nw_frame_unclaimed_bytes();
  nw_frame_unclaim();
  uint64_t v1 = (_DWORD *)nw_frame_unclaimed_bytes();
  if ((v0 & 0xF0) == 0x60) {
    int v2 = 503316480;
  }
  else {
    int v2 = 0;
  }
  if ((v0 & 0xF0) == 0x40) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = v2;
  }
  _DWORD *v1 = v3;
  return 1LL;
}

uint64_t __nw_utun_protocol_get_output_frames_block_invoke()
{
  return 1LL;
}

uint64_t __nw_utun_protocol_get_input_frames_block_invoke()
{
  return 1LL;
}

uint64_t NEVirtualInterfaceDidPublish(uint64_t result)
{
  if (result) {
    return (*(unsigned __int8 *)(result + 312) >> 6) & 1;
  }
  return result;
}

void sub_187847844(_Unwind_Exception *a1)
{
}

void sub_1878490C8(_Unwind_Exception *a1)
{
}

void sub_187849474(_Unwind_Exception *a1)
{
}

void sub_1878494E4(_Unwind_Exception *a1)
{
}

uint64_t NEVPNConfigurationCreate()
{
  return 0LL;
}

uint64_t NEVPNConfigurationGetTunnelType()
{
  return 1LL;
}

uint64_t NEVPNConfigurationCopyAll()
{
  return 0LL;
}

uint64_t NEVPNConfigurationCopy()
{
  return 0LL;
}

uint64_t NEVPNConfigurationSet()
{
  return 0LL;
}

uint64_t NEVPNConfigurationRemove()
{
  return 0LL;
}

uint64_t NEVPNConfigurationSetName()
{
  return 0LL;
}

uint64_t NEVPNConfigurationGetName()
{
  return 0LL;
}

uint64_t NEVPNConfigurationSetEnabled()
{
  return 0LL;
}

uint64_t NEVPNConfigurationGetEnabled()
{
  return 0LL;
}

uint64_t NEVPNConfigurationEnableVPNType()
{
  return 0LL;
}

uint64_t NEVPNConfigurationIsVPNTypeEnabled()
{
  return 0LL;
}

uint64_t NEVPNConfigurationCopyVendorData()
{
  return 0LL;
}

uint64_t NEVPNConfigurationSetVendorData()
{
  return 0LL;
}

uint64_t NEVPNCopyLastError()
{
  return 0LL;
}

uint64_t NEVPNConfigurationSetCallback()
{
  return 0LL;
}

uint64_t NEVPNConfigurationSetMessageCallback()
{
  return 0LL;
}

uint64_t NEVPNConfigurationScheduleWithRunLoop()
{
  return 0LL;
}

uint64_t NEVPNConfigurationUnscheduleFromRunLoop()
{
  return 0LL;
}

uint64_t NEVPNConfigurationConnectionStart()
{
  return 0LL;
}

uint64_t NEVPNConfigurationConnectionStop()
{
  return 0LL;
}

uint64_t NEVPNConfigurationGetStatus()
{
  return 0xFFFFFFFFLL;
}

uint64_t NEVPNConfigurationSendMessage()
{
  return 0LL;
}

uint64_t NEVPNConfigurationCopyIdentities()
{
  return 0LL;
}

uint64_t NEVPNConfigurationCopyCertificate()
{
  return 0LL;
}

uint64_t NEVPNConfigurationCopyLastConnectionError()
{
  return 0LL;
}

uint64_t NEVPNConfigurationSetPersistentData()
{
  return 0LL;
}

uint64_t NEVPNConfigurationCopyPersistentData()
{
  return 0LL;
}

uint64_t NEVPNConfigurationValidateCertificate()
{
  return 3LL;
}

uint64_t NEVPNConfigurationCopyAppRuleIDs()
{
  return 0LL;
}

uint64_t NEVPNConfigurationCopyAppRule()
{
  return 0LL;
}

uint64_t NEVPNConfigurationRemoveAppRule()
{
  return 0LL;
}

uint64_t NEVPNConfigurationSetAppRule()
{
  return 0LL;
}

void sub_187849AA8(_Unwind_Exception *a1)
{
}

void sub_187849B64(_Unwind_Exception *a1)
{
}

void sub_18784A6E0(_Unwind_Exception *a1)
{
}

void sub_18784B5EC(_Unwind_Exception *a1)
{
}

void sub_18784B6DC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18784B820( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18784CCA0(_Unwind_Exception *a1)
{
}

void sub_18784CDA8(_Unwind_Exception *a1)
{
}

void sub_18784CE88(_Unwind_Exception *a1)
{
}

void sub_18784CF60(_Unwind_Exception *a1)
{
}

void sub_18784D040(_Unwind_Exception *a1)
{
}

void sub_18784D108(_Unwind_Exception *a1)
{
}

void sub_18784D1DC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18784D2A4(_Unwind_Exception *a1)
{
}

void sub_18784D378( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18784D3E8(_Unwind_Exception *a1)
{
}

void sub_18784D460(_Unwind_Exception *a1)
{
}

void sub_18784DBDC(_Unwind_Exception *a1)
{
}

void sub_18784E604(_Unwind_Exception *a1)
{
}

void sub_18784E9B0(_Unwind_Exception *a1)
{
}

void sub_18784F344( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

uint64_t __Block_byref_object_copy__23563(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__23564(uint64_t a1)
{
}

void sub_1878515C8(_Unwind_Exception *a1)
{
}

void sub_187851660(_Unwind_Exception *a1)
{
}

__CFString *createStringFromIKEv2IntegrityAlgorithm(uint64_t a1)
{
  else {
    return off_18A090760[a1 - 1];
  }
}

void sub_1878567AC(_Unwind_Exception *a1)
{
}

void sub_1878569A0(_Unwind_Exception *a1)
{
}

void sub_187856B1C(_Unwind_Exception *a1)
{
}

void sub_187856BAC(_Unwind_Exception *a1)
{
}

void sub_187856C3C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_187856CD0(_Unwind_Exception *a1)
{
}

void sub_187856D74(_Unwind_Exception *a1)
{
}

void sub_187856E08(_Unwind_Exception *a1)
{
}

void sub_187856EAC(_Unwind_Exception *a1)
{
}

void sub_187856F40(_Unwind_Exception *a1)
{
}

void sub_187856FE4(_Unwind_Exception *a1)
{
}

void sub_187857078(_Unwind_Exception *a1)
{
}

void sub_18785711C(_Unwind_Exception *a1)
{
}

void sub_1878571A0(_Unwind_Exception *a1)
{
}

void sub_18785722C(_Unwind_Exception *a1)
{
}

void sub_187858080(_Unwind_Exception *a1)
{
}

void sub_1878582F8(_Unwind_Exception *a1)
{
}

void sub_1878587A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__24527(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__24528(uint64_t a1)
{
}

void sub_187859544(_Unwind_Exception *a1)
{
}

void sub_18785CDF4(_Unwind_Exception *a1)
{
}

void sub_18785CE7C(_Unwind_Exception *a1)
{
}

void sub_18785CFBC(_Unwind_Exception *a1)
{
}

void sub_18785D058(_Unwind_Exception *a1)
{
}

uint64_t sub_187860708()
{
  return MEMORY[0x189606248]();
}

uint64_t sub_187860714()
{
  return MEMORY[0x189606260]();
}

uint64_t sub_187860720()
{
  return MEMORY[0x189606928]();
}

uint64_t sub_18786072C()
{
  return MEMORY[0x189606BA8]();
}

uint64_t sub_187860738()
{
  return MEMORY[0x189606C18]();
}

uint64_t sub_187860744()
{
  return MEMORY[0x189606C58]();
}

uint64_t sub_187860750()
{
  return MEMORY[0x189606CA0]();
}

uint64_t sub_18786075C()
{
  return MEMORY[0x189606CF8]();
}

uint64_t sub_187860768()
{
  return MEMORY[0x18960F0F8]();
}

uint64_t sub_187860774()
{
  return MEMORY[0x18960F100]();
}

uint64_t sub_187860780()
{
  return MEMORY[0x18960F110]();
}

uint64_t sub_18786078C()
{
  return MEMORY[0x18960F118]();
}

uint64_t sub_187860798()
{
  return MEMORY[0x18960F120]();
}

uint64_t sub_1878607A4()
{
  return MEMORY[0x18960F128]();
}

uint64_t sub_1878607B0()
{
  return MEMORY[0x18960F130]();
}

uint64_t sub_1878607BC()
{
  return MEMORY[0x18960F138]();
}

uint64_t sub_1878607C8()
{
  return MEMORY[0x18960F148]();
}

uint64_t sub_1878607D4()
{
  return MEMORY[0x18960F150]();
}

uint64_t sub_1878607E0()
{
  return MEMORY[0x18960F158]();
}

uint64_t sub_1878607EC()
{
  return MEMORY[0x18960F160]();
}

uint64_t sub_1878607F8()
{
  return MEMORY[0x18960F168]();
}

uint64_t sub_187860804()
{
  return MEMORY[0x1896087C8]();
}

uint64_t sub_187860810()
{
  return MEMORY[0x189608838]();
}

uint64_t sub_18786081C()
{
  return MEMORY[0x189608858]();
}

uint64_t sub_187860828()
{
  return MEMORY[0x189608918]();
}

uint64_t sub_187860834()
{
  return MEMORY[0x189608940]();
}

uint64_t sub_187860840()
{
  return MEMORY[0x189608958]();
}

uint64_t sub_18786084C()
{
  return MEMORY[0x189608B28]();
}

uint64_t sub_187860858()
{
  return MEMORY[0x189605878]();
}

uint64_t sub_187860864()
{
  return MEMORY[0x189605880]();
}

uint64_t sub_187860870()
{
  return MEMORY[0x189605890]();
}

uint64_t sub_18786087C()
{
  return MEMORY[0x1896058A8]();
}

uint64_t sub_187860888()
{
  return MEMORY[0x1896058B0]();
}

uint64_t sub_187860894()
{
  return MEMORY[0x1896058C0]();
}

uint64_t sub_1878608A0()
{
  return MEMORY[0x1896058C8]();
}

uint64_t sub_1878608AC()
{
  return MEMORY[0x189605980]();
}

uint64_t sub_1878608B8()
{
  return MEMORY[0x189605988]();
}

uint64_t sub_1878608C4()
{
  return MEMORY[0x1896059A0]();
}

uint64_t sub_1878608D0()
{
  return MEMORY[0x1896059A8]();
}

uint64_t sub_1878608DC()
{
  return MEMORY[0x1896059B0]();
}

uint64_t sub_1878608E8()
{
  return MEMORY[0x18960F178]();
}

uint64_t sub_1878608F4()
{
  return MEMORY[0x1896059D0]();
}

uint64_t sub_187860900()
{
  return MEMORY[0x189605AD0]();
}

uint64_t sub_18786090C()
{
  return MEMORY[0x189605AE0]();
}

uint64_t sub_187860918()
{
  return MEMORY[0x189605AE8]();
}

uint64_t sub_187860924()
{
  return MEMORY[0x189605B00]();
}

uint64_t sub_187860930()
{
  return MEMORY[0x189605B08]();
}

uint64_t sub_18786093C()
{
  return MEMORY[0x189605B20]();
}

uint64_t sub_187860948()
{
  return MEMORY[0x189605B30]();
}

uint64_t sub_187860954()
{
  return MEMORY[0x189605B40]();
}

uint64_t sub_187860960()
{
  return MEMORY[0x189605B48]();
}

uint64_t sub_18786096C()
{
  return MEMORY[0x189605B58]();
}

uint64_t sub_187860978()
{
  return MEMORY[0x189605B68]();
}

uint64_t sub_187860984()
{
  return MEMORY[0x189605B80]();
}

uint64_t sub_187860990()
{
  return MEMORY[0x189605B88]();
}

uint64_t sub_18786099C()
{
  return MEMORY[0x189605B98]();
}

uint64_t sub_1878609A8()
{
  return MEMORY[0x189605BB0]();
}

uint64_t sub_1878609B4()
{
  return MEMORY[0x189605BD0]();
}

uint64_t sub_1878609C0()
{
  return MEMORY[0x189605C08]();
}

uint64_t sub_1878609CC()
{
  return MEMORY[0x189605C20]();
}

uint64_t sub_1878609D8()
{
  return MEMORY[0x189605C58]();
}

uint64_t sub_1878609E4()
{
  return MEMORY[0x189605C68]();
}

uint64_t sub_1878609F0()
{
  return MEMORY[0x189605CA8]();
}

uint64_t sub_1878609FC()
{
  return MEMORY[0x189605CC8]();
}

uint64_t sub_187860A08()
{
  return MEMORY[0x189605CD8]();
}

uint64_t sub_187860A14()
{
  return MEMORY[0x189605CE0]();
}

uint64_t sub_187860A20()
{
  return MEMORY[0x189605CE8]();
}

uint64_t sub_187860A2C()
{
  return MEMORY[0x189605D80]();
}

uint64_t sub_187860A38()
{
  return MEMORY[0x189605D90]();
}

uint64_t sub_187860A44()
{
  return MEMORY[0x189605DA0]();
}

uint64_t sub_187860A50()
{
  return MEMORY[0x189605DA8]();
}

uint64_t sub_187860A5C()
{
  return MEMORY[0x189605DB0]();
}

uint64_t sub_187860A68()
{
  return MEMORY[0x189605E30]();
}

uint64_t sub_187860A74()
{
  return MEMORY[0x189605E40]();
}

uint64_t sub_187860A80()
{
  return MEMORY[0x189605E50]();
}

uint64_t sub_187860A8C()
{
  return MEMORY[0x189605E58]();
}

uint64_t sub_187860A98()
{
  return MEMORY[0x189605E60]();
}

uint64_t sub_187860AA4()
{
  return MEMORY[0x189605E70]();
}

uint64_t sub_187860AB0()
{
  return MEMORY[0x189605E80]();
}

uint64_t sub_187860ABC()
{
  return MEMORY[0x189605E88]();
}

uint64_t sub_187860AC8()
{
  return MEMORY[0x189605E98]();
}

uint64_t sub_187860AD4()
{
  return MEMORY[0x189605EA0]();
}

uint64_t sub_187860AE0()
{
  return MEMORY[0x189605EA8]();
}

uint64_t sub_187860AEC()
{
  return MEMORY[0x189605EB0]();
}

uint64_t sub_187860AF8()
{
  return MEMORY[0x189605EB8]();
}

uint64_t sub_187860B04()
{
  return MEMORY[0x189605EC8]();
}

uint64_t sub_187860B10()
{
  return MEMORY[0x189605ED0]();
}

uint64_t sub_187860B1C()
{
  return MEMORY[0x189605EE0]();
}

uint64_t sub_187860B28()
{
  return MEMORY[0x189605EE8]();
}

uint64_t sub_187860B34()
{
  return MEMORY[0x189605EF0]();
}

uint64_t sub_187860B40()
{
  return MEMORY[0x189605EF8]();
}

uint64_t sub_187860B4C()
{
  return MEMORY[0x189607118]();
}

uint64_t sub_187860B58()
{
  return MEMORY[0x189607160]();
}

uint64_t sub_187860B64()
{
  return MEMORY[0x189607178]();
}

uint64_t sub_187860B70()
{
  return MEMORY[0x1896071D0]();
}

uint64_t sub_187860B7C()
{
  return MEMORY[0x1896071E0]();
}

uint64_t sub_187860B88()
{
  return MEMORY[0x189618AC0]();
}

uint64_t sub_187860B94()
{
  return MEMORY[0x189619300]();
}

uint64_t sub_187860BA0()
{
  return MEMORY[0x1896194A0]();
}

uint64_t sub_187860BAC()
{
  return MEMORY[0x1896194C0]();
}

uint64_t sub_187860BB8()
{
  return MEMORY[0x1896194D8]();
}

uint64_t sub_187860BC4()
{
  return MEMORY[0x1896194F8]();
}

uint64_t sub_187860BD0()
{
  return MEMORY[0x189619500]();
}

uint64_t sub_187860BDC()
{
  return MEMORY[0x189619930]();
}

uint64_t sub_187860BE8()
{
  return MEMORY[0x18961A3C0]();
}

uint64_t sub_187860BF4()
{
  return MEMORY[0x18961A3C8]();
}

uint64_t sub_187860C00()
{
  return MEMORY[0x18961A3D0]();
}

uint64_t sub_187860C0C()
{
  return MEMORY[0x18961A3D8]();
}

uint64_t sub_187860C18()
{
  return MEMORY[0x18961A680]();
}

uint64_t sub_187860C24()
{
  return MEMORY[0x18961A690]();
}

uint64_t sub_187860C30()
{
  return MEMORY[0x18961A6C0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x18960DAA0]();
}

CCCryptorStatus CCCrypt( CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1895F8090]( *(void *)&op,  *(void *)&alg,  *(void *)&options,  key,  keyLength,  iv,  dataIn,  dataInLength);
}

CCCryptorStatus CCCryptorCreate( CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1895F80B0](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x1895F8120](cryptorRef);
}

CCCryptorStatus CCCryptorReset(CCCryptorRef cryptorRef, const void *iv)
{
  return MEMORY[0x1895F8128](cryptorRef, iv);
}

CCCryptorStatus CCCryptorUpdate( CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1895F8130](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

uint64_t CCDeriveKey()
{
  return MEMORY[0x1895F8138]();
}

uint64_t CCHKDFExpand()
{
  return MEMORY[0x1895F8198]();
}

void CCHmac( CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

uint64_t CCHmacClone()
{
  return MEMORY[0x1895F81B0]();
}

uint64_t CCHmacCreate()
{
  return MEMORY[0x1895F81B8]();
}

uint64_t CCHmacDestroy()
{
  return MEMORY[0x1895F81C0]();
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
}

uint64_t CCHmacOutputSizeFromRef()
{
  return MEMORY[0x1895F81D8]();
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
}

uint64_t CCKDFParametersCreateHkdf()
{
  return MEMORY[0x1895F81E8]();
}

uint64_t CCKDFParametersDestroy()
{
  return MEMORY[0x1895F81F0]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1895F8290](data, *(void *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1895F8298](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1895F82A0](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82A8](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1895F82D0](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1896025D8](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602630](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x189602638](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x189602640](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x189602658](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602678](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602690]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1896027D0](BOOLean);
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x189602830]();
}

CFURLRef CFBundleCopyResourceURL( CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x189602850](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1896028A0](allocator, bundleURL);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x189602908](bundle, key);
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x189602950](allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  uint64_t v3 = va_arg(va, void);
  return MEMORY[0x189602958](calendar, v3, at);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x189602A10](cf);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x189602A60](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x189602A68](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x189602A78](allocator, capacity, theData);
}

CFRange CFDataFind( CFDataRef theData, CFDataRef dataToFind, CFRange searchRange, CFDataSearchFlags compareOptions)
{
  CFIndex v4 = MEMORY[0x189602A90](theData, dataToFind, searchRange.location, searchRange.length, compareOptions);
  result.length = v5;
  result.location = v4;
  return result;
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x189602AC0](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x189602AC8]();
}

void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const UInt8 *newBytes, CFIndex newLength)
{
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x189602AE8](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x189602AF0](allocator, at);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x189602B90](theDict, key);
}

CFDictionaryRef CFDictionaryCreate( CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x189602BA8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x189602BB0](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy( CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BC8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x189602BD0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
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

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x189602D18](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x189602D50](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue( CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x189602F88](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x189603138]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x189603140]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings( CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x189603400](alloc, theString, separatorString);
}

CFStringRef CFStringCreateByCombiningStrings( CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x189603410](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x189603418](alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation( CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x189603420](alloc, theString, *(void *)&encoding, lossByte);
}

CFStringRef CFStringCreateFromExternalRepresentation( CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603428](alloc, data, *(void *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x189603430](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x189603438](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes( CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x189603450](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x189603490](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x189603500](theString, *(void *)&encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x189603540](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x189603558](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1896035A0](theString, prefix);
}

CFURLRef CFURLCreateFromFileSystemRepresentation( CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x189603780](allocator, buffer, bufLen, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation( CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x189603818](url, resolveAgainstBase, buffer, maxBufLen);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x189603870](alloc);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x189603880](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x189603888](alloc, uuid);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x1896038B0](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1896038C8](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate( CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1896038D0](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource( CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1896038D8](allocator, userNotification, callout, order);
}

CFStringRef CFUserNotificationGetResponseValue( CFUserNotificationRef userNotification, CFStringRef key, CFIndex idx)
{
  return (CFStringRef)MEMORY[0x1896038F8](userNotification, key, idx);
}

uint64_t CNNetworkCreateWithSSIDAndBSSID()
{
  return MEMORY[0x18960D5B8]();
}

uint64_t CNNetworkGetBSSID()
{
  return MEMORY[0x18960D5C0]();
}

uint64_t CNNetworkGetSSIDString()
{
  return MEMORY[0x18960D5C8]();
}

uint64_t CNNetworkGetSignalStrength()
{
  return MEMORY[0x18960D5D0]();
}

uint64_t CNNetworkIsChosenPlugin()
{
  return MEMORY[0x18960D5D8]();
}

uint64_t CNNetworkIsProtected()
{
  return MEMORY[0x18960D5E0]();
}

uint64_t CNNetworkSetCaptive()
{
  return MEMORY[0x18960D5E8]();
}

uint64_t CNNetworkSetConfidence()
{
  return MEMORY[0x18960D5F0]();
}

uint64_t CNNetworkSetPassword()
{
  return MEMORY[0x18960D5F8]();
}

uint64_t CNNetworkWasAutoJoined()
{
  return MEMORY[0x18960D600]();
}

uint64_t CNNetworkWasJustJoined()
{
  return MEMORY[0x18960D608]();
}

uint64_t CNPluginCommandCopyCurrentNetwork()
{
  return MEMORY[0x18960D610]();
}

uint64_t CNPluginCommandCopyNetworkList()
{
  return MEMORY[0x18960D618]();
}

uint64_t CNPluginCommandGetInterfaceName()
{
  return MEMORY[0x18960D620]();
}

uint64_t CNPluginCommandGetType()
{
  return MEMORY[0x18960D628]();
}

uint64_t CNPluginCopySupportedInterfaces()
{
  return MEMORY[0x18960D630]();
}

uint64_t CNPluginLogoffNetwork()
{
  return MEMORY[0x18960D638]();
}

uint64_t CNPluginRegister()
{
  return MEMORY[0x18960D640]();
}

uint64_t CNPluginResponseCreate()
{
  return MEMORY[0x18960D648]();
}

uint64_t CNPluginResponseDeliver()
{
  return MEMORY[0x18960D650]();
}

uint64_t CNPluginResponseSetNetwork()
{
  return MEMORY[0x18960D658]();
}

uint64_t CNPluginResponseSetNetworkList()
{
  return MEMORY[0x18960D660]();
}

uint64_t EAPClientModuleAddBuiltinModule()
{
  return MEMORY[0x18960F2F0]();
}

uint64_t EAPClientModuleLookup()
{
  return MEMORY[0x18960F2F8]();
}

uint64_t EAPClientModulePluginFree()
{
  return MEMORY[0x18960F300]();
}

uint64_t EAPClientModulePluginFreePacket()
{
  return MEMORY[0x18960F308]();
}

uint64_t EAPClientModulePluginInit()
{
  return MEMORY[0x18960F310]();
}

uint64_t EAPClientModulePluginMasterSessionKeyCopyBytes()
{
  return MEMORY[0x18960F318]();
}

uint64_t EAPClientModulePluginProcess()
{
  return MEMORY[0x18960F320]();
}

uint64_t EAPPacketIsValid()
{
  return MEMORY[0x18960F328]();
}

uint64_t IOPMGetLastWakeTime()
{
  return MEMORY[0x1896083E0]();
}

uint64_t NEFlowAsyncDatagramsCopyNext()
{
  return MEMORY[0x189616160]();
}

uint64_t NEFlowAsyncRead()
{
  return MEMORY[0x189616168]();
}

uint64_t NEFlowCopyError()
{
  return MEMORY[0x189616170]();
}

uint64_t NEFlowCopyProperty()
{
  return MEMORY[0x189616178]();
}

uint64_t NEFlowDirectorCreate()
{
  return MEMORY[0x189616180]();
}

uint64_t NEFlowDirectorDestroy()
{
  return MEMORY[0x189616190]();
}

uint64_t NEFlowDirectorFetchFlowStates()
{
  return MEMORY[0x189616198]();
}

uint64_t NEFlowDirectorGetMaxSendSize()
{
  return MEMORY[0x1896161A0]();
}

uint64_t NEFlowDirectorHandleMatchRulesResult()
{
  return MEMORY[0x1896161A8]();
}

uint64_t NEFlowDirectorHandleNewControlSocket()
{
  return MEMORY[0x1896161B0]();
}

uint64_t NEFlowDirectorSetDelegateInterface()
{
  return MEMORY[0x1896161B8]();
}

uint64_t NEFlowDirectorSetMatchRulesCallback()
{
  return MEMORY[0x1896161C0]();
}

uint64_t NEFlowDirectorSetMaxSendSize()
{
  return MEMORY[0x1896161C8]();
}

uint64_t NEFlowDirectorSetNewFlowCallback()
{
  return MEMORY[0x1896161D0]();
}

uint64_t NEFlowDirectorSetOpenControlSocketCallback()
{
  return MEMORY[0x1896161D8]();
}

uint64_t NEFlowDirectorStart()
{
  return MEMORY[0x1896161E0]();
}

uint64_t NEFlowGetFlowType()
{
  return MEMORY[0x1896161E8]();
}

uint64_t NEFlowOpen()
{
  return MEMORY[0x1896161F0]();
}

uint64_t NEFlowReadClose()
{
  return MEMORY[0x1896161F8]();
}

uint64_t NEFlowSetDispatchQueue()
{
  return MEMORY[0x189616200]();
}

uint64_t NEFlowSetEventHandler()
{
  return MEMORY[0x189616208]();
}

uint64_t NEFlowSetProperty()
{
  return MEMORY[0x189616210]();
}

uint64_t NEFlowTLVAdd()
{
  return MEMORY[0x189616218]();
}

uint64_t NEFlowTLVMsgCreate()
{
  return MEMORY[0x189616220]();
}

uint64_t NEFlowWrite()
{
  return MEMORY[0x189616228]();
}

uint64_t NEFlowWriteClose()
{
  return MEMORY[0x189616230]();
}

uint64_t NEHelperCacheCopyAppUUIDMapping()
{
  return MEMORY[0x1895F8470]();
}

uint64_t NEHelperCacheCopyAppUUIDMappingForUIDExtended()
{
  return MEMORY[0x1895F8480]();
}

uint64_t NEHelperCacheCopySigningIdentifierMapping()
{
  return MEMORY[0x1895F8488]();
}

uint64_t NEHelperCopyAggregatePathRules()
{
  return MEMORY[0x1895F8490]();
}

uint64_t NEHelperCopyAppInfo()
{
  return MEMORY[0x1895F8498]();
}

uint64_t NEHelperCopyCurrentNetworkAsync()
{
  return MEMORY[0x1895F84A0]();
}

uint64_t NEHelperGetIKESocket()
{
  return MEMORY[0x1895F84D0]();
}

uint64_t NEHelperGetKernelControlSocket()
{
  return MEMORY[0x1895F84D8]();
}

uint64_t NEHelperGetKernelControlSocketExtended()
{
  return MEMORY[0x1895F84E0]();
}

uint64_t NEHelperGetNECPSessionFD()
{
  return MEMORY[0x1895F84E8]();
}

uint64_t NEHelperGetPFKeySocket()
{
  return MEMORY[0x1895F84F0]();
}

uint64_t NEHelperInterfaceCreate()
{
  return MEMORY[0x1895F84F8]();
}

uint64_t NEHelperInterfaceDestroy()
{
  return MEMORY[0x1895F8500]();
}

uint64_t NEHelperInterfaceRemoveAddress()
{
  return MEMORY[0x1895F8508]();
}

uint64_t NEHelperInterfaceSetAddress()
{
  return MEMORY[0x1895F8510]();
}

uint64_t NEHelperInterfaceSetAddressWithLifetime()
{
  return MEMORY[0x1895F8518]();
}

uint64_t NEHelperInterfaceSetDelegate()
{
  return MEMORY[0x1895F8520]();
}

uint64_t NEHelperInterfaceSetDescription()
{
  return MEMORY[0x1895F8528]();
}

uint64_t NEHelperInterfaceSetMTU()
{
  return MEMORY[0x1895F8530]();
}

uint64_t NEHelperInterfaceSetOption()
{
  return MEMORY[0x1895F8538]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x189607458](aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1896076F0](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

CFErrorRef SCCopyLastError(void)
{
  return (CFErrorRef)MEMORY[0x18960C188]();
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x18960C1C0](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreateWithOptions( CFAllocatorRef allocator, CFStringRef name, CFDictionaryRef storeOptions, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x18960C1D0](allocator, name, storeOptions, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity( CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x18960C1F8](allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreSetMultiple( SCDynamicStoreRef store, CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFArrayRef keysToNotify)
{
  return MEMORY[0x18960C210](store, keysToSet, keysToRemove, keysToNotify);
}

int SCError(void)
{
  return MEMORY[0x18960C220]();
}

const char *__cdecl SCErrorString(int status)
{
  return (const char *)MEMORY[0x18960C228](*(void *)&status);
}

uint64_t SCNetworkConnectionCopyAllUserPreferences()
{
  return MEMORY[0x18960C238]();
}

uint64_t SCNetworkConnectionCopyCurrentUserPreferences()
{
  return MEMORY[0x18960C240]();
}

uint64_t SCNetworkConnectionCreateUserPreferences()
{
  return MEMORY[0x18960C248]();
}

SCNetworkConnectionRef SCNetworkConnectionCreateWithServiceID( CFAllocatorRef allocator, CFStringRef serviceID, SCNetworkConnectionCallBack callout, SCNetworkConnectionContext *context)
{
  return (SCNetworkConnectionRef)MEMORY[0x18960C250](allocator, serviceID, callout, context);
}

SCNetworkInterfaceRef SCNetworkInterfaceCreateWithInterface( SCNetworkInterfaceRef interface, CFStringRef interfaceType)
{
  return (SCNetworkInterfaceRef)MEMORY[0x18960C280](interface, interfaceType);
}

CFDictionaryRef SCNetworkInterfaceGetConfiguration(SCNetworkInterfaceRef interface)
{
  return (CFDictionaryRef)MEMORY[0x18960C290](interface);
}

CFDictionaryRef SCNetworkInterfaceGetExtendedConfiguration( SCNetworkInterfaceRef interface, CFStringRef extendedType)
{
  return (CFDictionaryRef)MEMORY[0x18960C298](interface, extendedType);
}

SCNetworkInterfaceRef SCNetworkInterfaceGetInterface(SCNetworkInterfaceRef interface)
{
  return (SCNetworkInterfaceRef)MEMORY[0x18960C2A8](interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x18960C2B0](interface);
}

Boolean SCNetworkInterfaceSetConfiguration(SCNetworkInterfaceRef interface, CFDictionaryRef config)
{
  return MEMORY[0x18960C2B8](interface, config);
}

Boolean SCNetworkInterfaceSetExtendedConfiguration( SCNetworkInterfaceRef interface, CFStringRef extendedType, CFDictionaryRef config)
{
  return MEMORY[0x18960C2C0](interface, extendedType, config);
}

CFDictionaryRef SCNetworkProtocolGetConfiguration(SCNetworkProtocolRef protocol)
{
  return (CFDictionaryRef)MEMORY[0x18960C2C8](protocol);
}

Boolean SCNetworkProtocolSetConfiguration(SCNetworkProtocolRef protocol, CFDictionaryRef config)
{
  return MEMORY[0x18960C2D0](protocol, config);
}

Boolean SCNetworkProtocolSetEnabled(SCNetworkProtocolRef protocol, Boolean enabled)
{
  return MEMORY[0x18960C2D8](protocol, enabled);
}

uint64_t SCNetworkProxiesCreateProxyAgentData()
{
  return MEMORY[0x18960C2E8]();
}

Boolean SCNetworkServiceAddProtocolType(SCNetworkServiceRef service, CFStringRef protocolType)
{
  return MEMORY[0x18960C338](service, protocolType);
}

SCNetworkServiceRef SCNetworkServiceCopy(SCPreferencesRef prefs, CFStringRef serviceID)
{
  return (SCNetworkServiceRef)MEMORY[0x18960C340](prefs, serviceID);
}

CFArrayRef SCNetworkServiceCopyAll(SCPreferencesRef prefs)
{
  return (CFArrayRef)MEMORY[0x18960C348](prefs);
}

uint64_t SCNetworkServiceCopyExternalID()
{
  return MEMORY[0x18960C350]();
}

SCNetworkProtocolRef SCNetworkServiceCopyProtocol(SCNetworkServiceRef service, CFStringRef protocolType)
{
  return (SCNetworkProtocolRef)MEMORY[0x18960C358](service, protocolType);
}

SCNetworkServiceRef SCNetworkServiceCreate(SCPreferencesRef prefs, SCNetworkInterfaceRef interface)
{
  return (SCNetworkServiceRef)MEMORY[0x18960C360](prefs, interface);
}

Boolean SCNetworkServiceEstablishDefaultConfiguration(SCNetworkServiceRef service)
{
  return MEMORY[0x18960C368](service);
}

Boolean SCNetworkServiceGetEnabled(SCNetworkServiceRef service)
{
  return MEMORY[0x18960C370](service);
}

SCNetworkInterfaceRef SCNetworkServiceGetInterface(SCNetworkServiceRef service)
{
  return (SCNetworkInterfaceRef)MEMORY[0x18960C378](service);
}

CFStringRef SCNetworkServiceGetName(SCNetworkServiceRef service)
{
  return (CFStringRef)MEMORY[0x18960C380](service);
}

CFStringRef SCNetworkServiceGetServiceID(SCNetworkServiceRef service)
{
  return (CFStringRef)MEMORY[0x18960C388](service);
}

CFTypeID SCNetworkServiceGetTypeID(void)
{
  return MEMORY[0x18960C390]();
}

Boolean SCNetworkServiceRemove(SCNetworkServiceRef service)
{
  return MEMORY[0x18960C398](service);
}

Boolean SCNetworkServiceSetEnabled(SCNetworkServiceRef service, Boolean enabled)
{
  return MEMORY[0x18960C3A0](service, enabled);
}

Boolean SCNetworkServiceSetName(SCNetworkServiceRef service, CFStringRef name)
{
  return MEMORY[0x18960C3A8](service, name);
}

uint64_t SCNetworkServiceSetPrimaryRank()
{
  return MEMORY[0x18960C3B0]();
}

Boolean SCNetworkSetAddService(SCNetworkSetRef set, SCNetworkServiceRef service)
{
  return MEMORY[0x18960C3B8](set, service);
}

SCNetworkSetRef SCNetworkSetCopyCurrent(SCPreferencesRef prefs)
{
  return (SCNetworkSetRef)MEMORY[0x18960C3C0](prefs);
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x18960C3E8](prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x18960C3F0](prefs);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x18960C3F8](allocator, name, prefsID);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization( CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return (SCPreferencesRef)MEMORY[0x18960C400](allocator, name, prefsID, authorization);
}

CFDataRef SCPreferencesGetSignature(SCPreferencesRef prefs)
{
  return (CFDataRef)MEMORY[0x18960C408](prefs);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x18960C410](prefs, key);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return MEMORY[0x18960C418](prefs, wait);
}

Boolean SCPreferencesUnlock(SCPreferencesRef prefs)
{
  return MEMORY[0x18960C450](prefs);
}

uint64_t SCUserPreferencesCopyInterfaceTypeConfiguration()
{
  return MEMORY[0x18960C460]();
}

uint64_t SCUserPreferencesCopyName()
{
  return MEMORY[0x18960C468]();
}

uint64_t SCUserPreferencesCopyStartOptions()
{
  return MEMORY[0x18960C470]();
}

uint64_t SCUserPreferencesGetUniqueID()
{
  return MEMORY[0x18960C478]();
}

uint64_t SCUserPreferencesIsForced()
{
  return MEMORY[0x18960C480]();
}

uint64_t SCUserPreferencesRemove()
{
  return MEMORY[0x18960C488]();
}

uint64_t SCUserPreferencesSetCurrent()
{
  return MEMORY[0x18960C490]();
}

uint64_t SCUserPreferencesSetInterfaceTypeConfiguration()
{
  return MEMORY[0x18960C498]();
}

uint64_t SCUserPreferencesSetName()
{
  return MEMORY[0x18960C4A0]();
}

uint64_t SecCFAllocatorZeroize()
{
  return MEMORY[0x18960B218]();
}

uint64_t SecCertificateCopyCommonNames()
{
  return MEMORY[0x18960B250]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x18960B260](certificate);
}

uint64_t SecCertificateCopySHA256Digest()
{
  return MEMORY[0x18960B2B8]();
}

uint64_t SecCertificateCopySubjectPublicKeyInfoSHA1Digest()
{
  return MEMORY[0x18960B2C8]();
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x18960B2D0](certificate);
}

uint64_t SecCertificateCopySummaryProperties()
{
  return MEMORY[0x18960B2D8]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x18960B2E8](allocator, data);
}

CFTypeID SecCertificateGetTypeID(void)
{
  return MEMORY[0x18960B320]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x18960B338]();
}

uint64_t SecCertificateNotValidBefore()
{
  return MEMORY[0x18960B340]();
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x18960B370](*(void *)&status, reserved);
}

uint64_t SecDHComputeKey()
{
  return MEMORY[0x18960B380]();
}

uint64_t SecDHCreate()
{
  return MEMORY[0x18960B388]();
}

uint64_t SecDHDestroy()
{
  return MEMORY[0x18960B398]();
}

uint64_t SecDHGenerateKeypair()
{
  return MEMORY[0x18960B3A0]();
}

uint64_t SecDHGetMaxKeyLength()
{
  return MEMORY[0x18960B3A8]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x18960B3D8](identityRef, certificateRef);
}

OSStatus SecIdentityCopyPrivateKey(SecIdentityRef identityRef, SecKeyRef *privateKeyRef)
{
  return MEMORY[0x18960B3E0](identityRef, privateKeyRef);
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x18960B3E8]();
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x18960B3F0]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x18960B3F8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x18960B400](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x18960B408](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x18960B418](query, attributesToUpdate);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x18960B430](key, error);
}

uint64_t SecKeyCopyPublicKeyHash()
{
  return MEMORY[0x18960B460]();
}

CFDataRef SecKeyCreateSignature( SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x18960B4C0](key, algorithm, dataToSign, error);
}

size_t SecKeyGetBlockSize(SecKeyRef key)
{
  return MEMORY[0x18960B4E8](key);
}

CFTypeID SecKeyGetTypeID(void)
{
  return MEMORY[0x18960B4F0]();
}

Boolean SecKeyVerifySignature( SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x18960B510](key, algorithm, signedData, signature, error);
}

OSStatus SecPKCS12Import(CFDataRef pkcs12_data, CFDictionaryRef options, CFArrayRef *items)
{
  return MEMORY[0x18960B518](pkcs12_data, options, items);
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x18960B570]();
}

SecPolicyRef SecPolicyCreateRevocation(CFOptionFlags revocationFlags)
{
  return (SecPolicyRef)MEMORY[0x18960B580](revocationFlags);
}

SecPolicyRef SecPolicyCreateWithProperties(CFTypeRef policyIdentifier, CFDictionaryRef properties)
{
  return (SecPolicyRef)MEMORY[0x18960B598](policyIdentifier, properties);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x18960B630](task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x18960B640](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x18960B658](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x18960B668](allocator, token);
}

SecKeyRef SecTrustCopyKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x18960B690](trust);
}

CFArrayRef SecTrustCopyProperties(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x18960B6A0](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x18960B6B8](certificates, policies, trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x18960B6C8](trust, result);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return (SecCertificateRef)MEMORY[0x18960B6E8](trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x18960B6F0](trust);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x18960B710](trust, anchorCertificates);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x189604550]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x189604568]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x189604828]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x189604838]();
}

uint64_t _SCNetworkServiceCopyActive()
{
  return MEMORY[0x18960C4B8]();
}

uint64_t _SCNetworkServiceIsVPN()
{
  return MEMORY[0x18960C4C0]();
}

uint64_t _SCNetworkServiceSetServiceID()
{
  return MEMORY[0x18960C4C8]();
}

uint64_t _SCPreferencesSystemKeychainPasswordItemCopy()
{
  return MEMORY[0x18960C4D0]();
}

uint64_t _SCPreferencesSystemKeychainPasswordItemRemove()
{
  return MEMORY[0x18960C4D8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895F8918](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x1895F8940]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

uint64_t __strncpy_chk()
{
  return MEMORY[0x1895F8A18]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x18961B058]();
}

void abort(void)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x1895F94C0]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895F9540](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x1895F9750]();
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x1895F9790]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x1895F9798]();
}

uint64_t ccchacha20poly1305_aad()
{
  return MEMORY[0x1895F9808]();
}

uint64_t ccchacha20poly1305_decrypt()
{
  return MEMORY[0x1895F9810]();
}

uint64_t ccchacha20poly1305_encrypt()
{
  return MEMORY[0x1895F9818]();
}

uint64_t ccchacha20poly1305_finalize()
{
  return MEMORY[0x1895F9820]();
}

uint64_t ccchacha20poly1305_info()
{
  return MEMORY[0x1895F9828]();
}

uint64_t ccchacha20poly1305_init()
{
  return MEMORY[0x1895F9830]();
}

uint64_t ccchacha20poly1305_reset()
{
  return MEMORY[0x1895F9838]();
}

uint64_t ccchacha20poly1305_setnonce()
{
  return MEMORY[0x1895F9840]();
}

uint64_t ccchacha20poly1305_verify()
{
  return MEMORY[0x1895F9848]();
}

uint64_t ccgcm_aad()
{
  return MEMORY[0x1895F9D38]();
}

uint64_t ccgcm_context_size()
{
  return MEMORY[0x1895F9D40]();
}

uint64_t ccgcm_finalize()
{
  return MEMORY[0x1895F9D48]();
}

uint64_t ccgcm_inc_iv()
{
  return MEMORY[0x1895F9D58]();
}

uint64_t ccgcm_init()
{
  return MEMORY[0x1895F9D60]();
}

uint64_t ccgcm_init_with_iv()
{
  return MEMORY[0x1895F9D68]();
}

uint64_t ccgcm_reset()
{
  return MEMORY[0x1895F9D78]();
}

uint64_t ccgcm_set_iv()
{
  return MEMORY[0x1895F9D80]();
}

uint64_t ccgcm_update()
{
  return MEMORY[0x1895F9D88]();
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1896164E0](cls);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

uint64_t csr_check()
{
  return MEMORY[0x1895FAAB0]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create( const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1895FABF8](buffer, size, queue, destructor);
}

uint64_t dispatch_data_create_with_transform()
{
  return MEMORY[0x1895FAC20]();
}

void *__cdecl dispatch_get_context(dispatch_object_t object)
{
  return (void *)MEMORY[0x1895FAC30](object);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1895FAC60]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
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

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return MEMORY[0x1895FAE60](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer( dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

uint64_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x1895FAEB0](source);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1895FAF50](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1895FAF58]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x1895FAFA8](*(void *)&a1);
}

uint64_t dyld_get_program_sdk_version()
{
  return MEMORY[0x1895FAFF0]();
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x1895FB4E0](a1, a2, a3, a4);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1895FB5A0](a1);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1895FB610](*(void *)&a1, a2, a3);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1895FB660](a1);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1895FB670](*(void *)&a1);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x1895FB6D8](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x1895FB6E8]();
}

kern_return_t host_info( host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1895FB780](*(void *)&host, *(void *)&flavor, host_info_out, host_info_outCnt);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x1895FB7C8](*(void *)&a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x1895FB7D8](a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1895FB838](*(void *)&a1, a2, a3, *(void *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1895FB840](*(void *)&a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1895FB850](*(void *)&a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FBA80](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1895FBAB0]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1895FBAC0](*(void *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1895FBAD0]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1895FBCE0](ptr);
}

int mbr_uid_to_uuid(uid_t uid, uuid_t uu)
{
  return MEMORY[0x1895FBDA8](*(void *)&uid, uu);
}

int mbr_uuid_to_id(const uuid_t uu, id_t *uid_or_gid, int *id_type)
{
  return MEMORY[0x1895FBDB0](uu, uid_or_gid, id_type);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1895FBE68](__s, __smax, *(void *)&__c, __n);
}

uint64_t ne_copy_signing_identifier_for_pid_with_audit_token()
{
  return MEMORY[0x189616258]();
}

uint64_t ne_filter_copy_connection()
{
  return MEMORY[0x189616260]();
}

uint64_t ne_filter_crypto_generate_client_key()
{
  return MEMORY[0x189616268]();
}

uint64_t ne_filter_crypto_init_master()
{
  return MEMORY[0x189616270]();
}

uint64_t ne_filter_crypto_validate_data()
{
  return MEMORY[0x189616278]();
}

uint64_t ne_filter_get_definition()
{
  return MEMORY[0x189616280]();
}

uint64_t ne_filter_request_connection()
{
  return MEMORY[0x189616290]();
}

uint64_t ne_filter_send_message()
{
  return MEMORY[0x189616298]();
}

uint64_t ne_filter_sign_data()
{
  return MEMORY[0x1896162A0]();
}

uint64_t ne_get_configuration_generation()
{
  return MEMORY[0x1896162A8]();
}

uint64_t ne_log_large_obj()
{
  return MEMORY[0x1895FBFB8]();
}

uint64_t ne_log_obj()
{
  return MEMORY[0x1895FBFC0]();
}

uint64_t ne_session_address_matches_subnets()
{
  return MEMORY[0x1896162B0]();
}

uint64_t ne_session_cancel()
{
  return MEMORY[0x1896162B8]();
}

uint64_t ne_session_create()
{
  return MEMORY[0x1896162C0]();
}

uint64_t ne_session_disable_restrictions()
{
  return MEMORY[0x1896162C8]();
}

uint64_t ne_session_establish_ipc()
{
  return MEMORY[0x1896162D0]();
}

uint64_t ne_session_get_configuration_id()
{
  return MEMORY[0x1896162D8]();
}

uint64_t ne_session_get_info()
{
  return MEMORY[0x1896162E0]();
}

uint64_t ne_session_get_info2()
{
  return MEMORY[0x1896162E8]();
}

uint64_t ne_session_get_status()
{
  return MEMORY[0x1896162F0]();
}

uint64_t ne_session_release()
{
  return MEMORY[0x1896162F8]();
}

uint64_t ne_session_set_event_handler()
{
  return MEMORY[0x189616300]();
}

uint64_t ne_session_start()
{
  return MEMORY[0x189616308]();
}

uint64_t ne_session_start_with_options()
{
  return MEMORY[0x189616310]();
}

uint64_t ne_session_status_to_string()
{
  return MEMORY[0x189616318]();
}

uint64_t ne_session_stop()
{
  return MEMORY[0x189616320]();
}

uint64_t ne_session_stop_reason_to_string()
{
  return MEMORY[0x189616328]();
}

uint64_t ne_session_type_to_string()
{
  return MEMORY[0x189616330]();
}

uint64_t necp_session_action()
{
  return MEMORY[0x1895FC130]();
}

uint64_t necp_session_open()
{
  return MEMORY[0x1895FC138]();
}

uint64_t nelog_is_debug_logging_enabled()
{
  return MEMORY[0x1895FC140]();
}

uint64_t nelog_is_extra_vpn_logging_enabled()
{
  return MEMORY[0x1895FC148]();
}

uint64_t nelog_is_info_logging_enabled()
{
  return MEMORY[0x1895FC150]();
}

uint64_t network_config_cellular_blocked_observer_cancel()
{
  return MEMORY[0x189608F50]();
}

uint64_t network_config_cellular_blocked_observer_create()
{
  return MEMORY[0x189608F58]();
}

uint64_t network_config_cellular_failed_observer_create()
{
  return MEMORY[0x189608F60]();
}

uint64_t network_config_wifi_blocked_observer_create()
{
  return MEMORY[0x189608FA8]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1895FC188](*(void *)&token);
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

uint32_t notify_register_dispatch( const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1895FC1C0](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1895FC1E8](*(void *)&token, state64);
}

uint64_t nw_array_append()
{
  return MEMORY[0x189609060]();
}

uint64_t nw_array_create()
{
  return MEMORY[0x189609070]();
}

uint64_t nw_channel_close()
{
  return MEMORY[0x1896090D0]();
}

uint64_t nw_channel_create_with_nexus()
{
  return MEMORY[0x1896090E8]();
}

uint64_t nw_channel_get_key()
{
  return MEMORY[0x1896090F0]();
}

uint64_t nw_channel_get_nexus_instance()
{
  return MEMORY[0x1896090F8]();
}

uint64_t nw_channel_get_protocol_handler()
{
  return MEMORY[0x189609100]();
}

void nw_connection_cancel(nw_connection_t connection)
{
}

uint64_t nw_connection_copy_connected_path()
{
  return MEMORY[0x189609150]();
}

nw_path_t nw_connection_copy_current_path(nw_connection_t connection)
{
  return (nw_path_t)MEMORY[0x189609160](connection);
}

nw_endpoint_t nw_connection_copy_endpoint(nw_connection_t connection)
{
  return (nw_endpoint_t)MEMORY[0x189609168](connection);
}

nw_parameters_t nw_connection_copy_parameters(nw_connection_t connection)
{
  return (nw_parameters_t)MEMORY[0x189609188](connection);
}

nw_protocol_metadata_t nw_connection_copy_protocol_metadata( nw_connection_t connection, nw_protocol_definition_t definition)
{
  return (nw_protocol_metadata_t)MEMORY[0x189609190](connection, definition);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x1896091B0](endpoint, parameters);
}

uint64_t nw_connection_create_with_connected_socket_and_parameters()
{
  return MEMORY[0x1896091C0]();
}

uint64_t nw_connection_get_connected_socket()
{
  return MEMORY[0x1896091F8]();
}

void nw_connection_receive_message(nw_connection_t connection, nw_connection_receive_completion_t completion)
{
}

void nw_connection_send( nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
}

uint64_t nw_connection_set_event_handler()
{
  return MEMORY[0x189609300]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

void nw_connection_start(nw_connection_t connection)
{
}

uint64_t nw_connection_state_to_string()
{
  return MEMORY[0x189609350]();
}

uint64_t nw_context_copy_implicit_context()
{
  return MEMORY[0x189609418]();
}

uint64_t nw_context_get_globals_for_protocol()
{
  return MEMORY[0x189609438]();
}

nw_endpoint_t nw_endpoint_create_address(const sockaddr *address)
{
  return (nw_endpoint_t)MEMORY[0x189609510](address);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x189609520](hostname, port);
}

uint64_t nw_endpoint_create_host_with_numeric_port()
{
  return MEMORY[0x189609528]();
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x189609538](endpoint);
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x189609558](endpoint);
}

uint16_t nw_endpoint_get_port(nw_endpoint_t endpoint)
{
  return MEMORY[0x189609570](endpoint);
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x189609580](endpoint);
}

int nw_error_get_error_code(nw_error_t error)
{
  return MEMORY[0x1896095A8](error);
}

nw_error_domain_t nw_error_get_error_domain(nw_error_t error)
{
  return MEMORY[0x1896095B0](error);
}

uint64_t nw_frame_array_append()
{
  return MEMORY[0x189609610]();
}

uint64_t nw_frame_array_first()
{
  return MEMORY[0x189609620]();
}

uint64_t nw_frame_array_foreach()
{
  return MEMORY[0x189609630]();
}

uint64_t nw_frame_array_init()
{
  return MEMORY[0x189609638]();
}

uint64_t nw_frame_array_is_empty()
{
  return MEMORY[0x189609650]();
}

uint64_t nw_frame_array_next()
{
  return MEMORY[0x189609668]();
}

uint64_t nw_frame_array_remove()
{
  return MEMORY[0x189609680]();
}

uint64_t nw_frame_array_unclaimed_length()
{
  return MEMORY[0x189609688]();
}

uint64_t nw_frame_claim()
{
  return MEMORY[0x1896096A8]();
}

uint64_t nw_frame_create()
{
  return MEMORY[0x1896096C0]();
}

uint64_t nw_frame_finalize()
{
  return MEMORY[0x1896096D0]();
}

uint64_t nw_frame_get_buffer()
{
  return MEMORY[0x1896096E0]();
}

uint64_t nw_frame_reset()
{
  return MEMORY[0x189609710]();
}

uint64_t nw_frame_unclaim()
{
  return MEMORY[0x189609748]();
}

uint64_t nw_frame_unclaimed_bytes()
{
  return MEMORY[0x189609750]();
}

uint64_t nw_frame_unclaimed_length()
{
  return MEMORY[0x189609760]();
}

nw_protocol_definition_t nw_framer_create_definition( const char *identifier, uint32_t flags, nw_framer_start_handler_t start_handler)
{
  return (nw_protocol_definition_t)MEMORY[0x189609788](identifier, *(void *)&flags, start_handler);
}

nw_protocol_options_t nw_framer_create_options(nw_protocol_definition_t framer_definition)
{
  return (nw_protocol_options_t)MEMORY[0x189609790](framer_definition);
}

BOOL nw_framer_deliver_input_no_copy( nw_framer_t framer, size_t input_length, nw_framer_message_t message, BOOL is_complete)
{
  return MEMORY[0x189609798](framer, input_length, message, is_complete);
}

void nw_framer_mark_failed_with_error(nw_framer_t framer, int error_code)
{
}

nw_framer_message_t nw_framer_message_create(nw_framer_t framer)
{
  return (nw_framer_message_t)MEMORY[0x1896097B0](framer);
}

BOOL nw_framer_parse_input( nw_framer_t framer, size_t minimum_incomplete_length, size_t maximum_length, uint8_t *temp_buffer, nw_framer_parse_completion_t parse)
{
  return MEMORY[0x1896097B8](framer, minimum_incomplete_length, maximum_length, temp_buffer, parse);
}

void nw_framer_set_input_handler(nw_framer_t framer, nw_framer_input_handler_t input_handler)
{
}

void nw_framer_set_output_handler(nw_framer_t framer, nw_framer_output_handler_t output_handler)
{
}

void nw_framer_write_output(nw_framer_t framer, const uint8_t *output_buffer, size_t output_length)
{
}

BOOL nw_framer_write_output_no_copy(nw_framer_t framer, size_t output_length)
{
  return MEMORY[0x1896097E8](framer, output_length);
}

uint64_t nw_interface_create_with_index()
{
  return MEMORY[0x1896097F0]();
}

uint64_t nw_interface_create_with_name()
{
  return MEMORY[0x1896097F8]();
}

uint32_t nw_interface_get_index(nw_interface_t interface)
{
  return MEMORY[0x189609800](interface);
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return (const char *)MEMORY[0x189609818](interface);
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return MEMORY[0x189609828](interface);
}

uint64_t nw_interpose_cancel()
{
  return MEMORY[0x189609848]();
}

uint64_t nw_interpose_client_claim()
{
  return MEMORY[0x189609850]();
}

uint64_t nw_interpose_set_flow_event_handler()
{
  return MEMORY[0x189609858]();
}

uint64_t nw_interpose_start()
{
  return MEMORY[0x189609860]();
}

void nw_ip_options_set_local_address_preference( nw_protocol_options_t options, nw_ip_local_address_preference_t preference)
{
}

void nw_listener_cancel(nw_listener_t listener)
{
}

nw_listener_t nw_listener_create(nw_parameters_t parameters)
{
  return (nw_listener_t)MEMORY[0x1896098B0](parameters);
}

void nw_listener_set_new_connection_handler( nw_listener_t listener, nw_listener_new_connection_handler_t handler)
{
}

void nw_listener_set_queue(nw_listener_t listener, dispatch_queue_t queue)
{
}

void nw_listener_set_state_changed_handler(nw_listener_t listener, nw_listener_state_changed_handler_t handler)
{
}

void nw_listener_start(nw_listener_t listener)
{
}

uint64_t nw_nat64_copy_prefixes()
{
  return MEMORY[0x189609938]();
}

uint64_t nw_nat64_extract_v4()
{
  return MEMORY[0x189609940]();
}

uint64_t nw_nat64_synthesize_v6()
{
  return MEMORY[0x189609948]();
}

uint64_t nw_nexus_bind_client_port()
{
  return MEMORY[0x189609950]();
}

uint64_t nw_nexus_close()
{
  return MEMORY[0x189609958]();
}

uint64_t nw_nexus_close_channel_and_instance()
{
  return MEMORY[0x189609960]();
}

uint64_t nw_nexus_create()
{
  return MEMORY[0x189609968]();
}

uint64_t nw_nexus_create_channel_to_new_instance()
{
  return MEMORY[0x189609970]();
}

uint64_t nw_parameters_copy_context()
{
  return MEMORY[0x189609998]();
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x1896099A0](parameters);
}

uint64_t nw_parameters_copy_local_address()
{
  return MEMORY[0x1896099A8]();
}

uint64_t nw_parameters_create_legacy_tcp_socket()
{
  return MEMORY[0x1896099F0]();
}

nw_parameters_t nw_parameters_create_secure_tcp( nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x189609A08](configure_tls, configure_tcp);
}

nw_parameters_t nw_parameters_create_secure_udp( nw_parameters_configure_protocol_block_t configure_dtls, nw_parameters_configure_protocol_block_t configure_udp)
{
  return (nw_parameters_t)MEMORY[0x189609A18](configure_dtls, configure_udp);
}

uint64_t nw_parameters_get_ip_protocol()
{
  return MEMORY[0x189609A60]();
}

uint64_t nw_parameters_get_tls()
{
  return MEMORY[0x189609AA8]();
}

void nw_parameters_require_interface(nw_parameters_t parameters, nw_interface_t interface)
{
}

uint64_t nw_parameters_set_data_mode()
{
  return MEMORY[0x189609B18]();
}

uint64_t nw_parameters_set_effective_bundle_id()
{
  return MEMORY[0x189609B48]();
}

uint64_t nw_parameters_set_indefinite()
{
  return MEMORY[0x189609B78]();
}

uint64_t nw_parameters_set_local_address()
{
  return MEMORY[0x189609BA0]();
}

void nw_parameters_set_local_endpoint(nw_parameters_t parameters, nw_endpoint_t local_endpoint)
{
}

uint64_t nw_parameters_set_metadata()
{
  return MEMORY[0x189609BB0]();
}

uint64_t nw_parameters_set_required_interface_subtype()
{
  return MEMORY[0x189609C48]();
}

void nw_parameters_set_reuse_local_address(nw_parameters_t parameters, BOOL reuse_local_address)
{
}

uint64_t nw_parameters_set_use_awdl()
{
  return MEMORY[0x189609CB8]();
}

nw_endpoint_t nw_path_copy_effective_local_endpoint(nw_path_t path)
{
  return (nw_endpoint_t)MEMORY[0x189609CF0](path);
}

uint64_t nw_path_copy_interface()
{
  return MEMORY[0x189609D08]();
}

uint64_t nw_path_create_assign_message()
{
  return MEMORY[0x189609D30]();
}

uint64_t nw_path_create_browse_result()
{
  return MEMORY[0x189609D38]();
}

uint64_t nw_path_get_ipv4_network_signature()
{
  return MEMORY[0x189609E28]();
}

uint64_t nw_path_get_ipv6_network_signature()
{
  return MEMORY[0x189609E30]();
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x189609F10](path, *(void *)&interface_type);
}

uint64_t nw_protocol_create()
{
  return MEMORY[0x18960A038]();
}

uint64_t nw_protocol_register()
{
  return MEMORY[0x18960A4C0]();
}

uint64_t nw_protocol_register_extended()
{
  return MEMORY[0x18960A4D0]();
}

uint64_t nw_protocol_set_default_one_to_one_callbacks()
{
  return MEMORY[0x18960A500]();
}

nw_protocol_options_t nw_protocol_stack_copy_internet_protocol(nw_protocol_stack_t stack)
{
  return (nw_protocol_options_t)MEMORY[0x18960A528](stack);
}

uint64_t nw_protocol_stack_includes_protocol()
{
  return MEMORY[0x18960A540]();
}

void nw_protocol_stack_prepend_application_protocol(nw_protocol_stack_t stack, nw_protocol_options_t protocol)
{
}

void nw_protocol_stack_set_transport_protocol(nw_protocol_stack_t stack, nw_protocol_options_t protocol)
{
}

uint64_t nw_protocols_are_equal()
{
  return MEMORY[0x18960A588]();
}

uint64_t nw_proxy_config_copy_agent_data()
{
  return MEMORY[0x18960A590]();
}

uint64_t nw_proxy_config_get_agent_domain()
{
  return MEMORY[0x18960A598]();
}

uint64_t nw_proxy_config_get_agent_type()
{
  return MEMORY[0x18960A5A0]();
}

uint64_t nw_proxy_config_set_identifier()
{
  return MEMORY[0x18960A5A8]();
}

uint64_t nw_proxy_copy_shoes_definition()
{
  return MEMORY[0x18960A5C0]();
}

uint64_t nw_queue_activate_source()
{
  return MEMORY[0x18960A5E0]();
}

uint64_t nw_queue_cancel_source()
{
  return MEMORY[0x18960A5E8]();
}

uint64_t nw_queue_context_async()
{
  return MEMORY[0x18960A5F0]();
}

uint64_t nw_queue_context_async_if_needed()
{
  return MEMORY[0x18960A600]();
}

uint64_t nw_queue_context_create_source()
{
  return MEMORY[0x18960A608]();
}

uint64_t nw_queue_resume_source()
{
  return MEMORY[0x18960A618]();
}

uint64_t nw_queue_suspend_source()
{
  return MEMORY[0x18960A630]();
}

uint64_t nw_resolver_config_add_match_domain()
{
  return MEMORY[0x18960A9A0]();
}

uint64_t nw_resolver_config_add_name_server()
{
  return MEMORY[0x18960A9A8]();
}

uint64_t nw_resolver_config_add_search_domain()
{
  return MEMORY[0x18960A9B0]();
}

uint64_t nw_resolver_config_copy_plist_data()
{
  return MEMORY[0x18960A9B8]();
}

uint64_t nw_resolver_config_create()
{
  return MEMORY[0x18960A9C0]();
}

uint64_t nw_resolver_config_set_class()
{
  return MEMORY[0x18960A9C8]();
}

uint64_t nw_resolver_config_set_identifier()
{
  return MEMORY[0x18960A9D0]();
}

uint64_t nw_resolver_config_set_identity_reference()
{
  return MEMORY[0x18960A9D8]();
}

uint64_t nw_resolver_config_set_protocol()
{
  return MEMORY[0x18960A9E0]();
}

uint64_t nw_resolver_config_set_provider_name()
{
  return MEMORY[0x18960A9E8]();
}

uint64_t nw_resolver_config_set_provider_path()
{
  return MEMORY[0x18960A9F0]();
}

uint64_t nw_resolver_config_set_proxy_agent()
{
  return MEMORY[0x18960A9F8]();
}

uint64_t nw_shoes_metadata_copy_remote_endpoint()
{
  return MEMORY[0x18960AA90]();
}

uint64_t nw_shoes_metadata_enumerate_resolved_endpoints()
{
  return MEMORY[0x18960AA98]();
}

nw_protocol_options_t nw_udp_create_options(void)
{
  return (nw_protocol_options_t)MEMORY[0x18960ABA8]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1896165B8](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1896165F8](exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616718](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

uint64_t os_buflet_get_data_offset()
{
  return MEMORY[0x1895FC2D8]();
}

uint64_t os_buflet_get_object_address()
{
  return MEMORY[0x1895FC2E0]();
}

uint64_t os_channel_advance_slot()
{
  return MEMORY[0x1895FC2F0]();
}

uint64_t os_channel_attr_create()
{
  return MEMORY[0x1895FC2F8]();
}

uint64_t os_channel_attr_destroy()
{
  return MEMORY[0x1895FC300]();
}

uint64_t os_channel_attr_get()
{
  return MEMORY[0x1895FC308]();
}

uint64_t os_channel_attr_set()
{
  return MEMORY[0x1895FC310]();
}

uint64_t os_channel_attr_set_key()
{
  return MEMORY[0x1895FC318]();
}

uint64_t os_channel_available_slot_count()
{
  return MEMORY[0x1895FC320]();
}

uint64_t os_channel_create_extended()
{
  return MEMORY[0x1895FC330]();
}

uint64_t os_channel_destroy()
{
  return MEMORY[0x1895FC338]();
}

uint64_t os_channel_get_fd()
{
  return MEMORY[0x1895FC370]();
}

uint64_t os_channel_get_next_slot()
{
  return MEMORY[0x1895FC388]();
}

uint64_t os_channel_is_defunct()
{
  return MEMORY[0x1895FC398]();
}

uint64_t os_channel_packet_free()
{
  return MEMORY[0x1895FC3B0]();
}

uint64_t os_channel_read_attr()
{
  return MEMORY[0x1895FC3C0]();
}

uint64_t os_channel_rx_ring()
{
  return MEMORY[0x1895FC3D0]();
}

uint64_t os_channel_slot_attach_packet()
{
  return MEMORY[0x1895FC3E0]();
}

uint64_t os_channel_slot_detach_packet()
{
  return MEMORY[0x1895FC3E8]();
}

uint64_t os_channel_slot_get_packet()
{
  return MEMORY[0x1895FC3F0]();
}

uint64_t os_channel_sync()
{
  return MEMORY[0x1895FC3F8]();
}

uint64_t os_channel_tx_ring()
{
  return MEMORY[0x1895FC400]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t os_packet_get_data_length()
{
  return MEMORY[0x1895FC510]();
}

uint64_t os_packet_get_next_buflet()
{
  return MEMORY[0x1895FC528]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1895FC640]();
}

void os_unfair_lock_assert_owner(os_unfair_lock_t lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1895FC6C0]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1895FC6C8]();
}

int proc_listallpids(void *buffer, int buffersize)
{
  return MEMORY[0x1895FC8B0](buffer, *(void *)&buffersize);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1895FC8C8](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1895FC8E0](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1895FC8E8](*(void *)&pid, buffer, *(void *)&buffersize);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC70](__ptr, __size);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x1895FCCA8](*(void *)&a1, a2, a3, *(void *)&a4);
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  return MEMORY[0x1895FCCB8](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t recvmsg_x()
{
  return MEMORY[0x1895FCCC0]();
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x1895FCE30](*(void *)&a1, a2, a3, *(void *)&a4);
}

ssize_t sendmsg(int a1, const msghdr *a2, int a3)
{
  return MEMORY[0x1895FCE38](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t sendmsg_x()
{
  return MEMORY[0x1895FCE40]();
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1895FCEC8](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return MEMORY[0x1895FCF48](*(void *)&a1, a2, a3);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1895FCFA0](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x1895FD088](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FD100](__s1, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

uint64_t swift_allocError()
{
  return MEMORY[0x18961B0A8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x18961B0B0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x18961B0E0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x18961B0E8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x18961B0F0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x18961B0F8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x18961B108]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x18961B118]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x18961BFB8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x18961BFC0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x18961BFC8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x18961BFD0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x18961BFD8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x18961B158]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x18961B160]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x18961B180]();
}

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return MEMORY[0x18961B1B8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x18961B1D8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x18961B1E8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x18961B1F0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x18961B270]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x18961B2A8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x18961B2B8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x18961B2C0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x18961B2D0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x18961B310]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x18961B328]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x18961B390]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x18961B3A0]();
}

uint64_t swift_release()
{
  return MEMORY[0x18961B3C8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x18961B3E0]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x18961B3E8]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x18961C038]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x18961B458]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x18961B468]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x18961B4D0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x18961B518]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1895FD2B0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

kern_return_t task_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *t)
{
  return MEMORY[0x1895FD308](*(void *)&target_tport, *(void *)&pid, t);
}

kern_return_t task_info( task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1895FD320](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}

void uuid_clear(uuid_t uu)
{
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1895FD4B8](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1895FD4E0](uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1895FD7C8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FD7D8](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1895FD808](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1895FD840](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1895FD8C0](xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x1895FD930]();
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1895FD948](name, targetq);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1895FD950](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1895FD978]();
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return MEMORY[0x1895FD990](connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1895FD9A8](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply( xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1895FD9F0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1895FDA98](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1895FDB00](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1895FDB20](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1895FDB30](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1895FDB78](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1895FDBB0](original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBB8](xdict, key);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDBD0](xdict, key);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x1895FDBE0]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBE8](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1895FDC00](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC10](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC20](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1895FDC38](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC50](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1895FDC58](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x1895FDC78]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
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

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x1895FDD70](connection);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

void xpc_release(xpc_object_t object)
{
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1895FE008]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1895FE080](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1895FE0E0](xuint);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x1895FE0F8](uuid);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1895FE110](xuuid);
}

uint64_t objc_msgSend_appendToStringAtColumnWithContent_column_content_appendAsNewLine_addNewLine_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_appendToStringAtColumnWithContent_column_content_appendAsNewLine_addNewLine_);
}

uint64_t objc_msgSend_extension_didRequestSocket_interface_local_remote_effectivePID_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_extension_didRequestSocket_interface_local_remote_effectivePID_completionHandler_);
}

uint64_t objc_msgSend_initAndShowAlertWithHeader_message_alternateMessage_defaultMessage_noBoldDefault_usePrivacyIcon_extensionItem_callbackQueue_callbackHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initAndShowAlertWithHeader_message_alternateMessage_defaultMessage_noBoldDefault_usePrivacyIcon_extensionItem_callbackQueue_callbackHandler_);
}

uint64_t objc_msgSend_initAndShowAuthenticationWithHeader_options_flags_callbackQueue_callbackHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initAndShowAuthenticationWithHeader_options_flags_callbackQueue_callbackHandler_);
}

uint64_t objc_msgSend_initCustomWithAttributeType_attributeName_addressValue_ipv4SubnetMask_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initCustomWithAttributeType_attributeName_addressValue_ipv4SubnetMask_);
}

uint64_t objc_msgSend_initWithDrop_inboundPassOffset_inboundPeekOffset_outboundPassOffset_outboundPeekOffset_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithDrop_inboundPassOffset_inboundPeekOffset_outboundPassOffset_outboundPeekOffset_);
}

uint64_t objc_msgSend_initWithIKEConfig_firstChildConfig_sessionConfig_queue_ipsecInterface_ikeSocketHandler_saSession_packetDelegate_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithIKEConfig_firstChildConfig_sessionConfig_queue_ipsecInterface_ikeSocketHandler_saSession_packetDelegate_);
}

uint64_t objc_msgSend_initWithLevel_name_virtualInterfaceType_delegate_channelCount_netifRingSize_kernelPipeTxRingSize_kernelPipeRxRingSize_execUUID_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithLevel_name_virtualInterfaceType_delegate_channelCount_netifRingSize_kernelPipeTxRingSize_kernelPipeRxRingSize_execUUID_);
}

uint64_t objc_msgSend_initWithName_delegate_enableWithChannelCount_netifRingSize_kernelPipeTxRingSize_kernelPipeRxRingSize_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithName_delegate_enableWithChannelCount_netifRingSize_kernelPipeTxRingSize_kernelPipeRxRingSize_);
}

uint64_t objc_msgSend_initWithNetworkAgentRegistration_sessionType_configurationIdentifier_agentUUID_name_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithNetworkAgentRegistration_sessionType_configurationIdentifier_agentUUID_name_);
}

uint64_t objc_msgSend_initWithPersistentReference_keyReference_isModernSystem_domain_accessGroup_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithPersistentReference_keyReference_isModernSystem_domain_accessGroup_);
}

uint64_t objc_msgSend_initWithRemoteNetworkEndpoint_remotePrefix_localNetworkEndpoint_localPrefix_protocol_direction_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithRemoteNetworkEndpoint_remotePrefix_localNetworkEndpoint_localPrefix_protocol_direction_);
}

uint64_t objc_msgSend_initWithSeed_initiatorID_responderID_salt_context_forInitiator_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithSeed_initiatorID_responderID_salt_context_forInitiator_error_);
}

uint64_t objc_msgSend_requestConfigurationForListener_session_sessionConfig_childConfig_validateAuthBlock_responseBlock_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_requestConfigurationForListener_session_sessionConfig_childConfig_validateAuthBlock_responseBlock_);
}

uint64_t objc_msgSend_requestConfigurationForSession_sessionConfig_childConfig_validateAuthBlock_responseBlock_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_requestConfigurationForSession_sessionConfig_childConfig_validateAuthBlock_responseBlock_);
}

uint64_t objc_msgSend_sendKeepaliveWithRetries_retryIntervalInMilliseconds_callbackQueue_callback_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_sendKeepaliveWithRetries_retryIntervalInMilliseconds_callbackQueue_callback_);
}

uint64_t objc_msgSend_sendMOBIKEWithRetries_retryInterval_interfaceName_invalidateTransport_resetEndpoint_callbackQueue_callback_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_sendMOBIKEWithRetries_retryInterval_interfaceName_invalidateTransport_resetEndpoint_callbackQueue_callback_);
}

uint64_t objc_msgSend_sendPrivateNotifies_maxRetries_retryIntervalInMilliseconds_callbackQueue_callback_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_sendPrivateNotifies_maxRetries_retryIntervalInMilliseconds_callbackQueue_callback_);
}

uint64_t objc_msgSend_showLocalNetworkAlertForApp_pid_uuid_query_hasEntitlement_completionQueue_handler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_showLocalNetworkAlertForApp_pid_uuid_query_hasEntitlement_completionQueue_handler_);
}

uint64_t objc_msgSend_showLocalNetworkAlertForApp_withCompletionQueue_query_hasEntitlement_handler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_showLocalNetworkAlertForApp_withCompletionQueue_query_hasEntitlement_handler_);
}