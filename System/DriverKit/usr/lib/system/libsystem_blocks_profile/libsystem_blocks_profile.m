void _Block_use_RR2(const Block_callbacks_RR *callbacks)
{
  void (__cdecl *release)(const void *);
  release = callbacks->release;
  _Block_retain_object = (uint64_t (*)(const void *))callbacks->retain;
  _Block_release_object = (uint64_t (*)(const void *))release;
  _Block_destructInstance = (uint64_t (*)(const void *))callbacks->destructInstance;
}

uint64_t _call_custom_copy_helper(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(a2 + 8) & 0x2000000) != 0)
  {
    v2 = *(uint64_t (**)(void))(*(void *)(a2 + 24) + 16LL);
    if (v2) {
      return v2();
    }
  }

  return result;
}

uint64_t _call_custom_dispose_helper(uint64_t result)
{
  if ((*(_DWORD *)(result + 8) & 0x2000000) != 0)
  {
    v1 = *(uint64_t (**)(void))(*(void *)(result + 24) + 24LL);
    if (v1) {
      return v1();
    }
  }

  return result;
}

void *__cdecl _Block_copy(const void *aBlock)
{
  if (!aBlock) {
    return 0LL;
  }
  v2 = (unsigned int *)((char *)aBlock + 8);
  if ((*((_DWORD *)aBlock + 2) & 0x1000000) != 0)
  {
    while (1)
    {
      unsigned int v7 = *v2;
      if ((~*v2 & 0xFFFE) == 0) {
        break;
      }
      while (1)
      {
        unsigned int v8 = __ldaxr(v2);
        if (v8 != v7) {
          break;
        }
        if (!__stlxr(v7 + 2, v2)) {
          return (void *)aBlock;
        }
      }

      __clrex();
    }

    return (void *)aBlock;
  }

  if ((*v2 & 0x10000000) != 0) {
    return (void *)aBlock;
  }
  uint64_t v3 = *(void *)(*((void *)aBlock + 3) + 8LL);
  uint64_t v4 = malloc_type_malloc(v3, 911512400LL);
  v5 = (_DWORD *)v4;
  if (v4)
  {
    if (!*((void *)aBlock + 2)) {
      _Block_copy_cold_1();
    }
    _platform_memmove(v4, aBlock, v3);
    v5[2] &= 0xFFFF0000;
    v5[2] |= 0x1000002u;
    if ((*((_DWORD *)aBlock + 2) & 0x2000000) != 0)
    {
      v6 = *(void (**)(_DWORD *, const void *))(*((void *)aBlock + 3) + 16LL);
      if (v6) {
        v6(v5, aBlock);
      }
    }

    *(void *)v5 = _NSConcreteMallocBlock;
  }

  return v5;
}

size_t Block_size(void *aBlock)
{
  return *(void *)(*((void *)aBlock + 3) + 8LL);
}

void _Block_release(const void *aBlock)
{
  if (aBlock)
  {
    v2 = (unsigned int *)((char *)aBlock + 8);
    if ((*((_DWORD *)aBlock + 2) & 0x10000000) == 0 && (*v2 & 0x1000000) != 0)
    {
LABEL_4:
      unsigned int v3 = *v2;
      int v4 = *v2 & 0xFFFE;
      if (v4) {
        BOOL v5 = v4 == 65534;
      }
      else {
        BOOL v5 = 1;
      }
      if (!v5)
      {
        else {
          int v6 = -2;
        }
        unsigned int v7 = v6 + v3;
        do
        {
          unsigned int v8 = __ldaxr(v2);
          if (v8 != v3)
          {
            __clrex();
            goto LABEL_4;
          }
        }

        while (__stlxr(v7, v2));
        if ((unsigned __int16)v3 == 2)
        {
          if ((*v2 & 0x2000000) != 0)
          {
            v9 = *(void (**)(const void *))(*((void *)aBlock + 3) + 24LL);
            if (v9) {
              v9(aBlock);
            }
          }

          _Block_destructInstance(aBlock);
          free((void *)aBlock);
        }
      }
    }
  }
}

BOOL _Block_tryRetain(const void *aBlock)
{
  v1 = (unsigned int *)((char *)aBlock + 8);
  while (1)
  {
    unsigned int v2 = *v1;
    BOOL result = (*v1 & 1) == 0;
    if ((~*v1 & 0xFFFE) == 0 || (*v1 & 1) != 0) {
      break;
    }
    while (1)
    {
      unsigned int v5 = __ldaxr(v1);
      if (v5 != v2) {
        break;
      }
      if (!__stlxr(v2 + 2, v1)) {
        return 1;
      }
    }

    __clrex();
  }

  return result;
}

BOOL _Block_isDeallocating(const void *aBlock)
{
  return *((_DWORD *)aBlock + 2) & 1;
}

BOOL _Block_use_stret(void *aBlock)
{
  return (~*((_DWORD *)aBlock + 2) & 0x60000000) == 0;
}

BOOL _Block_has_signature(void *aBlock)
{
  if ((*((_DWORD *)aBlock + 2) & 0x40000000) == 0) {
    return 0;
  }
  uint64_t v2 = 32LL;
  if ((*((_DWORD *)aBlock + 2) & 0x2000000) == 0) {
    uint64_t v2 = 16LL;
  }
  return *(void *)(*((void *)aBlock + 3) + v2) != 0LL;
}

const char *__cdecl _Block_signature(void *aBlock)
{
  if ((*((_DWORD *)aBlock + 2) & 0x40000000) == 0) {
    return 0LL;
  }
  uint64_t v2 = 32LL;
  if ((*((_DWORD *)aBlock + 2) & 0x2000000) == 0) {
    uint64_t v2 = 16LL;
  }
  return *(const char **)(*((void *)aBlock + 3) + v2);
}

const char *__cdecl _Block_layout(void *aBlock)
{
  if ((*((_DWORD *)aBlock + 2) & 0x80000000) != 0 || (*((_DWORD *)aBlock + 2) & 0x40000000) == 0) {
    return 0LL;
  }
  uint64_t v2 = 32LL;
  if ((*((_DWORD *)aBlock + 2) & 0x2000000) == 0) {
    uint64_t v2 = 16LL;
  }
  return *(const char **)(*((void *)aBlock + 3) + v2 + 8);
}

const char *__cdecl _Block_extended_layout(void *aBlock)
{
  if ((*((_DWORD *)aBlock + 2) & 0x80000000) == 0 || (*((_DWORD *)aBlock + 2) & 0x40000000) == 0) {
    return 0LL;
  }
  uint64_t v2 = 32LL;
  if ((*((_DWORD *)aBlock + 2) & 0x2000000) == 0) {
    uint64_t v2 = 16LL;
  }
  if (*(void *)(*((void *)aBlock + 3) + v2 + 8)) {
    return *(const char **)(*((void *)aBlock + 3) + v2 + 8);
  }
  else {
    return "";
  }
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  unsigned int v3 = (char *)a2;
  unsigned int v5 = a3 & 0x9F;
  if (v5 > 0x17)
  {
    if (v5 - 131 > 0x14 || ((1 << (v5 + 125)) & 0x110011) == 0)
    {
      if (v5 != 24) {
        return;
      }
      goto LABEL_12;
    }

LABEL_27:
    *(void *)a1 = v3;
    return;
  }

  switch(v5)
  {
    case 3u:
      _Block_retain_object(a2);
      goto LABEL_27;
    case 7u:
      unsigned int v3 = (char *)_Block_copy(a2);
      goto LABEL_27;
    case 8u:
LABEL_12:
      uint64_t v7 = *((void *)a2 + 1);
      int v9 = *(_DWORD *)(v7 + 16);
      unsigned int v8 = (unsigned int *)(v7 + 16);
      if ((v9 & 0xFFFE) != 0)
      {
        if ((*v8 & 0x1000000) != 0)
        {
          while (1)
          {
            unsigned int v10 = *v8;
            if ((~*v8 & 0xFFFE) == 0) {
              break;
            }
            while (1)
            {
              unsigned int v11 = __ldaxr(v8);
              if (v11 != v10) {
                break;
              }
              if (!__stlxr(v10 + 2, v8)) {
                goto LABEL_26;
              }
            }

            __clrex();
          }
        }
      }

      else
      {
        uint64_t v12 = malloc_type_malloc(*((unsigned int *)a2 + 5), 2601679328LL);
        *(void *)uint64_t v12 = 0LL;
        *(_DWORD *)(v12 + 16) = *((_DWORD *)v3 + 4) | 0x1000004;
        *(void *)(v12 + 8) = v12;
        *((void *)v3 + 1) = v12;
        *(_DWORD *)(v12 + 20) = *((_DWORD *)v3 + 5);
        if ((*((_DWORD *)v3 + 4) & 0x2000000) != 0)
        {
          *(_OWORD *)(v12 + 24) = *(_OWORD *)(v3 + 24);
          if (*((_DWORD *)v3 + 4) >> 28 == 1) {
            *(void *)(v12 + 40) = *((void *)v3 + 5);
          }
          (*((void (**)(void))v3 + 3))();
        }

        else
        {
          _platform_memmove(v12 + 24, v3 + 24, *((unsigned int *)v3 + 5) - 24LL);
        }
      }

LABEL_26:
      unsigned int v3 = (char *)*((void *)v3 + 1);
      goto LABEL_27;
  }

void _Block_object_dispose(const void *a1, const int a2)
{
  unsigned int v2 = a2 & 0x9F;
  if (v2 > 7)
  {
    if (v2 == 24 || v2 == 8)
    {
      uint64_t v4 = *((void *)a1 + 1);
      unsigned int v5 = (unsigned int *)(v4 + 16);
      if ((*(_DWORD *)(v4 + 16) & 0x1000000) != 0)
      {
        if ((*v5 & 0xFFFE) == 0) {
          _Block_object_dispose_cold_1();
        }
LABEL_12:
        unsigned int v6 = *v5;
        int v7 = *v5 & 0xFFFE;
        if (v7 && v7 != 65534)
        {
          else {
            int v9 = -2;
          }
          unsigned int v10 = v9 + v6;
          do
          {
            unsigned int v11 = __ldaxr(v5);
            if (v11 != v6)
            {
              __clrex();
              goto LABEL_12;
            }
          }

          while (__stlxr(v10, v5));
          if ((unsigned __int16)v6 == 2)
          {
            if ((*v5 & 0x2000000) != 0) {
              (*(void (**)(uint64_t))(v4 + 32))(v4);
            }
            free((void *)v4);
          }
        }
      }
    }
  }

  else if (v2 == 3)
  {
    _Block_release_object(a1);
  }

  else if (v2 == 7)
  {
    _Block_release(a1);
  }

void _Block_object_dispose_cold_1()
{
  uint64_t v0 = _os_assert_log(0LL);
  uint64_t v1 = _os_crash(v0);
  __break(1u);
  _os_assert_log(v1);
}