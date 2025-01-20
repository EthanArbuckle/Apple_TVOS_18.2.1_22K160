uint64_t BTAdvertiseMgr::BluetoothAvailabilityChanged(BTAdvertiseMgr *this, char a2)
{
  uint64_t result;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  BOOL v8;
  char *v9;
  char *v10;
  result = BTTaskMgr::BluetoothAvailabilityChanged((uint64_t)this, a2);
  v4 = (char *)*((void *)this + 3);
  v5 = (char *)this + 32;
  if (*((_BYTE *)this + 16))
  {
    if (v4 != (char *)this + 32)
    {
      do
      {
        result = BTAdvertiseMgr::_Advertise((uint64_t)this, (void *)v4 + 4, (void *)v4 + 7);
        v6 = (char *)*((void *)v4 + 1);
        if (v6)
        {
          do
          {
            v7 = v6;
            v6 = *(char **)v6;
          }

          while (v6);
        }

        else
        {
          do
          {
            v7 = (char *)*((void *)v4 + 2);
            v8 = *(void *)v7 == (void)v4;
            v4 = v7;
          }

          while (!v8);
        }

        v4 = v7;
      }

      while (v7 != v5);
    }
  }

  else if (v4 != (char *)this + 32)
  {
    do
    {
      result = BTLocalDeviceRemoveData( *(void *)(*((void *)this + 1) + 8LL),  *((void *)v4 + 4),  *((void *)v4 + 5) - *((void *)v4 + 4),  *((void *)v4 + 7),  *((void *)v4 + 8) - *((void *)v4 + 7));
      v9 = (char *)*((void *)v4 + 1);
      if (v9)
      {
        do
        {
          v10 = v9;
          v9 = *(char **)v9;
        }

        while (v9);
      }

      else
      {
        do
        {
          v10 = (char *)*((void *)v4 + 2);
          v8 = *(void *)v10 == (void)v4;
          v4 = v10;
        }

        while (!v8);
      }

      v4 = v10;
    }

    while (v10 != v5);
  }

  return result;
}

uint64_t BTAdvertiseMgr::_Advertise(uint64_t a1, void *a2, void *a3)
{
  if (!*(_BYTE *)(a1 + 16)) {
    return 0LL;
  }
  if (!BTLocalDeviceAdvertiseData( *(void *)(*(void *)(a1 + 8) + 8LL),  *a2,  a2[1] - *a2,  *a3,  a3[1] - *a3))
  {
    int v5 = 0;
    if (BTLocalDeviceGetDiscoverable(*(void *)(*(void *)(a1 + 8) + 8LL), &v5)
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_9D94();
    }

    if (BTLocalDeviceSetDiscoverable(*(void *)(*(void *)(a1 + 8) + 8LL), 1LL)
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_9D2C();
    }

    if (BTLocalDeviceSetConnectable(*(void *)(*(void *)(a1 + 8) + 8LL), 1LL)
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_9CC4();
    }

    return 0LL;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_9DFC();
  }
  return 1LL;
}

uint64_t BTAdvertiseMgr::Advertise(uint64_t a1, char **a2, char **a3)
{
  *(_OWORD *)__p = 0u;
  __int128 v11 = 0u;
  *(_OWORD *)v9 = 0u;
  sub_248C((uint64_t)v9, a2, a3);
  if (*(_DWORD *)sub_2214((uint64_t **)(a1 + 24), (unsigned __int8 **)v9))
  {
    v6 = sub_2214((uint64_t **)(a1 + 24), (unsigned __int8 **)v9);
    uint64_t v7 = 0LL;
    ++*(_DWORD *)v6;
  }

  else
  {
    *(_DWORD *)sub_2214((uint64_t **)(a1 + 24), (unsigned __int8 **)v9) = 1;
    uint64_t v7 = BTAdvertiseMgr::_Advertise(a1, a2, a3);
  }

  if (__p[1])
  {
    *(void **)&__int128 v11 = __p[1];
    operator delete(__p[1]);
  }

  if (v9[0])
  {
    v9[1] = v9[0];
    operator delete(v9[0]);
  }

  return v7;
}

void sub_21FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t *sub_2214(uint64_t **a1, unsigned __int8 **a2)
{
  uint64_t v9 = 0LL;
  v4 = (uint64_t **)sub_2634((uint64_t)a1, &v9, a2);
  int v5 = *v4;
  if (!*v4)
  {
    v6 = v4;
    memset(v8, 0, sizeof(v8));
    sub_26D0((uint64_t)a1, (char **)a2, v8);
    sub_2760(a1, v9, v6, v8[0]);
    int v5 = v8[0];
  }

  return v5 + 10;
}

uint64_t sub_2294(uint64_t a1)
{
  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(void *)(a1 + 32) = v2;
    operator delete(v2);
  }

  v3 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v3;
    operator delete(v3);
  }

  return a1;
}

void sub_22D4(void *a1)
{
}

uint64_t BTAdvertiseMgr::StopAdvertising(uint64_t a1, char **a2, char **a3)
{
  *(_OWORD *)__p = 0u;
  __int128 v11 = 0u;
  *(_OWORD *)uint64_t v9 = 0u;
  sub_248C((uint64_t)v9, a2, a3);
  v6 = sub_2214((uint64_t **)(a1 + 24), (unsigned __int8 **)v9);
  --*(_DWORD *)v6;
  sub_2B10((uint64_t **)(a1 + 24), (unsigned __int8 **)v9);
  if (!*(_BYTE *)(a1 + 16)) {
    goto LABEL_3;
  }
  if (BTLocalDeviceRemoveData(*(void *)(*(void *)(a1 + 8) + 8LL), *a2, a2[1] - *a2, *a3, a3[1] - *a3))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_9E64();
    }
    uint64_t v7 = 1LL;
    goto LABEL_4;
  }

  if (*(void *)(a1 + 40))
  {
LABEL_3:
    uint64_t v7 = 0LL;
    goto LABEL_4;
  }

  if (BTLocalDeviceSetConnectable(*(void *)(*(void *)(a1 + 8) + 8LL), 0LL)
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_9CC4();
  }

  uint64_t v7 = BTLocalDeviceSetDiscoverable(*(void *)(*(void *)(a1 + 8) + 8LL), 0LL);
  if ((_DWORD)v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_9D2C();
    }
    goto LABEL_3;
  }

LABEL_4:
  if (__p[1])
  {
    *(void **)&__int128 v11 = __p[1];
    operator delete(__p[1]);
  }

  if (v9[0])
  {
    v9[1] = v9[0];
    operator delete(v9[0]);
  }

  return v7;
}

void sub_2470( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_248C(uint64_t a1, char **a2, char **a3)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  sub_24FC((char *)a1, *a2, a2[1], a2[1] - *a2);
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = 0LL;
  *(void *)(a1 + 40) = 0LL;
  sub_24FC((char *)(a1 + 24), *a3, a3[1], a3[1] - *a3);
  return a1;
}

void sub_24E0(_Unwind_Exception *exception_object)
{
  v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *sub_24FC(char *result, char *a2, char *a3, size_t __sz)
{
  if (__sz)
  {
    v6 = result;
    result = sub_256C(result, __sz);
    uint64_t v7 = (_BYTE *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      char v8 = *a2++;
      *v7++ = v8;
    }

    *((void *)v6 + 1) = v7;
  }

  return result;
}

void sub_2550(_Unwind_Exception *exception_object)
{
  v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *sub_256C(void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000LL) != 0) {
    sub_25AC();
  }
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void sub_25AC()
{
}

void sub_25C0(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_2610(exception, a1);
}

void sub_25FC(_Unwind_Exception *a1)
{
}

std::logic_error *sub_2610(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_2634(uint64_t a1, void *a2, unsigned __int8 **a3)
{
  int v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        char v8 = (void *)v4;
        uint64_t v9 = (unsigned __int8 **)(v4 + 32);
        uint64_t v4 = *v8;
        int v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }

      int v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }

    while (v4);
  }

  else
  {
    char v8 = (void *)(a1 + 8);
  }

LABEL_10:
  *a2 = v8;
  return v5;
}

  if (v6 != v5)
  {
    v12 = v6 + 1;
    while (v3 != v4)
    {
      v13 = *v3;
      v14 = *(v12 - 1);
      if (v13 < v14) {
        break;
      }
      ++v3;
      if (v14 < v13 || v12++ == v5) {
        goto LABEL_19;
      }
    }

    return 0LL;
  }

uint64_t sub_26D0@<X0>(uint64_t a1@<X0>, char **a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  *a3 = 0LL;
  a3[2] = 0LL;
  a3[1] = 0LL;
  v6 = a3 + 1;
  uint64_t v7 = operator new(0x58uLL);
  *a3 = v7;
  void *v6 = v5;
  *((_WORD *)a3 + 8) = 0;
  uint64_t result = sub_2880((uint64_t)(v7 + 8), a2);
  *((_WORD *)a3 + 8) = 257;
  v7[20] = 0;
  return result;
}

void sub_2744(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0LL;
  sub_2A88(v2, v3);
  _Unwind_Resume(a1);
}

uint64_t *sub_2760(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0LL;
  a4[1] = 0LL;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }

  uint64_t result = sub_28F0(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t sub_27B4(uint64_t a1, unsigned __int8 **a2, unsigned __int8 **a3)
{
  v3 = *a3;
  uint64_t v4 = a3[1];
  v6 = *a2;
  uint64_t v5 = a2[1];
  if (*a3 != v4)
  {
    uint64_t v7 = v3 + 1;
    char v8 = *a2;
    while (v8 != v5)
    {
      unsigned int v9 = *v8;
      unsigned int v10 = *(v7 - 1);
      if (v9 < v10) {
        break;
      }
      ++v8;
      if (v10 < v9 || v7++ == v4) {
        goto LABEL_10;
      }
    }

    return 1LL;
  }

LABEL_19:
  v17 = a3[3];
  v16 = a3[4];
  if (v17 == v16) {
    return 0LL;
  }
  v18 = a2[3];
  v19 = v17 + 1;
  while (v18 != a2[4])
  {
    unsigned int v20 = *v18;
    unsigned int v21 = *(v19 - 1);
    if (v20 < v21) {
      break;
    }
    ++v18;
    if (v21 < v20 || v19++ == v16) {
      return 0LL;
    }
  }

  return 1LL;
}

uint64_t sub_2880(uint64_t a1, char **a2)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  sub_24FC((char *)a1, *a2, a2[1], a2[1] - *a2);
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = 0LL;
  *(void *)(a1 + 40) = 0LL;
  sub_24FC((char *)(a1 + 24), a2[3], a2[4], a2[4] - a2[3]);
  return a1;
}

void sub_28D4(_Unwind_Exception *exception_object)
{
  v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

uint64_t *sub_28F0(uint64_t *result, uint64_t *a2)
{
  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24)) {
        return result;
      }
      v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unsigned int v9 = (uint64_t **)a2[2];
          }

          else
          {
            unsigned int v9 = (uint64_t **)v2[1];
            unsigned int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }

            v9[2] = v3;
            *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = v9;
            *unsigned int v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }

          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }

      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), uint64_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }

          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }

        else
        {
          a2 = (uint64_t *)a2[2];
        }

        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }

      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *uint64_t v5 = 1;
    }

    while (v3 != result);
  }

  return result;
}

void sub_2A88(uint64_t a1, void *__p)
{
  if (*(_BYTE *)(a1 + 8)) {
    sub_2ACC((uint64_t)__p + 32);
  }
  if (__p) {
    operator delete(__p);
  }
}

void sub_2ACC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(void *)(a1 + 32) = v2;
    operator delete(v2);
  }

  v3 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v3;
    operator delete(v3);
  }
}

uint64_t sub_2B10(uint64_t **a1, unsigned __int8 **a2)
{
  v3 = (uint64_t *)sub_2B68((uint64_t)a1, a2);
  uint64_t v4 = v3;
  sub_2BF4(a1, v3);
  sub_2ACC((uint64_t)(v4 + 4));
  operator delete(v4);
  return 1LL;
}

uint64_t sub_2B68(uint64_t a1, unsigned __int8 **a2)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 16;
  uint64_t v6 = a1 + 8;
  do
  {
    int v7 = sub_27B4(v5, (unsigned __int8 **)(v3 + 32), a2);
    int v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      int v8 = (uint64_t *)v3;
      uint64_t v6 = v3;
    }

    uint64_t v3 = *v8;
  }

  while (*v8);
  return v6;
}

uint64_t *sub_2BF4(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      uint64_t v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }

    while (v2);
  }

  else
  {
    uint64_t v4 = a2;
    do
    {
      uint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      uint64_t v4 = v3;
    }

    while (!v5);
  }

  if (*a1 == a2) {
    *a1 = v3;
  }
  uint64_t v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  sub_2C64(v6, a2);
  return v3;
}

uint64_t *sub_2C64(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      uint64_t v3 = a2;
      goto LABEL_7;
    }

    do
    {
      uint64_t v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }

    while (v4);
  }

  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }

  int v5 = 1;
LABEL_8:
  uint64_t v6 = (uint64_t **)v3[2];
  int v7 = *v6;
  if (*v6 == v3)
  {
    uint64_t *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      int v7 = 0LL;
      uint64_t result = (uint64_t *)v2;
    }

    else
    {
      int v7 = v6[1];
    }
  }

  else
  {
    v6[1] = (uint64_t *)v2;
  }

  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8LL * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    uint64_t *v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2) {
      uint64_t result = v3;
    }
  }

  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }

  while (1)
  {
    uint64_t v12 = v7[2];
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      uint64_t v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8LL * (**(void **)(v12 + 16) != v12)) = v13;
      *uint64_t v13 = v12;
      *(void *)(v12 + 16) = v13;
      int v7 = *(uint64_t **)(*v7 + 8);
    }

    v15 = (void *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        *int v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8LL * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v16 = v7;
      }

      else
      {
        v15 = v7;
      }

      uint64_t v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8LL * (**(void **)(v23 + 16) != v23)) = v24;
      uint64_t *v24 = v23;
      goto LABEL_72;
    }

    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24)) {
      goto LABEL_55;
    }
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }

    if (!*((_BYTE *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    int v7 = *(uint64_t **)(v17[2] + 8LL * (*(void *)v17[2] == (void)v17));
  }

  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8LL * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    int v7 = *(uint64_t **)v12;
  }

  v19 = (void *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24)) {
    goto LABEL_68;
  }
  unsigned int v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }

  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_68:
    unsigned int v20 = v7;
  }

  else
  {
    *((_BYTE *)v20 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8LL * (*(void *)v7[2] != (void)v7)) = v20;
    *unsigned int v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    v19 = v7;
  }

  uint64_t v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8LL);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8LL * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

void sub_2FE8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

uint64_t BTBrowseMgr::BluetoothAvailabilityChanged(BTBrowseMgr *this, char a2)
{
  uint64_t v4 = (pthread_mutex_t *)((char *)this + 24);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 24));
  BTTaskMgr::BluetoothAvailabilityChanged((uint64_t)this, a2);
  if (*((_BYTE *)this + 16))
  {
    if (*((void *)this + 13) || *((void *)this + 16))
    {
      __int128 v24 = *(_OWORD *)off_C348;
      int v5 = (void *)((char *)this + 160);
      if (BTDiscoveryAgentCreate(**((void **)this + 1), &v24, this, (char *)this + 160))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_9FDC();
        }
        *int v5 = 0LL;
      }

      uint64_t v6 = (BTBrowseMgr *)*((void *)this + 11);
      if (v6 != (BTBrowseMgr *)((char *)this + 96))
      {
        do
        {
          int v7 = BTDiscoveryAgentAddKey(*v5, *((void *)v6 + 4), *((void *)v6 + 5) - *((void *)v6 + 4));
          if (v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_9F9C(v30, v7, &v31);
          }
          int v8 = (BTBrowseMgr *)*((void *)v6 + 1);
          if (v8)
          {
            do
            {
              uint64_t v9 = v8;
              int v8 = *(BTBrowseMgr **)v8;
            }

            while (v8);
          }

          else
          {
            do
            {
              uint64_t v9 = (BTBrowseMgr *)*((void *)v6 + 2);
              BOOL v10 = *(void *)v9 == (void)v6;
              uint64_t v6 = v9;
            }

            while (!v10);
          }

          uint64_t v6 = v9;
        }

        while (v9 != (BTBrowseMgr *)((char *)this + 96));
      }

      uint64_t v11 = (BTBrowseMgr *)*((void *)this + 14);
      if (v11 != (BTBrowseMgr *)((char *)this + 120))
      {
        do
        {
          int v12 = BTDiscoveryAgentAddKey(*v5, *((void *)v11 + 4), *((void *)v11 + 5) - *((void *)v11 + 4));
          if (v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_9F9C(v28, v12, v29);
          }
          uint64_t v13 = (BTBrowseMgr *)*((void *)v11 + 1);
          if (v13)
          {
            do
            {
              uint64_t v14 = v13;
              uint64_t v13 = *(BTBrowseMgr **)v13;
            }

            while (v13);
          }

          else
          {
            do
            {
              uint64_t v14 = (BTBrowseMgr *)*((void *)v11 + 2);
              BOOL v10 = *(void *)v14 == (void)v11;
              uint64_t v11 = v14;
            }

            while (!v10);
          }

          uint64_t v11 = v14;
        }

        while (v14 != (BTBrowseMgr *)((char *)this + 120));
      }

      BTBrowseMgr::_StartBrowsing((uint64_t)this, 0LL);
    }
  }

  else
  {
    uint64_t v15 = *((void *)this + 20);
    *((_DWORD *)this + 42) = 0;
    if (v15)
    {
      if (BTDiscoveryAgentStopScan()
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_9F34();
      }

      if (BTDiscoveryAgentDestroy((char *)this + 160)
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_9ECC();
      }

      *((void *)this + 20) = 0LL;
    }

    v16 = (BTBrowseMgr *)*((void *)this + 17);
    if (v16 != (BTBrowseMgr *)((char *)this + 144))
    {
      do
      {
        v17 = (char **)*((void *)v16 + 5);
        if (v17 != (char **)((char *)v16 + 48))
        {
          do
          {
            *(_OWORD *)__p = 0u;
            __int128 v27 = 0u;
            __int128 v24 = 0u;
            *(_OWORD *)uint64_t v25 = 0u;
            sub_5730((uint64_t)&v24, 1, 0, *((void *)v16 + 4), v17 + 4, v17 + 7);
            BTD2DPlugin::_QueueServiceEvent(*((void *)this + 1), (uint64_t)&v24);
            if (__p[1])
            {
              *(void **)&__int128 v27 = __p[1];
              operator delete(__p[1]);
            }

            if (v25[0])
            {
              v25[1] = v25[0];
              operator delete(v25[0]);
            }

            uint64_t v18 = v17[1];
            if (v18)
            {
              do
              {
                v19 = (char **)v18;
                uint64_t v18 = *(char **)v18;
              }

              while (v18);
            }

            else
            {
              do
              {
                v19 = (char **)v17[2];
                BOOL v10 = *v19 == (char *)v17;
                v17 = v19;
              }

              while (!v10);
            }

            v17 = v19;
          }

          while (v19 != (char **)((char *)v16 + 48));
        }

        unsigned int v20 = (BTBrowseMgr *)*((void *)v16 + 1);
        BOOL v21 = v16;
        if (v20)
        {
          do
          {
            uint64_t v22 = v20;
            unsigned int v20 = *(BTBrowseMgr **)v20;
          }

          while (v20);
        }

        else
        {
          do
          {
            uint64_t v22 = (BTBrowseMgr *)*((void *)v21 + 2);
            BOOL v10 = *(void *)v22 == (void)v21;
            BOOL v21 = v22;
          }

          while (!v10);
        }

        sub_5CD8((uint64_t **)this + 17, (uint64_t)v16);
        v16 = v22;
      }

      while (v22 != (BTBrowseMgr *)((char *)this + 144));
    }
  }

  return pthread_mutex_unlock(v4);
}

void sub_3394( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _btDiscoveryStatusEventCallback(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return BTBrowseMgr::_RespondToStatusEvent(a5, a2);
}

uint64_t _btDiscoveryDiscoveryEventCallback(uint64_t a1, int a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  return BTBrowseMgr::_ReportDiscoveryEvent(a5, a2, a3);
}

uint64_t BTBrowseMgr::_StartBrowsing(uint64_t a1, uint64_t *a2)
{
  if (*(_BYTE *)(a1 + 16))
  {
    uint64_t v4 = (void *)(a1 + 160);
    if (!*(void *)(a1 + 160))
    {
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = *(_OWORD *)off_C348;
      if (BTDiscoveryAgentCreate(**(void **)(a1 + 8), &__p, a1, v4))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_9FDC();
        }
        *uint64_t v4 = 0LL;
      }
    }

    if (a2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        sub_3D58(a2, &__p);
        int v5 = (__p.__r_.__value_.__s.__size_ & 0x80u) == 0
           ? &__p
           : (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
        *(_DWORD *)buf = 136315138;
        BOOL v10 = v5;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Adding new key to browse: %s\n",  buf,  0xCu);
      }

      if (BTDiscoveryAgentAddKey(*v4, *a2, a2[1] - *a2))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_A0AC();
        }
        return 1LL;
      }
    }

    int v6 = *(_DWORD *)(a1 + 168);
    if (v6 == 3)
    {
      uint64_t result = 0LL;
      *(_DWORD *)(a1 + 168) = 2;
      return result;
    }

    if (!v6)
    {
      *(_DWORD *)(a1 + 168) = 1;
      if (BTDiscoveryAgentStartScanForAdvertizedData(*(void *)(a1 + 160)))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_A044();
        }
        *(_DWORD *)(a1 + 168) = 0;
        return 1LL;
      }
    }
  }

  return 0LL;
}

void *sub_35B0(void *a1)
{
  uint64_t v2 = (void *)a1[5];
  if (v2)
  {
    a1[6] = v2;
    operator delete(v2);
  }

  uint64_t v3 = (void *)a1[2];
  if (v3)
  {
    a1[3] = v3;
    operator delete(v3);
  }

  return a1;
}

uint64_t BTBrowseMgr::Browse(uint64_t a1, unsigned __int8 **a2)
{
  uint64_t v14 = (pthread_mutex_t *)(a1 + 24);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 24));
  uint64_t v4 = sub_3848((uint64_t **)(a1 + 88), a2);
  ++*(_DWORD *)v4;
  if (*(_BYTE *)(a1 + 16))
  {
    uint64_t started = BTBrowseMgr::_StartBrowsing(a1, (uint64_t *)a2);
    if ((_DWORD)started)
    {
      sub_5EB8((uint64_t **)(a1 + 88), a2);
      pthread_mutex_unlock(v14);
      return 1LL;
    }

    int v7 = *(uint64_t ***)(a1 + 136);
    if (v7 != (uint64_t **)(a1 + 144))
    {
      do
      {
        v20[0] = 0LL;
        v20[1] = 0LL;
        v19 = (uint64_t *)v20;
        BTBrowseMgr::_GetServiceInstancesOfType(started, (uint64_t)v7[4], (uint64_t *)a2, &v19);
        int v8 = v19;
        if (v19 != (uint64_t *)v20)
        {
          do
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Browse found value matching key on known device!\n",  buf,  2u);
            }

            sub_6070(v7 + 5, (unsigned __int8 **)v8 + 4, (char **)v8 + 4);
            *(_OWORD *)std::stringbuf::string_type __p = 0u;
            __int128 v18 = 0u;
            *(_OWORD *)buf = 0u;
            *(_OWORD *)v16 = 0u;
            sub_5730((uint64_t)buf, 0, 0, (uint64_t)v7[4], (char **)v8 + 4, (char **)v8 + 7);
            BTD2DPlugin::_QueueServiceEvent(*(void *)(a1 + 8), (uint64_t)buf);
            if (__p[1])
            {
              *(void **)&__int128 v18 = __p[1];
              operator delete(__p[1]);
            }

            if (v16[0])
            {
              v16[1] = v16[0];
              operator delete(v16[0]);
            }

            uint64_t v9 = (uint64_t *)v8[1];
            if (v9)
            {
              do
              {
                BOOL v10 = v9;
                uint64_t v9 = (uint64_t *)*v9;
              }

              while (v9);
            }

            else
            {
              do
              {
                BOOL v10 = (uint64_t *)v8[2];
                BOOL v11 = *v10 == (void)v8;
                int v8 = v10;
              }

              while (!v11);
            }

            int v8 = v10;
          }

          while (v10 != (uint64_t *)v20);
        }

        sub_601C((uint64_t)&v19, v20[0]);
        int v12 = v7[1];
        if (v12)
        {
          do
          {
            uint64_t v13 = (uint64_t **)v12;
            int v12 = (uint64_t *)*v12;
          }

          while (v12);
        }

        else
        {
          do
          {
            uint64_t v13 = (uint64_t **)v7[2];
            BOOL v11 = *v13 == (uint64_t *)v7;
            int v7 = v13;
          }

          while (!v11);
        }

        int v7 = v13;
      }

      while (v13 != (uint64_t **)(a1 + 144));
    }
  }

  pthread_mutex_unlock(v14);
  return 0LL;
}

void sub_3814( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20, void *a21)
{
}

uint64_t *sub_3848(uint64_t **a1, unsigned __int8 **a2)
{
  uint64_t v9 = 0LL;
  uint64_t v4 = (uint64_t **)sub_5D14((uint64_t)a1, &v9, a2);
  int v5 = *v4;
  if (!*v4)
  {
    int v6 = v4;
    memset(v8, 0, sizeof(v8));
    sub_5DD4((uint64_t)a1, (char **)a2, v8);
    sub_2760(a1, v9, v6, v8[0]);
    int v5 = v8[0];
  }

  return v5 + 7;
}

void BTBrowseMgr::_GetServiceInstancesOfType(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t **a4)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    sub_3D58(a3, (std::stringbuf::string_type *)__p);
    int v7 = __p[23] >= 0 ? __p : *(_BYTE **)__p;
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "_GetServiceInstancesOfType - %s\n",  (uint8_t *)&buf,  0xCu);
    if ((__p[23] & 0x80000000) != 0) {
      operator delete(*(void **)__p);
    }
  }

  int v46 = 0;
  int v8 = BTDeviceMatchesAdvertisedKey(a2, *a3, a3[1] - *a3, &v46);
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v46 == 0;
  }
  if (!v9)
  {
    unint64_t v45 = 0LL;
    BOOL v10 = (unsigned __int8 *)operator new[](0x400uLL);
    uint64_t AdvertisedValueForKey = BTDeviceGetAdvertisedValueForKey(a2, *a3, a3[1] - *a3, v10, &v45, 1024LL);
    uint64_t v12 = AdvertisedValueForKey;
    if ((_DWORD)AdvertisedValueForKey)
    {
      uint64_t v13 = 1024LL;
LABEL_16:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_A194(v13, v12, v14, v15, v16, v17, v18, v19);
      }
LABEL_56:
      operator delete[](v10);
      return;
    }

    uint64_t v13 = v45;
    if (v45 >= 0x401)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)std::stringbuf::string_type __p = 134218240;
        *(void *)&__p[4] = v13;
        *(_WORD *)&__p[12] = 2048;
        *(void *)&__p[14] = 1024LL;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "BTDeviceGetAdvertisedValueForKey needs %lu bytes instead of %lu bytes - resizing...\n",  __p,  0x16u);
        uint64_t v13 = v45;
      }

      unint64_t v45 = 0LL;
      operator delete[](v10);
      BOOL v10 = (unsigned __int8 *)operator new[](v13);
      uint64_t v12 = BTDeviceGetAdvertisedValueForKey(a2, *a3, a3[1] - *a3, v10, &v45, v13);
      if ((_DWORD)v12) {
        goto LABEL_16;
      }
      uint64_t v13 = v45;
    }

    if (v13 >= 1)
    {
      BOOL v21 = v10 + 2;
      size_t v20 = *v10;
      if (&v10[v20 + 2] > &v10[v13])
      {
LABEL_54:
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_A114(v20, v13, v37, v38, v39, v40, v41, v42);
        }
      }

      else
      {
        v43 = v10;
        v44 = a4;
        while (1)
        {
          __int128 buf = 0uLL;
          v50 = 0LL;
          sub_4A5C((unint64_t *)&buf, v20);
          unsigned int v22 = v20;
          if ((_BYTE)v20)
          {
            int v23 = 0;
            __int128 v24 = (unsigned __int8 *)*((void *)&buf + 1);
            do
            {
              if (v24 >= (unsigned __int8 *)v50)
              {
                unint64_t v26 = buf;
                __int128 v27 = &v24[-buf];
                uint64_t v28 = (uint64_t)&v24[-buf + 1];
                if (v28 < 0) {
                  sub_25AC();
                }
                unint64_t v29 = (unint64_t)&v50[-buf];
                if (v29 >= 0x3FFFFFFFFFFFFFFFLL) {
                  size_t v30 = 0x7FFFFFFFFFFFFFFFLL;
                }
                else {
                  size_t v30 = v28;
                }
                if (v30) {
                  int v31 = (char *)operator new(v30);
                }
                else {
                  int v31 = 0LL;
                }
                v32 = (char *)&v27[(void)v31];
                v33 = &v27[(void)v31];
                unsigned __int8 *v33 = *v21;
                uint64_t v25 = v33 + 1;
                if (v24 != (unsigned __int8 *)v26)
                {
                  v34 = &v24[~v26];
                  do
                  {
                    unsigned __int8 v35 = *--v24;
                    (v34--)[(void)v31] = v35;
                  }

                  while (v24 != (unsigned __int8 *)v26);
                  __int128 v24 = (unsigned __int8 *)buf;
                  v32 = v31;
                }

                *(void *)&__int128 buf = v32;
                *((void *)&buf + 1) = v25;
                v50 = &v31[v30];
                if (v24) {
                  operator delete(v24);
                }
              }

              else
              {
                unsigned __int8 *v24 = *v21;
                uint64_t v25 = v24 + 1;
              }

              *((void *)&buf + 1) = v25;
              ++v21;
              ++v23;
              __int128 v24 = v25;
            }

            while (v22 > (unsigned __int16)v23);
          }

          __int128 v48 = 0u;
          memset(__p, 0, sizeof(__p));
          sub_248C((uint64_t)__p, (char **)a3, (char **)&buf);
          sub_6070(v44, (unsigned __int8 **)__p, (char **)__p);
          BOOL v10 = v43;
          if (*(void *)&__p[24])
          {
            *(void *)&__int128 v48 = *(void *)&__p[24];
            operator delete(*(void **)&__p[24]);
          }

          if (*(void *)__p)
          {
            *(void *)&__p[8] = *(void *)__p;
            operator delete(*(void **)__p);
          }

          if ((void)buf)
          {
            *((void *)&buf + 1) = buf;
            operator delete((void *)buf);
          }

          uint64_t v13 = v45;
          if (v21 >= &v43[v45]) {
            break;
          }
          unsigned int v36 = *v21;
          v21 += 2;
          size_t v20 = v36;
          if (&v21[v36] > &v43[v45]) {
            goto LABEL_54;
          }
        }
      }
    }

    goto LABEL_56;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::stringbuf::string_type __p = 67109120;
    *(_DWORD *)&__p[4] = v8;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "BTDeviceMatchesAdvertisedKey says no match! Result was %d\n",  __p,  8u);
  }

void sub_3D08( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20)
{
  if (__p)
  {
    a20 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_3D58@<X0>(uint64_t *a1@<X0>, std::stringbuf::string_type *a2@<X8>)
{
  uint64_t v12 = 0LL;
  memset(v11, 0, sizeof(v11));
  sub_57C8((uint64_t)v11);
  uint64_t v4 = *(void *)&v11[0];
  int v5 = (char *)v11 + *(void *)(*(void *)&v11[0] - 24LL);
  if (*((_DWORD *)v5 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)v11 + *(void *)(*(void *)&v11[0] - 24LL)));
    int v6 = std::locale::use_facet(&v13, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v6->__vftable[2].~facet_0)(v6, 32LL);
    std::locale::~locale(&v13);
    uint64_t v4 = *(void *)&v11[0];
  }

  *((_DWORD *)v5 + 36) = 48;
  *(void *)((char *)&v11[1] + *(void *)(v4 - 24) + 8) = 2LL;
  *(_DWORD *)((char *)v11 + *(void *)(v4 - 24) + 8) = 16392;
  uint64_t v7 = *a1;
  if (a1[1] != *a1)
  {
    unint64_t v8 = 0LL;
    do
    {
      BOOL v9 = (void *)std::ostream::operator<<(v11, *(unsigned __int8 *)(v7 + v8));
      sub_596C(v9, (uint64_t)" ", 1LL);
      ++v8;
      uint64_t v7 = *a1;
    }

    while (v8 < a1[1] - *a1);
  }

  std::stringbuf::str(a2, (const std::stringbuf *)((char *)v11 + 8));
  return sub_58B8((uint64_t)v11);
}

void sub_3E98( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t BTBrowseMgr::_RespondToStatusEvent(uint64_t a1, int a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 24);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 24));
  if (a2 == 1)
  {
    int v5 = *(_DWORD *)(a1 + 168);
    *(_DWORD *)(a1 + 168) = 0;
    if (v5 == 2)
    {
      BTBrowseMgr::_StartBrowsing(a1, 0LL);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Nothing left to browse for - scan stopped\n",  v9,  2u);
      }

      BTDiscoveryAgentDestroy(a1 + 160);
      *(void *)(a1 + 160) = 0LL;
      uint64_t v7 = *(void **)(a1 + 144);
      int v6 = (void *)(a1 + 144);
      sub_61C8((uint64_t)(v6 - 1), v7);
      *(v6 - 1) = v6;
      void *v6 = 0LL;
      v6[1] = 0LL;
    }
  }

  else if (!a2 && *(_DWORD *)(a1 + 168) == 1)
  {
    *(_DWORD *)(a1 + 168) = 2;
  }

  return pthread_mutex_unlock(v4);
}

uint64_t BTBrowseMgr::_StopBrowsing(BTBrowseMgr *this)
{
  if (*((void *)this + 13) || *((void *)this + 16)) {
    return 0LL;
  }
  int v2 = *((_DWORD *)this + 42);
  if (v2 == 1)
  {
    int v3 = 0;
  }

  else
  {
    if (v2 != 2) {
      goto LABEL_10;
    }
    int v3 = 3;
  }

  *((_DWORD *)this + 42) = v3;
LABEL_10:
  uint64_t result = BTDiscoveryAgentStopScan(*((void *)this + 20));
  if ((_DWORD)result)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_9F34();
    }
    return 1LL;
  }

  return result;
}

uint64_t BTBrowseMgr::StopBrowsing(uint64_t a1, unsigned __int8 **a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 24);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 24));
  int v5 = (void *)(a1 + 88);
  int v6 = sub_5EFC(a1 + 88, a2);
  if ((void *)(a1 + 96) == v6)
  {
    uint64_t v9 = v6;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      LOWORD(__p.__r_.__value_.__l.__data_) = 0;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "StopBrowsing: couldn't find key! Dumping browse list...\n",  (uint8_t *)&__p,  2u);
    }

    BOOL v10 = (void *)*v5;
    if ((void *)*v5 != v9)
    {
      do
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          sub_3D58(v10 + 4, &__p);
          BOOL v11 = (__p.__r_.__value_.__s.__size_ & 0x80u) == 0
              ? &__p
              : (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
          uint64_t v12 = *((unsigned int *)v10 + 14);
          *(_DWORD *)__int128 buf = 136315394;
          uint64_t v19 = v11;
          __int16 v20 = 2048;
          uint64_t v21 = v12;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Key - %s - count: %lu\n", buf, 0x16u);
        }

        std::locale v13 = (void *)v10[1];
        if (v13)
        {
          do
          {
            uint64_t v14 = v13;
            std::locale v13 = (void *)*v13;
          }

          while (v13);
        }

        else
        {
          do
          {
            uint64_t v14 = (void *)v10[2];
            BOOL v15 = *v14 == (void)v10;
            BOOL v10 = v14;
          }

          while (!v15);
        }

        BOOL v10 = v14;
      }

      while (v14 != v9);
    }
  }

  else
  {
    uint64_t v7 = sub_3848((uint64_t **)(a1 + 88), a2);
    --*(_DWORD *)v7;
    if (!*(_DWORD *)sub_3848((uint64_t **)(a1 + 88), a2))
    {
      sub_5EB8((uint64_t **)(a1 + 88), a2);
      if ((void *)(a1 + 120) == sub_5EFC(a1 + 112, a2))
      {
        if (*(_BYTE *)(a1 + 16))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            sub_3D58((uint64_t *)a2, &__p);
            unint64_t v8 = (__p.__r_.__value_.__s.__size_ & 0x80u) == 0
               ? &__p
               : (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
            *(_DWORD *)__int128 buf = 136315138;
            uint64_t v19 = v8;
            _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Removing key from browse: %s\n",  buf,  0xCu);
          }

          if (BTDiscoveryAgentRemoveKey(*(void *)(a1 + 160), *a2, a2[1] - *a2)
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            sub_A210();
          }

          BTBrowseMgr::_StopBrowsing((BTBrowseMgr *)a1);
        }
      }
    }
  }

  pthread_mutex_unlock(v4);
  return 0LL;
}

uint64_t BTBrowseMgr::StartResolving(uint64_t a1, unsigned __int8 **a2, unsigned __int8 **a3)
{
  int v6 = (pthread_mutex_t *)(a1 + 24);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 24));
  if ((void *)(a1 + 120) == sub_5EFC(a1 + 112, a2))
  {
    v18[0] = 0LL;
    __int128 v17 = (unint64_t)&v17 + 8;
    uint64_t v7 = sub_45E4((uint64_t **)(a1 + 112), a2);
    sub_6214((uint64_t)&v17, *((void **)&v17 + 1));
  }

  unint64_t v8 = sub_45E4((uint64_t **)(a1 + 112), a2);
  sub_686C((uint64_t **)v8, a3, (char **)a3);
  if (*(_BYTE *)(a1 + 16))
  {
    uint64_t started = BTBrowseMgr::_StartBrowsing(a1, (uint64_t *)a2);
    if ((_DWORD)started)
    {
      BOOL v10 = sub_45E4((uint64_t **)(a1 + 112), a2);
      sub_5EB8((uint64_t **)v10, a3);
    }

    else
    {
      uint64_t v12 = *(uint64_t ***)(a1 + 136);
      if (v12 != (uint64_t **)(a1 + 144))
      {
        do
        {
          v25[0] = 0LL;
          v25[1] = 0LL;
          __int128 v24 = (uint64_t *)v25;
          BTBrowseMgr::_GetServiceInstancesOfType(started, (uint64_t)v12[4], (uint64_t *)a2, &v24);
          *(_OWORD *)unsigned int v22 = 0u;
          __int128 v23 = 0u;
          *(_OWORD *)uint64_t v21 = 0u;
          sub_248C((uint64_t)v21, (char **)a2, (char **)a3);
          uint64_t v13 = sub_2B68((uint64_t)&v24, (unsigned __int8 **)v21);
          if (v25 != (void **)v13)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              LOWORD(v17) = 0;
              _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Resolve found matching key/value on known device!\n",  (uint8_t *)&v17,  2u);
            }

            sub_6070(v12 + 5, (unsigned __int8 **)v21, (char **)v21);
            *(_OWORD *)std::stringbuf::string_type __p = 0u;
            __int128 v20 = 0u;
            __int128 v17 = 0u;
            *(_OWORD *)uint64_t v18 = 0u;
            sub_5730((uint64_t)&v17, 2, 0, (uint64_t)v12[4], (char **)(v13 + 32), (char **)(v13 + 56));
            BTD2DPlugin::_QueueServiceEvent(*(void *)(a1 + 8), (uint64_t)&v17);
            if (__p[1])
            {
              *(void **)&__int128 v20 = __p[1];
              operator delete(__p[1]);
            }

            if (v18[0])
            {
              v18[1] = v18[0];
              operator delete(v18[0]);
            }
          }

          if (v22[1])
          {
            *(void **)&__int128 v23 = v22[1];
            operator delete(v22[1]);
          }

          if (v21[0])
          {
            v21[1] = v21[0];
            operator delete(v21[0]);
          }

          sub_601C((uint64_t)&v24, v25[0]);
          if (v25 != (void **)v13) {
            break;
          }
          uint64_t v14 = v12[1];
          if (v14)
          {
            do
            {
              BOOL v15 = (uint64_t **)v14;
              uint64_t v14 = (uint64_t *)*v14;
            }

            while (v14);
          }

          else
          {
            do
            {
              BOOL v15 = (uint64_t **)v12[2];
              BOOL v16 = *v15 == (uint64_t *)v12;
              uint64_t v12 = v15;
            }

            while (!v16);
          }

          uint64_t v12 = v15;
        }

        while (v15 != (uint64_t **)(a1 + 144));
      }
    }
  }

  return pthread_mutex_unlock(v6);
}

void sub_458C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

uint64_t *sub_45E4(uint64_t **a1, unsigned __int8 **a2)
{
  uint64_t v9 = 0LL;
  uint64_t v4 = (uint64_t **)sub_5D14((uint64_t)a1, &v9, a2);
  int v5 = *v4;
  if (!*v4)
  {
    int v6 = v4;
    memset(v8, 0, sizeof(v8));
    sub_6264((uint64_t)a1, (char **)a2, v8);
    sub_2760(a1, v9, v6, v8[0]);
    int v5 = v8[0];
  }

  return v5 + 7;
}

uint64_t BTBrowseMgr::StopResolving(uint64_t a1, unsigned __int8 **a2, unsigned __int8 **a3)
{
  int v6 = (pthread_mutex_t *)(a1 + 24);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 24));
  uint64_t v7 = (uint64_t ***)(a1 + 112);
  unint64_t v8 = (uint64_t **)sub_5EFC(a1 + 112, a2);
  uint64_t v9 = v8;
  if ((uint64_t **)(a1 + 120) == v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      LOWORD(__p.__r_.__value_.__l.__data_) = 0;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "StopResolving: couldn't find key! Dumping resolving list...\n",  (uint8_t *)&__p,  2u);
    }

    uint64_t v12 = *v7;
    if (*v7 != v9)
    {
      do
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          sub_3D58((uint64_t *)v12 + 4, &__p);
          uint64_t v13 = (__p.__r_.__value_.__s.__size_ & 0x80u) == 0
              ? &__p
              : (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
          *(_DWORD *)__int128 buf = 136315138;
          __int128 v20 = v13;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Key: %s\n", buf, 0xCu);
        }

        uint64_t v14 = v12[1];
        if (v14)
        {
          do
          {
            BOOL v15 = (uint64_t **)v14;
            uint64_t v14 = (uint64_t *)*v14;
          }

          while (v14);
        }

        else
        {
          do
          {
            BOOL v15 = (uint64_t **)v12[2];
            BOOL v16 = *v15 == (uint64_t *)v12;
            uint64_t v12 = v15;
          }

          while (!v16);
        }

        uint64_t v12 = v15;
      }

      while (v15 != v9);
    }
  }

  else
  {
    BOOL v10 = sub_5EFC((uint64_t)(v8 + 7), a3);
    if (v9 + 8 != (uint64_t **)v10)
    {
      sub_5F78(v9 + 7, v10);
      if (!v9[9])
      {
        sub_2BF4((uint64_t **)(a1 + 112), (uint64_t *)v9);
        sub_68F4((uint64_t)(v9 + 4));
        operator delete(v9);
        if ((void *)(a1 + 96) == sub_5EFC(a1 + 88, a2))
        {
          if (*(_BYTE *)(a1 + 16))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              sub_3D58((uint64_t *)a2, &__p);
              BOOL v11 = (__p.__r_.__value_.__s.__size_ & 0x80u) == 0
                  ? &__p
                  : (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
              *(_DWORD *)__int128 buf = 136315138;
              __int128 v20 = v11;
              _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Removing key from browse: %s\n",  buf,  0xCu);
            }

            if (BTDiscoveryAgentRemoveKey(*(void *)(a1 + 160), *a2, a2[1] - *a2)
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              sub_A210();
            }

            BTBrowseMgr::_StopBrowsing((BTBrowseMgr *)a1);
          }
        }
      }
    }
  }

  return pthread_mutex_unlock(v6);
}

uint64_t BTBrowseMgr::_ResolvingServiceForDevice(BTBrowseMgr *this, unint64_t a2)
{
  uint64_t v4 = (pthread_mutex_t *)((char *)this + 24);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 24));
  int v5 = (void *)*((void *)this + 18);
  if (!v5) {
    goto LABEL_21;
  }
  int v6 = (void *)((char *)this + 144);
  do
  {
    unint64_t v7 = v5[4];
    BOOL v8 = v7 >= a2;
    if (v7 >= a2) {
      uint64_t v9 = v5;
    }
    else {
      uint64_t v9 = v5 + 1;
    }
    if (v8) {
      int v6 = v5;
    }
    int v5 = (void *)*v9;
  }

  while (*v9);
  if (v6 == (void *)((char *)this + 144)
    || v6[4] > a2
    || (v10 = (unsigned __int8 **)v6[5], BOOL v11 = (unsigned __int8 **)(v6 + 6), v10 == v6 + 6))
  {
LABEL_21:
    uint64_t v16 = 0LL;
  }

  else
  {
    while (1)
    {
      uint64_t v12 = sub_5EFC((uint64_t)this + 112, v10 + 4);
      uint64_t v13 = v10[1];
      if (v13)
      {
        do
        {
          uint64_t v14 = (unsigned __int8 **)v13;
          uint64_t v13 = *(unsigned __int8 **)v13;
        }

        while (v13);
      }

      else
      {
        do
        {
          uint64_t v14 = (unsigned __int8 **)v10[2];
          BOOL v15 = *v14 == (unsigned __int8 *)v10;
          BOOL v10 = v14;
        }

        while (!v15);
      }

      BOOL v10 = v14;
      if (v14 == v11) {
        goto LABEL_21;
      }
    }

    uint64_t v16 = 1LL;
  }

  pthread_mutex_unlock(v4);
  return v16;
}

void sub_4A5C(unint64_t *a1, size_t __sz)
{
  unint64_t v2 = *a1;
  if (a1[2] - *a1 < __sz)
  {
    if ((__sz & 0x8000000000000000LL) != 0) {
      sub_25AC();
    }
    int v5 = (char *)a1[1];
    int v6 = operator new(__sz);
    unint64_t v7 = &v5[(void)v6 - v2];
    BOOL v8 = v7;
    if (v5 != (char *)v2)
    {
      uint64_t v9 = &v5[~v2];
      do
      {
        char v10 = *--v5;
        (v9--)[(void)v6] = v10;
      }

      while (v5 != (char *)v2);
      BOOL v8 = v6;
    }

    *a1 = (unint64_t)v8;
    a1[1] = (unint64_t)v7;
    a1[2] = (unint64_t)&v6[__sz];
    if (v2) {
      operator delete((void *)v2);
    }
  }

uint64_t BTBrowseMgr::_ReportDiscoveryEvent(uint64_t a1, int a2, unint64_t a3)
{
  int v6 = (pthread_mutex_t *)(a1 + 24);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 24));
  if ((a2 & 0xFFFFFFFD) != 0)
  {
    if (a2 == 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "_ReportDiscoveryEvent: lost event\n",  buf,  2u);
      }

      unint64_t v7 = *(void **)(a1 + 144);
      if (v7)
      {
        uint64_t v8 = a1 + 144;
        do
        {
          unint64_t v9 = v7[4];
          BOOL v10 = v9 >= a3;
          if (v9 >= a3) {
            BOOL v11 = v7;
          }
          else {
            BOOL v11 = v7 + 1;
          }
          if (v10) {
            uint64_t v8 = (uint64_t)v7;
          }
          unint64_t v7 = (void *)*v11;
        }

        while (*v11);
        if (v8 != a1 + 144 && *(void *)(v8 + 32) <= a3)
        {
          uint64_t v12 = *(char ***)(v8 + 40);
          if (v12 != (char **)(v8 + 48))
          {
            do
            {
              *(_OWORD *)std::stringbuf::string_type __p = 0u;
              __int128 v78 = 0u;
              *(_OWORD *)__int128 buf = 0u;
              *(_OWORD *)v76 = 0u;
              sub_5730((uint64_t)buf, 1, 0, *(void *)(v8 + 32), v12 + 4, v12 + 7);
              BTD2DPlugin::_QueueServiceEvent(*(void *)(a1 + 8), (uint64_t)buf);
              if (__p[1])
              {
                *(void **)&__int128 v78 = __p[1];
                operator delete(__p[1]);
              }

              if (v76[0])
              {
                v76[1] = v76[0];
                operator delete(v76[0]);
              }

              uint64_t v13 = v12[1];
              if (v13)
              {
                do
                {
                  uint64_t v14 = (char **)v13;
                  uint64_t v13 = *(char **)v13;
                }

                while (v13);
              }

              else
              {
                do
                {
                  uint64_t v14 = (char **)v12[2];
                  BOOL v15 = *v14 == (char *)v12;
                  uint64_t v12 = v14;
                }

                while (!v15);
              }

              uint64_t v12 = v14;
            }

            while (v14 != (char **)(v8 + 48));
          }

          sub_5CD8((uint64_t **)(a1 + 136), v8);
        }
      }
    }
  }

  else
  {
    BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
    if (v16)
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "_ReportDiscoveryEvent: found/changed event\n",  buf,  2u);
    }

    v72 = v6;
    v81 = 0LL;
    uint64_t v82 = 0LL;
    v80 = (unsigned __int8 **)&v81;
    __int128 v17 = *(void **)(a1 + 88);
    uint64_t v73 = a1;
    if (v17 != (void *)(a1 + 96))
    {
      do
      {
        BTBrowseMgr::_GetServiceInstancesOfType(v16, a3, v17 + 4, (uint64_t **)&v80);
        uint64_t v18 = (void *)v17[1];
        if (v18)
        {
          do
          {
            uint64_t v19 = v18;
            uint64_t v18 = (void *)*v18;
          }

          while (v18);
        }

        else
        {
          do
          {
            uint64_t v19 = (void *)v17[2];
            BOOL v15 = *v19 == (void)v17;
            __int128 v17 = v19;
          }

          while (!v15);
        }

        __int128 v17 = v19;
      }

      while (v19 != (void *)(a1 + 96));
      if (v82)
      {
        uint64_t v21 = a1 + 144;
        __int128 v20 = *(void **)(a1 + 144);
        if (!v20) {
          goto LABEL_49;
        }
        uint64_t v22 = a1 + 144;
        do
        {
          unint64_t v23 = v20[4];
          BOOL v24 = v23 >= a3;
          if (v23 >= a3) {
            uint64_t v25 = v20;
          }
          else {
            uint64_t v25 = v20 + 1;
          }
          if (v24) {
            uint64_t v22 = (uint64_t)v20;
          }
          __int128 v20 = (void *)*v25;
        }

        while (*v25);
        if (v22 == v21 || *(void *)(v22 + 32) > a3) {
LABEL_49:
        }
          uint64_t v22 = a1 + 144;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "new service list for _browsed_ types:\n",  buf,  2u);
        }

        unint64_t v26 = (uint64_t *)v80;
        if (v80 != (unsigned __int8 **)&v81)
        {
          do
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              sub_3D58(v26 + 4, (std::stringbuf::string_type *)buf);
              int v27 = SHIBYTE(v76[0]);
              uint64_t v28 = *(uint8_t **)buf;
              sub_3D58(v26 + 7, &v79);
              unint64_t v29 = buf;
              if (v27 < 0) {
                unint64_t v29 = v28;
              }
              size_t v30 = &v79;
              if ((v79.__r_.__value_.__s.__size_ & 0x80u) != 0) {
                size_t v30 = (std::stringbuf::string_type *)v79.__r_.__value_.__r.__words[0];
              }
              *(_DWORD *)v89 = 136315394;
              *(void *)&v89[4] = v29;
              *(_WORD *)&v89[12] = 2080;
              *(void *)&v89[14] = v30;
              _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "   Key: %s Value: %s\n", v89, 0x16u);
              if (SHIBYTE(v76[0]) < 0) {
                operator delete(*(void **)buf);
              }
            }

            int v31 = (char *)v26[1];
            if (v31)
            {
              do
              {
                v32 = (char **)v31;
                int v31 = *(char **)v31;
              }

              while (v31);
            }

            else
            {
              do
              {
                v32 = (char **)v26[2];
                BOOL v15 = *v32 == (char *)v26;
                unint64_t v26 = (uint64_t *)v32;
              }

              while (!v15);
            }

            unint64_t v26 = (uint64_t *)v32;
          }

          while (v32 != &v81);
        }

        v33 = (uint64_t **)(a1 + 136);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "\nold service list for _browsed_ types:\n",  buf,  2u);
        }

        if (v22 == v21)
        {
          __int128 v48 = (uint64_t *)v80;
          if (v80 != (unsigned __int8 **)&v81)
          {
            do
            {
              *(_OWORD *)std::stringbuf::string_type __p = 0u;
              __int128 v78 = 0u;
              *(_OWORD *)__int128 buf = 0u;
              *(_OWORD *)v76 = 0u;
              sub_5730((uint64_t)buf, 0, 0, a3, (char **)v48 + 4, (char **)v48 + 7);
              BTD2DPlugin::_QueueServiceEvent(*(void *)(a1 + 8), (uint64_t)buf);
              if (__p[1])
              {
                *(void **)&__int128 v78 = __p[1];
                operator delete(__p[1]);
              }

              if (v76[0])
              {
                v76[1] = v76[0];
                operator delete(v76[0]);
              }

              v49 = (char *)v48[1];
              if (v49)
              {
                do
                {
                  v50 = (char **)v49;
                  v49 = *(char **)v49;
                }

                while (v49);
              }

              else
              {
                do
                {
                  v50 = (char **)v48[2];
                  BOOL v15 = *v50 == (char *)v48;
                  __int128 v48 = (uint64_t *)v50;
                }

                while (!v15);
              }

              __int128 v48 = (uint64_t *)v50;
            }

            while (v50 != &v81);
          }
        }

        else
        {
          v34 = *(void **)(v22 + 40);
          if (v34 != (void *)(v22 + 48))
          {
            do
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
              {
                sub_3D58(v34 + 4, (std::stringbuf::string_type *)buf);
                int v35 = SHIBYTE(v76[0]);
                unsigned int v36 = *(uint8_t **)buf;
                sub_3D58(v34 + 7, &v79);
                if (v35 >= 0) {
                  uint64_t v37 = buf;
                }
                else {
                  uint64_t v37 = v36;
                }
                if ((v79.__r_.__value_.__s.__size_ & 0x80u) == 0) {
                  uint64_t v38 = &v79;
                }
                else {
                  uint64_t v38 = (std::stringbuf::string_type *)v79.__r_.__value_.__r.__words[0];
                }
                *(_DWORD *)v89 = 136315394;
                *(void *)&v89[4] = v37;
                *(_WORD *)&v89[12] = 2080;
                *(void *)&v89[14] = v38;
                _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "   Key: %s Value: %s\n",  v89,  0x16u);
                if (SHIBYTE(v76[0]) < 0) {
                  operator delete(*(void **)buf);
                }
              }

              uint64_t v39 = (void *)v34[1];
              if (v39)
              {
                do
                {
                  uint64_t v40 = v39;
                  uint64_t v39 = (void *)*v39;
                }

                while (v39);
              }

              else
              {
                do
                {
                  uint64_t v40 = (void *)v34[2];
                  BOOL v15 = *v40 == (void)v34;
                  v34 = v40;
                }

                while (!v15);
              }

              v34 = v40;
            }

            while (v40 != (void *)(v22 + 48));
          }

          *(_OWORD *)&v79.__r_.__value_.__r.__words[1] = 0uLL;
          v79.__r_.__value_.__r.__words[0] = (std::string::size_type)&v79.__r_.__value_.__l.__size_;
          v84[0] = *(unsigned __int8 ***)(v22 + 40);
          v87 = (char **)v80;
          v88 = (unsigned __int8 **)(v22 + 48);
          v86 = &v81;
          *(void *)v89 = &v79;
          *(void *)&v89[8] = &v79.__r_.__value_.__l.__size_;
          sub_6934( v84,  &v88,  (unsigned __int8 ***)&v87,  (unsigned __int8 ***)&v86,  (uint64_t *)v89,  (uint64_t)&v85,  (uint64_t)buf);
          std::string::size_type v41 = v79.__r_.__value_.__r.__words[0];
          if ((std::string::size_type *)v79.__r_.__value_.__l.__data_ != &v79.__r_.__value_.__r.__words[1])
          {
            do
            {
              *(_OWORD *)std::stringbuf::string_type __p = 0u;
              __int128 v78 = 0u;
              *(_OWORD *)__int128 buf = 0u;
              *(_OWORD *)v76 = 0u;
              sub_5730((uint64_t)buf, 1, 0, a3, (char **)(v41 + 32), (char **)(v41 + 56));
              BTD2DPlugin::_QueueServiceEvent(*(void *)(a1 + 8), (uint64_t)buf);
              if (__p[1])
              {
                *(void **)&__int128 v78 = __p[1];
                operator delete(__p[1]);
              }

              if (v76[0])
              {
                v76[1] = v76[0];
                operator delete(v76[0]);
              }

              uint64_t v42 = *(std::stringbuf::string_type **)(v41 + 8);
              if (v42)
              {
                do
                {
                  v43 = v42;
                  uint64_t v42 = (std::stringbuf::string_type *)v42->__r_.__value_.__r.__words[0];
                }

                while (v42);
              }

              else
              {
                do
                {
                  v43 = *(std::stringbuf::string_type **)(v41 + 16);
                  BOOL v15 = v43->__r_.__value_.__r.__words[0] == v41;
                  std::string::size_type v41 = (std::string::size_type)v43;
                }

                while (!v15);
              }

              std::string::size_type v41 = (std::string::size_type)v43;
            }

            while (v43 != (std::stringbuf::string_type *)&v79.__r_.__value_.__r.__words[1]);
          }

          *(void *)&v89[8] = 0LL;
          *(void *)&v89[16] = 0LL;
          v44 = *(unsigned __int8 ***)(v22 + 40);
          v88 = v80;
          *(void *)v89 = &v89[8];
          v86 = (char **)v44;
          v87 = &v81;
          v84[1] = (unsigned __int8 **)&v89[8];
          v85 = (unsigned __int8 **)(v22 + 48);
          v84[0] = (unsigned __int8 **)v89;
          sub_6934( &v88,  (unsigned __int8 ***)&v87,  (unsigned __int8 ***)&v86,  &v85,  (uint64_t *)v84,  (uint64_t)&v83,  (uint64_t)buf);
          v33 = (uint64_t **)(a1 + 136);
          unint64_t v45 = *(char ***)v89;
          if (*(_BYTE **)v89 != &v89[8])
          {
            do
            {
              *(_OWORD *)std::stringbuf::string_type __p = 0u;
              __int128 v78 = 0u;
              *(_OWORD *)__int128 buf = 0u;
              *(_OWORD *)v76 = 0u;
              sub_5730((uint64_t)buf, 0, 0, a3, v45 + 4, v45 + 7);
              BTD2DPlugin::_QueueServiceEvent(*(void *)(a1 + 8), (uint64_t)buf);
              if (__p[1])
              {
                *(void **)&__int128 v78 = __p[1];
                operator delete(__p[1]);
              }

              if (v76[0])
              {
                v76[1] = v76[0];
                operator delete(v76[0]);
              }

              int v46 = v45[1];
              if (v46)
              {
                do
                {
                  v47 = (char **)v46;
                  int v46 = *(char **)v46;
                }

                while (v46);
              }

              else
              {
                do
                {
                  v47 = (char **)v45[2];
                  BOOL v15 = *v47 == (char *)v45;
                  unint64_t v45 = v47;
                }

                while (!v15);
              }

              unint64_t v45 = v47;
            }

            while (v47 != (char **)&v89[8]);
          }

          sub_5CD8((uint64_t **)(a1 + 136), v22);
          sub_601C((uint64_t)v89, *(void **)&v89[8]);
          sub_601C((uint64_t)&v79, (void *)v79.__r_.__value_.__l.__size_);
        }

        *(void *)__int128 buf = a3;
        v51 = sub_5680(v33, (unint64_t *)buf);
      }
    }

    sub_601C((uint64_t)&v80, v81);
    v81 = 0LL;
    uint64_t v82 = 0LL;
    v80 = (unsigned __int8 **)&v81;
    v53 = *(void **)(a1 + 112);
    uint64_t v74 = a1 + 112;
    v54 = (void *)(a1 + 120);
    if (v53 != (void *)(a1 + 120))
    {
      do
      {
        BTBrowseMgr::_GetServiceInstancesOfType(v52, a3, v53 + 4, (uint64_t **)&v80);
        v55 = (void *)v53[1];
        if (v55)
        {
          do
          {
            v56 = v55;
            v55 = (void *)*v55;
          }

          while (v55);
        }

        else
        {
          do
          {
            v56 = (void *)v53[2];
            BOOL v15 = *v56 == (void)v53;
            v53 = v56;
          }

          while (!v15);
        }

        v53 = v56;
      }

      while (v56 != v54);
      v57 = (uint64_t *)v80;
      if (v80 != (unsigned __int8 **)&v81)
      {
        v58 = (uint64_t **)(v73 + 136);
        do
        {
          v59 = sub_5EFC(v74, (unsigned __int8 **)v57 + 4);
          v60 = v59;
          if (v54 != v59)
          {
            v61 = sub_5EFC((uint64_t)(v59 + 7), (unsigned __int8 **)v57 + 7);
            if (v60 + 8 != v61)
            {
              v62 = v60 + 4;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
              {
                v63 = v58;
                sub_3D58(v62, (std::stringbuf::string_type *)buf);
                int v64 = SHIBYTE(v76[0]);
                v65 = *(uint8_t **)buf;
                sub_3D58(v61 + 4, &v79);
                v66 = buf;
                if (v64 < 0) {
                  v66 = v65;
                }
                v67 = &v79;
                if ((v79.__r_.__value_.__s.__size_ & 0x80u) != 0) {
                  v67 = (std::stringbuf::string_type *)v79.__r_.__value_.__r.__words[0];
                }
                *(_DWORD *)v89 = 136315394;
                *(void *)&v89[4] = v66;
                *(_WORD *)&v89[12] = 2080;
                *(void *)&v89[14] = v67;
                _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Resolved new service - Key: %s Value %s\n",  v89,  0x16u);
                v58 = v63;
                if (SHIBYTE(v76[0]) < 0) {
                  operator delete(*(void **)buf);
                }
              }

              *(void *)__int128 buf = a3;
              v68 = sub_5680(v58, (unint64_t *)buf);
              sub_6070(v68, (unsigned __int8 **)v57 + 4, (char **)v57 + 4);
              *(_OWORD *)std::stringbuf::string_type __p = 0u;
              __int128 v78 = 0u;
              *(_OWORD *)__int128 buf = 0u;
              *(_OWORD *)v76 = 0u;
              sub_5730((uint64_t)buf, 2, 0, a3, (char **)v62, (char **)v61 + 4);
              BTD2DPlugin::_QueueServiceEvent(*(void *)(v73 + 8), (uint64_t)buf);
              if (__p[1])
              {
                *(void **)&__int128 v78 = __p[1];
                operator delete(__p[1]);
              }

              if (v76[0])
              {
                v76[1] = v76[0];
                operator delete(v76[0]);
              }
            }
          }

          v69 = (char *)v57[1];
          if (v69)
          {
            do
            {
              v70 = (char **)v69;
              v69 = *(char **)v69;
            }

            while (v69);
          }

          else
          {
            do
            {
              v70 = (char **)v57[2];
              BOOL v15 = *v70 == (char *)v57;
              v57 = (uint64_t *)v70;
            }

            while (!v15);
          }

          v57 = (uint64_t *)v70;
        }

        while (v70 != &v81);
      }
    }

    sub_601C((uint64_t)&v80, v81);
    int v6 = v72;
  }

  return pthread_mutex_unlock(v6);
}

void sub_5588( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20, char a21, char a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, void *a30, uint64_t a31, char a32, void *a33)
{
}

uint64_t **sub_5680(uint64_t **a1, unint64_t *a2)
{
  uint64_t v4 = a1 + 1;
  int v3 = a1[1];
  unint64_t v5 = *a2;
  if (v3)
  {
    while (1)
    {
      while (1)
      {
        int v6 = (uint64_t **)v3;
        unint64_t v7 = v3[4];
        if (v5 >= v7) {
          break;
        }
        int v3 = *v6;
        uint64_t v4 = v6;
        if (!*v6) {
          goto LABEL_9;
        }
      }

      if (v7 >= v5) {
        break;
      }
      int v3 = v6[1];
      if (!v3)
      {
        uint64_t v4 = v6 + 1;
        goto LABEL_9;
      }
    }
  }

  else
  {
    int v6 = a1 + 1;
LABEL_9:
    uint64_t v8 = (uint64_t *)operator new(0x40uLL);
    v8[7] = 0LL;
    v8[6] = 0LL;
    v8[4] = v5;
    v8[5] = (uint64_t)(v8 + 6);
    sub_2760(a1, (uint64_t)v6, v4, v8);
    int v6 = (uint64_t **)v8;
  }

  return v6 + 5;
}

uint64_t sub_5730(uint64_t a1, int a2, int a3, uint64_t a4, char **a5, char **a6)
{
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = 0LL;
  sub_24FC((char *)(a1 + 16), *a5, a5[1], a5[1] - *a5);
  *(void *)(a1 + 40) = 0LL;
  *(void *)(a1 + 48) = 0LL;
  *(void *)(a1 + 56) = 0LL;
  sub_24FC((char *)(a1 + 40), *a6, a6[1], a6[1] - *a6);
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a3;
  *(void *)(a1 + 8) = a4;
  return a1;
}

void sub_57AC(_Unwind_Exception *exception_object)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 24) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(exception_object);
}

uint64_t sub_57C8(uint64_t a1)
{
  uint64_t v2 = a1 + 8;
  *(void *)a1 = v3;
  *(void *)(a1 + *(void *)(v3 - 24)) = v4;
  unint64_t v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24LL));
  std::ios_base::init(v5, (void *)(a1 + 8));
  v5[1].__vftable = 0LL;
  v5[1].__fmtflags_ = -1;
  std::streambuf::basic_streambuf(v2);
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_588C(_Unwind_Exception *a1)
{
}

uint64_t sub_58B8(uint64_t a1)
{
  uint64_t v3 = a1 + 8;
  std::streambuf::~streambuf(v3);
  std::ios::~ios(a1 + 112);
  return a1;
}

void sub_593C(_Unwind_Exception *a1)
{
}

void *sub_596C(void *a1, uint64_t a2, uint64_t a3)
{
  v13[0] = 0LL;
  v13[1] = 0LL;
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
      BOOL v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
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
    if (!sub_5AD8(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear( (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)),  *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24LL) + 32) | 5);
    }
  }

  std::ostream::sentry::~sentry(v13);
  return a1;
}

void sub_5A78( void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
}

void sub_5AC4(_Unwind_Exception *a1)
{
}

uint64_t sub_5AD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
      __p[0] = 0LL;
      __p[1] = 0LL;
      uint64_t v18 = 0LL;
      sub_5C1C(__p, v12, __c);
      uint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96LL))(v6, v13, v12);
      if (SHIBYTE(v18) < 0) {
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

void sub_5C00( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_5C1C(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_5CC4();
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

void sub_5CC4()
{
}

uint64_t *sub_5CD8(uint64_t **a1, uint64_t a2)
{
  uint64_t v3 = sub_2BF4(a1, (uint64_t *)a2);
  sub_601C(a2 + 40, *(void **)(a2 + 48));
  operator delete((void *)a2);
  return v3;
}

void *sub_5D14(uint64_t a1, void *a2, unsigned __int8 **a3)
{
  unint64_t v5 = *(void **)(a1 + 8);
  uint64_t result = (void *)(a1 + 8);
  uint64_t v4 = v5;
  if (v5)
  {
    uint64_t v6 = a3[1];
    do
    {
      while (1)
      {
        size_t v7 = v4;
        size_t v8 = (unsigned __int8 *)v4[4];
        int v9 = (unsigned __int8 *)v7[5];
        if (v8 != v9) {
          break;
        }
LABEL_12:
        if (*a3 != v6)
        {
          uint64_t v15 = (uint64_t)(*a3 + 1);
          while (v8 != v9)
          {
            unsigned int v16 = *v8;
            unsigned int v17 = *(unsigned __int8 *)(v15 - 1);
            if (v16 < v17) {
              break;
            }
            ++v8;
            if (v17 < v16 || v15++ == (void)v6) {
              goto LABEL_27;
            }
          }

          uint64_t result = v7 + 1;
          uint64_t v4 = (void *)v7[1];
          if (v4) {
            continue;
          }
        }

        goto LABEL_27;
      }

      BOOL v10 = v8 + 1;
      uint64_t v11 = *a3;
      while (v11 != v6)
      {
        unsigned int v12 = *v11;
        unsigned int v13 = *(v10 - 1);
        if (v12 < v13) {
          break;
        }
        ++v11;
        if (v13 < v12 || v10++ == v9) {
          goto LABEL_12;
        }
      }

      uint64_t v4 = (void *)*v7;
      uint64_t result = v7;
    }

    while (*v7);
  }

  else
  {
    size_t v7 = result;
  }

LABEL_27:
  *a2 = v7;
  return result;
}

char *sub_5DD4@<X0>(uint64_t a1@<X0>, char **a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  *a3 = 0LL;
  a3[2] = 0LL;
  a3[1] = 0LL;
  uint64_t v6 = a3 + 1;
  size_t v7 = operator new(0x40uLL);
  *a3 = v7;
  void *v6 = v5;
  *((_WORD *)a3 + std::ostream::~ostream(v2, v3 + 8) = 0;
  *((void *)v7 + 5) = 0LL;
  *((void *)v7 + 6) = 0LL;
  *((void *)v7 + 4) = 0LL;
  uint64_t result = sub_24FC((char *)v7 + 32, *a2, a2[1], a2[1] - *a2);
  *((_WORD *)a3 + std::ostream::~ostream(v2, v3 + 8) = 257;
  *((_DWORD *)v7 + 14) = 0;
  return result;
}

void sub_5E50(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0LL;
  sub_5E6C(v2, v3);
  _Unwind_Resume(a1);
}

void sub_5E6C(uint64_t a1, void *__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    uint64_t v3 = (void *)__p[4];
    if (v3)
    {
      __p[5] = v3;
      operator delete(v3);
    }
  }

  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

uint64_t sub_5EB8(uint64_t **a1, unsigned __int8 **a2)
{
  uint64_t v3 = sub_5EFC((uint64_t)a1, a2);
  sub_5F78(a1, v3);
  return 1LL;
}

void *sub_5EFC(uint64_t a1, unsigned __int8 **a2)
{
  uint64_t v3 = (void *)(a1 + 8);
  uint64_t result = sub_5FB8(a1, a2, *(void **)(a1 + 8), (void *)(a1 + 8));
  if (v3 != result)
  {
    uint64_t v6 = result[4];
    uint64_t v5 = result[5];
    if (v6 == v5) {
      return result;
    }
    size_t v7 = *a2;
    uint64_t v8 = v6 + 1;
    while (v7 != a2[1])
    {
      unsigned int v9 = *v7;
      unsigned int v10 = *(unsigned __int8 *)(v8 - 1);
      if (v9 < v10) {
        break;
      }
      ++v7;
      if (v10 < v9 || v8++ == v5) {
        return result;
      }
    }
  }

  return v3;
}

uint64_t *sub_5F78(uint64_t **a1, uint64_t *a2)
{
  uint64_t v3 = sub_2BF4(a1, a2);
  uint64_t v4 = (void *)a2[4];
  if (v4)
  {
    a2[5] = (uint64_t)v4;
    operator delete(v4);
  }

  operator delete(a2);
  return v3;
}

void *sub_5FB8(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t result = a4;
  if (a3)
  {
    uint64_t v5 = a2[1];
    do
    {
      if (*a2 == v5)
      {
LABEL_12:
        uint64_t result = a3;
      }

      else
      {
        uint64_t v6 = (unsigned __int8 *)a3[4];
        uint64_t v7 = *a2 + 1LL;
        while (v6 != (unsigned __int8 *)a3[5])
        {
          unsigned int v8 = *v6;
          unsigned int v9 = *(unsigned __int8 *)(v7 - 1);
          if (v8 < v9) {
            break;
          }
          ++v6;
          if (v9 < v8 || v7++ == v5) {
            goto LABEL_12;
          }
        }

        ++a3;
      }

      a3 = (void *)*a3;
    }

    while (a3);
  }

  return result;
}

void sub_601C(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_601C(a1, *a2);
    sub_601C(a1, a2[1]);
    sub_2ACC((uint64_t)(a2 + 4));
    operator delete(a2);
  }

uint64_t *sub_6070(uint64_t **a1, unsigned __int8 **a2, char **a3)
{
  uint64_t v8 = 0LL;
  uint64_t v5 = (uint64_t **)sub_2634((uint64_t)a1, &v8, a2);
  uint64_t result = *v5;
  if (!*v5)
  {
    memset(v7, 0, sizeof(v7));
    sub_60F8((uint64_t)a1, a3, v7);
    sub_2760(a1, v8, v5, v7[0]);
    return v7[0];
  }

  return result;
}

uint64_t sub_60F8@<X0>(uint64_t a1@<X0>, char **a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  *a3 = 0LL;
  a3[2] = 0LL;
  a3[1] = 0LL;
  uint64_t v6 = a3 + 1;
  uint64_t v7 = operator new(0x50uLL);
  *a3 = v7;
  void *v6 = v5;
  *((_BYTE *)a3 + 16) = 0;
  uint64_t result = sub_2880((uint64_t)v7 + 32, a2);
  *((_BYTE *)a3 + 16) = 1;
  return result;
}

void sub_6168(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0LL;
  sub_6184(v2, v3);
  _Unwind_Resume(a1);
}

void sub_6184(uint64_t a1, void *__p)
{
  if (*(_BYTE *)(a1 + 8)) {
    sub_2ACC((uint64_t)__p + 32);
  }
  if (__p) {
    operator delete(__p);
  }
}

void sub_61C8(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_61C8(a1, *a2);
    sub_61C8(a1, a2[1]);
    sub_601C((uint64_t)(a2 + 5), (void *)a2[6]);
    operator delete(a2);
  }

void sub_6214(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_6214(a1, *a2);
    sub_6214(a1, a2[1]);
    uint64_t v4 = (void *)a2[4];
    if (v4)
    {
      a2[5] = v4;
      operator delete(v4);
    }

    operator delete(a2);
  }

char *sub_6264@<X0>(uint64_t a1@<X0>, char **a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  *a3 = 0LL;
  a3[2] = 0LL;
  a3[1] = 0LL;
  uint64_t v6 = a3 + 1;
  uint64_t v7 = (char *)operator new(0x50uLL);
  *a3 = v7;
  void *v6 = v5;
  *((_WORD *)a3 + std::ostream::~ostream(v2, v3 + 8) = 0;
  *((void *)v7 + 5) = 0LL;
  *((void *)v7 + 6) = 0LL;
  *((void *)v7 + 4) = 0LL;
  uint64_t result = sub_24FC(v7 + 32, *a2, a2[1], a2[1] - *a2);
  *((_WORD *)a3 + std::ostream::~ostream(v2, v3 + 8) = 257;
  *((void *)v7 + std::ostream::~ostream(v2, v3 + 8) = 0LL;
  *((void *)v7 + 9) = 0LL;
  *((void *)v7 + 7) = v7 + 64;
  return result;
}

void sub_62E4(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0LL;
  sub_6300(v3, v2);
  _Unwind_Resume(a1);
}

void sub_6300(uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 9)) {
    sub_6214((uint64_t)(__p + 7), __p[8]);
  }
  if (*(_BYTE *)(a1 + 8))
  {
    uint64_t v4 = __p[4];
    if (v4)
    {
      __p[5] = v4;
      operator delete(v4);
    }
  }

  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

uint64_t **sub_6364(uint64_t **result, char **a2, char **a3)
{
  uint64_t v5 = result;
  if (result[2])
  {
    uint64_t v6 = *result;
    uint64_t v7 = result[1];
    char *result = (uint64_t *)(result + 1);
    v7[2] = 0LL;
    result[1] = 0LL;
    result[2] = 0LL;
    if (v6[1]) {
      uint64_t v8 = (uint64_t *)v6[1];
    }
    else {
      uint64_t v8 = v6;
    }
    uint64_t v15 = result;
    unsigned int v16 = v8;
    unsigned int v17 = v8;
    if (v8)
    {
      unsigned int v16 = sub_66AC((uint64_t)v8);
      if (a2 != a3)
      {
        unsigned int v9 = a2;
        do
        {
          if (v8 != (uint64_t *)v9)
          {
            sub_64F4(v8 + 4, v9[4], v9[5], v9[5] - v9[4]);
            uint64_t v8 = v17;
          }

          uint64_t v18 = 0LL;
          unsigned int v10 = (uint64_t **)sub_6624((uint64_t)v5, &v18, (unsigned __int8 **)v8 + 4);
          sub_2760(v5, v18, v10, v8);
          unsigned int v17 = v16;
          if (v16) {
            unsigned int v16 = sub_66AC((uint64_t)v16);
          }
          uint64_t v11 = v9[1];
          if (v11)
          {
            do
            {
              a2 = (char **)v11;
              uint64_t v11 = *(char **)v11;
            }

            while (v11);
          }

          else
          {
            do
            {
              a2 = (char **)v9[2];
              BOOL v12 = *a2 == (char *)v9;
              unsigned int v9 = a2;
            }

            while (!v12);
          }

          uint64_t v8 = v17;
          if (v17) {
            BOOL v12 = a2 == a3;
          }
          else {
            BOOL v12 = 1;
          }
          unsigned int v9 = a2;
        }

        while (!v12);
      }
    }

    uint64_t result = (uint64_t **)sub_6700((uint64_t)&v15);
  }

  if (a2 != a3)
  {
    do
    {
      uint64_t result = (uint64_t **)sub_6754(v5, a2 + 4);
      unsigned int v13 = a2[1];
      if (v13)
      {
        do
        {
          uint64_t v14 = (char **)v13;
          unsigned int v13 = *(char **)v13;
        }

        while (v13);
      }

      else
      {
        do
        {
          uint64_t v14 = (char **)a2[2];
          BOOL v12 = *v14 == (char *)a2;
          a2 = v14;
        }

        while (!v12);
      }

      a2 = v14;
    }

    while (v14 != a3);
  }

  return result;
}

void sub_64E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *sub_64F4(void *result, char *__src, char *a3, unint64_t a4)
{
  uint64_t v6 = __src;
  uint64_t v7 = result;
  unint64_t v8 = result[2];
  unsigned int v9 = (_BYTE *)*result;
  if (v8 - *result >= a4)
  {
    uint64_t v14 = (_BYTE *)result[1];
    size_t v15 = v14 - v9;
    if (v14 - v9 >= a4)
    {
      size_t v19 = a3 - __src;
      if (v19) {
        uint64_t result = memmove((void *)*result, __src, v19);
      }
      BOOL v12 = &v9[v19];
    }

    else
    {
      unsigned int v16 = &__src[v15];
      if (v14 != v9)
      {
        uint64_t result = memmove((void *)*result, __src, v15);
        unsigned int v9 = (_BYTE *)v7[1];
      }

      BOOL v12 = v9;
      if (v16 != a3)
      {
        BOOL v12 = v9;
        unsigned int v17 = v9;
        do
        {
          char v18 = *v16++;
          *v17++ = v18;
          ++v12;
        }

        while (v16 != a3);
      }
    }
  }

  else
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      unint64_t v8 = 0LL;
      *uint64_t v7 = 0LL;
      v7[1] = 0LL;
      v7[2] = 0LL;
    }

    if ((a4 & 0x8000000000000000LL) != 0) {
      sub_25AC();
    }
    uint64_t v10 = 2 * v8;
    if (2 * v8 <= a4) {
      uint64_t v10 = a4;
    }
    if (v8 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v11 = v10;
    }
    uint64_t result = sub_256C(v7, v11);
    BOOL v12 = (_BYTE *)v7[1];
    while (v6 != a3)
    {
      char v13 = *v6++;
      *v12++ = v13;
    }
  }

  v7[1] = v12;
  return result;
}

void *sub_6624(uint64_t a1, void *a2, unsigned __int8 **a3)
{
  uint64_t v5 = *(void **)(a1 + 8);
  uint64_t v3 = (void *)(a1 + 8);
  uint64_t v4 = v5;
  if (v5)
  {
    do
    {
      while (1)
      {
        uint64_t v3 = v4;
        uint64_t v6 = v4[4];
        uint64_t v7 = v3[5];
        if (v6 == v7) {
          break;
        }
        uint64_t v8 = v6 + 1;
        unsigned int v9 = *a3;
        while (v9 != a3[1])
        {
          unsigned int v10 = *v9;
          unsigned int v11 = *(unsigned __int8 *)(v8 - 1);
          if (v10 < v11) {
            break;
          }
          ++v9;
          if (v11 < v10 || v8++ == v7) {
            goto LABEL_11;
          }
        }

        uint64_t v4 = (void *)*v3;
        char v13 = v3;
        if (!*v3) {
          goto LABEL_16;
        }
      }

LABEL_11:
      uint64_t v4 = (void *)v3[1];
    }

    while (v4);
    char v13 = v3 + 1;
  }

  else
  {
    char v13 = v3;
  }

LABEL_16:
  *a2 = v3;
  return v13;
}

void *sub_66AC(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 16);
  if (result)
  {
    uint64_t v3 = (void *)*result;
    if (*result == a1)
    {
      void *result = 0LL;
      while (1)
      {
        uint64_t v4 = (void *)result[1];
        if (!v4) {
          break;
        }
        do
        {
          uint64_t result = v4;
          uint64_t v4 = (void *)*v4;
        }

        while (v4);
      }
    }

    else
    {
      for (result[1] = 0LL; v3; uint64_t v3 = (void *)result[1])
      {
        do
        {
          uint64_t result = v3;
          uint64_t v3 = (void *)*v3;
        }

        while (v3);
      }
    }
  }

  return result;
}

uint64_t sub_6700(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)v2[2];
    if (v3)
    {
      do
      {
        uint64_t v2 = v3;
        uint64_t v3 = (void *)v3[2];
      }

      while (v3);
      *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = v2;
    }

    sub_6214(*(void *)a1, v2);
  }

  return a1;
}

uint64_t *sub_6754(uint64_t **a1, char **a2)
{
  uint64_t v5 = 0LL;
  uint64_t v3 = (uint64_t **)sub_6624((uint64_t)a1, &v5, (unsigned __int8 **)v6[0] + 4);
  sub_2760(a1, v5, v3, v6[0]);
  return v6[0];
}

void sub_67B4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    sub_5E6C((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

char *sub_67D8@<X0>(uint64_t a1@<X0>, char **a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  *a3 = 0LL;
  a3[2] = 0LL;
  a3[1] = 0LL;
  uint64_t v6 = a3 + 1;
  uint64_t v7 = operator new(0x38uLL);
  *a3 = v7;
  void *v6 = v5;
  *((_BYTE *)a3 + 16) = 0;
  *((void *)v7 + 5) = 0LL;
  *((void *)v7 + 6) = 0LL;
  *((void *)v7 + 4) = 0LL;
  uint64_t result = sub_24FC((char *)v7 + 32, *a2, a2[1], a2[1] - *a2);
  *((_BYTE *)a3 + 16) = 1;
  return result;
}

void sub_6850(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0LL;
  sub_5E6C(v2, v3);
  _Unwind_Resume(a1);
}

uint64_t *sub_686C(uint64_t **a1, unsigned __int8 **a2, char **a3)
{
  uint64_t v8 = 0LL;
  uint64_t v5 = (uint64_t **)sub_5D14((uint64_t)a1, &v8, a2);
  uint64_t result = *v5;
  if (!*v5)
  {
    memset(v7, 0, sizeof(v7));
    sub_67D8((uint64_t)a1, a3, v7);
    sub_2760(a1, v8, v5, v7[0]);
    return v7[0];
  }

  return result;
}

void sub_68F4(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = v2;
    operator delete(v2);
  }

double sub_6934@<D0>( unsigned __int8 ***a1@<X0>, unsigned __int8 ***a2@<X1>, unsigned __int8 ***a3@<X2>, unsigned __int8 ***a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  unsigned int v11 = *a1;
  BOOL v12 = *a2;
  if (*a1 == *a2)
  {
LABEL_31:
    BOOL v12 = v11;
    goto LABEL_32;
  }

  for (i = *a3; *a3 != *a4; i = *a3)
  {
    if (sub_27B4(a6, v11 + 4, i + 4))
    {
      sub_6B0C((uint64_t)a5, *a1 + 4);
      unsigned int v17 = *a1;
      char v18 = (*a1)[1];
      if (v18)
      {
        do
        {
          size_t v19 = (unsigned __int8 **)v18;
          char v18 = *(unsigned __int8 **)v18;
        }

        while (v18);
      }

      else
      {
        do
        {
          size_t v19 = (unsigned __int8 **)v17[2];
          BOOL v20 = *v19 == (unsigned __int8 *)v17;
          unsigned int v17 = v19;
        }

        while (!v20);
      }

      *a1 = v19;
    }

    else
    {
      if (sub_27B4(a6, *a3 + 4, *a1 + 4))
      {
        uint64_t v21 = *a3;
        uint64_t v22 = (*a3)[1];
        if (v22)
        {
          do
          {
            unint64_t v23 = (unsigned __int8 **)v22;
            uint64_t v22 = *(unsigned __int8 **)v22;
          }

          while (v22);
        }

        else
        {
          do
          {
            unint64_t v23 = (unsigned __int8 **)v21[2];
            BOOL v20 = *v23 == (unsigned __int8 *)v21;
            uint64_t v21 = v23;
          }

          while (!v20);
        }
      }

      else
      {
        BOOL v24 = *a1;
        uint64_t v25 = (*a1)[1];
        if (v25)
        {
          do
          {
            unint64_t v26 = (unsigned __int8 **)v25;
            uint64_t v25 = *(unsigned __int8 **)v25;
          }

          while (v25);
        }

        else
        {
          do
          {
            unint64_t v26 = (unsigned __int8 **)v24[2];
            BOOL v20 = *v26 == (unsigned __int8 *)v24;
            BOOL v24 = v26;
          }

          while (!v20);
        }

        *a1 = v26;
        int v27 = *a3;
        uint64_t v28 = (*a3)[1];
        if (v28)
        {
          do
          {
            unint64_t v23 = (unsigned __int8 **)v28;
            uint64_t v28 = *(unsigned __int8 **)v28;
          }

          while (v28);
        }

        else
        {
          do
          {
            unint64_t v23 = (unsigned __int8 **)v27[2];
            BOOL v20 = *v23 == (unsigned __int8 *)v27;
            int v27 = v23;
          }

          while (!v20);
        }
      }

      *a3 = v23;
    }

    unsigned int v11 = *a1;
    BOOL v12 = *a2;
    if (*a1 == *a2) {
      goto LABEL_31;
    }
  }

LABEL_32:
  uint64_t v29 = *a5;
  uint64_t v30 = a5[1];
  uint64_t v32 = 0LL;
  __int128 v33 = 0uLL;
  sub_6D98(v11, v12, v29, v30, (uint64_t)&v32);
  *(void *)a7 = v32;
  double result = *(double *)&v33;
  *(_OWORD *)(a7 + std::ostream::~ostream(v2, v3 + 8) = v33;
  return result;
}

uint64_t sub_6B0C(uint64_t a1, unsigned __int8 **a2)
{
  uint64_t v3 = sub_6B74(*(uint64_t ***)a1, *(uint64_t **)(a1 + 8), a2, (char **)a2);
  *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = v3;
  uint64_t v4 = (uint64_t *)v3[1];
  if (v4)
  {
    do
    {
      uint64_t v5 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }

    while (v4);
  }

  else
  {
    do
    {
      uint64_t v5 = (uint64_t *)v3[2];
      BOOL v6 = *v5 == (void)v3;
      uint64_t v3 = v5;
    }

    while (!v6);
  }

  *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = v5;
  return a1;
}

uint64_t *sub_6B74(uint64_t **a1, uint64_t *a2, unsigned __int8 **a3, char **a4)
{
  uint64_t v9 = 0LL;
  unsigned int v10 = 0LL;
  BOOL v6 = (uint64_t **)sub_6C00(a1, a2, &v10, &v9, a3);
  double result = *v6;
  if (!*v6)
  {
    memset(v8, 0, sizeof(v8));
    sub_60F8((uint64_t)a1, a4, v8);
    sub_2760(a1, (uint64_t)v10, v6, v8[0]);
    return v8[0];
  }

  return result;
}

unsigned __int8 **sub_6C00( void *a1, uint64_t *a2, unsigned __int8 ***a3, uint64_t *a4, unsigned __int8 **a5)
{
  uint64_t v9 = (unsigned __int8 **)(a1 + 1);
  if (a1 + 1 == a2 || sub_27B4((uint64_t)(a1 + 2), a5, (unsigned __int8 **)a2 + 4))
  {
    if ((uint64_t *)*a1 == a2)
    {
      BOOL v12 = (unsigned __int8 **)a2;
LABEL_16:
      if (*a2)
      {
        *a3 = v12;
        return v12 + 1;
      }

      else
      {
        *a3 = (unsigned __int8 **)a2;
        return (unsigned __int8 **)a2;
      }
    }

    unsigned int v11 = (unsigned __int8 **)*a2;
    if (*a2)
    {
      do
      {
        BOOL v12 = v11;
        unsigned int v11 = (unsigned __int8 **)v11[1];
      }

      while (v11);
    }

    else
    {
      unsigned int v16 = (unsigned __int8 *)a2;
      do
      {
        BOOL v12 = (unsigned __int8 **)*((void *)v16 + 2);
        BOOL v17 = *v12 == v16;
        unsigned int v16 = (unsigned __int8 *)v12;
      }

      while (v17);
    }

    return (unsigned __int8 **)sub_2634((uint64_t)a1, a3, a5);
  }

  if (sub_27B4((uint64_t)(a1 + 2), (unsigned __int8 **)a2 + 4, a5))
  {
    a4 = a2 + 1;
    uint64_t v13 = a2[1];
    if (v13)
    {
      uint64_t v14 = (unsigned __int8 *)a2[1];
      do
      {
        size_t v15 = (unsigned __int8 **)v14;
        uint64_t v14 = *(unsigned __int8 **)v14;
      }

      while (v14);
    }

    else
    {
      char v18 = (unsigned __int8 **)a2;
      do
      {
        size_t v15 = (unsigned __int8 **)v18[2];
        BOOL v17 = *v15 == (unsigned __int8 *)v18;
        char v18 = v15;
      }

      while (!v17);
    }

    if (v15 != v9)
    {
      uint64_t v13 = *a4;
    }

    if (v13)
    {
      *a3 = v15;
      return v15;
    }

    else
    {
      *a3 = (unsigned __int8 **)a2;
    }

    return (unsigned __int8 **)a4;
  }

  *a3 = (unsigned __int8 **)a2;
  *a4 = (uint64_t)a2;
  return (unsigned __int8 **)a4;
}

double sub_6D98@<D0>( unsigned __int8 **a1@<X1>, unsigned __int8 **a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v5 = a1;
  *(void *)&__int128 v12 = a3;
  *((void *)&v12 + 1) = a4;
  if (a1 != a2)
  {
    do
    {
      sub_6B0C((uint64_t)&v12, v5 + 4);
      uint64_t v8 = v5[1];
      if (v8)
      {
        do
        {
          uint64_t v9 = (unsigned __int8 **)v8;
          uint64_t v8 = *(unsigned __int8 **)v8;
        }

        while (v8);
      }

      else
      {
        do
        {
          uint64_t v9 = (unsigned __int8 **)v5[2];
          BOOL v10 = *v9 == (unsigned __int8 *)v5;
          uint64_t v5 = v9;
        }

        while (!v10);
      }

      uint64_t v5 = v9;
    }

    while (v9 != a2);
    uint64_t v5 = a2;
  }

  *(void *)a5 = v5;
  double result = *(double *)&v12;
  *(_OWORD *)(a5 + std::ostream::~ostream(v2, v3 + 8) = v12;
  return result;
}

uint64_t **sub_6E2C(uint64_t **result, char **a2, char **a3)
{
  uint64_t v5 = result;
  if (result[2])
  {
    BOOL v6 = *result;
    uint64_t v7 = result[1];
    uint64_t *result = (uint64_t *)(result + 1);
    v7[2] = 0LL;
    result[1] = 0LL;
    result[2] = 0LL;
    if (v6[1]) {
      uint64_t v8 = (uint64_t *)v6[1];
    }
    else {
      uint64_t v8 = v6;
    }
    size_t v15 = result;
    unsigned int v16 = v8;
    BOOL v17 = (unsigned __int8 **)v8;
    if (v8)
    {
      unsigned int v16 = sub_66AC((uint64_t)v8);
      if (a2 != a3)
      {
        uint64_t v9 = a2;
        do
        {
          sub_6FB0((char **)v8 + 4, v9 + 4);
          uint64_t v18 = 0LL;
          BOOL v10 = (uint64_t **)sub_7000((uint64_t)v5, &v18, v17 + 4);
          sub_2760(v5, v18, v10, (uint64_t *)v17);
          BOOL v17 = (unsigned __int8 **)v16;
          if (v16) {
            unsigned int v16 = sub_66AC((uint64_t)v16);
          }
          unsigned int v11 = v9[1];
          if (v11)
          {
            do
            {
              a2 = (char **)v11;
              unsigned int v11 = *(char **)v11;
            }

            while (v11);
          }

          else
          {
            do
            {
              a2 = (char **)v9[2];
              BOOL v12 = *a2 == (char *)v9;
              uint64_t v9 = a2;
            }

            while (!v12);
          }

          uint64_t v8 = (uint64_t *)v17;
          if (v17) {
            BOOL v12 = a2 == a3;
          }
          else {
            BOOL v12 = 1;
          }
          uint64_t v9 = a2;
        }

        while (!v12);
      }
    }

    double result = (uint64_t **)sub_7078((uint64_t)&v15);
  }

  if (a2 != a3)
  {
    do
    {
      double result = (uint64_t **)sub_70CC(v5, a2 + 4);
      uint64_t v13 = a2[1];
      if (v13)
      {
        do
        {
          uint64_t v14 = (char **)v13;
          uint64_t v13 = *(char **)v13;
        }

        while (v13);
      }

      else
      {
        do
        {
          uint64_t v14 = (char **)a2[2];
          BOOL v12 = *v14 == (char *)a2;
          a2 = v14;
        }

        while (!v12);
      }

      a2 = v14;
    }

    while (v14 != a3);
  }

  return result;
}

void sub_6F9C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

char **sub_6FB0(char **a1, char **a2)
{
  if (a1 != a2)
  {
    sub_64F4(a1, *a2, a2[1], a2[1] - *a2);
    sub_64F4(a1 + 3, a2[3], a2[4], a2[4] - a2[3]);
  }

  return a1;
}

void *sub_7000(uint64_t a1, void *a2, unsigned __int8 **a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        uint64_t v5 = (void *)v4;
        uint64_t v4 = *v5;
        double result = v5;
        if (!*v5) {
          goto LABEL_9;
        }
      }

      uint64_t v4 = v5[1];
    }

    while (v4);
    double result = v5 + 1;
  }

  else
  {
    double result = (void *)(a1 + 8);
  }

LABEL_9:
  *a2 = v5;
  return result;
}

uint64_t sub_7078(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)v2[2];
    if (v3)
    {
      do
      {
        uint64_t v2 = v3;
        uint64_t v3 = (void *)v3[2];
      }

      while (v3);
      *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = v2;
    }

    sub_601C(*(void *)a1, v2);
  }

  return a1;
}

uint64_t *sub_70CC(uint64_t **a1, char **a2)
{
  uint64_t v5 = 0LL;
  uint64_t v3 = (uint64_t **)sub_7000((uint64_t)a1, &v5, (unsigned __int8 **)v6[0] + 4);
  sub_2760(a1, v5, v3, v6[0]);
  return v6[0];
}

void sub_712C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    sub_6184((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void sub_7150(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_715C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void BTInterestMgr::BluetoothAvailabilityChanged(BTInterestMgr *this, char a2)
{
  if (!*((_BYTE *)this + 16))
  {
    pthread_mutex_lock((pthread_mutex_t *)((char *)this + 24));
    *((void *)this + 12) = *((void *)this + 11);
    uint64_t v5 = (void **)*((void *)this + 15);
    unint64_t v6 = *((void *)this + 16) - (void)v5;
    if (v6)
    {
      uint64_t v7 = (void *)((char *)this + 152);
      unint64_t v8 = *((void *)this + 18);
      uint64_t v9 = &v5[v8 >> 9];
      uint64_t v10 = (uint64_t)*v9;
      uint64_t v11 = (uint64_t)*v9 + 8 * (v8 & 0x1FF);
      while ((void *)v11 != *(char **)((char *)v5 + (((*((void *)this + 19) + v8) >> 6) & 0x3FFFFFFFFFFFFF8LL))
                           + 8 * ((*((void *)this + 19) + v8) & 0x1FF))
      {
        v11 += 8LL;
        if (v11 - v10 == 4096)
        {
          uint64_t v12 = (uint64_t)v9[1];
          ++v9;
          uint64_t v10 = v12;
          uint64_t v11 = v12;
        }
      }
    }

    else
    {
      uint64_t v7 = (void *)((char *)this + 152);
    }

    *uint64_t v7 = 0LL;
    if (v6 >= 0x11)
    {
      do
      {
        operator delete(*v5);
        uint64_t v13 = *((void *)this + 16);
        uint64_t v5 = (void **)(*((void *)this + 15) + 8LL);
        *((void *)this + 15) = v5;
        unint64_t v6 = v13 - (void)v5;
      }

      while (v6 > 0x10);
    }

    if (v6 >> 3 == 1)
    {
      uint64_t v14 = 256LL;
    }

    else
    {
      if (v6 >> 3 != 2)
      {
LABEL_19:
        pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 24));
        return;
      }

      uint64_t v14 = 512LL;
    }

    *((void *)this + 1std::ostream::~ostream(v2, v3 + 8) = v14;
    goto LABEL_19;
  }

  int v3 = BTServiceAddCallbacksWithFilter(**((void **)this + 1), _btServiceEventCallback, 2048LL, this);
  if (v3)
  {
    int v4 = v3;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_A278(v4);
    }
  }

void _btServiceEventCallback(void *a1, int a2, int a3, int a4, int a5, BTInterestMgr *this)
{
  if (a3 == 1)
  {
    if (BTInterestMgr::_IsDeviceRetained(this, a1))
    {
      if (a4 == 12 && !a5)
      {
        BTInterestMgr::RemoveInterest(this, a1);
        uint64_t v10 = this;
        int v11 = 1;
        goto LABEL_11;
      }

      if (a4 != 2)
      {
        uint64_t v10 = this;
        int v11 = 1;
        goto LABEL_24;
      }
    }
  }

  else if (!a3 && BTInterestMgr::_IsDeviceRetained(this, a1))
  {
    if (a4 == 11 && !a5)
    {
      uint64_t v10 = this;
      int v11 = 0;
LABEL_11:
      uint64_t v12 = (uint64_t)a1;
      int v13 = 0;
LABEL_25:
      BTInterestMgr::ReportInterestEvent((uint64_t)v10, v11, v12, v13);
      return;
    }

    BOOL v14 = a4 == 1 && a5 == 0;
    BOOL v15 = v14;
    if (a4 && !v15)
    {
      BTInterestMgr::_RetryConnection(this, a1);
      uint64_t v10 = this;
      int v11 = 0;
LABEL_24:
      uint64_t v12 = (uint64_t)a1;
      int v13 = a5;
      goto LABEL_25;
    }
  }

uint64_t BTInterestMgr::Retain(BTInterestMgr *this, void *a2)
{
  int v4 = (pthread_mutex_t *)((char *)this + 24);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 24));
  uint64_t v5 = (void **)*((void *)this + 11);
  unint64_t v6 = (void **)*((void *)this + 12);
  uint64_t v7 = v5;
  if (v5 != v6)
  {
    while (*v7 != a2)
    {
      if (++v7 == v6)
      {
        uint64_t v7 = (void **)*((void *)this + 12);
        break;
      }
    }
  }

  if (v7 == v6)
  {
    unint64_t v8 = *((void *)this + 13);
    if ((unint64_t)v6 >= v8)
    {
      uint64_t v10 = v6 - v5;
      uint64_t v11 = v8 - (void)v5;
      uint64_t v12 = v11 >> 2;
      else {
        unint64_t v13 = v12;
      }
      if (v13) {
        BOOL v14 = (char *)sub_7D50((uint64_t)this + 104, v13);
      }
      else {
        BOOL v14 = 0LL;
      }
      BOOL v15 = &v14[8 * v10];
      unsigned int v16 = &v14[8 * v13];
      *(void *)BOOL v15 = a2;
      uint64_t v9 = v15 + 8;
      uint64_t v18 = (char *)*((void *)this + 11);
      BOOL v17 = (char *)*((void *)this + 12);
      if (v17 != v18)
      {
        do
        {
          uint64_t v19 = *((void *)v17 - 1);
          v17 -= 8;
          *((void *)v15 - 1) = v19;
          v15 -= 8;
        }

        while (v17 != v18);
        BOOL v17 = (char *)*((void *)this + 11);
      }

      *((void *)this + 11) = v15;
      *((void *)this + 12) = v9;
      *((void *)this + 13) = v16;
      if (v17) {
        operator delete(v17);
      }
    }

    else
    {
      uint64_t *v6 = a2;
      uint64_t v9 = v6 + 1;
    }

    *((void *)this + 12) = v9;
  }

  uint64_t v20 = pthread_mutex_unlock(v4);
  if (!*((_BYTE *)this + 16)) {
    return 0LL;
  }
  uint64_t v26 = 0LL;
  __chkstk_darwin(v20);
  uint64_t v21 = (void **)v25;
  bzero(v25, 0x800uLL);
  if (BTLocalDeviceGetConnectedDevices(*(void *)(*((void *)this + 1) + 8LL), v25, &v26, 256LL)
    || (uint64_t v24 = v26) == 0)
  {
LABEL_25:
    int v22 = BTDeviceConnectServices(a2, 2048LL);
    if (v22)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_A2F4((uint64_t)a2, v22);
      }
      return 1LL;
    }

    return 0LL;
  }

  while (*v21 != a2)
  {
    ++v21;
    if (!--v24) {
      goto LABEL_25;
    }
  }

  return 0LL;
}

uint64_t BTInterestMgr::Release(BTInterestMgr *this, void *a2)
{
  return 0LL;
}

uint64_t BTInterestMgr::RemoveInterest(BTInterestMgr *this, void *a2)
{
  int v4 = (pthread_mutex_t *)((char *)this + 24);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 24));
  unint64_t v6 = (void **)*((void *)this + 11);
  uint64_t v5 = (void **)*((void *)this + 12);
  if (v6 != v5)
  {
    while (*v6 != a2)
    {
      if (++v6 == v5)
      {
        unint64_t v6 = (void **)*((void *)this + 12);
        break;
      }
    }
  }

  int64_t v7 = (char *)v5 - (char *)(v6 + 1);
  if (v5 != v6 + 1) {
    memmove(v6, v6 + 1, (char *)v5 - (char *)(v6 + 1));
  }
  *((void *)this + 12) = (char *)v6 + v7;
  return pthread_mutex_unlock(v4);
}

void BTInterestMgr::ReportInterestEvent(uint64_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  *(_OWORD *)std::stringbuf::string_type __p = 0u;
  __int128 v9 = 0u;
  __int128 v6 = 0u;
  *(_OWORD *)int64_t v7 = 0u;
  if (a2) {
    int v5 = 4;
  }
  else {
    int v5 = 3;
  }
  sub_5730((uint64_t)&v6, v5, a4 != 0, a3, &v10, &v10);
  BTD2DPlugin::_QueueServiceEvent(*(void *)(a1 + 8), (uint64_t)&v6);
  if (__p[1])
  {
    *(void **)&__int128 v9 = __p[1];
    operator delete(__p[1]);
  }

  if (v7[0])
  {
    v7[1] = v7[0];
    operator delete(v7[0]);
  }

  if (v10)
  {
    uint64_t v11 = v10;
    operator delete(v10);
  }

void sub_76F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11 = *(void **)(v9 - 40);
  if (v11)
  {
    *(void *)(v9 - 32) = v11;
    operator delete(v11);
  }

  _Unwind_Resume(a1);
}

BOOL BTInterestMgr::_IsDeviceRetained(BTInterestMgr *this, void *a2)
{
  int v4 = (pthread_mutex_t *)((char *)this + 24);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 24));
  int v5 = (void **)*((void *)this + 11);
  __int128 v6 = (void **)*((void *)this + 12);
  if (v5 != v6)
  {
    while (*v5 != a2)
    {
      if (++v5 == v6)
      {
        int v5 = (void **)*((void *)this + 12);
        break;
      }
    }
  }

  BOOL v7 = v5 != v6;
  pthread_mutex_unlock(v4);
  return v7;
}

uint64_t BTInterestMgr::_RetryConnection(BTInterestMgr *this, void *a2)
{
  uint64_t v19 = a2;
  int v3 = (pthread_mutex_t *)((char *)this + 24);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 24));
  unint64_t v4 = *((void *)this + 18);
  uint64_t v5 = *((void *)this + 15);
  __int128 v6 = (void *)(v5 + 8 * (v4 >> 9));
  if (*((void *)this + 16) == v5)
  {
    BOOL v7 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v9 = (void **)(v5 + 8 * ((*((void *)this + 19) + v4) >> 9));
  }

  else
  {
    BOOL v7 = (void *)(*v6 + 8 * (*((void *)this + 18) & 0x1FFLL));
    unint64_t v8 = *((void *)this + 19) + v4;
    uint64_t v9 = (void **)(v5 + 8 * (v8 >> 9));
    uint64_t v10 = &(*v9)[v8 & 0x1FF];
  }

  LOBYTE(buf.version) = 0;
  sub_7D84(v6, v7, v9, v10, &v19);
  uint64_t v12 = *((void *)this + 15);
  if (*((void *)this + 16) == v12)
  {
    uint64_t v14 = 0LL;
  }

  else
  {
    unint64_t v13 = *((void *)this + 19) + *((void *)this + 18);
    uint64_t v14 = *(void *)(v12 + ((v13 >> 6) & 0x3FFFFFFFFFFFFF8LL)) + 8 * (v13 & 0x1FF);
  }

  if (v14 == v11)
  {
    if (BTInterestMgr::_ShouldRetry(this, v19))
    {
      sub_7B5C((void *)this + 14, &v19);
      buf.version = 0LL;
      memset(&buf.retain, 0, 24);
      buf.info = this;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      unsigned int v16 = CFRunLoopTimerCreate( 0LL,  Current + 5.0,  0.0,  0LL,  0LL,  (CFRunLoopTimerCallBack)_RetryConnectionEventTimerCallback,  &buf);
      BOOL v17 = CFRunLoopGetCurrent();
      CFRunLoopAddTimer(v17, v16, kCFRunLoopCommonModes);
      CFRelease(v16);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t v20 = 134217984;
        uint64_t v21 = v19;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Retrying connection to device %p in 5 seconds...\n",  v20,  0xCu);
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf.version) = 134217984;
    *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v19;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Already have pending retry attempt for device %p\n",  (uint8_t *)&buf,  0xCu);
  }

  return pthread_mutex_unlock(v3);
}

BOOL BTInterestMgr::_ShouldRetry(BTInterestMgr *this, void *a2)
{
  if ((BTD2DPlugin::_ResolvingServiceForDevice(*((BTBrowseMgr ***)this + 1), (unint64_t)a2) & 1) != 0)
  {
    uint64_t v8 = 0LL;
    __chkstk_darwin();
    unint64_t v4 = (void **)v7;
    bzero(v7, 0x800uLL);
    uint64_t v6 = v8;
    if (!v8)
    {
      return 1LL;
    }

    else
    {
      while (*v4 != a2)
      {
        ++v4;
        if (!--v6) {
          return 1LL;
        }
      }

      BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
      if (result)
      {
        *(_DWORD *)CFRunLoopTimerContext buf = 134217984;
        uint64_t v10 = a2;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Already connected to device %p\n",  buf,  0xCu);
        return 0LL;
      }
    }
  }

  else
  {
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
    if (result)
    {
      *(_DWORD *)CFRunLoopTimerContext buf = 134217984;
      uint64_t v10 = a2;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "No longer resolving anything for device %p\n",  buf,  0xCu);
      return 0LL;
    }
  }

  return result;
}

void sub_7B5C(void *a1, void *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  if (v4 == v5) {
    uint64_t v6 = 0LL;
  }
  else {
    uint64_t v6 = ((v4 - v5) << 6) - 1;
  }
  uint64_t v7 = a1[5];
  unint64_t v8 = v7 + a1[4];
  if (v6 == v8)
  {
    sub_7EC4(a1);
    uint64_t v5 = a1[1];
    uint64_t v7 = a1[5];
    unint64_t v8 = a1[4] + v7;
  }

  *(void *)(*(void *)(v5 + ((v8 >> 6) & 0x3FFFFFFFFFFFFF8LL)) + 8 * (v8 & 0x1FF)) = *a2;
  a1[5] = v7 + 1;
}

uint64_t _RetryConnectionEventTimerCallback(__CFRunLoopTimer *a1, BTInterestMgr *this)
{
  return BTInterestMgr::_RetryConnectionEvent(this);
}

uint64_t BTInterestMgr::_RetryConnectionEvent(BTInterestMgr *this)
{
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 24);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 24));
  uint64_t v3 = *((void *)this + 19);
  if (!v3) {
    return pthread_mutex_unlock(v2);
  }
  ++*((void *)this + 18);
  *((void *)this + 19) = v3 - 1;
  sub_8634((uint64_t)this + 112, 1);
  if (BTInterestMgr::_ShouldRetry(this, v4))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v6 = 134217984;
      uint64_t v7 = v4;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Attempting to reconnect to device %p\n",  (uint8_t *)&v6,  0xCu);
    }

    BTDeviceConnectServices(v4, 2048LL);
    return pthread_mutex_unlock(v2);
  }

  return pthread_mutex_unlock(v2);
}

void sub_7D28()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void *sub_7D50(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_7D28();
  }
  return operator new(8 * a2);
}

void *sub_7D84(void *result, void *a2, void **a3, void *a4, void *a5)
{
  if (result == a3)
  {
    if (a2 != a4)
    {
      while (*a2 != *a5)
      {
        if (++a2 == a4)
        {
          a2 = a4;
          break;
        }
      }
    }

    if (result && (void *)(*result + 4096LL) == a2) {
      ++result;
    }
  }

  else
  {
    uint64_t v5 = *result + 4096LL;
    if ((void *)v5 == a2) {
      goto LABEL_14;
    }
    while (*a2 != *a5)
    {
      if (++a2 == (void *)v5) {
        goto LABEL_14;
      }
    }

    if (a2 == (void *)v5)
    {
LABEL_14:
      int v6 = result + 1;
      if (result + 1 == a3)
      {
        unint64_t v8 = result;
      }

      else
      {
        do
        {
          uint64_t v7 = 0LL;
          unint64_t v8 = v6;
          uint64_t v9 = *v6;
          do
          {
            if (*(void *)(v9 + v7) == *a5) {
              return v8;
            }
            v7 += 8LL;
          }

          while (v7 != 4096);
          int v6 = v8 + 1;
        }

        while (v8 + 1 != a3);
      }

      if (*a3 == a4)
      {
        return a3;
      }

      else
      {
        uint64_t v10 = *a3;
        while (*v10 != *a5)
        {
          if (++v10 == a4)
          {
            uint64_t v10 = a4;
            break;
          }
        }

        BOOL result = a3;
        if (*a3 + 512 == v10) {
          return v8 + 2;
        }
      }
    }
  }

  return result;
}

void sub_7EC4(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x200;
  unint64_t v4 = v2 - 512;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    int v6 = (char *)a1[3];
    a1[4] = v4;
    uint64_t v7 = (void *)a1[1];
    unint64_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    uint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)unint64_t v8 = v10;
      a1[2] += 8LL;
      return;
    }

    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      v34 = (char *)sub_7D50(v5, v33);
      int v35 = &v34[8 * (v33 >> 2)];
      uint64_t v37 = &v34[8 * v36];
      uint64_t v38 = (uint64_t *)a1[1];
      unint64_t v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        unint64_t v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v40 = 8 * (v39 >> 3);
        std::string::size_type v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)std::string::size_type v41 = v42;
          v41 += 8;
          v40 -= 8LL;
        }

        while (v40);
      }

      goto LABEL_30;
    }

LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    uint64_t v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      uint64_t v9 = (char *)a1[1];
    }

    unint64_t v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }

  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&__int128 v54 = operator new(0x1000uLL);
      sub_81D8(a1, &v54);
      return;
    }

    *(void *)&__int128 v54 = operator new(0x1000uLL);
    sub_82EC((uint64_t)a1, &v54);
    v44 = (void *)a1[1];
    unint64_t v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    uint64_t v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      v34 = (char *)sub_7D50((uint64_t)(a1 + 3), v46);
      int v35 = &v34[8 * (v46 >> 2)];
      uint64_t v37 = &v34[8 * v47];
      __int128 v48 = (uint64_t *)a1[1];
      unint64_t v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        unint64_t v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)v51 = v52;
          v51 += 8;
          v50 -= 8LL;
        }

        while (v50);
      }

LABEL_30:
      v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        unint64_t v8 = (char *)a1[2];
      }

      goto LABEL_33;
    }

    goto LABEL_5;
  }

  if (v23 == *a1) {
    unint64_t v25 = 1LL;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  v56 = a1 + 3;
  *(void *)&__int128 v54 = sub_7D50((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&__int128 v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0x1000uLL);
  sub_8408(&v54, &v53);
  int v27 = (void *)a1[2];
  uint64_t v28 = -7LL - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8LL;
    sub_851C((uint64_t)&v54, v27);
  }

  uint64_t v29 = (char *)*a1;
  __int128 v30 = v54;
  __int128 v31 = v55;
  *(void *)&__int128 v54 = *a1;
  *((void *)&v54 + 1) = v27;
  __int128 v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  __int128 v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&__int128 v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8LL);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_818C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_81D8(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  int v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    uint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      uint64_t v19 = (char *)sub_7D50(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      unint64_t v22 = (uint64_t *)a1[1];
      int v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        int v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
          v25 += 8;
          v24 -= 8LL;
        }

        while (v24);
      }

      int v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        int v6 = (char *)a1[2];
      }
    }

    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        int v6 = (char *)a1[1];
      }

      uint64_t v17 = &v6[8 * v13];
      int v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }

  *(void *)int v6 = *a2;
  a1[2] += 8LL;
}

void sub_82EC(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    uint64_t v7 = *(_BYTE **)(a1 + 24);
    uint64_t v8 = *(_BYTE **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1LL;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      uint64_t v14 = (char *)sub_7D50(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8LL];
      int64_t v16 = *(uint64_t **)(a1 + 8);
      uint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        uint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8LL;
        }

        while (v19);
      }

      unint64_t v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }

    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      uint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }

      *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }

  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }

  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8LL;
}

void sub_8408(void *a1, void *a2)
{
  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      else {
        unint64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      uint64_t v17 = (char *)sub_7D50(a1[4], v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8LL;
        }

        while (v22);
      }

      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }

    else
    {
      uint64_t v7 = v6 >> 3;
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      int64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }

      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }

  *(void *)uint64_t v4 = *a2;
  a1[2] += 8LL;
}

void sub_851C(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(_BYTE **)(a1 + 16);
    uint64_t v7 = *(_BYTE **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        unint64_t v11 = 1LL;
      }
      else {
        unint64_t v11 = (v7 - v4) >> 2;
      }
      uint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)sub_7D50(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8LL];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      unint64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        unint64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8LL;
        }

        while (v18);
      }

      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }

    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }

      *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }

  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }

  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8LL;
}

uint64_t sub_8634(uint64_t a1, int a2)
{
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 < 0x200) {
    a2 = 1;
  }
  if (v2 < 0x400) {
    int v4 = a2;
  }
  else {
    int v4 = 0;
  }
  if ((v4 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(void *)(a1 + 8) += 8LL;
    *(void *)(a1 + 32) -= 512LL;
  }

  return v4 ^ 1u;
}

uint64_t BTD2D_initialize( __CFRunLoop *a1, void (*a2)(unsigned int, unsigned int, void *, unsigned int, const unsigned __int8 *, unint64_t, const unsigned __int8 *, unint64_t, void *), void *a3)
{
  uint64_t v6 = sub_8CC0();
  v6[160] = 0;
  *((void *)v6 + 6) = a1;
  *((void *)v6 + 7) = a2;
  *((void *)v6 + std::ostream::~ostream(v2, v3 + 8) = a3;
  return BTD2DPlugin::Attach((BTD2DPlugin *)v6);
}

uint64_t BTD2D_terminate(void)
{
  v0 = (BTD2DPlugin *)sub_8CC0();
  return BTD2DPlugin::Terminate(v0);
}

uint64_t BTD2D_startAdvertisingPair(const __CFData *a1, const __CFData *a2)
{
  BytePtr = (char *)CFDataGetBytePtr(a1);
  uint64_t v5 = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  unint64_t v16 = 0LL;
  sub_9BF8((char *)&v16, BytePtr, (char *)&v5[Length], &v5[Length] - (const UInt8 *)BytePtr);
  uint64_t v7 = (char *)CFDataGetBytePtr(a2);
  uint64_t v8 = CFDataGetBytePtr(a2);
  CFIndex v9 = CFDataGetLength(a2);
  std::stringbuf::string_type __p = 0LL;
  uint64_t v14 = 0LL;
  uint64_t v15 = 0LL;
  sub_9BF8((char *)&__p, v7, (char *)&v8[v9], &v8[v9] - (const UInt8 *)v7);
  uint64_t v10 = sub_8CC0();
  uint64_t v11 = BTAdvertiseMgr::Advertise(v10[4], (char **)&v16, (char **)&__p);
  if (__p)
  {
    uint64_t v14 = __p;
    operator delete(__p);
  }

  if (v16)
  {
    uint64_t v17 = v16;
    operator delete(v16);
  }

  return v11;
}

void sub_87C0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BTD2D_stopAdvertisingPair(const __CFData *a1, const __CFData *a2)
{
  BytePtr = (char *)CFDataGetBytePtr(a1);
  uint64_t v5 = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  unint64_t v16 = 0LL;
  sub_9BF8((char *)&v16, BytePtr, (char *)&v5[Length], &v5[Length] - (const UInt8 *)BytePtr);
  uint64_t v7 = (char *)CFDataGetBytePtr(a2);
  uint64_t v8 = CFDataGetBytePtr(a2);
  CFIndex v9 = CFDataGetLength(a2);
  std::stringbuf::string_type __p = 0LL;
  uint64_t v14 = 0LL;
  uint64_t v15 = 0LL;
  sub_9BF8((char *)&__p, v7, (char *)&v8[v9], &v8[v9] - (const UInt8 *)v7);
  uint64_t v10 = sub_8CC0();
  uint64_t v11 = BTAdvertiseMgr::StopAdvertising(v10[4], (char **)&v16, (char **)&__p);
  if (__p)
  {
    uint64_t v14 = __p;
    operator delete(__p);
  }

  if (v16)
  {
    uint64_t v17 = v16;
    operator delete(v16);
  }

  return v11;
}

void sub_88D4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BTD2D_startBrowsingForKey(const __CFData *a1)
{
  BytePtr = (char *)CFDataGetBytePtr(a1);
  BOOL v3 = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  CFIndex v9 = 0LL;
  uint64_t v10 = 0LL;
  std::stringbuf::string_type __p = 0LL;
  sub_9BF8((char *)&__p, BytePtr, (char *)&v3[Length], &v3[Length] - (const UInt8 *)BytePtr);
  uint64_t v5 = sub_8CC0();
  uint64_t v6 = BTBrowseMgr::Browse(v5[3], (unsigned __int8 **)&__p);
  if (__p)
  {
    CFIndex v9 = __p;
    operator delete(__p);
  }

  return v6;
}

void sub_8994( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BTD2D_stopBrowsingForKey(const __CFData *a1)
{
  BytePtr = (char *)CFDataGetBytePtr(a1);
  BOOL v3 = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  CFIndex v9 = 0LL;
  uint64_t v10 = 0LL;
  std::stringbuf::string_type __p = 0LL;
  sub_9BF8((char *)&__p, BytePtr, (char *)&v3[Length], &v3[Length] - (const UInt8 *)BytePtr);
  uint64_t v5 = sub_8CC0();
  uint64_t v6 = BTBrowseMgr::StopBrowsing(v5[3], (unsigned __int8 **)&__p);
  if (__p)
  {
    CFIndex v9 = __p;
    operator delete(__p);
  }

  return v6;
}

void sub_8A3C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void BTD2D_startResolvingPair(const __CFData *a1, const __CFData *a2)
{
  BytePtr = (char *)CFDataGetBytePtr(a1);
  uint64_t v5 = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  uint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v14 = 0LL;
  sub_9BF8((char *)&v14, BytePtr, (char *)&v5[Length], &v5[Length] - (const UInt8 *)BytePtr);
  uint64_t v7 = (char *)CFDataGetBytePtr(a2);
  uint64_t v8 = CFDataGetBytePtr(a2);
  CFIndex v9 = CFDataGetLength(a2);
  std::stringbuf::string_type __p = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  sub_9BF8((char *)&__p, v7, (char *)&v8[v9], &v8[v9] - (const UInt8 *)v7);
  uint64_t v10 = sub_8CC0();
  BTBrowseMgr::StartResolving(v10[3], (unsigned __int8 **)&v14, (unsigned __int8 **)&__p);
  if (__p)
  {
    uint64_t v12 = __p;
    operator delete(__p);
  }

  if (v14)
  {
    uint64_t v15 = v14;
    operator delete(v14);
  }

void sub_8B30( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

void BTD2D_stopResolvingPair(const __CFData *a1, const __CFData *a2)
{
  BytePtr = (char *)CFDataGetBytePtr(a1);
  uint64_t v5 = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  uint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v14 = 0LL;
  sub_9BF8((char *)&v14, BytePtr, (char *)&v5[Length], &v5[Length] - (const UInt8 *)BytePtr);
  uint64_t v7 = (char *)CFDataGetBytePtr(a2);
  uint64_t v8 = CFDataGetBytePtr(a2);
  CFIndex v9 = CFDataGetLength(a2);
  std::stringbuf::string_type __p = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  sub_9BF8((char *)&__p, v7, (char *)&v8[v9], &v8[v9] - (const UInt8 *)v7);
  uint64_t v10 = sub_8CC0();
  BTBrowseMgr::StopResolving(v10[3], (unsigned __int8 **)&v14, (unsigned __int8 **)&__p);
  if (__p)
  {
    uint64_t v12 = __p;
    operator delete(__p);
  }

  if (v14)
  {
    uint64_t v15 = v14;
    operator delete(v14);
  }

void sub_8C3C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BTD2D_retain(void **a1)
{
  unint64_t v2 = (BTInterestMgr **)sub_8CC0();
  return BTInterestMgr::Retain(v2[5], a1);
}

uint64_t BTD2D_release(void **a1)
{
  unint64_t v2 = (BTInterestMgr **)sub_8CC0();
  return BTInterestMgr::Release(v2[5], a1);
}

void *sub_8CC0()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_100A8);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_100A8))
  {
    BTD2DPlugin::BTD2DPlugin((BTD2DPlugin *)&unk_10000);
    __cxa_atexit((void (*)(void *))BTD2DPlugin::~BTD2DPlugin, &unk_10000, &dword_0);
    __cxa_guard_release(&qword_100A8);
  }

  return &unk_10000;
}

void sub_8D38(_Unwind_Exception *a1)
{
}

uint64_t BTD2DPlugin::Initialize( BTD2DPlugin *this, __CFRunLoop *a2, void (*a3)(unsigned int, unsigned int, void *, unsigned int, const unsigned __int8 *, unint64_t, const unsigned __int8 *, unint64_t, void *), void *a4)
{
  *((_BYTE *)this + 160) = 0;
  *((void *)this + 6) = a2;
  *((void *)this + 7) = a3;
  *((void *)this + std::ostream::~ostream(v2, v3 + 8) = a4;
  return BTD2DPlugin::Attach(this);
}

uint64_t BTD2DPlugin::Terminate(BTD2DPlugin *this)
{
  *((_BYTE *)this + 160) = 1;
  if (!*(void *)this) {
    return 0LL;
  }
  uint64_t result = BTSessionDetachWithQueue(this);
  if ((_DWORD)result)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_A37C();
    }
    return 1LL;
  }

  return result;
}

uint64_t BTD2DPlugin::StartAdvertising(uint64_t a1, char **a2, char **a3)
{
  return BTAdvertiseMgr::Advertise(*(void *)(a1 + 32), a2, a3);
}

uint64_t BTD2DPlugin::StopAdvertising(uint64_t a1, char **a2, char **a3)
{
  return BTAdvertiseMgr::StopAdvertising(*(void *)(a1 + 32), a2, a3);
}

uint64_t BTD2DPlugin::StartBrowsing(uint64_t a1, unsigned __int8 **a2)
{
  return BTBrowseMgr::Browse(*(void *)(a1 + 24), a2);
}

uint64_t BTD2DPlugin::StopBrowsing(uint64_t a1, unsigned __int8 **a2)
{
  return BTBrowseMgr::StopBrowsing(*(void *)(a1 + 24), a2);
}

uint64_t BTD2DPlugin::StartResolving(uint64_t a1, unsigned __int8 **a2, unsigned __int8 **a3)
{
  return BTBrowseMgr::StartResolving(*(void *)(a1 + 24), a2, a3);
}

uint64_t BTD2DPlugin::StopResolving(uint64_t a1, unsigned __int8 **a2, unsigned __int8 **a3)
{
  return BTBrowseMgr::StopResolving(*(void *)(a1 + 24), a2, a3);
}

uint64_t BTD2DPlugin::Retain(BTInterestMgr **this, void *a2)
{
  return BTInterestMgr::Retain(this[5], a2);
}

uint64_t BTD2DPlugin::Release(BTInterestMgr **this, void *a2)
{
  return BTInterestMgr::Release(this[5], a2);
}

void BTD2DPlugin::BTD2DPlugin(BTD2DPlugin *this)
{
  *((void *)this + 17) = (char *)this + 136;
  *((void *)this + 1std::ostream::~ostream(v2, v3 + 8) = (char *)this + 136;
  *((void *)this + 19) = 0LL;
  *(void *)this = 0LL;
  *((void *)this + 1) = 0LL;
  unint64_t v2 = operator new(0xB0uLL);
  sub_9670((uint64_t)v2, (uint64_t)this);
  *((void *)this + 3) = v2;
  BOOL v3 = operator new(0x30uLL);
  v3[16] = 0;
  *(void *)BOOL v3 = &off_C308;
  *((void *)v3 + 1) = this;
  *((void *)v3 + 5) = 0LL;
  *((void *)v3 + 4) = 0LL;
  *((void *)v3 + 3) = v3 + 32;
  *((void *)this + 4) = v3;
  int v4 = operator new(0xA0uLL);
  sub_978C((uint64_t)v4, (uint64_t)this);
  *((void *)this + 5) = v4;
  *((void *)this + 6) = 0LL;
  *((void *)this + 7) = 0LL;
  *((void *)this + std::ostream::~ostream(v2, v3 + 8) = 0LL;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 72), 0LL);
  *((_BYTE *)this + 160) = 0;
}

void sub_8EAC(_Unwind_Exception *a1)
{
}

void BTD2DPlugin::~BTD2DPlugin(BTD2DPlugin *this)
{
  unint64_t v2 = (void *)*((void *)this + 3);
  if (v2)
  {
    sub_9A10(*((void *)this + 3));
    operator delete(v2);
  }

  BOOL v3 = (void **)*((void *)this + 4);
  if (v3)
  {
    _BYTE *v3 = &off_C308;
    sub_9A98((uint64_t)(v3 + 3), v3[4]);
    operator delete(v3);
  }

  int v4 = (void *)*((void *)this + 5);
  if (v4)
  {
    sub_9AEC(*((void *)this + 5));
    operator delete(v4);
  }

  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 72));
  sub_9958((uint64_t *)this + 17);
}

void sub_8F64(_Unwind_Exception *a1)
{
  BOOL v3 = v2;
  operator delete(v3);
  sub_9958((uint64_t *)(v1 + 136));
  _Unwind_Resume(a1);
}

uint64_t BTD2DPlugin::Attach(BTD2DPlugin *this)
{
  if (*((_BYTE *)this + 160)) {
    return 1LL;
  }
  uint64_t v5 = _btSessionEventCallback;
  *(_OWORD *)__str = 0u;
  __int128 v7 = 0u;
  pid_t v2 = getpid();
  snprintf(__str, 0x20uLL, "DeviceToDevice-%u", v2);
  BOOL v3 = (__CFRunLoop *)*((void *)this + 6);
  if (v3 != CFRunLoopGetMain()) {
    sub_A44C();
  }
  uint64_t result = BTSessionAttachWithQueue(__str, &v5, this, &_dispatch_main_q);
  if ((_DWORD)result)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_A3E4();
    }
    return 1LL;
  }

  return result;
}

void _btSessionEventCallback(uint64_t a1, int a2, int a3, BTD2DPlugin *this)
{
  if (a3 | a2)
  {
    *(void *)this = 0LL;
    *((void *)this + 1) = 0LL;
    BTD2DPlugin::BluetoothStatusChanged((uint64_t)this, 0);
    if (a2 != 1 || a3) {
      _btReattach(this);
    }
    return;
  }

  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v12 = _btLocalDeviceCallback;
  *(void *)this = a1;
  if (BTLocalDeviceGetDefault())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_A584();
    }
LABEL_14:
    BTD2DPlugin::Cleanup(this);
    BTD2DPlugin::BluetoothStatusChanged((uint64_t)this, 0);
    _btReattach(this);
    return;
  }

  *((void *)this + 1) = v11;
  if (BTLocalDeviceAddCallbacks())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_A51C();
    }
    goto LABEL_14;
  }

  int v10 = -1;
  if (BTLocalDeviceSupportsService(v11, 2048LL, &v10))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_A4B4();
    }
    goto LABEL_14;
  }

  if (v10)
  {
    int v9 = -1;
    BTLocalDeviceGetModulePower(v11, 1LL, &v9);
    BOOL v7 = v9 == -1;
    uint64_t v8 = this;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_A474();
    }
    BTD2DPlugin::Cleanup(this);
    uint64_t v8 = this;
    BOOL v7 = 0;
  }

  BTD2DPlugin::BluetoothStatusChanged((uint64_t)v8, v7);
}

uint64_t BTD2DPlugin::BluetoothStatusChanged(uint64_t this, int a2)
{
  if (*(unsigned __int8 *)(this + 16) != a2)
  {
    uint64_t v2 = this;
    *(_BYTE *)(this + 16) = a2;
    (***(void (****)(void))(this + 24))(*(void *)(this + 24));
    (***(void (****)(void, void))(v2 + 32))(*(void *)(v2 + 32), *(unsigned __int8 *)(v2 + 16));
    return (***(uint64_t (****)(void, void))(v2 + 40))( *(void *)(v2 + 40),  *(unsigned __int8 *)(v2 + 16));
  }

  return this;
}

uint64_t BTD2DPlugin::Cleanup(BTD2DPlugin *this)
{
  v3[1] = 0LL;
  v3[2] = 0LL;
  v3[0] = _btLocalDeviceCallback;
  uint64_t result = *((void *)this + 1);
  if (result)
  {
    uint64_t result = BTLocalDeviceRemoveCallbacks(result, v3);
    *((void *)this + 1) = 0LL;
  }

  if (*(void *)this)
  {
    uint64_t result = BTSessionDetachWithQueue(this);
    *(void *)this = 0LL;
  }

  return result;
}

void _btLocalDeviceCallback(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if (!a2)
  {
    uint64_t v8 = v4;
    uint64_t v9 = v5;
    int v7 = -1;
    if (BTLocalDeviceGetModulePower(a1, 1LL, &v7))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_A5EC();
      }
    }

    else
    {
      BTD2DPlugin::BluetoothStatusChanged(a4, v7 == -1);
    }
  }

void _ReportServiceEventTimerCallback(__CFRunLoopTimer *a1, BTD2DPlugin *this)
{
}

void BTD2DPlugin::_ReportServiceEvent(BTD2DPlugin *this)
{
  if (*((void *)this + 7))
  {
    uint64_t v2 = (pthread_mutex_t *)((char *)this + 72);
    pthread_mutex_lock((pthread_mutex_t *)((char *)this + 72));
    *(_OWORD *)std::stringbuf::string_type __p = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    *(_OWORD *)int v10 = 0u;
    sub_9B68((uint64_t)&v9, *((void *)this + 18) + 16LL);
    sub_95A0((uint64_t)this + 136);
    pthread_mutex_unlock(v2);
    BOOL v3 = v10[0];
    uint64_t v4 = __p[1];
    uint64_t v5 = (_BYTE *)v12;
    size_t v6 = (char *)v10[1] - (char *)v10[0];
    if (v10[1] == v10[0])
    {
      int v7 = 0LL;
    }

    else
    {
      int v7 = operator new[]((char *)v10[1] - (char *)v10[0]);
      memmove(v7, v3, v6);
    }

    if (v5 == v4)
    {
      uint64_t v8 = 0LL;
    }

    else
    {
      uint64_t v8 = operator new[](v5 - v4);
      memmove(v8, v4, v5 - v4);
    }

    (*((void (**)(void, void, void, void, void *, size_t, void *, int64_t, void))this + 7))( v9,  DWORD1(v9),  *((void *)&v9 + 1),  0LL,  v7,  v6,  v8,  v5 - v4,  *((void *)this + 8));
    if (v7) {
      operator delete[](v7);
    }
    if (v8) {
      operator delete[](v8);
    }
    if (__p[1])
    {
      *(void **)&__int128 v12 = __p[1];
      operator delete(__p[1]);
    }

    if (v10[0])
    {
      v10[1] = v10[0];
      operator delete(v10[0]);
    }
  }

void sub_94B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void BTD2DPlugin::_QueueServiceEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 72);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 72));
  uint64_t v5 = sub_9C68(a1 + 136, 0LL, 0LL, a2);
  v5[1] = a1 + 136;
  uint64_t v6 = *(void *)(a1 + 136);
  *uint64_t v5 = v6;
  *(void *)(v6 + std::ostream::~ostream(v2, v3 + 8) = v5;
  *(void *)(a1 + 136) = v5;
  ++*(void *)(a1 + 152);
  pthread_mutex_unlock(v4);
  v8.version = 0LL;
  memset(&v8.retain, 0, 24);
  v8.info = (void *)a1;
  int v7 = CFRunLoopTimerCreate(0LL, 0.0, 0.0, 0LL, 0LL, (CFRunLoopTimerCallBack)_ReportServiceEventTimerCallback, &v8);
  CFRunLoopAddTimer(*(CFRunLoopRef *)(a1 + 48), v7, kCFRunLoopCommonModes);
  CFRelease(v7);
}

void sub_95A0(uint64_t a1)
{
  uint64_t v2 = *(uint64_t **)(a1 + 8);
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v3 = *v2;
  *(void *)(v3 + std::ostream::~ostream(v2, v3 + 8) = v2[1];
  *(void *)v2[1] = v3;
  *(void *)(a1 + 16) = v1 - 1;
  sub_99CC(v2 + 2);
  operator delete(v2);
}

uint64_t BTD2DPlugin::_ResolvingServiceForDevice(BTBrowseMgr **this, unint64_t a2)
{
  return BTBrowseMgr::_ResolvingServiceForDevice(this[3], a2);
}

uint64_t BTTaskMgr::BluetoothAvailabilityChanged(uint64_t this, char a2)
{
  *(_BYTE *)(this + 16) = a2;
  return this;
}

void _btReattach(BTD2DPlugin *a1)
{
  dispatch_time_t v2 = dispatch_time(0LL, 10000000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_9668;
  block[3] = &unk_C428;
  block[4] = a1;
  dispatch_after(v2, &_dispatch_main_q, block);
}

uint64_t sub_9668(uint64_t a1)
{
  return BTD2DPlugin::Attach(*(BTD2DPlugin **)(a1 + 32));
}

uint64_t sub_9670(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a1 + 16) = 0;
  *(void *)a1 = &off_C368;
  *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = a2;
  *(void *)(a1 + 96) = 0LL;
  *(void *)(a1 + 8std::ostream::~ostream(v2, v3 + 8) = a1 + 96;
  *(void *)(a1 + 120) = 0LL;
  *(void *)(a1 + std::ios::~ios(v1 + 112) = a1 + 120;
  *(void *)(a1 + 104) = 0LL;
  *(void *)(a1 + 12std::ostream::~ostream(v2, v3 + 8) = 0LL;
  *(void *)(a1 + 144) = 0LL;
  *(void *)(a1 + 136) = a1 + 144;
  *(void *)(a1 + 152) = 0LL;
  *(void *)(a1 + 160) = 0LL;
  *(_DWORD *)(a1 + 16std::ostream::~ostream(v2, v3 + 8) = 0;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 24), 0LL);
  return a1;
}

void sub_9708(_Unwind_Exception *a1)
{
}

void sub_9738(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_9738(a1, *a2);
    sub_9738(a1, a2[1]);
    sub_68F4((uint64_t)(a2 + 4));
    operator delete(a2);
  }

uint64_t sub_978C(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a1 + 16) = 0;
  *(_OWORD *)(a1 + 8std::ostream::~ostream(v2, v3 + 8) = 0u;
  *(void *)a1 = &off_C3A8;
  *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = a2;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(void *)(a1 + 152) = 0LL;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 24), 0LL);
  return a1;
}

void sub_97EC(_Unwind_Exception *a1)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 96) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_9814(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8LL);
  }
  uint64_t v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_9860(void *a1)
{
  uint64_t v2 = (void **)a1[1];
  uint64_t v3 = (void **)a1[2];
  unint64_t v4 = (char *)v3 - (char *)v2;
  if (v3 == v2)
  {
    uint64_t v5 = a1 + 5;
  }

  else
  {
    uint64_t v5 = a1 + 5;
    unint64_t v6 = a1[4];
    int v7 = &v2[v6 >> 9];
    uint64_t v8 = (uint64_t)*v7;
    uint64_t v9 = (uint64_t)*v7 + 8 * (v6 & 0x1FF);
    while ((void *)v9 != *(char **)((char *)v2 + (((a1[5] + v6) >> 6) & 0x3FFFFFFFFFFFFF8LL))
                        + 8 * ((a1[5] + v6) & 0x1FF))
    {
      v9 += 8LL;
      if (v9 - v8 == 4096)
      {
        uint64_t v10 = (uint64_t)v7[1];
        ++v7;
        uint64_t v8 = v10;
        uint64_t v9 = v10;
      }
    }
  }

  *uint64_t v5 = 0LL;
  if (v4 >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = (void **)a1[2];
      uint64_t v2 = (void **)(a1[1] + 8LL);
      a1[1] = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }

    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }

  unint64_t v11 = v4 >> 3;
  if (v11 == 1)
  {
    uint64_t v12 = 256LL;
  }

  else
  {
    if (v11 != 2) {
      goto LABEL_15;
    }
    uint64_t v12 = 512LL;
  }

  a1[4] = v12;
LABEL_15:
  while (v2 != v3)
  {
    uint64_t v13 = *v2++;
    operator delete(v13);
  }

  return sub_9814((uint64_t)a1);
}

void sub_9958(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v2 = *a1;
    uint64_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + std::ostream::~ostream(v2, v3 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + std::ostream::~ostream(v2, v3 + 8) = v4;
    a1[2] = 0LL;
    if (v3 != a1)
    {
      do
      {
        uint64_t v5 = (uint64_t *)v3[1];
        sub_99CC(v3 + 2);
        operator delete(v3);
        uint64_t v3 = v5;
      }

      while (v5 != a1);
    }
  }

void sub_99CC(void *a1)
{
  uint64_t v2 = (void *)a1[5];
  if (v2)
  {
    a1[6] = v2;
    operator delete(v2);
  }

  uint64_t v3 = (void *)a1[2];
  if (v3)
  {
    a1[3] = v3;
    operator delete(v3);
  }

uint64_t sub_9A10(uint64_t a1)
{
  *(void *)a1 = &off_C368;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 24));
  sub_61C8(a1 + 136, *(void **)(a1 + 144));
  sub_9738(a1 + 112, *(void **)(a1 + 120));
  sub_6214(a1 + 88, *(void **)(a1 + 96));
  return a1;
}

void sub_9A68(_Unwind_Exception *a1)
{
}

void sub_9A98(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_9A98(a1, *a2);
    sub_9A98(a1, a2[1]);
    sub_2ACC((uint64_t)(a2 + 4));
    operator delete(a2);
  }

uint64_t sub_9AEC(uint64_t a1)
{
  *(void *)a1 = &off_C3A8;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 24));
  sub_9860((void *)(a1 + 112));
  uint64_t v2 = *(void **)(a1 + 88);
  if (v2)
  {
    *(void *)(a1 + 96) = v2;
    operator delete(v2);
  }

  return a1;
}

void sub_9B38(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)(v1 + 88);
  if (v3)
  {
    *(void *)(v1 + 96) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

uint64_t sub_9B68(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = 0LL;
  sub_24FC((char *)(a1 + 16), *(char **)(a2 + 16), *(char **)(a2 + 24), *(void *)(a2 + 24) - *(void *)(a2 + 16));
  *(void *)(a1 + 40) = 0LL;
  *(void *)(a1 + 4std::ostream::~ostream(v2, v3 + 8) = 0LL;
  *(void *)(a1 + 56) = 0LL;
  sub_24FC((char *)(a1 + 40), *(char **)(a2 + 40), *(char **)(a2 + 48), *(void *)(a2 + 48) - *(void *)(a2 + 40));
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = *(void *)(a2 + 8);
  return a1;
}

void sub_9BDC(_Unwind_Exception *exception_object)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 24) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(exception_object);
}

char *sub_9BF8(char *result, char *a2, char *a3, size_t __sz)
{
  if (__sz)
  {
    unint64_t v6 = result;
    uint64_t result = sub_256C(result, __sz);
    int v7 = (_BYTE *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      char v8 = *a2++;
      *v7++ = v8;
    }

    *((void *)v6 + 1) = v7;
  }

  return result;
}

void sub_9C4C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + std::ostream::~ostream(v2, v3 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

void *sub_9C68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v7 = operator new(0x50uLL);
  *int v7 = a2;
  v7[1] = a3;
  sub_9B68((uint64_t)(v7 + 2), a4);
  return v7;
}

void sub_9CB0(_Unwind_Exception *a1)
{
}

void sub_9CC4()
{
}

void sub_9D2C()
{
}

void sub_9D94()
{
}

void sub_9DFC()
{
}

void sub_9E64()
{
}

void sub_9ECC()
{
}

void sub_9F34()
{
}

void sub_9F9C(uint8_t *a1, int a2, _DWORD *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a3 = a2;
  sub_7150( &dword_0,  (os_log_s *)&_os_log_default,  (uint64_t)a3,  "Call to BTDiscoveryAgentAddKey failed with error %d\n",  a1);
}

void sub_9FDC()
{
  sub_2FE8( &dword_0,  (os_log_s *)&_os_log_default,  v0,  "Call to BTDiscoveryAgentCreate failed with error %d - browsing will not return any results\n",  v1,  v2,  v3,  v4,  v5);
  sub_2FF8();
}

void sub_A044()
{
}

void sub_A0AC()
{
}

void sub_A114( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_A194( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_A210()
{
}

void sub_A278(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Call to BTServiceAddCallbacks failed with error %d - \n",  (uint8_t *)v1,  8u);
}

void sub_A2F4(uint64_t a1, int a2)
{
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Call to BTDeviceConnect on device %p failed with error %d\n",  (uint8_t *)&v2,  0x12u);
}

void sub_A37C()
{
}

void sub_A3E4()
{
}

void sub_A44C()
{
  __assert_rtn("Attach", "BTD2DPlugin.cpp", 142, "m_callbackRunLoop == CFRunLoopGetMain()");
}

void sub_A474()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Bluetooth transport is not supported\n",  v0,  2u);
  sub_2FF8();
}

void sub_A4B4()
{
}

void sub_A51C()
{
}

void sub_A584()
{
}

void sub_A5EC()
{
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}